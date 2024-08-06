<?php

namespace App\Http\Controllers\Clint;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function showRegistrationForm()
    {
        // احضار الأدوار الممكنة
        $roles = Role::whereIn('name', ['client', 'Delivery_driver'])->get();
        return view('Clint.register', compact('roles'));
    }

    public function register(Request $request)
    {
        // التحقق من صحة البيانات المدخلة
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'role_id' => 'required|exists:roles,id',
        ]);

        // إنشاء مستخدم جديد
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // تعيين الدور للمستخدم
        $user->roles()->attach($request->role_id);

        // تسجيل دخول المستخدم
        Auth::login($user);

        return redirect()->route('dashboard');
    }
}
