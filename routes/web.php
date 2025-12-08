<?php

use App\Http\Controllers\ComponentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // return Inertia::render('Welcome', [
    //     'canLogin' => Route::has('login'),
    //     'canRegister' => Route::has('register'),
    //     'laravelVersion' => Application::VERSION,
    //     'phpVersion' => PHP_VERSION,
    // ]);
    return to_route('login');
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/component', [ComponentController::class, 'index'])->name('component');
    Route::post('component/filter', [ComponentController::class, 'filter'])->name('component.filter');
    Route::post('component/store', [ComponentController::class, 'store'])->name('component.store');
    Route::post('component/update', [ComponentController::class, 'update'])->name('component.update');
    Route::delete('component/destroy/{id}', [ComponentController::class, 'destroy'])->name('component.destroy');

    Route::get('/profile/{id?}', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::get('user', [UserController::class, 'index'])->name('user');
    Route::post('user/filter', [UserController::class, 'filter'])->name('user.filter');
    Route::post('user/create', [UserController::class, 'create'])->name('user.create');
    Route::delete('user/destroy/{id}', [UserController::class, 'destroy'])->name('user.destroy');

    Route::get('role', [RoleController::class, 'index'])->name('role');
    Route::post('role/filter', [RoleController::class, 'filter'])->name('role.filter');
    Route::get('role/edit/{id}', [RoleController::class, 'indexEdit'])->name('role.edit');
    Route::post('role/create', [RoleController::class, 'create'])->name('role.create');
    Route::post('role/update', [RoleController::class, 'update'])->name('role.update');
    Route::delete('role/destroy/{id}', [RoleController::class, 'destroy'])->name('role.destroy');
});

require __DIR__.'/auth.php';
