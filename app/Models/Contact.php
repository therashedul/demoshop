<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use App\Models\ContactMail;

class Contact extends Model
{
    use HasFactory;
    protected $fillable = ['name','email','phone','subject','message'];


    public static function boot(){
        parent::boot();
        static::created(function ($item) {
            $adminMail = "superAdmin@gmail.com";
            Mail::to($adminMail)->send(new ContactMail($item));
        });
    }
}