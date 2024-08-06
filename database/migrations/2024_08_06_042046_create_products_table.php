<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->decimal('prais');
            $table->integer('quantity');
            $table->string('photo');
            $table->text('description');
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('season_id');
            $table->unsignedBigInteger('farm_id');
            $table->date('data');
            $table->boolean('productstatus');
            $table->string('slug')->unique();
            $table->timestamps();
            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('season_id')->references('id')->on('seasons');
            $table->foreign('farm_id')->references('id')->on('farms');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
