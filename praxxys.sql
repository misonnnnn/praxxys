-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 06:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praxxys`
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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_03_155306_create_products_table', 1),
(6, '2023_06_04_140013_add_images_column_to_products_table', 1);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `description`, `images`, `datetime`, `created_at`, `updated_at`) VALUES
(1, 'emman', 'Electronics', 'xxx', '[\"\\/storage\\/images\\/BEbBmAvK3Kxfbt1ksUYFos2kaf3BT108YQ5xTFgy.jpg\",\"\\/storage\\/images\\/A9aQ0OmfttSoeofMLM5RO6GF90EnUYmDyaYppbxI.png\"]', '2023-06-21 14:30:00', '2023-06-04 06:31:40', '2023-06-04 06:31:40'),
(2, 'unde', 'Electronics', 'Amet delectus alias veniam pariatur iusto. Cumque officiis voluptas totam est adipisci et. Qui animi hic labore quia illum quae non.', NULL, '1995-09-13 00:24:12', '1971-12-10 17:52:29', '2012-01-05 02:57:03'),
(3, 'vel', 'Electronics', 'At inventore assumenda officiis pariatur modi nemo. Aliquid vel blanditiis culpa aperiam autem. Repellendus voluptatibus officiis nihil officiis. Cum quas perferendis voluptas autem quaerat non.', NULL, '2003-11-04 04:45:11', '1973-09-09 12:36:43', '2000-02-27 21:44:23'),
(4, 'qui', 'Clothing', 'Et aperiam commodi cum. Libero quo cumque soluta dolores recusandae. Mollitia ut est odio dicta provident qui molestiae ut. Quae ullam quo aut error tenetur eos. Nihil ipsum tenetur et et sunt sit nulla.', NULL, '1985-11-25 02:05:05', '2009-01-15 01:04:22', '1995-03-17 01:42:55'),
(5, 'omnis', 'Home', 'Ad alias culpa voluptas. Impedit neque necessitatibus ea facilis delectus aliquid est velit.', NULL, '1978-10-13 17:04:52', '1994-12-27 21:41:18', '1990-12-20 08:33:09'),
(6, 'nulla', 'Books', 'Alias sed magnam voluptas ipsa voluptates. Sequi accusamus atque eveniet explicabo minima. Omnis tempora dignissimos sit deleniti quidem. Accusamus et nemo qui mollitia.', NULL, '2003-05-04 18:29:18', '2017-04-17 20:16:00', '1998-12-12 03:06:33'),
(7, 'impedit', 'Clothing', 'Ea ipsa ipsa facere ut amet. Veniam aliquid eos ipsum quaerat repellendus officia sint. Dolorum in cumque autem.', NULL, '2010-02-16 15:27:18', '1994-01-07 10:35:23', '2008-03-25 13:49:39'),
(8, 'provident', 'Sports', 'Culpa vitae non temporibus autem aut in. Atque commodi et tenetur nam sed sit deserunt sit. Quae adipisci eos omnis praesentium atque earum iusto iste. Quidem accusamus fugit inventore exercitationem.', NULL, '1984-03-22 14:25:15', '1987-02-04 13:36:41', '2001-09-30 17:26:53'),
(9, 'natus', 'Electronics', 'Commodi nam libero quas dolores. Vel dolores qui beatae dolor quod. Perspiciatis officiis dicta repellat pariatur velit. Commodi sint est doloremque eos blanditiis ipsum.', NULL, '1981-05-02 10:49:18', '1977-05-10 10:45:50', '2011-10-19 18:32:19'),
(10, 'corporis', 'Electronics', 'Qui velit nemo optio est dicta consequatur. Et quibusdam ut ullam architecto. Debitis fugiat quae quos. Earum veritatis quibusdam unde ut atque.', NULL, '1983-01-23 02:44:20', '1995-02-22 10:17:43', '1980-03-07 11:37:27'),
(11, 'laborum', 'Clothing', 'Aut inventore maxime aliquid ad consequatur porro sunt. Voluptas voluptatem asperiores distinctio. Dolor beatae sint nobis est ad. Et quaerat impedit in dolores delectus voluptas aut.', NULL, '1998-03-28 13:23:17', '1977-01-07 05:36:37', '2002-01-19 05:01:08'),
(12, 'asdada', 'Electronics', 'asdad', '[\"\\/storage\\/images\\/K8ww312BJj94qL269UsM2MicJExMX3MV1d4dXvqq.png\"]', '2023-05-31 14:37:00', '2023-06-04 06:37:38', '2023-06-04 06:37:38'),
(13, 'ethab', 'Sports', 'asdadadadasdasda', '[\"\\/storage\\/images\\/JMd8hyRESOftsRaNqb3Uk76XXIX4iAWURi6d5MA3.png\"]', '2023-06-08 14:45:00', '2023-06-04 06:45:45', '2023-06-04 06:45:45'),
(14, 'zxczxcz', 'Electronics', 'zxczxczxczxcx', '[\"\\/storage\\/images\\/o1AADkhQ4eqOlHZqPGlhhOXnR1GwQJHBp3a41ybb.jpg\"]', '2023-06-30 14:47:00', '2023-06-04 06:47:49', '2023-06-04 06:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@example.com', NULL, '$2y$10$axje7c2h5h1C.ePmeEROoe8y1gbt6aTuFK0yv2o5kHGzX5FE3gdYu', NULL, 1, '2023-06-04 07:16:30', '2023-06-04 07:16:30');

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
