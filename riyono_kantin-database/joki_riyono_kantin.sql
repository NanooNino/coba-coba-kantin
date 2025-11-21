-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 02:13 PM
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
-- Database: `joki_riyono_kantin`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `color` varchar(100) DEFAULT 'var(--bs-primary)',
  `status` enum('Y','N') DEFAULT 'Y',
  `reason` int(11) DEFAULT NULL,
  `block_by` int(11) DEFAULT NULL,
  `block_date` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  `delete` enum('Y','N') DEFAULT 'N',
  `delete_by` int(11) DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `name`, `color`, `status`, `reason`, `block_by`, `block_date`, `create_by`, `create_date`, `delete`, `delete_by`, `delete_date`) VALUES
(19, 'Kategori 1', 'var(--bs-primary)', 'Y', NULL, NULL, NULL, 57, '2025-06-05 15:43:57', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_category` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` enum('Y','N') DEFAULT 'Y',
  `reason` text DEFAULT NULL,
  `block_by` int(11) DEFAULT NULL,
  `block_date` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp(),
  `delete` enum('Y','N') DEFAULT 'N',
  `delete_by` int(11) DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `id_category`, `title`, `image`, `price`, `status`, `reason`, `block_by`, `block_date`, `create_by`, `create_date`, `delete`, `delete_by`, `delete_date`) VALUES
(29, 19, 'Produk 1', '684159475d736-1749113159.jpg', 100000, 'Y', NULL, NULL, NULL, 57, '2025-06-05 15:45:59', 'N', NULL, NULL),
(30, 19, 'Produk 2', '684159da12d1d-1749113306.jpg', 200000, 'Y', NULL, NULL, NULL, 57, '2025-06-05 15:48:26', 'N', NULL, NULL),
(31, 19, 'Produk 3', '684371efd1486-1749250543.jpg', 400000, 'Y', NULL, NULL, NULL, 57, '2025-06-07 05:55:43', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(20) UNSIGNED NOT NULL,
  `logo` varchar(199) DEFAULT NULL,
  `icon` varchar(199) DEFAULT NULL,
  `logo_white` varchar(200) DEFAULT NULL,
  `icon_white` varchar(200) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_author` text DEFAULT NULL,
  `meta_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id_setting`, `logo`, `icon`, `logo_white`, `icon_white`, `meta_title`, `meta_keyword`, `meta_description`, `meta_author`, `meta_address`, `created_at`, `updated_at`) VALUES
(1, 'logo.png', 'icon.png', '', '', 'Moving Avarage', '', '', 'saka devs', '', '2025-04-19 02:47:15', '2025-04-20 09:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `sosmed`
--

CREATE TABLE `sosmed` (
  `id_sosmed` int(11) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sosmed`
--

INSERT INTO `sosmed` (`id_sosmed`, `icon`, `name`) VALUES
(1, 'fa-brands fa-facebook', 'facebook'),
(2, 'fa-brands fa-x-twitter', 'twitter'),
(3, 'fa-brands fa-instagram', 'instagram'),
(19, 'fa-brands fa-youtube', 'Youtube');

-- --------------------------------------------------------

--
-- Table structure for table `sosmed_setting`
--

CREATE TABLE `sosmed_setting` (
  `id_sosmed_setting` int(11) NOT NULL,
  `id_setting` int(11) DEFAULT NULL,
  `id_sosmed` int(11) DEFAULT NULL,
  `name_sosmed` varchar(200) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sosmed_setting`
--

INSERT INTO `sosmed_setting` (`id_sosmed_setting`, `id_setting`, `id_sosmed`, `name_sosmed`, `url`) VALUES
(189, 1, 1, NULL, NULL),
(190, 1, 2, NULL, NULL),
(191, 1, 3, NULL, NULL),
(192, 1, 19, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id_stock`, `id_product`, `qty`, `create_date`) VALUES
(1, 31, 10, '2025-06-07 05:55:43'),
(2, 31, 11, '2025-06-07 06:22:58'),
(3, 31, 20, '2025-06-07 06:23:09'),
(4, 30, 20, '2025-06-07 06:27:25'),
(5, 31, 3, '2025-06-07 06:27:47'),
(6, 31, 1, '2025-06-07 06:28:01'),
(7, 29, 30, '2025-06-07 06:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `total`, `create_by`, `create_date`) VALUES
(2, 500000, 57, '2025-06-05 23:20:26'),
(3, 300000, 57, '2025-06-05 23:22:24'),
(4, 100000, 57, '2025-06-05 23:22:30'),
(5, 300000, 57, '2025-06-04 23:22:37'),
(6, 300000, 57, '2025-06-04 23:23:24'),
(7, 1200000, 57, '2025-06-03 23:23:33'),
(8, 100000, 57, '2025-06-03 23:23:39'),
(9, 800000, 57, '2025-06-03 23:23:51'),
(10, 1400000, 57, '2025-06-07 06:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id_transaction_detail` int(11) NOT NULL,
  `id_transaction` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`id_transaction_detail`, `id_transaction`, `id_product`, `price`, `qty`, `total`) VALUES
(3, 2, 29, 100000, 1, 100000),
(4, 2, 30, 200000, 2, 400000),
(5, 3, 29, 100000, 1, 100000),
(6, 3, 30, 200000, 1, 200000),
(7, 4, 29, 100000, 1, 100000),
(8, 5, 29, 100000, 3, 300000),
(9, 6, 29, 100000, 1, 100000),
(10, 6, 30, 200000, 1, 200000),
(11, 7, 30, 200000, 6, 1200000),
(12, 8, 29, 100000, 1, 100000),
(13, 9, 29, 100000, 6, 600000),
(14, 9, 30, 200000, 1, 200000),
(15, 10, 30, 200000, 7, 1400000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(199) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `id_role` tinyint(4) DEFAULT 2 COMMENT '1 = admin, 2 = user',
  `name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `reason` text DEFAULT NULL,
  `block_date` datetime DEFAULT NULL,
  `block_by` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delete` enum('Y','N') DEFAULT 'N',
  `delete_by` int(11) DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `phone`, `id_role`, `name`, `image`, `password`, `status`, `reason`, `block_date`, `block_by`, `create_by`, `create_date`, `delete`, `delete_by`, `delete_date`) VALUES
(57, 'admin@gmail.com', '08131031001031', 1, 'Superadmin', '680ccd0d40685-1745669389.jpg', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Y', '', NULL, NULL, NULL, '2025-06-04 23:43:50', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `web_email`
--

CREATE TABLE `web_email` (
  `id_web_mail` int(11) NOT NULL,
  `id_setting` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_phone`
--

CREATE TABLE `web_phone` (
  `id_web_phone` int(11) NOT NULL,
  `id_setting` int(11) DEFAULT NULL,
  `phone` varchar(200) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `category_ibfk_1` (`create_by`),
  ADD KEY `category_ibfk_2` (`delete_by`),
  ADD KEY `category_ibfk_3` (`block_by`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `create_by` (`create_by`),
  ADD KEY `block_by` (`block_by`),
  ADD KEY `delete_by` (`delete_by`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indexes for table `sosmed`
--
ALTER TABLE `sosmed`
  ADD PRIMARY KEY (`id_sosmed`);

--
-- Indexes for table `sosmed_setting`
--
ALTER TABLE `sosmed_setting`
  ADD PRIMARY KEY (`id_sosmed_setting`),
  ADD KEY `id_sosmed` (`id_sosmed`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `create_by` (`create_by`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id_transaction_detail`),
  ADD KEY `id_transaction` (`id_transaction`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `block_by` (`block_by`),
  ADD KEY `user_ibfk_2` (`create_by`),
  ADD KEY `delete_by` (`delete_by`);

--
-- Indexes for table `web_email`
--
ALTER TABLE `web_email`
  ADD PRIMARY KEY (`id_web_mail`),
  ADD KEY `id_setting` (`id_setting`);

--
-- Indexes for table `web_phone`
--
ALTER TABLE `web_phone`
  ADD PRIMARY KEY (`id_web_phone`),
  ADD KEY `id_setting` (`id_setting`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sosmed`
--
ALTER TABLE `sosmed`
  MODIFY `id_sosmed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sosmed_setting`
--
ALTER TABLE `sosmed_setting`
  MODIFY `id_sosmed_setting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id_transaction_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `web_email`
--
ALTER TABLE `web_email`
  MODIFY `id_web_mail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `web_phone`
--
ALTER TABLE `web_phone`
  MODIFY `id_web_phone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`delete_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `category_ibfk_3` FOREIGN KEY (`block_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`block_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_4` FOREIGN KEY (`delete_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sosmed_setting`
--
ALTER TABLE `sosmed_setting`
  ADD CONSTRAINT `sosmed_setting_ibfk_1` FOREIGN KEY (`id_sosmed`) REFERENCES `sosmed` (`id_sosmed`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`id_transaction`) REFERENCES `transaction` (`id_transaction`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
