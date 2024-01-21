-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 06:29 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double DEFAULT NULL,
  `total_debit` double DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `created_at`, `updated_at`, `account_no`, `name`, `initial_balance`, `total_balance`, `total_debit`, `note`, `is_active`, `is_default`) VALUES
(1, '2023-08-02 04:44:24', '2023-10-11 03:48:22', '1403708', 'Rasel', 50000, 50000, NULL, 'new Note', 1, 1),
(2, '2023-09-02 10:59:46', '2023-10-11 03:48:07', '123456', 'karim', 500001, 500001, NULL, 'Karim ac', 1, NULL),
(3, '2023-10-11 04:03:50', '2023-10-11 04:06:37', '654321', 'sorna', 123456, 123456, NULL, 'test note', 0, NULL),
(4, '2024-01-03 07:02:40', '2024-01-03 07:04:05', '1403708', 'demo3', 45646, 45646, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(15) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `product_id`, `product_name`, `brand`, `price`, `product_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'shart', '2', '321', '\\barcode68081776.png', NULL, '2023-08-22 06:12:14', '2023-08-22 06:12:14'),
(145, 3, 'aari', '2', '321', '\\barcode\\tb3ljwc39.png', NULL, '2024-01-16 09:09:47', '2024-01-16 09:09:47'),
(146, 4, 'aari(pakisten)', '1', '321', '\\barcode\\n7xty7c39.png', NULL, '2024-01-16 09:38:54', '2024-01-16 09:38:54');

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'new biller', '2_1684129568.jpg', 'webhat', '234', 'rasel.netrweb@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', '1216', 'Bangladesh', 1, '2023-09-07 10:17:57', '2023-09-07 10:17:57'),
(2, 'Rashedul Karimss', NULL, 'house', '234', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', '1216', 'Bangladesh', 1, '2024-01-03 08:27:45', '2024-01-03 08:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `blacklists`
--

CREATE TABLE `blacklists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'easy', NULL, 1, '2023-12-24 06:11:10', '2023-12-24 06:11:10'),
(2, 'pluse point', NULL, 1, '2023-12-24 06:11:15', '2023-12-24 06:11:15'),
(3, 'Locals', NULL, 1, '2024-01-03 08:32:37', '2024-01-03 08:32:44');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `category_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(2, 'children', 'children', 'children', 'children', 'children', 'children', NULL, 0, '2_1703407027.jpg', 1, NULL, '2023-12-24 06:10:58', '2023-12-24 08:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `comment_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentemail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) DEFAULT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `amount`, `minimum_amount`, `quantity`, `used`, `expired_date`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '04629095653841I', 'percentage', 5, 5000, 2, NULL, '2024-01-31', 1, 1, '2024-01-03 08:47:32', '2024-01-03 08:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `create_custom_fields`
--

CREATE TABLE `create_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
  `is_table` tinyint(1) NOT NULL,
  `is_invoice` tinyint(1) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_disable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(15) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit` int(15) DEFAULT NULL,
  `tax_no` int(15) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `expense` int(15) DEFAULT NULL,
  `points` int(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `address`, `city`, `state`, `image`, `postal_code`, `country`, `deposit`, `tax_no`, `is_active`, `expense`, `points`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'karim', 'house', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '4_1692512057.jpg', '1216', 'Bangladesh', NULL, NULL, 1, NULL, 24, '2023-09-10 05:01:56', '2024-01-17 05:37:54'),
(2, 1, NULL, 'rasel karim', 'susuta butiqe ghore', 'therashedul@gmail.com', '0430719596', '13/1 Myers St, Roseland, NSW-2195', 'Dhaka', NULL, 'business_1688362561.jpg', '2195', 'Bangladesh', NULL, NULL, 1, NULL, 34, '2023-09-10 05:05:46', '2024-01-17 05:41:55'),
(3, 2, NULL, 'sorna', 'susuta butiqe ghore', 'sorna@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, 3, '2023-09-20 04:24:29', '2024-01-14 07:00:28'),
(4, 1, 1, 'Rashedul Karim', 'house', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-12-26 05:02:19', '2023-12-26 05:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'general', '-1', 1, '2023-12-24 07:09:07', '2023-12-24 07:09:07'),
(2, 'vip group', '-10', 1, '2023-12-24 07:09:32', '2023-12-24 07:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `belongs_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grid_value` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `courier_id` int(15) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `reference_no`, `sale_id`, `user_id`, `courier_id`, `address`, `delivered_by`, `recieved_by`, `file`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dr-20240103-034619', 3, 1, 3, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh', 'rohim', 'rasel', NULL, NULL, '3', '2024-01-03 09:46:30', '2024-01-03 09:46:30'),
(2, 'dr-20240116-041239', 11, 1, 3, '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh', 'rohim', 'rasel', NULL, NULL, '2', '2024-01-16 10:12:48', '2024-01-16 10:12:48'),
(3, 'dr-20240116-050356', 13, 1, 3, '13/1 Myers St, Roseland, NSW-2195 Dhaka Bangladesh', 'rohim', 'rasel', NULL, NULL, '2', '2024-01-16 11:04:05', '2024-01-16 11:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'new department', 1, '2023-10-11 06:07:29', '2024-01-03 09:50:08'),
(2, 'office departmentss', 0, '2023-10-11 06:09:21', '2023-10-11 06:12:04'),
(3, 'department1', 1, '2023-10-31 03:28:02', '2023-10-31 03:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_list` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(12, 'demo3', 'All', '', '2023-10-03', '2023-10-28', 'percentage', 12, 12, 21, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', 1, '2023-10-03 10:49:48', '2024-01-03 10:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plans`
--

INSERT INTO `discount_plans` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'vip plan', 1, '2023-09-11 09:53:50', '2023-09-11 09:53:50'),
(4, 'global', 1, '2023-09-11 09:56:22', '2023-09-11 10:09:30'),
(5, 'reletive', 1, '2024-01-03 11:01:20', '2024-01-03 11:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plan_customers`
--

INSERT INTO `discount_plan_customers` (`id`, `discount_plan_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-12-24 06:23:49', '2023-12-24 06:23:49'),
(6, 5, 4, '2024-01-03 11:05:12', '2024-01-03 11:05:12'),
(7, 4, 2, '2024-01-03 11:05:25', '2024-01-03 11:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_plan_discounts`
--

INSERT INTO `discount_plan_discounts` (`id`, `discount_id`, `discount_plan_id`, `created_at`, `updated_at`) VALUES
(1, 12, 3, '2024-01-03 10:40:29', '2024-01-03 10:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `reference_no`, `expense_category_id`, `warehouse_id`, `account_id`, `cash_register_id`, `user_id`, `amount`, `note`, `created_at`, `updated_at`) VALUES
(2, 'er-20231010-115141', 2, 2, 2, 2, 1, 5000, 'Note for your', '2023-10-09 18:00:00', '2023-10-10 08:33:02'),
(3, 'er-20231010-023819', 3, 2, 1, 1, 1, 500, 'madhonbi', '2023-10-05 18:00:00', '2023-12-24 06:12:56'),
(4, 'er-20231101-121846', 2, 2, 1, 1, 1, 250, 'dfsdf', '2023-10-31 18:00:00', '2024-01-03 11:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `code`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(2, '804281679', 'traveling', 1, '2023-10-10 04:42:06', '2023-10-10 04:57:59'),
(3, '201543016', 'lunch', 1, '2023-10-10 04:42:17', '2023-10-10 04:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int(11) DEFAULT 2,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_trial_limit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_registration_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `package_id`, `staff_access`, `date_format`, `developed_by`, `invoice_format`, `decimal`, `phone`, `email`, `free_trial_limit`, `state`, `theme`, `created_at`, `updated_at`, `currency_position`, `expiry_date`, `is_zatca`, `company_name`, `vat_registration_number`) VALUES
(1, 'myshopw', '20220905125905.png', 0, '1', 0, 'all', 'd-m-Y', 'rasel', 'standard', 2, '01818401065', 'therashedul@gmail.com', 'yearly', 1, 'dark.css', '2018-07-06 06:13:11', '2024-01-18 05:02:47', 'prefix', '2024-01-31', 0, 'Myshop company', '980980');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spent_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hitlogs`
--

INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(102, '127.0.0.1', 'superAdmin.index', 'Apple Safari16.6', '8801709370008', 'http://127.0.0.1:8000/superAdmin', 'Mobile', 'iOS', 'iPhone;', 'Null', 'Null', NULL, 'OS', '2024-01-09 03:48:02', '2024-01-09 03:48:02'),
(103, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 03:48:46', '2024-01-09 03:48:46'),
(104, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 03:50:13', '2024-01-09 03:50:13'),
(105, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:54:45', '2024-01-09 04:54:45'),
(106, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:54:50', '2024-01-09 04:54:50'),
(107, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:57:38', '2024-01-09 04:57:38'),
(108, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:57:43', '2024-01-09 04:57:43'),
(109, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:10', '2024-01-09 04:58:10'),
(110, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:13', '2024-01-09 04:58:13'),
(111, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:19', '2024-01-09 04:58:19'),
(112, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:22', '2024-01-09 04:58:22'),
(113, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:26', '2024-01-09 04:58:26'),
(114, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 04:58:29', '2024-01-09 04:58:29'),
(115, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:02:39', '2024-01-09 05:02:39'),
(116, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:03:11', '2024-01-09 05:03:11'),
(117, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:03:15', '2024-01-09 05:03:15'),
(118, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:03:17', '2024-01-09 05:03:17'),
(119, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:03:20', '2024-01-09 05:03:20'),
(120, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:05:22', '2024-01-09 05:05:22'),
(121, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:05:27', '2024-01-09 05:05:27'),
(122, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:49:57', '2024-01-09 05:49:57'),
(123, '127.0.0.1', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:50:13', '2024-01-09 05:50:13'),
(124, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 05:54:48', '2024-01-09 05:54:48'),
(125, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:02:47', '2024-01-09 06:02:47'),
(126, '127.0.0.1', 'superAdmin.expense_categories.edit', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:02:59', '2024-01-09 06:02:59'),
(127, '127.0.0.1', 'superAdmin.report.supplierDueByDate', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report/supplier-due-report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:25:18', '2024-01-09 06:25:18'),
(128, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:25:29', '2024-01-09 06:25:29'),
(129, '127.0.0.1', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:25:30', '2024-01-09 06:25:30'),
(130, '127.0.0.1', 'superAdmin.report.productExpiry', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report.productExpiry', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:25:32', '2024-01-09 06:25:32'),
(131, '127.0.0.1', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:25:33', '2024-01-09 06:25:33'),
(132, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:26:35', '2024-01-09 06:26:35'),
(133, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:26:48', '2024-01-09 06:26:48'),
(134, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:00', '2024-01-09 06:27:00'),
(135, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:13', '2024-01-09 06:27:13'),
(136, '127.0.0.1', 'superAdmin.report.qtyAlert', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report.qtyAlert', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:29', '2024-01-09 06:27:29'),
(137, '127.0.0.1', 'superAdmin.report.productExpiry', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report.productExpiry', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:30', '2024-01-09 06:27:30'),
(138, '127.0.0.1', 'superAdmin.report.warehouseStock', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report.warehouseStock', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:31', '2024-01-09 06:27:31'),
(139, '127.0.0.1', 'superAdmin.expense_categories', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/expense_categories', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:31', '2024-01-09 06:27:31'),
(140, '127.0.0.1', 'superAdmin.report.supplierDueByDate', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report/supplier-due-report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:32', '2024-01-09 06:27:32'),
(141, '127.0.0.1', 'superAdmin.generated::VtSyVKvxq8nnQbFg', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-09 06:27:43', '2024-01-09 06:27:43'),
(142, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 03:36:55', '2024-01-10 03:36:55'),
(143, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 03:37:49', '2024-01-10 03:37:49'),
(144, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 03:37:55', '2024-01-10 03:37:55'),
(145, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 03:58:42', '2024-01-10 03:58:42'),
(146, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:00:08', '2024-01-10 04:00:08'),
(147, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:00:12', '2024-01-10 04:00:12'),
(148, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:00:42', '2024-01-10 04:00:42'),
(149, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:00:45', '2024-01-10 04:00:45'),
(150, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:01:04', '2024-01-10 04:01:04'),
(151, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '8801709370008', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:01:07', '2024-01-10 04:01:07'),
(152, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:02:26', '2024-01-10 04:02:26'),
(153, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 04:02:29', '2024-01-10 04:02:29'),
(154, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 06:25:37', '2024-01-10 06:25:37'),
(155, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 08:28:17', '2024-01-10 08:28:17'),
(156, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-10 11:33:18', '2024-01-10 11:33:18'),
(157, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-11 04:39:54', '2024-01-11 04:39:54'),
(158, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:05:54', '2024-01-14 04:05:54'),
(159, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:05:56', '2024-01-14 04:05:56'),
(160, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:06:11', '2024-01-14 04:06:11'),
(161, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:06:18', '2024-01-14 04:06:18'),
(162, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:06:23', '2024-01-14 04:06:23'),
(163, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:06:27', '2024-01-14 04:06:27'),
(164, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:10:57', '2024-01-14 04:10:57'),
(165, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:11:32', '2024-01-14 04:11:32'),
(166, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:11:34', '2024-01-14 04:11:34'),
(167, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:15:33', '2024-01-14 04:15:33'),
(168, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:15:37', '2024-01-14 04:15:37'),
(169, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:17:31', '2024-01-14 04:17:31'),
(170, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:17:34', '2024-01-14 04:17:34'),
(171, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:18:07', '2024-01-14 04:18:07'),
(172, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:18:09', '2024-01-14 04:18:09'),
(173, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:18:28', '2024-01-14 04:18:28'),
(174, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:18:32', '2024-01-14 04:18:32'),
(175, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:31:35', '2024-01-14 04:31:35'),
(176, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:31:38', '2024-01-14 04:31:38'),
(177, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:32:24', '2024-01-14 04:32:24'),
(178, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:32:26', '2024-01-14 04:32:26'),
(179, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:32:49', '2024-01-14 04:32:49'),
(180, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:32:51', '2024-01-14 04:32:51'),
(181, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:48:59', '2024-01-14 04:48:59'),
(182, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:49:02', '2024-01-14 04:49:02'),
(183, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:52:41', '2024-01-14 04:52:41'),
(184, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:52:44', '2024-01-14 04:52:44'),
(185, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:52:58', '2024-01-14 04:52:58'),
(186, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:53:01', '2024-01-14 04:53:01'),
(187, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:54:30', '2024-01-14 04:54:30'),
(188, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 04:54:33', '2024-01-14 04:54:33'),
(189, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:13:22', '2024-01-14 05:13:22'),
(190, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:14:32', '2024-01-14 05:14:32'),
(191, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:14:59', '2024-01-14 05:14:59'),
(192, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:15:01', '2024-01-14 05:15:01'),
(193, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:15:45', '2024-01-14 05:15:45'),
(194, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:15:47', '2024-01-14 05:15:47'),
(195, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:17:45', '2024-01-14 05:17:45'),
(196, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:17:47', '2024-01-14 05:17:47'),
(197, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:17:53', '2024-01-14 05:17:53'),
(198, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:17:56', '2024-01-14 05:17:56'),
(199, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:20:55', '2024-01-14 05:20:55'),
(200, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:20:56', '2024-01-14 05:20:56'),
(201, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:20:59', '2024-01-14 05:20:59'),
(202, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:06', '2024-01-14 05:21:06'),
(203, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:07', '2024-01-14 05:21:07'),
(204, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:07', '2024-01-14 05:21:07'),
(205, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:12', '2024-01-14 05:21:12'),
(206, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:13', '2024-01-14 05:21:13'),
(207, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:13', '2024-01-14 05:21:13'),
(208, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:14', '2024-01-14 05:21:14'),
(209, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:21', '2024-01-14 05:21:21'),
(210, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:21', '2024-01-14 05:21:21'),
(211, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:27', '2024-01-14 05:21:27'),
(212, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:28', '2024-01-14 05:21:28'),
(213, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:51', '2024-01-14 05:21:51'),
(214, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:54', '2024-01-14 05:21:54'),
(215, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:59', '2024-01-14 05:21:59'),
(216, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:21:59', '2024-01-14 05:21:59'),
(217, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:22:02', '2024-01-14 05:22:02'),
(218, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:22:02', '2024-01-14 05:22:02'),
(219, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:24:38', '2024-01-14 05:24:38'),
(220, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:24:42', '2024-01-14 05:24:42'),
(221, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:25:09', '2024-01-14 05:25:09'),
(222, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:25:10', '2024-01-14 05:25:10'),
(223, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:04', '2024-01-14 05:31:04'),
(224, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:09', '2024-01-14 05:31:09'),
(225, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:23', '2024-01-14 05:31:23'),
(226, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:27', '2024-01-14 05:31:27'),
(227, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:47', '2024-01-14 05:31:47'),
(228, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:31:50', '2024-01-14 05:31:50'),
(229, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:32:25', '2024-01-14 05:32:25'),
(230, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:32:28', '2024-01-14 05:32:28'),
(231, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:33:11', '2024-01-14 05:33:11'),
(232, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:33:13', '2024-01-14 05:33:13'),
(233, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:35:02', '2024-01-14 05:35:02'),
(234, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:35:06', '2024-01-14 05:35:06'),
(235, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:35:10', '2024-01-14 05:35:10'),
(236, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:35:13', '2024-01-14 05:35:13'),
(237, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:35:15', '2024-01-14 05:35:15'),
(238, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:10', '2024-01-14 05:36:10'),
(239, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:14', '2024-01-14 05:36:14'),
(240, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:19', '2024-01-14 05:36:19'),
(241, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:29', '2024-01-14 05:36:29'),
(242, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:31', '2024-01-14 05:36:31'),
(243, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:36:33', '2024-01-14 05:36:33'),
(244, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:15', '2024-01-14 05:38:15'),
(245, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:19', '2024-01-14 05:38:19'),
(246, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:24', '2024-01-14 05:38:24'),
(247, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:29', '2024-01-14 05:38:29'),
(248, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:31', '2024-01-14 05:38:31'),
(249, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:34', '2024-01-14 05:38:34'),
(250, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:44', '2024-01-14 05:38:44'),
(251, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:38:48', '2024-01-14 05:38:48'),
(252, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:39:33', '2024-01-14 05:39:33'),
(253, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:39:36', '2024-01-14 05:39:36'),
(254, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:39:59', '2024-01-14 05:39:59'),
(255, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:40:02', '2024-01-14 05:40:02'),
(256, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:40:08', '2024-01-14 05:40:08'),
(257, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:09', '2024-01-14 05:41:09'),
(258, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:13', '2024-01-14 05:41:13'),
(259, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:20', '2024-01-14 05:41:20'),
(260, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:24', '2024-01-14 05:41:24'),
(261, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:33', '2024-01-14 05:41:33'),
(262, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:36', '2024-01-14 05:41:36'),
(263, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:42', '2024-01-14 05:41:42'),
(264, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:45', '2024-01-14 05:41:45'),
(265, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:41:48', '2024-01-14 05:41:48'),
(266, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:42:00', '2024-01-14 05:42:00'),
(267, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:42:02', '2024-01-14 05:42:02'),
(268, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:42:45', '2024-01-14 05:42:45'),
(269, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:42:48', '2024-01-14 05:42:48'),
(270, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:03', '2024-01-14 05:43:03'),
(271, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:06', '2024-01-14 05:43:06'),
(272, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:18', '2024-01-14 05:43:18'),
(273, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:21', '2024-01-14 05:43:21'),
(274, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:32', '2024-01-14 05:43:32'),
(275, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:43:34', '2024-01-14 05:43:34'),
(276, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:45:12', '2024-01-14 05:45:12'),
(277, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:45:15', '2024-01-14 05:45:15'),
(278, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:46:18', '2024-01-14 05:46:18'),
(279, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:46:21', '2024-01-14 05:46:21'),
(280, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:46:26', '2024-01-14 05:46:26'),
(281, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:05', '2024-01-14 05:47:05'),
(282, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:08', '2024-01-14 05:47:08'),
(283, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:15', '2024-01-14 05:47:15'),
(284, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:21', '2024-01-14 05:47:21'),
(285, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:23', '2024-01-14 05:47:23'),
(286, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:28', '2024-01-14 05:47:28'),
(287, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:47', '2024-01-14 05:47:47'),
(288, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:49', '2024-01-14 05:47:49'),
(289, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:54', '2024-01-14 05:47:54'),
(290, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:47:59', '2024-01-14 05:47:59'),
(291, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:01', '2024-01-14 05:48:01'),
(292, '127.0.0.1', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:08', '2024-01-14 05:48:08'),
(293, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:12', '2024-01-14 05:48:12'),
(294, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:13', '2024-01-14 05:48:13'),
(295, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:13', '2024-01-14 05:48:13'),
(296, '127.0.0.1', 'superAdmin.sale.update', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.update.2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:27', '2024-01-14 05:48:27'),
(297, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:29', '2024-01-14 05:48:29'),
(298, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:32', '2024-01-14 05:48:32'),
(299, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:35', '2024-01-14 05:48:35'),
(300, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:38', '2024-01-14 05:48:38'),
(301, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:41', '2024-01-14 05:48:41'),
(302, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:48:46', '2024-01-14 05:48:46'),
(303, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:49:28', '2024-01-14 05:49:28'),
(304, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:49:30', '2024-01-14 05:49:30'),
(305, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:03', '2024-01-14 05:50:03'),
(306, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:06', '2024-01-14 05:50:06'),
(307, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:09', '2024-01-14 05:50:09'),
(308, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:12', '2024-01-14 05:50:12'),
(309, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:14', '2024-01-14 05:50:14'),
(310, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:16', '2024-01-14 05:50:16'),
(311, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:28', '2024-01-14 05:50:28'),
(312, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:29', '2024-01-14 05:50:29'),
(313, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:50:33', '2024-01-14 05:50:33'),
(314, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:51:32', '2024-01-14 05:51:32'),
(315, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:51:34', '2024-01-14 05:51:34'),
(316, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:51:48', '2024-01-14 05:51:48'),
(317, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:52:39', '2024-01-14 05:52:39'),
(318, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:52:42', '2024-01-14 05:52:42'),
(319, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:53:24', '2024-01-14 05:53:24'),
(320, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:53:27', '2024-01-14 05:53:27'),
(321, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:20', '2024-01-14 05:54:20'),
(322, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:23', '2024-01-14 05:54:23'),
(323, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:38', '2024-01-14 05:54:38'),
(324, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:40', '2024-01-14 05:54:40'),
(325, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:51', '2024-01-14 05:54:51'),
(326, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:54:52', '2024-01-14 05:54:52'),
(327, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:55:57', '2024-01-14 05:55:57'),
(328, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:56:01', '2024-01-14 05:56:01');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(329, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:13', '2024-01-14 05:57:13'),
(330, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:16', '2024-01-14 05:57:16'),
(331, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:21', '2024-01-14 05:57:21'),
(332, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:26', '2024-01-14 05:57:26'),
(333, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:50', '2024-01-14 05:57:50'),
(334, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:52', '2024-01-14 05:57:52'),
(335, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:55', '2024-01-14 05:57:55'),
(336, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:58', '2024-01-14 05:57:58'),
(337, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:57:59', '2024-01-14 05:57:59'),
(338, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:58:10', '2024-01-14 05:58:10'),
(339, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:58:11', '2024-01-14 05:58:11'),
(340, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:58:18', '2024-01-14 05:58:18'),
(341, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 05:58:19', '2024-01-14 05:58:19'),
(342, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:40', '2024-01-14 06:00:40'),
(343, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:41', '2024-01-14 06:00:41'),
(344, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:43', '2024-01-14 06:00:43'),
(345, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:49', '2024-01-14 06:00:49'),
(346, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:50', '2024-01-14 06:00:50'),
(347, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:00:58', '2024-01-14 06:00:58'),
(348, '127.0.0.1', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.edit/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:14', '2024-01-14 06:02:14'),
(349, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:16', '2024-01-14 06:02:16'),
(350, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:17', '2024-01-14 06:02:17'),
(351, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:17', '2024-01-14 06:02:17'),
(352, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:23', '2024-01-14 06:02:23'),
(353, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:32', '2024-01-14 06:02:32'),
(354, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:36', '2024-01-14 06:02:36'),
(355, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:02:51', '2024-01-14 06:02:51'),
(356, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:04:39', '2024-01-14 06:04:39'),
(357, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:04:43', '2024-01-14 06:04:43'),
(358, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:11:07', '2024-01-14 06:11:07'),
(359, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:12:15', '2024-01-14 06:12:15'),
(360, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:12:18', '2024-01-14 06:12:18'),
(361, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:14:32', '2024-01-14 06:14:32'),
(362, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:14:37', '2024-01-14 06:14:37'),
(363, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:16:03', '2024-01-14 06:16:03'),
(364, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:16:06', '2024-01-14 06:16:06'),
(365, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:17:50', '2024-01-14 06:17:50'),
(366, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:17:54', '2024-01-14 06:17:54'),
(367, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:18:39', '2024-01-14 06:18:39'),
(368, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:18:42', '2024-01-14 06:18:42'),
(369, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:18:52', '2024-01-14 06:18:52'),
(370, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:19:01', '2024-01-14 06:19:01'),
(371, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:19:04', '2024-01-14 06:19:04'),
(372, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:19:44', '2024-01-14 06:19:44'),
(373, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:19:47', '2024-01-14 06:19:47'),
(374, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:20:05', '2024-01-14 06:20:05'),
(375, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:20:08', '2024-01-14 06:20:08'),
(376, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:31:56', '2024-01-14 06:31:56'),
(377, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:32:02', '2024-01-14 06:32:02'),
(378, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:34:20', '2024-01-14 06:34:20'),
(379, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:34:24', '2024-01-14 06:34:24'),
(380, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:41:57', '2024-01-14 06:41:57'),
(381, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:42:02', '2024-01-14 06:42:02'),
(382, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:44:34', '2024-01-14 06:44:34'),
(383, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:44:37', '2024-01-14 06:44:37'),
(384, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:46:02', '2024-01-14 06:46:02'),
(385, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:46:32', '2024-01-14 06:46:32'),
(386, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:46:36', '2024-01-14 06:46:36'),
(387, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:46:40', '2024-01-14 06:46:40'),
(388, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:46:43', '2024-01-14 06:46:43'),
(389, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:47:04', '2024-01-14 06:47:04'),
(390, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:47:06', '2024-01-14 06:47:06'),
(391, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:47:25', '2024-01-14 06:47:25'),
(392, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:47:28', '2024-01-14 06:47:28'),
(393, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:47:56', '2024-01-14 06:47:56'),
(394, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:48:03', '2024-01-14 06:48:03'),
(395, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:50:10', '2024-01-14 06:50:10'),
(396, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:50:15', '2024-01-14 06:50:15'),
(397, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:50:50', '2024-01-14 06:50:50'),
(398, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:50:54', '2024-01-14 06:50:54'),
(399, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:54:49', '2024-01-14 06:54:49'),
(400, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:55:00', '2024-01-14 06:55:00'),
(401, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:55:06', '2024-01-14 06:55:06'),
(402, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:58:17', '2024-01-14 06:58:17'),
(403, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:58:19', '2024-01-14 06:58:19'),
(404, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:58:58', '2024-01-14 06:58:58'),
(405, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:59:36', '2024-01-14 06:59:36'),
(406, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 06:59:38', '2024-01-14 06:59:38'),
(407, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:02', '2024-01-14 07:00:02'),
(408, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:14', '2024-01-14 07:00:14'),
(409, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:18', '2024-01-14 07:00:18'),
(410, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:18', '2024-01-14 07:00:18'),
(411, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:25', '2024-01-14 07:00:25'),
(412, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:28', '2024-01-14 07:00:28'),
(413, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/4', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:29', '2024-01-14 07:00:29'),
(414, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:32', '2024-01-14 07:00:32'),
(415, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:00:35', '2024-01-14 07:00:35'),
(416, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:01:09', '2024-01-14 07:01:09'),
(417, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:01:12', '2024-01-14 07:01:12'),
(418, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:03:04', '2024-01-14 07:03:04'),
(419, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:03:07', '2024-01-14 07:03:07'),
(420, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:05:10', '2024-01-14 07:05:10'),
(421, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:05:20', '2024-01-14 07:05:20'),
(422, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:05:23', '2024-01-14 07:05:23'),
(423, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:06:13', '2024-01-14 07:06:13'),
(424, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:06:18', '2024-01-14 07:06:18'),
(425, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:07:59', '2024-01-14 07:07:59'),
(426, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:08:02', '2024-01-14 07:08:02'),
(427, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:08:19', '2024-01-14 07:08:19'),
(428, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:08:23', '2024-01-14 07:08:23'),
(429, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:09:59', '2024-01-14 07:09:59'),
(430, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:10:03', '2024-01-14 07:10:03'),
(431, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:12:08', '2024-01-14 07:12:08'),
(432, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:12:11', '2024-01-14 07:12:11'),
(433, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:13:00', '2024-01-14 07:13:00'),
(434, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:13:03', '2024-01-14 07:13:03'),
(435, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:13:27', '2024-01-14 07:13:27'),
(436, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:13:30', '2024-01-14 07:13:30'),
(437, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:14:06', '2024-01-14 07:14:06'),
(438, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:14:09', '2024-01-14 07:14:09'),
(439, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:15:37', '2024-01-14 07:15:37'),
(440, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:15:42', '2024-01-14 07:15:42'),
(441, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:16:25', '2024-01-14 07:16:25'),
(442, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:16:29', '2024-01-14 07:16:29'),
(443, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:19:21', '2024-01-14 07:19:21'),
(444, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:20:27', '2024-01-14 07:20:27'),
(445, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:20:31', '2024-01-14 07:20:31'),
(446, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:59:41', '2024-01-14 07:59:41'),
(447, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 07:59:57', '2024-01-14 07:59:57'),
(448, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:01:23', '2024-01-14 08:01:23'),
(449, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:01:28', '2024-01-14 08:01:28'),
(450, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:01:52', '2024-01-14 08:01:52'),
(451, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:01:58', '2024-01-14 08:01:58'),
(452, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:02:09', '2024-01-14 08:02:09'),
(453, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:02:13', '2024-01-14 08:02:13'),
(454, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:02:45', '2024-01-14 08:02:45'),
(455, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:02:49', '2024-01-14 08:02:49'),
(456, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:02:57', '2024-01-14 08:02:57'),
(457, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:03:01', '2024-01-14 08:03:01'),
(458, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:03:15', '2024-01-14 08:03:15'),
(459, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:03:18', '2024-01-14 08:03:18'),
(460, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:03:20', '2024-01-14 08:03:20'),
(461, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:12', '2024-01-14 08:04:12'),
(462, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:17', '2024-01-14 08:04:17'),
(463, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:31', '2024-01-14 08:04:31'),
(464, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:33', '2024-01-14 08:04:33'),
(465, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:35', '2024-01-14 08:04:35'),
(466, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:37', '2024-01-14 08:04:37'),
(467, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:40', '2024-01-14 08:04:40'),
(468, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:43', '2024-01-14 08:04:43'),
(469, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:45', '2024-01-14 08:04:45'),
(470, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:04:56', '2024-01-14 08:04:56'),
(471, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:06:36', '2024-01-14 08:06:36'),
(472, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:07:33', '2024-01-14 08:07:33'),
(473, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:07:37', '2024-01-14 08:07:37'),
(474, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:07:58', '2024-01-14 08:07:58'),
(475, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:07:59', '2024-01-14 08:07:59'),
(476, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:08:11', '2024-01-14 08:08:11'),
(477, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:08:17', '2024-01-14 08:08:17'),
(478, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:08:19', '2024-01-14 08:08:19'),
(479, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:10:45', '2024-01-14 08:10:45'),
(480, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:10:51', '2024-01-14 08:10:51'),
(481, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:10', '2024-01-14 08:11:10'),
(482, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:15', '2024-01-14 08:11:15'),
(483, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:28', '2024-01-14 08:11:28'),
(484, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:33', '2024-01-14 08:11:33'),
(485, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:38', '2024-01-14 08:11:38'),
(486, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:43', '2024-01-14 08:11:43'),
(487, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:46', '2024-01-14 08:11:46'),
(488, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:11:49', '2024-01-14 08:11:49'),
(489, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:12:07', '2024-01-14 08:12:07'),
(490, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:13:31', '2024-01-14 08:13:31'),
(491, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:13:35', '2024-01-14 08:13:35'),
(492, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:14:55', '2024-01-14 08:14:55'),
(493, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:14:59', '2024-01-14 08:14:59'),
(494, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:15:52', '2024-01-14 08:15:52'),
(495, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:15:57', '2024-01-14 08:15:57'),
(496, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:17:38', '2024-01-14 08:17:38'),
(497, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:17:42', '2024-01-14 08:17:42'),
(498, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:18:41', '2024-01-14 08:18:41'),
(499, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:18:45', '2024-01-14 08:18:45'),
(500, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:19:27', '2024-01-14 08:19:27'),
(501, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:19:33', '2024-01-14 08:19:33'),
(502, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:21:04', '2024-01-14 08:21:04'),
(503, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:21:07', '2024-01-14 08:21:07'),
(504, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:22:21', '2024-01-14 08:22:21'),
(505, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:22:24', '2024-01-14 08:22:24'),
(506, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:22:52', '2024-01-14 08:22:52'),
(507, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:22:55', '2024-01-14 08:22:55'),
(508, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:24:29', '2024-01-14 08:24:29'),
(509, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:24:32', '2024-01-14 08:24:32'),
(510, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:26:47', '2024-01-14 08:26:47'),
(511, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:26:50', '2024-01-14 08:26:50'),
(512, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:28:09', '2024-01-14 08:28:09'),
(513, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:28:13', '2024-01-14 08:28:13'),
(514, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:28:34', '2024-01-14 08:28:34'),
(515, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:28:37', '2024-01-14 08:28:37'),
(516, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:29:38', '2024-01-14 08:29:38'),
(517, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:29:41', '2024-01-14 08:29:41'),
(518, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:35:07', '2024-01-14 08:35:07'),
(519, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:35:11', '2024-01-14 08:35:11'),
(520, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:35:29', '2024-01-14 08:35:29'),
(521, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:35:33', '2024-01-14 08:35:33'),
(522, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:27', '2024-01-14 08:46:27'),
(523, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:46:28', '2024-01-14 08:46:28'),
(524, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:47:00', '2024-01-14 08:47:00'),
(525, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:47:03', '2024-01-14 08:47:03'),
(526, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:47:15', '2024-01-14 08:47:15'),
(527, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:47:16', '2024-01-14 08:47:16'),
(528, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:09', '2024-01-14 08:49:09'),
(529, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:12', '2024-01-14 08:49:12'),
(530, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:23', '2024-01-14 08:49:23'),
(531, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 08:49:24', '2024-01-14 08:49:24'),
(532, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:00:05', '2024-01-14 09:00:05'),
(533, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:14:45', '2024-01-14 09:14:45'),
(534, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:14:59', '2024-01-14 09:14:59'),
(535, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:15:11', '2024-01-14 09:15:11'),
(536, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:15:42', '2024-01-14 09:15:42'),
(537, '127.0.0.1', 'superAdmin.generated::61HV32hE8s5GqTRW', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/daily_sale/2024/01', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:15:51', '2024-01-14 09:15:51'),
(538, '127.0.0.1', 'superAdmin.generated::ZnQBNlOnqubyxiTW', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:16:58', '2024-01-14 09:16:58'),
(539, '127.0.0.1', 'superAdmin.generated::VtSyVKvxq8nnQbFg', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:17:32', '2024-01-14 09:17:32'),
(540, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:19:15', '2024-01-14 09:19:15'),
(541, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:19:25', '2024-01-14 09:19:25'),
(542, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:19:56', '2024-01-14 09:19:56'),
(543, '127.0.0.1', 'superAdmin.generated::ZnQBNlOnqubyxiTW', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/monthly_sale/2024', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:20:10', '2024-01-14 09:20:10'),
(544, '127.0.0.1', 'superAdmin.generated::ZnQBNlOnqubyxiTW', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:20:20', '2024-01-14 09:20:20'),
(545, '127.0.0.1', 'superAdmin.report.monthlySaleByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:20:27', '2024-01-14 09:20:27'),
(546, '127.0.0.1', 'superAdmin.report.monthlySaleByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:20:34', '2024-01-14 09:20:34'),
(547, '127.0.0.1', 'superAdmin.report.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale_report', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:20:49', '2024-01-14 09:20:49'),
(548, '127.0.0.1', 'superAdmin.generated::VtSyVKvxq8nnQbFg', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:26:44', '2024-01-14 09:26:44'),
(549, '127.0.0.1', 'superAdmin.generated::VtSyVKvxq8nnQbFg', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:27:40', '2024-01-14 09:27:40'),
(550, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:27:52', '2024-01-14 09:27:52'),
(551, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:28:00', '2024-01-14 09:28:00'),
(552, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:29:23', '2024-01-14 09:29:23'),
(553, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:29:39', '2024-01-14 09:29:39'),
(554, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:30:46', '2024-01-14 09:30:46'),
(555, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:33:43', '2024-01-14 09:33:43'),
(556, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:47:19', '2024-01-14 09:47:19'),
(557, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 09:47:35', '2024-01-14 09:47:35');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(558, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:09:42', '2024-01-14 10:09:42'),
(559, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:11:22', '2024-01-14 10:11:22'),
(560, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:12:16', '2024-01-14 10:12:16'),
(561, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:12:46', '2024-01-14 10:12:46'),
(562, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:13:19', '2024-01-14 10:13:19'),
(563, '127.0.0.1', 'superAdmin.report.bestSellerByWarehouse', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:13:48', '2024-01-14 10:13:48'),
(564, '127.0.0.1', 'superAdmin.generated::VtSyVKvxq8nnQbFg', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/best_seller', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:16:46', '2024-01-14 10:16:46'),
(565, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:26:59', '2024-01-14 10:26:59'),
(566, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:27:10', '2024-01-14 10:27:10'),
(567, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:28:03', '2024-01-14 10:28:03'),
(568, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:28:04', '2024-01-14 10:28:04'),
(569, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:28:19', '2024-01-14 10:28:19'),
(570, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:07', '2024-01-14 10:34:07'),
(571, '127.0.0.1', 'superAdmin.return-sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/return-sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:19', '2024-01-14 10:34:19'),
(572, '127.0.0.1', 'superAdmin.return-sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/return-sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:23', '2024-01-14 10:34:23'),
(573, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:32', '2024-01-14 10:34:32'),
(574, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:40', '2024-01-14 10:34:40'),
(575, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:34:56', '2024-01-14 10:34:56'),
(576, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:35:18', '2024-01-14 10:35:18'),
(577, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:35:35', '2024-01-14 10:35:35'),
(578, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:37:12', '2024-01-14 10:37:12'),
(579, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:58:05', '2024-01-14 10:58:05'),
(580, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:58:17', '2024-01-14 10:58:17'),
(581, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 10:59:26', '2024-01-14 10:59:26'),
(582, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:01:20', '2024-01-14 11:01:20'),
(583, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:02:58', '2024-01-14 11:02:58'),
(584, '127.0.0.1', 'superAdmin.report.saleChart', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/report/sale-report-chart', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-14 11:05:56', '2024-01-14 11:05:56'),
(585, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-15 09:41:03', '2024-01-15 09:41:03'),
(586, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 05:46:44', '2024-01-16 05:46:44'),
(587, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 05:54:03', '2024-01-16 05:54:03'),
(588, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 05:54:11', '2024-01-16 05:54:11'),
(589, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 06:28:28', '2024-01-16 06:28:28'),
(590, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:21:16', '2024-01-16 08:21:16'),
(591, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:21:22', '2024-01-16 08:21:22'),
(592, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:21:28', '2024-01-16 08:21:28'),
(593, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:27:54', '2024-01-16 08:27:54'),
(594, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:31:24', '2024-01-16 08:31:24'),
(595, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:33:02', '2024-01-16 08:33:02'),
(596, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:37:16', '2024-01-16 08:37:16'),
(597, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:51:50', '2024-01-16 08:51:50'),
(598, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:52:18', '2024-01-16 08:52:18'),
(599, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 08:52:19', '2024-01-16 08:52:19'),
(600, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:08:11', '2024-01-16 09:08:11'),
(601, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:08:14', '2024-01-16 09:08:14'),
(602, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:08:15', '2024-01-16 09:08:15'),
(603, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:08:48', '2024-01-16 09:08:48'),
(604, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:08:58', '2024-01-16 09:08:58'),
(605, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:01', '2024-01-16 09:09:01'),
(606, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:01', '2024-01-16 09:09:01'),
(607, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:13', '2024-01-16 09:09:13'),
(608, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:16', '2024-01-16 09:09:16'),
(609, '127.0.0.1', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:18', '2024-01-16 09:09:18'),
(610, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:22', '2024-01-16 09:09:22'),
(611, '127.0.0.1', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:28', '2024-01-16 09:09:28'),
(612, '127.0.0.1', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:47', '2024-01-16 09:09:47'),
(613, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:48', '2024-01-16 09:09:48'),
(614, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:50', '2024-01-16 09:09:50'),
(615, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:53', '2024-01-16 09:09:53'),
(616, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:56', '2024-01-16 09:09:56'),
(617, '127.0.0.1', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:09:58', '2024-01-16 09:09:58'),
(618, '127.0.0.1', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:13', '2024-01-16 09:10:13'),
(619, '127.0.0.1', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:20', '2024-01-16 09:10:20'),
(620, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:20', '2024-01-16 09:10:20'),
(621, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:23', '2024-01-16 09:10:23'),
(622, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:26', '2024-01-16 09:10:26'),
(623, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:29', '2024-01-16 09:10:29'),
(624, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:32', '2024-01-16 09:10:32'),
(625, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:39', '2024-01-16 09:10:39'),
(626, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:42', '2024-01-16 09:10:42'),
(627, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:10:42', '2024-01-16 09:10:42'),
(628, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:26:53', '2024-01-16 09:26:53'),
(629, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:03', '2024-01-16 09:27:03'),
(630, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:05', '2024-01-16 09:27:05'),
(631, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:05', '2024-01-16 09:27:05'),
(632, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:15', '2024-01-16 09:27:15'),
(633, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:27', '2024-01-16 09:27:27'),
(634, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:28', '2024-01-16 09:27:28'),
(635, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:27:29', '2024-01-16 09:27:29'),
(636, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:29:46', '2024-01-16 09:29:46'),
(637, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:29:58', '2024-01-16 09:29:58'),
(638, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:29:58', '2024-01-16 09:29:58'),
(639, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:29:59', '2024-01-16 09:29:59'),
(640, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:30:15', '2024-01-16 09:30:15'),
(641, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:30:28', '2024-01-16 09:30:28'),
(642, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:30:29', '2024-01-16 09:30:29'),
(643, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:30:29', '2024-01-16 09:30:29'),
(644, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:31:54', '2024-01-16 09:31:54'),
(645, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:32:04', '2024-01-16 09:32:04'),
(646, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:32:06', '2024-01-16 09:32:06'),
(647, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:32:06', '2024-01-16 09:32:06'),
(648, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:32:19', '2024-01-16 09:32:19'),
(649, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:32:20', '2024-01-16 09:32:20'),
(650, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:34:22', '2024-01-16 09:34:22'),
(651, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:34:23', '2024-01-16 09:34:23'),
(652, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:34:59', '2024-01-16 09:34:59'),
(653, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:35:00', '2024-01-16 09:35:00'),
(654, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:35:25', '2024-01-16 09:35:25'),
(655, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:35:26', '2024-01-16 09:35:26'),
(656, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:06', '2024-01-16 09:36:06'),
(657, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:13', '2024-01-16 09:36:13'),
(658, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:23', '2024-01-16 09:36:23'),
(659, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:25', '2024-01-16 09:36:25'),
(660, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:25', '2024-01-16 09:36:25'),
(661, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:33', '2024-01-16 09:36:33'),
(662, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:39', '2024-01-16 09:36:39'),
(663, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:42', '2024-01-16 09:36:42'),
(664, '127.0.0.1', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.edit/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:46', '2024-01-16 09:36:46'),
(665, '127.0.0.1', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:50', '2024-01-16 09:36:50'),
(666, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:50', '2024-01-16 09:36:50'),
(667, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:36:58', '2024-01-16 09:36:58'),
(668, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:01', '2024-01-16 09:37:01'),
(669, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:04', '2024-01-16 09:37:04'),
(670, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:09', '2024-01-16 09:37:09'),
(671, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:16', '2024-01-16 09:37:16'),
(672, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:17', '2024-01-16 09:37:17'),
(673, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:18', '2024-01-16 09:37:18'),
(674, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:27', '2024-01-16 09:37:27'),
(675, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:37:32', '2024-01-16 09:37:32'),
(676, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:20', '2024-01-16 09:38:20'),
(677, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:23', '2024-01-16 09:38:23'),
(678, '127.0.0.1', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:26', '2024-01-16 09:38:26'),
(679, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:29', '2024-01-16 09:38:29'),
(680, '127.0.0.1', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:37', '2024-01-16 09:38:37'),
(681, '127.0.0.1', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:54', '2024-01-16 09:38:54'),
(682, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:55', '2024-01-16 09:38:55'),
(683, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:38:58', '2024-01-16 09:38:58'),
(684, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:03', '2024-01-16 09:39:03'),
(685, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:06', '2024-01-16 09:39:06'),
(686, '127.0.0.1', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:08', '2024-01-16 09:39:08'),
(687, '127.0.0.1', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:26', '2024-01-16 09:39:26'),
(688, '127.0.0.1', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:32', '2024-01-16 09:39:32'),
(689, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:33', '2024-01-16 09:39:33'),
(690, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:36', '2024-01-16 09:39:36'),
(691, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:39', '2024-01-16 09:39:39'),
(692, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:42', '2024-01-16 09:39:42'),
(693, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:47', '2024-01-16 09:39:47'),
(694, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:53', '2024-01-16 09:39:53'),
(695, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:39:59', '2024-01-16 09:39:59'),
(696, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:40:00', '2024-01-16 09:40:00'),
(697, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:40:53', '2024-01-16 09:40:53'),
(698, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:41:03', '2024-01-16 09:41:03'),
(699, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:41:05', '2024-01-16 09:41:05'),
(700, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:41:05', '2024-01-16 09:41:05'),
(701, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:41:10', '2024-01-16 09:41:10'),
(702, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:41:12', '2024-01-16 09:41:12'),
(703, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:42:41', '2024-01-16 09:42:41'),
(704, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:43:57', '2024-01-16 09:43:57'),
(705, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:44:08', '2024-01-16 09:44:08'),
(706, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:44:10', '2024-01-16 09:44:10'),
(707, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:44:11', '2024-01-16 09:44:11'),
(708, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:44:14', '2024-01-16 09:44:14'),
(709, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:44:16', '2024-01-16 09:44:16'),
(710, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:45:25', '2024-01-16 09:45:25'),
(711, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:54:43', '2024-01-16 09:54:43'),
(712, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:54:54', '2024-01-16 09:54:54'),
(713, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:54:55', '2024-01-16 09:54:55'),
(714, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:54:56', '2024-01-16 09:54:56'),
(715, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:55:01', '2024-01-16 09:55:01'),
(716, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:55:04', '2024-01-16 09:55:04'),
(717, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:56:41', '2024-01-16 09:56:41'),
(718, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:56:54', '2024-01-16 09:56:54'),
(719, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:56:55', '2024-01-16 09:56:55'),
(720, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:56:55', '2024-01-16 09:56:55'),
(721, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:57:00', '2024-01-16 09:57:00'),
(722, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:57:02', '2024-01-16 09:57:02'),
(723, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/10', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:57:13', '2024-01-16 09:57:13'),
(724, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/10', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:57:14', '2024-01-16 09:57:14'),
(725, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:58:43', '2024-01-16 09:58:43'),
(726, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:58:46', '2024-01-16 09:58:46'),
(727, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:58:53', '2024-01-16 09:58:53'),
(728, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:05', '2024-01-16 09:59:05'),
(729, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:07', '2024-01-16 09:59:07'),
(730, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:07', '2024-01-16 09:59:07'),
(731, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:12', '2024-01-16 09:59:12'),
(732, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:14', '2024-01-16 09:59:14'),
(733, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:15', '2024-01-16 09:59:15'),
(734, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 09:59:16', '2024-01-16 09:59:16'),
(735, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:18', '2024-01-16 10:02:18'),
(736, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:19', '2024-01-16 10:02:19'),
(737, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:34', '2024-01-16 10:02:34'),
(738, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:44', '2024-01-16 10:02:44'),
(739, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:46', '2024-01-16 10:02:46'),
(740, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:46', '2024-01-16 10:02:46'),
(741, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:50', '2024-01-16 10:02:50'),
(742, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:52', '2024-01-16 10:02:52'),
(743, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:53', '2024-01-16 10:02:53'),
(744, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:02:54', '2024-01-16 10:02:54'),
(745, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:03:30', '2024-01-16 10:03:30'),
(746, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/12', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:04:13', '2024-01-16 10:04:13'),
(747, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:04:16', '2024-01-16 10:04:16'),
(748, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:04:20', '2024-01-16 10:04:20'),
(749, '127.0.0.1', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:04:39', '2024-01-16 10:04:39'),
(750, '127.0.0.1', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:05:31', '2024-01-16 10:05:31'),
(751, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:08:18', '2024-01-16 10:08:18'),
(752, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:08:21', '2024-01-16 10:08:21'),
(753, '127.0.0.1', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:21', '2024-01-16 10:09:21'),
(754, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:26', '2024-01-16 10:09:26'),
(755, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:30', '2024-01-16 10:09:30'),
(756, '127.0.0.1', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:40', '2024-01-16 10:09:40'),
(757, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:45', '2024-01-16 10:09:45'),
(758, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:48', '2024-01-16 10:09:48'),
(759, '127.0.0.1', 'superAdmin.sale.getpayment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getpayment/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:09:57', '2024-01-16 10:09:57'),
(760, '127.0.0.1', 'superAdmin.sale.update-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.updatepayment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:10:06', '2024-01-16 10:10:06'),
(761, '127.0.0.1', 'superAdmin.sale.update-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.updatepayment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:00', '2024-01-16 10:12:00'),
(762, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:05', '2024-01-16 10:12:05'),
(763, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:08', '2024-01-16 10:12:08'),
(764, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:19', '2024-01-16 10:12:19'),
(765, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:28', '2024-01-16 10:12:28'),
(766, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:31', '2024-01-16 10:12:31'),
(767, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/11', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:39', '2024-01-16 10:12:39'),
(768, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:48', '2024-01-16 10:12:48'),
(769, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:48', '2024-01-16 10:12:48'),
(770, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:52', '2024-01-16 10:12:52'),
(771, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:56', '2024-01-16 10:12:56');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(772, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:12:59', '2024-01-16 10:12:59'),
(773, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:13:07', '2024-01-16 10:13:07'),
(774, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:15:44', '2024-01-16 10:15:44'),
(775, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:16:39', '2024-01-16 10:16:39'),
(776, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:18:07', '2024-01-16 10:18:07'),
(777, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:18:44', '2024-01-16 10:18:44'),
(778, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 10:19:25', '2024-01-16 10:19:25'),
(779, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:02:57', '2024-01-16 11:02:57'),
(780, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:11', '2024-01-16 11:03:11'),
(781, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:13', '2024-01-16 11:03:13'),
(782, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:13', '2024-01-16 11:03:13'),
(783, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:17', '2024-01-16 11:03:17'),
(784, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:21', '2024-01-16 11:03:21'),
(785, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:22', '2024-01-16 11:03:22'),
(786, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:24', '2024-01-16 11:03:24'),
(787, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:27', '2024-01-16 11:03:27'),
(788, '127.0.0.1', 'superAdmin.sale.add-payment', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.add_payment', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:39', '2024-01-16 11:03:39'),
(789, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:43', '2024-01-16 11:03:43'),
(790, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:47', '2024-01-16 11:03:47'),
(791, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:03:56', '2024-01-16 11:03:56'),
(792, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:05', '2024-01-16 11:04:05'),
(793, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:05', '2024-01-16 11:04:05'),
(794, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:09', '2024-01-16 11:04:09'),
(795, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:26', '2024-01-16 11:04:26'),
(796, '127.0.0.1', 'superAdmin.sale.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.edit/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:33', '2024-01-16 11:04:33'),
(797, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:36', '2024-01-16 11:04:36'),
(798, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:36', '2024-01-16 11:04:36'),
(799, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:37', '2024-01-16 11:04:37'),
(800, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:44', '2024-01-16 11:04:44'),
(801, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:52', '2024-01-16 11:04:52'),
(802, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:57', '2024-01-16 11:04:57'),
(803, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:04:58', '2024-01-16 11:04:58'),
(804, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:05:02', '2024-01-16 11:05:02'),
(805, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:30', '2024-01-16 11:06:30'),
(806, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:34', '2024-01-16 11:06:34'),
(807, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:41', '2024-01-16 11:06:41'),
(808, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:45', '2024-01-16 11:06:45'),
(809, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:46', '2024-01-16 11:06:46'),
(810, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:06:50', '2024-01-16 11:06:50'),
(811, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:07:54', '2024-01-16 11:07:54'),
(812, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:07:58', '2024-01-16 11:07:58'),
(813, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:08:04', '2024-01-16 11:08:04'),
(814, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:08:10', '2024-01-16 11:08:10'),
(815, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:08:10', '2024-01-16 11:08:10'),
(816, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:08:14', '2024-01-16 11:08:14'),
(817, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:05', '2024-01-16 11:10:05'),
(818, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:08', '2024-01-16 11:10:08'),
(819, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:15', '2024-01-16 11:10:15'),
(820, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:18', '2024-01-16 11:10:18'),
(821, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:18', '2024-01-16 11:10:18'),
(822, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:10:22', '2024-01-16 11:10:22'),
(823, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:17:51', '2024-01-16 11:17:51'),
(824, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:17:58', '2024-01-16 11:17:58'),
(825, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:18:03', '2024-01-16 11:18:03'),
(826, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:18:07', '2024-01-16 11:18:07'),
(827, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:18:07', '2024-01-16 11:18:07'),
(828, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:18:11', '2024-01-16 11:18:11'),
(829, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:00', '2024-01-16 11:23:00'),
(830, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:04', '2024-01-16 11:23:04'),
(831, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:16', '2024-01-16 11:23:16'),
(832, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:20', '2024-01-16 11:23:20'),
(833, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:21', '2024-01-16 11:23:21'),
(834, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:23:25', '2024-01-16 11:23:25'),
(835, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:12', '2024-01-16 11:25:12'),
(836, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:16', '2024-01-16 11:25:16'),
(837, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:23', '2024-01-16 11:25:23'),
(838, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:25', '2024-01-16 11:25:25'),
(839, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:26', '2024-01-16 11:25:26'),
(840, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:25:30', '2024-01-16 11:25:30'),
(841, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:26:52', '2024-01-16 11:26:52'),
(842, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:26:57', '2024-01-16 11:26:57'),
(843, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:03', '2024-01-16 11:27:03'),
(844, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:06', '2024-01-16 11:27:06'),
(845, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:14', '2024-01-16 11:27:14'),
(846, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:17', '2024-01-16 11:27:17'),
(847, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:17', '2024-01-16 11:27:17'),
(848, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:27:21', '2024-01-16 11:27:21'),
(849, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:00', '2024-01-16 11:28:00'),
(850, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:04', '2024-01-16 11:28:04'),
(851, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:12', '2024-01-16 11:28:12'),
(852, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:15', '2024-01-16 11:28:15'),
(853, '127.0.0.1', 'superAdmin.sale.delivery.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery.create/13', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:21', '2024-01-16 11:28:21'),
(854, '127.0.0.1', 'superAdmin.sale.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:25', '2024-01-16 11:28:25'),
(855, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:25', '2024-01-16 11:28:25'),
(856, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:28:29', '2024-01-16 11:28:29'),
(857, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:23', '2024-01-16 11:35:23'),
(858, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:27', '2024-01-16 11:35:27'),
(859, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:32', '2024-01-16 11:35:32'),
(860, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:41', '2024-01-16 11:35:41'),
(861, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:43', '2024-01-16 11:35:43'),
(862, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:43', '2024-01-16 11:35:43'),
(863, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:48', '2024-01-16 11:35:48'),
(864, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:50', '2024-01-16 11:35:50'),
(865, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/14', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:50', '2024-01-16 11:35:50'),
(866, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:53', '2024-01-16 11:35:53'),
(867, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-16 11:35:57', '2024-01-16 11:35:57'),
(868, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:51:09', '2024-01-17 03:51:09'),
(869, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:51:21', '2024-01-17 03:51:21'),
(870, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:53:30', '2024-01-17 03:53:30'),
(871, '127.0.0.1', 'superAdmin.delivery', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/delivery', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:53:34', '2024-01-17 03:53:34'),
(872, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:53:40', '2024-01-17 03:53:40'),
(873, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:56:33', '2024-01-17 03:56:33'),
(874, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:58:51', '2024-01-17 03:58:51'),
(875, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 03:58:58', '2024-01-17 03:58:58'),
(876, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:00:22', '2024-01-17 04:00:22'),
(877, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:00:24', '2024-01-17 04:00:24'),
(878, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:01:53', '2024-01-17 04:01:53'),
(879, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:20:17', '2024-01-17 04:20:17'),
(880, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:23:14', '2024-01-17 04:23:14'),
(881, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:24:21', '2024-01-17 04:24:21'),
(882, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:24:47', '2024-01-17 04:24:47'),
(883, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:25:27', '2024-01-17 04:25:27'),
(884, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:25:30', '2024-01-17 04:25:30'),
(885, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:26:46', '2024-01-17 04:26:46'),
(886, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:26:47', '2024-01-17 04:26:47'),
(887, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:27:09', '2024-01-17 04:27:09'),
(888, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:27:13', '2024-01-17 04:27:13'),
(889, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:27:17', '2024-01-17 04:27:17'),
(890, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:27:19', '2024-01-17 04:27:19'),
(891, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:32:25', '2024-01-17 04:32:25'),
(892, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:32:30', '2024-01-17 04:32:30'),
(893, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:32:49', '2024-01-17 04:32:49'),
(894, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:32:51', '2024-01-17 04:32:51'),
(895, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:10', '2024-01-17 04:33:10'),
(896, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:15', '2024-01-17 04:33:15'),
(897, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:16', '2024-01-17 04:33:16'),
(898, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:18', '2024-01-17 04:33:18'),
(899, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:20', '2024-01-17 04:33:20'),
(900, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:33:24', '2024-01-17 04:33:24'),
(901, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:34:59', '2024-01-17 04:34:59'),
(902, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:10', '2024-01-17 04:38:10'),
(903, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:14', '2024-01-17 04:38:14'),
(904, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:19', '2024-01-17 04:38:19'),
(905, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:43', '2024-01-17 04:38:43'),
(906, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:47', '2024-01-17 04:38:47'),
(907, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:47', '2024-01-17 04:38:47'),
(908, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:38:48', '2024-01-17 04:38:48'),
(909, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:40:55', '2024-01-17 04:40:55'),
(910, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:41:04', '2024-01-17 04:41:04'),
(911, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:42:48', '2024-01-17 04:42:48'),
(912, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:42:51', '2024-01-17 04:42:51'),
(913, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:24', '2024-01-17 04:43:24'),
(914, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:27', '2024-01-17 04:43:27'),
(915, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:49', '2024-01-17 04:43:49'),
(916, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:53', '2024-01-17 04:43:53'),
(917, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:53', '2024-01-17 04:43:53'),
(918, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:43:54', '2024-01-17 04:43:54'),
(919, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:44:50', '2024-01-17 04:44:50'),
(920, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:44:54', '2024-01-17 04:44:54'),
(921, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:44:55', '2024-01-17 04:44:55'),
(922, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:44:55', '2024-01-17 04:44:55'),
(923, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:46:15', '2024-01-17 04:46:15'),
(924, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:46:21', '2024-01-17 04:46:21'),
(925, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:46:22', '2024-01-17 04:46:22'),
(926, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:46:22', '2024-01-17 04:46:22'),
(927, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 04:46:25', '2024-01-17 04:46:25'),
(928, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:08:48', '2024-01-17 05:08:48'),
(929, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:15:44', '2024-01-17 05:15:44'),
(930, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:15:48', '2024-01-17 05:15:48'),
(931, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:15:49', '2024-01-17 05:15:49'),
(932, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:15:49', '2024-01-17 05:15:49'),
(933, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:15:55', '2024-01-17 05:15:55'),
(934, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:16:10', '2024-01-17 05:16:10'),
(935, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:16:12', '2024-01-17 05:16:12'),
(936, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:17:53', '2024-01-17 05:17:53'),
(937, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:17:59', '2024-01-17 05:17:59'),
(938, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:18:53', '2024-01-17 05:18:53'),
(939, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:22', '2024-01-17 05:20:22'),
(940, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:27', '2024-01-17 05:20:27'),
(941, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:27', '2024-01-17 05:20:27'),
(942, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:27', '2024-01-17 05:20:27'),
(943, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:34', '2024-01-17 05:20:34'),
(944, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:39', '2024-01-17 05:20:39'),
(945, '127.0.0.1', 'superAdmin.generated::THqq7D2FbSqMeQlk', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:20:42', '2024-01-17 05:20:42'),
(946, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:22:38', '2024-01-17 05:22:38'),
(947, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:31:40', '2024-01-17 05:31:40'),
(948, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:21', '2024-01-17 05:37:21'),
(949, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:27', '2024-01-17 05:37:27'),
(950, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:32', '2024-01-17 05:37:32'),
(951, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:44', '2024-01-17 05:37:44'),
(952, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:46', '2024-01-17 05:37:46'),
(953, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:46', '2024-01-17 05:37:46'),
(954, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:52', '2024-01-17 05:37:52'),
(955, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:54', '2024-01-17 05:37:54'),
(956, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/15', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:37:56', '2024-01-17 05:37:56'),
(957, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:38:06', '2024-01-17 05:38:06'),
(958, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:38:14', '2024-01-17 05:38:14'),
(959, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:29', '2024-01-17 05:41:29'),
(960, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:33', '2024-01-17 05:41:33'),
(961, '127.0.0.1', 'superAdmin.sale.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:36', '2024-01-17 05:41:36'),
(962, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:45', '2024-01-17 05:41:45'),
(963, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:46', '2024-01-17 05:41:46'),
(964, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:47', '2024-01-17 05:41:47'),
(965, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:53', '2024-01-17 05:41:53'),
(966, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:55', '2024-01-17 05:41:55'),
(967, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/16', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:41:56', '2024-01-17 05:41:56'),
(968, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:56:16', '2024-01-17 05:56:16'),
(969, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:56:23', '2024-01-17 05:56:23'),
(970, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 05:57:02', '2024-01-17 05:57:02'),
(971, '127.0.0.1', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 07:16:23', '2024-01-17 07:16:23'),
(972, '127.0.0.1', 'superAdmin.ganeralsetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 07:17:06', '2024-01-17 07:17:06'),
(973, '127.0.0.1', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 07:17:07', '2024-01-17 07:17:07'),
(974, '127.0.0.1', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:19:58', '2024-01-17 09:19:58'),
(975, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:20:19', '2024-01-17 09:20:19'),
(976, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:20:20', '2024-01-17 09:20:20'),
(977, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:21:49', '2024-01-17 09:21:49'),
(978, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:23:47', '2024-01-17 09:23:47'),
(979, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:30:15', '2024-01-17 09:30:15'),
(980, '127.0.0.1', 'superAdmin.ganeralsetting.sendSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.sendSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:31:46', '2024-01-17 09:31:46'),
(981, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:31:47', '2024-01-17 09:31:47'),
(982, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:41:12', '2024-01-17 09:41:12'),
(983, '127.0.0.1', 'superAdmin.ganeralsetting.sms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.sms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 09:41:24', '2024-01-17 09:41:24'),
(984, '127.0.0.1', 'superAdmin.ganeralsetting.sms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.sms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:02:29', '2024-01-17 10:02:29'),
(985, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:02:49', '2024-01-17 10:02:49'),
(986, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:03:23', '2024-01-17 10:03:23'),
(987, '127.0.0.1', 'superAdmin.ganeralsetting.createSms', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:03:31', '2024-01-17 10:03:31'),
(988, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:04:06', '2024-01-17 10:04:06');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(989, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:04:08', '2024-01-17 10:04:08'),
(990, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:05:28', '2024-01-17 10:05:28'),
(991, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:05:31', '2024-01-17 10:05:31'),
(992, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:06:05', '2024-01-17 10:06:05'),
(993, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:06:07', '2024-01-17 10:06:07'),
(994, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:08:44', '2024-01-17 10:08:44'),
(995, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:09:48', '2024-01-17 10:09:48'),
(996, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:18:05', '2024-01-17 10:18:05'),
(997, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:18:06', '2024-01-17 10:18:06'),
(998, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:18:41', '2024-01-17 10:18:41'),
(999, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:20:57', '2024-01-17 10:20:57'),
(1000, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:23:02', '2024-01-17 10:23:02'),
(1001, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:23:13', '2024-01-17 10:23:13'),
(1002, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:23:39', '2024-01-17 10:23:39'),
(1003, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:23:58', '2024-01-17 10:23:58'),
(1004, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:24:46', '2024-01-17 10:24:46'),
(1005, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:24:55', '2024-01-17 10:24:55'),
(1006, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 10:35:27', '2024-01-17 10:35:27'),
(1007, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:04:20', '2024-01-17 11:04:20'),
(1008, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:04:43', '2024-01-17 11:04:43'),
(1009, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:04:57', '2024-01-17 11:04:57'),
(1010, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:10:17', '2024-01-17 11:10:17'),
(1011, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:10:55', '2024-01-17 11:10:55'),
(1012, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:12:33', '2024-01-17 11:12:33'),
(1013, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:13:27', '2024-01-17 11:13:27'),
(1014, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:15:30', '2024-01-17 11:15:30'),
(1015, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:15:44', '2024-01-17 11:15:44'),
(1016, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:16:33', '2024-01-17 11:16:33'),
(1017, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:16:59', '2024-01-17 11:16:59'),
(1018, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:17:08', '2024-01-17 11:17:08'),
(1019, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:18:15', '2024-01-17 11:18:15'),
(1020, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:18:49', '2024-01-17 11:18:49'),
(1021, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:20:34', '2024-01-17 11:20:34'),
(1022, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:20:58', '2024-01-17 11:20:58'),
(1023, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:22:21', '2024-01-17 11:22:21'),
(1024, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:22:37', '2024-01-17 11:22:37'),
(1025, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:22:54', '2024-01-17 11:22:54'),
(1026, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:27:23', '2024-01-17 11:27:23'),
(1027, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:27:40', '2024-01-17 11:27:40'),
(1028, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/blue.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:27:46', '2024-01-17 11:27:46'),
(1029, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:29:57', '2024-01-17 11:29:57'),
(1030, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/blue.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:29:58', '2024-01-17 11:29:58'),
(1031, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/dark.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:29:59', '2024-01-17 11:29:59'),
(1032, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:31:36', '2024-01-17 11:31:36'),
(1033, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:36:17', '2024-01-17 11:36:17'),
(1034, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:36:20', '2024-01-17 11:36:20'),
(1035, '127.0.0.1', 'superAdmin.ganeralsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-17 11:36:39', '2024-01-17 11:36:39'),
(1036, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:44:23', '2024-01-18 03:44:23'),
(1037, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:44:35', '2024-01-18 03:44:35'),
(1038, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:47:42', '2024-01-18 03:47:42'),
(1039, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:47:46', '2024-01-18 03:47:46'),
(1040, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:50:45', '2024-01-18 03:50:45'),
(1041, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:50:58', '2024-01-18 03:50:58'),
(1042, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 03:51:06', '2024-01-18 03:51:06'),
(1043, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:15:39', '2024-01-18 04:15:39'),
(1044, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:19:49', '2024-01-18 04:19:49'),
(1045, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:19:57', '2024-01-18 04:19:57'),
(1046, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:21:21', '2024-01-18 04:21:21'),
(1047, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:22:38', '2024-01-18 04:22:38'),
(1048, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:26:08', '2024-01-18 04:26:08'),
(1049, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:26:13', '2024-01-18 04:26:13'),
(1050, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:26:35', '2024-01-18 04:26:35'),
(1051, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:27:38', '2024-01-18 04:27:38'),
(1052, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:27:51', '2024-01-18 04:27:51'),
(1053, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:28:34', '2024-01-18 04:28:34'),
(1054, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:28:45', '2024-01-18 04:28:45'),
(1055, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:28:46', '2024-01-18 04:28:46'),
(1056, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:30:04', '2024-01-18 04:30:04'),
(1057, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:30:10', '2024-01-18 04:30:10'),
(1058, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:30:10', '2024-01-18 04:30:10'),
(1059, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:33:21', '2024-01-18 04:33:21'),
(1060, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:33:46', '2024-01-18 04:33:46'),
(1061, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:33:46', '2024-01-18 04:33:46'),
(1062, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:35:23', '2024-01-18 04:35:23'),
(1063, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:37:06', '2024-01-18 04:37:06'),
(1064, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:42:12', '2024-01-18 04:42:12'),
(1065, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:42:13', '2024-01-18 04:42:13'),
(1066, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:05', '2024-01-18 04:46:05'),
(1067, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsettingStore', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:12', '2024-01-18 04:46:12'),
(1068, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:13', '2024-01-18 04:46:13'),
(1069, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:19', '2024-01-18 04:46:19'),
(1070, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:40', '2024-01-18 04:46:40'),
(1071, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:46:47', '2024-01-18 04:46:47'),
(1072, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:49:30', '2024-01-18 04:49:30'),
(1073, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:49:36', '2024-01-18 04:49:36'),
(1074, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:50:13', '2024-01-18 04:50:13'),
(1075, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 04:50:22', '2024-01-18 04:50:22'),
(1076, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:00:16', '2024-01-18 05:00:16'),
(1077, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:01:08', '2024-01-18 05:01:08'),
(1078, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:01:41', '2024-01-18 05:01:41'),
(1079, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:02:00', '2024-01-18 05:02:00'),
(1080, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:02:15', '2024-01-18 05:02:15'),
(1081, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:02:24', '2024-01-18 05:02:24'),
(1082, '127.0.0.1', 'superAdmin.generated::VFJpUB5n0ThhTDRj', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/general_setting/change-theme/dark.css', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:02:47', '2024-01-18 05:02:47'),
(1083, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:09:47', '2024-01-18 05:09:47'),
(1084, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:10:14', '2024-01-18 05:10:14'),
(1085, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:10:24', '2024-01-18 05:10:24'),
(1086, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:10:40', '2024-01-18 05:10:40'),
(1087, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:10:50', '2024-01-18 05:10:50'),
(1088, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:11:01', '2024-01-18 05:11:01'),
(1089, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:11:47', '2024-01-18 05:11:47'),
(1090, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:11:59', '2024-01-18 05:11:59'),
(1091, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:12:48', '2024-01-18 05:12:48'),
(1092, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:13:00', '2024-01-18 05:13:00'),
(1093, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:14:28', '2024-01-18 05:14:28'),
(1094, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:15:46', '2024-01-18 05:15:46'),
(1095, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:15:57', '2024-01-18 05:15:57'),
(1096, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:16:39', '2024-01-18 05:16:39'),
(1097, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:19:03', '2024-01-18 05:19:03'),
(1098, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:19:17', '2024-01-18 05:19:17'),
(1099, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:19:31', '2024-01-18 05:19:31'),
(1100, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:23:22', '2024-01-18 05:23:22'),
(1101, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:23:40', '2024-01-18 05:23:40'),
(1102, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:24:24', '2024-01-18 05:24:24'),
(1103, '127.0.0.1', 'superAdmin.ganeralsetting.superadminsetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:27:24', '2024-01-18 05:27:24'),
(1104, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-18 05:28:22', '2024-01-18 05:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `user_id`, `from_date`, `to_date`, `note`, `is_approved`, `created_at`, `updated_at`) VALUES
(3, 1, '2024-01-04', '2024-01-04', 'new year', 0, '2024-01-04 05:13:31', '2024-01-04 05:13:54');

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `checkin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extention` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_uploads`
--

INSERT INTO `image_uploads` (`id`, `name`, `title`, `alt`, `caption`, `description`, `slug`, `path`, `status`, `username`, `extention`, `created_at`, `updated_at`) VALUES
(23, '3_1703400840.jpg', '3', '3', NULL, NULL, '3_1703400840.jpg', '3_1703400840.jpg', '1', 'superAdmin', '.jpg', '2023-12-24 06:54:01', '2023-12-24 06:54:01'),
(24, '2_1703407027.jpg', '2', '2', NULL, NULL, '2_1703407027.jpg', '2_1703407027.jpg', '1', 'superAdmin', '.jpg', '2023-12-24 08:37:08', '2023-12-24 08:37:08'),
(25, '1_1704345879.jpg', '1', '1', NULL, NULL, '1_1704345879.jpg', '1_1704345879.jpg', '1', 'superAdmin', '.jpg', '2024-01-04 05:24:40', '2024-01-04 05:24:40'),
(26, '5_1704348499.jpg', '5', '5', NULL, NULL, '5_1704348499.jpg', '5_1704348499.jpg', '1', 'superAdmin', '.jpg', '2024-01-04 06:08:20', '2024-01-04 06:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `loginhistories`
--

CREATE TABLE `loginhistories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
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
(88, '2023_11_06_124838_create_product_adjustments_table', 32),
(89, '2024_01_01_112357_create_custom_fields_table', 33),
(90, '2024_01_16_144915_create_create_custom_fields_table', 33),
(91, '2024_01_16_150452_add_new_column_to_example_table', 34),
(92, '2024_01_17_101613_create_tables_table', 34);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
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
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('252e97d7fbafff46e413d6648a30a19c529bc06478ac0a6280ff2947c3e70d5029c09c58b5d862de', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-07 03:33:51', '2023-11-07 03:33:51', '2024-11-07 09:33:51'),
('25c33d02893e7c0c7b0b8d919fcaa54f0b307180eb7d04ca597b5226b843b5036cc38e10ba036139', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-02 03:34:30', '2023-11-02 03:34:30', '2024-11-02 09:34:30'),
('266bc75f802e42eb3a0fe6ca49f4ad6c0bd46f1f7c318591e5197fba391e2b0f0404cb2318a0797d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-30 02:32:35', '2023-07-30 02:32:35', '2024-07-30 08:32:35'),
('2719441ceb9b3044a4632f4806bb250d50660a7f2603961582f655d3c88aec60a421576d30fc48ac', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-01 03:38:26', '2023-10-01 03:38:26', '2024-10-01 09:38:26'),
('2b6bef6c1cf7c5e459187dc99c54a71b850db4de67e8a1d5fd03b9095db8b253984536dd403a8637', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-05 03:51:19', '2023-10-05 03:51:19', '2024-10-05 09:51:19'),
('2e2939eb1502fe462bb6e08cb4bcfb69bfa999fd3f48a1dd29b18487abe13aee9dccfab9318ce2c6', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-17 04:04:38', '2023-08-17 04:04:38', '2024-08-17 10:04:38'),
('3123da8a1334730b023825f8e431011c3d4b3b00bc4725faeb37f4ff320db477495d254d8581d798', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-08 03:44:05', '2023-11-08 03:44:05', '2024-11-08 09:44:05'),
('32f7639486d7acdf6e06973136965f125d61ec554913da139dbfd16e1a9fb9889ada3e0c006ecb13', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-05 21:57:28', '2023-07-05 21:57:28', '2024-07-06 03:57:28'),
('33d322261063fc1125cd921b814cd4a33ba390ddb583efa6a312d55c4854546b2f15281e696e1208', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 22:21:56', '2023-07-25 22:21:56', '2024-07-26 04:21:56'),
('353df20c4bae5a638f5149e738150c30ee77df71371763d048b186a7a3c82f955b029e35adc21e5a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-04 11:05:54', '2024-01-04 11:05:54', '2025-01-04 17:05:54'),
('39cf6708060c521780f9cb5db955a72e41c73701c1ae19caebc4e78757248e8b365dfaa4ae6bdfb1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-08 03:39:56', '2023-10-08 03:39:56', '2024-10-08 09:39:56'),
('3d29479512bf3c2faefb9e96b6e7615f5820deea09007b3d7b5e76bc4921bbbe83c478109fe118de', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-29 22:08:55', '2023-07-29 22:08:55', '2024-07-30 04:08:55'),
('4016ab552d5c6f3261db23de5d84e8fd0a2c2fc8ae223fd7c293c24e5cb986918a0cfaf520fa04fe', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-16 04:03:01', '2023-08-16 04:03:01', '2024-08-16 10:03:01'),
('466a985b963f6fa4149d5fc41207cced8fe4385350434fc15a1c0c2370268a040fab648883df7799', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-30 22:08:27', '2023-07-30 22:08:27', '2024-07-31 04:08:27'),
('47b2ea10bc7eec9ef29174ec220d5f1f3adda3a3a6823399d654de2ea0121242a9430179e381f889', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-24 03:59:29', '2023-09-24 03:59:29', '2024-09-24 09:59:29'),
('4935f2fcf2a66fffcf2b5ea607192cd7998d4d3eaa316b702fc750d8877cfd866cc106c175c335b5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-31 03:26:38', '2023-10-31 03:26:38', '2024-10-31 09:26:38'),
('4c8effefad856fb7f3107aa86882d360e7ea885e1610ea91290d63f35a90d21a0095db7feec434c0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-03 03:34:38', '2024-01-03 03:34:38', '2025-01-03 09:34:38'),
('4f3b3c794aacd7646e5f1b43dce37cc87657f12e95f30cd6dd8c76c98717d8977b444bdc2ecd735f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-13 23:01:55', '2023-05-13 23:01:55', '2024-05-14 05:01:55'),
('4f606509335abfb0b9d35bb6400b8d7585e34febbf4a593c4d5f4328fa8ad4b5935912ebf6b828d5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-20 04:13:07', '2023-08-20 04:13:07', '2024-08-20 10:13:07'),
('502b7aa571d807e7412d40c281002bc38aa95f864c6523d723b0fb926fc525bb9545f3e218388258', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-18 03:40:08', '2023-10-18 03:40:08', '2024-10-18 09:40:08'),
('53edc59593b8a7841d03810a9ea3df3e0330b42b15e7a10effb2c32c14ed6943a08be76e45c59f3f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-16 22:26:45', '2023-07-16 22:26:45', '2024-07-17 04:26:45'),
('543eab7926a569fa77420e71d81b8e10ae2d27cf5605814376abf83285372ba894b06c4b9ef0bdc0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-07 22:07:28', '2023-08-07 22:07:28', '2024-08-08 04:07:28'),
('54b41c6e203603b1cadd83f90e64a2795ef36c51833c84a4fbba05327db45cec589bd96480bf5de3', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-18 04:00:55', '2023-09-18 04:00:55', '2024-09-18 10:00:55'),
('54d96fe30d51a198bcd8158634051a8915c7e904aee9d2be8f9dd7fb853f08930733536a89770ea0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-08 09:43:52', '2023-11-08 09:43:52', '2024-11-08 15:43:52'),
('57295cf1bbdd0dfa727a24c1d39b8fcb5ee56b37d5fd291e67d2e76134b1ee0d77629df0ad7d5be6', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-13 04:31:17', '2023-09-13 04:31:17', '2024-09-13 10:31:17'),
('5a29a31296204997436c4233d024b1147ab22a10d54ac48072080609c964aebb5be10914a9d8a35b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-09 03:47:18', '2024-01-09 03:47:18', '2025-01-09 09:47:18'),
('5ac5147b985a91da2439b07f3685bef938529b19f080ec88e0e20d615d0617d02f3b0f0a29eb29a1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-02 08:48:23', '2024-01-02 08:48:23', '2025-01-02 14:48:23'),
('5f9459ec0f491b4e508d3e1be4da8bfda00b3a71d12f10d31efe961e76ac72b88d364490ba9528b5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-04 03:20:47', '2024-01-04 03:20:47', '2025-01-04 09:20:47'),
('608dafa480f1e0dd53f0344bb53c0d92d147a3a7458a892d680c4369b9e06590ae94bc6fe6bbc70b', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-08 22:16:47', '2023-08-08 22:16:47', '2024-08-09 04:16:47'),
('613d32b4c9f5b54e253d69d387a363f66f953bd14d0e8e8bc978a038eb7ca70a0c4535ebc3fa7e47', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-11 00:15:25', '2023-05-11 00:15:25', '2024-05-11 06:15:25'),
('624bbcd6149b6ed1cebac57c892d1cc13192d4f24cf59296d75a4e7c1f3eec39daceaf848109809f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 06:43:39', '2023-07-25 06:43:39', '2024-07-24 23:43:39'),
('649d97ec88071698ae9475e344151886b872fb23a790f330df84e331a3c4b6463d2a33bcaa07b271', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-13 04:10:23', '2023-08-13 04:10:23', '2024-08-13 10:10:23'),
('64dfd96682c5454c31eeb062e2c120ec73e2c945d9bfb0f67a2af42881dd71a5b7d48aed1a2f1977', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-19 22:16:41', '2023-06-19 22:16:41', '2024-06-20 04:16:41'),
('65b9526d928d30e1cd5d22b2fe22dea3513b31b58c2906fe649b1bf11724b1ea14afe872f230f575', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-12 22:59:55', '2023-07-12 22:59:55', '2024-07-13 04:59:55'),
('6ada533a3ab807221f59df57e2e98afb6ce99a3ca9a189246d41a858b41f9379c3e4279c96bbb739', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-15 03:43:50', '2023-10-15 03:43:50', '2024-10-15 09:43:50'),
('6b308cbaa30e86c3f0a2adb034d6250b1db0106102b69059a463a3fbf245933a6cb5c09735a737d1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-29 06:57:21', '2023-10-29 06:57:21', '2024-10-29 12:57:21'),
('6cbf59acbfd50c6b37c803270679e18726641e86bfb20e488bce1b190ed77953d7dd6f5d7aa7cafb', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-14 04:22:09', '2023-08-14 04:22:09', '2024-08-14 10:22:09'),
('6f499b94a43c89b8a554fe8803187ae6660f08158de9fd357a96785bd187ff7a2d41a0b35cd92ad7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-24 04:59:28', '2023-12-24 04:59:28', '2024-12-24 10:59:28'),
('6f80f6891e8a71910f54fdb97c790e5f854c79dc230da3103238a35fc4f9f47caf9cd6f164f79f49', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-11 04:38:12', '2023-09-11 04:38:12', '2024-09-11 10:38:12'),
('735dcec9081ffc5fbaa880323aa9896be09bd23cc55ea0cfeaeaaa48aab9ea6e7880f632ec18f2f8', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-14 04:06:09', '2024-01-14 04:06:09', '2025-01-14 10:06:09'),
('75571cc31701a81cc735c5fcc7a9b84df3a67392f54c6ed94de7d8d3910bea72e2462009c5f86c67', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-23 03:51:02', '2023-08-23 03:51:02', '2024-08-23 09:51:02'),
('78ad9d7d025ce726a6d0d76d9c1eb6bfb1e8518de8675244e9223396c84a619c38835cb3445a6cb5', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-01 03:41:20', '2023-11-01 03:41:20', '2024-11-01 09:41:20'),
('79156e0ce3382c1eaef29e422bddbda8b94a6e2660e122e2de90156833189f03b91ef0a38110fd26', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-03 04:08:49', '2023-09-03 04:08:49', '2024-09-03 10:08:49'),
('79b4ebf98acb3602bc17d7d0d46e00da4c39ea89ef07ff61ea3e39101e751fef93a9636edec6d974', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-10 03:37:48', '2024-01-10 03:37:48', '2025-01-10 09:37:48'),
('7cc2faed087915d4923b13ef4a9c73230cd878cb6a1070b92b0d5c4e3ea2a4ac0e62455b3e82206a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-24 06:32:56', '2023-08-24 06:32:56', '2024-08-24 12:32:56'),
('7ecda71e725f4b1743af695704ab3742dfdea39c4df85a353f0ff5a7b1addc08e305339c8578caf2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-20 22:23:58', '2023-06-20 22:23:58', '2024-06-21 04:23:58'),
('7f05a3679667e3da26939adbea42b521afa5fac78be4616c13319d3afe27996514b4e3ff08184590', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-02 08:15:33', '2023-11-02 08:15:33', '2024-11-02 14:15:33'),
('7fb4f88266823ab4de2ff54252ac4cafdc50cfdbaf505ae0bb714f0c71511cbd504712bf6c040fde', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-08 03:29:05', '2024-01-08 03:29:05', '2025-01-08 09:29:05'),
('7fe3f74f411dc0fb4e0e830a03855b3d6cbbae3b7ee753e322b606b7289c53d25cf843fa14476aad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-05 08:18:08', '2023-11-05 08:18:08', '2024-11-05 14:18:08'),
('81183cc3ca452fd5fd766ebf98d6e02c38c28e8bcb106ffbb5f04a5da78bba5a8941944db7e9f2a1', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-25 06:18:49', '2023-07-25 06:18:49', '2024-07-24 23:18:49'),
('8263299e9bfafbe707cf02a33057ad15438d24f8978ee961d26f7785418b6c7dd21a7622fb07370f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-08 22:13:49', '2023-07-08 22:13:49', '2024-07-09 04:13:49'),
('8267847975b6e6d87e41e21857ae7f0997e7dfa163fdb0e18c7ed40f389e2cb21d04c9b77f0a1a95', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-14 04:23:22', '2023-09-14 04:23:22', '2024-09-14 10:23:22'),
('851aba8bd96181bc2e5fbe69c1e0af7b3fddc7627a2d59d48cb0adbe4220611d90c9504d9917f0b7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-03 04:31:15', '2023-08-03 04:31:15', '2024-08-03 10:31:15'),
('86275149a93822c71d39f4d8044716b68c411c59dbb2ca3600f10466074d951d1e65011bcf34234a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-23 03:20:52', '2023-10-23 03:20:52', '2024-10-23 09:20:52'),
('8b68c9e009c94fedfd4735d97a49db6a92ab29e07e80cedc6e0a910cb027f30ada71ad077bd98903', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-04 03:35:48', '2023-10-04 03:35:48', '2024-10-04 09:35:48'),
('8b77067adac1687f3ab1452ae2f2f78bd1665d33f769f115516f54d309fdf0ce0563248cc73dfafe', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-09 22:03:20', '2023-07-09 22:03:20', '2024-07-10 04:03:20'),
('8d01819c714dfe8559125040ad6075d2f3a790be5daa7be45b178c92e97172176fdeeb769f86cd11', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-14 10:09:02', '2023-09-14 10:09:02', '2024-09-14 16:09:02'),
('8faaedeaf778f113010f225e240ceb1aded88c62224b25b76c34fc5fd3c17c9dfde216e470cb5ef8', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-15 22:15:39', '2023-07-15 22:15:39', '2024-07-16 04:15:39'),
('90ce5bd41d60987d6cc0633ec5ac6c208f57acf0a252501e1597ef557bfc2a337ee29834299d74da', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-09 07:04:36', '2024-01-09 07:04:36', '2025-01-09 13:04:36'),
('911701a713244cf5463f6c6f50f33d228efae57aa074a1ca269c6a46004ceec221bd62692d58e430', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-12 02:39:40', '2023-07-12 02:39:40', '2024-07-12 08:39:40'),
('913db499406c47bd7bd5bd81cd248dc136c0d5ee41b2ca8e247190383545c9acfb3321aa9fc25599', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-09 04:08:31', '2023-10-09 04:08:31', '2024-10-09 10:08:31'),
('919657a3040559a0edd781be2e22d90c7577cc45770b4a7028d39fe4c12f952ed53d5a598d04ffad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-24 08:32:55', '2023-12-24 08:32:55', '2024-12-24 14:32:55'),
('93161029e257b4ef36f5079ff4dd803d1720c563a9a15ff7bd13045417a5acbcc8985ba10ffc4c07', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-05 03:40:03', '2023-11-05 03:40:03', '2024-11-05 09:40:03'),
('942a20b684fe73162f6e27d3be06936b21f33841e94eaa2e8baac1b909aff5842d739a48b4aea0a7', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-22 22:17:21', '2023-07-22 22:17:21', '2024-07-23 04:17:21'),
('979f0c883120fa961658969511d28b18e05792c8ce9cccc1a2c7b604c67e924bef2a0784b7733427', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-01 22:46:01', '2023-08-01 22:46:01', '2024-08-02 04:46:01'),
('9869ddccdfa4c9f024c8620e6372fbe3b166e8b583afebf198501837a9d97789211b214191398f8d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-12 03:56:22', '2023-09-12 03:56:22', '2024-09-12 09:56:22'),
('9b4fb0a528bbcf2a099a9c77707f9a4c2ea6a404f2eb7b7f9f9d25523cc18f2e855a0b7f8fd44011', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-17 23:41:46', '2023-07-17 23:41:46', '2024-07-18 05:41:46'),
('9c4ccb0472855246ffc021d9db09823192a1a31c9e0620dafd64235e5dfed362b2d994788cd448ad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-18 22:29:07', '2023-06-18 22:29:07', '2024-06-19 04:29:07'),
('9cd68aa7ad2471de0c94417f694b1f3a878ab03220971b5150a6a5b143efd093bd8df3375bedfe44', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-08 08:37:56', '2024-01-08 08:37:56', '2025-01-08 14:37:56'),
('a0b6e27ee1eb90ee325e0df101a0273f3eddb6257c51d9bee6f412525525b427f06893e757364de0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-15 21:58:58', '2023-05-15 21:58:58', '2024-05-16 03:58:58'),
('a3e252da6af402ecf00480fe420b3f999cf469884ebc4523073c6486c2fd4650e57bfc6ee5b9f5c8', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-14 07:05:19', '2024-01-14 07:05:19', '2025-01-14 13:05:19'),
('a419b726fbcd096c0ff50b59f867fcb7001722fb2d55bbb8cbb63425dbd15c36e2a92aa07cb9632d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-21 22:23:07', '2023-06-21 22:23:07', '2024-06-22 04:23:07'),
('a6cc1e34588985ce2450a27e27be74de35b8189d65e601f12c033e7fbd1a4d9ef0e8e63feb744a14', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-28 04:12:07', '2023-08-28 04:12:07', '2024-08-28 10:12:07'),
('a7ef0d359c2614626db66bf9386bc00c23a294b4ea5abcf2958dfce7d15feacaf2b1ac0269ccae4f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-31 03:59:08', '2023-08-31 03:59:08', '2024-08-31 09:59:08'),
('a9bdc3ad7642ca411256c21a6ecdcec81fa9de7de3f8c854f9b475823dda41d1404955816562cd40', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-11 03:36:56', '2023-10-11 03:36:56', '2024-10-11 09:36:56'),
('aa7d802f79c98716f1bb78dbf75a2cdc9ac7f29f462e4e933bfda89acf7acbf8647e363ee1f1603a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-11 00:30:26', '2023-05-11 00:30:26', '2024-05-11 06:30:26'),
('aba523c584e154bf0213f66e6bd19400c0ee123fd865f1bb461f3b88ba1c0e769fdf08b3a872325d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-29 03:56:22', '2023-08-29 03:56:22', '2024-08-29 09:56:22'),
('abec709337757c0847d7af498ee30d6c3428982b51fe8569600b27b328ce6e91e3284b1945aea30c', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-10-30 03:49:34', '2023-10-30 03:49:34', '2024-10-30 09:49:34'),
('ad5fc96b2024ff5365db04b858b965de98d446036596e9cf444283c0ec741a3edd577fc9fc08e45a', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-21 04:11:48', '2023-09-21 04:11:48', '2024-09-21 10:11:48'),
('ae3d44a91cfa9cab206ba2d3b70dfeda4a8b93878ada9a3aebd9ebfe48cd436fabd93ae85c737ea2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-11-06 04:20:31', '2023-11-06 04:20:31', '2024-11-06 10:20:31'),
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
('cb851c33da66df46f9d63c90d0fc8cf9e118bc7597986d35ac541649053cf6695211b5a722616e11', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-16 05:54:02', '2024-01-16 05:54:02', '2025-01-16 11:54:02'),
('cc193f02fa98a2ef77bf12e57286c7f97c482b992a07750a5badb7747f783b179cdd5bf4bff021a2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-14 22:08:52', '2023-05-14 22:08:52', '2024-05-15 04:08:52'),
('cc2df446fa1a170f912b93bec7c6343b286298ab94944b5103e2afabd153ecc44500a8d2beb7ad3f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-26 01:04:03', '2023-07-26 01:04:03', '2024-07-25 18:04:03'),
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
('e9539971042b1676c79a46ea566a0c00852c909957bc0d1cd50eddd52d8340509942289251657c73', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-24 22:11:43', '2023-06-24 22:11:43', '2024-06-25 04:11:43'),
('ece6ce0fe35d778d86a3a1ff1821096783a125df2428fe1d23a03b051beef22517e42444cf852ec2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-17 04:08:06', '2023-09-17 04:08:06', '2024-09-17 10:08:06'),
('eea5b82b9f5816a76366c9b40bdc95311b0c6628e5591170624f9b0b2087e096c9d89e3a0ab916ab', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-04 04:19:28', '2023-09-04 04:19:28', '2024-09-04 10:19:28'),
('f0ec6a0213917dcd7f847b662cbc273e367d613689b4946fc8df2bdf33270c7398f17b3a20a2afda', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-05 04:08:35', '2023-09-05 04:08:35', '2024-09-05 10:08:35'),
('f3d90947f9bbfdbd56bcbdab082fb63174e1f526bc7e7587e283470a8269cc80c4902808a57e5f08', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-26 03:57:05', '2023-12-26 03:57:05', '2024-12-26 09:57:05'),
('f7238aad3b4f4645922fa2a500f59a7899d1d826266892fceb74d7e8c438860fd8893fabe0627008', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-18 22:23:57', '2023-07-18 22:23:57', '2024-07-19 04:23:57'),
('f7b9d966ac97c5ce0a1349b2042382a01d07e65773178a6e07ff9efa938f6613b0e63cb46b9a882f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-17 22:27:46', '2023-05-17 22:27:46', '2024-05-18 04:27:46'),
('fcac65eda40d9fc0a362aad560dd2c5b2cf2643eac07e0222fd2b6d01b8f802cdc23b43383f71718', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-14 06:54:59', '2024-01-14 06:54:59', '2025-01-14 12:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(15) DEFAULT NULL,
  `paying_method` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used_points` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `change` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sale_id`, `purchase_id`, `cash_register_id`, `account_id`, `user_id`, `paying_method`, `payment_reference`, `used_points`, `amount`, `change`, `payment_note`, `created_at`, `updated_at`) VALUES
(1, NULL, 3, NULL, 1, 1, 'Cash', 'ppr-20231224-124301', NULL, 2706, '0', NULL, '2023-12-24 06:43:01', '2023-12-24 06:43:01'),
(2, NULL, 2, NULL, 1, 1, 'Cash', 'ppr-20231224-124308', NULL, 2706, '0', NULL, '2023-12-24 06:43:08', '2023-12-24 06:43:08'),
(3, NULL, 1, NULL, 1, 1, 'Cash', 'ppr-20231224-124315', NULL, 1353, '0', NULL, '2023-12-24 06:43:15', '2023-12-24 06:43:15'),
(4, 1, NULL, 1, 1, 1, 'Cash', 'spr-20231224-023634', NULL, 349.57, '0', NULL, '2023-12-24 08:36:34', '2023-12-24 08:36:34'),
(5, 3, NULL, 1, 1, 1, 'Cash', 'spr-20240103-034114', NULL, 699.14, '0', NULL, '2024-01-03 09:41:14', '2024-01-03 09:41:14'),
(6, 12, NULL, 1, 1, 1, 'Cash', 'spr-20240116-040439', NULL, 349.57, '0', NULL, '2024-01-16 10:04:39', '2024-01-16 10:04:39'),
(7, 12, NULL, 1, 1, 1, 'Cash', 'spr-20240116-040531', NULL, 349.57, '0', NULL, '2024-01-16 10:05:31', '2024-01-16 10:05:31'),
(8, 12, NULL, 1, 1, 1, 'Cash', 'spr-20240116-040922', NULL, -349.57, '0', NULL, '2024-01-16 10:09:22', '2024-01-16 10:09:22'),
(9, 11, NULL, 1, 1, 1, 'Cash', 'spr-20240116-040940', NULL, 349.57, '0', NULL, '2024-01-16 10:09:40', '2024-01-16 10:10:06'),
(10, 13, NULL, 1, 1, 1, 'Cash', 'spr-20240116-050339', NULL, 349.57, '0', NULL, '2024-01-16 11:03:39', '2024-01-16 11:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheques`
--

CREATE TABLE `payment_with_cheques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_cards`
--

CREATE TABLE `payment_with_credit_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_cards`
--

CREATE TABLE `payment_with_gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postmetas`
--

CREATE TABLE `postmetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `slider` tinyint(1) NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 1,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `privateshow` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `invoice_option` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `stripe_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keybord_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `customer_id`, `invoice_option`, `warehouse_id`, `biller_id`, `product_number`, `stripe_public_key`, `stripe_secret_key`, `options`, `keybord_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 2, 1, 59, 'pk_test_ginW3sQe0P9TU1RkhUtSYoxX00vm6cWDMt', 'sk_test_R17wtLy5yfYEIUn0hodhrNZf00QDeUGPfD', '\"cash,cheque,gift_card\"', 0, '2023-09-07 09:18:15', '2023-11-06 05:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_cost` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_regular_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_sell_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_list` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `qty_list` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trending` tinyint(1) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_batch` int(15) DEFAULT NULL,
  `is_diffPriceWareHouse` int(15) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_variant_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `purchase_unit_id` int(15) DEFAULT NULL,
  `sale_unit_id` int(15) DEFAULT NULL,
  `tax_id` int(15) DEFAULT NULL,
  `tax_method` int(15) DEFAULT NULL,
  `is_variant` int(15) DEFAULT NULL,
  `variant_list` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `alert_quantity` int(15) DEFAULT NULL,
  `daily_sale_objective` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_type`, `product_name`, `slug`, `product_code`, `product_price`, `product_cost`, `product_regular_price`, `product_sell_price`, `product_image`, `product_details`, `product_list`, `featured`, `alert_qty`, `option`, `publish_at`, `qty`, `qty_list`, `promotion`, `promotion_price`, `start_date`, `end_date`, `view`, `tag`, `status`, `variant_option`, `variant_value`, `trending`, `in_stock`, `is_active`, `is_batch`, `is_diffPriceWareHouse`, `brand_id`, `category_id`, `product_variant_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `tax_id`, `tax_method`, `is_variant`, `variant_list`, `sale_id`, `alert_quantity`, `daily_sale_objective`, `last_date`, `created_at`, `updated_at`) VALUES
(1, 'standard', 'solid product', 'solid_product', '22380793', '321', '123', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2023-12-24 12:29', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 2, '1', NULL, '2023-12-24 06:30:14', '2024-01-14 07:00:28'),
(2, 'standard', 'varient product', 'varient_product', '51449085', '321', '123', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2023-12-24 12:30', 49, NULL, 1, '111', '2023-12-24', '2023-12-31', NULL, NULL, '1', '[\"size\"]', '[\"s,m\"]', 1, NULL, 1, NULL, NULL, 2, 2, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 2, '1', NULL, '2023-12-24 06:31:34', '2024-01-14 05:48:27'),
(3, 'standard', 'aari', 'aari', 'tb3ljw', '321', '123', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-16 15:09', 990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-16 09:09:47', '2024-01-17 05:41:55'),
(4, 'standard', 'aari(pakisten)', 'aari(pakisten)', 'n7xty7', '321', '123', NULL, NULL, NULL, '', NULL, NULL, '1', NULL, '2024-01-16 15:38', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-16 09:38:54', '2024-01-16 09:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(15) DEFAULT NULL,
  `imei_number` int(15) DEFAULT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
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
(1, 1, 1, NULL, NULL, NULL, 10, 10, 1, 123, 0, 10, 123, 1353, '2023-12-24 06:32:22', '2023-12-24 06:32:22'),
(2, 2, 2, 1, NULL, NULL, 10, 10, 1, 246, 0, 10, 246, 2706, '2023-12-24 06:42:11', '2023-12-24 06:42:11'),
(3, 3, 2, 2, NULL, NULL, 10, 10, 1, 246, 0, 10, 246, 2706, '2023-12-24 06:42:46', '2023-12-24 06:42:46'),
(4, 4, 3, NULL, NULL, NULL, 1000, 1000, 1, 123, 0, 10, 12300, 135300, '2024-01-16 09:10:20', '2024-01-16 09:10:20'),
(5, 5, 4, NULL, NULL, NULL, 10, 10, 1, 123, 0, 10, 123, 1353, '2024-01-16 09:39:32', '2024-01-16 09:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `product_quotations`
--

CREATE TABLE `product_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `imei_number` int(15) DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `variant_id` int(15) DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `imei_number` int(15) DEFAULT NULL,
  `variant_id` int(15) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
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
(1, '1', NULL, 1, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2023-12-24 07:11:17', '2023-12-24 07:11:17'),
(21, '2', NULL, 1, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-02 10:53:08', '2024-01-14 05:48:27'),
(38, '2', NULL, 2, NULL, 2, 1, 1, 635.58, 0, 10, 63.56, 699.14, '2024-01-03 04:46:32', '2024-01-03 04:46:32'),
(39, '2', NULL, 2, NULL, 1, 1, 1, 635.58, 0, 10, 63.56, 699.14, '2024-01-03 04:46:32', '2024-01-03 04:46:32'),
(40, '3', NULL, 2, NULL, 2, 1, 1, 635.58, 0, 10, 63.56, 699.14, '2024-01-03 09:40:58', '2024-01-03 09:40:58'),
(41, '4', NULL, 1, NULL, NULL, 1, 1, 288.9, 0, 10, 28.89, 317.79, '2024-01-14 07:00:28', '2024-01-14 07:00:28'),
(42, '7', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 09:44:16', '2024-01-16 09:44:16'),
(43, '8', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 09:45:25', '2024-01-16 09:45:25'),
(44, '9', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 09:55:04', '2024-01-16 09:55:04'),
(45, '10', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 09:57:03', '2024-01-16 09:57:03'),
(46, '11', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 09:59:14', '2024-01-16 09:59:14'),
(47, '12', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 10:02:53', '2024-01-16 10:02:53'),
(48, '13', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 11:03:21', '2024-01-16 11:03:21'),
(49, '14', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-16 11:35:50', '2024-01-16 11:35:50'),
(50, '15', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-17 05:37:54', '2024-01-17 05:37:54'),
(51, '16', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-17 05:41:55', '2024-01-17 05:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_transfers`
--

CREATE TABLE `product_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(15) DEFAULT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `imei_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `stock` int(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `variant_id`, `position`, `item_code`, `additional_cost`, `additional_price`, `qty`, `stock`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 's-51449085', 123, 321, 40, NULL, '2023-12-24 06:31:34', '2024-01-14 05:48:27'),
(2, 2, 2, 2, 'm-51449085', 123, 321, 46, NULL, '2023-12-24 06:31:34', '2024-01-14 05:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouses`
--

CREATE TABLE `product_warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `variant_id` int(15) DEFAULT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `imei_number` int(15) DEFAULT NULL,
  `qty` double NOT NULL,
  `stock` int(15) DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_warehouses`
--

INSERT INTO `product_warehouses` (`id`, `product_id`, `warehouse_id`, `variant_id`, `product_batch_id`, `imei_number`, `qty`, `stock`, `price`, `created_at`, `updated_at`) VALUES
(1, '1', 2, NULL, NULL, NULL, 86, NULL, NULL, '2023-12-24 06:32:22', '2024-01-14 07:00:28'),
(2, '2', 2, 1, NULL, NULL, 112, NULL, NULL, '2023-12-24 06:42:11', '2024-01-14 05:48:27'),
(3, '2', 2, 2, NULL, NULL, 34, NULL, NULL, '2023-12-24 06:42:46', '2024-01-14 05:48:27'),
(4, '3', 2, NULL, NULL, NULL, 990, NULL, NULL, '2024-01-16 09:10:20', '2024-01-17 05:41:55'),
(5, '4', 2, NULL, NULL, NULL, 10, NULL, NULL, '2024-01-16 09:39:32', '2024-01-16 09:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish_at` date DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
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
  `purchase_status` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `expired_date` timestamp NULL DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `due_amount`, `paid_amount`, `purchase_status`, `payment_status`, `expired_date`, `document`, `note`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'pr-20231224-123222', 2, 1, 1, 10, 0, 123, 1353, 0, 0, NULL, NULL, 1353, NULL, 1353, '1', 2, NULL, NULL, NULL, NULL, '2023-12-24 06:32:22', '2023-12-24 06:43:15'),
(2, 'pr-20231224-124211', 2, 1, 1, 10, 0, 246, 2706, 0, 0, NULL, NULL, 2706, NULL, 2706, '1', 2, NULL, NULL, NULL, NULL, '2023-12-24 06:42:11', '2023-12-24 06:43:08'),
(3, 'pr-20231224-124246', 2, 1, 1, 10, 0, 246, 2706, 0, 0, NULL, NULL, 2706, NULL, 2706, '1', 2, NULL, NULL, NULL, NULL, '2023-12-24 06:42:46', '2023-12-24 06:43:01'),
(4, 'pr-20240116-031020', 2, 1, 1, 1000, 0, 12300, 135300, 0, 0, NULL, NULL, 135300, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-16 09:10:20', '2024-01-16 09:10:20'),
(5, 'pr-20240116-033932', 2, 1, 1, 10, 0, 123, 1353, 0, 0, NULL, NULL, 1353, NULL, 0, '1', 1, NULL, NULL, NULL, NULL, '2024-01-16 09:39:32', '2024-01-16 09:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_returns`
--

CREATE TABLE `purchase_product_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(15) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sale_id` int(11) NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_batch_id` bigint(15) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `total_tax` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `order_tax` int(11) NOT NULL,
  `order_tax_rate` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 100, 200, 1, 'Year', 1, '2023-09-07 08:55:40', '2023-10-04 06:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `coupon_id` int(15) DEFAULT NULL,
  `coupon_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cash_register_id` int(15) DEFAULT NULL,
  `product_variant_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `order_discount_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_discount_value` int(15) DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reference_no`, `customer_id`, `warehouse_id`, `biller_id`, `coupon_id`, `coupon_discount`, `cash_register_id`, `product_variant_id`, `user_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_price`, `grand_total`, `order_tax_rate`, `order_tax`, `order_discount`, `order_discount_type`, `order_discount_value`, `shipping_cost`, `sale_status`, `payment_status`, `document`, `paid_amount`, `sale_note`, `staff_note`, `created_at`, `updated_at`) VALUES
(1, 'sr-20231224-011116', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 349.57, NULL, NULL, '2023-12-24 07:11:16', '2023-12-24 08:36:34'),
(2, 'sr-20240102-025051', 2, 2, 1, NULL, NULL, 1, '[null,\"2\",\"1\"]', 1, 3, 3, 0, 158.9, 1747.85, 1917.63, 10, 169.78, 50, 'Flat', 50, 50, 2, 2, NULL, NULL, NULL, NULL, '2024-01-02 08:50:51', '2024-01-14 05:48:27'),
(3, 'sr-20240103-034057', 1, 2, 2, NULL, NULL, 1, NULL, 1, 1, 1, 0, 63.56, 699.14, 699.14, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 699.14, NULL, NULL, '2024-01-03 09:40:58', '2024-01-03 09:41:15'),
(4, 'sr-20240114-010028', 3, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 28.89, 317.79, 317.79, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-14 07:00:28', '2024-01-14 07:00:28'),
(5, 'sr-20240116-034112', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:41:12', '2024-01-16 09:41:12'),
(6, 'sr-20240116-034241', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:42:41', '2024-01-16 09:42:41'),
(7, 'sr-20240116-034416', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:44:16', '2024-01-16 09:44:16'),
(8, 'sr-20240116-034525', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:45:25', '2024-01-16 09:45:25'),
(9, 'sr-20240116-035504', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:55:04', '2024-01-16 09:55:04'),
(10, 'sr-20240116-035702', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 09:57:02', '2024-01-16 09:57:02'),
(11, 'sr-20240116-035914', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 349.57, NULL, NULL, '2024-01-16 09:59:14', '2024-01-16 10:10:06'),
(12, 'sr-20240116-040252', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 349.57, NULL, NULL, '2024-01-16 10:02:52', '2024-01-16 10:09:22'),
(13, 'sr-20240116-050321', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 349.57, NULL, NULL, '2024-01-16 11:03:21', '2024-01-16 11:03:39'),
(14, 'sr-20240116-053550', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-16 11:35:50', '2024-01-16 11:35:50'),
(15, 'sr-20240117-113754', 1, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-17 05:37:54', '2024-01-17 05:37:54'),
(16, 'sr-20240117-114155', 2, 2, 1, NULL, NULL, 1, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, '2024-01-17 05:41:55', '2024-01-17 05:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WGP6GcmeZccYZ0W3Dfl7iauDWQhk5Viqsnmd5Pzy', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZkZjUTJncWtGb215M0JxSFU3cmtrZTRGbG5mcWJKSG5HeUxlbG5XOCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE4OiJmbGFzaGVyOjplbnZlbG9wZXMiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU0OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3VwZXJBZG1pbi9nYW5lcmFsc2V0dGluZy5iYWNrdXAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1705555702);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagecaption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_adjusted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Aduri', NULL, 'house', '234', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '1216', 'Bangladesh', 1, '2023-12-24 06:12:22', '2023-12-24 06:12:22');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'tax10', 10, 1, '2023-12-24 06:11:22', '2023-12-24 06:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `base_unit`, `short_name`, `operator`, `operation_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'piece', 'piece', 'piece', '/', 1, '1', '2023-12-24 06:11:43', '2023-12-24 06:11:47'),
(2, 'gaj', 'gaj', 'gaj', '/', 36, '1', '2023-12-24 06:47:49', '2023-12-24 06:47:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` tinyint(4) DEFAULT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` int(15) DEFAULT 1,
  `profile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_email_verified`, `mobile`, `password`, `google_id`, `facebook_id`, `access_token`, `role_id`, `status_id`, `is_active`, `profile_image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', 'superadmin@gmail.com', NULL, '1', NULL, '$2y$10$sIaS00DJD//DrEbrMZLuuuvNVBcU8hONrotV2sKaWA/BJvn.xpw5G', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTIzYjAyMi0wNTUzLTQyYjctYTllNC05N2U0YTFmZDU4ODgiLCJqdGkiOiJjYjg1MWMzM2RhNjZkZjQ2ZjlkNjNjOTBkMGZjOGNmOWUxMThiYzc1OTc5ODZkMzVhYzU0MTY0OTA1M2NmNjY5NTIxMWI1YTcyMjYxNmUxMSIsImlhdCI6MTcwNTM4NDQ0Mi41OTczOTEsIm5iZiI6MTcwNTM4NDQ0Mi41OTczOTgsImV4cCI6MTczNzAwNjg0Mi4zODgyODIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.Rc4mKySMzcOzcd_c9AyvqVl6Wmi-JtdncJGxMz37MagEvvHsM2vwMjkf9y-Z0ICltbY8w4K5ByoMG6YjopTJkGfR9VVYLJCc8rFm5cBJ43gtKArtDlByUTUOeCeWflw2KibGxKvP96O1cwcW_You2coATZnh0X02meqT-DiwJjsh5AVQE21FzW9pG4Bkhn7ltEQqFiCeHGSJoZjlurQlSSyJUq0wRcNPJWWEgoM4r3ePY86cKpxeoQVas1kTBQGDNu7xFEo57jP3jU5Y_hrJwRH7Unt8puZGAJPfs-EYzjGLszTejVwYuIqXDma1CL-RI4RuKVvyrBcel3ryhQQq54uo7KB5_Q2UXkl4lkRgKz4AHw2jADJM1TAjbtW9fZwN8HGBCE9CPFT5n8ctIVoh7V8Ltn6rrbEgRLdh75BK9YVkKeuhXWhYJkraaj7rC_eje-2F24_t4_AWqkJjpuPZVsZuT7_b1hjFvkEEGCg3Myeql4R26ama0gHuh4zDR7204pSapymwTf6wg278kvjzk8c7fl5dp4ujf95wAxKI7UFmEy-kLflzCkUgJJNIp7Papqm29-1hjgz8PylSNXkEFFGtGVm5gtWvyQ7F-SkE-Fedku5da_--cYhY_GKFTDzIISc3pmdxRqP1Zw9S-I1J5puRkjMOUsXk0HYdsyxXSqo', 1, 1, 1, NULL, 'e4JR1WdOUwYVKRDPbQKUF8SXDlxrJC6O9Grtn13pkZDneOBuP9qURTYfeMup', NULL, '2024-01-16 05:54:02'),
(2, 'admin', 'admin@gmail.com', NULL, '1', NULL, '$2y$10$1UREa9ri6zGzc3v.BDT8UecIC5D/jiZ4jM8n0CYEuGcrNCntR6DLa', NULL, NULL, NULL, 2, 1, 1, NULL, NULL, NULL, NULL),
(3, 'employe', 'employe@gmail.com', NULL, '1', NULL, '$2y$10$Xkt1Wz0PZKjUNRVsR95GEeGk4yTR/tsL/X6V2gzGFdenphP9Pz2jy', NULL, NULL, NULL, 3, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'ware house 1', '01818401065', 'therashedul@gmail.com', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 1, '2023-08-09 05:58:01', '2023-08-09 06:28:43'),
(3, 'ware house 2', '01709370009', 'webhatbd@gmail.com', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 1, '2023-08-09 06:20:15', '2023-08-09 06:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `whitelists`
--

CREATE TABLE `whitelists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Indexes for table `create_custom_fields`
--
ALTER TABLE `create_custom_fields`
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
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
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
-- Indexes for table `tables`
--
ALTER TABLE `tables`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `create_custom_fields`
--
ALTER TABLE `create_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hitlogs`
--
ALTER TABLE `hitlogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1105;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image_uploads`
--
ALTER TABLE `image_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `loginhistories`
--
ALTER TABLE `loginhistories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;



--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_with_cheques`
--
ALTER TABLE `payment_with_cheques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_with_credit_cards`
--
ALTER TABLE `payment_with_credit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_cards`
--
ALTER TABLE `payment_with_gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postmetas`
--
ALTER TABLE `postmetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pos_settings`
--
ALTER TABLE `pos_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_quotations`
--
ALTER TABLE `product_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_transfers`
--
ALTER TABLE `product_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_warehouses`
--
ALTER TABLE `product_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_product_returns`
--
ALTER TABLE `purchase_product_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `whitelists`
--
ALTER TABLE `whitelists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--



--
-- Constraints for table `postmetas`
--
ALTER TABLE `postmetas`
  ADD CONSTRAINT `postmetas_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ;

--
-- Constraints for table `whitelists`
--
ALTER TABLE `whitelists`
  ADD CONSTRAINT `whitelists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
