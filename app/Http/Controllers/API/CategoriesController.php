<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Categories;

class CategoriesController extends Controller
{
    // عرض جميع الفئات
    public function index()
    {
        return response()->json(Categories::all(), 200);
    }

    // عرض فئة محددة
    public function show($id)
    {
        $category = Categories::find($id);
        if ($category) {
            return response()->json($category, 200);
        }
        return response()->json(['message' => 'Category not found'], 404);
    }



}
