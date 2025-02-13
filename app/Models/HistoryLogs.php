<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryLogs extends Model
{
    use HasFactory;

    protected $table = 'history_logs';
    protected $fillable = [
        'model',
        'from',
        'to',
    ];
}
