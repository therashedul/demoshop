-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2024 at 08:28 AM
-- Server version: 8.0.36
-- PHP Version: 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webhatbd_myshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`webhatbd`@`localhost` PROCEDURE `viewName` (IN `names` VARCHAR(200))   BEGIN
select * from accounts where name=names;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double DEFAULT NULL,
  `total_debit` double DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_default` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `created_at`, `updated_at`, `account_no`, `name`, `initial_balance`, `total_balance`, `total_debit`, `note`, `is_active`, `is_default`) VALUES
(1, '2023-08-02 04:44:24', '2023-10-11 03:48:22', '1403708', 'Rasel', 50000, 50000, NULL, 'new Note', 1, 1),
(2, '2023-09-02 10:59:46', '2023-10-11 03:48:07', '123456', 'karim', 500001, 500001, NULL, 'Karim ac', 1, NULL),
(3, '2023-10-11 04:03:50', '2023-10-11 04:06:37', '654321', 'sorna', 123456, 123456, NULL, 'test note', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjustments`
--

INSERT INTO `adjustments` (`id`, `reference_no`, `warehouse_id`, `document`, `total_qty`, `item`, `note`, `created_at`, `updated_at`) VALUES
(2, 'adr-20231106-034704', 3, NULL, 1, 1, 'Note one', '2023-11-06 09:47:04', '2023-11-06 09:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int NOT NULL,
  `user_id` int NOT NULL,
  `checkin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `date`, `employee_id`, `user_id`, `checkin`, `checkout`, `status`, `is_active`, `note`, `created_at`, `updated_at`) VALUES
(2, '2023-10-11', 2, 1, '9:45am', '5:45pm', 1, NULL, 'Please come', '2023-10-11 07:21:44', '2023-10-11 07:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `product_id`, `product_name`, `brand`, `price`, `product_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'shart', '2', '321', '\\barcode68081776.png', NULL, '2023-08-22 06:12:14', '2023-08-22 06:12:14'),
(147, 3, 'karijma cotton', '2', '750', '/barcode/azvskgc39.png', NULL, '2024-01-11 17:31:30', '2024-01-11 17:31:30'),
(148, 4, 'bed sheet', '2', '850', '/barcode/6pcgdmc39.png', NULL, '2024-01-11 17:44:44', '2024-01-11 17:44:44'),
(149, 5, 'batiq(cundry)', '2', '600', '/barcode/8cdu3xc39.png', NULL, '2024-01-11 18:04:47', '2024-01-11 18:04:47'),
(150, 6, 'bishal', '2', '800', '/barcode/c64el3c39.png', NULL, '2024-01-12 15:11:16', '2024-01-12 15:11:16'),
(151, 7, 'tat', '2', '800', '/barcode/2vzlxac39.png', NULL, '2024-01-12 15:12:07', '2024-01-12 15:12:07'),
(152, 8, 'taidai', '2', '600', '/barcode/xwqjiwc39.png', NULL, '2024-01-12 15:13:25', '2024-01-12 15:13:25'),
(153, 9, 'Aari (Pakisthani)', '3', '1500', '/barcode/hi2qymc39.png', NULL, '2024-01-12 15:14:37', '2024-01-12 15:14:37'),
(154, 10, 'guljy(1)', '2', '1000', '/barcode/kmnqrmc39.png', NULL, '2024-01-12 15:15:54', '2024-01-12 15:15:54'),
(155, 11, 'guljy(2)', '2', '1000', '/barcode/h3vflgc39.png', NULL, '2024-01-12 15:16:39', '2024-01-12 15:16:39'),
(156, 12, 'Aari (Bangladesh)', '2', '1200', '/barcode/w1m2lwc39.png', NULL, '2024-01-12 15:18:12', '2024-01-12 15:18:12'),
(157, 13, 'Ranguli (Indian)', '1', '1000', '/barcode/avegn1c39.png', NULL, '2024-01-12 15:21:24', '2024-01-12 15:21:24'),
(158, 14, 'batiq-karcupy', '2', '900', '/barcode/qyifq3c39.png', NULL, '2024-01-12 15:25:17', '2024-01-12 15:25:17'),
(159, 15, 'batiq', '2', '650', '/barcode/imhpkrc39.png', NULL, '2024-01-12 15:27:32', '2024-01-12 15:27:32'),
(160, 16, '3-piece', '2', '850', '/barcode/myuykcc39.png', NULL, '2024-01-12 15:28:19', '2024-01-12 15:28:19'),
(161, 17, 'big hair clutcher', '4', '35', '/barcode/gt2acyc39.png', NULL, '2024-01-12 18:38:46', '2024-01-12 18:38:46'),
(162, 18, 'Middel hair clutcher', '4', '30', '/barcode/qtlvadc39.png', NULL, '2024-01-12 18:40:32', '2024-01-12 20:11:59'),
(163, 19, 'smell hair clutcher', '4', '20', '/barcode/pu5lgpc39.png', NULL, '2024-01-12 18:58:07', '2024-01-12 18:58:07'),
(164, 20, 'baby rabar', '4', '20', '/barcode/nh55yyc39.png', NULL, '2024-01-12 19:05:50', '2024-01-12 19:05:50'),
(165, 21, 'bag rabar', '4', '20', '/barcode/o4anvmc39.png', NULL, '2024-01-12 19:06:35', '2024-01-12 19:06:35'),
(166, 22, 'rabar', '4', '20', '/barcode/pgrll4c39.png', NULL, '2024-01-12 19:07:40', '2024-01-12 19:07:40'),
(167, 23, 'ring(1)', '4', '80', '/barcode/ssaewsc39.png', NULL, '2024-01-12 19:09:20', '2024-01-12 19:09:20'),
(168, 24, 'ring(2)', '4', '50', '/barcode/6paud8c39.png', NULL, '2024-01-12 19:10:04', '2024-01-12 19:10:04'),
(169, 25, 'bracelet(1)', '4', '180', '/barcode/vz2xnqc39.png', NULL, '2024-01-12 19:11:31', '2024-01-12 19:11:31'),
(170, 26, 'bracelet(2)', '4', '150', '/barcode/vlj9lrc39.png', NULL, '2024-01-12 19:12:08', '2024-01-12 19:12:08'),
(171, 27, 'ear ring (1)', '4', '200', '/barcode/i0mfa7c39.png', NULL, '2024-01-12 19:13:20', '2024-01-12 19:13:20'),
(172, 29, 'ear ring (2)', '4', '150', '/barcode/intbgfc39.png', NULL, '2024-01-12 19:15:49', '2024-01-12 19:15:49'),
(173, 30, 'ear ring (3)', '4', '20', '/barcode/zyo2hic39.png', NULL, '2024-01-12 19:16:37', '2024-01-12 19:16:37'),
(174, 31, 'bair clips', '4', '40', '/barcode/t2j0bcc39.png', NULL, '2024-01-12 19:17:42', '2024-01-12 19:17:42'),
(175, 33, 'septi pin', '4', '15', '/barcode/p0tc7jc39.png', NULL, '2024-01-12 19:44:43', '2024-01-12 20:16:21'),
(176, 34, 'Al pin', '4', '20', '/barcode/ebtcivc39.png', NULL, '2024-01-12 19:46:00', '2024-01-12 19:46:00'),
(177, 35, 'hijab pin', '4', '20', '/barcode/3heg7uc39.png', NULL, '2024-01-12 19:47:22', '2024-01-12 19:47:22'),
(178, 36, 'smell smell hair clutcher', '4', '20', '/barcode/f1wovtc39.png', NULL, '2024-01-19 23:05:05', '2024-01-19 23:05:05');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Rasel', '2_1684129568.jpg', 'webhat', '234', 'rasel.netrweb@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', '1216', 'Bangladesh', 1, '2023-09-07 10:17:57', '2024-01-12 20:04:06'),
(2, 'Sorna', '2_1684129568.jpg', 'susuta butiqe ghore', '234', 'therashedul@gmail.com', '0430719596', '13/1 Myers St, Roseland, NSW-2195', 'Dhaka', '2195', 'Bangladesh', 1, '2024-01-12 20:04:23', '2024-01-12 20:04:23');

-- --------------------------------------------------------

--
-- Table structure for table `blacklists`
--

CREATE TABLE `blacklists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'India', NULL, 1, '2023-12-24 06:11:10', '2024-01-11 15:46:52'),
(2, 'Bangladeshi', NULL, 1, '2023-12-24 06:11:15', '2024-01-11 15:46:40'),
(3, 'Pakisthan', NULL, 1, '2024-01-11 15:47:02', '2024-01-11 15:47:02'),
(4, 'China', NULL, 1, '2024-01-11 15:47:18', '2024-01-11 15:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` bigint UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5000, 1, 2, 1, '2023-09-18 09:39:50', '2023-09-18 09:39:50'),
(2, 12000, 1, 3, 1, '2023-09-18 10:45:19', '2023-09-18 10:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `category_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `privatecat` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title_en`, `name_en`, `slug_en`, `title_bn`, `name_bn`, `slug_bn`, `link`, `parent_id`, `category_img`, `status`, `privatecat`, `created_at`, `updated_at`) VALUES
(1, 'Women', 'Women', 'Women', 'Women', 'Women', 'Women', NULL, 0, NULL, 1, NULL, '2023-12-24 06:10:40', '2023-12-24 06:10:40'),
(2, 'children', 'children', 'children', 'children', 'children', 'children', NULL, 0, '2_1703407027.jpg', 1, NULL, '2023-12-24 06:10:58', '2023-12-24 08:37:14'),
(3, '3 piece', '3 piece', '3_piece', '3 piece', '3 piece', '3_piece', NULL, 1, NULL, 1, NULL, '2024-01-11 13:37:25', '2024-01-11 13:37:25'),
(4, 'bra', 'bra', 'bra', 'bra', 'bra', 'bra', NULL, 1, NULL, 1, NULL, '2024-01-11 13:38:14', '2024-01-11 13:38:14'),
(5, 'panty', 'panty', 'panty', 'panty', 'panty', 'panty', NULL, 1, NULL, 1, NULL, '2024-01-11 13:38:26', '2024-01-11 13:38:26'),
(6, 'hijab', 'hijab', 'hijab', 'hijab', 'hijab', 'hijab', NULL, 1, NULL, 1, NULL, '2024-01-11 13:39:03', '2024-01-11 13:39:03'),
(7, 'earrings', 'earrings', 'earrings', 'earrings', 'earrings', 'earrings', NULL, 1, NULL, 1, NULL, '2024-01-11 13:40:05', '2024-01-11 13:40:05'),
(8, 'bracelet', 'bracelet', 'bracelet', 'bracelet', 'bracelet', 'bracelet', NULL, 1, NULL, 1, NULL, '2024-01-11 13:40:42', '2024-01-11 13:40:42'),
(9, 'hair band', 'hair band', 'hair_band', 'hair band', 'hair band', 'hair_band', NULL, 2, NULL, 1, NULL, '2024-01-11 13:41:02', '2024-01-11 13:41:02'),
(10, 'hair clips', 'hair clips', 'hair_clips', 'hair clips', 'hair clips', 'hair_clips', NULL, 2, NULL, 1, NULL, '2024-01-11 13:41:38', '2024-01-11 13:41:38'),
(11, 'hair clutcher', 'hair clutcher', 'hair_clutcher', 'hair clutcher', 'hair clutcher', 'hair_clutcher', NULL, 1, NULL, 1, NULL, '2024-01-11 13:42:21', '2024-01-11 13:42:21'),
(12, 'Bed sheet', 'Bed sheet', 'Bed_sheet', 'Bed sheet', 'Bed sheet', 'Bed_sheet', NULL, 0, NULL, 1, NULL, '2024-01-11 15:20:48', '2024-01-11 15:20:48'),
(13, 'septi pin', 'septi pin', 'septi_pin', 'septi pin', 'septi pin', 'septi_pin', NULL, 1, NULL, 1, NULL, '2024-01-12 19:01:47', '2024-01-12 19:01:47'),
(14, 'al pin', 'al pin', 'al_pin', 'al pin', 'al pin', 'al_pin', NULL, 1, NULL, 1, NULL, '2024-01-12 19:02:11', '2024-01-12 19:02:11'),
(15, 'hijab pin', 'hijab pin', 'hijab_pin', 'hijab pin', 'hijab pin', 'hijab_pin', NULL, 1, NULL, 1, NULL, '2024-01-12 19:02:37', '2024-01-12 19:02:37'),
(16, 'baby rabar', 'baby rabar', 'baby_rabar', 'baby rabar', 'baby rabar', 'baby_rabar', NULL, 2, NULL, 1, NULL, '2024-01-12 19:03:07', '2024-01-12 19:03:07'),
(17, 'bag rabar', 'bag rabar', 'bag_rabar', 'bag rabar', 'bag rabar', 'bag_rabar', NULL, 2, NULL, 1, NULL, '2024-01-12 19:03:25', '2024-01-12 19:03:25'),
(18, 'ring', 'ring', 'ring', 'ring', 'ring', 'ring', NULL, 1, NULL, 1, NULL, '2024-01-12 19:08:26', '2024-01-12 19:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `comment_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `used` int DEFAULT NULL,
  `expired_date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(2, 'korotua', '1709370009', 'mirpur - 12', '2023-09-14 04:56:20', '2023-09-14 04:56:20'),
(3, 'sundor bon', '0904422959', 'mirpur - 12', '2023-09-14 04:56:37', '2023-09-14 04:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_group_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` int DEFAULT NULL,
  `tax_no` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `expense` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `address`, `city`, `state`, `image`, `postal_code`, `country`, `deposit`, `tax_no`, `is_active`, `expense`, `points`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Khalamoni', 'house', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, 3, '2023-09-10 05:01:56', '2024-01-11 13:24:37'),
(2, 1, 1, 'rasel karim', 'susuta butiqe ghore', 'rasel.netrweb@gmail.com', '01818401065', '13/1 Myers St, Roseland, NSW-2195', 'Dhaka', NULL, NULL, '2195', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-09-10 05:05:46', '2024-01-15 10:58:03'),
(3, 2, NULL, 'sorna', 'susuta butiqe ghore', 'sorna@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-09-20 04:24:29', '2023-11-02 10:18:46'),
(4, 1, 1, 'bonna', 'house', 'sonaliislamborna@gmail.com', '01923809395', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-12-26 05:02:19', '2024-01-11 13:24:01'),
(5, 1, 1, 'Apu', 'house', 'webhatbd@gmail.com', '01709370009', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2024-01-11 13:25:57', '2024-01-11 13:27:29'),
(6, 1, 1, 'rupon', 'house', 'rupon@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, 123, 1, NULL, NULL, '2024-01-11 13:26:50', '2024-01-11 13:26:50'),
(7, 1, 1, 'Rupon bua', 'house', 'webhatbd@gmail.com', '01709370009', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, 123, 1, NULL, NULL, '2024-01-11 13:31:12', '2024-01-11 13:31:12'),
(8, 1, 1, 'guest', 'house', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, 123, 1, NULL, 19, '2024-01-13 15:54:08', '2024-01-13 16:17:27'),
(9, 1, 1, 'Mehrima ma', 'house', 'mehrimama@gmail.com', '01776372277', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2024-01-14 15:26:00', '2024-01-19 22:37:37'),
(10, 1, 1, 'Abudullah', 'house', 'abudullahgmail.com', '01856470579', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, 37, '2024-01-19 22:34:47', '2024-01-19 22:40:47'),
(11, 1, 1, 'bithi vabi', 'house', 'bithi@gmail.com', '01712017254', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, 14, '2024-01-19 22:35:24', '2024-01-19 22:42:34'),
(12, 1, 1, 'munni vabi', 'house', 'munni@gmail.com', '01723561056', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, 123, 1, NULL, NULL, '2024-01-19 22:38:26', '2024-01-19 22:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'general', '0', 1, '2023-12-24 07:09:07', '2024-01-12 20:02:45'),
(2, 'vip group', '-10', 1, '2023-12-24 07:09:32', '2023-12-24 07:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `belongs_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `option_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `grid_value` int NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `belongs_to`, `name`, `type`, `default_value`, `option_value`, `grid_value`, `is_table`, `is_invoice`, `is_required`, `is_admin`, `is_disable`, `created_at`, `updated_at`) VALUES
(1, 'sale', 'Test', 'text', 'Test', '', 3, 1, 0, 1, 0, 0, '2023-07-11 06:02:46', '2023-07-11 06:02:46');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int NOT NULL,
  `user_id` int NOT NULL,
  `courier_id` int DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `reference_no`, `sale_id`, `user_id`, `courier_id`, `address`, `delivered_by`, `recieved_by`, `file`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dr-20240121-041334', 42, 1, 3, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh', 'rohim', 'rasel', NULL, NULL, '3', '2024-01-21 16:13:47', '2024-01-21 16:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'new department', 1, '2023-10-11 06:07:29', '2023-10-11 06:07:29'),
(2, 'office departmentss', 0, '2023-10-11 06:09:21', '2023-10-11 06:12:04'),
(3, 'department1', 1, '2023-10-31 03:28:02', '2023-10-31 03:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_for` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `applicable_for`, `product_list`, `valid_from`, `valid_till`, `type`, `value`, `minimum_qty`, `maximum_qty`, `days`, `is_active`, `created_at`, `updated_at`) VALUES
(9, 'weekly offer', 'All', '', '2023-09-11', '2023-09-22', 'percentage', 10, 12, 212, 'Mon,Tue,Wed', 1, '2023-09-11 10:37:29', '2023-09-12 03:57:58'),
(11, 'summer', 'Specific', '64,63', '2023-10-03', '2023-10-03', 'percentage', 10, 12, 21, 'Fri,Sat', 1, '2023-10-03 10:32:49', '2023-10-04 05:48:06'),
(12, 'demo3', 'Specific', '63', '2023-10-03', '2023-10-28', 'percentage', 12, 12, 21, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', 1, '2023-10-03 10:49:48', '2023-10-04 05:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plans`
--

INSERT INTO `discount_plans` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'vip plan', 1, '2023-09-11 09:53:50', '2023-09-11 09:53:50'),
(4, 'global', 1, '2023-09-11 09:56:22', '2023-09-11 10:09:30');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint UNSIGNED NOT NULL,
  `discount_plan_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plan_customers`
--

INSERT INTO `discount_plan_customers` (`id`, `discount_plan_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-12-24 06:23:49', '2023-12-24 06:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `discount_id` int NOT NULL,
  `discount_plan_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone_number`, `user_id`, `department_id`, `image`, `address`, `city`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'sorna', 'sorna@gmail.com', '01818401065', NULL, 1, NULL, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', 'Bangladesh', 0, '2023-10-11 06:19:38', '2023-10-11 06:46:47'),
(2, 'sorna', 'sorna@gmail.com', '01818401065', NULL, 1, NULL, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', 'Bangladesh', 1, '2023-10-11 06:47:31', '2023-10-11 06:50:22'),
(3, 'new name', 'newuser@gmail.com', '01818401065', NULL, 1, NULL, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', 'Bangladesh', 0, '2023-10-11 06:51:17', '2023-10-11 06:51:26'),
(4, 'faisal', 'therashedul@gmail.com', '01818401065', NULL, 1, NULL, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', 'Bangladesh', 1, '2023-10-12 11:20:48', '2023-10-12 11:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `account_id` int NOT NULL,
  `cash_register_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `reference_no`, `expense_category_id`, `warehouse_id`, `account_id`, `cash_register_id`, `user_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(2, 'er-20231010-115141', 4, 2, 1, 2, 1, 600, 'short distance', '2024-01-09 18:00:00', '2024-01-14 09:08:14'),
(3, 'er-20231010-023819', 3, 2, 1, 1, 1, 300, 'chokbazar', '2024-01-09 18:00:00', '2024-01-14 09:08:28'),
(4, 'er-20231101-121846', 2, 2, 1, 1, 1, 400, NULL, '2024-01-08 18:00:00', '2024-01-11 16:29:08'),
(5, 'er-20240113-125441', 7, 2, 1, 1, 1, 600, 'cup+boxs', '2024-01-09 18:00:00', '2024-01-12 18:54:41'),
(6, 'er-20240114-031015', 7, 2, 1, 1, 1, 250, 'kakra jhuri(150)+coffee cup(50)+tushu(50)', '2023-12-31 00:00:00', '2024-01-19 22:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(2, '804281679', 'traveling', 1, '2023-10-10 04:42:06', '2023-10-10 04:57:59'),
(3, '201543016', 'lunch', 1, '2023-10-10 04:42:17', '2023-10-10 04:42:17'),
(4, '555342608', 'worker', 1, '2024-01-11 13:13:50', '2024-01-11 13:13:50'),
(5, '535444416', 'product bag', 1, '2024-01-11 13:21:56', '2024-01-11 13:21:56'),
(6, '297841558', 'Koriar', 1, '2024-01-11 13:22:08', '2024-01-11 13:22:08'),
(7, '556562254', 'Others', 1, '2024-01-11 13:22:43', '2024-01-11 13:22:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `currency_position` int DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_registration_number` int DEFAULT NULL,
  `theme` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `developed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `currency_position`, `company_name`, `staff_access`, `date_format`, `vat_registration_number`, `theme`, `developed_by`, `invoice_format`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Myshop', '20231002014940.jpg', '0', 1, 1, 'Myshop company', 'all', 'd-m-Y', 98098007, 'default.css', 'rasel', 'standard', 1, '2023-10-02 06:53:33', '2024-01-11 16:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `card_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gift_cards`
--

INSERT INTO `gift_cards` (`id`, `card_no`, `amount`, `expense`, `customer_id`, `user_id`, `expired_date`, `created_by`, `is_active`, `created_at`, `updated_at`) VALUES
(18, '723114460876E20', 450, -2444, 2, NULL, '2023-10-31', 1, 1, '2023-09-18 06:14:26', '2023-11-02 08:21:27'),
(19, '209400237538487', 350, 0, 1, NULL, '2023-09-27', 1, 1, '2023-09-18 06:25:05', '2023-10-22 08:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` bigint UNSIGNED NOT NULL,
  `gift_card_id` int NOT NULL,
  `amount` double NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gift_card_recharges`
--

INSERT INTO `gift_card_recharges` (`id`, `gift_card_id`, `amount`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 17, 250, 1, '2023-09-18 06:14:49', '2023-09-18 06:14:49'),
(2, 19, 300, 1, '2023-09-18 06:42:01', '2023-09-18 06:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `hitlogs`
--

CREATE TABLE `hitlogs` (
  `id` bigint UNSIGNED NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spent_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hitlogs`
--

INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:50:13', '2024-01-10 15:50:13'),
(2, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:50:22', '2024-01-10 15:50:22'),
(3, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:50:32', '2024-01-10 15:50:32'),
(4, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:50:34', '2024-01-10 15:50:34'),
(5, '103.143.183.253', 'superAdmin.barcode.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:51:06', '2024-01-10 15:51:06'),
(6, '103.143.183.253', 'superAdmin.barcode.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:52:15', '2024-01-10 15:52:15'),
(7, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:52:27', '2024-01-10 15:52:27'),
(8, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:52:29', '2024-01-10 15:52:29'),
(9, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:57:29', '2024-01-10 15:57:29'),
(10, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:57:32', '2024-01-10 15:57:32'),
(11, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:57:38', '2024-01-10 15:57:38'),
(12, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:57:40', '2024-01-10 15:57:40'),
(13, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:57:49', '2024-01-10 15:57:49'),
(14, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:58:00', '2024-01-10 15:58:00'),
(15, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:58:10', '2024-01-10 15:58:10'),
(16, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:58:11', '2024-01-10 15:58:11'),
(17, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 15:58:13', '2024-01-10 15:58:13'),
(18, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:00:44', '2024-01-10 16:00:44'),
(19, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:00:49', '2024-01-10 16:00:49'),
(20, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:02', '2024-01-10 16:01:02'),
(21, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:11', '2024-01-10 16:01:11'),
(22, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:12', '2024-01-10 16:01:12'),
(23, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:14', '2024-01-10 16:01:14'),
(24, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:25', '2024-01-10 16:01:25'),
(25, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:33', '2024-01-10 16:01:33'),
(26, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:34', '2024-01-10 16:01:34'),
(27, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:01:36', '2024-01-10 16:01:36'),
(28, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:02:49', '2024-01-10 16:02:49'),
(29, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:02:51', '2024-01-10 16:02:51'),
(30, '103.143.183.253', 'superAdmin.purchase.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchases.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:03', '2024-01-10 16:03:03'),
(31, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:04', '2024-01-10 16:03:04'),
(32, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:06', '2024-01-10 16:03:06'),
(33, '103.143.183.253', 'superAdmin.purchase.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchases.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:14', '2024-01-10 16:03:14'),
(34, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:14', '2024-01-10 16:03:14'),
(35, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:16', '2024-01-10 16:03:16'),
(36, '103.143.183.253', 'superAdmin.purchase.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchases.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:23', '2024-01-10 16:03:23'),
(37, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:23', '2024-01-10 16:03:23'),
(38, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:25', '2024-01-10 16:03:25'),
(39, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:34', '2024-01-10 16:03:34'),
(40, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:03:36', '2024-01-10 16:03:36'),
(41, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:04:15', '2024-01-10 16:04:15'),
(42, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:04:17', '2024-01-10 16:04:17'),
(43, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:06:55', '2024-01-10 16:06:55'),
(44, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:06:57', '2024-01-10 16:06:57'),
(45, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:07:11', '2024-01-10 16:07:11'),
(46, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:07:13', '2024-01-10 16:07:13'),
(47, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:07:17', '2024-01-10 16:07:17'),
(48, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:09:22', '2024-01-10 16:09:22'),
(49, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:09:25', '2024-01-10 16:09:25'),
(50, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:10:45', '2024-01-10 16:10:45'),
(51, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:10:47', '2024-01-10 16:10:47'),
(52, '103.143.183.253', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:11:12', '2024-01-10 16:11:12'),
(53, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:14:24', '2024-01-10 16:14:24'),
(54, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:14:44', '2024-01-10 16:14:44'),
(55, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:15:47', '2024-01-10 16:15:47'),
(56, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:15:55', '2024-01-10 16:15:55'),
(57, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:56:11', '2024-01-10 16:56:11'),
(58, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:56:13', '2024-01-10 16:56:13'),
(59, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:56:22', '2024-01-10 16:56:22'),
(60, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 16:56:24', '2024-01-10 16:56:24'),
(61, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:00:08', '2024-01-11 13:00:08'),
(62, '103.143.183.253', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:00:20', '2024-01-11 13:00:20'),
(63, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:04:20', '2024-01-11 13:04:20'),
(64, '103.143.183.253', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:04:29', '2024-01-11 13:04:29'),
(65, '103.143.183.253', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:04:43', '2024-01-11 13:04:43'),
(66, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:05:36', '2024-01-11 13:05:36'),
(67, '103.143.183.253', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:05:46', '2024-01-11 13:05:46'),
(68, '103.143.183.253', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:06:07', '2024-01-11 13:06:07'),
(69, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:31', '2024-01-11 13:11:31'),
(70, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:33', '2024-01-11 13:11:33'),
(71, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:38', '2024-01-11 13:11:38'),
(72, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:39', '2024-01-11 13:11:39'),
(73, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:39', '2024-01-11 13:11:39'),
(74, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:48', '2024-01-11 13:11:48'),
(75, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:48', '2024-01-11 13:11:48'),
(76, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:49', '2024-01-11 13:11:49'),
(77, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:58', '2024-01-11 13:11:58'),
(78, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:58', '2024-01-11 13:11:58'),
(79, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:11:59', '2024-01-11 13:11:59'),
(80, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:13:19', '2024-01-11 13:13:19'),
(81, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories/gencode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:13:37', '2024-01-11 13:13:37'),
(82, '103.143.183.253', 'superAdmin.expense_categories.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:13:50', '2024-01-11 13:13:50'),
(83, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:13:50', '2024-01-11 13:13:50'),
(84, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories/gencode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:13:58', '2024-01-11 13:13:58'),
(85, '103.143.183.253', 'superAdmin.expense_categories.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:21:56', '2024-01-11 13:21:56'),
(86, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:21:56', '2024-01-11 13:21:56'),
(87, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories/gencode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:02', '2024-01-11 13:22:02'),
(88, '103.143.183.253', 'superAdmin.expense_categories.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:07', '2024-01-11 13:22:07'),
(89, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:08', '2024-01-11 13:22:08'),
(90, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories/gencode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:38', '2024-01-11 13:22:38'),
(91, '103.143.183.253', 'superAdmin.expense_categories.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:43', '2024-01-11 13:22:43'),
(92, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:43', '2024-01-11 13:22:43'),
(93, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:22:59', '2024-01-11 13:22:59'),
(94, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:23:01', '2024-01-11 13:23:01'),
(95, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:23:03', '2024-01-11 13:23:03'),
(96, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:23:03', '2024-01-11 13:23:03'),
(97, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:23:06', '2024-01-11 13:23:06'),
(98, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:23:08', '2024-01-11 13:23:08'),
(99, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:24:01', '2024-01-11 13:24:01'),
(100, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:24:02', '2024-01-11 13:24:02'),
(101, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:24:37', '2024-01-11 13:24:37'),
(102, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:24:38', '2024-01-11 13:24:38'),
(103, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:25:08', '2024-01-11 13:25:08'),
(104, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:25:10', '2024-01-11 13:25:10'),
(105, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:25:10', '2024-01-11 13:25:10'),
(106, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:25:57', '2024-01-11 13:25:57'),
(107, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:25:57', '2024-01-11 13:25:57'),
(108, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:26:19', '2024-01-11 13:26:19'),
(109, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:26:21', '2024-01-11 13:26:21'),
(110, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:26:21', '2024-01-11 13:26:21'),
(111, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:26:50', '2024-01-11 13:26:50'),
(112, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:26:51', '2024-01-11 13:26:51'),
(113, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:27:29', '2024-01-11 13:27:29'),
(114, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:27:29', '2024-01-11 13:27:29'),
(115, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:30:41', '2024-01-11 13:30:41'),
(116, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:30:43', '2024-01-11 13:30:43'),
(117, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:30:43', '2024-01-11 13:30:43'),
(118, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:31:12', '2024-01-11 13:31:12'),
(119, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:31:13', '2024-01-11 13:31:13'),
(120, '103.143.183.253', 'superAdmin.supplier.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:32:34', '2024-01-11 13:32:34'),
(121, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:32:34', '2024-01-11 13:32:34'),
(122, '103.143.183.253', 'superAdmin.supplier.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:33:16', '2024-01-11 13:33:16'),
(123, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:33:16', '2024-01-11 13:33:16'),
(124, '103.143.183.253', 'superAdmin.supplier.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:34:25', '2024-01-11 13:34:25'),
(125, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:34:26', '2024-01-11 13:34:26'),
(126, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:35:24', '2024-01-11 13:35:24'),
(127, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:35:26', '2024-01-11 13:35:26'),
(128, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:35:26', '2024-01-11 13:35:26'),
(129, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:37:25', '2024-01-11 13:37:25'),
(130, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:37:26', '2024-01-11 13:37:26'),
(131, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:38:14', '2024-01-11 13:38:14'),
(132, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:38:15', '2024-01-11 13:38:15'),
(133, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:38:26', '2024-01-11 13:38:26'),
(134, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:38:27', '2024-01-11 13:38:27'),
(135, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:39:03', '2024-01-11 13:39:03'),
(136, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:39:04', '2024-01-11 13:39:04'),
(137, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:40:05', '2024-01-11 13:40:05'),
(138, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:40:06', '2024-01-11 13:40:06'),
(139, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:40:42', '2024-01-11 13:40:42'),
(140, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:40:42', '2024-01-11 13:40:42'),
(141, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:41:02', '2024-01-11 13:41:02'),
(142, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:41:03', '2024-01-11 13:41:03'),
(143, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:41:38', '2024-01-11 13:41:38'),
(144, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:41:38', '2024-01-11 13:41:38'),
(145, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:42:21', '2024-01-11 13:42:21'),
(146, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 13:42:22', '2024-01-11 13:42:22'),
(147, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:20:48', '2024-01-11 15:20:48'),
(148, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:20:48', '2024-01-11 15:20:48'),
(149, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:45:35', '2024-01-11 15:45:35'),
(150, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:45:39', '2024-01-11 15:45:39'),
(151, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:45:56', '2024-01-11 15:45:56'),
(152, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:45:58', '2024-01-11 15:45:58'),
(153, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:14', '2024-01-11 15:46:14'),
(154, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:16', '2024-01-11 15:46:16'),
(155, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:23', '2024-01-11 15:46:23'),
(156, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:25', '2024-01-11 15:46:25'),
(157, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:26', '2024-01-11 15:46:26'),
(158, '103.143.183.253', 'superAdmin.brand.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:40', '2024-01-11 15:46:40'),
(159, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:41', '2024-01-11 15:46:41'),
(160, '103.143.183.253', 'superAdmin.brand.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:52', '2024-01-11 15:46:52'),
(161, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:46:53', '2024-01-11 15:46:53'),
(162, '103.143.183.253', 'superAdmin.brand.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:01', '2024-01-11 15:47:01'),
(163, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:02', '2024-01-11 15:47:02'),
(164, '103.143.183.253', 'superAdmin.brand.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:18', '2024-01-11 15:47:18'),
(165, '103.143.183.253', 'superAdmin.brand', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/brand', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:19', '2024-01-11 15:47:19'),
(166, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:53', '2024-01-11 15:47:53'),
(167, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:47:55', '2024-01-11 15:47:55'),
(168, '103.143.183.253', 'superAdmin.warehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:01', '2024-01-11 15:48:01'),
(169, '103.143.183.253', 'superAdmin.warehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:03', '2024-01-11 15:48:03'),
(170, '103.143.183.253', 'superAdmin.warehouse.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:17', '2024-01-11 15:48:17'),
(171, '103.143.183.253', 'superAdmin.warehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:17', '2024-01-11 15:48:17'),
(172, '103.143.183.253', 'superAdmin.warehouse.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:28', '2024-01-11 15:48:28'),
(173, '103.143.183.253', 'superAdmin.warehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/warehouse', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:48:29', '2024-01-11 15:48:29'),
(174, '103.143.183.253', 'superAdmin.unit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:49:28', '2024-01-11 15:49:28'),
(175, '103.143.183.253', 'superAdmin.unit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:49:30', '2024-01-11 15:49:30'),
(176, '103.143.183.253', 'superAdmin.unit.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:50:10', '2024-01-11 15:50:10'),
(177, '103.143.183.253', 'superAdmin.unit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:50:11', '2024-01-11 15:50:11'),
(178, '103.143.183.253', 'superAdmin.unit.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:50:17', '2024-01-11 15:50:17'),
(179, '103.143.183.253', 'superAdmin.unit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/unit', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:50:17', '2024-01-11 15:50:17'),
(180, '103.143.183.253', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 15:52:11', '2024-01-11 15:52:11'),
(181, '103.143.183.253', 'superAdmin.ganeralsetting.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:30', '2024-01-11 16:24:30'),
(182, '103.143.183.253', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:31', '2024-01-11 16:24:31'),
(183, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:50', '2024-01-11 16:24:50'),
(184, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:52', '2024-01-11 16:24:52'),
(185, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:56', '2024-01-11 16:24:56'),
(186, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:24:58', '2024-01-11 16:24:58'),
(187, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:25:09', '2024-01-11 16:25:09'),
(188, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:25:33', '2024-01-11 16:25:33'),
(189, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:25:35', '2024-01-11 16:25:35'),
(190, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:25:48', '2024-01-11 16:25:48'),
(191, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:25:50', '2024-01-11 16:25:50'),
(192, '103.143.183.253', 'superAdmin.tax.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:26:17', '2024-01-11 16:26:17'),
(193, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:26:18', '2024-01-11 16:26:18'),
(194, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:27:01', '2024-01-11 16:27:01'),
(195, '103.143.183.253', 'superAdmin.tax.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:27:01', '2024-01-11 16:27:01'),
(196, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:27:02', '2024-01-11 16:27:02'),
(197, '103.143.183.253', 'superAdmin.tax', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/tax', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:27:12', '2024-01-11 16:27:12'),
(198, '103.143.183.253', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:27:37', '2024-01-11 16:27:37'),
(199, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:28:08', '2024-01-11 16:28:08'),
(200, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:28:10', '2024-01-11 16:28:10'),
(201, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:29:08', '2024-01-11 16:29:08'),
(202, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:29:08', '2024-01-11 16:29:08'),
(203, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:29:09', '2024-01-11 16:29:09'),
(204, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:30:14', '2024-01-11 16:30:14'),
(205, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:33:55', '2024-01-11 16:33:55'),
(206, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:33:57', '2024-01-11 16:33:57'),
(207, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:34:28', '2024-01-11 16:34:28'),
(208, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:36:15', '2024-01-11 16:36:15'),
(209, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:37:04', '2024-01-11 16:37:04');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(210, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:37:04', '2024-01-11 16:37:04'),
(211, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:37:06', '2024-01-11 16:37:06'),
(212, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:37:08', '2024-01-11 16:37:08'),
(213, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:37:11', '2024-01-11 16:37:11'),
(214, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:44:11', '2024-01-11 16:44:11'),
(215, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:44:14', '2024-01-11 16:44:14'),
(216, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:44:27', '2024-01-11 16:44:27'),
(217, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:44:34', '2024-01-11 16:44:34'),
(218, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:48:27', '2024-01-11 16:48:27'),
(219, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:59:26', '2024-01-11 16:59:26'),
(220, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:59:54', '2024-01-11 16:59:54'),
(221, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 16:59:56', '2024-01-11 16:59:56'),
(222, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:19:52', '2024-01-11 17:19:52'),
(223, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:19:55', '2024-01-11 17:19:55'),
(224, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:20:02', '2024-01-11 17:20:02'),
(225, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:20:05', '2024-01-11 17:20:05'),
(226, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:20:27', '2024-01-11 17:20:27'),
(227, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:20:27', '2024-01-11 17:20:27'),
(228, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:23:06', '2024-01-11 17:23:06'),
(229, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:23:08', '2024-01-11 17:23:08'),
(230, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:25:20', '2024-01-11 17:25:20'),
(231, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:25:22', '2024-01-11 17:25:22'),
(232, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:25:25', '2024-01-11 17:25:25'),
(233, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:25:43', '2024-01-11 17:25:43'),
(234, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:26:07', '2024-01-11 17:26:07'),
(235, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:26:07', '2024-01-11 17:26:07'),
(236, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:26:09', '2024-01-11 17:26:09'),
(237, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:26:13', '2024-01-11 17:26:13'),
(238, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:26:15', '2024-01-11 17:26:15'),
(239, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:28:12', '2024-01-11 17:28:12'),
(240, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:14', '2024-01-11 17:29:14'),
(241, '103.143.183.253', 'superAdmin.barcode.deleted', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.deleted/145', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:19', '2024-01-11 17:29:19'),
(242, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:20', '2024-01-11 17:29:20'),
(243, '103.143.183.253', 'superAdmin.barcode.deleted', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.deleted/146', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:23', '2024-01-11 17:29:23'),
(244, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:24', '2024-01-11 17:29:24'),
(245, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:35', '2024-01-11 17:29:35'),
(246, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:36', '2024-01-11 17:29:36'),
(247, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:39', '2024-01-11 17:29:39'),
(248, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:29:41', '2024-01-11 17:29:41'),
(249, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:30:54', '2024-01-11 17:30:54'),
(250, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:30', '2024-01-11 17:31:30'),
(251, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:30', '2024-01-11 17:31:30'),
(252, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:32', '2024-01-11 17:31:32'),
(253, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:37', '2024-01-11 17:31:37'),
(254, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:39', '2024-01-11 17:31:39'),
(255, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:31:43', '2024-01-11 17:31:43'),
(256, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:43:53', '2024-01-11 17:43:53'),
(257, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:43:55', '2024-01-11 17:43:55'),
(258, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:02', '2024-01-11 17:44:02'),
(259, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:44', '2024-01-11 17:44:44'),
(260, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:44', '2024-01-11 17:44:44'),
(261, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:46', '2024-01-11 17:44:46'),
(262, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:54', '2024-01-11 17:44:54'),
(263, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 17:44:56', '2024-01-11 17:44:56'),
(264, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:02:35', '2024-01-11 18:02:35'),
(265, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:02:37', '2024-01-11 18:02:37'),
(266, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:02:55', '2024-01-11 18:02:55'),
(267, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:47', '2024-01-11 18:04:47'),
(268, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:47', '2024-01-11 18:04:47'),
(269, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:49', '2024-01-11 18:04:49'),
(270, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:53', '2024-01-11 18:04:53'),
(271, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:55', '2024-01-11 18:04:55'),
(272, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 18:04:58', '2024-01-11 18:04:58'),
(273, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:09:20', '2024-01-12 15:09:20'),
(274, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:09:22', '2024-01-12 15:09:22'),
(275, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:09:25', '2024-01-12 15:09:25'),
(276, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:09:27', '2024-01-12 15:09:27'),
(277, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:10:04', '2024-01-12 15:10:04'),
(278, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:16', '2024-01-12 15:11:16'),
(279, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:16', '2024-01-12 15:11:16'),
(280, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:18', '2024-01-12 15:11:18'),
(281, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:20', '2024-01-12 15:11:20'),
(282, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:22', '2024-01-12 15:11:22'),
(283, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:11:27', '2024-01-12 15:11:27'),
(284, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:07', '2024-01-12 15:12:07'),
(285, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:08', '2024-01-12 15:12:08'),
(286, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:10', '2024-01-12 15:12:10'),
(287, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:28', '2024-01-12 15:12:28'),
(288, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:30', '2024-01-12 15:12:30'),
(289, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:12:40', '2024-01-12 15:12:40'),
(290, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:13:25', '2024-01-12 15:13:25'),
(291, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:13:26', '2024-01-12 15:13:26'),
(292, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:13:28', '2024-01-12 15:13:28'),
(293, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:13:33', '2024-01-12 15:13:33'),
(294, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:13:35', '2024-01-12 15:13:35'),
(295, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:14:10', '2024-01-12 15:14:10'),
(296, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:14:37', '2024-01-12 15:14:37'),
(297, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:14:38', '2024-01-12 15:14:38'),
(298, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:14:40', '2024-01-12 15:14:40'),
(299, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:00', '2024-01-12 15:15:00'),
(300, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:03', '2024-01-12 15:15:03'),
(301, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:27', '2024-01-12 15:15:27'),
(302, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:54', '2024-01-12 15:15:54'),
(303, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:55', '2024-01-12 15:15:55'),
(304, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:15:57', '2024-01-12 15:15:57'),
(305, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:00', '2024-01-12 15:16:00'),
(306, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:03', '2024-01-12 15:16:03'),
(307, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:09', '2024-01-12 15:16:09'),
(308, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:39', '2024-01-12 15:16:39'),
(309, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:40', '2024-01-12 15:16:40'),
(310, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:41', '2024-01-12 15:16:41'),
(311, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:16:58', '2024-01-12 15:16:58'),
(312, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:17:00', '2024-01-12 15:17:00'),
(313, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:17:26', '2024-01-12 15:17:26'),
(314, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:12', '2024-01-12 15:18:12'),
(315, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:13', '2024-01-12 15:18:13'),
(316, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:15', '2024-01-12 15:18:15'),
(317, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:37', '2024-01-12 15:18:37'),
(318, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:40', '2024-01-12 15:18:40'),
(319, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:40', '2024-01-12 15:18:40'),
(320, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:18:49', '2024-01-12 15:18:49'),
(321, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:11', '2024-01-12 15:19:11'),
(322, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:12', '2024-01-12 15:19:12'),
(323, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:12', '2024-01-12 15:19:12'),
(324, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:14', '2024-01-12 15:19:14'),
(325, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:27', '2024-01-12 15:19:27'),
(326, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:19:30', '2024-01-12 15:19:30'),
(327, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:20:05', '2024-01-12 15:20:05'),
(328, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:21:24', '2024-01-12 15:21:24'),
(329, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:21:25', '2024-01-12 15:21:25'),
(330, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:21:26', '2024-01-12 15:21:26'),
(331, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:21:29', '2024-01-12 15:21:29'),
(332, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:21:31', '2024-01-12 15:21:31'),
(333, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:24:12', '2024-01-12 15:24:12'),
(334, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:24:24', '2024-01-12 15:24:24'),
(335, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:17', '2024-01-12 15:25:17'),
(336, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:18', '2024-01-12 15:25:18'),
(337, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:20', '2024-01-12 15:25:20'),
(338, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:33', '2024-01-12 15:25:33'),
(339, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:35', '2024-01-12 15:25:35'),
(340, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:25:48', '2024-01-12 15:25:48'),
(341, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:32', '2024-01-12 15:27:32'),
(342, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:33', '2024-01-12 15:27:33'),
(343, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:34', '2024-01-12 15:27:34'),
(344, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:37', '2024-01-12 15:27:37'),
(345, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:39', '2024-01-12 15:27:39'),
(346, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:27:56', '2024-01-12 15:27:56'),
(347, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:28:19', '2024-01-12 15:28:19'),
(348, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:28:20', '2024-01-12 15:28:20'),
(349, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:28:21', '2024-01-12 15:28:21'),
(350, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:28:47', '2024-01-12 15:28:47'),
(351, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:28:49', '2024-01-12 15:28:49'),
(352, '103.143.183.253', 'superAdmin.barcode.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:10', '2024-01-12 15:29:10'),
(353, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:23', '2024-01-12 15:29:23'),
(354, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:25', '2024-01-12 15:29:25'),
(355, '103.143.183.253', 'superAdmin.barcode.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:39', '2024-01-12 15:29:39'),
(356, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:48', '2024-01-12 15:29:48'),
(357, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:29:50', '2024-01-12 15:29:50'),
(358, '103.143.183.253', 'superAdmin.barcode.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:30:05', '2024-01-12 15:30:05'),
(359, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 15:30:19', '2024-01-12 15:30:19'),
(360, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:36:24', '2024-01-12 18:36:24'),
(361, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:36:37', '2024-01-12 18:36:37'),
(362, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:36:49', '2024-01-12 18:36:49'),
(363, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:36:51', '2024-01-12 18:36:51'),
(364, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:11', '2024-01-12 18:37:11'),
(365, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:13', '2024-01-12 18:37:13'),
(366, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:21', '2024-01-12 18:37:21'),
(367, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:23', '2024-01-12 18:37:23'),
(368, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:23', '2024-01-12 18:37:23'),
(369, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:37:58', '2024-01-12 18:37:58'),
(370, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:38:46', '2024-01-12 18:38:46'),
(371, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:38:46', '2024-01-12 18:38:46'),
(372, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:38:48', '2024-01-12 18:38:48'),
(373, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:38:51', '2024-01-12 18:38:51'),
(374, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:38:53', '2024-01-12 18:38:53'),
(375, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:39:19', '2024-01-12 18:39:19'),
(376, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:39:35', '2024-01-12 18:39:35'),
(377, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:40:32', '2024-01-12 18:40:32'),
(378, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:40:32', '2024-01-12 18:40:32'),
(379, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:40:34', '2024-01-12 18:40:34'),
(380, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:47:03', '2024-01-12 18:47:03'),
(381, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:47:25', '2024-01-12 18:47:25'),
(382, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:49:42', '2024-01-12 18:49:42'),
(383, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:49:43', '2024-01-12 18:49:43'),
(384, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:50:31', '2024-01-12 18:50:31'),
(385, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:50:31', '2024-01-12 18:50:31'),
(386, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:50:32', '2024-01-12 18:50:32'),
(387, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:51:03', '2024-01-12 18:51:03'),
(388, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:51:04', '2024-01-12 18:51:04'),
(389, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:51:04', '2024-01-12 18:51:04'),
(390, '103.143.183.253', 'superAdmin.expenses.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:54:41', '2024-01-12 18:54:41'),
(391, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:54:41', '2024-01-12 18:54:41'),
(392, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:54:43', '2024-01-12 18:54:43'),
(393, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:10', '2024-01-12 18:55:10'),
(394, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:10', '2024-01-12 18:55:10'),
(395, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:11', '2024-01-12 18:55:11'),
(396, '103.143.183.253', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:34', '2024-01-12 18:55:34'),
(397, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:34', '2024-01-12 18:55:34'),
(398, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:55:35', '2024-01-12 18:55:35'),
(399, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:56:13', '2024-01-12 18:56:13'),
(400, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:56:15', '2024-01-12 18:56:15'),
(401, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:56:21', '2024-01-12 18:56:21'),
(402, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:56:23', '2024-01-12 18:56:23'),
(403, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:56:47', '2024-01-12 18:56:47'),
(404, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:57:20', '2024-01-12 18:57:20'),
(405, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:07', '2024-01-12 18:58:07'),
(406, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:08', '2024-01-12 18:58:08'),
(407, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:10', '2024-01-12 18:58:10'),
(408, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:14', '2024-01-12 18:58:14'),
(409, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:16', '2024-01-12 18:58:16'),
(410, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:16', '2024-01-12 18:58:16'),
(411, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:33', '2024-01-12 18:58:33'),
(412, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:35', '2024-01-12 18:58:35'),
(413, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:58:38', '2024-01-12 18:58:38'),
(414, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:59:51', '2024-01-12 18:59:51'),
(415, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:59:51', '2024-01-12 18:59:51'),
(416, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:59:53', '2024-01-12 18:59:53'),
(417, '103.143.183.253', 'superAdmin.barcode.print', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode.print', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 18:59:59', '2024-01-12 18:59:59');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(418, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:09', '2024-01-12 19:00:09'),
(419, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:12', '2024-01-12 19:00:12'),
(420, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:14', '2024-01-12 19:00:14'),
(421, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:29', '2024-01-12 19:00:29'),
(422, '103.143.183.253', 'superAdmin.barcode', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/barcode', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:32', '2024-01-12 19:00:32'),
(423, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:36', '2024-01-12 19:00:36'),
(424, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:00:38', '2024-01-12 19:00:38'),
(425, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:01:01', '2024-01-12 19:01:01'),
(426, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:01:47', '2024-01-12 19:01:47'),
(427, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:01:48', '2024-01-12 19:01:48'),
(428, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:02:11', '2024-01-12 19:02:11'),
(429, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:02:12', '2024-01-12 19:02:12'),
(430, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:02:37', '2024-01-12 19:02:37'),
(431, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:02:38', '2024-01-12 19:02:38'),
(432, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:03:07', '2024-01-12 19:03:07'),
(433, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:03:07', '2024-01-12 19:03:07'),
(434, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:03:25', '2024-01-12 19:03:25'),
(435, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:03:26', '2024-01-12 19:03:26'),
(436, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:00', '2024-01-12 19:04:00'),
(437, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:03', '2024-01-12 19:04:03'),
(438, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:03', '2024-01-12 19:04:03'),
(439, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:22', '2024-01-12 19:04:22'),
(440, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:25', '2024-01-12 19:04:25'),
(441, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:04:46', '2024-01-12 19:04:46'),
(442, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:05:50', '2024-01-12 19:05:50'),
(443, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:05:50', '2024-01-12 19:05:50'),
(444, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:05:52', '2024-01-12 19:05:52'),
(445, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:05:56', '2024-01-12 19:05:56'),
(446, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:05:58', '2024-01-12 19:05:58'),
(447, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:09', '2024-01-12 19:06:09'),
(448, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:35', '2024-01-12 19:06:35'),
(449, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:36', '2024-01-12 19:06:36'),
(450, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:37', '2024-01-12 19:06:37'),
(451, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:39', '2024-01-12 19:06:39'),
(452, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:41', '2024-01-12 19:06:41'),
(453, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:06:54', '2024-01-12 19:06:54'),
(454, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:07:40', '2024-01-12 19:07:40'),
(455, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:07:40', '2024-01-12 19:07:40'),
(456, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:07:42', '2024-01-12 19:07:42'),
(457, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:07:44', '2024-01-12 19:07:44'),
(458, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:07:46', '2024-01-12 19:07:46'),
(459, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:00', '2024-01-12 19:08:00'),
(460, '103.143.183.253', 'superAdmin.category.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:26', '2024-01-12 19:08:26'),
(461, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:27', '2024-01-12 19:08:27'),
(462, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:30', '2024-01-12 19:08:30'),
(463, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:32', '2024-01-12 19:08:32'),
(464, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:08:41', '2024-01-12 19:08:41'),
(465, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:20', '2024-01-12 19:09:20'),
(466, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:21', '2024-01-12 19:09:21'),
(467, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:23', '2024-01-12 19:09:23'),
(468, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:27', '2024-01-12 19:09:27'),
(469, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:29', '2024-01-12 19:09:29'),
(470, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:36', '2024-01-12 19:09:36'),
(471, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:09:40', '2024-01-12 19:09:40'),
(472, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:04', '2024-01-12 19:10:04'),
(473, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:04', '2024-01-12 19:10:04'),
(474, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:07', '2024-01-12 19:10:07'),
(475, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:10', '2024-01-12 19:10:10'),
(476, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:12', '2024-01-12 19:10:12'),
(477, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:16', '2024-01-12 19:10:16'),
(478, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:18', '2024-01-12 19:10:18'),
(479, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:23', '2024-01-12 19:10:23'),
(480, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:29', '2024-01-12 19:10:29'),
(481, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:36', '2024-01-12 19:10:36'),
(482, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:39', '2024-01-12 19:10:39'),
(483, '103.143.183.253', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:10:46', '2024-01-12 19:10:46'),
(484, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:04', '2024-01-12 19:11:04'),
(485, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:31', '2024-01-12 19:11:31'),
(486, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:31', '2024-01-12 19:11:31'),
(487, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:33', '2024-01-12 19:11:33'),
(488, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:34', '2024-01-12 19:11:34'),
(489, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:36', '2024-01-12 19:11:36'),
(490, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:11:42', '2024-01-12 19:11:42'),
(491, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:08', '2024-01-12 19:12:08'),
(492, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:09', '2024-01-12 19:12:09'),
(493, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:10', '2024-01-12 19:12:10'),
(494, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:14', '2024-01-12 19:12:14'),
(495, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:16', '2024-01-12 19:12:16'),
(496, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:12:45', '2024-01-12 19:12:45'),
(497, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:20', '2024-01-12 19:13:20'),
(498, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:20', '2024-01-12 19:13:20'),
(499, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:23', '2024-01-12 19:13:23'),
(500, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:28', '2024-01-12 19:13:28'),
(501, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:29', '2024-01-12 19:13:29'),
(502, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:13:31', '2024-01-12 19:13:31'),
(503, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:07', '2024-01-12 19:14:07'),
(504, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:26', '2024-01-12 19:14:26'),
(505, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:28', '2024-01-12 19:14:28'),
(506, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:45', '2024-01-12 19:14:45'),
(507, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:56', '2024-01-12 19:14:56'),
(508, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:14:58', '2024-01-12 19:14:58'),
(509, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:09', '2024-01-12 19:15:09'),
(510, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:10', '2024-01-12 19:15:10'),
(511, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:19', '2024-01-12 19:15:19'),
(512, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:49', '2024-01-12 19:15:49'),
(513, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:49', '2024-01-12 19:15:49'),
(514, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:15:51', '2024-01-12 19:15:51'),
(515, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:02', '2024-01-12 19:16:02'),
(516, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:09', '2024-01-12 19:16:09'),
(517, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:37', '2024-01-12 19:16:37'),
(518, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:38', '2024-01-12 19:16:38'),
(519, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:39', '2024-01-12 19:16:39'),
(520, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:43', '2024-01-12 19:16:43'),
(521, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:45', '2024-01-12 19:16:45'),
(522, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:16:57', '2024-01-12 19:16:57'),
(523, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:18', '2024-01-12 19:17:18'),
(524, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:42', '2024-01-12 19:17:42'),
(525, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:43', '2024-01-12 19:17:43'),
(526, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:44', '2024-01-12 19:17:44'),
(527, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:52', '2024-01-12 19:17:52'),
(528, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:17:54', '2024-01-12 19:17:54'),
(529, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:03', '2024-01-12 19:18:03'),
(530, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:28', '2024-01-12 19:18:28'),
(531, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:38', '2024-01-12 19:18:38'),
(532, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:38', '2024-01-12 19:18:38'),
(533, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:40', '2024-01-12 19:18:40'),
(534, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:42', '2024-01-12 19:18:42'),
(535, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:42', '2024-01-12 19:18:42'),
(536, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:18:43', '2024-01-12 19:18:43'),
(537, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:01', '2024-01-12 19:19:01'),
(538, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:07', '2024-01-12 19:19:07'),
(539, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:07', '2024-01-12 19:19:07'),
(540, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:09', '2024-01-12 19:19:09'),
(541, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:21', '2024-01-12 19:19:21'),
(542, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:34', '2024-01-12 19:19:34'),
(543, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:35', '2024-01-12 19:19:35'),
(544, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:36', '2024-01-12 19:19:36'),
(545, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:19:40', '2024-01-12 19:19:40'),
(546, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:01', '2024-01-12 19:20:01'),
(547, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:12', '2024-01-12 19:20:12'),
(548, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:13', '2024-01-12 19:20:13'),
(549, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:14', '2024-01-12 19:20:14'),
(550, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:17', '2024-01-12 19:20:17'),
(551, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:35', '2024-01-12 19:20:35'),
(552, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:50', '2024-01-12 19:20:50'),
(553, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:50', '2024-01-12 19:20:50'),
(554, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:20:52', '2024-01-12 19:20:52'),
(555, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:08', '2024-01-12 19:21:08'),
(556, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:15', '2024-01-12 19:21:15'),
(557, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:15', '2024-01-12 19:21:15'),
(558, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:17', '2024-01-12 19:21:17'),
(559, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:18', '2024-01-12 19:21:18'),
(560, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:20', '2024-01-12 19:21:20'),
(561, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:23', '2024-01-12 19:21:23'),
(562, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:35', '2024-01-12 19:21:35'),
(563, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:43', '2024-01-12 19:21:43'),
(564, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:43', '2024-01-12 19:21:43'),
(565, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:45', '2024-01-12 19:21:45'),
(566, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:21:59', '2024-01-12 19:21:59'),
(567, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:06', '2024-01-12 19:22:06'),
(568, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:06', '2024-01-12 19:22:06'),
(569, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:08', '2024-01-12 19:22:08'),
(570, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:09', '2024-01-12 19:22:09'),
(571, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:20', '2024-01-12 19:22:20'),
(572, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:29', '2024-01-12 19:22:29'),
(573, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:30', '2024-01-12 19:22:30'),
(574, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:31', '2024-01-12 19:22:31'),
(575, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:32', '2024-01-12 19:22:32'),
(576, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:22:55', '2024-01-12 19:22:55'),
(577, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:07', '2024-01-12 19:23:07'),
(578, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:08', '2024-01-12 19:23:08'),
(579, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:09', '2024-01-12 19:23:09'),
(580, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:24', '2024-01-12 19:23:24'),
(581, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:31', '2024-01-12 19:23:31'),
(582, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:31', '2024-01-12 19:23:31'),
(583, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:33', '2024-01-12 19:23:33'),
(584, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:36', '2024-01-12 19:23:36'),
(585, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:23:54', '2024-01-12 19:23:54'),
(586, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:01', '2024-01-12 19:24:01'),
(587, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:01', '2024-01-12 19:24:01'),
(588, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:04', '2024-01-12 19:24:04'),
(589, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:06', '2024-01-12 19:24:06'),
(590, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:08', '2024-01-12 19:24:08'),
(591, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:19', '2024-01-12 19:24:19'),
(592, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:28', '2024-01-12 19:24:28'),
(593, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:32', '2024-01-12 19:24:32'),
(594, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:39', '2024-01-12 19:24:39'),
(595, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:24:46', '2024-01-12 19:24:46'),
(596, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/15', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:28:43', '2024-01-12 19:28:43'),
(597, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.15', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:28:55', '2024-01-12 19:28:55'),
(598, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:28:55', '2024-01-12 19:28:55'),
(599, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:28:58', '2024-01-12 19:28:58'),
(600, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:29:08', '2024-01-12 19:29:08'),
(601, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:29:11', '2024-01-12 19:29:11'),
(602, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:29:16', '2024-01-12 19:29:16'),
(603, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:29:20', '2024-01-12 19:29:20'),
(604, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:29:22', '2024-01-12 19:29:22'),
(605, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:30:07', '2024-01-12 19:30:07'),
(606, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:30:25', '2024-01-12 19:30:25'),
(607, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:30:48', '2024-01-12 19:30:48'),
(608, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:30:54', '2024-01-12 19:30:54'),
(609, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:31:12', '2024-01-12 19:31:12'),
(610, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:31:43', '2024-01-12 19:31:43'),
(611, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:31:44', '2024-01-12 19:31:44'),
(612, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:31:49', '2024-01-12 19:31:49'),
(613, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:17', '2024-01-12 19:32:17'),
(614, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:19', '2024-01-12 19:32:19'),
(615, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:19', '2024-01-12 19:32:19'),
(616, '103.143.183.253', 'superAdmin.supplier.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:36', '2024-01-12 19:32:36'),
(617, '103.143.183.253', 'superAdmin.supplier', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/supplier', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:36', '2024-01-12 19:32:36'),
(618, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:39', '2024-01-12 19:32:39'),
(619, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:42', '2024-01-12 19:32:42'),
(620, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:42', '2024-01-12 19:32:42'),
(621, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:43', '2024-01-12 19:32:43'),
(622, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:44', '2024-01-12 19:32:44'),
(623, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:32:51', '2024-01-12 19:32:51'),
(624, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:00', '2024-01-12 19:33:00'),
(625, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:02', '2024-01-12 19:33:02');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(626, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:06', '2024-01-12 19:33:06'),
(627, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:08', '2024-01-12 19:33:08'),
(628, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:17', '2024-01-12 19:33:17'),
(629, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:39', '2024-01-12 19:33:39'),
(630, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:41', '2024-01-12 19:33:41'),
(631, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:44', '2024-01-12 19:33:44'),
(632, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:46', '2024-01-12 19:33:46'),
(633, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:33:53', '2024-01-12 19:33:53'),
(634, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:34:35', '2024-01-12 19:34:35'),
(635, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:09', '2024-01-12 19:35:09'),
(636, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:12', '2024-01-12 19:35:12'),
(637, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:18', '2024-01-12 19:35:18'),
(638, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:18', '2024-01-12 19:35:18'),
(639, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:21', '2024-01-12 19:35:21'),
(640, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:22', '2024-01-12 19:35:22'),
(641, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:36', '2024-01-12 19:35:36'),
(642, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:35:40', '2024-01-12 19:35:40'),
(643, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:04', '2024-01-12 19:36:04'),
(644, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:30', '2024-01-12 19:36:30'),
(645, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:32', '2024-01-12 19:36:32'),
(646, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:38', '2024-01-12 19:36:38'),
(647, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:39', '2024-01-12 19:36:39'),
(648, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:41', '2024-01-12 19:36:41'),
(649, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:43', '2024-01-12 19:36:43'),
(650, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:43', '2024-01-12 19:36:43'),
(651, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:44', '2024-01-12 19:36:44'),
(652, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:44', '2024-01-12 19:36:44'),
(653, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:44', '2024-01-12 19:36:44'),
(654, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:45', '2024-01-12 19:36:45'),
(655, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:48', '2024-01-12 19:36:48'),
(656, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/17', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:56', '2024-01-12 19:36:56'),
(657, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:59', '2024-01-12 19:36:59'),
(658, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:36:59', '2024-01-12 19:36:59'),
(659, '103.143.183.253', 'superAdmin.products.purchaseUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.purchaseUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:12', '2024-01-12 19:37:12'),
(660, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:16', '2024-01-12 19:37:16'),
(661, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:17', '2024-01-12 19:37:17'),
(662, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:19', '2024-01-12 19:37:19'),
(663, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:24', '2024-01-12 19:37:24'),
(664, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:24', '2024-01-12 19:37:24'),
(665, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:25', '2024-01-12 19:37:25'),
(666, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:37', '2024-01-12 19:37:37'),
(667, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:39', '2024-01-12 19:37:39'),
(668, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:43', '2024-01-12 19:37:43'),
(669, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:44', '2024-01-12 19:37:44'),
(670, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:45', '2024-01-12 19:37:45'),
(671, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:46', '2024-01-12 19:37:46'),
(672, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:37:53', '2024-01-12 19:37:53'),
(673, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:38:00', '2024-01-12 19:38:00'),
(674, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:38:25', '2024-01-12 19:38:25'),
(675, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:38:40', '2024-01-12 19:38:40'),
(676, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:38:48', '2024-01-12 19:38:48'),
(677, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:38:53', '2024-01-12 19:38:53'),
(678, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:39:12', '2024-01-12 19:39:12'),
(679, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:39:45', '2024-01-12 19:39:45'),
(680, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:39:45', '2024-01-12 19:39:45'),
(681, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:39:47', '2024-01-12 19:39:47'),
(682, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:39:54', '2024-01-12 19:39:54'),
(683, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:01', '2024-01-12 19:40:01'),
(684, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:03', '2024-01-12 19:40:03'),
(685, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:10', '2024-01-12 19:40:10'),
(686, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:12', '2024-01-12 19:40:12'),
(687, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:12', '2024-01-12 19:40:12'),
(688, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:17', '2024-01-12 19:40:17'),
(689, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:18', '2024-01-12 19:40:18'),
(690, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:18', '2024-01-12 19:40:18'),
(691, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:18', '2024-01-12 19:40:18'),
(692, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:25', '2024-01-12 19:40:25'),
(693, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:38', '2024-01-12 19:40:38'),
(694, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:41', '2024-01-12 19:40:41'),
(695, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:48', '2024-01-12 19:40:48'),
(696, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:51', '2024-01-12 19:40:51'),
(697, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:40:54', '2024-01-12 19:40:54'),
(698, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:10', '2024-01-12 19:41:10'),
(699, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:18', '2024-01-12 19:41:18'),
(700, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:18', '2024-01-12 19:41:18'),
(701, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:20', '2024-01-12 19:41:20'),
(702, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:25', '2024-01-12 19:41:25'),
(703, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:37', '2024-01-12 19:41:37'),
(704, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:44', '2024-01-12 19:41:44'),
(705, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:44', '2024-01-12 19:41:44'),
(706, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:46', '2024-01-12 19:41:46'),
(707, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:48', '2024-01-12 19:41:48'),
(708, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:41:57', '2024-01-12 19:41:57'),
(709, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:18', '2024-01-12 19:42:18'),
(710, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:29', '2024-01-12 19:42:29'),
(711, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:52', '2024-01-12 19:42:52'),
(712, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:52', '2024-01-12 19:42:52'),
(713, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:58', '2024-01-12 19:42:58'),
(714, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:58', '2024-01-12 19:42:58'),
(715, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:58', '2024-01-12 19:42:58'),
(716, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:59', '2024-01-12 19:42:59'),
(717, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:42:59', '2024-01-12 19:42:59'),
(718, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:06', '2024-01-12 19:43:06'),
(719, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:08', '2024-01-12 19:43:08'),
(720, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:15', '2024-01-12 19:43:15'),
(721, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:19', '2024-01-12 19:43:19'),
(722, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:31', '2024-01-12 19:43:31'),
(723, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:50', '2024-01-12 19:43:50'),
(724, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:57', '2024-01-12 19:43:57'),
(725, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:43:59', '2024-01-12 19:43:59'),
(726, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:08', '2024-01-12 19:44:08'),
(727, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:43', '2024-01-12 19:44:43'),
(728, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:43', '2024-01-12 19:44:43'),
(729, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:45', '2024-01-12 19:44:45'),
(730, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/33', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:51', '2024-01-12 19:44:51'),
(731, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:53', '2024-01-12 19:44:53'),
(732, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:44:53', '2024-01-12 19:44:53'),
(733, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:04', '2024-01-12 19:45:04'),
(734, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:05', '2024-01-12 19:45:05'),
(735, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:05', '2024-01-12 19:45:05'),
(736, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:09', '2024-01-12 19:45:09'),
(737, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:13', '2024-01-12 19:45:13'),
(738, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:15', '2024-01-12 19:45:15'),
(739, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:45:27', '2024-01-12 19:45:27'),
(740, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:00', '2024-01-12 19:46:00'),
(741, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:00', '2024-01-12 19:46:00'),
(742, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:03', '2024-01-12 19:46:03'),
(743, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/33', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:11', '2024-01-12 19:46:11'),
(744, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:14', '2024-01-12 19:46:14'),
(745, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:14', '2024-01-12 19:46:14'),
(746, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:26', '2024-01-12 19:46:26'),
(747, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:26', '2024-01-12 19:46:26'),
(748, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:26', '2024-01-12 19:46:26'),
(749, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:28', '2024-01-12 19:46:28'),
(750, '103.143.183.253', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:31', '2024-01-12 19:46:31'),
(751, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:33', '2024-01-12 19:46:33'),
(752, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:46:39', '2024-01-12 19:46:39'),
(753, '103.143.183.253', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:21', '2024-01-12 19:47:21'),
(754, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:22', '2024-01-12 19:47:22'),
(755, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:24', '2024-01-12 19:47:24'),
(756, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:30', '2024-01-12 19:47:30'),
(757, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:31', '2024-01-12 19:47:31'),
(758, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:33', '2024-01-12 19:47:33'),
(759, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:47:50', '2024-01-12 19:47:50'),
(760, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:01', '2024-01-12 19:48:01'),
(761, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:02', '2024-01-12 19:48:02'),
(762, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:04', '2024-01-12 19:48:04'),
(763, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:15', '2024-01-12 19:48:15'),
(764, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:23', '2024-01-12 19:48:23'),
(765, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:23', '2024-01-12 19:48:23'),
(766, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:25', '2024-01-12 19:48:25'),
(767, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:25', '2024-01-12 19:48:25'),
(768, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:37', '2024-01-12 19:48:37'),
(769, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:47', '2024-01-12 19:48:47'),
(770, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:47', '2024-01-12 19:48:47'),
(771, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:49', '2024-01-12 19:48:49'),
(772, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:48:50', '2024-01-12 19:48:50'),
(773, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:06', '2024-01-12 19:49:06'),
(774, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:23', '2024-01-12 19:49:23'),
(775, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:23', '2024-01-12 19:49:23'),
(776, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:25', '2024-01-12 19:49:25'),
(777, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:33', '2024-01-12 19:49:33'),
(778, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:47', '2024-01-12 19:49:47'),
(779, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:48', '2024-01-12 19:49:48'),
(780, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:48', '2024-01-12 19:49:48'),
(781, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/21', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:55', '2024-01-12 19:49:55'),
(782, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:58', '2024-01-12 19:49:58'),
(783, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:49:58', '2024-01-12 19:49:58'),
(784, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:18', '2024-01-12 19:50:18'),
(785, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:38', '2024-01-12 19:50:38'),
(786, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:39', '2024-01-12 19:50:39'),
(787, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:41', '2024-01-12 19:50:41'),
(788, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:47', '2024-01-12 19:50:47'),
(789, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:50:53', '2024-01-12 19:50:53'),
(790, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:02', '2024-01-12 19:51:02'),
(791, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:09', '2024-01-12 19:51:09'),
(792, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:20', '2024-01-12 19:51:20'),
(793, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:28', '2024-01-12 19:51:28'),
(794, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:33', '2024-01-12 19:51:33'),
(795, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:33', '2024-01-12 19:51:33'),
(796, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:34', '2024-01-12 19:51:34'),
(797, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:34', '2024-01-12 19:51:34'),
(798, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:35', '2024-01-12 19:51:35'),
(799, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:37', '2024-01-12 19:51:37'),
(800, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:42', '2024-01-12 19:51:42'),
(801, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:44', '2024-01-12 19:51:44'),
(802, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:45', '2024-01-12 19:51:45'),
(803, '103.143.183.253', 'superAdmin.products.purchaseUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.purchaseUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:51:59', '2024-01-12 19:51:59'),
(804, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:03', '2024-01-12 19:52:03'),
(805, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:04', '2024-01-12 19:52:04'),
(806, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:06', '2024-01-12 19:52:06'),
(807, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:12', '2024-01-12 19:52:12'),
(808, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:26', '2024-01-12 19:52:26'),
(809, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:36', '2024-01-12 19:52:36'),
(810, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:37', '2024-01-12 19:52:37'),
(811, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:39', '2024-01-12 19:52:39'),
(812, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:39', '2024-01-12 19:52:39'),
(813, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:42', '2024-01-12 19:52:42'),
(814, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:52:55', '2024-01-12 19:52:55'),
(815, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:03', '2024-01-12 19:53:03'),
(816, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:04', '2024-01-12 19:53:04'),
(817, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:06', '2024-01-12 19:53:06'),
(818, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:17', '2024-01-12 19:53:17'),
(819, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:23', '2024-01-12 19:53:23'),
(820, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:24', '2024-01-12 19:53:24'),
(821, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:26', '2024-01-12 19:53:26'),
(822, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:26', '2024-01-12 19:53:26'),
(823, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:40', '2024-01-12 19:53:40'),
(824, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:50', '2024-01-12 19:53:50'),
(825, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:51', '2024-01-12 19:53:51'),
(826, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:52', '2024-01-12 19:53:52'),
(827, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:53:53', '2024-01-12 19:53:53'),
(828, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:06', '2024-01-12 19:54:06'),
(829, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:15', '2024-01-12 19:54:15'),
(830, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:16', '2024-01-12 19:54:16'),
(831, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:18', '2024-01-12 19:54:18'),
(832, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:22', '2024-01-12 19:54:22'),
(833, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:54:43', '2024-01-12 19:54:43');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(834, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:04', '2024-01-12 19:55:04'),
(835, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:05', '2024-01-12 19:55:05'),
(836, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:08', '2024-01-12 19:55:08'),
(837, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:19', '2024-01-12 19:55:19'),
(838, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:21', '2024-01-12 19:55:21'),
(839, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:31', '2024-01-12 19:55:31'),
(840, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:40', '2024-01-12 19:55:40'),
(841, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:41', '2024-01-12 19:55:41'),
(842, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:43', '2024-01-12 19:55:43'),
(843, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:55:52', '2024-01-12 19:55:52'),
(844, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:02', '2024-01-12 19:56:02'),
(845, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:02', '2024-01-12 19:56:02'),
(846, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:05', '2024-01-12 19:56:05'),
(847, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:13', '2024-01-12 19:56:13'),
(848, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:30', '2024-01-12 19:56:30'),
(849, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:30', '2024-01-12 19:56:30'),
(850, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:30', '2024-01-12 19:56:30'),
(851, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:37', '2024-01-12 19:56:37'),
(852, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:40', '2024-01-12 19:56:40'),
(853, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:40', '2024-01-12 19:56:40'),
(854, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:44', '2024-01-12 19:56:44'),
(855, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:45', '2024-01-12 19:56:45'),
(856, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:56:45', '2024-01-12 19:56:45'),
(857, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:01', '2024-01-12 19:57:01'),
(858, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:02', '2024-01-12 19:57:02'),
(859, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/31', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:06', '2024-01-12 19:57:06'),
(860, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:08', '2024-01-12 19:57:08'),
(861, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:08', '2024-01-12 19:57:08'),
(862, '103.143.183.253', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:17', '2024-01-12 19:57:17'),
(863, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:18', '2024-01-12 19:57:18'),
(864, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:19', '2024-01-12 19:57:19'),
(865, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:20', '2024-01-12 19:57:20'),
(866, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:21', '2024-01-12 19:57:21'),
(867, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:34', '2024-01-12 19:57:34'),
(868, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:55', '2024-01-12 19:57:55'),
(869, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:55', '2024-01-12 19:57:55'),
(870, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:57:57', '2024-01-12 19:57:57'),
(871, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:01', '2024-01-12 19:58:01'),
(872, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:03', '2024-01-12 19:58:03'),
(873, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:07', '2024-01-12 19:58:07'),
(874, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/7', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:14', '2024-01-12 19:58:14'),
(875, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:25', '2024-01-12 19:58:25'),
(876, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:25', '2024-01-12 19:58:25'),
(877, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:58:40', '2024-01-12 19:58:40'),
(878, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:59:06', '2024-01-12 19:59:06'),
(879, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:59:23', '2024-01-12 19:59:23'),
(880, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:59:25', '2024-01-12 19:59:25'),
(881, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 19:59:25', '2024-01-12 19:59:25'),
(882, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/7', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:00:00', '2024-01-12 20:00:00'),
(883, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:00:07', '2024-01-12 20:00:07'),
(884, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:00:29', '2024-01-12 20:00:29'),
(885, '103.143.183.253', 'superAdmin.coustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coustomergroup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:00:47', '2024-01-12 20:00:47'),
(886, '103.143.183.253', 'superAdmin.coustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coustomergroup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:31', '2024-01-12 20:02:31'),
(887, '103.143.183.253', 'superAdmin.coustomergroup.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coustomergroup.edit/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:39', '2024-01-12 20:02:39'),
(888, '103.143.183.253', 'superAdmin.coustomergroup.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coustomergroup.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:45', '2024-01-12 20:02:45'),
(889, '103.143.183.253', 'superAdmin.coustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coustomergroup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:45', '2024-01-12 20:02:45'),
(890, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:55', '2024-01-12 20:02:55'),
(891, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:02:58', '2024-01-12 20:02:58'),
(892, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:02', '2024-01-12 20:03:02'),
(893, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/7', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:08', '2024-01-12 20:03:08'),
(894, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:19', '2024-01-12 20:03:19'),
(895, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:19', '2024-01-12 20:03:19'),
(896, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:30', '2024-01-12 20:03:30'),
(897, '103.143.183.253', 'superAdmin.biller', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:44', '2024-01-12 20:03:44'),
(898, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:46', '2024-01-12 20:03:46'),
(899, '103.143.183.253', 'superAdmin.biller', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:03:47', '2024-01-12 20:03:47'),
(900, '103.143.183.253', 'superAdmin.biller.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:04:06', '2024-01-12 20:04:06'),
(901, '103.143.183.253', 'superAdmin.biller', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:04:06', '2024-01-12 20:04:06'),
(902, '103.143.183.253', 'superAdmin.biller.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:04:23', '2024-01-12 20:04:23'),
(903, '103.143.183.253', 'superAdmin.biller', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/biller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:04:24', '2024-01-12 20:04:24'),
(904, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:04:34', '2024-01-12 20:04:34'),
(905, '103.143.183.253', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:07:26', '2024-01-12 20:07:26'),
(906, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:08:22', '2024-01-12 20:08:22'),
(907, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:08:23', '2024-01-12 20:08:23'),
(908, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:08:38', '2024-01-12 20:08:38'),
(909, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:08:50', '2024-01-12 20:08:50'),
(910, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:08:53', '2024-01-12 20:08:53'),
(911, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:00', '2024-01-12 20:09:00'),
(912, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:02', '2024-01-12 20:09:02'),
(913, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:08', '2024-01-12 20:09:08'),
(914, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:10', '2024-01-12 20:09:10'),
(915, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:12', '2024-01-12 20:09:12'),
(916, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:37', '2024-01-12 20:09:37'),
(917, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:59', '2024-01-12 20:09:59'),
(918, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:09:59', '2024-01-12 20:09:59'),
(919, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:01', '2024-01-12 20:10:01'),
(920, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:10', '2024-01-12 20:10:10'),
(921, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:12', '2024-01-12 20:10:12'),
(922, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:17', '2024-01-12 20:10:17'),
(923, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:22', '2024-01-12 20:10:22'),
(924, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:10:46', '2024-01-12 20:10:46'),
(925, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:05', '2024-01-12 20:11:05'),
(926, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:28', '2024-01-12 20:11:28'),
(927, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:49', '2024-01-12 20:11:49'),
(928, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:51', '2024-01-12 20:11:51'),
(929, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:52', '2024-01-12 20:11:52'),
(930, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:52', '2024-01-12 20:11:52'),
(931, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:54', '2024-01-12 20:11:54'),
(932, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:54', '2024-01-12 20:11:54'),
(933, '103.143.183.253', 'superAdmin.products.purchaseUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.purchaseUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:56', '2024-01-12 20:11:56'),
(934, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:11:59', '2024-01-12 20:11:59'),
(935, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:00', '2024-01-12 20:12:00'),
(936, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:01', '2024-01-12 20:12:01'),
(937, '103.143.183.253', 'superAdmin.products.purchaseUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.purchaseUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:03', '2024-01-12 20:12:03'),
(938, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:05', '2024-01-12 20:12:05'),
(939, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:06', '2024-01-12 20:12:06'),
(940, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:08', '2024-01-12 20:12:08'),
(941, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:15', '2024-01-12 20:12:15'),
(942, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:32', '2024-01-12 20:12:32'),
(943, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:34', '2024-01-12 20:12:34'),
(944, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:38', '2024-01-12 20:12:38'),
(945, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:39', '2024-01-12 20:12:39'),
(946, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:40', '2024-01-12 20:12:40'),
(947, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:41', '2024-01-12 20:12:41'),
(948, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:42', '2024-01-12 20:12:42'),
(949, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:43', '2024-01-12 20:12:43'),
(950, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:47', '2024-01-12 20:12:47'),
(951, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:12:59', '2024-01-12 20:12:59'),
(952, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:28', '2024-01-12 20:13:28'),
(953, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:28', '2024-01-12 20:13:28'),
(954, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:30', '2024-01-12 20:13:30'),
(955, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:31', '2024-01-12 20:13:31'),
(956, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:45', '2024-01-12 20:13:45'),
(957, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:53', '2024-01-12 20:13:53'),
(958, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:54', '2024-01-12 20:13:54'),
(959, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:55', '2024-01-12 20:13:55'),
(960, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:57', '2024-01-12 20:13:57'),
(961, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:13:58', '2024-01-12 20:13:58'),
(962, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:05', '2024-01-12 20:14:05'),
(963, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:25', '2024-01-12 20:14:25'),
(964, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:36', '2024-01-12 20:14:36'),
(965, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:38', '2024-01-12 20:14:38'),
(966, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:43', '2024-01-12 20:14:43'),
(967, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:46', '2024-01-12 20:14:46'),
(968, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:49', '2024-01-12 20:14:49'),
(969, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:14:53', '2024-01-12 20:14:53'),
(970, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:00', '2024-01-12 20:15:00'),
(971, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:16', '2024-01-12 20:15:16'),
(972, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:27', '2024-01-12 20:15:27'),
(973, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:27', '2024-01-12 20:15:27'),
(974, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:29', '2024-01-12 20:15:29'),
(975, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:45', '2024-01-12 20:15:45'),
(976, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:47', '2024-01-12 20:15:47'),
(977, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:53', '2024-01-12 20:15:53'),
(978, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:15:58', '2024-01-12 20:15:58'),
(979, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:02', '2024-01-12 20:16:02'),
(980, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/33', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:10', '2024-01-12 20:16:10'),
(981, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:13', '2024-01-12 20:16:13'),
(982, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:13', '2024-01-12 20:16:13'),
(983, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:21', '2024-01-12 20:16:21'),
(984, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:21', '2024-01-12 20:16:21'),
(985, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:23', '2024-01-12 20:16:23'),
(986, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:28', '2024-01-12 20:16:28'),
(987, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:35', '2024-01-12 20:16:35'),
(988, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:39', '2024-01-12 20:16:39'),
(989, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:44', '2024-01-12 20:16:44'),
(990, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:48', '2024-01-12 20:16:48'),
(991, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:49', '2024-01-12 20:16:49'),
(992, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:51', '2024-01-12 20:16:51'),
(993, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:52', '2024-01-12 20:16:52'),
(994, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:52', '2024-01-12 20:16:52'),
(995, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:53', '2024-01-12 20:16:53'),
(996, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:54', '2024-01-12 20:16:54'),
(997, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:55', '2024-01-12 20:16:55'),
(998, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:57', '2024-01-12 20:16:57'),
(999, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:16:58', '2024-01-12 20:16:58'),
(1000, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:02', '2024-01-12 20:17:02'),
(1001, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:19', '2024-01-12 20:17:19'),
(1002, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:24', '2024-01-12 20:17:24'),
(1003, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:26', '2024-01-12 20:17:26'),
(1004, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:40', '2024-01-12 20:17:40'),
(1005, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:41', '2024-01-12 20:17:41'),
(1006, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:42', '2024-01-12 20:17:42'),
(1007, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:45', '2024-01-12 20:17:45'),
(1008, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:46', '2024-01-12 20:17:46'),
(1009, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:48', '2024-01-12 20:17:48'),
(1010, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:50', '2024-01-12 20:17:50'),
(1011, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:52', '2024-01-12 20:17:52'),
(1012, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:17:56', '2024-01-12 20:17:56'),
(1013, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:02', '2024-01-12 20:18:02'),
(1014, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:06', '2024-01-12 20:18:06'),
(1015, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:09', '2024-01-12 20:18:09'),
(1016, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:15', '2024-01-12 20:18:15'),
(1017, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:19', '2024-01-12 20:18:19'),
(1018, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:33', '2024-01-12 20:18:33'),
(1019, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:38', '2024-01-12 20:18:38'),
(1020, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:42', '2024-01-12 20:18:42'),
(1021, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:45', '2024-01-12 20:18:45'),
(1022, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:18:48', '2024-01-12 20:18:48'),
(1023, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:00', '2024-01-12 20:19:00'),
(1024, '103.143.183.253', 'superAdmin.purchase.deleted', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.deleted/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:23', '2024-01-12 20:19:23'),
(1025, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:23', '2024-01-12 20:19:23'),
(1026, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:25', '2024-01-12 20:19:25'),
(1027, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:41', '2024-01-12 20:19:41'),
(1028, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:51', '2024-01-12 20:19:51'),
(1029, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:51', '2024-01-12 20:19:51'),
(1030, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:53', '2024-01-12 20:19:53'),
(1031, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:55', '2024-01-12 20:19:55'),
(1032, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:19:57', '2024-01-12 20:19:57'),
(1033, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:02', '2024-01-12 20:20:02'),
(1034, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:12', '2024-01-12 20:20:12'),
(1035, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:18', '2024-01-12 20:20:18'),
(1036, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:28', '2024-01-12 20:20:28'),
(1037, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:30', '2024-01-12 20:20:30'),
(1038, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:36', '2024-01-12 20:20:36'),
(1039, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/33', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:45', '2024-01-12 20:20:45'),
(1040, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:47', '2024-01-12 20:20:47'),
(1041, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:20:47', '2024-01-12 20:20:47'),
(1042, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:08', '2024-01-12 20:21:08');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1043, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:09', '2024-01-12 20:21:09'),
(1044, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:11', '2024-01-12 20:21:11'),
(1045, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:34', '2024-01-12 20:21:34'),
(1046, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:36', '2024-01-12 20:21:36'),
(1047, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:37', '2024-01-12 20:21:37'),
(1048, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:37', '2024-01-12 20:21:37'),
(1049, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:37', '2024-01-12 20:21:37'),
(1050, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:21:41', '2024-01-12 20:21:41'),
(1051, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:03', '2024-01-12 20:22:03'),
(1052, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:05', '2024-01-12 20:22:05'),
(1053, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:09', '2024-01-12 20:22:09'),
(1054, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:10', '2024-01-12 20:22:10'),
(1055, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:14', '2024-01-12 20:22:14'),
(1056, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:17', '2024-01-12 20:22:17'),
(1057, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:20', '2024-01-12 20:22:20'),
(1058, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:25', '2024-01-12 20:22:25'),
(1059, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:28', '2024-01-12 20:22:28'),
(1060, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:34', '2024-01-12 20:22:34'),
(1061, '103.143.183.253', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:45', '2024-01-12 20:22:45'),
(1062, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:46', '2024-01-12 20:22:46'),
(1063, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:48', '2024-01-12 20:22:48'),
(1064, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:50', '2024-01-12 20:22:50'),
(1065, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:52', '2024-01-12 20:22:52'),
(1066, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:52', '2024-01-12 20:22:52'),
(1067, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:53', '2024-01-12 20:22:53'),
(1068, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:22:55', '2024-01-12 20:22:55'),
(1069, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:02', '2024-01-12 20:23:02'),
(1070, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:17', '2024-01-12 20:23:17'),
(1071, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:19', '2024-01-12 20:23:19'),
(1072, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:43', '2024-01-12 20:23:43'),
(1073, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:45', '2024-01-12 20:23:45'),
(1074, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:47', '2024-01-12 20:23:47'),
(1075, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/7', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:23:54', '2024-01-12 20:23:54'),
(1076, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:24:04', '2024-01-12 20:24:04'),
(1077, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:24:04', '2024-01-12 20:24:04'),
(1078, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:24:10', '2024-01-12 20:24:10'),
(1079, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:24:27', '2024-01-12 20:24:27'),
(1080, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:24:28', '2024-01-12 20:24:28'),
(1081, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:26:17', '2024-01-12 20:26:17'),
(1082, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-12 20:26:19', '2024-01-12 20:26:19'),
(1083, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:52:56', '2024-01-13 15:52:56'),
(1084, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:52:57', '2024-01-13 15:52:57'),
(1085, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:53:03', '2024-01-13 15:53:03'),
(1086, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:53:35', '2024-01-13 15:53:35'),
(1087, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:53:37', '2024-01-13 15:53:37'),
(1088, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:53:37', '2024-01-13 15:53:37'),
(1089, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:08', '2024-01-13 15:54:08'),
(1090, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:09', '2024-01-13 15:54:09'),
(1091, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:13', '2024-01-13 15:54:13'),
(1092, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:14', '2024-01-13 15:54:14'),
(1093, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:16', '2024-01-13 15:54:16'),
(1094, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:28', '2024-01-13 15:54:28'),
(1095, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:30', '2024-01-13 15:54:30'),
(1096, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:30', '2024-01-13 15:54:30'),
(1097, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:39', '2024-01-13 15:54:39'),
(1098, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:46', '2024-01-13 15:54:46'),
(1099, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:51', '2024-01-13 15:54:51'),
(1100, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:51', '2024-01-13 15:54:51'),
(1101, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:54:54', '2024-01-13 15:54:54'),
(1102, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:14', '2024-01-13 15:55:14'),
(1103, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:16', '2024-01-13 15:55:16'),
(1104, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:16', '2024-01-13 15:55:16'),
(1105, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:38', '2024-01-13 15:55:38'),
(1106, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:44', '2024-01-13 15:55:44'),
(1107, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:45', '2024-01-13 15:55:45'),
(1108, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:47', '2024-01-13 15:55:47'),
(1109, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:56', '2024-01-13 15:55:56'),
(1110, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:58', '2024-01-13 15:55:58'),
(1111, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:55:58', '2024-01-13 15:55:58'),
(1112, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:56:28', '2024-01-13 15:56:28'),
(1113, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:56:48', '2024-01-13 15:56:48'),
(1114, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:56:52', '2024-01-13 15:56:52'),
(1115, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:56:53', '2024-01-13 15:56:53'),
(1116, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:56:57', '2024-01-13 15:56:57'),
(1117, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:57:05', '2024-01-13 15:57:05'),
(1118, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:57:07', '2024-01-13 15:57:07'),
(1119, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:57:07', '2024-01-13 15:57:07'),
(1120, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:57:34', '2024-01-13 15:57:34'),
(1121, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:30', '2024-01-13 15:58:30'),
(1122, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/5', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:31', '2024-01-13 15:58:31'),
(1123, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:33', '2024-01-13 15:58:33'),
(1124, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:42', '2024-01-13 15:58:42'),
(1125, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:43', '2024-01-13 15:58:43'),
(1126, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:58:43', '2024-01-13 15:58:43'),
(1127, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:59:18', '2024-01-13 15:59:18'),
(1128, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 15:59:20', '2024-01-13 15:59:20'),
(1129, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:00:18', '2024-01-13 16:00:18'),
(1130, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:00:40', '2024-01-13 16:00:40'),
(1131, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:00:46', '2024-01-13 16:00:46'),
(1132, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:01:34', '2024-01-13 16:01:34'),
(1133, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/6', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:01:35', '2024-01-13 16:01:35'),
(1134, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:01:37', '2024-01-13 16:01:37'),
(1135, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:18', '2024-01-13 16:02:18'),
(1136, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:18', '2024-01-13 16:02:18'),
(1137, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:21', '2024-01-13 16:02:21'),
(1138, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:26', '2024-01-13 16:02:26'),
(1139, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:50', '2024-01-13 16:02:50'),
(1140, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:02:52', '2024-01-13 16:02:52'),
(1141, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:41', '2024-01-13 16:03:41'),
(1142, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/7', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:41', '2024-01-13 16:03:41'),
(1143, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:45', '2024-01-13 16:03:45'),
(1144, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:53', '2024-01-13 16:03:53'),
(1145, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:54', '2024-01-13 16:03:54'),
(1146, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:03:55', '2024-01-13 16:03:55'),
(1147, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:04', '2024-01-13 16:04:04'),
(1148, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:08', '2024-01-13 16:04:08'),
(1149, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:08', '2024-01-13 16:04:08'),
(1150, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:10', '2024-01-13 16:04:10'),
(1151, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:37', '2024-01-13 16:04:37'),
(1152, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:37', '2024-01-13 16:04:37'),
(1153, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:48', '2024-01-13 16:04:48'),
(1154, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:56', '2024-01-13 16:04:56'),
(1155, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:59', '2024-01-13 16:04:59'),
(1156, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/9', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:04:59', '2024-01-13 16:04:59'),
(1157, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:05:02', '2024-01-13 16:05:02'),
(1158, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:05:15', '2024-01-13 16:05:15'),
(1159, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:05:17', '2024-01-13 16:05:17'),
(1160, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:05:17', '2024-01-13 16:05:17'),
(1161, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:05:51', '2024-01-13 16:05:51'),
(1162, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:06', '2024-01-13 16:06:06'),
(1163, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/10', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:06', '2024-01-13 16:06:06'),
(1164, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:24', '2024-01-13 16:06:24'),
(1165, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:30', '2024-01-13 16:06:30'),
(1166, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:35', '2024-01-13 16:06:35'),
(1167, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:37', '2024-01-13 16:06:37'),
(1168, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:37', '2024-01-13 16:06:37'),
(1169, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:49', '2024-01-13 16:06:49'),
(1170, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:51', '2024-01-13 16:06:51'),
(1171, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:52', '2024-01-13 16:06:52'),
(1172, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:06:55', '2024-01-13 16:06:55'),
(1173, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:03', '2024-01-13 16:07:03'),
(1174, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:05', '2024-01-13 16:07:05'),
(1175, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:05', '2024-01-13 16:07:05'),
(1176, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:13', '2024-01-13 16:07:13'),
(1177, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:18', '2024-01-13 16:07:18'),
(1178, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:19', '2024-01-13 16:07:19'),
(1179, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:24', '2024-01-13 16:07:24'),
(1180, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:24', '2024-01-13 16:07:24'),
(1181, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:28', '2024-01-13 16:07:28'),
(1182, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:33', '2024-01-13 16:07:33'),
(1183, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:36', '2024-01-13 16:07:36'),
(1184, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:36', '2024-01-13 16:07:36'),
(1185, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:49', '2024-01-13 16:07:49'),
(1186, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:55', '2024-01-13 16:07:55'),
(1187, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:55', '2024-01-13 16:07:55'),
(1188, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:07:57', '2024-01-13 16:07:57'),
(1189, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:11', '2024-01-13 16:08:11'),
(1190, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:12', '2024-01-13 16:08:12'),
(1191, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:12', '2024-01-13 16:08:12'),
(1192, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:23', '2024-01-13 16:08:23'),
(1193, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:28', '2024-01-13 16:08:28'),
(1194, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/14', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:28', '2024-01-13 16:08:28'),
(1195, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:31', '2024-01-13 16:08:31'),
(1196, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:40', '2024-01-13 16:08:40'),
(1197, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:42', '2024-01-13 16:08:42'),
(1198, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:08:42', '2024-01-13 16:08:42'),
(1199, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:15', '2024-01-13 16:09:15'),
(1200, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:23', '2024-01-13 16:09:23'),
(1201, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:25', '2024-01-13 16:09:25'),
(1202, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:40', '2024-01-13 16:09:40'),
(1203, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:42', '2024-01-13 16:09:42'),
(1204, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:43', '2024-01-13 16:09:43'),
(1205, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:09:44', '2024-01-13 16:09:44'),
(1206, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:00', '2024-01-13 16:10:00'),
(1207, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/15', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:00', '2024-01-13 16:10:00'),
(1208, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:03', '2024-01-13 16:10:03'),
(1209, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:15', '2024-01-13 16:10:15'),
(1210, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:17', '2024-01-13 16:10:17'),
(1211, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:17', '2024-01-13 16:10:17'),
(1212, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:23', '2024-01-13 16:10:23'),
(1213, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:34', '2024-01-13 16:10:34'),
(1214, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/16', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:35', '2024-01-13 16:10:35'),
(1215, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:10:38', '2024-01-13 16:10:38'),
(1216, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:11:13', '2024-01-13 16:11:13'),
(1217, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:11:15', '2024-01-13 16:11:15'),
(1218, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:11:15', '2024-01-13 16:11:15'),
(1219, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:11:37', '2024-01-13 16:11:37'),
(1220, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:11:47', '2024-01-13 16:11:47'),
(1221, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:12:10', '2024-01-13 16:12:10'),
(1222, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:12:25', '2024-01-13 16:12:25'),
(1223, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:12:48', '2024-01-13 16:12:48'),
(1224, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/17', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:12:48', '2024-01-13 16:12:48'),
(1225, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:12:51', '2024-01-13 16:12:51'),
(1226, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:15', '2024-01-13 16:13:15'),
(1227, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:17', '2024-01-13 16:13:17'),
(1228, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/15', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:23', '2024-01-13 16:13:23'),
(1229, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:26', '2024-01-13 16:13:26'),
(1230, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:26', '2024-01-13 16:13:26'),
(1231, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:26', '2024-01-13 16:13:26'),
(1232, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:53', '2024-01-13 16:13:53'),
(1233, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:55', '2024-01-13 16:13:55'),
(1234, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:13:55', '2024-01-13 16:13:55'),
(1235, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:10', '2024-01-13 16:14:10'),
(1236, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:16', '2024-01-13 16:14:16'),
(1237, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:20', '2024-01-13 16:14:20'),
(1238, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:20', '2024-01-13 16:14:20'),
(1239, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:23', '2024-01-13 16:14:23'),
(1240, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:32', '2024-01-13 16:14:32'),
(1241, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:34', '2024-01-13 16:14:34'),
(1242, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:34', '2024-01-13 16:14:34'),
(1243, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:46', '2024-01-13 16:14:46'),
(1244, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:49', '2024-01-13 16:14:49');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1245, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:50', '2024-01-13 16:14:50'),
(1246, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:14:52', '2024-01-13 16:14:52'),
(1247, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:02', '2024-01-13 16:15:02'),
(1248, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:05', '2024-01-13 16:15:05'),
(1249, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:05', '2024-01-13 16:15:05'),
(1250, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:13', '2024-01-13 16:15:13'),
(1251, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:30', '2024-01-13 16:15:30'),
(1252, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:30', '2024-01-13 16:15:30'),
(1253, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:33', '2024-01-13 16:15:33'),
(1254, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:40', '2024-01-13 16:15:40'),
(1255, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:42', '2024-01-13 16:15:42'),
(1256, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:42', '2024-01-13 16:15:42'),
(1257, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:52', '2024-01-13 16:15:52'),
(1258, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:57', '2024-01-13 16:15:57'),
(1259, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/21', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:15:58', '2024-01-13 16:15:58'),
(1260, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:00', '2024-01-13 16:16:00'),
(1261, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:18', '2024-01-13 16:16:18'),
(1262, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:21', '2024-01-13 16:16:21'),
(1263, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:21', '2024-01-13 16:16:21'),
(1264, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:32', '2024-01-13 16:16:32'),
(1265, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:42', '2024-01-13 16:16:42'),
(1266, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:50', '2024-01-13 16:16:50'),
(1267, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:50', '2024-01-13 16:16:50'),
(1268, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:16:58', '2024-01-13 16:16:58'),
(1269, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:13', '2024-01-13 16:17:13'),
(1270, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:16', '2024-01-13 16:17:16'),
(1271, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:16', '2024-01-13 16:17:16'),
(1272, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:22', '2024-01-13 16:17:22'),
(1273, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:27', '2024-01-13 16:17:27'),
(1274, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/23', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:29', '2024-01-13 16:17:29'),
(1275, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:31', '2024-01-13 16:17:31'),
(1276, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:37', '2024-01-13 16:17:37'),
(1277, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:39', '2024-01-13 16:17:39'),
(1278, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:39', '2024-01-13 16:17:39'),
(1279, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:50', '2024-01-13 16:17:50'),
(1280, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:58', '2024-01-13 16:17:58'),
(1281, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/24', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:17:58', '2024-01-13 16:17:58'),
(1282, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:00', '2024-01-13 16:18:00'),
(1283, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:08', '2024-01-13 16:18:08'),
(1284, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:11', '2024-01-13 16:18:11'),
(1285, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:11', '2024-01-13 16:18:11'),
(1286, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:30', '2024-01-13 16:18:30'),
(1287, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:45', '2024-01-13 16:18:45'),
(1288, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/25', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:46', '2024-01-13 16:18:46'),
(1289, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:18:49', '2024-01-13 16:18:49'),
(1290, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:02', '2024-01-13 16:19:02'),
(1291, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:04', '2024-01-13 16:19:04'),
(1292, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:04', '2024-01-13 16:19:04'),
(1293, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:12', '2024-01-13 16:19:12'),
(1294, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:15', '2024-01-13 16:19:15'),
(1295, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:16', '2024-01-13 16:19:16'),
(1296, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:17', '2024-01-13 16:19:17'),
(1297, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:23', '2024-01-13 16:19:23'),
(1298, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:26', '2024-01-13 16:19:26'),
(1299, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/26', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:27', '2024-01-13 16:19:27'),
(1300, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:34', '2024-01-13 16:19:34'),
(1301, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:42', '2024-01-13 16:19:42'),
(1302, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:45', '2024-01-13 16:19:45'),
(1303, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:45', '2024-01-13 16:19:45'),
(1304, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:19:52', '2024-01-13 16:19:52'),
(1305, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:04', '2024-01-13 16:20:04'),
(1306, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:15', '2024-01-13 16:20:15'),
(1307, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/27', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:16', '2024-01-13 16:20:16'),
(1308, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:20', '2024-01-13 16:20:20'),
(1309, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:29', '2024-01-13 16:20:29'),
(1310, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:32', '2024-01-13 16:20:32'),
(1311, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:32', '2024-01-13 16:20:32'),
(1312, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:38', '2024-01-13 16:20:38'),
(1313, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:52', '2024-01-13 16:20:52'),
(1314, '103.143.183.253', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:56', '2024-01-13 16:20:56'),
(1315, '103.143.183.253', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:57', '2024-01-13 16:20:57'),
(1316, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:20:59', '2024-01-13 16:20:59'),
(1317, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:21:25', '2024-01-13 16:21:25'),
(1318, '103.143.183.253', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:21:28', '2024-01-13 16:21:28'),
(1319, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:24:18', '2024-01-13 16:24:18'),
(1320, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:24:19', '2024-01-13 16:24:19'),
(1321, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:24:28', '2024-01-13 16:24:28'),
(1322, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:24:30', '2024-01-13 16:24:30'),
(1323, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:24:42', '2024-01-13 16:24:42'),
(1324, '103.143.183.253', 'superAdmin.coupon', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coupon', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:29', '2024-01-13 16:25:29'),
(1325, '103.143.183.253', 'superAdmin.coupon', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/coupon', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:31', '2024-01-13 16:25:31'),
(1326, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:41', '2024-01-13 16:25:41'),
(1327, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:42', '2024-01-13 16:25:42'),
(1328, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:47', '2024-01-13 16:25:47'),
(1329, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:25:48', '2024-01-13 16:25:48'),
(1330, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:01', '2024-01-13 16:26:01'),
(1331, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:03', '2024-01-13 16:26:03'),
(1332, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:09', '2024-01-13 16:26:09'),
(1333, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:20', '2024-01-13 16:26:20'),
(1334, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:25', '2024-01-13 16:26:25'),
(1335, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-13 16:26:34', '2024-01-13 16:26:34'),
(1336, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:30:19', '2024-01-14 06:30:19'),
(1337, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:30:22', '2024-01-14 06:30:22'),
(1338, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:30:27', '2024-01-14 06:30:27'),
(1339, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:30:38', '2024-01-14 06:30:38'),
(1340, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:30:49', '2024-01-14 06:30:49'),
(1341, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:31:05', '2024-01-14 06:31:05'),
(1342, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:31:35', '2024-01-14 06:31:35'),
(1343, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:31:37', '2024-01-14 06:31:37'),
(1344, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:31:38', '2024-01-14 06:31:38'),
(1345, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:32:05', '2024-01-14 06:32:05'),
(1346, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:32:22', '2024-01-14 06:32:22'),
(1347, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:32:27', '2024-01-14 06:32:27'),
(1348, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:32:31', '2024-01-14 06:32:31'),
(1349, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:33:04', '2024-01-14 06:33:04'),
(1350, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:33:21', '2024-01-14 06:33:21'),
(1351, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:36:34', '2024-01-14 06:36:34'),
(1352, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:36:37', '2024-01-14 06:36:37'),
(1353, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:37:23', '2024-01-14 06:37:23'),
(1354, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:37:26', '2024-01-14 06:37:26'),
(1355, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:40:52', '2024-01-14 06:40:52'),
(1356, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:41:16', '2024-01-14 06:41:16'),
(1357, '119.148.40.121', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.delivery.create/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:42:38', '2024-01-14 06:42:38'),
(1358, '119.148.40.121', 'superAdmin.sale.getpayment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getpayment/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:42:44', '2024-01-14 06:42:44'),
(1359, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:10:49', '2024-01-14 08:10:49'),
(1360, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:10:57', '2024-01-14 08:10:57'),
(1361, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:37:08', '2024-01-14 08:37:08'),
(1362, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:37:09', '2024-01-14 08:37:09'),
(1363, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:37:39', '2024-01-14 08:37:39'),
(1364, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:39:25', '2024-01-14 08:39:25'),
(1365, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:40:26', '2024-01-14 08:40:26'),
(1366, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:40:50', '2024-01-14 08:40:50'),
(1367, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:40:52', '2024-01-14 08:40:52'),
(1368, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:40:59', '2024-01-14 08:40:59'),
(1369, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:00', '2024-01-14 08:41:00'),
(1370, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:02', '2024-01-14 08:41:02'),
(1371, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:07', '2024-01-14 08:41:07'),
(1372, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:15', '2024-01-14 08:41:15'),
(1373, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:33', '2024-01-14 08:41:33'),
(1374, '119.148.40.121', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:41:46', '2024-01-14 08:41:46'),
(1375, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:44:12', '2024-01-14 08:44:12'),
(1376, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:44:21', '2024-01-14 08:44:21'),
(1377, '119.148.40.121', 'superAdmin.report.customerDueByDate', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/customer-due-report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:44:47', '2024-01-14 08:44:47'),
(1378, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:44:57', '2024-01-14 08:44:57'),
(1379, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:44:59', '2024-01-14 08:44:59'),
(1380, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:09', '2024-01-14 08:45:09'),
(1381, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:09', '2024-01-14 08:45:09'),
(1382, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:11', '2024-01-14 08:45:11'),
(1383, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:22', '2024-01-14 08:45:22'),
(1384, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:23', '2024-01-14 08:45:23'),
(1385, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:24', '2024-01-14 08:45:24'),
(1386, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:50', '2024-01-14 08:45:50'),
(1387, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:45:50', '2024-01-14 08:45:50'),
(1388, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:01', '2024-01-14 08:46:01'),
(1389, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:06', '2024-01-14 08:46:06'),
(1390, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:15', '2024-01-14 08:46:15'),
(1391, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:15', '2024-01-14 08:46:15'),
(1392, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:36', '2024-01-14 08:49:36'),
(1393, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:54', '2024-01-14 08:49:54'),
(1394, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:02', '2024-01-14 08:50:02'),
(1395, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:03', '2024-01-14 08:50:03'),
(1396, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:12', '2024-01-14 08:50:12'),
(1397, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:17', '2024-01-14 08:50:17'),
(1398, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:20', '2024-01-14 08:50:20'),
(1399, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:20', '2024-01-14 08:50:20'),
(1400, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:22', '2024-01-14 08:50:22'),
(1401, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:28', '2024-01-14 08:50:28'),
(1402, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:36', '2024-01-14 08:50:36'),
(1403, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:43', '2024-01-14 08:50:43'),
(1404, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:50', '2024-01-14 08:50:50'),
(1405, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:54', '2024-01-14 08:50:54'),
(1406, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:50:59', '2024-01-14 08:50:59'),
(1407, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:03', '2024-01-14 08:51:03'),
(1408, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:06', '2024-01-14 08:51:06'),
(1409, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:14', '2024-01-14 08:51:14'),
(1410, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:24', '2024-01-14 08:51:24'),
(1411, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:40', '2024-01-14 08:51:40'),
(1412, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:51:47', '2024-01-14 08:51:47'),
(1413, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:53:50', '2024-01-14 08:53:50'),
(1414, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:53:52', '2024-01-14 08:53:52'),
(1415, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:02', '2024-01-14 08:54:02'),
(1416, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:02', '2024-01-14 08:54:02'),
(1417, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:08', '2024-01-14 08:54:08'),
(1418, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:18', '2024-01-14 08:54:18'),
(1419, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:24', '2024-01-14 08:54:24'),
(1420, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:27', '2024-01-14 08:54:27'),
(1421, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:33', '2024-01-14 08:54:33'),
(1422, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:41', '2024-01-14 08:54:41'),
(1423, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:43', '2024-01-14 08:54:43'),
(1424, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:54:57', '2024-01-14 08:54:57'),
(1425, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:03', '2024-01-14 08:55:03'),
(1426, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:15', '2024-01-14 08:55:15'),
(1427, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:17', '2024-01-14 08:55:17'),
(1428, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:22', '2024-01-14 08:55:22'),
(1429, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:25', '2024-01-14 08:55:25'),
(1430, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:33', '2024-01-14 08:55:33'),
(1431, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:33', '2024-01-14 08:55:33'),
(1432, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:47', '2024-01-14 08:55:47'),
(1433, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:50', '2024-01-14 08:55:50'),
(1434, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:52', '2024-01-14 08:55:52'),
(1435, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:55:56', '2024-01-14 08:55:56'),
(1436, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:12', '2024-01-14 08:56:12'),
(1437, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:21', '2024-01-14 08:56:21'),
(1438, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:22', '2024-01-14 08:56:22'),
(1439, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:23', '2024-01-14 08:56:23'),
(1440, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:30', '2024-01-14 08:56:30'),
(1441, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:31', '2024-01-14 08:56:31'),
(1442, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:33', '2024-01-14 08:56:33'),
(1443, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:43', '2024-01-14 08:56:43'),
(1444, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:44', '2024-01-14 08:56:44'),
(1445, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:45', '2024-01-14 08:56:45'),
(1446, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:53', '2024-01-14 08:56:53'),
(1447, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:54', '2024-01-14 08:56:54'),
(1448, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:56:56', '2024-01-14 08:56:56'),
(1449, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:15', '2024-01-14 08:57:15'),
(1450, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:15', '2024-01-14 08:57:15'),
(1451, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:17', '2024-01-14 08:57:17'),
(1452, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:21', '2024-01-14 08:57:21'),
(1453, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:30', '2024-01-14 08:57:30'),
(1454, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:34', '2024-01-14 08:57:34'),
(1455, '119.148.40.121', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:43', '2024-01-14 08:57:43');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1456, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:45', '2024-01-14 08:57:45'),
(1457, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:45', '2024-01-14 08:57:45'),
(1458, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:45', '2024-01-14 08:57:45'),
(1459, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:57:56', '2024-01-14 08:57:56'),
(1460, '119.148.40.121', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:03', '2024-01-14 08:58:03'),
(1461, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:06', '2024-01-14 08:58:06'),
(1462, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:06', '2024-01-14 08:58:06'),
(1463, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:06', '2024-01-14 08:58:06'),
(1464, '119.148.40.121', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:13', '2024-01-14 08:58:13'),
(1465, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:14', '2024-01-14 08:58:14'),
(1466, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:16', '2024-01-14 08:58:16'),
(1467, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:38', '2024-01-14 08:58:38'),
(1468, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:38', '2024-01-14 08:58:38'),
(1469, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:40', '2024-01-14 08:58:40'),
(1470, '119.148.40.121', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/21', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:58:58', '2024-01-14 08:58:58'),
(1471, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:01', '2024-01-14 08:59:01'),
(1472, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:01', '2024-01-14 08:59:01'),
(1473, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:01', '2024-01-14 08:59:01'),
(1474, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:04', '2024-01-14 08:59:04'),
(1475, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:12', '2024-01-14 08:59:12'),
(1476, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:13', '2024-01-14 08:59:13'),
(1477, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:14', '2024-01-14 08:59:14'),
(1478, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:17', '2024-01-14 08:59:17'),
(1479, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:30', '2024-01-14 08:59:30'),
(1480, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:30', '2024-01-14 08:59:30'),
(1481, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:32', '2024-01-14 08:59:32'),
(1482, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:38', '2024-01-14 08:59:38'),
(1483, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:39', '2024-01-14 08:59:39'),
(1484, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:59:41', '2024-01-14 08:59:41'),
(1485, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:02:43', '2024-01-14 09:02:43'),
(1486, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:03:51', '2024-01-14 09:03:51'),
(1487, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:10', '2024-01-14 09:04:10'),
(1488, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:26', '2024-01-14 09:04:26'),
(1489, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:49', '2024-01-14 09:04:49'),
(1490, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:49', '2024-01-14 09:04:49'),
(1491, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:51', '2024-01-14 09:04:51'),
(1492, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:58', '2024-01-14 09:04:58'),
(1493, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:04:58', '2024-01-14 09:04:58'),
(1494, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:00', '2024-01-14 09:05:00'),
(1495, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:11', '2024-01-14 09:05:11'),
(1496, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:12', '2024-01-14 09:05:12'),
(1497, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:14', '2024-01-14 09:05:14'),
(1498, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:32', '2024-01-14 09:05:32'),
(1499, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:32', '2024-01-14 09:05:32'),
(1500, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:35', '2024-01-14 09:05:35'),
(1501, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:43', '2024-01-14 09:05:43'),
(1502, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:44', '2024-01-14 09:05:44'),
(1503, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:45', '2024-01-14 09:05:45'),
(1504, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:54', '2024-01-14 09:05:54'),
(1505, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:55', '2024-01-14 09:05:55'),
(1506, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:05:56', '2024-01-14 09:05:56'),
(1507, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:03', '2024-01-14 09:06:03'),
(1508, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:04', '2024-01-14 09:06:04'),
(1509, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:06', '2024-01-14 09:06:06'),
(1510, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:11', '2024-01-14 09:06:11'),
(1511, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:12', '2024-01-14 09:06:12'),
(1512, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:14', '2024-01-14 09:06:14'),
(1513, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:17', '2024-01-14 09:06:17'),
(1514, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:28', '2024-01-14 09:06:28'),
(1515, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:29', '2024-01-14 09:06:29'),
(1516, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:31', '2024-01-14 09:06:31'),
(1517, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:41', '2024-01-14 09:06:41'),
(1518, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:41', '2024-01-14 09:06:41'),
(1519, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:43', '2024-01-14 09:06:43'),
(1520, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:06:49', '2024-01-14 09:06:49'),
(1521, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:07:17', '2024-01-14 09:07:17'),
(1522, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:07:19', '2024-01-14 09:07:19'),
(1523, '119.148.40.121', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:14', '2024-01-14 09:08:14'),
(1524, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:15', '2024-01-14 09:08:15'),
(1525, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:15', '2024-01-14 09:08:15'),
(1526, '119.148.40.121', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:28', '2024-01-14 09:08:28'),
(1527, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:28', '2024-01-14 09:08:28'),
(1528, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:08:29', '2024-01-14 09:08:29'),
(1529, '119.148.40.121', 'superAdmin.expenses.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:15', '2024-01-14 09:10:15'),
(1530, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:16', '2024-01-14 09:10:16'),
(1531, '119.148.40.121', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:19', '2024-01-14 09:10:19'),
(1532, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:46', '2024-01-14 09:10:46'),
(1533, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:47', '2024-01-14 09:10:47'),
(1534, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:48', '2024-01-14 09:10:48'),
(1535, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:54', '2024-01-14 09:10:54'),
(1536, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:54', '2024-01-14 09:10:54'),
(1537, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:10:56', '2024-01-14 09:10:56'),
(1538, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:02', '2024-01-14 09:11:02'),
(1539, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:02', '2024-01-14 09:11:02'),
(1540, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:05', '2024-01-14 09:11:05'),
(1541, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:12', '2024-01-14 09:11:12'),
(1542, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:12', '2024-01-14 09:11:12'),
(1543, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:14', '2024-01-14 09:11:14'),
(1544, '119.148.40.121', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:21', '2024-01-14 09:11:21'),
(1545, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:22', '2024-01-14 09:11:22'),
(1546, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:23', '2024-01-14 09:11:23'),
(1547, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:28', '2024-01-14 09:11:28'),
(1548, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:30', '2024-01-14 09:11:30'),
(1549, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:11:57', '2024-01-14 09:11:57'),
(1550, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:12:03', '2024-01-14 09:12:03'),
(1551, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:12:11', '2024-01-14 09:12:11'),
(1552, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_purchase/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:12:48', '2024-01-14 09:12:48'),
(1553, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:13:32', '2024-01-14 09:13:32'),
(1554, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:13:51', '2024-01-14 09:13:51'),
(1555, '119.148.40.121', 'superAdmin.report.monthlySaleByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:14:14', '2024-01-14 09:14:14'),
(1556, '119.148.40.121', 'superAdmin.report.monthlySaleByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:14:21', '2024-01-14 09:14:21'),
(1557, '119.148.40.121', 'superAdmin.report.monthlySaleByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:14:26', '2024-01-14 09:14:26'),
(1558, '119.148.40.121', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:15:18', '2024-01-14 09:15:18'),
(1559, '119.148.40.121', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:16:10', '2024-01-14 09:16:10'),
(1560, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_sale/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:16:24', '2024-01-14 09:16:24'),
(1561, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:22:40', '2024-01-14 09:22:40'),
(1562, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:26:18', '2024-01-14 09:26:18'),
(1563, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:44:58', '2024-01-14 09:44:58'),
(1564, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:16:23', '2024-01-14 10:16:23'),
(1565, '119.148.40.121', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:16:31', '2024-01-14 10:16:31'),
(1566, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:16:54', '2024-01-14 10:16:54'),
(1567, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:17:07', '2024-01-14 10:17:07'),
(1568, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:18:21', '2024-01-14 10:18:21'),
(1569, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:18:29', '2024-01-14 10:18:29'),
(1570, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:19:03', '2024-01-14 10:19:03'),
(1571, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:19:22', '2024-01-14 10:19:22'),
(1572, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:19:29', '2024-01-14 10:19:29'),
(1573, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:20:08', '2024-01-14 10:20:08'),
(1574, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:20:13', '2024-01-14 10:20:13'),
(1575, '119.148.40.121', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:21:44', '2024-01-14 10:21:44'),
(1576, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:21:47', '2024-01-14 10:21:47'),
(1577, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:24:02', '2024-01-14 10:24:02'),
(1578, '119.148.40.121', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:24:47', '2024-01-14 10:24:47'),
(1579, '119.148.40.121', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:26:12', '2024-01-14 10:26:12'),
(1580, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:26:33', '2024-01-14 10:26:33'),
(1581, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:26:47', '2024-01-14 10:26:47'),
(1582, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:32:11', '2024-01-14 10:32:11'),
(1583, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:32:18', '2024-01-14 10:32:18'),
(1584, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:32:27', '2024-01-14 10:32:27'),
(1585, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:33:24', '2024-01-14 10:33:24'),
(1586, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:33:44', '2024-01-14 10:33:44'),
(1587, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:06:49', '2024-01-14 11:06:49'),
(1588, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:06:59', '2024-01-14 11:06:59'),
(1589, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:07:29', '2024-01-14 11:07:29'),
(1590, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:07:34', '2024-01-14 11:07:34'),
(1591, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:07:36', '2024-01-14 11:07:36'),
(1592, '119.148.40.121', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:07:49', '2024-01-14 11:07:49'),
(1593, '119.148.40.121', 'superAdmin.report.paymentByDate', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/payment_report_by_date', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:09:16', '2024-01-14 11:09:16'),
(1594, '119.148.40.121', 'superAdmin.report.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:09:27', '2024-01-14 11:09:27'),
(1595, '119.148.40.121', 'superAdmin.report.customerDueByDate', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/customer-due-report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:09:43', '2024-01-14 11:09:43'),
(1596, '119.148.40.121', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:13:10', '2024-01-14 11:13:10'),
(1597, '119.148.40.121', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:14:26', '2024-01-14 11:14:26'),
(1598, '119.148.40.121', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:15:14', '2024-01-14 11:15:14'),
(1599, '119.148.40.121', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:15:28', '2024-01-14 11:15:28'),
(1600, '119.148.40.121', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:15:39', '2024-01-14 11:15:39'),
(1601, '119.148.40.121', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:15:44', '2024-01-14 11:15:44'),
(1602, '119.148.40.121', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:16:04', '2024-01-14 11:16:04'),
(1603, '119.148.40.121', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:17:51', '2024-01-14 11:17:51'),
(1604, '119.148.40.121', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:19:53', '2024-01-14 11:19:53'),
(1605, '119.148.40.121', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:08', '2024-01-14 11:20:08'),
(1606, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:24', '2024-01-14 11:20:24'),
(1607, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:26', '2024-01-14 11:20:26'),
(1608, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:32', '2024-01-14 11:20:32'),
(1609, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:35', '2024-01-14 11:20:35'),
(1610, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:20:41', '2024-01-14 11:20:41'),
(1611, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:21:04', '2024-01-14 11:21:04'),
(1612, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:21:08', '2024-01-14 11:21:08'),
(1613, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:21:19', '2024-01-14 11:21:19'),
(1614, '119.148.40.121', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:22:50', '2024-01-14 11:22:50'),
(1615, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:23:29', '2024-01-14 11:23:29'),
(1616, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:23:31', '2024-01-14 11:23:31'),
(1617, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:24:01', '2024-01-14 11:24:01'),
(1618, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:24:30', '2024-01-14 11:24:30'),
(1619, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:24:36', '2024-01-14 11:24:36'),
(1620, '119.148.40.121', 'superAdmin.report.customerDueByDate', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/customer-due-report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:25:28', '2024-01-14 11:25:28'),
(1621, '119.148.40.121', 'superAdmin.rewardPointSetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/rewardPointSetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:25:44', '2024-01-14 11:25:44'),
(1622, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:26:07', '2024-01-14 11:26:07'),
(1623, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:26:09', '2024-01-14 11:26:09'),
(1624, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:26:10', '2024-01-14 11:26:10'),
(1625, '119.148.40.121', 'superAdmin.rewardPointSetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/rewardPointSetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:26:38', '2024-01-14 11:26:38'),
(1626, '119.148.40.121', 'superAdmin.rewardPointSettingStore', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/rewardPointSettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:05', '2024-01-14 11:27:05'),
(1627, '119.148.40.121', 'superAdmin.rewardPointSetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/rewardPointSetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:05', '2024-01-14 11:27:05'),
(1628, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:13', '2024-01-14 11:27:13'),
(1629, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:15', '2024-01-14 11:27:15'),
(1630, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:15', '2024-01-14 11:27:15'),
(1631, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:30', '2024-01-14 11:27:30'),
(1632, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:27:33', '2024-01-14 11:27:33'),
(1633, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:28:19', '2024-01-14 11:28:19'),
(1634, '103.143.183.253', 'superAdmin.stock-count', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/stock-count', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 12:59:43', '2024-01-14 12:59:43'),
(1635, '103.143.183.253', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:00:40', '2024-01-14 13:00:40'),
(1636, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:01:24', '2024-01-14 13:01:24'),
(1637, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:01:26', '2024-01-14 13:01:26'),
(1638, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:02:57', '2024-01-14 13:02:57'),
(1639, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:02:59', '2024-01-14 13:02:59'),
(1640, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:02:59', '2024-01-14 13:02:59'),
(1641, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:02:59', '2024-01-14 13:02:59'),
(1642, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/5', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:04', '2024-01-14 13:03:04'),
(1643, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:06', '2024-01-14 13:03:06'),
(1644, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:06', '2024-01-14 13:03:06'),
(1645, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:08', '2024-01-14 13:03:08'),
(1646, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:29', '2024-01-14 13:03:29'),
(1647, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/5', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:31', '2024-01-14 13:03:31'),
(1648, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:31', '2024-01-14 13:03:31'),
(1649, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:31', '2024-01-14 13:03:31'),
(1650, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:34', '2024-01-14 13:03:34'),
(1651, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:36', '2024-01-14 13:03:36'),
(1652, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:37', '2024-01-14 13:03:37'),
(1653, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:39', '2024-01-14 13:03:39'),
(1654, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:55', '2024-01-14 13:03:55'),
(1655, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:57', '2024-01-14 13:03:57'),
(1656, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:57', '2024-01-14 13:03:57'),
(1657, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:03:57', '2024-01-14 13:03:57'),
(1658, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:05', '2024-01-14 13:04:05'),
(1659, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/27', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:08', '2024-01-14 13:04:08'),
(1660, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:11', '2024-01-14 13:04:11'),
(1661, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:11', '2024-01-14 13:04:11'),
(1662, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:11', '2024-01-14 13:04:11');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1663, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:19', '2024-01-14 13:04:19'),
(1664, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:41', '2024-01-14 13:04:41'),
(1665, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:50', '2024-01-14 13:04:50'),
(1666, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:52', '2024-01-14 13:04:52'),
(1667, '103.143.183.253', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 13:04:58', '2024-01-14 13:04:58'),
(1668, '103.143.183.253', 'superAdmin.stock-count', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/stock-count', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:02:02', '2024-01-14 15:02:02'),
(1669, '103.143.183.253', 'superAdmin.setting.hrm', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/setting/hrm_setting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:02:20', '2024-01-14 15:02:20'),
(1670, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:02:36', '2024-01-14 15:02:36'),
(1671, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:02:38', '2024-01-14 15:02:38'),
(1672, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_sale/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:24', '2024-01-14 15:03:24'),
(1673, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:25', '2024-01-14 15:03:25'),
(1674, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:27', '2024-01-14 15:03:27'),
(1675, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_purchase/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:27', '2024-01-14 15:03:27'),
(1676, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_purchase/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:28', '2024-01-14 15:03:28'),
(1677, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:03:31', '2024-01-14 15:03:31'),
(1678, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:04:09', '2024-01-14 15:04:09'),
(1679, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:04:12', '2024-01-14 15:04:12'),
(1680, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:04:22', '2024-01-14 15:04:22'),
(1681, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:04:37', '2024-01-14 15:04:37'),
(1682, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:05:53', '2024-01-14 15:05:53'),
(1683, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:06:06', '2024-01-14 15:06:06'),
(1684, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:06:46', '2024-01-14 15:06:46'),
(1685, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:06:48', '2024-01-14 15:06:48'),
(1686, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:08:30', '2024-01-14 15:08:30'),
(1687, '103.143.183.253', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:08:50', '2024-01-14 15:08:50'),
(1688, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:01', '2024-01-14 15:11:01'),
(1689, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:04', '2024-01-14 15:11:04'),
(1690, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:04', '2024-01-14 15:11:04'),
(1691, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:04', '2024-01-14 15:11:04'),
(1692, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:37', '2024-01-14 15:11:37'),
(1693, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:38', '2024-01-14 15:11:38'),
(1694, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:40', '2024-01-14 15:11:40'),
(1695, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:50', '2024-01-14 15:11:50'),
(1696, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:11:52', '2024-01-14 15:11:52'),
(1697, '103.143.183.253', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:12:07', '2024-01-14 15:12:07'),
(1698, '103.143.183.253', 'superAdmin.report.paymentByDate', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/payment_report_by_date', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:12:42', '2024-01-14 15:12:42'),
(1699, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:13:28', '2024-01-14 15:13:28'),
(1700, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:13:30', '2024-01-14 15:13:30'),
(1701, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:13:38', '2024-01-14 15:13:38'),
(1702, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:22', '2024-01-14 15:14:22'),
(1703, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_sale/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:22', '2024-01-14 15:14:22'),
(1704, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:24', '2024-01-14 15:14:24'),
(1705, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:24', '2024-01-14 15:14:24'),
(1706, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_purchase/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:27', '2024-01-14 15:14:27'),
(1707, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/monthly_purchase/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:28', '2024-01-14 15:14:28'),
(1708, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:28', '2024-01-14 15:14:28'),
(1709, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:14:57', '2024-01-14 15:14:57'),
(1710, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:15:13', '2024-01-14 15:15:13'),
(1711, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:15:20', '2024-01-14 15:15:20'),
(1712, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:15:28', '2024-01-14 15:15:28'),
(1713, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:15:57', '2024-01-14 15:15:57'),
(1714, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:16:04', '2024-01-14 15:16:04'),
(1715, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:16:24', '2024-01-14 15:16:24'),
(1716, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:16:26', '2024-01-14 15:16:26'),
(1717, '103.143.183.253', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:16:34', '2024-01-14 15:16:34'),
(1718, '103.143.183.253', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:16:35', '2024-01-14 15:16:35'),
(1719, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:43', '2024-01-14 15:17:43'),
(1720, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:45', '2024-01-14 15:17:45'),
(1721, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/28', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:50', '2024-01-14 15:17:50'),
(1722, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:53', '2024-01-14 15:17:53'),
(1723, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:53', '2024-01-14 15:17:53'),
(1724, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:53', '2024-01-14 15:17:53'),
(1725, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:17:59', '2024-01-14 15:17:59'),
(1726, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/27', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:03', '2024-01-14 15:18:03'),
(1727, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:05', '2024-01-14 15:18:05'),
(1728, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:05', '2024-01-14 15:18:05'),
(1729, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:06', '2024-01-14 15:18:06'),
(1730, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.27', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:26', '2024-01-14 15:18:26'),
(1731, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:27', '2024-01-14 15:18:27'),
(1732, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:29', '2024-01-14 15:18:29'),
(1733, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:50', '2024-01-14 15:18:50'),
(1734, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:52', '2024-01-14 15:18:52'),
(1735, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:52', '2024-01-14 15:18:52'),
(1736, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:18:53', '2024-01-14 15:18:53'),
(1737, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.22', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:06', '2024-01-14 15:19:06'),
(1738, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:06', '2024-01-14 15:19:06'),
(1739, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:08', '2024-01-14 15:19:08'),
(1740, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/19', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:18', '2024-01-14 15:19:18'),
(1741, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:20', '2024-01-14 15:19:20'),
(1742, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:20', '2024-01-14 15:19:20'),
(1743, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:21', '2024-01-14 15:19:21'),
(1744, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:24', '2024-01-14 15:19:24'),
(1745, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/17', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:34', '2024-01-14 15:19:34'),
(1746, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:36', '2024-01-14 15:19:36'),
(1747, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:36', '2024-01-14 15:19:36'),
(1748, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:36', '2024-01-14 15:19:36'),
(1749, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:44', '2024-01-14 15:19:44'),
(1750, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:51', '2024-01-14 15:19:51'),
(1751, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:53', '2024-01-14 15:19:53'),
(1752, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:53', '2024-01-14 15:19:53'),
(1753, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:19:53', '2024-01-14 15:19:53'),
(1754, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/17', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:20:27', '2024-01-14 15:20:27'),
(1755, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:20:30', '2024-01-14 15:20:30'),
(1756, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:20:30', '2024-01-14 15:20:30'),
(1757, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:20:30', '2024-01-14 15:20:30'),
(1758, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.17', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:21:08', '2024-01-14 15:21:08'),
(1759, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:21:08', '2024-01-14 15:21:08'),
(1760, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:21:10', '2024-01-14 15:21:10'),
(1761, '103.143.183.253', 'superAdmin.discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:22:15', '2024-01-14 15:22:15'),
(1762, '103.143.183.253', 'superAdmin.discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:22:17', '2024-01-14 15:22:17'),
(1763, '103.143.183.253', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/daily_sale/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:23:01', '2024-01-14 15:23:01'),
(1764, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:25:11', '2024-01-14 15:25:11'),
(1765, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:25:13', '2024-01-14 15:25:13'),
(1766, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:25:14', '2024-01-14 15:25:14'),
(1767, '103.143.183.253', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:26:00', '2024-01-14 15:26:00'),
(1768, '103.143.183.253', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:26:00', '2024-01-14 15:26:00'),
(1769, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:36', '2024-01-14 15:30:36'),
(1770, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:38', '2024-01-14 15:30:38'),
(1771, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:39', '2024-01-14 15:30:39'),
(1772, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:42', '2024-01-14 15:30:42'),
(1773, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:50', '2024-01-14 15:30:50'),
(1774, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:54', '2024-01-14 15:30:54'),
(1775, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:56', '2024-01-14 15:30:56'),
(1776, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:56', '2024-01-14 15:30:56'),
(1777, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:30:56', '2024-01-14 15:30:56'),
(1778, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/9', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:00', '2024-01-14 15:31:00'),
(1779, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:03', '2024-01-14 15:31:03'),
(1780, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:03', '2024-01-14 15:31:03'),
(1781, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:05', '2024-01-14 15:31:05'),
(1782, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:25', '2024-01-14 15:31:25'),
(1783, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:31', '2024-01-14 15:31:31'),
(1784, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:34', '2024-01-14 15:31:34'),
(1785, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:34', '2024-01-14 15:31:34'),
(1786, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:31:34', '2024-01-14 15:31:34'),
(1787, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:33:53', '2024-01-14 15:33:53'),
(1788, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:33:55', '2024-01-14 15:33:55'),
(1789, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:34:28', '2024-01-14 15:34:28'),
(1790, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:34:39', '2024-01-14 15:34:39'),
(1791, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:35:08', '2024-01-14 15:35:08'),
(1792, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:35:19', '2024-01-14 15:35:19'),
(1793, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:35:25', '2024-01-14 15:35:25'),
(1794, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:35:50', '2024-01-14 15:35:50'),
(1795, '103.143.183.253', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:38:07', '2024-01-14 15:38:07'),
(1796, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:38:34', '2024-01-14 15:38:34'),
(1797, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:22', '2024-01-14 15:40:22'),
(1798, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:24', '2024-01-14 15:40:24'),
(1799, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:35', '2024-01-14 15:40:35'),
(1800, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:42', '2024-01-14 15:40:42'),
(1801, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:53', '2024-01-14 15:40:53'),
(1802, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:40:58', '2024-01-14 15:40:58'),
(1803, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:03', '2024-01-14 15:41:03'),
(1804, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:06', '2024-01-14 15:41:06'),
(1805, '103.143.183.253', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/32', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:28', '2024-01-14 15:41:28'),
(1806, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:36', '2024-01-14 15:41:36'),
(1807, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:46', '2024-01-14 15:41:46'),
(1808, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:53', '2024-01-14 15:41:53'),
(1809, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:55', '2024-01-14 15:41:55'),
(1810, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:41:59', '2024-01-14 15:41:59'),
(1811, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:09', '2024-01-14 15:42:09'),
(1812, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:15', '2024-01-14 15:42:15'),
(1813, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:18', '2024-01-14 15:42:18'),
(1814, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:32', '2024-01-14 15:42:32'),
(1815, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:36', '2024-01-14 15:42:36'),
(1816, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:42:40', '2024-01-14 15:42:40'),
(1817, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:44:05', '2024-01-14 15:44:05'),
(1818, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:44:05', '2024-01-14 15:44:05'),
(1819, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:44:07', '2024-01-14 15:44:07'),
(1820, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:44:12', '2024-01-14 15:44:12'),
(1821, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:01', '2024-01-14 15:45:01'),
(1822, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:05', '2024-01-14 15:45:05'),
(1823, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:05', '2024-01-14 15:45:05'),
(1824, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:05', '2024-01-14 15:45:05'),
(1825, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:17', '2024-01-14 15:45:17'),
(1826, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:18', '2024-01-14 15:45:18'),
(1827, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:20', '2024-01-14 15:45:20'),
(1828, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:24', '2024-01-14 15:45:24'),
(1829, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:45', '2024-01-14 15:45:45'),
(1830, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:47', '2024-01-14 15:45:47'),
(1831, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:47', '2024-01-14 15:45:47'),
(1832, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:48', '2024-01-14 15:45:48'),
(1833, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:54', '2024-01-14 15:45:54'),
(1834, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:55', '2024-01-14 15:45:55'),
(1835, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:45:56', '2024-01-14 15:45:56'),
(1836, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:08', '2024-01-14 15:46:08'),
(1837, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:23', '2024-01-14 15:46:23'),
(1838, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:25', '2024-01-14 15:46:25'),
(1839, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:25', '2024-01-14 15:46:25'),
(1840, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:25', '2024-01-14 15:46:25'),
(1841, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:33', '2024-01-14 15:46:33'),
(1842, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:33', '2024-01-14 15:46:33'),
(1843, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:35', '2024-01-14 15:46:35'),
(1844, '103.143.183.253', 'superAdmin.report.profitLoss', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/profit_loss', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:46:57', '2024-01-14 15:46:57'),
(1845, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:49:23', '2024-01-14 15:49:23'),
(1846, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:49:28', '2024-01-14 15:49:28'),
(1847, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:49:32', '2024-01-14 15:49:32'),
(1848, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:49:35', '2024-01-14 15:49:35'),
(1849, '103.143.183.253', 'superAdmin.report.product', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:50:48', '2024-01-14 15:50:48'),
(1850, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:50:51', '2024-01-14 15:50:51'),
(1851, '103.143.183.253', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 15:50:53', '2024-01-14 15:50:53'),
(1852, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:35:10', '2024-01-14 16:35:10'),
(1853, '103.143.183.253', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:35:12', '2024-01-14 16:35:12'),
(1854, '103.143.183.253', 'superAdmin.report/product_report_data', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/report/product_report_data', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:37:17', '2024-01-14 16:37:17'),
(1855, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:42:18', '2024-01-14 16:42:18'),
(1856, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:42:20', '2024-01-14 16:42:20'),
(1857, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:42:42', '2024-01-14 16:42:42'),
(1858, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:42:48', '2024-01-14 16:42:48'),
(1859, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:26', '2024-01-14 16:43:26'),
(1860, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:36', '2024-01-14 16:43:36'),
(1861, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:47', '2024-01-14 16:43:47'),
(1862, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:49', '2024-01-14 16:43:49'),
(1863, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:49', '2024-01-14 16:43:49'),
(1864, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:43:50', '2024-01-14 16:43:50'),
(1865, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:44:30', '2024-01-14 16:44:30');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(1866, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/14', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:44:43', '2024-01-14 16:44:43'),
(1867, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:44:46', '2024-01-14 16:44:46'),
(1868, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:44:46', '2024-01-14 16:44:46'),
(1869, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:44:46', '2024-01-14 16:44:46'),
(1870, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:04', '2024-01-14 16:45:04'),
(1871, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:16', '2024-01-14 16:45:16'),
(1872, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:25', '2024-01-14 16:45:25'),
(1873, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:28', '2024-01-14 16:45:28'),
(1874, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:28', '2024-01-14 16:45:28'),
(1875, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:45:28', '2024-01-14 16:45:28'),
(1876, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:46:16', '2024-01-14 16:46:16'),
(1877, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:46:34', '2024-01-14 16:46:34'),
(1878, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/16', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:46:58', '2024-01-14 16:46:58'),
(1879, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:01', '2024-01-14 16:47:01'),
(1880, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:01', '2024-01-14 16:47:01'),
(1881, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:01', '2024-01-14 16:47:01'),
(1882, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:09', '2024-01-14 16:47:09'),
(1883, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:12', '2024-01-14 16:47:12'),
(1884, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:12', '2024-01-14 16:47:12'),
(1885, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:12', '2024-01-14 16:47:12'),
(1886, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:47', '2024-01-14 16:47:47'),
(1887, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:47:49', '2024-01-14 16:47:49'),
(1888, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:48:05', '2024-01-14 16:48:05'),
(1889, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:48:28', '2024-01-14 16:48:28'),
(1890, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/14', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:49:02', '2024-01-14 16:49:02'),
(1891, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:49:05', '2024-01-14 16:49:05'),
(1892, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:49:05', '2024-01-14 16:49:05'),
(1893, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:49:05', '2024-01-14 16:49:05'),
(1894, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:49:11', '2024-01-14 16:49:11'),
(1895, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:56:54', '2024-01-14 16:56:54'),
(1896, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:56:56', '2024-01-14 16:56:56'),
(1897, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:57:05', '2024-01-14 16:57:05'),
(1898, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:57:36', '2024-01-14 16:57:36'),
(1899, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:57:38', '2024-01-14 16:57:38'),
(1900, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:57:40', '2024-01-14 16:57:40'),
(1901, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:57:53', '2024-01-14 16:57:53'),
(1902, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 16:58:03', '2024-01-14 16:58:03'),
(1903, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:41', '2024-01-14 17:54:41'),
(1904, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:43', '2024-01-14 17:54:43'),
(1905, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:50', '2024-01-14 17:54:50'),
(1906, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:50', '2024-01-14 17:54:50'),
(1907, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:53', '2024-01-14 17:54:53'),
(1908, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:53', '2024-01-14 17:54:53'),
(1909, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:54', '2024-01-14 17:54:54'),
(1910, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:55', '2024-01-14 17:54:55'),
(1911, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:55', '2024-01-14 17:54:55'),
(1912, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:56', '2024-01-14 17:54:56'),
(1913, '103.143.183.253', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/21', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:54:59', '2024-01-14 17:54:59'),
(1914, '103.143.183.253', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:02', '2024-01-14 17:55:02'),
(1915, '103.143.183.253', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:02', '2024-01-14 17:55:02'),
(1916, '103.143.183.253', 'superAdmin.products.purchaseUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.purchaseUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:07', '2024-01-14 17:55:07'),
(1917, '103.143.183.253', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:12', '2024-01-14 17:55:12'),
(1918, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:12', '2024-01-14 17:55:12'),
(1919, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:14', '2024-01-14 17:55:14'),
(1920, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:19', '2024-01-14 17:55:19'),
(1921, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:21', '2024-01-14 17:55:21'),
(1922, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:28', '2024-01-14 17:55:28'),
(1923, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:29', '2024-01-14 17:55:29'),
(1924, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:29', '2024-01-14 17:55:29'),
(1925, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:32', '2024-01-14 17:55:32'),
(1926, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:33', '2024-01-14 17:55:33'),
(1927, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:35', '2024-01-14 17:55:35'),
(1928, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:55:46', '2024-01-14 17:55:46'),
(1929, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:35', '2024-01-14 17:56:35'),
(1930, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:36', '2024-01-14 17:56:36'),
(1931, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:37', '2024-01-14 17:56:37'),
(1932, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:38', '2024-01-14 17:56:38'),
(1933, '103.143.183.253', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:40', '2024-01-14 17:56:40'),
(1934, '103.143.183.253', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:56:58', '2024-01-14 17:56:58'),
(1935, '103.143.183.253', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:07', '2024-01-14 17:57:07'),
(1936, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:08', '2024-01-14 17:57:08'),
(1937, '103.143.183.253', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:10', '2024-01-14 17:57:10'),
(1938, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:16', '2024-01-14 17:57:16'),
(1939, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:18', '2024-01-14 17:57:18'),
(1940, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:22', '2024-01-14 17:57:22'),
(1941, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:22', '2024-01-14 17:57:22'),
(1942, '103.143.183.253', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:57:22', '2024-01-14 17:57:22'),
(1943, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:58:06', '2024-01-14 17:58:06'),
(1944, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:58:08', '2024-01-14 17:58:08'),
(1945, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 17:59:02', '2024-01-14 17:59:02'),
(1946, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:00', '2024-01-14 18:08:00'),
(1947, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:08', '2024-01-14 18:08:08'),
(1948, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:10', '2024-01-14 18:08:10'),
(1949, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:10', '2024-01-14 18:08:10'),
(1950, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:10', '2024-01-14 18:08:10'),
(1951, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:19', '2024-01-14 18:08:19'),
(1952, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:26', '2024-01-14 18:08:26'),
(1953, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:27', '2024-01-14 18:08:27'),
(1954, '103.143.183.253', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:30', '2024-01-14 18:08:30'),
(1955, '103.143.183.253', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/18', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:55', '2024-01-14 18:08:55'),
(1956, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:57', '2024-01-14 18:08:57'),
(1957, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:57', '2024-01-14 18:08:57'),
(1958, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:08:58', '2024-01-14 18:08:58'),
(1959, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:19', '2024-01-14 18:09:19'),
(1960, '103.143.183.253', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:21', '2024-01-14 18:09:21'),
(1961, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:28', '2024-01-14 18:09:28'),
(1962, '103.143.183.253', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:39', '2024-01-14 18:09:39'),
(1963, '103.143.183.253', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:46', '2024-01-14 18:09:46'),
(1964, '103.143.183.253', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:46', '2024-01-14 18:09:46'),
(1965, '103.143.183.253', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:56', '2024-01-14 18:09:56'),
(1966, '103.143.183.253', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:09:59', '2024-01-14 18:09:59'),
(1967, '103.143.183.253', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 18:10:34', '2024-01-14 18:10:34'),
(1968, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:05:03', '2024-01-15 10:05:03'),
(1969, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:05:04', '2024-01-15 10:05:04'),
(1970, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:05:06', '2024-01-15 10:05:06'),
(1971, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:06:00', '2024-01-15 10:06:00'),
(1972, '119.148.40.121', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:06:31', '2024-01-15 10:06:31'),
(1973, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:06:33', '2024-01-15 10:06:33'),
(1974, '119.148.40.121', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:06:34', '2024-01-15 10:06:34'),
(1975, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:56:19', '2024-01-15 10:56:19'),
(1976, '119.148.40.121', 'superAdmin.category', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/category', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:56:19', '2024-01-15 10:56:19'),
(1977, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:56:23', '2024-01-15 10:56:23'),
(1978, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:56:25', '2024-01-15 10:56:25'),
(1979, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:56:48', '2024-01-15 10:56:48'),
(1980, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:11', '2024-01-15 10:57:11'),
(1981, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:12', '2024-01-15 10:57:12'),
(1982, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:12', '2024-01-15 10:57:12'),
(1983, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:20', '2024-01-15 10:57:20'),
(1984, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:22', '2024-01-15 10:57:22'),
(1985, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:57:23', '2024-01-15 10:57:23'),
(1986, '119.148.40.121', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:03', '2024-01-15 10:58:03'),
(1987, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:04', '2024-01-15 10:58:04'),
(1988, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:07', '2024-01-15 10:58:07'),
(1989, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:17', '2024-01-15 10:58:17'),
(1990, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:20', '2024-01-15 10:58:20'),
(1991, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:20', '2024-01-15 10:58:20'),
(1992, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:30', '2024-01-15 10:58:30'),
(1993, '119.148.40.121', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:40', '2024-01-15 10:58:40'),
(1994, '119.148.40.121', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/29', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:41', '2024-01-15 10:58:41'),
(1995, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 10:58:44', '2024-01-15 10:58:44'),
(1996, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:04:43', '2024-01-15 11:04:43'),
(1997, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:04:45', '2024-01-15 11:04:45'),
(1998, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:04:51', '2024-01-15 11:04:51'),
(1999, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:05:02', '2024-01-15 11:05:02'),
(2000, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:05:08', '2024-01-15 11:05:08'),
(2001, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:05:11', '2024-01-15 11:05:11'),
(2002, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:05:11', '2024-01-15 11:05:11'),
(2003, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:27', '2024-01-15 11:24:27'),
(2004, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:29', '2024-01-15 11:24:29'),
(2005, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:31', '2024-01-15 11:24:31'),
(2006, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:43', '2024-01-15 11:24:43'),
(2007, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:45', '2024-01-15 11:24:45'),
(2008, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:45', '2024-01-15 11:24:45'),
(2009, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:24:54', '2024-01-15 11:24:54'),
(2010, '119.148.40.121', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:25:00', '2024-01-15 11:25:00'),
(2011, '119.148.40.121', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/30', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:25:00', '2024-01-15 11:25:00'),
(2012, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:25:03', '2024-01-15 11:25:03'),
(2013, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:30:29', '2024-01-15 11:30:29'),
(2014, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 11:30:31', '2024-01-15 11:30:31'),
(2015, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:02', '2024-01-16 04:46:02'),
(2016, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:04', '2024-01-16 04:46:04'),
(2017, '119.148.40.121', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:04', '2024-01-16 04:46:04'),
(2018, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:22', '2024-01-16 04:46:22'),
(2019, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:24', '2024-01-16 04:46:24'),
(2020, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:26', '2024-01-16 04:46:26'),
(2021, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:42', '2024-01-16 04:46:42'),
(2022, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:44', '2024-01-16 04:46:44'),
(2023, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:46:44', '2024-01-16 04:46:44'),
(2024, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:47:54', '2024-01-16 04:47:54'),
(2025, '119.148.40.121', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:47:57', '2024-01-16 04:47:57'),
(2026, '119.148.40.121', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/31', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:47:57', '2024-01-16 04:47:57'),
(2027, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 04:47:59', '2024-01-16 04:47:59'),
(2028, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:26:04', '2024-01-19 22:26:04'),
(2029, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:26:05', '2024-01-19 22:26:05'),
(2030, '103.143.183.250', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:26:59', '2024-01-19 22:26:59'),
(2031, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:26:59', '2024-01-19 22:26:59'),
(2032, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:00', '2024-01-19 22:27:00'),
(2033, '103.143.183.250', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:47', '2024-01-19 22:27:47'),
(2034, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:48', '2024-01-19 22:27:48'),
(2035, '103.143.183.250', 'superAdmin.expenses.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:49', '2024-01-19 22:27:49'),
(2036, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:49', '2024-01-19 22:27:49'),
(2037, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:49', '2024-01-19 22:27:49'),
(2038, '103.143.183.250', 'superAdmin.expenses', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/expenses', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:27:50', '2024-01-19 22:27:50'),
(2039, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:34:04', '2024-01-19 22:34:04'),
(2040, '103.143.183.250', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:34:05', '2024-01-19 22:34:05'),
(2041, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:34:05', '2024-01-19 22:34:05'),
(2042, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:34:47', '2024-01-19 22:34:47'),
(2043, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:34:48', '2024-01-19 22:34:48'),
(2044, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:35:24', '2024-01-19 22:35:24'),
(2045, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:35:25', '2024-01-19 22:35:25'),
(2046, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:36:49', '2024-01-19 22:36:49'),
(2047, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:36:50', '2024-01-19 22:36:50'),
(2048, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:37:16', '2024-01-19 22:37:16'),
(2049, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:37:16', '2024-01-19 22:37:16'),
(2050, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:37:37', '2024-01-19 22:37:37'),
(2051, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:37:38', '2024-01-19 22:37:38'),
(2052, '103.143.183.250', 'superAdmin.customer.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:26', '2024-01-19 22:38:26'),
(2053, '103.143.183.250', 'superAdmin.customer', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/customer', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:27', '2024-01-19 22:38:27'),
(2054, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:33', '2024-01-19 22:38:33'),
(2055, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:35', '2024-01-19 22:38:35'),
(2056, '103.143.183.250', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:42', '2024-01-19 22:38:42'),
(2057, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:38:56', '2024-01-19 22:38:56'),
(2058, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/10', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:03', '2024-01-19 22:39:03'),
(2059, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:06', '2024-01-19 22:39:06'),
(2060, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:06', '2024-01-19 22:39:06'),
(2061, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:15', '2024-01-19 22:39:15'),
(2062, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:18', '2024-01-19 22:39:18'),
(2063, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:18', '2024-01-19 22:39:18'),
(2064, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:19', '2024-01-19 22:39:19'),
(2065, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:39:26', '2024-01-19 22:39:26'),
(2066, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:40:47', '2024-01-19 22:40:47'),
(2067, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/32', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:40:48', '2024-01-19 22:40:48'),
(2068, '103.143.183.250', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:40:52', '2024-01-19 22:40:52'),
(2069, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:41:04', '2024-01-19 22:41:04'),
(2070, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:41:06', '2024-01-19 22:41:06'),
(2071, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:41:06', '2024-01-19 22:41:06');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(2072, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:41:29', '2024-01-19 22:41:29'),
(2073, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:41:49', '2024-01-19 22:41:49'),
(2074, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:34', '2024-01-19 22:42:34'),
(2075, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/33', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:35', '2024-01-19 22:42:35'),
(2076, '103.143.183.250', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:37', '2024-01-19 22:42:37'),
(2077, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:51', '2024-01-19 22:42:51'),
(2078, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:53', '2024-01-19 22:42:53'),
(2079, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:42:53', '2024-01-19 22:42:53'),
(2080, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:07', '2024-01-19 22:43:07'),
(2081, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:09', '2024-01-19 22:43:09'),
(2082, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:33', '2024-01-19 22:43:33'),
(2083, '103.143.183.250', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:49', '2024-01-19 22:43:49'),
(2084, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:50', '2024-01-19 22:43:50'),
(2085, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:43:52', '2024-01-19 22:43:52'),
(2086, '103.143.183.250', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:15', '2024-01-19 22:44:15'),
(2087, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:17', '2024-01-19 22:44:17'),
(2088, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/9', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:17', '2024-01-19 22:44:17'),
(2089, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:17', '2024-01-19 22:44:17'),
(2090, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:41', '2024-01-19 22:44:41'),
(2091, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:42', '2024-01-19 22:44:42'),
(2092, '103.143.183.250', 'superAdmin.sale.getpayment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getpayment/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:44:51', '2024-01-19 22:44:51'),
(2093, '103.143.183.250', 'superAdmin.sale.update-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.updatepayment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:08', '2024-01-19 22:45:08'),
(2094, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:09', '2024-01-19 22:45:09'),
(2095, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:27', '2024-01-19 22:45:27'),
(2096, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:47', '2024-01-19 22:45:47'),
(2097, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:48', '2024-01-19 22:45:48'),
(2098, '103.143.183.250', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:55', '2024-01-19 22:45:55'),
(2099, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:57', '2024-01-19 22:45:57'),
(2100, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/9', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:57', '2024-01-19 22:45:57'),
(2101, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:45:57', '2024-01-19 22:45:57'),
(2102, '103.143.183.250', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.20', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:46:03', '2024-01-19 22:46:03'),
(2103, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:46:03', '2024-01-19 22:46:03'),
(2104, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:46:04', '2024-01-19 22:46:04'),
(2105, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:46:15', '2024-01-19 22:46:15'),
(2106, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:46:28', '2024-01-19 22:46:28'),
(2107, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:14', '2024-01-19 22:47:14'),
(2108, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:21', '2024-01-19 22:47:21'),
(2109, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:24', '2024-01-19 22:47:24'),
(2110, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:45', '2024-01-19 22:47:45'),
(2111, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:48', '2024-01-19 22:47:48'),
(2112, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:48', '2024-01-19 22:47:48'),
(2113, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:48', '2024-01-19 22:47:48'),
(2114, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:47:58', '2024-01-19 22:47:58'),
(2115, '103.143.183.250', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:48:06', '2024-01-19 22:48:06'),
(2116, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:11', '2024-01-19 22:49:11'),
(2117, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:23', '2024-01-19 22:49:23'),
(2118, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:24', '2024-01-19 22:49:24'),
(2119, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:24', '2024-01-19 22:49:24'),
(2120, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:24', '2024-01-19 22:49:24'),
(2121, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:30', '2024-01-19 22:49:30'),
(2122, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:35', '2024-01-19 22:49:35'),
(2123, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:49:37', '2024-01-19 22:49:37'),
(2124, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:35', '2024-01-19 22:51:35'),
(2125, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/34', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:35', '2024-01-19 22:51:35'),
(2126, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:37', '2024-01-19 22:51:37'),
(2127, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:38', '2024-01-19 22:51:38'),
(2128, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:38', '2024-01-19 22:51:38'),
(2129, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:39', '2024-01-19 22:51:39'),
(2130, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:40', '2024-01-19 22:51:40'),
(2131, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:51:41', '2024-01-19 22:51:41'),
(2132, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:52:52', '2024-01-19 22:52:52'),
(2133, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:23', '2024-01-19 22:53:23'),
(2134, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/35', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:23', '2024-01-19 22:53:23'),
(2135, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:25', '2024-01-19 22:53:25'),
(2136, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:27', '2024-01-19 22:53:27'),
(2137, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:27', '2024-01-19 22:53:27'),
(2138, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:27', '2024-01-19 22:53:27'),
(2139, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:29', '2024-01-19 22:53:29'),
(2140, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:31', '2024-01-19 22:53:31'),
(2141, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:52', '2024-01-19 22:53:52'),
(2142, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:53:57', '2024-01-19 22:53:57'),
(2143, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:08', '2024-01-19 22:54:08'),
(2144, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:16', '2024-01-19 22:54:16'),
(2145, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:25', '2024-01-19 22:54:25'),
(2146, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:29', '2024-01-19 22:54:29'),
(2147, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:37', '2024-01-19 22:54:37'),
(2148, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:38', '2024-01-19 22:54:38'),
(2149, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:54:38', '2024-01-19 22:54:38'),
(2150, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:17', '2024-01-19 22:55:17'),
(2151, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:18', '2024-01-19 22:55:18'),
(2152, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:20', '2024-01-19 22:55:20'),
(2153, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:22', '2024-01-19 22:55:22'),
(2154, '103.15.42.197', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:23', '2024-01-19 22:55:23'),
(2155, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:28', '2024-01-19 22:55:28'),
(2156, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:28', '2024-01-19 22:55:28'),
(2157, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:28', '2024-01-19 22:55:28'),
(2158, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:36', '2024-01-19 22:55:36'),
(2159, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:55:37', '2024-01-19 22:55:37'),
(2160, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:01', '2024-01-19 22:56:01'),
(2161, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:14', '2024-01-19 22:56:14'),
(2162, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:25', '2024-01-19 22:56:25'),
(2163, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:26', '2024-01-19 22:56:26'),
(2164, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:27', '2024-01-19 22:56:27'),
(2165, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:32', '2024-01-19 22:56:32'),
(2166, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:32', '2024-01-19 22:56:32'),
(2167, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:32', '2024-01-19 22:56:32'),
(2168, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:35', '2024-01-19 22:56:35'),
(2169, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:41', '2024-01-19 22:56:41'),
(2170, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:42', '2024-01-19 22:56:42'),
(2171, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:47', '2024-01-19 22:56:47'),
(2172, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:56:49', '2024-01-19 22:56:49'),
(2173, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:04', '2024-01-19 22:57:04'),
(2174, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:31', '2024-01-19 22:57:31'),
(2175, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:53', '2024-01-19 22:57:53'),
(2176, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:54', '2024-01-19 22:57:54'),
(2177, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:54', '2024-01-19 22:57:54'),
(2178, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:57:55', '2024-01-19 22:57:55'),
(2179, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:16', '2024-01-19 22:58:16'),
(2180, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:17', '2024-01-19 22:58:17'),
(2181, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:25', '2024-01-19 22:58:25'),
(2182, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:26', '2024-01-19 22:58:26'),
(2183, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:26', '2024-01-19 22:58:26'),
(2184, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:28', '2024-01-19 22:58:28'),
(2185, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:28', '2024-01-19 22:58:28'),
(2186, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:28', '2024-01-19 22:58:28'),
(2187, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:28', '2024-01-19 22:58:28'),
(2188, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:29', '2024-01-19 22:58:29'),
(2189, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:29', '2024-01-19 22:58:29'),
(2190, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:31', '2024-01-19 22:58:31'),
(2191, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:31', '2024-01-19 22:58:31'),
(2192, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:31', '2024-01-19 22:58:31'),
(2193, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:32', '2024-01-19 22:58:32'),
(2194, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:32', '2024-01-19 22:58:32'),
(2195, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:40', '2024-01-19 22:58:40'),
(2196, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:40', '2024-01-19 22:58:40'),
(2197, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:41', '2024-01-19 22:58:41'),
(2198, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:43', '2024-01-19 22:58:43'),
(2199, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:43', '2024-01-19 22:58:43'),
(2200, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:47', '2024-01-19 22:58:47'),
(2201, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:47', '2024-01-19 22:58:47'),
(2202, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:47', '2024-01-19 22:58:47'),
(2203, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:48', '2024-01-19 22:58:48'),
(2204, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:48', '2024-01-19 22:58:48'),
(2205, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:49', '2024-01-19 22:58:49'),
(2206, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:51', '2024-01-19 22:58:51'),
(2207, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:55', '2024-01-19 22:58:55'),
(2208, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:58:56', '2024-01-19 22:58:56'),
(2209, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:59:20', '2024-01-19 22:59:20'),
(2210, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:59:21', '2024-01-19 22:59:21'),
(2211, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:59:33', '2024-01-19 22:59:33'),
(2212, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:59:40', '2024-01-19 22:59:40'),
(2213, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 22:59:42', '2024-01-19 22:59:42'),
(2214, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:13', '2024-01-19 23:00:13'),
(2215, '103.143.183.250', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:21', '2024-01-19 23:00:21'),
(2216, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:22', '2024-01-19 23:00:22'),
(2217, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:22', '2024-01-19 23:00:22'),
(2218, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:22', '2024-01-19 23:00:22'),
(2219, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:27', '2024-01-19 23:00:27'),
(2220, '103.143.183.250', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.update.36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:29', '2024-01-19 23:00:29'),
(2221, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:29', '2024-01-19 23:00:29'),
(2222, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:31', '2024-01-19 23:00:31'),
(2223, '103.143.183.250', 'superAdmin.sale.getpayment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getpayment/36', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:00:40', '2024-01-19 23:00:40'),
(2224, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:01:03', '2024-01-19 23:01:03'),
(2225, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:01:04', '2024-01-19 23:01:04'),
(2226, '103.143.183.250', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:01:19', '2024-01-19 23:01:19'),
(2227, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:01:19', '2024-01-19 23:01:19'),
(2228, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:01:20', '2024-01-19 23:01:20'),
(2229, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:02:02', '2024-01-19 23:02:02'),
(2230, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:03:21', '2024-01-19 23:03:21'),
(2231, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:03:23', '2024-01-19 23:03:23'),
(2232, '103.143.183.250', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:03:26', '2024-01-19 23:03:26'),
(2233, '103.143.183.250', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:03:27', '2024-01-19 23:03:27'),
(2234, '103.143.183.250', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:03:40', '2024-01-19 23:03:40'),
(2235, '103.143.183.250', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:04:10', '2024-01-19 23:04:10'),
(2236, '103.143.183.250', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:05', '2024-01-19 23:05:05'),
(2237, '103.143.183.250', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:05', '2024-01-19 23:05:05'),
(2238, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:29', '2024-01-19 23:05:29'),
(2239, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:29', '2024-01-19 23:05:29'),
(2240, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:30', '2024-01-19 23:05:30'),
(2241, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:31', '2024-01-19 23:05:31'),
(2242, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:42', '2024-01-19 23:05:42'),
(2243, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:43', '2024-01-19 23:05:43'),
(2244, '103.143.183.250', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:05:45', '2024-01-19 23:05:45'),
(2245, '103.143.183.250', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:03', '2024-01-19 23:06:03'),
(2246, '103.143.183.250', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:10', '2024-01-19 23:06:10'),
(2247, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:11', '2024-01-19 23:06:11'),
(2248, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:12', '2024-01-19 23:06:12'),
(2249, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:15', '2024-01-19 23:06:15'),
(2250, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:16', '2024-01-19 23:06:16'),
(2251, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:16', '2024-01-19 23:06:16'),
(2252, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:16', '2024-01-19 23:06:16'),
(2253, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:32', '2024-01-19 23:06:32'),
(2254, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:34', '2024-01-19 23:06:34'),
(2255, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:38', '2024-01-19 23:06:38'),
(2256, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:39', '2024-01-19 23:06:39'),
(2257, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:48', '2024-01-19 23:06:48'),
(2258, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/37', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:49', '2024-01-19 23:06:49'),
(2259, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:51', '2024-01-19 23:06:51'),
(2260, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:52', '2024-01-19 23:06:52'),
(2261, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:52', '2024-01-19 23:06:52'),
(2262, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:52', '2024-01-19 23:06:52'),
(2263, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:54', '2024-01-19 23:06:54'),
(2264, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:54', '2024-01-19 23:06:54'),
(2265, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:54', '2024-01-19 23:06:54'),
(2266, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:06:56', '2024-01-19 23:06:56'),
(2267, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:39', '2024-01-19 23:07:39'),
(2268, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:40', '2024-01-19 23:07:40'),
(2269, '103.143.183.250', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/38', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:46', '2024-01-19 23:07:46'),
(2270, '103.143.183.250', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.38', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:54', '2024-01-19 23:07:54'),
(2271, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:54', '2024-01-19 23:07:54'),
(2272, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:56', '2024-01-19 23:07:56'),
(2273, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:07:59', '2024-01-19 23:07:59'),
(2274, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:00', '2024-01-19 23:08:00'),
(2275, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:06', '2024-01-19 23:08:06'),
(2276, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:07', '2024-01-19 23:08:07'),
(2277, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:07', '2024-01-19 23:08:07'),
(2278, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:07', '2024-01-19 23:08:07'),
(2279, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:23', '2024-01-19 23:08:23');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(2280, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:37', '2024-01-19 23:08:37'),
(2281, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/38', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:37', '2024-01-19 23:08:37'),
(2282, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:39', '2024-01-19 23:08:39'),
(2283, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:41', '2024-01-19 23:08:41'),
(2284, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:43', '2024-01-19 23:08:43'),
(2285, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:45', '2024-01-19 23:08:45'),
(2286, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:45', '2024-01-19 23:08:45'),
(2287, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:08:45', '2024-01-19 23:08:45'),
(2288, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:19', '2024-01-19 23:09:19'),
(2289, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:20', '2024-01-19 23:09:20'),
(2290, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:20', '2024-01-19 23:09:20'),
(2291, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:21', '2024-01-19 23:09:21'),
(2292, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:47', '2024-01-19 23:09:47'),
(2293, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:49', '2024-01-19 23:09:49'),
(2294, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:49', '2024-01-19 23:09:49'),
(2295, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:58', '2024-01-19 23:09:58'),
(2296, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:58', '2024-01-19 23:09:58'),
(2297, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:58', '2024-01-19 23:09:58'),
(2298, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:59', '2024-01-19 23:09:59'),
(2299, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:09:59', '2024-01-19 23:09:59'),
(2300, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:10:00', '2024-01-19 23:10:00'),
(2301, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:10:00', '2024-01-19 23:10:00'),
(2302, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:10:52', '2024-01-19 23:10:52'),
(2303, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:10:53', '2024-01-19 23:10:53'),
(2304, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:15', '2024-01-19 23:11:15'),
(2305, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:18', '2024-01-19 23:11:18'),
(2306, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:19', '2024-01-19 23:11:19'),
(2307, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:21', '2024-01-19 23:11:21'),
(2308, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:43', '2024-01-19 23:11:43'),
(2309, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:44', '2024-01-19 23:11:44'),
(2310, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:48', '2024-01-19 23:11:48'),
(2311, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:49', '2024-01-19 23:11:49'),
(2312, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:49', '2024-01-19 23:11:49'),
(2313, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:11:58', '2024-01-19 23:11:58'),
(2314, '103.143.183.250', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProductFilter/8/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:13:32', '2024-01-19 23:13:32'),
(2315, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:13:36', '2024-01-19 23:13:36'),
(2316, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:04', '2024-01-19 23:14:04'),
(2317, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:17', '2024-01-19 23:14:17'),
(2318, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:17', '2024-01-19 23:14:17'),
(2319, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:17', '2024-01-19 23:14:17'),
(2320, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:17', '2024-01-19 23:14:17'),
(2321, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:18', '2024-01-19 23:14:18'),
(2322, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:18', '2024-01-19 23:14:18'),
(2323, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:19', '2024-01-19 23:14:19'),
(2324, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:20', '2024-01-19 23:14:20'),
(2325, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:20', '2024-01-19 23:14:20'),
(2326, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:14:22', '2024-01-19 23:14:22'),
(2327, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:32', '2024-01-19 23:15:32'),
(2328, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:33', '2024-01-19 23:15:33'),
(2329, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:50', '2024-01-19 23:15:50'),
(2330, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:50', '2024-01-19 23:15:50'),
(2331, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:50', '2024-01-19 23:15:50'),
(2332, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:51', '2024-01-19 23:15:51'),
(2333, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:52', '2024-01-19 23:15:52'),
(2334, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:53', '2024-01-19 23:15:53'),
(2335, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:55', '2024-01-19 23:15:55'),
(2336, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:15:57', '2024-01-19 23:15:57'),
(2337, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:16:09', '2024-01-19 23:16:09'),
(2338, '103.143.183.250', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/27', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:16:16', '2024-01-19 23:16:16'),
(2339, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:02', '2024-01-19 23:19:02'),
(2340, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/39', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:02', '2024-01-19 23:19:02'),
(2341, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:11', '2024-01-19 23:19:11'),
(2342, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:13', '2024-01-19 23:19:13'),
(2343, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:13', '2024-01-19 23:19:13'),
(2344, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:13', '2024-01-19 23:19:13'),
(2345, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:19', '2024-01-19 23:19:19'),
(2346, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:19', '2024-01-19 23:19:19'),
(2347, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:20', '2024-01-19 23:19:20'),
(2348, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:26', '2024-01-19 23:19:26'),
(2349, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:27', '2024-01-19 23:19:27'),
(2350, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:27', '2024-01-19 23:19:27'),
(2351, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:27', '2024-01-19 23:19:27'),
(2352, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:28', '2024-01-19 23:19:28'),
(2353, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:28', '2024-01-19 23:19:28'),
(2354, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:28', '2024-01-19 23:19:28'),
(2355, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:29', '2024-01-19 23:19:29'),
(2356, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:29', '2024-01-19 23:19:29'),
(2357, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:30', '2024-01-19 23:19:30'),
(2358, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:31', '2024-01-19 23:19:31'),
(2359, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:32', '2024-01-19 23:19:32'),
(2360, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:33', '2024-01-19 23:19:33'),
(2361, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:33', '2024-01-19 23:19:33'),
(2362, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:44', '2024-01-19 23:19:44'),
(2363, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:44', '2024-01-19 23:19:44'),
(2364, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:44', '2024-01-19 23:19:44'),
(2365, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:44', '2024-01-19 23:19:44'),
(2366, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:45', '2024-01-19 23:19:45'),
(2367, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:19:45', '2024-01-19 23:19:45'),
(2368, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:07', '2024-01-19 23:20:07'),
(2369, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:09', '2024-01-19 23:20:09'),
(2370, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:09', '2024-01-19 23:20:09'),
(2371, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:09', '2024-01-19 23:20:09'),
(2372, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:09', '2024-01-19 23:20:09'),
(2373, '103.143.183.250', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProductFilter/18/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:56', '2024-01-19 23:20:56'),
(2374, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:58', '2024-01-19 23:20:58'),
(2375, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:20:59', '2024-01-19 23:20:59'),
(2376, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:00', '2024-01-19 23:24:00'),
(2377, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/40', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:01', '2024-01-19 23:24:01'),
(2378, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:03', '2024-01-19 23:24:03'),
(2379, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:05', '2024-01-19 23:24:05'),
(2380, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:05', '2024-01-19 23:24:05'),
(2381, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:05', '2024-01-19 23:24:05'),
(2382, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:05', '2024-01-19 23:24:05'),
(2383, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:06', '2024-01-19 23:24:06'),
(2384, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:07', '2024-01-19 23:24:07'),
(2385, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:13', '2024-01-19 23:24:13'),
(2386, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:13', '2024-01-19 23:24:13'),
(2387, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:13', '2024-01-19 23:24:13'),
(2388, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:14', '2024-01-19 23:24:14'),
(2389, '103.143.183.250', 'superAdmin.', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProductFilter/18/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:37', '2024-01-19 23:24:37'),
(2390, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:24:38', '2024-01-19 23:24:38'),
(2391, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:04', '2024-01-19 23:25:04'),
(2392, '103.143.183.250', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:05', '2024-01-19 23:25:05'),
(2393, '103.143.183.250', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:08', '2024-01-19 23:25:08'),
(2394, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:19', '2024-01-19 23:25:19'),
(2395, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:21', '2024-01-19 23:25:21'),
(2396, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:21', '2024-01-19 23:25:21'),
(2397, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:31', '2024-01-19 23:25:31'),
(2398, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:36', '2024-01-19 23:25:36'),
(2399, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:37', '2024-01-19 23:25:37'),
(2400, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:38', '2024-01-19 23:25:38'),
(2401, '103.143.183.250', 'superAdmin.sale.check_discount', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.check_discount', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:39', '2024-01-19 23:25:39'),
(2402, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:41', '2024-01-19 23:25:41'),
(2403, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/41', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:42', '2024-01-19 23:25:42'),
(2404, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:46', '2024-01-19 23:25:46'),
(2405, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:46', '2024-01-19 23:25:46'),
(2406, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:47', '2024-01-19 23:25:47'),
(2407, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:51', '2024-01-19 23:25:51'),
(2408, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:51', '2024-01-19 23:25:51'),
(2409, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:52', '2024-01-19 23:25:52'),
(2410, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:25:52', '2024-01-19 23:25:52'),
(2411, '103.143.183.250', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.edit/30', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:27:17', '2024-01-19 23:27:17'),
(2412, '103.143.183.250', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:27:18', '2024-01-19 23:27:18'),
(2413, '103.143.183.250', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:27:18', '2024-01-19 23:27:18'),
(2414, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:27:36', '2024-01-19 23:27:36'),
(2415, '103.143.183.250', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:29:48', '2024-01-19 23:29:48'),
(2416, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:29:55', '2024-01-19 23:29:55'),
(2417, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:29:56', '2024-01-19 23:29:56'),
(2418, '103.143.183.250', 'superAdmin.purchase.edit', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.edit/30', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:14', '2024-01-19 23:30:14'),
(2419, '103.143.183.250', 'superAdmin.purchase.update', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.update.30', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:33', '2024-01-19 23:30:33'),
(2420, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:33', '2024-01-19 23:30:33'),
(2421, '103.143.183.250', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:35', '2024-01-19 23:30:35'),
(2422, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:40', '2024-01-19 23:30:40'),
(2423, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:41', '2024-01-19 23:30:41'),
(2424, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:55', '2024-01-19 23:30:55'),
(2425, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:56', '2024-01-19 23:30:56'),
(2426, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:56', '2024-01-19 23:30:56'),
(2427, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:30:56', '2024-01-19 23:30:56'),
(2428, '103.143.183.250', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:00', '2024-01-19 23:31:00'),
(2429, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:07', '2024-01-19 23:31:07'),
(2430, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:09', '2024-01-19 23:31:09'),
(2431, '103.143.183.250', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:19', '2024-01-19 23:31:19'),
(2432, '103.143.183.250', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.invoice/42', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:20', '2024-01-19 23:31:20'),
(2433, '103.143.183.250', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:21', '2024-01-19 23:31:21'),
(2434, '103.143.183.250', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:23', '2024-01-19 23:31:23'),
(2435, '103.143.183.250', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:23', '2024-01-19 23:31:23'),
(2436, '103.143.183.250', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:23', '2024-01-19 23:31:23'),
(2437, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:24', '2024-01-19 23:31:24'),
(2438, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:31:25', '2024-01-19 23:31:25'),
(2439, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:32:18', '2024-01-19 23:32:18'),
(2440, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:32:18', '2024-01-19 23:32:18'),
(2441, '103.143.183.250', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-19 23:32:18', '2024-01-19 23:32:18'),
(2442, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:47:54', '2024-01-21 11:47:54'),
(2443, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:04', '2024-01-21 11:49:04'),
(2444, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:05', '2024-01-21 11:49:05'),
(2445, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:16', '2024-01-21 11:49:16'),
(2446, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:18', '2024-01-21 11:49:18'),
(2447, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:23', '2024-01-21 11:49:23'),
(2448, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:49:26', '2024-01-21 11:49:26'),
(2449, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:53:10', '2024-01-21 11:53:10'),
(2450, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:53:11', '2024-01-21 11:53:11'),
(2451, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:53:18', '2024-01-21 11:53:18'),
(2452, '119.148.40.121', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:53:48', '2024-01-21 11:53:48'),
(2453, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:54:01', '2024-01-21 11:54:01'),
(2454, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:54:07', '2024-01-21 11:54:07'),
(2455, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:54:07', '2024-01-21 11:54:07'),
(2456, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:54:14', '2024-01-21 11:54:14'),
(2457, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 11:54:16', '2024-01-21 11:54:16'),
(2458, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:07:31', '2024-01-21 12:07:31'),
(2459, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:07:33', '2024-01-21 12:07:33'),
(2460, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:18:31', '2024-01-21 12:18:31'),
(2461, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:18:33', '2024-01-21 12:18:33'),
(2462, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:18:38', '2024-01-21 12:18:38'),
(2463, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:18:55', '2024-01-21 12:18:55'),
(2464, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:22:07', '2024-01-21 12:22:07'),
(2465, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:26:48', '2024-01-21 12:26:48'),
(2466, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:26:56', '2024-01-21 12:26:56'),
(2467, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:28:14', '2024-01-21 12:28:14'),
(2468, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:28:17', '2024-01-21 12:28:17'),
(2469, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:59:01', '2024-01-21 12:59:01'),
(2470, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:59:05', '2024-01-21 12:59:05'),
(2471, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:59:07', '2024-01-21 12:59:07'),
(2472, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:59:14', '2024-01-21 12:59:14'),
(2473, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 12:59:16', '2024-01-21 12:59:16'),
(2474, '119.148.40.121', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:02:30', '2024-01-21 13:02:30'),
(2475, '119.148.40.121', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:02:32', '2024-01-21 13:02:32'),
(2476, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:03:54', '2024-01-21 13:03:54'),
(2477, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:05:33', '2024-01-21 13:05:33'),
(2478, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:08:59', '2024-01-21 13:08:59'),
(2479, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:15:36', '2024-01-21 13:15:36'),
(2480, '119.148.40.121', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:15:52', '2024-01-21 13:15:52'),
(2481, '119.148.40.121', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:18:23', '2024-01-21 13:18:23'),
(2482, '119.148.40.121', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 13:19:54', '2024-01-21 13:19:54'),
(2483, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:06:19', '2024-01-21 14:06:19'),
(2484, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:06:29', '2024-01-21 14:06:29'),
(2485, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:09:41', '2024-01-21 14:09:41'),
(2486, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:09:49', '2024-01-21 14:09:49'),
(2487, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:11:24', '2024-01-21 14:11:24'),
(2488, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:11:42', '2024-01-21 14:11:42');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(2489, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:13:09', '2024-01-21 14:13:09'),
(2490, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:14:49', '2024-01-21 14:14:49'),
(2491, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:15:21', '2024-01-21 14:15:21'),
(2492, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:15:27', '2024-01-21 14:15:27'),
(2493, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:15:35', '2024-01-21 14:15:35'),
(2494, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:18:33', '2024-01-21 14:18:33'),
(2495, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:18:44', '2024-01-21 14:18:44'),
(2496, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:18:52', '2024-01-21 14:18:52'),
(2497, '119.148.40.121', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:19:44', '2024-01-21 14:19:44'),
(2498, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:21:13', '2024-01-21 14:21:13'),
(2499, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:24:56', '2024-01-21 14:24:56'),
(2500, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:30:48', '2024-01-21 14:30:48'),
(2501, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:30:51', '2024-01-21 14:30:51'),
(2502, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:31:27', '2024-01-21 14:31:27'),
(2503, '119.148.40.121', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 14:35:56', '2024-01-21 14:35:56'),
(2504, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:10:01', '2024-01-21 16:10:01'),
(2505, '119.148.40.121', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:10:03', '2024-01-21 16:10:03'),
(2506, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:08', '2024-01-21 16:13:08'),
(2507, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:16', '2024-01-21 16:13:16'),
(2508, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:22', '2024-01-21 16:13:22'),
(2509, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:24', '2024-01-21 16:13:24'),
(2510, '119.148.40.121', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.delivery.create/42', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:34', '2024-01-21 16:13:34'),
(2511, '119.148.40.121', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:47', '2024-01-21 16:13:47'),
(2512, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:48', '2024-01-21 16:13:48'),
(2513, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:13:51', '2024-01-21 16:13:51'),
(2514, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:16:11', '2024-01-21 16:16:11'),
(2515, '119.148.40.121', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:16:22', '2024-01-21 16:16:22'),
(2516, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:17:13', '2024-01-21 16:17:13'),
(2517, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:17:15', '2024-01-21 16:17:15'),
(2518, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:25:04', '2024-01-21 16:25:04'),
(2519, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:25:07', '2024-01-21 16:25:07'),
(2520, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 16:49:44', '2024-01-21 16:49:44'),
(2521, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 17:00:24', '2024-01-21 17:00:24'),
(2522, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 17:00:27', '2024-01-21 17:00:27'),
(2523, '119.148.40.121', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 17:20:49', '2024-01-21 17:20:49'),
(2524, '103.143.183.244', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 19:13:54', '2024-01-21 19:13:54'),
(2525, '103.143.183.244', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 19:13:55', '2024-01-21 19:13:55'),
(2526, '103.143.183.244', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 19:14:01', '2024-01-21 19:14:01'),
(2527, '103.143.183.244', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-21 19:14:03', '2024-01-21 19:14:03'),
(2528, '103.143.183.244', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-22 23:13:06', '2024-01-22 23:13:06'),
(2529, '103.143.183.244', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-22 23:13:07', '2024-01-22 23:13:07'),
(2530, '119.148.40.121', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-23 15:38:21', '2024-01-23 15:38:21'),
(2531, '119.148.40.121', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-23 15:38:31', '2024-01-23 15:38:31'),
(2532, '119.148.40.121', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-23 15:38:43', '2024-01-23 15:38:43'),
(2533, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 13:21:42', '2024-01-24 13:21:42'),
(2534, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:21:10', '2024-01-24 14:21:10'),
(2535, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:33', '2024-01-24 14:34:33'),
(2536, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:36', '2024-01-24 14:34:36'),
(2537, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:36', '2024-01-24 14:34:36'),
(2538, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:36', '2024-01-24 14:34:36'),
(2539, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:42', '2024-01-24 14:34:42'),
(2540, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:44', '2024-01-24 14:34:44'),
(2541, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:46', '2024-01-24 14:34:46'),
(2542, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:34:48', '2024-01-24 14:34:48'),
(2543, '119.148.40.121', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:09', '2024-01-24 14:35:09'),
(2544, '119.148.40.121', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:23', '2024-01-24 14:35:23'),
(2545, '119.148.40.121', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:29', '2024-01-24 14:35:29'),
(2546, '119.148.40.121', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:29', '2024-01-24 14:35:29'),
(2547, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:32', '2024-01-24 14:35:32'),
(2548, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:34', '2024-01-24 14:35:34'),
(2549, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:34', '2024-01-24 14:35:34'),
(2550, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:35:34', '2024-01-24 14:35:34'),
(2551, '119.148.40.121', 'superAdmin.generated::W1Hs0w5FxxtXgG2W', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.todaySale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 14:36:03', '2024-01-24 14:36:03'),
(2552, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 17:06:47', '2024-01-24 17:06:47'),
(2553, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 17:24:59', '2024-01-24 17:24:59'),
(2554, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 17:26:03', '2024-01-24 17:26:03'),
(2555, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 17:26:03', '2024-01-24 17:26:03'),
(2556, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 17:26:03', '2024-01-24 17:26:03'),
(2557, '103.143.183.241', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 23:17:36', '2024-01-24 23:17:36'),
(2558, '103.143.183.241', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 23:17:38', '2024-01-24 23:17:38'),
(2559, '103.143.183.241', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 23:17:38', '2024-01-24 23:17:38'),
(2560, '103.143.183.241', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-24 23:17:38', '2024-01-24 23:17:38'),
(2561, '119.148.40.121', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 10:33:50', '2024-01-25 10:33:50'),
(2562, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 10:33:52', '2024-01-25 10:33:52'),
(2563, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 10:33:52', '2024-01-25 10:33:52'),
(2564, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 10:33:52', '2024-01-25 10:33:52'),
(2565, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:02:47', '2024-01-25 12:02:47'),
(2566, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:02:47', '2024-01-25 12:02:47'),
(2567, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:02:47', '2024-01-25 12:02:47'),
(2568, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:41:44', '2024-01-25 12:41:44'),
(2569, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:41:44', '2024-01-25 12:41:44'),
(2570, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 12:41:44', '2024-01-25 12:41:44'),
(2571, '119.148.40.121', 'superAdmin.sale', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:48', '2024-01-30 10:03:48'),
(2572, '119.148.40.121', 'superAdmin.sale', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:50', '2024-01-30 10:03:50'),
(2573, '119.148.40.121', 'superAdmin.sale.edit', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.edit/41', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:54', '2024-01-30 10:03:54'),
(2574, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:56', '2024-01-30 10:03:56'),
(2575, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:56', '2024-01-30 10:03:56'),
(2576, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:03:56', '2024-01-30 10:03:56'),
(2577, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:58:37', '2024-01-30 10:58:37'),
(2578, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:58:37', '2024-01-30 10:58:37'),
(2579, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 10:58:37', '2024-01-30 10:58:37'),
(2580, '119.148.40.121', 'superAdmin.sale.getcustomergroup', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getcustomergroup/8', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 11:18:10', '2024-01-30 11:18:10'),
(2581, '119.148.40.121', 'superAdmin.sale.getProduct', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 11:18:10', '2024-01-30 11:18:10'),
(2582, '119.148.40.121', 'superAdmin.sale.checkAvailability', 'Google Chrome121.0.0.0', '', 'https://myshop.webhatbd.com/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-30 11:18:10', '2024-01-30 11:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `user_id`, `from_date`, `to_date`, `note`, `is_approved`, `created_at`, `updated_at`) VALUES
(2, 1, '2023-10-11', '2023-10-12', 'day', 1, '2023-10-11 08:23:09', '2023-10-11 08:25:07');

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `checkin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `checkin`, `checkout`, `created_at`, `updated_at`) VALUES
(1, '9:45am', '5:45pm', '2023-10-11 07:18:24', '2023-10-11 07:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `image_uploads`
--

CREATE TABLE `image_uploads` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_uploads`
--

INSERT INTO `image_uploads` (`id`, `name`, `title`, `alt`, `caption`, `description`, `slug`, `path`, `status`, `username`, `extention`, `created_at`, `updated_at`) VALUES
(10, '3_1684060971.jpg', '3', '3', NULL, NULL, '3_1684060971.jpg', '3_1684060971.jpg', '1', 'superAdmin', '.jpg', '2023-05-14 04:42:51', '2023-05-14 04:42:51'),
(11, '2_1684129568.jpg', '2', '2', NULL, NULL, '2_1684129568.jpg', '2_1684129568.jpg', '1', 'superAdmin', '.jpg', '2023-05-14 23:46:10', '2023-05-14 23:46:10'),
(18, 'business_1688362561.jpg', 'business', 'business', NULL, NULL, 'business_1688362561.jpg', 'business_1688362561.jpg', '1', 'superAdmin', '.jpg', '2023-07-02 23:36:01', '2023-07-02 23:36:01'),
(20, '4_1692512057.jpg', '4', '4', NULL, NULL, '4_1692512057.jpg', '4_1692512057.jpg', '1', 'superAdmin', '.jpg', '2023-08-20 06:14:18', '2023-08-20 06:14:18'),
(23, '3_1703400840.jpg', '3', '3', NULL, NULL, '3_1703400840.jpg', '3_1703400840.jpg', '1', 'superAdmin', '.jpg', '2023-12-24 06:54:01', '2023-12-24 06:54:01'),
(24, '2_1703407027.jpg', '2', '2', NULL, NULL, '2_1703407027.jpg', '2_1703407027.jpg', '1', 'superAdmin', '.jpg', '2023-12-24 08:37:08', '2023-12-24 08:37:08');

-- --------------------------------------------------------

--
-- Table structure for table `loginhistories`
--

CREATE TABLE `loginhistories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_09_21_105619_create_sessions_table', 1),
(11, '2022_09_21_115841_create_roles_table', 1),
(12, '2022_09_21_115947_create_permissions_table', 1),
(13, '2022_09_21_120008_create_role_has_permissions_table', 1),
(14, '2022_09_28_114555_create_hitlogs_table', 1),
(15, '2022_09_28_114858_create_blacklists_table', 1),
(16, '2022_09_28_114942_create_whitelists_table', 1),
(17, '2022_09_28_115028_create_loginhistories_table', 1),
(18, '2022_09_28_121516_create_user_verifies_table', 1),
(19, '2022_10_03_111056_create_image_uploads_table', 1),
(20, '2022_10_06_155813_create_menus_table', 1),
(21, '2022_10_06_160153_create_menuitems_table', 1),
(22, '2022_10_06_162204_create_categories_table', 1),
(23, '2022_10_06_162304_create_posts_table', 1),
(24, '2022_10_06_162320_create_postmetas_table', 1),
(25, '2022_10_06_162334_create_pages_table', 1),
(26, '2022_10_31_144501_create_comments_table', 1),
(27, '2022_12_20_112205_create_sliders_table', 1),
(28, '2023_07_30_094637_create_brands_table', 2),
(29, '2023_07_31_053322_create_units_table', 3),
(30, '2023_08_01_054519_create_barcodes_table', 4),
(31, '2023_08_02_103317_create_prodcuts_table', 5),
(32, '2023_08_06_071205_create_products_table', 6),
(33, '2023_08_09_044405_create_warehouses_table', 7),
(34, '2023_08_09_105139_create_suppliers_table', 7),
(35, '2023_08_09_125205_create_product_warehouses_table', 8),
(36, '2023_08_09_130252_create_promotions_table', 8),
(37, '2023_08_09_144210_create_variants_table', 9),
(38, '2023_08_09_144312_create_producat_variants_table', 9),
(39, '2023_08_14_114216_create_product_variants_table', 10),
(40, '2023_08_14_120057_create_taxes_table', 11),
(41, '2023_08_02_114330_create_purchases_table', 12),
(42, '2023_08_27_110941_create_product_batches_table', 13),
(43, '2023_08_27_112234_create_product_purchases_table', 14),
(44, '2023_08_27_151523_create_payments_table', 15),
(45, '2023_08_27_151746_create_payment_with_cheques_table', 15),
(46, '2023_08_27_151820_create_payment_with_credit_cards_table', 15),
(47, '2023_08_27_160529_create_accounts_table', 16),
(48, '2023_08_28_142156_create_returns_table', 17),
(49, '2023_08_28_142425_create_return_purchases_table', 17),
(50, '2023_08_28_142557_create_purchase_product_returns_table', 17),
(51, '2023_09_07_122606_create_sales_table', 18),
(52, '2023_09_07_122916_create_billers_table', 18),
(53, '2023_09_07_132010_create_product_sales_table', 19),
(54, '2023_09_07_132309_create_customer_groups_table', 19),
(55, '2023_09_07_132421_create_customers_table', 19),
(56, '2023_09_07_141928_create_payment_with_gift_cards_table', 19),
(57, '2023_09_07_142050_create_gift_card_recharges_table', 19),
(58, '2023_09_07_142121_create_gift_cards_table', 19),
(59, '2023_09_07_143006_create_reward_point_settings_table', 19),
(60, '2023_09_07_143125_create_pos_settings_table', 19),
(61, '2023_09_07_150432_create_deliveries_table', 20),
(62, '2023_09_07_153449_create_cash_registers_table', 21),
(63, '2023_09_10_122513_create_discounts_table', 22),
(64, '2023_09_10_122734_create_discount_plans_table', 22),
(65, '2023_09_10_123545_create_discount_plan_customers_table', 22),
(66, '2023_09_10_142423_create_discount_plan_discounts_table', 23),
(67, '2023_09_13_105052_create_coupons_table', 24),
(68, '2023_09_13_111427_create_couriers_table', 25),
(69, '2023_10_02_121614_create_general_settings_table', 26),
(70, '2023_10_09_143537_create_product_quotations_table', 27),
(71, '2023_10_09_144232_create_quotations_table', 27),
(72, '2023_10_09_144322_create_product_returns_table', 27),
(73, '2023_10_09_144536_create_product_transfers_table', 27),
(74, '2023_10_09_144626_create_payrolls_table', 27),
(75, '2023_10_09_145359_create_expenses_table', 28),
(76, '2023_10_09_145451_create_expense_categories_table', 28),
(77, '2023_10_09_145645_create_notifications_table', 28),
(78, '2023_10_09_151111_create_transfers_table', 28),
(79, '2023_10_10_171947_create_money_transfers_table', 29),
(80, '2023_10_11_094947_create_hrm_settings_table', 30),
(81, '2023_10_11_111629_create_employees_table', 31),
(82, '2023_10_11_112202_create_departments_table', 31),
(83, '2023_10_11_112234_create_stock_counts_table', 31),
(84, '2023_10_11_112255_create_deposits_table', 31),
(85, '2023_10_11_112329_create_holidays_table', 31),
(86, '2023_10_11_113632_create_attendances_table', 31),
(87, '2023_11_06_123757_create_adjustments_table', 32),
(88, '2023_11_06_124838_create_product_adjustments_table', 32);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `money_transfers`
--

INSERT INTO `money_transfers` (`id`, `reference_no`, `from_account_id`, `to_account_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'mtr-20231012-050856', 1, 2, 2001, '2023-10-12 11:08:56', '2023-10-12 11:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03b93a10ef959fb32cbb8e141a444f248d2355d431408d17fae87c1b2a4d698966d20c5f83bc29fa', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-04 22:17:06', '2023-07-04 22:17:06', '2024-07-05 04:17:06'),
('04045bcc87b4b9e9454666bbda2449504e5a8323bb7bb4b26c2306cb042a378c448031224bb0f715', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-10 04:06:40', '2023-08-10 04:06:40', '2024-08-10 10:06:40'),
('046df14b674db013d797d91c7aa9bff3b27105f553844b7e8707e473b6839348f362d3da701ae8cf', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-14 12:55:15', '2024-01-14 12:55:15', '2025-01-14 18:55:15'),
('05f76ddd704ac678d104fb086f7491cdf55bcced6c42d4b5ec883c51f16413c5b07fbdbd285d93fe', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-12 04:15:19', '2023-10-12 04:15:19', '2024-10-12 10:15:19'),
('0b189dd7c01ce6d955d5c1d0081a6c4ffaf2a148077eff5bea487f3cf714e66fac05def729ec030b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-01 22:06:28', '2023-07-01 22:06:28', '2024-07-02 04:06:28'),
('1192f94a3f26983e8dec5f200db7a291ce928d5c58af4ada644c7625ed0d2e490510efe0ee0241c6', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-17 22:22:25', '2023-05-17 22:22:25', '2024-05-18 04:22:25'),
('1264a915d566f13ae87ff657628c54e9a0d37d3c339e5cd6f1adf6c5584001845d2f7ee2e191fa25', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-22 04:06:31', '2023-08-22 04:06:31', '2024-08-22 10:06:31'),
('130c19861501c51fe4e67fb3862464872fde83031efc24f0f9997c4fa002083e747cb36368c7738b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-21 04:03:09', '2023-08-21 04:03:09', '2024-08-21 10:03:09'),
('13ed8c7d129bdfc77d88be8c46342c0e65bc7841bcd4aaac8715851659636e519c384e889fb9d567', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-19 22:10:47', '2023-07-19 22:10:47', '2024-07-20 04:10:47'),
('14e2e2df6be8851da8e37791142b22b3fd746aa7966e86035ee2cbe4d98bb5460a076c8b482d3257', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-25 04:13:11', '2023-06-25 04:13:11', '2024-06-25 10:13:11'),
('17615c3236326a013d05625c0b3d3c099f5036c2f1ed401962f5290f6f1e3d2cb511d6749721b318', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-27 04:18:58', '2023-08-27 04:18:58', '2024-08-27 10:18:58'),
('18e9dc8ad69fe06959fe716418b72678e956639c6c9537500444c7a1d9c8577d5ec1c1e00f8c8ff2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-17 03:37:54', '2023-10-17 03:37:54', '2024-10-17 09:37:54'),
('19a369599238bd9aed1e28af797f0a05bde16c816239799e8758805111d8e8b32e780a952b402565', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-19 04:02:52', '2023-09-19 04:02:52', '2024-09-19 10:02:52'),
('1ab1171e5b103bde53cb963c397061c1211f85fa4cd33e8aff3e33e946f8899bee95719f033318f9', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-26 04:02:39', '2023-09-26 04:02:39', '2024-09-26 10:02:39'),
('1abcced48c1c9f3e4f52740a8eabbdb5170377a9298a09c1bfb6eb89b0b5f4081788bb4d46a8c4c0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-31 03:18:24', '2023-07-31 03:18:24', '2024-07-31 09:18:24'),
('1b2e0d0ec255c7e4b9e64277e4c532e4cd61b083661b516b129d414fb588f3b0931d4b2b0b5e1826', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-06 01:04:15', '2023-08-06 01:04:15', '2024-08-06 07:04:15'),
('1bb78fa82893f0720b2f468c81384bc4190663259797e990ef6a8ba9c74633672b432fbddc545368', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-19 03:48:19', '2023-10-19 03:48:19', '2024-10-19 09:48:19'),
('1f2cb88de58b9471193c5662c965fe0f4864eaf11d634c019278c96e9065698377a654432105605f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-03 22:14:04', '2023-07-03 22:14:04', '2024-07-04 04:14:04'),
('1f57121af86af9326c4d351916a55550319ab34b2cb2dd87cb836f6054c39f3214dc9c6ae0c87579', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-14 06:30:11', '2024-01-14 06:30:11', '2025-01-14 12:30:11'),
('252e97d7fbafff46e413d6648a30a19c529bc06478ac0a6280ff2947c3e70d5029c09c58b5d862de', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-07 03:33:51', '2023-11-07 03:33:51', '2024-11-07 09:33:51'),
('25c33d02893e7c0c7b0b8d919fcaa54f0b307180eb7d04ca597b5226b843b5036cc38e10ba036139', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-02 03:34:30', '2023-11-02 03:34:30', '2024-11-02 09:34:30'),
('266bc75f802e42eb3a0fe6ca49f4ad6c0bd46f1f7c318591e5197fba391e2b0f0404cb2318a0797d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-30 02:32:35', '2023-07-30 02:32:35', '2024-07-30 08:32:35'),
('2719441ceb9b3044a4632f4806bb250d50660a7f2603961582f655d3c88aec60a421576d30fc48ac', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-01 03:38:26', '2023-10-01 03:38:26', '2024-10-01 09:38:26'),
('2b6bef6c1cf7c5e459187dc99c54a71b850db4de67e8a1d5fd03b9095db8b253984536dd403a8637', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-05 03:51:19', '2023-10-05 03:51:19', '2024-10-05 09:51:19'),
('2e2939eb1502fe462bb6e08cb4bcfb69bfa999fd3f48a1dd29b18487abe13aee9dccfab9318ce2c6', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-17 04:04:38', '2023-08-17 04:04:38', '2024-08-17 10:04:38'),
('3123da8a1334730b023825f8e431011c3d4b3b00bc4725faeb37f4ff320db477495d254d8581d798', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-08 03:44:05', '2023-11-08 03:44:05', '2024-11-08 09:44:05'),
('32f7639486d7acdf6e06973136965f125d61ec554913da139dbfd16e1a9fb9889ada3e0c006ecb13', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-05 21:57:28', '2023-07-05 21:57:28', '2024-07-06 03:57:28'),
('33d322261063fc1125cd921b814cd4a33ba390ddb583efa6a312d55c4854546b2f15281e696e1208', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 22:21:56', '2023-07-25 22:21:56', '2024-07-26 04:21:56'),
('39cf6708060c521780f9cb5db955a72e41c73701c1ae19caebc4e78757248e8b365dfaa4ae6bdfb1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-08 03:39:56', '2023-10-08 03:39:56', '2024-10-08 09:39:56'),
('3d29479512bf3c2faefb9e96b6e7615f5820deea09007b3d7b5e76bc4921bbbe83c478109fe118de', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-29 22:08:55', '2023-07-29 22:08:55', '2024-07-30 04:08:55'),
('4016ab552d5c6f3261db23de5d84e8fd0a2c2fc8ae223fd7c293c24e5cb986918a0cfaf520fa04fe', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-16 04:03:01', '2023-08-16 04:03:01', '2024-08-16 10:03:01'),
('466a985b963f6fa4149d5fc41207cced8fe4385350434fc15a1c0c2370268a040fab648883df7799', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-30 22:08:27', '2023-07-30 22:08:27', '2024-07-31 04:08:27'),
('47b2ea10bc7eec9ef29174ec220d5f1f3adda3a3a6823399d654de2ea0121242a9430179e381f889', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-24 03:59:29', '2023-09-24 03:59:29', '2024-09-24 09:59:29'),
('4935f2fcf2a66fffcf2b5ea607192cd7998d4d3eaa316b702fc750d8877cfd866cc106c175c335b5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-31 03:26:38', '2023-10-31 03:26:38', '2024-10-31 09:26:38'),
('4f3b3c794aacd7646e5f1b43dce37cc87657f12e95f30cd6dd8c76c98717d8977b444bdc2ecd735f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-13 23:01:55', '2023-05-13 23:01:55', '2024-05-14 05:01:55'),
('4f606509335abfb0b9d35bb6400b8d7585e34febbf4a593c4d5f4328fa8ad4b5935912ebf6b828d5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-20 04:13:07', '2023-08-20 04:13:07', '2024-08-20 10:13:07'),
('502b7aa571d807e7412d40c281002bc38aa95f864c6523d723b0fb926fc525bb9545f3e218388258', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-18 03:40:08', '2023-10-18 03:40:08', '2024-10-18 09:40:08'),
('53edc59593b8a7841d03810a9ea3df3e0330b42b15e7a10effb2c32c14ed6943a08be76e45c59f3f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-16 22:26:45', '2023-07-16 22:26:45', '2024-07-17 04:26:45'),
('543eab7926a569fa77420e71d81b8e10ae2d27cf5605814376abf83285372ba894b06c4b9ef0bdc0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-07 22:07:28', '2023-08-07 22:07:28', '2024-08-08 04:07:28'),
('54b41c6e203603b1cadd83f90e64a2795ef36c51833c84a4fbba05327db45cec589bd96480bf5de3', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-18 04:00:55', '2023-09-18 04:00:55', '2024-09-18 10:00:55'),
('54d96fe30d51a198bcd8158634051a8915c7e904aee9d2be8f9dd7fb853f08930733536a89770ea0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-08 09:43:52', '2023-11-08 09:43:52', '2024-11-08 15:43:52'),
('57295cf1bbdd0dfa727a24c1d39b8fcb5ee56b37d5fd291e67d2e76134b1ee0d77629df0ad7d5be6', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-13 04:31:17', '2023-09-13 04:31:17', '2024-09-13 10:31:17'),
('608dafa480f1e0dd53f0344bb53c0d92d147a3a7458a892d680c4369b9e06590ae94bc6fe6bbc70b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-08 22:16:47', '2023-08-08 22:16:47', '2024-08-09 04:16:47'),
('613d32b4c9f5b54e253d69d387a363f66f953bd14d0e8e8bc978a038eb7ca70a0c4535ebc3fa7e47', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-11 00:15:25', '2023-05-11 00:15:25', '2024-05-11 06:15:25'),
('624bbcd6149b6ed1cebac57c892d1cc13192d4f24cf59296d75a4e7c1f3eec39daceaf848109809f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 06:43:39', '2023-07-25 06:43:39', '2024-07-24 23:43:39'),
('632a4cbec56899a5ad39051dc9cf75bb1928d710ff3748914f4ea8fa7a461e13c1f0572193803888', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-10 15:50:22', '2024-01-10 15:50:22', '2025-01-10 21:50:22'),
('649d97ec88071698ae9475e344151886b872fb23a790f330df84e331a3c4b6463d2a33bcaa07b271', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-13 04:10:23', '2023-08-13 04:10:23', '2024-08-13 10:10:23'),
('64dfd96682c5454c31eeb062e2c120ec73e2c945d9bfb0f67a2af42881dd71a5b7d48aed1a2f1977', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-19 22:16:41', '2023-06-19 22:16:41', '2024-06-20 04:16:41'),
('65b9526d928d30e1cd5d22b2fe22dea3513b31b58c2906fe649b1bf11724b1ea14afe872f230f575', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-12 22:59:55', '2023-07-12 22:59:55', '2024-07-13 04:59:55'),
('6ada533a3ab807221f59df57e2e98afb6ce99a3ca9a189246d41a858b41f9379c3e4279c96bbb739', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-15 03:43:50', '2023-10-15 03:43:50', '2024-10-15 09:43:50'),
('6b308cbaa30e86c3f0a2adb034d6250b1db0106102b69059a463a3fbf245933a6cb5c09735a737d1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-29 06:57:21', '2023-10-29 06:57:21', '2024-10-29 12:57:21'),
('6cbf59acbfd50c6b37c803270679e18726641e86bfb20e488bce1b190ed77953d7dd6f5d7aa7cafb', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-14 04:22:09', '2023-08-14 04:22:09', '2024-08-14 10:22:09'),
('6f499b94a43c89b8a554fe8803187ae6660f08158de9fd357a96785bd187ff7a2d41a0b35cd92ad7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-24 04:59:28', '2023-12-24 04:59:28', '2024-12-24 10:59:28'),
('6f80f6891e8a71910f54fdb97c790e5f854c79dc230da3103238a35fc4f9f47caf9cd6f164f79f49', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-11 04:38:12', '2023-09-11 04:38:12', '2024-09-11 10:38:12'),
('75571cc31701a81cc735c5fcc7a9b84df3a67392f54c6ed94de7d8d3910bea72e2462009c5f86c67', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-23 03:51:02', '2023-08-23 03:51:02', '2024-08-23 09:51:02'),
('78ad9d7d025ce726a6d0d76d9c1eb6bfb1e8518de8675244e9223396c84a619c38835cb3445a6cb5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-01 03:41:20', '2023-11-01 03:41:20', '2024-11-01 09:41:20'),
('79156e0ce3382c1eaef29e422bddbda8b94a6e2660e122e2de90156833189f03b91ef0a38110fd26', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-03 04:08:49', '2023-09-03 04:08:49', '2024-09-03 10:08:49'),
('7cc2faed087915d4923b13ef4a9c73230cd878cb6a1070b92b0d5c4e3ea2a4ac0e62455b3e82206a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-24 06:32:56', '2023-08-24 06:32:56', '2024-08-24 12:32:56'),
('7ecda71e725f4b1743af695704ab3742dfdea39c4df85a353f0ff5a7b1addc08e305339c8578caf2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-20 22:23:58', '2023-06-20 22:23:58', '2024-06-21 04:23:58'),
('7f05a3679667e3da26939adbea42b521afa5fac78be4616c13319d3afe27996514b4e3ff08184590', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-02 08:15:33', '2023-11-02 08:15:33', '2024-11-02 14:15:33'),
('7fe3f74f411dc0fb4e0e830a03855b3d6cbbae3b7ee753e322b606b7289c53d25cf843fa14476aad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-05 08:18:08', '2023-11-05 08:18:08', '2024-11-05 14:18:08'),
('81183cc3ca452fd5fd766ebf98d6e02c38c28e8bcb106ffbb5f04a5da78bba5a8941944db7e9f2a1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 06:18:49', '2023-07-25 06:18:49', '2024-07-24 23:18:49'),
('8263299e9bfafbe707cf02a33057ad15438d24f8978ee961d26f7785418b6c7dd21a7622fb07370f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-08 22:13:49', '2023-07-08 22:13:49', '2024-07-09 04:13:49'),
('8267847975b6e6d87e41e21857ae7f0997e7dfa163fdb0e18c7ed40f389e2cb21d04c9b77f0a1a95', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-14 04:23:22', '2023-09-14 04:23:22', '2024-09-14 10:23:22'),
('84b0405dcfc58827501efccc95bf71db9ec12d713a35bdcc0e424427e0fe694d3ed5ae5b9aa5ea80', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-11 12:59:13', '2024-01-11 12:59:13', '2025-01-11 18:59:13'),
('851aba8bd96181bc2e5fbe69c1e0af7b3fddc7627a2d59d48cb0adbe4220611d90c9504d9917f0b7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-03 04:31:15', '2023-08-03 04:31:15', '2024-08-03 10:31:15'),
('86275149a93822c71d39f4d8044716b68c411c59dbb2ca3600f10466074d951d1e65011bcf34234a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-23 03:20:52', '2023-10-23 03:20:52', '2024-10-23 09:20:52'),
('8b68c9e009c94fedfd4735d97a49db6a92ab29e07e80cedc6e0a910cb027f30ada71ad077bd98903', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-04 03:35:48', '2023-10-04 03:35:48', '2024-10-04 09:35:48'),
('8b77067adac1687f3ab1452ae2f2f78bd1665d33f769f115516f54d309fdf0ce0563248cc73dfafe', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-09 22:03:20', '2023-07-09 22:03:20', '2024-07-10 04:03:20'),
('8d01819c714dfe8559125040ad6075d2f3a790be5daa7be45b178c92e97172176fdeeb769f86cd11', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-14 10:09:02', '2023-09-14 10:09:02', '2024-09-14 16:09:02'),
('8faaedeaf778f113010f225e240ceb1aded88c62224b25b76c34fc5fd3c17c9dfde216e470cb5ef8', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-15 22:15:39', '2023-07-15 22:15:39', '2024-07-16 04:15:39'),
('911701a713244cf5463f6c6f50f33d228efae57aa074a1ca269c6a46004ceec221bd62692d58e430', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-12 02:39:40', '2023-07-12 02:39:40', '2024-07-12 08:39:40'),
('913db499406c47bd7bd5bd81cd248dc136c0d5ee41b2ca8e247190383545c9acfb3321aa9fc25599', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-09 04:08:31', '2023-10-09 04:08:31', '2024-10-09 10:08:31'),
('919657a3040559a0edd781be2e22d90c7577cc45770b4a7028d39fe4c12f952ed53d5a598d04ffad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-24 08:32:55', '2023-12-24 08:32:55', '2024-12-24 14:32:55'),
('93161029e257b4ef36f5079ff4dd803d1720c563a9a15ff7bd13045417a5acbcc8985ba10ffc4c07', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-05 03:40:03', '2023-11-05 03:40:03', '2024-11-05 09:40:03'),
('942a20b684fe73162f6e27d3be06936b21f33841e94eaa2e8baac1b909aff5842d739a48b4aea0a7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-22 22:17:21', '2023-07-22 22:17:21', '2024-07-23 04:17:21'),
('96aa579d2666e1dfbbd0ed2a7d980238da5bb48c1c40d0eb266eadb51e0dd4451a64c31429e67961', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-15 09:34:00', '2024-01-15 09:34:00', '2025-01-15 15:34:00'),
('979f0c883120fa961658969511d28b18e05792c8ce9cccc1a2c7b604c67e924bef2a0784b7733427', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-01 22:46:01', '2023-08-01 22:46:01', '2024-08-02 04:46:01'),
('9869ddccdfa4c9f024c8620e6372fbe3b166e8b583afebf198501837a9d97789211b214191398f8d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-12 03:56:22', '2023-09-12 03:56:22', '2024-09-12 09:56:22'),
('9b4fb0a528bbcf2a099a9c77707f9a4c2ea6a404f2eb7b7f9f9d25523cc18f2e855a0b7f8fd44011', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-17 23:41:46', '2023-07-17 23:41:46', '2024-07-18 05:41:46'),
('9c4ccb0472855246ffc021d9db09823192a1a31c9e0620dafd64235e5dfed362b2d994788cd448ad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-18 22:29:07', '2023-06-18 22:29:07', '2024-06-19 04:29:07'),
('a0b6e27ee1eb90ee325e0df101a0273f3eddb6257c51d9bee6f412525525b427f06893e757364de0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-15 21:58:58', '2023-05-15 21:58:58', '2024-05-16 03:58:58'),
('a419b726fbcd096c0ff50b59f867fcb7001722fb2d55bbb8cbb63425dbd15c36e2a92aa07cb9632d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-21 22:23:07', '2023-06-21 22:23:07', '2024-06-22 04:23:07'),
('a496dd1d15b1c103f7ef59419e75db5ba13df91e1e7fb2fe5a97e054fadf7eed235200a96b26c624', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-12 18:36:48', '2024-01-12 18:36:48', '2025-01-13 00:36:48'),
('a6cc1e34588985ce2450a27e27be74de35b8189d65e601f12c033e7fbd1a4d9ef0e8e63feb744a14', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-28 04:12:07', '2023-08-28 04:12:07', '2024-08-28 10:12:07'),
('a7ef0d359c2614626db66bf9386bc00c23a294b4ea5abcf2958dfce7d15feacaf2b1ac0269ccae4f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-31 03:59:08', '2023-08-31 03:59:08', '2024-08-31 09:59:08'),
('a9bdc3ad7642ca411256c21a6ecdcec81fa9de7de3f8c854f9b475823dda41d1404955816562cd40', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-11 03:36:56', '2023-10-11 03:36:56', '2024-10-11 09:36:56'),
('aa7d802f79c98716f1bb78dbf75a2cdc9ac7f29f462e4e933bfda89acf7acbf8647e363ee1f1603a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-11 00:30:26', '2023-05-11 00:30:26', '2024-05-11 06:30:26'),
('aba523c584e154bf0213f66e6bd19400c0ee123fd865f1bb461f3b88ba1c0e769fdf08b3a872325d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-29 03:56:22', '2023-08-29 03:56:22', '2024-08-29 09:56:22'),
('abec709337757c0847d7af498ee30d6c3428982b51fe8569600b27b328ce6e91e3284b1945aea30c', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-30 03:49:34', '2023-10-30 03:49:34', '2024-10-30 09:49:34'),
('ad5fc96b2024ff5365db04b858b965de98d446036596e9cf444283c0ec741a3edd577fc9fc08e45a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-21 04:11:48', '2023-09-21 04:11:48', '2024-09-21 10:11:48'),
('ae3d44a91cfa9cab206ba2d3b70dfeda4a8b93878ada9a3aebd9ebfe48cd436fabd93ae85c737ea2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-06 04:20:31', '2023-11-06 04:20:31', '2024-11-06 10:20:31'),
('b23b7b27c5806f503f371b4b7d97feba66ed46c1b7b442f0d7d03bd741965ed63f0e5a458d357afc', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-15 11:24:15', '2024-01-15 11:24:15', '2025-01-15 17:24:15'),
('b35a15390c20d4d46114b0606c788e4b99989fefe75d61f6e1afc133d4ee22d709f7e4bba9781a48', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-02 22:08:31', '2023-07-02 22:08:31', '2024-07-03 04:08:31'),
('b364aaba03ce87b4cae7b66021ab4f33bc5fd793793b7d57ffb0f000e05f7f78bda3df1452040252', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-25 22:17:22', '2023-06-25 22:17:22', '2024-06-26 04:17:22'),
('b9ea161aac6a836885be3746ab69dfeeb65a51cbe41b029dec1c10598784760ef23e3f43f22f98d4', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-30 04:05:26', '2023-08-30 04:05:26', '2024-08-30 10:05:26'),
('bfb95434ce9ac118f3da9bcfa2ad2dc4a644fe1f5bd20da0c10f25bdf78c926524d30892669fef3b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-20 04:02:07', '2023-09-20 04:02:07', '2024-09-20 10:02:07'),
('c15a819d9d4db862eae65794769b00e957b9117a6c236a353bbc3b3eaf570c367f639774dd537a59', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-11 22:20:33', '2023-07-11 22:20:33', '2024-07-12 04:20:33'),
('c1cb6bfb3abcb05d40d3ebb18617d125610c53dd960fa0d22fed49467ea9a62e4f21aa73027c4232', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-05 08:47:10', '2023-11-05 08:47:10', '2024-11-05 14:47:10'),
('c2230c49f28fe254f47ee68614067e7d5553b3eac23854863139e73b4f81027eb2f0b1b796aa46cc', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-17 23:46:40', '2023-06-17 23:46:40', '2024-06-18 05:46:40'),
('c228b051e9016f6e6b35e85ea4edc0aad4b32c02cba536fa58b2a520c7cee06ec8d53f1eb02f5727', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-12 22:19:48', '2023-07-12 22:19:48', '2024-07-13 04:19:48'),
('c28c52f4728668f7a5da011b39cce9814a130cb591bd208f3f923e1b89ddb97bf0c749348bf51936', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-16 03:36:52', '2023-10-16 03:36:52', '2024-10-16 09:36:52'),
('c31748dbe82d184e61133be4718c2cdee6534993fc4bce3455353894339014a57a1b562df73b9eee', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-26 22:00:26', '2023-07-26 22:00:26', '2024-07-27 04:00:26'),
('c56e4413e0f9e05f17d81eeaf3408f76eb9deb1c4b5d7d93e312cb11d7fb7f0a777ac5c798a6388b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-27 03:58:25', '2023-09-27 03:58:25', '2024-09-27 09:58:25'),
('c7048127910757d5f02934edb763bac934f2a9ca8305b49ceac989704c376840f5eeffd3d122679e', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-11 00:36:29', '2023-05-11 00:36:29', '2024-05-11 06:36:29'),
('c93868e15f841a56a8d6c6826c8b8023b2dec805d52e5af6f7d0f72a98d6be6f7bf881dabb7e383d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-17 01:14:14', '2023-05-17 01:14:14', '2024-05-17 07:14:14'),
('cc193f02fa98a2ef77bf12e57286c7f97c482b992a07750a5badb7747f783b179cdd5bf4bff021a2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-14 22:08:52', '2023-05-14 22:08:52', '2024-05-15 04:08:52'),
('cc2df446fa1a170f912b93bec7c6343b286298ab94944b5103e2afabd153ecc44500a8d2beb7ad3f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-26 01:04:03', '2023-07-26 01:04:03', '2024-07-25 18:04:03'),
('ccfbe27e1a1b0375b6fd93f51c06b3e5f5929cb8f3c4e6fc314b2603577285f8c6964f362e122578', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-13 15:25:31', '2024-01-13 15:25:31', '2025-01-13 21:25:31'),
('d2e724bd3c7fe6c31065e687734fa0aadd1c5cbc06a48e6a034d88ece911821c17ec4bee85d75d4d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-10 04:19:17', '2023-09-10 04:19:17', '2024-09-10 10:19:17'),
('d4ea416ce5bc1e12968348a7d1ab49327fc1774d83144a7ab0c31a2ba318936a2697579087cc3472', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-07 08:37:24', '2023-11-07 08:37:24', '2024-11-07 14:37:24'),
('d6afabbad7e57512a30efe34e4040919cd1532deb3ca76e037ba58a814dbb206e6127dca3e9d0107', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-02 03:44:39', '2023-10-02 03:44:39', '2024-10-02 09:44:39'),
('d6f82c6429c79aefa4295ea8f4d45554c2de0662bf25b8f0b5fc3b37b443db96b93a1803c1c1ae4f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-07 04:24:56', '2023-09-07 04:24:56', '2024-09-07 10:24:56'),
('d98441766ce45d3bdcf4be7e905e060e98650251f803806f4e68af1b8440ad506a22b2de7b9edb37', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-03 03:31:08', '2023-10-03 03:31:08', '2024-10-03 09:31:08'),
('d9bb4ebe133fb1cfe81f9d42c646ace89447c2081d1f876070945d6d9954bb63a5f7a37350d75888', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-09 03:34:25', '2023-11-09 03:34:25', '2024-11-09 09:34:25'),
('da92cc2e6d27e1dabfde519f1f5d8119a5abf266dfdf1a2e595d23cd76fe1185c502f90d13cd46a2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-22 03:31:45', '2023-10-22 03:31:45', '2024-10-22 09:31:45'),
('dee69f56ae9849aacb99fcad1f2bda7ca7ea063aba04ea251cf3a0a85157582ace0095aa025ddf4f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-10 22:12:43', '2023-07-10 22:12:43', '2024-07-11 04:12:43'),
('e026da801225ee44a021a69261b7b415bc0c3e307d90f0e8cb89bc7f2577a254aa58d8e254d1f111', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-06 22:05:15', '2023-08-06 22:05:15', '2024-08-07 04:05:15'),
('e35b35c1defb0f7c6dda46add7f3d1c218e7bf7691a59c42f5f21ea51cd5f2f1b5edaedad585b612', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-10 03:38:08', '2023-10-10 03:38:08', '2024-10-10 09:38:08'),
('e46f8119d237fce2fcd5b312a63f46e9d972a1bd4a940fdfac62c1e4f94840d84a1515e27b33dff1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-25 04:00:07', '2023-09-25 04:00:07', '2024-09-25 10:00:07'),
('e7017f18b32aabcb0d6b1c1332acc450390c85d3cde61d1a5bc5a3522a05352f7f3f01c3463f470d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-02 22:11:25', '2023-08-02 22:11:25', '2024-08-03 04:11:25'),
('e74b55e655559e88a3aa38803c8388d6d1163ab6acceac60d97c8b47a2bcedde396e49184c6ddc82', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-31 22:27:31', '2023-07-31 22:27:31', '2024-08-01 04:27:31'),
('e8829d6924773c9cf643e8398460a478dc3a0dc8572b9d787f64e88ecb0114082977741eba01e569', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-14 00:08:23', '2023-05-14 00:08:23', '2024-05-14 06:08:23'),
('e8b6d7719bfaf02dc637ceebbe88b8b2fecf51de241b63fccfa001eed28d867e0f358ecd9bc016c9', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-15 10:04:54', '2024-01-15 10:04:54', '2025-01-15 16:04:54'),
('e9539971042b1676c79a46ea566a0c00852c909957bc0d1cd50eddd52d8340509942289251657c73', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-24 22:11:43', '2023-06-24 22:11:43', '2024-06-25 04:11:43'),
('ece6ce0fe35d778d86a3a1ff1821096783a125df2428fe1d23a03b051beef22517e42444cf852ec2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-17 04:08:06', '2023-09-17 04:08:06', '2024-09-17 10:08:06'),
('eea5b82b9f5816a76366c9b40bdc95311b0c6628e5591170624f9b0b2087e096c9d89e3a0ab916ab', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-04 04:19:28', '2023-09-04 04:19:28', '2024-09-04 10:19:28'),
('f0ec6a0213917dcd7f847b662cbc273e367d613689b4946fc8df2bdf33270c7398f17b3a20a2afda', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-05 04:08:35', '2023-09-05 04:08:35', '2024-09-05 10:08:35'),
('f3d90947f9bbfdbd56bcbdab082fb63174e1f526bc7e7587e283470a8269cc80c4902808a57e5f08', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-26 03:57:05', '2023-12-26 03:57:05', '2024-12-26 09:57:05'),
('f66e24cacf9722d6c1991f34d1e9099ec98dd5369616bcaebcbd0739cb0633e8fbd63fa2878fb6a7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superadmin@gmail.com', '[]', 0, '2024-01-12 15:09:11', '2024-01-12 15:09:11', '2025-01-12 21:09:11'),
('f7238aad3b4f4645922fa2a500f59a7899d1d826266892fceb74d7e8c438860fd8893fabe0627008', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-18 22:23:57', '2023-07-18 22:23:57', '2024-07-19 04:23:57'),
('f7b9d966ac97c5ce0a1349b2042382a01d07e65773178a6e07ff9efa938f6613b0e63cb46b9a882f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-17 22:27:46', '2023-05-17 22:27:46', '2024-05-18 04:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9923b022-0553-42b7-a9e4-97e4a1fd5888', NULL, 'Laravel Personal Access Client', 'joYFnK5X2HQAZQzopEASdz8rK0ilfRslOkwpLBl8', NULL, 'http://localhost', 1, 0, 0, '2023-05-11 00:12:59', '2023-05-11 00:12:59'),
('9923b022-5963-437b-ab75-e77c52b86340', NULL, 'Laravel Password Grant Client', 'w4wMrHETtmJDfa1ntQQ1Nez6tdKME4oW2o3WHe9e', 'users', 'http://localhost', 0, 1, 0, '2023-05-11 00:12:59', '2023-05-11 00:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', '2023-05-11 00:12:59', '2023-05-11 00:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `privatepage` tinyint(1) NOT NULL DEFAULT '0',
  `publish_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` int DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `cash_register_id` int DEFAULT NULL,
  `account_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `paying_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_reference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `change` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sale_id`, `purchase_id`, `cash_register_id`, `account_id`, `user_id`, `paying_method`, `payment_reference`, `used_points`, `amount`, `change`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, NULL, 3, NULL, 1, 1, 'Cash', 'ppr-20231224-124301', NULL, 1, '0', NULL, '2023-12-24 06:43:01', '2023-12-24 06:43:01'),
(2, NULL, 2, NULL, 1, 1, 'Cash', 'ppr-20231224-124308', NULL, 1, '0', NULL, '2023-12-24 06:43:08', '2023-12-24 06:43:08'),
(3, NULL, 1, NULL, 1, 1, 'Cash', 'ppr-20231224-124315', NULL, 1, '0', NULL, '2023-12-24 06:43:15', '2023-12-24 06:43:15'),
(4, 1, NULL, 1, 1, 1, 'Cash', 'spr-20231224-023634', NULL, 1, '0', NULL, '2023-12-24 08:36:34', '2023-12-24 08:36:34'),
(5, 28, NULL, 1, 1, 1, 'Cash', 'spr-20240114-024100', NULL, 150, '0', NULL, '2024-01-14 08:41:00', '2024-01-14 08:41:00'),
(6, 27, NULL, 1, 1, 1, 'Cash', 'spr-20240114-024509', NULL, 150, '0', NULL, '2024-01-14 08:45:09', '2024-01-14 08:45:09'),
(7, 26, NULL, 1, 1, 1, 'Cash', 'spr-20240114-024522', NULL, 100, '0', NULL, '2024-01-14 08:45:22', '2024-01-14 08:45:22'),
(8, 25, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025621', NULL, 40, '0', NULL, '2024-01-14 08:56:21', '2024-01-14 08:56:21'),
(9, 24, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025631', NULL, 150, '0', NULL, '2024-01-14 08:56:31', '2024-01-14 08:56:31'),
(10, 23, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025643', NULL, 200, '0', NULL, '2024-01-14 08:56:43', '2024-01-14 08:56:43'),
(11, 22, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025653', NULL, 70, '0', NULL, '2024-01-14 08:56:53', '2024-01-14 08:56:53'),
(12, 19, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025715', NULL, 15, '0', NULL, '2024-01-14 08:57:15', '2024-01-14 08:57:15'),
(13, 20, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025838', NULL, 100, '650', NULL, '2024-01-14 08:58:38', '2024-01-14 08:58:38'),
(14, 21, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025912', NULL, 800, '0', NULL, '2024-01-14 08:59:12', '2024-01-14 08:59:12'),
(15, 18, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025930', NULL, 40, '0', NULL, '2024-01-14 08:59:30', '2024-01-14 08:59:30'),
(16, 17, NULL, 1, 1, 1, 'Cash', 'spr-20240114-025938', NULL, 50, '0', NULL, '2024-01-14 08:59:38', '2024-01-14 08:59:38'),
(17, 16, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030449', NULL, 40, '0', NULL, '2024-01-14 09:04:49', '2024-01-14 09:04:49'),
(18, 15, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030458', NULL, 200, '0', NULL, '2024-01-14 09:04:58', '2024-01-14 09:04:58'),
(19, 14, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030511', NULL, 40, '0', NULL, '2024-01-14 09:05:11', '2024-01-14 09:05:11'),
(20, 13, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030532', NULL, 20, '0', NULL, '2024-01-14 09:05:32', '2024-01-14 09:05:32'),
(21, 12, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030543', NULL, 60, '0', NULL, '2024-01-14 09:05:43', '2024-01-14 09:05:43'),
(22, 11, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030554', NULL, 20, '0', NULL, '2024-01-14 09:05:54', '2024-01-14 09:05:54'),
(23, 10, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030603', NULL, 140, '0', NULL, '2024-01-14 09:06:03', '2024-01-14 09:06:03'),
(24, 9, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030612', NULL, 20, '0', NULL, '2024-01-14 09:06:12', '2024-01-14 09:06:12'),
(25, 2, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030628', NULL, 80, '0', NULL, '2024-01-14 09:06:28', '2024-01-14 09:06:28'),
(26, 8, NULL, 1, 1, 1, 'Cash', 'spr-20240114-030641', NULL, 15, '0', NULL, '2024-01-14 09:06:41', '2024-01-14 09:06:41'),
(27, 7, NULL, 1, 1, 1, 'Cash', 'spr-20240114-031046', NULL, 20, '0', NULL, '2024-01-14 09:10:46', '2024-01-14 09:10:46'),
(28, 6, NULL, 1, 1, 1, 'Cash', 'spr-20240114-031054', NULL, 120, '0', NULL, '2024-01-14 09:10:54', '2024-01-14 09:10:54'),
(29, 5, NULL, 1, 1, 1, 'Cash', 'spr-20240114-031102', NULL, 20, '0', NULL, '2024-01-14 09:11:02', '2024-01-14 09:11:02'),
(30, 4, NULL, 1, 1, 1, 'Cash', 'spr-20240114-031112', NULL, 50, '0', NULL, '2024-01-14 09:11:12', '2024-01-14 09:11:12'),
(31, 3, NULL, 1, 1, 1, 'Cash', 'spr-20240114-031121', NULL, 150, '0', NULL, '2024-01-14 09:11:21', '2024-01-14 09:11:21'),
(32, 20, NULL, 1, 1, 1, 'Cash', 'spr-20240119-104350', NULL, 650, '0', NULL, '2024-01-19 22:43:50', '2024-01-19 22:45:08'),
(33, 34, NULL, 1, 1, 1, 'Cash', 'spr-20240119-105135', NULL, 200, '0', NULL, '2024-01-19 22:51:35', '2024-01-19 22:51:35'),
(34, 35, NULL, 1, 1, 1, 'Cash', 'spr-20240119-105323', NULL, 60, '0', NULL, '2024-01-19 22:53:23', '2024-01-19 22:53:23'),
(35, 36, NULL, 1, 1, 1, 'Cash', 'spr-20240119-105517', NULL, 245, '0', NULL, '2024-01-19 22:55:17', '2024-01-19 22:55:17'),
(36, 36, NULL, 1, 1, 1, 'Cash', 'spr-20240119-110119', NULL, -35, '0', NULL, '2024-01-19 23:01:19', '2024-01-19 23:01:19'),
(37, 37, NULL, 1, 1, 1, 'Cash', 'spr-20240119-110649', NULL, 20, '0', NULL, '2024-01-19 23:06:49', '2024-01-19 23:06:49'),
(38, 38, NULL, 1, 1, 1, 'Cash', 'spr-20240119-110837', NULL, 40, '0', NULL, '2024-01-19 23:08:37', '2024-01-19 23:08:37'),
(39, 39, NULL, 1, 1, 1, 'Cash', 'spr-20240119-111902', NULL, 330, '0', NULL, '2024-01-19 23:19:02', '2024-01-19 23:19:02'),
(40, 40, NULL, 1, 1, 1, 'Cash', 'spr-20240119-112400', NULL, 50, '0', NULL, '2024-01-19 23:24:00', '2024-01-19 23:24:00'),
(41, 42, NULL, 1, 1, 1, 'Cash', 'spr-20240119-113119', NULL, 20, '0', NULL, '2024-01-19 23:31:19', '2024-01-19 23:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheques`
--

CREATE TABLE `payment_with_cheques` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int NOT NULL,
  `cheque_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_cards`
--

CREATE TABLE `payment_with_credit_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `customer_stripe_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_cards`
--

CREATE TABLE `payment_with_gift_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` int NOT NULL,
  `gift_card_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `reference_no`, `employee_id`, `account_id`, `user_id`, `amount`, `paying_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 'payroll-20231224-121508', 2, 1, 1, 250, '0', NULL, '2023-12-24 06:15:08', '2023-12-24 06:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'menu-users', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(2, 'menu-roles', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(3, 'menu-permissions', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(4, 'role-list', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(5, 'role-create', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(6, 'role-edit', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(7, 'role-delete', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(8, 'user-list', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(9, 'user-create', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(10, 'user-edit', NULL, '2023-05-11 00:15:00', '2023-05-11 00:15:00'),
(11, 'user-delete', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(12, 'user-status', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(13, 'permission-list', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(14, 'permission-create', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(15, 'permission-edit', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(16, 'permission-delete', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(17, 'menu-black', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(18, 'menu-white', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(19, 'menu-media', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(20, 'menu-category', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(21, 'menu-post', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(22, 'menu-page', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(23, 'menu-comments', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(24, 'menu-menus', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(25, 'menu-csv', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(26, 'menu-slider', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(27, 'menu-language', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(28, 'menu-databasebackup', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(29, 'menu-loginhistory', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(30, 'sider-status', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(31, 'category-status', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(32, 'category-deleted', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(33, 'category-edit', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(34, 'category-create', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(35, 'category-privatecat', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(36, ' post-show', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(37, 'post-status', NULL, '2023-05-11 00:15:01', '2023-05-11 00:15:01'),
(38, 'post-slider', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(39, 'post-archive', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(40, 'post-delete', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(41, 'post-edit', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(42, 'post-create', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(43, 'post-search', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(44, 'post-multipledelete', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(45, 'post-privateshow', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(46, 'page-archive', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(47, 'page-status', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(48, 'page-multipledelete', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(49, 'page-search', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(50, 'page-deleted', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(51, 'page-edit', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(52, 'page-create', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(53, 'page-privatepage', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(54, 'language-create', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02'),
(55, 'language-edit', NULL, '2023-05-11 00:15:02', '2023-05-11 00:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postmetas`
--

CREATE TABLE `postmetas` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `cat_id` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords_bn` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '1',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `privateshow` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title_en`, `name_en`, `slug_en`, `excerpt_en`, `content_en`, `meta_description_en`, `meta_keywords_en`, `title_bn`, `name_bn`, `slug_bn`, `excerpt_bn`, `content_bn`, `meta_description_bn`, `meta_keywords_bn`, `tag`, `image`, `file`, `video`, `link`, `status`, `slider`, `trending`, `template`, `publish_at`, `views`, `privateshow`, `deleted_at`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Post', 'post', 'post', NULL, NULL, NULL, NULL, 'Post', 'post', 'post', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, 0, 0, NULL, NULL, '2023-05-11 02:45:58', '2023-05-11 02:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `pos_settings`
--

CREATE TABLE `pos_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `product_number` int NOT NULL,
  `stripe_public_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keybord_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `stripe_public_key`, `stripe_secret_key`, `options`, `keybord_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 59, 'pk_test_ginW3sQe0P9TU1RkhUtSYoxX00vm6cWDMt', 'sk_test_R17wtLy5yfYEIUn0hodhrNZf00QDeUGPfD', '\"cash,cheque,gift_card\"', 0, '2023-09-07 09:18:15', '2023-11-06 05:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_regular_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_sell_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_list` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `qty_list` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion` tinyint DEFAULT NULL,
  `promotion_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `view` int DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_option` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending` tinyint(1) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_batch` int DEFAULT NULL,
  `is_diffPriceWareHouse` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `product_variant_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `purchase_unit_id` int DEFAULT NULL,
  `sale_unit_id` int DEFAULT NULL,
  `tax_id` int DEFAULT NULL,
  `tax_method` int DEFAULT NULL,
  `is_variant` int DEFAULT NULL,
  `variant_list` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `alert_quantity` int DEFAULT NULL,
  `daily_sale_objective` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type`, `product_name`, `slug`, `product_code`, `product_price`, `product_cost`, `product_regular_price`, `product_sell_price`, `product_image`, `product_details`, `product_list`, `featured`, `alert_qty`, `option`, `publish_at`, `qty`, `qty_list`, `promotion`, `promotion_price`, `start_date`, `end_date`, `view`, `tag`, `status`, `variant_option`, `variant_value`, `trending`, `in_stock`, `is_active`, `is_batch`, `is_diffPriceWareHouse`, `brand_id`, `category_id`, `product_variant_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `tax_id`, `tax_method`, `is_variant`, `variant_list`, `sale_id`, `alert_quantity`, `daily_sale_objective`, `last_date`, `created_at`, `updated_at`) VALUES
(1, 'standard', 'solid product', 'solid_product', '22380793', '1', '1', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2023-12-24 12:29', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 2, '1', NULL, '2023-12-24 06:30:14', '2024-01-10 15:58:10'),
(2, 'standard', 'varient product', 'varient_product', '51449085', '1', '1', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2023-12-24 12:30', 1, NULL, 1, '111', '2023-12-24', '2023-12-31', NULL, NULL, '1', '[\"size\"]', '[\"s,m\"]', 1, NULL, 1, NULL, NULL, 2, 2, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 2, '1', NULL, '2023-12-24 06:31:34', '2024-01-10 16:01:33'),
(3, 'standard', 'karijma cotton', 'karijma_cotton', 'AZvsKG', '750', '550', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-11 23:29', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-11 17:31:30', '2024-01-12 20:09:59'),
(4, 'standard', 'bed sheet', 'bed_sheet', '6pcgDm', '850', '700', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-11 23:43', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 12, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-11 17:44:44', '2024-01-19 22:40:47'),
(5, 'standard', 'batiq(cundry)', 'batiq(cundry)', '8cDU3x', '600', '500', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 00:02', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-11 18:04:47', '2024-01-19 22:42:34'),
(6, 'standard', 'bishal', 'bishal', 'c64eL3', '800', '700', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:09', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:11:16', '2024-01-19 22:46:03'),
(7, 'standard', 'tat', 'tat', '2vzlxa', '800', '700', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:11', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:12:07', '2024-01-13 16:15:57'),
(8, 'standard', 'taidai', 'taidai', 'xWqjIw', '600', '500', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:12', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:13:25', '2024-01-12 19:19:34'),
(9, 'standard', 'Aari (Pakisthani)', 'Aari_(Pakisthani)', 'Hi2qYm', '1500', '1200', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:13', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 3, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:14:37', '2024-01-12 19:20:50'),
(10, 'standard', 'guljy(1)', 'guljy(1)', 'kMnQrM', '1000', '900', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:15', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:15:54', '2024-01-12 19:21:15'),
(11, 'standard', 'guljy(2)', 'guljy(2)', 'H3VflG', '1000', '800', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:16', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:16:39', '2024-01-12 19:21:43'),
(12, 'standard', 'Aari -sequence', 'Aari_-sequence', 'w1m2LW', '1200', '1000', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:18', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:18:12', '2024-01-12 19:22:06'),
(13, 'standard', 'Ranguli (Indian)', 'Ranguli_(Indian)', 'AVEGN1', '1000', '800', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:19', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:21:24', '2024-01-19 22:42:34'),
(14, 'standard', 'batiq-karcupy', 'batiq-karcupy', 'qyIfQ3', '900', '800', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:21', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:25:17', '2024-01-12 19:23:07'),
(15, 'standard', 'batiq', 'batiq', 'IMhpkr', '650', '510', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:25', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 15:27:32', '2024-01-12 19:23:31'),
(16, 'standard', '3-piece', '3-piece', 'mYUYKc', '850', '700', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-12 21:27', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 3, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, '2024-01-12 15:28:19', '2024-01-12 19:28:55'),
(17, 'standard', 'big hair clutcher', 'big_hair_clutcher', 'gt2aCY', '35', '25', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:36', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 11, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 18:38:46', '2024-01-19 23:00:29'),
(18, 'standard', 'Middel hair clutcher', 'Middel_hair_clutcher', 'qTlvAD', '30', '20', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 02:11', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 11, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 18:40:32', '2024-01-14 15:46:33'),
(19, 'standard', 'smell hair clutcher', 'smell_hair_clutcher', 'Pu5lgp', '20', '10', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 02:11', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 11, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 18:58:07', '2024-01-19 23:06:48'),
(20, 'standard', 'baby rabar', 'baby_rabar', 'nh55Yy', '20', '15', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:04', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 16, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:05:50', '2024-01-13 16:19:26'),
(21, 'standard', 'bag rabar', 'bag_rabar', 'o4Anvm', '20', '15', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-14 23:55', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 17, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:06:35', '2024-01-14 17:57:08'),
(22, 'standard', 'rabar', 'rabar', 'pGRlL4', '20', '15', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:51', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 16, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:07:40', '2024-01-14 15:21:08'),
(23, 'standard', 'ring(1)', 'ring(1)', 'SSAeWs', '80', '65', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:08', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 18, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:09:20', '2024-01-19 23:25:41'),
(24, 'standard', 'ring(2)', 'ring(2)', '6PAUd8', '50', '35', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:09', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 18, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:10:04', '2024-01-19 23:24:00'),
(25, 'standard', 'bracelet(1)', 'bracelet(1)', 'Vz2XNq', '180', '100', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:10', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 8, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:11:31', '2024-01-19 23:19:02'),
(26, 'standard', 'bracelet(2)', 'bracelet(2)', 'Vlj9lr', '150', '90', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 8, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:12:08', '2024-01-14 13:03:36'),
(27, 'standard', 'ear ring (1)', 'ear_ring_(1)', 'i0Mfa7', '200', '110', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:12', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 7, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:13:20', '2024-01-13 16:17:27'),
(29, 'standard', 'ear ring (2)', 'ear_ring_(2)', 'INtBGf', '150', '100', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:13', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 7, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:15:49', '2024-01-13 16:17:58'),
(30, 'standard', 'ear ring (3)', 'ear_ring_(3)', 'zYo2hI', '20', '7', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:14', 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 7, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:16:37', '2024-01-19 23:31:19'),
(31, 'standard', 'baby clips', 'baby_clips', 't2J0bC', '40', '25', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:57', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 10, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:17:42', '2024-01-14 15:21:08'),
(33, 'standard', 'septi pin', 'septi_pin', 'P0tc7j', '15', '5', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 02:16', 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, 0, 4, 13, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:44:43', '2024-01-16 04:47:57'),
(34, 'standard', 'Al pin', 'Al_pin', 'EBTCiv', '20', '7', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:45', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 14, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:46:00', '2024-01-19 22:53:23'),
(35, 'standard', 'hijab pin', 'hijab_pin', '3HeG7U', '20', '10', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-13 01:46', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 15, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-12 19:47:22', '2024-01-19 22:51:35'),
(36, 'standard', 'smell smell hair clutcher', 'smell_smell_hair_clutcher', 'F1WOvT', '20', '13', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-19 23:03', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 4, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-19 23:05:05', '2024-01-19 23:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` bigint UNSIGNED NOT NULL,
  `adjustment_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` int DEFAULT NULL,
  `product_batch_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_purchases`
--

INSERT INTO `product_purchases` (`id`, `purchase_id`, `product_id`, `variant_id`, `imei_number`, `product_batch_id`, `qty`, `recieved`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(4, 1, 1, NULL, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 135.3, '2024-01-10 15:58:10', '2024-01-10 15:58:10'),
(5, 2, 2, 1, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 270.6, '2024-01-10 16:01:11', '2024-01-10 16:01:11'),
(6, 3, 2, 2, NULL, NULL, 1, 1, 1, 1, 0, 0, 0, 270.6, '2024-01-10 16:01:33', '2024-01-10 16:01:33'),
(7, 4, 7, NULL, NULL, NULL, 6, 6, 1, 700, 0, 0, 0, 4200, '2024-01-12 19:18:38', '2024-01-12 19:18:38'),
(8, 5, 6, NULL, NULL, NULL, 5, 5, 1, 700, 0, 0, 0, 3500, '2024-01-12 19:19:07', '2024-01-12 19:19:07'),
(9, 6, 8, NULL, NULL, NULL, 3, 3, 1, 500, 0, 0, 0, 1500, '2024-01-12 19:19:34', '2024-01-12 19:19:34'),
(10, 7, 5, NULL, NULL, NULL, 4, 4, 1, 500, 0, 0, 0, 2000, '2024-01-12 19:20:12', '2024-01-12 19:20:12'),
(11, 8, 9, NULL, NULL, NULL, 5, 5, 1, 1200, 0, 0, 0, 6000, '2024-01-12 19:20:50', '2024-01-12 19:20:50'),
(12, 9, 10, NULL, NULL, NULL, 4, 4, 1, 900, 0, 0, 0, 3600, '2024-01-12 19:21:15', '2024-01-12 19:21:15'),
(13, 10, 11, NULL, NULL, NULL, 5, 5, 1, 800, 0, 0, 0, 4000, '2024-01-12 19:21:43', '2024-01-12 19:21:43'),
(14, 11, 12, NULL, NULL, NULL, 12, 12, 1, 1000, 0, 0, 0, 12000, '2024-01-12 19:22:06', '2024-01-12 19:22:06'),
(15, 12, 13, NULL, NULL, NULL, 12, 12, 1, 800, 0, 0, 0, 9600, '2024-01-12 19:22:29', '2024-01-12 19:22:29'),
(16, 13, 14, NULL, NULL, NULL, 5, 5, 1, 800, 0, 0, 0, 4000, '2024-01-12 19:23:07', '2024-01-12 19:23:07'),
(17, 14, 15, NULL, NULL, NULL, 5, 5, 1, 510, 0, 0, 0, 2550, '2024-01-12 19:23:31', '2024-01-12 19:23:31'),
(19, 15, 16, NULL, NULL, NULL, 5, 5, 1, 700, 0, 0, 0, 3500, '2024-01-12 19:28:55', '2024-01-12 19:28:55'),
(20, 16, 17, NULL, NULL, NULL, 12, 12, 1, 25, 0, 0, 0, 300, '2024-01-12 19:39:45', '2024-01-12 19:39:45'),
(21, 17, 18, NULL, NULL, NULL, 12, 12, 3, 1.67, 0, 0, 0, 20, '2024-01-12 19:41:18', '2024-01-12 19:41:18'),
(22, 18, 19, NULL, NULL, NULL, 12, 12, 3, 0.83, 0, 0, 0, 10, '2024-01-12 19:41:44', '2024-01-12 19:41:44'),
(25, 21, 35, NULL, NULL, NULL, 30, 30, 1, 10, 0, 0, 0, 300, '2024-01-12 19:48:47', '2024-01-12 19:48:47'),
(27, 22, 20, NULL, NULL, NULL, 12, 12, 1, 15, 0, 0, 0, 180, '2024-01-12 19:50:38', '2024-01-12 19:50:38'),
(28, 23, 22, NULL, NULL, NULL, 12, 12, 1, 15, 0, 0, 0, 180, '2024-01-12 19:52:36', '2024-01-12 19:52:36'),
(29, 24, 23, NULL, NULL, NULL, 10, 10, 1, 65, 0, 0, 0, 650, '2024-01-12 19:53:03', '2024-01-12 19:53:03'),
(30, 25, 24, NULL, NULL, NULL, 10, 10, 1, 35, 0, 0, 0, 350, '2024-01-12 19:53:23', '2024-01-12 19:53:23'),
(31, 26, 25, NULL, NULL, NULL, 4, 4, 1, 100, 0, 0, 0, 400, '2024-01-12 19:53:50', '2024-01-12 19:53:50'),
(32, 27, 26, NULL, NULL, NULL, 6, 6, 1, 90, 0, 0, 0, 540, '2024-01-12 19:54:15', '2024-01-12 19:54:15'),
(33, 28, 27, NULL, NULL, NULL, 12, 12, 1, 110, 0, 0, 0, 1320, '2024-01-12 19:55:05', '2024-01-12 19:55:05'),
(34, 29, 29, NULL, NULL, NULL, 12, 12, 1, 100, 0, 0, 0, 1200, '2024-01-12 19:55:40', '2024-01-12 19:55:40'),
(36, 31, 31, NULL, NULL, NULL, 18, 18, 1, 25, 0, 0, 0, 450, '2024-01-12 19:57:55', '2024-01-12 19:57:55'),
(37, 32, 3, NULL, NULL, NULL, 12, 12, 1, 550, 0, 0, 0, 6600, '2024-01-12 20:09:59', '2024-01-12 20:09:59'),
(38, 33, 18, NULL, NULL, NULL, 12, 12, 1, 20, 0, 0, 0, 240, '2024-01-12 20:13:28', '2024-01-12 20:13:28'),
(39, 34, 19, NULL, NULL, NULL, 12, 12, 1, 10, 0, 0, 0, 120, '2024-01-12 20:13:53', '2024-01-12 20:13:53'),
(40, 35, 4, NULL, NULL, NULL, 5, 5, 1, 700, 0, 0, 0, 3500, '2024-01-12 20:15:27', '2024-01-12 20:15:27'),
(41, 20, 34, NULL, NULL, NULL, 12, 12, 1, 7, 0, 0, 0, 84, '2024-01-12 20:17:40', '2024-01-12 20:17:40'),
(45, 36, 33, NULL, NULL, NULL, 95, 95, 1, 5, 0, 0, 0, 475, '2024-01-12 20:22:46', '2024-01-12 20:22:46'),
(46, 37, 21, NULL, NULL, NULL, 12, 12, 1, 15, 0, 0, 0, 180, '2024-01-14 17:57:08', '2024-01-14 17:57:08'),
(48, 38, 36, NULL, NULL, NULL, 24, 24, 1, 13, 0, 0, 0, 312, '2024-01-19 23:07:54', '2024-01-19 23:07:54'),
(49, 30, 30, NULL, NULL, NULL, 60, 60, 1, 7, 0, 0, 0, 420, '2024-01-19 23:30:33', '2024-01-19 23:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotations`
--

CREATE TABLE `product_quotations` (
  `id` bigint UNSIGNED NOT NULL,
  `quotation_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `return_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `imei_number` int DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `variant_id` int DEFAULT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `imei_number` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sales`
--

INSERT INTO `product_sales` (`id`, `sale_id`, `product_batch_id`, `product_id`, `imei_number`, `variant_id`, `qty`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, '1', NULL, 1, NULL, NULL, 1, 1, 1, 0, 0, 0, 1, '2023-12-24 07:11:17', '2023-12-24 07:11:17'),
(2, '2', NULL, 35, NULL, NULL, 4, 1, 20, 0, 0, 0, 80, '2024-01-13 15:54:51', '2024-01-13 15:54:51'),
(3, '3', NULL, 26, NULL, NULL, 1, 1, 150, 0, 0, 0, 150, '2024-01-13 15:55:44', '2024-01-13 15:55:44'),
(4, '4', NULL, 18, NULL, NULL, 2, 1, 30, 0, 0, 0, 60, '2024-01-13 15:56:52', '2024-01-14 15:46:33'),
(5, '5', NULL, 20, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 15:58:30', '2024-01-13 15:58:30'),
(6, '6', NULL, 24, NULL, NULL, 2, 1, 50, 0, 0, 0, 100, '2024-01-13 16:01:34', '2024-01-13 16:01:34'),
(7, '7', NULL, 34, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:03:41', '2024-01-13 16:03:41'),
(8, '8', NULL, 33, NULL, NULL, 1, 1, 15, 0, 0, 0, 15, '2024-01-13 16:04:08', '2024-01-13 16:04:08'),
(9, '9', NULL, 20, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:04:59', '2024-01-13 16:04:59'),
(10, '10', NULL, 29, NULL, NULL, 1, 1, 150, 0, 0, 0, 150, '2024-01-13 16:06:06', '2024-01-13 16:06:06'),
(11, '11', NULL, 22, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:06:51', '2024-01-13 16:06:51'),
(12, '12', NULL, 35, NULL, NULL, 3, 1, 20, 0, 0, 0, 60, '2024-01-13 16:07:24', '2024-01-13 16:07:24'),
(13, '13', NULL, 20, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:07:55', '2024-01-13 16:07:55'),
(14, '14', NULL, 31, NULL, NULL, 1, 1, 40, 0, 0, 0, 40, '2024-01-13 16:08:28', '2024-01-13 16:08:28'),
(15, '15', NULL, 24, NULL, NULL, 2, 1, 50, 0, 0, 0, 100, '2024-01-13 16:10:00', '2024-01-13 16:10:00'),
(16, '15', NULL, 23, NULL, NULL, 1, 1, 80, 0, 0, 0, 80, '2024-01-13 16:10:00', '2024-01-13 16:10:00'),
(17, '16', NULL, 31, NULL, NULL, 1, 1, 40, 0, 0, 0, 40, '2024-01-13 16:10:34', '2024-01-13 16:10:34'),
(18, '17', NULL, 31, NULL, NULL, 1, 1, 30, 0, 0, 0, 30, '2024-01-13 16:12:48', '2024-01-14 15:21:08'),
(19, '17', NULL, 22, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:12:48', '2024-01-14 15:21:08'),
(20, '18', NULL, 30, NULL, NULL, 2, 1, 20, 0, 0, 0, 40, '2024-01-13 16:14:20', '2024-01-13 16:14:20'),
(21, '19', NULL, 33, NULL, NULL, 1, 1, 15, 0, 0, 0, 15, '2024-01-13 16:14:49', '2024-01-13 16:14:49'),
(22, '20', NULL, 6, NULL, NULL, 1, 1, 750, 0, 0, 0, 750, '2024-01-13 16:15:30', '2024-01-19 22:46:03'),
(23, '21', NULL, 7, NULL, NULL, 1, 1, 800, 0, 0, 0, 800, '2024-01-13 16:15:57', '2024-01-13 16:15:57'),
(24, '22', NULL, 23, NULL, NULL, 1, 1, 70, 0, 0, 0, 70, '2024-01-13 16:16:50', '2024-01-14 15:19:06'),
(25, '23', NULL, 27, NULL, NULL, 1, 1, 200, 0, 0, 0, 200, '2024-01-13 16:17:27', '2024-01-13 16:17:27'),
(26, '24', NULL, 29, NULL, NULL, 1, 1, 150, 0, 0, 0, 150, '2024-01-13 16:17:58', '2024-01-13 16:17:58'),
(27, '25', NULL, 17, NULL, NULL, 1, 1, 35, 0, 0, 0, 35, '2024-01-13 16:18:45', '2024-01-13 16:18:45'),
(28, '26', NULL, 22, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-13 16:19:26', '2024-01-13 16:19:26'),
(29, '26', NULL, 20, NULL, NULL, 4, 1, 20, 0, 0, 0, 80, '2024-01-13 16:19:26', '2024-01-13 16:19:26'),
(30, '27', NULL, 25, NULL, NULL, 1, 1, 150, 0, 0, 0, 150, '2024-01-13 16:20:16', '2024-01-14 15:18:26'),
(31, '28', NULL, 26, NULL, NULL, 1, 1, 150, 0, 0, 0, 150, '2024-01-13 16:20:56', '2024-01-14 13:03:36'),
(32, '29', NULL, 33, NULL, NULL, 1, 1, 15, 0, 0, 0, 15, '2024-01-15 10:58:40', '2024-01-15 10:58:40'),
(33, '30', NULL, 33, NULL, NULL, 1, 1, 15, 0, 0, 0, 15, '2024-01-15 11:25:00', '2024-01-15 11:25:00'),
(34, '31', NULL, 33, NULL, NULL, 1, 1, 15, 0, 0, 0, 15, '2024-01-16 04:47:57', '2024-01-16 04:47:57'),
(35, '32', NULL, 6, NULL, NULL, 1, 1, 750, 0, 0, 0, 750, '2024-01-19 22:40:47', '2024-01-19 22:40:47'),
(36, '32', NULL, 4, NULL, NULL, 4, 1, 750, 0, 0, 0, 3000, '2024-01-19 22:40:47', '2024-01-19 22:40:47'),
(37, '33', NULL, 13, NULL, NULL, 1, 1, 850, 0, 0, 0, 850, '2024-01-19 22:42:34', '2024-01-19 22:42:34'),
(38, '33', NULL, 5, NULL, NULL, 1, 1, 600, 0, 0, 0, 600, '2024-01-19 22:42:34', '2024-01-19 22:42:34'),
(39, '34', NULL, 35, NULL, NULL, 10, 1, 20, 0, 0, 0, 200, '2024-01-19 22:51:35', '2024-01-19 22:51:35'),
(40, '35', NULL, 34, NULL, NULL, 3, 1, 20, 0, 0, 0, 60, '2024-01-19 22:53:23', '2024-01-19 22:53:23'),
(41, '36', NULL, 17, NULL, NULL, 6, 1, 35, 0, 0, 0, 210, '2024-01-19 22:55:17', '2024-01-19 23:00:29'),
(42, '37', NULL, 19, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-19 23:06:48', '2024-01-19 23:06:48'),
(43, '38', NULL, 36, NULL, NULL, 2, 1, 20, 0, 0, 0, 40, '2024-01-19 23:08:37', '2024-01-19 23:08:37'),
(44, '39', NULL, 25, NULL, NULL, 2, 1, 180, 0, 0, 0, 360, '2024-01-19 23:19:02', '2024-01-19 23:19:02'),
(45, '40', NULL, 24, NULL, NULL, 1, 1, 50, 0, 0, 0, 50, '2024-01-19 23:24:00', '2024-01-19 23:24:00'),
(46, '41', NULL, 23, NULL, NULL, 5, 1, 80, 0, 0, 0, 400, '2024-01-19 23:25:41', '2024-01-19 23:25:41'),
(47, '42', NULL, 30, NULL, NULL, 1, 1, 20, 0, 0, 0, 20, '2024-01-19 23:31:19', '2024-01-19 23:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `product_transfers`
--

CREATE TABLE `product_transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int DEFAULT NULL,
  `product_batch_id` int DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `imei_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_id`, `position`, `item_code`, `additional_cost`, `additional_price`, `qty`, `stock`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 's-51449085', 123, 321, 13, NULL, '2023-12-24 06:31:34', '2024-01-10 16:01:11'),
(2, 2, 2, 2, 'm-51449085', 123, 321, 13, NULL, '2023-12-24 06:31:34', '2024-01-10 16:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouses`
--

CREATE TABLE `product_warehouses` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `variant_id` int DEFAULT NULL,
  `product_batch_id` int DEFAULT NULL,
  `imei_number` int DEFAULT NULL,
  `qty` double NOT NULL,
  `stock` int DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouses`
--

INSERT INTO `product_warehouses` (`id`, `product_id`, `warehouse_id`, `variant_id`, `product_batch_id`, `imei_number`, `qty`, `stock`, `price`, `created_at`, `updated_at`) VALUES
(1, '1', 2, NULL, NULL, NULL, 0, NULL, NULL, '2023-12-24 06:32:22', '2024-01-10 15:58:10'),
(2, '2', 2, 1, NULL, NULL, 1, NULL, NULL, '2023-12-24 06:42:11', '2024-01-10 16:01:11'),
(3, '2', 2, 2, NULL, NULL, 1, NULL, NULL, '2023-12-24 06:42:46', '2024-01-10 16:01:33'),
(4, '7', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:18:38', '2024-01-13 16:15:57'),
(5, '6', 2, NULL, NULL, NULL, 4, NULL, NULL, '2024-01-12 19:19:07', '2024-01-19 22:40:47'),
(6, '8', 2, NULL, NULL, NULL, 3, NULL, NULL, '2024-01-12 19:19:34', '2024-01-12 19:19:34'),
(7, '5', 2, NULL, NULL, NULL, 3, NULL, NULL, '2024-01-12 19:20:12', '2024-01-19 22:42:34'),
(8, '9', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:20:50', '2024-01-12 19:20:50'),
(9, '10', 2, NULL, NULL, NULL, 4, NULL, NULL, '2024-01-12 19:21:15', '2024-01-12 19:21:15'),
(10, '11', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:21:43', '2024-01-12 19:21:43'),
(11, '12', 2, NULL, NULL, NULL, 12, NULL, NULL, '2024-01-12 19:22:06', '2024-01-12 19:22:06'),
(12, '13', 2, NULL, NULL, NULL, 11, NULL, NULL, '2024-01-12 19:22:29', '2024-01-19 22:42:34'),
(13, '14', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:23:07', '2024-01-12 19:23:07'),
(14, '15', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:23:31', '2024-01-12 19:23:31'),
(15, '16', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:24:01', '2024-01-12 19:28:55'),
(16, '17', 2, NULL, NULL, NULL, 11, NULL, NULL, '2024-01-12 19:39:45', '2024-01-19 23:00:29'),
(17, '18', 2, NULL, NULL, NULL, 19, NULL, NULL, '2024-01-12 19:41:18', '2024-01-14 15:46:33'),
(18, '19', 2, NULL, NULL, NULL, 12, NULL, NULL, '2024-01-12 19:41:44', '2024-01-19 23:06:48'),
(19, '33', 2, NULL, NULL, NULL, 90, NULL, NULL, '2024-01-12 19:48:01', '2024-01-16 04:47:57'),
(20, '34', 2, NULL, NULL, NULL, 8, NULL, NULL, '2024-01-12 19:48:23', '2024-01-19 22:53:23'),
(21, '35', 2, NULL, NULL, NULL, 13, NULL, NULL, '2024-01-12 19:48:47', '2024-01-19 22:51:35'),
(22, '20', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:49:23', '2024-01-13 16:19:26'),
(23, '22', 2, NULL, NULL, NULL, 10, NULL, NULL, '2024-01-12 19:52:36', '2024-01-14 15:21:08'),
(24, '23', 2, NULL, NULL, NULL, 4, NULL, NULL, '2024-01-12 19:53:03', '2024-01-19 23:25:41'),
(25, '24', 2, NULL, NULL, NULL, 5, NULL, NULL, '2024-01-12 19:53:23', '2024-01-19 23:24:00'),
(26, '25', 2, NULL, NULL, NULL, 2, NULL, NULL, '2024-01-12 19:53:50', '2024-01-19 23:19:02'),
(27, '26', 2, NULL, NULL, NULL, 6, NULL, NULL, '2024-01-12 19:54:15', '2024-01-14 13:03:36'),
(28, '27', 2, NULL, NULL, NULL, 11, NULL, NULL, '2024-01-12 19:55:05', '2024-01-13 16:17:27'),
(29, '29', 2, NULL, NULL, NULL, 10, NULL, NULL, '2024-01-12 19:55:40', '2024-01-13 16:17:58'),
(30, '30', 2, NULL, NULL, NULL, 57, NULL, NULL, '2024-01-12 19:56:02', '2024-01-19 23:31:19'),
(31, '31', 2, NULL, NULL, NULL, 16, NULL, NULL, '2024-01-12 19:57:55', '2024-01-14 15:21:08'),
(32, '3', 2, NULL, NULL, NULL, 12, NULL, NULL, '2024-01-12 20:09:59', '2024-01-12 20:09:59'),
(33, '4', 2, NULL, NULL, NULL, 1, NULL, NULL, '2024-01-12 20:15:27', '2024-01-19 22:40:47'),
(34, '21', 2, NULL, NULL, NULL, 12, NULL, NULL, '2024-01-14 17:57:08', '2024-01-14 17:57:08'),
(35, '36', 2, NULL, NULL, NULL, 22, NULL, NULL, '2024-01-19 23:06:10', '2024-01-19 23:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish_at` date DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `item` int DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `purchase_status` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int NOT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `due_amount`, `paid_amount`, `purchase_status`, `payment_status`, `expired_date`, `document`, `note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'pr-20231224-123222', 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, NULL, 1, '1', 2, NULL, NULL, NULL, NULL, '2023-12-23 18:00:00', '2024-01-10 16:03:03'),
(2, 'pr-20231224-124211', 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, NULL, 1, '1', 2, NULL, NULL, NULL, NULL, '2023-12-23 18:00:00', '2024-01-10 16:03:14'),
(3, 'pr-20231224-124246', 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, NULL, 1, '1', 2, NULL, NULL, NULL, NULL, '2023-12-23 18:00:00', '2024-01-10 16:03:23'),
(4, 'pr-20240113-011838', 2, 3, 1, 6, 0, 0, 4200, 0, 0, NULL, NULL, 4200, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:18:38', '2024-01-12 19:18:38'),
(5, 'pr-20240113-011907', 2, 1, 1, 5, 0, 0, 3500, 0, 0, NULL, NULL, 3500, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:19:07', '2024-01-12 19:19:07'),
(6, 'pr-20240113-011934', 2, 4, 1, 3, 0, 0, 1500, 0, 0, NULL, NULL, 1500, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:19:34', '2024-01-12 19:19:34'),
(7, 'pr-20240113-012012', 2, 4, 1, 4, 0, 0, 2000, 0, 0, NULL, NULL, 2000, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:20:12', '2024-01-12 19:20:12'),
(8, 'pr-20240113-012050', 2, 3, 1, 5, 0, 0, 6000, 0, 0, NULL, NULL, 6000, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:20:50', '2024-01-12 19:20:50'),
(9, 'pr-20240113-012115', 2, 1, 1, 4, 0, 0, 3600, 0, 0, NULL, NULL, 3600, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:21:15', '2024-01-12 19:21:15'),
(10, 'pr-20240113-012143', 2, 1, 1, 5, 0, 0, 4000, 0, 0, NULL, NULL, 4000, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:21:43', '2024-01-12 19:21:43'),
(11, 'pr-20240113-012206', 2, 1, 1, 12, 0, 0, 12000, 0, 0, NULL, NULL, 12000, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:22:06', '2024-01-12 19:22:06'),
(12, 'pr-20240113-012229', 2, 1, 1, 12, 0, 0, 9600, 0, 0, NULL, NULL, 9600, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:22:29', '2024-01-12 19:22:29'),
(13, 'pr-20240113-012307', 2, 3, 1, 5, 0, 0, 4000, 0, 0, NULL, NULL, 4000, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:23:07', '2024-01-12 19:23:07'),
(14, 'pr-20240113-012331', 2, 2, 1, 5, 0, 0, 2550, 0, 0, NULL, NULL, 2550, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:23:31', '2024-01-12 19:23:31'),
(15, 'pr-20240113-012401', 2, 1, 1, 5, 0, 0, 3500, 0, 0, 0, 0, 3500, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 18:00:00', '2024-01-12 19:28:55'),
(16, 'pr-20240113-013945', 2, 5, 1, 12, 0, 0, 300, 0, 0, NULL, NULL, 300, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:39:45', '2024-01-12 19:39:45'),
(17, 'pr-20240113-014118', 2, 5, 1, 12, 0, 0, 20, 0, 0, NULL, NULL, 20, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:41:18', '2024-01-12 19:41:18'),
(18, 'pr-20240113-014144', 2, 5, 1, 12, 0, 0, 10, 0, 0, NULL, NULL, 10, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:41:44', '2024-01-12 19:41:44'),
(20, 'pr-20240113-014823', 2, 5, 1, 12, 0, 0, 84, 0, 0, 0, 0, 84, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 18:00:00', '2024-01-12 20:17:40'),
(21, 'pr-20240113-014847', 2, 5, 1, 30, 0, 0, 300, 0, 0, NULL, NULL, 300, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:48:47', '2024-01-12 19:48:47'),
(22, 'pr-20240113-014923', 2, 5, 1, 12, 0, 0, 180, 0, 0, 0, 0, 180, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 18:00:00', '2024-01-12 19:50:38'),
(23, 'pr-20240113-015236', 2, 1, 1, 12, 0, 0, 180, 0, 0, NULL, NULL, 180, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:52:36', '2024-01-12 19:52:36'),
(24, 'pr-20240113-015303', 2, 5, 1, 10, 0, 0, 650, 0, 0, NULL, NULL, 650, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:53:03', '2024-01-12 19:53:03'),
(25, 'pr-20240113-015323', 2, 5, 1, 10, 0, 0, 350, 0, 0, NULL, NULL, 350, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:53:23', '2024-01-12 19:53:23'),
(26, 'pr-20240113-015350', 2, 5, 1, 4, 0, 0, 400, 0, 0, NULL, NULL, 400, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:53:50', '2024-01-12 19:53:50'),
(27, 'pr-20240113-015415', 2, 5, 1, 6, 0, 0, 540, 0, 0, NULL, NULL, 540, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:54:15', '2024-01-12 19:54:15'),
(28, 'pr-20240113-015504', 2, 5, 1, 12, 0, 0, 1320, 0, 0, NULL, NULL, 1320, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:55:04', '2024-01-12 19:55:04'),
(29, 'pr-20240113-015540', 2, 5, 1, 12, 0, 0, 1200, 0, 0, NULL, NULL, 1200, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:55:40', '2024-01-12 19:55:40'),
(30, 'pr-20240113-015602', 2, 5, 1, 60, 0, 0, 420, 0, 0, 0, 0, 420, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 00:00:00', '2024-01-19 23:30:33'),
(31, 'pr-20240113-015755', 2, 5, 1, 18, 0, 0, 450, 0, 0, NULL, NULL, 450, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 19:57:55', '2024-01-12 19:57:55'),
(32, 'pr-20240113-020959', 2, 1, 1, 12, 0, 0, 6600, 0, 0, NULL, NULL, 6600, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 20:09:59', '2024-01-12 20:09:59'),
(33, 'pr-20240113-021328', 2, 5, 1, 12, 0, 0, 240, 0, 0, NULL, NULL, 240, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 20:13:28', '2024-01-12 20:13:28'),
(34, 'pr-20240113-021353', 2, 5, 1, 12, 0, 0, 120, 0, 0, NULL, NULL, 120, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 20:13:53', '2024-01-12 20:13:53'),
(35, 'pr-20240113-021527', 2, 5, 1, 5, 0, 0, 3500, 0, 0, NULL, NULL, 3500, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 20:15:27', '2024-01-12 20:15:27'),
(36, 'pr-20240113-021951', 2, 5, 1, 95, 0, 0, 475, 0, 0, 0, 0, 475, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-12 18:00:00', '2024-01-12 20:22:46'),
(37, 'pr-20240114-115708', 2, 5, 1, 12, 0, 0, 180, 0, 0, NULL, NULL, 180, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-14 17:57:08', '2024-01-14 17:57:08'),
(38, 'pr-20240119-110610', 2, 5, 1, 24, 0, 0, 312, 0, 0, 0, 0, 312, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-19 00:00:00', '2024-01-19 23:07:54');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_returns`
--

CREATE TABLE `purchase_product_returns` (
  `id` bigint UNSIGNED NOT NULL,
  `return_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_batch_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `imei_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL,
  `purchase_unit_id` int NOT NULL,
  `net_unit_cost` int NOT NULL,
  `discount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `biller_id` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `sale_id` int NOT NULL,
  `cash_register_id` int NOT NULL,
  `account_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `product_batch_id` bigint DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_id` int NOT NULL,
  `user_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `account_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` int NOT NULL,
  `total_discount` int NOT NULL,
  `total_tax` int NOT NULL,
  `total_cost` int NOT NULL,
  `order_tax` int NOT NULL,
  `order_tax_rate` int NOT NULL,
  `grand_total` int NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 100, 500, 1, 'Year', 1, '2023-09-07 08:55:40', '2024-01-14 11:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'superAdmin', 'web', 1, NULL, NULL),
(2, 'admin', 'admin', 'web', 1, NULL, NULL),
(3, 'employe', 'employe', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `permission_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, '2023-05-11 03:10:17'),
(2, 1, 2, NULL, '2023-05-11 03:10:17'),
(3, 1, 3, NULL, '2023-05-11 03:10:17'),
(4, 1, 4, NULL, '2023-05-11 03:10:16'),
(5, 1, 5, NULL, '2023-05-11 03:10:16'),
(6, 1, 6, NULL, '2023-05-11 03:10:16'),
(10, 1, 13, NULL, '2023-05-11 03:10:17'),
(11, 1, 16, NULL, '2023-05-11 03:10:17'),
(12, 1, 17, NULL, '2023-05-11 03:10:17'),
(13, 1, 18, NULL, '2023-05-11 03:10:17'),
(14, 1, 19, NULL, '2023-05-11 03:10:17'),
(15, 1, 20, NULL, '2023-05-11 03:10:17'),
(16, 1, 21, NULL, '2023-05-11 03:10:17'),
(17, 1, 22, NULL, '2023-05-11 03:10:17'),
(18, 1, 23, NULL, '2023-05-11 03:10:17'),
(19, 1, 24, NULL, '2023-05-11 03:10:17'),
(20, 1, 25, NULL, '2023-05-11 03:10:17'),
(21, 1, 26, NULL, '2023-05-11 03:10:17'),
(22, 1, 27, NULL, '2023-05-11 03:10:17'),
(23, 1, 28, NULL, '2023-05-11 03:10:17'),
(24, 1, 29, NULL, '2023-05-11 03:10:17'),
(25, 1, 31, NULL, '2023-05-11 03:10:16'),
(26, 1, 32, NULL, '2023-05-11 03:10:16'),
(27, 1, 33, NULL, '2023-05-11 03:10:16'),
(28, 1, 34, NULL, '2023-05-11 03:10:16'),
(29, 1, 35, NULL, '2023-05-11 03:10:17'),
(30, 1, 37, NULL, '2023-05-11 03:10:17'),
(31, 1, 38, NULL, '2023-05-11 03:10:17'),
(32, 1, 39, NULL, '2023-05-11 03:10:17'),
(33, 1, 40, NULL, '2023-05-11 03:10:17'),
(34, 1, 41, NULL, '2023-05-11 03:10:17'),
(35, 1, 42, NULL, '2023-05-11 03:10:17'),
(36, 1, 43, NULL, '2023-05-11 03:10:17'),
(37, 1, 44, NULL, '2023-05-11 03:10:17'),
(38, 1, 45, NULL, '2023-05-11 03:10:17'),
(39, 1, 8, NULL, '2023-05-11 03:10:16'),
(40, 1, 9, NULL, '2023-05-11 03:10:16'),
(41, 1, 10, NULL, '2023-05-11 03:10:16'),
(42, 1, 11, NULL, '2023-05-11 03:10:16'),
(43, 1, 12, NULL, '2023-05-11 03:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `biller_id` int NOT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_register_id` int DEFAULT NULL,
  `product_variant_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `order_discount_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_discount_value` int DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int NOT NULL,
  `payment_status` int NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `staff_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `customer_id`, `warehouse_id`, `biller_id`, `coupon_id`, `coupon_discount`, `cash_register_id`, `product_variant_id`, `user_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount`, `order_discount_type`, `order_discount_value`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 'sr-20231224-011116', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 0, NULL, NULL, '2023-12-24 07:11:16', '2023-12-24 08:36:34'),
(2, 'sr-20240113-095451', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 4, 0, 0, 80, 80, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 80, NULL, NULL, '2024-01-13 15:54:51', '2024-01-14 09:06:28'),
(3, 'sr-20240113-095544', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 150, 150, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 150, NULL, NULL, '2024-01-13 15:55:44', '2024-01-14 09:11:21'),
(4, 'sr-20240113-095652', 8, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 2, 0, 0, 60, 50, 0, 0, 10, 'Flat', 10, 0, 1, 4, NULL, 50, NULL, NULL, '2024-01-13 15:56:52', '2024-01-14 15:46:33'),
(5, 'sr-20240113-095830', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-13 15:58:30', '2024-01-14 09:11:02'),
(6, 'sr-20240113-100134', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 2, 0, 0, 100, 120, 0, 0, 0, 'Flat', NULL, 20, 1, 4, NULL, 120, NULL, NULL, '2024-01-13 16:01:34', '2024-01-14 09:10:54'),
(7, 'sr-20240113-100341', 8, 2, 2, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-13 16:03:41', '2024-01-14 09:10:46'),
(8, 'sr-20240113-100408', 8, 2, 2, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 15, 15, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 15, NULL, NULL, '2024-01-13 16:04:08', '2024-01-14 09:06:41'),
(9, 'sr-20240113-100459', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-13 16:04:59', '2024-01-14 09:06:12'),
(10, 'sr-20240113-100606', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 150, 140, 0, 0, 10, 'Flat', 10, NULL, 1, 4, NULL, 140, NULL, NULL, '2024-01-13 16:06:06', '2024-01-14 09:06:03'),
(11, 'sr-20240113-100651', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-13 16:06:51', '2024-01-14 09:05:54'),
(12, 'sr-20240113-100724', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 3, 0, 0, 60, 60, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 60, NULL, NULL, '2024-01-13 16:07:24', '2024-01-14 09:05:43'),
(13, 'sr-20240113-100755', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-13 16:07:55', '2024-01-14 09:05:32'),
(14, 'sr-20240113-100828', 8, 2, 2, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 40, 40, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 40, NULL, NULL, '2024-01-13 16:08:28', '2024-01-14 09:05:11'),
(15, 'sr-20240113-101000', 8, 2, 1, NULL, NULL, 1, NULL, 1, 2, 3, 0, 0, 180, 200, 0, 0, 0, 'Flat', NULL, 20, 1, 4, NULL, 200, NULL, NULL, '2024-01-13 16:10:00', '2024-01-14 09:04:58'),
(16, 'sr-20240113-101034', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 40, 40, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 40, NULL, NULL, '2024-01-13 16:10:34', '2024-01-14 09:04:49'),
(17, 'sr-20240113-101248', 8, 2, 1, NULL, NULL, 1, '[null,null]', 1, 2, 2, 0, 0, 50, 50, 0, 0, 0, 'Flat', 0, 0, 1, 4, NULL, 50, NULL, NULL, '2024-01-13 16:12:48', '2024-01-14 15:21:08'),
(18, 'sr-20240113-101420', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 2, 0, 0, 40, 40, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 40, NULL, NULL, '2024-01-13 16:14:20', '2024-01-14 08:59:30'),
(19, 'sr-20240113-101449', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 15, 15, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 15, NULL, NULL, '2024-01-13 16:14:49', '2024-01-14 08:57:15'),
(20, 'sr-20240113-101530', 9, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 1, 0, 0, 750, 750, 0, 0, 0, 'Flat', 0, 0, 1, 4, NULL, 750, NULL, NULL, '2024-01-13 16:15:30', '2024-01-19 22:46:03'),
(21, 'sr-20240113-101557', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 800, 800, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 800, NULL, NULL, '2024-01-13 16:15:57', '2024-01-14 08:59:12'),
(22, 'sr-20240113-101650', 8, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 1, 0, 0, 70, 70, 0, 0, 0, 'Flat', 0, 0, 1, 4, NULL, 70, NULL, NULL, '2024-01-13 16:16:50', '2024-01-14 15:19:06'),
(23, 'sr-20240113-101727', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 200, 200, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 200, NULL, NULL, '2024-01-13 16:17:27', '2024-01-14 08:56:43'),
(24, 'sr-20240113-101758', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 150, 150, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 150, NULL, NULL, '2024-01-13 16:17:58', '2024-01-14 08:56:31'),
(25, 'sr-20240113-101845', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 35, 40, 0, 0, 0, 'Flat', NULL, 5, 1, 4, NULL, 40, NULL, NULL, '2024-01-13 16:18:45', '2024-01-14 08:56:21'),
(26, 'sr-20240113-101926', 8, 2, 1, NULL, NULL, 1, NULL, 1, 2, 5, 0, 0, 100, 100, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 100, NULL, NULL, '2024-01-13 16:19:26', '2024-01-14 08:45:22'),
(27, 'sr-20240113-102015', 8, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 1, 0, 0, 150, 150, 0, 0, 0, 'Flat', NULL, 0, 1, 4, NULL, 150, NULL, NULL, '2024-01-13 16:20:15', '2024-01-14 15:18:26'),
(28, 'sr-20240113-102056', 8, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 1, 0, 0, 150, 150, 0, 0, 0, 'Flat', 0, 0, 1, 4, NULL, 150, NULL, NULL, '2024-01-13 16:20:56', '2024-01-14 13:03:36'),
(29, 'sr-20240115-045840', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 15, 15, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-15 10:58:40', '2024-01-15 10:58:40'),
(30, 'sr-20240115-052500', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 15, 15, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-15 11:25:00', '2024-01-15 11:25:00'),
(31, 'sr-20240116-104757', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 15, 15, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 04:47:57', '2024-01-16 04:47:57'),
(32, 'sr-20240119-104047', 10, 2, 1, NULL, NULL, 1, NULL, 1, 2, 5, 0, 0, 3750, 3750, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-19 22:40:47', '2024-01-19 22:40:47'),
(33, 'sr-20240119-104234', 11, 2, 1, NULL, NULL, 1, NULL, 1, 2, 2, 0, 0, 1450, 1450, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-19 22:42:34', '2024-01-19 22:42:34'),
(34, 'posr-20240119-105135', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 10, 0, 0, 200, 200, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 200, NULL, NULL, '2024-01-19 22:51:35', '2024-01-19 22:51:35'),
(35, 'posr-20240119-105323', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 3, 0, 0, 60, 60, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 60, NULL, NULL, '2024-01-19 22:53:23', '2024-01-19 22:53:23'),
(36, 'posr-20240119-105517', 8, 2, 1, NULL, NULL, 1, '[null]', 1, 1, 6, 0, 0, 210, 210, 0, 0, 0, 'Flat', 0, 0, 1, 4, NULL, 210, NULL, NULL, '2024-01-19 22:55:17', '2024-01-19 23:01:19'),
(37, 'posr-20240119-110648', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-19 23:06:48', '2024-01-19 23:06:48'),
(38, 'posr-20240119-110837', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 2, 0, 0, 40, 40, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 40, NULL, NULL, '2024-01-19 23:08:37', '2024-01-19 23:08:37'),
(39, 'posr-20240119-111902', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 2, 0, 0, 360, 330, 0, 0, 30, 'Flat', 30, NULL, 1, 4, NULL, 330, NULL, NULL, '2024-01-19 23:19:02', '2024-01-19 23:19:02'),
(40, 'posr-20240119-112400', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 50, 50, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 50, NULL, NULL, '2024-01-19 23:24:00', '2024-01-19 23:24:00'),
(41, 'sr-20240119-112541', 8, 2, 1, NULL, NULL, 1, NULL, 1, 1, 5, 0, 0, 400, 400, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-19 23:25:41', '2024-01-19 23:25:41'),
(42, 'posr-20240119-113119', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 0, 20, 20, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 20, NULL, NULL, '2024-01-19 23:31:19', '2024-01-19 23:31:19');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yhBqr9VTiKhOpZLwRAZzXzYrVWoXGqVdOQAMmTQt', 1, '119.148.40.121', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjlheDZINTFRdjd4aEdZTzZ5VGFrRDlQNFlLZUVkUFlQdDd3ektoSCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE4OiJmbGFzaGVyOjplbnZlbG9wZXMiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1706775624);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagecaption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int NOT NULL,
  `category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_adjusted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Aduri', NULL, 'house', '234', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '1216', 'Bangladesh', 1, '2023-12-24 06:12:22', '2023-12-24 06:12:22'),
(2, 'Al hera', NULL, 'Al hera', '234', 'alhera@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '1216', 'Bangladesh', 1, '2024-01-11 13:32:34', '2024-01-11 13:32:34'),
(3, 'Taqua', NULL, 'Taqua', '234', 'taqua@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '1216', 'Bangladesh', 1, '2024-01-11 13:33:16', '2024-01-11 13:33:16'),
(4, 'Ittadi', NULL, 'house', '234', 'Ittadi@gmail.com', '0430719596', '13/1 Myers St, Roseland, NSW-2195', 'Dhaka', NULL, '2195', 'Bangladesh', 1, '2024-01-11 13:34:25', '2024-01-11 13:34:25'),
(5, 'Others', NULL, 'house', '234', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '1216', 'Bangladesh', 1, '2024-01-12 19:32:36', '2024-01-12 19:32:36');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'tax0', 0, 1, '2023-12-24 06:11:22', '2024-01-11 16:26:17'),
(2, 'tax15', 15, 1, '2024-01-11 16:27:01', '2024-01-11 16:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL,
  `from_warehouse_id` int NOT NULL,
  `to_warehouse_id` int NOT NULL,
  `item` int NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `unit_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `base_unit`, `short_name`, `operator`, `operation_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'piece', 'piece', 'piece', '/', 1, '1', '2023-12-24 06:11:43', '2023-12-24 06:11:47'),
(2, 'gaj', 'gaj', 'gaj', '/', 36, '1', '2023-12-24 06:47:49', '2023-12-24 06:47:56'),
(3, 'dorjon', 'dorjon', 'dorjon', '/', 12, '1', '2024-01-11 15:50:10', '2024-01-11 15:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role_id` tinyint DEFAULT NULL,
  `status_id` tinyint NOT NULL DEFAULT '0',
  `is_active` int DEFAULT '1',
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_email_verified`, `mobile`, `password`, `google_id`, `facebook_id`, `access_token`, `role_id`, `status_id`, `is_active`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'superadmin@gmail.com', NULL, '1', NULL, '$2y$10$sIaS00DJD//DrEbrMZLuuuvNVBcU8hONrotV2sKaWA/BJvn.xpw5G', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTIzYjAyMi0wNTUzLTQyYjctYTllNC05N2U0YTFmZDU4ODgiLCJqdGkiOiJiMjNiN2IyN2M1ODA2ZjUwM2YzNzFiNGI3ZDk3ZmViYTY2ZWQ0NmMxYjdiNDQyZjBkN2QwM2JkNzQxOTY1ZWQ2M2YwZTVhNDU4ZDM1N2FmYyIsImlhdCI6MTcwNTMxNzg1NS43ODEwNTU5MjcyNzY2MTEzMjgxMjUsIm5iZiI6MTcwNTMxNzg1NS43ODEwNTkwMjY3MTgxMzk2NDg0Mzc1LCJleHAiOjE3MzY5NDAyNTUuNzc2NTA1OTQ3MTEzMDM3MTA5Mzc1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.R6Y507lsC15vQylbaQcrLJZ_uYsVmgZk8W7_k5wLflj2VUcFC5K-9WcAmlW52jHtt__AHX-FBe-c1myutSW_Dt-SbqLHSDxpfSCqX0MfTQQK-wDoaWydlRP8CXblHY1BQabOI5Cxj5Kv2I_BChPV-pnjhs5ocRPdxCZL4m6gJAhqoT51TQ4OYE7tBiUHrXsPmb1ALy8RhlGUZKYYviGLM6zb3ptOwlBZmXPDLbqPYnj1QK4OvtAK0RvF_CvDNhBlWHjZOcr2rpiVIE0hgexpGi31msY3oFCmgr1E8t6wG56nEKs0crbnZTc1i4-ZMadRilJwRc2jyrTQ4CbE7ehb9rWylQVa8nwI6A_7iDIj8bDnh38qSW9WmBcdSc4axzuKzWFUOIi32J06ycxfuLfncKSb-I7iCWnKZLirE3aQ14-EoucdV0ITZ6yyvOhgNFMCuSpcXQnblOknx7EBIX9DNB-D5PiDQxQFh4Fc8SKiLE-iKf1fVT5mH1c4Eb8E4JxWBP9-ImLEN7OcVU4ZdlfDZfLRpJgjYxe6kURv5PbvsTlyZPGgWI2akl4Fk7LicTK5pIA07m42fVZ3krM425NOYKtG5QZw-MovPaIdlY95_IvvhsKtsVaSGjE4g-tz25aM4hz-t78LGK7dq-4nOSiY-n6hAG74cqxP08K3ALvlUfI', 1, 1, 1, NULL, 'dQ8CnhbWmw6hLuGURZ94UE3dFOp5JfRldb11IKSIZ1bkbawyiD4r3oPGw82h', NULL, '2024-01-15 11:24:15'),
(2, 'admin', 'admin@gmail.com', NULL, '1', NULL, '$2y$10$1UREa9ri6zGzc3v.BDT8UecIC5D/jiZ4jM8n0CYEuGcrNCntR6DLa', NULL, NULL, NULL, 2, 1, 1, NULL, NULL, NULL, NULL),
(3, 'employe', 'employe@gmail.com', NULL, '1', NULL, '$2y$10$Xkt1Wz0PZKjUNRVsR95GEeGk4yTR/tsL/X6V2gzGFdenphP9Pz2jy', NULL, NULL, NULL, 3, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint UNSIGNED NOT NULL,
  `variant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `variant_name`, `created_at`, `updated_at`) VALUES
(1, 's', '2023-12-24 06:31:34', '2023-12-24 06:31:34'),
(2, 'm', '2023-12-24 06:31:34', '2023-12-24 06:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Mirpur-12', '01818401065', 'therashedul@gmail.com', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 1, '2023-08-09 05:58:01', '2024-01-11 15:48:28'),
(3, 'Savar', '01709370009', 'webhatbd@gmail.com', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 1, '2023-08-09 06:20:15', '2024-01-11 15:48:17');

-- --------------------------------------------------------

--
-- Table structure for table `whitelists`
--

CREATE TABLE `whitelists` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blacklists`
--
ALTER TABLE `blacklists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_en_unique` (`slug_en`),
  ADD UNIQUE KEY `categories_slug_bn_unique` (`slug_bn`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hitlogs`
--
ALTER TABLE `hitlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_uploads`
--
ALTER TABLE `image_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loginhistories`
--
ALTER TABLE `loginhistories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_en_unique` (`slug_en`),
  ADD UNIQUE KEY `pages_slug_bn_unique` (`slug_bn`),
  ADD UNIQUE KEY `pages_link_unique` (`link`),
  ADD KEY `pages_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheques`
--
ALTER TABLE `payment_with_cheques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_cards`
--
ALTER TABLE `payment_with_credit_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_cards`
--
ALTER TABLE `payment_with_gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postmetas_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_en_unique` (`slug_en`),
  ADD UNIQUE KEY `posts_slug_bn_unique` (`slug_bn`),
  ADD UNIQUE KEY `posts_link_unique` (`link`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `pos_settings`
--
ALTER TABLE `pos_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_product_code_unique` (`product_code`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotations`
--
ALTER TABLE `product_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfers`
--
ALTER TABLE `product_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_returns`
--
ALTER TABLE `purchase_product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_has_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whitelists`
--
ALTER TABLE `whitelists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `whitelists_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hitlogs`
--
ALTER TABLE `hitlogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2583;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image_uploads`
--
ALTER TABLE `image_uploads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `loginhistories`
--
ALTER TABLE `loginhistories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payment_with_cheques`
--
ALTER TABLE `payment_with_cheques`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_with_credit_cards`
--
ALTER TABLE `payment_with_credit_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_cards`
--
ALTER TABLE `payment_with_gift_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postmetas`
--
ALTER TABLE `postmetas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pos_settings`
--
ALTER TABLE `pos_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `product_quotations`
--
ALTER TABLE `product_quotations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `product_transfers`
--
ALTER TABLE `product_transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `purchase_product_returns`
--
ALTER TABLE `purchase_product_returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `whitelists`
--
ALTER TABLE `whitelists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD CONSTRAINT `postmetas_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `whitelists`
--
ALTER TABLE `whitelists`
  ADD CONSTRAINT `whitelists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
