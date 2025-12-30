<?php
include 'connection/db.php';

if (!isset($_POST['request'])) {
    // Not a form submit — you can redirect or stop execution
    exit;
}

// Gather raw input
$package_id_raw   = $_POST['pakej_id']    ?? null;
$subpackage_id_raw= $_POST['subpakej_id']?? null;
$people_raw       = $_POST['people']     ?? null;
$name_raw         = $_POST['name']       ?? '';
$email_raw        = $_POST['email']      ?? '';
$phone_raw        = $_POST['phone']      ?? '';
$travel_date_raw  = $_POST['travel_date']?? '';

// Validation & normalization
$errors = [];

// integers
$package_id    = filter_var($package_id_raw, FILTER_VALIDATE_INT);
$subpackage_id = filter_var($subpackage_id_raw, FILTER_VALIDATE_INT);
$people        = filter_var($people_raw, FILTER_VALIDATE_INT);

// strings (trim)
$name  = trim($name_raw);
$phone = trim($phone_raw);

// email
$email = filter_var(trim($email_raw), FILTER_VALIDATE_EMAIL);

// travel date: accept YYYY-MM-DD from <input type="date">
$travel_date = null;
if (!empty($travel_date_raw)) {
    $d = DateTime::createFromFormat('Y-m-d', $travel_date_raw);
    if ($d && $d->format('Y-m-d') === $travel_date_raw) {
        $travel_date = $travel_date_raw;
    } else {
        $errors[] = 'Travel date format is invalid.';
    }
} else {
    $errors[] = 'Travel date is required.';
}

// required checks
if ($package_id === false || $package_id === null) {
    $errors[] = 'Invalid package selection.';
}
if ($subpackage_id === false || $subpackage_id === null) {
    $errors[] = 'Invalid subpackage selection.';
}
if ($people === false || $people === null || $people < 1) {
    $errors[] = 'Number of people is invalid.';
}
if ($name === '') {
    $errors[] = 'Name is required.';
}
if ($email === false || $email === null) {
    $errors[] = 'A valid email is required.';
}
if ($phone === '') {
    $errors[] = 'Phone number is required.';
}

if (!empty($errors)) {
    // Handle errors: you can store in session & redirect back, or echo them.
    // Example: store errors in session and redirect back to the form page
    session_start();
    $_SESSION['enquiry_errors'] = $errors;
    // Optionally persist old input
    $_SESSION['enquiry_old'] = [
        'pakej_id'=>$package_id_raw,
        'subpakej_id'=>$subpackage_id_raw,
        'people'=>$people_raw,
        'name'=>$name_raw,
        'email'=>$email_raw,
        'phone'=>$phone_raw,
        'travel_date'=>$travel_date_raw,
    ];
    header('Location: ' . ($_SERVER['HTTP_REFERER'] ?? 'index.php'));
    exit;
}

// Insert into database
try {
    // Replace 'enquiries' below with your actual table name (the screenshot shows columns — use that table)
    $sql = "INSERT INTO tbl_ap_bookings
        (name, email, phone_num, num_of_people, package_id, sub_package_id, booking_date, travel_date, status, created_at, updated_at)
        VALUES
        (:name, :email, :phone, :people, :package_id, :sub_package_id, :booking_date, :travel_date, :status, NOW(), NOW())";

    $stmt = $pdo->prepare($sql);

    $stmt->execute([
        ':name'           => $name,
        ':email'          => $email,
        ':phone'          => $phone,
        ':people'         => $people,
        ':package_id'     => $package_id,
        ':sub_package_id' => $subpackage_id,
        ':booking_date'   => date('Y-m-d'),   // today
        ':travel_date'    => $travel_date,
        ':status'         => 'pending'        // or whatever default you want
    ]);

    // Success: you can redirect to a thank-you page or show a message
    header('Location: thank-you.php');
    exit;

} catch (PDOException $e) {
    // Log the error, don't reveal details to the user
    error_log('DB error inserting enquiry: ' . $e->getMessage());
    // Provide friendly feedback
    session_start();
    $_SESSION['enquiry_errors'] = ['There was a problem saving your enquiry — please try again later.'];
    header('Location: ' . ($_SERVER['HTTP_REFERER'] ?? 'index.php'));
    exit;
}
?>