<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rooms extends Model
{
    use HasFactory;
    protected $table = 'rooms';
    protected $fillable = [
        'buildings_id',
        'room_name',
        'room_type',
        'room_status'
    ];

    public function scopeIsActive($query)
    {
        return $query->where('room_status', 1);
    }

    public function building()
    {
        return $this->belongsTo(Buildings::class);
    }
    public function access_point()
    {
        return $this->hasOne(AccessPoints::class);
    }
}
