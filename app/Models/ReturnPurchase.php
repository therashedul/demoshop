<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReturnPurchase extends Model
{
    use HasFactory;

        protected $fillable =[
        "reference_no", "purchase_id", "user_id", "supplier_id", "warehouse_id", "account_id", "item", "total_qty", "total_discount", "total_tax", "total_cost","order_tax_rate", "order_tax", "grand_total", "document", "return_note", "staff_note"
    ];

    public function supplier()
    {
    	return $this->belongsTo('App\Models\Supplier');
    }

    public function warehouse()
    {
    	return $this->belongsTo('App\Models\Warehouse');
    }

    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }
}