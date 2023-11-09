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
    $dan_toc = $_POST["dan_toc"];
    $ton_giao = $_POST["ton_giao"];
    $noi_sinh = $_POST["noi_sinh"];

    $query = "SELECT * FROM SINHVIEN WHERE Ma_sinh_vien = '$ma_gv' OR So_dien_thoai = '$so_dien_thoai' OR CCCD = '$cccd' OR Email = '$email'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        header("Location: error_admin2.html");
        exit();
    } else {
        $sql = "INSERT INTO SINHVIEN (Ma_sinh_vien, Ten_sinh_vien, Dia_chi, So_dien_thoai, CCCD, Gioi_tinh, Ngay_sinh, Email, Dan_toc, Ton_giao, Noi_sinh) VALUES ('$ma_gv', '$ten_gv', '$dia_chi', '$so_dien_thoai', '$cccd', '$gioi_tinh', '$ngay_sinh', '$email','$dan_toc', '$ton_giao', '$noi_sinh')";

        if ($conn->query($sql) === TRUE) {
            header("Location: done_admin2.html");
            exit();
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
