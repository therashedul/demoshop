<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    use HasFactory;
      protected $fillable =[
        "reference_no", "sale_id", "user_id","courier_id", "address", "delivered_by", "recieved_by", "file", "status", "note"
    ];

    public function sale()
    {
    	return $this->belongsTo("App\Models\Sale");
    }

    public function user()
    {
    	return $this->belongsTo("App\Models\User");
    }    
    public function courier()
    {
    	return $this->belongsTo("App\Models\Courier");
    }
}
