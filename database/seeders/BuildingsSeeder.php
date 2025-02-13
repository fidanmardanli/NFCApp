<?php

namespace Database\Seeders;

use App\Models\Buildings;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BuildingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Buildings::create([
            'building_name' => "B1",
            'building_status' => 1
        ]);
    }
}
