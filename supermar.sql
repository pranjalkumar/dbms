-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2017 at 05:15 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supermar`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `phone` bigint(12) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`phone`, `name`, `email`, `address`) VALUES
(2346578543, 'poda', 'poda@gmail.com', 'Gwalior');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `permissions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Standard_Employee', ''),
(2, 'Administrator', '{\r\n"admin": 1,\r\n"moderator" : 1\r\n}'),
(3, 'Inventory_manager', '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` varchar(20) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `units_avail` int(10) NOT NULL DEFAULT '0',
  `cost` int(10) NOT NULL,
  `category` varchar(20) NOT NULL,
  `brand` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `units_avail`, `cost`, `category`, `brand`) VALUES
('2', 'shampoo', 11, 60, 'shampoo', 'head and shoulder'),
('20', 'Hand wash', 40, 35, 'cleaner', 'Dettol'),
('3', 'hair oil', 0, 30, 'beauty', 'himalya'),
('7', 'jeans', 0, 3000, 'cloth', 'cloth'),
('80', 'dfdegbrt', 100, 100, 'bettrh5trhb', 'rebhtrhr');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `supid` varchar(20) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `dop` date NOT NULL,
  `quantity` int(20) NOT NULL,
  `cost_item` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`supid`, `pid`, `dop`, `quantity`, `cost_item`) VALUES
('1', '2', '2017-04-20', 6, 56),
('1', '20', '2017-04-19', 50, 35),
('1', '3', '2017-04-13', 4, 400),
('1', '80', '2017-04-10', 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `pid` varchar(20) NOT NULL,
  `date_sale` datetime NOT NULL,
  `quantity` int(20) NOT NULL,
  `cost` float NOT NULL,
  `sid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`pid`, `date_sale`, `quantity`, `cost`, `sid`) VALUES
('2', '2017-04-05 00:00:00', 4, 56, 4),
('2', '2017-04-06 11:00:00', 2, 12, 7),
('20', '2017-04-19 17:11:26', 2, 300, 6006891);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supid` varchar(20) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `phone_num` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supid`, `sname`, `address`, `e_mail`, `phone_num`) VALUES
('0', 'test', 'test', 'test', 1234567890),
('1', 'qwerty', 'qwerty', 'qwerty@gmail.com', 1234567898);

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `sid` int(10) NOT NULL,
  `phone` bigint(13) NOT NULL,
  `total_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`sid`, `phone`, `total_cost`) VALUES
(6006891, 2346578543, 600);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `salt`, `group`) VALUES
(16, 'test', 'ert', 'fc095344bf3e3495531f71b42dbe935cdfda75a7a27c4da2297641708b880cd9', '‹YÃÂh¤±¼fÿz_f‡õø2G“{zÈ#SƒÐËÃ', 2),
(29, 'qwerty', 'qwerty', 'c56a86892da8c3116570cfb31609e675b9e8a9c527ce7b53dc9e916ab1122c77', '$Mb	ý…l6öª\0XDó5cx§R7	$‰Õá•Zû', 1),
(30, 'asdfghjk', 'asdfghjk', '657b8f65fac562f96b07567557a75a2a2f0f519119249a010d421f09fc28490e', '¯-Ø]?ó¦XÌ¦_j–‹ftiÔi7ú€ {–È4', 3),
(31, 'kushal', 'kushal', '91a968f25cdb0ce6631e669b7100cbb473242e30cb72230683af53d89e58326b', '´!C_Æá¥ÿžîá¤E]°¿Ó¯GCcEJZ”>…S', 3),
(32, 'btbt', 'prakharsri', 'f491d979a29040943cfb24a5a35aa7292a055b45003c377690186bf9a65910c7', '‚Ci`Qðò¾’ü3tÕšùµ:¸Õ-yëbéº 3rø', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pname` (`pname`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`pid`,`supid`),
  ADD KEY `supid` (`supid`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sid`,`pid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supid`),
  ADD UNIQUE KEY `e_mail` (`e_mail`),
  ADD UNIQUE KEY `phone_num` (`phone_num`),
  ADD UNIQUE KEY `supid` (`supid`),
  ADD UNIQUE KEY `supid_2` (`supid`);

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`supid`) REFERENCES `supplier` (`supid`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`);

--
-- Constraints for table `trans`
--
ALTER TABLE `trans`
  ADD CONSTRAINT `trans_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `sales` (`sid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
