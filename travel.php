<?php
include 'layouts/header.php';
include 'connection/db.php'; ?>

  <title>Kembara Smart Umrah</title>

<style>
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
}

.filled-button:hover {
	background-color: #fff;
	color: var(--first);
}

</style>
<!--Subpackage databse-->
<?php

$query = "
  SELECT s.*
  FROM tbl_ap_subpackages AS s
  JOIN tbl_ap_packages  AS p ON s.package_id = p.id
  WHERE p.nama = :nama
";
$stmt = $pdo->prepare($query);
$stmt->execute([':nama' => 'Smart Travel']);
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

  <!-- Page Content -->
  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1>Smart Travel</h1>
          <span>Lorem ipsum dolor sit amet.</span>
        </div>
      </div>
    </div>
  </div>

  <div class="services">
    <div class="container">
      <div class="row">

<?php 
if ($results):
  foreach ($results as $row):
  ?>

        <div class="col-md-4">
          <div class="service-item">
            <img src="assets/images/product-1-720x480.jpg" alt="">
            <div class="down-content">
              <h4><?php echo "" . $row['name'] . "<br>";?></h4>
              <div style="margin-bottom:10px;">
                <span> <sup>RM</sup> <?php echo $row['price'];?></span>
              </div>

              <p><?php echo "" . $row['description'] . "<br>";?></p>

              <form action="pakejdetail" method="post" style="margin-top:10px;">
                <button name="id" class="filled-button" type="submit" value="<?php echo $row['id']; ?>">Book Now</button>
              </form>
            </div>
          </div>

          <br>
        </div>
<?php 
  endforeach;
endif; ?>
<!-- 
        <div class="col-md-4">
          <div class="service-item">
            <img src="assets/images/product-2-720x480.jpg" alt="">
            <div class="down-content">
              <h4>Lorem ipsum dolor sit amet</h4>
              <div style="margin-bottom:10px;">
                <span> <sup>$</sup>300.00 - <sup>$</sup>400.00 </span>
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
            <img src="assets/images/product-3-720x480.jpg" alt="">
            <div class="down-content">
              <h4>Lorem ipsum dolor sit amet</h4>
              <div style="margin-bottom:10px;">
                <span> <sup>$</sup>300.00 - <sup>$</sup>400.00 </span>
              </div>

              <p>Nullam nibh mi, tincidunt sed sapien ut, rutrum hendrerit velit. Integer auctor a mauris sit amet
                eleifend.</p>

              <a href="package-details.html" class="filled-button">View More</a>
            </div>
          </div>

          <br>
        </div> -->

      </div>

      <br>
      <br>

      <nav>
        <ul class="pagination pagination-lg justify-content-center">
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
              <span aria-hidden="true">«</span>
              <span class="sr-only">Previous</span>
            </a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
              <span aria-hidden="true">»</span>
              <span class="sr-only">Next</span>
            </a>
          </li>
        </ul>
      </nav>

      <br>
      <br>
      <br>
      <br>
    </div>
  </div>

<?php include 'layouts/footer.php'; ?>

</body>

</html>