-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 27, 2024 at 11:31 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `address`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Access Advertising', '1 Tunde Gafar Close, <br>Adeniji Jones Avenue, <br>Ikeja, Lagos, Nigeria', 'assets/images/access-advertising.png', '2024-08-10 23:33:11', '2024-08-10 23:33:11'),
(2, 'Jerome K. Ejem', '1 Tunde Gafar Close, <br> Adeniji Jones Avenue, <br>Ikeja, Lagos, Nigeria', 'assets/images/jerome.png', '2024-08-10 23:34:39', '2024-08-10 23:34:39'),
(3, 'Access Developers Ltd', '1 Tunde Gafar Close, <br>Adeniji Jones Avenue, <br> Ikeja, Lagos, Nigeria', 'assets/images/access-developers.png', '2024-08-14 00:21:51', '2024-08-14 00:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `to` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `invoice_number` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_charge` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `company_id`, `to`, `date`, `invoice_number`, `title`, `service_charge`, `vat`, `created_at`, `updated_at`) VALUES
(1, 1, '28 WHARF ROAD, APAPA, LAGOS', '2024-08-11', '70001', 'FORWARD TRADE DISTRIBUTION CO. LTD: PR FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAY', NULL, '7.5', '2024-08-11 21:15:28', '2024-08-11 21:15:28'),
(4, 2, '28 WHARF ROAD, APAPA, LAGOS', '2024-08-14', '70002', 'FORWARD TRADE DISTRIBUTION CO. LTD: PR FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAY', NULL, '7.5', '2024-08-14 13:00:56', '2024-08-14 13:00:56'),
(5, 1, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-15', '70003', 'Foward Trade Invoice', '7', NULL, '2024-08-15 20:08:19', '2024-08-15 20:08:19'),
(6, 1, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-16', '70004', 'Foward Trade Invoice', '6', '7.5', '2024-08-16 07:14:34', '2024-08-16 07:14:34'),
(7, 1, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-16', '70005', 'Foward Trade Invoice', '6', '7.5', '2024-08-16 07:18:13', '2024-08-16 07:18:13'),
(8, 1, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-16', '700006', 'Foward Trade Invoice', '6', NULL, '2024-08-16 07:34:56', '2024-08-16 07:34:56'),
(9, 2, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-23', '700001', 'Forward Trade Distribution Invoice', NULL, '8.0', '2024-08-23 08:59:01', '2024-08-23 08:59:01'),
(10, 2, '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-27', '700002', 'Foward Trade Invoice', '6', '7.5', '2024-08-27 21:54:48', '2024-08-27 21:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_rows`
--

CREATE TABLE `invoice_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_rows`
--

INSERT INTO `invoice_rows` (`id`, `invoice_id`, `invoice_number`, `qty`, `description`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, '70001', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-11 21:15:28', '2024-08-11 21:15:28'),
(2, 1, '70001', 1, 'JULY 2023 - SEPTEMBER 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-11 21:15:28', '2024-08-11 21:15:28'),
(3, 4, '70002', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-14 13:00:56', '2024-08-14 13:00:56'),
(4, 4, '70002', 1, 'JULY 2023 - SEPTEMBER 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-14 13:00:56', '2024-08-14 13:00:56'),
(5, 5, '70003', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-15 20:08:19', '2024-08-15 20:08:19'),
(6, 5, '70003', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-15 20:08:19', '2024-08-15 20:08:19'),
(7, 6, '70004', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:14:34', '2024-08-16 07:14:34'),
(8, 6, '70004', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:14:34', '2024-08-16 07:14:34'),
(9, 7, '00005', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:18:13', '2024-08-16 07:18:13'),
(10, 7, '00005', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:18:13', '2024-08-16 07:18:13'),
(11, 8, '700006', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:34:56', '2024-08-16 07:34:56'),
(12, 8, '700006', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-16 07:34:56', '2024-08-16 07:34:56'),
(13, 9, '700001', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 170000, 170000, '2024-08-23 08:59:01', '2024-08-23 08:59:01'),
(14, 9, '700001', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 190000, 190000, '2024-08-23 08:59:01', '2024-08-23 08:59:01'),
(15, 10, '700002', 1, 'APRIL 2023 - JUNE 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-27 21:54:48', '2024-08-27 21:54:48'),
(16, 10, '700002', 1, 'JULY 2023 - SEPTEMBER 2023: PUBLIC RELATIONS FOR LASAA IN RESPECT OF MOBOLAJI JOHNSON FENCE DISPLAYS', 150000, 150000, '2024-08-27 21:54:48', '2024-08-27 21:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_03_25_025706_create_user_verifies_table', 1),
(5, '2024_08_10_212932_create_companies_table', 2),
(6, '2024_08_10_213339_create_invoices_table', 3),
(7, '2024_08_10_215227_create_invoice_rows_table', 4),
(8, '2024_08_15_123148_create_organizations_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Forward Trade Distribution Company Ltd', '6 Akinyemi Crescent, Off Fatai Atere Crescent, Matori, Oshodi', '2024-08-15 12:46:08', '2024-08-15 13:17:49'),
(2, 'JUBAILI BROSBENGINEERING LTD', '29B OKUOLA STREET, VICTORIA ISLAND, LAGOS', '2024-08-15 12:49:14', '2024-08-15 13:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci,
  `role` tinyint(4) NOT NULL DEFAULT '2',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `token`, `role`, `email_verified_at`, `is_email_verified`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@accessdevelopersltd.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MjQ3OTg4NzMsImV4cCI6MTcyNDgwMjQ3MywibmJmIjoxNzI0Nzk4ODczLCJqdGkiOiJyVWtwaWFXcmJOb3lROFVIIiwic3ViIjoiMSIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.DpBaCVt2VmRPWMGiCbtg27BUVfmo_HbsiK4KuK-hzU0', 1, '2024-08-10 16:13:37', 1, '$2y$10$fSjHDxc.bq3Flbv2cbkdAuMznkURf8IRPdmKYa6Mc1hKJk2EHZWHS', NULL, '2024-08-10 14:58:07', '2024-08-27 21:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoices_company_id_foreign` (`company_id`);

--
-- Indexes for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_rows_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_verifies_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_rows`
--
ALTER TABLE `invoice_rows`
  ADD CONSTRAINT `invoice_rows_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD CONSTRAINT `user_verifies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
