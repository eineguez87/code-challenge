-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2020 at 03:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dermstore_challenge`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` char(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `fails` int(2) NOT NULL DEFAULT 0,
  `last_login_attempt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `password`, `created`, `fails`, `last_login_attempt`) VALUES
(1, 'edge', '$2y$10$j5KCxn.oZ.IvkrUTbHhhEuKLy0sdDnGiPQolBUrkZEY2RshW/34Ki', '2020-05-18 22:00:27', 0, '2020-05-18 22:00:27'),
(2, 'edge2', '$2y$10$7KfCbzaCE6zleiKweczv8eFzttY75CMOvY7ouMN5eUCAYGzf2ObUO', '2020-05-18 22:16:41', 0, '2020-05-19 01:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `attempted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `ip_address`, `username`, `attempted_at`) VALUES
(1, '127.0.0.1', 'edge2', '2020-05-19 00:44:33'),
(2, '127.0.0.1', 'edge2', '2020-05-19 00:47:25'),
(3, '127.0.0.1', 'edge2', '2020-05-19 00:47:43'),
(4, '127.0.0.1', 'edge2', '2020-05-19 00:49:19'),
(5, '127.0.0.1', 'edge2', '2020-05-19 00:50:27'),
(6, '127.0.0.1', 'edge2', '2020-05-19 00:54:28'),
(7, '127.0.0.1', 'edge2', '2020-05-19 00:54:48'),
(8, '127.0.0.1', 'edge2', '2020-05-19 00:58:25'),
(9, '127.0.0.1', 'edge2', '2020-05-19 00:58:27'),
(10, '127.0.0.1', 'edge2', '2020-05-19 00:59:58'),
(11, '127.0.0.1', 'edge2', '2020-05-19 01:00:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
