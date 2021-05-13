-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 10:24 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kanban_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dnumber` int(11) NOT NULL,
  `dname` varchar(25) NOT NULL,
  `dlocation` varchar(15) NOT NULL,
  `Mgr_id` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dnumber`, `dname`, `dlocation`, `Mgr_id`) VALUES
(1, 'Administration', 'Makati', '1234567'),
(2, 'Software Development', 'Makati', '7776665'),
(3, 'Software Development', 'Daet', '9876543'),
(6, 'Data Science', 'Makati', '7877888'),
(7, 'Marketing', 'Daet, CN', NULL),
(12, 'Manufacturing', 'Makati', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dept_proj`
--

CREATE TABLE `dept_proj` (
  `dnum` int(11) NOT NULL,
  `pnum` int(11) NOT NULL,
  `STATUS` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_proj`
--

INSERT INTO `dept_proj` (`dnum`, `pnum`, `STATUS`) VALUES
(3, 2, 'Done'),
(2, 3, 'Done'),
(3, 4, 'InProgress'),
(3, 1, 'ToDo'),
(3, 9, 'Done'),
(3, 16, 'InProgress'),
(3, 17, 'Expired'),
(3, 18, 'InProgress');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` char(7) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `fname` varchar(10) NOT NULL,
  `mi` varchar(1) DEFAULT NULL,
  `lname` varchar(15) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `address` varchar(25) NOT NULL,
  `bdate` date DEFAULT NULL,
  `salary` decimal(10,2) NOT NULL,
  `contact_no` varchar(13) DEFAULT NULL,
  `dnum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `pass`, `fname`, `mi`, `lname`, `sex`, `address`, `bdate`, `salary`, `contact_no`, `dnum`) VALUES
('1223456', 'holymary7', 'Mary', 'J', 'Vera', 'F', 'Daet CN, PH', '1991-04-01', '20000.00', '639758844777', 3),
('1234567', 'admin123', 'John', 'B', 'Martin', 'M', 'Maria st, Manila, PH', '1973-01-01', '140000.00', '639876543219', 1),
('4445566', 'jols234', 'Jolina', 'C', 'Victoria', 'F', 'Daet CN, PH', '1994-03-02', '40000.00', '639883399590', 3),
('5557789', 'joshforthr33', 'Joshua', 'V', 'Garcia', 'M', '456 st, Manila, PH', '1988-06-04', '60000.00', '639783883545', 2),
('6655778', 'donlafamingo3', 'James', 'A', 'Bautista', 'M', '123 st, Makati, PH', '1986-06-05', '70000.00', '639783223560', 2),
('7776665', 'mgrpass123', 'Carmilla', 'C', 'Carlos', 'F', 'Sto. Tomas,\r\nManila, PH', '1981-04-09', '100000.00', '639876993979', 2),
('7777777', 'andielungs7', 'Andrew', 'A', 'Alamino', 'M', 'Sta. Cruz, Manila, PH', '1998-02-05', '20000.00', '639883121240', 2),
('7877888', 'ericks7', 'Erick', 'A', 'Bautista', 'M', 'Talisay, CN', '2000-05-07', '10000.00', '639008768656', 6),
('9876543', 'sofengpass123', 'Jose', 'Q', 'Burgos', 'M', 'Daet CN, PH', '1982-08-09', '100000.00', '639887993876', 3),
('9997775', 'asdasdas', 'Melody', 'B', 'Mendoza', 'F', '09832136781', '1995-02-24', '20000.00', '09832136781', 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_logs`
--

CREATE TABLE `employee_logs` (
  `e_id` char(7) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_logs`
--

INSERT INTO `employee_logs` (`e_id`, `date`, `time`, `active`) VALUES
('1234567', '2021-04-27', '17:24:30', 1),
('1234567', '2021-04-27', '23:27:02', 1),
('1234567', '2021-04-27', '23:35:51', 0),
('1234567', '2021-04-27', '23:51:08', 1),
('1234567', '2021-04-27', '23:58:53', 0),
('9876543', '2021-04-28', '00:00:45', 1),
('9876543', '2021-04-28', '00:13:51', 0),
('1234567', '2021-04-28', '10:54:43', 1),
('1234567', '2021-04-28', '14:34:39', 1),
('1234567', '2021-04-28', '21:20:26', 0),
('1234567', '2021-04-28', '21:20:34', 1),
('1234567', '2021-04-28', '22:50:22', 0),
('9876543', '2021-04-28', '22:50:34', 1),
('9876543', '2021-04-28', '23:51:46', 0),
('1234567', '2021-04-28', '23:51:54', 1),
('1234567', '2021-04-28', '23:52:02', 0),
('9876543', '2021-04-28', '23:53:52', 1),
('9876543', '2021-04-28', '23:57:01', 0),
('1234567', '2021-04-28', '23:57:17', 1),
('1234567', '2021-04-29', '00:00:18', 0),
('9876543', '2021-04-29', '00:00:29', 1),
('9876543', '2021-04-29', '00:56:46', 0),
('1223456', '2021-04-29', '01:07:59', 1),
('1223456', '2021-04-29', '02:52:49', 1),
('1223456', '2021-04-29', '09:10:27', 0),
('1234567', '2021-04-29', '09:10:41', 1),
('1234567', '2021-04-29', '11:43:55', 0),
('9876543', '2021-04-29', '11:44:12', 1),
('9876543', '2021-04-29', '13:12:47', 1),
('9876543', '2021-04-29', '19:14:26', 0),
('1234567', '2021-04-29', '19:14:37', 1),
('1234567', '2021-04-29', '19:27:30', 0),
('9876543', '2021-04-29', '19:30:42', 1),
('9876543', '2021-04-29', '19:34:38', 0),
('1223456', '2021-04-29', '19:39:05', 1),
('1223456', '2021-04-29', '19:41:29', 0),
('9876543', '2021-04-29', '21:43:46', 1),
('1234567', '2021-05-03', '20:57:45', 1),
('1234567', '2021-05-03', '21:04:09', 1),
('1234567', '2021-05-03', '21:09:02', 1),
('1234567', '2021-05-03', '21:11:35', 1),
('1234567', '2021-05-03', '21:14:17', 1),
('1234567', '2021-05-03', '21:14:20', 0),
('9876543', '2021-05-04', '08:56:39', 1),
('9876543', '2021-05-04', '08:57:00', 0),
('9876543', '2021-05-04', '13:33:18', 1),
('9876543', '2021-05-04', '13:36:14', 1),
('9876543', '2021-05-04', '13:45:07', 1),
('9876543', '2021-05-04', '13:50:44', 1),
('9876543', '2021-05-04', '13:55:53', 1),
('9876543', '2021-05-04', '13:56:44', 0),
('9876543', '2021-05-04', '14:12:35', 1),
('9876543', '2021-05-04', '14:14:37', 1),
('9876543', '2021-05-04', '15:06:48', 0),
('9876543', '2021-05-04', '15:48:42', 1),
('9876543', '2021-05-04', '16:53:09', 1),
('9876543', '2021-05-04', '16:59:23', 1),
('9876543', '2021-05-04', '17:01:45', 1),
('9876543', '2021-05-04', '17:04:15', 1),
('9876543', '2021-05-04', '17:05:33', 1),
('9876543', '2021-05-04', '17:06:05', 0),
('9876543', '2021-05-04', '21:39:07', 1),
('9876543', '2021-05-04', '21:45:55', 1),
('9876543', '2021-05-04', '21:47:09', 1),
('9876543', '2021-05-04', '21:52:08', 1),
('9876543', '2021-05-04', '21:56:04', 1),
('9876543', '2021-05-04', '21:59:12', 1),
('9876543', '2021-05-04', '21:59:25', 0),
('1223456', '2021-05-04', '22:30:47', 1),
('1223456', '2021-05-04', '22:35:41', 1),
('1223456', '2021-05-04', '22:46:45', 1),
('1223456', '2021-05-04', '22:47:48', 1),
('1223456', '2021-05-04', '22:49:36', 1),
('1223456', '2021-05-04', '22:49:58', 0),
('1223456', '2021-05-04', '23:00:50', 1),
('1223456', '2021-05-04', '23:01:08', 0),
('1223456', '2021-05-05', '23:23:53', 1),
('1223456', '2021-05-05', '23:31:55', 0),
('1223456', '2021-05-05', '23:32:55', 1),
('1223456', '2021-05-05', '23:34:15', 1),
('1223456', '2021-05-05', '23:34:45', 0),
('1223456', '2021-05-05', '23:36:25', 1),
('1223456', '2021-05-05', '23:36:38', 0),
('1223456', '2021-05-05', '23:37:41', 1),
('1223456', '2021-05-05', '23:37:59', 0),
('1223456', '2021-05-05', '23:53:34', 1),
('1223456', '2021-05-06', '19:38:46', 1),
('1223456', '2021-05-06', '19:39:18', 0),
('1223456', '2021-05-06', '19:41:30', 1),
('1223456', '2021-05-06', '19:42:02', 0),
('1223456', '2021-05-07', '00:02:18', 1),
('1223456', '2021-05-07', '00:02:35', 0),
('1223456', '2021-05-07', '00:04:37', 1),
('1223456', '2021-05-07', '00:05:56', 0),
('1223456', '2021-05-07', '00:06:06', 1),
('1223456', '2021-05-07', '00:06:13', 0),
('1223456', '2021-05-07', '15:42:27', 1),
('1223456', '2021-05-07', '15:45:23', 1),
('1223456', '2021-05-07', '15:50:06', 1),
('1223456', '2021-05-07', '15:50:13', 0),
('1223456', '2021-05-07', '15:53:37', 1),
('1223456', '2021-05-07', '15:53:41', 0),
('1223456', '2021-05-07', '15:55:29', 1),
('1223456', '2021-05-07', '15:56:42', 1),
('1223456', '2021-05-07', '15:59:04', 1),
('1223456', '2021-05-07', '16:03:20', 0),
('9876543', '2021-05-07', '16:03:41', 1),
('9876543', '2021-05-07', '16:05:01', 0),
('1223456', '2021-05-07', '16:05:12', 1),
('1223456', '2021-05-07', '16:05:33', 0),
('1223456', '2021-05-07', '16:05:45', 1),
('1223456', '2021-05-07', '16:05:58', 0),
('1234567', '2021-05-07', '19:30:38', 1),
('1234567', '2021-05-07', '19:33:01', 0),
('1234567', '2021-05-07', '20:34:38', 1),
('1234567', '2021-05-07', '20:35:55', 0),
('1234567', '2021-05-07', '20:38:30', 1),
('1234567', '2021-05-07', '20:43:44', 0),
('1234567', '2021-05-07', '20:45:54', 1),
('1234567', '2021-05-07', '20:46:41', 0),
('1234567', '2021-05-07', '20:49:57', 1),
('1234567', '2021-05-07', '20:50:45', 0),
('1234567', '2021-05-07', '20:53:59', 1),
('1234567', '2021-05-07', '20:54:15', 0),
('1234567', '2021-05-07', '21:10:44', 1),
('1234567', '2021-05-07', '21:11:39', 0),
('1234567', '2021-05-08', '11:37:15', 1),
('1234567', '2021-05-08', '14:19:21', 0),
('1234567', '2021-05-08', '14:19:35', 1),
('1234567', '2021-05-08', '14:50:51', 0),
('9876543', '2021-05-08', '20:16:05', 1),
('9876543', '2021-05-08', '20:18:09', 0),
('1223456', '2021-05-08', '20:18:16', 1),
('1223456', '2021-05-09', '12:00:05', 0),
('1234567', '2021-05-09', '15:35:54', 1),
('1234567', '2021-05-09', '15:36:18', 0),
('1234567', '2021-05-09', '15:38:10', 1),
('1234567', '2021-05-09', '15:50:33', 0),
('1234567', '2021-05-09', '15:52:54', 1),
('1234567', '2021-05-09', '16:09:24', 0),
('9876543', '2021-05-09', '16:09:33', 1),
('9876543', '2021-05-09', '16:09:43', 0),
('1223456', '2021-05-09', '16:10:50', 1),
('1223456', '2021-05-09', '16:14:03', 0),
('1234567', '2021-05-09', '16:58:14', 1),
('1234567', '2021-05-09', '17:21:00', 0),
('9876543', '2021-05-09', '17:21:09', 1),
('9876543', '2021-05-09', '17:21:26', 0),
('1223456', '2021-05-09', '17:21:35', 1),
('1223456', '2021-05-09', '17:22:02', 0),
('1234567', '2021-05-09', '17:27:28', 1),
('1234567', '2021-05-09', '17:30:18', 0),
('1234567', '2021-05-09', '17:57:09', 1),
('1234567', '2021-05-09', '18:02:04', 0),
('9876543', '2021-05-09', '18:02:17', 1),
('9876543', '2021-05-09', '22:16:48', 0),
('1234567', '2021-05-09', '23:08:04', 1),
('1234567', '2021-05-09', '23:09:20', 0),
('1234567', '2021-05-09', '23:09:28', 1),
('1234567', '2021-05-09', '23:09:47', 0),
('1234567', '2021-05-10', '08:13:04', 1),
('1234567', '2021-05-10', '09:48:51', 0),
('1234567', '2021-05-10', '09:49:14', 1),
('1234567', '2021-05-10', '10:11:39', 0),
('9876543', '2021-05-10', '10:12:01', 1),
('9876543', '2021-05-10', '10:13:45', 0),
('1223456', '2021-05-10', '10:14:01', 1),
('1223456', '2021-05-10', '10:14:56', 0),
('1223456', '2021-05-10', '10:24:15', 1),
('1223456', '2021-05-10', '10:31:39', 0),
('9876543', '2021-05-10', '10:31:55', 1),
('9876543', '2021-05-10', '11:40:32', 0),
('1234567', '2021-05-10', '15:09:10', 1),
('1234567', '2021-05-10', '16:56:47', 1),
('1234567', '2021-05-10', '18:55:33', 0),
('1234567', '2021-05-11', '19:09:20', 1),
('1234567', '2021-05-12', '01:10:16', 0),
('1234567', '2021-05-12', '01:10:25', 1),
('1234567', '2021-05-12', '09:13:26', 0),
('1234567', '2021-05-12', '09:13:35', 1),
('1234567', '2021-05-12', '09:14:50', 0),
('9876543', '2021-05-12', '09:15:13', 1),
('9876543', '2021-05-12', '09:15:16', 0),
('9876543', '2021-05-12', '09:15:25', 1),
('9876543', '2021-05-12', '09:15:34', 0),
('1234567', '2021-05-12', '09:15:58', 1),
('1234567', '2021-05-13', '09:50:26', 1),
('1234567', '2021-05-13', '09:50:54', 0),
('1234567', '2021-05-13', '09:51:06', 1),
('1234567', '2021-05-13', '09:51:27', 0),
('9876543', '2021-05-13', '09:51:44', 1),
('9876543', '2021-05-13', '09:52:31', 0),
('1234567', '2021-05-13', '09:52:42', 1),
('1234567', '2021-05-13', '09:53:12', 0),
('9876543', '2021-05-13', '11:21:05', 1),
('9876543', '2021-05-13', '11:21:23', 0),
('1223456', '2021-05-13', '11:23:04', 1),
('1223456', '2021-05-13', '11:23:08', 0),
('9876543', '2021-05-13', '11:24:05', 1),
('9876543', '2021-05-13', '11:24:20', 0),
('9876543', '2021-05-13', '11:26:23', 1),
('9876543', '2021-05-13', '11:26:31', 0),
('9876543', '2021-05-13', '11:27:27', 1),
('9876543', '2021-05-13', '11:28:05', 0),
('9876543', '2021-05-13', '11:31:06', 1),
('9876543', '2021-05-13', '11:31:51', 0),
('9876543', '2021-05-13', '11:35:09', 1),
('9876543', '2021-05-13', '11:35:32', 0),
('9876543', '2021-05-13', '11:36:43', 1),
('9876543', '2021-05-13', '11:37:25', 0),
('9876543', '2021-05-13', '11:38:34', 1),
('9876543', '2021-05-13', '11:39:20', 0),
('1234567', '2021-05-13', '06:29:03', 1),
('1234567', '2021-05-13', '12:29:13', 0),
('1223456', '2021-05-13', '12:31:50', 1),
('1223456', '2021-05-13', '13:14:39', 0),
('9876543', '2021-05-13', '13:14:48', 1),
('9876543', '2021-05-13', '13:22:37', 0),
('9876543', '2021-05-13', '13:22:47', 1),
('9876543', '2021-05-13', '13:22:47', 1),
('9876543', '2021-05-13', '14:09:40', 1),
('9876543', '2021-05-13', '14:57:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emp_proj`
--

CREATE TABLE `emp_proj` (
  `e_id` char(7) NOT NULL,
  `pnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_proj`
--

INSERT INTO `emp_proj` (`e_id`, `pnum`) VALUES
('1223456', 2),
('4445566', 2),
('9876543', 2),
('1223456', 9),
('4445566', 9),
('9876543', 9),
('1223456', 16),
('4445566', 16),
('9876543', 16),
('1223456', 17),
('4445566', 17),
('9876543', 17),
('1223456', 18),
('4445566', 18),
('9876543', 18);

-- --------------------------------------------------------

--
-- Table structure for table `emp_task`
--

CREATE TABLE `emp_task` (
  `e_id` char(7) NOT NULL,
  `tnum` int(11) NOT NULL,
  `STATUS` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_task`
--

INSERT INTO `emp_task` (`e_id`, `tnum`, `STATUS`) VALUES
('1223456', 2, 'Done'),
('9876543', 1, 'Done'),
('4445566', 4, 'Done'),
('9876543', 3, 'Done'),
('1223456', 9, 'Done'),
('1223456', 10, 'Done'),
('1223456', 11, 'Done'),
('1223456', 12, 'InProgress'),
('1223456', 13, 'ToDo'),
('1223456', 14, 'ToDo');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pnumber` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `date_start` date NOT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pnumber`, `title`, `description`, `date_start`, `deadline`) VALUES
(1, 'Plantae', 'Plantae is a E-commerce site that will provide online shopping services for plant enthusiast and business owners.', '2021-04-16', '0000-00-00'),
(2, 'Kanban System', NULL, '2021-03-24', '2021-05-21'),
(3, 'Hotel Management Sys', NULL, '2021-03-24', '2021-04-15'),
(4, 'Kusinera App', NULL, '2021-04-15', '2021-06-15'),
(9, 'Shopee', 'Online shopping', '2021-04-28', '0000-00-00'),
(16, 'PROJECT V', 'this is project v.', '2021-05-08', '2021-05-21'),
(17, 'PROJECT N', '', '2021-05-13', '2021-05-12'),
(18, 'PROJECT Z', '', '2021-05-13', '2021-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `tnumber` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `date_start` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `pnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`tnumber`, `title`, `description`, `date_start`, `deadline`, `pnum`) VALUES
(1, 'ERD', NULL, '2021-03-24', '2021-05-21', 2),
(2, 'Database Setup', NULL, '2021-03-27', '2021-05-21', 2),
(3, 'Backend', NULL, '2021-03-27', '2021-05-21', 2),
(4, 'Frontend', NULL, '2021-03-27', '2021-05-21', 2),
(9, 'TASK A', NULL, '2021-05-06', '2021-05-21', 2),
(10, 'TASK B', NULL, '2021-05-06', '2021-05-21', 3),
(11, 'TASK SHOPPE A', '', '2021-05-07', '2021-05-21', 9),
(12, 'TASK V', 'This is task v.', '2021-05-08', '2021-05-21', 16),
(13, 'KUSINA TASK A', 'This is Task A.', '2021-05-10', '2021-05-21', 4),
(14, 'TASK Z', '', '2021-05-13', '2021-05-14', 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`),
  ADD KEY `department_ibfk_1` (`Mgr_id`);

--
-- Indexes for table `dept_proj`
--
ALTER TABLE `dept_proj`
  ADD KEY `dept_proj_ibfk_1` (`dnum`),
  ADD KEY `dept_proj_ibfk_2` (`pnum`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `employee_ibfk_1` (`dnum`);

--
-- Indexes for table `employee_logs`
--
ALTER TABLE `employee_logs`
  ADD KEY `employee_logs_ibfk_1` (`e_id`);

--
-- Indexes for table `emp_proj`
--
ALTER TABLE `emp_proj`
  ADD KEY `emp_proj_ibfk_1` (`e_id`),
  ADD KEY `emp_proj_ibfk_2` (`pnum`);

--
-- Indexes for table `emp_task`
--
ALTER TABLE `emp_task`
  ADD KEY `emp_task_ibfk_1` (`e_id`),
  ADD KEY `emp_task_ibfk_2` (`tnum`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pnumber`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`tnumber`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `task_ibfk_1` (`pnum`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pnumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `tnumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Mgr_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dept_proj`
--
ALTER TABLE `dept_proj`
  ADD CONSTRAINT `dept_proj_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dept_proj_ibfk_2` FOREIGN KEY (`pnum`) REFERENCES `project` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_logs`
--
ALTER TABLE `employee_logs`
  ADD CONSTRAINT `employee_logs_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_proj`
--
ALTER TABLE `emp_proj`
  ADD CONSTRAINT `emp_proj_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_proj_ibfk_2` FOREIGN KEY (`pnum`) REFERENCES `project` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_task`
--
ALTER TABLE `emp_task`
  ADD CONSTRAINT `emp_task_ibfk_1` FOREIGN KEY (`e_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emp_task_ibfk_2` FOREIGN KEY (`tnum`) REFERENCES `task` (`tnumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`pnum`) REFERENCES `project` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
