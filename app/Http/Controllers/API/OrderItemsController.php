<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\OrderItems;
use App\Models\Products;

class OrderItemsController extends Controller
{
    /**
     * إضافة عناصر طلبات متعددة.
     */
    public function store(Request $request)
    {
        // تحقق من صحة البيانات
        $validatedData = $request->validate([
            'orders' => 'required|array',
            'orders.*.product_id' => 'required|exists:products,id',
            'orders.*.quantity' => 'required|integer|min:1',
            'orders.*.order_delivery_time' => 'nullable|date',
            'orders.*.status' => 'required|string',
        ]);

        $user_id = Auth::id(); // الحصول على user_id من المستخدم الذي قام بتسجيل الدخول

        $orderItems = [];

        foreach ($validatedData['orders'] as $order) {
            // حساب السعر الإجمالي للمنتج
            $product = Products::find($order['product_id']);
            $total_product_price = $product->price * $order['quantity'];

            // إنشاء عنصر طلب جديد
            $orderItem = OrderItems::create([
                'product_id' => $order['product_id'],
                'user_id' => $user_id,
                'quantity' => $order['quantity'],
                'total_product_price' => $total_product_price,
                'order_delivery_time' => $order['order_delivery_time'],
                'status' => $order['status'],
            ]);

            $orderItems[] = $orderItem;
        }

        return response()->json([
            'success' => true,
            'order_items' => $orderItems,
        ], 201);
    }

    /**
     * عرض جميع عناصر الطلب الخاصة بالمستخدم.
     */
    public function index()
    {
        $user_id = Auth::id(); // الحصول على user_id من المستخدم الذي قام بتسجيل الدخول
        $orderItems = OrderItems::where('user_id', $user_id)->get();

        return response()->json($orderItems);
    }

    /**
     * عرض عنصر طلب محدد.
     */
    public function show($id)
    {
        $orderItem = OrderItems::findOrFail($id);

        return response()->json($orderItem);
    }

    /**
     * تحديث عنصر موجود.
     */
    public function update(Request $request, $id)
    {
        $orderItem = OrderItems::findOrFail($id);

        $validatedData = $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
            'order_delivery_time' => 'nullable|date',
            'status' => 'required|string',
        ]);

        $product = Products::find($validatedData['product_id']);
        $total_product_price = $product->price * $validatedData['quantity'];

        $orderItem->update([
            'product_id' => $validatedData['product_id'],
            'quantity' => $validatedData['quantity'],
            'total_product_price' => $total_product_price,
            'order_delivery_time' => $validatedData['order_delivery_time'],
            'status' => $validatedData['status'],
        ]);

        return response()->json([
            'success' => true,
            'order_item' => $orderItem,
        ]);
    }

    /**
     * حذف عنصر طلب.
     */
    public function destroy($id)
    {
        $orderItem = OrderItems::findOrFail($id);
        $orderItem->delete();

        return response()->json([
            'success' => true,
            'message' => 'تم حذف عنصر الطلب بنجاح',
        ]);
    }
}
