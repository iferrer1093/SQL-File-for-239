-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 09:14 AM
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
-- Database: `pets and owners`
--

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `owner_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`owner_id`, `first_name`, `last_name`, `phone`, `email`, `address`) VALUES
(1, 'Sarah', 'Thompson', '555-341-9821', 'sarah.t@gmail.com', '123 Maple Ave'),
(2, 'James', 'Rivera', '555-293-4402', 'jrivera@yahoo.com', '456 Oak Street'),
(3, 'Linda', 'Martinez', '555-110-6589', 'lmartinez@gmail.com', '789 Pine Blvd'),
(4, 'Robert', 'Chen', '555-888-9021', 'rchen@hotmail.com', '22 Willow Lane'),
(5, 'Emily', 'Brooks', '555-477-1167', 'emily.brooks@gmail.com', '64 Birch Road');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `pet_name` varchar(50) NOT NULL,
  `species` varchar(30) NOT NULL,
  `breed` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birthdate` date NOT NULL,
  `weight_lb` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `owner_id`, `pet_name`, `species`, `breed`, `gender`, `birthdate`, `weight_lb`) VALUES
(1, 1, 'Bella', 'Dog', 'Golden Retriever', 'F', '2019-04-12', 29.50),
(2, 1, 'Milo', 'Cat', 'Siamese', 'M', '2021-07-03', 6.20),
(3, 2, 'Rocky', 'Dog', 'Bulldog', 'M', '2018-01-22', 24.00),
(4, 2, 'Daisy', 'Rabbit', 'Holland Lop', 'F', '2022-05-18', 2.80),
(5, 3, 'Luna', 'Cat', 'Maine Coon', 'F', '2020-09-10', 7.40),
(6, 3, 'Shadow', 'Dog', 'Labrador', 'M', '2017-02-14', 31.00),
(7, 4, 'Coco', 'Bird', 'Cockatiel', 'F', '2021-11-30', 0.10),
(8, 5, 'Max', 'Dog', 'German Shepherd', 'M', '2020-06-06', 34.20),
(9, 5, 'Nala', 'Cat', 'Persian', 'F', '2022-03-20', 5.80),
(10, 5, 'Buster', 'Hamster', 'Syrian', 'M', '2023-08-12', 0.12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `FK p.owner_id to o.owner_id` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `FK p.owner_id to o.owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
