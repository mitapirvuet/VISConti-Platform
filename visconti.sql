-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for yii2basic
CREATE DATABASE IF NOT EXISTS `yii2basic` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yii2basic`;


-- Dumping structure for table yii2basic.administrators
CREATE TABLE IF NOT EXISTS `administrators` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Last login activity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Given name` varchar(20) NOT NULL,
  `Family name` varchar(20) NOT NULL,
  `Email` varchar(9) NOT NULL,
  `Password` varchar(15) NOT NULL COMMENT 'Hashed in the db',
  `Reset password expiry date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Once an admin requests reset of password, this field stores the expiry date of the reset password request',
  `Country of residence` int(11) NOT NULL COMMENT 'Lookup to Countries',
  `City` varchar(30) NOT NULL,
  `State` int(11) NOT NULL COMMENT 'Lookup to States',
  `Address` varchar(30) NOT NULL,
  `Address details` varchar(30) NOT NULL,
  `Zip/Postal code` int(11) NOT NULL,
  `Mobile number` varchar(30) NOT NULL,
  `Phone number` varchar(30) NOT NULL,
  `Fax` varchar(30) NOT NULL,
  `Role` int(11) NOT NULL COMMENT 'Lookup to Administrator Roles',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `FK_administrators_countries` (`Country of residence`),
  KEY `FK_administrators_states` (`State`),
  KEY `FK_administrators_administrator_roles` (`Role`),
  CONSTRAINT `FK_administrators_administrator_roles` FOREIGN KEY (`Role`) REFERENCES `administrator_roles` (`ID`),
  CONSTRAINT `FK_administrators_countries` FOREIGN KEY (`Country of residence`) REFERENCES `countries` (`ID`),
  CONSTRAINT `FK_administrators_states` FOREIGN KEY (`State`) REFERENCES `states` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.administrators: ~0 rows (approximately)
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;


-- Dumping structure for table yii2basic.administrator_roles
CREATE TABLE IF NOT EXISTS `administrator_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Title` varchar(20) NOT NULL,
  `Code` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.administrator_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `administrator_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator_roles` ENABLE KEYS */;


-- Dumping structure for table yii2basic.apps_countries
CREATE TABLE IF NOT EXISTS `apps_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.apps_countries: 246 rows
/*!40000 ALTER TABLE `apps_countries` DISABLE KEYS */;
INSERT INTO `apps_countries` (`id`, `country_code`, `country_name`) VALUES
	(1, 'AF', 'Afghanistan'),
	(2, 'AL', 'Albania'),
	(3, 'DZ', 'Algeria'),
	(4, 'DS', 'American Samoa'),
	(5, 'AD', 'Andorra'),
	(6, 'AO', 'Angola'),
	(7, 'AI', 'Anguilla'),
	(8, 'AQ', 'Antarctica'),
	(9, 'AG', 'Antigua and Barbuda'),
	(10, 'AR', 'Argentina'),
	(11, 'AM', 'Armenia'),
	(12, 'AW', 'Aruba'),
	(13, 'AU', 'Australia'),
	(14, 'AT', 'Austria'),
	(15, 'AZ', 'Azerbaijan'),
	(16, 'BS', 'Bahamas'),
	(17, 'BH', 'Bahrain'),
	(18, 'BD', 'Bangladesh'),
	(19, 'BB', 'Barbados'),
	(20, 'BY', 'Belarus'),
	(21, 'BE', 'Belgium'),
	(22, 'BZ', 'Belize'),
	(23, 'BJ', 'Benin'),
	(24, 'BM', 'Bermuda'),
	(25, 'BT', 'Bhutan'),
	(26, 'BO', 'Bolivia'),
	(27, 'BA', 'Bosnia and Herzegovina'),
	(28, 'BW', 'Botswana'),
	(29, 'BV', 'Bouvet Island'),
	(30, 'BR', 'Brazil'),
	(31, 'IO', 'British Indian Ocean Territory'),
	(32, 'BN', 'Brunei Darussalam'),
	(33, 'BG', 'Bulgaria'),
	(34, 'BF', 'Burkina Faso'),
	(35, 'BI', 'Burundi'),
	(36, 'KH', 'Cambodia'),
	(37, 'CM', 'Cameroon'),
	(38, 'CA', 'Canada'),
	(39, 'CV', 'Cape Verde'),
	(40, 'KY', 'Cayman Islands'),
	(41, 'CF', 'Central African Republic'),
	(42, 'TD', 'Chad'),
	(43, 'CL', 'Chile'),
	(44, 'CN', 'China'),
	(45, 'CX', 'Christmas Island'),
	(46, 'CC', 'Cocos (Keeling) Islands'),
	(47, 'CO', 'Colombia'),
	(48, 'KM', 'Comoros'),
	(49, 'CG', 'Congo'),
	(50, 'CK', 'Cook Islands'),
	(51, 'CR', 'Costa Rica'),
	(52, 'HR', 'Croatia (Hrvatska)'),
	(53, 'CU', 'Cuba'),
	(54, 'CY', 'Cyprus'),
	(55, 'CZ', 'Czech Republic'),
	(56, 'DK', 'Denmark'),
	(57, 'DJ', 'Djibouti'),
	(58, 'DM', 'Dominica'),
	(59, 'DO', 'Dominican Republic'),
	(60, 'TP', 'East Timor'),
	(61, 'EC', 'Ecuador'),
	(62, 'EG', 'Egypt'),
	(63, 'SV', 'El Salvador'),
	(64, 'GQ', 'Equatorial Guinea'),
	(65, 'ER', 'Eritrea'),
	(66, 'EE', 'Estonia'),
	(67, 'ET', 'Ethiopia'),
	(68, 'FK', 'Falkland Islands (Malvinas)'),
	(69, 'FO', 'Faroe Islands'),
	(70, 'FJ', 'Fiji'),
	(71, 'FI', 'Finland'),
	(72, 'FR', 'France'),
	(73, 'FX', 'France, Metropolitan'),
	(74, 'GF', 'French Guiana'),
	(75, 'PF', 'French Polynesia'),
	(76, 'TF', 'French Southern Territories'),
	(77, 'GA', 'Gabon'),
	(78, 'GM', 'Gambia'),
	(79, 'GE', 'Georgia'),
	(80, 'DE', 'Germany'),
	(81, 'GH', 'Ghana'),
	(82, 'GI', 'Gibraltar'),
	(83, 'GK', 'Guernsey'),
	(84, 'GR', 'Greece'),
	(85, 'GL', 'Greenland'),
	(86, 'GD', 'Grenada'),
	(87, 'GP', 'Guadeloupe'),
	(88, 'GU', 'Guam'),
	(89, 'GT', 'Guatemala'),
	(90, 'GN', 'Guinea'),
	(91, 'GW', 'Guinea-Bissau'),
	(92, 'GY', 'Guyana'),
	(93, 'HT', 'Haiti'),
	(94, 'HM', 'Heard and Mc Donald Islands'),
	(95, 'HN', 'Honduras'),
	(96, 'HK', 'Hong Kong'),
	(97, 'HU', 'Hungary'),
	(98, 'IS', 'Iceland'),
	(99, 'IN', 'India'),
	(100, 'IM', 'Isle of Man'),
	(101, 'ID', 'Indonesia'),
	(102, 'IR', 'Iran (Islamic Republic of)'),
	(103, 'IQ', 'Iraq'),
	(104, 'IE', 'Ireland'),
	(105, 'IL', 'Israel'),
	(106, 'IT', 'Italy'),
	(107, 'CI', 'Ivory Coast'),
	(108, 'JE', 'Jersey'),
	(109, 'JM', 'Jamaica'),
	(110, 'JP', 'Japan'),
	(111, 'JO', 'Jordan'),
	(112, 'KZ', 'Kazakhstan'),
	(113, 'KE', 'Kenya'),
	(114, 'KI', 'Kiribati'),
	(115, 'KP', 'Korea, Democratic People\'s Republic of'),
	(116, 'KR', 'Korea, Republic of'),
	(117, 'XK', 'Kosovo'),
	(118, 'KW', 'Kuwait'),
	(119, 'KG', 'Kyrgyzstan'),
	(120, 'LA', 'Lao People\'s Democratic Republic'),
	(121, 'LV', 'Latvia'),
	(122, 'LB', 'Lebanon'),
	(123, 'LS', 'Lesotho'),
	(124, 'LR', 'Liberia'),
	(125, 'LY', 'Libyan Arab Jamahiriya'),
	(126, 'LI', 'Liechtenstein'),
	(127, 'LT', 'Lithuania'),
	(128, 'LU', 'Luxembourg'),
	(129, 'MO', 'Macau'),
	(130, 'MK', 'Macedonia'),
	(131, 'MG', 'Madagascar'),
	(132, 'MW', 'Malawi'),
	(133, 'MY', 'Malaysia'),
	(134, 'MV', 'Maldives'),
	(135, 'ML', 'Mali'),
	(136, 'MT', 'Malta'),
	(137, 'MH', 'Marshall Islands'),
	(138, 'MQ', 'Martinique'),
	(139, 'MR', 'Mauritania'),
	(140, 'MU', 'Mauritius'),
	(141, 'TY', 'Mayotte'),
	(142, 'MX', 'Mexico'),
	(143, 'FM', 'Micronesia, Federated States of'),
	(144, 'MD', 'Moldova, Republic of'),
	(145, 'MC', 'Monaco'),
	(146, 'MN', 'Mongolia'),
	(147, 'ME', 'Montenegro'),
	(148, 'MS', 'Montserrat'),
	(149, 'MA', 'Morocco'),
	(150, 'MZ', 'Mozambique'),
	(151, 'MM', 'Myanmar'),
	(152, 'NA', 'Namibia'),
	(153, 'NR', 'Nauru'),
	(154, 'NP', 'Nepal'),
	(155, 'NL', 'Netherlands'),
	(156, 'AN', 'Netherlands Antilles'),
	(157, 'NC', 'New Caledonia'),
	(158, 'NZ', 'New Zealand'),
	(159, 'NI', 'Nicaragua'),
	(160, 'NE', 'Niger'),
	(161, 'NG', 'Nigeria'),
	(162, 'NU', 'Niue'),
	(163, 'NF', 'Norfolk Island'),
	(164, 'MP', 'Northern Mariana Islands'),
	(165, 'NO', 'Norway'),
	(166, 'OM', 'Oman'),
	(167, 'PK', 'Pakistan'),
	(168, 'PW', 'Palau'),
	(169, 'PS', 'Palestine'),
	(170, 'PA', 'Panama'),
	(171, 'PG', 'Papua New Guinea'),
	(172, 'PY', 'Paraguay'),
	(173, 'PE', 'Peru'),
	(174, 'PH', 'Philippines'),
	(175, 'PN', 'Pitcairn'),
	(176, 'PL', 'Poland'),
	(177, 'PT', 'Portugal'),
	(178, 'PR', 'Puerto Rico'),
	(179, 'QA', 'Qatar'),
	(180, 'RE', 'Reunion'),
	(181, 'RO', 'Romania'),
	(182, 'RU', 'Russian Federation'),
	(183, 'RW', 'Rwanda'),
	(184, 'KN', 'Saint Kitts and Nevis'),
	(185, 'LC', 'Saint Lucia'),
	(186, 'VC', 'Saint Vincent and the Grenadines'),
	(187, 'WS', 'Samoa'),
	(188, 'SM', 'San Marino'),
	(189, 'ST', 'Sao Tome and Principe'),
	(190, 'SA', 'Saudi Arabia'),
	(191, 'SN', 'Senegal'),
	(192, 'RS', 'Serbia'),
	(193, 'SC', 'Seychelles'),
	(194, 'SL', 'Sierra Leone'),
	(195, 'SG', 'Singapore'),
	(196, 'SK', 'Slovakia'),
	(197, 'SI', 'Slovenia'),
	(198, 'SB', 'Solomon Islands'),
	(199, 'SO', 'Somalia'),
	(200, 'ZA', 'South Africa'),
	(201, 'GS', 'South Georgia South Sandwich Islands'),
	(202, 'ES', 'Spain'),
	(203, 'LK', 'Sri Lanka'),
	(204, 'SH', 'St. Helena'),
	(205, 'PM', 'St. Pierre and Miquelon'),
	(206, 'SD', 'Sudan'),
	(207, 'SR', 'Suriname'),
	(208, 'SJ', 'Svalbard and Jan Mayen Islands'),
	(209, 'SZ', 'Swaziland'),
	(210, 'SE', 'Sweden'),
	(211, 'CH', 'Switzerland'),
	(212, 'SY', 'Syrian Arab Republic'),
	(213, 'TW', 'Taiwan'),
	(214, 'TJ', 'Tajikistan'),
	(215, 'TZ', 'Tanzania, United Republic of'),
	(216, 'TH', 'Thailand'),
	(217, 'TG', 'Togo'),
	(218, 'TK', 'Tokelau'),
	(219, 'TO', 'Tonga'),
	(220, 'TT', 'Trinidad and Tobago'),
	(221, 'TN', 'Tunisia'),
	(222, 'TR', 'Turkey'),
	(223, 'TM', 'Turkmenistan'),
	(224, 'TC', 'Turks and Caicos Islands'),
	(225, 'TV', 'Tuvalu'),
	(226, 'UG', 'Uganda'),
	(227, 'UA', 'Ukraine'),
	(228, 'AE', 'United Arab Emirates'),
	(229, 'GB', 'United Kingdom'),
	(230, 'US', 'United States'),
	(231, 'UM', 'United States minor outlying islands'),
	(232, 'UY', 'Uruguay'),
	(233, 'UZ', 'Uzbekistan'),
	(234, 'VU', 'Vanuatu'),
	(235, 'VA', 'Vatican City State'),
	(236, 'VE', 'Venezuela'),
	(237, 'VN', 'Vietnam'),
	(238, 'VG', 'Virgin Islands (British)'),
	(239, 'VI', 'Virgin Islands (U.S.)'),
	(240, 'WF', 'Wallis and Futuna Islands'),
	(241, 'EH', 'Western Sahara'),
	(242, 'YE', 'Yemen'),
	(243, 'YU', 'Yugoslavia'),
	(244, 'ZR', 'Zaire'),
	(245, 'ZM', 'Zambia'),
	(246, 'ZW', 'Zimbabwe');
/*!40000 ALTER TABLE `apps_countries` ENABLE KEYS */;


-- Dumping structure for table yii2basic.auth_assignment
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table yii2basic.auth_assignment: ~9 rows (approximately)
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
	('expert', '19', 1459290325),
	('expert', '22', 1459354429),
	('expert', '24', 1459354494),
	('student', '20', 1459290342),
	('student', '21', 1459295097),
	('student', '23', 1459354473),
	('student', '25', 1459358101),
	('student', '26', 1459786278),
	('student', '27', 1459786568),
	('student', '28', 1459786615);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;


-- Dumping structure for table yii2basic.auth_item
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table yii2basic.auth_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
	('expert', 1, '', NULL, NULL, 1458466740, 1458466740),
	('student', 1, '', NULL, NULL, 1458466732, 1458466732);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;


-- Dumping structure for table yii2basic.auth_item_child
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table yii2basic.auth_item_child: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;


-- Dumping structure for table yii2basic.auth_rule
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table yii2basic.auth_rule: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;


-- Dumping structure for table yii2basic.canvases
CREATE TABLE IF NOT EXISTS `canvases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `created_by` tinytext NOT NULL,
  `requested` tinytext NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_to` tinytext NOT NULL,
  `language` tinytext NOT NULL,
  `eng_summary` text NOT NULL,
  `status` enum('Draft','Submitted','Expert evaluation requested','Expert evaluation in progress','Industry evaluation requested','Industry evaluation in progress','Evaluation complete') NOT NULL DEFAULT 'Draft',
  `overall_technical` float NOT NULL COMMENT '0-100',
  `overall_economical` float NOT NULL COMMENT '0-100',
  `overall_creative` float NOT NULL COMMENT '0-100',
  `sector` int(11) NOT NULL,
  `subsector` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sector` (`sector`),
  KEY `subsector` (`subsector`),
  CONSTRAINT `FK_canvases_sector` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_canvases_sub_sector` FOREIGN KEY (`subsector`) REFERENCES `sub_sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.canvases: ~39 rows (approximately)
/*!40000 ALTER TABLE `canvases` DISABLE KEYS */;
INSERT INTO `canvases` (`id`, `title`, `content`, `created_by`, `requested`, `date_added`, `date_modified`, `assigned_to`, `language`, `eng_summary`, `status`, `overall_technical`, `overall_economical`, `overall_creative`, `sector`, `subsector`) VALUES
	(140, 'jsaiojfasiuhfsauhfsa', '<p>kfjdasokfjsdfisdjfsdiofjsdio</p>', '90', '', '2016-04-27 18:25:21', '2016-04-27 18:26:11', '', 'English', 'fdsiojfsdi0ojfdsiojfsdiuo', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(141, 'fsdfjdsiofjsdio', '<p>fsfjdisfjufhquiofql</p>', '90', '', '2016-04-27 19:14:47', '2016-04-27 19:14:47', '', 'Afar', 'fsd;fjdsoifjsdio', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(142, 'fdsiofsjdfisdojfiosdj', '<p>jdsioajfdiosfjdsoifjsdoifds</p>', '90', '', '2016-04-27 19:15:26', '2016-04-27 20:06:52', '', 'Afar', 'fsdposdjfi9dasjf89sduf89sdu', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(143, 'fsdfsdkfjsdkfjd', '<p>kpoasjdaiojfdsiofjdsio</p>', '90', '', '2016-04-27 19:35:44', '2016-04-27 19:37:24', '', 'Afar', 'fsdgfdsgfdsgsdfgfds', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(144, 'gdfkgdfgjdfopgfkdgpodfk', '<p>kpofdksopfsdfopsdkfopfdskpofsd</p>', '90', '', '2016-04-27 19:59:10', '2016-04-27 19:59:10', '', 'English', 'sdaokdasopdkaso', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(145, 'dijasidojsaiodjas', '<p>jidjasiodjsaiodjasiod</p>', '90', '', '2016-04-27 20:07:08', '2016-04-27 20:07:08', '', 'English', 'dasdsakpodksaodksaop', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(146, 'ifjdsiofjsdifsdjio', '<p>ijfdsiojfsdiofjsdifjsdifsdj</p>', '90', '', '2016-04-27 20:07:41', '2016-04-27 20:07:41', '', 'Russian', 'dsadlsap[dlsap[dlp[asl', 'Submitted', 0, 0, 0, 1, 1),
	(147, 'sdfdsfsfsgsfgdfgdf', '<p>sdfdsfsfsgsfgdfgdfsdfdsfsfsgsfgdfgdf</p>', '90', '', '2016-04-27 20:08:22', '2016-04-27 20:08:22', '', 'Afar', 'sdfdsfsfsgsfgdfgdf', 'Submitted', 0, 0, 0, 1, 1),
	(148, 'fsdfsdlfpsd[lfs[pdfp[lsd', '<p>sdfdsfsfsgsfgdfgdfsdfdsfsfsgsfgdfgdf</p>', '90', '', '2016-04-27 20:08:47', '2016-04-27 20:08:47', '', 'Breton', 'sdfdsfsfsgsfgdfgdfsdfdsfsfsgsfgdfgdf', 'Submitted', 0, 0, 0, 1, 1),
	(149, 'fsdfsdlfpsd[lfs[pdfp[lsd', '<p>sdfdsfsfsgsfgdfgdfsdfdsfsfsgsfgdfgdf</p>', '90', '', '2016-04-27 20:08:57', '2016-04-27 20:10:26', '', 'Breton', 'sdfdsfsfsgsfgdfgdfsdfdsfsfsgsfgdfgdf', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(150, 'fsdiojfsdiojfisdojfsdoi', '<p>jiofdjsifsdjfiodsjfisdo</p>', '90', '', '2016-04-27 20:26:56', '2016-04-27 20:26:56', '', 'English', 'dsapokdopsakdopak', 'Submitted', 0, 0, 0, 1, 1),
	(151, 'fsd[kfsdopfksdopfksdop', '<p>kopfsdkfopdskfsofsdkop</p>', '90', '', '2016-04-27 20:28:00', '2016-04-27 20:28:00', '', 'English', 'fafdfdsfsdfewefsdfwe', 'Submitted', 0, 0, 0, 1, 1),
	(152, 'fsdijfdshfsduihfsuifhsdui', '<p>ijfiudshfdsuifhsduifshfsdiufsd</p>', '90', '', '2016-04-27 20:32:21', '2016-04-27 20:32:21', '', 'English', 'fjsdijfdsiofjdsiofjdsoi', 'Submitted', 0, 0, 0, 1, 1),
	(153, 'fsdijfdshfsduihfsuifhsdui', '<p>ijfiudshfdsuifhsduifshfsdiufsd</p>', '90', '', '2016-04-27 20:33:52', '2016-04-27 20:33:52', '', 'English', 'fjsdijfdsiofjdsiofjdsoi', 'Submitted', 0, 0, 0, 1, 1),
	(154, 'fsdijfdshfsduihfsuifhsdui', '<p>ijfiudshfdsuifhsduifshfsdiufsd</p>', '90', '', '2016-04-27 20:36:46', '2016-04-27 20:40:08', '', 'English', 'fjsdijfdsiofjdsiofjdsoi', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(155, 'fsdfmdsiofjdsjfdsiojio', '<p>ijdsaiojdsaiodjasdoiasj</p>', '90', '', '2016-04-27 20:49:27', '2016-04-27 20:49:27', '', 'English', 'feqfje09qujf98qefj8q9ej', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(156, 'fodsjkfopsdijfdiosjfsdio', '<p>jifosdjfiosdjfsdiofjsdio</p>', '90', '', '2016-04-27 20:53:01', '2016-04-27 20:53:01', '', 'English', 'dsaodkasodkasop', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(157, 'dashdashdsauidhasiudsha', '<p>uihifudhfdisuhfsduifhsdi</p>', '90', '', '2016-04-27 20:55:20', '2016-04-27 20:55:20', '', 'English', 'dsakdosiahdudas', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(158, 'fsdfjdsoifjsdofisdj', '<p>jiosdjiosdfjsdifsjdo</p>', '90', '', '2016-04-27 21:51:53', '2016-04-27 21:51:53', '', 'Afar', 'ifjsoifjdsiofjiosd', 'Submitted', 0, 0, 0, 1, 1),
	(159, 'fsdfjdsoifjsdofisdj', '<p>jiosdjiosdfjsdifsjdo</p>', '90', '', '2016-04-27 21:52:40', '2016-04-27 23:41:50', '', 'Afar', 'ifjsoifjdsiofjiosd', 'Expert evaluation in progress', 0, 0, 0, 1, 1),
	(160, 'fgsdgsfdgsfdsgsfd', '<p>werwerwefsfsdfa</p>', '90', '', '2016-04-27 23:45:25', '2016-04-27 23:45:25', '', 'Catalan', 'rwefafdsfdafdasfsda', 'Submitted', 0, 0, 0, 1, 1),
	(161, 'fgsdgsfdgsfdsgsfd', '<p>werwerwefsfsdfa</p>', '90', '', '2016-04-27 23:52:06', '2016-04-27 23:52:06', '', 'Catalan', 'rwefafdsfdafdasfsda', 'Submitted', 0, 0, 0, 1, 1),
	(162, 'fgsdgsfdgsfdsgsfd', '<p>werwerwefsfsdfa</p>', '90', '', '2016-04-27 23:52:21', '2016-04-27 23:52:21', '', 'Catalan', 'rwefafdsfdafdasfsda', 'Expert evaluation in progress', 0, 0, 0, 1, 1),
	(163, 'fgsdgsfdgsfdsgsfd', '<p>werwerwefsfsdfa</p>', '90', '', '2016-04-27 23:54:03', '2016-04-28 00:05:16', '', 'Catalan', 'rwefafdsfdafdasfsda', 'Expert evaluation in progress', 0, 0, 0, 1, 1),
	(164, 'buna amicilor', '<p>ijdsiaojdsaiojdsaio</p>', '90', '', '2016-04-28 01:07:41', '2016-04-28 01:07:41', '', 'English', 'fsodkfdospkfdsop', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(165, 'acesta este un test', '<p>dsoakdsaodjsaihjdasudhsai</p>', '90', '', '2016-04-28 01:09:20', '2016-04-28 01:09:20', '', 'English', 'kgifdjgifdjgiodf', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(166, 'acesta este inca un test', '<p>dkjsaidjasdhasj8dsahudas</p>', '90', '', '2016-04-28 01:17:28', '2016-04-28 01:17:28', '', 'English', 'fdsfdskfdisjfisdo', 'Expert evaluation in progress', 0, 0, 0, 1, 1),
	(167, 'fallalalal', '<p>lpfaslfps[afkasfjkoifjsd</p>', '90', '', '2016-04-28 01:21:04', '2016-04-28 01:21:04', '', 'English', 'fdjsfodisjfdoisjfdios', 'Expert evaluation in progress', 0, 0, 0, 1, 1),
	(168, 'fjsdiofdjsiofjsdio', '<p>jiodasjiodsajdioasjiodas</p>', '90', '', '2016-04-28 01:47:24', '2016-04-28 01:47:24', '', 'Afrikaans', 'fsdfjdsiofjiosd', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(169, 'jfsdiofjdsiofjosdi', '<p>iojdsaiodjsaoidjioas</p>', '90', '', '2016-04-28 01:52:17', '2016-04-28 01:52:17', '', 'English', 'fsdfjdsoifjdsoi', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(170, 'fjsdjfdsiuhfdsuih', '<p>uidhsauidhasiudhuias</p>', '90', '', '2016-04-28 01:55:04', '2016-04-28 01:55:04', '', 'English', 'dsadasdsadsadsadas', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(171, 'mdsaiodsaij', '<p>mdsaiodsaijmdsaiodsaijmdsaiodsaij</p>', '90', '', '2016-04-28 01:55:37', '2016-04-28 01:55:37', '', 'English', 'mdsaiodsaijmdsaiodsaijmdsaiodsaijmdsaiodsaij', 'Submitted', 0, 0, 0, 1, 1),
	(172, 'mdsaiodsaij', '<p>mdsaiodsaijmdsaiodsaijmdsaiodsaij</p>', '90', '', '2016-04-28 01:55:44', '2016-04-28 01:55:44', '', 'English', 'mdsaiodsaijmdsaiodsaijmdsaiodsaijmdsaiodsaij', 'Submitted', 0, 0, 0, 1, 1),
	(173, 'The final scoring test', '<p>Let\'s try it out.</p>', '90', '', '2016-04-28 14:40:57', '2016-04-28 14:40:57', '', 'English', 'Hope this works.', '', 0, 0, 0, 1, 1),
	(174, 'oidfjhsiodfhdsuihfd', '<p>oidfjhsiodfhdsuihfdoidfjhsiodfhdsuihfdoidfjhsiodfhdsuihfdoidfjhsiodfhdsuihfd</p>', '90', '', '2016-04-28 16:51:51', '2016-04-28 16:51:51', '', 'Abkhazian', 'oidfjhsiodfhdsuihfdoidfjhsiodfhdsuihfdoidfjhsiodfhdsuihfd', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(175, 'Y u no work you lil bich', '<p>dasodjsaiojdasiodjasiodsadjasio</p>', '90', '', '2016-04-28 17:42:10', '2016-04-28 17:42:10', '', 'English', 'fsdfdsfsdfdsfsfsfds', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(176, 'fsdfdspkjfsduiofhsduifh', '<p>iuhuihdfuisdhfuidshfsdiufhsdfuisdfsd</p>', '90', '', '2016-04-28 17:49:07', '2016-04-28 17:49:07', '', 'English', 'dsfdsfsdfdsfdsfsdfsd', 'Expert evaluation requested', 0, 0, 0, 1, 1),
	(177, 'Inca un test frate', '<p>Inca un test frateInca un test frateInca un test frateInca un test frateInca un test frate</p>', '90', '', '2016-04-28 17:52:19', '2016-04-28 17:54:13', '', 'English', 'Inca un test frateInca un test frateInca un test frateInca un test frate', '', 0, 0, 0, 1, 1),
	(178, 'fsdfdsifjdsiofjdsio', '<p>fkpdokfdspofksdopfksdopfsd</p>', '90', '', '2016-04-28 18:05:03', '2016-04-28 18:05:03', '', 'English', 'fsdfdsfdsfsdfdsfsdfds', 'Evaluation complete', 54, 0, 0, 1, 1);
/*!40000 ALTER TABLE `canvases` ENABLE KEYS */;


-- Dumping structure for table yii2basic.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `model_type` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `type_user` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.comment: ~7 rows (approximately)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `comment`, `model_type`, `model_id`, `state_id`, `type_id`, `create_time`, `create_user_id`, `type_user`) VALUES
	(1, NULL, 'app\\models\\Canvas', 62, NULL, NULL, '2016-04-25 23:57:51', 90, 1),
	(2, NULL, 'app\\models\\Canvas', 62, NULL, NULL, '2016-04-26 00:00:14', 90, 1),
	(3, 'gsgfgsgfsgfs', 'app\\models\\Canvas', 63, NULL, NULL, '2016-04-26 00:50:04', 90, 2),
	(4, 'cacat', 'app\\models\\Canvas', 178, NULL, NULL, '2016-04-28 17:41:41', 13, 1),
	(5, 'cacat', 'app\\models\\Canvas', 178, NULL, NULL, '2016-04-28 17:42:04', 13, 1),
	(6, 'dsadsa', 'app\\models\\Canvas', 178, NULL, NULL, '2016-04-28 18:09:59', 13, 1),
	(7, 'dsadsadasdsa', 'app\\models\\Canvas', 178, NULL, NULL, '2016-04-28 18:10:55', 13, 1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for table yii2basic.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Title` varchar(21) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.countries: ~0 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;


-- Dumping structure for table yii2basic.country
CREATE TABLE IF NOT EXISTS `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.country: ~10 rows (approximately)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`code`, `name`, `population`) VALUES
	('23', 'Romania', 103020320),
	('AU', 'Australia', 18886000),
	('BR', 'Brazil', 170115000),
	('CA', 'Canada', 1147000),
	('CN', 'China', 1277558000),
	('DE', 'Germany', 82164700),
	('FR', 'France', 59225700),
	('GB', 'United Kingdom', 59623400),
	('IN', 'India', 1013662000),
	('RU', 'Russia', 146934000),
	('US', 'United States', 278357000);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


-- Dumping structure for table yii2basic.degrees
CREATE TABLE IF NOT EXISTS `degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.degrees: ~2 rows (approximately)
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
INSERT INTO `degrees` (`id`, `created_on`, `last_modified_on`, `trash`, `code`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:09:35', '0000-00-00 00:00:00', NULL, 'dsada', 0.5, 0.3, 0.2),
	(2, '2016-04-23 02:09:44', '0000-00-00 00:00:00', NULL, 'fdaf', 0.4, 0.2, 0.4);
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;


-- Dumping structure for table yii2basic.education
CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `degree` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table yii2basic.education: ~2 rows (approximately)
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` (`id`, `user_id`, `degree`, `institution`, `from`, `to`) VALUES
	(1, '5', 'Master', 'Somewhere', '1977', '1978'),
	(2, '5', 'PhD', 'CNET', '2010', '2014'),
	(3, '23', 'Master', 'Ecaterina', '2012', '2016');
/*!40000 ALTER TABLE `education` ENABLE KEYS */;


-- Dumping structure for table yii2basic.experience
CREATE TABLE IF NOT EXISTS `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `job_title` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.experience: ~2 rows (approximately)
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` (`id`, `user_id`, `job_title`, `institution`, `from`, `to`) VALUES
	(6, '5', 'da', 'da', '2010', '2015'),
	(7, '5', 'test', 'test', '2011', '2015'),
	(8, '23', 'Developer', 'VISConti', '2012', '2016');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert
CREATE TABLE IF NOT EXISTS `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `last_login_activity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(20) NOT NULL,
  `given_name` varchar(20) NOT NULL,
  `family_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'shall be hashed in the db',
  `reset_pass_exp_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'once an expert member request reset of password, this field stores the expiry date of the reset password request',
  `website` varchar(50) NOT NULL,
  `bio` varchar(1024) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `terms` enum('Yes','No') DEFAULT 'Yes',
  `confirmed` enum('Yes','No') DEFAULT 'No',
  `active_projects` int(11) NOT NULL,
  `sectors` varchar(50) DEFAULT NULL,
  `auth_key` varchar(32) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert: ~11 rows (approximately)
/*!40000 ALTER TABLE `expert` DISABLE KEYS */;
INSERT INTO `expert` (`id`, `created_on`, `last_modified_on`, `trash`, `last_login_activity`, `title`, `given_name`, `family_name`, `email`, `birth_year`, `password`, `reset_pass_exp_date`, `website`, `bio`, `country`, `zip`, `city`, `address`, `state`, `mobile`, `phone`, `fax`, `terms`, `confirmed`, `active_projects`, `sectors`, `auth_key`, `role`) VALUES
	(13, '2016-04-28 18:08:49', '2016-04-11 12:32:54', NULL, '2016-04-10 22:31:29', 'Mr.', 'Mihai', 'Pirvulet', 'mitapirvuet@yahoo.com', 1915, '$2y$13$e6kmM5uEnX/E.1dtV9zSL./rOwvGamfzcUKU97luaWXw8MvXRjyIm', '0000-00-00 00:00:00', 'http://fomrad.com', 'dadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadadada', 'Romania', '223945', 'Balesti', 'Str.2 Ap. 5', 'Gorj', '312312312', '443243242', '', 'Yes', 'Yes', 16, '1,2', '', 'Technical'),
	(14, '2016-04-28 18:09:15', '2016-04-13 20:24:28', NULL, '2016-04-13 20:24:28', '', '', '', 'blabla@test.com', 0, '$2y$13$Ik8umC88ANX7NdNOypQAFu1ENzKlmfSurC3niupUfwptGvhu6N6Y2', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Yes', 6, NULL, '', 'Economical'),
	(16, '2016-04-28 18:09:54', '2016-04-23 01:03:49', NULL, '2016-04-23 01:03:49', '', '', '', 'testut@test.com', 0, '$2y$13$0S08CmBpN0kuWUZgYu300O9wF9.FZliGb7RU5nxaAghfE9/YJzoOG', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Yes', 5, NULL, 'H8e_ovQl-oIumyKkoZYnMlG2q7yswMj-', 'Creative'),
	(17, '2016-04-28 14:39:25', '2016-04-23 01:14:59', NULL, '2016-04-23 01:14:59', '', '', '', 'expert@test.com', 0, '$2y$13$jfAFsK2R9OEJyosEnSoR0ueD6cNnRl6DjsOMJpRTjm1K2QYPs8M2O', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 8, NULL, '_tWpjnpv0trNnNtIkxlayLzSmIQuHzvS', 'Economical'),
	(18, '2016-04-23 01:17:33', '2016-04-23 01:17:33', NULL, '2016-04-23 01:17:33', '', '', '', 'msdsam@mdsam.com', 0, '$2y$13$oCPhhP9gdEj8pNkTWmugiO/vmj6skZdIN7V6lKNo9OLEdm.qydOS.', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, 'L0J1mVcnGPdP1swnivqs6NlxGlwxKCYB', ''),
	(19, '2016-04-23 01:19:19', '2016-04-23 01:19:19', NULL, '2016-04-23 01:19:19', '', '', '', 'sadsada@hdsaui.com', 0, '$2y$13$KtvDUSlIFvL7DOXdaZpJ0utrAxTzmIrh5Fa4i2QtVLKrlKkbVKzE6', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, 'wLHejrb8Sy_FGAkq0zGsXDmJbK9dSwLM', ''),
	(20, '2016-04-23 01:19:48', '2016-04-23 01:19:48', NULL, '2016-04-23 01:19:48', '', '', '', 'dsadsaddas@jdins.com', 0, '$2y$13$qQww75oGG8kwrJMbFbxJbuv1vLwg8CGCQfltUxbXDSbZyJO/MVJUi', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, 'znS4keiShZ8zgBBD1P34LB88APD95DHK', ''),
	(21, '2016-04-23 01:21:43', '2016-04-23 01:21:43', NULL, '2016-04-23 01:21:43', '', '', '', 'dsaddsaddas@jdins.com', 0, '$2y$13$zTwgnRZ44IZtUriI9.BzY./b5j3YMDgQUK2clMJZU2BoK4T6gZkW2', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, 'Vs9T8MAfA9QOWvh4YeLUTcyaq5p7BbuC', ''),
	(22, '2016-04-23 01:41:29', '2016-04-23 01:26:30', NULL, '2016-04-23 01:26:30', '', '', '', 'dsfsdf@jidj.cin', 0, '$2y$13$1WGmaVzFiU5wqebp39p3E.mKGr9bmLSaeVsw.SErrjhMWpQnF53Di', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Yes', 0, NULL, 'nVgyiPvHL8sto7rMScC6LrgtVHQhxluG', ''),
	(23, '2016-04-26 01:14:47', '2016-04-26 01:14:47', NULL, '2016-04-26 01:14:47', '', '', '', 'dsiajdasidj@dasidji.com', 0, '$2y$13$sGlKkVXSzpFmka7zgiLBqO0uKl/Kr.4lB7AiQMgxD21unual1VSyy', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, 'k13d00XiCQ8-M_zc74dQgybHjUd1ASyY', ''),
	(26, '2016-04-26 23:52:29', '2016-04-26 23:52:29', NULL, '2016-04-26 23:52:29', '', '', '', 'fjdsiufhdsuh@hjdsuahdua.com', 0, '$2y$13$FnRUr0UXbJ/z5SSL1FVClelrGPvj6GK6ecJCN2SB/haA.NS5qvI1.', '0000-00-00 00:00:00', '', '', '', '', '', '', '', '', '', '', 'Yes', 'No', 0, NULL, '8bwlkhTb3K-WFZtjGEeOgHMdJHXJUx-L', '');
/*!40000 ALTER TABLE `expert` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_education
CREATE TABLE IF NOT EXISTS `expert_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `degree` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `degree_details` varchar(1024) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table yii2basic.expert_education: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_education` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_experience
CREATE TABLE IF NOT EXISTS `expert_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `job_title` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  `job_description` varchar(1024) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table yii2basic.expert_experience: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_experience` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_interest
CREATE TABLE IF NOT EXISTS `expert_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `interest` int(11) NOT NULL COMMENT 'Lookup to interests',
  `expert` int(11) NOT NULL COMMENT 'Lookup to experts',
  PRIMARY KEY (`id`),
  KEY `FK_expert_interest_expert` (`expert`),
  KEY `FK_expert_interest_interest` (`interest`),
  CONSTRAINT `FK_expert_interest_expert` FOREIGN KEY (`expert`) REFERENCES `expert` (`id`),
  CONSTRAINT `FK_expert_interest_interest` FOREIGN KEY (`interest`) REFERENCES `interest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_interest: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_interest` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_project_canvas_assignation
CREATE TABLE IF NOT EXISTS `expert_project_canvas_assignation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expert` int(11) NOT NULL COMMENT 'Lookup to Experts',
  `project` int(11) NOT NULL COMMENT 'Lookup to Projects',
  `role` varchar(50) NOT NULL,
  `status` enum('Active','Pending') NOT NULL DEFAULT 'Active',
  `expiry_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` tinytext NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index 4` (`project`,`expert`),
  KEY `FK_expert_project_canvas_assignation_expert` (`expert`),
  KEY `FK_expert_project_canvas_assignation_project_canvas` (`project`),
  CONSTRAINT `FK_expert_project_canvas_assignation_expert` FOREIGN KEY (`expert`) REFERENCES `expert` (`id`),
  CONSTRAINT `FK_expert_project_canvas_assignation_project_canvas` FOREIGN KEY (`project`) REFERENCES `canvases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_project_canvas_assignation: ~98 rows (approximately)
/*!40000 ALTER TABLE `expert_project_canvas_assignation` DISABLE KEYS */;
INSERT INTO `expert_project_canvas_assignation` (`id`, `created_on`, `last_modified_on`, `expert`, `project`, `role`, `status`, `expiry_date`, `notes`, `score`) VALUES
	(71, '2016-04-27 19:33:38', '0000-00-00 00:00:00', 13, 142, 'Technical', 'Pending', '2016-05-11 19:33:38', '', 0),
	(72, '2016-04-27 19:33:39', '0000-00-00 00:00:00', 14, 142, 'Economical', 'Pending', '2016-05-11 19:33:39', '', 0),
	(73, '2016-04-27 19:33:39', '0000-00-00 00:00:00', 16, 142, 'Creative', 'Pending', '2016-05-11 19:33:39', '', 0),
	(74, '2016-04-27 19:35:44', '0000-00-00 00:00:00', 13, 143, 'Technical', 'Pending', '2016-05-11 19:35:44', '', 0),
	(75, '2016-04-27 19:35:45', '0000-00-00 00:00:00', 16, 143, 'Creative', 'Pending', '2016-05-11 19:35:45', '', 0),
	(76, '2016-04-27 19:37:24', '0000-00-00 00:00:00', 14, 143, 'Economical', 'Pending', '2016-05-11 19:37:24', '', 0),
	(77, '2016-04-27 19:59:10', '0000-00-00 00:00:00', 13, 144, 'Technical', 'Pending', '2016-05-11 19:59:10', '', 0),
	(78, '2016-04-27 19:59:10', '0000-00-00 00:00:00', 14, 144, 'Economical', 'Pending', '2016-05-11 19:59:10', '', 0),
	(79, '2016-04-27 19:59:11', '0000-00-00 00:00:00', 16, 144, 'Creative', 'Pending', '2016-05-11 19:59:11', '', 0),
	(80, '2016-04-27 20:07:08', '0000-00-00 00:00:00', 13, 145, 'Technical', 'Pending', '2016-05-11 20:07:08', '', 0),
	(81, '2016-04-27 20:07:09', '0000-00-00 00:00:00', 14, 145, 'Economical', 'Pending', '2016-05-11 20:07:09', '', 0),
	(82, '2016-04-27 20:07:09', '0000-00-00 00:00:00', 16, 145, 'Creative', 'Pending', '2016-05-11 20:07:09', '', 0),
	(83, '2016-04-27 20:07:41', '0000-00-00 00:00:00', 13, 146, 'Technical', 'Pending', '2016-05-11 20:07:41', '', 0),
	(84, '2016-04-27 20:07:41', '0000-00-00 00:00:00', 16, 146, 'Creative', 'Pending', '2016-05-11 20:07:41', '', 0),
	(85, '2016-04-27 20:08:23', '0000-00-00 00:00:00', 13, 147, 'Technical', 'Pending', '2016-05-11 20:08:23', '', 0),
	(86, '2016-04-27 20:08:23', '0000-00-00 00:00:00', 16, 147, 'Creative', 'Pending', '2016-05-11 20:08:23', '', 0),
	(87, '2016-04-27 20:08:47', '0000-00-00 00:00:00', 13, 148, 'Technical', 'Pending', '2016-05-11 20:08:47', '', 0),
	(88, '2016-04-27 20:08:48', '0000-00-00 00:00:00', 16, 148, 'Creative', 'Pending', '2016-05-11 20:08:48', '', 0),
	(89, '2016-04-27 20:08:57', '0000-00-00 00:00:00', 13, 149, 'Technical', 'Pending', '2016-05-11 20:08:57', '', 0),
	(90, '2016-04-27 20:08:57', '0000-00-00 00:00:00', 16, 149, 'Creative', 'Pending', '2016-05-11 20:08:57', '', 0),
	(91, '2016-04-27 20:10:26', '0000-00-00 00:00:00', 14, 149, 'Economical', 'Pending', '2016-05-11 20:10:26', '', 0),
	(92, '2016-04-27 20:26:56', '0000-00-00 00:00:00', 13, 150, 'Technical', 'Pending', '2016-05-11 20:26:56', '', 0),
	(93, '2016-04-27 20:26:57', '0000-00-00 00:00:00', 16, 150, 'Creative', 'Pending', '2016-05-11 20:26:57', '', 0),
	(94, '2016-04-27 20:28:00', '0000-00-00 00:00:00', 13, 151, 'Technical', 'Pending', '2016-05-11 20:28:00', '', 0),
	(95, '2016-04-27 20:28:01', '0000-00-00 00:00:00', 16, 151, 'Creative', 'Pending', '2016-05-11 20:28:01', '', 0),
	(96, '2016-04-27 20:32:21', '0000-00-00 00:00:00', 13, 152, 'Technical', 'Pending', '2016-05-11 20:32:21', '', 0),
	(97, '2016-04-27 20:32:22', '0000-00-00 00:00:00', 16, 152, 'Creative', 'Pending', '2016-05-11 20:32:22', '', 0),
	(98, '2016-04-27 20:33:52', '0000-00-00 00:00:00', 13, 153, 'Technical', 'Pending', '2016-05-11 20:33:52', '', 0),
	(99, '2016-04-27 20:33:53', '0000-00-00 00:00:00', 16, 153, 'Creative', 'Pending', '2016-05-11 20:33:53', '', 0),
	(100, '2016-04-27 20:36:46', '0000-00-00 00:00:00', 13, 154, 'Technical', 'Pending', '2016-05-11 20:36:46', '', 0),
	(102, '2016-04-27 20:36:48', '0000-00-00 00:00:00', 16, 154, 'Creative', 'Pending', '2016-05-11 20:36:48', '', 0),
	(103, '2016-04-27 20:40:09', '0000-00-00 00:00:00', 14, 154, 'Economical', 'Pending', '2016-05-11 20:40:09', '', 0),
	(104, '2016-04-27 20:49:28', '0000-00-00 00:00:00', 13, 155, 'Technical', 'Pending', '2016-05-11 20:49:28', '', 0),
	(105, '2016-04-27 20:49:29', '0000-00-00 00:00:00', 14, 155, 'Economical', 'Pending', '2016-05-11 20:49:29', '', 0),
	(106, '2016-04-27 20:49:29', '0000-00-00 00:00:00', 16, 155, 'Creative', 'Pending', '2016-05-11 20:49:29', '', 0),
	(107, '2016-04-27 20:53:02', '0000-00-00 00:00:00', 13, 156, 'Technical', 'Pending', '2016-05-11 20:53:02', '', 0),
	(108, '2016-04-27 20:53:03', '0000-00-00 00:00:00', 14, 156, 'Economical', 'Pending', '2016-05-11 20:53:03', '', 0),
	(109, '2016-04-27 20:53:03', '0000-00-00 00:00:00', 16, 156, 'Creative', 'Pending', '2016-05-11 20:53:03', '', 0),
	(110, '2016-04-27 20:55:20', '0000-00-00 00:00:00', 13, 157, 'Technical', 'Pending', '2016-05-11 20:55:20', '', 0),
	(112, '2016-04-27 20:55:21', '0000-00-00 00:00:00', 16, 157, 'Creative', 'Pending', '2016-05-11 20:55:21', '', 0),
	(113, '2016-04-27 21:51:53', '0000-00-00 00:00:00', 13, 158, 'Technical', 'Pending', '2016-05-11 21:51:53', '', 0),
	(114, '2016-04-27 21:51:54', '0000-00-00 00:00:00', 14, 158, 'Economical', 'Pending', '2016-05-11 21:51:54', '', 0),
	(115, '2016-04-27 21:51:55', '0000-00-00 00:00:00', 16, 158, 'Creative', 'Pending', '2016-05-11 21:51:55', '', 0),
	(118, '2016-04-27 22:11:54', '0000-00-00 00:00:00', 16, 159, 'Creative', 'Active', '2016-05-11 21:52:42', '', 0),
	(121, '2016-04-27 23:41:50', '0000-00-00 00:00:00', 13, 159, 'Technical', 'Pending', '2016-05-11 23:41:50', '', 0),
	(122, '2016-04-28 00:47:25', '0000-00-00 00:00:00', 17, 159, 'Economical', 'Active', '2016-05-11 23:41:55', '', 0),
	(123, '2016-04-27 23:45:26', '0000-00-00 00:00:00', 13, 160, 'Technical', 'Pending', '2016-05-11 23:45:26', '', 0),
	(124, '2016-04-27 23:45:27', '0000-00-00 00:00:00', 17, 160, 'Economical', 'Pending', '2016-05-11 23:45:27', '', 0),
	(125, '2016-04-28 14:34:36', '0000-00-00 00:00:00', 13, 161, 'Technical', 'Active', '2016-05-11 23:52:07', 'doaspkdopaskdopasdoaspkdopaskdopasdoaspkdopaskdopasdoaspkdopaskdopas', 0),
	(126, '2016-04-27 23:52:08', '0000-00-00 00:00:00', 17, 161, 'Economical', 'Pending', '2016-05-11 23:52:08', '', 0),
	(127, '2016-04-27 23:52:21', '0000-00-00 00:00:00', 13, 162, 'Technical', 'Pending', '2016-05-11 23:52:21', '', 0),
	(128, '2016-04-28 01:05:58', '0000-00-00 00:00:00', 17, 162, 'Economical', 'Active', '2016-05-11 23:52:22', '', 0),
	(129, '2016-04-27 23:54:03', '0000-00-00 00:00:00', 13, 163, 'Technical', 'Pending', '2016-05-11 23:54:03', '', 0),
	(131, '2016-04-27 23:54:05', '0000-00-00 00:00:00', 16, 163, 'Creative', 'Pending', '2016-05-11 23:54:05', '', 0),
	(135, '2016-04-28 01:04:24', '0000-00-00 00:00:00', 17, 163, 'Economical', 'Active', '2016-05-12 00:05:16', '', 0),
	(136, '2016-04-28 01:07:42', '0000-00-00 00:00:00', 13, 164, 'Technical', 'Pending', '2016-05-12 01:07:42', '', 0),
	(137, '2016-04-28 01:07:43', '0000-00-00 00:00:00', 14, 164, 'Economical', 'Pending', '2016-05-12 01:07:43', '', 0),
	(138, '2016-04-28 01:07:43', '0000-00-00 00:00:00', 16, 164, 'Creative', 'Pending', '2016-05-12 01:07:43', '', 0),
	(139, '2016-04-28 01:14:23', '0000-00-00 00:00:00', 13, 165, 'Technical', 'Active', '2016-05-12 01:09:20', '', 0),
	(140, '2016-04-28 01:09:21', '0000-00-00 00:00:00', 14, 165, 'Economical', 'Pending', '2016-05-12 01:09:21', '', 0),
	(141, '2016-04-28 01:09:21', '0000-00-00 00:00:00', 16, 165, 'Creative', 'Pending', '2016-05-12 01:09:21', '', 0),
	(142, '2016-04-28 01:20:14', '0000-00-00 00:00:00', 13, 166, 'Technical', 'Active', '2016-05-12 01:17:29', '', 0),
	(143, '2016-04-28 01:18:20', '0000-00-00 00:00:00', 14, 166, 'Economical', 'Active', '2016-05-12 01:17:30', '', 0),
	(144, '2016-04-28 01:17:56', '0000-00-00 00:00:00', 16, 166, 'Creative', 'Active', '2016-05-12 01:17:31', '', 0),
	(145, '2016-04-28 01:23:32', '0000-00-00 00:00:00', 13, 167, 'Technical', 'Active', '2016-05-12 01:21:05', '', 0),
	(146, '2016-04-28 01:24:55', '0000-00-00 00:00:00', 14, 167, 'Economical', 'Active', '2016-05-12 01:21:06', '', 0),
	(147, '2016-04-28 01:24:47', '0000-00-00 00:00:00', 16, 167, 'Creative', 'Active', '2016-05-12 01:21:07', '', 0),
	(148, '2016-04-28 01:47:24', '0000-00-00 00:00:00', 13, 168, 'Technical', 'Pending', '2016-05-12 01:47:24', '', 0),
	(149, '2016-04-28 01:47:25', '0000-00-00 00:00:00', 14, 168, 'Economical', 'Pending', '2016-05-12 01:47:25', '', 0),
	(150, '2016-04-28 01:47:26', '0000-00-00 00:00:00', 16, 168, 'Creative', 'Pending', '2016-05-12 01:47:26', '', 0),
	(151, '2016-04-28 01:52:17', '0000-00-00 00:00:00', 13, 169, 'Technical', 'Pending', '2016-05-12 01:52:17', '', 0),
	(152, '2016-04-28 01:52:18', '0000-00-00 00:00:00', 14, 169, 'Economical', 'Pending', '2016-05-12 01:52:18', '', 0),
	(153, '2016-04-28 01:52:19', '0000-00-00 00:00:00', 16, 169, 'Creative', 'Pending', '2016-05-12 01:52:19', '', 0),
	(154, '2016-04-28 01:55:04', '0000-00-00 00:00:00', 13, 170, 'Technical', 'Pending', '2016-05-12 01:55:04', '', 0),
	(155, '2016-04-28 01:55:05', '0000-00-00 00:00:00', 14, 170, 'Economical', 'Pending', '2016-05-12 01:55:05', '', 0),
	(156, '2016-04-28 01:55:06', '0000-00-00 00:00:00', 16, 170, 'Creative', 'Pending', '2016-05-12 01:55:06', '', 0),
	(157, '2016-04-28 01:55:37', '0000-00-00 00:00:00', 13, 171, 'Technical', 'Pending', '2016-05-12 01:55:37', '', 0),
	(158, '2016-04-28 01:55:38', '0000-00-00 00:00:00', 14, 171, 'Economical', 'Pending', '2016-05-12 01:55:38', '', 0),
	(159, '2016-04-28 01:55:44', '0000-00-00 00:00:00', 13, 172, 'Technical', 'Pending', '2016-05-12 01:55:44', '', 0),
	(160, '2016-04-28 01:55:45', '0000-00-00 00:00:00', 14, 172, 'Economical', 'Pending', '2016-05-12 01:55:45', '', 0),
	(161, '2016-04-28 17:35:34', '0000-00-00 00:00:00', 13, 173, 'Technical', 'Active', '2016-05-12 14:40:57', 'dsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdf', 0),
	(162, '2016-04-28 14:43:16', '0000-00-00 00:00:00', 14, 173, 'Economical', 'Active', '2016-05-12 14:40:59', '', 23),
	(163, '2016-04-28 14:43:13', '0000-00-00 00:00:00', 16, 173, 'Creative', 'Active', '2016-05-12 14:40:59', '', 45),
	(164, '2016-04-28 17:04:06', '0000-00-00 00:00:00', 13, 174, 'Technical', 'Active', '2016-05-12 16:51:51', 'asjdosaijdsaiodjsaiodjasidajsdoiajdsioa', 0),
	(165, '2016-04-28 16:51:53', '0000-00-00 00:00:00', 14, 174, 'Economical', 'Pending', '2016-05-12 16:51:53', '', 0),
	(166, '2016-04-28 16:51:53', '0000-00-00 00:00:00', 16, 174, 'Creative', 'Pending', '2016-05-12 16:51:53', '', 0),
	(167, '2016-04-28 17:42:10', '0000-00-00 00:00:00', 13, 175, 'Technical', 'Pending', '2016-05-12 17:42:10', '', 0),
	(168, '2016-04-28 17:42:12', '0000-00-00 00:00:00', 14, 175, 'Economical', 'Pending', '2016-05-12 17:42:12', '', 0),
	(169, '2016-04-28 17:42:13', '0000-00-00 00:00:00', 16, 175, 'Creative', 'Pending', '2016-05-12 17:42:13', '', 0),
	(170, '2016-04-28 17:49:07', '0000-00-00 00:00:00', 13, 176, 'Technical', 'Pending', '2016-05-12 17:49:07', '', 0),
	(171, '2016-04-28 17:49:08', '0000-00-00 00:00:00', 14, 176, 'Economical', 'Pending', '2016-05-12 17:49:08', '', 0),
	(172, '2016-04-28 17:49:08', '0000-00-00 00:00:00', 16, 176, 'Creative', 'Pending', '2016-05-12 17:49:08', '', 0),
	(173, '2016-04-28 18:01:57', '0000-00-00 00:00:00', 13, 177, 'Technical', 'Active', '2016-05-12 17:52:20', 'dkasidjsaiodjasdioasdkasidjsaiodjasdioasdkasidjsaiodjasdioas', 76),
	(174, '2016-04-28 17:55:11', '0000-00-00 00:00:00', 14, 177, 'Economical', 'Active', '2016-05-12 17:52:21', 'dsadsadsaldksaodjkasdjasodjasiodsadsadsaldksaodjkasdjasodjasiodsadsadsaldksaodjkasdjasodjasio', 54),
	(175, '2016-04-28 17:59:45', '0000-00-00 00:00:00', 16, 177, 'Creative', 'Active', '2016-05-12 17:54:14', 'fsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjods', 45),
	(176, '2016-04-28 18:32:01', '0000-00-00 00:00:00', 13, 178, 'Technical', 'Active', '2016-05-12 18:05:03', 'dasdijsaodjasiodasjdoiasjdasoi', 54),
	(177, '2016-04-28 18:09:31', '0000-00-00 00:00:00', 14, 178, 'Economical', 'Active', '2016-05-12 18:05:05', 'dsaopkdsaodkasodsaopkdsaodkasodsaopkdsaodkasodsaopkdsaodkaso', 43),
	(178, '2016-04-28 18:10:07', '0000-00-00 00:00:00', 16, 178, 'Creative', 'Active', '2016-05-12 18:05:05', 'fewfejwoifjwiofjofwejiofjwiofejwiofwejifoewjfiowejfweifjweiofjweiofwej', 43);
/*!40000 ALTER TABLE `expert_project_canvas_assignation` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_roles
CREATE TABLE IF NOT EXISTS `expert_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_roles` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_sector
CREATE TABLE IF NOT EXISTS `expert_sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `sector_id` int(11) NOT NULL COMMENT 'Lookup to Sectors',
  `expert` int(11) NOT NULL COMMENT 'Lookup to Experts',
  PRIMARY KEY (`id`),
  KEY `FK_expert_sector_expert` (`expert`),
  KEY `FK_expert_sector_sector` (`sector_id`),
  CONSTRAINT `FK_expert_sector_expert` FOREIGN KEY (`expert`) REFERENCES `expert` (`id`),
  CONSTRAINT `FK_expert_sector_sector` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_sector: ~4 rows (approximately)
/*!40000 ALTER TABLE `expert_sector` DISABLE KEYS */;
INSERT INTO `expert_sector` (`id`, `created_on`, `last_modified_on`, `trash`, `sector_id`, `expert`) VALUES
	(1, '2016-04-27 14:51:48', '0000-00-00 00:00:00', NULL, 1, 13),
	(6, '2016-04-27 16:19:38', '0000-00-00 00:00:00', NULL, 1, 14),
	(7, '2016-04-27 16:19:38', '0000-00-00 00:00:00', NULL, 1, 16),
	(8, '2016-04-27 16:19:38', '0000-00-00 00:00:00', NULL, 1, 17);
/*!40000 ALTER TABLE `expert_sector` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_specialization
CREATE TABLE IF NOT EXISTS `expert_specialization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `specialization` int(11) NOT NULL COMMENT 'Lookup to Specializations',
  `expert` int(11) NOT NULL COMMENT 'Lookup to Experts',
  PRIMARY KEY (`id`),
  KEY `FK_expert_specialization_expert` (`expert`),
  KEY `FK_expert_specialization_specialization` (`specialization`),
  CONSTRAINT `FK_expert_specialization_expert` FOREIGN KEY (`expert`) REFERENCES `expert` (`id`),
  CONSTRAINT `FK_expert_specialization_specialization` FOREIGN KEY (`specialization`) REFERENCES `specialization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_specialization: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_specialization` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_specialization` ENABLE KEYS */;


-- Dumping structure for table yii2basic.expert_sub_sector
CREATE TABLE IF NOT EXISTS `expert_sub_sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `subsector` int(11) NOT NULL COMMENT 'Lookup to sub-sectors',
  `expert` int(11) NOT NULL COMMENT 'Look up to Experts',
  PRIMARY KEY (`id`),
  KEY `FK_expert_sub_sector_expert` (`expert`),
  KEY `FK_expert_sub_sector_sub_sector` (`subsector`),
  CONSTRAINT `FK_expert_sub_sector_expert` FOREIGN KEY (`expert`) REFERENCES `expert` (`id`),
  CONSTRAINT `FK_expert_sub_sector_sub_sector` FOREIGN KEY (`subsector`) REFERENCES `sub_sector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.expert_sub_sector: ~0 rows (approximately)
/*!40000 ALTER TABLE `expert_sub_sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `expert_sub_sector` ENABLE KEYS */;


-- Dumping structure for table yii2basic.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '0',
  `canvas_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.files: ~0 rows (approximately)
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;


-- Dumping structure for table yii2basic.industry_account
CREATE TABLE IF NOT EXISTS `industry_account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Account name` varchar(20) NOT NULL,
  `Sector` int(11) NOT NULL COMMENT 'Lookup to Sectors',
  `Sub-sector` int(11) NOT NULL COMMENT 'Lookup to Sub-sectors',
  `Sector 2` int(11) NOT NULL COMMENT 'Lookup to Sectors',
  `Sub-sector 2` int(11) NOT NULL COMMENT 'Lookup to Sub-sectors',
  `Sector 3` int(11) NOT NULL COMMENT 'Lookup to Sectors',
  `Sub-sector 3` int(11) NOT NULL COMMENT 'Lookup to Sub-sectors',
  `Agreed on terms` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`ID`),
  KEY `FK_industry_account_sector` (`Sector`),
  KEY `FK_industry_account_sub_sector` (`Sub-sector`),
  KEY `FK_industry_account_sector_2` (`Sector 2`),
  KEY `FK_industry_account_sub_sector_2` (`Sub-sector 2`),
  KEY `FK_industry_account_sector_3` (`Sector 3`),
  KEY `FK_industry_account_sub_sector_3` (`Sub-sector 3`),
  CONSTRAINT `FK_industry_account_sector` FOREIGN KEY (`Sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_industry_account_sector_2` FOREIGN KEY (`Sector 2`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_industry_account_sector_3` FOREIGN KEY (`Sector 3`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_industry_account_sub_sector` FOREIGN KEY (`Sub-sector`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_industry_account_sub_sector_2` FOREIGN KEY (`Sub-sector 2`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_industry_account_sub_sector_3` FOREIGN KEY (`Sub-sector 3`) REFERENCES `sub_sector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.industry_account: ~0 rows (approximately)
/*!40000 ALTER TABLE `industry_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_account` ENABLE KEYS */;


-- Dumping structure for table yii2basic.industry_account_project_canvas_assignation
CREATE TABLE IF NOT EXISTS `industry_account_project_canvas_assignation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Account Representative` int(11) NOT NULL COMMENT 'Lookup to Account Representative',
  `Account` int(11) NOT NULL COMMENT 'Lookup to Account | Meta data',
  `Project` int(11) NOT NULL COMMENT 'Lookup to Projects',
  `Role` int(11) NOT NULL COMMENT 'Lookup to CoP Roles | Meta data to be copied from Expert on creation',
  `Status` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  PRIMARY KEY (`ID`),
  KEY `FK_industry_account_canvas_assignation_representative_roles` (`Account Representative`),
  KEY `FK_industry_account_canvas_assignation_industry_account` (`Account`),
  KEY `FK_industry_account_industry_canvas_assignation` (`Project`),
  KEY `FK_industry_account_canvas_assignation_expert_roles_entity` (`Role`),
  CONSTRAINT `FK_industry_account_canvas_assignation_expert_roles_entity` FOREIGN KEY (`Role`) REFERENCES `expert_roles` (`ID`),
  CONSTRAINT `FK_industry_account_canvas_assignation_industry_account` FOREIGN KEY (`Account`) REFERENCES `industry_account` (`ID`),
  CONSTRAINT `FK_industry_account_canvas_assignation_representative_roles` FOREIGN KEY (`Account Representative`) REFERENCES `industry_account_representative_roles` (`ID`),
  CONSTRAINT `FK_industry_account_industry_canvas_assignation` FOREIGN KEY (`Project`) REFERENCES `industry_account_project_canvas_assignation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.industry_account_project_canvas_assignation: ~0 rows (approximately)
/*!40000 ALTER TABLE `industry_account_project_canvas_assignation` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_account_project_canvas_assignation` ENABLE KEYS */;


-- Dumping structure for table yii2basic.industry_account_representative_roles
CREATE TABLE IF NOT EXISTS `industry_account_representative_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Title` varchar(20) NOT NULL,
  `Code` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.industry_account_representative_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `industry_account_representative_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_account_representative_roles` ENABLE KEYS */;


-- Dumping structure for table yii2basic.interest
CREATE TABLE IF NOT EXISTS `interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `status` enum('Yes','No') DEFAULT NULL,
  `specialization` int(11) NOT NULL,
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`),
  KEY `specialization` (`specialization`),
  CONSTRAINT `FK_specialization_interests` FOREIGN KEY (`specialization`) REFERENCES `specialization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.interest: ~4 rows (approximately)
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` (`id`, `created_on`, `last_modified_on`, `trash`, `name`, `status`, `specialization`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:38:58', '0000-00-00 00:00:00', NULL, 'test', NULL, 1, 0.3, 0.5, 0.2),
	(2, '2016-04-15 23:17:45', '0000-00-00 00:00:00', NULL, 'test2', NULL, 3, 0, 0, 0),
	(3, '2016-04-15 23:17:54', '0000-00-00 00:00:00', NULL, 'testt', NULL, 1, 0, 0, 0),
	(4, '2016-04-15 23:17:45', '0000-00-00 00:00:00', NULL, 'test23', NULL, 3, 0, 0, 0);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;


-- Dumping structure for table yii2basic.job_titles
CREATE TABLE IF NOT EXISTS `job_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.job_titles: ~2 rows (approximately)
/*!40000 ALTER TABLE `job_titles` DISABLE KEYS */;
INSERT INTO `job_titles` (`id`, `created_on`, `last_modified_on`, `trash`, `code`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:21:42', '0000-00-00 00:00:00', NULL, 'da', 0.3, 0.4, 0.3),
	(2, '2016-04-23 02:21:55', '0000-00-00 00:00:00', NULL, 'nu', 0.1, 0.2, 0.7);
/*!40000 ALTER TABLE `job_titles` ENABLE KEYS */;


-- Dumping structure for table yii2basic.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(49) CHARACTER SET utf8 DEFAULT NULL,
  `iso_639-1` char(2) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table yii2basic.languages: ~135 rows (approximately)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`id`, `name`, `iso_639-1`) VALUES
	(1, 'English', 'en'),
	(2, 'Afar', 'aa'),
	(3, 'Abkhazian', 'ab'),
	(4, 'Afrikaans', 'af'),
	(5, 'Amharic', 'am'),
	(6, 'Arabic', 'ar'),
	(7, 'Assamese', 'as'),
	(8, 'Aymara', 'ay'),
	(9, 'Azerbaijani', 'az'),
	(10, 'Bashkir', 'ba'),
	(11, 'Belarusian', 'be'),
	(12, 'Bulgarian', 'bg'),
	(13, 'Bihari', 'bh'),
	(14, 'Bislama', 'bi'),
	(15, 'Bengali/Bangla', 'bn'),
	(16, 'Tibetan', 'bo'),
	(17, 'Breton', 'br'),
	(18, 'Catalan', 'ca'),
	(19, 'Corsican', 'co'),
	(20, 'Czech', 'cs'),
	(21, 'Welsh', 'cy'),
	(22, 'Danish', 'da'),
	(23, 'German', 'de'),
	(24, 'Bhutani', 'dz'),
	(25, 'Greek', 'el'),
	(26, 'Esperanto', 'eo'),
	(27, 'Spanish', 'es'),
	(28, 'Estonian', 'et'),
	(29, 'Basque', 'eu'),
	(30, 'Persian', 'fa'),
	(31, 'Finnish', 'fi'),
	(32, 'Fiji', 'fj'),
	(33, 'Faeroese', 'fo'),
	(34, 'French', 'fr'),
	(35, 'Frisian', 'fy'),
	(36, 'Irish', 'ga'),
	(37, 'Scots/Gaelic', 'gd'),
	(38, 'Galician', 'gl'),
	(39, 'Guarani', 'gn'),
	(40, 'Gujarati', 'gu'),
	(41, 'Hausa', 'ha'),
	(42, 'Hindi', 'hi'),
	(43, 'Croatian', 'hr'),
	(44, 'Hungarian', 'hu'),
	(45, 'Armenian', 'hy'),
	(46, 'Interlingua', 'ia'),
	(47, 'Interlingue', 'ie'),
	(48, 'Inupiak', 'ik'),
	(49, 'Indonesian', 'in'),
	(50, 'Icelandic', 'is'),
	(51, 'Italian', 'it'),
	(52, 'Hebrew', 'iw'),
	(53, 'Japanese', 'ja'),
	(54, 'Yiddish', 'ji'),
	(55, 'Javanese', 'jw'),
	(56, 'Georgian', 'ka'),
	(57, 'Kazakh', 'kk'),
	(58, 'Greenlandic', 'kl'),
	(59, 'Cambodian', 'km'),
	(60, 'Kannada', 'kn'),
	(61, 'Korean', 'ko'),
	(62, 'Kashmiri', 'ks'),
	(63, 'Kurdish', 'ku'),
	(64, 'Kirghiz', 'ky'),
	(65, 'Latin', 'la'),
	(66, 'Lingala', 'ln'),
	(67, 'Laothian', 'lo'),
	(68, 'Lithuanian', 'lt'),
	(69, 'Latvian/Lettish', 'lv'),
	(70, 'Malagasy', 'mg'),
	(71, 'Maori', 'mi'),
	(72, 'Macedonian', 'mk'),
	(73, 'Malayalam', 'ml'),
	(74, 'Mongolian', 'mn'),
	(75, 'Moldavian', 'mo'),
	(76, 'Marathi', 'mr'),
	(77, 'Malay', 'ms'),
	(78, 'Maltese', 'mt'),
	(79, 'Burmese', 'my'),
	(80, 'Nauru', 'na'),
	(81, 'Nepali', 'ne'),
	(82, 'Dutch', 'nl'),
	(83, 'Norwegian', 'no'),
	(84, 'Occitan', 'oc'),
	(85, '(Afan)/Oromoor/Oriya', 'om'),
	(86, 'Punjabi', 'pa'),
	(87, 'Polish', 'pl'),
	(88, 'Pashto/Pushto', 'ps'),
	(89, 'Portuguese', 'pt'),
	(90, 'Quechua', 'qu'),
	(91, 'Rhaeto-Romance', 'rm'),
	(92, 'Kirundi', 'rn'),
	(93, 'Romanian', 'ro'),
	(94, 'Russian', 'ru'),
	(95, 'Kinyarwanda', 'rw'),
	(96, 'Sanskrit', 'sa'),
	(97, 'Sindhi', 'sd'),
	(98, 'Sangro', 'sg'),
	(99, 'Serbo-Croatian', 'sh'),
	(100, 'Singhalese', 'si'),
	(101, 'Slovak', 'sk'),
	(102, 'Slovenian', 'sl'),
	(103, 'Samoan', 'sm'),
	(104, 'Shona', 'sn'),
	(105, 'Somali', 'so'),
	(106, 'Albanian', 'sq'),
	(107, 'Serbian', 'sr'),
	(108, 'Siswati', 'ss'),
	(109, 'Sesotho', 'st'),
	(110, 'Sundanese', 'su'),
	(111, 'Swedish', 'sv'),
	(112, 'Swahili', 'sw'),
	(113, 'Tamil', 'ta'),
	(114, 'Telugu', 'te'),
	(115, 'Tajik', 'tg'),
	(116, 'Thai', 'th'),
	(117, 'Tigrinya', 'ti'),
	(118, 'Turkmen', 'tk'),
	(119, 'Tagalog', 'tl'),
	(120, 'Setswana', 'tn'),
	(121, 'Tonga', 'to'),
	(122, 'Turkish', 'tr'),
	(123, 'Tsonga', 'ts'),
	(124, 'Tatar', 'tt'),
	(125, 'Twi', 'tw'),
	(126, 'Ukrainian', 'uk'),
	(127, 'Urdu', 'ur'),
	(128, 'Uzbek', 'uz'),
	(129, 'Vietnamese', 'vi'),
	(130, 'Volapuk', 'vo'),
	(131, 'Wolof', 'wo'),
	(132, 'Xhosa', 'xh'),
	(133, 'Yoruba', 'yo'),
	(134, 'Chinese', 'zh'),
	(135, 'Zulu', 'zu');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;


-- Dumping structure for table yii2basic.migration
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.migration: ~10 rows (approximately)
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1455031567),
	('m140209_132017_init', 1455032381),
	('m140403_174025_create_account_table', 1455032384),
	('m140504_113157_update_tables', 1455032398),
	('m140504_130429_create_token_table', 1455032401),
	('m140506_102106_rbac_init', 1456444472),
	('m140830_171933_fix_ip_field', 1455032405),
	('m140830_172703_change_account_table_name', 1455032405),
	('m141222_110026_update_ip_field', 1455032408),
	('m141222_135246_alter_username_length', 1455032409),
	('m150614_103145_update_social_account_table', 1455032413),
	('m150623_212711_fix_username_notnull', 1455032415),
	('m160211_135237_add_new_field_to_user', 1455201107),
	('m160327_111530_add_new_field_to_user', 1459078820),
	('m160327_130443_add_new_field_to_user', 1459083973);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;


-- Dumping structure for table yii2basic.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `public_email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text,
  `gravatar_email` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `ed_desc` text,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `byear` varchar(50) DEFAULT NULL,
  `exp_desc` varchar(50) DEFAULT NULL,
  `gravatar_id` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `fax_number` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.profile: ~18 rows (approximately)
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`user_id`, `name`, `public_email`, `website`, `bio`, `gravatar_email`, `state`, `ed_desc`, `address`, `city`, `zip`, `byear`, `exp_desc`, `gravatar_id`, `phone_number`, `fax_number`, `country`) VALUES
	(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'da', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '+40784198777', '+40784198777', '17'),
	(5, 'Mihai The boss', 'test@test.com', '', 'AAAAAAAAA', NULL, '', 'This is where I say stuff about my education.\r\n', 'yes', '', '21323', '1916', NULL, NULL, '+407222222222', '+407222222222', 'Albania'),
	(6, '', '', '', '', NULL, '', '', '', '', '', '1918', '', NULL, '', '', 'Afghanistan'),
	(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, '', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', ''),
	(20, 'da', '', '', '', NULL, '', '', '', '', '', '', '', NULL, '', '', 'Afghanistan'),
	(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'Mihai failed so hard', 'demo@fail.com', 'http://fomrad.com', 'I am good at failing demos.', NULL, 'State', '', 'Address', 'Tg-Jiu', '2313123', '2000', '', NULL, '+40784198777', '+40784198777', 'Austria'),
	(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Dumping structure for table yii2basic.project_attachments
CREATE TABLE IF NOT EXISTS `project_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `project` int(11) NOT NULL COMMENT 'Lookup to Projects',
  `attachment` binary(50) NOT NULL COMMENT 'Attachament contents',
  `attachment_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_project_attachments_project_canvas` (`project`),
  CONSTRAINT `FK_project_attachments_project_canvas` FOREIGN KEY (`project`) REFERENCES `project_canvas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.project_attachments: ~0 rows (approximately)
/*!40000 ALTER TABLE `project_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_attachments` ENABLE KEYS */;


-- Dumping structure for table yii2basic.project_canvas
CREATE TABLE IF NOT EXISTS `project_canvas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Serial number` varchar(13) NOT NULL COMMENT 'ALPHANUMERIC',
  `Project title` varchar(20) NOT NULL,
  `Project description` tinytext NOT NULL,
  `Has PoC` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT 'Proof of concept',
  `Has feastibility study` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Has MVP` enum('Yes','No') NOT NULL DEFAULT 'No' COMMENT 'Minimal viable product',
  `Has marketing plan` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Has production customers` enum('Yes','No') NOT NULL DEFAULT 'No',
  `Target sector` int(11) NOT NULL COMMENT 'Lookup to sectors',
  `Target sub-sector` int(11) NOT NULL COMMENT 'Lokup to sub-sectors',
  `Experts overall score - technical` float NOT NULL COMMENT '0-100',
  `Experts overall score - economical` float NOT NULL COMMENT '0-100',
  `Experts overall score - creative` float NOT NULL COMMENT '0-100',
  `Industry overall score - technical` float NOT NULL COMMENT '0-100',
  `Industry overall score - economical` float NOT NULL COMMENT '0-100',
  `Industry overall score - creative` float NOT NULL COMMENT '0-100',
  `Canvas status` enum('Draft','Submitted','Expert evaluation requested','Expert evaluation in progress','Industry evaluation requested','Industry evaluation in progress','Evalution complete') NOT NULL DEFAULT 'Draft',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial number` (`Serial number`),
  KEY `FK_project_canvas_sector` (`Target sector`),
  KEY `FK_project_canvas_sub_sector` (`Target sub-sector`),
  CONSTRAINT `FK_project_canvas_sector` FOREIGN KEY (`Target sector`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_project_canvas_sub_sector` FOREIGN KEY (`Target sub-sector`) REFERENCES `sub_sector` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.project_canvas: ~0 rows (approximately)
/*!40000 ALTER TABLE `project_canvas` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_canvas` ENABLE KEYS */;


-- Dumping structure for table yii2basic.project_canvas_activity
CREATE TABLE IF NOT EXISTS `project_canvas_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activity_text` varchar(256) NOT NULL,
  `trash` enum('Yes','No') DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_by_type` enum('Expert','Student','Industry') NOT NULL,
  `canvas` int(11) NOT NULL COMMENT 'Lookup to Canvas',
  `action_type` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_project_canvas_activity_project_canvas` (`canvas`),
  CONSTRAINT `FK_project_canvas_activity_project_canvas` FOREIGN KEY (`canvas`) REFERENCES `canvases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.project_canvas_activity: ~20 rows (approximately)
/*!40000 ALTER TABLE `project_canvas_activity` DISABLE KEYS */;
INSERT INTO `project_canvas_activity` (`id`, `created_on`, `last_modified_on`, `activity_text`, `trash`, `added_by`, `added_by_type`, `canvas`, `action_type`) VALUES
	(9, '2016-04-28 16:44:23', '0000-00-00 00:00:00', 'Final review score: 87. <br>Review Notes: dsadasdasdasdsadasdasdasdsadasdasdasdsadasdasdas', NULL, 13, 'Expert', 173, 'Evaluation Completion'),
	(10, '2016-04-28 16:52:25', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 13, 'Expert', 174, 'Acceptance'),
	(11, '2016-04-28 16:53:18', '0000-00-00 00:00:00', 'Final review score: 45. <br>Review Notes: asjdosaijdsaiodjsaiodjasidajsdoiajdsioa', NULL, 13, 'Expert', 174, 'Evaluation Completion'),
	(12, '2016-04-28 17:09:43', '0000-00-00 00:00:00', 'Final review score: 23. <br>Review Notes: dsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdfdsfsdfsdfsdf', NULL, 13, 'Expert', 173, 'Evaluation Completion'),
	(13, '2016-04-28 17:32:05', '0000-00-00 00:00:00', 'Hi, this is derperino bla bla bla', NULL, 90, 'Student', 174, 'Note'),
	(14, '2016-04-28 17:53:01', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 13, 'Expert', 177, 'Acceptance'),
	(15, '2016-04-28 17:54:44', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 14, 'Expert', 177, 'Acceptance'),
	(16, '2016-04-28 17:55:12', '0000-00-00 00:00:00', 'Final review score: 54. <br>Review Notes: dsadsadsaldksaodjkasdjasodjasiodsadsadsaldksaodjkasdjasodjasiodsadsadsaldksaodjkasdjasodjasio', NULL, 14, 'Expert', 177, 'Evaluation Completion'),
	(17, '2016-04-28 17:56:35', '0000-00-00 00:00:00', 'Pretty nice project\r\n', NULL, 14, 'Expert', 177, 'Note'),
	(18, '2016-04-28 17:57:15', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 16, 'Expert', 177, 'Acceptance'),
	(19, '2016-04-28 17:59:45', '0000-00-00 00:00:00', 'Final review score: 45. <br>Review Notes: fsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjodsfsdijfdsiofjods', NULL, 16, 'Expert', 177, 'Evaluation Completion'),
	(20, '2016-04-28 18:01:57', '0000-00-00 00:00:00', 'Final review score: 76. <br>Review Notes: dkasidjsaiodjasdioasdkasidjsaiodjasdioasdkasidjsaiodjasdioas', NULL, 13, 'Expert', 177, 'Evaluation Completion - Technical'),
	(21, '2016-04-28 18:08:49', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 13, 'Expert', 178, 'Acceptance'),
	(22, '2016-04-28 18:09:14', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 14, 'Expert', 178, 'Acceptance'),
	(23, '2016-04-28 18:09:31', '0000-00-00 00:00:00', 'Final review score: 43. <br>Review Notes: dsaopkdsaodkasodsaopkdsaodkasodsaopkdsaodkasodsaopkdsaodkaso', NULL, 14, 'Expert', 178, 'Evaluation Completion - Economical'),
	(24, '2016-04-28 18:09:54', '0000-00-00 00:00:00', 'Invitation for project review accepted.', NULL, 16, 'Expert', 178, 'Acceptance'),
	(25, '2016-04-28 18:10:07', '0000-00-00 00:00:00', 'Final review score: 43. <br>Review Notes: fewfejwoifjwiofjofwejiofjwiofejwiofwejifoewjfiowejfweifjweiofjweiofwej', NULL, 16, 'Expert', 178, 'Evaluation Completion - Creative'),
	(26, '2016-04-28 18:11:00', '0000-00-00 00:00:00', 'Final review score: 54. <br>Review Notes: adsadasadsadasadsadasadsadasadsadas', NULL, 13, 'Expert', 178, 'Evaluation Completion - Technical'),
	(27, '2016-04-28 18:32:01', '0000-00-00 00:00:00', 'Final review score: 54. <br>Review Notes: dasdijsaodjasiodasjdoiasjdasoi', NULL, 13, 'Expert', 178, 'Evaluation Completion - Technical'),
	(28, '2016-04-28 18:42:22', '0000-00-00 00:00:00', 'fdsfsdkfiodsjfsdiofjdsiofjsdiofjsd', NULL, 13, 'Expert', 178, 'Note');
/*!40000 ALTER TABLE `project_canvas_activity` ENABLE KEYS */;


-- Dumping structure for table yii2basic.project_canvas_student
CREATE TABLE IF NOT EXISTS `project_canvas_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `student` int(11) NOT NULL COMMENT 'Lookup to Students',
  `project_canvas` int(11) NOT NULL COMMENT 'Lookup to Project Canvas',
  `role` int(11) NOT NULL COMMENT 'Lookup to Student Roles',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `FK_project_canvas_student_student` (`student`),
  KEY `FK_project_canvas_student_project_canvas` (`project_canvas`),
  KEY `FK_project_canvas_student_student_roles` (`role`),
  CONSTRAINT `FK_project_canvas_student_project_canvas` FOREIGN KEY (`project_canvas`) REFERENCES `project_canvas` (`ID`),
  CONSTRAINT `FK_project_canvas_student_student` FOREIGN KEY (`student`) REFERENCES `student` (`id`),
  CONSTRAINT `FK_project_canvas_student_student_roles` FOREIGN KEY (`role`) REFERENCES `student_roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.project_canvas_student: ~0 rows (approximately)
/*!40000 ALTER TABLE `project_canvas_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_canvas_student` ENABLE KEYS */;


-- Dumping structure for table yii2basic.sector
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.sector: ~3 rows (approximately)
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` (`id`, `created_on`, `last_modified_on`, `trash`, `name`, `status`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:27:58', '0000-00-00 00:00:00', NULL, 'sector 1', 'Active', 0.3, 0.2, 0.1),
	(2, '2016-04-23 02:28:03', '0000-00-00 00:00:00', NULL, 'sector 2', 'Active', 0.8, 0, 0.2),
	(3, '2016-04-15 11:00:03', '0000-00-00 00:00:00', NULL, 'sector3', 'Active', 0, 0, 0);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;


-- Dumping structure for table yii2basic.social_account
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `data` text,
  `code` varchar(32) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.social_account: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;


-- Dumping structure for table yii2basic.specialization
CREATE TABLE IF NOT EXISTS `specialization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `subsector` int(11) NOT NULL,
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`),
  KEY `FK_specialization_sub_sector` (`subsector`),
  CONSTRAINT `FK_specialization_sub_sector` FOREIGN KEY (`subsector`) REFERENCES `sub_sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.specialization: ~3 rows (approximately)
/*!40000 ALTER TABLE `specialization` DISABLE KEYS */;
INSERT INTO `specialization` (`id`, `created_on`, `last_modified_on`, `trash`, `name`, `status`, `subsector`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:36:18', '0000-00-00 00:00:00', NULL, 'ye', 'Active', 1, 0.3, 0.3, 0.4),
	(2, '2016-04-15 11:27:41', '0000-00-00 00:00:00', NULL, 'yes', 'Active', 1, 0, 0, 0),
	(3, '2016-04-15 11:27:58', '0000-00-00 00:00:00', NULL, 'das', 'Active', 5, 0, 0, 0);
/*!40000 ALTER TABLE `specialization` ENABLE KEYS */;


-- Dumping structure for table yii2basic.states
CREATE TABLE IF NOT EXISTS `states` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Title` varchar(20) NOT NULL,
  `Country` int(11) NOT NULL COMMENT 'Lookup to Countries',
  PRIMARY KEY (`ID`),
  KEY `FK_states_countries` (`Country`),
  CONSTRAINT `FK_states_countries` FOREIGN KEY (`Country`) REFERENCES `countries` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.states: ~0 rows (approximately)
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;


-- Dumping structure for table yii2basic.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_activity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `given_name` varchar(20) NOT NULL,
  `family_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `birth_year` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_exp_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mobile` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `agreed_terms` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `confirmed` enum('Yes','No') DEFAULT 'No',
  `bio` text NOT NULL,
  `website` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `sector` varchar(50) NOT NULL,
  `sub_sector` varchar(50) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='Student entity holds data about students that are submitting project canvas to experts to be evaluated.';

-- Dumping data for table yii2basic.student: ~8 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `created_on`, `last_modified_on`, `last_login_activity`, `trash`, `given_name`, `family_name`, `email`, `birth_year`, `password`, `password_exp_date`, `mobile`, `phone`, `fax`, `agreed_terms`, `confirmed`, `bio`, `website`, `country`, `state`, `city`, `address`, `zip`, `sector`, `sub_sector`, `auth_key`) VALUES
	(90, '2016-04-26 22:59:40', '2016-04-10 15:51:50', '2016-04-10 15:51:50', NULL, 'Mihaid', 'Da', 'student@test.com', 1910, '$2y$13$TTFP5hdvlVcS5CvugI9PROth/TCcyKHASFdKDN9N1hJ.goRW.M.LG', '0000-00-00 00:00:00', '321312', '312312', '', 'Yes', 'Yes', 'dsadsa', 'http://fomrad.com', '', '', '', '', '', '2', '2', ''),
	(91, '2016-04-28 13:22:58', '2016-04-10 22:30:07', '2016-04-10 22:30:07', NULL, '', '', 'test@test.com', 0, '$2y$13$0lcGlk9Ajp/z9GYxOKRqje3Nyp5PPNo2unMhyHKs69YHqcjkmfVF6', '0000-00-00 00:00:00', '', '', '', 'Yes', 'Yes', '', '', '', '', '', '', '', '', '', ''),
	(92, '2016-04-28 13:23:00', '2016-04-13 19:06:20', '2016-04-13 19:06:20', NULL, 'dasdas', 'adsadsda', 'skype@test.com', 1915, '$2y$13$KapwikJhUvr8py08bvy3AuABOsQPyymQW2bmeds00RJlxmT4Vnqhi', '0000-00-00 00:00:00', '123123', '312312312', '', 'Yes', 'Yes', '', 'http://dasdasda.com', '', '', '', '', '312321', '1', '1', ''),
	(93, '2016-04-13 19:07:27', '2016-04-13 19:07:27', '2016-04-13 19:07:27', NULL, '', '', 'sykpe@test.com', 0, '$2y$13$bz681r9Vj3MAk0WsOZKC1.82J7vKX58ZzuNPv4/7jepXSUbhLUUou', '0000-00-00 00:00:00', '', '', '', 'Yes', 'No', '', '', '', '', '', '', '', '', '', ''),
	(94, '2016-04-23 00:24:34', '2016-04-23 00:24:34', '2016-04-23 00:24:34', NULL, '', '', 'blabla@blabla.com', 0, '$2y$13$YMhPvHcmotZGg2Mhx4XxfeCcftt2kwjT3ANujbGWZS/4tonWjUiYu', '0000-00-00 00:00:00', '', '', '', 'Yes', 'No', '', '', '', '', '', '', '', '', '', 'cxdjYeCH1Z9Vk5UcQjuqihKFTGV5Ct3d'),
	(95, '2016-04-26 01:15:13', '2016-04-26 01:15:13', '2016-04-26 01:15:13', NULL, '', '', 'dsfjdsjfds@dksiaj.co', 0, '$2y$13$oJ4.L53fuiPJnpkTZ5cI1OhaQV8FeUunPpH2wzZs1kpZxnyk/u3Du', '0000-00-00 00:00:00', '', '', '', 'Yes', 'No', '', '', '', '', '', '', '', '', '', 'YNwo2x5DjHKWVtDqLZFLtMJBGecGldAe'),
	(96, '2016-04-26 20:12:51', '2016-04-26 20:12:51', '2016-04-26 20:12:51', NULL, '', '', 'adasd@adasd.ede', 0, '$2y$13$DEF3ukPQAhXb6sjNRk8JXOArQ4ZGViEY.pZbry5euNM2tqphQwQ6u', '0000-00-00 00:00:00', '', '', '', 'Yes', 'No', '', '', '', '', '', '', '', '', '', 'Pz77J2SO--45-XubfBG5vdzOsa8hj2ND'),
	(97, '2016-04-28 13:23:02', '2016-04-28 13:22:32', '2016-04-28 13:22:32', NULL, '', '', 'canvas@test.com', 0, '$2y$13$8qVRXC91a02Sal8j6.xmU.MoxwFy42x8ab3I/0fHNgzHVgxYuwKPq', '0000-00-00 00:00:00', '', '', '', 'Yes', 'Yes', '', '', '', '', '', '', '', '', '', '88nZsIFrXkfbJCHITLDc8Dx9r5-vwbnD');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- Dumping structure for table yii2basic.student_education
CREATE TABLE IF NOT EXISTS `student_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `degree` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `degree_details` varchar(1024) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table yii2basic.student_education: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_education` DISABLE KEYS */;
INSERT INTO `student_education` (`id`, `user_id`, `degree`, `institution`, `degree_details`, `from`, `to`) VALUES
	(6, '90', 'dadada', 'adasjdasid', 'dadasdas', '1902', '1917'),
	(7, '92', 'dsad', 'asdasdas', 'dasdas', '1915', '1917'),
	(8, '97', '32132132131', '321321321', '312312321', '1944', '2017');
/*!40000 ALTER TABLE `student_education` ENABLE KEYS */;


-- Dumping structure for table yii2basic.student_experience
CREATE TABLE IF NOT EXISTS `student_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `job_title` varchar(50) NOT NULL DEFAULT '0',
  `institution` varchar(50) NOT NULL DEFAULT '0',
  `from` varchar(50) NOT NULL DEFAULT '0',
  `to` varchar(50) NOT NULL DEFAULT '0',
  `job_description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table yii2basic.student_experience: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_experience` DISABLE KEYS */;
INSERT INTO `student_experience` (`id`, `user_id`, `job_title`, `institution`, `from`, `to`, `job_description`) VALUES
	(9, '0', 'Programmer', 'Visconti', '1908', '1918', 'Programmer Nice.'),
	(10, '90', 'Programmer', 'jdiasjdiasdias', '1916', '1918', 'doaskodasioa'),
	(12, '92', 'd', 'dasdasdas', '1902', '1916', 'asdasdasd');
/*!40000 ALTER TABLE `student_experience` ENABLE KEYS */;


-- Dumping structure for table yii2basic.student_roles
CREATE TABLE IF NOT EXISTS `student_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Created on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Last modified on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Trash` enum('Yes','No') DEFAULT NULL,
  `Title` varchar(20) NOT NULL,
  `Code` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.student_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `student_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_roles` ENABLE KEYS */;


-- Dumping structure for table yii2basic.sub_sector
CREATE TABLE IF NOT EXISTS `sub_sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trash` enum('Yes','No') DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `sector` int(11) NOT NULL,
  `expert_technical_weight` float NOT NULL COMMENT '0-1',
  `expert_economical_weight` float NOT NULL COMMENT '0-1',
  `expert_creative_weight` float NOT NULL COMMENT '0-1',
  PRIMARY KEY (`id`),
  KEY `FK_sub_sector_sector` (`sector`),
  CONSTRAINT `FK_sub_sector_sector` FOREIGN KEY (`sector`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table yii2basic.sub_sector: ~5 rows (approximately)
/*!40000 ALTER TABLE `sub_sector` DISABLE KEYS */;
INSERT INTO `sub_sector` (`id`, `created_on`, `last_modified_on`, `trash`, `name`, `status`, `sector`, `expert_technical_weight`, `expert_economical_weight`, `expert_creative_weight`) VALUES
	(1, '2016-04-23 02:33:11', '0000-00-00 00:00:00', NULL, 'sub1', 'Active', 1, 0.1, 0.3, 0.05),
	(2, '2016-04-23 02:31:23', '0000-00-00 00:00:00', NULL, 'sub2', 'Active', 1, 0.1, 0, 0),
	(3, '2016-04-11 17:56:32', '0000-00-00 00:00:00', NULL, 'da', 'Active', 2, 0, 0, 0),
	(4, '2016-04-15 11:00:18', '0000-00-00 00:00:00', NULL, 'das', 'Active', 3, 0, 0, 0),
	(5, '2016-04-15 11:00:20', '0000-00-00 00:00:00', NULL, 'dab', 'Active', 3, 0, 0, 0);
/*!40000 ALTER TABLE `sub_sector` ENABLE KEYS */;


-- Dumping structure for table yii2basic.token
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.token: ~18 rows (approximately)
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
	(3, 'tWxVq-0FBssj6IR5PtGpJ_k9nfDFm7V-', 1455036588, 0),
	(4, 'uc1EknpSfk6q5XE0uGArIvymVP1HPJZ_', 1455198448, 0),
	(5, 'D4yLvLL0qKaCiuITSiVP45qBELMDHZQd', 1456469275, 0),
	(6, 'V-r0hOXtg9S0mJDa3h8ZRzBBRWhR0N0f', 1456469375, 0),
	(7, 'dH7qLfgdByzmmXSWgxI-TI8btUf9XuRM', 1456469418, 0),
	(8, 'bTvWdYVMghKkF4uVxwZHBuBg3zqqvDej', 1456469487, 0),
	(9, 'PXn3NAF0_HoyZXO8bCex84OMz18A8TQU', 1458467410, 0),
	(10, 'xhDkO_z8pz9WbYy3BQxbGSP_8HqLBmih', 1458467644, 0),
	(19, 'cTAY-Ef3bcWE95-8NGsE7nD9mgczowdF', 1459290325, 0),
	(20, 'Yf7ZJWGXYLQgdQcU9jZHskLMtyL0FFbo', 1459290342, 0),
	(21, 'GEr1ZRQQcrhNSxiZppBJlONyUop2NK_s', 1459295097, 0),
	(22, 'ANZhfVwkBMFMIC3ZTmyH03lmXKLjHcan', 1459354428, 0),
	(23, 'p0GH28xJ1np2GCRh7Vvrp5zzyFuFH9Xj', 1459354473, 0),
	(24, '7o_P4-b6ppurr_B2Xk9O4-qhGXek4qar', 1459354494, 0),
	(25, 'bHK2N3jBlQ9y02wsuQQ9pwAxQB4ripei', 1459358100, 0),
	(26, 'tgY0A9L2eLfV8i3mMw2wUIsF0pDAPLR4', 1459786277, 0),
	(27, 'a0OPyeXb8wzLHR7fi2-y23JE1igbUkOY', 1459786567, 0),
	(28, 'GKA8gwUnRByA3GgQ_pFGE70uZI_AC-zm', 1459786615, 0);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;


-- Dumping structure for table yii2basic.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_email` (`email`),
  UNIQUE KEY `user_unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table yii2basic.user: ~19 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `phone_number`) VALUES
	(3, 'test', 'mitapirvuet@yahoo.com', '$2y$12$X1gC0iAOF1/wq.37KK7a6.4ByI8YcAFlPgXVtPzvhM4lLg2OU.C6i', 'YNMdBsrnzqTBypz2F0jahEp24cyHRQx8', 1455200788, NULL, NULL, '::1', 1455036588, 1455036588, 0, ''),
	(4, 'admin', 'lalala@gmail.com', '$2y$12$Y6bhwDiSRuKCxMPQoQ3/Deo2FzxmLj.NW1XK6VsvGX7663Jz7v7xK', 'gI7PRVIdt8LOxLbcIup54pJRfixVyWb9', 1455200792, NULL, NULL, '::1', 1455198448, 1455198448, 0, ''),
	(5, 'test2', 'yes@yes.com', '$2y$12$/V84LAa.Y1c5QyIMd4azKeqOl45YOvQD7A9L7updqxVWNQmjpJlHu', 'USdLFxggBtb7DbL-DPfeLSA5hr_MOA4j', 1456469317, NULL, NULL, '::1', 1456469274, 1456469274, 0, ''),
	(6, 'test3', 'no@no.com', '$2y$12$bMJtQ6M68y3C/5ANzTqFN.Ie8JxWXKPwntAp3XXodVu5Ntk7Dk572', 'Lt9TIyxxJzgs4HSMULMpocShtyhd7uP3', 1456469968, NULL, NULL, '::1', 1456469374, 1456469374, 0, ''),
	(7, 'dada', 'da@da.com', '$2y$12$8TfJwH.94edrM9PqFUnMweqefHZl.FAlXdfJNRd9/8URq.ovI6OEm', '5nMqD6wQ2LSCDFLaSMHX9Nwdg_edQ1Uw', 1456469969, NULL, NULL, '::1', 1456469418, 1456469418, 0, ''),
	(8, 'testut', 'test@test.com', '$2y$12$Gb.jL6xRR1Per4EPrwpXNeSUQ/4wJ4Uxws1KBlmXc6o8EY4f1C/GK', 'bvjkeSKKiSzjARuWt-9FINWQLiCCvG6O', 1456469971, NULL, NULL, '::1', 1456469487, 1456469487, 0, ''),
	(9, 'student', 'test@testtest.com', '$2y$12$rDTteIiZxR0Kp5fSbCo50.emk0IO5G9bvZtIup.J1iMuFd8nCEcPu', 'ymU-B19TONillZaOzHP4k0JAUM7lzzwY', NULL, NULL, NULL, '::1', 1458467409, 1458467409, 0, ''),
	(10, 'student2', 'test@testtests.com', '$2y$12$b6GUl/mfmfofmUnd00E/geKsXGJ/zi9kSuSMIfc3Qj.51fMmOYSDG', 'WQuC69jD2EsU37JIfyM1F1JDTpZGdH-y', NULL, NULL, NULL, '::1', 1458467643, 1458467643, 0, ''),
	(19, 'expert1', 'expert@test.com', '$2y$12$y/Vz4x0eoaCICMufA9cWVOoqCcqCbCSdp249KUvkCL8QN0CXA/Zoe', 'AzMGAd2SyXTUpbmrpKffh2B_HxAPYGxx', NULL, NULL, NULL, '::1', 1459290325, 1459290325, 0, ''),
	(20, 'student3', 'student@test.com', '$2y$12$.XpSrVYOUe2nICIFvu/Ty.eFnspC4Bfz41uzl.FF.1Q3fb2608oFS', 'yLZ8Yvwh9ShdvGJXhjEYC6ZggJX9J9J4', NULL, NULL, NULL, '::1', 1459290341, 1459290341, 0, ''),
	(21, 'mdasodmm', 'teksdadiadma@kdsmakm.com', '$2y$12$DzTzbNkl3Mm8.8Cwm0wAP.UWT.5M8f6PzWL/e4Fhaf.DxM68o2CSa', 'auiCAGN8Un9IA_ai8kSVlEq7ZJ6uZgeH', NULL, NULL, NULL, '::1', 1459295096, 1459295096, 0, ''),
	(22, 'UserNameSkype', 'testskype@test.com', '$2y$12$NioiDx2MZVlDJqYrqDQCleppnqWVGiT5AOw2s3/pKh3eEKLB3sqL.', '89sUKkUzrGCU9tjl_TwymASBErdyarlS', NULL, NULL, NULL, '::1', 1459354428, 1459354428, 0, ''),
	(23, 'skypeStudent', 'testSkypeTest@mail.com', '$2y$12$gzwrL0xxPdfA3STdbkIvhugWY684x4nbVg.U94kjmOl7dHT8RTTcu', 'kZ2FG--Fm7hC2Xtz11_hHyYw-6LfGfeW', NULL, NULL, NULL, '::1', 1459354473, 1459354473, 0, ''),
	(24, 'SkypeExpert', 'testexpert@mail.com', '$2y$12$y73W/2E/D1eOiq9hk6jChOllhLRQytT9dOKxXbVd2PLkGv/vfyu0u', 'rXyFD2WrRv1k0PFk6O4__R-_qTIOiGoQ', NULL, NULL, NULL, '::1', 1459354493, 1459354493, 0, ''),
	(25, 'dasijdaiodjasi', 'dasiasm@dmsakodas.com', '$2y$12$aGA1ARJkq0PxwoeDfQsXz.zxnys5Jcjuy2Indo4YfsEy0KQACmgA6', 'HGtkjyZtKukrwMzFFW7Upg6IHse_aRPn', NULL, NULL, NULL, '::1', 1459358100, 1459358100, 0, ''),
	(26, 'sdadasdasda', 'damsidmas@mdasimda.com', '$2y$12$IjMki2XOZGlKlmLgtv97SepwrjfypCqmSzTdCWh7oy1yG4EiOxV9y', 'IEy6rhLfJCRzgISWD2-IvCMbTckxow-M', NULL, NULL, NULL, '::1', 1459786277, 1459786277, 0, ''),
	(27, 'dasds@dsad.com', 'dasds@dsad.com', '$2y$12$h6apaXaKHtXfSmu89eZWD.9eswR11VM6BRXPo5yxltq3kzbV3jWGq', 'THcDirR_VFSpwwKSO4ZpzRvVyBydRfsn', NULL, NULL, NULL, '::1', 1459786567, 1459786567, 0, ''),
	(28, 'mihai@pirvulet.com', 'mihai@pirvulet.com', '$2y$12$IsG4i55FqMI4d5EzYVTntOf/gbJTWnjEHyipSdXfKMt.yvlXS7l/e', 'NasLxk04dOq2g7Anwi5s3B4L0CcurTJT', NULL, NULL, NULL, '::1', 1459786614, 1459787146, 0, ''),
	(30, 'dadada', 'wtff@wtf.com', 'da', '', NULL, NULL, NULL, NULL, 0, 0, 0, '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
