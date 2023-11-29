<?php
require_once './config/config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];

        $sql = 'SELECT user_id, rol, email, name, surname, address, birth_date, password FROM users WHERE email = ?';
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows == 1) {
            $stmt->bind_result($id, $rol, $email, $name, $surname, $address, $birth_date, $passwordHash);
            $stmt->fetch();

            if (password_verify($password, $passwordHash)) {
                session_start();
                $_SESSION['id'] = $id;
                $_SESSION['rol'] = $rol;
                $_SESSION['email'] = $email;
                $_SESSION['name'] = $name;
                $_SESSION['surname'] = $surname;
                $_SESSION['address'] = $address;
                $_SESSION['birth_date'] = $birth_date;

                switch ($rol) {
                    case 'ADMIN':
                        header('Location: ../admin/dashboard.php');
                        break;
                    case 'PROFESSOR':
                        header('Location: ../professor/dashboard.php');
                        break;
                    case 'STUDENT':
                        header('Location: ../student/dashboard.php');
                        break;
                    default:
                        echo 'Invalid Credentials';
                        break;
                }
            } else {
                echo "Invalid Credentials";
            }
        } else {
            echo "Invalid Credentials";
        }

        $stmt->close();
        $conn->close();
    } else {
        echo "Please, fill all the required fields";
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="assets/logo.jpg">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48;
        }
    </style>

    <title>University | Final Project 3 | By Mateus Schiavi</title>
</head>

<body class="flex flex-col items-center justify-center min-h-screen bg-gray-200">
    <div class="text-center">
        <img src="./assets/logo.jpg" alt="university-logo" width="300px">
    </div>

    <div class="w-full max-w-sm bg-white rounded-sm mt-8 p-5">
        <form action="index.php" method="post" class="flex flex-col gap-5 text-center">

            <span class="text-zinc-600">Welcome!</span>
            <div class="relative">
                <input name="email" type="email" placeholder="Email"
                    class="h-10 border border-zinc-300 bg-white rounded-sm px-3" required>
                <span class="material-symbols-outlined absolute z-10 mt-3 right-3 text-zinc-500">mail</span>
            </div>
            <div class="relative">
                <input name="password" type="password" placeholder="Password"
                    class="h-10 border border-zinc-300 bg-white rounded-sm px-3" required>
                <span class="material-symbols-outlined absolute z-10 mt-3 right-3 text-zinc-500">lock</span>
            </div>
            <input type="submit" value="Sign in"
                class="text-white font-semibold p-2 px-3 bg-blue-500 rounded-md self-end w-20">
        </form>
    </div>
</body>

</html>


