<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Orders extends Model
{
 
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
