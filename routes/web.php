<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\VideosController;
use Illuminate\Support\Facades\Auth;
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

Auth::routes();




Route::middleware(['web', 'guest'])->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login']);
});

Route::middleware(['web', 'auth'])->group(function () {
    Route::get('/home', [HomeController::class, 'index'])->name('home');
    Route::get('/products', [ProductController::class, 'index']);
    Route::get('/products/create-product', [ProductController::class, 'createProduct']);
    Route::get('/products/edit/{id}', [ProductController::class, 'editProduct']);
    Route::get('/videos', [VideosController::class, 'index']);

    
    Route::get('/api/product/get',  [ProductController::class, 'getProduct']);
    Route::get('/api/product/{id}',  [ProductController::class, 'getProductById']);
    Route::post('/api/product/add', [ProductController::class, 'addProduct']);
    Route::post('/api/product/update', [ProductController::class, 'updateProduct']);
    
    Route::get('/api/product/delete/{id}', [ProductController::class, 'deleteProduct']);

    if(Request()->segment(1) === 'videos'){
        Route::get('videos/{any}', function () {
            return view('videos');
        })->where('any', '.*');
    }
    
    Route::get('/auth/logout',     [LoginController::class,'logout']);
});






