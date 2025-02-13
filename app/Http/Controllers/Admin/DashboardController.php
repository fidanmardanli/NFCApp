<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AccessPoints;
use App\Models\GroupPermissions;
use App\Models\PersonalInformations;
use App\Models\Rooms;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function getAllUsers()
    {
        $users = User::with('personal_informations')->get();

        $users = $users->map(function ($user) {
            return [
                'id' => $user->id,
                'groups_id' => $user->groups_id,
                'personal_information' => [
                    'fullname' => $user->personal_informations->fullName,
                    'uid' => $user->personal_informations->uid,
                    'username' => $user->personal_informations->username,
                    'birthdate' => $user->personal_informations->birthdate,
                    'image' => $user->personal_informations->image,
                ],
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ];
        });

        return response()->json(['success' => true, 'data' => $users]);
    }


    public function getUserDetailedInformation($user_id)
    {
        try {
            $user = User::with('groups.access_points.room', 'has_exceptions.access_point.room', 'cards')->find($user_id);

            if (isset($user)) {
                return response()->json(['success' => true, 'data' => $user]);
            }
            return response()->json(['success' => false, 'error' => 'User not found']);
        } catch (\Throwable $th) {
            return response()->json(['success' => false, 'error' => 'Something went wrong']);
        }
    }

    public function getUserRoomAccesses($user_id)
    {

        $user = User::with('groups.access_points.room', 'has_exceptions.access_point.room')->find($user_id);

        if (!isset($user)) {
            return response()->json(['success' => false, 'error' => 'User not found']);
        }
        $rooms = $user->groups->access_points->pluck('room')->unique('id')->values();

        if ($user->hasException == true) {
            $exceptional_access = $user->has_exceptions->pluck('access_point.room')->unique('id')->values();
        }

        $data = [
            'has_special_access' => $user->hasException,
            'rooms' => $rooms,
            'exceptional_access_rooms' => $exceptional_access ?? null
        ];

        return response()->json(['success' => true, 'data' => $data]);
    }


    public function getRoomAccessibles($room_id)
    {
        $room = Rooms::find($room_id);
        if (!$room) {
            return response()->json(['success' => false, 'error' => 'Room not found']);
        }
        if (!AccessPoints::where('rooms_id', $room_id)->exists()) {
            return response()->json(['success' => false, 'error' => 'Access point not found']);
        }
        $room = $room->load('access_point.groups.users');
        $users = $room->access_point->groups->pluck('users')->flatten()->unique('id')->values();
        return response()->json(['success' => true, 'data' => $users]);
    }

}
