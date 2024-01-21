<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchaseProductReturnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_product_returns', function (Blueprint $table) {
            $table->id();

            $table->integer('return_id');
            $table->integer('product_id');
            $table->integer('product_batch_id')->nullable();
            $table->integer('variant_id')->nullable();
            $table->integer('imei_number')->nullable();
            $table->integer('qty');
            $table->integer('purchase_unit_id');
	        $table->integer('purchase_status')->nullable();



            $table->integer('net_unit_cost');
            $table->double('discount')->nullable();
            $table->double('tax')->nullable();
            $table->double('tax_rate')->nullable();
            $table->double('total');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchase_product_returns');
    }
}