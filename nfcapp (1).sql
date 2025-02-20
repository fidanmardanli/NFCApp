-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 11:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nfcapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_points`
--

CREATE TABLE `access_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `pointNumber` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `access_points`
--

INSERT INTO `access_points` (`id`, `room_id`, `pointNumber`, `created_at`, `updated_at`) VALUES
(1, 1, 'POINT-0', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(2, 1, 'POINT-1', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(3, 2, 'POINT-2', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(4, 3, 'POINT-3', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(5, 6, 'POINT-4', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(6, 3, 'POINT-5', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(7, 8, 'POINT-6', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(8, 4, 'POINT-7', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(9, 2, 'POINT-8', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(10, 3, 'POINT-9', '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `building_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `building_name`, `building_status`, `created_at`, `updated_at`) VALUES
(1, 'B1', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `isActive` int(11) NOT NULL DEFAULT 1,
  `validTo` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `cardNumber`, `isActive`, `validTo`, `created_at`, `updated_at`) VALUES
(1, '12010100', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(2, '12010101', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(3, '12010102', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(4, '12010103', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(5, '12010104', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(6, '12010105', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(7, '12010106', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(8, '12010107', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(9, '12010108', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(10, '12010109', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(11, '120101010', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(12, '120101011', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(13, '120101012', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(14, '120101013', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(15, '120101014', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(16, '120101015', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(17, '120101016', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(18, '120101017', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(19, '120101018', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(20, '120101019', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(21, '120101020', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(22, '120101021', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(23, '120101022', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(24, '120101023', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(25, '120101024', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(26, '120101025', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(27, '120101026', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(28, '120101027', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(29, '120101028', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(30, '120101029', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(31, '120101030', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(32, '120101031', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(33, '120101032', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(34, '120101033', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(35, '120101034', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(36, '120101035', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(37, '120101036', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(38, '120101037', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(39, '120101038', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(40, '120101039', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(41, '120101040', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(42, '120101041', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(43, '120101042', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(44, '120101043', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(45, '120101044', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(46, '120101045', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(47, '120101046', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(48, '120101047', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(49, '120101048', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(50, '120101049', 1, '2025-03-20', '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `card_privileges`
--

CREATE TABLE `card_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cards_id` bigint(20) UNSIGNED NOT NULL,
  `privileges_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `group_status`, `created_at`, `updated_at`) VALUES
(1, 'Teachers', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(2, 'Students', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(3, 'Staff', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `group_permissions`
--

CREATE TABLE `group_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groups_id` bigint(20) UNSIGNED NOT NULL,
  `access_points_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_permissions`
--

INSERT INTO `group_permissions` (`id`, `groups_id`, `access_points_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(2, 3, 8, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(3, 2, 1, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(4, 3, 10, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(5, 1, 8, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(6, 3, 4, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(7, 3, 10, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(8, 2, 7, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(9, 3, 9, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(10, 2, 2, 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `has_exceptions`
--

CREATE TABLE `has_exceptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_point_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `access_point_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_10_000000_create_groups_table', 1),
(2, '2014_10_11_000000_create_cards_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2025_02_06_095042_create_personal_informations_table', 1),
(8, '2025_02_06_095226_create_privileges_table', 1),
(9, '2025_02_06_100112_create_card_privileges_table', 1),
(10, '2025_02_06_111153_create_buildings_table', 1),
(11, '2025_02_06_111159_create_rooms_table', 1),
(12, '2025_02_06_111160_create_access_points_table', 1),
(13, '2025_02_06_111161_create_logs_table', 1),
(14, '2025_02_06_115624_create_group_permissions_table', 1),
(15, '2025_02_06_120640_create_has_exceptions_table', 1),
(16, '2025_02_18_062906_add_my_room_i_d_to_personal_informations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 51, 'auth-token', '4a51ae9f7b64ebcc1efcf3e1ff3cdfb89d3dc17f4de4ac8b7a907f91fd4dda93', '[\"*\"]', NULL, NULL, '2025-02-18 06:48:27', '2025-02-18 06:48:27'),
(2, 'App\\Models\\User', 51, 'auth-token', '67e5d7599a83168a920691f3bdf04c7ef3a91399e34de1149306cacfc8db17c7', '[\"*\"]', NULL, NULL, '2025-02-18 06:48:51', '2025-02-18 06:48:51'),
(3, 'App\\Models\\User', 51, 'auth-token', 'c6e6ae5bac3b10ea089da8bd958288fcecfb83754e5ec00924c2ce4e7cbd1531', '[\"*\"]', '2025-02-18 07:36:34', NULL, '2025-02-18 07:22:52', '2025-02-18 07:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `personal_informations`
--

CREATE TABLE `personal_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `myRoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_informations`
--

INSERT INTO `personal_informations` (`id`, `user_id`, `uid`, `fullName`, `username`, `birthdate`, `created_at`, `updated_at`, `myRoomID`) VALUES
(1, 51, '1313 1313 1313 1313', 'Togrul Quluzade', 'thirteenthstep', '1999-03-14', '2025-02-18 06:48:00', '2025-02-18 06:48:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buildings_id` bigint(20) UNSIGNED NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `room_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `buildings_id`, `room_name`, `room_type`, `room_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'R1', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(2, 1, 'R2', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(3, 1, 'R3', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(4, 1, 'R4', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(5, 1, 'R5', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(6, 1, 'R6', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(7, 1, 'R7', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(8, 1, 'R8', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(9, 1, 'R9', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21'),
(10, 1, 'R10', 'Sinif otağı', 1, '2025-02-18 04:39:21', '2025-02-18 04:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `cards_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `hasException` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `group_id`, `cards_id`, `name`, `email`, `email_verified_at`, `password`, `hasException`, `remember_token`, `created_at`, `updated_at`) VALUES
(51, 1, 1, 'Togrul', 'toghrul.guluzadeh01@gmail.com', NULL, '$2y$12$6Q.O9zQ9VlXJ6Ur6P/EhyuHCUn9LPZn.RMTJ0jja7IzYzIt2xYZui', 0, NULL, '2025-02-18 06:48:00', '2025-02-18 06:48:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_points`
--
ALTER TABLE `access_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_points_room_id_foreign` (`room_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_privileges`
--
ALTER TABLE `card_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_privileges_cards_id_foreign` (`cards_id`),
  ADD KEY `card_privileges_privileges_id_foreign` (`privileges_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_permissions`
--
ALTER TABLE `group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_permissions_groups_id_foreign` (`groups_id`),
  ADD KEY `group_permissions_access_points_id_foreign` (`access_points_id`);

--
-- Indexes for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_exceptions_user_id_foreign` (`user_id`),
  ADD KEY `has_exceptions_access_point_id_foreign` (`access_point_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_user_id_foreign` (`user_id`),
  ADD KEY `logs_access_point_id_foreign` (`access_point_id`),
  ADD KEY `logs_card_id_foreign` (`card_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_informations_user_id_foreign` (`user_id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_buildings_id_foreign` (`buildings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_group_id_foreign` (`group_id`),
  ADD KEY `users_cards_id_foreign` (`cards_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_points`
--
ALTER TABLE `access_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `card_privileges`
--
ALTER TABLE `card_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_permissions`
--
ALTER TABLE `group_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_informations`
--
ALTER TABLE `personal_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_points`
--
ALTER TABLE `access_points`
  ADD CONSTRAINT `access_points_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `card_privileges`
--
ALTER TABLE `card_privileges`
  ADD CONSTRAINT `card_privileges_cards_id_foreign` FOREIGN KEY (`cards_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `card_privileges_privileges_id_foreign` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`);

--
-- Constraints for table `group_permissions`
--
ALTER TABLE `group_permissions`
  ADD CONSTRAINT `group_permissions_access_points_id_foreign` FOREIGN KEY (`access_points_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `group_permissions_groups_id_foreign` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `has_exceptions`
--
ALTER TABLE `has_exceptions`
  ADD CONSTRAINT `has_exceptions_access_point_id_foreign` FOREIGN KEY (`access_point_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `has_exceptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_access_point_id_foreign` FOREIGN KEY (`access_point_id`) REFERENCES `access_points` (`id`),
  ADD CONSTRAINT `logs_card_id_foreign` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `personal_informations`
--
ALTER TABLE `personal_informations`
  ADD CONSTRAINT `personal_informations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_buildings_id_foreign` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cards_id_foreign` FOREIGN KEY (`cards_id`) REFERENCES `cards` (`id`),
  ADD CONSTRAINT `users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
