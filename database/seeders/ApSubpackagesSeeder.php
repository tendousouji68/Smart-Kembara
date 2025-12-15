<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ApSubpackagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('tbl_ap_subpackages')->insert([
            [
                'package_id' => 1,
                'name' => 'Super Ekonomi',
                'picture' => 'pakejsm1.webp',
                'description' => '12 hari 10 malam',
                'price' => '6,490',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'package_id' => 1,
                'name' => 'Ekonomi',
                'picture' => 'pakejsm2.webp',
                'description' => '12 hari 10 malam',
                'price' => '130,000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'package_id' => 1,
                'name' => 'Premium',
                'picture' => 'pakejsm3.webp',
                'description' => '12 hari 10 malam',
                'price' => '150,000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'package_id' => 2,
                'name' => 'Basic',
                'picture' => 'pakejst1.webp',
                'description' => '12 hari 10 malam',
                'price' => '80,000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'package_id' => 2,
                'name' => 'Pro',
                'picture' => 'pakejst2.webp',
                'description' => '12 hari 10 malam',
                'price' => '100,000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'package_id' => 2,
                'name' => 'Pro Max',
                'picture' => 'pakejst3.webp',
                'description' => '12 hari 10 malam',
                'price' => '200,000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
