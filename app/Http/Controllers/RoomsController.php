<?php

namespace App\Http\Controllers;

use App\Models\Rooms;
use Illuminate\Http\Request;

class RoomsController extends Controller
{
    /**
     * Display a listing of the rooms.
     */
    public function index()
    {
        $rooms = Rooms::with('building', 'access_point')->isActive()->get();

        return response()->json([
            'success' => true,
            'data' => $rooms
        ]);
    }

    /**
     * Store a newly created room.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'buildings_id' => 'required|exists:buildings,id',
            'room_name' => 'required|string|max:255',
            'room_type' => 'required|string|max:255',
            'room_status' => 'required|boolean'
        ]);

        $room = Rooms::create($validatedData);

        return response()->json([
            'success' => true,
            'message' => 'Room created successfully',
            'data' => $room
        ], 201);
    }

    /**
     * Display the specified room.
     */
    public function show($id)
    {
        $room = Rooms::with('building', 'access_point')->find($id);

        if (!$room) {
            return response()->json([
                'success' => false,
                'message' => 'Room not found'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $room
        ]);
    }

    /**
     * Update the specified room.
     */
    public function update(Request $request, $id)
    {
        $room = Rooms::find($id);

        if (!$room) {
            return response()->json([
                'success' => false,
                'message' => 'Room not found'
            ], 404);
        }

        $validatedData = $request->validate([
            'buildings_id' => 'sometimes|exists:buildings,id',
            'room_name' => 'sometimes|string|max:255',
            'room_type' => 'sometimes|string|max:255',
            'room_status' => 'sometimes|boolean'
        ]);

        $room->update($validatedData);

        return response()->json([
            'success' => true,
            'message' => 'Room updated successfully',
            'data' => $room
        ]);
    }

    /**
     * Remove the specified room.
     */
    public function destroy($id)
    {
        $room = Rooms::find($id);

        if (!$room) {
            return response()->json([
                'success' => false,
                'message' => 'Room not found'
            ], 404);
        }

        $room->delete();

        return response()->json([
            'success' => true,
            'message' => 'Room deleted successfully'
        ]);
    }
}
