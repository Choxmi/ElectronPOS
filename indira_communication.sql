-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 30, 2021 at 02:38 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `pos_cashflow`
--

CREATE TABLE `pos_cashflow` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `note` text NOT NULL,
  `amount` int(11) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_cashflow`
--

INSERT INTO `pos_cashflow` (`id`, `type`, `note`, `amount`, `created`) VALUES
(1, 0, 'Spend check', 1200, '2021-09-26'),
(2, 1, 'Receive Check', 1200, '2021-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `pos_repairs`
--

CREATE TABLE `pos_repairs` (
  `receipt_id` varchar(20) NOT NULL,
  `date_received` date NOT NULL,
  `items` text NOT NULL,
  `advanced` float NOT NULL DEFAULT '0',
  `amount` float NOT NULL,
  `date_issued` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_repairs`
--

INSERT INTO `pos_repairs` (`receipt_id`, `date_received`, `items`, `advanced`, `amount`, `date_issued`, `status`) VALUES
('R000001', '2021-09-24', '[{\"repair_type\":\"Phone Repair\",\"repair_type_id\":\"1\",\"task\":\"Replace screen\",\"deliver\":\"2021-09-29\",\"amount\":\"1200\"}]', 1000, 1200, '2021-09-26', 1),
('R000002', '2021-09-26', '[{\"repair_type\":\"Phone Repair\",\"repair_type_id\":\"1\",\"task\":\"sfdsfs\",\"deliver\":\"2021-09-28\",\"amount\":\"1200\"}]', 0, 1200, '2021-09-26', 1),
('R000003', '2021-09-26', '[{\"repair_type\":\"Phone cover\",\"repair_type_id\":\"3\",\"task\":\"Cover Replace\",\"deliver\":\"2021-09-28\",\"amount\":\"1200\"}]', 0, 1200, NULL, 0),
('R000004', '2021-09-26', '[{\"repair_type\":\"Phone Repair\",\"repair_type_id\":\"1\",\"task\":\"dfdsds\",\"deliver\":\"2021-09-27\",\"amount\":\"1200\"}]', 0, 1200, NULL, 0);

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
  `timestamp` bigint(15) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_sales`
--

INSERT INTO `pos_sales` (`receipt_id`, `sales_lines`, `net_amount`, `discount`, `timestamp`, `date`) VALUES
('X202109261', '[{\"barcode\":\"S0101001\",\"quantity\":1,\"name\":\"Onezero\",\"unit_price\":23200,\"total\":23200}]', 23200, 0, 1632670191841, '2021-09-26'),
('X202109271', '[{\"barcode\":\"S0101001\",\"quantity\":3,\"name\":\"Onezero\",\"unit_price\":23200,\"total\":69600}]', 69600, 0, 1632681519168, '2021-09-27'),
('X202109272', '[{\"barcode\":\"S0101001\",\"quantity\":2,\"name\":\"Onezero\",\"unit_price\":23200,\"total\":46400}]', 46400, 0, 1632681870283, '2021-09-27'),
('X202109273', '[{\"barcode\":\"S0101001\",\"quantity\":2,\"name\":\"Onezero\",\"unit_price\":23200,\"total\":46400}]', 46400, 0, 1632683676244, '2021-09-27');

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
  `last_updated` date NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_stock_models`
--

INSERT INTO `pos_stock_models` (`barcode`, `category_id`, `sub_id`, `model_id`, `model_name`, `unit_price`, `stock_remaining`, `last_updated`, `img`) VALUES
('S0101001', 1, 1, 1, 'Onezero', 23200, 1, '2021-09-21', 'item_img/S0101001.png'),
('S0102001', 1, 2, 1, 'Galaxy', 25000, 12, '2021-09-22', 'item_img/S0102001.png'),
('S0102003', 1, 2, 3, 'S20', 25000, 20, '2021-09-25', '/Users/choxmi/Documents/broucher.png'),
('S0102004', 1, 2, 4, 'Fold', 220000, 8, '2021-09-25', 'item_img/S0102004.png'),
('S0102005', 1, 2, 5, 'FoldNew', 10000, 10, '2021-09-25', 'item_img/S0102005.png');

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
-- Indexes for table `pos_cashflow`
--
ALTER TABLE `pos_cashflow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_repairs`
--
ALTER TABLE `pos_repairs`
  ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `pos_repair_types`
--
ALTER TABLE `pos_repair_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `pos_sales`
--
ALTER TABLE `pos_sales`
  ADD PRIMARY KEY (`receipt_id`);

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
-- AUTO_INCREMENT for table `pos_cashflow`
--
ALTER TABLE `pos_cashflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
