<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cards extends Model
{
    use HasFactory;
    protected $table = 'cards';
    protected $fillable = [
        'privileges_id',
        'cardNumber',
        'isActive',
        'validTo'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
