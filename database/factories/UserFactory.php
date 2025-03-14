<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class UserFactory extends Factory
{
    /**
     * De naam van het bijbehorende model.
     *
     * @var string
     */
    protected $model = User::class;

    /**
     * Definieer het model's standaardstaat.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name(),
            'email' => $this->faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => Hash::make('password123'), // Default password
            'remember_token' => Str::random(10),
        ];
    }
}
