-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 10:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `icon`) VALUES
(18, 'Clothing', NULL, 'This category includes all type of clothing including shirt pants, skirts and more', 'categories/1gvmdj6ef8202906533315235.jpg'),
(19, 'Electronics', NULL, 'This category include a wide range of electronic devices and accessories such as computers, smartphones, cameras and headphones.', 'categories/1gvmdmkuf0809835391992153.jpg'),
(20, 'Footwear', NULL, 'This category includes all types of shoes, boots, and sandals for men women and children. It also includes sports shoes such as running shoes and basketball shoes.', 'categories/1gvmdq2pq5429791576553602.jpg'),
(21, 'Watches', NULL, 'This category includes all types of watches from traditional analog watches to smartwatches that can track fitness and other metrics.', 'categories/1gvmdt8bp9619461791474881.jpg'),
(22, 'Jewelry', NULL, 'This category includes all types of jewelry including earrings necklaces bracelets and earrings. It can also includes fine jewelry such as diamond rings and gold necklaces.', 'categories/1gvme0no77073838451571053.jpg'),
(23, 'Health & Beauty', NULL, 'This category includes all types of health and beauty products such as skincare, makeup, haircare and fragrances.', 'categories/1gvme5ttj35253227940608367.png'),
(24, 'Kids & Babies', NULL, 'This category includes products for children and babies such as toys clothing and baby gears  like strollers and car seats.', 'categories/1gvmecbj98397810728402413.jpg'),
(25, 'Sports', NULL, 'This category includes all types of sports equipment and gear such as fitness equipment, running shoes and team sports gear like soccer ball and basketballs.', 'categories/1gvmeikmn2865141358285086.jpg'),
(26, 'Home & Garden', NULL, 'This category includes all types of house and garden products including furniture, bedding, kitchen appliances and household products.', 'categories/1gvmelmhi818638837985465.jpg'),
(27, 'Food & Beverages', NULL, 'This category includes all types of food and beverages such as snacks, candy, beverages like tea and coffee, pantry staples like pasta and rice.', 'categories/1gvmer80640102279111224504.jpg'),
(28, 'Men\'s Clothing', 18, 'Clothing for men', 'categories/1gvmf15jg5153002984914006.jpg'),
(29, 'Women\'s Clothing', 18, 'Clothing for women', 'categories/1gvmf45t04824966931614665.jpg'),
(30, 'Children Clothing', 18, 'Clothing for children', 'categories/1gvmf55r28613470964757908.jpg'),
(31, 'Accessories', 18, 'For all genders and age range', 'categories/1gvmf6kl8605716733301582.jpg'),
(32, 'Computer Accessories', 19, 'Covers all ranges of computers and accessories', 'categories/1gvmfaufg6053575116273491.png'),
(33, 'TVs & home theater', 19, 'Covers all ranges of TV and home theaters', 'categories/1gvmfcte67331355485479234.png'),
(34, 'Audio & Headphones', 19, 'Covers all ranges of audios and headphones', 'categories/1gvmfe2d613925469058507844.png'),
(35, 'Smartphones', 19, 'Covers all ranges of smartphones and tablets', 'categories/1gvmffcsk6593933332601061.png'),
(36, 'Photography', 19, 'Covers all ranges of cameras and photography items', 'categories/1gvmfhni0585680022150596.jpg'),
(37, 'Men\'s shoes', 20, 'Covers all ranges of men\'s shoes', 'categories/1gvmfk04v04372480049041272.jpg'),
(38, 'Women\'s shoes', 20, 'Covers all ranges of women\'s shoes', 'categories/1gvmfn5sc9571185614247206.jpg'),
(39, 'Children\'s shoes', 20, 'Covers all ranges of children\'s shoes', 'categories/1gvmfnskg5797378320093662.jpg'),
(40, 'Sports shoes', 20, 'Covers all ranges of sports shoes', 'categories/1gvmfqenk33142914888720276.webp'),
(41, 'Boots', 20, 'Covers all ranges of boots', 'categories/1gvmfshdh5612714659039597.webp'),
(42, 'Men\'s watches', 21, 'Covers all ranges of  men\'s watches', 'categories/1gvmfurv225705308966576257.webp'),
(43, 'Women\'s watches', 21, 'Covers all ranges of  women\'s watches', 'categories/1gvmg12ge34085471608592655.webp'),
(44, 'Smartwatches', 21, 'Covers all ranges of  smartwatches', 'categories/1gvmg3mpm7676533246569544.webp'),
(45, 'Luxury watches', 21, 'Covers all ranges of  luxury watches', 'categories/1gvmg5g5g8109562827088579.webp'),
(46, 'Rings', 22, 'Covers all ranges of  rings', 'categories/1gvmg7b7i6121046057321531.jpg'),
(47, 'Necklaces & pendants', 22, 'Covers all ranges of necklaces and pendants', 'categories/1gvmg8r8u8209288720981585.jpg'),
(48, 'Bracelets & bangles', 22, 'Covers all ranges of bracelets and bangles', 'categories/1gvmgaen94389856154957468.jpg'),
(49, 'Earrings', 22, 'Covers all ranges of Earrings', 'categories/1gvmgc7lt6662571471074181.jpg'),
(50, 'Fine Jewelry', 22, 'Covers all ranges of fine jewelry', 'categories/1gvmh90ev5373393685476313.webp'),
(51, 'Skincare', 23, 'Covers all ranges of skincare products', 'categories/1gvmhc7pn7960774790470619.jpg'),
(52, 'Makeup', 23, 'Covers all ranges of makeup products', 'categories/1gvmhdo195978621073481194.jpg'),
(53, 'Haircare', 23, 'Covers all ranges of haircare products', 'categories/1gvmhgdcq8294764191932569.jpg'),
(54, 'Fragrances', 23, 'Covers all ranges of fragrances', 'categories/1gvmhjd6k23075264239617455.jpg'),
(55, 'Toys', 24, 'Covers all ranges of kids toys', 'categories/1gvmhlrfo368451320145476.jpg'),
(56, 'Baby gear', 24, 'Covers all ranges of baby gears', 'categories/1gvmhms6h11485772959562568.jpg'),
(57, 'Clothing', 24, 'Covers all ranges of clothing', 'categories/1gvmhnddl7719926268708619.jpg'),
(58, 'Nursery furniture', 24, 'Covers all ranges of nursery furniture', 'categories/1gvmhpei14865374138094358.jpg'),
(59, 'Diapering & feeding', 24, 'Covers all ranges of diapering and feeding materials', 'categories/1gvmhs6f47522969812747264.jpg'),
(60, 'Fitness equipment', 25, 'Covers all ranges of fitness equipment', 'categories/1gvmhvd5e32342874204795424.webp'),
(61, 'Running & jogging', 25, 'Covers all ranges of running and jogging', 'categories/1gvmilr968301819892880544.webp'),
(62, 'Team sports', 25, 'Covers all ranges of team sports', 'categories/1gvmin2s513947411160580026.jpg'),
(63, 'T-shirts', 28, 'This category includes all types of T-shirts for men', 'categories/1h39vnlku004651383154661071.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `status` enum('Processing','Pending','Delivered') DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `status`, `total`) VALUES
(10, 1, '2023-06-17 16:32:38', 'Pending', '31000.00'),
(11, 1, '2023-06-18 13:10:12', 'Pending', '5000.00'),
(14, 1, '2023-06-18 13:30:22', 'Pending', '8900.00'),
(19, 1, '2023-06-24 22:12:01', 'Pending', '41000.00'),
(20, 1, '2023-06-24 22:30:11', 'Pending', '9600.00'),
(21, 1, '2023-06-24 23:49:00', 'Pending', '14000.00'),
(22, 1, '2023-06-24 23:51:51', 'Pending', '17000.00'),
(23, 1, '2023-06-24 23:57:46', 'Pending', '12000.00'),
(24, 1, '2023-06-24 23:59:31', 'Pending', '20000.00'),
(25, 1, '2023-06-25 00:03:18', 'Pending', '7000.00'),
(26, 1, '2023-06-25 00:07:53', 'Pending', '4800.00'),
(27, 1, '2023-06-25 00:10:57', 'Pending', '5000.00'),
(28, 2, '2023-06-26 23:38:35', 'Pending', '5000.00'),
(29, 2, '2023-06-26 23:40:17', 'Pending', '5000.00'),
(30, 2, '2023-06-26 23:41:49', 'Pending', '14000.00'),
(31, 2, '2023-06-26 23:42:51', 'Pending', '7000.00'),
(32, 3, '2023-06-27 00:09:32', 'Pending', '32000.00'),
(33, 2, '2023-06-27 10:17:05', 'Pending', '57000.00'),
(34, 9, '2023-06-27 12:01:52', 'Pending', '9000.00'),
(35, 10, '2023-06-27 12:03:38', 'Pending', '9000.00'),
(36, 2, '2023-06-27 12:39:24', 'Pending', '5000.00'),
(38, 1, '2023-06-27 18:43:52', 'Pending', '25000.00'),
(39, 1, '2023-06-27 19:49:08', 'Pending', '7000.00'),
(40, 2, '2023-06-27 19:56:23', 'Pending', '4000.00'),
(41, 1, '2023-06-29 07:31:13', 'Pending', '4000.00'),
(42, 1, '2024-09-16 06:58:45', 'Pending', '35000.00'),
(43, 1, '2025-04-30 03:15:56', 'Pending', '33000.00'),
(44, 1, '2025-04-30 08:19:55', 'Pending', '9000.00'),
(45, 1, '2025-04-30 12:24:04', 'Pending', '18600.00'),
(46, 1, '2025-05-02 15:53:47', 'Pending', '40000.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 10, 8, 1),
(2, 10, 37, 1),
(3, 11, 3, 1),
(6, 14, 12, 1),
(10, 19, 80, 1),
(11, 19, 40, 2),
(12, 19, 51, 1),
(13, 20, 8, 1),
(14, 20, 13, 1),
(15, 21, 8, 1),
(16, 21, 11, 1),
(17, 22, 41, 1),
(18, 22, 45, 1),
(19, 22, 46, 1),
(20, 23, 41, 1),
(21, 23, 45, 1),
(22, 24, 77, 1),
(23, 25, 4, 1),
(24, 26, 7, 1),
(25, 27, 52, 1),
(26, 28, 25, 1),
(27, 29, 3, 1),
(28, 30, 2, 1),
(29, 30, 4, 1),
(30, 31, 24, 1),
(31, 32, 24, 1),
(32, 32, 37, 1),
(33, 33, 24, 1),
(34, 33, 37, 2),
(35, 34, 46, 1),
(36, 34, 45, 1),
(37, 35, 1, 1),
(38, 35, 8, 1),
(39, 36, 46, 1),
(40, 38, 46, 1),
(41, 38, 32, 1),
(42, 39, 40, 1),
(43, 40, 45, 1),
(44, 41, 45, 1),
(45, 42, 61, 1),
(46, 42, 77, 1),
(47, 43, 42, 1),
(48, 43, 37, 1),
(49, 44, 1, 1),
(50, 44, 1, 1),
(51, 44, 1, 1),
(52, 45, 16, 3),
(53, 46, 38, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('Credit/Debit_card','PayPal','COD') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `brand`, `description`, `price`, `quantity`, `image`) VALUES
(1, 'Levi\'s 501 Original Fit Men\'s Jeans', 28, 'Levi\'s', 'These classic jeans are made from 100% cotton and feature a straight leg and a button fly.', '3000.00', 1, 'products/1gvoj48bb4326629962483779.jpg'),
(2, 'Polo Ralph Lauren Men\'s Classic Fit Oxford Shirt', 28, 'Polo Ralph Lauren', 'This button-down shirt is made from lightweight cotton and features the iconic polo Ralph Lauren logo on the chest.', '7000.00', 1, 'products/1gvokou4b13701613672629387.webp'),
(3, 'Tommy Hilfiger Men\'s Lightweight Varsity Jacket', 28, 'Tommy Hilfiger', 'This stylish jacket is made from a lightweight polyester blend and features a sporty design which striped cuffs and a classic Tommy Hilfiger logo on the chest.', '5000.00', 1, 'products/1gvp18lii1871188993229178.webp'),
(4, 'Adidas Mens Ultraboost Running Shoes', 28, 'Adidas', 'these running shoes feature a sleek design with a breathable knit upper and responsive Boost midsole.', '7000.00', 1, 'products/1gvp1mr6g13521513875376567.jpg'),
(5, 'Calvin Klein Men\'s Cotton Stretch Boxer Briefs', 28, 'Calvin Klein', 'These convertible boxer briefs are made from a soft cotton blend with added stretch of a snug fit.', '3000.00', 1, 'products/1gvp2aheb982834454104683.jpg'),
(6, 'Leggings', 29, 'Lululemon', 'Leggings for women', '2000.00', 1, 'products/1gvt5i2rq06136466261413864.jpg'),
(7, 'Vejaro N01 Female Silk Lingerie Suit Pajamas - Black & Red', 29, 'Vejaro', 'Made of Silk and Lace, Super soft and comfortable, Breathable, Absorbent, Fashionable and high quality', '4800.00', 1, 'products/1gvtb14q16842320331490377.jpg'),
(8, 'Women Office Long Gown Party Female Dress', 29, 'Lukeman Spares', 'Women Office Long Gown Party Female Dress', '6000.00', 1, 'products/1gvtb6ukp42120364530396004.webp'),
(9, 'Ladies High Waist Jean- Light Blue', 29, 'Lukeman Spares', 'Ladies High Waist Jean- Light Blue', '9000.00', 1, 'products/1gvtbd41v5043386546347006.jpg'),
(10, 'Defacto Women Sports Bra', 29, 'Defacto', 'Defacto Women Sports Bra Hooded - Black', '2500.00', 1, 'products/1gvtbia2r47927398256718146.jpg'),
(11, 'Children\'s Air Hostess Fight Attendant Career Day Costume', 30, 'Defacto', 'Children\'s Air Hostess Fight Attendant Career Day Costume', '8000.00', 1, 'products/1gvtd01oq8631671850255185.webp'),
(12, 'Girls Sleeveless Glitter Butterfly Knit Dress', 30, 'The Children\'s Place', 'The Children\'s Place Girls Sleeveless Glitter Butterfly Knit Dress', '8900.00', 1, 'products/1gvthmdoi38774726029443185.jpg'),
(13, 'Women Waist Belt Ladies Casual Alloy Pin Buckle', 31, 'Louis Will', 'Louis Will Women Waist Belt Ladies Casual Alloy Pin Buckle', '3600.00', 1, 'products/1gvtj5d2m5637096556223355.jpg'),
(15, 'Boy Regular Fit Crew Neck Knitted Short Sleeve T-Shirt', 30, 'Defacto', 'Defacto Boy Regular Fit Crew Neck Knitted Short Sleeve T-Shirt', '2200.00', 1, 'products/1h0080o18600876020940365.jpg'),
(16, 'Hooded Long Sleeve Regular Fit Knitted Sweat Shirt', 30, 'Defacto', 'Defacto Boy Hooded Long Sleeve Regular Fit Knitted Sweat Shirt', '6200.00', 1, 'products/1h008dp9p9839238832876211.jpg'),
(17, 'Aso ẹbi', 28, 'Ofi', 'Aso ẹbi ofi', '12900.00', 1, 'products/1h0092oiq30498455094283816.jpg'),
(22, 'Spider-Man Children Hoodie', 30, 'Danami', 'Danami Spider-Man Children Hoodie - Green', '7000.00', 1, 'products/1h00hvr1220288157262610285.jpg'),
(23, 'Spider-Man Children Hoodie', 30, 'Danami', 'Danami Spider-Man Children Hoodie - Green', '7000.00', 1, 'products/1h00i4b3t7923623834251536.jpg'),
(24, 'Danami Grace Fortified Hooded Short Dress', 29, 'Danami', 'Danami Grace Fortified Hooded Short Dress', '7000.00', 1, 'products/1h00km26q8802994603529137.jpg'),
(25, 'Danami Long Sleeve Contrast T-Shirt with Button', 30, 'Danami', 'Danami Long Sleeve Contrast T-Shirt with Button', '5000.00', 1, 'products/1h025s18i9021315831621615.jpg'),
(26, 'Manual Treadmill', 25, 'Pro Sports', 'Pro Sport Manual Treadmill', '2434.00', 1, 'products/1h02cmv01034700663085629246.jpg'),
(29, 'Power Belt Waist Shaper And Clincher (BLACK)', 27, 'MaxFit', 'maxFit Power Belt Waist Shaper And Clincher (BLACK)', '3500.00', 1, 'products/1h02efvit769668270455562.jpg'),
(30, 'Garden fork', 26, 'Orion', 'Orion Garden fork', '3500.00', 1, 'products/1h11seqk29750525203607079.jpg'),
(31, 'Knapsack Sprayer', 26, 'Orion', 'Orion Knapsack Sprayer 16 litres', '12000.00', 1, 'products/1h11shlq73052611989165608.jpg'),
(32, 'Water hose', 26, 'Lawson', 'Lawson Water hose', '20000.00', 1, 'products/1h11ve8581420915815266799.jpg'),
(33, 'Hand Gloves', 26, 'Lawson', 'Lawson Hand Gloves', '2000.00', 1, 'products/1h11vfdp01289699428045703.png'),
(34, 'Shears', 26, 'Lawson', 'Lawson Shears', '4000.00', 1, 'products/1h11vgv0r26086405275384195.jpg'),
(35, 'Golden Morn', 27, 'Nestle', 'Lawson Golden Morn', '3600.00', 1, 'products/1h11vne5j2876848179845959.jpg'),
(36, 'Bournvita', 27, 'Cardbury PLC', 'Cardbury Bournvita', '4200.00', 1, 'products/1h11vqatt838901503769085.jpg'),
(37, 'Adidas Yu-Gi-Oh \'Blue Eyes Sneaker Men\'s', 37, 'Adidas', 'Adidas Yu-Gi-Oh! x ADI2000 \'Blue Eyes Sneaker Men\'s', '25000.00', 1, 'products/1h2cpqheo45534333065825683.jpg'),
(38, 'Gucci Air Bag Sneaker Men\'s', 37, 'Gucci', 'Gucci Air Bag Sneaker Men\'s', '20000.00', 1, 'products/1h2cpvarg8276680278695707.jpg'),
(39, 'Men\'s distress skinny leg jeans', 28, 'Denim', 'Denim Men\'s distress skinny jeans', '10000.00', 1, 'products/1h2cq5c6208908590010363149.jpg'),
(40, 'Vintage style shirt', 28, 'Prada', 'Prada Vintage style shirt', '7000.00', 1, 'products/1h2cq9bbu777232410307183.jpg'),
(41, 'Army Green Abaya', 29, 'Muslim Fit', 'Muslim Fit Army Green Abaya', '8000.00', 1, 'products/1h2cqekqa7893090369882534.jpg'),
(42, 'Navy Blue Ivorian Jalabia', 29, 'Muslim Fit', 'Muslim Fit Navy Blue Ivorian Jalabia', '8000.00', 1, 'products/1h2cqheje9601010052169237.jpg'),
(43, 'Black Ivorian Jalabia', 29, 'Muslim Fit', 'Muslim Fit Black Ivorian Jalabia', '8000.00', 1, 'products/1h2cqk9v74206111824391223.jpg'),
(44, 'Moroccan stylish Jalabia', 29, 'Muslim Fit', 'Muslim Fit Moroccan stylish Jalabia', '10000.00', 1, 'products/1h2cqmu9s7384790346999934.jpg'),
(45, 'Men\'s fashion slippers', 37, 'Pedro', 'Pedro Men\'s fashion slippers', '4000.00', 1, 'products/1h2cr4bt7045276983275386984.jpg'),
(46, 'Tommy Hilfiger Men\'s fashion slippers', 37, 'Tommy Hilfiger', 'Tommy Hilfiger Men\'s fashion slippers', '5000.00', 1, 'products/1h2cr72ej8084278667498115.jpg'),
(47, 'Balenciaga Allover Logo Knitwear-S', 28, 'Balenciaga', 'Balenciaga Allover Logo Knitwear-S', '5000.00', 1, 'products/1h2crbefa10909925334256654.jpg'),
(48, 'Rainbow sleeveless knit vest', 28, 'Rainbow', 'Rainbow sleeveless knit vest', '3000.00', 1, 'products/1h2crpquh10582408963806489.jpg'),
(49, 'Rainbow sleeveless knit vest', 29, 'Rainbow', 'Rainbow sleeveless knit vest', '3000.00', 1, 'products/1h2crqo93944280617533847.jpg'),
(50, 'Rainbow sleeveless knit vest', 30, 'Rainbow', 'Rainbow sleeveless knit vest', '3000.00', 1, 'products/1h2crqv3e5274158034878538.jpg'),
(51, 'Balenciaga Logo Print Cotton T-Shirt', 28, 'Balenciaga', 'Balenciaga Logo Print Cotton T-Shirt', '7000.00', 1, 'products/1h2cs1r1d42429698731284615.jpg'),
(52, 'Men Slant Pocket Drawstring Waist Trousers', 28, 'Shein', 'Dusty Blue Casual Collar Woven Fabric Plain Jogger Embellished Non-Stretch Men Clothing', '5000.00', 1, 'products/1h31e3gsj8801063409679595.jpg'),
(53, 'Exotic tuxedo fitted blazer', 28, 'Exotic ltd', 'Exotic tuxedo fitted blazer pant trousers mens suits blonde petite tall', '10000.00', 1, 'products/1h31ebrog3980391586169383.jpg'),
(54, 'High waist cropped work pants', 29, 'Olivia Mark', 'Olivia Mark - High waist cropped work pants, chic elegant type polyester', '15000.00', 1, 'products/1h31ej47t35497592317678905.jpg'),
(55, 'Women\'s Nova Lily Two Tone Easy Waist Jean', 29, 'Fashion Nova', 'Fashion Women\'s Nova Lily Two Tone Easy Waist Non Stretch Jean', '7000.00', 1, 'products/1h31eqk409509584662888197.jpg'),
(56, 'Deep V-neck wrinkled stretch sexy pure desire long-sleeved dress', 29, 'FE Clothing', 'Deep V-neck wrinkled stretch sexy pure desire long-sleeved dress from FE CLOTHING', '10000.00', 1, 'products/1h31g53gn022131880759016287.jpg'),
(57, 'WomElegant Polyester Natural Black White X-Line', 29, 'Spring Elegant', 'Women\'s Wedding & Party Dress Spring Elegant Polyester Natural Black White X-Line Regular Fit', '10000.00', 1, 'products/1h31g83me05767356981896188.jpg'),
(58, 'SHEIN Plus Block Striped Surplice Neck Lantern Sleeves', 29, 'SHEIN Plus', 'SHEIN Plus Block Striped Surplice Neck Lantern Sleeves - 100% fashionable and stylish', '5000.00', 1, 'products/1h31gop2s5731167317682957.jpg'),
(59, 'Top stitching Drop Shoulder Sweatshirt', 29, 'Dazy Top', 'Top stitching Drop Shoulder Sweatshirt - 100% fashionable and stylish', '5000.00', 1, 'products/1h31gvs7b11730271692014926.jpg'),
(60, 'Crystal Jewelry Set for Women Ring Necklace Earrings', 47, 'AAA Green Austrian Crystal Jewelry', 'AAA Green Austrian Crystal Jewelry Set for Women Ring Necklace Earrings Rose Gold Color Amazing', '12000.00', 1, 'products/1h31h6v5s5371521735555858.jpg'),
(61, 'Crystal Jewelry Set 3 Pcs Ring Necklace Eearrings', 47, 'AAA Green Austrian Crystal Jewelry', 'S107 Rose Gold Color AAA Green Austrian Crystal Jewelry Set 3 Pcs Ring Necklace Eearrings For Women HotSale Amazing Price', '15000.00', 1, 'products/1h31hf3og06798345171107112.jpg'),
(62, 'Silver Color White Pearl Jewelry Sets For Women', 47, 'Silver White Pearl', 'Jewelry Sets-Silver Color White Pearl Jewelry Sets For Women Birthday Earrings Rings Necklace Pendant Zircon', '12000.00', 1, 'products/1h31k9o650736083435806476.jpg'),
(63, 'Cuff Link Chain Charm Bracelet Bangle', 48, 'Cuff Link', 'Cuff Link Chain Charm Bracelet Bangle | Hand Chain Bracelets Women - 4pcs/set', '5000.00', 1, 'products/1h31kt9s34829497896466477.jpg'),
(64, 'Bridal Jewelry Set', 48, 'Baroque Jewelry', 'Baroque Bridal Jewelry Set for Wedding Crystal Statement Necklace Earring Indian Party Costume Jewellery Accessories Gift Women necklace earring|jewelry sets weddingbridal jewelry sets', '25000.00', 1, 'products/1h31l1lfk9310347471275142.jpg'),
(65, 'Vintage Gold Color Red Crystal Bridal Jewelry Set', 48, 'Baroque Jewelry', 'Baroque Vintage Gold Color Red Crystal Bridal Jewelry Sets Rhinestone Tiaras Crown Choker Necklace Earrings Wedding Accessories Bridal Jewelry Sets', '20000.00', 1, 'products/1h31l49mj06362515953358772.jpg'),
(66, 'Dangle Earrings Ring And Necklace Bridal Sets', 48, 'Round Red Garnet', 'Round Red Garnet Dangle Earrings Ring And Necklace Bridal Sets Blue-9', '15000.00', 1, 'products/1h31l79ti6632690838842565.jpg'),
(67, 'Heartbeat necklace', 47, 'Fashion Glam', 'Fashion New Design Wave Heart 18K Gold Plated Heartbeat Necklace For Woman', '10000.00', 1, 'products/1h31lbp9e3292102728791986.jpg'),
(68, 'Gold Color Metal Geometric Jewelry Earrings', 46, 'Fashion Glam', 'AENSOA Women\'s Pendant Earrings Gold Color Metal Geometric Jewelry Earrings', '8000.00', 1, 'products/1h31lfhu78487374953942741.jpg'),
(69, 'Logitech MX Master 3 Advanced Wireless Mouse', 32, 'Logitech', 'MAGSPEED WHEEL: Ultra-fast, precise, quiet MagSpeed electromagnetic scrolling DARKFIELD 4000 DPI SENSOR: Darkfield 4000 DPI sensor for precise tracking on any surface, even glass (up to 4mm in thickness)', '5000.00', 1, 'products/1h31ooc809649251075549174.jpg'),
(70, 'Laptop & Android TangoTab 10 Inch Tablet and Keyboard', 32, 'Simban Tango', 'Laptop & Android, Simbans TangoTab 10 Inch Tablet and Keyboard, 2-in-1 Android 10 Mini Laptop, 4 GB RAM, 64 GB Storage, Mini-HDMI, USB, GPS, Dual WiFi, Bluetooth Computer PC-New', '7000.00', 1, 'products/1h31otble6114340660959581.jpg'),
(71, 'Samsung Galaxy Tab S8 Ultra', 32, 'Samsung Ltd', 'Samsung Galaxy Tab S8 Ultra', '500000.00', 1, 'products/1h31p1jq413073996220871376.jpg'),
(72, 'Neon light keyboard', 32, 'Neon Ltd', 'Neon light keyboard', '100000.00', 1, 'products/1h31p578k03150686152791882.jpg'),
(73, 'Sony DualShock 4 v3', 62, 'Sony ltd', 'DualShock 4 Wireless Controller for Sony PlayStation 4 - Rose Gold', '50000.00', 1, 'products/1h31pdg5r5927819901414906.jpg'),
(74, 'Hover-1 Helix Electric Hoverboard', 62, 'Hover Motions', 'Hover-1 Helix Electric Hoverboard', '200000.00', 1, 'products/1h31pllkm7800449544467043.jpg'),
(75, 'Sony DualShock 4 v1', 62, 'Sony ltd', 'DualShock 4 Wireless Controller for Sony PlayStation 4 - Rose Gold', '200000.00', 1, 'products/1h31pnulp8895874860711546.jpg'),
(76, 'M&K Sound S300 Speaker System', 62, 'Sony ltd', 'M&K Sound S300 Speaker System S300 Speaker System Performance Build Quality Value', '150000.00', 1, 'products/1h31pra08020391241278571615.jpg'),
(77, 'Pokeball Pokemon Speaker', 33, 'Pokeball ltd', 'The speaker has a built-in rechargeable battery and can connect to any device via BlueTooth. With it, a Pokemon trainer can enjoy high-quality sound, wherever his next adventure may take him', '20000.00', 1, 'products/1h31pv1o12533200561842588.jpg'),
(78, 'Zeb-County - Wireless Speaker', 34, 'Zeb-County Electronics', 'Zeb-County is a compact and handy portable speaker that comes with multi-connectivity options like wireless BT/ USB/Micro SD and AUX. The speaker comes with a call function along with a built-in FM Radio too', '20000.00', 1, 'products/1h31q4ssc3937883531593489.jpg'),
(79, 'Mivi Blue Play Bluetooth Speaker', 34, 'Mivi ltd', 'Mivi Blue Play Bluetooth Speaker. Zeb-County - Wireless Speaket - a compact and handy portable speaker that comes with multi-connectivity options like ..', '10000.00', 1, 'products/1h31q9nav4786564552340282.jpg'),
(80, 'Sony XB10 Portable Bluetooth Speaker', 34, 'Sony Electronics', 'Shop Sony XB10 Portable Bluetooth Speaker Blue at Best Buy. Find low everyday prices and buy online for delivery or in-store pick-up. Price Match Guarantee', '20000.00', 1, 'products/1h31qck3a04802919274835826.jpg'),
(81, 'Clavier Fusion Portable Bluetooth Speaker', 34, 'Clavier Fusion', 'Clavier Fusion Portable Bluetooth Speaker at Best Buy. Find low everyday prices and buy online for delivery or in-store pick-up. Price Match Guarantee', '10000.00', 1, 'products/1h31qi5bh5236284662062622.jpg'),
(82, 'Dream Chasers sea green long sleeve', 63, 'Dream Chasers', 'Dream Chasers sea green long sleeve - 100% cotton and original fibre quality varying in colours and sizes', '4500.00', 1, 'products/1h39vv5ji29913083053627787.png');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` decimal(10,2) DEFAULT 1.00,
  `comment` varchar(255) NOT NULL,
  `review_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `review_date`) VALUES
(1, 47, 1, '5.00', '100% cotton and original', '2023-06-15 15:41:51'),
(2, 3, 1, '5.00', '100% cotton', '2023-06-15 15:59:45'),
(3, 30, 1, '5.00', 'conference', '2023-06-15 16:12:40'),
(4, 70, 1, '5.00', '100% convenient, durable and easy to use', '2023-06-16 13:29:14'),
(5, 70, 1, '5.00', '100% convenient, durable and easy to use', '2023-06-16 13:30:25'),
(6, 70, 1, '4.50', '100% convenient, durable and easy to use', '2023-06-16 13:32:18'),
(7, 71, 1, '4.00', 'Highly affordable and recommendable but it\'s fragile', '2023-06-16 13:33:26'),
(8, 72, 1, '4.50', '', '2023-06-16 13:34:49'),
(9, 56, 1, '3.50', 'Top quality but will limited colour range', '2023-06-16 13:36:49'),
(10, 75, 1, '4.00', 'High quality which speak more of the brand.\nI love Sony', '2023-06-16 13:38:28'),
(11, 73, 1, '5.00', 'Affordable and reliable 💯', '2023-06-16 13:39:17'),
(12, 63, 1, '4.00', 'Radiant and fashionable', '2023-06-16 13:40:33'),
(13, 5, 1, '4.50', '100% fabric', '2023-06-20 13:14:57'),
(14, 69, 1, '3.50', 'Nice Ergonomics', '2025-04-30 04:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `date` datetime DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`id`, `product_id`, `vendor_id`, `quantity`, `date`, `total_amount`) VALUES
(1, 1, 4, 10, '2023-05-16 15:08:49', '30000.00'),
(2, 11, 6, 10, '2023-05-17 14:44:26', '80000.00'),
(3, 17, 5, 10, '2023-05-17 14:51:23', '129000.00'),
(4, 12, 5, 10, '2023-05-17 14:52:49', '89000.00'),
(5, 6, 5, 10, '2023-05-17 14:56:00', '20000.00'),
(6, 6, 5, 5, '2023-05-17 14:57:17', '10000.00'),
(7, 6, 6, 10, '2023-05-18 15:13:33', '20000.00'),
(8, 6, 6, 10, '2023-05-18 15:19:08', '20000.00'),
(9, 6, 6, 10, '2023-05-18 15:21:11', '20000.00'),
(10, 6, 3, 10, '2023-05-18 15:22:10', '20000.00'),
(11, 6, 3, 10, '2023-05-18 15:25:07', '20000.00'),
(12, 6, 3, 10, '2023-05-18 15:25:31', '20000.00'),
(13, 6, 3, 10, '2023-05-18 15:26:28', '20000.00'),
(14, 9, 3, 10, '2023-05-19 08:43:11', '90000.00'),
(15, 15, 3, 10, '2023-05-19 08:43:33', '22000.00'),
(16, 3, 5, 20, '2023-05-22 15:03:06', '100000.00'),
(17, 15, 3, 15, '2023-05-22 15:03:27', '33000.00'),
(18, 25, 4, 15, '2023-05-22 15:03:45', '75000.00'),
(19, 31, 10, 10, '2023-05-22 15:54:52', '120000.00'),
(20, 81, 7, 20, '2023-06-16 11:04:50', '200000.00'),
(21, 79, 7, 70, '2023-06-16 11:05:07', '700000.00'),
(22, 73, 7, 70, '2023-06-16 11:05:21', '3500000.00'),
(23, 77, 7, 15, '2023-06-16 11:05:36', '300000.00'),
(24, 68, 5, 25, '2023-06-16 11:05:59', '200000.00'),
(25, 48, 5, 20, '2023-06-16 11:06:15', '60000.00'),
(26, 79, 5, 30, '2023-06-16 11:06:34', '300000.00'),
(27, 73, 8, 12, '2023-06-16 11:07:29', '600000.00'),
(28, 67, 6, 40, '2023-06-16 11:08:24', '400000.00'),
(29, 64, 6, 40, '2023-06-16 11:08:45', '1000000.00'),
(30, 66, 5, 20, '2023-06-16 11:09:07', '300000.00'),
(31, 37, 11, 25, '2023-06-16 12:14:33', '625000.00'),
(32, 38, 11, 15, '2023-06-16 12:14:54', '300000.00'),
(33, 47, 11, 15, '2023-06-16 12:15:06', '75000.00'),
(34, 52, 11, 25, '2023-06-16 12:15:23', '125000.00'),
(35, 40, 11, 100, '2023-06-16 12:15:40', '700000.00'),
(36, 41, 11, 40, '2023-06-16 12:16:19', '320000.00'),
(37, 75, 9, 40, '2023-06-16 12:16:36', '8000000.00'),
(38, 70, 9, 10, '2023-06-16 12:17:06', '70000.00'),
(39, 71, 9, 20, '2023-06-16 12:17:43', '10000000.00'),
(40, 72, 9, 20, '2023-06-16 12:18:45', '2000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` datetime NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `address`, `dob`, `gender`, `image`) VALUES
(1, 'Olatunji', 'Abass', 'olatunjiabass01@gmail.com', '08143236834', '$2b$13$Sti.nDyxiQla/Fhb8Asn1e8zkzszvwlRZ.3hVoap5nmm5u4h.owvG', 'Anifalaje, Akobo, Ibadan', '1998-08-30 00:00:00', 'Male', 'users/1h032393l42166691279934465.jpg'),
(2, 'Godswill', 'Concept', 'godswilldonald1@gmail.com', '09166726711', '$2b$13$7bAWesyGBhQqIRWlZTZvOO7dSDwbpKx2sQnSiD0kioMb4oeJQzYeK', 'Akobo, Ibadan', '1998-08-30 00:00:00', 'Male', 'users/1h047ltgq19349598034593773.jpg'),
(3, 'Qozeem', 'Kaothar', 'qozeem01@gmail.com', '08143454718', '$2b$13$0d6Z7lyACUyyUQaYOiedluVDZbC9OF5sqHebZ8vjAVMhHCBSNacdK', 'Amuloko, Ibadan, Oyo, Nigeria', '2002-08-15 00:00:00', 'Female', 'users/1h04a8tku31636326024324246.jpg'),
(4, 'Ibrahim', 'Esther', 'anjy4christ@gmail.com', '08134428763', '$2b$13$XiwvRJtkaZm7qR7G5HsHi.erzVCBEwKe2lirOMUk3Ksy3P8rXeURe', 'Kolapo Ishola GRA, Akobo, Ibadan', '2000-04-09 00:00:00', 'Female', 'users/1h07r2gu493181240492977.jpg'),
(5, 'Layoke', 'Titilope', 'oyinlee01@gmail.com', '09155661643', '$2b$13$48XnAadQTrpd9/zkNUFzceWAuD4.H2f.oS1GDO5I5w7sTg3C7HXH.', 'Iwo road, Ibadan', '2004-08-03 00:00:00', 'Female', 'users/1h07sct1f5587784578813915.jpg'),
(6, 'Ojo', 'Grace', 'themmylade@gmail.com', '09036519576', '$2b$13$AP7t2UvdAsSl8ySvh/VUJOlQ7oQgzTb0lQ0/Iz/AbWgJFYj7S.BnG', 'Orogun, Ibadan', '1995-07-24 00:00:00', 'Female', 'users/1h07t235820673970385461837.jpg'),
(7, 'Olatunji', 'Faruq', 'olatunjifaruq01@gmail.com', '07059970568', '$2b$13$0DRK5vKLCdxDxQvOEIdijOO0N0N7/JutojaeQzNN7W3SZKsbwmC5m', 'Amuloko, Ibadan', '2005-11-10 00:00:00', 'Male', 'users/1h07to3j3010447946049827905.jpg'),
(8, 'Samuel', 'Perry', 'samuelaperry@gmail.com', '07041362578', '$2b$13$8djQPIRN4APPesYwCqasrOJVkJ1qhkZIJpiW/N3HcAeZrkbCRjcNG', 'Ikeja, Lagos, Nigria', '1992-06-08 00:00:00', 'Male', 'users/1h2dga2k38601160273983905.png'),
(9, 'Oyedeji', 'Usman', 'oyesquare@gmail.com', '09078124536', '$2b$13$2ptVkzzhlPR5EAc.7JD2OeHIamV2MCx4hf2eAlAlX.Fmy7/z0G2IO', 'Lagos, Nigria', '2001-06-08 00:00:00', 'Male', 'users/1h2dhkuf2048916354688169905.jpg'),
(10, 'Ojeniyi', 'Samuel', 'ojeniyisamuel@gmail.com', '07036363016', '$2b$13$kqpZLnGtIQO4XQ/WnP6fwuvtZooaW52SpJkZM88p3VuxY6A53E3Wu', 'Osogbo, Osun, Nigeria', '1996-06-08 00:00:00', 'Male', 'users/1h2dlpb1u7056893526733314.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `address`, `image`) VALUES
(1, 'Samsung Engineering Nig Ltd', 'info@samsung.com', '01-4604400', '39B, Adebayo Doherty Street, Off Admiralty Way, Lekki Phase 1, Lagos.', 'vendors/1h0a5kugt05915201610861276.png'),
(2, 'Nike Retail Services Ltd', 'customer.service@nike.com', '01-2770726', 'Ikeja City Mall, Alausa, Lagos', 'vendors/1h0a5uf9c21597468643344042.png'),
(3, 'Lawal & Sons', 'shop@lawalsons.com', '09078654310', 'Beere, Ibadan', 'vendors/1h0i5gtjv35138755049240733.jpg'),
(4, 'Apex wears', 'collection@apexshop.com', '08114235680', 'Mokola, Ibadan', 'vendors/1h0i5l7ia5550934860652035.jpg'),
(5, 'Diamond Apparel', 'stores@diamond.com', '08112131458', 'Ikeja, Lagos', 'vendors/1h0i5t2lt26046914851829306.jpg'),
(6, 'Child First Clothing', 'clothing@childfirst.com', '081452623541', 'Lekki, Lagos', 'vendors/1h0i62k097931288516821853.jpg'),
(7, 'Morgan Stanley Electronics', 'electronics@stmorgan.com', '07013164760', 'Lekki, Lagos', 'vendors/1h0i68cfr5486128357402278.jpg'),
(8, 'Sport Center Ltd', 'collection@sportcenter.com', '08021729284', 'Second Gate, Adamasingba, Ibadan', 'vendors/1h0i6l9ki3046092746775151.jpg'),
(9, 'Novel Solar Ltd', 'shop@novelsolar.com', '09023529284', 'Second Gate, Adamasingba, Ibadan', 'vendors/1h0i6ve9o02721297979048143.jpg'),
(10, 'Adebam Agro Limited', 'agric@adebamfarms.com', '08123213231', 'Airforce Detachment, Akobo, Ibadan', 'vendors/1h0i7ru9f6125049403645713.jpg'),
(11, 'Ayomide Couture', 'store@ayomides.com', '08112131415', 'Challenge, Ring road, Ibadan, Oyo State', 'vendors/1h31uikpg08474567431811342.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `vendor_id` (`vendor_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
