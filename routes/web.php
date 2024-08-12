<?php

use App\Admin\Controllers\ProductsControllers;
use App\Http\Controllers\Clint\loginController;
use App\Http\Controllers\Clint\RegisterController ;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('clint.layout.master');
});


Route::get('login', [loginController::class, 'show'])->name('login.form');
Route::post('login', [loginController::class, 'login'])->name('login');


Route::get('register', [RegisterController::class, 'showRegistrationForm'])->name('register.form');
Route::post('register', [RegisterController::class, 'register'])->name('register');


Route::get('products', [ProductsControllers::class, 'showProducts'])->name('products');
Route::get('/products/{id}', [ProductsControllers::class, 'showProductDetails'])->name('productdetails');



