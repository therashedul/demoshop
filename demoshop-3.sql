-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2024 at 10:56 AM
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
(3, '2023-10-11 04:03:50', '2023-10-11 04:06:37', '654321', 'sorna', 123456, 123456, NULL, 'test note', 0, NULL);

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
(145, 3, 'shart', '2', '321', '\\barcode\\m3pnxwc39.png', NULL, '2024-01-25 09:29:59', '2024-01-25 09:29:59');

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
(1, 'new biller', '2_1684129568.jpg', 'webhat', '234', 'rasel.netrweb@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', '1216', 'Bangladesh', 1, '2023-09-07 10:17:57', '2023-09-07 10:17:57');

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
(2, 'pluse point', NULL, 1, '2023-12-24 06:11:15', '2023-12-24 06:11:15');

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
(1, 1, NULL, 'karim', 'house', 'therashedul@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, '4_1692512057.jpg', '1216', 'Bangladesh', NULL, NULL, 1, NULL, 6, '2023-09-10 05:01:56', '2024-01-25 09:32:45'),
(2, 1, NULL, 'rasel karim', 'susuta butiqe ghore', 'therashedul@gmail.com', '0430719596', '13/1 Myers St, Roseland, NSW-2195', 'Dhaka', NULL, 'business_1688362561.jpg', '2195', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-09-10 05:05:46', '2023-10-04 09:44:37'),
(3, 2, NULL, 'sorna', 'susuta butiqe ghore', 'sorna@gmail.com', '01818401065', '3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.', 'Dhaka', NULL, NULL, '1216', 'Bangladesh', NULL, NULL, 1, NULL, NULL, '2023-09-20 04:24:29', '2023-11-02 10:18:46'),
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
(1, 'new department', 1, '2023-10-11 06:07:29', '2023-10-11 06:07:29'),
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
(12, 'demo3', 'Specific', '63', '2023-10-03', '2023-10-28', 'percentage', 12, 12, 21, 'Mon,Tue,Wed,Thu,Fri,Sat,Sun', 1, '2023-10-03 10:49:48', '2023-10-04 05:48:20');

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
(4, 'global', 1, '2023-09-11 09:56:22', '2023-09-11 10:09:30');

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
(1, 3, 1, '2023-12-24 06:23:49', '2023-12-24 06:23:49');

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
(4, 'er-20231101-121846', 2, 2, 1, 1, 1, 250, NULL, '2023-10-31 18:00:00', '2023-11-01 06:18:46');

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `currency_position` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_access` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_registration_number` int(15) DEFAULT NULL,
  `theme` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `developed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `currency_position`, `company_name`, `staff_access`, `date_format`, `vat_registration_number`, `theme`, `developed_by`, `invoice_format`, `state`, `created_at`, `updated_at`) VALUES
(1, 'Myshop', '20231002014940.jpg', '0', 1, 1, 'Lioncoders', 'all', 'd-m-Y', 98098007, 'default.css', 'rasel', 'standard', 1, '2023-10-02 06:53:33', '2023-10-02 09:41:29');

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
  `width` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:40:53', '2024-01-25 08:40:53'),
(2, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:41:13', '2024-01-25 08:41:13'),
(3, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:41:31', '2024-01-25 08:41:31'),
(4, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:41:33', '2024-01-25 08:41:33'),
(5, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:43:00', '2024-01-25 08:43:00'),
(6, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:43:05', '2024-01-25 08:43:05'),
(7, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:43:20', '2024-01-25 08:43:20'),
(8, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:43:22', '2024-01-25 08:43:22'),
(9, '127.0.0.1', 'superAdmin.index', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:43:27', '2024-01-25 08:43:27'),
(10, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:45:37', '2024-01-25 08:45:37'),
(11, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:21', '2024-01-25 08:48:21'),
(12, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:30', '2024-01-25 08:48:30'),
(13, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:32', '2024-01-25 08:48:32'),
(14, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:33', '2024-01-25 08:48:33'),
(15, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:43', '2024-01-25 08:48:43'),
(16, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:48:44', '2024-01-25 08:48:44'),
(17, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:50:17', '2024-01-25 08:50:17'),
(18, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:50:23', '2024-01-25 08:50:23'),
(19, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:50:23', '2024-01-25 08:50:23'),
(20, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:50:24', '2024-01-25 08:50:24'),
(21, '127.0.0.1', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:13', '2024-01-25 08:51:13'),
(22, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:25', '2024-01-25 08:51:25'),
(23, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:31', '2024-01-25 08:51:31'),
(24, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:33', '2024-01-25 08:51:33'),
(25, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:33', '2024-01-25 08:51:33'),
(26, '127.0.0.1', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:51:55', '2024-01-25 08:51:55'),
(27, '127.0.0.1', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:02', '2024-01-25 08:52:02'),
(28, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:03', '2024-01-25 08:52:03'),
(29, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:07', '2024-01-25 08:52:07'),
(30, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:08', '2024-01-25 08:52:08'),
(31, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:12', '2024-01-25 08:52:12'),
(32, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:26', '2024-01-25 08:52:26'),
(33, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:29', '2024-01-25 08:52:29'),
(34, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:44', '2024-01-25 08:52:44'),
(35, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:47', '2024-01-25 08:52:47'),
(36, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:48', '2024-01-25 08:52:48'),
(37, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:52:48', '2024-01-25 08:52:48'),
(38, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:53:55', '2024-01-25 08:53:55'),
(39, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:54:00', '2024-01-25 08:54:00'),
(40, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:54:01', '2024-01-25 08:54:01'),
(41, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:54:02', '2024-01-25 08:54:02'),
(42, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:54:45', '2024-01-25 08:54:45'),
(43, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:54:48', '2024-01-25 08:54:48'),
(44, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:13', '2024-01-25 08:55:13'),
(45, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:18', '2024-01-25 08:55:18'),
(46, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:18', '2024-01-25 08:55:18'),
(47, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:19', '2024-01-25 08:55:19'),
(48, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:34', '2024-01-25 08:55:34'),
(49, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:37', '2024-01-25 08:55:37'),
(50, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:42', '2024-01-25 08:55:42'),
(51, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:54', '2024-01-25 08:55:54'),
(52, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:55:58', '2024-01-25 08:55:58'),
(53, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:00', '2024-01-25 08:56:00'),
(54, '127.0.0.1', 'superAdmin.generated::eAzqiDGCyMhR3lK2', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sales.getfeatured', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:03', '2024-01-25 08:56:03'),
(55, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:06', '2024-01-25 08:56:06'),
(56, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:07', '2024-01-25 08:56:07'),
(57, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:09', '2024-01-25 08:56:09'),
(58, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:30', '2024-01-25 08:56:30'),
(59, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:36', '2024-01-25 08:56:36'),
(60, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:37', '2024-01-25 08:56:37'),
(61, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:56:37', '2024-01-25 08:56:37'),
(62, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:08', '2024-01-25 08:57:08'),
(63, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:12', '2024-01-25 08:57:12'),
(64, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:13', '2024-01-25 08:57:13'),
(65, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:14', '2024-01-25 08:57:14'),
(66, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:21', '2024-01-25 08:57:21'),
(67, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:23', '2024-01-25 08:57:23'),
(68, '127.0.0.1', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:38', '2024-01-25 08:57:38'),
(69, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:41', '2024-01-25 08:57:41'),
(70, '127.0.0.1', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:57:51', '2024-01-25 08:57:51'),
(71, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:58:02', '2024-01-25 08:58:02'),
(72, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:58:04', '2024-01-25 08:58:04'),
(73, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:58:06', '2024-01-25 08:58:06'),
(74, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:58:06', '2024-01-25 08:58:06'),
(75, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:58:16', '2024-01-25 08:58:16'),
(76, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 08:59:22', '2024-01-25 08:59:22'),
(77, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:00:40', '2024-01-25 09:00:40'),
(78, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:00:58', '2024-01-25 09:00:58'),
(79, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:01:25', '2024-01-25 09:01:25'),
(80, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:08', '2024-01-25 09:03:08'),
(81, '127.0.0.1', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:10', '2024-01-25 09:03:10'),
(82, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:35', '2024-01-25 09:03:35'),
(83, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:39', '2024-01-25 09:03:39'),
(84, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:39', '2024-01-25 09:03:39'),
(85, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:40', '2024-01-25 09:03:40'),
(86, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:48', '2024-01-25 09:03:48'),
(87, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:50', '2024-01-25 09:03:50'),
(88, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:03:52', '2024-01-25 09:03:52'),
(89, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:03', '2024-01-25 09:04:03'),
(90, '127.0.0.1', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:03', '2024-01-25 09:04:03'),
(91, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:11', '2024-01-25 09:04:11'),
(92, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:15', '2024-01-25 09:04:15'),
(93, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:16', '2024-01-25 09:04:16'),
(94, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:16', '2024-01-25 09:04:16'),
(95, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:30', '2024-01-25 09:04:30'),
(96, '127.0.0.1', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:31', '2024-01-25 09:04:31'),
(97, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:34', '2024-01-25 09:04:34'),
(98, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:37', '2024-01-25 09:04:37'),
(99, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:38', '2024-01-25 09:04:38'),
(100, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:38', '2024-01-25 09:04:38'),
(101, '127.0.0.1', 'superAdmin.possetting.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:47', '2024-01-25 09:04:47'),
(102, '127.0.0.1', 'superAdmin.possetting', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/possetting', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:47', '2024-01-25 09:04:47'),
(103, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:52', '2024-01-25 09:04:52'),
(104, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:54', '2024-01-25 09:04:54'),
(105, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:55', '2024-01-25 09:04:55'),
(106, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:04:55', '2024-01-25 09:04:55'),
(107, '127.0.0.1', 'superAdmin.custom-fields', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/custom-fields', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:06:43', '2024-01-25 09:06:43'),
(108, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:12:21', '2024-01-25 09:12:21'),
(109, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:13:39', '2024-01-25 09:13:39'),
(110, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:14:10', '2024-01-25 09:14:10'),
(111, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:14:57', '2024-01-25 09:14:57'),
(112, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:26', '2024-01-25 09:15:26'),
(113, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:33', '2024-01-25 09:15:33'),
(114, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:34', '2024-01-25 09:15:34'),
(115, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:35', '2024-01-25 09:15:35'),
(116, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:41', '2024-01-25 09:15:41'),
(117, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:43', '2024-01-25 09:15:43'),
(118, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:15:47', '2024-01-25 09:15:47'),
(119, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:18', '2024-01-25 09:17:18'),
(120, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:25', '2024-01-25 09:17:25'),
(121, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:26', '2024-01-25 09:17:26'),
(122, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:26', '2024-01-25 09:17:26'),
(123, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:50', '2024-01-25 09:17:50'),
(124, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:54', '2024-01-25 09:17:54'),
(125, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:55', '2024-01-25 09:17:55'),
(126, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:17:56', '2024-01-25 09:17:56'),
(127, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:02', '2024-01-25 09:18:02'),
(128, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/2/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:05', '2024-01-25 09:18:05'),
(129, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:10', '2024-01-25 09:18:10'),
(130, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:12', '2024-01-25 09:18:12'),
(131, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:15', '2024-01-25 09:18:15'),
(132, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:19', '2024-01-25 09:18:19'),
(133, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:20', '2024-01-25 09:18:20'),
(134, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:18:20', '2024-01-25 09:18:20'),
(135, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:19:36', '2024-01-25 09:19:36'),
(136, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:19:46', '2024-01-25 09:19:46'),
(137, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:19:47', '2024-01-25 09:19:47'),
(138, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:19:47', '2024-01-25 09:19:47'),
(139, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:20:19', '2024-01-25 09:20:19'),
(140, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:20:22', '2024-01-25 09:20:22'),
(141, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:02', '2024-01-25 09:21:02'),
(142, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:08', '2024-01-25 09:21:08'),
(143, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:09', '2024-01-25 09:21:09'),
(144, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:09', '2024-01-25 09:21:09'),
(145, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:19', '2024-01-25 09:21:19'),
(146, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:20', '2024-01-25 09:21:20'),
(147, '127.0.0.1', 'superAdmin.generated::2dkTiA9Pni1XG4y1', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:23', '2024-01-25 09:21:23'),
(148, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:21:26', '2024-01-25 09:21:26'),
(149, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:22:55', '2024-01-25 09:22:55'),
(150, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:01', '2024-01-25 09:23:01'),
(151, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:02', '2024-01-25 09:23:02'),
(152, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:03', '2024-01-25 09:23:03'),
(153, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:11', '2024-01-25 09:23:11'),
(154, '127.0.0.1', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:17', '2024-01-25 09:23:17'),
(155, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:20', '2024-01-25 09:23:20'),
(156, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:27', '2024-01-25 09:23:27'),
(157, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:32', '2024-01-25 09:23:32'),
(158, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:32', '2024-01-25 09:23:32'),
(159, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:33', '2024-01-25 09:23:33'),
(160, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:37', '2024-01-25 09:23:37'),
(161, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:38', '2024-01-25 09:23:38'),
(162, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:41', '2024-01-25 09:23:41'),
(163, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:41', '2024-01-25 09:23:41'),
(164, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:50', '2024-01-25 09:23:50'),
(165, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:50', '2024-01-25 09:23:50'),
(166, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:51', '2024-01-25 09:23:51'),
(167, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:23:52', '2024-01-25 09:23:52'),
(168, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:24:34', '2024-01-25 09:24:34'),
(169, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:24:40', '2024-01-25 09:24:40'),
(170, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:24:40', '2024-01-25 09:24:40'),
(171, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:24:40', '2024-01-25 09:24:40'),
(172, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:26:10', '2024-01-25 09:26:10'),
(173, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:26:21', '2024-01-25 09:26:21'),
(174, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:26:22', '2024-01-25 09:26:22'),
(175, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:26:22', '2024-01-25 09:26:22'),
(176, '127.0.0.1', 'superAdmin.generated::eAzqiDGCyMhR3lK2', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sales.getfeatured', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:26:35', '2024-01-25 09:26:35'),
(177, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:00', '2024-01-25 09:27:00'),
(178, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:04', '2024-01-25 09:27:04'),
(179, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:05', '2024-01-25 09:27:05'),
(180, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:06', '2024-01-25 09:27:06'),
(181, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:14', '2024-01-25 09:27:14'),
(182, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:18', '2024-01-25 09:27:18'),
(183, '127.0.0.1', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.edit/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:21', '2024-01-25 09:27:21'),
(184, '127.0.0.1', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:26', '2024-01-25 09:27:26'),
(185, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:26', '2024-01-25 09:27:26'),
(186, '127.0.0.1', 'superAdmin.media.upload', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.upload', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:47', '2024-01-25 09:27:47'),
(187, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:27:50', '2024-01-25 09:27:50'),
(188, '127.0.0.1', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:03', '2024-01-25 09:28:03'),
(189, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:04', '2024-01-25 09:28:04'),
(190, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:08', '2024-01-25 09:28:08'),
(191, '127.0.0.1', 'superAdmin.products.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:32', '2024-01-25 09:28:32'),
(192, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:37', '2024-01-25 09:28:37'),
(193, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:46', '2024-01-25 09:28:46'),
(194, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:51', '2024-01-25 09:28:51'),
(195, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:52', '2024-01-25 09:28:52'),
(196, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:52', '2024-01-25 09:28:52'),
(197, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:54', '2024-01-25 09:28:54'),
(198, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:55', '2024-01-25 09:28:55'),
(199, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:57', '2024-01-25 09:28:57'),
(200, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:28:58', '2024-01-25 09:28:58'),
(201, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:00', '2024-01-25 09:29:00'),
(202, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:00', '2024-01-25 09:29:00'),
(203, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:03', '2024-01-25 09:29:03'),
(204, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:03', '2024-01-25 09:29:03'),
(205, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:06', '2024-01-25 09:29:06'),
(206, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:06', '2024-01-25 09:29:06'),
(207, '127.0.0.1', 'superAdmin.media.upload', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.upload', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:11', '2024-01-25 09:29:11'),
(208, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:12', '2024-01-25 09:29:12'),
(209, '127.0.0.1', 'superAdmin.products.slugsearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.slugsearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:18', '2024-01-25 09:29:18'),
(210, '127.0.0.1', 'superAdmin.products.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:58', '2024-01-25 09:29:58'),
(211, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:29:59', '2024-01-25 09:29:59'),
(212, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:30:03', '2024-01-25 09:30:03');
INSERT INTO `hitlogs` (`id`, `ip`, `view`, `browser`, `mobile_number`, `link`, `device`, `device_os`, `brand`, `width`, `height`, `spent_time`, `model`, `created_at`, `updated_at`) VALUES
(213, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:31:31', '2024-01-25 09:31:31'),
(214, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:31:35', '2024-01-25 09:31:35'),
(215, '127.0.0.1', 'superAdmin.purchase.create', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.create', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:31:38', '2024-01-25 09:31:38'),
(216, '127.0.0.1', 'superAdmin.purchase.search', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.search', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:31:56', '2024-01-25 09:31:56'),
(217, '127.0.0.1', 'superAdmin.purchase.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:06', '2024-01-25 09:32:06'),
(218, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:06', '2024-01-25 09:32:06'),
(219, '127.0.0.1', 'superAdmin.purchase', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/purchase', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:09', '2024-01-25 09:32:09'),
(220, '127.0.0.1', 'superAdmin.sale.pos', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.pos', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:17', '2024-01-25 09:32:17'),
(221, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:21', '2024-01-25 09:32:21'),
(222, '127.0.0.1', 'superAdmin.sale.getcustomergroup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:22', '2024-01-25 09:32:22'),
(223, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:22', '2024-01-25 09:32:22'),
(224, '127.0.0.1', 'superAdmin.sale.getProduct', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.getProduct/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:31', '2024-01-25 09:32:31'),
(225, '127.0.0.1', 'superAdmin.sale.checkAvailability', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.checkAvailability/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:31', '2024-01-25 09:32:31'),
(226, '127.0.0.1', 'superAdmin.sale.productSearch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.productSearch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:32', '2024-01-25 09:32:32'),
(227, '127.0.0.1', 'superAdmin.sale.store', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.store', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:45', '2024-01-25 09:32:45'),
(228, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:32:46', '2024-01-25 09:32:46'),
(229, '127.0.0.1', 'superAdmin.sale.invoice', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale.invoice/2', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:34:51', '2024-01-25 09:34:51'),
(230, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:34:58', '2024-01-25 09:34:58'),
(231, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:35:04', '2024-01-25 09:35:04'),
(232, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:35:22', '2024-01-25 09:35:22'),
(233, '127.0.0.1', 'superAdmin.sale', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/sale', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:35:26', '2024-01-25 09:35:26'),
(234, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:35:38', '2024-01-25 09:35:38'),
(235, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:35:42', '2024-01-25 09:35:42'),
(236, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:03', '2024-01-25 09:37:03'),
(237, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:07', '2024-01-25 09:37:07'),
(238, '127.0.0.1', 'superAdmin.products.edit', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.edit/3', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:10', '2024-01-25 09:37:10'),
(239, '127.0.0.1', 'superAdmin.products.sellUnitId', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.sellUnitId/1', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:14', '2024-01-25 09:37:14'),
(240, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:17', '2024-01-25 09:37:17'),
(241, '127.0.0.1', 'superAdmin.media.delete', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.delete', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:30', '2024-01-25 09:37:30'),
(242, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:31', '2024-01-25 09:37:31'),
(243, '127.0.0.1', 'superAdmin.media.upload', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.upload', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:36', '2024-01-25 09:37:36'),
(244, '127.0.0.1', 'superAdmin.media.fetch', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/media.fetch', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:37', '2024-01-25 09:37:37'),
(245, '127.0.0.1', 'superAdmin.products.update', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products.update', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:43', '2024-01-25 09:37:43'),
(246, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:44', '2024-01-25 09:37:44'),
(247, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:37:48', '2024-01-25 09:37:48'),
(248, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:38:33', '2024-01-25 09:38:33'),
(249, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:38:36', '2024-01-25 09:38:36'),
(250, '127.0.0.1', 'superAdmin.ganeralsetting.backup', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/ganeralsetting.backup', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:49:07', '2024-01-25 09:49:07'),
(251, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:49:19', '2024-01-25 09:49:19'),
(252, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:53:16', '2024-01-25 09:53:16'),
(253, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:53:23', '2024-01-25 09:53:23'),
(254, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:54:26', '2024-01-25 09:54:26'),
(255, '127.0.0.1', 'superAdmin.products', 'Google Chrome120.0.0.0', '', 'http://127.0.0.1:8000/superAdmin/products', 'Desktop', '', 'Windows', 'Null', 'Null', NULL, 'Win64;', '2024-01-25 09:54:31', '2024-01-25 09:54:31');

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
(2, 1, '2023-10-11', '2023-10-12', 'day', 1, '2023-10-11 08:23:09', '2023-10-11 08:25:07');

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
(27, '6_1706175456.jpg', '6', '6', NULL, NULL, '6_1706175456.jpg', '6_1706175456.jpg', '1', 'superAdmin', '.jpg', '2024-01-25 09:37:36', '2024-01-25 09:37:36');

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
(88, '2023_11_06_124838_create_product_adjustments_table', 32);

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
('979f0c883120fa961658969511d28b18e05792c8ce9cccc1a2c7b604c67e924bef2a0784b7733427', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-08-01 22:46:01', '2023-08-01 22:46:01', '2024-08-02 04:46:01'),
('9869ddccdfa4c9f024c8620e6372fbe3b166e8b583afebf198501837a9d97789211b214191398f8d', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-12 03:56:22', '2023-09-12 03:56:22', '2024-09-12 09:56:22'),
('9b4fb0a528bbcf2a099a9c77707f9a4c2ea6a404f2eb7b7f9f9d25523cc18f2e855a0b7f8fd44011', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-17 23:41:46', '2023-07-17 23:41:46', '2024-07-18 05:41:46'),
('9c4ccb0472855246ffc021d9db09823192a1a31c9e0620dafd64235e5dfed362b2d994788cd448ad', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-18 22:29:07', '2023-06-18 22:29:07', '2024-06-19 04:29:07'),
('a0b6e27ee1eb90ee325e0df101a0273f3eddb6257c51d9bee6f412525525b427f06893e757364de0', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-15 21:58:58', '2023-05-15 21:58:58', '2024-05-16 03:58:58'),
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
('e8ababf89607c5b0d59450d34a6010ee7c11bc99a84d7b1d5db389952ce84992a163665bdedecbd9', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2024-01-25 08:41:12', '2024-01-25 08:41:12', '2025-01-25 14:41:12'),
('e9539971042b1676c79a46ea566a0c00852c909957bc0d1cd50eddd52d8340509942289251657c73', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-06-24 22:11:43', '2023-06-24 22:11:43', '2024-06-25 04:11:43'),
('ece6ce0fe35d778d86a3a1ff1821096783a125df2428fe1d23a03b051beef22517e42444cf852ec2', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-17 04:08:06', '2023-09-17 04:08:06', '2024-09-17 10:08:06'),
('eea5b82b9f5816a76366c9b40bdc95311b0c6628e5591170624f9b0b2087e096c9d89e3a0ab916ab', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-04 04:19:28', '2023-09-04 04:19:28', '2024-09-04 10:19:28'),
('f0ec6a0213917dcd7f847b662cbc273e367d613689b4946fc8df2bdf33270c7398f17b3a20a2afda', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-09-05 04:08:35', '2023-09-05 04:08:35', '2024-09-05 10:08:35'),
('f3d90947f9bbfdbd56bcbdab082fb63174e1f526bc7e7587e283470a8269cc80c4902808a57e5f08', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-12-26 03:57:05', '2023-12-26 03:57:05', '2024-12-26 09:57:05'),
('f7238aad3b4f4645922fa2a500f59a7899d1d826266892fceb74d7e8c438860fd8893fabe0627008', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-07-18 22:23:57', '2023-07-18 22:23:57', '2024-07-19 04:23:57'),
('f7b9d966ac97c5ce0a1349b2042382a01d07e65773178a6e07ff9efa938f6613b0e63cb46b9a882f', 1, '9923b022-0553-42b7-a9e4-97e4a1fd5888', 'superAdmin@gmail.com', '[]', 0, '2023-05-17 22:27:46', '2023-05-17 22:27:46', '2024-05-18 04:27:46');

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

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `privatepage` tinyint(1) NOT NULL DEFAULT 0,
  `publish_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(5, 2, NULL, 2, 1, 1, 'Cash', 'spr-20240125-033246', NULL, 349.57, '0', NULL, '2024-01-25 09:32:46', '2024-01-25 09:32:46');

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
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keybord_active` int(11) DEFAULT NULL,
  `is_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_option` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_live_api_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_live_api_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_live_api_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_settings`
--

INSERT INTO `pos_settings` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `options`, `payment_options`, `keybord_active`, `is_table`, `invoice_option`, `stripe_public_key`, `stripe_secret_key`, `paypal_live_api_username`, `paypal_live_api_password`, `paypal_live_api_secret`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 59, NULL, 'cash,deposit,paypal', 0, '0', 'thermal', 'pk_test_ginW3sQe0P9TU1RkhUtSYoxX00vm6cWDMt', 'sk_test_R17wtLy5yfYEIUn0hodhrNZf00QDeUGPfD', NULL, NULL, NULL, '2024-01-25 00:28:27', '2024-01-25 09:04:47');

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
(1, 'standard', 'solid product', 'solid_product', '22380793', '321', '123', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2023-12-24 12:29', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 1, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 2, '1', NULL, '2023-12-24 06:30:14', '2024-01-25 08:52:02'),
(2, 'standard', 'varient product', 'varient-product', '51449085', '321', '123', NULL, NULL, NULL, '', NULL, '1', '2', NULL, '2024-01-25 15:27', 0, NULL, 1, '111', '2023-12-24', '2023-12-31', NULL, NULL, '1', '[\"size\"]', '[\"s,m\"]', 1, NULL, 1, NULL, NULL, 2, 2, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, 2, '1', NULL, '2023-12-24 06:31:34', '2024-01-25 09:28:04'),
(3, 'standard', 'shart', 'shart', 'm3pnxw', '321', '123', NULL, NULL, NULL, '', NULL, '1', '1', NULL, '2024-01-25 15:37', 0, NULL, 1, '1111', NULL, NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, 1, NULL, NULL, 2, 1, NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, '1', NULL, '2024-01-25 09:29:58', '2024-01-25 09:37:43');

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
(4, 4, 1, NULL, NULL, NULL, 1, 1, 1, 123, 0, 10, 12.3, 135.3, '2024-01-25 08:52:02', '2024-01-25 08:52:02'),
(5, 5, 3, NULL, NULL, NULL, 1000, 1000, 1, 123, 0, 10, 12300, 135300, '2024-01-25 09:32:06', '2024-01-25 09:32:06');

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
(2, '2', NULL, 3, NULL, NULL, 1, 1, 317.79, 0, 10, 31.78, 349.57, '2024-01-25 09:32:45', '2024-01-25 09:32:45');

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
(1, 2, 1, 1, 's-51449085', 123, 321, 22, NULL, '2023-12-24 06:31:34', '2023-12-24 06:42:11'),
(2, 2, 2, 2, 'm-51449085', 123, 321, 22, NULL, '2023-12-24 06:31:34', '2023-12-24 06:42:46');

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
(1, '1', 2, NULL, NULL, NULL, 10, NULL, NULL, '2023-12-24 06:32:22', '2024-01-25 08:52:02'),
(2, '2', 2, 1, NULL, NULL, 10, NULL, NULL, '2023-12-24 06:42:11', '2023-12-24 06:42:11'),
(3, '2', 2, 2, NULL, NULL, 10, NULL, NULL, '2023-12-24 06:42:46', '2023-12-24 06:42:46'),
(4, '3', 3, NULL, NULL, NULL, 999, NULL, NULL, '2024-01-25 09:32:06', '2024-01-25 09:37:43');

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
(4, 'pr-20240125-025202', 2, 1, 1, 1, 0, 12.3, 135.3, 0, 0, NULL, NULL, 135.3, NULL, 0, '1', 1, NULL, NULL, NULL, 1, '2024-01-25 08:52:02', '2024-01-25 08:52:02'),
(5, 'pr-20240125-033206', 3, 1, 1, 1000, 0, 12300, 135300, 0, 0, NULL, NULL, 135300, NULL, 0, '1', 1, NULL, NULL, NULL, 1, '2024-01-25 09:32:06', '2024-01-25 09:32:06');

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
(2, 'posr-20240125-033245', 1, 3, 1, NULL, NULL, 2, NULL, 1, 1, 1, 0, 31.78, 349.57, 349.57, 0, 0, 0, 'Flat', NULL, NULL, 1, 4, NULL, 349.57, NULL, NULL, '2024-01-25 09:32:45', '2024-01-25 09:32:45');

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
('NggWF3gmUNvnkE2FR20xAntaEkmW4Uvnn1j8aNxG', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoidnRDb0JENGVDaERkUENZblE3VTU1akRmaDhCZ1JLUjJqb0hjYzN4aSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3VwZXJBZG1pbi9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTg6ImZsYXNoZXI6OmVudmVsb3BlcyI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjEyOiJ1c2VyX3Nlc3Npb24iO3M6MjA6InN1cGVyQWRtaW5AZ21haWwuY29tIjtzOjEyOiJwYXNzX3Nlc3Npb24iO3M6OToiMTIzNDU2Nzg5Ijt9', 1706176472);

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
(1, 'superAdmin', 'superadmin@gmail.com', NULL, '1', NULL, '$2y$10$sIaS00DJD//DrEbrMZLuuuvNVBcU8hONrotV2sKaWA/BJvn.xpw5G', NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTIzYjAyMi0wNTUzLTQyYjctYTllNC05N2U0YTFmZDU4ODgiLCJqdGkiOiJlOGFiYWJmODk2MDdjNWIwZDU5NDUwZDM0YTYwMTBlZTdjMTFiYzk5YTg0ZDdiMWQ1ZGIzODk5NTJjZTg0OTkyYTE2MzY2NWJkZWRlY2JkOSIsImlhdCI6MTcwNjE3MjA3Mi44OTI0MDYsIm5iZiI6MTcwNjE3MjA3Mi44OTI0MjQsImV4cCI6MTczNzc5NDQ3Mi44MDcwOTIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.GvZ67yahW7G-CCw5PqwQNa9WZWp6lnKPOzuS9ApQTT0bjG1RYllBgAa77boVbpLjoYtibjZvRk8fAW0jk-nipXkdzoeHPM7-IjJEgtKsAwdcwqa1-RafaAFFMNiUIiOGvy-CDNj-pALPvBz-5ZryFdb1gp3sOaVOF57R7XM4Fz-UGGbNkYZM7YPPeuSr5lMjDEBqjr3CU9bhqYGYci4S24a1BSE3DZjsJ4Tc261ze3sw1dtuICfB-wMwLrSAkffn4nOz-w1Xo3hJlqJzCV9PQ0irXkv0opK536aGIFPekCvaw8iI5UTM2_Ig5M2Y1suKCx8a3URr5OLQqVNorFoJ8gMiqSvs_Jj6ZDfgyVnGgMEZaZHSn6wUt261B4sBoyWblweoPb_LaPEnLPba9AzvmzMEqirDYunddzTlHejciXPat6K6cUmGhVKN8jsCDv2vfVPtJJnyEn8tyqLtt2ScCPmsNqonRKiLuJXzLKcFER539XGDDVUkxMoE71XYXK3rJa-RX2IPjAvqmnzqA4vvmHzOMizqPvmTPufyec_QTYtw0aa6As4g1xqgH3-WaDxvPRLg81w8ER8QMj7D0JDhM1bf0QywrG7L7J0T2yJ7eOGWGtNT7QlmHOWC3jOz3cA06KpBCyUsez53PnUW6KE9klmfJaEc769LxC1AqresCIY', 1, 1, 1, NULL, NULL, NULL, '2024-01-25 08:41:12'),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hitlogs`
--
ALTER TABLE `hitlogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `image_uploads`
--
ALTER TABLE `image_uploads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

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
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
