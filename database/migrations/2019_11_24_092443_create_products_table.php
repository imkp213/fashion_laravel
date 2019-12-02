<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('fashion_products')){
            Schema::create('fashion_products', function (Blueprint $table) {
                $table->bigIncrements('pro_id');
                $table->string('pro_name',255);
                $table->text('pro_slug')->nullable();
                $table->string('pro_code',255)->nullable();
                $table->text('pro_desc')->nullable();
                $table->string('pro_image',255)->nullable();
                $table->integer('pro_price');
                $table->tinyInteger('status')->default(1)->comment = '0=Deactive,1=Active';
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
        Schema::dropIfExists('fashion_products');
    }
}
