<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransfersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transfers', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->integer('status');
            $table->integer('user_id');
            $table->integer('from_warehouse_id');
            $table->integer('to_warehouse_id');
            $table->integer('item');
            $table->double('total_qty');
            $table->double('total_tax');
            $table->double('total_cost');
            $table->double('shipping_cost')->nullable();
            $table->double('grand_total');
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
        Schema::dropIfExists('transfers');
    }
}
