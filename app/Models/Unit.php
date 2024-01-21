<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;
    protected $fillable = ['unit_code','base_unit','short_name','operator','operation_value','status'];   

    public function product()
    {
    	    return $this->hasMany('App/Models/Product');
    }
}