-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2021 at 06:35 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indira_communication`
--
CREATE DATABASE IF NOT EXISTS `indira_communication` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `indira_communication`;

-- --------------------------------------------------------

--
-- Table structure for table `pos_repairs`
--

CREATE TABLE `pos_repairs` (
  `receipt_id` varchar(20) NOT NULL,
  `date_received` date NOT NULL,
  `items` text NOT NULL,
  `amount` float NOT NULL,
  `deadline` date DEFAULT NULL,
  `date_issued` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_repair_types`
--

CREATE TABLE `pos_repair_types` (
  `type_id` int(11) NOT NULL,
  `type` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_repair_types`
--

INSERT INTO `pos_repair_types` (`type_id`, `type`) VALUES
(1, 'Phone Repair'),
(2, 'Software service'),
(3, 'Phone cover');

-- --------------------------------------------------------

--
-- Table structure for table `pos_sales`
--

CREATE TABLE `pos_sales` (
  `receipt_id` varchar(15) NOT NULL,
  `sales_lines` text NOT NULL,
  `net_amount` float NOT NULL,
  `discount` float NOT NULL,
  `timestamp` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_sales_records`
--

CREATE TABLE `pos_sales_records` (
  `receipt_id` varchar(20) NOT NULL,
  `product_barcode` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_stock_categories`
--

CREATE TABLE `pos_stock_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_stock_categories`
--

INSERT INTO `pos_stock_categories` (`category_id`, `category_name`) VALUES
(1, 'Phone');

-- --------------------------------------------------------

--
-- Table structure for table `pos_stock_models`
--

CREATE TABLE `pos_stock_models` (
  `barcode` varchar(10) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_name` text NOT NULL,
  `unit_price` int(11) NOT NULL,
  `stock_remaining` int(11) NOT NULL,
  `last_updated` varchar(20) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_stock_models`
--

INSERT INTO `pos_stock_models` (`barcode`, `category_id`, `sub_id`, `model_id`, `model_name`, `unit_price`, `stock_remaining`, `last_updated`, `img`) VALUES
('S0101001', 1, 1, 1, 'Onezero', 23200, 8, '2021', 'item_img/S0101001.png'),
('S0101002', 1, 1, 2, 'Tester', 250, 2, '2021', 'item_img/S0101002.'),
('S0102001', 1, 2, 1, 'Galaxy', 25000, 12, '2021', 'item_img/S0102001.png'),
('S0102002', 1, 2, 2, 'Note9', 345000, 25, '2021-09-15 10:36:44', 'item_img/S0102002.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `pos_stock_subcategories`
--

CREATE TABLE `pos_stock_subcategories` (
  `category_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `subcategory` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_stock_subcategories`
--

INSERT INTO `pos_stock_subcategories` (`category_id`, `sub_id`, `subcategory`) VALUES
(1, 1, 'Nokia'),
(1, 2, 'Samsung');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pos_repair_types`
--
ALTER TABLE `pos_repair_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `pos_stock_categories`
--
ALTER TABLE `pos_stock_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `pos_stock_models`
--
ALTER TABLE `pos_stock_models`
  ADD PRIMARY KEY (`barcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pos_repair_types`
--
ALTER TABLE `pos_repair_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pos_stock_categories`
--
ALTER TABLE `pos_stock_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
