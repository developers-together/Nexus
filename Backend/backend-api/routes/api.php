<?php

use App\Http\Controllers\mindmap_controller;
use App\Http\Controllers\UserController;
use Illuminate\Auth\Events\Authenticated;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register', [UserController::class, 'register']);
Route::post('login', [UserController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user-profile', [UserController::class, 'userProfile']);
    Route::post('update-profile', [UserController::class, 'updateProfile']);
    Route::get('user/{user_id}/index', [mindmap_controller::class,'index']) ;// add integrity later
    Route::get('/show/{id}', [mindmap_controller::class,'show']) ;
    Route::post('/store', [mindmap_controller::class,'store']) ;//add integrity later
    Route::patch('/edit', [mindmap_controller::class,'update']) ;
    Route::delete('/delete/{id}', [mindmap_controller::class,'destroy']) ;
    Route::post('logout', [UserController::class, 'logout']);
});





