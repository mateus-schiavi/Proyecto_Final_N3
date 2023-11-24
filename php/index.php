<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="flex justify-center items-center h-screen bg-gray-100">

    <main class="bg-white p-8 rounded shadow-md w-96">
        <section class="text-center">
            <header>
                <img src="../assets/logo.jpg" alt="Logo" class="mx-auto w-64">
            </header>
            <h1 class="text-2xl font-bold mb-4">¡Bienvenido! Ingresa tu cuenta</h1>
            <form class="text-left" action="./data.php" method="post">
                <div class="flex border border-gray-300 rounded mb-3">
                    <input placeholder="Email" type="email" name="email" id="email" required
                        class="outline-none w-full py-2 px-4">
                    <span class="material-symbols-outlined mail text-gray-500 p-2">
                        mail
                    </span>
                </div>
                <div class="flex border border-gray-300 rounded mb-6">
                    <input placeholder="Password" type="password" name="password" id="password" required
                        class="outline-none w-full py-2 px-4">
                    <span class="material-symbols-outlined lock text-gray-500 p-2">
                        lock
                    </span>
                </div>
                <input type="submit" value="Ingresar"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded float-right">
            </form>
        </section>
    </main>

</body>

</html>
