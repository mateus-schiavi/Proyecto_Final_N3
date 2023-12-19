<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/config/config.php';
print_r($_POST);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $sql = 'SELECT * FROM users WHERE email = ?';
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        $data = $result->fetch_assoc();

        if (password_verify($password, $data['password'])) {
            session_start();
            $_SESSION['user_data'] = $data;
            header('location: ../Views/userView.php');
        } else {
            header('location: ../index.php');
        }
    }
}
?>