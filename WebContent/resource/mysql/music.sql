/*
Navicat MySQL Data Transfer

Source Server         : music
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : music

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-06 00:39:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adminpwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1234', '12');
INSERT INTO `admin` VALUES ('2', '1', '12');
INSERT INTO `admin` VALUES ('3', 'admin', 'admin');

-- ----------------------------
-- Table structure for lists
-- ----------------------------
DROP TABLE IF EXISTS `lists`;
CREATE TABLE `lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lists
-- ----------------------------
INSERT INTO `lists` VALUES ('1', '微微一笑很倾城', '1');
INSERT INTO `lists` VALUES ('2', '外国风情', '2');
INSERT INTO `lists` VALUES ('3', 'R&B', '3');

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `singername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songid` int(11) DEFAULT NULL,
  `singerid` int(11) DEFAULT NULL,
  `music` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES ('1', 'Brown Eyed Girls', 'Abracadabra', '1', '1', 'music/Abracadabra.mp3');
INSERT INTO `singer` VALUES ('2', 'Groove Coverage', 'Far Away From Home', '2', '2', 'music/Far Away From Home.mp3');
INSERT INTO `singer` VALUES ('3', 'Groove Coverage', 'God Is a Girl', '3', '2', 'music/GodIsaGirl.mp3');
INSERT INTO `singer` VALUES ('4', 'Secret', 'I Want You Back', '4', '3', 'music/I Want You Back.mp3');
INSERT INTO `singer` VALUES ('5', 'Groove Coverage', 'she', '5', '2', 'music/She.mp3');
INSERT INTO `singer` VALUES ('6', 'Rainbow Blaxx', 'Silhouette', '6', '4', 'music/Silhouette.mp3');
INSERT INTO `singer` VALUES ('7', 'Avril Lavigne', 'Til Tok', '7', '5', 'music/TiKToK.mp3');
INSERT INTO `singer` VALUES ('8', 'Rain', 'With U', '8', '6', 'music/WithU.mp3');

-- ----------------------------
-- Table structure for singersong
-- ----------------------------
DROP TABLE IF EXISTS `singersong`;
CREATE TABLE `singersong` (
  `id` int(11) NOT NULL,
  `songid` int(11) DEFAULT NULL,
  `singerid` int(11) DEFAULT NULL,
  `songname` varchar(255) DEFAULT NULL,
  `singername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singersong
-- ----------------------------
INSERT INTO `singersong` VALUES ('1', '1', '1', 'Abracadabra', 'Brown Eyed Girls');
INSERT INTO `singersong` VALUES ('2', '2', '2', 'Far Away From Home', 'Groove Coverage');
INSERT INTO `singersong` VALUES ('3', '3', '2', 'God Is a Girl', 'Groove Coverage');
INSERT INTO `singersong` VALUES ('4', '4', '3', 'I Want You Back', 'Secret');
INSERT INTO `singersong` VALUES ('5', '5', '2', 'she', 'Groove Coverage');
INSERT INTO `singersong` VALUES ('6', '6', '4', 'Silhouette', 'Rainbow Blaxx');
INSERT INTO `singersong` VALUES ('7', '7', '5', 'Til Tok', 'Avril Lavigne');
INSERT INTO `singersong` VALUES ('8', '8', '6', 'With U', 'Rain');

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singerid` int(11) DEFAULT NULL,
  `music` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', 'Abracadabra', '1', 'music/Abracadabra.mp3', 'Brown Eyed Girls');
INSERT INTO `song` VALUES ('2', 'Far Away From Home', '2', 'music/Far Away From Home.mp3', 'Groove Coverage');
INSERT INTO `song` VALUES ('3', 'God Is a Girl', '2', 'music/GodIsaGirl.mp3', 'Groove Coverage');
INSERT INTO `song` VALUES ('4', 'I Want You Back', '3', 'music/I Want You Back.mp3', 'Secret');
INSERT INTO `song` VALUES ('5', 'she', '2', 'music/She.mp3', 'Groove Coverage');
INSERT INTO `song` VALUES ('6', 'Silhouette', '4', 'music/Silhouette.mp3', 'Rainbow Blaxx');
INSERT INTO `song` VALUES ('7', 'Til Tok', '5', 'music/TiKToK.mp3', 'Avril Lavigne');
INSERT INTO `song` VALUES ('8', 'With U', '6', 'music/WithU.mp3', 'Rain');
INSERT INTO `song` VALUES ('9', 'you raise me up', '7', 'music/you.mp3', 'Brian');

-- ----------------------------
-- Table structure for songview
-- ----------------------------
DROP TABLE IF EXISTS `songview`;
CREATE TABLE `songview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of songview
-- ----------------------------
INSERT INTO `songview` VALUES ('31', 'Rain，男神耶', '8', '13', 'With', 'man');
INSERT INTO `songview` VALUES ('32', '好好听哦', '8', '13', 'With', 'man');

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songid` int(11) DEFAULT NULL,
  `listid` int(11) DEFAULT NULL,
  `listname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `music` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singerid` int(11) DEFAULT NULL,
  `listdes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES ('1', '1', '1', '微微一笑很倾城', 'Abracadabra', 'Brown Eyed Girls', 'music/Abracadabra.mp3', '1', '在这炎热的盛夏赠你一耳清凉，吹散燥热。');
INSERT INTO `song_list` VALUES ('2', '2', '2', '外国风情', 'Far Away From Home', 'Groove Coverage', 'music/Far Away From Home.mp3', '2', '轻快的电子旋律，\r\n总能在第一时间内侵入人心，\r\n尽管炎热的夏日未到，\r\n但已仿佛感受到那份清爽和惬意，\r\n而我好想就这样听着音乐，\r\n与你度过每分每秒。');
INSERT INTO `song_list` VALUES ('3', '1', '3', 'R&B', 'Abracadabra', 'Brown Eyed Girls', 'music/Abracadabra.mp3', '1', '对这种R&B的节奏蓝调真是很入迷，抒情的嗓音、旋律和节奏都是会让人上瘾的，不同于电音式的强烈节奏鼓点，如果说电音是让人上瘾的毒品的话，我觉得这种R&B的音乐更像是醇厚的香烟');
INSERT INTO `song_list` VALUES ('4', '4', '1', '微微一笑很倾城', 'I Want You Back', 'Secret', 'music/I Want You Back.mp3', '3', '在这炎热的盛夏赠你一耳清凉，吹散燥热。');
INSERT INTO `song_list` VALUES ('5', '5', '2', '外国风情', 'she', 'Groove Coverage', 'music/She.mp3', '2', '轻快的电子旋律，\r\n总能在第一时间内侵入人心，\r\n尽管炎热的夏日未到，\r\n但已仿佛感受到那份清爽和惬意，\r\n而我好想就这样听着音乐，\r\n与你度过每分每秒。');
INSERT INTO `song_list` VALUES ('6', '7', '1', '微微一笑很倾城', 'Til Tok', 'Avril Lavigne', 'music/TiKToK.mp3', '5', '在这炎热的盛夏赠你一耳清凉，吹散燥热。');
INSERT INTO `song_list` VALUES ('7', '8', '3', 'R&B', 'With U', 'Rain', 'music/WithU.mp3', '6', '对这种R&B的节奏蓝调真是很入迷，抒情的嗓音、旋律和节奏都是会让人上瘾的，不同于电音式的强烈节奏鼓点，如果说电音是让人上瘾的毒品的话，我觉得这种R&B的音乐更像是醇厚的香烟');
INSERT INTO `song_list` VALUES ('8', null, '0', null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for song_singer
-- ----------------------------
DROP TABLE IF EXISTS `song_singer`;
CREATE TABLE `song_singer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songid` int(11) DEFAULT NULL,
  `singerid` int(11) DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of song_singer
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userpwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('6', 'man', '1234');
INSERT INTO `user` VALUES ('7', 'mmm', '1234');
INSERT INTO `user` VALUES ('12', 'mm12', 'mm12');
INSERT INTO `user` VALUES ('14', '123', '12');

-- ----------------------------
-- Table structure for userlists
-- ----------------------------
DROP TABLE IF EXISTS `userlists`;
CREATE TABLE `userlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userlistsname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of userlists
-- ----------------------------
INSERT INTO `userlists` VALUES ('16', 'foreign song');
INSERT INTO `userlists` VALUES ('17', 'R&B');

-- ----------------------------
-- Table structure for user_lists
-- ----------------------------
DROP TABLE IF EXISTS `user_lists`;
CREATE TABLE `user_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userlistid` int(11) DEFAULT NULL,
  `listname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `songid` int(11) DEFAULT NULL,
  `songname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `singername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_lists
-- ----------------------------
INSERT INTO `user_lists` VALUES ('34', '16', 'foreign song', '1', 'Abracadabra', 'Brown Eyed Girls');
INSERT INTO `user_lists` VALUES ('35', '17', 'R&B', '8', 'With U', 'Rain');
INSERT INTO `user_lists` VALUES ('36', '16', 'foreign song', '8', 'With U', 'Rain');
INSERT INTO `user_lists` VALUES ('37', '16', 'foreign song', '7', 'Til Tok', 'Avril Lavigne');
INSERT INTO `user_lists` VALUES ('38', '18', '23333', '8', 'With U', 'Rain');
INSERT INTO `user_lists` VALUES ('39', '19', '233', '8', 'With U', 'Rain');
