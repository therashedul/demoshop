<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Returns extends Model
{
    use HasFactory;
  
	protected $table = 'returns';
    protected $fillable =[
        'reference_no', 
        'user_id', 
        'sale_id',
        'cash_register_id', 
        'customer_id', 
        'warehouse_id', 
        'biller_id', 
        'account_id', 
        'item', 
        'total_qty', 
        'total_discount', 
        'total_tax', 
        'total_price',
        'order_tax_rate', 
        'order_tax', 
        'grand_total', 
        'document', 
        'return_note',
        'staff_note'
    ];
    protected $casts = [ 
        'product_batch_id' => 'array'
    ];


    public function biller()
    {
    	return $this->belongsTo('App\Models\Biller');
    }

    public function customer()
    {
    	return $this->belongsTo('App\Models\Customer');
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