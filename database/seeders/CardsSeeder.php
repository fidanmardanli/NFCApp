<?php

namespace Database\Seeders;

use App\Models\Cards;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CardsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        for ($i = 0; $i < 50; $i++) {
            Cards::create([
                'cardNumber' => "1201010".$i,
                'validTo' => Carbon::now()->addDays(30),
                'isActive' => true,
            ]);
        }
    }
}
