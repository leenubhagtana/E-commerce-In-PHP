-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 30, 2022 at 04:47 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2022-03-29 16:21:18', '30-03-2022 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Men', 'men', '2022-03-28 19:17:37', '17-04-2022 09:29:57 PM'),
(4, 'Women', 'women', '2022-03-28 19:19:32', '17-04-2022 09:30:21 PM'),
(5, 'Beauty', 'test', '2022-03-28 19:19:54', ''),
(6, 'Kids', 'kids', '2022-03-28 19:18:52', '17-04-2022 09:40:36 PM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2022-04-03 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2022-04-03 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2022-04-04 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2022-04-03 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2022-04-03 19:21:38', 'COD', NULL),
(7, 4, '7', 1, '2022-04-11 04:24:45', 'COD', NULL),
(8, 4, '12', 1, '2022-04-11 04:24:45', 'COD', NULL),
(9, 4, '13', 1, '2022-04-11 04:24:45', 'COD', 'in Process'),
(10, 5, '1', 1, '2022-04-16 16:26:30', 'COD', NULL),
(11, 5, '4', 1, '2022-04-22 15:46:35', 'Internet Banking', NULL),
(12, 5, '9', 1, '2022-04-22 15:57:22', 'Internet Banking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

DROP TABLE IF EXISTS `ordertrackhistory`;
CREATE TABLE IF NOT EXISTS `ordertrackhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2022-04-01 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2022-04-01 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2022-04-01 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2022-04-01 19:50:36'),
(5, 9, 'in Process', 'order is in process', '2022-04-11 04:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

DROP TABLE IF EXISTS `productreviews`;
CREATE TABLE IF NOT EXISTS `productreviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(1, 4, 5, 'Jimmy Choo Heels', 'Jimmy Choo', 15000, 17000, '<font size=\"3\" face=\"georgia\">Heel height -6 inches&nbsp;</font><div><font size=\"3\" face=\"georgia\">Color- Silver</font></div>', 'heels.png', 'heels.png', 'heel2.png', 0, 'In Stock', '2022-04-04 16:25:13', NULL),
(2, 4, 2, 'Fuchsia Pink Power Shoulders Top', 'Athena', 550, 600, '<span style=\"color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\">Jazz up your collection of casual ensembles with this stylish top. Flaunting power shoulders and a textured finish, it will lend you a structured and sharp look.&nbsp;</span><ul style=\"box-sizing: inherit; list-style: none; margin-left: 0px; color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\"><li style=\"box-sizing: inherit;\">Chic fuchsia pink tone</li><li style=\"box-sizing: inherit;\">Smart-looking V-neck</li><li style=\"box-sizing: inherit;\">Structured power shoulders</li><li style=\"box-sizing: inherit;\">Polyester, machine wash</li></ul>', 'Screenshot 2022-04-04 220806.png', 'sleeve-detail-22-5.jpg', 'Screenshot 2022-04-04 220848.png', 0, 'In Stock', '2022-04-04 16:39:44', NULL),
(3, 4, 2, 'Women Beige Tie-Detail Blouse', 'H$ M', 800, 1000, '<span style=\"color: rgb(40, 44, 63);\"><font size=\"3\" style=\"\" face=\"georgia\">Blouse in a softly draping weave. Small frilled collar with narrow ties and a V-shaped opening at the front, and long, wide raglan sleeves with narrow, covered elastication at the cuffs</font></span><span style=\"color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\">.</span><br>', '3b8cf9c0-7113-4cec-a59c-025d1d0eb4e81644508373428Tie-detailblouse1.jpg', 'c6d6b537-3adf-490d-8f56-393b629282f51644508373065Tie-detailblouse5.webp', 'bc4532c9-8a0f-4b7e-a376-e0a9395e62261644508372447Tie-detailblouse4.webp', 0, 'In Stock', '2022-04-04 16:43:37', NULL),
(4, 3, 8, 'Men Blue Jeans', 'Levis', 1460, 1500, '<ul style=\"box-sizing: inherit; list-style: none; margin-left: 0px; color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\"><li style=\"box-sizing: inherit;\">Dark shade, light fade blue jeans</li><li style=\"box-sizing: inherit;\">Slim fit, mid-rise</li><li style=\"box-sizing: inherit;\">Clean look</li><li style=\"box-sizing: inherit;\">Stretchable</li><li style=\"box-sizing: inherit;\">5 pocket</li><li style=\"box-sizing: inherit;\">Length: regular</li></ul>', '3fed3522-be21-42d7-94f2-d32f2cb7eea71632740972287-Levis-Men-Jeans-5861632740971474-4.webp', '0579d3de-82ad-4c31-8d0b-33a7547cf0dc1632740972318-Levis-Men-Jeans-5861632740971474-1.webp', 'ca4bb7ab-c481-486c-904a-3de22db232461632740972308-Levis-Men-Jeans-5861632740971474-2.jpg', 0, 'In Stock', '2022-04-04 16:46:38', NULL),
(5, 6, 12, 'Blue Washed Jeans', 'H&M', 800, 0, '<span style=\"color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\">Skinny-fit jeans in washed, stretch, flexible denim for maximum comfort. Adjustable, elasticated waist, a fake fly with a press-stud, fake front pockets, real back pockets and narrow hems.</span><br>', 'ccd331b0-e621-4d03-9c88-86b2ef5dfa471647509846485ComfortStretchSkinnyFitJeans1.jpg', '299bb148-1619-41b9-9755-74e0b010ee0e1647509846474ComfortStretchSkinnyFitJeans2.jpg', '4c06c7d4-b956-45aa-a792-97b735eb41911647509846494ComfortStretchSkinnyFitJeans3.jpg', 0, 'In Stock', '2022-04-06 14:18:01', NULL),
(6, 5, 10, ' Conditioner', 'LOreal', 140, 200, '<h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: medium; margin-bottom: 0px; font-weight: 500; padding-bottom: 12px; border: none; text-transform: capitalize; font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Specifications</h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: row wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Concern</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Daily Use</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Hair Thickness</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Normal</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Hair Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Key Ingredient</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Keratin</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Sustainable</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Conditioner</div></div></div>', 'f5e7b419-0b90-4f70-9a9c-810c01f712471643364481209LOrealParisDreamLengthsDetanglingConditionerwithVegetalKerat1.webp', '05d8f674-5541-40ab-9d83-b9cf14d2dec11643364481743LOrealParisDreamLengthsDetanglingConditionerwithVegetalKerat4.webp', '25c2b463-3abe-45b8-8782-fd838fe561a01643364481234LOrealParisDreamLengthsDetanglingConditionerwithVegetalKerat11.jpg', 0, 'Out of Stock', '2022-04-06 14:21:19', NULL),
(7, 3, 9, ' Jack Flip_Flop', 'Crocs', 350, 0, '<div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Material</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Plastic</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Occasion</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Casual</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Pattern</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Printed</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Sole Material</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">EVA</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Sustainable</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Sliders</div></div>', '336a01ce-8143-4c10-bbe1-e34f92a772181647096749054JackJonesMenWhiteFlipFlops1.webp', '62acda72-799a-4c6a-a524-f968ac6acf941647096749062JackJonesMenWhiteFlipFlops4.webp', '23189fc1-c969-486b-b58a-676dc7fa9e531647096749080JackJonesMenWhiteFlipFlops5.webp', 0, 'In Stock', '2022-04-06 14:25:06', NULL),
(8, 4, 3, ' Blue Slash Knee  Jeans', 'Gant', 7100, 8000, '<ul style=\"box-sizing: inherit; list-style: none; margin-left: 0px; color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\"><li style=\"box-sizing: inherit;\">Medium shade, light fade blue jeans</li><li style=\"box-sizing: inherit;\">Regular fit, mid-rise</li><li style=\"box-sizing: inherit;\">Slash knee</li><li style=\"box-sizing: inherit;\">Non stretchable</li><li style=\"box-sizing: inherit;\">5 pocket</li><li style=\"box-sizing: inherit;\">Length: cropped</li></ul>', 'c72def30-3be1-4c9b-bfad-bd128974e4071634570956270GANTWomenBlueSlashKneeLightFadeJeans1.webp', 'bb5aee56-f3a4-4be2-bcd3-217490b3672a1634570955833GANTWomenBlueSlashKneeLightFadeJeans2.webp', 'a1adc1de-3281-4588-a600-2ef0fa2e6c6c1634570955978GANTWomenBlueSlashKneeLightFadeJeans3.jpg', 0, 'In Stock', '2022-04-06 14:27:51', NULL),
(9, 4, 4, 'Maxi Dress', 'STREET 9', 999, 0, '<span style=\"color: rgb(40, 44, 63); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: 16px;\">Black printed woven maxi dress, has a round neck, short sleeves, button closure, and flared hem</span><br>', '4abf824f-6217-4818-8b1d-be5620436ea91597269550142-3.webp', '2c861b1c-c7af-4986-8081-b0cea5b5a7fc1597269550189-4.webp', '5ec321ea-9bf8-4ad2-910e-c5af9bdb6ce81597269550046-1.webp', 0, 'In Stock', '2022-04-06 14:30:56', NULL),
(10, 4, 4, ' Fit and Flare Dress', '20Dresses', 1825, 1900, '<div style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491px;\">Rose and Blue printed woven fit and flare dress with gathered and smocking detail, has a sweetheart neck, short sleeves, an attached lining, and flared hem</p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); margin-bottom: 0px; font-weight: 500; text-transform: capitalize; border: none; padding-bottom: 5px;\"><br></h4></div>', '5939754a-f64d-425a-9b8f-375660a2d6d31598864724917-20Dresses-Dressed-To-Frill-Floral-Dress-for-Women-6931598864-3.webp', '4bf7c88f-ec4a-4161-b0e8-b497850431c21598864725022-20Dresses-Dressed-To-Frill-Floral-Dress-for-Women-6931598864-1.webp', '5939754a-f64d-425a-9b8f-375660a2d6d31598864724917-20Dresses-Dressed-To-Frill-Floral-Dress-for-Women-6931598864-3.webp', 0, 'In Stock', '2022-04-06 14:35:31', NULL),
(11, 4, 6, 'Printed Saree', 'Kalini', 1090, 0, '<div style=\"box-sizing: inherit; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><p class=\"pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-top: 12px; width: 491px;\"><span style=\"box-sizing: inherit; display: inline-block; margin-top: 0px;\">Design Details</span></p><ul style=\"box-sizing: inherit; list-style: none; margin-left: 0px;\"><li style=\"box-sizing: inherit;\">Black and red saree</li><li style=\"box-sizing: inherit;\">Floral printed saree with printed border</li></ul><br style=\"box-sizing: inherit;\">The saree comes with an unstitched blouse piece<br style=\"box-sizing: inherit;\">The blouse worn by the model might be for modelling purpose only.<p></p></div><div class=\"pdp-sizeFitDesc\" style=\"box-sizing: inherit; border: none; margin-top: 12px; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><h4 class=\"pdp-sizeFitDescTitle pdp-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); margin-bottom: 0px; font-weight: 500; text-transform: capitalize; border: none; padding-bottom: 5px;\">Size &amp; Fit</h4><p class=\"pdp-sizeFitDescContent pdp-product-description-content\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); line-height: 1.4; font-size: 16px; margin-bottom: 0px; width: 526.075px;\">Length: 5.5 metres plus 0.8 metre blouse piece<br style=\"box-sizing: inherit;\">Width: 1.06 metres (approx.)</p></div>', '3f792c82-a765-4159-85a2-f4b64d219d9d1639025362332KALINIWomenBlackPrinted2.webp', '0221662d-d402-4af7-b2b7-b25ed2113c9c1639025362323KALINIWomenBlackPrinted1.webp', 'a6b61eb3-a1b8-45d2-abbe-d764b3aad8c11639025362447KALINIWomenBlackPrinted4.webp', 0, 'In Stock', '2022-04-06 14:38:50', NULL),
(12, 3, 7, ' Solid Polo Collar T-shirt', 'Nautica', 2899, 3000, '<h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: medium; margin-bottom: 0px; font-weight: 500; padding-bottom: 12px; border: none; text-transform: capitalize; font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Specifications</h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: row wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Fabric</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Cotton</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Fit</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular Fit</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Length</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Main Trend</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">New Basics</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Multipack Set</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Single</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Neck</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Polo Collar</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Occasion</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Casual</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Pattern</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Solid</div></div></div>', 'd0450c66-4ee1-4326-b3ff-2542f7dae6641586163092259-Nautica-Men-Tshirts-9901586163090620-1.jpg', 'd232831f-bf20-44c4-ba22-e82dddef34a41586163092110-Nautica-Men-Tshirts-9901586163090620-4.jpg', 'd0450c66-4ee1-4326-b3ff-2542f7dae6641586163092259-Nautica-Men-Tshirts-9901586163090620-1.jpg', 0, 'In Stock', '2022-04-08 07:34:54', NULL),
(13, 6, 12, 'Color block shirt', 'Polo', 1100, 1500, '<h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: medium; margin-bottom: 0px; font-weight: 500; padding-bottom: 12px; border: none; text-transform: capitalize; font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Specifications</h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: row wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Sleeve Length</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Long Sleeves</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Collar</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Spread Collar</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Fit</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular Fit</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Print or Pattern Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Gingham Checks</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Occasion</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Casual</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Length</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Regular</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Hemline</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Curved</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Placket</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Button Placket</div></div></div>', '6f603317-a65e-460e-9a81-6ba996cc06d51644314266900-US-Polo-Assn-Kids-Boys-Shirts-631644314266219-1.webp', 'fb750e34-1bae-4cda-8978-476bd40868aa1644314266892-US-Polo-Assn-Kids-Boys-Shirts-631644314266219-2.webp', '86add5fa-2c15-4576-97c8-2ceeac7b90fb1644314266882-US-Polo-Assn-Kids-Boys-Shirts-631644314266219-3.jpg', 0, 'In Stock', '2022-04-08 07:39:48', NULL),
(14, 4, 6, 'Navy Blue Solid Saree', 'Sangria', 1700, 1800, '<h4 class=\"index-sizeFitDescTitle index-product-description-title\" style=\"box-sizing: inherit; color: rgb(40, 44, 63); font-size: medium; margin-bottom: 0px; font-weight: 500; padding-bottom: 12px; border: none; text-transform: capitalize; font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Specifications</h4><div class=\"index-tableContainer\" style=\"box-sizing: inherit; display: flex; -webkit-box-pack: start; justify-content: flex-start; flex-flow: row wrap; -webkit-box-orient: horizontal; -webkit-box-direction: normal; color: rgb(0, 0, 0); font-family: Whitney, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif; font-size: medium;\"><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Print or Pattern Type</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Solid</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Occasion</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Festive</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Border</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Woven Design</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Blouse Fabric</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Brocade</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Blouse</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Blouse Piece</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 0px 12px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Saree Fabric</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Poly Georgette</div></div><div class=\"index-row\" style=\"box-sizing: inherit; position: relative; border-bottom: 1px solid rgb(234, 234, 236); margin: 0px 58.45px 12px 0px; padding-bottom: 10px; flex-basis: 40%;\"><div class=\"index-rowKey\" style=\"box-sizing: inherit; position: relative; color: rgb(126, 129, 140); font-size: 12px; line-height: 1; margin-bottom: 5px;\">Wash Care</div><div class=\"index-rowValue\" style=\"box-sizing: inherit; position: relative; color: rgb(40, 44, 63); font-size: 16px; line-height: 1.2;\">Dry Clean</div></div></div>', 'a2c32671-3cb9-46cc-81c1-a722ddbf4c1e1621929685104-1.webp', '8ca8ebb5-e884-4d8b-88e3-0228686190051621929685181-5.webp', '9cf75042-db6b-4021-aec6-ccff8d49b8651621929685125-2.webp', 0, 'In Stock', '2022-04-08 07:56:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Tops', '2022-03-30 16:24:52', '04-04-2022 09:43:50 PM'),
(3, 4, 'Jeans', '2022-03-30 16:29:09', '04-04-2022 09:44:04 PM'),
(4, 4, 'Dresses', '2022-03-30 16:55:48', '04-04-2022 09:44:21 PM'),
(5, 4, 'Heels', '2022-04-01 04:12:40', '04-04-2022 09:44:40 PM'),
(6, 4, 'Sarees', '2022-04-01 04:13:00', '04-04-2022 09:45:02 PM'),
(7, 3, 'Tshirts', '2022-04-01 04:13:27', '04-04-2022 09:45:44 PM'),
(8, 3, 'Jeans', '2022-04-01 04:13:54', '04-04-2022 09:46:00 PM'),
(9, 3, 'Flip-Flop', '2022-04-01 04:36:45', '04-04-2022 09:47:16 PM'),
(10, 5, 'Haircare', '2022-04-01 04:37:02', '04-04-2022 09:48:59 PM'),
(11, 5, 'Skincare', '2022-04-01 04:37:51', '04-04-2022 09:49:41 PM'),
(12, 6, 'Jeans', '2022-03-31 20:12:59', '04-04-2022 09:51:27 PM'),
(13, 6, 'Shirts', '2022-04-04 16:21:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE IF NOT EXISTS `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'shivani.pubby@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-11 04:22:53', '11-04-2022 09:59:36 AM', 1),
(2, 'shivani.pubby@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-11 04:29:54', NULL, 1),
(3, 'shivani.pubby@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-11 04:35:03', '11-04-2022 10:06:46 AM', 1),
(4, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-16 16:25:50', NULL, 1),
(5, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 15:16:21', '22-04-2022 08:46:30 PM', 1),
(6, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-22 15:46:15', NULL, 1),
(7, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-28 14:22:45', NULL, 0),
(8, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-28 14:23:21', NULL, 0),
(9, 'lk@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-28 14:24:41', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', ''),
(4, 'Shivani Pubby', 'shivani.pubby@gmail.com', 9501224241, '0339a76553f71c19a181da2b0b77a78a', '3', 'punjab', 'kapurthala', 144601, '3', 'punjab', 'kapurthala', 144601, '2022-04-11 04:22:22', NULL),
(5, 'Loveleen Kaur', 'n@gmail.com', 9501224241, '908fd3b142e211b4c759abf025ec72b4', '3', 'punjab', 'kapurthala', 144601, '3', 'punjab', 'kapurthala', 144601, '2022-04-16 16:25:32', NULL),
(6, 'loveleen kaur', 'lk@gmail.com', 9501194626, '754cde1dfc058f8b4cc39c51fbecf116', 'V.P.O Nurpur Lubana,Kapurthala, Punjab', 'Punjab', 'kapurthala', 144804, 'V.P.O Nurpur Lubana,Kapurthala, Punjab', 'Punjab', 'kapurthala', 144804, '2022-04-28 14:24:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
