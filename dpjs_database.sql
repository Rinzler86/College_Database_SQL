-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 04:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dpjs_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `degree_program`
--

CREATE TABLE `degree_program` (
  `degree_id` int(10) UNSIGNED NOT NULL,
  `program` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `concentration` varchar(30) DEFAULT NULL,
  `year_awarded` char(4) NOT NULL,
  `institution` varchar(50) NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degree_program`
--

INSERT INTO `degree_program` (`degree_id`, `program`, `major`, `concentration`, `year_awarded`, `institution`, `person_id`) VALUES
(1, 'Bachelor of General Studies', 'Communications/Psychology', NULL, '1991', 'University of Michigan', 1),
(2, 'Master of Science', 'Curriculum and Instruction', NULL, '1998', 'University of Tennessee', 1),
(3, 'Associate of Science', 'Computer Science Technology', NULL, '2000', 'Walters State Community College', 2),
(4, 'Bachelor of Science', 'Computer and Information Science', NULL, '2003', 'East Tennessee State University', 2),
(5, 'Master of Business Administration', 'Management Information Systems', NULL, '2008', 'Tennessee Technological University', 2),
(6, 'Bachelor of Arts', 'History/Business Administration', NULL, '1982', 'Carson-Newman College', 3),
(7, 'Master of Arts', 'Instructional Technology', NULL, '1998', 'Appalachian State University', 3),
(8, 'Education Specialist', 'Administration and Supervision', NULL, '2003', 'Lincoln Memorial University', 3),
(9, 'Doctor of Education', 'Educational Leadership', NULL, '2013', 'East Tennessee State University', 3),
(10, 'Bachelor of Science', 'Mechanical Engineering', NULL, '1997', 'Tennessee Technological University', 4),
(11, 'Master of Science', 'Data Analytics', NULL, '2019', 'Western Governors University', 4),
(12, 'Associate of Science', 'Computer Science', NULL, '2008', 'Walters State Community College', 5),
(13, 'Associate of Applied Science', 'Computer Science Technology', NULL, '2009', 'Walters State Community College', 5),
(14, 'Bachelor of Science', 'Computer and Information Science', 'Information Technology', '2013', 'East Tennessee State University', 5),
(15, 'Master of Science', 'Computer and Information Science', 'Information Technology', '2016', 'East Tennessee State University', 5);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `job_title` varchar(30) NOT NULL,
  `salary` decimal(9,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `organization_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organization_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
(1, 'Lolo', 'Blais', 'Lois.Blais@ws.edu', '555-111-1122'),
(2, 'Paul', 'Todara', 'Paul.Todaro@ws.edu', '555-222-2222'),
(3, 'Jama', 'jones', 'Jama.Suttion@ws.edu', '555-333-3333'),
(4, 'Krystal', 'Piper', 'Krystal.Piper@ws.edu', '555-444-4444'),
(5, 'Mark', 'Jones', 'Mark.Buckner@ws.edu', '555-555-5555');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `degree_program`
--
ALTER TABLE `degree_program`
  ADD PRIMARY KEY (`degree_id`),
  ADD KEY `fk_degree_program_person` (`person_id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `fk_job_person` (`person_id`),
  ADD KEY `fk_job_organization` (`organization_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `degree_program`
--
ALTER TABLE `degree_program`
  MODIFY `degree_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organization_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `degree_program`
--
ALTER TABLE `degree_program`
  ADD CONSTRAINT `fk_degree_program_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `fk_job_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`),
  ADD CONSTRAINT `fk_job_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
