<?php

namespace App\Http\Controllers;

use App\Models\Rooms;
use App\Models\AccessPoints;
use App\Models\Logs;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoomController extends Controller
{
    public function index(){
        $allRooms = Rooms::all();
        return response()->json($allRooms);
    }

    public function getRoomById($room_id){
        $room= Rooms::find($room_id);
        if (!$room) {
            return response()->json(['message' => 'Room not found'], 404);
        }

        return response()->json($room, 200);
    }

    public function whoEnteredMyRoom()
    {
        $room_id = Auth::user()->personal_informations->myRoomID;

        // Step 1: Find the room by its ID
        $my_room = Rooms::find($room_id);
        if (!$my_room) {
            return response()->json(['success' => false, 'message' => 'Room not found'], 404);
        }

        // Step 2: Find the related access point
        $accessPoint = AccessPoints::where('room_id', $room_id)->first();
        if (!$accessPoint) {
            return response()->json(['success' => false, 'message' => 'Access point not found for this room'], 404);
        }

        // Step 3: Find logs and extract unique names
        $userNames = Logs::where('access_point_id', $accessPoint->id)
            ->join('personal_informations', 'logs.user_id', '=', 'personal_informations.user_id')
            ->pluck('personal_informations.fullName')
            ->unique()
            ->values(); // Reset array keys

        // If no one entered, return a meaningful message
        if ($userNames->isEmpty()) {
            return response()->json([
                'success' => true,
                'data' => 'There is no one entered your room yet'
            ]);
        }

        return response()->json([
            'success' => true,
            'data' => $userNames
        ]);
    }


    public function create(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'buildings_id' => 'required|exists:buildings,id',
            'room_name' => 'required|string|max:255',
            'room_type' => 'required|string|max:255',
            'room_status' => 'required|boolean',
        ]);

        // Create a new room
        $room = Rooms::create($validatedData);

        // Return success response
        return response()->json([
            'message' => 'Room created successfully',
            'room' => $room
        ], 201);
    }

    public function deleteById($room_id){
        // Find the room by ID
        $room = Rooms::find($room_id);

        // Check if the room exists
        if (!$room) {
            return response()->json([
                'message' => 'Room not found'
            ], 404);
        }

        // Delete the room
        $room->delete();

        // Return success response
        return response()->json([
            'message' => 'Room deleted successfully'
        ], 200);
    }
}
