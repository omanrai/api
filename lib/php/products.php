<?php
include "connect.php";

$sql = "SELECT * FROM product";
$data = array();
$result = $con->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}
echo json_encode($data);
?>