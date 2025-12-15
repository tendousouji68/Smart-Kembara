<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       //
        Schema::disableForeignKeyConstraints();
        Permission::truncate();
        Role::truncate();
        Schema::enableForeignKeyConstraints();

        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        $arrayOfPermissionNames = [
            //Admin Settings
            ['name'  => 'users.view', 'description'  => 'View User', 'group'  => 'User'],
            ['name'  => 'users.create', 'description'  => 'Create User', 'group'  => 'User'],
            ['name'  => 'users.edit', 'description'  => 'Edit User', 'group'  => 'User'],
            ['name'  => 'users.delete', 'description'  => 'Delete User', 'group'  => 'User'],

            //Role
            ['name'  => 'roles.view', 'description'  => 'View Role', 'group'  => 'Role'],
            ['name'  => 'roles.create', 'description'  => 'Create Role', 'group'  => 'Role'],
            ['name'  => 'roles.edit', 'description'  => 'Edit Role', 'group'  => 'Role'],
            ['name'  => 'roles.delete', 'description'  => 'Delete Role', 'group'  => 'Role'],

            //Packages
            ['name'  => 'packages.view', 'description'  => 'View Package', 'group'  => 'Packages'],
            ['name'  => 'packages.create', 'description'  => 'View Package', 'group'  => 'Packages'],
            ['name'  => 'packages.edit', 'description'  => 'View Package', 'group'  => 'Packages'],
            ['name'  => 'packages.delete', 'description'  => 'View Package', 'group'  => 'Packages'],

        ];

        $permissions = collect($arrayOfPermissionNames)->map(function ($permission) {
            return [
                'name' => $permission['name'],
                'description' => $permission['description'],
                'guard_name' => 'web',
                'group' => $permission['group']
            ];
        });

        Permission::insert($permissions->toArray());

        $arrayOfRoleNames = [
            ['name'  => 'super-admin', 'description'  => 'Super Admin'],
            ['name'  => 'administrator', 'description'  => 'Administrator'],
            ['name'  => 'chief-executive-officer', 'description'  => 'Chief Executive Officer'],
            ['name'  => 'chief-operation-officer', 'description'  => 'Chief Operation Officer'],
            ['name'  => 'chief-finance-officer', 'description'  => 'Chief Finance Officer'],
            ['name'  => 'manager', 'description'  => 'Manager'],
            ['name'  => 'human-resources', 'description'  => 'Human Resources'],
            ['name'  => 'finance', 'description'  => 'Finance'],
            ['name'  => 'software-engineer', 'description'  => 'Software Engineer'],
            ['name'  => 'technical-engineer', 'description'  => 'Technical Engineer'],
            ['name'  => 'operation-engineer', 'description'  => 'Operation Engineer'],
            ['name'  => 'agent', 'description'  => 'Agent'],
            ['name'  => 'pemohon', 'description'  => 'Pemohon'],
            ['name'  => 'chief-technology-officer', 'description'  => 'Chief Technology Officer'],
        ];

        $roles = collect($arrayOfRoleNames)->map(function ($role) {
            return [
                'name' => $role['name'],
                'description' => $role['description'],
                'guard_name' => 'web',
            ];
        });

        Role::insert($roles->toArray());

        $allPermission = Permission::all();
        $superAdmin = Role::where('name', 'super-admin')->first();

        $superAdmin->givePermissionTo($allPermission);
    }
}
