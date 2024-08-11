<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Orders extends Model
{
    protected $fillable = [
        'user_id',
        'address_id',
        'orderdelivrytime',
        'totalorderprice',
        'deliverycost',
        'orderstatas',
        'paymentmethod'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function address()
    {
        return $this->belongsTo(Addresses::class);
    }

    public function delivery()
    {
        return $this->belongsTo(DeliveryDetails::class);
    }
}
