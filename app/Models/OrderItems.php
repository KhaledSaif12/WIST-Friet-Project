<?php

namespace App\Models;
use \App\Models\Products;
use App\Models\Order;

use Illuminate\Database\Eloquent\Model;


class OrderItems extends Model
{
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


}
