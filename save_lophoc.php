<?php
include("database/db_connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_gv = $_POST["ma_gv"];
    $ten_gv = $_POST["ten_gv"];

    $query = "SELECT * FROM LOPHOC WHERE Ma_lop = '$ma_gv' OR Ten_lop = '$ten_gv'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        header("Location: error_admin3.html");
        exit();
    } else {
        $sql = "INSERT INTO LOPHOC (Ma_lop, Ten_lop) VALUES ('$ma_gv', '$ten_gv')";

        if ($conn->query($sql) === TRUE) {
            header("Location: done_admin3.html");
            exit();
        } else {
            echo "Lỗi: " . $sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
