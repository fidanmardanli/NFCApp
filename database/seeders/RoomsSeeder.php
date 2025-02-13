<?php

namespace Database\Seeders;

use App\Models\Rooms;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoomsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 10; $i++) {
            Rooms::create([
                'buildings_id' => 1,
                'room_name' => "R".$i,
                'room_type' => "Sinif otağı",
                'room_status' => 1
            ]);
        }
    }
}
