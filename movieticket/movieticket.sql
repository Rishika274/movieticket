-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3309
-- Generation Time: Jan 03, 2023 at 04:33 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `addmovie`
--

CREATE TABLE `addmovie` (
  `name` varchar(50) NOT NULL,
  `theatrename` varchar(50) DEFAULT NULL,
  `releasedate` varchar(15) DEFAULT NULL,
  `director` varchar(20) NOT NULL,
  `actor` varchar(30) NOT NULL,
  `actress` varchar(30) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addmovie`
--

INSERT INTO `addmovie` (`name`, `theatrename`, `releasedate`, `director`, `actor`, `actress`, `description`, `image`) VALUES
('Bhediya', 'Vaibhav Multiplex', '2022-11-25', 'Amar Kaushik', 'Varun Dhawan', 'Kriti Sanon', 'Must watch movie.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/bhediya.jpg'),
('Brahmastra', 'Cinepolis VR', '2022-09-09', 'Ayan Mukerji', 'Ranbir Kapoor', 'Alia Bhatt', 'Greate movie with a lot of VFX.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/Brahmastra.webp'),
('Drishyam2', ' Vaibhav Multiplex', '2022-11-18', 'Jeethu Joseph ', 'Ajay Devgn', 'Tabbu', 'Greate movie with a murder story', 'C:/xampp/tomcat/webapps/movieticket/addedimages/drishyam-2.jpg'),
('Jana Gana Mana', 'Samdhadiya', '2022-04-28', ' Dijo Jose Antony', 'Prithviraj Sukumaran', ' Mamta Mohandas', 'movie on a professors murder.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/jana gana mana.jpeg'),
('Kantara', 'Samdhadiya', '2022-09-30', 'Rishab Shetty', 'Rishab Shetty', 'Sapthami Gowda', 'Must watch movie.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/kantara.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `addtheatres`
--

CREATE TABLE `addtheatres` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `contactNumber` varchar(20) DEFAULT NULL,
  `addServices` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addtheatres`
--

INSERT INTO `addtheatres` (`id`, `name`, `email`, `address`, `city`, `state`, `zip`, `contactNumber`, `addServices`, `image`) VALUES
(1, 'Vaibhav Multiplex', 'vaibhavmultiplex@gmail.com', 'Behind Lotus Mall Nagpur', 'Nagpur', 'Maharashtra', '480106', '8349541179', 'We provide quality services.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/vaibhavmultiplex.webp'),
(2, 'Samdhadiya', 'samdhadiya@gmail.com', 'Near TIT Jabalpur', 'Jabalpur', 'Madhya Pradesh', '482002', '7470538276', 'We provide all facilites here.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/samdhadiya.jpg'),
(3, 'Cinepolis VR', 'cinepolis@gmail.com', 'West Nagar Sausar', 'Sausar', 'Madhya Pradesh', '480105', '8349541179', 'We provide quality services.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/cinepolis.jpg'),
(4, 'Dolby Theatre', 'dolby@gmail.com', 'ITI Mahotal Jabalpur', 'Jabalpur', 'Madhya Pradesh', '480106', '7470538276', 'We provide all facilites here.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/dolby.webp'),
(5, 'AMC Theatre', 'amc@gmail.com', 'Near Railway Station Nagpur', 'Nagpur', 'Maharashtra', '480105', '8349541179', 'We provide quality services.', 'C:/xampp/tomcat/webapps/movieticket/addedimages/amctheatre.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `adminsignin`
--

CREATE TABLE `adminsignin` (
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminsignin`
--

INSERT INTO `adminsignin` (`name`, `email`, `password`) VALUES
('Rushika Kalambe', 'kalamberushika@gmail.com', 'Rushika@1'),
('Prajwal Kale', 'prajwalkale2709@gmail.com', 'Prajwal@1');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `name`, `email`, `password`) VALUES
(1, 'Prajwal Kale', 'prajwalkale2709@gmail.com', 'Prajwal21'),
(2, 'Rushika Kalambe', 'kalamberushika@gmail.com', 'Rushika@1'),
(3, 'New Project', 'newproject@gmail.com', 'Newproject@1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addmovie`
--
ALTER TABLE `addmovie`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addtheatres`
--
ALTER TABLE `addtheatres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminsignin`
--
ALTER TABLE `adminsignin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addtheatres`
--
ALTER TABLE `addtheatres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
