<?php

use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\Request;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderAPIController;
use App\Http\Controllers\MessageAPIController;
use App\Http\Controllers\ProductAPIController;
use App\Http\Controllers\CustomerAPIController;
use App\Http\Controllers\SearchController;


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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//Authenticating
Route::post('/login', [LoginController::class, 'login']);
Route::post('/register', [LoginController::class, 'register']);
Route::post('/logout', [LoginController::class, 'logout']);

//Products
Route::post('/products', [ProductAPIController::class, 'index']);
Route::get('/products', [ProductAPIController::class, 'index']);
Route::get('/products/{id}', [ProductAPIController::class, 'show']);

//Search
Route::get('/search', [SearchController::class, 'search']);

//Orders
Route::get('/orders', [OrderAPIController::class, 'index']);
Route::get('/orders/{id}', [OrderAPIController::class, 'show']);
Route::post('/orders-image', [OrderAPIController::class, 'store']);
Route::delete('/orders/{id}', [OrderAPIController::class, 'destroy']);

//customer account
Route::get('/customer_accounts', [CustomerAPIController::class, 'index']);
Route::get('/customer_accounts/{id}', [CustomerAPIController::class, 'show']);
Route::put('/customer_accounts/{id}', [CustomerAPIController::class, 'update']);
Route::delete('/customer_accounts/{id}', [CustomerAPIController::class, 'destroy']);

Route::post('/message', [MessageAPIController::class, 'store']);
