<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require '../config/config.php';

    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = 'SELECT * FROM usuarios WHERE correo = :correo';
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':correo', $email);
    $stmt->execute();
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_nombre'] = $user['nombre'];
        $_SESSION['user_apellido'] = $user['apellido'];
        $_SESSION['user_correo'] = $user['correo'];
        $_SESSION['user_direccion'] = $user['direccion'];
        $_SESSION['user_fecha_nacimiento'] = $user['fecha_nacimiento'];
        $_SESSION['user_dni'] = $user['dni'];
        $_SESSION['user_password'] = $user['password'];

        header('Location: profile.php');
        exit();
    } else {
        $error_message = 'Invalid User or Password. Try Again';
        header('Location: index.php');
    }
}
?>
