<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('reference_no');
            $table->integer('warehouse_id');
            $table->integer('supplier_id')->nullable();
            $table->integer('item')->nullable();
            $table->integer('total_qty')->nullable();
            $table->double('total_discount')->nullable();
            $table->double('total_tax')->nullable();
            $table->double('total_cost')->nullable();
            $table->double('order_tax_rate')->nullable();
            $table->double('order_tax')->nullable();
            $table->double('order_discount')->nullable();
            $table->double('shipping_cost')->nullable();
            $table->double('grand_total')->nullable();
            $table->double('due_amount')->nullable();
            $table->double('paid_amount')->nullable();
            $table->integer('purchases_status')->nullable();
            $table->integer('payment_status');
            $table->string('document')->nullable();
            $table->text('note')->nullable();
            
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
        Schema::dropIfExists('purchases');
    }
}