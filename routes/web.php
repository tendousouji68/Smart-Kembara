<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/pakej/smart-umrah', function () {
    return view('pakej.smart-umrah');
});

Route::get('/pakej-detail', function () {
    return view('pakej-detail');
});
