-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2018 at 12:57 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wimo`
--

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL,
  `driverName` varchar(50) NOT NULL,
  `courier` varchar(50) NOT NULL,
  `deliveryDate` date NOT NULL,
  `fromLocation` varchar(50) NOT NULL,
  `toLocation` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `driverName`, `courier`, `deliveryDate`, `fromLocation`, `toLocation`, `status`, `description`) VALUES
(1, 'Marko Pandres', 'FastWay', '2019-05-10', '25.204849,55.270783', '25.125386, 55.227821', 'completed', 'Deliver a credit card, user must sign'),
(2, 'Anmol Dares', 'Wimo', '2019-05-10', '25.191099, 55.283402', '25.127795, 55.226619', 'completed', 'Deliver a bank statement'),
(3, 'Marko Pandres', 'FastWay', '2019-05-10', '25.194594, 55.274034', '25.138623, 55.231355', 'completed', 'Deliver souq.com order'),
(4, 'Adam Aldo', 'Wimo', '2019-05-10', '25.166517, 55.278027', '25.089483, 55.189321', 'failed', 'Grocery Delivery'),
(5, 'Marko Pandres', 'FastWay', '2019-05-10', '25.166517, 55.278027', '25.074626, 55.193905', 'completed', 'Deliver a credit card, user must sign'),
(6, 'Adam Aldo', 'Wimo', '2019-05-10', '25.166051, 55.271847', '25.074626, 55.193905', 'completed', 'Deliver noon.com shipping'),
(7, 'Anmol Dares', 'Wimo', '2019-05-10', '25.194594, 55.274034', '25.089483, 55.189321', 'completed', 'Deliver a document shipping'),
(8, 'Nazih Omar', 'FastWay', '2019-05-22', '25.089240, 55.211242', '25.138623, 55.231355', 'pending', 'Deliver emirates ID'),
(9, 'Marko Pandres', 'FastWay', '2019-05-12', '25.166051, 55.271847', '25.127795, 55.226619', 'started', 'Deliver emirates ID'),
(10, 'Adam Aldo', 'Wimo', '2019-05-25', '25.194594, 55.274034', '25.125386, 55.227821', 'pending', 'Deliver a souq.com shipping'),
(11, 'Marko Pandres', 'FastWay', '2019-05-10', '25.204849,55.270783', '25.125386, 55.227821', 'completed', 'Deliver a credit card, user must sign'),
(12, 'Anmol Dares', 'Wimo', '2019-05-10', '25.191099, 55.283402', '25.127795, 55.226619', 'completed', 'Deliver a bank statement'),
(13, 'Marko Pandres', 'FastWay', '2019-05-10', '25.194594, 55.274034', '25.138623, 55.231355', 'completed', 'Deliver souq.com order'),
(14, 'Adam Aldo', 'Wimo', '2019-05-10', '25.166517, 55.278027', '25.089483, 55.189321', 'failed', 'Grocery Delivery'),
(15, 'Marko Pandres', 'FastWay', '2019-05-10', '25.166517, 55.278027', '25.074626, 55.193905', 'completed', 'Deliver a credit card, user must sign'),
(16, 'Adam Aldo', 'Wimo', '2019-05-10', '25.166051, 55.271847', '25.074626, 55.193905', 'completed', 'Deliver noon.com shipping'),
(17, 'Anmol Dares', 'Wimo', '2019-05-10', '25.194594, 55.274034', '25.089483, 55.189321', 'completed', 'Deliver a document shipping'),
(18, 'Nazih Omar', 'FastWay', '2019-05-22', '25.089240, 55.211242', '25.138623, 55.231355', 'pending', 'Deliver emirates ID'),
(19, 'Marko Pandres', 'FastWay', '2019-05-12', '25.166051, 55.271847', '25.127795, 55.226619', 'started', 'Deliver emirates ID'),
(20, 'Adam Aldo', 'Wimo', '2019-05-25', '25.194594, 55.274034', '25.125386, 55.227821', 'pending', 'Deliver a souq.com shipping'),
(21, 'Marko Pandres', 'FastWay', '2019-05-10', '25.204849,55.270783', '25.125386, 55.227821', 'completed', 'Deliver a credit card, user must sign'),
(22, 'Anmol Dares', 'Wimo', '2019-05-10', '25.191099, 55.283402', '25.127795, 55.226619', 'completed', 'Deliver a bank statement'),
(23, 'Marko Pandres', 'FastWay', '2019-05-10', '25.194594, 55.274034', '25.138623, 55.231355', 'completed', 'Deliver souq.com order'),
(24, 'Adam Aldo', 'Wimo', '2019-05-10', '25.166517, 55.278027', '25.089483, 55.189321', 'failed', 'Grocery Delivery'),
(25, 'Marko Pandres', 'FastWay', '2019-05-10', '25.166517, 55.278027', '25.074626, 55.193905', 'completed', 'Deliver a credit card, user must sign');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
