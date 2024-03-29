<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $fillable =[
        "name", "image", "department_id", "email", "phone_number",
        "user_id", "address", "city", "country", "is_active"
    ];

    public function payroll()
    {
    	return $this->hasMany('App\Models\Payroll');
    }
}
