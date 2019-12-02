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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

/* get all products */
Route::get('get-all-products','Apis\ApiController@get_all_products');

/* user login */
// Route::post('user-login', 'Apis\ApiController@login');
Route::post('user-login', 'Apis\UserController@login');


/* save user */
// Route::post('save-user', 'Apis\ApiController@register');
Route::post('save-user', 'Apis\UserController@register');

/* get user details */
Route::get('user-details/{id}','Apis\ApiController@user_details');

/* 
** Authenticate user via JWT auth middlewere
** User can't add product if not logged in or verified
*/
// Route::middleware('jwt.auth')->get('users', function(Request $request) {
//     return auth()->user();
// });

Route::group(['middleware'=>'jwt.auth'],function(){
	/* add product to cart */
	Route::any('add-to-cart','Apis\ApiController@add_to_cart');

	Route::delete('delete-cart/{id}','Apis\ApiController@delete_cart');

	/* get cart products */
	Route::get('get-cart-products/{id}','Apis\ApiController@get_cart_products');

	/* checkout */
	Route::post('check-out','Apis\ApiController@check_out');

	/* get orders */
	Route::get('user-orders/{id}','Apis\ApiController@user_orders');
});

/* product details */
Route::get('get-product-details/{slug}','Apis\ApiController@product_details');