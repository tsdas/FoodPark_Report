-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 24, 2018 at 01:26 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodpark`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `a_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `user_name`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_no` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `status` tinyint(5) NOT NULL DEFAULT '0',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_no`, `o_id`, `c_id`, `total_amount`, `status`, `date`) VALUES
(1, 1, 1, 500, 1, '2018-05-15'),
(4, 4, 1, 40, 1, '2018-05-15'),
(5, 5, 6, 140, 0, '2018-05-20'),
(6, 6, 6, 100, 1, '2018-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `name`, `address`, `phone_no`, `password`) VALUES
(1, 'Jon', 'Jorhat, Assam', '123', '$2y$10$4tdsDEyiJriCFdBmCW95r.xOoU3RfUFecPFTiGOeaXEeKQbBzMSq6'),
(6, 'Zyan', 'CA', '999', '$2y$10$cGlDYWbtrG56k0hT9XkLX.sZxllPAt.MFCGu87kHz53qtYxrYAkCW'),
(7, 'ts', 'abc', '0580', '$2y$10$DdFtbrBkcBM5zO9gBQnYP.DGPDYIvTm5vod7GrXhkmBj5DCJxmKfm');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `im_id` int(11) NOT NULL,
  `i_name` varchar(50) NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(300) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`im_id`, `i_name`, `category`, `price`, `image`, `status`) VALUES
(1, 'Veg 1', 'veg', 10, 'img/item/2018-05-15 03-48-46_veg1.jpg', 0),
(2, 'Veg 2', 'veg', 20, 'img/item/2018-05-15 03-49-08_veg2.jpg', 0),
(3, 'Non Veg 1', 'non-veg', 50, 'img/item/2018-05-15 03-50-02_nonveg1.jpg', 0),
(4, 'Non Veg 2', 'non-veg', 40, 'img/item/2018-05-15 03-50-18_nonveg2.jpg', 0),
(5, 'Other 1', 'other', 100, 'img/item/2018-05-15 03-50-49_other1.jpg', 0),
(6, 'Other 2', 'other', 150, 'img/item/2018-05-15 03-51-17_other2.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `o_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`o_id`, `c_id`) VALUES
(1, 1),
(4, 1),
(5, 6),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `order_master`
--

CREATE TABLE `order_master` (
  `om_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `im_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_master`
--

INSERT INTO `order_master` (`om_id`, `o_id`, `im_id`, `quantity`, `date`) VALUES
(1, 1, 5, 2, '2018-05-15'),
(2, 1, 6, 2, '2018-05-15'),
(5, 4, 1, 2, '2018-05-15'),
(6, 4, 2, 1, '2018-05-15'),
(7, 5, 3, 2, '2018-05-20'),
(8, 5, 2, 2, '2018-05-20'),
(9, 6, 3, 2, '2018-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `todays_special`
--

CREATE TABLE `todays_special` (
  `t_id` int(11) NOT NULL,
  `im_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todays_special`
--

INSERT INTO `todays_special` (`t_id`, `im_id`, `date`) VALUES
(1, 1, '0000-00-00'),
(2, 2, '0000-00-00'),
(3, 1, '0000-00-00'),
(4, 2, '0000-00-00'),
(5, 3, '0000-00-00'),
(6, 1, '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`a_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_no`),
  ADD KEY `o_id` (`o_id`,`c_id`),
  ADD KEY `bill_ibfk_2` (`c_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`),
  ADD UNIQUE KEY `phone_no` (`phone_no`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`im_id`),
  ADD UNIQUE KEY `i_name` (`i_name`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `order_master`
--
ALTER TABLE `order_master`
  ADD PRIMARY KEY (`om_id`),
  ADD KEY `o_id` (`o_id`,`im_id`),
  ADD KEY `order_master_ibfk_2` (`im_id`);

--
-- Indexes for table `todays_special`
--
ALTER TABLE `todays_special`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `im_id` (`im_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `im_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_master`
--
ALTER TABLE `order_master`
  MODIFY `om_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `todays_special`
--
ALTER TABLE `todays_special`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_master`
--
ALTER TABLE `order_master`
  ADD CONSTRAINT `order_master_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_master_ibfk_2` FOREIGN KEY (`im_id`) REFERENCES `item` (`im_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `todays_special`
--
ALTER TABLE `todays_special`
  ADD CONSTRAINT `todays_special_ibfk_1` FOREIGN KEY (`im_id`) REFERENCES `item` (`im_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
