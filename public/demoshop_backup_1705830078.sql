

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES("1","2023-08-02 10:44:24","2023-10-11 09:48:22","1403708","Rasel","50000","50000","","new Note","1","1");
INSERT INTO accounts VALUES("2","2023-09-02 16:59:46","2023-10-11 09:48:07","123456","karim","500001","500001","","Karim ac","1","");
INSERT INTO accounts VALUES("3","2023-10-11 10:03:50","2023-10-11 10:06:37","654321","sorna","123456","123456","","test note","0","");
INSERT INTO accounts VALUES("4","2024-01-03 13:02:40","2024-01-03 13:04:05","1403708","demo3","45646","45646","","","0","");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO barcodes VALUES("1","1","shart","2","321","\barcode68081776.png","","2023-08-22 12:12:14","2023-08-22 12:12:14");
INSERT INTO barcodes VALUES("145","3","aari","2","321","\barcode\tb3ljwc39.png","","2024-01-16 15:09:47","2024-01-16 15:09:47");
INSERT INTO barcodes VALUES("146","4","aari(pakisten)","1","321","\barcode\n7xty7c39.png","","2024-01-16 15:38:54","2024-01-16 15:38:54");
INSERT INTO barcodes VALUES("147","9","shart","2","321","\barcode\arnonwc39.png","","2024-01-18 17:11:10","2024-01-18 17:11:10");
INSERT INTO barcodes VALUES("148","10","sharee","2","321","\barcode\9z98pdc39.png","","2024-01-18 17:14:09","2024-01-18 17:14:09");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO billers VALUES("1","new biller","2_1684129568.jpg","webhat","234","rasel.netrweb@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","1216","Bangladesh","1","2023-09-07 16:17:57","2023-09-07 16:17:57");
INSERT INTO billers VALUES("2","Rashedul Karimss","","house","234","therashedul@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","1216","Bangladesh","1","2024-01-03 14:27:45","2024-01-03 14:27:56");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO brands VALUES("1","easy","","1","2023-12-24 12:11:10","2023-12-24 12:11:10");
INSERT INTO brands VALUES("2","pluse point","","1","2023-12-24 12:11:15","2023-12-24 12:11:15");
INSERT INTO brands VALUES("3","Locals","","1","2024-01-03 14:32:37","2024-01-03 14:32:44");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO coupons VALUES("1","04629095653841I","percentage","5","5000","2","","2024-01-31","1","1","2024-01-03 14:47:32","2024-01-03 14:47:32");



CREATE TABLE `couriers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO couriers VALUES("2","korotua","1709370009","mirpur - 12","2023-09-14 10:56:20","2023-09-14 10:56:20");
INSERT INTO couriers VALUES("3","sundor bon","0904422959","mirpur - 12","2023-09-14 10:56:37","2023-09-14 10:56:37");



CREATE TABLE `create_custom_fields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO customers VALUES("1","1","","karim","house","therashedul@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","4_1692512057.jpg","1216","Bangladesh","","","1","","24","2023-09-10 11:01:56","2024-01-17 11:37:54");
INSERT INTO customers VALUES("2","1","","rasel karim","susuta butiqe ghore","therashedul@gmail.com","0430719596","13/1 Myers St, Roseland, NSW-2195","Dhaka","","business_1688362561.jpg","2195","Bangladesh","","","1","","34","2023-09-10 11:05:46","2024-01-17 11:41:55");
INSERT INTO customers VALUES("3","2","","sorna","susuta butiqe ghore","sorna@gmail.com","01818401065","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka.","Dhaka","","","1216","Bangladesh","","","1","","3","2023-09-20 10:24:29","2024-01-14 13:00:28");
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deliveries VALUES("1","dr-20240103-034619","3","1","3","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh","rohim","rasel","","","3","2024-01-03 15:46:30","2024-01-03 15:46:30");
INSERT INTO deliveries VALUES("2","dr-20240116-041239","11","1","3","3/21 sujat nagor, Pollobi, Mirpur-12, Dhaka. Dhaka Bangladesh","rohim","rasel","","","2","2024-01-16 16:12:48","2024-01-16 16:12:48");
INSERT INTO deliveries VALUES("3","dr-20240116-050356","13","1","3","13/1 Myers St, Roseland, NSW-2195 Dhaka Bangladesh","rohim","rasel","","","2","2024-01-16 17:04:05","2024-01-16 17:28:25");



CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES("1","new department","1","2023-10-11 12:07:29","2024-01-03 15:50:08");
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plan_customers VALUES("1","3","1","2023-12-24 12:23:49","2023-12-24 12:23:49");
INSERT INTO discount_plan_customers VALUES("6","5","4","2024-01-03 17:05:12","2024-01-03 17:05:12");
INSERT INTO discount_plan_customers VALUES("7","4","2","2024-01-03 17:05:25","2024-01-03 17:05:25");



CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plan_discounts VALUES("1","12","3","2024-01-03 16:40:29","2024-01-03 16:40:29");



CREATE TABLE `discount_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO discount_plans VALUES("3","vip plan","1","2023-09-11 15:53:50","2023-09-11 15:53:50");
INSERT INTO discount_plans VALUES("4","global","1","2023-09-11 15:56:22","2023-09-11 16:09:30");
INSERT INTO discount_plans VALUES("5","reletive","1","2024-01-03 17:01:20","2024-01-03 17:01:20");



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
INSERT INTO discounts VALUES("12","demo3","All","","2023-10-03","2023-10-28","percentage","12","12","21","Mon,Tue,Wed,Thu,Fri,Sat,Sun","1","2023-10-03 16:49:48","2024-01-03 16:40:29");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES("2","804281679","traveling","1","2023-10-10 10:42:06","2023-10-10 10:57:59");
INSERT INTO expense_categories VALUES("3","201543016","lunch","1","2023-10-10 10:42:17","2023-10-10 10:42:17");
INSERT INTO expense_categories VALUES("4","666679776","demo3","1","2024-01-21 15:34:21","2024-01-21 15:34:21");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES("2","er-20231010-115141","2","2","2","2","1","5000","Note for your","2023-10-10 00:00:00","2023-10-10 14:33:02");
INSERT INTO expenses VALUES("3","er-20231010-023819","3","2","1","1","1","500","madhonbi","2023-10-06 00:00:00","2023-12-24 12:12:56");
INSERT INTO expenses VALUES("4","er-20231101-121846","2","2","1","1","1","250","dfsdf","2023-11-01 00:00:00","2024-01-03 17:19:43");
INSERT INTO expenses VALUES("6","er-20240121-033412","2","2","1","1","1","250","","2023-12-31 00:00:00","2024-01-21 15:34:12");



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
  `vat_registration_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO general_settings VALUES("1","myshopw","20220905125905.png","0","1","0","all","d-m-Y","rasel","standard","2","01818401065","therashedul@gmail.com","yearly","1","dark.css","2018-07-06 12:13:11","2024-01-18 11:02:47","prefix","2024-01-31","0","Myshop company","980980");



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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `width` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spent_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO hitlogs VALUES("102","127.0.0.1","superAdmin.index","Apple Safari16.6","8801709370008","http://127.0.0.1:8000/superAdmin","Mobile","iOS","iPhone;","Null","Null","","OS","2024-01-09 09:48:02","2024-01-09 09:48:02");
INSERT INTO hitlogs VALUES("103","127.0.0.1","superAdmin.index","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 09:48:46","2024-01-09 09:48:46");
INSERT INTO hitlogs VALUES("104","127.0.0.1","superAdmin.index","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 09:50:13","2024-01-09 09:50:13");
INSERT INTO hitlogs VALUES("105","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:54:45","2024-01-09 10:54:45");
INSERT INTO hitlogs VALUES("106","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:54:50","2024-01-09 10:54:50");
INSERT INTO hitlogs VALUES("107","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:57:38","2024-01-09 10:57:38");
INSERT INTO hitlogs VALUES("108","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:57:43","2024-01-09 10:57:43");
INSERT INTO hitlogs VALUES("109","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:10","2024-01-09 10:58:10");
INSERT INTO hitlogs VALUES("110","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:13","2024-01-09 10:58:13");
INSERT INTO hitlogs VALUES("111","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:19","2024-01-09 10:58:19");
INSERT INTO hitlogs VALUES("112","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:22","2024-01-09 10:58:22");
INSERT INTO hitlogs VALUES("113","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:26","2024-01-09 10:58:26");
INSERT INTO hitlogs VALUES("114","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 10:58:29","2024-01-09 10:58:29");
INSERT INTO hitlogs VALUES("115","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:02:39","2024-01-09 11:02:39");
INSERT INTO hitlogs VALUES("116","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:03:11","2024-01-09 11:03:11");
INSERT INTO hitlogs VALUES("117","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:03:15","2024-01-09 11:03:15");
INSERT INTO hitlogs VALUES("118","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:03:17","2024-01-09 11:03:17");
INSERT INTO hitlogs VALUES("119","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:03:20","2024-01-09 11:03:20");
INSERT INTO hitlogs VALUES("120","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:05:22","2024-01-09 11:05:22");
INSERT INTO hitlogs VALUES("121","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:05:27","2024-01-09 11:05:27");
INSERT INTO hitlogs VALUES("122","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:49:57","2024-01-09 11:49:57");
INSERT INTO hitlogs VALUES("123","127.0.0.1","superAdmin.expense_categories.edit","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories.edit/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:50:13","2024-01-09 11:50:13");
INSERT INTO hitlogs VALUES("124","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 11:54:48","2024-01-09 11:54:48");
INSERT INTO hitlogs VALUES("125","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:02:47","2024-01-09 12:02:47");
INSERT INTO hitlogs VALUES("126","127.0.0.1","superAdmin.expense_categories.edit","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories.edit/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:02:59","2024-01-09 12:02:59");
INSERT INTO hitlogs VALUES("127","127.0.0.1","superAdmin.report.supplierDueByDate","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report/supplier-due-report","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:25:18","2024-01-09 12:25:18");
INSERT INTO hitlogs VALUES("128","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:25:29","2024-01-09 12:25:29");
INSERT INTO hitlogs VALUES("129","127.0.0.1","superAdmin.report.warehouseStock","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report.warehouseStock","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:25:30","2024-01-09 12:25:30");
INSERT INTO hitlogs VALUES("130","127.0.0.1","superAdmin.report.productExpiry","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report.productExpiry","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:25:32","2024-01-09 12:25:32");
INSERT INTO hitlogs VALUES("131","127.0.0.1","superAdmin.report.qtyAlert","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report.qtyAlert","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:25:33","2024-01-09 12:25:33");
INSERT INTO hitlogs VALUES("132","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:26:35","2024-01-09 12:26:35");
INSERT INTO hitlogs VALUES("133","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:26:48","2024-01-09 12:26:48");
INSERT INTO hitlogs VALUES("134","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:00","2024-01-09 12:27:00");
INSERT INTO hitlogs VALUES("135","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:13","2024-01-09 12:27:13");
INSERT INTO hitlogs VALUES("136","127.0.0.1","superAdmin.report.qtyAlert","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report.qtyAlert","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:29","2024-01-09 12:27:29");
INSERT INTO hitlogs VALUES("137","127.0.0.1","superAdmin.report.productExpiry","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report.productExpiry","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:30","2024-01-09 12:27:30");
INSERT INTO hitlogs VALUES("138","127.0.0.1","superAdmin.report.warehouseStock","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report.warehouseStock","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:31","2024-01-09 12:27:31");
INSERT INTO hitlogs VALUES("139","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:31","2024-01-09 12:27:31");
INSERT INTO hitlogs VALUES("140","127.0.0.1","superAdmin.report.supplierDueByDate","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report/supplier-due-report","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:32","2024-01-09 12:27:32");
INSERT INTO hitlogs VALUES("141","127.0.0.1","superAdmin.generated::VtSyVKvxq8nnQbFg","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-09 12:27:43","2024-01-09 12:27:43");
INSERT INTO hitlogs VALUES("142","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 09:36:55","2024-01-10 09:36:55");
INSERT INTO hitlogs VALUES("143","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 09:37:49","2024-01-10 09:37:49");
INSERT INTO hitlogs VALUES("144","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 09:37:55","2024-01-10 09:37:55");
INSERT INTO hitlogs VALUES("145","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 09:58:42","2024-01-10 09:58:42");
INSERT INTO hitlogs VALUES("146","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:00:08","2024-01-10 10:00:08");
INSERT INTO hitlogs VALUES("147","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:00:12","2024-01-10 10:00:12");
INSERT INTO hitlogs VALUES("148","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:00:42","2024-01-10 10:00:42");
INSERT INTO hitlogs VALUES("149","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:00:45","2024-01-10 10:00:45");
INSERT INTO hitlogs VALUES("150","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:01:04","2024-01-10 10:01:04");
INSERT INTO hitlogs VALUES("151","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","8801709370008","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:01:07","2024-01-10 10:01:07");
INSERT INTO hitlogs VALUES("152","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:02:26","2024-01-10 10:02:26");
INSERT INTO hitlogs VALUES("153","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 10:02:29","2024-01-10 10:02:29");
INSERT INTO hitlogs VALUES("154","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 12:25:37","2024-01-10 12:25:37");
INSERT INTO hitlogs VALUES("155","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 14:28:17","2024-01-10 14:28:17");
INSERT INTO hitlogs VALUES("156","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-10 17:33:18","2024-01-10 17:33:18");
INSERT INTO hitlogs VALUES("157","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-11 10:39:54","2024-01-11 10:39:54");
INSERT INTO hitlogs VALUES("158","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:05:54","2024-01-14 10:05:54");
INSERT INTO hitlogs VALUES("159","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:05:56","2024-01-14 10:05:56");
INSERT INTO hitlogs VALUES("160","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:06:11","2024-01-14 10:06:11");
INSERT INTO hitlogs VALUES("161","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:06:18","2024-01-14 10:06:18");
INSERT INTO hitlogs VALUES("162","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:06:23","2024-01-14 10:06:23");
INSERT INTO hitlogs VALUES("163","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:06:27","2024-01-14 10:06:27");
INSERT INTO hitlogs VALUES("164","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:10:57","2024-01-14 10:10:57");
INSERT INTO hitlogs VALUES("165","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:11:32","2024-01-14 10:11:32");
INSERT INTO hitlogs VALUES("166","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:11:34","2024-01-14 10:11:34");
INSERT INTO hitlogs VALUES("167","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:15:33","2024-01-14 10:15:33");
INSERT INTO hitlogs VALUES("168","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:15:37","2024-01-14 10:15:37");
INSERT INTO hitlogs VALUES("169","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:17:31","2024-01-14 10:17:31");
INSERT INTO hitlogs VALUES("170","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:17:34","2024-01-14 10:17:34");
INSERT INTO hitlogs VALUES("171","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:18:07","2024-01-14 10:18:07");
INSERT INTO hitlogs VALUES("172","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:18:09","2024-01-14 10:18:09");
INSERT INTO hitlogs VALUES("173","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:18:28","2024-01-14 10:18:28");
INSERT INTO hitlogs VALUES("174","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:18:32","2024-01-14 10:18:32");
INSERT INTO hitlogs VALUES("175","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:31:35","2024-01-14 10:31:35");
INSERT INTO hitlogs VALUES("176","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:31:38","2024-01-14 10:31:38");
INSERT INTO hitlogs VALUES("177","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:32:24","2024-01-14 10:32:24");
INSERT INTO hitlogs VALUES("178","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:32:26","2024-01-14 10:32:26");
INSERT INTO hitlogs VALUES("179","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:32:49","2024-01-14 10:32:49");
INSERT INTO hitlogs VALUES("180","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:32:51","2024-01-14 10:32:51");
INSERT INTO hitlogs VALUES("181","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:48:59","2024-01-14 10:48:59");
INSERT INTO hitlogs VALUES("182","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:49:02","2024-01-14 10:49:02");
INSERT INTO hitlogs VALUES("183","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:52:41","2024-01-14 10:52:41");
INSERT INTO hitlogs VALUES("184","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:52:44","2024-01-14 10:52:44");
INSERT INTO hitlogs VALUES("185","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:52:58","2024-01-14 10:52:58");
INSERT INTO hitlogs VALUES("186","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:53:01","2024-01-14 10:53:01");
INSERT INTO hitlogs VALUES("187","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:54:30","2024-01-14 10:54:30");
INSERT INTO hitlogs VALUES("188","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 10:54:33","2024-01-14 10:54:33");
INSERT INTO hitlogs VALUES("189","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:13:22","2024-01-14 11:13:22");
INSERT INTO hitlogs VALUES("190","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:14:32","2024-01-14 11:14:32");
INSERT INTO hitlogs VALUES("191","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:14:59","2024-01-14 11:14:59");
INSERT INTO hitlogs VALUES("192","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:15:01","2024-01-14 11:15:01");
INSERT INTO hitlogs VALUES("193","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:15:45","2024-01-14 11:15:45");
INSERT INTO hitlogs VALUES("194","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:15:47","2024-01-14 11:15:47");
INSERT INTO hitlogs VALUES("195","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:17:45","2024-01-14 11:17:45");
INSERT INTO hitlogs VALUES("196","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:17:47","2024-01-14 11:17:47");
INSERT INTO hitlogs VALUES("197","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:17:53","2024-01-14 11:17:53");
INSERT INTO hitlogs VALUES("198","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:17:56","2024-01-14 11:17:56");
INSERT INTO hitlogs VALUES("199","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:20:55","2024-01-14 11:20:55");
INSERT INTO hitlogs VALUES("200","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:20:56","2024-01-14 11:20:56");
INSERT INTO hitlogs VALUES("201","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:20:59","2024-01-14 11:20:59");
INSERT INTO hitlogs VALUES("202","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:06","2024-01-14 11:21:06");
INSERT INTO hitlogs VALUES("203","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:07","2024-01-14 11:21:07");
INSERT INTO hitlogs VALUES("204","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:07","2024-01-14 11:21:07");
INSERT INTO hitlogs VALUES("205","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:12","2024-01-14 11:21:12");
INSERT INTO hitlogs VALUES("206","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:13","2024-01-14 11:21:13");
INSERT INTO hitlogs VALUES("207","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:13","2024-01-14 11:21:13");
INSERT INTO hitlogs VALUES("208","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:14","2024-01-14 11:21:14");
INSERT INTO hitlogs VALUES("209","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:21","2024-01-14 11:21:21");
INSERT INTO hitlogs VALUES("210","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:21","2024-01-14 11:21:21");
INSERT INTO hitlogs VALUES("211","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:27","2024-01-14 11:21:27");
INSERT INTO hitlogs VALUES("212","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:28","2024-01-14 11:21:28");
INSERT INTO hitlogs VALUES("213","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:51","2024-01-14 11:21:51");
INSERT INTO hitlogs VALUES("214","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:54","2024-01-14 11:21:54");
INSERT INTO hitlogs VALUES("215","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:59","2024-01-14 11:21:59");
INSERT INTO hitlogs VALUES("216","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:21:59","2024-01-14 11:21:59");
INSERT INTO hitlogs VALUES("217","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:22:02","2024-01-14 11:22:02");
INSERT INTO hitlogs VALUES("218","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:22:02","2024-01-14 11:22:02");
INSERT INTO hitlogs VALUES("219","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:24:38","2024-01-14 11:24:38");
INSERT INTO hitlogs VALUES("220","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:24:42","2024-01-14 11:24:42");
INSERT INTO hitlogs VALUES("221","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:25:09","2024-01-14 11:25:09");
INSERT INTO hitlogs VALUES("222","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:25:10","2024-01-14 11:25:10");
INSERT INTO hitlogs VALUES("223","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:04","2024-01-14 11:31:04");
INSERT INTO hitlogs VALUES("224","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:09","2024-01-14 11:31:09");
INSERT INTO hitlogs VALUES("225","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:23","2024-01-14 11:31:23");
INSERT INTO hitlogs VALUES("226","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:27","2024-01-14 11:31:27");
INSERT INTO hitlogs VALUES("227","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:47","2024-01-14 11:31:47");
INSERT INTO hitlogs VALUES("228","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:31:50","2024-01-14 11:31:50");
INSERT INTO hitlogs VALUES("229","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:32:25","2024-01-14 11:32:25");
INSERT INTO hitlogs VALUES("230","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:32:28","2024-01-14 11:32:28");
INSERT INTO hitlogs VALUES("231","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:33:11","2024-01-14 11:33:11");
INSERT INTO hitlogs VALUES("232","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:33:13","2024-01-14 11:33:13");
INSERT INTO hitlogs VALUES("233","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:35:02","2024-01-14 11:35:02");
INSERT INTO hitlogs VALUES("234","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:35:06","2024-01-14 11:35:06");
INSERT INTO hitlogs VALUES("235","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:35:10","2024-01-14 11:35:10");
INSERT INTO hitlogs VALUES("236","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:35:13","2024-01-14 11:35:13");
INSERT INTO hitlogs VALUES("237","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:35:15","2024-01-14 11:35:15");
INSERT INTO hitlogs VALUES("238","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:10","2024-01-14 11:36:10");
INSERT INTO hitlogs VALUES("239","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:14","2024-01-14 11:36:14");
INSERT INTO hitlogs VALUES("240","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:19","2024-01-14 11:36:19");
INSERT INTO hitlogs VALUES("241","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:29","2024-01-14 11:36:29");
INSERT INTO hitlogs VALUES("242","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:31","2024-01-14 11:36:31");
INSERT INTO hitlogs VALUES("243","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:36:33","2024-01-14 11:36:33");
INSERT INTO hitlogs VALUES("244","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:15","2024-01-14 11:38:15");
INSERT INTO hitlogs VALUES("245","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:19","2024-01-14 11:38:19");
INSERT INTO hitlogs VALUES("246","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:24","2024-01-14 11:38:24");
INSERT INTO hitlogs VALUES("247","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:29","2024-01-14 11:38:29");
INSERT INTO hitlogs VALUES("248","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:31","2024-01-14 11:38:31");
INSERT INTO hitlogs VALUES("249","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:34","2024-01-14 11:38:34");
INSERT INTO hitlogs VALUES("250","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:44","2024-01-14 11:38:44");
INSERT INTO hitlogs VALUES("251","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:38:48","2024-01-14 11:38:48");
INSERT INTO hitlogs VALUES("252","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:39:33","2024-01-14 11:39:33");
INSERT INTO hitlogs VALUES("253","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:39:36","2024-01-14 11:39:36");
INSERT INTO hitlogs VALUES("254","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:39:59","2024-01-14 11:39:59");
INSERT INTO hitlogs VALUES("255","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:40:02","2024-01-14 11:40:02");
INSERT INTO hitlogs VALUES("256","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:40:08","2024-01-14 11:40:08");
INSERT INTO hitlogs VALUES("257","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:09","2024-01-14 11:41:09");
INSERT INTO hitlogs VALUES("258","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:13","2024-01-14 11:41:13");
INSERT INTO hitlogs VALUES("259","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:20","2024-01-14 11:41:20");
INSERT INTO hitlogs VALUES("260","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:24","2024-01-14 11:41:24");
INSERT INTO hitlogs VALUES("261","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:33","2024-01-14 11:41:33");
INSERT INTO hitlogs VALUES("262","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:36","2024-01-14 11:41:36");
INSERT INTO hitlogs VALUES("263","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:42","2024-01-14 11:41:42");
INSERT INTO hitlogs VALUES("264","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:45","2024-01-14 11:41:45");
INSERT INTO hitlogs VALUES("265","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:41:48","2024-01-14 11:41:48");
INSERT INTO hitlogs VALUES("266","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:42:00","2024-01-14 11:42:00");
INSERT INTO hitlogs VALUES("267","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:42:02","2024-01-14 11:42:02");
INSERT INTO hitlogs VALUES("268","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:42:45","2024-01-14 11:42:45");
INSERT INTO hitlogs VALUES("269","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:42:48","2024-01-14 11:42:48");
INSERT INTO hitlogs VALUES("270","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:03","2024-01-14 11:43:03");
INSERT INTO hitlogs VALUES("271","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:06","2024-01-14 11:43:06");
INSERT INTO hitlogs VALUES("272","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:18","2024-01-14 11:43:18");
INSERT INTO hitlogs VALUES("273","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:21","2024-01-14 11:43:21");
INSERT INTO hitlogs VALUES("274","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:32","2024-01-14 11:43:32");
INSERT INTO hitlogs VALUES("275","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:43:34","2024-01-14 11:43:34");
INSERT INTO hitlogs VALUES("276","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:45:12","2024-01-14 11:45:12");
INSERT INTO hitlogs VALUES("277","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:45:15","2024-01-14 11:45:15");
INSERT INTO hitlogs VALUES("278","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:46:18","2024-01-14 11:46:18");
INSERT INTO hitlogs VALUES("279","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:46:21","2024-01-14 11:46:21");
INSERT INTO hitlogs VALUES("280","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:46:26","2024-01-14 11:46:26");
INSERT INTO hitlogs VALUES("281","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:05","2024-01-14 11:47:05");
INSERT INTO hitlogs VALUES("282","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:08","2024-01-14 11:47:08");
INSERT INTO hitlogs VALUES("283","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:15","2024-01-14 11:47:15");
INSERT INTO hitlogs VALUES("284","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:21","2024-01-14 11:47:21");
INSERT INTO hitlogs VALUES("285","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:23","2024-01-14 11:47:23");
INSERT INTO hitlogs VALUES("286","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:28","2024-01-14 11:47:28");
INSERT INTO hitlogs VALUES("287","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:47","2024-01-14 11:47:47");
INSERT INTO hitlogs VALUES("288","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:49","2024-01-14 11:47:49");
INSERT INTO hitlogs VALUES("289","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:54","2024-01-14 11:47:54");
INSERT INTO hitlogs VALUES("290","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:47:59","2024-01-14 11:47:59");
INSERT INTO hitlogs VALUES("291","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:01","2024-01-14 11:48:01");
INSERT INTO hitlogs VALUES("292","127.0.0.1","superAdmin.sale.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.edit/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:08","2024-01-14 11:48:08");
INSERT INTO hitlogs VALUES("293","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:12","2024-01-14 11:48:12");
INSERT INTO hitlogs VALUES("294","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:13","2024-01-14 11:48:13");
INSERT INTO hitlogs VALUES("295","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:13","2024-01-14 11:48:13");
INSERT INTO hitlogs VALUES("296","127.0.0.1","superAdmin.sale.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.update.2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:27","2024-01-14 11:48:27");
INSERT INTO hitlogs VALUES("297","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:29","2024-01-14 11:48:29");
INSERT INTO hitlogs VALUES("298","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:32","2024-01-14 11:48:32");
INSERT INTO hitlogs VALUES("299","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:35","2024-01-14 11:48:35");
INSERT INTO hitlogs VALUES("300","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:38","2024-01-14 11:48:38");
INSERT INTO hitlogs VALUES("301","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:41","2024-01-14 11:48:41");
INSERT INTO hitlogs VALUES("302","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:48:46","2024-01-14 11:48:46");
INSERT INTO hitlogs VALUES("303","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:49:28","2024-01-14 11:49:28");
INSERT INTO hitlogs VALUES("304","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:49:30","2024-01-14 11:49:30");
INSERT INTO hitlogs VALUES("305","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:03","2024-01-14 11:50:03");
INSERT INTO hitlogs VALUES("306","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:06","2024-01-14 11:50:06");
INSERT INTO hitlogs VALUES("307","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:09","2024-01-14 11:50:09");
INSERT INTO hitlogs VALUES("308","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:12","2024-01-14 11:50:12");
INSERT INTO hitlogs VALUES("309","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:14","2024-01-14 11:50:14");
INSERT INTO hitlogs VALUES("310","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:16","2024-01-14 11:50:16");
INSERT INTO hitlogs VALUES("311","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:28","2024-01-14 11:50:28");
INSERT INTO hitlogs VALUES("312","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:29","2024-01-14 11:50:29");
INSERT INTO hitlogs VALUES("313","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:50:33","2024-01-14 11:50:33");
INSERT INTO hitlogs VALUES("314","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:51:32","2024-01-14 11:51:32");
INSERT INTO hitlogs VALUES("315","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:51:34","2024-01-14 11:51:34");
INSERT INTO hitlogs VALUES("316","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:51:48","2024-01-14 11:51:48");
INSERT INTO hitlogs VALUES("317","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:52:39","2024-01-14 11:52:39");
INSERT INTO hitlogs VALUES("318","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:52:42","2024-01-14 11:52:42");
INSERT INTO hitlogs VALUES("319","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:53:24","2024-01-14 11:53:24");
INSERT INTO hitlogs VALUES("320","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:53:27","2024-01-14 11:53:27");
INSERT INTO hitlogs VALUES("321","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:20","2024-01-14 11:54:20");
INSERT INTO hitlogs VALUES("322","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:23","2024-01-14 11:54:23");
INSERT INTO hitlogs VALUES("323","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:38","2024-01-14 11:54:38");
INSERT INTO hitlogs VALUES("324","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:40","2024-01-14 11:54:40");
INSERT INTO hitlogs VALUES("325","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:51","2024-01-14 11:54:51");
INSERT INTO hitlogs VALUES("326","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:54:52","2024-01-14 11:54:52");
INSERT INTO hitlogs VALUES("327","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:55:57","2024-01-14 11:55:57");
INSERT INTO hitlogs VALUES("328","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:56:01","2024-01-14 11:56:01");
INSERT INTO hitlogs VALUES("329","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:13","2024-01-14 11:57:13");
INSERT INTO hitlogs VALUES("330","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:16","2024-01-14 11:57:16");
INSERT INTO hitlogs VALUES("331","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:21","2024-01-14 11:57:21");
INSERT INTO hitlogs VALUES("332","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:26","2024-01-14 11:57:26");
INSERT INTO hitlogs VALUES("333","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:50","2024-01-14 11:57:50");
INSERT INTO hitlogs VALUES("334","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:52","2024-01-14 11:57:52");
INSERT INTO hitlogs VALUES("335","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:55","2024-01-14 11:57:55");
INSERT INTO hitlogs VALUES("336","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:58","2024-01-14 11:57:58");
INSERT INTO hitlogs VALUES("337","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:57:59","2024-01-14 11:57:59");
INSERT INTO hitlogs VALUES("338","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:58:10","2024-01-14 11:58:10");
INSERT INTO hitlogs VALUES("339","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:58:11","2024-01-14 11:58:11");
INSERT INTO hitlogs VALUES("340","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:58:18","2024-01-14 11:58:18");
INSERT INTO hitlogs VALUES("341","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 11:58:19","2024-01-14 11:58:19");
INSERT INTO hitlogs VALUES("342","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:40","2024-01-14 12:00:40");
INSERT INTO hitlogs VALUES("343","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:41","2024-01-14 12:00:41");
INSERT INTO hitlogs VALUES("344","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:43","2024-01-14 12:00:43");
INSERT INTO hitlogs VALUES("345","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:49","2024-01-14 12:00:49");
INSERT INTO hitlogs VALUES("346","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:50","2024-01-14 12:00:50");
INSERT INTO hitlogs VALUES("347","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:00:58","2024-01-14 12:00:58");
INSERT INTO hitlogs VALUES("348","127.0.0.1","superAdmin.sale.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.edit/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:14","2024-01-14 12:02:14");
INSERT INTO hitlogs VALUES("349","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:16","2024-01-14 12:02:16");
INSERT INTO hitlogs VALUES("350","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:17","2024-01-14 12:02:17");
INSERT INTO hitlogs VALUES("351","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:17","2024-01-14 12:02:17");
INSERT INTO hitlogs VALUES("352","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:23","2024-01-14 12:02:23");
INSERT INTO hitlogs VALUES("353","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:32","2024-01-14 12:02:32");
INSERT INTO hitlogs VALUES("354","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:36","2024-01-14 12:02:36");
INSERT INTO hitlogs VALUES("355","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:02:51","2024-01-14 12:02:51");
INSERT INTO hitlogs VALUES("356","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:04:39","2024-01-14 12:04:39");
INSERT INTO hitlogs VALUES("357","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:04:43","2024-01-14 12:04:43");
INSERT INTO hitlogs VALUES("358","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:11:07","2024-01-14 12:11:07");
INSERT INTO hitlogs VALUES("359","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:12:15","2024-01-14 12:12:15");
INSERT INTO hitlogs VALUES("360","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:12:18","2024-01-14 12:12:18");
INSERT INTO hitlogs VALUES("361","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:14:32","2024-01-14 12:14:32");
INSERT INTO hitlogs VALUES("362","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:14:37","2024-01-14 12:14:37");
INSERT INTO hitlogs VALUES("363","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:16:03","2024-01-14 12:16:03");
INSERT INTO hitlogs VALUES("364","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:16:06","2024-01-14 12:16:06");
INSERT INTO hitlogs VALUES("365","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:17:50","2024-01-14 12:17:50");
INSERT INTO hitlogs VALUES("366","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:17:54","2024-01-14 12:17:54");
INSERT INTO hitlogs VALUES("367","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:18:39","2024-01-14 12:18:39");
INSERT INTO hitlogs VALUES("368","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:18:42","2024-01-14 12:18:42");
INSERT INTO hitlogs VALUES("369","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:18:52","2024-01-14 12:18:52");
INSERT INTO hitlogs VALUES("370","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:19:01","2024-01-14 12:19:01");
INSERT INTO hitlogs VALUES("371","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:19:04","2024-01-14 12:19:04");
INSERT INTO hitlogs VALUES("372","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:19:44","2024-01-14 12:19:44");
INSERT INTO hitlogs VALUES("373","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:19:47","2024-01-14 12:19:47");
INSERT INTO hitlogs VALUES("374","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:20:05","2024-01-14 12:20:05");
INSERT INTO hitlogs VALUES("375","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:20:08","2024-01-14 12:20:08");
INSERT INTO hitlogs VALUES("376","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:31:56","2024-01-14 12:31:56");
INSERT INTO hitlogs VALUES("377","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:32:02","2024-01-14 12:32:02");
INSERT INTO hitlogs VALUES("378","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:34:20","2024-01-14 12:34:20");
INSERT INTO hitlogs VALUES("379","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:34:24","2024-01-14 12:34:24");
INSERT INTO hitlogs VALUES("380","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:41:57","2024-01-14 12:41:57");
INSERT INTO hitlogs VALUES("381","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:42:02","2024-01-14 12:42:02");
INSERT INTO hitlogs VALUES("382","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:44:34","2024-01-14 12:44:34");
INSERT INTO hitlogs VALUES("383","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:44:37","2024-01-14 12:44:37");
INSERT INTO hitlogs VALUES("384","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:46:02","2024-01-14 12:46:02");
INSERT INTO hitlogs VALUES("385","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:46:32","2024-01-14 12:46:32");
INSERT INTO hitlogs VALUES("386","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:46:36","2024-01-14 12:46:36");
INSERT INTO hitlogs VALUES("387","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:46:40","2024-01-14 12:46:40");
INSERT INTO hitlogs VALUES("388","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:46:43","2024-01-14 12:46:43");
INSERT INTO hitlogs VALUES("389","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:47:04","2024-01-14 12:47:04");
INSERT INTO hitlogs VALUES("390","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:47:06","2024-01-14 12:47:06");
INSERT INTO hitlogs VALUES("391","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:47:25","2024-01-14 12:47:25");
INSERT INTO hitlogs VALUES("392","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:47:28","2024-01-14 12:47:28");
INSERT INTO hitlogs VALUES("393","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:47:56","2024-01-14 12:47:56");
INSERT INTO hitlogs VALUES("394","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:48:03","2024-01-14 12:48:03");
INSERT INTO hitlogs VALUES("395","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:50:10","2024-01-14 12:50:10");
INSERT INTO hitlogs VALUES("396","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:50:15","2024-01-14 12:50:15");
INSERT INTO hitlogs VALUES("397","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:50:50","2024-01-14 12:50:50");
INSERT INTO hitlogs VALUES("398","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:50:54","2024-01-14 12:50:54");
INSERT INTO hitlogs VALUES("399","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:54:49","2024-01-14 12:54:49");
INSERT INTO hitlogs VALUES("400","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:55:00","2024-01-14 12:55:00");
INSERT INTO hitlogs VALUES("401","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:55:06","2024-01-14 12:55:06");
INSERT INTO hitlogs VALUES("402","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:58:17","2024-01-14 12:58:17");
INSERT INTO hitlogs VALUES("403","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:58:19","2024-01-14 12:58:19");
INSERT INTO hitlogs VALUES("404","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:58:58","2024-01-14 12:58:58");
INSERT INTO hitlogs VALUES("405","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:59:36","2024-01-14 12:59:36");
INSERT INTO hitlogs VALUES("406","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 12:59:38","2024-01-14 12:59:38");
INSERT INTO hitlogs VALUES("407","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:02","2024-01-14 13:00:02");
INSERT INTO hitlogs VALUES("408","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:14","2024-01-14 13:00:14");
INSERT INTO hitlogs VALUES("409","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:18","2024-01-14 13:00:18");
INSERT INTO hitlogs VALUES("410","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:18","2024-01-14 13:00:18");
INSERT INTO hitlogs VALUES("411","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:25","2024-01-14 13:00:25");
INSERT INTO hitlogs VALUES("412","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:28","2024-01-14 13:00:28");
INSERT INTO hitlogs VALUES("413","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/4","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:29","2024-01-14 13:00:29");
INSERT INTO hitlogs VALUES("414","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:32","2024-01-14 13:00:32");
INSERT INTO hitlogs VALUES("415","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:00:35","2024-01-14 13:00:35");
INSERT INTO hitlogs VALUES("416","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:01:09","2024-01-14 13:01:09");
INSERT INTO hitlogs VALUES("417","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:01:12","2024-01-14 13:01:12");
INSERT INTO hitlogs VALUES("418","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:03:04","2024-01-14 13:03:04");
INSERT INTO hitlogs VALUES("419","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:03:07","2024-01-14 13:03:07");
INSERT INTO hitlogs VALUES("420","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:05:10","2024-01-14 13:05:10");
INSERT INTO hitlogs VALUES("421","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:05:20","2024-01-14 13:05:20");
INSERT INTO hitlogs VALUES("422","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:05:23","2024-01-14 13:05:23");
INSERT INTO hitlogs VALUES("423","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:06:13","2024-01-14 13:06:13");
INSERT INTO hitlogs VALUES("424","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:06:18","2024-01-14 13:06:18");
INSERT INTO hitlogs VALUES("425","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:07:59","2024-01-14 13:07:59");
INSERT INTO hitlogs VALUES("426","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:08:02","2024-01-14 13:08:02");
INSERT INTO hitlogs VALUES("427","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:08:19","2024-01-14 13:08:19");
INSERT INTO hitlogs VALUES("428","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:08:23","2024-01-14 13:08:23");
INSERT INTO hitlogs VALUES("429","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:09:59","2024-01-14 13:09:59");
INSERT INTO hitlogs VALUES("430","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:10:03","2024-01-14 13:10:03");
INSERT INTO hitlogs VALUES("431","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:12:08","2024-01-14 13:12:08");
INSERT INTO hitlogs VALUES("432","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:12:11","2024-01-14 13:12:11");
INSERT INTO hitlogs VALUES("433","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:13:00","2024-01-14 13:13:00");
INSERT INTO hitlogs VALUES("434","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:13:03","2024-01-14 13:13:03");
INSERT INTO hitlogs VALUES("435","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:13:27","2024-01-14 13:13:27");
INSERT INTO hitlogs VALUES("436","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:13:30","2024-01-14 13:13:30");
INSERT INTO hitlogs VALUES("437","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:14:06","2024-01-14 13:14:06");
INSERT INTO hitlogs VALUES("438","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:14:09","2024-01-14 13:14:09");
INSERT INTO hitlogs VALUES("439","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:15:37","2024-01-14 13:15:37");
INSERT INTO hitlogs VALUES("440","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:15:42","2024-01-14 13:15:42");
INSERT INTO hitlogs VALUES("441","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:16:25","2024-01-14 13:16:25");
INSERT INTO hitlogs VALUES("442","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:16:29","2024-01-14 13:16:29");
INSERT INTO hitlogs VALUES("443","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:19:21","2024-01-14 13:19:21");
INSERT INTO hitlogs VALUES("444","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:20:27","2024-01-14 13:20:27");
INSERT INTO hitlogs VALUES("445","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:20:31","2024-01-14 13:20:31");
INSERT INTO hitlogs VALUES("446","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:59:41","2024-01-14 13:59:41");
INSERT INTO hitlogs VALUES("447","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 13:59:57","2024-01-14 13:59:57");
INSERT INTO hitlogs VALUES("448","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:01:23","2024-01-14 14:01:23");
INSERT INTO hitlogs VALUES("449","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:01:28","2024-01-14 14:01:28");
INSERT INTO hitlogs VALUES("450","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:01:52","2024-01-14 14:01:52");
INSERT INTO hitlogs VALUES("451","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:01:58","2024-01-14 14:01:58");
INSERT INTO hitlogs VALUES("452","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:02:09","2024-01-14 14:02:09");
INSERT INTO hitlogs VALUES("453","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:02:13","2024-01-14 14:02:13");
INSERT INTO hitlogs VALUES("454","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:02:45","2024-01-14 14:02:45");
INSERT INTO hitlogs VALUES("455","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:02:49","2024-01-14 14:02:49");
INSERT INTO hitlogs VALUES("456","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:02:57","2024-01-14 14:02:57");
INSERT INTO hitlogs VALUES("457","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:03:01","2024-01-14 14:03:01");
INSERT INTO hitlogs VALUES("458","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:03:15","2024-01-14 14:03:15");
INSERT INTO hitlogs VALUES("459","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:03:18","2024-01-14 14:03:18");
INSERT INTO hitlogs VALUES("460","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:03:20","2024-01-14 14:03:20");
INSERT INTO hitlogs VALUES("461","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:12","2024-01-14 14:04:12");
INSERT INTO hitlogs VALUES("462","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:17","2024-01-14 14:04:17");
INSERT INTO hitlogs VALUES("463","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:31","2024-01-14 14:04:31");
INSERT INTO hitlogs VALUES("464","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:33","2024-01-14 14:04:33");
INSERT INTO hitlogs VALUES("465","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:35","2024-01-14 14:04:35");
INSERT INTO hitlogs VALUES("466","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:37","2024-01-14 14:04:37");
INSERT INTO hitlogs VALUES("467","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:40","2024-01-14 14:04:40");
INSERT INTO hitlogs VALUES("468","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:43","2024-01-14 14:04:43");
INSERT INTO hitlogs VALUES("469","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:45","2024-01-14 14:04:45");
INSERT INTO hitlogs VALUES("470","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:04:56","2024-01-14 14:04:56");
INSERT INTO hitlogs VALUES("471","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:06:36","2024-01-14 14:06:36");
INSERT INTO hitlogs VALUES("472","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:07:33","2024-01-14 14:07:33");
INSERT INTO hitlogs VALUES("473","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:07:37","2024-01-14 14:07:37");
INSERT INTO hitlogs VALUES("474","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:07:58","2024-01-14 14:07:58");
INSERT INTO hitlogs VALUES("475","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:07:59","2024-01-14 14:07:59");
INSERT INTO hitlogs VALUES("476","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:08:11","2024-01-14 14:08:11");
INSERT INTO hitlogs VALUES("477","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:08:17","2024-01-14 14:08:17");
INSERT INTO hitlogs VALUES("478","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:08:19","2024-01-14 14:08:19");
INSERT INTO hitlogs VALUES("479","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:10:45","2024-01-14 14:10:45");
INSERT INTO hitlogs VALUES("480","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:10:51","2024-01-14 14:10:51");
INSERT INTO hitlogs VALUES("481","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:10","2024-01-14 14:11:10");
INSERT INTO hitlogs VALUES("482","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:15","2024-01-14 14:11:15");
INSERT INTO hitlogs VALUES("483","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:28","2024-01-14 14:11:28");
INSERT INTO hitlogs VALUES("484","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:33","2024-01-14 14:11:33");
INSERT INTO hitlogs VALUES("485","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:38","2024-01-14 14:11:38");
INSERT INTO hitlogs VALUES("486","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:43","2024-01-14 14:11:43");
INSERT INTO hitlogs VALUES("487","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:46","2024-01-14 14:11:46");
INSERT INTO hitlogs VALUES("488","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:11:49","2024-01-14 14:11:49");
INSERT INTO hitlogs VALUES("489","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:12:07","2024-01-14 14:12:07");
INSERT INTO hitlogs VALUES("490","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:13:31","2024-01-14 14:13:31");
INSERT INTO hitlogs VALUES("491","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:13:35","2024-01-14 14:13:35");
INSERT INTO hitlogs VALUES("492","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:14:55","2024-01-14 14:14:55");
INSERT INTO hitlogs VALUES("493","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:14:59","2024-01-14 14:14:59");
INSERT INTO hitlogs VALUES("494","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:15:52","2024-01-14 14:15:52");
INSERT INTO hitlogs VALUES("495","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:15:57","2024-01-14 14:15:57");
INSERT INTO hitlogs VALUES("496","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:17:38","2024-01-14 14:17:38");
INSERT INTO hitlogs VALUES("497","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:17:42","2024-01-14 14:17:42");
INSERT INTO hitlogs VALUES("498","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:18:41","2024-01-14 14:18:41");
INSERT INTO hitlogs VALUES("499","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:18:45","2024-01-14 14:18:45");
INSERT INTO hitlogs VALUES("500","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:19:27","2024-01-14 14:19:27");
INSERT INTO hitlogs VALUES("501","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:19:33","2024-01-14 14:19:33");
INSERT INTO hitlogs VALUES("502","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:21:04","2024-01-14 14:21:04");
INSERT INTO hitlogs VALUES("503","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:21:07","2024-01-14 14:21:07");
INSERT INTO hitlogs VALUES("504","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:22:21","2024-01-14 14:22:21");
INSERT INTO hitlogs VALUES("505","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:22:24","2024-01-14 14:22:24");
INSERT INTO hitlogs VALUES("506","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:22:52","2024-01-14 14:22:52");
INSERT INTO hitlogs VALUES("507","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:22:55","2024-01-14 14:22:55");
INSERT INTO hitlogs VALUES("508","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:24:29","2024-01-14 14:24:29");
INSERT INTO hitlogs VALUES("509","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:24:32","2024-01-14 14:24:32");
INSERT INTO hitlogs VALUES("510","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:26:47","2024-01-14 14:26:47");
INSERT INTO hitlogs VALUES("511","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:26:50","2024-01-14 14:26:50");
INSERT INTO hitlogs VALUES("512","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:28:09","2024-01-14 14:28:09");
INSERT INTO hitlogs VALUES("513","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:28:13","2024-01-14 14:28:13");
INSERT INTO hitlogs VALUES("514","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:28:34","2024-01-14 14:28:34");
INSERT INTO hitlogs VALUES("515","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:28:37","2024-01-14 14:28:37");
INSERT INTO hitlogs VALUES("516","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:29:38","2024-01-14 14:29:38");
INSERT INTO hitlogs VALUES("517","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:29:41","2024-01-14 14:29:41");
INSERT INTO hitlogs VALUES("518","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:35:07","2024-01-14 14:35:07");
INSERT INTO hitlogs VALUES("519","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:35:11","2024-01-14 14:35:11");
INSERT INTO hitlogs VALUES("520","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:35:29","2024-01-14 14:35:29");
INSERT INTO hitlogs VALUES("521","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:35:33","2024-01-14 14:35:33");
INSERT INTO hitlogs VALUES("522","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:46:27","2024-01-14 14:46:27");
INSERT INTO hitlogs VALUES("523","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:46:28","2024-01-14 14:46:28");
INSERT INTO hitlogs VALUES("524","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:47:00","2024-01-14 14:47:00");
INSERT INTO hitlogs VALUES("525","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:47:03","2024-01-14 14:47:03");
INSERT INTO hitlogs VALUES("526","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:47:15","2024-01-14 14:47:15");
INSERT INTO hitlogs VALUES("527","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:47:16","2024-01-14 14:47:16");
INSERT INTO hitlogs VALUES("528","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:49:09","2024-01-14 14:49:09");
INSERT INTO hitlogs VALUES("529","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:49:12","2024-01-14 14:49:12");
INSERT INTO hitlogs VALUES("530","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:49:23","2024-01-14 14:49:23");
INSERT INTO hitlogs VALUES("531","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 14:49:24","2024-01-14 14:49:24");
INSERT INTO hitlogs VALUES("532","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:00:05","2024-01-14 15:00:05");
INSERT INTO hitlogs VALUES("533","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:14:45","2024-01-14 15:14:45");
INSERT INTO hitlogs VALUES("534","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:14:59","2024-01-14 15:14:59");
INSERT INTO hitlogs VALUES("535","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:15:11","2024-01-14 15:15:11");
INSERT INTO hitlogs VALUES("536","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:15:42","2024-01-14 15:15:42");
INSERT INTO hitlogs VALUES("537","127.0.0.1","superAdmin.generated::61HV32hE8s5GqTRW","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/daily_sale/2024/01","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:15:51","2024-01-14 15:15:51");
INSERT INTO hitlogs VALUES("538","127.0.0.1","superAdmin.generated::ZnQBNlOnqubyxiTW","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/monthly_sale/2024","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:16:58","2024-01-14 15:16:58");
INSERT INTO hitlogs VALUES("539","127.0.0.1","superAdmin.generated::VtSyVKvxq8nnQbFg","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:17:32","2024-01-14 15:17:32");
INSERT INTO hitlogs VALUES("540","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:19:15","2024-01-14 15:19:15");
INSERT INTO hitlogs VALUES("541","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:19:25","2024-01-14 15:19:25");
INSERT INTO hitlogs VALUES("542","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:19:56","2024-01-14 15:19:56");
INSERT INTO hitlogs VALUES("543","127.0.0.1","superAdmin.generated::ZnQBNlOnqubyxiTW","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/monthly_sale/2024","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:20:10","2024-01-14 15:20:10");
INSERT INTO hitlogs VALUES("544","127.0.0.1","superAdmin.generated::ZnQBNlOnqubyxiTW","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:20:20","2024-01-14 15:20:20");
INSERT INTO hitlogs VALUES("545","127.0.0.1","superAdmin.report.monthlySaleByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:20:27","2024-01-14 15:20:27");
INSERT INTO hitlogs VALUES("546","127.0.0.1","superAdmin.report.monthlySaleByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/monthly_sale/2023","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:20:34","2024-01-14 15:20:34");
INSERT INTO hitlogs VALUES("547","127.0.0.1","superAdmin.report.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale_report","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:20:49","2024-01-14 15:20:49");
INSERT INTO hitlogs VALUES("548","127.0.0.1","superAdmin.generated::VtSyVKvxq8nnQbFg","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:26:44","2024-01-14 15:26:44");
INSERT INTO hitlogs VALUES("549","127.0.0.1","superAdmin.generated::VtSyVKvxq8nnQbFg","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:27:40","2024-01-14 15:27:40");
INSERT INTO hitlogs VALUES("550","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:27:52","2024-01-14 15:27:52");
INSERT INTO hitlogs VALUES("551","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:28:00","2024-01-14 15:28:00");
INSERT INTO hitlogs VALUES("552","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:29:23","2024-01-14 15:29:23");
INSERT INTO hitlogs VALUES("553","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:29:39","2024-01-14 15:29:39");
INSERT INTO hitlogs VALUES("554","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:30:46","2024-01-14 15:30:46");
INSERT INTO hitlogs VALUES("555","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:33:43","2024-01-14 15:33:43");
INSERT INTO hitlogs VALUES("556","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:47:19","2024-01-14 15:47:19");
INSERT INTO hitlogs VALUES("557","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 15:47:35","2024-01-14 15:47:35");
INSERT INTO hitlogs VALUES("558","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:09:42","2024-01-14 16:09:42");
INSERT INTO hitlogs VALUES("559","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:11:22","2024-01-14 16:11:22");
INSERT INTO hitlogs VALUES("560","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:12:16","2024-01-14 16:12:16");
INSERT INTO hitlogs VALUES("561","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:12:46","2024-01-14 16:12:46");
INSERT INTO hitlogs VALUES("562","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:13:19","2024-01-14 16:13:19");
INSERT INTO hitlogs VALUES("563","127.0.0.1","superAdmin.report.bestSellerByWarehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:13:48","2024-01-14 16:13:48");
INSERT INTO hitlogs VALUES("564","127.0.0.1","superAdmin.generated::VtSyVKvxq8nnQbFg","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/best_seller","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:16:46","2024-01-14 16:16:46");
INSERT INTO hitlogs VALUES("565","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:26:59","2024-01-14 16:26:59");
INSERT INTO hitlogs VALUES("566","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:27:10","2024-01-14 16:27:10");
INSERT INTO hitlogs VALUES("567","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:28:03","2024-01-14 16:28:03");
INSERT INTO hitlogs VALUES("568","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:28:04","2024-01-14 16:28:04");
INSERT INTO hitlogs VALUES("569","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:28:19","2024-01-14 16:28:19");
INSERT INTO hitlogs VALUES("570","127.0.0.1","superAdmin.index","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:07","2024-01-14 16:34:07");
INSERT INTO hitlogs VALUES("571","127.0.0.1","superAdmin.return-sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:19","2024-01-14 16:34:19");
INSERT INTO hitlogs VALUES("572","127.0.0.1","superAdmin.return-sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:23","2024-01-14 16:34:23");
INSERT INTO hitlogs VALUES("573","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:32","2024-01-14 16:34:32");
INSERT INTO hitlogs VALUES("574","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:40","2024-01-14 16:34:40");
INSERT INTO hitlogs VALUES("575","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:34:56","2024-01-14 16:34:56");
INSERT INTO hitlogs VALUES("576","127.0.0.1","superAdmin.index","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:35:18","2024-01-14 16:35:18");
INSERT INTO hitlogs VALUES("577","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:35:35","2024-01-14 16:35:35");
INSERT INTO hitlogs VALUES("578","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:37:12","2024-01-14 16:37:12");
INSERT INTO hitlogs VALUES("579","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:58:05","2024-01-14 16:58:05");
INSERT INTO hitlogs VALUES("580","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:58:17","2024-01-14 16:58:17");
INSERT INTO hitlogs VALUES("581","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 16:59:26","2024-01-14 16:59:26");
INSERT INTO hitlogs VALUES("582","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 17:01:20","2024-01-14 17:01:20");
INSERT INTO hitlogs VALUES("583","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 17:02:58","2024-01-14 17:02:58");
INSERT INTO hitlogs VALUES("584","127.0.0.1","superAdmin.report.saleChart","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/report/sale-report-chart","Desktop","","Windows","Null","Null","","Win64;","2024-01-14 17:05:56","2024-01-14 17:05:56");
INSERT INTO hitlogs VALUES("585","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-15 15:41:03","2024-01-15 15:41:03");
INSERT INTO hitlogs VALUES("586","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 11:46:44","2024-01-16 11:46:44");
INSERT INTO hitlogs VALUES("587","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 11:54:03","2024-01-16 11:54:03");
INSERT INTO hitlogs VALUES("588","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 11:54:11","2024-01-16 11:54:11");
INSERT INTO hitlogs VALUES("589","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 12:28:28","2024-01-16 12:28:28");
INSERT INTO hitlogs VALUES("590","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:21:16","2024-01-16 14:21:16");
INSERT INTO hitlogs VALUES("591","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:21:22","2024-01-16 14:21:22");
INSERT INTO hitlogs VALUES("592","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:21:28","2024-01-16 14:21:28");
INSERT INTO hitlogs VALUES("593","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:27:54","2024-01-16 14:27:54");
INSERT INTO hitlogs VALUES("594","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:31:24","2024-01-16 14:31:24");
INSERT INTO hitlogs VALUES("595","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:33:02","2024-01-16 14:33:02");
INSERT INTO hitlogs VALUES("596","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:37:16","2024-01-16 14:37:16");
INSERT INTO hitlogs VALUES("597","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:51:50","2024-01-16 14:51:50");
INSERT INTO hitlogs VALUES("598","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:52:18","2024-01-16 14:52:18");
INSERT INTO hitlogs VALUES("599","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 14:52:19","2024-01-16 14:52:19");
INSERT INTO hitlogs VALUES("600","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:08:11","2024-01-16 15:08:11");
INSERT INTO hitlogs VALUES("601","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:08:14","2024-01-16 15:08:14");
INSERT INTO hitlogs VALUES("602","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:08:15","2024-01-16 15:08:15");
INSERT INTO hitlogs VALUES("603","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:08:48","2024-01-16 15:08:48");
INSERT INTO hitlogs VALUES("604","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:08:58","2024-01-16 15:08:58");
INSERT INTO hitlogs VALUES("605","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:01","2024-01-16 15:09:01");
INSERT INTO hitlogs VALUES("606","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:01","2024-01-16 15:09:01");
INSERT INTO hitlogs VALUES("607","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:13","2024-01-16 15:09:13");
INSERT INTO hitlogs VALUES("608","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:16","2024-01-16 15:09:16");
INSERT INTO hitlogs VALUES("609","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:18","2024-01-16 15:09:18");
INSERT INTO hitlogs VALUES("610","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:22","2024-01-16 15:09:22");
INSERT INTO hitlogs VALUES("611","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:28","2024-01-16 15:09:28");
INSERT INTO hitlogs VALUES("612","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:47","2024-01-16 15:09:47");
INSERT INTO hitlogs VALUES("613","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:48","2024-01-16 15:09:48");
INSERT INTO hitlogs VALUES("614","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:50","2024-01-16 15:09:50");
INSERT INTO hitlogs VALUES("615","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:53","2024-01-16 15:09:53");
INSERT INTO hitlogs VALUES("616","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:56","2024-01-16 15:09:56");
INSERT INTO hitlogs VALUES("617","127.0.0.1","superAdmin.purchase.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:09:58","2024-01-16 15:09:58");
INSERT INTO hitlogs VALUES("618","127.0.0.1","superAdmin.purchase.search","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.search","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:13","2024-01-16 15:10:13");
INSERT INTO hitlogs VALUES("619","127.0.0.1","superAdmin.purchase.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:20","2024-01-16 15:10:20");
INSERT INTO hitlogs VALUES("620","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:20","2024-01-16 15:10:20");
INSERT INTO hitlogs VALUES("621","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:23","2024-01-16 15:10:23");
INSERT INTO hitlogs VALUES("622","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:26","2024-01-16 15:10:26");
INSERT INTO hitlogs VALUES("623","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:29","2024-01-16 15:10:29");
INSERT INTO hitlogs VALUES("624","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:32","2024-01-16 15:10:32");
INSERT INTO hitlogs VALUES("625","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:39","2024-01-16 15:10:39");
INSERT INTO hitlogs VALUES("626","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:42","2024-01-16 15:10:42");
INSERT INTO hitlogs VALUES("627","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:10:42","2024-01-16 15:10:42");
INSERT INTO hitlogs VALUES("628","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:26:53","2024-01-16 15:26:53");
INSERT INTO hitlogs VALUES("629","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:03","2024-01-16 15:27:03");
INSERT INTO hitlogs VALUES("630","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:05","2024-01-16 15:27:05");
INSERT INTO hitlogs VALUES("631","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:05","2024-01-16 15:27:05");
INSERT INTO hitlogs VALUES("632","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:15","2024-01-16 15:27:15");
INSERT INTO hitlogs VALUES("633","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:27","2024-01-16 15:27:27");
INSERT INTO hitlogs VALUES("634","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:28","2024-01-16 15:27:28");
INSERT INTO hitlogs VALUES("635","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:27:29","2024-01-16 15:27:29");
INSERT INTO hitlogs VALUES("636","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:29:46","2024-01-16 15:29:46");
INSERT INTO hitlogs VALUES("637","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:29:58","2024-01-16 15:29:58");
INSERT INTO hitlogs VALUES("638","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:29:58","2024-01-16 15:29:58");
INSERT INTO hitlogs VALUES("639","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:29:59","2024-01-16 15:29:59");
INSERT INTO hitlogs VALUES("640","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:30:15","2024-01-16 15:30:15");
INSERT INTO hitlogs VALUES("641","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:30:28","2024-01-16 15:30:28");
INSERT INTO hitlogs VALUES("642","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:30:29","2024-01-16 15:30:29");
INSERT INTO hitlogs VALUES("643","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:30:29","2024-01-16 15:30:29");
INSERT INTO hitlogs VALUES("644","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:31:54","2024-01-16 15:31:54");
INSERT INTO hitlogs VALUES("645","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:32:04","2024-01-16 15:32:04");
INSERT INTO hitlogs VALUES("646","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:32:06","2024-01-16 15:32:06");
INSERT INTO hitlogs VALUES("647","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:32:06","2024-01-16 15:32:06");
INSERT INTO hitlogs VALUES("648","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:32:19","2024-01-16 15:32:19");
INSERT INTO hitlogs VALUES("649","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:32:20","2024-01-16 15:32:20");
INSERT INTO hitlogs VALUES("650","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:34:22","2024-01-16 15:34:22");
INSERT INTO hitlogs VALUES("651","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:34:23","2024-01-16 15:34:23");
INSERT INTO hitlogs VALUES("652","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:34:59","2024-01-16 15:34:59");
INSERT INTO hitlogs VALUES("653","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:35:00","2024-01-16 15:35:00");
INSERT INTO hitlogs VALUES("654","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:35:25","2024-01-16 15:35:25");
INSERT INTO hitlogs VALUES("655","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:35:26","2024-01-16 15:35:26");
INSERT INTO hitlogs VALUES("656","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:06","2024-01-16 15:36:06");
INSERT INTO hitlogs VALUES("657","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:13","2024-01-16 15:36:13");
INSERT INTO hitlogs VALUES("658","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:23","2024-01-16 15:36:23");
INSERT INTO hitlogs VALUES("659","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:25","2024-01-16 15:36:25");
INSERT INTO hitlogs VALUES("660","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:25","2024-01-16 15:36:25");
INSERT INTO hitlogs VALUES("661","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:33","2024-01-16 15:36:33");
INSERT INTO hitlogs VALUES("662","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:39","2024-01-16 15:36:39");
INSERT INTO hitlogs VALUES("663","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:42","2024-01-16 15:36:42");
INSERT INTO hitlogs VALUES("664","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:46","2024-01-16 15:36:46");
INSERT INTO hitlogs VALUES("665","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:50","2024-01-16 15:36:50");
INSERT INTO hitlogs VALUES("666","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:50","2024-01-16 15:36:50");
INSERT INTO hitlogs VALUES("667","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:36:58","2024-01-16 15:36:58");
INSERT INTO hitlogs VALUES("668","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:01","2024-01-16 15:37:01");
INSERT INTO hitlogs VALUES("669","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:04","2024-01-16 15:37:04");
INSERT INTO hitlogs VALUES("670","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:09","2024-01-16 15:37:09");
INSERT INTO hitlogs VALUES("671","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:16","2024-01-16 15:37:16");
INSERT INTO hitlogs VALUES("672","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:17","2024-01-16 15:37:17");
INSERT INTO hitlogs VALUES("673","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:18","2024-01-16 15:37:18");
INSERT INTO hitlogs VALUES("674","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:27","2024-01-16 15:37:27");
INSERT INTO hitlogs VALUES("675","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:37:32","2024-01-16 15:37:32");
INSERT INTO hitlogs VALUES("676","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:20","2024-01-16 15:38:20");
INSERT INTO hitlogs VALUES("677","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:23","2024-01-16 15:38:23");
INSERT INTO hitlogs VALUES("678","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:26","2024-01-16 15:38:26");
INSERT INTO hitlogs VALUES("679","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:29","2024-01-16 15:38:29");
INSERT INTO hitlogs VALUES("680","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:37","2024-01-16 15:38:37");
INSERT INTO hitlogs VALUES("681","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:54","2024-01-16 15:38:54");
INSERT INTO hitlogs VALUES("682","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:55","2024-01-16 15:38:55");
INSERT INTO hitlogs VALUES("683","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:38:58","2024-01-16 15:38:58");
INSERT INTO hitlogs VALUES("684","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:03","2024-01-16 15:39:03");
INSERT INTO hitlogs VALUES("685","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:06","2024-01-16 15:39:06");
INSERT INTO hitlogs VALUES("686","127.0.0.1","superAdmin.purchase.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:08","2024-01-16 15:39:08");
INSERT INTO hitlogs VALUES("687","127.0.0.1","superAdmin.purchase.search","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.search","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:26","2024-01-16 15:39:26");
INSERT INTO hitlogs VALUES("688","127.0.0.1","superAdmin.purchase.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:32","2024-01-16 15:39:32");
INSERT INTO hitlogs VALUES("689","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:33","2024-01-16 15:39:33");
INSERT INTO hitlogs VALUES("690","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:36","2024-01-16 15:39:36");
INSERT INTO hitlogs VALUES("691","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:39","2024-01-16 15:39:39");
INSERT INTO hitlogs VALUES("692","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:42","2024-01-16 15:39:42");
INSERT INTO hitlogs VALUES("693","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:47","2024-01-16 15:39:47");
INSERT INTO hitlogs VALUES("694","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:53","2024-01-16 15:39:53");
INSERT INTO hitlogs VALUES("695","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:39:59","2024-01-16 15:39:59");
INSERT INTO hitlogs VALUES("696","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:40:00","2024-01-16 15:40:00");
INSERT INTO hitlogs VALUES("697","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:40:53","2024-01-16 15:40:53");
INSERT INTO hitlogs VALUES("698","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:41:03","2024-01-16 15:41:03");
INSERT INTO hitlogs VALUES("699","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:41:05","2024-01-16 15:41:05");
INSERT INTO hitlogs VALUES("700","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:41:05","2024-01-16 15:41:05");
INSERT INTO hitlogs VALUES("701","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:41:10","2024-01-16 15:41:10");
INSERT INTO hitlogs VALUES("702","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:41:12","2024-01-16 15:41:12");
INSERT INTO hitlogs VALUES("703","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:42:41","2024-01-16 15:42:41");
INSERT INTO hitlogs VALUES("704","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:43:57","2024-01-16 15:43:57");
INSERT INTO hitlogs VALUES("705","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:44:08","2024-01-16 15:44:08");
INSERT INTO hitlogs VALUES("706","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:44:10","2024-01-16 15:44:10");
INSERT INTO hitlogs VALUES("707","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:44:11","2024-01-16 15:44:11");
INSERT INTO hitlogs VALUES("708","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:44:14","2024-01-16 15:44:14");
INSERT INTO hitlogs VALUES("709","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:44:16","2024-01-16 15:44:16");
INSERT INTO hitlogs VALUES("710","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:45:25","2024-01-16 15:45:25");
INSERT INTO hitlogs VALUES("711","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:54:43","2024-01-16 15:54:43");
INSERT INTO hitlogs VALUES("712","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:54:54","2024-01-16 15:54:54");
INSERT INTO hitlogs VALUES("713","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:54:55","2024-01-16 15:54:55");
INSERT INTO hitlogs VALUES("714","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:54:56","2024-01-16 15:54:56");
INSERT INTO hitlogs VALUES("715","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:55:01","2024-01-16 15:55:01");
INSERT INTO hitlogs VALUES("716","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:55:04","2024-01-16 15:55:04");
INSERT INTO hitlogs VALUES("717","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:56:41","2024-01-16 15:56:41");
INSERT INTO hitlogs VALUES("718","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:56:54","2024-01-16 15:56:54");
INSERT INTO hitlogs VALUES("719","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:56:55","2024-01-16 15:56:55");
INSERT INTO hitlogs VALUES("720","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:56:55","2024-01-16 15:56:55");
INSERT INTO hitlogs VALUES("721","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:57:00","2024-01-16 15:57:00");
INSERT INTO hitlogs VALUES("722","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:57:02","2024-01-16 15:57:02");
INSERT INTO hitlogs VALUES("723","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:57:13","2024-01-16 15:57:13");
INSERT INTO hitlogs VALUES("724","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:57:14","2024-01-16 15:57:14");
INSERT INTO hitlogs VALUES("725","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:58:43","2024-01-16 15:58:43");
INSERT INTO hitlogs VALUES("726","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:58:46","2024-01-16 15:58:46");
INSERT INTO hitlogs VALUES("727","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:58:53","2024-01-16 15:58:53");
INSERT INTO hitlogs VALUES("728","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:05","2024-01-16 15:59:05");
INSERT INTO hitlogs VALUES("729","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:07","2024-01-16 15:59:07");
INSERT INTO hitlogs VALUES("730","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:07","2024-01-16 15:59:07");
INSERT INTO hitlogs VALUES("731","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:12","2024-01-16 15:59:12");
INSERT INTO hitlogs VALUES("732","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:14","2024-01-16 15:59:14");
INSERT INTO hitlogs VALUES("733","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:15","2024-01-16 15:59:15");
INSERT INTO hitlogs VALUES("734","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 15:59:16","2024-01-16 15:59:16");
INSERT INTO hitlogs VALUES("735","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:18","2024-01-16 16:02:18");
INSERT INTO hitlogs VALUES("736","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:19","2024-01-16 16:02:19");
INSERT INTO hitlogs VALUES("737","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:34","2024-01-16 16:02:34");
INSERT INTO hitlogs VALUES("738","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:44","2024-01-16 16:02:44");
INSERT INTO hitlogs VALUES("739","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:46","2024-01-16 16:02:46");
INSERT INTO hitlogs VALUES("740","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:46","2024-01-16 16:02:46");
INSERT INTO hitlogs VALUES("741","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:50","2024-01-16 16:02:50");
INSERT INTO hitlogs VALUES("742","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:52","2024-01-16 16:02:52");
INSERT INTO hitlogs VALUES("743","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/12","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:53","2024-01-16 16:02:53");
INSERT INTO hitlogs VALUES("744","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/12","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:02:54","2024-01-16 16:02:54");
INSERT INTO hitlogs VALUES("745","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/12","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:03:30","2024-01-16 16:03:30");
INSERT INTO hitlogs VALUES("746","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/12","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:04:13","2024-01-16 16:04:13");
INSERT INTO hitlogs VALUES("747","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:04:16","2024-01-16 16:04:16");
INSERT INTO hitlogs VALUES("748","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:04:20","2024-01-16 16:04:20");
INSERT INTO hitlogs VALUES("749","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:04:39","2024-01-16 16:04:39");
INSERT INTO hitlogs VALUES("750","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:05:31","2024-01-16 16:05:31");
INSERT INTO hitlogs VALUES("751","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:08:18","2024-01-16 16:08:18");
INSERT INTO hitlogs VALUES("752","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:08:21","2024-01-16 16:08:21");
INSERT INTO hitlogs VALUES("753","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:21","2024-01-16 16:09:21");
INSERT INTO hitlogs VALUES("754","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:26","2024-01-16 16:09:26");
INSERT INTO hitlogs VALUES("755","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:30","2024-01-16 16:09:30");
INSERT INTO hitlogs VALUES("756","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:40","2024-01-16 16:09:40");
INSERT INTO hitlogs VALUES("757","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:45","2024-01-16 16:09:45");
INSERT INTO hitlogs VALUES("758","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:48","2024-01-16 16:09:48");
INSERT INTO hitlogs VALUES("759","127.0.0.1","superAdmin.sale.getpayment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getpayment/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:09:57","2024-01-16 16:09:57");
INSERT INTO hitlogs VALUES("760","127.0.0.1","superAdmin.sale.update-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.updatepayment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:10:06","2024-01-16 16:10:06");
INSERT INTO hitlogs VALUES("761","127.0.0.1","superAdmin.sale.update-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.updatepayment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:00","2024-01-16 16:12:00");
INSERT INTO hitlogs VALUES("762","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:05","2024-01-16 16:12:05");
INSERT INTO hitlogs VALUES("763","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:08","2024-01-16 16:12:08");
INSERT INTO hitlogs VALUES("764","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:19","2024-01-16 16:12:19");
INSERT INTO hitlogs VALUES("765","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:28","2024-01-16 16:12:28");
INSERT INTO hitlogs VALUES("766","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:31","2024-01-16 16:12:31");
INSERT INTO hitlogs VALUES("767","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/11","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:39","2024-01-16 16:12:39");
INSERT INTO hitlogs VALUES("768","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:48","2024-01-16 16:12:48");
INSERT INTO hitlogs VALUES("769","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:48","2024-01-16 16:12:48");
INSERT INTO hitlogs VALUES("770","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:52","2024-01-16 16:12:52");
INSERT INTO hitlogs VALUES("771","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:56","2024-01-16 16:12:56");
INSERT INTO hitlogs VALUES("772","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:12:59","2024-01-16 16:12:59");
INSERT INTO hitlogs VALUES("773","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:13:07","2024-01-16 16:13:07");
INSERT INTO hitlogs VALUES("774","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:15:44","2024-01-16 16:15:44");
INSERT INTO hitlogs VALUES("775","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:16:39","2024-01-16 16:16:39");
INSERT INTO hitlogs VALUES("776","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:18:07","2024-01-16 16:18:07");
INSERT INTO hitlogs VALUES("777","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:18:44","2024-01-16 16:18:44");
INSERT INTO hitlogs VALUES("778","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 16:19:25","2024-01-16 16:19:25");
INSERT INTO hitlogs VALUES("779","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:02:57","2024-01-16 17:02:57");
INSERT INTO hitlogs VALUES("780","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:11","2024-01-16 17:03:11");
INSERT INTO hitlogs VALUES("781","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:13","2024-01-16 17:03:13");
INSERT INTO hitlogs VALUES("782","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:13","2024-01-16 17:03:13");
INSERT INTO hitlogs VALUES("783","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:17","2024-01-16 17:03:17");
INSERT INTO hitlogs VALUES("784","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:21","2024-01-16 17:03:21");
INSERT INTO hitlogs VALUES("785","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:22","2024-01-16 17:03:22");
INSERT INTO hitlogs VALUES("786","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:24","2024-01-16 17:03:24");
INSERT INTO hitlogs VALUES("787","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:27","2024-01-16 17:03:27");
INSERT INTO hitlogs VALUES("788","127.0.0.1","superAdmin.sale.add-payment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.add_payment","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:39","2024-01-16 17:03:39");
INSERT INTO hitlogs VALUES("789","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:43","2024-01-16 17:03:43");
INSERT INTO hitlogs VALUES("790","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:47","2024-01-16 17:03:47");
INSERT INTO hitlogs VALUES("791","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:03:56","2024-01-16 17:03:56");
INSERT INTO hitlogs VALUES("792","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:05","2024-01-16 17:04:05");
INSERT INTO hitlogs VALUES("793","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:05","2024-01-16 17:04:05");
INSERT INTO hitlogs VALUES("794","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:09","2024-01-16 17:04:09");
INSERT INTO hitlogs VALUES("795","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:26","2024-01-16 17:04:26");
INSERT INTO hitlogs VALUES("796","127.0.0.1","superAdmin.sale.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.edit/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:33","2024-01-16 17:04:33");
INSERT INTO hitlogs VALUES("797","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:36","2024-01-16 17:04:36");
INSERT INTO hitlogs VALUES("798","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:36","2024-01-16 17:04:36");
INSERT INTO hitlogs VALUES("799","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:37","2024-01-16 17:04:37");
INSERT INTO hitlogs VALUES("800","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:44","2024-01-16 17:04:44");
INSERT INTO hitlogs VALUES("801","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:52","2024-01-16 17:04:52");
INSERT INTO hitlogs VALUES("802","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:57","2024-01-16 17:04:57");
INSERT INTO hitlogs VALUES("803","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:04:58","2024-01-16 17:04:58");
INSERT INTO hitlogs VALUES("804","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:05:02","2024-01-16 17:05:02");
INSERT INTO hitlogs VALUES("805","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:30","2024-01-16 17:06:30");
INSERT INTO hitlogs VALUES("806","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:34","2024-01-16 17:06:34");
INSERT INTO hitlogs VALUES("807","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:41","2024-01-16 17:06:41");
INSERT INTO hitlogs VALUES("808","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:45","2024-01-16 17:06:45");
INSERT INTO hitlogs VALUES("809","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:46","2024-01-16 17:06:46");
INSERT INTO hitlogs VALUES("810","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:06:50","2024-01-16 17:06:50");
INSERT INTO hitlogs VALUES("811","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:07:54","2024-01-16 17:07:54");
INSERT INTO hitlogs VALUES("812","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:07:58","2024-01-16 17:07:58");
INSERT INTO hitlogs VALUES("813","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:08:04","2024-01-16 17:08:04");
INSERT INTO hitlogs VALUES("814","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:08:10","2024-01-16 17:08:10");
INSERT INTO hitlogs VALUES("815","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:08:10","2024-01-16 17:08:10");
INSERT INTO hitlogs VALUES("816","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:08:14","2024-01-16 17:08:14");
INSERT INTO hitlogs VALUES("817","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:05","2024-01-16 17:10:05");
INSERT INTO hitlogs VALUES("818","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:08","2024-01-16 17:10:08");
INSERT INTO hitlogs VALUES("819","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:15","2024-01-16 17:10:15");
INSERT INTO hitlogs VALUES("820","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:18","2024-01-16 17:10:18");
INSERT INTO hitlogs VALUES("821","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:18","2024-01-16 17:10:18");
INSERT INTO hitlogs VALUES("822","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:10:22","2024-01-16 17:10:22");
INSERT INTO hitlogs VALUES("823","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:17:51","2024-01-16 17:17:51");
INSERT INTO hitlogs VALUES("824","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:17:58","2024-01-16 17:17:58");
INSERT INTO hitlogs VALUES("825","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:18:03","2024-01-16 17:18:03");
INSERT INTO hitlogs VALUES("826","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:18:07","2024-01-16 17:18:07");
INSERT INTO hitlogs VALUES("827","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:18:07","2024-01-16 17:18:07");
INSERT INTO hitlogs VALUES("828","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:18:11","2024-01-16 17:18:11");
INSERT INTO hitlogs VALUES("829","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:00","2024-01-16 17:23:00");
INSERT INTO hitlogs VALUES("830","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:04","2024-01-16 17:23:04");
INSERT INTO hitlogs VALUES("831","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:16","2024-01-16 17:23:16");
INSERT INTO hitlogs VALUES("832","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:20","2024-01-16 17:23:20");
INSERT INTO hitlogs VALUES("833","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:21","2024-01-16 17:23:21");
INSERT INTO hitlogs VALUES("834","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:23:25","2024-01-16 17:23:25");
INSERT INTO hitlogs VALUES("835","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:12","2024-01-16 17:25:12");
INSERT INTO hitlogs VALUES("836","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:16","2024-01-16 17:25:16");
INSERT INTO hitlogs VALUES("837","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:23","2024-01-16 17:25:23");
INSERT INTO hitlogs VALUES("838","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:25","2024-01-16 17:25:25");
INSERT INTO hitlogs VALUES("839","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:26","2024-01-16 17:25:26");
INSERT INTO hitlogs VALUES("840","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:25:30","2024-01-16 17:25:30");
INSERT INTO hitlogs VALUES("841","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:26:52","2024-01-16 17:26:52");
INSERT INTO hitlogs VALUES("842","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:26:57","2024-01-16 17:26:57");
INSERT INTO hitlogs VALUES("843","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:03","2024-01-16 17:27:03");
INSERT INTO hitlogs VALUES("844","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:06","2024-01-16 17:27:06");
INSERT INTO hitlogs VALUES("845","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:14","2024-01-16 17:27:14");
INSERT INTO hitlogs VALUES("846","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:17","2024-01-16 17:27:17");
INSERT INTO hitlogs VALUES("847","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:17","2024-01-16 17:27:17");
INSERT INTO hitlogs VALUES("848","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:27:21","2024-01-16 17:27:21");
INSERT INTO hitlogs VALUES("849","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:00","2024-01-16 17:28:00");
INSERT INTO hitlogs VALUES("850","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:04","2024-01-16 17:28:04");
INSERT INTO hitlogs VALUES("851","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:12","2024-01-16 17:28:12");
INSERT INTO hitlogs VALUES("852","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:15","2024-01-16 17:28:15");
INSERT INTO hitlogs VALUES("853","127.0.0.1","superAdmin.sale.delivery.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery.create/13","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:21","2024-01-16 17:28:21");
INSERT INTO hitlogs VALUES("854","127.0.0.1","superAdmin.sale.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:25","2024-01-16 17:28:25");
INSERT INTO hitlogs VALUES("855","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:25","2024-01-16 17:28:25");
INSERT INTO hitlogs VALUES("856","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:28:29","2024-01-16 17:28:29");
INSERT INTO hitlogs VALUES("857","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:23","2024-01-16 17:35:23");
INSERT INTO hitlogs VALUES("858","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:27","2024-01-16 17:35:27");
INSERT INTO hitlogs VALUES("859","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:32","2024-01-16 17:35:32");
INSERT INTO hitlogs VALUES("860","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:41","2024-01-16 17:35:41");
INSERT INTO hitlogs VALUES("861","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:43","2024-01-16 17:35:43");
INSERT INTO hitlogs VALUES("862","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:43","2024-01-16 17:35:43");
INSERT INTO hitlogs VALUES("863","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:48","2024-01-16 17:35:48");
INSERT INTO hitlogs VALUES("864","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:50","2024-01-16 17:35:50");
INSERT INTO hitlogs VALUES("865","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/14","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:50","2024-01-16 17:35:50");
INSERT INTO hitlogs VALUES("866","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:53","2024-01-16 17:35:53");
INSERT INTO hitlogs VALUES("867","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-16 17:35:57","2024-01-16 17:35:57");
INSERT INTO hitlogs VALUES("868","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:51:09","2024-01-17 09:51:09");
INSERT INTO hitlogs VALUES("869","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:51:21","2024-01-17 09:51:21");
INSERT INTO hitlogs VALUES("870","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:53:30","2024-01-17 09:53:30");
INSERT INTO hitlogs VALUES("871","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:53:34","2024-01-17 09:53:34");
INSERT INTO hitlogs VALUES("872","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:53:40","2024-01-17 09:53:40");
INSERT INTO hitlogs VALUES("873","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:56:33","2024-01-17 09:56:33");
INSERT INTO hitlogs VALUES("874","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:58:51","2024-01-17 09:58:51");
INSERT INTO hitlogs VALUES("875","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 09:58:58","2024-01-17 09:58:58");
INSERT INTO hitlogs VALUES("876","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:00:22","2024-01-17 10:00:22");
INSERT INTO hitlogs VALUES("877","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:00:24","2024-01-17 10:00:24");
INSERT INTO hitlogs VALUES("878","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:01:53","2024-01-17 10:01:53");
INSERT INTO hitlogs VALUES("879","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:20:17","2024-01-17 10:20:17");
INSERT INTO hitlogs VALUES("880","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:23:14","2024-01-17 10:23:14");
INSERT INTO hitlogs VALUES("881","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:24:21","2024-01-17 10:24:21");
INSERT INTO hitlogs VALUES("882","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:24:47","2024-01-17 10:24:47");
INSERT INTO hitlogs VALUES("883","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:25:27","2024-01-17 10:25:27");
INSERT INTO hitlogs VALUES("884","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:25:30","2024-01-17 10:25:30");
INSERT INTO hitlogs VALUES("885","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:26:46","2024-01-17 10:26:46");
INSERT INTO hitlogs VALUES("886","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:26:47","2024-01-17 10:26:47");
INSERT INTO hitlogs VALUES("887","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:27:09","2024-01-17 10:27:09");
INSERT INTO hitlogs VALUES("888","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:27:13","2024-01-17 10:27:13");
INSERT INTO hitlogs VALUES("889","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:27:17","2024-01-17 10:27:17");
INSERT INTO hitlogs VALUES("890","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:27:19","2024-01-17 10:27:19");
INSERT INTO hitlogs VALUES("891","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:32:25","2024-01-17 10:32:25");
INSERT INTO hitlogs VALUES("892","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:32:30","2024-01-17 10:32:30");
INSERT INTO hitlogs VALUES("893","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:32:49","2024-01-17 10:32:49");
INSERT INTO hitlogs VALUES("894","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:32:51","2024-01-17 10:32:51");
INSERT INTO hitlogs VALUES("895","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:10","2024-01-17 10:33:10");
INSERT INTO hitlogs VALUES("896","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:15","2024-01-17 10:33:15");
INSERT INTO hitlogs VALUES("897","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:16","2024-01-17 10:33:16");
INSERT INTO hitlogs VALUES("898","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:18","2024-01-17 10:33:18");
INSERT INTO hitlogs VALUES("899","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:20","2024-01-17 10:33:20");
INSERT INTO hitlogs VALUES("900","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:33:24","2024-01-17 10:33:24");
INSERT INTO hitlogs VALUES("901","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:34:59","2024-01-17 10:34:59");
INSERT INTO hitlogs VALUES("902","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:10","2024-01-17 10:38:10");
INSERT INTO hitlogs VALUES("903","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:14","2024-01-17 10:38:14");
INSERT INTO hitlogs VALUES("904","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:19","2024-01-17 10:38:19");
INSERT INTO hitlogs VALUES("905","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:43","2024-01-17 10:38:43");
INSERT INTO hitlogs VALUES("906","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:47","2024-01-17 10:38:47");
INSERT INTO hitlogs VALUES("907","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:47","2024-01-17 10:38:47");
INSERT INTO hitlogs VALUES("908","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:38:48","2024-01-17 10:38:48");
INSERT INTO hitlogs VALUES("909","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:40:55","2024-01-17 10:40:55");
INSERT INTO hitlogs VALUES("910","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:41:04","2024-01-17 10:41:04");
INSERT INTO hitlogs VALUES("911","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:42:48","2024-01-17 10:42:48");
INSERT INTO hitlogs VALUES("912","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:42:51","2024-01-17 10:42:51");
INSERT INTO hitlogs VALUES("913","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:24","2024-01-17 10:43:24");
INSERT INTO hitlogs VALUES("914","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:27","2024-01-17 10:43:27");
INSERT INTO hitlogs VALUES("915","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:49","2024-01-17 10:43:49");
INSERT INTO hitlogs VALUES("916","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:53","2024-01-17 10:43:53");
INSERT INTO hitlogs VALUES("917","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:53","2024-01-17 10:43:53");
INSERT INTO hitlogs VALUES("918","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:43:54","2024-01-17 10:43:54");
INSERT INTO hitlogs VALUES("919","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:44:50","2024-01-17 10:44:50");
INSERT INTO hitlogs VALUES("920","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:44:54","2024-01-17 10:44:54");
INSERT INTO hitlogs VALUES("921","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:44:55","2024-01-17 10:44:55");
INSERT INTO hitlogs VALUES("922","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:44:55","2024-01-17 10:44:55");
INSERT INTO hitlogs VALUES("923","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:46:15","2024-01-17 10:46:15");
INSERT INTO hitlogs VALUES("924","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:46:21","2024-01-17 10:46:21");
INSERT INTO hitlogs VALUES("925","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:46:22","2024-01-17 10:46:22");
INSERT INTO hitlogs VALUES("926","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:46:22","2024-01-17 10:46:22");
INSERT INTO hitlogs VALUES("927","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 10:46:25","2024-01-17 10:46:25");
INSERT INTO hitlogs VALUES("928","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:08:48","2024-01-17 11:08:48");
INSERT INTO hitlogs VALUES("929","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:15:44","2024-01-17 11:15:44");
INSERT INTO hitlogs VALUES("930","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:15:48","2024-01-17 11:15:48");
INSERT INTO hitlogs VALUES("931","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:15:49","2024-01-17 11:15:49");
INSERT INTO hitlogs VALUES("932","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:15:49","2024-01-17 11:15:49");
INSERT INTO hitlogs VALUES("933","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:15:55","2024-01-17 11:15:55");
INSERT INTO hitlogs VALUES("934","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:16:10","2024-01-17 11:16:10");
INSERT INTO hitlogs VALUES("935","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:16:12","2024-01-17 11:16:12");
INSERT INTO hitlogs VALUES("936","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:17:53","2024-01-17 11:17:53");
INSERT INTO hitlogs VALUES("937","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:17:59","2024-01-17 11:17:59");
INSERT INTO hitlogs VALUES("938","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:18:53","2024-01-17 11:18:53");
INSERT INTO hitlogs VALUES("939","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:22","2024-01-17 11:20:22");
INSERT INTO hitlogs VALUES("940","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:27","2024-01-17 11:20:27");
INSERT INTO hitlogs VALUES("941","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:27","2024-01-17 11:20:27");
INSERT INTO hitlogs VALUES("942","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:27","2024-01-17 11:20:27");
INSERT INTO hitlogs VALUES("943","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/1/0","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:34","2024-01-17 11:20:34");
INSERT INTO hitlogs VALUES("944","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:39","2024-01-17 11:20:39");
INSERT INTO hitlogs VALUES("945","127.0.0.1","superAdmin.generated::THqq7D2FbSqMeQlk","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProductFilter/0/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:20:42","2024-01-17 11:20:42");
INSERT INTO hitlogs VALUES("946","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:22:38","2024-01-17 11:22:38");
INSERT INTO hitlogs VALUES("947","127.0.0.1","superAdmin.index","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:31:40","2024-01-17 11:31:40");
INSERT INTO hitlogs VALUES("948","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:21","2024-01-17 11:37:21");
INSERT INTO hitlogs VALUES("949","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:27","2024-01-17 11:37:27");
INSERT INTO hitlogs VALUES("950","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:32","2024-01-17 11:37:32");
INSERT INTO hitlogs VALUES("951","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:44","2024-01-17 11:37:44");
INSERT INTO hitlogs VALUES("952","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:46","2024-01-17 11:37:46");
INSERT INTO hitlogs VALUES("953","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:46","2024-01-17 11:37:46");
INSERT INTO hitlogs VALUES("954","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:52","2024-01-17 11:37:52");
INSERT INTO hitlogs VALUES("955","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:54","2024-01-17 11:37:54");
INSERT INTO hitlogs VALUES("956","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/15","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:37:56","2024-01-17 11:37:56");
INSERT INTO hitlogs VALUES("957","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:38:06","2024-01-17 11:38:06");
INSERT INTO hitlogs VALUES("958","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:38:14","2024-01-17 11:38:14");
INSERT INTO hitlogs VALUES("959","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:29","2024-01-17 11:41:29");
INSERT INTO hitlogs VALUES("960","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:33","2024-01-17 11:41:33");
INSERT INTO hitlogs VALUES("961","127.0.0.1","superAdmin.sale.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:36","2024-01-17 11:41:36");
INSERT INTO hitlogs VALUES("962","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:45","2024-01-17 11:41:45");
INSERT INTO hitlogs VALUES("963","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:46","2024-01-17 11:41:46");
INSERT INTO hitlogs VALUES("964","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:47","2024-01-17 11:41:47");
INSERT INTO hitlogs VALUES("965","127.0.0.1","superAdmin.sale.productSearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.productSearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:53","2024-01-17 11:41:53");
INSERT INTO hitlogs VALUES("966","127.0.0.1","superAdmin.sale.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:55","2024-01-17 11:41:55");
INSERT INTO hitlogs VALUES("967","127.0.0.1","superAdmin.sale.invoice","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.invoice/16","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:41:56","2024-01-17 11:41:56");
INSERT INTO hitlogs VALUES("968","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:56:16","2024-01-17 11:56:16");
INSERT INTO hitlogs VALUES("969","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:56:23","2024-01-17 11:56:23");
INSERT INTO hitlogs VALUES("970","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 11:57:02","2024-01-17 11:57:02");
INSERT INTO hitlogs VALUES("971","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 13:16:23","2024-01-17 13:16:23");
INSERT INTO hitlogs VALUES("972","127.0.0.1","superAdmin.ganeralsetting.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 13:17:06","2024-01-17 13:17:06");
INSERT INTO hitlogs VALUES("973","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 13:17:07","2024-01-17 13:17:07");
INSERT INTO hitlogs VALUES("974","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:19:58","2024-01-17 15:19:58");
INSERT INTO hitlogs VALUES("975","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:20:19","2024-01-17 15:20:19");
INSERT INTO hitlogs VALUES("976","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:20:20","2024-01-17 15:20:20");
INSERT INTO hitlogs VALUES("977","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:21:49","2024-01-17 15:21:49");
INSERT INTO hitlogs VALUES("978","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:23:47","2024-01-17 15:23:47");
INSERT INTO hitlogs VALUES("979","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:30:15","2024-01-17 15:30:15");
INSERT INTO hitlogs VALUES("980","127.0.0.1","superAdmin.ganeralsetting.sendSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.sendSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:31:46","2024-01-17 15:31:46");
INSERT INTO hitlogs VALUES("981","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:31:47","2024-01-17 15:31:47");
INSERT INTO hitlogs VALUES("982","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:41:12","2024-01-17 15:41:12");
INSERT INTO hitlogs VALUES("983","127.0.0.1","superAdmin.ganeralsetting.sms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.sms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 15:41:24","2024-01-17 15:41:24");
INSERT INTO hitlogs VALUES("984","127.0.0.1","superAdmin.ganeralsetting.sms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.sms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:02:29","2024-01-17 16:02:29");
INSERT INTO hitlogs VALUES("985","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:02:49","2024-01-17 16:02:49");
INSERT INTO hitlogs VALUES("986","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:03:23","2024-01-17 16:03:23");
INSERT INTO hitlogs VALUES("987","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:03:31","2024-01-17 16:03:31");
INSERT INTO hitlogs VALUES("988","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:04:06","2024-01-17 16:04:06");
INSERT INTO hitlogs VALUES("989","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:04:08","2024-01-17 16:04:08");
INSERT INTO hitlogs VALUES("990","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:05:28","2024-01-17 16:05:28");
INSERT INTO hitlogs VALUES("991","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:05:31","2024-01-17 16:05:31");
INSERT INTO hitlogs VALUES("992","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:06:05","2024-01-17 16:06:05");
INSERT INTO hitlogs VALUES("993","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:06:07","2024-01-17 16:06:07");
INSERT INTO hitlogs VALUES("994","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:08:44","2024-01-17 16:08:44");
INSERT INTO hitlogs VALUES("995","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:09:48","2024-01-17 16:09:48");
INSERT INTO hitlogs VALUES("996","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:18:05","2024-01-17 16:18:05");
INSERT INTO hitlogs VALUES("997","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:18:06","2024-01-17 16:18:06");
INSERT INTO hitlogs VALUES("998","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:18:41","2024-01-17 16:18:41");
INSERT INTO hitlogs VALUES("999","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:20:57","2024-01-17 16:20:57");
INSERT INTO hitlogs VALUES("1000","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:23:02","2024-01-17 16:23:02");
INSERT INTO hitlogs VALUES("1001","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:23:13","2024-01-17 16:23:13");
INSERT INTO hitlogs VALUES("1002","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:23:39","2024-01-17 16:23:39");
INSERT INTO hitlogs VALUES("1003","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:23:58","2024-01-17 16:23:58");
INSERT INTO hitlogs VALUES("1004","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:24:46","2024-01-17 16:24:46");
INSERT INTO hitlogs VALUES("1005","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:24:55","2024-01-17 16:24:55");
INSERT INTO hitlogs VALUES("1006","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 16:35:27","2024-01-17 16:35:27");
INSERT INTO hitlogs VALUES("1007","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:04:20","2024-01-17 17:04:20");
INSERT INTO hitlogs VALUES("1008","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:04:43","2024-01-17 17:04:43");
INSERT INTO hitlogs VALUES("1009","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:04:57","2024-01-17 17:04:57");
INSERT INTO hitlogs VALUES("1010","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:10:17","2024-01-17 17:10:17");
INSERT INTO hitlogs VALUES("1011","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:10:55","2024-01-17 17:10:55");
INSERT INTO hitlogs VALUES("1012","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:12:33","2024-01-17 17:12:33");
INSERT INTO hitlogs VALUES("1013","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:13:27","2024-01-17 17:13:27");
INSERT INTO hitlogs VALUES("1014","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:15:30","2024-01-17 17:15:30");
INSERT INTO hitlogs VALUES("1015","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:15:44","2024-01-17 17:15:44");
INSERT INTO hitlogs VALUES("1016","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:16:33","2024-01-17 17:16:33");
INSERT INTO hitlogs VALUES("1017","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:16:59","2024-01-17 17:16:59");
INSERT INTO hitlogs VALUES("1018","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:17:08","2024-01-17 17:17:08");
INSERT INTO hitlogs VALUES("1019","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:18:15","2024-01-17 17:18:15");
INSERT INTO hitlogs VALUES("1020","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:18:49","2024-01-17 17:18:49");
INSERT INTO hitlogs VALUES("1021","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:20:34","2024-01-17 17:20:34");
INSERT INTO hitlogs VALUES("1022","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:20:58","2024-01-17 17:20:58");
INSERT INTO hitlogs VALUES("1023","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:22:21","2024-01-17 17:22:21");
INSERT INTO hitlogs VALUES("1024","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:22:37","2024-01-17 17:22:37");
INSERT INTO hitlogs VALUES("1025","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:22:54","2024-01-17 17:22:54");
INSERT INTO hitlogs VALUES("1026","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:27:23","2024-01-17 17:27:23");
INSERT INTO hitlogs VALUES("1027","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:27:40","2024-01-17 17:27:40");
INSERT INTO hitlogs VALUES("1028","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/blue.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:27:46","2024-01-17 17:27:46");
INSERT INTO hitlogs VALUES("1029","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:29:57","2024-01-17 17:29:57");
INSERT INTO hitlogs VALUES("1030","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/blue.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:29:58","2024-01-17 17:29:58");
INSERT INTO hitlogs VALUES("1031","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/dark.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:29:59","2024-01-17 17:29:59");
INSERT INTO hitlogs VALUES("1032","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:31:36","2024-01-17 17:31:36");
INSERT INTO hitlogs VALUES("1033","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:36:17","2024-01-17 17:36:17");
INSERT INTO hitlogs VALUES("1034","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:36:20","2024-01-17 17:36:20");
INSERT INTO hitlogs VALUES("1035","127.0.0.1","superAdmin.ganeralsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-17 17:36:39","2024-01-17 17:36:39");
INSERT INTO hitlogs VALUES("1036","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:44:23","2024-01-18 09:44:23");
INSERT INTO hitlogs VALUES("1037","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:44:35","2024-01-18 09:44:35");
INSERT INTO hitlogs VALUES("1038","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:47:42","2024-01-18 09:47:42");
INSERT INTO hitlogs VALUES("1039","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:47:46","2024-01-18 09:47:46");
INSERT INTO hitlogs VALUES("1040","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:50:45","2024-01-18 09:50:45");
INSERT INTO hitlogs VALUES("1041","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:50:58","2024-01-18 09:50:58");
INSERT INTO hitlogs VALUES("1042","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 09:51:06","2024-01-18 09:51:06");
INSERT INTO hitlogs VALUES("1043","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:15:39","2024-01-18 10:15:39");
INSERT INTO hitlogs VALUES("1044","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:19:49","2024-01-18 10:19:49");
INSERT INTO hitlogs VALUES("1045","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:19:57","2024-01-18 10:19:57");
INSERT INTO hitlogs VALUES("1046","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:21:21","2024-01-18 10:21:21");
INSERT INTO hitlogs VALUES("1047","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:22:38","2024-01-18 10:22:38");
INSERT INTO hitlogs VALUES("1048","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:26:08","2024-01-18 10:26:08");
INSERT INTO hitlogs VALUES("1049","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:26:13","2024-01-18 10:26:13");
INSERT INTO hitlogs VALUES("1050","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:26:35","2024-01-18 10:26:35");
INSERT INTO hitlogs VALUES("1051","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:27:38","2024-01-18 10:27:38");
INSERT INTO hitlogs VALUES("1052","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:27:51","2024-01-18 10:27:51");
INSERT INTO hitlogs VALUES("1053","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:28:34","2024-01-18 10:28:34");
INSERT INTO hitlogs VALUES("1054","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:28:45","2024-01-18 10:28:45");
INSERT INTO hitlogs VALUES("1055","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:28:46","2024-01-18 10:28:46");
INSERT INTO hitlogs VALUES("1056","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:30:04","2024-01-18 10:30:04");
INSERT INTO hitlogs VALUES("1057","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:30:10","2024-01-18 10:30:10");
INSERT INTO hitlogs VALUES("1058","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:30:10","2024-01-18 10:30:10");
INSERT INTO hitlogs VALUES("1059","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:33:21","2024-01-18 10:33:21");
INSERT INTO hitlogs VALUES("1060","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:33:46","2024-01-18 10:33:46");
INSERT INTO hitlogs VALUES("1061","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:33:46","2024-01-18 10:33:46");
INSERT INTO hitlogs VALUES("1062","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:35:23","2024-01-18 10:35:23");
INSERT INTO hitlogs VALUES("1063","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:37:06","2024-01-18 10:37:06");
INSERT INTO hitlogs VALUES("1064","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:42:12","2024-01-18 10:42:12");
INSERT INTO hitlogs VALUES("1065","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:42:13","2024-01-18 10:42:13");
INSERT INTO hitlogs VALUES("1066","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:05","2024-01-18 10:46:05");
INSERT INTO hitlogs VALUES("1067","127.0.0.1","superAdmin.ganeralsetting.superadminsettingStore","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsettingStore","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:12","2024-01-18 10:46:12");
INSERT INTO hitlogs VALUES("1068","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:13","2024-01-18 10:46:13");
INSERT INTO hitlogs VALUES("1069","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:19","2024-01-18 10:46:19");
INSERT INTO hitlogs VALUES("1070","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:40","2024-01-18 10:46:40");
INSERT INTO hitlogs VALUES("1071","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:46:47","2024-01-18 10:46:47");
INSERT INTO hitlogs VALUES("1072","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:49:30","2024-01-18 10:49:30");
INSERT INTO hitlogs VALUES("1073","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:49:36","2024-01-18 10:49:36");
INSERT INTO hitlogs VALUES("1074","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:50:13","2024-01-18 10:50:13");
INSERT INTO hitlogs VALUES("1075","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 10:50:22","2024-01-18 10:50:22");
INSERT INTO hitlogs VALUES("1076","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:00:16","2024-01-18 11:00:16");
INSERT INTO hitlogs VALUES("1077","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/default.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:01:08","2024-01-18 11:01:08");
INSERT INTO hitlogs VALUES("1078","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:01:41","2024-01-18 11:01:41");
INSERT INTO hitlogs VALUES("1079","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:02:00","2024-01-18 11:02:00");
INSERT INTO hitlogs VALUES("1080","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:02:15","2024-01-18 11:02:15");
INSERT INTO hitlogs VALUES("1081","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/green.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:02:24","2024-01-18 11:02:24");
INSERT INTO hitlogs VALUES("1082","127.0.0.1","superAdmin.generated::VFJpUB5n0ThhTDRj","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/general_setting/change-theme/dark.css","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:02:47","2024-01-18 11:02:47");
INSERT INTO hitlogs VALUES("1083","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:09:47","2024-01-18 11:09:47");
INSERT INTO hitlogs VALUES("1084","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:10:14","2024-01-18 11:10:14");
INSERT INTO hitlogs VALUES("1085","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:10:24","2024-01-18 11:10:24");
INSERT INTO hitlogs VALUES("1086","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:10:40","2024-01-18 11:10:40");
INSERT INTO hitlogs VALUES("1087","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:10:50","2024-01-18 11:10:50");
INSERT INTO hitlogs VALUES("1088","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:11:01","2024-01-18 11:11:01");
INSERT INTO hitlogs VALUES("1089","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:11:47","2024-01-18 11:11:47");
INSERT INTO hitlogs VALUES("1090","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:11:59","2024-01-18 11:11:59");
INSERT INTO hitlogs VALUES("1091","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:12:48","2024-01-18 11:12:48");
INSERT INTO hitlogs VALUES("1092","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:13:00","2024-01-18 11:13:00");
INSERT INTO hitlogs VALUES("1093","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:14:28","2024-01-18 11:14:28");
INSERT INTO hitlogs VALUES("1094","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:15:46","2024-01-18 11:15:46");
INSERT INTO hitlogs VALUES("1095","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:15:57","2024-01-18 11:15:57");
INSERT INTO hitlogs VALUES("1096","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:16:39","2024-01-18 11:16:39");
INSERT INTO hitlogs VALUES("1097","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:19:03","2024-01-18 11:19:03");
INSERT INTO hitlogs VALUES("1098","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:19:17","2024-01-18 11:19:17");
INSERT INTO hitlogs VALUES("1099","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:19:31","2024-01-18 11:19:31");
INSERT INTO hitlogs VALUES("1100","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:23:22","2024-01-18 11:23:22");
INSERT INTO hitlogs VALUES("1101","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:23:40","2024-01-18 11:23:40");
INSERT INTO hitlogs VALUES("1102","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:24:24","2024-01-18 11:24:24");
INSERT INTO hitlogs VALUES("1103","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:27:24","2024-01-18 11:27:24");
INSERT INTO hitlogs VALUES("1104","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 11:28:22","2024-01-18 11:28:22");
INSERT INTO hitlogs VALUES("1105","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 14:00:49","2024-01-18 14:00:49");
INSERT INTO hitlogs VALUES("1106","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 14:00:58","2024-01-18 14:00:58");
INSERT INTO hitlogs VALUES("1107","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 14:02:59","2024-01-18 14:02:59");
INSERT INTO hitlogs VALUES("1108","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 14:03:03","2024-01-18 14:03:03");
INSERT INTO hitlogs VALUES("1109","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:38:02","2024-01-18 15:38:02");
INSERT INTO hitlogs VALUES("1110","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:40:24","2024-01-18 15:40:24");
INSERT INTO hitlogs VALUES("1111","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:40:28","2024-01-18 15:40:28");
INSERT INTO hitlogs VALUES("1112","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:40:34","2024-01-18 15:40:34");
INSERT INTO hitlogs VALUES("1113","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:44:03","2024-01-18 15:44:03");
INSERT INTO hitlogs VALUES("1114","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:44:05","2024-01-18 15:44:05");
INSERT INTO hitlogs VALUES("1115","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:46:04","2024-01-18 15:46:04");
INSERT INTO hitlogs VALUES("1116","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:46:05","2024-01-18 15:46:05");
INSERT INTO hitlogs VALUES("1117","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 15:55:46","2024-01-18 15:55:46");
INSERT INTO hitlogs VALUES("1118","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:24:03","2024-01-18 16:24:03");
INSERT INTO hitlogs VALUES("1119","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:24:14","2024-01-18 16:24:14");
INSERT INTO hitlogs VALUES("1120","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:24:49","2024-01-18 16:24:49");
INSERT INTO hitlogs VALUES("1121","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:27:39","2024-01-18 16:27:39");
INSERT INTO hitlogs VALUES("1122","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:28:05","2024-01-18 16:28:05");
INSERT INTO hitlogs VALUES("1123","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:28:58","2024-01-18 16:28:58");
INSERT INTO hitlogs VALUES("1124","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:29:03","2024-01-18 16:29:03");
INSERT INTO hitlogs VALUES("1125","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:31:18","2024-01-18 16:31:18");
INSERT INTO hitlogs VALUES("1126","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:31:21","2024-01-18 16:31:21");
INSERT INTO hitlogs VALUES("1127","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:35:00","2024-01-18 16:35:00");
INSERT INTO hitlogs VALUES("1128","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:35:05","2024-01-18 16:35:05");
INSERT INTO hitlogs VALUES("1129","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:51:19","2024-01-18 16:51:19");
INSERT INTO hitlogs VALUES("1130","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:52:11","2024-01-18 16:52:11");
INSERT INTO hitlogs VALUES("1131","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:54:07","2024-01-18 16:54:07");
INSERT INTO hitlogs VALUES("1132","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:54:36","2024-01-18 16:54:36");
INSERT INTO hitlogs VALUES("1133","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:55:08","2024-01-18 16:55:08");
INSERT INTO hitlogs VALUES("1134","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:55:40","2024-01-18 16:55:40");
INSERT INTO hitlogs VALUES("1135","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:56:44","2024-01-18 16:56:44");
INSERT INTO hitlogs VALUES("1136","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:58:49","2024-01-18 16:58:49");
INSERT INTO hitlogs VALUES("1137","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 16:59:54","2024-01-18 16:59:54");
INSERT INTO hitlogs VALUES("1138","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:00:26","2024-01-18 17:00:26");
INSERT INTO hitlogs VALUES("1139","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:00:30","2024-01-18 17:00:30");
INSERT INTO hitlogs VALUES("1140","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:01:18","2024-01-18 17:01:18");
INSERT INTO hitlogs VALUES("1141","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:01:49","2024-01-18 17:01:49");
INSERT INTO hitlogs VALUES("1142","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:03:15","2024-01-18 17:03:15");
INSERT INTO hitlogs VALUES("1143","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:03:57","2024-01-18 17:03:57");
INSERT INTO hitlogs VALUES("1144","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:04:16","2024-01-18 17:04:16");
INSERT INTO hitlogs VALUES("1145","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:05:17","2024-01-18 17:05:17");
INSERT INTO hitlogs VALUES("1146","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:05:21","2024-01-18 17:05:21");
INSERT INTO hitlogs VALUES("1147","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:05:29","2024-01-18 17:05:29");
INSERT INTO hitlogs VALUES("1148","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:06:07","2024-01-18 17:06:07");
INSERT INTO hitlogs VALUES("1149","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:07:26","2024-01-18 17:07:26");
INSERT INTO hitlogs VALUES("1150","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:07:39","2024-01-18 17:07:39");
INSERT INTO hitlogs VALUES("1151","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:07:43","2024-01-18 17:07:43");
INSERT INTO hitlogs VALUES("1152","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:07:55","2024-01-18 17:07:55");
INSERT INTO hitlogs VALUES("1153","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:08:47","2024-01-18 17:08:47");
INSERT INTO hitlogs VALUES("1154","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:09:32","2024-01-18 17:09:32");
INSERT INTO hitlogs VALUES("1155","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:09:44","2024-01-18 17:09:44");
INSERT INTO hitlogs VALUES("1156","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:09:48","2024-01-18 17:09:48");
INSERT INTO hitlogs VALUES("1157","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:10:26","2024-01-18 17:10:26");
INSERT INTO hitlogs VALUES("1158","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:11:10","2024-01-18 17:11:10");
INSERT INTO hitlogs VALUES("1159","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:13:01","2024-01-18 17:13:01");
INSERT INTO hitlogs VALUES("1160","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:13:04","2024-01-18 17:13:04");
INSERT INTO hitlogs VALUES("1161","127.0.0.1","superAdmin.products.slugsearch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.slugsearch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:13:13","2024-01-18 17:13:13");
INSERT INTO hitlogs VALUES("1162","127.0.0.1","superAdmin.media.upload","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.upload","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:13:34","2024-01-18 17:13:34");
INSERT INTO hitlogs VALUES("1163","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:13:36","2024-01-18 17:13:36");
INSERT INTO hitlogs VALUES("1164","127.0.0.1","superAdmin.products.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:09","2024-01-18 17:14:09");
INSERT INTO hitlogs VALUES("1165","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:10","2024-01-18 17:14:10");
INSERT INTO hitlogs VALUES("1166","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:14","2024-01-18 17:14:14");
INSERT INTO hitlogs VALUES("1167","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:30","2024-01-18 17:14:30");
INSERT INTO hitlogs VALUES("1168","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:33","2024-01-18 17:14:33");
INSERT INTO hitlogs VALUES("1169","127.0.0.1","superAdmin.barcode.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:14:51","2024-01-18 17:14:51");
INSERT INTO hitlogs VALUES("1170","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:09","2024-01-18 17:15:09");
INSERT INTO hitlogs VALUES("1171","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:12","2024-01-18 17:15:12");
INSERT INTO hitlogs VALUES("1172","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:16","2024-01-18 17:15:16");
INSERT INTO hitlogs VALUES("1173","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:18","2024-01-18 17:15:18");
INSERT INTO hitlogs VALUES("1174","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:20","2024-01-18 17:15:20");
INSERT INTO hitlogs VALUES("1175","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:24","2024-01-18 17:15:24");
INSERT INTO hitlogs VALUES("1176","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:24","2024-01-18 17:15:24");
INSERT INTO hitlogs VALUES("1177","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:15:37","2024-01-18 17:15:37");
INSERT INTO hitlogs VALUES("1178","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:16:14","2024-01-18 17:16:14");
INSERT INTO hitlogs VALUES("1179","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:19:17","2024-01-18 17:19:17");
INSERT INTO hitlogs VALUES("1180","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:19:30","2024-01-18 17:19:30");
INSERT INTO hitlogs VALUES("1181","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:20:24","2024-01-18 17:20:24");
INSERT INTO hitlogs VALUES("1182","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:21:22","2024-01-18 17:21:22");
INSERT INTO hitlogs VALUES("1183","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:21:26","2024-01-18 17:21:26");
INSERT INTO hitlogs VALUES("1184","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:21:27","2024-01-18 17:21:27");
INSERT INTO hitlogs VALUES("1185","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:21:39","2024-01-18 17:21:39");
INSERT INTO hitlogs VALUES("1186","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:22:11","2024-01-18 17:22:11");
INSERT INTO hitlogs VALUES("1187","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:22:14","2024-01-18 17:22:14");
INSERT INTO hitlogs VALUES("1188","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:22:15","2024-01-18 17:22:15");
INSERT INTO hitlogs VALUES("1189","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:22:21","2024-01-18 17:22:21");
INSERT INTO hitlogs VALUES("1190","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:22:51","2024-01-18 17:22:51");
INSERT INTO hitlogs VALUES("1191","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:23:49","2024-01-18 17:23:49");
INSERT INTO hitlogs VALUES("1192","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:23:53","2024-01-18 17:23:53");
INSERT INTO hitlogs VALUES("1193","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:24:07","2024-01-18 17:24:07");
INSERT INTO hitlogs VALUES("1194","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:24:11","2024-01-18 17:24:11");
INSERT INTO hitlogs VALUES("1195","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:24:11","2024-01-18 17:24:11");
INSERT INTO hitlogs VALUES("1196","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:24:18","2024-01-18 17:24:18");
INSERT INTO hitlogs VALUES("1197","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:25:52","2024-01-18 17:25:52");
INSERT INTO hitlogs VALUES("1198","127.0.0.1","superAdmin.products.edit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.edit/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:28:01","2024-01-18 17:28:01");
INSERT INTO hitlogs VALUES("1199","127.0.0.1","superAdmin.products.sellUnitId","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.sellUnitId/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:28:07","2024-01-18 17:28:07");
INSERT INTO hitlogs VALUES("1200","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:28:07","2024-01-18 17:28:07");
INSERT INTO hitlogs VALUES("1201","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:28:38","2024-01-18 17:28:38");
INSERT INTO hitlogs VALUES("1202","127.0.0.1","superAdmin.products.update","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.update","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:35","2024-01-18 17:29:35");
INSERT INTO hitlogs VALUES("1203","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:36","2024-01-18 17:29:36");
INSERT INTO hitlogs VALUES("1204","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:39","2024-01-18 17:29:39");
INSERT INTO hitlogs VALUES("1205","127.0.0.1","superAdmin.products.publish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.publish/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:51","2024-01-18 17:29:51");
INSERT INTO hitlogs VALUES("1206","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:51","2024-01-18 17:29:51");
INSERT INTO hitlogs VALUES("1207","127.0.0.1","superAdmin.products.unpublish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.unpublish/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:53","2024-01-18 17:29:53");
INSERT INTO hitlogs VALUES("1208","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:53","2024-01-18 17:29:53");
INSERT INTO hitlogs VALUES("1209","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:29:57","2024-01-18 17:29:57");
INSERT INTO hitlogs VALUES("1210","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:30:06","2024-01-18 17:30:06");
INSERT INTO hitlogs VALUES("1211","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:08","2024-01-18 17:33:08");
INSERT INTO hitlogs VALUES("1212","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:13","2024-01-18 17:33:13");
INSERT INTO hitlogs VALUES("1213","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:18","2024-01-18 17:33:18");
INSERT INTO hitlogs VALUES("1214","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:23","2024-01-18 17:33:23");
INSERT INTO hitlogs VALUES("1215","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:26","2024-01-18 17:33:26");
INSERT INTO hitlogs VALUES("1216","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:29","2024-01-18 17:33:29");
INSERT INTO hitlogs VALUES("1217","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:33:35","2024-01-18 17:33:35");
INSERT INTO hitlogs VALUES("1218","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:34:48","2024-01-18 17:34:48");
INSERT INTO hitlogs VALUES("1219","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:34:52","2024-01-18 17:34:52");
INSERT INTO hitlogs VALUES("1220","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:34:55","2024-01-18 17:34:55");
INSERT INTO hitlogs VALUES("1221","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:35:00","2024-01-18 17:35:00");
INSERT INTO hitlogs VALUES("1222","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:36:40","2024-01-18 17:36:40");
INSERT INTO hitlogs VALUES("1223","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-18 17:36:44","2024-01-18 17:36:44");
INSERT INTO hitlogs VALUES("1224","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:11:58","2024-01-21 10:11:58");
INSERT INTO hitlogs VALUES("1225","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:12:07","2024-01-21 10:12:07");
INSERT INTO hitlogs VALUES("1226","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:12:27","2024-01-21 10:12:27");
INSERT INTO hitlogs VALUES("1227","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:12:30","2024-01-21 10:12:30");
INSERT INTO hitlogs VALUES("1228","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:12:50","2024-01-21 10:12:50");
INSERT INTO hitlogs VALUES("1229","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:13:18","2024-01-21 10:13:18");
INSERT INTO hitlogs VALUES("1230","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:13:21","2024-01-21 10:13:21");
INSERT INTO hitlogs VALUES("1231","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:13:38","2024-01-21 10:13:38");
INSERT INTO hitlogs VALUES("1232","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:13:41","2024-01-21 10:13:41");
INSERT INTO hitlogs VALUES("1233","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:16:30","2024-01-21 10:16:30");
INSERT INTO hitlogs VALUES("1234","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:16:34","2024-01-21 10:16:34");
INSERT INTO hitlogs VALUES("1235","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:16:39","2024-01-21 10:16:39");
INSERT INTO hitlogs VALUES("1236","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:17:17","2024-01-21 10:17:17");
INSERT INTO hitlogs VALUES("1237","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:17:21","2024-01-21 10:17:21");
INSERT INTO hitlogs VALUES("1238","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:17:26","2024-01-21 10:17:26");
INSERT INTO hitlogs VALUES("1239","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:19:25","2024-01-21 10:19:25");
INSERT INTO hitlogs VALUES("1240","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:19:30","2024-01-21 10:19:30");
INSERT INTO hitlogs VALUES("1241","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:19:40","2024-01-21 10:19:40");
INSERT INTO hitlogs VALUES("1242","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:22","2024-01-21 10:20:22");
INSERT INTO hitlogs VALUES("1243","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:26","2024-01-21 10:20:26");
INSERT INTO hitlogs VALUES("1244","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:32","2024-01-21 10:20:32");
INSERT INTO hitlogs VALUES("1245","127.0.0.1","superAdmin.products.publish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.publish/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:36","2024-01-21 10:20:36");
INSERT INTO hitlogs VALUES("1246","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:36","2024-01-21 10:20:36");
INSERT INTO hitlogs VALUES("1247","127.0.0.1","superAdmin.products.unpublish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.unpublish/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:38","2024-01-21 10:20:38");
INSERT INTO hitlogs VALUES("1248","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:20:38","2024-01-21 10:20:38");
INSERT INTO hitlogs VALUES("1249","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:21:32","2024-01-21 10:21:32");
INSERT INTO hitlogs VALUES("1250","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:23:22","2024-01-21 10:23:22");
INSERT INTO hitlogs VALUES("1251","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:25:57","2024-01-21 10:25:57");
INSERT INTO hitlogs VALUES("1252","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:26:01","2024-01-21 10:26:01");
INSERT INTO hitlogs VALUES("1253","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:26:07","2024-01-21 10:26:07");
INSERT INTO hitlogs VALUES("1254","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:07","2024-01-21 10:28:07");
INSERT INTO hitlogs VALUES("1255","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:11","2024-01-21 10:28:11");
INSERT INTO hitlogs VALUES("1256","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:17","2024-01-21 10:28:17");
INSERT INTO hitlogs VALUES("1257","127.0.0.1","superAdmin.products.publish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.publish/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:36","2024-01-21 10:28:36");
INSERT INTO hitlogs VALUES("1258","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:37","2024-01-21 10:28:37");
INSERT INTO hitlogs VALUES("1259","127.0.0.1","superAdmin.products.unpublish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.unpublish/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:38","2024-01-21 10:28:38");
INSERT INTO hitlogs VALUES("1260","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:28:39","2024-01-21 10:28:39");
INSERT INTO hitlogs VALUES("1261","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:30:46","2024-01-21 10:30:46");
INSERT INTO hitlogs VALUES("1262","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:30:51","2024-01-21 10:30:51");
INSERT INTO hitlogs VALUES("1263","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:31:01","2024-01-21 10:31:01");
INSERT INTO hitlogs VALUES("1264","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:32:14","2024-01-21 10:32:14");
INSERT INTO hitlogs VALUES("1265","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:32:17","2024-01-21 10:32:17");
INSERT INTO hitlogs VALUES("1266","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:33:59","2024-01-21 10:33:59");
INSERT INTO hitlogs VALUES("1267","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:34:02","2024-01-21 10:34:02");
INSERT INTO hitlogs VALUES("1268","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:34:08","2024-01-21 10:34:08");
INSERT INTO hitlogs VALUES("1269","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:34:38","2024-01-21 10:34:38");
INSERT INTO hitlogs VALUES("1270","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:34:41","2024-01-21 10:34:41");
INSERT INTO hitlogs VALUES("1271","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:35:41","2024-01-21 10:35:41");
INSERT INTO hitlogs VALUES("1272","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:35:45","2024-01-21 10:35:45");
INSERT INTO hitlogs VALUES("1273","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:37:29","2024-01-21 10:37:29");
INSERT INTO hitlogs VALUES("1274","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:37:34","2024-01-21 10:37:34");
INSERT INTO hitlogs VALUES("1275","127.0.0.1","superAdmin.sale.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.deleted/16","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:37:43","2024-01-21 10:37:43");
INSERT INTO hitlogs VALUES("1276","127.0.0.1","superAdmin.sale.pos","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.pos","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:43:04","2024-01-21 10:43:04");
INSERT INTO hitlogs VALUES("1277","127.0.0.1","superAdmin.sale.getcustomergroup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getcustomergroup/1","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:43:10","2024-01-21 10:43:10");
INSERT INTO hitlogs VALUES("1278","127.0.0.1","superAdmin.sale.getProduct","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.getProduct/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:43:10","2024-01-21 10:43:10");
INSERT INTO hitlogs VALUES("1279","127.0.0.1","superAdmin.sale.checkAvailability","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.checkAvailability/2","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 10:43:11","2024-01-21 10:43:11");
INSERT INTO hitlogs VALUES("1280","127.0.0.1","superAdmin.possetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/possetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:31:47","2024-01-21 14:31:47");
INSERT INTO hitlogs VALUES("1281","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:32:01","2024-01-21 14:32:01");
INSERT INTO hitlogs VALUES("1282","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:32:22","2024-01-21 14:32:22");
INSERT INTO hitlogs VALUES("1283","127.0.0.1","superAdmin.possetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/possetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:33:36","2024-01-21 14:33:36");
INSERT INTO hitlogs VALUES("1284","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:33:48","2024-01-21 14:33:48");
INSERT INTO hitlogs VALUES("1285","127.0.0.1","superAdmin.possetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/possetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:34:05","2024-01-21 14:34:05");
INSERT INTO hitlogs VALUES("1286","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:34:13","2024-01-21 14:34:13");
INSERT INTO hitlogs VALUES("1287","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:35:05","2024-01-21 14:35:05");
INSERT INTO hitlogs VALUES("1288","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:56:31","2024-01-21 14:56:31");
INSERT INTO hitlogs VALUES("1289","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:56:34","2024-01-21 14:56:34");
INSERT INTO hitlogs VALUES("1290","127.0.0.1","superAdmin.products.create","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.create","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:56:37","2024-01-21 14:56:37");
INSERT INTO hitlogs VALUES("1291","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:56:40","2024-01-21 14:56:40");
INSERT INTO hitlogs VALUES("1292","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:56:58","2024-01-21 14:56:58");
INSERT INTO hitlogs VALUES("1293","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:01","2024-01-21 14:57:01");
INSERT INTO hitlogs VALUES("1294","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:02","2024-01-21 14:57:02");
INSERT INTO hitlogs VALUES("1295","127.0.0.1","superAdmin.customer.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:20","2024-01-21 14:57:20");
INSERT INTO hitlogs VALUES("1296","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:21","2024-01-21 14:57:21");
INSERT INTO hitlogs VALUES("1297","127.0.0.1","superAdmin.customer.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:34","2024-01-21 14:57:34");
INSERT INTO hitlogs VALUES("1298","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:35","2024-01-21 14:57:35");
INSERT INTO hitlogs VALUES("1299","127.0.0.1","superAdmin.customer.publish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer.publish/7","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:39","2024-01-21 14:57:39");
INSERT INTO hitlogs VALUES("1300","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:40","2024-01-21 14:57:40");
INSERT INTO hitlogs VALUES("1301","127.0.0.1","superAdmin.customer.unpublish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer.unpublish/7","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:41","2024-01-21 14:57:41");
INSERT INTO hitlogs VALUES("1302","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:42","2024-01-21 14:57:42");
INSERT INTO hitlogs VALUES("1303","127.0.0.1","superAdmin.customer.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer.deleted/7","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:44","2024-01-21 14:57:44");
INSERT INTO hitlogs VALUES("1304","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:45","2024-01-21 14:57:45");
INSERT INTO hitlogs VALUES("1305","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:56","2024-01-21 14:57:56");
INSERT INTO hitlogs VALUES("1306","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:58","2024-01-21 14:57:58");
INSERT INTO hitlogs VALUES("1307","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:57:59","2024-01-21 14:57:59");
INSERT INTO hitlogs VALUES("1308","127.0.0.1","superAdmin.biller.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:15","2024-01-21 14:58:15");
INSERT INTO hitlogs VALUES("1309","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:15","2024-01-21 14:58:15");
INSERT INTO hitlogs VALUES("1310","127.0.0.1","superAdmin.biller.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:20","2024-01-21 14:58:20");
INSERT INTO hitlogs VALUES("1311","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:21","2024-01-21 14:58:21");
INSERT INTO hitlogs VALUES("1312","127.0.0.1","superAdmin.biller.publish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller.publish/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:25","2024-01-21 14:58:25");
INSERT INTO hitlogs VALUES("1313","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:26","2024-01-21 14:58:26");
INSERT INTO hitlogs VALUES("1314","127.0.0.1","superAdmin.biller.unpublish","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller.unpublish/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:27","2024-01-21 14:58:27");
INSERT INTO hitlogs VALUES("1315","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:28","2024-01-21 14:58:28");
INSERT INTO hitlogs VALUES("1316","127.0.0.1","superAdmin.biller.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller.deleted/3","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:30","2024-01-21 14:58:30");
INSERT INTO hitlogs VALUES("1317","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:31","2024-01-21 14:58:31");
INSERT INTO hitlogs VALUES("1318","127.0.0.1","superAdmin.departments","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/departments","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:38","2024-01-21 14:58:38");
INSERT INTO hitlogs VALUES("1319","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:58:57","2024-01-21 14:58:57");
INSERT INTO hitlogs VALUES("1320","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:00","2024-01-21 14:59:00");
INSERT INTO hitlogs VALUES("1321","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:09","2024-01-21 14:59:09");
INSERT INTO hitlogs VALUES("1322","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:11","2024-01-21 14:59:11");
INSERT INTO hitlogs VALUES("1323","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:33","2024-01-21 14:59:33");
INSERT INTO hitlogs VALUES("1324","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:37","2024-01-21 14:59:37");
INSERT INTO hitlogs VALUES("1325","127.0.0.1","superAdmin.purchase.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase.deleted/5","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:45","2024-01-21 14:59:45");
INSERT INTO hitlogs VALUES("1326","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 14:59:45","2024-01-21 14:59:45");
INSERT INTO hitlogs VALUES("1327","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:02:49","2024-01-21 15:02:49");
INSERT INTO hitlogs VALUES("1328","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:02:53","2024-01-21 15:02:53");
INSERT INTO hitlogs VALUES("1329","127.0.0.1","superAdmin.sale.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.deleted/15","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:02:59","2024-01-21 15:02:59");
INSERT INTO hitlogs VALUES("1330","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:07:37","2024-01-21 15:07:37");
INSERT INTO hitlogs VALUES("1331","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:07:42","2024-01-21 15:07:42");
INSERT INTO hitlogs VALUES("1332","127.0.0.1","superAdmin.sale.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale.deleted/14","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:07:49","2024-01-21 15:07:49");
INSERT INTO hitlogs VALUES("1333","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:07:50","2024-01-21 15:07:50");
INSERT INTO hitlogs VALUES("1334","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:07:59","2024-01-21 15:07:59");
INSERT INTO hitlogs VALUES("1335","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:08:02","2024-01-21 15:08:02");
INSERT INTO hitlogs VALUES("1336","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:09:28","2024-01-21 15:09:28");
INSERT INTO hitlogs VALUES("1337","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:09:31","2024-01-21 15:09:31");
INSERT INTO hitlogs VALUES("1338","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:20","2024-01-21 15:12:20");
INSERT INTO hitlogs VALUES("1339","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:26","2024-01-21 15:12:26");
INSERT INTO hitlogs VALUES("1340","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:31","2024-01-21 15:12:31");
INSERT INTO hitlogs VALUES("1341","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:36","2024-01-21 15:12:36");
INSERT INTO hitlogs VALUES("1342","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:44","2024-01-21 15:12:44");
INSERT INTO hitlogs VALUES("1343","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:46","2024-01-21 15:12:46");
INSERT INTO hitlogs VALUES("1344","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:49","2024-01-21 15:12:49");
INSERT INTO hitlogs VALUES("1345","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:12:58","2024-01-21 15:12:58");
INSERT INTO hitlogs VALUES("1346","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:15:20","2024-01-21 15:15:20");
INSERT INTO hitlogs VALUES("1347","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:15:25","2024-01-21 15:15:25");
INSERT INTO hitlogs VALUES("1348","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:15:31","2024-01-21 15:15:31");
INSERT INTO hitlogs VALUES("1349","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:15:54","2024-01-21 15:15:54");
INSERT INTO hitlogs VALUES("1350","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:16:43","2024-01-21 15:16:43");
INSERT INTO hitlogs VALUES("1351","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:16:49","2024-01-21 15:16:49");
INSERT INTO hitlogs VALUES("1352","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:16:53","2024-01-21 15:16:53");
INSERT INTO hitlogs VALUES("1353","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:17:00","2024-01-21 15:17:00");
INSERT INTO hitlogs VALUES("1354","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/9","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:17:31","2024-01-21 15:17:31");
INSERT INTO hitlogs VALUES("1355","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:17:51","2024-01-21 15:17:51");
INSERT INTO hitlogs VALUES("1356","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:17:55","2024-01-21 15:17:55");
INSERT INTO hitlogs VALUES("1357","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:17:58","2024-01-21 15:17:58");
INSERT INTO hitlogs VALUES("1358","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:20:07","2024-01-21 15:20:07");
INSERT INTO hitlogs VALUES("1359","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:20:12","2024-01-21 15:20:12");
INSERT INTO hitlogs VALUES("1360","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:20:16","2024-01-21 15:20:16");
INSERT INTO hitlogs VALUES("1361","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:21:43","2024-01-21 15:21:43");
INSERT INTO hitlogs VALUES("1362","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:21:48","2024-01-21 15:21:48");
INSERT INTO hitlogs VALUES("1363","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:21:52","2024-01-21 15:21:52");
INSERT INTO hitlogs VALUES("1364","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:22:23","2024-01-21 15:22:23");
INSERT INTO hitlogs VALUES("1365","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:22:26","2024-01-21 15:22:26");
INSERT INTO hitlogs VALUES("1366","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:23:05","2024-01-21 15:23:05");
INSERT INTO hitlogs VALUES("1367","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:25:32","2024-01-21 15:25:32");
INSERT INTO hitlogs VALUES("1368","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:25:37","2024-01-21 15:25:37");
INSERT INTO hitlogs VALUES("1369","127.0.0.1","superAdmin.products.deleted","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products.deleted/10","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:25:42","2024-01-21 15:25:42");
INSERT INTO hitlogs VALUES("1370","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:18","2024-01-21 15:27:18");
INSERT INTO hitlogs VALUES("1371","127.0.0.1","superAdmin.category","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/category","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:19","2024-01-21 15:27:19");
INSERT INTO hitlogs VALUES("1372","127.0.0.1","superAdmin.warehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/warehouse","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:21","2024-01-21 15:27:21");
INSERT INTO hitlogs VALUES("1373","127.0.0.1","superAdmin.brand","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/brand","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:22","2024-01-21 15:27:22");
INSERT INTO hitlogs VALUES("1374","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:23","2024-01-21 15:27:23");
INSERT INTO hitlogs VALUES("1375","127.0.0.1","superAdmin.tax","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/tax","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:24","2024-01-21 15:27:24");
INSERT INTO hitlogs VALUES("1376","127.0.0.1","superAdmin.unit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/unit","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:25","2024-01-21 15:27:25");
INSERT INTO hitlogs VALUES("1377","127.0.0.1","superAdmin.transfers","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/transfers","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:26","2024-01-21 15:27:26");
INSERT INTO hitlogs VALUES("1378","127.0.0.1","superAdmin.qty_adjustment","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/qty_adjustment","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:27","2024-01-21 15:27:27");
INSERT INTO hitlogs VALUES("1379","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:29","2024-01-21 15:27:29");
INSERT INTO hitlogs VALUES("1380","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:31","2024-01-21 15:27:31");
INSERT INTO hitlogs VALUES("1381","127.0.0.1","superAdmin.products","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/products","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:36","2024-01-21 15:27:36");
INSERT INTO hitlogs VALUES("1382","127.0.0.1","superAdmin.category","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/category","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:43","2024-01-21 15:27:43");
INSERT INTO hitlogs VALUES("1383","127.0.0.1","superAdmin.warehouse","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/warehouse","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:44","2024-01-21 15:27:44");
INSERT INTO hitlogs VALUES("1384","127.0.0.1","superAdmin.brand","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/brand","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:47","2024-01-21 15:27:47");
INSERT INTO hitlogs VALUES("1385","127.0.0.1","superAdmin.tax","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/tax","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:48","2024-01-21 15:27:48");
INSERT INTO hitlogs VALUES("1386","127.0.0.1","superAdmin.barcode","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/barcode","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:49","2024-01-21 15:27:49");
INSERT INTO hitlogs VALUES("1387","127.0.0.1","superAdmin.unit","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/unit","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:52","2024-01-21 15:27:52");
INSERT INTO hitlogs VALUES("1388","127.0.0.1","superAdmin.transfers","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/transfers","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:27:54","2024-01-21 15:27:54");
INSERT INTO hitlogs VALUES("1389","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:27","2024-01-21 15:28:27");
INSERT INTO hitlogs VALUES("1390","127.0.0.1","superAdmin.coupon","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/coupon","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:28","2024-01-21 15:28:28");
INSERT INTO hitlogs VALUES("1391","127.0.0.1","superAdmin.courier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/courier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:29","2024-01-21 15:28:29");
INSERT INTO hitlogs VALUES("1392","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:30","2024-01-21 15:28:30");
INSERT INTO hitlogs VALUES("1393","127.0.0.1","superAdmin.giftcard","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/giftcard","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:32","2024-01-21 15:28:32");
INSERT INTO hitlogs VALUES("1394","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:42","2024-01-21 15:28:42");
INSERT INTO hitlogs VALUES("1395","127.0.0.1","superAdmin.coupon","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/coupon","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:45","2024-01-21 15:28:45");
INSERT INTO hitlogs VALUES("1396","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:48","2024-01-21 15:28:48");
INSERT INTO hitlogs VALUES("1397","127.0.0.1","superAdmin.giftcard","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/giftcard","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:49","2024-01-21 15:28:49");
INSERT INTO hitlogs VALUES("1398","127.0.0.1","superAdmin.courier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/courier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:28:49","2024-01-21 15:28:49");
INSERT INTO hitlogs VALUES("1399","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:29:28","2024-01-21 15:29:28");
INSERT INTO hitlogs VALUES("1400","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:29:31","2024-01-21 15:29:31");
INSERT INTO hitlogs VALUES("1401","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:31:27","2024-01-21 15:31:27");
INSERT INTO hitlogs VALUES("1402","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:31:28","2024-01-21 15:31:28");
INSERT INTO hitlogs VALUES("1403","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:31:33","2024-01-21 15:31:33");
INSERT INTO hitlogs VALUES("1404","127.0.0.1","superAdmin.sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:31:36","2024-01-21 15:31:36");
INSERT INTO hitlogs VALUES("1405","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:32:47","2024-01-21 15:32:47");
INSERT INTO hitlogs VALUES("1406","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:32:51","2024-01-21 15:32:51");
INSERT INTO hitlogs VALUES("1407","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:00","2024-01-21 15:33:00");
INSERT INTO hitlogs VALUES("1408","127.0.0.1","superAdmin.delivery","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/delivery","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:04","2024-01-21 15:33:04");
INSERT INTO hitlogs VALUES("1409","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:22","2024-01-21 15:33:22");
INSERT INTO hitlogs VALUES("1410","127.0.0.1","superAdmin.supplier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/supplier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:24","2024-01-21 15:33:24");
INSERT INTO hitlogs VALUES("1411","127.0.0.1","superAdmin.purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:28","2024-01-21 15:33:28");
INSERT INTO hitlogs VALUES("1412","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:28","2024-01-21 15:33:28");
INSERT INTO hitlogs VALUES("1413","127.0.0.1","superAdmin.supplier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/supplier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:31","2024-01-21 15:33:31");
INSERT INTO hitlogs VALUES("1414","127.0.0.1","superAdmin.expenses","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expenses","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:49","2024-01-21 15:33:49");
INSERT INTO hitlogs VALUES("1415","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:51","2024-01-21 15:33:51");
INSERT INTO hitlogs VALUES("1416","127.0.0.1","superAdmin.expenses","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expenses","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:33:55","2024-01-21 15:33:55");
INSERT INTO hitlogs VALUES("1417","127.0.0.1","superAdmin.expenses.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expenses.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:12","2024-01-21 15:34:12");
INSERT INTO hitlogs VALUES("1418","127.0.0.1","superAdmin.expenses","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expenses","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:12","2024-01-21 15:34:12");
INSERT INTO hitlogs VALUES("1419","127.0.0.1","superAdmin.expenses","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expenses","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:15","2024-01-21 15:34:15");
INSERT INTO hitlogs VALUES("1420","127.0.0.1","superAdmin.generated::FfuG98vyuamUaA0C","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expense_categories/gencode","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:18","2024-01-21 15:34:18");
INSERT INTO hitlogs VALUES("1421","127.0.0.1","superAdmin.expense_categories.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expense_categories.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:21","2024-01-21 15:34:21");
INSERT INTO hitlogs VALUES("1422","127.0.0.1","superAdmin.expense_categories","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/expense_categories","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:21","2024-01-21 15:34:21");
INSERT INTO hitlogs VALUES("1423","127.0.0.1","superAdmin.accounts","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/accounts","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:34","2024-01-21 15:34:34");
INSERT INTO hitlogs VALUES("1424","127.0.0.1","superAdmin.money-transfers","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/money-transfers","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:36","2024-01-21 15:34:36");
INSERT INTO hitlogs VALUES("1425","127.0.0.1","superAdmin.accounts.balancesheet","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/accounts/balancesheet","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:37","2024-01-21 15:34:37");
INSERT INTO hitlogs VALUES("1426","127.0.0.1","superAdmin.accounts","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/accounts","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:46","2024-01-21 15:34:46");
INSERT INTO hitlogs VALUES("1427","127.0.0.1","superAdmin.money-transfers","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/money-transfers","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:34:52","2024-01-21 15:34:52");
INSERT INTO hitlogs VALUES("1428","127.0.0.1","superAdmin.accounts.balancesheet","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/accounts/balancesheet","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:35:03","2024-01-21 15:35:03");
INSERT INTO hitlogs VALUES("1429","127.0.0.1","superAdmin.accounts.balancesheet","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/accounts/balancesheet","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:35:43","2024-01-21 15:35:43");
INSERT INTO hitlogs VALUES("1430","127.0.0.1","superAdmin.cashRegister","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/cashRegister","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:04","2024-01-21 15:36:04");
INSERT INTO hitlogs VALUES("1431","127.0.0.1","superAdmin.departments","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/departments","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:16","2024-01-21 15:36:16");
INSERT INTO hitlogs VALUES("1432","127.0.0.1","superAdmin.employees","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/employees","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:17","2024-01-21 15:36:17");
INSERT INTO hitlogs VALUES("1433","127.0.0.1","superAdmin.payroll","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/payroll","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:18","2024-01-21 15:36:18");
INSERT INTO hitlogs VALUES("1434","127.0.0.1","superAdmin.attendance","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/attendance","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:21","2024-01-21 15:36:21");
INSERT INTO hitlogs VALUES("1435","127.0.0.1","superAdmin.stock-count","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/stock-count","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:22","2024-01-21 15:36:22");
INSERT INTO hitlogs VALUES("1436","127.0.0.1","superAdmin.holidays","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/holidays","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:25","2024-01-21 15:36:25");
INSERT INTO hitlogs VALUES("1437","127.0.0.1","superAdmin.setting.hrm","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/setting/hrm_setting","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:36:26","2024-01-21 15:36:26");
INSERT INTO hitlogs VALUES("1438","127.0.0.1","superAdmin.payroll","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/payroll","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:37:11","2024-01-21 15:37:11");
INSERT INTO hitlogs VALUES("1439","127.0.0.1","superAdmin.payroll","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/payroll","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:37:42","2024-01-21 15:37:42");
INSERT INTO hitlogs VALUES("1440","127.0.0.1","superAdmin.stock-count","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/stock-count","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:39:31","2024-01-21 15:39:31");
INSERT INTO hitlogs VALUES("1441","127.0.0.1","superAdmin.stock-count.store","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/stock-count.store","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:39:46","2024-01-21 15:39:46");
INSERT INTO hitlogs VALUES("1442","127.0.0.1","superAdmin.stock-count","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/stock-count","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:39:47","2024-01-21 15:39:47");
INSERT INTO hitlogs VALUES("1443","127.0.0.1","superAdmin.return-sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:22","2024-01-21 15:40:22");
INSERT INTO hitlogs VALUES("1444","127.0.0.1","superAdmin.return-purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:23","2024-01-21 15:40:23");
INSERT INTO hitlogs VALUES("1445","127.0.0.1","superAdmin.return-sale","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-sale","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:27","2024-01-21 15:40:27");
INSERT INTO hitlogs VALUES("1446","127.0.0.1","superAdmin.return-purchase","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/return-purchase","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:30","2024-01-21 15:40:30");
INSERT INTO hitlogs VALUES("1447","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:46","2024-01-21 15:40:46");
INSERT INTO hitlogs VALUES("1448","127.0.0.1","superAdmin.supplier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/supplier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:48","2024-01-21 15:40:48");
INSERT INTO hitlogs VALUES("1449","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:48","2024-01-21 15:40:48");
INSERT INTO hitlogs VALUES("1450","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:50","2024-01-21 15:40:50");
INSERT INTO hitlogs VALUES("1451","127.0.0.1","superAdmin.customer","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/customer","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:52","2024-01-21 15:40:52");
INSERT INTO hitlogs VALUES("1452","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:53","2024-01-21 15:40:53");
INSERT INTO hitlogs VALUES("1453","127.0.0.1","superAdmin.media.fetch","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/media.fetch","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:54","2024-01-21 15:40:54");
INSERT INTO hitlogs VALUES("1454","127.0.0.1","superAdmin.biller","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/biller","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:56","2024-01-21 15:40:56");
INSERT INTO hitlogs VALUES("1455","127.0.0.1","superAdmin.supplier","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/supplier","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:40:58","2024-01-21 15:40:58");
INSERT INTO hitlogs VALUES("1456","127.0.0.1","superAdmin.ganeralsetting.sms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.sms","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:41:15","2024-01-21 15:41:15");
INSERT INTO hitlogs VALUES("1457","127.0.0.1","superAdmin.ganeralsetting.createSms","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.createSms","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:41:16","2024-01-21 15:41:16");
INSERT INTO hitlogs VALUES("1458","127.0.0.1","superAdmin.ganeralsetting.superadminsetting","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.superadminsetting","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:41:17","2024-01-21 15:41:17");
INSERT INTO hitlogs VALUES("1459","127.0.0.1","superAdmin.ganeralsetting.backup","Google Chrome120.0.0.0","","http://127.0.0.1:8000/superAdmin/ganeralsetting.backup","Desktop","","Windows","Null","Null","","Win64;","2024-01-21 15:41:18","2024-01-21 15:41:18");



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO holidays VALUES("3","1","2024-01-04","2024-01-04","new year","0","2024-01-04 11:13:31","2024-01-04 11:13:54");



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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO image_uploads VALUES("23","3_1703400840.jpg","3","3","","","3_1703400840.jpg","3_1703400840.jpg","1","superAdmin",".jpg","2023-12-24 12:54:01","2023-12-24 12:54:01");
INSERT INTO image_uploads VALUES("24","2_1703407027.jpg","2","2","","","2_1703407027.jpg","2_1703407027.jpg","1","superAdmin",".jpg","2023-12-24 14:37:08","2023-12-24 14:37:08");
INSERT INTO image_uploads VALUES("25","1_1704345879.jpg","1","1","","","1_1704345879.jpg","1_1704345879.jpg","1","superAdmin",".jpg","2024-01-04 11:24:40","2024-01-04 11:24:40");
INSERT INTO image_uploads VALUES("26","5_1704348499.jpg","5","5","","","5_1704348499.jpg","5_1704348499.jpg","1","superAdmin",".jpg","2024-01-04 12:08:20","2024-01-04 12:08:20");
INSERT INTO image_uploads VALUES("27","terminal_1705576414.png","terminal","terminal","","","terminal_1705576414.png","terminal_1705576414.png","1","superAdmin",".png","2024-01-18 17:13:35","2024-01-18 17:13:35");



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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO migrations VALUES("89","2024_01_01_112357_create_custom_fields_table","33");
INSERT INTO migrations VALUES("90","2024_01_16_144915_create_create_custom_fields_table","33");
INSERT INTO migrations VALUES("91","2024_01_16_150452_add_new_column_to_example_table","34");
INSERT INTO migrations VALUES("92","2024_01_17_101613_create_tables_table","34");



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
INSERT INTO oauth_access_tokens VALUES("353df20c4bae5a638f5149e738150c30ee77df71371763d048b186a7a3c82f955b029e35adc21e5a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-04 17:05:54","2024-01-04 17:05:54","2025-01-04 17:05:54");
INSERT INTO oauth_access_tokens VALUES("39cf6708060c521780f9cb5db955a72e41c73701c1ae19caebc4e78757248e8b365dfaa4ae6bdfb1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-08 09:39:56","2023-10-08 09:39:56","2024-10-08 09:39:56");
INSERT INTO oauth_access_tokens VALUES("3d29479512bf3c2faefb9e96b6e7615f5820deea09007b3d7b5e76bc4921bbbe83c478109fe118de","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-30 04:08:55","2023-07-30 04:08:55","2024-07-30 04:08:55");
INSERT INTO oauth_access_tokens VALUES("4016ab552d5c6f3261db23de5d84e8fd0a2c2fc8ae223fd7c293c24e5cb986918a0cfaf520fa04fe","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-16 10:03:01","2023-08-16 10:03:01","2024-08-16 10:03:01");
INSERT INTO oauth_access_tokens VALUES("466a985b963f6fa4149d5fc41207cced8fe4385350434fc15a1c0c2370268a040fab648883df7799","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-31 04:08:27","2023-07-31 04:08:27","2024-07-31 04:08:27");
INSERT INTO oauth_access_tokens VALUES("47b2ea10bc7eec9ef29174ec220d5f1f3adda3a3a6823399d654de2ea0121242a9430179e381f889","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-24 09:59:29","2023-09-24 09:59:29","2024-09-24 09:59:29");
INSERT INTO oauth_access_tokens VALUES("4935f2fcf2a66fffcf2b5ea607192cd7998d4d3eaa316b702fc750d8877cfd866cc106c175c335b5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-31 09:26:38","2023-10-31 09:26:38","2024-10-31 09:26:38");
INSERT INTO oauth_access_tokens VALUES("4c8effefad856fb7f3107aa86882d360e7ea885e1610ea91290d63f35a90d21a0095db7feec434c0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-03 09:34:38","2024-01-03 09:34:38","2025-01-03 09:34:38");
INSERT INTO oauth_access_tokens VALUES("4f3b3c794aacd7646e5f1b43dce37cc87657f12e95f30cd6dd8c76c98717d8977b444bdc2ecd735f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-14 05:01:55","2023-05-14 05:01:55","2024-05-14 05:01:55");
INSERT INTO oauth_access_tokens VALUES("4f606509335abfb0b9d35bb6400b8d7585e34febbf4a593c4d5f4328fa8ad4b5935912ebf6b828d5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-20 10:13:07","2023-08-20 10:13:07","2024-08-20 10:13:07");
INSERT INTO oauth_access_tokens VALUES("502b7aa571d807e7412d40c281002bc38aa95f864c6523d723b0fb926fc525bb9545f3e218388258","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-18 09:40:08","2023-10-18 09:40:08","2024-10-18 09:40:08");
INSERT INTO oauth_access_tokens VALUES("53edc59593b8a7841d03810a9ea3df3e0330b42b15e7a10effb2c32c14ed6943a08be76e45c59f3f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-17 04:26:45","2023-07-17 04:26:45","2024-07-17 04:26:45");
INSERT INTO oauth_access_tokens VALUES("543eab7926a569fa77420e71d81b8e10ae2d27cf5605814376abf83285372ba894b06c4b9ef0bdc0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-08 04:07:28","2023-08-08 04:07:28","2024-08-08 04:07:28");
INSERT INTO oauth_access_tokens VALUES("54b41c6e203603b1cadd83f90e64a2795ef36c51833c84a4fbba05327db45cec589bd96480bf5de3","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-18 10:00:55","2023-09-18 10:00:55","2024-09-18 10:00:55");
INSERT INTO oauth_access_tokens VALUES("54d96fe30d51a198bcd8158634051a8915c7e904aee9d2be8f9dd7fb853f08930733536a89770ea0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-08 15:43:52","2023-11-08 15:43:52","2024-11-08 15:43:52");
INSERT INTO oauth_access_tokens VALUES("57295cf1bbdd0dfa727a24c1d39b8fcb5ee56b37d5fd291e67d2e76134b1ee0d77629df0ad7d5be6","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-13 10:31:17","2023-09-13 10:31:17","2024-09-13 10:31:17");
INSERT INTO oauth_access_tokens VALUES("5a29a31296204997436c4233d024b1147ab22a10d54ac48072080609c964aebb5be10914a9d8a35b","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-09 09:47:18","2024-01-09 09:47:18","2025-01-09 09:47:18");
INSERT INTO oauth_access_tokens VALUES("5ac5147b985a91da2439b07f3685bef938529b19f080ec88e0e20d615d0617d02f3b0f0a29eb29a1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-02 14:48:23","2024-01-02 14:48:23","2025-01-02 14:48:23");
INSERT INTO oauth_access_tokens VALUES("5f9459ec0f491b4e508d3e1be4da8bfda00b3a71d12f10d31efe961e76ac72b88d364490ba9528b5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-04 09:20:47","2024-01-04 09:20:47","2025-01-04 09:20:47");
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
INSERT INTO oauth_access_tokens VALUES("735dcec9081ffc5fbaa880323aa9896be09bd23cc55ea0cfeaeaaa48aab9ea6e7880f632ec18f2f8","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-14 10:06:09","2024-01-14 10:06:09","2025-01-14 10:06:09");
INSERT INTO oauth_access_tokens VALUES("75571cc31701a81cc735c5fcc7a9b84df3a67392f54c6ed94de7d8d3910bea72e2462009c5f86c67","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-23 09:51:02","2023-08-23 09:51:02","2024-08-23 09:51:02");
INSERT INTO oauth_access_tokens VALUES("78ad9d7d025ce726a6d0d76d9c1eb6bfb1e8518de8675244e9223396c84a619c38835cb3445a6cb5","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-01 09:41:20","2023-11-01 09:41:20","2024-11-01 09:41:20");
INSERT INTO oauth_access_tokens VALUES("79156e0ce3382c1eaef29e422bddbda8b94a6e2660e122e2de90156833189f03b91ef0a38110fd26","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-03 10:08:49","2023-09-03 10:08:49","2024-09-03 10:08:49");
INSERT INTO oauth_access_tokens VALUES("79b4ebf98acb3602bc17d7d0d46e00da4c39ea89ef07ff61ea3e39101e751fef93a9636edec6d974","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-10 09:37:48","2024-01-10 09:37:48","2025-01-10 09:37:48");
INSERT INTO oauth_access_tokens VALUES("7cc2faed087915d4923b13ef4a9c73230cd878cb6a1070b92b0d5c4e3ea2a4ac0e62455b3e82206a","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-24 12:32:56","2023-08-24 12:32:56","2024-08-24 12:32:56");
INSERT INTO oauth_access_tokens VALUES("7ecda71e725f4b1743af695704ab3742dfdea39c4df85a353f0ff5a7b1addc08e305339c8578caf2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-21 04:23:58","2023-06-21 04:23:58","2024-06-21 04:23:58");
INSERT INTO oauth_access_tokens VALUES("7f05a3679667e3da26939adbea42b521afa5fac78be4616c13319d3afe27996514b4e3ff08184590","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-02 14:15:33","2023-11-02 14:15:33","2024-11-02 14:15:33");
INSERT INTO oauth_access_tokens VALUES("7fb4f88266823ab4de2ff54252ac4cafdc50cfdbaf505ae0bb714f0c71511cbd504712bf6c040fde","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-08 09:29:05","2024-01-08 09:29:05","2025-01-08 09:29:05");
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
INSERT INTO oauth_access_tokens VALUES("90ce5bd41d60987d6cc0633ec5ac6c208f57acf0a252501e1597ef557bfc2a337ee29834299d74da","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-09 13:04:36","2024-01-09 13:04:36","2025-01-09 13:04:36");
INSERT INTO oauth_access_tokens VALUES("911701a713244cf5463f6c6f50f33d228efae57aa074a1ca269c6a46004ceec221bd62692d58e430","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-12 08:39:40","2023-07-12 08:39:40","2024-07-12 08:39:40");
INSERT INTO oauth_access_tokens VALUES("913db499406c47bd7bd5bd81cd248dc136c0d5ee41b2ca8e247190383545c9acfb3321aa9fc25599","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-09 10:08:31","2023-10-09 10:08:31","2024-10-09 10:08:31");
INSERT INTO oauth_access_tokens VALUES("919657a3040559a0edd781be2e22d90c7577cc45770b4a7028d39fe4c12f952ed53d5a598d04ffad","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-12-24 14:32:55","2023-12-24 14:32:55","2024-12-24 14:32:55");
INSERT INTO oauth_access_tokens VALUES("93161029e257b4ef36f5079ff4dd803d1720c563a9a15ff7bd13045417a5acbcc8985ba10ffc4c07","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-05 09:40:03","2023-11-05 09:40:03","2024-11-05 09:40:03");
INSERT INTO oauth_access_tokens VALUES("942a20b684fe73162f6e27d3be06936b21f33841e94eaa2e8baac1b909aff5842d739a48b4aea0a7","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-23 04:17:21","2023-07-23 04:17:21","2024-07-23 04:17:21");
INSERT INTO oauth_access_tokens VALUES("979f0c883120fa961658969511d28b18e05792c8ce9cccc1a2c7b604c67e924bef2a0784b7733427","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-02 04:46:01","2023-08-02 04:46:01","2024-08-02 04:46:01");
INSERT INTO oauth_access_tokens VALUES("9869ddccdfa4c9f024c8620e6372fbe3b166e8b583afebf198501837a9d97789211b214191398f8d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-12 09:56:22","2023-09-12 09:56:22","2024-09-12 09:56:22");
INSERT INTO oauth_access_tokens VALUES("9b4fb0a528bbcf2a099a9c77707f9a4c2ea6a404f2eb7b7f9f9d25523cc18f2e855a0b7f8fd44011","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-18 05:41:46","2023-07-18 05:41:46","2024-07-18 05:41:46");
INSERT INTO oauth_access_tokens VALUES("9c4ccb0472855246ffc021d9db09823192a1a31c9e0620dafd64235e5dfed362b2d994788cd448ad","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-19 04:29:07","2023-06-19 04:29:07","2024-06-19 04:29:07");
INSERT INTO oauth_access_tokens VALUES("9cd68aa7ad2471de0c94417f694b1f3a878ab03220971b5150a6a5b143efd093bd8df3375bedfe44","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-08 14:37:56","2024-01-08 14:37:56","2025-01-08 14:37:56");
INSERT INTO oauth_access_tokens VALUES("a0b6e27ee1eb90ee325e0df101a0273f3eddb6257c51d9bee6f412525525b427f06893e757364de0","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-16 03:58:58","2023-05-16 03:58:58","2024-05-16 03:58:58");
INSERT INTO oauth_access_tokens VALUES("a3e252da6af402ecf00480fe420b3f999cf469884ebc4523073c6486c2fd4650e57bfc6ee5b9f5c8","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-14 13:05:19","2024-01-14 13:05:19","2025-01-14 13:05:19");
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
INSERT INTO oauth_access_tokens VALUES("cb851c33da66df46f9d63c90d0fc8cf9e118bc7597986d35ac541649053cf6695211b5a722616e11","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-16 11:54:02","2024-01-16 11:54:02","2025-01-16 11:54:02");
INSERT INTO oauth_access_tokens VALUES("cc193f02fa98a2ef77bf12e57286c7f97c482b992a07750a5badb7747f783b179cdd5bf4bff021a2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-15 04:08:52","2023-05-15 04:08:52","2024-05-15 04:08:52");
INSERT INTO oauth_access_tokens VALUES("cc2df446fa1a170f912b93bec7c6343b286298ab94944b5103e2afabd153ecc44500a8d2beb7ad3f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-26 07:04:03","2023-07-26 07:04:03","2024-07-25 18:04:03");
INSERT INTO oauth_access_tokens VALUES("d2e724bd3c7fe6c31065e687734fa0aadd1c5cbc06a48e6a034d88ece911821c17ec4bee85d75d4d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-10 10:19:17","2023-09-10 10:19:17","2024-09-10 10:19:17");
INSERT INTO oauth_access_tokens VALUES("d4ea416ce5bc1e12968348a7d1ab49327fc1774d83144a7ab0c31a2ba318936a2697579087cc3472","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-07 14:37:24","2023-11-07 14:37:24","2024-11-07 14:37:24");
INSERT INTO oauth_access_tokens VALUES("d6afabbad7e57512a30efe34e4040919cd1532deb3ca76e037ba58a814dbb206e6127dca3e9d0107","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-02 09:44:39","2023-10-02 09:44:39","2024-10-02 09:44:39");
INSERT INTO oauth_access_tokens VALUES("d6f82c6429c79aefa4295ea8f4d45554c2de0662bf25b8f0b5fc3b37b443db96b93a1803c1c1ae4f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-07 10:24:56","2023-09-07 10:24:56","2024-09-07 10:24:56");
INSERT INTO oauth_access_tokens VALUES("d961e0211e88a87d6f7fd37371574e264d4858c97450d4eb7fe03f897a6118df265345f45666e9bf","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-21 14:56:16","2024-01-21 14:56:16","2025-01-21 14:56:16");
INSERT INTO oauth_access_tokens VALUES("d98441766ce45d3bdcf4be7e905e060e98650251f803806f4e68af1b8440ad506a22b2de7b9edb37","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-03 09:31:08","2023-10-03 09:31:08","2024-10-03 09:31:08");
INSERT INTO oauth_access_tokens VALUES("d9bb4ebe133fb1cfe81f9d42c646ace89447c2081d1f876070945d6d9954bb63a5f7a37350d75888","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-11-09 09:34:25","2023-11-09 09:34:25","2024-11-09 09:34:25");
INSERT INTO oauth_access_tokens VALUES("da92cc2e6d27e1dabfde519f1f5d8119a5abf266dfdf1a2e595d23cd76fe1185c502f90d13cd46a2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-22 09:31:45","2023-10-22 09:31:45","2024-10-22 09:31:45");
INSERT INTO oauth_access_tokens VALUES("dee69f56ae9849aacb99fcad1f2bda7ca7ea063aba04ea251cf3a0a85157582ace0095aa025ddf4f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-11 04:12:43","2023-07-11 04:12:43","2024-07-11 04:12:43");
INSERT INTO oauth_access_tokens VALUES("e026da801225ee44a021a69261b7b415bc0c3e307d90f0e8cb89bc7f2577a254aa58d8e254d1f111","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-07 04:05:15","2023-08-07 04:05:15","2024-08-07 04:05:15");
INSERT INTO oauth_access_tokens VALUES("e35b35c1defb0f7c6dda46add7f3d1c218e7bf7691a59c42f5f21ea51cd5f2f1b5edaedad585b612","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-10-10 09:38:08","2023-10-10 09:38:08","2024-10-10 09:38:08");
INSERT INTO oauth_access_tokens VALUES("e46f8119d237fce2fcd5b312a63f46e9d972a1bd4a940fdfac62c1e4f94840d84a1515e27b33dff1","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-25 10:00:07","2023-09-25 10:00:07","2024-09-25 10:00:07");
INSERT INTO oauth_access_tokens VALUES("e7017f18b32aabcb0d6b1c1332acc450390c85d3cde61d1a5bc5a3522a05352f7f3f01c3463f470d","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-03 04:11:25","2023-08-03 04:11:25","2024-08-03 04:11:25");
INSERT INTO oauth_access_tokens VALUES("e74b55e655559e88a3aa38803c8388d6d1163ab6acceac60d97c8b47a2bcedde396e49184c6ddc82","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-08-01 04:27:31","2023-08-01 04:27:31","2024-08-01 04:27:31");
INSERT INTO oauth_access_tokens VALUES("e8829d6924773c9cf643e8398460a478dc3a0dc8572b9d787f64e88ecb0114082977741eba01e569","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-14 06:08:23","2023-05-14 06:08:23","2024-05-14 06:08:23");
INSERT INTO oauth_access_tokens VALUES("e9539971042b1676c79a46ea566a0c00852c909957bc0d1cd50eddd52d8340509942289251657c73","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-06-25 04:11:43","2023-06-25 04:11:43","2024-06-25 04:11:43");
INSERT INTO oauth_access_tokens VALUES("ece6ce0fe35d778d86a3a1ff1821096783a125df2428fe1d23a03b051beef22517e42444cf852ec2","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-17 10:08:06","2023-09-17 10:08:06","2024-09-17 10:08:06");
INSERT INTO oauth_access_tokens VALUES("eea5b82b9f5816a76366c9b40bdc95311b0c6628e5591170624f9b0b2087e096c9d89e3a0ab916ab","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-04 10:19:28","2023-09-04 10:19:28","2024-09-04 10:19:28");
INSERT INTO oauth_access_tokens VALUES("f0ec6a0213917dcd7f847b662cbc273e367d613689b4946fc8df2bdf33270c7398f17b3a20a2afda","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-09-05 10:08:35","2023-09-05 10:08:35","2024-09-05 10:08:35");
INSERT INTO oauth_access_tokens VALUES("f3d90947f9bbfdbd56bcbdab082fb63174e1f526bc7e7587e283470a8269cc80c4902808a57e5f08","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-12-26 09:57:05","2023-12-26 09:57:05","2024-12-26 09:57:05");
INSERT INTO oauth_access_tokens VALUES("f7238aad3b4f4645922fa2a500f59a7899d1d826266892fceb74d7e8c438860fd8893fabe0627008","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-07-19 04:23:57","2023-07-19 04:23:57","2024-07-19 04:23:57");
INSERT INTO oauth_access_tokens VALUES("f7b9d966ac97c5ce0a1349b2042382a01d07e65773178a6e07ff9efa938f6613b0e63cb46b9a882f","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2023-05-18 04:27:46","2023-05-18 04:27:46","2024-05-18 04:27:46");
INSERT INTO oauth_access_tokens VALUES("fcac65eda40d9fc0a362aad560dd2c5b2cf2643eac07e0222fd2b6d01b8f802cdc23b43383f71718","1","9923b022-0553-42b7-a9e4-97e4a1fd5888","superAdmin@gmail.com","[]","0","2024-01-14 12:54:59","2024-01-14 12:54:59","2025-01-14 12:54:59");



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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payments VALUES("1","","3","","1","1","Cash","ppr-20231224-124301","","2706","0","","2023-12-24 12:43:01","2023-12-24 12:43:01");
INSERT INTO payments VALUES("2","","2","","1","1","Cash","ppr-20231224-124308","","2706","0","","2023-12-24 12:43:08","2023-12-24 12:43:08");
INSERT INTO payments VALUES("3","","1","","1","1","Cash","ppr-20231224-124315","","1353","0","","2023-12-24 12:43:15","2023-12-24 12:43:15");
INSERT INTO payments VALUES("4","1","","1","1","1","Cash","spr-20231224-023634","","349.57","0","","2023-12-24 14:36:34","2023-12-24 14:36:34");
INSERT INTO payments VALUES("5","3","","1","1","1","Cash","spr-20240103-034114","","699.14","0","","2024-01-03 15:41:14","2024-01-03 15:41:14");
INSERT INTO payments VALUES("6","12","","1","1","1","Cash","spr-20240116-040439","","349.57","0","","2024-01-16 16:04:39","2024-01-16 16:04:39");
INSERT INTO payments VALUES("7","12","","1","1","1","Cash","spr-20240116-040531","","349.57","0","","2024-01-16 16:05:31","2024-01-16 16:05:31");
INSERT INTO payments VALUES("8","12","","1","1","1","Cash","spr-20240116-040922","","-349.57","0","","2024-01-16 16:09:22","2024-01-16 16:09:22");
INSERT INTO payments VALUES("9","11","","1","1","1","Cash","spr-20240116-040940","","349.57","0","","2024-01-16 16:09:40","2024-01-16 16:10:06");
INSERT INTO payments VALUES("10","13","","1","1","1","Cash","spr-20240116-050339","","349.57","0","","2024-01-16 17:03:39","2024-01-16 17:03:39");



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
  `invoice_option` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `stripe_public_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keybord_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO pos_settings VALUES("1","1","","2","1","59","pk_test_ginW3sQe0P9TU1RkhUtSYoxX00vm6cWDMt","sk_test_R17wtLy5yfYEIUn0hodhrNZf00QDeUGPfD",""cash,cheque,gift_card"","0","2023-09-07 15:18:15","2023-11-06 11:47:25");



CREATE TABLE `postmetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postmetas_cat_id_foreign` (`cat_id`),
  CONSTRAINT `postmetas_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`)
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
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_purchases VALUES("1","1","1","","","","10","10","1","123","0","10","123","1353","2023-12-24 12:32:22","2023-12-24 12:32:22");
INSERT INTO product_purchases VALUES("2","2","2","1","","","10","10","1","246","0","10","246","2706","2023-12-24 12:42:11","2023-12-24 12:42:11");
INSERT INTO product_purchases VALUES("3","3","2","2","","","10","10","1","246","0","10","246","2706","2023-12-24 12:42:46","2023-12-24 12:42:46");
INSERT INTO product_purchases VALUES("4","4","3","","","","1000","1000","1","123","0","10","12300","135300","2024-01-16 15:10:20","2024-01-16 15:10:20");



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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_sales VALUES("1","1","","1","","","1","1","317.79","0","10","31.78","349.57","2023-12-24 13:11:17","2023-12-24 13:11:17");
INSERT INTO product_sales VALUES("21","2","","1","","","1","1","317.79","0","10","31.78","349.57","2024-01-02 16:53:08","2024-01-14 11:48:27");
INSERT INTO product_sales VALUES("38","2","","2","","2","1","1","635.58","0","10","63.56","699.14","2024-01-03 10:46:32","2024-01-03 10:46:32");
INSERT INTO product_sales VALUES("39","2","","2","","1","1","1","635.58","0","10","63.56","699.14","2024-01-03 10:46:32","2024-01-03 10:46:32");
INSERT INTO product_sales VALUES("40","3","","2","","2","1","1","635.58","0","10","63.56","699.14","2024-01-03 15:40:58","2024-01-03 15:40:58");
INSERT INTO product_sales VALUES("41","4","","1","","","1","1","288.9","0","10","28.89","317.79","2024-01-14 13:00:28","2024-01-14 13:00:28");
INSERT INTO product_sales VALUES("42","7","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 15:44:16","2024-01-16 15:44:16");
INSERT INTO product_sales VALUES("43","8","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 15:45:25","2024-01-16 15:45:25");
INSERT INTO product_sales VALUES("44","9","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 15:55:04","2024-01-16 15:55:04");
INSERT INTO product_sales VALUES("45","10","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 15:57:03","2024-01-16 15:57:03");
INSERT INTO product_sales VALUES("46","11","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 15:59:14","2024-01-16 15:59:14");
INSERT INTO product_sales VALUES("47","12","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 16:02:53","2024-01-16 16:02:53");
INSERT INTO product_sales VALUES("48","13","","3","","","1","1","317.79","0","10","31.78","349.57","2024-01-16 17:03:21","2024-01-16 17:03:21");



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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_variants VALUES("1","2","1","1","s-51449085","123","321","40","","2023-12-24 12:31:34","2024-01-14 11:48:27");
INSERT INTO product_variants VALUES("2","2","2","2","m-51449085","123","321","46","","2023-12-24 12:31:34","2024-01-14 11:48:27");
INSERT INTO product_variants VALUES("3","9","1","1","s-arnonw","123","321","0","","2024-01-18 17:11:10","2024-01-18 17:11:10");
INSERT INTO product_variants VALUES("4","9","2","2","m-arnonw","123","321","0","","2024-01-18 17:11:10","2024-01-18 17:11:10");
INSERT INTO product_variants VALUES("5","10","1","1","s-9z98pd","","","0","","2024-01-18 17:14:09","2024-01-18 17:14:09");
INSERT INTO product_variants VALUES("6","10","2","2","m-9z98pd","","","0","","2024-01-18 17:14:09","2024-01-18 17:14:09");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_warehouses VALUES("1","1","2","","","","86","","","2023-12-24 12:32:22","2024-01-14 13:00:28");
INSERT INTO product_warehouses VALUES("2","2","2","1","","","112","","","2023-12-24 12:42:11","2024-01-14 11:48:27");
INSERT INTO product_warehouses VALUES("3","2","2","2","","","34","","","2023-12-24 12:42:46","2024-01-14 11:48:27");
INSERT INTO product_warehouses VALUES("4","3","2","","","","993","","","2024-01-16 15:10:20","2024-01-21 15:07:50");
INSERT INTO product_warehouses VALUES("5","4","2","","","","0","","","2024-01-16 15:39:32","2024-01-21 14:59:45");



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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES("1","standard","solid product","solid_product","22380793","321","123","","","","","","1","2","","2023-12-24 12:29","20","","","","","","","","1","","","1","","1","","","1","1","","1","1","1","1","1","","","","2","1","","2023-12-24 12:30:14","2024-01-14 13:00:28");
INSERT INTO products VALUES("2","standard","varient product","varient_product","51449085","321","123","","","","","","1","2","","2023-12-24 12:30","49","","1","111","2023-12-24","2023-12-31","","","1","["size"]","["s,m"]","1","","1","","","2","2","","1","1","1","1","1","1","","","2","1","","2023-12-24 12:31:34","2024-01-14 11:48:27");
INSERT INTO products VALUES("3","standard","aari","aari","tb3ljw","321","123","","","","","","1","1","","2024-01-16 15:09","993","","","","","","","","1","","","1","","1","","","2","1","","1","1","1","1","1","","","","1","1","","2024-01-16 15:09:47","2024-01-21 15:07:49");
INSERT INTO products VALUES("4","standard","aari(pakisten)","aari(pakisten)","n7xty7","321","123","","","","","","","1","","2024-01-16 15:38","0","","","","","","","","1","","","1","","1","","","1","1","","1","1","1","1","1","","","","1","1","","2024-01-16 15:38:54","2024-01-21 14:59:45");
INSERT INTO products VALUES("9","standard","shart","shart","arnonw","321","123","","","zummXD2dvAtI.png","<p>Product Details</p>","","1","1","","2024-01-18 17:09","","","1","123","","","","","1","["size"]","["s,m"]","1","","1","","","2","1","","1","1","1","1","1","1","","","1","1","","2024-01-18 17:11:10","2024-01-21 10:28:38");
INSERT INTO products VALUES("10","standard","sharee","sharee","9z98pd","321","123","","","","<p>Product Details</p>","","1","1","","2024-01-18 17:28","0","","1","123","2024-01-18","","","","1","["size"]","["s,m"]","1","","1","","","2","1","","1","1","1","1","1","1","","","1","1","","2024-01-18 17:14:09","2024-01-18 17:29:53");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchases VALUES("1","pr-20231224-123222","2","1","1","10","0","123","1353","0","0","","","1353","","1353","1","2","","","","","2023-12-24 12:32:22","2023-12-24 12:43:15");
INSERT INTO purchases VALUES("2","pr-20231224-124211","2","1","1","10","0","246","2706","0","0","","","2706","","2706","1","2","","","","","2023-12-24 12:42:11","2023-12-24 12:43:08");
INSERT INTO purchases VALUES("3","pr-20231224-124246","2","1","1","10","0","246","2706","0","0","","","2706","","2706","1","2","","","","","2023-12-24 12:42:46","2023-12-24 12:43:01");
INSERT INTO purchases VALUES("4","pr-20240116-031020","2","1","1","1000","0","12300","135300","0","0","","","135300","","0","1","1","","","","","2024-01-16 15:10:20","2024-01-16 15:10:20");



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
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO sales VALUES("1","sr-20231224-011116","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","4","","349.57","","","2023-12-24 13:11:16","2023-12-24 14:36:34");
INSERT INTO sales VALUES("2","sr-20240102-025051","2","2","1","","","1","[null,"2","1"]","1","3","3","0","158.9","1747.85","1917.63","10","169.78","50","Flat","50","50","2","2","","","","","2024-01-02 14:50:51","2024-01-14 11:48:27");
INSERT INTO sales VALUES("3","sr-20240103-034057","1","2","2","","","1","","1","1","1","0","63.56","699.14","699.14","0","0","0","Flat","","","1","4","","699.14","","","2024-01-03 15:40:58","2024-01-03 15:41:15");
INSERT INTO sales VALUES("4","sr-20240114-010028","3","2","1","","","1","","1","1","1","0","28.89","317.79","317.79","0","0","0","Flat","","","1","1","","","","","2024-01-14 13:00:28","2024-01-14 13:00:28");
INSERT INTO sales VALUES("5","sr-20240116-034112","2","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:41:12","2024-01-16 15:41:12");
INSERT INTO sales VALUES("6","sr-20240116-034241","2","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:42:41","2024-01-16 15:42:41");
INSERT INTO sales VALUES("7","sr-20240116-034416","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:44:16","2024-01-16 15:44:16");
INSERT INTO sales VALUES("8","sr-20240116-034525","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:45:25","2024-01-16 15:45:25");
INSERT INTO sales VALUES("9","sr-20240116-035504","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:55:04","2024-01-16 15:55:04");
INSERT INTO sales VALUES("10","sr-20240116-035702","2","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","1","","","","","2024-01-16 15:57:02","2024-01-16 15:57:02");
INSERT INTO sales VALUES("11","sr-20240116-035914","1","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","4","","349.57","","","2024-01-16 15:59:14","2024-01-16 16:10:06");
INSERT INTO sales VALUES("12","sr-20240116-040252","2","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","4","","349.57","","","2024-01-16 16:02:52","2024-01-16 16:09:22");
INSERT INTO sales VALUES("13","sr-20240116-050321","2","2","1","","","1","","1","1","1","0","31.78","349.57","349.57","0","0","0","Flat","","","1","4","","349.57","","","2024-01-16 17:03:21","2024-01-16 17:03:39");



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

INSERT INTO sessions VALUES("RIVdv3ylzM1aq0klBP8cUZ74CYILM4AO6UnQjcrU","1","127.0.0.1","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","YTo3OntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo2NToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3N1cGVyQWRtaW4vZ2FuZXJhbHNldHRpbmcuc3VwZXJhZG1pbnNldHRpbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiU0hkMEI3QzZtelRDTGl6eThsM2xhWTJYNjZJZkNxZzVyQkV4c0o5SyI7czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTI6InVzZXJfc2Vzc2lvbiI7czoyMDoic3VwZXJBZG1pbkBnbWFpbC5jb20iO3M6MTI6InBhc3Nfc2Vzc2lvbiI7czo5OiIxMjM0NTY3ODkiO30=","1705830077");



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO stock_counts VALUES("1","scr-20240121-033946","2","","","1","full","20240121-033946.csv","","","0","2024-01-21 15:39:46","2024-01-21 15:39:46");



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



CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_person` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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

INSERT INTO users VALUES("1","superAdmin","superadmin@gmail.com","","1","","$2y$10$sIaS00DJD//DrEbrMZLuuuvNVBcU8hONrotV2sKaWA/BJvn.xpw5G","","","eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTIzYjAyMi0wNTUzLTQyYjctYTllNC05N2U0YTFmZDU4ODgiLCJqdGkiOiJkOTYxZTAyMTFlODhhODdkNmY3ZmQzNzM3MTU3NGUyNjRkNDg1OGM5NzQ1MGQ0ZWI3ZmUwM2Y4OTdhNjExOGRmMjY1MzQ1ZjQ1NjY2ZTliZiIsImlhdCI6MTcwNTgyNzM3Ni42NDU1MjIsIm5iZiI6MTcwNTgyNzM3Ni42NDU1MjksImV4cCI6MTczNzQ0OTc3Ni40NTk3MDQsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.OLy0YUAfGy4MxWmLjNB2mrBP7xwk3_EAWDjRzPJo5uNdf9_ZkxPr4LwbWADxLWdxbkLbJTg-dc5QTR9NQAxrA-Wb2DxKyhmsGJqWq27yxTpr3vHB-kCtBAOPgrS50R_YeWRWY65qZawy3bh0FJnNbBvNL1vCM3_Fpr4QlBi2aPk5Se_qISAJsmZxRQxmWAbjwcoBG9uwc8rlHWKtNroFDqmu8R44kFdZeqCb8ynYGVtrY8JzjWdeG7wfUHJQYRJlVI2Sq0W5GTAwxd6onriqmpFSADVCPZIonCGAYa1cC097L0JbsfFG-M9TOXYuC8rjmnfILd78O88qbrZBTBTCUXK0z-qqyzQMtq2h5nXSbMbg0w5iIQy5u3kmUIbE2Ue3ZBE8JDVFZeRkZiH2AjOgTrx8TanNyd5nEp2ABJ5QO9rm_gJKmLiXl8XBjE1UKW4FepnPCbJ0Yu7_ZoPdNpKZAw7MXazlTbFh7fOqD7YEvJBnJnf-S_oMkJtoF5nQ7cX6Gnhw8bQydD1WNmwzIcckf3vdUyuld5qQPChzcfQZESJLl4RMGytwk7qh3BtEtCUWM6hNg4xgId99yWWM_7l6gT1eoOGyBj9x83jVA9j8uxgEbKTSggKvULQ7ugdBSLyvJ1o9l7mD1vPpr3tutp6bmVgHVM1sYUO1b5LmUA3P_5Y","1","1","1","","qaaXIospXi2QTvwnjHwx6YOmVXx6Lxhau1j3hBQFPi2QPtE3L243hRjJIwF2","","2024-01-21 14:56:16");
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
  CONSTRAINT `whitelists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


