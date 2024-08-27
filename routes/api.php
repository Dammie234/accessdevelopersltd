<?php

use App\Http\Controllers\HomeController;

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function () {

    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
});
Route::group([

    'middleware' => 'auth:api',
    'prefix' => 'access'

], function () {
    Route::get('/user/{id}', 'HomeController@user');
    Route::get('/companies', 'InvoiceController@companies');
    Route::get('/invoices', 'InvoiceController@index');
    Route::get('/few-invoices', 'InvoiceController@invoices');
    Route::get('/invoices/{id}', 'InvoiceController@show');

    Route::get('/organizations', 'OrganizationController@index');
    Route::get('/organizations/{id}', 'OrganizationController@show');

});
Route::post('/invoices', 'InvoiceController@store');
 Route::post('/organizations', 'OrganizationController@store');
  Route::patch('/organizations/{id}', 'OrganizationController@update');

