-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2022 at 09:19 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_task`
--

-- --------------------------------------------------------

--
-- Table structure for table `hni_details`
--

CREATE TABLE `hni_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `availability` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hni_details`
--

INSERT INTO `hni_details` (`id`, `user_id`, `name`, `age`, `email`, `availability`) VALUES
(1, 1, 'dbs', 40, 'dbs@gmail.com', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `hni_user`
--

CREATE TABLE `hni_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hni_user`
--

INSERT INTO `hni_user` (`user_id`, `user_name`, `email`, `password`) VALUES
(1, 'dbs_1', 'dbs@gmail.com', 'dbs000');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `user_id` int(11) NOT NULL,
  `avail_id` int(11) NOT NULL,
  `slot_time` datetime NOT NULL,
  `availability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`user_id`, `avail_id`, `slot_time`, `availability`) VALUES
(1, 1, '2022-03-05 09:04:38', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `wm_details`
--

CREATE TABLE `wm_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `availability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wm_details`
--

INSERT INTO `wm_details` (`id`, `user_id`, `name`, `email`, `age`, `availability`) VALUES
(1, 1, 'xyz', 'xyz@gmail.com', 40, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `wm_user`
--

CREATE TABLE `wm_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wm_user`
--

INSERT INTO `wm_user` (`user_id`, `user_name`, `email`, `password`) VALUES
(1, 'xyz', 'xyz@gmail.com', 'xyz00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hni_details`
--
ALTER TABLE `hni_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hni` (`user_id`);

--
-- Indexes for table `hni_user`
--
ALTER TABLE `hni_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`avail_id`),
  ADD KEY `fk_time` (`user_id`);

--
-- Indexes for table `wm_details`
--
ALTER TABLE `wm_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wm` (`user_id`);

--
-- Indexes for table `wm_user`
--
ALTER TABLE `wm_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hni_details`
--
ALTER TABLE `hni_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hni_user`
--
ALTER TABLE `hni_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `avail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wm_details`
--
ALTER TABLE `wm_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wm_user`
--
ALTER TABLE `wm_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hni_details`
--
ALTER TABLE `hni_details`
  ADD CONSTRAINT `fk_hni` FOREIGN KEY (`user_id`) REFERENCES `hni_user` (`user_id`);

--
-- Constraints for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD CONSTRAINT `fk_time` FOREIGN KEY (`user_id`) REFERENCES `hni_user` (`user_id`);

--
-- Constraints for table `wm_details`
--
ALTER TABLE `wm_details`
  ADD CONSTRAINT `fk_wm` FOREIGN KEY (`user_id`) REFERENCES `wm_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
