<?php
// Database credentials
include "connection\db.php";

try {
    // Create PDO connection
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get the subpackage ID (e.g., from the URL)
    $subpackageId = $_GET['subpackage_id']; // Example: Getting from the query string like subpackage_id=1

    // SQL query to fetch subpackage and its main package name
    $query = "
        SELECT subpackages.id AS subpackage_id,
               subpackages.name AS subpackage_name,
               packages.nama AS main_package_name
        FROM tbl_ap_subpackages AS subpackages
        INNER JOIN tbl_ap_packages AS packages 
        ON subpackages.package_id = packages.id
        WHERE subpackages.id = :subpackage_id
    ";

    // Prepare the SQL statement
    $stmt = $pdo->prepare($query);

    // Bind the subpackage_id parameter
    $stmt->bindParam(':subpackage_id', $subpackageId, PDO::PARAM_INT);

    // Execute the query
    $stmt->execute();

    // Fetch the result
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    // Display the result
    if ($result) {
        echo "Subpackage Name: " . $result['subpackage_name'] . "<br>";
        echo "Main Package Name: " . $result['main_package_name'] . "<br>";
    } else {
        echo "No subpackage found with that ID.";
    }

} catch (PDOException $e) {
    // Catch and display any connection errors
    echo "Connection failed: " . $e->getMessage();
}
?>
