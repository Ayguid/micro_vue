<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//filter api
Route::get('/getProducts/{ctyId}/{catId}/{filterAtts?}', 'FilterController@findProducts');
// Route::get('/filterProducts', 'FilterController@filterProducts');
// Route::get('/filterSearch', 'FilterController@findResults');



Route::post('/files/upload', 'FileController@upload');
// Route::post('/files/destroy/{string}', 'FileController@destroy');
Route::post('/files/destroy/{string?}', 'FileController@destroy');


//mails
Route::post('/send-mail', 'mailer\MailerController@sendMail')->name('sendIngMail');
