-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2023 at 05:53 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cjet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Fareeda', 'fareeda@gmail.com', NULL, '$2y$10$Z0FG287wSSPB19aYCOoPZuPb4CRFx0N17YnYMMpcA4hhG.cefX.rm', 'uploads/admins/1685953429_609502.webp', NULL, '2023-05-09 18:55:52', '2023-06-05 11:23:49'),
(3, 'fareeda 2', 'fareeda2@gmail.com', NULL, '$2y$10$3DcyZuFpVROAf1yLm/LLpu8JlfNaWJedwizAPjOSJeKbRrTKVOf3.', 'uploads/admins/1685629202_427164.webp', NULL, '2023-05-09 18:55:52', '2023-06-01 17:21:20'),
(4, 'Fareedaaa', 'fareeda3@gmail.com', NULL, '$2y$10$9K2OpzFh8GpAuf8J9GLOLuhrGBk7BYbhK1M5uf2N0X6omtxyaQHJu', 'uploads/admins/1685630057_431328.webp', NULL, '2023-06-01 17:34:17', '2023-06-05 13:01:49'),
(5, 'Ahmed Abdelrhim', 'aabdelrhim974@gmail.com', NULL, '$2y$10$PgKPC85xXe4mM.zbQEb6FuJ3C4ckUzHYnyl/c4Y9/l87EjsaThxRG', 'uploads/admins/1685630057_431328.webp', NULL, '2023-10-17 08:46:08', NULL),
(6, 'Ahmed Abdelrhim', 'a.abdelrhim@social-nuts.com', NULL, '$2y$10$WgSPKPQMNT.wPIqy4uZEUuaBdcdqw2r6qrVBSakMkdhK2WSeoPzsW', 'uploads/admins/1697533140_860671.webp', NULL, '2023-10-17 09:59:00', '2023-10-17 09:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('packages','services') COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertiseable_id` bigint(20) UNSIGNED NOT NULL,
  `advertiseable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title_en`, `title_ar`, `image_en`, `image_ar`, `type`, `advertiseable_id`, `advertiseable_type`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'package advertisement 1', 'إعلان مجموعه 1', 'uploads/advertisements/1683803563_752842.webp', 'uploads/advertisements/1692268825_770341.webp', 'packages', 4, 'App\\Models\\Package', 1, '2023-05-10 07:55:20', '2023-08-17 13:40:25'),
(3, 'package title en test', 'package title ar 10', 'uploads/advertisements/1683705423_273321.webp', 'uploads/advertisements/1683705423_955573.webp', 'packages', 4, 'App\\Models\\Package', 1, '2023-05-10 07:57:03', '2023-05-11 11:12:12'),
(4, 'package advertisement 2', 'إعلان مجموعه 2', 'uploads/advertisements/1683705350_141185.webp', 'uploads/advertisements/1683705351_305851.webp', 'packages', 5, 'App\\Models\\Package', 1, '2023-05-10 07:55:51', '2023-05-11 11:12:13'),
(6, 'service advertisement 2', 'إعلان الخدمة  2', 'uploads/advertisements/1683722632_809265.webp', 'uploads/advertisements/1683722632_586667.webp', 'services', 4, 'App\\Models\\Service', 1, '2023-05-10 12:43:52', '2023-05-10 12:43:52'),
(17, 'Mollitia in anim et', 'Possimus iusto eaqu', 'uploads/advertisements/1692618638_211399.webp', 'uploads/advertisements/1692618638_650920.webp', 'services', 6, 'App\\Models\\Service', 0, '2023-08-21 14:50:38', '2023-08-21 14:50:38'),
(18, 'Wheel Rim Cleaning', 'جنوط', 'uploads/advertisements/1695041534_374540.webp', 'uploads/advertisements/1695041535_793592.webp', 'services', 5, 'App\\Models\\Service', 1, '2023-09-18 15:52:15', '2023-09-25 14:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `title_en`, `title_ar`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'New Cairo', 'القاهرة الجديدة', 1, '2023-07-19 17:08:49', '2023-08-20 11:02:27'),
(2, '6th Of October', 'السادس من اكتوبر', 0, '2023-07-19 17:09:35', '2023-09-18 15:38:41'),
(3, 'Ain Al Sokhna', 'العين السخنة', 1, '2023-07-19 17:09:55', '2023-09-18 15:40:19'),
(4, 'zahers', 'szaher', 1, '2023-08-17 12:46:13', '2023-08-20 13:38:12'),
(5, 'marg', 'مرج', 1, '2023-08-17 13:00:31', '2023-08-20 13:38:10'),
(6, 'Nasr City', 'مدينة نصر', 1, '2023-09-18 15:39:30', '2023-09-18 15:42:38'),
(7, 'october 2', 'october 2', 0, '2023-10-11 13:04:43', '2023-10-11 13:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `compounds`
--

CREATE TABLE `compounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compounds`
--

INSERT INTO `compounds` (`id`, `city_id`, `title_en`, `title_ar`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mountain View - Hyde Park', 'ماونتن فيو - هايد بارك', 1, '2023-07-19 17:17:21', '2023-09-25 14:17:28'),
(2, 2, 'City 2 updated', 'City 2 ar updated', 0, '2023-07-19 17:41:07', '2023-09-18 15:38:41'),
(3, 2, 'City 3', 'City 3', 0, '2023-07-19 17:41:07', '2023-09-18 15:38:41'),
(4, 1, 'Palm Hils', 'بالم هيلز', 1, '2023-08-17 13:47:15', '2023-10-15 12:44:20'),
(5, 1, 'Compound Name English:', 'Compound Name English:', 0, '2023-08-17 14:18:53', '2023-08-20 11:02:26'),
(6, 5, 'Salam City', 'سلام سيتي', 1, '2023-08-20 13:38:31', '2023-08-20 13:38:31'),
(7, 4, 'Zaher City', 'ظاهر سيتي', 1, '2023-08-20 13:39:06', '2023-08-20 13:39:06'),
(8, 6, 'Taj City', 'تاج سيني', 1, '2023-09-18 15:43:00', '2023-09-18 15:43:51'),
(9, 6, 'Gardenia', 'جاردينيا', 1, '2023-09-18 15:44:32', '2023-09-18 15:44:32');

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
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `package_id`, `service_id`, `title_en`, `title_ar`, `created_at`, `updated_at`) VALUES
(24, NULL, 3, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', NULL, NULL),
(25, NULL, 3, 'Door jamb cleaning', 'تنظيف دعامة الباب', NULL, NULL),
(26, NULL, 4, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', '2023-05-11 08:54:36', '2023-05-11 08:54:36'),
(27, NULL, 4, 'Door jamb cleaning', 'تنظيف دعامة الباب', '2023-05-11 08:54:36', '2023-05-11 08:54:36'),
(28, NULL, 5, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', '2023-05-11 08:55:05', '2023-05-11 08:55:05'),
(29, NULL, 5, 'Door jamb cleaning', 'تنظيف دعامة الباب', '2023-05-11 08:55:05', '2023-05-11 08:55:05'),
(30, NULL, 6, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', NULL, NULL),
(31, NULL, 6, 'Door jamb cleaning', 'تنظيف دعامة الباب', NULL, NULL),
(38, 4, NULL, 'feature title en 2', 'feature title ar 2', NULL, NULL),
(44, 5, NULL, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', NULL, NULL),
(45, 5, NULL, 'Door jamb cleaning', 'تنظيف دعامة الباب', NULL, NULL),
(46, 5, NULL, 'Tire/rim cleaning', 'تنظيف الإطارات / الجنط', NULL, NULL),
(47, 5, NULL, 'Exclusive Sonax German Original material', 'مادة سوناكس الألمانية الأصلية الحصرية', NULL, NULL),
(57, 4, NULL, 'feature updated 1 en', 'feature updated 1 ar', NULL, NULL),
(63, NULL, 12, 'Add Service', 'Add Service', NULL, NULL),
(64, NULL, 12, 'Add Service 2', 'Add Service 2', NULL, NULL),
(66, 6, NULL, 'package', 'package', NULL, NULL),
(67, 6, NULL, 'package', 'package', NULL, NULL),
(68, NULL, 13, 'Full exterior hand wash', 'غسيل يدوي خارجي بالكامل', NULL, NULL),
(69, NULL, 13, 'Door jamb cleaning', 'تنظيف دعامة الباب', NULL, NULL),
(72, NULL, 15, 'Feature Title English 2', 'Feature Title arabic 2', '2023-05-18 08:14:58', '2023-05-18 08:14:58'),
(73, NULL, 15, 'Feature Title English 3', 'Feature Title arabic 3', '2023-05-18 08:14:58', '2023-05-18 08:14:58'),
(81, NULL, 13, 'Tire/rim cleaning', 'تنظيف الإطارات / الجنط', NULL, NULL),
(82, NULL, 13, 'Exclusive Sonax German Original material', 'مادة سوناكس الألمانية الأصلية الحصرية', NULL, NULL),
(83, 8, NULL, 'Waxing of rims', 'تشميع الجنوط', '2023-05-25 09:13:13', '2023-05-25 09:13:13'),
(84, 8, NULL, 'Interior vacuuming of car', 'إزالة الأتربة  و الأوساخ', '2023-05-25 09:13:13', '2023-05-25 09:13:13'),
(85, 8, NULL, 'Shampooing of car seats', 'غشل المقاعد و إزالة البقع', '2023-05-25 09:13:13', '2023-05-25 09:13:13'),
(86, NULL, 12, 'tesrrrr', 'tesrrrrtesrrrrtesrrrr ar', NULL, NULL),
(87, NULL, 17, 'testtest', 'test', '2023-05-25 17:36:04', '2023-05-25 17:36:04'),
(88, NULL, 17, 'test', 'test', '2023-05-25 17:36:04', '2023-05-25 17:36:04'),
(99, NULL, 23, 'asd', 'asd', '2023-08-17 12:11:51', '2023-08-17 12:11:51'),
(100, NULL, 23, 'asd', 'asd', '2023-08-17 12:11:51', '2023-08-17 12:11:51'),
(101, 5, NULL, 'qdasdas', 'asdadsasd', NULL, NULL),
(104, 10, NULL, 'Feature Title English', 'AR Feature Title arabic', '2023-09-13 13:29:40', '2023-09-13 13:29:40'),
(105, 10, NULL, 'Feature Title English', 'Feature Title English 2', '2023-09-13 13:29:40', '2023-09-13 13:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `purchaseable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `invoice_type` enum('purchase','refund') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'purchase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `purchaseable_type`, `invoice_reference_number`, `amount`, `invoice_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 23, 'App\\Models\\Package', '#RYYHO8UMRKQ', 300.00, 'purchase', '2023-09-07 17:56:35', '2023-09-07 17:56:35', NULL),
(2, 23, 'App\\Models\\Service', '#TOCX0ECKBSL', 700.00, 'purchase', '2023-09-07 17:57:24', '2023-09-07 17:57:24', NULL),
(3, 23, 'App\\Models\\Package', '#TU223RYINPO', 300.00, 'purchase', '2023-09-10 11:23:59', '2023-09-10 11:23:59', NULL),
(4, 23, 'App\\Models\\Package', '#ANX1XQL1ZSY', 300.00, 'purchase', '2023-09-10 11:24:02', '2023-09-10 11:24:02', NULL),
(5, 23, 'App\\Models\\Package', '#2OBA9JZPN4Z', 300.00, 'purchase', '2023-09-10 11:24:03', '2023-09-10 11:24:03', NULL),
(6, 23, 'App\\Models\\Service', '#MUYY6FVAZWC', 700.00, 'purchase', '2023-09-10 11:24:41', '2023-09-10 11:24:41', NULL),
(7, 23, 'App\\Models\\Service', '#EZ9IDBTJHWR', 700.00, 'purchase', '2023-09-10 11:24:43', '2023-09-10 11:24:43', NULL),
(8, 23, 'App\\Models\\Service', '#OWNSPQPFXCV', 700.00, 'purchase', '2023-09-10 11:24:44', '2023-09-10 11:24:44', NULL),
(9, 23, 'App\\Models\\Service', '#KGYQXOSUN3A', 700.00, 'purchase', '2023-09-10 11:24:45', '2023-09-10 11:24:45', NULL),
(10, 23, 'App\\Models\\Service', '#ENG3P1U3EHK', 100.00, 'purchase', '2023-09-10 11:25:17', '2023-09-10 11:25:17', NULL),
(18, 70, 'App\\Models\\Package', '#BGQSS3EHG0N', 86.00, 'purchase', '2023-09-10 15:39:03', '2023-09-10 15:39:03', NULL),
(19, 70, 'App\\Models\\Package', '#U4PEFOXXJD1', 86.00, 'purchase', '2023-09-10 15:39:04', '2023-09-10 15:39:04', NULL),
(20, 70, 'App\\Models\\Package', '#QQCX1YD5U5I', 86.00, 'purchase', '2023-09-10 15:42:15', '2023-09-10 15:42:15', NULL),
(21, 70, 'App\\Models\\Package', '#O2UGFTZ0497', 86.00, 'purchase', '2023-09-10 15:47:39', '2023-09-10 15:47:39', NULL),
(22, 23, 'App\\Models\\Service', '#9KAGFIDGYMO', 100.00, 'refund', '2023-09-11 14:33:40', '2023-09-11 14:33:40', NULL),
(23, 23, 'App\\Models\\Service', '#9KAGFIDGYMO', 600.00, 'refund', '2023-09-11 14:33:46', '2023-09-11 14:33:46', NULL),
(24, 70, 'App\\Models\\Package', '#BDJFIKCTAHY', 500.00, 'purchase', '2023-09-13 15:22:45', '2023-09-13 15:22:45', NULL),
(25, 70, 'App\\Models\\Package', '#JATL3MGO1GC', 300.00, 'purchase', '2023-09-14 15:26:25', '2023-09-14 15:26:25', NULL),
(26, 70, 'App\\Models\\Package', '#U4INACFVSQ4', 300.00, 'purchase', '2023-09-14 15:26:27', '2023-09-14 15:26:27', NULL),
(27, 70, 'App\\Models\\Package', '#QLNIRNT8XKX', 300.00, 'purchase', '2023-09-14 15:32:12', '2023-09-14 15:32:12', NULL),
(28, 70, 'App\\Models\\Package', '#CJ08TYZ3TOG', 300.00, 'purchase', '2023-09-14 15:32:13', '2023-09-14 15:32:13', NULL),
(29, 46, 'App\\Models\\Service', '#S0X3LAQB3AN', 150.00, 'purchase', '2023-09-16 17:55:27', '2023-09-16 17:55:27', NULL),
(30, 46, 'App\\Models\\Service', '#S0X3LAQB3AN', 150.00, 'refund', '2023-09-16 17:56:36', '2023-09-16 17:56:36', NULL),
(31, 46, 'App\\Models\\Service', '#DDADD4ONBNC', 150.00, 'purchase', '2023-09-16 18:21:30', '2023-09-16 18:21:30', NULL),
(32, 46, 'App\\Models\\Service', '#DDADD4ONBNC', 150.00, 'refund', '2023-09-16 18:23:25', '2023-09-16 18:23:25', NULL),
(33, 46, 'App\\Models\\Service', '#IL3NHPSQYHU', 150.00, 'purchase', '2023-09-16 18:25:32', '2023-09-16 18:25:32', NULL),
(34, 46, 'App\\Models\\Service', '#IL3NHPSQYHU', 150.00, 'refund', '2023-09-16 18:26:22', '2023-09-16 18:26:22', NULL),
(35, 46, 'App\\Models\\Service', '#FP2IGKYJ1IK', 150.00, 'purchase', '2023-09-16 18:29:25', '2023-09-16 18:29:25', NULL),
(36, 46, 'App\\Models\\Service', '#FP2IGKYJ1IK', 150.00, 'refund', '2023-09-16 18:29:37', '2023-09-16 18:29:37', NULL),
(37, 70, 'App\\Models\\Package', '#HUMORCIILR5', 100.00, 'purchase', '2023-09-18 13:39:18', '2023-09-18 13:39:18', NULL),
(38, 70, 'App\\Models\\Package', '#GBZRCX1RA1H', 100.00, 'purchase', '2023-09-18 15:27:13', '2023-09-18 15:27:13', NULL),
(39, 70, 'App\\Models\\Package', '#FP0ZJUUI7LC', 100.00, 'purchase', '2023-09-27 13:03:55', '2023-09-27 13:03:55', NULL),
(40, 23, 'App\\Models\\Service', '#XBGFYARQIA4', 700.00, 'purchase', '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(41, 23, 'App\\Models\\Service', '#BHBQPMT9MAT', 700.00, 'purchase', '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(42, 23, 'App\\Models\\Service', '#V2SZQMQPZI1', 700.00, 'purchase', '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(43, 23, 'App\\Models\\Service', '#GS2M1HGM1ZW', 700.00, 'purchase', '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(44, 23, 'App\\Models\\Service', '#GQ2RJATUWJ5', 700.00, 'purchase', '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(45, 70, 'App\\Models\\Service', '#ND0DZBAVJBB', 300.00, 'purchase', '2023-10-01 13:41:03', '2023-10-01 13:41:03', NULL),
(46, 70, 'App\\Models\\Service', '#IKGJ2IJ9XZF', 200.00, 'purchase', '2023-10-01 13:45:49', '2023-10-01 13:45:49', NULL),
(47, 70, 'App\\Models\\Service', '#TV7PO1I2DLS', 300.00, 'purchase', '2023-10-01 13:47:45', '2023-10-01 13:47:45', NULL),
(48, 70, 'App\\Models\\Service', '#JHGOSVMREEC', 300.00, 'purchase', '2023-10-01 13:49:28', '2023-10-01 13:49:28', NULL),
(49, 70, 'App\\Models\\Service', '#ND0DZBAVJBB', 150.00, 'refund', '2023-10-01 14:28:58', '2023-10-01 14:28:58', NULL),
(50, 70, 'App\\Models\\Service', '#ND0DZBAVJBB', 150.00, 'refund', '2023-10-01 14:29:15', '2023-10-01 14:29:15', NULL),
(51, 70, 'App\\Models\\Service', '#RQSD7G9SGY4', 150.00, 'purchase', '2023-10-01 14:39:51', '2023-10-01 14:39:51', NULL),
(52, 74, 'App\\Models\\Package', '#QVGKT6Z9Q28', 300.00, 'purchase', '2023-10-09 15:38:13', '2023-10-09 15:38:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_user_purchase_requests`
--

CREATE TABLE `invoice_user_purchase_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `user_purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_user_purchase_requests`
--

INSERT INTO `invoice_user_purchase_requests` (`id`, `invoice_id`, `user_purchase_request_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 42, '2023-09-07 17:56:35', '2023-09-07 17:56:35', NULL),
(2, 2, 43, '2023-09-07 17:57:24', '2023-09-07 17:57:24', NULL),
(3, 2, 44, '2023-09-07 17:57:24', '2023-09-07 17:57:24', NULL),
(4, 3, 45, '2023-09-10 11:23:59', '2023-09-10 11:23:59', NULL),
(5, 4, 46, '2023-09-10 11:24:02', '2023-09-10 11:24:02', NULL),
(6, 5, 47, '2023-09-10 11:24:03', '2023-09-10 11:24:03', NULL),
(7, 6, 48, '2023-09-10 11:24:41', '2023-09-10 11:24:41', NULL),
(8, 6, 49, '2023-09-10 11:24:41', '2023-09-10 11:24:41', NULL),
(9, 7, 50, '2023-09-10 11:24:43', '2023-09-10 11:24:43', NULL),
(10, 7, 51, '2023-09-10 11:24:43', '2023-09-10 11:24:43', NULL),
(11, 8, 52, '2023-09-10 11:24:44', '2023-09-10 11:24:44', NULL),
(12, 8, 53, '2023-09-10 11:24:44', '2023-09-10 11:24:44', NULL),
(13, 9, 54, '2023-09-10 11:24:45', '2023-09-10 11:24:45', NULL),
(14, 9, 55, '2023-09-10 11:24:45', '2023-09-10 11:24:45', NULL),
(15, 10, 56, '2023-09-10 11:25:17', '2023-09-10 11:25:17', NULL),
(16, 18, 57, '2023-09-10 15:39:03', '2023-09-10 15:39:03', NULL),
(17, 19, 58, '2023-09-10 15:39:04', '2023-09-10 15:39:04', NULL),
(18, 20, 59, '2023-09-10 15:42:15', '2023-09-10 15:42:15', NULL),
(19, 21, 60, '2023-09-10 15:47:39', '2023-09-10 15:47:39', NULL),
(20, 22, 35, '2023-09-11 14:33:40', '2023-09-11 14:33:40', NULL),
(21, 23, 36, '2023-09-11 14:33:46', '2023-09-11 14:33:46', NULL),
(22, 24, 61, '2023-09-13 15:22:45', '2023-09-13 15:22:45', NULL),
(23, 25, 62, '2023-09-14 15:26:25', '2023-09-14 15:26:25', NULL),
(24, 26, 63, '2023-09-14 15:26:27', '2023-09-14 15:26:27', NULL),
(25, 27, 64, '2023-09-14 15:32:12', '2023-09-14 15:32:12', NULL),
(26, 28, 65, '2023-09-14 15:32:13', '2023-09-14 15:32:13', NULL),
(27, 29, 66, '2023-09-16 17:55:27', '2023-09-16 17:55:27', NULL),
(28, 30, 66, '2023-09-16 17:56:36', '2023-09-16 17:56:36', NULL),
(29, 31, 67, '2023-09-16 18:21:30', '2023-09-16 18:21:30', NULL),
(30, 32, 67, '2023-09-16 18:23:25', '2023-09-16 18:23:25', NULL),
(31, 33, 68, '2023-09-16 18:25:32', '2023-09-16 18:25:32', NULL),
(32, 34, 68, '2023-09-16 18:26:22', '2023-09-16 18:26:22', NULL),
(33, 35, 69, '2023-09-16 18:29:25', '2023-09-16 18:29:25', NULL),
(34, 36, 69, '2023-09-16 18:29:37', '2023-09-16 18:29:37', NULL),
(35, 37, 70, '2023-09-18 13:39:18', '2023-09-18 13:39:18', NULL),
(36, 38, 71, '2023-09-18 15:27:13', '2023-09-18 15:27:13', NULL),
(37, 39, 72, '2023-09-27 13:03:55', '2023-09-27 13:03:55', NULL),
(38, 40, 73, '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(39, 40, 74, '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(40, 41, 75, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(41, 41, 76, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(42, 42, 77, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(43, 42, 78, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(44, 43, 79, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(45, 43, 80, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(46, 44, 81, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(47, 44, 82, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(48, 45, 83, '2023-10-01 13:41:03', '2023-10-01 13:41:03', NULL),
(49, 45, 84, '2023-10-01 13:41:03', '2023-10-01 13:41:03', NULL),
(50, 46, 85, '2023-10-01 13:45:49', '2023-10-01 13:45:49', NULL),
(51, 46, 86, '2023-10-01 13:45:49', '2023-10-01 13:45:49', NULL),
(52, 47, 87, '2023-10-01 13:47:45', '2023-10-01 13:47:45', NULL),
(53, 47, 88, '2023-10-01 13:47:45', '2023-10-01 13:47:45', NULL),
(54, 48, 89, '2023-10-01 13:49:28', '2023-10-01 13:49:28', NULL),
(55, 48, 90, '2023-10-01 13:49:28', '2023-10-01 13:49:28', NULL),
(56, 49, 83, '2023-10-01 14:28:58', '2023-10-01 14:28:58', NULL),
(57, 50, 84, '2023-10-01 14:29:15', '2023-10-01 14:29:15', NULL),
(58, 51, 91, '2023-10-01 14:39:51', '2023-10-01 14:39:51', NULL),
(59, 52, 92, '2023-10-09 15:38:13', '2023-10-09 15:38:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_19_124733_create_translations_table', 1),
(6, '2023_04_30_122354_create_otps_table', 1),
(7, '2023_04_30_125000_create_admins_table', 1),
(8, '2023_04_30_130736_create_social_accounts_table', 1),
(9, '2023_05_07_091306_create_packages_table', 1),
(10, '2023_05_07_091349_create_advertisements_table', 1),
(11, '2023_05_07_091436_create_settings_table', 1),
(12, '2023_05_08_120704_create_features_table', 1),
(13, '2023_05_08_121512_create_package_services_table', 1),
(14, '2023_05_08_134047_create_services_types_table', 1),
(15, '2023_05_08_134056_create_services_table', 1),
(16, '2023_05_09_142634_create_price_options_table', 1),
(17, '2023_05_09_181131_add_is_active_to_service_types_table', 2),
(18, '2023_05_09_184812_add_advertiseable_id_to_advertisements_table', 2),
(19, '2023_05_09_220100_add_image_to_service_types_table', 3),
(20, '2023_05_11_091035_add_short_description_to_services_table', 4),
(21, '2023_05_15_112429_add_is_offers_to_users_table', 5),
(22, '2023_05_23_071453_add_session_resend_at_to_otps_table', 6),
(23, '2023_05_25_172717_add_social_media_id_to_users_table', 7),
(24, '2023_05_30_141248_add_temp_phone_to_users_table', 8),
(25, '2023_05_31_114336_add_image_to_users_table', 8),
(26, '2023_07_17_105618_drop_package_services_table', 9),
(27, '2023_07_17_120630_add_featureable_type_to_features_table', 9),
(28, '2023_07_17_132010_create_cities_table', 10),
(29, '2023_07_17_132017_create_compounds_table', 10),
(30, '2023_07_17_175935_create_user_cars_table', 10),
(31, '2023_07_17_175954_create_user_addresses_table', 10),
(32, '2023_07_17_175960_create_user_payment_methods_table', 10),
(33, '2023_07_25_104729_create_service_providers_table', 11),
(34, '2023_07_25_112848_create_user_purchase_requests_table', 11),
(35, '2023_07_25_125106_create_user_purchase_schedule_table', 11),
(36, '2023_08_02_101229_add_deleted_at_columns_to_packages_table', 12),
(37, '2023_08_02_101358_add_deleted_at_columns_to_services_table', 12),
(38, '2023_08_02_101408_add_deleted_at_columns_to_service_types_table', 12),
(39, '2023_08_02_101421_add_deleted_at_columns_to_price_options_table', 12),
(40, '2023_08_02_102303_add_reschedule_maximum_date_to_user_purchase_schedules_table', 13),
(41, '2023_08_02_104111_add_purchaseable_request_payment_reference_to_user_purchase_requests_table', 13),
(42, '2023_08_02_145934_create_user_purchase_price_options_table', 13),
(43, '2023_08_14_123237_add_columns_to_service_providers_table', 14),
(44, '2023_08_14_140301_create_service_provider_compounds_table', 14),
(45, '2023_08_16_142302_add_forign_key_compound_id_to_service_provider_compounds_table', 15),
(46, '2023_08_21_154020_add_assigned_at_to_user_purchase_requests_table', 16),
(47, '2023_08_21_154035_add_assigned_at_to_user_purchase_schedules_table', 16),
(48, '2023_09_04_132658_rename_purchaseable_request_payment_reference_in_user_purchase_requests_table', 17),
(49, '2023_09_04_134854_create_invoices_table', 17),
(50, '2023_09_07_132800_create_invoice_user_purchase_requests_table', 17),
(51, '2023_09_12_111333_add_rescheduled_at_to_user_purchase_schedules', 18),
(52, '2023_09_16_111717_add_is_reschedule_handled_to_user_purchase_schedules_table', 19),
(53, '2023_09_26_010529_add_notification_settings', 20),
(54, '2023_09_26_012710_create_notifications_table', 20),
(55, '2023_09_27_151113_create_promotional_notification_table', 21),
(56, '2023_10_04_011950_add_is_active_columns_to_cars_and_car_tables', 22),
(57, '2023_10_04_012952_add_is_active_columns_to_payment_methods_table', 23),
(58, '2023_10_18_114536_create_jobs_table', 24),
(59, '2023_10_19_144552_create_payment_table', 25);

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

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('09e827ad-9306-42a5-9fdb-1978942cc14b', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.735505Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\",\"0\":\"22 august 2024\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('128de805-2ffc-4c2e-af32-1cb6d55e9d98', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:08:56.545687Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:08:56', '2023-10-18 10:08:56'),
('41678239-39df-459a-bfd2-b9f9feb00899', 'App\\Notifications\\PackageSubscriptionEnded', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T13:01:26.424812Z\",\"title\":\"custom.action_triggered.package_subscription_ended.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_ended.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"#QVGKT6Z9Q28\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 14:01:26', '2023-10-18 14:01:26'),
('5c9ec0d6-245f-40ef-a9cf-91045281355e', 'App\\Notifications\\PackageSubscriptionEnded', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T12:43:08.091387Z\",\"title\":\"custom.action_triggered.package_subscription_ended.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_ended.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"#QVGKT6Z9Q28\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 13:43:08', '2023-10-18 13:43:08'),
('5d0b35d6-ebd7-41cd-b354-eb6d38ef3ca6', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:59:44.593470Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:59:44', '2023-10-18 10:59:44'),
('5f78dd73-1222-4c12-9f2f-1bb974fdf9b0', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:55:02.851995Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:55:02', '2023-10-18 10:55:02'),
('635213e0-fabd-4006-8b1d-83d906536bcd', 'App\\Notifications\\BookingRefunded', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.756891Z\",\"title\":\"custom.action_triggered.request_confirmed.notification.title\",\"notification\":\"custom.action_triggered.request_confirmed.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('771d0994-a038-444a-b2f1-c0d2775d660a', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:31:46.965328Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:31:46', '2023-10-18 10:31:46'),
('7b8ceb94-12a2-4f2a-904c-bb025796f4a1', 'App\\Notifications\\PackageSubscriptionEnded', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.785130Z\",\"title\":\"custom.action_triggered.package_subscription_ended.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_ended.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('7f811e4a-e988-4632-8f3f-77ccd7863674', 'App\\Notifications\\PackageSubscriptionCancelled', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.776231Z\",\"title\":\"custom.action_triggered.package_subscription_cancelled.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_cancelled.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('93e7b23d-ddb6-4b3f-a814-9c94fcac906e', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:57:52.201165Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:57:52', '2023-10-18 10:57:52'),
('9730ad9c-b229-4d37-a07c-6fa4a5ff96bf', 'App\\Notifications\\BookingAppointment', 'App\\Models\\User', 74, '{\"date\":\"2023-10-18T09:30:27.846760Z\",\"title\":\"custom.action_triggered.booking_appointment.notification.title\",\"notification\":\"custom.action_triggered.booking_appointment.notification.message\",\"notification_paramaters\":{\"booking_number\":\"CWP-1599611\",\"date\":\"Current Working Hours: 9 PM - 7 AM\"},\"id\":92,\"type\":\"request\"}', NULL, '2023-10-18 10:30:27', '2023-10-18 10:30:27'),
('a108ab98-2fab-4b7c-9ee9-ae3b7b8af663', 'App\\Notifications\\PackageSubscriptionActivated', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.766168Z\",\"title\":\"custom.action_triggered.package_subscription_activated.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_activated.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"package\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('c4c59476-238a-49ba-a146-f0e087097e29', 'App\\Notifications\\BookingRescheduled', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.744797Z\",\"title\":\"custom.action_triggered.booking_rescheduled.notification.title\",\"notification\":\"custom.action_triggered.booking_rescheduled.notification.message\",\"notification_paramaters\":{\"booking_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\",\"new_date\":\"10 august 2024\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('c8fbf566-a8d5-46ec-8d7b-7ef6d6eba576', 'App\\Notifications\\RequestConfirmed', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.718907Z\",\"title\":\"custom.action_triggered.request_confirmed.notification.title\",\"notification\":\"custom.action_triggered.request_confirmed.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17'),
('ddbe2cf5-47eb-4ebc-b929-f10fcdabef40', 'App\\Notifications\\PackageSubscriptionRenewed', 'App\\Models\\User', 74, '{\"date\":\"2023-09-30T17:32:17.794328Z\",\"title\":\"custom.action_triggered.package_subscription_renewed.notification.title\",\"notification\":\"custom.action_triggered.package_subscription_renewed.notification.message\",\"notification_paramaters\":{\"invoice_reference_number\":\"E3qq0c1b0anzfR22mGNlI3Ll4gr7rL\"},\"id\":5,\"type\":\"request\"}', NULL, '2023-09-30 20:32:17', '2023-09-30 20:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT 0,
  `send_count` int(11) NOT NULL DEFAULT 0,
  `is_send_count` int(11) NOT NULL DEFAULT 0,
  `expire_at` timestamp NULL DEFAULT NULL,
  `unblocked_at` timestamp NULL DEFAULT NULL,
  `is_success` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `otp`, `attempts_count`, `send_count`, `is_send_count`, `expire_at`, `unblocked_at`, `is_success`, `created_at`, `updated_at`) VALUES
(9, 5, 797729, 0, 1, 1, '2023-05-29 17:28:08', NULL, 0, '2023-05-29 17:23:08', '2023-05-29 17:23:08'),
(12, 8, 430504, 0, 1, 1, '2023-05-30 13:37:31', NULL, 0, '2023-05-30 13:32:31', '2023-05-30 13:32:31'),
(13, 10, 392520, 0, 1, 1, '2023-05-31 15:08:36', NULL, 0, '2023-05-31 15:03:36', '2023-05-31 15:03:36'),
(14, 11, 859982, 0, 1, 1, '2023-05-31 15:08:41', NULL, 0, '2023-05-31 15:03:41', '2023-05-31 15:03:41'),
(15, 12, 934015, 0, 1, 1, '2023-05-31 15:08:45', NULL, 0, '2023-05-31 15:03:45', '2023-05-31 15:03:45'),
(16, 13, 133570, 0, 1, 1, '2023-06-01 00:15:22', NULL, 0, '2023-06-01 00:10:22', '2023-06-01 00:10:22'),
(17, 14, 490466, 0, 1, 1, '2023-06-01 00:17:17', NULL, 0, '2023-06-01 00:12:17', '2023-06-01 00:12:17'),
(18, 15, 456598, 0, 1, 1, '2023-06-01 00:18:41', NULL, 0, '2023-06-01 00:13:41', '2023-06-01 00:13:41'),
(19, 16, 690113, 0, 1, 1, '2023-06-01 00:45:49', NULL, 0, '2023-06-01 00:40:49', '2023-06-01 00:40:49'),
(20, 17, 768795, 0, 1, 1, '2023-06-01 00:49:16', NULL, 1, '2023-06-01 00:44:16', '2023-06-01 00:46:24'),
(24, 3, 336160, 0, 1, 1, '2023-06-01 16:56:25', NULL, 0, '2023-06-01 16:51:25', '2023-06-01 16:51:25'),
(40, 18, 884930, 0, 1, 1, '2023-06-03 16:21:46', NULL, 1, '2023-06-03 16:16:46', '2023-06-03 16:16:57'),
(43, 19, 731681, 0, 1, 1, '2023-06-05 08:54:43', NULL, 0, '2023-06-05 08:49:43', '2023-06-05 08:49:43'),
(44, 20, 436169, 0, 1, 1, '2023-06-05 09:06:49', NULL, 1, '2023-06-05 09:01:49', '2023-06-05 09:02:41'),
(45, 6, 567991, 0, 8, 3, '2023-06-05 10:02:09', '2023-08-23 23:47:43', 0, '2023-06-05 09:53:02', '2023-08-23 23:17:43'),
(46, 21, 888321, 0, 1, 1, '2023-06-05 10:16:38', NULL, 1, '2023-06-05 10:11:38', '2023-06-05 10:12:01'),
(48, 7, 505207, 0, 7, 3, '2023-06-05 10:48:15', '2023-06-14 01:31:00', 0, '2023-06-05 10:35:49', '2023-06-14 01:01:00'),
(51, 4, 988555, 0, 1, 1, '2023-06-07 10:16:13', NULL, 0, '2023-06-07 10:11:13', '2023-06-07 10:11:13'),
(52, 1, 966057, 0, 1, 1, '2023-06-07 10:16:41', NULL, 0, '2023-06-07 10:11:41', '2023-06-07 10:11:41'),
(57, 25, 583656, 0, 1, 1, '2023-06-11 17:08:22', NULL, 1, '2023-06-11 17:03:22', '2023-06-11 17:04:12'),
(58, 24, 950841, 0, 1, 1, '2023-06-12 16:36:55', NULL, 1, '2023-06-12 16:31:55', '2023-06-12 16:32:39'),
(59, 22, 897755, 1, 1, 1, '2023-06-13 23:26:53', NULL, 1, '2023-06-13 23:21:53', '2023-06-13 23:23:10'),
(64, 28, 760936, 0, 1, 1, '2023-08-30 11:06:59', NULL, 0, '2023-08-30 11:01:59', '2023-08-30 11:01:59'),
(65, 29, 858858, 0, 1, 1, '2023-08-30 11:10:05', NULL, 0, '2023-08-30 11:05:05', '2023-08-30 11:05:05'),
(66, 30, 529355, 0, 1, 1, '2023-08-30 11:40:07', NULL, 0, '2023-08-30 11:35:07', '2023-08-30 11:35:07'),
(67, 31, 554776, 0, 1, 1, '2023-08-30 11:40:19', NULL, 0, '2023-08-30 11:35:19', '2023-08-30 11:35:20'),
(68, 32, 611609, 0, 1, 1, '2023-08-30 13:02:27', NULL, 1, '2023-08-30 12:57:27', '2023-08-30 12:58:42'),
(69, 27, 830718, 1, 1, 1, '2023-08-31 14:17:34', NULL, 0, '2023-08-31 14:12:34', '2023-08-31 14:13:49'),
(71, 34, 284539, 0, 1, 1, '2023-09-05 13:07:35', NULL, 0, '2023-09-05 13:02:35', '2023-09-05 13:02:36'),
(72, 35, 554258, 0, 1, 1, '2023-09-05 13:25:08', NULL, 0, '2023-09-05 13:20:08', '2023-09-05 13:20:09'),
(73, 36, 497782, 0, 1, 1, '2023-09-05 13:29:22', NULL, 0, '2023-09-05 13:24:22', '2023-09-05 13:24:22'),
(74, 37, 366944, 0, 1, 1, '2023-09-05 13:29:43', NULL, 0, '2023-09-05 13:24:43', '2023-09-05 13:24:43'),
(75, 38, 581858, 0, 1, 1, '2023-09-05 13:29:59', NULL, 0, '2023-09-05 13:24:59', '2023-09-05 13:25:00'),
(76, 39, 419097, 0, 1, 1, '2023-09-05 13:30:18', NULL, 0, '2023-09-05 13:25:18', '2023-09-05 13:25:19'),
(77, 40, 343293, 0, 1, 1, '2023-09-05 13:37:43', NULL, 0, '2023-09-05 13:32:43', '2023-09-05 13:32:44'),
(78, 41, 355660, 0, 1, 1, '2023-09-05 13:37:57', NULL, 0, '2023-09-05 13:32:57', '2023-09-05 13:32:58'),
(79, 42, 454394, 0, 1, 1, '2023-09-05 13:38:29', NULL, 0, '2023-09-05 13:33:29', '2023-09-05 13:33:30'),
(80, 43, 635850, 0, 1, 1, '2023-09-05 13:39:44', NULL, 0, '2023-09-05 13:34:44', '2023-09-05 13:34:44'),
(81, 33, 520054, 0, 1, 1, '2023-09-05 13:56:01', NULL, 0, '2023-09-05 13:51:01', '2023-09-05 13:51:01'),
(83, 45, 843795, 0, 1, 1, '2023-09-05 14:09:38', NULL, 0, '2023-09-05 14:04:38', '2023-09-05 14:04:38'),
(85, 44, 368966, 1, 2, 2, '2023-09-05 14:16:58', NULL, 0, '2023-09-05 14:10:41', '2023-09-05 14:14:24'),
(86, 47, 742906, 0, 2, 2, '2023-09-05 14:20:39', NULL, 0, '2023-09-05 14:13:11', '2023-09-05 14:15:39'),
(87, 46, 752848, 0, 1, 1, '2023-09-05 14:20:07', NULL, 1, '2023-09-05 14:15:07', '2023-09-05 14:15:31'),
(88, 48, 310849, 0, 1, 1, '2023-09-05 14:36:52', NULL, 1, '2023-09-05 14:31:52', '2023-09-05 14:32:45'),
(90, 50, 321824, 0, 1, 1, '2023-09-05 14:49:49', NULL, 0, '2023-09-05 14:44:49', '2023-09-05 14:44:50'),
(91, 51, 840175, 0, 1, 1, '2023-09-05 14:50:38', NULL, 0, '2023-09-05 14:45:38', '2023-09-05 14:45:38'),
(92, 52, 246084, 0, 1, 1, '2023-09-05 14:52:34', NULL, 0, '2023-09-05 14:47:34', '2023-09-05 14:47:35'),
(94, 54, 173495, 0, 1, 1, '2023-09-05 15:04:40', NULL, 0, '2023-09-05 14:59:40', '2023-09-05 14:59:41'),
(95, 55, 137011, 0, 1, 1, '2023-09-05 15:10:16', NULL, 0, '2023-09-05 15:05:16', '2023-09-05 15:05:16'),
(96, 56, 792502, 1, 1, 1, '2023-09-05 15:13:13', NULL, 0, '2023-09-05 15:08:13', '2023-09-05 15:08:18'),
(97, 57, 249810, 2, 1, 1, '2023-09-05 15:13:36', NULL, 1, '2023-09-05 15:08:36', '2023-09-05 15:10:56'),
(98, 58, 578628, 0, 1, 1, '2023-09-05 15:40:01', NULL, 0, '2023-09-05 15:35:01', '2023-09-05 15:35:01'),
(99, 59, 346870, 0, 1, 1, '2023-09-05 15:40:10', NULL, 0, '2023-09-05 15:35:10', '2023-09-05 15:35:11'),
(100, 60, 551688, 0, 1, 1, '2023-09-05 15:40:34', NULL, 0, '2023-09-05 15:35:34', '2023-09-05 15:35:35'),
(101, 49, 251734, 0, 2, 2, '2023-09-05 15:57:17', NULL, 1, '2023-09-05 15:50:50', '2023-09-05 15:52:31'),
(102, 61, 699938, 0, 1, 1, '2023-09-05 15:58:43', NULL, 0, '2023-09-05 15:53:43', '2023-09-05 15:53:44'),
(103, 62, 732789, 0, 1, 1, '2023-09-05 15:59:26', NULL, 0, '2023-09-05 15:54:26', '2023-09-05 15:54:27'),
(104, 63, 369970, 0, 1, 1, '2023-09-05 16:00:02', NULL, 0, '2023-09-05 15:55:02', '2023-09-05 15:55:02'),
(105, 64, 555980, 2, 1, 1, '2023-09-05 16:12:14', NULL, 0, '2023-09-05 16:07:14', '2023-09-05 16:19:38'),
(106, 65, 108704, 0, 1, 1, '2023-09-05 16:23:45', NULL, 0, '2023-09-05 16:18:45', '2023-09-05 16:18:45'),
(109, 53, 482916, 0, 5, 3, '2023-09-05 21:46:55', '2023-09-16 18:03:05', 0, '2023-09-05 21:36:09', '2023-09-16 17:33:05'),
(110, 66, 825355, 0, 4, 3, '2023-09-06 12:32:34', '2023-09-06 14:08:47', 0, '2023-09-06 12:23:25', '2023-09-06 13:38:47'),
(111, 67, 590870, 0, 1, 1, '2023-09-06 13:31:59', NULL, 0, '2023-09-06 13:26:59', '2023-09-06 13:27:00'),
(112, 68, 353044, 0, 1, 1, '2023-09-06 13:33:19', NULL, 0, '2023-09-06 13:28:19', '2023-09-06 13:28:20'),
(116, 71, 889859, 0, 1, 1, '2023-09-18 13:24:17', NULL, 1, '2023-09-18 13:19:17', '2023-09-18 13:19:47'),
(123, 72, 978411, 2, 2, 2, '2023-10-01 14:21:19', NULL, 1, '2023-10-01 14:14:16', '2023-10-01 14:17:33'),
(124, 73, 666811, 1, 1, 1, '2023-10-05 20:32:30', NULL, 0, '2023-10-05 20:27:30', '2023-10-05 20:28:07'),
(125, 70, 280620, 0, 2, 2, '2023-10-08 13:41:03', NULL, 1, '2023-10-08 13:33:53', '2023-10-08 13:36:41'),
(126, 23, 908020, 0, 3, 3, '2023-10-09 11:33:27', NULL, 0, '2023-10-09 11:23:07', '2023-10-09 11:28:28'),
(130, 74, 178023, 0, 1, 1, '2023-10-11 23:24:36', NULL, 0, '2023-10-11 23:19:36', '2023-10-11 23:19:37'),
(131, 75, 195006, 0, 1, 1, '2023-10-14 20:17:19', NULL, 0, '2023-10-14 20:12:19', '2023-10-14 20:12:19'),
(132, 76, 818110, 1, 1, 1, '2023-10-14 20:30:47', NULL, 0, '2023-10-14 20:25:47', '2023-10-14 20:35:59'),
(133, 77, 791096, 0, 1, 1, '2023-10-17 11:06:11', NULL, 0, '2023-10-17 11:01:11', '2023-10-17 11:01:11'),
(134, 2, 579569, 0, 1, 1, '2023-10-17 13:15:21', NULL, 0, '2023-10-17 13:10:21', '2023-10-17 13:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `no_of_days` int(11) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title_en`, `title_ar`, `description_en`, `description_ar`, `price`, `no_of_days`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 100.00, 5, 1, '2023-05-16 13:57:56', '2023-09-13 13:47:45', NULL),
(5, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 300.00, 3, 1, '2023-05-16 14:02:04', '2023-09-13 13:01:54', NULL),
(6, 'package', 'package', 'package', 'package', 222.00, 5, 1, '2023-05-17 15:28:49', '2023-09-13 13:47:49', NULL),
(8, 'Ultra Package', 'خدمة من الأخر', 'exterior and interior wash for your car with waxing and detailing of rims', 'غسيل داخلي و خارجي للسيارة و تشميع و تنظيف الجنوط', 500.00, 7, 1, '2023-05-25 09:13:13', '2023-09-13 13:47:57', NULL),
(9, 'Voluptatum est dolor', 'asdas', 'Qui nulla iusto a ea laboris et sint aspernatur consectetur proident do voluptas dolor optio fugit minima ducimus', 'asdasd', 86.00, 3, 1, '2023-09-10 11:53:41', '2023-09-13 13:06:16', NULL),
(10, 'Package Title Test', 'Package Title Arabic AR', 'Package Description Test', 'Package Description Arabic AR', 1000.00, 4, 1, '2023-09-13 13:29:40', '2023-09-13 13:48:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_purchase_request_id` bigint(20) NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_pending` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymob_transaction_id` bigint(20) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `user_id`, `user_purchase_request_id`, `payment_status`, `payment_pending`, `amount`, `currency`, `paymob_transaction_id`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 158288177, 23, 81, NULL, NULL, '100', 'EGP', NULL, NULL, '2023-10-19 17:10:25', '2023-10-19 17:10:25'),
(2, 158288248, 23, 81, NULL, NULL, '100', 'EGP', NULL, NULL, '2023-10-19 17:10:46', '2023-10-19 17:10:46');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Admin', 1, 'API TOKEN', 'bf0723801e400a93612fd1596f0f2bcb09c089cc1edc74eee90bcc74b4202ad2', '[\"admin\"]', NULL, NULL, '2023-05-09 18:49:16', '2023-05-09 18:49:16'),
(2, 'App\\Models\\Admin', 2, 'API TOKEN', '3229986cc13642742c40bbf046d6068c69c1793e71559e240a2832bac9b797ed', '[\"admin\"]', NULL, NULL, '2023-05-09 18:55:52', '2023-05-09 18:55:52'),
(3, 'App\\Models\\Admin', 2, 'API TOKEN', '52ccbacf5b82000fb62bbb6d4c85c7e5c9cc71a073a07b99dadbd25fab03756b', '[\"admin\"]', '2023-10-04 11:32:25', NULL, '2023-05-09 18:59:57', '2023-10-04 11:32:25'),
(4, 'App\\Models\\Admin', 2, 'API TOKEN', '2f539df44f66264ba132e99201cdff957b4dcfd549a31cd19a84f25e86e59a44', '[\"admin\"]', NULL, NULL, '2023-05-10 10:26:59', '2023-05-10 10:26:59'),
(5, 'App\\Models\\Admin', 2, 'API TOKEN', 'c5d327913c533c1ce3cdb99b6c4eb142134473605025785f21c6c3d42670aef1', '[\"admin\"]', NULL, NULL, '2023-05-10 10:27:29', '2023-05-10 10:27:29'),
(6, 'App\\Models\\Admin', 2, 'API TOKEN', '4b54db254a2b59f510ca6395cd045e422651678c94e485289f331da3ad667850', '[\"admin\"]', NULL, NULL, '2023-05-10 10:27:36', '2023-05-10 10:27:36'),
(7, 'App\\Models\\Admin', 2, 'API TOKEN', '52708c08fd806a81b351e8be313d1b6ebb0c905c258d7f80dc40f7f4ec30a199', '[\"admin\"]', NULL, NULL, '2023-05-10 10:28:04', '2023-05-10 10:28:04'),
(8, 'App\\Models\\Admin', 2, 'API TOKEN', 'e1ac86c7c8bcff1d7f1398760857b4822a035511a6f0f54134b1503c9dd779f1', '[\"admin\"]', NULL, NULL, '2023-05-10 10:28:18', '2023-05-10 10:28:18'),
(9, 'App\\Models\\Admin', 2, 'API TOKEN', '9419213df750b1fded69685cc185148c7bfa6f0c8448985d13c7a7a9e869a998', '[\"admin\"]', NULL, NULL, '2023-05-10 10:28:44', '2023-05-10 10:28:44'),
(10, 'App\\Models\\Admin', 2, 'API TOKEN', '80c440503d3a38b07c2290e721d43f493156efda8e236e6f71a4e401a2cb299e', '[\"admin\"]', NULL, NULL, '2023-05-10 10:29:05', '2023-05-10 10:29:05'),
(11, 'App\\Models\\Admin', 2, 'API TOKEN', '3aed13e948a221ab9d6b39d963282cdbdaaa110cc24ddd185b8af14b9251c3f4', '[\"admin\"]', NULL, NULL, '2023-05-10 10:29:29', '2023-05-10 10:29:29'),
(12, 'App\\Models\\Admin', 2, 'API TOKEN', '45728cb61605810d247367b8d46a713251813e33a7b201ea48dff8489fef610e', '[\"admin\"]', NULL, NULL, '2023-05-10 10:30:22', '2023-05-10 10:30:22'),
(13, 'App\\Models\\Admin', 2, 'API TOKEN', '4e88ce5eb088872cb85f2b59e740cd5a2e1e8b945ab0c75896189208ff10d595', '[\"admin\"]', NULL, NULL, '2023-05-10 10:31:10', '2023-05-10 10:31:10'),
(14, 'App\\Models\\Admin', 2, 'API TOKEN', '5532f22392307b4314927de7af4c581368ca7e19efee12b556e99005c85c5af1', '[\"admin\"]', NULL, NULL, '2023-05-10 10:35:33', '2023-05-10 10:35:33'),
(15, 'App\\Models\\Admin', 2, 'API TOKEN', 'a27f20d3e866dae25a81c11fee88e4f9abc1730935efc0eebaefb35d07f344af', '[\"admin\"]', NULL, NULL, '2023-05-10 10:37:34', '2023-05-10 10:37:34'),
(16, 'App\\Models\\Admin', 2, 'API TOKEN', 'a88f7fbe7bd8d8b73342ecf1c8856233740115094d39e870a8ffc2bc00fc2820', '[\"admin\"]', NULL, NULL, '2023-05-10 10:38:36', '2023-05-10 10:38:36'),
(17, 'App\\Models\\Admin', 2, 'API TOKEN', '2a5148776b752a32d08e9f2f3e24c996bef21bc24ce42d2d9d48cf92313d26fa', '[\"admin\"]', NULL, NULL, '2023-05-10 10:39:58', '2023-05-10 10:39:58'),
(18, 'App\\Models\\Admin', 2, 'API TOKEN', 'a30114c383c77f918615146161daf84ccc10705f31be915cb41e756608cfbcc2', '[\"admin\"]', NULL, NULL, '2023-05-10 10:41:17', '2023-05-10 10:41:17'),
(19, 'App\\Models\\Admin', 2, 'API TOKEN', '09e221185fa111ea18597abd69347143fbcec77e86442d05de4fd72422a5986c', '[\"admin\"]', NULL, NULL, '2023-05-10 10:42:12', '2023-05-10 10:42:12'),
(20, 'App\\Models\\Admin', 2, 'API TOKEN', 'a5b49bb73f0d30f8e665d31e8e36d77a3585ab1a351c902423491cd8ff845223', '[\"admin\"]', NULL, NULL, '2023-05-10 10:42:49', '2023-05-10 10:42:49'),
(21, 'App\\Models\\Admin', 2, 'API TOKEN', '8e4e88d953a3831dd596cf26042f1258f3b8d1cf8e98d999b6b26fdf9455e4c4', '[\"admin\"]', NULL, NULL, '2023-05-10 10:43:45', '2023-05-10 10:43:45'),
(22, 'App\\Models\\Admin', 2, 'API TOKEN', '6af58cc1d61aaa3a0667827e2ebaa953811fbe3257d89be89c003fe5c03b061c', '[\"admin\"]', NULL, NULL, '2023-05-10 10:44:24', '2023-05-10 10:44:24'),
(23, 'App\\Models\\Admin', 2, 'API TOKEN', 'c11f6a4c2fe9d090be69f92862540e0775e3bca81141a0e11dccb2ca70049745', '[\"admin\"]', NULL, NULL, '2023-05-10 10:44:56', '2023-05-10 10:44:56'),
(24, 'App\\Models\\Admin', 2, 'API TOKEN', '00dc130084f1d404067463a48a4ca5b806beeb26cab51a7b38d0075c455e4b81', '[\"admin\"]', NULL, NULL, '2023-05-10 10:45:39', '2023-05-10 10:45:39'),
(25, 'App\\Models\\Admin', 2, 'API TOKEN', 'ede897ffc528912b999290cde1ddc42e7c2ab9b36bb3e1869d67c5f95b0dc596', '[\"admin\"]', NULL, NULL, '2023-05-10 10:46:25', '2023-05-10 10:46:25'),
(26, 'App\\Models\\Admin', 2, 'API TOKEN', '88e147fa23047fc09a3417529756074d555b02afe492ff79b00a8aa6a80e0343', '[\"admin\"]', NULL, NULL, '2023-05-10 10:47:15', '2023-05-10 10:47:15'),
(27, 'App\\Models\\Admin', 2, 'API TOKEN', 'aaab07343bc2758eb7e2806e39ff3d2154f5abc0468d5cf670a86e439119b54f', '[\"admin\"]', NULL, NULL, '2023-05-10 10:49:03', '2023-05-10 10:49:03'),
(28, 'App\\Models\\Admin', 2, 'API TOKEN', '457076f8696602640ecde47ed40378e9feb888cc6cc7079b3aa2a3c40ffb7b96', '[\"admin\"]', '2023-05-10 10:56:33', NULL, '2023-05-10 10:53:00', '2023-05-10 10:56:33'),
(29, 'App\\Models\\Admin', 2, 'API TOKEN', '719f8e694b401cc4a4d23c30e925b164633e8ca76107fbca1c477c5666b802d2', '[\"admin\"]', '2023-05-10 10:59:13', NULL, '2023-05-10 10:56:42', '2023-05-10 10:59:13'),
(30, 'App\\Models\\Admin', 2, 'API TOKEN', 'af31bff4c2521f283ccc2d4b7552882f28d08a88ee7a022ea71e0cd52dc564cd', '[\"admin\"]', '2023-05-10 13:17:13', NULL, '2023-05-10 11:00:51', '2023-05-10 13:17:13'),
(31, 'App\\Models\\Admin', 2, 'API TOKEN', '4e3e784ee713b2de4ed227f01023e9fca6043083a1debc9aaba84e9ceca831eb', '[\"admin\"]', '2023-05-11 13:14:57', NULL, '2023-05-10 11:21:18', '2023-05-11 13:14:57'),
(32, 'App\\Models\\Admin', 2, 'API TOKEN', 'de51f802c7b688a6de2b59dfd19e70174b0427aa7ee1a5813a20d3318bf159fc', '[\"admin\"]', '2023-05-11 14:03:33', NULL, '2023-05-11 08:45:03', '2023-05-11 14:03:33'),
(33, 'App\\Models\\Admin', 2, 'API TOKEN', 'd5099231fabbe389c15d1a1f6215060eda6c66999a0b7e89c678e83de7c2981a', '[\"admin\"]', '2023-05-11 09:34:13', NULL, '2023-05-11 09:06:31', '2023-05-11 09:34:13'),
(34, 'App\\Models\\Admin', 2, 'API TOKEN', 'aa52fa3e1111cff03292bc7b6f9b494096b5c28e776f95c20c26517da3805421', '[\"admin\"]', NULL, NULL, '2023-05-11 09:22:27', '2023-05-11 09:22:27'),
(35, 'App\\Models\\Admin', 2, 'API TOKEN', '251880afecb95c08eb9a6b5f53d7dee1fd4f1d783dc400f82be7d300aca643e5', '[\"admin\"]', '2023-09-13 11:55:58', NULL, '2023-05-11 09:24:29', '2023-09-13 11:55:58'),
(36, 'App\\Models\\Admin', 2, 'API TOKEN', 'f143938b714a9312d129ced0630eb1c225b321fac31b6b72d19a518430cfbb1b', '[\"admin\"]', '2023-05-14 10:47:09', NULL, '2023-05-14 08:43:07', '2023-05-14 10:47:09'),
(37, 'App\\Models\\Admin', 2, 'API TOKEN', '3a88900b5f2ecc78a9dbf1d13c9347a2a4d6bb6910bd06e78f5834afda13a1ff', '[\"admin\"]', '2023-05-18 07:29:45', NULL, '2023-05-14 09:08:24', '2023-05-18 07:29:45'),
(38, 'App\\Models\\Admin', 2, 'API TOKEN', '34bbd40dd4897a7bb34473d1254900dbd3c9398e4df3de20beceea092189bdc7', '[\"admin\"]', NULL, NULL, '2023-05-14 09:13:40', '2023-05-14 09:13:40'),
(39, 'App\\Models\\Admin', 2, 'API TOKEN', 'cf483d1c6fac7ee901e49ac88fb1254ff77bad31b0b5ca2b7c57ed5640c859d3', '[\"admin\"]', '2023-05-15 08:56:16', NULL, '2023-05-14 09:14:42', '2023-05-15 08:56:16'),
(40, 'App\\Models\\Admin', 2, 'API TOKEN', '2dc2be57484c92603919e84aefa62d6ca773b1f92d05f1c85139dd1cb05919f1', '[\"admin\"]', '2023-05-14 09:30:16', NULL, '2023-05-14 09:26:18', '2023-05-14 09:30:16'),
(41, 'App\\Models\\Admin', 2, 'API TOKEN', '02eb9e3e2222dddef12460e14dcafdd62c445422f4263435ebdf48c5451e2241', '[\"admin\"]', '2023-05-14 09:32:21', NULL, '2023-05-14 09:31:55', '2023-05-14 09:32:21'),
(42, 'App\\Models\\Admin', 2, 'API TOKEN', '8205e1d5321482a3b0fd6532b25529d5ab6919b0cf2176a4bce494296f88661d', '[\"admin\"]', '2023-05-16 15:31:13', NULL, '2023-05-14 09:34:02', '2023-05-16 15:31:13'),
(43, 'App\\Models\\Admin', 2, 'API TOKEN', '37ce1cba0384f8fb1a5dbffdfcd685c83868f8b5d1a32b1cfc4c122038759de4', '[\"admin\"]', '2023-05-15 13:58:55', NULL, '2023-05-14 10:47:16', '2023-05-15 13:58:55'),
(44, 'App\\Models\\Admin', 2, 'API TOKEN', '2f6d65fdd0ac95b8f66414f754747c622dee9812e19c98bbc18b9b408ef28529', '[\"admin\"]', '2023-05-17 08:25:05', NULL, '2023-05-15 08:56:26', '2023-05-17 08:25:05'),
(45, 'App\\Models\\Admin', 2, 'API TOKEN', 'fe88015b39d2c3088ee2b646e0a3cc5a3d745c94128c6d8de33b97a9133c7fb8', '[\"admin\"]', '2023-05-16 08:53:49', NULL, '2023-05-15 13:59:00', '2023-05-16 08:53:49'),
(46, 'App\\Models\\Admin', 2, 'API TOKEN', '815b9c1b26c676a0b0e1f3061ea18b4e4afe3a34fa6b3b9815080e2e90217cdb', '[\"admin\"]', '2023-05-18 08:01:59', NULL, '2023-05-16 08:53:54', '2023-05-18 08:01:59'),
(47, 'App\\Models\\Admin', 2, 'API TOKEN', '139ba9b83628b8c88060f4ae5c7a9011706a905bdad82b89bf9444ebb00ac6aa', '[\"admin\"]', '2023-05-18 10:49:55', NULL, '2023-05-16 15:32:37', '2023-05-18 10:49:55'),
(48, 'App\\Models\\Admin', 2, 'API TOKEN', '52c1aa30ee7b013781c9664568b6c03f8bd76a026971e0637bc69905f2c35846', '[\"admin\"]', '2023-05-18 09:10:49', NULL, '2023-05-17 08:25:40', '2023-05-18 09:10:49'),
(49, 'App\\Models\\Admin', 2, 'API TOKEN', '7f2e20e467c1fe35923a4e3fbe6632997815ff517984b29b1777be357a8c00d9', '[\"admin\"]', '2023-05-18 10:07:56', NULL, '2023-05-18 07:30:09', '2023-05-18 10:07:56'),
(50, 'App\\Models\\Admin', 2, 'API TOKEN', 'bd1698cb0325868b6141c72f0fd0b468d71507435dea40109b26cc0008296d6e', '[\"admin\"]', '2023-05-18 08:06:21', NULL, '2023-05-18 08:05:52', '2023-05-18 08:06:21'),
(51, 'App\\Models\\Admin', 2, 'API TOKEN', '5d05b253baca2d9d0bd6066c5d616d9411d6074d17ecc91d197b06fbb87849ad', '[\"admin\"]', '2023-05-18 08:06:40', NULL, '2023-05-18 08:06:26', '2023-05-18 08:06:40'),
(52, 'App\\Models\\Admin', 2, 'API TOKEN', '6de490d08182dc49680072313d5403ade96a15037e51a11c3356df530b106363', '[\"admin\"]', '2023-05-18 13:37:38', NULL, '2023-05-18 08:06:44', '2023-05-18 13:37:38'),
(53, 'App\\Models\\Admin', 2, 'API TOKEN', '83e825272718cbe5a9934711060c126e682892bd7f74d61460475cc392645a78', '[\"admin\"]', '2023-05-18 11:09:07', NULL, '2023-05-18 09:11:18', '2023-05-18 11:09:07'),
(54, 'App\\Models\\Admin', 2, 'API TOKEN', 'd54d330475ac1df9624d3a48c5d0037f3069cb526d3216d94753f9f8bb6e0de2', '[\"admin\"]', '2023-05-18 10:55:24', NULL, '2023-05-18 10:08:51', '2023-05-18 10:55:24'),
(55, 'App\\Models\\Admin', 2, 'API TOKEN', 'ef19c794b803f15dfbb34c18e91fb05705a2e0dc50a5d167c91886b277b4f44a', '[\"admin\"]', '2023-05-18 12:22:13', NULL, '2023-05-18 10:58:13', '2023-05-18 12:22:13'),
(56, 'App\\Models\\Admin', 2, 'API TOKEN', 'd3ba2f74eb95cc6fd0305f5a7c8f026196c310d1235adb72dab6431e3cc3430a', '[\"admin\"]', '2023-05-18 13:35:31', NULL, '2023-05-18 12:20:40', '2023-05-18 13:35:31'),
(57, 'App\\Models\\Admin', 2, 'API TOKEN', 'bfbc859f2fd6353c3db3dca1548a14133b3339e384e724c0b5ddc344b36df5ba', '[\"admin\"]', '2023-06-11 11:00:22', NULL, '2023-05-18 13:35:45', '2023-06-11 11:00:22'),
(58, 'App\\Models\\Admin', 2, 'API TOKEN', 'b6e430356371402af5f2291e270dea40c3508065886401ec90a6022ce63c9df5', '[\"admin\"]', '2023-05-21 08:01:26', NULL, '2023-05-21 07:59:54', '2023-05-21 08:01:26'),
(59, 'App\\Models\\Admin', 2, 'API TOKEN', 'cb89a1fd31e72001908c9f5937f7c387fdbd848644cbfc8d08de6c1ccb5a13f1', '[\"admin\"]', '2023-05-21 12:36:44', NULL, '2023-05-21 12:36:35', '2023-05-21 12:36:44'),
(60, 'App\\Models\\Admin', 2, 'API TOKEN', '5035c4119d6f075d2b08e441617725f327f45e4ec98834dd38b8351010d4d98f', '[\"admin\"]', '2023-06-11 15:29:03', NULL, '2023-05-25 09:05:30', '2023-06-11 15:29:03'),
(61, 'App\\Models\\User', 2, 'API TOKEN', 'a0ad896bd33ecafe6a31354ce91bd7b8c17ed81b6d5c9a7cd9ab99eb57ff1c32', '[\"otp\"]', '2023-09-17 16:22:20', NULL, '2023-05-25 13:32:21', '2023-09-17 16:22:20'),
(62, 'App\\Models\\User', 1, 'API TOKEN', '23de69f095205f988222b57b723f367cf5fe708f7bc68f1ac0e9e065f3477796', '[\"otp\"]', NULL, NULL, '2023-05-25 13:33:40', '2023-05-25 13:33:40'),
(63, 'App\\Models\\User', 3, 'API TOKEN', '82359fae7bc4b9cc0f761a7fb0fad22aa97a6335a903e27d6a52064298189f46', '[\"otp\"]', '2023-05-25 13:47:36', NULL, '2023-05-25 13:47:14', '2023-05-25 13:47:36'),
(64, 'App\\Models\\User', 3, 'API TOKEN', '4eb6aa7d43ff0d87fef6298692a6466cb56270c6fd3752b30069640c76a50b77', '[\"user\"]', NULL, NULL, '2023-05-25 13:47:36', '2023-05-25 13:47:36'),
(65, 'App\\Models\\User', 4, 'API TOKEN', 'e5ebffcd9a9a8e5fbabe6585ea3ed6b421bbadc91931498eed4b218d0a9da42a', '[\"otp\"]', NULL, NULL, '2023-05-25 13:48:15', '2023-05-25 13:48:15'),
(66, 'App\\Models\\User', 4, 'API TOKEN', '7f6bd4cd56bd3205a8df91cbac7bd88359e64916f9046b12d3a1d934591b1a7e', '[\"otp\"]', '2023-05-25 13:58:02', NULL, '2023-05-25 13:49:12', '2023-05-25 13:58:02'),
(67, 'App\\Models\\User', 4, 'API TOKEN', 'cdda43ad96dba42fce579aa332330c0f88023bdbbb9b876fe80a8b718afbbb66', '[\"user\"]', NULL, NULL, '2023-05-25 13:58:02', '2023-05-25 13:58:02'),
(68, 'App\\Models\\Admin', 2, 'API TOKEN', '9203b37fca49ac8654b2738867fc3846c9e026b65dcba4ed956217b9f8002314', '[\"admin\"]', '2023-05-25 16:20:38', NULL, '2023-05-25 14:00:03', '2023-05-25 16:20:38'),
(69, 'App\\Models\\Admin', 2, 'API TOKEN', '90d6949e552ceac511644c3931ab9a6d3f9d302dba9c3f9f1ded6db11e4a9829', '[\"admin\"]', '2023-05-28 12:06:22', NULL, '2023-05-25 16:21:23', '2023-05-28 12:06:22'),
(70, 'App\\Models\\Admin', 2, 'API TOKEN', 'b4ff6fae79282925fd0b48b4b9e442c08f138688f898964355d12a59fb92636d', '[\"admin\"]', '2023-05-31 15:32:16', NULL, '2023-05-28 14:23:09', '2023-05-31 15:32:16'),
(71, 'App\\Models\\Admin', 2, 'API TOKEN', 'ea617650a6480032958c384eaa727119d8f0956c5ecd4d0be158b6e83267582a', '[\"admin\"]', '2023-05-29 11:50:20', NULL, '2023-05-28 14:41:49', '2023-05-29 11:50:20'),
(72, 'App\\Models\\User', 1, 'API TOKEN', '31b4a0a8f8be4c36d68474deb2593e9ddf7cbdebb6946767fa1375530ba14bad', '[\"otp\"]', NULL, NULL, '2023-05-28 23:03:27', '2023-05-28 23:03:27'),
(73, 'App\\Models\\User', 1, 'API TOKEN', '91fda4db02f7afb35b584f39f4750d6383b2022f0223ac750a085161fc41032f', '[\"otp\"]', NULL, NULL, '2023-05-29 00:01:40', '2023-05-29 00:01:40'),
(74, 'App\\Models\\Admin', 2, 'API TOKEN', 'e109ef598e979d63b7bb1077d402af82fbe8264d38cff9992c3dedd253da335b', '[\"admin\"]', '2023-05-29 11:53:15', NULL, '2023-05-29 11:50:22', '2023-05-29 11:53:15'),
(75, 'App\\Models\\Admin', 2, 'API TOKEN', 'c8044c6fe9fe5c9f9599798252382227b6fc5806c62f367b474423d8a91945a0', '[\"admin\"]', '2023-05-29 17:34:00', NULL, '2023-05-29 11:53:19', '2023-05-29 17:34:00'),
(76, 'App\\Models\\User', 5, 'API TOKEN', '3913a7b976d7c6bbded311d21fc344538234f51486ea95badc84edcdb96ebfb0', '[\"otp\"]', NULL, NULL, '2023-05-29 17:23:08', '2023-05-29 17:23:08'),
(77, 'App\\Models\\User', 6, 'API TOKEN', 'bc6751bcae1b828ae7b8b77f610bd9fb6633f9746d81142a94879fa3571b8d12', '[\"otp\"]', NULL, NULL, '2023-05-29 20:01:15', '2023-05-29 20:01:15'),
(78, 'App\\Models\\User', 7, 'API TOKEN', '17e7f42b6c44966378363e4daa6d86e62bcf88eb03a8f892719dac8e00163891', '[\"otp\"]', NULL, NULL, '2023-05-29 20:46:24', '2023-05-29 20:46:24'),
(79, 'App\\Models\\User', 8, 'API TOKEN', 'e3b222474b0f794be279d598507b5b63e2dbc09c3f5b2a19011fc6803c245a06', '[\"otp\"]', NULL, NULL, '2023-05-30 13:32:31', '2023-05-30 13:32:31'),
(80, 'App\\Models\\User', 9, 'API TOKEN', '99c448a2e78fbe231fe0dc814a269cfc2ccb9525e63a2d66644fcd115f8b90de', '[\"phone\"]', NULL, NULL, '2023-05-30 13:35:27', '2023-05-30 13:35:27'),
(81, 'App\\Models\\User', 9, 'API TOKEN', 'aa56a955e124a5ece592c9cd364922062c90701a6230f8b762063b162ac089dd', '[\"phone\"]', NULL, NULL, '2023-05-30 13:58:40', '2023-05-30 13:58:40'),
(82, 'App\\Models\\User', 10, 'API TOKEN', 'f919c600db0ad990cddb8a6be4263efa53c0444c85e98d2cfd139753ff41c6c8', '[\"otp\"]', NULL, NULL, '2023-05-31 15:03:36', '2023-05-31 15:03:36'),
(83, 'App\\Models\\User', 11, 'API TOKEN', '183809873987ea102cefd71f51506dcc5e2776e3c9aad7fe33423034f1f56965', '[\"otp\"]', NULL, NULL, '2023-05-31 15:03:41', '2023-05-31 15:03:41'),
(84, 'App\\Models\\User', 12, 'API TOKEN', 'fb7aee6b7875de87ecdf41a9a837323a2807d1abe75615fb5b6aca7e79597cc3', '[\"otp\"]', NULL, NULL, '2023-05-31 15:03:45', '2023-05-31 15:03:45'),
(85, 'App\\Models\\Admin', 2, 'API TOKEN', 'affe1cce46aef0347cbdcb3cb54d04be172e02ef9e5d6abdf0456e427766097c', '[\"admin\"]', '2023-06-01 17:30:26', NULL, '2023-05-31 15:33:04', '2023-06-01 17:30:26'),
(86, 'App\\Models\\User', 9, 'API TOKEN', '6ce11c64b85b836911d1c592c70adf6694500bcba4c38b7a65f78fb43c3e3751', '[\"phone\"]', NULL, NULL, '2023-05-31 17:29:27', '2023-05-31 17:29:27'),
(87, 'App\\Models\\User', 9, 'API TOKEN', 'e53a1c908ff7d3b567b1b3693caa9bb464ac1d2eb7497ebea95ed6cd6feeb9d6', '[\"phone\"]', NULL, NULL, '2023-05-31 17:33:24', '2023-05-31 17:33:24'),
(88, 'App\\Models\\User', 13, 'API TOKEN', '6d7fab981f9532e31813152ed70f06f3a253b31189f318961b1cd40638a6e5e5', '[\"otp\"]', NULL, NULL, '2023-06-01 00:10:22', '2023-06-01 00:10:22'),
(89, 'App\\Models\\User', 14, 'API TOKEN', '709f6433decab10c870f5a083cbd0aeb6750067a2418fce5ce412379a2a13db9', '[\"otp\"]', NULL, NULL, '2023-06-01 00:12:17', '2023-06-01 00:12:17'),
(90, 'App\\Models\\User', 15, 'API TOKEN', 'f8ccd42fe4944c43771b2b4347ad83bb81980c9986027399172dcd69f673ac24', '[\"otp\"]', NULL, NULL, '2023-06-01 00:13:41', '2023-06-01 00:13:41'),
(91, 'App\\Models\\User', 16, 'API TOKEN', '2da66cb59250c6f4f5d4f186fd6b5c88ef442e0400f9eff71ca828d3a6600f2e', '[\"otp\"]', NULL, NULL, '2023-06-01 00:40:49', '2023-06-01 00:40:49'),
(92, 'App\\Models\\User', 17, 'API TOKEN', '2b463acf98231cd5afce21c1394fff8be21f7c769ad5eb45a05aee5b7fd36dd3', '[\"otp\"]', '2023-06-01 00:46:24', NULL, '2023-06-01 00:44:16', '2023-06-01 00:46:24'),
(93, 'App\\Models\\User', 17, 'API TOKEN', 'b417631905e55080e96373deb618472e06911284dbc68163e9ebe25d9007b82a', '[\"user\"]', NULL, NULL, '2023-06-01 00:46:24', '2023-06-01 00:46:24'),
(94, 'App\\Models\\Admin', 2, 'API TOKEN', '8fd65379942de89ea1c4f2263d642d67402efd936219e114058d71411d6768b5', '[\"admin\"]', '2023-06-01 17:03:20', NULL, '2023-06-01 11:24:59', '2023-06-01 17:03:20'),
(95, 'App\\Models\\User', 1, 'API TOKEN', '11f55e642175837fdeed4cd5c61ef844e0b2545bbb718a0d08b5c419ccc2f27c', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-01 16:25:02', '2023-06-01 16:25:02'),
(96, 'App\\Models\\User', 1, 'API TOKEN', 'a03e538999c235252dc363d3e6567cf9bab641493f9fa6388926bb27f9727740', '[\"otp-reset-password\"]', '2023-06-01 16:53:27', NULL, '2023-06-01 16:33:13', '2023-06-01 16:53:27'),
(97, 'App\\Models\\User', 1, 'API TOKEN', '34c3e608db543553ac3b8c26779c7e1d5b25ff7279699c2fe2ad489faa95c0cb', '[\"reset-password\"]', '2023-06-01 16:36:08', NULL, '2023-06-01 16:34:03', '2023-06-01 16:36:08'),
(98, 'App\\Models\\User', 1, 'API TOKEN', 'f2f700e9158bf71b55b5e71539bccc56a589c8b272c872c6fe92138bb4fe51ce', '[\"user\"]', NULL, NULL, '2023-06-01 16:36:20', '2023-06-01 16:36:20'),
(99, 'App\\Models\\User', 1, 'API TOKEN', '283f4abd7d1d720ebbb6f0c23fd78bc9e448851430090fa939354cbb806cb389', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-01 16:49:46', '2023-06-01 16:49:46'),
(100, 'App\\Models\\User', 1, 'API TOKEN', '8bb02c5ba220d47c82ed261fd0e149c54cdf7d3b03ae3ed7ac2de459b8c64d49', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-01 16:51:05', '2023-06-01 16:51:05'),
(101, 'App\\Models\\User', 3, 'API TOKEN', '6c7f41b2c6e9aff5897ae296c65c6ffd68dc84901503bbb05e463904f2c85c8b', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-01 16:51:25', '2023-06-01 16:51:25'),
(102, 'App\\Models\\User', 4, 'API TOKEN', '7fa3b04be2ab7de05cbe6211763d132119a8dc8d312e899c85eb165331219be6', '[\"otp-reset-password\"]', '2023-06-02 17:19:49', NULL, '2023-06-01 16:51:53', '2023-06-02 17:19:49'),
(103, 'App\\Models\\Admin', 2, 'API TOKEN', 'feb6fd2a153df85fed778e3974e21bb1ec277729516c65799e9d30c010e2386b', '[\"admin\"]', '2023-06-01 17:07:38', NULL, '2023-06-01 17:03:51', '2023-06-01 17:07:38'),
(104, 'App\\Models\\Admin', 2, 'API TOKEN', '268a69a4b707dfe8071ced13729bab5a35194a297159f4ec840c4f107b255831', '[\"admin\"]', '2023-06-01 18:29:22', NULL, '2023-06-01 17:07:50', '2023-06-01 18:29:22'),
(105, 'App\\Models\\Admin', 2, 'API TOKEN', '721e015ba8bbf8014552cf30615740c83b612b8bff9f2874b860ba8999eae711', '[\"admin\"]', '2023-06-01 17:31:12', NULL, '2023-06-01 17:31:11', '2023-06-01 17:31:12'),
(106, 'App\\Models\\Admin', 2, 'API TOKEN', 'e55b6a90880e2782826867238c35a2182e6753a88cfca2dd0fb577b50cba45d2', '[\"admin\"]', '2023-06-04 11:26:08', NULL, '2023-06-01 17:33:46', '2023-06-04 11:26:08'),
(107, 'App\\Models\\Admin', 4, 'API TOKEN', 'f056353f927c34cea968cc2d493ea029afb6d9a0e7e3945cc8a1a708fd9d9f6a', '[\"admin\"]', NULL, NULL, '2023-06-01 17:34:17', '2023-06-01 17:34:17'),
(108, 'App\\Models\\User', 4, 'API TOKEN', '3b6d3bcbeda8761033816d848768b519e1a1405ed898f541aaf7074f887418f1', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 17:06:40', '2023-06-02 17:06:40'),
(109, 'App\\Models\\User', 4, 'API TOKEN', 'f86fd545813747a30b3eb5f9fa9353da8b43af7e67ba7d3d2763f626a87b5c05', '[\"otp-reset-password\"]', '2023-06-02 17:23:16', NULL, '2023-06-02 17:22:54', '2023-06-02 17:23:16'),
(110, 'App\\Models\\User', 4, 'API TOKEN', '5dec559463eebde0cd13528f85ba633e7025cdd248f07b469eb002492c82146e', '[\"reset-password\"]', '2023-06-02 18:55:23', NULL, '2023-06-02 17:23:16', '2023-06-02 18:55:23'),
(111, 'App\\Models\\User', 4, 'API TOKEN', '617a0b0fe653839cc93c13271eeb6f48bac5fd828394bc22eb6c813e3588d229', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 17:44:42', '2023-06-02 17:44:42'),
(112, 'App\\Models\\User', 4, 'API TOKEN', 'c62dbb66310a741e8305c678131345af020c80c7d4b716b650c920b2fc100e03', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 17:55:50', '2023-06-02 17:55:50'),
(113, 'App\\Models\\User', 4, 'API TOKEN', '3cebabf0b3b72bef55750a7c473d0fb2f22e929dff206d74319e06470b286830', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 18:00:22', '2023-06-02 18:00:22'),
(114, 'App\\Models\\User', 4, 'API TOKEN', '678f04af21e18aabc597aea0238205870c65cb38c8157eeaf85e98c5d86eafe2', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 18:17:43', '2023-06-02 18:17:43'),
(115, 'App\\Models\\User', 4, 'API TOKEN', 'f4bee65d3ca58b8af5eec0439fab0b9ad9b25fdda7fd7c7de8f2bdd9c8a3db47', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 18:20:40', '2023-06-02 18:20:40'),
(116, 'App\\Models\\User', 4, 'API TOKEN', 'a7bcbdd01137df1838a1dc07dd4257c901e81c712c2214c39a8db906de029ff2', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 18:23:28', '2023-06-02 18:23:28'),
(117, 'App\\Models\\User', 4, 'API TOKEN', 'a88b79d3eb9f413da472eacd876a9a79e8e9449ba4b701d81348d215e3845a43', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-02 18:28:11', '2023-06-02 18:28:11'),
(118, 'App\\Models\\User', 4, 'API TOKEN', 'e267bd3182bd51df548aa6eaf122056558290645583238816ad1e184a2fab4c6', '[\"otp-reset-password\"]', '2023-06-02 18:38:48', NULL, '2023-06-02 18:32:21', '2023-06-02 18:38:48'),
(119, 'App\\Models\\User', 4, 'API TOKEN', '7c4301ae76bbb3307d60f8c7e0a8a0589ef248b3a60a78c19664daf1879870db', '[\"reset-password\"]', NULL, NULL, '2023-06-02 18:32:52', '2023-06-02 18:32:52'),
(120, 'App\\Models\\User', 4, 'API TOKEN', '985be39709ff4b0325aca5650352fa715bdc67191735df998250f96a67355e2f', '[\"reset-password\"]', NULL, NULL, '2023-06-02 18:32:57', '2023-06-02 18:32:57'),
(121, 'App\\Models\\User', 4, 'API TOKEN', '1930fe0989fbd59fecb19986b3f6eb60c3388a89e2ad437423604e8c7ee3bff9', '[\"reset-password\"]', NULL, NULL, '2023-06-02 18:37:21', '2023-06-02 18:37:21'),
(122, 'App\\Models\\User', 1, 'API TOKEN', 'f9a6282ef8c03298ec4b0d7ac00f8ccd3b91350af6829ad84d7c9188816f9221', '[\"otp-reset-password\"]', '2023-06-02 18:44:08', NULL, '2023-06-02 18:42:43', '2023-06-02 18:44:08'),
(123, 'App\\Models\\User', 1, 'API TOKEN', '579de53cd39faa81ab4f41bcce43a6c7180c8707a8f3f3ae2b7e109cee41bf09', '[\"reset-password\"]', NULL, NULL, '2023-06-02 18:43:30', '2023-06-02 18:43:30'),
(124, 'App\\Models\\User', 1, 'API TOKEN', 'e123b6595336ced91ebad2420398b9ac48d95e62637cb0fee9730f0cf44bed07', '[\"reset-password\"]', NULL, NULL, '2023-06-02 18:44:08', '2023-06-02 18:44:08'),
(125, 'App\\Models\\User', 4, 'API TOKEN', 'f39f3271aec8b43fc31b636fe47cc77eba5bf3122f4604456991c16153282b97', '[\"otp-reset-password\"]', '2023-06-02 19:14:53', NULL, '2023-06-02 19:14:13', '2023-06-02 19:14:53'),
(126, 'App\\Models\\User', 4, 'API TOKEN', '03c419e4439ba94c7b5ee01fdaedf5fea0a6c4b517f94ee64fbcb4a58781433f', '[\"reset-password\"]', '2023-06-02 19:15:07', NULL, '2023-06-02 19:14:53', '2023-06-02 19:15:07'),
(127, 'App\\Models\\User', 1, 'API TOKEN', '2c3d842949b22219e338dd70b24ba5045ceeb4ca648f09472b5fa18d58e01316', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-03 15:13:08', '2023-06-03 15:13:08'),
(128, 'App\\Models\\User', 1, 'API TOKEN', '3e05744e6a76daf504c8dd66ace9581315392b584d5abaea6d712ecc582865d8', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-03 15:22:02', '2023-06-03 15:22:02'),
(129, 'App\\Models\\User', 1, 'API TOKEN', '5ce044f3f8f5240d171e6b4cb1152ea9f51e50de602d41da83c901384d960b49', '[\"otp-reset-password\"]', '2023-06-03 15:46:24', NULL, '2023-06-03 15:24:19', '2023-06-03 15:46:24'),
(130, 'App\\Models\\User', 18, 'API TOKEN', '6a66944fd756b03a6674f01c5ac7511eb7d65e0ac5f565f3eb6ac36f2ffed2e2', '[\"otp\"]', '2023-06-03 16:04:06', NULL, '2023-06-03 15:58:17', '2023-06-03 16:04:06'),
(131, 'App\\Models\\User', 18, 'API TOKEN', '0ad8c90497b9714f7a43b2f63f1d3575f82f3f56764b4cc6ce673abfa320f4f9', '[\"user\"]', NULL, NULL, '2023-06-03 16:02:03', '2023-06-03 16:02:03'),
(132, 'App\\Models\\User', 18, 'API TOKEN', 'd9eabdbadbe605b19f0c1b48d44aae17c29506ce3ec415d99e37b1113f850684', '[\"user\"]', NULL, NULL, '2023-06-03 16:04:06', '2023-06-03 16:04:06'),
(133, 'App\\Models\\User', 18, 'API TOKEN', '666267d8d318402670329f6c7455308a867d2efcda5bc72912ed6173f19589e5', '[\"otp-reset-password\"]', '2023-06-03 16:04:53', NULL, '2023-06-03 16:04:39', '2023-06-03 16:04:53'),
(134, 'App\\Models\\User', 18, 'API TOKEN', '09c2746b914631811cd95fc0ab2eef2d8be2cf57d9cb66547e9d12b89e164f03', '[\"reset-password\"]', '2023-06-03 16:08:37', NULL, '2023-06-03 16:04:53', '2023-06-03 16:08:37'),
(135, 'App\\Models\\User', 18, 'API TOKEN', 'd1bc6de2229d6b4534c08dd4202528b0d1a9d30d1a1e95eafc156885931375a1', '[\"otp-reset-password\"]', '2023-06-03 16:10:55', NULL, '2023-06-03 16:10:36', '2023-06-03 16:10:55'),
(136, 'App\\Models\\User', 18, 'API TOKEN', '39559415b2808ec6479c484425501b7fd9766071bd26ec8d19590171904b3509', '[\"reset-password\"]', '2023-06-03 16:11:51', NULL, '2023-06-03 16:10:55', '2023-06-03 16:11:51'),
(137, 'App\\Models\\User', 18, 'API TOKEN', 'bab22e11401da3ddd1a23a355383b8084a31c95ba9f2a77c8e955d72122dc1dd', '[\"otp-reset-password\"]', '2023-06-03 16:16:57', NULL, '2023-06-03 16:16:46', '2023-06-03 16:16:57'),
(138, 'App\\Models\\User', 18, 'API TOKEN', '91e0bcff184f78a44019db24e21a701f9ba07802046b59d50619dbf7bf99d2bd', '[\"reset-password\"]', '2023-06-03 16:17:10', NULL, '2023-06-03 16:16:57', '2023-06-03 16:17:10'),
(139, 'App\\Models\\Admin', 3, 'API TOKEN', '44f1efe79490037d328e932fc876e6f4ee461d0c4f417db9ff9158a613069dfa', '[\"admin\"]', '2023-06-04 17:30:03', NULL, '2023-06-04 11:31:29', '2023-06-04 17:30:03'),
(140, 'App\\Models\\Admin', 2, 'API TOKEN', '3a6bf2f6f3540c64265e952d33fb9ec890fddc184f528fab3df250f37f199b5f', '[\"admin\"]', '2023-06-12 16:08:29', NULL, '2023-06-04 11:50:56', '2023-06-12 16:08:29'),
(141, 'App\\Models\\User', 19, 'API TOKEN', '1ee299d8e0c493b285ad57ef0fcd12e0d6c3a07c85eef3d9bacb2a755c29c68d', '[\"otp-update-social-phone\"]', '2023-06-05 08:49:43', NULL, '2023-06-04 16:31:23', '2023-06-05 08:49:43'),
(142, 'App\\Models\\User', 19, 'API TOKEN', '64dba5cb88f1b455607a9d4e61e952a7cc8d928921add4234b8f1a99788472d9', '[\"otp-update-social-phone\"]', '2023-06-04 16:32:50', NULL, '2023-06-04 16:32:16', '2023-06-04 16:32:50'),
(143, 'App\\Models\\User', 19, 'API TOKEN', 'a5b2416fe547a147c3ae6c551ff1a12a6790f9c8f3363cd9fffc39dc6fdf00d4', '[\"user\"]', NULL, NULL, '2023-06-04 16:32:50', '2023-06-04 16:32:50'),
(144, 'App\\Models\\User', 19, 'API TOKEN', '06feece6ac0d44081d2abe182f82c0886b51c6b745c9f746a5c807dfdf9d8fd8', '[\"user\"]', NULL, NULL, '2023-06-04 16:34:49', '2023-06-04 16:34:49'),
(145, 'App\\Models\\User', 4, 'API TOKEN', '19a4fc27fe246aabc27164368349952f6078da6a6515e851c50fb427ec04cf4c', '[\"otp-reset-password\"]', '2023-06-04 16:46:51', NULL, '2023-06-04 16:46:31', '2023-06-04 16:46:51'),
(146, 'App\\Models\\User', 4, 'API TOKEN', 'a50dcfca7cfe4684f30f3291e284e80d05a2e80dbcb610b0d16f66d9e7aa5525', '[\"reset-password\"]', '2023-06-04 16:47:12', NULL, '2023-06-04 16:46:51', '2023-06-04 16:47:12'),
(147, 'App\\Models\\User', 19, 'API TOKEN', '5cf037fdcee0ac86241a305f00d1d31ff834d7c324130c256aa37c2f43344b71', '[\"user\"]', NULL, NULL, '2023-06-04 21:24:32', '2023-06-04 21:24:32'),
(148, 'App\\Models\\User', 20, 'API TOKEN', '02e54be854fd9d3a3026c0102732a27ea88ad380f57f51f993aaba66585910dd', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-04 22:11:07', '2023-06-04 22:11:07'),
(149, 'App\\Models\\User', 20, 'API TOKEN', '6d65d41ffa3f99147eb94de1e1c755682f082e9d69a44b0fe4495d1462ebd00a', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-04 22:11:47', '2023-06-04 22:11:47'),
(150, 'App\\Models\\User', 20, 'API TOKEN', '4c6bb28dfb72b94b3cc74482c3bd312b9a6fe803a82288c4eb976977835a7c6f', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 08:46:14', '2023-06-05 08:46:14'),
(151, 'App\\Models\\User', 20, 'API TOKEN', '0f4963c12118c004d58c51e286f076b0fda8badd552f9ad955702ececf120f7c', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 08:46:14', '2023-06-05 08:46:14'),
(152, 'App\\Models\\User', 19, 'API TOKEN', '90604dd00a5df5197b68bb36fb9c437438a3de3d49c99c53342157f8c8be94dc', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 08:49:43', '2023-06-05 08:49:43'),
(153, 'App\\Models\\User', 20, 'API TOKEN', '86faba3c3fe3f67b14b3fe3770f6de1be68492d057014f9e7944d297375d80b1', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 08:56:45', '2023-06-05 08:56:45'),
(154, 'App\\Models\\User', 20, 'API TOKEN', '1c6cc322b17b717b4da3e489bc31bdbc0d208b9aae499ba493b0d2fa8b26a406', '[\"otp-update-social-phone\"]', '2023-06-05 09:01:49', NULL, '2023-06-05 09:01:41', '2023-06-05 09:01:49'),
(155, 'App\\Models\\User', 20, 'API TOKEN', 'fcbfb5ad9f00d368135a22a8b4cc3252d2752b6d6fa3fa7cab9ba9ea56b0999f', '[\"otp-update-social-phone\"]', '2023-06-05 09:02:41', NULL, '2023-06-05 09:01:49', '2023-06-05 09:02:41'),
(156, 'App\\Models\\User', 6, 'API TOKEN', '28de4b72e38c878deedad3734b8f0e2121b79557b35e908c3505b79a4498d8c2', '[\"user\"]', NULL, NULL, '2023-06-05 09:02:41', '2023-06-05 09:02:41'),
(157, 'App\\Models\\User', 6, 'API TOKEN', '8dfa8daad7ab644d052eb518b55aa7915c61c125928d6c7f60d012da227ca048', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 09:53:02', '2023-06-05 09:53:02'),
(158, 'App\\Models\\User', 6, 'API TOKEN', '7ea6538583b43dafa3540be05dffdf0ee2f11b57c9ac2f74e1a8b134401ea78e', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 09:54:57', '2023-06-05 09:54:57'),
(159, 'App\\Models\\User', 6, 'API TOKEN', 'd72d6f3b3a73c246cb9ac3ec8e7dbfe7b2468f9dcfbef64d60e2c34523459ff4', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 09:57:09', '2023-06-05 09:57:09'),
(160, 'App\\Models\\User', 21, 'API TOKEN', '9888442275a2515340653e6c286d6a0ab2eddf228247b6c152d01d1598cbb15a', '[\"otp-update-social-phone\"]', '2023-06-05 10:11:38', NULL, '2023-06-05 10:11:03', '2023-06-05 10:11:38'),
(161, 'App\\Models\\User', 21, 'API TOKEN', '2f2cdb62cc5c10b9c9478e5da206affb64fb006b19559d027041260386f2fdea', '[\"otp-update-social-phone\"]', '2023-06-05 10:12:01', NULL, '2023-06-05 10:11:38', '2023-06-05 10:12:01'),
(162, 'App\\Models\\User', 7, 'API TOKEN', '9c806dab3733a37896eab9d0315a994059caa3261ea4250c9fa335db9d698c38', '[\"user\"]', NULL, NULL, '2023-06-05 10:12:01', '2023-06-05 10:12:01'),
(163, 'App\\Models\\User', 7, 'API TOKEN', '7e11d244deb774d13ff7814a1405a7c9b9a4b712a25f9570166d1e60a09909a6', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 10:13:12', '2023-06-05 10:13:12'),
(164, 'App\\Models\\User', 19, 'API TOKEN', '157223cceaba721b49ec0abc7c2d49202543e33caa4b58c827eb346c7ca81d77', '[\"user\"]', NULL, NULL, '2023-06-05 10:15:12', '2023-06-05 10:15:12'),
(165, 'App\\Models\\User', 7, 'API TOKEN', 'ff0b1c1fc8b675a06b08a8c5f00149b2936fe57adf1a91cdb244c600896f1c59', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 10:16:17', '2023-06-05 10:16:17'),
(166, 'App\\Models\\User', 7, 'API TOKEN', 'bc4619a98e9c9cdbda6711033207dbae03905a87e0acdb7d8d462bdd13c91efb', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-05 10:35:49', '2023-06-05 10:35:49'),
(167, 'App\\Models\\User', 7, 'API TOKEN', '7a0e039ffdaec74b0e982597dac848c2ccf6f90f416113a4180a046adfc5081a', '[\"otp-update-social-phone\"]', '2023-06-05 10:43:15', NULL, '2023-06-05 10:40:39', '2023-06-05 10:43:15'),
(168, 'App\\Models\\User', 7, 'API TOKEN', '7c9e12a833946801e62af59d7ce33d1514563b397f93865c4980356c7c139f27', '[\"otp-update-social-phone\"]', '2023-06-05 10:50:25', NULL, '2023-06-05 10:43:15', '2023-06-05 10:50:25'),
(169, 'App\\Models\\Admin', 4, 'API TOKEN', '7bb294a16c93ffcd06610fcfb6025c10d747716c0b07a135f97fe8a25d7e2fe4', '[\"admin\"]', '2023-06-05 13:01:49', NULL, '2023-06-05 11:18:01', '2023-06-05 13:01:49'),
(170, 'App\\Models\\Admin', 2, 'API TOKEN', '1c24ecb3121cd11c7f6bb798f83c96d18acd738d2bb900f250ba53b3d65f2d9d', '[\"admin\"]', '2023-06-05 16:59:57', NULL, '2023-06-05 11:26:47', '2023-06-05 16:59:57'),
(171, 'App\\Models\\User', 22, 'API TOKEN', '111178d02b667860c1a20dc9ac2da2ed8e79e13fe5e3a7acfc9360270d68a05a', '[\"otp\"]', '2023-06-07 01:21:23', NULL, '2023-06-07 01:20:24', '2023-06-07 01:21:23'),
(172, 'App\\Models\\User', 22, 'API TOKEN', 'e8f72f156a6736f57119d49e5713892ea2a1266043e2ad42cb0f67f90fe1d08e', '[\"user\"]', NULL, NULL, '2023-06-07 01:21:23', '2023-06-07 01:21:23'),
(173, 'App\\Models\\User', 22, 'API TOKEN', '8b3d4ef5add0befaa04edc8976d2566479bfb83f93be2da9f0c0f7f727fb164e', '[\"user\"]', NULL, NULL, '2023-06-07 01:21:59', '2023-06-07 01:21:59'),
(174, 'App\\Models\\User', 22, 'API TOKEN', 'a6f0e5debab14850713ee4aa7cca5ddf6c32a75bb7dbffc5f12e57e55713b531', '[\"user\"]', NULL, NULL, '2023-06-07 01:22:08', '2023-06-07 01:22:08'),
(175, 'App\\Models\\User', 22, 'API TOKEN', '891ffe71cb3bd8a2bdfcc92583013ab549f89a7cb7de7a39235b21a91353e74a', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-07 01:28:30', '2023-06-07 01:28:30'),
(176, 'App\\Models\\User', 4, 'API TOKEN', '928ae36487d9401cedc5380fa99cfc5072f8bcb0d34229d87ecd320493966bfb', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-07 10:11:13', '2023-06-07 10:11:13'),
(177, 'App\\Models\\User', 1, 'API TOKEN', '18c0f46fc704920d95bd485c1708b447296503f5b6a0ba03994616495c004d3c', '[\"otp-reset-password\"]', NULL, NULL, '2023-06-07 10:11:41', '2023-06-07 10:11:41'),
(178, 'App\\Models\\User', 23, 'API TOKEN', '9bc6407a0a9a9cfaca7b131a3cbbe22e4cad488ae64c89642809a28c42187e99', '[\"otp\"]', '2023-06-07 10:33:52', NULL, '2023-06-07 10:22:26', '2023-06-07 10:33:52'),
(179, 'App\\Models\\User', 24, 'API TOKEN', '64e614958da23b325249d21777016bace9f7f7abc3bfbada665d0a736c828d11', '[\"otp-update-social-phone\"]', '2023-06-11 16:43:45', NULL, '2023-06-11 16:43:32', '2023-06-11 16:43:45'),
(180, 'App\\Models\\User', 24, 'API TOKEN', 'acac10d5e816ae4b5e82c42b04eae2205c82db32f40fb1db9b33e14fb8cbd8a7', '[\"otp-update-social-phone\"]', '2023-06-11 16:44:27', NULL, '2023-06-11 16:43:45', '2023-06-11 16:44:27'),
(181, 'App\\Models\\User', 24, 'API TOKEN', 'c555607d227d01744ff916437670253e667e816db016cf17300f0ae6b0b7ed91', '[\"user\"]', NULL, NULL, '2023-06-11 16:44:27', '2023-06-11 16:44:27'),
(182, 'App\\Models\\User', 24, 'API TOKEN', 'bfcbb99d5981015a89a60e2dfcb3acad3136770a53dfa0458bb5adff8c3cadb3', '[\"otp-reset-password\"]', '2023-06-11 16:53:48', NULL, '2023-06-11 16:53:24', '2023-06-11 16:53:48'),
(183, 'App\\Models\\User', 24, 'API TOKEN', 'fce830a3e38316f931d3785c52a46f5eb713378b229610213688645ada772fac', '[\"reset-password\"]', '2023-06-11 16:54:18', NULL, '2023-06-11 16:53:48', '2023-06-11 16:54:18'),
(184, 'App\\Models\\User', 25, 'API TOKEN', 'd04486e934bd6866a6fd218756121330bfb1d165619faf669d4ae7cbbfdaf31d', '[\"otp\"]', '2023-06-11 17:04:12', NULL, '2023-06-11 17:03:23', '2023-06-11 17:04:12'),
(185, 'App\\Models\\User', 25, 'API TOKEN', '8379cd44086177d85d522560594ef2910bd834b756823463765ec72414952708', '[\"user\"]', NULL, NULL, '2023-06-11 17:04:12', '2023-06-11 17:04:12'),
(186, 'App\\Models\\Admin', 2, 'API TOKEN', '29312832c5ec2bbfd2a2fcad9ef744e1b88c9ca02941b93c059ca75b58d80747', '[\"admin\"]', '2023-06-12 14:12:33', NULL, '2023-06-11 17:56:19', '2023-06-12 14:12:33'),
(187, 'App\\Models\\Admin', 2, 'API TOKEN', '908d7f6731c82c93fd9a861acf9c4edbc6db6b519b4ec3c5ee4aa09446b7a9a8', '[\"admin\"]', '2023-06-15 16:24:44', NULL, '2023-06-12 16:15:02', '2023-06-15 16:24:44'),
(188, 'App\\Models\\Admin', 2, 'API TOKEN', '42d4c58d62d5be38919258044d223e2f23ee3dacb621e199457574cd044f0216', '[\"admin\"]', '2023-06-12 16:21:47', NULL, '2023-06-12 16:21:22', '2023-06-12 16:21:47'),
(189, 'App\\Models\\Admin', 2, 'API TOKEN', 'a282d633c857a3c57b2fb2ce260a50fca38825c79320af88e315daecfb3efc43', '[\"admin\"]', '2023-06-12 16:51:09', NULL, '2023-06-12 16:22:03', '2023-06-12 16:51:09'),
(190, 'App\\Models\\User', 24, 'API TOKEN', 'c44f145a791cc9e1632435b7c399a3963d44f26134eabb4f3f143314a1e81f7a', '[\"otp-reset-password\"]', '2023-06-12 16:32:39', NULL, '2023-06-12 16:31:56', '2023-06-12 16:32:39'),
(191, 'App\\Models\\User', 24, 'API TOKEN', '7665cf9489abb7f296796ba0457331c005a34ffd931e042d3f69f6b587f8ddff', '[\"reset-password\"]', NULL, NULL, '2023-06-12 16:32:39', '2023-06-12 16:32:39'),
(192, 'App\\Models\\Admin', 2, 'API TOKEN', '8a45ace4dc7237f8dc14b7ad8dfa60d8f61f9917efe015a0b1d719c31b129bf2', '[\"admin\"]', '2023-06-12 18:32:19', NULL, '2023-06-12 17:26:04', '2023-06-12 18:32:19'),
(193, 'App\\Models\\Admin', 2, 'API TOKEN', '8e036f267a0e48f1db717686b32f0462bbea13f037ba184946fb018139be672c', '[\"admin\"]', '2023-06-12 18:36:26', NULL, '2023-06-12 17:29:21', '2023-06-12 18:36:26'),
(194, 'App\\Models\\Admin', 2, 'API TOKEN', 'dcf18a94c559e9b517fc1e692741a2ee359f1fed8c102441bff505d52e89ccf4', '[\"admin\"]', '2023-06-18 11:31:59', NULL, '2023-06-13 11:22:30', '2023-06-18 11:31:59'),
(195, 'App\\Models\\User', 22, 'API TOKEN', 'f20e2ba197540c5028b28547fc26b63128ccf19a3a0de94975ff071932a7b446', '[\"otp-reset-password\"]', '2023-06-13 23:23:10', NULL, '2023-06-13 23:21:53', '2023-06-13 23:23:10'),
(196, 'App\\Models\\User', 22, 'API TOKEN', 'f3d2dfb0ab74fe455f69103a7f731bb43cf0469d811d9b633e3ac4a35de5b3d0', '[\"reset-password\"]', NULL, NULL, '2023-06-13 23:23:10', '2023-06-13 23:23:10'),
(197, 'App\\Models\\User', 26, 'API TOKEN', '08d940b7ee05592dc667e67ede95b511a91212f7d5eb3b08ae77861739122e77', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-06-25 05:10:46', '2023-06-25 05:10:46'),
(198, 'App\\Models\\User', 27, 'API TOKEN', 'fb18b8f6c19982fe47884f6e30415319d710118b57ab6579d159c6c6b015eed7', '[\"otp-update-social-phone\"]', '2023-07-05 12:10:41', NULL, '2023-07-05 12:10:35', '2023-07-05 12:10:41'),
(199, 'App\\Models\\User', 27, 'API TOKEN', 'bdddbf7ccf32c01df789543a285a5cd2534d43c7a8e853950fe27edafde610e4', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-07-05 12:10:42', '2023-07-05 12:10:42'),
(200, 'App\\Models\\Admin', 2, 'API TOKEN', '3ccc7bacf4fca050c77ef5f0bbab00aeb1605b28e1663f243aa66b0b1c200729', '[\"admin\"]', '2023-07-17 11:33:39', NULL, '2023-07-09 11:44:21', '2023-07-17 11:33:39'),
(201, 'App\\Models\\Admin', 2, 'API TOKEN', '5df9d0da0a2b151c96d96665b75e645897793311dc788938b4e7522e5ddd91be', '[\"admin\"]', '2023-07-09 12:22:36', NULL, '2023-07-09 12:20:32', '2023-07-09 12:22:36'),
(202, 'App\\Models\\Admin', 2, 'API TOKEN', 'b0b291098b7e37b55103561dfd8b6ffe7f46665d4c12646193d92321e0d33c8c', '[\"admin\"]', '2023-07-09 12:24:52', NULL, '2023-07-09 12:24:51', '2023-07-09 12:24:52'),
(203, 'App\\Models\\Admin', 2, 'API TOKEN', '82f006db63670a589efe7e957e19f00f2614246ccd330d8a369ecf2fd9e2aa3b', '[\"admin\"]', '2023-07-09 12:36:58', NULL, '2023-07-09 12:36:56', '2023-07-09 12:36:58'),
(204, 'App\\Models\\Admin', 2, 'API TOKEN', '58b91eff8597c3b1f43bc5548a673967294b870368100e299c0dea828339bbc5', '[\"admin\"]', '2023-07-09 12:38:49', NULL, '2023-07-09 12:38:48', '2023-07-09 12:38:49'),
(205, 'App\\Models\\Admin', 2, 'API TOKEN', '4405b458418792c54384e7671688194e2a171b6cb1f095b434fbbe307fe5a894', '[\"admin\"]', '2023-07-09 12:41:05', NULL, '2023-07-09 12:41:03', '2023-07-09 12:41:05'),
(206, 'App\\Models\\Admin', 2, 'API TOKEN', '418cd55c23a900d33f6a707ca5e26014f2c854e0a310aae7705bb962f74a005d', '[\"admin\"]', '2023-07-09 12:42:00', NULL, '2023-07-09 12:41:59', '2023-07-09 12:42:00'),
(207, 'App\\Models\\Admin', 2, 'API TOKEN', '81db6f152f9570e391970a2dbe6f954b31a226e526781f496e7bd3dcff08fcfc', '[\"admin\"]', '2023-07-09 12:45:54', NULL, '2023-07-09 12:43:48', '2023-07-09 12:45:54'),
(208, 'App\\Models\\Admin', 2, 'API TOKEN', '0b2f56b11ceae2962939d89198e5c6473e8e168eb4846a2a83a119403efe1431', '[\"admin\"]', '2023-07-09 12:46:56', NULL, '2023-07-09 12:46:54', '2023-07-09 12:46:56'),
(209, 'App\\Models\\Admin', 2, 'API TOKEN', '3110503f2ac65f0f8b3bee14b186579110d7ef80e8d6126931b7dd9f1a4869ec', '[\"admin\"]', '2023-07-09 12:52:34', NULL, '2023-07-09 12:52:32', '2023-07-09 12:52:34'),
(210, 'App\\Models\\Admin', 2, 'API TOKEN', '9a18908a1b089dbf5687f8521205e8006279229d30b172e8b17a5e8015b3ad04', '[\"admin\"]', '2023-07-09 12:55:23', NULL, '2023-07-09 12:55:21', '2023-07-09 12:55:23'),
(211, 'App\\Models\\Admin', 2, 'API TOKEN', '630f403dc8ea5878cf8b46ed7536c60633f793a8e3f52c3ae465fece44ce01dc', '[\"admin\"]', '2023-07-09 12:59:21', NULL, '2023-07-09 12:55:51', '2023-07-09 12:59:21'),
(212, 'App\\Models\\Admin', 2, 'API TOKEN', '6240d9c8187d81471fd71edfeae470cfe6ab3cca75592ac01f524ee4d9b3b6bb', '[\"admin\"]', '2023-07-09 13:04:48', NULL, '2023-07-09 13:04:17', '2023-07-09 13:04:48'),
(213, 'App\\Models\\Admin', 2, 'API TOKEN', '04a5264d60e15dd5b94df8157e27fd2628adcb72cf078cd78043e0e3de4d5d11', '[\"admin\"]', '2023-07-09 13:21:27', NULL, '2023-07-09 13:21:25', '2023-07-09 13:21:27'),
(214, 'App\\Models\\Admin', 2, 'API TOKEN', '348acbc64601fcb8b31260fe8a1bbaa5c2f77455d78b0357617dc93a44996520', '[\"admin\"]', '2023-07-09 13:22:04', NULL, '2023-07-09 13:22:03', '2023-07-09 13:22:04'),
(215, 'App\\Models\\Admin', 2, 'API TOKEN', 'e357ad0f52ea3e796f13b73f949685f8548b48cc398a7db2360dd3bb283a8394', '[\"admin\"]', '2023-07-09 13:23:58', NULL, '2023-07-09 13:23:56', '2023-07-09 13:23:58'),
(216, 'App\\Models\\Admin', 2, 'API TOKEN', '011f4ca7e6111af407a48f290027964d52986c63c98762fa8fee91be7cd19c8d', '[\"admin\"]', '2023-07-09 13:24:23', NULL, '2023-07-09 13:24:19', '2023-07-09 13:24:23'),
(217, 'App\\Models\\Admin', 2, 'API TOKEN', 'a5268db3393c7ea9f1eaa2fd65cba6c6548997bfdfb8dd948a2d933ece2aa2d5', '[\"admin\"]', '2023-07-17 11:33:48', NULL, '2023-07-17 11:33:42', '2023-07-17 11:33:48'),
(218, 'App\\Models\\Admin', 2, 'API TOKEN', '31b450cc58f3129a99a70b2765fd8b83aa1f885d80fe3f8e2eed2f20a2e5e0b2', '[\"admin\"]', '2023-07-17 12:10:41', NULL, '2023-07-17 11:37:37', '2023-07-17 12:10:41'),
(219, 'App\\Models\\User', 23, 'API TOKEN', '70df6ef2873c0723387fabdecb54fc43a725c542854f0c19c6662cd1d9beed45', '[\"otp\"]', '2023-07-19 16:10:24', NULL, '2023-07-19 16:09:45', '2023-07-19 16:10:24'),
(221, 'App\\Models\\User', 23, 'API TOKEN', '57c778762deca3c3078fd0ba4ba6425187f183df4fb999be3de13970d2d37035', '[\"user\"]', NULL, NULL, '2023-07-24 14:39:23', '2023-07-24 14:39:23'),
(222, 'App\\Models\\User', 23, 'API TOKEN', 'fea632faf86d15d0a05996fcf22a22926c5c92851f6afc35481b5e8465d566b7', '[\"user\"]', NULL, NULL, '2023-08-08 23:16:59', '2023-08-08 23:16:59'),
(223, 'App\\Models\\User', 23, 'API TOKEN', 'ea3fd9858aa1a99771f0dfcc8e05235d2bfa0d112ea782a5e620530db7090897', '[\"user\"]', NULL, NULL, '2023-08-08 23:20:02', '2023-08-08 23:20:02'),
(224, 'App\\Models\\User', 23, 'API TOKEN', '019cf86dd49ddb81a49b175bb1208dd565ca0db622faf19f0daf663173e3ecaf', '[\"user\"]', NULL, NULL, '2023-08-09 00:03:24', '2023-08-09 00:03:24'),
(225, 'App\\Models\\User', 23, 'API TOKEN', 'b7d2161d91c8a11e70510c926ac48d4860ced4c721a9492ea6c5498e08a8c806', '[\"user\"]', '2023-08-15 19:11:31', NULL, '2023-08-09 00:06:52', '2023-08-15 19:11:31'),
(226, 'App\\Models\\Admin', 2, 'API TOKEN', '48dab0b929678b351a6bf2992115bfcc7e01ae5e8a82133cae21c302f405a145', '[\"admin\"]', '2023-08-09 17:25:14', NULL, '2023-08-09 14:17:03', '2023-08-09 17:25:14'),
(227, 'App\\Models\\Admin', 2, 'API TOKEN', '2215c6ab81eee40810f1570927557e4ea5cef33469856aa8001f7be409cf4be9', '[\"admin\"]', '2023-08-15 14:15:03', NULL, '2023-08-14 14:18:59', '2023-08-15 14:15:03'),
(228, 'App\\Models\\Admin', 2, 'API TOKEN', 'c365b1affa8a520a59045a141bc244d9d0013f4ded021cdb47835150cba78353', '[\"admin\"]', '2023-08-24 18:12:16', NULL, '2023-08-14 15:31:12', '2023-08-24 18:12:16'),
(229, 'App\\Models\\User', 23, 'API TOKEN', '10b9d05a70e95898862a501c810d93d93e85fce9a9f255626bc380b43058945e', '[\"user\"]', '2023-08-22 22:18:26', NULL, '2023-08-15 19:31:08', '2023-08-22 22:18:26'),
(230, 'App\\Models\\Admin', 2, 'API TOKEN', '14bd7b1a78e1fe870b5e48d518f90963aea61a5d5c323ccb880434d46624485c', '[\"admin\"]', '2023-08-27 11:17:23', NULL, '2023-08-16 12:26:03', '2023-08-27 11:17:23'),
(231, 'App\\Models\\Admin', 2, 'API TOKEN', '158890f9a8fb8d60ac12f6ab27423cb3ad5135e357549559af33ebf2ef6d9f49', '[\"admin\"]', NULL, NULL, '2023-08-16 14:14:26', '2023-08-16 14:14:26'),
(232, 'App\\Models\\Admin', 2, 'API TOKEN', 'c4e389b5ba1769d729192d167eec9431df21d50b1313c0f080bdd3ce3387d4ed', '[\"admin\"]', '2023-08-28 11:48:21', NULL, '2023-08-16 14:14:46', '2023-08-28 11:48:21'),
(233, 'App\\Models\\User', 23, 'API TOKEN', '4a7fc0c5f431f466cb3841785987daccdac69eeef0ff96f7d628edd429ed8304', '[\"user\"]', '2023-08-30 00:58:38', NULL, '2023-08-22 22:39:48', '2023-08-30 00:58:38'),
(234, 'App\\Models\\User', 23, 'API TOKEN', '0bcccbdcd2e08a5b6ff927007dc5cde4f92ae550d91144cfbe24e64676363ed1', '[\"user\"]', NULL, NULL, '2023-08-23 23:21:10', '2023-08-23 23:21:10'),
(235, 'App\\Models\\User', 23, 'API TOKEN', '5cc1052cf715e5de1f3f7dd10749851ddcecae3c69b0753d07a27a2e8be9cd5d', '[\"user\"]', '2023-08-31 16:17:05', NULL, '2023-08-23 23:21:58', '2023-08-31 16:17:05'),
(236, 'App\\Models\\Admin', 2, 'API TOKEN', '253a80c8bca4c4aad824b614dd70e11d459f973ce60401d0ff3344af403370d3', '[\"admin\"]', '2023-08-27 11:23:27', NULL, '2023-08-27 11:17:47', '2023-08-27 11:23:27'),
(237, 'App\\Models\\User', 27, 'API TOKEN', '579a7ffcd581fc7d6dc5c9a001cb2c36cb49d24323b48d606f8dfa6af72e007b', '[\"otp-update-social-phone\"]', '2023-08-29 15:41:38', NULL, '2023-08-29 15:41:33', '2023-08-29 15:41:38'),
(238, 'App\\Models\\User', 27, 'API TOKEN', 'c081d4a1d7abffbcb95b40e75286765d4960e580775511bd559fb9e23183ba0a', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-08-29 15:41:38', '2023-08-29 15:41:38'),
(239, 'App\\Models\\User', 27, 'API TOKEN', 'd3adbadad0582d5e918c32042ca4ea27c7a305189ed1a1e5d14ba5aa49981e75', '[\"otp-update-social-phone\"]', '2023-08-30 13:00:08', NULL, '2023-08-30 10:24:25', '2023-08-30 13:00:08'),
(240, 'App\\Models\\User', 27, 'API TOKEN', '68f65cc82abd9fe9d4b6c1110b6864f0e3b269c16593d47281918ca55bd0bf83', '[\"otp-update-social-phone\"]', NULL, NULL, '2023-08-30 10:24:32', '2023-08-30 10:24:32'),
(241, 'App\\Models\\User', 28, 'API TOKEN', 'e8ed201c8c4d766de2bf9fbf126ed3d8420fbfdbc061d3a599e7943c9e96ae74', '[\"otp\"]', NULL, NULL, '2023-08-30 11:01:59', '2023-08-30 11:01:59'),
(242, 'App\\Models\\User', 29, 'API TOKEN', '1953d9b6623e467687f1fd1ffbb6d48eb35eca92699991ffdd909b02c5462bb2', '[\"otp\"]', NULL, NULL, '2023-08-30 11:05:05', '2023-08-30 11:05:05'),
(243, 'App\\Models\\User', 30, 'API TOKEN', '128152fd9adec937d9cdbeb6324cb563380f5f9f1d8410be6f62acf90137a68a', '[\"otp\"]', NULL, NULL, '2023-08-30 11:35:07', '2023-08-30 11:35:07'),
(244, 'App\\Models\\User', 31, 'API TOKEN', '96f841d92b86e47ea999959353d5c240bd7a3607859bff038285210484470896', '[\"otp\"]', NULL, NULL, '2023-08-30 11:35:20', '2023-08-30 11:35:20'),
(245, 'App\\Models\\Admin', 2, 'API TOKEN', 'cfbaea5eeb6472523a6f50627147a6a46a2137ff761db452f1fb32f5a359198e', '[\"admin\"]', '2023-08-31 17:52:28', NULL, '2023-08-30 12:45:26', '2023-08-31 17:52:28'),
(246, 'App\\Models\\Admin', 2, 'API TOKEN', '1746ab4f1d5fb5c2ee85cd7e007ccfddb8555b344632e66dc6fa05170dfb3df2', '[\"admin\"]', '2023-08-31 16:22:32', NULL, '2023-08-30 12:53:31', '2023-08-31 16:22:32'),
(247, 'App\\Models\\User', 32, 'API TOKEN', '0361abba36c4d99e47d0fa7d2aaf4dddbd3bff039246691bb1dab6cba7976bcb', '[\"otp\"]', '2023-08-30 12:58:42', NULL, '2023-08-30 12:57:27', '2023-08-30 12:58:42'),
(248, 'App\\Models\\User', 32, 'API TOKEN', 'cee15803d0cfce10d1c4978a80f7d424bf2e0aa2a6c3178901bc9b9ff9aa93aa', '[\"user\"]', NULL, NULL, '2023-08-30 12:58:42', '2023-08-30 12:58:42'),
(249, 'App\\Models\\Admin', 2, 'API TOKEN', '7981fde170183d00fb74fcc125f1ab51646d08cf65464dbcfee3c6fd300f6118', '[\"admin\"]', '2023-09-03 11:12:20', NULL, '2023-08-30 14:48:03', '2023-09-03 11:12:20'),
(250, 'App\\Models\\User', 27, 'API TOKEN', '885d4bbe9ffa07da33a11a09dac5015a23c7ba0668a30c7f47c7cc0f98e48bf6', '[\"otp-update-social-phone\"]', '2023-10-11 11:23:40', NULL, '2023-08-31 14:12:29', '2023-10-11 11:23:40'),
(251, 'App\\Models\\User', 27, 'API TOKEN', 'f1487b70bf5fdc4f937072cd4de8c32f8fc95ad78a366ee13a38e7fac7a985e3', '[\"otp-update-social-phone\"]', '2023-08-31 14:13:49', NULL, '2023-08-31 14:12:35', '2023-08-31 14:13:49'),
(252, 'App\\Models\\Admin', 2, 'API TOKEN', 'd8153fd5b7847ada5786d91ebf708c600ed91b842939d3da7a88ac8d0b47f7b1', '[\"admin\"]', '2023-08-31 16:22:55', NULL, '2023-08-31 16:22:54', '2023-08-31 16:22:55'),
(253, 'App\\Models\\Admin', 2, 'API TOKEN', 'c2ec6b3ab29e93566601039d49667c8147cbdcc3ec1736d6d33d6b482cf73a3f', '[\"admin\"]', '2023-08-31 16:23:50', NULL, '2023-08-31 16:23:49', '2023-08-31 16:23:50'),
(254, 'App\\Models\\Admin', 2, 'API TOKEN', 'ce0371bc7ca01157a93760a6d53c424cbd5528fd48ab5a168420903568339abc', '[\"admin\"]', '2023-08-31 16:24:12', NULL, '2023-08-31 16:24:11', '2023-08-31 16:24:12');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(255, 'App\\Models\\Admin', 2, 'API TOKEN', 'a0af612b464f21a20c80dadf115daa1212f19c64631868cbe179335aa4437c65', '[\"admin\"]', '2023-08-31 16:25:49', NULL, '2023-08-31 16:25:48', '2023-08-31 16:25:49'),
(256, 'App\\Models\\User', 23, 'API TOKEN', '3a0a738318a96a9396e38607b134093e9e66da7ef8d5b21e2add5a97bfcd153c', '[\"user\"]', '2023-08-31 16:31:14', NULL, '2023-08-31 16:27:36', '2023-08-31 16:31:14'),
(257, 'App\\Models\\Admin', 2, 'API TOKEN', 'ae62ba37e3acbce796d912f8a8798db665974235efce32697bc92288360bbebf', '[\"admin\"]', '2023-08-31 16:35:27', NULL, '2023-08-31 16:34:51', '2023-08-31 16:35:27'),
(258, 'App\\Models\\Admin', 2, 'API TOKEN', 'ab4f33b5dfa89af767bec3d969699cfeaf2926814b129f06d0ac862eb40be4e6', '[\"admin\"]', '2023-08-31 16:37:02', NULL, '2023-08-31 16:36:58', '2023-08-31 16:37:02'),
(259, 'App\\Models\\Admin', 2, 'API TOKEN', 'b9f80d383c9a75f0a49548e19f04c6ffd0d87d881f509b8e993fc53a772a6ee2', '[\"admin\"]', '2023-08-31 16:56:17', NULL, '2023-08-31 16:40:36', '2023-08-31 16:56:17'),
(260, 'App\\Models\\Admin', 2, 'API TOKEN', '18fd8c8aafaa80d32281884b185ae8554a05ee0de92ee8fc7630dff3e42be9f6', '[\"admin\"]', '2023-09-07 13:59:24', NULL, '2023-08-31 16:58:21', '2023-09-07 13:59:24'),
(261, 'App\\Models\\Admin', 2, 'API TOKEN', '5a17a8fd156ac195b792eadf2c2b3ecbbe217b41cb629cd97e02f652c5ee43b3', '[\"admin\"]', '2023-09-13 13:01:01', NULL, '2023-09-03 13:25:36', '2023-09-13 13:01:01'),
(262, 'App\\Models\\Admin', 2, 'API TOKEN', 'a1046a0a8fb95e109fd9805f63a05d04180c1f550deb1c05fdceffa193a61520', '[\"admin\"]', '2023-09-12 16:22:26', NULL, '2023-09-03 13:59:34', '2023-09-12 16:22:26'),
(263, 'App\\Models\\Admin', 2, 'API TOKEN', '4a45eb875df9d6df99bb987a8b041df85cb71c0d95f5c8df69d065d36fbc7c24', '[\"admin\"]', '2023-09-07 11:43:53', NULL, '2023-09-05 11:16:41', '2023-09-07 11:43:53'),
(264, 'App\\Models\\Admin', 2, 'API TOKEN', '7ac75887f0389de50a57630cd952e2bd16cba5cee84606c6345934d67de28613', '[\"admin\"]', '2023-09-10 17:07:06', NULL, '2023-09-05 11:26:06', '2023-09-10 17:07:06'),
(265, 'App\\Models\\User', 33, 'API TOKEN', '168e99a64b996747c0eeb2f84f8eebfcc78c6db68e79c9206de7a3b30f58b2b9', '[\"otp\"]', NULL, NULL, '2023-09-05 12:54:09', '2023-09-05 12:54:09'),
(266, 'App\\Models\\User', 34, 'API TOKEN', '8871e05e972e6501027b7aa255654300059c579fb11f3a86c175b9e678102dcf', '[\"otp\"]', NULL, NULL, '2023-09-05 13:02:36', '2023-09-05 13:02:36'),
(267, 'App\\Models\\User', 35, 'API TOKEN', '84972970449d28d9f09de82fda3b8bf7a51cc0f7f7e9e837a5d0bb1c29e55ddb', '[\"otp\"]', NULL, NULL, '2023-09-05 13:20:09', '2023-09-05 13:20:09'),
(268, 'App\\Models\\User', 36, 'API TOKEN', 'dd0c230dd0b01cef0c8108258bf56ba47026990772c3058480ae0a3bd47064be', '[\"otp\"]', NULL, NULL, '2023-09-05 13:24:22', '2023-09-05 13:24:22'),
(269, 'App\\Models\\User', 37, 'API TOKEN', 'd5a77b168d5c4bc63e54844a39302a125142320c07dc49b6e08fd1a4f0d5e5a7', '[\"otp\"]', NULL, NULL, '2023-09-05 13:24:43', '2023-09-05 13:24:43'),
(270, 'App\\Models\\User', 38, 'API TOKEN', '1edb7fe7a91c130a886496cc3b1e9b4d52c82bc500e53d69bded4e703972d1cb', '[\"otp\"]', NULL, NULL, '2023-09-05 13:25:00', '2023-09-05 13:25:00'),
(271, 'App\\Models\\User', 39, 'API TOKEN', '4a5544555ca4d991f9208b5e96984cdf9d2039ce686ca0bd055c104e964f49a4', '[\"otp\"]', NULL, NULL, '2023-09-05 13:25:19', '2023-09-05 13:25:19'),
(272, 'App\\Models\\User', 40, 'API TOKEN', '0834131e3ca849ea3163949506ebbb07d0482acdefec6b12324fc888d39c6304', '[\"otp\"]', NULL, NULL, '2023-09-05 13:32:44', '2023-09-05 13:32:44'),
(273, 'App\\Models\\User', 41, 'API TOKEN', 'adafaf61607f789e9fe094e7922b15b5be674798c45eb677fd58551b052e9e31', '[\"otp\"]', NULL, NULL, '2023-09-05 13:32:58', '2023-09-05 13:32:58'),
(274, 'App\\Models\\User', 42, 'API TOKEN', 'a73e6a53699c82a3257efc8c0b2e8a9b5c73976041c40152ae5fc74c889a1bd1', '[\"otp\"]', NULL, NULL, '2023-09-05 13:33:30', '2023-09-05 13:33:30'),
(275, 'App\\Models\\User', 43, 'API TOKEN', '808b921d3fb2083b0a72a5faecaf869a27f4fe92aa9c0c9adb5b63183a877567', '[\"otp\"]', NULL, NULL, '2023-09-05 13:34:44', '2023-09-05 13:34:44'),
(276, 'App\\Models\\User', 33, 'API TOKEN', '451832e678c245fc66010d4f6cbf6b4bc58e6da5ff1fe48c954ef8785e36eec8', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-05 13:51:01', '2023-09-05 13:51:01'),
(277, 'App\\Models\\User', 44, 'API TOKEN', 'e83f545468dc088f70c869c7c86c48b5f3d4ec46a579705ea845522e00f4e691', '[\"otp\"]', '2023-09-05 14:14:24', NULL, '2023-09-05 14:03:39', '2023-09-05 14:14:24'),
(278, 'App\\Models\\User', 45, 'API TOKEN', '3a4afd4a87e2af117bc6d297415abe2c2a8e34001b7d77b9cdb5c8b2a0de1396', '[\"otp\"]', NULL, NULL, '2023-09-05 14:04:38', '2023-09-05 14:04:38'),
(279, 'App\\Models\\User', 46, 'API TOKEN', '66148178be425c225be532b538aeddecee9f968fb3a6bea759845b55e36c6e46', '[\"otp\"]', NULL, NULL, '2023-09-05 14:05:51', '2023-09-05 14:05:51'),
(280, 'App\\Models\\User', 44, 'API TOKEN', '4c743c86c06f0a3b8b240e39875f7cca4f0e47edc8e81b453f4d5678b15a4ead', '[\"otp\"]', NULL, NULL, '2023-09-05 14:10:42', '2023-09-05 14:10:42'),
(281, 'App\\Models\\User', 44, 'API TOKEN', 'aead6ce92f6d98bb017e87222ed940c949058a98ac1f911939bcd68d44aa94a4', '[\"otp\"]', NULL, NULL, '2023-09-05 14:11:58', '2023-09-05 14:11:58'),
(282, 'App\\Models\\User', 47, 'API TOKEN', '488ca81a540b940b33918f4744a5b4f891c8424f1c87b2b22b41bac91404c9c4', '[\"otp\"]', '2023-09-05 14:16:10', NULL, '2023-09-05 14:13:12', '2023-09-05 14:16:10'),
(283, 'App\\Models\\User', 46, 'API TOKEN', '77ae10cddfdce5e024eed9db75715233cd4303eedf7242fb4ee094d48ac298f2', '[\"otp\"]', '2023-09-05 14:15:31', NULL, '2023-09-05 14:15:08', '2023-09-05 14:15:31'),
(284, 'App\\Models\\User', 46, 'API TOKEN', 'c31a3152abe04af264d33a3df3998d97aae8ef7e402d4f96f8c3a7d98a776759', '[\"user\"]', NULL, NULL, '2023-09-05 14:15:31', '2023-09-05 14:15:31'),
(285, 'App\\Models\\User', 48, 'API TOKEN', '430d912b04b0281d0f830a7503e610e902421fd6ad47ef5b4a7ebedc9524773c', '[\"otp\"]', '2023-09-05 14:32:45', NULL, '2023-09-05 14:31:53', '2023-09-05 14:32:45'),
(286, 'App\\Models\\User', 48, 'API TOKEN', '367cdcae9e1d28894fd07b6a511ca1a98446d6d4ca106620dfb8845e039ff732', '[\"user\"]', NULL, NULL, '2023-09-05 14:32:45', '2023-09-05 14:32:45'),
(287, 'App\\Models\\User', 49, 'API TOKEN', '3d9084d8b5f2a672f11f03a0c8f29604e996320e5891311a736470319a0f6ae9', '[\"otp\"]', '2023-09-05 14:35:13', NULL, '2023-09-05 14:34:41', '2023-09-05 14:35:13'),
(288, 'App\\Models\\User', 49, 'API TOKEN', '9bb70b6015cdf57cbdf93de81db2e6a48f529a85957a9f37a4474265186c70f3', '[\"user\"]', NULL, NULL, '2023-09-05 14:35:13', '2023-09-05 14:35:13'),
(289, 'App\\Models\\User', 50, 'API TOKEN', '2e9e0dcf43de0c808a0b849a68ebbed7122226f2e4e3bdce89b543db5b8dd0d1', '[\"otp\"]', NULL, NULL, '2023-09-05 14:44:50', '2023-09-05 14:44:50'),
(290, 'App\\Models\\User', 51, 'API TOKEN', '962149cbd1b96dc673786cd3bb0830fb6d33042560fcf4442933f0cafd13cffb', '[\"otp\"]', NULL, NULL, '2023-09-05 14:45:38', '2023-09-05 14:45:38'),
(291, 'App\\Models\\User', 52, 'API TOKEN', 'd10b85d26d3ff7e886ed46f001ac065f0b2c3f863e2f4bb84482d59afe3791d1', '[\"otp\"]', NULL, NULL, '2023-09-05 14:47:35', '2023-09-05 14:47:35'),
(292, 'App\\Models\\User', 53, 'API TOKEN', '4ba8ef551f58831720c188444281ac476f7e9d6c9eed8ac066ec2e832861a460', '[\"otp\"]', '2023-09-05 15:01:28', NULL, '2023-09-05 14:53:42', '2023-09-05 15:01:28'),
(293, 'App\\Models\\User', 54, 'API TOKEN', 'fe2a22d094c6cb72398e70b21356e5056b73f6588d2709b5186f2cf5ab6980b8', '[\"otp\"]', NULL, NULL, '2023-09-05 14:59:41', '2023-09-05 14:59:41'),
(294, 'App\\Models\\User', 55, 'API TOKEN', 'b526487ef397c6c1f463bbd7c50cc2b551e7a709902c85a22eb6a3f7a8678b3a', '[\"otp\"]', '2023-09-05 15:05:35', NULL, '2023-09-05 15:05:16', '2023-09-05 15:05:35'),
(295, 'App\\Models\\User', 56, 'API TOKEN', 'c692a8d6ddbdca0b5c2232b33af11d887e7dd90c7204f6a618460c35b6b43c52', '[\"otp\"]', '2023-09-05 15:08:18', NULL, '2023-09-05 15:08:14', '2023-09-05 15:08:18'),
(296, 'App\\Models\\User', 57, 'API TOKEN', '2fb3173e6459462e78644fe42eda74d0a301bd3bf7e1e0fe4c161095b0088291', '[\"otp\"]', '2023-09-05 15:10:56', NULL, '2023-09-05 15:08:37', '2023-09-05 15:10:56'),
(297, 'App\\Models\\User', 57, 'API TOKEN', '56199a167d6c12dedc56ed001ee33ce40c22616bd1dfbf980d5a526e9fb0c82f', '[\"user\"]', NULL, NULL, '2023-09-05 15:10:56', '2023-09-05 15:10:56'),
(298, 'App\\Models\\User', 58, 'API TOKEN', 'b7b46f22d8006421bfd66bae19c761bbad697063048b584a234fc089a8583d82', '[\"otp\"]', NULL, NULL, '2023-09-05 15:35:01', '2023-09-05 15:35:01'),
(299, 'App\\Models\\User', 59, 'API TOKEN', '446be97166e0b9e75bfd27781ef9be2d73cbfc5b517dfb0b6233137292179f8c', '[\"otp\"]', NULL, NULL, '2023-09-05 15:35:11', '2023-09-05 15:35:11'),
(300, 'App\\Models\\User', 60, 'API TOKEN', '1609a7e969272f315648c512c969bd268e3ffa81795b2126be4c283d5e87a247', '[\"otp\"]', NULL, NULL, '2023-09-05 15:35:35', '2023-09-05 15:35:35'),
(301, 'App\\Models\\User', 49, 'API TOKEN', '5dce5898c7a5f57bcce23b6f210d6203e7d2f1ec9e5f0f7ae1ae89717d2e5159', '[\"user\"]', '2023-09-05 15:41:39', NULL, '2023-09-05 15:36:31', '2023-09-05 15:41:39'),
(302, 'App\\Models\\User', 49, 'API TOKEN', '9f2cfdb4c880c81eb162c9dc12a0d80ed0dcd7d5f084e2bc403df3ade08b3748', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-05 15:50:51', '2023-09-05 15:50:51'),
(303, 'App\\Models\\User', 49, 'API TOKEN', '6889ba847f4765041618465caa581ea956e23d701b4927178643b0526bbce714', '[\"otp-reset-password\"]', '2023-09-05 15:52:31', NULL, '2023-09-05 15:52:17', '2023-09-05 15:52:31'),
(304, 'App\\Models\\User', 49, 'API TOKEN', '84d253fff14d4e1c09ee6fefefcccd18af72f1071fe666fffb1b0005870470e9', '[\"reset-password\"]', '2023-09-05 15:52:43', NULL, '2023-09-05 15:52:31', '2023-09-05 15:52:43'),
(305, 'App\\Models\\User', 61, 'API TOKEN', 'dbd4f9d5b867b395ec217fb2b39d221b25c4be55fcc2ff46ac24ed4f1414f82f', '[\"otp\"]', NULL, NULL, '2023-09-05 15:53:44', '2023-09-05 15:53:44'),
(306, 'App\\Models\\User', 62, 'API TOKEN', '6c5b96dbb57cb3dce406afe98a8698445c5d1e658a1d3c95c832c53fc8530cb7', '[\"otp\"]', NULL, NULL, '2023-09-05 15:54:27', '2023-09-05 15:54:27'),
(307, 'App\\Models\\User', 63, 'API TOKEN', 'd414128055a7ca9edd8249c3f50e21ec5fc0290af1be218b287eb6876c2dc2ad', '[\"otp\"]', NULL, NULL, '2023-09-05 15:55:02', '2023-09-05 15:55:02'),
(308, 'App\\Models\\User', 64, 'API TOKEN', '0e5f4700f3ab9be4eef3456e25b4f0b9ce17a258fe949fe9eacd44dad167534c', '[\"otp\"]', '2023-09-05 16:19:38', NULL, '2023-09-05 16:07:14', '2023-09-05 16:19:38'),
(309, 'App\\Models\\User', 65, 'API TOKEN', '0a4eea671cc3b16fe968fa92d2617a3a3cd88eb7852771532ed62e66be0ff260', '[\"otp\"]', NULL, NULL, '2023-09-05 16:18:45', '2023-09-05 16:18:45'),
(310, 'App\\Models\\User', 66, 'API TOKEN', '2f9b33d556534f5a34396ef08cf8fe01021b5af13b8b6cb66f9612753ed69bc9', '[\"otp\"]', '2023-09-05 16:20:59', NULL, '2023-09-05 16:20:44', '2023-09-05 16:20:59'),
(311, 'App\\Models\\User', 66, 'API TOKEN', '2178a5dd09fce6fb1bfc0a79284e9ada9ee8d87840524490d9e9b62680ad9e7a', '[\"user\"]', NULL, NULL, '2023-09-05 16:20:59', '2023-09-05 16:20:59'),
(312, 'App\\Models\\User', 66, 'API TOKEN', 'cb0793b8fdb5a7173a82ef464db67ee697a0a98c111407fb6255804595180098', '[\"user\"]', NULL, NULL, '2023-09-05 16:21:59', '2023-09-05 16:21:59'),
(313, 'App\\Models\\User', 66, 'API TOKEN', '2432983b9fbd3318ad4ab60394067e248baa4fe58924d262a13cb08daa5e69de', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-05 16:29:32', '2023-09-05 16:29:32'),
(314, 'App\\Models\\User', 53, 'API TOKEN', '1655db18a6858b960f321143657d56b807a292a7b3f5733b7be568adde17d9f3', '[\"otp\"]', NULL, NULL, '2023-09-05 21:36:10', '2023-09-05 21:36:10'),
(315, 'App\\Models\\User', 53, 'API TOKEN', '349ccd2456840b9dc552c772392c311974c00ba420f2f48010ea6cff988d4824', '[\"otp\"]', NULL, NULL, '2023-09-05 21:37:31', '2023-09-05 21:37:31'),
(316, 'App\\Models\\User', 53, 'API TOKEN', '3d151670da538a72687e5840267a59fa36a7a54ab64518e94c8ca8f92f7b92e1', '[\"otp\"]', '2023-09-05 23:06:46', NULL, '2023-09-05 21:41:55', '2023-09-05 23:06:46'),
(317, 'App\\Models\\User', 66, 'API TOKEN', 'db39a47501abb705c1d6e9ce15a6e3457a8b3db9fe92335d4b18502db27b171b', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-06 12:23:25', '2023-09-06 12:23:25'),
(318, 'App\\Models\\User', 66, 'API TOKEN', '85b09ad5fab6d0e081eb9d9fd64acf39b7a0ebd7e1d86c02f5f6198eb83734c2', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-06 12:26:14', '2023-09-06 12:26:14'),
(319, 'App\\Models\\User', 66, 'API TOKEN', '0bb6887b53094b9e359d8e559624094992142e189936541de21e0179ed7a79e1', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-06 12:27:34', '2023-09-06 12:27:34'),
(320, 'App\\Models\\User', 67, 'API TOKEN', '4c015f1edf4e3d26d0ebe1e0351d41e79673142c3811706b4fa9b1af45aa5803', '[\"otp\"]', NULL, NULL, '2023-09-06 13:27:00', '2023-09-06 13:27:00'),
(321, 'App\\Models\\User', 68, 'API TOKEN', 'c8b0866745c8d95c13f0faafe190d5b66f873ed858fd6c39c97bbfa45cc1a2db', '[\"otp\"]', NULL, NULL, '2023-09-06 13:28:20', '2023-09-06 13:28:20'),
(322, 'App\\Models\\User', 57, 'API TOKEN', '13a5785c6b3270e8b28df3c67bf168bb7bb808226802685a601bf89125a67ee4', '[\"user\"]', '2023-09-07 16:34:17', NULL, '2023-09-07 00:19:40', '2023-09-07 16:34:17'),
(323, 'App\\Models\\User', 66, 'API TOKEN', 'd9356c6f58339afa7764128054ee9107b02e2cb2109ff3d9ea7592c08fdbc990', '[\"user\"]', NULL, NULL, '2023-09-07 01:48:47', '2023-09-07 01:48:47'),
(324, 'App\\Models\\Admin', 2, 'API TOKEN', '67443bcc76c292de58cd3e5ce9717b9d461af656ec72af3b7fbc34cd6058751b', '[\"admin\"]', '2023-09-07 12:17:58', NULL, '2023-09-07 11:45:37', '2023-09-07 12:17:58'),
(325, 'App\\Models\\Admin', 2, 'API TOKEN', 'd97d3ff9fac3baa9ba52016fec3b001df1e60817ac53b016139b1839e0e00924', '[\"admin\"]', '2023-09-10 15:33:44', NULL, '2023-09-07 12:18:02', '2023-09-10 15:33:44'),
(326, 'App\\Models\\Admin', 2, 'API TOKEN', 'ec643f737457b0550b7c63d8d734bd725b60d02a59039a31ca80697b32a524e8', '[\"admin\"]', '2023-09-17 12:51:59', NULL, '2023-09-07 13:59:39', '2023-09-17 12:51:59'),
(327, 'App\\Models\\User', 70, 'API TOKEN', '84d035d47339f8ed35c1f591dc05ee575a9c86a2e27997fa7dfe54ab1dfc3d17', '[\"otp\"]', '2023-09-07 15:44:05', NULL, '2023-09-07 15:43:49', '2023-09-07 15:44:05'),
(328, 'App\\Models\\User', 70, 'API TOKEN', 'e0554add351939e35ff2e1558f0d1b3580a61e42aa8db0806be38ed98508e087', '[\"user\"]', NULL, NULL, '2023-09-07 15:44:05', '2023-09-07 15:44:05'),
(329, 'App\\Models\\User', 70, 'API TOKEN', '2c75d3e72701efd74e53fc8d0a5fd32cabb490b481480791301d4a3c48e84f95', '[\"user\"]', NULL, NULL, '2023-09-07 15:44:32', '2023-09-07 15:44:32'),
(330, 'App\\Models\\User', 70, 'API TOKEN', '7b22fd00dbf2e523601bae3d3789ff93f10169ebbcf3d00282b88303653196a7', '[\"user\"]', '2023-09-11 20:46:39', NULL, '2023-09-07 15:45:33', '2023-09-11 20:46:39'),
(331, 'App\\Models\\Admin', 2, 'API TOKEN', '3a0048ff9f3216aa91eb8b2fcde1716273701d639fdc51f5c3f9507b9b00e688', '[\"admin\"]', '2023-09-14 17:56:59', NULL, '2023-09-11 13:51:36', '2023-09-14 17:56:59'),
(332, 'App\\Models\\User', 70, 'API TOKEN', 'c5feef3c26a8c4a02135cbb6f1bbdd74564c8d1724efbad94dbc86bff461eab4', '[\"user\"]', '2023-09-14 15:33:23', NULL, '2023-09-12 13:12:42', '2023-09-14 15:33:23'),
(333, 'App\\Models\\Admin', 2, 'API TOKEN', '54d187603b151de604611fafe510cf5de767a483a01eef99aaa4410f15bf1bb2', '[\"admin\"]', '2023-09-12 16:53:54', NULL, '2023-09-12 15:49:18', '2023-09-12 16:53:54'),
(334, 'App\\Models\\Admin', 2, 'API TOKEN', '223d892958f91fb889a94377757b3b77cfcb427d9904720b86314a8fa0297c8b', '[\"admin\"]', '2023-09-13 13:00:05', NULL, '2023-09-12 16:23:47', '2023-09-13 13:00:05'),
(335, 'App\\Models\\Admin', 2, 'API TOKEN', '63f860c5b4312d27837eb8af4bd26f83a2e5f3a09e7cb607b6465ac148924a58', '[\"admin\"]', '2023-09-13 13:39:21', NULL, '2023-09-13 13:00:07', '2023-09-13 13:39:21'),
(336, 'App\\Models\\Admin', 2, 'API TOKEN', '118d0db4e9ecfc55cf1f8c20ced057238d9ce78de1205aea07d498fc7ec7ef9d', '[\"admin\"]', '2023-09-13 13:03:21', NULL, '2023-09-13 13:01:55', '2023-09-13 13:03:21'),
(337, 'App\\Models\\Admin', 2, 'API TOKEN', '20b258483871fc6d186132961c55664d6266774d530f33b50519e251dbdc82a5', '[\"admin\"]', '2023-09-13 13:39:28', NULL, '2023-09-13 13:05:47', '2023-09-13 13:39:28'),
(338, 'App\\Models\\Admin', 2, 'API TOKEN', 'd96bd2664a2072b6af6ffed8ea6f05e217d728429cd77c85dd1394d0145aed4e', '[\"admin\"]', '2023-09-13 17:00:26', NULL, '2023-09-13 13:08:12', '2023-09-13 17:00:26'),
(339, 'App\\Models\\Admin', 2, 'API TOKEN', 'a781ecb55757625709940bb13ac273ab56be074baf96871c68106936686c6547', '[\"admin\"]', '2023-09-13 15:25:32', NULL, '2023-09-13 13:39:24', '2023-09-13 15:25:32'),
(340, 'App\\Models\\User', 70, 'API TOKEN', '4e1b933ca5cab0ba0919505b3d0ae0be27209e837adaf5a85909607cd8579a43', '[\"user\"]', '2023-09-14 15:34:40', NULL, '2023-09-14 14:39:18', '2023-09-14 15:34:40'),
(341, 'App\\Models\\Admin', 2, 'API TOKEN', 'ea80ebf603ee91e508f3e3f15326b8bbd5a623b34e5ec380ef09ff75205ac243', '[\"admin\"]', '2023-09-14 17:06:30', NULL, '2023-09-14 15:17:02', '2023-09-14 17:06:30'),
(342, 'App\\Models\\User', 70, 'API TOKEN', '26de088ad5349c7353068f2093b9e6d7240cb8dbf29df7fd21aebd789aebcc2a', '[\"user\"]', NULL, NULL, '2023-09-14 15:56:28', '2023-09-14 15:56:28'),
(343, 'App\\Models\\User', 70, 'API TOKEN', '6407ea3602ac82413d6dd7787e1eb9ab9b85bffbffddeefe7ef1e082f8b08dc5', '[\"user\"]', NULL, NULL, '2023-09-14 15:58:11', '2023-09-14 15:58:11'),
(344, 'App\\Models\\Admin', 2, 'API TOKEN', 'd01dfefabe27f339c8e44a9fe520c4ebe7ac57b7cdd66e615efa02aad86d00ff', '[\"admin\"]', '2023-09-17 14:16:12', NULL, '2023-09-14 17:22:16', '2023-09-17 14:16:12'),
(345, 'App\\Models\\User', 46, 'API TOKEN', '2325eb3e1a1fc0cd76041000c4175693b9d612f93609a8f7e282e193ebbf63a6', '[\"user\"]', '2023-09-23 12:56:05', NULL, '2023-09-16 17:37:09', '2023-09-23 12:56:05'),
(346, 'App\\Models\\User', 46, 'API TOKEN', '1d3459af63810d9e777874b4b1ec55b2dba302386b996b48b8ff8c939a9ee468', '[\"user\"]', NULL, NULL, '2023-09-16 18:04:00', '2023-09-16 18:04:00'),
(347, 'App\\Models\\User', 23, 'API TOKEN', 'a9a03e5b793e58d0ff96339c6924e54815aac83cc5813f91fab9575366865ad0', '[\"user\"]', NULL, NULL, '2023-09-16 18:05:09', '2023-09-16 18:05:09'),
(348, 'App\\Models\\Admin', 2, 'API TOKEN', '445f5ce0a15fa63e3ad4d46ebde65594b175e9f43ba57746b9bc21398357e388', '[\"admin\"]', '2023-09-18 10:57:20', NULL, '2023-09-17 12:15:22', '2023-09-18 10:57:20'),
(349, 'App\\Models\\Admin', 2, 'API TOKEN', '0230ab0d3584e58bf163ccc851d4c009be400f31c99ee735c240469df8585bbe', '[\"admin\"]', '2023-09-20 11:26:45', NULL, '2023-09-17 12:52:19', '2023-09-20 11:26:45'),
(350, 'App\\Models\\User', 23, 'API TOKEN', '681e1d6d86462da92ff67b096bae97ee76f29ff8a52b223448963cd905a4c15f', '[\"user\"]', NULL, NULL, '2023-09-17 13:45:58', '2023-09-17 13:45:58'),
(351, 'App\\Models\\User', 23, 'API TOKEN', '48a1ad13e2d866cee2a152e4c49531bd8a5c8659a72d3b18fc2453b27a19ff42', '[\"user\"]', '2023-10-12 14:44:15', NULL, '2023-09-17 16:27:53', '2023-10-12 14:44:15'),
(352, 'App\\Models\\User', 70, 'API TOKEN', 'c260320e3d6a61b094bf81579f274eedd516d796eea424247b67781785dee4f0', '[\"otp-reset-password\"]', NULL, NULL, '2023-09-18 13:11:58', '2023-09-18 13:11:58'),
(353, 'App\\Models\\User', 71, 'API TOKEN', 'a1e84d54502b83bb504c6d9304397e88b6254b54b1187b19b0a10780ecd33043', '[\"otp\"]', '2023-09-18 13:19:47', NULL, '2023-09-18 13:19:17', '2023-09-18 13:19:47'),
(354, 'App\\Models\\User', 71, 'API TOKEN', '51e42eac5a72fe5295e8d12a68ba57e5f99f0f59769ce86055f8acfa7b27b9a6', '[\"user\"]', NULL, NULL, '2023-09-18 13:19:47', '2023-09-18 13:19:47'),
(355, 'App\\Models\\User', 70, 'API TOKEN', 'beddee69349e141c34ad279e97625086403115b5b3fb61eca116f4e14da4c10a', '[\"otp-reset-password\"]', '2023-09-18 13:26:53', NULL, '2023-09-18 13:24:27', '2023-09-18 13:26:53'),
(356, 'App\\Models\\User', 70, 'API TOKEN', 'eede623e7a7214d69721ae166ac75b4cdb5c045d6a1e6febfdfb22593af70b31', '[\"user\"]', NULL, NULL, '2023-09-18 13:31:44', '2023-09-18 13:31:44'),
(357, 'App\\Models\\User', 70, 'API TOKEN', '4ca7923dd62c34c418829074747b3210c200ea536c9eaebc271b24de14480fb1', '[\"user\"]', '2023-10-01 14:12:21', NULL, '2023-09-18 13:32:31', '2023-10-01 14:12:21'),
(358, 'App\\Models\\Admin', 2, 'API TOKEN', '9910bf5d1265d541d62ed33164588f4e31742e650a99128c2a01fcd134500bb6', '[\"admin\"]', '2023-09-27 14:13:27', NULL, '2023-09-18 14:47:22', '2023-09-27 14:13:27'),
(359, 'App\\Models\\User', 23, 'API TOKEN', 'f789eff36952e880396e0992182af1309aff507e687a6ab19417141f36102453', '[\"user\"]', NULL, NULL, '2023-09-18 15:16:11', '2023-09-18 15:16:11'),
(360, 'App\\Models\\Admin', 2, 'API TOKEN', '61fdc9c7ecf1b6c613cbe50bc16ed5ef482656fb6147db701b29444b9f0968ef', '[\"admin\"]', '2023-09-18 16:20:00', NULL, '2023-09-18 16:18:03', '2023-09-18 16:20:00'),
(361, 'App\\Models\\Admin', 2, 'API TOKEN', '0b9b2edb26361b3d6349e421d861ef3df2c48a69f71c48ff479bf24159a14cd1', '[\"admin\"]', '2023-09-26 13:38:19', NULL, '2023-09-18 16:38:38', '2023-09-26 13:38:19'),
(362, 'App\\Models\\User', 23, 'API TOKEN', 'f1df6e78e4fd9b56b448129f12aeff4c4c5d388cc79a7384255dd27a709999a1', '[\"user\"]', '2023-09-19 23:07:26', NULL, '2023-09-19 23:05:06', '2023-09-19 23:07:26'),
(363, 'App\\Models\\User', 23, 'API TOKEN', '017ccd7bfb689e121d4a13908c7a497ab4353c40c29b96ea183b6d9bab356c1a', '[\"user\"]', NULL, NULL, '2023-09-19 23:07:27', '2023-09-19 23:07:27'),
(364, 'App\\Models\\Admin', 2, 'API TOKEN', '8b9911d056d9f0a7fbab1029b93645664257363e8378048fc334ff81a993ed9e', '[\"admin\"]', '2023-09-25 14:57:19', NULL, '2023-09-20 11:27:21', '2023-09-25 14:57:19'),
(365, 'App\\Models\\Admin', 2, 'API TOKEN', '92d8dae40b320c2a9b470c96961187290c817de4ab207bc5c51731b1bc2939cf', '[\"admin\"]', '2023-09-25 16:58:50', NULL, '2023-09-20 11:27:58', '2023-09-25 16:58:50'),
(366, 'App\\Models\\User', 23, 'API TOKEN', '0713e624cd91b165c39e73a8e00764bdb9215c048ed4fbe89662b864eb66812a', '[\"user\"]', '2023-09-23 11:53:27', NULL, '2023-09-23 11:53:13', '2023-09-23 11:53:27'),
(367, 'App\\Models\\User', 23, 'API TOKEN', 'c9cb0ff6686b3e8ab9ab74a87f233a9cbbdd8334780a5ea6b7ffff1c88ebedc9', '[\"user\"]', '2023-09-27 01:34:19', NULL, '2023-09-23 12:58:07', '2023-09-27 01:34:19'),
(368, 'App\\Models\\User', 23, 'API TOKEN', '3c11797516a236404e7d6cbd2d7e8180f8454a180e141e36ee141b826edc5a6a', '[\"user\"]', '2023-09-25 00:40:58', NULL, '2023-09-24 21:53:25', '2023-09-25 00:40:58'),
(369, 'App\\Models\\User', 23, 'API TOKEN', '25afaad5d1fb2e3ae2b80a9f2bf12c07099da05dbef68829df234093eeae68bc', '[\"user\"]', NULL, NULL, '2023-09-24 21:53:41', '2023-09-24 21:53:41'),
(370, 'App\\Models\\User', 23, 'API TOKEN', 'd00ec516c1c80bbecc315f5fdbc1b55a29e49ceda38307f6580a445a85108b83', '[\"user\"]', NULL, NULL, '2023-09-24 22:07:43', '2023-09-24 22:07:43'),
(371, 'App\\Models\\User', 23, 'API TOKEN', 'f6b2af519ddc06bc0b653f7e639b0bcfa044c0986831b72c7ee148e0a931de62', '[\"user\"]', NULL, NULL, '2023-09-24 22:15:29', '2023-09-24 22:15:29'),
(372, 'App\\Models\\User', 23, 'API TOKEN', 'a6f4daf8df809dcb5dba122b007647e81aabfaca14b3763327b162031d407e4e', '[\"user\"]', NULL, NULL, '2023-09-25 00:10:44', '2023-09-25 00:10:44'),
(373, 'App\\Models\\User', 23, 'API TOKEN', '5ce66aa05008a043c7725309e2d65170331a5790bf2b8957db8570d073820db1', '[\"user\"]', NULL, NULL, '2023-09-25 00:14:20', '2023-09-25 00:14:20'),
(374, 'App\\Models\\User', 23, 'API TOKEN', '4293ad44c5f8d6617faeaf130ade40a9ab5fd46a478b96379bfea99364245c2d', '[\"user\"]', '2023-09-25 13:01:36', NULL, '2023-09-25 13:01:18', '2023-09-25 13:01:36'),
(375, 'App\\Models\\Admin', 2, 'API TOKEN', 'e2ec6b8f2a2c26e99b44ca69274bbacf97a024fa69b04b57195beb471082a6d2', '[\"admin\"]', '2023-09-25 13:12:26', NULL, '2023-09-25 13:12:25', '2023-09-25 13:12:26'),
(376, 'App\\Models\\Admin', 2, 'API TOKEN', '6acdfcc9a6d5c21340e99aa0e1395b863e9f46231287441f6aebc392d9278b1f', '[\"admin\"]', '2023-09-26 12:49:37', NULL, '2023-09-25 13:49:09', '2023-09-26 12:49:37'),
(377, 'App\\Models\\Admin', 2, 'API TOKEN', '3d9abc964b9697822a86da24789426b8a89844682ff5ae72be73bf1612955b8f', '[\"admin\"]', '2023-09-26 15:00:14', NULL, '2023-09-25 14:36:39', '2023-09-26 15:00:14'),
(378, 'App\\Models\\Admin', 2, 'API TOKEN', 'f7a6678cc42f5bc0e054f9f30aa7facd28cfe9db7c90d73736049e95e6533e71', '[\"admin\"]', '2023-09-26 15:58:06', NULL, '2023-09-25 14:57:48', '2023-09-26 15:58:06'),
(379, 'App\\Models\\Admin', 2, 'API TOKEN', '2ef18e5ba51aa34932436b6fd1147055a0beb3f4880464505bd30b146e99002b', '[\"admin\"]', '2023-09-27 16:46:54', NULL, '2023-09-25 15:59:44', '2023-09-27 16:46:54'),
(380, 'App\\Models\\Admin', 2, 'API TOKEN', 'c993b327df50a63cba1d98e58f6f350bbdf160fba5891f4191a170fc6dad4e36', '[\"admin\"]', '2023-09-25 17:48:15', NULL, '2023-09-25 17:11:46', '2023-09-25 17:48:15'),
(381, 'App\\Models\\User', 23, 'API TOKEN', '8834a8bd986b0d8a1167a4675ca8d919d05cf70ce1aa230e3a8bbd2c17d9e92d', '[\"user\"]', '2023-09-25 19:03:08', NULL, '2023-09-25 19:02:17', '2023-09-25 19:03:08'),
(382, 'App\\Models\\Admin', 2, 'API TOKEN', '4de6468fbd53f479234d8cccbf6d8ed557895f30e1b1f9106357793aa558108b', '[\"admin\"]', '2023-09-26 14:02:30', NULL, '2023-09-26 12:49:51', '2023-09-26 14:02:30'),
(383, 'App\\Models\\Admin', 2, 'API TOKEN', '52f1d417837bb070479b66e96712f08902bd934719fd90986595de8d7bef978f', '[\"admin\"]', '2023-09-26 14:00:04', NULL, '2023-09-26 13:38:30', '2023-09-26 14:00:04'),
(384, 'App\\Models\\Admin', 2, 'API TOKEN', '78600d504d50f9c83fa2de1765992c097586b74540e3b88dc5f475071e05da49', '[\"admin\"]', '2023-09-27 11:33:20', NULL, '2023-09-26 13:38:32', '2023-09-27 11:33:20'),
(385, 'App\\Models\\Admin', 2, 'API TOKEN', 'c1870db5cff50aee43da09adf27d36131d0be0874f2fde6e056fdc15250ab13c', '[\"admin\"]', '2023-10-11 13:05:06', NULL, '2023-09-26 15:00:25', '2023-10-11 13:05:06'),
(386, 'App\\Models\\User', 23, 'API TOKEN', 'a1fcf479f7a996be414bc94d13cbf228aa0965e007c4e8e45430cd609d0909ec', '[\"user\"]', '2023-09-27 01:28:41', NULL, '2023-09-27 01:05:48', '2023-09-27 01:28:41'),
(387, 'App\\Models\\Admin', 2, 'API TOKEN', 'c5cfa7d0b25c4028b4bb1430032446acdb7469a88c20f2eddc4ab3662c712e60', '[\"admin\"]', '2023-10-01 15:43:04', NULL, '2023-09-27 14:13:32', '2023-10-01 15:43:04'),
(388, 'App\\Models\\Admin', 2, 'API TOKEN', '25001c297ac7cab9f2612b85c61006f0e265a4c7e9e1a0fb9861d2b7e92eedbc', '[\"admin\"]', '2023-09-27 16:04:36', NULL, '2023-09-27 15:38:09', '2023-09-27 16:04:36'),
(389, 'App\\Models\\Admin', 2, 'API TOKEN', 'e451a20daef527681d93b283ecb9bfbefeaf13938a7efef63e119f813a0040d5', '[\"admin\"]', '2023-09-27 17:51:08', NULL, '2023-09-27 16:47:44', '2023-09-27 17:51:08'),
(390, 'App\\Models\\Admin', 2, 'API TOKEN', 'f090cbd7fa9a70af5aa8e82d0a8ac5268dba6728350d1332eb6b04447d8756e3', '[\"admin\"]', '2023-09-27 18:01:36', NULL, '2023-09-27 17:59:06', '2023-09-27 18:01:36'),
(391, 'App\\Models\\User', 23, 'API TOKEN', '06c3f927cef8cb46270aac362599722f75ddc3537bee648aa56b6322b951b34b', '[\"user\"]', '2023-10-02 00:28:36', NULL, '2023-09-28 10:20:19', '2023-10-02 00:28:36'),
(392, 'App\\Models\\User', 23, 'API TOKEN', '2c76e1bd205f8fd205163a2ebcfdea0e21f9f868fed3ce06ff13f53c92de7e3b', '[\"user\"]', NULL, NULL, '2023-09-28 10:21:33', '2023-09-28 10:21:33'),
(393, 'App\\Models\\User', 72, 'API TOKEN', '332c3b359c2ad89631b960476e5a466c78c7f3cf29be676891c52fa14454eb47', '[\"otp\"]', '2023-10-01 14:17:33', NULL, '2023-10-01 14:14:17', '2023-10-01 14:17:33'),
(394, 'App\\Models\\User', 72, 'API TOKEN', 'e93c21b1ca96c553d9bdf1bfc64abfcd8c96a7cada00f2887e95c98fd02094ac', '[\"user\"]', NULL, NULL, '2023-10-01 14:17:33', '2023-10-01 14:17:33'),
(395, 'App\\Models\\User', 70, 'API TOKEN', 'b3dfca3479686bae8ce1e57d93191335b05de5e219fc1e9a4ba00b65391bae3c', '[\"user\"]', '2023-10-02 13:49:44', NULL, '2023-10-01 14:22:11', '2023-10-02 13:49:44'),
(396, 'App\\Models\\Admin', 2, 'API TOKEN', 'da5e1c64145afc46bda00a89d044e8e99b6c12d137e521cd130a0d702ecc922e', '[\"admin\"]', '2023-10-04 15:49:37', NULL, '2023-10-01 15:43:06', '2023-10-04 15:49:37'),
(397, 'App\\Models\\User', 70, 'API TOKEN', '81a78f39e2b905c622d2d270de4897c668751e91027df61d771f6a93e250f65d', '[\"user\"]', '2023-10-02 00:32:08', NULL, '2023-10-02 00:29:13', '2023-10-02 00:32:08'),
(398, 'App\\Models\\User', 23, 'API TOKEN', 'e8095675dfed17c0893aa4f15c2fff504956debaa9023e23f0ce8626a7ed0b80', '[\"user\"]', '2023-10-02 00:37:58', NULL, '2023-10-02 00:36:11', '2023-10-02 00:37:58'),
(399, 'App\\Models\\User', 23, 'API TOKEN', 'd34a8785a0f637f05203bba39d31f5f4e0ef10a074b2a7faba28e386b4b1dbc4', '[\"user\"]', '2023-10-04 23:27:45', NULL, '2023-10-02 00:38:49', '2023-10-04 23:27:45'),
(400, 'App\\Models\\User', 70, 'API TOKEN', '859b0a387ccc5bff907c927fb10acc4de4827377d23204454ba690b47ea0c741', '[\"user\"]', '2023-10-08 12:30:13', NULL, '2023-10-02 13:58:23', '2023-10-08 12:30:13'),
(401, 'App\\Models\\Admin', 2, 'API TOKEN', 'fe5d7d66e71c809d1c179019ae7eef2ba2153d06bd3998f51f1e2dd8809cd4db', '[\"admin\"]', '2023-10-15 15:03:55', NULL, '2023-10-04 00:01:14', '2023-10-15 15:03:55'),
(402, 'App\\Models\\User', 70, 'API TOKEN', 'a624413b8bfb902e06d5a7b73b5e6743ce4b1d80d06bc806e7533fa794f35d76', '[\"user\"]', '2023-10-04 01:52:45', NULL, '2023-10-04 01:51:51', '2023-10-04 01:52:45'),
(403, 'App\\Models\\User', 70, 'API TOKEN', '664bce8b07bde9982f8ab40474cdfa99618ac20f8c1a3679634c8f93168c7297', '[\"user\"]', '2023-10-04 12:45:36', NULL, '2023-10-04 11:44:35', '2023-10-04 12:45:36'),
(404, 'App\\Models\\Admin', 2, 'API TOKEN', '897931c531783e77ded29d0f7748bda6333120d0c75cec18cd3a8c24fd04ff8a', '[\"admin\"]', '2023-10-08 11:58:17', NULL, '2023-10-04 15:49:39', '2023-10-08 11:58:17'),
(405, 'App\\Models\\User', 73, 'API TOKEN', '4c945ff1373bbeea034bb74eb7c9fdb5f5d7b0978c7e7f9e07368a0f51c78cad', '[\"otp-update-social-phone\"]', '2023-10-05 20:30:39', NULL, '2023-10-05 20:27:22', '2023-10-05 20:30:39'),
(406, 'App\\Models\\User', 73, 'API TOKEN', '625ca2e8c25ffa11e09d563472755747466c6b94869b96c986200b29d69c4ae4', '[\"otp-update-social-phone\"]', '2023-10-05 20:28:07', NULL, '2023-10-05 20:27:30', '2023-10-05 20:28:07'),
(407, 'App\\Models\\Admin', 2, 'API TOKEN', 'f88953b76da49f16a07a96f8739ff22ba8547a5b1575646d288038bb8ac511a5', '[\"admin\"]', '2023-10-08 14:13:35', NULL, '2023-10-08 11:58:18', '2023-10-08 14:13:35'),
(408, 'App\\Models\\User', 70, 'API TOKEN', '42b21f2bbb9478b562bcd62cd05b12625ae9acd39560337c9fe98126a3e2b8b1', '[\"user\"]', '2023-10-08 13:29:47', NULL, '2023-10-08 13:29:29', '2023-10-08 13:29:47'),
(409, 'App\\Models\\User', 70, 'API TOKEN', '2edf34e8248cc90c61dd1976f7af0d7c3bcc39c5252cf2cec30b4140f37dcce1', '[\"user\"]', '2023-10-08 13:30:35', NULL, '2023-10-08 13:30:33', '2023-10-08 13:30:35'),
(410, 'App\\Models\\User', 70, 'API TOKEN', '2b49bd780161f0471d3afd38be62667384df4aca64804aecf0f87f2300d1e8f6', '[\"user\"]', '2023-10-08 13:31:17', NULL, '2023-10-08 13:31:15', '2023-10-08 13:31:17'),
(411, 'App\\Models\\User', 70, 'API TOKEN', '934ccf10b20e590e797e153c444ab0b12ae07d123e6d9606ade2638239995a81', '[\"otp-reset-password\"]', '2023-10-08 13:36:41', NULL, '2023-10-08 13:33:54', '2023-10-08 13:36:41'),
(412, 'App\\Models\\User', 70, 'API TOKEN', '462b8f78bc54e8d66d9cbbc9b82b51b5ae2fe1a71af13eb43cad4c024dcbc404', '[\"reset-password\"]', NULL, NULL, '2023-10-08 13:36:41', '2023-10-08 13:36:41'),
(413, 'App\\Models\\User', 70, 'API TOKEN', '7ff217c37ccd89b28be79b0ef606580ebcf6a2194af4b3d6c3e97e2d1a72a3f4', '[\"user\"]', '2023-10-08 19:00:00', NULL, '2023-10-08 13:37:12', '2023-10-08 19:00:00'),
(414, 'App\\Models\\Admin', 2, 'API TOKEN', '0c06ae19e95324240215940c3a776d5915aa6f12d671456eda1cc188e3a1d566', '[\"admin\"]', '2023-10-08 14:15:08', NULL, '2023-10-08 14:13:36', '2023-10-08 14:15:08'),
(415, 'App\\Models\\User', 70, 'API TOKEN', 'b7a56b1095508f60ba499802d503f8aff880fa7133bd3c334f4efbec7448b522', '[\"user\"]', '2023-10-09 11:29:25', NULL, '2023-10-08 19:00:41', '2023-10-09 11:29:25'),
(416, 'App\\Models\\User', 23, 'API TOKEN', '29fc88409b04c8e53b6f5e0e92b1142f14a89231beab61516eda5744b7ead628', '[\"user\"]', NULL, NULL, '2023-10-09 11:23:08', '2023-10-09 11:23:08'),
(417, 'App\\Models\\User', 23, 'API TOKEN', '4a3c465eeb81df4d0491870b2316bd87faaabae56d459ea146c68283dfc410bd', '[\"user\"]', NULL, NULL, '2023-10-09 11:27:19', '2023-10-09 11:27:19'),
(418, 'App\\Models\\User', 23, 'API TOKEN', 'ca101a6d3d15d170a3c9e3f52f5396da13edfa7f452a77f6ba4a02713cb76ca0', '[\"user\"]', NULL, NULL, '2023-10-09 11:28:28', '2023-10-09 11:28:28'),
(419, 'App\\Models\\User', 74, 'API TOKEN', '45f3e38b09a44918f5055adf0f51fd17c7e749267f117120d7e62feb7712a710', '[\"otp\"]', '2023-10-09 11:35:38', NULL, '2023-10-09 11:34:49', '2023-10-09 11:35:38'),
(420, 'App\\Models\\User', 74, 'API TOKEN', 'd2c58f1d183a97317c4ad94342443ee73c4a3488e7aa6b34c3b74ca98634b6e4', '[\"user\"]', NULL, NULL, '2023-10-09 11:35:38', '2023-10-09 11:35:38'),
(421, 'App\\Models\\User', 74, 'API TOKEN', '04b487b7c097da2f09b94c9800b5f01131cb7f482de6087b360a92279515269c', '[\"user\"]', '2023-10-09 15:05:37', NULL, '2023-10-09 11:36:01', '2023-10-09 15:05:37'),
(422, 'App\\Models\\User', 70, 'API TOKEN', '1f84bdbf2feebfaa973aa2e2c05d893214fd3624f5db8c1253e8f6ce78d339bc', '[\"user\"]', '2023-10-09 15:14:23', NULL, '2023-10-09 15:05:50', '2023-10-09 15:14:23'),
(423, 'App\\Models\\User', 74, 'API TOKEN', '41032d1801537e8c3c8923128152a888df3c7f93ec24faf104eb756f539901a2', '[\"user\"]', '2023-10-09 15:15:42', NULL, '2023-10-09 15:15:04', '2023-10-09 15:15:42'),
(424, 'App\\Models\\User', 74, 'API TOKEN', '012f677e005a33fa52548b8d4f92a374727788e3bb8aa0b9676288e78364e6d6', '[\"user\"]', '2023-10-09 15:23:26', NULL, '2023-10-09 15:18:08', '2023-10-09 15:23:26'),
(425, 'App\\Models\\User', 70, 'API TOKEN', '4b3f0158c8b9dbe7183d00cbd40dc4ffe7799395c075b63e4901d69ce4d665c1', '[\"user\"]', '2023-10-09 15:25:35', NULL, '2023-10-09 15:24:47', '2023-10-09 15:25:35'),
(426, 'App\\Models\\User', 74, 'API TOKEN', 'a488143236c6530e0e40ea488243990ac5177c8f0897ae280a506740813594ba', '[\"user\"]', '2023-10-09 15:32:36', NULL, '2023-10-09 15:26:40', '2023-10-09 15:32:36'),
(427, 'App\\Models\\User', 74, 'API TOKEN', '940adc9646420cd12b6cbdd79360b38cdc08f11fa844af3540a0d85fa9c74ca0', '[\"user\"]', '2023-10-09 15:29:46', NULL, '2023-10-09 15:27:43', '2023-10-09 15:29:46'),
(428, 'App\\Models\\User', 74, 'API TOKEN', '94cd5404d81bdb6a1d845026a787fc9ad220995132ed6c0e220f7e44c26cdfba', '[\"user\"]', NULL, NULL, '2023-10-09 15:29:46', '2023-10-09 15:29:46'),
(429, 'App\\Models\\User', 74, 'API TOKEN', 'a7ec7f363313694b855d88cdae4cb0f1c6b1de7459988a9ea892d52be707296f', '[\"user\"]', NULL, NULL, '2023-10-09 15:30:51', '2023-10-09 15:30:51'),
(430, 'App\\Models\\User', 70, 'API TOKEN', '79442bfdd968f55fb1465df870dd9e8bad6a33b1d7f818115b8f9e319c3b7193', '[\"user\"]', '2023-10-09 15:36:27', NULL, '2023-10-09 15:33:14', '2023-10-09 15:36:27'),
(431, 'App\\Models\\User', 74, 'API TOKEN', '38c1dcd1b8cb8c197a47517a76096d75d3e5eef13d5d825f92e1f759c7b315b0', '[\"user\"]', '2023-10-10 12:29:15', NULL, '2023-10-09 15:36:46', '2023-10-10 12:29:15'),
(432, 'App\\Models\\User', 74, 'API TOKEN', '3e9bee7febed20522b2aec5daaa21ec817e2940bf5067e999d4bb6c067e00f2c', '[\"otp-reset-password\"]', NULL, NULL, '2023-10-10 12:30:52', '2023-10-10 12:30:52'),
(433, 'App\\Models\\User', 74, 'API TOKEN', '77d7bf94025767baaa3e1a4209a7fcf6427601e78246617a6fa9ce6aa36658b7', '[\"user\"]', '2023-10-15 15:22:02', NULL, '2023-10-10 12:31:13', '2023-10-15 15:22:02'),
(434, 'App\\Models\\User', 74, 'API TOKEN', '6cc6798fc28fcb6b75b24668aa1757efc8581b75ca44b80fb168afd124ca2763', '[\"user\"]', NULL, NULL, '2023-10-11 22:26:32', '2023-10-11 22:26:32'),
(435, 'App\\Models\\User', 74, 'API TOKEN', 'a385160aefaccbb9e0732d6b6078b29a5092ec1437c5a15f3500a7da829dc30f', '[\"user\"]', '2023-10-11 22:38:50', NULL, '2023-10-11 22:27:04', '2023-10-11 22:38:50'),
(436, 'App\\Models\\User', 74, 'API TOKEN', '810568faf1426708f6cf6bb7c982a228d78ea25a495de19908771c11eabbdb2f', '[\"user\"]', '2023-10-14 20:11:56', NULL, '2023-10-11 22:42:15', '2023-10-14 20:11:56'),
(437, 'App\\Models\\User', 74, 'API TOKEN', '2b43e47f55d89ec88ba53aa1e305f64f04169c501dc7d2688d7f3b6c1a0b3096', '[\"user\"]', NULL, NULL, '2023-10-11 23:19:37', '2023-10-11 23:19:37'),
(438, 'App\\Models\\User', 75, 'API TOKEN', 'a843e185eaa0b1ebc091b20276204fb85477b76f0541ad7a6dfc95261e92c7bc', '[\"otp\"]', NULL, NULL, '2023-10-14 20:12:19', '2023-10-14 20:12:19'),
(439, 'App\\Models\\User', 76, 'API TOKEN', 'df98695e522452be85d0550cd22fd93d8db247d0a250f5c3036a948a07ce5d37', '[\"otp\"]', '2023-10-14 20:35:59', NULL, '2023-10-14 20:25:48', '2023-10-14 20:35:59'),
(440, 'App\\Models\\Admin', 2, 'API TOKEN', '40466d1aa5ab2aee1b2892a7c57c408164068e5db45d44291d101cee03d9b6a7', '[\"admin\"]', '2023-10-15 12:57:00', NULL, '2023-10-15 12:41:18', '2023-10-15 12:57:00'),
(441, 'App\\Models\\Admin', 5, 'API TOKEN', '50d18805ee373bc7549b02305721a57abeb48196d5697debd8f28098d93f378a', '[\"admin\"]', '2023-10-17 12:19:57', NULL, '2023-10-17 09:49:52', '2023-10-17 12:19:57'),
(442, 'App\\Models\\Admin', 6, 'API TOKEN', 'a4b5520a7ef2c8725fd0979a9a0a33cd05546d1f9bf695d8020af9c584ff6ecf', '[\"admin\"]', NULL, NULL, '2023-10-17 09:59:00', '2023-10-17 09:59:00'),
(443, 'App\\Models\\User', 77, 'API TOKEN', 'c147fb6377c9be032683ef75b15a8c505f5fb67c3888dc876681453ad2ad44ac', '[\"otp\"]', NULL, NULL, '2023-10-17 11:01:11', '2023-10-17 11:01:11'),
(444, 'App\\Models\\User', 77, 'API TOKEN', 'dbfbab4684fc64723017f0d59d1bcee3dc93fe5e51fee59570b320bfb265044c', '[\"user\"]', NULL, NULL, '2023-10-17 11:02:35', '2023-10-17 11:02:35'),
(445, 'App\\Models\\Admin', 5, 'API TOKEN', '8075ee0d223623d9099d00302a7a86a4bfd0a06136d738900c6e5417f776b922', '[\"admin\"]', NULL, NULL, '2023-10-17 12:20:08', '2023-10-17 12:20:08'),
(446, 'App\\Models\\User', 77, 'API TOKEN', '41f7da31fc7b0747be924bf7920a96702f085375dce2165f1c6c87c543a7075d', '[\"user\"]', '2023-10-17 12:46:25', NULL, '2023-10-17 12:20:20', '2023-10-17 12:46:25'),
(447, 'App\\Models\\User', 2, 'API TOKEN', 'ad4544a6c10cf957b980aded36337dfa498d49f7cf317e6724f16d858f578884', '[\"otp\"]', NULL, NULL, '2023-10-17 13:10:21', '2023-10-17 13:10:21'),
(448, 'App\\Models\\Admin', 2, 'API TOKEN', 'e646bf35941a4be6361dc9827c6e12931b8fcde0222f36ef9f3f26c56a804c98', '[\"admin\"]', '2023-10-18 11:30:37', NULL, '2023-10-17 13:19:29', '2023-10-18 11:30:37'),
(449, 'App\\Models\\User', 23, 'API TOKEN', '46b1f82b1a5458208d60d2fa49dc38fa274bec697a27715faed96de6d9a13d03', '[\"user\"]', '2023-10-17 14:58:09', NULL, '2023-10-17 14:40:05', '2023-10-17 14:58:09'),
(450, 'App\\Models\\User', 23, 'API TOKEN', 'ae6cf2db275af1b5bd89c681210959a6931850e648783bf73244f764804a9332', '[\"user\"]', '2023-10-19 10:43:27', NULL, '2023-10-19 10:34:57', '2023-10-19 10:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `price_options`
--

CREATE TABLE `price_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_options`
--

INSERT INTO `price_options` (`id`, `service_id`, `price`, `title_en`, `title_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 13, 100.00, 'Ceiling', 'سقف', NULL, NULL, NULL),
(27, 13, 500.00, 'Furnish', 'أثث', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promotional_notification`
--

CREATE TABLE `promotional_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_sms` tinyint(1) DEFAULT NULL,
  `is_email` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotional_notification`
--

INSERT INTO `promotional_notification` (`id`, `title`, `content`, `is_sms`, `is_email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'tesa', 1, 1, '2023-09-27 16:20:15', '2023-09-27 16:20:15', NULL),
(2, 'test 2', '<p>test 2 test 2</p>', 1, 0, '2023-09-27 17:46:18', '2023-09-27 17:46:18', NULL),
(3, 'test 3', '<p>test 3</p>', 0, 0, '2023-09-27 17:51:06', '2023-09-27 17:51:06', NULL),
(4, 'promo', '<p>Get 50% off of your first order using the code ( First50 )</p>', 1, 1, '2023-10-08 14:15:05', '2023-10-08 14:15:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_ar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_price_options` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_type_id`, `title_en`, `title_ar`, `short_description_en`, `short_description_ar`, `image_en`, `image_ar`, `description_en`, `description_ar`, `price`, `is_active`, `is_price_options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 2, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'uploads/services/1683795230_377402.webp', 'uploads/services/1683795230_286569.webp', 'Freshen up our seats by removing stains, debris and dirt using specialized materials and handling it at utmost care.', 'جدد مقاعدنا عن طريق إزالة البقع والحطام والأوساخ باستخدام مواد متخصصة والتعامل معها بعناية فائقة.', 100.00, 1, 0, '2023-05-11 08:53:50', '2023-10-04 00:46:18', NULL),
(4, 2, 'Seat buff', 'مقعد برتقالي', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'uploads/services/1683795276_577732.webp', 'uploads/services/1683795276_362720.webp', 'Freshen up our seats by removing stains, debris and dirt using specialized materials and handling it at utmost care.', 'جدد مقاعدنا عن طريق إزالة البقع والحطام والأوساخ باستخدام مواد متخصصة والتعامل معها بعناية فائقة.', 100.00, 1, 0, '2023-05-11 08:54:36', '2023-10-04 00:46:20', NULL),
(5, 7, 'Gleem', 'جليم', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'uploads/services/1683795305_573824.webp', 'uploads/services/1683795305_684737.webp', 'Freshen up our seats by removing stains, debris and dirt using specialized materials and handling it at utmost care.', 'جدد مقاعدنا عن طريق إزالة البقع والحطام والأوساخ باستخدام مواد متخصصة والتعامل معها بعناية فائقة.', 100.00, 0, 0, '2023-05-11 08:55:05', '2023-10-04 15:49:50', NULL),
(6, 7, 'Lavish', 'مسرف', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'uploads/services/1683795330_790295.webp', 'uploads/services/1683795330_712589.webp', 'Freshen up our seats by removing stains, debris and dirt using specialized materials and handling it at utmost care.', 'جدد مقاعدنا عن طريق إزالة البقع والحطام والأوساخ باستخدام مواد متخصصة والتعامل معها بعناية فائقة.', 100.00, 0, 0, '2023-05-11 08:55:31', '2023-10-04 15:49:50', NULL),
(12, 1, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'uploads/services/1685010890_144668.webp', 'uploads/services/1684412494_780906.webp', 'Add Servicess editedddddd', 'nullssss', 150.00, 1, 0, '2023-05-17 09:14:30', '2023-10-04 00:46:14', NULL),
(13, 1, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'uploads/services/1684338412_640948.webp', 'uploads/services/1684338412_605089.webp', 'Incididunt in blanditiis dolores voluptas sit eum enim sit incididunt eos', 'Natus cupiditate minima asperiores beatae perspiciatis perferendis quo aut saepe magna ex aperiam', 0.00, 1, 1, '2023-05-17 15:46:53', '2023-10-04 00:46:15', NULL),
(15, 2, 'Service Title', 'Service Title Arabic', 'Service Short Description', 'Service Short Description Arabic\r\nService Short Description Arabic\r\nService Short Description Arabic\r\nService Short Description Arabic\r\nService Short Desc', 'uploads/services/1684397698_283943.webp', 'uploads/services/1684397698_584373.webp', NULL, NULL, 2222.33, 1, 0, '2023-05-18 08:14:58', '2023-10-04 00:46:19', NULL),
(17, 1, 'test', 'test', 'test', 'test', 'uploads/services/1685025364_401254.webp', 'uploads/services/1685025364_984787.webp', 'test', 'test', 100.00, 1, 0, '2023-05-25 17:36:04', '2023-10-04 00:46:16', NULL),
(18, 1, 'test refactor', 'Debitis eu libero ut', 'test refactor', 'Voluptatem aperiam autem quia itaque sunt autem excepteur vel a', 'uploads/services/1692201216_787431.webp', 'uploads/services/1692201216_595183.webp', 'test refactor', 'Deleniti magna in accusamus eum aut minim', 500.00, 0, 0, '2023-08-16 18:53:37', '2023-08-16 18:54:07', '2023-08-16 18:54:07'),
(19, 1, 'asfasf', 'Et voluptatem accusa', 'asfa', 'Laborum cupiditate suscipit consectetur voluptates natus totam corporis repudiandae numquam ipsum consectetur minus labore maiores praesentium animi', 'uploads/services/1692261970_194817.webp', 'uploads/services/1692261970_329401.webp', 'asffas', 'Laborum Nihil expedita deleniti rerum aut ut perspiciatis atque enim aut omnis eu est animi', 600.00, 10, 0, '2023-08-17 11:46:10', '2023-08-17 11:46:18', '2023-08-17 11:46:18'),
(20, 1, 'Amet tempora volupt', 'Quam similique ut un', 'Ex necessitatibus quia cupidatat est dolore quisquam culpa duis velit magni ut non vel', 'Voluptate reprehenderit cumque voluptatum consequuntur ullamco quos est nobis unde ut eiusmod ea sequi', 'uploads/services/1692262096_221360.webp', 'uploads/services/1692262096_700356.webp', 'Veritatis eum provident dolor fugiat consectetur unde dolorum eaque omnis elit sint non vel deserunt sed delectus', 'A ut obcaecati voluptas sunt ut quam sunt vero alias voluptate odit omnis odit', 800.00, 1, 0, '2023-08-17 11:48:16', '2023-08-17 12:10:28', '2023-08-17 12:10:28'),
(21, 1, 'Laborum veniam in d', 'Tempor accusamus sun', 'Voluptas sunt placeat sunt aut voluptatem nisi irure exercitation ex cumque quidem impedit magnam nemo', 'Voluptas saepe proident ullam exercitation ducimus non voluptas libero in quia autem quas deserunt nemo sunt enim cumque placeat', 'uploads/services/1692263143_752458.webp', 'uploads/services/1692263143_377787.webp', 'Aliqua Soluta animi perspiciatis et esse maiores earum aut', 'Deserunt eaque placeat fugiat consequat Veritatis voluptas id totam quia perspiciatis architecto ut unde est consequat Eos', 600.00, 1, 0, '2023-08-17 12:05:43', '2023-08-17 12:10:26', '2023-08-17 12:10:26'),
(22, 1, 'Sapiente nihil est', 'Mollitia anim natus', 'Quisquam ea placeat quo quo porro est nemo sed adipisci ipsam veniam in', 'Eu sunt consequuntur praesentium omnis sint sed sit lorem explicabo', 'uploads/services/1692263416_255073.webp', 'uploads/services/1692263416_491364.webp', 'Incididunt voluptates quia soluta asperiores minima earum', 'Voluptate sequi reiciendis esse mollitia qui voluptatem ea', 300.00, 1, 0, '2023-08-17 12:10:16', '2023-08-17 12:10:23', '2023-08-17 12:10:23'),
(23, 1, 'Nostrud ut dolorem e', 'Quos vel optio tene', 'Delectus consectetur nostrud et enim quia optio minim a officia cum possimus repellendus Qui non duis sapiente nisi eum sunt', 'Odit in culpa et vero rerum', 'uploads/services/1692263510_152627.webp', 'uploads/services/1692263511_555058.webp', 'Delectus non voluptatem sunt harum voluptates maiores in dolores excepteur', 'Pariatur Quaerat necessitatibus voluptates quam et magnam', 600.00, 1, 0, '2023-08-17 12:11:51', '2023-10-04 00:46:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_providers`
--

CREATE TABLE `service_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_id_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_providers`
--

INSERT INTO `service_providers` (`id`, `name`, `phone`, `address`, `image`, `national_id`, `national_id_image`, `is_active`, `is_available`, `rating`, `rating_count`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Service Provider Name Update', '01004338482', 'Address Addreess Update', 'uploads/service_providers/1692176413_904182.webp', '20120122220221', 'uploads/service_providers/1692176414_929474.webp', 1, 1, 1.75, 4, '2023-08-15 17:44:53', '2023-08-22 21:48:17', NULL),
(2, 'Service Provider Name Two', '01004338482', 'Address Addreess 2', 'uploads/service_providers/1692110776_255935.webp', '20120122220221', 'uploads/service_providers/1692110777_149656.webp', 0, 1, 0.00, 0, '2023-08-15 17:46:30', '2023-08-24 14:04:31', NULL),
(3, 'Service Provider Name Two', '01004338482', 'Address Addreess 2', 'uploads/service_providers/1692176153_679202.webp', '20120122220221', 'uploads/service_providers/1692176153_789611.webp', 1, 1, 0.00, 0, '2023-08-16 11:56:07', '2023-08-24 13:51:10', NULL),
(4, 'Service Provider Name Two', '01004338482', 'Address Addreess 2', 'uploads/service_providers/1692176520_210852.webp', '20120122220221', 'uploads/service_providers/1692176520_891913.webp', 1, 1, 0.00, 0, '2023-08-16 12:02:01', '2023-08-24 13:51:08', NULL),
(5, 'Sed dolores expedita', '12345645666', 'Esse placeat aliqua', 'uploads/service_providers/1692284734_359332.webp', 'asdasdasdasdasdas', 'uploads/service_providers/1692284734_719207.webp', 1, 0, 0.00, 0, '2023-08-17 18:05:34', '2023-09-18 15:28:36', NULL),
(6, 'Iusto ducimus nostr', '11111111111', 'Accusantium ab conse', 'uploads/service_providers/1692618413_328628.webp', '54654654654654654', 'uploads/service_providers/1692618413_532770.webp', 1, 1, 0.00, 0, '2023-08-21 14:46:53', '2023-08-24 13:51:20', NULL),
(7, 'test one', '55555555555', 'Tempor perspiciatis', 'uploads/service_providers/1692627763_456008.webp', 'Fugiat autem in et d', 'uploads/service_providers/1692627764_888290.webp', 1, 1, 0.00, 0, '2023-08-21 17:22:44', '2023-08-24 13:51:19', NULL),
(8, 'Enim aliquip sit ill', '21154896677', 'Quia velit iure sequ', 'uploads/service_providers/1692712827_176120.webp', 'Voluptatum enim irur', 'uploads/service_providers/1692712827_290298.webp', 1, 1, 0.00, 0, '2023-08-22 17:00:27', '2023-08-24 13:51:18', NULL),
(9, 'Totam iusto do enim', '11111111154', 'Perferendis saepe vo', 'uploads/service_providers/1692780176_377871.webp', 'fskflkdjfslkfjslkdfjslkfsdlkfjslkf', 'uploads/service_providers/1692780177_669793.webp', 1, 1, 0.00, 0, '2023-08-23 11:42:58', '2023-08-23 11:42:58', NULL),
(10, 'Veniam harum consec', '22222222222', 'Illum libero enim i', 'uploads/service_providers/1693739855_662886.webp', 'fsdsdfsdfsdfsdf', 'uploads/service_providers/1693739855_990135.webp', 1, 1, 0.00, 0, '2023-09-03 14:17:36', '2023-09-03 14:17:36', NULL),
(11, 'Aut quia quia quis o', '55555555555', 'Quis sit ex magni e', 'uploads/service_providers/1693740297_239463.webp', 'Dolores consequat M', 'uploads/service_providers/1693740297_738409.webp', 1, 1, 0.00, 0, '2023-09-03 14:24:57', '2023-09-03 14:24:57', NULL),
(12, 'Nulla sed velit quas', '36525254877', 'Est quis dolorum in', 'uploads/service_providers/1693740673_391807.webp', 'asdasdasdadasdasda', 'uploads/service_providers/1693740673_235460.webp', 1, 1, 0.00, 0, '2023-09-03 14:31:13', '2023-09-03 14:31:13', NULL),
(13, 'ahmed ahmed', '01234567890', '123 ahmed st', 'uploads/service_providers/1695040197_178221.webp', '123123123123123', 'uploads/service_providers/1695040197_625031.webp', 1, 1, 0.00, 0, '2023-09-18 15:29:57', '2023-09-18 15:29:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_compounds`
--

CREATE TABLE `service_provider_compounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_provider_id` bigint(20) UNSIGNED NOT NULL,
  `compound_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_provider_compounds`
--

INSERT INTO `service_provider_compounds` (`id`, `service_provider_id`, `compound_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 2, 1, NULL, NULL),
(4, 3, 1, NULL, NULL),
(5, 4, 1, NULL, NULL),
(6, 1, 3, NULL, NULL),
(7, 5, 2, NULL, NULL),
(8, 5, 3, NULL, NULL),
(9, 6, 7, NULL, NULL),
(11, 6, 6, NULL, NULL),
(20, 8, 6, NULL, NULL),
(21, 7, 7, NULL, NULL),
(22, 7, 6, NULL, NULL),
(23, 9, 7, NULL, NULL),
(24, 10, 6, NULL, NULL),
(25, 10, 7, NULL, NULL),
(26, 11, 6, NULL, NULL),
(27, 11, 7, NULL, NULL),
(28, 12, 6, NULL, NULL),
(29, 12, 7, NULL, NULL),
(30, 13, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `title_en`, `title_ar`, `is_active`, `image_en`, `image_ar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Car Wash', 'غسيل السيارة', 1, 'uploads/service_types/1684055415_685989.webp', 'uploads/service_types/1683703264_168451.webp', '2023-05-10 07:21:04', '2023-10-04 00:46:04', NULL),
(2, 'Car Detailing', 'تفاصيل السيارة', 1, 'uploads/service_types/1683703339_810213.webp', 'uploads/service_types/1683703339_646284.webp', '2023-05-10 07:22:19', '2023-10-01 13:16:02', NULL),
(7, 'Car Wash2', 'غسيل السيارة2', 0, 'uploads/service_types/1684055498_935446.webp', 'uploads/service_types/1684055463_842633.webp', '2023-05-10 07:22:59', '2023-10-04 15:49:50', NULL),
(10, 'Motor Cleaning', 'غسيل موتور', 1, 'uploads/service_types/1685009104_836928.webp', 'uploads/service_types/1685009104_687218.webp', '2023-05-25 10:05:04', '2023-10-15 12:42:49', NULL),
(11, 'Oil Change', 'Oil Change AR', 1, 'uploads/service_types/1695639985_252947.webp', 'uploads/service_types/1691579876_349565.webp', '2023-08-09 14:17:57', '2023-10-15 12:42:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_dimensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `key`, `value`, `image_dimensions`, `created_at`, `updated_at`) VALUES
(1, 'working_hours', 'working_hours_en', 'Current Working Hours: 9 PM - 7 AM', NULL, NULL, '2023-09-26 16:00:41'),
(2, 'working_hours', 'working_hours_ar', 'ساعات العمل الحالية: 9 مساءً - 7 صباحًا', NULL, NULL, '2023-09-26 16:00:41'),
(3, 'contact_info', 'phone', '015144452256', NULL, NULL, '2023-09-26 16:00:41'),
(4, 'contact_info', 'email', 'info@cjet.app', NULL, NULL, '2023-09-26 16:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` enum('en','ar') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `is_sms_offers` tinyint(1) NOT NULL DEFAULT 1,
  `last_activity_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `temp_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_notification` tinyint(1) DEFAULT 1,
  `promotional_sms` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `email_verified_at`, `phone`, `phone_verified_at`, `image`, `apple_social_id`, `google_social_id`, `facebook_social_id`, `lang`, `is_sms_offers`, `last_activity_at`, `remember_token`, `created_at`, `updated_at`, `temp_phone`, `promotional_notification`, `promotional_sms`) VALUES
(2, 'Fareeda', '$2y$10$PgKPC85xXe4mM.zbQEb6FuJ3C4ckUzHYnyl/c4Y9/l87EjsaThxRG', NULL, NULL, '01004338480', NULL, NULL, NULL, '104187563338743649555', '10418756333874364977', 'en', 1, NULL, NULL, '2023-05-25 13:32:21', '2023-05-25 13:32:21', NULL, 1, 1),
(3, 'Fareeda', '$2y$10$oucqVFc/lNlBl1HIOdS/s.c1IvmwpVPIQcLTlC6jGfZSpG6gvWOyS', NULL, NULL, '01004338481', '2023-05-25 13:47:36', NULL, '1041875633387436494699', NULL, NULL, 'en', 1, NULL, NULL, '2023-05-25 13:47:14', '2023-05-25 13:47:36', NULL, 1, 1),
(4, 'Fareeda', '$2y$10$mztExPJ228PeUAa8ko8Hg.ab/K64tWK4VUOjKsUWpsdlNFZ20kqcq', NULL, NULL, '01004338483', '2023-06-04 16:46:51', NULL, NULL, NULL, NULL, 'en', 1, '2023-06-04 16:47:12', NULL, '2023-05-25 13:48:15', '2023-06-04 16:47:12', NULL, 1, 1),
(5, 'Fareeda', '$2y$10$9Kv4aRf0WVG/pn2vxnppD.YefZj3n8zBOYrj3X1rToDBf.OqINidq', NULL, NULL, '01004338484', NULL, NULL, NULL, NULL, NULL, 'en', 1, NULL, NULL, '2023-05-29 17:23:08', '2023-05-29 17:23:08', NULL, 1, 1),
(7, 'ahm', '$2y$10$uOQxBKbdXIJ9miTSiXOVwO4tinIPysPsXvewq9SM9hTYPDYrNSJYq', 'ahmed.ammar@social-nuts.com', NULL, '01122703299', NULL, NULL, NULL, '110700971395955879396', NULL, 'en', 1, '2023-06-05 10:12:01', NULL, '2023-05-29 20:46:24', '2023-06-05 10:43:15', '01122703299', 1, 1),
(8, 'Fareeda', '$2y$10$HUIO5Z./GSs/7UoCI.q69.dJc6FZB0WsiADzN6vKrmSL3k7HtFLT6', NULL, NULL, '01004338485', NULL, NULL, NULL, NULL, NULL, 'en', 1, NULL, NULL, '2023-05-30 13:32:30', '2023-05-30 13:32:30', NULL, 1, 1),
(9, 'Fareeda', NULL, 'hager.mazhar@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '104187563338743649466', 'en', 1, NULL, NULL, '2023-05-30 13:35:27', '2023-05-30 13:35:27', NULL, 1, 1),
(10, 'Fareeda', '$2y$10$GaDJBrFPb9GmxUiECuvQI.Ebcug.THzRW6W8J5tYwNR5tvbREJmky', NULL, NULL, '01004338486', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-05-31 15:03:36', NULL, '2023-05-31 15:03:36', '2023-05-31 15:03:36', NULL, 1, 1),
(11, 'Fareeda', '$2y$10$9OnKr7MSzSA9.4fn6uH.3OmTDwJAUPpyHUgZ..bNkAo3nXWbFWIqm', NULL, NULL, '01004338487', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-05-31 15:03:41', NULL, '2023-05-31 15:03:41', '2023-05-31 15:03:41', NULL, 1, 1),
(12, 'Fareeda', '$2y$10$JMp.t6UnAdncr72zM1PE9uVhscz34RZJKm.8Iw9lUg4umyRZ/ZubO', NULL, NULL, '01004338488', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-05-31 15:03:45', NULL, '2023-05-31 15:03:45', '2023-05-31 15:03:45', NULL, 1, 1),
(13, 'Ahm', '$2y$10$FuK8e/UnZ9P4Qim3L8wK1eIT3RYA6B964CTkgl/YgoGRoux5Ek8dy', NULL, NULL, '01122703289', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-06-01 00:10:22', NULL, '2023-06-01 00:10:22', '2023-06-01 00:10:22', NULL, 1, 1),
(14, 'moha', '$2y$10$ixGyMhK19TMjQW4f7k93k.Oll5nitfa5q9AfvblKlTwGQKhowW//e', NULL, NULL, '01122234456', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-06-01 00:12:17', NULL, '2023-06-01 00:12:17', '2023-06-01 00:12:17', NULL, 1, 1),
(15, 'moha', '$2y$10$tGqrLykp60oRa9v1n6TKvePtpAWjkd5zdxp6BtI3drQIzJj90cCq2', NULL, NULL, '01122234453', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-06-01 00:13:41', NULL, '2023-06-01 00:13:41', '2023-06-01 00:13:41', NULL, 1, 1),
(16, 'momo', '$2y$10$FVJv5MoIY4Jsvk0PUyYkOeEMRuSTbZEcFm37VQtNezIZtB1Aq5Krm', NULL, NULL, '01122200223', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-06-01 00:40:49', NULL, '2023-06-01 00:40:49', '2023-06-01 00:40:49', NULL, 1, 1),
(17, 'fkkf', '$2y$10$wy7tnBMibdMvJpHhBR9Wces4EvrVmnjwpa3qrOtpDOihPidfNWFOy', NULL, NULL, '01122334455', '2023-06-01 00:46:24', NULL, NULL, NULL, NULL, 'en', 1, '2023-06-01 00:44:16', NULL, '2023-06-01 00:44:16', '2023-06-01 00:46:24', NULL, 1, 1),
(18, 'Ahm', '$2y$10$o1HSXl4WrqXbld.3paKeDOvnF9PqF0bgXsl3RTlNOMeNjz9X4/O4W', NULL, NULL, '01122703291', '2023-06-03 16:16:57', NULL, NULL, NULL, NULL, 'en', 1, '2023-06-03 16:17:10', NULL, '2023-06-03 15:58:17', '2023-06-03 16:17:10', NULL, 1, 1),
(19, 'Fareeda', NULL, 'hager.mazhar2020@gmail.com', NULL, '01010012020', '2023-06-04 16:32:50', NULL, NULL, NULL, '104187563338743642020', 'en', 1, '2023-06-04 16:32:50', NULL, '2023-06-04 16:31:23', '2023-06-05 08:49:43', '01010012020', 1, 1),
(23, 'Fareeda Name Updated', '$2y$10$PgKPC85xXe4mM.zbQEb6FuJ3C4ckUzHYnyl/c4Y9/l87EjsaThxRG', 'a.abdelrhim@soical-nuts.com', NULL, '01090881192', '2023-09-25 00:15:49', 'uploads/users/1695575598_759823.webp', NULL, NULL, NULL, 'en', 1, '2023-09-25 00:15:49', NULL, '2023-06-07 10:22:25', '2023-10-09 11:28:27', '01022568932', 0, 1),
(25, 'nancy nabil', '$2y$10$5hMpWzyc8PZ8QunP17fjweFwQna6KmewmDJPhNJaIYyejXssHXU7u', NULL, NULL, '01024236008', '2023-06-11 17:04:12', NULL, NULL, NULL, NULL, 'en', 1, '2023-06-11 17:03:22', NULL, '2023-06-11 17:03:22', '2023-06-11 17:04:12', NULL, 1, 1),
(26, 'doha', NULL, 'g5bvymxsfh@privaterelay.appleid.com', NULL, NULL, NULL, NULL, 'ce950bcc31c4d4dc580da9e8628044a24.0.rrxtw.hWiy4Mwu3GwNwCuWHoDJRg', NULL, NULL, 'en', 1, '2023-06-25 05:10:46', NULL, '2023-06-25 05:10:46', '2023-06-25 05:10:46', NULL, 1, 1),
(27, 'Doha Ayman', NULL, 'doha.ayman17@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '6327140240666292', 'en', 1, '2023-07-05 12:10:35', NULL, '2023-07-05 12:10:35', '2023-08-31 14:12:34', '01017111071', 1, 1),
(30, 'Fareeda', '$2y$10$UHdjOsgXxV9gus47Nu.6XOdsad03fhoocMlTmizj9kjvRL64SEV6i', NULL, NULL, '01004338489', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-08-30 11:35:07', NULL, '2023-08-30 11:35:07', '2023-08-30 11:35:07', NULL, 1, 1),
(31, 'paula', '$2y$10$t2CzIQQFbFOg6oz7dGDZ7.517tsSxWd1GBxg2ll3nHn4YR8ZsPJ4C', NULL, NULL, '01129886336', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-08-30 11:35:19', NULL, '2023-08-30 11:35:19', '2023-08-30 11:35:19', NULL, 1, 1),
(32, 'doha aym', '$2y$10$XK5qQyHQ2/V2RrqAq0HhkOwMN2cerZS1NY1gNSfJFLaGFVVx8iDx6', NULL, NULL, '01017111071', '2023-08-30 12:58:42', NULL, NULL, NULL, NULL, 'en', 1, '2023-08-30 12:57:27', NULL, '2023-08-30 12:57:27', '2023-08-30 12:58:42', NULL, 1, 1),
(33, 'An', '$2y$10$uBB1PZ/WcvSM6I0GFOMriuZgqjB4nQjiBBC.fIibCLEeJTwWl0Tkq', NULL, NULL, '01022568938', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 12:54:08', NULL, '2023-09-05 12:54:08', '2023-09-05 12:54:08', NULL, 1, 1),
(34, 'Isabella Catherine Gabriella Rodriguez-Garcia Om', '$2y$10$gPXcDVQ3ua.S7zDHtd216urGvGMAPJcCKfqy5xcR4ZakeIoOU9Fia', NULL, NULL, '01234567890', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:02:35', NULL, '2023-09-05 13:02:35', '2023-09-05 13:02:35', NULL, 1, 1),
(36, 'Isabella Catherine Gabriella Rodriguez-Garcia A', '$2y$10$wJGbObmZXK69ylWfR/yBS.ggI2ezrbJ062qXH80RG3A.PD1gy0AgS', NULL, NULL, '01100236655', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:24:22', NULL, '2023-09-05 13:24:22', '2023-09-05 13:24:22', NULL, 1, 1),
(37, 'Isabella Catherine Gabriella Rodriguez-Garcia Om', '$2y$10$ehw.y.XsK1N1jhnDVwNv8.w2ss4pbpyAUnfckiahQUp.UqmnJmW12', NULL, NULL, '01100236654', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:24:43', NULL, '2023-09-05 13:24:43', '2023-09-05 13:24:43', NULL, 1, 1),
(38, 'Isabella Catherine Gabriella Rodriguez-Garcia Ibrah', '$2y$10$Ssz.lnWESgnJaHfy5K0qhOK5HAeUV0DxMx1nI07463cDgqOvM2Q5y', NULL, NULL, '01100236653', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:24:59', NULL, '2023-09-05 13:24:59', '2023-09-05 13:24:59', NULL, 1, 1),
(39, 'Ame', '$2y$10$z2W7HTVViJNSsCDR/BZWxebh82TCUkDT7UHnejPYqLxNdcRKcJUPS', NULL, NULL, '01100236652', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:25:18', NULL, '2023-09-05 13:25:18', '2023-09-05 13:25:18', NULL, 1, 1),
(40, 'Ibrah', '$2y$10$kPaMeu98/V5xlqv07Kwf5e34FJB7qXg7EOSKSrPiCg7chX1LNd1pC', NULL, NULL, '01100236649', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:32:43', NULL, '2023-09-05 13:32:43', '2023-09-05 13:32:43', NULL, 1, 1),
(41, 'Ibrah', '$2y$10$JeMFdgZJ5V6xHukG6G.Ir.v1ti5pCy.owqhKEPp3xq8Wr5qaa07RK', NULL, NULL, '01100236648', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:32:57', NULL, '2023-09-05 13:32:57', '2023-09-05 13:32:57', NULL, 1, 1),
(42, 'Ibrah', '$2y$10$QwVdSFiwYGaBcK8dW9IT4.upABpmgqBRYw8pBzGUHNjUws6Jee4zO', NULL, NULL, '01100236647', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:33:29', NULL, '2023-09-05 13:33:29', '2023-09-05 13:33:29', NULL, 1, 1),
(43, 'Ibrahim', '$2y$10$uowp4k5Ts/T6zUTWGJjM9eC60tP1DhemohnEOnsLN7tQbWeZtsleK', NULL, NULL, '01100236646', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 13:34:44', NULL, '2023-09-05 13:34:44', '2023-09-05 13:34:44', NULL, 1, 1),
(44, 'Ibrabi', '$2y$10$YUStOqwepU9wJ5BbW.Q27.1Y9YqaN0/2jfFl8I8gi3mf8dwletFbq', NULL, NULL, '01022568999', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:03:38', NULL, '2023-09-05 14:03:38', '2023-09-05 14:03:38', NULL, 1, 1),
(45, 'hager', '$2y$10$LVYRfjTMKWv6myTPKSCPqOYt31txhcsnMw6K/ET7PdTKySGXmGgVq', NULL, NULL, '01004338482', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:04:38', NULL, '2023-09-05 14:04:38', '2023-09-05 14:04:38', NULL, 1, 1),
(46, 'fareeda', '$2y$10$Wux7t1O.9tTUSGKJcQi6KeRHb2yr8FKuOsxFO2E6xGxoe1Rz1SZwq', NULL, NULL, '01114629933', '2023-09-05 14:15:31', NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:05:50', NULL, '2023-09-05 14:05:50', '2023-09-05 14:15:31', NULL, 1, 1),
(50, 'Amr', '$2y$10$thf0A5EEE1c3V/OZcbDakewkFbv8S3xLKIWgHKN1sz2h/vQUNMEuW', NULL, NULL, '01022568990', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:44:49', NULL, '2023-09-05 14:44:49', '2023-09-05 14:44:49', NULL, 1, 1),
(51, 'Amro', '$2y$10$gNUKr2k4iknxLHtZzEhauuNJdaOTa24ZFodgf/CVz9.Ez9n0ZLlGK', NULL, NULL, '01022568991', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:45:38', NULL, '2023-09-05 14:45:38', '2023-09-05 14:45:38', NULL, 1, 1),
(52, 'Amro', '$2y$10$MNkWlvP02Z4ANDOpfUvwKe058JMM6t93OW3uR8iTme7ljtRkDVok.', NULL, NULL, '01100236642', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:47:34', NULL, '2023-09-05 14:47:34', '2023-09-05 14:47:34', NULL, 1, 1),
(53, 'Ah', '$2y$10$OE/41cYbjqdsCMZY2Dkpwekc7jGItxypiXCYDR//fUuWfNZlc8tMm', NULL, NULL, '01122703297', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:53:41', NULL, '2023-09-05 14:53:41', '2023-09-05 14:53:41', NULL, 1, 1),
(54, 'Ahm', '$2y$10$YbuQF1si2ApgKoUcumZFy.qPyAZcOgo1ExcxDxx.k8WxkVvYaVmxS', NULL, NULL, '01222703297', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 14:59:40', NULL, '2023-09-05 14:59:40', '2023-09-05 14:59:40', NULL, 1, 1),
(55, 'Ahmed', '$2y$10$6JHYWZRc.XUwwGHnTxL/OOBMdIA2E8GCqKyhVfZBGxgY7SnsqMfAO', NULL, NULL, '01122708983', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:05:16', NULL, '2023-09-05 15:05:16', '2023-09-05 15:05:16', NULL, 1, 1),
(56, 'Ahmed', '$2y$10$dzcl.P/6u21f4YDS9f.UkOvScp9Uh0Kp60WoopjZ2zNzNVduy4II6', NULL, NULL, '01227032580', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:08:13', NULL, '2023-09-05 15:08:13', '2023-09-05 15:08:13', NULL, 1, 1),
(57, 'Ahmed', '$2y$10$v3jTIkMVmP/vPE6oOikMcu1HgbShlXPQNk1biIve.meXTPrXnAIsa', NULL, NULL, '01022173580', '2023-09-05 15:10:56', NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:08:36', NULL, '2023-09-05 15:08:36', '2023-09-05 15:10:56', NULL, 1, 1),
(58, 'Amr', '$2y$10$2bwl0U3Tc41rskVnXpd6JO7aRKF0y9N02dRlPuJ8VnUMG0rNIBjk2', NULL, NULL, '01100236620', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:35:01', NULL, '2023-09-05 15:35:01', '2023-09-05 15:35:01', NULL, 1, 1),
(59, 'Am', '$2y$10$H/mBxKPj1/39h0DbNyMkX.nPWDTBvfpmkYx9A3pGK9QDMAebMTqzG', NULL, NULL, '01100236621', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:35:10', NULL, '2023-09-05 15:35:10', '2023-09-05 15:35:10', NULL, 1, 1),
(60, 'Amr', '$2y$10$At1j4wZLPSKaWFF4nLXVj.sCFGaOgPNfAYOx8pc6IQCqqKPOTl.Fi', NULL, NULL, '01100236622', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:35:34', NULL, '2023-09-05 15:35:34', '2023-09-05 15:35:34', NULL, 1, 1),
(61, 'Am', '$2y$10$oMf/BLcuz.nz9n9In1XGi.i1xvyC393anPFteo446F4cN2fFXIVni', NULL, NULL, '01199887766', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:53:43', NULL, '2023-09-05 15:53:43', '2023-09-05 15:53:43', NULL, 1, 1),
(62, 'Isabella Catherine Gabriella Rodriguez-Garcia Ammar', '$2y$10$57o5456Qs9cCEBN4XhWjoucrF31c5hpLMLGPegOzH2v3Ir4k5mvl2', NULL, NULL, '01199887767', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:54:26', NULL, '2023-09-05 15:54:26', '2023-09-05 15:54:26', NULL, 1, 1),
(63, 'Isabella Catherine Gabriella Rodriguez-Garcia Ammar', '$2y$10$wdTLc0XkKoipabKgKpRjUuI3/BtRlf1PSkwfIjxvzncyP7V7uW4ry', NULL, NULL, '01199887768', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 15:55:02', NULL, '2023-09-05 15:55:02', '2023-09-05 15:55:02', NULL, 1, 1),
(64, 'Amr', '$2y$10$9B9NrxJjjtA3eYm/BpuX8.GPpFO8IuiSqt9O3aYDjC6SjQYPdwoQ2', NULL, NULL, '01188443366', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 16:07:14', NULL, '2023-09-05 16:07:14', '2023-09-05 16:07:14', NULL, 1, 1),
(65, 'Amro', '$2y$10$JxeONC4dqZfCmS3hCC/fheQULJtoS8JSihyz56D6SG.pD6z/UOT1m', NULL, NULL, '01155334499', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-05 16:18:45', NULL, '2023-09-05 16:18:45', '2023-09-05 16:18:45', NULL, 1, 1),
(67, 'Isabella Catherine Gabriella Rodriguez-Garcia Ammar', '$2y$10$hjblAomBNi8KHMZb3UZgLOdMiatqEXNRz4QU7j8li9gp51z8Ggnw2', NULL, NULL, '01155324499', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-06 13:26:59', NULL, '2023-09-06 13:26:59', '2023-09-06 13:26:59', NULL, 1, 1),
(68, 'Ibrahim', '$2y$10$JoSqVkbYvRxWkKJrxXYsOu4XEYrisy/2dP2tFefxdhMHxAbtcIujy', NULL, NULL, '01155324498', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-09-06 13:28:19', NULL, '2023-09-06 13:28:19', '2023-09-06 13:28:19', NULL, 1, 1),
(70, 'Ibrahim', '$2y$10$5XxIXh/Qk0LDL3XGi5x.w.Yx7sUe7va5tJhdwyVxyIJJRxj9oYQa2', 'ibrahim@social-nuts.com', NULL, '01022568933', '2023-10-08 13:36:41', NULL, NULL, NULL, NULL, 'en', 1, '2023-10-04 11:46:33', NULL, '2023-09-07 15:43:48', '2023-10-09 15:25:35', NULL, 1, 1),
(71, 'Ibrahim', '$2y$10$6UIr9C/5EM.z4Mc1Yxuk..vgePunhAyUPt1R8PkNtlqTZ/cqGZrtO', NULL, NULL, '01255664411', '2023-09-18 13:19:47', NULL, NULL, NULL, NULL, 'en', 1, '2023-09-18 13:19:17', NULL, '2023-09-18 13:19:17', '2023-09-18 13:19:47', NULL, 1, 1),
(72, 'Wael Hassan', '$2y$10$lbVJGGLztOzeNMmxckkXjOkoZfzm0v6wuoOKlCyZQGpTonRTmGtKm', NULL, NULL, '01094477031', '2023-10-01 14:17:33', NULL, NULL, NULL, NULL, 'en', 1, '2023-10-01 14:14:16', NULL, '2023-10-01 14:14:16', '2023-10-01 14:17:33', NULL, 1, 1),
(73, 'Ahmed Mostafa', NULL, 'ahmedmostafa247@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, '7179372455435986', 'en', 1, '2023-10-05 20:27:22', NULL, '2023-10-05 20:27:22', '2023-10-05 20:27:30', '01122703297', 1, 1),
(74, 'Ibrahim Bibers', '$2y$10$8FbP8LN.4o/CajbxduRkIeBdDCLZs.a9lY5r1lkhkF2sgcsAf2Aem', 'a.abdelrhim@social-nuts.com', NULL, '01022568932', '2023-10-09 11:35:38', 'uploads/users/1697055575_418699.webp', NULL, NULL, NULL, 'en', 1, '2023-10-09 11:34:49', NULL, '2023-10-09 11:34:49', '2023-10-12 00:01:40', '01022568930', 1, 1),
(75, 'Ahmed', '$2y$10$0TCTDMf0m2zYhUULj15rpuXMGpB6Z8xnmjzLsKxDQ5lCygg9MvzRa', NULL, NULL, '01122903286', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-10-14 20:12:19', NULL, '2023-10-14 20:12:19', '2023-10-14 20:12:19', NULL, 1, 1),
(76, 'ahmed', '$2y$10$hRyXmOesITfjDE3KGjsntuuDVWpF8MVTtx10qJqRu3ICaQH5ZG87K', NULL, NULL, '01122222222', NULL, NULL, NULL, NULL, NULL, 'en', 1, '2023-10-14 20:25:47', NULL, '2023-10-14 20:25:47', '2023-10-14 20:25:47', NULL, 1, 1),
(77, 'Ahmed Abdelrhim', '$2y$10$PgKPC85xXe4mM.zbQEb6FuJ3C4ckUzHYnyl/c4Y9/l87EjsaThxRG', 'aabdelrhim974@gmail.com', NULL, '01152067271', '2023-10-17 10:02:31', 'uploads/users/1697055575_418699.webp', NULL, NULL, NULL, 'en', 1, NULL, NULL, '2023-10-17 08:47:45', NULL, '01152067271', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` int(11) NOT NULL,
  `compound_id` int(11) NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `city_id`, `compound_id`, `street`, `unit`, `is_default`, `created_at`, `updated_at`, `deleted_at`, `is_active`) VALUES
(1, 23, 1, 1, NULL, '45-B', 0, '2023-07-19 17:53:57', '2023-09-28 16:17:18', NULL, 1),
(2, 23, 2, 2, 'abc street', '3-A', 0, '2023-07-19 17:54:36', '2023-09-28 16:17:28', NULL, 0),
(3, 23, 2, 2, 'abc street', '3-A', 0, '2023-08-01 16:39:05', '2023-09-28 16:21:47', NULL, 0),
(4, 23, 2, 2, 'abc street', '3-A', 0, '2023-08-01 16:48:48', '2023-09-28 16:23:22', NULL, 0),
(5, 23, 2, 2, 'abc street', '3-A', 0, '2023-08-14 20:09:24', '2023-09-28 16:24:27', NULL, 0),
(6, 23, 1, 1, 'name', '123', 1, '2023-08-14 20:24:45', '2023-09-28 16:48:08', NULL, 0),
(7, 23, 1, 1, 'test', '123', 1, '2023-08-14 20:28:21', '2023-09-28 16:47:28', NULL, 1),
(8, 23, 1, 1, 'sdsd', '12', 0, '2023-08-14 20:39:23', '2023-09-28 16:27:44', NULL, 0),
(9, 23, 1, 1, 'sdsdsd', '12123', 0, '2023-08-15 20:08:30', '2023-09-28 16:29:02', NULL, 0),
(10, 23, 1, 1, '2sdsd', '23d', 0, '2023-08-15 20:10:55', '2023-09-28 16:29:08', NULL, 0),
(11, 23, 1, 1, 'eweew', 'wewe', 0, '2023-08-15 22:08:17', '2023-08-15 22:41:18', NULL, 1),
(12, 23, 1, 1, 'nmnm', 'jkjkj', 0, '2023-08-15 22:41:18', '2023-08-15 22:55:45', NULL, 1),
(13, 23, 1, 1, 'sdsd', '23', 0, '2023-08-15 22:46:45', '2023-08-15 22:46:45', NULL, 1),
(14, 23, 1, 1, 'fdf', 'dfd', 0, '2023-08-15 22:55:45', '2023-08-15 23:05:20', NULL, 1),
(15, 23, 2, 2, 'sdasd', 'asdasd', 0, '2023-08-15 23:05:20', '2023-08-17 19:37:02', NULL, 1),
(16, 23, 2, 2, 'test street', '123hg', 0, '2023-08-17 19:37:02', '2023-08-17 19:52:47', NULL, 1),
(17, 23, 2, 2, 'asas', '2323s', 0, '2023-08-17 19:52:47', '2023-08-23 00:10:04', NULL, 1),
(18, 23, 4, 7, 'gggkkkc', 'gfgll', 1, '2023-08-23 00:10:04', '2023-08-23 00:10:04', NULL, 1),
(19, 70, 4, 7, 'Ahmed Bibers', '32', 0, '2023-09-07 15:47:48', '2023-10-08 14:09:12', NULL, 0),
(20, 46, 4, 7, ',m,m', 'ijji', 1, '2023-09-16 17:54:11', '2023-09-16 17:54:11', NULL, 1),
(21, 70, 5, 6, 'Salam st.', '133', 1, '2023-09-18 15:25:39', '2023-10-08 14:08:59', NULL, 0),
(22, 74, 4, 7, '123', '12', 0, '2023-10-09 15:37:19', '2023-10-09 15:37:19', NULL, 1),
(23, 77, 1, 1, 'St: name is here', 'Unit: is here', 1, '2023-10-17 11:00:35', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_cars`
--

CREATE TABLE `user_cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cars`
--

INSERT INTO `user_cars` (`id`, `user_id`, `model`, `color`, `plate`, `created_at`, `updated_at`, `deleted_at`, `is_active`) VALUES
(1, 23, 'mg zs', 'red', '2345 اص ع', '2023-07-19 16:13:47', '2023-10-04 01:50:18', NULL, 0),
(2, 23, 'mg zs 2', 'red 2', '2345 اص ع', '2023-07-19 16:14:03', '2023-07-19 16:14:03', NULL, 1),
(3, 23, 'mg zs', 'red', '2345 اص ع', '2023-08-01 16:48:07', '2023-08-01 16:48:07', NULL, 1),
(4, 23, 'mg zs', 'red', '2345 اص ع', '2023-08-01 16:48:30', '2023-09-28 16:54:31', NULL, 0),
(5, 23, 'mg zs', 'red', '2345 اص ع', '2023-08-07 20:14:32', '2023-08-07 20:14:32', NULL, 1),
(6, 23, 'byd', 'red', '123 hh', '2023-08-09 00:07:37', '2023-08-09 00:07:37', NULL, 1),
(7, 23, 'byd', 'red', '123 hh', '2023-08-09 00:07:42', '2023-08-09 00:07:42', NULL, 1),
(8, 23, 'byd', 'red', '34gggg', '2023-08-09 00:10:51', '2023-08-09 00:10:51', NULL, 1),
(9, 23, 'byd', 'red', '34gghh', '2023-08-09 00:12:15', '2023-08-09 00:12:15', NULL, 1),
(10, 23, 'tore', 'red', '123 dd', '2023-08-14 20:41:54', '2023-08-14 20:41:54', NULL, 1),
(11, 23, 'toy', 'red', 'great 333', '2023-08-17 19:37:20', '2023-08-17 19:37:20', NULL, 1),
(12, 23, 'tot', 'red', 'asd2222', '2023-08-17 19:53:02', '2023-08-17 19:53:02', NULL, 1),
(13, 23, 'toy', 'red', 'jjjgggy gf', '2023-08-23 00:06:54', '2023-08-23 00:06:54', NULL, 1),
(14, 70, 'Kia Carens', 'Mocha', 'TTH 378', '2023-09-07 15:47:08', '2023-10-08 14:09:43', NULL, 0),
(15, 46, 'm,m,m', 'jjkjkj', 'iuu 7777', '2023-09-16 17:54:31', '2023-09-16 17:54:31', NULL, 1),
(16, 70, 'Opel Vectra', 'Burgundy', '123تيم', '2023-09-18 15:26:18', '2023-10-08 14:09:40', NULL, 0),
(17, 70, 'VW', 'Purple', '123hhh', '2023-09-27 13:03:22', '2023-10-08 14:09:36', NULL, 0),
(18, 70, 'Seat Leon', 'Blue', '1T', '2023-10-08 14:10:00', '2023-10-08 14:10:48', NULL, 0),
(19, 74, '123', 'blue', '13', '2023-10-09 15:37:29', '2023-10-09 15:37:29', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_payment_methods`
--

CREATE TABLE `user_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_month` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cvv` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_type` enum('visa','master_card') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_payment_methods`
--

INSERT INTO `user_payment_methods` (`id`, `user_id`, `card_number`, `expiry_month`, `expiry_year`, `cvv`, `card_holder_name`, `card_type`, `is_default`, `created_at`, `updated_at`, `is_active`) VALUES
(2, 23, '5555 5555 5555 5555', '09', '25', '221', 'CARD HOLDER NAME', 'master_card', 0, '2023-08-01 16:40:23', '2023-08-01 16:49:02', 1),
(3, 23, '5555 5555 5555 5555', '09', '25', '221', 'CARD HOLDER NAME', 'master_card', 0, '2023-08-01 16:49:02', '2023-08-14 20:49:27', 1),
(4, 23, '5555 5555 5555 5555', '09', '25', '221', 'CARD HOLDER NAME', 'master_card', 0, '2023-08-14 20:49:27', '2023-08-15 19:35:27', 1),
(5, 23, '2234567891234127', '09', '23', '233', 'AHMED', 'master_card', 0, '2023-08-15 19:35:27', '2023-08-15 19:39:07', 1),
(6, 23, '5555 5555 5555 5555', '09', '25', '221', 'CARD HOLDER NAME', 'master_card', 0, '2023-08-15 19:39:07', '2023-08-17 19:37:57', 1),
(7, 23, '2912345678912345', '09', '23', '123', 'AHMED', 'master_card', 0, '2023-08-17 19:37:57', '2023-08-17 19:53:49', 1),
(8, 23, '2912345678923456', '09', '23', '123', 'SDDD', 'master_card', 0, '2023-08-17 19:53:49', '2023-08-20 00:37:49', 1),
(9, 23, '29312231231232132323', '09', '23', '123', 'AHMED', 'master_card', 0, '2023-08-20 00:37:49', '2023-08-22 22:04:47', 1),
(10, 23, '295898484848848484', '09', '25', '123', 'AHMED', 'master_card', 0, '2023-08-22 22:04:47', '2023-08-23 23:23:04', 1),
(11, 23, '2588888366985578', '02', '25', '123', 'DHJKKB', 'master_card', 0, '2023-08-23 23:23:04', '2023-08-23 23:27:49', 1),
(12, 23, '2588886668868855', '02', '25', '123', 'VHJKJ', 'master_card', 1, '2023-08-23 23:27:49', '2023-08-23 23:27:49', 1),
(13, 70, '5078034839778680', '03', '27', '699', 'IBRAHIM BIBERS', 'master_card', 0, '2023-09-07 16:03:27', '2023-09-07 16:03:29', 1),
(14, 70, '5078034839778680', '03', '27', '699', 'IBRAHIM BIBERS', 'master_card', 0, '2023-09-07 16:03:29', '2023-09-10 15:38:53', 1),
(15, 70, '2718320254086391', '02', '28', '382', 'IBRAHIM BIBERS', 'master_card', 0, '2023-09-10 15:38:53', '2023-09-10 15:42:12', 1),
(16, 70, '2234123412341234', '02', '24', '225', 'AMR', 'master_card', 0, '2023-09-10 15:42:12', '2023-09-10 15:42:13', 1),
(17, 70, '2234123412341234', '02', '24', '225', 'AMR', 'master_card', 0, '2023-09-10 15:42:13', '2023-09-10 15:47:36', 1),
(18, 70, '2345123412341234', '12', '23', '123', 'ANR', 'master_card', 0, '2023-09-10 15:47:36', '2023-09-10 15:47:37', 1),
(19, 70, '2345123412341234', '12', '23', '123', 'ANR', 'master_card', 0, '2023-09-10 15:47:37', '2023-09-13 15:22:42', 1),
(20, 70, '2345123412341234', '12', '24', '131', 'TEJSJ', 'master_card', 0, '2023-09-13 15:22:42', '2023-09-13 15:22:42', 1),
(21, 70, '2345123412341234', '12', '24', '131', 'TEJSJ', 'master_card', 0, '2023-09-13 15:22:42', '2023-09-14 15:26:15', 1),
(22, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-14 15:26:15', '2023-09-14 15:32:09', 1),
(23, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-14 15:32:09', '2023-09-18 13:39:14', 1),
(24, 46, '2987765432112344', '09', '25', '123', 'DBBDB BBF', 'master_card', 0, '2023-09-16 17:55:12', '2023-09-16 18:21:04', 1),
(25, 46, '293122238388484844', '09', '25', '123', 'NFNNFN', 'master_card', 0, '2023-09-16 18:21:04', '2023-09-16 18:25:27', 1),
(26, 46, '291224747757565656', '09', '25', '123', 'SNNFNF', 'master_card', 0, '2023-09-16 18:25:27', '2023-09-16 18:29:23', 1),
(27, 46, '293212222222222222', '09', '25', '123', 'DDDDDD', 'master_card', 1, '2023-09-16 18:29:23', '2023-09-16 18:29:23', 1),
(28, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-18 13:39:14', '2023-09-18 13:47:36', 1),
(29, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-18 13:47:36', '2023-09-18 13:47:36', 1),
(30, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-18 13:47:36', '2023-09-18 15:27:09', 1),
(31, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-18 15:27:09', '2023-09-27 13:00:48', 1),
(32, 70, '2345123412341234', '12', '23', '123', 'AME', 'master_card', 0, '2023-09-27 13:00:48', '2023-09-27 13:03:52', 1),
(33, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-27 13:03:52', '2023-09-27 13:03:54', 1),
(34, 70, '2345123412341234', '12', '23', '123', 'AMR', 'master_card', 0, '2023-09-27 13:03:54', '2023-09-27 13:06:49', 1),
(35, 70, '2345123412341234', '12', '23', '123', 'TEST', 'master_card', 0, '2023-09-27 13:06:49', '2023-09-27 13:06:50', 1),
(36, 70, '2345123412341234', '12', '23', '123', 'TEST', 'master_card', 0, '2023-09-27 13:06:50', '2023-10-08 14:11:57', 1),
(37, 70, '2345123412345678', '12', '23', '123', 'AMR', 'master_card', 1, '2023-10-08 14:11:57', '2023-10-08 14:11:57', 1),
(38, 74, '2345123412341234', '12', '23', '123', 'TEST', 'master_card', 1, '2023-10-09 15:38:07', '2023-10-09 15:38:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_purchase_price_options`
--

CREATE TABLE `user_purchase_price_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `user_purchase_schedule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price_option_id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_purchase_price_options`
--

INSERT INTO `user_purchase_price_options` (`id`, `user_purchase_request_id`, `user_purchase_schedule_id`, `price_option_id`, `title_en`, `title_ar`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, NULL, 26, 'Ceiling', 'سقف', 100.00, '2023-08-14 15:21:08', '2023-08-14 15:21:08', NULL),
(2, 6, NULL, 27, 'Furnish', 'أثث', 500.00, '2023-08-14 15:21:08', '2023-08-14 15:21:08', NULL),
(3, 17, NULL, 26, 'Ceiling', 'سقف', 100.00, '2023-08-19 22:57:55', '2023-08-19 22:57:55', NULL),
(4, 17, NULL, 27, 'Furnish', 'أثث', 500.00, '2023-08-19 22:57:55', '2023-08-19 22:57:55', NULL),
(5, 19, NULL, 26, 'Ceiling', 'سقف', 100.00, '2023-08-19 22:58:06', '2023-08-19 22:58:06', NULL),
(6, 19, NULL, 27, 'Furnish', 'أثث', 500.00, '2023-08-19 22:58:06', '2023-08-19 22:58:06', NULL),
(7, 21, NULL, 26, 'Ceiling', 'سقف', 100.00, '2023-08-20 00:37:54', '2023-08-20 00:37:54', NULL),
(8, 26, NULL, 26, 'Ceiling', 'سقف', 100.00, '2023-08-24 13:33:54', '2023-08-24 13:33:54', NULL),
(9, 26, NULL, 27, 'Furnish', 'أثث', 500.00, '2023-08-24 13:33:54', '2023-08-24 13:33:54', NULL),
(10, 28, 133, 26, 'Ceiling', 'سقف', 100.00, '2023-08-24 13:52:20', '2023-08-24 13:52:20', NULL),
(11, 28, 133, 27, 'Furnish', 'أثث', 500.00, '2023-08-24 13:52:20', '2023-08-24 13:52:20', NULL),
(12, 30, 135, 26, 'Ceiling', 'سقف', 100.00, '2023-08-24 14:18:03', '2023-08-24 14:18:03', NULL),
(13, 30, 135, 27, 'Furnish', 'أثث', 500.00, '2023-08-24 14:18:03', '2023-08-24 14:18:03', NULL),
(14, 36, 185, 26, 'Ceiling', 'سقف', 100.00, '2023-09-05 12:02:55', '2023-09-05 12:02:55', NULL),
(15, 36, 185, 27, 'Furnish', 'أثث', 500.00, '2023-09-05 12:02:55', '2023-09-05 12:02:55', NULL),
(16, 38, 187, 26, 'Ceiling', 'سقف', 100.00, '2023-09-05 12:02:56', '2023-09-05 12:02:56', NULL),
(17, 38, 187, 27, 'Furnish', 'أثث', 500.00, '2023-09-05 12:02:56', '2023-09-05 12:02:56', NULL),
(18, 40, 189, 26, 'Ceiling', 'سقف', 100.00, '2023-09-05 12:02:57', '2023-09-05 12:02:57', NULL),
(19, 40, 189, 27, 'Furnish', 'أثث', 500.00, '2023-09-05 12:02:57', '2023-09-05 12:02:57', NULL),
(20, 44, 226, 26, 'Ceiling', 'سقف', 100.00, '2023-09-07 17:57:24', '2023-09-07 17:57:24', NULL),
(21, 44, 226, 27, 'Furnish', 'أثث', 500.00, '2023-09-07 17:57:24', '2023-09-07 17:57:24', NULL),
(22, 49, 264, 26, 'Ceiling', 'سقف', 100.00, '2023-09-10 11:24:41', '2023-09-10 11:24:41', NULL),
(23, 49, 264, 27, 'Furnish', 'أثث', 500.00, '2023-09-10 11:24:41', '2023-09-10 11:24:41', NULL),
(24, 51, 266, 26, 'Ceiling', 'سقف', 100.00, '2023-09-10 11:24:43', '2023-09-10 11:24:43', NULL),
(25, 51, 266, 27, 'Furnish', 'أثث', 500.00, '2023-09-10 11:24:43', '2023-09-10 11:24:43', NULL),
(26, 53, 268, 26, 'Ceiling', 'سقف', 100.00, '2023-09-10 11:24:44', '2023-09-10 11:24:44', NULL),
(27, 53, 268, 27, 'Furnish', 'أثث', 500.00, '2023-09-10 11:24:44', '2023-09-10 11:24:44', NULL),
(28, 55, 270, 26, 'Ceiling', 'سقف', 100.00, '2023-09-10 11:24:45', '2023-09-10 11:24:45', NULL),
(29, 55, 270, 27, 'Furnish', 'أثث', 500.00, '2023-09-10 11:24:45', '2023-09-10 11:24:45', NULL),
(30, 74, 457, 26, 'Ceiling', 'سقف', 100.00, '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(31, 74, 457, 27, 'Furnish', 'أثث', 500.00, '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(32, 76, 459, 26, 'Ceiling', 'سقف', 100.00, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(33, 76, 459, 27, 'Furnish', 'أثث', 500.00, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(34, 78, 461, 26, 'Ceiling', 'سقف', 100.00, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(35, 78, 461, 27, 'Furnish', 'أثث', 500.00, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(36, 80, 463, 26, 'Ceiling', 'سقف', 100.00, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(37, 80, 463, 27, 'Furnish', 'أثث', 500.00, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(38, 82, 465, 26, 'Ceiling', 'سقف', 100.00, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(39, 82, 465, 27, 'Furnish', 'أثث', 500.00, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_purchase_requests`
--

CREATE TABLE `user_purchase_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_purchase_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchaseable_id` bigint(20) UNSIGNED NOT NULL,
  `purchaseable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_reference_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address_id` bigint(20) UNSIGNED NOT NULL,
  `user_car_id` bigint(20) UNSIGNED NOT NULL,
  `user_payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `service_provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `is_renewable` tinyint(1) NOT NULL DEFAULT 0,
  `selected_days` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('payment','pending','inprogress','completed','cancelled','rescheduled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payment',
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` enum('pending','success','failed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root_purchase_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actionable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actionable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` enum('pending','inprogress','refunded','non_refundable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `renewable_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_purchase_requests`
--

INSERT INTO `user_purchase_requests` (`id`, `user_id`, `user_purchase_reference`, `purchaseable_id`, `purchaseable_type`, `invoice_reference_number`, `user_address_id`, `user_car_id`, `user_payment_method_id`, `service_provider_id`, `assigned_at`, `is_renewable`, `selected_days`, `status`, `price`, `title_en`, `title_ar`, `description_en`, `description_ar`, `payment_status`, `payment_reference`, `root_purchase_request_id`, `actionable_id`, `actionable_type`, `refund_status`, `cancelled_at`, `created_at`, `updated_at`, `start_date`, `end_date`, `renewable_date`, `deleted_at`) VALUES
(5, 23, NULL, 3, 'App\\Models\\Service', 'E3qq0c1b0anzfR22mGNlI3Ll4gr7rL', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 15:21:08', '2023-08-14 15:21:08', '2023-08-20', '2023-08-20', NULL, NULL),
(6, 23, NULL, 13, 'App\\Models\\Service', 'E3qq0c1b0anzfR22mGNlI3Ll4gr7rL', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-14 15:21:08', '2023-08-14 15:21:08', '2023-08-17', '2023-08-17', NULL, NULL),
(7, 23, NULL, 5, 'App\\Models\\Package', '3zN46aqy5cakZUSxHwE3pqSi28rsoD', 1, 1, 1, NULL, NULL, 1, 'Sunday,Monday,Tuesday', 'payment', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-15 19:41:25', '2023-08-15 19:41:25', '2023-08-23', '2023-09-20', NULL, NULL),
(8, 23, NULL, 4, 'App\\Models\\Package', 'Ct5TaPBebBsHPPoPakOn8686Qj2q4z', 1, 1, 1, NULL, NULL, 1, 'Sunday,Monday,Tuesday,Friday,Tuesday', 'payment', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-15 19:43:33', '2023-08-15 19:43:33', '2023-08-23', '2023-09-20', NULL, NULL),
(9, 23, NULL, 5, 'App\\Models\\Package', 'xmbvali3WG8nscU96JQpRFZOGkBYk4', 1, 1, 1, NULL, NULL, 1, 'Sunday,Monday,Tuesday', 'payment', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-15 20:43:59', '2023-08-15 20:43:59', '2023-08-23', '2023-09-20', NULL, NULL),
(10, 23, 'CWP-9648137', 5, 'App\\Models\\Package', 'lOyIpPkniX2PqHpE3i7Ld4Yvijuf3r', 1, 1, 1, 3, '2023-08-31 16:36:39', 0, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-16 18:00:50', '2023-08-23', '2023-09-20', '2023-09-21', NULL),
(11, 23, 'CWP-9215198', 4, 'App\\Models\\Package', 'gVPiGR0uAc8N5trdls6fHMf8Vcw9kU', 1, 1, 1, 4, '2023-08-31 16:39:20', 1, 'Sunday,Monday,Tuesday,Friday,Tuesday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', '2023-08-23', '2023-09-20', '2023-09-21', NULL),
(12, 23, 'CWP-4334500', 5, 'App\\Models\\Package', '4ucXjtfqL0Y8v9Z79QtR7CukTZkVRc', 1, 1, 1, 3, '2023-08-31 16:39:55', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', '2023-08-23', '2023-09-20', '2023-09-21', NULL),
(13, 23, 'CWP-6816953', 4, 'App\\Models\\Package', 'H6x6YVZjHfeshqynKJBlQeAz6vjvv3', 17, 12, 8, 1, '2023-08-30 15:33:49', 1, 'Sunday,Monday,Tuesday,Wednesday,Saturday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', '2023-08-18', '2023-10-30', '2023-10-31', NULL),
(14, 23, 'CWP-1461916', 4, 'App\\Models\\Package', '1mtqlrSCjBdkQZM442YdkZFi87yKnx', 17, 12, 8, 1, '2023-09-05 11:30:42', 1, 'Sunday,Monday,Tuesday,Wednesday,Saturday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', '2023-08-18', '2023-09-15', '2023-09-16', NULL),
(15, 23, 'CWP-8624984', 4, 'App\\Models\\Package', 'O12Epar9AS02FXjpFCDPJEPfezcugY', 2, 2, 2, 4, '2023-09-05 11:31:46', 1, 'Monday,Tuesday,Wednesday,Saturday,Friday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', '2023-08-25', '2023-09-22', '2023-09-23', NULL),
(16, 23, NULL, 3, 'App\\Models\\Service', 'sAJ5KLYdPv5I9AsEqmO6vFINuXzzIJ', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-19 22:57:55', '2023-08-19 22:57:55', '2023-08-20', '2023-08-20', NULL, NULL),
(17, 23, NULL, 13, 'App\\Models\\Service', 'sAJ5KLYdPv5I9AsEqmO6vFINuXzzIJ', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-19 22:57:55', '2023-08-19 22:57:55', '2023-08-20', '2023-08-20', NULL, NULL),
(18, 23, NULL, 3, 'App\\Models\\Service', 'zuKTyi0eSbgRqLx8vWHREGpkY2h0ea', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-19 22:58:06', '2023-08-19 22:58:06', '2023-08-20', '2023-08-20', NULL, NULL),
(19, 23, NULL, 13, 'App\\Models\\Service', 'zuKTyi0eSbgRqLx8vWHREGpkY2h0ea', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-19 22:58:06', '2023-08-19 22:58:06', '2023-08-20', '2023-08-20', NULL, NULL),
(20, 23, NULL, 12, 'App\\Models\\Service', 'tUSLOepZlawJEC6X6x8YEvkCgk0N7h', 2, 2, 9, NULL, NULL, 0, NULL, 'payment', 1500.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-20 00:37:54', '2023-08-20 00:37:54', '2023-08-21', '2023-08-21', NULL, NULL),
(21, 23, NULL, 13, 'App\\Models\\Service', 'tUSLOepZlawJEC6X6x8YEvkCgk0N7h', 2, 2, 9, NULL, NULL, 0, NULL, 'payment', 100.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-20 00:37:54', '2023-08-20 00:37:54', '2023-08-22', '2023-08-22', NULL, NULL),
(22, 23, 'CWP-3653086', 4, 'App\\Models\\Package', 'hyuFssrDRYNWBA7FcTQXkplIMnHyxv', 2, 2, 10, 3, '2023-09-05 11:39:04', 1, 'Friday,Tuesday,Saturday,Wednesday,Monday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', '2023-08-23', '2023-09-20', '2023-09-21', NULL),
(23, 23, NULL, 12, 'App\\Models\\Service', 'U8DlBEpkOwgSUtAnd8MGzXA4zLS6Gw', 6, 1, 11, NULL, NULL, 0, NULL, 'payment', 1500.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-23 23:23:08', '2023-08-23 23:23:08', '2023-08-24', '2023-08-24', NULL, NULL),
(24, 23, NULL, 12, 'App\\Models\\Service', '4gVRsJimszHm1a6pqM6mkRh0Pde4ne', 15, 1, 12, NULL, NULL, 0, NULL, 'payment', 1500.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-23 23:27:52', '2023-08-23 23:27:52', '2023-08-28', '2023-08-28', NULL, NULL),
(25, 23, NULL, 3, 'App\\Models\\Service', 'FdQL3R2OBrHh06RKVf1abZfhU4hMEl', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-24 13:33:54', '2023-08-24 13:33:54', '2023-08-30', '2023-08-30', NULL, NULL),
(26, 23, NULL, 13, 'App\\Models\\Service', 'FdQL3R2OBrHh06RKVf1abZfhU4hMEl', 1, 1, 1, NULL, NULL, 0, NULL, 'payment', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-24 13:33:54', '2023-08-24 13:33:54', '2023-08-30', '2023-08-30', NULL, NULL),
(27, 23, 'CD-8093714', 3, 'App\\Models\\Service', 'MUJvTwFqU4jDQ5mhQH12thIJSrAbIT', 1, 1, 1, 3, '2023-09-05 11:41:16', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-24 13:52:20', '2023-09-05 11:41:16', '2023-08-30', '2023-08-30', NULL, NULL),
(28, 23, 'CW-6044871', 13, 'App\\Models\\Service', 'MUJvTwFqU4jDQ5mhQH12thIJSrAbIT', 1, 1, 1, 1, '2023-09-05 11:43:41', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-24 13:52:20', '2023-09-05 11:43:41', '2023-08-30', '2023-08-30', NULL, NULL),
(29, 23, 'CDS-8479515', 3, 'App\\Models\\Service', 'BZSZOKTWMVE', 1, 1, 1, 1, '2023-09-05 11:44:58', 0, NULL, 'cancelled', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, 23, 'App\\Models\\User', 'pending', '2023-09-10 11:28:30', '2023-08-24 14:18:03', '2023-09-10 11:28:30', '2023-08-30', '2023-08-30', NULL, NULL),
(30, 23, 'CWS-5229077', 13, 'App\\Models\\Service', 'BZSZOKTWMVE', 1, 1, 1, 1, '2023-09-05 11:59:37', 0, NULL, 'cancelled', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, 23, 'App\\Models\\User', 'pending', '2023-09-10 11:28:34', '2023-08-24 14:18:03', '2023-09-10 11:28:34', '2023-08-30', '2023-08-30', NULL, NULL),
(31, 23, 'CWP-2093371', 5, 'App\\Models\\Package', '9Y3UANQLIPW', 1, 1, 1, 1, '2023-09-05 11:59:42', 0, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-26 23:36:02', '2023-08-30', '2023-09-27', '2023-09-28', NULL),
(32, 23, 'CWP-2213763', 5, 'App\\Models\\Package', '#MOPIVLXTQUB', 1, 1, 1, 3, '2023-09-17 13:17:31', 0, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-26 23:36:34', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(33, 23, 'CWP-5077900', 5, 'App\\Models\\Package', '#MV1WXYWACIV', 1, 1, 1, 3, '2023-09-17 13:17:40', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(34, 23, 'CWP-5290840', 5, 'App\\Models\\Package', '#AYL9ZYJMRRZ', 1, 1, 1, 4, '2023-09-17 13:22:32', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(35, 23, 'CDS-5805354', 3, 'App\\Models\\Service', '#9KAGFIDGYMO', 1, 1, 1, 1, '2023-09-11 14:31:01', 0, NULL, 'cancelled', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, 23, 'App\\Models\\User', 'pending', '2023-09-11 14:33:40', '2023-09-05 12:02:55', '2023-09-11 14:33:40', '2023-09-30', '2023-09-30', NULL, NULL),
(36, 23, 'CWS-7735776', 13, 'App\\Models\\Service', '#9KAGFIDGYMO', 1, 1, 1, 1, '2023-09-11 14:31:01', 0, NULL, 'cancelled', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, 23, 'App\\Models\\User', 'pending', '2023-09-11 14:33:46', '2023-09-05 12:02:55', '2023-09-11 14:33:46', '2023-09-30', '2023-09-30', NULL, NULL),
(37, 23, 'CDS-9190323', 3, 'App\\Models\\Service', '#BWIWDOTYJOM', 1, 1, 1, 4, '2023-09-17 13:22:41', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:56', '2023-09-17 13:22:41', '2023-09-30', '2023-09-30', NULL, NULL),
(38, 23, 'CWS-6406467', 13, 'App\\Models\\Service', '#BWIWDOTYJOM', 1, 1, 1, 4, '2023-09-17 13:23:02', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:56', '2023-09-17 13:23:02', '2023-09-30', '2023-09-30', NULL, NULL),
(39, 23, 'CDS-3284421', 3, 'App\\Models\\Service', '#F0P20UEVAVH', 1, 1, 1, 4, '2023-09-17 13:23:10', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:57', '2023-09-17 13:23:10', '2023-09-30', '2023-09-30', NULL, NULL),
(40, 23, 'CWS-3351987', 13, 'App\\Models\\Service', '#F0P20UEVAVH', 1, 1, 1, 4, '2023-09-17 13:29:38', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-05 12:02:57', '2023-09-17 13:29:38', '2023-09-30', '2023-09-30', NULL, NULL),
(41, 70, 'CWP-1345586', 4, 'App\\Models\\Package', '#BWM0FHEKTCE', 19, 14, 13, 9, '2023-09-17 13:30:18', 0, 'Sunday,Monday,Tuesday,Wednesday,Thursday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-07 16:03:35', '2023-10-04 13:27:26', '2023-09-12', '2023-10-10', '2023-10-11', NULL),
(42, 23, 'CWP-7105655', 5, 'App\\Models\\Package', '#RYYHO8UMRKQ', 1, 1, 1, 1, '2023-09-17 13:30:49', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(43, 23, 'CDS-1138122', 3, 'App\\Models\\Service', '#TOCX0ECKBSL', 1, 1, 1, 1, '2023-09-17 13:31:37', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-07 17:57:24', '2023-09-17 13:31:37', '2023-09-30', '2023-09-30', NULL, NULL),
(44, 23, 'CWS-9529221', 13, 'App\\Models\\Service', '#TOCX0ECKBSL', 1, 1, 1, 4, '2023-09-17 13:33:31', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-07 17:57:24', '2023-09-17 13:33:31', '2023-09-30', '2023-09-30', NULL, NULL),
(45, 23, 'CWP-1074686', 5, 'App\\Models\\Package', '#TU223RYINPO', 1, 1, 1, 1, '2023-09-17 13:44:13', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(46, 23, 'CWP-3084510', 5, 'App\\Models\\Package', '#ANX1XQL1ZSY', 1, 1, 1, 1, '2023-09-17 13:51:18', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(47, 23, 'CWP-5906182', 5, 'App\\Models\\Package', '#2OBA9JZPN4Z', 1, 1, 1, 1, '2023-09-17 13:51:41', 1, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', '2023-09-30', '2023-10-28', '2023-10-29', NULL),
(48, 23, 'CDS-4831277', 3, 'App\\Models\\Service', '#MUYY6FVAZWC', 1, 1, 1, 1, '2023-09-17 13:52:23', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:41', '2023-09-17 13:52:23', '2023-10-01', '2023-10-01', NULL, NULL),
(49, 23, 'CWS-9273319', 13, 'App\\Models\\Service', '#MUYY6FVAZWC', 1, 1, 1, 1, '2023-09-17 13:52:44', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:41', '2023-09-17 13:52:44', '2023-10-01', '2023-10-01', NULL, NULL),
(50, 23, 'CDS-7898007', 3, 'App\\Models\\Service', '#EZ9IDBTJHWR', 1, 1, 1, 13, '2023-09-18 15:53:06', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:43', '2023-09-18 15:53:06', '2023-10-01', '2023-10-01', NULL, NULL),
(51, 23, 'CWS-3301677', 13, 'App\\Models\\Service', '#EZ9IDBTJHWR', 1, 1, 1, 13, '2023-09-18 15:54:30', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:43', '2023-09-18 15:54:30', '2023-10-01', '2023-10-01', NULL, NULL),
(52, 23, 'CDS-7193806', 3, 'App\\Models\\Service', '#OWNSPQPFXCV', 1, 1, 1, 13, '2023-09-18 15:54:37', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:44', '2023-09-18 15:54:37', '2023-10-01', '2023-10-01', NULL, NULL),
(53, 23, 'CWS-8658338', 13, 'App\\Models\\Service', '#OWNSPQPFXCV', 1, 1, 1, 13, '2023-09-18 15:54:46', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:44', '2023-09-18 15:54:46', '2023-10-01', '2023-10-01', NULL, NULL),
(54, 23, 'CDS-9449976', 3, 'App\\Models\\Service', '#KGYQXOSUN3A', 1, 1, 1, 13, '2023-09-18 15:57:24', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:45', '2023-09-18 15:57:24', '2023-10-01', '2023-10-01', NULL, NULL),
(55, 23, 'CWS-9453016', 13, 'App\\Models\\Service', '#KGYQXOSUN3A', 1, 1, 1, 13, '2023-09-18 15:57:30', 0, NULL, 'inprogress', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 11:24:45', '2023-09-18 15:57:30', '2023-10-01', '2023-10-01', NULL, NULL),
(56, 23, 'CDS-7649651', 3, 'App\\Models\\Service', '#ENG3P1U3EHK', 1, 1, 1, NULL, NULL, 0, NULL, 'cancelled', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, 23, 'App\\Models\\User', 'pending', '2023-09-10 12:23:31', '2023-09-10 11:25:17', '2023-09-10 12:23:31', '2023-10-01', '2023-10-01', NULL, NULL),
(57, 70, 'CWP-9683959', 9, 'App\\Models\\Package', '#BGQSS3EHG0N', 19, 14, 15, 13, '2023-09-18 15:57:42', 0, 'Sunday,Monday,Tuesday', 'inprogress', 86.00, 'Voluptatum est dolor', 'asdas', 'Qui nulla iusto a ea laboris et sint aspernatur consectetur proident do voluptas dolor optio fugit minima ducimus', 'asdasd', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 15:39:03', '2023-10-04 13:26:08', '2023-09-11', '2023-10-09', '2023-10-10', NULL),
(58, 70, 'CWP-2430804', 9, 'App\\Models\\Package', '#U4PEFOXXJD1', 19, 14, 15, 13, '2023-09-18 15:57:51', 0, 'Sunday,Monday,Tuesday', 'inprogress', 86.00, 'Voluptatum est dolor', 'asdas', 'Qui nulla iusto a ea laboris et sint aspernatur consectetur proident do voluptas dolor optio fugit minima ducimus', 'asdasd', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 15:39:04', '2023-10-09 15:36:03', '2023-09-11', '2023-10-09', '2023-10-10', NULL),
(59, 70, 'CWP-8300637', 9, 'App\\Models\\Package', '#QQCX1YD5U5I', 19, 14, 16, 6, '2023-09-18 16:39:38', 0, 'Sunday,Monday,Tuesday', 'inprogress', 86.00, 'Voluptatum est dolor', 'asdas', 'Qui nulla iusto a ea laboris et sint aspernatur consectetur proident do voluptas dolor optio fugit minima ducimus', 'asdasd', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 15:42:15', '2023-10-09 15:36:09', '2023-09-11', '2023-10-09', '2023-10-10', NULL),
(60, 70, 'CWP-2436140', 9, 'App\\Models\\Package', '#O2UGFTZ0497', 19, 14, 18, 7, '2023-09-20 12:21:21', 0, 'Sunday,Monday,Tuesday', 'inprogress', 86.00, 'Voluptatum est dolor', 'asdas', 'Qui nulla iusto a ea laboris et sint aspernatur consectetur proident do voluptas dolor optio fugit minima ducimus', 'asdasd', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-10 15:47:39', '2023-10-09 15:35:36', '2023-09-11', '2023-10-09', '2023-10-10', NULL),
(61, 70, 'CWP-5538430', 8, 'App\\Models\\Package', '#BDJFIKCTAHY', 19, 14, 20, 10, '2023-09-20 12:23:19', 0, 'Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday', 'inprogress', 500.00, 'Ultra Package', 'خدمة من الأخر', 'exterior and interior wash for your car with waxing and detailing of rims', 'غسيل داخلي و خارجي للسيارة و تشميع و تنظيف الجنوط', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-13 15:22:45', '2023-10-04 13:26:20', '2023-09-14', '2023-10-12', '2023-10-13', NULL),
(62, 70, 'CWP-7145910', 5, 'App\\Models\\Package', '#JATL3MGO1GC', 19, 14, 22, 13, '2023-09-18 16:01:38', 0, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-14 15:26:25', '2023-10-04 13:26:24', '2023-09-15', '2023-10-13', '2023-10-14', NULL),
(63, 70, 'CWP-2726205', 5, 'App\\Models\\Package', '#U4INACFVSQ4', 19, 14, 22, 13, '2023-09-18 16:02:00', 0, 'Sunday,Monday,Tuesday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-14 15:26:27', '2023-10-04 13:26:28', '2023-09-15', '2023-10-13', '2023-10-14', NULL),
(64, 70, 'CWP-7653856', 5, 'App\\Models\\Package', '#QLNIRNT8XKX', 19, 14, 23, 11, '2023-09-20 12:25:06', 0, 'Sunday,Sunday,Sunday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-14 15:32:12', '2023-10-04 13:26:32', '2023-09-15', '2023-10-13', '2023-10-14', NULL),
(65, 70, 'CWP-1062207', 5, 'App\\Models\\Package', '#CJ08TYZ3TOG', 19, 14, 23, 13, '2023-09-25 14:28:41', 0, 'Sunday,Sunday,Sunday', 'inprogress', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-14 15:32:13', '2023-10-04 13:26:36', '2023-09-15', '2023-10-13', '2023-10-14', NULL),
(66, 46, 'CWS-4188896', 12, 'App\\Models\\Service', '#S0X3LAQB3AN', 20, 15, 24, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 46, 'App\\Models\\User', 'pending', '2023-09-16 17:56:36', '2023-09-16 17:55:27', '2023-09-16 17:56:36', '2023-09-22', '2023-09-22', NULL, NULL),
(67, 46, 'CWS-2868285', 12, 'App\\Models\\Service', '#DDADD4ONBNC', 20, 15, 25, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 46, 'App\\Models\\User', 'pending', '2023-09-16 18:23:25', '2023-09-16 18:21:30', '2023-09-16 18:23:25', '2023-09-28', '2023-09-28', NULL, NULL),
(68, 46, 'CWS-7695434', 12, 'App\\Models\\Service', '#IL3NHPSQYHU', 20, 15, 26, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 46, 'App\\Models\\User', 'pending', '2023-09-16 18:26:22', '2023-09-16 18:25:32', '2023-09-16 18:26:22', '2023-09-21', '2023-09-21', NULL, NULL),
(69, 46, 'CWS-7506183', 12, 'App\\Models\\Service', '#FP2IGKYJ1IK', 20, 15, 27, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 46, 'App\\Models\\User', 'pending', '2023-09-16 18:29:37', '2023-09-16 18:29:25', '2023-09-16 18:29:37', '2023-09-22', '2023-09-22', NULL, NULL),
(70, 70, 'CWP-5660027', 4, 'App\\Models\\Package', '#HUMORCIILR5', 19, 14, 28, 12, '2023-09-20 12:27:50', 0, 'Sunday,Monday,Tuesday,Wednesday,Thursday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-10-04 13:26:40', '2023-09-19', '2023-10-17', '2023-10-18', NULL),
(71, 70, 'CWP-5320937', 4, 'App\\Models\\Package', '#GBZRCX1RA1H', 21, 16, 31, 11, '2023-09-20 12:28:23', 0, 'Sunday,Monday,Tuesday,Wednesday,Thursday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-10-04 13:26:44', '2023-09-19', '2023-10-17', '2023-10-18', NULL),
(72, 70, 'CWP-3161614', 4, 'App\\Models\\Package', '#FP0ZJUUI7LC', 21, 17, 33, 8, '2023-10-11 12:53:25', 0, 'Monday,Sunday,Tuesday,Wednesday,Thursday', 'inprogress', 100.00, 'package title en upadated', 'package title ar upadated', 'package description en upadated', 'package description  ar upadated', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', '2023-09-28', '2023-10-26', '2023-10-27', NULL),
(73, 23, 'CDS-7987961', 3, 'App\\Models\\Service', '#XBGFYARQIA4', 1, 1, 2, 4, '2023-10-15 12:45:56', 0, NULL, 'inprogress', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:05:57', '2023-10-15 12:45:56', '2023-10-02', '2023-10-02', NULL, NULL),
(74, 23, 'CWS-7359668', 13, 'App\\Models\\Service', '#XBGFYARQIA4', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:05:57', '2023-09-27 13:05:57', '2023-10-02', '2023-10-02', NULL, NULL),
(75, 23, 'CDS-7679031', 3, 'App\\Models\\Service', '#BHBQPMT9MAT', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:03', '2023-09-27 13:06:04', '2023-10-03', '2023-10-03', NULL, NULL),
(76, 23, 'CWS-4077028', 13, 'App\\Models\\Service', '#BHBQPMT9MAT', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:03', '2023-09-27 13:06:04', '2023-10-03', '2023-10-03', NULL, NULL),
(77, 23, 'CDS-1225550', 3, 'App\\Models\\Service', '#V2SZQMQPZI1', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:09', '2023-09-27 13:06:09', '2023-10-04', '2023-10-04', NULL, NULL),
(78, 23, 'CWS-7380240', 13, 'App\\Models\\Service', '#V2SZQMQPZI1', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:09', '2023-09-27 13:06:09', '2023-10-04', '2023-10-04', NULL, NULL),
(79, 23, 'CDS-4496921', 3, 'App\\Models\\Service', '#GS2M1HGM1ZW', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:14', '2023-09-27 13:06:14', '2023-10-05', '2023-10-05', NULL, NULL),
(80, 23, 'CWS-5124310', 13, 'App\\Models\\Service', '#GS2M1HGM1ZW', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:14', '2023-09-27 13:06:14', '2023-10-05', '2023-10-05', NULL, NULL),
(81, 23, 'CDS-5107878', 3, 'App\\Models\\Service', '#GQ2RJATUWJ5', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:38', '2023-09-27 13:06:38', '2023-10-06', '2023-10-06', NULL, NULL),
(82, 23, 'CWS-3860049', 13, 'App\\Models\\Service', '#GQ2RJATUWJ5', 1, 1, 2, NULL, NULL, 0, NULL, 'pending', 600.00, 'Sit ut hic quidem si', 'Nobis aliquip consec', 'Officia beatae sequi vel sunt dolor', 'Ipsa molestias quis iste dolorem consectetur lorem exercitation assumenda nisi illo eu est hic iure quia rerum corrupti', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-09-27 13:06:38', '2023-09-27 13:06:38', '2023-10-06', '2023-10-06', NULL, NULL),
(83, 70, 'CWS-5151003', 12, 'App\\Models\\Service', '#ND0DZBAVJBB', 21, 14, 36, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 70, 'App\\Models\\User', 'pending', '2023-10-01 14:28:58', '2023-10-01 13:41:03', '2023-10-01 14:28:58', '2023-10-29', '2023-10-29', NULL, NULL),
(84, 70, 'CWS-6082872', 12, 'App\\Models\\Service', '#ND0DZBAVJBB', 21, 14, 36, NULL, NULL, 0, NULL, 'cancelled', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, 70, 'App\\Models\\User', 'pending', '2023-10-01 14:29:15', '2023-10-01 13:41:03', '2023-10-01 14:29:15', '2023-10-29', '2023-10-29', NULL, NULL),
(85, 70, 'CDS-6656053', 3, 'App\\Models\\Service', '#IKGJ2IJ9XZF', 21, 14, 36, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:45:49', '2023-10-01 13:45:49', '2023-10-02', '2023-10-02', NULL, NULL),
(86, 70, 'CDS-1723344', 3, 'App\\Models\\Service', '#IKGJ2IJ9XZF', 21, 14, 36, NULL, NULL, 0, NULL, 'pending', 100.00, 'Car Polish', 'ملمع السيارة', 'Exterior only car wash including windows & tires', 'غسيل خارجي للسيارة فقط بما في ذلك النوافذ والإطارات', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:45:49', '2023-10-01 13:45:49', '2023-10-02', '2023-10-02', NULL, NULL),
(87, 70, 'CWS-2779729', 12, 'App\\Models\\Service', '#TV7PO1I2DLS', 21, 16, 36, NULL, NULL, 0, NULL, 'pending', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:47:45', '2023-10-01 13:47:45', '2023-10-02', '2023-10-02', NULL, NULL),
(88, 70, 'CWS-8589798', 12, 'App\\Models\\Service', '#TV7PO1I2DLS', 21, 16, 36, NULL, NULL, 0, NULL, 'pending', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:47:45', '2023-10-01 13:47:45', '2023-10-02', '2023-10-02', NULL, NULL),
(89, 70, 'CWS-2849781', 12, 'App\\Models\\Service', '#JHGOSVMREEC', 21, 14, 36, NULL, NULL, 0, NULL, 'pending', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:49:28', '2023-10-01 13:49:28', '2023-10-03', '2023-10-03', NULL, NULL),
(90, 70, 'CWS-6668761', 12, 'App\\Models\\Service', '#JHGOSVMREEC', 21, 14, 36, NULL, NULL, 0, NULL, 'pending', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 13:49:28', '2023-10-01 13:49:28', '2023-10-03', '2023-10-03', NULL, NULL),
(91, 70, 'CWS-9879944', 12, 'App\\Models\\Service', '#RQSD7G9SGY4', 21, 14, 36, NULL, NULL, 0, NULL, 'pending', 150.00, 'test', 'Add Servicessss', 'test', 'Add Servicesssss', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-01 14:39:51', '2023-10-01 14:39:51', '2023-10-14', '2023-10-14', NULL, NULL),
(92, 74, 'CWP-1599611', 5, 'App\\Models\\Package', '#QVGKT6Z9Q28', 22, 19, 38, NULL, NULL, 0, 'Sunday,Monday,Tuesday', 'pending', 300.00, 'Advanced 3', 'متقدم 3', 'Glem Car wash 6 days per week', 'غسيل سيارات جليم 6 أيام في الأسبوع', 'success', 'xxxxxxxxxx', NULL, NULL, NULL, NULL, NULL, '2023-10-09 15:38:13', '2023-10-09 15:39:19', '2023-10-10', '2023-11-07', '2023-11-08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_purchase_schedules`
--

CREATE TABLE `user_purchase_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_purchase_request_id` bigint(20) UNSIGNED NOT NULL,
  `service_provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `user_purchase_reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','inprogress','completed','cancelled','rescheduled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `scheduled_at` date NOT NULL,
  `rescheduled_at` date DEFAULT NULL,
  `is_reschedule_handled` tinyint(1) DEFAULT NULL,
  `service_rate` int(11) DEFAULT NULL,
  `reschedule_maximum_date` date NOT NULL,
  `actionable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actionable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` enum('pending','inprogress','refunded','non_refundable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_purchase_schedules`
--

INSERT INTO `user_purchase_schedules` (`id`, `user_id`, `user_purchase_request_id`, `service_provider_id`, `assigned_at`, `user_purchase_reference`, `status`, `scheduled_at`, `rescheduled_at`, `is_reschedule_handled`, `service_rate`, `reschedule_maximum_date`, `actionable_id`, `actionable_type`, `refund_status`, `cancelled_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 23, 10, 4, '2023-09-17 13:23:28', 'CWP-9648137', 'completed', '2023-08-24', NULL, NULL, 1, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:28', NULL),
(2, 23, 10, 3, '2023-08-31 16:36:39', 'CWP-9648137', 'completed', '2023-08-28', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:31', NULL),
(3, 23, 10, 1, '2023-09-20 12:31:07', 'CWP-9648137', 'completed', '2023-08-29', NULL, NULL, 1, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-25 14:30:21', NULL),
(4, 23, 10, 3, '2023-08-31 16:36:39', 'CWP-9648137', 'completed', '2023-09-03', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', NULL, '2023-08-15 20:50:25', '2023-09-25 14:30:23', NULL),
(5, 23, 10, 3, '2023-08-31 16:36:39', 'CWP-9648137', 'completed', '2023-09-04', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-25 14:30:25', NULL),
(6, 23, 10, 3, '2023-08-31 16:36:39', 'CWP-9648137', 'completed', '2023-09-05', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-25 14:30:27', NULL),
(7, 23, 10, 3, '2023-08-31 16:36:39', 'CWP-9648137', 'completed', '2023-09-10', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-25 14:30:29', NULL),
(8, 23, 10, 1, '2023-09-25 15:34:21', 'CWP-9648137', 'completed', '2023-09-11', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:37', NULL),
(9, 23, 10, 1, '2023-09-25 15:10:57', 'CWP-9648137', 'completed', '2023-09-12', NULL, NULL, 2, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:43', NULL),
(10, 23, 10, 3, '2023-09-16 14:46:10', 'CWP-9648137', 'completed', '2023-09-17', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:47', NULL),
(11, 23, 10, 1, '2023-09-25 15:11:06', 'CWP-9648137', 'completed', '2023-09-18', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:30:35', '2023-08-15 20:50:25', '2023-09-26 15:01:51', NULL),
(12, 23, 10, 1, '2023-09-25 15:05:07', 'CWP-9648137', 'completed', '2023-09-19', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-15 20:50:25', '2023-09-26 15:01:54', NULL),
(13, 23, 11, 4, '2023-09-26 15:47:34', 'CWP-9215198', 'completed', '2023-08-25', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-15 20:52:58', '2023-09-26 15:48:34', NULL),
(14, 23, 11, 3, '2023-09-26 15:48:09', 'CWP-9215198', 'completed', '2023-08-27', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-09-26 15:48:51', NULL),
(15, 23, 11, 4, '2023-09-26 15:53:10', 'CWP-9215198', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-09-26 15:53:10', NULL),
(16, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(17, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-01', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(18, 23, 11, 1, '2023-09-26 15:53:47', 'CWP-9215198', 'inprogress', '2023-09-03', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-09-26 15:53:47', NULL),
(19, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(20, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(21, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-08', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(22, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-10', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(23, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(24, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(25, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-15', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(26, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(27, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:33:46', '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(28, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:29:35', '2023-08-15 20:52:58', '2023-08-31 16:39:20', NULL),
(29, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-08-27', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(30, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(31, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(32, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-03', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(33, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(34, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(35, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-10', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(36, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(37, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(38, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(39, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:32:18', '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(40, 23, 12, 3, '2023-08-31 16:39:55', 'CWP-4334500', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-17 19:33:33', '2023-08-31 16:39:55', NULL),
(41, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-19', NULL, NULL, 3, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-09-12 17:15:18', NULL),
(42, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-20', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-09-11 14:39:19', NULL),
(43, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-21', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(44, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-22', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(45, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(46, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-26', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(47, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-27', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(48, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(49, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(50, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(51, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-02', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(52, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-03', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(53, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(54, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(55, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-06', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(56, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-09', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(57, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-10', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(58, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(59, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(60, 23, 13, 1, '2023-08-30 15:33:49', 'CWP-6816953', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 19:55:16', '2023-08-30 15:33:49', NULL),
(61, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'cancelled', '2023-08-19', NULL, NULL, NULL, '2023-09-15', 23, 'App\\Models\\User', 'non_refundable', '2023-09-10 11:28:50', '2023-08-17 20:02:55', '2023-09-10 11:28:50', NULL),
(62, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'cancelled', '2023-08-20', NULL, NULL, NULL, '2023-09-15', 23, 'App\\Models\\User', 'non_refundable', '2023-09-10 11:28:54', '2023-08-17 20:02:55', '2023-09-10 11:28:54', NULL),
(63, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-21', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(64, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-22', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(65, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(66, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-26', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(67, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-27', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(68, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(69, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(70, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(71, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-02', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(72, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-03', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(73, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(74, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(75, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-06', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(76, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-09', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(77, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-10', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(78, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(79, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(80, 23, 14, 1, '2023-09-05 11:30:42', 'CWP-1461916', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-09-15', NULL, NULL, NULL, NULL, '2023-08-17 20:02:55', '2023-09-05 11:30:42', NULL),
(81, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-08-25', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(82, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'completed', '2023-08-26', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-17 13:14:46', NULL),
(83, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(84, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(85, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(86, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-01', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(87, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-02', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(88, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(89, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(90, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-06', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(91, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-08', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(92, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-09', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(93, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(94, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(95, 23, 15, 1, '2023-09-26 15:01:01', 'CWP-8624984', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-26 15:01:01', NULL),
(96, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-15', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(97, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-16', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(98, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-09-22', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:32:10', '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(99, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-09-22', 23, 'App\\Models\\User', 'non_refundable', '2023-08-22 18:28:15', '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(100, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-09-22', 23, 'App\\Models\\User', NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(101, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-09-22', NULL, NULL, NULL, '2023-09-22', 23, 'App\\Models\\User', NULL, NULL, '2023-08-19 02:11:58', '2023-09-05 11:31:46', NULL),
(102, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-08-26', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 03:03:15', '2023-08-31 16:39:20', NULL),
(103, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-22 03:24:41', '2023-09-05 11:31:46', NULL),
(104, 23, 12, 1, '2023-09-11 16:05:22', 'CWP-4334500', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 03:26:55', '2023-09-11 16:05:22', NULL),
(105, 23, 10, 1, '2023-09-11 16:05:22', 'CWP-9648137', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 03:28:15', '2023-09-11 16:05:22', NULL),
(106, 23, 15, 4, '2023-09-05 11:31:46', 'CWP-8624984', 'completed', '2023-08-24', NULL, NULL, NULL, '2023-09-22', NULL, NULL, NULL, NULL, '2023-08-22 18:02:58', '2023-09-17 13:14:38', NULL),
(107, 23, 10, 1, '2023-09-11 15:21:20', 'CWP-9648137', 'inprogress', '2023-08-24', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 18:35:03', '2023-09-11 15:21:20', NULL),
(108, 23, 12, 1, '2023-09-11 16:05:22', 'CWP-4334500', 'inprogress', '2023-08-24', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 18:35:32', '2023-09-11 16:05:22', NULL),
(109, 23, 11, 4, '2023-08-31 16:39:20', 'CWP-9215198', 'inprogress', '2023-08-25', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 18:36:01', '2023-08-31 16:39:20', NULL),
(110, 23, 22, 1, '2023-09-11 15:10:44', 'CWP-3653086', 'inprogress', '2023-08-23', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-11 15:10:44', NULL),
(111, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-08-25', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-12 14:50:58', NULL),
(112, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-08-26', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(113, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-08-28', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(114, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-08-29', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(115, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(116, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-01', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(117, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-02', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(118, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(119, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(120, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-06', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(121, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-08', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(122, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-09', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(123, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(124, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(125, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(126, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-15', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(127, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-16', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(128, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-23 23:28:59', '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(129, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', 'non_refundable', '2023-08-23 23:24:02', '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(130, 23, 22, 3, '2023-09-05 11:39:04', 'CWP-3653086', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-09-20', 23, 'App\\Models\\User', NULL, NULL, '2023-08-22 22:04:51', '2023-09-05 11:39:04', NULL),
(131, 23, 22, 1, '2023-09-11 15:16:06', 'CWP-3653086', 'inprogress', '2023-08-24', NULL, NULL, NULL, '2023-09-20', NULL, NULL, NULL, NULL, '2023-08-23 23:23:44', '2023-09-11 15:16:06', NULL),
(132, 23, 27, 3, '2023-09-05 11:41:16', 'CD-8093714', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 13:52:20', '2023-09-05 11:41:16', NULL),
(133, 23, 28, 1, '2023-09-05 11:43:41', 'CW-6044871', 'inprogress', '2023-08-30', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 13:52:20', '2023-09-05 11:43:41', NULL),
(134, 23, 29, 1, '2023-09-05 11:44:58', 'CDS-8479515', 'cancelled', '2023-08-30', NULL, NULL, NULL, '2023-09-27', 23, 'App\\Models\\User', 'pending', '2023-09-10 11:28:30', '2023-08-24 14:18:03', '2023-09-10 11:28:30', NULL),
(135, 23, 30, 1, '2023-09-05 11:59:37', 'CWS-5229077', 'cancelled', '2023-08-30', NULL, NULL, NULL, '2023-09-27', 23, 'App\\Models\\User', 'pending', '2023-09-10 11:28:34', '2023-08-24 14:18:03', '2023-09-10 11:28:34', NULL),
(136, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-03', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(137, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-04', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(138, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-05', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(139, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-10', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(140, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(141, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(142, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(143, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(144, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(145, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(146, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(147, 23, 31, 1, '2023-09-05 11:59:42', 'CWP-2093371', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-09-27', NULL, NULL, NULL, NULL, '2023-08-24 14:18:52', '2023-09-05 11:59:42', NULL),
(148, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(149, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(150, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(151, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(152, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(153, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(154, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(155, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(156, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(157, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:36', '2023-09-17 13:17:31', NULL),
(158, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'cancelled', '2023-10-23', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:57:33', '2023-09-05 12:02:36', '2023-10-04 00:57:33', NULL),
(159, 23, 32, 3, '2023-09-17 13:17:31', 'CWP-2213763', 'rescheduled', '2023-10-24', '2023-10-04', 1, NULL, '2023-10-28', 23, 'App\\Models\\User', NULL, NULL, '2023-09-05 12:02:36', '2023-10-11 11:41:16', NULL),
(160, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(161, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(162, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(163, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(164, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(165, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(166, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(167, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(168, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(169, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:37', '2023-09-17 13:17:40', NULL),
(170, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'cancelled', '2023-10-23', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 01:00:10', '2023-09-05 12:02:37', '2023-10-04 01:00:10', NULL),
(171, 23, 33, 3, '2023-09-17 13:17:40', 'CWP-5077900', 'rescheduled', '2023-10-24', '2023-10-05', 1, NULL, '2023-10-28', 23, 'App\\Models\\User', NULL, NULL, '2023-09-05 12:02:37', '2023-10-11 11:41:33', NULL),
(172, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(173, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(174, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(175, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(176, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(177, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(178, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(179, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(180, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(181, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:38', '2023-09-17 13:22:32', NULL),
(182, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'cancelled', '2023-10-23', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 01:00:18', '2023-09-05 12:02:38', '2023-10-04 01:00:18', NULL),
(183, 23, 34, 4, '2023-09-17 13:22:32', 'CWP-5290840', 'cancelled', '2023-10-24', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:52:32', '2023-09-05 12:02:38', '2023-10-04 00:52:32', NULL),
(184, 23, 35, NULL, NULL, 'CDS-5805354', 'cancelled', '2023-09-30', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'pending', '2023-09-11 14:33:40', '2023-09-05 12:02:55', '2023-09-11 14:33:40', NULL),
(185, 23, 36, NULL, NULL, 'CWS-7735776', 'cancelled', '2023-09-30', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'pending', '2023-09-11 14:33:46', '2023-09-05 12:02:55', '2023-09-11 14:33:46', NULL),
(186, 23, 37, 4, '2023-09-17 13:22:41', 'CDS-9190323', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:56', '2023-09-17 13:22:41', NULL),
(187, 23, 38, 4, '2023-09-17 13:23:02', 'CWS-6406467', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:56', '2023-09-17 13:23:02', NULL),
(188, 23, 39, 4, '2023-09-17 13:23:10', 'CDS-3284421', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:57', '2023-09-17 13:23:10', NULL),
(189, 23, 40, 4, '2023-09-17 13:29:38', 'CWS-3351987', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-05 12:02:57', '2023-09-17 13:29:38', NULL),
(190, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:04:28', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(191, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:04:45', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(192, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-14', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:05:00', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(193, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:07:20', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(194, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:07:29', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(195, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:07:35', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(196, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:07:56', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(197, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-21', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:04', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(198, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:09', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(199, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:17', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(200, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:24', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(201, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-27', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:32', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(202, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-28', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:41', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(203, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:46', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(204, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:08:51', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(205, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:16:02', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(206, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:17:34', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(207, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:18:43', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(208, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:18:38', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(209, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-09', '2023-09-30', 1, NULL, '2023-10-10', 70, 'App\\Models\\User', NULL, NULL, '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(210, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:14:23', '2023-09-07 16:03:35', '2023-09-17 13:30:18', NULL),
(211, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-29', '2023-09-30', 1, NULL, '2023-10-10', 70, 'App\\Models\\User', NULL, NULL, '2023-09-07 16:14:49', '2023-09-17 13:30:18', NULL),
(212, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-10', 70, 'App\\Models\\User', 'non_refundable', '2023-09-07 16:18:33', '2023-09-07 16:15:56', '2023-09-17 13:30:18', NULL),
(213, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(214, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(215, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(216, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(217, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(218, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(219, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(220, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(221, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(222, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:56:35', '2023-09-17 13:30:49', NULL),
(223, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'rescheduled', '2023-10-23', '2023-10-24', NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', NULL, NULL, '2023-09-07 17:56:35', '2023-10-09 11:17:40', NULL),
(224, 23, 42, 1, '2023-09-17 13:30:49', 'CWP-7105655', 'cancelled', '2023-10-24', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:53:30', '2023-09-07 17:56:35', '2023-10-04 00:53:30', NULL),
(225, 23, 43, 1, '2023-09-17 13:31:37', 'CDS-1138122', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:57:24', '2023-09-17 13:31:37', NULL),
(226, 23, 44, 4, '2023-09-17 13:33:31', 'CWS-9529221', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-07 17:57:24', '2023-09-17 13:33:31', NULL),
(227, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(228, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(229, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(230, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(231, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(232, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(233, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(234, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(235, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(236, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:23:59', '2023-09-17 13:44:13', NULL),
(237, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'rescheduled', '2023-10-23', '2023-10-24', NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', NULL, NULL, '2023-09-10 11:23:59', '2023-10-12 11:46:51', NULL),
(238, 23, 45, 1, '2023-09-17 13:44:13', 'CWP-1074686', 'cancelled', '2023-10-24', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:54:13', '2023-09-10 11:23:59', '2023-10-04 00:54:13', NULL),
(239, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(240, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(241, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(242, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(243, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(244, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(245, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(246, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(247, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(248, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(249, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'inprogress', '2023-10-23', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:02', '2023-09-17 13:51:18', NULL),
(250, 23, 46, 1, '2023-09-17 13:51:18', 'CWP-3084510', 'cancelled', '2023-10-24', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:54:30', '2023-09-10 11:24:02', '2023-10-04 00:54:30', NULL),
(251, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL);
INSERT INTO `user_purchase_schedules` (`id`, `user_id`, `user_purchase_request_id`, `service_provider_id`, `assigned_at`, `user_purchase_reference`, `status`, `scheduled_at`, `rescheduled_at`, `is_reschedule_handled`, `service_rate`, `reschedule_maximum_date`, `actionable_id`, `actionable_type`, `refund_status`, `cancelled_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(252, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(253, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(254, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(255, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(256, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(257, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(258, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(259, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(260, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-22', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(261, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'inprogress', '2023-10-23', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-09-10 11:24:03', '2023-09-17 13:51:41', NULL),
(262, 23, 47, 1, '2023-09-17 13:51:41', 'CWP-5906182', 'cancelled', '2023-10-24', NULL, NULL, NULL, '2023-10-28', 23, 'App\\Models\\User', 'non_refundable', '2023-10-04 00:57:21', '2023-09-10 11:24:03', '2023-10-04 00:57:21', NULL),
(263, 23, 48, 1, '2023-09-17 13:52:23', 'CDS-4831277', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:41', '2023-09-17 13:52:23', NULL),
(264, 23, 49, 1, '2023-09-17 13:52:44', 'CWS-9273319', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:41', '2023-09-17 13:52:44', NULL),
(265, 23, 50, 13, '2023-09-18 15:53:06', 'CDS-7898007', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:43', '2023-09-18 15:53:06', NULL),
(266, 23, 51, 13, '2023-09-18 15:54:30', 'CWS-3301677', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:43', '2023-09-18 15:54:30', NULL),
(267, 23, 52, 13, '2023-09-18 15:54:37', 'CDS-7193806', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:44', '2023-09-18 15:54:37', NULL),
(268, 23, 53, 13, '2023-09-18 15:54:46', 'CWS-8658338', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:44', '2023-09-18 15:54:46', NULL),
(269, 23, 54, 13, '2023-09-18 15:57:24', 'CDS-9449976', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:45', '2023-09-18 15:57:24', NULL),
(270, 23, 55, 13, '2023-09-18 15:57:30', 'CWS-9453016', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-29', NULL, NULL, NULL, NULL, '2023-09-10 11:24:45', '2023-09-18 15:57:30', NULL),
(271, 23, 56, NULL, NULL, 'CDS-7649651', 'cancelled', '2023-10-01', NULL, NULL, NULL, '2023-10-29', 23, 'App\\Models\\User', 'pending', '2023-09-10 12:23:31', '2023-09-10 11:25:17', '2023-09-10 12:23:31', NULL),
(272, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:52', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(273, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:21', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(274, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:23', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(275, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:11', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(276, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:56', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(277, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:19', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(278, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:03', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(279, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:27', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(280, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:45', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(281, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:23', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(282, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:04', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(283, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:31', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(284, 70, 57, 13, '2023-09-18 15:57:42', 'CWP-9683959', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-11 01:16:05', '2023-09-10 15:39:03', '2023-09-18 15:57:42', NULL),
(285, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:38', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(286, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:28', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(287, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:26', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(288, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:19', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(289, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:00', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(290, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:23', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(291, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:21:56', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(292, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:24', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(293, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:39', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(294, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:19', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(295, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:00', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(296, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:22', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(297, 70, 58, 13, '2023-09-18 15:57:51', 'CWP-2430804', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-10 15:44:46', '2023-09-10 15:39:04', '2023-09-18 15:57:51', NULL),
(298, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:42', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(299, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:31', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(300, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:32', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(301, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:03', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(302, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:44', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(303, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:16', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(304, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:21:51', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(305, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:15', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(306, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:35', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(307, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:14', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(308, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:49', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(309, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:27', '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(310, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-10-09', '2023-09-30', 1, NULL, '2023-10-09', 70, 'App\\Models\\User', NULL, NULL, '2023-09-10 15:42:15', '2023-09-18 16:39:38', NULL),
(311, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-13', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:18', '2023-09-10 15:44:05', '2023-09-18 16:39:38', NULL),
(312, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-11', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:47', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(313, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-12', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:34', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(314, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:37', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(315, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:16', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(316, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:52', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(317, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:13', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(318, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:21:47', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(319, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:21', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(320, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:32', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(321, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:10', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(322, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:57', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(323, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:16', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(324, 70, 60, 7, '2023-09-20 12:21:21', 'CWP-2436140', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-09', 70, 'App\\Models\\User', 'non_refundable', '2023-09-11 01:15:15', '2023-09-10 15:47:39', '2023-09-20 12:21:21', NULL),
(325, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-14', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:14', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(326, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-15', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:10', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(327, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-16', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:06', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(328, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:24:02', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(329, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:23:08', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(330, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:48', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(331, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:39', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(332, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-21', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:36', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(333, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-22', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:31', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(334, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-23', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:27', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(335, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:22:08', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(336, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:30', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(337, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:18', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(338, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-27', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:10', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(339, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-28', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:06', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(340, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-29', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:19:02', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(341, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:59', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(342, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:28', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(343, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:18:07', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(344, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:53', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(345, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:46', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(346, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:42', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(347, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-06', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:38', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(348, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-07', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:34', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(349, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:17:02', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(350, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:16:58', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(351, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:16:55', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(352, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-11', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:16:51', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(353, 70, 61, 10, '2023-09-20 12:23:19', 'CWP-5538430', 'inprogress', '2023-10-12', NULL, NULL, NULL, '2023-10-12', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:16:48', '2023-09-13 15:22:45', '2023-09-20 12:23:19', NULL),
(354, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:29', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(355, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:22', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(356, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:14', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(357, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:05', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(358, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:52', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(359, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:45', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(360, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:38', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(361, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:26', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(362, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:22', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(363, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:15', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(364, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:03', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(365, 70, 62, 13, '2023-09-18 16:01:38', 'CWP-7145910', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:28:51', '2023-09-14 15:26:25', '2023-09-18 16:01:38', NULL),
(366, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:32', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(367, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-18', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:25', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(368, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:18', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(369, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:30:11', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(370, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:55', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(371, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:48', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(372, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:42', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(373, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:34', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(374, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:19', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(375, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:29:12', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(376, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:28:59', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(377, 70, 63, 13, '2023-09-18 16:02:00', 'CWP-2726205', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:28:47', '2023-09-14 15:26:27', '2023-09-18 16:02:00', NULL),
(378, 70, 64, 11, '2023-09-20 12:25:06', 'CWP-7653856', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:33:07', '2023-09-14 15:32:12', '2023-09-20 12:25:06', NULL),
(379, 70, 64, 11, '2023-09-20 12:25:06', 'CWP-7653856', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:32:56', '2023-09-14 15:32:12', '2023-09-20 12:25:06', NULL),
(380, 70, 64, 11, '2023-09-20 12:25:06', 'CWP-7653856', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:32:42', '2023-09-14 15:32:12', '2023-09-20 12:25:06', NULL),
(381, 70, 64, 11, '2023-09-20 12:25:06', 'CWP-7653856', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:32:32', '2023-09-14 15:32:12', '2023-09-20 12:25:06', NULL),
(382, 70, 65, 13, '2023-09-25 14:28:41', 'CWP-1062207', 'inprogress', '2023-09-17', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:33:15', '2023-09-14 15:32:13', '2023-09-25 14:28:42', NULL),
(383, 70, 65, 13, '2023-09-25 14:28:41', 'CWP-1062207', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:33:02', '2023-09-14 15:32:13', '2023-09-25 14:28:42', NULL),
(384, 70, 65, 13, '2023-09-25 14:28:41', 'CWP-1062207', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:32:50', '2023-09-14 15:32:13', '2023-09-25 14:28:42', NULL),
(385, 70, 65, 13, '2023-09-25 14:28:41', 'CWP-1062207', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-13', 70, 'App\\Models\\User', 'non_refundable', '2023-09-14 15:32:37', '2023-09-14 15:32:13', '2023-09-25 14:28:42', NULL),
(386, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-10', NULL, NULL, NULL, NULL, '2023-09-16 14:44:37', '2023-09-17 13:30:18', NULL),
(387, 46, 66, NULL, NULL, 'CWS-4188896', 'cancelled', '2023-09-22', NULL, NULL, NULL, '2023-10-20', 46, 'App\\Models\\User', 'pending', '2023-09-16 17:56:36', '2023-09-16 17:55:27', '2023-09-16 17:56:36', NULL),
(388, 46, 67, NULL, NULL, 'CWS-2868285', 'cancelled', '2023-09-28', NULL, NULL, NULL, '2023-10-26', 46, 'App\\Models\\User', 'pending', '2023-09-16 18:23:25', '2023-09-16 18:21:30', '2023-09-16 18:23:25', NULL),
(389, 46, 68, NULL, NULL, 'CWS-7695434', 'cancelled', '2023-09-21', NULL, NULL, NULL, '2023-10-19', 46, 'App\\Models\\User', 'pending', '2023-09-16 18:26:22', '2023-09-16 18:25:32', '2023-09-16 18:26:22', NULL),
(390, 46, 69, NULL, NULL, 'CWS-7506183', 'cancelled', '2023-09-22', NULL, NULL, NULL, '2023-10-20', 46, 'App\\Models\\User', 'pending', '2023-09-16 18:29:37', '2023-09-16 18:29:25', '2023-09-16 18:29:37', NULL),
(391, 70, 41, 9, '2023-09-17 13:30:18', 'CWP-1345586', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-10', NULL, NULL, NULL, NULL, '2023-09-17 13:13:21', '2023-09-17 13:30:18', NULL),
(392, 70, 59, 6, '2023-09-18 16:39:38', 'CWP-8300637', 'inprogress', '2023-09-30', NULL, NULL, NULL, '2023-10-09', NULL, NULL, NULL, NULL, '2023-09-17 13:18:04', '2023-09-18 16:39:38', NULL),
(393, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(394, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(395, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-21', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(396, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(397, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(398, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(399, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-27', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(400, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-09-28', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(401, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(402, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(403, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(404, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(405, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(406, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(407, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(408, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(409, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-11', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(410, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-12', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(411, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 13:39:18', '2023-09-20 12:27:50', NULL),
(412, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'cancelled', '2023-10-16', NULL, NULL, NULL, '2023-10-17', 70, 'App\\Models\\User', 'non_refundable', '2023-10-02 14:04:19', '2023-09-18 13:39:18', '2023-10-02 14:04:19', NULL),
(413, 70, 70, 12, '2023-09-20 12:27:50', 'CWP-5660027', 'cancelled', '2023-10-17', NULL, NULL, NULL, '2023-10-17', 70, 'App\\Models\\User', 'non_refundable', '2023-10-02 14:03:27', '2023-09-18 13:39:18', '2023-10-02 14:03:27', NULL),
(414, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-19', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(415, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-20', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(416, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-21', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(417, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-24', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(418, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-25', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(419, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-26', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(420, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-27', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(421, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-09-28', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(422, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(423, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(424, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(425, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(426, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(427, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(428, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(429, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(430, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-11', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(431, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-12', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(432, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'inprogress', '2023-10-15', NULL, NULL, NULL, '2023-10-17', NULL, NULL, NULL, NULL, '2023-09-18 15:27:13', '2023-09-20 12:28:23', NULL),
(433, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'rescheduled', '2023-10-16', '2023-10-17', NULL, NULL, '2023-10-17', 70, 'App\\Models\\User', NULL, NULL, '2023-09-18 15:27:13', '2023-10-08 13:46:00', NULL),
(434, 70, 71, 11, '2023-09-20 12:28:23', 'CWP-5320937', 'cancelled', '2023-10-17', NULL, NULL, NULL, '2023-10-17', 70, 'App\\Models\\User', 'non_refundable', '2023-10-08 13:45:14', '2023-09-18 15:27:13', '2023-10-08 13:45:14', NULL),
(435, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-09-28', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(436, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-01', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(437, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(438, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-03', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(439, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(440, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(441, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-08', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(442, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-09', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(443, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-10', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(444, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-11', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(445, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-12', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(446, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-15', '2023-10-14', NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(447, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-16', NULL, NULL, NULL, '2023-10-26', NULL, NULL, NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(448, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-17', NULL, NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', 'non_refundable', '2023-10-08 13:45:28', '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(449, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-18', '2023-10-20', NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(450, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-19', '2023-10-20', NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(451, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-22', '2023-10-23', NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', NULL, NULL, '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(452, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-23', NULL, NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', 'non_refundable', '2023-10-01 14:29:31', '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(453, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-24', NULL, NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', 'non_refundable', '2023-10-01 13:03:54', '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(454, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-25', NULL, NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', 'non_refundable', '2023-10-01 13:03:16', '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(455, 70, 72, 8, '2023-10-11 12:53:25', 'CWP-3161614', 'inprogress', '2023-10-26', NULL, NULL, NULL, '2023-10-26', 70, 'App\\Models\\User', 'non_refundable', '2023-10-01 13:02:58', '2023-09-27 13:03:55', '2023-10-11 12:53:25', NULL),
(456, 23, 73, 4, '2023-10-15 12:45:56', 'CDS-7987961', 'inprogress', '2023-10-02', NULL, NULL, NULL, '2023-10-30', NULL, NULL, NULL, NULL, '2023-09-27 13:05:57', '2023-10-15 12:45:56', NULL),
(457, 23, 74, NULL, NULL, 'CWS-7359668', 'pending', '2023-10-02', NULL, NULL, NULL, '2023-10-30', NULL, NULL, NULL, NULL, '2023-09-27 13:05:57', '2023-09-27 13:05:57', NULL),
(458, 23, 75, NULL, NULL, 'CDS-7679031', 'pending', '2023-10-03', NULL, NULL, NULL, '2023-10-31', NULL, NULL, NULL, NULL, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(459, 23, 76, NULL, NULL, 'CWS-4077028', 'pending', '2023-10-03', NULL, NULL, NULL, '2023-10-31', NULL, NULL, NULL, NULL, '2023-09-27 13:06:04', '2023-09-27 13:06:04', NULL),
(460, 23, 77, NULL, NULL, 'CDS-1225550', 'pending', '2023-10-04', NULL, NULL, NULL, '2023-11-01', NULL, NULL, NULL, NULL, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(461, 23, 78, NULL, NULL, 'CWS-7380240', 'pending', '2023-10-04', NULL, NULL, NULL, '2023-11-01', NULL, NULL, NULL, NULL, '2023-09-27 13:06:09', '2023-09-27 13:06:09', NULL),
(462, 23, 79, NULL, NULL, 'CDS-4496921', 'pending', '2023-10-05', NULL, NULL, NULL, '2023-11-02', NULL, NULL, NULL, NULL, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(463, 23, 80, NULL, NULL, 'CWS-5124310', 'pending', '2023-10-05', NULL, NULL, NULL, '2023-11-02', NULL, NULL, NULL, NULL, '2023-09-27 13:06:14', '2023-09-27 13:06:14', NULL),
(464, 23, 81, NULL, NULL, 'CDS-5107878', 'pending', '2023-10-06', NULL, NULL, NULL, '2023-11-03', NULL, NULL, NULL, NULL, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(465, 23, 82, NULL, NULL, 'CWS-3860049', 'pending', '2023-10-06', NULL, NULL, NULL, '2023-11-03', NULL, NULL, NULL, NULL, '2023-09-27 13:06:38', '2023-09-27 13:06:38', NULL),
(466, 70, 83, NULL, NULL, 'CWS-5151003', 'cancelled', '2023-10-29', NULL, NULL, NULL, '2023-11-26', 70, 'App\\Models\\User', 'pending', '2023-10-01 14:28:58', '2023-10-01 13:41:03', '2023-10-01 14:28:58', NULL),
(467, 70, 84, NULL, NULL, 'CWS-6082872', 'cancelled', '2023-10-29', NULL, NULL, NULL, '2023-11-26', 70, 'App\\Models\\User', 'pending', '2023-10-01 14:29:15', '2023-10-01 13:41:03', '2023-10-01 14:29:15', NULL),
(468, 70, 85, NULL, NULL, 'CDS-6656053', 'pending', '2023-10-02', NULL, NULL, NULL, '2023-10-30', NULL, NULL, NULL, NULL, '2023-10-01 13:45:49', '2023-10-01 13:45:49', NULL),
(469, 70, 86, NULL, NULL, 'CDS-1723344', 'pending', '2023-10-02', NULL, NULL, NULL, '2023-10-30', NULL, NULL, NULL, NULL, '2023-10-01 13:45:49', '2023-10-01 13:45:49', NULL),
(470, 70, 87, NULL, NULL, 'CWS-2779729', 'pending', '2023-10-02', NULL, NULL, NULL, '2023-10-30', NULL, NULL, NULL, NULL, '2023-10-01 13:47:45', '2023-10-01 13:47:45', NULL),
(471, 70, 88, NULL, NULL, 'CWS-8589798', 'rescheduled', '2023-10-02', '2023-10-03', NULL, NULL, '2023-10-30', 70, 'App\\Models\\User', NULL, NULL, '2023-10-01 13:47:45', '2023-10-01 14:41:02', NULL),
(472, 70, 89, NULL, NULL, 'CWS-2849781', 'pending', '2023-10-03', NULL, NULL, NULL, '2023-10-31', NULL, NULL, NULL, NULL, '2023-10-01 13:49:28', '2023-10-01 13:49:28', NULL),
(473, 70, 90, NULL, NULL, 'CWS-6668761', 'pending', '2023-10-03', NULL, NULL, NULL, '2023-10-31', NULL, NULL, NULL, NULL, '2023-10-01 13:49:28', '2023-10-01 13:49:28', NULL),
(474, 70, 91, NULL, NULL, 'CWS-9879944', 'rescheduled', '2023-10-14', '2023-10-02', NULL, NULL, '2023-11-11', 70, 'App\\Models\\User', NULL, NULL, '2023-10-01 14:39:51', '2023-10-01 14:40:21', NULL),
(475, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-10', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(476, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-15', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(477, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-16', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(478, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-17', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(479, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-22', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(480, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-23', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(481, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-24', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(482, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-29', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(483, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-30', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(484, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-10-31', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(485, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-11-05', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL);
INSERT INTO `user_purchase_schedules` (`id`, `user_id`, `user_purchase_request_id`, `service_provider_id`, `assigned_at`, `user_purchase_reference`, `status`, `scheduled_at`, `rescheduled_at`, `is_reschedule_handled`, `service_rate`, `reschedule_maximum_date`, `actionable_id`, `actionable_type`, `refund_status`, `cancelled_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(486, 74, 92, NULL, NULL, 'CWP-1599611', 'pending', '2023-11-06', NULL, NULL, NULL, '2023-11-07', NULL, NULL, NULL, NULL, '2023-10-09 15:38:14', '2023-10-09 15:38:14', NULL),
(487, 74, 92, NULL, NULL, 'CWP-1599611', 'rescheduled', '2023-11-07', '2023-11-04', NULL, NULL, '2023-11-07', 74, 'App\\Models\\User', NULL, NULL, '2023-10-09 15:38:14', '2023-10-10 11:46:55', NULL),
(488, 23, 32, 4, '2023-10-11 11:41:16', 'CWP-2213763', 'inprogress', '2023-10-04', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-10-11 11:41:16', '2023-10-11 11:41:16', NULL),
(489, 23, 33, 4, '2023-10-11 11:41:33', 'CWP-5077900', 'inprogress', '2023-10-05', NULL, NULL, NULL, '2023-10-28', NULL, NULL, NULL, NULL, '2023-10-11 11:41:33', '2023-10-11 11:41:33', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compounds`
--
ALTER TABLE `compounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compounds_city_id_foreign` (`city_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoice_user_purchase_requests`
--
ALTER TABLE `invoice_user_purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_user_purchase_requests_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_user_purchase_requests_user_purchase_request_id_foreign` (`user_purchase_request_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `price_options`
--
ALTER TABLE `price_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotional_notification`
--
ALTER TABLE `promotional_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_providers`
--
ALTER TABLE `service_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_compounds`
--
ALTER TABLE `service_provider_compounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_provider_compounds_service_provider_id_foreign` (`service_provider_id`),
  ADD KEY `service_provider_compounds_compound_id_foreign` (`compound_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_cars`
--
ALTER TABLE `user_cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cars_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_payment_methods`
--
ALTER TABLE `user_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_payment_methods_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_purchase_price_options`
--
ALTER TABLE `user_purchase_price_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_purchase_price_options_user_purchase_request_id_foreign` (`user_purchase_request_id`),
  ADD KEY `user_purchase_price_options_user_purchase_schedule_id_foreign` (`user_purchase_schedule_id`),
  ADD KEY `user_purchase_price_options_price_option_id_foreign` (`price_option_id`);

--
-- Indexes for table `user_purchase_requests`
--
ALTER TABLE `user_purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_purchase_requests_user_id_foreign` (`user_id`),
  ADD KEY `user_purchase_requests_service_provider_id_foreign` (`service_provider_id`);

--
-- Indexes for table `user_purchase_schedules`
--
ALTER TABLE `user_purchase_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_purchase_schedules_user_id_foreign` (`user_id`),
  ADD KEY `user_purchase_schedules_user_purchase_request_id_foreign` (`user_purchase_request_id`),
  ADD KEY `user_purchase_schedules_service_provider_id_foreign` (`service_provider_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `compounds`
--
ALTER TABLE `compounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `invoice_user_purchase_requests`
--
ALTER TABLE `invoice_user_purchase_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `price_options`
--
ALTER TABLE `price_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `promotional_notification`
--
ALTER TABLE `promotional_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `service_providers`
--
ALTER TABLE `service_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `service_provider_compounds`
--
ALTER TABLE `service_provider_compounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_cars`
--
ALTER TABLE `user_cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_payment_methods`
--
ALTER TABLE `user_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_purchase_price_options`
--
ALTER TABLE `user_purchase_price_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_purchase_requests`
--
ALTER TABLE `user_purchase_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `user_purchase_schedules`
--
ALTER TABLE `user_purchase_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compounds`
--
ALTER TABLE `compounds`
  ADD CONSTRAINT `compounds_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_user_purchase_requests`
--
ALTER TABLE `invoice_user_purchase_requests`
  ADD CONSTRAINT `invoice_user_purchase_requests_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `invoice_user_purchase_requests_user_purchase_request_id_foreign` FOREIGN KEY (`user_purchase_request_id`) REFERENCES `user_purchase_requests` (`id`);

--
-- Constraints for table `service_provider_compounds`
--
ALTER TABLE `service_provider_compounds`
  ADD CONSTRAINT `service_provider_compounds_compound_id_foreign` FOREIGN KEY (`compound_id`) REFERENCES `compounds` (`id`),
  ADD CONSTRAINT `service_provider_compounds_service_provider_id_foreign` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_cars`
--
ALTER TABLE `user_cars`
  ADD CONSTRAINT `user_cars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_payment_methods`
--
ALTER TABLE `user_payment_methods`
  ADD CONSTRAINT `user_payment_methods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_purchase_price_options`
--
ALTER TABLE `user_purchase_price_options`
  ADD CONSTRAINT `user_purchase_price_options_price_option_id_foreign` FOREIGN KEY (`price_option_id`) REFERENCES `price_options` (`id`),
  ADD CONSTRAINT `user_purchase_price_options_user_purchase_request_id_foreign` FOREIGN KEY (`user_purchase_request_id`) REFERENCES `user_purchase_requests` (`id`),
  ADD CONSTRAINT `user_purchase_price_options_user_purchase_schedule_id_foreign` FOREIGN KEY (`user_purchase_schedule_id`) REFERENCES `user_purchase_schedules` (`id`);

--
-- Constraints for table `user_purchase_requests`
--
ALTER TABLE `user_purchase_requests`
  ADD CONSTRAINT `user_purchase_requests_service_provider_id_foreign` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`),
  ADD CONSTRAINT `user_purchase_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_purchase_schedules`
--
ALTER TABLE `user_purchase_schedules`
  ADD CONSTRAINT `user_purchase_schedules_service_provider_id_foreign` FOREIGN KEY (`service_provider_id`) REFERENCES `service_providers` (`id`),
  ADD CONSTRAINT `user_purchase_schedules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_purchase_schedules_user_purchase_request_id_foreign` FOREIGN KEY (`user_purchase_request_id`) REFERENCES `user_purchase_requests` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
