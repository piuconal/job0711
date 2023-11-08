<?php
include("database/db_connection.php");

$sql = "SELECT * FROM LOPHOC";
$result = $conn->query($sql);

$models = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $models[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($models);

$conn->close();
?>

