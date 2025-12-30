@include('layouts.header')

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Galeri</h1>
                <span>Smart Kembara</span>
            </div>
        </div>
    </div>
</div>

<style>
    .gallery-img {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 8px;
    }
</style>

{{-- Galeri Section --}}
<div class="container py-5">
    <div class="row g-4">

    <div class="col-6 col-md-3">
        <a href="{{ url('/galeri/detail1') }}" class="text-decoration-none">
            <img src="{{ asset('assets/images/pantaimengabangfront.jpg') }}" class="gallery-img" alt="">
            <p class="fw-bold text-dark text-center">Pantai Mengabang</p>
        </a>
    </div>

    <div class="col-6 col-md-3">
        <a href="{{ url('/galeri/detail2') }}" class="text-decoration-none">
            <img src="{{ asset('assets/images/Gunung-Senyum-Cave-1.jpg') }}" class="gallery-img" alt="">
            <p class="fw-bold text-dark text-center">Gunung Senyum</p>
        </a>
    </div>

    <div class="col-6 col-md-3">
        <a href="{{ url('/galeri/detail3') }}" class="text-decoration-none">
            <img src="{{ asset('assets/images/masjidputra.jpg') }}" class="gallery-img" alt="">
            <p class="fw-bold text-dark text-center">Masjid Putra</p>
        </a>
    </div>

    <div class="col-6 col-md-3">
        <a href="{{ url('/galeri/detail4') }}" class="text-decoration-none">
            <img src="{{ asset('assets/images/pantaibatu.jpg') }}" class="gallery-img" alt="">
            <p class="fw-bold text-dark text-center">Pantai Batu Rakit</p>
        </a>
    </div>

</div>
</div>

@include('layouts.footer')