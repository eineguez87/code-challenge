<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    

    public function authenticate(Request $request)
    {

        $this->validate($request, [
            'username' => 'required',
            'password' => 'required'
        ]);

        $user = app('db')->select("SELECT username, password, fails, last_login_attempt FROM customers WHERE username = :username LIMIT 1", 
            ['username'=>$request->input('username')]);
        
        $user = $user[0];
        
        $pass_match = password_verify($request->input('password'), $user->password);
        if ($pass_match) {
            $response = true;
            $message = 'Valid login.';
            $status = 201;
            
        } else {
            $response = false;
            $message = 'Invalid username password combination.';
            $status = 401;
        }
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
}
