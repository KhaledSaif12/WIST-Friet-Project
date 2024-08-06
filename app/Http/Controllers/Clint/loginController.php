<?php

namespace App\Http\Controllers\Clint;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class loginController extends Controller
{
    public function show()
    {
        return view('Clint.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            // تسجيل الدخول ناجح
            return redirect()->intended('dashboard');
        }

        // تسجيل الدخول غير ناجح
        return back()->withErrors([
            'email' => 'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        ]);
    }
}
