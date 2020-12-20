-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 04:24 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timetracker`
--

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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_12_18_121731_create_sessions_table', 1),
(7, '2020_12_19_021221_create_roles_table', 2),
(8, '2020_12_19_023345_create_usertimes_table', 2);

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `roles_id` int(11) NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('hQJpEKbN3X9shOGd3lL6hSUwZdwOQbk8p0k3E9kr', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRzhLTm5pcVlkc0Q5WjNteW81MnNBYjU4ajdER29USmZYU0NyS3c0NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2Vycy90aW1lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJC5HTENyeC9tR0kueDRyenl4TFYwVS5QODB0RHZ5RE9uQURUTmM0Vi5WL1EyUjZBa1lHbHNlIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQuR0xDcngvbUdJLng0cnp5eExWMFUuUDgwdER2eURPbkFEVE5jNFYuVi9RMlI2QWtZR2xzZSI7fQ==', 1608391251);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'AdminAlpha', 'admin@admin.com', NULL, '$2y$10$4vRd0lvxU6M4YQMOj5oQw.vsfdHfNqhMFalxNIb2irpsPpDPQY3cS', NULL, NULL, NULL, NULL, NULL, '2020-12-18 16:39:45', '2020-12-18 16:39:45'),
(2, 'Useronly001', 'user@user.com', NULL, '$2y$10$.GLCrx/mGI.x4rzyxLV0U.P80tDvyDOnADTNc4V.V/Q2R6AkYGlse', NULL, NULL, NULL, NULL, NULL, '2020-12-18 18:10:04', '2020-12-18 18:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `usertimes`
--

CREATE TABLE `usertimes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time_in` datetime NOT NULL,
  `time_out` datetime DEFAULT NULL,
  `hours` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usertimes`
--

INSERT INTO `usertimes` (`id`, `user_id`, `time_in`, `time_out`, `hours`, `created_at`, `updated_at`) VALUES
(2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-18 21:27:16', '2020-12-19 04:36:29'),
(3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-18 22:23:29', '2020-12-19 04:34:02'),
(4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 03:22:55', '2020-12-19 03:36:21'),
(5, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 03:24:32', '2020-12-19 03:33:21'),
(6, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:39:06', '2020-12-19 04:39:11'),
(7, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:39:15', '2020-12-19 04:39:24'),
(8, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:39:17', '2020-12-19 04:39:20'),
(9, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:40:31', '2020-12-19 04:40:36'),
(10, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:49:51', '2020-12-19 04:50:18'),
(11, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:51:22', '2020-12-19 04:57:58'),
(12, 2, '0000-00-00 00:00:00', '2020-12-19 20:54:01', NULL, '2020-12-19 04:52:02', '2020-12-19 04:54:01'),
(13, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 04:57:23', '2020-12-19 04:57:26'),
(14, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2020-12-19 05:01:49', '2020-12-19 05:01:53'),
(15, 2, '0000-00-00 00:00:00', NULL, NULL, '2020-12-19 05:03:33', '2020-12-19 05:03:33'),
(16, 2, '2020-12-19 21:41:49', '0000-00-00 00:00:00', NULL, '2020-12-19 05:41:49', '2020-12-19 05:54:35'),
(17, 2, '2020-12-19 21:55:56', '2020-12-19 21:57:23', NULL, '2020-12-19 05:55:56', '2020-12-19 05:57:23'),
(18, 2, '2020-12-19 21:57:32', '2020-12-19 21:58:08', NULL, '2020-12-19 05:57:32', '2020-12-19 05:58:08'),
(19, 2, '2020-12-19 21:58:14', '2020-12-19 22:06:07', NULL, '2020-12-19 05:58:14', '2020-12-19 06:06:07'),
(20, 2, '2020-12-19 21:58:18', '2020-12-19 22:06:14', NULL, '2020-12-19 05:58:18', '2020-12-19 06:06:14'),
(21, 2, '2020-12-19 22:06:44', '2020-12-19 22:08:03', '00:01:19', '2020-12-19 06:06:44', '2020-12-19 06:08:03'),
(22, 2, '2020-12-19 22:08:38', '2020-12-19 22:10:36', '00:01:58', '2020-12-19 06:08:38', '2020-12-19 06:10:36'),
(23, 2, '2020-12-19 22:55:55', NULL, NULL, '2020-12-19 06:55:55', '2020-12-19 06:55:55'),
(24, 2, '2020-12-19 22:56:07', '2020-12-19 22:56:51', '0. \' hours and\' .0. \'minutes\'', '2020-12-19 06:56:07', '2020-12-19 06:56:51'),
(25, 2, '2020-12-19 22:57:38', '2020-12-19 22:57:40', '0  hours and 0 minutes', '2020-12-19 06:57:38', '2020-12-19 06:57:40'),
(26, 2, '2020-12-19 22:59:59', NULL, NULL, '2020-12-19 06:59:59', '2020-12-19 06:59:59'),
(27, 2, '2020-12-19 23:02:15', NULL, NULL, '2020-12-19 07:02:15', '2020-12-19 07:02:15'),
(28, 2, '2020-12-19 23:05:11', '2020-12-19 23:07:01', '00:01:50', '2020-12-19 07:05:11', '2020-12-19 07:07:01'),
(29, 2, '2020-12-19 23:07:08', '2020-12-19 23:07:11', '00:00:03', '2020-12-19 07:07:08', '2020-12-19 07:07:11'),
(30, 2, '2020-12-19 23:13:37', '2020-12-19 23:14:43', '00:01:06', '2020-12-19 07:13:37', '2020-12-19 07:14:43'),
(31, 2, '2020-12-19 23:15:14', '2020-12-19 23:19:46', '0  hours and 4 minutes', '2020-12-19 07:15:14', '2020-12-19 07:19:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usertimes`
--
ALTER TABLE `usertimes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usertimes`
--
ALTER TABLE `usertimes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
