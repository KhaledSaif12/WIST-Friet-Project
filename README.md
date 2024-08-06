# Fresh_products_delivery_platform

2. تثبيت الاعتماديات
قم بتثبيت جميع الاعتماديات المطلوبة للمشروع باستخدام Composer:
composer install

3. نسخ ملف البيئة
نسخ ملف البيئة .env.example إلى .env:
cp .env.example .env
ثم قم بتحديث ملف .env لإعداد معلومات الاتصال بقاعدة البيانات وأي إعدادات أخرى حسب الحاجة.



4. توليد مفتاح التطبيق
قم بتوليد مفتاح التطبيق باستخدام الأمر التالي:
php artisan key:generate

 5. تشغيل الترحيلات
قم بتشغيل الترحيلات لإنشاء الجداول في قاعدة البيانات:
php artisan migrate

6. تشغيل التعداد
بعد تشغيل الترحيلات، قم بتشغيل التعداد لملء قاعدة البيانات بالبيانات الافتراضية:
php artisan db:seed

7. تشغيل Seeder خاص
إذا كان لديك Seeder خاص بالجداول الإدارية، قم بتشغيله باستخدام الأمر التالي:
php artisan db:seed --class=AdminTablesSeeder


8. تشغيل خادم الويب
ابدأ خادم الويب المدمج في Laravel:
php artisan serve

username :admin
password:admin
ع
