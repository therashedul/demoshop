<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');

            $table->string('product_type')->nullable();
            $table->string('product_name')->nullable();
            $table->string('slug')->unique()->nullable();
            
            $table->string('product_code')->unique()->nullable();        
            $table->string('product_price')->nullable();             
            $table->string('product_cost')->nullable();
            $table->string('product_regular_price')->nullable();
            $table->string('product_sell_price')->nullable();
            $table->string('qty_list')->nullable();
            $table->string('product_image')->nullable();
            $table->text('product_details')->nullable();
            $table->string('featured')->nullable();
            $table->string('alert_qty')->nullable();
            $table->string('option')->nullable();
            $table->string('publish_at')->nullable();
            $table->double('qty')->nullable();

            $table->tinyInteger('promotion')->nullable();
            $table->string('promotion_price')->nullable();
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
        
            $table->integer('view')->nullable();
            $table->string('tag')->nullable();
            $table->string('status')->nullable();
            $table->string('variant_option')->nullable();
            $table->string('variant_value')->nullable();
            $table->string('product_list')->nullable();
            $table->string('variant_list')->nullable();
            $table->boolean('trending')->nullable();
            
            $table->boolean('in_stock')->nullable();
            $table->boolean('is_active')->nullable();
            $table->boolean('is_batch')->nullable();
            $table->boolean('is_variant')->nullable();
        
            $table->integer('is_diffPriceWareHouse')->nullable();
            $table->integer('brand_id')->nullable();
            $table->integer('category_id')->nullable();
            $table->integer('unit_id')->nullable();
            $table->integer('tax_method')->nullable();
            $table->integer('tax_id')->nullable();
            $table->integer('sale_id')->nullable();
            $table->integer('sale_unit_id')->nullable();
            $table->integer('purchase_unit_id')->nullable();
            $table->integer('alert_quantity')->nullable();
            $table->string('daily_sale_objective')->nullable();
            
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
        Schema::dropIfExists('products');
    }
}