<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductWarehousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_warehouses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('product_id');
            $table->integer('warehouse_id');
            $table->integer('product_batch_id')->nullable();
            $table->integer('variant_id')->nullable()->default(null);
            $table->integer('imei_number')->nullable()->default(null);
            $table->integer('stock')->nullable()->default(null);
            $table->double('qty');
            $table->string('price')->nullable();
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
        Schema::dropIfExists('product_warehouses');
    }
}