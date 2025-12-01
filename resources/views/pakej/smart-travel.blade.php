@include('layouts.header')
<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Pakej</h1>
                <span>Smart Travel</span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Pakej <em>Smart Travel</em></h2>
                    <span>kemudahan tempahan dan pengurusan perjalanan secara dalam talian.</span>
                </div>
            </div>
            @foreach($subpackages as $subpackage)
            <div class="col-md-4">
                <div class="service-item">
                    <!-- Adjust image path as needed -->
                    <img src="{{ asset('assets/images/' . ($subpackage->picture ?: 'default.jpg')) }}" alt="{{ $subpackage->name }}">
                    <div class="down-content">
                        <h4>{{ $subpackage->name }}</h4>
                        <div style="margin-bottom:10px;">
                            <span>RM {{ number_format($subpackage->price, 0) }}</span>
                        </div>
                        <p>{{ $subpackage->description }}</p>
                        <a href="{{ route('package-detail', $subpackage->id) }}" class="filled-button">View More</a>
                    </div>
                </div>
                <br>
            </div>
            @endforeach
        </div>
    </div>
</div>
@include('layouts.footer')