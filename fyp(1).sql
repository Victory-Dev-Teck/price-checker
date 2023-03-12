-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2023 at 11:50 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp`
--
CREATE DATABASE IF NOT EXISTS `fyp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fyp`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `com_logo`, `com_name`, `email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(1, 'admin1', '$10$k1XS8YW4AfyIrO6KHNbvFuf3wnoPtmdaCDCY80Xr/0BGwAm6L07Mi', NULL, 'Inventory', 'inventory@gmail.com', NULL, NULL, '$', 1),
(2, 'admin', '$2y$10$gCE2xru.CMPBC3htqilGkuUm9tdkFAJIAanab2Ewy.Fo9RpS2xRgO', NULL, '', 'admin@gmail.com', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(13, 'Realme', 9),
(12, 'Lenovo', 9),
(11, 'LG', 9),
(10, 'Samsung', 9);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(9, 'Electronics', 0),
(10, 'Men', 0),
(11, 'Women', 0),
(12, 'Furniture', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fav`
--

DROP TABLE IF EXISTS `fav`;
CREATE TABLE IF NOT EXISTS `fav` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `product_url` varchar(1000) NOT NULL,
  `time_stamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image_url` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fav`
--

INSERT INTO `fav` (`id`, `user_email`, `product_url`, `time_stamp`, `image_url`, `description`, `title`, `price`) VALUES
(4, 'sample', 'https://ebay.com/itm/123456?hash=item28caef0a3a:g:E3kAAOSwlGJiMikD', '2022-06-30 16:43:21', '', NULL, NULL, NULL),
(5, 'sample', 'https://www.flipkart.com/vivo-t1-44w-starry-sky-128-gb/p/itm6fabe8894256b', '2022-06-30 16:45:29', '', NULL, NULL, NULL),
(6, 'sample', '//www.aliexpress.com/item/3256804277716806.html', '2022-06-30 16:45:40', '', NULL, NULL, NULL),
(7, '', '', '2022-07-01 12:00:22', '', NULL, NULL, NULL),
(11, 'horikhan840@gmail.com', 'https://www.ebay.com/itm/403312270372?epid=2305029321', '2022-07-01 12:04:39', '', NULL, NULL, NULL),
(12, 'horikhan840@gmail.com', 'https://www.amazon.com/dp/B09NBPSYKD', '2022-07-01 12:07:12', '', NULL, NULL, NULL),
(13, 'horikhan840@gmail.com', 'https://www.flipkart.com/dell-core-i3-10th-gen-8-gb-1-tb-hdd-256-gb-ssd-windows-11-home-vostro-3510-thin-light-laptop/p/itm9ba5f470413d2', '2022-07-01 12:07:17', '', NULL, NULL, NULL),
(14, 'horikhan840@gmail.com', 'https://www.ebay.com/itm/334100133142?hash=item4dc9eb7516:g:0sIAAOSw6TVhCYoQ', '2022-07-02 09:53:07', '', NULL, NULL, NULL),
(15, 'horikhan840@gmail.com', 'https://ebay.com/itm/123456?hash=item28caef0a3a:g:E3kAAOSwlGJiMikD', '2022-07-02 10:00:32', 'https://ir.ebaystatic.com/rs/v/fxxj3ttftm5ltcqnto1o4baovyl.png', NULL, NULL, NULL),
(16, 'horikhan840@gmail.com', 'https://www.amazon.com/dp/B095RZ62BX', '2022-07-02 10:00:33', 'https://m.media-amazon.com/images/I/61zRDADh YS._AC_UY218_.jpg', NULL, NULL, NULL),
(17, 'horikhan840@gmail.com', 'https://www.flipkart.com/dell-ryzen-5-hexa-core-5600h-8-gb-512-gb-ssd-windows-10-4-graphics-nvidia-geforce-rtx-3050-g15-5515-gaming-laptop/p/itm337b5cde6d860', '2022-07-02 10:00:38', 'https://rukminim1.flixcart.com/image/312/312/kwl0akw0/computer/o/4/q/g15-5515-gaming-laptop-dell-original-imag98e62brs8uzy.jpeg?q=70', NULL, NULL, NULL),
(23, 'matin@gmail.com', '1111', '2023-02-13 10:12:18', 'http://localhost/pricechecker/user/images/flipkart.png', 'undefined', 'undefined', '$10-$20'),
(26, 'matin@gmail.com', 'undefined', '2023-02-23 00:32:47', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', '200$'),
(27, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', '2023-02-23 00:41:24', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', 'iPhone 14 Pro 256GB 27790', 'iPhone 14 Pro 256GB 27790', '570$'),
(28, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', '2023-02-23 00:41:44', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', '250$'),
(29, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', '2023-02-23 01:15:46', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', '300$'),
(30, 'super@gmail.com', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', '2023-02-24 11:10:32', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'C $250'),
(31, 'super@gmail.com', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', '2023-02-24 11:12:15', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', 'C $200'),
(32, 'poot@gmail.com', 'http://localhost/pricechecker/mock-data/iphone/iPhone 11 128GB, Genuine Black cheap, instant delivery.jpg', '2023-02-24 18:22:02', 'http://localhost/pricechecker/mock-data/iphone/iPhone 11 128GB, Genuine Black cheap, instant delivery.jpg', 'iPhone 11 128GB, Genuine Black cheap, instant delivery', 'iPhone 11 128GB, Genuine Black cheap, instant delivery', ' C $350');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `product_keywords` text,
  `product_views` int(11) DEFAULT '0',
  `product_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(2, '5fc500f4330ad', 9, 18, 10, 'Samsung Galaxy A20s (Blue, 32 GB)  (3 GB RAM)', '12900', '3 GB RAM | 32 GB ROM | Expandable Upto 512 GB\r\n16.51 cm (6.5 inch) HD+ Display\r\n13MP + 8MP + 5MP | 8MP Front Camera\r\n4000 mAh Lithium Ion Battery\r\nQualcomm SDM450-B01 Processor', '1598962160galaxy-a20s.jpeg', 0, NULL, 1, 1),
(3, '5fc500ec98a64', 9, 18, 13, 'Realme C3 (Volcano Grey, 32 GB)  (3 GB RAM)', '8999', '3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n16.56 cm (6.52 inch) HD+ Display\r\n12MP + 2MP | 5MP Front Camera\r\n5000 mAh Battery\r\nHelio G70 Processor', '1598962665realme-c3.jpeg', 1, NULL, 31, 1),
(4, '5fc500e4de9c2', 9, 19, 12, 'Lenovo Ideapad Flex 5 Core i3 10th Gen - (4 GB/256 GB SSD/Windows 10 Home) 14IIL05 2 in 1 Laptop  (14 inch, Graphite Grey, 1.5 kg, With MS Office)', '46990', 'Carry It Along 2 in 1 Laptop\r\n14 inch Full HD LED Backlit Glossy IPS Touch Display (16:9 Aspect Ratio, 250 nits Brightness, Stylus Support)\r\nLight Laptop without Optical Disk Drive\r\n\r\nShipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', '1598962854lenovo.jpeg', 1, NULL, 10, 1),
(5, '5fc500decacd2', 9, 19, 12, 'Lenovo Ideapad 3 Core i3 10th Gen - (4 GB/1 TB HDD/DOS) 14IIL05 Thin and Light Laptop  (14 inch, Platinum Grey, 1.6 kg)', '32095', 'Stylish &amp; Portable Thin and Light Laptop\r\n14 inch HD LED Backlit Anti-glare TN Display (220 nits Brightness)\r\nLight Laptop without Optical Disk Drive', '1598963006lenovo-2.jpeg', 1, NULL, 1, 1),
(6, '5fc500d9502a7', 12, 25, 0, 'Flipkart Perfect Homes Iris Therapedic 6 inch King Bonnell Spring Mattress', '11090', 'Length: 78 inch, Width: 72 inch, Thickness: 6 inch (6 ft 6 in x 6 ft x 6 in)\r\nSupport Type: Bonnell Spring\r\nComfort Layer: PU Foam\r\nMattress Features: Orthopedic Mattress, Zero Partner Disturbance, Sag Resistant Mattress', '1598963093queen-10.jpeg', 1, NULL, 1, 1),
(7, '5fc500d3ae088', 12, 25, 0, 'Peps Springkoil Normal Top Blue 6 inch Double Bonnell Spring Mattress', '10540', 'Length: 72 inch, Width: 48 inch, Thickness: 6 inch (6 ft x 4 ft x 6 in)\r\nSupport Type: Bonnell Spring\r\nComfort Layer: PU Foam\r\nMattress Features: Reversible Mattress', '1598963343double-10.jpeg', 1, NULL, 4, 1),
(8, '5fc500cd9a2c4', 12, 24, 0, 'Delite Kom Riley Engineered Wood Bedside Table  (Finish Color - Acacia Dark)', '2750', 'Rectangular\r\nWidth x Height: 44.958 x 39.878 cm (1 ft 5 in x 1 ft 3 in)\r\nSuitable For: Bedroom Furniture, Living Room\r\nStorage Included\r\nDIY - Basic assembly to be done with simple tools by the customer, comes with instructions', '1598963469particle-board.jpeg', 1, NULL, 0, 1),
(9, '5fc500c7c7bef', 10, 26, 0, 'Abstract Men Hooded Neck Dark Blue T-Shirt', '359', '10% Instant Discount on Bank Of Baroda Credit Cards\r\n10% Instant Discount on Federal Bank Debit Cards', '1598963616s-tnvhdf.jpeg', 1, NULL, 2, 1),
(10, '5fc500c285db4', 10, 26, 0, 'Printed Men Round Neck Yellow T-Shirt', '284', 'Get extra 5.0% off (price inclusive of discount)\r\n10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards', '1598963703xl-newyork.jpeg', 1, NULL, 0, 1),
(11, '5fc500bc5d3e3', 11, 27, 0, 'Women Printed Pure Cotton A-line Kurta  (White, Blue, Pink)', '759', '10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards\r\n5% Unlimited Cashback on Flipkart Axis Bank Credit Card', '1598963806xxl-md377.jpeg', 3, NULL, 14, 1),
(12, '5fc500b5570aa', 11, 28, 0, 'Polka Print Bhagalpuri Cotton Blend Saree  (Blue)', '299', 'Special Price  Get extra 10.0% off (price inclusive of discount)\r\nBank Offer10% Instant Discount on Federal Bank Debit Cards', '1598963976free-kora.jpeg', 12, NULL, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

DROP TABLE IF EXISTS `product_cart`;
CREATE TABLE IF NOT EXISTS `product_cart` (
  `s_no` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`s_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered_products`
--

DROP TABLE IF EXISTS `registered_products`;
CREATE TABLE IF NOT EXISTS `registered_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `product_url` varchar(1000) DEFAULT '',
  `image_url` varchar(1000) DEFAULT '',
  `price` varchar(10) DEFAULT NULL,
  `category` varchar(100) DEFAULT '',
  `eshop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registered_products`
--

INSERT INTO `registered_products` (`id`, `title`, `description`, `product_url`, `image_url`, `price`, `category`, `eshop`) VALUES
(6, 'Widescreen NX Mini F1 SMART NX', 'Widescreen NX Mini F1 SMART NX', 'url5', 'http://localhost/pricechecker/user/images/flipkart.png', '$10-$20', 'All', 'Amazon'),
(7, 'title2', 'title2', 'url2', 'http://localhost/pricechecker/user/images/ebay.png', '$212', 'All', 'Ebay'),
(8, 'Widescreen NX Mini F1 SMART NX', 'Widescreen NX Mini F1 SMART NX', 'url6', 'http://localhost/pricechecker/user/images/ebay.png', '$10-$20', 'All', 'Amazon'),
(9, 'mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'http://localhost/pricechecker/mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'http://localhost/pricechecker/mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'C $400', 'mock-data/laptop/The', 'Amazon'),
(10, 'Samsung laptop 2019.jpg', 'Samsung laptop 2019.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung laptop 2019.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung laptop 2019.jpg', '470$', 'Samsung laptop 2019.', 'Amazon'),
(11, 'Samsung Unveils Two New PCs with Signature Style a', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and ', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and ', '450$', 'Samsung Unveils Two ', 'Amazon');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT '0',
  `show_in_header` tinyint(4) NOT NULL DEFAULT '1',
  `show_in_footer` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sub_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(19, 'Laptops', 9, 2, 1, 0),
(21, 'Camera', 9, 0, 1, 0),
(20, 'Speakers', 9, 0, 1, 0),
(18, 'Mobiles', 9, 2, 1, 1),
(22, 'Kitchen', 12, 0, 1, 0),
(23, 'Tableware', 12, 0, 0, 1),
(24, 'Living Room', 12, 1, 0, 1),
(25, 'Beds', 12, 2, 1, 1),
(26, 'Men\'s T-Shirts', 10, 2, 1, 1),
(27, 'Kurti\'s', 11, 1, 1, 1),
(28, 'Sarees', 11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tracked_products`
--

DROP TABLE IF EXISTS `tracked_products`;
CREATE TABLE IF NOT EXISTS `tracked_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT '',
  `description` varchar(1000) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `image_url` varchar(1000) DEFAULT '',
  `product_url` varchar(1000) DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tracked_products`
--

INSERT INTO `tracked_products` (`id`, `title`, `description`, `price`, `image_url`, `product_url`, `user_email`) VALUES
(6, 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', '250$', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'matin@gmail.com'),
(7, 'Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', '300$', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'matin@gmail.com'),
(8, 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom', 'C $250', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', 'super@gmail.com'),
(9, 'iPhone 11 128GB, Genuine Black cheap, instant delivery', 'iPhone 11 128GB, Genuine Black cheap, instant delivery', ' C $350', 'http://localhost/pricechecker/mock-data/iphone/iPhone 11 128GB, Genuine Black cheap, instant delivery.jpg', 'http://localhost/pricechecker/mock-data/iphone/iPhone 11 128GB, Genuine Black cheap, instant delivery.jpg', 'poot@gmail.com'),
(10, 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', '200$', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', 'undefined', 'matin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trending_products`
--

DROP TABLE IF EXISTS `trending_products`;
CREATE TABLE IF NOT EXISTS `trending_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `product_url` varchar(1000) DEFAULT '',
  `image_url` varchar(1000) DEFAULT '',
  `price` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `eshop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trending_products`
--

INSERT INTO `trending_products` (`id`, `title`, `description`, `product_url`, `image_url`, `price`, `category`, `eshop`) VALUES
(1, 'Smartphone 6S 32GB LTE', 'Smartphone 6S 32GB LTE', 'url4', 'http://localhost/pricechecker/user/images/img2.jpg', '$359', 'All', 'Ebay'),
(2, 'Widescreen NX Mini F1 SMART NX', 'Widescreen NX Mini F1 SMART NX', 'url5', 'http://localhost/pricechecker/user/images/flipkart.png', '$10-$20', 'All', 'Amazon'),
(3, 'mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'http://localhost/pricechecker/mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'http://localhost/pricechecker/mock-data/laptop/The 9 Best Laptops of 2023.jpg', '400$', 'mock-data/laptop/The 9 Best Laptops of 2023.jpg', 'Amazon'),
(4, 'Samsung laptop 2019.jpg', 'Samsung laptop 2019.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung laptop 2019.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung laptop 2019.jpg', '470$', 'Samsung laptop 2019.jpg', 'Amazon'),
(5, 'Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'C $300', 'Samsung Galaxy Book 2 Pro 360.jpg', 'Ebay'),
(6, 'iPhone 14 Pro 256GB 27790', 'iPhone 14 Pro 256GB 27790', 'http://localhost/pricechecker/mock-data/laptop/Samsung Unveils Two New PCs with Signature Style and Performance - Samsung  US Newsroom.jpg', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', 'C $570', 'iPhone 14 Pro 256GB 27790', 'Amazon');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT '1',
  `code` mediumint(9) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `mobile`, `city`, `user_role`, `code`, `status`) VALUES
(18, 'Muhammad Haroon', 'horikhan840@gmail.com', '$2y$10$iYH1T2zYAuKpOs7beLmHWOOt3oF25jM6w2GIkZglUg/hQUE/H1m5C', '+923487490545', 'Faisalabad', 1, 0, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT '1',
  `code` mediumint(9) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `city`, `user_role`, `code`, `status`) VALUES
(35, 'super', 'super@gmail.com', '$2y$10$lPvvXrYK1UHYWnzfLWKjouOz1R2Mxk3wp8y.C/36mpb7UtRaf4sSS', '', '', 1, 962727, 'verified'),
(34, 'matin', 'matin@gmail.com', '$2y$10$W2bZAog2lbKD/Md3Z0ZVcu/KzWbwOZbIrhMWW/LA/VvMz6Wd5/.Re', '', '', 1, 636936, 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `visited_products`
--

DROP TABLE IF EXISTS `visited_products`;
CREATE TABLE IF NOT EXISTS `visited_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) DEFAULT '',
  `image_url` varchar(1000) DEFAULT '',
  `product_url` varchar(1000) DEFAULT '',
  `title` varchar(1000) DEFAULT '',
  `description` varchar(1000) DEFAULT '',
  `price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visited_products`
--

INSERT INTO `visited_products` (`id`, `user_email`, `image_url`, `product_url`, `title`, `description`, `price`) VALUES
(1, 'matin@gmail.com', 'http://localhost/pricechecker/user/images/ebay.png', 'url2', 'title2', 'title2', '1340'),
(2, 'matin@gmail.com', 'http://localhost/pricechecker/user/images/flipkart.png', '1111', 'Wireless Audio System Multiroom 360 degree Full base audio', 'Wireless Audio System Multiroom 360 degree Full base audio', '$10-$20'),
(3, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', 'http://localhost/pricechecker/mock-data/laptop/Ultra-Thin Touchscreen Laptop - Microsoft Surface.jpg', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', 'Ultra-Thin Touchscreen Laptop - Microsoft Surface', '200$'),
(4, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'http://localhost/pricechecker/mock-data/laptop/Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', 'Samsung Galaxy Book 2 Pro 360.jpg', 'C $300'),
(5, 'matin@gmail.com', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', 'http://localhost/pricechecker/mock-data/iphone_apple/1.png', 'iPhone 14 Pro 256GB 27790', 'iPhone 14 Pro 256GB 27790', '570$');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
