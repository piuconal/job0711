<?php
include("database/db_connection.php");

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT id_u, Phan_quyen FROM NGUOIDUNG WHERE Tai_khoan = '$username' AND Mat_khau = '$password'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    if ($row['Phan_quyen'] === '1') {
        header("Location: admin1.html");
        exit();
    } 
    elseif ($row['Phan_quyen'] === '0') {
        header("Location: client1.html");
        exit();
    }
}

header("Location: error.html");
exit();

$conn->close();
?>