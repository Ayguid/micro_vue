<?php

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


//Artisan::call('storage:link');

/** ADD ALL LOCALIZED ROUTES INSIDE THIS GROUP **/
Route::group([
  'prefix' => LaravelLocalization::setLocale(),
  'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
],
function(){
  //
  Route::get('/country/{id?}', 'LandingController@setCountry')->name('country_landing');
  //
  Route::get('/', 'LandingController@index')->name('landing');
  //
  Route::get('/cat/{id?}', 'LandingController@index')->name('productsCat');
  //
  Route::get('/showProduct/{id}', 'LandingController@showProduct')->name('showProduct');
  Route::get('/searchProduct/{q?}','LandingController@find')->name('userFindProduct');
  //
  Auth::routes();
  Route::get('/home', 'HomeController@index')->name('home');

  //admin sections
  Route::prefix('admin')->group(function(){
    Route::get('/login', 'Auth\AdminLoginController@showLoginForm')->name('admin.login');
    Route::post('/login', 'Auth\AdminLoginController@login')->name('admin.login.submit');
    Route::get('/', 'AdminController@index')->name('admin.dashboard');
    Route::get('/logout',  'Auth\AdminLoginController@logout')->name('admin.logout');
    //  Password reset Route
    Route::post('password/email', 'Auth\AdminForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
    Route::get('password/reset', 'Auth\AdminForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
    Route::post('password/reset', 'Auth\AdminResetPasswordController@reset');
    Route::get('password/reset/{token}', 'Auth\AdminResetPasswordController@showResetForm')->name('admin.password.reset');

    //admin profiles
    Route::get('adminProfiles', 'AdminController@adminProfiles')->name('adminProfiles');
    Route::post('addAddmin', 'AdminController@addAdmin')->name('addAdmin');
    Route::get('/editAdmin/{id}', 'AdminController@editAdmin')->name('editAdmin');
    Route::post('/updateAdmin', 'AdminController@updateAdmin')->name('updateAdmin');

    //categories section
    Route::post('/addCategory', 'CategoryController@store')->name('addCategory');
    Route::get('/showCategory/{id}', 'CategoryController@show')->name('showCategory');
    Route::get('/editCategory/{id}', 'CategoryController@edit')->name('editCategory');
    Route::post('/updateCategory/{id}', 'CategoryController@update')->name('updateCat');
    Route::delete('/deleteCategory/{id}', 'CategoryController@destroy')->name('deleteCategory');

    Route::post('/addAttribute', 'AttributeController@addAttribute')->name('addAttribute');
    Route::get('/editAttribute/{id}', 'AttributeController@editAttribute')->name('editAttribute');
    Route::post('/updateAttribute', 'AttributeController@updateAttribute')->name('updateAttribute');
    Route::delete('/deleteAttribute{att}', 'AttributeController@destroy')->name('deleteAttribute');

    //products sections
    // Route::get('/productsInCategory/{id?}', 'ProductController@productsInCategory')->name('productsInCat');
    Route::post('/addProduct', 'ProductController@store')->name('addProduct');
    Route::get('/editProduct/{id}', 'ProductController@edit')->name('editProduct');
    Route::post('/updateProduct', 'ProductController@update')->name('updateProduct');
    Route::get('/findProducts/{query?}','ProductController@find')->name('adminFindProduct');
    Route::delete('/deleteProduct/{id}','ProductController@destroy')->name('destroyProduct');

    //media
    Route::get('/files','FileController@index')->name('fileManager');
  });



  //grl stuff
  Route::post('/send-mail', 'mailer\MailerController@sendMail')->name('sendIngMail');

});
