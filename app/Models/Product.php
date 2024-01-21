<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_type',
        'product_name',
        'slug',
        'product_code',
        'product_price',
        'product_cost',
        'product_regular_price',
        'product_sell_price',
        
        'product_image',
        'product_details',
        'featured',
        'alert_qty',
        'option',
        'publish_at',
        
        'qty',
        'promotion',
        'promotion_price',
        'start_date',
        'end_date',
        'view',
        'tag',
        'status',
        'trending',

        'variant_option',
        'variant_value',   
        'in_stock',
        'is_active',
        'is_batch',
        'is_variant',
        'is_diffPriceWareHouse',
        'brand_id',
        'tax_method',
        'tax_id',
        'category_id',     
        'unit_id',
        'purchase_unit_id',
        'sale_unit_id',
        'product_list',
        'variant_list',
        'alert_quantity',
        'daily_sale_objective',

        'sale_id'];

        
    public function category()
    {
    	return $this->belongsTo('App\Models\Category');
    }

    public function brand()
    {
    	return $this->belongsTo('App\Models\Brand');
    }

    public function unit()
    {
        return $this->belongsTo('App\Models\Unit');
    }    
    public function tax()
    {
        return $this->belongsTo('App\Models\Tax');
    }

    public function variant()
    {
        return $this->belongsToMany('App\Models\Variant', 'product_variants')->withPivot('id', 'item_code', 'additional_cost', 'additional_price', 'stock','qty');
    }

    public function scopeActiveStandard($query)
    {
        return $query->where([
            ['is_active', true],
            ['product_type', 'standard']
        ]);
    }

    public function scopeActiveFeatured($query)
    {
        return $query->where([
            ['is_active', true],
            ['featured', 1]
        ]);
    }
}