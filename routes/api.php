<?php

use App\Http\Controllers\API\AddressesController;
use App\Http\Controllers\API\APILoginController;
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
