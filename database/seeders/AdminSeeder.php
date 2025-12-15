<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User; // Import your User model
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class AdminSeeder extends Seeder
{
    public function run()
    {
        // Create the admin role if it doesn't exist
        $role = Role::firstOrCreate(['name' => 'admin']);

        // Create an admin user
        $admin = User::create([
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('1'),  // Use a secure password in production
        ]);

        // Assign the admin role to the user
        $admin->assignRole('super-admin');

        // Get all permissions and assign them to the admin role
        $permissions = Permission::all();
        $role->givePermissionTo($permissions);
    }
}
