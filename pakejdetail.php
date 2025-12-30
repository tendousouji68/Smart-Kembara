<?php include 'layouts/header.php';
include 'connection/db.php'; ?>

<title>Kembara Smart Umrah</title>

<!--Subpackage databse-->
<?php
$idpost = $_POST['id'] ?? null;

$query = "SELECT * FROM tbl_ap_subpackages WHERE id = :idpost";

$stmt = $pdo->prepare($query);

$stmt->execute([':idpost' => $idpost]);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
if ($results)
    // Loop through each row and display the data
    foreach ($results as $row)
        $pack_id = $row['package_id'];
$query2 = "SELECT * FROM tbl_ap_packages WHERE id = $pack_id";

$stmt = $pdo->prepare($query2);

$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<style>

.big-img {
    width: 100%;
    height: 600px;
    object-fit: cover;
    border-radius: 8px;
    cursor: pointer; /* Makes image clickable */
}

.gallery-img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 8px;
    cursor: pointer; /* Makes image clickable */
}

/* Lightbox zoom styles */
.lb-image {
    transition: transform 0.25s ease;
    cursor: zoom-in;
}

.lb-image.zoomed {
    transform: scale(2);
    cursor: zoom-out;
}

</style>

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1><?php echo "" . $row['name'] . "<br>"; ?></h1>
                <span>Pakej <?php echo $results[0]['nama']; ?></span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <div class="col-md-7">

                <a href="assets/images/<?php echo $row['picture']; ?>"
                   data-fancybox="gallery"
                   data-caption="<?php echo $row['name']; ?>">

                    <img src="assets/images/<?php echo $row['picture']; ?>" 
                        alt="<?php echo $row['name']; ?>" class="big-img">
                </a>

                <br>
                <!-- Add more images --
                <div class="row">
                    <div class="col-sm-4 col-6">
                        <div>
                            <img src="assets/images/product-1-720x480.jpg" alt="" class="gallery-img">
                        </div>
                        <br>
                    </div>
                    <div class="col-sm-4 col-6">
                        <a href='assets/images/pantaimengabang1.jpg' data-lightbox="gallery" data-title="Pantai Mengabang Telipot 1">
                            <img src='assets/images/pantaimengabang1.jpg' class="gallery-img" alt="Galeri 1" loading="lazy">
                        </a>
                    </div>
                </div>
                <br> -->
            </div>

            <div class="col-md-5">
                <form action="pakejrequest" method="post" class="form">
                    <input name="pakej_id" value="<?php echo $results[0]['id']; ?>" hidden>
                    <input name="subpakej_id" value="<?php echo $row['id']; ?>" hidden>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Package</span>
                                <strong class="pull-right"><?php echo $results[0]['nama']; ?></strong>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Subpackage</span>
                                <strong class="pull-right"><?php echo $row['name']; ?></strong>
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
                                <span class="pull-left">Choose a Travel Date</span><br>
                                <?php if($row['start_date'] == !NULL && $row['end_date'] == !NULL){ ?>
                                    <input type="radio" id="html" name="date" value="">
                                    <label for="html"><?php echo "<strong>From:</strong> ".$row['start_date']." <strong>To:</strong> ".$row['end_date']; ?></label><br>
                                <?php }
                                else{ ?>
                                <input type="date" id="date" name="travel_date" class="form-control" required>
                                <?php } ?>
                            </div>
                        </li>
                        <!-- Display calculated end date --
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Until</span>
                                <strong class="pull-right" id="endDate">-</strong>
                            </div>
                        </li> -->
                        <li class="list-group-item">
                            <div class="clearfix">
                                <span class="pull-left">Total Price</span>
                                <strong class="pull-right" id="totalPrice">RM <?php echo $row['price']; ?></strong>
                            </div>
                        </li>
                    </ul>



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
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input name="name" type="text" class="form-control" placeholder="Enter full name" required="">
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input name="email" type="text" class="form-control" placeholder="Enter email address" required="">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input name="phone" type="number" class="form-control" placeholder="Enter phone" required="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button class="btn btn-primary" type="submit" name="request">Send Request</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>


                <br>
                <a href="#" data-toggle="modal" data-target="#exampleModal" class="filled-button btn-block text-center">Enquiry</a>
                <br>

            </div>
        </div>

        <div class="tabs-content" style="display: block;">
            <h4>Description</h4>
            <p><?php echo $row['description']; ?></p>
        </div>
    </div>
</div>

<!-- Fancybox CSS -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css"
/>

<!-- Fancybox JS -->
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    Fancybox.bind('[data-fancybox="gallery"]', {
        Images: {
            zoom: true
        }
    });
});
</script>

<?php include 'layouts/footer.php'; ?>

<!--
dynamic coding no hard coding
(dropdwn)
hotel -cth 3
jumlah jemaah -10
tarikh penerbangan
total harga
 -->