-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 07:09 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megacitycab`
--
CREATE DATABASE IF NOT EXISTS `megacitycab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `megacitycab`;

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_addresses`
--

INSERT INTO `billing_addresses` (`id`, `booking_id`, `first_name`, `last_name`, `address1`, `address2`, `city`, `phone_number`, `email`) VALUES
(1, 18, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(2, 19, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', 'gggg', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(3, 20, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(4, 21, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(5, 22, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(6, 23, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(7, 24, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(8, 25, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(9, 26, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', 'gggg', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(10, 27, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(11, 28, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com'),
(12, 29, 'Ishan', 'Ardithya', 'Meegoda Estate, Artigala', '', 'Homagama', '0778266684', 'ardithya123@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `dropoff_location` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `pickup_location`, `dropoff_location`, `date`, `time`, `driver_id`, `total_price`, `status`, `created_at`) VALUES
(14, 27, 'Homagama', 'Anuradhapura', '2025-04-04', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 00:44:10'),
(15, 27, 'Homagama', 'Anuradhapura', '2025-04-04', '22:05:00', 17, 5000.00, 'completed', '2025-03-14 00:44:12'),
(16, 27, 'Meegoda', 'Colombo', '2025-04-20', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 01:18:15'),
(17, 27, 'HHH', 'FFFF', '2025-04-17', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 14:48:25'),
(18, 27, 'HHH', 'FFFF', '2025-04-26', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 14:53:08'),
(19, 27, 'HHH', 'FFFF', '2025-04-24', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 15:19:32'),
(20, 27, 'HHH', 'FFFF', '2025-04-29', '22:05:00', 16, 5000.00, 'completed', '2025-03-14 15:52:43'),
(21, 27, 'HHH', 'FFFF', '2025-04-29', '22:05:00', 17, 5000.00, 'pending', '2025-03-14 15:53:24'),
(22, 27, 'HHH', 'FFFF', '2025-04-03', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 15:54:20'),
(23, 27, 'HHH', 'FFFF', '2025-05-01', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 15:57:39'),
(24, 27, 'HHH', 'FFFF', '2025-05-10', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 16:02:03'),
(25, 27, 'HHH', 'asdasdasd', '2025-05-08', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 16:03:49'),
(26, 27, 'HHH', 'asdasdasd', '2025-05-08', '22:05:00', 17, 5000.00, 'pending', '2025-03-14 16:04:13'),
(27, 27, 'HHH', 'FFFF', '2025-04-03', '22:05:00', 17, 5000.00, 'completed', '2025-03-14 16:33:42'),
(28, 27, 'HHH', 'FFFF', '2025-04-02', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 17:51:14'),
(29, 27, 'HHH', 'FFFF', '2025-05-03', '22:05:00', 16, 5000.00, 'pending', '2025-03-14 18:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `subject`, `message`, `submission_date`) VALUES
(1, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', 'sdfsfs', '123', '2025-02-13 03:56:27'),
(2, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', 'sdfsfs', '123ss asdad asdasd', '2025-03-09 21:17:22'),
(4, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', '123', 'sad', '2025-03-09 21:27:22'),
(5, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', 'sdfsfs', 'asdadasdsadsadsadsadasd', '2025-03-09 21:27:43'),
(6, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', '123', '123', '2025-03-13 19:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `driver_users`
--

CREATE TABLE `driver_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `passenger_count` int(11) NOT NULL,
  `vehicle_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `driver_users`
--

INSERT INTO `driver_users` (`id`, `first_name`, `last_name`, `gender`, `email`, `home_address`, `nic`, `password`, `contact_number`, `vehicle_name`, `passenger_count`, `vehicle_number`, `created_at`) VALUES
(16, 'Ishan', 'Ardithya', 'Male', 'ardithya123@gmail.com', 'Meegoda Estate, Artigala', '123213131v', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0778266684', 'Model O', 4, 'XX-XXXX', '2025-03-13 11:07:22'),
(17, 'Ishan', 'Ardithya', 'Male', 'ardithya123444@gmail.com', 'Meegoda Estate, Artigala', '123213131v', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '0778266684', 'Model O', 4, 'XX-XXXX', '2025-03-13 18:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `id` int(11) NOT NULL,
  `passenger_count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `passenger_count`, `price`) VALUES
(1, 4, 5000.00),
(2, 9, 10000.00),
(3, 14, 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_users`
--

CREATE TABLE `staff_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_users`
--

INSERT INTO `staff_users` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(15, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Admin', '2025-03-13 10:59:38', '2025-03-13 10:59:38'),
(17, 'Admin', 'User', 'admin@megacitycab.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Admin', '2025-03-13 11:03:30', '2025-03-13 11:03:30'),
(18, 'DummyFN', 'DummyLN', 'dummy111@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Staff', '2025-03-13 19:21:16', '2025-03-13 19:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verification_token` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `contact_number`, `home_address`, `nic`, `password`, `created_at`, `verification_token`, `is_verified`) VALUES
(27, 'Ishan', 'Ardithya', 'ardithya123@gmail.com', '0778266684', 'Meegoda Estate, Artigala', '20012900041', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2025-03-13 11:06:29', NULL, 0),
(28, 'Ishan', 'Ardithya', 'ardithya1253@gmail.com', '0778266684', 'Meegoda Estate, Artigala', '1231231', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2025-03-13 18:42:28', NULL, 0),
(29, 'Ishan', 'Ardithya', 'ardithya123444@gmail.com', '0778266684', 'Meegoda Estate, Artigala', '20022900041', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '2025-03-14 00:11:26', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_users`
--
ALTER TABLE `driver_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passenger_count` (`passenger_count`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `staff_users`
--
ALTER TABLE `staff_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `driver_users`
--
ALTER TABLE `driver_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_users`
--
ALTER TABLE `staff_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD CONSTRAINT `billing_addresses_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `driver_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
