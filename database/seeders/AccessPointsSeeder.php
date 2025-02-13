<?php

namespace Database\Seeders;

use App\Models\AccessPoints;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AccessPointsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 10; $i++) {
            AccessPoints::create([
                'room_id' => rand(1, 10),
                'pointNumber' => "POINT-".$i
            ]);
        }
    }
}
