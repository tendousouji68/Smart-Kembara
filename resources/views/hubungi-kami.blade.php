 @include('layouts.header')

 <!-- Page Content -->
 <div class="page-heading header-text">
     <div class="container">
         <div class="row">
             <div class="col-md-12">
                 <h1>Hubungi Kami</h1>
                 <span>Smart Kembara</span>
             </div>
         </div>
     </div>
 </div>

 <div class="contact-information mb-5">
     <div class="container">
         <div class="row">
             <div class="col-md-4">
                 <div class="contact-item">
                     <i class="fa fa-phone"></i>
                     <h4>Phone</h4>
                     <p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate nec cursus augue.</p>
                     <a href="#">+1 333 4040 5566</a>
                 </div>
             </div>
             <div class="col-md-4">
                 <div class="contact-item">
                     <i class="fa fa-envelope"></i>
                     <h4>Email</h4>
                     <p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate nec cursus augue.</p>
                     <a href="#">contact@company.com</a>
                 </div>
             </div>
             <div class="col-md-4 mb-4">
                 <div class="contact-item">
                     <i class="fa fa-map-marker"></i>
                     <h4>Location</h4>
                     <p>Sepang <br> Selangor</p>
                     <a href="#">View on Google Maps</a>
                 </div>
             </div>
             <div class="col-md-4">
                 <div class="contact-item">
                     <i class="fa fa-facebook"></i>
                     <h4>Facebook</h4>
                     <p>Smart Kembara</p>
                     <!-- <a href="#">FB</a> -->
                 </div>
             </div>
             <div class="col-md-4">
                 <div class="contact-item">
                     <i class="fa fa-instagram"></i>
                     <h4>Instagram</h4>
                     <p>Smart Kembara</p>
                     <!-- <a href="#">Instagram</a> -->
                 </div>
             </div>
             <div class="col-md-4">
                 <div class="contact-item">
                     <i class="fa fa-twitter"></i>
                     <h4>Twitter</h4>
                     <p>Smart Kembara</p>
                     <!-- <a href="#">Twitter</a> -->
                 </div>
             </div>
         </div>
     </div>
 </div>

 <div id="map">
     <!-- How to change your own map point
	1. Go to Google Maps
	2. Click on your location point
	3. Click "Share" and choose "Embed map" tab
	4. Copy only URL and paste it within the src="" field below
-->
     <iframe
         src="https://maps.google.com/maps?q=Av.+Lúcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
         width="100%" height="500px" frameborder="0" style="border:0" allowfullscreen></iframe>
 </div>

 @include('layouts.footer')