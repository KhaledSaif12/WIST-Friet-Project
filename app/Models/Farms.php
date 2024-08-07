<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Farms extends Model
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
}
