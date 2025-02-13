<?php

namespace Database\Seeders;

use App\Models\GroupPermissions;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class GroupPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 0; $i < 10; $i++) {
            GroupPermissions::create([
                'groups_id' => rand(1,3),
                'access_points_id' => rand(1,10),
                'status' => 1
            ]);
        }
    }
}
