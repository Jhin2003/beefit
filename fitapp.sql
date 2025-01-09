-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2025 at 05:45 AM
-- Server version: 8.0.36
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `serving` varchar(45) DEFAULT NULL,
  `calories` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `serving`, `calories`) VALUES
(1, 'Artichoke', '1 artichoke (128 g)', '60 cal'),
(2, 'Arugula', '1 leaf (2 g)', '1 cal'),
(3, 'Asparagus', '1 spear (12 g)', '2 cal'),
(4, 'Aubergine', '1 aubergine (458 g)', '115 cal'),
(5, 'Beetroot', '1 beet (82 g)', '35 cal'),
(6, 'Bell Pepper', '1 pepper (73 g)', '15 cal'),
(7, 'Black Olives', '1 olive (2.7 g)', '2 cal'),
(8, 'Broccoli', '1 bunch (608 g)', '207 cal'),
(9, 'Brussels Sprouts', '1 sprout (19 g)', '8 cal'),
(10, 'Cabbage', '1 head (908 g)', '227 cal'),
(11, 'Capsicum', '1 pepper (45 g)', '12 cal'),
(12, 'Carrot', '1 carrot (61 g)', '25 cal'),
(13, 'Cauliflower', '1 floweret (13 g)', '3 cal'),
(14, 'Celery', '1 stalk (40 g)', '6 cal'),
(15, 'Chard', '1 leaf (48 g)', '9 cal'),
(16, 'Cherry Tomato', '1 cherry tomato (20 g)', '20 cal'),
(17, 'Chicory', '1 head (53 g)', '38 cal'),
(18, 'Chinese Cabbage', '1 head (840 g)', '134 cal'),
(19, 'Chives', '1 tbsp, chopped (3 g)', '1 cal'),
(20, 'Collard Greens', '1 cup, raw (36 g)', '12 cal'),
(21, 'Corn', '1 cup (154 g)', '562 cal'),
(22, 'Courgette', '1 courgette (196 g)', '33 cal'),
(23, 'Creamed Spinach', '1 cup (200 g)', '148 cal'),
(24, 'Cucumber', '1 cucumber (410 g)', '66 cal'),
(25, 'Eggplant', '1 eggplant (458 g)', '115 cal'),
(26, 'Endive', '1 head (513 g)', '87 cal'),
(27, 'Fennel', '1 bulb (234 g)', '73 cal'),
(28, 'Garlic', '1 clove (3 g)', '4 cal'),
(29, 'Gherkin', '1 gherkin (65 g)', '9 cal'),
(30, 'Gourd', '1 gourd (771 g)', '108 cal'),
(31, 'Green Beans', '1 cup (110 g)', '34 cal'),
(32, 'Green Olives', '1 olive (2.7 g)', '2 cal'),
(33, 'Green Onion', '1 green onion (15 g)', '5 cal'),
(34, 'Horseradish', '1 tbsp (15 g)', '7 cal'),
(35, 'Kale', '1 cup, chopped (67 g)', '33 cal'),
(36, 'Kohlrabi', '1 kohlrabi (400 g)', '108 cal'),
(37, 'Kumara', '1 kumara (130 g)', '112 cal'),
(38, 'Leek', '1 leek (89 g)', '54 cal'),
(39, 'Lettuce', '1 head (600 g)', '90 cal'),
(40, 'Mushrooms', '1 mushroom (5.4 g)', '1 cal'),
(41, 'Mustard Greens', '1 cup, chopped (56 g)', '15 cal'),
(42, 'Nori', '1 sheet (2.6 g)', '1 cal'),
(43, 'Okra', '1 pod (12 g)', '4 cal'),
(44, 'Olives', '1 olive (2.7 g)', '2 cal'),
(45, 'Onion', '1 onion (85 g)', '34 cal'),
(46, 'Parsnips', '1 parsnip (170 g)', '128 cal'),
(47, 'Peas', '1 cup (98 g)', '79 cal'),
(48, 'Pepper', '1 pepper (75 g)', '20 cal'),
(49, 'Potato', '1 potato (213 g)', '164 cal'),
(50, 'Pumpkin', '1 pumpkin (196 g)', '51 cal'),
(51, 'Radishes', '1 radish (4.5 g)', '1 cal'),
(52, 'Red Cabbage', '1 leaf (22 g)', '7 cal'),
(53, 'Rutabaga', '1 rutabaga (386 g)', '147 cal'),
(54, 'Shallots', '1 shallot (25 g)', '18 cal'),
(55, 'Spinach', '1 bunch (340 g)', '78 cal'),
(56, 'Squash', '1 squash (196 g)', '88 cal'),
(57, 'Sweet Potato', '1 potato (130 g)', '112 cal'),
(58, 'Tomato', '1 tomato (111 g)', '20 cal'),
(59, 'Turnip Greens', '1 turnip green (170 g)', '34 cal'),
(60, 'Turnips', '1 turnip (122 g)', '34 cal'),
(61, 'Wasabi', '1 root (169 g)', '184 cal'),
(62, 'Winter Squash', '1 squash (431 g)', '147 cal'),
(63, 'Zucchini', '1 zucchini (196 g)', '33 cal'),
(64, 'Acai', '1 oz. (28.35 g)', '20 cal'),
(65, 'Apple', '1 apple (182 g)', '95 cal'),
(66, 'Applesauce', '1 cup (246 g)', '167 cal'),
(67, 'Apricot', '1 apricot (35 g)', '17 cal'),
(68, 'Avocado', '1 avocado (200 g)', '320 cal'),
(69, 'Banana', '1 banana (125 g)', '111 cal'),
(70, 'Blackberries', '1 cup (144 g)', '62 cal'),
(71, 'Blood Oranges', '1 serving (140 g)', '70 cal'),
(72, 'Blueberries', '1 cup (148 g)', '84 cal'),
(73, 'Cantaloupe', '1 wedge (69 g)', '23 cal'),
(74, 'Cherries', '1 cherry (8 g)', '4 cal'),
(75, 'Clementine', '1 clementine (74 g)', '35 cal'),
(76, 'Cranberries', '1 cup (100 g)', '46 cal'),
(77, 'Currants', '1 cup (112 g)', '63 cal'),
(78, 'Custard Apple', '1 custard apple (135 g)', '136 cal'),
(79, 'Dates', '1 date (7.1 g)', '20 cal'),
(80, 'Figs', '1 fig (50 g)', '37 cal'),
(81, 'Fruit salad', '1 cup (249 g)', '125 cal'),
(82, 'Grapes', '1 cup (151 g)', '104 cal'),
(83, 'Greengage', '1 fruit (5 g)', '2 cal'),
(84, 'Guava', '1 guava (55 g)', '37 cal'),
(85, 'Jackfruit', '1 cup (151 g)', '143 cal'),
(86, 'Jujube', '1 oz. (28.35 g)', '22 cal'),
(87, 'Kiwi', '1 liwi (183 g)', '112 cal'),
(88, 'Lemon', '1 lemon (58 g)', '17 cal'),
(89, 'Lime', '1 lime (67 g)', '20 cal'),
(90, 'Lychees', '1 lychee (10 g)', '7 cal'),
(91, 'Mandarin Oranges', '1 mandarin orange (88 g)', '47 cal'),
(92, 'Mango', '1 mango (336 g)', '202 cal'),
(93, 'Minneola', '1 minneola (109 g)', '70 cal'),
(94, 'Mulberries', '1 cup (140 g)', '60 cal'),
(95, 'Nectarine', '1 nectarine (150 g)', '66 cal'),
(96, 'Olives', '1 olive (2.7 g)', '2 cal'),
(97, 'Orange', '1 orange (131 g)', '62 cal'),
(98, 'Papaya', '1 fruit (500 g)', '215 cal'),
(99, 'Passion Fruit', '1 passoin fruit (18 g)', '17 cal'),
(100, 'Peach', '1 peach (150 g)', '59 cal'),
(101, 'Pear', '1 pear (178 g)', '101 cal'),
(102, 'Persimmon', '1 fruit (25 g)', '32 cal'),
(103, 'Physalis', '1 berry (5 g)', '2 cal'),
(104, 'Pineapple', '1 pineapple (905 g)', '453 cal'),
(105, 'Plantains', '1 plantain (179 g)', '218 cal'),
(106, 'Plum', '1 plum (66 g)', '30 cal'),
(107, 'Pomegranate', '1 pomegranate (282 g)', '234 cal'),
(108, 'Quince', '1 quince (92 g)', '52 cal'),
(109, 'Raisins', '1 cup (145 g)', '434 cal'),
(110, 'Rambutan', '1 rambutan (9 g)', '7 cal'),
(111, 'Raspberries', '1 cup (123 g)', '64 cal'),
(112, 'Rhubarb', '1 stalk (51 g)', '11 cal'),
(113, 'Starfruit', '1 star fruit (91 g)', '28 cal'),
(114, 'Strawberries', '1 cup (152 g)', '49 cal'),
(115, 'Tamarind', '1 tamarind (2 g)', '5 cal'),
(116, 'Tangerine', '1 tangerine (88 g)', '47 cal'),
(117, 'Watermelon', '1 wedge (286 g)', '86 cal'),
(118, 'Baby Back Ribs', '1 serving (139 g)', '360 cal'),
(119, 'Bacon and Eggs', '1 serving (214 g)', '539 cal'),
(120, 'Baked Beans', '1 cup (260 g)', '244 cal'),
(121, 'BBQ Ribs', '1 rib (141 g)', '360 cal'),
(122, 'Beef Stew', '1 cup (196 g)', '186 cal'),
(123, 'Biryani', '1 cup (275 g)', '484 cal'),
(124, 'Black Pudding', '1 pudding (40 g)', '101 cal'),
(125, 'Black Rice', '1/2 cup (100 g)', '323 cal'),
(126, 'BLT', '1 item (240 g)', '593 cal'),
(127, 'Brown Rice', '1 cup (185 g)', '670 cal'),
(128, 'Burrito', '1 burrito (200 g)', '326 cal'),
(129, 'Butter Chicken', '1 tray (350 g)', '490 cal'),
(130, 'California Roll', '1 roll (35 g)', '33 cal'),
(131, 'Chicken Caesar Salad', '1 salad (309 g)', '392 cal'),
(132, 'Chicken Fried Steak', '1 steak (280 g)', '423 cal'),
(133, 'Chicken Marsala', '1 serving (2301 g)', '2209 cal'),
(134, 'Chicken Parmesan', '1 piece (227 g)', '250 cal'),
(135, 'Chicken Pot Pie', '1 pie (302 g)', '673 cal'),
(136, 'Chicken Tikka Masala', '1 serving (241 g)', '195 cal'),
(137, 'Chili con Carne', '1 cup (253 g)', '266 cal'),
(138, 'Chimichanga', '1 item (180 g)', '418 cal'),
(139, 'Cobb Salad', '1 serving (536 g)', '632 cal'),
(140, 'Collard Greens', '1 cup (45 g)', '13 cal'),
(141, 'Corn Dog', '1 item (175 g)', '438 cal'),
(142, 'Corned Beef Hash', '1 can (213 g)', '349 cal'),
(143, 'Cottage Pie', '1 pie (376 g)', '523 cal'),
(144, 'Dal', '1/2 cup (92 g)', '304 cal'),
(145, 'Deviled Eggs', '1/2 egg (31 g)', '62 cal'),
(146, 'Dim Sum', '1 piece (19 g)', '37 cal'),
(147, 'Dosa', '1 serving (435 g)', '287 cal'),
(148, 'Enchiladas', '1 enchilada (192 g)', '323 cal'),
(149, 'Fajita', '1 serving (248 g)', '290 cal'),
(150, 'Fish and Chips', '1 serving (300 g)', '585 cal'),
(151, 'Fried Rice', '1 serving (356 g)', '662 cal'),
(152, 'Fried Shrimp', '1 shrimp (27 g)', '75 cal'),
(153, 'Grilled Cheese Sandwich', '1 sandwich (136 g)', '392 cal'),
(154, 'Ham and Cheese Sandwich', '1 sandwich (146 g)', '352 cal'),
(155, 'Hummus', '1 cup (246 g)', '435 cal'),
(156, 'Jambalaya', '1 cup (250 g)', '250 cal'),
(157, 'Kebab', '1 kebab (360 g)', '774 cal'),
(158, 'Lasagne', '1 serving (215 g)', '284 cal'),
(159, 'Mac and Cheese', '1 serving (189 g)', '699 cal'),
(160, 'Macaroni and Cheese', '1 serving (189 g)', '699 cal'),
(161, 'Mashed Potatoes', '1 cup (210 g)', '174 cal'),
(162, 'Meat Pie', '1 pie (120 g)', '290 cal'),
(163, 'Meatloaf', '1 loaf (284 g)', '721 cal'),
(164, 'Naan', '1 bread (84 g)', '260 cal'),
(165, 'Orange Chicken', '1 serving (162 g)', '420 cal'),
(166, 'Pad Thai', '1 cup (250 g)', '375 cal'),
(167, 'Paella', '1/2 package (128 g)', '200 cal'),
(168, 'Paratha', '1 paratha (80 g)', '260 cal'),
(169, 'Pea Soup', '1 cup (253 g)', '190 cal'),
(170, 'Peanut Butter Sandwich', '1 sandwich (49 g)', '200 cal'),
(171, 'Peking Duck', '1/2 duck (178 g)', '401 cal'),
(172, 'Philly Cheese Steak', '1 sandwich (120 g)', '300 cal'),
(173, 'Pizza', '1 slice (102 g)', '272 cal'),
(174, 'Pork Chop', '1 chop (131 g)', '295 cal'),
(175, 'Potato Salad', '1/3 cup (95 g)', '136 cal'),
(176, 'Pulled Pork Sandwich', '1 sandwich (261 g)', '551 cal'),
(177, 'Ramen', '1 package, dry (85 g)', '380 cal'),
(178, 'Ravioli', '5 ravioli (66 g)', '134 cal'),
(179, 'Reuben Sandwich', '1 sandwich (308 g)', '641 cal'),
(180, 'Roast Beef', '1 slice (21 g)', '23 cal'),
(181, 'Roast Dinner', '1 slice (121 g)', '240 cal'),
(182, 'Samosa', '1 samosa (50 g)', '107 cal'),
(183, 'Sausage Roll', '1 roll (103 g)', '361 cal'),
(184, 'Sausage Rolls', '1 roll (34 g)', '101 cal'),
(185, 'Shepherds Pie', '1 pie (227 g)', '159 cal'),
(186, 'Shrimp Cocktail', '1 oz. (28 g)', '130 cal'),
(187, 'Sloppy Joe', '1/2 cup (142 g)', '101 cal'),
(188, 'Sloppy Joes', '1 bun (258 g)', '397 cal'),
(189, 'Spaghetti Bolognese', '1 serving (283 g)', '374 cal'),
(190, 'Spring Roll', '1 roll (140 g)', '350 cal'),
(191, 'Spring Rolls', '1 roll (140 g)', '350 cal'),
(192, 'Taco', '1 taco (98 g)', '213 cal'),
(193, 'Tandoori Chicken', '1 serving (175 g)', '198 cal'),
(194, 'Yorkshire Pudding', '1 pudding (15 g)', '83 cal'),
(195, 'Amaranth', '1 cup (193 g)', '716 cal'),
(196, 'Barley', '1 cup (157 g)', '556 cal'),
(197, 'Barley Groats', '1 cup (31 g)', '31 cal'),
(198, 'Brown Rice', '1 cup (195 g)', '757 cal'),
(199, 'Buckwheat', '1 cup (170 g)', '583 cal'),
(200, 'Buckwheat Groats', '1 cup (164 g)', '567 cal'),
(201, 'Corn Waffles', '1 waffle (40 g)', '110 cal'),
(202, 'Cornmeal', '1 cup (122 g)', '442 cal'),
(203, 'Cornstarch', '1 cup (128 g)', '488 cal'),
(204, 'Couscous', '1 cup (173 g)', '650 cal'),
(205, 'Cracker', '1 cracker (7 g)', '35 cal'),
(206, 'Durum Wheat Semolina', '1 tbsp (30 g)', '119 cal'),
(207, 'Flaxseed', '1 cup (168 g)', '897 cal'),
(208, 'Freekeh', '1 cup (160 g)', '832 cal'),
(209, 'Gluten', '1 oz. (28 g)', '104 cal'),
(210, 'Grissini', '1 grissini (5 g)', '20 cal'),
(211, 'Kamut', '1 cup (186 g)', '627 cal'),
(212, 'Millet', '1 cup (128 g)', '484 cal'),
(213, 'Millet Flour', '1 cup (140 g)', '521 cal'),
(214, 'Millet Gruel', '1 cup (174 g)', '80 cal'),
(215, 'Oat Bran', '1 cup (94 g)', '231 cal'),
(216, 'Pearl Barley', '1 cup (157 g)', '553 cal'),
(217, 'Polenta', '1 cup (150 g)', '549 cal'),
(218, 'Prawn Crackers', '1 cracker (3 g)', '16 cal'),
(219, 'Pretzel Sticks', '20 sticks (12 g)', '46 cal'),
(220, 'Quinoa', '1 cup (170 g)', '626 cal'),
(221, 'Rusk', '1 rusk (10 g)', '41 cal'),
(222, 'Rye Bran', '1 cup (150 g)', '422 cal'),
(223, 'Sago', '1 oz. (28 g)', '99 cal'),
(224, 'Savoury Biscuits', '40 grams (40 g)', '139 cal'),
(225, 'Shortbread', '1 cookie (19 g)', '95 cal'),
(226, 'Spelt', '1 cup (174 g)', '588 cal'),
(227, 'Spelt Bran', '1 cup (160 g)', '283 cal'),
(228, 'Spelt Semolina', '1 cup (167 g)', '601 cal'),
(229, 'Sunflower Seeds', '1 cup (140 g)', '818 cal'),
(230, 'Tortilla', '1 tortilla (197 g)', '467 cal'),
(231, 'Tortilla Chips', '20 chips (32 g)', '160 cal'),
(232, 'Wheat Bran', '1 cup (58 g)', '125 cal'),
(233, 'Wheat Germ', '1 cup (113 g)', '432 cal'),
(234, 'Wheat Gluten', '1 tsp (3 g)', '10 cal'),
(235, 'Wheat Semolina', '1 cup (167 g)', '601 cal'),
(236, 'Wheat Starch', '1 cup (110 g)', '386 cal'),
(237, 'Whole Grain Wheat', '1 cup (120 g)', '407 cal'),
(238, 'Wholegrain Oat', '1 cup (80 g)', '300 cal'),
(239, 'Almond Oil', '1 tbsp (14 ml)', '123 cal'),
(240, 'Apricot Kernel Oil', '1 tbsp (14 ml)', '124 cal'),
(241, 'Argan Oil', '1 tbsp (14 ml)', '125 cal'),
(242, 'Avocado Oil', '1 tbsp (14 ml)', '120 cal'),
(243, 'Babassu Oil', '1 tbsp (14 ml)', '124 cal'),
(244, 'Canola Oil', '1 tbsp (14 ml)', '124 cal'),
(245, 'Coconut Oil', '1 tbsp (14 ml)', '120 cal'),
(246, 'Corn Oil', '1 tbsp (15 ml)', '120 cal'),
(247, 'Cottonseed Oil', '1 tbsp (14 ml)', '123 cal'),
(248, 'Flaxseed Oil', '1 tbsp (14 ml)', '124 cal'),
(249, 'Grape Seed Oil', '1 tbsp (14 ml)', '124 cal'),
(250, 'Hazelnut Oil', '1 tbsp (14 ml)', '124 cal'),
(251, 'Linseed Oil', '1 tbsp (14 ml)', '117 cal'),
(252, 'Menhaden Oil', '1 tbsp (14 ml)', '128 cal'),
(253, 'Mustard Oil', '1 tbsp (14 ml)', '124 cal'),
(254, 'Oat Oil', '1 tbsp (14 ml)', '124 cal'),
(255, 'Olive Oil', '1 tbsp (15 ml)', '120 cal'),
(256, 'Palm Kernel Oil', '1 tbsp (14 ml)', '123 cal'),
(257, 'Palm Oil', '1 tbsp (14 ml)', '123 cal'),
(258, 'Peanut Oil', '1 tbsp (14 ml)', '120 cal'),
(259, 'Poppy Seed Oil', '1 tbsp (14 ml)', '124 cal'),
(260, 'Pumpkin Seed Oil', '1 tbsp (14 ml)', '123 cal'),
(261, 'Rice Bran Oil', '1 tbsp (14 ml)', '124 cal'),
(262, 'Safflower Oil', '1 tbsp (14 ml)', '120 cal'),
(263, 'Salmon Oil', '1 tbsp (14 ml)', '128 cal'),
(264, 'Sesame Oil', '1 tbsp (14 ml)', '124 cal'),
(265, 'Shea Oil', '1 tbsp (14 ml)', '124 cal'),
(266, 'Soy Oil', '1 tbsp (14 ml)', '123 cal'),
(267, 'Sunflower Oil', '1 tbsp (14 ml)', '124 cal'),
(268, 'Tomato Seed Oil', '1 tbsp (14 ml)', '124 cal'),
(269, 'Vegetable Oil', '1 tbsp (15 ml)', '120 cal'),
(270, 'Walnut Oil', '1 tbsp (14 ml)', '124 cal'),
(271, 'Wheat Germ Oil', '1 tbsp (14 ml)', '130 cal'),
(272, 'Alphabet Soup', '1 cup (248 g)', '62 cal'),
(273, 'Bean Stew', '1 cup (252 g)', '335 cal'),
(274, 'Beef Bouillon', '1 cup (240 g)', '7 cal'),
(275, 'Beef Noodle Soup', '1 cup (244 g)', '83 cal'),
(276, 'Beef Soup', '1 cup (213 g)', '70 cal'),
(277, 'Bouillon', '1 cup (244 g)', '39 cal'),
(278, 'Broccoli Cheese Soup', '1 can (303 g)', '264 cal'),
(279, 'Broccoli Soup', '1 cup (237 g)', '206 cal'),
(280, 'Cabbage Soup', '1 cup (245 g)', '69 cal'),
(281, 'Carrot Ginger Soup', '1 serving (381 g)', '95 cal'),
(282, 'Carrot Soup', '1 serving (381 g)', '95 cal'),
(283, 'Chicken Bouillon', '1 cup (241 g)', '10 cal'),
(284, 'Chicken Broth', '1 cup (244 g)', '39 cal'),
(285, 'Chicken Gumbo Soup', '1 cup (244 g)', '56 cal'),
(286, 'Chicken Noodle Soup', '1 cup (248 g)', '62 cal'),
(287, 'Chicken Stock', '1 cup (244 g)', '39 cal'),
(288, 'Chicken Vegetable Soup', '1 cup (248 g)', '77 cal'),
(289, 'Chicken with Rice Soup', '1 cup (243 g)', '58 cal'),
(290, 'Cream of Asparagus Soup', '1 cup (244 g)', '85 cal'),
(291, 'Cream of Broccoli Soup', '1 serving (310 g)', '140 cal'),
(292, 'Cream of Celery Soup', '1 cup (248 g)', '92 cal'),
(293, 'Cream of Chicken Soup', '1 cup (244 g)', '117 cal'),
(294, 'Cream of Mushroom Soup', '1 cup (248 g)', '97 cal'),
(295, 'Cream of Onion Soup', '1 cup (244 g)', '107 cal'),
(296, 'Cream of Potato Soup', '1 cup (244 g)', '73 cal'),
(297, 'Creamy Chicken Noodle Soup', '1 cup (245 g)', '56 cal'),
(298, 'French Onion Soup', '1 cup (243 g)', '56 cal'),
(299, 'Golden Mushroom Soup', '1 cup (248 g)', '161 cal'),
(300, 'Goulash', '1 serving (187 g)', '1887 cal'),
(301, 'Instant Ramen', '1 package (85 g)', '371 cal'),
(302, 'Lentil Soup', '1 cup (248 g)', '139 cal'),
(303, 'Lobster Bisque Soup', '1 cup (248 g)', '248 cal'),
(304, 'Meatball Soup', '1 cup (245 g)', '120 cal'),
(305, 'Minestrone', '1 cup (241 g)', '82 cal'),
(306, 'Mushroom Soup', '1 cup (244 g)', '85 cal'),
(307, 'Noodle Soup', '1 cup (244 g)', '83 cal'),
(308, 'Onion Soup', '1 cup (243 g)', '56 cal'),
(309, 'Oxtail Soup', '1 cup (244 g)', '68 cal'),
(310, 'Pea Soup', '1 cup (253 g)', '190 cal'),
(311, 'Potato Soup', '1 serving (240 g)', '192 cal'),
(312, 'Pumpkin Soup', '1 cup (245 g)', '71 cal'),
(313, 'Ramen', '1 package (85 g)', '371 cal'),
(314, 'Scotch Broth', '1 cup (241 g)', '80 cal'),
(315, 'Succotash', '1 cup (192 g)', '221 cal'),
(316, 'Thai Soup', '1 cup (245 g)', '147 cal'),
(317, 'Tomato Rice Soup', '1 cup (247 g)', '116 cal'),
(318, 'Tomato Soup', '1 cup (248 g)', '74 cal'),
(319, 'Vegetable Beef Soup', '1 cup (244 g)', '76 cal'),
(320, 'Vegetable Broth', '1 cup (235 g)', '12 cal'),
(321, 'Vegetable Soup', '1 cup (241 g)', '67 cal'),
(322, 'Vegetable Stock', '1 cup (235 g)', '12 cal'),
(323, 'Wedding Soup', '1 cup (245 g)', '130 cal'),
(324, 'Baskin-Robbins', '1 scoop (71 g)', '170 cal'),
(325, 'Ben and Jerry’s', '1 scoop (92 g)', '210 cal'),
(326, 'Butter Pecan Ice Cream', '1 scoop (113 g)', '280 cal'),
(327, 'Carvel', '1 cup (212 g)', '449 cal'),
(328, 'Chocolate Chip Ice Cream', '1 scoop (72 g)', '155 cal'),
(329, 'Chocolate Ice Cream', '1 scoop (72 g)', '156 cal'),
(330, 'Ciao Bella', '1 cup (220 g)', '240 cal'),
(331, 'Coffee Ice Cream', '1 scoop (72 g)', '170 cal'),
(332, 'Cold Stone Creamery', '1 scoop (142 g)', '329 cal'),
(333, 'Cookie Dough Ice Cream', '1/2 cup (65 g)', '130 cal'),
(334, 'Crunchie McFlurry', '1 mcflurry (183 g)', '318 cal'),
(335, 'Dairy Milk McFlurry', '1 mcflurry (183 g)', '340 cal'),
(336, 'Dippin Dots', '1 cup (170 g)', '381 cal'),
(337, 'Double Rainbow', '1 scoop (72 g)', '185 cal'),
(338, 'Drumsticks', '1 cone (141 g)', '360 cal'),
(339, 'French Vanilla Ice Cream', '1 scoop (72 g)', '145 cal'),
(340, 'Friendly’s', '1 scoop (66 g)', '140 cal'),
(341, 'Healthy Choice', '1 bar (64 g)', '80 cal'),
(342, 'Hot Fudge Sundae', '1 sundae (179 g)', '333 cal'),
(343, 'Ice Cream Sandwich', '1 bar (112 g)', '265 cal'),
(344, 'Ice Cream Sundae', '1 sundae (178 g)', '253 cal'),
(345, 'Ice Milk', '1 scoop (103 g)', '164 cal'),
(346, 'Magnolia', '1 scoop (72 g)', '166 cal'),
(347, 'Magnum', '1 magnum (86 g)', '258 cal'),
(348, 'Magnum Almond', '1 magnum (86 g)', '271 cal'),
(349, 'Magnum Double Caramel', '1 magnum (86 g)', '305 cal'),
(350, 'Magnum Double Chocolate', '1 magnum (86 g)', '327 cal'),
(351, 'Magnum Gold', '1 magnum (85 g)', '290 cal'),
(352, 'Magnum White', '1 magnum (86 g)', '255 cal'),
(353, 'McFlurry', '1 mcflurry (134 g)', '205 cal'),
(354, 'McFlurry Oreo', '1 mcflurry (183 g)', '340 cal'),
(355, 'Mini Milk', '1 mini milk (25 g)', '30 cal'),
(356, 'Mint Chocolate Chip Ice Cream', '1 scoop (72 g)', '172 cal'),
(357, 'Rocky Road Ice Cream', '1 scoop (113 g)', '290 cal'),
(358, 'Schwan’s', '1 scoop (72 g)', '177 cal'),
(359, 'Smarties McFlurry', '1 mcflurry (202 g)', '400 cal'),
(360, 'Snickers Ice Cream', '1 bar (50 g)', '180 cal'),
(361, 'Soft Serve', '1 cup (86 g)', '191 cal'),
(362, 'Solero', '1 solero (75 g)', '75 cal'),
(363, 'Strawberry Ice Cream', '1 scoop (72 g)', '170 cal'),
(364, 'Strawberry Sundae', '1 sundae (178 g)', '281 cal'),
(365, 'Sundae', '1 scoop (72 g)', '155 cal'),
(366, 'Turkey Hill', '1 sandwich (70 g)', '190 cal'),
(367, 'Vanilla Cone', '1 cone (142 g)', '230 cal'),
(368, 'Vanilla Ice Cream', '1 scoop (72 g)', '145 cal'),
(369, 'Cannelloni', '2 oz. (56 g)', '82 cal'),
(370, 'Capellini', '2 oz. (56 g)', '198 cal'),
(371, 'Cappelletti', '2 oz. (56 g)', '92 cal'),
(372, 'Cellophane Noodles', '1 cup (140 g)', '491 cal'),
(373, 'Cheese Tortellini', '1 cup (113 g)', '329 cal'),
(374, 'Dampfnudel', '1 dampfnudel (85 g)', '233 cal'),
(375, 'Dumpling Dough', '2 oz. (56 g)', '55 cal'),
(376, 'Durum Wheat Semolina', '2 oz. (56 g)', '222 cal'),
(377, 'Egg Noodles', '1 cup (38 g)', '146 cal'),
(378, 'Farfalle', '2 oz. (56 g)', '200 cal'),
(379, 'Fettuccine', '2 oz. (56 g)', '198 cal'),
(380, 'Fusilli', '2 oz. (56 g)', '197 cal'),
(381, 'Glass Noodles', '2 oz. (56 g)', '108 cal'),
(382, 'Lasagne Sheets', '1 sheet (21 g)', '57 cal'),
(383, 'Linguine', '2 oz. (56 g)', '200 cal'),
(384, 'Low Carb Pasta', '2 oz. (56 g)', '158 cal'),
(385, 'Macaroni', '1 cup (114 g)', '422 cal'),
(386, 'Manicotti', '2 oz. (56 g)', '200 cal'),
(387, 'Mostaccioli', '2 oz. (56 g)', '103 cal'),
(388, 'Orecchiette', '2 oz. (56 g)', '207 cal'),
(389, 'Orzo', '2 oz. (56 g)', '200 cal'),
(390, 'Penne', '2 oz. (56 g)', '197 cal'),
(391, 'Penne Rigate', '2 oz. (56 g)', '207 cal'),
(392, 'Pierogi', '3 pierogi (100 g)', '200 cal'),
(393, 'Ravioli', '2 oz. (56 g)', '43 cal'),
(394, 'Rigatoni', '2 oz. (56 g)', '198 cal'),
(395, 'Rotini', '2 oz. (56 g)', '198 cal'),
(396, 'Shells', '1 cup (85 g)', '300 cal'),
(397, 'Shirataki Noodles', '2 oz. (56 g)', '10 cal'),
(398, 'Soy Noodles', '2 oz. (56 g)', '121 cal'),
(399, 'Spaetzle', '2 oz. (56 g)', '206 cal'),
(400, 'Spaghetti', '2 oz. (56 g)', '207 cal'),
(401, 'Spinach Tortellini', '1 cup (102 g)', '320 cal'),
(402, 'Spirelli', '2 oz. (56 g)', '206 cal'),
(403, 'Tagliatelle', '2 oz. (56 g)', '207 cal'),
(404, 'Tortellini', '1 cup (113 g)', '329 cal'),
(405, 'Vermicelli', '2 oz. (56 g)', '206 cal'),
(406, 'Whole Grain Noodles', '2 oz. (56 g)', '194 cal'),
(407, 'Whole Grain Spaghetti', '2 oz. (56 g)', '197 cal'),
(408, 'Ziti', '2 oz. (56 g)', '197 cal'),
(409, 'BBQ Chicken Pizza', '1 slice (132 g)', '309 cal'),
(410, 'BBQ Pizza', '1 slice (140 g)', '314 cal'),
(411, 'Beef Pizza', '1 slice (235 g)', '714 cal'),
(412, 'Bianca Pizza', '1 slice (187 g)', '460 cal'),
(413, 'Buffalo Chicken Pizza', '1 slice (238 g)', '600 cal'),
(414, 'Calabrese Pizza', '1 slice (108 g)', '254 cal'),
(415, 'Calzone', '1 calzone (364 g)', '841 cal'),
(416, 'Capricciosa Pizza', '1 slice (74 g)', '192 cal'),
(417, 'Cheese Pizza', '1 slice (63 g)', '168 cal'),
(418, 'Chicken Pizza', '1 slice (132 g)', '309 cal'),
(419, 'Deep Dish Pizza', '1 slice (118 g)', '313 cal'),
(420, 'Dominos Philly Cheese Steak Pizza', '1 slice (159 g)', '356 cal'),
(421, 'Four Cheese Pizza', '1 slice (113 g)', '250 cal'),
(422, 'Goat Cheese Pizza', '1 slice (63 g)', '138 cal'),
(423, 'Grilled Pizza', '1 slice (124 g)', '280 cal'),
(424, 'Hawaiian Pizza', '1 slice (134 g)', '154 cal'),
(425, 'Margherita Pizza', '1 slice (63 g)', '173 cal'),
(426, 'Mozzarella Pizza', '1 slice (62 g)', '154 cal'),
(427, 'Mushroom Pizza', '1 slice (288 g)', '611 cal'),
(428, 'Napoli Pizza', '1 slice (123 g)', '248 cal'),
(429, 'New York Style Pizza', '1 slice (103 g)', '174 cal'),
(430, 'Pepperoni Pizza', '1 slice (71 g)', '181 cal'),
(431, 'Pizza Dough', '2 oz. (57 g)', '130 cal'),
(432, 'Pizza Hut Stuffed Crust Pizza', '1 slice (149 g)', '380 cal'),
(433, 'Pizza Hut Supreme Pizza', '1 slice (123 g)', '305 cal'),
(434, 'Pizza Rolls', '1 roll (14 g)', '35 cal'),
(435, 'Quattro Formaggi Pizza', '1 slice (133 g)', '330 cal'),
(436, 'Red Pepper Pizza', '1 slice (86 g)', '165 cal'),
(437, 'Salami Pizza', '1 slice (71 g)', '181 cal'),
(438, 'Sausage Pizza', '1 slice (72 g)', '177 cal'),
(439, 'Seafood Pizza', '1 slice (76 g)', '186 cal'),
(440, 'Shrimp Pizza', '1 slice (91 g)', '190 cal'),
(441, 'Sicilian Pizza', '1 slice (133 g)', '321 cal'),
(442, 'Spinach Feta Pizza', '1 slice (62 g)', '150 cal'),
(443, 'Spinach Pizza', '1 slice (62 g)', '145 cal'),
(444, 'Stuffed Crust Pizza', '1 slice (149 g)', '380 cal'),
(445, 'Tarte Flambée', '1 square (56 g)', '142 cal'),
(446, 'Thin Crust Pizza', '1 slice (60 g)', '157 cal'),
(447, 'Tuna Pizza', '1 slice (125 g)', '318 cal'),
(448, 'Vegetable Pizza', '1 slice (156 g)', '399 cal'),
(449, 'Vegetarian Pizza', '1 slice (156 g)', '399 cal'),
(450, 'Veggie Pizza', '1 slice (114 g)', '263 cal'),
(451, 'White Pizza', '1 slice (232 g)', '571 cal'),
(452, 'Acerola', '1 acerola (4.8 g)', '1 cal'),
(453, 'Asian Pear', '1 pear (178 g)', '75 cal'),
(454, 'Avocado', '1 avocado (200 g)', '320 cal'),
(455, 'Banana', '1 banana (125 g)', '111 cal'),
(456, 'Breadfruit', '1/4 breadfruit (96 g)', '99 cal'),
(457, 'Cantaloupe Melon', '1 wedge (69 g)', '23 cal'),
(458, 'Casaba Melon', '1 wedge (125 g)', '35 cal'),
(459, 'Cherimoya', '1 cherimoya (235 g)', '176 cal'),
(460, 'Dragon Fruit', '1 dragonfruit (200 g)', '120 cal'),
(461, 'Durian', '1 durian (602 g)', '885 cal'),
(462, 'Feijoa', '1 feijoa (42 g)', '23 cal'),
(463, 'Galia Melon', '1 melon (130 g)', '30 cal'),
(464, 'Grapefruit', '1/2 grapefruit (123 g)', '52 cal'),
(465, 'Guava', '1 guava (55 g)', '37 cal'),
(466, 'Honeydew', '1 wedge (125 g)', '45 cal'),
(467, 'Jackfruit', '1 cup (151 g)', '143 cal'),
(468, 'Kiwi', '1 kiwi (183 g)', '112 cal'),
(469, 'Kumquat', '1 kumquat (19 g)', '13 cal'),
(470, 'Lychee', '1 lychee (10 g)', '7 cal'),
(471, 'Mandarin Oranges', '1 madarin orange (90 g)', '48 cal'),
(472, 'Mango', '1 mango (336 g)', '202 cal'),
(473, 'Mangosteen', '1 serving (80 g)', '58 cal'),
(474, 'Maracuya', '1 maracuya (18 g)', '17 cal'),
(475, 'Maraschino Cherries', '1 cherry (5 g)', '8 cal'),
(476, 'Muskmelon', '1 wedge (69 g)', '23 cal'),
(477, 'Noni', '1 oz. (28.4 g)', '15 cal'),
(478, 'Passion Fruit', '1 passion fruit (18 g)', '17 cal'),
(479, 'Pineapple', '1 pineapple (905 g)', '453 cal'),
(480, 'Pink Grapefruit', '1/2 grapefruit (123 g)', '52 cal'),
(481, 'Plantain', '1 plantain (179 g)', '218 cal'),
(482, 'Pomegranate', '1 pomegranate (282 g)', '234 cal'),
(483, 'Pomelo', '1 pomelo (609 g)', '231 cal'),
(484, 'Prickly Pear', '1 pad, peeled (19 g)', '8 cal'),
(485, 'Rambutan', '1 rambutan (9 g)', '7 cal'),
(486, 'Sapodilla', '1 sapodilla (170 g)', '141 cal'),
(487, 'Soursop Fruit', '1 soursop fruit (625 g)', '413 cal'),
(488, 'Star Fruit', '1 starfruit (91 g)', '28 cal'),
(489, 'Tamarind', '1 tamarind (2 g)', '5 cal'),
(490, 'Watermelon', '1 wedge (286 g)', '86 cal'),
(491, 'Arby’s Grand Turkey Club', '1 sandwich (233 g)', '489 cal'),
(492, 'Arby’s Reuben', '1 sandwich (308 g)', '641 cal'),
(493, 'Arby’s Roast Beef Classic', '1 burger (154 g)', '360 cal'),
(494, 'Arby’s Roast Beef Max', '1 burger (154 g)', '360 cal'),
(495, 'BBQ Rib', '1 rib (67 g)', '142 cal'),
(496, 'Bean Burrito', '1 burrito (190 g)', '380 cal'),
(497, 'Big N’ Tasty', '1 sandwich (232 g)', '517 cal'),
(498, 'Bratwurst', '1 piece (85 g)', '283 cal'),
(499, 'Burger King Angry Whopper', '1 burger (290 g)', '740 cal'),
(500, 'Burger King Double Whopper', '1 burger (374 g)', '894 cal'),
(501, 'Burger King Double Whopper with Cheese', '1 sandwich (399 g)', '994 cal'),
(502, 'Burger King Original Chicken Sandwich', '1 sandwich (219 g)', '659 cal'),
(503, 'Burger King Premium Alaskan Fish Sandwich', '1 burger (228 g)', '591 cal'),
(504, 'Burger King Triple Whopper', '1 burger (547 g)', '1471 cal'),
(505, 'Burger King Whopper', '1 burger (291 g)', '672 cal'),
(506, 'Burger King Whopper Jr.', '1 burger (148 g)', '346 cal'),
(507, 'Burger King Whopper with Cheese', '1 burger (315 g)', '759 cal'),
(508, 'Cheeseburger', '1 burger (156 g)', '410 cal'),
(509, 'Chicken Breast', '1 piece (71 g)', '116 cal'),
(510, 'Chicken Fajita', '1 sandwich (222 g)', '326 cal'),
(511, 'Chicken McNuggets', '1 nugget (16 g)', '48 cal'),
(512, 'Chicken Nuggets', '1 piece (20 g)', '59 cal'),
(513, 'Chicken Pizziola', '1 sandwich (320 g)', '451 cal'),
(514, 'Chicken Sandwich', '1 sandwich (170 g)', '410 cal'),
(515, 'Chicken Teriyaki Sandwich', '1 sandwich (266 g)', '367 cal'),
(516, 'Chicken Wings', '1 piece (29 g)', '94 cal'),
(517, 'Chop Suey', '1 serving (340 g)', '585 cal'),
(518, 'Curly Fries', '1 serving (128 g)', '398 cal'),
(519, 'Double Cheeseburger', '1 burger (155 g)', '414 cal'),
(520, 'Egg Roll', '1 roll (80 g)', '200 cal'),
(521, 'Falafel', '1 patty (17 g)', '57 cal'),
(522, 'Filet-o-Fish', '1 sandwich (142 g)', '400 cal'),
(523, 'Fish and Chips', '1 serving (300 g)', '585 cal'),
(524, 'Fish Sandwich', '1 sandwich (158 g)', '431 cal'),
(525, 'French Fries', '1 serving (71 g)', '222 cal'),
(526, 'Grilled Chicken Salad', '1 salad (305 g)', '268 cal'),
(527, 'Ham Sandwich', '1 sandwich (146 g)', '352 cal'),
(528, 'Hamburger', '1 sandwich (110 g)', '279 cal'),
(529, 'Hot Dog', '1 hot dog (116 g)', '312 cal'),
(530, 'Italian BMT', '1 sandwich (224 g)', '410 cal'),
(531, 'Lasagna', '1 piece (130 g)', '172 cal'),
(532, 'McDonald’s Big Mac', '1 burger (219 g)', '561 cal'),
(533, 'McDonald’s Cheeseburger', '1 sandwich (114 g)', '300 cal'),
(534, 'McDonald’s Chicken Nuggets', '1 nugget (16 g)', '48 cal'),
(535, 'McDonald’s Double Cheeseburger', '1 burger (155 g)', '437 cal'),
(536, 'McDonald’s Filet-o-Fish', '1 sandwich (142 g)', '391 cal'),
(537, 'McDonald’s McChicken', '1 burger (143 g)', '359 cal'),
(538, 'McDonald’s McDouble', '1 burger (160 g)', '403 cal'),
(539, 'McDonald’s McMuffi Egg', '1 burger (129 g)', '290 cal'),
(540, 'McDonald’s McRib', '1 sandwich (170 g)', '451 cal'),
(541, 'McDonald’s Mighty Wings', '1 wing (31 g)', '95 cal'),
(542, 'McRib', '1 sandwich (170 g)', '451 cal'),
(543, 'Meatball Sandwich', '1 sandwich (299 g)', '481 cal'),
(544, 'Nachos with Cheese', '10 nachos (188 g)', '575 cal'),
(545, 'Onion Rings', '1 ring (6.5 g)', '25 cal'),
(546, 'Poutine', '1 serving (225 g)', '511 cal'),
(547, 'Smoked Salmon', '1 oz. (28.35 g)', '44 cal'),
(548, 'Spicy Italian', '1 sandwich (219 g)', '480 cal'),
(549, 'Subway Club Sandwich', '1 sandwich (238 g)', '312 cal'),
(550, 'Tortilla Wrap', '1 wrap (63 g)', '171 cal'),
(551, 'Tuna', '1 oz. (28.35 g)', '24 cal'),
(552, 'Turkey', '1 oz. (28.35 g)', '29 cal'),
(553, 'Veggie Burger', '1 burger (215 g)', '389 cal'),
(554, 'Veggie Delight', '1 sandwich (166 g)', '229 cal'),
(555, 'Veggie Patty', '1 sandwich (247 g)', '963 cal'),
(556, 'Wendy’s Baconator', '1 burger (276 g)', '839 cal'),
(557, 'Wendy’s Jr. Bacon Cheeseburger', '1 burger (161 g)', '420 cal'),
(558, 'Wendy’s Jr. Cheeseburger', '1 burger (129 g)', '290 cal'),
(559, 'Wendy’s Son of Baconator', '1 burger (218 g)', '700 cal'),
(560, 'Whopper', '1 burger (291 g)', '672 cal'),
(561, 'Zinger', '1 sandwich (202 g)', '517 cal'),
(562, 'Zinger Burger', '1 sandwich (202 g)', '517 cal');

-- --------------------------------------------------------

--
-- Table structure for table `meal_selections`
--

CREATE TABLE `meal_selections` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `meal_type` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `meal_selections`
--

INSERT INTO `meal_selections` (`id`, `user_id`, `food_id`, `meal_type`, `date`, `created_at`) VALUES
(1624, 6, 14, 'breakfast', '2025-01-05', '2025-01-05 11:46:15'),
(1627, 6, 15, 'breakfast', '2025-01-05', '2025-01-05 11:46:24'),
(1631, 3, 14, 'lunch', '2025-01-05', '2025-01-05 12:31:55'),
(1633, 3, 13, 'breakfast', '2025-01-06', '2025-01-05 12:32:05'),
(1634, 3, 14, 'lunch', '2025-01-06', '2025-01-05 12:32:05'),
(1639, 3, 15, 'breakfast', '2025-01-05', '2025-01-05 12:32:14'),
(1642, 3, 16, 'breakfast', '2025-01-05', '2025-01-05 12:32:18'),
(1652, 3, 424, 'lunch', '2025-01-06', '2025-01-05 12:32:45'),
(1654, 3, 548, 'breakfast', '2025-01-07', '2025-01-05 12:32:55'),
(1657, 3, 40, 'breakfast', '2025-01-07', '2025-01-05 12:33:12'),
(1658, 3, 509, 'lunch', '2025-01-07', '2025-01-05 12:33:12'),
(1659, 3, 437, 'dinner', '2025-01-07', '2025-01-05 12:33:12'),
(1660, 3, 152, 'breakfast', '2025-01-05', '2025-01-05 12:33:48'),
(1663, 3, 98, 'breakfast', '2025-01-05', '2025-01-05 12:34:05'),
(1664, 3, 15, 'lunch', '2025-01-05', '2025-01-05 12:34:05'),
(1670, 3, 465, 'lunch', '2025-01-05', '2025-01-05 12:34:33'),
(1672, 3, 21, 'breakfast', '2025-01-05', '2025-01-05 12:34:41'),
(1677, 3, 53, 'dinner', '2025-01-05', '2025-01-05 12:34:51'),
(1678, 3, 42, 'breakfast', '2025-01-06', '2025-01-05 12:35:03'),
(1681, 3, 87, 'breakfast', '2025-01-06', '2025-01-05 12:35:12'),
(1686, 3, 393, 'dinner', '2025-01-06', '2025-01-05 12:35:42'),
(1687, 3, 14, 'breakfast', '2025-01-08', '2025-01-05 12:36:02'),
(1688, 3, 459, 'lunch', '2025-01-08', '2025-01-05 12:36:02'),
(1689, 3, 530, 'dinner', '2025-01-08', '2025-01-05 12:36:02'),
(1690, 3, 363, 'breakfast', '2025-01-08', '2025-01-05 12:36:27'),
(1691, 3, 12, 'lunch', '2025-01-08', '2025-01-05 12:36:27'),
(1692, 3, 528, 'dinner', '2025-01-08', '2025-01-05 12:36:27'),
(1693, 3, 8, 'breakfast', '2025-01-09', '2025-01-05 12:36:51'),
(1694, 3, 117, 'lunch', '2025-01-09', '2025-01-05 12:36:51'),
(1695, 3, 76, 'dinner', '2025-01-09', '2025-01-05 12:36:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(2, 'miguellayos', '$2y$10$0dY2.h.zONiHMehAZTWhHe2cchBDizlJjgktZLoOucsA9dvx4cH.u'),
(3, 'james', '$2y$10$z7f77cHdudNcir440FBcLex73p081BDp70NcpniaIWZGvdpjQqj3m'),
(5, '_jsfcmt', '$2y$10$URDkdxpzTnOpqwxwR2i6suoSM/XcfWU0A4jdfB.vYi6jbWriv2e5S'),
(6, 'miguel2003', '$2y$10$JvE6mY1QWuMoKia4q39MjezRThKtz06DyG2e0QFGiiYS5vTpdaMuy');

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `duration_days` int NOT NULL,
  `description` text,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workout_plans`
--

INSERT INTO `workout_plans` (`id`, `title`, `duration_days`, `description`, `image_path`) VALUES
(1, 'Beginner Strength Training', 30, 'A 30-day program designed for beginners to build strength and endurance.', '/ID1.jpg'),
(2, 'Advanced Cardio Blast', 45, 'An intensive 45-day cardio regimen aimed at enhancing cardiovascular fitness.', '/ID2.jpg'),
(3, 'Yoga for Flexibility', 60, 'A 60-day yoga sequence focusing on improving flexibility and balance.', '/ID3.jpg'),
(4, 'Muscle Building Program', 60, 'A 60-day program focused on increasing muscle mass through strength training.', '/ID4.jpg'),
(5, 'Cardio Kickstart', 30, 'A 30-day cardio-focused plan designed to boost cardiovascular fitness and endurance.', '/ID5.jpg'),
(6, 'Flexibility and Balance', 45, 'A 45-day regimen combining yoga and Pilates to enhance flexibility and balance.', '/ID6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `workout_schedule`
--

CREATE TABLE `workout_schedule` (
  `id` int NOT NULL,
  `workout_plan_id` int DEFAULT NULL,
  `day_number` int DEFAULT NULL,
  `activity_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workout_schedule`
--

INSERT INTO `workout_schedule` (`id`, `workout_plan_id`, `day_number`, `activity_description`) VALUES
(1, 1, 1, 'Full-body workout focusing on compound movements.'),
(2, 1, 2, 'Rest day with light stretching exercises.'),
(3, 1, 3, 'Upper body strength training with dumbbells.'),
(4, 1, 4, 'Lower body workout targeting legs and glutes.'),
(5, 1, 5, 'Core strengthening exercises and stability work.'),
(6, 1, 6, 'Rest day with optional light cardio.'),
(7, 1, 7, 'Full-body workout with emphasis on form and technique.'),
(8, 2, 1, 'High-intensity interval training (HIIT) session.'),
(9, 2, 2, 'Steady-state cardio on the treadmill for 45 minutes.'),
(10, 2, 3, 'Circuit training combining strength and cardio exercises.'),
(11, 2, 4, 'Outdoor running session with interval sprints.'),
(12, 2, 5, 'Cycling class focusing on endurance.'),
(13, 2, 6, 'Rest day with optional yoga for recovery.'),
(14, 2, 7, 'Swimming laps with emphasis on speed and technique.'),
(15, 3, 1, 'Morning yoga session focusing on hamstring flexibility.'),
(16, 3, 2, 'Evening yoga with emphasis on hip openers.'),
(17, 3, 3, 'Sun Salutation flow to improve overall flexibility.'),
(18, 3, 4, 'Restorative yoga session for deep stretching.'),
(19, 3, 5, 'Vinyasa flow targeting spinal mobility.'),
(20, 3, 6, 'Rest day with meditation and breathing exercises.'),
(21, 3, 7, 'Power yoga session to build strength and flexibility.'),
(22, 4, 1, 'Upper body strength training focusing on compound movements.'),
(23, 4, 2, 'Lower body workout targeting legs and glutes.'),
(24, 4, 3, 'Rest day with light stretching exercises.'),
(25, 4, 4, 'Core strengthening exercises and stability work.'),
(26, 4, 5, 'Full-body workout with emphasis on form and technique.'),
(27, 4, 6, 'Rest day with optional light cardio.'),
(28, 4, 7, 'Upper body strength training with dumbbells.'),
(29, 5, 1, 'High-intensity interval training (HIIT) session.'),
(30, 5, 2, 'Steady-state cardio on the treadmill for 30 minutes.'),
(31, 5, 3, 'Circuit training combining strength and cardio exercises.'),
(32, 5, 4, 'Outdoor running session with interval sprints.'),
(33, 5, 5, 'Cycling class focusing on endurance.'),
(34, 5, 6, 'Rest day with optional yoga for recovery.'),
(35, 5, 7, 'Swimming laps with emphasis on speed and technique.'),
(36, 6, 1, 'Morning yoga session focusing on hamstring flexibility.'),
(37, 6, 2, 'Pilates class emphasizing core strength and balance.'),
(38, 6, 3, 'Sun Salutation flow to improve overall flexibility.'),
(39, 6, 4, 'Restorative yoga session for deep stretching.'),
(40, 6, 5, 'Vinyasa flow targeting spinal mobility.'),
(41, 6, 6, 'Rest day with meditation and breathing exercises.'),
(42, 6, 7, 'Power yoga session to build strength and flexibility.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_selections`
--
ALTER TABLE `meal_selections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_selections_ibfk_1` (`user_id`),
  ADD KEY `meal_selections_ibfk_2` (`food_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workout_schedule`
--
ALTER TABLE `workout_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workout_plan_id` (`workout_plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=563;

--
-- AUTO_INCREMENT for table `meal_selections`
--
ALTER TABLE `meal_selections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1696;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workout_schedule`
--
ALTER TABLE `workout_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meal_selections`
--
ALTER TABLE `meal_selections`
  ADD CONSTRAINT `meal_selections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `meal_selections_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `workout_schedule`
--
ALTER TABLE `workout_schedule`
  ADD CONSTRAINT `workout_schedule_ibfk_1` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
