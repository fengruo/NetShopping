/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-11-03 21:41:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `adminname` varchar(20) NOT NULL DEFAULT '',
  `adminpwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('admin', 'admin');
INSERT INTO `adminuser` VALUES ('luofeng', '951231');

-- ----------------------------
-- Table structure for goodsegory
-- ----------------------------
DROP TABLE IF EXISTS `goodsegory`;
CREATE TABLE `goodsegory` (
  `egoryid` char(10) NOT NULL,
  `egoryname` varchar(20) DEFAULT NULL,
  `cades` text,
  PRIMARY KEY (`egoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsegory
-- ----------------------------
INSERT INTO `goodsegory` VALUES ('1', '印刷品', '');
INSERT INTO `goodsegory` VALUES ('2', '运动商品', null);
INSERT INTO `goodsegory` VALUES ('3', '电子商品', null);

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `GoodsNo` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`,`GoodsNo`),
  KEY `GoodsNo` (`GoodsNo`),
  CONSTRAINT `lineitem_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON UPDATE CASCADE,
  CONSTRAINT `lineitem_ibfk_2` FOREIGN KEY (`GoodsNo`) REFERENCES `my_goods` (`GoodsNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES ('16121514', '001', '1', '10.00');
INSERT INTO `lineitem` VALUES ('16121515', '001', '1', '10.00');
INSERT INTO `lineitem` VALUES ('16121545', '003 ', '330', '20.00');

-- ----------------------------
-- Table structure for mail
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `sendid` int(20) NOT NULL AUTO_INCREMENT,
  `orderid` int(20) NOT NULL,
  `sendtime` datetime DEFAULT NULL,
  `sendaddress` varchar(150) DEFAULT NULL,
  `sendstatus` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`sendid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `reguser` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '123', '123456', '2016-12-24 13:41:15', '1', '12356');
INSERT INTO `message` VALUES ('2', 'liu', '马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明马永明', '2016-12-24 13:41:15', '13', '');
INSERT INTO `message` VALUES ('3', 'b', 'b', '2016-12-24 14:18:16', '1', null);
INSERT INTO `message` VALUES ('4', '2', '2', '2016-12-24 14:18:30', '1', null);
INSERT INTO `message` VALUES ('5', '3', '3', '2016-12-24 14:18:39', '1', null);
INSERT INTO `message` VALUES ('6', '1', '1', '2016-12-24 14:18:50', '1', null);
INSERT INTO `message` VALUES ('7', '哈哈', '哈哈', '2016-12-24 15:56:11', '13', '');
INSERT INTO `message` VALUES ('8', '颠三倒四', '是多少多少', '2016-12-24 15:58:16', '13', '');

-- ----------------------------
-- Table structure for my_goods
-- ----------------------------
DROP TABLE IF EXISTS `my_goods`;
CREATE TABLE `my_goods` (
  `GoodsNo` varchar(30) NOT NULL,
  `GoodsName` varchar(40) NOT NULL,
  `egoryid` char(10) NOT NULL,
  `Content` varchar(3000) DEFAULT NULL,
  `unitprice` float DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Leav_number` int(11) DEFAULT NULL,
  `RegTime` date NOT NULL,
  PRIMARY KEY (`GoodsNo`),
  KEY `egoryid` (`egoryid`),
  CONSTRAINT `my_goods_ibfk_1` FOREIGN KEY (`egoryid`) REFERENCES `goodsegory` (`egoryid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_goods
-- ----------------------------
INSERT INTO `my_goods` VALUES ('001', '深思', '1', '杂志', '10', '500', '456', '2016-12-15');
INSERT INTO `my_goods` VALUES ('002', '四级题库', '1', '考试', '20', '500', '459', '2016-12-16');
INSERT INTO `my_goods` VALUES ('003', '故事书', '1', '休闲', '20', '500', '180', '2016-12-15');
INSERT INTO `my_goods` VALUES ('101', '足球', '2', '踢', '10', '200', '196', '2016-12-15');
INSERT INTO `my_goods` VALUES ('102', '篮球', '2', '拍', '20', '200', '180', '2016-12-15');
INSERT INTO `my_goods` VALUES ('103', '乒乓球', '2', '打', '20', '500', '489', '2016-12-15');
INSERT INTO `my_goods` VALUES ('201', '手表', '3', '时间', '100', '20', '20', '2016-12-15');
INSERT INTO `my_goods` VALUES ('202', '电脑', '3', '学习', '5000', '20', '10', '2016-12-15');
INSERT INTO `my_goods` VALUES ('203', '电视', '3', '娱乐', '2000', '20', '20', '2016-12-15');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL,
  `totalprice` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `reguser` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16121547 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('16121514', '13', '2016-12-16 11:02:14', '10.00', '1');
INSERT INTO `orders` VALUES ('16121515', '13', '2016-12-16 11:04:08', '10.00', '1');
INSERT INTO `orders` VALUES ('16121545', '13', '2016-12-18 13:48:10', '12140.00', '1');
INSERT INTO `orders` VALUES ('16121546', '13', '2017-01-02 15:23:12', '200.00', '1');

-- ----------------------------
-- Table structure for reguser
-- ----------------------------
DROP TABLE IF EXISTS `reguser`;
CREATE TABLE `reguser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `regtime` date DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reguser
-- ----------------------------
INSERT INTO `reguser` VALUES ('1', '落枫', '951231', '男', '18737619879', '汝州', '2016-12-15');
INSERT INTO `reguser` VALUES ('13', '张三', '123456', '男', '123456780', '信阳光山', '2016-12-15');
DROP TRIGGER IF EXISTS `userbuy`;
DELIMITER ;;
CREATE TRIGGER `userbuy` BEFORE INSERT ON `lineitem` FOR EACH ROW BEGIN 
    UPDATE my_goods SET Leav_number =Leav_number-new.quantity WHERE GoodsNo = new.GoodsNo;
  END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `orderbuy`;
DELIMITER ;;
CREATE TRIGGER `orderbuy` BEFORE INSERT ON `lineitem` FOR EACH ROW BEGIN 
    UPDATE orders SET totalprice =totalprice+new.quantity*new.unitprice WHERE orderid = new.orderid;
  END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `up_li`;
DELIMITER ;;
CREATE TRIGGER `up_li` AFTER INSERT ON `lineitem` FOR EACH ROW begin
	update lineitem set quantity=quantity+new.quantity where orderid=new.orderid;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `del_li`;
DELIMITER ;;
CREATE TRIGGER `del_li` AFTER DELETE ON `lineitem` FOR EACH ROW begin
	update my_goods set Leav_number=Leav_number+old.quantity where my_goods.GoodsNo=old.GoodsNo;
	update orders set totalprice=totalprice-old.quantity*old.unitprice where orders.orderid=old.orderid;
end
;;
DELIMITER ;
