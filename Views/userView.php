<?php
session_start();
if (isset($_SESSION['user_data'])) {
    $userdata = $_SESSION['user_data'];
} else {
    header('location: ../index.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Welcome! <?= $userdata['email']?></h1>
</body>
</html>