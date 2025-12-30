@include('layouts.header')

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Pantai Mengabang Telipot</h1>
                <span>Galeri</span>
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
        cursor: pointer; /* Makes image clickable */
    }

</style>

{{-- Galeri Section --}}
<div class="container py-5">
    <div class="row g-4">

        <!-- Gallery Image 1 -->
        <div class="col-6 col-md-3">
            <a href="{{ asset('assets/images/pantaimengabang1.jpg') }}" data-lightbox="gallery" data-title="Pantai Mengabang Telipot 1">
                <img src="{{ asset('assets/images/pantaimengabang1.jpg') }}" class="gallery-img" alt="Galeri 1" loading="lazy">
            </a>
        </div>

        <!-- Gallery Image 2 -->
        <div class="col-6 col-md-3">
            <a href="{{ asset('assets/images/pantaimengabang2.jpg') }}" data-lightbox="gallery" data-title="Pantai Mengabang Telipot 2">
                <img src="{{ asset('assets/images/pantaimengabang2.jpg') }}" class="gallery-img" alt="Galeri 2" loading="lazy">
            </a>
        </div>

        <!-- Gallery Image 3 -->
        <div class="col-6 col-md-3">
            <a href="{{ asset('assets/images/pantaimengabang3.jpg') }}" data-lightbox="gallery" data-title="Pantai Mengabang Telipot 3">
                <img src="{{ asset('assets/images/pantaimengabang3.jpg') }}" class="gallery-img" alt="Galeri 3" loading="lazy">
            </a>
        </div>

        <!-- Gallery Image 4 -->
        <div class="col-6 col-md-3">
            <a href="{{ asset('assets/images/pantaimengabang4.jpg') }}" data-lightbox="gallery" data-title="Pantai Mengabang Telipot 4">
                <img src="{{ asset('assets/images/pantaimengabang4.jpg') }}" class="gallery-img" alt="Galeri 4" loading="lazy">
            </a>
        </div>

    </div>
</div>

@include('layouts.footer')

<!-- Add Lightbox JS and CSS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>