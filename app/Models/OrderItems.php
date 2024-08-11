<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Products;
use App\Models\Orders;
use App\Models\User;

class OrderItems extends Model
{
    protected $fillable = ['product_id', 'order_id', 'user_id', 'quantity', 'total_product_price', 'order_delivery_time', 'status'];

    public function order()
    {
        return $this->belongsTo(Orders::class, 'order_id');
    }

    public function product()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($item) {
            if ($item->product_id && $item->quantity) {
                $product = Products::find($item->product_id);
                if ($product && $product->prais) {
                    $item->total_product_price = $item->quantity * $product->prais;
                } else {
                    $item->total_product_price = 0;
                }
            } else {
                $item->total_product_price = 0;
            }
        });
    }
}
