<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('fashion_products_images')){
            Schema::create('fashion_products_images', function (Blueprint $table) {
                $table->bigIncrements('img_id');
                $table->bigInteger('pro_id')->unsigned();
                $table->foreign('pro_id')->references('pro_id')->on('fashion_products');
                $table->string('image',255);
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
        Schema::dropIfExists('fashion_products_images');
    }
}
