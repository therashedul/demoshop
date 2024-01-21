<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hitlog extends Model
{
    use HasFactory;
    protected $table = 'hitlogs';
	public $timestamps = true;
    protected $fillable = ['ip', 'view', 'browser','mobile_number','link','device','device_os','brand','model','width','height','spent_time'];
}