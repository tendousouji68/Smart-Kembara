<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GiStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tbl_gi_status')->insert([
            [
                'GeneralStatus' => 'Active',
                'Remarks' => 'Aktiviti secara general yang aktif',
            ],
            [
                'GeneralStatus' => 'Passive',
                'Remarks' => 'Aktiviti secara general yang tidak aktif',
            ],
        ]);
    }
}
