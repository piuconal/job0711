<?php
include("database/db_connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_gv = $_POST["ma_gv"];
    $ten_gv = $_POST["ten_gv"];

    $query = "SELECT * FROM KHOA WHERE Ma_khoa = '$ma_gv' OR Ten_khoa = '$ten_gv'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        header("Location: error_admin4.html");
        exit();
    } else {
        $sql = "INSERT INTO KHOA (Ma_khoa, Ten_khoa) VALUES ('$ma_gv', '$ten_gv')";

        if ($conn->query($sql) === TRUE) {
            header("Location: done_admin4.html");
            exit();
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
