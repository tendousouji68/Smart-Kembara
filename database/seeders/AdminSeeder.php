<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Check if the admin with the given email already exists
        if (User::where('email', 'admin@email.com')->exists()) {
            $this->command->info('Admin user already exists.');
            return;
        }

        // Create the admin user if it doesn't exist
        $user = new User();
        $user->password = Hash::make('password');
        $user->email = 'admin@email.com';
        $user->name = 'Admin';
        $user->save();

        $user->assignRole('super-admin');
    }
}
