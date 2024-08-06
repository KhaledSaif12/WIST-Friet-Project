<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Addresses extends Model
{

    // تحديد العلاقة مع نموذج User
    public function user()
    {
        return $this->belongsTo(User::class);
    }





}
