-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2020 at 11:11 PM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kamucari_`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_password_resets`
--

CREATE TABLE `account_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobile`, `password`, `picture`, `language`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dinesh', 'admin@dragon.com', NULL, '$2y$10$g8VGZbVk14kAd9g14jFFMucBG4OZ8VnN/RD9rWoNUwcNYi36R2qEG', 'admin/profile/ZNrgLp2TC7clEbw7LEsTxDNyTp4HzTzl9TdjIIcR.png', NULL, NULL, '2020-05-17 00:57:24', '2020-11-23 18:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet`
--

CREATE TABLE `admin_wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL COMMENT '1-commission,2-userrecharge,3-tripdebit,4-providerrecharge,5-providersettle,6-agentrecharge,7-agentcommission,8-agentsettle,9-taxcredit,10-discountdebit,11-discountrecharge,12-userreferral,13-providerreferral,14-peakcommission,15-waitingcommission,16-userdispute,17-providerdispute',
  `type` enum('C','D') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('BRAINTREE','CARD','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT '0.00',
  `wallet_balance` double(10,2) NOT NULL DEFAULT '0.00',
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_cards`
--

CREATE TABLE `agent_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_password_resets`
--

CREATE TABLE `agent_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agent_wallet`
--

CREATE TABLE `agent_wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('BRAINTREE','CARD','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `url`, `video`, `position`, `status`, `created_at`, `updated_at`) VALUES
(19, 'https://www.repairitnow.in/storage/banner/YHReiKdOBDavnKlE2w1rfBzupMzpL9MUFd7P1GJf.gif', '', 0, 'active', '2020-07-06 13:18:35', '2020-07-06 13:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `user_id`, `last_four`, `card_id`, `brand`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 15, '1017', 'card_1GlT3UJzY1MV2JZ1kemt1tgn', 'Visa', 1, '2020-05-22 08:04:28', '2020-06-07 11:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('up','pu') COLLATE utf8_unicode_ci NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT') COLLATE utf8_unicode_ci NOT NULL,
  `condition_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_pushes`
--

INSERT INTO `custom_pushes` (`id`, `send_to`, `condition`, `condition_data`, `message`, `sent_to`, `schedule_at`, `created_at`, `updated_at`) VALUES
(1, 'USERS', 'LOCATION', '11.1085242,77.3410656', 'CCTV Camera service works are LIVE', 0, NULL, '2020-07-02 11:13:26', '2020-07-02 11:13:26'),
(2, 'ALL', 'ACTIVE', NULL, 'RO Services are LIVE from Today', 0, NULL, '2020-07-06 12:33:55', '2020-07-06 12:33:55'),
(3, 'ALL', 'ACTIVE', NULL, 'Book Your RO Repair Now on Repair IT Now', 0, NULL, '2020-07-06 13:11:05', '2020-07-06 13:11:05'),
(4, 'ALL', 'ACTIVE', NULL, 'Computer service and RO Services are live ♥️ Hurry up', 0, NULL, '2020-07-11 09:03:33', '2020-07-11 09:03:33'),
(5, 'PROVIDERS', 'LOCATION', '11.1085242,77.3410656', 'Providers please go online at 9 every day. THANK YOU', 0, NULL, '2020-07-11 09:04:21', '2020-07-11 09:04:21'),
(6, 'PROVIDERS', 'ACTIVE', 'HOUR', 'Hello providers. Do set your status offline when you close your work.', 0, NULL, '2020-07-12 22:30:21', '2020-07-12 22:30:21'),
(7, 'ALL', 'ACTIVE', NULL, 'CCTV Repair services are live @ Repair It Now', 0, NULL, '2020-07-12 22:30:54', '2020-07-12 22:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_password_resets`
--

CREATE TABLE `dispatcher_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` int(10) UNSIGNED NOT NULL,
  `dispute_type` enum('user','provider') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  `dispute_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Bank Passbook', 'DRIVER', NULL, NULL),
(2, 'Registration Certificate / GSTIN', 'VEHICLE', NULL, '2020-05-19 04:28:41'),
(3, 'Aadhar Card', 'DRIVER', '2020-05-19 04:27:46', '2020-05-19 04:28:15'),
(4, 'Photo', 'VEHICLE', '2020-05-19 04:28:00', '2020-05-19 04:28:00'),
(5, 'PAN Card', 'DRIVER', '2020-05-19 04:28:24', '2020-05-19 04:28:24'),
(6, 'Electrical Bill / Gas Bill (Address Proof)', 'DRIVER', '2020-05-19 04:29:27', '2020-05-19 04:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `eventcontacts`
--

CREATE TABLE `eventcontacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourite_locations`
--

CREATE TABLE `favourite_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `type` enum('home','work','recent','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_08_25_172600_create_settings_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2016_12_03_000000_create_payu_payments_table', 1),
(11, '2016_12_03_000000_create_permission_tables', 1),
(12, '2017_01_11_180503_create_admins_table', 1),
(13, '2017_01_11_180511_create_providers_table', 1),
(14, '2017_01_11_181312_create_cards_table', 1),
(15, '2017_01_11_181357_create_chats_table', 1),
(16, '2017_01_11_181558_create_promocodes_table', 1),
(17, '2017_01_11_182454_create_provider_documents_table', 1),
(18, '2017_01_11_182536_create_provider_services_table', 1),
(19, '2017_01_11_182649_create_user_requests_table', 1),
(20, '2017_01_11_182717_create_request_filters_table', 1),
(21, '2017_01_11_182738_create_service_types_table', 1),
(22, '2017_01_25_172422_create_documents_table', 1),
(23, '2017_01_31_122021_create_provider_devices_table', 1),
(24, '2017_02_02_192703_create_user_request_ratings_table', 1),
(25, '2017_02_06_080124_create_user_request_payments_table', 1),
(26, '2017_02_14_135859_create_provider_profiles_table', 1),
(27, '2017_02_21_131429_create_promocode_usages_table', 1),
(28, '2017_06_17_151030_create_dispatchers_table', 1),
(29, '2017_06_17_151031_create_dispatcher_password_resets_table', 1),
(30, '2017_06_17_151145_create_agents_table', 1),
(31, '2017_06_17_151146_create_agent_password_resets_table', 1),
(32, '2017_06_20_154148_create_accounts_table', 1),
(33, '2017_06_20_154149_create_account_password_resets_table', 1),
(34, '2017_08_03_194354_create_custom_pushes_table', 1),
(35, '2017_09_01_190333_create_wallet_passbooks_table', 1),
(36, '2017_09_01_190355_create_promocode_passbooks_table', 1),
(37, '2017_09_26_160101_create_favourite_locations_table', 1),
(38, '2018_06_29_174517_create_works_table', 1),
(39, '2018_09_07_151624_create_admin_wallet_table', 1),
(40, '2018_09_07_151631_create_user_wallet_table', 1),
(41, '2018_09_07_151636_create_provider_wallet_table', 1),
(42, '2018_09_07_151645_create_agent_wallet_table', 1),
(43, '2018_09_14_160535_create_wallet_requests_table', 1),
(44, '2018_09_24_164552_create_provider_cards_table', 1),
(45, '2018_09_26_143905_create_agent_cards_table', 1),
(46, '2018_09_27_195450_create_eventcontacts_table', 1),
(47, '2018_12_07_132532_create_referral_histroy_table', 1),
(48, '2018_12_07_132536_create_referral_earnings_table', 1),
(49, '2018_12_18_171537_create_reasons_table', 1),
(50, '2018_12_27_125550_create_request_waiting_time_table', 1),
(51, '2018_12_27_125553_create_service_peak_hours_table', 1),
(52, '2018_12_27_125556_create_peak_hours_table', 1),
(53, '2019_01_07_135142_create_disputes_table', 1),
(54, '2019_01_07_135145_create_user_request_disputes_table', 1),
(55, '2019_01_07_135146_create_user_request_lost_items_table', 1),
(56, '2019_01_07_135148_create_notifications_table', 1),
(57, '2019_01_28_145133_create_push_subscriptions_table', 1),
(58, '2019_01_31_104045_create_payment_logs_table', 1),
(59, '2020_02_22_122406_create_banners_table', 1),
(60, '2020_02_23_004410_subscriptions', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Admin', 1),
(2, 'App\\Admin', 2),
(3, 'App\\Admin', 7),
(4, 'App\\Admin', 6),
(5, 'App\\Agent', 1),
(6, 'App\\Admin', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `notify_type` enum('all','user','provider') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notify_type`, `image`, `description`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'all', 'https://www.repairitnow.in/uploads/6c2f1058803235f2303b0f8062ead70c96000b79.png', 'Computer / CCTV and RO Services are LIVE', '2020-07-10 00:00:00', 'active', '2020-07-06 13:10:04', '2020-07-06 13:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('013110c722e5da667f41a00e3f2dc11d268d608e6073a26cf184af7a4244d3bcce9c0cd728d37648', 78, 1, 'AutoLogin', '[]', 0, '2020-06-13 23:38:25', '2020-06-13 23:38:25', '2021-06-13 23:38:25'),
('021986eed336cb6f5227328d8a4871260f9061eb659f11c11692a83fdf3120322203a63d6c3189d6', 35, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:03:52', '2020-05-23 08:03:52', '2021-05-23 08:03:52'),
('0506c453d3bf9f1fe8cd57150132d4e78b09e04b1e80a675de31e6739d9b4465e9a5ef67a201a48a', 2, 2, NULL, '[]', 0, '2020-05-21 05:32:32', '2020-05-21 05:32:32', '2020-06-05 05:32:32'),
('05ab7f37876142f9d86b82f223b4de291969b24f35700b775aa766fe50c37adc61570a314f596c42', 106, 1, 'AutoLogin', '[]', 0, '2020-11-15 15:46:34', '2020-11-15 15:46:34', '2021-11-15 15:46:34'),
('09bac8b81a4449497d9e4d14fbcc9a67471b0385ee5f14a6f8c5f1e37a8a7ae54a9eb987e3b5b9b3', 84, 1, 'AutoLogin', '[]', 0, '2020-07-02 19:18:16', '2020-07-02 19:18:16', '2021-07-02 19:18:16'),
('0abd88a7db05a4ee00c5e2e9c6576044eccf54eaac884af56391c559e11bd70a8964bb3b1785bf58', 93, 1, 'AutoLogin', '[]', 0, '2020-09-13 14:05:59', '2020-09-13 14:05:59', '2021-09-13 14:05:59'),
('12dd1b22b270b12db1db7f34949783361395d5ea8de454969dbd022ee3e24dab3c08483ace6e2aa4', 92, 1, 'AutoLogin', '[]', 0, '2020-09-02 08:22:02', '2020-09-02 08:22:02', '2021-09-02 08:22:02'),
('1530186185b5a55123f4028657a28e43c4766cdbb7ca0835d7191650e16885a6802a1300b932f04a', 73, 1, 'AutoLogin', '[]', 0, '2020-06-05 12:36:59', '2020-06-05 12:36:59', '2021-06-05 12:36:59'),
('1709f5dcd3ef1faa086964b0dc9fa7d11a94d87b7b921a36de8632fbfa7dcd1535aa6a31d1380156', 4, 2, NULL, '[]', 0, '2020-05-18 05:53:49', '2020-05-18 05:53:49', '2020-06-02 05:53:49'),
('188172b095c2e38e026b311a4550f22503140db5ddfafc26ddad45ae862c96f01ae9cac7e690863a', 51, 1, 'AutoLogin', '[]', 0, '2020-05-27 13:35:31', '2020-05-27 13:35:31', '2021-05-27 13:35:31'),
('1d9dcc897d445f75954df449cbdbf2f1cea6a8a18f883881218a56dc445410ebdb064756a7f7c20a', 108, 2, NULL, '[]', 0, '2020-11-22 16:41:16', '2020-11-22 16:41:16', '2020-12-07 23:41:16'),
('1da22449e5c7701c938c59e94e256a5df45678dad6dd0dd5af0df7e81d5e84d06fa4e555bd0deb38', 79, 1, 'AutoLogin', '[]', 0, '2020-06-26 11:17:14', '2020-06-26 11:17:14', '2021-06-26 11:17:14'),
('1f7dc4f07fc55739efee5db9b3937ee17056aeca0066516664256e3431e01d59922bc325ee7a4493', 40, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:35:54', '2020-05-23 08:35:54', '2021-05-23 08:35:54'),
('216837800a2580234a37935c4fc5dacf4ec08ec76d079d2bd7508913d663a7331c111246b32971a5', 105, 1, 'AutoLogin', '[]', 0, '2020-11-07 11:51:59', '2020-11-07 11:51:59', '2021-11-07 11:51:59'),
('22cbe89a197e27d5ea3a7d9a03b52951f0e5c1b40a30dd002d370ffd6dc094b73a60dc37660633a0', 66, 1, 'AutoLogin', '[]', 0, '2020-06-03 04:10:38', '2020-06-03 04:10:38', '2021-06-03 04:10:38'),
('26f4ff5784d1432abecd11f1817daae86db8651ce00004fbf74dd44de4d8a3745da94042492880f4', 53, 1, 'AutoLogin', '[]', 0, '2020-05-27 18:56:10', '2020-05-27 18:56:10', '2021-05-27 18:56:10'),
('27a374593e0cb1dac7826e099a78f92d9aa24cbbcad0b64468113711c0fe55b0f2bf5e02b329ed79', 19, 1, 'AutoLogin', '[]', 0, '2020-05-22 08:24:50', '2020-05-22 08:24:50', '2021-05-22 08:24:50'),
('303d5d4401191aa1a89dd7965af13d4f894728bba183b7d427c0b89853a9252958b2d16d66df6a8c', 86, 1, 'AutoLogin', '[]', 0, '2020-07-22 14:01:09', '2020-07-22 14:01:09', '2021-07-22 14:01:09'),
('3146408553c4fbde12f119a8dab7f6aebccf3518f5fa124fa3b155fb2dc769507d831579195e6285', 100, 1, 'AutoLogin', '[]', 0, '2020-10-14 12:35:13', '2020-10-14 12:35:13', '2021-10-14 12:35:13'),
('31f7618cd7e5eed9cd62d97d70ea29fd5814f4ab2e6f36665defbdaf438bb62a5f70e3d0fcc661fe', 80, 1, 'AutoLogin', '[]', 0, '2020-06-26 11:26:56', '2020-06-26 11:26:56', '2021-06-26 11:26:56'),
('32a54e96adf4240fa6ad4f2a8934367f610442fb7719bf2146b7ff70fb86e34b55687662583416a5', 54, 1, 'AutoLogin', '[]', 0, '2020-05-27 19:10:38', '2020-05-27 19:10:38', '2021-05-27 19:10:38'),
('35ac91d90f448115848b26317df68d124d78f2ac900f31e0adf78372f68f0e2925b3bb5b202444dd', 83, 1, 'AutoLogin', '[]', 0, '2020-07-02 14:31:13', '2020-07-02 14:31:13', '2021-07-02 14:31:13'),
('37b2dadedc8bae6d06dadeb5d99ea6773b6770eddedacdb33aee38b2d5e4d7c4bae51876b4f4b8de', 8, 1, 'AutoLogin', '[]', 0, '2020-05-18 12:56:29', '2020-05-18 12:56:29', '2021-05-18 12:56:29'),
('3cdcbe3a2c4d176a13f7a91f3b4ae6664cec214d89ed1d0f726a1fb584322600209af64063f0058f', 71, 1, 'AutoLogin', '[]', 0, '2020-06-04 15:29:04', '2020-06-04 15:29:04', '2021-06-04 15:29:04'),
('434404ea063bba566fab1f6b55660f7d7c9e9168b2a2e35839335e0bdaa57bcfb026c586c7cb00d7', 99, 1, 'AutoLogin', '[]', 0, '2020-10-06 16:02:53', '2020-10-06 16:02:53', '2021-10-06 16:02:53'),
('44f831d1a43aee2e35cb7b1dc36ebaf08fe390353e18d9b4aea512509010c27365543745e706483d', 104, 1, 'AutoLogin', '[]', 0, '2020-11-03 20:22:58', '2020-11-03 20:22:58', '2021-11-03 20:22:58'),
('452c857c2736a0488b2eb72f789a62b0b15361a8564f1848e89c9e136c06108f0b428a5915298678', 58, 1, 'AutoLogin', '[]', 0, '2020-05-29 12:08:59', '2020-05-29 12:08:59', '2021-05-29 12:08:59'),
('45ba6620e6e27a6142ca453827fb48e021ccf28ba8d2728c530c39162f68648a9b5745ce5e18c89a', 42, 1, 'AutoLogin', '[]', 0, '2020-05-23 09:21:54', '2020-05-23 09:21:54', '2021-05-23 09:21:54'),
('47ff6a1573e5f2327ed1d02527d421e8027d8aad62e1d9ad7c23d14808b736f5d114f6620f751f63', 26, 1, 'AutoLogin', '[]', 0, '2020-05-22 10:18:04', '2020-05-22 10:18:04', '2021-05-22 10:18:04'),
('4c62486996d0bd48cc2746507f787504fba29c1f80b654f0b62e1697e2da99170105eed3109993aa', 44, 1, 'AutoLogin', '[]', 0, '2020-05-25 08:28:54', '2020-05-25 08:28:54', '2021-05-25 08:28:54'),
('4c8cd40c3ff36a2c743ede5fed13772db111b49913a0af782cf4540846aab726b0b62fea2a7d0dc8', 87, 1, 'AutoLogin', '[]', 0, '2020-07-23 20:48:31', '2020-07-23 20:48:31', '2021-07-23 20:48:31'),
('4f5f099815fa06f61c4fd4a7daebe0a33dea74192cb7e52d462e8ca46d85a71ce3a9f2ad94a9d22c', 18, 1, 'AutoLogin', '[]', 0, '2020-05-22 08:23:47', '2020-05-22 08:23:47', '2021-05-22 08:23:47'),
('54a9b6a7e4bfa5ebd04022d0fa6877826f12d4eb7e6c24d7e8f7c060c2b578d7a2c34fc2ecf7d9a0', 91, 1, 'AutoLogin', '[]', 0, '2020-08-27 22:52:47', '2020-08-27 22:52:47', '2021-08-27 22:52:47'),
('588f4f4cda07b8f9a6198a4a35e34fb624f6c4e36d6398f6331e27f072d36cab2d392245afdfd635', 55, 1, 'AutoLogin', '[]', 0, '2020-05-29 04:45:42', '2020-05-29 04:45:42', '2021-05-29 04:45:42'),
('5b09be3fbe4c9473adb3b93a1c8361ccb4578bff55c8229162b20c9e6e7322bb9e35c3eb70639158', 85, 1, 'AutoLogin', '[]', 0, '2020-07-22 04:56:32', '2020-07-22 04:56:32', '2021-07-22 04:56:32'),
('5b2f3b092710ca26da42bbc6fdb0cba35317b98cca30b73bfe3be2a640228e887449623c4015a7fc', 90, 1, 'AutoLogin', '[]', 0, '2020-08-08 12:27:01', '2020-08-08 12:27:01', '2021-08-08 12:27:01'),
('5d04fde874fb71b2de78c4322eacafcf66e0073138d58fa0c71f76d90cb0e0bd89c78aecf1566a65', 10, 1, 'AutoLogin', '[]', 0, '2020-05-19 06:02:48', '2020-05-19 06:02:48', '2021-05-19 06:02:48'),
('5fe932e8be35343c1390cbf132b9a34ca16d69fce3090f104709b298aea5d6a428366f4865636c62', 41, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:40:51', '2020-05-23 08:40:51', '2021-05-23 08:40:51'),
('6122d22accf270d0eb8c1e035d2bd3942649a267c28e1112269832a39dc10035424ebd8c3a7585c9', 6, 1, 'AutoLogin', '[]', 0, '2020-05-18 12:47:31', '2020-05-18 12:47:31', '2021-05-18 12:47:31'),
('64f2ea063e5abc5cbf9b397cb129cc5d88a28ee20cff6e19fee509961fe2e221ed2b6cece3677915', 60, 1, 'AutoLogin', '[]', 0, '2020-05-31 12:27:10', '2020-05-31 12:27:10', '2021-05-31 12:27:10'),
('66c771942abfcc16f497d878c7e5f5d2a59f3368e2d1afb4783bd0131111662c4007d611fec17293', 70, 1, 'AutoLogin', '[]', 0, '2020-06-04 13:33:58', '2020-06-04 13:33:58', '2021-06-04 13:33:58'),
('67e3255dbb969355175440856c81a078045bff9d7dd2f1e9209c2744f4786e98ed40368e83e2980e', 38, 2, NULL, '[]', 0, '2020-05-27 08:37:29', '2020-05-27 08:37:29', '2020-06-11 08:37:29'),
('6dc1aaf247c1e5926aebb38e0b85a79e9239236f74e8c7bdccd78caa946c5f4bf3e7fe02a6745b2d', 109, 1, 'AutoLogin', '[]', 0, '2020-11-22 17:31:09', '2020-11-22 17:31:09', '2021-11-23 00:31:09'),
('6e6389f83a8c02ee8d1f15b068be1c1037711ee955deb9aa6fa22326eee54b34a8d9a005db32b410', 74, 1, 'AutoLogin', '[]', 0, '2020-06-05 18:35:34', '2020-06-05 18:35:34', '2021-06-05 18:35:34'),
('724e8d71ef73fbff625739536490585221349c0b1ab762fee4e984053aea3a0afb9982887894e60f', 98, 1, 'AutoLogin', '[]', 0, '2020-10-05 12:34:09', '2020-10-05 12:34:09', '2021-10-05 12:34:09'),
('7bfced10d9d17d96624b7fc704a9867dcea08ebd3e1904cb434d804472a623c0c2905501a2e0859f', 36, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:05:56', '2020-05-23 08:05:56', '2021-05-23 08:05:56'),
('804b209a4139afd6f4f82e209a6c218a471d19a79325aab67151a64947f7f610c7657c90d63f0f02', 82, 1, 'AutoLogin', '[]', 0, '2020-07-02 11:08:54', '2020-07-02 11:08:54', '2021-07-02 11:08:54'),
('80ada6c325cc3989e53b52219acc6cfa4339c359f68896838261a88df09fe0e0451f8264cda89da0', 33, 1, 'AutoLogin', '[]', 0, '2020-05-22 21:48:24', '2020-05-22 21:48:24', '2021-05-22 21:48:24'),
('81f0d3d35212f72657cdf015d8f67a5e585b6c866a75f77ca4081770e1965be2bb8619ed1c82c964', 48, 1, 'AutoLogin', '[]', 0, '2020-05-26 11:01:10', '2020-05-26 11:01:10', '2021-05-26 11:01:10'),
('83a8959eddea4b1695252234fbe9799ac9b9390738299182e18a1392a140e933cffea3f95ca394b4', 46, 1, 'AutoLogin', '[]', 0, '2020-05-25 09:14:30', '2020-05-25 09:14:30', '2021-05-25 09:14:30'),
('8403d3cc4cf449400e1850e602e247749523fd3b0c377bd1d33cb218807aefe0c0146cfadb5c97ee', 9, 1, 'AutoLogin', '[]', 0, '2020-05-18 13:17:03', '2020-05-18 13:17:03', '2021-05-18 13:17:03'),
('89748fc3cd63a54bcb065b0d065add680b50a829bb1067914d3d4372b4607d812a3e9495bbc01022', 50, 1, 'AutoLogin', '[]', 0, '2020-05-27 13:34:05', '2020-05-27 13:34:05', '2021-05-27 13:34:05'),
('89eacaede19369d8cce473074fc1026f0c31909de06f7fd1b68e2242f5e0b9204bd0dc6401c996d3', 39, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:27:02', '2020-05-23 08:27:02', '2021-05-23 08:27:02'),
('8a14f9b8e084d7273d70223ea5a9bbda8f04230da2475e1c2380858586a393b2924d894929391564', 67, 1, 'AutoLogin', '[]', 0, '2020-06-03 09:32:25', '2020-06-03 09:32:25', '2021-06-03 09:32:25'),
('8dedaafb19a2a3ebde839a1b03f6e888587b38b28d1669fe68573a7f66f6d791b8a1a437f08678d3', 68, 1, 'AutoLogin', '[]', 0, '2020-06-03 18:48:09', '2020-06-03 18:48:09', '2021-06-03 18:48:09'),
('8ef4607c5b9f7fa932b640ebf1f328ef94fc42108821b05f1f47b712f040792342b41ea0b8615929', 22, 1, 'AutoLogin', '[]', 0, '2020-05-22 09:42:18', '2020-05-22 09:42:18', '2021-05-22 09:42:18'),
('9062f1934f5613e229aab6768d0ab1940ece502e1478cd5ff56573c754bd64fa50d240702247ade6', 28, 1, 'AutoLogin', '[]', 0, '2020-05-22 12:38:24', '2020-05-22 12:38:24', '2021-05-22 12:38:24'),
('9091dae8fa700382c6ee9974c087a230a93366061c36a7d58503eac778a557acc6ed188d4dd7d44e', 97, 1, 'AutoLogin', '[]', 0, '2020-10-02 22:05:29', '2020-10-02 22:05:29', '2021-10-02 22:05:29'),
('9279bfcc680ffd5483a9b8dd6fd0909ea49bdcaeba8b7e3619c3c9401fad90f9894a3c7f3532250b', 77, 2, NULL, '[]', 0, '2020-06-08 13:42:18', '2020-06-08 13:42:18', '2020-06-23 13:42:18'),
('95d5e79e401c64e45709ef8eb4d782ab21e31ec9ae51dea3ff43efdd99e8e8e231620fcc92a6db85', 37, 1, 'AutoLogin', '[]', 0, '2020-05-23 08:09:29', '2020-05-23 08:09:29', '2021-05-23 08:09:29'),
('9a0de74cd89f09db3dea6d62dcc7d191d2b413d9dba0d8690837ebc7cd6100584cf330222dcf09f9', 95, 1, 'AutoLogin', '[]', 0, '2020-09-23 13:32:16', '2020-09-23 13:32:16', '2021-09-23 13:32:16'),
('9b299ab5ac5925f67b3f70712eded41f5f02a5da10dbb0d1b5c0b4ccccc5ca7a58032a086db1dffc', 56, 1, 'AutoLogin', '[]', 0, '2020-05-29 07:09:24', '2020-05-29 07:09:24', '2021-05-29 07:09:24'),
('a0f784f95f20edcfe627833dde58868f10486ca9b3dac3f272617acda42ebf07b9a6c7b934701708', 1, 2, NULL, '[]', 0, '2020-05-21 05:13:21', '2020-05-21 05:13:21', '2020-06-05 05:13:21'),
('a243832f760fd246066940530b01786ebf4507d40c9745f7028a7ef427ca48ec241b186f4955d58a', 63, 1, 'AutoLogin', '[]', 0, '2020-06-02 12:51:18', '2020-06-02 12:51:18', '2021-06-02 12:51:18'),
('a25cb40c8966e7b87aecbd6ee37a4d64a8f23d2b0b9cc5ae37de05a6cb4a6407f373ac312a5c5883', 12, 2, NULL, '[]', 0, '2020-05-21 09:28:49', '2020-05-21 09:28:49', '2020-06-05 09:28:49'),
('a6722b64c9934c0d5c2ba7ddc6ec506e5c0ec4d488e1d562c47211b968c28c6ea543a36d783cede7', 24, 1, 'AutoLogin', '[]', 0, '2020-05-22 10:04:38', '2020-05-22 10:04:38', '2021-05-22 10:04:38'),
('abb8dbe60dfe971ad3fa78d1cc9deaff9df9a4def93fb1ebd8ea28882724d4a75721032771907237', 49, 1, 'AutoLogin', '[]', 0, '2020-05-26 18:28:32', '2020-05-26 18:28:32', '2021-05-26 18:28:32'),
('ae126bc9ef2f83fe23d2aefa0fff1a637a96332791dff7dc3f3ad2f631a93ad309d7fdbb9d479cc6', 27, 1, 'AutoLogin', '[]', 0, '2020-05-22 10:47:57', '2020-05-22 10:47:57', '2021-05-22 10:47:57'),
('ae2b0050e270738270e54ee96a1a7eec34c3a3490de67fab41df3586f74e99adb0f36e338c8d8fdb', 3, 1, 'AutoLogin', '[]', 0, '2020-05-17 13:33:01', '2020-05-17 13:33:01', '2021-05-17 13:33:01'),
('b05fb73bfc287a90f8623d2f58fda2e5237da2cc98669aa143f41073dc66bc744251427387faf757', 59, 1, 'AutoLogin', '[]', 0, '2020-05-30 05:07:41', '2020-05-30 05:07:41', '2021-05-30 05:07:41'),
('b1a7178c7d98bd1355d2fe41c69b3ac56ea095488df0eb8bee9859edd1d8cda2e25501d12d78dc87', 81, 1, 'AutoLogin', '[]', 0, '2020-06-29 12:26:13', '2020-06-29 12:26:13', '2021-06-29 12:26:13'),
('b24d1910a8abd884bc96a7fae6a9238c3f01ca38143dc7ec547c60d00cc34cf80ccc02493a71d26b', 14, 2, NULL, '[]', 0, '2020-06-08 12:40:46', '2020-06-08 12:40:46', '2020-06-23 12:40:46'),
('b527584fd2e18273aa895fb3259f5c9ebfc66f583591689a363ed97e598075909d2829b07c2055b4', 94, 1, 'AutoLogin', '[]', 0, '2020-09-21 20:45:11', '2020-09-21 20:45:11', '2021-09-21 20:45:11'),
('b52bdb251f4e9f4accb2ee860822bbbad0bff16012dac9fafcfe94404e312f97be1f563a095e7c85', 75, 1, 'AutoLogin', '[]', 0, '2020-06-06 12:07:54', '2020-06-06 12:07:54', '2021-06-06 12:07:54'),
('b5cb6b6c050d8a7af57c493bf2d5b6393a0befa5cf8e2bb1803ffb6039cc4426421133bf1c2e6564', 29, 1, 'AutoLogin', '[]', 0, '2020-05-22 13:51:51', '2020-05-22 13:51:51', '2021-05-22 13:51:51'),
('b8ea0a9ff5dd85358e301394e98a540e057108b478cfdb23a9784864b504832ecdffcebcaa30b711', 7, 1, 'AutoLogin', '[]', 0, '2020-05-18 12:50:06', '2020-05-18 12:50:06', '2021-05-18 12:50:06'),
('bb41a14d37d0f5272539932d3f1921f542c2f782ed4029ade42c1f96b48185f7f4ea35d8f085e33f', 64, 1, 'AutoLogin', '[]', 0, '2020-06-02 12:55:20', '2020-06-02 12:55:20', '2021-06-02 12:55:20'),
('c032a9ee923045c9364d3e3cf427a8f915a0cd5d63b18d8c30ec33ef25f1edcef173c39acaabe938', 5, 1, 'AutoLogin', '[]', 0, '2020-05-18 08:33:12', '2020-05-18 08:33:12', '2021-05-18 08:33:12'),
('c11b30688c407824e3c42de919ce32c5dde7c7658f4513670b6c4f44800a8fc1c54b0f5b2d460ecc', 47, 1, 'AutoLogin', '[]', 0, '2020-05-25 13:37:48', '2020-05-25 13:37:48', '2021-05-25 13:37:48'),
('c7034238bc13cb0b260e4c0b9bad7c996b0ed2bce7ad10252d75759ed3572c6bbb9277e1de96c606', 20, 1, 'AutoLogin', '[]', 0, '2020-05-22 08:41:08', '2020-05-22 08:41:08', '2021-05-22 08:41:08'),
('c752168579f62230b11d37df84c45ba230abca315c24f52351d1f01c74c0385fd0dbcc0c5a84b6a2', 62, 1, 'AutoLogin', '[]', 0, '2020-06-02 08:49:11', '2020-06-02 08:49:11', '2021-06-02 08:49:11'),
('c8f6000a0eefcb0df30146a4b61d4c93ab6ad76e1d99e0f5e4c409412ce82d1bdcd3da7ed229f848', 23, 1, 'AutoLogin', '[]', 0, '2020-05-22 09:53:17', '2020-05-22 09:53:17', '2021-05-22 09:53:17'),
('cadf3f11842c4699eb3b1239472ac4f2cdc99ec96bff3310dcfbc3c46491c7b6ce16d8b56250d99f', 43, 2, NULL, '[]', 0, '2020-05-23 19:17:21', '2020-05-23 19:17:21', '2020-06-07 19:17:21'),
('cba18f0460a1eacbeccc3f92b4bc85d77533d49f3b5c5154187e1289e6b47f3021ab4a3f11b1c65c', 61, 1, 'AutoLogin', '[]', 0, '2020-06-02 08:12:06', '2020-06-02 08:12:06', '2021-06-02 08:12:06'),
('d0d03ce9eba2edbdbe73e490ee74285cb96b3534686377f94cd0b0d258a90571ab2849cb9fdebbed', 110, 2, NULL, '[]', 0, '2020-11-23 18:04:03', '2020-11-23 18:04:03', '2020-12-09 01:04:03'),
('d0ef6febd9f1725cd0cf6ba14ae01e3a2c023e4d274e867f071ba14e05b7b94b519e65e1b78a5c15', 17, 1, 'AutoLogin', '[]', 0, '2020-05-22 08:21:39', '2020-05-22 08:21:39', '2021-05-22 08:21:39'),
('d2c7ccf71dd61ef2832139172f0ed1e843cc5e3e56c2d72ac776108b8a8123984e789ccf3e787b4e', 30, 1, 'AutoLogin', '[]', 0, '2020-05-22 14:27:05', '2020-05-22 14:27:05', '2021-05-22 14:27:05'),
('d33580a28bec50f9d7cb744b3d8f9fd76038b4640e0189ea05b5c5f1bd5adce902c3222a7ba5fb61', 88, 1, 'AutoLogin', '[]', 0, '2020-07-31 13:09:34', '2020-07-31 13:09:34', '2021-07-31 13:09:34'),
('d417356fdacac5ef550b1d21b1702af823a025133b36d8d76e0b91d1cbc3a772df4f560980ec5565', 13, 2, NULL, '[]', 0, '2020-05-22 13:41:26', '2020-05-22 13:41:26', '2020-06-06 13:41:26'),
('d5b80b69224390f3ad01ce7a294da172411532105df40e1a0efb0e01bc6af50436e088942c1021e1', 69, 1, 'AutoLogin', '[]', 0, '2020-06-04 12:36:50', '2020-06-04 12:36:50', '2021-06-04 12:36:50'),
('d5feb517780b84b50dd6368b777b6e9ab6c76fed89f045d70fa8fd46bbdf64183cc4d8ef434da5e2', 103, 1, 'AutoLogin', '[]', 0, '2020-10-30 21:40:40', '2020-10-30 21:40:40', '2021-10-30 21:40:40'),
('d66d84f01216922b7734154b31842b248236f966da83b006a6df6ff49b8b2cee23c1ca78b944cad4', 15, 2, NULL, '[]', 0, '2020-09-30 20:11:11', '2020-09-30 20:11:11', '2020-10-15 20:11:11'),
('d7c676ca45a9023a1da1ed7fd91c68275afdf6c279f0e4645f64d09f5ed8819f4304a4e31a9750e1', 72, 1, 'AutoLogin', '[]', 0, '2020-06-05 10:48:11', '2020-06-05 10:48:11', '2021-06-05 10:48:11'),
('dc33153a2f2ee1aa8ea71b6115db4cb2b0fb293783f669df6f22b3bc3a1061be711d11bdbd15c1ec', 34, 1, 'AutoLogin', '[]', 0, '2020-05-23 05:49:02', '2020-05-23 05:49:02', '2021-05-23 05:49:02'),
('dca2637de531cebffa135a7a8ae2f35b62df643504b573c38b81f2afec1532fbcd53f8b51b1d34c6', 107, 1, 'AutoLogin', '[]', 0, '2020-11-19 15:50:01', '2020-11-19 15:50:01', '2021-11-19 15:50:01'),
('dd98730d9a97c681f34bc832f86d772f2e0e36603b12269b47328a2217a8ad9aca7289ee9dacf0b9', 102, 1, 'AutoLogin', '[]', 0, '2020-10-25 22:07:05', '2020-10-25 22:07:05', '2021-10-25 22:07:05'),
('e0f3fc3fcfdb53e39ea9b7774a6515209200e0088e8f8643f290d1553cf2a32ec8dc91716e02873f', 76, 1, 'AutoLogin', '[]', 0, '2020-06-08 12:40:08', '2020-06-08 12:40:08', '2021-06-08 12:40:08'),
('e4c17c31560b71807c29f553e2316ad30b17cf5ba72d7eef9b0cc105806ca94ef31998ad5c159152', 89, 1, 'AutoLogin', '[]', 0, '2020-08-01 08:10:24', '2020-08-01 08:10:24', '2021-08-01 08:10:24'),
('e4d94ac97988d813084c5c4182bf5161242d8d198e40655044dcdf4fae4e018083f271cc6c96c292', 45, 1, 'AutoLogin', '[]', 0, '2020-05-25 09:09:03', '2020-05-25 09:09:03', '2021-05-25 09:09:03'),
('e6339d8e0db47311ce5197a652656a55b9d34b6b68b698eafef532dd0fa2af6adcdba9cf93bea61c', 57, 1, 'AutoLogin', '[]', 0, '2020-05-29 10:27:44', '2020-05-29 10:27:44', '2021-05-29 10:27:44'),
('e71e747603ab0416b186b5a6024b4fbf9aee5af5092a6f5a5d8e52407028d8acb2ae416a2a7d65c1', 32, 1, 'AutoLogin', '[]', 0, '2020-05-22 16:25:42', '2020-05-22 16:25:42', '2021-05-22 16:25:42'),
('e8cf13192bdbcde3ace53ddf0fe8fdbcdda4b52d4caf227f668da6901c41edc38f50205a2408716f', 21, 1, 'AutoLogin', '[]', 0, '2020-05-22 09:37:51', '2020-05-22 09:37:51', '2021-05-22 09:37:51'),
('f044a214176df31fdc5282095bc3b0a28ba7626857296b846b30362c11b36e91e56ff7d6b4859f96', 25, 1, 'AutoLogin', '[]', 0, '2020-05-22 10:10:06', '2020-05-22 10:10:06', '2021-05-22 10:10:06'),
('f20b16cf59056a0a60745cbf888bbfa1e87b8b3005196e1b4701881809ce9753ac88adbd1c7ab437', 96, 1, 'AutoLogin', '[]', 0, '2020-09-25 11:06:50', '2020-09-25 11:06:50', '2021-09-25 11:06:50'),
('f26e3ec47482d51838cebed619cbdaeaa43c5355d60c99ebf4317f726d534a8856d0f471c7db1331', 52, 1, 'AutoLogin', '[]', 0, '2020-05-27 17:25:31', '2020-05-27 17:25:31', '2021-05-27 17:25:31'),
('f710f21b7a7d5cbf6d93c12044e1911777ed2b22ac1721bfd34f9d14174e96b3943603a2a643b199', 16, 1, 'AutoLogin', '[]', 0, '2020-05-22 08:20:03', '2020-05-22 08:20:03', '2021-05-22 08:20:03'),
('f91b86dd92986c0992be8719052b4f610232f8ba7010f4a8265fe4022e6fe1dc71688f725fd7b642', 31, 1, 'AutoLogin', '[]', 0, '2020-05-22 16:02:16', '2020-05-22 16:02:16', '2021-05-22 16:02:16'),
('fab386be2b6660320402c142051b63a9ac7e304c1733e2161b9673ef98545dd98fffdcb767f0dca5', 101, 1, 'AutoLogin', '[]', 0, '2020-10-14 22:14:09', '2020-10-14 22:14:09', '2021-10-14 22:14:09'),
('fce35647ec693b49c03f904579dbdc3b5a702a8e1ec6e1ccd79d139a94c74d722cce5cad47a96cae', 65, 1, 'AutoLogin', '[]', 0, '2020-06-02 13:45:58', '2020-06-02 13:45:58', '2021-06-02 13:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Repair It Now Personal Access Client', 'lGrAvNRWlJUp9gc6tvar0uQdQ8peaKW8Uquk3W1w', 'http://localhost', 1, 0, 0, '2020-05-17 00:57:58', '2020-05-17 00:57:58'),
(2, NULL, 'Repair It Now Password Grant Client', 'jBLLTeESCxARDuhqO02YOOvBcJUoiWWmeUHoXZJd', 'http://localhost', 0, 1, 0, '2020-05-17 00:57:58', '2020-05-17 00:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-17 00:57:58', '2020-05-17 00:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('275744091c2fe12be53d149fe86bbb8c69400eec65739a15b46466781ac51e787c28c721888d8e7d', 'd66d84f01216922b7734154b31842b248236f966da83b006a6df6ff49b8b2cee23c1ca78b944cad4', 0, '2020-12-29 20:11:11'),
('386d9355c7dbbb422f84b76cbfe82e3286452e0a2760e93816ec7f769f9b3b523c467ecf1c6d881f', '0506c453d3bf9f1fe8cd57150132d4e78b09e04b1e80a675de31e6739d9b4465e9a5ef67a201a48a', 0, '2020-08-19 05:32:32'),
('5d287b99bc030484b03ec98d99b5bee464d00099399fe61d9a0a2d234c5d88cd47aa3deffbaa68ff', 'a25cb40c8966e7b87aecbd6ee37a4d64a8f23d2b0b9cc5ae37de05a6cb4a6407f373ac312a5c5883', 0, '2020-08-19 09:28:49'),
('73efa8e0a1d9156c323dc9e8835335c97527c696f50f8cd896e7a4baa1dfda7cf029e6498adc605f', 'a0f784f95f20edcfe627833dde58868f10486ca9b3dac3f272617acda42ebf07b9a6c7b934701708', 0, '2020-08-19 05:13:21'),
('9653d2cd91efde79df21c1271ebb6c4b58a39f8d165f88ab4d64bce0517bf7b795ae604287019337', '1d9dcc897d445f75954df449cbdbf2f1cea6a8a18f883881218a56dc445410ebdb064756a7f7c20a', 0, '2021-02-20 23:41:16'),
('ac23ce95f7133918e338e9bd17e8fbc90c3d19ed70f82febee343a8bf32cad944457746f0335bbc9', 'cadf3f11842c4699eb3b1239472ac4f2cdc99ec96bff3310dcfbc3c46491c7b6ce16d8b56250d99f', 0, '2020-08-21 19:17:21'),
('c588edfc1feaf6b0a4b21881582aff52ffdc383cf2884982d40523fff82ebf52494d3740148fd4e1', '9279bfcc680ffd5483a9b8dd6fd0909ea49bdcaeba8b7e3619c3c9401fad90f9894a3c7f3532250b', 0, '2020-09-06 13:42:18'),
('d302fd2c3a0f4b58028a087fda7ffcb09cb88cb6afee96a43148a2c974862d0bddbecebcaf8e9160', 'd0d03ce9eba2edbdbe73e490ee74285cb96b3534686377f94cd0b0d258a90571ab2849cb9fdebbed', 0, '2021-02-22 01:04:03'),
('d33e6ef3a2ea6e01875164d64ffd3ad973acb89b9f1d2c3f75ee3e4389793ef423c1f97b89994075', 'b24d1910a8abd884bc96a7fae6a9238c3f01ca38143dc7ec547c60d00cc34cf80ccc02493a71d26b', 0, '2020-09-06 12:40:46'),
('ef96658b95746f983b0c661b7bccc790e2f6f558baea281a598509f3a73fe5bfa88761cd1889244e', '1709f5dcd3ef1faa086964b0dc9fa7d11a94d87b7b921a36de8632fbfa7dcd1535aa6a31d1380156', 0, '2020-08-16 05:53:49'),
('fd434af5cc76877d9e722a56428398fab2402ab43103588915041657f656386caa3f20d76d419045', '67e3255dbb969355175440856c81a078045bff9d7dd2f1e9209c2744f4786e98ed40368e83e2980e', 0, '2020-08-25 08:37:29'),
('ff57f089e925b67f0f0e5b29f6adc1edb5192cc26ea3bbb022ba23745a365866028f87a28b3bef74', 'd417356fdacac5ef550b1d21b1702af823a025133b36d8d76e0b91d1cbc3a772df4f560980ec5565', 0, '2020-08-20 13:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_logs`
--

CREATE TABLE `payment_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_wallet` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'user or provider',
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT 'user id or provider id',
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `transaction_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Random code generated during payment',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foreign key of the user request or wallet table',
  `response` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_logs`
--

INSERT INTO `payment_logs` (`id`, `is_wallet`, `user_type`, `payment_mode`, `user_id`, `amount`, `transaction_code`, `transaction_id`, `response`, `created_at`, `updated_at`) VALUES
(1, 1, 'provider', 'CARD', 2, 195.60, 'RIN377259', NULL, NULL, '2020-06-04 11:56:39', '2020-06-04 11:56:39'),
(2, 1, 'provider', 'CARD', 2, 195.60, 'RIN349233', NULL, NULL, '2020-06-04 11:57:04', '2020-06-04 11:57:04'),
(3, 1, 'provider', 'CARD', 2, 195.60, 'RIN451463', NULL, NULL, '2020-06-04 11:57:21', '2020-06-04 11:57:21'),
(4, 1, 'provider', 'CARD', 2, 200.00, 'RIN604195', NULL, NULL, '2020-06-04 12:01:57', '2020-06-04 12:01:57'),
(5, 1, 'provider', 'CARD', 2, 200.00, 'RIN422911', NULL, NULL, '2020-06-04 12:54:56', '2020-06-04 12:54:56'),
(6, 1, 'provider', 'CARD', 2, 195.60, 'RIN486569', NULL, NULL, '2020-06-04 12:57:14', '2020-06-04 12:57:14'),
(7, 1, 'provider', 'CARD', 2, 100.00, 'RIN380120', NULL, NULL, '2020-06-04 13:00:04', '2020-06-04 13:00:04'),
(8, 1, 'user', 'CARD', 15, 100.00, 'RIN217173', NULL, NULL, '2020-06-07 11:41:09', '2020-06-07 11:41:09'),
(9, 1, 'provider', 'CARD', 2, 100.00, 'RIN736259', NULL, NULL, '2020-06-07 11:44:46', '2020-06-07 11:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `payu_payments`
--

CREATE TABLE `payu_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payable_id` int(10) UNSIGNED DEFAULT NULL,
  `payable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txnid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mihpayid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `net_amount_debit` double NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unmappedstatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_ref_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardnum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_on_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issuing_bank` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peak_hours`
--

CREATE TABLE `peak_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `peak_hours`
--

INSERT INTO `peak_hours` (`id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '13:00:00', '17:00:00', '2020-05-17 13:36:43', '2020-11-22 10:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard-menus', 'Box Menus', 'admin', 'Dashboard', NULL, NULL),
(2, 'wallet-summary', 'Wallet Summary', 'admin', 'Dashboard', NULL, NULL),
(3, 'recent-rides', 'Recent Rides', 'admin', 'Dashboard', NULL, NULL),
(4, 'dispatcher-panel', 'Dispatcher Menu', 'admin', 'Dispatcher Panel', NULL, NULL),
(5, 'dispatcher-panel-add', 'Add Rides', 'admin', 'Dispatcher Panel', NULL, NULL),
(6, 'dispute-list', 'Dispute list', 'admin', 'Dispute', NULL, NULL),
(7, 'dispute-create', 'Create Dispute', 'admin', 'Dispute', NULL, NULL),
(8, 'dispute-edit', 'Edit Dispute', 'admin', 'Dispute', NULL, NULL),
(9, 'dispute-delete', 'Delete Dispute', 'admin', 'Dispute', NULL, NULL),
(10, 'heat-map', 'Heat Map', 'admin', 'Map', NULL, NULL),
(11, 'god-eye', 'God\'s Eye', 'admin', 'Map', NULL, NULL),
(12, 'user-list', 'User list', 'admin', 'Users', NULL, NULL),
(13, 'user-history', 'User History', 'admin', 'Users', NULL, NULL),
(14, 'user-create', 'Create User', 'admin', 'Users', NULL, NULL),
(15, 'user-edit', 'Edit User', 'admin', 'Users', NULL, NULL),
(16, 'user-delete', 'Delete User', 'admin', 'Users', NULL, NULL),
(17, 'provider-list', 'Provider list', 'admin', 'Providers', NULL, NULL),
(18, 'provider-create', 'Create Provider', 'admin', 'Providers', NULL, NULL),
(19, 'provider-edit', 'Edit Provider', 'admin', 'Providers', NULL, NULL),
(20, 'provider-delete', 'Delete Provider', 'admin', 'Providers', NULL, NULL),
(21, 'provider-status', 'Provider Status', 'admin', 'Providers', NULL, NULL),
(22, 'provider-history', 'Ride History', 'admin', 'Providers', NULL, NULL),
(23, 'provider-statements', 'Statements', 'admin', 'Providers', NULL, NULL),
(24, 'provider-services', 'Provider Services', 'admin', 'Providers', NULL, NULL),
(25, 'provider-service-update', 'Provider Service Update', 'admin', 'Providers', NULL, NULL),
(26, 'provider-service-delete', 'Provider Service Delete', 'admin', 'Providers', NULL, NULL),
(27, 'provider-documents', 'Provider Documents', 'admin', 'Providers', NULL, NULL),
(28, 'provider-document-edit', 'Provider Document Edit', 'admin', 'Providers', NULL, NULL),
(29, 'provider-document-delete', 'Provider Document Delete', 'admin', 'Providers', NULL, NULL),
(30, 'dispatcher-list', 'Dispatcher list', 'admin', 'Dispatcher', NULL, NULL),
(31, 'dispatcher-create', 'Create Dispatcher', 'admin', 'Dispatcher', NULL, NULL),
(32, 'dispatcher-edit', 'Edit Dispatcher', 'admin', 'Dispatcher', NULL, NULL),
(33, 'dispatcher-delete', 'Delete Dispatcher', 'admin', 'Dispatcher', NULL, NULL),
(34, 'agent-list', 'Agent Owner list', 'admin', 'Agent Owner', NULL, NULL),
(35, 'agent-create', 'Create Agent Owner', 'admin', 'Agent Owner', NULL, NULL),
(36, 'agent-edit', 'Edit Agent Owner', 'admin', 'Agent Owner', NULL, NULL),
(37, 'agent-delete', 'Delete Agent Owner', 'admin', 'Agent Owner', NULL, NULL),
(38, 'agent-providers', 'Agent Owner\'s Providers list', 'admin', 'Agent Owner', NULL, NULL),
(39, 'account-manager-list', 'Account Manager list', 'admin', 'Account Manager', NULL, NULL),
(40, 'account-manager-create', 'Create Account Manager', 'admin', 'Account Manager', NULL, NULL),
(41, 'account-manager-edit', 'Edit Account Manager', 'admin', 'Account Manager', NULL, NULL),
(42, 'account-manager-delete', 'Delete Account Manager', 'admin', 'Account Manager', NULL, NULL),
(43, 'dispute-manager-list', 'Dispute Manager list', 'admin', 'Dispute Manager', NULL, NULL),
(44, 'dispute-manager-create', 'Create Dispute Manager', 'admin', 'Dispute Manager', NULL, NULL),
(45, 'dispute-manager-edit', 'Edit Dispute Manager', 'admin', 'Dispute Manager', NULL, NULL),
(46, 'dispute-manager-delete', 'Delete Dispute Manager', 'admin', 'Dispute Manager', NULL, NULL),
(47, 'statements', 'Statements', 'admin', 'Statements', NULL, NULL),
(48, 'settlements', 'Settlements', 'admin', 'Settlements', NULL, NULL),
(49, 'ratings', 'Ratings', 'admin', 'Ratings', NULL, NULL),
(50, 'ride-history', 'Ride History', 'admin', 'Rides', NULL, NULL),
(51, 'ride-delete', 'Delete Ride', 'admin', 'Rides', NULL, NULL),
(52, 'schedule-rides', 'Schedule Rides', 'admin', 'Rides', NULL, NULL),
(53, 'promocodes-list', 'Promocodes List', 'admin', 'Promocodes', NULL, NULL),
(54, 'promocodes-create', 'Create Promocode', 'admin', 'Promocodes', NULL, NULL),
(55, 'promocodes-edit', 'Edit Promocode', 'admin', 'Promocodes', NULL, NULL),
(56, 'promocodes-delete', 'Delete Promocode', 'admin', 'Promocodes', NULL, NULL),
(57, 'service-types-list', 'Service Types List', 'admin', 'Service Types', NULL, NULL),
(58, 'service-types-create', 'Create Service Type', 'admin', 'Service Types', NULL, NULL),
(59, 'service-types-edit', 'Edit Service Type', 'admin', 'Service Types', NULL, NULL),
(60, 'service-types-delete', 'Delete Service Type', 'admin', 'Service Types', NULL, NULL),
(61, 'peak-hour-list', 'Peak Hour List', 'admin', 'Service Types', NULL, NULL),
(62, 'peak-hour-create', 'Create Peak Hour', 'admin', 'Service Types', NULL, NULL),
(63, 'peak-hour-edit', 'Edit Peak Hour', 'admin', 'Service Types', NULL, NULL),
(64, 'peak-hour-delete', 'Delete Peak Hour', 'admin', 'Service Types', NULL, NULL),
(65, 'documents-list', 'Documents List', 'admin', 'Documents', NULL, NULL),
(66, 'documents-create', 'Create Document', 'admin', 'Documents', NULL, NULL),
(67, 'documents-edit', 'Edit Document', 'admin', 'Documents', NULL, NULL),
(68, 'documents-delete', 'Delete Document', 'admin', 'Documents', NULL, NULL),
(69, 'cancel-reasons-list', 'Cancel Reason List', 'admin', 'Cancel Reasons', NULL, NULL),
(70, 'cancel-reasons-create', 'Create Reason', 'admin', 'Cancel Reasons', NULL, NULL),
(71, 'cancel-reasons-edit', 'Edit Reason', 'admin', 'Cancel Reasons', NULL, NULL),
(72, 'cancel-reasons-delete', 'Delete Reason', 'admin', 'Cancel Reasons', NULL, NULL),
(73, 'notification-list', 'Notifications List', 'admin', 'Notifications', NULL, NULL),
(74, 'notification-create', 'Create Notification', 'admin', 'Notifications', NULL, NULL),
(75, 'notification-edit', 'Edit Notification', 'admin', 'Notifications', NULL, NULL),
(76, 'notification-delete', 'Delete Notification', 'admin', 'Notifications', NULL, NULL),
(77, 'lost-item-list', 'Lost Item List', 'admin', 'Lost Items', NULL, NULL),
(78, 'lost-item-create', 'Create Lost Item', 'admin', 'Lost Items', NULL, NULL),
(79, 'lost-item-edit', 'Edit Lost Item', 'admin', 'Lost Items', NULL, NULL),
(80, 'role-list', 'Role list', 'admin', 'Role', NULL, NULL),
(81, 'role-create', 'Create Role', 'admin', 'Role', NULL, NULL),
(82, 'role-edit', 'Edit Role', 'admin', 'Role', NULL, NULL),
(83, 'role-delete', 'Delete Role', 'admin', 'Role', NULL, NULL),
(84, 'sub-admin-list', 'Sub Admins List', 'admin', 'Sub Admins', NULL, NULL),
(85, 'sub-admin-create', 'Create Sub Admin', 'admin', 'Sub Admins', NULL, NULL),
(86, 'sub-admin-edit', 'Edit Sub Admin', 'admin', 'Sub Admins', NULL, NULL),
(87, 'sub-admin-delete', 'Delete Sub Admin', 'admin', 'Sub Admins', NULL, NULL),
(88, 'payment-history', 'Payment History List', 'admin', 'Payment', NULL, NULL),
(89, 'payment-settings', 'Payment Settings List', 'admin', 'Payment', NULL, NULL),
(90, 'site-settings', 'Site Settings', 'admin', 'Settings', NULL, NULL),
(91, 'account-settings', 'Account Settings', 'admin', 'Settings', NULL, NULL),
(92, 'transalations', 'Translations', 'admin', 'Settings', NULL, NULL),
(93, 'change-password', 'Change Password', 'admin', 'Settings', NULL, NULL),
(94, 'cms-pages', 'CMS Pages', 'admin', 'Pages', NULL, NULL),
(95, 'help', 'Help', 'admin', 'Pages', NULL, NULL),
(96, 'custom-push', 'Custom Push', 'admin', 'Others', NULL, NULL),
(97, 'db-backup', 'DB Backup', 'admin', 'Others', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double(5,2) NOT NULL DEFAULT '0.00',
  `max_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `promo_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_passbooks`
--

CREATE TABLE `promocode_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `status` enum('document','card','onboarding','approved','banned','balance') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'document',
  `agent` int(11) NOT NULL DEFAULT '0',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_acc_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `wallet_balance` double(10,2) NOT NULL DEFAULT '0.00',
  `referral_unique_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrcode_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_pro_ends_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `first_name`, `last_name`, `email`, `gender`, `country_code`, `mobile`, `password`, `avatar`, `rating`, `status`, `agent`, `latitude`, `longitude`, `stripe_acc_id`, `stripe_cust_id`, `paypal_email`, `login_by`, `social_unique_id`, `otp`, `wallet_balance`, `referral_unique_id`, `qrcode_url`, `trial_pro_ends_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(21, 'Sam', 'Paul', 'spearthesam@gmail.com', 'MALE', '+91', '8220661227', '$2y$10$fnV27/fGj7ff9Rb8bnPEtO4r8GPi6ezoMz6jxuVvrkmSXkQ7L/rei', 'provider/profile/ssH7waBZGKmDV5frpcoYIv8hRMHZsNtChSSqOkkO.jpeg', '5.00', 'approved', 0, 11.15115203, 77.31519575, NULL, NULL, NULL, 'manual', NULL, 0, 0.00, '2F90DB', 'uploads/1593231863456885750_8220661227.png', NULL, NULL, '2020-06-27 09:54:23', '2020-07-20 17:26:31'),
(22, 'Elavarasan', 'Manimaran', 'elavarasanmanimaran319@gmail.com', 'MALE', '+91', '9952287319', '$2y$10$tVKmRTIfpv8791pWLnS0BujFp3jWTBTtXl5kzYjMw0ha3vKRfBi1W', NULL, '5.00', 'document', 0, 11.12310125, 77.32494562, NULL, NULL, NULL, 'manual', NULL, 0, 0.00, '03AECA', 'uploads/15945733742022085130_9952287319.png', NULL, NULL, '2020-06-29 13:28:46', '2020-07-12 22:32:54'),
(23, 'Sethupathy', 'Dhanabal', 'sethu.vr4@gmail.com', 'MALE', '+91', '7667503888', '$2y$10$ycEk1nVHvA/13vxMhVU8AuM5sXlN63Epo8yPGly37RjqXrxFnQAX2', NULL, '5.00', 'approved', 0, NULL, NULL, NULL, NULL, NULL, 'manual', NULL, 890502, 0.00, 'B7B096', 'uploads/1593431748491297255_7667503888.png', NULL, NULL, '2020-06-29 17:25:48', '2020-07-31 13:27:04'),
(24, 'Mohan', 'Kumar', '108doller@gmail.com', 'MALE', '+91', '8124676460', '$2y$10$G5/xpPmXg7SPxHsxWYej/Oxa.nk0eP1YfMEXinusHbzJIbckG/jqO', 'provider/profile/PfnNrAOWu5Ah1MUehK9CeuHUFE6QrBml8KqL4Jk0.jpeg', '5.00', 'approved', 0, 11.09142479, 77.39250242, NULL, NULL, NULL, 'manual', NULL, 393519, 0.00, 'DA96BE', 'uploads/1593671025612064213_8124676460.png', NULL, NULL, '2020-07-02 11:53:45', '2020-07-29 13:13:47'),
(25, 'Dinesh', 's', 'dinesh.s7708@gmail.com', 'MALE', '+91', '9843038375', '$2y$10$iWtVWUjTnY9VL1Q6Lk/Jnur6/tzg.c41/wpm1JJ58RFEOaLezsheK', 'provider/profile/wOwIvQmKOWxqCXlsCZeGEU2iFNiHLaPpjOUJTmUb.jpeg', '5.00', 'approved', 0, 11.15400656, 77.29969536, NULL, NULL, NULL, 'manual', NULL, 932741, 0.00, NULL, 'uploads/1594438043464239677_9843038375.png', NULL, NULL, '2020-07-11 08:57:23', '2020-08-03 11:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `provider_cards`
--

CREATE TABLE `provider_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_cards`
--

INSERT INTO `provider_cards` (`id`, `user_id`, `last_four`, `card_id`, `brand`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 2, '5984', 'card_1GqCX3JzY1MV2JZ1L2sP09qh', 'Visa', 1, '2020-06-04 11:56:32', '2020-06-07 11:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `provider_devices`
--

CREATE TABLE `provider_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `jwt_token` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_devices`
--

INSERT INTO `provider_devices` (`id`, `provider_id`, `udid`, `token`, `sns_arn`, `type`, `jwt_token`, `created_at`, `updated_at`) VALUES
(20, 21, '8c4cc562e628bf5c', 'efn6dRmv9RI:APA91bFqWFV7P2PqgxCCCARLBng-XgNzgTxmhJLmysS3WgUBIlAq-UVRV9lsWr7mE6qBNpfpPsuaBdIAu4HHEpQSgYssBGhoV8PepAIv3TnrsNX190vaj7eqvhS9uJlutweXAFcQtLew', NULL, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIxLCJpc3MiOiJodHRwczovL3d3dy5yZXBhaXJpdG5vdy5pbi9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE1OTUyMjI5MTYsImV4cCI6MTU5NTU4MjkxNiwibmJmIjoxNTk1MjIyOTE2LCJqdGkiOiI3R3l2eWZFcDVGaDBJOVJrIn0.Qgdsgj1nTYmQWZfokeHy8l1RPZqqGzDj6AStGAGSiYg', '2020-06-27 09:54:23', '2020-07-20 10:58:36'),
(21, 22, '4313abd7527d71e7', 'dB9pD_ab-Ec:APA91bGa8v86Wn9wEL_zIAAlRkqI64QlApSuCaYCGv7iC744vf27NGWSXN6wEqXS5SWzEyFGgqiTMT1cMOayMotBeI2zm6CO6MYW7-ymlIGT2DVqd5phHKZYdVZrtNouHSf0ZhoFocQt', NULL, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIyLCJpc3MiOiJodHRwczovL3d3dy5yZXBhaXJpdG5vdy5pbi9hcGkvcHJvdmlkZXIvcmVnaXN0ZXIiLCJpYXQiOjE1OTM0MTc1MjYsImV4cCI6MTU5Mzc3NzUyNiwibmJmIjoxNTkzNDE3NTI2LCJqdGkiOiJzRmkzYlNBOElOOG92OFh2In0.JQZDJgPALMKgoQf6lqavTqmto9mZeBugZBqUeLUhUfs', '2020-06-29 13:28:46', '2020-06-29 13:28:46'),
(22, 23, '5320d08bd640cd10', 'dOKtcBo2hMY:APA91bEEerhOsToBkLuRBNhpuXKz1LHpnbKnIEJVL6jO0uyvZRGTvGnOxR0q5nTAqhwPecqCA7v0n-2d6BJqMyR9I68JPkBvpdRr0ErvmWCRZqvpUN5FJKhTH7wQwc2R-w6f3roYtxaa', NULL, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjIzLCJpc3MiOiJodHRwczovL3d3dy5yZXBhaXJpdG5vdy5pbi9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE1OTQ3MjAzODgsImV4cCI6MTU5NTA4MDM4OCwibmJmIjoxNTk0NzIwMzg4LCJqdGkiOiJGaU5Qb2xmMXVmczhXNnhqIn0.HhkhbhTTRD79Vo8DfppH7gh7WajvAbwxd-w-FN4PefE', '2020-06-29 17:25:48', '2020-07-14 15:23:08'),
(23, 24, '18c169a52f0b056d', 'e3xJIwtiKfk:APA91bHwWQa9SqElIMomcqTQch9iJSTrGZq8tOSSpU7ck5ZJBeHW3LiJrIXBjkkpYHTXHiUsmA_V-UneZtAwBsP53CVrWxCwzMwEh90HEik2Ec2xWauHIv3AZqGPSEjhQRclcauWgYso', NULL, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI0LCJpc3MiOiJodHRwczovL3d3dy5yZXBhaXJpdG5vdy5pbi9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE1OTYwMDg2NTMsImV4cCI6MTU5NjM2ODY1MywibmJmIjoxNTk2MDA4NjUzLCJqdGkiOiJ5NVFFUlJTSHpkNkpQSk80In0.DHPEW_1GiU5V1FBeZRbivtSo8whW2NuytB9CuL90qJA', '2020-07-02 11:53:45', '2020-07-29 13:14:13'),
(24, 25, 'f4ad81e2cb06abf0', 'c_HoWFEAwDQ:APA91bGJY9oEKx8nAlWsDjwRnd0q9LIagEt2fVi-X0NNp61uB4gMFm7z8oPkghL--vt3RSy5oGdhBwD15XYo7p29n1Qe7OQVL_TsQFsnJFt2zxDC3BCbr-G8EIVvev29kDe3Z1pPnNvB', NULL, 'android', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjI1LCJpc3MiOiJodHRwczovL3d3dy5yZXBhaXJpdG5vdy5pbi9hcGkvcHJvdmlkZXIvb2F1dGgvdG9rZW4iLCJpYXQiOjE1OTYxODE1ODcsImV4cCI6MTU5NjU0MTU4NywibmJmIjoxNTk2MTgxNTg3LCJqdGkiOiJrcXBCcDdTVGtqc1RvSmhzIn0.PKd63Z0I9Oui0M1LpP30APDwJlJHOX7fe0QpRC0KOOg', '2020-07-11 08:58:33', '2020-07-31 13:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `provider_documents`
--

CREATE TABLE `provider_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_documents`
--

INSERT INTO `provider_documents` (`id`, `provider_id`, `document_id`, `url`, `unique_id`, `status`, `expires_at`, `created_at`, `updated_at`) VALUES
(9, 2, '1', 'provider/documents/2/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:17:58', '2020-05-23 10:00:37'),
(10, 2, '3', 'provider/documents/2/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:17:58', '2020-05-23 10:00:51'),
(11, 2, '4', 'provider/documents/2/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:17:58', '2020-05-23 10:01:01'),
(12, 2, '5', 'provider/documents/2/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:17:58', '2020-05-23 10:01:36'),
(13, 2, '6', 'provider/documents/2/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:17:58', '2020-05-23 10:17:37'),
(14, 2, '2', 'provider/documents/2/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:25:15', '2020-05-23 10:19:35'),
(15, 3, '1', 'provider/documents/3/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:49:38'),
(16, 3, '2', 'provider/documents/3/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:49:44'),
(17, 3, '3', 'provider/documents/3/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:49:51'),
(18, 3, '4', 'provider/documents/3/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:50:09'),
(19, 3, '5', 'provider/documents/3/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:50:19'),
(20, 3, '6', 'provider/documents/3/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-05-23 07:32:07', '2020-05-23 12:50:37'),
(21, 5, '1', 'provider/documents/5/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:27:02'),
(22, 5, '2', 'provider/documents/5/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:37:24'),
(23, 5, '3', 'provider/documents/5/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:37:28'),
(24, 5, '4', 'provider/documents/5/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:28:52'),
(25, 5, '5', 'provider/documents/5/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:37:34'),
(26, 5, '6', 'provider/documents/5/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-05-25 08:13:22', '2020-05-25 08:37:38'),
(27, 8, '4', 'provider/documents/8/Photo.jpeg', NULL, 'ASSESSING', NULL, '2020-05-27 12:40:04', '2020-05-27 12:40:04'),
(28, 9, '1', 'provider/documents/9/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:42:41'),
(29, 9, '2', 'provider/documents/9/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:42:53'),
(30, 9, '3', 'provider/documents/9/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:43:12'),
(31, 9, '4', 'provider/documents/9/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:43:19'),
(32, 9, '5', 'provider/documents/9/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:43:32'),
(33, 9, '6', 'provider/documents/9/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-05-28 11:59:52', '2020-05-28 12:44:27'),
(34, 7, '1', 'provider/documents/7/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:01:38'),
(35, 7, '2', 'provider/documents/7/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:02:01'),
(36, 7, '3', 'provider/documents/7/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:02:15'),
(37, 7, '4', 'provider/documents/7/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:02:20'),
(38, 7, '5', 'provider/documents/7/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:02:25'),
(39, 7, '6', 'provider/documents/7/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-05-30 04:50:40', '2020-05-30 08:02:29'),
(40, 14, '2', 'provider/documents/14/RegistrationCertificate/GSTIN.jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 08:54:41', '2020-06-01 08:54:41'),
(41, 14, '3', 'provider/documents/14/AadharCard.jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 08:54:41', '2020-06-01 08:54:41'),
(42, 14, '4', 'provider/documents/14/Photo.jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 08:54:41', '2020-06-01 08:54:41'),
(43, 14, '5', 'provider/documents/14/PANCard.jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 08:54:41', '2020-06-01 08:54:41'),
(44, 14, '6', 'provider/documents/14/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 08:54:41', '2020-06-01 08:54:41'),
(45, 14, '1', 'provider/documents/14/BankPassbook.jpeg', NULL, 'ASSESSING', NULL, '2020-06-01 09:10:34', '2020-06-01 09:10:34'),
(46, 17, '1', 'provider/documents/17/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:12:18'),
(47, 17, '2', 'provider/documents/17/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:12:30'),
(48, 17, '3', 'provider/documents/17/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:12:43'),
(49, 17, '4', 'provider/documents/17/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:12:51'),
(50, 17, '5', 'provider/documents/17/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:13:00'),
(51, 17, '6', 'provider/documents/17/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-06-02 15:53:35', '2020-06-03 09:13:09'),
(52, 8, '1', 'provider/documents/8/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 06:35:29', '2020-06-03 09:14:20'),
(53, 8, '3', 'provider/documents/8/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 06:35:29', '2020-06-03 09:14:33'),
(54, 8, '5', 'provider/documents/8/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 06:35:29', '2020-06-03 09:14:42'),
(55, 8, '6', 'provider/documents/8/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 06:35:29', '2020-06-03 09:14:56'),
(56, 8, '2', 'provider/documents/8/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 06:50:55', '2020-06-04 12:30:02'),
(57, 18, '1', 'provider/documents/18/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:05:50'),
(58, 18, '2', 'provider/documents/18/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:05:58'),
(59, 18, '3', 'provider/documents/18/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:06:08'),
(60, 18, '4', 'provider/documents/18/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:06:18'),
(61, 18, '5', 'provider/documents/18/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:06:27'),
(62, 18, '6', 'provider/documents/18/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 14:05:29', '2020-06-03 14:06:34'),
(63, 16, '1', 'provider/documents/16/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:01'),
(64, 16, '2', 'provider/documents/16/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:13'),
(65, 16, '3', 'provider/documents/16/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:22'),
(66, 16, '4', 'provider/documents/16/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:28'),
(67, 16, '5', 'provider/documents/16/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:42'),
(68, 16, '6', 'provider/documents/16/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-06-03 20:03:50', '2020-06-04 07:39:53'),
(69, 19, '1', 'provider/documents/19/BankPassbook.jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(70, 19, '2', 'provider/documents/19/RegistrationCertificate/GSTIN.jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(71, 19, '3', 'provider/documents/19/AadharCard.jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(72, 19, '4', 'provider/documents/19/Photo.jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(73, 19, '5', 'provider/documents/19/PANCard.jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(74, 19, '6', 'provider/documents/19/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ASSESSING', NULL, '2020-06-04 12:24:08', '2020-06-04 12:24:08'),
(75, 20, '1', 'provider/documents/20/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-05 12:11:07', '2020-06-05 12:16:37'),
(76, 20, '4', 'provider/documents/20/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-05 12:15:29', '2020-06-05 12:16:45'),
(77, 20, '2', 'provider/documents/20/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-06 10:43:31', '2020-06-06 16:21:26'),
(78, 20, '3', 'provider/documents/20/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-06 10:43:31', '2020-06-06 16:21:39'),
(79, 20, '5', 'provider/documents/20/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-06 10:43:31', '2020-06-06 16:21:52'),
(80, 20, '6', 'provider/documents/20/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ASSESSING', NULL, '2020-06-06 10:44:27', '2020-06-06 10:44:27'),
(81, 21, '1', 'provider/documents/21/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:19:38'),
(82, 21, '2', 'provider/documents/21/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:19:42'),
(83, 21, '3', 'provider/documents/21/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:19:46'),
(84, 21, '4', 'provider/documents/21/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:42:20'),
(85, 21, '5', 'provider/documents/21/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:42:24'),
(86, 21, '6', 'provider/documents/21/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-06-27 09:56:10', '2020-06-27 10:42:28'),
(87, 23, '3', 'provider/documents/23/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-29 17:27:30', '2020-07-03 13:07:08'),
(88, 23, '4', 'provider/documents/23/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-06-29 17:27:30', '2020-07-03 13:07:15'),
(89, 23, '5', 'provider/documents/23/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-06-29 17:28:54', '2020-07-03 13:07:20'),
(90, 23, '2', 'provider/documents/23/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-07-02 10:57:14', '2020-07-03 13:07:25'),
(91, 24, '1', 'provider/documents/24/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-07-04 18:33:47', '2020-07-05 14:05:55'),
(92, 24, '2', 'provider/documents/24/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-07-04 18:33:47', '2020-07-05 14:06:04'),
(93, 24, '3', 'provider/documents/24/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-07-04 18:33:47', '2020-07-05 14:06:09'),
(94, 24, '4', 'provider/documents/24/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-07-04 18:33:47', '2020-07-05 14:06:15'),
(95, 24, '5', 'provider/documents/24/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-07-04 18:33:47', '2020-07-05 14:06:23'),
(97, 24, '6', 'provider/documents/24/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-07-06 09:28:51', '2020-07-06 12:21:10'),
(98, 25, '1', 'provider/documents/25/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:15'),
(99, 25, '2', 'provider/documents/25/RegistrationCertificate/GSTIN.jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:20'),
(100, 25, '3', 'provider/documents/25/AadharCard.jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:25'),
(101, 25, '4', 'provider/documents/25/Photo.jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:31'),
(102, 25, '5', 'provider/documents/25/PANCard.jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:35'),
(103, 25, '6', 'provider/documents/25/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-07-11 08:59:49', '2020-07-11 09:00:08'),
(104, 23, '1', 'provider/documents/23/BankPassbook.jpeg', NULL, 'ACTIVE', NULL, '2020-07-14 15:26:39', '2020-07-31 13:26:55'),
(105, 23, '6', 'provider/documents/23/ElectricalBill/GasBill(AddressProof).jpeg', NULL, 'ACTIVE', NULL, '2020-07-14 15:26:39', '2020-07-31 13:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `provider_profiles`
--

CREATE TABLE `provider_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_profiles`
--

INSERT INTO `provider_profiles` (`id`, `provider_id`, `language`, `address`, `address_secondary`, `city`, `country`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2020-05-18 08:35:26', '2020-05-18 08:35:26'),
(2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-01 09:20:30', '2020-06-01 09:20:30'),
(3, 18, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-04 19:57:10', '2020-06-04 19:57:10'),
(4, 21, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-27 10:43:54', '2020-06-27 10:43:54'),
(5, 24, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-06 12:37:20', '2020-07-06 12:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `status` enum('active','offline','riding','hold','balance') COLLATE utf8_unicode_ci NOT NULL,
  `service_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_services`
--

INSERT INTO `provider_services` (`id`, `provider_id`, `service_type_id`, `status`, `service_number`, `service_model`, `created_at`, `updated_at`) VALUES
(45, 21, 33, 'offline', 'Mechanic', 'Mechanic', '2020-06-27 10:42:36', '2020-07-20 17:26:28'),
(46, 21, 37, 'offline', 'Mechanic', 'Mechanic', '2020-06-27 10:42:44', '2020-07-20 17:26:28'),
(47, 21, 38, 'offline', 'Mechanic', 'Mechanic', '2020-06-27 10:42:48', '2020-07-20 17:26:28'),
(48, 21, 34, 'offline', 'Mechanic', 'Mechanic', '2020-06-27 10:42:53', '2020-07-20 17:26:28'),
(49, 24, 35, 'active', 'Relocating', 'Relocating', '2020-07-06 12:21:35', '2020-07-08 16:21:13'),
(50, 24, 47, 'active', 'Relocating', 'Relocating', '2020-07-06 12:21:41', '2020-07-08 16:21:13'),
(51, 24, 48, 'active', 'Relocating', 'Relocating', '2020-07-06 12:21:44', '2020-07-08 16:21:13'),
(52, 24, 49, 'active', 'Relocating', 'Relocating', '2020-07-06 12:21:46', '2020-07-08 16:21:13'),
(53, 24, 45, 'active', 'Relocating', 'Relocating', '2020-07-06 12:21:52', '2020-07-08 16:21:13'),
(54, 24, 46, 'active', 'Relocating', 'Relocating', '2020-07-06 12:22:10', '2020-07-08 16:21:13'),
(56, 21, 43, 'offline', 'Relocating', 'Relocating', '2020-07-06 12:22:45', '2020-07-20 17:26:28'),
(57, 21, 40, 'offline', 'Relocating', 'Relocating', '2020-07-06 12:33:22', '2020-07-20 17:26:28'),
(58, 21, 41, 'offline', 'Relocating', 'Relocating', '2020-07-06 12:33:29', '2020-07-20 17:26:28'),
(59, 25, 33, 'offline', 'Relocating', 'Relocating', '2020-07-11 09:01:57', '2020-08-03 10:40:22'),
(60, 25, 37, 'offline', 'Relocating', 'Relocating', '2020-07-11 09:02:06', '2020-08-03 10:40:22'),
(61, 25, 43, 'offline', 'Relocating', 'Relocating', '2020-07-11 09:02:12', '2020-08-03 10:40:22'),
(62, 23, 33, 'active', 'Relocating', 'Relocating', '2020-07-31 13:27:08', '2020-07-31 13:27:08'),
(63, 23, 37, 'offline', 'Relocating', 'Relocating', '2020-07-31 13:27:18', '2020-07-31 13:27:18'),
(64, 23, 43, 'offline', 'Relocating', 'Relocating', '2020-07-31 13:27:35', '2020-07-31 13:27:35'),
(65, 23, 38, 'offline', 'Relocating', 'Relocating', '2020-07-31 13:27:50', '2020-07-31 13:27:50'),
(66, 23, 41, 'offline', 'Relocating', 'Relocating', '2020-07-31 13:27:54', '2020-07-31 13:27:54'),
(67, 23, 40, 'offline', 'Relocating', 'Relocating', '2020-07-31 13:27:59', '2020-07-31 13:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `provider_wallet`
--

CREATE TABLE `provider_wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('BRAINTREE','CARD','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `guard` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `endpoint` varchar(121) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('USER','PROVIDER') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USER',
  `reason` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_earnings`
--

CREATE TABLE `referral_earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-user,2-provider',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `count` mediumint(9) NOT NULL DEFAULT '0',
  `referral_histroy_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_histroy`
--

CREATE TABLE `referral_histroy` (
  `id` int(10) UNSIGNED NOT NULL,
  `referrer_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-user,2-provider',
  `referral_id` int(11) NOT NULL,
  `referral_data` longtext COLLATE utf8_unicode_ci,
  `status` enum('P','C') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'C',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_current_providers`
--

CREATE TABLE `request_current_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_filters`
--

INSERT INTO `request_filters` (`id`, `request_id`, `provider_id`, `status`, `created_at`, `updated_at`) VALUES
(37, 50, 3, 0, '2020-06-08 13:50:45', '2020-06-08 13:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `request_waiting_time`
--

CREATE TABLE `request_waiting_time` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `ended_at` timestamp NULL DEFAULT NULL,
  `waiting_mins` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `request_waiting_time`
--

INSERT INTO `request_waiting_time` (`id`, `request_id`, `started_at`, `ended_at`, `waiting_mins`, `created_at`, `updated_at`) VALUES
(1, 32, '2020-06-04 09:12:36', NULL, 0, '2020-06-04 09:12:36', '2020-06-04 09:12:36'),
(2, 50, '2020-06-08 15:15:49', '2020-06-08 15:16:10', 21, '2020-06-08 15:15:49', '2020-06-08 15:16:10'),
(3, 50, '2020-06-08 15:16:29', '2020-06-08 15:16:45', 16, '2020-06-08 15:16:29', '2020-06-08 15:16:45'),
(4, 50, '2020-06-08 15:30:24', '2020-06-08 15:37:34', 430, '2020-06-08 15:30:24', '2020-06-08 15:37:34'),
(5, 50, '2020-06-08 15:37:39', '2020-06-08 15:45:01', 442, '2020-06-08 15:37:39', '2020-06-08 15:45:01'),
(6, 50, '2020-06-08 15:49:29', '2020-06-08 15:53:59', 270, '2020-06-08 15:49:29', '2020-06-08 15:53:59'),
(7, 50, '2020-06-08 15:57:06', '2020-06-08 15:57:45', 39, '2020-06-08 15:57:06', '2020-06-08 15:57:45'),
(8, 50, '2020-06-08 15:58:22', '2020-06-08 15:58:29', 7, '2020-06-08 15:58:22', '2020-06-08 15:58:29'),
(9, 50, '2020-06-08 15:59:05', '2020-06-08 15:59:50', 45, '2020-06-08 15:59:05', '2020-06-08 15:59:50'),
(10, 50, '2020-06-08 16:03:15', NULL, 0, '2020-06-08 16:03:15', '2020-06-08 16:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'admin', NULL, NULL),
(2, 'DISPATCHER', 'admin', NULL, NULL),
(3, 'DISPUTE', 'admin', NULL, NULL),
(4, 'ACCOUNT', 'admin', NULL, NULL),
(5, 'AGENT', 'agent', NULL, NULL),
(6, 'Admin2', 'admin', '2020-05-20 09:00:26', '2020-05-20 09:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 5),
(5, 1),
(5, 2),
(5, 5),
(6, 1),
(6, 3),
(6, 5),
(6, 6),
(7, 1),
(7, 3),
(7, 5),
(7, 6),
(8, 1),
(8, 3),
(8, 5),
(8, 6),
(9, 1),
(9, 3),
(9, 5),
(10, 1),
(10, 5),
(10, 6),
(11, 1),
(11, 5),
(11, 6),
(12, 1),
(12, 5),
(12, 6),
(13, 1),
(13, 5),
(13, 6),
(14, 1),
(14, 5),
(15, 1),
(15, 5),
(16, 1),
(16, 5),
(17, 1),
(17, 5),
(17, 6),
(18, 1),
(18, 5),
(18, 6),
(19, 1),
(19, 5),
(20, 1),
(20, 5),
(21, 1),
(21, 5),
(21, 6),
(22, 1),
(22, 5),
(22, 6),
(23, 1),
(23, 5),
(24, 1),
(24, 5),
(24, 6),
(25, 1),
(25, 5),
(25, 6),
(26, 1),
(26, 5),
(27, 1),
(27, 5),
(27, 6),
(28, 1),
(28, 5),
(28, 6),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(30, 6),
(31, 1),
(31, 5),
(31, 6),
(32, 1),
(32, 5),
(33, 1),
(33, 5),
(33, 6),
(34, 1),
(34, 5),
(34, 6),
(35, 1),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(41, 5),
(42, 1),
(42, 5),
(43, 1),
(43, 5),
(43, 6),
(44, 1),
(44, 5),
(45, 1),
(45, 5),
(46, 1),
(46, 5),
(47, 1),
(47, 4),
(47, 5),
(48, 1),
(48, 5),
(49, 1),
(49, 5),
(49, 6),
(50, 1),
(50, 5),
(50, 6),
(51, 1),
(51, 5),
(52, 1),
(52, 5),
(53, 1),
(53, 5),
(53, 6),
(54, 1),
(54, 5),
(55, 1),
(55, 5),
(56, 1),
(56, 5),
(57, 1),
(57, 5),
(57, 6),
(58, 1),
(58, 5),
(59, 1),
(59, 5),
(60, 1),
(60, 5),
(61, 1),
(61, 5),
(62, 1),
(62, 5),
(63, 1),
(63, 5),
(64, 1),
(64, 5),
(65, 1),
(65, 5),
(66, 1),
(66, 5),
(67, 1),
(67, 5),
(68, 1),
(68, 5),
(69, 1),
(69, 5),
(69, 6),
(70, 1),
(70, 5),
(71, 1),
(71, 5),
(72, 1),
(72, 5),
(73, 1),
(73, 5),
(73, 6),
(74, 1),
(74, 5),
(75, 1),
(75, 5),
(76, 1),
(76, 5),
(77, 1),
(77, 5),
(77, 6),
(78, 1),
(78, 5),
(79, 1),
(79, 5),
(80, 1),
(80, 5),
(80, 6),
(81, 1),
(81, 5),
(82, 1),
(82, 5),
(83, 1),
(83, 5),
(84, 1),
(84, 5),
(85, 1),
(85, 5),
(86, 1),
(86, 5),
(87, 1),
(87, 5),
(88, 1),
(88, 5),
(89, 1),
(89, 5),
(90, 1),
(90, 5),
(91, 1),
(91, 2),
(91, 3),
(91, 4),
(91, 5),
(92, 1),
(92, 5),
(92, 6),
(93, 1),
(93, 2),
(93, 3),
(93, 4),
(93, 5),
(94, 1),
(94, 5),
(95, 1),
(95, 5),
(96, 1),
(96, 5),
(96, 6),
(97, 1),
(97, 5);

-- --------------------------------------------------------

--
-- Table structure for table `service_peak_hours`
--

CREATE TABLE `service_peak_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `peak_hours_id` int(11) NOT NULL,
  `min_price` double(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_peak_hours`
--

INSERT INTO `service_peak_hours` (`id`, `service_type_id`, `peak_hours_id`, `min_price`, `created_at`, `updated_at`) VALUES
(1, 36, 1, 80000.00, '2020-11-22 10:37:31', '2020-11-22 10:37:31'),
(2, 33, 1, 10.00, '2020-11-23 18:29:13', '2020-11-23 18:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marker` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed` int(11) DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `type_price` double(10,2) NOT NULL DEFAULT '0.00',
  `calculator` enum('DEFAULT','FIXED','HOUR','DAILY','WEIGHT','ESTIMATE','PSQFT') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DEFAULT',
  `description` blob,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `parent_id`, `agent_id`, `name`, `provider_name`, `image`, `marker`, `fixed`, `price`, `type_price`, `calculator`, `description`, `status`, `created_at`, `updated_at`) VALUES
(33, 0, 0, 'Computer Service', NULL, 'https://www.repairitnow.in/uploads/d8d53ba55d7e553ec8dfe9f3a3f69211d5a71513.png', 'https://www.repairitnow.in/uploads/43694115001903317e8869a933eb942eba1d9cf6.png', 500, 500.00, 0.00, 'FIXED', 0x436f6d7075746572205365727669636520696e7374616c6c2077696e646f7773, 1, '2020-06-26 09:18:59', '2020-11-23 18:29:13'),
(34, 0, 0, 'Mobile Phone Repair', NULL, 'https://www.repairitnow.in/uploads/321f6449df2bb1c41784d325de0c3a1c8ec3aafb.png', 'https://www.repairitnow.in/uploads/43e80301596c89288a03ec10174af8140b796ba9.png', 300, 0.00, 0.00, 'FIXED', '', 1, '2020-06-26 09:19:15', '2020-06-26 19:15:47'),
(35, 0, 0, 'RO / Aquaguard Services', NULL, 'https://www.repairitnow.in/uploads/2c9ba06f78e6315d1eb2612f33d6b253b790e216.png', 'https://www.repairitnow.in/uploads/cbb245645dc9b2ba549278c1d504a7f48035ca9c.png', 500, 0.00, 0.00, 'FIXED', '', 1, '2020-06-26 09:19:32', '2020-06-26 19:17:00'),
(36, 0, 0, 'AC Service', NULL, 'https://www.repairitnow.in/uploads/616fd926f0f41eca7aadbba7f13eb44c8929f018.png', 'https://www.repairitnow.in/uploads/0a1a1dd958c8a35e813b9b3d268c994d14999d43.png', 70, 0.00, 0.00, 'FIXED', 0x53657276696365204143, 1, '2020-06-26 09:20:04', '2020-11-22 10:37:31'),
(37, 33, 0, 'On-Site Service', NULL, 'https://www.repairitnow.in/uploads/272d57c04fe8c434b7bc1f1c26a3e15ca4dfe7af.png', 'https://www.repairitnow.in/uploads/bfab0f1e517a12dfedf885d5d43bcc00075aa294.png', 500, 250.00, 0.00, 'HOUR', 0x416c6c20736f667477617265206f722068617264776172652072657061697220776f726b732e204f6e6c7920746865205365727669636520636861726765206973206d656e74696f6e656420686572652e205468652070726f76696465722077696c6c206c657420796f75206b6e6f7720696620616e79207061727473206861766520746f206265207265706c6163656420616e642074686520636f7374206f662070617274732077696c6c206265206164646974696f6e616c2e0d0a0d0a4576656e20696e7370656374696f6e2077696c6c2062652063686172676564206966207468652074696d6572206973207475726e6564206f6e2e, 1, '2020-06-26 19:22:08', '2020-06-26 19:22:08'),
(38, 0, 0, 'CCTV Camera\'s', NULL, 'https://www.repairitnow.in/uploads/b6c315c521df12a42e8eef0f1e9a9d2fa2b29247.png', 'https://www.repairitnow.in/uploads/d53cc46047875f38e2402af5365510639e80c696.png', 500, 250.00, 0.00, 'HOUR', '', 1, '2020-06-26 19:47:31', '2020-06-26 19:47:31'),
(39, 0, 0, 'Mechanic', NULL, 'https://www.repairitnow.in/uploads/c79a29ea2aa44fe71e59b7b99eed5862799fc186.png', 'https://www.repairitnow.in/uploads/6835a88f5455e47e993d1d46ba1e9dcfcf75cfda.png', 500, 0.00, 0.00, 'FIXED', '', 1, '2020-06-26 19:49:11', '2020-06-26 19:49:11'),
(40, 38, 0, 'CCTV Camera Repair', NULL, 'https://www.repairitnow.in/uploads/508ad95eaafd3ea383b3c53cbf6dc0ebb6a8b05b.png', 'https://www.repairitnow.in/uploads/408ec3923dd675aaf8dca2a5d98612ce6db8b37c.png', 750, 350.00, 0.00, 'HOUR', 0x5468697320636f73742070726f76696465642068657265206973206f6e6c7920666f722072657061697220776f726b732e2054686520696e7370656374696f6e20616c736f2077696c6c20626520636861726765642e, 1, '2020-06-27 15:03:40', '2020-07-02 11:11:48'),
(41, 38, 0, 'CCTV Installation / Relocation', NULL, 'https://www.repairitnow.in/uploads/94dbf6e62896468543a484d5969398039434eed9.png', 'https://www.repairitnow.in/uploads/2aaf3840fd3e808ca9180a558d9d63809508a5bf.png', 750, 350.00, 0.00, 'HOUR', 0x57652077696c6c20696e7374616c6c206f722052656c6f6361746520616e6420436f6e66696775726520796f757220445652, 1, '2020-07-02 11:09:33', '2020-07-02 11:27:17'),
(43, 33, 0, 'OS Installation + Service On Site', NULL, 'https://www.repairitnow.in/uploads/2910924f854876519e54a33a2777d75e06ca6ff6.png', 'https://www.repairitnow.in/uploads/e3ce9a5e937b2dea1e5746f44806d6ff24830464.png', 1250, 300.00, 0.00, 'HOUR', 0x4f5320496e7374616c6c6174696f6e202b2053657276696365, 1, '2020-07-02 11:17:34', '2020-07-06 12:32:34'),
(44, 35, 0, 'Domestic', NULL, 'https://www.repairitnow.in/uploads/f5d4c3c3de6a0e7c199b8a469b0b4598c0861002.png', 'https://www.repairitnow.in/uploads/982ce15cb10fd0e61bb879dcc7d744c728175135.png', 500, 150.00, 0.00, 'FIXED', 0x416c6c20736572766963657320696e636c2066696c746572206368616e67652e2050726f6475637420636f7374206e6f7420696e636c756465642e, 1, '2020-07-02 11:43:10', '2020-07-06 12:25:38'),
(45, 44, 0, 'General Service', NULL, 'https://www.repairitnow.in/uploads/14e471517dca081901828710adeb9f14c290d5ab.png', 'https://www.repairitnow.in/uploads/664ef3a573b672d4984e444e1865946bdc81ce3e.png', 500, 150.00, 0.00, 'FIXED', 0x416c6c207365727669636520696e636c2066696c746572207265706c6163656d656e742e2050726f647563747320636f7374206e6f7420696e636c756465642e, 1, '2020-07-02 11:45:24', '2020-07-06 12:27:03'),
(46, 44, 0, 'Repair', NULL, 'https://www.repairitnow.in/uploads/457d80856bfbf2f26bf482bebd623fd86d8a5d17.png', 'https://www.repairitnow.in/uploads/b5047d09573ed05ab550e72b749e967148eef160.png', 500, 500.00, 0.00, 'FIXED', 0x416c6c207265706169722073657276696365732e2050726f6475637420636f737473206e6f7420696e636c756465642e, 1, '2020-07-02 11:49:59', '2020-07-06 12:27:52'),
(47, 44, 0, 'RO Installation', NULL, 'https://www.repairitnow.in/uploads/78c317809dfa2e8347722431c4afeec115be470f.png', 'https://www.repairitnow.in/uploads/57b44b652d35d087e7c892426bb6ac1d72474d49.png', 500, 500.00, 0.00, 'FIXED', '', 1, '2020-07-02 11:50:41', '2020-07-06 12:29:26'),
(48, 44, 0, 'RO Uninstallation', NULL, 'https://www.repairitnow.in/uploads/2a28f3033a5b51d00387f3e964528a60b2581aad.png', 'https://www.repairitnow.in/uploads/088c486bfd23140928e2068a43e3bda2b09f56b5.png', 500, 0.00, 0.00, 'FIXED', 0x556e696e7374616c6c206f722052656d6f766520524f, 1, '2020-07-02 11:59:03', '2020-07-06 12:30:01'),
(49, 44, 0, 'Relocating', NULL, 'https://www.repairitnow.in/uploads/59837da8d84efc029ad22f373bd8dd9e6c680e00.png', 'https://www.repairitnow.in/uploads/6f1bf878d2c76604f766060ade48a8f6a3782801.png', 500, 500.00, 0.00, 'FIXED', 0x52656c6f636174696e67, 1, '2020-07-02 12:00:35', '2020-07-06 12:29:52'),
(50, 36, 0, 'Pasang AC', NULL, 'https://kamucari.com/uploads/af6964937477b0ec9bcd790a9767922e023f8dd0.png', 'https://kamucari.com/uploads/9a236615ee8a48b273cae549445eef7d67dde785.png', 250000, 250000.00, 0.00, 'FIXED', 0x506173616e67204143, 1, '2020-11-23 12:17:37', '2020-11-23 12:17:37'),
(51, 36, 0, 'Isi Freon', NULL, 'https://kamucari.com/uploads/d384b726660e018761133b297f3131bc0090c0ae.png', 'https://kamucari.com/uploads/2de795ef32bc4c970881f580812ed718beeabf55.png', 125000, 125000.00, 0.00, 'FIXED', 0x497369204672656f6e20523232205233322052343130, 1, '2020-11-23 12:21:15', '2020-11-23 12:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'demo_mode', '0'),
(2, 'help', '<p>Support</p>'),
(3, 'page_privacy', '<p>Privacy and policy</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>PRIVACY POLICY</strong></h2>\r\n\r\n<p>Effective date: 2020-05-22</p>\r\n\r\n<p>1. <strong>Introduction</strong></p>\r\n\r\n<p>Welcome to <strong> Repair it now</strong>.</p>\r\n\r\n<p><strong>Repair it now</strong> (&ldquo;us&rdquo;, &ldquo;we&rdquo;, or &ldquo;our&rdquo;) operates <strong>www.repairitnow.com</strong> (hereinafter referred to as <strong>&ldquo;Service&rdquo;</strong>).</p>\r\n\r\n<p>Our Privacy Policy governs your visit to <strong>www.repairitnow.com</strong>, and explains how we collect, safeguard and disclose information that results from your use of our Service.</p>\r\n\r\n<p>We use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.</p>\r\n\r\n<p>Our Terms and Conditions (<strong>&ldquo;Terms&rdquo;</strong>) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (<strong>&ldquo;agreement&rdquo;</strong>).</p>\r\n\r\n<p>2. <strong>Definitions</strong></p>\r\n\r\n<p><strong>SERVICE</strong> means the www.repairitnow.com website operated by Repair it now.</p>\r\n\r\n<p><strong>PERSONAL DATA</strong> means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).</p>\r\n\r\n<p><strong>USAGE DATA</strong> is data collected automatically either generated by the use of Service or from Service infrastructure itself (for example, the duration of a page visit).</p>\r\n\r\n<p><strong>COOKIES</strong> are small files stored on your device (computer or mobile device).</p>\r\n\r\n<p><strong>DATA CONTROLLER</strong> means a natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal data are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your data.</p>\r\n\r\n<p><strong>DATA PROCESSORS (OR SERVICE PROVIDERS)</strong> means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively.</p>\r\n\r\n<p><strong>DATA SUBJECT</strong> is any living individual who is the subject of Personal Data.</p>\r\n\r\n<p><strong>THE USER</strong> is the individual using our Service. The User corresponds to the Data Subject, who is the subject of Personal Data.</p>\r\n\r\n<p>3. <strong>Information Collection and Use</strong></p>\r\n\r\n<p>We collect several different types of information for various purposes to provide and improve our Service to you.</p>\r\n\r\n<p>4. <strong>Types of Data Collected</strong></p>\r\n\r\n<p><strong>Personal Data</strong></p>\r\n\r\n<p>While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (<strong>&ldquo;Personal Data&rdquo;</strong>). Personally identifiable information may include, but is not limited to:</p>\r\n\r\n<p>0.1. Email address</p>\r\n\r\n<p>0.2. First name and last name</p>\r\n\r\n<p>0.3. Phone number</p>\r\n\r\n<p>0.4. Address, Country, State, Province, ZIP/Postal code, City</p>\r\n\r\n<p>0.5. Cookies and Usage Data</p>\r\n\r\n<p>We may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.</p>\r\n\r\n<p><strong>Usage Data</strong></p>\r\n\r\n<p>We may also collect information that your browser sends whenever you visit our Service or when you access Service by or through any device (<strong>&ldquo;Usage Data&rdquo;</strong>).</p>\r\n\r\n<p>This Usage Data may include information such as your computer&rsquo;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>When you access Service with a device, this Usage Data may include information such as the type of device you use, your device unique ID, the IP address of your device, your device operating system, the type of Internet browser you use, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p><strong>Location Data</strong></p>\r\n\r\n<p>We may use and store information about your location if you give us permission to do so (<strong>&ldquo;Location Data&rdquo;</strong>). We use this data to provide features of our Service, to improve and customize our Service.</p>\r\n\r\n<p>You can enable or disable location services when you use our Service at any time by way of your device settings.</p>\r\n\r\n<p><strong>Tracking Cookies Data</strong></p>\r\n\r\n<p>We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.</p>\r\n\r\n<p>Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.</p>\r\n\r\n<p>You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.</p>\r\n\r\n<p>Examples of Cookies we use:</p>\r\n\r\n<p>0.1. <strong>Session Cookies:</strong> We use Session Cookies to operate our Service.</p>\r\n\r\n<p>0.2. <strong>Preference Cookies:</strong> We use Preference Cookies to remember your preferences and various settings.</p>\r\n\r\n<p>0.3. <strong>Security Cookies:</strong> We use Security Cookies for security purposes.</p>\r\n\r\n<p>0.4. <strong>Advertising Cookies:</strong> Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.</p>\r\n\r\n<p><strong>Other Data</strong></p>\r\n\r\n<p>While using our Service, we may also collect the following information: sex, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and actual address, telephone number (work, mobile), details of documents on education, qualification, professional training, employment agreements, <a href=\"https://policymaker.io/non-disclosure-agreement/\">non-disclosure agreements</a>, information on bonuses and compensation, information on marital status, family members, social security (or other taxpayer identification) number, office location and other data.</p>\r\n\r\n<p>5. <strong>Use of Data</strong></p>\r\n\r\n<p>Repair it now uses the collected data for various purposes:</p>\r\n\r\n<p>0.1. to provide and maintain our Service;</p>\r\n\r\n<p>0.2. to notify you about changes to our Service;</p>\r\n\r\n<p>0.3. to allow you to participate in interactive features of our Service when you choose to do so;</p>\r\n\r\n<p>0.4. to provide customer support;</p>\r\n\r\n<p>0.5. to gather analysis or valuable information so that we can improve our Service;</p>\r\n\r\n<p>0.6. to monitor the usage of our Service;</p>\r\n\r\n<p>0.7. to detect, prevent and address technical issues;</p>\r\n\r\n<p>0.8. to fulfil any other purpose for which you provide it;</p>\r\n\r\n<p>0.9. to carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;</p>\r\n\r\n<p>0.10. to provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.;</p>\r\n\r\n<p>0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;</p>\r\n\r\n<p>0.12. in any other way we may describe when you provide the information;</p>\r\n\r\n<p>0.13. for any other purpose with your consent.</p>\r\n\r\n<p>6. <strong>Retention of Data</strong></p>\r\n\r\n<p>We will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n\r\n<p>We will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.</p>\r\n\r\n<p>7. <strong>Transfer of Data</strong></p>\r\n\r\n<p>Your information, including Personal Data, may be transferred to &ndash; and maintained on &ndash; computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.</p>\r\n\r\n<p>If you are located outside India and choose to provide information to us, please note that we transfer the data, including Personal Data, to India and process it there.</p>\r\n\r\n<p>Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.</p>\r\n\r\n<p>Repair it now will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organisation or a country unless there are adequate controls in place including the security of your data and other personal information.</p>\r\n\r\n<p>8. <strong>Disclosure of Data</strong></p>\r\n\r\n<p>We may disclose personal information that we collect, or you provide:</p>\r\n\r\n<p>0.1. <strong>Disclosure for Law Enforcement.</strong></p>\r\n\r\n<p>Under certain circumstances, we may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities.</p>\r\n\r\n<p>0.2. <strong>Business Transaction.</strong></p>\r\n\r\n<p>If we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred.</p>\r\n\r\n<p>0.3. <strong>Other cases. We may disclose your information also:</strong></p>\r\n\r\n<p>0.3.1. to our subsidiaries and affiliates;</p>\r\n\r\n<p>0.3.2. to contractors, service providers, and other third parties we use to support our business;</p>\r\n\r\n<p>0.3.3. to fulfill the purpose for which you provide it;</p>\r\n\r\n<p>0.3.4. for the purpose of including your company&rsquo;s logo on our website;</p>\r\n\r\n<p>0.3.5. for any other purpose disclosed by us when you provide the information;</p>\r\n\r\n<p>0.3.6. with your consent in any other cases;</p>\r\n\r\n<p>0.3.7. if we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.</p>\r\n\r\n<p>9. <strong>Security of Data</strong></p>\r\n\r\n<p>The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.</p>\r\n\r\n<p>10. <strong>Your Data Protection Rights Under General Data Protection Regulation (GDPR) </strong></p>\r\n\r\n<p>If you are a resident of the European Union (EU) and European Economic Area (EEA), you have certain data protection rights, covered by GDPR.</p>\r\n\r\n<p>We aim to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Data.</p>\r\n\r\n<p>If you wish to be informed what Personal Data we hold about you and if you want it to be removed from our systems, please email us at <strong>repairitnowin@gmail.com</strong>.</p>\r\n\r\n<p>In certain circumstances, you have the following data protection rights:</p>\r\n\r\n<p>0.1. the right to access, update or to delete the information we have on you;</p>\r\n\r\n<p>0.2. the right of rectification. You have the right to have your information rectified if that information is inaccurate or incomplete;</p>\r\n\r\n<p>0.3. the right to object. You have the right to object to our processing of your Personal Data;</p>\r\n\r\n<p>0.4. the right of restriction. You have the right to request that we restrict the processing of your personal information;</p>\r\n\r\n<p>0.5. the right to data portability. You have the right to be provided with a copy of your Personal Data in a structured, machine-readable and commonly used format;</p>\r\n\r\n<p>0.6. the right to withdraw consent. You also have the right to withdraw your consent at any time where we rely on your consent to process your personal information;</p>\r\n\r\n<p>Please note that we may ask you to verify your identity before responding to such requests. Please note, we may not able to provide Service without some necessary data.</p>\r\n\r\n<p>You have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA).</p>\r\n\r\n<p>11. <strong>Your Data Protection Rights under the California Privacy Protection Act (CalOPPA)</strong></p>\r\n\r\n<p>CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law&rsquo;s reach stretches well beyond California to require a person or company in the United States (and conceivable the world) that operates websites collecting personally identifiable information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals with whom it is being shared, and to comply with this policy.</p>\r\n\r\n<p>According to CalOPPA we agree to the following:</p>\r\n\r\n<p>0.1. users can visit our site anonymously;</p>\r\n\r\n<p>0.2. our Privacy Policy link includes the word &ldquo;Privacy&rdquo;, and can easily be found on the home page of our website;</p>\r\n\r\n<p>0.3. users will be notified of any privacy policy changes on our Privacy Policy Page;</p>\r\n\r\n<p>0.4. users are able to change their personal information by emailing us at <strong>repairitnowin@gmail.com</strong>.</p>\r\n\r\n<p>Our Policy on &ldquo;Do Not Track&rdquo; Signals:</p>\r\n\r\n<p>We honor Do Not Track signals and do not track, plant cookies, or use advertising when a Do Not Track browser mechanism is in place. Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked.</p>\r\n\r\n<p>You can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser.</p>\r\n\r\n<p>12. <strong>Your Data Protection Rights under the California Consumer Privacy Act (CCPA)</strong></p>\r\n\r\n<p>If you are a California resident, you are entitled to learn what data we collect about you, ask to delete your data and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:</p>\r\n\r\n<p><strong>0.1. What personal information we have about you. If you make this request, we will return to you:</strong></p>\r\n\r\n<p>0.0.1. The categories of personal information we have collected about you.</p>\r\n\r\n<p>0.0.2. The categories of sources from which we collect your personal information.</p>\r\n\r\n<p>0.0.3. The business or commercial purpose for collecting or selling your personal information.</p>\r\n\r\n<p>0.0.4. The categories of third parties with whom we share personal information.</p>\r\n\r\n<p>0.0.5. The specific pieces of personal information we have collected about you.</p>\r\n\r\n<p>0.0.6. A list of categories of personal information that we have sold, along with the category of any other company we sold it to. If we have not sold your personal information, we will inform you of that fact.</p>\r\n\r\n<p>0.0.7. A list of categories of personal information that we have disclosed for a business purpose, along with the category of any other company we shared it with.</p>\r\n\r\n<p>Please note, you are entitled to ask us to provide you with this information up to two times in a rolling twelve-month period. When you make this request, the information provided may be limited to the personal information we collected about you in the previous 12 months.</p>\r\n\r\n<p><strong>0.2. To delete your personal information. If you make this request, we will delete the personal information we hold about you as of the date of your request from our records and direct any service providers to do the same. In some cases, deletion may be accomplished through de-identification of the information. If you choose to delete your personal information, you may not be able to use certain functions that require your personal information to operate.</strong></p>\r\n\r\n<p><strong>0.3. To stop selling your personal information. We don&rsquo;t sell or rent your personal information to any third parties for any purpose. We do not sell your personal information for monetary consideration. However, under some circumstances, a transfer of personal information to a third party, or within our family of companies, without monetary consideration may be considered a &ldquo;sale&rdquo; under California law. You are the only owner of your Personal Data and can request disclosure or deletion at any time.</strong></p>\r\n\r\n<p>If you submit a request to stop selling your personal information, we will stop making such transfers.</p>\r\n\r\n<p>Please note, if you ask us to delete or stop selling your data, it may impact your experience with us, and you may not be able to participate in certain programs or membership services which require the usage of your personal information to function. But in no circumstances, we will discriminate against you for exercising your rights.</p>\r\n\r\n<p>To exercise your California data protection rights described above, please send your request(s) by email: <strong>repairitnowin@gmail.com</strong>.</p>\r\n\r\n<p>Your data protection rights, described above, are covered by the CCPA, short for the California Consumer Privacy Act. To find out more, visit the official California Legislative Information website. The CCPA took effect on 01/01/2020.</p>\r\n\r\n<p>13. <strong>Service Providers</strong></p>\r\n\r\n<p>We may employ third party companies and individuals to facilitate our Service (<strong>&ldquo;Service Providers&rdquo;</strong>), provide Service on our behalf, perform Service-related services or assist us in analysing how our Service is used.</p>\r\n\r\n<p>These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.</p>\r\n\r\n<p>14. <strong>Analytics</strong></p>\r\n\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n\r\n<p>15. <strong>CI/CD tools</strong></p>\r\n\r\n<p>We may use third-party Service Providers to automate the development process of our Service.</p>\r\n\r\n<p>16. <strong>Advertising</strong></p>\r\n\r\n<p>We may use third-party Service Providers to show advertisements to you to help support and maintain our Service.</p>\r\n\r\n<p>17. <strong>Behavioral Remarketing</strong></p>\r\n\r\n<p>We may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimise and serve ads based on your past visits to our Service.</p>\r\n\r\n<p>18. <strong>Payments</strong></p>\r\n\r\n<p>We may provide paid products and/or services within Service. In that case, we use third-party services for payment processing (e.g. payment processors).</p>\r\n\r\n<p>We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.</p>\r\n\r\n<p>19. <strong>Links to Other Sites</strong></p>\r\n\r\n<p>Our Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party&rsquo;s site. We strongly advise you to review the Privacy Policy of every site you visit.</p>\r\n\r\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\r\n\r\n<p>For example, the outlined Privacy Policy has been made using <a href=\"https://policymaker.io/\">PolicyMaker.io</a>, free tool that helps create high-quality legal documents. PolicyMaker&rsquo;s free online privacy policy generator is an easy-to-use tool for creating a <a href=\"https://policymaker.io/privacy-policy/\">privacy policy for website</a>, blog, e-commerce store or app.</p>\r\n\r\n<p>20. <strong><strong>Children&rsquo;s Privacy</strong></strong></p>\r\n\r\n<p>Our Services are not intended for use by children under the age of 18 (<strong>&ldquo;Child&rdquo;</strong> or <strong>&ldquo;Children&rdquo;</strong>).</p>\r\n\r\n<p>We do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.</p>\r\n\r\n<p>21. <strong>Changes to This Privacy Policy</strong></p>\r\n\r\n<p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update &ldquo;effective date&rdquo; at the top of this Privacy Policy.</p>\r\n\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n\r\n<p>22. <strong>Contact Us</strong></p>\r\n\r\n<p>If you have any questions about this Privacy Policy, please contact us by email: <strong>repairitnowin@gmail.com</strong>.</p>\r\n'),
(4, 'terms', '<p>Tearm and condition</p>\r\n\r\n<h2><strong>TERMS AND CONDITIONS</strong></h2>\r\n\r\n<p>Last updated: 2020-05-22</p>\r\n\r\n<p>1. <strong>Introduction</strong></p>\r\n\r\n<p>Welcome to <strong>Repair it now</strong> (&ldquo;Company&rdquo;, &ldquo;we&rdquo;, &ldquo;our&rdquo;, &ldquo;us&rdquo;)!</p>\r\n\r\n<p>These Terms of Service (&ldquo;Terms&rdquo;, &ldquo;Terms of Service&rdquo;) govern your use of our website located at <strong>www.repairitnow.in</strong> (together or individually &ldquo;Service&rdquo;) operated by <strong>Repair it now</strong>.</p>\r\n\r\n<p>Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.</p>\r\n\r\n<p>Your agreement with us includes these Terms and our Privacy Policy (&ldquo;Agreements&rdquo;). You acknowledge that you have read and understood Agreements, and agree to be bound of them.</p>\r\n\r\n<p>If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at <strong>repairitnowin@gmail.com</strong> so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.</p>\r\n\r\n<p>2. <strong>Communications</strong></p>\r\n\r\n<p>By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at repairitnowin@gmail.com.</p>\r\n\r\n<p>3. <strong>Purchases</strong></p>\r\n\r\n<p>If you wish to purchase any product or service made available through Service (&ldquo;Purchase&rdquo;), you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.</p>\r\n\r\n<p>You represent and warrant that: (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; and that (ii) the information you supply to us is true, correct and complete.</p>\r\n\r\n<p>We may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.</p>\r\n\r\n<p>We reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.</p>\r\n\r\n<p>4. <strong>Contests, Sweepstakes and Promotions</strong></p>\r\n\r\n<p>Any contests, sweepstakes or other promotions (collectively, &ldquo;Promotions&rdquo;) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.</p>\r\n\r\n<p>5. <strong>Subscriptions</strong></p>\r\n\r\n<p>Some parts of Service are billed on a subscription basis (&quot;Subscription(s)&quot;). You will be billed in advance on a recurring and periodic basis (&quot;Billing Cycle&quot;). Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.</p>\r\n\r\n<p>At the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or Repair it now cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting repairitnowin@gmail.com customer support team.</p>\r\n\r\n<p>A valid payment method is required to process the payment for your subscription. You shall provide Repair it now with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize Repair it now to charge all Subscription fees incurred through your account to any such payment instruments.</p>\r\n\r\n<p>Should automatic billing fail to occur for any reason, Repair it now reserves the right to terminate your access to the Service with immediate effect.</p>\r\n\r\n<p>6. <strong>Free Trial</strong></p>\r\n\r\n<p>Repair it now may, at its sole discretion, offer a Subscription with a free trial for a limited period of time (&quot;Free Trial&quot;).</p>\r\n\r\n<p>You may be required to enter your billing information in order to sign up for Free Trial.</p>\r\n\r\n<p>If you do enter your billing information when signing up for Free Trial, you will not be charged by Repair it now until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.</p>\r\n\r\n<p>At any time and without notice, Repair it now reserves the right to (i) modify Terms of Service of Free Trial offer, or (ii) cancel such Free Trial offer.</p>\r\n\r\n<p>7. <strong>Fee Changes</strong></p>\r\n\r\n<p>Repair it now, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.</p>\r\n\r\n<p>Repair it now will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.</p>\r\n\r\n<p>Your continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.</p>\r\n\r\n<p>8. <strong>Refunds</strong></p>\r\n\r\n<p>We issue refunds for Contracts within <strong>0 days</strong> of the original purchase of the Contract.</p>\r\n\r\n<p>9. <strong>Content</strong></p>\r\n\r\n<p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (&ldquo;Content&rdquo;). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.</p>\r\n\r\n<p>By posting Content on or through Service, You represent and warrant that: (i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms, and (ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.</p>\r\n\r\n<p>You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.</p>\r\n\r\n<p>Repair it now has the right but not the obligation to monitor and edit all Content provided by users.</p>\r\n\r\n<p>In addition, Content found on or through this Service are the property of Repair it now or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.</p>\r\n\r\n<p>10. <strong>Prohibited Uses</strong></p>\r\n\r\n<p>You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:</p>\r\n\r\n<p>0.1. In any way that violates any applicable national or international law or regulation.</p>\r\n\r\n<p>0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.</p>\r\n\r\n<p>0.3. To transmit, or procure the sending of, any advertising or promotional material, including any &ldquo;junk mail&rdquo;, &ldquo;chain letter,&rdquo; &ldquo;spam,&rdquo; or any other similar solicitation.</p>\r\n\r\n<p>0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.</p>\r\n\r\n<p>0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.</p>\r\n\r\n<p>0.6. To engage in any other conduct that restricts or inhibits anyone&rsquo;s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.</p>\r\n\r\n<p>Additionally, you agree not to:</p>\r\n\r\n<p>0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party&rsquo;s use of Service, including their ability to engage in real time activities through Service.</p>\r\n\r\n<p>0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.</p>\r\n\r\n<p>0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.</p>\r\n\r\n<p>0.4. Use any device, software, or routine that interferes with the proper working of Service.</p>\r\n\r\n<p>0.5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.</p>\r\n\r\n<p>0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.</p>\r\n\r\n<p>0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.</p>\r\n\r\n<p>0.8. Take any action that may damage or falsify Company rating.</p>\r\n\r\n<p>0.9. Otherwise attempt to interfere with the proper working of Service.</p>\r\n\r\n<p>11. <strong>Analytics</strong></p>\r\n\r\n<p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p>\r\n\r\n<p>12. <strong>No Use By Minors</strong></p>\r\n\r\n<p>Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.</p>\r\n\r\n<p>13. <strong>Accounts</strong></p>\r\n\r\n<p>When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.</p>\r\n\r\n<p>You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.</p>\r\n\r\n<p>You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.</p>\r\n\r\n<p>We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.</p>\r\n\r\n<p>14. <strong>Intellectual Property</strong></p>\r\n\r\n<p>Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of Repair it now and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of Repair it now.</p>\r\n\r\n<p>15. <strong>Copyright Policy</strong></p>\r\n\r\n<p>We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (&ldquo;Infringement&rdquo;) of any person or entity.</p>\r\n\r\n<p>If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to repairitnowin@gmail.com, with the subject line: &ldquo;Copyright Infringement&rdquo; and include in your claim a detailed description of the alleged Infringement as detailed below, under &ldquo;DMCA Notice and Procedure for Copyright Infringement Claims&rdquo;</p>\r\n\r\n<p>You may be held accountable for damages (including costs and attorneys&rsquo; fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.</p>\r\n\r\n<p>16. <strong>DMCA Notice and Procedure for Copyright Infringement Claims</strong></p>\r\n\r\n<p>You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):</p>\r\n\r\n<p>0.1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright&rsquo;s interest;</p>\r\n\r\n<p>0.2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;</p>\r\n\r\n<p>0.3. identification of the URL or other specific location on Service where the material that you claim is infringing is located;</p>\r\n\r\n<p>0.4. your address, telephone number, and email address;</p>\r\n\r\n<p>0.5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;</p>\r\n\r\n<p>0.6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner&rsquo;s behalf.</p>\r\n\r\n<p>You can contact our Copyright Agent via email at repairitnowin@gmail.com.</p>\r\n\r\n<p>17. <strong>Error Reporting and Feedback</strong></p>\r\n\r\n<p>You may provide us either directly at repairitnowin@gmail.com or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (&ldquo;Feedback&rdquo;). You acknowledge and agree that: (i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback; (ii) Company may have development ideas similar to the Feedback; (iii) Feedback does not contain confidential information or proprietary information from you or any third party; and (iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.</p>\r\n\r\n<p>18. <strong>Links To Other Web Sites</strong></p>\r\n\r\n<p>Our Service may contain links to third party web sites or services that are not owned or controlled by Repair it now.</p>\r\n\r\n<p>Repair it now has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.</p>\r\n\r\n<p>For example, the outlined Terms of Service have been created using <a href=\"https://policymaker.io/\">PolicyMaker.io</a>, a free web application for generating high-quality legal documents. PolicyMaker&rsquo;s <a href=\"https://policymaker.io/terms-and-conditions/\">free Terms and Conditions generator</a> is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.</p>\r\n\r\n<p>YOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.</p>\r\n\r\n<p>WE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.</p>\r\n\r\n<p>19. <strong>Disclaimer Of Warranty</strong></p>\r\n\r\n<p>THESE SERVICES ARE PROVIDED BY COMPANY ON AN &ldquo;AS IS&rdquo; AND &ldquo;AS AVAILABLE&rdquo; BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.</p>\r\n\r\n<p>NEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.</p>\r\n\r\n<p>COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.</p>\r\n\r\n<p>THE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.</p>\r\n\r\n<p>20. <strong>Limitation Of Liability</strong></p>\r\n\r\n<p>EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS&rsquo; FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.</p>\r\n\r\n<p>21. <strong>Termination</strong></p>\r\n\r\n<p>We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.</p>\r\n\r\n<p>If you wish to terminate your account, you may simply discontinue using Service.</p>\r\n\r\n<p>All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.</p>\r\n\r\n<p>22. <strong>Governing Law</strong></p>\r\n\r\n<p>These Terms shall be governed and construed in accordance with the laws of India, which governing law applies to agreement without regard to its conflict of law provisions.</p>\r\n\r\n<p>Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.</p>\r\n\r\n<p>23. <strong>Changes To Service</strong></p>\r\n\r\n<p>We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.</p>\r\n\r\n<p>24. <strong>Amendments To Terms</strong></p>\r\n\r\n<p>We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.</p>\r\n\r\n<p>Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.</p>\r\n\r\n<p>By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.</p>\r\n\r\n<p>25. <strong>Waiver And Severability</strong></p>\r\n\r\n<p>No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.</p>\r\n\r\n<p>If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.</p>\r\n\r\n<p>26. <strong>Acknowledgement</strong></p>\r\n\r\n<p>BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.</p>\r\n\r\n<p>27. <strong>Contact Us</strong></p>\r\n\r\n<p>Please send your feedback, comments, requests for technical support by email: <strong>repairitnowin@gmail.com</strong>.</p>\r\n\r\n<p>These <a href=\"https://policymaker.io/terms-conditions/\">Terms and Conditions</a> were created for <strong>www.repairitnow.in</strong> by <a href=\"https://policymaker.io\">PolicyMaker.io</a> on 2020-05-22.</p>\r\n'),
(5, 'cancel', '<p>Cancelation policy</p>\r\n\r\n<p>A customer may cancel a product with a recurring billing subscription at any time. A cancellation means that no future payments are charged to the customer&#39;s account. The cancellation of a recurring billing product does not generate a refund - it will only stop any future payments.<br />\r\n<br />\r\n&nbsp;</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('BRAINTREE','CASH','CARD','PAYPAL','PAYPAL-ADAPTIVE','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('INSTANT','NORMAL') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NORMAL',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrcode_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referral_unique_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referal_count` mediumint(9) NOT NULL DEFAULT '0',
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `user_type`, `email`, `gender`, `country_code`, `mobile`, `password`, `picture`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `rating`, `otp`, `language`, `qrcode_url`, `referral_unique_id`, `referal_count`, `trial_ends_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Vinothkumar ', 'M', 'CASH', 'NORMAL', 'vinoth8mech@gmail.com', 'MALE', '+91', '8122814482', '$2y$10$.8/wc/byUELRr9/9RFSeXeu8gi4zHx75Z8KQ4I93SokW.n1j03CQe', NULL, 'epeZi1OEBiI:APA91bEIfT-LgNXjLOwSRy3m7_-qCJDrPHWa6rx48_iOhSt6Fyu3XbOkvidWiI-mqp-1UI8N0HNpnFVZlJzw01awqHCPBMdagPHzUFhq2yQB9dCzQxGxCa0eU65x0g0dCeVrmEpH5rcS', 'c5dac8e91b3fafa5', 'android', 'manual', NULL, 11.11174720, 77.32149390, NULL, 0.00, '5.00', 0, NULL, 'uploads/1589707533997025838_8122814482.png', '354D4A', 0, NULL, NULL, '2020-05-17 12:25:33', '2020-05-21 05:32:48'),
(10, 'Prabha', 'P', 'CASH', 'NORMAL', 'prabharathi72@gmail.com', 'MALE', '+91', '9843044956', '$2y$10$41aZL80mr7LGfj5uuqgDiuIPMx3g26ZMKR9MK1WkTl/.C1EV4osJy', NULL, 'fNjy9ecKWvs:APA91bEmzRr3kvuLNTkG2Lgl_ZSZVQ5BIyT2xTyzFiDuJy-1YBErr_EmU2CySmLWRBq0gSH2M9tRNnSvbCBll-U9mA9S3UuCWL84_ZKZpqBbLBBSML8MsPRqv4-IiQF7MaHcvplyVwlT', '228ba5e93e081be1', 'android', 'manual', NULL, 11.04484280, 76.94894390, NULL, 0.00, '5.00', 0, NULL, 'uploads/15898573681364956868_9843044956.png', '69E995', 0, NULL, NULL, '2020-05-19 06:02:48', '2020-05-19 06:30:33'),
(12, 'Surya ', 'Uthayakumar', 'CASH', 'NORMAL', 'suryauthayakumar27@gmail.com', 'MALE', '', '9791785161', '$2y$10$53wErzeavCyDu.YrqbyBJuryLWtjE3FyzzOQpBGtyg9RAH7YgqMu.', 'user/profile/uv9Q8O8Qfp7yyVYE6wCHu4fBFrox4s7bar5zheoP.jpeg', 'eORfvdA7RHA:APA91bFISozZ0o23OM38l8ARowHAeB1-mJNInKkCJSlgpZxJFb1K9z4Ip00hhmavuUDdRO-aDNeXqT3PDkUZUi5mK95Y6aDTpiZzOm335z6WHmY_i7m-KiDsQmkqrV8CvQLfM6QtsGM5', 'f6e909f47484357b', 'android', 'manual', NULL, 11.11202200, 77.34282790, NULL, 0.00, '5.00', 0, NULL, 'uploads/15900425712106147301_9791785161.png', 'BBFE3D', 0, NULL, NULL, '2020-05-20 19:35:31', '2020-05-26 09:12:18'),
(13, 'Sam', 'Paul', 'CASH', 'NORMAL', 'spearthesam@gmail.com', 'MALE', '+91', '8220661227', '$2y$10$I4incLzrVrDarXu/icCbnONIj8hNbie5wHSFUf6lDzqZHwgdsJNQy', NULL, 'eujs3S3myDM:APA91bG2_5u8_V9L74-KdGo8aLa_Bg4j2MS-c3pH34QoarvPT2lN47ekD5LkNb5KH5q5RzldtJ57d73mZD0XM18B6s5sK_T--347GET_InpqzE4vBqGxh-XHUZWxd3dHpXa8xHeol8pq', '49d9ed2e371c56e2', 'android', 'manual', NULL, 11.11205370, 77.34277210, NULL, 0.00, '5.00', 130715, NULL, 'uploads/15900390781269968949_8220661227.png', '481C3D', 0, NULL, NULL, '2020-05-21 08:31:18', '2020-09-30 20:11:06'),
(14, 'Sownder', 'Kumar', 'CASH', 'NORMAL', 'sownderkumar@gmail.com', 'MALE', '+91', '7708365446', '$2y$10$1m9HCsW8SfTFWz5iAqNK9OXDcjxiVARqXqXsIjRCfdciKRhSAtzQO', NULL, 'cMcaVU56hSU:APA91bEPK3vhlJMwJ1dcCLjyxIrVq9CtxurUbYpscsi5hxFlv8ElPO916-pW6ugH6z2PKG60pm8HVtIDlLnr8Sy4EaMgcoJxopovBBoJg04pEsWmxjf7T1a1cxqbBynGr5Tu3rC3fzDQ', '6ede3b2c9ae32eb0', 'android', 'manual', NULL, 11.12019490, 77.33553970, NULL, 0.00, '5.00', 0, NULL, 'uploads/15900411781297515136_7708365446.png', '349B25', 0, NULL, NULL, '2020-05-21 09:06:18', '2020-06-08 12:43:19'),
(15, 'Dinesh', 'S', 'CASH', 'NORMAL', 'Dinesh.s7708@gmail.com', 'MALE', '+91', '9843038375', '$2y$10$CRRBL9LB0Ul4dzyA59XEzew/.n6sKRNZtOPnKMYMNhzinBrDgeaVW', NULL, 'f6IjNMeGVtg:APA91bGP3cUaJD9Mtk0MtCLuLDIGM6S0TkSbBpy2lkXk2qtUEeEMPBJ5pZeeZWOYLpirkhvHLY_ph2wXYSGiydcTHcczxALiNGCzaNWKqZ4O0ihL1x9eiPqIC4zlePROLNU5z1e5xN8A', '390d45d13094cb85', 'android', 'manual', NULL, 11.11201290, 77.34288420, 'cus_HK7IDO4bvHp6mp', 0.00, '5.00', 343082, NULL, 'uploads/159099221124789805_9843038375.png', '86EEF7', 0, NULL, NULL, '2020-05-22 07:53:00', '2020-09-30 20:12:46'),
(16, 'Rajesh', 'Kannan', 'CASH', 'NORMAL', 'rajeshkannanrkr93@gmail.com', 'MALE', '+91', '8248326360', '$2y$10$mLUdunvEn//c.QKNi8dMy.IHE2v8egkDUQUSE0WWPrdVnTxJL7Use', NULL, 'f6qbgojTdBU:APA91bEEWRPl2wUZ-6ZAUTdbtn0f1nY0g7npy0D-K_IH4uMW8tpxGactbJbcZCLeN9XjWc9szRcZ17JTqJ3Q3sNr1KRdO7RdUON5sOvBjQkK2orpFsEJYM6-DhgQSxaf_Q6Ksktc2MNk', '2c1e0101f3870599', 'android', 'manual', NULL, 11.11283910, 77.34735800, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901248031993341181_8248326360.png', '6F88A6', 0, NULL, NULL, '2020-05-22 08:20:03', '2020-05-22 08:20:23'),
(17, 'Sudha', 'Haran', 'CASH', 'NORMAL', 'sudhaharan.grandfa@gmail.com', 'MALE', '+91', '7904935258', '$2y$10$tEB38hiU2LnwYsZ7eH/dT.toAvuIhoqKfnA3HaoCaGKpOUvzIrMi2', NULL, 'dRjVN7jU6Ko:APA91bEZfQo51P48QlPLPEy3NmqESuefensBeAWAH_u_oLZxF2P2TLpbNO8_IAGyLpV8ih4q0v8cZnGcC6fAIY1LjJrDf5b_49tsl-uIq0wV4jFZhe7_D7Wl189NzddYV0bvVl9KFmto', '6fbb0cb83d280eb6', 'android', 'manual', NULL, 11.02534170, 77.01440670, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590124899745086509_7904935258.png', 'B42C65', 0, NULL, NULL, '2020-05-22 08:21:39', '2020-05-22 08:23:36'),
(18, 'Arun', 'Kumar N', 'CASH', 'NORMAL', 'arunkumar.nnn@gmail.com', 'MALE', '+91', '9994374482', '$2y$10$nlr3qbIMYqm5HOygbZX9HOXsoMQgz/pI7C0A.CqWWQvXm97PCHXsm', NULL, 'fSrt3pfsfLY:APA91bHedzi41vLicfhN5nfZDDg2BkcDuucIl9hnbWySMpWk9WfM-YjB6IxfqcnOCFY9wTS8G0Ws7OdJf3U33cN-o9lBnAZ_lGr_UsTA4lHTjzuAYuqktNyCMVl0q-qdfbC2r8KsZQaI', 'e53b4ef5ce45ba3b', 'android', 'manual', NULL, 11.12196540, 77.31718610, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901250271184797200_9994374482.png', '5B5C2F', 0, NULL, NULL, '2020-05-22 08:23:47', '2020-05-22 08:24:34'),
(19, 'Yuva', 'Raj', 'CASH', 'NORMAL', 'yuvarajkee@gmail.com', 'MALE', '+91', '9698071342', '$2y$10$.pSpKHhdzDlq94CqM2D05eFtDyqD3hZyYTnbDQSXjX4g/18uK5jra', NULL, 'f6JPD-ELhC0:APA91bE4AoTuLjctQxPATee9MaYwg7rKYqnvM588xwJQevCiKioOevaf0AYVFHoTfIpnVtivTO22AdTLF-Ha8u5Q9uvYKFhlplhhmfhA7wrbI8rr8eXecyYCaxmzYl-Q_ru9CHTetC_T', 'f876b9ffe95137ef', 'android', 'manual', NULL, 11.11789430, 77.34374880, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901250901049172710_9698071342.png', '03873C', 0, NULL, NULL, '2020-05-22 08:24:50', '2020-05-22 08:27:15'),
(20, 'Raghu', 'Kacharagadla', 'CASH', 'NORMAL', 'kacharagadla@gmail.com', 'MALE', '+91', '8008911848', '$2y$10$jByh6iWo2MmaSC9n3Al39uKtctBlniwHJamqtrXZXzRkGbmMbX/s.', NULL, 'dmApuaLmmcY:APA91bH7pFwDLnK4CyhuICPv2punujiGGFek2uU7GeJJ8sdTbN851ugYZ8j86lcESzt_md7czKEgKJciMK6XjQKowUZwyIMZpAAzOB2L86zGEINOk4ImrYU0M25QoEGXj1Mm3ff2lDcm', '41a62c48d2d77662', 'android', 'manual', NULL, 11.14149140, 77.34410770, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590126068117251110_8008911848.png', '12EFC9', 0, NULL, NULL, '2020-05-22 08:41:08', '2020-05-25 19:36:00'),
(21, 'Mithun', 'Kumar', 'CASH', 'NORMAL', 'mithunganesan@gmail.com', 'MALE', '+91', '9994966005', '$2y$10$reP/CNHcli8fn4M2WlSjP.pujiK0FQb5NS9Xnh5jqI/LVlTCNbkXC', NULL, 'eP7krR3xHoQ:APA91bHHGuFRoReJOB3eKnJkKZdZOOZWz8iPX1tdU_YzMeV9k7QwaKwGqhc0aW1TDBcN3-Kv5PzuINCSt-1ACGzdq7ya4aDhiGR2RTY8NNlfgkY6CeTn8Fttil4___P54fUocyyrRLSr', 'f7a91890319849c4', 'android', 'manual', NULL, 11.13219380, 77.32705220, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901294701457859196_9994966005.png', '7B689A', 0, NULL, NULL, '2020-05-22 09:37:51', '2020-05-22 09:38:33'),
(22, 'Naveen', 'Kumar', 'CASH', 'NORMAL', 'naveendkumar19@outlook.com', 'MALE', '+91', '8428416733', '$2y$10$KioXJi.nw9Tsqh6FXG81t.oRQHECkF1/OImsqDt.LxiM5R4fe4RPS', NULL, 'f0qhBURisfE:APA91bFGRTQFBaLgPLjfPYhtVWE49gpc5NqniPtyHlq64cuRdEZvwIVm8nP9EJmRH4bNH_XYgoDyV5tba--NY7Hg9RmzTmsJLH2b4CEV_XD5IP-8lCRPMm1Yd5-jtDp8h3-Xp-TCWoEa', '9cd173a1340b4674', 'android', 'manual', NULL, 11.08924180, 77.32702020, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901297381298939892_8428416733.png', 'BD7C44', 0, NULL, NULL, '2020-05-22 09:42:18', '2020-05-27 14:18:55'),
(23, 'Ram ', 'Santhosh', 'CASH', 'NORMAL', 'ramsanthosh2001@gmail.com', 'MALE', '+91', '9944717545', '$2y$10$PE5R/rogkZtE3gX98LqmM.6N4dpRiidD3LdwzGecIvdTRX2rgg/9G', NULL, 'c4nJf4v3_n8:APA91bE_tEN5cByYt9AhHWFmUk81d3nSce5H2Tg2w78A9nvFxk-y8fNWMKuD6WCqAB_NoChvTRCpF2sI5fVwbKTf-ZJy5L3iq7Z73T-UUn5rP5VCBJNVwht-r9VIvbC3nOn7cPMGrWMG', '3426d66a82304c5c', 'android', 'manual', NULL, 10.93958650, 77.41695320, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901303971470447683_9944717545.png', '8C63C1', 0, NULL, NULL, '2020-05-22 09:53:17', '2020-06-08 08:24:01'),
(24, 'Gokul', 'Raj', 'CASH', 'NORMAL', 'gokuls4096@gmail.com', 'MALE', '+91', '8072124202', '$2y$10$6TUmfpl4Jr1J.1yM5JnSaONdx0uC2d7/1Hpy9o6LoLCJACkoz20oy', NULL, 'd4q3kn-pcM0:APA91bFCHwKOF1Uk9MYbWEt-tpOHnCUL-Bp42UqXGH3uHA8kx7T2oS4Iyc7gcAD0R5es7eyN8g6XOGg0O290whiTsUtRF5bij3jy3Z1Yf6lmL2KEDoKPdO6gkIk6lJpu6-GANxMpsreZ', '915c44db5830cca9', 'android', 'manual', NULL, 11.11203890, 77.34277470, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901310781292632305_8072124202.png', '7E68EC', 0, NULL, NULL, '2020-05-22 10:04:38', '2020-06-04 15:07:45'),
(25, 'Thamaraiselvan', 'Boopathi', 'CASH', 'NORMAL', 'selvan250495@gmail.com', 'MALE', '+91', '9994149751', '$2y$10$3DBavb4Fb/qyRj.eUmNB2e7TxaZBJpmpgFkZ60FEuMS/Uz5448K42', NULL, 'fHbteSR2wQs:APA91bGv6SchYO1SHz2QPT5hQiZHXAFifveJAAee0WRCQtcfiASD-vDcL7JNj_95g3WZSF-o2Oor4eKxs46H7uUT5J0aUq2AxN28MlkA9SsGT50LmLiYbJEBMt-42kUnW_RVCYt-evyv', '95d2263fcdd2e96c', 'android', 'manual', NULL, 11.12432030, 77.34465230, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901314061405945068_9994149751.png', 'A9D9E0', 0, NULL, NULL, '2020-05-22 10:10:06', '2020-06-06 11:46:45'),
(26, 'Raj', 'Kumar', 'CASH', 'NORMAL', 'bossrajkumar.rj@gmail.com', 'MALE', '+91', '6383665136', '$2y$10$T3/zMKT2XT6PPiI8mMUYAOFTFOEkNSwKUiMURAHq/waCagOpjgz3y', NULL, 'eGRzFXr4SmM:APA91bFz8aNaU3B_dkr92btanVgIe6TYYziOoplaps_NsO-ZXCM1vJw0-ddk1GqMzJXkfBys1emF44GK9TlE1fTEwRcZ_RhWmkLWVlHNtRkhaFZ3Ghhw1vSUAWaoBW5-enjm5ifTg6a8', 'b5f7d3b4ae1b8e02', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590131884676470567_6383665136.png', '68592F', 0, NULL, NULL, '2020-05-22 10:18:04', '2020-05-22 10:18:04'),
(27, 'Muthu', 'Pradeep', 'CASH', 'NORMAL', 'pradeeplakshmi97@gmail.com', 'MALE', '+91', '7094161308', '$2y$10$S7O5sLiuFo.Y5OQqbM/7kefquhonPa71dnXa3yZazk34bLx6NBpv.', NULL, 'eKKBwzvHcQQ:APA91bFbojNtHK81vEyxqoC83PRhdZQqidcwamKg02SCkLttb8JHM3yst9o-j3ZTv-eP6fbDSGAv2Z9ixO6ESOQJw3gwVq_-mzR8Rx3k1FGpX_vc1dFw0aSMp0jho1a16jBDlWzu6YN7', '26f36317a61c7902', 'android', 'manual', NULL, 11.11116790, 77.33753360, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590133677654763357_7094161308.png', '919272', 0, NULL, NULL, '2020-05-22 10:47:57', '2020-07-02 21:07:15'),
(28, 'Gokul', 'Subramanian ', 'CASH', 'NORMAL', 'gokugokul36@gmail.com', 'MALE', '+91', '9994428027', '$2y$10$vr3qhSrXpkpkhcyxxMppvOx4KLwj3dzZ4H3SRpjZ9FLVrGf1j/TXa', NULL, 'fY9xSngtIW0:APA91bFjrtHRyxu_8mB1isLUIDhhsdGCfrAa9hYtEfOVT77e59-glhDTJ1Xg75dXt-HMpkv6BxPN3Zhc1XJD4wjxq9rf2dqQNzKZ0fUkCtBLxnwWubfa5W7CZaE-U6riVlowThRMSCyu', '074a23359d811f0a', 'android', 'manual', NULL, 11.13371900, 77.30821080, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590140304291239586_9994428027.png', 'BCD06A', 0, NULL, NULL, '2020-05-22 12:38:24', '2020-05-22 12:45:26'),
(29, 'Nivetha', 'Eswaramurthy', 'CASH', 'NORMAL', 'nivs.1505@gmail.com', 'MALE', '+91', '9677418872', '$2y$10$JSQlBBxfgEtvXPoIWejcauYKPDyfXN52kdIruWQv/nbrSYv8jX.Xa', NULL, 'ef5jNRWMP14:APA91bHNDM1tWdviLnYkYZcETSROhEiWS4xzHI9_T-9SW2dSj2GveFR3MV4Ha8H6NIIgGqPGqIKszOz2z83ngr0lkjSXZtGy22KuzUT6Be9jv1uQ5wKw5q_QFXo1lBPvbTFYlK0HSDm-', 'abefc22815583341', 'android', 'manual', NULL, 11.11410930, 77.34050670, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901447111975246198_9677418872.png', 'D8F55C', 0, NULL, NULL, '2020-05-22 13:51:51', '2020-07-04 20:36:11'),
(30, 'John Pio', 'Xavi', 'CASH', 'NORMAL', 'xavijohnpio@gmail.com', 'MALE', '+91', '9500333833', '$2y$10$6ps.R2Lx/veQk0doJSCloOUYWTEwyoLK1psT5VPQLtZB0WWcSDzvG', NULL, 'dMCYG5R0B7A:APA91bGpZT-sO8IMMvC-vpVYN8mY9zCxESW-KWGbjl344XAPVGnzgVuFsOga4NRbxYWv1_CCdZNnyae9CkJTU7sp8uEEMGLwIXJqUpGRxvqDj76NmUuscwZk5vqlTfKzUn1muuQ3nvRO', 'e0ce2cfcd1a31bf7', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901468251284275470_9500333833.png', 'BCAF9C', 0, NULL, NULL, '2020-05-22 14:27:05', '2020-05-22 14:27:05'),
(31, 'Arjune ', 'S', 'CASH', 'NORMAL', 'arjuneselvam@gmail.com', 'MALE', '+91', '+9965539789', '$2y$10$Q50ns0tHli33PkDBUEWDLuLpYH6f1AhClcTNMh9hubZGvZwk8ddhq', NULL, 'fpe2isYbF3U:APA91bEweh2M44BkAhX_MdSlvCHoPU_JWHDD5yAjpKfFDYFUt8bspAGItltWvxxGPz-MuPe4VFufPi5161-q33OnIfcK9y_6SKjuLcXsvp5q_q8VrNS1C_2Fwr8mPSr_nUVbsypjBNHX', '481de83cc5c9f056', 'android', 'manual', NULL, 11.14462030, 77.30426000, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590152536838517453_+9965539789.png', 'EDFB52', 0, NULL, NULL, '2020-05-22 16:02:16', '2020-05-22 16:03:53'),
(32, 'Dharan', 'kumar', 'CASH', 'NORMAL', 'dharaah@gmail.com', 'MALE', '+91', '9003841860', '$2y$10$uQhLuOWpnAJ3K7QITVbteOpkRpIiEXZSEsgKNcqu0DajGS5UnSFvW', NULL, 'fBHajvNOMNM:APA91bHrACnXKSwbPyM5ep5jp14H2dawZx2DLpchyUD4SVqFuhR5cjUBhTeAwE6iDPBpOQ6jKJCW87DRuA1cjWH2Q6InQBrn034ABmjU9Buo6sdGnQoX3bvP1QMZYxdWwVTztotUi61I', 'fb2d2b9426e56a2a', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/159015394210031478_9003841860.png', 'D86F41', 0, NULL, NULL, '2020-05-22 16:25:42', '2020-05-22 16:25:42'),
(33, 'Saravanan', 'KDS', 'CASH', 'NORMAL', 'kdsaravanan2014@gmail.com', 'MALE', '+91', '7094508052', '$2y$10$mjiRAW2KtXzRQaXSpnM98e8TsHNfLijfJwM2mXWtZonFIR5B3nvIC', NULL, 'dVWX_kwGIuA:APA91bGbBw4K82I10G6H_JyNxUzXR0UHdVpKn7o7l_NTnvcttdCAuJuw6fv8uW6nPDDVLZ6foWNdh0pXoQkCvr5rqhJej3qJvLcYzu54CpMyPSEJHqlp4Pa8I8jdAKa-56LzFv943ajg', '47ff8cad0af45abc', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15901733041228457809_7094508052.png', '23980B', 0, NULL, NULL, '2020-05-22 21:48:24', '2020-05-22 21:48:24'),
(34, 'Ravikumar', 'Ravikumar', 'CASH', 'NORMAL', 'ravikumar198025a@gmail.com', 'MALE', '+91', '9952671517', '$2y$10$2DGQ6g7RXqNZ1F4v42OLduQkU./iUbggIxefloYANpoelsVeoXWiC', NULL, 'elIu7vTgtMs:APA91bE5WBxYylANFVZw5SSZJFHLLVK9PCevkeFIX7gNOaYTLIoPrX_QR3rIdRo5dxAr4FJJCiqe7prSQuG89b4vFCv14BXFX-yzb9PHFVjvNA7xUbNrJahF5mEZfo_8dRJ0WMIS_BpL', '963709fc41445619', 'android', 'manual', NULL, 11.10996860, 77.31655940, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590202142432569295_9952671517.png', 'C66221', 0, NULL, NULL, '2020-05-23 05:49:02', '2020-05-23 05:52:27'),
(35, 'Helan', 'Rani', 'CASH', 'NORMAL', 'helanjancy1981@gmail.com', 'MALE', '+91', '8667532967', '$2y$10$Ja2BYm3UqNEMy0qZ7KYI7eTJ3JE70sBt4QsCDxraUn7njRHGfR2vy', NULL, 'daWU1RE7r3U:APA91bHZM64zp2ya2CySyfGkWA4WUT23_R66d5VNBHuhuD-IOt1m02G5zuLDEoZ-flbPYCp28kwDiBW0ZWuZDhoEcpeBHhkbbS4DhLVWKs483qKKV2DGY58gIQwio0ozBa4-R2-hS4Si', '88435ae1eb5b0366', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590210232140880824_8667532967.png', 'DE30A9', 0, NULL, NULL, '2020-05-23 08:03:52', '2020-05-23 08:03:52'),
(37, 'vaishali', 'vaishu', 'CASH', 'NORMAL', 'vaishalimv95@gmail.com', 'MALE', '+91', '9360085328', '$2y$10$7LyUVwe2rkwC0BYdasybx.Sq26hO/i2g5hKGDi.H6tQrFZFHNvY3y', NULL, 'dKVal0hQ2GE:APA91bHYgxQrLKk7ybAgVCzDuyJ9mVsctbm6uANW6ThlyzGFF9P5rKV8XecZzgNmksSE1iasGqIAuUG9VjoMa3SPwFSGrxQkX3ROtKFxJyqrkagx9nCO9cIP8xLODdE5krCQ9S_vZxEF', '89691f5915d60b07', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590210569823133271_9360085328.png', '9FB0B2', 0, NULL, NULL, '2020-05-23 08:09:29', '2020-05-23 08:09:29'),
(38, 'Kokilam', 'R', 'CASH', 'NORMAL', 'kokilakshmanan9795@gmail.com', 'MALE', '+91', '9566469623', '$2y$10$jtNVVtKfGxBjKqVRragp9uPWZH9T0VW7mDIoT0evLGPF1Y2uJVxt.', NULL, 'eKCSYgOG1FY:APA91bFmIAgoAUY6DvKiyNGiIjmzGQW05cHLyPoWATnVgO8jQc7N7GMIScHdvZBcY3DzRA7JvG_-ZLGh1yhjwX2vGsigc3tp5E5U1qvnqM3gokXfx58unEALpJ3J8toF7IsDrnrSH8Jm', 'e497d2c9f5c68634', 'android', 'manual', NULL, 11.11198430, 77.34272340, NULL, 0.00, '5.00', 0, NULL, 'uploads/15902114481349090764_9566469623.png', '9CECAD', 0, NULL, NULL, '2020-05-23 08:24:08', '2020-06-06 10:26:58'),
(39, 'Sanjay', 'Seenivasan', 'CASH', 'NORMAL', 'sanjayseenivasan@gmail.com', 'MALE', '+91', '9025720163', '$2y$10$9x41WLSJDFgBGxS7TGWwX.1w.4bF4cvPwJkoTeML4f1bTIZ2BPy8i', NULL, 'ewWi8LYdXXU:APA91bGaGNIELosV3Gs75e4CwKNRJ8zGVcBSrmM9QIThC94B_P13zCH8o9S1_9X1oZF2iBWfLXuxogP5XPjku0sEpi0_3TQkKwzzqCroJG0Xdfqf5gw9b8X_CycRYO9z-G8BDyuAmb7e', '0b2a1c92dff7e885', 'android', 'manual', NULL, 11.11478480, 77.33585240, NULL, 0.00, '5.00', 0, NULL, 'uploads/15902116221830123669_9025720163.png', '680B95', 0, NULL, NULL, '2020-05-23 08:27:02', '2020-05-25 08:45:06'),
(40, 'Karthi Keyan', 'Karthi Keyan', 'CASH', 'NORMAL', 'karthikeyan@gmail.com', 'MALE', '+91', '9003880090', '$2y$10$rCMelCCa8n7m98Cp40qYlus4p4pQI.ywieCiouAMzQ1P5Tpjaewi.', NULL, 'dnTCyL3Tdag:APA91bHJM1C-n4BM5Ga1ZLkzY1UuH_Kib6Aan_1d6P7jvirN_Q_6lEyV7SqMioHbv8VdYvMz8pjLkHsJmycy1cOxTwXOHPEIDCQHBed-jTYsY7tJll9jryL1i05wsF6Ye_AgVuFNBx5v', '492368fedc38f38d', 'android', 'manual', NULL, 11.12805380, 77.31359600, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590212154296284488_9003880090.png', '1D4BFE', 0, NULL, NULL, '2020-05-23 08:35:54', '2020-05-23 08:57:59'),
(41, 'Sofia', 'Begam', 'CASH', 'NORMAL', 'sofia1989@gmail.com', 'MALE', '+91', '9952523380', '$2y$10$paQ7Fj78YhyD3ELiPBtqi.t40rMan44E2S4LOZGesU7lkm9oxrSIi', NULL, 'edxjqOQM3Dk:APA91bEOauLt4X5ttUvLtu8u7z5__bI0g_V_gpi3EKTToXnoV0sHcUT-ghEZEkXydC4VXY3XubYYJC8SkvIAYKrOQiUkOorhSbbTneU1rYnBuObrEf_dyPbT_fQnv2S71CE0DhuZw9Xd', '1afda99794068501', 'android', 'manual', NULL, 11.11204420, 77.34277550, NULL, 0.00, '5.00', 0, NULL, 'uploads/15902124512113397730_9952523380.png', 'F896F1', 0, NULL, NULL, '2020-05-23 08:40:51', '2020-06-05 12:00:33'),
(42, 'kanagaraj', 'm', 'CASH', 'NORMAL', 'kanagaraj.m11@gmail.com', 'MALE', '+91', '9994104904', '$2y$10$.bTxLwXf/4nQD/cnyLyMjuma.Uq6MxlNcYlM.Bg.7GFtauwg6iFxC', NULL, 'dKpxyXxC5Kg:APA91bGG7i0nisrEHDobW3AkFtzKq842Uz4aq2Au7tJLctTNQAjnt5awLH4EwGSuFh4hm3FtD9SAfA7qmpxHe_IaO3vhgPh3PEIiNPmhfKJQc2_Twz0Skq4n1zt3zMcIF1kQuN6QwBY6', 'a029767981a4ae0e', 'android', 'manual', NULL, 11.14501020, 77.35343910, NULL, 0.00, '5.00', 0, NULL, 'uploads/15902149141965002591_9994104904.png', 'BD7852', 0, NULL, NULL, '2020-05-23 09:21:54', '2020-05-23 09:22:47'),
(43, 'Vani', 'R', 'CASH', 'NORMAL', 'vanithavijirp@gmail.com', 'MALE', '+91', '9952217237', '$2y$10$fjqYvHOzIS7M4KE60Jw9YuDGTC.gCq63l4M4bf6AQvQF3Xge619qO', NULL, 'cEQGLN6ydQ8:APA91bEnW2CRypYajKfVGf_jY6e8ChVxHv1XuJZIu1MvJrFQg6W5trnI4Et6o7EEwBRyogpEREsHW8uNxd8Dc_Zjvobt3l3arEdAwy8F2FqcwZRChA-vY__KzPLy__s60GEGMcKmswT6', '7d3d897b94ba1b1d', 'android', 'manual', NULL, 11.04998810, 76.96868950, NULL, 0.00, '5.00', 272562, NULL, 'uploads/15902504322132753561_9952217237.png', '75FB23', 0, NULL, NULL, '2020-05-23 19:13:52', '2020-05-25 09:00:16'),
(44, 'KUMAR', 'C', 'CASH', 'NORMAL', 'kumarstmt2777@gmail.com', 'MALE', '+91', '9894738887', '$2y$10$zfwdRsU4YNdtODBtFT2RguHnEN/LlvMU5ru6vX4K2kvgDZiO2HxKS', NULL, 'eIMrbmM_LHY:APA91bEOMQE7_PcgorjAtbXpDoa-b7_b_U__TYHKncbZbRQrDp48-k2pdQxpIM_0_UMuX4v3p77cIwV_OgmbH32GHPaNfk5tXiGHw_WoV4Kv6nNXwSqMk97z2Ii2p_ZD4uuoaDWi6dj1', '1812180b7c70c53e', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590384534129953500_9894738887.png', '5FB2BE', 0, NULL, NULL, '2020-05-25 08:28:54', '2020-05-25 08:28:54'),
(45, 'Siva', 'Prakash', 'CASH', 'NORMAL', 'citysivaprakash@gmail.com', 'MALE', '+91', '9486641432', '$2y$10$cdCbjACsVjjWP3mb1J3a0.RUw/GXs7oiokhjEZ0TO0dLosUc0C1B.', NULL, 'fLp8G468NIs:APA91bF8acTCAAI2yZX5ieYq4ILnzNzcMfLmz6hVOsyy1owOuW1hXF3qkdZVwOQ_eZhBqbWwAFi9Teo0WolRVcDDviOkxzPb9zGQHxbKhQASLA9Wk9zPidzqkJCUAbzEnRQWo4ktr_Jv', '86aab1ce6b41c38a', 'android', 'manual', NULL, 11.09970150, 77.34121840, NULL, 0.00, '5.00', 0, NULL, 'uploads/15903869431043204435_9486641432.png', '90B57F', 0, NULL, NULL, '2020-05-25 09:09:03', '2020-05-25 09:11:12'),
(46, 'Jothimurugan', 'E', 'CASH', 'NORMAL', '99tshirts@gmail.com', 'MALE', '+91', '9894721624', '$2y$10$WXaJ4CEta7/vX0nBLL7QkuKfwJAFsaJ6aZRHkF/EfREMkbF3ty9vu', NULL, 'dDALOD-mKrM:APA91bHNnztjiyKRW_BTPcrNtuQWx3_tU6wAFT2408XdyA_5FdCo3djiwOL7ryP2idwzpJh9af43hK6v2Xq3-p8lZAPbwU_HmyGf32KtMYHwR5ilXDVM6KvoTzSliFZN-lb1b4Q4_BD7', '7d96c19adae0f708', 'android', 'manual', NULL, 11.11326170, 77.35470540, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590387270705949077_9894721624.png', 'CCA781', 0, NULL, NULL, '2020-05-25 09:14:30', '2020-05-25 09:19:20'),
(47, 'Amsaveni', 'Sekaran', 'CASH', 'NORMAL', 'amsa2705@gmail.com', 'MALE', '+91', '9842470534', '$2y$10$UGjobItxXBmrKPSnaH7h9.3BPS4CRIB1EfsBgkpLA7EXLGpbdeesi', NULL, 'fhQB2fiVpoo:APA91bGRlOqh32Td_Gqf0-BI4ladRx3G1mxp0B0mZw5-HfEr54O2pgWyYvURmP44q6dKWOHnJnVML9A1WRY5EC2p46X-6un5M1u7rPFHg6AGqdXrbL22IBrQ7XJH9nB4toQvpV4x3SCZ', '47760fbfa1d717e', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15904030671446844730_9842470534.png', '16B103', 0, NULL, NULL, '2020-05-25 13:37:48', '2020-05-25 13:37:48'),
(48, 'Tjm', 'Soundarraj', 'CASH', 'NORMAL', 'tjmsoundarraj1966@gmail.com', 'MALE', '+91', '9443738457', '$2y$10$.LmKGQGmWfLbtcGfYFjLyOJuwuQFy3xI0h9c9kDS4QjhmEaPfTl52', NULL, 'ckuppPt457s:APA91bG9U6JSQE1D6Xgw30Rfu5KqqMrZq5-et8qfGyqJu_rnVPo2l-45oQii4JuuHQzXVbikoQWjX4bzjgJETUPoWP2WWt8ruOpIOoIu7ujV44_tcNGzV7fh9KMzI4aBQpwPAYwT3nof', '86ea8bd0f983c0ba', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15904800701057739269_9443738457.png', 'DC76F5', 0, NULL, NULL, '2020-05-26 11:01:10', '2020-05-26 11:01:10'),
(49, 'Sathis', 'Kumar', 'CASH', 'NORMAL', 'sathishkumar80980@gmail.com', 'MALE', '+91', '8098060155', '$2y$10$bFKVkzp4L5Pp9TJnXSE/TupK2tjm7NV9p6tjMtBJz0o.Xf8gRjMo.', NULL, 'dkX0J0K6JeA:APA91bFM_A0baVVZOPEOUd3i7F7rdzPkMsoPR1pSH7mbDTqBUWs0GIPtzKCihjZuW1obu2YH9chnK0NKU5Nu0NTeeiMlURgvAVJCAmix4LWhLjLApHFuf0a-nGFNr5D7csNtF496seeC', '46d39397aa43e619', 'android', 'manual', NULL, 11.13550850, 77.32342820, NULL, 0.00, '5.00', 0, NULL, 'uploads/15905069121415904427_8098060155.png', '57F0C6', 0, NULL, NULL, '2020-05-26 18:28:32', '2020-05-30 13:57:28'),
(51, 'Acs', 'Acs', 'CASH', 'NORMAL', 'ac.satisha.kgl@gmail.com', 'MALE', '+91', '9843238375', '$2y$10$ZonMK/V6Y4p8sCVJ0FI8p.PVESUXipNIFb.mb7u3SmspyYH34rfJm', NULL, 'fsCyi3FESUI:APA91bH5wuXXdCidyknHBYor4y2pI48MwjJ3fv-Mh2WLYiPPC9uX8oyc7xoetiUYO0Q9s-VTzUH7LLlJwKX51KIrQXGz7opqq_7N6ZTc2e9VdtFfVASLuSbbin0uA7pdtTZjrYNuKFIh', 'b741f09bfbf72426', 'android', 'manual', NULL, 11.11198730, 77.34282110, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590575731787083573_9843238375.png', '44AB17', 0, NULL, NULL, '2020-05-27 13:35:31', '2020-05-27 13:52:20'),
(52, 'mari', 'muthu', 'CASH', 'NORMAL', 'marim8645@gmail.com', 'MALE', '+91', '9942539291', '$2y$10$uAslS6SSE2QoSriFt45VSOwfn2MBjjv94xa3Jo1LSdIyWvFMYOy.2', NULL, 'eZnouREMI54:APA91bES35ue5HwPnhYQC4_oOCKKqcEnaxlqzpIvJMj1p1LTo1ejgefvBrvgv0UQFH4N8nrZytMAS0I6cL0Acu6i5xiWo55G1gqCGmBImdLecjdQwjWsNx0KmKtB7pxgOU43Jv7Je3PU', '24ad4e3c1eb6c0aa', 'android', 'manual', NULL, 11.10498494, 77.37719568, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590589531745361188_9942539291.png', 'A037F9', 0, NULL, NULL, '2020-05-27 17:25:31', '2020-05-28 18:25:45'),
(53, 'Dr Naveen', 'prasad', 'CASH', 'NORMAL', 'naveenprasad15@gmail.com', 'MALE', '+91', '9944688666', '$2y$10$FdhFOyPJ15g/6edLgs854uEkofOKbIs.6vpYJo3bRfPwVHSYW81Nq', NULL, 'czjHgBFH1Ak:APA91bGsMCI7fVL3zrdOM3v6RlV8BlREt1yxC23RGeC1spyuvbxQMuE8losMVT_VaTpPJsgRN4zXqGkEi6TDyPLyhUVrJla83W-7YSOXgzoq137UVEUXsbAUpVTT-aycsD3z_bRvwUwC', 'dc20e20a96289a53', 'android', 'manual', NULL, 11.11630130, 77.33923060, NULL, 0.00, '5.00', 0, NULL, 'uploads/15905949702064008653_9944688666.png', 'C138CF', 0, NULL, NULL, '2020-05-27 18:56:10', '2020-05-27 18:57:00'),
(54, 'Uma', 'Mahesh', 'CASH', 'NORMAL', 'scientistmahesh@gmail.com', 'MALE', '+91', '9551151595', '$2y$10$pwnqSA9Uo9I4X4EADeYnVuowa2YUrYRPyL98NHzlG0BUioWMOZ2UG', NULL, 'etDJ92ttN20:APA91bF7wpQfkz2J3vgPeVDEX6cguCgKAyT5WgOXgk05IQZakL-_fU-ZgQ-q3AXedPlInUiWus9KYhNfYBV9WhQJcAgLGYxfy15c_HZXfkbNe9YjIWqikyHadCu9lFsCLQGLT0h0BVo1', '46f980535bcec21b', 'android', 'manual', NULL, 12.91830380, 80.10398150, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590595838243353634_9551151595.png', 'B2BA4A', 0, NULL, NULL, '2020-05-27 19:10:38', '2020-05-27 19:12:18'),
(55, 'GOVINDARAJU ', 'P ', 'CASH', 'NORMAL', 'Jaytech1478@gmail.com', 'MALE', '+91', '9842251443', '$2y$10$kEjMA60Y8UxJr1Gym9889OklytoRJ6u6q3T3qNCNyM/1h7SUeG5Nu', NULL, 'f4YZka5Vrhk:APA91bHDi9yYRjqFydWO6mGbr7xpoXWX3ov1xYE9WZjVloXg5RJzDsqjOXDM4rji7E3uIhgGO_cREXHe4UaHs0CXiGeLRf5kYWKmfCqnMRy9EUDo7LXFX6loKDdxfesAkK-R-dQquwtN', '1a5c60649f36366f', 'android', 'manual', NULL, 11.04159260, 76.97096690, NULL, 0.00, '5.00', 0, NULL, 'uploads/15907167421467446214_9842251443.png', '5E9C1C', 0, NULL, NULL, '2020-05-29 04:45:42', '2020-05-29 04:52:04'),
(56, 'Kongu', 'Mohan', 'CASH', 'NORMAL', 'kongumohan8615@gmail.com', 'MALE', '+91', '9944438800', '$2y$10$b5wRiI13XAvgrzN2LvUSheVbKQFlYt5AsfS0104r7Nw/HxjmA8GFO', NULL, 'dl6YfeOgoCM:APA91bEF2pE_G710-9bgWxVYb4ITk9eoQZxKPunX5pRN4bYiqUTvhbSG8koIZ1kCJGXqX-35PKcbJICN0L3RJxgh8wQK1VTiodZJVg6XIoynLdOq5mzdS0fD3kJtktDWzftN-gCZ-kuv', '7257fef7c5acf857', 'android', 'manual', NULL, 10.83066110, 77.01776310, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590725364495598600_9944438800.png', 'B94DF0', 0, NULL, NULL, '2020-05-29 07:09:24', '2020-05-29 07:10:57'),
(57, 'Akash', 'Nandan', 'CASH', 'NORMAL', 'akashnandan95@gmail.com', 'MALE', '+91', '9943947044', '$2y$10$UhSfO4Lbr5hpqpo7IbMoDOTxmhQAiW/V4I32cZ1.xvtAWwpQGVbRG', NULL, 'fWLvE-kzbhk:APA91bH00CYEvRgMxQnlrg0yF9LMP3HlUaQJh5AgkYg6f3kCniiV3oHGk_IksLMiud_mCxiLsW5b5GEYa114fOJM4RwwI_KJDD6R0DGYkohR-aG1CsJeKIvRgYYkKSqCK0wPIQPZRF16', 'b9421c24e301ea8a', 'android', 'manual', NULL, 11.11494120, 77.33192920, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590737264971896059_9943947044.png', 'E6AD9A', 0, NULL, NULL, '2020-05-29 10:27:44', '2020-05-29 10:28:33'),
(58, 'Rajesh', 'M', 'CASH', 'NORMAL', 'www.rajesh413@gmail.com', 'MALE', '+91', '9842396744', '$2y$10$t0sRd341V2LQrNXoQlqikOfk.aGsxAXykC.qx3dRIzI6bmuQgf37e', NULL, 'dLmbK5iQEI8:APA91bGGEvMNtCMOrYD3NeKkcRyQjToyJKdWL219ZcleW3dii4pOq-aOBCpNczgZMHhAJOykgRbI0V7wX4qkKGfhhok9VG9bOZ_dFTB6NJHMIRDQtArethz74WeDhXs1xUFJ7O9AwrlH', 'b9c2dd4fd760522d', 'android', 'manual', NULL, 10.69006610, 77.02602310, NULL, 0.00, '5.00', 0, NULL, 'uploads/1590743339223893319_9842396744.png', 'B325C5', 0, NULL, NULL, '2020-05-29 12:08:59', '2020-05-29 12:10:47'),
(59, 'E', 'Srinivasan', 'CASH', 'NORMAL', 'vasanpowertechnologies@gmail.com', 'MALE', '+91', ' 70105 159577', '$2y$10$BbfK0wlcuRlBKKqVzsTRGOSE/pdrY1zOSr4B8Z4N4hU7O1rWgrlMe', NULL, 'd2IBPwcI0mQ:APA91bFCU_e3aDptVu6dy64HKJ3Gg9Fyc5lZkJ0JMPyEYq4Q2aB_WI5WRdGSGASYZyuQhgs3i2CqiQfRK95Vi8fiHJFDiavysmipWGsC_r65WbIQVs9exufFLWbKUrTZJLo2A7TGjmsr', '60646dc1ea20ebf2', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15908044611534161220_ 70105 159577.png', '9E05C6', 0, NULL, NULL, '2020-05-30 05:07:41', '2020-05-30 05:07:41'),
(60, 'Harish ', 'Mahendran ', 'CASH', 'NORMAL', 'meharish.2010@gmail.com', 'MALE', '+91', '7708621243', '$2y$10$jWW3kMmlqWNzhy7lVjB6g.HMEjgrvgIYsmg33GDzwS4vn4t8enoUW', NULL, 'cbaNze4Qu-Q:APA91bE-kg4bLctG5tk50hKeTjUcWFge5RRA-kX1vKQ3oRkb1XxE7X9WHIO1UZ3leejEq39Vd3aouu4WldNfStqdALMJqyFipUVul81jePacIjnXL0ra1I6YomArzQPRHJLfSJXX7fQn', '0e82c8fa6df9f7a6', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15909172301358614765_7708621243.png', '09C02C', 0, NULL, NULL, '2020-05-31 12:27:10', '2020-05-31 12:27:10'),
(61, 'Sathish', 'Kumar', 'CASH', 'NORMAL', 'sathishmyindia@gmail.com', 'MALE', '+91', '9789770721', '$2y$10$PXU.ZxZA5Mk1Y8E07YLhI.c5TcidMtYzGe7j9.MqlVLIKAyW.RwCy', NULL, 'dtZwrFlhVZY:APA91bHuI58pB8SP30GD1QCD-hlzLCW1nX31SLJMTXj0-4M6NxNyLaB-P7BeGrtgH-g6J_cMvL-EWNtL0YZM4U_M--KYLr27Yeapw_4Oq2S_VCYluV0jRS92H1cSejtqFAdW1wLMjD9L', '07184e986a3d715c', 'android', 'manual', NULL, 10.98182910, 77.28056270, NULL, 0.00, '5.00', 0, NULL, 'uploads/15910747261039757086_9789770721.png', '40A841', 0, NULL, NULL, '2020-06-02 08:12:06', '2020-06-02 08:35:39'),
(62, 'Rajesh', 'Palaniswamy', 'CASH', 'NORMAL', 'rtc.rajesh@gmail.com', 'MALE', '+91', '9843451911', '$2y$10$kpYM5irORK0Y5XUpKq9ZTONZSUghQmfeb4ezTJf/eAJTf2ztHLUd6', NULL, 'cz0onubFLkk:APA91bEYefKeoxiOKE7CWsAJxXhbnASdRHKi3Tk26_bbfJ4dkxE7cyTc9EKNkqP59zIDCei6mTSxGq0PHRjJ43Pn94kalVZPnNmMEXxXlTSa6MhfFxdqhOk5Us7xgdcuy4Z1Vms4MVi1', '5fee733c4acfe88d', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591076951802291537_9843451911.png', 'ACDA3A', 0, NULL, NULL, '2020-06-02 08:49:11', '2020-06-02 08:49:11'),
(63, 'Shiva', 'Ss', 'CASH', 'NORMAL', 'shiva27889@gmail.com', 'MALE', '+91', '9790185902', '$2y$10$2.u/JEpUS23lFB32Jaj2nOXmjMKyW7iXQTuf5fZVp3X5ZRVzQyJ1u', NULL, 'fAF6k-njLJ0:APA91bHxKly6a6gT8Fr0KzHNirbsJbP99MfMREbl_vK2iRQzlu8UrUfwYU-s-qZ1X_jCkqpPZBA7ttJd9mBBvnXAyRLugwueJ8M4CNSz2v6QzJbns_fkLpWaWwC1OjcjE4PW2z1G2C-7', '5227ee62c1b66c4a', 'android', 'manual', NULL, 10.96080150, 77.28168240, NULL, 0.00, '5.00', 0, NULL, 'uploads/15910914781342351688_9790185902.png', 'F7BD55', 0, NULL, NULL, '2020-06-02 12:51:18', '2020-06-02 12:52:27'),
(64, 'RAJA', 'POOMALLI', 'CASH', 'NORMAL', 'sksgarments02@gmail.com', 'MALE', '+91', '95858355222', '$2y$10$qKdcfncxpvZXCnstU3kH9e6lIMY.Un3CBT9KICyVU6Ct3lgzEgsD2', NULL, 'cQBj7Nw0mm8:APA91bH-6icg_UNJf-GyJLqQi3s-pFIRbANroTepUwUbvVBJeDgWEBoJx868vPe2H4U3yZ8qA5zATeF3wVMkbZ92n1G0akEbdu-pfsf1r6DbGEapWWEUaBejDkObywxi29jk0UmcGka_', '4f1e0aa314413e6d', 'android', 'manual', NULL, 11.13309140, 77.34231310, NULL, 0.00, '5.00', 0, NULL, 'uploads/15910917201963260723_95858355222.png', 'EDB2D6', 0, NULL, NULL, '2020-06-02 12:55:20', '2020-06-02 16:11:00'),
(65, 'Venkatachalapathy', 'Jeyaraman', 'CASH', 'NORMAL', 'nfavenkat@gmail.com', 'MALE', '+91', '9789466646', '$2y$10$wS4q7EFSURFfdqnGZhZ77uRCuleFj/VHuMZVLGkCL3znR900xl3sK', NULL, 'd-NakZwuo10:APA91bH1vhrdhLl7jX4KDg7AB6aLfpNGwhwk7iyYf5HXrtyW02scy-2nPuhZjnrqiC7P1vXTHlP5E1czFF-EP-4AZZJBc-U1vGwOaEqQ09_MrbozECTV6D9tuuKZozqOOnSLG9WPQGLB', '3d067232e288e29e', 'android', 'manual', NULL, 11.10193940, 77.36815240, NULL, 0.00, '5.00', 0, NULL, 'uploads/15910947582135048980_9789466646.png', 'A287DC', 0, NULL, NULL, '2020-06-02 13:45:58', '2020-06-02 14:12:45'),
(66, 'Raja', 'SA', 'CASH', 'NORMAL', 'amirtham.lingam@gmail.com', 'MALE', '+91', '8695899153', '$2y$10$7.jca29z6i0RqrJyp8c8oeFk12MMKa5tPaS11Q2nakIhomoFHqPqS', NULL, 'dlwJhkKWIbM:APA91bHuKxwUatBE3sCkfWEscoc5RtKsW099bPfnPXGsPNIOmjRWCaPPNGT6trJqM80LcLa2bDzJNUAgGrIID3BzgLrj3SHwY3zzsKzSo4QmopEcA75ufaYJNs3aMUlIyRkqpyX0bF0e', '73098c448c97ec59', 'android', 'manual', NULL, 11.09776460, 77.33252690, NULL, 0.00, '5.00', 0, NULL, 'uploads/15911466371007368260_8695899153.png', '917DB3', 0, NULL, NULL, '2020-06-03 04:10:38', '2020-06-03 04:13:50'),
(67, 'Santhosh', 'Kumar ', 'CASH', 'NORMAL', 'SANTHOSHSARANY@GMAIL.COM', 'MALE', '+91', '9952402248', '$2y$10$H0RvYKMhh3ZBkj5ssRyfmOH2f40rcqQmLLv2EJK1Q1XKEytP6vQb2', NULL, 'ddBVCNdRAkI:APA91bE53cHF4X9CCrkYmjk-TxAVaVjyiZ4P2YdMXJ_hvA_T_uzKkWavUYHZKTgaymBuvSjZjWmOLjkuF06u6biNqw7uFXLLyUwuOwfQ4QRPjS8GR5trxEuh8KimocfmqPlwu4IqpCg0', 'bac813749eeaf575', 'android', 'manual', NULL, 11.13191620, 77.33960000, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591165944623554018_9952402248.png', 'B674BC', 0, NULL, NULL, '2020-06-03 09:32:24', '2020-06-04 08:44:23'),
(68, 'Jayam', 'Garments ', 'CASH', 'NORMAL', 'prakashjayam25@gmail.com', 'MALE', '+91', '9943933305', '$2y$10$FVB0BgKxcgO6eiNsVqnk7eYe.zZZSf5sBzIxcsmp1VL8nmJ6j3FuK', NULL, 'fGjeILtjaTw:APA91bEt2k1ojelMHpKw8mA0SYWlVG0OgjkWfsaHAXBTACEM4fAQWlVxRhI0--mmqCPnoWh0M1KZg72cjlyog6qPhxgwgLsrwPAA6YS3DatWLrieVytW2REQ00cNA-q-OrFVeTmCxm5k', '949af609d7a68012', 'android', 'manual', NULL, 11.07427170, 77.36100310, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591199289785132658_9943933305.png', '012BCC', 0, NULL, NULL, '2020-06-03 18:48:09', '2020-06-03 19:05:03'),
(69, 'Vasu', 'Devan', 'CASH', 'NORMAL', 'aeongarments@outlook.com', 'MALE', '+91', '9843941111', '$2y$10$8HGdyReBw8KYdptzJkHiAelnO5FbshM1GdFDJDbrUwvruVCfiDRI.', NULL, 'fJycUqcfZdQ:APA91bHvUj8dLGl5_xnfaHF6_FNt-DnvLH17_51jc1Yvo_FNbMLOOtawsDkYKvlAbTtE9kc2us1Q5bpvSD6wjYsCSJWh54UxcOQNvBRNl_QJNZPKj9hIWKDTPoa5JFVMip0dNmNkgaJ8', 'cf66ebe851ccf173', 'android', 'manual', NULL, 11.11868990, 77.30907250, NULL, 0.00, '5.00', 0, NULL, 'uploads/15912544101946584194_9843941111.png', 'ABF075', 0, NULL, NULL, '2020-06-04 12:36:50', '2020-06-04 12:37:45'),
(70, 'Senthil', 'Kumar', 'CASH', 'NORMAL', 'maniyam@osg.net.in', 'MALE', '+91', '+919994900239', '$2y$10$gW7hxG2q3FfKCDeWQgU/deDgHBDvJFKEzPUFNPxggzBEkSs/3wKDy', NULL, 'eQ2bLtedrho:APA91bEgD2NjHLqmzEjpPLpxDpMR28fq3mfb4l3PFtd-bSgfcFR3Sc9MJRtT7tc13quIApHVOEKsNdg3NqwV1p8-2ISGOWu6k39dFWT1BiJnOUpBjVlUsrsIDmNceBuMoUvkHyEM0O4F', '7df3c2d6f3eb373d', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591257837718571656_+919994900239.png', '0C0942', 0, NULL, NULL, '2020-06-04 13:33:58', '2020-06-04 13:33:58'),
(71, 'Vivek', 'S', 'CASH', 'NORMAL', 'svivek2687@gmail.com', 'MALE', '+91', '+919600239627', '$2y$10$rciYj1Th8s/X9pl2XWNt.eK4fTqiQih/gfQVVD2Yt9o9ZH6WrLGOG', NULL, 'cXljwMDDjpI:APA91bGj0tjUxPIlRAPWHoHrJwrRGi2vfs-CX0Ag1-87k0Q0mCglwLplypDaotVOeqmjPfjVqTcx5coaaGxHMxfC3ZuUPpmm8R91SzEW4OwSdq9UJQF4VeD3-uUbotMr0NbUpabX4A0k', 'e435e9f1f39cacf8', 'android', 'manual', NULL, 11.11347190, 76.93275480, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591264744168767583_+919600239627.png', '6C29BB', 0, NULL, NULL, '2020-06-04 15:29:04', '2020-06-04 15:31:42'),
(72, 'Muthuraman', 'Raju', 'CASH', 'NORMAL', 'muthu@jaiguruprocess.com', 'MALE', '+91', '9843348999', '$2y$10$8WBgC9p0giI7fYoMR.CR.ultFGLJg80ljSnxiAADEmv2k76PV5ncq', NULL, 'fxwcxtZW4L8:APA91bEn29NVEv8vqeuwKTOHHI1OqnDPdwzE802EYbqBCfhcmk_lbzYdYV5eY1di7nw_IKzbSt_lk8ZllKhi9PzSAGMbb8-86f8mYZwNp2kx2REPikMNbQqnesO0PZK2G8DpaCQSkMce', 'fdfa64c29a2ac1cd', 'android', 'manual', NULL, 11.08906940, 77.33441660, NULL, 0.00, '5.00', 0, NULL, 'uploads/15913342911664717572_9843348999.png', '548255', 0, NULL, NULL, '2020-06-05 10:48:11', '2020-06-05 11:37:01'),
(73, 'Pradeep', 'Palanisamy', 'CASH', 'NORMAL', 'udhayamft@gmail.com', 'MALE', '+91', '9442165356', '$2y$10$T4NAqWEiCCaqzu9jV2Xzm.gpI.d3wpRJAS7xCpr7btsJQ9NUTYck6', NULL, 'dDjebseZMz8:APA91bF4X2Z02VpkqJb_PgXsUEOcG5HE-2y4AOa-wMa1Xni-G1iWaT65zvdE1xzxgrKky8dyyOQsQ0Jk2ywCQKFwo9izcbrFdVy_3iwSTp5m1rESwiZ4tOL_p7Z49O69IpX33_YFe-cW', '6b9253d29e62eafa', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591340819749826673_9442165356.png', '638568', 0, NULL, NULL, '2020-06-05 12:36:59', '2020-06-05 12:36:59'),
(74, 'Rameshkumar', 'R', 'CASH', 'NORMAL', 'rameshragulanu@gmail.com', 'MALE', '+91', '+919095733400', '$2y$10$XFFyyjEOBtNYGkcKUtAuAObCEErfYHUtdQ8UhWcnUfgs.Poq6WmJ.', NULL, 'epoblSftm64:APA91bFVgCoy___R1qyz1XLc5_AsGEtEHw_CFDjoeoMDE6eNttpXB3mXUOLnSxecSg2PqeHcHGTssZvuq6Lu9MwwYtrBi8fiuUII23iftPjzovUQoMntJ17IceVGkpnJjRc8YrH9auKq', '2754a000bf86a4da', 'android', 'manual', NULL, 10.96051320, 77.27876320, NULL, 0.00, '5.00', 0, NULL, 'uploads/15913623341335216644_+919095733400.png', '8D63D2', 0, NULL, NULL, '2020-06-05 18:35:34', '2020-06-05 18:36:10'),
(75, 'Ananda', 'Kumar', 'CASH', 'NORMAL', 'sindhuexport@gmail.com', 'MALE', '+91', '+919894696666', '$2y$10$nqe73fJzqXM9pWYcF3T9g.E0mj3AOuB9VVkqc0n6cB8QUxcFFfENK', NULL, 'dRFGORPTIcI:APA91bHdKB00qzolQ_yBpY_6lIo2oAuEOHlJfJiZ219Z2mTW9_ZchCchAOnLDnQpb3gaFQTdTW0AcD0ae8I1_79zL5dXeSvEjq-zYmjoev1u7aocDEiCXNo7z4p6-PXqPEC3cvLHyCXu', 'e8648fbc75281b27', 'android', 'manual', NULL, 11.06521100, 77.33885070, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591425474419142804_+919894696666.png', 'FC8193', 0, NULL, NULL, '2020-06-06 12:07:54', '2020-06-06 12:11:42'),
(76, 'Nandha', 'Kumar', 'CASH', 'NORMAL', 'nandha27785@gmail.com', 'MALE', '+91', '99764951237', '$2y$10$WMOkYmnCpuU431.rkhnnzOpIegq6dKvWMoW44QmX09GvQeFZrLrPy', NULL, 'e0OXQEXqm3Q:APA91bE4UJKFUfh0sZzjvICwW4-EtaWseRB9xfGilfHiKe2u583jpSEe_FW7TUpgRY-lLIQpggy9KT_yCP0xVf01MBMmc2khO_z7-qk019xaO5uc6nqsdkqPP5-w3F8Vz5IgaFD-Z9_K', 'eb4fbc8cdabab368', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1591600207764963157_99764951237.png', '811BFC', 0, NULL, NULL, '2020-06-08 12:40:07', '2020-06-08 12:40:07'),
(77, 'repekkal', 'sumathi', 'CASH', 'NORMAL', 'repayto@gmail.com', 'MALE', '+91', '9626183966', '$2y$10$GR7mCHRTzcRPydvonqDYZuhYP5ArTymptdK6dSukQHu4WRUOkJWx6', NULL, 'cAQToiL1lLs:APA91bHhUGuXljRcwz4A9wUO4OzjOsXAPytXXPrqiAU-DlWAYHiABqduGRxj7kYsQp3wpE2t7PHHS-0jtYr8_z8XenKwERNgFaq9IMJiiSjom0Kf0l3uSRmpZA2ojCgAO6JiCKbiRw9Y', '80dfcdb47f85a185', 'android', 'manual', NULL, 11.10072040, 77.38991610, NULL, 0.00, '5.00', 0, NULL, 'uploads/15916022831720466320_9626183966.png', '33D58D', 0, NULL, NULL, '2020-06-08 13:14:43', '2020-06-08 13:50:45'),
(78, 'Nadir ', 'shah ', 'CASH', 'NORMAL', 'nadirshah155@gmail.com', 'MALE', '+91', '9585386565', '$2y$10$JihU4mjISk8dXsFlhODY/upCARfcQonysdXNTaMilhxbWIn2hpxoO', NULL, 'fxpEPhs-IOs:APA91bH1ELR2GRbFTN9ltThPYqBk5_0H9vzF0_AJ3SlkBW5fhVHGsgFb0U33QORz8T7fHsrKa4NMc3Kd7X73E0i4wWc_lOcx-o-08kvIqztbRaVfvwGOIgpngCStulftaw1DEm9zpHOy', '750768a5c75aa898', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1592071705291606151_9585386565.png', '8CE0F5', 0, NULL, NULL, '2020-06-13 23:38:25', '2020-06-13 23:38:25'),
(79, 'KousiK', 'Thangavel', 'CASH', 'NORMAL', 'appuklight@gmail.com', 'MALE', '+91', '9629883355', '$2y$10$mrp45s9UNJL4IYR0Jm9.huX2t8z8on4rHXs/4MLTyBfPqJ4PrLxWC', NULL, 'eHZrkOe8JFo:APA91bGeUTaH-VoTgJHtm8AmLjOuHf1pcYRGi7G9JZQz0IX_8MpSoM6CIPhROzQOly4mVg-QGB1GJFz0Y1PBoCRPmoQ6lj_V7cvGr9qWa4zsbHSYZJ1nXnerwKREu89QQJl10CGQULi1', '9f549249040c16ba', 'android', 'manual', NULL, 11.14078250, 77.33363100, NULL, 0.00, '5.00', 0, NULL, 'uploads/15931504331976374387_9629883355.png', '864FF1', 0, NULL, NULL, '2020-06-26 11:17:14', '2020-07-15 06:28:23'),
(80, 'Gunasekaran', 'Muthuswamy', 'CASH', 'NORMAL', 'gunasekharan1962@gmail.com', 'MALE', '+91', '8946036267', '$2y$10$wXwwUBC.KpnfqIz8isMs.eJcYTqd/tPh7o6uUpvR82IEQYhc2XG5S', NULL, 'fJz27mzMrrQ:APA91bHxg0xf-08qMBnsP8GxR7OW9wi0yGJYtfuOCmANVosI9rYSXTsABrVvgp72ltT7eBVQX1m5QJXMfgyowD31G1WcyLAwjC16B93HeS1VA2PcSYm54hThtriZvcGBFMVgwAVBEk5n', 'c916b388accd1026', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1593151016311967109_8946036267.png', '23ED73', 0, NULL, NULL, '2020-06-26 11:26:56', '2020-06-26 11:26:56'),
(81, 'Mallikarjun', 'M', 'CASH', 'NORMAL', 'arjun672000@gmail.com', 'MALE', '+91', '9566626902', '$2y$10$.8gnIIcK2/WTi9VMSyDC4uXVJ0K.piYga1PkalSH8D42EfJkhmnju', NULL, 'dL9bkWDbW88:APA91bH7XfG1IgLPr59t-1da6b1iJzGyvZNty3VMgItFTEpupNdNXzwqXL5ET0PLIlUJ3qTC9wxcBuWco0VcnbbrmcinhGKBZkdGXrBhPh1gFNjOjPr1JQB2mIOCQlZKRAhB7q1E7UWk', 'b1dcf4bd0251f12e', 'android', 'manual', NULL, 11.11667120, 77.33298180, NULL, 0.00, '5.00', 0, NULL, 'uploads/15934137731537962596_9566626902.png', '985759', 0, NULL, NULL, '2020-06-29 12:26:13', '2020-06-29 12:27:14'),
(82, 'Sethu', 'Pathy', 'CASH', 'NORMAL', 'sethu.vr4@gmail.com', 'MALE', '+91', '7667503888', '$2y$10$XIIXHVN3U.wVjZFgtGTmb.cnxswoTdcwomTM1WY7LxDOzxkcEBXNi', NULL, 'f6oNFeHfQrg:APA91bFFAcVUzkR3obtSLQANTOQmNYHGyoWXuXR30_ZWf7zTYPIwQGZUoAVSgteCwG7uNBmHzqAmnqSC5ZksgFzxNOBfVrfUIdzaEIEJgy32eLwEz4-lxL7TLbnoe5AXNvLlC71AC0gh', 'c5d070b9758916a0', 'android', 'manual', NULL, 11.11205100, 77.34278440, NULL, 0.00, '5.00', 0, NULL, 'uploads/15936683341028252631_7667503888.png', 'B32E7B', 0, NULL, NULL, '2020-07-02 11:08:54', '2020-07-02 11:28:04'),
(83, 'Joseph', 'Anthonysamy', 'CASH', 'NORMAL', 'josephgenset@gmail.com', 'MALE', '+91', '9843088154', '$2y$10$TQ3CL7ipyq/yJcfB2ZFMNeU12egwOawwRv7cm5GEKQp1TrYXhuXWy', NULL, 'fnbW_q8lKts:APA91bHzQQjKnOjTfiPG-DFvRcMajG3H02HJHBtCfTgoLrGDfMp-F5C6AXzBEkGDAi2rD470WpEPAYEdxZ5vdSGkYj5HeeV4E4jEykev_iBzEoMexfpflY2zkaAAv71EaepHO5NkIPa-', '59f7b5821b8bd318', 'android', 'manual', NULL, 11.11208780, 77.34284570, NULL, 0.00, '5.00', 0, NULL, 'uploads/15936804731415050163_9843088154.png', '7D717C', 0, NULL, NULL, '2020-07-02 14:31:13', '2020-07-02 14:31:42'),
(84, 'Bhargavareddy', 'Aakhireddy', 'CASH', 'NORMAL', 'bhargavareddy45@gmail.com', 'MALE', '+91', '9010918781', '$2y$10$/Nu/YWTMap3miAHIwQr9Z.5Jwz47AajRcEO0qZMhUImjc6ZKJL/Yy', NULL, 'cmPR8Kkz0XE:APA91bEibKKOd6STMzDmOXMsdsBPLau36QmDwhwiIhccvsg1JHg8uxaDNssw5YE0gQTT_tr3qfE60Fk50QXEl31BvioBmuLOMXBAM-l-A6IWte6STGU7pCCi1GuXC6PMHyh_EZ8VdtNX', '3fbe36b81efad038', 'android', 'manual', NULL, 17.50664020, 78.46436020, NULL, 0.00, '5.00', 0, NULL, 'uploads/1593697696853276560_9010918781.png', '1FBF91', 0, NULL, NULL, '2020-07-02 19:18:16', '2020-07-02 19:19:47'),
(85, 'Thiru', 'Pathi', 'CASH', 'NORMAL', 'pandiselvi7787@gmail.com', 'MALE', '+91', '7558158864', '$2y$10$87rl.2eTTW3c01xd/08hYe1gGgeumvf.Ki3Gw/Mq9oUbaUeDkXjOe', NULL, 'cMG0gQnvs_o:APA91bE6rWgxuGNFphg1MX4EZRUzkksKJzLtALIs_hpI8rtJe1MEu7DkYcDb4GgyfFKrVMdet4tVqsphvSp7GMnh9aF-2c2DjyM7xL6eQ_pfKH_v2mVqjDLHkA2Uzl2WPl3HBB-2t7xQ', 'd9fe1ae11c7ea3c0', 'android', 'manual', NULL, 9.50732860, 77.62936350, NULL, 0.00, '5.00', 0, NULL, 'uploads/15953739921455408901_7558158864.png', '296007', 0, NULL, NULL, '2020-07-22 04:56:32', '2020-07-22 04:58:02'),
(86, 'mohd', 'Imran Siddiqui', 'CASH', 'NORMAL', 'Imrandkd@gmail.com', 'MALE', '+91', '9717177432', '$2y$10$hTv2ndCrHCf4l7sMGrkXVOmgDVfM1b6INbmIzc7dRtbfJsiSMPPsi', NULL, 'cPtu6wAodHA:APA91bH1NLedM-TMI_OpeATFrCZh8x9gz6TiOq9pf_qcKlSORWp6aaMgyRU0Pa3V2HqgW5sCXWZPSEtH21hLyX2ncDFI4ojj7S4dudYC3hAuBBfObPuDyVvk_0V6iRmKifHEBeibXFXq', 'ba736288af9c7566', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15954066691038152689_9717177432.png', '64470C', 0, NULL, NULL, '2020-07-22 14:01:09', '2020-07-22 14:01:09'),
(87, 'Sai', 'Kumar', 'CASH', 'NORMAL', 'saikumar9676681103@gmail.com', 'MALE', '+91', '8555908024', '$2y$10$gzNO7Mioqhdlin.IVvwLQuC4/aD0zpN8aNVXOPULBuzE4D4EEwTny', NULL, 'drLZM6m-zpw:APA91bHmKnPDuEclEuN6Ma3qpu36Am56gZ0NInbD53X4Z3g9GnOjColP2xeHl2TuvfkdQHu4aiT9cLc6-o7XJg_kiI2n_6mD5fBYUU6B2I3CQNDdheUG7jQDQhAWMa4TF3w6Z1A4XUQT', '4db96039d949e15f', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15955175111263455391_8555908024.png', 'DAE401', 0, NULL, NULL, '2020-07-23 20:48:31', '2020-07-23 20:48:31'),
(88, 'Akash', 'Yadav', 'CASH', 'NORMAL', 'akash@gmail.com', 'MALE', '+91', '9816685212', '$2y$10$Qqz4URGDRfkdkRAbciD4MuLs7qU9H5juVvaFI1a97gdF63kAQx03e', NULL, 'dWJVC9gJEWY:APA91bESSDjAKIh_FqitJES_QFqBC2CX3nC20EkwnkmJAZ_WxftdD_s513bDKWQcbmMMMuDNBPPrXuUSxhfZY5tRvHnxzeniaBhJmOcqBQG80ffFNohUGzto7o-N5Ov9j_ROMDGOD0Z-', '5231b7a40b8355a9', 'android', 'manual', NULL, 30.80943399, 76.89260696, NULL, 0.00, '5.00', 0, NULL, 'uploads/1596181174863017589_9816685212.png', 'CEE8E2', 0, NULL, NULL, '2020-07-31 13:09:34', '2020-07-31 19:35:03'),
(89, 'Mehul', 'bharadiya ', 'CASH', 'NORMAL', 'mehulgajjar0153@gmail.com', 'MALE', '+91', '9974934417', '$2y$10$ml.sHQQatO4f1qbhHOSE1uB1kbaBbovY/GYPuJnGcj5fRcsNobeRe', NULL, 'filb6e-hu0M:APA91bEJaRwAjVv9A2bpt8DRNKQGl9ZMQhfsYHu5i-ZR_eXlrbiboOTX2sTaEsOU_u7FLWGhNiuYpwVJqjgwC80faqvvTyRDMpr_XExowlHxZe78YztanzsMgISU3_-QZpVyDMeKm1hX', '1fb2d866b0194838', 'android', 'manual', NULL, 22.95415090, 72.59788350, NULL, 0.00, '5.00', 0, NULL, 'uploads/1596249624557297452_9974934417.png', 'F02D84', 0, NULL, NULL, '2020-08-01 08:10:24', '2020-08-01 08:13:10'),
(90, 'Rohit', 'Vishwakarma', 'CASH', 'NORMAL', 'rohit1995vish@gmail.com', 'MALE', '+91', '8237264215', '$2y$10$76THgF.5fIojFRUwAvNkiuZ0sv1s.niCd2vz4enFQpwX84c2UNCNu', NULL, 'e9DNZ4jujc8:APA91bGZBIKkKHjm-SXzBRJ5_JV3f66z5KK5Dlrkb-8PIhglvLkyIWTrGfsDwQUGQFeoXTdt8MR4UtnJR7G0WToQUnCj31gXhpEIpr1MNVGnZRrtD7zOLrwuz8Exrq5dY9y56c0gvg-j', '95b7c6a6bdb821b4', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1596869820498317414_8237264215.png', 'F7F6E6', 0, NULL, NULL, '2020-08-08 12:27:00', '2020-08-08 12:27:00'),
(91, 'Jatin', 'Gupta', 'CASH', 'NORMAL', 'jeetu.gupta1990@gmail.com', 'MALE', '+91', '8935066986', '$2y$10$1.Q1axrMT8LIwNaf54vF..ikZjf4I34GY0sxytxZAf8BrB/uSkY1i', NULL, 'fozhlFaAlK8:APA91bGyV7zCsdntghqRoYpCxWUT6I9EOjDDX1SaXe9UPWRDpWDw1tXjYokH0pZLeUK4YJ61TjZIBzIZk7A8pVVK-bGwJjVxxGwdqfxqM3Dcw5YZtlZ4mNAQK22-Db5NKhVbhhKqXsg5', '5984279ce1e5257f', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/15985489671750201742_8935066986.png', '53B0B9', 0, NULL, NULL, '2020-08-27 22:52:47', '2020-08-27 22:52:47'),
(92, 'MOHAMED', 'Imran', 'CASH', 'NORMAL', 'imrantpr@gmail.com', 'MALE', '+91', '8825257686', '$2y$10$72vrC55Vge7m2j3OYTHPcOzCTqcAzsZ9dP2dDbYjkW48JP7o9.Ba6', NULL, 'cs-0C4DIzQw:APA91bFkaF7E_CwUGk3GZBXL5ZxC_0ELWB6d-rZ06DC9dPkI-Sj5lYz8RnJCiOnlnf1oHpFUUieyWdxN319GgqxPO_MjTvhkO-MHe5L6LDM6CawVozmazl1huhsTx3TSp46zbjYniC2o', '5553be136f4cb790', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/159901512216687309_8825257686.png', '49DECD', 0, NULL, NULL, '2020-09-02 08:22:02', '2020-09-02 08:22:02'),
(93, 'PL', 'Sevu', 'CASH', 'NORMAL', 'plsevu@gmail.com', 'MALE', '+91', '9842297408', '$2y$10$IqqZ1WW3tfLnbhSnE.CY3un5Ach7hn7K/R3kVTp0MAwEUDAn9Bsva', NULL, 'eduVJHCVC1Q:APA91bHvsdmHMqoxQHlR4bs3G-muFr6C0SBlPZ5C9htOJG47NfraiVZZ1oWqOtgwS7FX15Lhm-kCpiXRmbquJjWAQNfyqSjIRzw1niDy3rWQzT4sgnly3kp7j2qwPKIgWjQGi4uKzRkx', '3f4e4c450b1fb40d', 'android', 'manual', NULL, 11.15531960, 77.30120560, NULL, 0.00, '5.00', 0, NULL, 'uploads/15999861581533653625_9842297408.png', '1DA6C8', 0, NULL, NULL, '2020-09-13 14:05:59', '2020-09-15 08:32:14'),
(94, 'Vikrant', 'Chauhan', 'CASH', 'NORMAL', 'palacevikrant@gmail.com', 'MALE', '+91', '9953773003', '$2y$10$zm9s6zdpKndto2gyTCSFa.GTmWY7V6.MuZzgSWuCZsV5.Vqz98YnG', NULL, 'fsYDEC-D6BM:APA91bEXgiX_GsDnF6YwDOuM3vqiteZfhQSwR20PufyeEsDbOXpBVlawF9BASBU9Pyzlu9BdZKIl6KPv3vzbekpZW3ZgBiMM5AnYTFBYy1IsSzE3qf05xAYYHo03RZb5FsFQ7ZxmWXqN', 'e4c010712c5f396d', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16007013112037750948_9953773003.png', 'BA0131', 0, NULL, NULL, '2020-09-21 20:45:11', '2020-09-21 20:45:11'),
(95, 'Shruti', 'Gupta', 'CASH', 'NORMAL', 'guptashruti17@gmail.com', 'MALE', '+91', '9711162478', '$2y$10$7kB8Xt.MNQRCqqLDRtVIpe0DDOpLWxxzmFEBYtQOnSeBJud8sslbS', NULL, 'enU7hO1va3U:APA91bGpt2eHjNugkFaJ4Dfw2v_gxMAK0zIa7Rd6mdEczpClwjE0cgBRqA4cWDfirmxxGLMbwAjFGe-17aG3gOw5C_G5067OiJCu_yIhDLKFsVnMhL1uapRVIaq_l55wIMTv0ov-xfv5', 'b785ce1c1ae76922', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16008481361413385179_9711162478.png', 'A80DE9', 0, NULL, NULL, '2020-09-23 13:32:16', '2020-09-23 13:32:16'),
(96, 'Subrahmanyamreddy', 'Venkatalingareddy', 'CASH', 'NORMAL', 'lvs1937@yahoo.com', 'MALE', '+91', '9959732464', '$2y$10$zP20sPQCgGPn.pvbM9hBm.y5ZHSNSwJCPZlH49.M7YhjGsU7u3pfi', NULL, 'cEpKaA164TU:APA91bGyYPRLqi4ciYuyDYYwNNkyLazsUKCDkzz8UQCUBKuq-kpjuZ_meX3g-N66T3WBGRO30xB3qXOs1BOa8_RfFPsQMoNj8AqBycnQOzdfKcSMEHJ5TR7tdHTe3lFmoBzB3hWjX-kC', '1246b79f98dbfdd0', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1601012210653994428_9959732464.png', '3FC706', 0, NULL, NULL, '2020-09-25 11:06:50', '2020-09-25 11:06:50'),
(97, 'Lala', 'Ram', 'CASH', 'NORMAL', 'lalaram97821888@gmail.com', 'MALE', '+91', '7976760832', '$2y$10$4GRGjOaJ0AhBFdNwXyJaIeMQAUpbfPtshn3fVeeOOdj.DaC20Nmtu', NULL, 'f8NgLf9ghzw:APA91bFLBEkRnr14AjwVTauBnfzdrCIJpOY25aIK_4YeavV9-_EOpC9Dmu1F0LCfGlZneVi_tulvJdWmt9ytYKkINRp9ZLUexp4g_FxPwPC3WhZo6zg1CgDLmslIiKfW9QCzHE84JQdx', 'ab58a799fdc9264a', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1601656529681427203_7976760832.png', '1C6833', 0, NULL, NULL, '2020-10-02 22:05:29', '2020-10-02 22:05:29'),
(98, 'Muthu', 'ArtG', 'CASH', 'NORMAL', 'muthusamy801@gmail.com', 'MALE', '+91', '7339471172', '$2y$10$oMJ/KS7YD0.Zv9SkTBSI6uvMVlvXj3f43bDkQgi.Y59dKEcHRnm1C', NULL, 'fU8GDXP76HI:APA91bETLS9Gd2MkpVohG0m2xleDqEwrLLlAyqx0FZrY7egzB1igrCPcL23WZ5YlLE831NK4jJHpzcgPZyDsecgRldPLKbr0ij5Dzrp4b17v1vQgb7wdsN_qBilfnyf0IyzO5Pt5NeoH', 'ba213af13e5af924', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16018814491149372369_7339471172.png', 'D1AC75', 0, NULL, NULL, '2020-10-05 12:34:09', '2020-10-05 12:34:09'),
(99, 'Mohammed', 'Akram', 'CASH', 'NORMAL', 'mohammedakram913@yahoo.com', 'MALE', '+91', '9398849501', '$2y$10$L3SoKNs70cPxZT0icmodpOBuDRbFcfDpeOGqfbq4yEXscdTA1lz7W', NULL, 'fKAr6k7CnUc:APA91bHdS75_alqRrgpZFGhxwltAyLNBmhNKctFIx65sgNNKpOpU1s4MF9Tq_-sTZtwgdZT0POwK2fO_63-eOT5H3gjt3_CkYkHWTEvPJHn1nYVLFcdFXtw2Cg9QyyCVbTXjzRMDqSj_', '902392b55e730e07', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16019803731450832290_9398849501.png', 'C8D43A', 0, NULL, NULL, '2020-10-06 16:02:53', '2020-10-06 16:02:53'),
(100, 'samim', 'laskar', 'CASH', 'NORMAL', 'sahimlaskar123@gmail.com', 'MALE', '+91', '8011939645', '$2y$10$b8nHszmDxF9HSTpIu0DxJO4urVdOVSuqBrmxOZ4.TI31loKmjA1sK', NULL, 'dOzO5PaUwME:APA91bE_I1PvfZTaFbbIrkM_fp2LJFp6uHNUUar2m_AhbI84R4SgDcgYUALnQgkY9ePdPitV6UImVJ07Mr4WwFfXk02uhja18d95mShi72mRYQ8xZVBFH1iZPTMvefPC7sfUjHAxeyek', '4d02739c7a3e72e7', 'android', 'manual', NULL, 12.86933060, 74.83255410, NULL, 0.00, '5.00', 0, NULL, 'uploads/16026591131479231371_8011939645.png', '93C03D', 0, NULL, NULL, '2020-10-14 12:35:13', '2020-10-14 12:37:59'),
(101, 'sowndarya', 'prabhu', 'CASH', 'NORMAL', 'sowndarya28121995@gmail.com', 'MALE', '+91', '8489385823', '$2y$10$HOiLCRdtI/0w1Nie/6wjIuHLDSsF8rWFyrlLVH7MoBnIfrUbPPayS', NULL, 'euss33lmnfk:APA91bEiIK9-CAhKITM9Ini2fLsIqCSR3m-7_ylDmuZlOcxbbYEMO1zy_DQJa_bS86msqNbtOeypIc90dsSisktynTEJEgacB6K37XFta8UgSVYC8XuBRg8vq8W1EYtaXGcACa2v0DdR', '33c93e832e404236', 'android', 'manual', NULL, 12.98342680, 80.22787680, NULL, 0.00, '5.00', 0, NULL, 'uploads/16026938491416918834_8489385823.png', '7CB148', 0, NULL, NULL, '2020-10-14 22:14:09', '2020-10-14 22:17:51'),
(102, 'Lalit', 'Gupta ', 'CASH', 'NORMAL', 'lalitgupta2216@gmail.com', 'MALE', '+91', '8527626526', '$2y$10$BEfPRaxrlI0fi2GgYTZy.u.VO73Ovr62NX1QR/Dpxl.HkqXro.jXW', NULL, 'cdJOyPFF6GI:APA91bEM5_ffeRg5I61NbOqGfLen6HWO54qeRymVVQGbX413ahV1s8rLRwPnwWh_jtUxuA2fP2EX3Np9I-ni0QIm2CW52MNYEILvYLE8rTMHQ1ZbReqG7LkFepdJrh5COvBd4aJ4x40B', '6fd1d181d513c85f', 'android', 'manual', NULL, 28.66400100, 77.39490140, NULL, 0.00, '5.00', 0, NULL, 'uploads/16036438252072405146_8527626526.png', 'D4B0E9', 0, NULL, NULL, '2020-10-25 22:07:05', '2020-10-25 22:08:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `user_type`, `email`, `gender`, `country_code`, `mobile`, `password`, `picture`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `rating`, `otp`, `language`, `qrcode_url`, `referral_unique_id`, `referal_count`, `trial_ends_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(103, 'Immanuel ', 'Gnanapaul ', 'CASH', 'NORMAL', 'immanuel.gnanapaul@bureauveritas.com', 'MALE', '+91', '9791777687', '$2y$10$vQf8U/w9AgpZhcLniC4cuOJHp3mxMp..ybMuX0xpOyU3iDklQAQIe', NULL, 'ddKqXNoohog:APA91bH8EIiF-rSRAg-OEUF7K8EpZ5cdoUyi4U_2_TJO9xSM3QzgWhifH0oCCclrZFbtekbh_FVfiml-8fNNhAHx3hOKCfwUEO4qYYRCjsTnR5Op4AZdrpOuS16nW_DcPIBiJwSO7dvz', '9b229e2cc92ceb7a', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16040742402101517977_9791777687.png', '4B44D6', 0, NULL, NULL, '2020-10-30 21:40:40', '2020-10-30 21:40:40'),
(104, 'Sujith ', 'Kumar', 'CASH', 'NORMAL', 'gomesjeeva@gmail.com', 'MALE', '+91', '9994671923', '$2y$10$tSAfuvFuMjKWhPRGv7hkCudIdtTKlJUHc0EbXzMSiJQfE2TJUn6Qa', NULL, 'dqfokB226gg:APA91bG-OwOb_OY3MiToBZu6PozYgBha7I4eG_n2YGHBrxMtxxlc-v3CaMd_AuamcEiD6kQBqrFPekIoN63xhe9fuRwh8bPAcntNqkBAqXB_1I0khPF_kWs3KRAfpSjvFV-0p-tqxL1T', '7d3a54d7a2baa87d', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1604415178975301518_9994671923.png', '129A26', 0, NULL, NULL, '2020-11-03 20:22:58', '2020-11-03 20:22:58'),
(105, 'Priyanka', 'Narang', 'CASH', 'NORMAL', 'priyankabajajdgp@gmail.com', 'MALE', '+91', '9775363459', '$2y$10$yTkhnduhOUeqOcC1aIBb8eLaIhbtwUiCunvPLWy1nvuzirfpWE1WG', NULL, 'cM5dbEQ4Jr0:APA91bFIuxPePp_BfSKrzqW_nyhZRaZvw9YubWNYdUGssNoaCTPGZAy8wtUbfJM3PARDwT7UFDwtrNtWZUhTaIq42go5NXU0BAeSYPc6TJEQNqLTVPj7m_dCGNj4b08ic-wVCGsh9CoB', '8cdc3b05395de5e2', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16047301191236071614_9775363459.png', 'A3F8EE', 0, NULL, NULL, '2020-11-07 11:51:59', '2020-11-07 11:51:59'),
(106, 'Barkath', 'Ali', 'CASH', 'NORMAL', 'barkathalioo31@gmail.com', 'MALE', '+91', '9739107295', '$2y$10$IReFRQqEYhqv5t9V7hFIjug9iSSK800948kh1zLqmt2HBvWKYLVHG', NULL, 'c85lyCMFwsA:APA91bGeYAk4MGdsNpyxxpcGfjApo-6ANOKy4d2--4I_s6yOrZyRvgk_wotq1h7DsdNjdtxjJlfZZCsMfLYLiw8xhjb2IkouS2EyXs0zhqNfODSQASqGKQg3O2w4P8mpk7AjEBVkq7yH', 'b198c95627387d5b', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/1605435393975418880_9739107295.png', 'EF110E', 0, NULL, NULL, '2020-11-15 15:46:34', '2020-11-15 15:46:34'),
(107, 'Mukesh', 'jangid', 'CASH', 'NORMAL', 'mukeshjangidjhadla@gmail.com', 'MALE', '+91', '+19929758545', '$2y$10$ugAJ7e7UVlBTfJB5YeBJ2uKk8.09KgaFKZb1cd8oxnwXmlJDnAcJK', NULL, 'fKDjT0F7gYw:APA91bESyrqFeOjWFu7CEnp2i3cnEQvjJ9OggZdunkyTpg5yrq_6U0iEHABigBWvyGKm9_3pxz_VCk6cXVGbcCYNmiYiWkIOUm38LtActMoigadCAdMaAZyAgRPGbDkFA4WttJo8G_RI', '3b09c9d12daf3c0d', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/16057812011327217603_+19929758545.png', 'C2F262', 0, NULL, NULL, '2020-11-19 15:50:01', '2020-11-19 15:50:01'),
(110, 'Edi', 'Rusyadi', 'CASH', 'NORMAL', 'manispulsa@gmail.com', 'MALE', '+62', '81316871590', '$2y$10$tDOJZIHWMecdD9HqWW5ePO669OrDH3vTFWN0b0.7tJgPEC.VkmjUq', NULL, 'daQeKJmAQiOmaPImI8MWAs:APA91bFZorDzzZfAoRX_nTnF3hO2tW-RebJ3QEVRzdkyV9KM8R1RmRzJtB9cmgCL4VJxysO-PS-5Tfme4Tzxm5jEmCam4t7ueLYZ5bw8d9rYpP_Zl2iWtdWjU5Yo_Ip2qY444V93vo9x', 'caecabcb9ccc5514', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, 'uploads/160607219937651662_81316871590.png', 'A7EE81', 0, NULL, NULL, '2020-11-22 17:39:59', '2020-11-23 18:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `braintree_nonce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `current_provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `before_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `before_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `after_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `after_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('SEARCHING','CANCELLED','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED','COMPLETED','SCHEDULED') COLLATE utf8_unicode_ci NOT NULL,
  `cancelled_by` enum('NONE','USER','PROVIDER') COLLATE utf8_unicode_ci NOT NULL,
  `cancel_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` enum('BRAINTREE','CASH','CARD','PAYPAL','PAYPAL-ADAPTIVE','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_track` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NO',
  `distance` double(15,8) NOT NULL,
  `travel_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` enum('Kms','Miles') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Kms',
  `otp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_latitude` double(15,8) NOT NULL,
  `s_longitude` double(15,8) NOT NULL,
  `d_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_latitude` double(15,8) DEFAULT NULL,
  `d_longitude` double(15,8) DEFAULT NULL,
  `track_distance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_latitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_longitude` double(15,8) NOT NULL DEFAULT '0.00000000',
  `destination_log` longtext COLLATE utf8_unicode_ci,
  `is_drop_location` tinyint(1) NOT NULL DEFAULT '1',
  `is_instant_ride` tinyint(1) NOT NULL DEFAULT '0',
  `is_dispute` tinyint(1) NOT NULL DEFAULT '0',
  `assigned_at` timestamp NULL DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `is_scheduled` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NO',
  `user_rated` tinyint(1) NOT NULL DEFAULT '0',
  `provider_rated` tinyint(1) NOT NULL DEFAULT '0',
  `use_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `surge` tinyint(1) NOT NULL DEFAULT '0',
  `route_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `braintree_nonce`, `provider_id`, `current_provider_id`, `service_type_id`, `before_image`, `before_comment`, `after_image`, `after_comment`, `promocode_id`, `status`, `cancelled_by`, `cancel_reason`, `payment_mode`, `paid`, `is_track`, `distance`, `travel_time`, `unit`, `otp`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `d_latitude`, `d_longitude`, `track_distance`, `track_latitude`, `track_longitude`, `destination_log`, `is_drop_location`, `is_instant_ride`, `is_dispute`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `is_scheduled`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `nonce`, `deleted_at`, `created_at`, `updated_at`) VALUES
(51, 'RIN753614', 15, NULL, 0, 21, 37, NULL, NULL, NULL, NULL, 0, 'CANCELLED', 'USER', NULL, 'CASH', 0, 'YES', 0.00000000, NULL, 'Kms', '8317', 'Tiruppur Rd, Sultanpet, Tamil Nadu 641669, India', 10.87130420, 77.19241940, '', 10.87130420, 77.19241940, 0.00000000, 0.00000000, 0.00000000, '[{\"latitude\":\"10.8713042\",\"longitude\":\"77.1924194\",\"address\":null}]', 1, 0, 0, '2020-06-27 19:35:00', NULL, NULL, NULL, 'NO', 0, 0, 0, 0, 'ygjaAqtcvM', NULL, NULL, '2020-06-27 19:35:00', '2020-06-27 19:35:28'),
(52, 'RIN612127', 15, NULL, 0, 21, 37, NULL, NULL, NULL, NULL, 0, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 0.00000000, NULL, 'Kms', '5605', '641652, Palaniappa Nagar, Ammapalayam, A.Thirumuruganpoondi, Tamil Nadu 641652, India', 11.15658436, 77.30011239, '', 11.15658436, 77.30011239, 0.00000000, 0.00000000, 0.00000000, '[{\"latitude\":\"11.156584359705448\",\"longitude\":\"77.30011238716543\",\"address\":null}]', 1, 0, 0, '2020-06-29 13:15:29', NULL, NULL, NULL, 'NO', 0, 0, 0, 0, 'y_bcAwtxvM', NULL, NULL, '2020-06-29 13:15:29', '2020-06-29 13:16:16'),
(53, 'RIN723620', 15, NULL, 0, 21, 37, NULL, NULL, NULL, NULL, 0, 'CANCELLED', 'NONE', NULL, 'CASH', 0, 'YES', 0.00000000, NULL, 'Kms', '8603', '34A, PSS Colony, Bridge Colony, Tiruppur, Tamil Nadu 641602, India', 11.11203530, 77.34278560, '', 11.11203530, 77.34278560, 0.00000000, 0.00000000, 0.00000000, '[{\"latitude\":\"11.1120353\",\"longitude\":\"77.3427856\",\"address\":null}]', 1, 0, 0, '2020-07-02 12:24:15', NULL, NULL, NULL, 'NO', 0, 0, 0, 0, 'khybAu_awM', NULL, NULL, '2020-07-02 12:24:16', '2020-07-02 12:24:30'),
(54, 'RIN233188', 15, NULL, 25, 25, 37, NULL, NULL, NULL, NULL, 0, 'CANCELLED', 'PROVIDER', 'check', 'CASH', 0, 'YES', 0.00000000, NULL, 'Kms', '2362', 'Unnamed Road, Ammapalayam, Avinashi, Tamil Nadu 641652, India', 11.15293410, 77.29528520, '', 11.15293410, 77.29528520, 0.00000000, 0.00000000, 0.00000000, '[{\"latitude\":\"11.1529341\",\"longitude\":\"77.2952852\",\"address\":null}]', 1, 0, 0, '2020-07-31 13:17:05', NULL, NULL, NULL, 'NO', 0, 0, 0, 0, 'ugacAqvwvM', NULL, NULL, '2020-07-31 13:17:05', '2020-07-31 13:17:35'),
(55, 'RIN809307', 15, NULL, 25, 25, 43, NULL, NULL, NULL, NULL, 0, 'CANCELLED', 'USER', 'Tt\n', 'CASH', 0, 'YES', 0.00000000, NULL, 'Kms', '3953', 'Asher Nagar 40feet Rd, Asher Nagar, Tiruppur, Tamil Nadu 641603, India', 11.12571560, 77.32954190, '', 11.12571560, 77.32954190, 0.00000000, 0.00000000, 0.00000000, '[{\"latitude\":\"11.1257156\",\"longitude\":\"77.3295419\",\"address\":null}]', 1, 0, 0, '2020-08-03 10:39:54', NULL, NULL, NULL, 'NO', 0, 0, 0, 0, 's~{bAsl~vM', NULL, NULL, '2020-08-03 10:39:54', '2020-08-03 10:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_disputes`
--

CREATE TABLE `user_request_disputes` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `dispute_type` enum('user','provider') COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `dispute_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dispute_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refund_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_lost_items`
--

CREATE TABLE `user_request_lost_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `lost_item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments_by` enum('user','admin') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_payments`
--

CREATE TABLE `user_request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fixed` double(10,2) NOT NULL DEFAULT '0.00',
  `distance` double(10,2) NOT NULL DEFAULT '0.00',
  `time_price` double(10,2) NOT NULL DEFAULT '0.00',
  `minute` double(10,2) NOT NULL DEFAULT '0.00',
  `hour` double(10,2) NOT NULL DEFAULT '0.00',
  `commision` double(10,2) NOT NULL DEFAULT '0.00',
  `commision_per` double(5,2) NOT NULL DEFAULT '0.00',
  `agent` double(10,2) NOT NULL DEFAULT '0.00',
  `agent_per` double(5,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount_per` double(5,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `tax_per` double(5,2) NOT NULL DEFAULT '0.00',
  `wallet` double(10,2) NOT NULL DEFAULT '0.00',
  `is_partial` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-No,1-Yes',
  `cash` double(10,2) NOT NULL DEFAULT '0.00',
  `card` double(10,2) NOT NULL DEFAULT '0.00',
  `online` double(10,2) NOT NULL DEFAULT '0.00',
  `surge` double(10,2) NOT NULL DEFAULT '0.00',
  `toll_charge` double(10,2) NOT NULL DEFAULT '0.00',
  `round_of` double(10,2) NOT NULL DEFAULT '0.00',
  `peak_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `peak_comm_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `total_waiting_time` int(11) NOT NULL DEFAULT '0',
  `waiting_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `waiting_comm_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `tips` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_commission` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_pay` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_request_ratings`
--

CREATE TABLE `user_request_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL DEFAULT '0',
  `provider_rating` int(11) NOT NULL DEFAULT '0',
  `user_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_ratings`
--

INSERT INTO `user_request_ratings` (`id`, `request_id`, `user_id`, `provider_id`, `user_rating`, `provider_rating`, `user_comment`, `provider_comment`, `created_at`, `updated_at`) VALUES
(1, 32, 67, 2, 0, 5, NULL, '', '2020-06-04 11:54:25', '2020-06-04 11:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_wallet`
--

CREATE TABLE `user_wallet` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `transaction_alias` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `open_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `close_balance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `payment_mode` enum('BRAINTREE','CARD','PAYPAL','PAYUMONEY','PAYTM') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_requests`
--

CREATE TABLE `wallet_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `alias_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user,provider,agent',
  `from_id` int(11) NOT NULL,
  `from_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('C','D') COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(15,8) NOT NULL DEFAULT '0.00000000',
  `send_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'online,offline',
  `send_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Pendig,1-Approved,2-cancel',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `work` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `account_password_resets`
--
ALTER TABLE `account_password_resets`
  ADD KEY `account_password_resets_email_index` (`email`),
  ADD KEY `account_password_resets_token_index` (`token`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_wallet`
--
ALTER TABLE `admin_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agents_email_unique` (`email`);

--
-- Indexes for table `agent_cards`
--
ALTER TABLE `agent_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_password_resets`
--
ALTER TABLE `agent_password_resets`
  ADD KEY `agent_password_resets_email_index` (`email`),
  ADD KEY `agent_password_resets_token_index` (`token`);

--
-- Indexes for table `agent_wallet`
--
ALTER TABLE `agent_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispatchers_email_unique` (`email`);

--
-- Indexes for table `dispatcher_password_resets`
--
ALTER TABLE `dispatcher_password_resets`
  ADD KEY `dispatcher_password_resets_email_index` (`email`),
  ADD KEY `dispatcher_password_resets_token_index` (`token`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventcontacts`
--
ALTER TABLE `eventcontacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

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
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payment_logs`
--
ALTER TABLE `payment_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payu_payments`
--
ALTER TABLE `payu_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peak_hours`
--
ALTER TABLE `peak_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`),
  ADD UNIQUE KEY `providers_mobile_unique` (`mobile`);

--
-- Indexes for table `provider_cards`
--
ALTER TABLE `provider_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_devices`
--
ALTER TABLE `provider_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_documents`
--
ALTER TABLE `provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_wallet`
--
ALTER TABLE `provider_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_earnings`
--
ALTER TABLE `referral_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_histroy`
--
ALTER TABLE `referral_histroy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_current_providers`
--
ALTER TABLE `request_current_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_waiting_time`
--
ALTER TABLE `request_waiting_time`
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
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service_peak_hours`
--
ALTER TABLE `service_peak_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_disputes`
--
ALTER TABLE `user_request_disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_lost_items`
--
ALTER TABLE `user_request_lost_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallet`
--
ALTER TABLE `user_wallet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_requests`
--
ALTER TABLE `wallet_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallet`
--
ALTER TABLE `admin_wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_cards`
--
ALTER TABLE `agent_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agent_wallet`
--
ALTER TABLE `agent_wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dispatchers`
--
ALTER TABLE `dispatchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eventcontacts`
--
ALTER TABLE `eventcontacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_logs`
--
ALTER TABLE `payment_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payu_payments`
--
ALTER TABLE `payu_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peak_hours`
--
ALTER TABLE `peak_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `provider_cards`
--
ALTER TABLE `provider_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provider_devices`
--
ALTER TABLE `provider_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `provider_documents`
--
ALTER TABLE `provider_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `provider_wallet`
--
ALTER TABLE `provider_wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_earnings`
--
ALTER TABLE `referral_earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_histroy`
--
ALTER TABLE `referral_histroy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_current_providers`
--
ALTER TABLE `request_current_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `request_waiting_time`
--
ALTER TABLE `request_waiting_time`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_peak_hours`
--
ALTER TABLE `service_peak_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `user_request_disputes`
--
ALTER TABLE `user_request_disputes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_lost_items`
--
ALTER TABLE `user_request_lost_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_wallet`
--
ALTER TABLE `user_wallet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_requests`
--
ALTER TABLE `wallet_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
