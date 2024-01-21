<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GiftCardRecharge extends Model
{
    use HasFactory;
     protected $fillable =[
        "gift_card_id", "amount", "user_id"
    ];
}
