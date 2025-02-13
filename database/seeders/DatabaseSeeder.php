<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Cards;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(GroupsSeeder::class);
        $this->call(BuildingsSeeder::class);
        $this->call(RoomsSeeder::class);
        $this->call(AccessPointsSeeder::class);
        $this->call(CardsSeeder::class);
        $this->call(GroupPermissionsSeeder::class);

        for ($i = 1; $i <= 50; $i++) {
            User::create([
                'name' => fake()->name(),
                'cards_id' => $i,
                'group_id' => rand(1,3),
                'email' => fake()->unique()->safeEmail(),
                'email_verified_at' => now(),
                'password' => Hash::make('password'),
                'remember_token' => Str::random(10),
            ]);
        }


    }
}
