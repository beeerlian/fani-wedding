<?php

use Database\Seeders\Data;
use Illuminate\Database\Seeder;
use Database\Seeders\UserSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(Data::class);
        // Tambahkan seeder lainnya jika diperlukan
    }
}
