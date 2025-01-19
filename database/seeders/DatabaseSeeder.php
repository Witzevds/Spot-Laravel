<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Portfolio;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Maak 10 gebruikers aan met portfolios
        User::factory(10)->has(Portfolio::factory()->count(3))->create();
    }
}
