<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Holiday extends Model
{
    use HasFactory;
    protected $fillable = ["user_id", "from_date", "to_date", "note", "is_approved"];

    public static function createHoliday($data) {
    	Holiday::create($data);
    }

    public function user() {
    	return $this->belongsTo('App\Models\User');
    }
}
