<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ApPackagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
            DB::table('tbl_ap_packages')->insert([
            [
                'nama' => 'Smart Umrah',
                'PackageCode' => null,
                'Agency' => 0,
                'BranchAgency' => 0,
                'PackageStatus' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nama' => 'Smart Travel',
                'PackageCode' => null,
                'Agency' => 0,
                'BranchAgency' => 0,
                'PackageStatus' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
