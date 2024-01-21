<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockCountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_counts', function (Blueprint $table) {
            $table->id();
            $table->string('reference_no');
            $table->integer('warehouse_id');
            $table->string('category_id')->nullable();
            $table->string('brand_id')->nullable();
            $table->integer('user_id');
            $table->string('type');
            $table->string('initial_file')->nullable();
            $table->string('final_file')->nullable();
            $table->text('note')->nullable();
            $table->boolean('is_adjusted')->nullable();
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
        Schema::dropIfExists('stock_counts');
    }
}
