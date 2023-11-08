<?php
include("database/db_connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_gv = $_POST["ma_gv"];
    $ten_gv = $_POST["ten_gv"];

    $query = "SELECT * FROM NGUOIDUNG WHERE Tai_khoan = '$ma_gv'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        header("Location: error_home.html");
        exit();
    } else {
        $sql = "INSERT INTO NGUOIDUNG (Tai_khoan, Mat_khau, Phan_quyen) VALUES ('$ma_gv', '$ten_gv', '0')";

        if ($conn->query($sql) === TRUE) {
            header("Location: done_home.html");
            exit();
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
