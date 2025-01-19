<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;  // Dit moet je toevoegen
use App\Models\Portfolio;

class PortfolioSeeder extends Seeder
{
    public function run()
    {
        Portfolio::create([
            'user_id' => 1,
            'title' => 'Awesome Portfolio',
            'description' => 'This is an awesome project where I did amazing things!',
            'link' => 'https://www.example.com',
        ]);
    }
}
