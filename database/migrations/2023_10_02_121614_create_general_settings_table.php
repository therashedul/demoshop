<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGeneralSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('general_settings', function (Blueprint $table) {
            $table->id();
            $table->string('site_title')->nullable();
            $table->string('site_logo')->nullable();
            $table->string('is_rtl')->nullable();
            $table->string('is_zatca')->nullable();
            $table->string('free_trial_limit')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('expiry_date')->nullable();
            $table->string('timezone')->nullable();
            $table->string('without_stock')->nullable();
            $table->integer('currency')->nullable();
            $table->integer('decimal')->nullable();
            $table->string('currency_position')->nullable();
            $table->string('staff_access')->nullable();
            $table->string('date_format')->nullable();
            $table->string('theme')->nullable();
            $table->string('developed_by')->nullable();
            $table->string('invoice_format')->nullable();
            $table->string('company_name')->nullable();
            $table->string('vat_registration_number')->nullable();
            $table->boolean('state')->nullable();
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
        Schema::dropIfExists('general_settings');
    }
}
