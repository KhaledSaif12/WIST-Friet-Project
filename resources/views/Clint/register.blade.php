<!DOCTYPE html>
<html>
<head>
    <title>تسجيل حساب جديد</title>
</head>
<body>
    <form method="POST" action="{{ route('register') }}">
        @csrf
        <div>
            <label for="name">الاسم:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div>
            <label for="email">البريد الإلكتروني:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">كلمة المرور:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="password_confirmation">تأكيد كلمة المرور:</label>
            <input type="password" id="password_confirmation" name="password_confirmation" required>
        </div>
        <div>
            <label for="role_id">نوع المستخدم:</label>
            <select id="role_id" name="role_id" required>
                <option value="">اختر نوع المستخدم</option>
                @foreach ($roles as $role)
                    <option value="{{ $role->id }}">{{ $role->display_name }}</option>
                @endforeach
            </select>
        </div>
        <div>
            <button type="submit">تسجيل</button>
        </div>
    </form>
</body>
</html>
