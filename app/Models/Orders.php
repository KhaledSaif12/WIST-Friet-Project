<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Orders extends Model
{
    
    // تحديد العلاقة مع نموذج User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // تحديد العلاقة مع نموذج Addresses
    public function address()
    {
        return $this->belongsTo(Addresses::class);
    }

    // تحديد العلاقة مع نموذج DeliveryDetails
    public function delivery()
    {
        return $this->belongsTo(DeliveryDetails::class);
    }
    

    

    
}
