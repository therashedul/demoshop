<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReturnPurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('return_purchases', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->integer('purchase_id');
            $table->integer('user_id');
            $table->integer('supplier_id');
            $table->integer('warehouse_id');
            $table->integer('account_id');
            $table->integer('item');
            $table->integer('total_qty');
            $table->integer('total_discount');
            $table->integer('total_tax');
            $table->integer('total_cost');
            $table->integer('order_tax');
            $table->integer('order_tax_rate');
            $table->integer('grand_total');
            $table->string('document')->nullable();
            $table->string('return_note')->nullable();
            $table->string('staff_note')->nullable();
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
        Schema::dropIfExists('return_purchases');
    }
}