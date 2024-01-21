<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->integer('customer_group_id');
            $table->string('name');
            $table->integer('user_id');
            $table->string('company_name')->nullable();
            $table->string('email')->nullable();
            $table->string('phone_number');
            $table->string('address');
            $table->integer('tax_no');
            $table->string('city');
            $table->string('state')->nullable();
            $table->string('postal_code')->nullable();
            $table->string('country')->nullable();
            $table->integer('points')->nullable();
            $table->integer('deposit')->nullable();
            $table->integer('expense')->nullable();
            $table->string('image')->nullable();
            $table->boolean('is_active')->nullable()->default('0');
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
        Schema::dropIfExists('customers');
    }
}
