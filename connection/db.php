<?php
// Database configuration
$host = 'localhost'; 
$dbname = 'laravel'; 
$username = 'root'; 
$password = '';

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Connection successful
    // echo "Connected to the database successfully!";
} catch (PDOException $e) {
    // If connection fails, display the error message
    // echo "Connection failed: " . $e->getMessage();
}
?>