<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blacklist extends Model
{
    use HasFactory;
    protected $table = 'blacklists';
    public $timestamps = true;
    protected $fillable = ['ip', 'user_id'];
}
