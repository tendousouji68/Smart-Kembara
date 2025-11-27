 @include('layouts.header')
 <!-- Page Content -->
 <div class="page-heading header-text">
     <div class="container">
         <div class="row">
             <div class="col-md-12">
                 <h1>Smart Travel</h1>
                 <span>Smart Kembara</span>
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
                     <span>Merancang, menempah, dan mengurus percutian secara cepat dan efisien.</span>
                 </div>
             </div>
             <div class="col-md-4">
                 <div class="service-item">
                     <img src="{{ asset('assets/images/travelg1.jpg') }}" alt="">
                     <div class="down-content">
                         <h4>9 hari 7 malam</h4>
                         <div style="margin-bottom:10px;">
                             <span> <sup></sup>RM 90,000 - <sup></sup>RM 120,000 </span>
                         </div>

                         <p>Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet
                             eleifend.</p>

                         <a href="{{ url('/pakej-detail') }}" class="filled-button">View More</a>
                     </div>
                 </div>

                 <br>
             </div>
             <div class="col-md-4">
                 <div class="service-item">
                     <img src="{{ asset('assets/images/traveln1.png') }}" alt="">
                     <div class="down-content">
                         <h4>10 hari 8 malam</h4>
                         <div style="margin-bottom:10px;">
                             <span> <sup></sup>RM 130,000 - <sup></sup>RM 140,000 </span>
                         </div>

                         <p>Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet
                             eleifend.</p>

                         <a href="package-details.html" class="filled-button">View More</a>
                     </div>
                 </div>

                 <br>
             </div>
             <div class="col-md-4">
                 <div class="service-item">
                     <img src="{{ asset('assets/images/traveln2.png') }}" alt="">
                     <div class="down-content">
                         <h4>12 hari 10 malam</h4>
                         <div style="margin-bottom:10px;">
                             <span> <sup></sup>RM 150,000 - <sup></sup>RM 170,000 </span>
                         </div>

                         <p>Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet
                             eleifend.</p>

                         <a href="package-details.html" class="filled-button">View More</a>
                     </div>
                 </div>

                 <br>
             </div>
         </div>
     </div>
 </div>
 @include('layouts.footer')