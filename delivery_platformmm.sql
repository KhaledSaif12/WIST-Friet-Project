-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 10:47 PM
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
-- Database: `delivery_platformmm`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `addresslink` text NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'icon-chart-bar', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'icon-server', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'icon-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'icon-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'icon-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'icon-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'icon-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 7, 'Helpers', 'icon-cogs', '', NULL, '2024-08-05 10:01:12', '2024-08-05 10:01:12'),
(9, 8, 8, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2024-08-05 10:01:12', '2024-08-05 10:01:12'),
(10, 8, 9, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2024-08-05 10:01:12', '2024-08-05 10:01:12'),
(11, 8, 10, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2024-08-05 10:01:12', '2024-08-05 10:01:12'),
(12, 8, 11, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2024-08-05 10:01:12', '2024-08-05 10:01:12'),
(13, 0, 12, 'Api tester', 'icon-sliders-h', 'api-tester', NULL, '2024-08-05 10:05:53', '2024-08-05 10:05:53'),
(14, 0, 12, 'Users', 'icon-file', 'users', NULL, '2024-08-05 10:08:22', '2024-08-05 10:08:22'),
(15, 0, 12, 'Addresses', 'icon-file', 'addresses', NULL, '2024-08-06 12:49:57', '2024-08-06 12:49:57'),
(16, 0, 12, 'Categories', 'icon-file', 'categories', NULL, '2024-08-06 12:51:17', '2024-08-06 12:51:17'),
(17, 0, 12, 'Farms', 'icon-file', 'farms', NULL, '2024-08-06 12:51:48', '2024-08-06 12:51:48'),
(18, 0, 12, 'Products', 'icon-file', 'products', NULL, '2024-08-06 12:52:29', '2024-08-06 12:52:29'),
(19, 0, 12, 'Seasons', 'icon-file', 'seasons', NULL, '2024-08-06 12:52:59', '2024-08-06 12:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `input` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"PnVs0zLqcs0ez4IJ7EbNwlmJppQ6J5y55wNRVTUz\",\"username\":\"admin\",\"password\":\"*****-filtered-out-*****\"}', '2024-08-06 11:49:56', '2024-08-06 11:49:56'),
(2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:49:57', '2024-08-06 11:49:57'),
(3, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:50:36', '2024-08-06 11:50:36'),
(4, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:50:52', '2024-08-06 11:50:52'),
(5, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-06 11:50:57', '2024-08-06 11:50:57'),
(6, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:00', '2024-08-06 11:51:00'),
(7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:02', '2024-08-06 11:51:02'),
(8, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:09', '2024-08-06 11:51:09'),
(9, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:11', '2024-08-06 11:51:11'),
(10, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:14', '2024-08-06 11:51:14'),
(11, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:16', '2024-08-06 11:51:16'),
(12, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:18', '2024-08-06 11:51:18'),
(13, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:25', '2024-08-06 11:51:25'),
(14, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:29', '2024-08-06 11:51:29'),
(15, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:45', '2024-08-06 11:51:45'),
(16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:46', '2024-08-06 11:51:46'),
(17, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:51:53', '2024-08-06 11:51:53'),
(18, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:53:01', '2024-08-06 11:53:01'),
(19, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:53:15', '2024-08-06 11:53:15'),
(20, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 11:53:20', '2024-08-06 11:53:20'),
(21, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 11:53:21', '2024-08-06 11:53:21'),
(22, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:54:14', '2024-08-06 11:54:14'),
(23, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2024-08-06 11:54:19', '2024-08-06 11:54:19'),
(24, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:54:29', '2024-08-06 11:54:29'),
(25, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:54:41', '2024-08-06 11:54:41'),
(26, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:56:41', '2024-08-06 11:56:41'),
(27, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:56:56', '2024-08-06 11:56:56'),
(28, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 11:57:01', '2024-08-06 11:57:01'),
(29, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 12:01:10', '2024-08-06 12:01:10'),
(30, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:02:12', '2024-08-06 12:02:12'),
(31, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:02:15', '2024-08-06 12:02:15'),
(32, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:04:00', '2024-08-06 12:04:00'),
(33, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:04:07', '2024-08-06 12:04:07'),
(34, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:05:39', '2024-08-06 12:05:39'),
(35, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:11:49', '2024-08-06 12:11:49'),
(36, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:37', '2024-08-06 12:12:37'),
(37, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:39', '2024-08-06 12:12:39'),
(38, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:42', '2024-08-06 12:12:42'),
(39, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:42', '2024-08-06 12:12:42'),
(40, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:43', '2024-08-06 12:12:43'),
(41, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:43', '2024-08-06 12:12:43'),
(42, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:43', '2024-08-06 12:12:43'),
(43, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:44', '2024-08-06 12:12:44'),
(44, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:44', '2024-08-06 12:12:44'),
(45, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:45', '2024-08-06 12:12:45'),
(46, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:45', '2024-08-06 12:12:45'),
(47, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:46', '2024-08-06 12:12:46'),
(48, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:46', '2024-08-06 12:12:46'),
(49, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:47', '2024-08-06 12:12:47'),
(50, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:47', '2024-08-06 12:12:47'),
(51, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:48', '2024-08-06 12:12:48'),
(52, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:48', '2024-08-06 12:12:48'),
(53, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:49', '2024-08-06 12:12:49'),
(54, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:49', '2024-08-06 12:12:49'),
(55, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:50', '2024-08-06 12:12:50'),
(56, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:50', '2024-08-06 12:12:50'),
(57, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:12:51', '2024-08-06 12:12:51'),
(58, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:13:00', '2024-08-06 12:13:00'),
(59, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:13:36', '2024-08-06 12:13:36'),
(60, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:14:54', '2024-08-06 12:14:54'),
(61, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-06 12:15:25', '2024-08-06 12:15:25'),
(62, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-06 12:15:28', '2024-08-06 12:15:28'),
(63, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 12:15:31', '2024-08-06 12:15:31'),
(64, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 12:15:38', '2024-08-06 12:15:38'),
(65, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:15:40', '2024-08-06 12:15:40'),
(66, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 12:20:59', '2024-08-06 12:20:59'),
(67, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:21:11', '2024-08-06 12:21:11'),
(68, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Products\",\"icon\":\"icon-cannabis\",\"uri\":\"\\/admin\\/products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:21:37', '2024-08-06 12:21:37'),
(69, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:21:38', '2024-08-06 12:21:38'),
(70, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:21:46', '2024-08-06 12:21:46'),
(71, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:21:54', '2024-08-06 12:21:54'),
(72, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2024-08-06 12:21:59', '2024-08-06 12:21:59'),
(73, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"search_terms\":null,\"title\":\"Products\",\"icon\":\"icon-cannabis\",\"uri\":\"\\/products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\",\"_method\":\"PUT\"}', '2024-08-06 12:22:14', '2024-08-06 12:22:14'),
(74, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:14', '2024-08-06 12:22:14'),
(75, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:28', '2024-08-06 12:22:28'),
(76, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:30', '2024-08-06 12:22:30'),
(77, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:33', '2024-08-06 12:22:33'),
(78, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:49', '2024-08-06 12:22:49'),
(79, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:57', '2024-08-06 12:22:57'),
(80, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:22:59', '2024-08-06 12:22:59'),
(81, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:23:10', '2024-08-06 12:23:10'),
(82, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:23:15', '2024-08-06 12:23:15'),
(83, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2024-08-06 12:23:31', '2024-08-06 12:23:31'),
(84, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:24:04', '2024-08-06 12:24:04'),
(85, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:24:07', '2024-08-06 12:24:07'),
(86, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:24:10', '2024-08-06 12:24:10'),
(87, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:24:15', '2024-08-06 12:24:15'),
(88, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:07', '2024-08-06 12:27:07'),
(89, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:09', '2024-08-06 12:27:09'),
(90, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:27', '2024-08-06 12:27:27'),
(91, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:28', '2024-08-06 12:27:28'),
(92, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"search_terms\":null,\"title\":\"product\",\"icon\":\"icon-plus\",\"uri\":\"products\\/create\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:27:48', '2024-08-06 12:27:48'),
(93, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:48', '2024-08-06 12:27:48'),
(94, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:53', '2024-08-06 12:27:53'),
(95, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:27:54', '2024-08-06 12:27:54'),
(96, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:28:04', '2024-08-06 12:28:04'),
(97, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:28:10', '2024-08-06 12:28:10'),
(98, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:42:30', '2024-08-06 12:42:30'),
(99, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:42:33', '2024-08-06 12:42:33'),
(100, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:42:37', '2024-08-06 12:42:37'),
(101, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:46:05', '2024-08-06 12:46:05'),
(102, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:46:14', '2024-08-06 12:46:14'),
(103, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:46:52', '2024-08-06 12:46:52'),
(104, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"addresses\",\"model_name\":\"App\\\\Models\\\\Addresse\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\AddressesControllers\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:49:57', '2024-08-06 12:49:57'),
(105, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:49:57', '2024-08-06 12:49:57'),
(106, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:50:01', '2024-08-06 12:50:01'),
(107, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 12:50:10', '2024-08-06 12:50:10'),
(108, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:50:33', '2024-08-06 12:50:33'),
(109, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"categories\",\"model_name\":\"App\\\\Models\\\\Categories\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CategoriesControllers\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:51:17', '2024-08-06 12:51:17'),
(110, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:51:17', '2024-08-06 12:51:17'),
(111, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:51:21', '2024-08-06 12:51:21'),
(112, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"farms\",\"model_name\":\"App\\\\Models\\\\Farms\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\FarmsControllers\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:51:48', '2024-08-06 12:51:48'),
(113, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:51:48', '2024-08-06 12:51:48'),
(114, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:51:54', '2024-08-06 12:51:54'),
(115, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"products\",\"model_name\":\"App\\\\Models\\\\Products\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\ProductsControllers\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:52:29', '2024-08-06 12:52:29'),
(116, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:52:29', '2024-08-06 12:52:29'),
(117, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:52:32', '2024-08-06 12:52:32'),
(118, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"seasons\",\"model_name\":\"App\\\\Models\\\\Seasons\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\SeasonsControllers\",\"create\":[\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"yqGffvdlvGwRpTxc8WLr9f1UwxpRHFdKjB7lWuNj\"}', '2024-08-06 12:52:59', '2024-08-06 12:52:59'),
(119, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:52:59', '2024-08-06 12:52:59'),
(120, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-06 12:53:03', '2024-08-06 12:53:03'),
(121, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 12:53:05', '2024-08-06 12:53:05'),
(122, 1, 'admin/seasons/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:53:51', '2024-08-06 12:53:51'),
(123, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 12:53:57', '2024-08-06 12:53:57'),
(124, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:00', '2024-08-06 12:54:00'),
(125, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:02', '2024-08-06 12:54:02'),
(126, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:10', '2024-08-06 12:54:10'),
(127, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:12', '2024-08-06 12:54:12'),
(128, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:18', '2024-08-06 12:54:18'),
(129, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:22', '2024-08-06 12:54:22'),
(130, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:46', '2024-08-06 12:54:46'),
(131, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:48', '2024-08-06 12:54:48'),
(132, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:54:58', '2024-08-06 12:54:58'),
(133, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:10', '2024-08-06 12:55:10'),
(134, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:36', '2024-08-06 12:55:36'),
(135, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:37', '2024-08-06 12:55:37'),
(136, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:39', '2024-08-06 12:55:39'),
(137, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:47', '2024-08-06 12:55:47'),
(138, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:55:51', '2024-08-06 12:55:51'),
(139, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:04', '2024-08-06 12:56:04'),
(140, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:11', '2024-08-06 12:56:11'),
(141, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:14', '2024-08-06 12:56:14'),
(142, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:22', '2024-08-06 12:56:22'),
(143, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:25', '2024-08-06 12:56:25'),
(144, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-08-06 12:56:29', '2024-08-06 12:56:29'),
(145, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 12:59:07', '2024-08-06 12:59:07'),
(146, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:59:09', '2024-08-06 12:59:09'),
(147, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 12:59:17', '2024-08-06 12:59:17'),
(148, 1, 'admin/products/create', 'GET', '127.0.0.1', '[]', '2024-08-06 13:07:42', '2024-08-06 13:07:42'),
(149, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-06 13:07:49', '2024-08-06 13:07:49'),
(150, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 13:07:52', '2024-08-06 13:07:52'),
(151, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-06 13:07:55', '2024-08-06 13:07:55'),
(152, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-08-06 13:08:01', '2024-08-06 13:08:01'),
(153, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-06 13:08:03', '2024-08-06 13:08:03'),
(154, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 13:08:06', '2024-08-06 13:08:06'),
(155, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 13:08:09', '2024-08-06 13:08:09'),
(156, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 13:08:12', '2024-08-06 13:08:12'),
(157, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-06 13:18:52', '2024-08-06 13:18:52'),
(158, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:43:49', '2024-08-06 03:43:49'),
(159, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:43:52', '2024-08-06 03:43:52'),
(160, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:03', '2024-08-06 03:44:03'),
(161, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:05', '2024-08-06 03:44:05'),
(162, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:09', '2024-08-06 03:44:09'),
(163, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:11', '2024-08-06 03:44:11'),
(164, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:24', '2024-08-06 03:44:24'),
(165, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:31', '2024-08-06 03:44:31'),
(166, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:44:34', '2024-08-06 03:44:34'),
(167, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:45:12', '2024-08-06 03:45:12'),
(168, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:45:18', '2024-08-06 03:45:18'),
(169, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:45:20', '2024-08-06 03:45:20'),
(170, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:45:37', '2024-08-06 03:45:37'),
(171, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:45:52', '2024-08-06 03:45:52'),
(172, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:46:00', '2024-08-06 03:46:00'),
(173, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:46:01', '2024-08-06 03:46:01'),
(174, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 03:47:55', '2024-08-06 03:47:55'),
(175, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:47:57', '2024-08-06 03:47:57'),
(176, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:12', '2024-08-06 03:49:12'),
(177, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:13', '2024-08-06 03:49:13'),
(178, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:16', '2024-08-06 03:49:16'),
(179, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:17', '2024-08-06 03:49:17'),
(180, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:19', '2024-08-06 03:49:19'),
(181, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:20', '2024-08-06 03:49:20'),
(182, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:23', '2024-08-06 03:49:23'),
(183, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:25', '2024-08-06 03:49:25'),
(184, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:27', '2024-08-06 03:49:27'),
(185, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:28', '2024-08-06 03:49:28'),
(186, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:30', '2024-08-06 03:49:30'),
(187, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:31', '2024-08-06 03:49:31'),
(188, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:49:39', '2024-08-06 03:49:39'),
(189, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-06 03:51:47', '2024-08-06 03:51:47'),
(190, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-06 03:51:48', '2024-08-06 03:51:48'),
(191, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-06 03:52:02', '2024-08-06 03:52:02'),
(192, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:52:22', '2024-08-06 03:52:22'),
(193, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:52:31', '2024-08-06 03:52:31'),
(194, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 03:54:36', '2024-08-06 03:54:36'),
(195, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:54:38', '2024-08-06 03:54:38'),
(196, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:08', '2024-08-06 03:56:08'),
(197, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:11', '2024-08-06 03:56:11'),
(198, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:43', '2024-08-06 03:56:43'),
(199, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:47', '2024-08-06 03:56:47'),
(200, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:49', '2024-08-06 03:56:49'),
(201, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:56:51', '2024-08-06 03:56:51'),
(202, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:11', '2024-08-06 03:57:11'),
(203, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:13', '2024-08-06 03:57:13'),
(204, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0645\\u0646\\u0635\\u0648\\u0631\",\"email\":\"ahmedalafoori@gmail.com\",\"email_verified_at\":\"2024-08-06 06:57:13\",\"password\":\"*****-filtered-out-*****\",\"remember_token\":\"123456789\",\"_token\":\"RDRShaEJDBxbWDjqZ33ThFUTyRG1gfWWQdV5Zt74\"}', '2024-08-06 03:57:26', '2024-08-06 03:57:26'),
(205, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:27', '2024-08-06 03:57:27'),
(206, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:31', '2024-08-06 03:57:31'),
(207, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:33', '2024-08-06 03:57:33'),
(208, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:49', '2024-08-06 03:57:49'),
(209, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:53', '2024-08-06 03:57:53'),
(210, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 03:57:59', '2024-08-06 03:57:59'),
(211, 1, 'admin/farms/create', 'GET', '127.0.0.1', '[]', '2024-08-06 03:58:00', '2024-08-06 03:58:00'),
(212, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 03:58:09', '2024-08-06 03:58:09'),
(213, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 03:58:11', '2024-08-06 03:58:11'),
(214, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 04:25:53', '2024-08-06 04:25:53'),
(215, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 04:25:59', '2024-08-06 04:25:59'),
(216, 1, 'admin/farms/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:02', '2024-08-06 04:26:02'),
(217, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:05', '2024-08-06 04:26:05'),
(218, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:12', '2024-08-06 04:26:12'),
(219, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:13', '2024-08-06 04:26:13'),
(220, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:31', '2024-08-06 04:26:31'),
(221, 1, 'admin/farms/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:26:33', '2024-08-06 04:26:33'),
(222, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 04:29:10', '2024-08-06 04:29:10'),
(223, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:29:12', '2024-08-06 04:29:12'),
(224, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 04:29:45', '2024-08-06 04:29:45'),
(225, 1, 'admin/farms/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:29:47', '2024-08-06 04:29:47'),
(226, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 04:30:23', '2024-08-06 04:30:23'),
(227, 1, 'admin/farms', 'GET', '127.0.0.1', '[]', '2024-08-06 04:30:27', '2024-08-06 04:30:27'),
(228, 1, 'admin/farms/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:30:29', '2024-08-06 04:30:29'),
(229, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2024-08-06 04:31:08', '2024-08-06 04:31:08'),
(230, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-06 04:35:24', '2024-08-06 04:35:24'),
(231, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:35:25', '2024-08-06 04:35:25'),
(232, 1, 'admin/addresses', 'GET', '127.0.0.1', '[]', '2024-08-06 04:35:46', '2024-08-06 04:35:46'),
(233, 1, 'admin/addresses/create', 'GET', '127.0.0.1', '[]', '2024-08-06 04:35:47', '2024-08-06 04:35:47'),
(234, 1, 'admin/seasons', 'GET', '127.0.0.1', '[]', '2024-08-06 04:36:29', '2024-08-06 04:36:29'),
(235, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 04:36:54', '2024-08-06 04:36:54'),
(236, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-06 15:30:06', '2024-08-06 15:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2024-08-06 11:49:32', '2024-08-06 11:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$eySMnrvJkvEEmQ7sTYL60.VRuTdiK9NP83TJlqekeubiWuUwCNU1e', 'Administrator', NULL, NULL, '2024-08-06 11:49:32', '2024-08-06 11:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `describtion` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farms`
--

CREATE TABLE `farms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `commercialregistrationno` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(19, '2016_01_04_173148_create_admin_tables', 2),
(20, '2019_08_19_000000_create_failed_jobs_table', 2),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2024_08_05_234944_create_categories_table', 2),
(23, '2024_08_06_000117_create_seasons_table', 2),
(24, '2024_08_06_015923_create_addresses_table', 2),
(25, '2024_08_05_210836_laratrust_setup_tables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `prais` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `season_id` bigint(20) UNSIGNED NOT NULL,
  `farm_id` bigint(20) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `productstatus` tinyint(1) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'client', 'client_Pepole', NULL, NULL, NULL),
(2, 'Delivery_driver', 'Delivery_driver_pepole', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `seasonsname` varchar(255) NOT NULL,
  `startdaet` date NOT NULL,
  `enddate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'احمد منصور', 'ahmedalafoori@gmail.com', '2024-08-06 03:57:13', '$2y$12$nPXn9btfWKuQEOB.zm9TueOHjYGZrcGycmZNM9aZUNIFBXbMRBu8W', '123456789', '2024-08-06 03:57:27', '2024-08-06 03:57:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farms_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farms`
--
ALTER TABLE `farms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `farms`
--
ALTER TABLE `farms`
  ADD CONSTRAINT `farms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
