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
            ['name'  => 'view.admin', 'description'  => 'View Admin Settings', 'group'  => 'Admin'],

            //Branch
            ['name'  => 'view.branch', 'description'  => 'View Branch', 'group'  => 'Branch'],
            ['name'  => 'create.branch', 'description'  => 'Create Branch', 'group'  => 'Branch'],
            ['name'  => 'edit.branch', 'description'  => 'Edit Branch', 'group'  => 'Branch'],
            ['name'  => 'delete.branch', 'description'  => 'Delete Branch', 'group'  => 'Branch'],

            //Agency
            ['name'  => 'view.agency', 'description'  => 'View Agency', 'group'  => 'Agency'],
            ['name'  => 'create.agency', 'description'  => 'Create Agency', 'group'  => 'Agency'],
            ['name'  => 'edit.agency', 'description'  => 'Edit Agency', 'group'  => 'Agency'],
            ['name'  => 'delete.agency', 'description'  => 'Delete Agency', 'group'  => 'Agency'],

            //Packages
            ['name'  => 'view.package', 'description'  => 'View Package', 'group'  => 'Packages'],
            ['name'  => 'create.package', 'description'  => 'Create Package', 'group'  => 'Packages'],
            ['name'  => 'edit.package', 'description'  => 'Edit Package', 'group'  => 'Packages'],
            ['name'  => 'delete.package', 'description'  => 'Delete Package', 'group'  => 'Packages'],

            //User
            ['name'  => 'view.user', 'description'  => 'View User', 'group'  => 'User'],
            ['name'  => 'create.user', 'description'  => 'Create User', 'group'  => 'User'],
            ['name'  => 'edit.user', 'description'  => 'Edit User', 'group'  => 'User'],
            ['name'  => 'delete.user', 'description'  => 'Delete User', 'group'  => 'User'],

            //Role
            ['name'  => 'view.role', 'description'  => 'View Role', 'group'  => 'Role'],
            ['name'  => 'create.role', 'description'  => 'Create Role', 'group'  => 'Role'],
            ['name'  => 'edit.role', 'description'  => 'Edit Role', 'group'  => 'Role'],
            ['name'  => 'delete.role', 'description'  => 'Delete Role', 'group'  => 'Role'],

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
            ['name'  => 'permohon', 'description'  => 'Permohon'],
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
