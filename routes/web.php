<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/account/verify/{token}', 'AuthController@verifyAccount')->name('user.verify');
Route::get('/reset-password/{token}', 'AuthController@resetPassword')->name('reset-password'); 
Route::post('/update-password', 'AuthController@updatePassword')->name('update-password');

Route::get('/{any}', function () {
    return view('welcome');
})->where('any', '.*');
