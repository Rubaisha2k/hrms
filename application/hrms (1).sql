-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2020 at 01:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_advance_salaries`
--

CREATE TABLE `xin_advance_salaries` (
  `advance_salary_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `month_year` varchar(255) NOT NULL,
  `advance_amount` varchar(255) NOT NULL,
  `one_time_deduct` varchar(50) NOT NULL,
  `monthly_installment` varchar(255) NOT NULL,
  `total_paid` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `is_deducted_from_salary` int(11) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_announcements`
--

CREATE TABLE `xin_announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `company_id` int(111) NOT NULL,
  `location_id` int(11) NOT NULL,
  `department_id` int(111) NOT NULL,
  `published_by` int(111) NOT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_announcements`
--

INSERT INTO `xin_announcements` (`announcement_id`, `title`, `start_date`, `end_date`, `company_id`, `location_id`, `department_id`, `published_by`, `summary`, `description`, `is_active`, `is_notify`, `created_at`) VALUES
(1, 'xyzzz', '2020-11-04', '2020-11-04', 1, 1, 1, 1, 'aaa', 'zzzzzzzzzzzzzzzzzz', 0, 1, '04-11-2020');

-- --------------------------------------------------------

--
-- Table structure for table `xin_assets`
--

CREATE TABLE `xin_assets` (
  `assets_id` int(111) NOT NULL,
  `assets_category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_asset_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_date` varchar(255) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `warranty_end_date` varchar(255) NOT NULL,
  `asset_note` text NOT NULL,
  `asset_image` varchar(255) NOT NULL,
  `is_working` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_assets_categories`
--

CREATE TABLE `xin_assets_categories` (
  `assets_category_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_assets_categories`
--

INSERT INTO `xin_assets_categories` (`assets_category_id`, `company_id`, `category_name`, `created_at`) VALUES
(1, 1, 'Laptop', '05-04-2018 03:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `xin_attendance_time`
--

CREATE TABLE `xin_attendance_time` (
  `time_attendance_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `attendance_date` varchar(255) NOT NULL,
  `clock_in` varchar(255) NOT NULL,
  `clock_in_ip_address` varchar(255) NOT NULL,
  `clock_out` varchar(255) NOT NULL,
  `clock_out_ip_address` varchar(255) NOT NULL,
  `clock_in_out` varchar(255) NOT NULL,
  `clock_in_latitude` varchar(150) NOT NULL,
  `clock_in_longitude` varchar(150) NOT NULL,
  `clock_out_latitude` varchar(150) NOT NULL,
  `clock_out_longitude` varchar(150) NOT NULL,
  `time_late` varchar(255) NOT NULL,
  `early_leaving` varchar(255) NOT NULL,
  `overtime` varchar(255) NOT NULL,
  `total_work` varchar(255) NOT NULL,
  `total_rest` varchar(255) NOT NULL,
  `attendance_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_attendance_time`
--

INSERT INTO `xin_attendance_time` (`time_attendance_id`, `employee_id`, `attendance_date`, `clock_in`, `clock_in_ip_address`, `clock_out`, `clock_out_ip_address`, `clock_in_out`, `clock_in_latitude`, `clock_in_longitude`, `clock_out_latitude`, `clock_out_longitude`, `time_late`, `early_leaving`, `overtime`, `total_work`, `total_rest`, `attendance_status`) VALUES
(1, 5, '2019-04-17', '2019-04-17 10:36:38', '::1', '2019-04-17 10:37:36', '::1', '0', '31.450726399999997', '74.2940672', '31.450726399999997', '74.2940672', '2019-04-17 10:36:38', '2019-04-17 10:37:36', '2019-04-17 10:37:36', '0:0', '', 'Present'),
(3, 96, '2020-10-22', '2020-10-22 15:42:06', '', '2020-10-22 17:31:51', '', '', '', '', '', '', '2020-10-22 15:42:06', '2020-10-22 17:31:51', '2020-10-22 17:31:51', '', '', 'Late'),
(4, 96, '2020-10-23', '2020-10-23 11:32:53', '', '2020-10-23 15:29:18', '', '', '', '', '', '', '2020-10-23 11:32:53', '2020-10-23 15:29:18', '2020-10-23 15:29:18', '', '', 'Late'),
(5, 96, '2020-10-26', '2020-10-26 11:37:26', '', '', '', '', '', '', '', '', '2020-10-26 11:37:26', '', '', '', '', 'Late'),
(6, 96, '2020-10-27', '2020-10-27 10:23:47', '', '2020-10-27 15:50:58', '', '', '', '', '', '', '2020-10-27 10:23:47', '2020-10-27 15:50:58', '2020-10-27 15:50:58', '', '', 'Late'),
(7, 96, '2020-10-28', '2020-10-28 11:48:42', '', '2020-10-28 11:48:45', '', '', '', '', '', '', '2020-10-28 11:48:42', '2020-10-28 11:48:45', '2020-10-28 11:48:45', '', '', 'Late'),
(8, 6, '2020-10-28', '2020-10-28 11:49:31', '', '2020-10-28 12:03:39', '', '', '', '', '', '', '2020-10-28 11:49:31', '2020-10-28 12:03:39', '2020-10-28 12:03:39', '', '', 'Present'),
(9, 96, '2020-10-29', '2020-10-29 10:41:51', '', '2020-10-29 11:42:14', '', '', '', '', '', '', '2020-10-29 10:41:51', '2020-10-29 11:42:14', '2020-10-29 11:42:14', '', '', 'Late'),
(10, 6, '2020-11-09', '2020-10-29 17:36:34', '', '2020-10-29 17:46:34', '', '', '', '', '', '', '2020-10-29 17:36:34', '2020-10-29 17:46:34', '2020-10-29 17:46:34', '', '', 'Late'),
(11, 6, '2020-10-08', '2020-11-02 11:33:59', '', '', '', '', '', '', '', '', '2020-11-02 11:33:59', '', '', '', '', 'Present'),
(12, 6, '2020-10-13', '2020-11-03 11:38:27', '', '2020-11-03 17:10:57', '', '', '', '', '', '', '2020-11-03 11:38:27', '2020-11-03 17:10:57', '2020-11-03 17:10:57', '', '', 'Late'),
(13, 6, '2020-10-26', '2020-11-04 16:14:34', '', '2020-11-04 17:59:44', '', '', '', '', '', '', '2020-11-04 16:14:34', '2020-11-04 17:59:44', '2020-11-04 17:59:44', '', '', 'Late'),
(14, 6, '2020-11-05', '2020-11-05 11:48:21', '', '2020-11-05 11:48:55', '', '', '', '', '', '', '2020-11-05 11:48:21', '2020-11-05 11:48:55', '2020-11-05 11:48:55', '', '', 'Late');

-- --------------------------------------------------------

--
-- Table structure for table `xin_attendance_time_request`
--

CREATE TABLE `xin_attendance_time_request` (
  `time_request_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `request_date` varchar(255) NOT NULL,
  `request_date_request` varchar(255) NOT NULL,
  `request_clock_in` varchar(200) NOT NULL,
  `request_clock_out` varchar(200) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `project_no` varchar(200) NOT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `task_name` varchar(255) NOT NULL,
  `request_reason` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_awards`
--

CREATE TABLE `xin_awards` (
  `award_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(200) NOT NULL,
  `award_type_id` int(200) NOT NULL,
  `gift_item` varchar(200) NOT NULL,
  `cash_price` varchar(200) NOT NULL,
  `award_photo` varchar(255) NOT NULL,
  `award_month_year` varchar(200) NOT NULL,
  `award_information` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_award_type`
--

CREATE TABLE `xin_award_type` (
  `award_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `award_type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_award_type`
--

INSERT INTO `xin_award_type` (`award_type_id`, `company_id`, `award_type`, `created_at`) VALUES
(1, 1, 'Performer of the Year', '22-03-2018 01:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `xin_chat_messages`
--

CREATE TABLE `xin_chat_messages` (
  `message_id` int(11) UNSIGNED NOT NULL,
  `from_id` varchar(40) NOT NULL DEFAULT '',
  `to_id` varchar(50) NOT NULL DEFAULT '',
  `message_frm` varchar(255) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `message_content` longtext NOT NULL,
  `message_date` varchar(255) DEFAULT NULL,
  `recd` tinyint(1) NOT NULL DEFAULT 0,
  `message_type` varchar(255) NOT NULL DEFAULT '',
  `department_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_chat_messages`
--

INSERT INTO `xin_chat_messages` (`message_id`, `from_id`, `to_id`, `message_frm`, `is_read`, `message_content`, `message_date`, `recd`, `message_type`, `department_id`, `location_id`) VALUES
(1, '1', '5', '5', 0, 'qwe', '2020-11-12 16:48:13', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `xin_clients`
--

CREATE TABLE `xin_clients` (
  `client_id` int(111) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int(11) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `is_active` int(11) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_clients`
--

INSERT INTO `xin_clients` (`client_id`, `type`, `name`, `email`, `client_username`, `client_password`, `client_profile`, `contact_number`, `company_name`, `is_changed`, `gender`, `website_url`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `is_active`, `last_logout_date`, `last_login_date`, `last_login_ip`, `is_logged_in`, `created_at`) VALUES
(1, '', 'Shaleena', 'client1@hrsale.com', '', '$2y$12$wGATpsG6S/IAIwobUZMeDeYyxpirjXVaVLo79ta2PLlRJjBNIsfFa', '', '123456789', 'Shale Inc.', 0, '', '', 'Address Line 1', 'Address Line 2', 'City', 'State', '11461', 190, 1, '', '20-03-2019 22:05:05', '::1', 1, '2019-03-20 22:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `xin_cnic`
--

CREATE TABLE `xin_cnic` (
  `cnic_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `cnic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_cnic`
--

INSERT INTO `xin_cnic` (`cnic_id`, `employee_id`, `cnic`) VALUES
(1, 96, '34402-1122422-1'),
(2, 6, '4221997979797'),
(3, 9795, '421018547557777');

-- --------------------------------------------------------

--
-- Table structure for table `xin_companies`
--

CREATE TABLE `xin_companies` (
  `company_id` int(111) NOT NULL,
  `type_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `trading_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registration_no` varchar(255) NOT NULL,
  `government_tax` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `is_active` int(11) NOT NULL,
  `default_currency` varchar(200) DEFAULT NULL,
  `default_timezone` varchar(200) DEFAULT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_companies`
--

INSERT INTO `xin_companies` (`company_id`, `type_id`, `name`, `trading_name`, `username`, `password`, `registration_no`, `government_tax`, `email`, `logo`, `contact_number`, `website_url`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `is_active`, `default_currency`, `default_timezone`, `added_by`, `created_at`) VALUES
(1, 1, 'MonetDT', 'Test', 'test123', '', '', '', 'mainoffice@monetdt.com', 'logo_1526958729.png', '0123456789', 'monetdt.com', 'Test', 'Test2', 'Karachi', 'Karachi', '11461', 167, 0, 'PKR - Rs.', 'Asia/Karachi', 1, '22-05-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_documents`
--

CREATE TABLE `xin_company_documents` (
  `document_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `license_name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `license_number` varchar(255) NOT NULL,
  `license_notification` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_info`
--

CREATE TABLE `xin_company_info` (
  `company_info_id` int(111) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo_second` varchar(255) NOT NULL,
  `sign_in_logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `website_url` mediumtext NOT NULL,
  `starting_year` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_contact` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_info`
--

INSERT INTO `xin_company_info` (`company_info_id`, `logo`, `logo_second`, `sign_in_logo`, `favicon`, `website_url`, `starting_year`, `company_name`, `company_email`, `company_contact`, `contact_person`, `email`, `phone`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `updated_at`) VALUES
(1, 'logo_1605169066.jpg', 'logo_1597728786.png', 'signin_logo_1605169083.png', 'favicon_1605169038.jpg', '', '', 'MonetDT', '', '', 'Thomas Fleming', 'info@monet.com', '0292939922', 'Karachi', 'Address Line 2', 'Karachi', 'Sindh', '11461', 167, '2017-05-20 12:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_policy`
--

CREATE TABLE `xin_company_policy` (
  `policy_id` int(111) NOT NULL,
  `company_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_policy`
--

INSERT INTO `xin_company_policy` (`policy_id`, `company_id`, `title`, `description`, `attachment`, `added_by`, `created_at`) VALUES
(1, 1, 'Smoke-Free Work', '&lt;p&gt;Smoke-Free Work Environment Policy Close&lt;/p&gt;', NULL, 1, '28-02-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_company_type`
--

CREATE TABLE `xin_company_type` (
  `type_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_company_type`
--

INSERT INTO `xin_company_type` (`type_id`, `name`, `created_at`) VALUES
(1, 'Corporation', ''),
(2, 'Exempt Organization', ''),
(3, 'Partnership', ''),
(4, 'Private Foundation', ''),
(5, 'Limited Liability Company', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_contract_type`
--

CREATE TABLE `xin_contract_type` (
  `contract_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_contract_type`
--

INSERT INTO `xin_contract_type` (`contract_type_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'Permanent', '05-04-2018 06:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_countries`
--

CREATE TABLE `xin_countries` (
  `country_id` int(11) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_flag` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_countries`
--

INSERT INTO `xin_countries` (`country_id`, `country_code`, `country_name`, `country_flag`) VALUES
(1, '+93', 'Afghanistan', 'flag_1500831780.gif'),
(2, '+355', 'Albania', 'flag_1500831815.gif'),
(3, 'DZ', 'Algeria', ''),
(4, 'DS', 'American Samoa', ''),
(5, 'AD', 'Andorra', ''),
(6, 'AO', 'Angola', ''),
(7, 'AI', 'Anguilla', ''),
(8, 'AQ', 'Antarctica', ''),
(9, 'AG', 'Antigua and Barbuda', ''),
(10, 'AR', 'Argentina', ''),
(11, 'AM', 'Armenia', ''),
(12, 'AW', 'Aruba', ''),
(13, 'AU', 'Australia', ''),
(14, 'AT', 'Austria', ''),
(15, 'AZ', 'Azerbaijan', ''),
(16, 'BS', 'Bahamas', ''),
(17, 'BH', 'Bahrain', ''),
(18, 'BD', 'Bangladesh', ''),
(19, 'BB', 'Barbados', ''),
(20, 'BY', 'Belarus', ''),
(21, 'BE', 'Belgium', ''),
(22, 'BZ', 'Belize', ''),
(23, 'BJ', 'Benin', ''),
(24, 'BM', 'Bermuda', ''),
(25, 'BT', 'Bhutan', ''),
(26, 'BO', 'Bolivia', ''),
(27, 'BA', 'Bosnia and Herzegovina', ''),
(28, 'BW', 'Botswana', ''),
(29, 'BV', 'Bouvet Island', ''),
(30, 'BR', 'Brazil', ''),
(31, 'IO', 'British Indian Ocean Territory', ''),
(32, 'BN', 'Brunei Darussalam', ''),
(33, 'BG', 'Bulgaria', ''),
(34, 'BF', 'Burkina Faso', ''),
(35, 'BI', 'Burundi', ''),
(36, 'KH', 'Cambodia', ''),
(37, 'CM', 'Cameroon', ''),
(38, 'CA', 'Canada', ''),
(39, 'CV', 'Cape Verde', ''),
(40, 'KY', 'Cayman Islands', ''),
(41, 'CF', 'Central African Republic', ''),
(42, 'TD', 'Chad', ''),
(43, 'CL', 'Chile', ''),
(44, 'CN', 'China', ''),
(45, 'CX', 'Christmas Island', ''),
(46, 'CC', 'Cocos (Keeling) Islands', ''),
(47, 'CO', 'Colombia', ''),
(48, 'KM', 'Comoros', ''),
(49, 'CG', 'Congo', ''),
(50, 'CK', 'Cook Islands', ''),
(51, 'CR', 'Costa Rica', ''),
(52, 'HR', 'Croatia (Hrvatska)', ''),
(53, 'CU', 'Cuba', ''),
(54, 'CY', 'Cyprus', ''),
(55, 'CZ', 'Czech Republic', ''),
(56, 'DK', 'Denmark', ''),
(57, 'DJ', 'Djibouti', ''),
(58, 'DM', 'Dominica', ''),
(59, 'DO', 'Dominican Republic', ''),
(60, 'TP', 'East Timor', ''),
(61, 'EC', 'Ecuador', ''),
(62, 'EG', 'Egypt', ''),
(63, 'SV', 'El Salvador', ''),
(64, 'GQ', 'Equatorial Guinea', ''),
(65, 'ER', 'Eritrea', ''),
(66, 'EE', 'Estonia', ''),
(67, 'ET', 'Ethiopia', ''),
(68, 'FK', 'Falkland Islands (Malvinas)', ''),
(69, 'FO', 'Faroe Islands', ''),
(70, 'FJ', 'Fiji', ''),
(71, 'FI', 'Finland', ''),
(72, 'FR', 'France', ''),
(73, 'FX', 'France, Metropolitan', ''),
(74, 'GF', 'French Guiana', ''),
(75, 'PF', 'French Polynesia', ''),
(76, 'TF', 'French Southern Territories', ''),
(77, 'GA', 'Gabon', ''),
(78, 'GM', 'Gambia', ''),
(79, 'GE', 'Georgia', ''),
(80, 'DE', 'Germany', ''),
(81, 'GH', 'Ghana', ''),
(82, 'GI', 'Gibraltar', ''),
(83, 'GK', 'Guernsey', ''),
(84, 'GR', 'Greece', ''),
(85, 'GL', 'Greenland', ''),
(86, 'GD', 'Grenada', ''),
(87, 'GP', 'Guadeloupe', ''),
(88, 'GU', 'Guam', ''),
(89, 'GT', 'Guatemala', ''),
(90, 'GN', 'Guinea', ''),
(91, 'GW', 'Guinea-Bissau', ''),
(92, 'GY', 'Guyana', ''),
(93, 'HT', 'Haiti', ''),
(94, 'HM', 'Heard and Mc Donald Islands', ''),
(95, 'HN', 'Honduras', ''),
(96, 'HK', 'Hong Kong', ''),
(97, 'HU', 'Hungary', ''),
(98, 'IS', 'Iceland', ''),
(99, 'IN', 'India', ''),
(100, 'IM', 'Isle of Man', ''),
(101, 'ID', 'Indonesia', ''),
(102, 'IR', 'Iran (Islamic Republic of)', ''),
(103, 'IQ', 'Iraq', ''),
(104, 'IE', 'Ireland', ''),
(105, 'IL', 'Israel', ''),
(106, 'IT', 'Italy', ''),
(107, 'CI', 'Ivory Coast', ''),
(108, 'JE', 'Jersey', ''),
(109, 'JM', 'Jamaica', ''),
(110, 'JP', 'Japan', ''),
(111, 'JO', 'Jordan', ''),
(112, 'KZ', 'Kazakhstan', ''),
(113, 'KE', 'Kenya', ''),
(114, 'KI', 'Kiribati', ''),
(115, 'KP', 'Korea, Democratic People\'s Republic of', ''),
(116, 'KR', 'Korea, Republic of', ''),
(117, 'XK', 'Kosovo', ''),
(118, 'KW', 'Kuwait', ''),
(119, 'KG', 'Kyrgyzstan', ''),
(120, 'LA', 'Lao People\'s Democratic Republic', ''),
(121, 'LV', 'Latvia', ''),
(122, 'LB', 'Lebanon', ''),
(123, 'LS', 'Lesotho', ''),
(124, 'LR', 'Liberia', ''),
(125, 'LY', 'Libyan Arab Jamahiriya', ''),
(126, 'LI', 'Liechtenstein', ''),
(127, 'LT', 'Lithuania', ''),
(128, 'LU', 'Luxembourg', ''),
(129, 'MO', 'Macau', ''),
(130, 'MK', 'Macedonia', ''),
(131, 'MG', 'Madagascar', ''),
(132, 'MW', 'Malawi', ''),
(133, 'MY', 'Malaysia', ''),
(134, 'MV', 'Maldives', ''),
(135, 'ML', 'Mali', ''),
(136, 'MT', 'Malta', ''),
(137, 'MH', 'Marshall Islands', ''),
(138, 'MQ', 'Martinique', ''),
(139, 'MR', 'Mauritania', ''),
(140, 'MU', 'Mauritius', ''),
(141, 'TY', 'Mayotte', ''),
(142, 'MX', 'Mexico', ''),
(143, 'FM', 'Micronesia, Federated States of', ''),
(144, 'MD', 'Moldova, Republic of', ''),
(145, 'MC', 'Monaco', ''),
(146, 'MN', 'Mongolia', ''),
(147, 'ME', 'Montenegro', ''),
(148, 'MS', 'Montserrat', ''),
(149, 'MA', 'Morocco', ''),
(150, 'MZ', 'Mozambique', ''),
(151, 'MM', 'Myanmar', ''),
(152, 'NA', 'Namibia', ''),
(153, 'NR', 'Nauru', ''),
(154, 'NP', 'Nepal', ''),
(155, 'NL', 'Netherlands', ''),
(156, 'AN', 'Netherlands Antilles', ''),
(157, 'NC', 'New Caledonia', ''),
(158, 'NZ', 'New Zealand', ''),
(159, 'NI', 'Nicaragua', ''),
(160, 'NE', 'Niger', ''),
(161, 'NG', 'Nigeria', ''),
(162, 'NU', 'Niue', ''),
(163, 'NF', 'Norfolk Island', ''),
(164, 'MP', 'Northern Mariana Islands', ''),
(165, 'NO', 'Norway', ''),
(166, 'OM', 'Oman', ''),
(167, 'PK', 'Pakistan', ''),
(168, 'PW', 'Palau', ''),
(169, 'PS', 'Palestine', ''),
(170, 'PA', 'Panama', ''),
(171, 'PG', 'Papua New Guinea', ''),
(172, 'PY', 'Paraguay', ''),
(173, 'PE', 'Peru', ''),
(174, 'PH', 'Philippines', ''),
(175, 'PN', 'Pitcairn', ''),
(176, 'PL', 'Poland', ''),
(177, 'PT', 'Portugal', ''),
(178, 'PR', 'Puerto Rico', ''),
(179, 'QA', 'Qatar', ''),
(180, 'RE', 'Reunion', ''),
(181, 'RO', 'Romania', ''),
(182, 'RU', 'Russian Federation', ''),
(183, 'RW', 'Rwanda', ''),
(184, 'KN', 'Saint Kitts and Nevis', ''),
(185, 'LC', 'Saint Lucia', ''),
(186, 'VC', 'Saint Vincent and the Grenadines', ''),
(187, 'WS', 'Samoa', ''),
(188, 'SM', 'San Marino', ''),
(189, 'ST', 'Sao Tome and Principe', ''),
(190, 'SA', 'Saudi Arabia', ''),
(191, 'SN', 'Senegal', ''),
(192, 'RS', 'Serbia', ''),
(193, 'SC', 'Seychelles', ''),
(194, 'SL', 'Sierra Leone', ''),
(195, 'SG', 'Singapore', ''),
(196, 'SK', 'Slovakia', ''),
(197, 'SI', 'Slovenia', ''),
(198, 'SB', 'Solomon Islands', ''),
(199, 'SO', 'Somalia', ''),
(200, 'ZA', 'South Africa', ''),
(201, 'GS', 'South Georgia South Sandwich Islands', ''),
(202, 'ES', 'Spain', ''),
(203, 'LK', 'Sri Lanka', ''),
(204, 'SH', 'St. Helena', ''),
(205, 'PM', 'St. Pierre and Miquelon', ''),
(206, 'SD', 'Sudan', ''),
(207, 'SR', 'Suriname', ''),
(208, 'SJ', 'Svalbard and Jan Mayen Islands', ''),
(209, 'SZ', 'Swaziland', ''),
(210, 'SE', 'Sweden', ''),
(211, 'CH', 'Switzerland', ''),
(212, 'SY', 'Syrian Arab Republic', ''),
(213, 'TW', 'Taiwan', ''),
(214, 'TJ', 'Tajikistan', ''),
(215, 'TZ', 'Tanzania, United Republic of', ''),
(216, 'TH', 'Thailand', ''),
(217, 'TG', 'Togo', ''),
(218, 'TK', 'Tokelau', ''),
(219, 'TO', 'Tonga', ''),
(220, 'TT', 'Trinidad and Tobago', ''),
(221, 'TN', 'Tunisia', ''),
(222, 'TR', 'Turkey', ''),
(223, 'TM', 'Turkmenistan', ''),
(224, 'TC', 'Turks and Caicos Islands', ''),
(225, 'TV', 'Tuvalu', ''),
(226, 'UG', 'Uganda', ''),
(227, 'UA', 'Ukraine', ''),
(228, 'AE', 'United Arab Emirates', ''),
(229, 'GB', 'United Kingdom', ''),
(230, 'US', 'United States', ''),
(231, 'UM', 'United States minor outlying islands', ''),
(232, 'UY', 'Uruguay', ''),
(233, 'UZ', 'Uzbekistan', ''),
(234, 'VU', 'Vanuatu', ''),
(235, 'VA', 'Vatican City State', ''),
(236, 'VE', 'Venezuela', ''),
(237, 'VN', 'Vietnam', ''),
(238, 'VG', 'Virgin Islands (British)', ''),
(239, 'VI', 'Virgin Islands (U.S.)', ''),
(240, 'WF', 'Wallis and Futuna Islands', ''),
(241, 'EH', 'Western Sahara', ''),
(242, 'YE', 'Yemen', ''),
(243, 'ZR', 'Zaire', ''),
(244, 'ZM', 'Zambia', ''),
(245, 'ZW', 'Zimbabwe', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_currencies`
--

CREATE TABLE `xin_currencies` (
  `currency_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_currencies`
--

INSERT INTO `xin_currencies` (`currency_id`, `company_id`, `name`, `code`, `symbol`) VALUES
(1, 1, 'Dollars', 'USD', '$'),
(2, 1, 'Pakistani Rupees', 'PKR', 'Rs.');

-- --------------------------------------------------------

--
-- Table structure for table `xin_currency_converter`
--

CREATE TABLE `xin_currency_converter` (
  `currency_converter_id` int(11) NOT NULL,
  `usd_currency` varchar(11) NOT NULL DEFAULT '1',
  `to_currency_title` varchar(200) NOT NULL,
  `to_currency_rate` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_currency_converter`
--

INSERT INTO `xin_currency_converter` (`currency_converter_id`, `usd_currency`, `to_currency_title`, `to_currency_rate`, `created_at`) VALUES
(1, '1', 'MYR', '4.11', '17-08-2018 03:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `xin_database_backup`
--

CREATE TABLE `xin_database_backup` (
  `backup_id` int(111) NOT NULL,
  `backup_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_departments`
--

CREATE TABLE `xin_departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `location_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_departments`
--

INSERT INTO `xin_departments` (`department_id`, `department_name`, `company_id`, `location_id`, `employee_id`, `added_by`, `created_at`, `status`) VALUES
(1, 'MD Office', 1, 1, 5, 0, '06-03-2018', 1),
(2, 'Accounts and  Finances', 1, 1, 5, 1, '17-03-2018', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_designations`
--

CREATE TABLE `xin_designations` (
  `designation_id` int(11) NOT NULL,
  `top_designation_id` int(11) NOT NULL DEFAULT 0,
  `department_id` int(200) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `designation_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_designations`
--

INSERT INTO `xin_designations` (`designation_id`, `top_designation_id`, `department_id`, `sub_department_id`, `company_id`, `designation_name`, `description`, `added_by`, `created_at`, `status`) VALUES
(9, 0, 1, 8, 1, 'Software Developer', '', 1, '06-03-2018', 1),
(10, 0, 2, 10, 1, 'Finance', '', 1, '18-03-2018', 1),
(11, 0, 1, 0, 1, 'Head of Operations and Project Delivery', '', 1, '06-11-2020', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_device_tokens`
--

CREATE TABLE `xin_device_tokens` (
  `token_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `device_token` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_device_tokens`
--

INSERT INTO `xin_device_tokens` (`token_id`, `employee_id`, `device_token`) VALUES
(1, 96, 'eO4vHZ1yRrOC6OHRH2joUZ:APA91bFSPMldDpTVMpIv8uZu5BgiaARqdsJKT9Sb1Qlmf5D0Gq8BqzKseIiF8sl7P41x_dnN86T6gNUImelRWLNEO4DN_1uSaSSy9W2cU4SYiQTKLd90aR4ttD7vMpPEc-rvRgFYSNkh'),
(2, 6, 'dTZprE8BSA2NKeikUPeDQ_:APA91bHIsOUlTMJ-2iLeExkuoum6ERvgPZX5ZJG7hvxpke3v7-f7LuAtAjHTFFK4vogTwKgWLHpv8XvivEkXOAu3ENX_ywoDYL2CbE0m31ftG3M0ZMbq2NujfMNpudlj0lLd2UUbaSC8'),
(3, 420, 'eO4vHZ1yRrOC6OHRH2joUZ:APA91bFSPMldDpTVMpIv8uZu5BgiaARqdsJKT9Sb1Qlmf5D0Gq8BqzKseIiF8sl7P41x_dnN86T6gNUImelRWLNEO4DN_1uSaSSy9W2cU4SYiQTKLd90aR4ttD7vMpPEc-rvRgFYSNkh'),
(4, 9792, 'eO4vHZ1yRrOC6OHRH2joUZ:APA91bHkrJdJwYlKYCwCSTrmooDgR6BkueRTifIaO8jlHI7zmVd_yp_vBmroRUrvizKSK7sV4LzT7ziXqQD7FsDoQbngyd7pQc4qW63oGFzYo9q_HCDuUY2SpqQv1vxhccpnZaMMr0v6'),
(5, 9794, 'eO4vHZ1yRrOC6OHRH2joUZ:APA91bHkrJdJwYlKYCwCSTrmooDgR6BkueRTifIaO8jlHI7zmVd_yp_vBmroRUrvizKSK7sV4LzT7ziXqQD7FsDoQbngyd7pQc4qW63oGFzYo9q_HCDuUY2SpqQv1vxhccpnZaMMr0v6'),
(6, 9795, 'eO4vHZ1yRrOC6OHRH2joUZ:APA91bHkrJdJwYlKYCwCSTrmooDgR6BkueRTifIaO8jlHI7zmVd_yp_vBmroRUrvizKSK7sV4LzT7ziXqQD7FsDoQbngyd7pQc4qW63oGFzYo9q_HCDuUY2SpqQv1vxhccpnZaMMr0v6');

-- --------------------------------------------------------

--
-- Table structure for table `xin_document_type`
--

CREATE TABLE `xin_document_type` (
  `document_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_document_type`
--

INSERT INTO `xin_document_type` (`document_type_id`, `company_id`, `document_type`, `created_at`) VALUES
(1, 1, 'Driving License', '0000-00-00 00:00:00'),
(2, 1, 'Certificate', '2020-11-06 11:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `xin_education_level`
--

CREATE TABLE `xin_education_level` (
  `minimum_education_id` int(11) NOT NULL,
  `minimum_education` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_education_level`
--

INSERT INTO `xin_education_level` (`minimum_education_id`, `minimum_education`, `created_at`) VALUES
(1, 'Bachelor\'s in Computer Science', '2020-10-22 04:29:08'),
(2, 'Master\'s in Computer Science', '2020-10-22 04:29:08'),
(3, 'Bachelor\'s in Software Engineering', '2020-10-22 04:29:40'),
(4, 'Diploma in Computer Science', '2020-10-22 04:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `xin_email_configuration`
--

CREATE TABLE `xin_email_configuration` (
  `email_config_id` int(11) NOT NULL,
  `email_type` enum('phpmail','smtp','codeigniter') COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_secure` enum('tls','ssl') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `xin_email_configuration`
--

INSERT INTO `xin_email_configuration` (`email_config_id`, `email_type`, `smtp_host`, `smtp_username`, `smtp_password`, `smtp_port`, `smtp_secure`) VALUES
(1, 'phpmail', 'smtp.gmail.com', 'demo@gmail.com', '123456', 587, 'tls');

-- --------------------------------------------------------

--
-- Table structure for table `xin_email_template`
--

CREATE TABLE `xin_email_template` (
  `template_id` int(111) NOT NULL,
  `template_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_email_template`
--

INSERT INTO `xin_email_template` (`template_id`, `template_code`, `name`, `subject`, `message`, `status`) VALUES
(2, 'code1', 'Forgot Password', 'Forgot Password', '                            <p><span xss=\"removed\">Hello,</span></p><p><span xss=\"removed\">There was recently a request for password for your {var site_name} account.</span></p><p><span xss=\"removed\">If this was a mistake, just ignore this email and nothing will happen.</span></p><p><span xss=\"removed\">To reset your password, visit the following link <a href=\"{var reset_url}admin/reset_password?change=true&email={var email}\">Reset Password</a></span></p><p><span xss=\"removed\">Regards,</span></p><p><span xss=\"removed\">The {var site_name} Team</span></p>', 1),
(3, 'code2', 'New Project', 'New Project', '                                <p>Hi {var employee_name},</p><p>New project has been assigned to you.</p><p>Project Name: {var project_name}</p><p>Project Start Date: <span>{var project_start_date}</span></p><p><br><span>You can view the project by logging in to the portal using the link below.</span></p><p><span>{var site_url}admin/</span></p><p><span>Regards</span><br></p><p>The {var site_name} Team</p>', 1),
(5, 'code3', 'Leave Request ', 'A Leave Request from you', '            <p>Dear Admin,</p><p>{var employee_name} wants a leave from you.</p><p>You can view this leave request by logging in to the portal using the link below.</p><p>{var site_url}admin/<br><br>Regards,</p><p>The {var site_name} Team</p>', 1),
(6, 'code4', 'Leave Approve', 'Your leave request has been approved', '                <p>Hello,</p><p>Your leave request has been approved</p><p><span xss=\"removed\">Congratulations! </span>Your leave request from<font face=\"sans-serif, Arial, Verdana, Trebuchet MS\" color=\"#333333\"> </font>{var leave_start_date} to {var leave_end_date} has been approved by your company management.</p><p><span>You can view the leave by logging in to the portal using the link below.</span></p><p>{var site_url}admin/<br></p><p>Regards,<br>The {var site_name} Team</p>', 1),
(7, 'code5', 'Leave Reject', 'Your leave request has been Rejected', '                <p>Hello,</p><p>Your leave request has been Rejected</p><p>Unfortunately! Your leave request from {var leave_start_date} to {var leave_end_date} has been Rejected by your company management.</p><p><span>You can view the leave by logging in to the portal using the link below.</span></p><p>{var site_url}admin/</p><p>Regards,</p><p>The {var site_name} Team</p>', 1),
(8, 'code6', 'Welcome Email ', 'Welcome Email ', '            <p>Hello {var employee_name},</p><p>Welcome to {var site_name} .Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe.</p><p>Your Username: {var username}</p><p>Your Employee ID: {var employee_id}</p><p>Your Email Address: {var email}<br></p><p>Your Password: {var password}</p><p>Your Password: {var pincode}</p><p><span>You can logging in to the portal using the link below</span></p><p>{var site_url}admin/</p><br><p>Thank you,</p><p>The {var site_name} Team</p>', 1),
(9, 'code7', 'Transfer', 'New Transfer', '        <p>Hello {var employee_name},</p><p>You have been transfered to another department and location.</p><p>You can view the transfer details by logging in to the portal using the link below.</p><p>{var site_url}admin/</p><p>Regards,</p><p>The {var site_name} Team</p>', 1),
(10, 'code8', 'Award', 'New Award Received', '    <p>Hello {var employee_name},</p><p>You have been awarded {var award_name}.</p><p>You can view this award by logging in to the portal using the link below.</p><p><span xss=\"removed\">{var site_url}admin</span><span xss=\"removed\">/awards/</span><br></p><p>Regards,</p><p>The {var site_name} Team</p>', 1),
(14, 'code9', 'New Task', 'Task assigned', '    <p>Hi {employee_name},</p><p>A new task <span>{var task_name}</span> has been assigned to [{project_name}]</p><p>You can view this task by logging in to the portal using the link below.</p><p>{var site_url}</p><p>Regards,</p><p>The {var site_name} Team</p>', 1),
(15, 'code10', 'New Inquiry', 'New Inquiry [#{var ticket_code}]', '    <p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Hi,</span><br></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Your received a new inquiry.</span></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\"><span xss=\"\\\\\\\\\">Inquiry Code: #{var ticket_code}</span></p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">Status : Open<br><br>Click on the below link to see the inquiry details and post additional comments.</p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">{var site_url}admin/<br><br>Regards,</p><p xss=\"\\\\\\\\\" rgb(51,=\"\\\" font-family:=\"\\\" sans-serif,=\"\\\" arial,=\"\\\" verdana,=\"\\\\\" trebuchet=\"\\\\\\\\\">The {var site_name} Team</p>', 1),
(16, 'code11', 'Client Welcome Email', 'Welcome Email', '        <p>Hello {var client_name},</p><p>Welcome to {var site_name}. Thanks for joining {var site_name}. We listed your sign in details below, make sure you keep them safe. You can login to your panel using email and password.</p><p>Your Username: {var username}</p><p><span xss=\"\\\\\\\\\">Your Email Address: {var email}</span></p><p>Your Password: {var password}<br></p><p>{var site_url}client/</p><p>Have fun!</p><p>The {var site_name} Team</p>', 1),
(17, 'code12', 'Password Changed Successfully', 'Password Changed Successfully', '    <p>Hello,</p><p>Congratulations! Your password has been updated successfully.</p><p>Your new password is: {var password}</p><p>Your new pincode: {var pincode}<br></p><p>Thank you,<br>The {var site_name} Team<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_employees`
--

CREATE TABLE `xin_employees` (
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `office_shift_id` int(111) NOT NULL,
  `reports_to` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pincode` int(11) NOT NULL,
  `password` varchar(200) NOT NULL,
  `date_of_birth` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `e_status` int(11) NOT NULL,
  `user_role_id` int(100) NOT NULL,
  `department_id` int(100) NOT NULL,
  `sub_department_id` int(11) NOT NULL,
  `designation_id` int(100) NOT NULL,
  `company_id` int(111) DEFAULT 1,
  `location_id` int(11) NOT NULL,
  `view_companies_id` varchar(255) NOT NULL,
  `salary_template` varchar(255) NOT NULL,
  `hourly_grade_id` int(111) NOT NULL,
  `monthly_grade_id` int(111) NOT NULL,
  `date_of_joining` varchar(200) NOT NULL,
  `date_of_leaving` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `wages_type` int(11) NOT NULL,
  `basic_salary` varchar(200) NOT NULL DEFAULT '0',
  `daily_wages` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempee` varchar(200) NOT NULL DEFAULT '0',
  `salary_ssempeer` varchar(200) DEFAULT '0',
  `salary_income_tax` varchar(200) NOT NULL DEFAULT '0',
  `salary_overtime` varchar(200) NOT NULL DEFAULT '0',
  `salary_commission` varchar(200) NOT NULL DEFAULT '0',
  `salary_claims` varchar(200) NOT NULL DEFAULT '0',
  `salary_paid_leave` varchar(200) NOT NULL DEFAULT '0',
  `salary_director_fees` varchar(200) NOT NULL DEFAULT '0',
  `salary_bonus` varchar(200) NOT NULL DEFAULT '0',
  `salary_advance_paid` varchar(200) NOT NULL DEFAULT '0',
  `address` mediumtext NOT NULL,
  `state` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `profile_picture` mediumtext NOT NULL,
  `profile_background` mediumtext NOT NULL,
  `resume` mediumtext NOT NULL,
  `skype_id` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `facebook_link` mediumtext NOT NULL,
  `twitter_link` mediumtext NOT NULL,
  `blogger_link` mediumtext NOT NULL,
  `linkdedin_link` mediumtext NOT NULL,
  `google_plus_link` mediumtext NOT NULL,
  `instagram_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `youtube_link` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(111) NOT NULL,
  `online_status` int(111) NOT NULL,
  `fixed_header` varchar(150) NOT NULL,
  `compact_sidebar` varchar(150) NOT NULL,
  `boxed_wrapper` varchar(150) NOT NULL,
  `leave_categories` varchar(255) NOT NULL DEFAULT '0',
  `ethnicity_type` int(11) NOT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `nationality_id` int(11) NOT NULL,
  `citizenship_id` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employees`
--

INSERT INTO `xin_employees` (`user_id`, `employee_id`, `office_shift_id`, `reports_to`, `first_name`, `last_name`, `username`, `email`, `pincode`, `password`, `date_of_birth`, `gender`, `e_status`, `user_role_id`, `department_id`, `sub_department_id`, `designation_id`, `company_id`, `location_id`, `view_companies_id`, `salary_template`, `hourly_grade_id`, `monthly_grade_id`, `date_of_joining`, `date_of_leaving`, `marital_status`, `salary`, `wages_type`, `basic_salary`, `daily_wages`, `salary_ssempee`, `salary_ssempeer`, `salary_income_tax`, `salary_overtime`, `salary_commission`, `salary_claims`, `salary_paid_leave`, `salary_director_fees`, `salary_bonus`, `salary_advance_paid`, `address`, `state`, `city`, `zipcode`, `profile_picture`, `profile_background`, `resume`, `skype_id`, `contact_no`, `facebook_link`, `twitter_link`, `blogger_link`, `linkdedin_link`, `google_plus_link`, `instagram_link`, `pinterest_link`, `youtube_link`, `is_active`, `last_login_date`, `last_logout_date`, `last_login_ip`, `is_logged_in`, `online_status`, `fixed_header`, `compact_sidebar`, `boxed_wrapper`, `leave_categories`, `ethnicity_type`, `blood_group`, `nationality_id`, `citizenship_id`, `created_at`) VALUES
(1, 'fionagrace', 1, 0, 'admin', 'admin', 'admin admin', 'admin@gmail.com', 0, '$2y$12$dB0zLVYDM3h7fWOxYV4/Y.HFAMLwMLBvGvLkivaG6zoJra9Ji0qci', '2018-03-28', 'Male', 0, 1, 2, 0, 10, 1, 1, '0', 'monthly', 0, 0, '2018-02-01', '', 'Single', '', 1, '1000', '0', '8', '17', '10', '0', '1', '2', '3', '0', '0', '0', 'Test Address', '', '', '', 'profile_1546421723.png', 'profile_background_1519924152.jpg', '', '', '12345678900', '', '', '', '', '', '', '', '', 1, '13-11-2020 12:05:45', '12-11-2020 18:29:02', '10.0.115.101', 1, 1, 'fixed_layout_hrsale', '', '', '0,1,2', 0, NULL, 0, 0, '2018-02-28 05:30:44'),
(3, '3', 1, 0, '', '', 'shh', 't@gmail.com', 0, '$2y$12$VKf97RRt9rioqr.GR5fgWu5Bj2v2xFE2EIU.d4XKYmAip6i6WNk0i', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(5, 'jsmith12', 1, 0, 'Jhon', 'Smith', 'jhonsmith', 'jsmt12@hrsale.com', 0, '$2y$12$zjBiQwIQG7vmgGeq935iqOCDiQVREZgA3VsN44YderDI5YoXKkWdi', '2018-03-31', 'Male', 0, 2, 2, 10, 10, 1, 0, '', 'monthly', 0, 0, '2018-03-02', '', 'Single', '', 1, '10000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'jsmt12', '', '', '', '', '', '', '', '1232', '', '', '', '', '', '', '', '', 1, '17-04-2019 08:42:32', '26-03-2019 07:31:01', '::1', 1, 1, '', '', '', '0,1,2', 0, NULL, 0, 0, '2018-03-18 01:10:04'),
(6, '875119', 1, 5, 'waseem', 'chandio', 'm.hamid', 'w@b.com', 903108, '$2y$12$rlzp87J7Ga9IRZyf7Sn7yuBWIsgbwFlvodDpcwiDxkQ.Bb5AJ8uKq', '2020-01-02', 'Male', 0, 2, 1, 0, 9, 1, 1, '', '', 0, 0, '2020-10-22', '', 'Single', '', 1, '123000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Karachi', '', '', '', '', '', '', '', '03220120003', '', '', '', '', '', '', '', '', 1, '27-10-2020 13:35:07', '27-10-2020 16:33:33', '10.0.115.101', 0, 0, '', '', '', '0,1,2,3', 0, 'B+ve', 0, 0, '2020-10-22 08:14:08'),
(8, '8', 1, 0, '', '', 'shh', 't@gmail.com', 0, '$2y$12$98hE8MiBCeSx2MHJQSnEDeJgrFkZZ1/KExyQGpQ2fqVcrZM5F4t9.', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(12, '12', 1, 0, '', '', 'ali', 'ali@gmail.com', 0, '$2y$12$lo7H5hxKtEnknaW/QJk6EOV6mQUgjFD5lrY4j6yi2Q/yw2sZxigga', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(14, '14', 1, 0, '', '', 'ملک', 'm.uzair@monet-online.net', 0, '$2y$12$NV09soCgbDZlI3Q3nPELROcvGpAjEb3Ll1FOV4bj4YSdgaw/Nu.iC', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(23, '23', 1, 0, '', '', 'ali', 'ali@gmail.com', 0, '$2y$12$snN7LcupUDu9wLWBg835iuNVcJO1yRCQiZc69IHBE2Z3rNIteHi0q', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(25, '25', 1, 0, '', '', 'uzair', 'm.uzair@monet-online.net', 0, '$2y$12$2.iMhfQylGE23zPL53gtmu.fJFhxbf1lr2P5PdJTEaXFYmmNrTeuu', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 1, '010000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(33, '33', 1, 0, '', '', 'Waseemali', 'waseem@gmail.com', 0, '$2y$12$b9eXJszecbJiTeeC6X84Y.oVxOc6nuB/1H6O5JvFMA2cAKCoPH9xS', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 1, '2300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(45, '45', 1, 0, '', '', 'ttgc@#@_gff', 'ali@gmail.com', 0, '$2y$12$tqkDhkky23OyzTmInIOxsO9yNzyuL8uYYLzmy4aM6LRxFp2Bp5pIS', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(53, '53', 1, 0, '', '', 'Waseemali', 'wasem@gmail.com', 0, '$2y$12$Yzlkr3E2oT3YRQYhpTLQC.I/0p8AluwZvcNsiGlAHDW91Om/QITee', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(56, '56', 1, 0, '', '', 'uzair', 'uzaird7@gmail.com', 0, '$2y$12$o/8hL878P3ORRAEo9CfuSe7ql8mEkJEuP5QjsPC.d2gvXrI1A1ac2', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(88, '88', 1, 0, '', '', 'khan', 'Khan@gmail.com', 0, '$2y$12$t67YGSPcMtMcw6NBTwSobuw/yqUpRKlefn2oou2CmVCvzZ4KGgGb.', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(96, '96', 1, 0, 'Ali', 'Askari', 'waseem', 'baisha@hotmail.com', 0, '$2y$12$/o7TI64K2J6iPXb4p7JITunb/pZUL0xQ.1RPAZApTv5CPtJmA4usy', '2000-01-23', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', 'single', '', 1, '200000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Khi', '', '', '', '', '', '', '', '02030020312', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0', 0, 'b+ve', 0, 0, ''),
(353, '353', 1, 0, '', '', 'Waseemali', 'wasem@gmail.com', 0, '$2y$12$Q9PnHYytMLFiik10OXvNWOM4Rw6oz0.2K52kZYCwgaQ2yam84aS2.', '', '', 0, 2, 1, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(420, '420', 1, 0, '', '', '....', 'ali90@gmail.com', 0, '$2y$12$8mpCxXijTyuf3do7Wcy9fORiQa2/4QyXtfAYrH0414CPB1tePJKYi', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(886, '886', 1, 0, '', '', 'g', 'f@gmail.com', 0, '$2y$12$zPxDxl53eLxzX/Tz28bNPeip1YKnMN8xYLyhYbRP8YXN4aV0wwAmG', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(3534, '3534', 1, 0, '', '', 'Uzair Hussain', 'm.uzair@monet-online.net', 0, '$2y$12$3mXRQ3n/Hh.gMQdGRhEuteArVxJkKleqPAu6IGrEAr.1gp/RYmK46', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 1, '122000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(9791, '9791', 1, 0, '', '', 'Waseem', 'waseem@gmail.com', 0, '$2y$12$Ra0gy3t/QM2o73ZC9KSpg.aU8drqmKQrMF3NO5r7.f7iiFSi3rLzS', '', '', 0, 2, 0, 0, 0, 1, 0, '', '', 0, 0, '', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, ''),
(9792, '533608', 1, 0, 'Uzair', 'Hussain', 'uzair90', 'uzair@gmail.com', 963027, '$2y$12$dYsV9P7IXBiL5a/zClDL0eYROvd0XRrxgsGK4O1bsvMdYES.WAl1K', '1988-01-05', 'Male', 0, 2, 1, 0, 9, 1, 1, '', '', 0, 0, '2020-11-05', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'north karachi', '', '', '', '', '', '', '', '03312324908', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0', 0, NULL, 0, 0, '2020-11-05 06:50:12'),
(9793, '429671', 1, 6, 'Ali', 'Ansari', 'aliz', 'aliz@gmail.com', 928420, '$2y$12$gQOpunNTgoVkmHqQ2BuB4uifID0.swfoASDRlRux/oWYGdIfUg04O', '1999-11-04', 'Male', 0, 2, 1, 0, 9, 1, 1, '', '', 0, 0, '2020-09-03', '', '', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'north larachi', '', '', '', '', '', '', '', '03212289921', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0,1', 0, NULL, 0, 0, '2020-11-05 07:26:21'),
(9794, '013278', 1, 0, 'Waseem', 'Shahzad', 'waseem90', 'waseemshahzad@monet-online.net', 123456, '$2y$12$vZlzYvWj.JHD9oqCsM1vve7VwY.j7ANFXNLZDFr119ksHHzuKTGGW', '2000-12-14', 'Male', 0, 2, 1, 0, 11, 1, 1, '0', '', 0, 0, '2015-11-13', '', 'Married', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'model colony', '', '', '', '', '', '', '', '03002222333', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0,1', 0, '', 0, 0, '2020-11-06 05:50:26'),
(9795, '808730', 1, 9794, 'Abrar', 'Hasan', 'abrar90', 'abrarhasan@monet-online.net', 929184, '$2y$12$FzGdjerKUns78vaKU0/9GesCcdWQ7tyYIUjG.BzsrXDLKQcV75Rm2', '9/11/2003', 'Male', 0, 2, 1, 0, 11, 1, 1, '', '', 0, 0, '2020-11-09', '', 'Married', '', 0, '2300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Dha phase 0 karachi', '', '', '', '', '', '', '', '03452866671', '', '', '', '', '', '', '', '', 1, '', '', '', 0, 0, '', '', '', '0,1', 0, 'B negative', 0, 0, '2020-11-09 07:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_bankaccount`
--

CREATE TABLE `xin_employee_bankaccount` (
  `bankaccount_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `is_primary` int(11) NOT NULL,
  `account_title` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_code` varchar(255) NOT NULL,
  `bank_branch` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_complaints`
--

CREATE TABLE `xin_employee_complaints` (
  `complaint_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `complaint_from` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `complaint_date` varchar(255) NOT NULL,
  `complaint_against` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_contacts`
--

CREATE TABLE `xin_employee_contacts` (
  `contact_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `is_primary` int(111) NOT NULL,
  `is_dependent` int(111) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `work_phone` varchar(255) NOT NULL,
  `work_phone_extension` varchar(255) NOT NULL,
  `mobile_phone` varchar(255) NOT NULL,
  `home_phone` varchar(255) NOT NULL,
  `work_email` varchar(255) NOT NULL,
  `personal_email` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_contract`
--

CREATE TABLE `xin_employee_contract` (
  `contract_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `contract_type_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_documents`
--

CREATE TABLE `xin_employee_documents` (
  `document_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `document_type_id` int(111) NOT NULL,
  `date_of_expiry` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `notification_email` varchar(255) NOT NULL,
  `is_alert` tinyint(1) NOT NULL,
  `description` mediumtext NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_documents`
--

INSERT INTO `xin_employee_documents` (`document_id`, `employee_id`, `document_type_id`, `date_of_expiry`, `title`, `notification_email`, `is_alert`, `description`, `document_file`, `created_at`) VALUES
(1, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-22 12:58:30'),
(2, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-22 12:58:48'),
(3, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-22 13:18:18'),
(4, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-22 14:27:53'),
(5, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-22 14:31:40'),
(6, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-23 12:06:17'),
(7, 6, 2, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_2f26dcf30cb62fb5247912b3f81521cd.png', '2020-10-23 14:25:29'),
(8, 6, 2, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_684025a2eaf529ed47a8706c559919b7.png', '2020-10-23 14:25:32'),
(9, 6, 2, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_1cb9da33574e8745ac7b612531bf7edd.png', '2020-10-23 14:25:35'),
(10, 6, 1, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_5236a510eec587d3cd9295fa365ce3dd.png', '2020-10-23 14:25:36'),
(11, 6, 2, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_36381c5741ba300b754ea73bfb828ae9.png', '2020-10-23 14:25:36'),
(12, 6, 2, '', 'Certificate', '', 0, 'ese hi', 'hrms-api/uploads/employee_document/certificate_bd9941a71bd0684c7bba950c52d03e21.png', '2020-10-23 14:25:36'),
(13, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 07:46:02'),
(14, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:35:02'),
(15, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:38:27'),
(16, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:48:58'),
(17, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:55:31'),
(18, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:55:39'),
(19, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 08:55:47'),
(20, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 10:52:38'),
(21, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:15:54'),
(22, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:17:56'),
(23, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:21:29'),
(24, 6, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:21:46'),
(25, 6, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:22:18'),
(26, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:22:29'),
(27, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:29:20'),
(28, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:29:54'),
(29, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:31:07'),
(30, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:36:36'),
(31, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:43:52'),
(32, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:55:53'),
(33, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:57:06'),
(34, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:58:14'),
(35, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 11:59:28'),
(36, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:00:40'),
(37, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:01:52'),
(38, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:03:45'),
(39, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:04:56'),
(40, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:08:18'),
(41, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:09:16'),
(42, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 12:18:49'),
(43, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 13:40:08'),
(44, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 13:40:18'),
(45, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 13:42:57'),
(46, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-28 13:43:28'),
(47, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-10-29 06:36:08'),
(48, 6, 2, '', 'Certificate', '', 0, 'Certificate', 'hrms-api/uploads/employee_document/certificate_3b5d9608b87ad49aac9c8cc801224eaa.png', '2020-11-04 11:53:35'),
(49, 6, 2, '', 'Certificate', '', 0, 'nothing', 'hrms-api/uploads/employee_document/certificate_1efcb56b491fe526e2314ceeff3a3984.png', '2020-11-04 12:10:05'),
(50, 6, 2, '', 'Certificate', '', 0, 'nothing', 'hrms-api/uploads/employee_document/certificate_6d7516cdb7e0ecd5d60e1f3e977861e9.png', '2020-11-04 12:11:39'),
(51, 6, 2, '', 'Certificate', '', 0, 'fuf', 'hrms-api/uploads/employee_document/certificate_47b02af76c7b10e5a72a6cffd276fa23.png', '2020-11-04 12:13:52'),
(52, 6, 2, '', 'Certificate', '', 0, 'nothing', 'hrms-api/uploads/employee_document/certificate_313fd52900c9cc8fc905acfc64c3d674.png', '2020-11-05 12:48:24'),
(53, 96, 2, '', 'Certificate', '', 0, 'Certification', 'hrms-api/uploads/employee_document/0', '2020-11-13 07:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_eobi_amount`
--

CREATE TABLE `xin_employee_eobi_amount` (
  `amount_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `eobi_amount` varchar(100) NOT NULL,
  `month_year` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_employee_eobi_amount`
--

INSERT INTO `xin_employee_eobi_amount` (`amount_id`, `employee_id`, `company_id`, `eobi_amount`, `month_year`, `created_at`) VALUES
(1, 6, 1, '1200', '2020-10', '2020-11-09 16:53:26'),
(2, 9795, 1, '1200', '2020-10', '2020-11-09 16:55:15'),
(3, 5, 1, '1200', '2020-10', '2020-11-10 17:52:21'),
(4, 25, 1, '1200', '2020-10', '2020-11-10 17:53:18'),
(5, 33, 1, '1200', '2020-10', '2020-11-12 15:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_exit`
--

CREATE TABLE `xin_employee_exit` (
  `exit_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `exit_date` varchar(255) NOT NULL,
  `exit_type_id` int(111) NOT NULL,
  `exit_interview` int(111) NOT NULL,
  `is_inactivate_account` int(111) NOT NULL,
  `reason` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_exit_type`
--

CREATE TABLE `xin_employee_exit_type` (
  `exit_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_exit_type`
--

INSERT INTO `xin_employee_exit_type` (`exit_type_id`, `company_id`, `type`, `created_at`) VALUES
(1, 1, 'Test', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_immigration`
--

CREATE TABLE `xin_employee_immigration` (
  `immigration_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `document_type_id` int(111) NOT NULL,
  `document_number` varchar(255) NOT NULL,
  `document_file` varchar(255) NOT NULL,
  `issue_date` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `eligible_review_date` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_leave`
--

CREATE TABLE `xin_employee_leave` (
  `leave_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `contract_id` int(111) NOT NULL,
  `casual_leave` varchar(255) NOT NULL,
  `medical_leave` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_location`
--

CREATE TABLE `xin_employee_location` (
  `office_location_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `location_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_promotions`
--

CREATE TABLE `xin_employee_promotions` (
  `promotion_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `promotion_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_provident_fund`
--

CREATE TABLE `xin_employee_provident_fund` (
  `fund_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `pfa_total` varchar(100) NOT NULL,
  `month_year` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_employee_provident_fund`
--

INSERT INTO `xin_employee_provident_fund` (`fund_id`, `employee_id`, `company_id`, `pfa_total`, `month_year`, `created_at`) VALUES
(1, 6, 1, '10246', '2020-10', '2020-11-09 16:44:01'),
(2, 9795, 1, '0', '2020-10', '2020-11-09 16:55:15'),
(3, 5, 1, '10246', '2020-10', '2020-11-10 17:52:21'),
(4, 25, 1, '834', '2020-10', '2020-11-10 17:53:18'),
(5, 33, 1, '192', '2020-10', '2020-11-12 15:55:29');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_qualification`
--

CREATE TABLE `xin_employee_qualification` (
  `qualification_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `education_level_id` int(111) NOT NULL,
  `from_year` varchar(255) NOT NULL,
  `language_id` int(111) NOT NULL,
  `to_year` varchar(255) NOT NULL,
  `skill_id` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_qualification`
--

INSERT INTO `xin_employee_qualification` (`qualification_id`, `employee_id`, `name`, `education_level_id`, `from_year`, `language_id`, `to_year`, `skill_id`, `description`, `created_at`) VALUES
(1, 96, 'Ubit', 2, '2020/01/01', 1, '2020-02-03', '', '', '2020-11-13 07:23:05'),
(2, 6, 'usindh', 2, '2020-01-23', 1, '2020-05-11', '', '', '2020-11-05 12:48:24'),
(3, 9795, 'Newport Institute of technology', 1, '2016-11-09', 1, '1970-01-01', '', '', '2020-11-09 11:21:41'),
(4, 6, 'UBIT', 2, '2011-06-13', 1, '2018-11-13', '', 'EDUCATION', '13-11-2020'),
(6, 6, 'UBIT', 2, '2020-01-02', 1, '2020-01-02', '', '', '2020-11-13 11:18:43'),
(7, 6, 'UBIT', 0, '2020-01-02', 1, '2020-01-02', '', '', '2020-11-13 12:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_resignations`
--

CREATE TABLE `xin_employee_resignations` (
  `resignation_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `notice_date` varchar(255) NOT NULL,
  `resignation_date` varchar(255) NOT NULL,
  `reason` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_security_level`
--

CREATE TABLE `xin_employee_security_level` (
  `security_level_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `security_type` int(11) NOT NULL,
  `date_of_clearance` varchar(200) NOT NULL,
  `expiry_date` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_shift`
--

CREATE TABLE `xin_employee_shift` (
  `emp_shift_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `shift_id` int(111) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_terminations`
--

CREATE TABLE `xin_employee_terminations` (
  `termination_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `terminated_by` int(111) NOT NULL,
  `termination_type_id` int(111) NOT NULL,
  `termination_date` varchar(255) NOT NULL,
  `notice_date` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_transfer`
--

CREATE TABLE `xin_employee_transfer` (
  `transfer_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `transfer_date` varchar(255) NOT NULL,
  `transfer_department` int(111) NOT NULL,
  `transfer_location` int(111) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_travels`
--

CREATE TABLE `xin_employee_travels` (
  `travel_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `visit_purpose` varchar(255) NOT NULL,
  `visit_place` varchar(255) NOT NULL,
  `travel_mode` int(111) DEFAULT NULL,
  `arrangement_type` int(111) DEFAULT NULL,
  `expected_budget` varchar(255) NOT NULL,
  `actual_budget` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_warnings`
--

CREATE TABLE `xin_employee_warnings` (
  `warning_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `warning_to` int(111) NOT NULL,
  `warning_by` int(111) NOT NULL,
  `warning_date` varchar(255) NOT NULL,
  `warning_type_id` int(111) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_employee_work_experience`
--

CREATE TABLE `xin_employee_work_experience` (
  `work_experience_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `post` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_employee_work_experience`
--

INSERT INTO `xin_employee_work_experience` (`work_experience_id`, `employee_id`, `company_name`, `from_date`, `to_date`, `post`, `description`, `created_at`) VALUES
(1, 96, 'Monet', '2020-09-01', '2020-02-09', 'Manager', '', '2020-11-13 07:23:05'),
(2, 6, 'monet', '2020-05-11', '2020-05-11', 'android', '', '2020-11-05 12:48:24'),
(3, 9795, 'Momet', '2015-05-08', '1970-01-01', 'Assistant manager', '', '2020-11-09 11:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `xin_eobi_amount`
--

CREATE TABLE `xin_eobi_amount` (
  `amount_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 1,
  `eobi_amount` varchar(200) NOT NULL,
  `eobi_employer_amount` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_eobi_amount`
--

INSERT INTO `xin_eobi_amount` (`amount_id`, `company_id`, `eobi_amount`, `eobi_employer_amount`, `created_at`) VALUES
(1, 1, '300', '900', '2020-10-29 15:29:41');

-- --------------------------------------------------------

--
-- Table structure for table `xin_ethnicity_type`
--

CREATE TABLE `xin_ethnicity_type` (
  `ethnicity_type_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_events`
--

CREATE TABLE `xin_events` (
  `event_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_date` varchar(255) NOT NULL,
  `event_time` varchar(255) NOT NULL,
  `event_note` mediumtext NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `image` text DEFAULT 'logo_1597746768.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_events`
--

INSERT INTO `xin_events` (`event_id`, `company_id`, `employee_id`, `event_title`, `event_date`, `event_time`, `event_note`, `event_color`, `created_at`, `image`) VALUES
(1, 1, '6', 'lunch treat', '2020-11-10', '18:47', 'Search the world\\&#039;s information, including webpages, images, videos and more.', '#fffbb2', '2020-11-02', 'logo_1597746768.jpg'),
(2, 1, '5', 'lunch tae', '2020-11-12', '18:00', 'zxxaaaa', '#8affff', '2020-11-02', 'logo_1597746768.jpg'),
(3, 1, '6', 'lunch tae', '2020-11-19', '18:03', 'rrrrr', '#59e6ff', '2020-11-02', 'logo_1597746768.jpg'),
(4, 1, '6', 'lunch tae', '2020-11-19', '18:05', 'errr', '#2655ff', '2020-11-02', 'logo_1597746768.jpg'),
(5, 1, '14', 'rrrrr', '2020-11-24', '18:11', 'last try.. sorry', '#2655ff', '2020-11-02', 'logo_1597746768.jpg'),
(6, 1, '53', 'lunch tae', '2020-11-18', '17:29', 'bnvgh', '#2655ff', '2020-11-02', 'logo_1597746768.jpg'),
(7, 1, '12', 'ess', '2020-11-24', '17:30', 'I need a button that will refresh the page on the user\\&#039;s click. I tried this:', '#2655ff', '2020-11-02', 'logo_1597746768.jpg'),
(12, 1, '8', 'qw', '2020-11-04', '17:44', 'tttttttttttt', '#2655ff', '2020-11-03', 'logo_1597746768.jpg'),
(13, 1, '5', 'rrrrr', '2020-11-05', '14:45', 'yyyyyyyyyyyyyyy', '#2655ff', '2020-11-03', 'logo_1597746768.jpg'),
(15, 1, '5', 'ess', '2020-11-23', '15:38', 'ewfjbwkjef', '#2655ff', '2020-11-03', 'logo_1597746768.jpg'),
(16, 1, '6', 'lunch tae', '2020-11-04', '18:11', 'qwertyuuii', '#2655ff', '2020-11-03', 'logo_1597746768.jpg'),
(17, 1, '5', 'lunch treat', '2020-11-05', '13:22', 'Thank you for taking me to lunch at [restaurant name]. I am grateful for our friendship and had fun at lunch. It was a nice treat for me and it made my day. I was very surprised that you took me to lunch!', '#2655ff', '2020-11-04', 'logo_1597746768.jpg'),
(18, 1, '6', 'ASD1', '2020-11-13', '13:30', 'Search the world\\&#039;s information, including webpages, images, videos and more. Google has many special features to help you find exactly what you\\&#039;re looking ...\r\n', '#ffbab8', '2020-11-12', 'logo_1597746768.jpg'),
(19, 1, '5', 'ASD', '2020-11-13', '13:40', '  $image[\\&#039;event_id\\&#039;] = $result;\r\n\r\n  $config[\\&#039;upload_path\\&#039;] = \\&#039;./uploads/event_images\\&#039;;\r\n        $config[\\&#039;allowed_types\\&#039;] = \\&#039;gif|jpg|png\\&#039;;\r\n        $config[\\&#039;max_size\\&#039;] = 2000;\r\n        $config[\\&#039;max_width\\&#039;] = 1500;\r\n        $config[\\&#039;max_height\\&#039;] = 1500;\r\n\r\n        $this-&gt;load-&gt;library(\\&#039;upload\\&#039;, $config);\r\n\r\n        if (!$this-&gt;upload-&gt;do_upload(\\&#039;event_image\\&#039;)) {\r\n   $error = array(\\&#039;error\\&#039; =&gt; $this-&gt;upload-&gt;display_errors());\r\n   $Return[\\&#039;error\\&#039;] = \\&quot;Not Supported\\&quot;;\r\n            //$this-&gt;load-&gt;view(\\&#039;files/upload_form\\&#039;, $error);\r\n        } else {\r\n   $data = array(\\&#039;image_metadata\\&#039; =&gt; $this-&gt;upload-&gt;data());\r\n   $image[\\&#039;image\\&#039;] = $data[\\&#039;image_metadata\\&#039;][\\&#039;file_name\\&#039;];\r\n   $event_image = $this-&gt;Events_model-&gt;add_image($image);\r\n        }\r\n', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(20, 1, '5', 'ASZ', '2020-11-13', '13:41', '  $image[\\&#039;event_id\\&#039;] = $result;\r\n\r\n  $config[\\&#039;upload_path\\&#039;] = \\&#039;./uploads/event_images\\&#039;;\r\n        $config[\\&#039;allowed_types\\&#039;] = \\&#039;gif|jpg|png\\&#039;;\r\n        $config[\\&#039;max_size\\&#039;] = 2000;\r\n        $config[\\&#039;max_width\\&#039;] = 1500;\r\n        $config[\\&#039;max_height\\&#039;] = 1500;\r\n\r\n        $this-&gt;load-&gt;library(\\&#039;upload\\&#039;, $config);\r\n\r\n        if (!$this-&gt;upload-&gt;do_upload(\\&#039;event_image\\&#039;)) {\r\n   $error = array(\\&#039;error\\&#039; =&gt; $this-&gt;upload-&gt;display_errors());\r\n   $Return[\\&#039;error\\&#039;] = \\&quot;Not Supported\\&quot;;\r\n            //$this-&gt;load-&gt;view(\\&#039;files/upload_form\\&#039;, $error);\r\n        } else {\r\n   $data = array(\\&#039;image_metadata\\&#039; =&gt; $this-&gt;upload-&gt;data());\r\n   $image[\\&#039;image\\&#039;] = $data[\\&#039;image_metadata\\&#039;][\\&#039;file_name\\&#039;];\r\n   $event_image = $this-&gt;Events_model-&gt;add_image($image);\r\n        }\r\n', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(21, 1, '5', 'AZ', '2020-11-20', '13:43', 'event_image', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(22, 1, '5', 'z', '2020-11-27', '13:44', 'event_image', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(23, 1, '6', 'm', '2020-11-19', '13:45', 'event_image', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(24, 1, '5', 'v', '2020-11-28', '13:49', ' public function add_image($image)\r\n {\r\n  $this-&gt;db-&gt;insert(\\&#039;xin_event_images\\&#039;, $image);\r\n  return true;\r\n }\r\n', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(25, 1, '5', 'ess', '2020-11-13', '13:53', ' public function add_image($image)\r\n {\r\n  $this-&gt;db-&gt;insert(\\&#039;xin_event_images\\&#039;, $image);\r\n  return true;\r\n }\r\n', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(26, 1, '6', 'sww', '2020-11-13', '13:54', ' public function add_image($image)\r\n {\r\n  $this-&gt;db-&gt;insert(\\&#039;xin_event_images\\&#039;, $image);\r\n  return true;\r\n }\r\n', '#2655ff', '2020-11-12', 'logo_1597746768.jpg'),
(27, 1, '5', 'lunch tae', '2020-11-21', '15:21', ' public function add_image($image)\r\n {\r\n  $this-&gt;db-&gt;insert(\\&#039;xin_event_images\\&#039;, $image);\r\n  return true;\r\n }', '#2655ff', '2020-11-12', 'logo_1597746768.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `xin_event_images`
--

CREATE TABLE `xin_event_images` (
  `image_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_event_images`
--

INSERT INTO `xin_event_images` (`image_id`, `event_id`, `image`, `created_at`) VALUES
(1, 1, 'download2.png', '2020-11-02 16:47:42'),
(2, 2, 'download3.png', '2020-11-02 17:01:05'),
(3, 3, 'download4.png', '2020-11-02 17:03:57'),
(4, 5, 'php.png', '2020-11-02 17:12:06'),
(5, 7, 'download11.png', '2020-11-02 17:31:09'),
(6, 8, 'download12.png', '2020-11-02 17:31:40'),
(7, 10, 'download121.png', '2020-11-03 14:42:19'),
(8, 12, 'php1.png', '2020-11-03 14:44:33'),
(9, 13, 'php2.png', '2020-11-03 14:45:38'),
(10, 15, 'php3.png', '2020-11-03 15:38:24'),
(11, 16, 'php4.png', '2020-11-03 18:11:28'),
(12, 17, 'download5.png', '2020-11-04 13:22:51'),
(13, 25, 'logo_1603284268.png', '2020-11-12 13:53:17'),
(14, 26, 'logo_16032842681.png', '2020-11-12 13:54:59'),
(15, 27, 'logo_1597746768.jpg', '2020-11-12 15:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `xin_expenses`
--

CREATE TABLE `xin_expenses` (
  `expense_id` int(11) NOT NULL,
  `employee_id` int(200) NOT NULL,
  `company_id` int(11) NOT NULL,
  `expense_type_id` int(200) NOT NULL,
  `billcopy_file` mediumtext NOT NULL,
  `amount` varchar(200) NOT NULL,
  `purchase_date` varchar(200) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `status_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_expense_type`
--

CREATE TABLE `xin_expense_type` (
  `expense_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_expense_type`
--

INSERT INTO `xin_expense_type` (`expense_type_id`, `company_id`, `name`, `status`, `created_at`) VALUES
(1, 1, 'Supplies', 1, '22-03-2018 01:17:42'),
(2, 1, 'Utility', 1, '22-03-2018 01:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `xin_file_manager`
--

CREATE TABLE `xin_file_manager` (
  `file_id` int(111) NOT NULL,
  `user_id` int(111) NOT NULL,
  `department_id` int(111) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `file_extension` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_file_manager_settings`
--

CREATE TABLE `xin_file_manager_settings` (
  `setting_id` int(111) NOT NULL,
  `allowed_extensions` mediumtext NOT NULL,
  `maximum_file_size` varchar(255) NOT NULL,
  `is_enable_all_files` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_file_manager_settings`
--

INSERT INTO `xin_file_manager_settings` (`setting_id`, `allowed_extensions`, `maximum_file_size`, `is_enable_all_files`, `updated_at`) VALUES
(1, 'gif,png,pdf,txt,doc,docx', '10', '', '2019-09-30 03:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_bankcash`
--

CREATE TABLE `xin_finance_bankcash` (
  `bankcash_id` int(111) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_balance` varchar(255) NOT NULL,
  `account_opening_balance` varchar(200) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `bank_branch` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_finance_bankcash`
--

INSERT INTO `xin_finance_bankcash` (`bankcash_id`, `account_name`, `account_balance`, `account_opening_balance`, `account_number`, `branch_code`, `bank_branch`, `created_at`) VALUES
(1, 'AlRajhi Bank', '9880000', '10000000', '123456789', '00966', 'Riyadh Branch', '23-06-2020 01:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_deposit`
--

CREATE TABLE `xin_finance_deposit` (
  `deposit_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `deposit_date` varchar(255) NOT NULL,
  `category_id` int(111) NOT NULL,
  `payer_id` int(111) NOT NULL,
  `payment_method` int(111) NOT NULL,
  `deposit_reference` varchar(255) NOT NULL,
  `deposit_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_expense`
--

CREATE TABLE `xin_finance_expense` (
  `expense_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `expense_date` varchar(255) NOT NULL,
  `category_id` int(111) NOT NULL,
  `payee_id` int(111) NOT NULL,
  `payment_method` int(111) NOT NULL,
  `expense_reference` varchar(255) NOT NULL,
  `expense_file` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_payees`
--

CREATE TABLE `xin_finance_payees` (
  `payee_id` int(11) NOT NULL,
  `payee_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_payers`
--

CREATE TABLE `xin_finance_payers` (
  `payer_id` int(11) NOT NULL,
  `payer_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transaction`
--

CREATE TABLE `xin_finance_transaction` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `dr_cr` enum('dr','cr') NOT NULL,
  `transaction_cat_id` int(11) NOT NULL,
  `payer_payee_id` int(11) NOT NULL,
  `payee_option` int(11) DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_type` varchar(100) DEFAULT NULL,
  `attachment_file` varchar(100) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_finance_transaction`
--

INSERT INTO `xin_finance_transaction` (`transaction_id`, `account_id`, `company_id`, `transaction_date`, `description`, `amount`, `transaction_type`, `dr_cr`, `transaction_cat_id`, `payer_payee_id`, `payee_option`, `payment_method_id`, `reference`, `invoice_id`, `client_id`, `invoice_type`, `attachment_file`, `created_at`) VALUES
(0, 1, 0, '2020-10-26', 'Payroll Payments', 120000, 'expense', 'cr', 0, 6, NULL, 3, 'Payroll Payments', 2, 6, NULL, NULL, '2020-10-26 15:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transactions`
--

CREATE TABLE `xin_finance_transactions` (
  `transaction_id` int(111) NOT NULL,
  `account_type_id` int(111) NOT NULL,
  `deposit_id` int(111) NOT NULL,
  `expense_id` int(111) NOT NULL,
  `transfer_id` int(111) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `transaction_debit` varchar(255) NOT NULL,
  `transaction_credit` varchar(255) NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_finance_transfer`
--

CREATE TABLE `xin_finance_transfer` (
  `transfer_id` int(111) NOT NULL,
  `from_account_id` int(111) NOT NULL,
  `to_account_id` int(111) NOT NULL,
  `transfer_date` varchar(255) NOT NULL,
  `transfer_amount` varchar(255) NOT NULL,
  `payment_method` varchar(111) NOT NULL,
  `transfer_reference` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_goal_tracking`
--

CREATE TABLE `xin_goal_tracking` (
  `tracking_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `tracking_type_id` int(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `target_achiement` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `goal_progress` varchar(200) NOT NULL,
  `goal_status` int(11) NOT NULL DEFAULT 0,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_goal_tracking_type`
--

CREATE TABLE `xin_goal_tracking_type` (
  `tracking_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_goal_tracking_type`
--

INSERT INTO `xin_goal_tracking_type` (`tracking_type_id`, `company_id`, `type_name`, `created_at`) VALUES
(1, 1, 'Invoice Goal', '31-08-2018 01:29:44'),
(4, 1, 'Event Goal', '31-08-2018 01:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `xin_holidays`
--

CREATE TABLE `xin_holidays` (
  `holiday_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `event_name` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hourly_templates`
--

CREATE TABLE `xin_hourly_templates` (
  `hourly_rate_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `hourly_grade` varchar(255) NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_invoices`
--

CREATE TABLE `xin_hrsale_invoices` (
  `invoice_id` int(111) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `invoice_due_date` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `invoice_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT 'null',
  `company_name` varchar(200) NOT NULL DEFAULT 'null',
  `client_profile` varchar(200) NOT NULL DEFAULT 'null',
  `email` varchar(200) NOT NULL DEFAULT 'null',
  `contact_number` varchar(200) NOT NULL DEFAULT 'null',
  `website_url` varchar(200) NOT NULL DEFAULT 'null',
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL DEFAULT 'null',
  `state` varchar(200) NOT NULL DEFAULT 'null',
  `zipcode` varchar(200) NOT NULL DEFAULT 'null',
  `countryid` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_invoices_items`
--

CREATE TABLE `xin_hrsale_invoices_items` (
  `invoice_item_id` int(111) NOT NULL,
  `invoice_id` int(111) NOT NULL,
  `project_id` int(111) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes`
--

CREATE TABLE `xin_hrsale_module_attributes` (
  `custom_field_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `attribute_label` varchar(255) NOT NULL,
  `attribute_type` varchar(255) NOT NULL,
  `validation` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes_select_value`
--

CREATE TABLE `xin_hrsale_module_attributes_select_value` (
  `attributes_select_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `select_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_module_attributes_values`
--

CREATE TABLE `xin_hrsale_module_attributes_values` (
  `attributes_value_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_attributes_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_notificaions`
--

CREATE TABLE `xin_hrsale_notificaions` (
  `notificaion_id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_hrsale_notificaions`
--

INSERT INTO `xin_hrsale_notificaions` (`notificaion_id`, `module_name`, `module_id`, `employee_id`, `is_notify`, `created_at`) VALUES
(1, 'projects', 0, 5, 1, '23-10-2020 02:06:25'),
(2, 'announcement', 1, 6, 1, '04-11-2020 09:11:27'),
(3, 'leave', 28, 6, 1, '06-11-2020 10:07:51'),
(4, 'projects', 4, 6, 1, '12-11-2020 04:27:05'),
(5, 'projects', 4, 12, 1, '12-11-2020 04:27:05'),
(6, 'projects', 4, 53, 1, '12-11-2020 04:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_quotes`
--

CREATE TABLE `xin_hrsale_quotes` (
  `quote_id` int(111) NOT NULL,
  `quote_number` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `quote_date` varchar(255) NOT NULL,
  `quote_due_date` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `discount_type` varchar(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` varchar(100) NOT NULL,
  `tax_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `quote_type` varchar(100) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `quote_note` mediumtext NOT NULL,
  `name` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `client_profile` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `website_url` varchar(200) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `zipcode` varchar(200) NOT NULL,
  `countryid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_hrsale_quotes_items`
--

CREATE TABLE `xin_hrsale_quotes_items` (
  `quote_item_id` int(111) NOT NULL,
  `quote_id` int(111) NOT NULL,
  `project_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_tax_type` varchar(255) NOT NULL,
  `item_tax_rate` varchar(255) NOT NULL,
  `item_qty` varchar(255) NOT NULL,
  `item_unit_price` varchar(255) NOT NULL,
  `item_sub_total` varchar(255) NOT NULL,
  `sub_total_amount` varchar(255) NOT NULL,
  `total_tax` varchar(255) NOT NULL,
  `tax_type` int(11) NOT NULL,
  `tax_figure` varchar(200) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discount_figure` varchar(255) NOT NULL,
  `total_discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_income_categories`
--

CREATE TABLE `xin_income_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_income_categories`
--

INSERT INTO `xin_income_categories` (`category_id`, `name`, `status`, `created_at`) VALUES
(1, 'Envato', 1, '25-03-2018 09:36:20'),
(2, 'Salary', 1, '25-03-2018 09:36:28'),
(3, 'Other Income', 1, '25-03-2018 09:36:32'),
(4, 'Interest Income', 1, '25-03-2018 09:36:53'),
(5, 'Part Time Work', 1, '25-03-2018 09:37:13'),
(6, 'Regular Income', 1, '25-03-2018 09:37:17');

-- --------------------------------------------------------

--
-- Table structure for table `xin_jobs`
--

CREATE TABLE `xin_jobs` (
  `job_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `job_url` varchar(255) NOT NULL,
  `job_type` int(225) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `job_vacancy` int(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `minimum_experience` varchar(255) NOT NULL,
  `date_of_closing` varchar(200) NOT NULL,
  `short_description` mediumtext NOT NULL,
  `long_description` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_jobs`
--

INSERT INTO `xin_jobs` (`job_id`, `employer_id`, `category_id`, `company_id`, `job_title`, `designation_id`, `job_url`, `job_type`, `category_url`, `is_featured`, `type_url`, `job_vacancy`, `gender`, `minimum_experience`, `date_of_closing`, `short_description`, `long_description`, `status`, `created_at`) VALUES
(1, 1, 1, 1, 'q', 9, 'uX2qiP4Y9hQdO5aCeopmkEBWUFMcxRNwSjHDvf6J', 1, '', 1, '', 2, '0', '0', '2020-11-19', 'ew', 'wf', 1, '2020-11-02 10:57:08'),
(2, 1, 1, 0, 'q', 0, 'OKrTZuegNfd6EhwaGy1lciDvACWjFQxRX95Io40L', 1, '', 1, '', 2, '0', '0', '2020-11-12', 'e', 'e', 1, '2020-11-04 02:26:08'),
(3, 1, 2, 0, 'q', 0, 'LvjS4NxOoQtX83rPCKHhF1cJqfI0ZURz2nA5liwW', 1, '', 1, '', 4, '0', '0', '2020-11-19', 'err', 'ww', 1, '2020-11-04 02:43:25'),
(4, 1, 1, 0, 'junior dev', 0, 'BVxmrqToX2gv7uJD5FiZPpRjlKL04zb83NWGfOs1', 2, '', 1, '', 3, '0', '0', '2020-11-19', 'xxxx', 'xxxxxx', 1, '2020-11-04 02:45:00'),
(5, 1, 14, 0, 'Senior java developer', 0, 'HJWUNpnsGSKE4Y1zI38ymauh92ifTFtVOLDo5cjg', 1, '', 1, '', 2, '0', '7', '2020-11-16', 'candidate should eligible to work on multiple frame works of java', '', 1, '2020-11-06 10:27:25'),
(6, 1, 1, 0, 'Php', 0, 'ofmHd7METIABFkpuJ40bnxGSUX2er1KOqzisCawV', 2, '', 1, '', 4, '0', '3', '2020-11-20', '&lt;?php\r\n/* Job List/Post view\r\n*/\r\n?&gt;\r\n&lt;?php $session = $this-&gt;session-&gt;userdata(\\&#039;username\\&#039;);?&gt;\r\n&lt;?php $get_animate = $this-&gt;Xin_model-&gt;get_content_animate();?&gt;\r\n&lt;?php $role_resources_ids = $this-&gt;Xin_model-&gt;user_role_resource(); ?&gt;\r\n&lt;div id=\\&quot;smartwizard-2\\&quot; class=\\&quot;smartwizard-example sw-main sw-theme-default\\&quot;&gt;\r\n  &lt;ul class=\\&quot;nav nav-tabs step-anchor\\&quot;&gt;\r\n    &lt;?php if(in_array(\\&#039;49\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item active\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-newspaper\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_posts\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_role_create\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;header_apply_jobs_frontend\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;51\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_candidates/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_candidates/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-user-friends\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_candidates\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_view\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_candidates\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;52\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/employer/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/employer/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-user-ninja\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_role_add\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;296\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/pages/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/pages/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon ion ion-ios-paper\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_cms_pages\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_update\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_cms_pages\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n     &lt;?php } ?&gt; \r\n  &lt;/ul&gt;\r\n&lt;/div&gt;\r\n&lt;hr class=\\&quot;border-light m-0 mb-3\\&quot;&gt;\r\n&lt;?php if(in_array(\\&#039;291\\&#039;,$role_resources_ids)) {?&gt;\r\n&lt;?php\r\n$all_employers = $this-&gt;Recruitment_model-&gt;get_all_employers();\r\n$all_job_types = $this-&gt;Xin_model-&gt;get_job_type();\r\n$all_job_categories = $this-&gt;Recruitment_model-&gt;all_job_categories();\r\n?&gt;\r\n&lt;div class=\\&quot;card mb-4 &lt;?php echo $get_animate;?&gt;\\&quot;&gt;\r\n  &lt;div id=\\&quot;accordion\\&quot;&gt;\r\n    &lt;div class=\\&quot;card-header with-elements\\&quot;&gt; &lt;span class=\\&quot;card-header-title mr-2\\&quot;&gt;&lt;strong&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_add_new\\&#039;);?&gt;&lt;/strong&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job\\&#039;);?&gt;&lt;/span&gt;\r\n      &lt;div class=\\&quot;card-header-elements ml-md-auto\\&quot;&gt; &lt;a class=\\&quot;text-dark collapsed\\&quot; data-toggle=\\&quot;collapse\\&quot; href=\\&quot;#add_form\\&quot; aria-expanded=\\&quot;false\\&quot;&gt;\r\n        &lt;button type=\\&quot;button\\&quot; class=\\&quot;btn btn-xs btn-primary\\&quot;&gt; &lt;span class=\\&quot;ion ion-md-add\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_add_new\\&#039;);?&gt;&lt;/button&gt;\r\n        &lt;/a&gt; &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div id=\\&quot;add_form\\&quot; class=\\&quot;collapse add-form &lt;?php echo $get_animate;?&gt;\\&quot; data-parent=\\&quot;#accordion\\&quot; style=\\&quot;\\&quot;&gt;\r\n      &lt;div class=\\&quot;card-body\\&quot;&gt;\r\n        &lt;?php $attributes = array(\\&#039;name\\&#039; =&gt; \\&#039;add_job\\&#039;, \\&#039;id\\&#039; =&gt; \\&#039;xin-form\\&#039;, \\&#039;autocomplete\\&#039; =&gt; \\&#039;off\\&#039;);?&gt;\r\n        &lt;?php $hidden = array(\\&#039;_user\\&#039; =&gt; $session[\\&#039;user_id\\&#039;]);?&gt;\r\n        &lt;?php echo form_open_multipart(\\&#039;admin/job_post/add_job\\&#039;, $attributes, $hidden);?&gt;\r\n        &lt;div class=\\&quot;bg-white\\&quot;&gt;\r\n          &lt;div class=\\&quot;box-block\\&quot;&gt;\r\n            &lt;div class=\\&quot;row\\&quot;&gt;\r\n              &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-12\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;company_name\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;user_id\\&quot; id=\\&quot;user_id\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_select_one\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_employers as $employer) {?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $employer-&gt;user_id;?&gt;\\&quot;&gt; &lt;?php echo $employer-&gt;first_name.\\&#039; \\&#039;.$employer-&gt;last_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;title\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_e_details_jtitle\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;input class=\\&quot;form-control\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_e_details_jtitle\\&#039;);?&gt;\\&quot; name=\\&quot;job_title\\&quot; type=\\&quot;text\\&quot; value=\\&quot;\\&quot;&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;job_type\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_type\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;job_type\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_type\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_job_types-&gt;result() as $ijob_type) {?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $ijob_type-&gt;job_type_id;?&gt;\\&quot;&gt;&lt;?php echo $ijob_type-&gt;type;?&gt;&lt;/option&gt;\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;designation\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_acc_category\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;category_id\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_acc_category\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_job_categories as $category):?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $category-&gt;category_id;?&gt;\\&quot;&gt;&lt;?php echo $category-&gt;category_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php endforeach;?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;vacancy\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_number_of_positions\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;input class=\\&quot;form-control\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_number_of_positions\\&#039;);?&gt;\\&quot; name=\\&quot;vacancy\\&quot; type=\\&quot;text\\&quot; value=\\&quot;\\&quot;&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n              &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n            &lt;label for=\\&quot;minimumEducation\\&quot; class=\\&quot;control-label\\&quot;&gt;&lt;?php echo \\&quot;Minimum Education\\&quot;?&gt;&lt;/label&gt;\r\n                      &lt;select name=\\&quot;min_education\\&quot; selected class=\\&quot;form-control\\&quot;&gt;\r\n                        &lt;option&gt;Select&lt;/option&gt;\r\n                      &lt;?php\r\n                      foreach($minimum_education as $m)\r\n                      {\r\n                        ?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $m[\\&#039;minimum_education_id\\&#039;]?&gt;\\&quot;&gt;&lt;?php echo $m[\\&#039;minimum_education\\&#039;]?&gt;&lt;/option&gt;\r\n                        &lt;?php\r\n                      }\r\n                      ?&gt;\r\n                      &lt;/select&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-4\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;is_featured\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_is_featured\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;is_featured\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_is_featured\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;1\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_yes\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;0\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_no\\&#039;);?&gt;&lt;/option&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  &lt;div class=\\&quot;col-md-4\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;status\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;dashboard_xin_status\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;status\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;dashboard_xin_status\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;1\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_published\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;2\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_unpublished\\&#039;);?&gt;&lt;/option&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  \r\n                  &lt;div class=\\&quot;col-md-4\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;date_of_closing\\&quot; class=\\&quot;control-label\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_date_of_closing\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;input class=\\&quot;form-control date\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_date_of_closing\\&#039;);?&gt;\\&quot; readonly name=\\&quot;date_of_closing\\&quot; type=\\&quot;text\\&quot; value=\\&quot;\\&quot;&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;gender\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_employee_gender\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;gender\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_employee_gender\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;0\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_gender_male\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;1\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_gender_female\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;2\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_no_preference\\&#039;);?&gt;&lt;/option&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;experience\\&quot; class=\\&quot;control-label\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_minimum_experience\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;experience\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_minimum_experience\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;0\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_fresh\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;1\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_1year\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;2\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_2years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;3\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_3years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;4\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_4years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;5\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_5years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;6\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_6years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;7\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_7years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;8\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_8years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;9\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_9years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;10\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_10years\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;option value=\\&quot;11\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_experience_define_plus_10years\\&#039;);?&gt;&lt;/option&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n              &lt;/div&gt;\r\n              &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                  &lt;label for=\\&quot;long_description\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_long_description\\&#039;);?&gt;&lt;/label&gt;\r\n                  &lt;textarea class=\\&quot;form-control textarea\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_long_description\\&#039;);?&gt;\\&quot; name=\\&quot;long_description\\&quot; cols=\\&quot;\\&quot; rows=\\&quot;10\\&quot; id=\\&quot;long_description\\&quot;&gt;&lt;/textarea&gt;\r\n                &lt;/div&gt;\r\n              &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n              &lt;label for=\\&quot;short_description\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_short_description\\&#039;);?&gt;&lt;/label&gt;\r\n              &lt;textarea class=\\&quot;form-control\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_short_description\\&#039;);?&gt;\\&quot; name=\\&quot;short_description\\&quot; cols=\\&quot;30\\&quot; rows=\\&quot;3\\&quot;&gt;&lt;/textarea&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=\\&quot;form-actions box-footer\\&quot;&gt;\r\n              &lt;button type=\\&quot;submit\\&quot; class=\\&quot;btn btn-primary\\&quot;&gt; &lt;i class=\\&quot;fa fa-check-square-o\\&quot;&gt;&lt;/i&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_save\\&#039;);?&gt; &lt;/button&gt;\r\n            &lt;/div&gt;\r\n          &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;?php echo form_close(); ?&gt; &lt;/div&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;?php } ?&gt;\r\n&lt;div class=\\&quot;card &lt;?php echo $get_animate;?&gt;\\&quot;&gt;\r\n  &lt;div class=\\&quot;card-header with-elements\\&quot;&gt; &lt;span class=\\&quot;card-header-title mr-2\\&quot;&gt;&lt;strong&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_list_all\\&#039;);?&gt;&lt;/strong&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs\\&#039;);?&gt;&lt;/span&gt;\r\n      &lt;div class=\\&quot;card-header-elements ml-md-auto\\&quot;&gt; &lt;a class=\\&quot;text-dark\\&quot; href=\\&quot;&lt;?php echo site_url(\\&#039;jobs\\&#039;);?&gt;\\&quot; target=\\&quot;_blank\\&quot;&gt;\r\n        &lt;button type=\\&quot;button\\&quot; class=\\&quot;btn btn-xs btn-primary\\&quot;&gt; &lt;span class=\\&quot;fa fa-eye\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_jobs_listing\\&#039;);?&gt;&lt;/button&gt;\r\n        &lt;/a&gt; &lt;/div&gt;\r\n    &lt;/div&gt;\r\n  &lt;div class=\\&quot;card-body\\&quot;&gt;\r\n    &lt;div class=\\&quot;box-datatable table-responsive\\&quot;&gt;\r\n      &lt;table class=\\&quot;datatables-demo table table-striped table-bordered\\&quot; id=\\&quot;xin_table\\&quot;&gt;\r\n        &lt;thead&gt;\r\n          &lt;tr&gt;\r\n            &lt;th&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_action\\&#039;);?&gt;&lt;/th&gt;\r\n            &lt;th &gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;dashboard_position\\&#039;);?&gt;&lt;/th&gt;\r\n            &lt;th&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;&lt;/th&gt;\r\n            &lt;th&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_posted_date\\&#039;);?&gt;&lt;/th&gt;\r\n            &lt;th&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;dashboard_xin_status\\&#039;);?&gt;&lt;/th&gt;\r\n            &lt;th&gt;&lt;i class=\\&quot;fa fa-calendar\\&quot;&gt;&lt;/i&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_closing_date\\&#039;);?&gt;&lt;/th&gt;\r\n          &lt;/tr&gt;\r\n        &lt;/thead&gt;\r\n      &lt;/table&gt;\r\n    &lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;style type=\\&quot;text/css\\&quot;&gt;.trumbowyg-box, .trumbowyg-editor { min-height: 175px; }&lt;/style&gt;', 'sknkejnw', 1, '2020-11-12 04:14:39');
INSERT INTO `xin_jobs` (`job_id`, `employer_id`, `category_id`, `company_id`, `job_title`, `designation_id`, `job_url`, `job_type`, `category_url`, `is_featured`, `type_url`, `job_vacancy`, `gender`, `minimum_experience`, `date_of_closing`, `short_description`, `long_description`, `status`, `created_at`) VALUES
(7, 1, 3, 0, 'Wordpress', 0, 'Wa4lfzHAuiphIDrg8t7QoxEyweFGSU95bRqs62ZN', 2, '', 1, '', 3, '1', '2', '2020-11-27', '&lt;?php\r\n/* Job List/Post view\r\n*/\r\n?&gt;\r\n&lt;?php $session = $this-&gt;session-&gt;userdata(\\&#039;username\\&#039;);?&gt;\r\n&lt;?php $get_animate = $this-&gt;Xin_model-&gt;get_content_animate();?&gt;\r\n&lt;?php $role_resources_ids = $this-&gt;Xin_model-&gt;user_role_resource(); ?&gt;\r\n&lt;div id=\\&quot;smartwizard-2\\&quot; class=\\&quot;smartwizard-example sw-main sw-theme-default\\&quot;&gt;\r\n  &lt;ul class=\\&quot;nav nav-tabs step-anchor\\&quot;&gt;\r\n    &lt;?php if(in_array(\\&#039;49\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item active\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-newspaper\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_posts\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_role_create\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;header_apply_jobs_frontend\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;51\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_candidates/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_candidates/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-user-friends\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_candidates\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_view\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;left_job_candidates\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;52\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/employer/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/employer/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon fas fa-user-ninja\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_role_add\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n    &lt;?php } ?&gt;  \r\n    &lt;?php if(in_array(\\&#039;296\\&#039;,$role_resources_ids)) { ?&gt;\r\n    &lt;li class=\\&quot;nav-item done\\&quot;&gt; &lt;a href=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/pages/\\&#039;);?&gt;\\&quot; data-link-data=\\&quot;&lt;?php echo site_url(\\&#039;admin/job_post/pages/\\&#039;);?&gt;\\&quot; class=\\&quot;mb-3 nav-link hrsale-link\\&quot;&gt; &lt;span class=\\&quot;sw-icon ion ion-ios-paper\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_cms_pages\\&#039;);?&gt;\r\n      &lt;div class=\\&quot;text-muted small\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_update\\&#039;);?&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_cms_pages\\&#039;);?&gt;&lt;/div&gt;\r\n      &lt;/a&gt; &lt;/li&gt;\r\n     &lt;?php } ?&gt; \r\n  &lt;/ul&gt;\r\n&lt;/div&gt;\r\n&lt;hr class=\\&quot;border-light m-0 mb-3\\&quot;&gt;\r\n&lt;?php if(in_array(\\&#039;291\\&#039;,$role_resources_ids)) {?&gt;\r\n&lt;?php\r\n$all_employers = $this-&gt;Recruitment_model-&gt;get_all_employers();\r\n$all_job_types = $this-&gt;Xin_model-&gt;get_job_type();\r\n$all_job_categories = $this-&gt;Recruitment_model-&gt;all_job_categories();\r\n?&gt;\r\n&lt;div class=\\&quot;card mb-4 &lt;?php echo $get_animate;?&gt;\\&quot;&gt;\r\n  &lt;div id=\\&quot;accordion\\&quot;&gt;\r\n    &lt;div class=\\&quot;card-header with-elements\\&quot;&gt; &lt;span class=\\&quot;card-header-title mr-2\\&quot;&gt;&lt;strong&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_add_new\\&#039;);?&gt;&lt;/strong&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job\\&#039;);?&gt;&lt;/span&gt;\r\n      &lt;div class=\\&quot;card-header-elements ml-md-auto\\&quot;&gt; &lt;a class=\\&quot;text-dark collapsed\\&quot; data-toggle=\\&quot;collapse\\&quot; href=\\&quot;#add_form\\&quot; aria-expanded=\\&quot;false\\&quot;&gt;\r\n        &lt;button type=\\&quot;button\\&quot; class=\\&quot;btn btn-xs btn-primary\\&quot;&gt; &lt;span class=\\&quot;ion ion-md-add\\&quot;&gt;&lt;/span&gt; &lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_add_new\\&#039;);?&gt;&lt;/button&gt;\r\n        &lt;/a&gt; &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div id=\\&quot;add_form\\&quot; class=\\&quot;collapse add-form &lt;?php echo $get_animate;?&gt;\\&quot; data-parent=\\&quot;#accordion\\&quot; style=\\&quot;\\&quot;&gt;\r\n      &lt;div class=\\&quot;card-body\\&quot;&gt;\r\n        &lt;?php $attributes = array(\\&#039;name\\&#039; =&gt; \\&#039;add_job\\&#039;, \\&#039;id\\&#039; =&gt; \\&#039;xin-form\\&#039;, \\&#039;autocomplete\\&#039; =&gt; \\&#039;off\\&#039;);?&gt;\r\n        &lt;?php $hidden = array(\\&#039;_user\\&#039; =&gt; $session[\\&#039;user_id\\&#039;]);?&gt;\r\n        &lt;?php echo form_open_multipart(\\&#039;admin/job_post/add_job\\&#039;, $attributes, $hidden);?&gt;\r\n        &lt;div class=\\&quot;bg-white\\&quot;&gt;\r\n          &lt;div class=\\&quot;box-block\\&quot;&gt;\r\n            &lt;div class=\\&quot;row\\&quot;&gt;\r\n              &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-12\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;company_name\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;user_id\\&quot; id=\\&quot;user_id\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_jobs_employer\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_select_one\\&#039;);?&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_employers as $employer) {?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $employer-&gt;user_id;?&gt;\\&quot;&gt; &lt;?php echo $employer-&gt;first_name.\\&#039; \\&#039;.$employer-&gt;last_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;title\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_e_details_jtitle\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;input class=\\&quot;form-control\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_e_details_jtitle\\&#039;);?&gt;\\&quot; name=\\&quot;job_title\\&quot; type=\\&quot;text\\&quot; value=\\&quot;\\&quot;&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;job_type\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_type\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;job_type\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_job_type\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_job_types-&gt;result() as $ijob_type) {?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $ijob_type-&gt;job_type_id;?&gt;\\&quot;&gt;&lt;?php echo $ijob_type-&gt;type;?&gt;&lt;/option&gt;\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;designation\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_acc_category\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;select class=\\&quot;form-control\\&quot; name=\\&quot;category_id\\&quot; data-plugin=\\&quot;select_hrm\\&quot; data-placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_acc_category\\&#039;);?&gt;\\&quot;&gt;\r\n                        &lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_job_categories as $category):?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $category-&gt;category_id;?&gt;\\&quot;&gt;&lt;?php echo $category-&gt;category_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php endforeach;?&gt;\r\n                      &lt;/select&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                  &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n                    &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n                      &lt;label for=\\&quot;vacancy\\&quot;&gt;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_number_of_positions\\&#039;);?&gt;&lt;/label&gt;\r\n                      &lt;input class=\\&quot;form-control\\&quot; placeholder=\\&quot;&lt;?php echo $this-&gt;lang-&gt;line(\\&#039;xin_number_of_positions\\&#039;);?&gt;\\&quot; name=\\&quot;vacancy\\&quot; type=\\&quot;text\\&quot; value=\\&quot;\\&quot;&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=\\&quot;row\\&quot;&gt;\r\n                &lt;div class=\\&quot;col-md-6\\&quot;&gt;\r\n              &lt;div class=\\&quot;form-group\\&quot;&gt;\r\n            &lt;label for=\\&quot;minimumEducation\\&quot; class=\\&quot;control-label\\&quot;&gt;&lt;?php echo \\&quot;Minimum Education\\&quot;?&gt;&lt;/label&gt;\r\n                      &lt;select name=\\&quot;min_education\\&quot; selected class=\\&quot;form-control\\&quot;&gt;\r\n                        &lt;option&gt;Select&lt;/option&gt;\r\n                      &lt;?php\r\n                      foreach($minimum_education as $m)\r\n                      {\r\n                        ?&gt;', '&lt;p style=\\&quot;color: rgb(212, 212, 212); background-color: rgb(30, 30, 30); font-family: Consolas, &amp;quot;Courier New&amp;quot;, monospace; font-size: 14px; line-height: 19px; white-space: pre;\\&quot;&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #6a9955;\\&quot;&gt;/*&amp;nbsp;Job&amp;nbsp;List/Post&amp;nbsp;view&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #6a9955;\\&quot;&gt;*/&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$session&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;session&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;userdata&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;username\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$get_animate&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;Xin_model&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;get_content_animate&lt;/span&gt;();&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;Xin_model&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;user_role_resource&lt;/span&gt;();&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;id&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;smartwizard-2\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;smartwizard-example&amp;nbsp;sw-main&amp;nbsp;sw-theme-default\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;ul&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;nav&amp;nbsp;nav-tabs&amp;nbsp;step-anchor\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;if&lt;/span&gt;(&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;in_array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;49\\&#039;&lt;/span&gt;,&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;))&amp;nbsp;{&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;nav-item&amp;nbsp;active\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;href&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-link-data&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;mb-3&amp;nbsp;nav-link&amp;nbsp;hrsale-link\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;sw-icon&amp;nbsp;fas&amp;nbsp;fa-newspaper\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;left_job_posts\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text-muted&amp;nbsp;small\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_role_create\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;header_apply_jobs_frontend\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;if&lt;/span&gt;(&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;in_array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;51\\&#039;&lt;/span&gt;,&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;))&amp;nbsp;{&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;nav-item&amp;nbsp;done\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;href&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_candidates/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-link-data&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_candidates/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;mb-3&amp;nbsp;nav-link&amp;nbsp;hrsale-link\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;sw-icon&amp;nbsp;fas&amp;nbsp;fa-user-friends\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;left_job_candidates\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text-muted&amp;nbsp;small\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_view\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;left_job_candidates\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;if&lt;/span&gt;(&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;in_array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;52\\&#039;&lt;/span&gt;,&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;))&amp;nbsp;{&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;nav-item&amp;nbsp;done\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;href&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/employer/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-link-data&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/employer/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;mb-3&amp;nbsp;nav-link&amp;nbsp;hrsale-link\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;sw-icon&amp;nbsp;fas&amp;nbsp;fa-user-ninja\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_employer\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text-muted&amp;nbsp;small\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_role_add\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_employer\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;if&lt;/span&gt;(&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;in_array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;296\\&#039;&lt;/span&gt;,&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;))&amp;nbsp;{&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;nav-item&amp;nbsp;done\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;href&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/pages/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-link-data&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;site_url&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/pages/\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;mb-3&amp;nbsp;nav-link&amp;nbsp;hrsale-link\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;sw-icon&amp;nbsp;ion&amp;nbsp;ion-ios-paper\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_cms_pages\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text-muted&amp;nbsp;small\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_update\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_cms_pages\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;li&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;ul&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;hr&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;border-light&amp;nbsp;m-0&amp;nbsp;mb-3\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;if&lt;/span&gt;(&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;in_array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;291\\&#039;&lt;/span&gt;,&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$role_resources_ids&lt;/span&gt;))&amp;nbsp;{&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_employers&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;Recruitment_model&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;get_all_employers&lt;/span&gt;();&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_job_types&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;Xin_model&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;get_job_type&lt;/span&gt;();&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_job_categories&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;Recruitment_model&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;all_job_categories&lt;/span&gt;();&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;card&amp;nbsp;mb-4&amp;nbsp;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$get_animate&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;id&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;accordion\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;card-header&amp;nbsp;with-elements\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;card-header-title&amp;nbsp;mr-2\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;strong&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_add_new\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;strong&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_job\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;card-header-elements&amp;nbsp;ml-md-auto\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text-dark&amp;nbsp;collapsed\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-toggle&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;collapse\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;href&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;#add_form\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;aria-expanded&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;false\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;button&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;type&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;button\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;btn&amp;nbsp;btn-xs&amp;nbsp;btn-primary\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;ion&amp;nbsp;ion-md-add\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;span&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_add_new\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;button&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;a&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;id&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;add_form\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;collapse&amp;nbsp;add-form&amp;nbsp;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$get_animate&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-parent&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;#accordion\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;style&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;card-body\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$attributes&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;name\\&#039;&lt;/span&gt;&amp;nbsp;=&amp;gt;&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;add_job\\&#039;&lt;/span&gt;,&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;id\\&#039;&lt;/span&gt;&amp;nbsp;=&amp;gt;&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin-form\\&#039;&lt;/span&gt;,&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;autocomplete\\&#039;&lt;/span&gt;&amp;nbsp;=&amp;gt;&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;off\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$hidden&lt;/span&gt;&amp;nbsp;=&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;array&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;_user\\&#039;&lt;/span&gt;&amp;nbsp;=&amp;gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$session&lt;/span&gt;[&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;user_id\\&#039;&lt;/span&gt;]);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;form_open_multipart&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;admin/job_post/add_job\\&#039;&lt;/span&gt;,&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$attributes&lt;/span&gt;,&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$hidden&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;bg-white\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;box-block\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-12\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;company_name\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_employer\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;user_id\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;id&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;user_id\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-plugin&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;select_hrm\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_jobs_employer\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_select_one\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;foreach&lt;/span&gt;(&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_employers&lt;/span&gt;&amp;nbsp;as&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$employer&lt;/span&gt;)&amp;nbsp;{&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$employer&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;user_id&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$employer&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;first_name&lt;/span&gt;.&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;&amp;nbsp;\\&#039;&lt;/span&gt;.&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$employer&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;last_name&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;title\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_e_details_jtitle\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;input&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_e_details_jtitle\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;job_title\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;type&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;job_type\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_job_type\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;job_type\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-plugin&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;select_hrm\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_job_type\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;foreach&lt;/span&gt;(&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_job_types&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;result&lt;/span&gt;()&amp;nbsp;as&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$ijob_type&lt;/span&gt;)&amp;nbsp;{&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$ijob_type&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;job_type_id&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$ijob_type&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;type&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;}&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;designation\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_acc_category\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;category_id\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-plugin&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;select_hrm\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_acc_category\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;foreach&lt;/span&gt;(&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$all_job_categories&lt;/span&gt;&amp;nbsp;as&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$category&lt;/span&gt;):&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$category&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;category_id&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$category&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;category_name&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;endforeach&lt;/span&gt;;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;vacancy\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_number_of_positions\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;input&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_number_of_positions\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;vacancy\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;type&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;text\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-6\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;minimumEducation\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;control-label\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;Minimum&amp;nbsp;Education\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;min_education\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;selected&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;Select&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #c586c0;\\&quot;&gt;foreach&lt;/span&gt;(&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$minimum_education&lt;/span&gt;&amp;nbsp;as&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$m&lt;/span&gt;)&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$m&lt;/span&gt;[&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;minimum_education_id\\&#039;&lt;/span&gt;]&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;$m&lt;/span&gt;[&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;minimum_education\\&#039;&lt;/span&gt;]&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;row\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-4\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;is_featured\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_job_is_featured\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;is_featured\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-plugin&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;select_hrm\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_job_is_featured\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;1\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_yes\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;0\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_no\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-4\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-group\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;for&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;status\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;dashboard_xin_status\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;label&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;form-control\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;name&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;status\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-plugin&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;select_hrm\\&quot;&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;data-placeholder&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;dashboard_xin_status\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;1\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_published\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;value&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;2\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;lt;?php&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;echo&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;$this&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;lang&lt;/span&gt;-&amp;gt;&lt;span style=\\&quot;color: #dcdcaa;\\&quot;&gt;line&lt;/span&gt;(&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&#039;xin_unpublished\\&#039;&lt;/span&gt;);&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;?&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;option&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;select&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;/&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;lt;&lt;/span&gt;&lt;span style=\\&quot;color: #569cd6;\\&quot;&gt;div&lt;/span&gt;&amp;nbsp;&lt;span style=\\&quot;color: #9cdcfe;\\&quot;&gt;class&lt;/span&gt;=&lt;span style=\\&quot;color: #ce9178;\\&quot;&gt;\\&quot;col-md-4\\&quot;&lt;/span&gt;&lt;span style=\\&quot;color: #808080;\\&quot;&gt;&amp;gt;&lt;/span&gt;&lt;/p&gt;&lt;/p&gt;', 1, '2020-11-12 04:20:04');
INSERT INTO `xin_jobs` (`job_id`, `employer_id`, `category_id`, `company_id`, `job_title`, `designation_id`, `job_url`, `job_type`, `category_url`, `is_featured`, `type_url`, `job_vacancy`, `gender`, `minimum_experience`, `date_of_closing`, `short_description`, `long_description`, `status`, `created_at`) VALUES
(8, 2, 14, 0, 'JAVA ', 9, '3HzyVxN8pEhKCJudkeMjTsZ759anBXmftPR1DbQ4', 3, '', 0, '', 4, '2', '0', '2020-12-23', '&lt;div class=\\&quot;container\\&quot;&gt;\r\n	\r\n	&lt;!-- Submit Page --&gt;\r\n	&lt;div class=\\&quot;sixteen columns\\&quot;&gt;\r\n		&lt;div class=\\&quot;submit-page\\&quot;&gt;\r\n			&lt;?php $attributes = array(\\&#039;name\\&#039; =&gt; \\&#039;add_job\\&#039;, \\&#039;id\\&#039; =&gt; \\&#039;xin-form\\&#039;, \\&#039;class\\&#039; =&gt; \\&#039;add_job\\&#039;, \\&#039;autocomplete\\&#039; =&gt; \\&#039;off\\&#039;);?&gt;\r\n				&lt;?php $hidden = array(\\&#039;add_job\\&#039; =&gt; \\&#039;1\\&#039;);?&gt;\r\n                &lt;?php echo form_open(\\&#039;employer/add_job/\\&#039;, $attributes, $hidden);?&gt;\r\n			&lt;!-- Title --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Job Title&lt;/h5&gt;\r\n				&lt;input class=\\&quot;search-field\\&quot; type=\\&quot;text\\&quot; name=\\&quot;job_title\\&quot; placeholder=\\&quot;\\&quot; value=\\&quot;\\&quot;/&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- Job Type --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Job Type&lt;/h5&gt;\r\n				&lt;select data-placeholder=\\&quot;Job Type\\&quot; name=\\&quot;job_type\\&quot; class=\\&quot;chosen-select-no-single\\&quot;&gt;\r\n					&lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                    &lt;?php foreach($all_job_types-&gt;result() as $job_type) {?&gt;\r\n                    &lt;option value=\\&quot;&lt;?php echo $job_type-&gt;job_type_id?&gt;\\&quot;&gt;&lt;?php echo $job_type-&gt;type?&gt;&lt;/option&gt;\r\n                    &lt;?php } ?&gt;\r\n				&lt;/select&gt;\r\n			&lt;/div&gt;\r\n\r\n\r\n			&lt;!-- Choose Category --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;div class=\\&quot;select\\&quot;&gt;\r\n					&lt;h5&gt;Category&lt;/h5&gt;\r\n					&lt;select id=\\&quot;category_id\\&quot; name=\\&quot;category_id\\&quot; data-placeholder=\\&quot;Choose Category\\&quot; class=\\&quot;chosen-select\\&quot;&gt;\r\n						&lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($all_job_categories as $category):?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $category-&gt;category_id;?&gt;\\&quot;&gt;&lt;?php echo $category-&gt;category_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php endforeach;?&gt;\r\n					&lt;/select&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- Choose Minimum education --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;div class=\\&quot;select\\&quot;&gt;\r\n					&lt;h5&gt;Education Level&lt;/h5&gt;\r\n					&lt;select id=\\&quot;education_id\\&quot; name=\\&quot;education_id\\&quot; data-placeholder=\\&quot;Choose Education Level\\&quot; class=\\&quot;chosen-select\\&quot;&gt;\r\n						&lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($minimum_education as $education):?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $education-&gt;minimum_education_id;?&gt;\\&quot;&gt;&lt;?php echo $education-&gt;minimum_education;?&gt;&lt;/option&gt;\r\n                        &lt;?php endforeach;?&gt;\r\n					&lt;/select&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- Choose Department --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;div class=\\&quot;select\\&quot;&gt;\r\n					&lt;h5&gt;Department&lt;/h5&gt;\r\n					&lt;select id=\\&quot;dept_id\\&quot; name=\\&quot;dept_id\\&quot; data-placeholder=\\&quot;Choose Department\\&quot; class=\\&quot;chosen-select\\&quot;&gt;\r\n						&lt;option value=\\&quot;\\&quot;&gt;&lt;/option&gt;\r\n                        &lt;?php foreach($departments as $d):?&gt;\r\n                        &lt;option value=\\&quot;&lt;?php echo $d-&gt;department_id;?&gt;\\&quot;&gt;&lt;?php echo $d-&gt;department_name;?&gt;&lt;/option&gt;\r\n                        &lt;?php endforeach;?&gt;\r\n					&lt;/select&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- Description --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Short Description&lt;/h5&gt;\r\n				&lt;textarea class=\\&quot;\\&quot; name=\\&quot;short_description\\&quot; cols=\\&quot;40\\&quot; rows=\\&quot;1\\&quot; id=\\&quot;short_description\\&quot; spellcheck=\\&quot;true\\&quot;&gt;&lt;/textarea&gt;\r\n			&lt;/div&gt;\r\n            \r\n            &lt;!-- Description --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Description&lt;/h5&gt;\r\n				&lt;textarea class=\\&quot;WYSIWYG\\&quot; name=\\&quot;long_description\\&quot; cols=\\&quot;40\\&quot; rows=\\&quot;3\\&quot; id=\\&quot;long_description\\&quot; spellcheck=\\&quot;true\\&quot;&gt;&lt;/textarea&gt;\r\n			&lt;/div&gt;\r\n            \r\n            &lt;!-- Vacancy --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Number of Positions&lt;/h5&gt;\r\n				&lt;input type=\\&quot;text\\&quot; name=\\&quot;vacancy\\&quot; placeholder=\\&quot;Enter the job vacancy\\&quot;&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- TClosing Date --&gt;\r\n			&lt;div class=\\&quot;form\\&quot;&gt;\r\n				&lt;h5&gt;Closing Date&lt;/h5&gt;\r\n				&lt;input data-role=\\&quot;date\\&quot; class=\\&quot;date\\&quot; type=\\&quot;text\\&quot; name=\\&quot;date_of_closing\\&quot; placeholder=\\&quot;yyyy-mm-dd\\&quot;&gt;\r\n			&lt;/div&gt;\r\n\r\n			&lt;!-- Gender --&gt;', '[color=#d4d4d4][size=2][font=Consolas, \\&quot;Courier New\\&quot;, monospace][color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;container\\&quot;[/color][color=#808080]&gt;[/color]\r\n    \r\n    [color=#6a9955]&lt;!-- Submit Page --&gt;[/color]\r\n    [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;sixteen columns\\&quot;[/color][color=#808080]&gt;[/color]\r\n        [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;submit-page\\&quot;[/color][color=#808080]&gt;[/color]\r\n            [color=#569cd6]&lt;?php[/color] [color=#9cdcfe]$attributes[/color] = [color=#dcdcaa]array[/color]([color=#ce9178]\\&#039;name\\&#039;[/color] =&gt; [color=#ce9178]\\&#039;add_job\\&#039;[/color], [color=#ce9178]\\&#039;id\\&#039;[/color] =&gt; [color=#ce9178]\\&#039;xin-form\\&#039;[/color], [color=#ce9178]\\&#039;class\\&#039;[/color] =&gt; [color=#ce9178]\\&#039;add_job\\&#039;[/color], [color=#ce9178]\\&#039;autocomplete\\&#039;[/color] =&gt; [color=#ce9178]\\&#039;off\\&#039;[/color]);[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                [color=#569cd6]&lt;?php[/color] [color=#9cdcfe]$hidden[/color] = [color=#dcdcaa]array[/color]([color=#ce9178]\\&#039;add_job\\&#039;[/color] =&gt; [color=#ce9178]\\&#039;1\\&#039;[/color]);[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                [color=#569cd6]&lt;?php[/color] [color=#dcdcaa]echo[/color] [color=#dcdcaa]form_open[/color]([color=#ce9178]\\&#039;employer/add_job/\\&#039;[/color], [color=#9cdcfe]$attributes[/color], [color=#9cdcfe]$hidden[/color]);[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n            [color=#6a9955]&lt;!-- Title --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Job Title[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]input[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;search-field\\&quot;[/color] [color=#9cdcfe]type[/color]=[color=#ce9178]\\&quot;text\\&quot;[/color] [color=#9cdcfe]name[/color]=[color=#ce9178]\\&quot;job_title\\&quot;[/color] [color=#9cdcfe]placeholder[/color]=[color=#ce9178]\\&quot;\\&quot;[/color] [color=#9cdcfe]value[/color]=[color=#ce9178]\\&quot;\\&quot;[/color][color=#808080]/&gt;[/color]\r\n            [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color]\r\n\r\n            [color=#6a9955]&lt;!-- Job Type --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Job Type[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]select[/color] [color=#9cdcfe]data-placeholder[/color]=[color=#ce9178]\\&quot;Job Type\\&quot;[/color] [color=#9cdcfe]name[/color]=[color=#ce9178]\\&quot;job_type\\&quot;[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;chosen-select-no-single\\&quot;[/color][color=#808080]&gt;[/color]\r\n                    [color=#808080]&lt;[/color][color=#569cd6]option[/color] [color=#9cdcfe]value[/color]=[color=#ce9178]\\&quot;\\&quot;[/color][color=#808080]&gt;&lt;/[/color][color=#569cd6]option[/color][color=#808080]&gt;[/color]\r\n                    [color=#569cd6]&lt;?php[/color] [color=#c586c0]foreach[/color]([color=#9cdcfe]$all_job_types[/color]-&gt;[color=#dcdcaa]result[/color]() as [color=#9cdcfe]$job_type[/color]) {[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                    [color=#808080]&lt;[/color][color=#569cd6]option[/color] [color=#9cdcfe]value[/color]=[color=#ce9178]\\&quot;[/color][color=#569cd6]&lt;?php[/color] [color=#dcdcaa]echo[/color] [color=#9cdcfe]$job_type[/color]-&gt;[color=#9cdcfe]job_type_id[/color][color=#569cd6]?[/color][color=#569cd6]&gt;[/color][color=#ce9178]\\&quot;[/color][color=#808080]&gt;[/color][color=#569cd6]&lt;?php[/color] [color=#dcdcaa]echo[/color] [color=#9cdcfe]$job_type[/color]-&gt;[color=#9cdcfe]type[/color][color=#569cd6]?[/color][color=#569cd6]&gt;[/color][color=#808080]&lt;/[/color][color=#569cd6]option[/color][color=#808080]&gt;[/color]\r\n                    [color=#569cd6]&lt;?php[/color] } [color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                [color=#808080]&lt;/[/color][color=#569cd6]select[/color][color=#808080]&gt;[/color]\r\n            [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color]\r\n\r\n\r\n            [color=#6a9955]&lt;!-- Choose Category --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;select\\&quot;[/color][color=#808080]&gt;[/color]\r\n                    [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Category[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                  [color=#6a9955]hoose Department --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;select\\&quot;[/color][color=#808080]&gt;[/color]\r\n                    [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Department[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                    [color=#808080]&lt;[/color][color=#569cd6]select[/color] [color=#9cdcfe]id[/color]=[color=#ce9178]\\&quot;dept_id\\&quot;[/color] [color=#9cdcfe]name[/color]=[color=#ce9178]\\&quot;dept_id\\&quot;[/color] [color=#9cdcfe]data-placeholder[/color]=[color=#ce9178]\\&quot;Choose Department\\&quot;[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;chosen-select\\&quot;[/color][color=#808080]&gt;[/color]\r\n                        [color=#808080]&lt;[/color][color=#569cd6]option[/color] [color=#9cdcfe]value[/color]=[color=#ce9178]\\&quot;\\&quot;[/color][color=#808080]&gt;&lt;/[/color][color=#569cd6]option[/color][color=#808080]&gt;[/color]\r\n                        [color=#569cd6]&lt;?php[/color] [color=#c586c0]foreach[/color]([color=#9cdcfe]$departments[/color] as [color=#9cdcfe]$d[/color]):[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                        [color=#808080]&lt;[/color][color=#569cd6]option[/color] [color=#9cdcfe]value[/color]=[color=#ce9178]\\&quot;[/color][color=#569cd6]&lt;?php[/color] [color=#dcdcaa]echo[/color] [color=#9cdcfe]$d[/color]-&gt;[color=#9cdcfe]department_id[/color];[color=#569cd6]?[/color][color=#569cd6]&gt;[/color][color=#ce9178]\\&quot;[/color][color=#808080]&gt;[/color][color=#569cd6]&lt;?php[/color] [color=#dcdcaa]echo[/color] [color=#9cdcfe]$d[/color]-&gt;[color=#9cdcfe]department_name[/color];[color=#569cd6]?[/color][color=#569cd6]&gt;[/color][color=#808080]&lt;/[/color][color=#569cd6]option[/color][color=#808080]&gt;[/color]\r\n                        [color=#569cd6]&lt;?php[/color] [color=#c586c0]endforeach[/color];[color=#569cd6]?[/color][color=#569cd6]&gt;[/color]\r\n                    [color=#808080]&lt;/[/color][color=#569cd6]select[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color]\r\n            [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color]\r\n\r\n            [color=#6a9955]&lt;!-- Description --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Short Description[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]textarea[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;\\&quot;[/color] [color=#9cdcfe]name[/color]=[color=#ce9178]\\&quot;short_description\\&quot;[/color] [color=#9cdcfe]cols[/color]=[color=#ce9178]\\&quot;40\\&quot;[/color] [color=#9cdcfe]rows[/color]=[color=#ce9178]\\&quot;1\\&quot;[/color] [color=#9cdcfe]id[/color]=[color=#ce9178]\\&quot;short_description\\&quot;[/color] [color=#9cdcfe]spellcheck[/color]=[color=#ce9178]\\&quot;true\\&quot;[/color][color=#808080]&gt;&lt;/[/color][color=#569cd6]textarea[/color][color=#808080]&gt;[/color]\r\n            [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color]\r\n            \r\n            [color=#6a9955]&lt;!-- Description --&gt;[/color]\r\n            [color=#808080]&lt;[/color][color=#569cd6]div[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;form\\&quot;[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]Description[color=#808080]&lt;/[/color][color=#569cd6]h5[/color][color=#808080]&gt;[/color]\r\n                [color=#808080]&lt;[/color][color=#569cd6]textarea[/color] [color=#9cdcfe]class[/color]=[color=#ce9178]\\&quot;WYSIWYG\\&quot;[/color] [color=#9cdcfe]name[/color]=[color=#ce9178]\\&quot;long_description\\&quot;[/color] [color=#9cdcfe]cols[/color]=[color=#ce9178]\\&quot;40\\&quot;[/color] [color=#9cdcfe]rows[/color]=[color=#ce9178]\\&quot;3\\&quot;[/color] [color=#9cdcfe]id[/color]=[color=#ce9178]\\&quot;long_description\\&quot;[/color] [color=#9cdcfe]spellcheck[/color]=[color=#ce9178]\\&quot;true\\&quot;[/color][color=#808080]&gt;&lt;/[/color][color=#569cd6]textarea[/color][color=#808080]&gt;[/color]\r\n            [color=#808080]&lt;/[/color][color=#569cd6]div[/color][color=#808080]&gt;[/color][/font][/size][/color]', 1, '2020-11-13 10:52:38'),
(9, 2, 14, 0, 'z', 9, 'KJQ6Mg7RiqAr5HBZvfsW9kYzEdNDmpeawOLXVlcU', 2, '', 0, '', 4, '2', '0', '2020-12-09', '&lt;div class=\\&quot;container\\&quot;&gt;\r\n	\r\n	&lt;!-- Submit Page --&gt;\r\n	&lt;div class=\\&quot;sixteen columns\\&quot;&gt;', '[color=#808080]qwwopoopoopqow[/color]', 1, '2020-11-13 10:55:46'),
(10, 2, 14, 0, 'Java developer', 9, 'bYaOA17IE3ckwrvQXCzUnTqL9ghoJHRt5y8FlmSp', 1, '', 0, '', 3, '2', '3', '2020-12-21', 'The window.location.port property returns the number of the internet host port (of the current page).\r\n\r\n', '[size=2][font=Verdana, sans-serif]The \r\n[/font][/size][code]window.location.port[/code]\r\n[size][font]\r\n property returns the number of the internet host port (of the current page)[/font][/size]\r\n', 1, '2020-11-13 11:00:29'),
(11, 2, 14, 0, 'poli', 9, 'gxDW16eq3hiLU8BPRf5dM7tFQHkwr9NZX0jmCA24', 2, '', 0, '', 4, '1', '2', '2020-12-23', 'The window.location.port property returns the number of the internet host port (of the current page).', '[size=2][font=Verdana, sans-serif]The \r\n[/font][/size][code]window.location.port[/code]\r\n[size][font]\r\n property returns the number of the internet host port (of the current page)[/font][/size]\r\n', 1, '2020-11-13 11:04:19'),
(12, 2, 8, 0, 'p', 9, 'wIF3jMbAYJhaVK6BmtN9oyQ87X1nkLcDZgTRvdix', 2, '', 0, '', 3, '0', '0', '2020-12-23', 'The window.location.port property returns the number of the internet host port (of the current page).', '[size=2][font=Verdana, sans-serif]The \r\n[/font][/size][code]window.location.port[/code]\r\n[size][font]\r\n property returns the number of the internet host port (of the current page)[/font][/size]\r\n', 1, '2020-11-13 11:10:05'),
(13, 2, 1, 0, 'ASD', 9, 'XzLjiOsK41C5YSBwcm8Wa7r6kGftRF2DlNJbVxq3', 1, '', 0, '', 3, '2', '7', '2020-12-23', 'The window.location.port property returns the number of the internet host port (of the current page).', '[size=2][font=Verdana, sans-serif]The \r\n[/font][/size][code]window.location.port[/code]\r\n[size][font]\r\n property returns the number of the internet host port (of the current page)[/font][/size]\r\n', 1, '2020-11-13 11:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_applications`
--

CREATE TABLE `xin_job_applications` (
  `application_id` int(111) NOT NULL,
  `job_id` int(111) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` int(111) NOT NULL,
  `message` mediumtext NOT NULL,
  `job_resume` mediumtext NOT NULL,
  `application_status` int(11) NOT NULL DEFAULT 0,
  `application_remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_categories`
--

CREATE TABLE `xin_job_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_categories`
--

INSERT INTO `xin_job_categories` (`category_id`, `category_name`, `category_url`, `created_at`) VALUES
(1, 'PHP', 'q7VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(2, 'Android', 'q7VJh5xWwr56ycN0m34Aou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(3, 'WordPress', 'q2327VJh5xWwr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(6, 'iOS', 'l1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(7, 'Mobile', 'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r', '2018-04-15'),
(8, 'MySQL', '2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(9, 'JavaScript', 'gCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwl1BbMd6H2D3rkFnjU9LgCq7VJh5xWwr56ycN0mAou4266iOY8', '2018-04-15'),
(10, 'Software', 'zyr56ycN0mAou42634e6zyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFnjU9LgC', '2018-04-15'),
(11, 'Website Design', '6iOY8l1BbMd6H2D3rkFnjU9LgCzyr56ycN0mAou42634e6zyr56ycN0mAou426', '2018-04-15'),
(12, 'Programming', 'jU9LgCzyr56ycN0mAou4266iOY8l1BbMd6H2D3rkFn34e6zyr56ycN0mAou426', '2018-04-15'),
(13, 'SEO', 'cN0mAou4266iOY8l1Bq2327VJh5xWwr56ybMd6H2D3rkFnjU9LgC', '2018-04-15'),
(14, 'Java', 'VJh5xWwr56ybMd6H2DcN0mAou4266iOY8l1Bq23273rkFnjU9LgC', '2018-04-15'),
(15, 'CSS', 'VJh5xWwr56ybMd6H2Dsdfkkj58234ksklEr6ybMd6H2D', '2018-04-15'),
(16, 'HTML5', '0349324k0434r23ksodfkpsodkfposakfkpww3MsH2Dei30ks', '2018-04-15'),
(17, 'Web Development', 'sdfj0rkskfskdfj329FLE34LFMsH2Dei30ks0349324k0434', '2018-04-15'),
(18, 'Web Design', 'MsH2Deiee30ks0349324k0434klEr6ybMd6234b5ksddif0k33', '2018-04-15'),
(19, 'eCommerce', 'klEr6ybMd6234bMsH2Dei30ks0349324k04345ksddif0k33', '2018-04-15'),
(20, 'Design', '234bMsklEr6ybMd6H2Dssdk5yy98ooVJh5xWwr56y435gghhole93lfkkj58', '2018-04-15'),
(21, 'Logo Design', 'k5yy98ooVJh5xWw45456y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(22, 'Graphic Design', 'k5yy98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(23, 'Video', 'k98ooVJh5xWwr56y435gghhole93lfkkj58234bMsklEr6ybMd6H2D', '2018-04-15'),
(24, 'Animation', 'ole93lfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D', '2018-04-15'),
(25, 'Adobe Photoshop', 'd6H2Dsdfkkj58234k98ooVJh5xWwr56ybMsklEr6ybMd6H2D', '2018-04-15'),
(26, 'Illustration', 'xWwr56ybMd6H2DcN0mA3405kfVJh5ou4266iOY8l1Bq23273rkFnjU9LgC', '2018-04-15'),
(27, 'Art', '3405kfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybMd6H2DcN0mAFnjU9LgC', '2018-04-15'),
(28, '3D', 'Md6H2DcN0mAFnjU9LfVJh5ou4266iOY8l1Bq23273rk3ok3xWwr56ybgC', '2018-04-15'),
(29, 'Adobe Illustrator', '5ou4266iOY8l1Bq23273rkMd6H2DcN0mAFnjU9LfVJh3ok3xWwr56ybgCww', '2018-04-15'),
(30, 'Drawing', '6iOY8l1Bq23273rk0234KILR23492034ksfpd456yslfdsf5ou426', '2018-04-15'),
(31, 'Web Design', '3l34l432fo232l3223DhssdfRKLl5434lsdfl3l3sfs3lllblp23D', '2018-04-15'),
(32, 'Cartoon', 'sdfowerewl567lflsdfl3l3sf3l34l432fo232l3223Dhs3lllblp23D', '2018-04-15'),
(33, 'Graphics', '3232l32hsfo23lllblp23D9LfVJkfo394s5ou42at5sd20cNsolof3llsblp23DcN', '2018-04-15'),
(34, 'Fashion Design', '9LfVJkfo394s5ou42at5sd203232l32hsfo23lllblp23DcNsolof3llsblp23DcN', '2018-04-15'),
(35, 'WordPress', 'hsfo23lllblp23DcNsolof3llsblp23DcN9LfVJkfo394s5ou42', '2018-04-15'),
(36, 'Editing', 'lof3llsblp23DcN9LfVJhsfo23lllblp23DcNsokfo394s5ou42', '2018-04-15'),
(37, 'Writing', 'blp23DcNsokfo394slof3llsblp23DcN9LfVJh5ou42', '2018-04-15'),
(38, 'T-Shirt Design', '9LfVJh5ou42blp23DcNsdf329LfVJh5ou42bsokjfwpoek0mAFnjU', '2018-04-15'),
(39, 'Display Advertising', '9LfVJh5ou42bsokjfwpoek9LfVJh5ou42blp23DcN0mAFnjU', '2018-04-15'),
(40, 'Email Marketing', 'DcN0mAFnjU9LfVJh5ou42bs66iOY8l1Bq23273rk3ok3xWwr56yMd6H2gC', '2018-04-15'),
(41, 'Lead Generation', '66iOY8l1Bq23273rk3ok3xWwr56yMd6H2DcN0mAFnjU9LfVJh5ou42bgC', '2018-04-15'),
(42, 'Market & Customer Research', 'Aou42Eou42iOY800Ke3klAou42066iOY800fklAou42', '2018-04-15'),
(43, 'Marketing Strategy', 'EKe3000fklAou4266iOY8l1kkadwlsdfk20323rlsKh4KadlLL', '2018-04-15'),
(44, 'Public Relations', 'l1kkadwlsdfk20323rlsKh4KadlLLEKe3000fklAou4266iOY8', '2018-04-15'),
(45, 'Telemarketing & Telesales', 'fklAou4266iOY8l1kkadwlsfBf329k3249owe923ksd324odLL2DcN0m', '2018-04-15'),
(46, 'Other - Sales & Marketing', 'Bf329k3249owe923ksd324odfklAou4266iOY8l1kkadwlLL2DcN0m', '2018-04-15'),
(47, 'SEM - Search Engine Marketing', 'Aou4266iOY8l1Bf329k3249owe923ksdkkadwlLL2DcN0m', '2018-04-15'),
(48, 'SEO - Search Engine Optimization', 'rk0234KILR23492034ksfpd456y6iOY8l1Bq23273slfdsf5ou426', '2018-04-15'),
(49, 'SMM - Social Media Marketing', '2DcN0mAou4266iOY8l1BVJh5xWwr56ybMd6Hq23273rkFnjU9LgC', '2018-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_education`
--

CREATE TABLE `xin_job_education` (
  `education_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `minimum_education_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_job_education`
--

INSERT INTO `xin_job_education` (`education_id`, `job_id`, `minimum_education_id`, `created_at`) VALUES
(2, 3, NULL, '2020-11-02 10:44:44'),
(3, 4, 3, '2020-11-02 10:44:44'),
(4, 5, 2, '2020-11-02 12:01:13'),
(5, 6, 3, '2020-11-02 12:02:38'),
(6, 7, 2, '2020-11-02 12:04:33'),
(7, 8, 2, '2020-11-02 12:12:07'),
(8, 9, 1, '2020-11-02 12:14:19'),
(9, 10, 1, '2020-11-02 12:15:52'),
(10, 11, 2, '2020-11-02 12:16:59'),
(11, 12, 2, '2020-11-02 12:27:30'),
(12, 13, 2, '2020-11-02 12:28:41'),
(13, 14, 2, '2020-11-02 12:29:20'),
(14, 15, 2, '2020-11-02 12:51:10'),
(15, 1, 2, '2020-11-02 12:57:08'),
(16, 2, 2, '2020-11-04 16:26:08'),
(17, 3, 2, '2020-11-04 16:43:25'),
(18, 4, 3, '2020-11-04 16:45:00'),
(19, 5, 4, '2020-11-06 12:27:25'),
(20, 6, 3, '2020-11-12 16:14:39'),
(21, 7, 3, '2020-11-12 16:20:04'),
(22, 8, 2, '2020-11-13 10:52:38'),
(23, 9, 3, '2020-11-13 10:55:47'),
(24, 10, 2, '2020-11-13 11:00:29'),
(25, 11, 2, '2020-11-13 11:04:19'),
(26, 12, 2, '2020-11-13 11:10:05'),
(27, 13, 1, '2020-11-13 11:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_images`
--

CREATE TABLE `xin_job_images` (
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_job_images`
--

INSERT INTO `xin_job_images` (`image_id`, `category_id`, `image`, `created_at`) VALUES
(1, 1, 'php.png', '2020-11-02 14:17:58'),
(2, 2, 'android.png', '2020-11-02 14:33:28'),
(3, 3, 'wordpress.png', '2020-11-02 14:55:53'),
(4, 6, 'ios.png', '2020-11-02 14:59:26'),
(5, 7, 'mobile.png', '2020-11-02 15:00:29'),
(6, 8, 'sql.png', '2020-11-02 15:00:29'),
(7, 9, 'js.jpg', '2020-11-02 15:01:06'),
(8, 14, 'java.png', '2020-11-02 15:01:06'),
(9, 15, 'css.png', '2020-11-02 15:01:34'),
(10, 16, 'html.png', '2020-11-02 15:01:34'),
(11, 13, 'seo.png', '2020-11-02 15:03:15'),
(12, 22, 'graphic.png', '2020-11-02 15:03:15'),
(13, 23, 'video.png', '2020-11-02 15:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_interviews`
--

CREATE TABLE `xin_job_interviews` (
  `job_interview_id` int(111) NOT NULL,
  `job_id` int(111) NOT NULL,
  `interviewers_id` varchar(255) NOT NULL,
  `interview_place` varchar(255) NOT NULL,
  `interview_date` varchar(255) NOT NULL,
  `interview_time` varchar(255) NOT NULL,
  `interviewees_id` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_pages`
--

CREATE TABLE `xin_job_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `page_details` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_pages`
--

INSERT INTO `xin_job_pages` (`page_id`, `page_title`, `page_url`, `page_details`, `created_at`) VALUES
(1, 'About Us', 'xl9wkRy7tqOehBo6YCDjFG2JTucpKI4gMNsn8Zdf', 'About Ussss', '2018-04-15'),
(2, 'Communications', '5uk4EUc3V9FYTbBQz7PWgKM6qCajfAipvhOJnZHl', 'Communications', '2018-04-15'),
(3, 'Lending Licenses', '5r6OCsUoHQFiRwI17W0eT38jbvpxEGuLhzgmt9lZ', 'Lending Licenses', '2018-04-15'),
(4, 'Terms of Service', 'QrfbMOUWpdYNxjLFz8G1m6t3wi0X2RKEZVC9ySka', 'Terms of Service', '2018-04-15'),
(5, 'Privacy Policy', 'rjHKhmsNezT2OJBAoQq0yU1tL5F34MCwgIiZEc7x', 'Privacy Policy', '2018-04-15'),
(6, 'Support', 'gZbBVMxnfzYLlC2AOk609Q7yWpaSjmJHuRXosr58', 'Support', '2018-04-15'),
(7, 'How It Works', 'l1BbMd6H2D3rkFnjU9LgCH2D3rkFnjU9BbMd6H2D3r', 'How It Works', '2018-04-15'),
(8, 'Disclaimers', 'CTbzS9IrWkNU7VM3HGZYjp6iwmfyXDOQgtsP8FEc', 'Disclaimers', '2018-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `xin_job_type`
--

CREATE TABLE `xin_job_type` (
  `job_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `type_url` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_job_type`
--

INSERT INTO `xin_job_type` (`job_type_id`, `company_id`, `type`, `type_url`, `created_at`) VALUES
(1, 1, 'Full Time', 'full-time', '22-03-2018 02:18:48'),
(2, 1, 'Part Time', 'part-time', '16-04-2018 06:29:45'),
(3, 1, 'Internship', 'internship', '16-04-2018 06:30:06'),
(4, 1, 'Freelance', 'freelance', '16-04-2018 06:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_incidental`
--

CREATE TABLE `xin_kpi_incidental` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `incidental_kpi` text NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `result` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_maingoals`
--

CREATE TABLE `xin_kpi_maingoals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `main_kpi` varchar(255) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `approve_status` varchar(100) NOT NULL,
  `q1` varchar(100) NOT NULL,
  `q2` varchar(100) NOT NULL,
  `q3` varchar(100) NOT NULL,
  `q4` varchar(100) NOT NULL,
  `feedback` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_kpi_variable`
--

CREATE TABLE `xin_kpi_variable` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `variable_kpi` varchar(200) NOT NULL,
  `targeted_date` varchar(200) NOT NULL,
  `result` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `approve_status` varchar(200) NOT NULL,
  `feedback` text NOT NULL,
  `quarter` varchar(200) NOT NULL,
  `year_created` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_languages`
--

CREATE TABLE `xin_languages` (
  `language_id` int(111) NOT NULL,
  `language_name` varchar(255) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `language_flag` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_languages`
--

INSERT INTO `xin_languages` (`language_id`, `language_name`, `language_code`, `language_flag`, `is_active`, `created_at`) VALUES
(1, 'English', 'english', 'language_flag_1520564355.gif', 1, ''),
(4, 'Portuguese', 'portuguese', 'language_flag_1526420518.gif', 1, '16-05-2018 12:41:57'),
(5, 'Vietnamese', 'vietnamese', 'language_flag_1526728529.gif', 1, '19-05-2018 02:15:28'),
(6, 'Spanish', 'spanish', 'language_flag_1563906920.gif', 1, '23-07-2019 11:35:20'),
(7, 'Svenska', 'swedish', 'language_flag_1564007195.gif', 1, '25-07-2019 03:26:35'),
(8, 'Thailand', 'thailand', 'language_flag_1564007402.gif', 1, '25-07-2019 03:30:02'),
(9, 'Indonesian', 'indonesian', 'language_flag_1564054894.gif', 1, '25-07-2019 04:41:33'),
(10, 'Italiano', 'italian', 'language_flag_1564058198.gif', 1, '25-07-2019 05:36:37'),
(11, 'Deutsch', 'dutch', 'language_flag_1564058280.gif', 1, '25-07-2019 05:37:59'),
(12, 'Turkish', 'turkish', 'language_flag_1564058565.gif', 1, '25-07-2019 05:42:44'),
(13, 'French', 'french', 'language_flag_1564058638.gif', 1, '25-07-2019 05:43:58'),
(14, 'Russian', 'russian', 'language_flag_1564058661.gif', 1, '25-07-2019 05:44:20'),
(15, 'Romanian', 'romanian', 'language_flag_1564058689.gif', 1, '25-07-2019 05:44:49'),
(16, 'Irish', 'irish', 'language_flag_1564171301.gif', 1, '27-07-2019 01:01:41'),
(17, 'Chinese', 'chinese', 'language_flag_1592785239.gif', 1, '22-06-2020 03:20:38'),
(18, 'Japanese', 'japanese', 'language_flag_1592785267.gif', 1, '22-06-2020 03:21:06'),
(19, 'Arabic', 'arabic', 'language_flag_1592785279.gif', 1, '22-06-2020 03:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `xin_leads`
--

CREATE TABLE `xin_leads` (
  `client_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `client_username` varchar(255) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_profile` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `is_changed` int(11) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `is_active` int(11) NOT NULL,
  `last_logout_date` varchar(255) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_leads_followup`
--

CREATE TABLE `xin_leads_followup` (
  `leads_followup_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `next_followup` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_leave_applications`
--

CREATE TABLE `xin_leave_applications` (
  `leave_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(222) NOT NULL,
  `department_id` int(11) NOT NULL,
  `leave_type_id` int(222) NOT NULL,
  `from_date` varchar(200) NOT NULL,
  `to_date` varchar(200) NOT NULL,
  `applied_on` varchar(200) NOT NULL,
  `reason` mediumtext NOT NULL,
  `remarks` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_half_day` tinyint(1) DEFAULT NULL,
  `is_notify` int(11) NOT NULL,
  `leave_attachment` varchar(255) DEFAULT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_leave_applications`
--

INSERT INTO `xin_leave_applications` (`leave_id`, `company_id`, `employee_id`, `department_id`, `leave_type_id`, `from_date`, `to_date`, `applied_on`, `reason`, `remarks`, `status`, `is_half_day`, `is_notify`, `leave_attachment`, `created_at`) VALUES
(1, 0, 96, 0, 3, '1970-01-01', '1970-01-01', '2020-10-22 12:03:53', 'ys', '', 2, NULL, 0, NULL, '2020-10-22 12:03:53'),
(2, 0, 96, 0, 1, '2020-10-06', '2020-10-06', '2020-10-22 12:22:05', 'sick', '', 1, NULL, 0, NULL, '2020-10-22 12:22:05'),
(3, 1, 96, 0, 2, '2020-09-01', '2020-09-02', '2020-10-22 12:22:15', 'sick', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_cc111a892c343734418af6a02e393c94.png', '2020-10-22 12:22:15'),
(4, 0, 96, 0, 3, '2020-10-06', '2020-10-06', '2020-10-22 12:22:25', 'sick', '', 1, NULL, 0, NULL, '2020-10-22 12:22:25'),
(5, 0, 96, 0, 1, '2020-10-06', '2020-10-06', '2020-10-22 14:27:00', 'sick', '', 1, NULL, 0, NULL, '2020-10-22 14:27:00'),
(6, 1, 96, 0, 2, '1970-01-01', '1970-01-01', '2020-10-22 14:27:19', 'bh', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_2bc32029b0e91e3a5fa3f3db042b820c.png', '2020-10-22 14:27:19'),
(7, 1, 96, 0, 2, '2020-09-01', '2020-09-02', '2020-10-22 14:28:06', 'sick', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_a5e11832195c76085676e85107f4b570.png', '2020-10-22 14:28:06'),
(8, 0, 96, 0, 3, '2020-10-06', '2020-10-06', '2020-10-22 14:28:10', 'sick', '', 1, NULL, 0, NULL, '2020-10-22 14:28:10'),
(9, 0, 96, 0, 3, '1970-01-01', '1970-01-01', '2020-10-28 07:51:34', 'hu', '', 1, NULL, 0, NULL, '2020-10-28 07:51:34'),
(10, 0, 96, 0, 1, '1970-01-01', '1970-01-01', '2020-10-28 07:51:52', 'vhhjj', '', 1, NULL, 0, NULL, '2020-10-28 07:51:52'),
(11, 1, 96, 0, 2, '1970-01-01', '1970-01-01', '2020-10-28 07:52:32', 'ghhu', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_39e45ebf6964ee02234b080a6ac9d64e.png', '2020-10-28 07:52:32'),
(12, 0, 96, 0, 1, '2020-10-06', '2020-10-06', '2020-10-29 06:40:49', 'sick', '', 1, NULL, 0, NULL, '2020-10-29 06:40:49'),
(13, 0, 96, 0, 3, '2020-10-06', '2020-10-06', '2020-10-29 06:41:20', 'sick', '', 1, NULL, 0, NULL, '2020-10-29 06:41:20'),
(14, 1, 96, 0, 2, '2020-09-01', '2020-09-02', '2020-10-29 06:41:24', 'sick', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_c7d3348681deb90be35928bfd24d03c4.png', '2020-10-29 06:41:24'),
(15, 1, 6, 0, 2, '2020-10-21', '2020-10-22', '2020-10-29 07:26:40', 'Test', '', 2, NULL, 0, 'hrms-api/uploads/leaves/leave_045bb89a8b205a5ccd9f342ea3d28f32.png', '2020-10-29 07:26:40'),
(16, 0, 6, 0, 1, '2020-10-26', '2020-10-28', '2020-11-02 10:38:59', 'Test', '', 2, NULL, 0, NULL, '2020-11-02 10:38:59'),
(20, 0, 6, 0, 1, '2020-11-02', '2020-11-03', '2020-11-02 12:03:43', 'text', '', 1, NULL, 0, NULL, '2020-11-02 12:03:43'),
(21, 0, 6, 0, 3, '2020-11-02', '2020-11-03', '2020-11-02 12:03:56', 'Test2', '', 1, NULL, 0, NULL, '2020-11-02 12:03:56'),
(22, 1, 6, 0, 2, '2020-11-03', '2020-11-04', '2020-11-03 06:56:59', 'test', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_864ad36c2ffd189efce216e1b8d1d01e.png', '2020-11-03 06:56:59'),
(23, 1, 6, 0, 2, '2020-11-03', '2020-11-04', '2020-11-03 06:58:45', 'test', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_3984cf930f2eee8c11f84d03e01b11e6.png', '2020-11-03 06:58:45'),
(24, 1, 6, 0, 2, '2020-11-03', '2020-12-04', '2020-11-03 07:23:38', 'test', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_583515832268fe7f15cdd25483551afb.png', '2020-11-03 07:23:38'),
(25, 1, 6, 0, 2, '2020-04-11', '2020-04-11', '2020-11-04 11:59:02', 'Sick', '', 2, NULL, 0, 'hrms-api/uploads/leaves/leave_8eba28348ec9457d31991bf313cf611e.png', '2020-11-04 11:59:02'),
(26, 0, 9794, 0, 1, '2020-06-11', '2020-07-11', '2020-11-06 07:17:25', 'Feeling sick', '', 1, NULL, 0, NULL, '2020-11-06 07:17:25'),
(27, 1, 9794, 0, 2, '2020-09-11', '2020-11-11', '2020-11-06 07:22:10', 'Headache', '', 1, NULL, 0, 'hrms-api/uploads/leaves/leave_305473c7d7baf3a7748b5262ad4c589e.png', '2020-11-06 07:22:10'),
(28, 1, 6, 0, 1, '2020-11-06', '2020-11-07', '2020-11-06 10:07:51', 'm', 'm', 1, 0, 1, 'leave_1604646472.png', '2020-11-06 10:07:51'),
(29, 0, 6, 0, 1, '2020-03-01', '2020-03-05', '2020-11-06 08:19:31', 'sick', '', 1, NULL, 0, NULL, '2020-11-06 08:19:31'),
(30, 0, 6, 1, 1, '2020-03-01', '2020-03-05', '2020-11-06 08:20:09', 'sick', '', 1, NULL, 0, NULL, '2020-11-06 08:20:09'),
(31, 0, 6, 1, 1, '2020-03-01', '2020-03-05', '2020-11-06 08:20:40', 'sick', '', 1, NULL, 0, NULL, '2020-11-06 08:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `xin_leave_type`
--

CREATE TABLE `xin_leave_type` (
  `leave_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type_name` varchar(200) NOT NULL,
  `days_per_year` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_leave_type`
--

INSERT INTO `xin_leave_type` (`leave_type_id`, `company_id`, `type_name`, `days_per_year`, `status`, `created_at`) VALUES
(1, 1, 'Casual Leave', '10', 1, '0000-00-00 00:00:00'),
(2, 1, 'Medical', '10', 1, '0000-00-00 00:00:00'),
(3, 1, 'Annual Leave', '10', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xin_macaddress`
--

CREATE TABLE `xin_macaddress` (
  `macaddress_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `mac_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_macaddress`
--

INSERT INTO `xin_macaddress` (`macaddress_id`, `employee_id`, `mac_address`) VALUES
(1, 96, 'csjkbnkjbv'),
(3, 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_make_payment`
--

CREATE TABLE `xin_make_payment` (
  `make_payment_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `department_id` int(111) NOT NULL,
  `company_id` int(111) NOT NULL,
  `location_id` int(111) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `payment_date` varchar(200) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `payment_amount` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowances` varchar(255) NOT NULL,
  `total_deductions` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `is_advance_salary_deduct` int(11) NOT NULL,
  `advance_salary_amount` varchar(255) NOT NULL,
  `is_payment` tinyint(1) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `hourly_rate` varchar(255) NOT NULL,
  `total_hours_work` varchar(255) NOT NULL,
  `comments` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_meetings`
--

CREATE TABLE `xin_meetings` (
  `meeting_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `meeting_title` varchar(255) NOT NULL,
  `meeting_date` varchar(255) NOT NULL,
  `meeting_time` varchar(255) NOT NULL,
  `meeting_room` varchar(255) NOT NULL,
  `meeting_note` mediumtext NOT NULL,
  `meeting_color` varchar(200) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_minimum_education`
--

CREATE TABLE `xin_minimum_education` (
  `minimum_education_id` int(11) NOT NULL,
  `minimum_education` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_minimum_education`
--

INSERT INTO `xin_minimum_education` (`minimum_education_id`, `minimum_education`, `created_at`) VALUES
(1, 'Bachelor\'s in Computer Science', '2020-10-22 05:13:29'),
(2, 'Bachelor\'s in Software Engineering', '2020-10-22 05:13:29'),
(3, 'Diploma in Computer Science', '2020-10-22 05:13:57'),
(4, 'Master\'s in Computer Science', '2020-10-22 05:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `xin_office_location`
--

CREATE TABLE `xin_office_location` (
  `location_id` int(11) NOT NULL,
  `company_id` int(111) NOT NULL,
  `location_head` int(111) NOT NULL,
  `location_manager` int(111) NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `fax` varchar(255) NOT NULL,
  `address_1` mediumtext NOT NULL,
  `address_2` mediumtext NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(111) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_office_location`
--

INSERT INTO `xin_office_location` (`location_id`, `company_id`, `location_head`, `location_manager`, `location_name`, `email`, `phone`, `fax`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `added_by`, `created_at`, `status`) VALUES
(1, 1, 5, 0, 'Karachi Branch', 'mainoffice@monet.com', '1234567890', '1234567890', 'Address Line 1', 'Address Line 2', 'City', 'State', '12345', 167, 1, '28-02-2018', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_office_shift`
--

CREATE TABLE `xin_office_shift` (
  `office_shift_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `shift_name` varchar(255) NOT NULL,
  `default_shift` int(111) NOT NULL,
  `monday_in_time` varchar(222) NOT NULL,
  `monday_out_time` varchar(222) NOT NULL,
  `tuesday_in_time` varchar(222) NOT NULL,
  `tuesday_out_time` varchar(222) NOT NULL,
  `wednesday_in_time` varchar(222) NOT NULL,
  `wednesday_out_time` varchar(222) NOT NULL,
  `thursday_in_time` varchar(222) NOT NULL,
  `thursday_out_time` varchar(222) NOT NULL,
  `friday_in_time` varchar(222) NOT NULL,
  `friday_out_time` varchar(222) NOT NULL,
  `saturday_in_time` varchar(222) NOT NULL,
  `saturday_out_time` varchar(222) NOT NULL,
  `sunday_in_time` varchar(222) NOT NULL,
  `sunday_out_time` varchar(222) NOT NULL,
  `created_at` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_office_shift`
--

INSERT INTO `xin_office_shift` (`office_shift_id`, `company_id`, `shift_name`, `default_shift`, `monday_in_time`, `monday_out_time`, `tuesday_in_time`, `tuesday_out_time`, `wednesday_in_time`, `wednesday_out_time`, `thursday_in_time`, `thursday_out_time`, `friday_in_time`, `friday_out_time`, `saturday_in_time`, `saturday_out_time`, `sunday_in_time`, `sunday_out_time`, `created_at`) VALUES
(1, 1, 'Morning Shift', 1, '09:00', '18:00', '09:00', '18:00', '09:00', '18:00', '09:00', '18:00', '09:00', '18:00', '', '', '', '', '2018-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `xin_payment_method`
--

CREATE TABLE `xin_payment_method` (
  `payment_method_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `payment_percentage` varchar(200) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_payment_method`
--

INSERT INTO `xin_payment_method` (`payment_method_id`, `company_id`, `method_name`, `payment_percentage`, `account_number`, `created_at`) VALUES
(1, 1, 'Cash', '30', '', '23-04-2018 05:13:52'),
(2, 1, 'Paypal', '40', '1', '12-08-2018 02:18:50'),
(3, 1, 'Bank', '30', '1231232', '12-08-2018 02:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `xin_payroll_custom_fields`
--

CREATE TABLE `xin_payroll_custom_fields` (
  `payroll_custom_id` int(11) NOT NULL,
  `allow_custom_1` varchar(255) NOT NULL,
  `is_active_allow_1` int(11) NOT NULL,
  `allow_custom_2` varchar(255) NOT NULL,
  `is_active_allow_2` int(11) NOT NULL,
  `allow_custom_3` varchar(255) NOT NULL,
  `is_active_allow_3` int(11) NOT NULL,
  `allow_custom_4` varchar(255) NOT NULL,
  `is_active_allow_4` int(11) NOT NULL,
  `allow_custom_5` varchar(255) NOT NULL,
  `is_active_allow_5` int(111) NOT NULL,
  `deduct_custom_1` varchar(255) NOT NULL,
  `is_active_deduct_1` int(11) NOT NULL,
  `deduct_custom_2` varchar(255) NOT NULL,
  `is_active_deduct_2` int(11) NOT NULL,
  `deduct_custom_3` varchar(255) NOT NULL,
  `is_active_deduct_3` int(11) NOT NULL,
  `deduct_custom_4` varchar(255) NOT NULL,
  `is_active_deduct_4` int(11) NOT NULL,
  `deduct_custom_5` varchar(255) NOT NULL,
  `is_active_deduct_5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_appraisal`
--

CREATE TABLE `xin_performance_appraisal` (
  `performance_appraisal_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `appraisal_year_month` varchar(255) NOT NULL,
  `customer_experience` int(111) NOT NULL,
  `marketing` int(111) NOT NULL,
  `management` int(111) NOT NULL,
  `administration` int(111) NOT NULL,
  `presentation_skill` int(111) NOT NULL,
  `quality_of_work` int(111) NOT NULL,
  `efficiency` int(111) NOT NULL,
  `integrity` int(111) NOT NULL,
  `professionalism` int(111) NOT NULL,
  `team_work` int(111) NOT NULL,
  `critical_thinking` int(111) NOT NULL,
  `conflict_management` int(111) NOT NULL,
  `attendance` int(111) NOT NULL,
  `ability_to_meet_deadline` int(111) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_performance_appraisal`
--

INSERT INTO `xin_performance_appraisal` (`performance_appraisal_id`, `company_id`, `employee_id`, `appraisal_year_month`, `customer_experience`, `marketing`, `management`, `administration`, `presentation_skill`, `quality_of_work`, `efficiency`, `integrity`, `professionalism`, `team_work`, `critical_thinking`, `conflict_management`, `attendance`, `ability_to_meet_deadline`, `remarks`, `added_by`, `created_at`) VALUES
(0, 1, 6, '2021-01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, '04-11-2020');

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_appraisal_options`
--

CREATE TABLE `xin_performance_appraisal_options` (
  `performance_appraisal_options_id` int(11) NOT NULL,
  `appraisal_id` int(11) NOT NULL,
  `appraisal_type` varchar(200) NOT NULL,
  `appraisal_option_id` int(11) NOT NULL,
  `appraisal_option_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_indicator`
--

CREATE TABLE `xin_performance_indicator` (
  `performance_indicator_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `customer_experience` int(111) NOT NULL,
  `marketing` int(111) NOT NULL,
  `management` int(111) NOT NULL,
  `administration` int(111) NOT NULL,
  `presentation_skill` int(111) NOT NULL,
  `quality_of_work` int(111) NOT NULL,
  `efficiency` int(111) NOT NULL,
  `integrity` int(111) NOT NULL,
  `professionalism` int(111) NOT NULL,
  `team_work` int(111) NOT NULL,
  `critical_thinking` int(111) NOT NULL,
  `conflict_management` int(111) NOT NULL,
  `attendance` int(111) NOT NULL,
  `ability_to_meet_deadline` int(111) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_performance_indicator_options`
--

CREATE TABLE `xin_performance_indicator_options` (
  `performance_indicator_options_id` int(11) NOT NULL,
  `indicator_id` int(11) NOT NULL,
  `indicator_type` varchar(200) NOT NULL,
  `indicator_option_id` int(11) NOT NULL,
  `indicator_option_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_policy_record`
--

CREATE TABLE `xin_policy_record` (
  `record_id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `questions_attempted` varchar(200) NOT NULL,
  `answer_attempted` varchar(250) NOT NULL,
  `answers_correct` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects`
--

CREATE TABLE `xin_projects` (
  `project_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` int(100) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `purchase_no` varchar(200) DEFAULT NULL,
  `budget_hours` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_projects`
--

INSERT INTO `xin_projects` (`project_id`, `title`, `client_id`, `start_date`, `end_date`, `company_id`, `assigned_to`, `priority`, `project_no`, `phase_no`, `purchase_no`, `budget_hours`, `summary`, `description`, `added_by`, `project_progress`, `project_note`, `status`, `is_notify`, `created_at`) VALUES
(1, 'HRMS', 1, '2020-10-24', '2020-10-25', '1', '5,6', '1', 'M9SPY86', '23', 'wq33sdefwe', '23', '0\r\n\r\n\r\nI am a newbie in CI and I got stuck with some issues on my current project. So here is my question:\r\n\r\n1. I already succeded create auto generate number function for a text field, but I don\'t know how to show or place it automatically at my specific text field in view page whenever I hit \"Create New\" button.', '<p class=\"votecell post-layout--left\" xss=removed><p class=\"js-voting-container grid fd-column ai-stretch gs4 fc-black-200\" data-post-id=\"52551588\" xss=removed><p class=\"js-vote-count grid--cell fc-black-500 fs-title grid fd-column ai-center\" itemprop=\"upvoteCount\" data-value=\"0\" xss=removed>0</p>&lt;button class=\"js-vote-down-btn grid--cell s-btn s-btn__unset c-pointer\" data-controller=\"s-tooltip\" data-s-tooltip-placement=\"right\" aria-pressed=\"false\" aria-label=\"Down vote\" data-selected-classes=\"fc-theme-primary\" aria-describedby=\"--stacks-s-tooltip-nchsovbj\" style=\"margin: 2px; box-sizing: inherit; font: unset; cursor: default; position: relative; padding: 0px; border-width: initial; border-style: none; border-color: initial; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline: none; user-select: auto; box-shadow: none;\"&gt;&lt;svg aria-hidden=\"true\" class=\"m0 svg-icon iconArrowDownLg\" width=\"36\" height=\"36\" viewBox=\"0 0 36 36\"&gt;<path d=\"M2 10h32L18 26 2 10z\"></path>&lt;/svg&gt;&lt;/button&gt;&lt;button class=\"js-bookmark-btn s-btn s-btn__unset c-pointer py4 js-gps-track\" data-controller=\"s-tooltip\" data-s-tooltip-placement=\"right\" aria-pressed=\"false\" aria-label=\"Bookmark\" data-selected-classes=\"fc-yellow-600\" data-gps-track=\"post.click({ item: 1, priv: 0, post_type: 1 })\" aria-describedby=\"--stacks-s-tooltip-e8imyk4m\" style=\"box-sizing: inherit; font: unset; padding: 0px; cursor: default; position: relative; border-width: initial; border-style: none; border-color: initial; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline: none; user-select: auto; box-shadow: none;\"&gt;&lt;svg aria-hidden=\"true\" class=\"svg-icon iconBookmark\" width=\"18\" height=\"18\" viewBox=\"0 0 18 18\"&gt;<path d=\"M6 1a2 2 0 00-2 2v14l5-4 5 4V3a2 2 0 00-2-2H6zm3.9 3.83h2.9l-2.35 1.7.9 2.77L9 7.59l-2.35 1.7.9-2.76-2.35-1.7h2.9L9 2.06l.9 2.77z\"></path>&lt;/svg&gt;&lt;/button&gt;<a class=\"js-post-issue grid--cell s-btn s-btn__unset c-pointer py6 mx-auto\" href=\"https://stackoverflow.com/posts/52551588/timeline\" data-shortcut=\"T\" data-controller=\"s-tooltip\" data-s-tooltip-placement=\"right\" aria-label=\"Timeline\" aria-describedby=\"--stacks-s-tooltip-q6nbzn6p\" xss=removed>&lt;svg aria-hidden=\"true\" class=\"mln2 mr0 svg-icon iconHistory\" width=\"19\" height=\"18\" viewBox=\"0 0 19 18\"&gt;<path d=\"M3 9a8 8 0 113.73 6.77L8.2 14.3A6 6 0 105 9l3.01-.01-4 4-4-4h3L3 9zm7-4h1.01L11 9.36l3.22 2.1-.6.93L10 10V5z\"></path>&lt;/svg&gt;</a></p></p><p class=\"postcell post-layout--right\" xss=removed><p class=\"s-prose js-post-body\" itemprop=\"text\" xss=removed><p xss=removed>I am a newbie in CI and I got stuck with some issues on my current project. So here is my question:<br xss=removed></p><p xss=removed>1. I already succeded create auto generate number function for a text field, but I don\'t know how to show or place it automatically at my specific text field in view page whenever I hit \"Create New\" button</p></p></p>', 1, '0', '', 0, 1, '23-10-2020'),
(2, 'Narcotics', 1, '2020-11-04', '2020-11-25', '1', '5,6', '3', 'FFVTNK3', '3', '23332', '34', 'er', 'ef', 1, '0', '', 0, 1, '03-11-2020'),
(3, 'Narcotics', 1, '2020-11-12', '2021-01-27', '1', '6,25,53', '3', 'BJG3NRC', '3', '23332', '34', '&lt;?php\r\n/* Projects List view\r\n*/\r\n?&gt;\r\n&lt;?php $session = $this->session->userdata(\'username\');?&gt;\r\n&lt;?php $get_animate = $this->Xin_model->get_content_animate();?&gt;\r\n&lt;?php $role_resources_ids = $this->Xin_model->user_role_resource(); ?&gt;\r\n&lt;?php $user_info = $this->Xin_model->read_user_info($session[\'user_id\']);?&gt;\r\n&lt;?php $project_no = $this->Xin_model->generate_random_string();?&gt;\r\n&lt;?php $system = $this->Xin_model->read_setting_info(1); ?&gt;\r\n\r\n<div id=\"smartwizard-2\" class=\"smartwizard-example sw-main sw-theme-default\">\r\n  <ul class=\"nav nav-tabs step-anchor\">\r\n    &lt;?php if(in_array(\'312\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item done\"> <a href=\"&lt;?php echo site_url(\'admin/project/projects_dashboard/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/project/projects_dashboard/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon ion ion-md-speedometer\"></span> &lt;?php echo $this->lang->line(\'dashboard_title\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_overview\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n      &lt;?php if(in_array(\'44\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item active\"> <a href=\"&lt;?php echo site_url(\'admin/project/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/project/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon ion ion-logo-buffer\"></span> &lt;?php echo $this->lang->line(\'left_projects\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_role_add\');?&gt; &lt;?php echo $this->lang->line(\'left_projects\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n      &lt;?php if(in_array(\'119\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item done\"> <a href=\"&lt;?php echo site_url(\'admin/clients/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/clients/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon fas fa-user-check\"></span> &lt;?php echo $this->lang->line(\'xin_project_clients\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_role_add\');?&gt; &lt;?php echo $this->lang->line(\'xin_project_clients\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n      &lt;?php if(in_array(\'94\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item done\"> <a href=\"&lt;?php echo site_url(\'admin/project/timelogs/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/project/timelogs/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon fas fa-user-clock\"></span> &lt;?php echo $this->lang->line(\'xin_project_timelogs\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_role_add\');?&gt; &lt;?php echo $this->lang->line(\'xin_project_timelogs\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n      &lt;?php if(in_array(\'424\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item done\"> <a href=\"&lt;?php echo site_url(\'admin/project/projects_calendar/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/project/projects_calendar/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon fas fa-calendar-alt\"></span> &lt;?php echo $this->lang->line(\'xin_acc_calendar\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_view\');?&gt; &lt;?php echo $this->lang->line(\'xin_acc_calendar\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n      &lt;?php if(in_array(\'425\',$role_resources_ids)) { ?&gt;\r\n    <li class=\"nav-item done\"> <a href=\"&lt;?php echo site_url(\'admin/project/projects_scrum_board/\');?&gt;\" data-link-data=\"&lt;?php echo site_url(\'admin/project/projects_scrum_board/\');?&gt;\" class=\"mb-3 nav-link hrsale-link\"> <span class=\"sw-icon fas fa-clipboard-list\"></span> &lt;?php echo $this->lang->line(\'xin_projects_scrm_board\');?&gt;\r\n      <div class=\"text-muted small\">&lt;?php echo $this->lang->line(\'xin_view\');?&gt; &lt;?php echo $this->lang->line(\'xin_projects_scrm_board\');?&gt;</div>\r\n      </a> </li>\r\n      &lt;?php } ?&gt;\r\n  </ul>\r\n</div>\r\n<hr class=\"border-light m-0 mb-3\">\r\n&lt;?php if(in_array(\'315\',$role_resources_ids)) {?&gt;\r\n<div class=\"card mb-4\">\r\n  <div id=\"accordion\">\r\n    <div class=\"card-header with-elements\"> <span class=\"card-header-title mr-2\"><strong>&lt;?php echo $this->lang->line(\'xin_add_new\');?&gt;</strong> &lt;?php echo $this->lang->line(\'xin_project\');?&gt;</span>\r\n      <div class=\"card-header-elements ml-md-auto\"> <a class=\"text-dark collapsed\" data-toggle=\"collapse\" href=\"#add_project_form\" aria-expanded=\"false\">\r\n        &lt;button type=\"button\" class=\"btn btn-xs btn-primary\"&gt; <span class=\"ion ion-md-add\"></span> &lt;?php echo $this->lang->line(\'xin_add_new\');?&gt;&lt;/button&gt;\r\n        </a> </div>\r\n    </div>\r\n    <div id=\"add_project_form\" class=\"collapse add-form &lt;?php echo $get_animate;?&gt;\" data-parent=\"#accordion\" xss=removed>\r\n      <div class=\"card-body\">\r\n        &lt;?php $attributes = array(\'name\' => \'add_project\', \'id\' => \'xin-form\', \'autocomplete\' => \'off\');?&gt;\r\n        &lt;?php $hidden = array(\'user_id\' => $session[\'user_id\']);?&gt;\r\n        &lt;?php echo form_open_multipart(\'admin/project/add_project\', $hidden);?&gt;\r\n        <div class=\"bg-white\">\r\n          <div class=\"box-block\">\r\n            <div class=\"row\">\r\n              <div class=\"col-md-6\">\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"title\">&lt;?php echo $this->lang->line(\'xin_title\');?&gt;</label>\r\n                      &lt;input class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_title\');?&gt;\" name=\"title\" type=\"text\"&gt;\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"project_no\">&lt;?php echo $this->lang->line(\'xin_project_no\');?&gt;</label>\r\n                      &lt;input class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_project_no\');?&gt;\" name=\"project_no\" type=\"text\" value=\"&lt;?php echo $project_no;?&gt;\"&gt;\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"purchase_no\">&lt;?php echo $this->lang->line(\'xin_po_no\');?&gt;</label>\r\n                      &lt;input class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_po_no\');?&gt;\" name=\"purchase_no\" type=\"text\" value=\"\"&gt;\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"phase_no\">&lt;?php echo $this->lang->line(\'xin_phase_no\');?&gt;</label>\r\n                      &lt;input class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_phase_no\');?&gt;\" name=\"phase_no\" type=\"text\" value=\"\"&gt;\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"purchase_no\">&lt;?php echo \"Add Project Image\"?&gt;</label>\r\n                      &lt;input class=\"form-group\"  name=\"task_image\" type=\"file\" value=\"\"&gt;\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"client_id\">&lt;?php echo $this->lang->line(\'xin_project_client\');?&gt;</label>\r\n                      &lt;select name=\"client_id\" id=\"client_id\" class=\"form-control\" data-plugin=\"select_hrm\" data-placeholder=\"&lt;?php echo $this->lang->line(\'xin_project_client\');?&gt;\"&gt;\r\n                        <option value=\"\"></option>\r\n                        &lt;?php foreach($all_clients as $client) {?&gt;\r\n                        <option value=\"&lt;?php echo $client->client_id;?&gt;\"> &lt;?php echo $client->name;?&gt;</option>\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    </div>\r\n                  </div>\r\n                  &lt;?php if($user_info[0]->user_role_id==1){ ?&gt;\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"company_id\">&lt;?php echo $this->lang->line(\'module_company_title\');?&gt;</label>\r\n                      &lt;select multiple=\"multiple\" name=\"company_id[]\" id=\"aj_company\" class=\"form-control\" data-plugin=\"select_hrm\" data-placeholder=\"&lt;?php echo $this->lang->line(\'module_company_title\');?&gt;\"&gt;\r\n                        <option value=\"\"></option>\r\n                        &lt;?php foreach($all_companies as $company) {?&gt;\r\n                        <option value=\"&lt;?php echo $company->company_id;?&gt;\"> &lt;?php echo $company->name;?&gt;</option>\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    </div>\r\n                  </div>\r\n                  &lt;?php } else {?&gt;\r\n                  &lt;?php $ecompany_id = $user_info[0]->company_id;?&gt;\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"company_id\">&lt;?php echo $this->lang->line(\'module_company_title\');?&gt;</label>\r\n                      &lt;select multiple=\"multiple\" name=\"company_id[]\" id=\"aj_company\" class=\"form-control\" data-plugin=\"select_hrm\" data-placeholder=\"&lt;?php echo $this->lang->line(\'module_company_title\');?&gt;\"&gt;\r\n                        <option value=\"\"></option>\r\n                        &lt;?php foreach($all_companies as $company) {?&gt;\r\n                        &lt;?php if($ecompany_id == $company->company_id):?&gt;\r\n                        <option value=\"&lt;?php echo $company->company_id;?&gt;\"> &lt;?php echo $company->name;?&gt;</option>\r\n                        &lt;?php endif;?&gt;\r\n                        &lt;?php } ?&gt;\r\n                      &lt;/select&gt;\r\n                    </div>\r\n                  </div>\r\n                  &lt;?php } ?&gt;\r\n                </div>\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"start_date\">&lt;?php echo $this->lang->line(\'xin_start_date\');?&gt;</label>\r\n                      &lt;input class=\"form-control date\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_start_date\');?&gt;\" readonly name=\"start_date\" type=\"text\"&gt;\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"end_date\">&lt;?php echo $this->lang->line(\'xin_end_date\');?&gt;</label>\r\n                      &lt;input class=\"form-control date\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_end_date\');?&gt;\" readonly name=\"end_date\" type=\"text\"&gt;\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n                <div class=\"row\">\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"budget_hours\">&lt;?php echo $this->lang->line(\'xin_project_budget_hrs\');?&gt;</label>\r\n                      &lt;input class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_project_budget_hrs\');?&gt;\" name=\"budget_hours\" type=\"text\"&gt;\r\n                    </div>\r\n                  </div>\r\n                  <div class=\"col-md-6\">\r\n                    <div class=\"form-group\">\r\n                      <label for=\"employee\">&lt;?php echo $this->lang->line(\'xin_p_priority\');?&gt;</label>\r\n                      &lt;select name=\"priority\" class=\"form-control select-border-color border-warning\" data-plugin=\"select_hrm\" data-placeholder=\"&lt;?php echo $this->lang->line(\'xin_p_priority\');?&gt;\"&gt;\r\n                        <option value=\"1\">&lt;?php echo $this->lang->line(\'xin_highest\');?&gt;</option>\r\n                        <option value=\"2\">&lt;?php echo $this->lang->line(\'xin_high\');?&gt;</option>\r\n                        <option value=\"3\">&lt;?php echo $this->lang->line(\'xin_normal\');?&gt;</option>\r\n                        <option value=\"4\">&lt;?php echo $this->lang->line(\'xin_low\');?&gt;</option>\r\n                      &lt;/select&gt;\r\n                    </div>\r\n                  </div>\r\n                </div>\r\n              </div>\r\n              <div class=\"col-md-6\">\r\n                <div class=\"form-group\">\r\n                  <label for=\"description\">&lt;?php echo $this->lang->line(\'xin_description\');?&gt;</label>\r\n                  &lt;textarea class=\"form-control textarea\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_description\');?&gt;\" name=\"description\" cols=\"30\" rows=\"15\" id=\"description\"&gt;&lt;/textarea&gt;\r\n                </div>\r\n              </div>\r\n            </div>\r\n            <div class=\"row\">\r\n              <div class=\"col-md-6\">\r\n                <div class=\"form-group\" id=\"employee_ajax\">\r\n                  <label for=\"employee\">&lt;?php echo $this->lang->line(\'xin_project_manager\');?&gt;</label>\r\n                  &lt;select multiple name=\"assigned_to[]\" class=\"form-control select-border-color border-warning\" data-plugin=\"select_hrm\" data-placeholder=\"&lt;?php echo $this->lang->line(\'xin_project_manager\');?&gt;\"&gt;\r\n                    <option value=\"\"></option>\r\n                  &lt;/select&gt;\r\n                </div>\r\n              </div>\r\n              <div class=\"col-md-6\">\r\n                <div class=\"form-group\">\r\n                  <label for=\"summary\">&lt;?php echo $this->lang->line(\'xin_summary\');?&gt;</label>\r\n                  &lt;textarea class=\"form-control\" placeholder=\"&lt;?php echo $this->lang->line(\'xin_summary\');?&gt;\" name=\"summary\" cols=\"30\" rows=\"1\" id=\"summary\"&gt;&lt;/textarea&gt;\r\n                </div>\r\n              </div>\r\n            </div>\r\n            <div class=\"form-actions box-footer\">\r\n              &lt;button type=\"submit\" class=\"btn btn-primary\"&gt; <i class=\"fa fa-check-square-o\"></i> &lt;?php echo $this->lang->line(\'xin_save\');?&gt; &lt;/button&gt;\r\n            </div>\r\n          </div>\r\n        </div>\r\n        &lt;?php echo form_close(); ?&gt; </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n&lt;?php } ?&gt;\r\n&lt;?php if($system[0]->show_projects==\'0\'){ ?&gt;\r\n<div class=\"card &lt;?php echo $get_animate;?&gt;\">\r\n  <div class=\"card-header with-elements\"> <span class=\"card-header-title mr-2\"><strong>&lt;?php echo $this->lang->line(\'xin_list_all\');?&gt;</strong> &lt;?php echo $this->lang->line(\'xin_projects\');?&gt;</span> </div>\r\n  <div class=\"card-body\">\r\n    <div class=\"box-datatable table-responsive\">\r\n      <table class=\"datatables-demo table table-striped table-bordered\" id=\"xin_table\">\r\n        <thead>\r\n          <tr>\r\n            <th>&lt;?php echo $this->lang->line(\'xin_action\');?&gt;</th>\r\n            <th>&lt;?php echo $this->lang->line(\'xin_project\');?&gt;#</th>\r\n            <th>&lt;?php echo $this->lang->line(\'xin_phase_no\');?&gt;</th>\r\n            <th width=\"180\">&lt;?php echo $this->lang->line(\'xin_project_summary\');?&gt;</th>\r\n            &lt;?php //if(!in_array(\'386\',$role_resources_ids)) {?&gt;\r\n            <th>&lt;?php echo $this->lang->line(\'xin_p_priority\');?&gt;</th>\r\n            &lt;?php //} ?&gt;\r\n            <th><i class=\"fa fa-user\"></i> &lt;?php echo $this->lang->line(\'xin_project_users\');?&gt;</th>\r\n            <th><i class=\"fa fa-calendar\"></i> &lt;?php echo $this->lang->line(\'xin_e_details_date\');?&gt;</th>\r\n            <th>&lt;?php echo $this->lang->line(\'dashboard_xin_progress\');?&gt;</th>\r\n          </tr>\r\n        </thead>\r\n      </table>\r\n    </div>\r\n  </div>\r\n</div>\r\n&lt;?php } else {?&gt;\r\n&lt;?php if($user_info[0]->user_role_id==1){\r\n    $project = $this->Project_model->get_projects();\r\n} else {\r\n    if(in_array(\'318\',$role_resources_ids)) {\r\n        $project = $this->Project_model->get_company_projects($user_info[0]->company_id);\r\n    } else {\r\n        $project = $this->Project_model->get_employee_projects($session[\'user_id\']);\r\n    }\r\n}', '<p xss=removed><p><span xss=removed>&lt;?php</span></p><p><span xss=removed>/* Projects List view</span></p><p><span xss=removed>*/</span></p><p><span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$session</span> = <span xss=removed>$this</span>-><span xss=removed>session</span>-><span xss=removed>userdata</span>(<span xss=removed>\'username\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$get_animate</span> = <span xss=removed>$this</span>-><span xss=removed>Xin_model</span>-><span xss=removed>get_content_animate</span>();<span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$role_resources_ids</span> = <span xss=removed>$this</span>-><span xss=removed>Xin_model</span>-><span xss=removed>user_role_resource</span>(); <span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$user_info</span> = <span xss=removed>$this</span>-><span xss=removed>Xin_model</span>-><span xss=removed>read_user_info</span>(<span xss=removed>$session</span>[<span xss=removed>\'user_id\'</span>]);<span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$project_no</span> = <span xss=removed>$this</span>-><span xss=removed>Xin_model</span>-><span xss=removed>generate_random_string</span>();<span xss=removed>?</span><span xss=removed>></span></p><p><span xss=removed>&lt;?php</span> <span xss=removed>$system</span> = <span xss=removed>$this</span>-><span xss=removed>Xin_model</span>-><span xss=removed>read_setting_info</span>(<span xss=removed>1</span>); <span xss=removed>?</span><span xss=removed>></span></p><br><p><span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>id</span>=<span xss=removed>\"smartwizard-2\"</span> <span xss=removed>class</span>=<span xss=removed>\"smartwizard-example sw-main sw-theme-default\"</span><span xss=removed>></span></p><p>  <span xss=removed>&lt;</span><span xss=removed>ul</span> <span xss=removed>class</span>=<span xss=removed>\"nav nav-tabs step-anchor\"</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'312\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item done\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_dashboard/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_dashboard/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon ion ion-md-speedometer\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'dashboard_title\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>class</span>=<span xss=removed>\"text-muted small\"</span><span xss=removed>></span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_overview\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>&lt;/</span><span xss=removed>div</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;/</span><span xss=removed>a</span><span xss=removed>></span> <span xss=removed>&lt;/</span><span xss=removed>li</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> } <span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'44\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item active\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon ion ion-logo-buffer\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'left_projects\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>class</span>=<span xss=removed>\"text-muted small\"</span><span xss=removed>></span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_role_add\'</span>);<span xss=removed>?</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'left_projects\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>&lt;/</span><span xss=removed>div</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;/</span><span xss=removed>a</span><span xss=removed>></span> <span xss=removed>&lt;/</span><span xss=removed>li</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> } <span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'119\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item done\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/clients/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/clients/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon fas fa-user-check\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_project_clients\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>class</span>=<span xss=removed>\"text-muted small\"</span><span xss=removed>></span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_role_add\'</span>);<span xss=removed>?</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_project_clients\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>&lt;/</span><span xss=removed>div</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;/</span><span xss=removed>a</span><span xss=removed>></span> <span xss=removed>&lt;/</span><span xss=removed>li</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> } <span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'94\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item done\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/timelogs/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/timelogs/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon fas fa-user-clock\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_project_timelogs\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>class</span>=<span xss=removed>\"text-muted small\"</span><span xss=removed>></span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_role_add\'</span>);<span xss=removed>?</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_project_timelogs\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>&lt;/</span><span xss=removed>div</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;/</span><span xss=removed>a</span><span xss=removed>></span> <span xss=removed>&lt;/</span><span xss=removed>li</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> } <span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'424\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item done\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_calendar/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_calendar/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon fas fa-calendar-alt\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_acc_calendar\'</span>);<span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;</span><span xss=removed>div</span> <span xss=removed>class</span>=<span xss=removed>\"text-muted small\"</span><span xss=removed>></span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_view\'</span>);<span xss=removed>?</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_acc_calendar\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>&lt;/</span><span xss=removed>div</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;/</span><span xss=removed>a</span><span xss=removed>></span> <span xss=removed>&lt;/</span><span xss=removed>li</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> } <span xss=removed>?</span><span xss=removed>></span></p><p>      <span xss=removed>&lt;?php</span> <span xss=removed>if</span>(<span xss=removed>in_array</span>(<span xss=removed>\'425\'</span>,<span xss=removed>$role_resources_ids</span>)) { <span xss=removed>?</span><span xss=removed>></span></p><p>    <span xss=removed>&lt;</span><span xss=removed>li</span> <span xss=removed>class</span>=<span xss=removed>\"nav-item done\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>a</span> <span xss=removed>href</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_scrum_board/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>data-link-data</span>=<span xss=removed>\"</span><span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>site_url</span>(<span xss=removed>\'admin/project/projects_scrum_board/\'</span>);<span xss=removed>?</span><span xss=removed>></span><span xss=removed>\"</span> <span xss=removed>class</span>=<span xss=removed>\"mb-3 nav-link hrsale-link\"</span><span xss=removed>></span> <span xss=removed>&lt;</span><span xss=removed>span</span> <span xss=removed>class</span>=<span xss=removed>\"sw-icon fas fa-clipboard-list\"</span><span xss=removed>>&lt;/</span><span xss=removed>span</span><span xss=removed>></span> <span xss=removed>&lt;?php</span> <span xss=removed>echo</span> <span xss=removed>$this</span>-><span xss=removed>lang</span>-><span xss=removed>line</span>(<span xss=removed>\'xin_projects_scrm_board\'</span>);<span xss=removed>?</span></p></p>', 1, '0', '', 0, 1, '12-11-2020');
INSERT INTO `xin_projects` (`project_id`, `title`, `client_id`, `start_date`, `end_date`, `company_id`, `assigned_to`, `priority`, `project_no`, `phase_no`, `purchase_no`, `budget_hours`, `summary`, `description`, `added_by`, `project_progress`, `project_note`, `status`, `is_notify`, `created_at`) VALUES
(4, 'Narcotics', 1, '2020-11-19', '2021-03-12', '1', '6,12,53', '4', 'VBQT011', '3', '23332', '34', '&lt;?php\r\ndefined(\'BASEPATH\') OR exit(\'No direct script access allowed\');\r\n\r\nclass Project_model extends CI_Model {\r\n \r\n    public function __construct()\r\n    {\r\n        parent::__construct();\r\n        $this->load->database();\r\n    }\r\n \r\n public function get_projects()\r\n {\r\n   return $this->db->get(\"xin_projects\");\r\n }\r\n  \r\n  public function read_project_information($id) {\r\n \r\n  $sql = \'SELECT * FROM xin_projects WHERE project_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  if ($query->num_rows() > 0) {\r\n   return $query->result();\r\n  } else {\r\n   return null;\r\n  }\r\n }\r\n \r\n // get task categories\r\n public function get_task_categories() {\r\n  return $this->db->get(\"xin_task_categories\");\r\n }\r\n public function get_project_timelogs($project_id) {\r\n  $sql = \"SELECT * FROM xin_projects_timelogs where project_id = ?\";\r\n  $binds = array($project_id);\r\n  $query = $this->db->query($sql, $binds);\r\n  return $query;\r\n }\r\n public function get_all_project_timelogs() {\r\n  $sql = \"SELECT * FROM xin_projects_timelogs\";\r\n  $query = $this->db->query($sql);\r\n  return $query;\r\n }\r\n public function get_all_project_employee_timelogs($user_id) {\r\n  $sql = \"SELECT * FROM xin_projects_timelogs where employee_id = ?\";\r\n  $binds = array($user_id);\r\n  $query = $this->db->query($sql, $binds);\r\n  return $query;\r\n }\r\n \r\n public function read_bug_information($id) {\r\n \r\n  $sql = \'SELECT * FROM xin_projects_bugs WHERE bug_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  if ($query->num_rows()> 0) {\r\n   return $query->result();\r\n  } else {\r\n   return null;\r\n  }\r\n }\r\n \r\n \r\n // Function to add record in table\r\n public function add($data){\r\n  $this->db->insert(\'xin_projects\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return $this->db->insert_id();\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n public function add_image($image)\r\n {\r\n  $this->db->insert(\'xin_task_images\', $image);\r\n  return true;\r\n }\r\n // Function to add record in table\r\n public function add_task_categories($data){\r\n  $this->db->insert(\'xin_task_categories\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n // Function to add record in table\r\n public function add_project_timelog($data){\r\n  $this->db->insert(\'xin_projects_timelogs\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n \r\n // Function to Delete selected record from table\r\n public function delete_task_category_record($id){\r\n  $this->db->where(\'task_category_id\', $id);\r\n  $this->db->delete(\'xin_task_categories\');\r\n  \r\n }\r\n \r\n // get task category by id\r\n public function read_task_category_information($id) {\r\n \r\n  $sql = \'SELECT * FROM xin_task_categories WHERE task_category_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  if ($query->num_rows() > 0) {\r\n   return $query->result();\r\n  } else {\r\n   return null;\r\n  }\r\n }\r\n // get timelog record by id\r\n public function read_timelog_info($id) {\r\n \r\n  $sql = \'SELECT * FROM xin_projects_timelogs WHERE timelogs_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  if ($query->num_rows() > 0) {\r\n   return $query->result();\r\n  } else {\r\n   return null;\r\n  }\r\n }\r\n \r\n // Function to update record in table\r\n public function update_task_category_record($data, $id){\r\n  $this->db->where(\'task_category_id\', $id);\r\n  if( $this->db->update(\'xin_task_categories\',$data)) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }  \r\n }\r\n // Function to update record in table\r\n public function update_project_timelog_record($data, $id){\r\n  $this->db->where(\'timelogs_id\', $id);\r\n  if( $this->db->update(\'xin_projects_timelogs\',$data)) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }  \r\n }\r\n // Function to Delete selected record from table\r\n public function delete_record($id){\r\n  $this->db->where(\'project_id\', $id);\r\n  $this->db->delete(\'xin_projects\');\r\n  \r\n }\r\n // Function to Delete selected record from table\r\n public function delete_timelog_record($id){\r\n  $this->db->where(\'timelogs_id\', $id);\r\n  $this->db->delete(\'xin_projects_timelogs\');\r\n  \r\n }\r\n \r\n // Function to Delete selected record from table\r\n public function delete_bug_record($id){\r\n  $this->db->where(\'bug_id\', $id);\r\n  $this->db->delete(\'xin_projects_bugs\');\r\n  \r\n }\r\n \r\n // get attachments > projects\r\n public function get_attachments($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects_attachment WHERE project_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query;\r\n }\r\n \r\n // get clients projects\r\n public function get_client_projects($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE client_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query;\r\n }\r\n \r\n public function get_all_projects()\r\n {\r\n   $query = $this->db->query(\"SELECT * from xin_projects\");\r\n     return $query->result();\r\n }\r\n \r\n // Function to add record in table > add attachment\r\n public function add_new_attachment($data){\r\n  $this->db->insert(\'xin_projects_attachment\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n \r\n // Function to Delete selected record from table\r\n public function delete_attachment_record($id){\r\n  $this->db->where(\'project_attachment_id\', $id);\r\n  $this->db->delete(\'xin_projects_attachment\');\r\n  \r\n }\r\n \r\n // get project discussion\r\n public function get_discussion($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects_discussion WHERE project_id = ? order by discussion_id desc\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query;\r\n }\r\n \r\n // get project bugs/issues\r\n public function get_bug($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects_bugs WHERE project_id = ? order by bug_id desc\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query;\r\n }\r\n \r\n // Function to add record in table > add discussion\r\n public function add_discussion($data){\r\n  $this->db->insert(\'xin_projects_discussion\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n \r\n // Function to add record in table > add bug\r\n public function add_bug($data){\r\n  $this->db->insert(\'xin_projects_bugs\', $data);\r\n  if ($this->db->affected_rows() > 0) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }\r\n }\r\n \r\n // Function to update record in table\r\n public function update_bug($data, $id){\r\n  $this->db->where(\'bug_id\', $id);\r\n  if( $this->db->update(\'xin_projects_bugs\',$data)) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }  \r\n }\r\n \r\n // Function to update record in table\r\n public function update_record($data, $id){\r\n  $this->db->where(\'project_id\', $id);\r\n  if( $this->db->update(\'xin_projects\',$data)) {\r\n   return true;\r\n  } else {\r\n   return false;\r\n  }  \r\n }\r\n \r\n // get single record > company | projects\r\n  public function ajax_company_projects($id) {\r\n \r\n  $sql = \'SELECT * FROM xin_projects WHERE company_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  if ($query->num_rows() > 0) {\r\n   return $query->result();\r\n  } else {\r\n   return null;\r\n  }\r\n }\r\n \r\n // get total project tasks \r\n public function total_project_tasks($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_tasks WHERE project_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n \r\n // get total project bugs \r\n public function total_project_bugs($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects_bugs WHERE project_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n \r\n // get total project files \r\n public function total_project_files($id) {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects_attachment WHERE project_id = ?\';\r\n  $binds = array($id);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n \r\n // get total project > deffered\r\n public function cancelled_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(3);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n // get calendar project > deffered\r\n public function calendar_cancelled_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(3);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get calendar tasks > deffered\r\n public function calendar_cancelled_tasks() {\r\n  \r\n  $sql = \'SELECT * FROM xin_tasks WHERE task_status = ?\';\r\n  $binds = array(3);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n \r\n // get total project > completed\r\n public function complete_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(2);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n \r\n // get calendar project > completed\r\n public function calendar_complete_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(2);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get calendar tasks > completed\r\n public function calendar_complete_tasks() {\r\n  \r\n  $sql = \'SELECT * FROM xin_tasks WHERE task_status = ?\';\r\n  $binds = array(2);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n \r\n // get total project > in progress\r\n public function inprogress_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(1);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n \r\n // get calendar project > in progress\r\n public function calendar_inprogress_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(1);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get calendar tasks > in progress\r\n public function calendar_inprogress_tasks() {\r\n  \r\n  $sql = \'SELECT * FROM xin_tasks WHERE task_status = ?\';\r\n  $binds = array(1);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n \r\n // get total project > not started\r\n public function not_started_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(0);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n // get calendar project > not started\r\n public function calendar_not_started_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(0);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get calendar tasks > not started\r\n public function calendar_not_started_tasks() {\r\n  \r\n  $sql = \'SELECT * FROM xin_tasks WHERE task_status = ?\';\r\n  $binds = array(0);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get total project > hold\r\n public function hold_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(4);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->num_rows();\r\n }\r\n // get calendar project > hold\r\n public function calendar_hold_projects() {\r\n  \r\n  $sql = \'SELECT * FROM xin_projects WHERE status = ?\';\r\n  $binds = array(4);\r\n  $query = $this->db->query($sql, $binds);\r\n  \r\n  return $query->result();\r\n }\r\n // get calendar tasks > hold\r\n public function calendar_hold_tasks() {\r\n', 'jbjjh', 1, '0', '', 0, 1, '12-11-2020');

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_attachment`
--

CREATE TABLE `xin_projects_attachment` (
  `project_attachment_id` int(11) NOT NULL,
  `project_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_bugs`
--

CREATE TABLE `xin_projects_bugs` (
  `bug_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_discussion`
--

CREATE TABLE `xin_projects_discussion` (
  `discussion_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `client_id` int(11) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_projects_timelogs`
--

CREATE TABLE `xin_projects_timelogs` (
  `timelogs_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_project_variations`
--

CREATE TABLE `xin_project_variations` (
  `variation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `created_by` int(111) NOT NULL,
  `variation_name` varchar(255) NOT NULL,
  `variation_no` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `variation_hours` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `variation_status` int(5) NOT NULL,
  `client_approval` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_education_level`
--

CREATE TABLE `xin_qualification_education_level` (
  `education_level_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_education_level`
--

INSERT INTO `xin_qualification_education_level` (`education_level_id`, `company_id`, `name`, `created_at`) VALUES
(0, 1, '', '2020-11-13 11:10:57'),
(1, 1, 'High School Diploma / GED', '09-05-2018 03:11:59'),
(2, 1, 'BSSE', '2020-10-22 12:50:39'),
(3, 1, 'd', '2020-10-28 13:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_language`
--

CREATE TABLE `xin_qualification_language` (
  `language_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_language`
--

INSERT INTO `xin_qualification_language` (`language_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'English', '09-05-2018 03:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `xin_qualification_skill`
--

CREATE TABLE `xin_qualification_skill` (
  `skill_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_qualification_skill`
--

INSERT INTO `xin_qualification_skill` (`skill_id`, `company_id`, `name`, `created_at`) VALUES
(1, 1, 'jQuery', '09-05-2018 03:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `xin_questions`
--

CREATE TABLE `xin_questions` (
  `question_id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `answers` varchar(200) NOT NULL,
  `options` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_questions`
--

INSERT INTO `xin_questions` (`question_id`, `question`, `answers`, `options`, `created_at`) VALUES
(2, 'question1', 'ruby', 'ruby,ayesha,fairy', '2020-11-03 15:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects`
--

CREATE TABLE `xin_quoted_projects` (
  `project_id` int(111) NOT NULL,
  `title` varchar(255) NOT NULL,
  `client_id` int(100) NOT NULL,
  `estimate_date` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `assigned_to` mediumtext NOT NULL,
  `priority` varchar(255) NOT NULL,
  `project_no` varchar(255) DEFAULT NULL,
  `phase_no` varchar(200) DEFAULT NULL,
  `estimate_hrs` varchar(255) DEFAULT NULL,
  `summary` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `added_by` int(111) NOT NULL,
  `project_progress` varchar(255) NOT NULL,
  `project_note` longtext NOT NULL,
  `status` tinyint(2) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_attachment`
--

CREATE TABLE `xin_quoted_projects_attachment` (
  `project_attachment_id` int(11) NOT NULL,
  `project_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_discussion`
--

CREATE TABLE `xin_quoted_projects_discussion` (
  `discussion_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `user_id` int(200) NOT NULL,
  `client_id` int(11) NOT NULL,
  `attachment_file` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_quoted_projects_timelogs`
--

CREATE TABLE `xin_quoted_projects_timelogs` (
  `timelogs_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `total_hours` varchar(255) NOT NULL,
  `timelogs_memo` text NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_recruitment_pages`
--

CREATE TABLE `xin_recruitment_pages` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_details` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_recruitment_pages`
--

INSERT INTO `xin_recruitment_pages` (`page_id`, `page_title`, `page_details`, `status`, `created_at`) VALUES
(1, 'Pages', 'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(2, 'About Us', 'Nulla dignissim gravida\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \n\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(3, 'Career Services', 'Career Services', 1, ''),
(4, 'Success Stories', 'Success Stories', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_recruitment_subpages`
--

CREATE TABLE `xin_recruitment_subpages` (
  `subpages_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `sub_page_title` varchar(255) NOT NULL,
  `sub_page_details` mediumtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_recruitment_subpages`
--

INSERT INTO `xin_recruitment_subpages` (`subpages_id`, `page_id`, `sub_page_title`, `sub_page_details`, `status`, `created_at`) VALUES
(1, 1, 'Sub Menu 1', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(2, 1, 'Sub Menu 2', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(3, 1, 'Sub Menu 3', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(4, 1, 'Sub Menu 4', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(5, 1, 'Sub Menu 5', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, ''),
(6, 1, 'Sub Menu 6', 'Nulla dignissim gravida\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ultricies dictum ex, nec ullamcorper orci luctus eget. Integer mauris arcu, pretium eget elit vel, posuere consectetur massa. Etiam non fermentum augue, vel posuere sapien. \r\n\r\nVivamus aliquet eros bibendum ipsum euismod, non interdum dui elementum. Morbi facilisis hendrerit nisi, a volutpat velit. Donec sed malesuada felis. Nulla facilisi. Vivamus a velit vel orci euismod maximus. Praesent ut blandit orci, eget suscipit lorem. Aenean dignissim, augue at porta suscipit, est enim euismod mi, a rhoncus mi lacus ac nibh. Ut pharetra ligula sed tortor congue, pellentesque ultricies augue tincidunt.', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_allowances`
--

CREATE TABLE `xin_salary_allowances` (
  `allowance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_allowance_taxable` int(11) NOT NULL,
  `allowance_title` varchar(200) DEFAULT NULL,
  `allowance_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_allowances`
--

INSERT INTO `xin_salary_allowances` (`allowance_id`, `employee_id`, `is_allowance_taxable`, `allowance_title`, `allowance_amount`, `created_at`) VALUES
(1, 1, 0, 'Cost of Living Allowance', '100', NULL),
(2, 1, 0, 'Housing Allowance', '200', NULL),
(3, 1, 0, 'Market Adjustment', '200', NULL),
(4, 1, 0, 'Meal Allowance', '100', NULL),
(5, 1, 0, 'Transportation Allowance', '200', NULL),
(6, 6, 0, 'Mobile Allowance', '2300', NULL),
(7, 6, 0, 'Fuel Allowance', '1200', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_bank_allocation`
--

CREATE TABLE `xin_salary_bank_allocation` (
  `bank_allocation_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `pay_percent` varchar(200) NOT NULL,
  `acc_number` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_commissions`
--

CREATE TABLE `xin_salary_commissions` (
  `salary_commissions_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `commission_title` varchar(200) DEFAULT NULL,
  `commission_amount` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_commissions`
--

INSERT INTO `xin_salary_commissions` (`salary_commissions_id`, `employee_id`, `commission_title`, `commission_amount`, `created_at`) VALUES
(1, 6, 'Work', '1500', '0000-00-00 00:00:00'),
(2, 6, 'Work', '1200', '2020-11-10 17:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_loan_deductions`
--

CREATE TABLE `xin_salary_loan_deductions` (
  `loan_deduction_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_options` int(11) NOT NULL,
  `loan_deduction_title` varchar(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `monthly_installment` varchar(200) NOT NULL,
  `loan_time` varchar(200) NOT NULL,
  `loan_deduction_amount` varchar(200) NOT NULL,
  `total_paid` varchar(200) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL,
  `is_deducted_from_salary` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_loan_deductions`
--

INSERT INTO `xin_salary_loan_deductions` (`loan_deduction_id`, `employee_id`, `loan_options`, `loan_deduction_title`, `start_date`, `end_date`, `monthly_installment`, `loan_time`, `loan_deduction_amount`, `total_paid`, `reason`, `status`, `is_deducted_from_salary`, `created_at`) VALUES
(1, 12, 2, 'Home Rent', '2020-10-29', '2020-10-31', '12000', '0', '12000', '', 'kbgbiu', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_other_payments`
--

CREATE TABLE `xin_salary_other_payments` (
  `other_payments_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payments_title` varchar(200) DEFAULT NULL,
  `payments_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_overtime`
--

CREATE TABLE `xin_salary_overtime` (
  `salary_overtime_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_type` varchar(200) NOT NULL,
  `no_of_days` varchar(100) NOT NULL DEFAULT '0',
  `overtime_hours` varchar(100) NOT NULL DEFAULT '0',
  `overtime_rate` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslips`
--

CREATE TABLE `xin_salary_payslips` (
  `payslip_id` int(11) NOT NULL,
  `payslip_key` varchar(200) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `wages_type` int(11) NOT NULL,
  `payslip_type` varchar(50) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `daily_wages` varchar(200) NOT NULL,
  `is_half_monthly_payroll` tinyint(1) NOT NULL,
  `hours_worked` varchar(50) NOT NULL DEFAULT '0',
  `total_allowances` varchar(200) NOT NULL,
  `total_commissions` varchar(200) NOT NULL,
  `total_statutory_deductions` varchar(200) NOT NULL,
  `total_other_payments` varchar(200) NOT NULL,
  `total_loan` varchar(200) NOT NULL,
  `total_overtime` varchar(200) NOT NULL,
  `saudi_gosi_percent` varchar(200) NOT NULL,
  `saudi_gosi_amount` varchar(200) NOT NULL,
  `statutory_deductions` varchar(200) NOT NULL,
  `net_salary` varchar(200) NOT NULL,
  `grand_net_salary` varchar(200) NOT NULL,
  `other_payment` varchar(200) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `pay_comments` mediumtext NOT NULL,
  `is_payment` int(11) NOT NULL,
  `year_to_date` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_payslips`
--

INSERT INTO `xin_salary_payslips` (`payslip_id`, `payslip_key`, `employee_id`, `department_id`, `company_id`, `location_id`, `designation_id`, `salary_month`, `wages_type`, `payslip_type`, `basic_salary`, `daily_wages`, `is_half_monthly_payroll`, `hours_worked`, `total_allowances`, `total_commissions`, `total_statutory_deductions`, `total_other_payments`, `total_loan`, `total_overtime`, `saudi_gosi_percent`, `saudi_gosi_amount`, `statutory_deductions`, `net_salary`, `grand_net_salary`, `other_payment`, `payment_method`, `pay_comments`, `is_payment`, `year_to_date`, `status`, `created_at`) VALUES
(1, 'VDMJqQZFdWYeGx8RfabAmc34tUE0KopIS5Tl2Bzg', 96, 1, 0, 0, 1, '2020-10', 1, 'full_monthly', '200000', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '200000.00', '', '', 0, '', 1, '27-10-2020', 0, '27-10-2020 10:57:56'),
(2, 'NYyw75trcfBOWxslS8hu6nAivJqMzg0Q3Kke1XV2', 6, 1, 1, 1, 9, '2020-10', 1, 'full_monthly', '120000', '', 0, '0', '3500', '0', '0', '0', '12000', '0', '0', '0', '', '123500.00', '', '', 0, '', 1, '01-10-2020', 0, '29-10-2020 10:20:29'),
(3, '4ipSI13xrBsqnFfhWE5TwyoNHcOGtl8XzuCvkQJ7', 25, 1, 1, 0, 1, '2020-10', 1, 'full_monthly', '010000', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '10000.00', '', '', 0, '', 1, '29-10-2020', 1, '29-10-2020 11:12:44'),
(5, 'PRN7go9mTJ8bk4sVQWXvhrHG1nOufM6iqzUed53t', 5, 2, 1, 0, 10, '2020-11', 1, 'full_monthly', '123000', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '10000.00', '', '', 0, '', 1, '01-11-2020', 0, '06-11-2020 09:20:42'),
(6, 'qVuEaJbDwt1ed7MHmh38UQgNkf2XiWnjo5FyGsL4', 9795, 1, 1, 1, 11, '2020-11', 0, 'full_monthly', '0', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0.00', '', '', 0, '', 1, '09-11-2020', 0, '09-11-2020 04:55:08'),
(7, '6ezJyRpdWSMDGorivNqu28FUBQPgTXI1Ln4Aw0HZ', 25, 1, 1, 0, 1, '2020-11', 1, 'full_monthly', '010000', '', 0, '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '10000.00', '', '', 0, '', 1, '10-11-2020', 0, '10-11-2020 05:17:45'),
(13, 'Z9SWeMPhw4ax7JD3r6N5XzcCbTlYmfHGL20OpRgi', 6, 1, 1, 1, 9, '2020-11', 1, 'full_monthly', '123000', '', 0, '0', '3500', '2700', '33019', '0', '0', '0', '0', '0', '', '96181.00', '', '', 0, '', 1, '11-11-2020', 0, '11-11-2020 05:48:23'),
(14, 'P92MJFTcvzySBLINX7VkC58OtZ4larhdDs1nYj6Q', 33, 1, 1, 0, 1, '2020-10', 1, 'full_monthly', '2300', '', 0, '0', '0', '0', '1212', '0', '0', '0', '0', '0', '', '1088.00', '', '', 0, '', 1, '12-11-2020', 0, '12-11-2020 03:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_allowances`
--

CREATE TABLE `xin_salary_payslip_allowances` (
  `payslip_allowances_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `allowance_title` varchar(200) NOT NULL,
  `allowance_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_commissions`
--

CREATE TABLE `xin_salary_payslip_commissions` (
  `payslip_commissions_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `commission_title` varchar(200) NOT NULL,
  `commission_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_loan`
--

CREATE TABLE `xin_salary_payslip_loan` (
  `payslip_loan_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `loan_title` varchar(200) NOT NULL,
  `loan_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_other_payments`
--

CREATE TABLE `xin_salary_payslip_other_payments` (
  `payslip_other_payment_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `payments_title` varchar(200) NOT NULL,
  `payments_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_overtime`
--

CREATE TABLE `xin_salary_payslip_overtime` (
  `payslip_overtime_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `overtime_title` varchar(200) NOT NULL,
  `overtime_salary_month` varchar(200) NOT NULL,
  `overtime_no_of_days` varchar(200) NOT NULL,
  `overtime_hours` varchar(200) NOT NULL,
  `overtime_rate` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_payslip_statutory_deductions`
--

CREATE TABLE `xin_salary_payslip_statutory_deductions` (
  `payslip_deduction_id` int(11) NOT NULL,
  `payslip_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `deduction_title` varchar(200) NOT NULL,
  `deduction_amount` varchar(200) NOT NULL,
  `salary_month` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_statutory_deductions`
--

CREATE TABLE `xin_salary_statutory_deductions` (
  `statutory_deductions_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `statutory_options` int(11) NOT NULL,
  `deduction_title` varchar(200) DEFAULT NULL,
  `deduction_amount` varchar(200) DEFAULT NULL,
  `created_at` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_salary_templates`
--

CREATE TABLE `xin_salary_templates` (
  `salary_template_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `salary_grades` varchar(255) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `overtime_rate` varchar(255) NOT NULL,
  `house_rent_allowance` varchar(255) NOT NULL,
  `medical_allowance` varchar(255) NOT NULL,
  `travelling_allowance` varchar(255) NOT NULL,
  `dearness_allowance` varchar(255) NOT NULL,
  `security_deposit` varchar(255) NOT NULL,
  `provident_fund` varchar(255) NOT NULL,
  `tax_deduction` varchar(255) NOT NULL,
  `gross_salary` varchar(255) NOT NULL,
  `total_allowance` varchar(255) NOT NULL,
  `total_deduction` varchar(255) NOT NULL,
  `net_salary` varchar(255) NOT NULL,
  `added_by` int(111) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_salary_templates`
--

INSERT INTO `xin_salary_templates` (`salary_template_id`, `company_id`, `salary_grades`, `basic_salary`, `overtime_rate`, `house_rent_allowance`, `medical_allowance`, `travelling_allowance`, `dearness_allowance`, `security_deposit`, `provident_fund`, `tax_deduction`, `gross_salary`, `total_allowance`, `total_deduction`, `net_salary`, `added_by`, `created_at`) VALUES
(1, 1, 'Monthly', '50', '', '20', '10', '5', '15', '40', '8.33', '30', '2760', '260', '90', '2670', 1, '22-03-2018 01:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `xin_security_level`
--

CREATE TABLE `xin_security_level` (
  `type_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_sub_departments`
--

CREATE TABLE `xin_sub_departments` (
  `sub_department_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_sub_departments`
--

INSERT INTO `xin_sub_departments` (`sub_department_id`, `department_id`, `department_name`, `created_at`) VALUES
(8, 1, 'Manager', '2019-02-15 00:22:13'),
(9, 1, 'Lead Manager', '2019-02-15 00:22:21'),
(10, 2, 'Accountant', '2019-02-15 00:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_tickets`
--

CREATE TABLE `xin_support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ticket_code` varchar(200) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `ticket_priority` varchar(255) NOT NULL,
  `department_id` int(111) NOT NULL,
  `assigned_to` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `ticket_remarks` mediumtext NOT NULL,
  `ticket_status` varchar(200) NOT NULL,
  `ticket_note` mediumtext NOT NULL,
  `is_notify` int(11) NOT NULL,
  `ticket_image` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_tickets_employees`
--

CREATE TABLE `xin_support_tickets_employees` (
  `tickets_employees_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xin_support_ticket_files`
--

CREATE TABLE `xin_support_ticket_files` (
  `ticket_file_id` int(111) NOT NULL,
  `ticket_id` int(111) NOT NULL,
  `employee_id` int(111) NOT NULL,
  `ticket_files` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_system_setting`
--

CREATE TABLE `xin_system_setting` (
  `setting_id` int(111) NOT NULL,
  `application_name` varchar(255) NOT NULL,
  `default_currency` varchar(255) NOT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_symbol` varchar(255) NOT NULL,
  `show_currency` varchar(255) NOT NULL,
  `currency_position` varchar(255) NOT NULL,
  `notification_position` varchar(255) NOT NULL,
  `notification_close_btn` varchar(255) NOT NULL,
  `notification_bar` varchar(255) NOT NULL,
  `enable_registration` varchar(255) NOT NULL,
  `login_with` varchar(255) NOT NULL,
  `date_format_xi` varchar(255) NOT NULL,
  `employee_manage_own_contact` varchar(255) NOT NULL,
  `employee_manage_own_profile` varchar(255) NOT NULL,
  `employee_manage_own_qualification` varchar(255) NOT NULL,
  `employee_manage_own_work_experience` varchar(255) NOT NULL,
  `employee_manage_own_document` varchar(255) NOT NULL,
  `employee_manage_own_picture` varchar(255) NOT NULL,
  `employee_manage_own_social` varchar(255) NOT NULL,
  `employee_manage_own_bank_account` varchar(255) NOT NULL,
  `enable_attendance` varchar(255) NOT NULL,
  `enable_clock_in_btn` varchar(255) NOT NULL,
  `enable_email_notification` varchar(255) NOT NULL,
  `payroll_include_day_summary` varchar(255) NOT NULL,
  `payroll_include_hour_summary` varchar(255) NOT NULL,
  `payroll_include_leave_summary` varchar(255) NOT NULL,
  `enable_job_application_candidates` varchar(255) NOT NULL,
  `job_logo` varchar(255) NOT NULL,
  `payroll_logo` varchar(255) NOT NULL,
  `is_payslip_password_generate` int(11) NOT NULL,
  `payslip_password_format` varchar(255) NOT NULL,
  `enable_profile_background` varchar(255) NOT NULL,
  `enable_policy_link` varchar(255) NOT NULL,
  `enable_layout` varchar(255) NOT NULL,
  `job_application_format` mediumtext NOT NULL,
  `technical_competencies` text DEFAULT NULL,
  `organizational_competencies` text DEFAULT NULL,
  `performance_option` varchar(255) DEFAULT NULL,
  `project_email` varchar(255) NOT NULL,
  `holiday_email` varchar(255) NOT NULL,
  `leave_email` varchar(255) NOT NULL,
  `payslip_email` varchar(255) NOT NULL,
  `award_email` varchar(255) NOT NULL,
  `recruitment_email` varchar(255) NOT NULL,
  `announcement_email` varchar(255) NOT NULL,
  `training_email` varchar(255) NOT NULL,
  `task_email` varchar(255) NOT NULL,
  `compact_sidebar` varchar(255) NOT NULL,
  `fixed_header` varchar(255) NOT NULL,
  `fixed_sidebar` varchar(255) NOT NULL,
  `boxed_wrapper` varchar(255) NOT NULL,
  `layout_static` varchar(255) NOT NULL,
  `system_skin` varchar(255) NOT NULL,
  `animation_effect` varchar(255) NOT NULL,
  `animation_effect_modal` varchar(255) NOT NULL,
  `animation_effect_topmenu` varchar(255) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `is_ssl_available` varchar(50) NOT NULL,
  `is_active_sub_departments` varchar(10) NOT NULL,
  `default_language` varchar(200) NOT NULL,
  `statutory_fixed` varchar(100) NOT NULL,
  `system_timezone` varchar(200) NOT NULL,
  `system_ip_address` varchar(255) NOT NULL,
  `system_ip_restriction` varchar(200) NOT NULL,
  `google_maps_api_key` mediumtext NOT NULL,
  `module_recruitment` varchar(100) NOT NULL,
  `module_travel` varchar(100) NOT NULL,
  `module_performance` varchar(100) NOT NULL,
  `module_payroll` varchar(10) NOT NULL,
  `module_files` varchar(100) NOT NULL,
  `module_awards` varchar(100) NOT NULL,
  `module_training` varchar(100) NOT NULL,
  `module_inquiry` varchar(100) NOT NULL,
  `module_language` varchar(100) NOT NULL,
  `module_orgchart` varchar(100) NOT NULL,
  `module_accounting` varchar(111) NOT NULL,
  `module_events` varchar(100) NOT NULL,
  `module_goal_tracking` varchar(100) NOT NULL,
  `module_assets` varchar(100) NOT NULL,
  `module_projects_tasks` varchar(100) NOT NULL,
  `module_chat_box` varchar(100) NOT NULL,
  `enable_page_rendered` varchar(255) NOT NULL,
  `enable_current_year` varchar(255) NOT NULL,
  `employee_login_id` varchar(200) NOT NULL,
  `paypal_email` varchar(100) NOT NULL,
  `paypal_sandbox` varchar(10) NOT NULL,
  `paypal_active` varchar(10) NOT NULL,
  `stripe_secret_key` varchar(200) NOT NULL,
  `stripe_publishable_key` varchar(200) NOT NULL,
  `stripe_active` varchar(10) NOT NULL,
  `online_payment_account` int(11) NOT NULL,
  `is_half_monthly` tinyint(1) NOT NULL,
  `half_deduct_month` tinyint(1) NOT NULL,
  `invoice_terms_condition` text DEFAULT NULL,
  `estimate_terms_condition` text DEFAULT NULL,
  `show_projects` int(11) NOT NULL DEFAULT 0,
  `show_tasks` int(11) NOT NULL DEFAULT 0,
  `enable_saudi_gosi` int(11) NOT NULL DEFAULT 0,
  `staff_dashboard` int(11) DEFAULT NULL,
  `project_dashboard` int(11) DEFAULT NULL,
  `enable_auth_background` varchar(11) NOT NULL,
  `hr_version` varchar(200) NOT NULL,
  `hr_release_date` varchar(100) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_system_setting`
--

INSERT INTO `xin_system_setting` (`setting_id`, `application_name`, `default_currency`, `default_currency_id`, `default_currency_symbol`, `show_currency`, `currency_position`, `notification_position`, `notification_close_btn`, `notification_bar`, `enable_registration`, `login_with`, `date_format_xi`, `employee_manage_own_contact`, `employee_manage_own_profile`, `employee_manage_own_qualification`, `employee_manage_own_work_experience`, `employee_manage_own_document`, `employee_manage_own_picture`, `employee_manage_own_social`, `employee_manage_own_bank_account`, `enable_attendance`, `enable_clock_in_btn`, `enable_email_notification`, `payroll_include_day_summary`, `payroll_include_hour_summary`, `payroll_include_leave_summary`, `enable_job_application_candidates`, `job_logo`, `payroll_logo`, `is_payslip_password_generate`, `payslip_password_format`, `enable_profile_background`, `enable_policy_link`, `enable_layout`, `job_application_format`, `technical_competencies`, `organizational_competencies`, `performance_option`, `project_email`, `holiday_email`, `leave_email`, `payslip_email`, `award_email`, `recruitment_email`, `announcement_email`, `training_email`, `task_email`, `compact_sidebar`, `fixed_header`, `fixed_sidebar`, `boxed_wrapper`, `layout_static`, `system_skin`, `animation_effect`, `animation_effect_modal`, `animation_effect_topmenu`, `footer_text`, `is_ssl_available`, `is_active_sub_departments`, `default_language`, `statutory_fixed`, `system_timezone`, `system_ip_address`, `system_ip_restriction`, `google_maps_api_key`, `module_recruitment`, `module_travel`, `module_performance`, `module_payroll`, `module_files`, `module_awards`, `module_training`, `module_inquiry`, `module_language`, `module_orgchart`, `module_accounting`, `module_events`, `module_goal_tracking`, `module_assets`, `module_projects_tasks`, `module_chat_box`, `enable_page_rendered`, `enable_current_year`, `employee_login_id`, `paypal_email`, `paypal_sandbox`, `paypal_active`, `stripe_secret_key`, `stripe_publishable_key`, `stripe_active`, `online_payment_account`, `is_half_monthly`, `half_deduct_month`, `invoice_terms_condition`, `estimate_terms_condition`, `show_projects`, `show_tasks`, `enable_saudi_gosi`, `staff_dashboard`, `project_dashboard`, `enable_auth_background`, `hr_version`, `hr_release_date`, `updated_at`) VALUES
(1, 'MonetDT', 'PKR - Rs.', 1, 'PKR - Rs.', 'symbol', 'Prefix', 'toast-top-center', 'true', 'true', 'no', 'username', 'M-d-Y', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', '', 'yes', 'yes', 'yes', 'yes', '1', 'job_logo_1605169089.png', 'payroll_logo_1605169096.png', 0, 'employee_id', 'yes', 'yes', 'yes', 'doc,docx,pdf', 'Customer Experience,Marketing,Administration', 'Professionalism,Integrity,Attendance', 'both', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', 'sidebar_layout_hrsale', '', 'fixed-sidebar', 'boxed_layout_hrsale', '', 'skin-default', 'fadeInDown', 'tada', 'tada', 'MonetDT', '', '', 'english', '', 'Asia/Karachi', '::1', '', 'AIzaSyB3gP8H3eypotNeoEtezbRiF_f8Zh_p4ck', 'true', 'true', 'yes', 'yes', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', '', 'yes', 'username', 'hrsalesoft-facilitator@gmail.com', 'yes', 'yes', 'sk_test_2XEyr1hQFGByITfQjSwFqNtm', 'pk_test_zVFISCqeQPnniD0ywHBHikMd', 'yes', 1, 0, 1, '', '', 0, 0, 0, NULL, NULL, 'yes', '1.0.3', '2018-03-28', '2018-03-28 04:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks`
--

CREATE TABLE `xin_tasks` (
  `task_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(111) NOT NULL,
  `created_by` int(111) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `end_date` varchar(200) NOT NULL,
  `task_hour` varchar(200) NOT NULL,
  `task_progress` varchar(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `task_status` int(5) NOT NULL,
  `task_note` mediumtext NOT NULL,
  `is_notify` int(11) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_tasks`
--

INSERT INTO `xin_tasks` (`task_id`, `company_id`, `project_id`, `created_by`, `task_name`, `assigned_to`, `start_date`, `end_date`, `task_hour`, `task_progress`, `description`, `task_status`, `task_note`, `is_notify`, `created_at`) VALUES
(1, 1, 2, 1, 'efw', '6,12', '2020-10-31', '2020-11-06', '23', '0', 'csf', 0, '', 1, '2020-10-29 02:51:03'),
(2, 1, 1, 1, 'cvfvr', '6', '2020-11-04', '2020-11-19', '23', '0', 'qweweeer', 0, '', 1, '2020-10-29 02:52:59'),
(3, 1, 2, 1, 'xyzz', '5', '2020-10-30', '2020-10-31', '24', '0', 'xyzz', 0, '', 1, '2020-10-29 02:53:14'),
(4, 1, 2, 1, 'wer', '6', '2020-11-19', '2020-11-26', '3', '0', 'we', 0, '', 1, '2020-11-02 03:08:56'),
(5, 1, 2, 1, 'event', '6', '2020-11-11', '2020-11-13', '3', '0', '4rr', 0, '', 1, '2020-11-03 02:04:25'),
(6, 1, 1, 1, 'task', '6', '2020-11-04', '2020-11-12', '34', '0', 'dede', 0, '', 1, '2020-11-03 02:14:43'),
(7, 1, 1, 1, 'aaaaaaaaaaaaa', '6', '2020-11-04', '2020-11-07', '250', '0', 'cccccccccccccc', 0, '', 1, '2020-11-04 09:12:21'),
(8, 1, 2, 1, 'xxx', '6', '2020-11-05', '2020-11-20', '9', '0', 'xxx', 0, '', 1, '2020-11-04 01:54:59'),
(9, 1, 1, 1, 'xxxxxxx', '6', '2020-11-04', '2020-11-06', '48', '0', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 0, '', 1, '2020-11-04 03:31:54'),
(10, 1, 1, 1, 'xxxxxxx', '9792', '2020-11-06', '2020-11-09', '84', '0', '', 0, '', 1, '2020-11-06 04:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks_attachment`
--

CREATE TABLE `xin_tasks_attachment` (
  `task_attachment_id` int(11) NOT NULL,
  `task_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_tasks_comments`
--

CREATE TABLE `xin_tasks_comments` (
  `comment_id` int(11) NOT NULL,
  `task_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `task_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_task_categories`
--

CREATE TABLE `xin_task_categories` (
  `task_category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xin_task_categories`
--

INSERT INTO `xin_task_categories` (`task_category_id`, `category_name`, `created_at`) VALUES
(5, 'Modelling', '17-12-2019 10:44:48'),
(6, 'Fabrication drawings', '17-12-2019 10:44:55'),
(7, 'Erection drawings', '17-12-2019 10:45:01'),
(8, 'As built drawings', '17-12-2019 10:45:06'),
(9, 'R & D and RFI Related', '17-12-2019 10:45:12'),
(10, 'Checking', '17-12-2019 10:45:22');

-- --------------------------------------------------------

--
-- Table structure for table `xin_task_images`
--

CREATE TABLE `xin_task_images` (
  `image_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `xin_task_images`
--

INSERT INTO `xin_task_images` (`image_id`, `task_id`, `image`, `created_at`) VALUES
(1, 2, 'php.png', '2020-11-03 15:59:21'),
(2, 4, 'logo_1603284295.jpg', '2020-11-12 16:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tax_types`
--

CREATE TABLE `xin_tax_types` (
  `tax_id` int(111) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_tax_types`
--

INSERT INTO `xin_tax_types` (`tax_id`, `name`, `rate`, `type`, `description`, `created_at`) VALUES
(1, 'No Tax', '0', 'fixed', 'test', '25-05-2018'),
(2, 'IVU', '2', 'fixed', 'test', '25-05-2018'),
(3, 'VAT', '5', 'percentage', 'testttt', '25-05-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_termination_type`
--

CREATE TABLE `xin_termination_type` (
  `termination_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_termination_type`
--

INSERT INTO `xin_termination_type` (`termination_type_id`, `company_id`, `type`, `created_at`) VALUES
(1, 1, 'Voluntary Termination', '22-03-2018 01:38:41');

-- --------------------------------------------------------

--
-- Table structure for table `xin_theme_settings`
--

CREATE TABLE `xin_theme_settings` (
  `theme_settings_id` int(11) NOT NULL,
  `fixed_layout` varchar(200) NOT NULL,
  `fixed_footer` varchar(200) NOT NULL,
  `boxed_layout` varchar(200) NOT NULL,
  `page_header` varchar(200) NOT NULL,
  `footer_layout` varchar(200) NOT NULL,
  `statistics_cards` varchar(200) NOT NULL,
  `animation_style` varchar(100) NOT NULL,
  `theme_option` varchar(100) NOT NULL,
  `dashboard_option` varchar(100) NOT NULL,
  `dashboard_calendar` varchar(100) NOT NULL,
  `login_page_options` varchar(100) NOT NULL,
  `sub_menu_icons` varchar(100) NOT NULL,
  `statistics_cards_background` varchar(200) NOT NULL,
  `employee_cards` varchar(200) NOT NULL,
  `card_border_color` varchar(200) NOT NULL,
  `compact_menu` varchar(200) NOT NULL,
  `flipped_menu` varchar(200) NOT NULL,
  `right_side_icons` varchar(200) NOT NULL,
  `bordered_menu` varchar(200) NOT NULL,
  `form_design` varchar(200) NOT NULL,
  `is_semi_dark` int(11) NOT NULL,
  `semi_dark_color` varchar(200) NOT NULL,
  `top_nav_dark_color` varchar(200) NOT NULL,
  `menu_color_option` varchar(200) NOT NULL,
  `export_orgchart` varchar(100) NOT NULL,
  `export_file_title` mediumtext NOT NULL,
  `org_chart_layout` varchar(200) NOT NULL,
  `org_chart_zoom` varchar(100) NOT NULL,
  `org_chart_pan` varchar(100) NOT NULL,
  `login_page_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_theme_settings`
--

INSERT INTO `xin_theme_settings` (`theme_settings_id`, `fixed_layout`, `fixed_footer`, `boxed_layout`, `page_header`, `footer_layout`, `statistics_cards`, `animation_style`, `theme_option`, `dashboard_option`, `dashboard_calendar`, `login_page_options`, `sub_menu_icons`, `statistics_cards_background`, `employee_cards`, `card_border_color`, `compact_menu`, `flipped_menu`, `right_side_icons`, `bordered_menu`, `form_design`, `is_semi_dark`, `semi_dark_color`, `top_nav_dark_color`, `menu_color_option`, `export_orgchart`, `export_file_title`, `org_chart_layout`, `org_chart_zoom`, `org_chart_pan`, `login_page_text`) VALUES
(1, 'false', 'true', 'false', 'breadcrumb-transparent', 'footer-light', '4', 'fadeInDown', 'template_1', 'dashboard_1', 'true', 'login_page_2', 'fa-check-circle-o', '', '', '', 'true', 'false', 'false', 'false', 'basic_form', 1, 'bg-primary', 'bg-blue-grey', 'menu-dark', 'true', 'MonetDT', 't2b', 'true', 'true', '');

-- --------------------------------------------------------

--
-- Table structure for table `xin_tickets_attachment`
--

CREATE TABLE `xin_tickets_attachment` (
  `ticket_attachment_id` int(11) NOT NULL,
  `ticket_id` int(200) NOT NULL,
  `upload_by` int(255) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_description` mediumtext NOT NULL,
  `attachment_file` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_tickets_comments`
--

CREATE TABLE `xin_tickets_comments` (
  `comment_id` int(11) NOT NULL,
  `ticket_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `ticket_comments` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_trainers`
--

CREATE TABLE `xin_trainers` (
  `trainer_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `designation_id` int(111) NOT NULL,
  `expertise` mediumtext NOT NULL,
  `address` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_training`
--

CREATE TABLE `xin_training` (
  `training_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `training_type_id` int(200) NOT NULL,
  `trainer_option` int(11) NOT NULL,
  `trainer_id` int(200) NOT NULL,
  `start_date` varchar(200) NOT NULL,
  `finish_date` varchar(200) NOT NULL,
  `training_cost` varchar(200) NOT NULL,
  `training_status` int(200) NOT NULL,
  `description` mediumtext NOT NULL,
  `performance` varchar(200) NOT NULL,
  `remarks` mediumtext NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `xin_training_types`
--

CREATE TABLE `xin_training_types` (
  `training_type_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_training_types`
--

INSERT INTO `xin_training_types` (`training_type_id`, `company_id`, `type`, `created_at`, `status`) VALUES
(1, 1, 'Job Training', '19-03-2018 06:45:47', 1),
(2, 1, 'Workshop', '19-03-2018 06:45:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xin_travel_arrangement_type`
--

CREATE TABLE `xin_travel_arrangement_type` (
  `arrangement_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_travel_arrangement_type`
--

INSERT INTO `xin_travel_arrangement_type` (`arrangement_type_id`, `company_id`, `type`, `status`, `created_at`) VALUES
(1, 1, 'Corporation', 1, '19-03-2018 08:45:17'),
(2, 1, 'Guest House', 1, '19-03-2018 08:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `xin_users`
--

CREATE TABLE `xin_users` (
  `user_id` int(11) NOT NULL,
  `user_role` varchar(30) NOT NULL DEFAULT 'administrator',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `user_type` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) NOT NULL,
  `profile_background` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` int(11) NOT NULL,
  `last_login_date` varchar(255) NOT NULL,
  `last_login_ip` varchar(255) NOT NULL,
  `is_logged_in` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_users`
--

INSERT INTO `xin_users` (`user_id`, `user_role`, `first_name`, `last_name`, `company_name`, `company_logo`, `user_type`, `email`, `username`, `password`, `profile_photo`, `profile_background`, `contact_number`, `gender`, `address_1`, `address_2`, `city`, `state`, `zipcode`, `country`, `last_login_date`, `last_login_ip`, `is_logged_in`, `is_active`, `created_at`) VALUES
(1, 'administrator', 'Rubaisha', 'Abrar', 'Monet', '', 1, 'admin@gmail.com', 'rubaisha', '$2y$12$4wUpDzrkebflFKIsX/v70uWnTHpYqGhhpkvYq2BiS2sB5kMpyXEBK', '', '', '032892993', '', '', '', 'Karachi', '', '', 0, '', '', 1, 1, ''),
(2, 'administrator', 'rubaisha', 'abrar', 'HR Software', 'employer_1603368488.jpg', 1, 'hr@monet-onlin.com', '', '$2y$12$kf5Z4DGSwSmLVID2HX0uL.2tFIAIeEZuJrkv1/hogYcOQ8DwsDRCi', '', '', '030003004', '', '', '', '', '', '', 0, '', '', 0, 1, '22-10-2020 03:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `xin_user_roles`
--

CREATE TABLE `xin_user_roles` (
  `role_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `role_name` varchar(200) NOT NULL,
  `role_access` varchar(200) NOT NULL,
  `role_resources` text NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_user_roles`
--

INSERT INTO `xin_user_roles` (`role_id`, `company_id`, `role_name`, `role_access`, `role_resources`, `created_at`) VALUES
(1, 1, 'Super Admin', '1', '0,103,13,13,201,202,203,372,373,393,393,394,395,396,422,351,421,88,23,23,204,205,206,231,400,22,445,465,12,14,14,207,208,209,232,15,15,210,211,212,233,16,16,213,214,215,234,406,407,408,17,17,216,217,218,235,18,18,219,220,221,236,19,19,222,223,224,237,20,20,225,226,227,238,21,21,228,229,230,239,2,3,3,240,241,242,4,4,243,244,245,249,5,5,246,247,248,6,6,250,251,252,11,11,254,255,256,257,9,9,258,259,260,96,442,24,25,25,262,263,264,265,26,26,266,267,268,97,98,98,269,270,271,272,99,99,273,274,275,276,27,28,28,397,423,10,10,253,261,29,29,381,30,30,277,278,279,310,401,401,402,403,31,7,7,280,281,282,2822,311,8,8,283,284,285,46,46,287,288,289,290,48,49,49,291,292,293,50,51,51,294,295,387,52,296,32,36,36,313,314,404,405,40,41,41,298,299,300,301,42,42,302,303,304,305,43,43,306,307,308,309,104,44,44,315,316,317,318,312,90,91,94,424,425,45,45,319,320,321,322,122,122,331,332,333,106,107,107,334,335,336,108,108,338,339,340,47,53,54,54,341,342,343,344,55,55,345,346,347,56,56,348,349,350,57,60,61,62,63,93,118,297,431,432,433,434,435,436,437,438,439,440,441,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,71,286,72,72,352,353,354,73,74,75,75,355,356,357,76,76,358,359,360,77,77,361,362,363,78,37,37,391,79,80,80,364,365,366,81,81,367,368,369,82,83,84,85,86,87,119,119,323,324,325,326,410,411,412,413,414,420,415,416,417,418,419,121,121,120,328,329,330,426,427,428,429,430,89,89,370,371,95,92,443,444,446,110,111,112,113,114,115,116,117,409', '28-02-2018'),
(2, 1, 'Employee', '2', '0,445,465,14,207,208,15,210,211,16,213,214,17,216,217,19,222,223,224,20,225,226,227,11,254,255,9,258,259,25,262,263,97,98,98,269,270,271,272,99,99,273,274,275,276,28,10,261,29,401,402,8,283,46,46,287,288,289,290,50,43,306,307,44,315,316,317,312,90,91,94,424,425,45,319,320,321,106,107,107,334,335,336,108,108,338,339,340,47,54,341,342,343,55,55,345,346,347,75,355,356,76,358,359,37,95,92,446', '21-03-2018');

-- --------------------------------------------------------

--
-- Table structure for table `xin_warning_type`
--

CREATE TABLE `xin_warning_type` (
  `warning_type_id` int(111) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xin_warning_type`
--

INSERT INTO `xin_warning_type` (`warning_type_id`, `company_id`, `type`, `created_at`) VALUES
(1, 1, 'First Written Warning', '22-03-2018 01:38:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `xin_advance_salaries`
--
ALTER TABLE `xin_advance_salaries`
  ADD PRIMARY KEY (`advance_salary_id`);

--
-- Indexes for table `xin_announcements`
--
ALTER TABLE `xin_announcements`
  ADD PRIMARY KEY (`announcement_id`);

--
-- Indexes for table `xin_assets`
--
ALTER TABLE `xin_assets`
  ADD PRIMARY KEY (`assets_id`);

--
-- Indexes for table `xin_assets_categories`
--
ALTER TABLE `xin_assets_categories`
  ADD PRIMARY KEY (`assets_category_id`);

--
-- Indexes for table `xin_attendance_time`
--
ALTER TABLE `xin_attendance_time`
  ADD PRIMARY KEY (`time_attendance_id`);

--
-- Indexes for table `xin_attendance_time_request`
--
ALTER TABLE `xin_attendance_time_request`
  ADD PRIMARY KEY (`time_request_id`);

--
-- Indexes for table `xin_awards`
--
ALTER TABLE `xin_awards`
  ADD PRIMARY KEY (`award_id`);

--
-- Indexes for table `xin_award_type`
--
ALTER TABLE `xin_award_type`
  ADD PRIMARY KEY (`award_type_id`);

--
-- Indexes for table `xin_chat_messages`
--
ALTER TABLE `xin_chat_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `xin_clients`
--
ALTER TABLE `xin_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `xin_cnic`
--
ALTER TABLE `xin_cnic`
  ADD PRIMARY KEY (`cnic_id`);

--
-- Indexes for table `xin_companies`
--
ALTER TABLE `xin_companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `xin_company_documents`
--
ALTER TABLE `xin_company_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `xin_company_info`
--
ALTER TABLE `xin_company_info`
  ADD PRIMARY KEY (`company_info_id`);

--
-- Indexes for table `xin_company_policy`
--
ALTER TABLE `xin_company_policy`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `xin_company_type`
--
ALTER TABLE `xin_company_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `xin_contract_type`
--
ALTER TABLE `xin_contract_type`
  ADD PRIMARY KEY (`contract_type_id`);

--
-- Indexes for table `xin_countries`
--
ALTER TABLE `xin_countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `xin_currencies`
--
ALTER TABLE `xin_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `xin_currency_converter`
--
ALTER TABLE `xin_currency_converter`
  ADD PRIMARY KEY (`currency_converter_id`);

--
-- Indexes for table `xin_database_backup`
--
ALTER TABLE `xin_database_backup`
  ADD PRIMARY KEY (`backup_id`);

--
-- Indexes for table `xin_departments`
--
ALTER TABLE `xin_departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `xin_designations`
--
ALTER TABLE `xin_designations`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `xin_device_tokens`
--
ALTER TABLE `xin_device_tokens`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `xin_document_type`
--
ALTER TABLE `xin_document_type`
  ADD PRIMARY KEY (`document_type_id`);

--
-- Indexes for table `xin_education_level`
--
ALTER TABLE `xin_education_level`
  ADD PRIMARY KEY (`minimum_education_id`);

--
-- Indexes for table `xin_email_configuration`
--
ALTER TABLE `xin_email_configuration`
  ADD PRIMARY KEY (`email_config_id`);

--
-- Indexes for table `xin_email_template`
--
ALTER TABLE `xin_email_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `xin_employees`
--
ALTER TABLE `xin_employees`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `xin_employee_bankaccount`
--
ALTER TABLE `xin_employee_bankaccount`
  ADD PRIMARY KEY (`bankaccount_id`);

--
-- Indexes for table `xin_employee_complaints`
--
ALTER TABLE `xin_employee_complaints`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `xin_employee_contacts`
--
ALTER TABLE `xin_employee_contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `xin_employee_contract`
--
ALTER TABLE `xin_employee_contract`
  ADD PRIMARY KEY (`contract_id`);

--
-- Indexes for table `xin_employee_documents`
--
ALTER TABLE `xin_employee_documents`
  ADD PRIMARY KEY (`document_id`);

--
-- Indexes for table `xin_employee_eobi_amount`
--
ALTER TABLE `xin_employee_eobi_amount`
  ADD PRIMARY KEY (`amount_id`);

--
-- Indexes for table `xin_employee_exit`
--
ALTER TABLE `xin_employee_exit`
  ADD PRIMARY KEY (`exit_id`);

--
-- Indexes for table `xin_employee_exit_type`
--
ALTER TABLE `xin_employee_exit_type`
  ADD PRIMARY KEY (`exit_type_id`);

--
-- Indexes for table `xin_employee_immigration`
--
ALTER TABLE `xin_employee_immigration`
  ADD PRIMARY KEY (`immigration_id`);

--
-- Indexes for table `xin_employee_leave`
--
ALTER TABLE `xin_employee_leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `xin_employee_location`
--
ALTER TABLE `xin_employee_location`
  ADD PRIMARY KEY (`office_location_id`);

--
-- Indexes for table `xin_employee_promotions`
--
ALTER TABLE `xin_employee_promotions`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `xin_employee_provident_fund`
--
ALTER TABLE `xin_employee_provident_fund`
  ADD PRIMARY KEY (`fund_id`);

--
-- Indexes for table `xin_employee_qualification`
--
ALTER TABLE `xin_employee_qualification`
  ADD PRIMARY KEY (`qualification_id`);

--
-- Indexes for table `xin_employee_resignations`
--
ALTER TABLE `xin_employee_resignations`
  ADD PRIMARY KEY (`resignation_id`);

--
-- Indexes for table `xin_employee_security_level`
--
ALTER TABLE `xin_employee_security_level`
  ADD PRIMARY KEY (`security_level_id`);

--
-- Indexes for table `xin_employee_shift`
--
ALTER TABLE `xin_employee_shift`
  ADD PRIMARY KEY (`emp_shift_id`);

--
-- Indexes for table `xin_employee_terminations`
--
ALTER TABLE `xin_employee_terminations`
  ADD PRIMARY KEY (`termination_id`);

--
-- Indexes for table `xin_employee_transfer`
--
ALTER TABLE `xin_employee_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `xin_employee_travels`
--
ALTER TABLE `xin_employee_travels`
  ADD PRIMARY KEY (`travel_id`);

--
-- Indexes for table `xin_employee_warnings`
--
ALTER TABLE `xin_employee_warnings`
  ADD PRIMARY KEY (`warning_id`);

--
-- Indexes for table `xin_employee_work_experience`
--
ALTER TABLE `xin_employee_work_experience`
  ADD PRIMARY KEY (`work_experience_id`);

--
-- Indexes for table `xin_eobi_amount`
--
ALTER TABLE `xin_eobi_amount`
  ADD PRIMARY KEY (`amount_id`);

--
-- Indexes for table `xin_ethnicity_type`
--
ALTER TABLE `xin_ethnicity_type`
  ADD PRIMARY KEY (`ethnicity_type_id`);

--
-- Indexes for table `xin_events`
--
ALTER TABLE `xin_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `xin_event_images`
--
ALTER TABLE `xin_event_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `xin_expenses`
--
ALTER TABLE `xin_expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `xin_expense_type`
--
ALTER TABLE `xin_expense_type`
  ADD PRIMARY KEY (`expense_type_id`);

--
-- Indexes for table `xin_file_manager`
--
ALTER TABLE `xin_file_manager`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `xin_file_manager_settings`
--
ALTER TABLE `xin_file_manager_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `xin_finance_bankcash`
--
ALTER TABLE `xin_finance_bankcash`
  ADD PRIMARY KEY (`bankcash_id`);

--
-- Indexes for table `xin_finance_deposit`
--
ALTER TABLE `xin_finance_deposit`
  ADD PRIMARY KEY (`deposit_id`);

--
-- Indexes for table `xin_finance_expense`
--
ALTER TABLE `xin_finance_expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `xin_finance_payees`
--
ALTER TABLE `xin_finance_payees`
  ADD PRIMARY KEY (`payee_id`);

--
-- Indexes for table `xin_finance_payers`
--
ALTER TABLE `xin_finance_payers`
  ADD PRIMARY KEY (`payer_id`);

--
-- Indexes for table `xin_finance_transaction`
--
ALTER TABLE `xin_finance_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `xin_finance_transactions`
--
ALTER TABLE `xin_finance_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `xin_finance_transfer`
--
ALTER TABLE `xin_finance_transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `xin_goal_tracking`
--
ALTER TABLE `xin_goal_tracking`
  ADD PRIMARY KEY (`tracking_id`);

--
-- Indexes for table `xin_goal_tracking_type`
--
ALTER TABLE `xin_goal_tracking_type`
  ADD PRIMARY KEY (`tracking_type_id`);

--
-- Indexes for table `xin_holidays`
--
ALTER TABLE `xin_holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `xin_hourly_templates`
--
ALTER TABLE `xin_hourly_templates`
  ADD PRIMARY KEY (`hourly_rate_id`);

--
-- Indexes for table `xin_hrsale_invoices`
--
ALTER TABLE `xin_hrsale_invoices`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `xin_hrsale_invoices_items`
--
ALTER TABLE `xin_hrsale_invoices_items`
  ADD PRIMARY KEY (`invoice_item_id`);

--
-- Indexes for table `xin_hrsale_module_attributes`
--
ALTER TABLE `xin_hrsale_module_attributes`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `xin_hrsale_module_attributes_select_value`
--
ALTER TABLE `xin_hrsale_module_attributes_select_value`
  ADD PRIMARY KEY (`attributes_select_value_id`);

--
-- Indexes for table `xin_hrsale_module_attributes_values`
--
ALTER TABLE `xin_hrsale_module_attributes_values`
  ADD PRIMARY KEY (`attributes_value_id`);

--
-- Indexes for table `xin_hrsale_notificaions`
--
ALTER TABLE `xin_hrsale_notificaions`
  ADD PRIMARY KEY (`notificaion_id`);

--
-- Indexes for table `xin_hrsale_quotes`
--
ALTER TABLE `xin_hrsale_quotes`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indexes for table `xin_hrsale_quotes_items`
--
ALTER TABLE `xin_hrsale_quotes_items`
  ADD PRIMARY KEY (`quote_item_id`);

--
-- Indexes for table `xin_income_categories`
--
ALTER TABLE `xin_income_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `xin_jobs`
--
ALTER TABLE `xin_jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `xin_job_applications`
--
ALTER TABLE `xin_job_applications`
  ADD PRIMARY KEY (`application_id`);

--
-- Indexes for table `xin_job_categories`
--
ALTER TABLE `xin_job_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `xin_job_education`
--
ALTER TABLE `xin_job_education`
  ADD PRIMARY KEY (`education_id`);

--
-- Indexes for table `xin_job_images`
--
ALTER TABLE `xin_job_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `xin_job_interviews`
--
ALTER TABLE `xin_job_interviews`
  ADD PRIMARY KEY (`job_interview_id`);

--
-- Indexes for table `xin_job_pages`
--
ALTER TABLE `xin_job_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `xin_job_type`
--
ALTER TABLE `xin_job_type`
  ADD PRIMARY KEY (`job_type_id`);

--
-- Indexes for table `xin_kpi_incidental`
--
ALTER TABLE `xin_kpi_incidental`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_kpi_maingoals`
--
ALTER TABLE `xin_kpi_maingoals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_kpi_variable`
--
ALTER TABLE `xin_kpi_variable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xin_languages`
--
ALTER TABLE `xin_languages`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `xin_leads`
--
ALTER TABLE `xin_leads`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `xin_leads_followup`
--
ALTER TABLE `xin_leads_followup`
  ADD PRIMARY KEY (`leads_followup_id`);

--
-- Indexes for table `xin_leave_applications`
--
ALTER TABLE `xin_leave_applications`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `xin_leave_type`
--
ALTER TABLE `xin_leave_type`
  ADD PRIMARY KEY (`leave_type_id`);

--
-- Indexes for table `xin_macaddress`
--
ALTER TABLE `xin_macaddress`
  ADD PRIMARY KEY (`macaddress_id`);

--
-- Indexes for table `xin_make_payment`
--
ALTER TABLE `xin_make_payment`
  ADD PRIMARY KEY (`make_payment_id`);

--
-- Indexes for table `xin_meetings`
--
ALTER TABLE `xin_meetings`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `xin_minimum_education`
--
ALTER TABLE `xin_minimum_education`
  ADD PRIMARY KEY (`minimum_education_id`);

--
-- Indexes for table `xin_office_location`
--
ALTER TABLE `xin_office_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `xin_office_shift`
--
ALTER TABLE `xin_office_shift`
  ADD PRIMARY KEY (`office_shift_id`);

--
-- Indexes for table `xin_payment_method`
--
ALTER TABLE `xin_payment_method`
  ADD PRIMARY KEY (`payment_method_id`);

--
-- Indexes for table `xin_payroll_custom_fields`
--
ALTER TABLE `xin_payroll_custom_fields`
  ADD PRIMARY KEY (`payroll_custom_id`);

--
-- Indexes for table `xin_performance_appraisal`
--
ALTER TABLE `xin_performance_appraisal`
  ADD PRIMARY KEY (`performance_appraisal_id`);

--
-- Indexes for table `xin_performance_appraisal_options`
--
ALTER TABLE `xin_performance_appraisal_options`
  ADD PRIMARY KEY (`performance_appraisal_options_id`);

--
-- Indexes for table `xin_performance_indicator`
--
ALTER TABLE `xin_performance_indicator`
  ADD PRIMARY KEY (`performance_indicator_id`);

--
-- Indexes for table `xin_performance_indicator_options`
--
ALTER TABLE `xin_performance_indicator_options`
  ADD PRIMARY KEY (`performance_indicator_options_id`);

--
-- Indexes for table `xin_policy_record`
--
ALTER TABLE `xin_policy_record`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `xin_projects`
--
ALTER TABLE `xin_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `xin_projects_attachment`
--
ALTER TABLE `xin_projects_attachment`
  ADD PRIMARY KEY (`project_attachment_id`);

--
-- Indexes for table `xin_projects_bugs`
--
ALTER TABLE `xin_projects_bugs`
  ADD PRIMARY KEY (`bug_id`);

--
-- Indexes for table `xin_projects_discussion`
--
ALTER TABLE `xin_projects_discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `xin_projects_timelogs`
--
ALTER TABLE `xin_projects_timelogs`
  ADD PRIMARY KEY (`timelogs_id`);

--
-- Indexes for table `xin_project_variations`
--
ALTER TABLE `xin_project_variations`
  ADD PRIMARY KEY (`variation_id`) USING BTREE;

--
-- Indexes for table `xin_qualification_education_level`
--
ALTER TABLE `xin_qualification_education_level`
  ADD PRIMARY KEY (`education_level_id`);

--
-- Indexes for table `xin_qualification_language`
--
ALTER TABLE `xin_qualification_language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `xin_qualification_skill`
--
ALTER TABLE `xin_qualification_skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `xin_questions`
--
ALTER TABLE `xin_questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `xin_quoted_projects`
--
ALTER TABLE `xin_quoted_projects`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `xin_quoted_projects_attachment`
--
ALTER TABLE `xin_quoted_projects_attachment`
  ADD PRIMARY KEY (`project_attachment_id`);

--
-- Indexes for table `xin_quoted_projects_discussion`
--
ALTER TABLE `xin_quoted_projects_discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Indexes for table `xin_quoted_projects_timelogs`
--
ALTER TABLE `xin_quoted_projects_timelogs`
  ADD PRIMARY KEY (`timelogs_id`);

--
-- Indexes for table `xin_recruitment_pages`
--
ALTER TABLE `xin_recruitment_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `xin_recruitment_subpages`
--
ALTER TABLE `xin_recruitment_subpages`
  ADD PRIMARY KEY (`subpages_id`);

--
-- Indexes for table `xin_salary_allowances`
--
ALTER TABLE `xin_salary_allowances`
  ADD PRIMARY KEY (`allowance_id`);

--
-- Indexes for table `xin_salary_bank_allocation`
--
ALTER TABLE `xin_salary_bank_allocation`
  ADD PRIMARY KEY (`bank_allocation_id`);

--
-- Indexes for table `xin_salary_commissions`
--
ALTER TABLE `xin_salary_commissions`
  ADD PRIMARY KEY (`salary_commissions_id`);

--
-- Indexes for table `xin_salary_loan_deductions`
--
ALTER TABLE `xin_salary_loan_deductions`
  ADD PRIMARY KEY (`loan_deduction_id`);

--
-- Indexes for table `xin_salary_other_payments`
--
ALTER TABLE `xin_salary_other_payments`
  ADD PRIMARY KEY (`other_payments_id`);

--
-- Indexes for table `xin_salary_overtime`
--
ALTER TABLE `xin_salary_overtime`
  ADD PRIMARY KEY (`salary_overtime_id`);

--
-- Indexes for table `xin_salary_payslips`
--
ALTER TABLE `xin_salary_payslips`
  ADD PRIMARY KEY (`payslip_id`);

--
-- Indexes for table `xin_salary_payslip_allowances`
--
ALTER TABLE `xin_salary_payslip_allowances`
  ADD PRIMARY KEY (`payslip_allowances_id`);

--
-- Indexes for table `xin_salary_payslip_commissions`
--
ALTER TABLE `xin_salary_payslip_commissions`
  ADD PRIMARY KEY (`payslip_commissions_id`);

--
-- Indexes for table `xin_salary_payslip_loan`
--
ALTER TABLE `xin_salary_payslip_loan`
  ADD PRIMARY KEY (`payslip_loan_id`);

--
-- Indexes for table `xin_salary_payslip_other_payments`
--
ALTER TABLE `xin_salary_payslip_other_payments`
  ADD PRIMARY KEY (`payslip_other_payment_id`);

--
-- Indexes for table `xin_salary_payslip_overtime`
--
ALTER TABLE `xin_salary_payslip_overtime`
  ADD PRIMARY KEY (`payslip_overtime_id`);

--
-- Indexes for table `xin_salary_payslip_statutory_deductions`
--
ALTER TABLE `xin_salary_payslip_statutory_deductions`
  ADD PRIMARY KEY (`payslip_deduction_id`);

--
-- Indexes for table `xin_salary_statutory_deductions`
--
ALTER TABLE `xin_salary_statutory_deductions`
  ADD PRIMARY KEY (`statutory_deductions_id`);

--
-- Indexes for table `xin_salary_templates`
--
ALTER TABLE `xin_salary_templates`
  ADD PRIMARY KEY (`salary_template_id`);

--
-- Indexes for table `xin_security_level`
--
ALTER TABLE `xin_security_level`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `xin_sub_departments`
--
ALTER TABLE `xin_sub_departments`
  ADD PRIMARY KEY (`sub_department_id`);

--
-- Indexes for table `xin_support_tickets`
--
ALTER TABLE `xin_support_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `xin_support_tickets_employees`
--
ALTER TABLE `xin_support_tickets_employees`
  ADD PRIMARY KEY (`tickets_employees_id`);

--
-- Indexes for table `xin_support_ticket_files`
--
ALTER TABLE `xin_support_ticket_files`
  ADD PRIMARY KEY (`ticket_file_id`);

--
-- Indexes for table `xin_system_setting`
--
ALTER TABLE `xin_system_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `xin_tasks`
--
ALTER TABLE `xin_tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `xin_tasks_attachment`
--
ALTER TABLE `xin_tasks_attachment`
  ADD PRIMARY KEY (`task_attachment_id`);

--
-- Indexes for table `xin_tasks_comments`
--
ALTER TABLE `xin_tasks_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `xin_task_categories`
--
ALTER TABLE `xin_task_categories`
  ADD PRIMARY KEY (`task_category_id`);

--
-- Indexes for table `xin_task_images`
--
ALTER TABLE `xin_task_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `xin_tax_types`
--
ALTER TABLE `xin_tax_types`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `xin_termination_type`
--
ALTER TABLE `xin_termination_type`
  ADD PRIMARY KEY (`termination_type_id`);

--
-- Indexes for table `xin_theme_settings`
--
ALTER TABLE `xin_theme_settings`
  ADD PRIMARY KEY (`theme_settings_id`);

--
-- Indexes for table `xin_tickets_attachment`
--
ALTER TABLE `xin_tickets_attachment`
  ADD PRIMARY KEY (`ticket_attachment_id`);

--
-- Indexes for table `xin_tickets_comments`
--
ALTER TABLE `xin_tickets_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `xin_trainers`
--
ALTER TABLE `xin_trainers`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Indexes for table `xin_training`
--
ALTER TABLE `xin_training`
  ADD PRIMARY KEY (`training_id`);

--
-- Indexes for table `xin_training_types`
--
ALTER TABLE `xin_training_types`
  ADD PRIMARY KEY (`training_type_id`);

--
-- Indexes for table `xin_travel_arrangement_type`
--
ALTER TABLE `xin_travel_arrangement_type`
  ADD PRIMARY KEY (`arrangement_type_id`);

--
-- Indexes for table `xin_users`
--
ALTER TABLE `xin_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `xin_user_roles`
--
ALTER TABLE `xin_user_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `xin_warning_type`
--
ALTER TABLE `xin_warning_type`
  ADD PRIMARY KEY (`warning_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xin_advance_salaries`
--
ALTER TABLE `xin_advance_salaries`
  MODIFY `advance_salary_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_announcements`
--
ALTER TABLE `xin_announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_assets`
--
ALTER TABLE `xin_assets`
  MODIFY `assets_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_assets_categories`
--
ALTER TABLE `xin_assets_categories`
  MODIFY `assets_category_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_attendance_time`
--
ALTER TABLE `xin_attendance_time`
  MODIFY `time_attendance_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `xin_attendance_time_request`
--
ALTER TABLE `xin_attendance_time_request`
  MODIFY `time_request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_awards`
--
ALTER TABLE `xin_awards`
  MODIFY `award_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_award_type`
--
ALTER TABLE `xin_award_type`
  MODIFY `award_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_chat_messages`
--
ALTER TABLE `xin_chat_messages`
  MODIFY `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_clients`
--
ALTER TABLE `xin_clients`
  MODIFY `client_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_cnic`
--
ALTER TABLE `xin_cnic`
  MODIFY `cnic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_companies`
--
ALTER TABLE `xin_companies`
  MODIFY `company_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_company_documents`
--
ALTER TABLE `xin_company_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_company_info`
--
ALTER TABLE `xin_company_info`
  MODIFY `company_info_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_company_policy`
--
ALTER TABLE `xin_company_policy`
  MODIFY `policy_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_company_type`
--
ALTER TABLE `xin_company_type`
  MODIFY `type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_contract_type`
--
ALTER TABLE `xin_contract_type`
  MODIFY `contract_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_countries`
--
ALTER TABLE `xin_countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `xin_currencies`
--
ALTER TABLE `xin_currencies`
  MODIFY `currency_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_currency_converter`
--
ALTER TABLE `xin_currency_converter`
  MODIFY `currency_converter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_database_backup`
--
ALTER TABLE `xin_database_backup`
  MODIFY `backup_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_departments`
--
ALTER TABLE `xin_departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_designations`
--
ALTER TABLE `xin_designations`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `xin_device_tokens`
--
ALTER TABLE `xin_device_tokens`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `xin_document_type`
--
ALTER TABLE `xin_document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_education_level`
--
ALTER TABLE `xin_education_level`
  MODIFY `minimum_education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_email_configuration`
--
ALTER TABLE `xin_email_configuration`
  MODIFY `email_config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_email_template`
--
ALTER TABLE `xin_email_template`
  MODIFY `template_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `xin_employees`
--
ALTER TABLE `xin_employees`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9796;

--
-- AUTO_INCREMENT for table `xin_employee_bankaccount`
--
ALTER TABLE `xin_employee_bankaccount`
  MODIFY `bankaccount_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_complaints`
--
ALTER TABLE `xin_employee_complaints`
  MODIFY `complaint_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_contacts`
--
ALTER TABLE `xin_employee_contacts`
  MODIFY `contact_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_contract`
--
ALTER TABLE `xin_employee_contract`
  MODIFY `contract_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_documents`
--
ALTER TABLE `xin_employee_documents`
  MODIFY `document_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `xin_employee_eobi_amount`
--
ALTER TABLE `xin_employee_eobi_amount`
  MODIFY `amount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_employee_exit`
--
ALTER TABLE `xin_employee_exit`
  MODIFY `exit_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_exit_type`
--
ALTER TABLE `xin_employee_exit_type`
  MODIFY `exit_type_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_employee_immigration`
--
ALTER TABLE `xin_employee_immigration`
  MODIFY `immigration_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_leave`
--
ALTER TABLE `xin_employee_leave`
  MODIFY `leave_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_location`
--
ALTER TABLE `xin_employee_location`
  MODIFY `office_location_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_promotions`
--
ALTER TABLE `xin_employee_promotions`
  MODIFY `promotion_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_provident_fund`
--
ALTER TABLE `xin_employee_provident_fund`
  MODIFY `fund_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xin_employee_qualification`
--
ALTER TABLE `xin_employee_qualification`
  MODIFY `qualification_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xin_employee_resignations`
--
ALTER TABLE `xin_employee_resignations`
  MODIFY `resignation_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_security_level`
--
ALTER TABLE `xin_employee_security_level`
  MODIFY `security_level_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_shift`
--
ALTER TABLE `xin_employee_shift`
  MODIFY `emp_shift_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_terminations`
--
ALTER TABLE `xin_employee_terminations`
  MODIFY `termination_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_transfer`
--
ALTER TABLE `xin_employee_transfer`
  MODIFY `transfer_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_travels`
--
ALTER TABLE `xin_employee_travels`
  MODIFY `travel_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_warnings`
--
ALTER TABLE `xin_employee_warnings`
  MODIFY `warning_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_employee_work_experience`
--
ALTER TABLE `xin_employee_work_experience`
  MODIFY `work_experience_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_eobi_amount`
--
ALTER TABLE `xin_eobi_amount`
  MODIFY `amount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_ethnicity_type`
--
ALTER TABLE `xin_ethnicity_type`
  MODIFY `ethnicity_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_events`
--
ALTER TABLE `xin_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `xin_event_images`
--
ALTER TABLE `xin_event_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `xin_expenses`
--
ALTER TABLE `xin_expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_expense_type`
--
ALTER TABLE `xin_expense_type`
  MODIFY `expense_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_file_manager`
--
ALTER TABLE `xin_file_manager`
  MODIFY `file_id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_file_manager_settings`
--
ALTER TABLE `xin_file_manager_settings`
  MODIFY `setting_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_finance_bankcash`
--
ALTER TABLE `xin_finance_bankcash`
  MODIFY `bankcash_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xin_hrsale_notificaions`
--
ALTER TABLE `xin_hrsale_notificaions`
  MODIFY `notificaion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `xin_jobs`
--
ALTER TABLE `xin_jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `xin_job_education`
--
ALTER TABLE `xin_job_education`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `xin_job_images`
--
ALTER TABLE `xin_job_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `xin_leave_applications`
--
ALTER TABLE `xin_leave_applications`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `xin_leave_type`
--
ALTER TABLE `xin_leave_type`
  MODIFY `leave_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_macaddress`
--
ALTER TABLE `xin_macaddress`
  MODIFY `macaddress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_minimum_education`
--
ALTER TABLE `xin_minimum_education`
  MODIFY `minimum_education_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_policy_record`
--
ALTER TABLE `xin_policy_record`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xin_projects`
--
ALTER TABLE `xin_projects`
  MODIFY `project_id` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xin_questions`
--
ALTER TABLE `xin_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_salary_allowances`
--
ALTER TABLE `xin_salary_allowances`
  MODIFY `allowance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `xin_salary_commissions`
--
ALTER TABLE `xin_salary_commissions`
  MODIFY `salary_commissions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_salary_loan_deductions`
--
ALTER TABLE `xin_salary_loan_deductions`
  MODIFY `loan_deduction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xin_salary_payslips`
--
ALTER TABLE `xin_salary_payslips`
  MODIFY `payslip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `xin_tasks`
--
ALTER TABLE `xin_tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `xin_task_images`
--
ALTER TABLE `xin_task_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `xin_users`
--
ALTER TABLE `xin_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
