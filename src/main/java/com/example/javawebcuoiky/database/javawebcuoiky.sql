-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2026 at 05:23 PM
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
-- Database: `javawebcuoiky`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand_name`) VALUES
(1, 'casio'),
(2, 'gucci'),
(3, 'rolex');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `discount`, `hot`, `id_brand`, `image`, `name`, `price`, `quantity`) VALUES
(1, 'dfs', 12, 0, 1, '1779801781825_dongho2.webp', 'ssdd', 1200000, 12),
(2, 'afdsfd', 12, 0, 3, '1779801801860_istockphoto-890822072-612x612.webp', 'Phi onTop', 3000000, 30),
(3, 'sdafsdfsdfdsfsdvxcvxcvxcvxcvx', 100000, 0, 2, '1779808185902_photo-1732679005773-f2ef48b724c7.avif', 'đồng hồ 1', 2000000, 23),
(4, 'sedfsdvsdfvsdfvsfvsdvs', 12312, 0, 3, '1779808201663_photo-1748327929572-2ccf5716d3b9.avif', 'svsdfvds', 123423423432, 12),
(5, 'ềasfesdafsdfds', 12312, 0, 1, '1779808223499_photo-1732679005773-f2ef48b724c7.avif', 'ưefgewfgwe', 123123, 1223),
(6, 'qưertyuiop[ádfghjkl;zxcvbnm,', 12113123, 0, 1, '1779808253524_photo-1631031354362-b1fd73f89e19.avif', 'ưerfewfwe', 123456789, 12),
(7, 'sdfsasdfghjklxcvbnmrtyuio', 1000000, 0, 2, '1779808283436_photo-1624106159879-8a16d53c54ff.avif', 'ádfghjklr', 1234567890, 123),
(8, 'ưertyuuioplokijhgfvbnm,', 9876, 0, 3, '1779808317074_photo-1610888968213-4f6d2c068108.avif', 'ádfghjkl', 1234567890, 38),
(9, 'êfsdvxcvsvsdvsdvsd', 123123, 0, 3, '1779808345735_photo-1588748543198-cd1afaf858ff.avif', 'dèagdahdjnjasmdak', 1234567879, 123),
(10, 'gfsklmnmsgjfugfdbdfd', 2342342, 0, 2, '1779808381920_photo-1751437774882-deeea4352018.avif', 'adasfdasdfsdfsdfsdf', 456475869787, 24);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `role`) VALUES
(1, 'nguyenphucphi210@gmail.com', 'Phi', '123456', 1),
(2, 'anh@gmail.com', 'Anh', '123456', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_brand` (`id_brand`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_shoppingcart_product` (`id_product`),
  ADD KEY `fk_shoppingcart_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`);

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_shoppingcart_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_shoppingcart_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
