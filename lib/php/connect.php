<?php
$server = "localhost";
$username = "root";
$password = "";
$db = "inventory";

# Connect to MySQL server
$con = new mysqli($server, $username, $password, $db);

# Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
