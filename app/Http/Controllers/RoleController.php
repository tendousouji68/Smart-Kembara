<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function index(Request $request){
        return Inertia::render('Role/RoleList');
    }

    public function indexEdit(Request $request){
        $role = Role::find($request->id);
        $permission = Permission::get()->groupBy('group');
        $checked = $role->permissions->pluck('id');

        return Inertia::render('Role/RoleEdit', compact('role','permission','checked'));
    }

    public function filter(Request $request){
        $search = $request->input('search');
        $paginate = $request->input('paginate', 10);
        $page = $request->input('page', 1);

        $sort_direction = $request->input('sort_direction', 'desc');
        $sort_field = $request->input('sort_field', 'updated_at');

        $role = Role::whereNot('name', 'super-admin')
        ->when($search, function ($query, $search) {
            $query->where('name', 'like', '%'.$search.'%')
                ->orWhere('description', 'like', '%'.$search.'%');
            })
            ->orderBy($sort_field,$sort_direction)
            ->offset(($page - 1) * $paginate)
            ->paginate($paginate);

        return response()->json($role);
    }

    public function create(Request $request){

        $name = str_replace(" ", "-", strtolower($request->name));
        $description = ucwords(strtolower($request->name));

        $role = new Role();
        $role->name = $name;
        $role->description = $description;
        $role->guard_name = 'web';
        $role->save();

        return to_route('role')->with('status', true);
    }

    public function update(Request $request){

        $role = Role::find($request->role_id);
        $permission = Permission::find($request->permission_id);

        if($role->hasPermissionTo($permission->name)){
            $role->revokePermissionTo($permission->name);
        }else{
            $role->givePermissionTo($permission->name);
        }

        return to_route('role.edit',$role->id)->with('status', true);
    }

    public function destroy(Request $request){
        $role = Role::find($request->id);
        $role->delete();

        return to_route('role')->with('status', true);
    }
}
