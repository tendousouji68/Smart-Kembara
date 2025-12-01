@include('layouts.header')
<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{{ $subpackage->name }}</h1>
                <span>Pakej {{ $subpackage->package->nama }}</span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div>
                    <!-- Assuming a default image; you can add subpackage-specific images later -->
                    <img src="{{ asset('assets/images/product-1-720x480.jpg') }}" alt="{{ $subpackage->name }}" class="img-fluid wc-image">
                </div>
                <br>
                <!-- Add more images if available; for now, keep static -->
                <div class="row">
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="{{ asset('assets/images/product-1-720x480.jpg') }}" alt="" class="img-fluid">
                        </div>
                        <br>
                    </div>
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="{{ asset('assets/images/product-2-720x480.jpg') }}" alt="" class="img-fluid">
                        </div>
                        <br>
                    </div>
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="{{ asset('assets/images/product-3-720x480.jpg') }}" alt="" class="img-fluid">
                        </div>
                        <br>
                    </div>
                </div>
                <br>
            </div>

            <div class="col-md-5">
                <form action="#" method="post" class="form">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Package</span>
                                <strong class="pull-right">{{ $subpackage->package->nama }}</strong>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Subpackage</span>
                                <strong class="pull-right">{{ $subpackage->name }}</strong>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Price</span>
                                <strong class="pull-right">RM {{ number_format($subpackage->price, 0) }}</strong>
                            </div>
                        </li>
                        <!-- Keep other static fields or make them dynamic if you add more DB columns -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Available</span>
                                <strong class="pull-right">Yes</strong>
                            </div>
                        </li>
                        <!-- ... (keep or adapt other list items as needed) -->
                    </ul>
                </form>
                <br>
                <a href="#" data-toggle="modal" data-target="#exampleModal" class="filled-button btn-block text-center">Enquiry</a>
                <br>
            </div>
        </div>

        <!-- Adapt the rest of the view to be dynamic where possible -->
        <div class="tabs-content" style="display: block;">
            <h4>Description</h4>
            <p>{{ $subpackage->description }}</p>
        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Enquiry</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" id="contact">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter full name" required="">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter email address" required="">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter phone" required="">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="From date" required="">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="To date" required="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Send Request</button>
            </div>
        </div>
    </div>
</div>

@include('layouts.footer')