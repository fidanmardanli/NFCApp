<?php

namespace Database\Seeders;

use App\Models\Groups;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class GroupsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $array = ['Teachers', 'Students', 'Staff'];

        foreach ($array as $value) {
            Groups::create([
                'group_name' => $value,
                'group_status' => 1,
            ]);
        }
    }
}
