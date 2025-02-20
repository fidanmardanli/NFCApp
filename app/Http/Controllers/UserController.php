<?php

namespace App\Http\Controllers;

use App\Models\PersonalInformations;
use App\Models\User;
use App\Models\Logs;
use App\Models\GroupPermissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class UserController extends Controller
{
//    public function getAllUsers()
//    {
//        $users = User::with('personal_informations', 'cards')->get();
//
//        $users = $users->map(function ($user) {
//            return [
//                'id' => $user->id,
//                'cardId' => $user->cardId,
//                'personal_information' => [
//                    'fullname' => $user->personal_informations->fullName,
//                    'uid' => $user->uid,
//                    'username' => $user->username,
//                    'birthdate' => $user->birthdate,
//                    'image' => $user->image,
//                ],
//                'created_at' => $user->created_at,
//                'updated_at' => $user->updated_at,
//            ];
//        });
//
//        return response()->json(['success' => true, 'data' => $users]);
//    }

    public function getUserDatasById($id)
    {
        $user = User::with('personal_informations', 'cards')->find($id);

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
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

        return response()->json(['success' => true, 'data' => $user]);
    }

    public function getUserDatasByUid($uid)
    {
        $user = User::with('personal_informations', 'cards')->where('uid',$uid)->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Transform the data into a nested structure
        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
            'personal_information' => [
                'fullname' => $user->fullname,
                'uid' => $user->uid,
                'username' => $user->username,
                'birthdate' => $user->birthdate,
                'image' => $user->image,
            ],
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['success' => true, 'data' => $user]);
    }


    public function store(Request $request)
    {
        $data  = $request->all();
$request->name;
        $user = User::create($data);
        if(!$user)
        {
            return response()->json(['success' => false, 'message' => 'User not created']);
        }

        $userPersonalInformations = [
            'user_id' => $user->id,
            'uid' => $request->uid,
            'fullName' => $request->fullname,
            'username' => $request->username,
            'birthdate' => $request->birthdate,
            'myRoomID' => $request->myRoomID,
        ];

        $personal_informations = PersonalInformations::create($userPersonalInformations);
        if(!$personal_informations)
        {
            return response()->json(['success' => false, 'message' => 'User created successfully but personal informations not created. Please try again']);
        }

        return response()->json(['success' => true, 'message' => 'User created']);
    }


    private function logAccessAttempt($userId, $accessPointId, $cardId, $action)
    {
        Logs::create([
            'user_id' => $userId,
            'access_point_id' => $accessPointId,
            'card_id' => $cardId,
            'action' => $action
        ]);
    }



    public function validateUid($uid, $accessPointId)
    {
        // Validate UID format (e.g., "1234 5678 9012 3456")
        $pattern = '/^\d{4} \d{4} \d{4} \d{4}$/';
        if (preg_match($pattern, $uid) !== 1) {
            return response()->json(['success' => false, 'message' => 'Invalid format'], 400);
        }

        // Find the user with the given UID and load necessary relationships
        $user = PersonalInformations::where('uid', $uid)
            ->with(['user', 'user.groups'])
            ->first();

        if (!$user || !$user->user) {
            // Log the denied entry attempt (user not found)
            DB::table('logs')->insert([
                'user_id' => 0, // Use 0 instead of null for system logs
                'access_point_id' => $accessPointId,
                'card_id' => 1, // Default card ID (modify based on logic)
                'action' => 'entry denied'
            ]);

            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Ensure groups are loaded before accessing them
        if (!$user->user->groups || $user->user->groups->isEmpty()) {
            return response()->json(['success' => false, 'message' => 'User has no group assigned'], 403);
        }

        // Check if the user has access to the specified access point
        $hasAccess = $user->user->groups->pluck('id')->contains(function ($groupId) use ($accessPointId) {
            return GroupPermissions::where('groups_id', $groupId)
                ->where('access_points_id', $accessPointId)
                ->exists();
        });

        // Log the access attempt (entry granted or denied)
        DB::table('logs')->insert([
            'user_id' => $user->user_id, // Correct user ID from user relationship
            'access_point_id' => $accessPointId,
            'card_id' => 1, // If a card is linked, update it accordingly
            'action' => $hasAccess ? 'entry granted' : 'entry denied'
        ]);

        // If the user does not have access, deny entry
        if (!$hasAccess) {
            return response()->json(['success' => false, 'message' => 'Access denied'], 403);
        }

        // Return user information if access is granted
        return response()->json(['success' => true, 'data' => $user]);
    }




    public function store1(Request $request)
    {
        try {
            $userId = DB::table('users')->insertGetId([
                'cardId' => $request->cardId,
                'created_at' => now(),
                'updated_at' => null,
            ]);

            // Step 2: Insert into personal_information using the generated userId
            DB::table('personal_information')->insert([
                'userId' => $userId, // Explicitly set userId to avoid error
                'fullname' => $request->fullname,
                'uid' => $request->uid,
                'username' => $request->username,
                'birthdate' => $request->birthdate,
                'image' => $request->profile_image,
                'created_at' => now(),
            ]);

            $user = DB::table('users')
                ->join('personal_information', 'users.id', '=', 'personal_information.userId')
                ->where('users.id', $userId)
                ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
                ->first();

            // Transform the data into a nested structure
            $user = [
                'id' => $user->id,
                'cardId' => $user->cardId,
                'personal_information' => [
                    'fullname' => $user->fullname,
                    'uid' => $user->uid,
                    'username' => $user->username,
                    'birthdate' => $user->birthdate,
                    'image' => $user->image,
                ],
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ];

            return response()->json(['success' => true, 'data' => $user]);

        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    public function updateById(Request $request, $id)
    {
        try {
            $user = DB::table('users')->where('id', $id)->first();

            if (!$user) {
                return response()->json(['success' => false, 'message' => 'User not found'], 404);
            }

            // Update personal_information
            DB::table('personal_information')
                ->where('userId', $id)
                ->update([
                    'fullname' => $request->fullname,
                    'uid' => $request->uid,
                    'username' => $request->username,
                    'birthdate' => $request->birthdate,
                    'image' => $request->profile_image,
                    'created_at' => $request->created_at ?? now(),
                ]);

            // Update users table
            DB::table('users')
                ->where('id', $id)
                ->update([
                    'updated_at' => now(),
                ]);

            // Fetch the updated user with nested personal information
            $user = DB::table('users')
                ->join('personal_information', 'users.id', '=', 'personal_information.userId')
                ->where('users.id', $id)
                ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
                ->first();

            // Transform the data into a nested structure
            $user = [
                'id' => $user->id,
                'cardId' => $user->cardId,
                'personal_information' => [
                    'fullname' => $user->fullname,
                    'uid' => $user->uid,
                    'username' => $user->username,
                    'birthdate' => $user->birthdate,
                    'image' => $user->image,
                ],
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ];

            return response()->json(['success' => true, 'data' => $user]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    public function getUserDatasByUsername($username)
    {
        $user = DB::table('users')
            ->join('personal_information', 'users.id', '=', 'personal_information.userId')
            ->where('personal_information.username', $username)
            ->select('users.*', 'personal_information.fullname', 'personal_information.uid', 'personal_information.username', 'personal_information.birthdate', 'personal_information.image')
            ->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found'], 404);
        }

        // Transform the data into a nested structure
        $user = [
            'id' => $user->id,
            'cardId' => $user->cardId,
            'personal_information' => [
                'fullname' => $user->fullname,
                'uid' => $user->uid,
                'username' => $user->username,
                'birthdate' => $user->birthdate,
                'image' => $user->image,
            ],
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['success' => true, 'data' => $user]);
    }

    public function deleteById($id)
    {
        try {
            $user = DB::table('users')->where('id', $id)->first();

            if (!$user) {
                return response()->json(['success' => false, 'message' => 'User not found'], 404);
            }

            // Delete personal information first
            DB::table('personal_information')->where('userId', $id)->delete();

            // Delete user
            DB::table('users')->where('id', $id)->delete();

            return response()->json(['success' => true, 'message' => 'User deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }
}
