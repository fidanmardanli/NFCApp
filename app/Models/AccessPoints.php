<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccessPoints extends Model
{
    use HasFactory;

    protected $table = 'access_points';
    protected $fillable = [
        'rooms_id',
        'pointNumber',
    ];

    public function room()
    {
        return $this->belongsTo(Rooms::class, 'rooms_id');
    }

    public function groups()
    {
        return $this->belongsToMany(Groups::class, 'group_permissions');
    }

    public function has_exceptions()
    {
        return $this->hasMany(HasExceptions::class);
    }
}
