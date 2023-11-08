<?php
$servername = "localhost";
$username = "root";
$password = "110602@Hc";
$dbname = "job0711";

// Tạo kết nối đến CSDL
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối đến CSDL thất bại: " . $conn->connect_error);
}
?>
