<?php

namespace App\Http\Controllers;

use App\Models\Rooms;
use Illuminate\Http\Request;

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
