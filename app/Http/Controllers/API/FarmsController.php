<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Farms;
use Illuminate\Http\Request;

class FarmsController extends Controller
{
    public function index()
    {
        // جلب البيانات المطلوبة من جدول farms
        $farms = Farms::select('id', 'name', 'image', 'address_id')
                      ->with('address:id,name') // في حالة الحاجة لاسم العنوان من جدول addresses
                      ->get();

        return response()->json($farms);
    }
}
