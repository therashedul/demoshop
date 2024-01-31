

CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double DEFAULT NULL,
  `total_debit` double DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","2023-08-02 10:44:24","2023-10-11 09:48:22","1403708","Rasel","50000","50000","","new Note","1","1");
INSERT INTO accounts VALUES("2","2023-09-02 16:59:46","2023-10-11 09:48:07","123456","karim","500001","500001","","Karim ac","1","");
INSERT INTO accounts VALUES("3","2023-10-11 10:03:50","2023-10-11 10:06:37","654321","sorna","123456","123456","","test note","0","");



CREATE TABLE `adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO adjustments VALUES("2","adr-20231106-034704","3","","1","1","Note one","2023-11-06 15:47:04","2023-11-06 15:48:42");



CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendances VALUES("2","2023-10-11","2","1","9:45am","5:45pm","1","","Please come","2023-10-11 13:21:44","2023-10-11 13:21:44");



CREATE TABLE `barcodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(15) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO barcodes VALUES("1","1","shart","2","321","\barcode68081776.png","","2023-08-22 12:12:14","2023-08-22 12:12:14");



CREATE TABLE `billers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","new biller","2_1684129568.jpg","webhat","234","rasel.netrweb@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","1216","Bangladesh","1","2023-09-07 16:17:57","2023-09-07 16:17:57");



CREATE TABLE `blacklists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("1","easy","","1","2023-12-24 12:11:10","2023-12-24 12:11:10");
INSERT INTO brands VALUES("2","pluse point","","1","2023-12-24 12:11:15","2023-12-24 12:11:15");



CREATE TABLE `cash_registers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO cash_registers VALUES("1","5000","1","2","1","2023-09-18 15:39:50","2023-09-18 15:39:50");
INSERT INTO cash_registers VALUES("2","12000","1","3","1","2023-09-18 16:45:19","2023-09-18 16:45:19");



CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_en_unique` (`slug_en`),
  UNIQUE KEY `categories_slug_bn_unique` (`slug_bn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO categories VALUES("1","Women","Women","Women","Women","Women","Women","","0","","1","","2023-12-24 12:10:40","2023-12-24 12:10:40");
INSERT INTO categories VALUES("2","children","children","children","children","children","children","","0","2_1703407027.jpg","1","","2023-12-24 12:10:58","2023-12-24 14:37:14");



CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `comment_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentemail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO couriers VALUES("2","korotua","1709370009","mirpur - 12","2023-09-14 10:56:20","2023-09-14 10:56:20");
INSERT INTO couriers VALUES("3","sundor bon","0904422959","mirpur - 12","2023-09-14 10:56:37","2023-09-14 10:56:37");



CREATE TABLE `custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO custom_fields VALUES("1","sale","Test","text","Test","","3","1","0","1","0","0","2023-07-11 12:02:46","2023-07-11 12:02:46");



CREATE TABLE `customer_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customer_groups VALUES("1","general","-1","1","2023-12-24 13:09:07","2023-12-24 13:09:07");
INSERT INTO customer_groups VALUES("2","vip group","-10","1","2023-12-24 13:09:32","2023-12-24 13:09:32");



CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","","karim","house","therashedul@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","4_1692512057.jpg","1216","Bangladesh","","","1","","3","2023-09-10 11:01:56","2023-12-24 13:11:16");
INSERT INTO customers VALUES("2","1","","rasel karim","susuta butiqe ghore","therashedul@gmail.com","0430719596","13/1 Myers St, Roseland, NSW-2195","Dhaka","","business_1688362561.jpg","2195","Bangladesh","","","1","","6","2023-09-10 11:05:46","2024-01-22 10:32:53");
INSERT INTO customers VALUES("3","2","","sorna","susuta butiqe ghore","sorna@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","","1216","Bangladesh","","","1","","3","2023-09-20 10:24:29","2024-01-22 10:30:19");
INSERT INTO customers VALUES("4","1","1","Rashedul Karim","house","therashedul@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","","1216","Bangladesh","","","1","","","2023-12-26 11:02:19","2023-12-26 11:07:20");



CREATE TABLE `deliveries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("1","dr-20240122-103304","2","1","2","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh","rohim","rasel","","","3","2024-01-22 10:33:13","2024-01-22 10:33:24");



CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","new department","1","2023-10-11 12:07:29","2023-10-11 12:07:29");
INSERT INTO departments VALUES("2","office departmentss","0","2023-10-11 12:09:21","2023-10-11 12:12:04");
INSERT INTO departments VALUES("3","department1","1","2023-10-31 09:28:02","2023-10-31 09:28:02");



CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plan_customers VALUES("1","3","1","2023-12-24 12:23:49","2023-12-24 12:23:49");



CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `discount_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plans VALUES("3","vip plan","1","2023-09-11 15:53:50","2023-09-11 15:53:50");
INSERT INTO discount_plans VALUES("4","global","1","2023-09-11 15:56:22","2023-09-11 16:09:30");



CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discounts VALUES("9","weekly offer","All","","2023-09-11","2023-09-22","percentage","10","12","212","Mon,Tue,Wed","1","2023-09-11 16:37:29","2023-09-12 09:57:58");
INSERT INTO discounts VALUES("11","summer","Specific","64,63","2023-10-03","2023-10-03","percentage","10","12","21","Fri,Sat","1","2023-10-03 16:32:49","2023-10-04 11:48:06");
INSERT INTO discounts VALUES("12","demo3","Specific","63","2023-10-03","2023-10-28","percentage","12","12","21","Mon,Tue,Wed,Thu,Fri,Sat,Sun","1","2023-10-03 16:49:48","2023-10-04 11:48:20");



CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO employees VALUES("1","sorna","sorna@gmail.com","01818401065","","1","","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","Bangladesh","0","2023-10-11 12:19:38","2023-10-11 12:46:47");
INSERT INTO employees VALUES("2","sorna","sorna@gmail.com","01818401065","","1","","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","Bangladesh","1","2023-10-11 12:47:31","2023-10-11 12:50:22");
INSERT INTO employees VALUES("3","new name","newuser@gmail.com","01818401065","","1","","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","Bangladesh","0","2023-10-11 12:51:17","2023-10-11 12:51:26");
INSERT INTO employees VALUES("4","faisal","therashedul@gmail.com","01818401065","","1","","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","Bangladesh","1","2023-10-12 17:20:48","2023-10-12 17:20:48");



CREATE TABLE `expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("2","804281679","traveling","1","2023-10-10 10:42:06","2023-10-10 10:57:59");
INSERT INTO expense_categories VALUES("3","201543016","lunch","1","2023-10-10 10:42:17","2023-10-10 10:42:17");



CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `cash_register_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("2","er-20231010-115141","2","2","2","2","1","5000","Note for your","2023-10-10 00:00:00","2023-10-10 14:33:02");
INSERT INTO expenses VALUES("3","er-20231010-023819","3","2","1","1","1","500","madhonbi","2023-10-06 00:00:00","2023-12-24 12:12:56");
INSERT INTO expenses VALUES("4","er-20231101-121846","2","2","1","1","1","250","","2023-11-01 00:00:00","2023-11-01 12:18:46");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `general_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `state` int(11) DEFAULT NULL,
  `free_trial_limit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `without_stock` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_zatca` tinyint(1) DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_registration_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","Myshop","20220905125905.png","0","1","0","all","d-m-Y","rasel","standard","2","1","monthly","01818401065","therashedul@gmail.com","yes","default.css","2018-07-06 12:13:11","2024-01-22 12:50:13","prefix","2024-01-22","1","Myshop company","980980");



CREATE TABLE `gift_card_recharges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_card_recharges VALUES("1","17","250","1","2023-09-18 12:14:49","2023-09-18 12:14:49");
INSERT INTO gift_card_recharges VALUES("2","19","300","1","2023-09-18 12:42:01","2023-09-18 12:42:01");



CREATE TABLE `gift_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO gift_cards VALUES("18","723114460876E20","450","-2444","2","","2023-10-31","1","1","2023-09-18 12:14:26","2023-11-02 14:21:27");
INSERT INTO gift_cards VALUES("19","209400237538487","350","0","1","","2023-09-27","1","1","2023-09-18 12:25:05","2023-10-22 14:53:44");



CREATE TABLE `hitlogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hitlogs VALUES("1","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:26:20","2024-01-22 10:26:20");
INSERT INTO hitlogs VALUES("2","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:29:38","2024-01-22 10:29:38");
INSERT INTO hitlogs VALUES("3","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:29:46","2024-01-22 10:29:46");
INSERT INTO hitlogs VALUES("4","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:29:49","2024-01-22 10:29:49");
INSERT INTO hitlogs VALUES("5","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:29:53","2024-01-22 10:29:53");
INSERT INTO hitlogs VALUES("6","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:29:59","2024-01-22 10:29:59");
INSERT INTO hitlogs VALUES("7","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:10","2024-01-22 10:30:10");
INSERT INTO hitlogs VALUES("8","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:12","2024-01-22 10:30:12");
INSERT INTO hitlogs VALUES("9","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:12","2024-01-22 10:30:12");
INSERT INTO hitlogs VALUES("10","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:17","2024-01-22 10:30:17");
INSERT INTO hitlogs VALUES("11","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:19","2024-01-22 10:30:19");
INSERT INTO hitlogs VALUES("12","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:30:21","2024-01-22 10:30:21");
INSERT INTO hitlogs VALUES("13","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:31:35","2024-01-22 10:31:35");
INSERT INTO hitlogs VALUES("14","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:31:38","2024-01-22 10:31:38");
INSERT INTO hitlogs VALUES("15","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:31:41","2024-01-22 10:31:41");
INSERT INTO hitlogs VALUES("16","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:31:57","2024-01-22 10:31:57");
INSERT INTO hitlogs VALUES("17","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:03","2024-01-22 10:32:03");
INSERT INTO hitlogs VALUES("18","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:05","2024-01-22 10:32:05");
INSERT INTO hitlogs VALUES("19","127.0.0.1","superAdmin.sale.getpayment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getpayment/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:16","2024-01-22 10:32:16");
INSERT INTO hitlogs VALUES("20","127.0.0.1","superAdmin.sale.getpayment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getpayment/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:32","2024-01-22 10:32:32");
INSERT INTO hitlogs VALUES("21","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:35","2024-01-22 10:32:35");
INSERT INTO hitlogs VALUES("22","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:43","2024-01-22 10:32:43");
INSERT INTO hitlogs VALUES("23","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:45","2024-01-22 10:32:45");
INSERT INTO hitlogs VALUES("24","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:46","2024-01-22 10:32:46");
INSERT INTO hitlogs VALUES("25","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:50","2024-01-22 10:32:50");
INSERT INTO hitlogs VALUES("26","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:53","2024-01-22 10:32:53");
INSERT INTO hitlogs VALUES("27","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:54","2024-01-22 10:32:54");
INSERT INTO hitlogs VALUES("28","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:57","2024-01-22 10:32:57");
INSERT INTO hitlogs VALUES("29","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:32:59","2024-01-22 10:32:59");
INSERT INTO hitlogs VALUES("30","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:04","2024-01-22 10:33:04");
INSERT INTO hitlogs VALUES("31","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:12","2024-01-22 10:33:12");
INSERT INTO hitlogs VALUES("32","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:13","2024-01-22 10:33:13");
INSERT INTO hitlogs VALUES("33","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:16","2024-01-22 10:33:16");
INSERT INTO hitlogs VALUES("34","127.0.0.1","superAdmin.delivery.product_delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery.product_delivery/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:20","2024-01-22 10:33:20");
INSERT INTO hitlogs VALUES("35","127.0.0.1","superAdmin.delivery.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:33:24","2024-01-22 10:33:24");
INSERT INTO hitlogs VALUES("36","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:35:28","2024-01-22 10:35:28");
INSERT INTO hitlogs VALUES("37","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:35:32","2024-01-22 10:35:32");
INSERT INTO hitlogs VALUES("38","127.0.0.1","superAdmin.delivery.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:35:39","2024-01-22 10:35:39");
INSERT INTO hitlogs VALUES("39","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:37:26","2024-01-22 10:37:26");
INSERT INTO hitlogs VALUES("40","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:37:30","2024-01-22 10:37:30");
INSERT INTO hitlogs VALUES("41","127.0.0.1","superAdmin.delivery.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:37:41","2024-01-22 10:37:41");
INSERT INTO hitlogs VALUES("42","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:40:09","2024-01-22 10:40:09");
INSERT INTO hitlogs VALUES("43","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:40:13","2024-01-22 10:40:13");
INSERT INTO hitlogs VALUES("44","127.0.0.1","superAdmin.delivery.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:40:21","2024-01-22 10:40:21");
INSERT INTO hitlogs VALUES("45","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:40:22","2024-01-22 10:40:22");
INSERT INTO hitlogs VALUES("46","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:40:23","2024-01-22 10:40:23");
INSERT INTO hitlogs VALUES("47","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:42:40","2024-01-22 10:42:40");
INSERT INTO hitlogs VALUES("48","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:42:57","2024-01-22 10:42:57");
INSERT INTO hitlogs VALUES("49","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:43:13","2024-01-22 10:43:13");
INSERT INTO hitlogs VALUES("50","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:44:55","2024-01-22 10:44:55");
INSERT INTO hitlogs VALUES("51","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:45:23","2024-01-22 10:45:23");
INSERT INTO hitlogs VALUES("52","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:45:50","2024-01-22 10:45:50");
INSERT INTO hitlogs VALUES("53","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:45:50","2024-01-22 10:45:50");
INSERT INTO hitlogs VALUES("54","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:03","2024-01-22 10:46:03");
INSERT INTO hitlogs VALUES("55","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:04","2024-01-22 10:46:04");
INSERT INTO hitlogs VALUES("56","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:14","2024-01-22 10:46:14");
INSERT INTO hitlogs VALUES("57","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:14","2024-01-22 10:46:14");
INSERT INTO hitlogs VALUES("58","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:35","2024-01-22 10:46:35");
INSERT INTO hitlogs VALUES("59","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:46:35","2024-01-22 10:46:35");
INSERT INTO hitlogs VALUES("60","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:48:21","2024-01-22 10:48:21");
INSERT INTO hitlogs VALUES("61","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:48:35","2024-01-22 10:48:35");
INSERT INTO hitlogs VALUES("62","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:50:55","2024-01-22 10:50:55");
INSERT INTO hitlogs VALUES("63","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:25","2024-01-22 10:51:25");
INSERT INTO hitlogs VALUES("64","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:26","2024-01-22 10:51:26");
INSERT INTO hitlogs VALUES("65","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:37","2024-01-22 10:51:37");
INSERT INTO hitlogs VALUES("66","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:37","2024-01-22 10:51:37");
INSERT INTO hitlogs VALUES("67","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:45","2024-01-22 10:51:45");
INSERT INTO hitlogs VALUES("68","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:45","2024-01-22 10:51:45");
INSERT INTO hitlogs VALUES("69","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:57","2024-01-22 10:51:57");
INSERT INTO hitlogs VALUES("70","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 10:51:58","2024-01-22 10:51:58");
INSERT INTO hitlogs VALUES("71","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:03:18","2024-01-22 11:03:18");
INSERT INTO hitlogs VALUES("72","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:03:21","2024-01-22 11:03:21");
INSERT INTO hitlogs VALUES("73","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:15:47","2024-01-22 11:15:47");
INSERT INTO hitlogs VALUES("74","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:18:21","2024-01-22 11:18:21");
INSERT INTO hitlogs VALUES("75","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:18:48","2024-01-22 11:18:48");
INSERT INTO hitlogs VALUES("76","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:21:21","2024-01-22 11:21:21");
INSERT INTO hitlogs VALUES("77","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:21:41","2024-01-22 11:21:41");
INSERT INTO hitlogs VALUES("78","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:21:52","2024-01-22 11:21:52");
INSERT INTO hitlogs VALUES("79","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:21:58","2024-01-22 11:21:58");
INSERT INTO hitlogs VALUES("80","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:28","2024-01-22 11:22:28");
INSERT INTO hitlogs VALUES("81","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:29","2024-01-22 11:22:29");
INSERT INTO hitlogs VALUES("82","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:35","2024-01-22 11:22:35");
INSERT INTO hitlogs VALUES("83","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:35","2024-01-22 11:22:35");
INSERT INTO hitlogs VALUES("84","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:42","2024-01-22 11:22:42");
INSERT INTO hitlogs VALUES("85","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:42","2024-01-22 11:22:42");
INSERT INTO hitlogs VALUES("86","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:51","2024-01-22 11:22:51");
INSERT INTO hitlogs VALUES("87","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:22:51","2024-01-22 11:22:51");
INSERT INTO hitlogs VALUES("88","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:23:40","2024-01-22 11:23:40");
INSERT INTO hitlogs VALUES("89","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:23:56","2024-01-22 11:23:56");
INSERT INTO hitlogs VALUES("90","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:23:56","2024-01-22 11:23:56");
INSERT INTO hitlogs VALUES("91","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:06","2024-01-22 11:24:06");
INSERT INTO hitlogs VALUES("92","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:07","2024-01-22 11:24:07");
INSERT INTO hitlogs VALUES("93","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:14","2024-01-22 11:24:14");
INSERT INTO hitlogs VALUES("94","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:14","2024-01-22 11:24:14");
INSERT INTO hitlogs VALUES("95","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:27","2024-01-22 11:24:27");
INSERT INTO hitlogs VALUES("96","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:24:27","2024-01-22 11:24:27");
INSERT INTO hitlogs VALUES("97","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:25:07","2024-01-22 11:25:07");
INSERT INTO hitlogs VALUES("98","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:25:44","2024-01-22 11:25:44");
INSERT INTO hitlogs VALUES("99","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:25:44","2024-01-22 11:25:44");
INSERT INTO hitlogs VALUES("100","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:29:31","2024-01-22 11:29:31");
INSERT INTO hitlogs VALUES("101","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:29:41","2024-01-22 11:29:41");
INSERT INTO hitlogs VALUES("102","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:29:41","2024-01-22 11:29:41");
INSERT INTO hitlogs VALUES("103","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:31:42","2024-01-22 11:31:42");
INSERT INTO hitlogs VALUES("104","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:32:35","2024-01-22 11:32:35");
INSERT INTO hitlogs VALUES("105","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:32:45","2024-01-22 11:32:45");
INSERT INTO hitlogs VALUES("106","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:34:47","2024-01-22 11:34:47");
INSERT INTO hitlogs VALUES("107","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:34:56","2024-01-22 11:34:56");
INSERT INTO hitlogs VALUES("108","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:15","2024-01-22 11:35:15");
INSERT INTO hitlogs VALUES("109","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:24","2024-01-22 11:35:24");
INSERT INTO hitlogs VALUES("110","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:33","2024-01-22 11:35:33");
INSERT INTO hitlogs VALUES("111","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:45","2024-01-22 11:35:45");
INSERT INTO hitlogs VALUES("112","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:45","2024-01-22 11:35:45");
INSERT INTO hitlogs VALUES("113","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:56","2024-01-22 11:35:56");
INSERT INTO hitlogs VALUES("114","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:35:56","2024-01-22 11:35:56");
INSERT INTO hitlogs VALUES("115","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:36:09","2024-01-22 11:36:09");
INSERT INTO hitlogs VALUES("116","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:36:09","2024-01-22 11:36:09");
INSERT INTO hitlogs VALUES("117","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:07","2024-01-22 11:37:07");
INSERT INTO hitlogs VALUES("118","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:16","2024-01-22 11:37:16");
INSERT INTO hitlogs VALUES("119","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:17","2024-01-22 11:37:17");
INSERT INTO hitlogs VALUES("120","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:47","2024-01-22 11:37:47");
INSERT INTO hitlogs VALUES("121","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:54","2024-01-22 11:37:54");
INSERT INTO hitlogs VALUES("122","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:37:54","2024-01-22 11:37:54");
INSERT INTO hitlogs VALUES("123","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:38:02","2024-01-22 11:38:02");
INSERT INTO hitlogs VALUES("124","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:38:03","2024-01-22 11:38:03");
INSERT INTO hitlogs VALUES("125","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:38:55","2024-01-22 11:38:55");
INSERT INTO hitlogs VALUES("126","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:38:56","2024-01-22 11:38:56");
INSERT INTO hitlogs VALUES("127","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:04","2024-01-22 11:39:04");
INSERT INTO hitlogs VALUES("128","127.0.0.1","superAdmin.ganeralsetting.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:24","2024-01-22 11:39:24");
INSERT INTO hitlogs VALUES("129","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:24","2024-01-22 11:39:24");
INSERT INTO hitlogs VALUES("130","127.0.0.1","superAdmin.ganeralsetting.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:35","2024-01-22 11:39:35");
INSERT INTO hitlogs VALUES("131","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:35","2024-01-22 11:39:35");
INSERT INTO hitlogs VALUES("132","127.0.0.1","superAdmin.ganeralsetting.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:44","2024-01-22 11:39:44");
INSERT INTO hitlogs VALUES("133","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:39:44","2024-01-22 11:39:44");
INSERT INTO hitlogs VALUES("134","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:40:20","2024-01-22 11:40:20");
INSERT INTO hitlogs VALUES("135","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:40:45","2024-01-22 11:40:45");
INSERT INTO hitlogs VALUES("136","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:40:45","2024-01-22 11:40:45");
INSERT INTO hitlogs VALUES("137","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:47:27","2024-01-22 11:47:27");
INSERT INTO hitlogs VALUES("138","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:47:39","2024-01-22 11:47:39");
INSERT INTO hitlogs VALUES("139","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:47:39","2024-01-22 11:47:39");
INSERT INTO hitlogs VALUES("140","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:48:21","2024-01-22 11:48:21");
INSERT INTO hitlogs VALUES("141","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:48:32","2024-01-22 11:48:32");
INSERT INTO hitlogs VALUES("142","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:48:32","2024-01-22 11:48:32");
INSERT INTO hitlogs VALUES("143","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:48:41","2024-01-22 11:48:41");
INSERT INTO hitlogs VALUES("144","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:48:41","2024-01-22 11:48:41");
INSERT INTO hitlogs VALUES("145","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:51:28","2024-01-22 11:51:28");
INSERT INTO hitlogs VALUES("146","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:51:36","2024-01-22 11:51:36");
INSERT INTO hitlogs VALUES("147","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:51:36","2024-01-22 11:51:36");
INSERT INTO hitlogs VALUES("148","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:52:39","2024-01-22 11:52:39");
INSERT INTO hitlogs VALUES("149","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:52:49","2024-01-22 11:52:49");
INSERT INTO hitlogs VALUES("150","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:52:50","2024-01-22 11:52:50");
INSERT INTO hitlogs VALUES("151","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:53:22","2024-01-22 11:53:22");
INSERT INTO hitlogs VALUES("152","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:53:33","2024-01-22 11:53:33");
INSERT INTO hitlogs VALUES("153","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:53:34","2024-01-22 11:53:34");
INSERT INTO hitlogs VALUES("154","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:53:54","2024-01-22 11:53:54");
INSERT INTO hitlogs VALUES("155","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:54:02","2024-01-22 11:54:02");
INSERT INTO hitlogs VALUES("156","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:54:02","2024-01-22 11:54:02");
INSERT INTO hitlogs VALUES("157","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:54:24","2024-01-22 11:54:24");
INSERT INTO hitlogs VALUES("158","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:54:31","2024-01-22 11:54:31");
INSERT INTO hitlogs VALUES("159","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:54:57","2024-01-22 11:54:57");
INSERT INTO hitlogs VALUES("160","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:55:35","2024-01-22 11:55:35");
INSERT INTO hitlogs VALUES("161","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:55:35","2024-01-22 11:55:35");
INSERT INTO hitlogs VALUES("162","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:55:43","2024-01-22 11:55:43");
INSERT INTO hitlogs VALUES("163","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:56:46","2024-01-22 11:56:46");
INSERT INTO hitlogs VALUES("164","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:56:46","2024-01-22 11:56:46");
INSERT INTO hitlogs VALUES("165","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:56:54","2024-01-22 11:56:54");
INSERT INTO hitlogs VALUES("166","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 11:58:27","2024-01-22 11:58:27");
INSERT INTO hitlogs VALUES("167","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:00:17","2024-01-22 12:00:17");
INSERT INTO hitlogs VALUES("168","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:00:24","2024-01-22 12:00:24");
INSERT INTO hitlogs VALUES("169","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:01:22","2024-01-22 12:01:22");
INSERT INTO hitlogs VALUES("170","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:02:48","2024-01-22 12:02:48");
INSERT INTO hitlogs VALUES("171","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:05:12","2024-01-22 12:05:12");
INSERT INTO hitlogs VALUES("172","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:08:39","2024-01-22 12:08:39");
INSERT INTO hitlogs VALUES("173","127.0.0.1","superAdmin.ganeralsetting.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:08:45","2024-01-22 12:08:45");
INSERT INTO hitlogs VALUES("174","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:08:45","2024-01-22 12:08:45");
INSERT INTO hitlogs VALUES("175","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:10:13","2024-01-22 12:10:13");
INSERT INTO hitlogs VALUES("176","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:10:40","2024-01-22 12:10:40");
INSERT INTO hitlogs VALUES("177","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:10:50","2024-01-22 12:10:50");
INSERT INTO hitlogs VALUES("178","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:11:25","2024-01-22 12:11:25");
INSERT INTO hitlogs VALUES("179","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:11:54","2024-01-22 12:11:54");
INSERT INTO hitlogs VALUES("180","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:12:09","2024-01-22 12:12:09");
INSERT INTO hitlogs VALUES("181","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:13:21","2024-01-22 12:13:21");
INSERT INTO hitlogs VALUES("182","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:13:29","2024-01-22 12:13:29");
INSERT INTO hitlogs VALUES("183","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:13:36","2024-01-22 12:13:36");
INSERT INTO hitlogs VALUES("184","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:13:46","2024-01-22 12:13:46");
INSERT INTO hitlogs VALUES("185","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:14:55","2024-01-22 12:14:55");
INSERT INTO hitlogs VALUES("186","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:15:09","2024-01-22 12:15:09");
INSERT INTO hitlogs VALUES("187","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:15:50","2024-01-22 12:15:50");
INSERT INTO hitlogs VALUES("188","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:16:01","2024-01-22 12:16:01");
INSERT INTO hitlogs VALUES("189","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:16:01","2024-01-22 12:16:01");
INSERT INTO hitlogs VALUES("190","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:18:29","2024-01-22 12:18:29");
INSERT INTO hitlogs VALUES("191","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:18:51","2024-01-22 12:18:51");
INSERT INTO hitlogs VALUES("192","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:18:51","2024-01-22 12:18:51");
INSERT INTO hitlogs VALUES("193","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:18:57","2024-01-22 12:18:57");
INSERT INTO hitlogs VALUES("194","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:18:57","2024-01-22 12:18:57");
INSERT INTO hitlogs VALUES("195","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:29","2024-01-22 12:19:29");
INSERT INTO hitlogs VALUES("196","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:38","2024-01-22 12:19:38");
INSERT INTO hitlogs VALUES("197","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:38","2024-01-22 12:19:38");
INSERT INTO hitlogs VALUES("198","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:44","2024-01-22 12:19:44");
INSERT INTO hitlogs VALUES("199","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:49","2024-01-22 12:19:49");
INSERT INTO hitlogs VALUES("200","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:49","2024-01-22 12:19:49");
INSERT INTO hitlogs VALUES("201","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:56","2024-01-22 12:19:56");
INSERT INTO hitlogs VALUES("202","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:19:56","2024-01-22 12:19:56");
INSERT INTO hitlogs VALUES("203","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:01","2024-01-22 12:20:01");
INSERT INTO hitlogs VALUES("204","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:01","2024-01-22 12:20:01");
INSERT INTO hitlogs VALUES("205","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:09","2024-01-22 12:20:09");
INSERT INTO hitlogs VALUES("206","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:10","2024-01-22 12:20:10");
INSERT INTO hitlogs VALUES("207","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:15","2024-01-22 12:20:15");
INSERT INTO hitlogs VALUES("208","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:20:49","2024-01-22 12:20:49");
INSERT INTO hitlogs VALUES("209","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:21:49","2024-01-22 12:21:49");
INSERT INTO hitlogs VALUES("210","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:22:03","2024-01-22 12:22:03");
INSERT INTO hitlogs VALUES("211","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:22:48","2024-01-22 12:22:48");
INSERT INTO hitlogs VALUES("212","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:22:49","2024-01-22 12:22:49");
INSERT INTO hitlogs VALUES("213","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:03","2024-01-22 12:23:03");
INSERT INTO hitlogs VALUES("214","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:04","2024-01-22 12:23:04");
INSERT INTO hitlogs VALUES("215","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:19","2024-01-22 12:23:19");
INSERT INTO hitlogs VALUES("216","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:19","2024-01-22 12:23:19");
INSERT INTO hitlogs VALUES("217","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:25","2024-01-22 12:23:25");
INSERT INTO hitlogs VALUES("218","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:25","2024-01-22 12:23:25");
INSERT INTO hitlogs VALUES("219","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:34","2024-01-22 12:23:34");
INSERT INTO hitlogs VALUES("220","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:34","2024-01-22 12:23:34");
INSERT INTO hitlogs VALUES("221","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:44","2024-01-22 12:23:44");
INSERT INTO hitlogs VALUES("222","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:23:44","2024-01-22 12:23:44");
INSERT INTO hitlogs VALUES("223","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:24:46","2024-01-22 12:24:46");
INSERT INTO hitlogs VALUES("224","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:24:47","2024-01-22 12:24:47");
INSERT INTO hitlogs VALUES("225","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:24:54","2024-01-22 12:24:54");
INSERT INTO hitlogs VALUES("226","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:24:54","2024-01-22 12:24:54");
INSERT INTO hitlogs VALUES("227","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:25:02","2024-01-22 12:25:02");
INSERT INTO hitlogs VALUES("228","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:25:02","2024-01-22 12:25:02");
INSERT INTO hitlogs VALUES("229","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:26:04","2024-01-22 12:26:04");
INSERT INTO hitlogs VALUES("230","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:26:05","2024-01-22 12:26:05");
INSERT INTO hitlogs VALUES("231","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:26:12","2024-01-22 12:26:12");
INSERT INTO hitlogs VALUES("232","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:26:13","2024-01-22 12:26:13");
INSERT INTO hitlogs VALUES("233","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:27:49","2024-01-22 12:27:49");
INSERT INTO hitlogs VALUES("234","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:27:58","2024-01-22 12:27:58");
INSERT INTO hitlogs VALUES("235","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:27:59","2024-01-22 12:27:59");
INSERT INTO hitlogs VALUES("236","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:28:16","2024-01-22 12:28:16");
INSERT INTO hitlogs VALUES("237","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:32:53","2024-01-22 12:32:53");
INSERT INTO hitlogs VALUES("238","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:33:20","2024-01-22 12:33:20");
INSERT INTO hitlogs VALUES("239","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:33:21","2024-01-22 12:33:21");
INSERT INTO hitlogs VALUES("240","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:35:50","2024-01-22 12:35:50");
INSERT INTO hitlogs VALUES("241","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:36:27","2024-01-22 12:36:27");
INSERT INTO hitlogs VALUES("242","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:36:34","2024-01-22 12:36:34");
INSERT INTO hitlogs VALUES("243","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:36:35","2024-01-22 12:36:35");
INSERT INTO hitlogs VALUES("244","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:38:01","2024-01-22 12:38:01");
INSERT INTO hitlogs VALUES("245","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:38:12","2024-01-22 12:38:12");
INSERT INTO hitlogs VALUES("246","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:38:13","2024-01-22 12:38:13");
INSERT INTO hitlogs VALUES("247","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:38:22","2024-01-22 12:38:22");
INSERT INTO hitlogs VALUES("248","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:38:22","2024-01-22 12:38:22");
INSERT INTO hitlogs VALUES("249","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:39:10","2024-01-22 12:39:10");
INSERT INTO hitlogs VALUES("250","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:39:16","2024-01-22 12:39:16");
INSERT INTO hitlogs VALUES("251","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:39:16","2024-01-22 12:39:16");
INSERT INTO hitlogs VALUES("252","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:40:15","2024-01-22 12:40:15");
INSERT INTO hitlogs VALUES("253","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:40:16","2024-01-22 12:40:16");
INSERT INTO hitlogs VALUES("254","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:41:25","2024-01-22 12:41:25");
INSERT INTO hitlogs VALUES("255","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:41:32","2024-01-22 12:41:32");
INSERT INTO hitlogs VALUES("256","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:41:43","2024-01-22 12:41:43");
INSERT INTO hitlogs VALUES("257","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:42:27","2024-01-22 12:42:27");
INSERT INTO hitlogs VALUES("258","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:42:27","2024-01-22 12:42:27");
INSERT INTO hitlogs VALUES("259","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:42:52","2024-01-22 12:42:52");
INSERT INTO hitlogs VALUES("260","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:42:53","2024-01-22 12:42:53");
INSERT INTO hitlogs VALUES("261","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:11","2024-01-22 12:44:11");
INSERT INTO hitlogs VALUES("262","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:21","2024-01-22 12:44:21");
INSERT INTO hitlogs VALUES("263","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:21","2024-01-22 12:44:21");
INSERT INTO hitlogs VALUES("264","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:31","2024-01-22 12:44:31");
INSERT INTO hitlogs VALUES("265","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:31","2024-01-22 12:44:31");
INSERT INTO hitlogs VALUES("266","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:42","2024-01-22 12:44:42");
INSERT INTO hitlogs VALUES("267","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:44:42","2024-01-22 12:44:42");
INSERT INTO hitlogs VALUES("268","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:01","2024-01-22 12:45:01");
INSERT INTO hitlogs VALUES("269","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:02","2024-01-22 12:45:02");
INSERT INTO hitlogs VALUES("270","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:10","2024-01-22 12:45:10");
INSERT INTO hitlogs VALUES("271","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:11","2024-01-22 12:45:11");
INSERT INTO hitlogs VALUES("272","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:19","2024-01-22 12:45:19");
INSERT INTO hitlogs VALUES("273","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:45:19","2024-01-22 12:45:19");
INSERT INTO hitlogs VALUES("274","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:47:29","2024-01-22 12:47:29");
INSERT INTO hitlogs VALUES("275","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:47:42","2024-01-22 12:47:42");
INSERT INTO hitlogs VALUES("276","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:47:43","2024-01-22 12:47:43");
INSERT INTO hitlogs VALUES("277","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:48:29","2024-01-22 12:48:29");
INSERT INTO hitlogs VALUES("278","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:48:43","2024-01-22 12:48:43");
INSERT INTO hitlogs VALUES("279","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:50:13","2024-01-22 12:50:13");
INSERT INTO hitlogs VALUES("280","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 12:50:13","2024-01-22 12:50:13");
INSERT INTO hitlogs VALUES("281","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 13:04:35","2024-01-22 13:04:35");
INSERT INTO hitlogs VALUES("282","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-22 14:10:09","2024-01-22 14:10:09");



CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO holidays VALUES("2","1","2023-10-11","2023-10-12","day","1","2023-10-11 14:23:09","2023-10-11 14:25:07");



CREATE TABLE `hrm_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `checkin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hrm_settings VALUES("1","9:45am","5:45pm","2023-10-11 13:18:24","2023-10-11 13:20:29");



CREATE TABLE `image_uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO image_uploads VALUES("10","3_1684060971.jpg","3","3","","","3_1684060971.jpg","3_1684060971.jpg","1","superAdmin",".jpg","2023-05-14 10:42:51","2023-05-14 10:42:51");
INSERT INTO image_uploads VALUES("11","2_1684129568.jpg","2","2","","","2_1684129568.jpg","2_1684129568.jpg","1","superAdmin",".jpg","2023-05-15 05:46:10","2023-05-15 05:46:10");
INSERT INTO image_uploads VALUES("18","business_1688362561.jpg","business","business","","","business_1688362561.jpg","business_1688362561.jpg","1","superAdmin",".jpg","2023-07-03 05:36:01","2023-07-03 05:36:01");
INSERT INTO image_uploads VALUES("20","4_1692512057.jpg","4","4","","","4_1692512057.jpg","4_1692512057.jpg","1","superAdmin",".jpg","2023-08-20 12:14:18","2023-08-20 12:14:18");
INSERT INTO image_uploads VALUES("23","3_1703400840.jpg","3","3","","","3_1703400840.jpg","3_1703400840.jpg","1","superAdmin",".jpg","2023-12-24 12:54:01","2023-12-24 12:54:01");
INSERT INTO image_uploads VALUES("24","2_1703407027.jpg","2","2","","","2_1703407027.jpg","2_1703407027.jpg","1","superAdmin",".jpg","2023-12-24 14:37:08","2023-12-24 14:37:08");



CREATE TABLE `loginhistories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `menuitems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2016_06_01_000001_create_oauth_auth_codes_table","1");
INSERT INTO migrations VALUES("4","2016_06_01_000002_create_oauth_access_tokens_table","1");
INSERT INTO migrations VALUES("5","2016_06_01_000003_create_oauth_refresh_tokens_table","1");
INSERT INTO migrations VALUES("6","2016_06_01_000004_create_oauth_clients_table","1");
INSERT INTO migrations VALUES("7","2016_06_01_000005_create_oauth_personal_access_clients_table","1");
INSERT INTO migrations VALUES("8","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("9","2019_12_14_000001_create_personal_access_tokens_table","1");
INSERT INTO migrations VALUES("10","2022_09_21_105619_create_sessions_table","1");
INSERT INTO migrations VALUES("11","2022_09_21_115841_create_roles_table","1");
INSERT INTO migrations VALUES("12","2022_09_21_115947_create_permissions_table","1");
INSERT INTO migrations VALUES("13","2022_09_21_120008_create_role_has_permissions_table","1");
INSERT INTO migrations VALUES("14","2022_09_28_114555_create_hitlogs_table","1");
INSERT INTO migrations VALUES("15","2022_09_28_114858_create_blacklists_table","1");
INSERT INTO migrations VALUES("16","2022_09_28_114942_create_whitelists_table","1");
INSERT INTO migrations VALUES("17","2022_09_28_115028_create_loginhistories_table","1");
INSERT INTO migrations VALUES("18","2022_09_28_121516_create_user_verifies_table","1");
INSERT INTO migrations VALUES("19","2022_10_03_111056_create_image_uploads_table","1");
INSERT INTO migrations VALUES("20","2022_10_06_155813_create_menus_table","1");
INSERT INTO migrations VALUES("21","2022_10_06_160153_create_menuitems_table","1");
INSERT INTO migrations VALUES("22","2022_10_06_162204_create_categories_table","1");
INSERT INTO migrations VALUES("23","2022_10_06_162304_create_posts_table","1");
INSERT INTO migrations VALUES("24","2022_10_06_162320_create_postmetas_table","1");
INSERT INTO migrations VALUES("25","2022_10_06_162334_create_pages_table","1");
INSERT INTO migrations VALUES("26","2022_10_31_144501_create_comments_table","1");
INSERT INTO migrations VALUES("27","2022_12_20_112205_create_sliders_table","1");
INSERT INTO migrations VALUES("28","2023_07_30_094637_create_brands_table","2");
INSERT INTO migrations VALUES("29","2023_07_31_053322_create_units_table","3");
INSERT INTO migrations VALUES("30","2023_08_01_054519_create_barcodes_table","4");
INSERT INTO migrations VALUES("31","2023_08_02_103317_create_prodcuts_table","5");
INSERT INTO migrations VALUES("32","2023_08_06_071205_create_products_table","6");
INSERT INTO migrations VALUES("33","2023_08_09_044405_create_warehouses_table","7");
INSERT INTO migrations VALUES("34","2023_08_09_105139_create_suppliers_table","7");
INSERT INTO migrations VALUES("35","2023_08_09_125205_create_product_warehouses_table","8");
INSERT INTO migrations VALUES("36","2023_08_09_130252_create_promotions_table","8");
INSERT INTO migrations VALUES("37","2023_08_09_144210_create_variants_table","9");
INSERT INTO migrations VALUES("38","2023_08_09_144312_create_producat_variants_table","9");
INSERT INTO migrations VALUES("39","2023_08_14_114216_create_product_variants_table","10");
INSERT INTO migrations VALUES("40","2023_08_14_120057_create_taxes_table","11");
INSERT INTO migrations VALUES("41","2023_08_02_114330_create_purchases_table","12");
INSERT INTO migrations VALUES("42","2023_08_27_110941_create_product_batches_table","13");
INSERT INTO migrations VALUES("43","2023_08_27_112234_create_product_purchases_table","14");
INSERT INTO migrations VALUES("44","2023_08_27_151523_create_payments_table","15");
INSERT INTO migrations VALUES("45","2023_08_27_151746_create_payment_with_cheques_table","15");
INSERT INTO migrations VALUES("46","2023_08_27_151820_create_payment_with_credit_cards_table","15");
INSERT INTO migrations VALUES("47","2023_08_27_160529_create_accounts_table","16");
INSERT INTO migrations VALUES("48","2023_08_28_142156_create_returns_table","17");
INSERT INTO migrations VALUES("49","2023_08_28_142425_create_return_purchases_table","17");
INSERT INTO migrations VALUES("50","2023_08_28_142557_create_purchase_product_returns_table","17");
INSERT INTO migrations VALUES("51","2023_09_07_122606_create_sales_table","18");
INSERT INTO migrations VALUES("52","2023_09_07_122916_create_billers_table","18");
INSERT INTO migrations VALUES("53","2023_09_07_132010_create_product_sales_table","19");
INSERT INTO migrations VALUES("54","2023_09_07_132309_create_customer_groups_table","19");
INSERT INTO migrations VALUES("55","2023_09_07_132421_create_customers_table","19");
INSERT INTO migrations VALUES("56","2023_09_07_141928_create_payment_with_gift_cards_table","19");
INSERT INTO migrations VALUES("57","2023_09_07_142050_create_gift_card_recharges_table","19");
INSERT INTO migrations VALUES("58","2023_09_07_142121_create_gift_cards_table","19");
INSERT INTO migrations VALUES("59","2023_09_07_143006_create_reward_point_settings_table","19");
INSERT INTO migrations VALUES("60","2023_09_07_143125_create_pos_settings_table","19");
INSERT INTO migrations VALUES("61","2023_09_07_150432_create_deliveries_table","20");
INSERT INTO migrations VALUES("62","2023_09_07_153449_create_cash_registers_table","21");
INSERT INTO migrations VALUES("63","2023_09_10_122513_create_discounts_table","22");
INSERT INTO migrations VALUES("64","2023_09_10_122734_create_discount_plans_table","22");
INSERT INTO migrations VALUES("65","2023_09_10_123545_create_discount_plan_customers_table","22");
INSERT INTO migrations VALUES("66","2023_09_10_142423_create_discount_plan_discounts_table","23");
INSERT INTO migrations VALUES("67","2023_09_13_105052_create_coupons_table","24");
INSERT INTO migrations VALUES("68","2023_09_13_111427_create_couriers_table","25");
INSERT INTO migrations VALUES("69","2023_10_02_121614_create_general_settings_table","26");
INSERT INTO migrations VALUES("70","2023_10_09_143537_create_product_quotations_table","27");
INSERT INTO migrations VALUES("71","2023_10_09_144232_create_quotations_table","27");
INSERT INTO migrations VALUES("72","2023_10_09_144322_create_product_returns_table","27");
INSERT INTO migrations VALUES("73","2023_10_09_144536_create_product_transfers_table","27");
INSERT INTO migrations VALUES("74","2023_10_09_144626_create_payrolls_table","27");
INSERT INTO migrations VALUES("75","2023_10_09_145359_create_expenses_table","28");
INSERT INTO migrations VALUES("76","2023_10_09_145451_create_expense_categories_table","28");
INSERT INTO migrations VALUES("77","2023_10_09_145645_create_notifications_table","28");
INSERT INTO migrations VALUES("78","2023_10_09_151111_create_transfers_table","28");
INSERT INTO migrations VALUES("79","2023_10_10_171947_create_money_transfers_table","29");
INSERT INTO migrations VALUES("80","2023_10_11_094947_create_hrm_settings_table","30");
INSERT INTO migrations VALUES("81","2023_10_11_111629_create_employees_table","31");
INSERT INTO migrations VALUES("82","2023_10_11_112202_create_departments_table","31");
INSERT INTO migrations VALUES("83","2023_10_11_112234_create_stock_counts_table","31");
INSERT INTO migrations VALUES("84","2023_10_11_112255_create_deposits_table","31");
INSERT INTO migrations VALUES("85","2023_10_11_112329_create_holidays_table","31");
INSERT INTO migrations VALUES("86","2023_10_11_113632_create_attendances_table","31");
INSERT INTO migrations VALUES("87","2023_11_06_123757_create_adjustments_table","32");
INSERT INTO migrations VALUES("88","2023_11_06_124838_create_product_adjustments_table","32");



CREATE TABLE `money_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO money_transfers VALUES("1","mtr-20231012-050856","1","2","2001","2023-10-12 17:08:56","2023-10-12 17:14:39");



CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_access_tokens VALUES("03b93a10ef959fb32cbb8e141a444f248d2355d431408d17fae87c1b2a4d698966d20c5f83bc29fa","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-05 04:17:06","2023-07-05 04:17:06","2024-07-05 04:17:06");
INSERT INTO oauth_access_tokens VALUES("04045bcc87b4b9e9454666bbda2449504e5a8323bb7bb4b26c2306cb042a378c448031224bb0f715","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-10 10:06:40","2023-08-10 10:06:40","2024-08-10 10:06:40");
INSERT INTO oauth_access_tokens VALUES("05f76ddd704ac678d104fb086f7491cdf55bcced6c42d4b5ec883c51f16413c5b07fbdbd285d93fe","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-12 10:15:19","2023-10-12 10:15:19","2024-10-12 10:15:19");
INSERT INTO oauth_access_tokens VALUES("0b189dd7c01ce6d955d5c1d0081a6c4ffaf2a148077eff5bea487f3cf714e66fac05def729ec030b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-02 04:06:28","2023-07-02 04:06:28","2024-07-02 04:06:28");
INSERT INTO oauth_access_tokens VALUES("1192f94a3f26983e8dec5f200db7a291ce928d5c58af4ada644c7625ed0d2e490510efe0ee0241c6","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-18 04:22:25","2023-05-18 04:22:25","2024-05-18 04:22:25");
INSERT INTO oauth_access_tokens VALUES("1264a915d566f13ae87ff657628c54e9a0d37d3c339e5cd6f1adf6c5584001845d2f7ee2e191fa25","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-22 10:06:31","2023-08-22 10:06:31","2024-08-22 10:06:31");
INSERT INTO oauth_access_tokens VALUES("130c19861501c51fe4e67fb3862464872fde83031efc24f0f9997c4fa002083e747cb36368c7738b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-21 10:03:09","2023-08-21 10:03:09","2024-08-21 10:03:09");
INSERT INTO oauth_access_tokens VALUES("13ed8c7d129bdfc77d88be8c46342c0e65bc7841bcd4aaac8715851659636e519c384e889fb9d567","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-20 04:10:47","2023-07-20 04:10:47","2024-07-20 04:10:47");
INSERT INTO oauth_access_tokens VALUES("14e2e2df6be8851da8e37791142b22b3fd746aa7966e86035ee2cbe4d98bb5460a076c8b482d3257","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-25 10:13:11","2023-06-25 10:13:11","2024-06-25 10:13:11");
INSERT INTO oauth_access_tokens VALUES("17615c3236326a013d05625c0b3d3c099f5036c2f1ed401962f5290f6f1e3d2cb511d6749721b318","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-27 10:18:58","2023-08-27 10:18:58","2024-08-27 10:18:58");
INSERT INTO oauth_access_tokens VALUES("18e9dc8ad69fe06959fe716418b72678e956639c6c9537500444c7a1d9c8577d5ec1c1e00f8c8ff2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-17 09:37:54","2023-10-17 09:37:54","2024-10-17 09:37:54");
INSERT INTO oauth_access_tokens VALUES("19a369599238bd9aed1e28af797f0a05bde16c816239799e8758805111d8e8b32e780a952b402565","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-19 10:02:52","2023-09-19 10:02:52","2024-09-19 10:02:52");
INSERT INTO oauth_access_tokens VALUES("1ab1171e5b103bde53cb963c397061c1211f85fa4cd33e8aff3e33e946f8899bee95719f033318f9","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-26 10:02:39","2023-09-26 10:02:39","2024-09-26 10:02:39");
INSERT INTO oauth_access_tokens VALUES("1abcced48c1c9f3e4f52740a8eabbdb5170377a9298a09c1bfb6eb89b0b5f4081788bb4d46a8c4c0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-31 09:18:24","2023-07-31 09:18:24","2024-07-31 09:18:24");
INSERT INTO oauth_access_tokens VALUES("1b2e0d0ec255c7e4b9e64277e4c532e4cd61b083661b516b129d414fb588f3b0931d4b2b0b5e1826","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-06 07:04:15","2023-08-06 07:04:15","2024-08-06 07:04:15");
INSERT INTO oauth_access_tokens VALUES("1bb78fa82893f0720b2f468c81384bc4190663259797e990ef6a8ba9c74633672b432fbddc545368","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-19 09:48:19","2023-10-19 09:48:19","2024-10-19 09:48:19");
INSERT INTO oauth_access_tokens VALUES("1f2cb88de58b9471193c5662c965fe0f4864eaf11d634c019278c96e9065698377a654432105605f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-04 04:14:04","2023-07-04 04:14:04","2024-07-04 04:14:04");
INSERT INTO oauth_access_tokens VALUES("252e97d7fbafff46e413d6648a30a19c529bc06478ac0a6280ff2947c3e70d5029c09c58b5d862de","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-07 09:33:51","2023-11-07 09:33:51","2024-11-07 09:33:51");
INSERT INTO oauth_access_tokens VALUES("25c33d02893e7c0c7b0b8d919fcaa54f0b307180eb7d04ca597b5226b843b5036cc38e10ba036139","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-02 09:34:30","2023-11-02 09:34:30","2024-11-02 09:34:30");
INSERT INTO oauth_access_tokens VALUES("266bc75f802e42eb3a0fe6ca49f4ad6c0bd46f1f7c318591e5197fba391e2b0f0404cb2318a0797d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-30 08:32:35","2023-07-30 08:32:35","2024-07-30 08:32:35");
INSERT INTO oauth_access_tokens VALUES("2719441ceb9b3044a4632f4806bb250d50660a7f2603961582f655d3c88aec60a421576d30fc48ac","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-01 09:38:26","2023-10-01 09:38:26","2024-10-01 09:38:26");
INSERT INTO oauth_access_tokens VALUES("2b6bef6c1cf7c5e459187dc99c54a71b850db4de67e8a1d5fd03b9095db8b253984536dd403a8637","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-05 09:51:19","2023-10-05 09:51:19","2024-10-05 09:51:19");
INSERT INTO oauth_access_tokens VALUES("2e2939eb1502fe462bb6e08cb4bcfb69bfa999fd3f48a1dd29b18487abe13aee9dccfab9318ce2c6","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-17 10:04:38","2023-08-17 10:04:38","2024-08-17 10:04:38");
INSERT INTO oauth_access_tokens VALUES("3123da8a1334730b023825f8e431011c3d4b3b00bc4725faeb37f4ff320db477495d254d8581d798","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-08 09:44:05","2023-11-08 09:44:05","2024-11-08 09:44:05");
INSERT INTO oauth_access_tokens VALUES("32f7639486d7acdf6e06973136965f125d61ec554913da139dbfd16e1a9fb9889ada3e0c006ecb13","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-06 03:57:28","2023-07-06 03:57:28","2024-07-06 03:57:28");
INSERT INTO oauth_access_tokens VALUES("33d322261063fc1125cd921b814cd4a33ba390ddb583efa6a312d55c4854546b2f15281e696e1208","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-26 04:21:56","2023-07-26 04:21:56","2024-07-26 04:21:56");
INSERT INTO oauth_access_tokens VALUES("39cf6708060c521780f9cb5db955a72e41c73701c1ae19caebc4e78757248e8b365dfaa4ae6bdfb1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-08 09:39:56","2023-10-08 09:39:56","2024-10-08 09:39:56");
INSERT INTO oauth_access_tokens VALUES("3d29479512bf3c2faefb9e96b6e7615f5820deea09007b3d7b5e76bc4921bbbe83c478109fe118de","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-30 04:08:55","2023-07-30 04:08:55","2024-07-30 04:08:55");
INSERT INTO oauth_access_tokens VALUES("4016ab552d5c6f3261db23de5d84e8fd0a2c2fc8ae223fd7c293c24e5cb986918a0cfaf520fa04fe","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-16 10:03:01","2023-08-16 10:03:01","2024-08-16 10:03:01");
INSERT INTO oauth_access_tokens VALUES("466a985b963f6fa4149d5fc41207cced8fe4385350434fc15a1c0c2370268a040fab648883df7799","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-31 04:08:27","2023-07-31 04:08:27","2024-07-31 04:08:27");
INSERT INTO oauth_access_tokens VALUES("47b2ea10bc7eec9ef29174ec220d5f1f3adda3a3a6823399d654de2ea0121242a9430179e381f889","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-24 09:59:29","2023-09-24 09:59:29","2024-09-24 09:59:29");
INSERT INTO oauth_access_tokens VALUES("4935f2fcf2a66fffcf2b5ea607192cd7998d4d3eaa316b702fc750d8877cfd866cc106c175c335b5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-31 09:26:38","2023-10-31 09:26:38","2024-10-31 09:26:38");
INSERT INTO oauth_access_tokens VALUES("4f3b3c794aacd7646e5f1b43dce37cc87657f12e95f30cd6dd8c76c98717d8977b444bdc2ecd735f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-14 05:01:55","2023-05-14 05:01:55","2024-05-14 05:01:55");
INSERT INTO oauth_access_tokens VALUES("4f606509335abfb0b9d35bb6400b8d7585e34febbf4a593c4d5f4328fa8ad4b5935912ebf6b828d5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-20 10:13:07","2023-08-20 10:13:07","2024-08-20 10:13:07");
INSERT INTO oauth_access_tokens VALUES("502b7aa571d807e7412d40c281002bc38aa95f864c6523d723b0fb926fc525bb9545f3e218388258","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-18 09:40:08","2023-10-18 09:40:08","2024-10-18 09:40:08");
INSERT INTO oauth_access_tokens VALUES("53edc59593b8a7841d03810a9ea3df3e0330b42b15e7a10effb2c32c14ed6943a08be76e45c59f3f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-17 04:26:45","2023-07-17 04:26:45","2024-07-17 04:26:45");
INSERT INTO oauth_access_tokens VALUES("543eab7926a569fa77420e71d81b8e10ae2d27cf5605814376abf83285372ba894b06c4b9ef0bdc0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-08 04:07:28","2023-08-08 04:07:28","2024-08-08 04:07:28");
INSERT INTO oauth_access_tokens VALUES("54b41c6e203603b1cadd83f90e64a2795ef36c51833c84a4fbba05327db45cec589bd96480bf5de3","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-18 10:00:55","2023-09-18 10:00:55","2024-09-18 10:00:55");
INSERT INTO oauth_access_tokens VALUES("54d96fe30d51a198bcd8158634051a8915c7e904aee9d2be8f9dd7fb853f08930733536a89770ea0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-08 15:43:52","2023-11-08 15:43:52","2024-11-08 15:43:52");
INSERT INTO oauth_access_tokens VALUES("57295cf1bbdd0dfa727a24c1d39b8fcb5ee56b37d5fd291e67d2e76134b1ee0d77629df0ad7d5be6","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-13 10:31:17","2023-09-13 10:31:17","2024-09-13 10:31:17");
INSERT INTO oauth_access_tokens VALUES("608dafa480f1e0dd53f0344bb53c0d92d147a3a7458a892d680c4369b9e06590ae94bc6fe6bbc70b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-09 04:16:47","2023-08-09 04:16:47","2024-08-09 04:16:47");
INSERT INTO oauth_access_tokens VALUES("613d32b4c9f5b54e253d69d387a363f66f953bd14d0e8e8bc978a038eb7ca70a0c4535ebc3fa7e47","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-11 06:15:25","2023-05-11 06:15:25","2024-05-11 06:15:25");
INSERT INTO oauth_access_tokens VALUES("624bbcd6149b6ed1cebac57c892d1cc13192d4f24cf59296d75a4e7c1f3eec39daceaf848109809f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-25 12:43:39","2023-07-25 12:43:39","2024-07-24 23:43:39");
INSERT INTO oauth_access_tokens VALUES("649d97ec88071698ae9475e344151886b872fb23a790f330df84e331a3c4b6463d2a33bcaa07b271","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-13 10:10:23","2023-08-13 10:10:23","2024-08-13 10:10:23");
INSERT INTO oauth_access_tokens VALUES("64dfd96682c5454c31eeb062e2c120ec73e2c945d9bfb0f67a2af42881dd71a5b7d48aed1a2f1977","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-20 04:16:41","2023-06-20 04:16:41","2024-06-20 04:16:41");
INSERT INTO oauth_access_tokens VALUES("65b9526d928d30e1cd5d22b2fe22dea3513b31b58c2906fe649b1bf11724b1ea14afe872f230f575","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-13 04:59:55","2023-07-13 04:59:55","2024-07-13 04:59:55");
INSERT INTO oauth_access_tokens VALUES("6ada533a3ab807221f59df57e2e98afb6ce99a3ca9a189246d41a858b41f9379c3e4279c96bbb739","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-15 09:43:50","2023-10-15 09:43:50","2024-10-15 09:43:50");
INSERT INTO oauth_access_tokens VALUES("6b308cbaa30e86c3f0a2adb034d6250b1db0106102b69059a463a3fbf245933a6cb5c09735a737d1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-29 12:57:21","2023-10-29 12:57:21","2024-10-29 12:57:21");
INSERT INTO oauth_access_tokens VALUES("6cbf59acbfd50c6b37c803270679e18726641e86bfb20e488bce1b190ed77953d7dd6f5d7aa7cafb","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-14 10:22:09","2023-08-14 10:22:09","2024-08-14 10:22:09");
INSERT INTO oauth_access_tokens VALUES("6f499b94a43c89b8a554fe8803187ae6660f08158de9fd357a96785bd187ff7a2d41a0b35cd92ad7","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-12-24 10:59:28","2023-12-24 10:59:28","2024-12-24 10:59:28");
INSERT INTO oauth_access_tokens VALUES("6f80f6891e8a71910f54fdb97c790e5f854c79dc230da3103238a35fc4f9f47caf9cd6f164f79f49","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-11 10:38:12","2023-09-11 10:38:12","2024-09-11 10:38:12");
INSERT INTO oauth_access_tokens VALUES("75571cc31701a81cc735c5fcc7a9b84df3a67392f54c6ed94de7d8d3910bea72e2462009c5f86c67","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-23 09:51:02","2023-08-23 09:51:02","2024-08-23 09:51:02");
INSERT INTO oauth_access_tokens VALUES("78ad9d7d025ce726a6d0d76d9c1eb6bfb1e8518de8675244e9223396c84a619c38835cb3445a6cb5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-01 09:41:20","2023-11-01 09:41:20","2024-11-01 09:41:20");
INSERT INTO oauth_access_tokens VALUES("79156e0ce3382c1eaef29e422bddbda8b94a6e2660e122e2de90156833189f03b91ef0a38110fd26","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-03 10:08:49","2023-09-03 10:08:49","2024-09-03 10:08:49");
INSERT INTO oauth_access_tokens VALUES("7cc2faed087915d4923b13ef4a9c73230cd878cb6a1070b92b0d5c4e3ea2a4ac0e62455b3e82206a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-24 12:32:56","2023-08-24 12:32:56","2024-08-24 12:32:56");
INSERT INTO oauth_access_tokens VALUES("7ecda71e725f4b1743af695704ab3742dfdea39c4df85a353f0ff5a7b1addc08e305339c8578caf2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-21 04:23:58","2023-06-21 04:23:58","2024-06-21 04:23:58");
INSERT INTO oauth_access_tokens VALUES("7f05a3679667e3da26939adbea42b521afa5fac78be4616c13319d3afe27996514b4e3ff08184590","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-02 14:15:33","2023-11-02 14:15:33","2024-11-02 14:15:33");
INSERT INTO oauth_access_tokens VALUES("7fe3f74f411dc0fb4e0e830a03855b3d6cbbae3b7ee753e322b606b7289c53d25cf843fa14476aad","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-05 14:18:08","2023-11-05 14:18:08","2024-11-05 14:18:08");
INSERT INTO oauth_access_tokens VALUES("81183cc3ca452fd5fd766ebf98d6e02c38c28e8bcb106ffbb5f04a5da78bba5a8941944db7e9f2a1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-25 12:18:49","2023-07-25 12:18:49","2024-07-24 23:18:49");
INSERT INTO oauth_access_tokens VALUES("8263299e9bfafbe707cf02a33057ad15438d24f8978ee961d26f7785418b6c7dd21a7622fb07370f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-09 04:13:49","2023-07-09 04:13:49","2024-07-09 04:13:49");
INSERT INTO oauth_access_tokens VALUES("8267847975b6e6d87e41e21857ae7f0997e7dfa163fdb0e18c7ed40f389e2cb21d04c9b77f0a1a95","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-14 10:23:22","2023-09-14 10:23:22","2024-09-14 10:23:22");
INSERT INTO oauth_access_tokens VALUES("851aba8bd96181bc2e5fbe69c1e0af7b3fddc7627a2d59d48cb0adbe4220611d90c9504d9917f0b7","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-03 10:31:15","2023-08-03 10:31:15","2024-08-03 10:31:15");
INSERT INTO oauth_access_tokens VALUES("86275149a93822c71d39f4d8044716b68c411c59dbb2ca3600f10466074d951d1e65011bcf34234a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-23 09:20:52","2023-10-23 09:20:52","2024-10-23 09:20:52");
INSERT INTO oauth_access_tokens VALUES("8b68c9e009c94fedfd4735d97a49db6a92ab29e07e80cedc6e0a910cb027f30ada71ad077bd98903","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-04 09:35:48","2023-10-04 09:35:48","2024-10-04 09:35:48");
INSERT INTO oauth_access_tokens VALUES("8b77067adac1687f3ab1452ae2f2f78bd1665d33f769f115516f54d309fdf0ce0563248cc73dfafe","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-10 04:03:20","2023-07-10 04:03:20","2024-07-10 04:03:20");
INSERT INTO oauth_access_tokens VALUES("8d01819c714dfe8559125040ad6075d2f3a790be5daa7be45b178c92e97172176fdeeb769f86cd11","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-14 16:09:02","2023-09-14 16:09:02","2024-09-14 16:09:02");
INSERT INTO oauth_access_tokens VALUES("8faaedeaf778f113010f225e240ceb1aded88c62224b25b76c34fc5fd3c17c9dfde216e470cb5ef8","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-16 04:15:39","2023-07-16 04:15:39","2024-07-16 04:15:39");
INSERT INTO oauth_access_tokens VALUES("911701a713244cf5463f6c6f50f33d228efae57aa074a1ca269c6a46004ceec221bd62692d58e430","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-12 08:39:40","2023-07-12 08:39:40","2024-07-12 08:39:40");
INSERT INTO oauth_access_tokens VALUES("913db499406c47bd7bd5bd81cd248dc136c0d5ee41b2ca8e247190383545c9acfb3321aa9fc25599","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-09 10:08:31","2023-10-09 10:08:31","2024-10-09 10:08:31");
INSERT INTO oauth_access_tokens VALUES("919657a3040559a0edd781be2e22d90c7577cc45770b4a7028d39fe4c12f952ed53d5a598d04ffad","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-12-24 14:32:55","2023-12-24 14:32:55","2024-12-24 14:32:55");
INSERT INTO oauth_access_tokens VALUES("93161029e257b4ef36f5079ff4dd803d1720c563a9a15ff7bd13045417a5acbcc8985ba10ffc4c07","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-05 09:40:03","2023-11-05 09:40:03","2024-11-05 09:40:03");
INSERT INTO oauth_access_tokens VALUES("942a20b684fe73162f6e27d3be06936b21f33841e94eaa2e8baac1b909aff5842d739a48b4aea0a7","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-23 04:17:21","2023-07-23 04:17:21","2024-07-23 04:17:21");
INSERT INTO oauth_access_tokens VALUES("979f0c883120fa961658969511d28b18e05792c8ce9cccc1a2c7b604c67e924bef2a0784b7733427","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-02 04:46:01","2023-08-02 04:46:01","2024-08-02 04:46:01");
INSERT INTO oauth_access_tokens VALUES("9869ddccdfa4c9f024c8620e6372fbe3b166e8b583afebf198501837a9d97789211b214191398f8d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-12 09:56:22","2023-09-12 09:56:22","2024-09-12 09:56:22");
INSERT INTO oauth_access_tokens VALUES("9b4fb0a528bbcf2a099a9c77707f9a4c2ea6a404f2eb7b7f9f9d25523cc18f2e855a0b7f8fd44011","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-18 05:41:46","2023-07-18 05:41:46","2024-07-18 05:41:46");
INSERT INTO oauth_access_tokens VALUES("9c4ccb0472855246ffc021d9db09823192a1a31c9e0620dafd64235e5dfed362b2d994788cd448ad","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-19 04:29:07","2023-06-19 04:29:07","2024-06-19 04:29:07");
INSERT INTO oauth_access_tokens VALUES("a0b6e27ee1eb90ee325e0df101a0273f3eddb6257c51d9bee6f412525525b427f06893e757364de0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-16 03:58:58","2023-05-16 03:58:58","2024-05-16 03:58:58");
INSERT INTO oauth_access_tokens VALUES("a419b726fbcd096c0ff50b59f867fcb7001722fb2d55bbb8cbb63425dbd15c36e2a92aa07cb9632d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-22 04:23:07","2023-06-22 04:23:07","2024-06-22 04:23:07");
INSERT INTO oauth_access_tokens VALUES("a6cc1e34588985ce2450a27e27be74de35b8189d65e601f12c033e7fbd1a4d9ef0e8e63feb744a14","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-28 10:12:07","2023-08-28 10:12:07","2024-08-28 10:12:07");
INSERT INTO oauth_access_tokens VALUES("a7ef0d359c2614626db66bf9386bc00c23a294b4ea5abcf2958dfce7d15feacaf2b1ac0269ccae4f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-31 09:59:08","2023-08-31 09:59:08","2024-08-31 09:59:08");
INSERT INTO oauth_access_tokens VALUES("a9bdc3ad7642ca411256c21a6ecdcec81fa9de7de3f8c854f9b475823dda41d1404955816562cd40","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-11 09:36:56","2023-10-11 09:36:56","2024-10-11 09:36:56");
INSERT INTO oauth_access_tokens VALUES("aa7d802f79c98716f1bb78dbf75a2cdc9ac7f29f462e4e933bfda89acf7acbf8647e363ee1f1603a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-11 06:30:26","2023-05-11 06:30:26","2024-05-11 06:30:26");
INSERT INTO oauth_access_tokens VALUES("aba523c584e154bf0213f66e6bd19400c0ee123fd865f1bb461f3b88ba1c0e769fdf08b3a872325d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-29 09:56:22","2023-08-29 09:56:22","2024-08-29 09:56:22");
INSERT INTO oauth_access_tokens VALUES("abec709337757c0847d7af498ee30d6c3428982b51fe8569600b27b328ce6e91e3284b1945aea30c","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-30 09:49:34","2023-10-30 09:49:34","2024-10-30 09:49:34");
INSERT INTO oauth_access_tokens VALUES("ad5fc96b2024ff5365db04b858b965de98d446036596e9cf444283c0ec741a3edd577fc9fc08e45a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-21 10:11:48","2023-09-21 10:11:48","2024-09-21 10:11:48");
INSERT INTO oauth_access_tokens VALUES("ae3d44a91cfa9cab206ba2d3b70dfeda4a8b93878ada9a3aebd9ebfe48cd436fabd93ae85c737ea2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-06 10:20:31","2023-11-06 10:20:31","2024-11-06 10:20:31");
INSERT INTO oauth_access_tokens VALUES("b35a15390c20d4d46114b0606c788e4b99989fefe75d61f6e1afc133d4ee22d709f7e4bba9781a48","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-03 04:08:31","2023-07-03 04:08:31","2024-07-03 04:08:31");
INSERT INTO oauth_access_tokens VALUES("b364aaba03ce87b4cae7b66021ab4f33bc5fd793793b7d57ffb0f000e05f7f78bda3df1452040252","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-26 04:17:22","2023-06-26 04:17:22","2024-06-26 04:17:22");
INSERT INTO oauth_access_tokens VALUES("b9ea161aac6a836885be3746ab69dfeeb65a51cbe41b029dec1c10598784760ef23e3f43f22f98d4","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-30 10:05:26","2023-08-30 10:05:26","2024-08-30 10:05:26");
INSERT INTO oauth_access_tokens VALUES("bfb95434ce9ac118f3da9bcfa2ad2dc4a644fe1f5bd20da0c10f25bdf78c926524d30892669fef3b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-20 10:02:07","2023-09-20 10:02:07","2024-09-20 10:02:07");
INSERT INTO oauth_access_tokens VALUES("c15a819d9d4db862eae65794769b00e957b9117a6c236a353bbc3b3eaf570c367f639774dd537a59","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-12 04:20:33","2023-07-12 04:20:33","2024-07-12 04:20:33");
INSERT INTO oauth_access_tokens VALUES("c1cb6bfb3abcb05d40d3ebb18617d125610c53dd960fa0d22fed49467ea9a62e4f21aa73027c4232","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-05 14:47:10","2023-11-05 14:47:10","2024-11-05 14:47:10");
INSERT INTO oauth_access_tokens VALUES("c2230c49f28fe254f47ee68614067e7d5553b3eac23854863139e73b4f81027eb2f0b1b796aa46cc","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-18 05:46:40","2023-06-18 05:46:40","2024-06-18 05:46:40");
INSERT INTO oauth_access_tokens VALUES("c228b051e9016f6e6b35e85ea4edc0aad4b32c02cba536fa58b2a520c7cee06ec8d53f1eb02f5727","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-13 04:19:48","2023-07-13 04:19:48","2024-07-13 04:19:48");
INSERT INTO oauth_access_tokens VALUES("c28c52f4728668f7a5da011b39cce9814a130cb591bd208f3f923e1b89ddb97bf0c749348bf51936","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-16 09:36:52","2023-10-16 09:36:52","2024-10-16 09:36:52");
INSERT INTO oauth_access_tokens VALUES("c31748dbe82d184e61133be4718c2cdee6534993fc4bce3455353894339014a57a1b562df73b9eee","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-27 04:00:26","2023-07-27 04:00:26","2024-07-27 04:00:26");
INSERT INTO oauth_access_tokens VALUES("c56e4413e0f9e05f17d81eeaf3408f76eb9deb1c4b5d7d93e312cb11d7fb7f0a777ac5c798a6388b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-27 09:58:25","2023-09-27 09:58:25","2024-09-27 09:58:25");
INSERT INTO oauth_access_tokens VALUES("c7048127910757d5f02934edb763bac934f2a9ca8305b49ceac989704c376840f5eeffd3d122679e","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-11 06:36:29","2023-05-11 06:36:29","2024-05-11 06:36:29");
INSERT INTO oauth_access_tokens VALUES("c93868e15f841a56a8d6c6826c8b8023b2dec805d52e5af6f7d0f72a98d6be6f7bf881dabb7e383d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-17 07:14:14","2023-05-17 07:14:14","2024-05-17 07:14:14");
INSERT INTO oauth_access_tokens VALUES("cc193f02fa98a2ef77bf12e57286c7f97c482b992a07750a5badb7747f783b179cdd5bf4bff021a2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-15 04:08:52","2023-05-15 04:08:52","2024-05-15 04:08:52");
INSERT INTO oauth_access_tokens VALUES("cc2df446fa1a170f912b93bec7c6343b286298ab94944b5103e2afabd153ecc44500a8d2beb7ad3f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-26 07:04:03","2023-07-26 07:04:03","2024-07-25 18:04:03");
INSERT INTO oauth_access_tokens VALUES("d2e724bd3c7fe6c31065e687734fa0aadd1c5cbc06a48e6a034d88ece911821c17ec4bee85d75d4d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-10 10:19:17","2023-09-10 10:19:17","2024-09-10 10:19:17");
INSERT INTO oauth_access_tokens VALUES("d4ea416ce5bc1e12968348a7d1ab49327fc1774d83144a7ab0c31a2ba318936a2697579087cc3472","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-07 14:37:24","2023-11-07 14:37:24","2024-11-07 14:37:24");
INSERT INTO oauth_access_tokens VALUES("d6afabbad7e57512a30efe34e4040919cd1532deb3ca76e037ba58a814dbb206e6127dca3e9d0107","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-02 09:44:39","2023-10-02 09:44:39","2024-10-02 09:44:39");
INSERT INTO oauth_access_tokens VALUES("d6f82c6429c79aefa4295ea8f4d45554c2de0662bf25b8f0b5fc3b37b443db96b93a1803c1c1ae4f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-07 10:24:56","2023-09-07 10:24:56","2024-09-07 10:24:56");
INSERT INTO oauth_access_tokens VALUES("d98441766ce45d3bdcf4be7e905e060e98650251f803806f4e68af1b8440ad506a22b2de7b9edb37","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-03 09:31:08","2023-10-03 09:31:08","2024-10-03 09:31:08");
INSERT INTO oauth_access_tokens VALUES("d9bb4ebe133fb1cfe81f9d42c646ace89447c2081d1f876070945d6d9954bb63a5f7a37350d75888","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-09 09:34:25","2023-11-09 09:34:25","2024-11-09 09:34:25");
INSERT INTO oauth_access_tokens VALUES("da92cc2e6d27e1dabfde519f1f5d8119a5abf266dfdf1a2e595d23cd76fe1185c502f90d13cd46a2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-22 09:31:45","2023-10-22 09:31:45","2024-10-22 09:31:45");
INSERT INTO oauth_access_tokens VALUES("dee69f56ae9849aacb99fcad1f2bda7ca7ea063aba04ea251cf3a0a85157582ace0095aa025ddf4f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-11 04:12:43","2023-07-11 04:12:43","2024-07-11 04:12:43");
INSERT INTO oauth_access_tokens VALUES("e026da801225ee44a021a69261b7b415bc0c3e307d90f0e8cb89bc7f2577a254aa58d8e254d1f111","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-07 04:05:15","2023-08-07 04:05:15","2024-08-07 04:05:15");
INSERT INTO oauth_access_tokens VALUES("e35b35c1defb0f7c6dda46add7f3d1c218e7bf7691a59c42f5f21ea51cd5f2f1b5edaedad585b612","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-10 09:38:08","2023-10-10 09:38:08","2024-10-10 09:38:08");
INSERT INTO oauth_access_tokens VALUES("e46f8119d237fce2fcd5b312a63f46e9d972a1bd4a940fdfac62c1e4f94840d84a1515e27b33dff1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-25 10:00:07","2023-09-25 10:00:07","2024-09-25 10:00:07");
INSERT INTO oauth_access_tokens VALUES("e7017f18b32aabcb0d6b1c1332acc450390c85d3cde61d1a5bc5a3522a05352f7f3f01c3463f470d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-03 04:11:25","2023-08-03 04:11:25","2024-08-03 04:11:25");
INSERT INTO oauth_access_tokens VALUES("e74b55e655559e88a3aa38803c8388d6d1163ab6acceac60d97c8b47a2bcedde396e49184c6ddc82","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-01 04:27:31","2023-08-01 04:27:31","2024-08-01 04:27:31");
INSERT INTO oauth_access_tokens VALUES("e83bedca5a18fb157aa8623d84ce46ba3349830b43f249ec996a86d2d6037486e0ac130d8a23e3e2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-22 10:29:37","2024-01-22 10:29:37","2025-01-22 10:29:37");
INSERT INTO oauth_access_tokens VALUES("e8829d6924773c9cf643e8398460a478dc3a0dc8572b9d787f64e88ecb0114082977741eba01e569","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-14 06:08:23","2023-05-14 06:08:23","2024-05-14 06:08:23");
INSERT INTO oauth_access_tokens VALUES("e9539971042b1676c79a46ea566a0c00852c909957bc0d1cd50eddd52d8340509942289251657c73","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-25 04:11:43","2023-06-25 04:11:43","2024-06-25 04:11:43");
INSERT INTO oauth_access_tokens VALUES("ece6ce0fe35d778d86a3a1ff1821096783a125df2428fe1d23a03b051beef22517e42444cf852ec2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-17 10:08:06","2023-09-17 10:08:06","2024-09-17 10:08:06");
INSERT INTO oauth_access_tokens VALUES("eea5b82b9f5816a76366c9b40bdc95311b0c6628e5591170624f9b0b2087e096c9d89e3a0ab916ab","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-04 10:19:28","2023-09-04 10:19:28","2024-09-04 10:19:28");
INSERT INTO oauth_access_tokens VALUES("f0ec6a0213917dcd7f847b662cbc273e367d613689b4946fc8df2bdf33270c7398f17b3a20a2afda","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-05 10:08:35","2023-09-05 10:08:35","2024-09-05 10:08:35");
INSERT INTO oauth_access_tokens VALUES("f3d90947f9bbfdbd56bcbdab082fb63174e1f526bc7e7587e283470a8269cc80c4902808a57e5f08","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-12-26 09:57:05","2023-12-26 09:57:05","2024-12-26 09:57:05");
INSERT INTO oauth_access_tokens VALUES("f7238aad3b4f4645922fa2a500f59a7899d1d826266892fceb74d7e8c438860fd8893fabe0627008","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-19 04:23:57","2023-07-19 04:23:57","2024-07-19 04:23:57");
INSERT INTO oauth_access_tokens VALUES("f7b9d966ac97c5ce0a1349b2042382a01d07e65773178a6e07ff9efa938f6613b0e63cb46b9a882f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-18 04:27:46","2023-05-18 04:27:46","2024-05-18 04:27:46");



CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_clients VALUES("9923b022-0553-42b7-a9e4-97e4a1fd5888","","Laravel Personal Access Client","joYFnK5X2HQAZQzopEASdz8rK0ilfRslOkwpLBl8","","http://localhost","1","0","0","2023-05-11 06:12:59","2023-05-11 06:12:59");
INSERT INTO oauth_clients VALUES("9923b022-5963-437b-ab75-e77c52b86340","","Laravel Password Grant Client","w4wMrHETtmJDfa1ntQQ1Nez6tdKME4oW2o3WHe9e","users","http://localhost","0","1","0","2023-05-11 06:12:59","2023-05-11 06:12:59");



CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO oauth_personal_access_clients VALUES("1","9923b022-0553-42b7-a9e4-97e4a1fd5888","2023-05-11 06:12:59","2023-05-11 06:12:59");



CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `user_id` int(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_en_unique` (`slug_en`),
  UNIQUE KEY `pages_slug_bn_unique` (`slug_bn`),
  UNIQUE KEY `pages_link_unique` (`link`),
  KEY `pages_user_id_foreign` (`user_id`),
  CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_cheques` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_credit_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payment_with_gift_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","","3","","1","1","Cash","ppr-20231224-124301","","2706","0","","2023-12-24 12:43:01","2023-12-24 12:43:01");
INSERT INTO payments VALUES("2","","2","","1","1","Cash","ppr-20231224-124308","","2706","0","","2023-12-24 12:43:08","2023-12-24 12:43:08");
INSERT INTO payments VALUES("3","","1","","1","1","Cash","ppr-20231224-124315","","1353","0","","2023-12-24 12:43:15","2023-12-24 12:43:15");
INSERT INTO payments VALUES("4","1","","1","1","1","Cash","spr-20231224-023634","","349.57","0","","2023-12-24 14:36:34","2023-12-24 14:36:34");
INSERT INTO payments VALUES("5","2","","1","1","1","Cash","spr-20240122-103157","","317.79","0","","2024-01-22 10:31:57","2024-01-22 10:31:57");



CREATE TABLE `payrolls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payrolls VALUES("1","payroll-20231224-121508","2","1","1","250","0","","2023-12-24 12:15:08","2023-12-24 12:15:08");



CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("1","menu-users","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("2","menu-roles","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("3","menu-permissions","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("4","role-list","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("5","role-create","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("6","role-edit","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("7","role-delete","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("8","user-list","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("9","user-create","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("10","user-edit","","2023-05-11 06:15:00","2023-05-11 06:15:00");
INSERT INTO permissions VALUES("11","user-delete","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("12","user-status","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("13","permission-list","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("14","permission-create","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("15","permission-edit","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("16","permission-delete","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("17","menu-black","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("18","menu-white","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("19","menu-media","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("20","menu-category","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("21","menu-post","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("22","menu-page","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("23","menu-comments","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("24","menu-menus","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("25","menu-csv","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("26","menu-slider","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("27","menu-language","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("28","menu-databasebackup","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("29","menu-loginhistory","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("30","sider-status","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("31","category-status","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("32","category-deleted","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("33","category-edit","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("34","category-create","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("35","category-privatecat","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("36"," post-show","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("37","post-status","","2023-05-11 06:15:01","2023-05-11 06:15:01");
INSERT INTO permissions VALUES("38","post-slider","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("39","post-archive","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("40","post-delete","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("41","post-edit","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("42","post-create","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("43","post-search","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("44","post-multipledelete","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("45","post-privateshow","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("46","page-archive","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("47","page-status","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("48","page-multipledelete","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("49","page-search","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("50","page-deleted","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("51","page-edit","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("52","page-create","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("53","page-privatepage","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("54","language-create","","2023-05-11 06:15:02","2023-05-11 06:15:02");
INSERT INTO permissions VALUES("55","language-edit","","2023-05-11 06:15:02","2023-05-11 06:15:02");



CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `pos_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `stripe_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_option` int(15) DEFAULT NULL,
  `keybord_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_settings VALUES("1","1","2","1","59","pk_test_ginW3sQe0P9TU1RkhUtSYoxX00vm6cWDMt","sk_test_R17wtLy5yfYEIUn0hodhrNZf00QDeUGPfD",""cash,cheque,gift_card"","","0","2023-09-07 15:18:15","2023-11-06 11:47:25");



CREATE TABLE `postmetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postmetas_cat_id_foreign` (`cat_id`),
  CONSTRAINT `postmetas_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_en_unique` (`slug_en`),
  UNIQUE KEY `posts_slug_bn_unique` (`slug_bn`),
  UNIQUE KEY `posts_link_unique` (`link`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO posts VALUES("1","Post","post","post","","","","","Post","post","post","","","","","","","","","","1","0","1","","","0","0","","","2023-05-11 08:45:58","2023-05-11 08:45:58");



CREATE TABLE `product_adjustments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_batches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("1","1","1","","","","10","10","1","123","0","10","123","1353","2023-12-24 12:32:22","2023-12-24 12:32:22");
INSERT INTO product_purchases VALUES("2","2","2","1","","","10","10","1","246","0","10","246","2706","2023-12-24 12:42:11","2023-12-24 12:42:11");
INSERT INTO product_purchases VALUES("3","3","2","2","","","10","10","1","246","0","10","246","2706","2023-12-24 12:42:46","2023-12-24 12:42:46");



CREATE TABLE `product_quotations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","","1","","","1","1","317.79","0","10","31.78","349.57","2023-12-24 13:11:17","2023-12-24 13:11:17");
INSERT INTO product_sales VALUES("2","2","","1","","","1","1","288.9","0","10","28.89","317.79","2024-01-22 10:30:20","2024-01-22 10:30:20");
INSERT INTO product_sales VALUES("3","3","","2","","1","1","1","635.58","0","10","63.56","699.14","2024-01-22 10:32:54","2024-01-22 10:32:54");



CREATE TABLE `product_transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `product_variants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_cost` double DEFAULT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `stock` int(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("1","2","1","1","s-51449085","123","321","21","","2023-12-24 12:31:34","2024-01-22 10:32:54");
INSERT INTO product_variants VALUES("2","2","2","2","m-51449085","123","321","22","","2023-12-24 12:31:34","2023-12-24 12:42:46");



CREATE TABLE `product_warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `variant_id` int(15) DEFAULT NULL,
  `product_batch_id` int(15) DEFAULT NULL,
  `imei_number` int(15) DEFAULT NULL,
  `qty` double NOT NULL,
  `stock` int(15) DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouses VALUES("1","1","2","","","","8","","","2023-12-24 12:32:22","2024-01-22 10:30:20");
INSERT INTO product_warehouses VALUES("2","2","2","1","","","9","","","2023-12-24 12:42:11","2024-01-22 10:32:54");
INSERT INTO product_warehouses VALUES("3","2","2","2","","","10","","","2023-12-24 12:42:46","2023-12-24 12:42:46");



CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  UNIQUE KEY `products_product_code_unique` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","standard","solid product","solid_product","22380793","321","123","","","","","","1","2","","2023-12-24 12:29","20","","","","","","","","1","","","1","","1","","","1","1","","1","1","1","1","1","","","","2","1","","2023-12-24 12:30:14","2024-01-22 10:30:20");
INSERT INTO products VALUES("2","standard","varient product","varient_product","51449085","321","123","","","","","","1","2","","2023-12-24 12:30","31","","1","111","2023-12-24","2023-12-31","","","1","["size"]","["s,m"]","1","","1","","","2","2","","1","1","1","1","1","1","","","2","1","","2023-12-24 12:31:34","2024-01-22 10:32:54");



CREATE TABLE `promotions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promotion_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotion_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish_at` date DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchase_product_returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20231224-123222","2","1","1","10","0","123","1353","0","0","","","1353","","1353","1","2","","","","","2023-12-24 12:32:22","2023-12-24 12:43:15");
INSERT INTO purchases VALUES("2","pr-20231224-124211","2","1","1","10","0","246","2706","0","0","","","2706","","2706","1","2","","","","","2023-12-24 12:42:11","2023-12-24 12:43:08");
INSERT INTO purchases VALUES("3","pr-20231224-124246","2","1","1","10","0","246","2706","0","0","","","2706","","2706","1","2","","","","","2023-12-24 12:42:46","2023-12-24 12:43:01");



CREATE TABLE `quotations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `return_purchases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `returns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `reward_point_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO reward_point_settings VALUES("1","100","200","1","Year","1","2023-09-07 14:55:40","2023-10-04 12:12:31");



CREATE TABLE `role_has_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `permission_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  KEY `role_has_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO role_has_permissions VALUES("1","1","1","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("2","1","2","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("3","1","3","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("4","1","4","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("5","1","5","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("6","1","6","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("10","1","13","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("11","1","16","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("12","1","17","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("13","1","18","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("14","1","19","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("15","1","20","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("16","1","21","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("17","1","22","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("18","1","23","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("19","1","24","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("20","1","25","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("21","1","26","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("22","1","27","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("23","1","28","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("24","1","29","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("25","1","31","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("26","1","32","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("27","1","33","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("28","1","34","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("29","1","35","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("30","1","37","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("31","1","38","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("32","1","39","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("33","1","40","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("34","1","41","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("35","1","42","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("36","1","43","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("37","1","44","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("38","1","45","","2023-05-11 09:10:17");
INSERT INTO role_has_permissions VALUES("39","1","8","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("40","1","9","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("41","1","10","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("42","1","11","","2023-05-11 09:10:16");
INSERT INTO role_has_permissions VALUES("43","1","12","","2023-05-11 09:10:16");



CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","superAdmin","superAdmin","web","1","","");
INSERT INTO roles VALUES("2","admin","admin","web","1","","");
INSERT INTO roles VALUES("3","employe","employe","web","1","","");



CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","sr-20231224-011116","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","4","","349.57","","","2023-12-24 13:11:16","2023-12-24 14:36:34");
INSERT INTO sales VALUES("2","sr-20240122-103019","3","2","1","","","1","","1","1","1","0","28.89","317.79","317.79","0","0","0","Flat","","","1","4","","317.79","","","2024-01-22 10:30:19","2024-01-22 10:31:57");
INSERT INTO sales VALUES("3","sr-20240122-103253","2","2","1","","","1","","1","1","1","0","63.56","699.14","699.14","0","0","0","Flat","","","1","1","","","","","2024-01-22 10:32:53","2024-01-22 10:32:53");



CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sessions VALUES("2XvOHNfjI0Sv8tMsjdDlcsiDT0wegsZV3VY3cgem","1","127.0.0.1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","YTo4OntzOjY6Il90b2tlbiI7czo0MDoiUm5Cd0h4YWJXeXdBSU0xaVA0clhYTHoyaVJKdTNySXdFYmFab05KdiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjY1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3VwZXJBZG1pbi9nYW5lcmFsc2V0dGluZy5zdXBlcmFkbWluc2V0dGluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTg6ImZsYXNoZXI6OmVudmVsb3BlcyI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjEyOiJ1c2VyX3Nlc3Npb24iO3M6MjA6InN1cGVyQWRtaW5AZ21haWwuY29tIjtzOjEyOiJwYXNzX3Nlc3Npb24iO3M6OToiMTIzNDU2Nzg5Ijt9","1705907082");



CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagecaption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `stock_counts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES("1","Aduri","","house","234","therashedul@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","1216","Bangladesh","1","2023-12-24 12:12:22","2023-12-24 12:12:22");



CREATE TABLE `taxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxes VALUES("1","tax10","10","1","2023-12-24 12:11:22","2023-12-24 12:11:22");



CREATE TABLE `transfers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO units VALUES("1","piece","piece","piece","/","1","1","2023-12-24 12:11:43","2023-12-24 12:11:47");
INSERT INTO units VALUES("2","gaj","gaj","gaj","/","36","1","2023-12-24 12:47:49","2023-12-24 12:47:56");



CREATE TABLE `user_verifies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","superAdmin","superadmin@gmail.com","","1","","$2y$10$sIaS00DJD//DrEbrMZLuuuvNVBcU8hONrotV2sKaWA/BJvn.xpw5G","","","eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTIzYjAyMi0wNTUzLTQyYjctYTllNC05N2U0YTFmZDU4ODgiLCJqdGkiOiJlODNiZWRjYTVhMThmYjE1N2FhODYyM2Q4NGNlNDZiYTMzNDk4MzBiNDNmMjQ5ZWM5OTZhODZkMmQ2MDM3NDg2ZTBhYzEzMGQ4YTIzZTNlMiIsImlhdCI6MTcwNTg5Nzc3Ny45NzUxMiwibmJmIjoxNzA1ODk3Nzc3Ljk3NTEyNiwiZXhwIjoxNzM3NTIwMTc3Ljc4NDIyNywic3ViIjoiMSIsInNjb3BlcyI6W119.WSbXnygnDP-p0v--5MIA1dEAslFrRkvSNuGArm6MaDQ4gWnk2g67-kbHP4-DBELlPRnrL9Ra8ciUWQnbM52OluPpQsxPlkgar0g6TW1FWAWhEFsvKwwcZojdhl3UwD60NwrI0vAzRl7XzYzWylxbqoj1K0Hz3dXJGd0BLMqMOy_jNLg3dy0tEYZt87G3kvpIBXb3rMIiKC4Zw_pYxQYp8yMpBXGPv7YeiKd6SVviGRFe96jhU9Td_whvHlkTgi0OhwOsAtQrQUm0tL66xmWuQdbl2iCDXJ1SqJflBhEio3i9Vuipo5j8wE_-mPgRhnZwr7fd-UYFcwXiyzk2LQ5QORac_eC2UATcOSoA09yDNDGI-AZFVoSBqf1Yg8CcGo5MdDib6-nd8nCu9iPYCDH1W-B-0yzP1VEXx3XPlmPxG7t8sXfWpxuR7k8y56RSFrlQSHbWk4YBGJrCvgsFT6bZC1KXlplAYCMz31pphCS4JG3YRrtIRexSD66aWZ0Die0_3PU5tc87ypqel5hl7w14871jNuzXd2w_LWhwn-Ou3OZvsWI1DiUZ76yR-VEqlB152n8N-lxqIS415r4vvfe9Jw0jojbUG0lHbK0AJtofvg-w1ORCPIc1PM6W-u3fpoHbBpzqV0zmbun0WCbRHwTz5pozYLgLkos5PuBBuSeLUe0","1","1","1","","","","2024-01-22 10:29:38");
INSERT INTO users VALUES("2","admin","admin@gmail.com","","1","","$2y$10$1UREa9ri6zGzc3v.BDT8UecIC5D/jiZ4jM8n0CYEuGcrNCntR6DLa","","","","2","1","1","","","","");
INSERT INTO users VALUES("3","employe","employe@gmail.com","","1","","$2y$10$Xkt1Wz0PZKjUNRVsR95GEeGk4yTR/tsL/X6V2gzGFdenphP9Pz2jy","","","","3","1","1","","","","");



CREATE TABLE `variants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO variants VALUES("1","s","2023-12-24 12:31:34","2023-12-24 12:31:34");
INSERT INTO variants VALUES("2","m","2023-12-24 12:31:34","2023-12-24 12:31:34");



CREATE TABLE `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO warehouses VALUES("2","ware house 1","01818401065","therashedul@gmail.com","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","1","2023-08-09 11:58:01","2023-08-09 12:28:43");
INSERT INTO warehouses VALUES("3","ware house 2","01709370009","webhatbd@gmail.com","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","1","2023-08-09 12:20:15","2023-08-09 12:26:37");



CREATE TABLE `whitelists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `whitelists_user_id_foreign` (`user_id`),
  CONSTRAINT `whitelists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


