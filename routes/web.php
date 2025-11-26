<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
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

Route::get('/pakej/smart-umrah', function () {
    return view('pakej.smart-umrah');
});

Route::get('/pakej-detail', function () {
    return view('pakej-detail');
});

Route::get('/galeri/detail1', function () {
    return view('galeridetail1');
});

Route::get('/galeri/detail2', function () {
    return view('galeridetail2');
});
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
