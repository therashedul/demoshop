<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->string('account_no');
            $table->string('name');
            $table->double('initial_balance')->nullable();
            $table->double('total_balance');
            $table->double('total_debit')->nullable();
            $table->text('note')->nullable();
            $table->boolean('is_active');
            $table->boolean('is_default')->default(1);
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
        Schema::dropIfExists('accounts');
    }
}