<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RewardPointSetting extends Model
{
    use HasFactory;
        protected $fillable = ["per_point_amount", "minimum_amount", "duration", "type", "is_active"];
}
