/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : reimbursement

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-04-24 10:52:15
*/
use cms;
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
    `ID`           int(18) NOT NULL AUTO_INCREMENT,
    `Ico`          varchar(200)     DEFAULT NULL,
    `MenuName`     varchar(18)      DEFAULT NULL,
    `Number`       varchar(18)      DEFAULT NULL,
    `ParentNumber` varchar(18)      DEFAULT NULL,
    `Url`          varchar(200)     DEFAULT NULL,
    `Sort`         int(6)           DEFAULT NULL,
    `IsDelete`     int(1)  NOT NULL DEFAULT '0',
    `IsProhibit`   int(1)  NOT NULL DEFAULT '0',
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu`
VALUES ('1', 'glyphicon glyphicon-home', '设备管理', 'KD000001', null, '/jsp/equipment/equipmentAdministration.jsp', '1',
        '0', '0');
INSERT INTO `menu`
VALUES ('2', 'glyphicon glyphicon-home', '系统管理', 'KD000002', null, '/jsp/system/systemAdministration.jsp', '2', '0',
        '0');
INSERT INTO `menu`
VALUES ('3', 'glyphicon glyphicon-home', '系统设置', 'KD000003', 'KD000002', '/jsp/system/systemAdministration.jsp', '1',
        '0', '0');
INSERT INTO `menu`
VALUES ('4', 'glyphicon glyphicon-home', '菜单管理', 'KD000004', 'KD000002', '/jsp/system/systemcaidan.jsp', '2', '0', '0');
INSERT INTO `menu`
VALUES ('6', 'glyphicon glyphicon-home', '设备信息', 'KD000006', 'KD000001', '/jsp/equipment/equipmentAdministration.jsp',
        '1', '0', '0');
INSERT INTO `menu`
VALUES ('7', 'glyphicon glyphicon-home', '设备维护', 'KD000007', 'KD000001', '/jsp/equipment/equipmentList.jsp', '2', '0',
        '0');
