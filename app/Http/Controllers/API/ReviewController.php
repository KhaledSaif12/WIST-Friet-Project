<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    // إنشاء تقييم جديد
    public function store(Request $request)
    {
        // الحصول على المستخدم الحالي
        $user = Auth::user();

        // تحقق من صحة البيانات
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);

        // إنشاء التقييم
        $review = Review::create([
            'product_id' => $request->product_id,
            'user_id' => $user->id,
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);

        return response()->json($review, 201);
    }

    // تحديث التقييم
    public function update(Request $request, $id)
    {
        // الحصول على التقييم الموجود
        $review = Review::findOrFail($id);

        // تحقق من صحة البيانات
        $validated = $request->validate([
            'rating' => 'sometimes|integer|min:1|max:5',
            'comment' => 'nullable|string',
        ]);

        // تحديث التقييم
        $review->update($request->only(['rating', 'comment']));

        return response()->json($review, 200);
    }

    // حذف التقييم
    public function destroy($id)
    {
        // الحصول على التقييم الموجود
        $review = Review::findOrFail($id);

        // حذف التقييم
        $review->delete();

        return response()->json(['message' => 'Review deleted successfully'], 200);
    }
}
