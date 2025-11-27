/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : kembara_smart

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 25/11/2025 16:24:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for description_of_table
-- ----------------------------
DROP TABLE IF EXISTS `description_of_table`;
CREATE TABLE `description_of_table`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TableCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `TableDesription` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of description_of_table
-- ----------------------------
INSERT INTO `description_of_table` VALUES (1, 'gi', 'general_information', 'basic data yang jarang sekali bertukar');
INSERT INTO `description_of_table` VALUES (2, 'ap', 'application_process', 'table yang terlibat dalam mana-mana pendaftaran');
INSERT INTO `description_of_table` VALUES (3, 'user', 'user', 'table yang terlibat dgn maklumat pengguna');

-- ----------------------------
-- Table structure for tbl_ap_agency
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ap_agency`;
CREATE TABLE `tbl_ap_agency`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AgencyName` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusAgency` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `AgencyBisnessNumber` int NULL DEFAULT NULL,
  `AgencyOfficialWebsite` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `AgencyCodeRegister` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `AgencyCorporationDate` datetime NULL DEFAULT NULL,
  `CompanyTypeID` int NULL DEFAULT NULL,
  `RegistrationTypeID` int NULL DEFAULT NULL,
  `AgencyTINNumber` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusAgency`(`StatusAgency` ASC) USING BTREE,
  INDEX `CompanyType`(`CompanyTypeID` ASC) USING BTREE,
  INDEX `RegisterType`(`RegistrationTypeID` ASC) USING BTREE,
  CONSTRAINT `CompanyType` FOREIGN KEY (`CompanyTypeID`) REFERENCES `tbl_gi_bisness` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `RegisterType` FOREIGN KEY (`RegistrationTypeID`) REFERENCES `tbl_gi_registration` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `StatusAgency` FOREIGN KEY (`StatusAgency`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_ap_agency
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ap_branch
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ap_branch`;
CREATE TABLE `tbl_ap_branch`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BranchName` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchAddress` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchPhone` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchMobile` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchFax` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchEmail` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusBranch` int NULL DEFAULT NULL,
  `BranchAgency` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchPoscode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `BranchDistrict` int NULL DEFAULT NULL,
  `BranchState` int NULL DEFAULT NULL,
  `BranchCountry` int NULL DEFAULT NULL,
  `ParlimenID` int NULL DEFAULT NULL,
  `DunID` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_ap_branch
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ap_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ap_status`;
CREATE TABLE `tbl_ap_status`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `JenisStatus` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `IDStatus` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IDStatus2`(`IDStatus` ASC) USING BTREE,
  CONSTRAINT `IDStatus2` FOREIGN KEY (`IDStatus`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_ap_status
-- ----------------------------
INSERT INTO `tbl_ap_status` VALUES (1, 'Lulus/Berjaya', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (2, 'Tidak Berjaya', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (3, 'Dalam Proses', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (4, 'Dalam Tindakan', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (5, 'Dalam Siasatan', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (6, 'Rayuan', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (7, 'KIV', 1, NULL);
INSERT INTO `tbl_ap_status` VALUES (8, 'Tamat', 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_bisness
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_bisness`;
CREATE TABLE `tbl_gi_bisness`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TypeOfBisness` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusBisness` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusBisness`(`StatusBisness` ASC) USING BTREE,
  CONSTRAINT `StatusBisness` FOREIGN KEY (`StatusBisness`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_bisness
-- ----------------------------
INSERT INTO `tbl_gi_bisness` VALUES (1, 'Enterprise', 1, NULL);
INSERT INTO `tbl_gi_bisness` VALUES (2, 'Sdn. Bhd.', 1, NULL);
INSERT INTO `tbl_gi_bisness` VALUES (3, 'Berhad', 1, NULL);
INSERT INTO `tbl_gi_bisness` VALUES (4, 'Goverment Agency', 1, NULL);
INSERT INTO `tbl_gi_bisness` VALUES (5, 'GLC', 1, NULL);
INSERT INTO `tbl_gi_bisness` VALUES (6, 'NGO', 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_country
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_country`;
CREATE TABLE `tbl_gi_country`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Country` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `CountryCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `CountryPhoneCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusCountry` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusCountry`(`StatusCountry` ASC) USING BTREE,
  CONSTRAINT `StatusCountry` FOREIGN KEY (`StatusCountry`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_country
-- ----------------------------
INSERT INTO `tbl_gi_country` VALUES (1, 'Afghanistan', 'AF', '+93', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (2, 'Albania', 'AL', '+355', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (3, 'Algeria', 'DZ', '+213', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (4, 'Andorra', 'AD', '+376', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (5, 'Angola', 'AO', '+244', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (6, 'Antigua and Barbuda', 'AG', '+1-268', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (7, 'Argentina', 'AR', '+54', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (8, 'Armenia', 'AM', '+374', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (9, 'Australia', 'AU', '+61', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (10, 'Austria', 'AT', '+43', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (11, 'Azerbaijan', 'AZ', '+994', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (12, 'Bahamas', 'BS', '+1-242', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (13, 'Bahrain', 'BH', '+973', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (14, 'Bangladesh', 'BD', '+880', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (15, 'Barbados', 'BB', '+1-246', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (16, 'Belarus', 'BY', '+375', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (17, 'Belgium', 'BE', '+32', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (18, 'Belize', 'BZ', '+501', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (19, 'Benin', 'BJ', '+229', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (20, 'Bhutan', 'BT', '+975', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (21, 'Bolivia', 'BO', '+591', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (22, 'Bosnia and Herzegovina', 'BA', '+387', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (23, 'Botswana', 'BW', '+267', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (24, 'Brazil', 'BR', '+55', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (25, 'Brunei', 'BN', '+673', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (26, 'Bulgaria', 'BG', '+359', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (27, 'Burkina Faso', 'BF', '+226', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (28, 'Burundi', 'BI', '+257', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (29, 'Cabo Verde', 'CV', '+238', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (30, 'Cambodia', 'KH', '+855', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (31, 'Cameroon', 'CM', '+237', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (32, 'Canada', 'CA', '+1', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (33, 'Central African Republic', 'CF', '+236', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (34, 'Chad', 'TD', '+235', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (35, 'Chile', 'CL', '+56', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (36, 'China', 'CN', '+86', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (37, 'Colombia', 'CO', '+57', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (38, 'Comoros', 'KM', '+269', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (39, 'Congo (Republic)', 'CG', '+242', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (40, 'Congo (DRC)', 'CD', '+243', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (41, 'Costa Rica', 'CR', '+506', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (42, 'Croatia', 'HR', '+385', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (43, 'Cuba', 'CU', '+53', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (44, 'Cyprus', 'CY', '+357', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (45, 'Czech Republic', 'CZ', '+420', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (46, 'Denmark', 'DK', '+45', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (47, 'Djibouti', 'DJ', '+253', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (48, 'Dominica', 'DM', '+1-767', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (49, 'Dominican Republic', 'DO', '+1-809 / 829 / 849', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (50, 'Ecuador', 'EC', '+593', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (51, 'Egypt', 'EG', '+20', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (52, 'El Salvador', 'SV', '+503', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (53, 'Equatorial Guinea', 'GQ', '+240', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (54, 'Eritrea', 'ER', '+291', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (55, 'Estonia', 'EE', '+372', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (56, 'Eswatini', 'SZ', '+268', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (57, 'Ethiopia', 'ET', '+251', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (58, 'Fiji', 'FJ', '+679', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (59, 'Finland', 'FI', '+358', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (60, 'France', 'FR', '+33', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (61, 'Gabon', 'GA', '+241', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (62, 'Gambia', 'GM', '+220', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (63, 'Georgia', 'GE', '+995', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (64, 'Germany', 'DE', '+49', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (65, 'Ghana', 'GH', '+233', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (66, 'Greece', 'GR', '+30', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (67, 'Grenada', 'GD', '+1-473', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (68, 'Guatemala', 'GT', '+502', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (69, 'Guinea', 'GN', '+224', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (70, 'Guinea-Bissau', 'GW', '+245', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (71, 'Guyana', 'GY', '+592', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (72, 'Haiti', 'HT', '+509', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (73, 'Honduras', 'HN', '+504', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (74, 'Hungary', 'HU', '+36', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (75, 'Iceland', 'IS', '+354', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (76, 'India', 'IN', '+91', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (77, 'Indonesia', 'ID', '+62', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (78, 'Iran', 'IR', '+98', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (79, 'Iraq', 'IQ', '+964', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (80, 'Ireland', 'IE', '+353', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (81, 'Israel', 'IL', '+972', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (82, 'Italy', 'IT', '+39', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (83, 'Jamaica', 'JM', '+1-876', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (84, 'Japan', 'JP', '+81', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (85, 'Jordan', 'JO', '+962', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (86, 'Kazakhstan', 'KZ', '+7', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (87, 'Kenya', 'KE', '+254', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (88, 'Kiribati', 'KI', '+686', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (89, 'Korea (South)', 'KR', '+82', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (90, 'Korea (North)', 'KP', '+850', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (91, 'Kuwait', 'KW', '+965', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (92, 'Kyrgyzstan', 'KG', '+996', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (93, 'Laos', 'LA', '+856', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (94, 'Latvia', 'LV', '+371', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (95, 'Lebanon', 'LB', '+961', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (96, 'Lesotho', 'LS', '+266', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (97, 'Liberia', 'LR', '+231', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (98, 'Libya', 'LY', '+218', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (99, 'Liechtenstein', 'LI', '+423', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (100, 'Lithuania', 'LT', '+370', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (101, 'Luxembourg', 'LU', '+352', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (102, 'Madagascar', 'MG', '+261', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (103, 'Malawi', 'MW', '+265', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (104, 'Malaysia', 'MY', '+60', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (105, 'Maldives', 'MV', '+960', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (106, 'Mali', 'ML', '+223', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (107, 'Malta', 'MT', '+356', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (108, 'Marshall Islands', 'MH', '+692', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (109, 'Mauritania', 'MR', '+222', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (110, 'Mauritius', 'MU', '+230', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (111, 'Mexico', 'MX', '+52', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (112, 'Micronesia', 'FM', '+691', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (113, 'Moldova', 'MD', '+373', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (114, 'Monaco', 'MC', '+377', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (115, 'Mongolia', 'MN', '+976', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (116, 'Montenegro', 'ME', '+382', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (117, 'Morocco', 'MA', '+212', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (118, 'Mozambique', 'MZ', '+258', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (119, 'Myanmar', 'MM', '+95', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (120, 'Namibia', 'NA', '+264', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (121, 'Nauru', 'NR', '+674', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (122, 'Nepal', 'NP', '+977', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (123, 'Netherlands', 'NL', '+31', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (124, 'New Zealand', 'NZ', '+64', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (125, 'Nicaragua', 'NI', '+505', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (126, 'Niger', 'NE', '+227', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (127, 'Nigeria', 'NG', '+234', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (128, 'North Macedonia', 'MK', '+389', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (129, 'Norway', 'NO', '+47', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (130, 'Oman', 'OM', '+968', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (131, 'Pakistan', 'PK', '+92', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (132, 'Palau', 'PW', '+680', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (133, 'Panama', 'PA', '+507', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (134, 'Papua New Guinea', 'PG', '+675', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (135, 'Paraguay', 'PY', '+595', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (136, 'Peru', 'PE', '+51', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (137, 'Philippines', 'PH', '+63', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (138, 'Poland', 'PL', '+48', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (139, 'Portugal', 'PT', '+351', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (140, 'Qatar', 'QA', '+974', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (141, 'Romania', 'RO', '+40', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (142, 'Russia', 'RU', '+7', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (143, 'Rwanda', 'RW', '+250', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (144, 'Saint Kitts and Nevis', 'KN', '+1-869', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (145, 'Saint Lucia', 'LC', '+1-758', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (146, 'Saint Vincent and the Grenadines', 'VC', '+1-784', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (147, 'Samoa', 'WS', '+685', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (148, 'San Marino', 'SM', '+378', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (149, 'Sao Tome and Principe', 'ST', '+239', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (150, 'Saudi Arabia', 'SA', '+966', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (151, 'Senegal', 'SN', '+221', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (152, 'Serbia', 'RS', '+381', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (153, 'Seychelles', 'SC', '+248', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (154, 'Sierra Leone', 'SL', '+232', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (155, 'Singapore', 'SG', '+65', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (156, 'Slovakia', 'SK', '+421', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (157, 'Slovenia', 'SI', '+386', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (158, 'Solomon Islands', 'SB', '+677', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (159, 'Somalia', 'SO', '+252', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (160, 'South Africa', 'ZA', '+27', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (161, 'South Sudan', 'SS', '+211', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (162, 'Spain', 'ES', '+34', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (163, 'Sri Lanka', 'LK', '+94', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (164, 'Sudan', 'SD', '+249', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (165, 'Suriname', 'SR', '+597', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (166, 'Sweden', 'SE', '+46', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (167, 'Switzerland', 'CH', '+41', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (168, 'Syria', 'SY', '+963', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (169, 'Taiwan', 'TW', '+886', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (170, 'Tajikistan', 'TJ', '+992', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (171, 'Tanzania', 'TZ', '+255', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (172, 'Thailand', 'TH', '+66', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (173, 'Timor-Leste', 'TL', '+670', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (174, 'Togo', 'TG', '+228', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (175, 'Tonga', 'TO', '+676', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (176, 'Trinidad and Tobago', 'TT', '+1-868', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (177, 'Tunisia', 'TN', '+216', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (178, 'Turkey', 'TR', '+90', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (179, 'Turkmenistan', 'TM', '+993', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (180, 'Tuvalu', 'TV', '+688', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (181, 'Uganda', 'UG', '+256', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (182, 'Ukraine', 'UA', '+380', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (183, 'United Arab Emirates', 'AE', '+971', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (184, 'United Kingdom', 'GB', '+44', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (185, 'United States', 'US', '+1', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (186, 'Uruguay', 'UY', '+598', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (187, 'Uzbekistan', 'UZ', '+998', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (188, 'Vanuatu', 'VU', '+678', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (189, 'Vatican City', 'VA', '+39', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (190, 'Venezuela', 'VE', '+58', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (191, 'Vietnam', 'VN', '+84', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (192, 'Yemen', 'YE', '+967', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (193, 'Zambia', 'ZM', '+260', 1, NULL);
INSERT INTO `tbl_gi_country` VALUES (194, 'Zimbabwe', 'ZW', '+263', 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_district
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_district`;
CREATE TABLE `tbl_gi_district`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DistrictName` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `DistrictCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `DistrictState` int NULL DEFAULT NULL,
  `StatusDistrict` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DistrictState`(`DistrictState` ASC) USING BTREE,
  INDEX `StatusDistrict`(`StatusDistrict` ASC) USING BTREE,
  CONSTRAINT `DistrictState` FOREIGN KEY (`DistrictState`) REFERENCES `tbl_gi_state` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `StatusDistrict` FOREIGN KEY (`StatusDistrict`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_district
-- ----------------------------
INSERT INTO `tbl_gi_district` VALUES (1, 'Batu Pahat', '01', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (2, 'Johor Bahru', '02', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (3, 'Kluang', '03', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (4, 'Kota Tinggi', '04', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (5, 'Mersing', '05', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (6, 'Muar', '06', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (7, 'Pontian', '07', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (8, 'Segamat', '08', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (9, 'Kayu Ara Pasong', '09', 1, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (10, 'Baling', '01', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (11, 'Bandar Baharu', '02', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (12, 'Kota Setar', '03', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (13, 'Kuala Muda', '04', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (14, 'Kubang Pasu', '05', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (15, 'Kulim', '06', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (16, 'Langkawi', '07', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (17, 'Padang Terap', '08', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (18, 'Sik', '09', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (19, 'Yan', '10', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (20, 'Pendang', '11', 2, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (21, 'Bachok', '01', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (22, 'Kota Bharu', '02', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (23, 'Machang', '03', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (24, 'Pasir Mas', '04', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (25, 'Pasir Puteh', '05', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (26, 'Tanah Merah', '06', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (27, 'Tumpat', '07', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (28, 'Gua Musang', '08', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (29, 'Kuala Krai', '09', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (30, 'Jeli', '10', 3, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (31, 'Alor Gajah (Melaka Utara)', '01', 4, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (32, 'Jasin (Melaka Selatan)', '02', 4, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (33, 'Melaka Tengah', '03', 4, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (34, 'Jelebu', '01', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (35, 'Kuala Pilah', '02', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (36, 'Port Dickson', '03', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (37, 'Rembau', '04', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (38, 'Seremban', '05', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (39, 'Tampin', '06', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (40, 'Jempol', '07', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (41, 'Gemas (Daerah Kecil)', '08', 5, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (42, 'Bentong', '01', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (43, 'Cameron Highlands', '02', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (44, 'Jerantut', '03', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (45, 'Kuantan', '04', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (46, 'Kuala Lipis', '05', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (47, 'Pekan', '06', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (48, 'Raub', '07', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (49, 'Temerloh', '08', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (50, 'Rompin', '09', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (51, 'Maran', '10', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (52, 'Bera', '11', 6, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (53, 'Seberang Prai Tengah (Bukit Mertajam)', '01', 7, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (54, 'Seberang Prai Utara (Butterworth)', '02', 7, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (55, 'Seberang Prai Selatan (Nibong Tebal)', '03', 7, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (56, 'Daerah Timur Laut', '04', 7, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (57, 'Daerah Barat Daya', '05', 7, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (58, 'Batang Padang', '01', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (59, 'Manjung', '02', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (60, 'Kinta', '03', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (61, 'Krian', '04', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (62, 'Kuala Kangsar', '05', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (63, 'Larut Dan Matang', '06', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (64, 'Hilir Perak', '07', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (65, 'Hulu Perak', '08', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (66, 'Perak Tengah', '09', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (67, 'Selama', '10', 8, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (68, 'Perlis', '01', 9, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (69, 'Gombak', '01', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (70, 'Klang', '02', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (71, 'Kuala Langat', '03', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (72, 'Kuala Selangor', '04', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (73, 'Petaling', '05', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (74, 'Sabak Bernam', '06', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (75, 'Sepang', '07', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (76, 'Hulu Langat', '08', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (77, 'Hulu Selangor', '09', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (78, 'Kuala Lumpur (Sebelum 1.2.1974)', '10', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (79, 'Ampang Jaya', '11', 10, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (80, 'Besut', '01', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (81, 'Dungun', '02', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (82, 'Kemaman', '03', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (83, 'Kuala Terengganu', '04', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (84, 'Marang', '05', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (85, 'Hulu Terengganu', '06', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (86, 'Setiu', '07', 11, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (87, 'Tawau', '01', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (88, 'Lahad Datu', '02', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (89, 'Semporna', '03', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (90, 'Sandakan', '04', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (91, 'Tongod', '05', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (92, 'Labut Dan Sugut', '06', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (93, 'Kota Kinabalu', '07', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (94, 'Ranau', '08', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (95, 'Kota Belud', '09', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (96, 'Tamparuli', '10', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (97, 'Penampang', '11', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (98, 'Papar', '12', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (99, 'Kudat', '13', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (100, 'Kota Marudu', '14', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (101, 'Pitas', '15', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (102, 'Beaufort/ DL Mampakur', '16', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (103, 'Menumbuk', '17', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (104, 'Sipitang', '18', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (105, 'Tenom', '19', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (106, 'Nabawan', '20', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (107, 'Keningau', '21', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (108, 'Tambunan', '22', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (109, 'Labuan (Sebelum 1.4.1984)', '23', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (110, 'Kunak', '24', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (111, 'Beluran', '25', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (112, 'Tenghilan', '26', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (113, 'Bundu Tuhan', '27', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (114, 'Menggatal/ Inanam', '28', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (115, 'Kinabatangan', '29', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (116, 'Banggi', '30', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (117, 'Tuaran', '31', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (118, 'Kuala Penyu', '32', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (119, 'Telupid', '33', 12, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (120, 'Kuching', '01', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (121, 'Bau', '02', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (122, 'Serian', '03', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (123, 'Simunjan', '04', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (124, 'Lundu', '05', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (125, 'Simanggang', '06', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (126, 'Lubok Antu', '07', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (127, 'Saribas/ Betong', '08', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (128, 'Kalaka', '09', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (129, 'Sibu', '10', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (130, 'Mukah', '11', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (131, 'Kanowit', '12', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (132, 'Oya/ Dalat', '13', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (133, 'Miri', '14', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (134, 'Bintulu', '15', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (135, 'Baram/ Marudi', '16', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (136, 'Limbang', '17', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (137, 'Lawas', '18', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (138, 'Sarikei', '19', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (139, 'Bintangor', '20', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (140, 'Matu', '21', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (141, 'Julau', '22', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (142, 'Kapit', '23', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (143, 'Song', '24', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (144, 'Belaga', '25', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (145, 'Samarahan', '26', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (146, 'Meradong', '27', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (147, 'Sri Aman/ Simanggang', '28', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (148, 'Debak (Daerah Kecil)', '30', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (149, 'Siburan (Daerah Kecil)', '31', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (150, 'Budu (Daerah Kecil)', '33', 13, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (151, 'Wilayah Persekutuan Kuala Lumpur', '01', 14, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (152, 'Wilayah Persekutuan Labuan', '01', 15, 1, NULL);
INSERT INTO `tbl_gi_district` VALUES (153, 'Wilayah Persekutuan Putrajaya', '01', 16, 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_dun
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_dun`;
CREATE TABLE `tbl_gi_dun`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DUN` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `DUNCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `DUNState` int NULL DEFAULT NULL,
  `StatusDUN` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `DUNState`(`DUNState` ASC) USING BTREE,
  INDEX `StatusDUN`(`StatusDUN` ASC) USING BTREE,
  CONSTRAINT `DUNState` FOREIGN KEY (`DUNState`) REFERENCES `tbl_gi_state` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `StatusDUN` FOREIGN KEY (`StatusDUN`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 588 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_dun
-- ----------------------------
INSERT INTO `tbl_gi_dun` VALUES (1, 'BULOH KASAP', 'N.01', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (2, 'JEMENTAH', 'N.02', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (3, 'PEMANIS', 'N.03', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (4, 'KEMELAH', 'N.04', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (5, 'TENANG', 'N.05', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (6, 'BEKOK', 'N.06', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (7, 'BUKIT KEPONG', 'N.07', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (8, 'BUKIT PASIR', 'N.08', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (9, 'GAMBIR', 'N.09', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (10, 'TANGKAK', 'N.10', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (11, 'SEROM', 'N.11', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (12, 'BENTAYAN', 'N.12', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (13, 'SIMPANG JERAM', 'N.13', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (14, 'BUKIT NANING', 'N.14', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (15, 'MAHARANI', 'N.15', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (16, 'SUNGAI BALANG', 'N.16', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (17, 'SEMERAH', 'N.17', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (18, 'SRI MEDAN', 'N.18', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (19, 'YONG PENG', 'N.19', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (20, 'SEMARANG', 'N.20', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (21, 'PARIT YAANI', 'N.21', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (22, 'PARIT RAJA', 'N.22', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (23, 'PENGGARAM', 'N.23', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (24, 'SENGGARANG', 'N.24', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (25, 'RENGIT', 'N.25', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (26, 'MACHAP', 'N.26', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (27, 'LAYANG-LAYANG', 'N.27', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (28, 'MENGKIBOL', 'N.28', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (29, 'MAHKOTA', 'N.29', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (30, 'PALOH', 'N.30', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (31, 'KAHANG', 'N.31', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (32, 'ENDAU', 'N.32', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (33, 'TENGGAROH', 'N.33', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (34, 'PANTI', 'N.34', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (35, 'PASIR RAJA', 'N.35', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (36, 'SEDILI', 'N.36', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (37, 'JOHOR LAMA', 'N.37', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (38, 'PENAWAR', 'N.38', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (39, 'TANJUNG SURAT', 'N.39', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (40, 'TIRAM', 'N.40', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (41, 'PUTERI WANGSA', 'N.41', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (42, 'JOHOR JAYA', 'N.42', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (43, 'PERMAS', 'N.43', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (44, 'LARKIN', 'N.44', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (45, 'STULANG', 'N.45', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (46, 'PERLING', 'N.46', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (47, 'KEMPAS', 'N.47', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (48, 'SKUDAI', 'N.48', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (49, 'KOTA ISKANDAR', 'N.49', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (50, 'BUKIT PERMAI', 'N.50', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (51, 'BUKIT BATU', 'N.51', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (52, 'SENAI', 'N.52', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (53, 'BENUT', 'N.53', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (54, 'PULAI SEBATANG', 'N.54', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (55, 'PEKAN NANAS', 'N.55', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (56, 'KUKUP', 'N.56', 1, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (57, 'AYER HANGAT', 'N.01', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (58, 'KUAH', 'N.02', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (59, 'KOTA SIPUTEH', 'N.03', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (60, 'AYER HITAM', 'N.04', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (61, 'BUKIT KAYU HITAM', 'N.05', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (62, 'JITRA', 'N.06', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (63, 'KUALA NERANG', 'N.07', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (64, 'PEDU', 'N.08', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (65, 'BUKIT LADA', 'N.09', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (66, 'BUKIT PINANG', 'N.10', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (67, 'DERGA', 'N.11', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (68, 'SUKA MENANTI', 'N.12', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (69, 'KOTA DARUL AMAN', 'N.13', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (70, 'ALOR MENGKUDU', 'N.14', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (71, 'ANAK BUKIT', 'N.15', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (72, 'KUBANG ROTAN', 'N.16', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (73, 'PENGKALAN KUNDOR', 'N.17', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (74, 'TOKAI', 'N.18', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (75, 'SUNGAI TIANG', 'N.19', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (76, 'SUNGAI LIMAU', 'N.20', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (77, 'GUAR CHEMPEDAK', 'N.21', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (78, 'GURUN', 'N.22', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (79, 'BELANTEK', 'N.23', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (80, 'JENERI', 'N.24', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (81, 'BUKIT SELAMBAU', 'N.25', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (82, 'TANJONG DAWAI', 'N.26', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (83, 'PANTAI MERDEKA', 'N.27', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (84, 'BAKAR ARANG', 'N.28', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (85, 'SIDAM', 'N.29', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (86, 'BAYU', 'N.30', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (87, 'KUPANG', 'N.31', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (88, 'KUALA KETIL', 'N.32', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (89, 'MERBAU PULAS', 'N.33', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (90, 'LUNAS', 'N.34', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (91, 'KULIM', 'N.35', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (92, 'BANDAR BAHARU', 'N.36', 2, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (93, 'PENGKALAN KUBOR', 'N.01', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (94, 'KELABORAN', 'N.02', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (95, 'PASIR PEKAN', 'N.03', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (96, 'WAKAF BHARU', 'N.04', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (97, 'KIJANG', 'N.05', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (98, 'CHEMPAKA', 'N.06', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (99, 'PANCHOR', 'N.07', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (100, 'TANJONG MAS', 'N.08', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (101, 'KOTA LAMA', 'N.09', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (102, 'BUNUT PAYONG', 'N.10', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (103, 'TENDONG', 'N.11', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (104, 'PENGKALAN PASIR', 'N.12', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (105, 'MERANTI', 'N.13', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (106, 'CHETOK', 'N.14', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (107, 'GUAL PERIOK', 'N.15', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (108, 'APAM PUTRA', 'N.16', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (109, 'SALOR', 'N.17', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (110, 'PASIR TUMBOH', 'N.18', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (111, 'DEMIT', 'N.19', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (112, 'TAWANG', 'N.20', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (113, 'PANTAI IRAMA', 'N.21', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (114, 'JELAWAT', 'N.22', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (115, 'MELOR', 'N.23', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (116, 'KADOK', 'N.24', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (117, 'KOK LANAS', 'N.25', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (118, 'BUKIT PANAU', 'N.26', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (119, 'GUAL IPOH', 'N.27', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (120, 'KEMAHANG', 'N.28', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (121, 'SELISING', 'N.29', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (122, 'LIMBONGAN', 'N.30', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (123, 'SEMERAK', 'N.31', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (124, 'GAAL', 'N.32', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (125, 'PULAI CHONDONG', 'N.33', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (126, 'TEMANGAN', 'N.34', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (127, 'KEMUNING', 'N.35', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (128, 'BUKIT BUNGA', 'N.36', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (129, 'AIR LANAS', 'N.37', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (130, 'KUALA BALAH', 'N.38', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (131, 'MENGKEBANG', 'N.39', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (132, 'GUCHIL', 'N.40', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (133, 'MANEK URAI', 'N.41', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (134, 'DABONG', 'N.42', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (135, 'NENGGIRI', 'N.43', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (136, 'PALOH', 'N.44', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (137, 'GALAS', 'N.45', 3, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (138, 'KUALA LINGGI', 'N.01', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (139, 'TANJUNG BIDARA', 'N.02', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (140, 'AYER LIMAU', 'N.03', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (141, 'LENDU', 'N.04', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (142, 'TABOH NANING', 'N.05', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (143, 'REMBIA', 'N.06', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (144, 'GADEK', 'N.07', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (145, 'MACHAP JAYA', 'N.08', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (146, 'DURIAN TUNGGAL', 'N.09', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (147, 'ASAHAN', 'N.10', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (148, 'SUNGAI UDANG', 'N.11', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (149, 'PANTAI KUNDOR', 'N.12', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (150, 'PAYA RUMPUT', 'N.13', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (151, 'KELEBANG', 'N.14', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (152, 'PENGKALAN BATU', 'N.15', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (153, 'AYER KEROH', 'N.16', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (154, 'BUKIT KATIL', 'N.17', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (155, 'AYER MOLEK', 'N.18', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (156, 'KESIDANG', 'N.19', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (157, 'KOTA LAKSAMANA', 'N.20', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (158, 'DUYONG', 'N.21', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (159, 'BANDAR HILIR', 'N.22', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (160, 'TELOK MAS', 'N.23', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (161, 'BEMBAN', 'N.24', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (162, 'RIM', 'N.25', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (163, 'SERKAM', 'N.26', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (164, 'MERLIMAU', 'N.27', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (165, 'SUNGAI RAMBAI', 'N.28', 4, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (166, 'CHENNAH', 'N.01', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (167, 'PERTANG', 'N.02', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (168, 'SUNGAI LUI', 'N.03', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (169, 'KLAWANG', 'N.04', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (170, 'SERTING', 'N.05', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (171, 'PALONG', 'N.06', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (172, 'JERAM PADANG', 'N.07', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (173, 'BAHAU', 'N.08', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (174, 'LENGGENG', 'N.09', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (175, 'NILAI', 'N.10', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (176, 'LOBAK', 'N.11', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (177, 'TEMIANG', 'N.12', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (178, 'SIKAMAT', 'N.13', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (179, 'AMPANGAN', 'N.14', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (180, 'JUASSEH', 'N.15', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (181, 'SERI MENANTI', 'N.16', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (182, 'SENALING', 'N.17', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (183, 'PILAH', 'N.18', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (184, 'JOHOL', 'N.19', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (185, 'LABU', 'N.20', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (186, 'BUKIT KEPAYANG', 'N.21', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (187, 'RAHANG', 'N.22', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (188, 'MAMBAU', 'N.23', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (189, 'SEREMBAN JAYA', 'N.24', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (190, 'PAROI', 'N.25', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (191, 'CHEMBONG', 'N.26', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (192, 'RANTAU', 'N.27', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (193, 'KOTA', 'N.28', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (194, 'CHUAH', 'N.29', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (195, 'LUKUT', 'N.30', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (196, 'BAGAN PINANG', 'N.31', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (197, 'LINGGI', 'N.32', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (198, 'SRI TANJUNG', 'N.33', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (199, 'GEMAS', 'N.34', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (200, 'GEMENCHEH', 'N.35', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (201, 'REPAH', 'N.36', 5, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (202, 'TANAH RATA', 'N.01', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (203, 'JELAI', 'N.02', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (204, 'PADANG TENGKU', 'N.03', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (205, 'CHEKA', 'N.04', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (206, 'BENTA', 'N.05', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (207, 'BATU TALAM', 'N.06', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (208, 'TRAS', 'N.07', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (209, 'DONG', 'N.08', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (210, 'TAHAN', 'N.09', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (211, 'DAMAK', 'N.10', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (212, 'PULAU TAWAR', 'N.11', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (213, 'BESERAH', 'N.12', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (214, 'SEMAMBU', 'N.13', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (215, 'TERUNTUM', 'N.14', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (216, 'TANJUNG LUMPUR', 'N.15', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (217, 'INDERAPURA', 'N.16', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (218, 'SUNGAI LEMBING', 'N.17', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (219, 'LEPAR', 'N.18', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (220, 'PANCHING', 'N.19', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (221, 'PULAU MANIS', 'N.20', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (222, 'PERAMU JAYA', 'N.21', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (223, 'BEBAR', 'N.22', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (224, 'CHINI', 'N.23', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (225, 'LUIT', 'N.24', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (226, 'KUALA SENTUL', 'N.25', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (227, 'CHENOR', 'N.26', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (228, 'JENDERAK', 'N.27', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (229, 'KERDAU', 'N.28', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (230, 'JENGKA', 'N.29', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (231, 'MENTAKAB', 'N.30', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (232, 'LANCHANG', 'N.31', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (233, 'KUALA SEMANTAN', 'N.32', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (234, 'BILUT', 'N.33', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (235, 'KETARI', 'N.34', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (236, 'SABAI', 'N.35', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (237, 'PELANGAI', 'N.36', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (238, 'GUAI', 'N.37', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (239, 'TRIANG', 'N.38', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (240, 'KEMAYAN', 'N.39', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (241, 'BUKIT IBAM', 'N.40', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (242, 'MUADZAM SHAH', 'N.41', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (243, 'TIOMAN', 'N.42', 6, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (244, 'PENAGA', 'N.01', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (245, 'BERTAM', 'N.02', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (246, 'PINANG TUNGGAL', 'N.03', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (247, 'PERMATANG BERANGAN', 'N.04', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (248, 'SUNGAI DUA', 'N.05', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (249, 'TELOK AYER TAWAR', 'N.06', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (250, 'SUNGAI PUYU', 'N.07', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (251, 'BAGAN JERMAL', 'N.08', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (252, 'BAGAN DALAM', 'N.09', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (253, 'SEBERANG JAYA', 'N.10', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (254, 'PERMATANG PASIR', 'N.11', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (255, 'PENANTI', 'N.12', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (256, 'BERAPIT', 'N.13', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (257, 'MACHANG BUBUK', 'N.14', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (258, 'PADANG LALANG', 'N.15', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (259, 'PERAI', 'N.16', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (260, 'BUKIT TENGAH', 'N.17', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (261, 'BUKIT TAMBUN', 'N.18', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (262, 'JAWI', 'N.19', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (263, 'SUNGAI BAKAP', 'N.20', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (264, 'SUNGAI ACHEH', 'N.21', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (265, 'TANJONG BUNGA', 'N.22', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (266, 'AIR PUTIH', 'N.23', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (267, 'KEBUN BUNGA', 'N.24', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (268, 'PULAU TIKUS', 'N.25', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (269, 'PADANG KOTA', 'N.26', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (270, 'PENGKALAN KOTA', 'N.27', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (271, 'KOMTAR', 'N.28', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (272, 'DATOK KERAMAT', 'N.29', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (273, 'SUNGAI PINANG', 'N.30', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (274, 'BATU LANCANG', 'N.31', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (275, 'SERI DELIMA', 'N.32', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (276, 'AIR ITAM', 'N.33', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (277, 'PAYA TERUBONG', 'N.34', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (278, 'BATU UBAN', 'N.35', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (279, 'PANTAI JEREJAK', 'N.36', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (280, 'BATU MAUNG', 'N.37', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (281, 'BAYAN LEPAS', 'N.38', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (282, 'PULAU BETONG', 'N.39', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (283, 'TELOK BAHANG', 'N.40', 7, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (284, 'PENGKALAN HULU', 'N.01', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (285, 'TEMENGOR', 'N.02', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (286, 'KENERING', 'N.03', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (287, 'KOTA TAMPAN', 'N.04', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (288, 'SELAMA', 'N.05', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (289, 'KUBU GAJAH', 'N.06', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (290, 'BATU KURAU', 'N.07', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (291, 'TITI SERONG', 'N.08', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (292, 'KUALA KURAU', 'N.09', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (293, 'ALOR PONGSU', 'N.10', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (294, 'GUNONG SEMANGGOL', 'N.11', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (295, 'SELINSING', 'N.12', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (296, 'KUALA SEPETANG', 'N.13', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (297, 'CHANGKAT JERING', 'N.14', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (298, 'TRONG', 'N.15', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (299, 'KAMUNTING', 'N.16', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (300, 'POKOK ASSAM', 'N.17', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (301, 'AULONG', 'N.18', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (302, 'CHENDEROH', 'N.19', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (303, 'LUBOK MERBAU', 'N.20', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (304, 'LINTANG', 'N.21', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (305, 'JALONG', 'N.22', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (306, 'MANJOI', 'N.23', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (307, 'HULU KINTA', 'N.24', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (308, 'CANNING', 'N.25', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (309, 'TEBING TINGGI', 'N.26', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (310, 'PASIR PINJI', 'N.27', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (311, 'BERCHAM', 'N.28', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (312, 'KEPAYANG', 'N.29', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (313, 'BUNTONG', 'N.30', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (314, 'JELAPANG', 'N.31', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (315, 'MENGLEMBU', 'N.32', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (316, 'TRONOH', 'N.33', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (317, 'BUKIT CHANDAN', 'N.34', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (318, 'MANONG', 'N.35', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (319, 'PENGKALAN BAHARU', 'N.36', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (320, 'PANTAI REMIS', 'N.37', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (321, 'ASTAKA', 'N.38', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (322, 'BELANJA', 'N.39', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (323, 'BOTA', 'N.40', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (324, 'MALIM NAWAR', 'N.41', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (325, 'KERANJI', 'N.42', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (326, 'TUALANG SEKAH', 'N.43', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (327, 'SUNGAI RAPAT', 'N.44', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (328, 'SIMPANG PULAI', 'N.45', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (329, 'TEJA', 'N.46', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (330, 'CHENDERIANG', 'N.47', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (331, 'AYER KUNING', 'N.48', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (332, 'SUNGAI MANIK', 'N.49', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (333, 'KAMPONG GAJAH', 'N.50', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (334, 'PASIR PANJANG', 'N.51', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (335, 'PANGKOR', 'N.52', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (336, 'RUNGKUP', 'N.53', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (337, 'HUTAN MELINTANG', 'N.54', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (338, 'PASIR BEDAMAR', 'N.55', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (339, 'CHANGKAT JONG', 'N.56', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (340, 'SUNGKAI', 'N.57', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (341, 'SLIM', 'N.58', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (342, 'BEHRANG', 'N.59', 8, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (343, 'TITI TINGGI', 'N.01', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (344, 'BESERI', 'N.02', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (345, 'CHUPING', 'N.03', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (346, 'MATA AYER', 'N.04', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (347, 'SANTAN', 'N.05', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (348, 'BINTONG', 'N.06', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (349, 'SENA', 'N.07', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (350, 'INDERA KAYANGAN', 'N.08', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (351, 'KUALA PERLIS', 'N.09', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (352, 'KAYANG', 'N.10', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (353, 'PAUH', 'N.11', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (354, 'TAMBUN TULANG', 'N.12', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (355, 'GUAR SANJI', 'N.13', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (356, 'SIMPANG EMPAT', 'N.14', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (357, 'SANGLANG', 'N.15', 9, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (358, 'SUNGAI AIR TAWAR', 'N.01', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (359, 'SABAK', 'N.02', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (360, 'SUNGAI PANJANG', 'N.03', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (361, 'SEKINCHAN', 'N.04', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (362, 'HULU BERNAM', 'N.05', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (363, 'KUALA KUBU BAHARU', 'N.06', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (364, 'BATANG KALI', 'N.07', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (365, 'SUNGAI BURONG', 'N.08', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (366, 'PERMATANG', 'N.09', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (367, 'BUKIT MELAWATI', 'N.10', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (368, 'IJOK', 'N.11', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (369, 'JERAM', 'N.12', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (370, 'KUANG', 'N.13', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (371, 'RAWANG', 'N.14', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (372, 'TAMAN TEMPLER', 'N.15', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (373, 'SUNGAI TUA', 'N.16', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (374, 'GOMBAK SETIA', 'N.17', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (375, 'HULU KELANG', 'N.18', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (376, 'BUKIT ANTARABANGSA', 'N.19', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (377, 'LEMBAH JAYA', 'N.20', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (378, 'PANDAN INDAH', 'N.21', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (379, 'TERATAI', 'N.22', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (380, 'DUSUN TUA', 'N.23', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (381, 'SEMENYIH', 'N.24', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (382, 'KAJANG', 'N.25', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (383, 'SUNGAI RAMAL', 'N.26', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (384, 'BALAKONG', 'N.27', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (385, 'SERI KEMBANGAN', 'N.28', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (386, 'SERI SERDANG', 'N.29', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (387, 'KINRARA', 'N.30', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (388, 'SUBANG JAYA', 'N.31', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (389, 'SERI SETIA', 'N.32', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (390, 'TAMAN MEDAN', 'N.33', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (391, 'BUKIT GASING', 'N.34', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (392, 'KAMPUNG TUNKU', 'N.35', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (393, 'BANDAR UTAMA', 'N.36', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (394, 'BUKIT LANJAN', 'N.37', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (395, 'PAYA JARAS', 'N.38', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (396, 'KOTA DAMANSARA', 'N.39', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (397, 'KOTA ANGGERIK', 'N.40', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (398, 'BATU TIGA', 'N.41', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (399, 'MERU', 'N.42', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (400, 'SEMENTA', 'N.43', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (401, 'SELAT KLANG', 'N.44', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (402, 'BANDAR BARU KLANG', 'N.45', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (403, 'PELABUHAN KLANG', 'N.46', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (404, 'PANDAMARAN', 'N.47', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (405, 'SENTOSA', 'N.48', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (406, 'SUNGAI KANDIS', 'N.49', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (407, 'KOTA KEMUNING', 'N.50', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (408, 'SIJANGKANG', 'N.51', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (409, 'BANTING', 'N.52', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (410, 'MORIB', 'N.53', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (411, 'TANJONG SEPAT', 'N.54', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (412, 'DENGKIL', 'N.55', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (413, 'SUNGAI PELEK', 'N.56', 10, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (414, 'KUALA BESUT', 'N.01', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (415, 'KOTA PUTERA', 'N.02', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (416, 'JERTIH', 'N.03', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (417, 'HULU BESUT', 'N.04', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (418, 'JABI', 'N.05', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (419, 'PERMAISURI', 'N.06', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (420, 'LANGKAP', 'N.07', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (421, 'BATU RAKIT', 'N.08', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (422, 'TEPUH', 'N.09', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (423, 'BULUH GADING', 'N.10', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (424, 'SEBERANG TAKIR', 'N.11', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (425, 'BUKIT TUNGGAL', 'N.12', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (426, 'WAKAF MEMPELAM', 'N.13', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (427, 'BANDAR', 'N.14', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (428, 'LADANG', 'N.15', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (429, 'BATU BURUK', 'N.16', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (430, 'ALUR LIMBAT', 'N.17', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (431, 'BUKIT PAYUNG', 'N.18', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (432, 'RU RENDANG', 'N.19', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (433, 'PENGKALAN BERANGAN', 'N.20', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (434, 'TELEMUNG', 'N.21', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (435, 'MANIR', 'N.22', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (436, 'KUALA BERANG', 'N.23', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (437, 'AJIL', 'N.24', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (438, 'BUKIT BESI', 'N.25', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (439, 'RANTAU ABANG', 'N.26', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (440, 'SURA', 'N.27', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (441, 'PAKA', 'N.28', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (442, 'KEMASIK', 'N.29', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (443, 'KIJAL', 'N.30', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (444, 'CUKAI', 'N.31', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (445, 'AIR PUTIH', 'N.32', 11, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (446, 'BANGGI', 'N.01', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (447, 'TANJONG KAPOR', 'N.02', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (448, 'PITAS', 'N.03', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (449, 'MATUNGGONG', 'N.04', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (450, 'TANDEK', 'N.05', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (451, 'TEMPASUK', 'N.06', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (452, 'KADAMAIAN', 'N.07', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (453, 'USUKAN', 'N.08', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (454, 'TAMPARULI', 'N.09', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (455, 'SULAMAN', 'N.10', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (456, 'KIULU', 'N.11', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (457, 'KARAMBUNAI', 'N.12', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (458, 'INANAM', 'N.13', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (459, 'LIKAS', 'N.14', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (460, 'API-API', 'N.15', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (461, 'LUYANG', 'N.16', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (462, 'TANJONG ARU', 'N.17', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (463, 'PETAGAS', 'N.18', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (464, 'KAPAYAN', 'N.19', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (465, 'MOYOG', 'N.20', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (466, 'KAWANG', 'N.21', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (467, 'PANTAI MANIS', 'N.22', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (468, 'BONGAWAN', 'N.23', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (469, 'MEMBAKUT', 'N.24', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (470, 'KLIAS', 'N.25', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (471, 'KUALA PENYU', 'N.26', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (472, 'LUMADAN', 'N.27', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (473, 'SINDUMIN', 'N.28', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (474, 'KUNDASANG', 'N.29', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (475, 'KARANAAN', 'N.30', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (476, 'PAGINATAN', 'N.31', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (477, 'TAMBUNAN', 'N.32', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (478, 'BINGKOR', 'N.33', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (479, 'LIAWAN', 'N.34', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (480, 'MELALAP', 'N.35', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (481, 'KEMABONG', 'N.36', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (482, 'SOOK', 'N.37', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (483, 'NABAWAN', 'N.38', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (484, 'SUGUT', 'N.39', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (485, 'LABUK', 'N.40', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (486, 'GUM-GUM', 'N.41', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (487, 'SUNGAI SIBUGA', 'N.42', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (488, 'SEKONG', 'N.43', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (489, 'KARAMUNTING', 'N.44', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (490, 'ELOPURA', 'N.45', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (491, 'TANJONG PAPAT', 'N.46', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (492, 'KUAMUT', 'N.47', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (493, 'SUKAU', 'N.48', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (494, 'TUNGKU', 'N.49', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (495, 'LAHAD DATU', 'N.50', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (496, 'KUNAK', 'N.51', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (497, 'SULABAYAN', 'N.52', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (498, 'SENALLANG', 'N.53', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (499, 'BUGAYA', 'N.54', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (500, 'BALUNG', 'N.55', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (501, 'APAS', 'N.56', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (502, 'SRI TANJONG', 'N.57', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (503, 'MEROTAI', 'N.58', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (504, 'TANJONG BATU', 'N.59', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (505, 'SEBATIK', 'N.60', 12, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (506, 'OPAR', 'N.01', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (507, 'TASIK BIRU', 'N.02', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (508, 'TANJONG DATU', 'N.03', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (509, 'PANTAI DAMAI', 'N.04', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (510, 'DEMAK LAUT', 'N.05', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (511, 'TUPONG', 'N.06', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (512, 'SAMARIANG', 'N.07', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (513, 'SATOK', 'N.08', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (514, 'PADUNGAN', 'N.09', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (515, 'PENDING', 'N.10', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (516, 'BATU LINTANG', 'N.11', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (517, 'KOTA SENTOSA', 'N.12', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (518, 'BATU KITANG', 'N.13', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (519, 'BATU KAWAH', 'N.14', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (520, 'ASAJAYA', 'N.15', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (521, 'MUARA TUANG', 'N.16', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (522, 'STAKAN', 'N.17', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (523, 'SEREMBU', 'N.18', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (524, 'MAMBONG', 'N.19', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (525, 'TARAT', 'N.20', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (526, 'TEBEDU', 'N.21', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (527, 'KEDUP', 'N.22', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (528, 'BUKIT SEMUJA', 'N.23', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (529, 'SADONG JAYA', 'N.24', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (530, 'SIMUNJAN', 'N.25', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (531, 'GEDONG', 'N.26', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (532, 'SEBUYAU', 'N.27', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (533, 'LINGGA', 'N.28', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (534, 'BETING MARO', 'N.29', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (535, 'BALAI RINGIN', 'N.30', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (536, 'BUKIT BEGUNAN', 'N.31', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (537, 'SIMANGGANG', 'N.32', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (538, 'ENGKILILI', 'N.33', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (539, 'BATANG AI', 'N.34', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (540, 'SARIBAS', 'N.35', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (541, 'LAYAR', 'N.36', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (542, 'BUKIT SABAN', 'N.37', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (543, 'KALAKA', 'N.38', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (544, 'KRIAN', 'N.39', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (545, 'KABONG', 'N.40', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (546, 'KUALA RAJANG', 'N.41', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (547, 'SEMOP', 'N.42', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (548, 'DARO', 'N.43', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (549, 'JEMORENG', 'N.44', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (550, 'REPOK', 'N.45', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (551, 'MERADONG', 'N.46', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (552, 'PAKAN', 'N.47', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (553, 'MELUAN', 'N.48', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (554, 'NGEMAH', 'N.49', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (555, 'MACHAN', 'N.50', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (556, 'BUKIT ASSEK', 'N.51', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (557, 'DUDONG', 'N.52', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (558, 'BAWANG ASSAN', 'N.53', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (559, 'PELAWAN', 'N.54', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (560, 'NANGKA', 'N.55', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (561, 'DALAT', 'N.56', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (562, 'TELLIAN', 'N.57', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (563, 'BALINGIAN', 'N.58', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (564, 'TAMIN', 'N.59', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (565, 'KAKUS', 'N.60', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (566, 'PELAGUS', 'N.61', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (567, 'KATIBAS', 'N.62', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (568, 'BUKIT GORAM', 'N.63', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (569, 'BALEH', 'N.64', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (570, 'BELAGA', 'N.65', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (571, 'MURUM', 'N.66', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (572, 'JEPAK', 'N.67', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (573, 'TANJONG BATU', 'N.68', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (574, 'KEMENA', 'N.69', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (575, 'SAMALAJU', 'N.70', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (576, 'BEKENU', 'N.71', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (577, 'LAMBIR', 'N.72', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (578, 'PIASAU', 'N.73', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (579, 'PUJUT', 'N.74', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (580, 'SENADIN', 'N.75', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (581, 'MARUDI', 'N.76', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (582, 'TELANG USAN', 'N.77', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (583, 'MULU', 'N.78', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (584, 'BUKIT KOTA', 'N.79', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (585, 'BATU DANAU', 'N.80', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (586, 'BA\'KELALAN', 'N.81', 13, 1, NULL);
INSERT INTO `tbl_gi_dun` VALUES (587, 'BUKIT SARI', 'N.82', 13, 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_parlimen
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_parlimen`;
CREATE TABLE `tbl_gi_parlimen`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Parlimen` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `ParlimenCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `ParlimenState` int NULL DEFAULT NULL,
  `StatusParlimen` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ParlimenState`(`ParlimenState` ASC) USING BTREE,
  INDEX `StatusParlimen`(`StatusParlimen` ASC) USING BTREE,
  CONSTRAINT `ParlimenState` FOREIGN KEY (`ParlimenState`) REFERENCES `tbl_gi_state` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `StatusParlimen` FOREIGN KEY (`StatusParlimen`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_parlimen
-- ----------------------------
INSERT INTO `tbl_gi_parlimen` VALUES (1, 'SEGAMAT', 'P.140', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (2, 'SEKIJANG', 'P.141', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (3, 'LABIS', 'P.142', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (4, 'PAGOH', 'P.143', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (5, 'LEDANG', 'P.144', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (6, 'BAKRI', 'P.145', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (7, 'MUAR', 'P.146', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (8, 'PARIT SULONG', 'P.147', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (9, 'AYER HITAM', 'P.148', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (10, 'SRI GADING', 'P.149', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (11, 'BATU PAHAT', 'P.150', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (12, 'SIMPANG RENGGAM', 'P.151', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (13, 'KLUANG', 'P.152', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (14, 'SEMBRONG', 'P.153', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (15, 'MERSING', 'P.154', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (16, 'TENGGARA', 'P.155', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (17, 'KOTA TINGGI', 'P.156', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (18, 'PENGERANG', 'P.157', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (19, 'TEBRAU', 'P.158', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (20, 'PASIR GUDANG', 'P.159', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (21, 'JOHOR BAHRU', 'P.160', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (22, 'PULAI', 'P.161', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (23, 'ISKANDAR PUTERI', 'P.162', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (24, 'KULAI', 'P.163', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (25, 'PONTIAN', 'P.164', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (26, 'TANJUNG PIAI', 'P.165', 1, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (27, 'LANGKAWI', 'P.004', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (28, 'JERLUN', 'P.005', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (29, 'KUBANG PASU', 'P.006', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (30, 'PADANG TERAP', 'P.007', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (31, 'POKOK SENA', 'P.008', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (32, 'ALOR SETAR', 'P.009', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (33, 'KUALA KEDAH', 'P.010', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (34, 'PENDANG', 'P.011', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (35, 'JERAI', 'P.012', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (36, 'SIK', 'P.013', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (37, 'MERBOK', 'P.014', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (38, 'SUNGAI PETANI', 'P.015', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (39, 'BALING', 'P.016', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (40, 'PADANG SERAI', 'P.017', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (41, 'KULIM-BANDAR BAHARU', 'P.018', 2, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (42, 'TUMPAT', 'P.019', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (43, 'PENGKALAN CHEPA', 'P.020', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (44, 'KOTA BHARU', 'P.021', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (45, 'PASIR MAS', 'P.022', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (46, 'RANTAU PANJANG', 'P.023', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (47, 'KUBANG KERIAN', 'P.024', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (48, 'BACHOK', 'P.025', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (49, 'KETEREH', 'P.026', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (50, 'TANAH MERAH', 'P.027', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (51, 'PASIR PUTEH', 'P.028', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (52, 'MACHANG', 'P.029', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (53, 'JELI', 'P.030', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (54, 'KUALA KRAI', 'P.031', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (55, 'GUA MUSANG', 'P.032', 3, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (56, 'MASJID TANAH', 'P.134', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (57, 'ALOR GAJAH', 'P.135', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (58, 'TANGGA BATU', 'P.136', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (59, 'HANG TUAH JAYA', 'P.137', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (60, 'KOTA MELAKA', 'P.138', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (61, 'JASIN', 'P.139', 4, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (62, 'JELEBU', 'P.126', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (63, 'JEMPOL', 'P.127', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (64, 'SEREMBAN', 'P.128', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (65, 'KUALA PILAH', 'P.129', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (66, 'RASAH', 'P.130', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (67, 'REMBAU', 'P.131', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (68, 'PORT DICKSON', 'P.132', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (69, 'TAMPIN', 'P.133', 5, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (70, 'CAMERON HIGHLANDS', 'P.078', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (71, 'LIPIS', 'P.079', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (72, 'RAUB', 'P.080', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (73, 'JERANTUT', 'P.081', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (74, 'INDERA MAHKOTA', 'P.082', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (75, 'KUANTAN', 'P.083', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (76, 'PAYA BESAR', 'P.084', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (77, 'PEKAN', 'P.085', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (78, 'MARAN', 'P.086', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (79, 'KUALA KRAU', 'P.087', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (80, 'TEMERLOH', 'P.088', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (81, 'BENTONG', 'P.089', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (82, 'BERA', 'P.090', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (83, 'ROMPIN', 'P.091', 6, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (84, 'KEPALA BATAS', 'P.041', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (85, 'TASEK GELUGOR', 'P.042', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (86, 'BAGAN', 'P.043', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (87, 'PERMATANG PAUH', 'P.044', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (88, 'BUKIT MERTAJAM', 'P.045', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (89, 'BATU KAWAN', 'P.046', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (90, 'NIBONG TEBAL', 'P.047', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (91, 'BUKIT BENDERA', 'P.048', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (92, 'TANJONG', 'P.049', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (93, 'JELUTONG', 'P.050', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (94, 'BUKIT GELUGOR', 'P.051', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (95, 'BAYAN BARU', 'P.052', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (96, 'BALIK PULAU', 'P.053', 7, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (97, 'GERIK', 'P.054', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (98, 'LENGGONG', 'P.055', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (99, 'LARUT', 'P.056', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (100, 'PARIT BUNTAR', 'P.057', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (101, 'BAGAN SERAI', 'P.058', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (102, 'BUKIT GANTANG', 'P.059', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (103, 'TAIPING', 'P.060', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (104, 'PADANG RENGAS', 'P.061', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (105, 'SUNGAI SIPUT', 'P.062', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (106, 'TAMBUN', 'P.063', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (107, 'IPOH TIMOR', 'P.064', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (108, 'IPOH BARAT', 'P.065', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (109, 'BATU GAJAH', 'P.066', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (110, 'KUALA KANGSAR', 'P.067', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (111, 'BERUAS', 'P.068', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (112, 'PARIT', 'P.069', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (113, 'KAMPAR', 'P.070', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (114, 'GOPENG', 'P.071', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (115, 'TAPAH', 'P.072', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (116, 'PASIR SALAK', 'P.073', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (117, 'LUMUT', 'P.074', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (118, 'BAGAN DATUK', 'P.075', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (119, 'TELUK INTAN', 'P.076', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (120, 'TANJONG MALIM', 'P.077', 8, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (121, 'PADANG BESAR', 'P.001', 9, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (122, 'KANGAR', 'P.002', 9, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (123, 'ARAU', 'P.003', 9, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (124, 'SABAK BERNAM', 'P.092', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (125, 'SUNGAI BESAR', 'P.093', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (126, 'HULU SELANGOR', 'P.094', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (127, 'TANJONG KARANG', 'P.095', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (128, 'KUALA SELANGOR', 'P.096', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (129, 'SELAYANG', 'P.097', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (130, 'GOMBAK', 'P.098', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (131, 'AMPANG', 'P.099', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (132, 'PANDAN', 'P.100', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (133, 'HULU LANGAT', 'P.101', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (134, 'BANGI', 'P.102', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (135, 'PUCHONG', 'P.103', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (136, 'SUBANG', 'P.104', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (137, 'PETALING JAYA', 'P.105', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (138, 'DAMANSARA', 'P.106', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (139, 'SUNGAI BULOH', 'P.107', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (140, 'SHAH ALAM', 'P.108', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (141, 'KAPAR', 'P.109', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (142, 'KLANG', 'P.110', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (143, 'KOTA RAJA', 'P.111', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (144, 'KUALA LANGAT', 'P.112', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (145, 'SEPANG', 'P.113', 10, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (146, 'BESUT', 'P.033', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (147, 'SETIU', 'P.034', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (148, 'KUALA NERUS', 'P.035', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (149, 'KUALA TERENGGANU', 'P.036', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (150, 'MARANG', 'P.037', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (151, 'HULU TERENGGANU', 'P.038', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (152, 'DUNGUN', 'P.039', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (153, 'KEMAMAN', 'P.040', 11, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (154, 'KUDAT', 'P.167', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (155, 'KOTA MARUDU', 'P.168', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (156, 'KOTA BELUD', 'P.169', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (157, 'TUARAN', 'P.170', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (158, 'SEPANGGAR', 'P.171', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (159, 'KOTA KINABALU', 'P.172', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (160, 'PUTATAN', 'P.173', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (161, 'PENAMPANG', 'P.174', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (162, 'PAPAR', 'P.175', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (163, 'KIMANIS', 'P.176', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (164, 'BEAUFORT', 'P.177', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (165, 'SIPITANG', 'P.178', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (166, 'RANAU', 'P.179', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (167, 'KENINGAU', 'P.180', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (168, 'TENOM', 'P.181', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (169, 'PENSIANGAN', 'P.182', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (170, 'BELURAN', 'P.183', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (171, 'LIBARAN', 'P.184', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (172, 'BATU SAPI', 'P.185', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (173, 'SANDAKAN', 'P.186', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (174, 'KINABATANGAN', 'P.187', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (175, 'SILAM', 'P.188', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (176, 'SEMPORNA', 'P.189', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (177, 'TAWAU', 'P.190', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (178, 'KALABAKAN', 'P.191', 12, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (179, 'KEPONG', 'P.114', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (180, 'BATU', 'P.115', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (181, 'WANGSA MAJU', 'P.116', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (182, 'SEGAMBUT', 'P.117', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (183, 'SETIAWANGSA', 'P.118', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (184, 'TITIWANGSA', 'P.119', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (185, 'BUKIT BINTANG', 'P.120', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (186, 'LEMBAH PANTAI', 'P.121', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (187, 'SEPUTEH', 'P.122', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (188, 'CHERAS', 'P.123', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (189, 'BANDAR TUN RAZAK', 'P.124', 14, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (190, 'LABUAN', 'P.166', 15, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (191, 'PUTRAJAYA', 'P.125', 16, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (192, 'MAS GADING', 'P.192', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (193, 'SANTUBONG', 'P.193', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (194, 'PETRA JAYA', 'P.194', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (195, 'BANDAR KUCHING', 'P.195', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (196, 'STAMPIN', 'P.196', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (197, 'KOTA SAMARAHAN', 'P.197', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (198, 'PUNCAK BORNEO', 'P.198', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (199, 'SERIAN', 'P.199', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (200, 'BATANG SADONG', 'P.200', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (201, 'BATANG LUPAR', 'P.201', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (202, 'SRI AMAN', 'P.202', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (203, 'LUBOK ANTU', 'P.203', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (204, 'BETONG', 'P.204', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (205, 'SARATOK', 'P.205', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (206, 'TANJONG MANIS', 'P.206', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (207, 'IGAN', 'P.207', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (208, 'SARIKEI', 'P.208', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (209, 'JULAU', 'P.209', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (210, 'KANOWIT', 'P.210', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (211, 'LANANG', 'P.211', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (212, 'SIBU', 'P.212', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (213, 'MUKAH', 'P.213', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (214, 'SELANGAU', 'P.214', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (215, 'KAPIT', 'P.215', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (216, 'HULU RAJANG', 'P.216', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (217, 'BINTULU', 'P.217', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (218, 'SIBUTI', 'P.218', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (219, 'MIRI', 'P.219', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (220, 'BARAM', 'P.220', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (221, 'LIMBANG', 'P.221', 13, 1, NULL);
INSERT INTO `tbl_gi_parlimen` VALUES (222, 'LAWAS', 'P.222', 13, 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_premission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_premission`;
CREATE TABLE `tbl_gi_premission`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TypePremission` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusPremission` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusPremission`(`StatusPremission` ASC) USING BTREE,
  CONSTRAINT `StatusPremission` FOREIGN KEY (`StatusPremission`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_premission
-- ----------------------------
INSERT INTO `tbl_gi_premission` VALUES (1, 'Add', 1, '');
INSERT INTO `tbl_gi_premission` VALUES (2, 'Edit/Update', 1, NULL);
INSERT INTO `tbl_gi_premission` VALUES (3, 'View', 1, NULL);
INSERT INTO `tbl_gi_premission` VALUES (4, 'Delete', 2, 'Only for Super Administrator');

-- ----------------------------
-- Table structure for tbl_gi_registration
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_registration`;
CREATE TABLE `tbl_gi_registration`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RegisterType` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusRegister` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusRegister`(`StatusRegister` ASC) USING BTREE,
  CONSTRAINT `StatusRegister` FOREIGN KEY (`StatusRegister`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_registration
-- ----------------------------
INSERT INTO `tbl_gi_registration` VALUES (1, 'SSM', 1, NULL);
INSERT INTO `tbl_gi_registration` VALUES (2, 'ROC', 1, NULL);
INSERT INTO `tbl_gi_registration` VALUES (3, 'ROB', 1, NULL);

-- ----------------------------
-- Table structure for tbl_gi_state
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_state`;
CREATE TABLE `tbl_gi_state`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `State` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StateCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StateCodeNumber` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatePhoneCode` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusState` int NULL DEFAULT NULL,
  `StateCountry` int NULL DEFAULT NULL,
  `Remaks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusState`(`StatusState` ASC) USING BTREE,
  INDEX `StateCountry`(`StateCountry` ASC) USING BTREE,
  CONSTRAINT `StateCountry` FOREIGN KEY (`StateCountry`) REFERENCES `tbl_gi_country` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `StatusState` FOREIGN KEY (`StatusState`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_state
-- ----------------------------
INSERT INTO `tbl_gi_state` VALUES (1, 'Johor', 'JH', '01', '07', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (2, 'Kedah', 'KD', '02', '04', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (3, 'Kelantan', 'KT', '03', '09', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (4, 'Melaka', 'ML', '04', '06', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (5, 'Negeri Sembilan', 'NS', '05', '06', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (6, 'Pahang', 'PH', '06', '09', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (7, 'Pulau Pinang', 'PN', '07', '04', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (8, 'Perak', 'PR', '08', '05', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (9, 'Perlis', 'PL', '09', '04', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (10, 'Selangor', 'SG', '10', '03', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (11, 'Terengganu', 'TR', '11', '09', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (12, 'Sabah', 'SB', '12', '08', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (13, 'Sarawak', 'SW', '13', '08', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (14, 'Wilayah Persekutuan Kuala Lumpur', 'KL', '14', '03', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (15, 'Wilayah Persekutuan Labuan', 'LB', '15', '087', 1, 104, NULL);
INSERT INTO `tbl_gi_state` VALUES (16, 'Wilayah Persekutuan Putrajaya', 'PJ', '16', '03', 1, 104, NULL);

-- ----------------------------
-- Table structure for tbl_gi_status
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_status`;
CREATE TABLE `tbl_gi_status`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GeneralStatus` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_status
-- ----------------------------
INSERT INTO `tbl_gi_status` VALUES (1, 'Active', 'Aktiviti secara ganeral yang aktif');
INSERT INTO `tbl_gi_status` VALUES (2, 'Passive', 'Aktiviti secara ganeral yang tidak aktif');

-- ----------------------------
-- Table structure for tbl_gi_userrole
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gi_userrole`;
CREATE TABLE `tbl_gi_userrole`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserRole` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `StatusUser` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `StatusUser`(`StatusUser` ASC) USING BTREE,
  CONSTRAINT `StatusUser` FOREIGN KEY (`StatusUser`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_gi_userrole
-- ----------------------------
INSERT INTO `tbl_gi_userrole` VALUES (1, 'Super Administrator', 1, 'SU');
INSERT INTO `tbl_gi_userrole` VALUES (2, 'Administrator', 1, 'Admin');
INSERT INTO `tbl_gi_userrole` VALUES (3, 'Cheif Executive Officer', 1, 'CEO');
INSERT INTO `tbl_gi_userrole` VALUES (4, 'Cheif Operation Officer', 1, 'COO');
INSERT INTO `tbl_gi_userrole` VALUES (5, 'Cheif Finance Officer', 1, 'CFO');
INSERT INTO `tbl_gi_userrole` VALUES (6, 'Manager', 1, 'GM');
INSERT INTO `tbl_gi_userrole` VALUES (7, 'Human Resources', 1, 'HR');
INSERT INTO `tbl_gi_userrole` VALUES (8, 'Finance', 1, 'FM');
INSERT INTO `tbl_gi_userrole` VALUES (9, 'Software Engineer', 1, 'SE');
INSERT INTO `tbl_gi_userrole` VALUES (10, 'Technical Engineer', 1, 'TE');
INSERT INTO `tbl_gi_userrole` VALUES (11, 'Operation Engineer', 1, 'OE');
INSERT INTO `tbl_gi_userrole` VALUES (12, 'Agent', 1, 'Agent');
INSERT INTO `tbl_gi_userrole` VALUES (13, 'Permohon', 1, 'End-User');
INSERT INTO `tbl_gi_userrole` VALUES (14, 'Cheif Technology Officer', 1, 'CTO');

-- ----------------------------
-- Table structure for tbl_user_premission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_premission`;
CREATE TABLE `tbl_user_premission`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NULL DEFAULT NULL,
  `UserPremission` int NULL DEFAULT NULL,
  `StatusPremission` int NULL DEFAULT NULL,
  `Remarks` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `UserPremission`(`UserPremission` ASC) USING BTREE,
  INDEX `StatusPremission1`(`StatusPremission` ASC) USING BTREE,
  INDEX `UserRegID`(`UserID` ASC) USING BTREE,
  CONSTRAINT `StatusPremission1` FOREIGN KEY (`StatusPremission`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserPremission` FOREIGN KEY (`UserPremission`) REFERENCES `tbl_gi_premission` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `UserRegID` FOREIGN KEY (`UserID`) REFERENCES `tbl_user_registration` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_premission
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user_registration
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_registration`;
CREATE TABLE `tbl_user_registration`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `uuid` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `email_verified_at` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `last_login_at` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `user_status` int NULL DEFAULT NULL,
  `role_type` int NULL DEFAULT NULL,
  `user_branch_id` int NULL DEFAULT NULL,
  `user_agency_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `statususer1`(`user_status` ASC) USING BTREE,
  INDEX `userrole`(`role_type` ASC) USING BTREE,
  INDEX `userbanch1`(`user_branch_id` ASC) USING BTREE,
  INDEX `useragency1`(`user_agency_id` ASC) USING BTREE,
  CONSTRAINT `statususer1` FOREIGN KEY (`user_status`) REFERENCES `tbl_gi_status` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `useragency1` FOREIGN KEY (`user_agency_id`) REFERENCES `tbl_ap_agency` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userbanch1` FOREIGN KEY (`user_branch_id`) REFERENCES `tbl_ap_branch` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userrole` FOREIGN KEY (`role_type`) REFERENCES `tbl_gi_userrole` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user_registration
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
