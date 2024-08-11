<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Products;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    // دالة لإرجاع منتج معين بناءً على الـ ID
    public function getProduct($id)
    {
        $product = Products::with('category')  // جلب العلاقة مع الفئة
                           ->select('id', 'name', 'prais', 'quantity', 'photo', 'description', 'category_id', 'productstatus')
                           ->where('id', $id)
                           ->first();

        if ($product) {
            // تحويل القيم
            $product->category_name = $product->category->name; // إرجاع اسم الفئة

            unset($product->category_id); // حذف الـ category_id لأننا أضفنا الاسم
            unset($product->category); // حذف الـ category object
            return response()->json($product, 200);
        } else {
            return response()->json(['message' => 'Product not found'], 404);
        }
    }

    // دالة لإرجاع جميع المنتجات
    public function getAllProducts()
    {
        $products = Products::with('category')
                            ->select('id', 'name', 'prais', 'quantity', 'photo', 'description', 'category_id', 'productstatus')
                            ->get();

        // تحويل القيم لكل منتج
        $products->transform(function ($product) {
            $product->category_name = $product->category->name; // إرجاع اسم الفئة

            unset($product->category_id); // حذف الـ category_id لأننا أضفنا الاسم
            unset($product->category); // حذف الـ category object
            return $product;
        });

        return response()->json($products, 200);
    }
}
