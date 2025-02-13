<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\CardController;
use App\Http\Controllers\RoomsController;
use App\Http\Controllers\RoomController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//admin start
Route::get('getUserDetailedInformation/{user_id}', [DashboardController::class, 'getUserDetailedInformation'])->name('getUserDetailedInformation');
Route::get('getUserRoomAccesses/{user_id}', [DashboardController::class, 'getUserRoomAccesses'])->name('getUserRoomAccesses');
Route::get('getRoomAccessibles/{room_id}', [DashboardController::class, 'getRoomAccessibles'])->name('getRoomAccessibles');
Route::get('getAllUsers', [DashboardController::class, 'getAllUsers'])->name('getAllUsers');


Route::get('getAllRooms', [RoomController::class, 'Index'])->name('getAllRooms');
Route::get('getRoomById/{room_id}', [RoomController::class, 'getRoomById'])->name('getRoomById');

Route::post('updateUserPersonalInformation', [SettingsController::class, 'updateUserPersonalInformation'])->name('updateUserPersonalInformation');
Route::apiResource('rooms', RoomsController::class);

//admin end

//users start
Route::get('getUserById/{id}', [UserController::class, 'getUserDatasById']);
Route::get('getUserDatasByUid/{uid}', [UserController::class, 'getUserDatasByUid']);
Route::get('getUserDatasByUsername/{username}', [UserController::class, 'getUserDatasByUsername']);
//
Route::post('createUser', [UserController::class, 'store']);
Route::post('updateUserById/{id}', [UserController::class, 'updateById']);
Route::post('deleteById/{id}', [UserController::class, 'deleteById']);
Route::get('validateUid/{uid}/{accessPointId}', [UserController::class, 'validateUid']);
Route::post('rooms/create', [RoomController::class, 'create']);

Route::delete('rooms/deleteById/{room_id}', [RoomController::class, 'deleteById']);

//users end

//card start
Route::apiResource('cards', CardController::class);
Route::patch('cards/{id}/deactivate', [CardController::class, 'deactivate'])->name('cards.deactivate');
Route::get('cards/{id}/check-validity', [CardController::class, 'checkValidity'])->name('cards.checkValidity');
//card end


