<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    use HasFactory;
      protected $fillable = ['name','image','company_name', 'vat_number', 'email','phone_number','address','city','state','postal_code','country','is_active'];
}