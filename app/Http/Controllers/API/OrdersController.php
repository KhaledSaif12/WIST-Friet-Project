<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Orders;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrdersController extends Controller
{
    public function store(Request $request)
    {
        // الحصول على المستخدم الحالي
        $user = Auth::user();

        // تحقق من صحة البيانات
        $validated = $request->validate([
            'orderdelivrytime' => 'required|date',
            'totalorderprice' => 'required|numeric',
            'deliverycost' => 'required|numeric',
            'orderstatas' => 'nullable|string',
            'paymentmethod' => 'nullable|string',
        ]);

        // العثور على عنوان المستخدم
        $address = $user->addresses()->first(); // افترض أن المستخدم لديه عنوان واحد فقط

        // تحقق من وجود عنوان
        if (!$address) {
            return response()->json(['error' => 'Address not found for user.'], 404);
        }

        // إنشاء الطلب
        $order = Orders::create([
            'user_id' => $user->id,
            'address_id' => $address->id,
            'orderdelivrytime' => $validated['orderdelivrytime'],
            'totalorderprice' => $validated['totalorderprice'],
            'deliverycost' => $validated['deliverycost'],
            'orderstatas' => $validated['orderstatas'],
            'paymentmethod' => $validated['paymentmethod'],
        ]);

        return response()->json($order, 201);
    }

    // الدالة لتحديث الطلب
    public function update(Request $request, $id)
    {
        // الحصول على الطلب
        $order = Orders::findOrFail($id);

        // تحقق من أن المستخدم يمتلك الطلب
        if ($order->user_id !== Auth::id()) {
            return response()->json(['error' => 'Unauthorized.'], 403);
        }

        // تحقق من صحة البيانات
        $validated = $request->validate([
            'orderdelivrytime' => 'required|date',
            'totalorderprice' => 'required|numeric',
            'deliverycost' => 'required|numeric',
            'orderstatas' => 'nullable|string',
            'paymentmethod' => 'nullable|string',
        ]);

        // تحديث الطلب
        $order->update($validated);

        return response()->json($order, 200);
    }

    // الدالة لحذف الطلب
    public function destroy($id)
    {
        // الحصول على الطلب
        $order = Orders::findOrFail($id);

        // تحقق من أن المستخدم يمتلك الطلب
        if ($order->user_id !== Auth::id()) {
            return response()->json(['error' => 'Unauthorized.'], 403);
        }

        // حذف الطلب
        $order->delete();

        return response()->json(['message' => 'Order deleted successfully.'], 200);
    }
}
