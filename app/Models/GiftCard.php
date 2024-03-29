<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GiftCard extends Model
{
    use HasFactory;
       protected $fillable =[
        "card_no", "amount", "expense", "customer_id", "user_id", "expired_date", "created_by", "is_active"  
    ];
}
