-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2026 at 11:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecoscan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alternative`
--

CREATE TABLE `alternative` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `ecoScore` float DEFAULT NULL,
  `product_barcode` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alternative`
--

INSERT INTO `alternative` (`id`, `name`, `brand`, `ecoScore`, `product_barcode`) VALUES
(1, 'Reusable Bottle', 'EcoLife', 8.5, '12345'),
(2, 'Solid Shampoo Bar', 'GreenHair', 9, '22222'),
(3, 'Organic Chocolate', 'NatureSweet', 7.5, '33333');

-- --------------------------------------------------------

--
-- Table structure for table `challenge`
--

CREATE TABLE `challenge` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `challenge`
--

INSERT INTO `challenge` (`id`, `title`, `description`, `points`) VALUES
(1, 'Use reusable bags', 'Avoid plastic bags for 1 week', 50),
(2, 'Eco Shopper', 'Buy only eco-friendly products for 5 days', 80),
(3, 'Recycle Habit', 'Recycle daily for one week', 60);

-- --------------------------------------------------------

--
-- Table structure for table `ecouser`
--

CREATE TABLE `ecouser` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ecouser`
--

INSERT INTO `ecouser` (`id`, `name`, `email`) VALUES
(1, 'Malek', 'malek@gmail.com'),
(2, 'Eya', 'eya@email.com'),
(3, 'Ashwak', 'ashwak@email.com'),
(4, 'Ghada', 'ghada@email.com'),
(5, 'Khalil', 'khalil@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `ecouser_challenge`
--

CREATE TABLE `ecouser_challenge` (
  `ecouser_id` int(11) NOT NULL,
  `challenge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ecouser_challenge`
--

INSERT INTO `ecouser_challenge` (`ecouser_id`, `challenge_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 2),
(4, 3),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `barcode` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `ecoImpact` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`barcode`, `name`, `brand`, `ecoImpact`) VALUES
('12345', 'Plastic Bottle', 'Safia', 2.5),
('22222', 'Shampoo', 'Garnier', 3.2),
('33333', 'Chocolate Bar', 'Lindt', 1.8);

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` int(11) NOT NULL,
  `totalPoints` int(11) DEFAULT NULL,
  `completedChallenges` int(11) DEFAULT NULL,
  `ecouser_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`id`, `totalPoints`, `completedChallenges`, `ecouser_id`) VALUES
(1, 100, 2, 1),
(2, 150, 2, 1),
(3, 80, 1, 2),
(4, 200, 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_barcode` (`product_barcode`);

--
-- Indexes for table `challenge`
--
ALTER TABLE `challenge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecouser`
--
ALTER TABLE `ecouser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecouser_challenge`
--
ALTER TABLE `ecouser_challenge`
  ADD PRIMARY KEY (`ecouser_id`,`challenge_id`),
  ADD KEY `challenge_id` (`challenge_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`barcode`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ecouser_id` (`ecouser_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `challenge`
--
ALTER TABLE `challenge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ecouser`
--
ALTER TABLE `ecouser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alternative`
--
ALTER TABLE `alternative`
  ADD CONSTRAINT `alternative_ibfk_1` FOREIGN KEY (`product_barcode`) REFERENCES `product` (`barcode`);

--
-- Constraints for table `ecouser_challenge`
--
ALTER TABLE `ecouser_challenge`
  ADD CONSTRAINT `ecouser_challenge_ibfk_1` FOREIGN KEY (`ecouser_id`) REFERENCES `ecouser` (`id`),
  ADD CONSTRAINT `ecouser_challenge_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenge` (`id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`ecouser_id`) REFERENCES `ecouser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
