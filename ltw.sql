-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 07:18 AM
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
-- Database: `ltw`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street` text DEFAULT NULL,
  `FullAddress` text DEFAULT NULL,
  `princible` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `street`, `FullAddress`, `princible`) VALUES
(1, '123 Nguyễn Văn Cừ', 'Bien Hoa Dong Nai Viet Nam', 'Tỉnh Đồng Nai'),
(2, '45 Lê Văn Lương', '45 Lê Văn Lương, Phường Nhân Chính, Quận Thanh Xuân, Hà Nội, Việt Nam', 'Hà Nội'),
(3, '67 Trần Phú', '67 Trần Phú, Phường Hải Châu 2, Quận Hải Châu, Đà Nẵng, Việt Nam', 'Đà Nẵng'),
(4, '22 Lê Thánh Tôn', '22 Lê Thánh Tôn, Phường Bến Thành, Quận 1, TP.HCM, Việt Nam', 'Hồ Chí Minh'),
(5, '10 Nguyễn Chí Thanh', '10 Nguyễn Chí Thanh, Phường Láng Hạ, Quận Đống Đa, Hà Nội, Việt Nam', 'Hà Nội'),
(6, '88 Lạch Tray', '88 Lạch Tray, Phường Hải An, Quận Lê Chân, Hải Phòng, Việt Nam', 'Hải Phòng'),
(7, '32 Nguyễn Văn Cừ', '32 Nguyễn Văn Cừ, Phường An Bình, Thị xã Dĩ An, Bình Dương, Việt Nam', 'Bình Dương'),
(8, '56 Nguyễn Thái Học', '56 Nguyễn Thái Học, Phường An Nghiệp, Quận Ninh Kiều, Cần Thơ, Việt Nam', 'Cần Thơ'),
(9, '11 Trần Phú', '11 Trần Phú, Phường Hồng Gai, Quảng Ninh, Việt Nam', 'Quảng Ninh'),
(10, '78 Phạm Hùng', '78 Phạm Hùng, Phường Mỹ Đình 1, Quận Nam Từ Liêm, Hà Nội, Việt Nam', 'Hà Nội');

-- --------------------------------------------------------

--
-- Table structure for table `asigning_role`
--

CREATE TABLE `asigning_role` (
  `permissionID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asigning_role`
--

INSERT INTO `asigning_role` (`permissionID`, `roleID`) VALUES
(1, 2),
(1, 4),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(4, 4),
(5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cateName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cateName`) VALUES
(1, 'Kệ phòng khách'),
(2, 'Giường'),
(3, 'Phòng ăn'),
(4, 'Phòng khách'),
(5, 'Ghế bar'),
(6, 'Armchair'),
(7, 'Bàn bên'),
(8, 'Bàn nước'),
(9, 'Ghế dài & đôn'),
(10, 'Đèn trang trí'),
(11, 'Đèn'),
(12, 'Đồng hồ'),
(13, 'Phòng ngủ'),
(14, 'Tủ áo'),
(15, 'Bình trang trí'),
(16, 'Hàng trang trí'),
(17, 'Bàn làm việc');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_products`
--

CREATE TABLE `favourite_products` (
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourite_products`
--

INSERT INTO `favourite_products` (`productID`, `userID`) VALUES
(2, 1),
(6, 1),
(7, 1),
(101, 1),
(102, 1),
(106, 1),
(110, 1),
(103, 2),
(104, 2),
(105, 3),
(106, 3),
(107, 4),
(108, 4),
(109, 5),
(110, 5),
(111, 6),
(112, 6),
(113, 7),
(114, 7),
(115, 8),
(116, 8),
(117, 9),
(118, 9),
(119, 10),
(120, 10),
(1, 121),
(3, 121),
(5, 121),
(6, 121),
(7, 121),
(8, 121),
(10, 121),
(11, 121),
(12, 121),
(120, 121);

-- --------------------------------------------------------

--
-- Table structure for table `having_product`
--

CREATE TABLE `having_product` (
  `warehouseID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `having_product`
--

INSERT INTO `having_product` (`warehouseID`, `productID`, `amount`) VALUES
(1, 1, 2),
(1, 2, 4),
(1, 3, 42),
(1, 4, 64),
(1, 5, 4),
(1, 6, 7),
(1, 7, 32),
(1, 8, 32),
(1, 9, 2),
(1, 10, 6),
(1, 11, 25),
(1, 12, 39),
(1, 13, 62),
(1, 14, 57),
(1, 15, 17),
(1, 16, 37),
(1, 17, 38),
(1, 18, 37),
(1, 19, 51),
(1, 20, 40),
(1, 21, 8),
(1, 22, 49),
(1, 23, 21),
(1, 24, 52),
(1, 25, 59),
(1, 26, 0),
(1, 27, 9),
(1, 28, 35),
(1, 29, 36),
(1, 30, 56),
(1, 31, 58),
(1, 32, 2),
(1, 33, 61),
(1, 34, 39),
(1, 35, 7),
(1, 36, 36),
(1, 37, 46),
(1, 38, 19),
(1, 39, 55),
(1, 40, 27),
(1, 41, 5),
(1, 42, 63),
(1, 43, 13),
(1, 44, 6),
(1, 45, 58),
(1, 46, 7),
(1, 47, 30),
(1, 48, 42),
(1, 49, 59),
(1, 50, 9),
(1, 51, 54),
(1, 52, 4),
(1, 53, 33),
(1, 54, 15),
(1, 55, 62),
(1, 56, 55),
(1, 57, 64),
(1, 58, 21),
(1, 59, 15),
(1, 60, 41),
(1, 61, 22),
(1, 62, 3),
(1, 63, 60),
(1, 64, 59),
(1, 65, 65),
(1, 66, 21),
(1, 67, 12),
(1, 68, 20),
(1, 69, 46),
(1, 70, 2),
(1, 71, 25),
(1, 72, 3),
(1, 73, 57),
(1, 74, 7),
(1, 75, 44),
(1, 76, 10),
(1, 77, 53),
(1, 78, 35),
(1, 79, 65),
(1, 80, 57),
(1, 81, 30),
(1, 82, 35),
(1, 83, 25),
(1, 84, 28),
(1, 85, 0),
(1, 86, 46),
(1, 87, 55),
(1, 88, 29),
(1, 89, 29),
(1, 90, 27),
(1, 91, 47),
(1, 92, 42),
(1, 93, 37),
(1, 94, 37),
(1, 95, 58),
(1, 96, 58),
(1, 97, 24),
(1, 98, 55),
(1, 99, 7),
(1, 100, 19),
(1, 101, 38),
(1, 102, 36),
(1, 103, 34),
(1, 104, 16),
(1, 105, 14),
(1, 106, 54),
(1, 107, 18),
(1, 108, 30),
(1, 109, 14),
(1, 110, 5),
(1, 111, 44),
(1, 112, 12),
(1, 113, 4),
(1, 114, 12),
(1, 115, 57),
(1, 116, 52),
(1, 117, 6),
(1, 118, 14),
(1, 119, 30),
(1, 120, 10),
(1, 121, 61),
(1, 122, 7),
(1, 123, 56),
(1, 124, 44),
(1, 125, 48),
(1, 126, 37),
(1, 127, 37),
(1, 128, 47),
(1, 129, 5),
(1, 130, 14),
(1, 131, 30),
(1, 132, 24),
(1, 133, 56),
(1, 134, 41),
(1, 135, 7),
(1, 136, 38),
(1, 137, 26),
(1, 138, 44),
(1, 139, 55),
(1, 140, 39),
(1, 141, 43),
(1, 142, 43),
(1, 143, 60),
(1, 144, 56),
(1, 145, 12),
(1, 146, 41),
(1, 147, 49),
(1, 148, 47),
(1, 149, 23),
(1, 150, 64),
(1, 151, 43),
(1, 152, 20),
(2, 1, 45),
(2, 2, 26),
(2, 3, 20),
(2, 4, 37),
(2, 5, 36),
(2, 6, 49),
(2, 7, 2),
(2, 8, 11),
(2, 9, 18),
(2, 10, 24),
(2, 11, 13),
(2, 12, 41),
(2, 13, 27),
(2, 14, 29),
(2, 15, 14),
(2, 16, 26),
(2, 17, 43),
(2, 18, 49),
(2, 19, 38),
(2, 20, 32),
(2, 21, 2),
(2, 22, 7),
(2, 23, 4),
(2, 24, 0),
(2, 25, 27),
(2, 26, 17),
(2, 27, 14),
(2, 28, 26),
(2, 29, 1),
(2, 30, 11),
(2, 31, 15),
(2, 32, 41),
(2, 33, 6),
(2, 34, 14),
(2, 35, 9),
(2, 36, 19),
(2, 37, 30),
(2, 38, 22),
(2, 39, 29),
(2, 40, 28),
(2, 41, 15),
(2, 42, 7),
(2, 43, 47),
(2, 44, 39),
(2, 45, 30),
(2, 46, 22),
(2, 47, 36),
(2, 48, 3),
(2, 49, 1),
(2, 50, 29),
(2, 51, 41),
(2, 52, 16),
(2, 53, 9),
(2, 54, 35),
(2, 55, 15),
(2, 56, 15),
(2, 57, 31),
(2, 58, 49),
(2, 59, 25),
(2, 60, 2),
(2, 61, 16),
(2, 62, 31),
(2, 63, 32),
(2, 64, 17),
(2, 65, 9),
(2, 66, 44),
(2, 67, 28),
(2, 68, 17),
(2, 69, 22),
(2, 70, 2),
(2, 71, 10),
(2, 72, 7),
(2, 73, 10),
(2, 74, 0),
(2, 75, 8),
(2, 76, 24),
(2, 77, 36),
(2, 78, 22),
(2, 79, 17),
(2, 80, 25),
(2, 81, 3),
(2, 82, 45),
(2, 83, 24),
(2, 84, 1),
(2, 85, 1),
(2, 86, 29),
(2, 87, 30),
(2, 88, 36),
(2, 89, 8),
(2, 90, 25),
(2, 91, 0),
(2, 92, 39),
(2, 93, 16),
(2, 94, 35),
(2, 95, 0),
(2, 96, 43),
(2, 97, 49),
(2, 98, 9),
(2, 99, 1),
(2, 100, 27),
(2, 101, 13),
(2, 102, 46),
(2, 103, 16),
(2, 104, 41),
(2, 105, 14),
(2, 106, 0),
(2, 107, 36),
(2, 108, 29),
(2, 109, 13),
(2, 110, 4),
(2, 111, 40),
(2, 112, 27),
(2, 113, 29),
(2, 114, 31),
(2, 115, 27),
(2, 116, 41),
(2, 117, 38),
(2, 118, 24),
(2, 119, 9),
(2, 120, 1),
(2, 121, 46),
(2, 122, 35),
(2, 123, 9),
(2, 124, 2),
(2, 125, 39),
(2, 126, 6),
(2, 127, 48),
(2, 128, 40),
(2, 129, 25),
(2, 130, 40),
(2, 131, 14),
(2, 132, 30),
(2, 133, 0),
(2, 134, 47),
(2, 135, 10),
(2, 136, 35),
(2, 137, 36),
(2, 138, 44),
(2, 139, 26),
(2, 140, 37),
(2, 141, 49),
(2, 142, 18),
(2, 143, 32),
(2, 144, 49),
(2, 145, 2),
(2, 146, 17),
(2, 147, 40),
(2, 148, 20),
(2, 149, 8),
(2, 150, 16),
(2, 151, 33),
(2, 152, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  `shippingStatus` enum('completed','packaging','cancelled','delivering') NOT NULL,
  `createDate` datetime NOT NULL,
  `sdt` varchar(11) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `signature` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userID`, `paymentID`, `shippingStatus`, `createDate`, `sdt`, `promotion_id`, `signature`) VALUES
(1, 1, 5, 'packaging', '2024-12-10 09:00:00', '1234567890', NULL, 'BHi1EBSIXwXfPDy2R6msfvFsjpqhd82HQHgroxuJvIHseLmxmPaNaNtvbMJ44comk7BvGNtzoYTrHl6MJHR3FZ71FZBm1jbaj0caq5XjogPyUVXVcaVA60AwkWgmnAHVPahaGqeuoEbxldz8+kM8NhzLtQoUk/3IQB6Zn19e0dYW/3iPpVCU2+275evEa7+d3ai6pc15GuoCHSFJv03DoKENxzc7OHs2lJXn797X8hfYYOx7sUsOtQ+2GZki0c4ig45B1wg/WkSy+3RqoyDbunXafGqxYd7L4RGSEqDiyxFoDOcEvd21X/DyKBrpYeDvmk40pELxcpinoEN4bYo='),
(2, 2, 3, 'packaging', '2024-12-10 10:30:00', '0987654321', NULL, NULL),
(3, 3, 7, 'delivering', '2024-12-10 11:00:00', '1122334455', NULL, NULL),
(4, 4, 1, 'cancelled', '2024-12-10 12:15:00', '6677889900', NULL, NULL),
(5, 5, 4, 'completed', '2024-12-10 13:00:00', '5566778899', NULL, NULL),
(6, 6, 6, 'packaging', '2024-12-10 14:45:00', '4433221100', NULL, NULL),
(7, 7, 9, 'delivering', '2024-12-10 15:20:00', '3344556677', NULL, NULL),
(8, 8, 8, 'completed', '2024-12-10 16:10:00', '2233445566', NULL, NULL),
(9, 9, 2, 'packaging', '2024-12-10 17:35:00', '9988776655', NULL, NULL),
(10, 10, 10, 'cancelled', '2024-12-10 18:00:00', '3344556677', NULL, NULL),
(21, 1, 1, 'packaging', '2025-01-16 18:03:28', NULL, NULL, NULL),
(22, 1, 1, 'packaging', '2025-01-16 18:04:21', NULL, NULL, NULL),
(23, 1, 1, 'packaging', '2025-01-16 18:09:36', NULL, NULL, NULL),
(24, 1, 1, 'packaging', '2025-01-16 18:11:11', NULL, NULL, NULL),
(25, 1, 1, 'packaging', '2025-01-16 18:12:20', NULL, NULL, NULL),
(26, 1, 1, 'packaging', '2025-01-16 18:14:30', NULL, NULL, NULL),
(27, 1, 1, 'packaging', '2025-01-16 18:16:20', NULL, NULL, NULL),
(28, 1, 1, 'packaging', '2025-01-16 18:17:59', NULL, NULL, NULL),
(29, 1, 1, 'packaging', '2025-01-16 18:20:27', NULL, NULL, NULL),
(30, 1, 1, 'packaging', '2025-01-16 18:21:56', NULL, NULL, NULL),
(31, 1, 1, 'packaging', '2025-01-16 18:24:36', NULL, NULL, NULL),
(32, 1, 1, 'packaging', '2025-01-16 18:27:48', NULL, NULL, NULL),
(33, 1, 1, 'completed', '2025-01-16 18:32:55', NULL, NULL, NULL),
(34, 1, 1, 'packaging', '2025-01-16 18:34:28', NULL, NULL, NULL),
(35, 1, 1, 'packaging', '2025-01-16 18:34:35', NULL, NULL, NULL),
(36, 121, 1, 'packaging', '2025-01-16 22:48:10', NULL, NULL, NULL),
(37, 1, 1, 'packaging', '2025-05-17 15:41:46', NULL, NULL, NULL),
(38, 1, 1, 'packaging', '2025-05-17 15:42:08', NULL, NULL, NULL),
(39, 1, 1, 'packaging', '2025-05-17 15:45:15', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `orderID`, `productID`, `amount`) VALUES
(1, 1, 45, 3),
(2, 1, 78, 2),
(3, 2, 12, 1),
(4, 2, 89, 4),
(5, 2, 100, 3),
(6, 3, 50, 5),
(7, 4, 33, 2),
(8, 4, 115, 1),
(9, 5, 72, 4),
(10, 5, 134, 3),
(11, 6, 29, 5),
(12, 7, 84, 2),
(13, 7, 42, 3),
(14, 7, 18, 4),
(15, 8, 90, 1),
(16, 9, 64, 3),
(17, 9, 21, 5),
(18, 10, 53, 2),
(19, 10, 137, 1),
(20, 10, 98, 4),
(41, 21, 2, 2),
(42, 23, 2, 1),
(43, 23, 3, 1),
(44, 24, 2, 1),
(45, 25, 2, 1),
(46, 26, 2, 1),
(47, 27, 2, 1),
(48, 28, 6, 1),
(49, 29, 1, 1),
(50, 30, 2, 1),
(51, 31, 2, 1),
(52, 32, 2, 1),
(53, 33, 2, 1),
(54, 33, 6, 1),
(55, 34, 2, 1),
(56, 36, 2, 1),
(57, 37, 1, 1),
(58, 38, 1, 1),
(59, 39, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `own_address`
--

CREATE TABLE `own_address` (
  `userID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `own_address`
--

INSERT INTO `own_address` (`userID`, `addressID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `method` enum('cash','bank') NOT NULL,
  `statuss` enum('pending','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `method`, `statuss`) VALUES
(1, 'cash', 'completed'),
(2, 'bank', 'completed'),
(3, 'cash', 'completed'),
(4, 'bank', 'pending'),
(5, 'cash', 'pending'),
(6, 'bank', 'completed'),
(7, 'cash', 'pending'),
(8, 'bank', 'cancelled'),
(9, 'cash', 'completed'),
(10, 'bank', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `permissionName` varchar(40) NOT NULL,
  `createDate` datetime NOT NULL,
  `lastUpdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `permissionName`, `createDate`, `lastUpdate`) VALUES
(1, 'User Management', '2023-03-04 08:30:00', '2023-12-06'),
(2, 'Order Management', '2023-03-04 08:30:00', '2023-12-06'),
(3, 'Product Management', '2023-03-04 08:30:00', '2023-12-06'),
(4, 'Reporting', '2023-03-04 08:30:00', '2023-12-06'),
(5, 'Supreme', '2023-03-04 08:30:00', '2023-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `proName` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `cateID` int(11) NOT NULL,
  `atributeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `proName`, `price`, `description`, `thumb`, `created_at`, `cateID`, `atributeID`) VALUES
(1, 'Kệ 3 tầng Gold', 24480000, 'undefined', 'public/images/all-products/1.jpg', '2025-01-16 17:50:51', 1, 1),
(2, 'Tủ trang trí Valente', 36900000, 'undefined', 'public/images/all-products/2.jpg', '2025-01-16 17:50:51', 1, 2),
(3, 'Kệ Coastal', 15900000, 'Coastal mang đậm chất Việt khi khéo léo dung hòa được những nét đẹp lấy cảm hứng từ miền duyên hải nước ta với các vật liệu cao cấp', 'public/images/all-products/3.jpg', '2025-01-16 17:50:51', 1, 3),
(4, 'Kệ sách Rap', 9640000, 'undefined', 'public/images/all-products/4.jpg', '2025-01-16 17:50:51', 1, 4),
(5, 'Tủ trưng bày 2 hộc kéo RN', 34360000, 'undefined', 'public/images/all-products/5.jpg', '2025-01-16 17:50:51', 1, 5),
(6, 'Kệ trang trí Eden', 21120000, 'undefined', 'public/images/all-products/6.jpg', '2025-01-16 17:50:51', 1, 6),
(7, 'Kệ kim loại đen 6 tầng', 16390000, 'undefined', 'public/images/all-products/7.jpg', '2025-01-16 17:50:51', 1, 7),
(8, 'Kệ Rack 3 tầng', 23630000, 'undefined', 'public/images/all-products/8.jpg', '2025-01-16 17:50:51', 1, 8),
(9, 'Kệ Rack 3 tầng màu đen', 8670000, 'undefined', 'public/images/all-products/9.jpg', '2025-01-16 17:50:51', 1, 9),
(10, 'Kệ 4 tầng', 18230000, 'undefined', 'public/images/all-products/10.jpg', '2025-01-16 17:50:51', 1, 10),
(11, 'Giường Coastal vàng 1m6', 28900000, 'Giường ngủ Coastal mang đến cảm giác như đang nằm trên bãi biển dài bình yên', 'public/images/all-products/11.jpg', '2025-01-16 17:50:51', 2, 11),
(12, 'Giường Coastal vàng 1m8', 31900000, 'Giường ngủ Coastal mang đến cảm giác như đang nằm trên bãi biển dài bình yên', 'public/images/all-products/12.jpg', '2025-01-16 17:50:51', 2, 12),
(13, 'Giường Coastal xanh 1m6', 28900000, 'Giường ngủ Coastal mang đến cảm giác như đang nằm trên bãi biển dài bình yên', 'public/images/all-products/13.jpg', '2025-01-16 17:50:51', 2, 13),
(14, 'Giường Leman 1m8 vải VACT10370', 33650000, 'undefined', 'public/images/all-products/14.jpg', '2025-01-16 17:50:51', 2, 14),
(15, 'Giường Leman 1m8 vải VACT11303', 33650000, 'undefined', 'public/images/all-products/15.jpg', '2025-01-16 17:50:51', 2, 15),
(16, 'Giường Leman 1m8 vải VACT4328', 33650000, 'undefined', 'public/images/all-products/16.jpg', '2025-01-16 17:50:51', 2, 16),
(17, 'Giường Leman 1m8 vải VACT7459', 33650000, 'undefined', 'public/images/all-products/17.jpg', '2025-01-16 17:50:51', 2, 17),
(18, 'Giường Leman 1m8 vải VACT7464', 33650000, 'undefined', 'public/images/all-products/18.jpg', '2025-01-16 17:50:51', 2, 18),
(19, 'Giường Leman 1m8 vải VACT8324', 33650000, 'undefined', 'public/images/all-products/19.jpg', '2025-01-16 17:50:52', 2, 19),
(20, 'Giường Miami 1m6 vải VADELA165', 19300000, 'undefined', 'public/images/all-products/20.jpg', '2025-01-16 17:50:52', 2, 20),
(21, 'Tủ ly cao Lake CS6076-4 màu smoke', 179900000, 'undefined', 'public/images/all-products/21.jpg', '2025-01-16 17:50:52', 3, 21),
(22, 'Tủ Ly Jazz', 25400000, 'Tủ ly Jazz được ghép từ những thanh gỗ sồi già tự nhiên. Bề mặt đặc trưng với những đường nứt tét gỗ tự nhiên được xử lý khéo léo', 'public/images/all-products/22.jpg', '2025-01-16 17:50:52', 3, 22),
(23, 'Tủ thấp Barbier Walnut', 30670000, 'undefined', 'public/images/all-products/23.jpg', '2025-01-16 17:50:52', 4, 23),
(24, 'Tủ thấp Fence', 35900000, 'undefined', 'public/images/all-products/24.jpg', '2025-01-16 17:50:52', 3, 24),
(25, 'Tủ Buffet Osaka', 29360000, 'undefined', 'public/images/all-products/25.jpg', '2025-01-16 17:50:52', 3, 25),
(26, 'Tủ ly Bridge gỗ nâu', 59900000, 'Tủ ly Bridge được làm bằng chất gỗ sồi đặc', 'public/images/all-products/26.jpg', '2025-01-16 17:50:52', 3, 26),
(27, 'Tủ ly Bridge gỗ màu Tự nhiên', 59900000, 'Tủ ly Bridge được làm bằng chất gỗ sồi đặc', 'public/images/all-products/27.jpg', '2025-01-16 17:50:52', 3, 27),
(28, 'Tủ Ly Terrazzo 85152K', 76490000, 'undefined', 'public/images/all-products/28.jpg', '2025-01-16 17:50:52', 4, 28),
(29, 'Tủ ly Miami 209012', 15200000, 'undefined', 'public/images/all-products/29.jpg', '2025-01-16 17:50:52', 3, 29),
(30, 'Tủ Ly Lake CS6076 1 màu Smoke', 140960000, 'Tủ Ly Lake CS6076 1 màu Smoke được sản xuất theo chân kim loại sơn được làm bằng gỗ khung MDF cao cấp sơn Smoke', 'public/images/all-products/30.jpg', '2025-01-16 17:50:52', 3, 30),
(31, 'Ghế Bar Bridge màu nâu Da Cognac', 29950000, 'undefined', 'public/images/all-products/31.jpg', '2025-01-16 17:50:52', 5, 31),
(32, 'Ghế bar Hojas màu beige H99xW50', 14200000, 'undefined', 'public/images/all-products/32.jpg', '2025-01-16 17:50:52', 5, 32),
(33, 'Ghế bar Jenny – 96364J', 9720000, 'undefined', 'public/images/all-products/33.jpg', '2025-01-16 17:50:52', 5, 33),
(34, 'Ghế bar Monaco', 9040000, 'undefined', 'public/images/all-products/34.jpg', '2025-01-16 17:50:52', 5, 34),
(35, 'Ghế bar xoay Cognac', 5490000, 'Ghế quầy bar Cognac được nhập khẩu từ Pháp có màu sắc sang trọng. Sản phẩm được làm bằng khung kim loại chắc chắn bọc lớp da nâu tự nhiên cho vẻ đẹp hoàn hảo.', 'public/images/all-products/35.jpg', '2025-01-16 17:50:52', 5, 35),
(36, 'Ghế bar Fifties da màu cognac', 20110000, 'Fifties thu hẹp khoảng cách giữa thiết kế và sự thoải mái một cách hoàn hảo và tạo nên sự cân bằng lý tưởng giữa vẻ đẹp hiện đại và nét cổ điển. Phần đệm thêm được bảo vệ bằng đai đàn hồi hiệu suất cao cho cảm giác cực kỳ thoải mái và dễ chịu', 'public/images/all-products/36.jpg', '2025-01-16 17:50:52', 5, 36),
(37, 'Ghế bar Fifties da màu mud brown', 19539000, 'Fifties thu hẹp khoảng cách giữa thiết kế và sự thoải mái một cách hoàn hảo và tạo nên sự cân bằng lý tưởng giữa vẻ đẹp hiện đại và nét cổ điển. Phần đệm thêm được bảo vệ bằng đai đàn hồi hiệu suất cao cho cảm giác cực kỳ thoải mái và dễ chịu', 'public/images/all-products/37.jpg', '2025-01-16 17:50:52', 5, 37),
(38, 'Ghế Bar Aida da màu taupe D03', 10800000, 'Ghế quầy bar Aida nhập khẩu từ Ý có màu sắc sang trọng. Sản phẩm được thiết kế đơn giản nhưng không kém phần tinh tế', 'public/images/all-products/38.jpg', '2025-01-16 17:50:52', 5, 38),
(39, 'Ghế Bar Boheme da taupe', 9730000, 'Ghế quầy bar Boheme nhập khẩu từ Ý có màu sắc sang trọng. Sản phẩm được thiết kế đơn giản nhưng không kém phần tinh tế', 'public/images/all-products/39.jpg', '2025-01-16 17:50:52', 5, 39),
(40, 'Ghế bar Boheme da Coffee', 9730000, 'Ghế quầy bar Boheme nhập khẩu từ Ý có màu sắc sang trọng. Sản phẩm được thiết kế đơn giản nhưng không kém phần tinh tế', 'public/images/all-products/40.jpg', '2025-01-16 17:50:52', 5, 40),
(41, 'Sofa 2 chỗ Mây mới', 19900000, 'undefined', 'public/images/all-products/41.jpg', '2025-01-16 17:50:52', 4, 41),
(42, 'Sofa 2 chỗ Ogami vải vact10499', 12900000, 'undefined', 'public/images/all-products/42.jpg', '2025-01-16 17:50:52', 4, 42),
(43, 'Sofa 2 chỗ Ogami vải vact10504', 12900000, 'undefined', 'public/images/all-products/43.jpg', '2025-01-16 17:50:52', 4, 43),
(44, 'Sofa 3 chỗ Orientale da beige R5', 135750000, 'undefined', 'public/images/all-products/44.jpg', '2025-01-16 17:50:52', 4, 44),
(45, 'Sofa 3 chỗ vải Vegas', 25900000, 'undefined', 'public/images/all-products/45.jpg', '2025-01-16 17:50:52', 4, 45),
(46, 'Sofa Bolero 3 chỗ + Đôn M3 vải xám MB4010', 25900000, 'undefined', 'public/images/all-products/46.jpg', '2025-01-16 17:50:52', 4, 46),
(47, 'Sofa Bolero 3 chỗ + Đôn M3 vải xanh MB408', 25900000, 'undefined', 'public/images/all-products/47.jpg', '2025-01-16 17:50:52', 4, 47),
(48, 'Sofa Bolero 3 chỗ + Đôn vải xám 25', 25900000, 'Sofa Bolero 3 chỗ và Đôn vải xám 25 sở hữu phần chân kim loại được sơn đen và phần nệm được bọc vải cao cấp màu xám. Kiểu dáng thiết kế của sofa Bolero tuy đơn giản nhưng lại mang đến sự tinh tế cho không gian phòng khách còn là sản phẩm sofa đáng sở hữu bởi thiết kế và trải nghiệm sử dụng.', 'public/images/all-products/48.jpg', '2025-01-16 17:50:52', 4, 48),
(49, 'Sofa da 3 chỗ Blum', 67230000, 'undefined', 'public/images/all-products/49.jpg', '2025-01-16 17:50:52', 4, 49),
(50, 'Sofa giường đơn Bolero VACT 3444', 13260000, 'undefined', 'public/images/all-products/50.jpg', '2025-01-16 17:50:52', 4, 50),
(51, 'Armchair Doulton vintage', 28500000, 'undefined', 'public/images/all-products/51.jpg', '2025-01-16 17:50:52', 6, 51),
(52, 'Armchair Hùng King + Gối VACT3231', 13900000, 'undefined', 'public/images/all-products/52.jpg', '2025-01-16 17:50:52', 6, 52),
(53, 'Armchair Mây mới', 13900000, 'undefined', 'public/images/all-products/53.jpg', '2025-01-16 17:50:52', 6, 53),
(54, 'Armchair Ogami vải vact10499', 8900000, 'undefined', 'public/images/all-products/54.jpg', '2025-01-16 17:50:52', 6, 54),
(55, 'Armchair Ogami vải vact10504', 8900000, 'undefined', 'public/images/all-products/55.jpg', '2025-01-16 17:50:52', 6, 55),
(56, 'Armchair Oriental vact10389', 15900000, 'undefined', 'public/images/all-products/56.jpg', '2025-01-16 17:50:52', 6, 56),
(57, 'Armchair Saka P100 vải vact10498', 14630000, 'undefined', 'public/images/all-products/57.jpg', '2025-01-16 17:50:52', 6, 57),
(58, 'Armchair vải Dark SF044VF.I', 32900000, 'undefined', 'public/images/all-products/58.jpg', '2025-01-16 17:50:52', 6, 58),
(59, 'Armchair vải màu nâu đỏ SF044TER.I', 32900000, 'undefined', 'public/images/all-products/59.jpg', '2025-01-16 17:50:52', 6, 59),
(60, 'Armchair vải màu vàng SF044J.IDS', 32900000, 'undefined', 'public/images/all-products/60.jpg', '2025-01-16 17:50:52', 6, 60),
(61, 'Bàn bên 3C-02', 7990000, 'undefined', 'public/images/all-products/61.jpg', '2025-01-16 17:50:52', 7, 61),
(62, 'Bàn bên Bottiglia màu xanh 50cm', 15400000, 'undefined', 'public/images/all-products/62.jpg', '2025-01-16 17:50:52', 7, 62),
(63, 'Bàn bên butterfly ginkgo 411510 MCA', 95600200, 'undefined', 'public/images/all-products/63.jpg', '2025-01-16 17:50:52', 7, 63),
(64, 'Bàn bên Endless Vegas màu cam', 14900000, 'undefined', 'public/images/all-products/64.jpg', '2025-01-16 17:50:52', 7, 64),
(65, 'Bàn bên Endless Vegas màu xanh', 12200000, 'undefined', 'public/images/all-products/65.jpg', '2025-01-16 17:50:52', 7, 65),
(66, 'Bàn bên Fence', 10900000, 'undefined', 'public/images/all-products/66.jpg', '2025-01-16 17:50:52', 7, 66),
(67, 'Bàn bên Hùng King', 5900000, 'undefined', 'public/images/all-products/67.jpg', '2025-01-16 17:50:52', 7, 67),
(68, 'Bàn bên line Bridge màu nâu', 15320000, 'undefined', 'public/images/all-products/68.jpg', '2025-01-16 17:50:52', 7, 68),
(69, 'Bàn bên Line Orange MVT46O.I', 10590000, 'undefined', 'public/images/all-products/69.jpg', '2025-01-16 17:50:52', 7, 69),
(70, 'Bàn bên Line Taupe MVT46T.I', 10600000, 'undefined', 'public/images/all-products/70.jpg', '2025-01-16 17:50:52', 7, 70),
(71, 'Bàn nước Dura', 14900000, 'undefined', 'public/images/all-products/71.jpg', '2025-01-16 17:50:52', 8, 71),
(72, 'Bàn nước Fence', 27500000, 'undefined', 'public/images/all-products/72.jpg', '2025-01-16 17:50:52', 8, 72),
(73, 'Bàn nước Hà Nội', 9900000, 'undefined', 'public/images/all-products/73.jpg', '2025-01-16 17:50:52', 8, 73),
(74, 'Bàn nước Hùng King', 16500000, 'undefined', 'public/images/all-products/74.jpg', '2025-01-16 17:50:52', 8, 74),
(75, 'Bàn nước Layered', 21500000, 'undefined', 'public/images/all-products/75.jpg', '2025-01-16 17:50:52', 8, 75),
(76, 'Bàn nước mặt đá Ogami', 14900000, 'undefined', 'public/images/all-products/76.jpg', '2025-01-16 17:50:52', 8, 76),
(77, 'Bàn nước Poppy mẫu 2 – màu smoke', 11300000, 'undefined', 'public/images/all-products/77.jpg', '2025-01-16 17:50:52', 8, 77),
(78, 'Bàn nước tròn Mây mới', 7900000, 'undefined', 'public/images/all-products/78.jpg', '2025-01-16 17:50:52', 8, 78),
(79, 'Bàn nước tròn Sài Gòn 2 tầng', 9900000, 'undefined', 'public/images/all-products/79.jpg', '2025-01-16 17:50:52', 8, 79),
(80, 'Bàn nước tròn Valente', 19900000, 'undefined', 'public/images/all-products/80.jpg', '2025-01-16 17:50:52', 8, 80),
(81, 'Đôn Orientale da beige R5', 28860000, 'undefined', 'public/images/all-products/81.jpg', '2025-01-16 17:50:52', 9, 81),
(82, 'Đôn sofa Sài Gòn', 3999000, 'undefined', 'public/images/all-products/82.jpg', '2025-01-16 17:50:52', 9, 82),
(83, 'Ghế dài Deria', 11890000, 'undefined', 'public/images/all-products/83.jpg', '2025-01-16 17:50:52', 9, 83),
(84, 'Ghế dài Mây mới', 8500000, 'undefined', 'public/images/all-products/84.jpg', '2025-01-16 17:50:52', 9, 84),
(85, 'Ghế dài Velvet', 19900000, 'undefined', 'public/images/all-products/85.jpg', '2025-01-16 17:50:52', 9, 85),
(86, 'Bench Cabo vải KD1085-11 PMA491015 F1', 11500000, 'Ghế Bench Cabo với khung chân được làm bằng kim loại kết hợp với 1 thanh ngang bằng gỗ walnut', 'public/images/all-products/86.jpg', '2025-01-16 17:50:52', 9, 86),
(87, 'Bench Cabo vải MB2041-23', 11500000, 'Ghế Bench Cabo với khung chân được làm bằng kim loại kết hợp với 1 thanh ngang bằng gỗ walnut', 'public/images/all-products/87.jpg', '2025-01-16 17:50:52', 9, 87),
(88, 'Đôn Atollo vải venice sand', 11300000, 'undefined', 'public/images/all-products/88.jpg', '2025-01-16 17:50:52', 9, 88),
(89, 'Bench Cabo vải MB2041-9', 11500000, 'Ghế Bench Cabo với khung chân được làm bằng kim loại kết hợp với 1 thanh ngang bằng gỗ walnut', 'public/images/all-products/89.jpg', '2025-01-16 17:50:52', 9, 89),
(90, 'Đôn Cherry jungle tiger', 5590000, 'undefined', 'public/images/all-products/90.jpg', '2025-01-16 17:50:52', 9, 90),
(91, 'Đèn bàn Gianfranco Gunmetal', 32880000, 'undefined', 'public/images/all-products/91.jpg', '2025-01-16 17:50:52', 10, 91),
(92, 'Đèn bàn Gianfranco Vintage', 32880000, 'undefined', 'public/images/all-products/92.jpg', '2025-01-16 17:50:52', 10, 92),
(93, 'Đèn bàn Groove Ceramic', 8490000, 'undefined', 'public/images/all-products/93.jpg', '2025-01-16 17:50:52', 10, 93),
(94, 'Đèn bàn Jeff', 4980000, 'undefined', 'public/images/all-products/94.jpg', '2025-01-16 17:50:52', 10, 94),
(95, 'Đèn bàn Mayson', 10500000, 'undefined', 'public/images/all-products/95.jpg', '2025-01-16 17:50:52', 10, 95),
(96, 'Đèn sàn Gol Met/Glass', 13190000, 'undefined', 'public/images/all-products/96.jpg', '2025-01-16 17:50:52', 10, 96),
(97, 'Đèn sàn Mayson', 19400000, 'undefined', 'public/images/all-products/97.jpg', '2025-01-16 17:50:52', 10, 97),
(98, 'Đèn trần Goldn Goblet Quatro', 17000000, 'undefined', 'public/images/all-products/98.jpg', '2025-01-16 17:50:52', 10, 98),
(99, 'Đèn trần Universe Chrome', 19900000, 'undefined', 'public/images/all-products/99.jpg', '2025-01-16 17:50:52', 10, 99),
(100, 'Đèn bàn Float 5200110Z', 9490000, 'undefined', 'public/images/all-products/100.jpg', '2025-01-16 17:50:52', 11, 100),
(101, 'Đồng hồ bàn Alum/Granite', 670000, 'undefined', 'public/images/all-products/101.jpg', '2025-01-16 17:50:52', 12, 101),
(102, 'Đồng hồ bàn Nickel', 1390000, 'undefined', 'public/images/all-products/102.jpg', '2025-01-16 17:50:52', 12, 102),
(103, 'Đồng hồ bàn Steel/Alum', 880000, 'undefined', 'public/images/all-products/103.jpg', '2025-01-16 17:50:52', 12, 103),
(104, 'Đồng hồ bàn trang trí 17cm', 2580000, 'undefined', 'public/images/all-products/104.jpg', '2025-01-16 17:50:52', 12, 104),
(105, 'Đồng hồ bàn trang trí 21cm', 3900000, 'undefined', 'public/images/all-products/105.jpg', '2025-01-16 17:50:52', 12, 105),
(106, 'Đồng hồ Baxter S', 3900000, 'undefined', 'public/images/all-products/106.jpg', '2025-01-16 17:50:52', 12, 106),
(107, 'Đồng hồ cát 10 phút cam', 750000, 'undefined', 'public/images/all-products/107.jpg', '2025-01-16 17:50:52', 12, 107),
(108, 'Đồng hồ cát 10 phút hồng', 750000, 'undefined', 'public/images/all-products/108.jpg', '2025-01-16 17:50:52', 12, 108),
(109, 'Đồng hồ treo tường 58cm', 1400000, 'undefined', 'public/images/all-products/109.jpg', '2025-01-16 17:50:52', 12, 109),
(110, 'Đồng hồ treo tường Belt', 5360000, 'undefined', 'public/images/all-products/110.jpg', '2025-01-16 17:50:52', 12, 110),
(111, 'Tủ áo Acrylic', 32310000, 'undefined', 'public/images/all-products/111.jpg', '2025-01-16 17:50:52', 13, 111),
(112, 'Tủ áo Wabrobe 02', 273930000, 'undefined', 'public/images/all-products/112.jpg', '2025-01-16 17:50:52', 14, 112),
(113, 'Tủ áo hiện đại', 24010000, 'Mẫu tủ áo hiện đại của Nhà Xinh với thiết kế giản đơn', 'public/images/all-products/113.jpg', '2025-01-16 17:50:52', 14, 113),
(114, 'Tủ áo Maxine', 42420000, 'Tủ áo Maxine chứa đựng đầy đủ công năng tối ưu cho việc cất trữ quần áo bằng việc bố trí sắp xếp hợp lý các ngăn tủ. Những chi tiết về phụ kiện cao cấp giúp cho việc thao tác nhẹ nhàng. Bề ngoài', 'public/images/all-products/114.jpg', '2025-01-16 17:50:52', 13, 114),
(115, 'Bình Aila Turquoise', 12420000, 'undefined', 'public/images/all-products/115.jpg', '2025-01-16 17:50:52', 15, 115),
(116, 'Bình Aline đỏ XS 16x16x16 23102J', 660000, 'undefined', 'public/images/all-products/116.jpg', '2025-01-16 17:50:52', 15, 116),
(117, 'Bình Atelier Jaune H26 156603C', 1290000, 'undefined', 'public/images/all-products/117.jpg', '2025-01-16 17:50:52', 15, 117),
(118, 'Bình Bloom Green 820053Z', 1750000, 'undefined', 'public/images/all-products/118.jpg', '2025-01-16 17:50:52', 15, 118),
(119, 'Bình Bloom Ivory 820052Z', 1750000, 'undefined', 'public/images/all-products/119.jpg', '2025-01-16 17:50:52', 15, 119),
(120, 'Bình Bloom Mist Blue 820050Z', 1750000, 'undefined', 'public/images/all-products/120.jpg', '2025-01-16 17:50:52', 15, 120),
(121, 'Bình Brenda Granit màu đỏ 16803B', 450000, 'undefined', 'public/images/all-products/121.jpg', '2025-01-16 17:50:52', 15, 121),
(122, 'Bình Brenda Granit màu xanh 16823B', 450000, 'undefined', 'public/images/all-products/122.jpg', '2025-01-16 17:50:52', 15, 122),
(123, 'Bình Brenda Granit Sand 16813B', 450000, 'undefined', 'public/images/all-products/123.jpg', '2025-01-16 17:50:52', 15, 123),
(124, 'Bình Brut gris 157702C', 1350000, 'undefined', 'public/images/all-products/124.jpg', '2025-01-16 17:50:52', 15, 124),
(125, 'Gương Besty', 14900000, 'undefined', 'public/images/all-products/125.jpg', '2025-01-16 17:50:52', 16, 125),
(126, 'Gương Bords', 9640000, 'undefined', 'public/images/all-products/126.jpg', '2025-01-16 17:50:52', 16, 126),
(127, 'Gương Curvy', 14290000, 'undefined', 'public/images/all-products/127.jpg', '2025-01-16 17:50:52', 16, 127),
(128, 'Gương đứng Curve 82969K', 23960000, 'undefined', 'public/images/all-products/128.jpg', '2025-01-16 17:50:53', 16, 128),
(129, 'Gương Fiona Vintage Brass 113855E', 69809300, 'undefined', 'public/images/all-products/129.jpg', '2025-01-16 17:50:53', 16, 129),
(130, 'Gương Goteborg', 9000000, 'undefined', 'public/images/all-products/130.jpg', '2025-01-16 17:50:53', 16, 130),
(131, 'Gương Graziella', 9100000, 'undefined', 'public/images/all-products/131.jpg', '2025-01-16 17:50:53', 16, 131),
(132, 'Gương Gynko Ovale GM', 8560000, 'undefined', 'public/images/all-products/132.jpg', '2025-01-16 17:50:53', 16, 132),
(133, 'Gương Gynko Ovale PM', 7490000, 'undefined', 'public/images/all-products/133.jpg', '2025-01-16 17:50:53', 16, 133),
(134, 'Gương hoa mặt trời 81cm 80952K', 9910000, 'undefined', 'public/images/all-products/134.jpg', '2025-01-16 17:50:53', 16, 134),
(135, 'Kệ giày Caruso 5 Doors', 10710000, 'undefined', 'public/images/all-products/135.jpg', '2025-01-16 17:50:53', 4, 135),
(136, 'Tủ giày Caruso 2 ngăn nâu75X77 86217K', 14240000, 'undefined', 'public/images/all-products/136.jpg', '2025-01-16 17:50:53', 4, 136),
(137, 'Tủ giày Caruso 5 ngăn xám H170x50x14 82568K', 10710000, 'undefined', 'public/images/all-products/137.jpg', '2025-01-16 17:50:53', 4, 137),
(138, 'Tủ giày 4 ngăn Luxury  84995K', 34270000, 'undefined', 'public/images/all-products/138.jpg', '2025-01-16 17:50:53', 4, 138),
(139, 'Tủ giày 3 ngăn Luxury 84993K', 24250000, 'undefined', 'public/images/all-products/139.jpg', '2025-01-16 17:50:53', 4, 139),
(140, 'Tủ giày Chio nâu', 11570000, 'Với thiết kế gọn gàng', 'public/images/all-products/140.jpg', '2025-01-16 17:50:53', 4, 140),
(141, 'Tủ giày Chio sơn trắng', 11570000, 'Với thiết kế gọn gàng', 'public/images/all-products/141.jpg', '2025-01-16 17:50:53', 4, 141),
(142, 'Tủ giày Pisa', 24110000, 'undefined', 'public/images/all-products/142.jpg', '2025-01-16 17:50:53', 4, 142),
(143, 'Bàn làm việc Coastal', 14900000, 'Coastal mang đậm chất Việt khi khéo léo dung hòa được những nét đẹp lấy cảm hứng từ miền duyên hải nước ta với các vật liệu cao cấp', 'public/images/all-products/143.jpg', '2025-01-16 17:50:53', 17, 143),
(144, 'Bàn làm việc Fence', 30900000, 'undefined', 'public/images/all-products/144.jpg', '2025-01-16 17:50:53', 17, 144),
(145, 'Bàn làm việc Finn 260011', 25240000, 'undefined', 'public/images/all-products/145.jpg', '2025-01-16 17:50:53', 17, 145),
(146, 'Bàn làm việc Foldy', 35290000, 'undefined', 'public/images/all-products/146.jpg', '2025-01-16 17:50:53', 17, 146),
(147, 'Bàn làm việc Saka', 22490000, 'undefined', 'public/images/all-products/147.jpg', '2025-01-16 17:50:53', 17, 147),
(148, 'Bàn làm việc Wing màu đen', 14630000, 'undefined', 'public/images/all-products/148.jpg', '2025-01-16 17:50:53', 17, 148),
(149, 'Bàn làm việc Wing màu trắng', 14630000, 'undefined', 'public/images/all-products/149.jpg', '2025-01-16 17:50:53', 17, 149),
(150, 'Bàn làm việc Maxine', 51000000, 'Một thiết kế bàn làm việc đẳng cấp cho không gian làm việc của bạn', 'public/images/all-products/150.jpg', '2025-01-16 17:50:53', 17, 150),
(151, 'Bàn làm việc Osaka', 22490000, 'undefined', 'public/images/all-products/151.jpg', '2025-01-16 17:50:53', 17, 151),
(152, 'Bàn làm việc Pio', 14500000, 'Không gian phòng làm việc sẽ trở nên ấm cúng và mới mẻ với bàn làm việc Pio. Phần hộc kéo rộng giúp cất giữ đồ đạc tối ưu', 'public/images/all-products/152.jpg', '2025-01-16 17:50:53', 17, 152);

-- --------------------------------------------------------

--
-- Table structure for table `product_atribute`
--

CREATE TABLE `product_atribute` (
  `id` int(11) NOT NULL,
  `material` text DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_atribute`
--

INSERT INTO `product_atribute` (`id`, `material`, `size`) VALUES
(1, 'Metal', NULL),
(2, NULL, 'D1500 - R450 - C1968 mm'),
(3, 'MDF veneer Ash - khung sắt', NULL),
(4, 'Rap', NULL),
(5, NULL, 'D1070-R400-C1800 mm'),
(6, NULL, 'D1400-R400-C2000 mm'),
(7, NULL, 'D1010 - R390 - C1850 mm'),
(8, NULL, 'D1800 - R400 - C1800 mm'),
(9, NULL, 'D1010 - R390 - C970 mm'),
(10, NULL, 'D820 - R430 - C1770 mm'),
(11, 'Khung gỗ Ash - nệm bọc vải', NULL),
(12, 'Khung gỗ Ash - nệm bọc vải', NULL),
(13, 'Khung gỗ Ash - nệm bọc vải', NULL),
(14, 'Khung gỗ - Bọc vải cao cấp', NULL),
(15, 'Khung gỗ - Bọc vải cao cấp', NULL),
(16, 'Khung gỗ - Bọc vải cao cấp', NULL),
(17, NULL, 'D2000 - R1800 - C1070 mm'),
(18, 'Khung gỗ - Bọc vải cao cấp', NULL),
(19, 'Khung gỗ - Bọc vải cao cấp', NULL),
(20, 'Gỗ sồi tự nhiên - MDF chống ẩm - Vải cao cấp', NULL),
(21, 'D900 - R480 - C1360', NULL),
(22, 'Jazz', NULL),
(23, 'gỗ cao su', NULL),
(24, 'Chân kim loại - mặt nhựa giả mây/ kính', NULL),
(25, 'Osaka', NULL),
(26, 'Bridge', NULL),
(27, 'Bridge', NULL),
(28, 'Khung tủ thép sơn tĩnh điện màu gold -mặt Cement terrazzo', NULL),
(29, 'Miami', NULL),
(30, 'Chân kim loại sơn đen', NULL),
(31, 'Khung gỗ sồi đặc tự nhiên nhập khẩu từ Mỹ - da Ý tự nhiên cao cấp', NULL),
(32, 'Chân Gỗ', NULL),
(33, NULL, 'D470- C860 mm'),
(34, NULL, 'D480- C1000 mm'),
(35, 'D330-R330-C750', NULL),
(36, NULL, 'D505 - R540 - C650/950 mm'),
(37, NULL, 'D505 - R540 - C650/950 mm'),
(38, 'Calligaris', NULL),
(39, NULL, 'D400 - R400 - C900 mm'),
(40, 'Calligaris', NULL),
(41, NULL, 'D1690 - R760 - C700 mm'),
(42, 'Gỗ Beech bọc vải cao cấp', NULL),
(43, 'Gỗ Beech bọc vải cao cấp', NULL),
(44, 'Khung gỗ Walnut tự nhiên - Nệm bọc da bò tự nhiên cao cấp màu Beige R5', NULL),
(45, NULL, 'D2200 - R920 - C720 mm'),
(46, 'Chân kim loại sơn đen', NULL),
(47, 'Chân kim loại sơn đen', NULL),
(48, 'D2250 - R900 - C790', NULL),
(49, NULL, 'D2240 - R950 - C780 mm'),
(50, 'Khung gỗ bọc vải cao cấp', NULL),
(51, 'chân kim loại', NULL),
(52, 'Gỗ Beech tự nhiên', NULL),
(53, NULL, 'D670 - R760 - C700 mm'),
(54, 'Gỗ Beech bọc vải cao cấp', NULL),
(55, 'Gỗ Beech bọc vải cao cấp', NULL),
(56, 'Gỗ Beech tự nhiên bọc vải cao cấp', NULL),
(57, NULL, 'D670 - R770 - C660/400 mm'),
(58, NULL, '770 x 800 mm'),
(59, NULL, '800x550 mm'),
(60, NULL, '700 x 800 mm'),
(61, NULL, 'D500 - R500 - C600 mm'),
(62, 'Metal', NULL),
(63, 'Kim loại sơn', NULL),
(64, 'Chân kim loại - PU - mặt đá marble', NULL),
(65, 'Chân kim loại - PU - mặt đá marble', NULL),
(66, 'Chân kim loại - mặt kính', NULL),
(67, 'Gỗ Beech', NULL),
(68, NULL, 'D550 - R550 - C410 mm'),
(69, 'Chân kim loại - mặt gỗ công nghiệp', NULL),
(70, 'Chân kim loại - mặt gỗ công nghiệp', NULL),
(71, 'Gỗ Oak - kính', NULL),
(72, 'Chân kim loại - mặt kính', NULL),
(73, NULL, 'D1000 - R600 - C390 mm'),
(74, 'Gỗ Beech', NULL),
(75, 'Chân kim loại - mặt đá/ gỗ công nghiệp', NULL),
(76, 'Gỗ Beech', NULL),
(77, NULL, 'D1200 - R600 - C420 mm'),
(78, NULL, 'D700 - R700 - C370 mm'),
(79, NULL, 'D690 - R690 - C380 mm'),
(80, NULL, 'D920 - R920 C380 mm'),
(81, NULL, 'D690 - R660 - C390 mm'),
(82, NULL, 'D700 - R500 - C430 mm'),
(83, 'Chân kim loại - nệm bọc vải', NULL),
(84, NULL, 'D1500 - R410 - C460 mm'),
(85, 'Chân kim loại - nệm bọc vải', NULL),
(86, 'Khung chân kim loại/ gỗ walnut', NULL),
(87, 'Khung chân kim loại/ gỗ walnut', NULL),
(88, NULL, 'Ø430 - C430 mm'),
(89, 'Khung chân kim loại/ gỗ walnut', NULL),
(90, 'Chân kim loại - nệm bọc vải', NULL),
(91, NULL, '170x410x630 mm'),
(92, NULL, '170x410x630 mm'),
(93, 'Chân đèn gốm', NULL),
(94, 'Metal', NULL),
(95, 'Metal', NULL),
(96, 'Kim loại - thủy tinh', NULL),
(97, 'Thủy tinh - kim loại', NULL),
(98, 'Gắn được 4 bóng 10W - thủy tinh - kim loại', NULL),
(99, 'Gắn được 9 bóng max 28W - thủy tinh - kim loại', NULL),
(100, 'Sắt', NULL),
(101, 'Kim loại mặt kính trong', NULL),
(102, 'Kim loại mặt kính trong', NULL),
(103, 'Kim loại mặt kính trong', NULL),
(104, 'Thủy tinh - kim loại', NULL),
(105, 'Thủy tinh - kim loại', NULL),
(106, 'Kim loại nikel - Mặt kính trong', NULL),
(107, 'Thủy tinh', NULL),
(108, 'Thủy tinh', NULL),
(109, 'Khung MDF dán giấy', NULL),
(110, 'Thủy tinh - kim loại', NULL),
(111, 'Thùng MFC chống ẩm - mặt MDF Acrylic Parc50', NULL),
(112, 'MDF Laminate', NULL),
(113, NULL, 'D1600-R600-C2000mm'),
(114, 'Khung gỗ Okumi', NULL),
(115, NULL, '200x310 mm'),
(116, NULL, 'Ø160 - C160 mm'),
(117, 'Gốm sứ', NULL),
(118, 'Aluminium -có thể dùng trong nhà-ngòai trời', NULL),
(119, 'Aluminium -có thể dùng trong nhà-ngòai trời', NULL),
(120, 'Aluminium -có thể dùng trong nhà-ngòai trời', NULL),
(121, NULL, 'D140 - C200 mm'),
(122, NULL, 'D140 - C200 mm'),
(123, NULL, 'D140 - C200 mm'),
(124, 'Thủy tinh', NULL),
(125, 'Kim loại - thủy tinh', NULL),
(126, NULL, 'R750 - C1250 mm'),
(127, 'Thủy tinh - gỗ công nghiệp', NULL),
(128, 'Chân khung kim loại màu gold', NULL),
(129, NULL, 'Ø1300 - C40 mm'),
(130, 'Kim loại - thủy tinh', NULL),
(131, NULL, 'R600 -C1150 mm'),
(132, NULL, 'R660 - C920 mm'),
(133, NULL, 'R420 - C1070 mm'),
(134, 'thủy tinh', NULL),
(135, 'Kim loại', NULL),
(136, 'Kim loại', NULL),
(137, 'Kim loại', NULL),
(138, NULL, 'D550- R300- C1460 mm'),
(139, NULL, 'D550- R300- C1240 mm'),
(140, 'Chio', NULL),
(141, 'Chio', NULL),
(142, NULL, 'D400- R400- C1800 mm'),
(143, 'Gỗ Ash - MDF veneer Ash', NULL),
(144, 'Chân kim loại - mặt kính', NULL),
(145, 'Gỗ màu nâu/xanh lá', NULL),
(146, NULL, 'D1150 - R680 - C750/880 mm'),
(147, NULL, 'D1380 - R600 - C750 mm'),
(148, 'Chân kim loại sơn đen - mặt gỗ - MDF Sồi bo cong cạnh', NULL),
(149, 'Chân kim loại sơn trắng - mặt gỗ - MDF Sồi bo cong cạnh', NULL),
(150, 'Maxine', NULL),
(151, NULL, 'D1380 - R600 - C760 mm'),
(152, 'Pio', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `codes` varchar(20) NOT NULL,
  `type` enum('fix_value','percentage') NOT NULL,
  `limitPro` int(11) NOT NULL,
  `valueOfPro` float NOT NULL,
  `statusOfPro` enum('available','expired') NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `codes`, `type`, `limitPro`, `valueOfPro`, `statusOfPro`, `startDate`, `endDate`) VALUES
(1, 'SPRING2024', 'percentage', 100, 20, 'available', '2024-03-01 00:00:00', '2024-03-15 23:59:59'),
(2, 'BLACKFRI2024', 'fix_value', 500, 1000000, 'available', '2024-11-25 00:00:00', '2024-11-30 23:59:59'),
(3, 'SUMMERCLEAR2024', 'fix_value', 200, 500000, 'available', '2024-06-01 00:00:00', '2024-06-30 23:59:59'),
(4, 'HOLIDAY25', 'percentage', 300, 25, 'available', '2024-12-01 00:00:00', '2024-12-25 23:59:59'),
(5, 'LOYALTY10', 'fix_value', 1000, 100000, 'available', '2024-01-01 00:00:00', '2024-12-31 23:59:59'),
(11, 's', 'percentage', 12, 12, 'available', '2025-04-30 00:00:00', '2025-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `commentRate` text NOT NULL,
  `dateRate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`userID`, `productID`, `stars`, `commentRate`, `dateRate`) VALUES
(1, 101, 5, 'Excellent product! Highly recommended.', '2024-03-15 23:59:59'),
(1, 111, 5, 'Very reliable and works as advertised.', '2024-03-15 23:59:59'),
(2, 102, 4, 'Good product, but the packaging could be better.', '2024-03-15 23:59:59'),
(2, 112, 2, 'The color was not as expected and quality is poor.', '2024-03-15 23:59:59'),
(3, 103, 3, 'Decent, but it did not meet my expectations.', '2024-03-15 23:59:59'),
(3, 113, 3, 'It’s alright, but it could be improved.', '2024-03-15 23:59:59'),
(4, 104, 2, 'The quality is not as advertised, disappointed.', '2024-03-15 23:59:59'),
(4, 114, 4, 'Very good, but I expected better performance.', '2024-03-15 23:59:59'),
(5, 105, 5, 'Perfect! Exactly what I needed. Will buy again.', '2024-03-15 23:59:59'),
(5, 115, 5, 'Excellent quality, fast shipping, highly recommended!', '2024-03-15 23:59:59'),
(6, 106, 4, 'Very good, but the delivery was delayed.', '2024-03-15 23:59:59'),
(6, 116, 4, 'Good product, but the instructions were unclear.', '2024-03-15 23:59:59'),
(7, 107, 1, 'Horrible experience. The product broke after one use.', '2024-03-15 23:59:59'),
(7, 117, 1, 'Terrible, it arrived broken and the customer service was unhelpful.', '2024-03-15 23:59:59'),
(8, 108, 5, 'Fantastic! I\'m extremely satisfied with this purchase.', '2024-03-15 23:59:59'),
(8, 118, 5, 'I love it! Will definitely buy more.', '2024-03-15 23:59:59'),
(9, 109, 3, 'Okay, but nothing special about it.', '2024-03-15 23:59:59'),
(9, 119, 3, 'Not bad, but expected better quality for the price.', '2024-03-15 23:59:59'),
(10, 110, 4, 'Good overall, just a bit more expensive than expected.', '2024-03-15 23:59:59'),
(10, 120, 4, 'Satisfactory, but a little noisy when in use.', '2024-03-15 23:59:59'),
(121, 2, 1, 'Sản phẩm tuyệt vời', '2025-01-17 00:33:33'),
(121, 3, 3, 'sản phẩm nhìn hơi đơn giản ', '2025-02-15 12:53:30'),
(121, 11, 5, 'Trời, sản phẩm xuất sắc vậy mà giờ tôi mới biết tới.', '2025-01-23 21:56:11'),
(121, 121, 1, 'Sản phẩm xấu quá xấu', '2025-03-25 12:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `nameRole` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `nameRole`) VALUES
(1, 'Client'),
(2, 'Manager'),
(3, 'Employee'),
(4, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phoneNum` varchar(255) DEFAULT NULL,
  `statusUser` enum('enable','disable') DEFAULT NULL,
  `createUser` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `public_key` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullName`, `gender`, `pass`, `email`, `phoneNum`, `statusUser`, `createUser`, `avatar`, `roleID`, `public_key`) VALUES
(1, 'john_doe', 'The Empty', 'male', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'john.doe@example.com', '0933718070', 'enable', '2024-12-11 10:00:00', 'avatar1.png', 1, 'MIIBHjANBgkqhkiG9w0BAQEFAAOCAQsAMIIBBgKB/grUJ2edlwdoFEVZZYaWaJTSCwr+KUfUF8Od0WobAfnH4ojHp45Elj0H52gsVNCyiItzRca8xitN+EcHpV131pWzg+/ylSY1DELCgPIqfyHOz7rx1lLOCcC9e431fazPikxKNICUgsMHOksyH/KwozSb1YVK9kzc9FVPFftFMsUjyWxHkOG8LuuQ317Abkxd95Pb927CYZo3w0aEA3e6bg5/OckwelsbSUoRDyNpSTxmseacMJigNq4BV2IfimjbcQfNVdpDokoXSU901jBv1oNFP/HfZ6j2xw+KDB7p/0i6xGWwCRGGgcBT+1RPpKKwC2/28MoAjP+pe8NDASb/AgMBAAE='),
(2, 'jane_smith', 'Jane Smith', 'female', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'jane.smith@example.com', '0987654321', 'enable', '2024-12-11 10:30:00', 'avatar2.png', 2, NULL),
(3, 'mike_jones', 'Mike Jones', 'male', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'mike.jones@example.com', '1122334455', 'enable', '2024-12-11 11:00:00', 'avatar3.png', 3, NULL),
(4, 'susan_lee', 'Susan Lee', 'female', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'susan.lee@example.com', '6677889900', 'enable', '2024-12-11 11:30:00', 'avatar4.png', 4, NULL),
(5, 'emily_clark', 'Emily Clark', 'female', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'emily.clark@example.com', '5566778899', 'enable', '2024-12-11 12:00:00', 'avatar5.png', 1, NULL),
(6, 'david_wilson', 'David Wilson', 'male', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'david.wilson@example.com', '4433221100', 'enable', '2024-12-11 12:30:00', 'avatar6.png', 2, NULL),
(7, 'linda_martin', 'Linda Martin', 'female', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'linda.martin@example.com', '3344556677', 'enable', '2024-12-11 13:00:00', 'avatar7.png', 3, NULL),
(8, 'robert_taylor', 'Robert Taylor', 'male', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'robert.taylor@example.com', '2233445566', 'enable', '2024-12-11 13:30:00', 'avatar8.png', 4, NULL),
(9, 'paul_johnson', 'Paul Johnson', 'male', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'paul.johnson@example.com', '1122334455', 'enable', '2024-12-11 14:00:00', 'avatar9.png', 1, NULL),
(10, 'anna_brown', 'Anna Brown', 'female', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'anna.brown@example.com', '9988776655', 'enable', '2024-12-11 14:30:00', 'avatar10.png', 2, NULL),
(11, 'theempty', 'Random User', 'male', 'd1acf4ee54f1bcbf0d4ab06174577e57b133e37b4ab0dc658ebd8e4475408628', 'emptythe.56@gmail.com', '1234567890', 'enable', '2025-04-30 12:00:00', 'avatar11.png', 1, NULL),
(12, 'harvey2807', 'Harvey Miller', 'male', 'd6b2fac6958f124b7230f53a46b68a1fa66b51299ac452ef02ea82a7350f73fb', 'harvey.2807@gmail.com', '9876543210', 'enable', '2025-04-30 12:00:00', 'avatar12.png', 1, NULL),
(13, 'PKhanhDuy', 'Pham Khanh Duy', 'male', 'eafd7a98dafd1b79c584e1104d6f806e7a2f7f28ac01d3a7985ccb8fc72d6f55', 'pkhanhduy.48@gmail.com', '1122334455', 'enable', '2025-04-30 12:00:00', 'avatar13.png', 1, NULL),
(14, 'randomguy', 'Random Guy', 'male', '846de2acb847b9e60ccdabba3b7a63eadfd90dc75d72e9715334f776a8bb288f', 'randomguy@hotmail.com', '5566778899', 'disable', '2025-01-01 12:00:00', 'avatar14.png', 1, NULL),
(15, 'nttoan', 'Nguyen Toan', 'male', '69b1a062ed86a9a00b968f0db905521a2de5d24fe016dafd917395973fc8da8e', 'nttoan.3004@gmail.com', '4455667788', 'enable', '2025-04-30 12:00:00', 'avatar15.png', 1, NULL),
(16, 'marie.heard', 'Marie Heard', 'female', 'fca3f64e19f259b4b192e32eb584947f1b21c7ed5b410ea32f7838bf9457f216', 'marie.heard@enron.com', '6677889900', 'enable', '2025-07-30 12:00:00', 'avatar16.png', 2, NULL),
(17, 'mark.e.taylor', 'Mark Taylor', 'male', '6eb02e708b685be23e5d9a94fccc13da641d9664d283164e9b69d098c5701171', 'mark.e.taylor@enron.com', '9988776655', 'enable', '2025-09-30 12:00:00', 'avatar17.png', 3, NULL),
(18, 'lindy.donoho', 'Lindy Donoho', 'female', '5c15e84b2071afeb55feee3f76f5d4bd15127e6d2fce4939ab0bf39daf838fa9', 'lindy.donoho@enron.com', '7788990011', 'enable', '2025-07-30 12:00:00', 'avatar18.png', 3, NULL),
(19, 'lisa.gang', 'Lisa Gang', 'female', '83e7a6aca8888c8bd9e0e0a08d980d2e03ebd7c34502680c035b75f8eabfd75b', 'lisa.gang@enron.com', '3344556677', 'enable', '2025-08-30 12:00:00', 'avatar19.png', 3, NULL),
(20, 'jeff.skilling', 'Jeff Skilling', 'male', '12f2cc81589561f8a6fb3cb6f7475666bad2fc1cff3d7674c5843f9d47c092af', 'jeff.skilling@enron.com', '2233445566', 'disable', '2025-10-30 12:00:00', 'avatar20.png', 4, NULL),
(121, 'KhanhDuy', '', 'male', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'khanhduy270704@gmail.com', '', 'enable', '2025-01-16 18:39:16', '', 1, NULL),
(122, 'test', 't', 'male', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 't@t.com', '', 'enable', '2025-05-17 16:15:13', '', 4, NULL),
(123, 'test2', 't', 'male', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 't@t.com', '', 'enable', '2025-05-20 13:29:10', '', 3, NULL),
(124, 'test3', 't', 'male', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 't@t.com', '', 'enable', '2025-05-20 13:29:54', '', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verify`
--

CREATE TABLE `verify` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `public_key` text NOT NULL,
  `signature` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `wareHouseName` varchar(40) NOT NULL,
  `managerID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `available` enum('available','unavailble') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `wareHouseName`, `managerID`, `addressID`, `stock`, `available`) VALUES
(1, 'Central Warehouse', 1, 1, 5000, 'available'),
(2, 'East Side Storage', 2, 2, 3500, 'available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asigning_role`
--
ALTER TABLE `asigning_role`
  ADD PRIMARY KEY (`permissionID`,`roleID`),
  ADD KEY `roleID` (`roleID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_products`
--
ALTER TABLE `favourite_products`
  ADD UNIQUE KEY `userID` (`userID`,`productID`),
  ADD KEY `fk_product_4` (`productID`);

--
-- Indexes for table `having_product`
--
ALTER TABLE `having_product`
  ADD KEY `warehouseID` (`warehouseID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `paymentID` (`paymentID`),
  ADD KEY `order_fk_3` (`promotion_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `own_address`
--
ALTER TABLE `own_address`
  ADD KEY `ownaddress_ibfk_1` (`addressID`),
  ADD KEY `userid_ibfk_1` (`userID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cateID` (`cateID`),
  ADD KEY `atributeID` (`atributeID`);

--
-- Indexes for table `product_atribute`
--
ALTER TABLE `product_atribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_img_fk` (`product_id`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`userID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_of_user` (`roleID`);

--
-- Indexes for table `verify`
--
ALTER TABLE `verify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_add_fk` (`addressID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `product_atribute`
--
ALTER TABLE `product_atribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `verify`
--
ALTER TABLE `verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asigning_role`
--
ALTER TABLE `asigning_role`
  ADD CONSTRAINT `asignrole_ibfk_1` FOREIGN KEY (`permissionID`) REFERENCES `permission` (`id`),
  ADD CONSTRAINT `asignrole_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`);

--
-- Constraints for table `favourite_products`
--
ALTER TABLE `favourite_products`
  ADD CONSTRAINT `fk_product_4` FOREIGN KEY (`productID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_user_3` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `having_product`
--
ALTER TABLE `having_product`
  ADD CONSTRAINT `having_product_ibfk_1` FOREIGN KEY (`warehouseID`) REFERENCES `warehouse` (`id`),
  ADD CONSTRAINT `having_product_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_fk_3` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`),
  ADD CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`paymentID`) REFERENCES `payment` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `own_address`
--
ALTER TABLE `own_address`
  ADD CONSTRAINT `ownaddress_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `userid_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cateID`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`atributeID`) REFERENCES `product_atribute` (`id`);

--
-- Constraints for table `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `role_of_user` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`);

--
-- Constraints for table `verify`
--
ALTER TABLE `verify`
  ADD CONSTRAINT `verify_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_add_fk` FOREIGN KEY (`addressID`) REFERENCES `address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
