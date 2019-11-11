-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for fleetcart
CREATE DATABASE IF NOT EXISTS `fleetcart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fleetcart`;

-- Dumping structure for table fleetcart.activations
CREATE TABLE IF NOT EXISTS `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.activations: ~1 rows (approximately)
DELETE FROM `activations`;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'aHMp68W6NQAzPJCNkcMMvcGlpxgCWjhw', 1, '2019-11-11 09:21:23', '2019-11-11 09:21:23', '2019-11-11 09:21:23');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attributes
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attributes_attribute_set_id_index` (`attribute_set_id`),
  CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attributes: ~0 rows (approximately)
DELETE FROM `attributes`;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_categories
CREATE TABLE IF NOT EXISTS `attribute_categories` (
  `attribute_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`category_id`),
  KEY `attribute_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_categories: ~0 rows (approximately)
DELETE FROM `attribute_categories`;
/*!40000 ALTER TABLE `attribute_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_categories` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_sets
CREATE TABLE IF NOT EXISTS `attribute_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_sets: ~0 rows (approximately)
DELETE FROM `attribute_sets`;
/*!40000 ALTER TABLE `attribute_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_sets` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_set_translations
CREATE TABLE IF NOT EXISTS `attribute_set_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_set_translations_attribute_set_id_locale_unique` (`attribute_set_id`,`locale`),
  CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_set_translations: ~0 rows (approximately)
DELETE FROM `attribute_set_translations`;
/*!40000 ALTER TABLE `attribute_set_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_set_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_translations
CREATE TABLE IF NOT EXISTS `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_translations: ~0 rows (approximately)
DELETE FROM `attribute_translations`;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_values
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_index` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_values: ~0 rows (approximately)
DELETE FROM `attribute_values`;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;

-- Dumping structure for table fleetcart.attribute_value_translations
CREATE TABLE IF NOT EXISTS `attribute_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_value_translations_attribute_value_id_locale_unique` (`attribute_value_id`,`locale`),
  CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.attribute_value_translations: ~0 rows (approximately)
DELETE FROM `attribute_value_translations`;
/*!40000 ALTER TABLE `attribute_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.categories: ~0 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table fleetcart.category_translations
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.category_translations: ~0 rows (approximately)
DELETE FROM `category_translations`;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(18,4) unsigned DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `maximum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `usage_limit_per_coupon` int(10) unsigned DEFAULT NULL,
  `usage_limit_per_customer` int(10) unsigned DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.coupons: ~0 rows (approximately)
DELETE FROM `coupons`;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table fleetcart.coupon_categories
CREATE TABLE IF NOT EXISTS `coupon_categories` (
  `coupon_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`category_id`,`exclude`),
  KEY `coupon_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.coupon_categories: ~0 rows (approximately)
DELETE FROM `coupon_categories`;
/*!40000 ALTER TABLE `coupon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_categories` ENABLE KEYS */;

-- Dumping structure for table fleetcart.coupon_products
CREATE TABLE IF NOT EXISTS `coupon_products` (
  `coupon_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`,`product_id`),
  KEY `coupon_products_product_id_foreign` (`product_id`),
  CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.coupon_products: ~0 rows (approximately)
DELETE FROM `coupon_products`;
/*!40000 ALTER TABLE `coupon_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.coupon_translations
CREATE TABLE IF NOT EXISTS `coupon_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_translations_coupon_id_locale_unique` (`coupon_id`,`locale`),
  CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.coupon_translations: ~0 rows (approximately)
DELETE FROM `coupon_translations`;
/*!40000 ALTER TABLE `coupon_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.cross_sell_products
CREATE TABLE IF NOT EXISTS `cross_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `cross_sell_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`cross_sell_product_id`),
  KEY `cross_sell_products_cross_sell_product_id_foreign` (`cross_sell_product_id`),
  CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.cross_sell_products: ~0 rows (approximately)
DELETE FROM `cross_sell_products`;
/*!40000 ALTER TABLE `cross_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cross_sell_products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.currency_rates
CREATE TABLE IF NOT EXISTS `currency_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_rates_currency_unique` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.currency_rates: ~1 rows (approximately)
DELETE FROM `currency_rates`;
/*!40000 ALTER TABLE `currency_rates` DISABLE KEYS */;
INSERT INTO `currency_rates` (`id`, `currency`, `rate`, `created_at`, `updated_at`) VALUES
	(1, 'USD', 1.0000, '2019-11-11 09:21:23', '2019-11-11 09:21:23');
/*!40000 ALTER TABLE `currency_rates` ENABLE KEYS */;

-- Dumping structure for table fleetcart.entity_files
CREATE TABLE IF NOT EXISTS `entity_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_files_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `entity_files_file_id_index` (`file_id`),
  KEY `entity_files_zone_index` (`zone`),
  CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.entity_files: ~0 rows (approximately)
DELETE FROM `entity_files`;
/*!40000 ALTER TABLE `entity_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_files` ENABLE KEYS */;

-- Dumping structure for table fleetcart.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_index` (`user_id`),
  KEY `files_filename_index` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.files: ~0 rows (approximately)
DELETE FROM `files`;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- Dumping structure for table fleetcart.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.menus: ~0 rows (approximately)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Dumping structure for table fleetcart.menu_items
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT '0',
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  KEY `menu_items_category_id_foreign` (`category_id`),
  KEY `menu_items_page_id_foreign` (`page_id`),
  KEY `menu_items_menu_id_index` (`menu_id`),
  CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.menu_items: ~0 rows (approximately)
DELETE FROM `menu_items`;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Dumping structure for table fleetcart.menu_item_translations
CREATE TABLE IF NOT EXISTS `menu_item_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`),
  CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.menu_item_translations: ~0 rows (approximately)
DELETE FROM `menu_item_translations`;
/*!40000 ALTER TABLE `menu_item_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_item_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.menu_translations
CREATE TABLE IF NOT EXISTS `menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.menu_translations: ~0 rows (approximately)
DELETE FROM `menu_translations`;
/*!40000 ALTER TABLE `menu_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.meta_data
CREATE TABLE IF NOT EXISTS `meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_data_entity_type_entity_id_index` (`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.meta_data: ~0 rows (approximately)
DELETE FROM `meta_data`;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;

-- Dumping structure for table fleetcart.meta_data_translations
CREATE TABLE IF NOT EXISTS `meta_data_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_data_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_data_translations_meta_data_id_locale_unique` (`meta_data_id`,`locale`),
  CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.meta_data_translations: ~0 rows (approximately)
DELETE FROM `meta_data_translations`;
/*!40000 ALTER TABLE `meta_data_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.migrations: ~62 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_07_02_230147_migration_cartalyst_sentinel', 1),
	(2, '2014_10_14_200250_create_settings_table', 1),
	(3, '2014_10_26_162751_create_files_table', 1),
	(4, '2014_10_30_191858_create_pages_table', 1),
	(5, '2014_11_31_125848_create_page_translations_table', 1),
	(6, '2015_02_27_105241_create_entity_files_table', 1),
	(7, '2015_11_20_184604486385_create_translations_table', 1),
	(8, '2015_11_20_184604743083_create_translation_translations_table', 1),
	(9, '2017_05_29_155126144426_create_products_table', 1),
	(10, '2017_05_30_155126416338_create_product_translations_table', 1),
	(11, '2017_08_02_153217_create_options_table', 1),
	(12, '2017_08_02_153348_create_option_translations_table', 1),
	(13, '2017_08_02_153406_create_option_values_table', 1),
	(14, '2017_08_02_153736_create_option_value_translations_table', 1),
	(15, '2017_08_03_156576_create_product_options_table', 1),
	(16, '2017_08_17_170128_create_related_products_table', 1),
	(17, '2017_08_17_175236_create_up_sell_products_table', 1),
	(18, '2017_08_17_175828_create_cross_sell_products_table', 1),
	(19, '2017_11_09_141332910964_create_categories_table', 1),
	(20, '2017_11_09_141332931539_create_category_translations_table', 1),
	(21, '2017_11_26_083614526622_create_meta_data_table', 1),
	(22, '2017_11_26_083614526828_create_meta_data_translations_table', 1),
	(23, '2018_01_24_125642_create_product_categories_table', 1),
	(24, '2018_02_04_150917488267_create_coupons_table', 1),
	(25, '2018_02_04_150917488698_create_coupon_translations_table', 1),
	(26, '2018_03_11_181317_create_coupon_products_table', 1),
	(27, '2018_03_15_091937_create_coupon_categories_table', 1),
	(28, '2018_04_18_154028776225_create_reviews_table', 1),
	(29, '2018_05_17_115822452977_create_currency_rates_table', 1),
	(30, '2018_07_03_124153537506_create_sliders_table', 1),
	(31, '2018_07_03_124153537695_create_slider_translations_table', 1),
	(32, '2018_07_03_133107770172_create_slider_slides_table', 1),
	(33, '2018_07_03_133107770486_create_slider_slide_translations_table', 1),
	(34, '2018_07_28_190524758357_create_attribute_sets_table', 1),
	(35, '2018_07_28_190524758497_create_attribute_set_translations_table', 1),
	(36, '2018_07_28_190524758646_create_attributes_table', 1),
	(37, '2018_07_28_190524758877_create_attribute_translations_table', 1),
	(38, '2018_07_28_190524759461_create_product_attributes_table', 1),
	(39, '2018_08_01_001919718631_create_tax_classes_table', 1),
	(40, '2018_08_01_001919718935_create_tax_class_translations_table', 1),
	(41, '2018_08_01_001919723551_create_tax_rates_table', 1),
	(42, '2018_08_01_001919723781_create_tax_rate_translations_table', 1),
	(43, '2018_08_03_195922206748_create_attribute_values_table', 1),
	(44, '2018_08_03_195922207019_create_attribute_value_translations_table', 1),
	(45, '2018_08_04_190524764275_create_product_attribute_values_table', 1),
	(46, '2018_08_07_135631306565_create_orders_table', 1),
	(47, '2018_08_07_135631309451_create_order_products_table', 1),
	(48, '2018_08_07_135631309512_create_order_product_options_table', 1),
	(49, '2018_08_07_135631309624_create_order_product_option_values_table', 1),
	(50, '2018_09_11_213926106353_create_transactions_table', 1),
	(51, '2018_09_19_081602135631_create_order_taxes_table', 1),
	(52, '2018_09_19_103745_create_setting_translations_table', 1),
	(53, '2018_10_01_224852175056_create_wish_lists_table', 1),
	(54, '2018_10_04_185608_create_search_terms_table', 1),
	(55, '2018_11_03_160015_create_menus_table', 1),
	(56, '2018_11_03_160138_create_menu_translations_table', 1),
	(57, '2018_11_03_160753_create_menu_items_table', 1),
	(58, '2018_11_03_160804_create_menu_item_translation_table', 1),
	(59, '2019_02_05_162605_add_position_to_slider_slides_table', 1),
	(60, '2019_02_09_164343_remove_file_id_from_slider_slides_table', 1),
	(61, '2019_02_09_164434_add_file_id_to_slider_slide_translations_table', 1),
	(62, '2019_02_14_103408_create_attribute_categories_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.options
CREATE TABLE IF NOT EXISTS `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.options: ~0 rows (approximately)
DELETE FROM `options`;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;

-- Dumping structure for table fleetcart.option_translations
CREATE TABLE IF NOT EXISTS `option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_translations_option_id_locale_unique` (`option_id`,`locale`),
  CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.option_translations: ~0 rows (approximately)
DELETE FROM `option_translations`;
/*!40000 ALTER TABLE `option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.option_values
CREATE TABLE IF NOT EXISTS `option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  `price_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_values_option_id_index` (`option_id`),
  CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.option_values: ~0 rows (approximately)
DELETE FROM `option_values`;
/*!40000 ALTER TABLE `option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values` ENABLE KEYS */;

-- Dumping structure for table fleetcart.option_value_translations
CREATE TABLE IF NOT EXISTS `option_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_value_translations_option_value_id_locale_unique` (`option_value_id`,`locale`),
  CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.option_value_translations: ~0 rows (approximately)
DELETE FROM `option_value_translations`;
/*!40000 ALTER TABLE `option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_value_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(18,4) unsigned NOT NULL,
  `shipping_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` decimal(18,4) unsigned NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` decimal(18,4) unsigned NOT NULL,
  `total` decimal(18,4) unsigned NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` decimal(18,4) NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_index` (`customer_id`),
  KEY `orders_coupon_id_index` (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table fleetcart.order_products
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `unit_price` decimal(18,4) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(18,4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_foreign` (`order_id`),
  KEY `order_products_product_id_foreign` (`product_id`),
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.order_products: ~0 rows (approximately)
DELETE FROM `order_products`;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.order_product_options
CREATE TABLE IF NOT EXISTS `order_product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_product_options_order_product_id_option_id_unique` (`order_product_id`,`option_id`),
  KEY `order_product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.order_product_options: ~0 rows (approximately)
DELETE FROM `order_product_options`;
/*!40000 ALTER TABLE `order_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_options` ENABLE KEYS */;

-- Dumping structure for table fleetcart.order_product_option_values
CREATE TABLE IF NOT EXISTS `order_product_option_values` (
  `order_product_option_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_product_option_id`,`option_value_id`),
  KEY `order_product_option_values_option_value_id_foreign` (`option_value_id`),
  CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.order_product_option_values: ~0 rows (approximately)
DELETE FROM `order_product_option_values`;
/*!40000 ALTER TABLE `order_product_option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_option_values` ENABLE KEYS */;

-- Dumping structure for table fleetcart.order_taxes
CREATE TABLE IF NOT EXISTS `order_taxes` (
  `order_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `amount` decimal(15,4) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `order_taxes_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.order_taxes: ~0 rows (approximately)
DELETE FROM `order_taxes`;
/*!40000 ALTER TABLE `order_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_taxes` ENABLE KEYS */;

-- Dumping structure for table fleetcart.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.pages: ~0 rows (approximately)
DELETE FROM `pages`;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table fleetcart.page_translations
CREATE TABLE IF NOT EXISTS `page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.page_translations: ~0 rows (approximately)
DELETE FROM `page_translations`;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.persistences
CREATE TABLE IF NOT EXISTS `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`),
  KEY `persistences_user_id_foreign` (`user_id`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.persistences: ~0 rows (approximately)
DELETE FROM `persistences`;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;

-- Dumping structure for table fleetcart.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(18,4) unsigned NOT NULL,
  `special_price` decimal(18,4) unsigned DEFAULT NULL,
  `special_price_start` date DEFAULT NULL,
  `special_price_end` date DEFAULT NULL,
  `selling_price` decimal(18,4) unsigned DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `viewed` int(10) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime DEFAULT NULL,
  `new_to` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.products: ~0 rows (approximately)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.product_attributes
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_index` (`product_id`),
  KEY `product_attributes_attribute_id_index` (`attribute_id`),
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.product_attributes: ~0 rows (approximately)
DELETE FROM `product_attributes`;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;

-- Dumping structure for table fleetcart.product_attribute_values
CREATE TABLE IF NOT EXISTS `product_attribute_values` (
  `product_attribute_id` int(10) unsigned NOT NULL,
  `attribute_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_attribute_id`,`attribute_value_id`),
  KEY `product_attribute_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.product_attribute_values: ~0 rows (approximately)
DELETE FROM `product_attribute_values`;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;

-- Dumping structure for table fleetcart.product_categories
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.product_categories: ~0 rows (approximately)
DELETE FROM `product_categories`;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;

-- Dumping structure for table fleetcart.product_options
CREATE TABLE IF NOT EXISTS `product_options` (
  `product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`option_id`),
  KEY `product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.product_options: ~0 rows (approximately)
DELETE FROM `product_options`;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;

-- Dumping structure for table fleetcart.product_translations
CREATE TABLE IF NOT EXISTS `product_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  FULLTEXT KEY `name` (`name`),
  CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.product_translations: ~0 rows (approximately)
DELETE FROM `product_translations`;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.related_products
CREATE TABLE IF NOT EXISTS `related_products` (
  `product_id` int(10) unsigned NOT NULL,
  `related_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`related_product_id`),
  KEY `related_products_related_product_id_foreign` (`related_product_id`),
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.related_products: ~0 rows (approximately)
DELETE FROM `related_products`;
/*!40000 ALTER TABLE `related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.reminders
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.reminders: ~0 rows (approximately)
DELETE FROM `reminders`;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;

-- Dumping structure for table fleetcart.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_reviewer_id_index` (`reviewer_id`),
  KEY `reviews_product_id_index` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.reviews: ~0 rows (approximately)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table fleetcart.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.roles: ~2 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `permissions`, `created_at`, `updated_at`) VALUES
	(1, '{"admin.users.index":true,"admin.users.create":true,"admin.users.edit":true,"admin.users.destroy":true,"admin.roles.index":true,"admin.roles.create":true,"admin.roles.edit":true,"admin.roles.destroy":true,"admin.products.index":true,"admin.products.create":true,"admin.products.edit":true,"admin.products.destroy":true,"admin.attributes.index":true,"admin.attributes.create":true,"admin.attributes.edit":true,"admin.attributes.destroy":true,"admin.attribute_sets.index":true,"admin.attribute_sets.create":true,"admin.attribute_sets.edit":true,"admin.attribute_sets.destroy":true,"admin.options.index":true,"admin.options.create":true,"admin.options.edit":true,"admin.options.destroy":true,"admin.filters.index":true,"admin.filters.create":true,"admin.filters.edit":true,"admin.filters.destroy":true,"admin.reviews.index":true,"admin.reviews.create":true,"admin.reviews.edit":true,"admin.reviews.destroy":true,"admin.categories.index":true,"admin.categories.create":true,"admin.categories.edit":true,"admin.categories.destroy":true,"admin.orders.index":true,"admin.orders.show":true,"admin.orders.edit":true,"admin.transactions.index":true,"admin.coupons.index":true,"admin.coupons.create":true,"admin.coupons.edit":true,"admin.coupons.destroy":true,"admin.menus.index":true,"admin.menus.create":true,"admin.menus.edit":true,"admin.menus.destroy":true,"admin.menu_items.index":true,"admin.menu_items.create":true,"admin.menu_items.edit":true,"admin.menu_items.destroy":true,"admin.media.index":true,"admin.media.create":true,"admin.media.destroy":true,"admin.pages.index":true,"admin.pages.create":true,"admin.pages.edit":true,"admin.pages.destroy":true,"admin.currency_rates.index":true,"admin.currency_rates.edit":true,"admin.taxes.index":true,"admin.taxes.create":true,"admin.taxes.edit":true,"admin.taxes.destroy":true,"admin.translations.index":true,"admin.translations.edit":true,"admin.sliders.index":true,"admin.sliders.create":true,"admin.sliders.edit":true,"admin.sliders.destroy":true,"admin.reports.index":true,"admin.settings.edit":true,"admin.storefront.edit":true}', '2019-11-11 09:21:22', '2019-11-11 09:21:22'),
	(2, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table fleetcart.role_translations
CREATE TABLE IF NOT EXISTS `role_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_translations_role_id_locale_unique` (`role_id`,`locale`),
  CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.role_translations: ~2 rows (approximately)
DELETE FROM `role_translations`;
/*!40000 ALTER TABLE `role_translations` DISABLE KEYS */;
INSERT INTO `role_translations` (`id`, `role_id`, `locale`, `name`) VALUES
	(1, 1, 'en', 'Admin'),
	(2, 2, 'en', 'Customer');
/*!40000 ALTER TABLE `role_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.search_terms
CREATE TABLE IF NOT EXISTS `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `search_terms_term_unique` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.search_terms: ~0 rows (approximately)
DELETE FROM `search_terms`;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;

-- Dumping structure for table fleetcart.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT '0',
  `plain_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.settings: ~50 rows (approximately)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `key`, `is_translatable`, `plain_value`, `created_at`, `updated_at`) VALUES
	(1, 'store_name', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(2, 'store_email', 0, 's:15:"store@admin.com";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(3, 'search_engine', 0, 's:5:"mysql";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(4, 'algolia_app_id', 0, 'N;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(5, 'algolia_secret', 0, 'N;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(6, 'active_theme', 0, 's:10:"Storefront";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(7, 'supported_countries', 0, 'a:1:{i:0;s:2:"US";}', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(8, 'default_country', 0, 's:2:"US";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(9, 'supported_locales', 0, 'a:1:{i:0;s:2:"en";}', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(10, 'default_locale', 0, 's:2:"en";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(11, 'default_timezone', 0, 's:3:"UTC";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(12, 'customer_role', 0, 'i:2;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(13, 'reviews_enabled', 0, 'b:1;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(14, 'auto_approve_reviews', 0, 'b:1;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(15, 'supported_currencies', 0, 'a:1:{i:0;s:3:"USD";}', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(16, 'default_currency', 0, 's:3:"USD";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(17, 'send_order_invoice_email', 0, 'b:0;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(18, 'local_pickup_cost', 0, 'i:0;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(19, 'flat_rate_cost', 0, 'i:0;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(20, 'free_shipping_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(21, 'local_pickup_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(22, 'flat_rate_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(23, 'paypal_express_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(24, 'paypal_express_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(25, 'stripe_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(26, 'stripe_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(27, 'instamojo_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(28, 'instamojo_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(29, 'cod_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(30, 'cod_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(31, 'bank_transfer_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(32, 'bank_transfer_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(33, 'check_payment_label', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(34, 'check_payment_description', 1, NULL, '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(35, 'storefront_copyright_text', 0, 's:92:"Copyright © <a href="{{ store_url }}">{{ store_name }}</a> {{ year }}. All rights reserved.";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(36, 'storefront_feature_1_icon', 0, 's:11:"fa fa-truck";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(37, 'storefront_feature_1_title', 0, 's:13:"Free Delivery";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(38, 'storefront_feature_1_subtitle', 0, 's:15:"Orders over $60";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(39, 'storefront_feature_2_icon', 0, 's:18:"fa fa-commenting-o";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(40, 'storefront_feature_2_title', 0, 's:12:"99% Customer";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(41, 'storefront_feature_2_subtitle', 0, 's:9:"Feedbacks";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(42, 'storefront_feature_3_icon', 0, 's:17:"fa fa-credit-card";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(43, 'storefront_feature_3_title', 0, 's:7:"Payment";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(44, 'storefront_feature_3_subtitle', 0, 's:14:"Secured system";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(45, 'storefront_feature_4_icon', 0, 's:16:"fa fa-headphones";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(46, 'storefront_feature_4_title', 0, 's:12:"24/7 Support";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(47, 'storefront_feature_4_subtitle', 0, 's:14:"Helpline - 121";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(48, 'storefront_recently_viewed_section_enabled', 0, 'b:1;', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(49, 'storefront_recently_viewed_section_title', 0, 's:15:"Recently Viewed";', '2019-11-11 09:21:23', '2019-11-11 09:21:23'),
	(50, 'storefront_recently_viewed_section_total_products', 0, 'i:5;', '2019-11-11 09:21:23', '2019-11-11 09:21:23');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table fleetcart.setting_translations
CREATE TABLE IF NOT EXISTS `setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.setting_translations: ~16 rows (approximately)
DELETE FROM `setting_translations`;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`) VALUES
	(1, 1, 'en', 's:5:"store";'),
	(2, 20, 'en', 's:13:"Free Shipping";'),
	(3, 21, 'en', 's:12:"Local Pickup";'),
	(4, 22, 'en', 's:9:"Flat Rate";'),
	(5, 23, 'en', 's:14:"PayPal Express";'),
	(6, 24, 'en', 's:28:"Pay via your PayPal account.";'),
	(7, 25, 'en', 's:6:"Stripe";'),
	(8, 26, 'en', 's:29:"Pay via credit or debit card.";'),
	(9, 27, 'en', 's:9:"Instamojo";'),
	(10, 28, 'en', 's:16:"CC/DB/NB/Wallets";'),
	(11, 29, 'en', 's:16:"Cash On Delivery";'),
	(12, 30, 'en', 's:28:"Pay with cash upon delivery.";'),
	(13, 31, 'en', 's:13:"Bank Transfer";'),
	(14, 32, 'en', 's:100:"Make your payment directly into our bank account. Please use your Order ID as the payment reference.";'),
	(15, 33, 'en', 's:19:"Check / Money Order";'),
	(16, 34, 'en', 's:33:"Please send a check to our store.";');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.sliders
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autoplay` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `dots` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.sliders: ~0 rows (approximately)
DELETE FROM `sliders`;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;

-- Dumping structure for table fleetcart.slider_slides
CREATE TABLE IF NOT EXISTS `slider_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `call_to_action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_slides_slider_id_foreign` (`slider_id`),
  CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.slider_slides: ~0 rows (approximately)
DELETE FROM `slider_slides`;
/*!40000 ALTER TABLE `slider_slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_slides` ENABLE KEYS */;

-- Dumping structure for table fleetcart.slider_slide_translations
CREATE TABLE IF NOT EXISTS `slider_slide_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_slide_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_to_action_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_slide_translations_slider_slide_id_locale_unique` (`slider_slide_id`,`locale`),
  CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.slider_slide_translations: ~0 rows (approximately)
DELETE FROM `slider_slide_translations`;
/*!40000 ALTER TABLE `slider_slide_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_slide_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.slider_translations
CREATE TABLE IF NOT EXISTS `slider_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`),
  CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.slider_translations: ~0 rows (approximately)
DELETE FROM `slider_translations`;
/*!40000 ALTER TABLE `slider_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.tax_classes
CREATE TABLE IF NOT EXISTS `tax_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `based_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.tax_classes: ~0 rows (approximately)
DELETE FROM `tax_classes`;
/*!40000 ALTER TABLE `tax_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_classes` ENABLE KEYS */;

-- Dumping structure for table fleetcart.tax_class_translations
CREATE TABLE IF NOT EXISTS `tax_class_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_class_translations_tax_class_id_locale_unique` (`tax_class_id`,`locale`),
  CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.tax_class_translations: ~0 rows (approximately)
DELETE FROM `tax_class_translations`;
/*!40000 ALTER TABLE `tax_class_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_class_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.tax_rates
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(8,4) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_tax_class_id_index` (`tax_class_id`),
  CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.tax_rates: ~0 rows (approximately)
DELETE FROM `tax_rates`;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;

-- Dumping structure for table fleetcart.tax_rate_translations
CREATE TABLE IF NOT EXISTS `tax_rate_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rate_translations_tax_rate_id_locale_unique` (`tax_rate_id`,`locale`),
  CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.tax_rate_translations: ~0 rows (approximately)
DELETE FROM `tax_rate_translations`;
/*!40000 ALTER TABLE `tax_rate_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.throttle
CREATE TABLE IF NOT EXISTS `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_foreign` (`user_id`),
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.throttle: ~0 rows (approximately)
DELETE FROM `throttle`;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;

-- Dumping structure for table fleetcart.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_order_id_unique` (`order_id`),
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table fleetcart.translations
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.translations: ~0 rows (approximately)
DELETE FROM `translations`;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.translation_translations
CREATE TABLE IF NOT EXISTS `translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translation_translations_translation_id_locale_unique` (`translation_id`,`locale`),
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.translation_translations: ~0 rows (approximately)
DELETE FROM `translation_translations`;
/*!40000 ALTER TABLE `translation_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation_translations` ENABLE KEYS */;

-- Dumping structure for table fleetcart.up_sell_products
CREATE TABLE IF NOT EXISTS `up_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `up_sell_product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`up_sell_product_id`),
  KEY `up_sell_products_up_sell_product_id_foreign` (`up_sell_product_id`),
  CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.up_sell_products: ~0 rows (approximately)
DELETE FROM `up_sell_products`;
/*!40000 ALTER TABLE `up_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_sell_products` ENABLE KEYS */;

-- Dumping structure for table fleetcart.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `permissions`, `last_login`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', 'admin@admin.com', '$2y$10$zFcBzdxezwqvEssoTIuM6.eN4Pws5mh/RePUKTpMv/a0Vo03dqERK', NULL, '2019-11-11 09:22:24', '2019-11-11 09:21:22', '2019-11-11 09:22:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fleetcart.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.user_roles: ~1 rows (approximately)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2019-11-11 09:21:23', '2019-11-11 09:21:23');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Dumping structure for table fleetcart.wish_lists
CREATE TABLE IF NOT EXISTS `wish_lists` (
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `wish_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table fleetcart.wish_lists: ~0 rows (approximately)
DELETE FROM `wish_lists`;
/*!40000 ALTER TABLE `wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_lists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
