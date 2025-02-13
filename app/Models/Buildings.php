<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Buildings extends Model
{
    use HasFactory;

    protected $table = 'buildings';
    protected $fillable = [
        'building_name',
        'building_status'
    ];

    public function scopeIsActive($query)
    {
        return $query->where('building_status', 1);
    }
}
