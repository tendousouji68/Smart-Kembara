<?php

use App\Http\Controllers\PackageController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SubpackageController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::resource("users", UserController::class)
                    ->only(['create', 'store'])
                    ->middleware("permission:users.create");
                 
Route::resource("users", UserController::class)
                    ->only(['edit', 'update'])
                    ->middleware("permission:users.edit");        
                    
Route::resource("users", UserController::class)
                    ->only(['destroy'])
                    ->middleware("permission:users.delete");     

Route::resource("users", UserController::class)
                    ->only(['index', 'show'])
                    ->middleware("permission:users.create|users.edit|users.delete|users.view");    
                    
Route::resource("roles", RoleController::class)
                    ->only(['create', 'store'])
                    ->middleware("permission:roles.create");

Route::resource("roles", RoleController::class)
                    ->only(['edit', 'update'])
                    ->middleware("permission:roles.edit");

Route::resource("roles", RoleController::class)
                    ->only(['destroy'])
                    ->middleware("permission:roles.delete");   
                    
Route::resource("roles", RoleController::class)
                    ->only(['index', 'show'])
                    ->middleware("permission:roles.create|roles.edit|roles.delete|roles.view");    

Route::resource("packages", PackageController::class)
                    ->only(['create', 'store'])
                    ->middleware("permission:packages.create");
Route::resource("packages", PackageController::class)
                    ->only(['edit', 'update'])
                    ->middleware("permission:packages.edit");

Route::resource("packages", PackageController::class)
                    ->only(['destroy'])
                    ->middleware("permission:packages.delete");   

Route::resource("packages", PackageController::class)
                    ->only(['index', 'show'])
                    ->middleware("permission:packages.create|packages.edit|packages.delete|packages.view");   

Route::resource("subpackages", SubpackageController::class);

require __DIR__.'/settings.php';
