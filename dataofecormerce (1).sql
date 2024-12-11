-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 10:37 AM
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
-- Database: dataofecormerce
--

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS address,asign_role, category,favourite_products, having_product, order_item, orders, own_address, payment, permission, products, product_atribute, promotions, ratings, role, product_img,having_img, users, warehouse;

-- DROP TABLE IF EXISTS employment;
-- --------------------------------------------------------

--
-- Table structure for table address
--

CREATE TABLE address (
  ID INT NOT NULL,
  Princible varchar(100) NOT NULL,
  Street text NOT NULL,
  FullAddress text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table asignrole
--

CREATE TABLE asigning_role (
  permissionID INT NOT NULL,
  roleID INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table category
--

CREATE TABLE category (
  ID INT NOT NULL,
  cateName varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table employment
--


CREATE TABLE permission (
  ID INT NOT NULL,
  permissionName varchar(40) NOT NULL,
  createDate datetime NOT NULL,
  lastUpdate text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------


--
-- Table structure for table having_product
--

CREATE TABLE having_product (
  warehouseID INT NOT NULL,
  productID INT NOT NULL,
  amount int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Table structure for table orderr
--

CREATE TABLE orders (
  ID INT NOT NULL,
  userID INT NOT NULL,
  paymentID INT NOT NULL,
  shippingStatus ENUM('completed','packaging','cancelled','delivering') NOT NULL,
  createDate datetime NOT NULL,
  sđt varchar(11) NOT NULL,
  promotion_code varchar(10) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table order_item
--

CREATE TABLE order_item (
  ID INT NOT NULL,
  orderID INT NOT NULL,
  productID INT NOT NULL,
  totalPrice float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table ownaddress
--

CREATE TABLE own_address (
  userID INT NOT NULL,
  addressID INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table payment
--

CREATE TABLE payment (
  ID INT NOT NULL,
  method ENUM('cash','bank') NOT NULL,
  statuss ENUM('pending','completed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table role
--

CREATE TABLE role (
  ID INT NOT NULL,
  nameRole varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------
CREATE TABLE users (
  ID INT NOT NULL,
  username varchar(30) NOT NULL,
  fullName varchar(100) NOT NULL,
  gender ENUM('male','female') NOT NULL,
  pass varchar(30) NOT NULL,
  email varchar(30) NOT NULL,
  phoneNum varchar(10) NOT NULL,
  statusUser ENUM('enable','disable') NOT NULL,
  createUser DATETIME NOT NULL,
  avatar varchar(128) NOT NULL,
  roleID INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Table structure for table product
--

CREATE TABLE products (
  ID INT NOT NULL,
  proName varchar(255) NOT NULL,
  price float NOT NULL,
  description text NOT NULL,
  thumb varchar(255) NOT NULL,
  created_at DATETIME NOT NULL,
  cateID INT NOT NULL,
  atributeID INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
create table product_img(
  ID int not null PRIMARY KEY,
  path varchar(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

  CREATE TABLE having_img (
    product_id int not null,
    path_id int not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE favourite_products(
  productID INT NOT NULL,
  userID INT NOT NULL,
  UNIQUE (userID, productID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Table structure for table product_atribute
--

CREATE TABLE product_atribute (
  ID INT NOT NULL,
  material text NOT NULL,
  size varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table promotions
--

CREATE TABLE promotions (
  codes varchar(10) NOT NULL,
  type ENUM('fix_value','percentage') NOT NULL,
  limitPro int(11) NOT NULL,
  valueOfPro float NOT NULL,
  statusOfPro ENUM('available','expired') NOT NULL,
  startDate datetime NOT NULL,
  endDate datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table ratings
--

CREATE TABLE ratings (
  userID INT NOT NULL,
  productID INT NOT NULL,
  stars int NOT NULL,
  commentRate text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table warehouse
--

CREATE TABLE warehouse (
  ID INT NOT NULL,
  wareHouseName varchar(40) NOT NULL,
  managerID INT NOT NULL,
  addressID INT NOT NULL,
  stock int NOT NULL,
  available ENUM('available','unavailble')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indexes for table address
--
ALTER TABLE address
  ADD PRIMARY KEY (ID);

--
-- Indexes for table asignrole
--
ALTER TABLE asigning_role
  ADD PRIMARY KEY (permissionID,roleID),
  ADD KEY roleID (roleID);


--
-- Indexes for table category
--
ALTER TABLE category
  ADD PRIMARY KEY (ID);

--
-- Indexes for table employment
--
ALTER TABLE permission
  ADD PRIMARY KEY (ID);

--
-- Indexes for table having_product
--
ALTER TABLE having_product
  ADD KEY warehouseID (warehouseID),
  ADD KEY productID (productID);

--
-- Indexes for table orderr
--
ALTER TABLE orders
  ADD PRIMARY KEY (ID),
  ADD KEY userID (userID),
  ADD KEY paymentID (paymentID);

--
-- Indexes for table order_item
--
ALTER TABLE order_item
  ADD PRIMARY KEY (ID),
  ADD KEY orderID (orderID),
  ADD KEY productID (productID);

--
-- Indexes for table payment
--
ALTER TABLE payment
  ADD PRIMARY KEY (ID);

--
-- Indexes for table product
--
ALTER TABLE products
  ADD PRIMARY KEY (ID),
  ADD KEY cateID (cateID),
  ADD KEY atributeID (atributeID);

--
-- Indexes for table product_atribute
--
ALTER TABLE product_atribute
  ADD PRIMARY KEY (ID);

--
-- Indexes for table promotions
--
ALTER TABLE promotions
  ADD PRIMARY KEY (codes);

--
-- Indexes for table ratings
--
ALTER TABLE ratings
  ADD PRIMARY KEY (userID,productID),
  ADD KEY productID (productID);

--
-- Indexes for table role
--
ALTER TABLE role
  ADD PRIMARY KEY (ID);

--
-- Indexes for table users
--
ALTER TABLE users
  ADD PRIMARY KEY (ID);

--
-- Indexes for table warehouse
--
ALTER TABLE warehouse
  ADD PRIMARY KEY (ID),
  ADD CONSTRAINT warehouse_add_fk  FOREIGN KEY (addressID) REFERENCES address (ID);

--
-- Constraints for dumped tables
--
  
ALTER TABLE users 
  ADD CONSTRAINT role_of_user FOREIGN KEY (roleID) REFERENCES role (ID);
--
-- Constraints for table asignrole
--
ALTER TABLE asigning_role
  ADD CONSTRAINT asignrole_ibfk_1 FOREIGN KEY (permissionID) REFERENCES permission (ID),
  ADD CONSTRAINT asignrole_ibfk_2 FOREIGN KEY (roleID) REFERENCES role (ID);




-- Constraints for table having_product
--
ALTER TABLE having_product
  ADD CONSTRAINT having_product_ibfk_1 FOREIGN KEY (warehouseID) REFERENCES warehouse (ID),
  ADD CONSTRAINT having_product_ibfk_2 FOREIGN KEY (productID) REFERENCES products (ID);

ALTER TABLE having_img 
  ADD CONSTRAINT having_img_fk1 FOREIGN KEY (path_id) REFERENCES product_img (ID),
  ADD CONSTRAINT having_product_fk1 FOREIGN KEY (product_id) REFERENCES products (ID);
--
-- Constraints for table orderr
--
ALTER TABLE orders
  ADD CONSTRAINT orderr_ibfk_1 FOREIGN KEY (userID) REFERENCES users (ID),
  ADD CONSTRAINT orderr_ibfk_2 FOREIGN KEY (paymentID) REFERENCES payment (ID),
  ADD CONSTRAINT order_fk_3 FOREIGN KEY (promotion_code) REFERENCES promotions(codes);

--
-- Constraints for table order_item
--
ALTER TABLE order_item
  ADD CONSTRAINT order_item_ibfk_1 FOREIGN KEY (orderID) REFERENCES orders (ID),
  ADD CONSTRAINT order_item_ibfk_2 FOREIGN KEY (productID) REFERENCES products (ID);

--
-- Constraints for table ownaddress
--
ALTER TABLE own_address
  ADD CONSTRAINT ownaddress_ibfk_1 FOREIGN KEY (addressID) REFERENCES address (ID),
  ADD CONSTRAINT userid_ibfk_1 FOREIGN KEY (userID) REFERENCES users (ID);

--
-- Constraints for table product
--
ALTER TABLE products
  ADD CONSTRAINT product_ibfk_1 FOREIGN KEY (cateID) REFERENCES category (ID),
  ADD CONSTRAINT product_ibfk_2 FOREIGN KEY (atributeID) REFERENCES product_atribute (ID);


-- Constraints for table ratings
--
ALTER TABLE ratings
  ADD CONSTRAINT ratings_ibfk_1 FOREIGN KEY (userID) REFERENCES users (ID),
  ADD CONSTRAINT ratings_ibfk_2 FOREIGN KEY (productID) REFERENCES products (ID);

--
-- Constraints for table warehouse
--
ALTER TABLE favourite_products
  ADD  CONSTRAINT fk_product_4 FOREIGN KEY (productID) REFERENCES products(ID),
  ADD CONSTRAINT fk_user_3 FOREIGN KEY (userID) REFERENCES users(ID);
  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
