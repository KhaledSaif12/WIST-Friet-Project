<?php

use App\Admin\Controllers\AddressesControllers;
use App\Admin\Controllers\CategoriesControllers;
use App\Admin\Controllers\DeliveryDetailsControllers;
use App\Admin\Controllers\ReviewControllers;
use App\Admin\Controllers\SeasonsControllers;
use App\Admin\Controllers\UserController;
use App\Admin\Controllers\OrdersControllers; // Add OrdersControllers
use App\Admin\Controllers\FarmsControllers; // Add FarmsControllers
use App\Admin\Controllers\ProductsControllers; // Add ProductsControllers
use App\Admin\Controllers\OrderItemsControllers; // Add OrderItemsControllers
use App\Admin\Controllers\OrderApiController; // Add OrderApiController
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UserController::class);
    $router->resource('categories', CategoriesControllers::class);
    $router->resource('seasons', SeasonsControllers::class);
    $router->resource('addresses', AddressesControllers::class);
    $router->resource('farms', FarmsControllers::class);
    $router->resource('products', ProductsControllers::class);
    $router->resource('delivery-details', DeliveryDetailsControllers::class);
    $router->resource('orders', OrdersControllers::class);
    $router->resource('order-items', OrderItemsControllers::class);
    $router->resource('order-items', OrderItemsControllers::class);
    $router->resource('reviews', ReviewControllers::class);






});
