<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Variant extends Model
{
    use HasFactory;
      protected $fillable = ['variant_name'];

    public function product()
    {
    	return $this->belongsToMany('App\Models\Variant', 'producat_variants');
    }
}