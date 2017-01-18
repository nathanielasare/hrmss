-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 17, 2017 at 07:29 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `dashboard_get_subunit_parent_id`(
                  id INT
                ) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
                SELECT (SELECT t2.id 
                               FROM ohrm_subunit t2 
                               WHERE t2.lft < t1.lft AND t2.rgt > t1.rgt    
                               ORDER BY t2.rgt-t1.rgt ASC LIMIT 1) INTO @parent
                FROM ohrm_subunit t1 WHERE t1.id = id;

                RETURN @parent;

                END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `abstract_display_field`
--

CREATE TABLE `abstract_display_field` (
  `id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` text NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL,
  `display_field_group_id` bigint(20) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_config`
--

CREATE TABLE `hs_hr_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_config`
--

INSERT INTO `hs_hr_config` (`key`, `value`) VALUES
('admin.default_workshift_end_time', '17:00'),
('admin.default_workshift_start_time', '09:00'),
('admin.localization.default_date_format', 'Y-m-d'),
('admin.localization.default_language', 'en_US'),
('admin.localization.use_browser_language', 'No'),
('admin.product_type', 'os'),
('attendanceEmpEditSubmitted', 'No'),
('attendanceSupEditSubmitted', 'No'),
('authorize_user_role_manager_class', 'BasicUserRoleManager'),
('beacon.activation_acceptance_status', 'off'),
('beacon.activiation_status', 'on'),
('beacon.company_name', ''),
('beacon.flash_period', '120'),
('beacon.lock', 'unlocked'),
('beacon.next_flash_time', '0000-00-00'),
('beacon.uuid', 'y8Ei+mY29fo6SA=='),
('csrf_secret', 'm7et3inorud91lcsvua1fuio1f180f8co1884umipjvp3u1hk2f4m'),
('domain.name', 'localhost'),
('hsp_accrued_last_updated', '0000-00-00'),
('hsp_current_plan', '0'),
('hsp_used_last_updated', '0000-00-00'),
('include_supervisor_chain', 'No'),
('ldap_domain_name', ''),
('ldap_port', ''),
('ldap_server', ''),
('ldap_status', ''),
('leave.entitlement_consumption_algorithm', 'FIFOEntitlementConsumptionStrategy'),
('leave.include_pending_leave_in_balance', '1'),
('leave.leavePeriodStatus', '1'),
('leave.work_schedule_implementation', 'BasicWorkSchedule'),
('leave_period_defined', 'Yes'),
('openId.provider.added', 'off'),
('pim_show_deprecated_fields', '0'),
('report.mysql_group_concat_max_len', '2048'),
('showSIN', '0'),
('showSSN', '0'),
('showTaxExemptions', '0'),
('themeName', 'default'),
('timesheet_period_and_start_date', '<TimesheetPeriod><PeriodType>Weekly</PeriodType><ClassName>WeeklyTimesheetPeriod</ClassName><StartDate>1</StartDate><Heading>Week</Heading></TimesheetPeriod>'),
('timesheet_period_set', 'Yes'),
('timesheet_time_format', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_country`
--

CREATE TABLE `hs_hr_country` (
  `cou_code` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `cou_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_country`
--

INSERT INTO `hs_hr_country` (`cou_code`, `name`, `cou_name`, `iso3`, `numcode`) VALUES
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CN', 'CHINA', 'China', 'CHN', 156),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IN', 'INDIA', 'India', 'IND', 356),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PE', 'PERU', 'Peru', 'PER', 604),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_currency_type`
--

CREATE TABLE `hs_hr_currency_type` (
  `code` int(11) NOT NULL DEFAULT '0',
  `currency_id` char(3) NOT NULL DEFAULT '',
  `currency_name` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_currency_type`
--

INSERT INTO `hs_hr_currency_type` (`code`, `currency_id`, `currency_name`) VALUES
(3, 'AED', 'Utd. Arab Emir. Dirham'),
(4, 'AFN', 'Afghanistan Afghani'),
(5, 'ALL', 'Albanian Lek'),
(6, 'ANG', 'NL Antillian Guilder'),
(7, 'AOR', 'Angolan New Kwanza'),
(177, 'ARP', 'Argentina Pesos'),
(8, 'ARS', 'Argentine Peso'),
(10, 'AUD', 'Australian Dollar'),
(11, 'AWG', 'Aruban Florin'),
(12, 'BBD', 'Barbados Dollar'),
(13, 'BDT', 'Bangladeshi Taka'),
(15, 'BGL', 'Bulgarian Lev'),
(16, 'BHD', 'Bahraini Dinar'),
(17, 'BIF', 'Burundi Franc'),
(18, 'BMD', 'Bermudian Dollar'),
(19, 'BND', 'Brunei Dollar'),
(20, 'BOB', 'Bolivian Boliviano'),
(21, 'BRL', 'Brazilian Real'),
(22, 'BSD', 'Bahamian Dollar'),
(23, 'BTN', 'Bhutan Ngultrum'),
(24, 'BWP', 'Botswana Pula'),
(25, 'BZD', 'Belize Dollar'),
(26, 'CAD', 'Canadian Dollar'),
(27, 'CHF', 'Swiss Franc'),
(28, 'CLP', 'Chilean Peso'),
(29, 'CNY', 'Chinese Yuan Renminbi'),
(30, 'COP', 'Colombian Peso'),
(31, 'CRC', 'Costa Rican Colon'),
(32, 'CUP', 'Cuban Peso'),
(33, 'CVE', 'Cape Verde Escudo'),
(34, 'CYP', 'Cyprus Pound'),
(171, 'CZK', 'Czech Koruna'),
(37, 'DJF', 'Djibouti Franc'),
(38, 'DKK', 'Danish Krona'),
(39, 'DOP', 'Dominican Peso'),
(40, 'DZD', 'Algerian Dinar'),
(41, 'ECS', 'Ecuador Sucre'),
(43, 'EEK', 'Estonian Krona'),
(44, 'EGP', 'Egyptian Pound'),
(46, 'ETB', 'Ethiopian Birr'),
(42, 'EUR', 'Euro'),
(48, 'FJD', 'Fiji Dollar'),
(49, 'FKP', 'Falkland Islands Pound'),
(51, 'GBP', 'Pound Sterling'),
(52, 'GHC', 'Ghanaian Cedi'),
(53, 'GIP', 'Gibraltar Pound'),
(54, 'GMD', 'Gambian Dalasi'),
(55, 'GNF', 'Guinea Franc'),
(57, 'GTQ', 'Guatemalan Quetzal'),
(58, 'GYD', 'Guyanan Dollar'),
(59, 'HKD', 'Hong Kong Dollar'),
(60, 'HNL', 'Honduran Lempira'),
(61, 'HRK', 'Croatian Kuna'),
(62, 'HTG', 'Haitian Gourde'),
(63, 'HUF', 'Hungarian Forint'),
(64, 'IDR', 'Indonesian Rupiah'),
(66, 'ILS', 'Israeli New Shekel'),
(67, 'INR', 'Indian Rupee'),
(68, 'IQD', 'Iraqi Dinar'),
(69, 'IRR', 'Iranian Rial'),
(70, 'ISK', 'Iceland Krona'),
(72, 'JMD', 'Jamaican Dollar'),
(73, 'JOD', 'Jordanian Dinar'),
(74, 'JPY', 'Japanese Yen'),
(75, 'KES', 'Kenyan Shilling'),
(76, 'KHR', 'Kampuchean Riel'),
(77, 'KMF', 'Comoros Franc'),
(78, 'KPW', 'North Korean Won'),
(79, 'KRW', 'Korean Won'),
(80, 'KWD', 'Kuwaiti Dinar'),
(81, 'KYD', 'Cayman Islands Dollar'),
(82, 'KZT', 'Kazakhstan Tenge'),
(83, 'LAK', 'Lao Kip'),
(84, 'LBP', 'Lebanese Pound'),
(85, 'LKR', 'Sri Lanka Rupee'),
(86, 'LRD', 'Liberian Dollar'),
(87, 'LSL', 'Lesotho Loti'),
(88, 'LTL', 'Lithuanian Litas'),
(90, 'LVL', 'Latvian Lats'),
(91, 'LYD', 'Libyan Dinar'),
(92, 'MAD', 'Moroccan Dirham'),
(93, 'MGF', 'Malagasy Franc'),
(94, 'MMK', 'Myanmar Kyat'),
(95, 'MNT', 'Mongolian Tugrik'),
(96, 'MOP', 'Macau Pataca'),
(97, 'MRO', 'Mauritanian Ouguiya'),
(98, 'MTL', 'Maltese Lira'),
(99, 'MUR', 'Mauritius Rupee'),
(100, 'MVR', 'Maldive Rufiyaa'),
(101, 'MWK', 'Malawi Kwacha'),
(102, 'MXN', 'Mexican New Peso'),
(172, 'MXP', 'Mexican Peso'),
(103, 'MYR', 'Malaysian Ringgit'),
(104, 'MZM', 'Mozambique Metical'),
(105, 'NAD', 'Namibia Dollar'),
(106, 'NGN', 'Nigerian Naira'),
(107, 'NIO', 'Nicaraguan Cordoba Oro'),
(109, 'NOK', 'Norwegian Krona'),
(110, 'NPR', 'Nepalese Rupee'),
(111, 'NZD', 'New Zealand Dollar'),
(112, 'OMR', 'Omani Rial'),
(113, 'PAB', 'Panamanian Balboa'),
(114, 'PEN', 'Peruvian Nuevo Sol'),
(115, 'PGK', 'Papua New Guinea Kina'),
(116, 'PHP', 'Philippine Peso'),
(117, 'PKR', 'Pakistan Rupee'),
(118, 'PLN', 'Polish Zloty'),
(120, 'PYG', 'Paraguay Guarani'),
(121, 'QAR', 'Qatari Rial'),
(122, 'ROL', 'Romanian Leu'),
(123, 'RUB', 'Russian Rouble'),
(180, 'RUR', 'Russia Rubles'),
(173, 'SAR', 'Saudi Arabia Riyal'),
(125, 'SBD', 'Solomon Islands Dollar'),
(126, 'SCR', 'Seychelles Rupee'),
(127, 'SDD', 'Sudanese Dinar'),
(128, 'SDP', 'Sudanese Pound'),
(129, 'SEK', 'Swedish Krona'),
(131, 'SGD', 'Singapore Dollar'),
(132, 'SHP', 'St. Helena Pound'),
(130, 'SKK', 'Slovak Koruna'),
(135, 'SLL', 'Sierra Leone Leone'),
(136, 'SOS', 'Somali Shilling'),
(137, 'SRD', 'Surinamese Dollar'),
(138, 'STD', 'Sao Tome/Principe Dobra'),
(139, 'SVC', 'El Salvador Colon'),
(140, 'SYP', 'Syrian Pound'),
(141, 'SZL', 'Swaziland Lilangeni'),
(142, 'THB', 'Thai Baht'),
(143, 'TND', 'Tunisian Dinar'),
(144, 'TOP', 'Tongan Pa''anga'),
(145, 'TRL', 'Turkish Lira'),
(146, 'TTD', 'Trinidad/Tobago Dollar'),
(147, 'TWD', 'Taiwan Dollar'),
(148, 'TZS', 'Tanzanian Shilling'),
(149, 'UAH', 'Ukraine Hryvnia'),
(150, 'UGX', 'Uganda Shilling'),
(151, 'USD', 'United States Dollar'),
(152, 'UYP', 'Uruguayan Peso'),
(153, 'VEB', 'Venezuelan Bolivar'),
(154, 'VND', 'Vietnamese Dong'),
(155, 'VUV', 'Vanuatu Vatu'),
(156, 'WST', 'Samoan Tala'),
(158, 'XAF', 'CFA Franc BEAC'),
(159, 'XAG', 'Silver (oz.)'),
(160, 'XAU', 'Gold (oz.)'),
(161, 'XCD', 'Eastern Caribbean Dollars'),
(179, 'XDR', 'IMF Special Drawing Right'),
(162, 'XOF', 'CFA Franc BCEAO'),
(163, 'XPD', 'Palladium (oz.)'),
(164, 'XPF', 'CFP Franc'),
(165, 'XPT', 'Platinum (oz.)'),
(166, 'YER', 'Yemeni Riyal'),
(167, 'YUM', 'Yugoslavian Dinar'),
(175, 'YUN', 'Yugoslav Dinar'),
(168, 'ZAR', 'South African Rand'),
(176, 'ZMK', 'Zambian Kwacha'),
(169, 'ZRN', 'New Zaire'),
(170, 'ZWD', 'Zimbabwe Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_export`
--

CREATE TABLE `hs_hr_custom_export` (
  `export_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `headings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_fields`
--

CREATE TABLE `hs_hr_custom_fields` (
  `field_num` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `screen` varchar(100) DEFAULT NULL,
  `extra_data` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_custom_import`
--

CREATE TABLE `hs_hr_custom_import` (
  `import_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `fields` text,
  `has_heading` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_district`
--

CREATE TABLE `hs_hr_district` (
  `district_code` varchar(13) NOT NULL DEFAULT '',
  `district_name` varchar(50) DEFAULT NULL,
  `province_code` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_employee`
--

CREATE TABLE `hs_hr_employee` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `employee_id` varchar(50) DEFAULT NULL,
  `emp_lastname` varchar(100) NOT NULL DEFAULT '',
  `emp_firstname` varchar(100) NOT NULL DEFAULT '',
  `emp_middle_name` varchar(100) NOT NULL DEFAULT '',
  `emp_nick_name` varchar(100) DEFAULT '',
  `emp_smoker` smallint(6) DEFAULT '0',
  `ethnic_race_code` varchar(13) DEFAULT NULL,
  `emp_birthday` date DEFAULT NULL,
  `nation_code` int(4) DEFAULT NULL,
  `emp_gender` smallint(6) DEFAULT NULL,
  `emp_marital_status` varchar(20) DEFAULT NULL,
  `emp_ssn_num` varchar(100) CHARACTER SET latin1 DEFAULT '',
  `emp_sin_num` varchar(100) DEFAULT '',
  `emp_other_id` varchar(100) DEFAULT '',
  `emp_dri_lice_num` varchar(100) DEFAULT '',
  `emp_dri_lice_exp_date` date DEFAULT NULL,
  `emp_military_service` varchar(100) DEFAULT '',
  `emp_status` int(13) DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `eeo_cat_code` int(11) DEFAULT NULL,
  `work_station` int(6) DEFAULT NULL,
  `emp_street1` varchar(100) DEFAULT '',
  `emp_street2` varchar(100) DEFAULT '',
  `city_code` varchar(100) DEFAULT '',
  `coun_code` varchar(100) DEFAULT '',
  `provin_code` varchar(100) DEFAULT '',
  `emp_zipcode` varchar(20) DEFAULT NULL,
  `emp_hm_telephone` varchar(50) DEFAULT NULL,
  `emp_mobile` varchar(50) DEFAULT NULL,
  `emp_work_telephone` varchar(50) DEFAULT NULL,
  `emp_work_email` varchar(50) DEFAULT NULL,
  `sal_grd_code` varchar(13) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `emp_oth_email` varchar(50) DEFAULT NULL,
  `termination_id` int(4) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_employee`
--

INSERT INTO `hs_hr_employee` (`emp_number`, `employee_id`, `emp_lastname`, `emp_firstname`, `emp_middle_name`, `emp_nick_name`, `emp_smoker`, `ethnic_race_code`, `emp_birthday`, `nation_code`, `emp_gender`, `emp_marital_status`, `emp_ssn_num`, `emp_sin_num`, `emp_other_id`, `emp_dri_lice_num`, `emp_dri_lice_exp_date`, `emp_military_service`, `emp_status`, `job_title_code`, `eeo_cat_code`, `work_station`, `emp_street1`, `emp_street2`, `city_code`, `coun_code`, `provin_code`, `emp_zipcode`, `emp_hm_telephone`, `emp_mobile`, `emp_work_telephone`, `emp_work_email`, `sal_grd_code`, `joined_date`, `emp_oth_email`, `termination_id`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
(1, '0001', 'Boahen', 'Nathaniel', 'Asare', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '0002', 'Koomson', 'Prince', 'Annan', '', 0, NULL, NULL, 69, 1, 'Single', '', '', '2345688', '', '2018-01-13', '', 1, 1, 5, 5, 'Box KN 2750', '', 'Kaneshie', 'GH', 'Accra', '00233', '+233277154449', '+233277154449', '+233277154449', 'prince.koomson@afr.l-ih.com', NULL, '2013-02-02', 'annan.pk@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '0003', 'Addo', 'Austin', 'A', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '0004', 'Ansah', 'Cobby', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '0005', 'Boahen', 'Asare', '', '', 0, NULL, NULL, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_attachment`
--

CREATE TABLE `hs_hr_emp_attachment` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eattach_id` int(11) NOT NULL DEFAULT '0',
  `eattach_desc` varchar(200) DEFAULT NULL,
  `eattach_filename` varchar(100) DEFAULT NULL,
  `eattach_size` int(11) DEFAULT '0',
  `eattach_attachment` mediumblob,
  `eattach_type` varchar(200) DEFAULT NULL,
  `screen` varchar(100) DEFAULT '',
  `attached_by` int(11) DEFAULT NULL,
  `attached_by_name` varchar(200) DEFAULT NULL,
  `attached_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_basicsalary`
--

CREATE TABLE `hs_hr_emp_basicsalary` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `sal_grd_code` int(11) DEFAULT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `ebsal_basic_salary` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `payperiod_code` varchar(13) DEFAULT NULL,
  `salary_component` varchar(100) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_basicsalary`
--

INSERT INTO `hs_hr_emp_basicsalary` (`id`, `emp_number`, `sal_grd_code`, `currency_id`, `ebsal_basic_salary`, `payperiod_code`, `salary_component`, `comments`) VALUES
(1, 2, 1, 'USD', '2000', '4', 'Annual Basic Salary', '');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_children`
--

CREATE TABLE `hs_hr_emp_children` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ec_name` varchar(100) DEFAULT '',
  `ec_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_contract_extend`
--

CREATE TABLE `hs_hr_emp_contract_extend` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `econ_extend_id` decimal(10,0) NOT NULL DEFAULT '0',
  `econ_extend_start_date` datetime DEFAULT NULL,
  `econ_extend_end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_contract_extend`
--

INSERT INTO `hs_hr_emp_contract_extend` (`emp_number`, `econ_extend_id`, `econ_extend_start_date`, `econ_extend_end_date`) VALUES
(2, '1', '2013-04-04 00:00:00', '2016-04-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_dependents`
--

CREATE TABLE `hs_hr_emp_dependents` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ed_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ed_name` varchar(100) DEFAULT '',
  `ed_relationship_type` enum('child','other') DEFAULT NULL,
  `ed_relationship` varchar(100) DEFAULT '',
  `ed_date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_directdebit`
--

CREATE TABLE `hs_hr_emp_directdebit` (
  `id` int(11) NOT NULL,
  `salary_id` int(11) NOT NULL,
  `dd_routing_num` int(9) NOT NULL,
  `dd_account` varchar(100) NOT NULL DEFAULT '',
  `dd_amount` decimal(11,2) NOT NULL,
  `dd_account_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'CHECKING, SAVINGS',
  `dd_transaction_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'BLANK, PERC, FLAT, FLATMINUS'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_directdebit`
--

INSERT INTO `hs_hr_emp_directdebit` (`id`, `salary_id`, `dd_routing_num`, `dd_account`, `dd_amount`, `dd_account_type`, `dd_transaction_type`) VALUES
(1, 1, 11111, '012222222', '2000.00', 'SAVINGS', '');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_emergency_contacts`
--

CREATE TABLE `hs_hr_emp_emergency_contacts` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eec_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `eec_name` varchar(100) DEFAULT '',
  `eec_relationship` varchar(100) DEFAULT '',
  `eec_home_no` varchar(100) DEFAULT '',
  `eec_mobile_no` varchar(100) DEFAULT '',
  `eec_office_no` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_emergency_contacts`
--

INSERT INTO `hs_hr_emp_emergency_contacts` (`emp_number`, `eec_seqno`, `eec_name`, `eec_relationship`, `eec_home_no`, `eec_mobile_no`, `eec_office_no`) VALUES
(2, '1', 'Kate Koomson', 'Elder Sister', '+233277154449', '+233277154449', '+233277154449');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_history_of_ealier_pos`
--

CREATE TABLE `hs_hr_emp_history_of_ealier_pos` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `emp_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ehoep_job_title` varchar(100) DEFAULT '',
  `ehoep_years` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_language`
--

CREATE TABLE `hs_hr_emp_language` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL,
  `fluency` smallint(6) NOT NULL DEFAULT '0',
  `competency` smallint(6) DEFAULT '0',
  `comments` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_locations`
--

CREATE TABLE `hs_hr_emp_locations` (
  `emp_number` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_locations`
--

INSERT INTO `hs_hr_emp_locations` (`emp_number`, `location_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_member_detail`
--

CREATE TABLE `hs_hr_emp_member_detail` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `membship_code` int(6) NOT NULL DEFAULT '0',
  `ememb_subscript_ownership` varchar(20) DEFAULT NULL,
  `ememb_subscript_amount` decimal(15,2) DEFAULT NULL,
  `ememb_subs_currency` varchar(20) DEFAULT NULL,
  `ememb_commence_date` date DEFAULT NULL,
  `ememb_renewal_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_member_detail`
--

INSERT INTO `hs_hr_emp_member_detail` (`emp_number`, `membship_code`, `ememb_subscript_ownership`, `ememb_subscript_amount`, `ememb_subs_currency`, `ememb_commence_date`, `ememb_renewal_date`) VALUES
(2, 1, 'Individual', '36.00', 'USD', '2017-01-25', '2017-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_passport`
--

CREATE TABLE `hs_hr_emp_passport` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `ep_seqno` decimal(2,0) NOT NULL DEFAULT '0',
  `ep_passport_num` varchar(100) NOT NULL DEFAULT '',
  `ep_passportissueddate` datetime DEFAULT NULL,
  `ep_passportexpiredate` datetime DEFAULT NULL,
  `ep_comments` varchar(255) DEFAULT NULL,
  `ep_passport_type_flg` smallint(6) DEFAULT NULL,
  `ep_i9_status` varchar(100) DEFAULT '',
  `ep_i9_review_date` date DEFAULT NULL,
  `cou_code` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_picture`
--

CREATE TABLE `hs_hr_emp_picture` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `epic_picture` mediumblob,
  `epic_filename` varchar(100) DEFAULT NULL,
  `epic_type` varchar(50) DEFAULT NULL,
  `epic_file_size` varchar(20) DEFAULT NULL,
  `epic_file_width` varchar(20) DEFAULT NULL,
  `epic_file_height` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_picture`
--

INSERT INTO `hs_hr_emp_picture` (`emp_number`, `epic_picture`, `epic_filename`, `epic_type`, `epic_file_size`, `epic_file_width`, `epic_file_height`) VALUES
(2, 0xffd8ffe000104a46494600010100000100010000ffdb004300030202020202030202020303030304060404040404080606050609080a0a090809090a0c0f0c0a0b0e0b09090d110d0e0f101011100a0c12131210130f101010ffdb00430103030304030408040408100b090b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010ffc000110801f401f403012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fbc7d7ad28dd49b7934ec62bcf3a841915203c5329e03014102ff151f3520e877353877a0b100f5a5ce2971c6690734137154e69ebd693fdda55eb4123ba0ef4773f35260fad3b6e07a50300a7ad397ad0dd69477cd01d4016a5a338ef4672280149ed499e0514b86ff66a9168703f2d2e7bfad274fe2a5fca8b1000934b863fc540068cfa714c030c0d381c9a6d3875340f945a3a9eb4514122e7b6ea3e6dbf7a92919d224691dc22a02c598e028032493d862801777d2957a5734be39b6bdd60e89a0689a96af3c68924f242d1c305ba38ca99249586323040ea72302ba542594164da48e87191f971f95031f90052d33a9e94bd47b502b067f8a8c9a3a67e5c74eb4bb4e376c6c7ae0e28189b968ddfdda6ff00ba41a50680428e7bd2f4fbadfad27e79a4a00767fbdcd34ed39a51d690fb56a037a52605388e84d27534086e5a90f5a7d210bfc540d3101cd19c9db4743c527fc0b3f4ac804239a6d389c5273d6829ec19c7cb4dc3629d934d6f5a0810ee14d25beb4fc29a42bc1a063485f5a4a53d3ffad413ef436219bb14879fad388cd33e6a7ccc634922909cd388ce7d698463e948a8899ff6bf4a3fdea300521e4d431b03d69b96fef53b906918508988d19a28a2acb02304e3bd00e29d4da833419e314f1d3f0a681fecd3c74a06c368a3aff0d2d2818a05b0639c528381476fc2947340840735201d33eb480629cbe940ec28e3aad14528db41604f6a51c9a43c1a51ba8000734e0334743f2d28e4504063145145522b94938c5378f4a5a2a4404a814679fbb4a073f2d1ff0001aa4201d3e5a503d7f9d2aff4a503229809f45a29c05005016106dfad715f17350bfb5f0b59e9ba63f9571afeb9a768a1faec13cc0138efc03c1e3f5aee368ac0f1b68ebab68425890b5c697776faadb158f732cb6efe60703be0678ee33df14e3b81a3a468fa6e836434dd2e12b0891e5773cbcf293f34b21fe391ba93f40060015740e3d2b9fd2bc6da35ec31aea4e34a9a48fcd4170716f347d44b04df7248c8ed90e3a3a820d4e7c73e0d172b649e24b196e2493ca8e2864f364924c7dd5099c9e3a0a72036873ee6919b6ab1447623a007058fd6b98bbf883a6db1717177a65a18faa5c5df9b22ff00bcb16761f6c9fad72dae7ed1bf0d7c2d1493788bc5ba45bc71f56315f4518fac9e4320fa9a903b7bbb0f155db078b5bb4b34ce4410c52703de40c0b9f53803dbbd51b8d0f5d76f3a6513c9d3ccb5d66e60931ebb5c63ff001fae7b44fda4be0b6b4628478d20b3b99e312882ea293e64fefc72461a3923e9f329c7ae0f15dce81e2af0bf8aa169fc2fe26d23584441239d3efa2b82a0f722362451cac0e6750f175f784639ae75a8afae2ceda379ae63b98bfd262800dcd2c1227c9721792f1e7ccc0e09fb95d8d9ded8ea16706a3a6dd45756779125cdb5c40fba29a271956523820820e6a79618658dade68a39627fbd1b8cab7f9f5af27f8396767f0f2fafbe15e9df681e1eb7bdd44680b34865fb398262d3da063cec11cd1488a7a625038c5572dd08f56ea69319f9aa42a47ffaa93f2a918cff0080d191e94ea2815c61fca9bd69e7ad34ff00b27340d89452e3fbdc504fe340ac378228273fc34a719a3f1a00630a6918c5487a5368ea57d9180e28a76d149c834992271d69b4eeb41da47dea10d0cedf85263069f8e3349d6863e51951b1c53dbae698477a25a845094d6a752138a107da184668078a7375a6919a96530279a6d2e0d25085ca34939fbb452b7de3455941bbda900c9a52724f5a5031504f320a78e4714dc64d3d682000c53a8a5001a941b8806474cd3c0c7dda4e94a063f2aa2a284c64d39466939f7a55e39a06c70fef5006694039ddb78a51cd0342018a701de86a073c5040a052e57fbd49e9b452ff00c0681077ff000a3a8a5031f5a5ee7e5341771703d6803da9547f7969dff01a7624695a7631cd2d14d0584000fe2e69d85c62933fecd19feead300c7f17f3a7007236e4e7d0553bbb3bb9c30875abdb4dfc7eed6027f0df19feb5e5de31d3a479af74ab6f1f78e3579f4f8fcdd40fdbec2ded6c632bbbf7f21b611a7c9cf2460633c9029c57308f51bbd634db497ecd25c892e0726de11e6ca3fde51f73fe058acabad4b5abbb8f2edaf23d2a34e4aa0135e37a124fc917e44d707e08d2bc5b71a68175a8be89e1b8899614174f71a9ea31ec1fe91737728516f11ebe5c71838c1dd183cd6d43e2a695e73785fe19e891f882e602629ae03345a7c241f9b32f594823e7238edb89348bb25b9d4dbd945a14373fd8493ad8c85ee67fb75cff00a32b924b4a3ccc08f24927a275214561c67fe12eba966bcd6751bfb4b42618068b03c50cb9c79989dc00f19380769f9b6f271c557b11341796fabfc40d6df59be90e60b286cffd1e3f6b6b24c9723b33163df23a577f13f886fa212db787e4b15719075390249ff7e63dce0fb12334d3b85d23954f0d4af0886dacfc5fa6c31e7625b788e2b718ff00ae512e31ed9a9e3d0efb4c637368be2791fb0730dd819ee46e5c8f63d6b7a5d275b6cbdfeab731ae7fe5dd62b38c0f707cd93ff1f5a8bfb03c3771137da2db5cbe923396953ed772aa4f3924b6ce9ef45c4e48f1af88de06f0f4b035fdbf84a7d29bcc13896d6d7ec5f62b827fe3ea257dd6e8f9003ac72445bd735bfe0a9742f11e8104ba958410eada6b947d5f4c8458ea56976846e24a00f9390486ca48186f12021ebbcbcd0acaeacb3a659dca10af879b4cb8da49ec5a0b8047e00f04715c8e85a53c1e22bbd3654bbb326c5e56f3257962631328fddcceaaff00eaa59571264e36609db9073317bb23afd0fc7f69a6d9ea76de35d62dcff62d97f687f6a471f971ded97037f963a4ca48531ae77168ca7dec55bd0acaff00fb16c355d6b4d4b3d5aff574d505a3fdfb4927793311ff006d61215fdc1ae13c1de018b51d522f881e3abab56d1f47bf93fb02d207796deeee5095fb7c840fdeb12098a15042139e4aae3d52e60d5e4d6bedf2c56c60b7801b5b79a49229c4b203e6c920c601c6020ff7c9a6e5603578ed4566c5ad33873fd9176c22ff0058d6b2457017ea11b23bf51504be29b38fe58b44f105d4d9c086df4c2d21ff00c7b03f122a42e6ce17d7348768155f4ebbb9bdb517177a55c69d21247d9ee590caa3df61201f6ce454e5bfbb4008429c629a460d3f3eb4375aae50b8cf971eb4d3b47f171521009a6955fad480ca29d8c1e9498ff67f5a0561add29303d69cc38f969bdfe6e68ea57d910f14d27fd9a752fca47bd26219ff0002a43d3ef1a77cc291871c5480dcf18a6938a53d6933d9aaac58da695cd3bfd9a5e7de9999091834d6a94f5a8d8505f30da5da6929d9e3350c6c6100d369f9f6a4231f4a10c6d145156018e734039a5239f9695454190018a7038149f2fd69cbc76a062819a7514bf9e6a50d20033467df1494a3ad5161d3e94e519342f4f9a9c3b504ee2d3a9b4eeb4021bd4528e3ad2e17345029075a51d681fed53ba7bd04a1473ed4ea073fddfc29c06281dae202dda8c9f4a0f1d28279a770007b528e450bcd3bbedc53b8098cfcb8a50833ef46d14e50cc70ab9cd30303c61aedde85a759c5a618ff00b5358d46df48d384bf744f2ee66908ee238a29a523b88eb8cd26c62d5b4bd3e0d52075d161bc79a2b031fefb59d54caccd3dc679904647c8a78257cc7e0261faff0088edb5dd7f4df1528dfe1af0d5cdc7f664b047e6dc6b7abcb0c96a12d0778a38e598093fe5a3b120f96a49a73cbe2cd5f509345b4b58a4f135e438bd314a5ad340b390f10b4dff003d187dfdbf3c87217030456cb40496e723e309bc43f16b57b9f0ebea5169de18d32512eab75e666d0107e5527fe5e24ce700fc85f9db800b7a5787bc3bf60d2a3d2bc29a6a68ba508c1b9d57508809a6403ac713f5e3f8a5db1a8fb8af5a7e1df04f87fc11616ed213773c52f991168b8fb43e3261847fcb4200c31cbe07518ad2be58fc97d63c592c51d9dbb7991d9e4b44a7b197af9d293d146403d01e4d42f329bec45e1ad2b47d1e396e7c3da7ba0914b5ceb17ac7ceb83dc991fe7718eff220c60551d4fc7b696881f4cb68eea373e5a6a17f73f65b263e91615a598fb45191eac2b3b58b0f1278de5db7f33e95a664116d20124f277dd20c900ffb27851ebcd3741d06d6fa6fb7f866271093e4cbafcc7ccb8b9038296b21e91e78322e10e309d09aaf4125d5942efc43f11b57b8363a3ca6de61c174b416db49e47ca7cd9538ef23c47d01abb63f096d3502352f89fab4be2891173f64bc9a596ce2c9ea448cc5fd304ec1e95db697670e9f6b1d9dac2638533855ff00968e7a93fdf27b93fd2b9dd6357d6bc4737f657857501a6d847215bed6a20249491f7e1b3c8d9bfb3ced90bc8505b90fe2115bc4fe3ab9d0e43e1af87fe13fedad760886dd3e3963b5b6b28c8fddcb79311b2d62c0271879481f2475e1fa9e97fb5b78825b8365f147c2972f7b11dba5a6841745639e4abdc86b8993b195906ee4276af6eb94d17c2da347a0e93a5c6df689088ad8924dc4e465a4958e5e427abc8d938ff8003c8eb7772a5bc8b717b27d924731dede21c4da84e80ffa2c27a2431a0632c9c08d23f2c1c97345ec3e55d493c21e09d1afb4e4bff88b69e1ad47c469732d98bab292e974b68d08c7d93cc39b543924c6b94593a1c1aeadfe1ee91a6aa41a3f8a3c6fe1c68c63ca8bc4775320e3a88e669237edd8fbe2b8ef0c5d4fe2ef017fc25373651c318befb3e956d0c402c3611b8886d57e1cc85d98e4624f93a230addfed4920d3ace4bfb9f3fc3b76c915b5d92dff0012cb920158a473c885b2a6298e0aeef2dc91b3084d2455f10e95f107c2aa9addfdecfe34d3e1199353d26da2b1f11d9c7fde0a8bf66d4621fc511446ee0498aea7c1de2d8f59d2ed355b7d5f4ed7741d4062d35bb18fc801f3830ddc1ff2ca4078c8e33c15538cdad2af753d26279ae1649ed13876db9684f1f3f1d4723200edbf8e41e32fac2e3e1ef88ef35bf0f595bff65f8924df7d6521c41f6f7188c9c748e7e10be0ed90c679462285a8ac7ac01b4018c638c7a52741583e06f12e91e2bf0ed9eb5a0df35e697770a5c58cc7ef79449531c9e92452249191eab8adf1e8dda96c1b0cea6978f7a76075dd4d3d3357726c252315a52314d6eb5052001b3f7a90f3fc3cd03f1cd140d0df987f0d21dd9a9383d29a477a006e587bd275f9b6d388a423350210e7ef546e7a5389c536a90c08cd30f1f29a7d045315c8ff008a909c52918a4cae073cd26037a9a42b934a7fd9a09cd1b17618462906ea931914c2369a92869ef49d39f4a283d0d00328a76051400a063e66a3be683d6803b0a8334281914e039a4c718a0706aba0edd493b7e34940fbb4a06696c3d853f9d281d85038a5e41aa283f3a5c8a4e7ef525003e9793df142ff000d280dfdea09e61700f46a50314018a5ff00768243e5e945196a5018f61400e07d29c39a62f4a77f1501b01e4d1851ff00ed52f3ed40dc7f8a8001f5a775f9a931ff00eba55e71fd2aac3e51c47031d6b83f891aabea17b61f0e2c66b8ddac4125eea82d0e2e3fb3108530c641cc6f3c84c7e670163598e722ba6d4acfc4f7c248acbc4369a4c47ee496d61f699f1eb9959510fe0e2bc83c4be08f0c78f3c67aa783b52d4b54d5348d1ada297c71abdfde6212a72d069588c2a190a3b49206dc218e40000d2822a2ae2bf29d2f87dffe136b85b9f085f5947696119b21add92a4d65603fd5b5a69b9ca4b201c493f28bd39e4575b6eda3f87a393c39e1b8424d13a35c1e6693cd90641909e65b86193c9e07ce7098158baff8964f0e58683e0ef03e936765ae6b713dae83a6880241a469f020f36fa6847dc86142a7cbfe29248a3ea4d6de85a0e9de0ed3e2851ae2f2e5cc86392793ccb8b895ce659a46ef2487e676e80610602815617b9a490dbe9806a37d297b8c18d0efdc467928beae7b9ef8ec062b32fe68817d775ab98ade0b047957cd70b0d9a7f14849e37ffb5f80a9a494ab3dfea3711829192f29e228231c9c7a20c727a9ae335bd43ed7a869373268f26ada85c5d44340f0f4b27950ef71bbfb4aff00ae04680c88847ca06402e72332f63a64b67d76213ea3e6da68d210161642b36a19e71b7efa467fbb8cb77c0adf7b98e12b6b690c71240369e8b1c6107280f440a3a9e8a3de8b5d26688493dcea525d6a338da6ed86d1183d4429d231d7d49ee4d737af6b5a5d9a258c28258a4212180ffcbc007393e9129e4e7fd63e4f4140b71fabc92f8a5859f9d3dbe9730f9a38d8c535f47d70cdf7e2b73edf3c838c8157d4416368159a286dede3cf0b848e34ec00e800ec2abd94e042f71336d27e7965738cfa13e9ecbd81f7ae7fc43acc97d27f6705923b712462550fb2495cf2b103d9ce371ed1a2927a52b956b0cbb97fb46e1e71162e6e43c318793618a0c82630c3ee75dd2c83919441971f27077768be3df1747e15b57d9a269f6a975adc8a9b5869687315aa81feacddc918f97f86da1e7265cd771ab49a57863c3773ad6b730f2a440be5460c66e30a488d7ba478dc7d71bdcfced546d343b9f077c34d566b98826bdafc86ef5076015bed33e23588e7a79516230bd06d205084c7692ad61e0985614c4d776977a93ee38011e59194fb0fddae07a0a4f875adca7e267c51f827af69f1cda6e97f62d7b4a132e566d275456f3606f68aed2e40ef87ff006455bd4edc41e0fb8bc673147790da69b680e41f29e582d61fa6632cd8ff00a68292eeee1d37f681b6bb48d14de7866decaf643c1f20df4b1c44fb2cd2267d3356ba932d8ec740b66d291fc1f78cd225b45e669f72c7e79ed81c618f7962c8527bfc8fdcd5c6d1edaf6c24d235d8a3b9b4937c47b8920230411d8e39c7a8f6ab1abe98fa95b20866fb3de5b4a27b594ffcb2940239ff00608255c770c6a8ea9ae6a56ba3ff006c5b68ff006878d5c5c5a79bb648ae076ddd00cfcbbbb651cf19c1e84ec781fec55a378cfc0a3e287c1ff1a4cd2cde0bf16ca2c64790b196ceff0037514aa4fdf8d810d9fef99057beeafab4965ace996575ab5a68fa65e5b5cb4d7f3a86c5c26df2e21bfe41905cf3d718158be10f15f813c5905cfc48f093c537dac47a5eb2ecbe55d59bdb3b2886ea23cc7244e5d486ec720915da6e752467907b7ad372bbb8ac67e837b3ea5a45bdf5de0c8fbc6f58ca09103b2ac814f203001803d3357c814a493f31e4fbd349e7b54142724d0462928a04215e7d29b52724d348cd034c6f1ed40db934b8eb494008d51b107bd48dd298548a9dc3a8c3d69a770a79ff00769bedfd2a8d04cf146ef6a5a45eb4132108e69a462a42334c65e6a09dc6719a43834118a3fe054d9a077fc691852e47b52119e69132198e7348d52119a88f5a02220e9452d14141cfe34ee8280319e3f5a5a8334007a51ce7751fee9fc28fe13548a4381cd3b6e0d228029f8e79a1830da68e7ef51c834019a2e3b875c53a900c53968b89b17ad3c0c636d30051d4669c0e453250b4038a3f9d2819a06253c74a4c0a77cbeb412f5131fc38a75267fbbcd2e71fc340c5c2d252f5c6da5c2d001b7269c88cc7660b37a0a16aaea9a4d8eaf6c6c752f364b6273244970d12c9ecdb3191edd2aae3b9c878c3e2259d8cdff08ef87f5091b559c18ccf676df6a96d3b7ee21407ceb8fee2e360387738ce7cebc3bab4361e0bbff895e27b78bc37f0e7c2e27bbd1b4a59fed9737d2024cdac5fcdcfda2e1a4122c318c82f97cc87cbdbeb9ad43a7db456fe06f0fe9368b77adc52c7f6383100fb1a00262c47223f9c213fed1c735e65e24d292d66d560b858a49afbc469696cf300b6f18d3ad238adbe5fb91c315c4b24a01e9b7279e6b48691b90f7297ecfb6fe2ff001158eaff00b487c50b3b8d375bf1acbe5695a2bafef74cd0a0665b1b200f492590c93499e4b919c6daf5e2f712b7da2f190dc48837ecfbabfec2fb0f5efd6b36c6e229ad6d2f8c5343a7da442db4b864c995d366d59d87fcf594738ec8c73c926adcd39b7492699823a44f2cafd441120c927d78078ee7d854bd59ac23a1c9f88bc4f16a9e304f86da2a1babfb4b68f55d5008b743046ee45b4531e84c855a410f56118cfc99cf4be0ad1906a57fe2095fcf3be4b1b69d8ee69483fe952ee3cb96914460fa467b35717e07b2fec6d13c49e21b2c9d6bc45acbcd24ef832b5cb88e0863f7f28ee03feb97b9af49bd9edbc33a1d9e8fa39ccbf26976614e4ef41f33fbed01989f5a40f62af8a7c4496913db428273cc66304812c83a827fe79ae4173df84193c5733a4e83797b7efacea8d995fef4b280074f4e8114761c7e449e8f4fd3e3b25f364d924e4005cf4541d0027a019273dc927a9e1b2c6fac4423de63b19064e386993b7d01ebf403d68e5293b18925c47a9a9d419cc5a569e5e48d66e16529c99a53e8319fc01ee2b0f47b79bc437c9addd2c90e9c439b28e61b5a4427324f283d371c1c7a044e80e76f5c853c43a92f84ad576d8593c66f881fbb693fd62c47d428db238eee6207b8aa1e368bfb52e13c13a45f4f64d70b045a8de46bb9ad2090ed8618ff00e9e252188f41973c6295ac26ee67786aea7f897e2d93c5f730b9d034998dae8eb203b6578cfef26c1eed2053cf68d00c00f9dff14ac7e23d7f4df07e77c310fed9d4d4724c0095863fac9264fd23ad85fec7f06787a2b6b5b51058584696b67670725b9c470c7eaec7f3249a8fc2f602cec6e355d4aeede5bed56437d7f768d98c0030b106ff009e5120d89db827bd55c0ccf1bcb2dd5c78734148c3fdb759b396403a0481da638f60625fc2aa5d58a5efc637bf9917ecdff08dda6953487b1b9bf98c67db12441aa8787ef9fc5fe3eb5d6dc15b3d3edaeee2d158f399d1638891ff005c40931d479c2ad6957973a9fc43f887a7a3b989346d2e3b4c74fb4db3cd712e3df17508e3a53444f63d5d4bb2877fbe473eb9ef50488915d07650d15dfee658f190cfd8fe206d3f41525b4e6e605b96c627025047a1191fe7daaadc4d0b5c368f2bed967b7373093df630c91eea76b7e22b211e2fe2bf015ffc3cf8951f8ffc11736d610f8a08b5bf7b819b696fce1618ef947df86e06213281be195627e4310de9de09f1141abdb3d87d9ae2d26b4263169747f7f06c2049031e85e1721770c868cc520241ab7afe9fa3f89747bef0d788a07934ed56d4c532a36d650e3e7da474757c321ec4035c2e8d73adc7693dcdf4a93f89bc2d742c3589a38f68d44471ee86ecaffd35b7901e3a16900c88eb5bde207a9d2119a8f4ebfb3d5ec2db53d36449ad6f214b881d4820a38c8e7bd4c4727ad45c08e9de94b487fbb4cab8da29703d6908ec6820298c79dd4a4e69369f7a963b099cfa5211fc54e23f8a9a79a4031b93ed49fa5387f7690a934ee58c3cd14a7fbbcd37f3a2e6760f5a6f5fe2a56e334de7eed22e221e3ad1d0fd69792693fd9a03946918a5fe2a43ba83d682469e39a6900d39ba537fe03400da29f8f6a29d8d03268a5ff1a423232dc566405281de902f3f7b34fc1a686c075a753475a753608339a7f19a68ff00769c3fbd4841d69c381474a29d896c3f8852af5f6a4c739a701834c63b191f2d3ba500f146314080714139a28033417ca14e5183de8029c17fbc6826d616803146314be940801c53a9a0669473f2f7e940d1970ddda683f102cf5ad41123b7bed2df4ff38ae4c5224c25033d704124fd33d0579bebbe1f37faf4f05c5e5bc9a3691ac5eea56b3265d7503733abc824fe03e496c088f12904fdd15d3f8e3c5fa64262d06d52e2f2f64990c71d9006e0c8878480f40f9041909f2e31bb393f2579e7c5af17db7862e7c2fe1bd6ded26d7bc41316d3bc3da6c9897539d33e55bc59c6cb753969aea4011522e3ae2b4bb6ac382d6ecf4cdd2bdf25cdcec17d32bb5b5b97c8b78f3cb9f53d016f5c20e33543c4f2c2ba6c7a2a4a546ab7d65a64d2637318ee278d644ff7da3f307b024fa02cf086957961a68bcbfd4a0d575ed60096eeee352b6e30388e153feaed611f70753cb9c96ad6d634b58fc3775aab40ed2d9c906a71093efe2dee2399988ecec91b1c761b05229b391f0aff00a5eb3a44171349b7ed3a9ead73327f098e497caffc7a438fd39aede48629b54372b0ec4b08058dba7fcf3070d2e07624f96bff000123d6b9af07dcc7a76bbaf07810c1a05adced6e0fdabccbbf36395719cc6d1b46a87b9127f76ba169c699a7c6f78c659cec420fde9ee243d07bb39eddb34ae25b8dbb3f6bb93a5a30080092ec8e3087958fd8b63a75d80ff78549a8de2d8dbf9ca80cd2131c28470cf8cf4f4001240ec2b3e6d6744f0b66c35ad62dc6a320375731825a673fc5218d3948c0180cd84014735ce42daaf8927bdf175eead67a6e832da88f46097214c96ef8265967e12379dc0f962cbf96146ee69f3144fe1c92f5e1b9b3d0ff007b7ab2c915dea12e0c76f216dd2ffd7498b9c05190be582e7a0a7ea5a7d9f86f5dd16ea6b89a2b0885d9b6863ccd7ba96a92a88d4851cc8c10cb2190fc8311e4a2ad6078bbe347857e1f7c36b9f1e23bdbf85ec24686df506b220ddb3ca4450585a1daf70ed9c063b5382493d6a1f877e2696f2d23f11de59df69f757b6305d6b373adddacd79049381247034a008a00b6e61cc31204df211f338248b6d4373a8d52c758bc92d56e9c5aea53810dadb4526f8f4c8a42232c5bfe5a5c365b2dd82b84e0126a78d75286fe38fc21a3db06d3448905c479c0b8d9feaec50fa1da0cb27411c727350789bc672d9dcecd3622b16a3cfda994995b1b5618a254e537032be3fd61018e173beb5348d12eacf4d4d42fd523bdb802048948db6303e3726470646e1091903210700930058f0769a9a69b89a47f39a28479f2e36f9d7123b4f3363b73b540ec81476aa7e053146f61af3bee9ae35fd42deeb904a473816f139f6ff440456bda4bf64f0f3ea3b63df76ef7891bbe3cdcff00a98c7fbc8b10ff00811af3af06f8cadb4bf1a786be15ea2eff006ff107c3eb0f105b4a0e7cfb9b3ba996ec0f722e8c9f45f6ad20889ec7bb5b42b0411db4430b0a6c0b9c600ae5f59bc126afa7ea5bf1fd8f78273f2e08b793f713fe4245931ff4c7deb7af5efe4b1bdfecd23edd25a5c1b6dc323ed31c67008ef93b78ac1f08cda6f8f3c1da278ce149236d77484b968d5b859258b6caa47b48187e14846debb6fb6c2495062589c608e71ce0fea7f4ae52f1a2b3f885a06af66c33afda5c6917d16de2492dd16ead98fba89268bfdc948aec2d24fed2d2209667f9ae2de33213c65c6377fe3e0d727e38d1b478f4cd37c4b75e2f93c376ba6dc4b731df4712bcafe7db79456107ef4c53ee050e738201a23b8157e03bc71fc3d6d263903c3a36bdace996c011f2db477d2b4038f48a48c7d2bd0be6cf2b8ae4be18787e4f0f7845229b4e934f7d42ee7d43ec52125ed6390858616cff00cb458638439eefbcf7aeb30c4fccd9a1ad4008ef4d2334edded494ae08438c531b77e1521e6a36e94ae036941c5047149d0521837f5a6d2eef6a4a023b884669bd07bd3f3c629ac30681b1a7a8a6d3e9ac3a508968692314c2314ea5cff7a9b2a3a0c071475cd2918a4fce90c6b74a43d69c79a69e9c1a084349cd37229db7de9282d0657de8a3693de8aab8c71e49ddeb4d3b73fc54a79273eb401deb22017a53baff0015252f20d00253c7269a07b53c1c53b8ee2e39cd3fa537d29d95c504b0a2946dc51d31e9542b063279a776cd1d7eed14151154ff007a9d9cd37bf14bc11404851cd3c0cf4e94d03bd48381f2f4a1b0e660a1697e5f5a4a51c9f4a0910904d03a5145004173a85b5ab7927cc9a63f720b78cbcadf4038fccd60eaf69e21d6ada43aa6b2de18d1e24792e96ca4496f668c0fe29f1b2018cf118673d32bdfa81c020700f51eb5cdf8be79eeae74bf0d5932f9fa848672241b942478396ff603fcd8ee5631dcd033cebc41afe97f0e7c3bac6ada0e9969a7cba7d89bed46f2f034b06876413226bb909df3dcc883e4801cb1289f22024fce3fb10f83350f1ddef8dbf6b1f8a37fabde6a7e299a4d2b4893507dd73069c1c6563180374a764612300041803e7afa6be32780f4cf1ae95a4fc2abab7697c2f25d7f6ff8b212ec26d5e08a40b05a3489c97b8ba31f984ffcb38dc0f4a83c01aa47a9f8cadfc3de1d541a2785aeee2d649a04558aeafe2c35dcabc60471c8c2da303bf9c7fe59ad6aa768d816e7a6f87b49b9b4b633ea5108aeee31be0420adac49f7211eb8eae7bb93e9583f113c56f0df68df0e346b968f5bf1799f7bc47325969510ff004cbbe7a1c110c64ffcb4973cedc569789be207857c13693ea9e2bd4134dd1ec1bc9bbd465ff571c9b4b18d5465e4211598e061429248c1af1bf8092eb7f12afbc45fb45789565b393c597c6cfc3f66f8dd63e1cb37616d091d01964324d275e4f5e2a5474b956be87a30b2b6d3347d37c3761a6e9905f5aada69c66b86312b6916c4c919dc0125176a820f4393deb99d074ed7be256aebe3cbfd5cc56164f7169a05bc092c304d19f966bc3102b2191b06342d20c206e016a9fe27c7a96a1aa787b49d1dde2b9d7e2b9d365db9dca8ea244e7f807cad9278c47ef57f586ba796cfe177832cde416b6f15add380c047020004471c80461e43c1e5631f3c9c25aea3b58c34b2bef10eaefe06f0aea1059f86a21e6eb93d9e8f02c775c8d90fef7cd32190a919639d9b9ffbb9e73c616fa9eabe2b6f06f87bc553b896397fb6b50548278b47b28e3c4841b823c8c0223db1e396032715a9acf8ef4ab249be1cf80ae351324923c573aa5801f6cd42f0e3cdb7d3d707cc9700249738f22d9380c5d703a0f875f0a6ebc3d6cc3c4905986b99525feceb547300287f751b19399123c9c29cee90bc921672363b583d0e23c43e1083e26f89741f10f8afc2de21b2b0d1237b4f0969128516f25b90237d4e4836931dc302b1c4b24876c659f8738aeda6f07dc79f0cb722596f6eee8da4136a7763cb88b83e74b1c100083082424fc9c0393835bda3cabe22f1249afc27ed16e917ee6527ef7cc56300fb9f324f7f90d626a9abc7e34f13c9e15d29e468ded9e29ae90fcb6fa717c5d4c0f679dd7ecd17728b2bf084126ac1682f833484d62f5b5bb6927b8b724c76334aa1596d3858c4688008f76ddd818ea339abfaa6b91eb0b1d8694f1cb05c5dbda42ca7fd6ec1b4c83fd8df23107b8809ab7ae5cbe4f847c3d2269c12dcdc6af7ebc2e9161b0e5f278133202101e83321e833e61f097c630f89a3d63c776362f0d843ab5dc3a0d891822da3f2ecf4f5553cfcd1ac92f3c90c4fad2e5b20b9dbf88259b55f897e1fb082271a57878ee976bfcad733e0460faf9690018f726bcb3e29f813588fc59f0f7e2af85eee55d6be15cf7b1c96d19e2e34e8f505fb547b7a92b6b3ac98ee01af74d2f428744b38d6feeedd2fa5ba4bcba924940f324008c0c9e8031fc4b7ad735e2cb9d2349d6ef2fef2f2dc58ba9d42e9d6504c76d7101d3ef58e0f45ff004293f33550766125a5cf49b3bfb685af2fe19035bd8ea9f6957539062321e47b6c26bcc3f673f19d80b0d7fe18ba18afbc19e37d73c3a63e70b18b8fb55b1fa18a7047d0fa5759f0de75bcf05e97bdb78d574f8f6480821a536e5863d723273d38af9d7c1faa699e0cfda43e2578e1fc52f1e81adf88b4ab1bb4b3d3fed7f67d5cc31daf9b3cac42451c724e81f82ed838000248968cc9bec7d47a6d8cfa9d85bcb6670d04da85a2211f781b86039f622b9af026a5e0ff0010ebd61e2ad0aef4bd712fb418edacf55b67138b79eca5315c5b472119427cd0c40c7faacf3c55af83de2dfb6697e1ef0e7885e04f12cb6d7f79771c2008a57b7d4e582e644cf213ccc1c760c3d2b85f02e9dff0af7c3be1bf1758b17d05ede1b0d5a30b8167736664b1fb61c701258a211cdfed471313d68b5af70dcf73233ebf8d14ee31bb7060c32187423b1cd2616a2e3194507ad051c287689c21e8c47069dafb14267f869371a38cd252b0ec14c6feb4fa6918a40d5c61e28a76d5c5368147461b7fdaa08a5dbce6907f9cd01ef0ca6939a7b5371fc540e234af7a6d499069847341426322995211814c23ad066c4cf07e6a43b48eb4b8c0a6503888d4d033eb4f2169a46281a1c3a514a9d0fd68a0761bdcfd296803ad1504852819a4c7fb54a3a6680140229ebf5a6a9c9a781814d0075a701fc39a6e39c52f1c629b0147bd3c6dc5349cd3b1c520b077fbd4528c66971c62a8b051d3da940e68a70c63e6a4cc829cb483ad2e79f97bd2dc6c5a28a5da6a8427534e030281b41a5ee3f9548d00e6b3ff00b2c7fc24075e2e848d3bec2aa53fd5fefbcc2ff88c0fc2b428c73f28a680f3cf8ad75acdc4ba6f84bc1f2adaf8875d952d6d6eb1936e4eefdfff00db08bce9876de129ff0008346d3347d3b518b45b036f6161347a5d826304c11a86c927abb4929cb1e49c93d6b6342b45bef88be22d6e51b9b4e4b4d1ed73ff002cc490c734b8f725a319f4e2b2bec9a869d1f852d743d62e2c2086ee0d46f9602a0de493dcac4b049907f76c5a5240e4f9639a680f0cf8c77b7be3cf1f4b7361a9df5af87fc3d73a9f83ad63b76302ff0068c821fb4dd16ce1fccf37ca00820c60fa9cfb6f832d7c2de14f00f86bc33a2dc6748b0d2a0d374d5f344d24d141100391f7de40bb8fbc98af3abcf0de9fe10f8a5a0fc3d83518f598bc633c7ad78812e1a369ad6e6cc99a19481f744f1f9710eede413c826acd978a7c3ba4f8f7c7761a5d9dbc51787a5b1b18d22fdcc16b2c96a25bd9e4949c4656211918188e31ea715a3b95068ebaef9b9b8f105e2d9c77a564f26e6ea50b6f63181fbfba9642422431261467ef1ce33bab94d3fe1b69be34d09ed3c302f341f0d5fc8f25d6ad31b84d57c440e7f7aa4b29b7b76cb90c7e7937640442777431e83a97c49d3a1d5758b0b6b6d26009368ba35e432082f0a7fa9bbd421e1de3072d15b1e9c3c997381c35ff00c66f8c1e006962f8c5f0e750480f9ff60d5fc1f6bfda86f5c162b1c96607eeff0077192497e5cc7c0cd2e856ecd2d0fe01fc25f87d712c3e1bd13c73a55c94459357b7be9889230388fce2c42443b45f2275e09e6ba8d46c6d7c1fe0bd63c59a378afc4121b3b49e488dd5cf9ead391e5c7f29ebfbc68feef5f5ae774afda4bc2371611decde2ab21387b88e4b1fec1d43edde6dbc71493c4b144ac923c6268c1d8704e40c915a1a9fc4ed2fc5f7fa768fa213a84560c97d7fbada45dd728775b5b6d9003f2be26901ce36c439248a5abdc2d6d8dbb9b1bed1ada1f857e1542d7c22db7d748c7cad2ec13f7516e6ed2491a85403e7e1dc6383599fdb569a75cafc34f838b6f75e22bf265bed5dadbcfb4d380015aea723896450163860ce32106300d2cbe10f16f8a6d1ecf52d4e4f0b6812c8f7579e49cdfdf123f792c84f42474693381d231c015bc1da36937b0def84bc16dfd93a0c6766ab736d31f3fca0702c6194fcef23726e6eb248763121cafc95cc4d999daaf835be2b5a0f85da45e5fc3f0eb4fba3ff00093eb4f727edbe29bb46ccb6914a39313480fda271c37faa8f8526b9d9fe137c3ad2be33f88db56f05ea9a969ff63d3356d334db08ae67569e4b5fb3c8eab190008fcb900c90079a7d6be85b5b6b4b2b682c2cede2b7b6b489218608d36a45181854503a015c0f8dfe307857c11ac5c596b9ac5be972416be749737ba55fbdbac7e62a9066850a13bd97e519fe2f4384e5d076367c31e17f0ad8daabe9df0f5347471f72f62432fe20bc98fce9be39d274d83c3b77adae95a6b49a3db5c5cf9135aa793790189966b49703959a33e5fb1da6bcc355fda6ac61d5aff46d02c3c43e23bdb6927b284687e1d996cdb508e6307d966ba93e78bf78065b601b1b7824035b9a16bdf1bf57416df117c2da1e831eb17d14761a558dc1b9bb8edd02cafba7184397c024a0c524ec37b58ec3c1ad168de1bd561d074a36761a05f5b47a4589937182dada18a2f2c1ee37c3201f9d794687e1cb7d47c2fe36bc4b282dedef2ea5d574cb7b319f3a7bb759064e33bfce91793cf03d2bdae7b6b8b7d335fd374ec34f71a7dbd95b60e035c48b3853cffb6c0f3dabc2be13fc53b6bff0b7837c0fa548f797b7123e94daab422588cf68a45cdcf0023c50a472c80f01a4685074735495d5d192958f44f0ce9b3dafc5df0c6baaaa9662d2582cd304318b53bbbcb8999b23fbf1c18af45f05585a41e10b5b64811adee1ef25314a9b96413dd4f230707821bcc39078e6bc9fc230f8d23d37c37e214f3afe7b6bbb8bb8d659467fb1ae2ee736c33c0c5b347071fdc9cfa57b5e93a7a691a4586931e31656905b7073f7230bfd289ee2894fc35a1ffc22f68da1d9ca5f49b73ff12f0f2167b58c9ff8f624f2635e7cb27a2109fc22b5f39f6a28c62b334e540bf786e5c8cf4af3bd3fc3be33b1f14bea3b2e659a7be2f75a89d4375b4d65e6c8557c82d94c46eabb420c15ea735e887a534963f4f4ac2be1a188e5736d59a7a3b7debaa2a2dc6f6109f41c7f9e2917ad3a9a060d6e45d8375a4a5cfa5078f99a816e35864531a9e4e29a79a07ca349cd2138a5a6ff00bd40440f5a4a5cf3cd273fc3d282c403149dbf1a75349cd49025308fa1a7139a46381daa81ee46d4638c504669b40445c7fb348dfd6971c669282c55381450178a2823984a07d291bad2d4006dfad28feed00669ea280140c52d14534014e1d29a063d69c0d360380c51e9c503a504fd6900ec67f869dd062900c52fa71fad171dc5edba81b49a3b1fad18c7348962f4a5534839a701cd52062d381cd274f968230290b61c36f5db4520ea68e7da8434193e94a39345281dea80ada5e9f0d9dfde5cc2bcea1791dd487dc45145fca215cd09e18b43b1d5eedcac31eada702fe91412fafa6f321fc6babb892e23b795ec551ae123730873c1931f2e7d81c1fc2b0f58f098bef01dd7832dae9e3696c3ecd1dc9c6e13821bccfaef07f3a00e1355f03d9eb7e02d2358d69a4b4d4b54f1259f8a2ff50825314f04efb85ab893a811036d181d02646306be31f8c7e27f1ecbe0ed5ff686f84be149f4dd1ed7c4f6375e2ed3e5b6795aeef239d66ba816200ee87ce8a313487829e48e80d7e925e5ad9ea3652d85d5b05b6b988c2f0af2150a6303d31dbf0af1cd07e1178d3e0ee936e3e12be9dabc73db226bda45fce6ddf50b94040beb49dc3451dd4a981247327952155e53193a41abdd8b63d1749d6f4df13e9163e25d226f3ac359b58b51b57ce77453a0917f461f8d3dee583b46141cf04122bcbff672d5eee4f065ff00842ffc2badf875fc29aacb676363abac3f68fecbb8267b2933013194c34d102a7188057a93410b36f310dc7ab77a87b9aad8a97fa72ea9a7358c37973a687ca9974f9043304383222c80663dd819239381820f34ba3e83a3e83025a68fa7416a88bb06c1f363d33d7af3f5e7ae4d5f54455da178a081f771480caf136997dade8b3e89637cf64750290cf7319c490db93994c7fed940541ede613d4554d06c6c34fd7b57b3d36cd2dadb4fb4d3aceda244c08a3d9349b47fdf4327b9e7ad7420281f76a95a5aa43a8ea7760926e648323fbbb21007f3a0a89732bc7cb4492e60689d3cc8ca7319e437d41e29693e5fbbda82caab793091a64b6488c9f348ff00f2d243ef8eb515ad82a5f4dac5fcd1c972ebe5c671f25adb8c9daa7dfab9eff402adf910862fb393ef54352d3b55d60ff655a5c1b1b79f11bcd1b837129270163182107fb479f6ef4f7dc87647c93fb6afc72f13369b69f00be0ccc5bc67e35bc95f55b853e52693a72458d8d7390219163fde4adff2c918e70c45757f0cbc2abe0cf87fe13f879e16bcb8bbd4ae34d4d03c26924663796dde449752f104ea7e7b7b52142c28d826354c65a62037c2ff0008aefe25f89b53f1ff0086bc16f0e891eb33e95e1f3aaea10c1a4cba5d9c86213cb0c51b5fde19ae44f7263678e391ca172700d7d3de16f08e9fe1759ee623f6bd52f706f75078c2c9363908a07dc881e8b93ea4b1e6b7728c636473daeccaf11f862ef50fec4f08e839b1d1b488bfd2e69a212c575682030ae9eca465d26c86948c604431c9e2ff0085ae757b3b64f0e789a3952facff00756d70f21956f604e15c4bde40061f7609c03dcd7444e690160a4678f4ac6ed969213fdea4f5a7536a4b025ba51d28a08f5a080a0e0f6a2933fc540084edcd37393f352d230a0a138f7a4a28cb7dddbfad031186395a69e94fa4239f9b9fa504c88cf76ed45398629bf2ff007681a0cfb546dd29e4e291860fb50319c7bd2138a5e8694818a006375a61ff00f5d3c707da928b8ae328cfe34a7ad1dfee8a062af4a29037bd14ec6432957ae283de85acca1c066a5414c51914f1c0c500c53ce293183475a51c0a05b02d29ed4514d0e3b853969474a00e69b1b1c07ad2f4a6f414e078ef5221cbf74d1d280734a066801071ec29c0b52d2374a0485ce6973eb4d1fef52d5210bcfdea7520e94a4d0c6851b4519fe1a3afdea5a91863141e94741ba9bbe212880ba0948ddb377cdb3a671d714c915bad6078f3c4b6de13f09ea7ac5ccdf66f2e2f2209586ecdc4bfbb8c2a8e5c82776d1c9db8ad8486f9ef3cf9af912dd0111db4717decff00148c793f418154752f0cd86b5ae697ad6a61a71a3179ac2dc8fddc770e306e1bd5c20c20fe1c93d4d3b0cf1fd2f5693c29f187c2ba3ebecfa5ddfc45f0e5e5be9ba3b60fd922d2cac96d1c8475b968e698bf6c9d83eee4fad0624e47f1735e09fb43fc31f1a78ebf687f87de36f08cd7225f869e16d5fc471436b8df7d7a668d60b219ed362453df1f5af6dd075bd37c4fa169fe26d1a612e9faa5b477703018c238e508ec54e5483c82083c8ad66b44cba6fa1a1bb34b9cf1485589f714600ea71599a4ac2f7f4fad35530ce42f2e727f203f90143c6194a3a961d48e86a3b8b54b89229647902c07788c36158fa9c75c751f5a0827a4ff0080fe3464fa5185fa5001863589e34d6a5d03c2da86a16d37977922a595811d5af2e1c43001efe6480ffc06b6ff001c7ad7897ed19ad789a77d274ff064725cbf81354d1fc77e2382088cb29d3e3bdf2e38404e8e53cf980ee96efed55057629fba8f78f0e7872c7c23e1ed2fc27a7a816ba359c56110eb911a609fc4e4fe35a34af2472c8f2c0e1e2918c91baf4643c823f0c5348cd490808cd369d93e94993400985cd14679cf346efad058d3c7dda4cfd7f3a775e173e82b3eff005cd3ac2e3ec45e4b9be3cad9da47e74e47a951f707fb52151ef40ac5dce4ff0017e154f50d5b4dd27cb1a8dea4324a764510c99653fecc63935227dbe47b79b296d198c99ade48c3bf98718fde03800739c75e3b532cb4bd3f4e966b9b1b448a6b924cd3f265979ce198f38ff673818e94145b39cfd291ba8fa52ee34679cd00308e3f1a4a908c530f5eb413cc252633cd29fad04e2a491a462994f278a8dba53438899e7341fa50093fca9ab2c6ef246b2c6d2404095558168c9e4061dbf1a18d8a7a537a0a7f6fc69a4e314204348cd34f14fea3d29bfef51b8f7187ad21e053dbebc544c7068424193452af4a2aae1ca1dcfd29691ba9a70eb598870040a703d29b4a0e2801d85a5f4a43cd3bf95020a5c1a070775076d031c3814a36d22f4a08ec6801c7a52d277fc296806c55eb4f0314c1c75a7839a042d2119c52d00f7140c318a5da68cf18a17ad048ec6293028c8aa9aceb3a4f87b49bad6f5dd4a0d3f4eb38fccb9ba9b3b624c81938f723f3a065cf5f6eb4d9a786de179e799238a305e477385503a926bcb3fe133f1669d26b9e2cb6bf81f48b8b9b9962b5d704d08b2b68f0229a111a990864c931363390432722bd13c3d2ebd71a1d9cde2ab4b6b7d5258f375042842c649385c12d87c6cc8c900e4026b8b0798e1f1ee70a2eee2da7a3def6df6f334a94a74ad7ea4da6ea2baa24935bd9ddc16f81e4cf3a88ccdfedc6a79c0ec4819f4a92c749d3b4d324d676804d3f334eff0034d29f5690f27e9d3d00ab24924f39e73f5f7a01246daefb198ecae69719cd00281453020161663519355118fb5496e2d8c9dcc61b701edcd784fc55f18e93fb31f89ecfc6fab6c87e1cf8f75a36badb29cb689aecf965bf45ef6f71b48b851d2402403f78d5efd8fe1af993f6f1f869af7c6ef097c37f82be18f2c5f78a3c716f2dc3c91f991dbd85b5b4cd733c8bdd230cbc77240cf3574ecdd98af6d8f7c8a5866863b8b79a3961950491c91c81924423218374208e869b72f730dacf2d9da9bab88e2778a03288bce90025632c784c9e327a6735f969fb2dfedade27fd9ebc4579f06be26adf7883c0da4ea73e991dc005f51d21a399a3dd1c7c9963e0130e7206719239fd3af09f8b3c31e3bf0f59f8b7c17afe9fae68ba8c7e65adf58ca258641dc7aab83d5480477155529386e6b09dcade14d57c6da95b4b2f8c7c0f63e1e9d1c79515a78863d4c32772ccb12ec238e39abd75a86ad15b5ec963e18b9bb9ed8e2da16be821179eeb23e4463fde19a9356d2adb59b65b3bc9af6244912557b2bf9ad1c38ffa69132be39e99c7b54d0597d9f6afdbaf24c7fcf698c84fd49e4fe26b22b98c9d1756f16de6ab7569aef800e8b611c424b6befeddb6bd13be403198a250633c9e4e41db5bb9fce97fdac0af13fda03f6adf01fc0b961f0ac112f8a3c7fa8ec5d33c2d67385903bfdd92ee5c116d1f53cfce403815518f33b09cd2dce9be3a7c68d17e07781ee7c4b7d6526abaacb6f72fa3e8f0e4cb7d24119925638e52de20374b2f45418ea40ab1fb2f595fdd7c11f0ef8cfc5223b9f12f8f2d47893c4172c9837973723232bd9561f2a38d7a2a2003a9cf937c13f861e2ef8a1a47c60f1b7c5fd4a1bef1cf8a74bb8f03c2cb079767a15a4b61ba5b7b3524948f75cc25c9c3b18f9afa9344d1ac3c3ba0e9be1bd2621158691616fa6daa1ea228a258e307f0515536a2ac8ca4f99dcb71db7910c691c25628d42271c01d8504f5ae6f4cf06ff67789ee35e8e4b18fed179797934d0db95bcbcf3f3886e643c18e2c8d98c9fddc7f70020f4a724f5a8f4013bf14878f98d382b6785c9f6a863bc826b830c2c6568c659d0128bec5ba7e02a0448064ed033f4aa97d7cd64eb6f1585ddddc480948608f1c0eecc70231ee7f2a8a5d326d409fed3be792173ff1eb0662888f473f7e4f7e40f635a0a02288e350888000aa30a00e9c50328b5ade6a161e4eaaef6aeef9912c2e997f77ff003cfcdc073ee571ec454b63a7d869907d9b4db48ad62272eb0a6ddc7d4f773ee4935648c9cd37d6a8b40c38ebc537b7b5387e54d6a0618fc683d05203cd2e79e6932640c334d21453875a693da8445ae37381f7a9b4e2727eefdeacbd77c4ba2786a18a4d66fd217b86f2edadd10cb7174ffdc8614cbc87e8303b914cd2c8d2c66a9c9a8e9f0ea5168f2ea16e9a85c426e62b5320f35a21d64dbd767fb5d2a1d1b51d635359e7d4bc3cfa440702d92e670d72c9ce4cb120c45ec3793eb8a9edb4bd36c27bbbbb0d3edade7d42533ddcd1c60493c9d3323757e062931332f56d275fd62f8db9f11b69ba388d418b4e4d97b7071f3869ce7ca5cffcf21bc8fe253cd5cd1f42d17c3d65f60d134cb7b28376e2b127323ff799892eec7bb3124f7357fbfa519fc69ad863691a9c4e6908a8246f7c535860d3ba0f7a6939aa43434f4a691914bcf3f35210a7f8a987501d28a54e87eb45050dc7269eb4dfe234f0302a080a50334986a28121f4ea68e4669d40c51bbd0528f6c5193e949dff001a0072fbd2939a07fbb46e3400e031f7bf4a3a9a4c9ceda72d02ea29feed006290f068dded40c78e452fcbb6983a538126810e0339a01c5252e38cd030038a1962605278639a275d9244ea195d3b823b8238c5253e803ce97e0cc3268779a25cf8db5b8a09d6e2d6d96d446b0dbd948cc4426290482570188f35be7181b36818af46008e59cbb1fbccdd5b8e49f7279a09ed4b9cd452a14a85fd94146fbd95aefb8394a5bbd831c96a5071460d256c48efc79a50dcfcd4d1d69c076140f7156a23696cb7e9ac7d9e3379042618e623e658cbab1407b02eaa4ffba2a518feed29f6e0f4a9407e217ed9fe07bbf87bfb457c4abed360dd6cfe2ab933060730f9f1457514a0a60a0227201f54fc6b8bf817fb487c59fd9d3c527c45e02d4d1ecef0a36a7a2dde65b0d4631fdf5ecd8e92ae1c7ad7e897c64f84169f103f699f88d61ae2451e95ac695e1f97cc232448f6663c918e50882404ff00502be24f8d7fb1cfc68f837a95c35df842f755d104ae6df52d2e1373094ea1f68cb818233e9ce6bd1a75e325cb323959fa47f00bf6d7f81bf1ef4f820b4f1141e17f14151f69d035a9d62903fac131c47711fb83bc7190335ecfe24f15f857c19a44be20f1778ab46d134c881792f2fefe28a1007b93cfe15f80074f59582064772fb047b4f99bf3c0db8ce7e82bd8fe15fec9df19be2e4f1c63c3dacdbd847f322dddbcc5d81ef1ac9c46a7aef6da3d3351528535adf42f999f467ed2dff0533d6b5fbd9be1efecbb0cf0453b7d94f8a27b7ff4dbaddc7fa140dfea01ed2b0dfdc04eb5dafec25fb186ada7ea107c67f8df633de6b5a84df6ab2b5bf94ccd24aeff0024f367ef9e49c9eb9f41cfa97ecedfb0e7817e10b5a7887c49a7d9ea7addb84312b42ae227e49249ce793ee4e3d2bea3824d97d04ac7382643f86318ace55525cb0561a837ab38bf80325b6a1e06d47c496d24920d7fc5be24d44c92364bff00c4ce6801fa6cb618f6c57a4018fbd5e53fb29c53afecefe04b8b83996ff4f9f5263ebf69bcb89f3ff912bd5c8e3eefeb5cf3dc421ee7770295d591c8757561d41183f95735e3df106b3e1cd2ed2f748bad1ecd27bd4b5babed4cb14b21202b1cc230e9e601218f20b0c024f38c560f86a1d5748d5744f0c784bc6769ade89f618b58bdb892dfcd8d6d9f7464413990b9325c2c8c8093e5a6f0491b05350bab81df4d04538d9700b28ea99e0fd69db3002200aabd140c01f4a76734566161bd0d252b75a693da8175169a57eb4b9cf147cddff9d0509c7bd0568a4cf3f353403694f414139f5fc2a29268a08a49a67091c4864918ff000a019278e78e6a83958f3fef552d5f5ad23c3f62750d6f52b7b2b70e13cc94fde73d1140e5dcf60326b106b7e27f13aecf09e9afa459483fe431ac5bb0620f7b7b33891ffde9b62743b5eba48e2c2c0d2fef64800292bc60307c60b8e3e42727a63ae3a52d8ad8cbd1b57d53599e69a4f0e5c69ba5951f6596fe4115ddd1e7936d8cc298c11e610e79f94558b7d1b48b2d52e75db4d3e08f52bc0166bc09fbe64031b771e427b0c0ad0c63dbdb3d698df9d08486e3180a06052d14673430633a934d1d69cdfeed2018fe1a9107fbd49ebba82714d25bbd301185301ee29f4cce3b53b9571b8c1c2d0476a53c734e1c8dd431323ee7eb452b7de34531094fce00c75a68ea69e47350021fee9a507148471d2940e94090ea50714df9b19a7d031c0e694014c1f4cd48071f76800c74a5c0a43ba9722800c0cd3f38c5340e7de9d400518cd14e58e4652e1095438270703ea4535a83d041c0a7607f914dc63036fe74ea42419e297afcb4d0314a09140c5c74a90f4a6aff00bb4bfc34098b4b8e3a5038f63464fa7eb409094e03da900cd3a98d2178c50bd693ebc52fca295c05c718a005f4a5039f53d87ad729e2df8a3e09f05df47a36a9a9cb77ad4bfea345d2ed64bed465e9ff002c22c98fa8e642a39eb54b711c56a9a2c5abfed07e26b0916210ddfc3ed1250c472b7116a7a924720fa21c5777a225cae971c378c378182a40f971c007f019fc6b83d0e7f166aff1f27f126a3e0cd4741d22ebc142cad97519a033cd2c5a934b93146c4c7f24e782735e9fb40cfca304e4fb9aa96e5ad8a51e9ba6c576b7f0e97649729c8b85b58c4c3e926320fe356ccb3499f36591f27277b9393eb4ec7e74bb7fbcb47294438c1fbb55ee6395c4c223b09b49c2b7604a9c55c2beb55a177b892ed15772a031229380c761e3f1c8fcea585fb9cafece766f61fb3e7c32b37e5a3f08694493c726dc37f5af44e9d457847c35d57e3f7c36f877e1dd2bc51f0f6c3c6769a7e996b68b168170b61ace9d1450aaf9335a5c1f2ae0c7b4aee86405b00ed19aecbc25fb41fc22f186acfe1cb6f16c7a3f8861e25d07c4513e93a92fd21b9dbbc7fb51922a9c5999dfdd5ad9df4420beb2b7ba884892f973c492aef4395387046410083d88aa963a168ba5ea179aae9da6416f77a8e3ed53460832e096e467039663c0192493926aa378d3c182e25b35f1968525cc1feb6087508a7963f5cc719671f953f4af16f8635ed4e7d1346d7ecaf352b68a39a6b24765b88e390128e62701f0429e80f427b52e576035c0534b4dce3eef638341eb49c6c2e61768a69e38345079a90133cd1fc34878a09f94f60885c93d87a9ec00ef9e28181e9f76a1bbb9b6b2b596f6f2e22b7b6b705a59e590471463d4b1c003ea6b2b45f17e8be23bc96db407b8d42de0425b5182226c77e71e5acfd246ff007723de9d7fe14d0f57d5e0d6b58b67d424b609f65b7b994cb696ee093e6ac07e4f34ff00cf46048c704739687127bbb9bfd43474bbf0a5ce98f25d88e4b7b9bb12496fe51c1f336a60bf1c81c678cd4fa6dbde59d9416f7fa9cba85cc63f797524490995fae7cb4e13ae001d80ea79ab47767b9fa9a6919c76aa2c4279e727bf3cf347cbd7f953694138a4c961d3f8686e87d6803d691bb715221bbbfd9a46c607cb4b4d2734c04201a6ff00c069d96fe2a6939a40349ebcd04e3a2d18eb41ea280118f7a653c8e3de9add69a0108e2853d3d283fdde94de87eef4aa2c520139a2949cd1411ee88a32694eecfa50bdfb51d0d409853bd29b450243ba8a767fdafd2907e74b8fe2a0a1474a78e7ef5301cd3e81d85dc68ee281d697f885021c3b500f14b48bd686520cfe39ed5c478a341d62f359bed56cf49d46eafc5a4716837b6faa8b7834f9339612c464008660093b1f2994f6aee0f4a4ff006bbe7ad38bb09ea3cf5f403d3a67be285e949d38a752108bd296907534b400b9c1f6a7a9cd300cd2f41e9408933ce68ebed59faeebfa1f8574b7d6fc53ade9fa3e9f19e6ef50b98ede1cf6019c804fb570573f1ad75c2f6df0c3c19a9f895ba0d56f7fe259a347efe7c83cd987fd7189c1fef0eb402573d417921002589c055193587e28f1bf83fc136ef71e2cf125969e53a40d27997329ecb1c09991dcf4000e6bcf65d2bc73e23561e38f1edcadabf2da578690e976c7da49f26e651f57407d2b4741f0c7877c34dbfc3de1fb0d36523026b787131ffb6a72ff00ad3bd8b54db30bc6bf133e225e7853c43e26d2bc3b7fe10d0744d22ef520f76919d7352f2e1690471c392962871cb49ba5c7458cf35f39fc20f8d5ff000503f895a069773a1fc39d325b13696f1ff6c6bf6b77a5c331d8332f9a6f01909e4931c7cfa735f5bcda626a963a8695aaac46d2ff00cdb70513388245c723d4127eb8ab1f0ffc4179e20d13ecfad845d7f4294695ac46b9da2e2351b655cf48e68f64a9e9b88fe1aa535b581a48c1d0fc1ff16b5b8437c50f8a2b0404203a3784a392d61e073e76a12e6ee7ce7388fc91d3af35dd685a1e8fe19d39349f0e6996fa6da267f776f1ed2c4f52cdd5c9ea492493cd5d54c8e98ed8a95509fa54b60915fec36e6ee3bc68819a28de2423fb8e4123ff001d15636e7f8bf3a9523cfcbd39c6692ce64bb88c88a010e6375ce7041c54f321da433cb1fdea4d83d6aded1ef418f3fc34c0ceba3e45bbc8bd700027a649c0aafa7c58b5de7fe5a39707dbb7f4ab3abdbfda2dd6da3058c9200477031cd59316ce368f938e071494b5029b20231d40e95cff008dbc05e09f897a33787fe21784b4af1269e7a45a8daa4c50fac6c7e78cfb822ba875eb50ba55dc0f9b7c6dfb0ff823c4fa5a68de13f8aff153c1b6a80456d63a5f889ee2c6203eea086619d83b0128ae6bf652f807a6fc3af09fc40d1b5ed6e7f162ea1e2e9ed20d52ed248a796df4f8c4314aa7cc69237f34cac0abf19e315f4978f3c56fe09f0d5c6b76f6e6eb519244b3d26d5796bbd4253b608c0eff003fcc7d0293dab1bc31e1c8fc23e1cd3bc390cdf69fecf83cb9ae3b5c5c125a697fe052b48c3d88aa751f2d8231464dad87c58f0d431da785be29c1a9d940c04569e2fd1fedceb160feecdedbc914e4038c3c892103a96ad187e36b787a782dbe2b783ae7c2d04ec63fedeb6b9fed0d0d0ff0f9b721564b62dd009a21cf7ad28bcd30abcd1795238cb2673b4fd69ca5d1cec620b8319ef907b11dc1f43c54a95f72e54e3d0ececb50b0d4ace2d4b4dbeb7bcb39ff00d55c5b4c934327d244241eddff00015606f6708885d8f0028c935e34fe00d3b4c9e7d47c07a85ff82753b86dd2dc685e5a5bcf2018fdfd9b036d37a72a0f5e6a5bcf13f8d21b0fec9f88be157f14e8ef2279b7de10964b6bb744ed71a7bb8324673c8b795c9ff9e54f4666e163d6adeeacef50cd677715cc69218d9a0915c0743865c838041e0d7353f831f5f9de6f1d6a9fdaf6fe613169104660d36300fcbe64792f70e063265253d23152f83bc59e01d6ace0d37c1fa969d104184d3563fb1cf17a836d205901f5e339ae8dd590ed954ab0e30c306a081a4e1551400a830aaa30aa3d001c0fc281c9a01eb461a8180e4f341e828e41a4ce6980d3c7cb4138a1bad349e29d87614b526eff00f552503ad24211bae29390694f4e94d279eb545831c914d3814ea6bd410267de933ee685a52334009dfbfe54d3b6969a7ad002534f5a7f3ef4d6183548683e5a293068a2e3b8a0fe14e3d76d340c5389cd490c4ce2941c9a00cd0bd6810e1d69c0e734da5fe7414387434a4e29abfd69c3a50ca42e79e3bd283834de8696824932b4b4d5e053a8b15713afd2968a10739a7b085edf8d2ad2d1d78a45080f34a318dbfad739e34f1be99e07b2b39ef2d2f750bcd52ebec3a669d60a1ae2f6e36190aa6480802a167918e14633d6b8d9759f88de24666d575787c2ba7c9c0d3f43226bd23d24bf901099eeb1479f4614d7993cae5b1dcf8a7c75e12f04f93178935b8edeeaef3f65d3e247b8bebb23b436b1032c9f50981dc8ae2b56f167c49f1644d6da05b8f015839c8bfba58afb57953d16db982dbeacf21f6151685e1ed13c386e5f44d3e3b69ef5b75ddc97796e2e0e7acb3484c921fa938ad41d69dedb16a9f739bb1f867e128f5a8fc4dad5b5cf89b5c88622d4fc45707519a0f530c72feeadc9f58a307a735d796773b9dcbb7a939350a66a65ea6a5b6cd124b61c0648ab112e7ef77ebef5120ab0a3a7bd00f711c2a15996292432111909ce013f7f1ed9e7dab2f54d3aff004cd6e2f1cf872d8cf7915b8b4d52c63ebaa590390076fb4444968cf704c79e4636d073562d51edc6269fcc0653e592b82a8790a4f7c73fa543d05635349d42c35ab08754d2eec5c5a5c0cc720047d41079041e0a9e410735a2a95ccff64ddd8ddcbac7879e282e677cdd5b499fb3de7bb63fd5cbff004d075e86b7f4cbe6bd03cc84c332ff00ad8251b648cfe1c11ee3834b9edb9322daaff12f5f6a8a3816ce4965f9228181732310157b924f41cfad61f8efc7da67816c97cd8fed5a95c8cdad9a9c6ef5663fc09efdfb5717e0ff000aebbf14675f14fc45ba7b9d24366cf4c5ca5bca41c67cb1d631efcb1f6af3ab660956587a0b9a6fee5e6df4368d07ecdd5a9a2feb63d32c75dd17552c347d413500876349680cd103e9e601b33ed9ad031d4f14114312416f0a45144311a4636aa8f400714e31ff00b35dd16d2d5dce6767aa29f9601f7f5a6145e9571956aacd736d11dbbcb37a2216aae64c13b959e3506aadcc90db432dcdccd1c10c08659659182ac48064b1278000e79e2ad5d5ec56d6f2dddc44f1dbc0a649669c88628c0ea4b1edf8579b5ec579f15e48db51864b6f03c4e1a3b36063975e910e56497ba5a83d23e0c8464f1c16ea25a14a2d9534769fc7fadc3f112fed248748b012c5e16b49a3c318dc159353914f2249532b103cac049eb21c6e4e21b994c2b312f6f223c814e3dc063efc1c7a7d6ae6bba943a5c2ad24f1473cb8f263f2cb33738cac49c91edc0e9d0556d5ac26bc845b5b6a57360ad26657b70a2668fba0639f2c9eec013c1fad546572b94c9d5b5fd374ab84b17696eb5094662b0b44f36e641fdff2c7dc8fb79926107ad4d6d2dcdc594725f599b495d0f99079c2531e78c6e4c64e08e9d3d7bd3b4fd1f4dd1207b7d2ace381246dd311969263eb24849790fbb1a99875f7aa28a761a7d8697651e9da5d8c56b6d17091460e07393924927279249249eb52b05392793527029a78a924a5a9e97a5eb712c3ad69769a8460e505cc41cc67fd96fbe9f5520d50934cf1269965243e0cf1e6aba3ca8b8852f87f6ad9823a068a63bca76386071d0835b386e78a690fef540e2a467d87c66bff000e88a0f8c1e198f418f3b0f8874a924bcd0ce3f8e66dbe7d8a1f59818c74320af4bb3beb3d4aca1d4f4cbdb7bcb3ba4f321b9b6956686643d0aba921c7b8245704aef1b6f89cab7aa9e6b961e1b8f46bd9f5bf879adc9e16d43cc7fb425a4225d2afa43d52e6cb88e439ff009690f972024f2dc8aad1ee4b8f29ed59c9a09c5719e01f1eea1e25bdd43c33e27d0a2d23c49a4c16f7d730db4cf3d9ddda4ecd1c5756f290091e64722bc6c37c6eb8391835d8aff4a1ab1160273de9b9c53cf396a6ff00bd420420228a864bbb38aee2b096e604b9b85792280c837c883ab85eb8f7e959fa8e9fadea976d6ffdb434dd2b6807ec408bdb8e391e69c8807fba0b9ec56a446a87432b45e6a6f888f31411ba3cf4c8ea3350db3cef023de5ba413b7de8964f376f5e376067f21cd43a668fa66896df64d22c22b58cbf98db324c8ffde6624bb9f7624fbd5aa003e5fef52374a5a08e280194d2697a1a3a7e7400948dd29dd00a6b1cf1400c25475a424134a4669b951d2980e1d28a4c0f5a29d82e85ec296933ce283bb3520381c503ad00f140eb4123a9495e1875a01e3d68ea682d0b4edc2907d2957a5050b40eb49fc54a0714103e8a41ba9739fe1a0b1739c5390e6994e438341038f514678f5a5ae7fc7fe318fe1ff81f5ef1bcb6fe7b689612dd410e33e75c6310c7ff000294c63f1a16e51e71a8cd378c3e30ea9aeb4aafa3f826ce4f0ee9b83c4baa4ecb2ea33e31fc2a20807d24ade0ebe608777cf8ce0fa67158de0af0d5c783bc27a5f86ef6ecddea167117d4ee58e4dc6a12132ddcbf8cd2498f60b56f5a3341145a8438df6f20054f4647e39fa388ff003343dcb5a23457a7b5381c8ac7f0fdc2386811fe4e4c793d42100f5ff61a13f9d6d0ebcd48c963ed52af6a62700374a9147229b2d13c439ab0a2a18719a9d714221962119e6afc2b9aa708e86b42dd78ac98489a3570ec5f6794133bbf887ae69fa9dfd8699a4dceb17cc1adeca133e51f9e071b4fa93c7e35342b91f2ff00faab90f8c570d6fe0d8eca2c017f7d1c2c00c7c801908e3e95c398623ead87956ec8d2853f6b5141f53cb34db7bef1cf8ad2f35c924793509819d957718a01c90a0765404715f4c5ac3a74d6104761b0d9a2010089880a074008f4af1ff8376483c48d31e0c7672143ee4a8fe5fcebd7db498fed06eeca56b4b87e59a2fbafeccbd0ff003f7af038794a54275d6ae4f5efa5bf5b9d998bfde2a7b28ad0bab1ed1b5b27ea73415c7350a5c5ec03fd32cc483bc96d961ff7ecf23f0cd3c6a3a7b29649d1b1fc2aa4b7e5d6be87eb54bed68fb3d1fddfe479ae371af0a38dccb9aa57f7f67a5449e631df21d90c30a66598fa28eff5e9562592fe7f96da15b656ff0096b38cb63da3ff00135560d2edad267b9cc93dcc836bdc4ad9723d0630107b018a7ed9d4d20be60925b9cf6b1a65b6abe5dd78b52336b136e874c277c21f390645ff00978907a7dc1d81eb5627ff00498880f241249193d0078f3c67073fa835a325a4514ff698e10d339e646392a3dbd3f0c5569a1452eea8033f523a9f4c9ad29aeac7cc6058e8961a3c6df644769e43be6ba9a432cf3bfab48793f41803b014d957aff2ad3997ad67cc3f3ae8894f633e5183ec6abb74ab330aac781572d8a88c6eb484b0a5ea29a4f3ed4ee45c45e94c90a827bf6a94955059aa9cce492a1b18ebf5a4229dd7da2e258ad525315b3e7ce951f12b7a46be99e72de800ef56d228a308891c68910d88aa388f1d80aced53526b6cd858cae974ebe64b2226e36b077936f7724e2307a93e80d49a269ef6368a6e11a3948e21326e102768f3ddfbbb1eae49e06050d15b166c248ac3c77e1dbf7c235e4779a313ea248c4ea3f068188ffae8f5e939c80dfcb9af0ff8b371a969df0e35ef12689318b54f0d5a9f11d83019ccfa79175b31dc489149111dc4a6bdae79e3d4ad85e68f77e5c3771896da758c3111c8998dc07e0f054e08fae6b4e844b7242db70ac406704a0279703a903a903be2b16fa3f13ea3772d9da4d068d611be3ed4a567bc9c7fd325c79708ff006a4defc7ddef5634cf0e697a4ccf79124f777d2aec96faf65335c4a3d0b1fb83fd95007b568fa77a5722e66e93a0691a2195ec2d337175f3dcddccde75cdc3facb33fceff89c0e80015a2771a55eb49dfeed21087a537b7bd38f4a6e7afcb40051477fbbc51ff011401193da9377fb34ad8a6e5a80027149bbda97a7f0d34f4fbb400d63ce2929dff01a4c0f5a6805c9f6a290628aa10639c5389c5148d50317f84528e0d1fc34139a007500e050bc814118a007ff0008a4a28a0b1704d3874e6933c6696820281df68a56eb4ea0b101cd397ad30f7a553410499ff6b02bccfe355ccba85ff817c0d13646b1af1d57504ffa87e9911b8607d8dd35847ff6d2bd2f38af1bd4277d73e387896f98b35bf85b42d3fc3b0e4702e2ecfdbaebf1c7d881ff00ae60538aea52f88decb96ceec9ee4f7a8ee96da6b4961be6c5bcb198e5e71c118fcfd3de9ceaae07cc4720f14a4e46d2320d23638db3bf9f47d72cecef18169efd2cae1bb348430120f4126ece3fda41dabb95ddc66b96f15e8035452b0b98e5bf88da4720eb15da7ef2d25fa89142fd1bd856e687ac26bfa3d96b610235ec2934883fe59c87fd627e0f9a04bccd55e454aa79e6a053d6a543cd26522c467153a9c9aaf1726a75eb432597a1ed5a56fd2b2e03d2b4edfad64c2468c1f76b8ef8c56a65f0cd8cebff002eda8a39fa3c6cbfcc8aec20350788f47ff848b40bcd1971e64f1662cf69072bfa8af3f33a2f1385a9463bb5ff0007f42f0f3f6752337dcf39f86b7b1d8788ed1a46c47701edc93db78e3ff1e0b5edf1860d92dc0ed5f3969534b1b0122bc72a1c153c3070791f518af70f09f8961d6ac9639a4517912e254fef7fb43dabe438671f1a52960ab6926eebf26bf03d1cca8b935563d4e897a8f5f5a763f32307de911b23d852332fb7e55f67af4febfafbcf239885cab12bd585569172a55c0fa035664e01f4eb5c9f8e3c6769e12b067f925bf907ee2027a7fb4de882b0c4626184a6ead57eeafebe6cd29d3955928c15db248b544bbd7b50d2adff00d5e956d02ca41e3cf9093b7f0403f3a9a7e14d739f0d34ebab5f0db6aba8176bcd6ae5efe567fbc41e149fa8e7e8457453b7056b4c0ce752846a545672d6debb7e161ce2a33714f6284bce7159f3fde6abf31eb59f39eb5df0119f3f001aace7fbb5667ed551ce3e5ad806e4d357ad29e290b6de7a0a9246dc49b57e5eb54a49e0b4864bbbb7090c11bc923374000c93fa5492be72efc05e79ac0d52e5f58d6f4ef095b585ccb6d38fb7dfdcb00b10b78d80118cf2eed2ed04600001e4d343426993df5b5cd9472228bed6649354d4091cc76c802ac59f6cc5183dbe63d7356ee2f75bbbb992c747d3d20581cc72ea17fc4591d7c9881df29f7251076dd55bc3b026a3a86a7e36796795b58290da09252634b2889f2f6af00798e64949ebf327615bd9faf4db430666be8667d16ff45bcd46eefdb51b69e09a6b82093e6c4d190140c2200e40515d17c10bfbcd43e0c7812eafd71727c39a7c5383ff003d228442ff00ac46a94455658dbb79838fc6ac7c11864b5f865a5d84d92f6175aa5a608c6047a8dc6d1ff7c15a71f84899dcd369e47fb54c1c9a0cc0753f2d2608e36d3bb9fa5373ce28003d2984e0d389cd35a801b4a5a83d693b66801b4d279a527149d734009487a538f41487a50037b7e349f30fad147cbead4d000e945145500a0f34a4669075a5dc2a0050722940cd3569ddb777a00551c53beed354d381ed400abc0a5c1a4a5256865217f86969b934a3a9a09141e69475a52714670281b13ae6957a527cb4aa7268112245e748b6fbf6895c2e7d01e33f8578cf82cc57963aa78995486f14eb7a86ba4b1c9f2e498ac00ffbb14518af45f883acff00c23be03f126bc1ca1b0d22e65461d4394f2c7eac2b8ed2b4e4d174bb1d1a2e12c2d62b6c7ba2007f5068be85c772d919a42314ea46e94ae69a91cf025cc125bc99db20ea3a8239047b8201ac8f0cb358ea9aef871c8020ba1aa5ae060791779661ff0001b85b91ec3656da365772d635e9fb2f8d747b9180350b1bdb16f7316db85fc82cdf9d319d12741cd4a0f46a8178153a9a00b119c1ab0a6aa21e07e55657ee9a4c4cb90374ad2b77e0564c2f8157addf159319b10bf357227e07cd597149cd5c8a4ace4ae438dd58e33c79e0db81712789f4484c9bc66f2de3eb91ff002d5477f71f8d735a4eb0f03c73db4e5245e55e33835ec71cb8ae7b5cf87fa16b52bde5bb3e9d76e773c96e06c63ead1f43f857c7671c37f5aa8f1185769bd5adb5f2f33d3c3639538fb3abb10e9df12a78d02ea76a2723fe5a4676b7e478ad27f895a204f9ad2f777f7762ff003cd71973f0dbc4f6ec7ec77f65769d8ee309fc8ff8d409f0f3c6531d92a5942bfde7b9047e401af369ff00ac387fdd28b7eb67faabfccd9c7013f79e86c6bbf152e9a368f48b15b76c7fad94ee71f41d07e35cb7867c317fe3bd54eababcb249a6c7266e2790e4dc38ff00966bedeb8e0722baad2be155844eb71e21d48df1078b7894c50fe27397fd2bb4021b78960b689228e31b151061547a015e9e0b26c5e2aac6be653e6b6d1d3f15dbef30a98aa54a0e1875af71b2940bb2201100c051d801803f0154676eb53cd2633f35519a4afaf8f91e744af3b75aceb87eb56a69339acf9df935b4221cc5795b9f5aa92cb1c663134d1c665904718760bb9cf44193c93e83d2a7277363a66b8a3a845e3a912d27d1e0834fb098cb7f15fdf08af60c210098029319cf2242e98c645726618fa79750955a9d36b757dbcbf536a74dd47ca8eb58a9fe2aaf24bb87cbc8ae7adacf595f14e9d66fe2dd4ef2d2d2c5efa4f30c3b6f4126258cf96837852448ed9249f2fd4d6f119006ec815a60f151c6d155629a4f6be8fe62a94dd26d486b10993e9cd71f74f3de4babda5b394b9d52e60f0e5b329c18e28e312dd480fb095b9f5c5763ff002d06ee83a9f6ae33c01bb52275891788219d14f51e7dddc35c4ae3dfca6817e8715d9133476691c31224304423862511c48a3015070063e94bc83485bd6901cfcc698c4738154be0aeb32ffc249f12fc1773132368de238f55b5ce7e6b4d42d629063d84b14a3f1ab8c73df1557c2d02e9ff001622d43ce2a9ae78765d3dd00e0cb6930994fb9f2e4603e94d2226ba9ea47814da566c8ea31ea29bff0002a46426ef6a4ddec68a29001fff005d37a9a52714da001bfad03a507a5203c7cb400d6e948067bd0c40c7bf4ed9fa66807a7a5003e4fbbb9412719c0a848246e7fc855807207a542fc6568019476ddda941c527f2a0032beb451b87fb5453b8b517bfe347a351eb4bfca90c518a51cfd2983ad38138a007018a72d301e69e0f1d680168a4dded4ffca86521319c528e1a93268c9a1098febfc54019068c8f4a07fb34020c7fb59a01feefe5eb4139a0063f7793d00f7a019e7bf1aaf3ed3a5f87fc1311c9f156bd690dd0cffcb85bc827b9fcf6c6a7fde1486479dde57c1691cb1fa9393fceb36e2e93c4be32d53c4a543dae9cdfd8ba516e408e227ed330f7926675cff72043deafab74fa50694d751e0f1f7a8ce0fdea404d14994c17e562bea322a9ea960d7379a35fc4f86d32fccc47f7a3920960907d713647b8ab6fd997f80d5292fa51e22834bf97c992c25ba231d4a4b128ff00d08d0811ac87a31fc6a5535029a954d08113c679ab11bf1eeb5514d4aaec0e696c56e5d56e6ad452567abe6a7492a6d711ad0cb8c7357629ab1629aadc5718152e206d24dfed54cb374f9ba564a5cd4eb71fc559b44f2a34c4fef4ad363f8b359c27f7a3ed3ef4ac1ca8b8d331f9b350492d567b83cd4124e4f7a397a0d2e5269a4cf7aa534bc1a4926aa924dd735a2431b34954269326a59a5e0d5477fceaf6128eb718fc93cd616bbe1bb6d7f50b0bdbcb97f2ad2392dee6d8282b7b012b22c3213c88c48a1f1d0e31d0d6d33530924fd29b8a92b495d177664daf863c3da7ea475ab0d392daebca9211e4caeb16c72a5b11676024aaf2076abdc023d4d3e46e31d2a263f32fd68492d909ee57d4ee92cb4fbcbe9788edada499fe88a49fe55cf7c2cb19b4ff0086fe1b8eea5325d5c69d05e5cb9fe29658d643f9640fc2ba0d6248e2d23509a401916d25720f7c4678a6e9307d9349b0b3db8fb3da41163d3646a31fa55c76116c0c5040c526e3464d1cc2b8d27b550d52f1349b9d1b5e7e0695acd9dc123af972136f27fe8e07f0abd9cd6578af4cb9d6fc2face9367ff1f577613c76d8ebe7ec2d163dfcc0b549ea33d7645d8593fb8714cac7f06789ed3c69e0cf0ff8c2ca4df06b9a5da6a087de4883303ee1c9047a8ad807346cd988a1690fcbde8dfef4a066a491a40cf5a6d2939a09c7a500236da43f77f0a19b348c72280215b7b7599ae767ef5fab9e4fd07a0a90639ef4720d2753400a0e291c7f151484e2801b46793465a932b9a005a28a2800538cd07a520e0fad3b23d284084a7d37b7ff005a9474a00774029c02e3eed329df2e2801c071da9d8534c0738a750ca41d29d8e31483a7e14940c78e694f029a393d29dd7ef2d000071581f10bc4377e12f01f88fc4fa782d79a669573359a8192d74632b6e83dcccd156f838ae33e29389f4bd1f44278d575981245c64b476e0cf27e1f247427a88e4f46b14f0a68ba0f868b995ede0834f3231c96748732393dc92189f735affc3595ab3ffc4d7426ef25fcb9c7fd7b4b5a9d8352668c783c52a9eb4d0718a77fc069c4687e322b0247c78eec62f5d16f3f4b9b7ff1ade4e95cddf1f2be22e8654ffc7ce8fa9c78f7492d1a9add8ce9f773d2a40dceedd5083c7cb4e522901614f1b691aeb6dddae9f0413dd5ede17fb35ac0bba59760cb1ec000392491d875351ab629f04f7fa7ea16dac69573141776892c5996032a3c726372101948e429c83fc34581eda135a5d25c44244591792a55c6d68dd0e195c76208c55b56aceb649a212bcf726e279e692e2695902f992c8db98e070067b0fd6ac2ba8a03a6a5e49318a9d26c567acab532bf3eb50c946925c2e7a54cb71c7dec565acbeff9d48b2fe5ed51628d4171c7dea3ed03d6b37cdcf7228f3bde8e516a5f69d6a17b8aa8d37bd42f367e94d445f1165ee3355a59b83513cbcfb542cffdea76b1561d2499a849cd0cd4c2715686c09c5349eb484ff7ba531c8c714c435be6fbd4c7fbcb4ee49a69c6e5db8a920ccf14ee6d06eadd3efdcbc16a3fedacd1c47f466ad46fbedb4703a7d3359dabaf9f26996d8c893528a46fa469249fcc2d6876dd8a6f6280814d614a3a1a4c8c67bd210da5491e19639a26c3c6fbd0fa11c8a339e29876f719ab45117c069a3d3b43d7fe1f0c29f086bf796d6c9dd6c2ee437969f8049a48ff00ed91af4cc1fef0fcebc7bc2778ba3fc7cfb07cc078b7c1f2ca7008592e34ebb5c7d488ae64fa715ec32491468d34b222c71aef77620054f524f4aa96e62d582972001d412320773551a79b52b24b8d1eea38d65c6279212c0c79e76a9c64fa678fad165a7db586f689a49269ce669e66f32594f62c7f90181e98a824743f6d69a533ac290e7112264c9d7efb9e9f801f5352d388ef4d231e9400dc64d23714bfed6da6b75a004a29475e9f8d07ad002018a46a527029a4e680129318e694f7a4ff000a005a29b4502b8beb4e2148a6fad2d0082947069294f5a063d7ad07ad252838a005cf38a729c1e94cdc69c39a0078c67eed1cfbd2039029df950587434a3f9d3338a7039a007638ea4579e78c2e5af7c796f679fdd689a3990af6173772e33ff7e6261f8d7a16198ed19cf6af291749a9788fc49ac236e8a7d51eca161de3b402038f6f384ff95038ae6762aeb471abf8707aea128ebff4eb356b83902b1b5d3b757f0be7a36ae63fced6602b613381f2e78a0d096954e4547b8282eee1547524e00fad36dee21ba884f6efbe37e8c3a1e6931326c8dc06793d05739ac1dbf107c26c3bd96b23ff0020c27fa55cd7b543a4dc686ed10315fead169f23ff0077cd46da7f303f3aa3ac9ff8b81e0ff7b4d67ff49e2a710474fdbf1a01c503a15a6f4fbb4902240714f0d5086a7018a632c86c9a706ff6aab87c548ac3340138761c53c3e07cad55e9d93e9d38a00b224c7ae29de6ff00bd5577e0d286e0516158b7e6d279cdfde355b79f4a379a2c16263267f85a9ace3ffd55096a4273d8d03242f4d2f51eecd216ebb7f5a561dc797a6139f999ab2ecfc45a56a578f69a64d25e888132dc41116b68c8fe0337dc273c6173df38abecc7fa53b08733e7e5cd30f5a4a2980a3a1a6938a09f4a31d6a7616c55993ccd46d4f681657fc4e147f235641e7e6a66dfde97ee171fae69777b5318ec0c0a6fcbe94848fc6939f6a0052703d29b9ce29934d1c3b1669510cafe52066c6e27f800ee6a156bf6b9903c50456a3fd590fb9e5ef93d907518e4f1da80380f8b7e2493c09e25f863f111612d69a478b134ed41c0e23b3d46236b203edbcc4df58c57d137fa55acd7a9f6c06736721088ec4c5bf3feb0af4278ef9af00f8f315b3fc1bf17dedce99fda474bd37fb56280920b496d22ca083d88da4fe15ef9a66a10eafa5586b16ce5e1d42ca0bb89dbab2491ab027df9abbde28caa68cb41d892c4939f5a69ea282714d3c54103bf8a9a700d2f7dbda9ad40ec293519ff0076949c53739fbd4d085c640a4a28a18d6e235273ef4bc0a43d6903109a6d3b814d268258ea29b4501701d4fbd293834de8d4e3c9a005ff007a973fa52034679dd400e078eb4b4dedf8d2e78cd03169dbb14dc7bd18ff006b8a00917ad2b73518dc2a41cd0ca42ff3f5a01c5231c74a01e9ee7031cd0494b5ed693c3da16a5e2095415d3ad25ba19e84a212a3f1207e75e67a0d83e95a1e9fa6c9b9a4b7b58d6463d5a4c66573fef48598fb9ad7f8a1e27d1ee4d87c3a83508a4d4b58d4235bdb78497682cadb17131908e23c98e08f0c73fbde958d74bad5e4cf14173169f0e4fef5104d3b7b8046c4fc727da9edb9ad3ee56f13c9e4a6857bd56dbc45a63c9cf44794c6dfa356b4a6e5a04162f6e5dfac92e595477700753e83a56178c2d244f046ab1c32cb3cb6b6bf6a8a49e4dced240eb2824e064fca6b4bc3f7497160fe5b6560ba9edc7fb81b2a7f146069165ef2524444b958e7d9824bc6304fae3915603337cdd7f1a8f926954e29d82c735f134dcc3e08bfd56d4bacfa3cd69aa4650e1b105c46cc01edf217cfb669fab5c4379f103c1b736843433daeb6d195e9b0c11118f6c115bd7b6506a76773a6dd6d36f7b6f2da4c0ffcf3914a93f86e26bcff00c2f7264d5fc05673222dce976baee9b731a83fbb92de28e323dfeed28891e92d46ef6a5714d1d69582c281c8a72b5254723a410c9737122450c00b4b23b0558d3d493c01ee698c981e7d0532e2eadace096e6f2e60b58605324b2dc4a91471a7ab339000f726a0175f6cb0173a54f6f2f9f1eeb695f2626f4271c94fa75a6d8da5cc76861d5751fed295dfcc91a4b78d23cf60b18e883b64b9ee4d2b0ac2e99ad45ab191ececef0da463f777735b989273ff004cc3fce47a36003db3d6aec48239649bce95cc873877caaf1d00ec3fc4d26e7277e496f53d6805b1e828b0f526deb4bb8541f2ff007a97771d68bb15d936efad264d45b9bd69416721537313c0007268b8ae485e8df9f5c0e723f9fd3deb32e352c4d71616103dc5ec10f9c11c345073f7434d8c027d064e054777a3dbeb105ba6bd147726304c90c52482da47ee4c671e601d8371df145c2e4b71ab4d2dac371e1fb4835613c8eab2477682dd70796690672323f87272314c86c6ea7b5b887c477906a4b788124b65b60b68a9dd554e4b83dcc9c9c741574285508a815106155460003a003b7e14724d388d08a155551142a20c22280aaa070000381c63a528fad1834940c5ce3bd26efad213da93bf34730ae3c75a371a3f84d1b4d49204e4065e7be6a01386b892d811ba38d091f5ce3f953e3757883af2066b9a835cb75f156bda742935e5e44b6112dadbe0b73148c4b13c469c8259a9d8ab33a4eb8c2f5e9556cf52b6bf924167e64d147c19c47fb967ee158fdfc77c71ef4db38f533235dea5751877184b5b61fba8bd49771be47f7e063b1eb56c9c91b780bdbb628b058a56ba5dbdbcff006c99e4bbbb391f689f05941ea8a3a463d42e33dc9ab87fdaa08ef484ff0077f2a634ae473c169756f359dfc227b6b889e1b885ba491b8dac9f8a922a7f80574d6ff0fcf832e662d77e06d42e7c372ee396f222224b490ffbd6b2c0c0f7cfb54459473589a1de7fc233f1974bbc43e5d9f8eac5f43ba5fe13a8d9c724f6527fbcd0fdaa1f7d910ed4d7614e3a5cf656ebe9413c51c1c6de86823146c63b884ffb5cd371c668273fc5487a522842706827348476346703ef629a25ee078e8d46540a067fbd9a439fad21084e4525047fb5484f6a004278a6939a774cd32801c3a5140e94501cc07ab52e33487ab519e7140ba0f031474f7a4ce78a5a005e8281c83da929475a007528ff007bf0f5a8eb07c69e2db1f0be9663fb640babea20db6936841796e2e5cac6a446012515e456738c0009381535270a50739bb25ab348abbb23a2cff75a94374f738ae33c1be38b8d4afa2f07788ec2f61f125a5acb2dd4a2d00b5b948e4dbf68568d888c4836b0460bc96033b6b7a75f12cdae5b35ade69f67a34012598f92d35e5d9e7318df848631c65865cf62bce668d586229c6ad3d53575e84bbc5d98ed6bc4da6681716961782ee7d4350245a58da5b3cd713631b982818445ce4b31000ab3ac6971eb366fa74d797f6d148c0cad65746de5953bc7e627ce10f7c1048ef4ed2ac6d347d3e3d274f5923b58f3f234af21625cb12cce497e493cd5adaacc11b1c9c64f6f7ad03a1e5fe20d3f49d3bc5f63a3787f4db6b0b2d13467325bdac4122592e660572075731c59c9e7069f907e6acfb0bf5d6afb59f132b864d63549e581d7a35b458820c1ee311b1c8f5abe0668365a21cf0dbdc46f6d75fea275314b9fee38c1fd09ae3be1c5dcb14575a2de652ead238e39949e92db93692feb029ff810f5aec47cc0ee5ae1f57b4bfd33c49ab6b7a3da493de59791ac8b68c7cd796d2c7e4dec03d5c9b55993fe9ac69ea4106d1de0ce3e6ed4039aaf617f63a9595bea5a6de47756779109edae10fcb2c6fc861dfebe8720f22ac63a8a0078e72a791e95e66ed73a77ed0967a5fccd6baa6957fadc1fdd8a5fb3476f3a0f767884a7feba57a5579feb67fe2fdf83dbe619f0ceb63dbefc5fe229a2647a316527d31475c9eca3249e807a93d87bd3032eeda7b1e477ac47f0e1d598bf8aef8ea31e77c7a7c71986c6319e32b9ccc718c990919e800a2c51a5777b74d6715c6836d6d7ef3902277ba11c010ffcb52c012e07a2839fa7350c7a20bbb6862f123db6af345379e85ed42431bf60b164f039c1624f7ad18d5234548511157845450aaa3180001c01f4a5cb034b94394774fa74a31c629b9268a603ba77a50ff8d333ceda377fb34807e4d19ff6aa0b9bbb6b1b696f2fae63b78221be49256daaa3d6a9de4379ab4102d8ea4f67673c7e64d247195b9910f448cb8fdd641e4e37f618a009af357b7b4ba82c12dee6eaeee304436f1ee2b1e7064918e11107b9c9ec2a2d43435d56e59752d4ae24d3f8c5847fb98a423bcc47cf28cf3b49d9ec6b4172b18b7577f2d00014b93d38cf3dfde8dc7eef6a5a0b41e589c7cfc0edda8cff00b59a6d213f951a068389e3ef526ec5200bda94f145c2e19fef503a520e7ad2d2100e68e828271499cf1400e05ba7e346707dfdaaa4f35c37da20b44314a91831cf3c24c1bce4018c82f8ea40c75149a7593d9a149af6e6f26721e59662325f18f9547c91a7a28e053b0ec4e9c47227dd02438fc70735cef85151f51f16dfa471a8b9f104b112880799f67b6822249ef87dc3f0ad2935cb1b4f14d9f872471e7ded94ba88e4644503aab71f561cfb5647c39573e08d2ef24ff59aa7da35793dcdddccb703ff0021cb18fc2a8674a5b9eac7eb499e73476fbb484d2015985464e73467921b191d734dc83fc5ff00d7a0d2311acdfed5727f1416e63f03df6b7a7aff00c4c3c392db788ac5bb89eca659c63ea91b21f626baa279f9bafa531d607478aee2f32de5578e68ff00bd1b8c30fc46453b835cc8f51b5bdb3d52d61d534e70f697b147756c41e3ca910491ff00e38c29c7fdeaf3cf8097d703e1f2f83f5197cdbdf03dfdcf85e694f3e6c56ed9b593df75bc917e55e824e687b9c9b6819149eb4add29b48a0a33c52f3ef49fc2699360a6b1cfcb4a4e29b490d8a7a7bd274a09ff006a9a7a50488dba9b476f7a08ec6980e1d28a6e48a29d8561c7ab52720d29ead412702a462838eb4a09fad300614ea05b0ea51d0fad2751450317926b03c61e114f17db58403559f4c9ac2f92e45d5ac6a67f28c72472c4ac798fcc493048e98071902b781a5fc7f0a728a92b495d14b439ef08f82e0f095c6ab2db6b37f7d06a725b98e3bd28ed0471465523f371994004e1a4e70067279ae881cfce0fbe68038a0f2775284234e2a31d90b7dc703cd3867fbb9f63de994a1b18a623ccf56f853ad686aaff0009751d1f4fb3525cf87b568a53a78279616b2c5fbcb30c792b878c124803a5735a9f8bf58f09c52c9f10be1d7893c3f05b8ccda85b44babe9ca338dc27b5fde04ef99215c0e4d7b90e72d4e4778c83148c84742a718a7ea526d1e3fe18f13787bc6ba247e24f06ebda76b9a4cac634bdd3ee56e21de3aa164e8e3fba707daafadba0bd5bee92a43e4eee8766f0dfcf26b97fda87e1df84748f84bf117e2bf853c3b6fa178f2d3457bbb4d7f47df637b25c892311199e02a2604b72250c39e7a57c25a7fedd1fb4bfc11f185e7833e3d783edf5b92d18453da5fda8d3ef62c63e78a68879726473f74839ea2b4851f68bdc2bdaa5b9f79dd689ae7876ee6d57c150c7756d7721b9bed0659444b2ca4e649ad253c4329ea636fdd487fb84e6b4fc3be2cd1bc4ad7169a74d2c57d6401bbd36ee2305eda03d3cc84f201ece3287b31af9ff00c23ff050bfd9afc4de5c3aceb7acf852e24ea9ab698cd0a9f7960dc3f1c57b2d86a1f0cfe346976fab786bc49a5f88e3b33bed353d12fc7daec091c98e54c4b01c750c307b82293a5287c48d2324ceb2fafec74db57bdd42f20b6b78f01e595f0b927007b9278006493d2b88f125c237c51f86ba8a25cc3fda76de23d323768fca96373602e070e3838b56c66acc9aaeabe137825f1cdba6b7a5593f9969e24b6b1dd3591231beee0404c6402419e1182392ab9355fc6d7767a86aff000b7c4ba5ea1693e9f178c047f6f824135b949f4ebc8028923c81b9e48e319fe3619c66a12264773676b6f6508b6b743b3a92cc59a43dd989e493ebf962a6cff76980e147e1f853aa4a0924f26279594911a972075da3934e57dca194e410083edda915f6b0ee7dfa555d3be4824b566c9b494c3efb0731e7fe00451a8b52f03ef9fa552d535bd27448a29357bf8ed239e4318924076e40c924807620c8cb1c0191934cd6758b2f0fe9771acea2d2fd96d80693c98cc8dc900607d48c93800649200aebbe1af823c57aa78a6dfc61e21d3ec6cb408f48b9b482c8dd477725e4971226647f2f3188c45181b413924e6b4a707364cea7218441562adc11eb413838db93e878fceb77c51f0a3c0fe03d16fb5ed4bc63e27b3f0fd9006d749b4bb8d16366384b78484f35b731091aefe3200e3a723a05aea163a25adb6af2c8d7637b4ab24a6630ef919843e61e64f2c111ee3d76e68a9074f7084f9cb4b6ab205fb6f9574f1ca65898c23f7679db8ce79009e7dc9ab04e4fae79ff001a6839a013f7b8acae55c507145373eb4b914cabc58bc8a33c6293229681072283922909f7a37d002e48a51d7e66ef4d2d8c753d871d7fce6ab4e3507bdb77b7bc8a2b58f799a330ee798f451bb204683a9e092401c0cd005a3c1f9bf1a6ff000d4305bdb5aaba5adb4508924795c2205dd23fde738ea4f7352138a007018f9b6e3e9c50b80c31c0f414c2d421c3500794fc6473a478efc17e20864d92ea3a7f883c2c8071e64b7168278133ebe644d8f7af4cb186cf4f10f87ad9e3f32c2ca20900fbc2018895b1d864015e43fb53eb23c3be14f03789e38d65bcd2fe2478725b58997e594bc92c72464f6cc6cd5a1f127c2ba93fc4d8f51b6b9d5f50babfd06f61d26de12b0c5637369710cbf291f2199a169bcb69b38761803156fe144af88f40bff14e97a6ebf61e19992f64bdbf85ee10c36af2c50c42411f99330ff5686460b9c1e7ae2aedededa69f14b36a3776f6a91446676b89022ac60806439e8992013dbeb5e59ff0886b1ac78dfc1fadeb11f887ecf15978874d8a2be9079d6569264dacb752467f7971811280c48cae7a926a45f83dabeb1a4793e24f138b4d492e60b7f32c3334736991c3044d6cc24c106636d1ca48fbb201d79ccb2d9b9a96b5e2bd4b51f0f5c7846fcdd1692fec25d3208c791a8ea36f894da96946f8f74315d2c52646250b9c83c4be26b9f185c7fc551a359f89347d27c3da65e6a1769aa587d8a1d45d0c7fe8cd1cbfbc94f95e69ca8015c0396ad6b8f0a436d61a9cda2dc5ce972dc6aefe2186f1be78ecf50320904aa0e13cbde398f3821a404fcc6b90f14fc66f08cd6faa7877c5bf137e137846db5d4b7b7d69349f113de5e5f4712ed10a2b1d96c84641601df1c633822a2aeb5225ccb63d18b293f27dd3c8cfa5078ec3dabc67c61fb557803c39a2a6bde1ef09f8d7c5b633dd41a7db5e693a0cd058cf7339db04314f722312163c01183ef5d2e91a5fed67e3b0b29f06f82be1469f260f9baeddc9adeaca9ff5eb0ed8a36f66638343a6dab8dd4499ea7f0fec6cf4ad7b59b9b4867dfe20782e2e4efcc7e7c110883e3b1280027fd915dff5af1af007ece1ff0008df8b6dbe20fc41f8b9e2ff001ff8874f9a496c05ec8ba7e9562ec853745616e7cb2e159806909ebd335ec7b8d458c9bbbba128a283da9a13dc2827ad14df4a41b0139a3bfad213814dcf5cf34030279a46391413c5368256a19e683cd1463de9a18609a29474fbd45511ccc3ae7ad2919a6838269f505899c8a5a29a0f3ed4098fcff7a8dded4dc8a01cd01a8a4e3d69c0e3d6909e051bbda818ece477a4a50463bd2500293cd2839a17a527f08a007a9fca9dd0fa53557207a1e86b2b4cd4f59d52efcd3a0be9da62a9c3df4856f267ed8813fd52753990973c61475a00f37fdac756b5b0f81daf6832dd4515f788e6d2f4bb5b5620cd389f508236db1f718cf38c76af3cf1bfc2ff001c7c4f37da3f8abe16e9cfa21b99634b6d5ef2c45c346188c927708011c80a24906460c66bd0be3e68ba141e1df0e69b6da74497de2cf88fe18b596720b4d3117cb3b02c72760487851c0c577acfe648f36dff0058e5b23dce7fad6ab44ac5c3a9f2827fc13cbe0d6a3b3edde09f0c6871a26d3169979aadd311ef2cb70b923d704d769e09fd863f674f026b50788f41f0e6b906a76e55a392dbc41796499f5db0ca0fe6e6bdec74e29c0e3ef51cd27d4be448f35f10fc3cf8ae92e7e1efc66b7d3adc9388bc41e1b8f559e218030b3a4b13bf7ff5a1cf3f78d794eb7e18f8adf0abe22fc39bbd6fc59e09d6b4ff001a78c6db46d50e9de173a44c5c44f3c529092b46486871bf1bcee2338afa883715e23fb46c97e3c59f0965b07c0d1b5dd4fc4b74b8ce6dacb4d6f307b13e7000fa9a13d6c39687a1c454c6bee01a7e73c53648fcb91e20d908c5011dc034039ac6c16141525b0e3287079e8700fe1c60d5477fb2eab0cbd22bd4f21c67a489968ff31b87fdf3556c1b6788b5ab75e92a59dd03eb959233ff00a296aeea56af79652c3092b3712dbb8eb1ca9ca11f88a632d83c1dbd08e9d720d41e1af11eadf0f6f75ed37c25e1e671ae416b3d89391a7595caee8e79a519c27f03796a01908e3bb86da5d477d6905ec29b16e1048147f093d40fa1c8fc2ac0e315716e3aa25c14b724f16f8c7c71e2bf0dc3e1dd6bc3ba75cdcc57d677516a96178208c18a60ccd25b4c778ca06e11a4e48a462a5c91f749247d3b5333ce2973cf34a4dcb7124a3b0a1bde8dc29338fbb467fc8acc63a8f97de99d68a00793dcd213da93f3c525002824f03ef1e95956bafaeab7689a25abddd887227d44becb75ebf24448ccef9f41b07735abb945265401b7a018000c003d2aa23455b7d2ac2df509f5748e46bcb91b249a495dcac7c7eee304e238f81f2803919e6ad918a4a01cd030c8036d21feed07f3a3b7a50007a8a3afdea42dcfa9ed4d66a570d4f01fdb5ee6cecbe18f85350bfb836f6f67f113c3b7134a067cb8c3cbb9bf00335a1f1eff006b9f08fc0fb7d3ae755f0078db5097c49f69974c5934efecd8261111b8992e087c7ce39087391537c62f0a47f12f5df0cfc3cb8959bfb77e29787ad6252d955b7d3ec66bbbb3b7b8d8a463d4e6b7ff006edf815e1bf8edf18be0f683e27babb8ecee6c7c4a91ac33987ce9628619a38cb004e0e0f030481c115d546119453974b98ce4d4f43e2af13ffc14b3e33788af0e99f0dfc03e1fd11a5e210f1c9aadd7d429c467fefd9150f853c51fb7cfc6bb94483e276bfa759e4ac8f691c364067b22dbaafe64803b9afaf7c03fb13fc31f060cfd82de643d61116c88f39f98062ee07a34adff0001e95eeda2786745f0f5b25b6976114491f0aa910551e9851c0a6f1118e90486a127bb3e74f85dfb1d24d6f1eaff00b4078c7c41f10afdc026d359d56e27b645fee794241191d3390f93d2be80f0ff00c3df87de110abe15f00786346d8300d8e8f6f091c7a85cd6ff00fbdc9febfe340ff76b9e527234491e3dfb57dd5cdb7c38f0ef88dae1f3e1ff001f785b50058e428fed148cf0781c487a57d1d7a822bfba8d3802e24c7fdf66be6dfdb22298feccbe3dbfb60a67d1ed6cf588b3fdfb6bd8651fa815f45b4cf7012e25fbf3c51caf8f578c31fe74efeed8ca6bde109cd252138a41dbad40ae3a994a3ad1c74e68109484f6a09fef77a4a0570a31ce280714d639340260483498f6a281feed0014878cd28e298771247f3aab00e5e945264d14c2e291c9a7139a42793499c1f4a918e3bb149480e6969d805038eb4038a4e9ef454887d1499cfdd347fb3bb3405c72d3bf3c5355598ed5e4e7181eb58f6be278753be4b6d034eb8d4add2531dcdfa910d9c18c86d923ff00af6078c4608cf56e2819af3cf0dadbc97573711410c78dd2cae1517270324f151ea097f25a491e99736f6f74702396e21f3a38f9e4ed046fe338078f5aa573e1bd22ff00558f5ad4a17be9adc27d962b990cb6f6a7182f1427e4121ef21048fe122b572c7dfd68033349d06db4a926bc7bcbdd46fee404b8bdbd9b73c98e8028c24683b2aa015a8bd028e29b834bd47bfbd00795fc749a26f127c13d39c9dd71f13f4f9957feb85a5d487f2c576109fdd47fee0fe55e5bf1c3504b8fda1ff67cf0d29f9d354d77c40ca7fb96fa798c7fe3f357a946308abdc015a3d9174f7649f3500ff152638cd00e3b52351fd01af39d7b4797c5df1a25d0f6ee8b4ff855e209f637dd33de5ddbc29fa5a49f9d7a2a9c91ef5cff00c21821d7bf693f891348dba2d0fc1be1bd11d73c6fba7bcbc7fc76cd17e95b5257918d4768993a15f1d4740d2f522726eec2dae09c7778549fd7357ab9df87bf2782347b6f9f36514f627775cc17334233f828ae872b9ae792d4da3f0a3267dd6be30b198709a8e997369ff6d6075997ff0021f9a2b64330e7bfa8ac4f15bb5adad8eb1bbfe415a8c172f8381e59fdd499f6d9256db232394ebb7298a4050b1d969a8dd69a3e58e5ff004f807a6f38940f61273f490568e3fbdc564ebc64b3b55d6e18cc92e964cc550732c446d953f1186fac6299a5de917d358b4de6ecc8593390767cb91eeec243f4145c0d9f976fdea071d69a18e0d1bb3d68b80efe2a463823e6a4c8aa9ac4b341a55d5ddb426696da2fb4ac6bd5bcbf9881ee4023f1145ee05dff0081528c90719c5660f10e9573a843a6e9b70d7d2cd1a5c3b5b0f316089d774724add1030c607df39ce314f5d2236d59b58bbbab9b9913fe3d6191b10da0da01f2d471bcf3991b279c0c0a00bff30a07fbd4b91499c7f8d1715c5a45a42e31f2d26fcd031f4533e72091c81d4fa50432e32a41ebcd170063cf1484e4e293393505ccdf66f2ae1db11f982390ff00743f009fa1c7e74016070680a19951ba138a6aba12c8ae094c8201e98383fad2ac9b195cf3839a00e2fe19e97ff092fed1de0e9e4f2de2d0ad3c55e287f69a79a0d3e161f448e61f89aebbf6af59f4af1c7c05f1a47c41a7f8f9f49b83d36a6a1a7cf001ff007d6daa7fb2ad91d43c77e35f124ae1d34ed2b47d062e39590b5c5e4e33fefdc2fe55a5fb75afd8ff0067d9fc59b4f99e13f12f87b5e0e3ac7e46a70ee3ff007c330fc6bba0bf7763924fdeb9d20564e0f51c7e20e286e9535ea88ef2e107412be3e9938a82b899d685ec3eb48791f32d14d27de96e079dfed21a67f6dfecf1f13b4a53b4cfe13bf3923fe79a893ff65af65b497ceb0b2947024b3b67fce18cd799fc5a80ddfc24f1e5b05cf99e16d5c63fedd243fd2bd1b477f3345d2a51821f4cb26cff00dbb4755d0ca65ae7fbc2928a77f0d4902720d25296a69cd00267f3a3a7cb4a077a69e94098b9c5348cf734139a4a02c1ff0002341e0d148781406c078f5a6fb52e4d2555c4397bfd68a40714531dc53d4504f4ed4dce6948ff006aa42e196cfdea519fef5277fc6819cd3b8877e940dc4fad2af5a06cdc37b155c8c91e9de8b0c4ddec6b3f53d5ef2da55b0d2b45b8d46f645f3073e4db42338ccd31e064f4500b9f4ae7bc1d7df10ae3c43abdb78b6d4a58c6d73e4b7d8c410a917788160933bee11adb123c87a3e0672703b2f9b1b7ef63b50d5806db7da7ecf17db7cafb46d1e6f9258a6febf2efe71f954b92db79fba303dbd87a5229ff006a8a91ee3874a5c1a67e34e1d280170681b7f88f1de81f5a09da0b7a0ed4fc867cdde2f173e21fdb9bc3b86cdaf82bc0aeb8ecb73a87db246cfb98e083f0af6e1c7e35e65f0f3484d53e29fc55f88b36d77b8f164ba15ac99ce6db4fb0b3b518f612fdac7d41af4dc66b47b1a41590ea53d69878e29c3a54961c90420c97e07b9a8bf666d2a3b8bdf89ff11bcd4965f13f8d2e6d20603ee5a6971c7a742befcdb48d9f47aa3acf8861f0e5c6997974e05af9f2cb7391ff002c2deda4b8908fa2424d74ff00b2d69b73a7fc01f06dc5edb886eb58b16d6ee57073e65ecad724fd7f7a2ba30eb7673d67d0f34b5b76d2bc47e32d0d90225878a2f64897fbb15c08e7503dbf78c6af0607f8b1563c6d03597c65f175b326cfb7d9e95aa21fef031c9013f9c18aaa5707e535cf53dd933a29eb1451f10dbdbdfe9171a75e175b2bc57b7bb65fbcb0104314f70391ee0547e11d4ef353f0f5a49a9285d42d81b1bf45e8b7307eee403f207f1a9f56123d8cbe5b61f20f3d3839e7fd81d4fb035cf785aefec7e20bfd3cb4821d5634d42db79e44f1aac73c7f5319b694ff00b7249e950ac5f29d97041574dca41041ee3bfe95c7e948ba55ddce9664f2d34e905b06c722dc29954e7b9fb38c13ea735d60383956e41eb5cf7896ce46d4b4fba883986fca68f7280f0a924aac243efb15a2ff00b6a0501ca7470c8d34314ae9b1a48c4850f51919e7f953ab163d6a217a933b102f2525401d23cf9708fa1219f3fed54ede20d3ff00b4e3d22cda5beb938332da80cb6b19ff009693312027b0cef3d81a08350027eef233838ed546c2f2f75069da7d2ae2c2d8feeedccd27977128e4190a8ff543d3277f7e2a45b0886a126a4f717124af108551e63e54483aed8fa024f24f5f7ab007b75e4e3bd1b0d9ca7c3db4b5f0e5a6a1f0f6d6d92d53c37739b68973fbcb0b8cc96d2e4f2f8fde4449c9cc4335d6ff00c0ab94f1b0b8d165b2f885650bcada023c7aa4118f9ae34a9083381eaf09c4e077db20ee2ba8492196349a099268a44f32395395910f2187b1183408752b75a4f97fbd4500145267fdae68ce3f8a80286a5a6c577aa68da9dc69365abc1a55d4972fa6df4856de77788aac87820bc64e50302392782011369d6f2dbfdaddacececa3b8bb92e62b3b325a1b447c7eed490323393c000678ab39cf4a4c9a02dadc5cf3cd4575025ddacf6723944b889e2761d8382091ee3afd40a909c7cdd6909a00e37c33aacdf61686e5b65de9d28b09964e0974e6127d9a13f6a7ff00aea3d2badb497ed6176a90720107b1edfcc71db35c77882d1745f1858eab9dd6be2012585cef3c7db50192dbf195035b7d020addd2afd6d6de7bc964063b7b792e8c85f96d8858bfe3f7bdb7250f41ad373aafd8dac124f867ad78842153ae78af55badcdfc51c7208531ec04671f5aea7f6a8f079f1b7ece1f137c2f02334b7be15d445ba8e499a385a58c7d77a0fce9bfb2968efa47ece1f0fe1b942925e68d16a7203d77dd9371cff00dfdaf5778639a330491abc6ff2b2b0c86078208fa66bd18af751c327adcf04f0ceb70789bc2fa1f892d5f7c1abe95657f1bfa892de36feb5a40e2bce7f67d496c3e13695e169e67927f0addea3e1891dd36b31b0bc9adc6476fddc719fc6bd132d5c125ef33b13d8524fe3480e3ef2f3499e682deb52331fc6d07dafc0fe29b554c99fc3bac458f5cd84e05745e01ba37de02f0a5e16c99f40d32424fafd963cd666a48d3699a84017266b0bc8bebbeda418fcc8a7fc2095a7f847e0699b927c37a7f5ff00ae2a3fa55743396e759ff02a09e28e41a6fdea93303927f9500e690ee140e6806c0e3f1a42d49d33487ad0217391f76928a423f114c36173c7a53492694f4a6d3b030a28a29121451455009d49a775e2980f34e2714142fcb91eb4038a07385a4a910a0e29e1b9dd4c0334abd29f41a170a3147ddff3c9a28ea40a90178cff00853b39c5301e8dda9771a007500d1450087020ff00153e09618a68e6b9709042c249598f091a7ccc4fd101a8c6dcd70ff1c355bad1be0f78c6eac64d97971a4cba75ab7f727bc22d10fe1e7e7f0aa8ee3b1ce7c0d495be13787755b9884771afc771afdc01de4bdb892e89ff00c8a3f4aeeba552d1b46b5f0ce8da6f866c31f66d1ecadf4f8bfdc823110ffd06aef5a7cc6ab60aced4a5996fb4d405c43e719240bc798427c899fee0f999fe82b46b0b5f6717a890ca0c9244214cf0220e7a7fc088c9f448cfad059c0fc7fd4afd62d27c39a324b26a7ae59ea1616890e37f9b78f6fa76f03d92f253f857d7ba569d6ba3e9967a3d8298adec618ed615f48e350abfa015f273450f8abf6a1f85ba2323c96b6de1ed435fdd2264b25bddc3b5ce3a1f3044403d3757d740360576525689c95b567827c68b64d3fe306817fe68075cf0ddf59918fe2b3b98664fd2ea4c7d0d6306fef575dfb46d924727813c4c8bfbcb1f109b0918f188af2d66888ffbf8b0d71a1b81dcd73e217bc74507ee8e9d12e2de4b7780ceaea418b76df37fd8cf6cf4cfbd70ceb791d82eb76e44f7da7cc752fb9849e24c99a21ed2249201ef244074aee72ac0ab2820f0430c823b8ac9bcb3b8b5904d650ba84c386ebb6404953f45cb49ee4a8ed581d17352de786eede2bcb39bcd8278c4b139ee84719f7ec476208aafac269d26917a9ac5dc76b62f0badc5c3cbe508411feb377620e181f500d43a35ada69161fd8fa724424b4064fb31971e4993320523ac60e738f7245436ba149737106abe25b88f50beb76f32da25422cec8ffd328cfdf7ff00a6adf3fa05a00e0ec757d7f5fbe8ef16ca2d3acb4f94db49f6885d6795e3882c2238cffa88c82b2e641bd84cb800727b5f08dfdbcb69e4c4a9189d05eaae307127ddce3b88bc9c9ea49f6a8bc55e1bb8d467fed3d37fd7c91886e933cca07fab9327ba96249ea4003b0ac6d32e596eae2e8486340ffc270577eec27d5618e55fae28b99ec77fbbda8dc31556c2ebed702397432ec432aa8e15c80d8fc011560293cf5a0d07076c8e87fde1907d8fb633f9d727e0b27c397fa8fc3a959fc8d2c0bfd15dbac9a5caf81113dcdbca4c39ff009e661cf26babc115ca7c40ff00893db69fe3a8223e77862e7cdba0a3265d325fdd5dc44770015947bc40f6a089773accff00b5fa505d7bb52347b5880e1c7661dc7507f11cd2056a0af8876ef6a37e293651b545170e540643484bfe1ea6a2bbb79278f65bea37166fd9e1556fcc38c1ace9dbc5b68435b7f646a9ff004ca5f32ca57fa30dc80fd4502e546b138a6e7deb05bc65a75a909e21b4bdd0243d5b508b16e7fddb98f3111ee4a7d2b6d19248e39a26478a41ba3753b9641ea08ea3e9407ba6678ab499b5ef0fde69b6a9baf3625cd9f407ed3138961c1ff7c01f8fbd721e2dd467d77e19ea775a14d18bdf19db5b68da58c8522e351945ba8ff60ac92b0c75022f6af431d98607718eb5e59a8417fe06f8c9e03975abcb78fe1beafe36b6d5269dfefe8fac186711452678fb2dd5cc9132371e54a08e8c2aa9abcd21547647dbfa6e9365a2e9169a3699179367a7dbc76d6f183f7228d02a8fc80ab313e635eb9c62abbdc49868d936f6c9a7c1ca956c633ce6bd33ce71b9f3ed969c3c37f12fe24f8606f092eb36de27b60cc1bfd1f51b50ad8f41f6ab0bc3ff00021eb5b67a537e27e9434af8d9a1f892389517c4be1abbd1ae5f39dd2d9ccb756e0fd2392eff00efa34ec1eeb5c1595a4ceba6f40c7fb58a4efeb4741bbb5349cf4e2b0dcbdc960c7da234fbc1d8022b23e02cbe6fc13f03b97ddff1268933e982c31fa569c32f933c5328cf97223fe441ac6f81216d7e1bc3a2aafc9a1eb1ace8f1ff00d73b6d4268d71ebc01576d089a3d041cd3697e63495264c29a4e683c8e9460e3eef3409099c0f98d1fef514638a63005b9a18a8ef41e07cb4c3cd01b0504e7e5a5edf8d276cd3b8833d6909ed4bd29bfc2698d0ea2983a514ae16109e69c0e40a691de8071490c901db45341cd3aa8962e180a3d7da929c7bd240264d3b39a6f6fbb464d0c2e3a8ff39a3e63fc345494193cff008d381cd34edcd1f2ff007a9a10fc7ff5bdebce3e3db24fe0bd2b47dc4ff6cf8b740b02a3b8fb5898ff00e89fd2bd155b9eb5e6ff001659ae3c67f08f4b6ff553f89efafe44f5fb26952b467f0792a96e389d44d26f9e5957a3c85ff33481bd298a3807da972b4346e8901cd6178b6395ad627b647f3df7dba363f77107c0694fbe3e41ec5eb681cd3b3b811eb523391f84b6704bfb58eaedf3a2e83f0bf4bb482376c90977a9dc49213ee7ecd1e6be9bc60fdee9dabe5cf81537db7f6c1f8b8dfc3a77843c2d6600ed96ba97ff0067afa8ba77c57a14fe14714fe23cc7f693b723e0deb3ad451976f0fcd67ad8f6169731cb27fe43592bcdee22f22e258f39f2e474cfd0e2bdfbc6de1b8bc63e0cd7bc2170e5135cd32ef4c671fc225899323e99af993c1fab5d6b5e11d1f54be8c2decb631a5d207e05cc63ca9c67d3cd8a419f4ae7c42d99b507ba36259a2b685ee2e6e228a2893cc92595c22469fdf24f007b9acb5bdb9f10d92cda25e5ce9b6b24a55ee65b5c4d34007df8049c004f4918740481c8a8a2d0a7d4a68eff00c58f15e49137990d84793656efd9f0466697fe9a49c0fe002b6d9999b73b127df9ae6372be99a6586916bf63d3ad12247732487259e590fde92490fcf239ee493fa015622b8867dfe5cd1c9e5b189f6481bcb703254e3a1e7383cf229ac372b29cf23048ea6b96d6a0bdd135397c55e1cb333c9e586d674d8801f6cb44e1668c1207da979d9ff3d5079679db401d793c7f43583afe888c1aface224967966857fe5a3b95dd27d701863bf98e6b4b4fd4ec357b0b7d5b4cba4bab3bc8c4b6f327dd910f7f6e9820f20820f35632bcedef4580e6746d5e585cbca85c88c6f51d649e575da07fdfc887e07d2bad25812bd70719f5ae7750d20a6a69aa5937264f34c79ff96ff32c447b079a490fa155c702b714aa284562420c027be38a0ae626dd91f77151cb0da5dc12d9ea36de7da5d46f05cc27a4b1382b227e2848a4cb114166fef503e639cf87775789e1f3e19d4ee5ae350f0bdc3e8b712b759a38c036d31ffae96e6235d3927d2b90d659bc39e37d2bc489b92cbc4023f0f6abe9f68049d3e63e843b4b013dc4d10fe115d5eefef6450d129d89096a4e83bd47bb9f5a4ddf850573324278f5a68dc33da9bbbda8cf22808ec283b46df5e30475ff001ac47f09595a48f77e1ab893c3f71236e7166a0db4cfeb2db1fdd93eebb5cff7ab60aa3a9574dc0f63deaa7977f6649b673770ff00cf19085957fdd63f7fe8dcfa1ed41453b7f105c59cf169de2ab18b4eb894f970ddc2e5ac2e9fb0121c189cff00cf3971e80935775dd1347f12689a8786fc43a7a5e697aa5b3da5e5b3e4092271d07707a107a82011d29d15c69dabdacf00549e2c18ee6de68f040cfdd96271c7e2315cf6a7793780961be79259fc2c24115e16dd2cda446e40128201792d95fef83cc6849e50601e807aefece5e32f106bfe1fd63c07e33ba9ef75ff0001de47a4cdaacbc9d52d248526b4bb623fe5a34240901ff968a4f7af60814aee2a72bd88af06fd9365b2f11f84bc51f13eca48a787c69e29bdb8b4b88e5deb258daedb3b5d98e31b21623d739af75b573e611bb8c74af41376573cd9f5b1e3bfb53ea2fe1af0ff00823c6db8ac5a178e7471798fe2b4bb90d9ca0fb1f3c7e54922181da17625a27319fc0e3fa56e7ed3fe1ab8f16fecfde3cd1ece50972ba2cf7d6cc46713db62e2323df310c5725a3f886d3c57a2e9be2ab37dd06b9636fa9c4dea278c49ff00b3d63888eccda86a5d3d7ef7e149c1148083d3348c54573d8e8b08ff002a9fc4d73df0403dbdefc54d29a62e963f10af64846ffba973636577b00ec37cec7ea4d6f48ca636dde95c5fecff0074f73e32f8edbb2562f88c9127fc0347b253fc855bd9915363d88f5fbd41ebde932bd292b23041ff0001cd2ffb5e949f21a28003da8fe21499c2fd69326a905c33d68e3de928a1885238a4c6051db9a43cf5cd0804273484e785a09f7a6e7ad4943874a2901e3ef515561d83d68231413d68e3eed492801e69d9c0a6edf7a32c3ef53431e0e6969339c52e71544d838f6a28a2a500a0e3e94ea652e4d36098ea5fca9b9527e6eb4bfef548c2b83f1a9b6baf899e03b377fdfe9f61e20d5420ebe5bc30dae7fefb900aef07196f4af25d7b5066fda72c34a66f96dbe19de4e07a17d5a107f45aa435b9dbd1499c702972299d02ff0008a3e6cd1dbf1ac4f12ea7a8e9d2e890e9b7369149a9ea8962c9342666910c6cd945041c295cc8c3a02280313f67bb6bbb5fdad3e36cd3c3b56f340f09cd6e7fe7a47e5dca923fe06ac3f0afa7351d4ac349b19f53d52f22b3b4b55324d3cedb238d3d4935f2068de3ed6fc03fb437c53d7b4cd274fbdb78bc23e14865171752c4de7196fbca8e3088c642c5f688f839239c66be94b1f0943e27fec9f16f8eb4b7fed68eda097fb266baf3ecb4db8dbf37971e36bc818e3cc209040c6315b51c442a4a54a3bc6d7f9abfe47254838bbbea71ff00147e2878b22f863e25f197826d1f49d32c34d9a5b3d56f60ff0048d42771b605b581ba2348d18f3a51ce788ce778f38f0ef87e3f09e81a7785e1b97b85d22d63b269dcee69e441fbc949ee6493cc909ff6abdefe2df83e4f1ffc32f12f83ed58ade6a3a7ca2c240fb4c77883ccb7901ff66658cfe1ef5f3d783bc507c65e13d23c532db9b49f53b549aead9860dbddf2b73091d8c732cab8f6aac42d8d30fd4db27a7b51ff00eaa8d26476744705908dc07f0e4669fb85721b8bd7ef702b33525786647b744324b283146c7896e3188cb7a47180643f4fa569d43776f0dddacb6972b234322912221c1913bafd0f43f5a00e005ddc7822e6ebc4da3c1717be1ebf22ef54d3614dd3425ced1a940bde49882d25b0c6514489f3820f7f69776ba85941a869b790ddda5cc42682e21937453467a329f4ae5eee6d4239fcb85c417b24afe5ce785825db99ee07a2410e238f1df38e735976967aa7857cfd5fc11669269d24a4dd787a590441881b9a7b690e043718c19233fba91db076bf34c0f41249fef734b59da0788b47f1358bea3a2dc9912097c8b98648cc53da4a3ac33c4ff3c520fee9fc091835a34803e6f7a06e3df06973fed7e9499fc28033bc47a0d9f8abc3fa8f876fdca41a8c061f3470d0be418e553d8c7205607b62abf8475ebbf10e84979aac422d5ad6692c3568471e55fc076cdc7a31c483b112715b24646ddd5ca6b1ff0014b78b6dfc543e4d375f7b7d2b59ecb0dc7ddb1ba3f5245b39ebfbc889e01a011d5f3ef4519c70410471f375a4ddfdd6a0d50e19feed2139a69626932d400fdd8a42d8f969b9cd04f5a00a9a869569a918ee1ccb05dc19fb3dddbc9e5cf176c06ee9eaa4107d2a9c77de24d2dc2dee9dfdab08c94bcd3c22cc3da5b673d7fda8dc83ff003cd6b57391b68ea79fd680323f664497c15f14758f05785ecf51b3f06f89ec6efc491e8b7d626ddb45d45268e39dadc1fbb6d397cf97d0488f8e0d7d516cc04c3b678af9cbe1deb761e19f8dd616ba90dbff0009be8a746d365c731de59b497261f612c25a4fac46be874fbcbf377aefa5ac55ce0a8ad36711fb49f8962f08fc01f88be21979169e18d4027fbf242513f590578a7c2cd35fe1ff0085742f86f33cbf67d0f4fb7b38bcff009a58c18832c59ee234ce49e725077af44fdaee67b9f8443c308caa3c57e27d034024f3fbbb8d421f300ff8029ae6bc52b35c78a7cc89001772960413d9b3cfa72233f487dea310f634c3adce858f66edc534f038a8eddf7dbc52aabed29c6eeb8f53f5ebf8d49d89e82b98e911be61b7d78aa5f0c747b7d1f57f886d0a856d5fc531eb040eb99f4ab1c93f578e4e7d8d5e2dcd51f0c5e241f12359d2c3aefbdf0f69fa83ae3a18aeae20ddf8a328ff0080d0655363b93cd14507a549886ef63484f34138e9d29b4ec48a4e6928a290828cf19a29b4d0d2b8139a463fdea09c53699518a0ce68a5fe1a4c7bd40073da8a72f4a298ac357872bda94f4a28a402528eb4514148169f92475a28a042fa51f5a28a09153b93de81c007bd1450360b4e1cf5a28a68107f162be7bf125d5c0fdb9748b5594889fe135e9651d0e350523f5a28ad21d471dd1ec0401d28ef8ed451527401e3a5737e2fd28e972e97f106c351bb8afc6a165a13c04a3db496934e448363292acd804b23293b467238a28a101e2be2ff00186a5e11f8ff00e2fbed36ded65962d43c14c9e7a3300621305380c3248b89339f6c6315f7eb00a481dba51456d854954a9ebffb6a39aa6e23b98d1a55c65159803d320715f11fc10bbb8bcf04cb3dcc85de4bc935024ff7ef5dee655ff7048edb47604f27ad1455e23e143a1f11d6899e2f13fd890feeaf34f92edc1e71242f1c608ff795c86cf5c2f4c56b15c18d7270cc01fc50b7f403e9d734515c676880e719a73704e3f87a51450418bae468a1eeb197655b739e863024936fe2d1ae7e9596b2bdb00c31218720799ceed964d764b7a969886627aed51c01451412739e3d56f0ee95adfc44d1246b4d7b40b2212e5307ed90c71dbbf9174a72b346cd3b93b86e071b197bfa56917726a3a3695aa48ab1c9a8595b5d3a267623489b885072700f4c9271dcd145005a551b777391d29a4e68a280024af4acbf13e9f6dab786f54d2ef537c17963731b81d46232432fa302a0e7da8a28020f0aea977ac785342d5ef5835cea1a4585e4cc3201965b747738fab1c7a56adc3985d8280708cc09f63edf4a28a458e3d28c0cd14532843c1e283c7028a2800e477a4c0f4a28a00a5a8470c3a8681ad0855af345f106937767236731c92dda5a487aff0014175321ff007abe9b91423e57b3e3f2240fe54515d787d99cb89f891e33fb567cda0fc3fcff000fc4ef0d95f6ff00486a6c9047731959578073c71c9ce4d1453adba0a3b31f811e5538081540f414d24e7ad145731ba05ac0d0bfe4bacc3fbde055cfe1ab1c7f334514115363d2f38a6924f53451507320c9f5a4c9e79a28a00297271451548437be3b527414514c7119cfad009e79a28a8280938eb4a401da8a29a121a0e68a28aa11ffd9, 'pp (9).jpg', 'image/jpeg', '41049', '200', '200');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_reportto`
--

CREATE TABLE `hs_hr_emp_reportto` (
  `erep_sup_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_sub_emp_number` int(7) NOT NULL DEFAULT '0',
  `erep_reporting_mode` int(7) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_reportto`
--

INSERT INTO `hs_hr_emp_reportto` (`erep_sup_emp_number`, `erep_sub_emp_number`, `erep_reporting_mode`) VALUES
(2, 1, 1),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_skill`
--

CREATE TABLE `hs_hr_emp_skill` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL,
  `years_of_exp` decimal(2,0) DEFAULT NULL,
  `comments` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_us_tax`
--

CREATE TABLE `hs_hr_emp_us_tax` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `tax_federal_status` varchar(13) DEFAULT NULL,
  `tax_federal_exceptions` int(2) DEFAULT '0',
  `tax_state` varchar(13) DEFAULT NULL,
  `tax_state_status` varchar(13) DEFAULT NULL,
  `tax_state_exceptions` int(2) DEFAULT '0',
  `tax_unemp_state` varchar(13) DEFAULT NULL,
  `tax_work_state` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_emp_work_experience`
--

CREATE TABLE `hs_hr_emp_work_experience` (
  `emp_number` int(7) NOT NULL DEFAULT '0',
  `eexp_seqno` decimal(10,0) NOT NULL DEFAULT '0',
  `eexp_employer` varchar(100) DEFAULT NULL,
  `eexp_jobtit` varchar(120) DEFAULT NULL,
  `eexp_from_date` datetime DEFAULT NULL,
  `eexp_to_date` datetime DEFAULT NULL,
  `eexp_comments` varchar(200) DEFAULT NULL,
  `eexp_internal` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_emp_work_experience`
--

INSERT INTO `hs_hr_emp_work_experience` (`emp_number`, `eexp_seqno`, `eexp_employer`, `eexp_jobtit`, `eexp_from_date`, `eexp_to_date`, `eexp_comments`, `eexp_internal`) VALUES
(2, '1', 'iNFONALIGY Inc', 'Systems Developer', '2010-09-01 00:00:00', '2016-02-29 00:00:00', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_jobtit_empstat`
--

CREATE TABLE `hs_hr_jobtit_empstat` (
  `jobtit_code` int(7) NOT NULL,
  `estat_code` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_mailnotifications`
--

CREATE TABLE `hs_hr_mailnotifications` (
  `user_id` int(20) NOT NULL,
  `notification_type_id` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_module`
--

CREATE TABLE `hs_hr_module` (
  `mod_id` varchar(36) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `owner_email` varchar(100) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_module`
--

INSERT INTO `hs_hr_module` (`mod_id`, `name`, `owner`, `owner_email`, `version`, `description`) VALUES
('MOD001', 'Admin', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Admin'),
('MOD002', 'PIM', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'HR Functions'),
('MOD004', 'Report', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Reporting'),
('MOD005', 'Leave', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Leave Tracking'),
('MOD006', 'Time', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Time Tracking'),
('MOD007', 'Benefits', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Benefits Tracking'),
('MOD008', 'Recruitment', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Recruitment'),
('MOD009', 'Performance', 'OrangeHRM', 'info@orangehrm.com', 'VER001', 'Performance');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_payperiod`
--

CREATE TABLE `hs_hr_payperiod` (
  `payperiod_code` varchar(13) NOT NULL DEFAULT '',
  `payperiod_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_payperiod`
--

INSERT INTO `hs_hr_payperiod` (`payperiod_code`, `payperiod_name`) VALUES
('1', 'Weekly'),
('2', 'Bi Weekly'),
('3', 'Semi Monthly'),
('4', 'Monthly'),
('5', 'Monthly on first pay of month.'),
('6', 'Hourly');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_pay_period`
--

CREATE TABLE `hs_hr_pay_period` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `close_date` date NOT NULL,
  `check_date` date NOT NULL,
  `timesheet_aproval_due_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_province`
--

CREATE TABLE `hs_hr_province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(40) NOT NULL DEFAULT '',
  `province_code` char(2) NOT NULL DEFAULT '',
  `cou_code` char(2) NOT NULL DEFAULT 'us'
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_province`
--

INSERT INTO `hs_hr_province` (`id`, `province_name`, `province_code`, `cou_code`) VALUES
(1, 'Alaska', 'AK', 'US'),
(2, 'Alabama', 'AL', 'US'),
(3, 'American Samoa', 'AS', 'US'),
(4, 'Arizona', 'AZ', 'US'),
(5, 'Arkansas', 'AR', 'US'),
(6, 'California', 'CA', 'US'),
(7, 'Colorado', 'CO', 'US'),
(8, 'Connecticut', 'CT', 'US'),
(9, 'Delaware', 'DE', 'US'),
(10, 'District of Columbia', 'DC', 'US'),
(11, 'Federated States of Micronesia', 'FM', 'US'),
(12, 'Florida', 'FL', 'US'),
(13, 'Georgia', 'GA', 'US'),
(14, 'Guam', 'GU', 'US'),
(15, 'Hawaii', 'HI', 'US'),
(16, 'Idaho', 'ID', 'US'),
(17, 'Illinois', 'IL', 'US'),
(18, 'Indiana', 'IN', 'US'),
(19, 'Iowa', 'IA', 'US'),
(20, 'Kansas', 'KS', 'US'),
(21, 'Kentucky', 'KY', 'US'),
(22, 'Louisiana', 'LA', 'US'),
(23, 'Maine', 'ME', 'US'),
(24, 'Marshall Islands', 'MH', 'US'),
(25, 'Maryland', 'MD', 'US'),
(26, 'Massachusetts', 'MA', 'US'),
(27, 'Michigan', 'MI', 'US'),
(28, 'Minnesota', 'MN', 'US'),
(29, 'Mississippi', 'MS', 'US'),
(30, 'Missouri', 'MO', 'US'),
(31, 'Montana', 'MT', 'US'),
(32, 'Nebraska', 'NE', 'US'),
(33, 'Nevada', 'NV', 'US'),
(34, 'New Hampshire', 'NH', 'US'),
(35, 'New Jersey', 'NJ', 'US'),
(36, 'New Mexico', 'NM', 'US'),
(37, 'New York', 'NY', 'US'),
(38, 'North Carolina', 'NC', 'US'),
(39, 'North Dakota', 'ND', 'US'),
(40, 'Northern Mariana Islands', 'MP', 'US'),
(41, 'Ohio', 'OH', 'US'),
(42, 'Oklahoma', 'OK', 'US'),
(43, 'Oregon', 'OR', 'US'),
(44, 'Palau', 'PW', 'US'),
(45, 'Pennsylvania', 'PA', 'US'),
(46, 'Puerto Rico', 'PR', 'US'),
(47, 'Rhode Island', 'RI', 'US'),
(48, 'South Carolina', 'SC', 'US'),
(49, 'South Dakota', 'SD', 'US'),
(50, 'Tennessee', 'TN', 'US'),
(51, 'Texas', 'TX', 'US'),
(52, 'Utah', 'UT', 'US'),
(53, 'Vermont', 'VT', 'US'),
(54, 'Virgin Islands', 'VI', 'US'),
(55, 'Virginia', 'VA', 'US'),
(56, 'Washington', 'WA', 'US'),
(57, 'West Virginia', 'WV', 'US'),
(58, 'Wisconsin', 'WI', 'US'),
(59, 'Wyoming', 'WY', 'US'),
(60, 'Armed Forces Africa', 'AE', 'US'),
(61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
(62, 'Armed Forces Canada', 'AE', 'US'),
(63, 'Armed Forces Europe', 'AE', 'US'),
(64, 'Armed Forces Middle East', 'AE', 'US'),
(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `hs_hr_unique_id`
--

CREATE TABLE `hs_hr_unique_id` (
  `id` int(11) NOT NULL,
  `last_id` int(10) unsigned NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `field_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hs_hr_unique_id`
--

INSERT INTO `hs_hr_unique_id` (`id`, `last_id`, `table_name`, `field_name`) VALUES
(1, 5, 'hs_hr_employee', 'emp_number'),
(2, 9, 'hs_hr_module', 'mod_id'),
(3, 0, 'hs_hr_leave', 'leave_id'),
(4, 0, 'hs_hr_leavetype', 'leave_type_id'),
(5, 0, 'hs_hr_leave_requests', 'leave_request_id'),
(6, 0, 'hs_hr_custom_export', 'export_id'),
(7, 0, 'hs_hr_custom_import', 'import_id'),
(8, 0, 'hs_hr_pay_period', 'id'),
(9, 0, 'hs_hr_kpi', 'id'),
(10, 0, 'hs_hr_performance_review', 'id'),
(11, 2, 'ohrm_emp_reporting_method', 'reporting_method_id'),
(12, 1, 'ohrm_timesheet', 'timesheet_id'),
(13, 0, 'ohrm_timesheet_action_log', 'timesheet_action_log_id'),
(14, 0, 'ohrm_timesheet_item', 'timesheet_item_id'),
(15, 0, 'ohrm_attendance_record', 'id'),
(16, 1, 'ohrm_job_vacancy', 'id'),
(17, 1, 'ohrm_job_candidate', 'id'),
(18, 106, 'ohrm_workflow_state_machine', 'id'),
(19, 0, 'ohrm_job_candidate_attachment', 'id'),
(20, 0, 'ohrm_job_vacancy_attachment', 'id'),
(21, 1, 'ohrm_job_candidate_vacancy', 'id'),
(22, 2, 'ohrm_job_candidate_history', 'id'),
(23, 0, 'ohrm_job_interview', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_advanced_report`
--

CREATE TABLE `ohrm_advanced_report` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_advanced_report`
--

INSERT INTO `ohrm_advanced_report` (`id`, `name`, `definition`) VALUES
(1, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="empNumber" label="Employee Number"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM ohrm_leave_type WHERE (deleted = 0) OR (SELECT count(l.id) FROM ohrm_leave l WHERE l.status = 3 AND l.leave_type_id = ohrm_leave_type.id) > 0 ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="leavetype" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="false">\n                    <field_name>ohrm_leave_type.exclude_in_reports_if_no_entitlement</field_name>\n                    <field_alias>exclude_if_no_entitlement</field_alias>\n                    <display_name>Exclude</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="false">\n                    <field_name>ohrm_leave_type.deleted</field_name>\n                    <field_alias>leave_type_deleted</field_alias>\n                    <display_name>Leave Type Deleted</display_name>\n                    <width>1</width>	\n                </field>  \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>leaveType</field_alias>\n                    <display_name>Leave Type</display_name>\n                    <width>160</width>	\n                </field>s                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.leave_type_id as leave_type_id,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.emp_number,empNumber} AND \n    $X{IN,ohrm_leave_entitlement.leave_type_id,leaveTypeId} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.leave_type_id\nORDER BY A.leave_type_id\n\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 1 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave_type LEFT JOIN \nohrm_leave ON ohrm_leave_type.id = ohrm_leave.leave_type_id AND\n$X{=,ohrm_leave.emp_number,empNumber} AND\nohrm_leave.status = 2 AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nWHERE\nohrm_leave_type.deleted = 0 AND\n$X{IN,ohrm_leave_type.id,leaveTypeId}\n\nGROUP BY ohrm_leave_type.id\nORDER BY ohrm_leave_type.id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave_type.id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,emp_number,empNumber} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.leave_type_id,leaveTypeId} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY leave_type_id\nORDER BY ohrm_leave.leave_type_id\n</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.leave_type_id</field_name>\n                        <field_alias>leaveTypeId</field_alias>\n                        <display_name>Leave Type ID</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n    </sub_report>\n\n<sub_report type="sql" name="unused">       \n    <query>FROM ohrm_leave_type WHERE deleted = 0 AND $X{IN,ohrm_leave_type.id,leaveTypeId} ORDER BY ohrm_leave_type.id</query>\n    <id_field>leaveTypeId</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>ohrm_leave_type.id</field_name>\n                    <field_alias>leaveTypeId</field_alias>\n                    <display_name>Leave Type ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>ohrm_leave_type.name</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>160</width>	\n                    <align>right</align>\n                </field>                                                                                                     \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n\n    <join>             \n        <join_by sub_report="mainTable" id="leaveTypeId"></join_by>              \n        <join_by sub_report="entitlementsTotal" id="leaveTypeId"></join_by> \n        <join_by sub_report="pendingQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="scheduledQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="takenQuery" id="leaveTypeId"></join_by>  \n        <join_by sub_report="unused" id="leaveTypeId"></join_by>  \n\n    </join>\n    <page_limit>100</page_limit>        \n</report>'),
(2, 'Leave Entitlements and Usage Report', '\n<report>\n    <settings>\n        <csv>\n            <include_group_header>1</include_group_header>\n            <include_header>1</include_header>\n        </csv>\n    </settings>\n<filter_fields>\n	<input_field type="text" name="leaveType" label="Leave Type"></input_field>\n	<input_field type="text" name="fromDate" label="From"></input_field>\n        <input_field type="text" name="toDate" label="To"></input_field>\n        <input_field type="text" name="asOfDate" label="AsOf"></input_field>\n        <input_field type="text" name="emp_numbers" label="employees"></input_field>\n        <input_field type="text" name="job_title" label="Job Title"></input_field>\n        <input_field type="text" name="location" label="Location"></input_field>\n        <input_field type="text" name="sub_unit" label="Sub Unit"></input_field>\n        <input_field type="text" name="terminated" label="Terminated"></input_field>\n</filter_fields> \n\n<sub_report type="sql" name="mainTable">       \n    <query>FROM hs_hr_employee \n    LEFT JOIN hs_hr_emp_locations ON hs_hr_employee.emp_number = hs_hr_emp_locations.emp_number\n    WHERE $X{IN,hs_hr_employee.emp_number,emp_numbers} \n    AND $X{=,hs_hr_employee.job_title_code,job_title}\n    AND $X{IN,hs_hr_employee.work_station,sub_unit}\n    AND $X{IN,hs_hr_emp_locations.location_id,location}\n    AND $X{IS NULL,hs_hr_employee.termination_id,terminated}\n    ORDER BY hs_hr_employee.emp_lastname</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="personalDetails" type="one" display="true">\n            <group_header></group_header>\n            <fields>\n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="false">\n                    <field_name>hs_hr_employee.termination_id</field_name>\n                    <field_alias>termination_id</field_alias>\n                    <display_name>Termination ID</display_name>\n                    <width>1</width>	\n                </field>   \n                <field display="true">\n                    <field_name>CONCAT(hs_hr_employee.emp_firstname, '' '', hs_hr_employee.emp_lastname)</field_name>\n                    <field_alias>employeeName</field_alias>\n                    <display_name>Employee</display_name>\n                    <width>150</width>\n                </field>                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n\n<sub_report type="sql" name="entitlementsTotal">\n                    <query>\n\nFROM (\nSELECT ohrm_leave_entitlement.id as id, \n       ohrm_leave_entitlement.emp_number as emp_number,\n       ohrm_leave_entitlement.no_of_days as no_of_days,\n       sum(IF(ohrm_leave.status = 2, ohrm_leave_leave_entitlement.length_days, 0)) AS scheduled,\n       sum(IF(ohrm_leave.status = 3, ohrm_leave_leave_entitlement.length_days, 0)) AS taken\n       \nFROM ohrm_leave_entitlement LEFT JOIN ohrm_leave_leave_entitlement ON\n    ohrm_leave_entitlement.id = ohrm_leave_leave_entitlement.entitlement_id\n    LEFT JOIN ohrm_leave ON ohrm_leave.id = ohrm_leave_leave_entitlement.leave_id AND \n    ( $X{&gt;,ohrm_leave.date,toDate} OR $X{&lt;,ohrm_leave.date,fromDate} )\n\nWHERE ohrm_leave_entitlement.deleted=0 AND $X{=,ohrm_leave_entitlement.leave_type_id,leaveType}\n    AND $X{IN,ohrm_leave_entitlement.emp_number,empNumber} AND\n    (\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,fromDate} ) OR\n      ( $X{&lt;=,ohrm_leave_entitlement.from_date,toDate} AND $X{&gt;=,ohrm_leave_entitlement.to_date,toDate} ) OR \n      ( $X{&gt;=,ohrm_leave_entitlement.from_date,fromDate} AND $X{&lt;=,ohrm_leave_entitlement.to_date,toDate} ) \n    )\n    \nGROUP BY ohrm_leave_entitlement.id\n) AS A\n\nGROUP BY A.emp_number\nORDER BY A.emp_number\n\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g2" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>A.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(A.no_of_days) - sum(A.scheduled) - sum(A.taken)</field_name>\n                        <field_alias>entitlement_total</field_alias>\n                        <display_name>Leave Entitlements (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveEntitlements?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="pendingQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 1 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g6" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>pending</field_alias>\n                        <display_name>Leave Pending Approval (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=1&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n\n<sub_report type="sql" name="scheduledQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 2 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g5" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>scheduled</field_alias>\n                        <display_name>Leave Scheduled (Days)</display_name>\n                        <width>121</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=2&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n\n<sub_report type="sql" name="takenQuery">\n<query>\nFROM ohrm_leave WHERE $X{=,ohrm_leave.leave_type_id,leaveType} AND\nstatus = 3 AND\n$X{IN,ohrm_leave.emp_number,empNumber} AND\n$X{&gt;=,ohrm_leave.date,fromDate} AND $X{&lt;=,ohrm_leave.date,toDate}\nGROUP BY emp_number\nORDER BY ohrm_leave.emp_number\n</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n            <display_group name="g4" type="one" display="true">\n                <group_header></group_header>\n                <fields>\n                    <field display="false">\n                        <field_name>ohrm_leave.emp_number</field_name>\n                        <field_alias>empNumber</field_alias>\n                        <display_name>Emp Number</display_name>\n                        <width>1</width>\n                    </field>                                \n                    <field display="true">\n                        <field_name>sum(length_days)</field_name>\n                        <field_alias>taken</field_alias>\n                        <display_name>Leave Taken (Days)</display_name>\n                        <width>120</width>\n                        <align>right</align>\n                        <link>leave/viewLeaveList?empNumber=$P{empNumber}&amp;fromDate=$P{fromDate}&amp;toDate=$P{toDate}&amp;leaveTypeId=$P{leaveTypeId}&amp;status=3&amp;stddate=1</link>\n                    </field>                                \n                </fields>\n            </display_group>\n    </display_groups>\n</sub_report>\n<sub_report type="sql" name="unused">       \n    <query>FROM hs_hr_employee WHERE $X{IN,hs_hr_employee.emp_number,empNumber} ORDER BY hs_hr_employee.emp_number</query>\n    <id_field>empNumber</id_field>\n    <display_groups>\n        <display_group name="unused" type="one" display="true">\n            <group_header></group_header>\n            <fields>    \n                <field display="false">\n                    <field_name>hs_hr_employee.emp_number</field_name>\n                    <field_alias>empNumber</field_alias>\n                    <display_name>Employee Number</display_name>\n                    <width>1</width>	\n                </field>                \n                <field display="true">\n                    <field_name>hs_hr_employee.emp_firstname</field_name>\n                    <field_alias>unused</field_alias>\n                    <display_name>Leave Balance (Days)</display_name>\n                    <width>150</width>\n                    <align>right</align>\n                </field> \n                                                                                               \n            </fields>\n        </display_group>\n    </display_groups> \n</sub_report>\n    <join>             \n        <join_by sub_report="mainTable" id="empNumber"></join_by>            \n        <join_by sub_report="entitlementsTotal" id="empNumber"></join_by> \n        <join_by sub_report="pendingQuery" id="empNumber"></join_by>\n        <join_by sub_report="scheduledQuery" id="empNumber"></join_by>\n        <join_by sub_report="takenQuery" id="empNumber"></join_by> \n        <join_by sub_report="unused" id="empNumber"></join_by>  \n    </join>\n    <page_limit>20</page_limit>       \n</report>');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_attendance_record`
--

CREATE TABLE `ohrm_attendance_record` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `punch_in_utc_time` datetime DEFAULT NULL,
  `punch_in_note` varchar(255) DEFAULT NULL,
  `punch_in_time_offset` varchar(255) DEFAULT NULL,
  `punch_in_user_time` datetime DEFAULT NULL,
  `punch_out_utc_time` datetime DEFAULT NULL,
  `punch_out_note` varchar(255) DEFAULT NULL,
  `punch_out_time_offset` varchar(255) DEFAULT NULL,
  `punch_out_user_time` datetime DEFAULT NULL,
  `state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_auth_provider_extra_details`
--

CREATE TABLE `ohrm_auth_provider_extra_details` (
  `id` int(11) NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider_type` int(11) DEFAULT NULL,
  `client_id` text,
  `client_secret` text,
  `developer_key` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_available_group_field`
--

CREATE TABLE `ohrm_available_group_field` (
  `report_group_id` bigint(20) NOT NULL,
  `group_field_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_beacon_notification`
--

CREATE TABLE `ohrm_beacon_notification` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_composite_display_field`
--

CREATE TABLE `ohrm_composite_display_field` (
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_composite_display_field`
--

INSERT INTO `ohrm_composite_display_field` (`composite_display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'IF(hs_hr_employee.termination_id IS NULL, CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname), CONCAT(hs_hr_employee.emp_firstname, " " ,hs_hr_employee.emp_lastname, " (Past Employee)"))', 'Employee Name', 'employeeName', 'false', NULL, NULL, 'label', '<xml><getter>employeeName</getter></xml>', '300', '0', NULL, 0, NULL, 'Deleted Employee', 0, 0),
(2, 1, 'CONCAT(ohrm_customer.name, " - " ,ohrm_project.name)', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '300', '0', NULL, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_customer`
--

CREATE TABLE `ohrm_customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint`
--

CREATE TABLE `ohrm_datapoint` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `datapoint_type_id` int(11) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_datapoint_type`
--

CREATE TABLE `ohrm_datapoint_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `action_class` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_datapoint_type`
--

INSERT INTO `ohrm_datapoint_type` (`id`, `name`, `action_class`) VALUES
(1, 'config', 'configDatapointProcessor'),
(2, 'count', 'countDatapointProcessor'),
(3, 'session', 'sessionDatapointProcessor'),
(4, 'organization', 'OrganizationDataProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group`
--

CREATE TABLE `ohrm_data_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group`
--

INSERT INTO `ohrm_data_group` (`id`, `name`, `description`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 'personal_information', 'PIM - Personal Details', 1, NULL, 1, NULL),
(2, 'personal_attachment', 'PIM - Personal Details - Attachments', 1, 1, 1, 1),
(3, 'personal_custom_fields', 'PIM - Personal Details - Custom Fields', 1, NULL, 1, NULL),
(4, 'contact_details', 'PIM - Contact Details', 1, NULL, 1, NULL),
(5, 'contact_attachment', 'PIM - Contact Details - Attachments', 1, 1, 1, 1),
(6, 'contact_custom_fields', 'PIM - Contact Details - Custom Fields', 1, NULL, 1, NULL),
(7, 'emergency_contacts', 'PIM - Emergency Contacts', 1, 1, 1, 1),
(8, 'emergency_attachment', 'PIM - Emergency Contacts - Attachments', 1, 1, 1, 1),
(9, 'emergency_custom_fields', 'PIM - Emergency Contacts - Custom Fields', 1, NULL, 1, NULL),
(10, 'dependents', 'PIM - Dependents', 1, 1, 1, 1),
(11, 'dependents_attachment', 'PIM - Dependents - Attachments', 1, 1, 1, 1),
(12, 'dependents_custom_fields', 'PIM - Dependents - Custom Fields', 1, NULL, 1, NULL),
(13, 'immigration', 'PIM - Immigration', 1, 1, 1, 1),
(14, 'immigration_attachment', 'PIM - Immigration - Attachments', 1, 1, 1, 1),
(15, 'immigration_custom_fields', 'PIM - Immigration - Custom Fields', 1, NULL, 1, NULL),
(16, 'job_details', 'PIM - Job', 1, NULL, 1, NULL),
(17, 'job_attachment', 'PIM - Job - Attachments', 1, 1, 1, 1),
(18, 'job_custom_fields', 'PIM - Job - Custom Fields', 1, NULL, 1, NULL),
(19, 'salary_details', 'PIM - Salary', 1, 1, 1, 1),
(20, 'salary_attachment', 'PIM - Salary - Attachments', 1, 1, 1, 1),
(21, 'salary_custom_fields', 'PIM - Salary - Custom Fields', 1, NULL, 1, NULL),
(22, 'tax_exemptions', 'PIM - Tax Exemptions', 1, NULL, 1, NULL),
(23, 'tax_attachment', 'PIM - Tax Exemptions - Attachments', 1, 1, 1, 1),
(24, 'tax_custom_fields', 'PIM - Tax Exemptions - Custom Fields', 1, NULL, 1, NULL),
(25, 'supervisor', 'PIM - Employee Supervisors', 1, 1, 1, 1),
(26, 'subordinates', 'PIM - Employee Subordinates', 1, 1, 1, 1),
(27, 'report-to_attachment', 'PIM - Employee Supervisors/Subordinates - Attachment', 1, 1, 1, 1),
(28, 'report-to_custom_fields', 'PIM - Employee Supervisors/Subordinates - Custom Fields', 1, NULL, 1, NULL),
(29, 'qualification_work', 'PIM - Qualifications - Work Experience', 1, 1, 1, 1),
(30, 'qualification_education', 'PIM - Qualifications - Education', 1, 1, 1, 1),
(31, 'qualification_skills', 'PIM - Qualifications - Skills', 1, 1, 1, 1),
(32, 'qualification_languages', 'PIM - Qualifications - Languages', 1, 1, 1, 1),
(33, 'qualification_license', 'PIM - Qualifications - License', 1, 1, 1, 1),
(34, 'qualifications_attachment', 'PIM - Qualifications - Attachments', 1, 1, 1, 1),
(35, 'qualifications_custom_fields', 'PIM - Qualifications - Custom Fields', 1, NULL, 1, NULL),
(36, 'membership', 'PIM - Membership', 1, 1, 1, 1),
(37, 'membership_attachment', 'PIM - Membership - Attachments', 1, 1, 1, 1),
(38, 'membership_custom_fields', 'PIM - Membership - Custom Fields', 1, NULL, 1, NULL),
(39, 'photograph', 'PIM - Employee Photograph', 1, NULL, 1, 1),
(40, 'leave_entitlements', 'Leave - Leave Entitlements', 1, 1, 1, 1),
(41, 'leave_entitlements_usage_report', 'Leave - Leave Entitlements and Usage Report', 1, NULL, NULL, NULL),
(42, 'job_titles', 'Admin - Job Titles', 1, 1, 1, 1),
(43, 'pay_grades', 'Admin - Pay Grades', 1, 1, 1, 1),
(44, 'time_customers', 'Time - Project Info - Customers', 1, 1, 1, 1),
(45, 'time_projects', 'Time - Project Info - Projects', 1, 1, 1, 1),
(46, 'pim_reports', 'PIM - Reports', 1, 1, 1, 1),
(47, 'attendance_configuration', 'Time - Attendance Configuration', 1, 0, 1, 0),
(48, 'attendance_records', 'Time - Attendance Records', 1, 0, 0, 0),
(49, 'time_project_reports', 'Time - Project Reports', 1, 0, 0, 0),
(50, 'time_employee_reports', 'Time - Employee Reports', 1, 0, 0, 0),
(51, 'attendance_summary', 'Time - Attendance Summary', 1, 0, 0, 0),
(52, 'leave_period', 'Leave - Leave Period', 1, 0, 1, 0),
(53, 'leave_types', 'Leave - Leave Types', 1, 1, 1, 1),
(54, 'work_week', 'Leave - Work Week', 1, 0, 1, 0),
(55, 'holidays', 'Leave - Holidays', 1, 1, 1, 1),
(56, 'recruitment_vacancies', 'Recruitment - Vacancies', 1, 1, 1, 1),
(57, 'recruitment_candidates', 'Recruitment - Candidates', 1, 1, 1, 1),
(58, 'time_employee_timesheets', 'Time - Employee Timesheets', 1, 0, 0, 0),
(59, 'leave_list', 'Leave - Leave List', 1, 0, 0, 0),
(60, 'leave_list_comments', 'Leave - Leave List - Comments', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_data_group_screen`
--

CREATE TABLE `ohrm_data_group_screen` (
  `id` int(11) NOT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_data_group_screen`
--

INSERT INTO `ohrm_data_group_screen` (`id`, `data_group_id`, `screen_id`, `permission`) VALUES
(1, 40, 69, 1),
(2, 40, 72, 2),
(3, 40, 73, 3),
(4, 40, 71, 4),
(5, 41, 78, 1),
(6, 42, 23, 1),
(7, 42, 80, 1),
(8, 42, 80, 2),
(9, 42, 80, 3),
(10, 42, 81, 4),
(11, 43, 24, 1),
(12, 43, 82, 1),
(13, 43, 82, 2),
(14, 43, 82, 3),
(15, 43, 83, 4),
(16, 43, 84, 3),
(17, 43, 85, 3),
(18, 42, 74, 1),
(19, 43, 74, 1),
(20, 44, 36, 1),
(21, 44, 86, 2),
(22, 44, 86, 3),
(23, 44, 87, 4),
(24, 45, 37, 1),
(25, 45, 88, 1),
(26, 45, 88, 2),
(27, 45, 88, 3),
(28, 45, 89, 4),
(29, 45, 90, 2),
(30, 45, 90, 3),
(31, 45, 91, 2),
(32, 45, 91, 3),
(33, 46, 45, 1),
(34, 46, 45, 4),
(35, 46, 92, 2),
(36, 46, 92, 3),
(37, 46, 93, 1),
(38, 47, 56, 1),
(39, 47, 56, 3),
(40, 48, 55, 1),
(41, 49, 57, 1),
(42, 49, 102, 1),
(43, 50, 58, 1),
(44, 51, 59, 1),
(45, 51, 101, 1),
(46, 52, 47, 1),
(47, 52, 47, 3),
(48, 53, 7, 1),
(49, 53, 8, 1),
(50, 53, 8, 2),
(51, 53, 8, 3),
(52, 53, 9, 2),
(53, 53, 10, 4),
(54, 54, 14, 1),
(55, 54, 14, 3),
(56, 55, 11, 1),
(57, 55, 12, 2),
(58, 55, 12, 3),
(59, 55, 13, 4),
(60, 56, 61, 1),
(61, 56, 94, 1),
(62, 56, 94, 2),
(63, 56, 94, 3),
(64, 56, 95, 4),
(65, 57, 60, 1),
(66, 57, 96, 1),
(67, 57, 96, 2),
(68, 57, 96, 3),
(69, 57, 97, 4),
(70, 56, 76, 1),
(71, 57, 76, 1),
(72, 58, 52, 1),
(73, 59, 16, 1),
(74, 59, 98, 1),
(75, 59, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field`
--

CREATE TABLE `ohrm_display_field` (
  `display_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `is_meta` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field`
--

INSERT INTO `ohrm_display_field` (`display_field_id`, `report_group_id`, `name`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`, `is_encrypted`, `is_meta`) VALUES
(1, 1, 'ohrm_project.name', 'Project Name', 'projectname', 'false', NULL, NULL, 'label', '<xml><getter>projectname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(2, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'link', '<xml><labelGetter>activityname</labelGetter><placeholderGetters><id>activity_id</id><total>totalduration</total><projectId>projectId</projectId><from>fromDate</from><to>toDate</to><approved>onlyIncludeApprovedTimesheets</approved></placeholderGetters><urlPattern>../../displayProjectActivityDetailsReport?reportId=3#activityId={id}#total={total}#from={from}#to={to}#projectId={projectId}#onlyIncludeApprovedTimesheets={approved}</urlPattern></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(3, 1, 'ohrm_project_activity.project_id', 'Project Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>project_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(4, 1, 'ohrm_project_activity.activity_id', 'Activity Id', NULL, 'false', NULL, NULL, 'label', '<xml><getter>activity_id</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 1),
(5, 1, 'ohrm_timesheet_item.duration', 'Time (hours)', NULL, 'false', NULL, NULL, 'label', '<xml><getter>duration</getter></xml>', '75', '0', 'right', 0, NULL, NULL, 0, 0),
(6, 1, 'hs_hr_employee.emp_firstname', 'Employee First Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_firstname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(7, 1, 'hs_hr_employee.emp_lastname', 'Employee Last Name', NULL, 'false', NULL, NULL, 'label', '<xml><getter>emp_lastname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(8, 1, 'ohrm_project_activity.name', 'Activity Name', 'activityname', 'false', NULL, NULL, 'label', '<xml><getter>activityname</getter></xml>', '200', '0', NULL, 0, NULL, NULL, 0, 0),
(9, 3, 'hs_hr_employee.employee_id', 'Employee Id', 'employeeId', 'false', NULL, NULL, 'label', '<xml><getter>employeeId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(10, 3, 'hs_hr_employee.emp_lastname', 'Employee Last Name', 'employeeLastname', 'false', NULL, NULL, 'label', '<xml><getter>employeeLastname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(11, 3, 'hs_hr_employee.emp_firstname', 'Employee First Name', 'employeeFirstname', 'false', NULL, NULL, 'label', '<xml><getter>employeeFirstname</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(12, 3, 'hs_hr_employee.emp_middle_name', 'Employee Middle Name', 'employeeMiddlename', 'false', NULL, NULL, 'label', '<xml><getter>employeeMiddlename</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(13, 3, 'hs_hr_employee.emp_birthday', 'Date of Birth', 'empBirthday', 'false', NULL, NULL, 'labelDate', '<xml><getter>empBirthday</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(14, 3, 'ohrm_nationality.name', 'Nationality', 'nationality', 'false', NULL, NULL, 'label', '<xml><getter>nationality</getter></xml>', '200', '0', NULL, 0, 1, '---', 0, 0),
(15, 3, 'CASE hs_hr_employee.emp_gender WHEN 1 THEN "Male" WHEN 2 THEN "Female" WHEN 3 THEN "Other" END', 'Gender', 'empGender', 'false', NULL, NULL, 'label', '<xml><getter>empGender</getter></xml>', '80', '0', NULL, 0, 1, '---', 0, 0),
(17, 3, 'hs_hr_employee.emp_marital_status', 'Marital Status', 'maritalStatus', 'false', NULL, NULL, 'label', '<xml><getter>maritalStatus</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(18, 3, 'hs_hr_employee.emp_dri_lice_num', 'Driver License Number', 'driversLicenseNumber', 'false', NULL, NULL, 'label', '<xml><getter>driversLicenseNumber</getter></xml>', '240', '0', NULL, 0, 1, '---', 0, 0),
(19, 3, 'hs_hr_employee.emp_dri_lice_exp_date', 'License Expiry Date', 'licenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>licenseExpiryDate</getter></xml>', '135', '0', NULL, 0, 1, '---', 0, 0),
(20, 3, 'CONCAT_WS(", ", NULLIF(hs_hr_employee.emp_street1, ""), NULLIF(hs_hr_employee.emp_street2, ""), NULLIF(hs_hr_employee.city_code, ""), NULLIF(hs_hr_employee.provin_code,""), NULLIF(hs_hr_employee.emp_zipcode,""), NULLIF(hs_hr_country.cou_name,""))', 'Address', 'address', 'false', NULL, NULL, 'label', '<xml><getter>address</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(21, 3, 'hs_hr_employee.emp_hm_telephone', 'Home Telephone', 'homeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>homeTelephone</getter></xml>', '130', '0', NULL, 0, 2, '---', 0, 0),
(22, 3, 'hs_hr_employee.emp_mobile', 'Mobile', 'mobile', 'false', NULL, NULL, 'label', '<xml><getter>mobile</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(23, 3, 'hs_hr_employee.emp_work_telephone', 'Work Telephone', 'workTelephone', 'false', NULL, NULL, 'label', '<xml><getter>workTelephone</getter></xml>', '100', '0', NULL, 0, 2, '---', 0, 0),
(24, 3, 'hs_hr_employee.emp_work_email', 'Work Email', 'workEmail', 'false', NULL, NULL, 'label', '<xml><getter>workEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(25, 3, 'hs_hr_employee.emp_oth_email', 'Other Email', 'otherEmail', 'false', NULL, NULL, 'label', '<xml><getter>otherEmail</getter></xml>', '200', '0', NULL, 0, 2, '---', 0, 0),
(26, 3, 'hs_hr_emp_emergency_contacts.eec_name', 'Name', 'ecname', 'false', NULL, NULL, 'label', '<xml><getter>ecname</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(27, 3, 'hs_hr_emp_emergency_contacts.eec_home_no', 'Home Telephone', 'ecHomeTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecHomeTelephone</getter></xml>', '130', '0', NULL, 1, 3, '---', 0, 0),
(28, 3, 'hs_hr_emp_emergency_contacts.eec_office_no', 'Work Telephone', 'ecWorkTelephone', 'false', NULL, NULL, 'label', '<xml><getter>ecWorkTelephone</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(29, 3, 'hs_hr_emp_emergency_contacts.eec_relationship', 'Relationship', 'ecRelationship', 'false', NULL, NULL, 'label', '<xml><getter>ecRelationship</getter></xml>', '200', '0', NULL, 1, 3, '---', 0, 0),
(30, 3, 'hs_hr_emp_emergency_contacts.eec_mobile_no', 'Mobile', 'ecMobile', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 0),
(31, 3, 'hs_hr_emp_dependents.ed_name', 'Name', 'dependentName', 'false', NULL, NULL, 'label', '<xml><getter>dependentName</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(32, 3, 'IF (hs_hr_emp_dependents.ed_relationship_type = ''other'', hs_hr_emp_dependents.ed_relationship, hs_hr_emp_dependents.ed_relationship_type)', 'Relationship', 'dependentRelationship', 'false', NULL, NULL, 'label', '<xml><getter>dependentRelationship</getter></xml>', '200', '0', NULL, 1, 4, '---', 0, 0),
(33, 3, 'hs_hr_emp_dependents.ed_date_of_birth', 'Date of Birth', 'dependentDateofBirth', 'false', NULL, NULL, 'labelDate', '<xml><getter>dependentDateofBirth</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 0),
(35, 3, 'ohrm_membership.name', 'Membership', 'name', 'false', NULL, NULL, 'label', '<xml><getter>name</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(36, 3, 'hs_hr_emp_member_detail.ememb_subscript_ownership', 'Subscription Paid By', 'subscriptionPaidBy', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionPaidBy</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(37, 3, 'hs_hr_emp_member_detail.ememb_subscript_amount', 'Subscription Amount', 'subscriptionAmount', 'false', NULL, NULL, 'label', '<xml><getter>subscriptionAmount</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(38, 3, 'hs_hr_emp_member_detail.ememb_subs_currency', 'Currency', 'membershipCurrency', 'false', NULL, NULL, 'label', '<xml><getter>membershipCurrency</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(39, 3, 'hs_hr_emp_member_detail.ememb_commence_date', 'Subscription Commence Date', 'subscriptionCommenceDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionCommenceDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(40, 3, 'hs_hr_emp_member_detail.ememb_renewal_date', 'Subscription Renewal Date', 'subscriptionRenewalDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>subscriptionRenewalDate</getter></xml>', '200', '0', NULL, 1, 15, '---', 0, 0),
(41, 3, 'hs_hr_emp_work_experience.eexp_employer', 'Company', 'expCompany', 'false', NULL, NULL, 'label', '<xml><getter>expCompany</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(42, 3, 'hs_hr_emp_work_experience.eexp_jobtit', 'Job Title', 'expJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>expJobTitle</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(43, 3, 'hs_hr_emp_work_experience.eexp_from_date', 'From', 'expFrom', 'false', NULL, NULL, 'labelDate', '<xml><getter>expFrom</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(44, 3, 'hs_hr_emp_work_experience.eexp_to_date', 'To', 'expTo', 'false', NULL, NULL, 'labelDate', '<xml><getter>expTo</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(45, 3, 'hs_hr_emp_work_experience.eexp_comments', 'Comment', 'expComment', 'false', NULL, NULL, 'label', '<xml><getter>expComment</getter></xml>', '200', '0', NULL, 1, 10, '---', 0, 0),
(47, 3, 'ohrm_education.name', 'Level', 'eduProgram', 'false', NULL, NULL, 'label', '<xml><getter>eduProgram</getter></xml>', '200', '0', NULL, 1, 11, '---', 0, 0),
(48, 3, 'ohrm_emp_education.year', 'Year', 'eduYear', 'false', NULL, NULL, 'label', '<xml><getter>eduYear</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 0),
(49, 3, 'ohrm_emp_education.score', 'Score', 'eduGPAOrScore', 'false', NULL, NULL, 'label', '<xml><getter>eduGPAOrScore</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(52, 3, 'ohrm_skill.name', 'Skill', 'skill', 'false', NULL, NULL, 'label', '<xml><getter>skill</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(53, 3, 'hs_hr_emp_skill.years_of_exp', 'Years of Experience', 'skillYearsOfExperience', 'false', NULL, NULL, 'label', '<xml><getter>skillYearsOfExperience</getter></xml>', '135', '0', NULL, 1, 12, '---', 0, 0),
(54, 3, 'hs_hr_emp_skill.comments', 'Comments', 'skillComments', 'false', NULL, NULL, 'label', '<xml><getter>skillComments</getter></xml>', '200', '0', NULL, 1, 12, '---', 0, 0),
(55, 3, 'ohrm_language.name', 'Language', 'langName', 'false', NULL, NULL, 'label', '<xml><getter>langName</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(57, 3, 'CASE hs_hr_emp_language.competency WHEN 1 THEN "Poor" WHEN 2 THEN "Basic" WHEN 3 THEN "Good" WHEN 4 THEN "Mother Tongue" END', 'Competency', 'langCompetency', 'false', NULL, NULL, 'label', '<xml><getter>langCompetency</getter></xml>', '130', '0', NULL, 1, 13, '---', 0, 0),
(58, 3, 'hs_hr_emp_language.comments', 'Comments', 'langComments', 'false', NULL, NULL, 'label', '<xml><getter>langComments</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(59, 3, 'ohrm_license.name', 'License Type', 'empLicenseType', 'false', NULL, NULL, 'label', '<xml><getter>empLicenseType</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(60, 3, 'ohrm_emp_license.license_issued_date', 'Issued Date', 'empLicenseIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseIssuedDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(61, 3, 'ohrm_emp_license.license_expiry_date', 'Expiry Date', 'empLicenseExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empLicenseExpiryDate</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 0),
(62, 3, 'supervisor.emp_firstname', 'First Name', 'supervisorFirstName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorFirstName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(63, 3, 'subordinate.emp_firstname', 'First Name', 'subordinateFirstName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateFirstName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(64, 3, 'supervisor.emp_lastname', 'Last Name', 'supervisorLastName', 'false', NULL, NULL, 'label', '<xml><getter>supervisorLastName</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(65, 3, 'ohrm_pay_grade.name', 'Pay Grade', 'salPayGrade', 'false', NULL, NULL, 'label', '<xml><getter>salPayGrade</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(66, 3, 'hs_hr_emp_basicsalary.salary_component', 'Salary Component', 'salSalaryComponent', 'false', NULL, NULL, 'label', '<xml><getter>salSalaryComponent</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(67, 3, 'hs_hr_emp_basicsalary.ebsal_basic_salary', 'Amount', 'salAmount', 'false', NULL, NULL, 'label', '<xml><getter>salAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 1, 0),
(68, 3, 'hs_hr_emp_basicsalary.comments', 'Comments', 'salComments', 'false', NULL, NULL, 'label', '<xml><getter>salComments</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(69, 3, 'hs_hr_payperiod.payperiod_name', 'Pay Frequency', 'salPayFrequency', 'false', NULL, NULL, 'label', '<xml><getter>salPayFrequency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(70, 3, 'hs_hr_currency_type.currency_name', 'Currency', 'salCurrency', 'false', NULL, NULL, 'label', '<xml><getter>salCurrency</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(71, 3, 'hs_hr_emp_directdebit.dd_account', 'Direct Deposit Account Number', 'ddAccountNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(72, 3, 'hs_hr_emp_directdebit.dd_account_type', 'Direct Deposit Account Type', 'ddAccountType', 'false', NULL, NULL, 'label', '<xml><getter>ddAccountType</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(73, 3, 'hs_hr_emp_directdebit.dd_routing_num', 'Direct Deposit Routing Number', 'ddRoutingNumber', 'false', NULL, NULL, 'label', '<xml><getter>ddRoutingNumber</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(74, 3, 'hs_hr_emp_directdebit.dd_amount', 'Direct Deposit Amount', 'ddAmount', 'false', NULL, NULL, 'label', '<xml><getter>ddAmount</getter></xml>', '200', '0', NULL, 1, 7, '---', 0, 0),
(75, 3, 'hs_hr_emp_contract_extend.econ_extend_start_date', 'Contract Start Date', 'empContStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContStartDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(76, 3, 'hs_hr_emp_contract_extend.econ_extend_end_date', 'Contract End Date', 'empContEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empContEndDate</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(77, 3, 'ohrm_job_title.job_title', 'Job Title', 'empJobTitle', 'false', NULL, NULL, 'label', '<xml><getter>empJobTitle</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(78, 3, 'ohrm_employment_status.name', 'Employment Status', 'empEmploymentStatus', 'false', NULL, NULL, 'label', '<xml><getter>empEmploymentStatus</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(80, 3, 'ohrm_job_category.name', 'Job Category', 'empJobCategory', 'false', NULL, NULL, 'label', '<xml><getter>empJobCategory</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(81, 3, 'hs_hr_employee.joined_date', 'Joined Date', 'empJoinedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empJoinedDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(82, 3, 'ohrm_subunit.name', 'Sub Unit', 'empSubUnit', 'false', NULL, NULL, 'label', '<xml><getter>empSubUnit</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(83, 3, 'ohrm_location.name', 'Location', 'empLocation', 'false', NULL, NULL, 'label', '<xml><getter>empLocation</getter></xml>', '200', '0', NULL, 1, 6, '---', 0, 0),
(84, 3, 'hs_hr_emp_passport.ep_passport_num', 'Number', 'empPassportNo', 'false', NULL, NULL, 'label', '<xml><getter>empPassportNo</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(85, 3, 'hs_hr_emp_passport.ep_passportissueddate', 'Issued Date', 'empPassportIssuedDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportIssuedDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(86, 3, 'hs_hr_emp_passport.ep_passportexpiredate', 'Expiry Date', 'empPassportExpiryDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportExpiryDate</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 0),
(87, 3, 'hs_hr_emp_passport.ep_i9_status', 'Eligibility Status', 'empPassportEligibleStatus', 'false', NULL, NULL, 'label', '<xml><getter>empPassportEligibleStatus</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(88, 3, 'hs_hr_emp_passport.cou_code', 'Issued By', 'empPassportIssuedBy', 'false', NULL, NULL, 'label', '<xml><getter>empPassportIssuedBy</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(89, 3, 'hs_hr_emp_passport.ep_i9_review_date', 'Eligibility Review Date', 'empPassportEligibleReviewDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>empPassportEligibleReviewDate</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(90, 3, 'hs_hr_emp_passport.ep_comments', 'Comments', 'empPassportComments', 'false', NULL, NULL, 'label', '<xml><getter>empPassportComments</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(91, 3, 'subordinate.emp_lastname', 'Last Name', 'subordinateLastName', 'false', NULL, NULL, 'label', '<xml><getter>subordinateLastName</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(92, 3, 'CASE hs_hr_emp_language.fluency WHEN 1 THEN "Writing" WHEN 2 THEN "Speaking" WHEN 3 THEN "Reading" END', 'Fluency', 'langFluency', 'false', NULL, NULL, 'label', '<xml><getter>langFluency</getter></xml>', '200', '0', NULL, 1, 13, '---', 0, 0),
(93, 3, 'supervisor_reporting_method.reporting_method_name', 'Reporting Method', 'supReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>supReportingMethod</getter></xml>', '200', '0', NULL, 1, 9, '---', 0, 0),
(94, 3, 'subordinate_reporting_method.reporting_method_name', 'Reporting Method', 'subReportingMethod', 'false', NULL, NULL, 'label', '<xml><getter>subReportingMethod</getter></xml>', '200', '0', NULL, 1, 8, '---', 0, 0),
(95, 3, 'CASE hs_hr_emp_passport.ep_passport_type_flg WHEN 1 THEN "Passport" WHEN 2 THEN "Visa" END', 'Document Type', 'documentType', 'false', NULL, NULL, 'label', '<xml><getter>documentType</getter></xml>', '200', '0', NULL, 1, 5, '---', 0, 0),
(97, 3, 'hs_hr_employee.emp_other_id', 'Other Id', 'otherId', 'false', NULL, NULL, 'label', '<xml><getter>otherId</getter></xml>', '100', '0', NULL, 0, 1, '---', 0, 0),
(98, 3, 'hs_hr_emp_emergency_contacts.eec_seqno', 'ecSeqNo', 'ecSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 3, '---', 0, 1),
(99, 3, 'hs_hr_emp_dependents.ed_seqno', 'SeqNo', 'edSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 4, '---', 0, 1),
(100, 3, 'hs_hr_emp_passport.ep_seqno', 'SeqNo', 'epSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 5, '---', 0, 1),
(101, 3, 'hs_hr_emp_basicsalary.id', 'salaryId', 'salaryId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 7, '---', 0, 1),
(102, 3, 'subordinate.emp_number', 'subordinateId', 'subordinateId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 8, '---', 0, 1),
(103, 3, 'supervisor.emp_number', 'supervisorId', 'supervisorId', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 9, '---', 0, 1),
(104, 3, 'hs_hr_emp_work_experience.eexp_seqno', 'workExpSeqNo', 'workExpSeqNo', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 1),
(105, 3, 'ohrm_emp_education.education_id', 'empEduCode', 'empEduCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 11, '---', 0, 1),
(106, 3, 'hs_hr_emp_skill.skill_id', 'empSkillCode', 'empSkillCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 12, '---', 0, 1),
(107, 3, 'hs_hr_emp_language.lang_id', 'empLangCode', 'empLangCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(108, 3, 'hs_hr_emp_language.fluency', 'empLangType', 'empLangType', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 13, '---', 0, 1),
(109, 3, 'ohrm_emp_license.license_id', 'empLicenseCode', 'empLicenseCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 14, '---', 0, 1),
(110, 3, 'hs_hr_emp_member_detail.membship_code', 'membershipCode', 'membershipCode', 'false', NULL, NULL, 'label', '<xml><getter>ecMobile</getter></xml>', '100', '0', NULL, 1, 15, '---', 0, 1),
(112, 3, 'ROUND(DATEDIFF(hs_hr_emp_work_experience.eexp_to_date, hs_hr_emp_work_experience.eexp_from_date)/365,1)', 'Duration', 'expDuration', 'false', NULL, NULL, 'label', '<xml><getter>expDuration</getter></xml>', '100', '0', NULL, 1, 10, '---', 0, 0),
(113, 3, 'ohrm_emp_termination.termination_date', 'Termination Date', 'terminationDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>terminationDate</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(114, 3, 'ohrm_emp_termination_reason.name', 'Termination Reason', 'terminationReason', 'false', NULL, NULL, 'label', '<xml><getter>terminationReason</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0),
(115, 3, 'ohrm_emp_education.institute', 'Institute', 'getInstitute', 'false', NULL, NULL, 'label', '<xml><getter>getInstitute</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(116, 3, 'ohrm_emp_education.major', 'Major/Specialization', 'getMajor', 'false', NULL, NULL, 'label', '<xml><getter>getMajor</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(117, 3, 'ohrm_emp_education.start_date', 'Start Date', 'getStartDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getStartDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(118, 3, 'ohrm_emp_education.end_date', 'End Date', 'getEndDate', 'false', NULL, NULL, 'labelDate', '<xml><getter>getEndDate</getter></xml>', '80', '0', NULL, 1, 11, '---', 0, 0),
(119, 3, 'ohrm_emp_license.license_no', 'License Number', 'getLicenseNo', 'false', NULL, NULL, 'label', '<xml><getter>getLicenseNo</getter></xml>', '200', '0', NULL, 1, 14, '---', 0, 0),
(120, 3, 'ohrm_emp_termination.note', 'Termination Note', 'getNote', 'false', NULL, NULL, 'label', '<xml><getter>getNote</getter></xml>', '100', '0', NULL, 1, 6, '---', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_display_field_group`
--

CREATE TABLE `ohrm_display_field_group` (
  `id` int(10) unsigned NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_list` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_display_field_group`
--

INSERT INTO `ohrm_display_field_group` (`id`, `report_group_id`, `name`, `is_list`) VALUES
(1, 3, 'Personal', 0),
(2, 3, 'Contact Details', 0),
(3, 3, 'Emergency Contacts', 1),
(4, 3, 'Dependents', 1),
(5, 3, 'Immigration', 1),
(6, 3, 'Job', 0),
(7, 3, 'Salary', 1),
(8, 3, 'Subordinates', 1),
(9, 3, 'Supervisors', 1),
(10, 3, 'Work Experience', 1),
(11, 3, 'Education', 1),
(12, 3, 'Skills', 1),
(13, 3, 'Languages', 1),
(14, 3, 'License', 1),
(15, 3, 'Memberships', 1),
(16, 3, 'Custom Fields', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_education`
--

CREATE TABLE `ohrm_education` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_education`
--

INSERT INTO `ohrm_education` (`id`, `name`) VALUES
(1, 'Associate Degrees'),
(2, 'Bachelor''s Degrees'),
(3, 'Master''s Degrees'),
(4, 'Doctoral Degrees'),
(5, 'Secondary school');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email`
--

CREATE TABLE `ohrm_email` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email`
--

INSERT INTO `ohrm_email` (`id`, `name`) VALUES
(1, 'leave.apply'),
(3, 'leave.approve'),
(2, 'leave.assign'),
(4, 'leave.cancel'),
(6, 'leave.change'),
(5, 'leave.reject');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_configuration`
--

CREATE TABLE `ohrm_email_configuration` (
  `id` int(10) NOT NULL,
  `mail_type` varchar(50) DEFAULT NULL,
  `sent_as` varchar(250) NOT NULL,
  `sendmail_path` varchar(250) DEFAULT NULL,
  `smtp_host` varchar(250) DEFAULT NULL,
  `smtp_port` int(10) DEFAULT NULL,
  `smtp_username` varchar(250) DEFAULT NULL,
  `smtp_password` varchar(250) DEFAULT NULL,
  `smtp_auth_type` varchar(50) DEFAULT NULL,
  `smtp_security_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_notification`
--

CREATE TABLE `ohrm_email_notification` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_enable` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_notification`
--

INSERT INTO `ohrm_email_notification` (`id`, `name`, `is_enable`) VALUES
(1, 'Leave Applications', 0),
(2, 'Leave Assignments', 0),
(3, 'Leave Approvals', 0),
(4, 'Leave Cancellations', 0),
(5, 'Leave Rejections', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_processor`
--

CREATE TABLE `ohrm_email_processor` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `class_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_processor`
--

INSERT INTO `ohrm_email_processor` (`id`, `email_id`, `class_name`) VALUES
(1, 1, 'LeaveEmailProcessor'),
(2, 2, 'LeaveEmailProcessor'),
(3, 3, 'LeaveEmailProcessor'),
(4, 4, 'LeaveEmailProcessor'),
(5, 5, 'LeaveEmailProcessor'),
(6, 6, 'LeaveChangeMailProcessor');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_subscriber`
--

CREATE TABLE `ohrm_email_subscriber` (
  `id` int(6) NOT NULL,
  `notification_id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_email_template`
--

CREATE TABLE `ohrm_email_template` (
  `id` int(6) NOT NULL,
  `email_id` int(6) NOT NULL,
  `locale` varchar(20) DEFAULT NULL,
  `performer_role` varchar(50) DEFAULT NULL,
  `recipient_role` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_email_template`
--

INSERT INTO `ohrm_email_template` (`id`, `email_id`, `locale`, `performer_role`, `recipient_role`, `subject`, `body`) VALUES
(1, 1, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationBody.txt'),
(2, 1, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/apply/leaveApplicationSubscriberBody.txt'),
(3, 3, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalBody.txt'),
(4, 3, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/approve/leaveApprovalSubscriberBody.txt'),
(5, 2, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBody.txt'),
(6, 2, 'en_US', NULL, 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubjectForSupervisors.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentBodyForSupervisors.txt'),
(7, 2, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/assign/leaveAssignmentSubscriberBody.txt'),
(8, 4, 'en_US', 'ess', 'supervisor', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationBody.txt'),
(9, 4, 'en_US', 'ess', 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveEmployeeCancellationSubscriberBody.txt'),
(10, 4, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationBody.txt'),
(11, 4, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/cancel/leaveCancellationSubscriberBody.txt'),
(12, 5, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionBody.txt'),
(13, 5, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/reject/leaveRejectionSubscriberBody.txt'),
(14, 6, 'en_US', NULL, 'ess', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeBody.txt'),
(15, 6, 'en_US', NULL, 'subscriber', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberSubject.txt', 'orangehrmLeavePlugin/modules/leave/templates/mail/en_US/change/leaveChangeSubscriberBody.txt');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employee_work_shift`
--

CREATE TABLE `ohrm_employee_work_shift` (
  `work_shift_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_employee_work_shift`
--

INSERT INTO `ohrm_employee_work_shift` (`work_shift_id`, `emp_number`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_employment_status`
--

CREATE TABLE `ohrm_employment_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_employment_status`
--

INSERT INTO `ohrm_employment_status` (`id`, `name`) VALUES
(1, 'Full'),
(2, 'Part'),
(3, 'Consultant');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_education`
--

CREATE TABLE `ohrm_emp_education` (
  `id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL,
  `education_id` int(11) NOT NULL,
  `institute` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `year` decimal(4,0) DEFAULT NULL,
  `score` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_license`
--

CREATE TABLE `ohrm_emp_license` (
  `emp_number` int(11) NOT NULL,
  `license_id` int(11) NOT NULL,
  `license_no` varchar(50) DEFAULT NULL,
  `license_issued_date` date DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_reporting_method`
--

CREATE TABLE `ohrm_emp_reporting_method` (
  `reporting_method_id` int(7) NOT NULL,
  `reporting_method_name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_reporting_method`
--

INSERT INTO `ohrm_emp_reporting_method` (`reporting_method_id`, `reporting_method_name`) VALUES
(1, 'Direct'),
(2, 'Indirect');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination`
--

CREATE TABLE `ohrm_emp_termination` (
  `id` int(4) NOT NULL,
  `emp_number` int(4) DEFAULT NULL,
  `reason_id` int(4) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_emp_termination_reason`
--

CREATE TABLE `ohrm_emp_termination_reason` (
  `id` int(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_emp_termination_reason`
--

INSERT INTO `ohrm_emp_termination_reason` (`id`, `name`) VALUES
(1, 'Other'),
(2, 'Retired'),
(3, 'Contract Not Renewed'),
(4, 'Resigned - Company Requested'),
(5, 'Resigned - Self Proposed'),
(6, 'Resigned'),
(7, 'Deceased'),
(8, 'Physically Disabled/Compensated'),
(9, 'Laid-off'),
(10, 'Dismissed');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_filter_field`
--

CREATE TABLE `ohrm_filter_field` (
  `filter_field_id` bigint(20) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `where_clause_part` mediumtext NOT NULL,
  `filter_field_widget` varchar(255) DEFAULT NULL,
  `condition_no` int(20) NOT NULL,
  `required` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_filter_field`
--

INSERT INTO `ohrm_filter_field` (`filter_field_id`, `report_group_id`, `name`, `where_clause_part`, `filter_field_widget`, `condition_no`, `required`) VALUES
(1, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectList', 2, 'true'),
(2, 1, 'activity_show_deleted', 'ohrm_project_activity.is_deleted', 'ohrmWidgetInputCheckbox', 2, 'false'),
(3, 1, 'project_date_range', 'date', 'ohrmWidgetDateRange', 1, 'false'),
(4, 1, 'employee', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 2, 'true'),
(5, 1, 'activity_name', 'ohrm_project_activity.activity_id', 'ohrmWidgetProjectActivityList', 2, 'true'),
(6, 1, 'project_name', 'ohrm_project.project_id', 'ohrmWidgetProjectListWithAllOption', 2, 'true'),
(7, 1, 'only_include_approved_timesheets', 'ohrm_timesheet.state', 'ohrmWidgetApprovedTimesheetInputCheckBox', 2, NULL),
(8, 3, 'employee_name', 'hs_hr_employee.emp_number', 'ohrmReportWidgetEmployeeListAutoFill', 1, NULL),
(9, 3, 'pay_grade', 'hs_hr_emp_basicsalary.sal_grd_code', 'ohrmReportWidgetPayGradeDropDown', 1, NULL),
(10, 3, 'education', 'ohrm_emp_education.education_id', 'ohrmReportWidgetEducationtypeDropDown', 1, NULL),
(11, 3, 'employment_status', 'hs_hr_employee.emp_status', 'ohrmWidgetEmploymentStatusList', 1, NULL),
(12, 3, 'service_period', 'datediff(current_date(), hs_hr_employee.joined_date)/365', 'ohrmReportWidgetServicePeriod', 1, NULL),
(13, 3, 'joined_date', 'hs_hr_employee.joined_date', 'ohrmReportWidgetJoinedDate', 1, NULL),
(14, 3, 'job_title', 'hs_hr_employee.job_title_code', 'ohrmWidgetJobTitleList', 1, NULL),
(15, 3, 'language', 'hs_hr_emp_language.lang_id', 'ohrmReportWidgetLanguageDropDown', 1, NULL),
(16, 3, 'skill', 'hs_hr_emp_skill.skill_id', 'ohrmReportWidgetSkillDropDown', 1, NULL),
(17, 3, 'age_group', 'datediff(current_date(), hs_hr_employee.emp_birthday)/365', 'ohrmReportWidgetAgeGroup', 1, NULL),
(18, 3, 'sub_unit', 'hs_hr_employee.work_station', 'ohrmWidgetSubDivisionList', 1, NULL),
(19, 3, 'gender', 'hs_hr_employee.emp_gender', 'ohrmReportWidgetGenderDropDown', 1, NULL),
(20, 3, 'location', 'ohrm_location.id', 'ohrmReportWidgetOperationalCountryLocationDropDown', 1, NULL),
(21, 1, 'is_deleted', 'ohrm_project_activity.is_deleted', '', 2, NULL),
(22, 3, 'include', 'hs_hr_employee.termination_id', 'ohrmReportWidgetIncludedEmployeesDropDown', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_group_field`
--

CREATE TABLE `ohrm_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_by_clause` mediumtext NOT NULL,
  `group_field_widget` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_group_field`
--

INSERT INTO `ohrm_group_field` (`group_field_id`, `name`, `group_by_clause`, `group_field_widget`) VALUES
(1, 'activity id', 'GROUP BY ohrm_project_activity.activity_id', NULL),
(2, 'employee number', 'GROUP BY hs_hr_employee.emp_number', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_holiday`
--

CREATE TABLE `ohrm_holiday` (
  `id` int(10) unsigned NOT NULL,
  `description` text,
  `date` date DEFAULT NULL,
  `recurring` tinyint(3) unsigned DEFAULT '0',
  `length` int(10) unsigned DEFAULT NULL,
  `operational_country_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_holiday`
--

INSERT INTO `ohrm_holiday` (`id`, `description`, `date`, `recurring`, `length`, `operational_country_id`) VALUES
(1, 'Easter', '2017-04-16', 0, 0, NULL),
(2, 'Christmas', '2017-01-25', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_home_page`
--

CREATE TABLE `ohrm_home_page` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_home_page`
--

INSERT INTO `ohrm_home_page` (`id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 1, 'dashboard/index', NULL, 15),
(2, 2, 'dashboard/index', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate`
--

CREATE TABLE `ohrm_job_candidate` (
  `id` int(13) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `comment` text,
  `mode_of_application` int(4) NOT NULL,
  `date_of_application` date NOT NULL,
  `cv_file_id` int(13) DEFAULT NULL,
  `cv_text_version` text,
  `keywords` varchar(255) DEFAULT NULL,
  `added_person` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate`
--

INSERT INTO `ohrm_job_candidate` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `contact_number`, `status`, `comment`, `mode_of_application`, `date_of_application`, `cv_file_id`, `cv_text_version`, `keywords`, `added_person`) VALUES
(1, 'Prince', '', 'Ansah', 'ansah@example.com', '0999886', 1, 'listed', 1, '2017-01-11', NULL, NULL, 'class officer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_attachment`
--

CREATE TABLE `ohrm_job_candidate_attachment` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_history`
--

CREATE TABLE `ohrm_job_candidate_history` (
  `id` int(13) NOT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) DEFAULT NULL,
  `candidate_vacancy_name` varchar(255) DEFAULT NULL,
  `interview_id` int(13) DEFAULT NULL,
  `action` int(4) NOT NULL,
  `performed_by` int(13) DEFAULT NULL,
  `performed_date` datetime NOT NULL,
  `note` text,
  `interviewers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate_history`
--

INSERT INTO `ohrm_job_candidate_history` (`id`, `candidate_id`, `vacancy_id`, `candidate_vacancy_name`, `interview_id`, `action`, `performed_by`, `performed_date`, `note`, `interviewers`) VALUES
(1, 1, 1, 'Opening for Class Officer', NULL, 1, NULL, '2017-01-11 13:03:16', NULL, NULL),
(2, 1, NULL, NULL, NULL, 16, NULL, '2017-01-11 13:03:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_candidate_vacancy`
--

CREATE TABLE `ohrm_job_candidate_vacancy` (
  `id` int(13) DEFAULT NULL,
  `candidate_id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_candidate_vacancy`
--

INSERT INTO `ohrm_job_candidate_vacancy` (`id`, `candidate_id`, `vacancy_id`, `status`, `applied_date`) VALUES
(1, 1, 1, 'APPLICATION INITIATED', '2017-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_category`
--

CREATE TABLE `ohrm_job_category` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_category`
--

INSERT INTO `ohrm_job_category` (`id`, `name`) VALUES
(1, 'Drater'),
(5, 'Officer'),
(6, 'Supervisor'),
(7, 'Director'),
(9, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview`
--

CREATE TABLE `ohrm_job_interview` (
  `id` int(13) NOT NULL,
  `candidate_vacancy_id` int(13) DEFAULT NULL,
  `candidate_id` int(13) DEFAULT NULL,
  `interview_name` varchar(100) NOT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_attachment`
--

CREATE TABLE `ohrm_job_interview_attachment` (
  `id` int(13) NOT NULL,
  `interview_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_interview_interviewer`
--

CREATE TABLE `ohrm_job_interview_interviewer` (
  `interview_id` int(13) NOT NULL,
  `interviewer_id` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_specification_attachment`
--

CREATE TABLE `ohrm_job_specification_attachment` (
  `id` int(13) NOT NULL,
  `job_title_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_title`
--

CREATE TABLE `ohrm_job_title` (
  `id` int(13) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` varchar(400) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_title`
--

INSERT INTO `ohrm_job_title` (`id`, `job_title`, `job_description`, `note`, `is_deleted`) VALUES
(1, 'I.T Officer', 'I.T Offcer', '', 0),
(2, 'Managing Director', '', '', 0),
(3, 'I.T Director', '', '', 0),
(4, 'Operations Director', '', '', 0),
(5, 'Human Resource Director', '', '', 0),
(6, 'Human Resource Manager', '', '', 0),
(7, 'Operations Manager', '', '', 0),
(8, 'Secretary', '', '', 0),
(9, 'Classification Officer', '', '', 0),
(10, 'Valuation Officer', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy`
--

CREATE TABLE `ohrm_job_vacancy` (
  `id` int(13) NOT NULL,
  `job_title_code` int(4) NOT NULL,
  `hiring_manager_id` int(13) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `no_of_positions` int(13) DEFAULT NULL,
  `status` int(4) NOT NULL,
  `published_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `defined_time` datetime NOT NULL,
  `updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_job_vacancy`
--

INSERT INTO `ohrm_job_vacancy` (`id`, `job_title_code`, `hiring_manager_id`, `name`, `description`, `no_of_positions`, `status`, `published_in_feed`, `defined_time`, `updated_time`) VALUES
(1, 9, 3, 'Opening for Class Officer', 'details', 1, 1, 0, '2017-01-11 12:56:23', '2017-01-11 12:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_job_vacancy_attachment`
--

CREATE TABLE `ohrm_job_vacancy_attachment` (
  `id` int(13) NOT NULL,
  `vacancy_id` int(13) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `file_type` varchar(200) DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `file_content` mediumblob,
  `attachment_type` int(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_kpi`
--

CREATE TABLE `ohrm_kpi` (
  `id` bigint(20) NOT NULL,
  `job_title_code` varchar(10) DEFAULT NULL,
  `kpi_indicators` varchar(255) DEFAULT NULL,
  `min_rating` int(7) DEFAULT '0',
  `max_rating` int(7) DEFAULT '0',
  `default_kpi` smallint(1) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_kpi`
--

INSERT INTO `ohrm_kpi` (`id`, `job_title_code`, `kpi_indicators`, `min_rating`, `max_rating`, `default_kpi`, `deleted_at`) VALUES
(1, '1', 'Meeting Goals', 1, 10, NULL, NULL),
(2, '1', 'Teamwork', 1, 10, NULL, NULL),
(3, '1', 'Job Skills', 1, 10, NULL, NULL),
(4, '1', 'Communication', 1, 10, NULL, NULL),
(5, '1', 'Decision Making', 1, 10, NULL, NULL),
(6, '1', 'Work Habits', 1, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_language`
--

CREATE TABLE `ohrm_language` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave`
--

CREATE TABLE `ohrm_leave` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `length_hours` decimal(6,2) unsigned DEFAULT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `comments` varchar(256) DEFAULT NULL,
  `leave_request_id` int(10) unsigned NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration_type` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave`
--

INSERT INTO `ohrm_leave` (`id`, `date`, `length_hours`, `length_days`, `status`, `comments`, `leave_request_id`, `leave_type_id`, `emp_number`, `start_time`, `end_time`, `duration_type`) VALUES
(1, '2017-02-15', '5.00', '1.0000', 2, NULL, 1, 6, 2, '00:00:00', '00:00:00', 0),
(2, '2017-02-20', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(3, '2017-02-21', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(4, '2017-02-22', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(5, '2017-02-23', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(6, '2017-02-24', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(7, '2017-02-25', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(8, '2017-02-26', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(9, '2017-02-27', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(10, '2017-02-28', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(11, '2017-03-01', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(12, '2017-03-02', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(13, '2017-03-03', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(14, '2017-03-04', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(15, '2017-03-05', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(16, '2017-03-06', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(17, '2017-03-07', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(18, '2017-03-08', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(19, '2017-03-09', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(20, '2017-03-10', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(21, '2017-03-11', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(22, '2017-03-12', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(23, '2017-03-13', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(24, '2017-03-14', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(25, '2017-03-15', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(26, '2017-03-16', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(27, '2017-03-17', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(28, '2017-03-18', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(29, '2017-03-19', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(30, '2017-03-20', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(31, '2017-03-21', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(32, '2017-03-22', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(33, '2017-03-23', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(34, '2017-03-24', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(35, '2017-03-25', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(36, '2017-03-26', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(37, '2017-03-27', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(38, '2017-03-28', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(39, '2017-03-29', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(40, '2017-03-30', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(41, '2017-03-31', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(42, '2017-04-01', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(43, '2017-04-02', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(44, '2017-04-03', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(45, '2017-04-04', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(46, '2017-04-05', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(47, '2017-04-06', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(48, '2017-04-07', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(49, '2017-04-08', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(50, '2017-04-09', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(51, '2017-04-10', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(52, '2017-04-11', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(53, '2017-04-12', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(54, '2017-04-13', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(55, '2017-04-14', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(56, '2017-04-15', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(57, '2017-04-16', '0.00', '0.0000', 4, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(58, '2017-04-17', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(59, '2017-04-18', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(60, '2017-04-19', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(61, '2017-04-20', '5.00', '1.0000', 2, NULL, 2, 1, 2, '00:00:00', '00:00:00', 0),
(62, '2017-02-20', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(63, '2017-02-21', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(64, '2017-02-22', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(65, '2017-02-23', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(66, '2017-02-24', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(67, '2017-02-25', '0.00', '0.0000', 4, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(68, '2017-02-26', '0.00', '0.0000', 4, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(69, '2017-02-27', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(70, '2017-02-28', '8.00', '1.0000', 2, NULL, 3, 5, 4, '00:00:00', '00:00:00', 0),
(71, '2017-01-12', '8.00', '1.0000', 2, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(72, '2017-01-13', '8.00', '1.0000', 2, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(73, '2017-01-14', '0.00', '0.0000', 4, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(74, '2017-01-15', '0.00', '0.0000', 4, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(75, '2017-01-16', '8.00', '1.0000', 2, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(76, '2017-01-17', '8.00', '1.0000', 2, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0),
(77, '2017-01-18', '8.00', '1.0000', 2, NULL, 4, 2, 1, '00:00:00', '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_adjustment`
--

CREATE TABLE `ohrm_leave_adjustment` (
  `id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adjustment_type` int(10) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_comment`
--

CREATE TABLE `ohrm_leave_comment` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement`
--

CREATE TABLE `ohrm_leave_entitlement` (
  `id` int(10) unsigned NOT NULL,
  `emp_number` int(7) NOT NULL,
  `no_of_days` decimal(19,15) NOT NULL,
  `days_used` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `leave_type_id` int(10) unsigned NOT NULL,
  `from_date` datetime NOT NULL,
  `to_date` datetime DEFAULT NULL,
  `credited_date` datetime DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `entitlement_type` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_entitlement`
--

INSERT INTO `ohrm_leave_entitlement` (`id`, `emp_number`, `no_of_days`, `days_used`, `leave_type_id`, `from_date`, `to_date`, `credited_date`, `note`, `entitlement_type`, `deleted`, `created_by_id`, `created_by_name`) VALUES
(1, 2, '300.000000000000000', '44.0000', 1, '2017-02-10 00:00:00', '2018-02-09 00:00:00', '2017-01-09 00:00:00', NULL, 1, 0, 1, 'Admin'),
(2, 2, '10.000000000000000', '1.0000', 6, '2017-02-10 00:00:00', '2018-02-09 00:00:00', '2017-01-09 00:00:00', NULL, 1, 0, 1, 'Admin'),
(3, 4, '30.000000000000000', '7.0000', 5, '2017-02-10 00:00:00', '2018-02-09 00:00:00', '2017-01-10 00:00:00', NULL, 1, 0, 1, 'Admin'),
(4, 3, '20.000000000000000', '0.0000', 3, '2017-02-10 00:00:00', '2018-02-09 00:00:00', '2017-01-10 00:00:00', NULL, 1, 0, 1, 'Admin'),
(5, 4, '20.000000000000000', '0.0000', 3, '2016-02-10 00:00:00', '2017-02-09 00:00:00', '2017-01-11 00:00:00', NULL, 1, 0, 1, 'Admin'),
(6, 1, '20.000000000000000', '5.0000', 2, '2016-02-10 00:00:00', '2017-02-09 00:00:00', '2017-01-11 00:00:00', NULL, 1, 0, 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_adjustment`
--

CREATE TABLE `ohrm_leave_entitlement_adjustment` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(10) unsigned NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(4,2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_entitlement_type`
--

CREATE TABLE `ohrm_leave_entitlement_type` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_editable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_entitlement_type`
--

INSERT INTO `ohrm_leave_entitlement_type` (`id`, `name`, `is_editable`) VALUES
(1, 'Added', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_leave_entitlement`
--

CREATE TABLE `ohrm_leave_leave_entitlement` (
  `id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `entitlement_id` int(10) unsigned NOT NULL,
  `length_days` decimal(6,4) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_leave_entitlement`
--

INSERT INTO `ohrm_leave_leave_entitlement` (`id`, `leave_id`, `entitlement_id`, `length_days`) VALUES
(1, 1, 2, '1.0000'),
(2, 2, 1, '1.0000'),
(3, 3, 1, '1.0000'),
(4, 4, 1, '1.0000'),
(5, 5, 1, '1.0000'),
(6, 6, 1, '1.0000'),
(7, 9, 1, '1.0000'),
(8, 10, 1, '1.0000'),
(9, 11, 1, '1.0000'),
(10, 12, 1, '1.0000'),
(11, 13, 1, '1.0000'),
(12, 16, 1, '1.0000'),
(13, 17, 1, '1.0000'),
(14, 18, 1, '1.0000'),
(15, 19, 1, '1.0000'),
(16, 20, 1, '1.0000'),
(17, 23, 1, '1.0000'),
(18, 24, 1, '1.0000'),
(19, 25, 1, '1.0000'),
(20, 26, 1, '1.0000'),
(21, 27, 1, '1.0000'),
(22, 30, 1, '1.0000'),
(23, 31, 1, '1.0000'),
(24, 32, 1, '1.0000'),
(25, 33, 1, '1.0000'),
(26, 34, 1, '1.0000'),
(27, 37, 1, '1.0000'),
(28, 38, 1, '1.0000'),
(29, 39, 1, '1.0000'),
(30, 40, 1, '1.0000'),
(31, 41, 1, '1.0000'),
(32, 44, 1, '1.0000'),
(33, 45, 1, '1.0000'),
(34, 46, 1, '1.0000'),
(35, 47, 1, '1.0000'),
(36, 48, 1, '1.0000'),
(37, 51, 1, '1.0000'),
(38, 52, 1, '1.0000'),
(39, 53, 1, '1.0000'),
(40, 54, 1, '1.0000'),
(41, 55, 1, '1.0000'),
(42, 58, 1, '1.0000'),
(43, 59, 1, '1.0000'),
(44, 60, 1, '1.0000'),
(45, 61, 1, '1.0000'),
(46, 62, 3, '1.0000'),
(47, 63, 3, '1.0000'),
(48, 64, 3, '1.0000'),
(49, 65, 3, '1.0000'),
(50, 66, 3, '1.0000'),
(51, 69, 3, '1.0000'),
(52, 70, 3, '1.0000'),
(53, 71, 6, '1.0000'),
(54, 72, 6, '1.0000'),
(55, 75, 6, '1.0000'),
(56, 76, 6, '1.0000'),
(57, 77, 6, '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_period_history`
--

CREATE TABLE `ohrm_leave_period_history` (
  `id` int(11) NOT NULL,
  `leave_period_start_month` int(11) NOT NULL,
  `leave_period_start_day` int(11) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_period_history`
--

INSERT INTO `ohrm_leave_period_history` (`id`, `leave_period_start_month`, `leave_period_start_day`, `created_at`) VALUES
(1, 2, 10, '2017-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request`
--

CREATE TABLE `ohrm_leave_request` (
  `id` int(10) unsigned NOT NULL,
  `leave_type_id` int(10) unsigned NOT NULL,
  `date_applied` date NOT NULL,
  `emp_number` int(7) NOT NULL,
  `comments` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_request`
--

INSERT INTO `ohrm_leave_request` (`id`, `leave_type_id`, `date_applied`, `emp_number`, `comments`) VALUES
(1, 6, '2017-02-15', 2, 'Personal needs'),
(2, 1, '2017-02-20', 2, 'Family meeting'),
(3, 5, '2017-02-20', 4, 'Family'),
(4, 2, '2017-01-12', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_request_comment`
--

CREATE TABLE `ohrm_leave_request_comment` (
  `id` int(11) NOT NULL,
  `leave_request_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by_name` varchar(255) NOT NULL,
  `created_by_id` int(10) DEFAULT NULL,
  `created_by_emp_number` int(7) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_request_comment`
--

INSERT INTO `ohrm_leave_request_comment` (`id`, `leave_request_id`, `created`, `created_by_name`, `created_by_id`, `created_by_emp_number`, `comments`) VALUES
(1, 1, '2017-01-09 19:15:58', 'Admin', 1, NULL, 'Personal needs'),
(2, 2, '2017-01-10 10:08:32', 'Admin', 1, NULL, 'Family meeting'),
(3, 3, '2017-01-10 10:32:26', 'Admin', 1, NULL, 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_status`
--

CREATE TABLE `ohrm_leave_status` (
  `id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_status`
--

INSERT INTO `ohrm_leave_status` (`id`, `status`, `name`) VALUES
(1, -1, 'REJECTED'),
(2, 0, 'CANCELLED'),
(3, 1, 'PENDING APPROVAL'),
(4, 2, 'SCHEDULED'),
(5, 3, 'TAKEN'),
(6, 4, 'WEEKEND'),
(7, 5, 'HOLIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_leave_type`
--

CREATE TABLE `ohrm_leave_type` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_in_reports_if_no_entitlement` tinyint(1) NOT NULL DEFAULT '0',
  `operational_country_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_leave_type`
--

INSERT INTO `ohrm_leave_type` (`id`, `name`, `deleted`, `exclude_in_reports_if_no_entitlement`, `operational_country_id`) VALUES
(1, 'Bereavement', 0, 0, NULL),
(2, 'Public holidays', 0, 0, NULL),
(3, 'Vacation days', 0, 0, NULL),
(4, 'Sick days', 0, 0, NULL),
(5, 'Maternity/Paternity', 0, 0, NULL),
(6, 'Personal', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_license`
--

CREATE TABLE `ohrm_license` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_location`
--

CREATE TABLE `ohrm_location` (
  `id` int(11) NOT NULL,
  `name` varchar(110) NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `province` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(35) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `fax` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_location`
--

INSERT INTO `ohrm_location` (`id`, `name`, `country_code`, `province`, `city`, `address`, `zip_code`, `phone`, `fax`, `notes`) VALUES
(1, 'Ghana Link Network Services', 'GH', 'Accra', 'East legon', '1 Mensah Wood Street', '00233', '+233 30 321 3843', '', ''),
(2, 'Africa Link Inspection Company', 'SL', 'Freetown', 'Central ', '5 Liverpool Street', '00232', '+23278516136', '', ''),
(3, 'Bissau Link Companhia De Inspeccao SARL', 'GW', 'Bissau', 'Bissau Buije', 'Rua Septembro 14', '00245', '+245 969278380', '', ''),
(4, 'NICK TC SCAN', 'GH', '123', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_login`
--

CREATE TABLE `ohrm_login` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_name` text NOT NULL,
  `user_role_predefined` tinyint(1) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_login`
--

INSERT INTO `ohrm_login` (`id`, `user_id`, `user_name`, `user_role_name`, `user_role_predefined`, `login_time`) VALUES
(1, 1, 'Admin', 'Admin', 1, '2017-01-06 12:05:41'),
(2, 1, 'Admin', 'Admin', 1, '2017-01-06 12:05:59'),
(3, 1, 'Admin', 'Admin', 1, '2017-01-09 06:50:38'),
(4, 1, 'Admin', 'Admin', 1, '2017-01-09 06:59:14'),
(5, 1, 'Admin', 'Admin', 1, '2017-01-09 10:12:02'),
(6, 1, 'Admin', 'Admin', 1, '2017-01-09 10:20:20'),
(7, 1, 'Admin', 'Admin', 1, '2017-01-09 12:08:52'),
(8, 1, 'Admin', 'Admin', 1, '2017-01-09 12:29:31'),
(9, 1, 'Admin', 'Admin', 1, '2017-01-09 14:42:55'),
(10, 3, 'Prince', 'ESS', 1, '2017-01-09 15:28:09'),
(11, 1, 'Admin', 'Admin', 1, '2017-01-09 16:02:19'),
(12, 1, 'Admin', 'Admin', 1, '2017-01-09 16:03:52'),
(13, 1, 'Admin', 'Admin', 1, '2017-01-09 16:04:54'),
(14, 1, 'Admin', 'Admin', 1, '2017-01-09 17:12:47'),
(15, 1, 'Admin', 'Admin', 1, '2017-01-09 17:18:58'),
(16, 1, 'Admin', 'Admin', 1, '2017-01-09 18:00:55'),
(17, 1, 'Admin', 'Admin', 1, '2017-01-09 21:43:17'),
(18, 1, 'Admin', 'Admin', 1, '2017-01-10 09:02:54'),
(19, 1, 'Admin', 'Admin', 1, '2017-01-10 10:58:22'),
(20, 1, 'Admin', 'Admin', 1, '2017-01-10 11:37:59'),
(21, 1, 'Admin', 'Admin', 1, '2017-01-10 14:21:56'),
(22, 1, 'Admin', 'Admin', 1, '2017-01-10 17:41:01'),
(23, 1, 'Admin', 'Admin', 1, '2017-01-10 17:41:52'),
(24, 1, 'Admin', 'Admin', 1, '2017-01-11 09:04:48'),
(25, 1, 'Admin', 'Admin', 1, '2017-01-11 09:52:45'),
(26, 1, 'Admin', 'Admin', 1, '2017-01-11 10:10:58'),
(27, 5, 'Cobby', 'ESS', 1, '2017-01-11 10:11:48'),
(28, 1, 'Admin', 'Admin', 1, '2017-01-11 11:05:20'),
(29, 1, 'Admin', 'Admin', 1, '2017-01-11 11:06:05'),
(30, 1, 'Admin', 'Admin', 1, '2017-01-12 13:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_membership`
--

CREATE TABLE `ohrm_membership` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_membership`
--

INSERT INTO `ohrm_membership` (`id`, `name`) VALUES
(1, 'IEEE');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_menu_item`
--

CREATE TABLE `ohrm_menu_item` (
  `id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `screen_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` tinyint(4) NOT NULL,
  `order_hint` int(11) NOT NULL,
  `url_extras` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_menu_item`
--

INSERT INTO `ohrm_menu_item` (`id`, `menu_title`, `screen_id`, `parent_id`, `level`, `order_hint`, `url_extras`, `status`) VALUES
(1, 'Admin', 74, NULL, 1, 100, NULL, 1),
(2, 'User Management', NULL, 1, 2, 100, NULL, 1),
(3, 'Project Info', NULL, 52, 2, 400, NULL, 0),
(4, 'Customers', 36, 3, 3, 100, NULL, 1),
(5, 'Projects', 37, 3, 3, 200, NULL, 1),
(6, 'Job', NULL, 1, 2, 300, NULL, 1),
(7, 'Job Titles', 23, 6, 3, 100, NULL, 1),
(8, 'Pay Grades', 24, 6, 3, 200, NULL, 1),
(9, 'Employment Status', 25, 6, 3, 300, NULL, 1),
(10, 'Job Categories', 26, 6, 3, 400, NULL, 1),
(11, 'Work Shifts', 27, 6, 3, 500, NULL, 1),
(12, 'Organization', NULL, 1, 2, 400, NULL, 1),
(13, 'General Information', 20, 12, 3, 100, NULL, 1),
(14, 'Locations', 21, 12, 3, 200, NULL, 1),
(15, 'Structure', 22, 12, 3, 300, NULL, 1),
(16, 'Qualifications', NULL, 1, 2, 500, NULL, 1),
(17, 'Skills', 28, 16, 3, 100, NULL, 1),
(18, 'Education', 29, 16, 3, 200, NULL, 1),
(19, 'Licenses', 30, 16, 3, 300, NULL, 1),
(20, 'Languages', 31, 16, 3, 400, NULL, 1),
(21, 'Memberships', 32, 16, 3, 500, NULL, 1),
(22, 'Nationalities', 33, 1, 2, 700, NULL, 1),
(23, 'Configuration', NULL, 1, 2, 900, NULL, 1),
(24, 'Email Configuration', 34, 23, 3, 100, NULL, 1),
(25, 'Email Subscriptions', 35, 23, 3, 200, NULL, 1),
(27, 'Localization', 38, 23, 3, 300, NULL, 1),
(28, 'Modules', 39, 23, 3, 400, NULL, 1),
(30, 'PIM', 75, NULL, 1, 200, NULL, 1),
(31, 'Configuration', NULL, 30, 2, 100, NULL, 1),
(32, 'Optional Fields', 40, 31, 3, 100, NULL, 1),
(33, 'Custom Fields', 41, 31, 3, 200, NULL, 1),
(34, 'Data Import', 42, 31, 3, 300, NULL, 1),
(35, 'Reporting Methods', 43, 31, 3, 400, NULL, 1),
(36, 'Termination Reasons', 44, 31, 3, 500, NULL, 1),
(37, 'Employee List', 5, 30, 2, 200, '/reset/1', 1),
(38, 'Add Employee', 4, 30, 2, 300, NULL, 1),
(39, 'Reports', 45, 30, 2, 400, '/reportGroup/3/reportType/PIM_DEFINED', 1),
(40, 'My Info', 46, NULL, 1, 700, NULL, 1),
(41, 'Leave', 68, NULL, 1, 300, NULL, 1),
(42, 'Configure', NULL, 41, 2, 500, NULL, 0),
(43, 'Leave Period', 47, 42, 3, 100, NULL, 1),
(44, 'Leave Types', 7, 42, 3, 200, NULL, 1),
(45, 'Work Week', 14, 42, 3, 300, NULL, 1),
(46, 'Holidays', 11, 42, 3, 400, NULL, 1),
(48, 'Leave List', 16, 41, 2, 600, '/reset/1', 1),
(49, 'Assign Leave', 17, 41, 2, 700, NULL, 1),
(50, 'My Leave', 48, 41, 2, 200, '/reset/1', 1),
(51, 'Apply', 49, 41, 2, 100, NULL, 1),
(52, 'Time', 67, NULL, 1, 400, NULL, 1),
(53, 'Timesheets', NULL, 52, 2, 100, NULL, 1),
(54, 'My Timesheets', 51, 53, 3, 100, NULL, 1),
(55, 'Employee Timesheets', 52, 53, 3, 200, NULL, 1),
(56, 'Attendance', NULL, 52, 2, 200, NULL, 1),
(57, 'My Records', 53, 56, 3, 100, NULL, 1),
(58, 'Punch In/Out', 54, 56, 3, 200, NULL, 1),
(59, 'Employee Records', 55, 56, 3, 300, NULL, 1),
(60, 'Configuration', 56, 56, 3, 400, NULL, 1),
(61, 'Reports', NULL, 52, 2, 300, NULL, 1),
(62, 'Project Reports', 57, 61, 3, 100, '?reportId=1', 1),
(63, 'Employee Reports', 58, 61, 3, 200, '?reportId=2', 1),
(64, 'Attendance Summary', 59, 61, 3, 300, '?reportId=4', 1),
(65, 'Recruitment', 76, NULL, 1, 500, NULL, 1),
(66, 'Candidates', 60, 65, 2, 100, NULL, 1),
(67, 'Vacancies', 61, 65, 2, 200, NULL, 1),
(74, 'Entitlements', NULL, 41, 2, 300, NULL, 0),
(75, 'Add Entitlements', 72, 74, 3, 100, NULL, 1),
(76, 'My Entitlements', 70, 74, 3, 300, '/reset/1', 1),
(77, 'Employee Entitlements', 69, 74, 3, 200, '/reset/1', 1),
(78, 'Reports', NULL, 41, 2, 400, NULL, 0),
(79, 'Leave Entitlements and Usage Report', 78, 78, 3, 100, NULL, 1),
(80, 'My Leave Entitlements and Usage Report', 79, 78, 3, 200, NULL, 1),
(81, 'Users', 1, 2, 3, 100, NULL, 1),
(82, 'Dashboard', 103, NULL, 1, 800, NULL, 1),
(83, 'Performance', NULL, NULL, 1, 700, '', 1),
(84, 'Configure', NULL, 83, 2, 100, '', 1),
(85, 'Manage Reviews', NULL, 83, 2, 200, '', 1),
(86, 'KPIs', 105, 84, 3, 100, '', 1),
(87, 'Manage Reviews', 111, 85, 3, 100, '', 1),
(88, 'My Reviews', 106, 85, 3, 200, '', 1),
(89, 'Review List', 110, 85, 3, 300, '', 1),
(90, 'Trackers', 112, 84, 3, 200, NULL, 1),
(91, 'Employee Trackers', 113, 83, 2, 800, NULL, 1),
(92, 'My Trackers', 114, 83, 2, 700, NULL, 1),
(93, 'Directory', 116, NULL, 1, 1000, '/reset/1', 1),
(94, 'Social Media Authentication', 117, 23, 3, 500, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module`
--

CREATE TABLE `ohrm_module` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module`
--

INSERT INTO `ohrm_module` (`id`, `name`, `status`) VALUES
(1, 'core', 1),
(2, 'admin', 1),
(3, 'pim', 1),
(4, 'leave', 1),
(5, 'time', 0),
(6, 'attendance', 0),
(7, 'recruitment', 1),
(8, 'recruitmentApply', 1),
(9, 'communication', 1),
(10, 'dashboard', 1),
(11, 'performance', 1),
(12, 'directory', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_module_default_page`
--

CREATE TABLE `ohrm_module_default_page` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `enable_class` varchar(100) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_module_default_page`
--

INSERT INTO `ohrm_module_default_page` (`id`, `module_id`, `user_role_id`, `action`, `enable_class`, `priority`) VALUES
(1, 2, 1, 'admin/viewSystemUsers', NULL, 20),
(2, 3, 1, 'pim/viewEmployeeList', NULL, 20),
(3, 3, 3, 'pim/viewEmployeeList', NULL, 10),
(4, 3, 2, 'pim/viewMyDetails', NULL, 0),
(5, 4, 1, 'leave/viewLeaveList/reset/1', NULL, 20),
(6, 4, 3, 'leave/viewLeaveList/reset/1', NULL, 10),
(7, 4, 2, 'leave/viewMyLeaveList', NULL, 0),
(8, 4, 1, 'leave/defineLeavePeriod', 'LeavePeriodDefinedHomePageEnabler', 100),
(9, 4, 2, 'leave/showLeavePeriodNotDefinedWarning', 'LeavePeriodDefinedHomePageEnabler', 90),
(10, 5, 1, 'time/viewEmployeeTimesheet', NULL, 20),
(11, 5, 2, 'time/viewMyTimesheet', NULL, 0),
(12, 5, 1, 'time/defineTimesheetPeriod', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(13, 5, 2, 'time/timesheetPeriodNotDefined', 'TimesheetPeriodDefinedHomePageEnabler', 100),
(14, 7, 1, 'recruitment/viewCandidates', NULL, 20),
(15, 7, 5, 'recruitment/viewCandidates', NULL, 10),
(16, 7, 6, 'recruitment/viewCandidates', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_nationality`
--

CREATE TABLE `ohrm_nationality` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_nationality`
--

INSERT INTO `ohrm_nationality` (`id`, `name`) VALUES
(1, 'Afghan'),
(2, 'Albanian'),
(3, 'Algerian'),
(4, 'American'),
(5, 'Andorran'),
(6, 'Angolan'),
(7, 'Antiguans'),
(8, 'Argentinean'),
(9, 'Armenian'),
(10, 'Australian'),
(11, 'Austrian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinea-Bissauan'),
(74, 'Guinean'),
(75, 'Guyanese'),
(76, 'Haitian'),
(77, 'Herzegovinian'),
(78, 'Honduran'),
(79, 'Hungarian'),
(80, 'I-Kiribati'),
(81, 'Icelander'),
(82, 'Indian'),
(83, 'Indonesian'),
(84, 'Iranian'),
(85, 'Iraqi'),
(86, 'Irish'),
(87, 'Israeli'),
(88, 'Italian'),
(89, 'Ivorian'),
(90, 'Jamaican'),
(91, 'Japanese'),
(92, 'Jordanian'),
(93, 'Kazakhstani'),
(94, 'Kenyan'),
(95, 'Kittian and Nevisian'),
(96, 'Kuwaiti'),
(97, 'Kyrgyz'),
(98, 'Laotian'),
(99, 'Latvian'),
(100, 'Lebanese'),
(101, 'Liberian'),
(102, 'Libyan'),
(103, 'Liechtensteiner'),
(104, 'Lithuanian'),
(105, 'Luxembourger'),
(106, 'Macedonian'),
(107, 'Malagasy'),
(108, 'Malawian'),
(109, 'Malaysian'),
(110, 'Maldivan'),
(111, 'Malian'),
(112, 'Maltese'),
(113, 'Marshallese'),
(114, 'Mauritanian'),
(115, 'Mauritian'),
(116, 'Mexican'),
(117, 'Micronesian'),
(118, 'Moldovan'),
(119, 'Monacan'),
(120, 'Mongolian'),
(121, 'Moroccan'),
(122, 'Mosotho'),
(123, 'Motswana'),
(124, 'Mozambican'),
(125, 'Namibian'),
(126, 'Nauruan'),
(127, 'Nepalese'),
(128, 'New Zealander'),
(129, 'Nicaraguan'),
(130, 'Nigerian'),
(131, 'Nigerien'),
(132, 'North Korean'),
(133, 'Northern Irish'),
(134, 'Norwegian'),
(135, 'Omani'),
(136, 'Pakistani'),
(137, 'Palauan'),
(138, 'Panamanian'),
(139, 'Papua New Guinean'),
(140, 'Paraguayan'),
(141, 'Peruvian'),
(142, 'Polish'),
(143, 'Portuguese'),
(144, 'Qatari'),
(145, 'Romanian'),
(146, 'Russian'),
(147, 'Rwandan'),
(148, 'Saint Lucian'),
(149, 'Salvadoran'),
(150, 'Samoan'),
(151, 'San Marinese'),
(152, 'Sao Tomean'),
(153, 'Saudi'),
(154, 'Scottish'),
(155, 'Senegalese'),
(156, 'Serbian'),
(157, 'Seychellois'),
(158, 'Sierra Leonean'),
(159, 'Singaporean'),
(160, 'Slovakian'),
(161, 'Slovenian'),
(162, 'Solomon Islander'),
(163, 'Somali'),
(164, 'South African'),
(165, 'South Korean'),
(166, 'Spanish'),
(167, 'Sri Lankan'),
(168, 'Sudanese'),
(169, 'Surinamer'),
(170, 'Swazi'),
(171, 'Swedish'),
(172, 'Swiss'),
(173, 'Syrian'),
(174, 'Taiwanese'),
(175, 'Tajik'),
(176, 'Tanzanian'),
(177, 'Thai'),
(178, 'Togolese'),
(179, 'Tongan'),
(180, 'Trinidadian or Tobagonian'),
(181, 'Tunisian'),
(182, 'Turkish'),
(183, 'Tuvaluan'),
(184, 'Ugandan'),
(185, 'Ukrainian'),
(186, 'Uruguayan'),
(187, 'Uzbekistani'),
(188, 'Venezuelan'),
(189, 'Vietnamese'),
(190, 'Welsh'),
(191, 'Yemenite'),
(192, 'Zambian'),
(193, 'Zimbabwean'),
(194, 'LIH Nationals');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_access_token`
--

CREATE TABLE `ohrm_oauth_access_token` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_authorization_code`
--

CREATE TABLE `ohrm_oauth_authorization_code` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_client`
--

CREATE TABLE `ohrm_oauth_client` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_refresh_token`
--

CREATE TABLE `ohrm_oauth_refresh_token` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_oauth_user`
--

CREATE TABLE `ohrm_oauth_user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_provider`
--

CREATE TABLE `ohrm_openid_provider` (
  `id` int(10) NOT NULL,
  `provider_name` varchar(40) DEFAULT NULL,
  `provider_url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_openid_user_identity`
--

CREATE TABLE `ohrm_openid_user_identity` (
  `user_id` int(10) DEFAULT NULL,
  `provider_id` int(10) DEFAULT NULL,
  `user_identity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_operational_country`
--

CREATE TABLE `ohrm_operational_country` (
  `id` int(10) unsigned NOT NULL,
  `country_code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_organization_gen_info`
--

CREATE TABLE `ohrm_organization_gen_info` (
  `id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tax_id` varchar(30) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `zip_code` varchar(30) DEFAULT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_organization_gen_info`
--

INSERT INTO `ohrm_organization_gen_info` (`id`, `name`, `tax_id`, `registration_number`, `phone`, `fax`, `email`, `country`, `province`, `city`, `zip_code`, `street1`, `street2`, `note`) VALUES
(1, 'Link International Holdings', '009', '988', '', '', 'info@hq.li-h.com', 'GH', 'AC', 'Accra', '', 'Mensah Wood Str.', 'East Legon', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade`
--

CREATE TABLE `ohrm_pay_grade` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_pay_grade`
--

INSERT INTO `ohrm_pay_grade` (`id`, `name`) VALUES
(2, 'Director'),
(1, 'I.T Officer'),
(3, 'Officer');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_pay_grade_currency`
--

CREATE TABLE `ohrm_pay_grade_currency` (
  `pay_grade_id` int(11) NOT NULL,
  `currency_id` varchar(6) NOT NULL DEFAULT '',
  `min_salary` double DEFAULT NULL,
  `max_salary` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_pay_grade_currency`
--

INSERT INTO `ohrm_pay_grade_currency` (`pay_grade_id`, `currency_id`, `min_salary`, `max_salary`) VALUES
(1, 'USD', 2000, 10000),
(2, 'USD', 10000, 20000),
(3, 'USD', 300, 800);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_review`
--

CREATE TABLE `ohrm_performance_review` (
  `id` int(7) NOT NULL,
  `status_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `work_period_start` date DEFAULT NULL,
  `work_period_end` date DEFAULT NULL,
  `job_title_code` int(7) DEFAULT NULL,
  `department_id` int(7) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `activated_date` datetime DEFAULT NULL,
  `final_comment` text CHARACTER SET utf8 COLLATE utf8_bin,
  `final_rate` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_track`
--

CREATE TABLE `ohrm_performance_track` (
  `id` int(11) NOT NULL,
  `emp_number` int(7) NOT NULL,
  `tracker_name` varchar(200) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_performance_track`
--

INSERT INTO `ohrm_performance_track` (`id`, `emp_number`, `tracker_name`, `added_date`, `added_by`, `status`, `modified_date`) VALUES
(1, 4, 'Apraisal', '2017-01-10 19:37:11', NULL, 1, '2017-01-12 15:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_log`
--

CREATE TABLE `ohrm_performance_tracker_log` (
  `id` int(11) NOT NULL,
  `performance_track_id` int(11) DEFAULT NULL,
  `log` varchar(150) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT NULL,
  `reviewer_id` int(7) DEFAULT NULL,
  `achievement` varchar(45) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_performance_tracker_log`
--

INSERT INTO `ohrm_performance_tracker_log` (`id`, `performance_track_id`, `log`, `comment`, `status`, `added_date`, `modified_date`, `reviewer_id`, `achievement`, `user_id`) VALUES
(1, 1, 'Coding Speed', 'speed+', 1, '2017-01-10 19:44:17', NULL, NULL, '1', 1),
(2, 1, 'Teamwork', 'Prefers working alone', 1, '2017-01-11 11:09:43', NULL, NULL, '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_performance_tracker_reviewer`
--

CREATE TABLE `ohrm_performance_tracker_reviewer` (
  `id` int(11) NOT NULL,
  `performance_track_id` int(11) NOT NULL,
  `reviewer_id` int(7) NOT NULL,
  `added_date` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_performance_tracker_reviewer`
--

INSERT INTO `ohrm_performance_tracker_reviewer` (`id`, `performance_track_id`, `reviewer_id`, `added_date`, `status`) VALUES
(2, 1, 3, '2017-01-12 15:06:36', NULL),
(3, 1, 5, '2017-01-12 15:06:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_plugin`
--

CREATE TABLE `ohrm_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project`
--

CREATE TABLE `ohrm_project` (
  `project_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_activity`
--

CREATE TABLE `ohrm_project_activity` (
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(110) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_project_admin`
--

CREATE TABLE `ohrm_project_admin` (
  `project_id` int(11) NOT NULL,
  `emp_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report`
--

CREATE TABLE `ohrm_report` (
  `report_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `report_group_id` bigint(20) NOT NULL,
  `use_filter_field` tinyint(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report`
--

INSERT INTO `ohrm_report` (`report_id`, `name`, `report_group_id`, `use_filter_field`, `type`) VALUES
(1, 'Project Report', 1, 1, NULL),
(2, 'Employee Report', 1, 1, NULL),
(3, 'Project Activity Details', 1, 1, NULL),
(4, 'Attendance Total Summary Report', 2, 0, NULL),
(5, 'PIM Sample Report', 3, 1, 'PIM_DEFINED');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_report_group`
--

CREATE TABLE `ohrm_report_group` (
  `report_group_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `core_sql` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_report_group`
--

INSERT INTO `ohrm_report_group` (`report_group_id`, `name`, `core_sql`) VALUES
(1, 'timesheet', 'SELECT selectCondition FROM ohrm_project_activity LEFT JOIN (SELECT * FROM ohrm_timesheet_item WHERE whereCondition1) AS ohrm_timesheet_item  ON (ohrm_timesheet_item.activity_id = ohrm_project_activity.activity_id) LEFT JOIN ohrm_project ON (ohrm_project.project_id = ohrm_project_activity.project_id) LEFT JOIN hs_hr_employee ON (hs_hr_employee.emp_number = ohrm_timesheet_item.employee_id) LEFT JOIN ohrm_timesheet ON (ohrm_timesheet.timesheet_id = ohrm_timesheet_item.timesheet_id) LEFT JOIN ohrm_customer ON (ohrm_customer.customer_id = ohrm_project.customer_id) WHERE whereCondition2 groupByClause ORDER BY ohrm_customer.name, ohrm_project.name, ohrm_project_activity.name, hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(2, 'attendance', 'SELECT selectCondition FROM hs_hr_employee LEFT JOIN (SELECT * FROM ohrm_attendance_record WHERE ( ( ohrm_attendance_record.punch_in_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) AND ( ohrm_attendance_record.punch_out_user_time BETWEEN "#@fromDate@,@1970-01-01@#" AND #@"toDate"@,@CURDATE()@# ) ) ) AS ohrm_attendance_record ON (hs_hr_employee.emp_number = ohrm_attendance_record.employee_id) WHERE hs_hr_employee.emp_number = #@employeeId@,@hs_hr_employee.emp_number AND (hs_hr_employee.termination_id is null) @# AND (hs_hr_employee.job_title_code = #@"jobTitle")@,@hs_hr_employee.job_title_code OR hs_hr_employee.job_title_code is null)@# AND (hs_hr_employee.work_station IN (#@subUnit)@,@SELECT id FROM ohrm_subunit) OR hs_hr_employee.work_station is null@#) AND (hs_hr_employee.emp_status = #@"employeeStatus")@,@hs_hr_employee.emp_status OR hs_hr_employee.emp_status is null)@# groupByClause ORDER BY hs_hr_employee.emp_lastname, hs_hr_employee.emp_firstname'),
(3, 'pim', 'SELECT selectCondition FROM hs_hr_employee \n                    LEFT JOIN hs_hr_emp_emergency_contacts ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_emergency_contacts.emp_number) \n                    LEFT JOIN ohrm_subunit ON \n                        (hs_hr_employee.work_station = ohrm_subunit.id) \n                    LEFT JOIN ohrm_employment_status ON \n                        (hs_hr_employee.emp_status = ohrm_employment_status.id) \n                    LEFT JOIN ohrm_job_title ON\n                        (hs_hr_employee.job_title_code = ohrm_job_title.id)\n                    LEFT JOIN ohrm_job_category ON \n                        (hs_hr_employee.eeo_cat_code = ohrm_job_category.id) \n                    LEFT JOIN ohrm_nationality ON\n                        (hs_hr_employee.nation_code = ohrm_nationality.id)\n                    LEFT JOIN hs_hr_emp_dependents ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_dependents.emp_number)\n                    LEFT JOIN hs_hr_emp_locations AS emp_location ON\n                        (hs_hr_employee.emp_number = emp_location.emp_number)\n                    LEFT JOIN ohrm_location ON\n                        (emp_location.location_id = ohrm_location.id)\n                    LEFT JOIN hs_hr_emp_contract_extend ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_contract_extend.emp_number) \n                    LEFT JOIN hs_hr_emp_basicsalary ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                    LEFT JOIN ohrm_pay_grade ON \n                        (hs_hr_emp_basicsalary.sal_grd_code = ohrm_pay_grade.id) \n                    LEFT JOIN hs_hr_currency_type ON \n                        (hs_hr_emp_basicsalary.currency_id = hs_hr_currency_type.currency_id) \n                    LEFT JOIN hs_hr_payperiod ON \n                        (hs_hr_emp_basicsalary.payperiod_code = hs_hr_payperiod.payperiod_code) \n                    LEFT JOIN hs_hr_emp_passport ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_passport.emp_number) \n                    LEFT JOIN hs_hr_emp_reportto AS subordinate_list ON \n                        (hs_hr_employee.emp_number = subordinate_list.erep_sup_emp_number) \n                    LEFT JOIN hs_hr_employee AS subordinate ON\n                        (subordinate.emp_number = subordinate_list.erep_sub_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS subordinate_reporting_method ON \n                        (subordinate_list.erep_reporting_mode = subordinate_reporting_method.reporting_method_id) \n                    LEFT JOIN hs_hr_emp_work_experience ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_work_experience.emp_number) \n                    LEFT JOIN ohrm_emp_education ON \n                        (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                    LEFT JOIN ohrm_education ON \n                        (ohrm_emp_education.education_id = ohrm_education.id) \n                    LEFT JOIN hs_hr_emp_skill ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                    LEFT JOIN ohrm_skill ON \n                        (hs_hr_emp_skill.skill_id = ohrm_skill.id) \n                    LEFT JOIN hs_hr_emp_language ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    LEFT JOIN ohrm_language ON \n                        (hs_hr_emp_language.lang_id = ohrm_language.id) \n                    LEFT JOIN ohrm_emp_license ON \n                        (hs_hr_employee.emp_number = ohrm_emp_license.emp_number) \n                    LEFT JOIN ohrm_license ON \n                        (ohrm_emp_license.license_id = ohrm_license.id) \n                    LEFT JOIN hs_hr_emp_member_detail ON \n                        (hs_hr_employee.emp_number = hs_hr_emp_member_detail.emp_number) \n                    LEFT JOIN ohrm_membership ON\n                        (hs_hr_emp_member_detail.membship_code = ohrm_membership.id)\n                    LEFT JOIN hs_hr_country ON \n                        (hs_hr_employee.coun_code = hs_hr_country.cou_code) \n                    LEFT JOIN hs_hr_emp_directdebit ON \n                        (hs_hr_emp_basicsalary.id = hs_hr_emp_directdebit.salary_id) \n                    LEFT JOIN hs_hr_emp_reportto AS supervisor_list ON \n                        (hs_hr_employee.emp_number = supervisor_list.erep_sub_emp_number) \n                    LEFT JOIN hs_hr_employee AS supervisor ON\n                        (supervisor.emp_number = supervisor_list.erep_sup_emp_number)\n                    LEFT JOIN ohrm_emp_reporting_method AS supervisor_reporting_method ON \n                        (supervisor_list.erep_reporting_mode = supervisor_reporting_method.reporting_method_id) \n                    LEFT JOIN ohrm_emp_termination ON\n                        (hs_hr_employee.termination_id = ohrm_emp_termination.id)\n                    LEFT JOIN ohrm_emp_termination_reason ON\n                        (ohrm_emp_termination.reason_id = ohrm_emp_termination_reason.id)\n                WHERE hs_hr_employee.emp_number in (\n                    SELECT hs_hr_employee.emp_number FROM hs_hr_employee\n                        LEFT JOIN hs_hr_emp_basicsalary ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_basicsalary.emp_number) \n                        LEFT JOIN ohrm_emp_education ON \n                            (hs_hr_employee.emp_number = ohrm_emp_education.emp_number) \n                        LEFT JOIN hs_hr_emp_skill ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_skill.emp_number) \n                        LEFT JOIN hs_hr_emp_language ON \n                            (hs_hr_employee.emp_number = hs_hr_emp_language.emp_number) \n                    WHERE whereCondition1\n                )\n                GROUP BY \n                     hs_hr_employee.emp_number,\n                     hs_hr_employee.emp_lastname,\n                     hs_hr_employee.emp_firstname,\n                     hs_hr_employee.emp_middle_name,\n                     hs_hr_employee.emp_birthday,\n                     ohrm_nationality.name,\n                     hs_hr_employee.emp_gender,\n                     hs_hr_employee.emp_marital_status,\n                     hs_hr_employee.emp_dri_lice_num,\n                     hs_hr_employee.emp_dri_lice_exp_date,\n                     hs_hr_employee.emp_street1,\n                     hs_hr_employee.emp_street2,\n                     hs_hr_employee.city_code,\n                     hs_hr_employee.provin_code,\n                     hs_hr_employee.emp_zipcode,\n                     hs_hr_country.cou_code,\n                     hs_hr_employee.emp_hm_telephone,\n                     hs_hr_employee.emp_mobile,\n                     hs_hr_employee.emp_work_telephone,\n                     hs_hr_employee.emp_work_email,\n                     hs_hr_employee.emp_oth_email\n\nORDER BY hs_hr_employee.emp_lastname\n');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer`
--

CREATE TABLE `ohrm_reviewer` (
  `id` int(7) NOT NULL,
  `review_id` int(7) DEFAULT NULL,
  `employee_number` int(7) DEFAULT NULL,
  `status` int(7) DEFAULT NULL,
  `reviewer_group_id` int(7) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_group`
--

CREATE TABLE `ohrm_reviewer_group` (
  `id` int(7) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `piority` int(7) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_reviewer_group`
--

INSERT INTO `ohrm_reviewer_group` (`id`, `name`, `piority`) VALUES
(1, 'Supervisor', 1),
(2, 'Employee', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_reviewer_rating`
--

CREATE TABLE `ohrm_reviewer_rating` (
  `id` int(11) NOT NULL,
  `rating` decimal(18,2) DEFAULT NULL,
  `kpi_id` int(7) DEFAULT NULL,
  `review_id` int(7) DEFAULT NULL,
  `reviewer_id` int(7) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_role_user_selection_rule`
--

CREATE TABLE `ohrm_role_user_selection_rule` (
  `user_role_id` int(10) NOT NULL,
  `selection_rule_id` int(10) NOT NULL,
  `configurable_params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_screen`
--

CREATE TABLE `ohrm_screen` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_id` int(11) NOT NULL,
  `action_url` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_screen`
--

INSERT INTO `ohrm_screen` (`id`, `name`, `module_id`, `action_url`) VALUES
(1, 'User List', 2, 'viewSystemUsers'),
(2, 'Add/Edit System User', 2, 'saveSystemUser'),
(3, 'Delete System Users', 2, 'deleteSystemUsers'),
(4, 'Add Employee', 3, 'addEmployee'),
(5, 'View Employee List', 3, 'viewEmployeeList'),
(6, 'Delete Employees', 3, 'deleteEmployees'),
(7, 'Leave Type List', 4, 'leaveTypeList'),
(8, 'Define Leave Type', 4, 'defineLeaveType'),
(9, 'Undelete Leave Type', 4, 'undeleteLeaveType'),
(10, 'Delete Leave Type', 4, 'deleteLeaveType'),
(11, 'View Holiday List', 4, 'viewHolidayList'),
(12, 'Define Holiday', 4, 'defineHoliday'),
(13, 'Delete Holiday', 4, 'deleteHoliday'),
(14, 'Define WorkWeek', 4, 'defineWorkWeek'),
(16, 'Leave List', 4, 'viewLeaveList'),
(17, 'Assign Leave', 4, 'assignLeave'),
(18, 'View Leave Summary', 4, 'viewLeaveSummary'),
(19, 'Save Leave Entitlements', 4, 'saveLeaveEntitlements'),
(20, 'General Information', 2, 'viewOrganizationGeneralInformation'),
(21, 'Location List', 2, 'viewLocations'),
(22, 'View Company Structure', 2, 'viewCompanyStructure'),
(23, 'Job Title List', 2, 'viewJobTitleList'),
(24, 'Pay Grade List', 2, 'viewPayGrades'),
(25, 'Employment Status List', 2, 'employmentStatus'),
(26, 'Job Category List', 2, 'jobCategory'),
(27, 'Work Shift List', 2, 'workShift'),
(28, 'Skill List', 2, 'viewSkills'),
(29, 'Education List', 2, 'viewEducation'),
(30, 'License List', 2, 'viewLicenses'),
(31, 'Language List', 2, 'viewLanguages'),
(32, 'Membership List', 2, 'membership'),
(33, 'Nationality List', 2, 'nationality'),
(34, 'Add/Edit Mail Configuration', 2, 'listMailConfiguration'),
(35, 'Notification List', 2, 'viewEmailNotification'),
(36, 'Customer List', 2, 'viewCustomers'),
(37, 'Project List', 2, 'viewProjects'),
(38, 'Localization', 2, 'localization'),
(39, 'Module Configuration', 2, 'viewModules'),
(40, 'Configure PIM', 3, 'configurePim'),
(41, 'Custom Field List', 3, 'listCustomFields'),
(42, 'Data Import', 2, 'pimCsvImport'),
(43, 'Reporting Method List', 3, 'viewReportingMethods'),
(44, 'Termination Reason List', 3, 'viewTerminationReasons'),
(45, 'PIM Reports List', 1, 'viewDefinedPredefinedReports'),
(46, 'View MyInfo', 3, 'viewMyDetails'),
(47, 'Define Leave Period', 4, 'defineLeavePeriod'),
(48, 'View My Leave List', 4, 'viewMyLeaveList'),
(49, 'Apply Leave', 4, 'applyLeave'),
(50, 'Define Timesheet Start Date', 5, 'defineTimesheetPeriod'),
(51, 'View My Timesheet', 5, 'viewMyTimesheet'),
(52, 'View Employee Timesheet', 5, 'viewEmployeeTimesheet'),
(53, 'View My Attendance', 6, 'viewMyAttendanceRecord'),
(54, 'Punch In/Out', 6, 'punchIn'),
(55, 'View Employee Attendance', 6, 'viewAttendanceRecord'),
(56, 'Attendance Configuration', 6, 'configure'),
(57, 'View Project Report Criteria', 5, 'displayProjectReportCriteria'),
(58, 'View Employee Report Criteria', 5, 'displayEmployeeReportCriteria'),
(59, 'View Attendance Report Criteria', 5, 'displayAttendanceSummaryReportCriteria'),
(60, 'Candidate List', 7, 'viewCandidates'),
(61, 'Vacancy List', 7, 'viewJobVacancy'),
(67, 'View Time Module', 5, 'viewTimeModule'),
(68, 'View Leave Module', 4, 'viewLeaveModule'),
(69, 'Leave Entitlements', 4, 'viewLeaveEntitlements'),
(70, 'My Leave Entitlements', 4, 'viewMyLeaveEntitlements'),
(71, 'Delete Leave Entitlements', 4, 'deleteLeaveEntitlements'),
(72, 'Add Leave Entitlement', 4, 'addLeaveEntitlement'),
(73, 'Edit Leave Entitlement', 4, 'editLeaveEntitlement'),
(74, 'View Admin Module', 2, 'viewAdminModule'),
(75, 'View PIM Module', 3, 'viewPimModule'),
(76, 'View Recruitment Module', 7, 'viewRecruitmentModule'),
(78, 'Leave Balance Report', 4, 'viewLeaveBalanceReport'),
(79, 'My Leave Balance Report', 4, 'viewMyLeaveBalanceReport'),
(80, 'Save Job Title', 2, 'saveJobTitle'),
(81, 'Delete Job Title', 2, 'deleteJobTitle'),
(82, 'Save Pay Grade', 2, 'payGrade'),
(83, 'Delete Pay Grade', 2, 'deletePayGrades'),
(84, 'Save Pay Grade Currency', 2, 'savePayGradeCurrency'),
(85, 'Delete Pay Grade Currency', 2, 'deletePayGradeCurrency'),
(86, 'Add Customer', 2, 'addCustomer'),
(87, 'Delete Customer', 2, 'deleteCustomer'),
(88, 'Save Project', 2, 'saveProject'),
(89, 'Delete Project', 2, 'deleteProject'),
(90, 'Add Project Adtivity', 2, 'addProjectActivity'),
(91, 'Delete Project Adtivity', 2, 'deleteProjectActivity'),
(92, 'Define PIM reports', 1, 'definePredefinedReport'),
(93, 'Display PIM reports', 1, 'displayPredefinedReport'),
(94, 'Add Job Vacancy', 7, 'addJobVacancy'),
(95, 'Delete Job Vacancy', 7, 'deleteJobVacancy'),
(96, 'Add Candidate', 7, 'addCandidate'),
(97, 'Delete Candidate', 7, 'deleteCandidateVacancies'),
(98, 'View Leave Request', 4, 'viewLeaveRequest'),
(99, 'Change Leave Status', 4, 'changeLeaveStatus'),
(100, 'Terminate Employment', 3, 'terminateEmployement'),
(101, 'View Attendance Summary Report', 5, 'displayAttendanceSummaryReport'),
(102, 'View Project Activity Details Report', 5, 'displayProjectActivityDetailsReport'),
(103, 'Dashboard', 10, 'index'),
(104, 'Save KPI', 11, 'saveKpi'),
(105, 'Saearch KPI', 11, 'searchKpi'),
(106, 'My Reviews', 11, 'myPerformanceReview'),
(107, 'Add Review', 11, 'saveReview'),
(108, 'Review Evaluate', 11, 'reviewEvaluate'),
(109, 'Review Evaluate By Admin', 11, 'reviewEvaluateByAdmin'),
(110, 'Search Evaluate Performance', 11, 'searchEvaluatePerformancReview'),
(111, 'Search Performance Review', 11, 'searchPerformancReview'),
(112, 'Manage_Trackers', 11, 'addPerformanceTracker'),
(113, 'Employee_Trackers', 11, 'viewEmployeePerformanceTrackerList'),
(114, 'My_Trackers', 11, 'viewMyPerformanceTrackerList'),
(115, 'Employee_Tracker_Logs', 11, 'addPerformanceTrackerLog'),
(116, 'Directory', 12, 'viewDirectory'),
(117, 'Manage OpenId', 2, 'openIdProvider');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_composite_display_field`
--

CREATE TABLE `ohrm_selected_composite_display_field` (
  `id` bigint(20) NOT NULL,
  `composite_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_composite_display_field`
--

INSERT INTO `ohrm_selected_composite_display_field` (`id`, `composite_display_field_id`, `report_id`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field`
--

CREATE TABLE `ohrm_selected_display_field` (
  `id` bigint(20) NOT NULL,
  `display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field`
--

INSERT INTO `ohrm_selected_display_field` (`id`, `display_field_id`, `report_id`) VALUES
(2, 2, 1),
(4, 8, 2),
(5, 9, 5),
(6, 10, 5),
(7, 11, 5),
(8, 12, 5),
(9, 13, 5),
(10, 14, 5),
(11, 15, 5),
(13, 17, 5),
(14, 18, 5),
(15, 19, 5),
(16, 20, 5),
(17, 21, 5),
(18, 22, 5),
(19, 23, 5),
(20, 24, 5),
(21, 25, 5),
(22, 26, 5),
(23, 27, 5),
(24, 28, 5),
(25, 29, 5),
(26, 30, 5),
(27, 31, 5),
(28, 32, 5),
(29, 33, 5),
(31, 35, 5),
(32, 36, 5),
(33, 37, 5),
(34, 38, 5),
(35, 39, 5),
(36, 40, 5),
(37, 41, 5),
(38, 42, 5),
(39, 43, 5),
(40, 44, 5),
(41, 45, 5),
(43, 47, 5),
(44, 48, 5),
(45, 49, 5),
(48, 52, 5),
(49, 53, 5),
(50, 54, 5),
(51, 55, 5),
(53, 57, 5),
(54, 58, 5),
(55, 59, 5),
(56, 60, 5),
(57, 61, 5),
(58, 62, 5),
(59, 63, 5),
(60, 64, 5),
(61, 65, 5),
(62, 66, 5),
(63, 67, 5),
(64, 68, 5),
(65, 69, 5),
(66, 70, 5),
(67, 71, 5),
(68, 72, 5),
(69, 73, 5),
(70, 74, 5),
(71, 75, 5),
(72, 76, 5),
(73, 77, 5),
(74, 78, 5),
(76, 80, 5),
(77, 81, 5),
(78, 82, 5),
(79, 83, 5),
(80, 84, 5),
(81, 85, 5),
(82, 86, 5),
(83, 87, 5),
(84, 88, 5),
(85, 89, 5),
(86, 90, 5),
(87, 91, 5),
(88, 92, 5),
(89, 93, 5),
(90, 94, 5),
(91, 95, 5),
(93, 97, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_display_field_group`
--

CREATE TABLE `ohrm_selected_display_field_group` (
  `id` int(10) unsigned NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `display_field_group_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_display_field_group`
--

INSERT INTO `ohrm_selected_display_field_group` (`id`, `report_id`, `display_field_group_id`) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 5, 4),
(5, 5, 5),
(6, 5, 6),
(7, 5, 7),
(8, 5, 8),
(9, 5, 9),
(10, 5, 10),
(11, 5, 11),
(12, 5, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_filter_field`
--

CREATE TABLE `ohrm_selected_filter_field` (
  `report_id` bigint(20) NOT NULL,
  `filter_field_id` bigint(20) NOT NULL,
  `filter_field_order` bigint(20) NOT NULL,
  `value1` varchar(255) DEFAULT NULL,
  `value2` varchar(255) DEFAULT NULL,
  `where_condition` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_filter_field`
--

INSERT INTO `ohrm_selected_filter_field` (`report_id`, `filter_field_id`, `filter_field_order`, `value1`, `value2`, `where_condition`, `type`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'Runtime'),
(1, 3, 2, NULL, NULL, NULL, 'Runtime'),
(1, 7, 3, NULL, NULL, NULL, 'Runtime'),
(1, 21, 4, '0', NULL, '=', 'Predefined'),
(2, 3, 4, NULL, NULL, NULL, 'Runtime'),
(2, 4, 1, NULL, NULL, NULL, 'Runtime'),
(2, 5, 3, NULL, NULL, NULL, 'Runtime'),
(2, 6, 2, NULL, NULL, NULL, 'Runtime'),
(2, 7, 5, NULL, NULL, NULL, 'Runtime'),
(3, 3, 2, NULL, NULL, NULL, 'Runtime'),
(3, 5, 1, NULL, NULL, NULL, 'Runtime'),
(3, 7, 3, NULL, NULL, NULL, 'Runtime'),
(5, 22, 1, NULL, NULL, 'IS NULL', 'Predefined');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_selected_group_field`
--

CREATE TABLE `ohrm_selected_group_field` (
  `group_field_id` bigint(20) NOT NULL,
  `summary_display_field_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_selected_group_field`
--

INSERT INTO `ohrm_selected_group_field` (`group_field_id`, `summary_display_field_id`, `report_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_skill`
--

CREATE TABLE `ohrm_skill` (
  `id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_skill`
--

INSERT INTO `ohrm_skill` (`id`, `name`, `description`) VALUES
(1, 'Valuation', ''),
(2, 'Classification', ''),
(3, 'Data Capture', ''),
(4, 'Information Technology', '');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_subunit`
--

CREATE TABLE `ohrm_subunit` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `unit_id` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `lft` smallint(6) unsigned DEFAULT NULL,
  `rgt` smallint(6) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_subunit`
--

INSERT INTO `ohrm_subunit` (`id`, `name`, `unit_id`, `description`, `lft`, `rgt`, `level`) VALUES
(1, 'Link International Holdings', '', '', 1, 12, 0),
(4, 'GLIC', '1', '', 4, 5, 1),
(5, 'ALIC', '2', '', 6, 9, 1),
(6, 'Data Capture', '1', '', 7, 8, 2),
(7, 'BLIC', '3', '', 10, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_summary_display_field`
--

CREATE TABLE `ohrm_summary_display_field` (
  `summary_display_field_id` bigint(20) NOT NULL,
  `function` varchar(1000) NOT NULL,
  `label` varchar(255) NOT NULL,
  `field_alias` varchar(255) DEFAULT NULL,
  `is_sortable` varchar(10) NOT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `sort_field` varchar(255) DEFAULT NULL,
  `element_type` varchar(255) NOT NULL,
  `element_property` varchar(1000) NOT NULL,
  `width` varchar(255) NOT NULL,
  `is_exportable` varchar(10) DEFAULT NULL,
  `text_alignment_style` varchar(20) DEFAULT NULL,
  `is_value_list` tinyint(1) NOT NULL DEFAULT '0',
  `display_field_group_id` int(10) unsigned DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_summary_display_field`
--

INSERT INTO `ohrm_summary_display_field` (`summary_display_field_id`, `function`, `label`, `field_alias`, `is_sortable`, `sort_order`, `sort_field`, `element_type`, `element_property`, `width`, `is_exportable`, `text_alignment_style`, `is_value_list`, `display_field_group_id`, `default_value`) VALUES
(1, 'ROUND(COALESCE(sum(duration)/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL),
(2, 'ROUND(COALESCE(sum(TIMESTAMPDIFF(SECOND , ohrm_attendance_record.punch_in_utc_time , ohrm_attendance_record.punch_out_utc_time))/3600, 0),2)', 'Time (Hours)', 'totalduration', 'false', NULL, NULL, 'label', '<xml><getter>totalduration</getter></xml>', '100', 'false', 'right', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet`
--

CREATE TABLE `ohrm_timesheet` (
  `timesheet_id` bigint(20) NOT NULL,
  `state` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `employee_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_timesheet`
--

INSERT INTO `ohrm_timesheet` (`timesheet_id`, `state`, `start_date`, `end_date`, `employee_id`) VALUES
(1, 'NOT SUBMITTED', '2017-01-09', '2017-01-15', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_action_log`
--

CREATE TABLE `ohrm_timesheet_action_log` (
  `timesheet_action_log_id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `date_time` date NOT NULL,
  `performed_by` int(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_timesheet_item`
--

CREATE TABLE `ohrm_timesheet_item` (
  `timesheet_item_id` bigint(20) NOT NULL,
  `timesheet_id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `comment` text,
  `project_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_upgrade_history`
--

CREATE TABLE `ohrm_upgrade_history` (
  `id` int(10) NOT NULL,
  `start_version` varchar(30) DEFAULT NULL,
  `end_version` varchar(30) DEFAULT NULL,
  `start_increment` int(11) NOT NULL,
  `end_increment` int(11) NOT NULL,
  `upgraded_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user`
--

CREATE TABLE `ohrm_user` (
  `id` int(10) NOT NULL,
  `user_role_id` int(10) NOT NULL,
  `emp_number` int(13) DEFAULT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user`
--

INSERT INTO `ohrm_user` (`id`, `user_role_id`, `emp_number`, `user_name`, `user_password`, `deleted`, `status`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`) VALUES
(1, 1, NULL, 'admin', '$2a$12$eU7CXtEi0lsVSBBiyFGtx.qSy7daPKLv4dXFxo7uTiF5ZBqpJlaR.', 0, 1, NULL, NULL, NULL, NULL),
(2, 2, 1, 'nathaniel', '$2a$12$XfVa4dcM3EeoXSl554tizenitn9VmxWh.BphNaM9e/6Hbip7hTz2e', 0, 1, '2017-01-09 16:03:56', NULL, NULL, 1),
(3, 2, 2, 'prince', '$2a$12$KG/qw7c5SZSfpZC9aXny6.EK6gtwMYDPk87BZY1T59MLVVKO3rXI6', 0, 1, '2017-01-09 16:15:34', '2017-01-09 16:23:39', 1, 1),
(4, 2, 3, 'austin', '$2a$12$bFbMWslDTLhbI4M9ih6O7e19VCT/JXYlJRBtYcJ4vZLDwpn0bNa2e', 0, 1, '2017-01-09 19:38:09', NULL, NULL, 1),
(5, 2, 4, 'cobby', '$2a$12$3qAe9kpLBzLUvc3kwnJTBe1Wuz6aQN.v58vcggtNSO7ij6tmwUobK', 0, 1, '2017-01-09 19:45:56', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role`
--

CREATE TABLE `ohrm_user_role` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_assignable` tinyint(1) DEFAULT '0',
  `is_predefined` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role`
--

INSERT INTO `ohrm_user_role` (`id`, `name`, `display_name`, `is_assignable`, `is_predefined`) VALUES
(1, 'Admin', 'Admin', 1, 1),
(2, 'ESS', 'ESS', 1, 1),
(3, 'Supervisor', 'Supervisor', 0, 1),
(4, 'ProjectAdmin', 'ProjectAdmin', 0, 1),
(5, 'Interviewer', 'Interviewer', 0, 1),
(6, 'HiringManager', 'HiringManager', 0, 1),
(7, 'Reviewer', 'Reviewer', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_data_group`
--

CREATE TABLE `ohrm_user_role_data_group` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `data_group_id` int(11) DEFAULT NULL,
  `can_read` tinyint(4) DEFAULT NULL,
  `can_create` tinyint(4) DEFAULT NULL,
  `can_update` tinyint(4) DEFAULT NULL,
  `can_delete` tinyint(4) DEFAULT NULL,
  `self` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_data_group`
--

INSERT INTO `ohrm_user_role_data_group` (`id`, `user_role_id`, `data_group_id`, `can_read`, `can_create`, `can_update`, `can_delete`, `self`) VALUES
(1, 1, 1, 1, NULL, 1, NULL, 0),
(2, 1, 2, 1, 1, 1, 1, 0),
(3, 1, 3, 1, NULL, 1, NULL, 0),
(4, 1, 4, 1, NULL, 1, NULL, 0),
(5, 1, 5, 1, 1, 1, 1, 0),
(6, 1, 6, 1, NULL, 1, NULL, 0),
(7, 1, 7, 1, 1, 1, 1, 0),
(8, 1, 8, 1, 1, 1, 1, 0),
(9, 1, 9, 1, NULL, 1, NULL, 0),
(10, 1, 10, 1, 1, 1, 1, 0),
(11, 1, 11, 1, 1, 1, 1, 0),
(12, 1, 12, 1, NULL, 1, NULL, 0),
(13, 1, 13, 1, 1, 1, 1, 0),
(14, 1, 14, 1, 1, 1, 1, 0),
(15, 1, 15, 1, NULL, 1, NULL, 0),
(16, 1, 16, 1, NULL, 1, NULL, 0),
(17, 1, 17, 1, 1, 1, 1, 0),
(18, 1, 18, 1, NULL, 1, NULL, 0),
(19, 1, 19, 1, 1, 1, 1, 0),
(20, 1, 20, 1, 1, 1, 1, 0),
(21, 1, 21, 1, NULL, 1, NULL, 0),
(22, 1, 22, 1, NULL, 1, NULL, 0),
(23, 1, 23, 1, 1, 1, 1, 0),
(24, 1, 24, 1, NULL, 1, NULL, 0),
(25, 1, 25, 1, 1, 1, 1, 0),
(26, 1, 26, 1, 1, 1, 1, 0),
(27, 1, 27, 1, 1, 1, 1, 0),
(28, 1, 28, 1, NULL, 1, NULL, 0),
(29, 1, 29, 1, 1, 1, 1, 0),
(30, 1, 30, 1, 1, 1, 1, 0),
(31, 1, 31, 1, 1, 1, 1, 0),
(32, 1, 32, 1, 1, 1, 1, 0),
(33, 1, 33, 1, 1, 1, 1, 0),
(34, 1, 34, 1, 1, 1, 1, 0),
(35, 1, 35, 1, NULL, 1, NULL, 0),
(36, 1, 36, 1, 1, 1, 1, 0),
(37, 1, 37, 1, 1, 1, 1, 0),
(38, 1, 38, 1, NULL, 1, NULL, 0),
(39, 1, 39, 1, NULL, 1, 1, 0),
(40, 1, 40, 1, 1, 1, 1, 0),
(41, 1, 41, 1, NULL, NULL, NULL, 0),
(42, 1, 40, 1, 1, 1, 1, 1),
(43, 2, 1, 1, NULL, 1, NULL, 1),
(44, 2, 2, 1, 1, 1, 1, 1),
(45, 2, 3, 1, NULL, 1, NULL, 1),
(46, 2, 4, 1, NULL, 1, NULL, 1),
(47, 2, 5, 1, 1, 1, 1, 1),
(48, 2, 6, 1, NULL, 1, NULL, 1),
(49, 2, 7, 1, 1, 1, 1, 1),
(50, 2, 8, 1, 1, 1, 1, 1),
(51, 2, 9, 1, NULL, 1, NULL, 1),
(52, 2, 10, 1, 1, 1, 1, 1),
(53, 2, 11, 1, 1, 1, 1, 1),
(54, 2, 12, 1, NULL, 1, NULL, 1),
(55, 2, 13, 1, 1, 1, 1, 1),
(56, 2, 14, 1, 1, 1, 1, 1),
(57, 2, 15, 1, NULL, 1, NULL, 1),
(58, 2, 16, 1, NULL, NULL, NULL, 1),
(59, 2, 17, 1, 0, 0, 0, 1),
(60, 2, 18, 1, 0, 0, 0, 1),
(61, 2, 19, 1, NULL, NULL, NULL, 1),
(62, 2, 20, 1, 0, 0, 0, 1),
(63, 2, 21, 1, 0, 0, 0, 1),
(64, 2, 22, 1, NULL, NULL, NULL, 1),
(65, 2, 23, 1, 0, 0, 0, 1),
(66, 2, 24, 1, 0, 0, 0, 1),
(67, 2, 25, 1, NULL, NULL, NULL, 1),
(68, 2, 26, 1, NULL, NULL, NULL, 1),
(69, 2, 27, 1, 0, 0, 0, 1),
(70, 2, 28, 1, 0, 0, 0, 1),
(71, 2, 29, 1, 1, 1, 1, 1),
(72, 2, 30, 1, 1, 1, 1, 1),
(73, 2, 31, 1, 1, 1, 1, 1),
(74, 2, 32, 1, 1, 1, 1, 1),
(75, 2, 33, 1, 1, 1, 1, 1),
(76, 2, 34, 1, 1, 1, 1, 1),
(77, 2, 35, 1, NULL, 1, NULL, 1),
(78, 2, 36, 1, 1, 1, 1, 1),
(79, 2, 37, 1, 1, 1, 1, 1),
(80, 2, 38, 1, NULL, 1, NULL, 1),
(81, 2, 39, 1, NULL, 1, 1, 1),
(82, 2, 40, 1, 0, 0, 0, 1),
(83, 2, 41, 1, NULL, NULL, NULL, 1),
(84, 3, 1, 1, NULL, 1, NULL, 0),
(85, 3, 2, 1, 1, 1, 1, 0),
(86, 3, 3, 1, NULL, 1, NULL, 0),
(87, 3, 4, 1, NULL, 1, NULL, 0),
(88, 3, 5, 1, 1, 1, 1, 0),
(89, 3, 6, 1, NULL, 1, NULL, 0),
(90, 3, 7, 1, 1, 1, 1, 0),
(91, 3, 8, 1, 1, 1, 1, 0),
(92, 3, 9, 1, NULL, 1, NULL, 0),
(93, 3, 10, 1, 1, 1, 1, 0),
(94, 3, 11, 1, 1, 1, 1, 0),
(95, 3, 12, 1, NULL, 1, NULL, 0),
(96, 3, 13, 1, 1, 1, 1, 0),
(97, 3, 14, 1, 1, 1, 1, 0),
(98, 3, 15, 1, NULL, 1, NULL, 0),
(99, 3, 16, 1, NULL, NULL, NULL, 0),
(100, 3, 17, 1, 0, 0, 0, 0),
(101, 3, 18, 1, 0, 0, 0, 0),
(102, 3, 19, 0, 0, 0, 0, 0),
(103, 3, 20, 0, 0, 0, 0, 0),
(104, 3, 21, 0, 0, 0, 0, 0),
(105, 3, 22, 1, NULL, NULL, NULL, 0),
(106, 3, 23, 1, 0, 0, 0, 0),
(107, 3, 24, 1, 0, 0, 0, 0),
(108, 3, 25, 1, NULL, NULL, NULL, 0),
(109, 3, 26, 1, NULL, NULL, NULL, 0),
(110, 3, 27, 1, 0, 0, 0, 0),
(111, 3, 28, 1, 0, 0, 0, 0),
(112, 3, 29, 1, 1, 1, 1, 0),
(113, 3, 30, 1, 1, 1, 1, 0),
(114, 3, 31, 1, 1, 1, 1, 0),
(115, 3, 32, 1, 1, 1, 1, 0),
(116, 3, 33, 1, 1, 1, 1, 0),
(117, 3, 34, 1, 1, 1, 1, 0),
(118, 3, 35, 1, NULL, 1, NULL, 0),
(119, 3, 36, 1, 1, 1, 1, 0),
(120, 3, 37, 1, 1, 1, 1, 0),
(121, 3, 38, 1, NULL, 1, NULL, 0),
(122, 3, 39, 1, NULL, 1, 1, 0),
(123, 3, 40, 1, 0, 0, 0, 0),
(124, 3, 41, 1, NULL, NULL, NULL, 0),
(125, 3, 1, 1, NULL, 1, NULL, 1),
(126, 3, 2, 1, 1, 1, 1, 1),
(127, 3, 3, 1, NULL, 1, NULL, 1),
(128, 3, 4, 1, NULL, 1, NULL, 1),
(129, 3, 5, 1, 1, 1, 1, 1),
(130, 3, 6, 1, NULL, 1, NULL, 1),
(131, 3, 7, 1, 1, 1, 1, 1),
(132, 3, 8, 1, 1, 1, 1, 1),
(133, 3, 9, 1, NULL, 1, NULL, 1),
(134, 3, 10, 1, 1, 1, 1, 1),
(135, 3, 11, 1, 1, 1, 1, 1),
(136, 3, 12, 1, NULL, 1, NULL, 1),
(137, 3, 13, 1, 1, 1, 1, 1),
(138, 3, 14, 1, 1, 1, 1, 1),
(139, 3, 15, 1, NULL, 1, NULL, 1),
(140, 3, 16, 1, NULL, NULL, NULL, 1),
(141, 3, 17, 1, 0, 0, 0, 1),
(142, 3, 18, 1, 0, 0, 0, 1),
(143, 3, 19, 1, 0, 0, 0, 1),
(144, 3, 20, 1, 0, 0, 0, 1),
(145, 3, 21, 1, 0, 0, 0, 1),
(146, 3, 22, 1, NULL, NULL, NULL, 1),
(147, 3, 23, 1, 0, 0, 0, 1),
(148, 3, 24, 1, 0, 0, 0, 1),
(149, 3, 25, 1, NULL, NULL, NULL, 1),
(150, 3, 26, 1, NULL, NULL, NULL, 1),
(151, 3, 27, 1, 0, 0, 0, 1),
(152, 3, 28, 1, 0, 0, 0, 1),
(153, 3, 29, 1, 1, 1, 1, 1),
(154, 3, 30, 1, 1, 1, 1, 1),
(155, 3, 31, 1, 1, 1, 1, 1),
(156, 3, 32, 1, 1, 1, 1, 1),
(157, 3, 33, 1, 1, 1, 1, 1),
(158, 3, 34, 1, 1, 1, 1, 1),
(159, 3, 35, 1, NULL, 1, NULL, 1),
(160, 3, 36, 1, 1, 1, 1, 1),
(161, 3, 37, 1, 1, 1, 1, 1),
(162, 3, 38, 1, NULL, 1, NULL, 1),
(163, 3, 39, 1, NULL, 1, 1, 1),
(164, 3, 40, 1, 0, 0, 0, 1),
(165, 3, 41, 1, NULL, NULL, NULL, 1),
(166, 1, 42, 1, 1, 1, 1, 0),
(167, 2, 42, 0, 0, 0, 0, 0),
(168, 3, 42, 0, 0, 0, 0, 0),
(169, 1, 43, 1, 1, 1, 1, 0),
(170, 2, 43, 0, 0, 0, 0, 0),
(171, 3, 43, 0, 0, 0, 0, 0),
(172, 1, 44, 1, 1, 1, 1, 0),
(173, 2, 44, 0, 0, 0, 0, 0),
(174, 3, 44, 0, 0, 0, 0, 0),
(175, 1, 45, 1, 1, 1, 1, 0),
(176, 2, 45, 0, 0, 0, 0, 0),
(177, 3, 45, 0, 0, 0, 0, 0),
(178, 4, 45, 1, 0, 1, 0, 0),
(179, 1, 46, 1, 1, 1, 1, 0),
(180, 2, 46, 0, 0, 0, 0, 0),
(181, 3, 46, 0, 0, 0, 0, 0),
(182, 1, 47, 1, NULL, 1, NULL, 0),
(183, 2, 47, 0, 0, 0, 0, 0),
(184, 3, 47, 0, 0, 0, 0, 0),
(185, 1, 48, 1, 0, 0, 0, 0),
(186, 2, 48, 0, 0, 0, 0, 0),
(187, 2, 48, 1, 0, 0, 0, 1),
(188, 3, 48, 1, 0, 0, 0, 0),
(189, 1, 49, 1, 0, 0, 0, 0),
(190, 2, 49, 0, 0, 0, 0, 0),
(191, 3, 49, 0, 0, 0, 0, 0),
(192, 4, 49, 1, 0, 0, 0, 0),
(193, 1, 50, 1, 0, 0, 0, 0),
(194, 2, 50, 0, 0, 0, 0, 0),
(195, 3, 50, 1, 0, 0, 0, 0),
(196, 1, 51, 1, 0, 0, 0, 0),
(197, 2, 51, 0, 0, 0, 0, 0),
(198, 3, 51, 1, 0, 0, 0, 0),
(199, 1, 52, 1, NULL, 1, NULL, 0),
(200, 2, 52, 0, 0, 0, 0, 0),
(201, 3, 52, 0, 0, 0, 0, 0),
(202, 1, 53, 1, 1, 1, 1, 0),
(203, 2, 53, 0, 0, 0, 0, 0),
(204, 3, 53, 0, 0, 0, 0, 0),
(205, 1, 54, 1, 0, 1, 0, 0),
(206, 2, 54, 0, 0, 0, 0, 0),
(207, 3, 54, 0, 0, 0, 0, 0),
(208, 1, 55, 1, 1, 1, 1, 0),
(209, 2, 55, 0, 0, 0, 0, 0),
(210, 3, 55, 0, 0, 0, 0, 0),
(211, 1, 56, 1, 1, 1, 1, 0),
(212, 2, 56, 0, 0, 0, 0, 0),
(213, 3, 56, 0, 0, 0, 0, 0),
(214, 1, 57, 1, 1, 1, 1, 0),
(215, 6, 57, 1, 1, 1, 1, 0),
(216, 5, 57, 1, 0, 1, 0, 0),
(217, 1, 58, 1, 0, 0, 0, 0),
(218, 2, 58, 0, 0, 0, 0, 0),
(219, 2, 58, 1, 0, 0, 0, 1),
(220, 3, 58, 1, 0, 0, 0, 0),
(221, 1, 59, 1, 0, 0, 0, 0),
(222, 2, 59, 1, 0, 0, 0, 1),
(223, 3, 59, 1, 0, 0, 0, 0),
(224, 1, 60, 0, 1, 0, 0, 0),
(225, 2, 60, 0, 1, 0, 0, 1),
(226, 3, 60, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_role_screen`
--

CREATE TABLE `ohrm_user_role_screen` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `can_read` tinyint(1) NOT NULL DEFAULT '0',
  `can_create` tinyint(1) NOT NULL DEFAULT '0',
  `can_update` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_user_role_screen`
--

INSERT INTO `ohrm_user_role_screen` (`id`, `user_role_id`, `screen_id`, `can_read`, `can_create`, `can_update`, `can_delete`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 2, 2, 0, 0, 0, 0),
(4, 3, 2, 0, 0, 0, 0),
(5, 1, 3, 1, 1, 1, 1),
(6, 2, 3, 0, 0, 0, 0),
(7, 3, 3, 0, 0, 0, 0),
(8, 1, 4, 1, 1, 1, 1),
(9, 1, 5, 1, 1, 1, 1),
(10, 3, 5, 1, 0, 0, 0),
(11, 1, 6, 1, 0, 0, 1),
(12, 1, 7, 1, 1, 1, 1),
(13, 1, 8, 1, 1, 1, 1),
(14, 1, 9, 1, 1, 1, 1),
(15, 1, 10, 1, 1, 1, 1),
(16, 1, 11, 1, 1, 1, 1),
(17, 1, 12, 1, 1, 1, 1),
(18, 1, 13, 1, 1, 1, 1),
(19, 1, 14, 1, 1, 1, 1),
(20, 1, 16, 1, 1, 1, 0),
(21, 3, 16, 1, 1, 1, 0),
(22, 1, 17, 1, 1, 1, 0),
(23, 3, 17, 1, 1, 1, 0),
(24, 1, 18, 1, 1, 1, 0),
(25, 2, 18, 1, 0, 0, 0),
(26, 3, 18, 1, 0, 0, 0),
(27, 1, 19, 1, 1, 1, 1),
(28, 1, 20, 1, 1, 1, 1),
(29, 1, 21, 1, 1, 1, 1),
(30, 1, 22, 1, 1, 1, 1),
(31, 1, 23, 1, 1, 1, 1),
(32, 1, 24, 1, 1, 1, 1),
(33, 1, 25, 1, 1, 1, 1),
(34, 1, 26, 1, 1, 1, 1),
(35, 1, 27, 1, 1, 1, 1),
(36, 1, 28, 1, 1, 1, 1),
(37, 1, 29, 1, 1, 1, 1),
(38, 1, 30, 1, 1, 1, 1),
(39, 1, 31, 1, 1, 1, 1),
(40, 1, 32, 1, 1, 1, 1),
(41, 1, 33, 1, 1, 1, 1),
(42, 1, 34, 1, 1, 1, 1),
(43, 1, 35, 1, 1, 1, 1),
(44, 1, 36, 1, 1, 1, 1),
(45, 1, 37, 1, 1, 1, 1),
(46, 4, 37, 1, 0, 0, 0),
(47, 1, 38, 1, 1, 1, 1),
(48, 1, 39, 1, 1, 1, 1),
(49, 1, 40, 1, 1, 1, 1),
(50, 1, 41, 1, 1, 1, 1),
(51, 1, 42, 1, 1, 1, 1),
(52, 1, 43, 1, 1, 1, 1),
(53, 1, 44, 1, 1, 1, 1),
(54, 1, 45, 1, 1, 1, 1),
(55, 2, 46, 1, 1, 1, 1),
(56, 1, 47, 1, 1, 1, 1),
(57, 2, 48, 1, 1, 1, 0),
(58, 2, 49, 1, 1, 1, 1),
(59, 1, 50, 1, 1, 1, 1),
(60, 2, 51, 1, 1, 1, 1),
(61, 1, 52, 1, 1, 1, 1),
(62, 3, 52, 1, 1, 1, 1),
(63, 2, 53, 1, 1, 0, 0),
(64, 2, 54, 1, 1, 1, 1),
(65, 1, 55, 1, 1, 0, 1),
(66, 3, 55, 1, 1, 0, 0),
(67, 1, 56, 1, 1, 1, 1),
(68, 1, 57, 1, 1, 1, 1),
(69, 4, 57, 1, 1, 1, 1),
(70, 1, 58, 1, 1, 1, 1),
(71, 3, 58, 1, 1, 1, 1),
(72, 1, 59, 1, 1, 1, 1),
(73, 3, 59, 1, 1, 1, 1),
(74, 1, 60, 1, 1, 1, 1),
(75, 6, 60, 1, 1, 1, 1),
(76, 5, 60, 1, 0, 1, 0),
(77, 1, 61, 1, 1, 1, 1),
(78, 1, 67, 1, 1, 1, 1),
(79, 2, 67, 1, 0, 1, 0),
(80, 3, 67, 1, 0, 1, 0),
(81, 1, 68, 1, 1, 1, 1),
(82, 2, 68, 1, 0, 1, 0),
(83, 3, 68, 1, 0, 1, 0),
(84, 1, 69, 1, 1, 1, 1),
(85, 3, 69, 1, 0, 0, 0),
(86, 2, 70, 1, 0, 0, 0),
(87, 1, 71, 1, 0, 0, 1),
(88, 1, 72, 1, 1, 1, 0),
(89, 1, 73, 1, 0, 1, 0),
(90, 1, 74, 1, 1, 1, 1),
(91, 1, 75, 1, 1, 1, 1),
(92, 3, 75, 1, 1, 1, 1),
(93, 1, 76, 1, 1, 1, 1),
(94, 5, 76, 1, 1, 1, 1),
(95, 6, 76, 1, 1, 1, 1),
(96, 1, 78, 1, 0, 0, 0),
(97, 3, 78, 1, 0, 0, 0),
(98, 2, 79, 1, 0, 0, 0),
(99, 1, 80, 1, 1, 1, 1),
(100, 1, 81, 1, 1, 1, 1),
(101, 1, 82, 1, 1, 1, 1),
(102, 1, 83, 1, 1, 1, 1),
(103, 1, 84, 1, 1, 1, 1),
(104, 1, 85, 1, 1, 1, 1),
(105, 1, 86, 1, 1, 1, 1),
(106, 1, 87, 1, 1, 1, 1),
(107, 1, 88, 1, 1, 1, 1),
(108, 4, 88, 1, 1, 1, 1),
(109, 1, 89, 1, 1, 1, 1),
(110, 1, 90, 1, 1, 1, 1),
(111, 4, 90, 1, 1, 1, 1),
(112, 1, 91, 1, 1, 1, 1),
(113, 4, 91, 1, 1, 1, 1),
(114, 1, 92, 1, 1, 1, 1),
(115, 1, 93, 1, 1, 1, 1),
(116, 1, 94, 1, 1, 1, 1),
(117, 1, 95, 1, 1, 1, 1),
(118, 1, 96, 1, 1, 1, 1),
(119, 5, 96, 1, 1, 1, 1),
(120, 6, 96, 1, 1, 1, 1),
(121, 1, 97, 1, 1, 1, 1),
(122, 6, 97, 1, 1, 1, 1),
(123, 1, 98, 1, 1, 1, 1),
(124, 2, 98, 1, 1, 1, 1),
(125, 3, 98, 1, 1, 1, 1),
(126, 1, 99, 1, 0, 1, 0),
(127, 2, 99, 1, 0, 1, 0),
(128, 3, 99, 1, 0, 1, 0),
(129, 1, 100, 1, 0, 0, 0),
(130, 1, 101, 1, 1, 1, 1),
(131, 3, 101, 1, 1, 1, 1),
(132, 1, 102, 1, 1, 1, 1),
(133, 4, 102, 1, 1, 1, 1),
(134, 1, 103, 1, 0, 0, 0),
(135, 2, 103, 1, 0, 0, 0),
(136, 1, 104, 1, 1, 1, 0),
(137, 1, 105, 1, 1, 1, 1),
(138, 1, 107, 1, 1, 1, 0),
(139, 1, 109, 1, 1, 1, 0),
(140, 1, 111, 1, 1, 1, 1),
(141, 2, 110, 1, 0, 1, 0),
(142, 2, 108, 1, 1, 1, 0),
(143, 2, 106, 1, 0, 1, 0),
(144, 3, 109, 1, 1, 1, 0),
(145, 2, 109, 1, 1, 1, 0),
(146, 1, 112, 1, 1, 1, 1),
(147, 2, 112, 0, 0, 0, 0),
(148, 1, 113, 1, 1, 1, 1),
(149, 2, 113, 1, 1, 1, 0),
(150, 1, 114, 0, 0, 0, 0),
(151, 2, 114, 1, 0, 1, 0),
(152, 1, 115, 1, 1, 1, 0),
(153, 2, 115, 1, 0, 0, 0),
(154, 1, 116, 1, 1, 1, 1),
(155, 2, 116, 1, 1, 1, 1),
(156, 1, 117, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_user_selection_rule`
--

CREATE TABLE `ohrm_user_selection_rule` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `implementation_class` varchar(255) NOT NULL,
  `rule_xml_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_workflow_state_machine`
--

CREATE TABLE `ohrm_workflow_state_machine` (
  `id` bigint(20) NOT NULL,
  `workflow` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `resulting_state` varchar(255) NOT NULL,
  `roles_to_notify` text,
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT 'lowest priority 0'
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_workflow_state_machine`
--

INSERT INTO `ohrm_workflow_state_machine` (`id`, `workflow`, `state`, `role`, `action`, `resulting_state`, `roles_to_notify`, `priority`) VALUES
(1, '0', 'INITIAL', 'SYSTEM', '7', 'NOT SUBMITTED', '', 0),
(2, '0', 'SUBMITTED', 'ADMIN', '2', 'APPROVED', '', 0),
(3, '0', 'SUBMITTED', 'ADMIN', '3', 'REJECTED', '', 0),
(4, '0', 'SUBMITTED', 'ADMIN', '0', 'SUBMITTED', '', 0),
(5, '0', 'SUBMITTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(6, '0', 'SUBMITTED', 'SUPERVISOR', '2', 'APPROVED', '', 0),
(7, '0', 'SUBMITTED', 'SUPERVISOR', '3', 'REJECTED', '', 0),
(8, '0', 'SUBMITTED', 'SUPERVISOR', '5', 'SUBMITTED', '', 0),
(9, '0', 'SUBMITTED', 'SUPERVISOR', '0', 'SUBMITTED', '', 0),
(10, '0', 'SUBMITTED', 'ESS USER', '0', 'SUBMITTED', '', 0),
(11, '0', 'SUBMITTED', 'ESS USER', '5', 'SUBMITTED', '', 0),
(12, '0', 'NOT SUBMITTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(13, '0', 'NOT SUBMITTED', 'ESS USER', '5', 'NOT SUBMITTED', '', 0),
(15, '0', 'NOT SUBMITTED', 'ESS USER', '0', 'NOT SUBMITTED', '', 0),
(16, '0', 'NOT SUBMITTED', 'SUPERVISOR', '0', 'NOT SUBMITTED', '', 0),
(17, '0', 'NOT SUBMITTED', 'SUPERVISOR', '5', 'NOT SUBMITTED', '', 0),
(18, '0', 'NOT SUBMITTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(19, '0', 'NOT SUBMITTED', 'ADMIN', '0', 'NOT SUBMITTED', '', 0),
(20, '0', 'NOT SUBMITTED', 'ADMIN', '5', 'NOT SUBMITTED', '', 0),
(21, '0', 'NOT SUBMITTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(22, '0', 'REJECTED', 'ESS USER', '1', 'SUBMITTED', '', 0),
(23, '0', 'REJECTED', 'ESS USER', '0', 'REJECTED', '', 0),
(24, '0', 'REJECTED', 'ESS USER', '5', 'REJECTED', '', 0),
(25, '0', 'REJECTED', 'SUPERVISOR', '1', 'SUBMITTED', '', 0),
(26, '0', 'REJECTED', 'SUPERVISOR', '0', 'REJECTED', '', 0),
(27, '0', 'REJECTED', 'SUPERVISOR', '5', 'REJECTED', '', 0),
(28, '0', 'REJECTED', 'ADMIN', '0', 'REJECTED', '', 0),
(29, '0', 'REJECTED', 'ADMIN', '5', 'SUBMITTED', '', 0),
(30, '0', 'REJECTED', 'ADMIN', '1', 'SUBMITTED', '', 0),
(31, '0', 'APPROVED', 'ESS USER', '0', 'APPROVED', '', 0),
(32, '0', 'APPROVED', 'SUPERVISOR', '0', 'APPROVED', '', 0),
(33, '0', 'APPROVED', 'ADMIN', '0', 'APPROVED', '', 0),
(34, '0', 'APPROVED', 'ADMIN', '4', 'SUBMITTED', '', 0),
(35, '1', 'PUNCHED IN', 'ESS USER', '1', 'PUNCHED OUT', '', 0),
(36, '1', 'INITIAL', 'ESS USER', '0', 'PUNCHED IN', '', 0),
(37, '2', 'INITIAL', 'ADMIN', '1', 'APPLICATION INITIATED', '', 0),
(38, '2', 'APPLICATION INITIATED', 'ADMIN', '2', 'SHORTLISTED', '', 0),
(39, '2', 'APPLICATION INITIATED', 'ADMIN', '3', 'REJECTED', '', 0),
(40, '2', 'SHORTLISTED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(41, '2', 'SHORTLISTED', 'ADMIN', '3', 'REJECTED', '', 0),
(42, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '3', 'REJECTED', '', 0),
(43, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '5', 'INTERVIEW PASSED', '', 0),
(44, '2', 'INTERVIEW SCHEDULED', 'ADMIN', '6', 'INTERVIEW FAILED', '', 0),
(45, '2', 'INTERVIEW PASSED', 'ADMIN', '4', 'INTERVIEW SCHEDULED', '', 0),
(46, '2', 'INTERVIEW PASSED', 'ADMIN', '7', 'JOB OFFERED', '', 0),
(47, '2', 'INTERVIEW PASSED', 'ADMIN', '3', 'REJECTED', '', 0),
(48, '2', 'INTERVIEW FAILED', 'ADMIN', '3', 'REJECTED', '', 0),
(49, '2', 'JOB OFFERED', 'ADMIN', '8', 'OFFER DECLINED', '', 0),
(50, '2', 'JOB OFFERED', 'ADMIN', '3', 'REJECTED', '', 0),
(51, '2', 'JOB OFFERED', 'ADMIN', '9', 'HIRED', '', 0),
(52, '2', 'OFFER DECLINED', 'ADMIN', '3', 'REJECTED', '', 0),
(53, '2', 'INITIAL', 'HIRING MANAGER', '1', 'APPLICATION INITIATED', '', 0),
(54, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '2', 'SHORTLISTED', '', 0),
(55, '2', 'APPLICATION INITIATED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(56, '2', 'SHORTLISTED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(57, '2', 'SHORTLISTED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(58, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(59, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '5', 'INTERVIEW PASSED', '', 0),
(60, '2', 'INTERVIEW SCHEDULED', 'HIRING MANAGER', '6', 'INTERVIEW FAILED', '', 0),
(61, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '4', 'INTERVIEW SCHEDULED', '', 0),
(62, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '7', 'JOB OFFERED', '', 0),
(63, '2', 'INTERVIEW PASSED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(64, '2', 'INTERVIEW FAILED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(65, '2', 'JOB OFFERED', 'HIRING MANAGER', '8', 'OFFER DECLINED', '', 0),
(66, '2', 'JOB OFFERED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(67, '2', 'JOB OFFERED', 'HIRING MANAGER', '9', 'HIRED', '', 0),
(68, '2', 'OFFER DECLINED', 'HIRING MANAGER', '3', 'REJECTED', '', 0),
(69, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '5', 'INTERVIEW PASSED', '', 0),
(70, '2', 'INTERVIEW SCHEDULED', 'INTERVIEWER', '6', 'INTERVIEW FAILED', '', 0),
(71, '1', 'INITIAL', 'ADMIN', '5', 'PUNCHED IN', '', 0),
(72, '1', 'PUNCHED IN', 'ADMIN', '6', 'PUNCHED OUT', '', 0),
(73, '1', 'PUNCHED IN', 'ADMIN', '2', 'PUNCHED IN', '', 0),
(74, '1', 'PUNCHED IN', 'ADMIN', '7', 'N/A', '', 0),
(75, '1', 'PUNCHED OUT', 'ADMIN', '2', 'PUNCHED OUT', '', 0),
(76, '1', 'PUNCHED OUT', 'ADMIN', '3', 'PUNCHED OUT', '', 0),
(77, '1', 'PUNCHED OUT', 'ADMIN', '7', 'N/A', '', 0),
(78, '0', 'INITIAL', 'ADMIN', '7', 'NOT SUBMITTED', '', 0),
(79, '0', 'INITIAL', 'ESS USER', '7', 'NOT SUBMITTED', '', 0),
(80, '0', 'INITIAL', 'SUPERVISOR', '7', 'NOT SUBMITTED', '', 0),
(81, '3', 'NOT_EXIST', 'ADMIN', '1', 'ACTIVE', '', 0),
(82, '3', 'ACTIVE', 'ADMIN', '2', 'NOT_EXIST', '', 0),
(83, '3', 'ACTIVE', 'ADMIN', '3', 'TERMINATED', '', 0),
(84, '3', 'TERMINATED', 'ADMIN', '4', 'ACTIVE', '', 0),
(85, '3', 'TERMINATED', 'ADMIN', '5', 'NOT_EXIST', '', 0),
(86, '4', 'INITIAL', 'ESS', 'APPLY', 'PENDING APPROVAL', 'supervisor,subscriber', 0),
(87, '4', 'INITIAL', 'ADMIN', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(88, '4', 'INITIAL', 'SUPERVISOR', 'ASSIGN', 'SCHEDULED', 'ess,supervisor,subscriber', 0),
(89, '4', 'PENDING APPROVAL', 'ADMIN', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(90, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'APPROVE', 'SCHEDULED', 'ess,subscriber', 0),
(91, '4', 'PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(92, '4', 'PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(93, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(94, '4', 'PENDING APPROVAL', 'ADMIN', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(95, '4', 'PENDING APPROVAL', 'SUPERVISOR', 'REJECT', 'REJECTED', 'ess,subscriber', 0),
(96, '4', 'SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(97, '4', 'SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(98, '4', 'SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(99, '4', 'TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(100, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(101, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(102, '4', 'LEAVE TYPE DELETED PENDING APPROVAL', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(103, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ESS', 'CANCEL', 'CANCELLED', 'supervisor,subscriber', 0),
(104, '4', 'LEAVE TYPE DELETED SCHEDULED', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(105, '4', 'LEAVE TYPE DELETED SCHEDULED', 'SUPERVISOR', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0),
(106, '4', 'LEAVE TYPE DELETED TAKEN', 'ADMIN', 'CANCEL', 'CANCELLED', 'ess,subscriber', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_shift`
--

CREATE TABLE `ohrm_work_shift` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `hours_per_day` decimal(4,2) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ohrm_work_shift`
--

INSERT INTO `ohrm_work_shift` (`id`, `name`, `hours_per_day`, `start_time`, `end_time`) VALUES
(1, 'Day Shit', '8.00', '09:00:00', '17:00:00'),
(2, 'Night Shit', '5.00', '17:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_work_week`
--

CREATE TABLE `ohrm_work_week` (
  `id` int(10) unsigned NOT NULL,
  `operational_country_id` int(10) unsigned DEFAULT NULL,
  `mon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `wed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `thu` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sun` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ohrm_work_week`
--

INSERT INTO `ohrm_work_week` (`id`, `operational_country_id`, `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`) VALUES
(1, NULL, 0, 0, 0, 0, 0, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `ohrm_ws_consumer`
--

CREATE TABLE `ohrm_ws_consumer` (
  `app_id` int(10) unsigned NOT NULL,
  `app_token` varchar(10) NOT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_config`
--
ALTER TABLE `hs_hr_config`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hs_hr_country`
--
ALTER TABLE `hs_hr_country`
  ADD PRIMARY KEY (`cou_code`);

--
-- Indexes for table `hs_hr_currency_type`
--
ALTER TABLE `hs_hr_currency_type`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `hs_hr_custom_export`
--
ALTER TABLE `hs_hr_custom_export`
  ADD PRIMARY KEY (`export_id`),
  ADD KEY `emp_number` (`export_id`);

--
-- Indexes for table `hs_hr_custom_fields`
--
ALTER TABLE `hs_hr_custom_fields`
  ADD PRIMARY KEY (`field_num`),
  ADD KEY `emp_number` (`field_num`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_custom_import`
--
ALTER TABLE `hs_hr_custom_import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `emp_number` (`import_id`);

--
-- Indexes for table `hs_hr_district`
--
ALTER TABLE `hs_hr_district`
  ADD PRIMARY KEY (`district_code`);

--
-- Indexes for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD PRIMARY KEY (`emp_number`),
  ADD KEY `work_station` (`work_station`),
  ADD KEY `nation_code` (`nation_code`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `emp_status` (`emp_status`),
  ADD KEY `eeo_cat_code` (`eeo_cat_code`),
  ADD KEY `termination_id` (`termination_id`);

--
-- Indexes for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD PRIMARY KEY (`emp_number`,`eattach_id`),
  ADD KEY `screen` (`screen`);

--
-- Indexes for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sal_grd_code` (`sal_grd_code`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `payperiod_code` (`payperiod_code`);

--
-- Indexes for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD PRIMARY KEY (`emp_number`,`ec_seqno`);

--
-- Indexes for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD PRIMARY KEY (`emp_number`,`econ_extend_id`);

--
-- Indexes for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD PRIMARY KEY (`emp_number`,`ed_seqno`);

--
-- Indexes for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_id` (`salary_id`);

--
-- Indexes for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD PRIMARY KEY (`emp_number`,`eec_seqno`);

--
-- Indexes for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD PRIMARY KEY (`emp_number`,`emp_seqno`);

--
-- Indexes for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD PRIMARY KEY (`emp_number`,`lang_id`,`fluency`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indexes for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD PRIMARY KEY (`emp_number`,`location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD PRIMARY KEY (`emp_number`,`membship_code`),
  ADD KEY `membship_code` (`membship_code`);

--
-- Indexes for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD PRIMARY KEY (`emp_number`,`ep_seqno`);

--
-- Indexes for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD PRIMARY KEY (`erep_sup_emp_number`,`erep_sub_emp_number`,`erep_reporting_mode`),
  ADD KEY `erep_sub_emp_number` (`erep_sub_emp_number`),
  ADD KEY `erep_reporting_mode` (`erep_reporting_mode`);

--
-- Indexes for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD PRIMARY KEY (`emp_number`);

--
-- Indexes for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD PRIMARY KEY (`emp_number`,`eexp_seqno`);

--
-- Indexes for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD PRIMARY KEY (`jobtit_code`,`estat_code`),
  ADD KEY `estat_code` (`estat_code`);

--
-- Indexes for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `notification_type_id` (`notification_type_id`);

--
-- Indexes for table `hs_hr_module`
--
ALTER TABLE `hs_hr_module`
  ADD PRIMARY KEY (`mod_id`);

--
-- Indexes for table `hs_hr_payperiod`
--
ALTER TABLE `hs_hr_payperiod`
  ADD PRIMARY KEY (`payperiod_code`);

--
-- Indexes for table `hs_hr_pay_period`
--
ALTER TABLE `hs_hr_pay_period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_field` (`table_name`,`field_name`);

--
-- Indexes for table `ohrm_advanced_report`
--
ALTER TABLE `ohrm_advanced_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_attendance_record`
--
ALTER TABLE `ohrm_attendance_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id_state` (`employee_id`,`state`),
  ADD KEY `emp_id_time` (`employee_id`,`punch_in_utc_time`,`punch_out_utc_time`);

--
-- Indexes for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD PRIMARY KEY (`report_group_id`,`group_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `group_field_id` (`group_field_id`);

--
-- Indexes for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD PRIMARY KEY (`composite_display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datapoint_type_id` (`datapoint_type_id`);

--
-- Indexes for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_group_id` (`data_group_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD PRIMARY KEY (`display_field_id`),
  ADD KEY `report_group_id` (`report_group_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ohrm_email_name` (`name`);

--
-- Indexes for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`);

--
-- Indexes for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD PRIMARY KEY (`work_shift_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `education_id` (`education_id`);

--
-- Indexes for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD PRIMARY KEY (`emp_number`,`license_id`),
  ADD KEY `license_id` (`license_id`);

--
-- Indexes for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
  ADD PRIMARY KEY (`reporting_method_id`);

--
-- Indexes for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reason_id` (`reason_id`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD PRIMARY KEY (`filter_field_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_group_field`
--
ALTER TABLE `ohrm_group_field`
  ADD PRIMARY KEY (`group_field_id`);

--
-- Indexes for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_holiday_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`);

--
-- Indexes for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_person` (`added_person`);

--
-- Indexes for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `vacancy_id` (`vacancy_id`),
  ADD KEY `interview_id` (`interview_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD PRIMARY KEY (`candidate_id`,`vacancy_id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_vacancy_id` (`candidate_vacancy_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Indexes for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interview_id` (`interview_id`);

--
-- Indexes for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD PRIMARY KEY (`interview_id`,`interviewer_id`),
  ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_id` (`job_title_id`);

--
-- Indexes for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_title_code` (`job_title_code`),
  ADD KEY `hiring_manager_id` (`hiring_manager_id`);

--
-- Indexes for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vacancy_id` (`vacancy_id`);

--
-- Indexes for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_type_emp` (`leave_request_id`,`leave_type_id`,`emp_number`),
  ADD KEY `request_status` (`leave_request_id`,`status`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `adjustment_type` (`adjustment_type`);

--
-- Indexes for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_id` (`leave_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `entitlement_type` (`entitlement_type`),
  ADD KEY `created_by_id` (`created_by_id`);

--
-- Indexes for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entitlement_id` (`entitlement_id`),
  ADD KEY `leave_id` (`leave_id`);

--
-- Indexes for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `leave_type_id` (`leave_type_id`);

--
-- Indexes for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_request_id` (`leave_request_id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `created_by_emp_number` (`created_by_emp_number`);

--
-- Indexes for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operational_country_id` (`operational_country_id`);

--
-- Indexes for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_code` (`country_code`);

--
-- Indexes for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_oauth_access_token`
--
ALTER TABLE `ohrm_oauth_access_token`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `ohrm_oauth_authorization_code`
--
ALTER TABLE `ohrm_oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `ohrm_oauth_client`
--
ALTER TABLE `ohrm_oauth_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `ohrm_oauth_refresh_token`
--
ALTER TABLE `ohrm_oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `ohrm_oauth_user`
--
ALTER TABLE `ohrm_oauth_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD KEY `ohrm_user_identity_ibfk_1` (`user_id`),
  ADD KEY `ohrm_user_identity_ibfk_2` (`provider_id`);

--
-- Indexes for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_operational_country_hs_hr_country` (`country_code`);

--
-- Indexes for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD PRIMARY KEY (`pay_grade_id`,`currency_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_number` (`employee_number`);

--
-- Indexes for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_track_fk1_idx` (`emp_number`),
  ADD KEY `ohrm_performance_track_fk2_idx` (`added_by`);

--
-- Indexes for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_log_fk1_idx` (`performance_track_id`),
  ADD KEY `ohrm_performance_tracker_log_fk2_idx` (`reviewer_id`),
  ADD KEY `fk_ohrm_performance_tracker_log_1` (`user_id`);

--
-- Indexes for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk1_idx` (`performance_track_id`),
  ADD KEY `ohrm_performance_tracker_reviewer_fk2_idx` (`reviewer_id`);

--
-- Indexes for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
  ADD PRIMARY KEY (`project_id`,`customer_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD PRIMARY KEY (`project_id`,`emp_number`),
  ADD KEY `emp_number` (`emp_number`);

--
-- Indexes for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `report_group_id` (`report_group_id`);

--
-- Indexes for table `ohrm_report_group`
--
ALTER TABLE `ohrm_report_group`
  ADD PRIMARY KEY (`report_group_id`);

--
-- Indexes for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `ohrm_role_user_selection_rule`
--
ALTER TABLE `ohrm_role_user_selection_rule`
  ADD PRIMARY KEY (`user_role_id`,`selection_rule_id`);

--
-- Indexes for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
  ADD PRIMARY KEY (`id`,`composite_display_field_id`,`report_id`),
  ADD KEY `composite_display_field_id` (`composite_display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  ADD PRIMARY KEY (`id`,`display_field_id`,`report_id`),
  ADD KEY `display_field_id` (`display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
  ADD PRIMARY KEY (`report_id`,`filter_field_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `filter_field_id` (`filter_field_id`);

--
-- Indexes for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
  ADD PRIMARY KEY (`group_field_id`,`summary_display_field_id`,`report_id`),
  ADD KEY `group_field_id` (`group_field_id`),
  ADD KEY `summary_display_field_id` (`summary_display_field_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
  ADD PRIMARY KEY (`summary_display_field_id`),
  ADD KEY `display_field_group_id` (`display_field_group_id`);

--
-- Indexes for table `ohrm_timesheet`
--
ALTER TABLE `ohrm_timesheet`
  ADD PRIMARY KEY (`timesheet_id`);

--
-- Indexes for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
  ADD PRIMARY KEY (`timesheet_action_log_id`),
  ADD KEY `timesheet_id` (`timesheet_id`),
  ADD KEY `performed_by` (`performed_by`);

--
-- Indexes for table `ohrm_timesheet_item`
--
ALTER TABLE `ohrm_timesheet_item`
  ADD PRIMARY KEY (`timesheet_item_id`),
  ADD KEY `timesheet_id` (`timesheet_id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `emp_number` (`emp_number`),
  ADD KEY `modified_user_id` (`modified_user_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_role_name` (`name`);

--
-- Indexes for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `data_group_id` (`data_group_id`);

--
-- Indexes for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_id` (`user_role_id`),
  ADD KEY `screen_id` (`screen_id`);

--
-- Indexes for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ohrm_work_week_ohrm_operational_country` (`operational_country_id`);

--
-- Indexes for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
  ADD PRIMARY KEY (`app_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abstract_display_field`
--
ALTER TABLE `abstract_display_field`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hs_hr_province`
--
ALTER TABLE `hs_hr_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `hs_hr_unique_id`
--
ALTER TABLE `hs_hr_unique_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_beacon_notification`
--
ALTER TABLE `ohrm_beacon_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  MODIFY `composite_display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_customer`
--
ALTER TABLE `ohrm_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_datapoint_type`
--
ALTER TABLE `ohrm_datapoint_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_data_group`
--
ALTER TABLE `ohrm_data_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  MODIFY `display_field_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_education`
--
ALTER TABLE `ohrm_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_email`
--
ALTER TABLE `ohrm_email`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_configuration`
--
ALTER TABLE `ohrm_email_configuration`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_notification`
--
ALTER TABLE `ohrm_email_notification`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  MODIFY `work_shift_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_employment_status`
--
ALTER TABLE `ohrm_employment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_reporting_method`
--
ALTER TABLE `ohrm_emp_reporting_method`
  MODIFY `reporting_method_id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_emp_termination_reason`
--
ALTER TABLE `ohrm_emp_termination_reason`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_job_category`
--
ALTER TABLE `ohrm_job_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_job_title`
--
ALTER TABLE `ohrm_job_title`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_kpi`
--
ALTER TABLE `ohrm_kpi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_language`
--
ALTER TABLE `ohrm_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_leave_entitlement_type`
--
ALTER TABLE `ohrm_leave_entitlement_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `ohrm_leave_period_history`
--
ALTER TABLE `ohrm_leave_period_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_leave_status`
--
ALTER TABLE `ohrm_leave_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ohrm_license`
--
ALTER TABLE `ohrm_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_login`
--
ALTER TABLE `ohrm_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `ohrm_membership`
--
ALTER TABLE `ohrm_membership`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `ohrm_module`
--
ALTER TABLE `ohrm_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `ohrm_nationality`
--
ALTER TABLE `ohrm_nationality`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=195;
--
-- AUTO_INCREMENT for table `ohrm_openid_provider`
--
ALTER TABLE `ohrm_openid_provider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_organization_gen_info`
--
ALTER TABLE `ohrm_organization_gen_info`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_pay_grade`
--
ALTER TABLE `ohrm_pay_grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ohrm_plugin`
--
ALTER TABLE `ohrm_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_project`
--
ALTER TABLE `ohrm_project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  MODIFY `report_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_group`
--
ALTER TABLE `ohrm_reviewer_group`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `ohrm_skill`
--
ALTER TABLE `ohrm_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ohrm_subunit`
--
ALTER TABLE `ohrm_subunit`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_upgrade_history`
--
ALTER TABLE `ohrm_upgrade_history`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ohrm_user_role`
--
ALTER TABLE `ohrm_user_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `ohrm_user_selection_rule`
--
ALTER TABLE `ohrm_user_selection_rule`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ohrm_workflow_state_machine`
--
ALTER TABLE `ohrm_workflow_state_machine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `ohrm_work_shift`
--
ALTER TABLE `ohrm_work_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ohrm_ws_consumer`
--
ALTER TABLE `ohrm_ws_consumer`
  MODIFY `app_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hs_hr_employee`
--
ALTER TABLE `hs_hr_employee`
  ADD CONSTRAINT `hs_hr_employee_ibfk_1` FOREIGN KEY (`work_station`) REFERENCES `ohrm_subunit` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_2` FOREIGN KEY (`nation_code`) REFERENCES `ohrm_nationality` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_3` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_4` FOREIGN KEY (`emp_status`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_5` FOREIGN KEY (`eeo_cat_code`) REFERENCES `ohrm_job_category` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hs_hr_employee_ibfk_6` FOREIGN KEY (`termination_id`) REFERENCES `ohrm_emp_termination` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hs_hr_emp_attachment`
--
ALTER TABLE `hs_hr_emp_attachment`
  ADD CONSTRAINT `hs_hr_emp_attachment_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_basicsalary`
--
ALTER TABLE `hs_hr_emp_basicsalary`
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_1` FOREIGN KEY (`sal_grd_code`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_3` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_basicsalary_ibfk_4` FOREIGN KEY (`payperiod_code`) REFERENCES `hs_hr_payperiod` (`payperiod_code`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_children`
--
ALTER TABLE `hs_hr_emp_children`
  ADD CONSTRAINT `hs_hr_emp_children_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_contract_extend`
--
ALTER TABLE `hs_hr_emp_contract_extend`
  ADD CONSTRAINT `hs_hr_emp_contract_extend_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_dependents`
--
ALTER TABLE `hs_hr_emp_dependents`
  ADD CONSTRAINT `hs_hr_emp_dependents_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_directdebit`
--
ALTER TABLE `hs_hr_emp_directdebit`
  ADD CONSTRAINT `hs_hr_emp_directdebit_ibfk_1` FOREIGN KEY (`salary_id`) REFERENCES `hs_hr_emp_basicsalary` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_emergency_contacts`
--
ALTER TABLE `hs_hr_emp_emergency_contacts`
  ADD CONSTRAINT `hs_hr_emp_emergency_contacts_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_history_of_ealier_pos`
--
ALTER TABLE `hs_hr_emp_history_of_ealier_pos`
  ADD CONSTRAINT `hs_hr_emp_history_of_ealier_pos_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_language`
--
ALTER TABLE `hs_hr_emp_language`
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_language_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `ohrm_language` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_locations`
--
ALTER TABLE `hs_hr_emp_locations`
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `ohrm_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_locations_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_member_detail`
--
ALTER TABLE `hs_hr_emp_member_detail`
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_1` FOREIGN KEY (`membship_code`) REFERENCES `ohrm_membership` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_member_detail_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_passport`
--
ALTER TABLE `hs_hr_emp_passport`
  ADD CONSTRAINT `hs_hr_emp_passport_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_picture`
--
ALTER TABLE `hs_hr_emp_picture`
  ADD CONSTRAINT `hs_hr_emp_picture_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_reportto`
--
ALTER TABLE `hs_hr_emp_reportto`
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_1` FOREIGN KEY (`erep_sup_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_2` FOREIGN KEY (`erep_sub_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_reportto_ibfk_3` FOREIGN KEY (`erep_reporting_mode`) REFERENCES `ohrm_emp_reporting_method` (`reporting_method_id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_skill`
--
ALTER TABLE `hs_hr_emp_skill`
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_emp_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `ohrm_skill` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_us_tax`
--
ALTER TABLE `hs_hr_emp_us_tax`
  ADD CONSTRAINT `hs_hr_emp_us_tax_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_emp_work_experience`
--
ALTER TABLE `hs_hr_emp_work_experience`
  ADD CONSTRAINT `hs_hr_emp_work_experience_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_jobtit_empstat`
--
ALTER TABLE `hs_hr_jobtit_empstat`
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_1` FOREIGN KEY (`jobtit_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hs_hr_jobtit_empstat_ibfk_2` FOREIGN KEY (`estat_code`) REFERENCES `ohrm_employment_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hs_hr_mailnotifications`
--
ALTER TABLE `hs_hr_mailnotifications`
  ADD CONSTRAINT `hs_hr_mailnotifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_auth_provider_extra_details`
--
ALTER TABLE `ohrm_auth_provider_extra_details`
  ADD CONSTRAINT `ohrm_auth_provider_extra_details_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_available_group_field`
--
ALTER TABLE `ohrm_available_group_field`
  ADD CONSTRAINT `ohrm_available_group_field_ibfk_1` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`);

--
-- Constraints for table `ohrm_composite_display_field`
--
ALTER TABLE `ohrm_composite_display_field`
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_composite_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_datapoint`
--
ALTER TABLE `ohrm_datapoint`
  ADD CONSTRAINT `ohrm_datapoint_ibfk_1` FOREIGN KEY (`datapoint_type_id`) REFERENCES `ohrm_datapoint_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_data_group_screen`
--
ALTER TABLE `ohrm_data_group_screen`
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_1` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_data_group_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_display_field`
--
ALTER TABLE `ohrm_display_field`
  ADD CONSTRAINT `ohrm_display_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_display_field_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_display_field_group`
--
ALTER TABLE `ohrm_display_field_group`
  ADD CONSTRAINT `ohrm_display_field_group_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_processor`
--
ALTER TABLE `ohrm_email_processor`
  ADD CONSTRAINT `ohrm_email_processor_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_subscriber`
--
ALTER TABLE `ohrm_email_subscriber`
  ADD CONSTRAINT `ohrm_email_subscriber_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `ohrm_email_notification` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_email_template`
--
ALTER TABLE `ohrm_email_template`
  ADD CONSTRAINT `ohrm_email_template_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `ohrm_email` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_employee_work_shift`
--
ALTER TABLE `ohrm_employee_work_shift`
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_1` FOREIGN KEY (`work_shift_id`) REFERENCES `ohrm_work_shift` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_employee_work_shift_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_education`
--
ALTER TABLE `ohrm_emp_education`
  ADD CONSTRAINT `ohrm_emp_education_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_education_ibfk_2` FOREIGN KEY (`education_id`) REFERENCES `ohrm_education` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_license`
--
ALTER TABLE `ohrm_emp_license`
  ADD CONSTRAINT `ohrm_emp_license_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_emp_license_ibfk_2` FOREIGN KEY (`license_id`) REFERENCES `ohrm_license` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_emp_termination`
--
ALTER TABLE `ohrm_emp_termination`
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_1` FOREIGN KEY (`reason_id`) REFERENCES `ohrm_emp_termination_reason` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_emp_termination_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_filter_field`
--
ALTER TABLE `ohrm_filter_field`
  ADD CONSTRAINT `ohrm_filter_field_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_holiday`
--
ALTER TABLE `ohrm_holiday`
  ADD CONSTRAINT `fk_ohrm_holiday_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_home_page`
--
ALTER TABLE `ohrm_home_page`
  ADD CONSTRAINT `ohrm_home_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate`
--
ALTER TABLE `ohrm_job_candidate`
  ADD CONSTRAINT `ohrm_job_candidate_ibfk_1` FOREIGN KEY (`added_person`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_attachment`
--
ALTER TABLE `ohrm_job_candidate_attachment`
  ADD CONSTRAINT `ohrm_job_candidate_attachment_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_candidate_history`
--
ALTER TABLE `ohrm_job_candidate_history`
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_3` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_candidate_history_ibfk_4` FOREIGN KEY (`performed_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_candidate_vacancy`
--
ALTER TABLE `ohrm_job_candidate_vacancy`
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_candidate_vacancy_ibfk_2` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview`
--
ALTER TABLE `ohrm_job_interview`
  ADD CONSTRAINT `ohrm_job_interview_ibfk_1` FOREIGN KEY (`candidate_vacancy_id`) REFERENCES `ohrm_job_candidate_vacancy` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_job_interview_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `ohrm_job_candidate` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_attachment`
--
ALTER TABLE `ohrm_job_interview_attachment`
  ADD CONSTRAINT `ohrm_job_interview_attachment_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_interview_interviewer`
--
ALTER TABLE `ohrm_job_interview_interviewer`
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_1` FOREIGN KEY (`interview_id`) REFERENCES `ohrm_job_interview` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_interview_interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_specification_attachment`
--
ALTER TABLE `ohrm_job_specification_attachment`
  ADD CONSTRAINT `ohrm_job_specification_attachment_ibfk_1` FOREIGN KEY (`job_title_id`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_job_vacancy`
--
ALTER TABLE `ohrm_job_vacancy`
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_1` FOREIGN KEY (`job_title_code`) REFERENCES `ohrm_job_title` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_job_vacancy_ibfk_2` FOREIGN KEY (`hiring_manager_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_job_vacancy_attachment`
--
ALTER TABLE `ohrm_job_vacancy_attachment`
  ADD CONSTRAINT `ohrm_job_vacancy_attachment_ibfk_1` FOREIGN KEY (`vacancy_id`) REFERENCES `ohrm_job_vacancy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave`
--
ALTER TABLE `ohrm_leave`
  ADD CONSTRAINT `ohrm_leave_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_adjustment`
--
ALTER TABLE `ohrm_leave_adjustment`
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_3` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_adjustment_ibfk_4` FOREIGN KEY (`adjustment_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_comment`
--
ALTER TABLE `ohrm_leave_comment`
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_1` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_entitlement`
--
ALTER TABLE `ohrm_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_1` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_3` FOREIGN KEY (`entitlement_type`) REFERENCES `ohrm_leave_entitlement_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_ibfk_4` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_leave_entitlement_adjustment`
--
ALTER TABLE `ohrm_leave_entitlement_adjustment`
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_entitlement_adjustment_ibfk_2` FOREIGN KEY (`adjustment_id`) REFERENCES `ohrm_leave_adjustment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_leave_entitlement`
--
ALTER TABLE `ohrm_leave_leave_entitlement`
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_1` FOREIGN KEY (`entitlement_id`) REFERENCES `ohrm_leave_entitlement` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_leave_entitlement_ibfk_2` FOREIGN KEY (`leave_id`) REFERENCES `ohrm_leave` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request`
--
ALTER TABLE `ohrm_leave_request`
  ADD CONSTRAINT `ohrm_leave_request_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `ohrm_leave_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_request_comment`
--
ALTER TABLE `ohrm_leave_request_comment`
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_1` FOREIGN KEY (`leave_request_id`) REFERENCES `ohrm_leave_request` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_leave_request_comment_ibfk_3` FOREIGN KEY (`created_by_emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_leave_type`
--
ALTER TABLE `ohrm_leave_type`
  ADD CONSTRAINT `ohrm_leave_type_ibfk_1` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_location`
--
ALTER TABLE `ohrm_location`
  ADD CONSTRAINT `ohrm_location_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_menu_item`
--
ALTER TABLE `ohrm_menu_item`
  ADD CONSTRAINT `ohrm_menu_item_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_module_default_page`
--
ALTER TABLE `ohrm_module_default_page`
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_module_default_page_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_openid_user_identity`
--
ALTER TABLE `ohrm_openid_user_identity`
  ADD CONSTRAINT `ohrm_user_identity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `ohrm_user_identity_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `ohrm_openid_provider` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_operational_country`
--
ALTER TABLE `ohrm_operational_country`
  ADD CONSTRAINT `fk_ohrm_operational_country_hs_hr_country` FOREIGN KEY (`country_code`) REFERENCES `hs_hr_country` (`cou_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_pay_grade_currency`
--
ALTER TABLE `ohrm_pay_grade_currency`
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `hs_hr_currency_type` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_pay_grade_currency_ibfk_2` FOREIGN KEY (`pay_grade_id`) REFERENCES `ohrm_pay_grade` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_review`
--
ALTER TABLE `ohrm_performance_review`
  ADD CONSTRAINT `ohrm_performance_review_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_performance_track`
--
ALTER TABLE `ohrm_performance_track`
  ADD CONSTRAINT `ohrm_performance_track_fk1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_track_fk2` FOREIGN KEY (`added_by`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_log`
--
ALTER TABLE `ohrm_performance_tracker_log`
  ADD CONSTRAINT `fk_ohrm_performance_tracker_log_1` FOREIGN KEY (`user_id`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_log_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_performance_tracker_reviewer`
--
ALTER TABLE `ohrm_performance_tracker_reviewer`
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk1` FOREIGN KEY (`performance_track_id`) REFERENCES `ohrm_performance_track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ohrm_performance_tracker_reviewer_fk2` FOREIGN KEY (`reviewer_id`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ohrm_project_activity`
--
ALTER TABLE `ohrm_project_activity`
  ADD CONSTRAINT `ohrm_project_activity_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_project_admin`
--
ALTER TABLE `ohrm_project_admin`
  ADD CONSTRAINT `ohrm_project_admin_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `ohrm_project` (`project_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_project_admin_ibfk_2` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_report`
--
ALTER TABLE `ohrm_report`
  ADD CONSTRAINT `ohrm_report_ibfk_1` FOREIGN KEY (`report_group_id`) REFERENCES `ohrm_report_group` (`report_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer`
--
ALTER TABLE `ohrm_reviewer`
  ADD CONSTRAINT `ohrm_reviewer_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_reviewer_rating`
--
ALTER TABLE `ohrm_reviewer_rating`
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `ohrm_reviewer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_reviewer_rating_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `ohrm_performance_review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_screen`
--
ALTER TABLE `ohrm_screen`
  ADD CONSTRAINT `ohrm_screen_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ohrm_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_composite_display_field`
--
ALTER TABLE `ohrm_selected_composite_display_field`
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_composite_display_field_ibfk_2` FOREIGN KEY (`composite_display_field_id`) REFERENCES `ohrm_composite_display_field` (`composite_display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field`
--
ALTER TABLE `ohrm_selected_display_field`
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_ibfk_2` FOREIGN KEY (`display_field_id`) REFERENCES `ohrm_display_field` (`display_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_display_field_group`
--
ALTER TABLE `ohrm_selected_display_field_group`
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_display_field_group_ibfk_2` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_filter_field`
--
ALTER TABLE `ohrm_selected_filter_field`
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_filter_field_ibfk_2` FOREIGN KEY (`filter_field_id`) REFERENCES `ohrm_filter_field` (`filter_field_id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_selected_group_field`
--
ALTER TABLE `ohrm_selected_group_field`
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `ohrm_report` (`report_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_2` FOREIGN KEY (`group_field_id`) REFERENCES `ohrm_group_field` (`group_field_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_selected_group_field_ibfk_3` FOREIGN KEY (`summary_display_field_id`) REFERENCES `ohrm_summary_display_field` (`summary_display_field_id`);

--
-- Constraints for table `ohrm_summary_display_field`
--
ALTER TABLE `ohrm_summary_display_field`
  ADD CONSTRAINT `ohrm_summary_display_field_ibfk_1` FOREIGN KEY (`display_field_group_id`) REFERENCES `ohrm_display_field_group` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `ohrm_timesheet_action_log`
--
ALTER TABLE `ohrm_timesheet_action_log`
  ADD CONSTRAINT `ohrm_timesheet_action_log_ibfk_1` FOREIGN KEY (`performed_by`) REFERENCES `ohrm_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user`
--
ALTER TABLE `ohrm_user`
  ADD CONSTRAINT `ohrm_user_ibfk_1` FOREIGN KEY (`emp_number`) REFERENCES `hs_hr_employee` (`emp_number`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_ibfk_2` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`);

--
-- Constraints for table `ohrm_user_role_data_group`
--
ALTER TABLE `ohrm_user_role_data_group`
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_data_group_ibfk_2` FOREIGN KEY (`data_group_id`) REFERENCES `ohrm_data_group` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_user_role_screen`
--
ALTER TABLE `ohrm_user_role_screen`
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `ohrm_user_role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ohrm_user_role_screen_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `ohrm_screen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ohrm_work_week`
--
ALTER TABLE `ohrm_work_week`
  ADD CONSTRAINT `fk_ohrm_work_week_ohrm_operational_country` FOREIGN KEY (`operational_country_id`) REFERENCES `ohrm_operational_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `leave_taken_status_change` ON SCHEDULE EVERY 1 HOUR STARTS '2017-01-04 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
                        UPDATE hs_hr_leave SET leave_status = 3 WHERE leave_status = 2 AND leave_date < DATE(NOW());
                      END$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
