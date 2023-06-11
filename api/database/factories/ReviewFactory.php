<?php

namespace Database\Factories;

use App\Models\customer;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        $cust=customer::all()->random();
        return [
            'customer_id' => $cust->id,
            'name' => $this->faker->firstName(),
            'review' => 'Cukup baik',
            'category' => 'Makeup',
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
