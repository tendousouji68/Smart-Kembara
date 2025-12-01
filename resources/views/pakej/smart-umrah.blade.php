@include('layouts.header')
<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Pakej</h1>
                <span>Smart Umrah</span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Pakej <em>Smart Umrah</em></h2>
                    <span>kemudahan tempahan dan pengurusan perjalanan secara dalam talian.</span>
                </div>
            </div>
            @foreach($subpackages as $subpackage)
            <div class="col-md-4">
                <div class="service-item">
                    <!-- Assuming images are named based on subpackage ID or name; adjust as needed -->
                    <img src="{{ asset('assets/images/' . $subpackage->picture) }}" alt="{{ $subpackage->name }}">
                    <div class="down-content">
                        <h4>{{ $subpackage->name }}</h4>
                        <div style="margin-bottom:10px;">
                            <span>{{ $subpackage->description }}</span>
                        </div>
                        <p>RM {{ number_format($subpackage->price, 0) }}</p>
                        <!-- Link to the dynamic detail page with subpackage ID -->
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