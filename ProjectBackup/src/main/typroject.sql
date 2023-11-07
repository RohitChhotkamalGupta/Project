-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 01, 2023 at 01:37 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `typroject`
--

-- --------------------------------------------------------

--
-- Table structure for table `formdetails`
--

DROP TABLE IF EXISTS `formdetails`;
CREATE TABLE IF NOT EXISTS `formdetails` (
  `formcreater` varchar(50) DEFAULT NULL,
  `formname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Table structure for table `responce`
--

DROP TABLE IF EXISTS `responce`;
CREATE TABLE IF NOT EXISTS `responce` (
  `formname` varchar(50) DEFAULT NULL,
  `formcreator` varchar(50) DEFAULT NULL,
  `quizattempter` varchar(50) DEFAULT NULL,
  `responce` varchar(1500) DEFAULT NULL,
  `marks` varchar(59) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
CREATE TABLE IF NOT EXISTS `userdetails` (
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



