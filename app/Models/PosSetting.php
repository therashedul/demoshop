<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosSetting extends Model
{
    use HasFactory;
        protected $fillable =[
        "customer_id", 
        "warehouse_id", 
        "biller_id", 
        "product_number", 
        "options", 
        "stripe_public_key", 
        "stripe_secret_key", 
        "keybord_active",
        "paypal_live_api_username", 
        "is_table",
        "paypal_live_api_secret", 
        "paypal_live_api_password", 
        "payment_options",
        "invoice_option"];
}



