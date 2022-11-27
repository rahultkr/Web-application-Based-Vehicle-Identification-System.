-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicles`
--

-- --------------------------------------------------------

--
-- Table structure for table `emission`
--

CREATE TABLE `emission` (
  `Vehicle_RC_No` varchar(20) NOT NULL,
  `Vehicle_Type` varchar(20) NOT NULL,
  `Fuel_Type` varchar(20) NOT NULL,
  `PUC_SNo` varchar(20) NOT NULL,
  `Manufacture_Date` varchar(12) NOT NULL,
  `PUC_Valid_Till` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emission`
--

INSERT INTO `emission` (`Vehicle_RC_No`, `Vehicle_Type`, `Fuel_Type`, `PUC_SNo`, `Manufacture_Date`, `PUC_Valid_Till`) VALUES
('MH12CS2345', '2 wheeler', 'Petrol', '52321326', '1999-02-21', '2023-02-01');
INSERT INTO `emission` (`Vehicle_RC_No`, `Vehicle_Type`, `Fuel_Type`, `PUC_SNo`, `Manufacture_Date`, `PUC_Valid_Till`) VALUES
('CG08CS2345', '2 wheeler', 'Petrol', '98721326', '1999-03-21', '2023-05-01');
INSERT INTO `emission` (`Vehicle_RC_No`, `Vehicle_Type`, `Fuel_Type`, `PUC_SNo`, `Manufacture_Date`, `PUC_Valid_Till`) VALUES
('CG04CS9876', '2 wheeler', 'Diesel', '34321326', '1999-06-21', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `identification`
--

CREATE TABLE `identification` (
  `Driving_License_No` varchar(20) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `DoB` varchar(12) NOT NULL,
  `Mobile_No` int(11) NOT NULL,
  `Valid_Till` varchar(12) NOT NULL,
  `Vehicle_RC_No` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `identification`
--

INSERT INTO `identification` (`Driving_License_No`, `FullName`, `Address`, `DoB`, `Mobile_No`, `Valid_Till`, `Vehicle_RC_No`) VALUES
('MH1420110062821', 'Vedanshu Nayak', 'Main road Durg', '21-06-2001', 8798966652, '21-06-2040', 'MH12CS2345');

INSERT INTO `identification` (`Driving_License_No`, `FullName`, `Address`, `DoB`, `Mobile_No`, `Valid_Till`, `Vehicle_RC_No`) VALUES
('CG1420232062821', 'Rahul Pandey', 'Main road Raigarh', '24-06-2001', 7897466652, '21-04-2040', 'CG08CS2345');

INSERT INTO `identification` (`Driving_License_No`, `FullName`, `Address`, `DoB`, `Mobile_No`, `Valid_Till`, `Vehicle_RC_No`) VALUES
('CG1420119992821', 'Raj Kamal', 'Main road Raipur', '15-06-2001', 6513466652, '21-02-2040', 'CG04CS9876');

-- --------------------------------------------------------


-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(4, 'Vedanshu', 'vedanshu@gmail.com', 'wassup'),(6, 'Aditya', 'aditya@gmail.com', '12345'),
(5, 'Vedanshu', 'v@gmail.com', 'pbkdf2:sha256:260000$c4k1VGf9KWzznajO$aa76641e39df63816ff0c7015bccc0ef139aec2e0b4078452a93c75143adf72c');

-- --------------------------------------------------------

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(12, 'Vedanshu', 'vedanshu@gmail.com');
INSERT INTO `test` (`id`, `name`, `email`) VALUES
(14, 'Aditya', 'aditya@gmail.com');
--

--
-- Indexes for table `emission`
--
ALTER TABLE `emission`
  ADD PRIMARY KEY (`Vehicle_RC_No`);

--
-- Indexes for table `identification`
--
ALTER TABLE `identification`
  ADD PRIMARY KEY (`Driving_License_No`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
