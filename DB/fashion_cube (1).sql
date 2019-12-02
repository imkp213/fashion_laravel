-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2019 at 09:28 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion_cube`
--

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
-- Table structure for table `fashion_carts`
--

CREATE TABLE `fashion_carts` (
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `cart_pro_id` int(11) NOT NULL,
  `cart_user_id` int(11) NOT NULL,
  `cart_qty` int(11) NOT NULL,
  `cart_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fashion_orders`
--

CREATE TABLE `fashion_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_carts` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_user_id` int(11) NOT NULL,
  `order_total_qty` int(11) NOT NULL,
  `order_paymnt_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fashion_orders`
--

INSERT INTO `fashion_orders` (`order_id`, `order_carts`, `order_user_id`, `order_total_qty`, `order_paymnt_amount`, `created_at`, `updated_at`) VALUES
(1, '[{\"cart_id\":1,\"cart_pro_id\":2,\"cart_qty\":1,\"pro_name\":\"Polo Shirt\",\"pro_slug\":\"polo-shirt-2\",\"cart_price\":350,\"pro_image\":\"uploads\\/pro_images\\/cloth_2.jpg\"},{\"cart_id\":3,\"cart_pro_id\":1,\"cart_qty\":2,\"pro_name\":\"Tank Top T-Shirt\",\"pro_slug\":\"tank-top-t-shirt-1\",\"cart_price\":350,\"pro_image\":\"uploads\\/pro_images\\/cloth_1.jpg\"}]', 2, 3, 1050, '2019-12-01 02:02:04', '2019-12-01 02:02:04'),
(2, '[{\"cart_id\":1,\"cart_pro_id\":2,\"cart_qty\":1,\"pro_name\":\"Polo Shirt\",\"pro_slug\":\"polo-shirt-2\",\"cart_price\":350,\"pro_image\":\"uploads\\/pro_images\\/cloth_2.jpg\"},{\"cart_id\":3,\"cart_pro_id\":1,\"cart_qty\":2,\"pro_name\":\"Tank Top T-Shirt\",\"pro_slug\":\"tank-top-t-shirt-1\",\"cart_price\":350,\"pro_image\":\"uploads\\/pro_images\\/cloth_1.jpg\"}]', 2, 3, 1050, '2019-12-01 02:02:04', '2019-12-01 02:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `fashion_products`
--

CREATE TABLE `fashion_products` (
  `pro_id` bigint(20) UNSIGNED NOT NULL,
  `pro_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pro_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_desc` text COLLATE utf8mb4_unicode_ci,
  `pro_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=Deactive,1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fashion_products`
--

INSERT INTO `fashion_products` (`pro_id`, `pro_name`, `pro_slug`, `pro_code`, `pro_desc`, `pro_image`, `pro_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tank Top T-Shirt', 'tank-top-t-shirt-1', 'PKO-01', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_1.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(2, 'Polo Shirt', 'polo-shirt-2', 'PKO-02', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_2.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(3, 'T-Shirt Mockup', 't-shirt-mockup-3', 'PKO-03', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_3.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(4, 'Tank Top', 'tank-top-4', 'PKO-04', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_4.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(5, 'Tank Shirt', 'tank-shirt-5', 'PKO-05', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_5.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(6, 'Tank Top T-Shirt', 'tank-top-t-shirt-6', 'PKO-06', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_1.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(7, 'Tank Top T-Shirt', 'tank-top-t-shirt-7', 'PKO-07', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_1.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18'),
(8, 'Tank Top T-Shirt', 'tank-top-t-shirt-8', 'PKO-08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur, vitae, explicabo? Incidunt facere, natus soluta dolores iusto! Molestiae expedita veritatis nesciunt doloremque sint asperiores fuga voluptas, distinctio, aperiam, ratione dolore.\r\n\r\nEx numquam veritatis debitis minima quo error quam eos dolorum quidem perferendis. Quos repellat dignissimos minus, eveniet nam voluptatibus molestias omnis reiciendis perspiciatis illum hic magni iste, velit aperiam quis.', 'uploads/pro_images/cloth_1.jpg', 350, 1, '2019-11-23 21:47:18', '2019-11-23 21:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `fashion_products_images`
--

CREATE TABLE `fashion_products_images` (
  `img_id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=Deactive,1=Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fashion_users`
--

CREATE TABLE `fashion_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fashion_users`
--

INSERT INTO `fashion_users` (`user_id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'pankaj', 'admin@gmail.com', '$2y$10$EEvxSEbIRpUoqVWTsHl1u.JSmACpIvo7Kyp21VD69rEhYZiTMPfJy', '2019-11-25 10:33:13', '2019-11-25 10:33:13'),
(2, 'kunwar pankaj', 'pankaj@gmail.com', '$2y$10$zsIW/55EjvpVJ0Xr0bTFtukRxop0.lQv/6jEP0lDG30fuBJvzO1fS', '2019-11-28 09:44:30', '2019-11-28 09:44:30');

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
(4, '2019_11_24_092443_create_products_table', 1),
(5, '2019_11_24_092455_create_products__images_table', 2),
(6, '2019_11_24_092531_create_carts_table', 2),
(7, '2019_11_24_092536_create_orders_table', 2),
(8, '2019_11_24_105600_create_web_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'pankaj', 'pankaj@gmail.com', NULL, '$2y$10$f4R0E0zzpGsr5YI1bndB1.piHnLX3IGuz/l648OX8OJesVkXrF6ei', NULL, '2019-11-29 13:05:51', '2019-11-29 13:05:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fashion_carts`
--
ALTER TABLE `fashion_carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `fashion_orders`
--
ALTER TABLE `fashion_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `fashion_products`
--
ALTER TABLE `fashion_products`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `fashion_products_images`
--
ALTER TABLE `fashion_products_images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `fashion_users`
--
ALTER TABLE `fashion_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `fashion_users_email_unique` (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
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
-- AUTO_INCREMENT for table `fashion_carts`
--
ALTER TABLE `fashion_carts`
  MODIFY `cart_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fashion_orders`
--
ALTER TABLE `fashion_orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fashion_products`
--
ALTER TABLE `fashion_products`
  MODIFY `pro_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fashion_products_images`
--
ALTER TABLE `fashion_products_images`
  MODIFY `img_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fashion_users`
--
ALTER TABLE `fashion_users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
