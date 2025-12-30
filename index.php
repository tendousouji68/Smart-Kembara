<?php
include 'layouts/header.php';
include 'connection/db.php'; ?>

<title>Kembara Smart Umrah</title>

<head>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.css"
        integrity="sha512-UTNP5BXLIptsaj5WdKFrkFov94lDx+eBvbKyoe1YAfjeRPC+gT5kyZ10kOHCfNZqEui1sxmqvodNUx3KbuYI/A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>

<style>


    /* ath_carousel_se_01 */
    .ath_carousel_se_01 .owl-theme .owl-dots {
        text-align: center;
        margin-top: 18px;
    }

    .ath_carousel_se_01 .owl-theme .owl-dots .owl-dot {
        display: inline-block;
        border: none;
        outline: none;
    }

    .ath_carousel_se_01 .owl-theme .owl-dots .owl-dot span {
        width: 12px;
        height: 12px;
        margin: 5px 5px;
        background: #00674d8a;
        border: 0px solid #00674d8c;
        display: block;
        transition: all 0.6s ease-in-out;
        cursor: pointer;
        border-radius: 50%;
    }

    .ath_carousel_se_01 .owl-theme .owl-dots .owl-dot:hover span {
        color: #19af19c5;
        background: #19af19c5;
        /*  border: 5px double;*/
        padding: 5px;
        border-radius: 50%;
    }

    .ath_carousel_se_01 .owl-theme .owl-dots .owl-dot.active span {
        color: #1936b4f6;
        background: #034434ff;
        /* border: 5px double;*/
        opacity: 0.8;
        padding: 5px;
        border-radius: 50%;
        background: #00674dff;
    }

    .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-next {
        position: absolute;
        top: 42%;
        right: -20px;
        padding: 0px 15px 6px 15px !important;
        background: rgb(255, 255, 255);
        display: inline-block;
        transform: translateY(-50%);
        border-radius: 50%;
        font-size: 35px;
        line-height: 35px;
        color: #00674e;
        box-shadow: 0 0 8px rgba(0, 0, 0, .25);
        border: none;
        outline: none;
    }

    .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-next:hover {
        background: #00674e;
        color: #fff;
    }

    .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-prev {
        position: absolute;
        top: 42%;
        left: -20px;
        padding: 0px 15px 6px 15px !important;
        background: rgb(255, 255, 255);
        display: inline-block;
        transform: translateY(-50%);
        border-radius: 50%;
        font-size: 35px;
        line-height: 35px;
        color: #00674e;
        box-shadow: 0 0 8px rgba(0, 0, 0, .25);
        border: none;
        outline: none;
    }

    .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-prev:hover {
        background: #00674e;
        color: #fff;
    }

    .ath_carousel_se_01 .owl-arrow .owl-nav {
        position: absolute;
        top: 0;
        right: 0;
        font-size: 1.8rem;
    }

    .ath_carousel_se_01 .owl-arrow .owl-nav .owl-prev,
    .ath_carousel_se_01 .owl-arrow .owl-nav .owl-next {
        display: inline-block;
        transition: all 0.6s ease-in-out;
        color: #000000;
    }

    .ath_carousel_se_01 .main_services {
        position: relative;
        margin: 30px 10px 40px 10px;
        padding: 40px 15px 32px 15px;
        overflow: hidden;
        text-align: center;
        border: 1px solid transparent;
        border-radius: 8px 8px;
        /* box-shadow: 12px 14px 0 #ececec; */
        box-shadow: 0px 0px 10px 0 rgba(0, 0, 0, .2);
        min-height: 348px;
    }

    .ath_carousel_se_01 .main_services:hover {
        border: 1px solid #ededed;
        box-shadow: none;
    }


    @media only screen and (max-width: 768px) {
        .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-prev {
            top: 42%;
            left: 0px;

        }

        .ath_carousel_se_01 .owl-carousel .owl-nav button.owl-next {
            top: 42%;
            right: 0px;

        }
    }




    .service-item {
        position: relative;
        margin-bottom: 30px;
        overflow: hidden;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        background: #fff;
    }

    .service-item:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        transform: translateY(-5px);
    }

    .service-item img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        transition: transform 0.3s ease;
    }

    .service-item:hover img {
        transform: scale(1.05);
    }

    .service-item .down-content {
        padding: 20px;
        text-align: center;
    }

    .service-item .down-content h4 {
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 10px;
        color: #333;
    }

    .service-item .down-content p {
        font-size: 14px;
        color: #666;
        margin-bottom: 15px;
        line-height: 1.5;
    }

    .filled-button {
        background-color: var(--first);
        color: #fff;
        font-size: 13px;
        text-transform: uppercase;
        font-weight: 700;
        padding: 12px 30px;
        border-radius: 30px;
        display: inline-block;
        transition: all 0.3s;
        border: none;
        outline: none;
    }

    .filled-button:hover {
        background-color: #fff;
        color: var(--first);
    }
</style>
<?php
# Subpackage databse
$query = "
  SELECT *
  FROM tbl_ap_subpackages
";
$stmt = $pdo->prepare($query);
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!-- Page Content -->
<!-- Banner Starts Here -->
<div class="main-banner header-text" id="top">
    <div class="Modern-Slider">
        <!-- Item -->
        <div class="item item-1">
            <div class="img-fill">
                <div class="text-content">
                    <h6>9 hari 7 malam</h6>
                    <h4>Pakej Ekonomi <br> RM 90,000</h4>
                    <p>Magni deserunt dolorem consectetur adipisicing elit. Corporis molestiae optio, laudantium odio quod rerum
                        maiores, omnis unde quae illo.</p>
                    <a href="smart-umrah" class="filled-button">Pakej</a>
                </div>
            </div>
        </div>
        <!-- // Item -->
        <!-- Item -->
        <div class="item item-2">
            <div class="img-fill">
                <div class="text-content">
                    <h6>10 hari 8 malam</h6>
                    <h4>Pakej Super Ekonomi <br> RM 100,000</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At culpa cupiditate mollitia adipisci assumenda
                        laborum eius quae quo excepturi, eveniet. Dicta nulla ea beatae consequuntur?</p>
                    <a href="smart-umrah" class="filled-button">Pakej</a>
                </div>
            </div>
        </div>
        <!-- // Item -->
        <!-- Item -->
        <div class="item item-3">
            <div class="img-fill">
                <div class="text-content">
                    <h6>12 hari 10 malam</h6>
                    <h4>Pakej Premium<br>RM 120,000</h4>
                    <p>Vivamus ut tellus mi. Nulla nec cursus elit, id vulputate mi. Sed nec cursus augue. Phasellus lacinia ac
                        sapien vitae dapibus. Mauris ut dapibus velit cras interdum nisl ac urna tempor mollis.</p>
                    <a href="smart-umrah" class="filled-button">Pakej</a>
                </div>
            </div>
        </div>
        <!-- // Item -->
    </div>
</div>
<!-- Banner Ends Here -->

<div class="request-form">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h4>Request a call back right now ?</h4>
                <span>Mauris ut dapibus velit cras interdum nisl ac urna tempor mollis.</span>
            </div>
            <div class="col-md-4">
                <a href="/hubungi-kami" class="border-button">Contact Us</a>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Featured <em>Packages</em></h2>
                    <span>Aliquam id urna imperdiet libero mollis hendrerit</span>
                </div>
            </div>


            <?php if (!empty($results)): ?>
                <section class="ath_carousel_se_01">
                    <div class="container-fluid px-0 py-5">
                        <div class="container">
                            <div class="row">
                                <div class="owl-carousel owl-theme packages-carousel">
                                    <?php foreach ($results as $row): ?>
                                        <div class="item"> <!-- Owl expects each slide to be an item -->
                                            <div class="col-md-12">
                                                <div class="service-item">
                                                    <img src="assets/images/product-1-720x480.jpg" alt="<?php echo ($row['name']); ?>">
                                                    <div class="down-content">
                                                        <h4><?php echo ($row['name']); ?></h4>
                                                        <div style="margin-bottom:10px;">
                                                            <span><sup>RM</sup> <?php echo ($row['price']); ?></span>
                                                        </div>

                                                        <p><?php echo ($row['description']); ?></p>

                                                        <form action="pakejdetail.php" method="post" style="margin-top:10px;">
                                                            <button name="id" class="filled-button" type="submit" value="<?php echo ($row['id']); ?>">
                                                                Book Now
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            <?php endif; ?>



        </div>
    </div>
</div>

<div class="fun-facts">
    <div class="container">
        <div class="more-info-content">
            <div class="row">
                <div class="col-md-6">
                    <div class="left-image">
                        <img src="assets/images/about-1-570x350.jpg" class="img-fluid" alt="">
                    </div>
                </div>
                <div class="col-md-6 align-self-center">
                    <div class="right-content">
                        <span>Who we are</span>
                        <h2>Get to know about <em>our company</em></h2>
                        <p>Curabitur pulvinar sem a leo tempus facilisis. Sed non sagittis neque. Nulla conse quat tellus nibh, id
                            molestie felis sagittis ut. Nam ullamcorper tempus ipsum in cursus</p>
                        <a href="about.html" class="filled-button">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="more-info">
    <div class="container">
        <div class="section-heading">
            <h2>Read our <em>Blog</em></h2>
            <span>Aliquam id urna imperdiet libero mollis hendrerit</span>
        </div>

        <div class="row" id="tabs">
            <div class="col-md-4">
                <ul>
                    <li><a href='#tabs-1'>Lorem ipsum dolor sit amet, consectetur adipisicing <br> <small>John Doe &nbsp;|&nbsp;
                                27.07.2020 10:10</small></a></li>
                    <li><a href='#tabs-2'>Mauris lobortis quam id dictum dignissim <br> <small>John Doe &nbsp;|&nbsp; 27.07.2020
                                10:10</small></a></li>
                    <li><a href='#tabs-3'>Class aptent taciti sociosqu ad litora torquent per <br> <small>John Doe &nbsp;|&nbsp;
                                27.07.2020 10:10</small></a></li>
                </ul>

                <br>

                <div class="text-center">
                    <a href="blog.html" class="filled-button">Read More</a>
                </div>

                <br>
            </div>

            <div class="col-md-8">
                <section class='tabs-content'>
                    <article id='tabs-1'>
                        <img src="assets/images/blog-image-1-940x460.jpg" alt="">
                        <h4><a href="blog-details.html">Lorem ipsum dolor sit amet, consectetur adipisicing.</a></h4>
                        <p>Sed ut dolor in augue cursus ultrices. Vivamus mauris turpis, auctor vel facilisis in, tincidunt vel
                            diam. Sed vitae scelerisque orci. Nunc non magna orci. Aliquam commodo mauris ante, quis posuere nibh
                            vestibulum sit amet.</p>
                    </article>
                    <article id='tabs-2'>
                        <img src="assets/images/blog-image-2-940x460.jpg" alt="">
                        <h4><a href="blog-details.html">Mauris lobortis quam id dictum dignissim</a></h4>
                        <p>Sed ut dolor in augue cursus ultrices. Vivamus mauris turpis, auctor vel facilisis in, tincidunt vel
                            diam. Sed vitae scelerisque orci. Nunc non magna orci. Aliquam commodo mauris ante, quis posuere nibh
                            vestibulum sit amet</p>
                    </article>
                    <article id='tabs-3'>
                        <img src="assets/images/blog-image-3-940x460.jpg" alt="">
                        <h4><a href="blog-details.html">Class aptent taciti sociosqu ad litora torquent per</a></h4>
                        <p>Mauris lobortis quam id dictum dignissim. Donec pellentesque erat dolor, cursus dapibus turpis
                            hendrerit quis. Suspendisse at suscipit arcu. Nulla sed erat lectus. Nulla facilisi. In sit amet neque
                            sapien. Donec scelerisque mi at gravida efficitur. Nunc lacinia a est eu malesuada. Curabitur eleifend
                            elit sapien, sed pulvinar orci luctus eget.
                        </p>
                    </article>
                </section>
            </div>
        </div>


    </div>
</div>

<div class="testimonials">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>What they say <em>about us</em></h2>
                    <span>testimonials from our greatest clients</span>
                </div>
            </div>
            <div class="col-md-12">
                <div class="owl-testimonials owl-carousel">

                    <div class="testimonial-item">
                        <div class="inner-content">
                            <h4>George Walker</h4>
                            <span>Chief Financial Analyst</span>
                            <p>"Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo
                                sem sit amet quam. Pellentesque in sagittis lacus."</p>
                        </div>
                        <img src="http://placehold.it/60x60" alt="">
                    </div>

                    <div class="testimonial-item">
                        <div class="inner-content">
                            <h4>John Smith</h4>
                            <span>Market Specialist</span>
                            <p>"In eget leo ante. Sed nibh leo, laoreet accumsan euismod quis, scelerisque a nunc. Mauris accumsan,
                                arcu id ornare malesuada, est nulla luctus nisi."</p>
                        </div>
                        <img src="http://placehold.it/60x60" alt="">
                    </div>

                    <div class="testimonial-item">
                        <div class="inner-content">
                            <h4>David Wood</h4>
                            <span>Chief Accountant</span>
                            <p>"Ut ultricies maximus turpis, in sollicitudin ligula posuere vel. Donec finibus maximus neque, vitae
                                egestas quam imperdiet nec. Proin nec mauris eu tortor consectetur tristique."</p>
                        </div>
                        <img src="http://placehold.it/60x60" alt="">
                    </div>

                    <div class="testimonial-item">
                        <div class="inner-content">
                            <h4>Andrew Boom</h4>
                            <span>Marketing Head</span>
                            <p>"Curabitur sollicitudin, tortor at suscipit volutpat, nisi arcu aliquet dui, vitae semper sem turpis
                                quis libero. Quisque vulputate lacinia nisl ac lobortis."</p>
                        </div>
                        <img src="http://placehold.it/60x60" alt="">
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<br>
<br>
<br>
<br>
</div>
</div>
<script>
    $(document).ready(function() {
        $('.ath_carousel_se_01_carousel').owlCarousel({
            items: 3,
            nav: true,
            loop: true,

            mouseDrag: true,
            responsiveClass: true,
            /*navText : ["<i class='fas fa-long-arrow-alt-left'></i>","<i class='fas fa-long-arrow-alt-right'></i>"],*/
            responsive: {
                0: {
                    items: 1
                },
                480: {
                    items: 1
                },
                767: {
                    items: 2
                },
                992: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            }
        });

        $(document).ready(function() {
            $('.packages-carousel').owlCarousel({
                loop: true,
                margin: 30,
                nav: true,
                dots: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });
        });

    });
</script>

<?php include 'layouts/footer.php'; ?>