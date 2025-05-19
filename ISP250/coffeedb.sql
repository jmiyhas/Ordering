-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 07:30 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coffeedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `level_id` int(10) NOT NULL,
  `level_des` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_des`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL,
  `orders_date` int(4) NOT NULL,
  `orders_pickup_date` int(4) NOT NULL,
  `orders_pickup_time` int(4) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `detail_id` int(4) NOT NULL AUTO_INCREMENT,
  `orders_id` int(4) NOT NULL,
  `product_id` int(4) NOT NULL,
  `qty` int(4) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(4) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) NOT NULL,
  `product_description` varchar(500) NOT NULL,
  `product_status` varchar(20) NOT NULL,
  `product_category` varchar(50) NOT NULL,
  `product_size` varchar(10) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_description`, `product_status`, `product_category`, `product_size`, `product_price`, `picture`) VALUES
(1, 'Flat White', 'A flat white is a coffee drink consisting of espresso with microfoam (steamed milk with small, fine bubbles and a glossy or velvety consistency)', '1', '1', '2', 15.00, 'flat white.PNG'),
(3, 'Cappuccino', ' Made By Topping A Shot Of Espresso With Steamed Milk And Milk Foam. Typically, It Contains Equal Parts Of Each And Is Made Up Of About 1/3 Espresso, 1', '1', '1', '2', 15.00, 'cappuccino.PNG'),
(4, 'Espresso', '  Properly Pulled Shot Of Espresso, Topped With A “crema,” A Brown Foam That Forms When Air Bubbles Combine With The Soluble Oils Of Fine-ground Coffee.', '1', '1', '2', 12.00, 'espresso.PNG'),
(5, 'Latte', 'A Latte Begins With The Same Base — A Single Or Double Shot Of Espresso. This Espresso Is Then Combined With Several Ounces Of Steamed Milk To Create A Rich, Creamy Beverage That Has A More Subtle Espresso Taste. The Typical Ratio For Espresso To Steamed Milk Is About 1-to-2. The Latte Is Then Topped With A Layer Of Foam.', '2', '1', '2', 15.00, 'latte.PNG'),
(6, 'Mocha', 'Rich, Full-bodied Espresso Combined With Bittersweet Mocha Sauce And Steamed Milk, Then Topped With Sweetened Whipped Cream. The Classic Coffee Drink That Always Sweetly Satisfies.', '1', '2', '1', 18.00, 'mocha.PNG'),
(7, 'Mocha', 'Rich, Full-bodied Espresso Combined With Bittersweet Mocha Sauce And Steamed Milk, Then Topped With Sweetened Whipped Cream. The Classic Coffee Drink That Always Sweetly Satisfies.', '1', '1', '2', 15.00, 'mocha.PNG'),
(9, 'Flat White', 'Cold: A Flat White Is A Coffee Drink Consisting Of Espresso With Microfoam (steamed Milk With Small, Fine Bubbles And A Glossy Or Velvety Consistency)', '1', '2', '1', 18.00, 'flat white cold.PNG'),
(10, 'Latte', 'Cold: A Latte Begins With The Same Base — A Single Or Double Shot Of Espresso. This Espresso Is Then Combined With Several Ounces Of Steamed Milk To Create A Rich, Creamy Beverage That Has A More Subtle Espresso Taste. The Typical Ratio For Espresso To Steamed Milk Is About 1-to-2. The Latte Is Then Topped With A Layer Of Foam.', '1', '2', '1', 18.00, 'latte cold.PNG'),
(11, 'Latte', 'A Latte Begins With The Same Base — A Single Or Double Shot Of Espresso. This Espresso Is Then Combined With Several Ounces Of Steamed Milk To Create A Rich, Creamy Beverage That Has A More Subtle Espresso Taste. The Typical Ratio For Espresso To Steamed Milk Is About 1-to-2. The Latte Is Then Topped With A Layer Of Foam.', '1', '1', '2', 15.00, 'latte.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` int(2) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `level_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `gender`, `address`, `telephone`, `email`, `picture`, `level_id`) VALUES
(1, 'admin', 'a', 'Siti Nur', 2, 'No1, Jalan Bujang 12, Taman Lembah Bujang,  08400 Merbok, Sungai Petani, Kedah', '0195710562', 'sitinurbayaismail151@gmail.com', 'siti.PNG', 1),
(2, 'ahmad', 'ahmad', 'Fatih Ayman', 1, 'No 7, Pulau Pinang', '0115454545', 'ahamd@yahoo.com', 'fatihayman.png', 2),
(3, 'fitry', 'fitry', 'Fitry Hamid', 1, 'No 9, Taman Harum, Perlis', '0178989895', '', 'fitryhamid.jpg', 2),
(4, 'nadrah', 'nadrah', 'Nadrah Nazri', 2, 'No23, Jalan Selasih 3,\r\nTaman Bunga,\r\n81131 Johor Bahru, Johor', '0127897892', '', 'nadrah.png', 2),
(5, 'tina', 'tina', 'Tina Sofea', 2, '12 Jalan Bahagia, Taman Sejahtera, Sungai Petani, Kedah', '0123456788', 'tina@gmail.com', 'tinasofea.png', 2),
(6, 'azra', 'a', 'Azra', 2, 'No 4, Jalan Lagenda 11, Lagenda Heights, 08000 Sungai Petani, Kedah', '0111234567', 'azra@gmail.com', 'azra.PNG', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
