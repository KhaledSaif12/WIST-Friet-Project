<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('address_id');
            $table->unsignedBigInteger('delivery_id');
            $table->time('orderdelivrytime');
            $table->decimal('deliverycost');
            $table->decimal('totalorderprice');
            $table->string('orderstatas');
            $table->string('paymentmethod');
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('address_id')->references('id')->on('addresses');
            $table->foreign('delivery_id')->references('id')->on('delivery_details');

        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
