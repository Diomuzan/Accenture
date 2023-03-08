-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2022 at 03:26 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accenture`
--
CREATE DATABASE IF NOT EXISTS `accenture` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `accenture`;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `employee_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  `subject_name` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`subject_id`,`subject_name`,`student_id`),
  KEY `result_student_fk` (`student_id`),
  KEY `result_subject_fk` (`subject_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`employee_id`, `subject_id`, `result`, `subject_name`, `student_id`) VALUES
(0, 0, NULL, 'Database', 2),
(0, 0, NULL, 'HTML & CSS', 3),
(0, 0, NULL, 'JavaScript', 4),
(0, 0, NULL, 'PHP', 2),
(0, 0, NULL, 'Project Sandbox', 2),
(0, 0, NULL, 'Project Sandbox', 3),
(0, 0, NULL, 'Project Sandbox', 4),
(0, 0, NULL, 'Project Sandbox', 5);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `class`) VALUES
(1, 'Vasily Goloborodko ', 'S1'),
(2, 'Ivan Stamenov', 'S2'),
(3, 'Katalina Novakovic', 'S3'),
(4, 'Sanne Marijnissen', 'S4'),
(5, 'Keisuke Tanaka', 'S5');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`name`, `id`) VALUES
('PHP', 1),
('Database', 2),
('HTML & CSS', 3),
('JavaScript', 4),
('Project Sandbox', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_student_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `result_subject_fk` FOREIGN KEY (`subject_name`) REFERENCES `subject` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
