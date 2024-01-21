<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReturnsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('returns', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->integer('customer_id');
            $table->integer('user_id');
            $table->integer('sale_id');
            $table->integer('cash_register_id');
            $table->integer('product_batch_id');
            $table->integer('account_id');
            $table->integer('warehouse_id');
            $table->integer('biller_id');
            $table->integer('item');
            $table->double('total_qty')->nullable();
            $table->double('total_discount')->nullable();
            $table->double('total_tax')->nullable();
            $table->double('total_price')->nullable();
            $table->double('order_tax_rate')->nullable();
            $table->double('order_tax')->nullable();
            $table->double('grand_total');
            $table->string('document')->nullable();
            $table->text('return_note')->nullable();
            $table->text('staff_note')->nullable();
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
        Schema::dropIfExists('returns');
    }
}