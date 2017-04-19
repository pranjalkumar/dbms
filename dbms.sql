-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2017 at 12:58 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `sid` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `e_mail` varchar(20) NOT NULL,
  `total_cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`sid`, `name`, `phone`, `address`, `e_mail`, `total_cost`) VALUES
('81de6a23928d36', 'sadsegvrd', 123456765, 'sdgfvrdgbtr', 'fdrh@gmail.com', 30),
('2ee672329633f3', 'asdfgh', 1234567890, 'ajksdvjsnd', 'qwerty@gmail.com', 20),
('40e09e4c06b51b', 'sadsegvrd', 1234567897, 'sdgfvrdgbtrfn', 'dsfdgfdrh@gmail.com', 2);

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
(2, 'Administrator', '{\r\n\"admin\": 1,\r\n\"moderator\" : 1\r\n}'),
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
('2', 'shampoo', 11, 60, 'shampoo', 'head and shoulder');

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
('1', '2', '2017-04-20', 6, 56);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `pid` varchar(20) NOT NULL,
  `date_sale` datetime NOT NULL,
  `quantity` int(20) NOT NULL,
  `cost` float NOT NULL,
  `sid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`pid`, `date_sale`, `quantity`, `cost`, `sid`) VALUES
('2', '2017-04-18 11:57:33', 1, 30, '1c0a17db8295fc'),
('2', '2017-04-18 12:44:45', 2, 2, '26da0eeee8d23c'),
('2', '2017-04-18 11:49:01', 5, 60, '2a88822449b576'),
('2', '2017-04-18 12:39:55', 4, 5, '2ee672329633f3'),
('2', '2017-04-18 12:49:26', 1, 2, '40e09e4c06b51b'),
('2', '2017-04-18 12:50:33', 6, 5, '81de6a23928d36'),
('2', '2017-04-18 12:47:22', 1, 2, '87c888108a11f8'),
('2', '2017-04-18 11:53:54', 2, 30, '9305b14f6e7204'),
('2', '2017-04-18 12:42:35', 2, 20, 'e1ffc3bbeb2fda');

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
(31, 'ms', 'Mathew', '44d931f5a31581b1dc26d01d6851a07f2ad54a59fa097d52c9c615881a55e47b', ')&óÀE¼´\\TffÁÉ‚	÷ÞnWm¨í$rQýßt', 2),
(32, 'w', 's', '241ea260c40462cf29066bb56563d511bf97917b59d15f6f89ee84d7280da763', '8¡ ú­ˆƒ%Ý³Ìj¯+#x)µc±ûÿÚ–^—-´S˜¬', 1),
(33, '', 'Mathew Sachin', 'bf971e45260c9dabe405fee654a10996b7c96806bbdc41dd7251207408659207', 'ÝþiÄÌºSâÏ£žð„\\w9§»l}ù™V°Bí_¸>', 1),
(34, 'mathew', 'Mathew Sachin', 'fc0c2dae4400ab370918c89f70e2fcb380e1528ad032f673f4c9298885059915', '«¹;ËP\"ä’AÈù‹ülÝ|A¸7¿O,mÙºwC(ÓÖ', 1),
(35, 'mathews', 'mathews', 'e1d950233b111ec035e725a4cb032fbeddbc9ca53dd0e1eac2a79bc3f70142d1', 'íÊÒF01‹ÓtòÒ”3ÿq²ÚžŽ¨D­ïàz*', 1),
(36, 'mathews', 'mathews', 'a9055c2b549926d6989eb3cc8b653966ec91565267cb57d6a55b65188d9567af', 'NS\0yYñ€Å:>¯ë:TP³»…´ªÝË˜˜[á¨HÞÙ', 1),
(37, '', 'mathews', 'a2f9fea7374fab465ccbe72d87deb7a465d99218a05ec832f3ecee9002db9c72', 'PÒ“×å\"c ¼…µ\"UÓÍûœñN£tñ!‘^¼Þ¨À1Ðš', 1);

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
  ADD UNIQUE KEY `e_mail` (`e_mail`),
  ADD KEY `sid` (`sid`);

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
  ADD PRIMARY KEY (`sid`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `sales` (`sid`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
