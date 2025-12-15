<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User; // Make sure to import the User model
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    public function run()
    {
        // Create the 'user' role if it doesn't already exist
        $role = Role::firstOrCreate(['name' => 'user']);

        // Create a new user
        $user = User::create([
            'name' => 'User001',  // Change the name as needed
            'email' => 'user@gmail.com',  // Change the email as needed
            'password' => bcrypt('1'),  // Use a secure password in production
        ]);

        // Assign the 'user' role to the newly created user
        $user->assignRole('user');
    }
}
