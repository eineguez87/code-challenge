<?php

namespace App\Http\Controllers;

use App\User;
use http\Env\Response;
use Illuminate\Http\Request;

class UserController extends Controller
{
    

    public function authenticate(Request $request)
    {

        $this->validate($request, [
            'username' => 'required',
            'password' => 'required'
        ]);
        
        $user = app('db')->select("SELECT id, username, password, fails, last_login_attempt, TIMESTAMPDIFF(HOUR, last_login_attempt, NOW()) AS diff FROM customers WHERE username = :username LIMIT 1", 
            ['username'=>$request->input('username')]);
        
        $user = $user[0];
        //Hardcoded to 5 attempts and 5 hours.
        if ($user->fails >= 5 ) {
            if ($user->diff >= 5) {
                $update = app('db')->update("update customers SET last_login_attempt = NOW(), fails=0 WHERE id = :id LIMIT 1",
                    ["id"=>$user->id]);
            } else {
                $response = false;
                $message = 'Too Many Failed Attempts.';
                $status = 401;
                return response()->json(['success'=>$response, 'message'=>$message, 'user'=>$user], $status);
            }
        }
        
        $pass_match = password_verify($request->input('password'), $user->password);
        if ($pass_match) {
            $response = true;
            $message = 'Valid login.';
            $status = 201;
            $update = app('db')->update("update customers SET last_login_attempt = NOW(), fails=0 WHERE id = :id LIMIT 1",
                ["id"=>$user->id]);
        } else {
            $response = false;
            $message = 'Invalid username password combination.';
            $status = 401;
            $update = app('db')->update("update customers SET last_login_attempt = NOW(), fails=:fails WHERE id = :id LIMIT 1",
                ['fails'=>$user->fails + 1, "id"=>$user->id]);
        }
        
        $this->logRequest($request);
        
        return response()->json(['success'=>$response, 'message'=>$message], $status);
    }

    
    /*
     * Simple route to create a user.
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required'
        ]);

        $user = User::create($request->all());
        return response()->json($user, 201);
    }
    
    private function logRequest($request)
    {
        $ip = ($request->ip() == '::1') ? '127.0.0.1' : $request->ip();
        app('db')->insert("INSERT INTO login_activity (ip_address, username) VALUES (:ip, :username)", ["ip"=>$ip, "username"=>$request->input('username')]);
    }
}
