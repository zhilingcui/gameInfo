/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : mota

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2024-04-19 11:51:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bussiness_analyse`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_analyse`;
CREATE TABLE `bussiness_analyse` (
  `id` int NOT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '分析名称',
  `initId` int DEFAULT NULL COMMENT '初始信息配置',
  `combineId` int DEFAULT NULL COMMENT '组合配置',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_analyse
-- ----------------------------

-- ----------------------------
-- Table structure for `bussiness_analyse_try`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_analyse_try`;
CREATE TABLE `bussiness_analyse_try` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(255) DEFAULT NULL COMMENT '尝试名称【第1次尝试】\r\n当某条路线完全不可行。或者某条路线完全可行算一次尝试。',
  `analyseId` int DEFAULT NULL COMMENT '关联的分析id',
  `tryIndex` int DEFAULT NULL COMMENT '尝试次数【从0开始】',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_analyse_try
-- ----------------------------

-- ----------------------------
-- Table structure for `bussiness_analyse_try_detail`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_analyse_try_detail`;
CREATE TABLE `bussiness_analyse_try_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `analyseTryId` int DEFAULT NULL COMMENT '分析尝试id',
  `tryDetailIndex` int DEFAULT NULL COMMENT '尝试步骤【从0开始】',
  `playerIdBefore` int DEFAULT NULL COMMENT '主人公id',
  `bloodBefore` int DEFAULT NULL COMMENT '血量',
  `attackBefore` int DEFAULT NULL COMMENT '攻击',
  `defenseBefore` int DEFAULT NULL COMMENT '防御',
  `experienceBefore` int DEFAULT NULL COMMENT '经验',
  `moneyBefore` int DEFAULT NULL COMMENT '金钱',
  `redKeyNumBefore` int DEFAULT NULL COMMENT '红钥匙',
  `yellowKeyNumBefore` int DEFAULT NULL COMMENT '黄钥匙',
  `blueKeyNumBefore` int DEFAULT NULL COMMENT '蓝钥匙',
  `bloodAfter` int DEFAULT NULL COMMENT '血量',
  `attackAfter` int DEFAULT NULL COMMENT '攻击',
  `defenseAfter` int DEFAULT NULL COMMENT '防御',
  `experienceAfter` int DEFAULT NULL COMMENT '经验',
  `moneyAfter` int DEFAULT NULL COMMENT '金钱',
  `redKeyNumAfter` int DEFAULT NULL COMMENT '红钥匙',
  `yellowKeyNumAfter` int DEFAULT NULL COMMENT '黄钥匙',
  `blueKeyNumAfter` int DEFAULT NULL COMMENT '蓝钥匙',
  `meetType` tinyint DEFAULT NULL COMMENT '类型1.怪物2.物品3.地形4.npc',
  `meetId` int DEFAULT NULL COMMENT '遭遇物的id',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_analyse_try_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `bussiness_combine`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_combine`;
CREATE TABLE `bussiness_combine` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '组合名称',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_combine
-- ----------------------------

-- ----------------------------
-- Table structure for `bussiness_combine_tree`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_combine_tree`;
CREATE TABLE `bussiness_combine_tree` (
  `id` int NOT NULL COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '节点名称',
  `parentId` int DEFAULT NULL COMMENT '节点父id',
  `type` tinyint DEFAULT NULL COMMENT '类型1.怪物2.物品3.地形4.npc',
  `linkId` int DEFAULT NULL COMMENT '关联信息的id',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_combine_tree
-- ----------------------------

-- ----------------------------
-- Table structure for `bussiness_init_list`
-- ----------------------------
DROP TABLE IF EXISTS `bussiness_init_list`;
CREATE TABLE `bussiness_init_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '初始信息名称',
  `playerId` int DEFAULT NULL COMMENT '主人公id',
  `blood` int DEFAULT NULL COMMENT '血量',
  `attack` int DEFAULT NULL COMMENT '攻击',
  `defense` int DEFAULT NULL COMMENT '防御',
  `experience` int DEFAULT NULL COMMENT '经验',
  `money` int DEFAULT NULL COMMENT '金钱',
  `redKeyNum` int DEFAULT NULL COMMENT '红钥匙',
  `yellowKeyNum` int DEFAULT NULL COMMENT '黄钥匙',
  `blueKeyNum` int DEFAULT NULL COMMENT '蓝钥匙',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `bussiness_init_list_ibfk_1` (`playerId`),
  CONSTRAINT `bussiness_init_list_ibfk_1` FOREIGN KEY (`playerId`) REFERENCES `config_player_list` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of bussiness_init_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_data_dict`
-- ----------------------------
DROP TABLE IF EXISTS `config_data_dict`;
CREATE TABLE `config_data_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字典常量名称',
  `keyName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '键名称',
  `note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;

-- ----------------------------
-- Records of config_data_dict
-- ----------------------------

-- ----------------------------
-- Table structure for `config_data_dict_value`
-- ----------------------------
DROP TABLE IF EXISTS `config_data_dict_value`;
CREATE TABLE `config_data_dict_value` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `keyId` int NOT NULL COMMENT '关联数据字典【config_data_dict】id',
  `value` varchar(32) DEFAULT NULL COMMENT '值',
  `label` varchar(16) DEFAULT NULL COMMENT '值标签',
  `sort` tinyint(1) DEFAULT NULL COMMENT '排序',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_config_data_dict_value_keyId` (`keyId`),
  CONSTRAINT `fk_config_data_dict_value_keyId` FOREIGN KEY (`keyId`) REFERENCES `config_data_dict` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_data_dict_value
-- ----------------------------

-- ----------------------------
-- Table structure for `config_goods_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_goods_list`;
CREATE TABLE `config_goods_list` (
  `id` int NOT NULL COMMENT '自增id',
  `name` varchar(32) DEFAULT NULL COMMENT '物品名称',
  `image` blob COMMENT '二进制图像',
  `type` tinyint DEFAULT NULL COMMENT '物品类型:1.血瓶2.剑3.盾4.钥匙钥匙(红黄蓝)5.特殊类型6.战斗类型道具7.直接增益型类型',
  `blood` int DEFAULT NULL COMMENT '血量',
  `attack` int DEFAULT NULL COMMENT '攻击',
  `defense` int DEFAULT NULL COMMENT '防御',
  `keyType` tinyint DEFAULT NULL COMMENT '1.红钥匙2.黄钥匙3.蓝钥匙',
  `stage` tinyint DEFAULT NULL COMMENT '阶段(1:战斗前，2.战斗中，3.战斗结束)',
  `calcFun` varchar(32) DEFAULT NULL COMMENT '计算方式',
  `calcParam` varchar(32) DEFAULT NULL COMMENT '计算参数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_goods_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_landform_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_landform_list`;
CREATE TABLE `config_landform_list` (
  `id` int NOT NULL COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '地形名称',
  `image` blob COMMENT '二进制图像',
  `type` tinyint DEFAULT NULL COMMENT '物品类型:1.地板2.墙壁3.门4.建筑物',
  `buildingType` tinyint DEFAULT NULL COMMENT '1.商店',
  `doorType` tinyint DEFAULT NULL COMMENT '1.红门2.黄门3.蓝门4.条件门',
  `wallType` tinyint DEFAULT NULL COMMENT '1.实体墙2.条件墙',
  `judgeFun` varchar(32) DEFAULT NULL COMMENT '遭遇时的判断函数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_landform_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_monster_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_monster_list`;
CREATE TABLE `config_monster_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '怪物名称',
  `image` blob COMMENT '二进制图像',
  `blood` int DEFAULT NULL COMMENT '血量',
  `attack` int DEFAULT NULL COMMENT '攻击',
  `defense` int DEFAULT NULL COMMENT '防御',
  `experience` int DEFAULT NULL COMMENT '经验',
  `money` int DEFAULT NULL COMMENT '金钱',
  `skillId` int DEFAULT NULL COMMENT '技能关联【config_skill_list】id',
  `weaknessId` int DEFAULT NULL COMMENT '弱点关联【config_weakness_list】id',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `skillId` (`skillId`),
  KEY `weaknessId` (`weaknessId`),
  CONSTRAINT `skillId` FOREIGN KEY (`skillId`) REFERENCES `config_skill_list` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `weaknessId` FOREIGN KEY (`weaknessId`) REFERENCES `config_weakness_list` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_monster_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_npc_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_npc_list`;
CREATE TABLE `config_npc_list` (
  `id` int NOT NULL COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT 'npm名称',
  `image` blob COMMENT '二进制图像',
  `judgeFun` varchar(32) DEFAULT NULL COMMENT '遭遇时的判断函数',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_npc_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_player_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_player_list`;
CREATE TABLE `config_player_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(32) DEFAULT NULL COMMENT '游戏主人公名称',
  `image` blob COMMENT '二进制图像',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_player_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_skill_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_skill_list`;
CREATE TABLE `config_skill_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '技能名称',
  `image` blob COMMENT '二进制图像',
  `stage` tinyint DEFAULT NULL COMMENT '阶段(1:战斗前，2.战斗中，3.战斗结束)',
  `damageWay` tinyint DEFAULT NULL COMMENT '伤害方式(1:固定伤害，2.百分比伤害)',
  `damageValue` int DEFAULT NULL COMMENT '伤害值',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_skill_list
-- ----------------------------

-- ----------------------------
-- Table structure for `config_weakness_list`
-- ----------------------------
DROP TABLE IF EXISTS `config_weakness_list`;
CREATE TABLE `config_weakness_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `name` varchar(32) DEFAULT NULL COMMENT '弱点名称',
  `image` blob COMMENT '二进制图像',
  `stage` tinyint DEFAULT NULL COMMENT '阶段(1:战斗前，2.战斗中，3.战斗结束)',
  `damageWay` tinyint DEFAULT NULL COMMENT '伤害方式(1:固定伤害，2.百分比伤害)',
  `damageValue` int DEFAULT NULL COMMENT '伤害值',
  `note` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of config_weakness_list
-- ----------------------------

-- ----------------------------
-- Table structure for `z_demo`
-- ----------------------------
DROP TABLE IF EXISTS `z_demo`;
CREATE TABLE `z_demo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of z_demo
-- ----------------------------
