<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductAdjustment extends Model
{
    use HasFactory;
    // protected $table = 'product_adjustments';
    protected $fillable =[
        "adjustment_id", "product_id", "variant_id", "qty", "action"
    ];
}
