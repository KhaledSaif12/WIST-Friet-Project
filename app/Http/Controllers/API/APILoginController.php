<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class APILoginController extends Controller
{
    /**
     * تسجيل الدخول
     */
    public function login(Request $request)
    {
        // تحقق من صحة البيانات
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $token = $user->createToken('Personal Access Token')->plainTextToken;

            // استرجاع `role_id` من علاقة الدور
            $role_id = $user->roles()->pluck('id')->first();

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $user,
                'role_id' => $role_id, // إضافة `role_id` إلى الاستجابة
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        ], 401);
    }

    /**
     * تسجيل المستخدم
     */
    public function register(Request $request)
    {
        // تحقق من صحة البيانات
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'phone' => 'required|string|max:15|unique:users', // إضافة التحقق من صحة الهاتف
            'password' => 'required|string|min:8|confirmed',
            'role_id' => 'required|exists:roles,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        // إنشاء مستخدم جديد
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone, // إضافة الهاتف هنا
            'password' => Hash::make($request->password),
        ]);

        // تعيين الدور للمستخدم
        $user->roles()->attach($request->role_id);

        return response()->json([
            'success' => true,
            'message' => 'تم تسجيل المستخدم بنجاح',
            'user' => $user,
        ], 201);
    }
}
