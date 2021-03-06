-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 07:56 AM
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
(4, 'Data Science', 'Makati', NULL),
(7, 'Behavioral Science', 'Manila', '1010101');

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
(3, 20, 'InProgress'),
(3, 21, 'Expired'),
(3, 23, 'Done'),
(3, 24, 'ToDo');

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
('1010101', 'mindhunter7', 'Holden', 'N', 'Ford', 'M', 'Talisay, CN', '2021-05-03', '19999.00', '09087976547', 7),
('1223456', 'holymary7', 'Mary', 'B', 'Vera', 'F', '639758844777', '1991-04-01', '20000.00', '639758844777', 3),
('1234567', 'admin123', 'John', 'B', 'Martin', 'M', 'Maria st, Manila, PH', '1973-01-01', '140000.00', '639876543219', 1),
('4445566', 'jols234', 'Jolina', 'C', 'Victoria', 'F', 'Daet CN, PH', '1994-03-02', '40000.00', '639883399590', 3),
('5557789', 'joshforthr33', 'Joshua', 'V', 'Garcia', 'M', '456 st, Manila, PH', '1988-06-04', '60000.00', '639783883545', 2),
('6655778', 'donlafamingo3', 'James', 'A', 'Bautista', 'M', '123 st, Makati, PH', '1986-06-05', '70000.00', '639783223560', 2),
('7776665', 'mgrpass123', 'Carmilla', 'C', 'Carlos', 'F', 'Sto. Tomas,\r\nManila, PH', '1981-04-09', '100000.00', '639876993979', 2),
('7777777', 'andielungs7', 'Andrew', 'A', 'Alamino', 'M', 'Sta. Cruz, Manila, PH', '1998-02-05', '20000.00', '639883121240', 2),
('9876543', 'sofengpass123', 'Jose', 'Q', 'Burgos', 'M', 'Daet CN, PH', '1982-08-09', '100000.00', '639887993876', 3);

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
('9876543', '2021-05-13', '14:57:12', 0),
('1234567', '2021-05-13', '20:52:18', 1),
('1234567', '2021-05-13', '20:52:54', 0),
('9876543', '2021-05-13', '20:53:08', 1),
('9876543', '2021-05-13', '20:55:14', 1),
('9876543', '2021-05-13', '21:02:03', 1),
('9876543', '2021-05-13', '21:02:48', 0),
('9876543', '2021-05-13', '21:05:09', 1),
('9876543', '2021-05-13', '21:05:24', 0),
('9876543', '2021-05-13', '21:07:18', 1),
('9876543', '2021-05-13', '21:07:45', 0),
('9876543', '2021-05-13', '21:53:39', 1),
('9876543', '2021-05-13', '21:54:32', 0),
('9876543', '2021-05-13', '21:54:46', 1),
('9876543', '2021-05-13', '22:02:25', 1),
('9876543', '2021-05-13', '22:04:15', 0),
('9876543', '2021-05-13', '22:06:31', 1),
('9876543', '2021-05-13', '22:06:47', 0),
('9876543', '2021-05-14', '16:34:02', 1),
('9876543', '2021-05-14', '16:34:24', 0),
('9876543', '2021-05-14', '16:36:30', 1),
('9876543', '2021-05-14', '16:36:39', 0),
('9876543', '2021-05-14', '16:54:50', 1),
('9876543', '2021-05-14', '18:44:12', 1),
('9876543', '2021-05-14', '18:44:59', 0),
('9876543', '2021-05-14', '19:08:15', 1),
('9876543', '2021-05-14', '19:09:09', 0),
('9876543', '2021-05-14', '22:48:10', 1),
('9876543', '2021-05-14', '22:50:51', 1),
('9876543', '2021-05-14', '22:52:15', 1),
('9876543', '2021-05-14', '22:55:19', 0),
('9876543', '2021-05-14', '23:00:26', 1),
('9876543', '2021-05-14', '23:01:29', 0),
('9876543', '2021-05-14', '23:03:59', 1),
('9876543', '2021-05-14', '23:04:20', 0),
('9876543', '2021-05-14', '23:06:58', 1),
('9876543', '2021-05-14', '23:07:05', 0),
('9876543', '2021-05-14', '23:08:18', 1),
('9876543', '2021-05-15', '09:02:16', 1),
('9876543', '2021-05-15', '09:02:43', 0),
('9876543', '2021-05-15', '09:04:10', 1),
('9876543', '2021-05-15', '09:04:21', 0),
('9876543', '2021-05-15', '09:19:19', 1),
('9876543', '2021-05-15', '09:20:13', 0),
('9876543', '2021-05-15', '09:21:10', 1),
('9876543', '2021-05-15', '09:22:10', 0),
('9876543', '2021-05-15', '09:28:05', 1),
('9876543', '2021-05-15', '09:28:58', 0),
('9876543', '2021-05-15', '10:04:10', 1),
('9876543', '2021-05-15', '10:04:21', 0),
('9876543', '2021-05-15', '10:05:07', 1),
('9876543', '2021-05-15', '10:05:22', 0),
('9876543', '2021-05-15', '10:06:13', 1),
('9876543', '2021-05-15', '11:01:59', 1),
('9876543', '2021-05-15', '11:02:11', 0),
('9876543', '2021-05-15', '11:03:29', 1),
('9876543', '2021-05-15', '11:06:44', 0),
('9876543', '2021-05-15', '11:13:04', 1),
('9876543', '2021-05-15', '11:14:47', 0),
('9876543', '2021-05-15', '11:15:35', 1),
('9876543', '2021-05-15', '11:17:24', 0),
('9876543', '2021-05-15', '13:33:45', 1),
('9876543', '2021-05-15', '13:34:26', 0),
('9876543', '2021-05-15', '13:35:44', 1),
('9876543', '2021-05-15', '14:14:34', 0),
('1234567', '2021-05-15', '15:03:47', 1),
('1234567', '2021-05-15', '15:08:18', 0),
('1234567', '2021-05-15', '15:10:04', 1),
('1234567', '2021-05-15', '15:10:30', 0),
('1234567', '2021-05-15', '15:14:17', 1),
('1234567', '2021-05-15', '15:14:36', 0),
('1234567', '2021-05-15', '18:27:58', 1),
('1234567', '2021-05-15', '18:29:48', 0),
('1234567', '2021-05-16', '10:06:45', 1),
('1234567', '2021-05-16', '10:16:48', 0),
('9876543', '2021-05-16', '10:17:09', 1),
('9876543', '2021-05-16', '10:17:32', 0),
('1234567', '2021-05-16', '10:17:48', 1),
('1234567', '2021-05-16', '10:17:57', 0),
('1223456', '2021-05-16', '10:18:10', 1),
('1223456', '2021-05-16', '10:18:52', 0),
('1234567', '2021-05-16', '12:18:12', 1),
('1234567', '2021-05-16', '12:18:38', 0),
('1234567', '2021-05-16', '12:22:30', 1),
('1234567', '2021-05-16', '12:23:05', 0),
('1234567', '2021-05-16', '12:31:53', 1),
('1234567', '2021-05-16', '12:32:49', 0),
('1234567', '2021-05-16', '13:02:12', 1),
('1234567', '2021-05-16', '13:06:28', 0),
('1234567', '2021-05-16', '13:12:11', 1),
('1234567', '2021-05-16', '13:54:57', 1),
('1234567', '2021-05-16', '13:55:47', 0),
('9876543', '2021-05-16', '14:19:16', 1),
('9876543', '2021-05-16', '14:20:27', 0),
('9876543', '2021-05-16', '14:21:12', 1),
('9876543', '2021-05-16', '14:21:50', 0),
('9876543', '2021-05-16', '14:22:07', 1),
('9876543', '2021-05-16', '14:22:20', 0),
('9876543', '2021-05-16', '14:31:08', 1),
('9876543', '2021-05-16', '14:37:16', 1),
('9876543', '2021-05-16', '14:37:44', 0),
('9876543', '2021-05-16', '14:42:13', 1),
('9876543', '2021-05-16', '14:43:23', 0),
('9876543', '2021-05-16', '14:43:33', 1),
('9876543', '2021-05-16', '14:43:41', 0),
('9876543', '2021-05-16', '14:45:08', 1),
('9876543', '2021-05-16', '14:45:20', 0),
('1234567', '2021-05-16', '17:36:59', 1),
('1234567', '2021-05-16', '17:37:02', 0),
('1234567', '2021-05-16', '17:37:25', 1),
('1234567', '2021-05-16', '17:37:59', 0),
('9876543', '2021-05-16', '18:02:38', 1),
('9876543', '2021-05-16', '18:05:23', 0),
('1223456', '2021-05-16', '18:06:21', 1),
('1223456', '2021-05-16', '18:09:05', 0),
('1234567', '2021-05-16', '20:51:18', 1),
('1234567', '2021-05-16', '20:52:08', 0),
('9876543', '2021-05-16', '20:52:19', 1),
('9876543', '2021-05-16', '20:52:34', 0),
('1223456', '2021-05-16', '20:52:51', 1),
('1223456', '2021-05-16', '20:52:56', 0),
('9876543', '2021-05-16', '15:04:41', 1),
('9876543', '2021-05-16', '21:04:52', 0),
('1234567', '2021-05-16', '21:05:17', 1),
('1234567', '2021-05-17', '14:03:06', 1),
('1234567', '2021-05-17', '21:26:47', 0),
('9876543', '2021-05-17', '21:26:58', 1),
('9876543', '2021-05-18', '03:13:25', 1),
('9876543', '2021-05-18', '09:13:38', 0),
('9876543', '2021-05-18', '09:13:57', 1),
('9876543', '2021-05-18', '13:18:32', 0),
('1223456', '2021-05-18', '13:18:44', 1),
('1223456', '2021-05-18', '13:19:06', 0),
('1234567', '2021-05-18', '14:52:33', 1),
('1234567', '2021-05-18', '14:53:08', 0),
('9876543', '2021-05-18', '14:53:20', 1),
('9876543', '2021-05-18', '14:53:45', 0),
('1234567', '2021-05-18', '16:56:26', 1),
('9876543', '2021-05-18', '17:03:28', 1),
('9876543', '2021-05-18', '17:03:37', 0),
('1234567', '2021-05-18', '17:08:48', 1),
('1234567', '2021-05-18', '17:09:07', 0),
('9876543', '2021-05-18', '17:13:04', 1),
('9876543', '2021-05-18', '17:13:11', 0),
('1234567', '2021-05-18', '17:13:19', 1),
('1234567', '2021-05-18', '17:13:34', 0),
('1234567', '2021-05-18', '17:14:30', 1),
('1234567', '2021-05-18', '17:14:44', 0),
('1234567', '2021-05-18', '17:15:36', 1),
('1234567', '2021-05-18', '17:15:50', 0),
('1234567', '2021-05-18', '17:16:59', 1),
('1234567', '2021-05-18', '17:17:13', 0),
('1234567', '2021-05-18', '17:17:59', 1),
('1234567', '2021-05-18', '17:19:34', 0),
('1234567', '2021-05-18', '17:20:14', 1),
('1234567', '2021-05-18', '17:21:48', 0),
('9876543', '2021-05-18', '17:22:02', 1),
('9876543', '2021-05-18', '17:22:58', 0),
('9876543', '2021-05-18', '17:23:48', 1),
('9876543', '2021-05-18', '17:25:15', 0),
('9876543', '2021-05-18', '17:29:58', 1),
('9876543', '2021-05-18', '17:34:27', 0),
('1223456', '2021-05-18', '17:34:39', 1),
('1223456', '2021-05-18', '17:36:00', 0),
('1223456', '2021-05-18', '17:37:09', 1),
('1223456', '2021-05-18', '17:37:43', 0),
('1223456', '2021-05-18', '17:43:50', 1),
('1223456', '2021-05-18', '17:44:01', 0),
('1223456', '2021-05-18', '17:47:04', 1),
('1223456', '2021-05-18', '17:47:35', 0),
('1223456', '2021-05-18', '17:51:36', 1),
('1223456', '2021-05-18', '17:59:12', 0),
('1223456', '2021-05-18', '18:00:37', 1),
('1223456', '2021-05-18', '18:01:14', 0),
('1223456', '2021-05-18', '18:02:08', 1),
('1223456', '2021-05-18', '18:02:30', 0),
('1223456', '2021-05-18', '18:10:05', 1),
('1223456', '2021-05-18', '18:11:01', 0),
('1223456', '2021-05-18', '18:11:53', 1),
('1223456', '2021-05-18', '18:12:38', 0),
('1223456', '2021-05-18', '18:19:13', 1),
('1223456', '2021-05-18', '18:20:21', 0),
('1223456', '2021-05-18', '18:25:11', 1),
('1223456', '2021-05-18', '18:25:51', 0),
('1223456', '2021-05-18', '18:28:37', 1),
('1223456', '2021-05-18', '20:21:22', 0),
('1223456', '2021-05-18', '20:22:36', 1),
('1223456', '2021-05-18', '20:47:52', 1),
('1223456', '2021-05-18', '20:48:15', 0),
('1223456', '2021-05-18', '20:48:45', 1),
('1223456', '2021-05-18', '20:59:12', 0),
('9876543', '2021-05-18', '22:09:54', 1),
('9876543', '2021-05-18', '22:11:00', 0),
('1234567', '2021-05-19', '07:20:12', 1),
('1234567', '2021-05-19', '07:21:19', 0),
('9876543', '2021-05-19', '07:21:35', 1),
('9876543', '2021-05-19', '07:29:43', 0),
('9876543', '2021-05-19', '14:29:50', 1),
('9876543', '2021-05-19', '14:32:44', 1),
('9876543', '2021-05-19', '14:34:50', 1),
('9876543', '2021-05-19', '14:35:48', 0),
('9876543', '2021-05-19', '14:36:46', 1),
('9876543', '2021-05-19', '14:37:30', 0),
('1234567', '2021-05-19', '16:08:58', 1),
('1234567', '2021-05-19', '16:35:47', 0),
('1234567', '2021-05-20', '10:03:19', 1),
('1234567', '2021-05-20', '10:03:50', 0),
('1234567', '2021-05-20', '11:35:46', 1),
('1234567', '2021-05-20', '11:38:05', 1),
('1234567', '2021-05-20', '11:40:43', 0),
('1234567', '2021-05-20', '11:42:33', 1),
('1234567', '2021-05-20', '11:43:25', 0),
('1234567', '2021-05-20', '11:57:14', 1),
('1234567', '2021-05-20', '12:06:08', 1),
('1234567', '2021-05-20', '12:06:55', 0),
('1234567', '2021-05-20', '12:08:34', 1),
('1234567', '2021-05-20', '12:09:05', 0),
('1234567', '2021-05-20', '12:12:31', 1),
('1234567', '2021-05-20', '12:17:49', 0),
('9876543', '2021-05-20', '12:18:43', 1),
('9876543', '2021-05-20', '12:21:47', 0),
('9876543', '2021-05-20', '12:57:59', 1),
('9876543', '2021-05-20', '12:58:52', 0),
('9876543', '2021-05-20', '13:04:26', 1),
('9876543', '2021-05-20', '13:05:09', 0),
('9876543', '2021-05-20', '13:15:22', 1),
('9876543', '2021-05-20', '13:16:28', 0),
('9876543', '2021-05-20', '13:18:34', 1),
('9876543', '2021-05-20', '13:23:15', 1),
('9876543', '2021-05-20', '13:24:17', 1),
('9876543', '2021-05-20', '13:25:20', 1),
('9876543', '2021-05-20', '13:25:39', 0),
('9876543', '2021-05-20', '13:26:34', 1),
('9876543', '2021-05-20', '13:28:19', 1),
('9876543', '2021-05-20', '13:33:24', 1),
('9876543', '2021-05-20', '13:33:47', 0),
('9876543', '2021-05-20', '13:35:49', 1),
('9876543', '2021-05-20', '13:37:06', 0),
('9876543', '2021-05-20', '13:38:31', 1),
('9876543', '2021-05-20', '13:39:16', 0),
('1223456', '2021-05-20', '13:39:25', 1),
('1223456', '2021-05-20', '13:40:49', 0),
('9876543', '2021-05-20', '13:49:01', 1),
('9876543', '2021-05-20', '13:49:14', 0),
('1234567', '2021-05-20', '13:49:23', 1),
('1234567', '2021-05-20', '13:49:30', 0),
('1223456', '2021-05-20', '13:52:03', 1),
('1223456', '2021-05-20', '13:52:06', 0);

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
('1223456', 20),
('4445566', 20),
('9876543', 20),
('1223456', 21),
('4445566', 21),
('9876543', 21),
('1223456', 23),
('4445566', 23),
('9876543', 23),
('1223456', 24),
('4445566', 24),
('9876543', 24);

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
('1223456', 20, 'Done'),
('4445566', 21, 'Expired'),
('9876543', 22, 'ToDo'),
('1223456', 23, 'Done'),
('1223456', 24, 'Done');

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
(20, 'Kanban', 'A Web Application that will help to manage you project workflow.', '2021-04-12', '2021-05-21'),
(21, 'Eden', 'An E-commerce site for plant enthusiast.', '2021-05-18', '2021-05-19'),
(23, 'PROJECT A', '', '2021-05-20', '2021-05-20'),
(24, 'PROJECT B', '', '2021-05-20', '0000-00-00');

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
(20, 'TASK 1', '', '2021-05-18', '2021-05-19', 20),
(21, 'TASK 2', '', '2021-05-18', '2021-05-19', 20),
(22, 'TASK 3', '', '2021-05-18', '2021-05-20', 20),
(23, 'TASK 4', 'This is Task 4.', '2021-05-20', '2021-05-20', 23),
(24, 'TASK B', 'This is Task B.', '2021-05-20', '0000-00-00', 23);

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
  MODIFY `pnumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `tnumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
