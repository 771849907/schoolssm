
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `aname` varchar(255) NOT NULL COMMENT '管理员姓名',
  `apassword` varchar(255) NOT NULL COMMENT '管理员密码',
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '2018-12-01 13:33:06');
-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `titles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子标题',
  `fcontent` varchar(2000) NOT NULL COMMENT '帖子内容',
  `photo` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '帖子图片',
  `bname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '所属板块名字',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  `userid` int(11) NOT NULL COMMENT '发帖人id',
  `username` varchar(45) CHARACTER SET utf8 NOT NULL COMMENT '发帖人姓名',
  `status` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '帖子审核状态(0为待审核，1为通过审核，2为未通过审核，默认为0)',
  PRIMARY KEY (`fid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='发帖表';

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注表id',
  `userid` int(11) NOT NULL COMMENT '主动关注者的id',
  `beuserid` int(11) NOT NULL COMMENT '被动关注者的id',
  PRIMARY KEY (`gid`),
  KEY `userid` (`userid`),
  KEY `beuserid` (`beuserid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Records of attention
-- ----------------------------
-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `userid` int(11) NOT NULL COMMENT '收藏者id',
  `fid` int(11) NOT NULL COMMENT '被收藏帖子id',
  PRIMARY KEY (`sid`),
  KEY `userid` (`userid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of collect
-- ----------------------------
-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `pcontent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `userid` int(11) NOT NULL COMMENT '评论者',
  `fid` int(11) NOT NULL COMMENT '被评论帖子id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`pid`),
  KEY `userid` (`userid`),
  KEY `fid` (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- ----------------------------
-- Records of comment
-- ----------------------------
-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `bname` varchar(255) NOT NULL COMMENT '板块名字',
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '板块创建时间',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='板块表';

-- ----------------------------
-- Records of plate
-- ----------------------------
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(45) NOT NULL COMMENT '用户姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `password` varchar(45) NOT NULL COMMENT '用户密码',
  `email` varchar(45) NOT NULL COMMENT '用户email',
  `family` varchar(45) DEFAULT NULL COMMENT '用户住址',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人简介',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
-- ----------------------------
-- Table structure for via
-- ----------------------------
DROP TABLE IF EXISTS `via`;
CREATE TABLE `via` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `photo` varchar(255) NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='头像表';

-- ----------------------------
-- Records of via
-- ----------------------------