<?php

// app/Models/Review.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    // تحديد اسم الجدول (اختياري إذا كان الاسم الافتراضي مطابقاً)
    protected $table = 'reviews';

    // تحديد الأعمدة القابلة للتحديث الجماعي (mass assignment)
    protected $fillable = [
        'product_id',
        'user_id',
        'rating',
        'comment',
    ];

    // تحديد العلاقات مع نماذج أخرى

    /**
     * علاقة بين التقييم والمنتج
     */
    public function product()
    {
        return $this->belongsTo(Products::class);
    }

    /**
     * علاقة بين التقييم والمستخدم
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
