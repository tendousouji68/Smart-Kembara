<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PackageController;

Route::get('/', function () {
    return view('index');
});

Route::get('/hubungi-kami', function () {
    return view('hubungi-kami');
});

Route::get('/galeri', function () {
    return view('galeri');
});

Route::get('/tentang-kami', function () {
    return view('tentang-kami');
});

// Route::get('/pakej/smart-umrah', function () {
//     return view('pakej.smart-umrah');
// });

Route::get('/pakej/smart-umrah', [PackageController::class, 'showSmartUmrah'])->name('smart-umrah');
Route::get('/pakej/pakej-detail/{id}', [PackageController::class, 'showPackageDetail'])->name('package-detail');

Route::get('/pakej/smart-travel', [PackageController::class, 'showSmartTravel'])->name('smart-travel');  // Tukar daripada view statik

// Route::get('/pakej/smart-travel', function () {
//     return view('pakej.smart-travel');
// });

// Route::get('/pakej-detail', function () {
//     return view('pakej-detail');
// });

// Route::get('/pakej-detail/{id}', [PackageController::class, 'showPackageDetails'])->name('pakej-detail');

Route::get('/galeri/detail1', function () {
    return view('galeridetail1');
});

Route::get('/galeri/detail2', function () {
    return view('galeridetail2');
});
