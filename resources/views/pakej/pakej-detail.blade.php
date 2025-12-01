@include('layouts.header')

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{{ $subpackage->description }}</h1>
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
                    <!-- Dynamic image -->
                    <img src="{{ asset('assets/images/product-1-720x480.jpg') }}" alt="{{ $subpackage->name }}" class="img-fluid wc-image">
                </div>
                <br>
                <!-- Add more images -->
                <div class="row">
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="{{ asset('assets/images/product-1-720x480.jpg') }}" alt="" class="img-fluid">
                        </div>
                        <br>
                    </div>
                    <!-- Additional Images -->
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
                        <!-- People Dropdown for price calculation -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Number of People</span>
                                <select id="people" name="people" class="form-control">
                                    <option value="1">1 Person</option>
                                    <option value="2">2 People</option>
                                    <option value="3">3 People</option>
                                    <option value="4">4 People</option>
                                    <option value="5">5 People</option>
                                    <option value="6">6 People</option>
                                    <option value="7">7 People</option>
                                    <option value="8">8 People</option>
                                    <option value="9">9 People</option>
                                    <option value="10">10 People</option>
                                </select>
                            </div>
                        </li>
                        <!-- Hotel Dropdown for price calculation -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Choose a hotel</span>
                                <select id="hotel" name="hotel" class="form-control">
                                    <option value="0">Select a hotel</option>
                                    <option value="1">Hotel A</option>
                                    <option value="2">Hotel B</option>
                                    <option value="3">Hotel C</option>
                                </select>
                            </div>
                        </li>
                        <!-- Date Picker for selecting start date -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Choose a Travel Date</span>
                                <input type="date" id="date" name="date" class="form-control" required>
                            </div>
                        </li>
                        <!-- Display calculated end date -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Until</span>
                                <strong class="pull-right" id="endDate">-</strong>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Total Price</span>
                                <strong class="pull-right" id="totalPrice">RM {{ number_format($subpackage->price, 0) }}</strong>
                            </div>
                        </li>
                    </ul>
                </form>
                <br>
                    <a href="#" data-toggle="modal" data-target="#exampleModal" class="filled-button btn-block text-center">Enquiry</a>
                <br>
            </div>
        </div>

        <div class="tabs-content" style="display: block;">
            <h4>Description</h4>
            <p>{{ $subpackage->description }}</p>
        </div>
    </div>
</div>

<!-- Enquiry Modal -->
@include('layouts.footer')

<script>
    const hotelPrices = {
        1: 2,  // Hotel A price multiplier
        2: 3,  // Hotel B price multiplier
        3: 4   // Hotel C price multiplier
    };

    // Function to calculate the total price and update end date
    function updatePrice() {
        const hotelId = $("#hotel").val();
        const numPeople = $("#people").val();
        const startDate = new Date($("#date").val());
        let totalPrice = {{ $subpackage->price }};
        
        if (hotelId != "0" && startDate != "Invalid Date") {
            // Multiply by the selected hotel multiplier and number of people
            totalPrice = totalPrice * hotelPrices[hotelId] * numPeople;
            
            // Calculate the end date (9 days later)
            const endDate = new Date(startDate);
            endDate.setDate(endDate.getDate() + 9);  // Add 9 days
            
            // Format end date to DD-MM-YYYY
            const day = String(endDate.getDate()).padStart(2, '0');
            const month = String(endDate.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
            const year = endDate.getFullYear();
            const formattedEndDate = `${day}-${month}-${year}`;
            
            // Update the end date display
            $("#endDate").text(formattedEndDate);
        }
        
        // Update the total price
        $("#totalPrice").text("RM " + totalPrice.toFixed(0));
    }

    // Event listeners for the dropdowns and date picker
    $("#hotel, #people, #date").change(function() {
        updatePrice();
    });

    // Initialize the price and date when the page loads
    updatePrice();
</script>

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

<!--
dynamic coding no hard coding
(dropdwn)
hotel -cth 3
jumlah jemaah -10
tarikh penerbangan
total harga
 -->