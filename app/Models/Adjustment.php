<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Adjustment extends Model
{
    use HasFactory;
    protected $fillable =[
        "reference_no", "warehouse_id", "document", "total_qty", "item", 
         "note"   
    ];
}
