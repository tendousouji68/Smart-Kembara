-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2025 at 06:49 AM
-- Server version: 5.7.33
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kembara_smart`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `description_of_table`
--

CREATE TABLE `description_of_table` (
  `ID` int(11) NOT NULL,
  `TableCode` varchar(255) DEFAULT NULL,
  `TableDesription` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `description_of_table`
--

INSERT INTO `description_of_table` (`ID`, `TableCode`, `TableDesription`, `Remarks`) VALUES
(1, 'gi', 'general_information', 'basic data yang jarang sekali bertukar'),
(2, 'ap', 'application_process', 'table yang terlibat dalam mana-mana pendaftaran'),
(3, 'user', 'user', 'table yang terlibat dgn maklumat pengguna');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_departures`
--

CREATE TABLE `package_departures` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `departure_date` int(11) NOT NULL,
  `return_date` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6tbYHf01UHxwYK36DAW1YItmhaSeeC0b5SEtti1h', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJGS3NUYVpJSW52R0Nxd2lKNHBNMGRMc3hKRzlZSFl4clkyNkEwViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wYWtlai9wYWtlai1kZXRhaWwvMSI7czo1OiJyb3V0ZSI7czoxNDoicGFja2FnZS1kZXRhaWwiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1764571495);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_agency`
--

CREATE TABLE `tbl_ap_agency` (
  `ID` int(11) NOT NULL,
  `AgencyName` varchar(255) DEFAULT NULL,
  `StatusAgency` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `AgencyBisnessNumber` int(11) DEFAULT NULL,
  `AgencyOfficialWebsite` varchar(255) DEFAULT NULL,
  `AgencyCodeRegister` varchar(255) DEFAULT NULL,
  `AgencyCorporationDate` datetime DEFAULT NULL,
  `CompanyTypeID` int(11) DEFAULT NULL,
  `RegistrationTypeID` int(11) DEFAULT NULL,
  `AgencyTINNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_bookings`
--

CREATE TABLE `tbl_ap_bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `sub_package_id` int(11) NOT NULL,
  `booking_date` timestamp NOT NULL,
  `travel_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_branch`
--

CREATE TABLE `tbl_ap_branch` (
  `ID` int(11) NOT NULL,
  `BranchName` varchar(255) DEFAULT NULL,
  `BranchCode` varchar(255) DEFAULT NULL,
  `BranchAddress` varchar(255) DEFAULT NULL,
  `BranchPhone` varchar(255) DEFAULT NULL,
  `BranchMobile` varchar(255) DEFAULT NULL,
  `BranchFax` varchar(255) DEFAULT NULL,
  `BranchEmail` varchar(255) DEFAULT NULL,
  `StatusBranch` int(11) DEFAULT NULL,
  `BranchAgency` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `BranchPoscode` varchar(255) DEFAULT NULL,
  `BranchDistrict` int(11) DEFAULT NULL,
  `BranchState` int(11) DEFAULT NULL,
  `BranchCountry` int(11) DEFAULT NULL,
  `ParlimenID` int(11) DEFAULT NULL,
  `DunID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_packages`
--

CREATE TABLE `tbl_ap_packages` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_ap_packages`
--

INSERT INTO `tbl_ap_packages` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Smart Umrah', '2025-11-27 03:09:53', '2025-11-27 03:09:53'),
(2, 'Smart Travel', '2025-11-27 03:10:48', '2025-11-27 03:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_status`
--

CREATE TABLE `tbl_ap_status` (
  `ID` int(11) NOT NULL,
  `JenisStatus` varchar(255) DEFAULT NULL,
  `IDStatus` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_ap_status`
--

INSERT INTO `tbl_ap_status` (`ID`, `JenisStatus`, `IDStatus`, `Remarks`) VALUES
(1, 'Lulus/Berjaya', 1, NULL),
(2, 'Tidak Berjaya', 1, NULL),
(3, 'Dalam Proses', 1, NULL),
(4, 'Dalam Tindakan', 1, NULL),
(5, 'Dalam Siasatan', 1, NULL),
(6, 'Rayuan', 1, NULL),
(7, 'KIV', 1, NULL),
(8, 'Tamat', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ap_subpackages`
--

CREATE TABLE `tbl_ap_subpackages` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_ap_subpackages`
--

INSERT INTO `tbl_ap_subpackages` (`id`, `package_id`, `name`, `picture`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic', 'pakejsm1.webp', '9 hari 7 malam', 90000, '2025-11-27 03:18:38', '2025-11-27 03:18:38'),
(2, 1, 'Pro', 'pakejsm2.webp', '10 hari 8 malam', 130000, '2025-11-27 03:18:38', '2025-11-27 03:18:38'),
(3, 1, 'Pro Plus', 'pakejsm3.webp', '12 hari 10 malam', 150000, '2025-11-27 03:20:00', '2025-11-27 03:20:00'),
(4, 2, 'Basic', 'pakejst1.webp', '8 hari 6 malam', 80000, '2025-12-01 01:12:19', '2025-12-01 01:12:19'),
(5, 2, 'Pro', 'pakejst2.webp', '10 hari 8 malam', 100000, '2025-12-01 01:12:19', '2025-12-01 01:12:19'),
(6, 2, 'Pro Max', 'pakejst3.webp', '12 hari 10 malam', 200000, '2025-12-01 01:31:20', '2025-12-01 01:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_bisness`
--

CREATE TABLE `tbl_gi_bisness` (
  `ID` int(11) NOT NULL,
  `TypeOfBisness` varchar(255) DEFAULT NULL,
  `StatusBisness` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_bisness`
--

INSERT INTO `tbl_gi_bisness` (`ID`, `TypeOfBisness`, `StatusBisness`, `Remarks`) VALUES
(1, 'Enterprise', 1, NULL),
(2, 'Sdn. Bhd.', 1, NULL),
(3, 'Berhad', 1, NULL),
(4, 'Goverment Agency', 1, NULL),
(5, 'GLC', 1, NULL),
(6, 'NGO', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_country`
--

CREATE TABLE `tbl_gi_country` (
  `ID` int(11) NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `CountryCode` varchar(255) DEFAULT NULL,
  `CountryPhoneCode` varchar(255) DEFAULT NULL,
  `StatusCountry` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_country`
--

INSERT INTO `tbl_gi_country` (`ID`, `Country`, `CountryCode`, `CountryPhoneCode`, `StatusCountry`, `Remarks`) VALUES
(1, 'Afghanistan', 'AF', '+93', 1, NULL),
(2, 'Albania', 'AL', '+355', 1, NULL),
(3, 'Algeria', 'DZ', '+213', 1, NULL),
(4, 'Andorra', 'AD', '+376', 1, NULL),
(5, 'Angola', 'AO', '+244', 1, NULL),
(6, 'Antigua and Barbuda', 'AG', '+1-268', 1, NULL),
(7, 'Argentina', 'AR', '+54', 1, NULL),
(8, 'Armenia', 'AM', '+374', 1, NULL),
(9, 'Australia', 'AU', '+61', 1, NULL),
(10, 'Austria', 'AT', '+43', 1, NULL),
(11, 'Azerbaijan', 'AZ', '+994', 1, NULL),
(12, 'Bahamas', 'BS', '+1-242', 1, NULL),
(13, 'Bahrain', 'BH', '+973', 1, NULL),
(14, 'Bangladesh', 'BD', '+880', 1, NULL),
(15, 'Barbados', 'BB', '+1-246', 1, NULL),
(16, 'Belarus', 'BY', '+375', 1, NULL),
(17, 'Belgium', 'BE', '+32', 1, NULL),
(18, 'Belize', 'BZ', '+501', 1, NULL),
(19, 'Benin', 'BJ', '+229', 1, NULL),
(20, 'Bhutan', 'BT', '+975', 1, NULL),
(21, 'Bolivia', 'BO', '+591', 1, NULL),
(22, 'Bosnia and Herzegovina', 'BA', '+387', 1, NULL),
(23, 'Botswana', 'BW', '+267', 1, NULL),
(24, 'Brazil', 'BR', '+55', 1, NULL),
(25, 'Brunei', 'BN', '+673', 1, NULL),
(26, 'Bulgaria', 'BG', '+359', 1, NULL),
(27, 'Burkina Faso', 'BF', '+226', 1, NULL),
(28, 'Burundi', 'BI', '+257', 1, NULL),
(29, 'Cabo Verde', 'CV', '+238', 1, NULL),
(30, 'Cambodia', 'KH', '+855', 1, NULL),
(31, 'Cameroon', 'CM', '+237', 1, NULL),
(32, 'Canada', 'CA', '+1', 1, NULL),
(33, 'Central African Republic', 'CF', '+236', 1, NULL),
(34, 'Chad', 'TD', '+235', 1, NULL),
(35, 'Chile', 'CL', '+56', 1, NULL),
(36, 'China', 'CN', '+86', 1, NULL),
(37, 'Colombia', 'CO', '+57', 1, NULL),
(38, 'Comoros', 'KM', '+269', 1, NULL),
(39, 'Congo (Republic)', 'CG', '+242', 1, NULL),
(40, 'Congo (DRC)', 'CD', '+243', 1, NULL),
(41, 'Costa Rica', 'CR', '+506', 1, NULL),
(42, 'Croatia', 'HR', '+385', 1, NULL),
(43, 'Cuba', 'CU', '+53', 1, NULL),
(44, 'Cyprus', 'CY', '+357', 1, NULL),
(45, 'Czech Republic', 'CZ', '+420', 1, NULL),
(46, 'Denmark', 'DK', '+45', 1, NULL),
(47, 'Djibouti', 'DJ', '+253', 1, NULL),
(48, 'Dominica', 'DM', '+1-767', 1, NULL),
(49, 'Dominican Republic', 'DO', '+1-809 / 829 / 849', 1, NULL),
(50, 'Ecuador', 'EC', '+593', 1, NULL),
(51, 'Egypt', 'EG', '+20', 1, NULL),
(52, 'El Salvador', 'SV', '+503', 1, NULL),
(53, 'Equatorial Guinea', 'GQ', '+240', 1, NULL),
(54, 'Eritrea', 'ER', '+291', 1, NULL),
(55, 'Estonia', 'EE', '+372', 1, NULL),
(56, 'Eswatini', 'SZ', '+268', 1, NULL),
(57, 'Ethiopia', 'ET', '+251', 1, NULL),
(58, 'Fiji', 'FJ', '+679', 1, NULL),
(59, 'Finland', 'FI', '+358', 1, NULL),
(60, 'France', 'FR', '+33', 1, NULL),
(61, 'Gabon', 'GA', '+241', 1, NULL),
(62, 'Gambia', 'GM', '+220', 1, NULL),
(63, 'Georgia', 'GE', '+995', 1, NULL),
(64, 'Germany', 'DE', '+49', 1, NULL),
(65, 'Ghana', 'GH', '+233', 1, NULL),
(66, 'Greece', 'GR', '+30', 1, NULL),
(67, 'Grenada', 'GD', '+1-473', 1, NULL),
(68, 'Guatemala', 'GT', '+502', 1, NULL),
(69, 'Guinea', 'GN', '+224', 1, NULL),
(70, 'Guinea-Bissau', 'GW', '+245', 1, NULL),
(71, 'Guyana', 'GY', '+592', 1, NULL),
(72, 'Haiti', 'HT', '+509', 1, NULL),
(73, 'Honduras', 'HN', '+504', 1, NULL),
(74, 'Hungary', 'HU', '+36', 1, NULL),
(75, 'Iceland', 'IS', '+354', 1, NULL),
(76, 'India', 'IN', '+91', 1, NULL),
(77, 'Indonesia', 'ID', '+62', 1, NULL),
(78, 'Iran', 'IR', '+98', 1, NULL),
(79, 'Iraq', 'IQ', '+964', 1, NULL),
(80, 'Ireland', 'IE', '+353', 1, NULL),
(81, 'Israel', 'IL', '+972', 1, NULL),
(82, 'Italy', 'IT', '+39', 1, NULL),
(83, 'Jamaica', 'JM', '+1-876', 1, NULL),
(84, 'Japan', 'JP', '+81', 1, NULL),
(85, 'Jordan', 'JO', '+962', 1, NULL),
(86, 'Kazakhstan', 'KZ', '+7', 1, NULL),
(87, 'Kenya', 'KE', '+254', 1, NULL),
(88, 'Kiribati', 'KI', '+686', 1, NULL),
(89, 'Korea (South)', 'KR', '+82', 1, NULL),
(90, 'Korea (North)', 'KP', '+850', 1, NULL),
(91, 'Kuwait', 'KW', '+965', 1, NULL),
(92, 'Kyrgyzstan', 'KG', '+996', 1, NULL),
(93, 'Laos', 'LA', '+856', 1, NULL),
(94, 'Latvia', 'LV', '+371', 1, NULL),
(95, 'Lebanon', 'LB', '+961', 1, NULL),
(96, 'Lesotho', 'LS', '+266', 1, NULL),
(97, 'Liberia', 'LR', '+231', 1, NULL),
(98, 'Libya', 'LY', '+218', 1, NULL),
(99, 'Liechtenstein', 'LI', '+423', 1, NULL),
(100, 'Lithuania', 'LT', '+370', 1, NULL),
(101, 'Luxembourg', 'LU', '+352', 1, NULL),
(102, 'Madagascar', 'MG', '+261', 1, NULL),
(103, 'Malawi', 'MW', '+265', 1, NULL),
(104, 'Malaysia', 'MY', '+60', 1, NULL),
(105, 'Maldives', 'MV', '+960', 1, NULL),
(106, 'Mali', 'ML', '+223', 1, NULL),
(107, 'Malta', 'MT', '+356', 1, NULL),
(108, 'Marshall Islands', 'MH', '+692', 1, NULL),
(109, 'Mauritania', 'MR', '+222', 1, NULL),
(110, 'Mauritius', 'MU', '+230', 1, NULL),
(111, 'Mexico', 'MX', '+52', 1, NULL),
(112, 'Micronesia', 'FM', '+691', 1, NULL),
(113, 'Moldova', 'MD', '+373', 1, NULL),
(114, 'Monaco', 'MC', '+377', 1, NULL),
(115, 'Mongolia', 'MN', '+976', 1, NULL),
(116, 'Montenegro', 'ME', '+382', 1, NULL),
(117, 'Morocco', 'MA', '+212', 1, NULL),
(118, 'Mozambique', 'MZ', '+258', 1, NULL),
(119, 'Myanmar', 'MM', '+95', 1, NULL),
(120, 'Namibia', 'NA', '+264', 1, NULL),
(121, 'Nauru', 'NR', '+674', 1, NULL),
(122, 'Nepal', 'NP', '+977', 1, NULL),
(123, 'Netherlands', 'NL', '+31', 1, NULL),
(124, 'New Zealand', 'NZ', '+64', 1, NULL),
(125, 'Nicaragua', 'NI', '+505', 1, NULL),
(126, 'Niger', 'NE', '+227', 1, NULL),
(127, 'Nigeria', 'NG', '+234', 1, NULL),
(128, 'North Macedonia', 'MK', '+389', 1, NULL),
(129, 'Norway', 'NO', '+47', 1, NULL),
(130, 'Oman', 'OM', '+968', 1, NULL),
(131, 'Pakistan', 'PK', '+92', 1, NULL),
(132, 'Palau', 'PW', '+680', 1, NULL),
(133, 'Panama', 'PA', '+507', 1, NULL),
(134, 'Papua New Guinea', 'PG', '+675', 1, NULL),
(135, 'Paraguay', 'PY', '+595', 1, NULL),
(136, 'Peru', 'PE', '+51', 1, NULL),
(137, 'Philippines', 'PH', '+63', 1, NULL),
(138, 'Poland', 'PL', '+48', 1, NULL),
(139, 'Portugal', 'PT', '+351', 1, NULL),
(140, 'Qatar', 'QA', '+974', 1, NULL),
(141, 'Romania', 'RO', '+40', 1, NULL),
(142, 'Russia', 'RU', '+7', 1, NULL),
(143, 'Rwanda', 'RW', '+250', 1, NULL),
(144, 'Saint Kitts and Nevis', 'KN', '+1-869', 1, NULL),
(145, 'Saint Lucia', 'LC', '+1-758', 1, NULL),
(146, 'Saint Vincent and the Grenadines', 'VC', '+1-784', 1, NULL),
(147, 'Samoa', 'WS', '+685', 1, NULL),
(148, 'San Marino', 'SM', '+378', 1, NULL),
(149, 'Sao Tome and Principe', 'ST', '+239', 1, NULL),
(150, 'Saudi Arabia', 'SA', '+966', 1, NULL),
(151, 'Senegal', 'SN', '+221', 1, NULL),
(152, 'Serbia', 'RS', '+381', 1, NULL),
(153, 'Seychelles', 'SC', '+248', 1, NULL),
(154, 'Sierra Leone', 'SL', '+232', 1, NULL),
(155, 'Singapore', 'SG', '+65', 1, NULL),
(156, 'Slovakia', 'SK', '+421', 1, NULL),
(157, 'Slovenia', 'SI', '+386', 1, NULL),
(158, 'Solomon Islands', 'SB', '+677', 1, NULL),
(159, 'Somalia', 'SO', '+252', 1, NULL),
(160, 'South Africa', 'ZA', '+27', 1, NULL),
(161, 'South Sudan', 'SS', '+211', 1, NULL),
(162, 'Spain', 'ES', '+34', 1, NULL),
(163, 'Sri Lanka', 'LK', '+94', 1, NULL),
(164, 'Sudan', 'SD', '+249', 1, NULL),
(165, 'Suriname', 'SR', '+597', 1, NULL),
(166, 'Sweden', 'SE', '+46', 1, NULL),
(167, 'Switzerland', 'CH', '+41', 1, NULL),
(168, 'Syria', 'SY', '+963', 1, NULL),
(169, 'Taiwan', 'TW', '+886', 1, NULL),
(170, 'Tajikistan', 'TJ', '+992', 1, NULL),
(171, 'Tanzania', 'TZ', '+255', 1, NULL),
(172, 'Thailand', 'TH', '+66', 1, NULL),
(173, 'Timor-Leste', 'TL', '+670', 1, NULL),
(174, 'Togo', 'TG', '+228', 1, NULL),
(175, 'Tonga', 'TO', '+676', 1, NULL),
(176, 'Trinidad and Tobago', 'TT', '+1-868', 1, NULL),
(177, 'Tunisia', 'TN', '+216', 1, NULL),
(178, 'Turkey', 'TR', '+90', 1, NULL),
(179, 'Turkmenistan', 'TM', '+993', 1, NULL),
(180, 'Tuvalu', 'TV', '+688', 1, NULL),
(181, 'Uganda', 'UG', '+256', 1, NULL),
(182, 'Ukraine', 'UA', '+380', 1, NULL),
(183, 'United Arab Emirates', 'AE', '+971', 1, NULL),
(184, 'United Kingdom', 'GB', '+44', 1, NULL),
(185, 'United States', 'US', '+1', 1, NULL),
(186, 'Uruguay', 'UY', '+598', 1, NULL),
(187, 'Uzbekistan', 'UZ', '+998', 1, NULL),
(188, 'Vanuatu', 'VU', '+678', 1, NULL),
(189, 'Vatican City', 'VA', '+39', 1, NULL),
(190, 'Venezuela', 'VE', '+58', 1, NULL),
(191, 'Vietnam', 'VN', '+84', 1, NULL),
(192, 'Yemen', 'YE', '+967', 1, NULL),
(193, 'Zambia', 'ZM', '+260', 1, NULL),
(194, 'Zimbabwe', 'ZW', '+263', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_district`
--

CREATE TABLE `tbl_gi_district` (
  `ID` int(11) NOT NULL,
  `DistrictName` varchar(255) DEFAULT NULL,
  `DistrictCode` varchar(255) DEFAULT NULL,
  `DistrictState` int(11) DEFAULT NULL,
  `StatusDistrict` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_district`
--

INSERT INTO `tbl_gi_district` (`ID`, `DistrictName`, `DistrictCode`, `DistrictState`, `StatusDistrict`, `Remarks`) VALUES
(1, 'Batu Pahat', '01', 1, 1, NULL),
(2, 'Johor Bahru', '02', 1, 1, NULL),
(3, 'Kluang', '03', 1, 1, NULL),
(4, 'Kota Tinggi', '04', 1, 1, NULL),
(5, 'Mersing', '05', 1, 1, NULL),
(6, 'Muar', '06', 1, 1, NULL),
(7, 'Pontian', '07', 1, 1, NULL),
(8, 'Segamat', '08', 1, 1, NULL),
(9, 'Kayu Ara Pasong', '09', 1, 1, NULL),
(10, 'Baling', '01', 2, 1, NULL),
(11, 'Bandar Baharu', '02', 2, 1, NULL),
(12, 'Kota Setar', '03', 2, 1, NULL),
(13, 'Kuala Muda', '04', 2, 1, NULL),
(14, 'Kubang Pasu', '05', 2, 1, NULL),
(15, 'Kulim', '06', 2, 1, NULL),
(16, 'Langkawi', '07', 2, 1, NULL),
(17, 'Padang Terap', '08', 2, 1, NULL),
(18, 'Sik', '09', 2, 1, NULL),
(19, 'Yan', '10', 2, 1, NULL),
(20, 'Pendang', '11', 2, 1, NULL),
(21, 'Bachok', '01', 3, 1, NULL),
(22, 'Kota Bharu', '02', 3, 1, NULL),
(23, 'Machang', '03', 3, 1, NULL),
(24, 'Pasir Mas', '04', 3, 1, NULL),
(25, 'Pasir Puteh', '05', 3, 1, NULL),
(26, 'Tanah Merah', '06', 3, 1, NULL),
(27, 'Tumpat', '07', 3, 1, NULL),
(28, 'Gua Musang', '08', 3, 1, NULL),
(29, 'Kuala Krai', '09', 3, 1, NULL),
(30, 'Jeli', '10', 3, 1, NULL),
(31, 'Alor Gajah (Melaka Utara)', '01', 4, 1, NULL),
(32, 'Jasin (Melaka Selatan)', '02', 4, 1, NULL),
(33, 'Melaka Tengah', '03', 4, 1, NULL),
(34, 'Jelebu', '01', 5, 1, NULL),
(35, 'Kuala Pilah', '02', 5, 1, NULL),
(36, 'Port Dickson', '03', 5, 1, NULL),
(37, 'Rembau', '04', 5, 1, NULL),
(38, 'Seremban', '05', 5, 1, NULL),
(39, 'Tampin', '06', 5, 1, NULL),
(40, 'Jempol', '07', 5, 1, NULL),
(41, 'Gemas (Daerah Kecil)', '08', 5, 1, NULL),
(42, 'Bentong', '01', 6, 1, NULL),
(43, 'Cameron Highlands', '02', 6, 1, NULL),
(44, 'Jerantut', '03', 6, 1, NULL),
(45, 'Kuantan', '04', 6, 1, NULL),
(46, 'Kuala Lipis', '05', 6, 1, NULL),
(47, 'Pekan', '06', 6, 1, NULL),
(48, 'Raub', '07', 6, 1, NULL),
(49, 'Temerloh', '08', 6, 1, NULL),
(50, 'Rompin', '09', 6, 1, NULL),
(51, 'Maran', '10', 6, 1, NULL),
(52, 'Bera', '11', 6, 1, NULL),
(53, 'Seberang Prai Tengah (Bukit Mertajam)', '01', 7, 1, NULL),
(54, 'Seberang Prai Utara (Butterworth)', '02', 7, 1, NULL),
(55, 'Seberang Prai Selatan (Nibong Tebal)', '03', 7, 1, NULL),
(56, 'Daerah Timur Laut', '04', 7, 1, NULL),
(57, 'Daerah Barat Daya', '05', 7, 1, NULL),
(58, 'Batang Padang', '01', 8, 1, NULL),
(59, 'Manjung', '02', 8, 1, NULL),
(60, 'Kinta', '03', 8, 1, NULL),
(61, 'Krian', '04', 8, 1, NULL),
(62, 'Kuala Kangsar', '05', 8, 1, NULL),
(63, 'Larut Dan Matang', '06', 8, 1, NULL),
(64, 'Hilir Perak', '07', 8, 1, NULL),
(65, 'Hulu Perak', '08', 8, 1, NULL),
(66, 'Perak Tengah', '09', 8, 1, NULL),
(67, 'Selama', '10', 8, 1, NULL),
(68, 'Perlis', '01', 9, 1, NULL),
(69, 'Gombak', '01', 10, 1, NULL),
(70, 'Klang', '02', 10, 1, NULL),
(71, 'Kuala Langat', '03', 10, 1, NULL),
(72, 'Kuala Selangor', '04', 10, 1, NULL),
(73, 'Petaling', '05', 10, 1, NULL),
(74, 'Sabak Bernam', '06', 10, 1, NULL),
(75, 'Sepang', '07', 10, 1, NULL),
(76, 'Hulu Langat', '08', 10, 1, NULL),
(77, 'Hulu Selangor', '09', 10, 1, NULL),
(78, 'Kuala Lumpur (Sebelum 1.2.1974)', '10', 10, 1, NULL),
(79, 'Ampang Jaya', '11', 10, 1, NULL),
(80, 'Besut', '01', 11, 1, NULL),
(81, 'Dungun', '02', 11, 1, NULL),
(82, 'Kemaman', '03', 11, 1, NULL),
(83, 'Kuala Terengganu', '04', 11, 1, NULL),
(84, 'Marang', '05', 11, 1, NULL),
(85, 'Hulu Terengganu', '06', 11, 1, NULL),
(86, 'Setiu', '07', 11, 1, NULL),
(87, 'Tawau', '01', 12, 1, NULL),
(88, 'Lahad Datu', '02', 12, 1, NULL),
(89, 'Semporna', '03', 12, 1, NULL),
(90, 'Sandakan', '04', 12, 1, NULL),
(91, 'Tongod', '05', 12, 1, NULL),
(92, 'Labut Dan Sugut', '06', 12, 1, NULL),
(93, 'Kota Kinabalu', '07', 12, 1, NULL),
(94, 'Ranau', '08', 12, 1, NULL),
(95, 'Kota Belud', '09', 12, 1, NULL),
(96, 'Tamparuli', '10', 12, 1, NULL),
(97, 'Penampang', '11', 12, 1, NULL),
(98, 'Papar', '12', 12, 1, NULL),
(99, 'Kudat', '13', 12, 1, NULL),
(100, 'Kota Marudu', '14', 12, 1, NULL),
(101, 'Pitas', '15', 12, 1, NULL),
(102, 'Beaufort/ DL Mampakur', '16', 12, 1, NULL),
(103, 'Menumbuk', '17', 12, 1, NULL),
(104, 'Sipitang', '18', 12, 1, NULL),
(105, 'Tenom', '19', 12, 1, NULL),
(106, 'Nabawan', '20', 12, 1, NULL),
(107, 'Keningau', '21', 12, 1, NULL),
(108, 'Tambunan', '22', 12, 1, NULL),
(109, 'Labuan (Sebelum 1.4.1984)', '23', 12, 1, NULL),
(110, 'Kunak', '24', 12, 1, NULL),
(111, 'Beluran', '25', 12, 1, NULL),
(112, 'Tenghilan', '26', 12, 1, NULL),
(113, 'Bundu Tuhan', '27', 12, 1, NULL),
(114, 'Menggatal/ Inanam', '28', 12, 1, NULL),
(115, 'Kinabatangan', '29', 12, 1, NULL),
(116, 'Banggi', '30', 12, 1, NULL),
(117, 'Tuaran', '31', 12, 1, NULL),
(118, 'Kuala Penyu', '32', 12, 1, NULL),
(119, 'Telupid', '33', 12, 1, NULL),
(120, 'Kuching', '01', 13, 1, NULL),
(121, 'Bau', '02', 13, 1, NULL),
(122, 'Serian', '03', 13, 1, NULL),
(123, 'Simunjan', '04', 13, 1, NULL),
(124, 'Lundu', '05', 13, 1, NULL),
(125, 'Simanggang', '06', 13, 1, NULL),
(126, 'Lubok Antu', '07', 13, 1, NULL),
(127, 'Saribas/ Betong', '08', 13, 1, NULL),
(128, 'Kalaka', '09', 13, 1, NULL),
(129, 'Sibu', '10', 13, 1, NULL),
(130, 'Mukah', '11', 13, 1, NULL),
(131, 'Kanowit', '12', 13, 1, NULL),
(132, 'Oya/ Dalat', '13', 13, 1, NULL),
(133, 'Miri', '14', 13, 1, NULL),
(134, 'Bintulu', '15', 13, 1, NULL),
(135, 'Baram/ Marudi', '16', 13, 1, NULL),
(136, 'Limbang', '17', 13, 1, NULL),
(137, 'Lawas', '18', 13, 1, NULL),
(138, 'Sarikei', '19', 13, 1, NULL),
(139, 'Bintangor', '20', 13, 1, NULL),
(140, 'Matu', '21', 13, 1, NULL),
(141, 'Julau', '22', 13, 1, NULL),
(142, 'Kapit', '23', 13, 1, NULL),
(143, 'Song', '24', 13, 1, NULL),
(144, 'Belaga', '25', 13, 1, NULL),
(145, 'Samarahan', '26', 13, 1, NULL),
(146, 'Meradong', '27', 13, 1, NULL),
(147, 'Sri Aman/ Simanggang', '28', 13, 1, NULL),
(148, 'Debak (Daerah Kecil)', '30', 13, 1, NULL),
(149, 'Siburan (Daerah Kecil)', '31', 13, 1, NULL),
(150, 'Budu (Daerah Kecil)', '33', 13, 1, NULL),
(151, 'Wilayah Persekutuan Kuala Lumpur', '01', 14, 1, NULL),
(152, 'Wilayah Persekutuan Labuan', '01', 15, 1, NULL),
(153, 'Wilayah Persekutuan Putrajaya', '01', 16, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_dun`
--

CREATE TABLE `tbl_gi_dun` (
  `ID` int(11) NOT NULL,
  `DUN` varchar(255) DEFAULT NULL,
  `DUNCode` varchar(255) DEFAULT NULL,
  `DUNState` int(11) DEFAULT NULL,
  `StatusDUN` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_dun`
--

INSERT INTO `tbl_gi_dun` (`ID`, `DUN`, `DUNCode`, `DUNState`, `StatusDUN`, `Remarks`) VALUES
(1, 'BULOH KASAP', 'N.01', 1, 1, NULL),
(2, 'JEMENTAH', 'N.02', 1, 1, NULL),
(3, 'PEMANIS', 'N.03', 1, 1, NULL),
(4, 'KEMELAH', 'N.04', 1, 1, NULL),
(5, 'TENANG', 'N.05', 1, 1, NULL),
(6, 'BEKOK', 'N.06', 1, 1, NULL),
(7, 'BUKIT KEPONG', 'N.07', 1, 1, NULL),
(8, 'BUKIT PASIR', 'N.08', 1, 1, NULL),
(9, 'GAMBIR', 'N.09', 1, 1, NULL),
(10, 'TANGKAK', 'N.10', 1, 1, NULL),
(11, 'SEROM', 'N.11', 1, 1, NULL),
(12, 'BENTAYAN', 'N.12', 1, 1, NULL),
(13, 'SIMPANG JERAM', 'N.13', 1, 1, NULL),
(14, 'BUKIT NANING', 'N.14', 1, 1, NULL),
(15, 'MAHARANI', 'N.15', 1, 1, NULL),
(16, 'SUNGAI BALANG', 'N.16', 1, 1, NULL),
(17, 'SEMERAH', 'N.17', 1, 1, NULL),
(18, 'SRI MEDAN', 'N.18', 1, 1, NULL),
(19, 'YONG PENG', 'N.19', 1, 1, NULL),
(20, 'SEMARANG', 'N.20', 1, 1, NULL),
(21, 'PARIT YAANI', 'N.21', 1, 1, NULL),
(22, 'PARIT RAJA', 'N.22', 1, 1, NULL),
(23, 'PENGGARAM', 'N.23', 1, 1, NULL),
(24, 'SENGGARANG', 'N.24', 1, 1, NULL),
(25, 'RENGIT', 'N.25', 1, 1, NULL),
(26, 'MACHAP', 'N.26', 1, 1, NULL),
(27, 'LAYANG-LAYANG', 'N.27', 1, 1, NULL),
(28, 'MENGKIBOL', 'N.28', 1, 1, NULL),
(29, 'MAHKOTA', 'N.29', 1, 1, NULL),
(30, 'PALOH', 'N.30', 1, 1, NULL),
(31, 'KAHANG', 'N.31', 1, 1, NULL),
(32, 'ENDAU', 'N.32', 1, 1, NULL),
(33, 'TENGGAROH', 'N.33', 1, 1, NULL),
(34, 'PANTI', 'N.34', 1, 1, NULL),
(35, 'PASIR RAJA', 'N.35', 1, 1, NULL),
(36, 'SEDILI', 'N.36', 1, 1, NULL),
(37, 'JOHOR LAMA', 'N.37', 1, 1, NULL),
(38, 'PENAWAR', 'N.38', 1, 1, NULL),
(39, 'TANJUNG SURAT', 'N.39', 1, 1, NULL),
(40, 'TIRAM', 'N.40', 1, 1, NULL),
(41, 'PUTERI WANGSA', 'N.41', 1, 1, NULL),
(42, 'JOHOR JAYA', 'N.42', 1, 1, NULL),
(43, 'PERMAS', 'N.43', 1, 1, NULL),
(44, 'LARKIN', 'N.44', 1, 1, NULL),
(45, 'STULANG', 'N.45', 1, 1, NULL),
(46, 'PERLING', 'N.46', 1, 1, NULL),
(47, 'KEMPAS', 'N.47', 1, 1, NULL),
(48, 'SKUDAI', 'N.48', 1, 1, NULL),
(49, 'KOTA ISKANDAR', 'N.49', 1, 1, NULL),
(50, 'BUKIT PERMAI', 'N.50', 1, 1, NULL),
(51, 'BUKIT BATU', 'N.51', 1, 1, NULL),
(52, 'SENAI', 'N.52', 1, 1, NULL),
(53, 'BENUT', 'N.53', 1, 1, NULL),
(54, 'PULAI SEBATANG', 'N.54', 1, 1, NULL),
(55, 'PEKAN NANAS', 'N.55', 1, 1, NULL),
(56, 'KUKUP', 'N.56', 1, 1, NULL),
(57, 'AYER HANGAT', 'N.01', 2, 1, NULL),
(58, 'KUAH', 'N.02', 2, 1, NULL),
(59, 'KOTA SIPUTEH', 'N.03', 2, 1, NULL),
(60, 'AYER HITAM', 'N.04', 2, 1, NULL),
(61, 'BUKIT KAYU HITAM', 'N.05', 2, 1, NULL),
(62, 'JITRA', 'N.06', 2, 1, NULL),
(63, 'KUALA NERANG', 'N.07', 2, 1, NULL),
(64, 'PEDU', 'N.08', 2, 1, NULL),
(65, 'BUKIT LADA', 'N.09', 2, 1, NULL),
(66, 'BUKIT PINANG', 'N.10', 2, 1, NULL),
(67, 'DERGA', 'N.11', 2, 1, NULL),
(68, 'SUKA MENANTI', 'N.12', 2, 1, NULL),
(69, 'KOTA DARUL AMAN', 'N.13', 2, 1, NULL),
(70, 'ALOR MENGKUDU', 'N.14', 2, 1, NULL),
(71, 'ANAK BUKIT', 'N.15', 2, 1, NULL),
(72, 'KUBANG ROTAN', 'N.16', 2, 1, NULL),
(73, 'PENGKALAN KUNDOR', 'N.17', 2, 1, NULL),
(74, 'TOKAI', 'N.18', 2, 1, NULL),
(75, 'SUNGAI TIANG', 'N.19', 2, 1, NULL),
(76, 'SUNGAI LIMAU', 'N.20', 2, 1, NULL),
(77, 'GUAR CHEMPEDAK', 'N.21', 2, 1, NULL),
(78, 'GURUN', 'N.22', 2, 1, NULL),
(79, 'BELANTEK', 'N.23', 2, 1, NULL),
(80, 'JENERI', 'N.24', 2, 1, NULL),
(81, 'BUKIT SELAMBAU', 'N.25', 2, 1, NULL),
(82, 'TANJONG DAWAI', 'N.26', 2, 1, NULL),
(83, 'PANTAI MERDEKA', 'N.27', 2, 1, NULL),
(84, 'BAKAR ARANG', 'N.28', 2, 1, NULL),
(85, 'SIDAM', 'N.29', 2, 1, NULL),
(86, 'BAYU', 'N.30', 2, 1, NULL),
(87, 'KUPANG', 'N.31', 2, 1, NULL),
(88, 'KUALA KETIL', 'N.32', 2, 1, NULL),
(89, 'MERBAU PULAS', 'N.33', 2, 1, NULL),
(90, 'LUNAS', 'N.34', 2, 1, NULL),
(91, 'KULIM', 'N.35', 2, 1, NULL),
(92, 'BANDAR BAHARU', 'N.36', 2, 1, NULL),
(93, 'PENGKALAN KUBOR', 'N.01', 3, 1, NULL),
(94, 'KELABORAN', 'N.02', 3, 1, NULL),
(95, 'PASIR PEKAN', 'N.03', 3, 1, NULL),
(96, 'WAKAF BHARU', 'N.04', 3, 1, NULL),
(97, 'KIJANG', 'N.05', 3, 1, NULL),
(98, 'CHEMPAKA', 'N.06', 3, 1, NULL),
(99, 'PANCHOR', 'N.07', 3, 1, NULL),
(100, 'TANJONG MAS', 'N.08', 3, 1, NULL),
(101, 'KOTA LAMA', 'N.09', 3, 1, NULL),
(102, 'BUNUT PAYONG', 'N.10', 3, 1, NULL),
(103, 'TENDONG', 'N.11', 3, 1, NULL),
(104, 'PENGKALAN PASIR', 'N.12', 3, 1, NULL),
(105, 'MERANTI', 'N.13', 3, 1, NULL),
(106, 'CHETOK', 'N.14', 3, 1, NULL),
(107, 'GUAL PERIOK', 'N.15', 3, 1, NULL),
(108, 'APAM PUTRA', 'N.16', 3, 1, NULL),
(109, 'SALOR', 'N.17', 3, 1, NULL),
(110, 'PASIR TUMBOH', 'N.18', 3, 1, NULL),
(111, 'DEMIT', 'N.19', 3, 1, NULL),
(112, 'TAWANG', 'N.20', 3, 1, NULL),
(113, 'PANTAI IRAMA', 'N.21', 3, 1, NULL),
(114, 'JELAWAT', 'N.22', 3, 1, NULL),
(115, 'MELOR', 'N.23', 3, 1, NULL),
(116, 'KADOK', 'N.24', 3, 1, NULL),
(117, 'KOK LANAS', 'N.25', 3, 1, NULL),
(118, 'BUKIT PANAU', 'N.26', 3, 1, NULL),
(119, 'GUAL IPOH', 'N.27', 3, 1, NULL),
(120, 'KEMAHANG', 'N.28', 3, 1, NULL),
(121, 'SELISING', 'N.29', 3, 1, NULL),
(122, 'LIMBONGAN', 'N.30', 3, 1, NULL),
(123, 'SEMERAK', 'N.31', 3, 1, NULL),
(124, 'GAAL', 'N.32', 3, 1, NULL),
(125, 'PULAI CHONDONG', 'N.33', 3, 1, NULL),
(126, 'TEMANGAN', 'N.34', 3, 1, NULL),
(127, 'KEMUNING', 'N.35', 3, 1, NULL),
(128, 'BUKIT BUNGA', 'N.36', 3, 1, NULL),
(129, 'AIR LANAS', 'N.37', 3, 1, NULL),
(130, 'KUALA BALAH', 'N.38', 3, 1, NULL),
(131, 'MENGKEBANG', 'N.39', 3, 1, NULL),
(132, 'GUCHIL', 'N.40', 3, 1, NULL),
(133, 'MANEK URAI', 'N.41', 3, 1, NULL),
(134, 'DABONG', 'N.42', 3, 1, NULL),
(135, 'NENGGIRI', 'N.43', 3, 1, NULL),
(136, 'PALOH', 'N.44', 3, 1, NULL),
(137, 'GALAS', 'N.45', 3, 1, NULL),
(138, 'KUALA LINGGI', 'N.01', 4, 1, NULL),
(139, 'TANJUNG BIDARA', 'N.02', 4, 1, NULL),
(140, 'AYER LIMAU', 'N.03', 4, 1, NULL),
(141, 'LENDU', 'N.04', 4, 1, NULL),
(142, 'TABOH NANING', 'N.05', 4, 1, NULL),
(143, 'REMBIA', 'N.06', 4, 1, NULL),
(144, 'GADEK', 'N.07', 4, 1, NULL),
(145, 'MACHAP JAYA', 'N.08', 4, 1, NULL),
(146, 'DURIAN TUNGGAL', 'N.09', 4, 1, NULL),
(147, 'ASAHAN', 'N.10', 4, 1, NULL),
(148, 'SUNGAI UDANG', 'N.11', 4, 1, NULL),
(149, 'PANTAI KUNDOR', 'N.12', 4, 1, NULL),
(150, 'PAYA RUMPUT', 'N.13', 4, 1, NULL),
(151, 'KELEBANG', 'N.14', 4, 1, NULL),
(152, 'PENGKALAN BATU', 'N.15', 4, 1, NULL),
(153, 'AYER KEROH', 'N.16', 4, 1, NULL),
(154, 'BUKIT KATIL', 'N.17', 4, 1, NULL),
(155, 'AYER MOLEK', 'N.18', 4, 1, NULL),
(156, 'KESIDANG', 'N.19', 4, 1, NULL),
(157, 'KOTA LAKSAMANA', 'N.20', 4, 1, NULL),
(158, 'DUYONG', 'N.21', 4, 1, NULL),
(159, 'BANDAR HILIR', 'N.22', 4, 1, NULL),
(160, 'TELOK MAS', 'N.23', 4, 1, NULL),
(161, 'BEMBAN', 'N.24', 4, 1, NULL),
(162, 'RIM', 'N.25', 4, 1, NULL),
(163, 'SERKAM', 'N.26', 4, 1, NULL),
(164, 'MERLIMAU', 'N.27', 4, 1, NULL),
(165, 'SUNGAI RAMBAI', 'N.28', 4, 1, NULL),
(166, 'CHENNAH', 'N.01', 5, 1, NULL),
(167, 'PERTANG', 'N.02', 5, 1, NULL),
(168, 'SUNGAI LUI', 'N.03', 5, 1, NULL),
(169, 'KLAWANG', 'N.04', 5, 1, NULL),
(170, 'SERTING', 'N.05', 5, 1, NULL),
(171, 'PALONG', 'N.06', 5, 1, NULL),
(172, 'JERAM PADANG', 'N.07', 5, 1, NULL),
(173, 'BAHAU', 'N.08', 5, 1, NULL),
(174, 'LENGGENG', 'N.09', 5, 1, NULL),
(175, 'NILAI', 'N.10', 5, 1, NULL),
(176, 'LOBAK', 'N.11', 5, 1, NULL),
(177, 'TEMIANG', 'N.12', 5, 1, NULL),
(178, 'SIKAMAT', 'N.13', 5, 1, NULL),
(179, 'AMPANGAN', 'N.14', 5, 1, NULL),
(180, 'JUASSEH', 'N.15', 5, 1, NULL),
(181, 'SERI MENANTI', 'N.16', 5, 1, NULL),
(182, 'SENALING', 'N.17', 5, 1, NULL),
(183, 'PILAH', 'N.18', 5, 1, NULL),
(184, 'JOHOL', 'N.19', 5, 1, NULL),
(185, 'LABU', 'N.20', 5, 1, NULL),
(186, 'BUKIT KEPAYANG', 'N.21', 5, 1, NULL),
(187, 'RAHANG', 'N.22', 5, 1, NULL),
(188, 'MAMBAU', 'N.23', 5, 1, NULL),
(189, 'SEREMBAN JAYA', 'N.24', 5, 1, NULL),
(190, 'PAROI', 'N.25', 5, 1, NULL),
(191, 'CHEMBONG', 'N.26', 5, 1, NULL),
(192, 'RANTAU', 'N.27', 5, 1, NULL),
(193, 'KOTA', 'N.28', 5, 1, NULL),
(194, 'CHUAH', 'N.29', 5, 1, NULL),
(195, 'LUKUT', 'N.30', 5, 1, NULL),
(196, 'BAGAN PINANG', 'N.31', 5, 1, NULL),
(197, 'LINGGI', 'N.32', 5, 1, NULL),
(198, 'SRI TANJUNG', 'N.33', 5, 1, NULL),
(199, 'GEMAS', 'N.34', 5, 1, NULL),
(200, 'GEMENCHEH', 'N.35', 5, 1, NULL),
(201, 'REPAH', 'N.36', 5, 1, NULL),
(202, 'TANAH RATA', 'N.01', 6, 1, NULL),
(203, 'JELAI', 'N.02', 6, 1, NULL),
(204, 'PADANG TENGKU', 'N.03', 6, 1, NULL),
(205, 'CHEKA', 'N.04', 6, 1, NULL),
(206, 'BENTA', 'N.05', 6, 1, NULL),
(207, 'BATU TALAM', 'N.06', 6, 1, NULL),
(208, 'TRAS', 'N.07', 6, 1, NULL),
(209, 'DONG', 'N.08', 6, 1, NULL),
(210, 'TAHAN', 'N.09', 6, 1, NULL),
(211, 'DAMAK', 'N.10', 6, 1, NULL),
(212, 'PULAU TAWAR', 'N.11', 6, 1, NULL),
(213, 'BESERAH', 'N.12', 6, 1, NULL),
(214, 'SEMAMBU', 'N.13', 6, 1, NULL),
(215, 'TERUNTUM', 'N.14', 6, 1, NULL),
(216, 'TANJUNG LUMPUR', 'N.15', 6, 1, NULL),
(217, 'INDERAPURA', 'N.16', 6, 1, NULL),
(218, 'SUNGAI LEMBING', 'N.17', 6, 1, NULL),
(219, 'LEPAR', 'N.18', 6, 1, NULL),
(220, 'PANCHING', 'N.19', 6, 1, NULL),
(221, 'PULAU MANIS', 'N.20', 6, 1, NULL),
(222, 'PERAMU JAYA', 'N.21', 6, 1, NULL),
(223, 'BEBAR', 'N.22', 6, 1, NULL),
(224, 'CHINI', 'N.23', 6, 1, NULL),
(225, 'LUIT', 'N.24', 6, 1, NULL),
(226, 'KUALA SENTUL', 'N.25', 6, 1, NULL),
(227, 'CHENOR', 'N.26', 6, 1, NULL),
(228, 'JENDERAK', 'N.27', 6, 1, NULL),
(229, 'KERDAU', 'N.28', 6, 1, NULL),
(230, 'JENGKA', 'N.29', 6, 1, NULL),
(231, 'MENTAKAB', 'N.30', 6, 1, NULL),
(232, 'LANCHANG', 'N.31', 6, 1, NULL),
(233, 'KUALA SEMANTAN', 'N.32', 6, 1, NULL),
(234, 'BILUT', 'N.33', 6, 1, NULL),
(235, 'KETARI', 'N.34', 6, 1, NULL),
(236, 'SABAI', 'N.35', 6, 1, NULL),
(237, 'PELANGAI', 'N.36', 6, 1, NULL),
(238, 'GUAI', 'N.37', 6, 1, NULL),
(239, 'TRIANG', 'N.38', 6, 1, NULL),
(240, 'KEMAYAN', 'N.39', 6, 1, NULL),
(241, 'BUKIT IBAM', 'N.40', 6, 1, NULL),
(242, 'MUADZAM SHAH', 'N.41', 6, 1, NULL),
(243, 'TIOMAN', 'N.42', 6, 1, NULL),
(244, 'PENAGA', 'N.01', 7, 1, NULL),
(245, 'BERTAM', 'N.02', 7, 1, NULL),
(246, 'PINANG TUNGGAL', 'N.03', 7, 1, NULL),
(247, 'PERMATANG BERANGAN', 'N.04', 7, 1, NULL),
(248, 'SUNGAI DUA', 'N.05', 7, 1, NULL),
(249, 'TELOK AYER TAWAR', 'N.06', 7, 1, NULL),
(250, 'SUNGAI PUYU', 'N.07', 7, 1, NULL),
(251, 'BAGAN JERMAL', 'N.08', 7, 1, NULL),
(252, 'BAGAN DALAM', 'N.09', 7, 1, NULL),
(253, 'SEBERANG JAYA', 'N.10', 7, 1, NULL),
(254, 'PERMATANG PASIR', 'N.11', 7, 1, NULL),
(255, 'PENANTI', 'N.12', 7, 1, NULL),
(256, 'BERAPIT', 'N.13', 7, 1, NULL),
(257, 'MACHANG BUBUK', 'N.14', 7, 1, NULL),
(258, 'PADANG LALANG', 'N.15', 7, 1, NULL),
(259, 'PERAI', 'N.16', 7, 1, NULL),
(260, 'BUKIT TENGAH', 'N.17', 7, 1, NULL),
(261, 'BUKIT TAMBUN', 'N.18', 7, 1, NULL),
(262, 'JAWI', 'N.19', 7, 1, NULL),
(263, 'SUNGAI BAKAP', 'N.20', 7, 1, NULL),
(264, 'SUNGAI ACHEH', 'N.21', 7, 1, NULL),
(265, 'TANJONG BUNGA', 'N.22', 7, 1, NULL),
(266, 'AIR PUTIH', 'N.23', 7, 1, NULL),
(267, 'KEBUN BUNGA', 'N.24', 7, 1, NULL),
(268, 'PULAU TIKUS', 'N.25', 7, 1, NULL),
(269, 'PADANG KOTA', 'N.26', 7, 1, NULL),
(270, 'PENGKALAN KOTA', 'N.27', 7, 1, NULL),
(271, 'KOMTAR', 'N.28', 7, 1, NULL),
(272, 'DATOK KERAMAT', 'N.29', 7, 1, NULL),
(273, 'SUNGAI PINANG', 'N.30', 7, 1, NULL),
(274, 'BATU LANCANG', 'N.31', 7, 1, NULL),
(275, 'SERI DELIMA', 'N.32', 7, 1, NULL),
(276, 'AIR ITAM', 'N.33', 7, 1, NULL),
(277, 'PAYA TERUBONG', 'N.34', 7, 1, NULL),
(278, 'BATU UBAN', 'N.35', 7, 1, NULL),
(279, 'PANTAI JEREJAK', 'N.36', 7, 1, NULL),
(280, 'BATU MAUNG', 'N.37', 7, 1, NULL),
(281, 'BAYAN LEPAS', 'N.38', 7, 1, NULL),
(282, 'PULAU BETONG', 'N.39', 7, 1, NULL),
(283, 'TELOK BAHANG', 'N.40', 7, 1, NULL),
(284, 'PENGKALAN HULU', 'N.01', 8, 1, NULL),
(285, 'TEMENGOR', 'N.02', 8, 1, NULL),
(286, 'KENERING', 'N.03', 8, 1, NULL),
(287, 'KOTA TAMPAN', 'N.04', 8, 1, NULL),
(288, 'SELAMA', 'N.05', 8, 1, NULL),
(289, 'KUBU GAJAH', 'N.06', 8, 1, NULL),
(290, 'BATU KURAU', 'N.07', 8, 1, NULL),
(291, 'TITI SERONG', 'N.08', 8, 1, NULL),
(292, 'KUALA KURAU', 'N.09', 8, 1, NULL),
(293, 'ALOR PONGSU', 'N.10', 8, 1, NULL),
(294, 'GUNONG SEMANGGOL', 'N.11', 8, 1, NULL),
(295, 'SELINSING', 'N.12', 8, 1, NULL),
(296, 'KUALA SEPETANG', 'N.13', 8, 1, NULL),
(297, 'CHANGKAT JERING', 'N.14', 8, 1, NULL),
(298, 'TRONG', 'N.15', 8, 1, NULL),
(299, 'KAMUNTING', 'N.16', 8, 1, NULL),
(300, 'POKOK ASSAM', 'N.17', 8, 1, NULL),
(301, 'AULONG', 'N.18', 8, 1, NULL),
(302, 'CHENDEROH', 'N.19', 8, 1, NULL),
(303, 'LUBOK MERBAU', 'N.20', 8, 1, NULL),
(304, 'LINTANG', 'N.21', 8, 1, NULL),
(305, 'JALONG', 'N.22', 8, 1, NULL),
(306, 'MANJOI', 'N.23', 8, 1, NULL),
(307, 'HULU KINTA', 'N.24', 8, 1, NULL),
(308, 'CANNING', 'N.25', 8, 1, NULL),
(309, 'TEBING TINGGI', 'N.26', 8, 1, NULL),
(310, 'PASIR PINJI', 'N.27', 8, 1, NULL),
(311, 'BERCHAM', 'N.28', 8, 1, NULL),
(312, 'KEPAYANG', 'N.29', 8, 1, NULL),
(313, 'BUNTONG', 'N.30', 8, 1, NULL),
(314, 'JELAPANG', 'N.31', 8, 1, NULL),
(315, 'MENGLEMBU', 'N.32', 8, 1, NULL),
(316, 'TRONOH', 'N.33', 8, 1, NULL),
(317, 'BUKIT CHANDAN', 'N.34', 8, 1, NULL),
(318, 'MANONG', 'N.35', 8, 1, NULL),
(319, 'PENGKALAN BAHARU', 'N.36', 8, 1, NULL),
(320, 'PANTAI REMIS', 'N.37', 8, 1, NULL),
(321, 'ASTAKA', 'N.38', 8, 1, NULL),
(322, 'BELANJA', 'N.39', 8, 1, NULL),
(323, 'BOTA', 'N.40', 8, 1, NULL),
(324, 'MALIM NAWAR', 'N.41', 8, 1, NULL),
(325, 'KERANJI', 'N.42', 8, 1, NULL),
(326, 'TUALANG SEKAH', 'N.43', 8, 1, NULL),
(327, 'SUNGAI RAPAT', 'N.44', 8, 1, NULL),
(328, 'SIMPANG PULAI', 'N.45', 8, 1, NULL),
(329, 'TEJA', 'N.46', 8, 1, NULL),
(330, 'CHENDERIANG', 'N.47', 8, 1, NULL),
(331, 'AYER KUNING', 'N.48', 8, 1, NULL),
(332, 'SUNGAI MANIK', 'N.49', 8, 1, NULL),
(333, 'KAMPONG GAJAH', 'N.50', 8, 1, NULL),
(334, 'PASIR PANJANG', 'N.51', 8, 1, NULL),
(335, 'PANGKOR', 'N.52', 8, 1, NULL),
(336, 'RUNGKUP', 'N.53', 8, 1, NULL),
(337, 'HUTAN MELINTANG', 'N.54', 8, 1, NULL),
(338, 'PASIR BEDAMAR', 'N.55', 8, 1, NULL),
(339, 'CHANGKAT JONG', 'N.56', 8, 1, NULL),
(340, 'SUNGKAI', 'N.57', 8, 1, NULL),
(341, 'SLIM', 'N.58', 8, 1, NULL),
(342, 'BEHRANG', 'N.59', 8, 1, NULL),
(343, 'TITI TINGGI', 'N.01', 9, 1, NULL),
(344, 'BESERI', 'N.02', 9, 1, NULL),
(345, 'CHUPING', 'N.03', 9, 1, NULL),
(346, 'MATA AYER', 'N.04', 9, 1, NULL),
(347, 'SANTAN', 'N.05', 9, 1, NULL),
(348, 'BINTONG', 'N.06', 9, 1, NULL),
(349, 'SENA', 'N.07', 9, 1, NULL),
(350, 'INDERA KAYANGAN', 'N.08', 9, 1, NULL),
(351, 'KUALA PERLIS', 'N.09', 9, 1, NULL),
(352, 'KAYANG', 'N.10', 9, 1, NULL),
(353, 'PAUH', 'N.11', 9, 1, NULL),
(354, 'TAMBUN TULANG', 'N.12', 9, 1, NULL),
(355, 'GUAR SANJI', 'N.13', 9, 1, NULL),
(356, 'SIMPANG EMPAT', 'N.14', 9, 1, NULL),
(357, 'SANGLANG', 'N.15', 9, 1, NULL),
(358, 'SUNGAI AIR TAWAR', 'N.01', 10, 1, NULL),
(359, 'SABAK', 'N.02', 10, 1, NULL),
(360, 'SUNGAI PANJANG', 'N.03', 10, 1, NULL),
(361, 'SEKINCHAN', 'N.04', 10, 1, NULL),
(362, 'HULU BERNAM', 'N.05', 10, 1, NULL),
(363, 'KUALA KUBU BAHARU', 'N.06', 10, 1, NULL),
(364, 'BATANG KALI', 'N.07', 10, 1, NULL),
(365, 'SUNGAI BURONG', 'N.08', 10, 1, NULL),
(366, 'PERMATANG', 'N.09', 10, 1, NULL),
(367, 'BUKIT MELAWATI', 'N.10', 10, 1, NULL),
(368, 'IJOK', 'N.11', 10, 1, NULL),
(369, 'JERAM', 'N.12', 10, 1, NULL),
(370, 'KUANG', 'N.13', 10, 1, NULL),
(371, 'RAWANG', 'N.14', 10, 1, NULL),
(372, 'TAMAN TEMPLER', 'N.15', 10, 1, NULL),
(373, 'SUNGAI TUA', 'N.16', 10, 1, NULL),
(374, 'GOMBAK SETIA', 'N.17', 10, 1, NULL),
(375, 'HULU KELANG', 'N.18', 10, 1, NULL),
(376, 'BUKIT ANTARABANGSA', 'N.19', 10, 1, NULL),
(377, 'LEMBAH JAYA', 'N.20', 10, 1, NULL),
(378, 'PANDAN INDAH', 'N.21', 10, 1, NULL),
(379, 'TERATAI', 'N.22', 10, 1, NULL),
(380, 'DUSUN TUA', 'N.23', 10, 1, NULL),
(381, 'SEMENYIH', 'N.24', 10, 1, NULL),
(382, 'KAJANG', 'N.25', 10, 1, NULL),
(383, 'SUNGAI RAMAL', 'N.26', 10, 1, NULL),
(384, 'BALAKONG', 'N.27', 10, 1, NULL),
(385, 'SERI KEMBANGAN', 'N.28', 10, 1, NULL),
(386, 'SERI SERDANG', 'N.29', 10, 1, NULL),
(387, 'KINRARA', 'N.30', 10, 1, NULL),
(388, 'SUBANG JAYA', 'N.31', 10, 1, NULL),
(389, 'SERI SETIA', 'N.32', 10, 1, NULL),
(390, 'TAMAN MEDAN', 'N.33', 10, 1, NULL),
(391, 'BUKIT GASING', 'N.34', 10, 1, NULL),
(392, 'KAMPUNG TUNKU', 'N.35', 10, 1, NULL),
(393, 'BANDAR UTAMA', 'N.36', 10, 1, NULL),
(394, 'BUKIT LANJAN', 'N.37', 10, 1, NULL),
(395, 'PAYA JARAS', 'N.38', 10, 1, NULL),
(396, 'KOTA DAMANSARA', 'N.39', 10, 1, NULL),
(397, 'KOTA ANGGERIK', 'N.40', 10, 1, NULL),
(398, 'BATU TIGA', 'N.41', 10, 1, NULL),
(399, 'MERU', 'N.42', 10, 1, NULL),
(400, 'SEMENTA', 'N.43', 10, 1, NULL),
(401, 'SELAT KLANG', 'N.44', 10, 1, NULL),
(402, 'BANDAR BARU KLANG', 'N.45', 10, 1, NULL),
(403, 'PELABUHAN KLANG', 'N.46', 10, 1, NULL),
(404, 'PANDAMARAN', 'N.47', 10, 1, NULL),
(405, 'SENTOSA', 'N.48', 10, 1, NULL),
(406, 'SUNGAI KANDIS', 'N.49', 10, 1, NULL),
(407, 'KOTA KEMUNING', 'N.50', 10, 1, NULL),
(408, 'SIJANGKANG', 'N.51', 10, 1, NULL),
(409, 'BANTING', 'N.52', 10, 1, NULL),
(410, 'MORIB', 'N.53', 10, 1, NULL),
(411, 'TANJONG SEPAT', 'N.54', 10, 1, NULL),
(412, 'DENGKIL', 'N.55', 10, 1, NULL),
(413, 'SUNGAI PELEK', 'N.56', 10, 1, NULL),
(414, 'KUALA BESUT', 'N.01', 11, 1, NULL),
(415, 'KOTA PUTERA', 'N.02', 11, 1, NULL),
(416, 'JERTIH', 'N.03', 11, 1, NULL),
(417, 'HULU BESUT', 'N.04', 11, 1, NULL),
(418, 'JABI', 'N.05', 11, 1, NULL),
(419, 'PERMAISURI', 'N.06', 11, 1, NULL),
(420, 'LANGKAP', 'N.07', 11, 1, NULL),
(421, 'BATU RAKIT', 'N.08', 11, 1, NULL),
(422, 'TEPUH', 'N.09', 11, 1, NULL),
(423, 'BULUH GADING', 'N.10', 11, 1, NULL),
(424, 'SEBERANG TAKIR', 'N.11', 11, 1, NULL),
(425, 'BUKIT TUNGGAL', 'N.12', 11, 1, NULL),
(426, 'WAKAF MEMPELAM', 'N.13', 11, 1, NULL),
(427, 'BANDAR', 'N.14', 11, 1, NULL),
(428, 'LADANG', 'N.15', 11, 1, NULL),
(429, 'BATU BURUK', 'N.16', 11, 1, NULL),
(430, 'ALUR LIMBAT', 'N.17', 11, 1, NULL),
(431, 'BUKIT PAYUNG', 'N.18', 11, 1, NULL),
(432, 'RU RENDANG', 'N.19', 11, 1, NULL),
(433, 'PENGKALAN BERANGAN', 'N.20', 11, 1, NULL),
(434, 'TELEMUNG', 'N.21', 11, 1, NULL),
(435, 'MANIR', 'N.22', 11, 1, NULL),
(436, 'KUALA BERANG', 'N.23', 11, 1, NULL),
(437, 'AJIL', 'N.24', 11, 1, NULL),
(438, 'BUKIT BESI', 'N.25', 11, 1, NULL),
(439, 'RANTAU ABANG', 'N.26', 11, 1, NULL),
(440, 'SURA', 'N.27', 11, 1, NULL),
(441, 'PAKA', 'N.28', 11, 1, NULL),
(442, 'KEMASIK', 'N.29', 11, 1, NULL),
(443, 'KIJAL', 'N.30', 11, 1, NULL),
(444, 'CUKAI', 'N.31', 11, 1, NULL),
(445, 'AIR PUTIH', 'N.32', 11, 1, NULL),
(446, 'BANGGI', 'N.01', 12, 1, NULL),
(447, 'TANJONG KAPOR', 'N.02', 12, 1, NULL),
(448, 'PITAS', 'N.03', 12, 1, NULL),
(449, 'MATUNGGONG', 'N.04', 12, 1, NULL),
(450, 'TANDEK', 'N.05', 12, 1, NULL),
(451, 'TEMPASUK', 'N.06', 12, 1, NULL),
(452, 'KADAMAIAN', 'N.07', 12, 1, NULL),
(453, 'USUKAN', 'N.08', 12, 1, NULL),
(454, 'TAMPARULI', 'N.09', 12, 1, NULL),
(455, 'SULAMAN', 'N.10', 12, 1, NULL),
(456, 'KIULU', 'N.11', 12, 1, NULL),
(457, 'KARAMBUNAI', 'N.12', 12, 1, NULL),
(458, 'INANAM', 'N.13', 12, 1, NULL),
(459, 'LIKAS', 'N.14', 12, 1, NULL),
(460, 'API-API', 'N.15', 12, 1, NULL),
(461, 'LUYANG', 'N.16', 12, 1, NULL),
(462, 'TANJONG ARU', 'N.17', 12, 1, NULL),
(463, 'PETAGAS', 'N.18', 12, 1, NULL),
(464, 'KAPAYAN', 'N.19', 12, 1, NULL),
(465, 'MOYOG', 'N.20', 12, 1, NULL),
(466, 'KAWANG', 'N.21', 12, 1, NULL),
(467, 'PANTAI MANIS', 'N.22', 12, 1, NULL),
(468, 'BONGAWAN', 'N.23', 12, 1, NULL),
(469, 'MEMBAKUT', 'N.24', 12, 1, NULL),
(470, 'KLIAS', 'N.25', 12, 1, NULL),
(471, 'KUALA PENYU', 'N.26', 12, 1, NULL),
(472, 'LUMADAN', 'N.27', 12, 1, NULL),
(473, 'SINDUMIN', 'N.28', 12, 1, NULL),
(474, 'KUNDASANG', 'N.29', 12, 1, NULL),
(475, 'KARANAAN', 'N.30', 12, 1, NULL),
(476, 'PAGINATAN', 'N.31', 12, 1, NULL),
(477, 'TAMBUNAN', 'N.32', 12, 1, NULL),
(478, 'BINGKOR', 'N.33', 12, 1, NULL),
(479, 'LIAWAN', 'N.34', 12, 1, NULL),
(480, 'MELALAP', 'N.35', 12, 1, NULL),
(481, 'KEMABONG', 'N.36', 12, 1, NULL),
(482, 'SOOK', 'N.37', 12, 1, NULL),
(483, 'NABAWAN', 'N.38', 12, 1, NULL),
(484, 'SUGUT', 'N.39', 12, 1, NULL),
(485, 'LABUK', 'N.40', 12, 1, NULL),
(486, 'GUM-GUM', 'N.41', 12, 1, NULL),
(487, 'SUNGAI SIBUGA', 'N.42', 12, 1, NULL),
(488, 'SEKONG', 'N.43', 12, 1, NULL),
(489, 'KARAMUNTING', 'N.44', 12, 1, NULL),
(490, 'ELOPURA', 'N.45', 12, 1, NULL),
(491, 'TANJONG PAPAT', 'N.46', 12, 1, NULL),
(492, 'KUAMUT', 'N.47', 12, 1, NULL),
(493, 'SUKAU', 'N.48', 12, 1, NULL),
(494, 'TUNGKU', 'N.49', 12, 1, NULL),
(495, 'LAHAD DATU', 'N.50', 12, 1, NULL),
(496, 'KUNAK', 'N.51', 12, 1, NULL),
(497, 'SULABAYAN', 'N.52', 12, 1, NULL),
(498, 'SENALLANG', 'N.53', 12, 1, NULL),
(499, 'BUGAYA', 'N.54', 12, 1, NULL),
(500, 'BALUNG', 'N.55', 12, 1, NULL),
(501, 'APAS', 'N.56', 12, 1, NULL),
(502, 'SRI TANJONG', 'N.57', 12, 1, NULL),
(503, 'MEROTAI', 'N.58', 12, 1, NULL),
(504, 'TANJONG BATU', 'N.59', 12, 1, NULL),
(505, 'SEBATIK', 'N.60', 12, 1, NULL),
(506, 'OPAR', 'N.01', 13, 1, NULL),
(507, 'TASIK BIRU', 'N.02', 13, 1, NULL),
(508, 'TANJONG DATU', 'N.03', 13, 1, NULL),
(509, 'PANTAI DAMAI', 'N.04', 13, 1, NULL),
(510, 'DEMAK LAUT', 'N.05', 13, 1, NULL),
(511, 'TUPONG', 'N.06', 13, 1, NULL),
(512, 'SAMARIANG', 'N.07', 13, 1, NULL),
(513, 'SATOK', 'N.08', 13, 1, NULL),
(514, 'PADUNGAN', 'N.09', 13, 1, NULL),
(515, 'PENDING', 'N.10', 13, 1, NULL),
(516, 'BATU LINTANG', 'N.11', 13, 1, NULL),
(517, 'KOTA SENTOSA', 'N.12', 13, 1, NULL),
(518, 'BATU KITANG', 'N.13', 13, 1, NULL),
(519, 'BATU KAWAH', 'N.14', 13, 1, NULL),
(520, 'ASAJAYA', 'N.15', 13, 1, NULL),
(521, 'MUARA TUANG', 'N.16', 13, 1, NULL),
(522, 'STAKAN', 'N.17', 13, 1, NULL),
(523, 'SEREMBU', 'N.18', 13, 1, NULL),
(524, 'MAMBONG', 'N.19', 13, 1, NULL),
(525, 'TARAT', 'N.20', 13, 1, NULL),
(526, 'TEBEDU', 'N.21', 13, 1, NULL),
(527, 'KEDUP', 'N.22', 13, 1, NULL),
(528, 'BUKIT SEMUJA', 'N.23', 13, 1, NULL),
(529, 'SADONG JAYA', 'N.24', 13, 1, NULL),
(530, 'SIMUNJAN', 'N.25', 13, 1, NULL),
(531, 'GEDONG', 'N.26', 13, 1, NULL),
(532, 'SEBUYAU', 'N.27', 13, 1, NULL),
(533, 'LINGGA', 'N.28', 13, 1, NULL),
(534, 'BETING MARO', 'N.29', 13, 1, NULL),
(535, 'BALAI RINGIN', 'N.30', 13, 1, NULL),
(536, 'BUKIT BEGUNAN', 'N.31', 13, 1, NULL),
(537, 'SIMANGGANG', 'N.32', 13, 1, NULL),
(538, 'ENGKILILI', 'N.33', 13, 1, NULL),
(539, 'BATANG AI', 'N.34', 13, 1, NULL),
(540, 'SARIBAS', 'N.35', 13, 1, NULL),
(541, 'LAYAR', 'N.36', 13, 1, NULL),
(542, 'BUKIT SABAN', 'N.37', 13, 1, NULL),
(543, 'KALAKA', 'N.38', 13, 1, NULL),
(544, 'KRIAN', 'N.39', 13, 1, NULL),
(545, 'KABONG', 'N.40', 13, 1, NULL),
(546, 'KUALA RAJANG', 'N.41', 13, 1, NULL),
(547, 'SEMOP', 'N.42', 13, 1, NULL),
(548, 'DARO', 'N.43', 13, 1, NULL),
(549, 'JEMORENG', 'N.44', 13, 1, NULL),
(550, 'REPOK', 'N.45', 13, 1, NULL),
(551, 'MERADONG', 'N.46', 13, 1, NULL),
(552, 'PAKAN', 'N.47', 13, 1, NULL),
(553, 'MELUAN', 'N.48', 13, 1, NULL),
(554, 'NGEMAH', 'N.49', 13, 1, NULL),
(555, 'MACHAN', 'N.50', 13, 1, NULL),
(556, 'BUKIT ASSEK', 'N.51', 13, 1, NULL),
(557, 'DUDONG', 'N.52', 13, 1, NULL),
(558, 'BAWANG ASSAN', 'N.53', 13, 1, NULL),
(559, 'PELAWAN', 'N.54', 13, 1, NULL),
(560, 'NANGKA', 'N.55', 13, 1, NULL),
(561, 'DALAT', 'N.56', 13, 1, NULL),
(562, 'TELLIAN', 'N.57', 13, 1, NULL),
(563, 'BALINGIAN', 'N.58', 13, 1, NULL),
(564, 'TAMIN', 'N.59', 13, 1, NULL),
(565, 'KAKUS', 'N.60', 13, 1, NULL),
(566, 'PELAGUS', 'N.61', 13, 1, NULL),
(567, 'KATIBAS', 'N.62', 13, 1, NULL),
(568, 'BUKIT GORAM', 'N.63', 13, 1, NULL),
(569, 'BALEH', 'N.64', 13, 1, NULL),
(570, 'BELAGA', 'N.65', 13, 1, NULL),
(571, 'MURUM', 'N.66', 13, 1, NULL),
(572, 'JEPAK', 'N.67', 13, 1, NULL),
(573, 'TANJONG BATU', 'N.68', 13, 1, NULL),
(574, 'KEMENA', 'N.69', 13, 1, NULL),
(575, 'SAMALAJU', 'N.70', 13, 1, NULL),
(576, 'BEKENU', 'N.71', 13, 1, NULL),
(577, 'LAMBIR', 'N.72', 13, 1, NULL),
(578, 'PIASAU', 'N.73', 13, 1, NULL),
(579, 'PUJUT', 'N.74', 13, 1, NULL),
(580, 'SENADIN', 'N.75', 13, 1, NULL),
(581, 'MARUDI', 'N.76', 13, 1, NULL),
(582, 'TELANG USAN', 'N.77', 13, 1, NULL),
(583, 'MULU', 'N.78', 13, 1, NULL),
(584, 'BUKIT KOTA', 'N.79', 13, 1, NULL),
(585, 'BATU DANAU', 'N.80', 13, 1, NULL),
(586, 'BA\'KELALAN', 'N.81', 13, 1, NULL),
(587, 'BUKIT SARI', 'N.82', 13, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_parlimen`
--

CREATE TABLE `tbl_gi_parlimen` (
  `ID` int(11) NOT NULL,
  `Parlimen` varchar(255) DEFAULT NULL,
  `ParlimenCode` varchar(255) DEFAULT NULL,
  `ParlimenState` int(11) DEFAULT NULL,
  `StatusParlimen` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_parlimen`
--

INSERT INTO `tbl_gi_parlimen` (`ID`, `Parlimen`, `ParlimenCode`, `ParlimenState`, `StatusParlimen`, `Remarks`) VALUES
(1, 'SEGAMAT', 'P.140', 1, 1, NULL),
(2, 'SEKIJANG', 'P.141', 1, 1, NULL),
(3, 'LABIS', 'P.142', 1, 1, NULL),
(4, 'PAGOH', 'P.143', 1, 1, NULL),
(5, 'LEDANG', 'P.144', 1, 1, NULL),
(6, 'BAKRI', 'P.145', 1, 1, NULL),
(7, 'MUAR', 'P.146', 1, 1, NULL),
(8, 'PARIT SULONG', 'P.147', 1, 1, NULL),
(9, 'AYER HITAM', 'P.148', 1, 1, NULL),
(10, 'SRI GADING', 'P.149', 1, 1, NULL),
(11, 'BATU PAHAT', 'P.150', 1, 1, NULL),
(12, 'SIMPANG RENGGAM', 'P.151', 1, 1, NULL),
(13, 'KLUANG', 'P.152', 1, 1, NULL),
(14, 'SEMBRONG', 'P.153', 1, 1, NULL),
(15, 'MERSING', 'P.154', 1, 1, NULL),
(16, 'TENGGARA', 'P.155', 1, 1, NULL),
(17, 'KOTA TINGGI', 'P.156', 1, 1, NULL),
(18, 'PENGERANG', 'P.157', 1, 1, NULL),
(19, 'TEBRAU', 'P.158', 1, 1, NULL),
(20, 'PASIR GUDANG', 'P.159', 1, 1, NULL),
(21, 'JOHOR BAHRU', 'P.160', 1, 1, NULL),
(22, 'PULAI', 'P.161', 1, 1, NULL),
(23, 'ISKANDAR PUTERI', 'P.162', 1, 1, NULL),
(24, 'KULAI', 'P.163', 1, 1, NULL),
(25, 'PONTIAN', 'P.164', 1, 1, NULL),
(26, 'TANJUNG PIAI', 'P.165', 1, 1, NULL),
(27, 'LANGKAWI', 'P.004', 2, 1, NULL),
(28, 'JERLUN', 'P.005', 2, 1, NULL),
(29, 'KUBANG PASU', 'P.006', 2, 1, NULL),
(30, 'PADANG TERAP', 'P.007', 2, 1, NULL),
(31, 'POKOK SENA', 'P.008', 2, 1, NULL),
(32, 'ALOR SETAR', 'P.009', 2, 1, NULL),
(33, 'KUALA KEDAH', 'P.010', 2, 1, NULL),
(34, 'PENDANG', 'P.011', 2, 1, NULL),
(35, 'JERAI', 'P.012', 2, 1, NULL),
(36, 'SIK', 'P.013', 2, 1, NULL),
(37, 'MERBOK', 'P.014', 2, 1, NULL),
(38, 'SUNGAI PETANI', 'P.015', 2, 1, NULL),
(39, 'BALING', 'P.016', 2, 1, NULL),
(40, 'PADANG SERAI', 'P.017', 2, 1, NULL),
(41, 'KULIM-BANDAR BAHARU', 'P.018', 2, 1, NULL),
(42, 'TUMPAT', 'P.019', 3, 1, NULL),
(43, 'PENGKALAN CHEPA', 'P.020', 3, 1, NULL),
(44, 'KOTA BHARU', 'P.021', 3, 1, NULL),
(45, 'PASIR MAS', 'P.022', 3, 1, NULL),
(46, 'RANTAU PANJANG', 'P.023', 3, 1, NULL),
(47, 'KUBANG KERIAN', 'P.024', 3, 1, NULL),
(48, 'BACHOK', 'P.025', 3, 1, NULL),
(49, 'KETEREH', 'P.026', 3, 1, NULL),
(50, 'TANAH MERAH', 'P.027', 3, 1, NULL),
(51, 'PASIR PUTEH', 'P.028', 3, 1, NULL),
(52, 'MACHANG', 'P.029', 3, 1, NULL),
(53, 'JELI', 'P.030', 3, 1, NULL),
(54, 'KUALA KRAI', 'P.031', 3, 1, NULL),
(55, 'GUA MUSANG', 'P.032', 3, 1, NULL),
(56, 'MASJID TANAH', 'P.134', 4, 1, NULL),
(57, 'ALOR GAJAH', 'P.135', 4, 1, NULL),
(58, 'TANGGA BATU', 'P.136', 4, 1, NULL),
(59, 'HANG TUAH JAYA', 'P.137', 4, 1, NULL),
(60, 'KOTA MELAKA', 'P.138', 4, 1, NULL),
(61, 'JASIN', 'P.139', 4, 1, NULL),
(62, 'JELEBU', 'P.126', 5, 1, NULL),
(63, 'JEMPOL', 'P.127', 5, 1, NULL),
(64, 'SEREMBAN', 'P.128', 5, 1, NULL),
(65, 'KUALA PILAH', 'P.129', 5, 1, NULL),
(66, 'RASAH', 'P.130', 5, 1, NULL),
(67, 'REMBAU', 'P.131', 5, 1, NULL),
(68, 'PORT DICKSON', 'P.132', 5, 1, NULL),
(69, 'TAMPIN', 'P.133', 5, 1, NULL),
(70, 'CAMERON HIGHLANDS', 'P.078', 6, 1, NULL),
(71, 'LIPIS', 'P.079', 6, 1, NULL),
(72, 'RAUB', 'P.080', 6, 1, NULL),
(73, 'JERANTUT', 'P.081', 6, 1, NULL),
(74, 'INDERA MAHKOTA', 'P.082', 6, 1, NULL),
(75, 'KUANTAN', 'P.083', 6, 1, NULL),
(76, 'PAYA BESAR', 'P.084', 6, 1, NULL),
(77, 'PEKAN', 'P.085', 6, 1, NULL),
(78, 'MARAN', 'P.086', 6, 1, NULL),
(79, 'KUALA KRAU', 'P.087', 6, 1, NULL),
(80, 'TEMERLOH', 'P.088', 6, 1, NULL),
(81, 'BENTONG', 'P.089', 6, 1, NULL),
(82, 'BERA', 'P.090', 6, 1, NULL),
(83, 'ROMPIN', 'P.091', 6, 1, NULL),
(84, 'KEPALA BATAS', 'P.041', 7, 1, NULL),
(85, 'TASEK GELUGOR', 'P.042', 7, 1, NULL),
(86, 'BAGAN', 'P.043', 7, 1, NULL),
(87, 'PERMATANG PAUH', 'P.044', 7, 1, NULL),
(88, 'BUKIT MERTAJAM', 'P.045', 7, 1, NULL),
(89, 'BATU KAWAN', 'P.046', 7, 1, NULL),
(90, 'NIBONG TEBAL', 'P.047', 7, 1, NULL),
(91, 'BUKIT BENDERA', 'P.048', 7, 1, NULL),
(92, 'TANJONG', 'P.049', 7, 1, NULL),
(93, 'JELUTONG', 'P.050', 7, 1, NULL),
(94, 'BUKIT GELUGOR', 'P.051', 7, 1, NULL),
(95, 'BAYAN BARU', 'P.052', 7, 1, NULL),
(96, 'BALIK PULAU', 'P.053', 7, 1, NULL),
(97, 'GERIK', 'P.054', 8, 1, NULL),
(98, 'LENGGONG', 'P.055', 8, 1, NULL),
(99, 'LARUT', 'P.056', 8, 1, NULL),
(100, 'PARIT BUNTAR', 'P.057', 8, 1, NULL),
(101, 'BAGAN SERAI', 'P.058', 8, 1, NULL),
(102, 'BUKIT GANTANG', 'P.059', 8, 1, NULL),
(103, 'TAIPING', 'P.060', 8, 1, NULL),
(104, 'PADANG RENGAS', 'P.061', 8, 1, NULL),
(105, 'SUNGAI SIPUT', 'P.062', 8, 1, NULL),
(106, 'TAMBUN', 'P.063', 8, 1, NULL),
(107, 'IPOH TIMOR', 'P.064', 8, 1, NULL),
(108, 'IPOH BARAT', 'P.065', 8, 1, NULL),
(109, 'BATU GAJAH', 'P.066', 8, 1, NULL),
(110, 'KUALA KANGSAR', 'P.067', 8, 1, NULL),
(111, 'BERUAS', 'P.068', 8, 1, NULL),
(112, 'PARIT', 'P.069', 8, 1, NULL),
(113, 'KAMPAR', 'P.070', 8, 1, NULL),
(114, 'GOPENG', 'P.071', 8, 1, NULL),
(115, 'TAPAH', 'P.072', 8, 1, NULL),
(116, 'PASIR SALAK', 'P.073', 8, 1, NULL),
(117, 'LUMUT', 'P.074', 8, 1, NULL),
(118, 'BAGAN DATUK', 'P.075', 8, 1, NULL),
(119, 'TELUK INTAN', 'P.076', 8, 1, NULL),
(120, 'TANJONG MALIM', 'P.077', 8, 1, NULL),
(121, 'PADANG BESAR', 'P.001', 9, 1, NULL),
(122, 'KANGAR', 'P.002', 9, 1, NULL),
(123, 'ARAU', 'P.003', 9, 1, NULL),
(124, 'SABAK BERNAM', 'P.092', 10, 1, NULL),
(125, 'SUNGAI BESAR', 'P.093', 10, 1, NULL),
(126, 'HULU SELANGOR', 'P.094', 10, 1, NULL),
(127, 'TANJONG KARANG', 'P.095', 10, 1, NULL),
(128, 'KUALA SELANGOR', 'P.096', 10, 1, NULL),
(129, 'SELAYANG', 'P.097', 10, 1, NULL),
(130, 'GOMBAK', 'P.098', 10, 1, NULL),
(131, 'AMPANG', 'P.099', 10, 1, NULL),
(132, 'PANDAN', 'P.100', 10, 1, NULL),
(133, 'HULU LANGAT', 'P.101', 10, 1, NULL),
(134, 'BANGI', 'P.102', 10, 1, NULL),
(135, 'PUCHONG', 'P.103', 10, 1, NULL),
(136, 'SUBANG', 'P.104', 10, 1, NULL),
(137, 'PETALING JAYA', 'P.105', 10, 1, NULL),
(138, 'DAMANSARA', 'P.106', 10, 1, NULL),
(139, 'SUNGAI BULOH', 'P.107', 10, 1, NULL),
(140, 'SHAH ALAM', 'P.108', 10, 1, NULL),
(141, 'KAPAR', 'P.109', 10, 1, NULL),
(142, 'KLANG', 'P.110', 10, 1, NULL),
(143, 'KOTA RAJA', 'P.111', 10, 1, NULL),
(144, 'KUALA LANGAT', 'P.112', 10, 1, NULL),
(145, 'SEPANG', 'P.113', 10, 1, NULL),
(146, 'BESUT', 'P.033', 11, 1, NULL),
(147, 'SETIU', 'P.034', 11, 1, NULL),
(148, 'KUALA NERUS', 'P.035', 11, 1, NULL),
(149, 'KUALA TERENGGANU', 'P.036', 11, 1, NULL),
(150, 'MARANG', 'P.037', 11, 1, NULL),
(151, 'HULU TERENGGANU', 'P.038', 11, 1, NULL),
(152, 'DUNGUN', 'P.039', 11, 1, NULL),
(153, 'KEMAMAN', 'P.040', 11, 1, NULL),
(154, 'KUDAT', 'P.167', 12, 1, NULL),
(155, 'KOTA MARUDU', 'P.168', 12, 1, NULL),
(156, 'KOTA BELUD', 'P.169', 12, 1, NULL),
(157, 'TUARAN', 'P.170', 12, 1, NULL),
(158, 'SEPANGGAR', 'P.171', 12, 1, NULL),
(159, 'KOTA KINABALU', 'P.172', 12, 1, NULL),
(160, 'PUTATAN', 'P.173', 12, 1, NULL),
(161, 'PENAMPANG', 'P.174', 12, 1, NULL),
(162, 'PAPAR', 'P.175', 12, 1, NULL),
(163, 'KIMANIS', 'P.176', 12, 1, NULL),
(164, 'BEAUFORT', 'P.177', 12, 1, NULL),
(165, 'SIPITANG', 'P.178', 12, 1, NULL),
(166, 'RANAU', 'P.179', 12, 1, NULL),
(167, 'KENINGAU', 'P.180', 12, 1, NULL),
(168, 'TENOM', 'P.181', 12, 1, NULL),
(169, 'PENSIANGAN', 'P.182', 12, 1, NULL),
(170, 'BELURAN', 'P.183', 12, 1, NULL),
(171, 'LIBARAN', 'P.184', 12, 1, NULL),
(172, 'BATU SAPI', 'P.185', 12, 1, NULL),
(173, 'SANDAKAN', 'P.186', 12, 1, NULL),
(174, 'KINABATANGAN', 'P.187', 12, 1, NULL),
(175, 'SILAM', 'P.188', 12, 1, NULL),
(176, 'SEMPORNA', 'P.189', 12, 1, NULL),
(177, 'TAWAU', 'P.190', 12, 1, NULL),
(178, 'KALABAKAN', 'P.191', 12, 1, NULL),
(179, 'KEPONG', 'P.114', 14, 1, NULL),
(180, 'BATU', 'P.115', 14, 1, NULL),
(181, 'WANGSA MAJU', 'P.116', 14, 1, NULL),
(182, 'SEGAMBUT', 'P.117', 14, 1, NULL),
(183, 'SETIAWANGSA', 'P.118', 14, 1, NULL),
(184, 'TITIWANGSA', 'P.119', 14, 1, NULL),
(185, 'BUKIT BINTANG', 'P.120', 14, 1, NULL),
(186, 'LEMBAH PANTAI', 'P.121', 14, 1, NULL),
(187, 'SEPUTEH', 'P.122', 14, 1, NULL),
(188, 'CHERAS', 'P.123', 14, 1, NULL),
(189, 'BANDAR TUN RAZAK', 'P.124', 14, 1, NULL),
(190, 'LABUAN', 'P.166', 15, 1, NULL),
(191, 'PUTRAJAYA', 'P.125', 16, 1, NULL),
(192, 'MAS GADING', 'P.192', 13, 1, NULL),
(193, 'SANTUBONG', 'P.193', 13, 1, NULL),
(194, 'PETRA JAYA', 'P.194', 13, 1, NULL),
(195, 'BANDAR KUCHING', 'P.195', 13, 1, NULL),
(196, 'STAMPIN', 'P.196', 13, 1, NULL),
(197, 'KOTA SAMARAHAN', 'P.197', 13, 1, NULL),
(198, 'PUNCAK BORNEO', 'P.198', 13, 1, NULL),
(199, 'SERIAN', 'P.199', 13, 1, NULL),
(200, 'BATANG SADONG', 'P.200', 13, 1, NULL),
(201, 'BATANG LUPAR', 'P.201', 13, 1, NULL),
(202, 'SRI AMAN', 'P.202', 13, 1, NULL),
(203, 'LUBOK ANTU', 'P.203', 13, 1, NULL),
(204, 'BETONG', 'P.204', 13, 1, NULL),
(205, 'SARATOK', 'P.205', 13, 1, NULL),
(206, 'TANJONG MANIS', 'P.206', 13, 1, NULL),
(207, 'IGAN', 'P.207', 13, 1, NULL),
(208, 'SARIKEI', 'P.208', 13, 1, NULL),
(209, 'JULAU', 'P.209', 13, 1, NULL),
(210, 'KANOWIT', 'P.210', 13, 1, NULL),
(211, 'LANANG', 'P.211', 13, 1, NULL),
(212, 'SIBU', 'P.212', 13, 1, NULL),
(213, 'MUKAH', 'P.213', 13, 1, NULL),
(214, 'SELANGAU', 'P.214', 13, 1, NULL),
(215, 'KAPIT', 'P.215', 13, 1, NULL),
(216, 'HULU RAJANG', 'P.216', 13, 1, NULL),
(217, 'BINTULU', 'P.217', 13, 1, NULL),
(218, 'SIBUTI', 'P.218', 13, 1, NULL),
(219, 'MIRI', 'P.219', 13, 1, NULL),
(220, 'BARAM', 'P.220', 13, 1, NULL),
(221, 'LIMBANG', 'P.221', 13, 1, NULL),
(222, 'LAWAS', 'P.222', 13, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_premission`
--

CREATE TABLE `tbl_gi_premission` (
  `ID` int(11) NOT NULL,
  `TypePremission` varchar(255) DEFAULT NULL,
  `StatusPremission` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_premission`
--

INSERT INTO `tbl_gi_premission` (`ID`, `TypePremission`, `StatusPremission`, `Remarks`) VALUES
(1, 'Add', 1, ''),
(2, 'Edit/Update', 1, NULL),
(3, 'View', 1, NULL),
(4, 'Delete', 2, 'Only for Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_registration`
--

CREATE TABLE `tbl_gi_registration` (
  `ID` int(11) NOT NULL,
  `RegisterType` varchar(255) DEFAULT NULL,
  `StatusRegister` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_registration`
--

INSERT INTO `tbl_gi_registration` (`ID`, `RegisterType`, `StatusRegister`, `Remarks`) VALUES
(1, 'SSM', 1, NULL),
(2, 'ROC', 1, NULL),
(3, 'ROB', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_state`
--

CREATE TABLE `tbl_gi_state` (
  `ID` int(11) NOT NULL,
  `State` varchar(255) DEFAULT NULL,
  `StateCode` varchar(255) DEFAULT NULL,
  `StateCodeNumber` varchar(255) DEFAULT NULL,
  `StatePhoneCode` varchar(255) DEFAULT NULL,
  `StatusState` int(11) DEFAULT NULL,
  `StateCountry` int(11) DEFAULT NULL,
  `Remaks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_state`
--

INSERT INTO `tbl_gi_state` (`ID`, `State`, `StateCode`, `StateCodeNumber`, `StatePhoneCode`, `StatusState`, `StateCountry`, `Remaks`) VALUES
(1, 'Johor', 'JH', '01', '07', 1, 104, NULL),
(2, 'Kedah', 'KD', '02', '04', 1, 104, NULL),
(3, 'Kelantan', 'KT', '03', '09', 1, 104, NULL),
(4, 'Melaka', 'ML', '04', '06', 1, 104, NULL),
(5, 'Negeri Sembilan', 'NS', '05', '06', 1, 104, NULL),
(6, 'Pahang', 'PH', '06', '09', 1, 104, NULL),
(7, 'Pulau Pinang', 'PN', '07', '04', 1, 104, NULL),
(8, 'Perak', 'PR', '08', '05', 1, 104, NULL),
(9, 'Perlis', 'PL', '09', '04', 1, 104, NULL),
(10, 'Selangor', 'SG', '10', '03', 1, 104, NULL),
(11, 'Terengganu', 'TR', '11', '09', 1, 104, NULL),
(12, 'Sabah', 'SB', '12', '08', 1, 104, NULL),
(13, 'Sarawak', 'SW', '13', '08', 1, 104, NULL),
(14, 'Wilayah Persekutuan Kuala Lumpur', 'KL', '14', '03', 1, 104, NULL),
(15, 'Wilayah Persekutuan Labuan', 'LB', '15', '087', 1, 104, NULL),
(16, 'Wilayah Persekutuan Putrajaya', 'PJ', '16', '03', 1, 104, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_status`
--

CREATE TABLE `tbl_gi_status` (
  `ID` int(11) NOT NULL,
  `GeneralStatus` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_status`
--

INSERT INTO `tbl_gi_status` (`ID`, `GeneralStatus`, `Remarks`) VALUES
(1, 'Active', 'Aktiviti secara ganeral yang aktif'),
(2, 'Passive', 'Aktiviti secara ganeral yang tidak aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gi_userrole`
--

CREATE TABLE `tbl_gi_userrole` (
  `ID` int(11) NOT NULL,
  `UserRole` varchar(255) DEFAULT NULL,
  `StatusUser` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_gi_userrole`
--

INSERT INTO `tbl_gi_userrole` (`ID`, `UserRole`, `StatusUser`, `Remarks`) VALUES
(1, 'Super Administrator', 1, 'SU'),
(2, 'Administrator', 1, 'Admin'),
(3, 'Cheif Executive Officer', 1, 'CEO'),
(4, 'Cheif Operation Officer', 1, 'COO'),
(5, 'Cheif Finance Officer', 1, 'CFO'),
(6, 'Manager', 1, 'GM'),
(7, 'Human Resources', 1, 'HR'),
(8, 'Finance', 1, 'FM'),
(9, 'Software Engineer', 1, 'SE'),
(10, 'Technical Engineer', 1, 'TE'),
(11, 'Operation Engineer', 1, 'OE'),
(12, 'Agent', 1, 'Agent'),
(13, 'Permohon', 1, 'End-User'),
(14, 'Cheif Technology Officer', 1, 'CTO');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_premission`
--

CREATE TABLE `tbl_user_premission` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `UserPremission` int(11) DEFAULT NULL,
  `StatusPremission` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_registration`
--

CREATE TABLE `tbl_user_registration` (
  `ID` int(11) NOT NULL,
  `uuid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` varchar(255) DEFAULT NULL,
  `last_login_at` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  `role_type` int(11) DEFAULT NULL,
  `user_branch_id` int(11) DEFAULT NULL,
  `user_agency_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `description_of_table`
--
ALTER TABLE `description_of_table`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tbl_ap_agency`
--
ALTER TABLE `tbl_ap_agency`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusAgency` (`StatusAgency`) USING BTREE,
  ADD KEY `CompanyType` (`CompanyTypeID`) USING BTREE,
  ADD KEY `RegisterType` (`RegistrationTypeID`) USING BTREE;

--
-- Indexes for table `tbl_ap_bookings`
--
ALTER TABLE `tbl_ap_bookings`
  ADD KEY `sub_package_id` (`sub_package_id`);

--
-- Indexes for table `tbl_ap_branch`
--
ALTER TABLE `tbl_ap_branch`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `tbl_ap_packages`
--
ALTER TABLE `tbl_ap_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ap_status`
--
ALTER TABLE `tbl_ap_status`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `IDStatus2` (`IDStatus`) USING BTREE;

--
-- Indexes for table `tbl_ap_subpackages`
--
ALTER TABLE `tbl_ap_subpackages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `tbl_gi_bisness`
--
ALTER TABLE `tbl_gi_bisness`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusBisness` (`StatusBisness`) USING BTREE;

--
-- Indexes for table `tbl_gi_country`
--
ALTER TABLE `tbl_gi_country`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusCountry` (`StatusCountry`) USING BTREE;

--
-- Indexes for table `tbl_gi_district`
--
ALTER TABLE `tbl_gi_district`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `DistrictState` (`DistrictState`) USING BTREE,
  ADD KEY `StatusDistrict` (`StatusDistrict`) USING BTREE;

--
-- Indexes for table `tbl_gi_dun`
--
ALTER TABLE `tbl_gi_dun`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `DUNState` (`DUNState`) USING BTREE,
  ADD KEY `StatusDUN` (`StatusDUN`) USING BTREE;

--
-- Indexes for table `tbl_gi_parlimen`
--
ALTER TABLE `tbl_gi_parlimen`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `ParlimenState` (`ParlimenState`) USING BTREE,
  ADD KEY `StatusParlimen` (`StatusParlimen`) USING BTREE;

--
-- Indexes for table `tbl_gi_premission`
--
ALTER TABLE `tbl_gi_premission`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusPremission` (`StatusPremission`) USING BTREE;

--
-- Indexes for table `tbl_gi_registration`
--
ALTER TABLE `tbl_gi_registration`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusRegister` (`StatusRegister`) USING BTREE;

--
-- Indexes for table `tbl_gi_state`
--
ALTER TABLE `tbl_gi_state`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusState` (`StatusState`) USING BTREE,
  ADD KEY `StateCountry` (`StateCountry`) USING BTREE;

--
-- Indexes for table `tbl_gi_status`
--
ALTER TABLE `tbl_gi_status`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `tbl_gi_userrole`
--
ALTER TABLE `tbl_gi_userrole`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `StatusUser` (`StatusUser`) USING BTREE;

--
-- Indexes for table `tbl_user_premission`
--
ALTER TABLE `tbl_user_premission`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `UserPremission` (`UserPremission`) USING BTREE,
  ADD KEY `StatusPremission1` (`StatusPremission`) USING BTREE,
  ADD KEY `UserRegID` (`UserID`) USING BTREE;

--
-- Indexes for table `tbl_user_registration`
--
ALTER TABLE `tbl_user_registration`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `statususer1` (`user_status`) USING BTREE,
  ADD KEY `userrole` (`role_type`) USING BTREE,
  ADD KEY `userbanch1` (`user_branch_id`) USING BTREE,
  ADD KEY `useragency1` (`user_agency_id`) USING BTREE;

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
-- AUTO_INCREMENT for table `description_of_table`
--
ALTER TABLE `description_of_table`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_ap_agency`
--
ALTER TABLE `tbl_ap_agency`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ap_branch`
--
ALTER TABLE `tbl_ap_branch`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ap_packages`
--
ALTER TABLE `tbl_ap_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ap_status`
--
ALTER TABLE `tbl_ap_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_ap_subpackages`
--
ALTER TABLE `tbl_ap_subpackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_gi_bisness`
--
ALTER TABLE `tbl_gi_bisness`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_gi_country`
--
ALTER TABLE `tbl_gi_country`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `tbl_gi_district`
--
ALTER TABLE `tbl_gi_district`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `tbl_gi_dun`
--
ALTER TABLE `tbl_gi_dun`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=588;

--
-- AUTO_INCREMENT for table `tbl_gi_parlimen`
--
ALTER TABLE `tbl_gi_parlimen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `tbl_gi_premission`
--
ALTER TABLE `tbl_gi_premission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_gi_registration`
--
ALTER TABLE `tbl_gi_registration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_gi_state`
--
ALTER TABLE `tbl_gi_state`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_gi_status`
--
ALTER TABLE `tbl_gi_status`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_gi_userrole`
--
ALTER TABLE `tbl_gi_userrole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_user_premission`
--
ALTER TABLE `tbl_user_premission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_registration`
--
ALTER TABLE `tbl_user_registration`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_ap_agency`
--
ALTER TABLE `tbl_ap_agency`
  ADD CONSTRAINT `CompanyType` FOREIGN KEY (`CompanyTypeID`) REFERENCES `tbl_gi_bisness` (`ID`),
  ADD CONSTRAINT `RegisterType` FOREIGN KEY (`RegistrationTypeID`) REFERENCES `tbl_gi_registration` (`ID`),
  ADD CONSTRAINT `StatusAgency` FOREIGN KEY (`StatusAgency`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_ap_status`
--
ALTER TABLE `tbl_ap_status`
  ADD CONSTRAINT `IDStatus2` FOREIGN KEY (`IDStatus`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_ap_subpackages`
--
ALTER TABLE `tbl_ap_subpackages`
  ADD CONSTRAINT `tbl_ap_subpackages_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `tbl_ap_packages` (`id`);

--
-- Constraints for table `tbl_gi_bisness`
--
ALTER TABLE `tbl_gi_bisness`
  ADD CONSTRAINT `StatusBisness` FOREIGN KEY (`StatusBisness`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_country`
--
ALTER TABLE `tbl_gi_country`
  ADD CONSTRAINT `StatusCountry` FOREIGN KEY (`StatusCountry`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_district`
--
ALTER TABLE `tbl_gi_district`
  ADD CONSTRAINT `DistrictState` FOREIGN KEY (`DistrictState`) REFERENCES `tbl_gi_state` (`ID`),
  ADD CONSTRAINT `StatusDistrict` FOREIGN KEY (`StatusDistrict`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_dun`
--
ALTER TABLE `tbl_gi_dun`
  ADD CONSTRAINT `DUNState` FOREIGN KEY (`DUNState`) REFERENCES `tbl_gi_state` (`ID`),
  ADD CONSTRAINT `StatusDUN` FOREIGN KEY (`StatusDUN`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_parlimen`
--
ALTER TABLE `tbl_gi_parlimen`
  ADD CONSTRAINT `ParlimenState` FOREIGN KEY (`ParlimenState`) REFERENCES `tbl_gi_state` (`ID`),
  ADD CONSTRAINT `StatusParlimen` FOREIGN KEY (`StatusParlimen`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_premission`
--
ALTER TABLE `tbl_gi_premission`
  ADD CONSTRAINT `StatusPremission` FOREIGN KEY (`StatusPremission`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_registration`
--
ALTER TABLE `tbl_gi_registration`
  ADD CONSTRAINT `StatusRegister` FOREIGN KEY (`StatusRegister`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_state`
--
ALTER TABLE `tbl_gi_state`
  ADD CONSTRAINT `StateCountry` FOREIGN KEY (`StateCountry`) REFERENCES `tbl_gi_country` (`ID`),
  ADD CONSTRAINT `StatusState` FOREIGN KEY (`StatusState`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_gi_userrole`
--
ALTER TABLE `tbl_gi_userrole`
  ADD CONSTRAINT `StatusUser` FOREIGN KEY (`StatusUser`) REFERENCES `tbl_gi_status` (`ID`);

--
-- Constraints for table `tbl_user_premission`
--
ALTER TABLE `tbl_user_premission`
  ADD CONSTRAINT `StatusPremission1` FOREIGN KEY (`StatusPremission`) REFERENCES `tbl_gi_status` (`ID`),
  ADD CONSTRAINT `UserPremission` FOREIGN KEY (`UserPremission`) REFERENCES `tbl_gi_premission` (`ID`),
  ADD CONSTRAINT `UserRegID` FOREIGN KEY (`UserID`) REFERENCES `tbl_user_registration` (`ID`);

--
-- Constraints for table `tbl_user_registration`
--
ALTER TABLE `tbl_user_registration`
  ADD CONSTRAINT `statususer1` FOREIGN KEY (`user_status`) REFERENCES `tbl_gi_status` (`ID`),
  ADD CONSTRAINT `useragency1` FOREIGN KEY (`user_agency_id`) REFERENCES `tbl_ap_agency` (`ID`),
  ADD CONSTRAINT `userbanch1` FOREIGN KEY (`user_branch_id`) REFERENCES `tbl_ap_branch` (`ID`),
  ADD CONSTRAINT `userrole` FOREIGN KEY (`role_type`) REFERENCES `tbl_gi_userrole` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
