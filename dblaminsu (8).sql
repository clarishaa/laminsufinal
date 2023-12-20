-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 20, 2023 at 04:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblaminsu`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `audit_id` int NOT NULL,
  `item_id` int NOT NULL,
  `oldQuantity` int NOT NULL,
  `quantity` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`audit_id`, `item_id`, `oldQuantity`, `quantity`, `type`, `created_at`, `updated_at`) VALUES
(64, 12, 30, 29, 'sold', '2023-12-18 10:22:50', '2023-12-18 02:22:50'),
(65, 11, 12, 11, 'sold', '2023-12-18 10:22:50', '2023-12-18 02:22:50'),
(66, 9, 7777, 7776, 'sold', '2023-12-18 10:26:21', '2023-12-18 02:26:21'),
(67, 10, 199, 198, 'sold', '2023-12-18 10:26:21', '2023-12-18 02:26:21'),
(68, 9, 7776, 7775, 'sold', '2023-12-18 10:28:39', '2023-12-18 02:28:39'),
(69, 12, 29, 26, 'sold', '2023-12-18 14:06:58', '2023-12-18 06:06:58'),
(70, 18, 1230, 1226, 'sold', '2023-12-20 11:01:46', '2023-12-20 03:01:46'),
(71, 12, 26, 25, 'sold', '2023-12-20 11:01:46', '2023-12-20 03:01:46'),
(72, 9, 7775, 7774, 'sold', '2023-12-20 11:01:46', '2023-12-20 03:01:46'),
(73, 11, 11, 10, 'sold', '2023-12-20 11:09:18', '2023-12-20 03:09:18'),
(74, 12, 25, 24, 'sold', '2023-12-20 11:09:18', '2023-12-20 03:09:18'),
(75, 12, 24, 23, 'sold', '2023-12-20 11:10:07', '2023-12-20 03:10:07'),
(76, 12, 23, 22, 'sold', '2023-12-20 11:17:02', '2023-12-20 03:17:02'),
(77, 12, 22, 21, 'sold', '2023-12-20 11:18:32', '2023-12-20 03:18:32'),
(78, 12, 21, 20, 'sold', '2023-12-20 11:19:57', '2023-12-20 03:19:57'),
(79, 12, 20, 19, 'sold', '2023-12-20 11:20:55', '2023-12-20 03:20:55'),
(80, 12, 19, 18, 'sold', '2023-12-20 11:22:08', '2023-12-20 03:22:08'),
(81, 10, 198, 197, 'sold', '2023-12-20 11:23:23', '2023-12-20 03:23:23'),
(82, 12, 18, 17, 'sold', '2023-12-20 11:25:41', '2023-12-20 03:25:41'),
(83, 12, 17, 16, 'sold', '2023-12-20 11:26:49', '2023-12-20 03:26:49'),
(84, 12, 16, 15, 'sold', '2023-12-20 11:27:52', '2023-12-20 03:27:52'),
(85, 12, 15, 14, 'sold', '2023-12-20 11:28:47', '2023-12-20 03:28:47'),
(86, 12, 14, 11, 'sold', '2023-12-20 11:30:49', '2023-12-20 03:30:49'),
(87, 9, 7774, 7772, 'sold', '2023-12-20 11:31:54', '2023-12-20 03:31:54'),
(88, 10, 197, 196, 'sold', '2023-12-20 11:31:54', '2023-12-20 03:31:54'),
(89, 11, 10, 9, 'sold', '2023-12-20 11:31:54', '2023-12-20 03:31:54'),
(90, 12, 11, 8, 'sold', '2023-12-20 11:44:03', '2023-12-20 03:44:03'),
(91, 12, 8, 5, 'sold', '2023-12-20 11:44:14', '2023-12-20 03:44:14'),
(92, 12, 5, 2, 'sold', '2023-12-20 11:44:30', '2023-12-20 03:44:30'),
(93, 12, 2, 1, 'sold', '2023-12-20 11:51:40', '2023-12-20 03:51:40'),
(94, 9, 7772, 7771, 'sold', '2023-12-20 11:52:33', '2023-12-20 03:52:33'),
(95, 10, 196, 195, 'sold', '2023-12-20 11:52:33', '2023-12-20 03:52:33'),
(96, 13, 24, 23, 'sold', '2023-12-20 12:00:13', '2023-12-20 04:00:13'),
(97, 17, 2345, 2344, 'sold', '2023-12-20 12:00:13', '2023-12-20 04:00:13'),
(98, 9, 7771, 7768, 'sold', '2023-12-20 12:07:12', '2023-12-20 04:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(82, 92, 9, 3, '2023-12-20 03:43:22', '2023-12-20 04:01:20'),
(83, 92, 10, 1, '2023-12-20 03:43:24', '2023-12-20 03:43:24'),
(84, 92, 17, 1, '2023-12-20 03:43:25', '2023-12-20 03:43:25'),
(85, 92, 13, 1, '2023-12-20 03:58:29', '2023-12-20 03:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` enum('bar','restaurant') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `type`) VALUES
(4, 'Cocktails', 'Refreshing and delicious cocktails', 'bar'),
(5, 'Craft Beer', 'Wide selection of craft beers', 'bar'),
(6, 'Appetizers', 'Tasty starters to whet your appetite', 'restaurant'),
(7, 'Main Courses', 'Delicious and hearty main dishes', 'restaurant'),
(8, 'Desserts', 'Sweet treats to satisfy your cravings', 'restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discount_id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` int DEFAULT NULL,
  `invoice_number` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoice_id`, `user_id`, `invoice_date`, `order_id`, `invoice_number`) VALUES
(6, 75, '2023-12-02 11:11:54', 46, 'LMCC59821701515514'),
(7, 75, '2023-12-02 11:18:24', 47, 'LMCC17011701515904'),
(8, 75, '2023-12-02 12:12:42', 48, 'LMCC27451701519162'),
(9, 75, '2023-12-02 12:12:50', 49, 'LMCC15931701519170'),
(10, 75, '2023-12-02 12:24:42', 50, 'LMCC59361701519882'),
(11, 75, '2023-12-02 12:24:59', 51, 'LMCC93311701519899'),
(12, 75, '2023-12-02 12:26:48', 52, 'LMCC86711701520008'),
(13, 75, '2023-12-02 15:00:28', 53, 'LMCC12991701529228'),
(14, 75, '2023-12-02 15:00:43', 54, 'LMCC33191701529243'),
(15, 75, '2023-12-02 15:01:23', 55, 'LMCC52051701529283'),
(16, 75, '2023-12-02 15:14:01', 56, 'LMCC32061701530041'),
(17, 75, '2023-12-02 15:16:49', 57, 'LMCC26741701530209'),
(18, 75, '2023-12-02 15:20:47', 58, 'LMCC49291701530447'),
(19, 75, '2023-12-02 15:24:01', 59, 'LMCC55951701530641'),
(20, 75, '2023-12-02 15:24:45', 60, 'LMCC50041701530685'),
(21, 75, '2023-12-02 15:25:17', 61, 'LMCC67201701530717'),
(22, 75, '2023-12-03 02:25:32', 62, 'LMCC78851701570332'),
(23, 75, '2023-12-03 08:09:06', 63, 'LMCC79571701590946'),
(24, 75, '2023-12-03 09:05:43', 64, 'LMCC26211701594343'),
(25, 75, '2023-12-03 10:37:24', 65, 'LMCC54571701599844'),
(26, 75, '2023-12-03 12:15:55', 66, 'LMCC66461701605755'),
(27, 75, '2023-12-03 13:32:57', 67, 'LMCC52751701610377'),
(28, 75, '2023-12-03 15:06:40', 68, 'LMCC24121701616000'),
(29, 75, '2023-12-05 03:13:16', 69, 'LMCC67181701745996'),
(30, 75, '2023-12-05 04:19:14', 70, 'LMCC87891701749954'),
(31, 75, '2023-12-05 04:22:46', 71, 'LMCC55931701750166'),
(32, 75, '2023-12-06 03:42:09', 72, 'LMCC88791701834129'),
(33, 75, '2023-12-08 12:06:30', 73, 'LMCC86151702037190'),
(34, 75, '2023-12-08 12:09:17', 74, 'LMCC88611702037357'),
(35, 75, '2023-12-10 14:09:14', 75, 'LMCC45271702217354'),
(36, 75, '2023-12-10 15:13:01', 76, 'LMCC61211702221181'),
(37, 75, '2023-12-10 15:15:09', 77, 'LMCC59861702221309'),
(38, 75, '2023-12-13 16:54:57', 81, 'LMCC56731702486497'),
(39, 75, '2023-12-13 17:16:15', 86, 'LMCC59241702487775'),
(40, 75, '2023-12-13 20:26:21', 95, 'LMCC99421702499181'),
(41, 75, '2023-12-13 20:31:29', 96, 'LMCC21061702499489'),
(42, 75, '2023-12-13 20:42:41', 99, 'LMCC30511702500161'),
(43, 75, '2023-12-13 20:43:38', 100, 'LMCC44641702500218'),
(44, 75, '2023-12-13 20:47:07', 102, 'LMCC28721702500427'),
(45, 75, '2023-12-13 20:48:21', 103, 'LMCC37061702500501'),
(46, 75, '2023-12-13 20:50:51', 104, 'LMCC42661702500651'),
(47, 75, '2023-12-13 21:11:22', 105, 'LMCC94461702501882'),
(48, 75, '2023-12-13 22:06:43', 106, 'LMCC33181702505203'),
(49, 75, '2023-12-17 22:50:09', 107, 'LMCC42261702853409'),
(50, 75, '2023-12-18 00:27:55', 108, 'LMCC69181702859275'),
(51, 75, '2023-12-18 00:39:26', 109, 'LMCC65981702859966'),
(52, 75, '2023-12-18 00:42:13', 110, 'LMCC90181702860133'),
(53, 75, '2023-12-18 00:44:23', 111, 'LMCC74961702860263'),
(54, 75, '2023-12-18 01:44:54', 112, 'LMCC89721702863894'),
(55, 75, '2023-12-18 01:48:25', 113, 'LMCC78391702864105'),
(56, 75, '2023-12-18 01:52:12', 114, 'LMCC47581702864332'),
(57, 75, '2023-12-18 01:56:32', 115, 'LMCC53351702864592'),
(58, 75, '2023-12-18 01:58:19', 116, 'LMCC56501702864699'),
(59, 75, '2023-12-18 02:02:53', 117, 'LMCC84871702864973'),
(60, 75, '2023-12-18 02:21:23', 118, 'LMCC56481702866083'),
(61, 75, '2023-12-18 02:21:23', 118, ''),
(62, 75, '2023-12-18 02:21:37', 119, 'LMCC88791702866097'),
(63, 75, '2023-12-18 02:21:37', 119, ''),
(64, 75, '2023-12-18 02:22:51', 120, 'LMCC48401702866170'),
(65, 75, '2023-12-18 02:22:51', 120, ''),
(66, 75, '2023-12-18 02:26:21', 121, 'LMCC43411702866381'),
(67, 75, '2023-12-18 02:26:21', 121, ''),
(68, 75, '2023-12-18 02:28:39', 122, 'LMCC19561702866519'),
(69, 75, '2023-12-18 02:28:39', 122, ''),
(70, 75, '2023-12-18 06:06:37', 123, 'LMCC22121702879597'),
(71, 75, '2023-12-20 03:01:46', 124, 'LMCC44551703041306'),
(72, 75, '2023-12-20 03:01:46', 124, ''),
(73, 75, '2023-12-20 03:09:18', 125, 'LMCC31271703041758'),
(74, 75, '2023-12-20 03:09:18', 125, ''),
(75, 75, '2023-12-20 03:10:07', 126, 'LMCC52001703041807'),
(76, 75, '2023-12-20 03:10:07', 126, ''),
(77, 75, '2023-12-20 03:17:02', 127, 'LMCC40661703042222'),
(78, 75, '2023-12-20 03:17:02', 127, ''),
(79, 75, '2023-12-20 03:18:32', 128, 'LMCC92161703042312'),
(80, 75, '2023-12-20 03:18:32', 128, ''),
(81, 75, '2023-12-20 03:19:57', 129, 'LMCC47831703042397'),
(82, 75, '2023-12-20 03:19:57', 129, ''),
(83, 75, '2023-12-20 03:20:55', 130, 'LMCC21481703042455'),
(84, 75, '2023-12-20 03:20:55', 130, ''),
(85, 75, '2023-12-20 03:22:08', 131, 'LMCC99821703042528'),
(86, 75, '2023-12-20 03:22:08', 131, ''),
(87, 75, '2023-12-20 03:23:23', 132, 'LMCC38851703042603'),
(88, 75, '2023-12-20 03:23:23', 132, ''),
(89, 75, '2023-12-20 03:25:41', 133, 'LMCC22821703042741'),
(90, 75, '2023-12-20 03:25:41', 133, ''),
(91, 75, '2023-12-20 03:26:49', 134, 'LMCC94221703042809'),
(92, 75, '2023-12-20 03:26:49', 134, ''),
(93, 75, '2023-12-20 03:27:52', 135, 'LMCC50421703042872'),
(94, 75, '2023-12-20 03:27:52', 135, ''),
(95, 75, '2023-12-20 03:28:47', 136, 'LMCC58621703042927'),
(96, 75, '2023-12-20 03:28:47', 136, ''),
(97, 75, '2023-12-20 03:29:37', 137, 'LMCC97691703042977'),
(98, 75, '2023-12-20 03:31:54', 138, 'LMCC44801703043114'),
(99, 75, '2023-12-20 03:31:54', 138, ''),
(100, 92, '2023-12-20 03:43:43', 139, 'LMCC97751703043823'),
(101, 75, '2023-12-20 03:51:40', 140, 'LMCC59951703044300'),
(102, 75, '2023-12-20 03:51:40', 140, ''),
(103, 92, '2023-12-20 03:52:18', 141, 'LMCC14201703044338'),
(104, 92, '2023-12-20 03:58:45', 142, 'LMCC30461703044725'),
(105, 92, '2023-12-20 04:01:26', 143, 'LMCC18411703044886');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  `img_path` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `name`, `description`, `price`, `category_id`, `img_path`, `created_at`, `quantity`) VALUES
(9, '4asdfghjkl', 'Wide selection of craft beers', 1111.00, 5, 'receipt (10).png', '2023-12-02 19:07:00', 7768),
(10, 'IPA Beer', 'India Pale Ale with a hoppy flavor profile', 5.49, 5, 'ipa_beer.jpg', '2023-12-02 19:08:00', 195),
(11, 'Spinach Artichoke Dip', 'Creamy dip with spinach and artichoke hearts', 6.99, 6, 'spinach_dip.jpg', '2023-12-02 19:09:00', 9),
(12, 'Grilled Salmon', 'Salmon fillet grilled to perfection', 15.99, 7, 'grilled_salmon.jpg', '2023-12-02 19:10:00', 1),
(13, 'Chocolate Lava Cake', 'Warm chocolate cake with a gooey, molten center', 7.99, 8, 'lava_cake.jpg', '2023-12-02 19:11:00', 23),
(17, 'sdfghjkl;', 'asdfghjkl', 12345.00, 5, 'lava_cake.jpg', '2023-12-13 08:23:20', 2344),
(18, 'asdfghjkl', 'sdfghj', 123.00, 5, 'lava_cake.jpg', '2023-12-13 08:25:59', 1226),
(19, 'hhh', 'bbbb', 66.00, 7, 'receipt (8).png', '2023-12-13 15:10:50', 88),
(20, '4asdfghjkl', 'Wide selection of craft beers', 222.00, 5, 'minsu.png', '2023-12-13 15:49:13', 66),
(21, '4asdfghjkl', 'Wide selection of craft beers', 777.00, 5, 'receipt (8).png', '2023-12-13 15:52:45', 66),
(22, 'kkkk', 'jjjj', 99.00, 8, 'invoice (2).png', '2023-12-13 15:53:31', 666),
(23, 'ttt', 'a', 1.00, 6, 'logo (150 x 80 px).png', '2023-12-13 15:54:52', 5),
(24, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:08', 333),
(25, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:12', 333),
(26, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:13', 333),
(27, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:13', 333),
(28, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:14', 333),
(29, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:14', 333),
(30, 'j', 'dd', 33.00, 6, 'receipt (5).png', '2023-12-13 15:56:21', 333),
(31, 'jjj', 'gggg', 111.00, 6, 'receipt (8).png', '2023-12-13 15:57:18', 222),
(32, 'dfghjk', 'sss', 1111.00, 5, 'minsu.jpg', '2023-12-13 15:58:21', 3333),
(33, '4asdfghjkl', 'Wide selection of craft beers', 111111.00, 5, 'receipt (5).png', '2023-12-13 16:13:54', 66),
(34, 'dfghjk', 'Wide selection of craft beers', 1111.00, 5, 'payqr (2).png', '2023-12-13 16:14:21', 3333),
(35, 'dfghjk', 'Wide selection of craft beers', 1111.00, 5, 'payqr (4).png', '2023-12-13 16:14:45', 3333),
(36, '4asdfghjkl', 'Wide selection of craft beers', 2222.00, 5, 'receipt (7).png', '2023-12-13 16:15:27', 66),
(37, '4asdfghjkl', 'Wide selection of craft beers', 11111.00, 5, 'receipt (8).png', '2023-12-13 16:22:16', 66),
(38, '4asdfghjkl', 'Wide selection of craft beers', 11111.00, 5, 'receipt (7).png', '2023-12-13 16:27:04', 66),
(39, 'kkkk', 'Sweet treats to satisfy your cravings', 99.00, 8, 'receipt (7).png', '2023-12-13 16:27:20', 666),
(40, 'sdfghjk;;;;', 'fcvbnm', 222.00, 6, 'receipt (5).png', '2023-12-13 16:31:27', 2222),
(41, 'jnhbgvfcxz', 'hgfdsa11', 111.00, 6, 'receipt (6).png', '2023-12-13 16:32:05', 55555),
(43, 'afds', 'vcdsa', 1144.00, 8, 'logo.png', '2023-12-13 16:34:10', 333),
(44, 'gfdsa', 'gfdsa', 4333.00, 7, 'receipt (8).png', '2023-12-13 16:35:11', 666),
(45, 'Margarita', 'Refreshing and delicious cocktails', 55.00, 4, 'map zambonga.png', '2023-12-13 23:01:18', 67),
(46, 'christmas', 'jjjkolijh', 11.00, 7, 'anchor-39.jpg', '2023-12-13 23:03:05', 44),
(47, 'qwerty', 'lll', 99.00, 4, 'margarita.jpg', '2023-12-13 23:03:58', 55);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_type` enum('dinein','takeout','delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'dinein',
  `delivery_address` varchar(255) DEFAULT NULL,
  `order_details` text,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','confirmed','completed') DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `discount_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_type`, `delivery_address`, `order_details`, `order_time`, `status`, `total_amount`, `discount_id`) VALUES
(46, 75, 'dinein', NULL, '', '2023-12-02 11:11:54', 'pending', 102.93, NULL),
(47, 75, 'dinein', NULL, '', '2023-12-02 11:18:24', 'pending', 6.99, NULL),
(48, 75, '', NULL, '', '2023-12-02 12:12:42', 'pending', 6.99, NULL),
(49, 75, 'dinein', NULL, '', '2023-12-02 12:12:50', 'pending', 6.99, NULL),
(50, 75, 'dinein', NULL, '', '2023-12-02 12:24:42', 'pending', 6.99, NULL),
(51, 75, 'dinein', NULL, '', '2023-12-02 12:24:59', 'pending', 6.99, NULL),
(52, 75, 'dinein', NULL, '', '2023-12-02 12:26:48', 'pending', 6.99, NULL),
(53, 75, 'dinein', NULL, '', '2023-12-02 15:00:28', 'pending', 6.99, NULL),
(54, 75, 'dinein', NULL, '', '2023-12-02 15:00:43', 'pending', 6.99, NULL),
(55, 75, 'dinein', NULL, '', '2023-12-02 15:01:23', 'pending', 6.99, NULL),
(56, 75, 'dinein', NULL, '', '2023-12-02 15:14:01', 'pending', 102.93, NULL),
(57, 75, 'dinein', NULL, '', '2023-12-02 15:16:49', 'pending', 6.99, NULL),
(58, 75, 'dinein', NULL, '', '2023-12-02 15:20:47', 'pending', 102.93, NULL),
(59, 75, 'dinein', NULL, '', '2023-12-02 15:24:01', 'pending', 6.99, NULL),
(60, 75, 'dinein', NULL, '', '2023-12-02 15:24:45', 'pending', 6.99, NULL),
(61, 75, 'dinein', NULL, '', '2023-12-02 15:25:17', 'pending', 6.99, NULL),
(62, 75, 'dinein', NULL, '', '2023-12-03 02:25:32', 'pending', 6.99, NULL),
(63, 75, 'dinein', NULL, '', '2023-12-03 08:09:06', 'pending', 34.95, NULL),
(64, 75, 'dinein', NULL, '', '2023-12-03 09:05:43', 'pending', 34.95, NULL),
(65, 75, 'dinein', NULL, '', '2023-12-03 10:37:24', 'pending', 8.99, NULL),
(66, 75, 'delivery', NULL, '', '2023-12-03 12:15:55', 'pending', 8.99, NULL),
(67, 75, 'dinein', NULL, '', '2023-12-03 13:32:57', 'pending', 8.99, NULL),
(68, 75, 'dinein', NULL, '', '2023-12-03 15:06:40', 'pending', 35.96, NULL),
(69, 75, 'dinein', NULL, '', '2023-12-05 03:13:16', 'pending', 71.92, NULL),
(70, 75, 'dinein', NULL, '', '2023-12-05 04:19:14', 'pending', 88.39, NULL),
(71, 75, 'dinein', NULL, '', '2023-12-05 04:22:46', 'pending', 88.39, NULL),
(72, 75, 'dinein', NULL, '', '2023-12-06 03:42:09', 'pending', 88.39, NULL),
(73, 75, 'takeout', NULL, '', '2023-12-08 12:06:30', 'pending', 69.38, NULL),
(74, 75, 'takeout', NULL, '', '2023-12-08 12:09:17', 'pending', 69.38, NULL),
(75, 75, 'takeout', NULL, '', '2023-12-10 14:09:14', 'pending', 69.38, NULL),
(76, 75, 'takeout', NULL, '', '2023-12-10 15:13:01', 'pending', 69.38, NULL),
(77, 75, 'takeout', NULL, '', '2023-12-10 15:15:09', 'pending', 69.38, NULL),
(78, 75, 'takeout', NULL, '', '2023-12-13 16:52:07', 'pending', 26664.00, NULL),
(79, 75, 'takeout', NULL, '', '2023-12-13 16:52:55', 'pending', 26664.00, NULL),
(80, 75, 'takeout', NULL, '', '2023-12-13 16:53:13', 'pending', 26664.00, NULL),
(81, 75, 'takeout', NULL, '', '2023-12-13 16:54:57', 'pending', 26664.00, NULL),
(82, 75, 'dinein', NULL, '', '2023-12-13 17:08:01', 'pending', 26664.00, NULL),
(83, 75, 'dinein', NULL, '', '2023-12-13 17:09:34', 'pending', 26664.00, NULL),
(84, 75, 'dinein', NULL, '', '2023-12-13 17:15:17', 'pending', 26664.00, NULL),
(85, 75, 'dinein', NULL, '', '2023-12-13 17:15:42', 'pending', 26664.00, NULL),
(86, 75, 'dinein', NULL, '', '2023-12-13 17:16:15', 'pending', 26664.00, NULL),
(87, 75, 'takeout', NULL, '', '2023-12-13 20:09:44', 'pending', 60.39, NULL),
(88, 75, 'takeout', NULL, '', '2023-12-13 20:09:54', 'pending', 60.39, NULL),
(89, 75, 'takeout', NULL, '', '2023-12-13 20:12:41', 'pending', 60.39, NULL),
(90, 75, 'takeout', NULL, '', '2023-12-13 20:15:17', 'pending', 60.39, NULL),
(91, 75, 'takeout', NULL, '', '2023-12-13 20:16:42', 'pending', 60.39, NULL),
(92, 75, 'takeout', NULL, '', '2023-12-13 20:16:44', 'pending', 60.39, NULL),
(93, 75, 'takeout', NULL, '', '2023-12-13 20:17:39', 'pending', 60.39, NULL),
(94, 75, 'takeout', NULL, '', '2023-12-13 20:23:51', 'pending', 60.39, NULL),
(95, 75, 'takeout', NULL, '', '2023-12-13 20:26:21', 'pending', 60.39, NULL),
(96, 75, 'takeout', NULL, '', '2023-12-13 20:31:29', 'pending', 60.39, NULL),
(97, 75, 'takeout', NULL, '', '2023-12-13 20:32:27', 'pending', 60.39, NULL),
(98, 75, 'takeout', NULL, '', '2023-12-13 20:41:05', 'pending', 60.39, NULL),
(99, 75, 'takeout', NULL, '', '2023-12-13 20:42:41', 'pending', 60.39, NULL),
(100, 75, 'takeout', NULL, '', '2023-12-13 20:43:38', 'pending', 60.39, NULL),
(101, 75, 'takeout', NULL, '', '2023-12-13 20:45:48', 'pending', 60.39, NULL),
(102, 75, 'takeout', NULL, '', '2023-12-13 20:47:07', 'pending', 60.39, NULL),
(103, 75, 'takeout', NULL, '', '2023-12-13 20:48:21', 'pending', 60.39, NULL),
(104, 75, 'takeout', NULL, '', '2023-12-13 20:50:51', 'pending', 60.39, NULL),
(105, 75, 'takeout', NULL, '', '2023-12-13 21:11:22', 'pending', 60.39, NULL),
(106, 75, 'dinein', NULL, '', '2023-12-13 22:06:43', 'pending', 7.99, NULL),
(107, 75, 'takeout', NULL, '', '2023-12-17 22:50:09', 'pending', 385.00, NULL),
(108, 75, 'takeout', NULL, '', '2023-12-18 00:27:54', 'pending', 432.97, NULL),
(109, 75, 'takeout', NULL, '', '2023-12-18 00:39:26', 'pending', 497.24, NULL),
(110, 75, '', NULL, '', '2023-12-18 00:42:13', 'pending', 207.14, NULL),
(111, 75, 'dinein', NULL, '', '2023-12-18 00:44:23', 'pending', 47.97, NULL),
(112, 75, 'takeout', NULL, '', '2023-12-18 01:44:54', 'pending', 47.97, NULL),
(113, 75, 'takeout', NULL, '', '2023-12-18 01:48:25', 'pending', 47.97, NULL),
(114, 75, 'dinein', NULL, '', '2023-12-18 01:52:12', 'pending', 47.97, NULL),
(115, 75, 'takeout', NULL, '', '2023-12-18 01:56:32', 'pending', 47.97, NULL),
(116, 75, 'takeout', NULL, '', '2023-12-18 01:58:19', 'pending', 47.97, NULL),
(117, 75, 'takeout', NULL, '', '2023-12-18 02:02:53', 'pending', 47.97, NULL),
(118, 75, '', NULL, '', '2023-12-18 02:21:23', 'pending', 207.14, NULL),
(119, 75, '', NULL, '', '2023-12-18 02:21:37', 'pending', 207.14, NULL),
(120, 75, '', NULL, '', '2023-12-18 02:22:50', 'pending', 25.74, NULL),
(121, 75, '', NULL, '', '2023-12-18 02:26:21', 'pending', 1250.47, NULL),
(122, 75, '', NULL, '', '2023-12-18 02:28:39', 'pending', 1244.32, NULL),
(123, 75, 'dinein', NULL, '', '2023-12-18 06:06:37', 'pending', 507.99, NULL),
(124, 75, '', NULL, '', '2023-12-20 03:01:46', 'pending', 1813.27, NULL),
(125, 75, '', NULL, '', '2023-12-20 03:09:18', 'pending', 25.74, NULL),
(126, 75, '', NULL, '', '2023-12-20 03:10:07', 'pending', 17.91, NULL),
(127, 75, '', NULL, '', '2023-12-20 03:17:02', 'pending', 17.91, NULL),
(128, 75, '', NULL, '', '2023-12-20 03:18:32', 'pending', 17.91, NULL),
(129, 75, '', NULL, '', '2023-12-20 03:19:57', 'pending', 17.91, NULL),
(130, 75, '', NULL, '', '2023-12-20 03:20:55', 'pending', 17.91, NULL),
(131, 75, '', NULL, '', '2023-12-20 03:22:08', 'pending', 17.91, NULL),
(132, 75, '', NULL, '', '2023-12-20 03:23:23', 'pending', 6.15, NULL),
(133, 75, '', NULL, '', '2023-12-20 03:25:41', 'pending', 17.91, NULL),
(134, 75, '', NULL, '', '2023-12-20 03:26:49', 'pending', 17.91, NULL),
(135, 75, '', NULL, '', '2023-12-20 03:27:52', 'pending', 17.91, NULL),
(136, 75, '', NULL, '', '2023-12-20 03:28:47', 'pending', 17.91, NULL),
(137, 75, 'takeout', NULL, '', '2023-12-20 03:29:37', 'pending', 2234.48, NULL),
(138, 75, '', NULL, '', '2023-12-20 03:31:54', 'pending', 2502.62, NULL),
(139, 92, 'takeout', NULL, '', '2023-12-20 03:43:43', 'pending', 13461.49, NULL),
(140, 75, '', NULL, '', '2023-12-20 03:51:40', 'pending', 17.91, NULL),
(141, 92, 'dinein', NULL, '', '2023-12-20 03:52:18', 'pending', 1116.49, NULL),
(142, 92, 'takeout', NULL, '', '2023-12-20 03:58:45', 'pending', 12352.99, NULL),
(143, 92, 'dinein', NULL, '', '2023-12-20 04:01:26', 'pending', 3333.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orders_item_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`orders_item_id`, `item_id`, `quantity`, `total_price`, `user_id`, `order_id`) VALUES
(59, 11, 1, 6.99, 75, 46),
(60, 12, 6, 95.94, 75, 46),
(61, 11, 1, 6.99, 75, 47),
(62, 11, 1, 6.99, 75, 48),
(63, 11, 1, 6.99, 75, 49),
(64, 11, 1, 6.99, 75, 50),
(65, 11, 1, 6.99, 75, 51),
(66, 11, 1, 6.99, 75, 52),
(67, 11, 1, 6.99, 75, 53),
(68, 11, 1, 6.99, 75, 54),
(69, 11, 1, 6.99, 75, 55),
(70, 11, 1, 6.99, 75, 56),
(71, 12, 6, 95.94, 75, 56),
(72, 11, 1, 6.99, 75, 57),
(73, 11, 1, 6.99, 75, 58),
(74, 12, 6, 95.94, 75, 58),
(75, 11, 1, 6.99, 75, 59),
(76, 11, 1, 6.99, 75, 60),
(77, 11, 1, 6.99, 75, 61),
(78, 11, 1, 6.99, 75, 62),
(79, 11, 5, 34.95, 75, 63),
(80, 11, 5, 34.95, 75, 64),
(81, 9, 1, 8.99, 75, 65),
(82, 9, 1, 8.99, 75, 66),
(83, 9, 1, 8.99, 75, 67),
(84, 9, 4, 35.96, 75, 68),
(85, 9, 8, 71.92, 75, 69),
(86, 9, 8, 71.92, 75, 70),
(87, 10, 3, 16.47, 75, 70),
(88, 9, 8, 71.92, 75, 71),
(89, 10, 3, 16.47, 75, 71),
(90, 9, 8, 71.92, 75, 72),
(91, 10, 3, 16.47, 75, 72),
(92, 9, 1, 8.99, 75, 73),
(93, 10, 11, 60.39, 75, 73),
(94, 9, 1, 8.99, 75, 74),
(95, 10, 11, 60.39, 75, 74),
(96, 9, 1, 8.99, 75, 75),
(97, 10, 11, 60.39, 75, 75),
(98, 9, 1, 8.99, 75, 76),
(99, 10, 11, 60.39, 75, 76),
(100, 9, 1, 8.99, 75, 77),
(101, 10, 11, 60.39, 75, 77),
(102, 9, 24, 26664.00, 75, 78),
(103, 9, 24, 26664.00, 75, 79),
(104, 9, 24, 26664.00, 75, 80),
(105, 9, 24, 26664.00, 75, 81),
(106, 9, 24, 26664.00, 75, 82),
(107, 9, 24, 26664.00, 75, 83),
(108, 9, 24, 26664.00, 75, 84),
(109, 9, 24, 26664.00, 75, 85),
(110, 9, 24, 26664.00, 75, 86),
(111, 10, 11, 60.39, 75, 87),
(112, 10, 11, 60.39, 75, 88),
(113, 10, 11, 60.39, 75, 89),
(114, 10, 11, 60.39, 75, 90),
(115, 10, 11, 60.39, 75, 91),
(116, 10, 11, 60.39, 75, 92),
(117, 10, 11, 60.39, 75, 93),
(118, 10, 11, 60.39, 75, 94),
(119, 10, 11, 60.39, 75, 95),
(120, 10, 11, 60.39, 75, 97),
(121, 10, 11, 60.39, 75, 98),
(122, 10, 11, 60.39, 75, 99),
(123, 10, 11, 60.39, 75, 100),
(124, 10, 11, 60.39, 75, 101),
(125, 10, 11, 60.39, 75, 102),
(126, 10, 11, 60.39, 75, 103),
(127, 10, 11, 60.39, 75, 104),
(128, 10, 11, 60.39, 75, 105),
(129, 13, 1, 7.99, 75, 106),
(130, 45, 7, 385.00, 75, 107),
(131, 45, 7, 385.00, 75, 108),
(132, 12, 3, 47.97, 75, 108),
(133, 45, 5, 275.00, 75, 109),
(134, 12, 2, 31.98, 75, 109),
(135, 11, 2, 13.98, 75, 109),
(136, 18, 1, 123.00, 75, 109),
(137, 12, 3, 47.97, 75, 110),
(138, 11, 2, 13.98, 75, 110),
(139, 18, 1, 123.00, 75, 110),
(140, 12, 3, 47.97, 75, 111),
(141, 12, 3, 47.97, 75, 112),
(142, 12, 3, 47.97, 75, 113),
(143, 12, 3, 47.97, 75, 114),
(144, 12, 3, 47.97, 75, 115),
(145, 12, 3, 47.97, 75, 116),
(146, 12, 3, 47.97, 75, 117),
(147, 12, 3, 47.97, 75, 118),
(148, 11, 2, 13.98, 75, 118),
(149, 18, 1, 123.00, 75, 118),
(150, 12, 3, 47.97, 75, 119),
(151, 11, 2, 13.98, 75, 119),
(152, 18, 1, 123.00, 75, 119),
(153, 12, 1, 15.99, 75, 120),
(154, 11, 1, 6.99, 75, 120),
(155, 9, 1, 1111.00, 75, 121),
(156, 10, 1, 5.49, 75, 121),
(157, 9, 1, 1111.00, 75, 122),
(158, 18, 4, 492.00, 75, 123),
(159, 12, 1, 15.99, 75, 123),
(160, 18, 4, 492.00, 75, 124),
(161, 12, 1, 15.99, 75, 124),
(162, 9, 1, 1111.00, 75, 124),
(163, 11, 1, 6.99, 75, 125),
(164, 12, 1, 15.99, 75, 125),
(165, 12, 1, 15.99, 75, 126),
(166, 12, 1, 15.99, 75, 127),
(167, 12, 1, 15.99, 75, 128),
(168, 12, 1, 15.99, 75, 129),
(169, 12, 1, 15.99, 75, 130),
(170, 12, 1, 15.99, 75, 131),
(171, 10, 1, 5.49, 75, 132),
(172, 12, 1, 15.99, 75, 133),
(173, 12, 1, 15.99, 75, 134),
(174, 12, 1, 15.99, 75, 135),
(175, 12, 1, 15.99, 75, 136),
(176, 9, 2, 2222.00, 75, 137),
(177, 10, 1, 5.49, 75, 137),
(178, 11, 1, 6.99, 75, 137),
(179, 9, 2, 2222.00, 75, 138),
(180, 10, 1, 5.49, 75, 138),
(181, 11, 1, 6.99, 75, 138),
(182, 9, 1, 1111.00, 92, 139),
(183, 10, 1, 5.49, 92, 139),
(184, 17, 1, 12345.00, 92, 139),
(185, 12, 1, 15.99, 75, 140),
(186, 9, 1, 1111.00, 92, 141),
(187, 10, 1, 5.49, 92, 141),
(188, 13, 1, 7.99, 92, 142),
(189, 17, 1, 12345.00, 92, 142),
(190, 9, 3, 3333.00, 92, 143);

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `receipt_date` date NOT NULL,
  `invoice_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_id` int NOT NULL,
  `table_number` int DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `table_number`, `is_available`, `capacity`, `description`, `price`, `quantity`) VALUES
(1, 101, 1, 4, 'Window seat', 50.00, 5),
(2, 102, 1, 6, 'Booth in corner', 75.00, 4),
(3, 103, 0, 2, 'High-top near bar', 30.00, 3),
(4, 104, 1, 8, 'Large group table', 100.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `table_book`
--

CREATE TABLE `table_book` (
  `booking_id` int NOT NULL,
  `user_id` int NOT NULL,
  `booktime` time NOT NULL,
  `bookdate` date NOT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `table_id` int DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `table_book`
--

INSERT INTO `table_book` (`booking_id`, `user_id`, `booktime`, `bookdate`, `message`, `created_at`, `updated_at`, `table_id`, `status`) VALUES
(20, 75, '13:11:00', '2023-11-22', 'gg', '2023-11-30 05:08:56', '2023-12-08 11:08:38', 2, 'booked'),
(21, 75, '15:56:00', '2023-12-05', 'lllll', '2023-11-30 07:55:55', '2023-12-08 10:55:41', 1, 'payed'),
(22, 75, '18:41:00', '2023-12-25', 'christmas', '2023-12-08 08:39:41', '2023-12-08 10:12:58', 4, 'cancelled'),
(23, 75, '21:41:00', '2023-12-26', 'Cbsbieu', '2023-12-08 08:41:29', '2023-12-08 10:12:26', 2, 'cancelled'),
(24, 75, '16:50:00', '2023-12-30', 'dfghjkl', '2023-12-08 08:45:27', '2023-12-08 10:11:21', 4, 'cancelled'),
(25, 75, '16:50:00', '2023-12-19', 'xcvbnm,.', '2023-12-08 08:47:43', '2023-12-08 09:30:15', 4, 'cancelled'),
(26, 75, '18:18:00', '2023-12-27', 'cvbnm,.', '2023-12-08 10:13:38', '2023-12-08 10:13:42', 4, 'cancelled'),
(27, 75, '18:35:00', '2023-12-24', 'zasdfgvbn', '2023-12-08 10:29:57', '2023-12-08 10:41:29', 2, 'booked'),
(28, 75, '23:42:00', '2024-01-02', 'xcvbnm,', '2023-12-08 10:43:06', '2023-12-08 12:43:55', 4, 'cancelled'),
(29, 75, '19:12:00', '2023-12-27', 'xcvbnm,', '2023-12-08 11:08:35', '2023-12-08 11:08:35', 2, 'pending'),
(30, 78, '19:51:00', '2023-12-26', 'lkjhgfdszxcvbn', '2023-12-08 11:47:50', '2023-12-08 11:47:50', 4, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `tax_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `percentage` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `testimonial_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`testimonial_id`, `user_id`, `content`, `created_at`) VALUES
(1, 75, 'kjbknb', '2023-11-29 13:47:50'),
(2, 75, 'kjnohn', '2023-11-29 13:48:25'),
(3, 75, 'qwertyuiop[', '2023-11-30 01:26:39'),
(4, 75, 'hbbni', '2023-11-30 01:27:45'),
(5, 75, 'rgsthrtj', '2023-11-30 01:52:47'),
(6, 75, 'jgcjykyu', '2023-11-30 01:53:06'),
(7, 75, 'kjnn', '2023-11-30 01:53:33'),
(8, 75, 'asdfx,jhgfrewc', '2023-11-30 07:52:33'),
(9, 75, 'I would most likely go back here!', '2023-12-10 13:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_type` enum('customer','staff','admin') NOT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'inactive',
  `position` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `token`, `email`, `first_name`, `last_name`, `mobile`, `user_type`, `status`, `position`, `created_at`, `updated_at`) VALUES
(75, '$2y$10$YQiIR4OggO3tByjcqMr4DeS2erviZfwjM1UcIYQwsL4p07TuT4SJ2', 'uiGbdvRwWlEPp2nfLtmc7A8saZ43T0CNjDkQHzK6e5qxByoJrh', 'jrishh2902@gmail.com', 'Clarish', 'Jabonillo', '09637832223', 'admin', 'active', 'admin', '2023-12-08 03:27:34', '2023-12-13 22:11:30'),
(77, '$2y$10$Ix15IO1KU5QRf9behB5c8eBh9vdoLy0F7RJ5a4UyVwP5ZoKsP3I3G', '6B0g8M9s72hZUHA4mYDy3TbrpuQWKqOPnVGRcdlzIwEaoJSeXx', 'jrishh@gmail.com', 'Clrish', 'Jabonillo', '09637832223', 'customer', 'inactive', NULL, '2023-12-08 03:27:34', '2023-12-08 03:27:34'),
(78, '$2y$10$83zHCHYjgw.kOnV57xRQkeg9TZqV/4bxBhZSb4PTz8cdkEqcsGS4e', 'ocrmW4q3ztACZiUbeFIOYMEydwkXng1vP6QhKV2xGBT80JN5H9', 'j@gmail.com', 'Crish', 'Jabonillo', '09637832223', 'customer', 'inactive', NULL, '2023-12-08 03:27:34', '2023-12-08 03:27:34'),
(79, '$2y$10$aQdVPN/oU6IENnY8g2/QgeMSZ7BKoox0pGIQRpgmHk65Jl3BvkHjm', 'hDT8NXjg3J4SvuzMsRxHrUke0VBlAC1wnWf5EPbmcKGtIpoLi2', 'jrish@gmail.com', 'Clarish', 'Jabonillo', '09501525156', 'customer', 'inactive', NULL, '2023-12-08 03:27:34', '2023-12-08 03:27:34'),
(81, '$2y$10$6RHa6DWyowOkx2uaYcOZe.U3O/2blUo/8nVfFC6Ahu.hhMxU14vrq', 'EAiVom3qnXNWL18pUxCFKkOTa2JycHSGM4hg6DQdRtIYsf50Pu', 'clarish@gmail.com', 'Clarish', 'Jabonillo', '09637832223', 'staff', 'inactive', 'cashier', '2023-12-08 03:36:45', '2023-12-08 03:36:45'),
(90, '$2y$10$WOtFf6RpIsbss5Y0zluYfuZjYAuedx.Stt2mAsgaHN.t24p5QIZgW', '4gQcoC5Ir21HBKSPbdAMTiu6yD9vzENYmWh7R0VL8lwpFUfqZj', 'huhu@gmail.com', 'Clarish', 'Jabonillo', '09637832223', 'staff', 'inactive', 'chef', '2023-12-12 10:14:27', '2023-12-12 10:14:45'),
(91, '$2y$10$xbJCPxoqqyYkeM1LdbKAOePW6gQy/sZ.0Yo5y1cIt7AqWcGyJI/R6', 'IdM0AbKPoROSZ8zuYCsjW7fhHxVaB19eD6Gl3LXTtwy2giJcEq', 'jrishkkk@gmail.com', 'Clarish', 'Jabonillo', '09637832223', 'customer', 'inactive', NULL, '2023-12-14 00:13:27', '2023-12-14 00:13:27'),
(92, '$2y$10$riro5Gj9LBqDcBNtMn1LcuVXlhBRiYVv.lQrkPl4zf6BPfUgyRi4i', 'FMsSE2uCKcUik1rjDl5aywtAOQJmxLWbXvY0gV8eqI6GpdRh3B', 'clarishh@gmail.com', 'Clarish', 'Jabonillo', '09637832223', 'customer', 'inactive', NULL, '2023-12-20 03:42:59', '2023-12-20 03:42:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discount_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`orders_item_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `table_book`
--
ALTER TABLE `table_book`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `table_id` (`table_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`testimonial_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `audit_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discount_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `orders_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receipt_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_book`
--
ALTER TABLE `table_book`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `tax_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `testimonial_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`discount_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `order_items_ibfk_4` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `receipts_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Constraints for table `table_book`
--
ALTER TABLE `table_book`
  ADD CONSTRAINT `table_book_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `table_book_ibfk_2` FOREIGN KEY (`table_id`) REFERENCES `tables` (`table_id`);

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
