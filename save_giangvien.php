<?php
include("database/db_connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_gv = $_POST["ma_gv"];
    $ten_gv = $_POST["ten_gv"];
    $dia_chi = $_POST["dia_chi"];
    $so_dien_thoai = $_POST["so_dien_thoai"];
    $cccd = $_POST["cccd"];
    $gioi_tinh = $_POST["gioi_tinh"];
    $ngay_sinh = $_POST["ngay_sinh"];
    $email = $_POST["email"];

    $query = "SELECT * FROM GIANGVIEN WHERE Ma_giao_vien = '$ma_gv' OR So_dien_thoai = '$so_dien_thoai' OR CCCD = '$cccd' OR Email = '$email'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        header("Location: error_admin1.html");
        exit();
    } else {
        $sql = "INSERT INTO GIANGVIEN (Ma_giao_vien, Ten_giao_vien, Dia_chi, So_dien_thoai, CCCD, Gioi_tinh, Ngay_sinh, Email) VALUES ('$ma_gv', '$ten_gv', '$dia_chi', '$so_dien_thoai', '$cccd', '$gioi_tinh', '$ngay_sinh', '$email')";

        if ($conn->query($sql) === TRUE) {
            header("Location: done_admin1.html");
            exit();
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
