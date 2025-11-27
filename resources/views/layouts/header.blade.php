<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <title>Smart Kembara</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/fontawesome.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/owl.css') }}">
</head>

<body>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <div class="sub-header">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-xs-12">
                    <ul class="left-info">
                        <li><a href="#"><i class="fa fa-envelope"></i>contact@company.com</a></li>
                        <li><a href="#"><i class="fa fa-phone"></i>123-456-7890</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="right-icons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <header class="">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    <h2>Smart Kembara <em> </em></h2>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto align-items-center">
                        <li class="nav-item {{ request()->is('/') ? 'active' : '' }}">
                            <a class="nav-link" href="{{ url('/') }}">Utama
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->is('hubungi-kami') ? 'active' : '' }}" href="{{ url('/hubungi-kami') }}">Hubungi Kami</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->is('galeri') ? 'active' : '' }}" href="{{ url('/galeri') }}">Galeri</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->is('tentang-kami') ? 'active' : '' }}" href="{{ url('/tentang-kami') }}">Tentang Kami</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="dropdown-toggle nav-link {{ request()->is('pakej/smart-umrah') ? 'active' : '' }}{{ request()->is('pakej/smart-travel') ? 'active' : '' }}" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                                aria-expanded="false">Pakej</a>

                            <div class="dropdown-menu">
                                <a class="dropdown-item {{ request()->is('pakej/smart-umrah') ? 'active' : '' }}" href="{{ url('/pakej/smart-umrah') }}">Smart Umrah</a>
                                <a class="dropdown-item {{ request()->is('pakej/smart-travel') ? 'active' : '' }}" href="{{ url('/pakej/smart-travel') }}">Smart Travel</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="filled-button" href="{{ url('/pendaftaran') }}">Pendaftaran</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>