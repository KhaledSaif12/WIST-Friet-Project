-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2024 at 05:05 AM
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
(8, 0, 7, 'Helpers', 'icon-cogs', '', NULL, '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(9, 8, 8, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(10, 8, 9, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(11, 8, 10, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(12, 8, 11, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(13, 0, 12, 'Api tester', 'icon-sliders-h', 'api-tester', NULL, '2024-08-05 03:05:53', '2024-08-05 03:05:53'),
(14, 0, 12, 'Users', 'icon-file', 'users', NULL, '2024-08-05 03:08:22', '2024-08-05 03:08:22');

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
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:00:13', '2024-08-05 03:00:13'),
(2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:22', '2024-08-05 03:01:22'),
(3, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:24', '2024-08-05 03:01:24'),
(4, 1, 'admin/helpers/terminal/database', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:25', '2024-08-05 03:01:25'),
(5, 1, 'admin/helpers/terminal/artisan', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:27', '2024-08-05 03:01:27'),
(6, 1, 'admin/helpers/routes', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:29', '2024-08-05 03:01:29'),
(7, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:34', '2024-08-05 03:01:34'),
(8, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:35', '2024-08-05 03:01:35'),
(9, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:01:35', '2024-08-05 03:01:35'),
(10, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:03:08', '2024-08-05 03:03:08'),
(11, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:03:29', '2024-08-05 03:03:29'),
(12, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:03:41', '2024-08-05 03:03:41'),
(13, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:06:18', '2024-08-05 03:06:18'),
(14, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 03:06:20', '2024-08-05 03:06:20'),
(15, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\",\"user\":null}', '2024-08-05 03:06:51', '2024-08-05 03:06:51'),
(16, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 03:07:58', '2024-08-05 03:07:58'),
(17, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"user\",\"model_name\":\"App\\\\Models\\\\User\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\UserController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":null,\"type\":\"string\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\"}', '2024-08-05 03:08:22', '2024-08-05 03:08:22'),
(18, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 03:08:23', '2024-08-05 03:08:23'),
(19, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 03:11:21', '2024-08-05 03:11:21'),
(20, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:11:23', '2024-08-05 03:11:23'),
(21, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2024-08-05 03:11:46', '2024-08-05 03:11:46'),
(22, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0645\\u0646\\u0635\\u0648\\u0631 \\u0647\\u0632\\u0627\\u0639 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0628\\u0627\\u0631\\u064a \\u0627\\u0644\\u0639\\u0641\\u0648\\u0631\\u064a\",\"email\":\"ahmedalafoori@gmail.com\",\"email_verified_at\":\"2024-08-05 06:11:46\",\"password\":\"*****-filtered-out-*****\",\"remember_token\":null,\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\"}', '2024-08-05 03:12:30', '2024-08-05 03:12:30'),
(23, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:12:31', '2024-08-05 03:12:31'),
(24, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 03:12:40', '2024-08-05 03:12:40'),
(25, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\",\"user\":null}', '2024-08-05 03:12:45', '2024-08-05 03:12:45'),
(26, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"http:\\/\\/127.0.0.1:8000\\/api\\/user\",\"method\":\"GET\",\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\",\"user\":null}', '2024-08-05 03:13:13', '2024-08-05 03:13:13'),
(27, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"http:\\/\\/127.0.0.1:8000\\/api\\/user\",\"method\":\"GET\",\"_token\":\"TIHhFghY3LnYABOHu2tAGxPtYtpAK5x81paEEmXc\",\"user\":null}', '2024-08-05 03:13:23', '2024-08-05 03:13:23'),
(28, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:13:46', '2024-08-05 03:13:46'),
(29, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:13:57', '2024-08-05 03:13:57'),
(30, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:14:13', '2024-08-05 03:14:13'),
(31, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:14:43', '2024-08-05 03:14:43'),
(32, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:15:24', '2024-08-05 03:15:24'),
(33, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:16:43', '2024-08-05 03:16:43'),
(34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:16:57', '2024-08-05 03:16:57'),
(35, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:15', '2024-08-05 03:18:15'),
(36, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:18', '2024-08-05 03:18:18'),
(37, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:18', '2024-08-05 03:18:18'),
(38, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:18', '2024-08-05 03:18:18'),
(39, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:19', '2024-08-05 03:18:19'),
(40, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:26', '2024-08-05 03:18:26'),
(41, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:18:28', '2024-08-05 03:18:28'),
(42, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:26', '2024-08-05 03:20:26'),
(43, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:33', '2024-08-05 03:20:33'),
(44, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:40', '2024-08-05 03:20:40'),
(45, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:48', '2024-08-05 03:20:48'),
(46, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:56', '2024-08-05 03:20:56'),
(47, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-05 03:20:59', '2024-08-05 03:20:59'),
(48, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:21:01', '2024-08-05 03:21:01'),
(49, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:21:02', '2024-08-05 03:21:02'),
(50, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-05 03:21:04', '2024-08-05 03:21:04'),
(51, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2024-08-05 03:21:06', '2024-08-05 03:21:06'),
(52, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 03:21:18', '2024-08-05 03:21:18'),
(53, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:25:48', '2024-08-05 03:25:48'),
(54, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 03:25:50', '2024-08-05 03:25:50'),
(55, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 03:33:06', '2024-08-05 03:33:06'),
(56, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 16:16:11', '2024-08-05 16:16:11'),
(57, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 16:16:31', '2024-08-05 16:16:31'),
(58, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 16:16:43', '2024-08-05 16:16:43'),
(59, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 17:34:48', '2024-08-05 17:34:48'),
(60, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 17:34:51', '2024-08-05 17:34:51'),
(61, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 17:34:53', '2024-08-05 17:34:53'),
(62, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 17:34:57', '2024-08-05 17:34:57'),
(63, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 17:53:17', '2024-08-05 17:53:17'),
(64, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 17:53:22', '2024-08-05 17:53:22'),
(65, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 18:34:15', '2024-08-05 18:34:15'),
(66, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 18:34:38', '2024-08-05 18:34:38'),
(67, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2024-08-05 18:34:44', '2024-08-05 18:34:44'),
(68, 1, 'admin', 'GET', '127.0.0.1', '[]', '2024-08-05 18:35:11', '2024-08-05 18:35:11'),
(69, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 18:35:14', '2024-08-05 18:35:14'),
(70, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 18:35:25', '2024-08-05 18:35:25'),
(71, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 18:35:36', '2024-08-05 18:35:36'),
(72, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2024-08-05 18:35:41', '2024-08-05 18:35:41'),
(73, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 18:36:00', '2024-08-05 18:36:00'),
(74, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 18:36:03', '2024-08-05 18:36:03'),
(75, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2024-08-05 18:36:08', '2024-08-05 18:36:08'),
(76, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2024-08-05 19:23:52', '2024-08-05 19:23:52'),
(77, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2024-08-05 19:23:54', '2024-08-05 19:23:54'),
(78, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2024-08-05 19:24:05', '2024-08-05 19:24:05'),
(79, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2024-08-05 19:24:07', '2024-08-05 19:24:07'),
(80, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2024-08-05 19:24:11', '2024-08-05 19:24:11'),
(81, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 19:24:14', '2024-08-05 19:24:14'),
(82, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 19:31:44', '2024-08-05 19:31:44'),
(83, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 19:33:16', '2024-08-05 19:33:16'),
(84, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":null}', '2024-08-05 19:36:36', '2024-08-05 19:36:36'),
(85, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"http:\\/\\/127.0.0.1:8000\\/api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":null}', '2024-08-05 19:36:59', '2024-08-05 19:36:59'),
(86, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 20:02:25', '2024-08-05 20:02:25'),
(87, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 20:07:46', '2024-08-05 20:07:46'),
(88, 1, 'admin/users/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\"}', '2024-08-05 20:07:50', '2024-08-05 20:07:50'),
(89, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 20:07:50', '2024-08-05 20:07:50'),
(90, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2024-08-05 20:07:52', '2024-08-05 20:07:52'),
(91, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"\\u0627\\u062d\\u0645\\u062f \\u0645\\u0646\\u0635\\u0648\\u0631 \\u0647\\u0632\\u0627\\u0639 \\u0639\\u0628\\u062f \\u0627\\u0644\\u0628\\u0627\\u0631\\u064a \\u0627\\u0644\\u0639\\u0641\\u0648\\u0631\\u064a\",\"email\":\"ahmedalafoori@gmail.com\",\"email_verified_at\":\"2024-08-05 23:07:52\",\"password\":\"*****-filtered-out-*****\",\"remember_token\":null,\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\"}', '2024-08-05 20:08:09', '2024-08-05 20:08:09'),
(92, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2024-08-05 20:08:09', '2024-08-05 20:08:09'),
(93, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 20:20:29', '2024-08-05 20:20:29'),
(94, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":null,\"key\":[\"\\u0634\\u0634\",\"\\u0634\\u0634\"],\"val\":[\"\\u0634\\u0634\",\"\\u0634\\u0634\"]}', '2024-08-05 20:21:08', '2024-08-05 20:21:08'),
(95, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":null,\"key\":[\"ahmed\"],\"val\":[\"aaaaa\"]}', '2024-08-05 20:21:32', '2024-08-05 20:21:32'),
(96, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 20:21:36', '2024-08-05 20:21:36'),
(97, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":\"ahmedalafoori@gmail.com\"}', '2024-08-05 20:21:59', '2024-08-05 20:21:59'),
(98, 1, 'admin/api-tester/handle', 'POST', '127.0.0.1', '{\"uri\":\"api\\/user\",\"method\":\"GET\",\"_token\":\"0q1wrLXkaBayEPNvibM4rbx5Cim7OKtCXMq5IDOa\",\"user\":\"admin\"}', '2024-08-05 20:22:36', '2024-08-05 20:22:36'),
(99, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 20:22:59', '2024-08-05 20:22:59'),
(100, 1, 'admin/api-tester', 'GET', '127.0.0.1', '[]', '2024-08-05 20:59:22', '2024-08-05 20:59:22');

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
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2024-08-05 03:01:12', '2024-08-05 03:01:12'),
(7, 'Api tester', 'ext.api-tester', '', '/api-tester*', '2024-08-05 03:05:53', '2024-08-05 03:05:53');

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
(1, 'Administrator', 'administrator', '2024-08-05 02:59:52', '2024-08-05 02:59:52');

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
(1, 2, NULL, NULL);

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
(1, 'admin', '$2y$12$0a4se581YXwUtf9JJGJ15eg.mCpQGaiIyXt/KJadY3PXak/MLb.US', 'Administrator', NULL, NULL, '2024-08-05 02:59:52', '2024-08-05 02:59:52');

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_01_04_173148_create_admin_tables', 2),
(6, '2024_08_05_210836_laratrust_setup_tables', 3);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'Personal Access Token', '2b9d687b67670f496e2906c1025b0e1ffce2ccb921ae56ea12ef42437989693b', '[\"*\"]', NULL, NULL, '2024-08-05 21:25:28', '2024-08-05 21:25:28');

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

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(1, 3, 'App\\Models\\User'),
(2, 3, 'App\\Models\\User'),
(1, 4, 'App\\Models\\User'),
(1, 5, 'App\\Models\\User');

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
(2, 'احمد منصور هزاع عبد الباري العفوري', 'ahmedalafoori@gmail.com', '2024-08-05 20:07:52', '$2y$12$e9v.EosbHKm0mAUa9xHVau3KZy2B4q1K0YwrtD/6tU0SvhoaIuU4C', NULL, '2024-08-05 20:08:09', '2024-08-05 20:08:09'),
(3, 'احمد منصور', 'khaled@gmail.comnnn5', NULL, '$2y$12$.FAete.g1lME8xs.OTGvh.oREjjdfRbW4KACEY84Za2VY0LWn3xZS', NULL, '2024-08-05 21:59:50', '2024-08-05 21:59:50'),
(4, 'John Doe', 'johndoe@example.com', NULL, '$2y$12$2QV.lP8o7OIpsd5BsxRYEOOoxYMxB4gdXdny20j7RNCCRaGJmoAxG', NULL, '2024-08-05 22:05:54', '2024-08-05 22:05:54'),
(5, 'John Doerr', 'johndoe@example.comr', NULL, '$2y$12$ZemIkzrBtbP8o4BQX9QMUO5WOATGRn/ttYvwxWgvEWTfrwsA.btF.', NULL, '2024-08-05 22:52:24', '2024-08-05 22:52:24');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

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
