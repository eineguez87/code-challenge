<?php

/** @var \Laravel\Lumen\Routing\Router $router */

use Illuminate\Http\JsonResponse;

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function ()  {
    return view('login');
});


$router->get('/test', function () use ($router) {
    $results = app('db')->select("SELECT * FROM customers");
    
    return response()->json($results);
});




$router->group(['prefix' => '/user'], function () use ($router) {
    $router->post('login', ['uses' => 'UserController@authenticate']);
    $router->post('create', ['uses' => 'UserController@create']);
});
