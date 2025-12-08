<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request){
        $roles = Role::when(!auth()->user()->hasRole('super-admin'), function ($query) {
            $query->where('name', '!=', 'super-admin');
        })->get();

        return Inertia::render('User/UserList', compact('roles'));
    }

    public function filter(Request $request){
        $search = $request->input('search');
        $paginate = $request->input('paginate', 10);
        $page = $request->input('page', 1);

        $sort_direction = $request->input('sort_direction', 'desc');
        $sort_field = $request->input('sort_field', 'updated_at');

        $site = User::with('roles:id,description')->when($search, function ($query, $search) {
            $query->where('name', 'like', '%'.$search.'%')
                ->orWhere('email', 'like', '%'.$search.'%');
            })
            ->orderBy($sort_field,$sort_direction)
            ->offset(($page - 1) * $paginate)
            ->paginate($paginate);

        return response()->json($site);
    }

    public function create(Request $request){
        $user = new User();
        $user->name = $request->name ;
        $user->email = $request->email ;
        $user->password = Hash::make('password') ;
        $user->save();

        $role = Role::find($request->role);
        $user->assignRole($role->name);

        return to_route('user')->with('status', true);
    }

    public function destroy(Request $request){
        $user = User::find($request->id);
        $user->delete();

        return to_route('user')->with('status', true);
    }
}
