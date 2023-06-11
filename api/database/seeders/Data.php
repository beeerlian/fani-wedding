<?php

namespace Database\Seeders;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class Data extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([[
            'name' => 'rico',
            'email' => 'rico@gmail.com',
            'number' => '1234567890',
            'password' => Hash::make('12345678'),
            'role' => 'admin',
            'address' => '123 Main Street',
            'created_at' => now(),
            'updated_at' => now(),
        ],
        [
            'name' => 'rizqi',
            'email' => 'rizqi@gmail.com',
            'number' => '1234567890',
            'password' => Hash::make('12345678'),
            'role' => 'user',
            'address' => '123 Main Street',
            'created_at' => now(),
            'updated_at' => now(),
        ],
    ],
    );
    }
}
