<?php
require_once '../config/config.php';

if(!isset($_SESSION['id']) || $_SESSION['rol'] !== 'STUDENT') {

    header('Location: ../php/index.php');
    exit();
}

$user_id = $_SESSION['id'];

$sql = "SELECT name, surname FROM users WHERE user_id = '$user_id'";

$result = mysqli_query($conn, $sql);

if(!$result) {
    die("An error was found:" . mysqli_error($conn));
}

$row = mysqli_fetch_assoc($result);

if($row) {

    $name = $row['name'];
    $surname = $row['surname'];
} else {
    echo "User not found";
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="../styles.css">
    <link rel="icon" href="../assets/logo.jpg">
    <title>Universidad | Alumno Dashboard</title>
</head>

<body>
    <div class="w-screen h-screen flex bg-lightgray">
        <aside class="w-80 h-full bg-dark">
            <div class="flex items-center gap-3 p-5">
                <img class="rounded-full" src="../assets/logo.jpg" alt="university-logo" width="50px"
                    height="60px">
                <span class="text-white font-medium">Universidad</span>
            </div>

            <div style="width: 100%; height: 1px; background-color: #4c5157; "></div>

            <div class="text-black flex flex-col p-5 gap-3">
                <span style="font-size: 20px;">Student</span>

                <span><?php echo $name . " " . $surname ?></span>
            </div>
            <div style="width: 100%; height: 1px; background-color: #4c5157; "></div>

            <div class="text-black flex flex-col gap-5 p-5">
                <p>Menu Alumno</p>


                <div>
                    <a href="alumno_calificaciones.php" class="flex items-center gap-3 ">
                        <span class="material-symbols-outlined">
                            task
                        </span>

                        <span>See Ratings</span>
                    </a>
                </div>

                <div>
                    <a href="alumno_clases.php" class="flex items-center gap-3 ">
                        <span class="material-symbols-outlined">
                            tv_gen
                        </span>

                        <span>Administrate your Classes</span>
                    </a>
                </div>


            </div>
        </aside>
        <div class="w-full flex flex-col">
            <header class="w-full flex items-center justify-between h-10 p-5 bg-white shadow-sm">

                <div class="flex items-center gap-5">
                    <span class="material-symbols-outlined text-zinc-800">
                        menu
                    </span>
                    <span class="text-zinc-800">
                        Home
                    </span>
                </div>

                <nav>
                    <li class="flex items-center gap-2 text-zinc-800 cursor-pointer" onclick="toggleLogoutMenu()">

                        <?php echo $name . '' . $surname ?>
                        <ul class="flex flex-col">
                            <span class="material-symbols-outlined">
                                expand_more
                            </span>
                            <ul id="logout-menu" class="hidden absolute bg-white right-0 mt-6 py-2 px-4 rounded shadow">

                                <a href="alumno_profile.php" class="flex items-center gap-2 hover:bg-zinc-200">
                                    <span class="material-symbols-outlined">
                                        account_circle
                                    </span>
                                    <li class="px-2 py-2 text-zinc-700 cursor-pointer ">Profile</li>
                                </a>

                                <a href="../logout.php" class="flex items-center gap-2 hover:bg-zinc-200"
                                    style="color: #Dc2f19;">
                                    <span class="material-symbols-outlined">
                                        logout
                                    </span>
                                    <li class="px-2 py-2 text-zinc-700 cursor-pointer " style="color: #Dc2f19;">Logout
                                    </li>

                                </a>


                            </ul>
                    </li>
                    </ul>
                </nav>
            </header>

            <div class="h-full pl-3">
                <div class="w-full flex items-center justify-between pr-3 mt-4 mb-5">
                    <h1 class="font-bold text-zinc-700 text-xl ">Dashboard</h1>
                    <p class="font-semibold text-sm text-zinc-700"><span class="text-myblue">Home</span> / Dashboard
                    </p>
                </div>

                <div class="w-200 rounded-sm p-3 bg-white shadow-md">
                    <span class="font-semibold text-zinc-700">Welcome</span>
                    <p class="text-zinc-700">Select the action you want to perform in the menu tabs on the left</p>
                </div>
            </div>
        </div>

    </div>

    <script src="../index.js"></script>
</body>

</html>