@include('layouts.header')

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{{ $package->nama }}</h1>
                <span>{{ $package->created_at->format('d M Y') }}</span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <!-- Package images -->
                <img src="assets/images/product-1-720x480.jpg" alt="" class="img-fluid wc-image">

                <!-- Subpackage Images (Example) -->
                @foreach($subPackages as $subPackage)
                <div class="row">
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="assets/images/product-1-720x480.jpg" alt="" class="img-fluid">
                        </div>
                        <br>
                    </div>
                </div>
                @endforeach
            </div>

            <div class="col-md-5">
                <form action="#" method="post" class="form">
                    <ul class="list-group list-group-flush">
                        @foreach($subPackages as $subPackage)
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">{{ $subPackage->name }}</span>
                                <strong class="pull-right">RM {{ number_format($subPackage->price, 2) }}</strong>
                            </div>
                        </li>
                        @endforeach
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>

@include('layouts.footer')