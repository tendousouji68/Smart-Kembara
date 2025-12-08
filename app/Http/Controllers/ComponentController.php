<?php

namespace App\Http\Controllers;

use App\Models\Component;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Permission\Models\Permission;

class ComponentController extends Controller
{
    public function index(Request $request){
        $component = Component::all();
        $permission = Permission::all();

        return Inertia::render('Component', compact('component', 'permission'));
    }

    public function filter(Request $request){
        $search = $request->input('search');
        $paginate = $request->input('paginate', 10);
        $page = $request->input('page', 1);

        $sort_direction = $request->input('sort_direction', 'desc');
        $sort_field = $request->input('sort_field', 'updated_at');

        $component = Component::when($search, function ($query, $search) {
            $query->where('item', 'like', '%'.$search.'%')
                ->orWhere('color', 'like', '%'.$search.'%')
                ->orWhere('category', 'like', '%'.$search.'%')
                ->orWhere('price', 'like', '%'.$search.'%');
            })
            ->orderBy($sort_field,$sort_direction)
            ->offset(($page - 1) * $paginate)
            ->paginate($paginate);

        return response()->json($component);
    }

    public function store(Request $request){

        $component = $request->id ? Component::find($request->id) : new Component();
        $component->item = $request->item;
        $component->color = $request->color;
        $component->category = $request->category;
        $component->price = $request->price;
        $component->save();

        return to_route('component')->with('status', true);
    }

    public function destroy($id){
        $component = Component::find($id);
        $component->delete();

        return to_route('component')->with('status', true);
    }
}
