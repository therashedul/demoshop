<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    use HasFactory;
       protected $fillable=['promotion_name','product_id','promotion_price','start_date','end_date','publish_at','qty','status'];
}