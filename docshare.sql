/*
 Navicat Premium Data Transfer

 Source Server         : 本地开发
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : docshare

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 08/06/2019 22:21:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `Summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简介',
  `Content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文本内容',
  `Img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `CreatorName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `CreatorId` int(11) NULL DEFAULT NULL COMMENT '创建人Id',
  `TypeId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文档类型',
  `CreatedTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  `ReadSum` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO `doc` VALUES (1, '标题1', '学习类型', '1', '1', 'rl7', 11, '1', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (2, '标题2', '考试类型', '内容', 'src/img', 'rl7', 11, '2', '2019-05-14 20:14', 4);
INSERT INTO `doc` VALUES (3, '标题3', '竞赛类型', '1', '1', 'rl7', 11, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (4, '标题4', '竞赛类型', '1', '1', 'rl7', 11, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (5, '标题5', '竞赛类型', '1', '1', 'rl7', 11, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (6, '标题6', '竞赛类型', '1', '1', 'rl7', 11, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (7, 'rl7创建的1', '竞赛类型', '1', '1', 'rl7', 12, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (8, 'rl7创建的2', '竞赛类型', '1', '1', 'rl7', 12, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (9, 'rl7创建的3', '竞赛类型', '1', '1', 'rl7', 12, '3', '2019-05-14 20:14', 0);
INSERT INTO `doc` VALUES (10, '文章标题', '这是文章的摘要', 'undefined', 'http://localhost:3000/1558109297533.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.T6FVcJVssQaI3cd46c50c6a0eabf01cb3f5858245ecf.jpg;http://localhost:3000/1558109297536.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.zQkaBs1YF0gXb5889d48d626bd066da491ce27fd73f3.jpg;http://localhost:3000/1558109297539.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.xrXXT9Llce6J32c7c65e3bfb065a06b13dbe4cbf0d9a.jpg;', 'rl7', 12, '1', '2019-05-18 00:09', 0);
INSERT INTO `doc` VALUES (11, '111', '111', 'undefined', 'http://localhost:3000/1558109695423.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.TPkHWc22xKYl32c7c65e3bfb065a06b13dbe4cbf0d9a.jpg;http://localhost:3000/1558109695426.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.ErXIWs5IWq563cd46c50c6a0eabf01cb3f5858245ecf.jpg;', 'rl7', 12, '1', '2019-05-18 00:14', 0);
INSERT INTO `doc` VALUES (12, 'sds', 'sdas', 'undefined', '', 'rl7', 12, '2', '2019-05-18 00:33', 0);
INSERT INTO `doc` VALUES (13, 'sds', 'sdas', 'undefined', '', 'rl7', 12, '2', '2019-05-18 00:37', 0);
INSERT INTO `doc` VALUES (14, 'wew', 'wqrwr', 'undefined', '', 'rl7', 12, '1', '2019-05-18 00:41', 1);
INSERT INTO `doc` VALUES (20, '创建一个学习相关的文档', '12345', 'undefined', 'http://localhost:3000/1558111726694.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.0Pr3YUZ3V7iF32c7c65e3bfb065a06b13dbe4cbf0d9a.jpg;', 'rl7', 12, '1', '2019-05-18 00:48', 6);
INSERT INTO `doc` VALUES (21, 'wewq', 'weqwr', 'wrqrq', '', 'rl7', 12, '1', '2019-05-18 18:03', 1);
INSERT INTO `doc` VALUES (22, 'sss', 'ssss', 'sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawwwwwwwwwwwwwwwwwwwwwwrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 'http://localhost:3000/1558173838570.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.qx6zvh6BRRQrb5889d48d626bd066da491ce27fd73f3.jpg;http://localhost:3000/1558173838572.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.G0etxbbRo66T3cd46c50c6a0eabf01cb3f5858245ecf.jpg;http://localhost:3000/1558173838575.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.2MeiqufddTGr32c7c65e3bfb065a06b13dbe4cbf0d9a.jpg;', 'rl7', 12, '1', '2019-05-18 18:04', 54);
INSERT INTO `doc` VALUES (23, '这是一个测试用的标题', '类型是考试', '考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试考试', 'http://localhost:3000/1559312354071.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.1WaFAGhEGikhd35727dbf1bef9d5a20e05ef17c41790.png;http://localhost:3000/1559312354075.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.fjsLFWhVPUy38532fde37eeca5d61c4c120d3f4b09e2.png;http://localhost:3000/1559312354138.wx844b660d83c678ba.o6zAJs-TzLEZQvv801Ys8B4Fg_BM.Fo7mY22mP8ma2b557a2139ea1b6c78df2663ad00997f.png;', 'rl7', 12, '2', '2019-05-31 22:25', 1);

-- ----------------------------
-- Table structure for doclike
-- ----------------------------
DROP TABLE IF EXISTS `doclike`;
CREATE TABLE `doclike`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NULL DEFAULT NULL,
  `DocId` int(11) NULL DEFAULT NULL,
  `IsLiked` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doclike
-- ----------------------------
INSERT INTO `doclike` VALUES (1, 12, 1, 1);
INSERT INTO `doclike` VALUES (2, 12, 22, 1);
INSERT INTO `doclike` VALUES (3, 12, 22, 1);
INSERT INTO `doclike` VALUES (4, 12, 22, 1);
INSERT INTO `doclike` VALUES (5, 12, 22, 1);
INSERT INTO `doclike` VALUES (6, 12, 22, 1);
INSERT INTO `doclike` VALUES (7, 12, 22, 1);
INSERT INTO `doclike` VALUES (8, 12, 22, 0);
INSERT INTO `doclike` VALUES (9, 12, 22, 1);

-- ----------------------------
-- Table structure for doctype
-- ----------------------------
DROP TABLE IF EXISTS `doctype`;
CREATE TABLE `doctype`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '\'类型\'',
  `IsSystem` int(11) NULL DEFAULT NULL COMMENT '\'是否是系统自带的文档\'',
  `CreateTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '\'创建时间\'',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctype
-- ----------------------------
INSERT INTO `doctype` VALUES (1, '学习', 1, '2019-5-13 17：58');
INSERT INTO `doctype` VALUES (2, '考试', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (3, '竞赛', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (4, '兴趣', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (5, '游戏', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (6, '体育', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (7, '汽车', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (8, '财经', 1, '2019-5-13 17：49');
INSERT INTO `doctype` VALUES (9, '搞笑', 1, '2019-5-13 17：49');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DocId` int(11) NULL DEFAULT NULL COMMENT '文档Id',
  `UserId` int(11) NULL DEFAULT NULL COMMENT '用户Id',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `Summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章简介',
  `CreateTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (2, 1, 12, '1', '1', '1');
INSERT INTO `history` VALUES (3, 1, 12, '1', '1', NULL);
INSERT INTO `history` VALUES (4, 2, 12, '标题', '简介', '2019-05-14 21:28');
INSERT INTO `history` VALUES (5, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 17:57');
INSERT INTO `history` VALUES (6, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 17:58');
INSERT INTO `history` VALUES (7, 14, 12, 'wew', 'wqrwr', '2019-05-18 17:59');
INSERT INTO `history` VALUES (8, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 17:59');
INSERT INTO `history` VALUES (9, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 18:00');
INSERT INTO `history` VALUES (10, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 18:00');
INSERT INTO `history` VALUES (11, 22, 12, 'sss', 'ssss', '2019-05-18 18:04');
INSERT INTO `history` VALUES (12, 22, 12, 'sss', 'ssss', '2019-05-18 18:09');
INSERT INTO `history` VALUES (13, 21, 12, 'wewq', 'weqwr', '2019-05-18 18:09');
INSERT INTO `history` VALUES (14, 20, 12, '创建一个学习相关的文档', '12345', '2019-05-18 18:09');
INSERT INTO `history` VALUES (15, 22, 12, 'sss', 'ssss', '2019-05-18 18:10');
INSERT INTO `history` VALUES (16, 22, 12, 'sss', 'ssss', '2019-05-18 18:32');
INSERT INTO `history` VALUES (17, 22, 12, 'sss', 'ssss', '2019-05-18 18:35');
INSERT INTO `history` VALUES (18, 22, 12, 'sss', 'ssss', '2019-05-18 18:35');
INSERT INTO `history` VALUES (19, 22, 12, 'sss', 'ssss', '2019-05-18 18:36');
INSERT INTO `history` VALUES (20, 22, 12, 'sss', 'ssss', '2019-05-18 18:37');
INSERT INTO `history` VALUES (21, 22, 12, 'sss', 'ssss', '2019-05-18 18:38');
INSERT INTO `history` VALUES (22, 22, 12, 'sss', 'ssss', '2019-05-18 18:39');
INSERT INTO `history` VALUES (23, 22, 12, 'sss', 'ssss', '2019-05-18 18:47');
INSERT INTO `history` VALUES (24, 22, 12, 'sss', 'ssss', '2019-05-18 18:48');
INSERT INTO `history` VALUES (25, 22, 12, 'sss', 'ssss', '2019-05-18 18:48');
INSERT INTO `history` VALUES (26, 22, 12, 'sss', 'ssss', '2019-05-18 18:49');
INSERT INTO `history` VALUES (27, 22, 12, 'sss', 'ssss', '2019-05-18 18:50');
INSERT INTO `history` VALUES (28, 22, 12, 'sss', 'ssss', '2019-05-18 18:50');
INSERT INTO `history` VALUES (29, 22, 12, 'sss', 'ssss', '2019-05-18 18:56');
INSERT INTO `history` VALUES (30, 22, 12, 'sss', 'ssss', '2019-05-18 18:57');
INSERT INTO `history` VALUES (31, 22, 12, 'sss', 'ssss', '2019-05-18 18:57');
INSERT INTO `history` VALUES (32, 22, 12, 'sss', 'ssss', '2019-05-18 19:04');
INSERT INTO `history` VALUES (33, 22, 12, 'sss', 'ssss', '2019-05-18 19:05');
INSERT INTO `history` VALUES (34, 22, 12, 'sss', 'ssss', '2019-05-18 19:05');
INSERT INTO `history` VALUES (35, 22, 12, 'sss', 'ssss', '2019-05-18 19:06');
INSERT INTO `history` VALUES (36, 22, 12, 'sss', 'ssss', '2019-05-18 19:07');
INSERT INTO `history` VALUES (37, 22, 12, 'sss', 'ssss', '2019-05-18 19:07');
INSERT INTO `history` VALUES (38, 22, 12, 'sss', 'ssss', '2019-05-18 19:09');
INSERT INTO `history` VALUES (39, 22, 12, 'sss', 'ssss', '2019-05-18 19:11');
INSERT INTO `history` VALUES (40, 22, 12, 'sss', 'ssss', '2019-05-18 19:11');
INSERT INTO `history` VALUES (41, 22, 12, 'sss', 'ssss', '2019-05-18 19:13');
INSERT INTO `history` VALUES (42, 22, 12, 'sss', 'ssss', '2019-05-18 19:13');
INSERT INTO `history` VALUES (43, 22, 12, 'sss', 'ssss', '2019-05-18 19:14');
INSERT INTO `history` VALUES (44, 22, 12, 'sss', 'ssss', '2019-05-18 19:15');
INSERT INTO `history` VALUES (45, 22, 12, 'sss', 'ssss', '2019-05-18 19:15');
INSERT INTO `history` VALUES (46, 22, 12, 'sss', 'ssss', '2019-05-18 19:19');
INSERT INTO `history` VALUES (47, 22, 12, 'sss', 'ssss', '2019-05-18 19:20');
INSERT INTO `history` VALUES (48, 22, 12, 'sss', 'ssss', '2019-05-18 19:21');
INSERT INTO `history` VALUES (49, 22, 12, 'sss', 'ssss', '2019-05-18 19:22');
INSERT INTO `history` VALUES (50, 22, 12, 'sss', 'ssss', '2019-05-18 19:23');
INSERT INTO `history` VALUES (51, 22, 12, 'sss', 'ssss', '2019-05-18 19:24');
INSERT INTO `history` VALUES (52, 22, 12, 'sss', 'ssss', '2019-05-18 19:27');
INSERT INTO `history` VALUES (53, 22, 12, 'sss', 'ssss', '2019-05-18 19:29');
INSERT INTO `history` VALUES (54, 22, 12, 'sss', 'ssss', '2019-05-18 19:29');
INSERT INTO `history` VALUES (55, 22, 12, 'sss', 'ssss', '2019-05-18 19:30');
INSERT INTO `history` VALUES (56, 22, 12, 'sss', 'ssss', '2019-05-18 19:30');
INSERT INTO `history` VALUES (57, 22, 12, 'sss', 'ssss', '2019-05-18 19:31');
INSERT INTO `history` VALUES (58, 22, 12, 'sss', 'ssss', '2019-05-18 19:32');
INSERT INTO `history` VALUES (59, 22, 12, 'sss', 'ssss', '2019-05-18 19:33');
INSERT INTO `history` VALUES (60, 22, 12, 'sss', 'ssss', '2019-05-18 19:34');
INSERT INTO `history` VALUES (61, 22, 12, 'sss', 'ssss', '2019-05-18 19:35');
INSERT INTO `history` VALUES (62, 22, 12, 'sss', 'ssss', '2019-05-18 19:35');
INSERT INTO `history` VALUES (63, 22, 12, 'sss', 'ssss', '2019-05-18 19:36');
INSERT INTO `history` VALUES (64, 22, 12, 'sss', 'ssss', '2019-05-18 19:42');
INSERT INTO `history` VALUES (65, 22, 12, 'sss', 'ssss', '2019-05-18 19:48');
INSERT INTO `history` VALUES (66, 22, 12, 'sss', 'ssss', '2019-05-18 19:51');
INSERT INTO `history` VALUES (67, 23, 12, '这是一个测试用的标题', '类型是考试', '2019-05-31 22:31');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `CreateTime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建时间',
  `Sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '未知' COMMENT '性别（男女未知）',
  `HeadImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'test01', '123456', '1111', '未知', 'src');
INSERT INTO `userinfo` VALUES (2, 'test', '123456', '1999-1-1 10:20', '男', 'src');
INSERT INTO `userinfo` VALUES (3, 'rl', '123456', '2019-05-13 13:04', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (5, 'rl3', '123456', '2019-05-14 19:28', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (6, 'rl4', '123456', '2019-05-14 19:33', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (7, 'rl4', '123456', '2019-05-14 19:34', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (8, 'undefined', 'undefined', '2019-05-14 19:39', 'undefined', 'undefined');
INSERT INTO `userinfo` VALUES (9, 'rl4', '123456', '2019-05-14 19:49', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (10, 'rl5', '123456', '2019-05-14 19:51', '男', 'src/jpg');
INSERT INTO `userinfo` VALUES (11, 'rl9', '123456', '2019-05-14 19:54', '男', 'http://localhost:3000/head1.jpg');
INSERT INTO `userinfo` VALUES (12, 'rl7', '123456', '2019-05-16 14:31', '女', 'https://wx.qlogo.cn/mmopen/vi_32/OYtSMsH4wlJPFibmJMMwdwAdfIScmwaic3fRCaXkCptM53OJiacCYawJIyDN0pQr9LqicYEGU55v6kt8n0zJ0wtQibQ/132');
INSERT INTO `userinfo` VALUES (13, 'lyp', '123456', '2019-05-16 21:26', '男', '');
INSERT INTO `userinfo` VALUES (14, 'rl8', '123456', '2019-05-16 21:28', '男', 'https://wx.qlogo.cn/mmopen/vi_32/OYtSMsH4wlJPFibmJMMwdwAdfIScmwaic3fRCaXkCptM53OJiacCYawJIyDN0pQr9LqicYEGU55v6kt8n0zJ0wtQibQ/132');
INSERT INTO `userinfo` VALUES (15, 'rl10', '123456', '2019-05-16 21:29', '男', 'https://wx.qlogo.cn/mmopen/vi_32/OYtSMsH4wlJPFibmJMMwdwAdfIScmwaic3fRCaXkCptM53OJiacCYawJIyDN0pQr9LqicYEGU55v6kt8n0zJ0wtQibQ/132');
INSERT INTO `userinfo` VALUES (16, 'rl11', '123456', '2019-05-16 21:35', '女', 'https://wx.qlogo.cn/mmopen/vi_32/OYtSMsH4wlJPFibmJMMwdwAdfIScmwaic3fRCaXkCptM53OJiacCYawJIyDN0pQr9LqicYEGU55v6kt8n0zJ0wtQibQ/132');
INSERT INTO `userinfo` VALUES (17, 'rl12', '123456', '2019-05-16 21:36', '女', 'https://wx.qlogo.cn/mmopen/vi_32/OYtSMsH4wlJPFibmJMMwdwAdfIScmwaic3fRCaXkCptM53OJiacCYawJIyDN0pQr9LqicYEGU55v6kt8n0zJ0wtQibQ/132');

-- ----------------------------
-- Table structure for userlikedtype
-- ----------------------------
DROP TABLE IF EXISTS `userlikedtype`;
CREATE TABLE `userlikedtype`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DocTypeId` int(11) NOT NULL COMMENT '类型Id',
  `UserId` int(11) NOT NULL COMMENT '用户Id',
  `Liked` int(11) NOT NULL DEFAULT 1 COMMENT '是否喜欢',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlikedtype
-- ----------------------------
INSERT INTO `userlikedtype` VALUES (1, 1, 12, 1);
INSERT INTO `userlikedtype` VALUES (2, 2, 12, 1);
INSERT INTO `userlikedtype` VALUES (3, 1, 2, 1);
INSERT INTO `userlikedtype` VALUES (4, 1, 3, 0);
INSERT INTO `userlikedtype` VALUES (5, 2, 3, 0);
INSERT INTO `userlikedtype` VALUES (6, 3, 3, 0);
INSERT INTO `userlikedtype` VALUES (7, 4, 3, 0);
INSERT INTO `userlikedtype` VALUES (8, 5, 3, 1);
INSERT INTO `userlikedtype` VALUES (9, 6, 3, 0);

SET FOREIGN_KEY_CHECKS = 1;
