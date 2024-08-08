<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class DeliveryDetails extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    
    // تعريف العلاقة مع Orders
    public function orders()
    {
        return $this->hasMany(Orders::class, 'delivery_id'); 
    }
    

    
}
