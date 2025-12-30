<!-- index.html -->
<!DOCTYPE html>

<?php
// Get the current page filename
$currentPage = basename($_SERVER['PHP_SELF']);
?>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
    rel="stylesheet">

  <link rel="icon" href='assets/images/skulogo_favicon.ico' type="image/x-icon">
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="assets/css/fontawesome.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/owl.css">

      <!-- Lightbox2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css" rel="stylesheet">
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
        <a class="navbar-brand" href="index">
          <h2>Kembara Smart Umrah<em> </em></h2>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
          aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">

          <ul class="navbar-nav ml-auto align-items-center">
        <li class="nav-item <?php echo ($currentPage == 'index.php' ? 'active' : ''); ?>">
            <a class="nav-link" href="index">Utama</a>
        </li>
        <li class="nav-item <?php echo ($currentPage == 'contact.php' ? 'active' : ''); ?>">
            <a class="nav-link" href="contact">Hubungi Kami</a>
        </li>
        <li class="nav-item <?php echo ($currentPage == 'galery.php' ? 'active' : ''); ?>">
            <a class="nav-link" href="galery">Galeri</a>
        </li>
        <li class="nav-item <?php echo ($currentPage == 'about.php' ? 'active' : ''); ?>">
            <a class="nav-link" href="about">Tentang Kami</a>
        </li>
        <li class="nav-item <?php echo ($currentPage == 'umrah.php' || $currentPage == 'travel.php' ? 'active' : ''); ?> dropdown">
          <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
            aria-expanded="false">Pakej</a>

          <div class="dropdown-menu">
            <a class="dropdown-item <?php echo ($currentPage == 'umrah' ? 'active' : ''); ?>" href="umrah">Smart Umrah</a>
            <a class="dropdown-item <?php echo ($currentPage == 'travel' ? 'active' : ''); ?>" href="travel">Smart Travel</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="filled-button" href="login">Log In</a>
        </li>
        </div>
      </div>
    </nav>
  </header>
