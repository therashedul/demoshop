<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;
    protected $fillable =[
        "date", "employee_id", "user_id",
        "checkin", "checkout", "status", "note"
    ];
}
