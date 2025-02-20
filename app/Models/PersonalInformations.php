<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonalInformations extends Model
{
    use HasFactory;
    protected $table = 'personal_informations';
    protected $fillable = [
        'user_id',
        'uid',
        'fullName',
        'username',
        'birthdate',
        'gender',
        'image',
        'myRoomID',

    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
