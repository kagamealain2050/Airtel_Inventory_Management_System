-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 06:00 PM
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
-- Database: `inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int(11) NOT NULL,
  `asset_code` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `specifications` text DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`asset_id`, `asset_code`, `type`, `brand`, `model`, `serial_number`, `specifications`, `purchase_date`, `status`) VALUES
(1, '1', NULL, 'Iphonee', '12ProMax', NULL, NULL, NULL, 'ASSIGNED'),
(3, '3', 'Laptop', 'Lenovo', 'i9', '12873', NULL, '2026-04-12', 'AVAILABLE'),
(5, '5', NULL, 'JBL Speaker', 'flip7', NULL, NULL, NULL, 'AVAILABLE'),
(9, '42', NULL, 'fewf', 'e34', NULL, NULL, NULL, 'AVAILABLE');

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assigned_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `returned_date` timestamp NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT 'ACTIVE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `asset_id`, `user_id`, `assigned_date`, `returned_date`, `status`) VALUES
(4, 1, 3, '2026-04-25 13:57:02', '2026-04-25 14:06:06', 'RETURNED'),
(5, 5, 4, '2026-04-25 14:27:06', '2026-04-25 14:27:29', 'RETURNED'),
(6, 5, 3, '2026-04-25 14:54:59', '2026-04-25 14:55:16', 'RETURNED'),
(7, 9, 4, '2026-04-25 14:55:42', '2026-04-25 14:55:49', 'RETURNED'),
(8, 1, 3, '2026-04-25 15:06:50', NULL, 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `log_id` int(11) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `entity` varchar(50) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `performed_by` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`log_id`, `action`, `entity`, `entity_id`, `performed_by`, `timestamp`, `description`) VALUES
(4, 'RETURN', 'ASSET', 1, 'Kagame Alain', '2026-04-25 14:06:06', 'Asset returned'),
(5, 'RETURN', 'ASSET', 5, 'John Doe', '2026-04-25 14:27:30', 'Asset returned'),
(6, 'ASSIGN', 'ASSET', 5, 'Kagame Alain', '2026-04-25 14:55:00', 'Asset assigned to user'),
(7, 'RETURN', 'ASSET', 5, 'Kagame Alain', '2026-04-25 14:55:16', 'Asset returned'),
(8, 'ASSIGN', 'ASSET', 9, 'John Doe', '2026-04-25 14:55:42', 'Asset assigned to user'),
(9, 'RETURN', 'ASSET', 9, 'John Doe', '2026-04-25 14:55:49', 'Asset returned'),
(10, 'ASSIGN', 'ASSET', 1, 'Kagame Alain', '2026-04-25 15:06:50', 'Asset assigned to user');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `handled_by` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `asset_id`, `user_id`, `action`, `action_date`, `handled_by`, `notes`, `timestamp`) VALUES
(1, 1, 3, 'RETURN', '2026-04-25 14:06:06', 'SYSTEM', NULL, '2026-04-25 16:06:06'),
(2, 5, 4, 'RETURN', '2026-04-25 14:27:30', 'SYSTEM', NULL, '2026-04-25 16:27:30'),
(3, 5, 3, 'ISSUE', '2026-04-25 14:55:00', 'SYSTEM', NULL, '2026-04-25 16:55:00'),
(4, 5, 3, 'RETURN', '2026-04-25 14:55:16', 'SYSTEM', NULL, '2026-04-25 16:55:16'),
(5, 9, 4, 'ISSUE', '2026-04-25 14:55:42', 'SYSTEM', NULL, '2026-04-25 16:55:42'),
(6, 9, 4, 'RETURN', '2026-04-25 14:55:49', 'SYSTEM', NULL, '2026-04-25 16:55:49'),
(7, 1, 3, 'ISSUE', '2026-04-25 15:06:50', 'SYSTEM', NULL, '2026-04-25 17:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `department_id`, `password`, `regno`) VALUES
(3, 'Kagame Alain', '24rp02639', NULL, NULL, '24rp09144', NULL),
(4, 'John Doe', 'john@example.com', '0780000000', NULL, '1234', NULL),
(5, 'Jane Smith', 'jane@example.com', '0781111111', NULL, '1234', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD UNIQUE KEY `asset_code` (`asset_code`),
  ADD UNIQUE KEY `serial_number` (`serial_number`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `asset_id` (`asset_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`),
  ADD CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
