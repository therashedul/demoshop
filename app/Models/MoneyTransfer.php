<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MoneyTransfer extends Model
{
    use HasFactory;
    protected $fillable = ['reference_no', 'from_account_id', 'to_account_id', 'amount'];

    public function fromAccount()
    {
    	return $this->belongsTo('App\Models\Account');
    }

    public function toAccount()
    {
    	return $this->belongsTo('App\Models\Account');
    }
}
