<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Addresses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AddressesController extends Controller
{
    // تطبيق المصادقة باستخدام Sanctum على جميع دوال الـ API
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    // عرض جميع العناوين الخاصة بالمستخدم الحالي
    public function index()
    {
        $user = Auth::user();
        $addresses = $user->addresses; // الحصول على العناوين الخاصة بالمستخدم
        return response()->json($addresses);
    }

    // عرض عنوان محدد
    public function show($id)
    {
        $address = Addresses::where('id', $id)->where('user_id', Auth::id())->first();
        if ($address) {
            return response()->json($address);
        } else {
            return response()->json(['message' => 'Address not found'], 404);
        }
    }

    // إنشاء عنوان جديد
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'addresslink' => 'required|string',
            'city' => 'nullable|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $address = Addresses::create([
            'name' => $request->name,
            'description' => $request->description,
            'addresslink' => $request->addresslink,
            'city' => $request->city,
            'user_id' => Auth::id() // الحصول على معرف المستخدم من التوكن
        ]);

        return response()->json($address, 201);
    }

    // تحديث عنوان موجود
    public function update(Request $request, $id)
    {
        $address = Addresses::where('id', $id)->where('user_id', Auth::id())->first();
        if (!$address) {
            return response()->json(['message' => 'Address not found'], 404);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'addresslink' => 'required|string',
            'city' => 'nullable|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $address->update($request->all());
        return response()->json($address);
    }

    // حذف عنوان
    public function destroy($id)
    {
        $address = Addresses::where('id', $id)->where('user_id', Auth::id())->first();
        if ($address) {
            $address->delete();
            return response()->json(['message' => 'Address deleted successfully']);
        } else {
            return response()->json(['message' => 'Address not found'], 404);
        }
    }
}
