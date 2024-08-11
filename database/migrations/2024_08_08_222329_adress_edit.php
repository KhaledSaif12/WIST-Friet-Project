<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //
        Schema::table('addresses', function (Blueprint $table) {
            // إضافة الحقول الجديدة
            $table->string('lat');
            $table->string('lan');

            // حذف الحقل القديم
            $table->dropColumn('addresslink');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
