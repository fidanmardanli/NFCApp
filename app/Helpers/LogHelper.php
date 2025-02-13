<?php

namespace App\Helpers;

use App\Models\Logs;
use Illuminate\Support\Facades\Auth;

class LogHelper
{
    /**
     * Log an action in the database.
     *
     * @param int|null $access_point_id
     * @param int|null $card_id
     * @param string $action
     */
    public static function logAction($access_point_id = null, $card_id = null, $action)
    {
        Logs::create([
            'user_id' => Auth::id(), // Get the authenticated user's ID
            'access_points_id' => $access_point_id,
            'cards_id' => $card_id,
            'action' => $action,
        ]);
    }
}
