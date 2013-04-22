/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : enong365

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-04-22 09:47:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `oc_address`
-- ----------------------------
DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_address
-- ----------------------------
INSERT INTO `oc_address` VALUES ('1', '1', 'sa', 'aaa', '', '', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '44', '705');

-- ----------------------------
-- Table structure for `oc_affiliate`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate`;
CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_affiliate_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `oc_affiliate_transaction`;
CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_affiliate_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute
-- ----------------------------
INSERT INTO `oc_attribute` VALUES ('1', '1', '2');
INSERT INTO `oc_attribute` VALUES ('2', '1', '1');
INSERT INTO `oc_attribute` VALUES ('3', '1', '3');
INSERT INTO `oc_attribute` VALUES ('4', '1', '4');

-- ----------------------------
-- Table structure for `oc_attribute_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_description
-- ----------------------------
INSERT INTO `oc_attribute_description` VALUES ('1', '1', '规 格');
INSERT INTO `oc_attribute_description` VALUES ('2', '1', '保质期');
INSERT INTO `oc_attribute_description` VALUES ('3', '1', '产 地');
INSERT INTO `oc_attribute_description` VALUES ('4', '1', '存储条件');

-- ----------------------------
-- Table structure for `oc_attribute_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group
-- ----------------------------
INSERT INTO `oc_attribute_group` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `oc_attribute_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_attribute_group_description
-- ----------------------------
INSERT INTO `oc_attribute_group_description` VALUES ('1', '1', '蔬菜类');

-- ----------------------------
-- Table structure for `oc_banner`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_banner_image`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_banner_image_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_banner_image_description`;
CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_banner_image_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category
-- ----------------------------
INSERT INTO `oc_category` VALUES ('1', '', '0', '1', '1', '0', '1', '2013-04-21 00:46:27', '2013-04-21 00:49:36');
INSERT INTO `oc_category` VALUES ('2', '', '0', '1', '1', '0', '1', '2013-04-21 00:49:26', '2013-04-21 00:49:26');
INSERT INTO `oc_category` VALUES ('3', '', '0', '1', '1', '0', '1', '2013-04-21 00:49:52', '2013-04-21 00:49:52');
INSERT INTO `oc_category` VALUES ('5', '', '1', '0', '1', '0', '1', '2013-04-21 10:13:59', '2013-04-21 10:13:59');
INSERT INTO `oc_category` VALUES ('4', '', '1', '1', '1', '1', '1', '2013-04-21 00:50:13', '2013-04-21 10:11:52');

-- ----------------------------
-- Table structure for `oc_category_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_description
-- ----------------------------
INSERT INTO `oc_category_description` VALUES ('5', '1', '蔬菜', '', '', '');
INSERT INTO `oc_category_description` VALUES ('3', '1', '休闲食品', '', '', '');
INSERT INTO `oc_category_description` VALUES ('2', '1', '酒水饮料', '', '', '');
INSERT INTO `oc_category_description` VALUES ('1', '1', '生鲜食品', '', '', '');
INSERT INTO `oc_category_description` VALUES ('4', '1', '水果', '', '', '');

-- ----------------------------
-- Table structure for `oc_category_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_filter
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_category_path`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_path
-- ----------------------------
INSERT INTO `oc_category_path` VALUES ('1', '1', '0');
INSERT INTO `oc_category_path` VALUES ('5', '1', '0');
INSERT INTO `oc_category_path` VALUES ('5', '5', '1');
INSERT INTO `oc_category_path` VALUES ('4', '1', '0');
INSERT INTO `oc_category_path` VALUES ('4', '4', '1');
INSERT INTO `oc_category_path` VALUES ('2', '2', '0');
INSERT INTO `oc_category_path` VALUES ('3', '3', '0');

-- ----------------------------
-- Table structure for `oc_category_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_category_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_category_to_store
-- ----------------------------
INSERT INTO `oc_category_to_store` VALUES ('1', '0');
INSERT INTO `oc_category_to_store` VALUES ('2', '0');
INSERT INTO `oc_category_to_store` VALUES ('3', '0');
INSERT INTO `oc_category_to_store` VALUES ('4', '0');
INSERT INTO `oc_category_to_store` VALUES ('5', '0');

-- ----------------------------
-- Table structure for `oc_country`
-- ----------------------------
DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_country
-- ----------------------------
INSERT INTO `oc_country` VALUES ('44', '中国 ', 'CN', 'CHN', '', '1', '1');

-- ----------------------------
-- Table structure for `oc_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon
-- ----------------------------
INSERT INTO `oc_coupon` VALUES ('4', '折抵10%', '2222', 'P', '10.0000', '0', '0', '0.0000', '2011-01-01', '2012-01-01', '10', '10', '1', '2009-01-27 13:55:03');
INSERT INTO `oc_coupon` VALUES ('5', '免费配送', '3333', 'P', '0.0000', '0', '1', '100.0000', '2009-03-01', '2009-08-31', '10', '10', '1', '2009-03-14 21:13:53');
INSERT INTO `oc_coupon` VALUES ('6', '折抵10元', '1111', 'F', '10.0000', '0', '0', '10.0000', '1970-11-01', '2020-11-01', '100000', '10000', '1', '2009-03-14 21:15:18');

-- ----------------------------
-- Table structure for `oc_coupon_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_category
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_coupon_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_coupon_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_coupon_product
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_currency`
-- ----------------------------
DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_currency
-- ----------------------------
INSERT INTO `oc_currency` VALUES ('1', '人民币', 'CNY', '￥', '', '2', '1.00000000', '1', '2013-04-19 14:25:00');

-- ----------------------------
-- Table structure for `oc_customer`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer
-- ----------------------------
INSERT INTO `oc_customer` VALUES ('1', '0', 'sa', 'aaa', 'a@a.com', '12321321', '', '71b0cf2059929175fd8bc399039cdb886c5acb13', 'b7ac3f4b0', 'a:0:{}', '', '0', '1', '1', '127.0.0.1', '1', '1', '', '2013-04-19 21:55:15');

-- ----------------------------
-- Table structure for `oc_customer_ban_ip`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_ban_ip`;
CREATE TABLE `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_ban_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_field`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_field`;
CREATE TABLE `oc_customer_field` (
  `customer_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_field
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group
-- ----------------------------
INSERT INTO `oc_customer_group` VALUES ('1', '0', '1', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `oc_customer_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_group_description
-- ----------------------------
INSERT INTO `oc_customer_group_description` VALUES ('1', '1', 'Default', 'test');

-- ----------------------------
-- Table structure for `oc_customer_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_ip`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_ip
-- ----------------------------
INSERT INTO `oc_customer_ip` VALUES ('1', '1', '127.0.0.1', '2013-04-19 21:55:19');

-- ----------------------------
-- Table structure for `oc_customer_online`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_online
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_reward`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_reward
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_customer_transaction`
-- ----------------------------
DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_customer_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_to_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_to_customer_group`;
CREATE TABLE `oc_custom_field_to_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_to_customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_custom_field_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_custom_field_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_download`
-- ----------------------------
DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_download_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_download_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_extension`
-- ----------------------------
DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_extension
-- ----------------------------
INSERT INTO `oc_extension` VALUES ('23', 'payment', 'cod');
INSERT INTO `oc_extension` VALUES ('22', 'total', 'shipping');
INSERT INTO `oc_extension` VALUES ('57', 'total', 'sub_total');
INSERT INTO `oc_extension` VALUES ('58', 'total', 'tax');
INSERT INTO `oc_extension` VALUES ('59', 'total', 'total');
INSERT INTO `oc_extension` VALUES ('410', 'module', 'banner');
INSERT INTO `oc_extension` VALUES ('426', 'module', 'carousel');
INSERT INTO `oc_extension` VALUES ('390', 'total', 'credit');
INSERT INTO `oc_extension` VALUES ('387', 'shipping', 'flat');
INSERT INTO `oc_extension` VALUES ('349', 'total', 'handling');
INSERT INTO `oc_extension` VALUES ('350', 'total', 'low_order_fee');
INSERT INTO `oc_extension` VALUES ('389', 'total', 'coupon');
INSERT INTO `oc_extension` VALUES ('413', 'module', 'category');
INSERT INTO `oc_extension` VALUES ('411', 'module', 'affiliate');
INSERT INTO `oc_extension` VALUES ('408', 'module', 'account');
INSERT INTO `oc_extension` VALUES ('393', 'total', 'reward');
INSERT INTO `oc_extension` VALUES ('398', 'total', 'voucher');
INSERT INTO `oc_extension` VALUES ('407', 'payment', 'free_checkout');
INSERT INTO `oc_extension` VALUES ('427', 'module', 'featured');
INSERT INTO `oc_extension` VALUES ('419', 'module', 'slideshow');
INSERT INTO `oc_extension` VALUES ('428', 'module', 'popupcategory');

-- ----------------------------
-- Table structure for `oc_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter
-- ----------------------------
INSERT INTO `oc_filter` VALUES ('1', '1', '1');
INSERT INTO `oc_filter` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for `oc_filter_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_description
-- ----------------------------
INSERT INTO `oc_filter_description` VALUES ('1', '1', '1', '江苏');
INSERT INTO `oc_filter_description` VALUES ('2', '1', '1', '上海');

-- ----------------------------
-- Table structure for `oc_filter_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group
-- ----------------------------
INSERT INTO `oc_filter_group` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `oc_filter_group_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_filter_group_description
-- ----------------------------
INSERT INTO `oc_filter_group_description` VALUES ('1', '1', '销售区域');

-- ----------------------------
-- Table structure for `oc_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_geo_zone
-- ----------------------------
INSERT INTO `oc_geo_zone` VALUES ('6', '上海市', '上海市', '0000-00-00 00:00:00', '2013-04-19 15:52:19');
INSERT INTO `oc_geo_zone` VALUES ('5', '江苏省', '江苏省', '0000-00-00 00:00:00', '2013-04-19 15:43:39');

-- ----------------------------
-- Table structure for `oc_information`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information
-- ----------------------------
INSERT INTO `oc_information` VALUES ('3', '1', '3', '1');
INSERT INTO `oc_information` VALUES ('4', '1', '1', '1');
INSERT INTO `oc_information` VALUES ('5', '1', '4', '1');
INSERT INTO `oc_information` VALUES ('6', '1', '2', '1');

-- ----------------------------
-- Table structure for `oc_information_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_description
-- ----------------------------
INSERT INTO `oc_information_description` VALUES ('4', '1', '关于我们', '&lt;p&gt;\r\n	关于我们&lt;/p&gt;\r\n');
INSERT INTO `oc_information_description` VALUES ('5', '1', '政策 &amp; 条款', '&lt;p&gt;\r\n	政策 &amp; 条款&lt;/p&gt;\r\n');
INSERT INTO `oc_information_description` VALUES ('3', '1', '隐私权声明', '&lt;p&gt;\r\n	隐私权声明&lt;/p&gt;\r\n');
INSERT INTO `oc_information_description` VALUES ('6', '1', '配送说明', '&lt;p&gt;\r\n	配送说明&lt;/p&gt;\r\n');

-- ----------------------------
-- Table structure for `oc_information_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_information_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_information_to_store
-- ----------------------------
INSERT INTO `oc_information_to_store` VALUES ('3', '0');
INSERT INTO `oc_information_to_store` VALUES ('4', '0');
INSERT INTO `oc_information_to_store` VALUES ('5', '0');
INSERT INTO `oc_information_to_store` VALUES ('6', '0');

-- ----------------------------
-- Table structure for `oc_language`
-- ----------------------------
DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_language
-- ----------------------------
INSERT INTO `oc_language` VALUES ('1', '简体中文', 'cn', 'zh,zh-hk,zh-cn,zh-cn.UTF-8,cn-gb,chinese', 'cn.png', 'chinese', 'chinese', '0', '1');

-- ----------------------------
-- Table structure for `oc_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout
-- ----------------------------
INSERT INTO `oc_layout` VALUES ('1', '首页(Home)');
INSERT INTO `oc_layout` VALUES ('2', '商品(Product)');
INSERT INTO `oc_layout` VALUES ('3', '目录(Category)');
INSERT INTO `oc_layout` VALUES ('4', '预设(Default)');
INSERT INTO `oc_layout` VALUES ('5', '品牌(Manufacturer)');
INSERT INTO `oc_layout` VALUES ('6', '账户(Account)');
INSERT INTO `oc_layout` VALUES ('7', '结账(Checkout)');
INSERT INTO `oc_layout` VALUES ('8', '联络(Contact)');
INSERT INTO `oc_layout` VALUES ('9', '网站地图(Sitemap)');
INSERT INTO `oc_layout` VALUES ('10', '推荐账户(Affiliate)');
INSERT INTO `oc_layout` VALUES ('11', '商店信息(Information)');

-- ----------------------------
-- Table structure for `oc_layout_route`
-- ----------------------------
DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_layout_route
-- ----------------------------
INSERT INTO `oc_layout_route` VALUES ('30', '6', '0', 'account');
INSERT INTO `oc_layout_route` VALUES ('17', '10', '0', 'affiliate/');
INSERT INTO `oc_layout_route` VALUES ('29', '3', '0', 'product/category');
INSERT INTO `oc_layout_route` VALUES ('26', '1', '0', 'common/home');
INSERT INTO `oc_layout_route` VALUES ('20', '2', '0', 'product/product');
INSERT INTO `oc_layout_route` VALUES ('24', '11', '0', 'information/information');
INSERT INTO `oc_layout_route` VALUES ('22', '5', '0', 'product/manufacturer');
INSERT INTO `oc_layout_route` VALUES ('23', '7', '0', 'checkout/');
INSERT INTO `oc_layout_route` VALUES ('31', '8', '0', 'information/contact');
INSERT INTO `oc_layout_route` VALUES ('32', '9', '0', 'information/sitemap');

-- ----------------------------
-- Table structure for `oc_length_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class
-- ----------------------------
INSERT INTO `oc_length_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_length_class` VALUES ('2', '10.00000000');
INSERT INTO `oc_length_class` VALUES ('3', '0.39370000');

-- ----------------------------
-- Table structure for `oc_length_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_length_class_description
-- ----------------------------
INSERT INTO `oc_length_class_description` VALUES ('1', '1', '公分', 'cm');
INSERT INTO `oc_length_class_description` VALUES ('2', '1', '公厘', 'mm');
INSERT INTO `oc_length_class_description` VALUES ('3', '1', '英吋', 'in');

-- ----------------------------
-- Table structure for `oc_manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_manufacturer_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_manufacturer_to_store
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option
-- ----------------------------
INSERT INTO `oc_option` VALUES ('1', 'datetime', '1');

-- ----------------------------
-- Table structure for `oc_option_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_description
-- ----------------------------
INSERT INTO `oc_option_description` VALUES ('1', '1', '配送时间');

-- ----------------------------
-- Table structure for `oc_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_option_value_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_option_value_description
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(32) NOT NULL,
  `payment_company_id` varchar(32) NOT NULL,
  `payment_tax_id` varchar(32) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(32) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order
-- ----------------------------
INSERT INTO `oc_order` VALUES ('1', '0', 'INV-2013-00', '0', 'Your Store', 'http://localhost/enong365/', '1', '1', 'sa', 'aaa', 'a@a.com', '12321321', '', 'sa', 'aaa', '', '', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '货到付款', 'cod', 'sa', 'aaa', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '固定运费率', 'flat.flat', 'aaaaa', '271.0000', '1', '0', '0.0000', '1', '1', 'CNY', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'zh-CN', '2013-04-19 21:55:42', '2013-04-19 21:55:57');
INSERT INTO `oc_order` VALUES ('2', '0', 'INV-2013-00', '0', 'eNong365', 'http://localhost/enong365/', '1', '1', 'sa', 'aaa', 'a@a.com', '12321321', '', 'sa', 'aaa', '', '', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '货到付款', 'cod', 'sa', 'aaa', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '固定运费率', 'flat.flat', '', '117.5000', '1', '0', '0.0000', '1', '1', 'CNY', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'zh-CN', '2013-04-21 11:36:03', '2013-04-21 11:36:07');
INSERT INTO `oc_order` VALUES ('3', '0', 'INV-2013-00', '0', 'eNong365', 'http://localhost/enong365/', '1', '1', 'sa', 'aaa', 'a@a.com', '12321321', '', 'sa', 'aaa', '', '', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '货到付款', 'cod', 'sa', 'aaa', '', 'aaaaaaaaaaaaa', '', 'aaa', 'aaaaa', '中国 ', '44', '宁夏', '705', '', '固定运费率', 'flat.flat', '', '12.5000', '1', '0', '0.0000', '1', '1', 'CNY', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 'zh-CN', '2013-04-21 11:48:18', '2013-04-21 11:48:19');

-- ----------------------------
-- Table structure for `oc_order_download`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_download`;
CREATE TABLE `oc_order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_download
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_field`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_field`;
CREATE TABLE `oc_order_field` (
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` int(128) NOT NULL,
  `value` text NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_field
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_fraud`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_fraud`;
CREATE TABLE `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_fraud
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_order_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_history
-- ----------------------------
INSERT INTO `oc_order_history` VALUES ('1', '1', '1', '1', '', '2013-04-19 21:55:57');
INSERT INTO `oc_order_history` VALUES ('2', '2', '1', '1', '', '2013-04-21 11:36:07');
INSERT INTO `oc_order_history` VALUES ('3', '3', '1', '1', '', '2013-04-21 11:48:19');

-- ----------------------------
-- Table structure for `oc_order_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_option
-- ----------------------------
INSERT INTO `oc_order_option` VALUES ('1', '1', '1', '217', '3', '选择', '蓝色', 'select');
INSERT INTO `oc_order_option` VALUES ('2', '1', '1', '218', '6', '单选框', '中号', 'radio');
INSERT INTO `oc_order_option` VALUES ('3', '1', '1', '223', '9', '复选框', '复选 2', 'checkbox');
INSERT INTO `oc_order_option` VALUES ('4', '1', '1', '208', '0', '文本', 'test', 'text');
INSERT INTO `oc_order_option` VALUES ('5', '1', '1', '209', '0', '多行文本', 'dds', 'textarea');
INSERT INTO `oc_order_option` VALUES ('6', '1', '1', '222', '0', '文档', 'QA.txt.3e135a625701527cfe48b98c04b875dc', 'file');
INSERT INTO `oc_order_option` VALUES ('7', '1', '1', '219', '0', '日期', '2011-02-20', 'date');
INSERT INTO `oc_order_option` VALUES ('8', '1', '1', '221', '0', '时间', '22:25', 'time');
INSERT INTO `oc_order_option` VALUES ('9', '1', '1', '220', '0', '日期 &amp; 时间', '2011-02-20 22:25', 'datetime');
INSERT INTO `oc_order_option` VALUES ('10', '3', '3', '1', '0', '配送时间', '2013-04-22 8:30', 'datetime');

-- ----------------------------
-- Table structure for `oc_order_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_product
-- ----------------------------
INSERT INTO `oc_order_product` VALUES ('1', '1', '42', 'Apple Cinema 30&quot;', 'Product 15', '2', '133.0000', '266.0000', '0.0000', '200');
INSERT INTO `oc_order_product` VALUES ('2', '2', '1', '山药', '山药', '15', '7.5000', '112.5000', '0.0000', '0');
INSERT INTO `oc_order_product` VALUES ('3', '3', '1', '山药', '山药', '1', '7.5000', '7.5000', '0.0000', '0');

-- ----------------------------
-- Table structure for `oc_order_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_status
-- ----------------------------
INSERT INTO `oc_order_status` VALUES ('1', '1', '待处理');
INSERT INTO `oc_order_status` VALUES ('2', '1', '处理中');
INSERT INTO `oc_order_status` VALUES ('3', '1', '已配送');
INSERT INTO `oc_order_status` VALUES ('7', '1', '已取消');
INSERT INTO `oc_order_status` VALUES ('5', '1', '已完成');
INSERT INTO `oc_order_status` VALUES ('8', '1', '已拒绝');
INSERT INTO `oc_order_status` VALUES ('9', '1', '取消恢复');
INSERT INTO `oc_order_status` VALUES ('10', '1', '失败');
INSERT INTO `oc_order_status` VALUES ('11', '1', '已退款');
INSERT INTO `oc_order_status` VALUES ('12', '1', '已冲销');
INSERT INTO `oc_order_status` VALUES ('13', '1', '已扣款');
INSERT INTO `oc_order_status` VALUES ('14', '1', '过期');
INSERT INTO `oc_order_status` VALUES ('15', '1', '已处理');
INSERT INTO `oc_order_status` VALUES ('16', '1', '作废');

-- ----------------------------
-- Table structure for `oc_order_total`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_total
-- ----------------------------
INSERT INTO `oc_order_total` VALUES ('1', '1', 'sub_total', '商品总额', '￥266.00', '266.0000', '1');
INSERT INTO `oc_order_total` VALUES ('2', '1', 'shipping', '固定运费率', '￥5.00', '5.0000', '3');
INSERT INTO `oc_order_total` VALUES ('3', '1', 'total', '订单总额', '￥271.00', '271.0000', '9');
INSERT INTO `oc_order_total` VALUES ('4', '2', 'sub_total', '商品总额', '￥112.50', '112.5000', '1');
INSERT INTO `oc_order_total` VALUES ('5', '2', 'shipping', '固定运费率', '￥5.00', '5.0000', '3');
INSERT INTO `oc_order_total` VALUES ('6', '2', 'total', '订单总额', '￥117.50', '117.5000', '9');
INSERT INTO `oc_order_total` VALUES ('7', '3', 'sub_total', '商品总额', '￥7.50', '7.5000', '1');
INSERT INTO `oc_order_total` VALUES ('8', '3', 'shipping', '固定运费率', '￥5.00', '5.0000', '3');
INSERT INTO `oc_order_total` VALUES ('9', '3', 'total', '订单总额', '￥12.50', '12.5000', '9');

-- ----------------------------
-- Table structure for `oc_order_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_order_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product
-- ----------------------------
INSERT INTO `oc_product` VALUES ('1', '山药', '', '', '', '', '', '', '', '1000', '5', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_2.jpg', '0', '1', '7.5000', '0', '0', '2013-04-20', '1.00000000', '7', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '1', '1', '2013-04-21 10:53:34', '2013-04-21 12:28:11', '28');
INSERT INTO `oc_product` VALUES ('2', '土豆', '', '', '', '', '', '', '', '1000', '5', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_2.jpg', '0', '1', '5.8000', '0', '0', '2013-04-20', '1.00000000', '7', '0.00000000', '0.00000000', '0.00000000', '1', '0', '1', '2', '1', '2013-04-21 10:53:34', '2013-04-21 12:28:11', '28');

-- ----------------------------
-- Table structure for `oc_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_attribute
-- ----------------------------
INSERT INTO `oc_product_attribute` VALUES ('1', '4', '1', '冷藏');
INSERT INTO `oc_product_attribute` VALUES ('1', '3', '1', '中国');
INSERT INTO `oc_product_attribute` VALUES ('1', '1', '1', '500g');
INSERT INTO `oc_product_attribute` VALUES ('1', '2', '1', '3天');
INSERT INTO `oc_product_attribute` VALUES ('2', '2', '1', '3天');
INSERT INTO `oc_product_attribute` VALUES ('2', '1', '1', '500g');
INSERT INTO `oc_product_attribute` VALUES ('2', '3', '1', '中国');
INSERT INTO `oc_product_attribute` VALUES ('2', '4', '1', '冷藏');

-- ----------------------------
-- Table structure for `oc_product_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_description
-- ----------------------------
INSERT INTO `oc_product_description` VALUES ('2', '1', '土豆', '&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/product_info.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/font&gt;&lt;/strong&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width: 98%;&quot;&gt;\n	&lt;tbody&gt;\n		&lt;tr&gt;\n			&lt;td&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&lt;/td&gt;\n			&lt;td&gt;\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;商品简介&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：山药。多年生草本植物，茎蔓生，常带紫色，块根圆柱形，叶子对生，卵形或椭圆形，花乳白色，雌雄异株。块根含淀粉和蛋白质，可以吃。山药的主要品种有薯蓣、参薯、褐色薯蓣、山薯、野山药、日本薯蓣等。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;适宜人群&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：一般人群均可食用，适宜糖尿病患者、腹胀、病后虚弱者、慢性肾炎患者、长期腹泻者。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;食用禁忌&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：山药有收涩的作用，故大便燥结者不宜食用；另外有实邪者忌食山药。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n			&lt;/td&gt;\n		&lt;/tr&gt;\n	&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/product_gallery.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_4.JPG&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/cookerty_tips.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;冰糖山药&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;材料：山药0.75公斤、冰糖3/4碗、清水5-6碗&lt;/p&gt;\n\n&lt;p&gt;制法：将皮削去并切成方块，加进冰糖、清水先用大火煮滚，再改小火煮烂（约40分钟）即可供食。&lt;/p&gt;\n', '', '', '');
INSERT INTO `oc_product_description` VALUES ('1', '1', '山药', '&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/product_info.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/font&gt;&lt;/strong&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;table border=&quot;0&quot; cellpadding=&quot;1&quot; cellspacing=&quot;1&quot; style=&quot;width: 98%;&quot;&gt;\n	&lt;tbody&gt;\n		&lt;tr&gt;\n			&lt;td&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&lt;/td&gt;\n			&lt;td&gt;\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;商品简介&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：山药。多年生草本植物，茎蔓生，常带紫色，块根圆柱形，叶子对生，卵形或椭圆形，花乳白色，雌雄异株。块根含淀粉和蛋白质，可以吃。山药的主要品种有薯蓣、参薯、褐色薯蓣、山薯、野山药、日本薯蓣等。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;适宜人群&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：一般人群均可食用，适宜糖尿病患者、腹胀、病后虚弱者、慢性肾炎患者、长期腹泻者。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n			&lt;p style=&quot;margin-left: 40px;&quot;&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;strong&gt;&lt;font size=&quot;3&quot;&gt;食用禁忌&lt;/font&gt;&lt;/strong&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;：山药有收涩的作用，故大便燥结者不宜食用；另外有实邪者忌食山药。&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n			&lt;/td&gt;\n		&lt;/tr&gt;\n	&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/product_gallery.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_4.JPG&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg&quot; style=&quot;width: 330px; height: 330px;&quot; /&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;font color=&quot;#6b6b6b&quot;&gt;&lt;span style=&quot;font: 14px/24px Arial, Helvetica, sans-serif; color: rgb(107, 107, 107); text-transform: none; text-indent: 0px; letter-spacing: normal; word-spacing: 0px; float: none; display: inline !important; white-space: normal; orphans: 2; widows: 2; font-size-adjust: none; font-stretch: normal; background-color: rgb(255, 255, 255); -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://localhost/enong365/image/data/enong/common/cookerty_tips.gif&quot; style=&quot;width: 750px; height: 38px;&quot; /&gt;&lt;/span&gt;&lt;/font&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;冰糖山药&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p&gt;材料：山药0.75公斤、冰糖3/4碗、清水5-6碗&lt;/p&gt;\n\n&lt;p&gt;制法：将皮削去并切成方块，加进冰糖、清水先用大火煮滚，再改小火煮烂（约40分钟）即可供食。&lt;/p&gt;\n', '', '', '');

-- ----------------------------
-- Table structure for `oc_product_discount`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_discount
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_filter`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_filter
-- ----------------------------
INSERT INTO `oc_product_filter` VALUES ('42', '1');

-- ----------------------------
-- Table structure for `oc_product_image`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_image
-- ----------------------------
INSERT INTO `oc_product_image` VALUES ('1', '1', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('2', '1', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_4.JPG', '0');
INSERT INTO `oc_product_image` VALUES ('3', '1', 'data/enong/shengxian/shucai/shanyao/small_1800007352_1_10.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('4', '2', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_1.jpg', '0');
INSERT INTO `oc_product_image` VALUES ('5', '2', 'data/enong/shengxian/shucai/shanyao/middle_1800007352_1_4.JPG', '0');
INSERT INTO `oc_product_image` VALUES ('6', '2', 'data/enong/shengxian/shucai/shanyao/small_1800007352_1_10.jpg', '0');

-- ----------------------------
-- Table structure for `oc_product_option`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option
-- ----------------------------
INSERT INTO `oc_product_option` VALUES ('1', '1', '1', '', '1');
INSERT INTO `oc_product_option` VALUES ('2', '2', '1', '', '1');

-- ----------------------------
-- Table structure for `oc_product_option_value`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_option_value
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_related`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_related
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_reward`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_reward
-- ----------------------------
INSERT INTO `oc_product_reward` VALUES ('1', '1', '1', '0');
INSERT INTO `oc_product_reward` VALUES ('2', '2', '1', '0');

-- ----------------------------
-- Table structure for `oc_product_special`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_special
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_to_category`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_category
-- ----------------------------
INSERT INTO `oc_product_to_category` VALUES ('1', '5');
INSERT INTO `oc_product_to_category` VALUES ('2', '5');

-- ----------------------------
-- Table structure for `oc_product_to_download`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_download
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_to_layout`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_layout
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_product_to_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_product_to_store
-- ----------------------------
INSERT INTO `oc_product_to_store` VALUES ('1', '0');
INSERT INTO `oc_product_to_store` VALUES ('2', '0');

-- ----------------------------
-- Table structure for `oc_return`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_return_action`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_action
-- ----------------------------
INSERT INTO `oc_return_action` VALUES ('1', '1', '退款');
INSERT INTO `oc_return_action` VALUES ('2', '1', '退至信用账户');
INSERT INTO `oc_return_action` VALUES ('3', '1', '更换商品');

-- ----------------------------
-- Table structure for `oc_return_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_return_reason`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_reason
-- ----------------------------
INSERT INTO `oc_return_reason` VALUES ('1', '1', '商品运送途中已损毁');
INSERT INTO `oc_return_reason` VALUES ('2', '1', '商品不符');
INSERT INTO `oc_return_reason` VALUES ('3', '1', '订单有误');
INSERT INTO `oc_return_reason` VALUES ('4', '1', '故障, 请详述');
INSERT INTO `oc_return_reason` VALUES ('5', '1', '其它, 请详述');

-- ----------------------------
-- Table structure for `oc_return_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_return_status
-- ----------------------------
INSERT INTO `oc_return_status` VALUES ('1', '1', '待处理');
INSERT INTO `oc_return_status` VALUES ('3', '1', '完成');
INSERT INTO `oc_return_status` VALUES ('2', '1', '等待商品到货');

-- ----------------------------
-- Table structure for `oc_review`
-- ----------------------------
DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_review
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_setting`
-- ----------------------------
DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=754 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_setting
-- ----------------------------
INSERT INTO `oc_setting` VALUES ('1', '0', 'shipping', 'shipping_sort_order', '3', '0');
INSERT INTO `oc_setting` VALUES ('2', '0', 'sub_total', 'sub_total_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('3', '0', 'sub_total', 'sub_total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('4', '0', 'tax', 'tax_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('5', '0', 'total', 'total_sort_order', '9', '0');
INSERT INTO `oc_setting` VALUES ('6', '0', 'total', 'total_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('7', '0', 'tax', 'tax_sort_order', '5', '0');
INSERT INTO `oc_setting` VALUES ('8', '0', 'free_checkout', 'free_checkout_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('9', '0', 'cod', 'cod_sort_order', '5', '0');
INSERT INTO `oc_setting` VALUES ('10', '0', 'cod', 'cod_total', '0.01', '0');
INSERT INTO `oc_setting` VALUES ('11', '0', 'cod', 'cod_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('12', '0', 'cod', 'cod_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('13', '0', 'cod', 'cod_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('14', '0', 'shipping', 'shipping_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('15', '0', 'shipping', 'shipping_estimator', '1', '0');
INSERT INTO `oc_setting` VALUES ('736', '0', 'config', 'config_fraud_score', '', '0');
INSERT INTO `oc_setting` VALUES ('737', '0', 'config', 'config_fraud_status_id', '16', '0');
INSERT INTO `oc_setting` VALUES ('738', '0', 'config', 'config_secure', '0', '0');
INSERT INTO `oc_setting` VALUES ('739', '0', 'config', 'config_shared', '0', '0');
INSERT INTO `oc_setting` VALUES ('740', '0', 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', '0');
INSERT INTO `oc_setting` VALUES ('27', '0', 'coupon', 'coupon_sort_order', '4', '0');
INSERT INTO `oc_setting` VALUES ('28', '0', 'coupon', 'coupon_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('735', '0', 'config', 'config_fraud_key', '', '0');
INSERT INTO `oc_setting` VALUES ('734', '0', 'config', 'config_fraud_detection', '0', '0');
INSERT INTO `oc_setting` VALUES ('34', '0', 'flat', 'flat_sort_order', '1', '0');
INSERT INTO `oc_setting` VALUES ('35', '0', 'flat', 'flat_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('36', '0', 'flat', 'flat_geo_zone_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('37', '0', 'flat', 'flat_tax_class_id', '9', '0');
INSERT INTO `oc_setting` VALUES ('38', '0', 'carousel', 'carousel_module', 'a:1:{i:0;a:10:{s:9:\"banner_id\";s:1:\"8\";s:5:\"limit\";s:1:\"5\";s:6:\"scroll\";s:1:\"3\";s:5:\"width\";s:2:\"80\";s:6:\"height\";s:2:\"80\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:14:\"content_bottom\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:2:\"-1\";}}', '1');
INSERT INTO `oc_setting` VALUES ('39', '0', 'featured', 'featured_product', '43,40,42,49,46,47,28', '0');
INSERT INTO `oc_setting` VALUES ('40', '0', 'featured', 'featured_module', 'a:1:{i:0;a:8:{s:5:\"limit\";s:1:\"6\";s:11:\"image_width\";s:2:\"80\";s:12:\"image_height\";s:2:\"80\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"2\";}}', '1');
INSERT INTO `oc_setting` VALUES ('41', '0', 'flat', 'flat_cost', '5.00', '0');
INSERT INTO `oc_setting` VALUES ('42', '0', 'credit', 'credit_sort_order', '7', '0');
INSERT INTO `oc_setting` VALUES ('43', '0', 'credit', 'credit_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('733', '0', 'config', 'config_alert_emails', '', '0');
INSERT INTO `oc_setting` VALUES ('732', '0', 'config', 'config_account_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('731', '0', 'config', 'config_alert_mail', '0', '0');
INSERT INTO `oc_setting` VALUES ('730', '0', 'config', 'config_smtp_timeout', '5', '0');
INSERT INTO `oc_setting` VALUES ('729', '0', 'config', 'config_smtp_port', '25', '0');
INSERT INTO `oc_setting` VALUES ('728', '0', 'config', 'config_smtp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('53', '0', 'reward', 'reward_sort_order', '2', '0');
INSERT INTO `oc_setting` VALUES ('54', '0', 'reward', 'reward_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('56', '0', 'affiliate', 'affiliate_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:2:\"10\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `oc_setting` VALUES ('57', '0', 'category', 'category_module', 'a:2:{i:0;a:5:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}i:1;a:5:{s:9:\"layout_id\";s:1:\"2\";s:8:\"position\";s:11:\"column_left\";s:5:\"count\";s:1:\"0\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `oc_setting` VALUES ('60', '0', 'account', 'account_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"6\";s:8:\"position\";s:12:\"column_right\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `oc_setting` VALUES ('727', '0', 'config', 'config_smtp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('726', '0', 'config', 'config_smtp_host', '', '0');
INSERT INTO `oc_setting` VALUES ('725', '0', 'config', 'config_mail_parameter', '', '0');
INSERT INTO `oc_setting` VALUES ('724', '0', 'config', 'config_mail_protocol', 'mail', '0');
INSERT INTO `oc_setting` VALUES ('723', '0', 'config', 'config_ftp_status', '0', '0');
INSERT INTO `oc_setting` VALUES ('722', '0', 'config', 'config_ftp_root', '', '0');
INSERT INTO `oc_setting` VALUES ('721', '0', 'config', 'config_ftp_password', '', '0');
INSERT INTO `oc_setting` VALUES ('711', '0', 'config', 'config_image_related_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('712', '0', 'config', 'config_image_compare_width', '90', '0');
INSERT INTO `oc_setting` VALUES ('713', '0', 'config', 'config_image_compare_height', '90', '0');
INSERT INTO `oc_setting` VALUES ('714', '0', 'config', 'config_image_wishlist_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('715', '0', 'config', 'config_image_wishlist_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('716', '0', 'config', 'config_image_cart_width', '47', '0');
INSERT INTO `oc_setting` VALUES ('717', '0', 'config', 'config_image_cart_height', '47', '0');
INSERT INTO `oc_setting` VALUES ('718', '0', 'config', 'config_ftp_host', 'localhost', '0');
INSERT INTO `oc_setting` VALUES ('719', '0', 'config', 'config_ftp_port', '21', '0');
INSERT INTO `oc_setting` VALUES ('720', '0', 'config', 'config_ftp_username', '', '0');
INSERT INTO `oc_setting` VALUES ('710', '0', 'config', 'config_image_related_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('708', '0', 'config', 'config_image_additional_width', '74', '0');
INSERT INTO `oc_setting` VALUES ('709', '0', 'config', 'config_image_additional_height', '74', '0');
INSERT INTO `oc_setting` VALUES ('94', '0', 'voucher', 'voucher_sort_order', '8', '0');
INSERT INTO `oc_setting` VALUES ('95', '0', 'voucher', 'voucher_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('103', '0', 'free_checkout', 'free_checkout_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('104', '0', 'free_checkout', 'free_checkout_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('108', '0', 'slideshow', 'slideshow_module', 'a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"7\";s:5:\"width\";s:3:\"980\";s:6:\"height\";s:3:\"280\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"1\";s:8:\"position\";s:11:\"content_top\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"1\";}}', '1');
INSERT INTO `oc_setting` VALUES ('109', '0', 'banner', 'banner_module', 'a:1:{i:0;a:8:{s:9:\"banner_id\";s:1:\"6\";s:5:\"width\";s:3:\"182\";s:6:\"height\";s:3:\"182\";s:11:\"resize_type\";s:7:\"default\";s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:1:\"3\";}}', '1');
INSERT INTO `oc_setting` VALUES ('707', '0', 'config', 'config_image_product_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('706', '0', 'config', 'config_image_product_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('705', '0', 'config', 'config_image_popup_height', '500', '0');
INSERT INTO `oc_setting` VALUES ('704', '0', 'config', 'config_image_popup_width', '500', '0');
INSERT INTO `oc_setting` VALUES ('703', '0', 'config', 'config_image_thumb_height', '228', '0');
INSERT INTO `oc_setting` VALUES ('702', '0', 'config', 'config_image_thumb_width', '228', '0');
INSERT INTO `oc_setting` VALUES ('701', '0', 'config', 'config_image_category_height', '80', '0');
INSERT INTO `oc_setting` VALUES ('700', '0', 'config', 'config_image_category_width', '80', '0');
INSERT INTO `oc_setting` VALUES ('699', '0', 'config', 'config_icon', 'data/cart.png', '0');
INSERT INTO `oc_setting` VALUES ('698', '0', 'config', 'config_logo', 'data/logo.png', '0');
INSERT INTO `oc_setting` VALUES ('697', '0', 'config', 'config_return_status_id', '2', '0');
INSERT INTO `oc_setting` VALUES ('696', '0', 'config', 'config_return_id', '0', '0');
INSERT INTO `oc_setting` VALUES ('695', '0', 'config', 'config_commission', '5', '0');
INSERT INTO `oc_setting` VALUES ('694', '0', 'config', 'config_affiliate_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('693', '0', 'config', 'config_stock_status_id', '5', '0');
INSERT INTO `oc_setting` VALUES ('692', '0', 'config', 'config_stock_checkout', '0', '0');
INSERT INTO `oc_setting` VALUES ('691', '0', 'config', 'config_stock_warning', '0', '0');
INSERT INTO `oc_setting` VALUES ('690', '0', 'config', 'config_stock_display', '0', '0');
INSERT INTO `oc_setting` VALUES ('689', '0', 'config', 'config_complete_status_id', '5', '0');
INSERT INTO `oc_setting` VALUES ('688', '0', 'config', 'config_order_status_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('687', '0', 'config', 'config_invoice_prefix', 'INV-2013-00', '0');
INSERT INTO `oc_setting` VALUES ('686', '0', 'config', 'config_order_edit', '7', '0');
INSERT INTO `oc_setting` VALUES ('685', '0', 'config', 'config_checkout_id', '5', '0');
INSERT INTO `oc_setting` VALUES ('684', '0', 'config', 'config_guest_checkout', '0', '0');
INSERT INTO `oc_setting` VALUES ('683', '0', 'config', 'config_cart_weight', '1', '0');
INSERT INTO `oc_setting` VALUES ('682', '0', 'config', 'config_account_id', '3', '0');
INSERT INTO `oc_setting` VALUES ('681', '0', 'config', 'config_customer_price', '0', '0');
INSERT INTO `oc_setting` VALUES ('680', '0', 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:\"1\";}', '1');
INSERT INTO `oc_setting` VALUES ('679', '0', 'config', 'config_customer_group_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('678', '0', 'config', 'config_customer_online', '0', '0');
INSERT INTO `oc_setting` VALUES ('677', '0', 'config', 'config_tax_customer', '', '0');
INSERT INTO `oc_setting` VALUES ('676', '0', 'config', 'config_tax_default', '', '0');
INSERT INTO `oc_setting` VALUES ('675', '0', 'config', 'config_vat', '0', '0');
INSERT INTO `oc_setting` VALUES ('674', '0', 'config', 'config_tax', '0', '0');
INSERT INTO `oc_setting` VALUES ('673', '0', 'config', 'config_voucher_max', '1000', '0');
INSERT INTO `oc_setting` VALUES ('672', '0', 'config', 'config_voucher_min', '1', '0');
INSERT INTO `oc_setting` VALUES ('671', '0', 'config', 'config_download', '0', '0');
INSERT INTO `oc_setting` VALUES ('670', '0', 'config', 'config_review_status', '1', '0');
INSERT INTO `oc_setting` VALUES ('669', '0', 'config', 'config_product_count', '1', '0');
INSERT INTO `oc_setting` VALUES ('668', '0', 'config', 'config_admin_limit', '20', '0');
INSERT INTO `oc_setting` VALUES ('667', '0', 'config', 'config_catalog_limit', '15', '0');
INSERT INTO `oc_setting` VALUES ('666', '0', 'config', 'config_weight_class_id', '7', '0');
INSERT INTO `oc_setting` VALUES ('665', '0', 'config', 'config_length_class_id', '1', '0');
INSERT INTO `oc_setting` VALUES ('664', '0', 'config', 'config_currency_auto', '0', '0');
INSERT INTO `oc_setting` VALUES ('663', '0', 'config', 'config_currency', 'CNY', '0');
INSERT INTO `oc_setting` VALUES ('662', '0', 'config', 'config_admin_language', 'cn', '0');
INSERT INTO `oc_setting` VALUES ('661', '0', 'config', 'config_language', 'cn', '0');
INSERT INTO `oc_setting` VALUES ('660', '0', 'config', 'config_zone_id', '708', '0');
INSERT INTO `oc_setting` VALUES ('659', '0', 'config', 'config_country_id', '44', '0');
INSERT INTO `oc_setting` VALUES ('658', '0', 'config', 'config_layout_id', '4', '0');
INSERT INTO `oc_setting` VALUES ('657', '0', 'config', 'config_template', 'default', '0');
INSERT INTO `oc_setting` VALUES ('656', '0', 'config', 'config_meta_description', 'eNong365', '0');
INSERT INTO `oc_setting` VALUES ('655', '0', 'config', 'config_title', 'eNong365', '0');
INSERT INTO `oc_setting` VALUES ('654', '0', 'config', 'config_fax', '', '0');
INSERT INTO `oc_setting` VALUES ('653', '0', 'config', 'config_telephone', '123456789', '0');
INSERT INTO `oc_setting` VALUES ('652', '0', 'config', 'config_email', 'joachim.xing@gmail.com', '0');
INSERT INTO `oc_setting` VALUES ('651', '0', 'config', 'config_address', '南京市白下区XX路168号106室', '0');
INSERT INTO `oc_setting` VALUES ('650', '0', 'config', 'config_owner', '姬祖成', '0');
INSERT INTO `oc_setting` VALUES ('649', '0', 'config', 'config_name', 'eNong365', '0');
INSERT INTO `oc_setting` VALUES ('741', '0', 'config', 'config_seo_url', '0', '0');
INSERT INTO `oc_setting` VALUES ('742', '0', 'config', 'config_file_extension_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', '0');
INSERT INTO `oc_setting` VALUES ('743', '0', 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/jpeg\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/tiff\r\nimage/svg+xml\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/postscript\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', '0');
INSERT INTO `oc_setting` VALUES ('744', '0', 'config', 'config_maintenance', '0', '0');
INSERT INTO `oc_setting` VALUES ('745', '0', 'config', 'config_password', '1', '0');
INSERT INTO `oc_setting` VALUES ('746', '0', 'config', 'config_encryption', '3036a7cdd77fae4666ec45e0621771fa', '0');
INSERT INTO `oc_setting` VALUES ('747', '0', 'config', 'config_compression', '0', '0');
INSERT INTO `oc_setting` VALUES ('748', '0', 'config', 'config_error_display', '1', '0');
INSERT INTO `oc_setting` VALUES ('749', '0', 'config', 'config_error_log', '1', '0');
INSERT INTO `oc_setting` VALUES ('750', '0', 'config', 'config_error_filename', 'error.txt', '0');
INSERT INTO `oc_setting` VALUES ('751', '0', 'config', 'config_google_analytics', '', '0');
INSERT INTO `oc_setting` VALUES ('753', '0', 'popupcategory', 'popupcategory_module', 'a:1:{i:0;a:4:{s:9:\"layout_id\";s:1:\"3\";s:8:\"position\";s:11:\"column_left\";s:6:\"status\";s:1:\"1\";s:10:\"sort_order\";s:0:\"\";}}', '1');

-- ----------------------------
-- Table structure for `oc_stock_status`
-- ----------------------------
DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_stock_status
-- ----------------------------
INSERT INTO `oc_stock_status` VALUES ('7', '1', '有货');
INSERT INTO `oc_stock_status` VALUES ('5', '1', '缺货');
INSERT INTO `oc_stock_status` VALUES ('6', '1', '等待2 - 3天');
INSERT INTO `oc_stock_status` VALUES ('8', '1', '预购');

-- ----------------------------
-- Table structure for `oc_store`
-- ----------------------------
DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_store
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_tax_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_class
-- ----------------------------
INSERT INTO `oc_tax_class` VALUES ('9', '交税商品', '征税的商品', '2009-01-06 23:21:53', '2012-06-11 01:12:36');
INSERT INTO `oc_tax_class` VALUES ('10', '可下载的商品', '可下载', '2011-09-21 22:19:39', '2012-06-11 01:10:52');

-- ----------------------------
-- Table structure for `oc_tax_rate`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate
-- ----------------------------
INSERT INTO `oc_tax_rate` VALUES ('86', '3', '增值税 (17.5%)', '17.5000', 'P', '2011-03-09 21:17:10', '2012-06-11 01:06:45');
INSERT INTO `oc_tax_rate` VALUES ('87', '3', '普通税 (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- ----------------------------
-- Table structure for `oc_tax_rate_to_customer_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rate_to_customer_group
-- ----------------------------
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('86', '1');
INSERT INTO `oc_tax_rate_to_customer_group` VALUES ('87', '1');

-- ----------------------------
-- Table structure for `oc_tax_rule`
-- ----------------------------
DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_tax_rule
-- ----------------------------
INSERT INTO `oc_tax_rule` VALUES ('121', '10', '86', '付款', '1');
INSERT INTO `oc_tax_rule` VALUES ('120', '10', '87', '商店', '0');
INSERT INTO `oc_tax_rule` VALUES ('128', '9', '86', '配送', '1');
INSERT INTO `oc_tax_rule` VALUES ('127', '9', '87', '配送', '2');

-- ----------------------------
-- Table structure for `oc_url_alias`
-- ----------------------------
DROP TABLE IF EXISTS `oc_url_alias`;
CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM AUTO_INCREMENT=775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_url_alias
-- ----------------------------
INSERT INTO `oc_url_alias` VALUES ('730', 'manufacturer_id=8', 'apple');
INSERT INTO `oc_url_alias` VALUES ('772', 'information_id=4', 'about_us');

-- ----------------------------
-- Table structure for `oc_user`
-- ----------------------------
DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user
-- ----------------------------
INSERT INTO `oc_user` VALUES ('1', '1', 'admin', '6759dd2e13fbcf9fc8aa5ae601ee1e9463ef19b5', '203b2863c', '', '', 'joachim.xing@gmail.com', '', '127.0.0.1', '1', '2013-04-19 09:36:38');

-- ----------------------------
-- Table structure for `oc_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_user_group
-- ----------------------------
INSERT INTO `oc_user_group` VALUES ('1', '最高权限管理人员', 'a:2:{s:6:\"access\";a:127:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:19:\"design/custom_field\";i:13;s:13:\"design/layout\";i:14;s:14:\"extension/feed\";i:15;s:17:\"extension/manager\";i:16;s:16:\"extension/module\";i:17;s:17:\"extension/payment\";i:18;s:18:\"extension/shipping\";i:19;s:15:\"extension/total\";i:20;s:16:\"feed/google_base\";i:21;s:19:\"feed/google_sitemap\";i:22;s:20:\"localisation/country\";i:23;s:21:\"localisation/currency\";i:24;s:21:\"localisation/geo_zone\";i:25;s:21:\"localisation/language\";i:26;s:25:\"localisation/length_class\";i:27;s:25:\"localisation/order_status\";i:28;s:26:\"localisation/return_action\";i:29;s:26:\"localisation/return_reason\";i:30;s:26:\"localisation/return_status\";i:31;s:25:\"localisation/stock_status\";i:32;s:22:\"localisation/tax_class\";i:33;s:21:\"localisation/tax_rate\";i:34;s:25:\"localisation/weight_class\";i:35;s:17:\"localisation/zone\";i:36;s:14:\"module/account\";i:37;s:16:\"module/affiliate\";i:38;s:13:\"module/banner\";i:39;s:17:\"module/bestseller\";i:40;s:15:\"module/carousel\";i:41;s:15:\"module/category\";i:42;s:15:\"module/featured\";i:43;s:13:\"module/filter\";i:44;s:18:\"module/google_talk\";i:45;s:18:\"module/information\";i:46;s:13:\"module/latest\";i:47;s:16:\"module/slideshow\";i:48;s:14:\"module/special\";i:49;s:12:\"module/store\";i:50;s:14:\"module/welcome\";i:51;s:24:\"payment/authorizenet_aim\";i:52;s:21:\"payment/bank_transfer\";i:53;s:14:\"payment/cheque\";i:54;s:11:\"payment/cod\";i:55;s:21:\"payment/free_checkout\";i:56;s:22:\"payment/klarna_account\";i:57;s:22:\"payment/klarna_invoice\";i:58;s:14:\"payment/liqpay\";i:59;s:20:\"payment/moneybookers\";i:60;s:14:\"payment/nochex\";i:61;s:15:\"payment/paymate\";i:62;s:16:\"payment/paypoint\";i:63;s:13:\"payment/payza\";i:64;s:26:\"payment/perpetual_payments\";i:65;s:14:\"payment/pp_pro\";i:66;s:17:\"payment/pp_pro_uk\";i:67;s:19:\"payment/pp_standard\";i:68;s:15:\"payment/sagepay\";i:69;s:22:\"payment/sagepay_direct\";i:70;s:18:\"payment/sagepay_us\";i:71;s:19:\"payment/twocheckout\";i:72;s:28:\"payment/web_payment_software\";i:73;s:16:\"payment/worldpay\";i:74;s:27:\"report/affiliate_commission\";i:75;s:22:\"report/customer_credit\";i:76;s:22:\"report/customer_online\";i:77;s:21:\"report/customer_order\";i:78;s:22:\"report/customer_reward\";i:79;s:24:\"report/product_purchased\";i:80;s:21:\"report/product_viewed\";i:81;s:18:\"report/sale_coupon\";i:82;s:17:\"report/sale_order\";i:83;s:18:\"report/sale_return\";i:84;s:20:\"report/sale_shipping\";i:85;s:15:\"report/sale_tax\";i:86;s:14:\"sale/affiliate\";i:87;s:12:\"sale/contact\";i:88;s:11:\"sale/coupon\";i:89;s:13:\"sale/customer\";i:90;s:20:\"sale/customer_ban_ip\";i:91;s:19:\"sale/customer_group\";i:92;s:10:\"sale/order\";i:93;s:11:\"sale/return\";i:94;s:12:\"sale/voucher\";i:95;s:18:\"sale/voucher_theme\";i:96;s:15:\"setting/setting\";i:97;s:13:\"setting/store\";i:98;s:16:\"shipping/auspost\";i:99;s:17:\"shipping/citylink\";i:100;s:14:\"shipping/fedex\";i:101;s:13:\"shipping/flat\";i:102;s:13:\"shipping/free\";i:103;s:13:\"shipping/item\";i:104;s:23:\"shipping/parcelforce_48\";i:105;s:15:\"shipping/pickup\";i:106;s:19:\"shipping/royal_mail\";i:107;s:12:\"shipping/ups\";i:108;s:13:\"shipping/usps\";i:109;s:15:\"shipping/weight\";i:110;s:11:\"tool/backup\";i:111;s:14:\"tool/error_log\";i:112;s:11:\"tool/export\";i:113;s:12:\"total/coupon\";i:114;s:12:\"total/credit\";i:115;s:14:\"total/handling\";i:116;s:16:\"total/klarna_fee\";i:117;s:19:\"total/low_order_fee\";i:118;s:12:\"total/reward\";i:119;s:14:\"total/shipping\";i:120;s:15:\"total/sub_total\";i:121;s:9:\"total/tax\";i:122;s:11:\"total/total\";i:123;s:13:\"total/voucher\";i:124;s:9:\"user/user\";i:125;s:20:\"user/user_permission\";i:126;s:20:\"module/popupcategory\";}s:6:\"modify\";a:127:{i:0;s:17:\"catalog/attribute\";i:1;s:23:\"catalog/attribute_group\";i:2;s:16:\"catalog/category\";i:3;s:16:\"catalog/download\";i:4;s:14:\"catalog/filter\";i:5;s:19:\"catalog/information\";i:6;s:20:\"catalog/manufacturer\";i:7;s:14:\"catalog/option\";i:8;s:15:\"catalog/product\";i:9;s:14:\"catalog/review\";i:10;s:18:\"common/filemanager\";i:11;s:13:\"design/banner\";i:12;s:19:\"design/custom_field\";i:13;s:13:\"design/layout\";i:14;s:14:\"extension/feed\";i:15;s:17:\"extension/manager\";i:16;s:16:\"extension/module\";i:17;s:17:\"extension/payment\";i:18;s:18:\"extension/shipping\";i:19;s:15:\"extension/total\";i:20;s:16:\"feed/google_base\";i:21;s:19:\"feed/google_sitemap\";i:22;s:20:\"localisation/country\";i:23;s:21:\"localisation/currency\";i:24;s:21:\"localisation/geo_zone\";i:25;s:21:\"localisation/language\";i:26;s:25:\"localisation/length_class\";i:27;s:25:\"localisation/order_status\";i:28;s:26:\"localisation/return_action\";i:29;s:26:\"localisation/return_reason\";i:30;s:26:\"localisation/return_status\";i:31;s:25:\"localisation/stock_status\";i:32;s:22:\"localisation/tax_class\";i:33;s:21:\"localisation/tax_rate\";i:34;s:25:\"localisation/weight_class\";i:35;s:17:\"localisation/zone\";i:36;s:14:\"module/account\";i:37;s:16:\"module/affiliate\";i:38;s:13:\"module/banner\";i:39;s:17:\"module/bestseller\";i:40;s:15:\"module/carousel\";i:41;s:15:\"module/category\";i:42;s:15:\"module/featured\";i:43;s:13:\"module/filter\";i:44;s:18:\"module/google_talk\";i:45;s:18:\"module/information\";i:46;s:13:\"module/latest\";i:47;s:16:\"module/slideshow\";i:48;s:14:\"module/special\";i:49;s:12:\"module/store\";i:50;s:14:\"module/welcome\";i:51;s:24:\"payment/authorizenet_aim\";i:52;s:21:\"payment/bank_transfer\";i:53;s:14:\"payment/cheque\";i:54;s:11:\"payment/cod\";i:55;s:21:\"payment/free_checkout\";i:56;s:22:\"payment/klarna_account\";i:57;s:22:\"payment/klarna_invoice\";i:58;s:14:\"payment/liqpay\";i:59;s:20:\"payment/moneybookers\";i:60;s:14:\"payment/nochex\";i:61;s:15:\"payment/paymate\";i:62;s:16:\"payment/paypoint\";i:63;s:13:\"payment/payza\";i:64;s:26:\"payment/perpetual_payments\";i:65;s:14:\"payment/pp_pro\";i:66;s:17:\"payment/pp_pro_uk\";i:67;s:19:\"payment/pp_standard\";i:68;s:15:\"payment/sagepay\";i:69;s:22:\"payment/sagepay_direct\";i:70;s:18:\"payment/sagepay_us\";i:71;s:19:\"payment/twocheckout\";i:72;s:28:\"payment/web_payment_software\";i:73;s:16:\"payment/worldpay\";i:74;s:27:\"report/affiliate_commission\";i:75;s:22:\"report/customer_credit\";i:76;s:22:\"report/customer_online\";i:77;s:21:\"report/customer_order\";i:78;s:22:\"report/customer_reward\";i:79;s:24:\"report/product_purchased\";i:80;s:21:\"report/product_viewed\";i:81;s:18:\"report/sale_coupon\";i:82;s:17:\"report/sale_order\";i:83;s:18:\"report/sale_return\";i:84;s:20:\"report/sale_shipping\";i:85;s:15:\"report/sale_tax\";i:86;s:14:\"sale/affiliate\";i:87;s:12:\"sale/contact\";i:88;s:11:\"sale/coupon\";i:89;s:13:\"sale/customer\";i:90;s:20:\"sale/customer_ban_ip\";i:91;s:19:\"sale/customer_group\";i:92;s:10:\"sale/order\";i:93;s:11:\"sale/return\";i:94;s:12:\"sale/voucher\";i:95;s:18:\"sale/voucher_theme\";i:96;s:15:\"setting/setting\";i:97;s:13:\"setting/store\";i:98;s:16:\"shipping/auspost\";i:99;s:17:\"shipping/citylink\";i:100;s:14:\"shipping/fedex\";i:101;s:13:\"shipping/flat\";i:102;s:13:\"shipping/free\";i:103;s:13:\"shipping/item\";i:104;s:23:\"shipping/parcelforce_48\";i:105;s:15:\"shipping/pickup\";i:106;s:19:\"shipping/royal_mail\";i:107;s:12:\"shipping/ups\";i:108;s:13:\"shipping/usps\";i:109;s:15:\"shipping/weight\";i:110;s:11:\"tool/backup\";i:111;s:14:\"tool/error_log\";i:112;s:11:\"tool/export\";i:113;s:12:\"total/coupon\";i:114;s:12:\"total/credit\";i:115;s:14:\"total/handling\";i:116;s:16:\"total/klarna_fee\";i:117;s:19:\"total/low_order_fee\";i:118;s:12:\"total/reward\";i:119;s:14:\"total/shipping\";i:120;s:15:\"total/sub_total\";i:121;s:9:\"total/tax\";i:122;s:11:\"total/total\";i:123;s:13:\"total/voucher\";i:124;s:9:\"user/user\";i:125;s:20:\"user/user_permission\";i:126;s:20:\"module/popupcategory\";}}');
INSERT INTO `oc_user_group` VALUES ('10', '一般管理人员', '');

-- ----------------------------
-- Table structure for `oc_voucher`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_voucher_history`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_history
-- ----------------------------

-- ----------------------------
-- Table structure for `oc_voucher_theme`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme
-- ----------------------------
INSERT INTO `oc_voucher_theme` VALUES ('8', 'data/demo/canon_eos_5d_2.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('7', 'data/demo/gift-voucher-birthday.jpg');
INSERT INTO `oc_voucher_theme` VALUES ('6', 'data/demo/apple_logo.jpg');

-- ----------------------------
-- Table structure for `oc_voucher_theme_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_voucher_theme_description
-- ----------------------------
INSERT INTO `oc_voucher_theme_description` VALUES ('6', '1', '圣诞节');
INSERT INTO `oc_voucher_theme_description` VALUES ('7', '1', '生日');
INSERT INTO `oc_voucher_theme_description` VALUES ('8', '1', '一般');

-- ----------------------------
-- Table structure for `oc_weight_class`
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class
-- ----------------------------
INSERT INTO `oc_weight_class` VALUES ('1', '1.00000000');
INSERT INTO `oc_weight_class` VALUES ('2', '1000.00000000');
INSERT INTO `oc_weight_class` VALUES ('5', '2.20460000');
INSERT INTO `oc_weight_class` VALUES ('6', '35.27400000');
INSERT INTO `oc_weight_class` VALUES ('7', '1.00000000');

-- ----------------------------
-- Table structure for `oc_weight_class_description`
-- ----------------------------
DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_weight_class_description
-- ----------------------------
INSERT INTO `oc_weight_class_description` VALUES ('1', '1', '公斤', 'kg');
INSERT INTO `oc_weight_class_description` VALUES ('2', '1', '公克', 'g');
INSERT INTO `oc_weight_class_description` VALUES ('5', '1', '磅', 'lb');
INSERT INTO `oc_weight_class_description` VALUES ('6', '1', '盎司', 'oz');
INSERT INTO `oc_weight_class_description` VALUES ('7', '1', '斤  ', '斤');

-- ----------------------------
-- Table structure for `oc_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=715 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone
-- ----------------------------
INSERT INTO `oc_zone` VALUES ('684', '44', '安徽', 'AN', '1');
INSERT INTO `oc_zone` VALUES ('685', '44', '北京', 'BE', '1');
INSERT INTO `oc_zone` VALUES ('686', '44', '重庆', 'CH', '1');
INSERT INTO `oc_zone` VALUES ('687', '44', '福建', 'FU', '1');
INSERT INTO `oc_zone` VALUES ('688', '44', '甘肃', 'GA', '1');
INSERT INTO `oc_zone` VALUES ('689', '44', '广东', 'GU', '1');
INSERT INTO `oc_zone` VALUES ('690', '44', '广西', 'GX', '1');
INSERT INTO `oc_zone` VALUES ('691', '44', '贵州', 'GZ', '1');
INSERT INTO `oc_zone` VALUES ('692', '44', '海南', 'HA', '1');
INSERT INTO `oc_zone` VALUES ('693', '44', '河北', 'HB', '1');
INSERT INTO `oc_zone` VALUES ('694', '44', '黑龙江', 'HL', '1');
INSERT INTO `oc_zone` VALUES ('695', '44', '河南', 'HE', '1');
INSERT INTO `oc_zone` VALUES ('696', '44', '香港', 'HK', '1');
INSERT INTO `oc_zone` VALUES ('697', '44', '湖北', 'HU', '1');
INSERT INTO `oc_zone` VALUES ('698', '44', '湖南', 'HN', '1');
INSERT INTO `oc_zone` VALUES ('699', '44', '内蒙', 'IM', '1');
INSERT INTO `oc_zone` VALUES ('700', '44', '江苏', 'JI', '1');
INSERT INTO `oc_zone` VALUES ('701', '44', '江西', 'JX', '1');
INSERT INTO `oc_zone` VALUES ('702', '44', '吉林', 'JL', '1');
INSERT INTO `oc_zone` VALUES ('703', '44', '辽宁', 'LI', '1');
INSERT INTO `oc_zone` VALUES ('704', '44', '澳门', 'MA', '1');
INSERT INTO `oc_zone` VALUES ('705', '44', '宁夏', 'NI', '1');
INSERT INTO `oc_zone` VALUES ('706', '44', '山西', 'SH', '1');
INSERT INTO `oc_zone` VALUES ('707', '44', '山东', 'SA', '1');
INSERT INTO `oc_zone` VALUES ('708', '44', '上海', 'SG', '1');
INSERT INTO `oc_zone` VALUES ('709', '44', '陕西', 'SX', '1');
INSERT INTO `oc_zone` VALUES ('710', '44', '四川', 'SI', '1');
INSERT INTO `oc_zone` VALUES ('711', '44', '天津', 'TI', '1');
INSERT INTO `oc_zone` VALUES ('712', '44', '新疆', 'XI', '1');
INSERT INTO `oc_zone` VALUES ('713', '44', '云南', 'YU', '1');
INSERT INTO `oc_zone` VALUES ('714', '44', '浙江', 'ZH', '1');

-- ----------------------------
-- Table structure for `oc_zone_to_geo_zone`
-- ----------------------------
DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oc_zone_to_geo_zone
-- ----------------------------
INSERT INTO `oc_zone_to_geo_zone` VALUES ('67', '44', '708', '6', '2013-04-19 15:52:19', '0000-00-00 00:00:00');
INSERT INTO `oc_zone_to_geo_zone` VALUES ('66', '44', '700', '5', '2013-04-19 15:43:39', '0000-00-00 00:00:00');
