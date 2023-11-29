-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/11/2023 às 15:11
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_university`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `enrolled_subjects`
--

CREATE TABLE `enrolled_subjects` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enrolled_subjects`
--

INSERT INTO `enrolled_subjects` (`id`, `student_id`, `subject_id`) VALUES
(5, 2, 8),
(7, 7, 10),
(9, 12, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ratings`
--

INSERT INTO `ratings` (`rating_id`, `student_id`, `subject_id`, `rating`) VALUES
(1, 2, 8, 100),
(3, 7, 10, 95),
(5, 12, 12, 92);

-- --------------------------------------------------------

--
-- Estrutura para tabela `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `subjects`
--

INSERT INTO `subjects` (`subject_id`, `name`) VALUES
(8, 'Math'),
(10, 'English'),
(12, 'Engineer');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `registration` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `rol` enum('ADMIN','PROFESSOR','STUDENT') DEFAULT NULL,
  `enrolled_subject` varchar(100) DEFAULT '0',
  `assigned_subject` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`user_id`, `registration`, `name`, `surname`, `email`, `password`, `address`, `birth_date`, `rol`, `enrolled_subject`, `assigned_subject`) VALUES
(1, 12345, 'Mateus', 'Schiavi', 'mateus@schiavi.com', 'mateus', 'Calle Rose, 123', '1998-07-04', 'ADMIN', NULL, '2'),
(2, 67890, 'Luan', 'Schiavi', 'luan@schiavi.com', 'luan', 'Calle Amarilla 456', '1993-06-10', 'PROFESSOR', NULL, NULL),
(3, 13579, 'Melissa', 'Schiavi', 'melissa@schiavi.com', 'melissa', 'Calle Rojo 789', '1990-04-01', 'STUDENT', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
