<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Products; // تأكد من استيراد نموذج Products
use App\Models\Orders;

class OrderItems extends Model
{
    protected $fillable = ['product_id', 'order_id', 'quantity', 'total_product_price'];

    // Define the relationship with the Order model
    public function order()
    {
        return $this->belongsTo(Orders::class, 'order_id');
    }

    // Define the relationship with the Product model
    public function product()
    {
        return $this->belongsTo(Products::class, 'product_id');
    }

    // Boot method to handle events
    protected static function boot()
    {
        parent::boot();

        static::saving(function ($item) {
            // Ensure the item has a product_id and quantity
            if ($item->product_id && $item->quantity) {
                $product = Products::find($item->product_id);
                if ($product && $product->prais) {
                    // Calculate the total product price
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
