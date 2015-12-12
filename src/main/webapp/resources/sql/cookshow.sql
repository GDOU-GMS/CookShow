/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : cookshow

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-12-12 10:04:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('2', '2015-11-27 23:27:18', '2015-11-27 23:27:18', '0', 'admin', '48f5e76905af893d7e88b893e23b4bc3', '6ed7013a-0b80-44a0-8fcc-14c1452bba79');
INSERT INTO `t_admin` VALUES ('3', '2015-12-09 17:46:07', '2015-12-09 17:46:07', '0', 'UserManager', '7a245c41c774f0c5c8016afccbfd4fda', '3e02c077-f014-4196-bbc8-be84db7c8c9f');
INSERT INTO `t_admin` VALUES ('4', '2015-12-09 21:00:12', '2015-12-09 21:00:12', '0', 'ClassificationManager', '4013c6e1bd830269769fbc43d805864b', '7e5c701e-a3dd-4aee-baec-9dc2ee8d9a1c');

-- ----------------------------
-- Table structure for `t_classification`
-- ----------------------------
DROP TABLE IF EXISTS `t_classification`;
CREATE TABLE `t_classification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_classification
-- ----------------------------
INSERT INTO `t_classification` VALUES ('1', '2015-11-29 20:36:10', '2015-11-29 20:36:10', '0', '00', null, '肉');
INSERT INTO `t_classification` VALUES ('2', '2015-11-29 20:39:58', '2015-11-29 20:39:58', '0', '01', null, '主食');
INSERT INTO `t_classification` VALUES ('3', '2015-11-29 20:54:28', '2015-11-29 20:54:28', '0', '02', null, '蔬菜');
INSERT INTO `t_classification` VALUES ('5', '2015-11-29 23:31:47', '2015-11-29 23:31:47', '0', '000', '00', '猪肉');
INSERT INTO `t_classification` VALUES ('6', '2015-11-29 23:55:01', '2015-11-29 23:55:01', '0', '0000', '000', '排骨');
INSERT INTO `t_classification` VALUES ('7', '2015-12-01 17:17:56', '2015-12-01 17:17:56', '0', '03', null, '糕点');
INSERT INTO `t_classification` VALUES ('8', '2015-12-02 10:44:34', '2015-12-02 10:44:34', '0', '001', '01', '大米');
INSERT INTO `t_classification` VALUES ('9', '2015-12-02 10:45:17', '2015-12-02 10:45:17', '0', '0001', '001', '米粉');
INSERT INTO `t_classification` VALUES ('10', '2015-12-02 10:45:46', '2015-12-02 10:45:46', '0', '002', '02', '青菜');
INSERT INTO `t_classification` VALUES ('11', '2015-12-02 10:45:58', '2015-12-02 10:45:58', '0', '0002', '002', '麦菜');
INSERT INTO `t_classification` VALUES ('12', '2015-12-02 10:46:11', '2015-12-02 10:46:11', '0', '003', '03', '蛋糕');
INSERT INTO `t_classification` VALUES ('13', '2015-12-02 10:46:30', '2015-12-02 10:46:30', '0', '0003', '003', '烤蛋糕');
INSERT INTO `t_classification` VALUES ('14', '2015-12-02 10:47:26', '2015-12-02 10:47:26', '0', '0004', '003', '蒸蛋糕');
INSERT INTO `t_classification` VALUES ('15', '2015-12-02 10:47:40', '2015-12-02 10:47:40', '0', '0005', '000', '猪脚');
INSERT INTO `t_classification` VALUES ('16', '2015-12-02 10:47:54', '2015-12-02 10:47:54', '0', '0006', '000', '猪肝');
INSERT INTO `t_classification` VALUES ('17', '2015-12-02 10:48:14', '2015-12-02 10:48:14', '0', '0007', '001', '米饭');
INSERT INTO `t_classification` VALUES ('18', '2015-12-06 23:30:49', '2015-12-06 23:30:49', '0', '04', null, '烘焙甜品饮料');
INSERT INTO `t_classification` VALUES ('19', '2015-12-06 23:31:01', '2015-12-06 23:31:01', '0', '004', '04', '烘焙');
INSERT INTO `t_classification` VALUES ('20', '2015-12-06 23:31:15', '2015-12-06 23:31:15', '0', '005', '04', '甜品');
INSERT INTO `t_classification` VALUES ('21', '2015-12-06 23:31:28', '2015-12-06 23:31:28', '0', '0008', '004', '蛋糕');
INSERT INTO `t_classification` VALUES ('22', '2015-12-06 23:32:04', '2015-12-06 23:32:04', '0', '0009', '004', '面包');
INSERT INTO `t_classification` VALUES ('23', '2015-12-06 23:32:19', '2015-12-06 23:32:19', '0', '0010', '003', '饼干');
INSERT INTO `t_classification` VALUES ('24', '2015-12-06 23:32:31', '2015-12-06 23:32:31', '0', '0011', '003', '披萨');
INSERT INTO `t_classification` VALUES ('25', '2015-12-06 23:32:47', '2015-12-06 23:32:47', '0', '0012', '004', '披萨');
INSERT INTO `t_classification` VALUES ('26', '2015-12-06 23:32:57', '2015-12-06 23:32:57', '0', '0013', '004', '派');
INSERT INTO `t_classification` VALUES ('27', '2015-12-06 23:33:18', '2015-12-06 23:33:18', '0', '0014', '005', '布丁');
INSERT INTO `t_classification` VALUES ('28', '2015-12-06 23:33:28', '2015-12-06 23:33:28', '0', '0015', '005', '冰淇淋');
INSERT INTO `t_classification` VALUES ('29', '2015-12-06 23:33:36', '2015-12-06 23:33:36', '0', '0016', '005', '果冻');
INSERT INTO `t_classification` VALUES ('30', '2015-12-06 23:34:12', '2015-12-06 23:34:12', '0', '05', null, '蛋奶豆制品');
INSERT INTO `t_classification` VALUES ('31', '2015-12-06 23:34:27', '2015-12-06 23:34:27', '0', '006', '05', '蛋类');
INSERT INTO `t_classification` VALUES ('32', '2015-12-06 23:34:39', '2015-12-06 23:34:39', '0', '0017', '006', '鸡蛋');
INSERT INTO `t_classification` VALUES ('33', '2015-12-06 23:34:48', '2015-12-06 23:34:48', '0', '0018', '006', '咸蛋');
INSERT INTO `t_classification` VALUES ('34', '2015-12-06 23:35:19', '2015-12-06 23:35:19', '0', '007', '05', '奶制品');
INSERT INTO `t_classification` VALUES ('35', '2015-12-06 23:35:33', '2015-12-06 23:35:33', '0', '0019', '007', '牛奶');
INSERT INTO `t_classification` VALUES ('36', '2015-12-06 23:35:44', '2015-12-06 23:35:44', '0', '0020', '007', '酸奶');
INSERT INTO `t_classification` VALUES ('37', '2015-12-06 23:36:01', '2015-12-06 23:36:01', '0', '008', '05', '豆制品');
INSERT INTO `t_classification` VALUES ('38', '2015-12-06 23:36:13', '2015-12-06 23:36:13', '0', '0021', '008', '豆腐');
INSERT INTO `t_classification` VALUES ('39', '2015-12-06 23:36:28', '2015-12-06 23:36:28', '0', '0022', '008', '香干');
INSERT INTO `t_classification` VALUES ('40', '2015-12-06 23:36:48', '2015-12-06 23:36:48', '0', '06', null, '米面干果腌咸');
INSERT INTO `t_classification` VALUES ('41', '2015-12-06 23:36:59', '2015-12-06 23:36:59', '0', '009', '06', '米面类');
INSERT INTO `t_classification` VALUES ('42', '2015-12-06 23:37:11', '2015-12-06 23:37:11', '0', '010', '06', '干果类');
INSERT INTO `t_classification` VALUES ('43', '2015-12-06 23:37:34', '2015-12-06 23:37:34', '0', '011', '06', '腌咸食品');
INSERT INTO `t_classification` VALUES ('44', '2015-12-06 23:38:02', '2015-12-06 23:38:02', '0', '07', null, '水产');
INSERT INTO `t_classification` VALUES ('45', '2015-12-06 23:38:14', '2015-12-06 23:38:14', '0', '012', '07', '鱼');
INSERT INTO `t_classification` VALUES ('46', '2015-12-06 23:38:25', '2015-12-06 23:38:25', '0', '013', '07', '虾');
INSERT INTO `t_classification` VALUES ('47', '2015-12-06 23:38:35', '2015-12-06 23:38:35', '0', '014', '07', '蟹');
INSERT INTO `t_classification` VALUES ('48', '2015-12-06 23:38:44', '2015-12-06 23:38:44', '0', '015', '07', '贝');
INSERT INTO `t_classification` VALUES ('49', '2015-12-06 23:38:59', '2015-12-06 23:38:59', '0', '08', null, '口味特色');
INSERT INTO `t_classification` VALUES ('50', '2015-12-06 23:39:19', '2015-12-06 23:39:19', '0', '09', null, '热门专题');
INSERT INTO `t_classification` VALUES ('52', '2015-12-09 15:23:08', '2015-12-09 15:23:08', '0', '0023', '012', '咸鱼');
INSERT INTO `t_classification` VALUES ('53', '2015-12-11 10:12:32', '2015-12-11 10:12:32', '0', '0024', '000', 'mlhb');

-- ----------------------------
-- Table structure for `t_collection`
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`user_id`) USING BTREE,
  CONSTRAINT `t_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES ('4', '2', '2015-12-08 14:36:53', '2015-12-08 14:36:53', '0', '0', '18');
INSERT INTO `t_collection` VALUES ('5', '2', '2015-12-08 16:25:10', '2015-12-08 16:25:10', '0', '1', '1');
INSERT INTO `t_collection` VALUES ('6', '2', '2015-12-09 14:54:59', '2015-12-09 14:54:59', '0', '0', '34');
INSERT INTO `t_collection` VALUES ('7', '8', '2015-12-09 14:56:06', '2015-12-09 14:56:06', '0', '0', '41');
INSERT INTO `t_collection` VALUES ('8', '8', '2015-12-09 15:20:43', '2015-12-09 15:20:43', '0', '0', '37');
INSERT INTO `t_collection` VALUES ('11', '2', '2015-12-10 23:16:13', '2015-12-10 23:16:13', '0', '1', '2');
INSERT INTO `t_collection` VALUES ('12', '2', '2015-12-11 09:37:49', '2015-12-11 09:37:49', '0', '0', '35');
INSERT INTO `t_collection` VALUES ('13', '2', '2015-12-11 09:38:23', '2015-12-11 09:38:23', '0', '1', '15');
INSERT INTO `t_collection` VALUES ('14', '15', '2015-12-11 10:04:56', '2015-12-11 10:04:56', '0', '0', '18');
INSERT INTO `t_collection` VALUES ('15', '15', '2015-12-11 10:08:10', '2015-12-11 10:08:10', '0', '1', '16');

-- ----------------------------
-- Table structure for `t_comment_cookbook`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_cookbook`;
CREATE TABLE `t_comment_cookbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reply_id` bigint(20) DEFAULT NULL,
  `cookbook_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`reply_id`) USING BTREE,
  KEY `FK_Reference_11` (`user_id`) USING BTREE,
  KEY `FK_Reference_7` (`cookbook_id`) USING BTREE,
  CONSTRAINT `t_comment_cookbook_ibfk_1` FOREIGN KEY (`reply_id`) REFERENCES `t_comment_cookbook` (`id`),
  CONSTRAINT `t_comment_cookbook_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_cookbook_ibfk_3` FOREIGN KEY (`cookbook_id`) REFERENCES `t_cookbook` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_comment_cookbook
-- ----------------------------
INSERT INTO `t_comment_cookbook` VALUES ('1', null, '36', '2', '2015-12-10 09:41:21', '2015-12-10 09:41:21', '0', '好好看！', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('2', null, '36', '2', '2015-12-10 10:11:40', '2015-12-10 10:11:40', '0', '我也想做！', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('3', null, '36', '2', '2015-12-10 10:15:06', '2015-12-10 10:15:06', '0', '沙发沙发！', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('4', null, '36', '2', '2015-12-10 10:17:08', '2015-12-10 10:17:08', '0', '试一试！', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('5', null, '36', '2', '2015-12-10 10:18:12', '2015-12-10 10:18:12', '0', '试试', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('6', null, '36', '2', '2015-12-10 10:18:41', '2015-12-10 10:18:41', '0', 'append', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('7', null, '36', '2', '2015-12-10 10:19:27', '2015-12-10 10:19:27', '0', '再来', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('8', null, '36', '2', '2015-12-10 10:19:58', '2015-12-10 10:19:58', '0', 'insertbefore', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('9', null, '36', '2', '2015-12-10 10:22:16', '2015-12-10 10:22:16', '0', '为什么不行', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('10', null, '36', '2', '2015-12-10 10:29:21', '2015-12-10 10:29:21', '0', '终于可以了！', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('11', null, '36', '2', '2015-12-10 10:29:58', '2015-12-10 10:29:58', '0', '再来一次', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('12', null, '36', '2', '2015-12-10 10:33:33', '2015-12-10 10:33:33', '0', 'dddd', 'SevenLin');
INSERT INTO `t_comment_cookbook` VALUES ('13', null, '35', '15', '2015-12-11 10:09:38', '2015-12-11 10:09:38', '0', 'haohaokan', 'linzegeng1234');
INSERT INTO `t_comment_cookbook` VALUES ('14', null, '35', '15', '2015-12-11 10:09:45', '2015-12-11 10:09:45', '0', 'uydrfuy', 'linzegeng1234');

-- ----------------------------
-- Table structure for `t_comment_production`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_production`;
CREATE TABLE `t_comment_production` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reply_id` bigint(20) DEFAULT NULL,
  `production_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_111` (`reply_id`) USING BTREE,
  KEY `FK_Reference_12` (`user_id`) USING BTREE,
  KEY `FK_Reference_9` (`production_id`) USING BTREE,
  CONSTRAINT `t_comment_production_ibfk_1` FOREIGN KEY (`reply_id`) REFERENCES `t_comment_production` (`id`),
  CONSTRAINT `t_comment_production_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_comment_production_ibfk_3` FOREIGN KEY (`production_id`) REFERENCES `t_production` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_comment_production
-- ----------------------------
INSERT INTO `t_comment_production` VALUES ('1', null, '1', '2', '2015-12-10 14:09:56', '2015-12-10 14:09:59', '0', '哈哈哈', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('2', null, '2', '2', '2015-12-10 23:15:10', '2015-12-10 23:15:10', '0', '测试一下', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('3', null, '2', '2', '2015-12-10 23:15:22', '2015-12-10 23:15:22', '0', '再来一下', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('4', null, '2', '2', '2015-12-10 23:15:25', '2015-12-10 23:15:25', '0', '1', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('5', null, '2', '2', '2015-12-10 23:15:26', '2015-12-10 23:15:26', '0', '2', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('6', null, '2', '2', '2015-12-10 23:15:28', '2015-12-10 23:15:28', '0', '3', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('7', null, '2', '2', '2015-12-10 23:15:29', '2015-12-10 23:15:29', '0', '4', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('8', null, '2', '2', '2015-12-10 23:15:32', '2015-12-10 23:15:32', '0', '5', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('9', null, '2', '2', '2015-12-10 23:15:33', '2015-12-10 23:15:33', '0', '6', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('10', null, '2', '2', '2015-12-10 23:15:36', '2015-12-10 23:15:36', '0', '7', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('11', null, '2', '2', '2015-12-10 23:15:52', '2015-12-10 23:15:52', '0', '测试更健康', 'SevenLin');
INSERT INTO `t_comment_production` VALUES ('12', null, '2', '2', '2015-12-10 23:16:00', '2015-12-10 23:16:00', '0', '卧槽，好难吃', 'SevenLin');

-- ----------------------------
-- Table structure for `t_cookbook`
-- ----------------------------
DROP TABLE IF EXISTS `t_cookbook`;
CREATE TABLE `t_cookbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `classification_code` text COLLATE utf8mb4_unicode_ci,
  `click_num` int(11) DEFAULT NULL,
  `favour_num` int(11) DEFAULT NULL,
  `title_image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` text COLLATE utf8mb4_unicode_ci,
  `step` text COLLATE utf8mb4_unicode_ci COMMENT '步骤',
  `public_state` int(11) DEFAULT NULL,
  `remind` text COLLATE utf8mb4_unicode_ci COMMENT '小贴士',
  `intro` text COLLATE utf8mb4_unicode_ci,
  `publishDate` datetime DEFAULT NULL,
  `is_headline` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`user_id`) USING BTREE,
  CONSTRAINT `t_cookbook_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_cookbook
-- ----------------------------
INSERT INTO `t_cookbook` VALUES ('18', '2', '2015-12-02 15:49:39', '2015-12-07 15:43:00', '0', '0000,0005,0006,', '3', '1', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512071657241_200.png', '比乐蒂摩卡壶煮', '[{\"kind\":\"111\",\"num\":\"111\"},{\"kind\":\"222\",\"num\":\"222\"},{\"kind\":\"3333\",\"num\":\"33\"}]', '[{\"intro\":\"1111\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512071546770_11.png\"},{\"intro\":\"2222\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512071546837_zp.png\"},{\"intro\":\"3333\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512071547660_zp.png\"},{\"intro\":\"4444\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512071547920_zp.png\"},{\"intro\":\"5555\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512071547457_zp.png\"}]', '0', null, '好吃', '2015-12-07 10:05:39', 'Y');
INSERT INTO `t_cookbook` VALUES ('34', '8', '2015-12-08 22:08:18', '2015-12-08 22:08:18', '0', '0008,', '1', '2', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512082208205_dg1.png', '蔓越莓马芬', '[{\"kind\":\"低筋面粉\",\"num\":\"220克\"}]', '[{\"intro\":\"材料准备好，蔓越莓干切碎，泡打粉加入低筋面粉中，混合过筛2次备用\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082208254_1.png\"},{\"intro\":\"黄油放置稍软（手略用力能压出指痕），用电动打蛋器打散，细砂糖分两次加入到黄油中，打发至羽毛状\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082208817_2.png\"},{\"intro\":\"盐加入，用打蛋器略打发\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082208702_3.png\"},{\"intro\":\"最后倒入剩余的一半牛奶，切拌均匀\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082208607_4.png\"},{\"intro\":\"蔓越莓干倒入三分之二\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082208482_5.png\"}]', '0', null, '满满的黄油香～沉甸甸的满足感\r\n使用的这个是比较深的六连马芬模，普通款的应该得多加1到2个硬质纸杯一起烤比较好', '2015-12-09 11:42:49', 'Y');
INSERT INTO `t_cookbook` VALUES ('35', '8', '2015-12-08 22:19:35', '2015-12-08 22:19:35', '0', '0008,', '3', '5', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512082219570_cp.png', '芒果慕斯', '[{\"kind\":\"消化饼干\",\"num\":\"80g\"},{\"kind\":\"黄油\",\"num\":\"40g\"},{\"kind\":\"芒果\",\"num\":\"200g\"}]', '[{\"intro\":\"将处理好的消化饼干铺在蛋糕模的底部，压实后送入冰箱冷藏备用。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082219219_1.png\"},{\"intro\":\"用小火将芒果泥略加热，并不停搅拌使吉利丁粉均匀的溶解。加热到50度左右即可，不要煮沸。吉利丁粉溶解之后，将芒果溶液放置在一边晾凉。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082219111_2.png\"},{\"intro\":\"好在慕斯液中加入切成小丁的芒果颗粒。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082219387_3.png\"},{\"intro\":\"好在慕斯液中加入切成小丁的芒果颗粒。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082219255_4.png\"}]', '0', null, '这个是六寸的方子，如果要做八寸，所有的量加倍就好了~好吃又简单，恩恩~就是酱紫', null, 'Y');
INSERT INTO `t_cookbook` VALUES ('36', '8', '2015-12-08 22:33:51', '2015-12-08 22:33:51', '0', '0008,', '0', '5', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512082233186_cp.jpg', '萌！萌！哒！的八寸牛奶巧克力慕斯', '[{\"kind\":\"无糖可可粉\",\"num\":\"8g\"},{\"kind\":\"鸡蛋\",\"num\":\"2个\"},{\"kind\":\"色拉油\",\"num\":\"30g\"}]', '[{\"intro\":\"用热水将可可粉调匀备用，烤箱预热175度。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082233774_1.png\"},{\"intro\":\"将奶油与巧克力浆混合均匀，盖上保鲜膜放入冰箱冷藏10几分钟，让它稍微浓稠些。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082233758_2.png\"},{\"intro\":\"取出烤好的蛋糕，倒扣放凉横切成两片，如果要漂亮，就裁掉外围一小圈。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082233749_3.png\"},{\"intro\":\"从冰箱取出巧克力慕斯搅拌均匀，开始组装，顺序为：蛋糕＋慕斯＋蛋糕+慕斯。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/20151208223454_4.png\"},{\"intro\":\"切下的蛋糕边边咱也不浪费，做成一个慕斯杯。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082234707_5.png\"},{\"intro\":\"包好锡纸或保鲜膜入冰箱冷藏一个晚上。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082234337_6.png\"},{\"intro\":\"夏天放室温一会儿，用杯子顶出脱膜，冬天就用电吹风暖风均匀吹一圈即可脱膜。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082234321_7.png\"}]', '0', null, '嗯，这个蛋糕萌萌哒', null, 'Y');
INSERT INTO `t_cookbook` VALUES ('37', '10', '2015-12-08 23:07:27', '2015-12-08 23:07:27', '0', '0000,', '0', '9', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512082307839_cp.png', '糖醋排骨', '[{\"kind\":\"葱\",\"num\":\"两小段\"},{\"kind\":\"姜\",\"num\":\"两片\"},{\"kind\":\"料酒\",\"num\":\"\"},{\"kind\":\"酱油\",\"num\":\"\"},{\"kind\":\"醋\",\"num\":\"\"},{\"kind\":\"排骨\",\"num\":\"若干\"}]', '[{\"intro\":\"吧排骨同葱段，姜片一起放入锅中加水，煮开。为了去腥味去血水\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082308865_1.png\"},{\"intro\":\"排骨捞出后，沥干水分。锅中加油，放入排骨翻炒，直到排骨微微泛黄，边边微焦\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082308561_1.png\"},{\"intro\":\"调配酱汁：按照1：2：3：4：5的比例调配，依次是：料酒，酱油，醋，糖，水。具体调配多少，依据排骨的量调配。只要能没过锅中的排骨就好。文火慢慢来就可以了，把汁收干就可以出锅啦。加点儿芝麻更香哦～\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512082308960_1.png\"}]', '0', null, '酸甜口的糖醋排骨最好吃了！', null, 'Y');
INSERT INTO `t_cookbook` VALUES ('39', '12', '2015-12-09 11:37:01', '2015-12-09 11:37:01', '0', '0000,', '0', '7', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091137721_roujiamo.png', '肉夹馍', '[{\"kind\":\"五花肉\",\"num\":\" \\t一条 \"},{\"kind\":\"面粉\",\"num\":\" \\t500g 我做了6-7个馍 \"},{\"kind\":\"香菜\",\"num\":\"\"},{\"kind\":\"青椒\",\"num\":\"\"},{\"kind\":\"香料\",\"num\":\"八角桂皮花椒草果等等等等 \"},{\"kind\":\"调料\",\"num\":\" \\t生/老抽，料酒，白糖 \"}]', '[{\"intro\":\"原料\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091137644_bu1.png\"},{\"intro\":\"熬糖色，这是还没有熬到颜色的时候拍得。熬糖色这么分分钟就熬过头的东西，我怎么会浪费时间拍照呢\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091137856_bu2.png\"},{\"intro\":\"加入图一装香料的钢球，生抽，老抽，料酒，小火熬两个小时\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/20151209113730_bu3.png\"},{\"intro\":\"酵母用温水化开。面团揉到光滑。醒面30分钟\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091137195_bu4.png\"},{\"intro\":\"剁碎香菜，大葱，先生爱吃辣的，就放了青椒，烤香了一些孜然加在里面。\\r\\n\\r\\n西安同学说正宗肉夹馍是不加香菜跟青椒的。我是按照自己口味来调的料。大家可以自行改变。我觉得加辣油应该也好吃吧。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091137368_bu5.png\"}]', '0', null, '自我总结：菜谱看下来肉夹馍的馍是半发面，我发的太久了些，馍的口感不正宗，有些像烙馒头。下次改正 ', null, 'N');
INSERT INTO `t_cookbook` VALUES ('40', '8', '2015-12-09 11:39:49', '2015-12-09 11:39:49', '0', '0003,', '0', '1', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091139407_2015-12-09_113209.png', '小狮子便当', '[{\"kind\":\"米饭\",\"num\":\"适量\"},{\"kind\":\"鸡蛋\",\"num\":\"\"},{\"kind\":\"鸡翅\",\"num\":\"\"}]', '[{\"intro\":\"我们首先将米饭煮好\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139935_1.png\"},{\"intro\":\"接下来是盐煎鸡翅，步骤：1.鸡翅洗干净，加适量盐腌制（最好1小时以上）2.不粘内加少许油，将腌制好的鸡翅加入，小火慢煎3.将鸡翅翻面4.盖上锅盖，利用热量将鸡翅焖熟（记得要小火，全程不需要加水）大约5分钟。掀开锅盖，将正面的鸡翅皮煎至喜欢的颜色即可。5.吃的时候现磨点儿黑胡椒更赞。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139206_2.png\"},{\"intro\":\"再接下来我们做一个厚蛋烧，步骤：1鸡蛋加盐打散2.厚蛋烧专用锅加少许油刷一下（小直径的平底锅也可以）3.加入蛋液，刚好铺平锅4.鸡蛋差不多熟就可以将鸡蛋慢慢卷起5.卷好的第一层鸡蛋推至锅边，再下第二层蛋液6.蛋液差不多熟了，就可以继续卷了7.重复上面的步骤直到蛋液用完，想厚一点的话，可以用三个鸡蛋8.切块\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139403_3.png\"},{\"intro\":\"秋葵一根，鲜香菇改刀，脆皮香肠对半切开，切花，将全部材料用油盐水煮至熟\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139620_4.png\"},{\"intro\":\"以上材料准备完毕，我们开始制作小狮子便当：将生菜片垫在饭盒底部，用圆形的慕斯圈加入米饭，用小勺子压成圆形\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139790_5.png\"},{\"intro\":\"将盐煎鸡翅、秋葵、鲜香菇、脆皮香肠逐一摆好，完成！（也可以选择喜欢的应季蔬菜和喜欢的肉类摆盘）\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091139962_6.png\"}]', '0', null, '给小精灵做的可爱便当，小狮子的造型真心可爱！我这里用的厚蛋烧，肉类放了盐煎鸡翅，后面有做法的（做好吃的肉丸子或者其他的放进去都可以哟，看妈妈的想象空间如何了），首先我们看看是怎么样拼凑出可爱的小狮子造型的！', null, 'N');
INSERT INTO `t_cookbook` VALUES ('41', '12', '2015-12-09 11:43:56', '2015-12-09 11:43:56', '0', '', '0', '13', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091143323_liangpi.png', '凉皮', '[{\"kind\":\"面粉\",\"num\":\" \\t200克 \"},{\"kind\":\"凉水\",\"num\":\" \\t适量 \"},{\"kind\":\"盐\",\"num\":\" \\t3克 \"},{\"kind\":\"酵母\",\"num\":\"2克 \"}]', '[{\"intro\":\"干面粉加适量的水和一点盐和成面团，软硬无所谓，然后盖湿布醒上十几分钟\\r\\n自制凉皮的做法 步骤1 \",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091143273_lbu1.png\"},{\"intro\":\"在一个稍大的盆里放上一些凉水，把面团放进去\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091143444_lbu2.png\"},{\"intro\":\"水越来越白，淀粉被洗进水里，手里剩下的是面筋，这时候手里的面团会越来越散，没关系，最后打捞一下就可以了\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091143617_lbu4.png\"},{\"intro\":\"大约2分钟后，通过锅盖看到面饼开始起大泡鼓起来了。这时可开盖取出\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091143773_lbu5.png\"},{\"intro\":\"加盐、辣椒油、醋、蒜水、麻酱等等调味就好了，调味就很随意了，依个人口味来吧\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091143964_liangpi.png\"}]', '0', null, ' 自己动手做放心凉皮，虽然有点麻烦，但是真的不难 ', null, 'N');
INSERT INTO `t_cookbook` VALUES ('42', '12', '2015-12-09 11:50:49', '2015-12-09 11:50:49', '0', '0001,', '0', '6', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091150975_hulatang.png', '胡辣汤', '[{\"kind\":\"花生\",\"num\":\"12g\"},{\"kind\":\"熟牛肉 \",\"num\":\"一小块 \"},{\"kind\":\"酱油（老抽） \",\"num\":\"15ml \"},{\"kind\":\"海带丝\",\"num\":\"20g \"},{\"kind\":\"陈醋\",\"num\":\"5g \"},{\"kind\":\"干丝 \",\"num\":\"15g \"},{\"kind\":\"粉条\",\"num\":\"20g \"},{\"kind\":\"麻油\",\"num\":\"少许 \"}]', '[{\"intro\":\"面粉加45克水和成软面团，放在一个大碗中，加清水，量要刚刚没过面团，浸泡十分钟。\\r\\n胡辣汤（洗面筋）的做法 步骤1 \",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150384_hbu1.png\"},{\"intro\":\"用水不停的揉抓面团，直到面团变小，颜色变成淡灰色，这时候面筋就洗出来了。\\r\\n胡辣汤（洗面筋）的做法 步骤2 \",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150527_hbu2.png\"},{\"intro\":\"洗好的面筋取出，洗面筋的水不要倒掉，备用\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150672_hbu3.png\"},{\"intro\":\"干木耳泡发后切成丝，熟牛肉切小丁。锅内加一升清水，将牛肉丁放入。水开后，将面筋撕成小块丢入锅中，再加入粉条、花生、海带丝和干丝煮开\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150860_hbu4.png\"},{\"intro\":\"倒入洗面筋的水，顺时针方向搅拌\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150992_hbu5.png\"},{\"intro\":\"煮沸后加入酱油、胡椒粉、鸡精搅拌均匀，再煮一会，撇去浮沫即可。\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091150181_hbu7.png\"}]', '0', null, ' 胡辣汤有河南版和陕西丸子胡辣汤等几个版本，前几天发这个菜谱时有朋友说希望能做的再正宗些，我就重新做了一次，这一次用洗面筋的方法做河南口味的胡辣汤。 ', null, 'N');
INSERT INTO `t_cookbook` VALUES ('43', '8', '2015-12-09 11:51:55', '2015-12-09 11:51:55', '0', '0000,', '1', '15', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091151974_cp.png', '名古屋风味鸡翅便当', '[{\"kind\":\"鸡翅\",\"num\":\"10-12\"},{\"kind\":\"酱油\",\"num\":\"12勺\"}]', '[{\"intro\":\"纵向沿着鸡翅的骨骼切一刀，翻面在鸡皮上再轻轻剖几刀。处理过的鸡翅与蒜泥、生姜丝和料酒拌匀，使之入味\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091151525_1.png\"},{\"intro\":\"开中火，首先把鸡皮面朝下煎烤。因鸡皮油分多，此时并不需另加油。鸡皮面烤到黄金色后翻面，先放糖和少许料酒，入味后再加酱油。关火前放黑胡椒粉\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091151677_2.png\"},{\"intro\":\"做好鸡翅后的平锅并不用洗，利用它的油分和味道就可以做出配菜了。取四季豆中段，香菇切片。将四季豆在平锅里油煎，再放香菇，最后用酱油调味\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091151275_3.png\"},{\"intro\":\"用奶酪擦削胡萝卜，之后用盐、少量白醋（或柠檬汁）、芝麻调味。按个人口味可以加些橄榄油\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091152247_4.png\"},{\"intro\":\"完工！也可根据自己口味，将米饭做成饭团、加入鸡蛋等等\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512091152288_5.png\"}]', '0', null, '吉井忍，旅居北京的日本媳妇，热衷于中文写作以及为中国丈夫制作便当。本菜谱出自她的电子小书《秋日便当》。作者在文章中分享了日式便当制作方法，使用中国普通超市或菜市场买到的当季材料，成本控制在10元内，简便易学，同时也传达了健康、环保的生活理念。', null, 'N');
INSERT INTO `t_cookbook` VALUES ('45', '8', '2015-12-09 15:19:30', '2015-12-10 23:23:07', '0', '0003,0004,0010,', '1', '11', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512102323598_255.png', 'test', '[{\"kind\":\"111\",\"num\":\"111\"},{\"kind\":\"222\",\"num\":\"222\"}]', '[{\"intro\":\"1\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512102323699_dg.png\"},{\"intro\":\"2\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512102323215_dg.png\"},{\"intro\":\"3\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512102323770_a.png\"},{\"intro\":\"4\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512102323462_a.png\"},{\"intro\":\"5\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512102323466_a.png\"}]', '0', null, 'teste', null, 'N');
INSERT INTO `t_cookbook` VALUES ('46', '15', '2015-12-11 10:07:13', '2015-12-11 10:07:13', '0', '0001,0007,', '1', '0', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512111007496_13.jpg', 'test', '[{\"kind\":\"111\",\"num\":\"2222\"},{\"kind\":\"53543\",\"num\":\"5435\"},{\"kind\":\"34534\",\"num\":\"54345\"}]', '[{\"intro\":\"111\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512111007712_200.png\"},{\"intro\":\"11111\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512111007921_200.png\"},{\"intro\":\"111\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/20151211100792_200.png\"},{\"intro\":\"trt\",\"image\":\"http://7xoqvb.com1.z0.glb.clouddn.com/201512111007291_200.png\"}]', '0', null, 'iugyitf8frt', null, 'N');

-- ----------------------------
-- Table structure for `t_favour`
-- ----------------------------
DROP TABLE IF EXISTS `t_favour`;
CREATE TABLE `t_favour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `objectId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_15` (`user_id`) USING BTREE,
  CONSTRAINT `t_favour_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='点赞';

-- ----------------------------
-- Records of t_favour
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`user_id`) USING BTREE,
  CONSTRAINT `t_menu_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '2', '2015-12-02 11:29:53', '2015-12-09 11:29:58', '1', '11', '自制牛肉辣酱');
INSERT INTO `t_menu` VALUES ('2', '4', '2015-12-09 14:37:38', '2015-12-16 14:38:06', '0', '22', '水果沙拉');
INSERT INTO `t_menu` VALUES ('3', '3', '2015-12-08 14:38:31', '2015-12-24 14:38:34', '0', '33', '豆豉烤鱼');
INSERT INTO `t_menu` VALUES ('4', '4', '2015-12-04 15:55:07', '2015-12-04 15:55:11', '0', '奶茶', '好好喝的奶茶！');
INSERT INTO `t_menu` VALUES ('5', '2', '2015-12-08 15:26:47', '2015-12-08 15:26:47', '0', '我喜欢的', '收藏我所有喜欢的菜');
INSERT INTO `t_menu` VALUES ('6', '8', '2015-12-08 16:06:46', '2015-12-08 16:06:46', '0', '比', '哈哈哈哈哈哈哈哈哈哈 ');
INSERT INTO `t_menu` VALUES ('7', '8', '2015-12-08 17:52:27', '2015-12-08 17:52:27', '0', '比萨', '披萨(Pizza)是一种发源于意大利的食品，在全球颇受欢迎。披萨的通常做法是用发酵的圆面饼上面覆盖番茄酱，奶酪和其他配料，并由烤炉烤制而成');
INSERT INTO `t_menu` VALUES ('8', '8', '2015-12-08 21:49:00', '2015-12-08 21:49:00', '0', '蛋糕', '蛋糕是一种面食，通常是甜的，典型的蛋糕是以烤的方式制作出来。蛋糕的材料主要包括了面粉、甜味剂(通常是蔗糖)、黏合剂(一般是鸡蛋，素食主义者可用面筋和淀粉代替)、起酥油(一般是牛油或人造牛油，低脂肪含量的蛋糕会以浓缩果汁代替)，液体(牛奶，水或果汁)，香精和发酵剂(例如酵母或者发酵粉)。');
INSERT INTO `t_menu` VALUES ('9', '3', '2015-10-14 10:42:13', '2015-11-19 10:42:20', '0', '烤肉', '烤肉');
INSERT INTO `t_menu` VALUES ('10', '3', '2015-09-16 10:43:03', '2015-11-04 10:43:07', '0', '肠粉', '鸡蛋肠粉、肉肠粉');
INSERT INTO `t_menu` VALUES ('11', '4', '2015-10-15 10:44:05', '2015-12-02 10:44:09', '0', '寿司', '很好吃的寿司');
INSERT INTO `t_menu` VALUES ('12', '5', '2015-12-02 10:45:42', '2015-12-09 10:45:46', '0', '炸鸡', '多种方法做炸鸡');
INSERT INTO `t_menu` VALUES ('13', '12', '2015-12-09 11:24:20', '2015-12-09 11:24:20', '0', '山西小吃', '包括凉皮、肉夹馍、胡辣汤等');
INSERT INTO `t_menu` VALUES ('14', '12', '2015-12-09 11:52:12', '2015-12-09 11:52:12', '0', '日本料理', '日式料理');
INSERT INTO `t_menu` VALUES ('15', '8', '2015-12-09 15:20:57', '2015-12-09 15:20:57', '0', 'test', 'test');
INSERT INTO `t_menu` VALUES ('16', '15', '2015-12-11 10:07:42', '2015-12-11 10:07:42', '0', '123', '123');

-- ----------------------------
-- Table structure for `t_menu_cookbook`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_cookbook`;
CREATE TABLE `t_menu_cookbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) DEFAULT NULL,
  `cookbook_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_13` (`cookbook_id`) USING BTREE,
  KEY `FK_Reference_14` (`menu_id`) USING BTREE,
  CONSTRAINT `t_menu_cookbook_ibfk_1` FOREIGN KEY (`cookbook_id`) REFERENCES `t_cookbook` (`id`),
  CONSTRAINT `t_menu_cookbook_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_menu_cookbook
-- ----------------------------
INSERT INTO `t_menu_cookbook` VALUES ('3', '1', '18');
INSERT INTO `t_menu_cookbook` VALUES ('4', '15', '34');
INSERT INTO `t_menu_cookbook` VALUES ('5', '16', '45');

-- ----------------------------
-- Table structure for `t_production`
-- ----------------------------
DROP TABLE IF EXISTS `t_production`;
CREATE TABLE `t_production` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `publicDate` datetime DEFAULT NULL,
  `favour` int(11) DEFAULT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `titleImage` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookbook_title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookbook_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`user_id`) USING BTREE,
  CONSTRAINT `t_production_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_production
-- ----------------------------
INSERT INTO `t_production` VALUES ('1', '2', '2015-12-07 17:01:40', '2015-12-07 17:01:40', '0', null, '0', '比乐蒂摩卡壶煮', '第一次做好好吃！!', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512110904914_a.png', '比乐蒂摩卡壶煮', '18');
INSERT INTO `t_production` VALUES ('2', '8', '2015-12-09 15:20:22', '2015-12-09 15:20:22', '0', null, '0', 'test', '加了更多蔬菜，更适合早安哟（≧∇≦）', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512110908931_ScreenShot_20151211090828.png', 'test', '45');
INSERT INTO `t_production` VALUES ('3', '15', '2015-12-11 10:09:14', '2015-12-11 10:09:14', '0', null, '0', '蔓越莓马芬', 'tytdyuvtetyv', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512111009553_13.jpg', '蔓越莓马芬', '34');

-- ----------------------------
-- Table structure for `t_relation`
-- ----------------------------
DROP TABLE IF EXISTS `t_relation`;
CREATE TABLE `t_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_follower` bigint(20) DEFAULT NULL,
  `user_by_follower` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `read_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`user_follower`) USING BTREE,
  KEY `FK_Reference_4` (`user_by_follower`) USING BTREE,
  CONSTRAINT `t_relation_ibfk_1` FOREIGN KEY (`user_follower`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_relation_ibfk_2` FOREIGN KEY (`user_by_follower`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_relation
-- ----------------------------
INSERT INTO `t_relation` VALUES ('1', '2', '3', '2015-12-15 23:40:15', '2015-12-10 23:40:20', '0', '0');
INSERT INTO `t_relation` VALUES ('80', '10', '8', '2015-12-08 23:27:01', '2015-12-08 23:27:01', '0', '0');
INSERT INTO `t_relation` VALUES ('84', '2', '7', '2015-12-09 09:37:49', '2015-12-09 09:37:49', '0', '0');
INSERT INTO `t_relation` VALUES ('86', '8', '4', '2015-12-09 15:17:27', '2015-12-09 15:17:27', '0', '0');
INSERT INTO `t_relation` VALUES ('87', '2', '8', '2015-12-11 09:02:59', '2015-12-11 09:02:59', '0', '0');
INSERT INTO `t_relation` VALUES ('88', '15', '8', '2015-12-11 10:08:42', '2015-12-11 10:08:42', '0', '0');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT '0',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realName` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `face` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authentication` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', '2015-11-30 18:41:34', '2015-11-30 18:41:34', '0', 'SevenLin', 'ec8d6f2fc5d2631ccc6cf255bfa0a546', '79c24bd4-0e3e-4185-ab20-ac573b0e33f5', '13763070741', 'seven_linzegeng@163.com', '林泽耿', 'SevenLin~', '男', '2015-12-01', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512021402409face.png', '1');
INSERT INTO `t_user` VALUES ('3', '2015-12-01 09:16:21', '2015-12-01 09:16:21', '0', 'linzegeng', 'a7258d24200370f938e364cca288df54', '726de0e8-8de2-4915-a072-155a6b918450', null, '234234@123.com', null, null, null, null, 'http://7xoqvb.com1.z0.glb.clouddn.com/201512011742900face.png', '0');
INSERT INTO `t_user` VALUES ('4', '2015-12-01 10:12:50', '2015-12-01 10:12:50', '0', 'susmile', '9a3c790140f2c894f1ea2f7cd450f19b', 'a1a7a5e3-7e60-4d1a-93c1-9ec58002d980', null, 'suhaixia98@163.com', null, null, null, null, '', '0');
INSERT INTO `t_user` VALUES ('5', '2015-12-01 10:40:49', '2015-12-01 10:40:49', '0', 'zhanhongchen', 'ef49222b2387c47633c1a36aea1655b2', '7b21e2e5-5c1d-460d-924f-6446ac5dc8c3', null, '419722058@qq.com', null, null, null, null, null, '0');
INSERT INTO `t_user` VALUES ('6', '2015-12-01 17:13:50', '2015-12-01 17:13:50', '0', 'test', '3d47086f0111e0d4173cb8e573c487f3', '2c66203b-6a88-4117-8d6a-ed33fa12de9f', '13763070741', 'zxcstc1256@qq.com', 'test', 'test', '男', '2015-12-11', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512011715473face.png', '0');
INSERT INTO `t_user` VALUES ('7', '2015-12-02 17:12:05', '2015-12-02 17:12:05', '0', 'manggo ', '3e69ca237671ddec45549334ae8a667a', 'ce19d337-d64f-403b-8e15-7a6390dfef49', null, '745846359@qq.com', null, null, null, null, null, '0');
INSERT INTO `t_user` VALUES ('8', '2015-12-03 09:01:38', '2015-12-03 09:01:38', '0', 'Halisa', '87a678d3e82c2fb8077b804faf32d4aa', '9645b91d-9f77-4d91-a9bc-3bbd3ece90de', null, 'suhaixia98@163.com', null, null, null, null, 'http://7xoqvb.com1.z0.glb.clouddn.com/201512091518401200.png', '1');
INSERT INTO `t_user` VALUES ('9', '2015-12-08 15:54:57', '2015-12-08 15:54:57', '0', 'zegeng', 'e4a712d3e72d916cf5240cf266f6fda6', 'c645ef04-d113-4ac4-8044-5b6586ed5cb2', null, '740972287@qq.com', null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('10', '2015-12-08 22:44:05', '2015-12-08 22:44:05', '0', 'suhaixia', '9b3529fd1fe9a73bcf1240338e5678f5', 'b89166e0-eb6c-4be9-bfb1-375d6b420ad1', null, '543511055@qq.com', null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('11', '2015-12-09 11:09:00', '2015-12-09 11:09:00', '1', 'manggo1', 'e90d7df0a6b782299be99eff9d0148d1', '4283b6b1-495c-4db8-8977-23fcbc6cd621', null, '75846359@qq.com', null, null, null, null, null, '0');
INSERT INTO `t_user` VALUES ('12', '2015-12-09 11:22:17', '2015-12-09 11:22:17', '0', 'mango', '25716a97750a9dd520abae101c9689b5', '1e3e6b11-f796-414e-a2a3-f104dc9f65da', null, 'jiayouldf668@163.com', null, null, null, null, 'http://7xoqvb.com1.z0.glb.clouddn.com/20151209143712287bee8eejw1e4edsxjal4j20840aawf2.jpg', '1');
INSERT INTO `t_user` VALUES ('13', '2015-12-09 15:15:12', '2015-12-09 15:15:12', '0', 'cookshow123', '5a02e3acb0923e98c61644dc33f99a7d', '9d94a9d6-4f1c-4059-ab4f-eabad9208cd3', null, 'yingyong1123@163.com', null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('14', '2015-12-10 17:08:45', '2015-12-10 17:08:45', '0', '123345', '9f3c71caabd13ce5915154bf0716fcc3', '6a286c32-137f-4ad0-bb0d-cbb3e93bec93', null, '123@123.com', null, null, null, null, null, '0');
INSERT INTO `t_user` VALUES ('15', '2015-12-11 10:03:26', '2015-12-11 10:03:26', '0', 'linzegeng1234', 'b283954a080960bba94793e1d4b32d00', '0d9301d4-62c5-4a51-b99a-30aa451f3e6b', '123432423', '497789403@qq.com', 'wer', 'gsgdsf', '男', '2015-12-04', 'http://7xoqvb.com1.z0.glb.clouddn.com/201512111005642ScreenShot_20151211090828.png', '1');
