<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./assets/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48;
        }
    </style>

    <title>University | Final Project 3 | By Mateus Schiavi</title>
</head>

<body class="flex flex-col items-center justify-center min-h-screen bg-gray-200">
    <div class="text-center">
        <img src="../assets/logo.jpg" alt="university-logo" width="300px">
    </div>

    <div class="w-full max-w-sm bg-white rounded-sm mt-8 p-5">
        <form action="../Acciones/register.php" method="post" class="flex flex-col gap-5 text-center">

            <span class="text-zinc-600">Welcome!</span>
            <div class="relative">
                <input name="email" type="email" placeholder="Email" class="h-10 border border-zinc-300 bg-white rounded-sm px-3" required>
                <span class="material-symbols-outlined absolute z-10 mt-3 right-3 text-zinc-500">mail</span>
            </div>
            <div class="relative">
                <input name="password" type="password" placeholder="Password" class="h-10 border border-zinc-300 bg-white rounded-sm px-3" required>
                <span class="material-symbols-outlined absolute z-10 mt-3 right-3 text-zinc-500">lock</span>
            </div>
            <input type="submit" value="Sign in" class="text-white font-semibold p-2 px-3 bg-blue-500 rounded-md self-end w-20">
        </form>
    </div>
</body>

</html>