<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasExceptions extends Model
{
    use HasFactory;
    protected $table = 'has_exceptions';
    protected $fillable = [
        'access_point_id',
        'user_id',
        'status',
    ];

    public function access_point()
    {
        return $this->belongsTo(AccessPoints::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
