<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('fashion_orders')){
            Schema::create('fashion_orders', function (Blueprint $table) {
                $table->bigIncrements('order_id');
                $table->integer('order_carts');
                $table->integer('order_user_id');
                $table->integer('order_total_qty');
                $table->integer('order_paymnt_amount');
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
        Schema::dropIfExists('fashion_orders');
    }
}
