<?php

use App\Http\Controllers\API\AddressesController;
use App\Http\Controllers\API\APILoginController;
use App\Http\Controllers\API\CategoriesController;
use App\Http\Controllers\API\FarmsController;
use App\Http\Controllers\API\OrderItemsController;
use App\Http\Controllers\API\OrdersController;
use App\Http\Controllers\API\ProductsController;
use App\Http\Controllers\API\ReviewController;
use Illuminate\Http\Request;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('login', [APILoginController::class, 'login']);

Route::post('register', [APILoginController::class, 'register']);


// مسارات API لعنوان
Route::middleware('auth:sanctum')->prefix('addresses')->group(function () {
    Route::get('/', [AddressesController::class, 'index']); // عرض جميع العناوين الخاصة بالمستخدم
    Route::get('/{id}', [AddressesController::class, 'show']); // عرض عنوان محدد
    Route::post('/', [AddressesController::class, 'store']); // إنشاء عنوان جديد
    Route::put('/{id}', [AddressesController::class, 'update']); // تحديث عنوان موجود
    Route::delete('/{id}', [AddressesController::class, 'destroy']); // حذف عنوان
});

Route::middleware('auth:sanctum')->prefix('categories')->group(function () {
    Route::get('/', [CategoriesController::class, 'index']); // عرض جميع الفئات
    Route::get('/{id}', [CategoriesController::class, 'show']); // عرض فئة محددة

});




Route::get('/farms', [FarmsController::class, 'index']);



// Route لإرجاع منتج معين
Route::get('/products/{id}', [ProductsController::class, 'getProduct']);

// Route لإرجاع جميع المنتجات
Route::get('/products', [ProductsController::class, 'getAllProducts']);

Route::middleware('auth:sanctum')->prefix('order-items')->group(function () {
    Route::get('/', [OrderItemsController::class, 'index']); // عرض جميع عناصر الطلب الخاصة بالمستخدم
    Route::get('/{id}', [OrderItemsController::class, 'show']); // عرض عنصر طلب محدد
    Route::post('/', [OrderItemsController::class, 'store']); // إضافة عنصر جديد
    Route::put('/{id}', [OrderItemsController::class, 'update']); // تحديث عنصر موجود
    Route::delete('/{id}', [OrderItemsController::class, 'destroy']); // حذف عنصر
});


Route::middleware('auth:sanctum')->prefix('orders')->group(function () {
    Route::post('/', [OrdersController::class, 'store']);
    Route::put('/{id}', [OrdersController::class, 'update']);
    Route::delete('/{id}', [OrdersController::class, 'destroy']);
});

Route::middleware('auth:sanctum')->prefix('reviews')->group(function () {
    Route::post('/', [ReviewController::class, 'store']); // إضافة تقييم جديد
    Route::put('/{id}', [ReviewController::class, 'update']); // تعديل تقييم
    Route::delete('/{id}', [ReviewController::class, 'destroy']); // حذف تقييم
});
