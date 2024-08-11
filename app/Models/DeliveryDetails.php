<?php

// app/Models/DeliveryDetails.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeliveryDetails extends Model
{
    // تحديد اسم الجدول (اختياري إذا كان الاسم الافتراضي مطابقاً)
    protected $table = 'delivery_details';

    // تحديد الأعمدة القابلة للتحديث الجماعي
    protected $fillable = [
        'usar_id', // تأكد من أن الاسم هو 'usar_id'
        'vehicletype',
        'vehiclenumber',
        'vehicleimage',
    ];

    // تعريف العلاقة مع المستخدم
    public function user()
    {
        return $this->belongsTo(User::class, 'usar_id'); // تأكد من أن المفتاح الأجنبي هو 'usar_id'
    }

    // تعريف العلاقة مع Orders
    public function orders()
    {
        return $this->hasMany(Orders::class, 'delivery_id');
    }
}
