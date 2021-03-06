/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_lts01
Target Host: localhost
Target Database: db_lts01
Date: 2014-03-10 10:01:14
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_message
-- ----------------------------
CREATE TABLE `t_message` (
  `id` bigint(20) NOT NULL auto_increment,
  `content` text,
  `userid` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK57B58B1CA3C379BB` (`userid`),
  CONSTRAINT `FK57B58B1CA3C379BB` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `createtime` datetime default NULL,
  `dengluzhuangtai` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `gerenjianjie` varchar(255) default NULL,
  `gexingqianming` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `qq` varchar(255) default NULL,
  `role` int(11) NOT NULL,
  `touxiang` varchar(255) default NULL,
  `truename` varchar(255) default NULL,
  `userlock` int(11) NOT NULL,
  `username` varchar(255) default NULL,
  `xingbie` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `t_message` VALUES ('21', '[09:37:38]  <a href=\'method!touser?id=5\'  target=\'liaotian2\'>zhangsi</a><span >进入了聊天室</span><br/>[09:38:00]  <a href=\'method!touser?id=5\' target=\'liaotian2\'>zhangsi</a>对所有人说话：<span style=\'color:#ff0000 ;font-size: 16px\'>时发生地方</span><br/>[09:38:47]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a><span >进入了聊天室</span><br/>[09:40:01]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>对<a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>命令：<span style=\'color:#8800ff ;font-size: 16px\'>王五你好</span><br/>[09:40:30]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>说话：<span style=\'color:#ff0005 ;font-size: 16px\'>sdfsadffff</span><br/>[09:40:54]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>对所有人说话：<span style=\'color:0 ;font-size: 16px\'>发生地方</span><br/>[09:41:18]  张三：<span >离开了聊天室</span><br/>[09:41:46]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a><span >进入了聊天室</span><br/>[09:42:43]  <a href=\'method!touser?id=5\' target=\'liaotian2\'>zhangsi</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>大喊：<span style=\'color:0 ;font-size: 16px\'>vvvvvvvv</span><br/>[09:52:57]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>说话：<span style=\'color:#00a010 ;font-size: 16px\'>vvvrrr</span><br/>', '5');
INSERT INTO `t_message` VALUES ('22', '[09:38:47]  <a href=\'method!touser?id=2\'  target=\'liaotian2\'>王五</a><span >进入了聊天室</span><br/>[09:40:01]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>对<a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>命令：<span style=\'color:#8800ff ;font-size: 16px\'>王五你好</span><br/>[09:40:30]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>说话：<span style=\'color:#ff0005 ;font-size: 16px\'>sdfsadffff</span><br/>[09:40:54]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>对所有人说话：<span style=\'color:0 ;font-size: 16px\'>发生地方</span><br/>[09:41:18]  张三：<span >离开了聊天室</span><br/>[09:41:46]  <a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a><span >进入了聊天室</span><br/>[09:42:43]  <a href=\'method!touser?id=5\' target=\'liaotian2\'>zhangsi</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>大喊：<span style=\'color:0 ;font-size: 16px\'>vvvvvvvv</span><br/>[09:52:57]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>说话：<span style=\'color:#00a010 ;font-size: 16px\'>vvvrrr</span><br/>', '2');
INSERT INTO `t_message` VALUES ('23', '[09:41:46]  <a href=\'method!touser?id=1\'  target=\'liaotian2\'>张三</a><span >进入了聊天室</span><br/>[09:42:43]  <a href=\'method!touser?id=5\' target=\'liaotian2\'>zhangsi</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>大喊：<span style=\'color:0 ;font-size: 16px\'>vvvvvvvv</span><br/>[09:52:57]  <a href=\'method!touser?id=2\' target=\'liaotian2\'>王五</a>对<a href=\'method!touser?id=1\' target=\'liaotian2\'>张三</a>说话：<span style=\'color:#00a010 ;font-size: 16px\'>vvvrrr</span><br/>', '1');
INSERT INTO `t_user` VALUES ('1', '2014-03-09 23:03:17', '未登录', '5345@qq.com', '嘿嘿', '聊天吧', 'zhangsan', '13888888888', '123123', '0', '20140309230317905.jpg', '张三', '0', 'zhangsan', '男');
INSERT INTO `t_user` VALUES ('2', '2014-03-10 09:39:04', '未登录', '34535@qq.com', '王五简介', 'wangwu', 'wangwu', '13777777777', '123132', '0', '20140310093904635.jpg', '王五', '0', 'wangwu', '女');
INSERT INTO `t_user` VALUES ('3', '2014-03-10 00:15:35', '未登录', '12321@qq.com', null, null, 'gousan', '13333333333', '14323', '0', 'touxiang.jpg', '勾三', '0', 'gousan', '男');
INSERT INTO `t_user` VALUES ('4', '2014-03-10 00:16:57', null, '4565@qq.com', null, null, 'wangliu', '13666666666', '234234', '0', 'touxiang.jpg', 'wangliu', '0', 'wangliu', '男');
INSERT INTO `t_user` VALUES ('5', '2014-03-10 00:20:11', '未登录', '4543@qq.com', null, null, 'zhangsi', '13444446789', '24234', '0', 'touxiang.jpg', 'zhangsi', '0', 'zhangsi', '男');
