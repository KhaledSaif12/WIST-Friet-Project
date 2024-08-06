<!DOCTYPE html>
<html>
<head>
    <title>تسجيل الدخول</title>
</head>
<body>
    <form method="POST" action="{{ route('login') }}">
        @csrf
        <div>
            <label for="email">البريد الإلكتروني:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">كلمة المرور:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <button type="submit">تسجيل الدخول</button>
        </div>
    </form>
</body>
</html>
