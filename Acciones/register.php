<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config/config.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $passwordHash = password_hash($password, PASSWORD_DEFAULT);

    $sql = 'INSERT INTO users(email, password) VALUES (?, ?)';

    try {
        $new_user = $conn->prepare($sql);
        $new_user->bind_param('ss', $email, $passwordHash);
        $new_user->execute();
    } catch (mysqli_sql_exception $e) {
        echo $e;
    }
}
?>