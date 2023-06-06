<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $categories = ['Electronics', 'Clothing', 'Home', 'Sports', 'Books'];
        return [
            'name' => $this->faker->word,
            'category' => $this->faker->randomElement($categories),
            'description' => $this->faker->paragraph,
            'datetime' => $this->faker->dateTime,
            'created_at' => $this->faker->dateTime,
            'updated_at' => $this->faker->dateTime,
        ];
    }
}
