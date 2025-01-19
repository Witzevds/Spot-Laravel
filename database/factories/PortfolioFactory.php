<?php

namespace Database\Factories;

use App\Models\Portfolio;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class PortfolioFactory extends Factory
{
    /**
     * De naam van het bijbehorende model.
     *
     * @var string
     */
    protected $model = Portfolio::class;

    /**
     * Definieer het model's standaardstaat.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(),
            'description' => $this->faker->paragraph(),
            'link' => $this->faker->url(),
            'user_id' => User::factory(), // Koppelt een bestaande of nieuw aangemaakte gebruiker
        ];
    }
}
