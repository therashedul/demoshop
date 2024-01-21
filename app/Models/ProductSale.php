<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSale extends Model
{
    use HasFactory;
    protected $table = 'product_sales';
        protected $fillable =[
        'sale_id', 
        'product_variant_id', 
        'product_id', 
        'product_batch_id', 
        'variant_id', 
        'imei_number', 
        'qty', 
        'sale_unit_id', 
        'net_unit_price', 
        'discount', 
        'tax_rate', 
        'tax', 
        'total'
        ];
        public function ProductVariant()
        {
            return $this->belongsTo('App\Models\ProductVariant');
        } 
}
