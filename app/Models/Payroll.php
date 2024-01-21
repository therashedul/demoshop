<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    use HasFactory;
    protected $fillable =[
        "reference_no", "employee_id", "account_id", "user_id",
        "amount", "paying_method", "note"
    ];

    public function employee()
    {
    	return $this->belongsTo('App\Models\Employee');
    }
}
