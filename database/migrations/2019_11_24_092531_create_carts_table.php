<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('fashion_carts')){
            Schema::create('fashion_carts', function (Blueprint $table) {
                $table->bigIncrements('cart_id');
                $table->integer('cart_pro_id');
                $table->integer('cart_user_id');
                $table->integer('cart_qty');
                $table->integer('cart_price');
                $table->timestamps();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fashion_carts');
    }
}
