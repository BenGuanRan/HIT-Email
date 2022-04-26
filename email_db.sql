/*
 Navicat Premium Data Transfer

 Source Server         : localhost_DB
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : email_db

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 19/04/2022 10:36:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add users', 7, 'add_users');
INSERT INTO `auth_permission` VALUES (26, 'Can change users', 7, 'change_users');
INSERT INTO `auth_permission` VALUES (27, 'Can delete users', 7, 'delete_users');
INSERT INTO `auth_permission` VALUES (28, 'Can view users', 7, 'view_users');
INSERT INTO `auth_permission` VALUES (29, 'Can add draft box', 8, 'add_draftbox');
INSERT INTO `auth_permission` VALUES (30, 'Can change draft box', 8, 'change_draftbox');
INSERT INTO `auth_permission` VALUES (31, 'Can delete draft box', 8, 'delete_draftbox');
INSERT INTO `auth_permission` VALUES (32, 'Can view draft box', 8, 'view_draftbox');
INSERT INTO `auth_permission` VALUES (33, 'Can add has send', 9, 'add_hassend');
INSERT INTO `auth_permission` VALUES (34, 'Can change has send', 9, 'change_hassend');
INSERT INTO `auth_permission` VALUES (35, 'Can delete has send', 9, 'delete_hassend');
INSERT INTO `auth_permission` VALUES (36, 'Can view has send', 9, 'view_hassend');
INSERT INTO `auth_permission` VALUES (37, 'Can add username_verify code', 10, 'add_username_verifycode');
INSERT INTO `auth_permission` VALUES (38, 'Can change username_verify code', 10, 'change_username_verifycode');
INSERT INTO `auth_permission` VALUES (39, 'Can delete username_verify code', 10, 'delete_username_verifycode');
INSERT INTO `auth_permission` VALUES (40, 'Can view username_verify code', 10, 'view_username_verifycode');
INSERT INTO `auth_permission` VALUES (41, 'Can add token', 11, 'add_token');
INSERT INTO `auth_permission` VALUES (42, 'Can change token', 11, 'change_token');
INSERT INTO `auth_permission` VALUES (43, 'Can delete token', 11, 'delete_token');
INSERT INTO `auth_permission` VALUES (44, 'Can view token', 11, 'view_token');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (8, 'email_app', 'draftbox');
INSERT INTO `django_content_type` VALUES (9, 'email_app', 'hassend');
INSERT INTO `django_content_type` VALUES (11, 'email_app', 'token');
INSERT INTO `django_content_type` VALUES (10, 'email_app', 'username_verifycode');
INSERT INTO `django_content_type` VALUES (7, 'email_app', 'users');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-04-09 02:57:12.090893');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-04-09 02:57:12.383111');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-04-09 02:57:12.461900');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-04-09 02:57:12.468882');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-09 02:57:12.474866');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-04-09 02:57:12.534706');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-04-09 02:57:12.569612');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-04-09 02:57:12.607511');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-04-09 02:57:12.613495');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-04-09 02:57:12.649399');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-04-09 02:57:12.652391');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-09 02:57:12.658374');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-04-09 02:57:12.698268');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-09 02:57:12.735170');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-04-09 02:57:12.769079');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-04-09 02:57:12.776060');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-09 02:57:12.813556');
INSERT INTO `django_migrations` VALUES (18, 'email_app', '0001_initial', '2022-04-09 02:57:12.825524');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-04-09 02:57:12.847465');
INSERT INTO `django_migrations` VALUES (20, 'email_app', '0002_draftbox', '2022-04-11 01:52:00.971700');
INSERT INTO `django_migrations` VALUES (21, 'email_app', '0003_hassend_draftbox_date', '2022-04-11 02:26:59.095095');
INSERT INTO `django_migrations` VALUES (22, 'email_app', '0004_users_apmi', '2022-04-11 03:28:31.969912');
INSERT INTO `django_migrations` VALUES (23, 'email_app', '0005_draftbox_sender', '2022-04-11 06:08:16.416994');
INSERT INTO `django_migrations` VALUES (24, 'email_app', '0006_username_verifycode', '2022-04-12 03:07:28.304348');
INSERT INTO `django_migrations` VALUES (25, 'email_app', '0007_username_verifycode_username', '2022-04-12 04:17:44.082896');
INSERT INTO `django_migrations` VALUES (26, 'email_app', '0008_token', '2022-04-12 09:22:39.444130');
INSERT INTO `django_migrations` VALUES (27, 'email_app', '0009_alter_token_token', '2022-04-12 10:49:28.482868');
INSERT INTO `django_migrations` VALUES (28, 'email_app', '0010_rename_apmi_users_imap', '2022-04-12 12:09:50.275873');
INSERT INTO `django_migrations` VALUES (29, 'email_app', '0011_alter_draftbox_content_alter_hassend_content', '2022-04-18 13:29:51.912942');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for email_app_draftbox
-- ----------------------------
DROP TABLE IF EXISTS `email_app_draftbox`;
CREATE TABLE `email_app_draftbox`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiver` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(2560) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_app_draftbox
-- ----------------------------
INSERT INTO `email_app_draftbox` VALUES (70, '测试邮件', '1755742107@qq.com', '测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件测试邮件', '2022-04-18 23:04:08', '1755742107@qq.com');

-- ----------------------------
-- Table structure for email_app_hassend
-- ----------------------------
DROP TABLE IF EXISTS `email_app_hassend`;
CREATE TABLE `email_app_hassend`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sender` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiver` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(2560) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_app_hassend
-- ----------------------------
INSERT INTO `email_app_hassend` VALUES (17, 'Beautiful P5.js, Easy Parallax', '2022-04-18 21:34:16', '1755742107@qq.com', '356175531@qq.com', 'VIEW THIS ISSUE ON CODEPEN\r\nBeautiful P5.js, Easy Parallax, and Retro Tailwind\r\nThis week\'s highlights include two gorgeous P5.js demos: Koyama Monaka pours us a glass of fractal \"Triangle Soda\", and Louis Hoebregts combines P5 with SVG and GSAP to create a neon pattern inspired by topographic maps.\r\n\r\nPlus, we get a quick tip on how to create a simple parallax effect from Dusko Stamenic, and Alex Riviere uses the latest in Tailwind technology to take us back to the Geocities era.\r\n\r\n\r\nMongoDB World 2022: The Future Runs on MongoDB\r\nMongoDB World is the conference for developers who create, disrupt, and transform. Enjoy three days packed with demos, workshops, and technical sessions that give you the tools needed to build and deploy mission-critical apps at scale. Be the very first to hear about our exciting new announcements and learn why the future runs on MongoDB.\r\n\r\nRegister for MongoDB World 2022 Today\r\n\r\nPEN\r\nEasy Parallax Effect\r\nDusko Stamenic shares an elegant technique for creating a paral');
INSERT INTO `email_app_hassend` VALUES (18, '356175531@qq.com', '2022-04-18 21:34:57', '1755742107@qq.com', '356175531@qq.com', '\r\n恭喜你，豪华绿钻续费成功(2022-04-04 10:29:35)\r\n你于2022-04-04 10:29:35续费1个月豪华绿钻，有效期至2022-06-28。\r\n百项专享特权，还有多少未使用？今日推荐会员曲库、下载特权、个性主题等超多特权。关注\"QQ音乐VIP\"微信公众号，明星周边、专属抵扣券、演唱会门票、电影票等福利，抢先领！\r\n\r\n进入官网');
INSERT INTO `email_app_hassend` VALUES (19, '腾讯课堂', '2022-04-18 21:47:54', '356175531@qq.com', '1755742107@qq.com', '腾讯课堂 PC独立客户端\r\n说明：新增多种教学工具，提升授课体验。\r\n\r\n大小：87MB    发布日期：2022-04-13\r\n\r\n 立即下载\r\n \r\n流畅上课，不再卡顿\r\n更稳定清晰的画质，上课卡顿情况大幅减少，让你的上课体验更“爽”。\r\n\r\n立即下载\r\n支持课堂内举手互动\r\n老师发起举手请求后，可支持最多6名学生同时通过语音回答问题，互动课堂更高效。\r\n\r\n立即下载 \r\n \r\n支持微信用户上课\r\n微信登录用户也可使用客户端上课，和QQ登录用户不再有差别。\r\n\r\n立即下载\r\n全新一站式沉浸学习体验\r\n看直播、看视频、做题目、下载资料等所有学习体验都能在客户端内一站式沉浸完成，构建无干扰学习环境。\r\n\r\n立即下载 \r\n腾讯课堂\r\nPC独立客户端\r\n\r\n 立即下载\r\n大小：87MB    发布日期：2022-04-13\r\n\r\nCopyright © 2022 Tencent. All Rights Reserved.\r\n\r\n深圳市腾讯计算机系统有限公司 版权所有 | 腾讯课堂服务协议 | 隐私政策 | 站点地图 | 侵权投诉 | 联系客服 | 帮助 | IT教程 | TAGS专题 | 系列视频\r\n\r\n腾讯课堂【APP Android iPhone 下载】\r\n');
INSERT INTO `email_app_hassend` VALUES (20, '猎人×猎人 重制版', '2022-04-18 21:51:28', '356175531@qq.com', '1755742107@qq.com', 'CSDN首页\r\n博客\r\n开发者文库\r\n课程\r\n问答\r\n社区\r\n插件\r\n认证\r\n开源\r\n如何测试IMAP是否合法\r\n 搜索\r\n\r\n会员中心 \r\n足迹\r\n动态\r\n消息\r\n创作\r\n\r\n后端\r\n前端\r\n移动开发\r\n编程语言\r\nJava\r\nPython\r\n人工智能\r\n大数据\r\n数据结构与算法\r\n音视频\r\n云原生\r\n云平台\r\n运维\r\n服务器\r\n操作系统\r\n数据库管理\r\niOS\r\nAndroid\r\n小程序\r\n硬件开发\r\n嵌入式\r\n微软技术\r\n软件工程\r\n测试\r\n安全\r\n网络\r\n产品/运营\r\n设计\r\n职场和发展\r\n搜索\r\n开发工具\r\nPHP\r\n游戏\r\n开放平台\r\nHarmonyOS\r\n区块链\r\n数学\r\n超级实习生\r\n\r\n\r\n\r\n头条\r\n\r\nGitHub停用俄罗斯公司开发者账号\r\n被停用的个人账号与被制裁实体有关联。\r\n\r\n马斯克欲用430亿美元拿下Twitter\r\n马斯克困于 Twitter 久矣，是时候“翻身做主人了”。\r\n\r\n锤子系统宣布回归 或将推新品\r\n你期待吗？\r\n\r\n以太坊开发者被判入狱63个月\r\nV 神呼吁宽大处理\r\n\r\n谷歌上线Switch转安卓应用\r\n吸引苹果用户\r\n\r\n我错怪了goroutine\r\ngoroutine并不是操作系统级的task，切换开销极小。\r\n\r\n\r\n热点\r\n\r\n历史上的今天：搜狐总编辑李善友辞职\r\nTurbo Pascal 2.0 发布\r\n\r\n10道大厂常考的机器学习面试题\r\n社区周刊\r\n\r\n俄罗斯人被禁止使用Arial等字体\r\n马斯克欲434亿美元私有化Twitter|极客头条\r\n\r\n我，机器学习工程师，决定跑路了\r\n机器学习“弃坑”派\r\n\r\n谷歌员工年薪中位数是苹果的4倍多\r\n亚马逊CEO薪酬抵6千名员工|科技巨头薪资排名出炉\r\n\r\n\r\n\r\n\r\n关注\r\n\r\n推荐\r\n\r\n资讯\r\n\r\n热榜\r\n\r\n专家推荐\r\n\r\n更多\r\n等你来答vue template 标签，这个#代表啥意思？这个是怎样实现了什么功能？这和插槽有关系吗？\r\n\r\n0 赞\r\n\r\n\r\n踩\r\n\r\nm0_66651235\r\n\r\nJavaScript零基础通关（11）Math对象，最大值，封装自己的数学对象，Math绝对值和三个取证方法，随机数方法 random()，\r\nJavaScript 内置对象内置对象JavaScript 中的对象分为3种：自定义对象 、内置对象、 浏览器对象前面两种对象是JS 基础 内容，属于 ECMAScript； 第三个浏览器对象属于我们JS 独有的， 我们JS API 讲解内置对象就是指 JS 语言自带的一些对象，这些对象供开发者使用，并提供了一些常用的或是最基本而必要的功能（属性和方法）内置');
INSERT INTO `email_app_hassend` VALUES (21, 'CSDN', '2022-04-18 22:51:08', '356175531@qq.com', '1755742107@qq.com', '\r\nweb前端注册界面与非法用户的校验\r\n注册界面：包括日期、文件、密码等等的表单设计与JavaScript的校验\r\n\r\n\r\n5 赞\r\n\r\n\r\n踩\r\n\r\n风梳烟\r\n\r\n\r\n基于javaweb+jsp的甜品店奶茶店管理系统(JavaWeb JSP MySQL Servlet SSM SpringBoot Layui Ajax)\r\n源码获取：博客首页 ‘资源’ 里下载基于javaweb+jsp的甜品店奶茶店管理系统(JavaWeb JSP MySQL Servlet SSM SpringBoot Layui Ajax)JavaWeb JavaBean JSP MVC MySQL Tomcat JavaScript Layui Ajax基础JSP+Servlet或JSP+SSM(Spring、SpringMVC、MyBatis)框架或JSP+SSM+Maven(pom.xml)框架或SpringBoot…均可开发工具：ecl.\r\n\r\n\r\n0 赞\r\n\r\n\r\n踩\r\n\r\nm0_69634396\r\n\r\n\r\n修改兴趣标签\r\n反馈信息流问题');
INSERT INTO `email_app_hassend` VALUES (22, 'postman', '2022-04-18 23:01:18', '356175531@qq.com', '1755742107@qq.com', 'Search Postman\r\nSearch Postman\r\n会员系统接口测试\r\nCollections\r\nAPIs\r\nEnvironments\r\nMock Servers\r\nMonitors\r\nFlows\r\nHistory\r\nNo Environment\r\nGET\r\nEnter request URL\r\n\r\nQuery Params\r\n');

-- ----------------------------
-- Table structure for email_app_token
-- ----------------------------
DROP TABLE IF EXISTS `email_app_token`;
CREATE TABLE `email_app_token`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loginTime` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_app_token
-- ----------------------------
INSERT INTO `email_app_token` VALUES (4, '1755742107@qq.com', '1650288358', 'IjE3NTU3NDIxMDdAcXEuY29tJjE2NTAyODgzNTgi:1ngROA:OrSWOsRThcLvSDCAMAlYTyAs1GDHDaXinGO-2Uk05c4');
INSERT INTO `email_app_token` VALUES (5, '356175531@qq.com', '1650289338', 'IjM1NjE3NTUzMUBxcS5jb20mMTY1MDI4OTMzOCI:1ngRdy:kb0gauHT5h4E1Q6R_UXb75SbCuzYljHrEXvNL2bXCIU');

-- ----------------------------
-- Table structure for email_app_username_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `email_app_username_verifycode`;
CREATE TABLE `email_app_username_verifycode`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `verifyCode` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_app_username_verifycode
-- ----------------------------
INSERT INTO `email_app_username_verifycode` VALUES (4, '7021', '1755742107@qq.com');
INSERT INTO `email_app_username_verifycode` VALUES (5, '1409', '356175531@qq.com');

-- ----------------------------
-- Table structure for email_app_users
-- ----------------------------
DROP TABLE IF EXISTS `email_app_users`;
CREATE TABLE `email_app_users`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IMAP` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of email_app_users
-- ----------------------------
INSERT INTO `email_app_users` VALUES (24, '1755742107@qq.com', '123456789', '');
INSERT INTO `email_app_users` VALUES (25, '356175531@qq.com', '123456789', 'nqngeaqwxgogbgej');

SET FOREIGN_KEY_CHECKS = 1;
