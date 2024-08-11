<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    // تحديد اسم الجدول إذا كان يختلف عن اسم النموذج
    protected $table = 'categories';

    // تحديد الحقول القابلة للتعبئة
    protected $fillable = ['name', 'description', 'image'];
}
