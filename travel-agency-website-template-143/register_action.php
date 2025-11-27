<?php
// Database connection
$servername = "localhost";
$username = "root"; // your database username
$password = ""; // your database password
$dbname = "travel_website"; // your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get data from form
$username = $_POST['username'];
$email = $_POST['email'];
$ic = $_POST['ic'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Encrypt password

// SQL query to insert user data
$sql = "INSERT INTO users (username, email, ic, password) VALUES ('$username', '$email', '$ic', '$password')";

if ($conn->query($sql) === TRUE) {
    echo "Registration successful!";
    // Redirect to login page or home page
    header("Location: login.html");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
