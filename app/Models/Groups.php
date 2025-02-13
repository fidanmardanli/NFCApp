<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Groups extends Model
{
    use HasFactory;

    protected $table = 'groups';
    protected $fillable = [
        'group_name',
        'group_status'
    ];

    public function scopeIsActive($query)
    {
        return $query->where('group_status', 1);
    }

    public function access_points()
    {
        return $this->belongsToMany(AccessPoints::class, 'group_permissions');
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }

}
