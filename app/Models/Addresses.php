<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Addresses extends Model
{
    // تحديد اسم الجدول إذا لم يكن مطابقًا للترقيم الافتراضي
    protected $table = 'addresses';

    // تحديد الأعمدة القابلة للتعبئة
    protected $fillable = [
        'name',
        'description',
        'addresslink',
        'city',
        'user_id'
    ];

    // تحديد العلاقة مع نموذج User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
