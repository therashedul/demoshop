<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->integer('sale_id')->nullable();
            $table->integer('purchase_id')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('cash_register_id')->nullable();
            $table->integer('account_id')->nullable();
            $table->string('paying_method')->nullable();
            $table->string('payment_reference')->nullable();
            $table->integer('used_points')->nullable();
            $table->double('amount');
            $table->string('change')->nullable();
            $table->text('payment_note')->nullable();
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
        Schema::dropIfExists('payments');
    }
}