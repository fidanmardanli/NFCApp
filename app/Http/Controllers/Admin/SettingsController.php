<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HistoryLogs;
use App\Models\User;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SettingsController extends Controller
{
    public function updateUserPersonalInformation(Request $req)
    {
        try {
            DB::beginTransaction();
            // Find user with relationships
            $user = User::with('personal_informations', 'cards')->find($req->user_id);

            // Check if user exists
            if (!$user) {
                return response()->json(['success' => false, 'error' => 'User not found']);
            }

            // Initialize history log data
            $old_personal = null;
            $new_personal = null;

            // Check if personal information exists before updating
            if ($user->personal_informations) {
                // Store old personal information before update
                $old_personal = json_encode($user->personal_informations->toArray());

                // Update fields
                $user->personal_informations->fullName = $req->fullName;
                $user->personal_informations->username = $req->username;
                $user->personal_informations->birthdate = $req->birthdate;
                
                // $user->personal_informations->email = $req->email;
                
                // Save changes
                $user->personal_informations->save();

                // Store new personal information after update
                $new_personal = json_encode($user->personal_informations->toArray());

                // Log changes
                HistoryLogs::create([
                    'model' => 'PersonalInformation',
                    'from' => $old_personal,
                    'to' => $new_personal,
                ]);
            }

            // Initialize history log data for cards
            $old_card = null;
            $new_card = null;

            // Check if card exists before updating
            if ($user->cards) {
                // Store old card data before update
                $old_card = json_encode($user->cards->toArray());

                // Update card fields
                $user->cards->cardNumber = $req->cardNumber;
                $user->cards->isActive = $req->isActive;
                $user->cards->validTo = $req->validTo;

                // Save card changes
                $user->cards->save();

                // Store new card data after update
                $new_card = json_encode($user->cards->toArray());

                // Log changes for cards
                HistoryLogs::create([
                    'model' => 'Card',
                    'from' => $old_card,
                    'to' => $new_card,
                ]);

                DB::commit();
                return response()->json(['success' => true, 'message' => 'User personal information and card updated successfully']);
            }
        } catch (\Throwable $th) {
            return $th->getMessage();
            DB::rollBack();
            return response()->json(['success' => false, 'message' => 'Something went wrong']);
        }

        
    }

}
