<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentWithCreditCard extends Model
{
    use HasFactory;
    protected $fillable =[
        "payment_id", "customer_id", "customer_stripe_id", "charge_id"
    ];
}