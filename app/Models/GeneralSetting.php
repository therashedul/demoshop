<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GeneralSetting extends Model
{
    use HasFactory;
    protected $fillable =[

        "site_title", "site_logo", "is_rtl", "currency", "currency_position", "staff_access", "date_format", "theme", "developed_by", "invoice_format", "state"
    ];
}
