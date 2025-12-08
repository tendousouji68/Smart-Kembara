<?php

namespace Database\Seeders;

use App\Models\Component;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ComponentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('components')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        Component::insert([
            ['item' => 'Apple MacBook Pro 17"', 'color' => 'Silver', 'category' => 'Laptop', 'price' => 2999],
            ['item' => 'Microsoft Surface Pro', 'color' => 'White', 'category' => 'Laptop PC', 'price' => 1999],
            ['item' => 'Magic Mouse 2', 'color' => 'Black', 'category' => 'Accessories', 'price' => 99],
            ['item' => 'Google Pixel Phone', 'color' => 'Gray', 'category' => 'Phone', 'price' => 799],
            ['item' => 'Apple Watch 5', 'color' => 'Red', 'category' => 'Wearables', 'price' => 999],
        ]);
    }
}
