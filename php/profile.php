<?php
session_start();

require '../config/config.php';

function redirectBasedOnRole($role_id) {
    if ($role_id == 1) { // Admin
        return './admin_page.php';
    } elseif ($role_id == 2) { // Maestro
        return 'maestro_page.php';
    } elseif ($role_id == 3) { // Alumno
        return 'alumno_page.php';
    } else {
        // Papel desconhecido, redireciona para uma página de erro ou página padrão
        return 'unknown_role_page.php';
    }
}
