/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.20.30
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 192.168.20.30:3306
 Source Schema         : ilikecook

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 10/05/2019 12:02:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `last_login` datetime(0) NOT NULL COMMENT '最后一次登录时间',
  `mobile` int(11) NULL DEFAULT NULL COMMENT '手机号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：锁定，2：异常，3：注销）',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别（0：未知，1：男，2：女，）',
  `role_id` int(11) NULL DEFAULT 1 COMMENT '用户拥有的角色的id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_admin_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES (1, 'admin', '$2a$10$taemojaikmPnNFwTGdKcTe5CY52wY5VSmIJnNPhjyvBQN5trK.29O', '/static/images/default_user_avator.png', '2019-04-30 19:45:55', NULL, '2019-04-30 11:39:34', NULL, 0, NULL, 0, 3);
INSERT INTO `admin_info` VALUES (2, 'test22', '$2a$10$taemojaikmPnNFwTGdKcTe5CY52wY5VSmIJnNPhjyvBQN5trK.29O', '/static/images/default_user_avator.png', '2019-04-30 19:46:00', NULL, '2019-04-30 11:43:57', NULL, 0, NULL, 0, 3);

-- ----------------------------
-- Table structure for big_category
-- ----------------------------
DROP TABLE IF EXISTS `big_category`;
CREATE TABLE `big_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `category` int(11) NULL DEFAULT NULL COMMENT '分类编号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0：可用，1：不可用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱大分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_category
-- ----------------------------
INSERT INTO `big_category` VALUES (1, '热门专题', 101, 0);
INSERT INTO `big_category` VALUES (2, '烘焙甜品饮料', 102, 0);
INSERT INTO `big_category` VALUES (3, '肉类', 103, 0);
INSERT INTO `big_category` VALUES (4, '蔬菜水果', 104, 0);
INSERT INTO `big_category` VALUES (5, '汤粥主食', 105, 0);
INSERT INTO `big_category` VALUES (6, '口味特色', 106, 0);
INSERT INTO `big_category` VALUES (7, '水产', 107, 0);
INSERT INTO `big_category` VALUES (8, '蛋奶豆制品', 108, 0);
INSERT INTO `big_category` VALUES (9, '米面干果腌咸', 109, 0);

-- ----------------------------
-- Table structure for category_menu_rel
-- ----------------------------
DROP TABLE IF EXISTS `category_menu_rel`;
CREATE TABLE `category_menu_rel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_category_tiny`(`category_id`) USING BTREE,
  INDEX `fk_menu`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_category_tiny` FOREIGN KEY (`category_id`) REFERENCES `tiny_category` (`category`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_menu_rel
-- ----------------------------
INSERT INTO `category_menu_rel` VALUES (1, 10001, '0714066b25c64ebbbe18a4cf3d62c8bc');
INSERT INTO `category_menu_rel` VALUES (2, 10300, '0714066b25c64ebbbe18a4cf3d62c8bc');
INSERT INTO `category_menu_rel` VALUES (3, 10003, '0714066b25c64ebbbe18a4cf3d62c8bc');
INSERT INTO `category_menu_rel` VALUES (4, 10296, 'e5ebeeb682fb4c8792313f44d309a299');
INSERT INTO `category_menu_rel` VALUES (5, 10367, 'e5ebeeb682fb4c8792313f44d309a299');
INSERT INTO `category_menu_rel` VALUES (6, 10009, '6be893be5b80403ab592c2aa3a714021');
INSERT INTO `category_menu_rel` VALUES (7, 10301, '6be893be5b80403ab592c2aa3a714021');
INSERT INTO `category_menu_rel` VALUES (8, 10307, '6be893be5b80403ab592c2aa3a714021');
INSERT INTO `category_menu_rel` VALUES (9, 10377, '6be893be5b80403ab592c2aa3a714021');
INSERT INTO `category_menu_rel` VALUES (14, 10001, '05347f08072f46e783ce9efc3c7e9d3b');
INSERT INTO `category_menu_rel` VALUES (15, 10002, '05347f08072f46e783ce9efc3c7e9d3b');
INSERT INTO `category_menu_rel` VALUES (22, 10025, '833688f5f7f64b0cbf7809d5357f6f2e');
INSERT INTO `category_menu_rel` VALUES (23, 10056, '833688f5f7f64b0cbf7809d5357f6f2e');
INSERT INTO `category_menu_rel` VALUES (24, 10078, 'b36ffdff96264f53be7285e18cf699ef');
INSERT INTO `category_menu_rel` VALUES (25, 10006, 'b36ffdff96264f53be7285e18cf699ef');
INSERT INTO `category_menu_rel` VALUES (34, 10056, 'f40bbb0165b84a5e9899e77e92777ecf');
INSERT INTO `category_menu_rel` VALUES (35, 10025, 'f40bbb0165b84a5e9899e77e92777ecf');
INSERT INTO `category_menu_rel` VALUES (36, 10299, 'faf83bb0232f48548e478314ddf75542');
INSERT INTO `category_menu_rel` VALUES (37, 10026, 'f78570a328e64ca6924c260bd92b84a6');

-- ----------------------------
-- Table structure for menu_comment
-- ----------------------------
DROP TABLE IF EXISTS `menu_comment`;
CREATE TABLE `menu_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentUserId` int(11) NULL DEFAULT NULL,
  `commentNickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `replyUserId` int(11) NOT NULL,
  `replyNickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_commentId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_comment_menuId`(`menuId`) USING BTREE,
  INDEX `fk_menu_comment_comment_userId`(`commentUserId`) USING BTREE,
  INDEX `fk_menu_comment_comment_nickname`(`commentNickname`) USING BTREE,
  INDEX `fk_menu_comment_reply_userId`(`replyUserId`) USING BTREE,
  INDEX `fk_menu_comment_reply_nickname`(`replyNickname`) USING BTREE,
  INDEX `fk_menu_comment_parent_id`(`parent_commentId`) USING BTREE,
  CONSTRAINT `fk_menu_comment_menuId` FOREIGN KEY (`menuId`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_comment_comment_nickname` FOREIGN KEY (`commentNickname`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_comment_comment_userId` FOREIGN KEY (`commentUserId`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_comment_reply_nickname` FOREIGN KEY (`replyNickname`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_comment_reply_userId` FOREIGN KEY (`replyUserId`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_comment_parent_id` FOREIGN KEY (`parent_commentId`) REFERENCES `menu_comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_comment
-- ----------------------------
INSERT INTO `menu_comment` VALUES (1, '0714066b25c64ebbbe18a4cf3d62c8bc', NULL, NULL, 5, 'bobbob', '这个才非常好吃', '2019-05-10 01:09:32', NULL);
INSERT INTO `menu_comment` VALUES (2, '0714066b25c64ebbbe18a4cf3d62c8bc', 5, 'bobbob', 6, 'test22', '非常赞同', '2019-05-10 01:10:22', 1);
INSERT INTO `menu_comment` VALUES (3, '0714066b25c64ebbbe18a4cf3d62c8bc', 6, 'test22', 5, 'bobbob', '英雄所见略同', '2019-05-10 01:11:05', 1);
INSERT INTO `menu_comment` VALUES (4, '0714066b25c64ebbbe18a4cf3d62c8bc', 5, 'bobbob', 6, 'test22', '加油', '2019-05-10 01:12:13', 1);
INSERT INTO `menu_comment` VALUES (5, '0714066b25c64ebbbe18a4cf3d62c8bc', NULL, NULL, 8, 'shagua', '你那里的', '2019-05-10 01:13:17', NULL);
INSERT INTO `menu_comment` VALUES (6, '0714066b25c64ebbbe18a4cf3d62c8bc', 8, 'shagua', 2, 'alanwang', '北京的', '2019-05-10 01:13:52', 5);
INSERT INTO `menu_comment` VALUES (7, '0714066b25c64ebbbe18a4cf3d62c8bc', 2, 'alanwang', 8, 'shagua', '我也是', '2019-05-10 01:14:15', 5);

-- ----------------------------
-- Table structure for menu_food
-- ----------------------------
DROP TABLE IF EXISTS `menu_food`;
CREATE TABLE `menu_food`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱的id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用料的名称',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用料的数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_summary_food`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_menu_summary_food` FOREIGN KEY (`menu_id`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 477 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_food
-- ----------------------------
INSERT INTO `menu_food` VALUES (1, '0714066b25c64ebbbe18a4cf3d62c8bc', '腊肉', '一条');
INSERT INTO `menu_food` VALUES (2, '0714066b25c64ebbbe18a4cf3d62c8bc', '萝卜干', '自己斟酌');
INSERT INTO `menu_food` VALUES (3, '0714066b25c64ebbbe18a4cf3d62c8bc', '大蒜', '2-3瓣');
INSERT INTO `menu_food` VALUES (4, '0714066b25c64ebbbe18a4cf3d62c8bc', '干辣椒段	', '4-5个剪段');
INSERT INTO `menu_food` VALUES (5, '0714066b25c64ebbbe18a4cf3d62c8bc', '干辣椒末', '一小勺');
INSERT INTO `menu_food` VALUES (6, '0714066b25c64ebbbe18a4cf3d62c8bc', '小米椒', '两到三个');
INSERT INTO `menu_food` VALUES (7, '0714066b25c64ebbbe18a4cf3d62c8bc', '蒜苗叶', '一根');
INSERT INTO `menu_food` VALUES (8, '0714066b25c64ebbbe18a4cf3d62c8bc', '豆豉', '十几粒');
INSERT INTO `menu_food` VALUES (9, '0714066b25c64ebbbe18a4cf3d62c8bc', '调味: 料酒，酱油，味精，盐。', '如果你的腊肉不泡水，请少放盐。');
INSERT INTO `menu_food` VALUES (10, 'e5ebeeb682fb4c8792313f44d309a299', '豆腐', '一大块');
INSERT INTO `menu_food` VALUES (11, 'e5ebeeb682fb4c8792313f44d309a299', '葱', '一根');
INSERT INTO `menu_food` VALUES (12, 'e5ebeeb682fb4c8792313f44d309a299', '酱油', '三勺');
INSERT INTO `menu_food` VALUES (13, 'e5ebeeb682fb4c8792313f44d309a299', '蚝油', '一勺');
INSERT INTO `menu_food` VALUES (14, 'e5ebeeb682fb4c8792313f44d309a299', '白砂糖', '半勺');
INSERT INTO `menu_food` VALUES (15, 'e5ebeeb682fb4c8792313f44d309a299', '油', '适量');
INSERT INTO `menu_food` VALUES (16, '6be893be5b80403ab592c2aa3a714021', '乌冬面', '一份');
INSERT INTO `menu_food` VALUES (17, '6be893be5b80403ab592c2aa3a714021', '肥牛片', '若干');
INSERT INTO `menu_food` VALUES (18, '6be893be5b80403ab592c2aa3a714021', '胡萝卜', '1小根');
INSERT INTO `menu_food` VALUES (19, '6be893be5b80403ab592c2aa3a714021', '洋葱', '半颗');
INSERT INTO `menu_food` VALUES (20, '6be893be5b80403ab592c2aa3a714021', '最主要 咖喱块', '1块');
INSERT INTO `menu_food` VALUES (21, '6be893be5b80403ab592c2aa3a714021', '香葱 芝麻', '少许');
INSERT INTO `menu_food` VALUES (22, '92718a72a7a947e5b637c36107d81f09', '糙米', '1/2 cup');
INSERT INTO `menu_food` VALUES (23, '92718a72a7a947e5b637c36107d81f09', '大麦米', '1/4 cup');
INSERT INTO `menu_food` VALUES (24, '92718a72a7a947e5b637c36107d81f09', '高粱米', '1/4 cup');
INSERT INTO `menu_food` VALUES (25, '92718a72a7a947e5b637c36107d81f09', '糯米', '1/4 cup');
INSERT INTO `menu_food` VALUES (26, '92718a72a7a947e5b637c36107d81f09', '燕麦米', '	1/4 cup');
INSERT INTO `menu_food` VALUES (27, '92718a72a7a947e5b637c36107d81f09', '黑米', '	2 tbsp');
INSERT INTO `menu_food` VALUES (28, '92718a72a7a947e5b637c36107d81f09', '水', '	2 cups');
INSERT INTO `menu_food` VALUES (29, '47f1cdd33e9a4281b6cb3f93f52dc149', '肋小排', '\r\n	300克');
INSERT INTO `menu_food` VALUES (30, '47f1cdd33e9a4281b6cb3f93f52dc149', '海带', '100克');
INSERT INTO `menu_food` VALUES (31, '47f1cdd33e9a4281b6cb3f93f52dc149', '葱段', '1个');
INSERT INTO `menu_food` VALUES (32, '47f1cdd33e9a4281b6cb3f93f52dc149', '生姜', '2片');
INSERT INTO `menu_food` VALUES (33, '47f1cdd33e9a4281b6cb3f93f52dc149', '盐', '自己调');
INSERT INTO `menu_food` VALUES (34, '47f1cdd33e9a4281b6cb3f93f52dc149', '料酒', '1大勺');
INSERT INTO `menu_food` VALUES (35, '571926782b7a433393e487de00eb5522', '鸡翅（翅中最佳）', '8个');
INSERT INTO `menu_food` VALUES (36, '571926782b7a433393e487de00eb5522', '可乐', '易拉罐一罐');
INSERT INTO `menu_food` VALUES (37, '571926782b7a433393e487de00eb5522', '盐', '适量');
INSERT INTO `menu_food` VALUES (38, '571926782b7a433393e487de00eb5522', '料酒', NULL);
INSERT INTO `menu_food` VALUES (39, '571926782b7a433393e487de00eb5522', '老抽', '	7ml');
INSERT INTO `menu_food` VALUES (40, '571926782b7a433393e487de00eb5522', '生抽', '	10ml');
INSERT INTO `menu_food` VALUES (41, '571926782b7a433393e487de00eb5522', '生姜片（可有可无，有则更好）', '5片');
INSERT INTO `menu_food` VALUES (42, '571926782b7a433393e487de00eb5522', '桂皮（可有可无，有则更好）', '	半支或一支');
INSERT INTO `menu_food` VALUES (43, '5f1376312824475ea6ce692174900ec1', '猪小排', '500克');
INSERT INTO `menu_food` VALUES (44, '5f1376312824475ea6ce692174900ec1', '料酒', '1汤勺（1汤勺为15毫升容量的勺）');
INSERT INTO `menu_food` VALUES (45, '5f1376312824475ea6ce692174900ec1', '盐', '3克');
INSERT INTO `menu_food` VALUES (46, '5f1376312824475ea6ce692174900ec1', '酱油', '2汤勺（1汤勺为15毫升容量的勺）');
INSERT INTO `menu_food` VALUES (47, '5f1376312824475ea6ce692174900ec1', '米醋', '3汤勺（1汤勺为15毫升容量的勺）');
INSERT INTO `menu_food` VALUES (48, '5f1376312824475ea6ce692174900ec1', '白糖', '4汤勺（1汤勺为15毫升容量的勺）');
INSERT INTO `menu_food` VALUES (49, '5f1376312824475ea6ce692174900ec1', '姜片', NULL);
INSERT INTO `menu_food` VALUES (50, 'f34f0087950d4f059e4ef8997af022a1', '鸡胸肉', '	1块');
INSERT INTO `menu_food` VALUES (51, 'f34f0087950d4f059e4ef8997af022a1', '花生米', '	50克');
INSERT INTO `menu_food` VALUES (52, 'f34f0087950d4f059e4ef8997af022a1', '干辣椒', '10颗');
INSERT INTO `menu_food` VALUES (53, 'f34f0087950d4f059e4ef8997af022a1', '大蒜', '3颗');
INSERT INTO `menu_food` VALUES (54, 'f34f0087950d4f059e4ef8997af022a1', '葱', '1棵');
INSERT INTO `menu_food` VALUES (55, 'f34f0087950d4f059e4ef8997af022a1', '豆瓣酱', '30克');
INSERT INTO `menu_food` VALUES (56, 'f34f0087950d4f059e4ef8997af022a1', '白糖', '15克');
INSERT INTO `menu_food` VALUES (57, 'f34f0087950d4f059e4ef8997af022a1', '酱油', '20克');
INSERT INTO `menu_food` VALUES (58, 'f34f0087950d4f059e4ef8997af022a1', '香醋', '5克');
INSERT INTO `menu_food` VALUES (59, 'f34f0087950d4f059e4ef8997af022a1', '料酒', '10克');
INSERT INTO `menu_food` VALUES (60, 'f34f0087950d4f059e4ef8997af022a1', '淀粉', '适量');
INSERT INTO `menu_food` VALUES (61, 'f34f0087950d4f059e4ef8997af022a1', '盐', '适量');
INSERT INTO `menu_food` VALUES (62, '6f33d18101aa460096d49c6fa6ac0005', '腰果', '500g');
INSERT INTO `menu_food` VALUES (63, '6f33d18101aa460096d49c6fa6ac0005', '水', '150g');
INSERT INTO `menu_food` VALUES (64, '6f33d18101aa460096d49c6fa6ac0005', '白糖', '150g');
INSERT INTO `menu_food` VALUES (65, 'c8ad71e6ea8642f780daedb9fd691ddc', '鸡爪', NULL);
INSERT INTO `menu_food` VALUES (66, 'c8ad71e6ea8642f780daedb9fd691ddc', '泡椒', NULL);
INSERT INTO `menu_food` VALUES (67, 'c8ad71e6ea8642f780daedb9fd691ddc', '八角', NULL);
INSERT INTO `menu_food` VALUES (68, 'c8ad71e6ea8642f780daedb9fd691ddc', '香叶', NULL);
INSERT INTO `menu_food` VALUES (69, 'c8ad71e6ea8642f780daedb9fd691ddc', '花椒', NULL);
INSERT INTO `menu_food` VALUES (70, 'c8ad71e6ea8642f780daedb9fd691ddc', '生姜', NULL);
INSERT INTO `menu_food` VALUES (71, 'c8ad71e6ea8642f780daedb9fd691ddc', '白酒', NULL);
INSERT INTO `menu_food` VALUES (72, 'c8ad71e6ea8642f780daedb9fd691ddc', '醋', NULL);
INSERT INTO `menu_food` VALUES (73, 'c8ad71e6ea8642f780daedb9fd691ddc', '盐', NULL);
INSERT INTO `menu_food` VALUES (74, 'c8ad71e6ea8642f780daedb9fd691ddc', '柠檬', NULL);
INSERT INTO `menu_food` VALUES (75, 'c8ad71e6ea8642f780daedb9fd691ddc', '小米椒', NULL);
INSERT INTO `menu_food` VALUES (76, '6f4e6c1f487d41bf97d563d594846ad5', '春笋', '	3支');
INSERT INTO `menu_food` VALUES (77, '6f4e6c1f487d41bf97d563d594846ad5', '小葱', '2根');
INSERT INTO `menu_food` VALUES (78, '6f4e6c1f487d41bf97d563d594846ad5', '酱油', '1勺');
INSERT INTO `menu_food` VALUES (79, '6f4e6c1f487d41bf97d563d594846ad5', '蚝油', '半勺');
INSERT INTO `menu_food` VALUES (80, '6f4e6c1f487d41bf97d563d594846ad5', '橄榄油', '2勺');
INSERT INTO `menu_food` VALUES (81, '3d3e0493400642e9ac617a7257f0bdf4', '鳕鱼', NULL);
INSERT INTO `menu_food` VALUES (82, '3d3e0493400642e9ac617a7257f0bdf4', '料酒', NULL);
INSERT INTO `menu_food` VALUES (83, '3d3e0493400642e9ac617a7257f0bdf4', '盐', NULL);
INSERT INTO `menu_food` VALUES (84, '3d3e0493400642e9ac617a7257f0bdf4', '老姜', NULL);
INSERT INTO `menu_food` VALUES (85, '3d3e0493400642e9ac617a7257f0bdf4', '蒜头', NULL);
INSERT INTO `menu_food` VALUES (86, '3d3e0493400642e9ac617a7257f0bdf4', '干红辣椒', NULL);
INSERT INTO `menu_food` VALUES (87, '3d3e0493400642e9ac617a7257f0bdf4', '葱', NULL);
INSERT INTO `menu_food` VALUES (88, '3d3e0493400642e9ac617a7257f0bdf4', '蒸鱼豉油', NULL);
INSERT INTO `menu_food` VALUES (89, 'cee46249de1d4b42a0c93577413fa5cb', '紫薯', '500克');
INSERT INTO `menu_food` VALUES (90, 'cee46249de1d4b42a0c93577413fa5cb', '芋头（我用的是荔浦芋头，别的没用过）', '500克');
INSERT INTO `menu_food` VALUES (91, 'cee46249de1d4b42a0c93577413fa5cb', '南瓜', '500克');
INSERT INTO `menu_food` VALUES (92, 'cee46249de1d4b42a0c93577413fa5cb', '木薯淀粉', '各250克三种食材就共需要750克');
INSERT INTO `menu_food` VALUES (93, '1ceba29d11634538a908542f737fb489', '茄子', '一至两个');
INSERT INTO `menu_food` VALUES (94, '1ceba29d11634538a908542f737fb489', '猪肉', '一小块');
INSERT INTO `menu_food` VALUES (95, '1ceba29d11634538a908542f737fb489', '小米椒', '四个');
INSERT INTO `menu_food` VALUES (96, '1ceba29d11634538a908542f737fb489', '葱', '一根');
INSERT INTO `menu_food` VALUES (97, '1ceba29d11634538a908542f737fb489', '姜', '适量');
INSERT INTO `menu_food` VALUES (98, '1ceba29d11634538a908542f737fb489', '蒜', '适量');
INSERT INTO `menu_food` VALUES (99, '1ceba29d11634538a908542f737fb489', '生抽', '适量');
INSERT INTO `menu_food` VALUES (100, '1ceba29d11634538a908542f737fb489', '料酒', '适量');
INSERT INTO `menu_food` VALUES (101, '1ceba29d11634538a908542f737fb489', '白胡椒粉', '适量');
INSERT INTO `menu_food` VALUES (102, '1ceba29d11634538a908542f737fb489', '老抽', '少许');
INSERT INTO `menu_food` VALUES (103, '1ceba29d11634538a908542f737fb489', '生粉', '适量');
INSERT INTO `menu_food` VALUES (104, '1ceba29d11634538a908542f737fb489', '盐', '适量');
INSERT INTO `menu_food` VALUES (105, '1ceba29d11634538a908542f737fb489', '郫县豆瓣酱', '一小勺子');
INSERT INTO `menu_food` VALUES (106, '1ceba29d11634538a908542f737fb489', '白糖', '一小勺子');
INSERT INTO `menu_food` VALUES (107, '19816b23d74249b4aae7ebb114f46379', '豆腐', '1块');
INSERT INTO `menu_food` VALUES (108, '19816b23d74249b4aae7ebb114f46379', '青葱', '1条');
INSERT INTO `menu_food` VALUES (109, '19816b23d74249b4aae7ebb114f46379', '蒜蓉', '2瓣');
INSERT INTO `menu_food` VALUES (110, '19816b23d74249b4aae7ebb114f46379', '肉碎（牛肉碎最佳）', '为豆腐重量的1/10');
INSERT INTO `menu_food` VALUES (111, '19816b23d74249b4aae7ebb114f46379', '郫县豆瓣酱', '1大匙');
INSERT INTO `menu_food` VALUES (112, '19816b23d74249b4aae7ebb114f46379', '酱油（生抽）', '少许');
INSERT INTO `menu_food` VALUES (113, '19816b23d74249b4aae7ebb114f46379', '糖', '少许');
INSERT INTO `menu_food` VALUES (114, '19816b23d74249b4aae7ebb114f46379', '花椒面', '0.5-1g（看个人口味）');
INSERT INTO `menu_food` VALUES (115, '19816b23d74249b4aae7ebb114f46379', '麻油', '少许');
INSERT INTO `menu_food` VALUES (116, '19816b23d74249b4aae7ebb114f46379', '花雕酒/米酒', '	少许');
INSERT INTO `menu_food` VALUES (117, '19816b23d74249b4aae7ebb114f46379', '淀粉水', '勾芡用');
INSERT INTO `menu_food` VALUES (118, 'a14be5243eac46fc9d3b06a93ecc9270', '小白菜', '1把');
INSERT INTO `menu_food` VALUES (119, 'a14be5243eac46fc9d3b06a93ecc9270', '德式火腿（火腿肠、午餐肉也可）', '适量');
INSERT INTO `menu_food` VALUES (120, 'a14be5243eac46fc9d3b06a93ecc9270', '口蘑', '半斤');
INSERT INTO `menu_food` VALUES (121, 'a14be5243eac46fc9d3b06a93ecc9270', '蒜', '适量');
INSERT INTO `menu_food` VALUES (122, 'd011da5fdca64b328463984ddb132b3a', '椰青', '1个');
INSERT INTO `menu_food` VALUES (123, 'd011da5fdca64b328463984ddb132b3a', '鸡', '半只');
INSERT INTO `menu_food` VALUES (124, 'd011da5fdca64b328463984ddb132b3a', '红枣', '3颗');
INSERT INTO `menu_food` VALUES (125, 'd011da5fdca64b328463984ddb132b3a', '枸杞', '8粒');
INSERT INTO `menu_food` VALUES (126, '8a60936befcc4de3b93ed0bb25d906d3', '低筋面粉', '100克');
INSERT INTO `menu_food` VALUES (127, '8a60936befcc4de3b93ed0bb25d906d3', '牛奶', '	240ml');
INSERT INTO `menu_food` VALUES (128, '8a60936befcc4de3b93ed0bb25d906d3', '鸡蛋', '4个');
INSERT INTO `menu_food` VALUES (129, '8a60936befcc4de3b93ed0bb25d906d3', '黄油', '25克');
INSERT INTO `menu_food` VALUES (130, '8a60936befcc4de3b93ed0bb25d906d3', '香草精', '3滴');
INSERT INTO `menu_food` VALUES (131, '8a60936befcc4de3b93ed0bb25d906d3', '糖', '20克');
INSERT INTO `menu_food` VALUES (132, '8a60936befcc4de3b93ed0bb25d906d3', '盐', '2克');
INSERT INTO `menu_food` VALUES (133, '8a60936befcc4de3b93ed0bb25d906d3', '草莓', '适量');
INSERT INTO `menu_food` VALUES (134, '8a60936befcc4de3b93ed0bb25d906d3', '蓝莓', '适量');
INSERT INTO `menu_food` VALUES (135, '8a60936befcc4de3b93ed0bb25d906d3', '树莓', '适量');
INSERT INTO `menu_food` VALUES (136, '62367bf1715643068596d263162a9157', '糯米粉', '200克');
INSERT INTO `menu_food` VALUES (137, '62367bf1715643068596d263162a9157', '小麦淀粉（澄粉）', '60克');
INSERT INTO `menu_food` VALUES (138, '62367bf1715643068596d263162a9157', '开水', '100克');
INSERT INTO `menu_food` VALUES (139, '62367bf1715643068596d263162a9157', '细砂糖', '25克');
INSERT INTO `menu_food` VALUES (140, '62367bf1715643068596d263162a9157', '猪油', '30克');
INSERT INTO `menu_food` VALUES (141, '62367bf1715643068596d263162a9157', '新鲜艾草汁', '170克');
INSERT INTO `menu_food` VALUES (142, '62367bf1715643068596d263162a9157', '黑芝麻➕白芝麻', '	黑130克➕白20克');
INSERT INTO `menu_food` VALUES (143, '62367bf1715643068596d263162a9157', '猪油', '50克');
INSERT INTO `menu_food` VALUES (144, '62367bf1715643068596d263162a9157', '细砂糖', '50克');
INSERT INTO `menu_food` VALUES (145, 'f46d40f225bf4c92ba9def092509ed2a', '杏鲍菇', '2个');
INSERT INTO `menu_food` VALUES (146, 'f46d40f225bf4c92ba9def092509ed2a', '蒜末', '适量');
INSERT INTO `menu_food` VALUES (147, 'f46d40f225bf4c92ba9def092509ed2a', '香葱', '2根');
INSERT INTO `menu_food` VALUES (148, 'f46d40f225bf4c92ba9def092509ed2a', '水', '半碗');
INSERT INTO `menu_food` VALUES (149, 'f46d40f225bf4c92ba9def092509ed2a', '生抽', '1勺');
INSERT INTO `menu_food` VALUES (150, 'f46d40f225bf4c92ba9def092509ed2a', '老抽', '半勺');
INSERT INTO `menu_food` VALUES (151, 'f46d40f225bf4c92ba9def092509ed2a', '蚝油', '1勺');
INSERT INTO `menu_food` VALUES (152, 'f46d40f225bf4c92ba9def092509ed2a', '白糖', '少许');
INSERT INTO `menu_food` VALUES (153, 'f46d40f225bf4c92ba9def092509ed2a', '淀粉', '少许');
INSERT INTO `menu_food` VALUES (154, 'f960eec54cc54c728b78ea46f0196900', '南瓜', '	300克');
INSERT INTO `menu_food` VALUES (155, 'f960eec54cc54c728b78ea46f0196900', '糯米粉', '200克');
INSERT INTO `menu_food` VALUES (156, 'f960eec54cc54c728b78ea46f0196900', '白砂糖', '适量');
INSERT INTO `menu_food` VALUES (157, 'f960eec54cc54c728b78ea46f0196900', '面粉', '50克');
INSERT INTO `menu_food` VALUES (158, 'c1b4703829a34a91b7af8e089a1f8549', '大头虾（罗氏沼虾）', '500g');
INSERT INTO `menu_food` VALUES (159, 'c1b4703829a34a91b7af8e089a1f8549', '中国劲酒·金标', '300ml');
INSERT INTO `menu_food` VALUES (160, 'c1b4703829a34a91b7af8e089a1f8549', '生抽', '	200ml');
INSERT INTO `menu_food` VALUES (161, 'c1b4703829a34a91b7af8e089a1f8549', '水', '	600ml');
INSERT INTO `menu_food` VALUES (162, 'c1b4703829a34a91b7af8e089a1f8549', '冰糖', '80g');
INSERT INTO `menu_food` VALUES (163, 'c1b4703829a34a91b7af8e089a1f8549', '葱白（大葱）', '2段');
INSERT INTO `menu_food` VALUES (164, 'c1b4703829a34a91b7af8e089a1f8549', '八角', '10g');
INSERT INTO `menu_food` VALUES (165, 'c1b4703829a34a91b7af8e089a1f8549', '生姜', '20g');
INSERT INTO `menu_food` VALUES (166, 'c1b4703829a34a91b7af8e089a1f8549', '九制话梅', '5颗');
INSERT INTO `menu_food` VALUES (167, 'c1b4703829a34a91b7af8e089a1f8549', '干辣椒', '2支');
INSERT INTO `menu_food` VALUES (168, 'c1b4703829a34a91b7af8e089a1f8549', '大蒜', '3瓣');
INSERT INTO `menu_food` VALUES (169, '032d9f1e7dd64cc1b3af8df456659550', '辣花生', '500克');
INSERT INTO `menu_food` VALUES (170, '032d9f1e7dd64cc1b3af8df456659550', '黑芝麻', '150克');
INSERT INTO `menu_food` VALUES (171, '032d9f1e7dd64cc1b3af8df456659550', '白芝麻', '150克');
INSERT INTO `menu_food` VALUES (172, '032d9f1e7dd64cc1b3af8df456659550', '白糖', '适量');
INSERT INTO `menu_food` VALUES (173, '80a09b188ba845039696964cb03d218b', '老姜', '50克');
INSERT INTO `menu_food` VALUES (174, '80a09b188ba845039696964cb03d218b', '全脂奶粉', '50克');
INSERT INTO `menu_food` VALUES (175, '80a09b188ba845039696964cb03d218b', '冰糖', '10克');
INSERT INTO `menu_food` VALUES (176, 'f30b83378f924b1db4705d22dc21af2b', '鸡蛋', '2个');
INSERT INTO `menu_food` VALUES (177, 'f30b83378f924b1db4705d22dc21af2b', '豆腐', '150克');
INSERT INTO `menu_food` VALUES (178, 'f30b83378f924b1db4705d22dc21af2b', '虾皮', '30克');
INSERT INTO `menu_food` VALUES (179, 'f30b83378f924b1db4705d22dc21af2b', '小葱', '2根');
INSERT INTO `menu_food` VALUES (180, 'f30b83378f924b1db4705d22dc21af2b', '植物油', '20ML');
INSERT INTO `menu_food` VALUES (181, 'f30b83378f924b1db4705d22dc21af2b', '盐', '少量');
INSERT INTO `menu_food` VALUES (182, 'f30b83378f924b1db4705d22dc21af2b', '白胡椒粉', '少量');
INSERT INTO `menu_food` VALUES (183, '156c052ca5584994bb84562ed48e18ff', '香茅', '3根');
INSERT INTO `menu_food` VALUES (184, '156c052ca5584994bb84562ed48e18ff', '柠檬', '3片');
INSERT INTO `menu_food` VALUES (185, '156c052ca5584994bb84562ed48e18ff', '鱼露', '1勺');
INSERT INTO `menu_food` VALUES (186, '156c052ca5584994bb84562ed48e18ff', '椰浆', '65克');
INSERT INTO `menu_food` VALUES (187, '156c052ca5584994bb84562ed48e18ff', '青柠', '1个');
INSERT INTO `menu_food` VALUES (188, '156c052ca5584994bb84562ed48e18ff', '虾', '10只');
INSERT INTO `menu_food` VALUES (189, '156c052ca5584994bb84562ed48e18ff', '香菜', '1根');
INSERT INTO `menu_food` VALUES (190, '156c052ca5584994bb84562ed48e18ff', '香料', '适量');
INSERT INTO `menu_food` VALUES (191, '156c052ca5584994bb84562ed48e18ff', '指天椒', '	干2根鲜2根');
INSERT INTO `menu_food` VALUES (192, '156c052ca5584994bb84562ed48e18ff', '泰式虾酱', '2小盒');
INSERT INTO `menu_food` VALUES (193, '156c052ca5584994bb84562ed48e18ff', '花甲', '1斤');
INSERT INTO `menu_food` VALUES (194, '156c052ca5584994bb84562ed48e18ff', '土豆', '半个');
INSERT INTO `menu_food` VALUES (195, '156c052ca5584994bb84562ed48e18ff', '金针菇', '150克');
INSERT INTO `menu_food` VALUES (196, '156c052ca5584994bb84562ed48e18ff', '炼乳', '6克');
INSERT INTO `menu_food` VALUES (197, 'db4c21e2787a4c0f9e6c6db53d7678a2', '肥肠', '500克');
INSERT INTO `menu_food` VALUES (198, 'db4c21e2787a4c0f9e6c6db53d7678a2', '洋葱', '50克');
INSERT INTO `menu_food` VALUES (199, 'db4c21e2787a4c0f9e6c6db53d7678a2', '青椒', '50克');
INSERT INTO `menu_food` VALUES (200, 'db4c21e2787a4c0f9e6c6db53d7678a2', '蒜', '20克');
INSERT INTO `menu_food` VALUES (201, 'db4c21e2787a4c0f9e6c6db53d7678a2', '香菜', '10克');
INSERT INTO `menu_food` VALUES (202, 'db4c21e2787a4c0f9e6c6db53d7678a2', '红辣椒', '5克');
INSERT INTO `menu_food` VALUES (203, 'db4c21e2787a4c0f9e6c6db53d7678a2', '芝麻', '适量');
INSERT INTO `menu_food` VALUES (204, 'db4c21e2787a4c0f9e6c6db53d7678a2', '油', '0.5勺');
INSERT INTO `menu_food` VALUES (205, 'db4c21e2787a4c0f9e6c6db53d7678a2', '一品鲜酱油', '1勺');
INSERT INTO `menu_food` VALUES (206, 'db4c21e2787a4c0f9e6c6db53d7678a2', '蚝油', '1勺');
INSERT INTO `menu_food` VALUES (207, 'db4c21e2787a4c0f9e6c6db53d7678a2', '糖', '1勺');
INSERT INTO `menu_food` VALUES (208, 'db4c21e2787a4c0f9e6c6db53d7678a2', '盐', '1匙');
INSERT INTO `menu_food` VALUES (209, 'db4c21e2787a4c0f9e6c6db53d7678a2', '味精', '0.2匙');
INSERT INTO `menu_food` VALUES (210, 'db4c21e2787a4c0f9e6c6db53d7678a2', '花椒', '3克');
INSERT INTO `menu_food` VALUES (211, 'db4c21e2787a4c0f9e6c6db53d7678a2', '大料', '3克');
INSERT INTO `menu_food` VALUES (212, '683438c94bc945de9d4297b1cca20730', '韭菜', '半斤');
INSERT INTO `menu_food` VALUES (213, '683438c94bc945de9d4297b1cca20730', '鸡蛋', '4个');
INSERT INTO `menu_food` VALUES (214, '683438c94bc945de9d4297b1cca20730', '虾仁', '4两');
INSERT INTO `menu_food` VALUES (215, '683438c94bc945de9d4297b1cca20730', '面粉', '7两');
INSERT INTO `menu_food` VALUES (216, '683438c94bc945de9d4297b1cca20730', '猪肉', '4两');
INSERT INTO `menu_food` VALUES (217, '683438c94bc945de9d4297b1cca20730', '生抽', '	2汤勺');
INSERT INTO `menu_food` VALUES (218, '683438c94bc945de9d4297b1cca20730', '盐', '适量');
INSERT INTO `menu_food` VALUES (219, '683438c94bc945de9d4297b1cca20730', '香油', '适量');
INSERT INTO `menu_food` VALUES (220, '683438c94bc945de9d4297b1cca20730', '胡椒粉', '少许');
INSERT INTO `menu_food` VALUES (221, '683438c94bc945de9d4297b1cca20730', '白糖', '少许');
INSERT INTO `menu_food` VALUES (222, 'baa13029841947f3b27e0d003cb443a3', '排骨', '200克');
INSERT INTO `menu_food` VALUES (223, 'baa13029841947f3b27e0d003cb443a3', '土豆', '1个');
INSERT INTO `menu_food` VALUES (224, 'baa13029841947f3b27e0d003cb443a3', '姜', '6片');
INSERT INTO `menu_food` VALUES (225, 'baa13029841947f3b27e0d003cb443a3', '蒜', '1瓣');
INSERT INTO `menu_food` VALUES (226, 'baa13029841947f3b27e0d003cb443a3', '葱', '适量');
INSERT INTO `menu_food` VALUES (227, 'baa13029841947f3b27e0d003cb443a3', '花椒', '适量');
INSERT INTO `menu_food` VALUES (228, 'baa13029841947f3b27e0d003cb443a3', '八角', '适量');
INSERT INTO `menu_food` VALUES (229, 'baa13029841947f3b27e0d003cb443a3', '香叶', '适量');
INSERT INTO `menu_food` VALUES (230, 'baa13029841947f3b27e0d003cb443a3', '生抽', '适量');
INSERT INTO `menu_food` VALUES (231, 'baa13029841947f3b27e0d003cb443a3', '料酒', '适量');
INSERT INTO `menu_food` VALUES (232, 'baa13029841947f3b27e0d003cb443a3', '冰糖', '适量');
INSERT INTO `menu_food` VALUES (233, 'baa13029841947f3b27e0d003cb443a3', '豆瓣酱', '一勺');
INSERT INTO `menu_food` VALUES (234, 'baa13029841947f3b27e0d003cb443a3', '料酒', '适量');
INSERT INTO `menu_food` VALUES (235, 'baa13029841947f3b27e0d003cb443a3', '干辣椒', '适量');
INSERT INTO `menu_food` VALUES (236, 'a7fb8e6391f244c09f23ab724eb18cc1', '鸡腿', '4只');
INSERT INTO `menu_food` VALUES (237, 'a7fb8e6391f244c09f23ab724eb18cc1', '香葱', '3-4根');
INSERT INTO `menu_food` VALUES (238, 'a7fb8e6391f244c09f23ab724eb18cc1', '蒜', '9-10瓣');
INSERT INTO `menu_food` VALUES (239, 'a7fb8e6391f244c09f23ab724eb18cc1', '料酒', '	2大勺');
INSERT INTO `menu_food` VALUES (240, 'a7fb8e6391f244c09f23ab724eb18cc1', '生抽', '2勺');
INSERT INTO `menu_food` VALUES (241, 'a7fb8e6391f244c09f23ab724eb18cc1', '醋', '3勺');
INSERT INTO `menu_food` VALUES (242, 'a7fb8e6391f244c09f23ab724eb18cc1', '糖', '1勺');
INSERT INTO `menu_food` VALUES (243, 'a7fb8e6391f244c09f23ab724eb18cc1', '花椒油', '勺1');
INSERT INTO `menu_food` VALUES (244, 'a7fb8e6391f244c09f23ab724eb18cc1', '盐', '少许');
INSERT INTO `menu_food` VALUES (245, 'a7fb8e6391f244c09f23ab724eb18cc1', '小红椒', '');
INSERT INTO `menu_food` VALUES (246, 'a7fb8e6391f244c09f23ab724eb18cc1', '辣椒油', '	1勺');
INSERT INTO `menu_food` VALUES (247, 'a7fb8e6391f244c09f23ab724eb18cc1', '香油', '1勺');
INSERT INTO `menu_food` VALUES (248, '06a449db80ad4a999a9c3b60b2faab01', '豌豆', '300克');
INSERT INTO `menu_food` VALUES (249, '06a449db80ad4a999a9c3b60b2faab01', '肉泥', '100克');
INSERT INTO `menu_food` VALUES (250, '06a449db80ad4a999a9c3b60b2faab01', '酸菜、香菇、小米辣、大蒜子', '少许');
INSERT INTO `menu_food` VALUES (251, '06a449db80ad4a999a9c3b60b2faab01', '盐', '5克');
INSERT INTO `menu_food` VALUES (252, '06a449db80ad4a999a9c3b60b2faab01', '蒸鱼豉油、麻油', '5毫升');
INSERT INTO `menu_food` VALUES (253, '06a449db80ad4a999a9c3b60b2faab01', '油', '10克');
INSERT INTO `menu_food` VALUES (254, '06a449db80ad4a999a9c3b60b2faab01', '陈醋', '2毫升');
INSERT INTO `menu_food` VALUES (255, 'fb9c9a26f6a448bb91d42b840d076d27', '陈克明华夏一面原味挂面', '1份');
INSERT INTO `menu_food` VALUES (256, 'fb9c9a26f6a448bb91d42b840d076d27', '鸡蛋', '	1个');
INSERT INTO `menu_food` VALUES (257, 'fb9c9a26f6a448bb91d42b840d076d27', '马苏里拉芝士', '适量');
INSERT INTO `menu_food` VALUES (258, 'fb9c9a26f6a448bb91d42b840d076d27', '披萨酱', '2勺');
INSERT INTO `menu_food` VALUES (259, 'fb9c9a26f6a448bb91d42b840d076d27', '虾仁', '10只');
INSERT INTO `menu_food` VALUES (260, 'fb9c9a26f6a448bb91d42b840d076d27', '彩蔬', '适量');
INSERT INTO `menu_food` VALUES (261, 'fb9c9a26f6a448bb91d42b840d076d27', '火腿肠', '一根');
INSERT INTO `menu_food` VALUES (262, 'fb9c9a26f6a448bb91d42b840d076d27', '披萨香草', '少许');
INSERT INTO `menu_food` VALUES (263, 'fb9c9a26f6a448bb91d42b840d076d27', '黑胡椒粉', '2克');
INSERT INTO `menu_food` VALUES (264, 'fb9c9a26f6a448bb91d42b840d076d27', '食用盐', '2克');
INSERT INTO `menu_food` VALUES (265, '6d0513e76e344e68911cbd7acb87669b', '三岛照烧汁', '三勺');
INSERT INTO `menu_food` VALUES (266, '6d0513e76e344e68911cbd7acb87669b', '中豆腐', '一块');
INSERT INTO `menu_food` VALUES (267, '6d0513e76e344e68911cbd7acb87669b', '白芝麻', '小半茶匙');
INSERT INTO `menu_food` VALUES (268, '6d0513e76e344e68911cbd7acb87669b', '香葱', '一根点缀用');
INSERT INTO `menu_food` VALUES (269, '6d0513e76e344e68911cbd7acb87669b', '清水', '半碗');
INSERT INTO `menu_food` VALUES (270, '2c107b88df964d0fb3b12067ad959924', '日本豆腐', '3-4条');
INSERT INTO `menu_food` VALUES (271, '2c107b88df964d0fb3b12067ad959924', '洋葱', '小半个');
INSERT INTO `menu_food` VALUES (272, '2c107b88df964d0fb3b12067ad959924', '红辣椒', '半个');
INSERT INTO `menu_food` VALUES (273, '2c107b88df964d0fb3b12067ad959924', '香菇', '1个');
INSERT INTO `menu_food` VALUES (274, '2c107b88df964d0fb3b12067ad959924', '大蒜', '4瓣');
INSERT INTO `menu_food` VALUES (275, '2c107b88df964d0fb3b12067ad959924', '葱', '2根');
INSERT INTO `menu_food` VALUES (276, '2c107b88df964d0fb3b12067ad959924', '淀粉', '适量');
INSERT INTO `menu_food` VALUES (277, '2c107b88df964d0fb3b12067ad959924', '生抽', '1汤勺');
INSERT INTO `menu_food` VALUES (278, '2c107b88df964d0fb3b12067ad959924', '啤酒', '2汤勺');
INSERT INTO `menu_food` VALUES (279, '2c107b88df964d0fb3b12067ad959924', '蚝油', '半汤勺');
INSERT INTO `menu_food` VALUES (280, '2c107b88df964d0fb3b12067ad959924', '白糖', '小半勺');
INSERT INTO `menu_food` VALUES (281, '2c107b88df964d0fb3b12067ad959924', '白胡椒粉', '1小勺');
INSERT INTO `menu_food` VALUES (282, '2c107b88df964d0fb3b12067ad959924', '盐', '适量');
INSERT INTO `menu_food` VALUES (283, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '新鲜鲈鱼', '1条');
INSERT INTO `menu_food` VALUES (284, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '蒸鱼鼓油(或味极鲜酱油）', '2汤匙');
INSERT INTO `menu_food` VALUES (285, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '食用油', '	2汤匙');
INSERT INTO `menu_food` VALUES (286, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '生姜', '1块');
INSERT INTO `menu_food` VALUES (287, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '葱', '2根');
INSERT INTO `menu_food` VALUES (288, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '盐', '少许');
INSERT INTO `menu_food` VALUES (289, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '料酒', '少许');
INSERT INTO `menu_food` VALUES (290, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '小鱿鱼', '500克（大概5只）一定要新鲜的，泡发的不行');
INSERT INTO `menu_food` VALUES (291, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '大葱', '半根');
INSERT INTO `menu_food` VALUES (292, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '青椒', '2根 不吃辣一根');
INSERT INTO `menu_food` VALUES (293, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '红椒', '2根 同上');
INSERT INTO `menu_food` VALUES (294, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '姜', '一块');
INSERT INTO `menu_food` VALUES (295, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '蒜', '3-4瓣');
INSERT INTO `menu_food` VALUES (296, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '盐', '2克');
INSERT INTO `menu_food` VALUES (297, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '糖', '2克');
INSERT INTO `menu_food` VALUES (298, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '生抽', '20毫升');
INSERT INTO `menu_food` VALUES (299, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '孜然粉', '3克');
INSERT INTO `menu_food` VALUES (300, 'd81329e6c383451699d856a1f71d25b2', '中筋面粉', '300克');
INSERT INTO `menu_food` VALUES (301, 'd81329e6c383451699d856a1f71d25b2', '水', '170克');
INSERT INTO `menu_food` VALUES (302, 'd81329e6c383451699d856a1f71d25b2', '酵母粉', '2克');
INSERT INTO `menu_food` VALUES (303, 'd81329e6c383451699d856a1f71d25b2', '盐', '2克');
INSERT INTO `menu_food` VALUES (304, 'd81329e6c383451699d856a1f71d25b2', '糖', '2克');
INSERT INTO `menu_food` VALUES (305, 'd81329e6c383451699d856a1f71d25b2', '猪肉', '200克');
INSERT INTO `menu_food` VALUES (306, 'd81329e6c383451699d856a1f71d25b2', '紫菜', '20克');
INSERT INTO `menu_food` VALUES (307, 'd81329e6c383451699d856a1f71d25b2', '胡萝卜', '小半个 个');
INSERT INTO `menu_food` VALUES (308, 'd81329e6c383451699d856a1f71d25b2', '葱花', '适量');
INSERT INTO `menu_food` VALUES (309, 'd81329e6c383451699d856a1f71d25b2', '料酒，生抽，盐，味精，胡椒粉', '适量');
INSERT INTO `menu_food` VALUES (310, '699452b7d68942a2a0e4aee592b79e1e', '\r\n鸡腿', '2只');
INSERT INTO `menu_food` VALUES (311, '699452b7d68942a2a0e4aee592b79e1e', '洋葱 蒜末 生抽 酱油 番茄酱 料酒 蚝油 黑白胡椒 盐 孜然 辣椒粉', '适量');
INSERT INTO `menu_food` VALUES (312, '699452b7d68942a2a0e4aee592b79e1e', '土豆', '适量 切滚刀块');
INSERT INTO `menu_food` VALUES (313, 'addea5aaa26f470c90dcf8b164f24a22', '鸡胸', '2整块，切1厘米见方的小块');
INSERT INTO `menu_food` VALUES (314, 'addea5aaa26f470c90dcf8b164f24a22', '海盐', '1/4小勺');
INSERT INTO `menu_food` VALUES (315, 'addea5aaa26f470c90dcf8b164f24a22', '黑胡椒', '1/2小勺');
INSERT INTO `menu_food` VALUES (316, 'addea5aaa26f470c90dcf8b164f24a22', '胡萝卜', '2小根，切滚刀小块');
INSERT INTO `menu_food` VALUES (317, 'addea5aaa26f470c90dcf8b164f24a22', '土豆', '1个，切小块');
INSERT INTO `menu_food` VALUES (318, 'addea5aaa26f470c90dcf8b164f24a22', '紫洋葱', '半个，切丝');
INSERT INTO `menu_food` VALUES (319, 'addea5aaa26f470c90dcf8b164f24a22', '红辣椒（选用）', '1-2小根或看个人喜辣程度，切段');
INSERT INTO `menu_food` VALUES (320, 'addea5aaa26f470c90dcf8b164f24a22', '口蘑或香菇', '4-6个，切小块或片');
INSERT INTO `menu_food` VALUES (321, 'addea5aaa26f470c90dcf8b164f24a22', '蒜', '3大瓣，切片');
INSERT INTO `menu_food` VALUES (322, 'addea5aaa26f470c90dcf8b164f24a22', '酱油', '1-3大勺');
INSERT INTO `menu_food` VALUES (323, 'addea5aaa26f470c90dcf8b164f24a22', '味霖或米酒+红糖', '2大勺');
INSERT INTO `menu_food` VALUES (324, 'addea5aaa26f470c90dcf8b164f24a22', '鱼露', '几滴');
INSERT INTO `menu_food` VALUES (325, 'addea5aaa26f470c90dcf8b164f24a22', '韩式辣酱', '1大勺或看个人喜辣程度添加');
INSERT INTO `menu_food` VALUES (326, 'addea5aaa26f470c90dcf8b164f24a22', '蜂蜜或黑糖姜', '2大勺');
INSERT INTO `menu_food` VALUES (327, 'addea5aaa26f470c90dcf8b164f24a22', '鲜姜末', '1小勺');
INSERT INTO `menu_food` VALUES (328, 'addea5aaa26f470c90dcf8b164f24a22', '香油', '1-2小勺');
INSERT INTO `menu_food` VALUES (329, 'addea5aaa26f470c90dcf8b164f24a22', '小葱', '1根，切小段');
INSERT INTO `menu_food` VALUES (330, 'addea5aaa26f470c90dcf8b164f24a22', '白芝麻', '一小把');
INSERT INTO `menu_food` VALUES (331, 'addea5aaa26f470c90dcf8b164f24a22', '红薯粉或干丝', '适量');
INSERT INTO `menu_food` VALUES (332, 'd613d080aed84a96be974e9f7cabcdc7', '鸡胸肉', '1块');
INSERT INTO `menu_food` VALUES (333, 'd613d080aed84a96be974e9f7cabcdc7', '盐', '适量');
INSERT INTO `menu_food` VALUES (334, 'd613d080aed84a96be974e9f7cabcdc7', '料酒', '适量');
INSERT INTO `menu_food` VALUES (335, 'd613d080aed84a96be974e9f7cabcdc7', '鸡蛋', '1个');
INSERT INTO `menu_food` VALUES (336, 'd613d080aed84a96be974e9f7cabcdc7', '淀粉', '适量\r\n');
INSERT INTO `menu_food` VALUES (337, 'd613d080aed84a96be974e9f7cabcdc7', '番茄酱', '适量\r\n');
INSERT INTO `menu_food` VALUES (338, 'd613d080aed84a96be974e9f7cabcdc7', '白砂糖', '适量\r\n');
INSERT INTO `menu_food` VALUES (339, 'd613d080aed84a96be974e9f7cabcdc7', '白醋', '适量\r\n');
INSERT INTO `menu_food` VALUES (340, '5c229206192f46938049a0e10ff5b718', '豆角', NULL);
INSERT INTO `menu_food` VALUES (341, '5c229206192f46938049a0e10ff5b718', '手擀面', NULL);
INSERT INTO `menu_food` VALUES (342, '5c229206192f46938049a0e10ff5b718', '盐', NULL);
INSERT INTO `menu_food` VALUES (343, '5c229206192f46938049a0e10ff5b718', '生抽', NULL);
INSERT INTO `menu_food` VALUES (344, '5c229206192f46938049a0e10ff5b718', '老抽', NULL);
INSERT INTO `menu_food` VALUES (345, '5c229206192f46938049a0e10ff5b718', '糖', NULL);
INSERT INTO `menu_food` VALUES (346, '5c229206192f46938049a0e10ff5b718', '五花肉', NULL);
INSERT INTO `menu_food` VALUES (347, '84e184c0a4e14416bb92d826233fd816', '冰鲜鸡爪', '2斤');
INSERT INTO `menu_food` VALUES (348, '84e184c0a4e14416bb92d826233fd816', '紫洋葱', '半个');
INSERT INTO `menu_food` VALUES (349, '84e184c0a4e14416bb92d826233fd816', '黄柠檬', '1.5个');
INSERT INTO `menu_food` VALUES (350, '84e184c0a4e14416bb92d826233fd816', '香菜(芫茜)', '1~2棵');
INSERT INTO `menu_food` VALUES (351, '84e184c0a4e14416bb92d826233fd816', '六必居料酒', '1汤匙');
INSERT INTO `menu_food` VALUES (352, '84e184c0a4e14416bb92d826233fd816', '小葱', '1棵');
INSERT INTO `menu_food` VALUES (353, '84e184c0a4e14416bb92d826233fd816', '姜', '2片');
INSERT INTO `menu_food` VALUES (354, '84e184c0a4e14416bb92d826233fd816', '百香果', '6个(大)');
INSERT INTO `menu_food` VALUES (355, '84e184c0a4e14416bb92d826233fd816', '小米椒', '3~6个(喜辣放10个)');
INSERT INTO `menu_food` VALUES (356, '84e184c0a4e14416bb92d826233fd816', '姜', '2片');
INSERT INTO `menu_food` VALUES (357, '84e184c0a4e14416bb92d826233fd816', '蒜', '1头');
INSERT INTO `menu_food` VALUES (358, '84e184c0a4e14416bb92d826233fd816', '盐', '1汤匙(生抽偏咸可少放)');
INSERT INTO `menu_food` VALUES (359, '84e184c0a4e14416bb92d826233fd816', '糖', '1~2汤匙');
INSERT INTO `menu_food` VALUES (360, '84e184c0a4e14416bb92d826233fd816', '润之家芝麻油', '半碗');
INSERT INTO `menu_food` VALUES (361, '84e184c0a4e14416bb92d826233fd816', '厨邦味极鲜生抽', '1/3碗');
INSERT INTO `menu_food` VALUES (362, '84e184c0a4e14416bb92d826233fd816', '鸡精、胡椒粉', '适量');
INSERT INTO `menu_food` VALUES (363, '32b09d7ffb5247eda0d37b5d521423a1', '五花肉', '1000克');
INSERT INTO `menu_food` VALUES (364, '32b09d7ffb5247eda0d37b5d521423a1', '鸡蛋', NULL);
INSERT INTO `menu_food` VALUES (365, '32b09d7ffb5247eda0d37b5d521423a1', '干香菇', '15朵');
INSERT INTO `menu_food` VALUES (366, '32b09d7ffb5247eda0d37b5d521423a1', '红葱酥', '60克');
INSERT INTO `menu_food` VALUES (367, '32b09d7ffb5247eda0d37b5d521423a1', '姜', '2片');
INSERT INTO `menu_food` VALUES (368, '32b09d7ffb5247eda0d37b5d521423a1', '八角', '2个');
INSERT INTO `menu_food` VALUES (369, '32b09d7ffb5247eda0d37b5d521423a1', '桂皮', '1块');
INSERT INTO `menu_food` VALUES (370, '32b09d7ffb5247eda0d37b5d521423a1', '香叶', '2片');
INSERT INTO `menu_food` VALUES (371, '32b09d7ffb5247eda0d37b5d521423a1', '干柠檬皮碎', '2-3克');
INSERT INTO `menu_food` VALUES (372, '32b09d7ffb5247eda0d37b5d521423a1', '金蘭酱油', '4汤勺');
INSERT INTO `menu_food` VALUES (373, '32b09d7ffb5247eda0d37b5d521423a1', '金蘭油膏', '5汤勺');
INSERT INTO `menu_food` VALUES (374, '32b09d7ffb5247eda0d37b5d521423a1', '红豆腐乳', '2-3块');
INSERT INTO `menu_food` VALUES (375, '32b09d7ffb5247eda0d37b5d521423a1', '绍兴花雕酒', '小半碗');
INSERT INTO `menu_food` VALUES (376, '32b09d7ffb5247eda0d37b5d521423a1', '酒酿汁或冰糖', '小半碗或几小块');
INSERT INTO `menu_food` VALUES (377, '32b09d7ffb5247eda0d37b5d521423a1', '黑胡椒碎', '少许');
INSERT INTO `menu_food` VALUES (378, '32b09d7ffb5247eda0d37b5d521423a1', '盐', '适量');
INSERT INTO `menu_food` VALUES (379, '70460d48ec754d4287711710ae46921c', '嫩姜', '4块');
INSERT INTO `menu_food` VALUES (380, '70460d48ec754d4287711710ae46921c', '肉丝', '100g');
INSERT INTO `menu_food` VALUES (381, '70460d48ec754d4287711710ae46921c', '青红椒', '各2只');
INSERT INTO `menu_food` VALUES (382, '70460d48ec754d4287711710ae46921c', '盐', NULL);
INSERT INTO `menu_food` VALUES (383, '70460d48ec754d4287711710ae46921c', '生抽', NULL);
INSERT INTO `menu_food` VALUES (384, '70460d48ec754d4287711710ae46921c', '黄酒', NULL);
INSERT INTO `menu_food` VALUES (385, '6fab45e6fbdd477d9cadbfbee4ab7950', '嫩鸡', '1/2只');
INSERT INTO `menu_food` VALUES (386, '6fab45e6fbdd477d9cadbfbee4ab7950', '姜末', '1小勺');
INSERT INTO `menu_food` VALUES (387, '6fab45e6fbdd477d9cadbfbee4ab7950', '蒜末', '1小勺');
INSERT INTO `menu_food` VALUES (388, '6fab45e6fbdd477d9cadbfbee4ab7950', '红尖椒', '1-2个');
INSERT INTO `menu_food` VALUES (389, '6fab45e6fbdd477d9cadbfbee4ab7950', '腐乳', '1-2块');
INSERT INTO `menu_food` VALUES (390, '6fab45e6fbdd477d9cadbfbee4ab7950', '生抽', '1勺');
INSERT INTO `menu_food` VALUES (391, '6fab45e6fbdd477d9cadbfbee4ab7950', '老抽', '1/4小勺');
INSERT INTO `menu_food` VALUES (392, '6fab45e6fbdd477d9cadbfbee4ab7950', '糖', '1小勺');
INSERT INTO `menu_food` VALUES (393, '6fab45e6fbdd477d9cadbfbee4ab7950', '黄酒', '1勺');
INSERT INTO `menu_food` VALUES (394, '6fab45e6fbdd477d9cadbfbee4ab7950', '麻油', '少许');
INSERT INTO `menu_food` VALUES (395, '6fab45e6fbdd477d9cadbfbee4ab7950', '胡椒粉', '少许');
INSERT INTO `menu_food` VALUES (397, '05347f08072f46e783ce9efc3c7e9d3b', '普通面粉', '300克');
INSERT INTO `menu_food` VALUES (398, '05347f08072f46e783ce9efc3c7e9d3b', '韭菜', '半斤');
INSERT INTO `menu_food` VALUES (399, '05347f08072f46e783ce9efc3c7e9d3b', '鸡蛋', '3个');
INSERT INTO `menu_food` VALUES (400, '05347f08072f46e783ce9efc3c7e9d3b', '粉丝', '1小把');
INSERT INTO `menu_food` VALUES (401, '05347f08072f46e783ce9efc3c7e9d3b', '香油', '1汤匙');
INSERT INTO `menu_food` VALUES (402, '05347f08072f46e783ce9efc3c7e9d3b', '盐', '适量');
INSERT INTO `menu_food` VALUES (403, '05347f08072f46e783ce9efc3c7e9d3b', '植物油', '适量');
INSERT INTO `menu_food` VALUES (425, '833688f5f7f64b0cbf7809d5357f6f2e', '小龙虾', '3斤');
INSERT INTO `menu_food` VALUES (426, '833688f5f7f64b0cbf7809d5357f6f2e', '大蒜头', '5只');
INSERT INTO `menu_food` VALUES (427, '833688f5f7f64b0cbf7809d5357f6f2e', '啤酒', '1易拉罐');
INSERT INTO `menu_food` VALUES (428, '833688f5f7f64b0cbf7809d5357f6f2e', '红辣椒', '2只');
INSERT INTO `menu_food` VALUES (429, '833688f5f7f64b0cbf7809d5357f6f2e', '姜，葱，八角', '适量');
INSERT INTO `menu_food` VALUES (430, '833688f5f7f64b0cbf7809d5357f6f2e', '白糖', '2-3小勺');
INSERT INTO `menu_food` VALUES (431, '833688f5f7f64b0cbf7809d5357f6f2e', '盐，生抽酱油', '适量');
INSERT INTO `menu_food` VALUES (432, 'b36ffdff96264f53be7285e18cf699ef', '瘦肉', '300克');
INSERT INTO `menu_food` VALUES (433, 'b36ffdff96264f53be7285e18cf699ef', '青椒', '1个');
INSERT INTO `menu_food` VALUES (434, 'b36ffdff96264f53be7285e18cf699ef', '胡萝卜', '半根');
INSERT INTO `menu_food` VALUES (435, 'b36ffdff96264f53be7285e18cf699ef', '木耳', '10朵');
INSERT INTO `menu_food` VALUES (436, 'b36ffdff96264f53be7285e18cf699ef', '郫县豆瓣酱', '2勺');
INSERT INTO `menu_food` VALUES (437, 'b36ffdff96264f53be7285e18cf699ef', '香醋', '2-少许');
INSERT INTO `menu_food` VALUES (438, 'b36ffdff96264f53be7285e18cf699ef', '酱油或生抽', '少许');
INSERT INTO `menu_food` VALUES (439, 'b36ffdff96264f53be7285e18cf699ef', '白糖', '适量');
INSERT INTO `menu_food` VALUES (440, 'b36ffdff96264f53be7285e18cf699ef', '味精', '适量');
INSERT INTO `menu_food` VALUES (441, 'b36ffdff96264f53be7285e18cf699ef', '淀粉（肉丝用）', '适量');
INSERT INTO `menu_food` VALUES (442, 'b36ffdff96264f53be7285e18cf699ef', '水淀粉', '适量');
INSERT INTO `menu_food` VALUES (443, 'f40bbb0165b84a5e9899e77e92777ecf', '皖鱼或者黑鱼', '');
INSERT INTO `menu_food` VALUES (444, 'f40bbb0165b84a5e9899e77e92777ecf', '柠檬', '半个');
INSERT INTO `menu_food` VALUES (445, 'f40bbb0165b84a5e9899e77e92777ecf', '小辣椒，姜片，蒜，葱丝', '适量');
INSERT INTO `menu_food` VALUES (446, 'f40bbb0165b84a5e9899e77e92777ecf', '鱼露，料酒，盐，胡椒', '适量');
INSERT INTO `menu_food` VALUES (447, 'faf83bb0232f48548e478314ddf75542', '鸡腿', '四个');
INSERT INTO `menu_food` VALUES (448, 'faf83bb0232f48548e478314ddf75542', '姜', '三片');
INSERT INTO `menu_food` VALUES (449, 'faf83bb0232f48548e478314ddf75542', '生抽', '两汤匙');
INSERT INTO `menu_food` VALUES (450, 'faf83bb0232f48548e478314ddf75542', '米醋', '一汤匙');
INSERT INTO `menu_food` VALUES (451, 'faf83bb0232f48548e478314ddf75542', '白糖', '半汤匙');
INSERT INTO `menu_food` VALUES (452, 'faf83bb0232f48548e478314ddf75542', '料酒', '半汤匙');
INSERT INTO `menu_food` VALUES (453, 'faf83bb0232f48548e478314ddf75542', '盐', '一点点');
INSERT INTO `menu_food` VALUES (454, 'faf83bb0232f48548e478314ddf75542', '蒜泥', '（一粒蒜头的量）');
INSERT INTO `menu_food` VALUES (455, 'faf83bb0232f48548e478314ddf75542', '芝麻油', '一小勺');
INSERT INTO `menu_food` VALUES (456, 'f78570a328e64ca6924c260bd92b84a6', '茄子', '3个');
INSERT INTO `menu_food` VALUES (457, 'f78570a328e64ca6924c260bd92b84a6', '肉末', '250克');
INSERT INTO `menu_food` VALUES (458, 'f78570a328e64ca6924c260bd92b84a6', '蒜', '蒜末半颗');
INSERT INTO `menu_food` VALUES (459, 'f78570a328e64ca6924c260bd92b84a6', '开水', '适量');
INSERT INTO `menu_food` VALUES (460, 'f78570a328e64ca6924c260bd92b84a6', '老抽', '少量');
INSERT INTO `menu_food` VALUES (461, 'f78570a328e64ca6924c260bd92b84a6', '冰糖', '少量');
INSERT INTO `menu_food` VALUES (462, 'f78570a328e64ca6924c260bd92b84a6', '红糖', '少量');
INSERT INTO `menu_food` VALUES (463, 'f78570a328e64ca6924c260bd92b84a6', '葱', '多一些葱白');
INSERT INTO `menu_food` VALUES (464, 'f78570a328e64ca6924c260bd92b84a6', '海天味极鲜酱油', '适量');
INSERT INTO `menu_food` VALUES (465, 'f78570a328e64ca6924c260bd92b84a6', '啤酒', '适量');
INSERT INTO `menu_food` VALUES (466, 'f78570a328e64ca6924c260bd92b84a6', '盐', '少量');
INSERT INTO `menu_food` VALUES (467, '943f7f4d1f204758893a64c59e2d0178', '鸡琵琶腿', '8个');
INSERT INTO `menu_food` VALUES (468, '943f7f4d1f204758893a64c59e2d0178', '蚝油', '20g');
INSERT INTO `menu_food` VALUES (469, '943f7f4d1f204758893a64c59e2d0178', '生抽', '30ml');
INSERT INTO `menu_food` VALUES (470, '943f7f4d1f204758893a64c59e2d0178', '姜', '5-6片');
INSERT INTO `menu_food` VALUES (471, '943f7f4d1f204758893a64c59e2d0178', '蒜', '4瓣');
INSERT INTO `menu_food` VALUES (472, '943f7f4d1f204758893a64c59e2d0178', '盐', '5g');
INSERT INTO `menu_food` VALUES (473, '943f7f4d1f204758893a64c59e2d0178', '花椒', '2g');
INSERT INTO `menu_food` VALUES (474, '943f7f4d1f204758893a64c59e2d0178', '面粉', '200g');
INSERT INTO `menu_food` VALUES (475, '943f7f4d1f204758893a64c59e2d0178', '水', '500ml');
INSERT INTO `menu_food` VALUES (476, '943f7f4d1f204758893a64c59e2d0178', '油', '半锅');

-- ----------------------------
-- Table structure for menu_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_info`;
CREATE TABLE `menu_info`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编码',
  `p_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单父编码',
  `p_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `is_menu` int(11) NULL DEFAULT NULL COMMENT '是否是菜单',
  `level` int(11) NULL DEFAULT NULL COMMENT '菜单层级',
  `sort` int(11) NULL DEFAULT NULL COMMENT '菜单排序',
  `status` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `FK_CODE`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_info
-- ----------------------------
INSERT INTO `menu_info` VALUES ('000000000000000000', 'root', '0', '0', '系统根目录', '', 1, 0, 1, 1, NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('893287144657780736', 'system', 'root', '000000000000000000', '系统设置', 'system', 1, 1, 10, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('893288715881807872', 'userList', 'system', '893287144657780736', '用户管理', 'user/list', 1, 2, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('893304960282787840', 'user/add', 'userList', '893288715881807872', '用户添加', 'user/add', 0, 3, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894396523532517376', 'user/edit', 'userList', '893288715881807872', '用户修改', 'user/edit', 0, 3, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894473486712438784', 'user/view', 'userList', '893288715881807872', '用户查看', 'user/View', 0, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894473651837992960', 'user/delete', 'userList', '893288715881807872', '用户删除', 'user/delete', 0, 3, 4, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894475142061621248', 'roleList', 'system', '893287144657780736', '角色管理', 'role/list', 1, 2, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894475827880656896', 'role/add', 'roleList', '894475142061621248', '角色添加', 'role/add', 0, 3, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894475985452269568', 'role/edit', 'roleList', '894475142061621248', '角色编辑', 'role/edit', 0, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894476118730473472', 'role/delete', 'roleList', '894475142061621248', '角色删除', 'role/delete', 0, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894476276402749440', 'role/permission', 'roleList', '894475142061621248', '角色配权', 'role/permission', 0, 3, 3, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894476950951690240', 'menu/list', 'system', '893287144657780736', '菜单管理', 'menu/list', 1, 2, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477107919323136', 'menu/add', 'menu/list', '894476950951690240', '菜单添加', 'menu/add', 0, 3, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477244926263296', 'menu/edit', 'menu/list', '894476950951690240', '菜单编辑', 'menu/edit', 0, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477420512411648', 'menu/delete', 'menu/list', '894476950951690240', '菜单删除', 'menu/delete', 0, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477851082883072', 'apidoc', 'system', '893287144657780736', 'API文档', 'swagger-ui.html', 1, 2, 9, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477995903811584', 'database/log', 'system', '893287144657780736', '数据库日志', 'druid', 1, 2, 10, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894752734459199488', 'companyList', 'root', '000000000000000000', '公司管理', 'companyList', 1, 1, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('903459378655395840', '/user/modify', 'userList', '893288715881807872', '密码重置', '/user/modify', 1, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');

-- ----------------------------
-- Table structure for menu_other_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `menu_other_user_rel`;
CREATE TABLE `menu_other_user_rel`  (
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜谱信息',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`, `user_id`) USING BTREE,
  INDEX `fk_menu_user_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_menu_user_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_other_user_rel
-- ----------------------------
INSERT INTO `menu_other_user_rel` VALUES ('0714066b25c64ebbbe18a4cf3d62c8bc', 6, '2019-04-25 23:24:24');
INSERT INTO `menu_other_user_rel` VALUES ('6be893be5b80403ab592c2aa3a714021', 6, '2019-04-28 20:01:44');
INSERT INTO `menu_other_user_rel` VALUES ('833688f5f7f64b0cbf7809d5357f6f2e', 6, '2019-04-28 22:16:53');

-- ----------------------------
-- Table structure for menu_rotation_info
-- ----------------------------
DROP TABLE IF EXISTS `menu_rotation_info`;
CREATE TABLE `menu_rotation_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remove_time` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_rotation`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_menu_rotation` FOREIGN KEY (`menu_id`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_rotation_info
-- ----------------------------
INSERT INTO `menu_rotation_info` VALUES (1, '92718a72a7a947e5b637c36107d81f09', '2019-05-05 18:22:35', NULL, 0);
INSERT INTO `menu_rotation_info` VALUES (2, '5f1376312824475ea6ce692174900ec1', '2019-05-05 18:22:40', NULL, 0);
INSERT INTO `menu_rotation_info` VALUES (3, '6f33d18101aa460096d49c6fa6ac0005', '2019-05-05 18:23:56', NULL, 0);
INSERT INTO `menu_rotation_info` VALUES (4, 'c1b4703829a34a91b7af8e089a1f8549', '2019-05-05 18:24:03', NULL, 0);

-- ----------------------------
-- Table structure for menu_step
-- ----------------------------
DROP TABLE IF EXISTS `menu_step`;
CREATE TABLE `menu_step`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱的id',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '步骤介绍',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱步骤配图',
  `orderI` int(11) NULL DEFAULT NULL COMMENT '菜谱顺序',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_menu_summary_step`(`menu_id`) USING BTREE,
  CONSTRAINT `fk_menu_summary_step` FOREIGN KEY (`menu_id`) REFERENCES `menu_summary` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_step
-- ----------------------------
INSERT INTO `menu_step` VALUES (1, '0714066b25c64ebbbe18a4cf3d62c8bc', '萝卜干提前一到两个小时，用冷水或温水泡发，最好是用冷水泡两小时以上，这样可以保持萝卜干的爽脆。', '/static/images/app/88690c86864645fa9d576f5e1ce72f11_744w_992h.jpg', 1);
INSERT INTO `menu_step` VALUES (2, '0714066b25c64ebbbe18a4cf3d62c8bc', '腊肉在沸水里煮一下或者上锅蒸，然后晾凉之后切片。（忘了拍照）', NULL, 2);
INSERT INTO `menu_step` VALUES (3, '0714066b25c64ebbbe18a4cf3d62c8bc', '小米椒切成斜段，蒜苗叶切段，干辣椒剪段，大蒜子拍碎切成末，在备几粒浏阳豆豉和干辣椒末，也就是辣椒面。', '/static/images/app/8056fbbbdc36415483bf2504185b445b_744w_992h.jpg', 3);
INSERT INTO `menu_step` VALUES (4, '0714066b25c64ebbbe18a4cf3d62c8bc', '锅内放底油，直接放入切片的腊肉，煸炒出油，腊肉呈透明状。然后放入大蒜末和干辣椒，豆豉爆香。', '/static/images/app/edb749e490b849578cf5418afc99106d_744w_992h.jpg', 4);
INSERT INTO `menu_step` VALUES (5, '0714066b25c64ebbbe18a4cf3d62c8bc', '然后放入萝卜干和小米椒煸炒，适量放一些盐，料酒，酱油，味精调味', '/static/images/app/82fe06418fa046739a181360118023b4_744w_992h.jpg', 5);
INSERT INTO `menu_step` VALUES (6, '0714066b25c64ebbbe18a4cf3d62c8bc', '加少许水焖一会儿。', '/static/images/app/5dadb4072df44da894bd78392b472fdd_744w_992h.jpg', 6);
INSERT INTO `menu_step` VALUES (7, '0714066b25c64ebbbe18a4cf3d62c8bc', '水快焖干时，加入青蒜苗，蒜苗不宜久炒，大概也就炒15秒左右就可以了。', '/static/images/app/03ef06cd0c5441dda7b2909b2002e335_744w_992h.jpg', 7);
INSERT INTO `menu_step` VALUES (8, '0714066b25c64ebbbe18a4cf3d62c8bc', '出锅装盘，香辣下饭的萝卜干炒腊肉就做好啦！', '/static/images/app/6d36078632b94113bca8d87d6dbdde75_1252w_1876h.jpg', 8);
INSERT INTO `menu_step` VALUES (9, '0714066b25c64ebbbe18a4cf3d62c8bc', '增加一步，这是在泡腊肉的时候，前面我有提到我们家吃腊肉是不喜欢吃很咸的，所以一定要泡水，还要焯水，把它的咸味去掉。泡掉腊肉的咸味，有一个小方法，是我妈教我的，就是在泡腊肉的水里加一勺味精，然后泡大概30分钟左右，腊肉里的咸味就会被去掉很多，如果你尝一下觉得还是咸的话，再焯一次水，基本上腊肉就没有咸味了，但是腊肉的那股香味还是有保留的。（这个去掉咸味的方法适用于所有有盐味的腌制或者腊制的菜。比如酸豆角）\r\n\r\n这个就是我们家吃腊肉的一个小癖好而已。如果觉得不正确，不正宗，也请勿喷，谢谢！', '/static/images/app/a995a4e9c06842e88e715d241a03499d_744w_992h.jpg', 9);
INSERT INTO `menu_step` VALUES (10, '0714066b25c64ebbbe18a4cf3d62c8bc', '上面用味精泡腊肉去咸味的方法其实是需要一定的时间的，不是一时半会能泡掉咸味的，最近我通过一些做湘菜的书知道了另外一个方法，那就是直接煮，不是整块的腊肉煮，而是切片之后再煮，先烧开水（水量多一点，因为煮的过程中水会变少），然后放入切片的腊肉，中火煮15-20分钟，捞出来之前尝一片，保准没有咸味了，这样再搭配别的菜来炒的时候就可以放心大胆的放盐啦，哈哈哈哈', NULL, 10);
INSERT INTO `menu_step` VALUES (11, 'e5ebeeb682fb4c8792313f44d309a299', '先把豆腐洗净，水沥干。然后切吧切吧，把一大块豆腐切成小块儿~', '/static/images/app/f131898290ee11e6b87c0242ac110003_650w_650h.jpg', 1);
INSERT INTO `menu_step` VALUES (12, 'e5ebeeb682fb4c8792313f44d309a299', '往锅里倒入适量的油（这是煎豆腐!!!不是炸豆腐!!!所以油不用放太多的。）', '/static/images/app/f17d285690ee11e6b87c0242ac110003_650w_650h.jpg', 2);
INSERT INTO `menu_step` VALUES (13, 'e5ebeeb682fb4c8792313f44d309a299', '等油热时，把火调成小火，轻轻的放入豆腐。（放豆腐时不要怕，不会溅油。）', '/static/images/app/f1c0b67090ee11e6a9a10242ac110002_650w_650h.jpg', 3);
INSERT INTO `menu_step` VALUES (14, 'e5ebeeb682fb4c8792313f44d309a299', '放好后调成中火，看到没有!!!看到没有!!!豆腐开始滋滋滋滋滋了~煎至从侧面可以看得出底面金黄的时候就可以翻面啦~', '/static/images/app/f20b53ba90ee11e6a9a10242ac110002_650w_650h.jpg', 4);
INSERT INTO `menu_step` VALUES (15, 'e5ebeeb682fb4c8792313f44d309a299', '翻面的时候一定要注意!!!把火调成小火，以防你翻慢了豆腐焦掉…还有，不要用筷用力夹豆腐，会碎的好吗!!!用锅铲和筷子一起配合…一，二…诶~翻过来了!!!对不对!!!对不对!!!!!!', NULL, 5);
INSERT INTO `menu_step` VALUES (16, 'e5ebeeb682fb4c8792313f44d309a299', '全部翻过来后，再把火调成中火煎至另一面金黄~', '/static/images/app/f267406290ee11e6a9a10242ac110002_650w_650h.jpg', 6);
INSERT INTO `menu_step` VALUES (17, 'e5ebeeb682fb4c8792313f44d309a299', '煎的差不多的时候就开始放酱料！加入一勺蚝油、三勺酱油、半勺白砂糖、差不多三分之一碗的清水。', '/static/images/app/f2f4a67890ee11e6a9a10242ac110002_650w_650h.jpg', 7);
INSERT INTO `menu_step` VALUES (18, 'e5ebeeb682fb4c8792313f44d309a299', '其实这时候应该会出现一根葱，可是我找不到了…但是我要假装有!!!来!继续~放入翻炒一下~', '/static/images/app/f33ee5a890ee11e6b87c0242ac110003_650w_650h.jpg', 8);
INSERT INTO `menu_step` VALUES (19, 'e5ebeeb682fb4c8792313f44d309a299', '看见没有!!!看见没有!!!汁儿收的差不多了，颜色变得比较深了就可以出锅了~', '/static/images/app/f3aee31290ee11e6b87c0242ac110003_650w_650h.jpg', 9);
INSERT INTO `menu_step` VALUES (20, 'e5ebeeb682fb4c8792313f44d309a299', '装盘~', '/static/images/app/f40e442490ee11e6b87c0242ac110003_650w_650h.jpg', 10);
INSERT INTO `menu_step` VALUES (21, 'e5ebeeb682fb4c8792313f44d309a299', '咬一口汁儿就爆出来!!!怎是一句好吃可以形容~', '/static/images/app/f455a14890ee11e6a9a10242ac110002_650w_650h.jpg', 11);
INSERT INTO `menu_step` VALUES (22, '6be893be5b80403ab592c2aa3a714021', '准备材料如下。咖喱块选自己喜欢的品牌和口味。', '/static/images/app/4d7fed6e66e111e7bc9d0242ac110002_4912w_3264h.jpg', 1);
INSERT INTO `menu_step` VALUES (23, '6be893be5b80403ab592c2aa3a714021', '胡萝卜切丁 洋葱切丝 备用。', '/static/images/app/49e97c1266df11e7947d0242ac110002_4912w_3264h.jpg', 2);
INSERT INTO `menu_step` VALUES (24, '6be893be5b80403ab592c2aa3a714021', '热锅A，放少许油，倒入胡萝卜和洋葱丝煸炒。\r\n胡萝卜里面的营养成分很多是脂溶性维生素，必须要和油接触才容易被人体吸收噢。', '/static/images/app/f3b982d866de11e7947d0242ac110002_4912w_3264h.jpg', 3);
INSERT INTO `menu_step` VALUES (25, '6be893be5b80403ab592c2aa3a714021', '煸炒完毕加入适量开水（一人份大约500ml），投入一个咖喱块搅拌均匀，小火炖煮。', '/static/images/app/09df645e66e111e7bc9d0242ac110002_4912w_3264h.jpg', 4);
INSERT INTO `menu_step` VALUES (26, '6be893be5b80403ab592c2aa3a714021', '炖咖喱的时间来汆烫乌冬面。\r\n用锅B煮大半锅开水，水开后放入乌冬面。我买的这种面下锅2分钟左右就变软，可以盛出待用。', '/static/images/app/098b2ab066e111e7bc9d0242ac110002_4912w_3264h.jpg', 5);
INSERT INTO `menu_step` VALUES (27, '6be893be5b80403ab592c2aa3a714021', '继续用这锅水汆烫肥牛片，汆熟即可取出待用。', '/static/images/app/5ae6f4a466d511e7947d0242ac110002_1280w_1024h.jpg', 6);
INSERT INTO `menu_step` VALUES (28, '6be893be5b80403ab592c2aa3a714021', '咖喱小火炖煮8分钟左右时，将之前煮散的乌冬面再次下锅，2分钟后，先将乌冬面捞出，盛入碗中。', '/static/images/app/8ffdc7c266de11e7947d0242ac110002_4912w_3264h.jpg', 7);
INSERT INTO `menu_step` VALUES (29, '6be893be5b80403ab592c2aa3a714021', '接着放入肥牛，炖煮开后，连肉带汤全部倒入面碗中。', '/static/images/app/95438c2666de11e7bc9d0242ac110002_1280w_1024h.jpg', 8);
INSERT INTO `menu_step` VALUES (30, '6be893be5b80403ab592c2aa3a714021', '撒上香葱、芝麻，即可上桌食用。', '/static/images/app/5baeacd1ed5d4a59a35e2220afff8adc_4057w_2704h.jpg', 9);
INSERT INTO `menu_step` VALUES (31, '92718a72a7a947e5b637c36107d81f09', '我就重点说说燕麦米吧，因为我个人是非常非常喜欢燕麦。', NULL, 1);
INSERT INTO `menu_step` VALUES (32, '92718a72a7a947e5b637c36107d81f09', '燕麦米：\r\n是被誉为最佳的粗粮，在谷物中含蛋白质是最高的，平时可以在一些健身食谱上看出燕麦的重要性，几乎每个食谱里面必定会提到燕麦是非常好的一款膳食。\r\n其作用可以保护心脏和血管、调节血脂、控制血糖、调节肠道菌群、提高免疫力、改善肠道健康、防治高血压、抗癌等等。', NULL, 2);
INSERT INTO `menu_step` VALUES (33, '92718a72a7a947e5b637c36107d81f09', '我身边的朋友黑多不知道燕麦片和燕麦米是同一样东西，她们的智商也挺感人的。\r\n燕麦片只是被压扁了而已。', '/static/images/app/4b29e02b2d9111e68e3075b43d2dcdec.jpg', 3);
INSERT INTO `menu_step` VALUES (34, '92718a72a7a947e5b637c36107d81f09', '准备好食材后将它们冲洗至水不浑浊为止，再泡2~3小时。\r\nTip: 如果你的电锅有杂粮功能也可以选择不泡，但是口感没有那么软糯，是属于有嚼头的一种。如果没有杂粮功能那就一！定！要！泡！', NULL, 4);
INSERT INTO `menu_step` VALUES (35, '92718a72a7a947e5b637c36107d81f09', '泡好后倒入电锅，加入2cup的水，盖上盖子等待时间到就OK。', NULL, 5);
INSERT INTO `menu_step` VALUES (36, '47f1cdd33e9a4281b6cb3f93f52dc149', '海带须提前3～4个小时用清水浸泡至涨发，洗净控水，切成长方块或打成结；也可以直接从市场买回泡发好的海带结；', NULL, 1);
INSERT INTO `menu_step` VALUES (37, '47f1cdd33e9a4281b6cb3f93f52dc149', '肋小排购买时要求店家顺骨切开，斩成约4厘米长的段，洗净后冷水下锅煮开焯2分钟，捞出用流动的水将血沫冲洗干净；', NULL, 2);
INSERT INTO `menu_step` VALUES (38, '47f1cdd33e9a4281b6cb3f93f52dc149', '净锅内加入1000克清水，放入排骨、葱段、姜片、料酒，大火烧开后转中火焖煮30分钟；拣去姜片、葱段，放入海带，调入盐，大火滚煮10分钟即可。', NULL, 3);
INSERT INTO `menu_step` VALUES (39, '571926782b7a433393e487de00eb5522', '在生鸡翅上划刀，或者用牙签给每个鸡翅正反面共戳6个小洞，这样可以更加入味。用一勺老抽5ml，两勺料酒10ml腌至少两小时 【时间紧可省略腌制，但要划刀和戳洞，否则不易入味】', '/static/images/app/4f83d9f37ff44c9994d2b88aefa825a4_480w_384h.jpg', 1);
INSERT INTO `menu_step` VALUES (40, '571926782b7a433393e487de00eb5522', '锅中放冷水和葱姜片，鸡翅与冷水一同下锅煮开，不用煮透，看到浮沫比较多时关火捞出即可，用温热的水一个个冲洗掉浮沫，沥干', '/static/images/app/9d94fbcced2b486186e6885bc8af28c4_480w_384h.jpg', 2);
INSERT INTO `menu_step` VALUES (41, '571926782b7a433393e487de00eb5522', '用厨房用纸擦干，有杂毛可以这时候拔干净', '/static/images/app/57b803ea2ec0469fb0ababc09ee0e46c_480w_384h.jpg', 3);
INSERT INTO `menu_step` VALUES (42, '571926782b7a433393e487de00eb5522', '【最好用不粘锅】把锅用姜片涂一遍可以防止鸡翅粘锅', '/static/images/app/6a12569ee3ec48a2aa2d3887dacc3a92_480w_384h.jpg', 4);
INSERT INTO `menu_step` VALUES (43, '571926782b7a433393e487de00eb5522', '（不用放油，鸡翅自己会出油）用小火将鸡翅煎至金黄，晃动锅以免粘锅', '/static/images/app/74ebf830aded4cfb8a5c2d35f20061fe_480w_384h.jpg', 5);
INSERT INTO `menu_step` VALUES (44, '571926782b7a433393e487de00eb5522', '一听可乐、一勺料酒、一勺老抽，两勺生抽，加半支桂皮一个八角会更有风味。不用加水。\r\n炖至汤汁还剩一碗水的量时，再尝尝咸淡，如需加盐再加少量盐，这样不容易出差错。', '/static/images/app/a4009b0958cb438bb1a5bfd98ba94299_480w_384h.jpg', 6);
INSERT INTO `menu_step` VALUES (45, '571926782b7a433393e487de00eb5522', '炖至汤汁收浓，浓度看图，基本所有汁都裹在鸡翅上了，只剩约三勺汤汁了，出锅', '/static/images/app/3b58421c908111e6a9a10242ac110002_1619w_1080h.jpg', 7);
INSERT INTO `menu_step` VALUES (46, '5f1376312824475ea6ce692174900ec1', '猪小排冼净，晾干水份备用', '/static/images/app/96cf5bfa8cba11e6a9a10242ac110002_469w_354h.jpg', 1);
INSERT INTO `menu_step` VALUES (47, '5f1376312824475ea6ce692174900ec1', '锅内倒少量油，烧热之后，爆香姜片', NULL, 2);
INSERT INTO `menu_step` VALUES (48, '5f1376312824475ea6ce692174900ec1', '放入排骨，一直煸炒到排骨变色后，表面金黄微焦', NULL, 3);
INSERT INTO `menu_step` VALUES (49, '5f1376312824475ea6ce692174900ec1', '此时就可以放入黄金比例中的调料了，顺序是：先放一汤勺料酒，接着两汤勺酱油，三汤勺米醋最后四汤勺白糖，炒匀', NULL, 4);
INSERT INTO `menu_step` VALUES (50, '5f1376312824475ea6ce692174900ec1', '再倒入能没过排骨的开水，调中小火焖20分钟', NULL, 5);
INSERT INTO `menu_step` VALUES (51, '5f1376312824475ea6ce692174900ec1', '20分钟后调入盐，开大火收汁，收到汁浓色亮时，撒入芝麻点缀即可出锅（锅里剩下的姜片丢掉不用，最后大火收汁时注意多翻动锅内的排骨，避免烧焦哟！）', NULL, 6);
INSERT INTO `menu_step` VALUES (52, 'f34f0087950d4f059e4ef8997af022a1', '鸡胸肉事先化解', '/static/images/app/f13f69e565594c59b3b666667c3e5ffd_5184w_3456h.jpg', 1);
INSERT INTO `menu_step` VALUES (53, 'f34f0087950d4f059e4ef8997af022a1', '花生米要选用熟的，油炸的和炒的都可以', '/static/images/app/7a5874a829cd48138bd3aace7b074295_5184w_3456h.jpg', 2);
INSERT INTO `menu_step` VALUES (54, 'f34f0087950d4f059e4ef8997af022a1', '鸡胸肉切块，要比花生米明显大一点', '/static/images/app/f4976cbf80204412be53b2565fa9d1d5_5184w_3456h.jpg', 3);
INSERT INTO `menu_step` VALUES (55, 'f34f0087950d4f059e4ef8997af022a1', '鸡肉块用一点盐、酱油、淀粉上浆', '/static/images/app/5ee9a7dc6079453ba60b8ff4b16068db_5184w_3456h.jpg', 4);
INSERT INTO `menu_step` VALUES (56, 'f34f0087950d4f059e4ef8997af022a1', '干辣椒切成段、大蒜切末、葱切葱花', '/static/images/app/cd436aa4083d45e68cce59153bec5dd0_5184w_3456h.jpg', 5);
INSERT INTO `menu_step` VALUES (57, 'f34f0087950d4f059e4ef8997af022a1', '把鸡肉放入热油，滑油成熟', '/static/images/app/7c06b88cf2da4ffd8f51c1d541c6edaa_5184w_3456h.jpg', 6);
INSERT INTO `menu_step` VALUES (58, 'f34f0087950d4f059e4ef8997af022a1', '锅里用少许油把豆瓣酱炒出有油，加入蒜末、葱白末炒香。加入酱油、白糖、料酒、香醋、清水、干辣椒。', '/static/images/app/f4786ea5cda84b2b90830515f96f4b3e_5184w_3456h.jpg', 7);
INSERT INTO `menu_step` VALUES (59, 'f34f0087950d4f059e4ef8997af022a1', '锅里调味汁烧沸以后勾芡，倒入鸡肉和花生米，翻炒均匀', '/static/images/app/7042147efff04b6c998fb69383b2cff1_5184w_3456h.jpg', 8);
INSERT INTO `menu_step` VALUES (60, 'f34f0087950d4f059e4ef8997af022a1', '用少许葱花点缀', '/static/images/app/578a463dc37245b1b5b43e14d866fd52_5184w_3456h.jpg', 9);
INSERT INTO `menu_step` VALUES (61, '6f33d18101aa460096d49c6fa6ac0005', '好大颗的腰果哦', '/static/images/app/38feb3241cc842568a14600af48c9673_5184w_3456h.jpg', 1);
INSERT INTO `menu_step` VALUES (62, '6f33d18101aa460096d49c6fa6ac0005', '腰果直接放入冷油中', '/static/images/app/61bff8d101004f3c95f91bec66f597cd_5184w_3456h.jpg', 2);
INSERT INTO `menu_step` VALUES (63, '6f33d18101aa460096d49c6fa6ac0005', '用小火慢慢加热，不停翻炒', '/static/images/app/fc2459edb4704d52a468e50e791766dc_5184w_3456h.jpg', 3);
INSERT INTO `menu_step` VALUES (64, '6f33d18101aa460096d49c6fa6ac0005', '记得一定要小火哦，心急的小朋友可以偶尔开一下下大火，等油起泡了马上改小火哦。', '/static/images/app/4c0f4519f1ec41a7a1d69f3a748f2b69_5184w_3456h.jpg', 4);
INSERT INTO `menu_step` VALUES (65, '6f33d18101aa460096d49c6fa6ac0005', '等腰果颜色金黄就可以了', '/static/images/app/e024d7b99ca64a19855fb7737cfcef75_5184w_3456h.jpg', 5);
INSERT INTO `menu_step` VALUES (66, '6f33d18101aa460096d49c6fa6ac0005', '炸好的腰果倒在纸巾上吸油', '/static/images/app/00686b0923624cc3a72a6ca522e3d991_5184w_3456h.jpg', 6);
INSERT INTO `menu_step` VALUES (67, '6f33d18101aa460096d49c6fa6ac0005', '这颜色真好看', '/static/images/app/de9e78e825ee403b876f7356c211455c_5184w_3456h.jpg', 7);
INSERT INTO `menu_step` VALUES (68, '6f33d18101aa460096d49c6fa6ac0005', '等腰果全部冷却，在装入密封盒，就可以慢慢放着吃啦!', '/static/images/app/805bd30b2f504c2bba4fdda375a25487_5184w_3456h.jpg', 8);
INSERT INTO `menu_step` VALUES (69, '6f33d18101aa460096d49c6fa6ac0005', '挂霜腰果\r\n用炸好的腰果，我取了一半做挂霜。', '/static/images/app/07071e98761c4d22a5b1205bac617d39_5184w_3456h.jpg', 9);
INSERT INTO `menu_step` VALUES (70, '6f33d18101aa460096d49c6fa6ac0005', '锅里倒入清水，把白糖倒入中间。\r\n用小火慢慢熬，切记是小火、小火、小火。', '/static/images/app/c4f35b84a2ea45eb814b2cc2f76ebf80_5184w_3456h.jpg', 10);
INSERT INTO `menu_step` VALUES (71, '6f33d18101aa460096d49c6fa6ac0005', '等白糖化开，糖水慢慢熬成浓稠的糖浆。', '/static/images/app/0f52d5483f40436ea6b76541648c71d5_5184w_3456h.jpg', 11);
INSERT INTO `menu_step` VALUES (72, '6f33d18101aa460096d49c6fa6ac0005', '等糖浆泡泡变小，筷子沾一下，可以稍微拔出丝来的时候，就可以倒入腰果了。', '/static/images/app/10e44f6eb2c2439bb275b34477f380c8_5184w_3456h.jpg', 12);
INSERT INTO `menu_step` VALUES (73, '6f33d18101aa460096d49c6fa6ac0005', '倒入腰果后，把锅端离炉口，不停用炒勺翻炒。', '/static/images/app/d0cd5cd0f96f428abd5502c7e10f73e1_5184w_3456h.jpg', 13);
INSERT INTO `menu_step` VALUES (74, '6f33d18101aa460096d49c6fa6ac0005', '等待糖浆冷却、凝固。过程中记得不停翻炒哦。', '/static/images/app/779f7b2341664cacba86484c818275ab_5184w_3456h.jpg', 14);
INSERT INTO `menu_step` VALUES (75, '6f33d18101aa460096d49c6fa6ac0005', '注意哦，在糖浆半凝固的时候，一边炒一边将腰果压散，以免黏在一起成团。', '/static/images/app/9287b7649cf24c6292e4caeb92456ac3_5184w_3456h.jpg', 15);
INSERT INTO `menu_step` VALUES (76, '6f33d18101aa460096d49c6fa6ac0005', '等糖全部变白凝固就成功啦', '/static/images/app/ff8e7f65c6994dc692579ead2f0bcf9a_5184w_3456h.jpg', 16);
INSERT INTO `menu_step` VALUES (77, '6f33d18101aa460096d49c6fa6ac0005', '也要全部冷却后再装入密封盒。', '/static/images/app/c354cbe5d0474ae7a94d3347904088f4_5184w_3456h.jpg', 17);
INSERT INTO `menu_step` VALUES (78, '6f33d18101aa460096d49c6fa6ac0005', '我做了一半油炸一半挂霜，放盒子里当零食吃。', '/static/images/app/9f30ef9f9b7d42549b9d1a487d8d033b_5184w_3456h.jpg', 18);
INSERT INTO `menu_step` VALUES (79, 'c8ad71e6ea8642f780daedb9fd691ddc', '把超市买回来的冻鸡爪 解冻 洗净', '/static/images/app/589e258ca5b511e6947d0242ac110002_1280w_852h.jpg', 1);
INSERT INTO `menu_step` VALUES (80, 'c8ad71e6ea8642f780daedb9fd691ddc', '去鸡爪指甲 切成小段 根据自己喜好 小点只是为了方便入味', '/static/images/app/616bf2dea5b511e6bc9d0242ac110002_1280w_852h.jpg', 2);
INSERT INTO `menu_step` VALUES (81, 'c8ad71e6ea8642f780daedb9fd691ddc', '锅中烧水依次加入花椒香叶生姜八角等', '/static/images/app/d01dec28a5b511e6bc9d0242ac110002_1280w_852h.jpg', 3);
INSERT INTO `menu_step` VALUES (82, 'c8ad71e6ea8642f780daedb9fd691ddc', '水略气泡就可以加入鸡爪 放一点点白酒和白醋有利于增白鸡爪 具体数值我没有量过 只是一小盖 根据自己口味加盐 后面还要放泡椒的 所以盐不用放太多', '/static/images/app/3fbd2490a5b611e6bc9d0242ac110002_1280w_852h.jpg', 4);
INSERT INTO `menu_step` VALUES (83, 'c8ad71e6ea8642f780daedb9fd691ddc', '根据情况判断鸡爪是否煮熟 可拿筷子戳试一下 熟了立马捞出来放入冷水中 最好加冰块的冰水之中 这样鸡爪吃起来更为q弹 待冷却以后 把鸡爪上面的浮油尽量洗净去掉 为了口感～', '/static/images/app/8b72a54aa5b611e6947d0242ac110002_1280w_852h.jpg', 5);
INSERT INTO `menu_step` VALUES (84, 'c8ad71e6ea8642f780daedb9fd691ddc', '这时候把鸡爪放入碗中 加入生姜花椒小米椒 依旧是根据口味去放 喜欢吃辣 就多放 喜欢麻就多放花椒就是这样～', '/static/images/app/f37c5a64a5b611e6bc9d0242ac110002_1280w_852h.jpg', 6);
INSERT INTO `menu_step` VALUES (85, 'c8ad71e6ea8642f780daedb9fd691ddc', '最后倒入买的泡椒就基本大功告成啦 泡椒盐水也一同全部倒入 如果嫌泡椒盐水咸的可以加一点冷开水～ 不过我一般都是直接倒进去 家里有柠檬的话可以挤一点点柠檬汁出来 会使凤爪口味更加爽口 然后再切放几片柠檬 也可以看起来更有食欲～', '/static/images/app/32118006a5b711e6947d0242ac110002_1280w_852h.jpg', 7);
INSERT INTO `menu_step` VALUES (86, '6f4e6c1f487d41bf97d563d594846ad5', '把春笋去皮，去掉黄土的部分，切成斜块。下到开水里焯几分钟到闻出笋的味道。', '/static/images/app/e97964c4150e4ed1bf03420245239845_1616w_1080h.jpg', 1);
INSERT INTO `menu_step` VALUES (87, '6f4e6c1f487d41bf97d563d594846ad5', '捞起，备用，不可以焯太久，以免笋变色。', '/static/images/app/b6b0b28309f14f6c9d9ee0d4372256cf_1616w_1080h.jpg', 2);
INSERT INTO `menu_step` VALUES (88, '6f4e6c1f487d41bf97d563d594846ad5', '热锅冷油，油温稍微上来点，下笋，加入蚝油翻炒。', '/static/images/app/8ebb17b3460c4bab9aceeff693233a23_1616w_1080h.jpg', 3);
INSERT INTO `menu_step` VALUES (89, '6f4e6c1f487d41bf97d563d594846ad5', '再洒点酱油，调调味道。', '/static/images/app/2b7231c3ab0247f9ace775a993241d98_1616w_1080h.jpg', 4);
INSERT INTO `menu_step` VALUES (90, '6f4e6c1f487d41bf97d563d594846ad5', '最后，加入葱段～盖上锅盖，焖五分钟左右', '/static/images/app/e7af40b8e9594673b89b58d1f9dfe2e8_1616w_1080h.jpg', 5);
INSERT INTO `menu_step` VALUES (91, '6f4e6c1f487d41bf97d563d594846ad5', '起锅～开吃～留住春天的味道～', '/static/images/app/a1c46d1e5b8a4eed982a18c9ba429b91_1616w_1080h.jpg', 6);
INSERT INTO `menu_step` VALUES (92, '3d3e0493400642e9ac617a7257f0bdf4', '鳕鱼加入料酒抹少许盐腌制半小时左右', NULL, 1);
INSERT INTO `menu_step` VALUES (93, '3d3e0493400642e9ac617a7257f0bdf4', '鳕鱼上面铺上姜丝，蒜片，干辣椒丝盖保鲜膜，水烧开后把鱼放进去，蒸5分钟的样子', NULL, 2);
INSERT INTO `menu_step` VALUES (94, '3d3e0493400642e9ac617a7257f0bdf4', '蒸熟的鳕鱼淋上蒸鱼豉油，表面放上葱丝，锅中烧好热油浇上即可', NULL, 3);
INSERT INTO `menu_step` VALUES (95, 'cee46249de1d4b42a0c93577413fa5cb', '南瓜、紫薯、芋头用各种方法蒸熟。我用锅将三种放一起蒸的（会有些串色，介意的用锡纸包起来蒸）。水蒸的缺点是南瓜水多了，后面会导致用大量淀粉中和。其他两种水蒸没问题。南瓜蒸熟后可用不粘锅炒干些。', '/static/images/app/6d31178a933a11e6b87c0242ac110003_853w_1280h.jpg', 1);
INSERT INTO `menu_step` VALUES (96, 'cee46249de1d4b42a0c93577413fa5cb', '南瓜、紫薯、芋头用各种方法弄烂，我用的是擀面杖捣的。也可以分别放入保鲜袋用手揉烂。三种食材本身带有糖份，但加了淀粉后甜份降低，建议大家根据个人口味加适量白糖，蜂蜜也行。芋头甜分最低，糖量可多加。', '/static/images/app/6cd38d18933a11e6a9a10242ac110002_960w_1280h.jpg', 2);
INSERT INTO `menu_step` VALUES (97, 'cee46249de1d4b42a0c93577413fa5cb', '加入淀粉，淀粉不要一次加够，要分次加入，建议大家在最初用筷子搅拌，待面团硬以后再手揉。不然满手面糊会崩溃的。揉成干的有弹性的面团就算成功了。怕淀粉多也用少量糯米粉代替。芋泥和薯泥偏干的话慢慢加少量水，直到揉进足量淀粉为止。搓不成团要不淀粉不够要不太干', '/static/images/app/6c646fa0933a11e6b87c0242ac110003_1280w_908h.jpg', 3);
INSERT INTO `menu_step` VALUES (98, 'cee46249de1d4b42a0c93577413fa5cb', '第五步：切丁。找个大案板和一大盘子，盘子上撒些普通面粉。把三个面团分别搓成细条切丁。不吃不用煮放冰箱速冻。二个月之内吃完。不要问2个月以后怎么办！自己看着办，口感差而已。', '/static/images/app/6bfb531c933a11e6b87c0242ac110003_1280w_854h.jpg', 4);
INSERT INTO `menu_step` VALUES (99, 'cee46249de1d4b42a0c93577413fa5cb', '煮芋圆。锅里烧开水后，加入做好的芋圆，等5，6分钟全部浮上水后捞出放入准备好的凉开水中，这步主要是增加芋圆的Q性。从凉开水中捞出芋圆加入红豆、薏米、莲子、或仙草、椰汁、牛奶、姜糖水任何你们喜欢的甜品中，一碗色香味俱全的鲜芋仙就成功制成了。吃不完的撒些面粉速冻，想吃再拿出来煮。怎么样，大家有跃跃欲试的冲动了吧。', '/static/images/app/6bab5d4e933a11e6b87c0242ac110003_1801w_1201h.jpg', 5);
INSERT INTO `menu_step` VALUES (100, '1ceba29d11634538a908542f737fb489', '茄子切条装在容器里面加一勺盐进去。', '/static/images/app/6474a7a6980311e6b2400242ac110002_650w_650h.jpg', 1);
INSERT INTO `menu_step` VALUES (101, '1ceba29d11634538a908542f737fb489', '用手抓匀腌制十几分钟。这一步很重要，因为这样处理了茄子不氧化变色', '/static/images/app/642cca4e980311e69ce70242ac110002_650w_650h.jpg', 2);
INSERT INTO `menu_step` VALUES (102, '1ceba29d11634538a908542f737fb489', '腌制茄子的同时把一小块肉剁成肉馅', '/static/images/app/63eced0c980311e69ce70242ac110002_606w_607h.jpg', 3);
INSERT INTO `menu_step` VALUES (103, '1ceba29d11634538a908542f737fb489', '肉馅里面加入白胡椒粉适量，生抽适量。料酒适量，生粉适量抓匀腌制十分钟，别说那么一点肉你不想腌制，不要偷懒，除非你想一盘好菜吃出腥味儿！', '/static/images/app/63ab9e7e980311e69ce70242ac110002_650w_650h.jpg', 4);
INSERT INTO `menu_step` VALUES (104, '1ceba29d11634538a908542f737fb489', '同时取一个小碗装半碗水，里面加生粉适量，醋少许，盐少许，白糖一小勺子，生抽适量，老抽少许搅拌成一碗汁备用', '/static/images/app/63623c34980311e6b2400242ac110002_650w_650h.jpg', 5);
INSERT INTO `menu_step` VALUES (105, '1ceba29d11634538a908542f737fb489', '姜蒜辣椒葱切好备用', '/static/images/app/6314565e980311e69ce70242ac110002_650w_650h.jpg', 6);
INSERT INTO `menu_step` VALUES (106, '1ceba29d11634538a908542f737fb489', '锅里放油稍微多一点准备炸茄子', '/static/images/app/62c99d3a980311e6b2400242ac110002_650w_650h.jpg', 7);
INSERT INTO `menu_step` VALUES (107, '1ceba29d11634538a908542f737fb489', '吧把腌制好的茄子用手挤掉多余水分，油温升高以后下茄子炸，重点来了，记住一定要油温很高了茄子下锅，不然茄子容易变色。炸约不到一分钟，自己观察，变软即可捞起来，不然太软了不好吃', '/static/images/app/627b478e980311e6b2400242ac110002_650w_650h.jpg', 8);
INSERT INTO `menu_step` VALUES (108, '1ceba29d11634538a908542f737fb489', '炸软的茄子捞起来备用。', '/static/images/app/622c76f4980311e69ce70242ac110002_592w_1051h.jpg', 9);
INSERT INTO `menu_step` VALUES (109, '1ceba29d11634538a908542f737fb489', '锅里留油下姜蒜炒香，并加入适量郫县豆瓣酱。', '/static/images/app/61be46ca980311e6b2400242ac110002_592w_1051h.jpg', 10);
INSERT INTO `menu_step` VALUES (110, '1ceba29d11634538a908542f737fb489', '豆瓣酱炒香以后下肉沫翻炒', '/static/images/app/6162627e980311e69ce70242ac110002_592w_1051h.jpg', 11);
INSERT INTO `menu_step` VALUES (111, '1ceba29d11634538a908542f737fb489', '肉沫变白以后茄子回锅翻炒一下', '/static/images/app/60dcda8c980311e6b2400242ac110002_607w_1079h.jpg', 12);
INSERT INTO `menu_step` VALUES (112, '1ceba29d11634538a908542f737fb489', '锅里倒入事先调好的汁翻拌均匀', '/static/images/app/607f9aac980311e69ce70242ac110002_607w_1080h.jpg', 13);
INSERT INTO `menu_step` VALUES (113, '1ceba29d11634538a908542f737fb489', '汁冒泡粘稠了撒葱花起锅，由于茄子事先用盐腌制过，加上豆瓣酱有盐，所以基本不用再加盐，自己试试咸淡', '/static/images/app/60247f00980311e69ce70242ac110002_607w_1079h.jpg', 14);
INSERT INTO `menu_step` VALUES (114, '19816b23d74249b4aae7ebb114f46379', '原料切配：\r\n豆腐切正方形块状，大小看个人喜好。\r\n青葱切葱花，蒜头切成末。肉碎不用腌制，但一定要完全化冻。正宗麻婆豆腐是放牛肉碎。家庭制作可以改为“猪肉碎”也没有问题。郫县豆瓣酱看个人喜好放，我的建议可放多一点点。可以提出问道，也可以让油炒到更红。豆瓣酱也要斩几刀，确保里面的豆瓣不会那么大颗粒影响味道发挥。', NULL, 1);
INSERT INTO `menu_step` VALUES (115, '19816b23d74249b4aae7ebb114f46379', '煮豆腐：\r\n为什么要煮豆腐？\r\n1.豆腐里水分含量高煮后会流失一些口感更好。\r\n2.水煮豆腐可以使豆腐更加Q弹好吃。\r\n3.水煮豆腐一定要放一些盐，稍微多一点，一块豆腐煮的时候可放2g左右盐一起煮，这样盐的渗透压会更快逼出豆腐里的水分，而且会让豆腐有一点点的咸味，记得这个程序一定要做，想做出好的麻婆豆腐这是关键步骤。\r\n4.豆腐要煮差不多2-3分钟（小火，大火容易滚碎豆腐），差不多豆腐微微有些膨胀了就好了，但别捞出来，泡着先~避免豆腐捞上来后黏在一起。', NULL, 2);
INSERT INTO `menu_step` VALUES (116, '19816b23d74249b4aae7ebb114f46379', '炒：\r\n另外取一口锅，放底油（可以多一点点）油温热后先炒肉碎。此时注意油温不要太高，慢慢炒，炒到肉碎开始微黄，有点发干时加入豆瓣酱炒出红油。出红油后下蒜末炒出香味就可以加水或汤，差不多一块豆腐一小碗汤，煮开汤后加入米酒或花雕酒一小勺，生抽一点点（只是提个味道，因郫县豆瓣已经很咸了，所以别放太多），糖一点点，煮开后试试味道，此时不能味道正合适，要稍微淡一点点，不然烧出来水分挥发后就会很咸。味道调好后加入煮好的豆腐，直接捞出来放进汤汁里，稍微烧一个2-3分钟，待汤汁变少后加入花椒面（自己掌握），我用的是自己炒的花椒碾碎的自制花椒面，所以很香很麻，放的不多提出味道就好了。（花椒面不要早放，会黑，会使整锅豆腐变黑掉）\r\n最后用水淀粉勾一个薄芡，再淋入麻油和几滴醋，就完成了炒的部分~（几滴醋也是关键哦，不放和放的会有差别哦，但几滴而已哦，最好不要吃出酸味，只是提味，这就是传说中的”锅边醋“）', NULL, 3);
INSERT INTO `menu_step` VALUES (117, '19816b23d74249b4aae7ebb114f46379', '点缀：\r\n可点缀葱花，香菜，芝麻等等，随个人喜好。', '/static/images/app/5dd48ec8e9b311e6bc9d0242ac110002_2160w_1620h.jpg', 4);
INSERT INTO `menu_step` VALUES (118, 'a14be5243eac46fc9d3b06a93ecc9270', '火腿切丝，口蘑切3mm片，小白菜切段；蒜切末', NULL, 1);
INSERT INTO `menu_step` VALUES (119, 'a14be5243eac46fc9d3b06a93ecc9270', '一点油下锅，爆香蒜末，再加入火腿丝炒香', NULL, 2);
INSERT INTO `menu_step` VALUES (120, 'a14be5243eac46fc9d3b06a93ecc9270', '加入蘑菇炒一炒。这时候蘑菇会出水，大火煮一会，把蘑菇出的水差不多煮干。', NULL, 3);
INSERT INTO `menu_step` VALUES (121, 'a14be5243eac46fc9d3b06a93ecc9270', '加入小白菜翻炒个一两分钟就能出锅了。如果用娃娃菜，就多煮一会儿', NULL, 4);
INSERT INTO `menu_step` VALUES (122, 'd011da5fdca64b328463984ddb132b3a', '半只鸡切小块冷水下锅，水烧开关火捞出鸡备用。是为了去掉血水。', '/static/images/app/60c13a5ce5c540b28081b0c7d8b293cf_1120w_896h.jpg', 1);
INSERT INTO `menu_step` VALUES (123, 'd011da5fdca64b328463984ddb132b3a', '跟冰冰姐学的开椰青技术，椰子汁倒出备用。', '/static/images/app/57737e9614e148de9267dad70230c4fe_1125w_900h.jpg', 2);
INSERT INTO `menu_step` VALUES (124, 'd011da5fdca64b328463984ddb132b3a', '用勺子把整个椰子的肉挖出来，我用的是泰国椰青，椰肉非常的嫩，特别好挖', '/static/images/app/1fa8372d1f884f7782f081053b96c734_1125w_900h.jpg', 3);
INSERT INTO `menu_step` VALUES (125, 'd011da5fdca64b328463984ddb132b3a', '将鸡肉，椰子汁，椰肉，红枣捏碎，枸杞放入炖锅，加适量清水刚好没过食材多2～3cm就可以开始炖了', '/static/images/app/a8fcb6ef69a64f48aab20abc1213eec7_1280w_1023h.jpg', 4);
INSERT INTO `menu_step` VALUES (126, 'd011da5fdca64b328463984ddb132b3a', '电炖锅炖了2小时就可以喝了，不需要加其他调味。汤汁清甜。', '/static/images/app/4221b0d3151f48fa8463831579f04303_3024w_3024h.jpg', 5);
INSERT INTO `menu_step` VALUES (127, '8a60936befcc4de3b93ed0bb25d906d3', '把低筋面粉、鸡蛋、牛奶、糖、盐、香草精一起倒入一个大点的容器里。香草精的作用是为了去腥，给面糊增加香味，没有的话可以滴几滴柠檬汁。再用电动打蛋器搅打均匀。放置在一旁静置5分钟。', '/static/images/app/f4bfa09860f848d6812427b13ba1c569_972w_648h.jpg', 1);
INSERT INTO `menu_step` VALUES (128, '8a60936befcc4de3b93ed0bb25d906d3', '准备一个平底铸铁锅，开中火加热至手放在锅子上方能明显感觉到热气，倒入融化的黄油液。', '/static/images/app/4abdfd5f7322467cbcb2a081ea97be81_972w_648h.jpg', 2);
INSERT INTO `menu_step` VALUES (129, '8a60936befcc4de3b93ed0bb25d906d3', '黄油液倒进去后要立即加入面糊，然后关火。', '/static/images/app/7344e68c82c345788274f22a43972dbd_972w_648h.jpg', 3);
INSERT INTO `menu_step` VALUES (130, '8a60936befcc4de3b93ed0bb25d906d3', '接着连着铸铁锅一起放入预热好的烤箱内，210度烤12-18分钟。看到松饼膨胀表面微黄就可以取出来了。', '/static/images/app/9ac30de334e442a0a8a7dcf3a929b808_972w_648h.jpg', 4);
INSERT INTO `menu_step` VALUES (131, '8a60936befcc4de3b93ed0bb25d906d3', '取出来的松饼会迅速回缩成边缘高中间塌的碗状，加上些水果，再筛上一层糖粉就可以吃了。喜欢甜一点的还可以淋些蜂蜜或者枫糖，香软甜蜜，很好吃哦。', '/static/images/app/e456cee6483a4e5da641383e1bc5e7e7_972w_648h.jpg', 5);
INSERT INTO `menu_step` VALUES (132, '62367bf1715643068596d263162a9157', '黑白芝麻炒熟后，放入料理机打碎。', '/static/images/app/b5946fdbee8d49e59e371ad7c72734a7_1864w_1242h.jpg', 1);
INSERT INTO `menu_step` VALUES (133, '62367bf1715643068596d263162a9157', '大概十秒，打成这样就好了哟～打太久会出油的，不然就是一坨坨结块的', '/static/images/app/ca04d92b85344ae885715e8a62ad6f91_1864w_1242h.jpg', 2);
INSERT INTO `menu_step` VALUES (134, '62367bf1715643068596d263162a9157', '加入细纱糖，搅拌，与黑芝麻混合均匀（为了与黑芝麻粉更融合，我把细砂糖也给打成糖粉了）', '/static/images/app/88f70f3eb5194ceeb062465b1c9a0550_1864w_1242h.jpg', 3);
INSERT INTO `menu_step` VALUES (135, '62367bf1715643068596d263162a9157', '再把猪油倒入搅拌均匀，然后保鲜膜贴上，放冰箱冷藏，低温猪油会凝固，这样好包馅料。放冰箱的时间我们来和面。', '/static/images/app/1fccbb3df504425783b6396ae12decea_1864w_1242h.jpg', 4);
INSERT INTO `menu_step` VALUES (136, '62367bf1715643068596d263162a9157', '小麦淀粉中一次性加入100克开水，马上和成团。⚠️一定要一次性加入全部开水哦！！', '/static/images/app/753bbdf5cb9c43f2a3544f92e98a3a80_1864w_1242h.jpg', 5);
INSERT INTO `menu_step` VALUES (137, '62367bf1715643068596d263162a9157', '糯米粉、细砂糖、猪油混合，加入新鲜艾草汁。（咳咳，下面插播一下新鲜艾草汁做法）', '/static/images/app/6945500e6ddf42489141b248d29c89c5_1864w_1242h.jpg', 6);
INSERT INTO `menu_step` VALUES (138, '62367bf1715643068596d263162a9157', '艾草焯水一遍捞出，再焯第二遍，此时加点小苏打，保持颜色鲜绿。煮开后带水一起放入料理机打成汁。', '/static/images/app/7b44894515a145e5ac7f45ebd3db469b_1656w_1242h.jpg', 7);
INSERT INTO `menu_step` VALUES (139, '62367bf1715643068596d263162a9157', '好浓郁的艾草汁很香 春天的香气！！', '/static/images/app/83184ee051964bdb963c924cece6ee3d_1209w_967h.jpg', 8);
INSERT INTO `menu_step` VALUES (140, '62367bf1715643068596d263162a9157', '和面吧', '/static/images/app/c3c2354b32714c1881e675c57e5c6cef_1864w_1242h.jpg', 9);
INSERT INTO `menu_step` VALUES (141, '62367bf1715643068596d263162a9157', '和成这样的面团', '/static/images/app/93566d142182436abaeeb38de55f7bf1_1864w_1242h.jpg', 10);
INSERT INTO `menu_step` VALUES (142, '62367bf1715643068596d263162a9157', '然后把小麦淀粉的面团加进来，和到一起', '/static/images/app/39b9f0b5c63a428d95ee814d000c91a2_1864w_1242h.jpg', 11);
INSERT INTO `menu_step` VALUES (143, '62367bf1715643068596d263162a9157', '两者融合后。和个面团都是爱你的形状哟', '/static/images/app/f944e9d4ed5944218fb03d65424d9928_1864w_1242h.jpg', 12);
INSERT INTO `menu_step` VALUES (144, '62367bf1715643068596d263162a9157', '面团分成小剂子，30克一个。我这里一共分了二十个。', '/static/images/app/1fff401a834a4f5992398a77ed502637_1864w_1242h.jpg', 13);
INSERT INTO `menu_step` VALUES (145, '62367bf1715643068596d263162a9157', '此时，冰箱取出黑芝麻馅，已经凝固咯，可以包馅料了。', '/static/images/app/e637f79d74d04b0e8cb183dc61a6a02b_1280w_1024h.jpg', 14);
INSERT INTO `menu_step` VALUES (146, '62367bf1715643068596d263162a9157', '取一个小剂子压扁，放上一个黑芝麻馅（馅大概20-25克），我是拿勺子随意挖的有大有小', '/static/images/app/d377f1292488499fbb8197b80535c44e_1864w_1242h.jpg', 15);
INSERT INTO `menu_step` VALUES (147, '62367bf1715643068596d263162a9157', '慢慢收口，我为了拍照让我妈包的，这收口的趋势怎么感觉要去包饺子', '/static/images/app/25d298bc57244aaca2486344c1b41f98_1864w_1242h.jpg', 16);
INSERT INTO `menu_step` VALUES (148, '62367bf1715643068596d263162a9157', '好在最后没跑偏，开水上锅蒸15分钟就好。（注意：这是你最后见到他圆滚滚的样子了！因为黑芝麻馅料是软塌塌的，所以最后，它会塌！不要怀疑，肯定会塌！', '/static/images/app/348cd9b100354e63bf0fe94d084e4d12_1864w_1242h.jpg', 17);
INSERT INTO `menu_step` VALUES (149, '62367bf1715643068596d263162a9157', '瞧，塌了吧', '/static/images/app/ed474efc502748bf9bbf3cf4dd874ee2_1864w_1242h.jpg', 18);
INSERT INTO `menu_step` VALUES (150, '62367bf1715643068596d263162a9157', '这黑芝麻馅，再配上猪油，太香了吧！！真的好吃！不好吃你打我啊', '/static/images/app/718783ffffbf45729df7a1a396824bd7_1864w_1242h.jpg', 19);
INSERT INTO `menu_step` VALUES (151, 'f46d40f225bf4c92ba9def092509ed2a', '准备食材', '/static/images/app/c51f4df21a484dbba0a9bebdd5557923_1036w_1166h.jpg', 1);
INSERT INTO `menu_step` VALUES (152, 'f46d40f225bf4c92ba9def092509ed2a', '用以上调料调成酱汁待用', '/static/images/app/2d93f9c1ad9549068a07e4e6e83f2081_400w_462h.jpg', 2);
INSERT INTO `menu_step` VALUES (153, 'f46d40f225bf4c92ba9def092509ed2a', '热锅冷油，小火慢煎', '/static/images/app/22336a0f953944d0a9085733f986802c_2001w_1125h.jpg', 3);
INSERT INTO `menu_step` VALUES (154, 'f46d40f225bf4c92ba9def092509ed2a', '煎至两面金黄后盛出', '/static/images/app/c6d60141b5524e0996db8e76f5bb71aa_1518w_1122h.jpg', 4);
INSERT INTO `menu_step` VALUES (155, 'f46d40f225bf4c92ba9def092509ed2a', '爆香葱蒜末', '/static/images/app/5e7369a76fdd4f318ad8a71f86c0c97f_2001w_1125h.jpg', 5);
INSERT INTO `menu_step` VALUES (156, 'f46d40f225bf4c92ba9def092509ed2a', '倒入酱汁', '/static/images/app/70410e91b6734b38b7d8f533a3712fc2_1601w_1125h.jpg', 6);
INSERT INTO `menu_step` VALUES (157, 'f46d40f225bf4c92ba9def092509ed2a', '煮开后倒入杏鲍菇', '/static/images/app/84d0f8ee807b44049c720dac917edfc9_1035w_1125h.jpg', 7);
INSERT INTO `menu_step` VALUES (158, 'f46d40f225bf4c92ba9def092509ed2a', '翻炒均匀，大火收汁即可', '/static/images/app/feb01deafb9844eba444cd50920147a6_1528w_1122h.jpg', 8);
INSERT INTO `menu_step` VALUES (159, 'f46d40f225bf4c92ba9def092509ed2a', '盛出撒入葱花即可', '/static/images/app/120aefafab3d4b2abd5f04ebb74c2062_1017w_896h.jpg', 9);
INSERT INTO `menu_step` VALUES (160, 'f960eec54cc54c728b78ea46f0196900', '南瓜切块放入盘中 大火蒸五分钟', '/static/images/app/ddc5ff9e42c7457b8e9506b8c8e4ee5d_951w_807h.jpg', 1);
INSERT INTO `menu_step` VALUES (161, 'f960eec54cc54c728b78ea46f0196900', '蒸熟的南瓜趁热用勺子压成南瓜泥，加入适量白糖', '/static/images/app/722464472d60407ab002856fd3f22eaa_1152w_864h.jpg', 2);
INSERT INTO `menu_step` VALUES (162, 'f960eec54cc54c728b78ea46f0196900', '加入糯米粉和少量面粉，不用加水，直接揉成光滑的面团（加面粉可以使面团更有韧性，会更有口感）', '/static/images/app/7caa9f3559b1493db4fae447ed41abd6_1075w_864h.jpg', 3);
INSERT INTO `menu_step` VALUES (163, 'f960eec54cc54c728b78ea46f0196900', '然后扯成剂子压成饼就可以下锅啦，觉得吃不完的压成饼之后放进冰箱冷冻，下次可以直接炸。', '/static/images/app/aadf423525a7487f90c1e92798ea44aa_814w_812h.jpg', 4);
INSERT INTO `menu_step` VALUES (164, 'f960eec54cc54c728b78ea46f0196900', '锅中放少许油，炸至两面金黄就可以捞出。', '/static/images/app/38b03eedcc5f465383fe7f4442548197_862w_998h.jpg', 5);
INSERT INTO `menu_step` VALUES (165, 'f960eec54cc54c728b78ea46f0196900', '香酥的南瓜饼就做好啦', '/static/images/app/b62bbd0e0cf0464d851bd11750948562_845w_766h.jpg', 6);
INSERT INTO `menu_step` VALUES (166, 'c1b4703829a34a91b7af8e089a1f8549', '准备好所有食材，大头虾剪去虾须、虾钳后洗净备用', '/static/images/app/b0525d670eb34d42a89d263758e0e4a3_4000w_6000h.jpg', 1);
INSERT INTO `menu_step` VALUES (167, 'c1b4703829a34a91b7af8e089a1f8549', '入沸水焯烫至熟', '/static/images/app/3ff557c12764458cb0b99b911910756f_6000w_4000h.jpg', 2);
INSERT INTO `menu_step` VALUES (168, 'c1b4703829a34a91b7af8e089a1f8549', '将煮好的大头虾捞出浸入冷水中，使虾肉保持弹牙口感，然后再捞出沥干备用', '/static/images/app/136d0788a8f84af89b48efd16f8cdbaa_6000w_4000h.jpg', 3);
INSERT INTO `menu_step` VALUES (169, 'c1b4703829a34a91b7af8e089a1f8549', '将除了劲酒外的所有卤汁原料加入锅中，大火烧开后转中小火熬煮20分钟', '/static/images/app/a81e5f911b5e4df1b8f89405550eda74_6000w_4000h.jpg', 4);
INSERT INTO `menu_step` VALUES (170, 'c1b4703829a34a91b7af8e089a1f8549', '关火，倒入中国劲酒·金标混合均匀，即为醉卤汁', '/static/images/app/6d30072c659046d199b286f6727d74e7_6000w_4000h.jpg', 5);
INSERT INTO `menu_step` VALUES (171, 'c1b4703829a34a91b7af8e089a1f8549', '过滤醉卤汁，晾凉', '/static/images/app/5999756f3bca4f0090121a39559aae28_6000w_4000h.jpg', 6);
INSERT INTO `menu_step` VALUES (172, 'c1b4703829a34a91b7af8e089a1f8549', '取较深的容器，将大头虾和醉卤汁倒入，密封后放冰箱冷藏24小时以上后再取出食用即可', '/static/images/app/408e4668baf2444d830addc5efe9cba2_4000w_6000h.jpg', 7);
INSERT INTO `menu_step` VALUES (173, '032d9f1e7dd64cc1b3af8df456659550', '我用的是酒鬼花生，可能很多人不理解为什么甜品要用辣花生来做，其实我建议你们试一下，比选择更花生做出来好吃太多，辣辣的反倒不会觉得太甜太腻\r\n将花椒辣椒全挑出来，稍微有一点点辣椒沫沫没关系，但是花椒半个都不能留', '/static/images/app/220ea3fe6d2c11e7bc9d0242ac110002_4160w_3120h.jpg', 1);
INSERT INTO `menu_step` VALUES (174, '032d9f1e7dd64cc1b3af8df456659550', '将花生仁切碎，要均匀一点\r\n如果买的芝麻是生的，一定要下锅炒一下，超小火，不停搅拌芝麻，等芝麻在锅里噼里啪啦来回跳跃就可以了', '/static/images/app/e8485b0a6d2c11e7bc9d0242ac110002_3120w_4160h.jpg', 2);
INSERT INTO `menu_step` VALUES (175, '032d9f1e7dd64cc1b3af8df456659550', '抓一小把白糖，融化白糖，边融化边搅拌，等白糖全部融化成黄色就可以了，加入一小把花生碎搅拌一下，可以先加少一点，保证每个花生碎都裹上了糖浆，又没有多余的糖浆就可以了，如果糖浆太多，继续加一点花生碎，整个过程一定要快，快速观察快速加，不然糖浆会糊的', '/static/images/app/e310f35e6d2c11e7947d0242ac110002_3120w_4160h.jpg', 3);
INSERT INTO `menu_step` VALUES (176, '032d9f1e7dd64cc1b3af8df456659550', '要保证花生有颗粒感，大小差异又不能太大，否则擀的过程很难一气呵成', '/static/images/app/e44db7106d2d11e7947d0242ac110002_1280w_1280h.jpg', 4);
INSERT INTO `menu_step` VALUES (177, '032d9f1e7dd64cc1b3af8df456659550', '将锅内的已经裹匀糖浆的一坨快速倒到案板上，这个时候迅速用手将这一坨压实，如果觉得太烫，可以用刀或者擀面杖帮忙，如果不压实的话，擀开后就不能是连贯完整的一张，中间会有很多缝隙\r\n迅速将压好的一坨用擀面杖擀开，尽量擀成方形，以便切块', '/static/images/app/de82d0b86d2d11e7bc9d0242ac110002_1280w_1280h.jpg', 5);
INSERT INTO `menu_step` VALUES (178, '032d9f1e7dd64cc1b3af8df456659550', '还是迅速的切开，慢了的话糖浆干了，一切容易碎，边边角角不直很正常，自己吃掉就好', '/static/images/app/e92884fa6d2c11e7947d0242ac110002_3120w_4160h.jpg', 6);
INSERT INTO `menu_step` VALUES (179, '032d9f1e7dd64cc1b3af8df456659550', '将切好的花生酥和芝麻酥拿到另外一个案板上晾凉，小心轻拿轻放哦', '/static/images/app/f468189e6d2c11e7bc9d0242ac110002_3120w_4160h.jpg', 7);
INSERT INTO `menu_step` VALUES (180, '032d9f1e7dd64cc1b3af8df456659550', '几分钟就可以装盒了', '/static/images/app/f58abc366d2c11e7bc9d0242ac110002_3120w_4160h.jpg', 8);
INSERT INTO `menu_step` VALUES (181, '032d9f1e7dd64cc1b3af8df456659550', '装盒后看起来是不是高大上了许多', '/static/images/app/1654f29a6d2f11e7947d0242ac110002_1280w_1280h.jpg', 9);
INSERT INTO `menu_step` VALUES (182, '80a09b188ba845039696964cb03d218b', '准备材料：50克全脂奶粉，50克老姜，10克冰糖。', '/static/images/app/8f268e852b414076a944b998ece8fb74_3648w_2736h.jpg', 1);
INSERT INTO `menu_step` VALUES (183, '80a09b188ba845039696964cb03d218b', '用果汁机榨出姜汁，我用的是原汁机榨的，如果你没有原汁机，用料理机把姜打成姜蓉，然后过滤得姜汁也是可以的。', '/static/images/app/d7062fba7154401da4a692b50740f293_2736w_3648h.jpg', 2);
INSERT INTO `menu_step` VALUES (184, '80a09b188ba845039696964cb03d218b', '牛奶和冰糖放入小锅里，加一碗水烧开，煮牛奶的过程中，用筷子搅拌一下，保证冰糖全部溶化。\r\n煮好之后，关火，放置大约一分钟左右，让奶的温度降到70度左右，这点也非常关键，这里如果有温度计是最好的，如果没有温度计，可以用筷子沾一下，自己感觉一下温度。\r\n我一般是计算时间，冬天我就放置20秒钟左右，如果是夏天就放置一分钟。', '/static/images/app/db087a0f8e1441919bde5862d2ac5b0d_2420w_2567h.jpg', 3);
INSERT INTO `menu_step` VALUES (185, '80a09b188ba845039696964cb03d218b', '接下来是最好玩的一步了，要用奶撞姜了。撞姜之前，有非常重要的一步，那就是，用勺子搅一下姜汁，使其均匀，这一步也是影响姜撞奶是否凝固的关键一步。\r\n我的理解是，姜汁放时间长了，有益于凝固的那部分沉淀了，用勺子搅拌，使有利于凝固的部分均匀分步于姜汁当中。', '/static/images/app/27854f72ce484b92bc3fb3ba8de7ded7_2736w_3648h.jpg', 4);
INSERT INTO `menu_step` VALUES (186, '80a09b188ba845039696964cb03d218b', '把奶锅置于离姜汁高20厘米处，倒入盛姜汁的碗中，倒完后，不要搅拌，盖上盖子，让其静置两分钟左右。', '/static/images/app/ff4cccf5d0054ddaa9332e65d35858aa_2736w_3098h.jpg', 5);
INSERT INTO `menu_step` VALUES (187, '80a09b188ba845039696964cb03d218b', '两分钟后，再来观察，奶已经凝固了，把勺子放上去，勺子也不会沉下去。\r\n姜撞奶的表面也呈现出质地非常光滑细腻的光泽，看来就很诱人。', '/static/images/app/1cbfda6bf30d4a4c8de86d62d0570b17_3648w_2736h.jpg', 6);
INSERT INTO `menu_step` VALUES (188, '80a09b188ba845039696964cb03d218b', '赶紧吃一口吧，姜的辛味很好的平衡了奶的腻，而奶的香，又升华了姜的辣，真的是相得益彰啊。\r\n\r\n口感也是嫩嫩的，像吃豆腐奶一般，一口接一口，一碗马上就见底了。', '/static/images/app/4f5e34eafaa5450f9311b5d4a65279a9_2736w_3648h.jpg', 7);
INSERT INTO `menu_step` VALUES (189, 'f30b83378f924b1db4705d22dc21af2b', '将虾皮冲洗几遍，用水泡一小会儿', '/static/images/app/9aa8ea608cd911e6b87c0242ac110003_188w_252h.jpg', 1);
INSERT INTO `menu_step` VALUES (190, 'f30b83378f924b1db4705d22dc21af2b', '鸡蛋打入碗中，加入葱花、挤干水分的虾皮，再加入盐和白胡椒粉', '/static/images/app/9abe298e8cd911e6a9a10242ac110002_191w_253h.jpg', 2);
INSERT INTO `menu_step` VALUES (191, 'f30b83378f924b1db4705d22dc21af2b', '豆腐切块入开水锅中焯1-2分钟', '/static/images/app/9ae09bf48cd911e6a9a10242ac110002_194w_261h.jpg', 3);
INSERT INTO `menu_step` VALUES (192, 'f30b83378f924b1db4705d22dc21af2b', '捞出切小丁入鸡蛋碗中拌匀', '/static/images/app/9b02722e8cd911e6b87c0242ac110003_193w_259h.jpg', 4);
INSERT INTO `menu_step` VALUES (193, 'f30b83378f924b1db4705d22dc21af2b', '锅入植物油烧热，下入鸡蛋豆腐', '/static/images/app/9b2345f88cd911e6b87c0242ac110003_193w_258h.jpg', 5);
INSERT INTO `menu_step` VALUES (194, 'f30b83378f924b1db4705d22dc21af2b', '中火翻炒1-2分钟至干香即可', '/static/images/app/9b413f0e8cd911e6a9a10242ac110002_195w_263h.jpg', 6);
INSERT INTO `menu_step` VALUES (195, '156c052ca5584994bb84562ed48e18ff', '鲜虾背部剪开去虾线，把虾须跟头那一点剪掉，这样虾好入味，煮好之后吸虾头的汤汁，会让你欲罢不能', '/static/images/app/b14e994dec9d41f9b30cf2e5cc0cc6dd_1124w_1500h.jpg', 1);
INSERT INTO `menu_step` VALUES (196, '156c052ca5584994bb84562ed48e18ff', '买回来的花甲用清水加点海盐泡着', '/static/images/app/bc3ffc8fc6a44b83bdfbfabdabba8761_1124w_1500h.jpg', 2);
INSERT INTO `menu_step` VALUES (197, '156c052ca5584994bb84562ed48e18ff', '它们就会把沙吐出来', '/static/images/app/e39a56d8181746e98b3bd52f5b04c3e7_1124w_1500h.jpg', 3);
INSERT INTO `menu_step` VALUES (198, '156c052ca5584994bb84562ed48e18ff', '土豆切条，金针菇洗干净，备好材料', '/static/images/app/ad43b22023854d2a9576d78b1b93275c_1125w_1124h.jpg', 4);
INSERT INTO `menu_step` VALUES (199, '156c052ca5584994bb84562ed48e18ff', '划重点，把虾用油煎至两面变红，油量可以稍微多一点（这是让汤红亮鲜美的秘诀）', '/static/images/app/63f3ae4e607d430e9e812c137aa9ba18_1124w_1500h.jpg', 5);
INSERT INTO `menu_step` VALUES (200, '156c052ca5584994bb84562ed48e18ff', '把虾捞起来，加水烧开', '/static/images/app/ec13dd9b1734499eaad43780da7cbff2_1500w_1124h.jpg', 6);
INSERT INTO `menu_step` VALUES (201, '156c052ca5584994bb84562ed48e18ff', '加入香料茅根还有虾膏', '/static/images/app/69e3fed877fd4e39af8f1e5fe0fe4598_1125w_1125h.jpg', 7);
INSERT INTO `menu_step` VALUES (202, '156c052ca5584994bb84562ed48e18ff', '加入土豆，虾', '/static/images/app/b79ab35495e24952b0eab77b2f33c1dd_1124w_1500h.jpg', 8);
INSERT INTO `menu_step` VALUES (203, '156c052ca5584994bb84562ed48e18ff', '土豆煮的七成熟', '/static/images/app/051e078f225545c3b1e5bd6e48ed15cb_1124w_1500h.jpg', 9);
INSERT INTO `menu_step` VALUES (204, '156c052ca5584994bb84562ed48e18ff', '加入花甲，也可换成蛤蜊', '/static/images/app/3e6bebbb9b9b4617b8689ed34f7b2269_1124w_1500h.jpg', 10);
INSERT INTO `menu_step` VALUES (205, '156c052ca5584994bb84562ed48e18ff', '加入金针菇', '/static/images/app/9caa088c40b2454b8db84cc7d4823021_1124w_1500h.jpg', 11);
INSERT INTO `menu_step` VALUES (206, '156c052ca5584994bb84562ed48e18ff', '加入切好的鲜辣椒', '/static/images/app/5c18f440362e49ec9acc249a2d72d4b7_1500w_1124h.jpg', 12);
INSERT INTO `menu_step` VALUES (207, '156c052ca5584994bb84562ed48e18ff', '把青柠汁挤进去，加入椰浆炼乳', '/static/images/app/f54c4cdeada34a44aefede06c54a647b_1124w_1500h.jpg', 13);
INSERT INTO `menu_step` VALUES (208, '156c052ca5584994bb84562ed48e18ff', '加几片柠檬片，几根香菜装饰一下，出锅', '/static/images/app/91ed996fd6874055a9f26be4bf99589c_1124w_1318h.jpg', 14);
INSERT INTO `menu_step` VALUES (209, 'db4c21e2787a4c0f9e6c6db53d7678a2', '猪大肠买的是已经煮熟的回来清洗干净焯水后冷水冲洗沥干水份备用', '/static/images/app/94dda19f4b9248fea0ab8047338d3296_2179w_1600h.jpg', 1);
INSERT INTO `menu_step` VALUES (210, 'db4c21e2787a4c0f9e6c6db53d7678a2', '猪大肠切除小段', '/static/images/app/4130ae181fdc423cb8ed1f407d2feba2_1740w_1600h.jpg', 2);
INSERT INTO `menu_step` VALUES (211, 'db4c21e2787a4c0f9e6c6db53d7678a2', '锅中倒入油烧热放入花椒、大料、糖、蒜爆香', '/static/images/app/cbff4b338d7c408988e54191fcd52f02_2123w_1600h.jpg', 3);
INSERT INTO `menu_step` VALUES (212, 'db4c21e2787a4c0f9e6c6db53d7678a2', '锅中放入猪大肠翻炒', '/static/images/app/fd8330e7274941e29bd58ad6b663de2a_2233w_1600h.jpg', 4);
INSERT INTO `menu_step` VALUES (213, 'db4c21e2787a4c0f9e6c6db53d7678a2', '倒入蚝油、一品鲜酱油味道棒极了', '/static/images/app/49c407f8ec9749208e66be36783bdb08_2277w_1600h.jpg', 5);
INSERT INTO `menu_step` VALUES (214, 'db4c21e2787a4c0f9e6c6db53d7678a2', '放入调味料翻炒使每个猪大肠都能裹上鲜味', '/static/images/app/a8b032143e0941db96c19f280b7c6455_2039w_1600h.jpg', 6);
INSERT INTO `menu_step` VALUES (215, 'db4c21e2787a4c0f9e6c6db53d7678a2', '放入圆葱和青椒', '/static/images/app/59b8653cd0f447ddbd58edefde0aeaa7_1823w_1600h.jpg', 7);
INSERT INTO `menu_step` VALUES (216, 'db4c21e2787a4c0f9e6c6db53d7678a2', '放入红辣椒、盐、味精翻炒均匀入味', '/static/images/app/6d8d58227a1a47e7b50d0e18713e7591_2134w_1600h.jpg', 8);
INSERT INTO `menu_step` VALUES (217, 'db4c21e2787a4c0f9e6c6db53d7678a2', '最后撒上香菜提鲜即可出锅享用', '/static/images/app/82e9a5c05eb644efb697ab47550ad452_2134w_1600h.jpg', 9);
INSERT INTO `menu_step` VALUES (218, 'db4c21e2787a4c0f9e6c6db53d7678a2', '香香哒干锅肥肠装入盘中', '/static/images/app/656a3c8deb8c44bf880d53c39de25457_1124w_1078h.jpg', 10);
INSERT INTO `menu_step` VALUES (219, 'db4c21e2787a4c0f9e6c6db53d7678a2', '撒上白芝麻更加提高干锅肥肠的颜值哦', '/static/images/app/588095b9fe614153a29b3cd8a4efd7da_1440w_1078h.jpg', 11);
INSERT INTO `menu_step` VALUES (220, '683438c94bc945de9d4297b1cca20730', '先准备好材料，猪肉剁成馅，或者用现成的猪肉馅。虾仁处理干净。', '/static/images/app/751ba16a8e3811e6a9a10242ac110002_4368w_2912h.jpg', 1);
INSERT INTO `menu_step` VALUES (221, '683438c94bc945de9d4297b1cca20730', '3个鸡蛋，打散。', '/static/images/app/76cdd3d48e3811e6a9a10242ac110002_4368w_2912h.jpg', 2);
INSERT INTO `menu_step` VALUES (222, '683438c94bc945de9d4297b1cca20730', '热锅放油，中火，油稍微多一点，将鸡蛋炒熟炒散。用筷子快速搅动鸡蛋就是散的，不会变成大块。', '/static/images/app/786fa73a8e3811e6a9a10242ac110002_4368w_2912h.jpg', 3);
INSERT INTO `menu_step` VALUES (223, '683438c94bc945de9d4297b1cca20730', '炒出来后先放在一边，等会儿拌馅。', '/static/images/app/7af7edfa8e3811e6b87c0242ac110003_4368w_2912h.jpg', 4);
INSERT INTO `menu_step` VALUES (224, '683438c94bc945de9d4297b1cca20730', '接下来开始做饺子的面皮了。实在来不及或不会做的，可以去面超市里现成的饺子皮。但那样口感不好，太厚。\r\n面粉倒入大一点的盆里，加入一个鸡蛋，开始和面。\r\n这里注意了，如果使用的是专门的饺子面粉，就不要另外放鸡蛋了，否则面粉会太筋道。', '/static/images/app/7c7ed54e8e3811e6a9a10242ac110002_4368w_2912h.jpg', 5);
INSERT INTO `menu_step` VALUES (225, '683438c94bc945de9d4297b1cca20730', '用手朝一个方向和面，慢慢一点点加入凉水，边和边加，不要一下子倒太多。面差不多和在一起了就开始揉了，水要合适，少了面会硬，多了会太软。没做过的同学就多练练吧。', '/static/images/app/7dfba8fc8e3811e6a9a10242ac110002_4368w_2912h.jpg', 6);
INSERT INTO `menu_step` VALUES (226, '683438c94bc945de9d4297b1cca20730', '最后和出来的是要达到“面光，手光，盆光”。\r\n多揉一会儿，把面揉熟。', '/static/images/app/7f77fd488e3811e6b87c0242ac110003_4368w_2912h.jpg', 7);
INSERT INTO `menu_step` VALUES (227, '683438c94bc945de9d4297b1cca20730', '面团光滑后，用盆扣上，醒面15分钟，然后再揉一会儿。', '/static/images/app/80b00a3e8e3811e6a9a10242ac110002_4368w_2912h.jpg', 8);
INSERT INTO `menu_step` VALUES (228, '683438c94bc945de9d4297b1cca20730', '醒面的时候，可以拌馅。\r\n肉馅朝一个方向稍微搅散一点，猪肉馅在三鲜饺子里配角，起一个提升口感的作用，所以不需要太多。\r\n放入所有调料，生抽、盐、香油、白糖、胡椒粉。搅拌。', '/static/images/app/82417ae08e3811e6a9a10242ac110002_4368w_2912h.jpg', 9);
INSERT INTO `menu_step` VALUES (229, '683438c94bc945de9d4297b1cca20730', '肉拌好后，放入虾仁、之前炒好的鸡蛋，继续搅拌。', '/static/images/app/83a0825a8e3811e6b87c0242ac110003_4368w_2912h.jpg', 10);
INSERT INTO `menu_step` VALUES (230, '683438c94bc945de9d4297b1cca20730', '最后将韭菜剁碎，放入馅料中，搅拌均匀。', '/static/images/app/85d2655c8e3811e6b87c0242ac110003_4368w_2912h.jpg', 11);
INSERT INTO `menu_step` VALUES (231, '683438c94bc945de9d4297b1cca20730', '馅料的味道全看自己的口味，拌完后可以用舌头舔一下尝尝咸淡，淡了的话可以加点盐。\r\n三鲜的饺子不用放太多种调料，如十三香之类的，因为吃的就是韭菜和虾的鲜味儿。', '/static/images/app/874dddb28e3811e6a9a10242ac110002_4368w_2912h.jpg', 12);
INSERT INTO `menu_step` VALUES (232, '683438c94bc945de9d4297b1cca20730', '最后开始准备饺子皮。将醒好的面分成几小份，取一份中间掏洞，揪断，揉成长条。', '/static/images/app/8953a4c08e3811e6a9a10242ac110002_4368w_2912h.jpg', 13);
INSERT INTO `menu_step` VALUES (233, '683438c94bc945de9d4297b1cca20730', '想包大的，就揉粗一点，包小的就揉细一些。', '/static/images/app/8c301fe88e3811e6a9a10242ac110002_4368w_2912h.jpg', 14);
INSERT INTO `menu_step` VALUES (234, '683438c94bc945de9d4297b1cca20730', '滚刀切成小剂子。', '/static/images/app/8de1f1a48e3811e6b87c0242ac110003_4368w_2912h.jpg', 15);
INSERT INTO `menu_step` VALUES (235, '683438c94bc945de9d4297b1cca20730', '撒点干面粉以防粘在一起。\r\n把每个小剂子轻轻稍微压扁一点。', '/static/images/app/8f86b6668e3811e6b87c0242ac110003_4368w_2912h.jpg', 16);
INSERT INTO `menu_step` VALUES (236, '683438c94bc945de9d4297b1cca20730', '擀皮。', '/static/images/app/90188e428e3811e6a9a10242ac110002_2496w_1664h.jpg', 17);
INSERT INTO `menu_step` VALUES (237, '683438c94bc945de9d4297b1cca20730', '饺子皮', '/static/images/app/912c997c8e3811e6a9a10242ac110002_2496w_1664h.jpg', 18);
INSERT INTO `menu_step` VALUES (238, '683438c94bc945de9d4297b1cca20730', '包成后准备下锅。', '/static/images/app/92ef3dc88e3811e6a9a10242ac110002_2496w_1664h.jpg', 19);
INSERT INTO `menu_step` VALUES (239, '683438c94bc945de9d4297b1cca20730', '煮成出锅，皮薄馅足。', '/static/images/app/9445a1ee8e3811e6a9a10242ac110002_2496w_1664h.jpg', 20);
INSERT INTO `menu_step` VALUES (240, 'baa13029841947f3b27e0d003cb443a3', '食材准备', '/static/images/app/8385553e08d611e7bc9d0242ac110002_1280w_960h.jpg', 1);
INSERT INTO `menu_step` VALUES (241, 'baa13029841947f3b27e0d003cb443a3', '土豆去皮切块，放入冷水中浸泡去淀粉', '/static/images/app/83a2172808d611e7bc9d0242ac110002_1280w_1280h.jpg', 2);
INSERT INTO `menu_step` VALUES (242, 'baa13029841947f3b27e0d003cb443a3', '排骨冷水下锅，放入适量料酒和姜片煮沸腾，去血水', '/static/images/app/8991dbb408d611e7947d0242ac110002_1280w_1280h.jpg', 3);
INSERT INTO `menu_step` VALUES (243, 'baa13029841947f3b27e0d003cb443a3', '盛出备用，蒜葱切好', '/static/images/app/8635ef8c08d611e7947d0242ac110002_1280w_960h.jpg', 4);
INSERT INTO `menu_step` VALUES (244, 'baa13029841947f3b27e0d003cb443a3', '锅里倒油，炸一下土豆', '/static/images/app/84973e2e08d611e7947d0242ac110002_960w_1280h.jpg', 5);
INSERT INTO `menu_step` VALUES (245, 'baa13029841947f3b27e0d003cb443a3', '备用', '/static/images/app/84fd06a008d611e7bc9d0242ac110002_960w_1280h.jpg', 6);
INSERT INTO `menu_step` VALUES (246, 'baa13029841947f3b27e0d003cb443a3', '然后放入香叶，花椒，八角，豆瓣酱，姜片爆香', '/static/images/app/86cd6c5e08d611e7bc9d0242ac110002_960w_1280h.jpg', 7);
INSERT INTO `menu_step` VALUES (247, 'baa13029841947f3b27e0d003cb443a3', '倒入排骨翻炒', '/static/images/app/860d824008d611e7947d0242ac110002_960w_1280h.jpg', 8);
INSERT INTO `menu_step` VALUES (248, 'baa13029841947f3b27e0d003cb443a3', '然后倒入料酒呛锅，再倒入适量生抽', '/static/images/app/874574ec08d611e7947d0242ac110002_960w_1280h.jpg', 9);
INSERT INTO `menu_step` VALUES (249, 'baa13029841947f3b27e0d003cb443a3', '接着加与排骨齐平的热水，放入葱和干辣椒小火焖30分钟', '/static/images/app/892c7bac08d611e7947d0242ac110002_960w_1280h.jpg', 10);
INSERT INTO `menu_step` VALUES (250, 'baa13029841947f3b27e0d003cb443a3', '倒入翻炒过的土豆，再焖15分钟', '/static/images/app/87dcde7208d611e7947d0242ac110002_960w_1280h.jpg', 11);
INSERT INTO `menu_step` VALUES (251, 'baa13029841947f3b27e0d003cb443a3', '加点冰糖', '/static/images/app/890256e208d611e7bc9d0242ac110002_960w_1280h.jpg', 12);
INSERT INTO `menu_step` VALUES (252, 'baa13029841947f3b27e0d003cb443a3', '转大火收汁即可', '/static/images/app/897eadbe08d611e7bc9d0242ac110002_1280w_1103h.jpg', 13);
INSERT INTO `menu_step` VALUES (253, 'baa13029841947f3b27e0d003cb443a3', '完成', '/static/images/app/63a1a7f808d711e7947d0242ac110002_1280w_1024h.jpg', 14);
INSERT INTO `menu_step` VALUES (254, 'a7fb8e6391f244c09f23ab724eb18cc1', '鸡腿放在凉水里，倒料酒（去腥）也可以放姜片', '/static/images/app/e2eaf28addd34d2e88511aca5d135be9_3024w_3024h.jpg', 1);
INSERT INTO `menu_step` VALUES (255, 'a7fb8e6391f244c09f23ab724eb18cc1', '大火，煮开之后改小火，8分钟（不要盖锅盖）', '/static/images/app/c25127707ca74fc4a90ef3c995b866a3_3024w_3024h.jpg', 2);
INSERT INTO `menu_step` VALUES (256, 'a7fb8e6391f244c09f23ab724eb18cc1', '关火，盖盖子焖3分钟（以用筷子可以轻松插入为准，可以多焖些时间无妨），立即倒入凉水里冷却', '/static/images/app/fa2ebb6dff9144cebe3be33934ea4e11_3024w_3024h.jpg', 3);
INSERT INTO `menu_step` VALUES (257, 'a7fb8e6391f244c09f23ab724eb18cc1', '香葱、蒜、辣椒，切末', '/static/images/app/80e77fb9f9824b56884f7b360ff50980_3024w_3024h.jpg', 4);
INSERT INTO `menu_step` VALUES (258, 'a7fb8e6391f244c09f23ab724eb18cc1', '生抽2汤匙，醋3汤匙，香油1小匙，辣椒油1汤匙，花椒油1汤匙，糖1汤匙，根据自己口味加盐（所有调料汁以4个鸡腿量为准，鸡腿多少自己调整汤匙大小，比例不变）', '/static/images/app/e220dbdae1ea45e080e0b4325fe2060d_3024w_3024h.jpg', 5);
INSERT INTO `menu_step` VALUES (259, 'a7fb8e6391f244c09f23ab724eb18cc1', '酱料搅拌均匀', '/static/images/app/bf759b2391574ba98272c140c4adeb0c_3024w_3024h.jpg', 6);
INSERT INTO `menu_step` VALUES (260, 'a7fb8e6391f244c09f23ab724eb18cc1', '冷却的鸡腿手撕成丝（块小点入味快）', '/static/images/app/d2d88b9cb96243fea3c5c56534c959de_3024w_3024h.jpg', 7);
INSERT INTO `menu_step` VALUES (261, 'a7fb8e6391f244c09f23ab724eb18cc1', '均匀倒入料汁OK！不要太好吃哟', '/static/images/app/ffdb43acf7174132b513d41ff76d97f1_3024w_3024h.jpg', 8);
INSERT INTO `menu_step` VALUES (262, '06a449db80ad4a999a9c3b60b2faab01', '新鲜豌豆荚去壳，取出豆粒待用', '/static/images/app/651614d48f0611e6a9a10242ac110002_267w_200h.jpg', 1);
INSERT INTO `menu_step` VALUES (263, '06a449db80ad4a999a9c3b60b2faab01', '豌豆粒流水清洗干净，用淡盐水浸泡15分钟', '/static/images/app/655c1f1a8f0611e6a9a10242ac110002_266w_200h.jpg', 2);
INSERT INTO `menu_step` VALUES (264, '06a449db80ad4a999a9c3b60b2faab01', '大蒜子切米，小米辣切圈，香菇泡发切丁，酸菜浸泡清洗干净切碎', '/static/images/app/6624179a8f0611e6a9a10242ac110002_267w_200h.jpg', 3);
INSERT INTO `menu_step` VALUES (265, '06a449db80ad4a999a9c3b60b2faab01', '五花肉手剁成肉泥，用蛋清和少许盐腌制片刻，坐锅起油，将肉泥滑散，乘出待用', '/static/images/app/6660c0e68f0611e6b87c0242ac110003_267w_200h.jpg', 4);
INSERT INTO `menu_step` VALUES (266, '06a449db80ad4a999a9c3b60b2faab01', '坐锅起油，下酸菜和香菇丁爆香\r\n，加入小米辣圈圈爆香', '/static/images/app/66a3a8c08f0611e6b87c0242ac110003_266w_200h.jpg', 5);
INSERT INTO `menu_step` VALUES (267, '06a449db80ad4a999a9c3b60b2faab01', '下沥干水的豌豆粒，加盐不断翻炒，直至豌豆表面即将出现爆裂花纹', '/static/images/app/66e81ee28f0611e6b87c0242ac110003_267w_200h.jpg', 6);
INSERT INTO `menu_step` VALUES (268, '06a449db80ad4a999a9c3b60b2faab01', '下滑散的肉泥和大蒜末，翻炒均匀', '/static/images/app/672612608f0611e6a9a10242ac110002_267w_200h.jpg', 7);
INSERT INTO `menu_step` VALUES (269, '06a449db80ad4a999a9c3b60b2faab01', '下蒸鱼豉油和陈醋，翻炒均匀，淋麻油，炒匀出锅即可', '/static/images/app/675c8d868f0611e6a9a10242ac110002_266w_200h.jpg', 8);
INSERT INTO `menu_step` VALUES (270, 'fb9c9a26f6a448bb91d42b840d076d27', '取锅烧水，水开后放入挂面，中火煮3分钟，至面条八分熟', '/static/images/app/f2031340b63541d5a124cc678676126d_744w_868h.jpg', 1);
INSERT INTO `menu_step` VALUES (271, 'fb9c9a26f6a448bb91d42b840d076d27', '挂面捞出，加入鸡蛋，黑胡椒粉，食盐拌匀', '/static/images/app/725918bbf5de40e19f1bf1822a8430cb_737w_838h.jpg', 2);
INSERT INTO `menu_step` VALUES (272, 'fb9c9a26f6a448bb91d42b840d076d27', '把拌好的挂面披萨底铺在披萨盘中，上面涂上一层披萨酱，用勺子涂抹均匀，', '/static/images/app/5fae75e1bf534a02acf2179c1086a34e_744w_700h.jpg', 3);
INSERT INTO `menu_step` VALUES (273, 'fb9c9a26f6a448bb91d42b840d076d27', '再撒上一些披萨香草，我用了牛至叶粉，铺上马苏里拉芝士，', '/static/images/app/63e405a9010c416a8198fbf6552b2ee7_743w_728h.jpg', 4);
INSERT INTO `menu_step` VALUES (274, 'fb9c9a26f6a448bb91d42b840d076d27', '铺上彩蔬丁，火腿肠片，再撒一些芝士，', '/static/images/app/aba53db105114ce29bd220c1a608c328_739w_806h.jpg', 5);
INSERT INTO `menu_step` VALUES (275, 'fb9c9a26f6a448bb91d42b840d076d27', '再来一层彩蔬丁，大虾仁，我还加了几个小番茄，', '/static/images/app/29e8c9ea150b43e7867a1d33d65128b5_744w_868h.jpg', 6);
INSERT INTO `menu_step` VALUES (276, 'fb9c9a26f6a448bb91d42b840d076d27', '顶部铺上一层马苏里拉芝士，自己做芝士多放点哦，满满的芝士看着都诱人~', '/static/images/app/7f2825fe27e445729539eea4fd7e114e_744w_796h.jpg', 7);
INSERT INTO `menu_step` VALUES (277, 'fb9c9a26f6a448bb91d42b840d076d27', '送去烤箱，190度上下火烤20分钟，至芝士融化虾仁熟透变红~', '/static/images/app/137662690b5d476e8817100e61faed02_920w_718h.jpg', 8);
INSERT INTO `menu_step` VALUES (278, 'fb9c9a26f6a448bb91d42b840d076d27', '美味的挂面披萨，一起来吃吧~', '/static/images/app/7bbe2c8fcec647ecae638a670e5803eb_728w_975h.jpg', 9);
INSERT INTO `menu_step` VALUES (279, '6d0513e76e344e68911cbd7acb87669b', '准备食材:中豆腐(不是老豆腐也不是嫩豆腐)，三岛照烧汁，炒香的芝麻，一根香葱。', '/static/images/app/bcd9ff911dbf42cdb9a41b0f9d164b9e_1280w_960h.jpg', 1);
INSERT INTO `menu_step` VALUES (280, '6d0513e76e344e68911cbd7acb87669b', '豆腐切立方块。', '/static/images/app/611f58d467e94af1ae449b4645975dbd_1280w_960h.jpg', 2);
INSERT INTO `menu_step` VALUES (281, '6d0513e76e344e68911cbd7acb87669b', '不粘锅放油，放豆腐煎成金黄色。', '/static/images/app/5e149aaa5a674938926e42f57d38281a_1632w_1224h.jpg', 3);
INSERT INTO `menu_step` VALUES (282, '6d0513e76e344e68911cbd7acb87669b', '放三岛照烧汁。', '/static/images/app/e5ca3d14a7af45d096fc6275ea2fd4a8_1632w_1224h.jpg', 4);
INSERT INTO `menu_step` VALUES (283, '6d0513e76e344e68911cbd7acb87669b', '加半碗水，中火煮，让豆腐充分吸收照烧汁水。', '/static/images/app/5dcc2a8bbdcc48d3bbece800a2a58606_1632w_1224h.jpg', 5);
INSERT INTO `menu_step` VALUES (284, '6d0513e76e344e68911cbd7acb87669b', '大火收汁。\r\n~根据个人口味可适当加少许盐。', '/static/images/app/e9dfdb9f839045bda5c7b1636d3b7144_1632w_1224h.jpg', 6);
INSERT INTO `menu_step` VALUES (285, '6d0513e76e344e68911cbd7acb87669b', '盛盘，撒炒香的芝麻和葱花点缀一下。', '/static/images/app/a06024bd04864f839095f7d9b66ed4ba_1632w_1224h.jpg', 7);
INSERT INTO `menu_step` VALUES (286, '2c107b88df964d0fb3b12067ad959924', '日本豆腐.\r\n连包装.\r\n中间切开.一条切成6块..', '/static/images/app/a3fa616cf83f11e6947d0242ac110002_1280w_855h.jpg', 1);
INSERT INTO `menu_step` VALUES (287, '2c107b88df964d0fb3b12067ad959924', '把豆腐放淀粉碗里.\r\n均匀裹上一层粉..\r\n\r\n翻滚吧.兄弟....', '/static/images/app/a3d0b7e0f83f11e6947d0242ac110002_1280w_855h.jpg', 2);
INSERT INTO `menu_step` VALUES (288, '2c107b88df964d0fb3b12067ad959924', '锅里放油.\r\n油要多一些.\r\n豆腐一次少放一点.\r\n不然会粘住！', '/static/images/app/a3f0a7b2f83f11e6bc9d0242ac110002_1280w_855h.jpg', 3);
INSERT INTO `menu_step` VALUES (289, '2c107b88df964d0fb3b12067ad959924', '炸至金黄色捞出...\r\n', '/static/images/app/a43727bef83f11e6947d0242ac110002_1280w_855h.jpg', 4);
INSERT INTO `menu_step` VALUES (290, '2c107b88df964d0fb3b12067ad959924', '锅里放一点底油..\r\n\r\n放入大蒜爆香..！', '/static/images/app/a4856870f83f11e6947d0242ac110002_1280w_855h.jpg', 5);
INSERT INTO `menu_step` VALUES (291, '2c107b88df964d0fb3b12067ad959924', '放入洋葱.香菇翻炒出香味..', '/static/images/app/a548331ef83f11e6bc9d0242ac110002_1280w_855h.jpg', 6);
INSERT INTO `menu_step` VALUES (292, '2c107b88df964d0fb3b12067ad959924', '放入辣椒碎..', '/static/images/app/a631e34cf83f11e6bc9d0242ac110002_1280w_855h.jpg', 7);
INSERT INTO `menu_step` VALUES (293, '2c107b88df964d0fb3b12067ad959924', '放入日本豆腐..', '/static/images/app/a6aedad2f83f11e6bc9d0242ac110002_1280w_855h.jpg', 8);
INSERT INTO `menu_step` VALUES (294, '2c107b88df964d0fb3b12067ad959924', '把调料汁倒入..', '/static/images/app/a56f65baf83f11e6947d0242ac110002_1280w_855h.jpg', 9);
INSERT INTO `menu_step` VALUES (295, '2c107b88df964d0fb3b12067ad959924', '快速搅拌均匀..\r\n\r\n温柔一些.\r\n别把豆腐捣烂了..', '/static/images/app/5197992af9cb11e6bc9d0242ac110002_1280w_855h.jpg', 10);
INSERT INTO `menu_step` VALUES (296, '2c107b88df964d0fb3b12067ad959924', '把之前裹豆腐没用完的粉.\r\n加一些水.\r\n淋入锅中..\r\n\r\n要根据情况勾芡.\r\n不能倒太多了..', '/static/images/app/a5fc8346f83f11e6bc9d0242ac110002_1280w_855h.jpg', 11);
INSERT INTO `menu_step` VALUES (297, '2c107b88df964d0fb3b12067ad959924', '勾芡好了后.\r\n撒葱花..\r\n\r\n喜欢吃鸡精的可以放一些！', '/static/images/app/a6994d52f83f11e6bc9d0242ac110002_1280w_855h.jpg', 12);
INSERT INTO `menu_step` VALUES (298, '2c107b88df964d0fb3b12067ad959924', '装..盘..开..吃...！', '/static/images/app/daf5b134f84511e6947d0242ac110002_1280w_856h.jpg', 13);
INSERT INTO `menu_step` VALUES (299, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '买鱼的时候，老板都会把鱼杀好清洗干净,但拿回家后还要再处理一遍：鱼背的鱼鳞要刮干净，鱼腹内的淤血和黑膜一定要冲洗干净，不然蒸出来会非常腥，再用厨房纸把鱼表面的水份擦干（清蒸鱼不腥的关键，一定要将鱼清洗干净并将表面的水份擦干）；', '/static/images/app/a6a7e026b34445839a4bad8acf8c32e1_3721w_2790h.jpg', 1);
INSERT INTO `menu_step` VALUES (300, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '鱼腮处抹一点点胡椒粉去腥；', '/static/images/app/e400830d3ee74534add155972aa14f71_3736w_2802h.jpg', 2);
INSERT INTO `menu_step` VALUES (301, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '鱼身四周先抹一点点玉米油，再抹一点点料酒，最后抹上一层薄薄的盐（盐不要多，适量就好，抹多了肉容易柴）；', '/static/images/app/000f80f10bea44c5af831952d7a35794_3024w_2268h.jpg', 3);
INSERT INTO `menu_step` VALUES (302, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '鱼肚子里面放几小块姜片，腌十分钟。', '/static/images/app/df30e99a1e7a45f4a1eb829ffa70128c_2048w_1536h.jpg', 4);
INSERT INTO `menu_step` VALUES (303, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '鱼盘底部先垫几条葱段或是架一双筷子，目的是把鱼架子上面，蒸鱼的时候底部的鱼肉不会浸在蒸鱼的汤汁里，让鱼肉变腥。', '/static/images/app/f072a5e397354a86885fc4329495b8b1_3801w_2851h.jpg', 5);
INSERT INTO `menu_step` VALUES (304, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '将腌制好的鱼放在葱段（或筷子）上面，切点姜丝放到鱼肉的上面。', '/static/images/app/4997254356244079aa5c2652fd862882_3874w_2905h.jpg', 6);
INSERT INTO `menu_step` VALUES (305, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '蒸锅放入足量的水把水烧开再放入鲈鱼，开大火蒸8分钟左右。（一定要把水烧开后再放鱼去蒸，这样鱼的外部因突遇高温后立即收缩，内部鲜汁不外流，鱼蒸熟后味道会更鲜美），\r\n蒸好的鱼，盘子里会有很多的汁水出来，这个汁水比较腥一定要倒掉，把鱼底下的葱段、肚里的姜片和表面的姜丝也扔掉。', '/static/images/app/294f57c032b64b149ee5b8b6beff55bb_2793w_2094h.jpg', 7);
INSERT INTO `menu_step` VALUES (306, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '在鱼上面重新放入新切的姜丝和葱丝；', '/static/images/app/f8a15fba16d145e89b1498d71ff54c3c_3072w_2304h.jpg', 8);
INSERT INTO `menu_step` VALUES (307, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '炒锅中倒入蒸鱼鼓油（或味极鲜酱油），把酱油烧开后淋到鱼身上', '/static/images/app/6080d74dc2da43a9a22324e49160c3dd_2037w_1527h.jpg', 9);
INSERT INTO `menu_step` VALUES (308, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '另起锅放玉米油，大火将油烧热至冒烟的状态（油温至少要180度以上）；', '/static/images/app/4cd5e575a55f4b55950648b74d89a9cd_1693w_1270h.jpg', 10);
INSERT INTO `menu_step` VALUES (309, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '将烧热的油快速均匀的从头浇到尾淋到鱼身上（淋的时候能听到滋滋的响声），这一步可以充分释放姜和葱的香味，渗入鱼纤维里，激发鱼的鲜香味。', '/static/images/app/51291adde8da4761a96b5c4df6c0f522_3072w_2302h.jpg', 11);
INSERT INTO `menu_step` VALUES (310, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '准备材料，鱿鱼可以买的时候让老板杀好', '/static/images/app/dfc6d77c617d49cda8694074b23fe187_2048w_1536h.jpg', 1);
INSERT INTO `menu_step` VALUES (311, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '撕去黑膜', '/static/images/app/37171bb0b4504557867e41dc98a85ae7_2304w_3072h.jpg', 2);
INSERT INTO `menu_step` VALUES (312, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '去掉粘膜', '/static/images/app/314815934a6f47ad911981d0c1900d3b_1536w_2048h.jpg', 3);
INSERT INTO `menu_step` VALUES (313, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '鱿鱼肉不打刀花口感会差很多，而且不容易熟，但是要彻底烧熟又容易老，而且鱿鱼表皮太光滑不好入味，所以一定要打刀花。先像这样斜着划，别划太轻了，不然成不了好看的玉米花纹', '/static/images/app/e7bb9dd36fba4bdabd053bdd145941ed_2304w_3072h.jpg', 4);
INSERT INTO `menu_step` VALUES (314, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '全部均匀的划好', '/static/images/app/50bb7c53d77d4f6daa0d56011fd87bf8_1536w_2048h.jpg', 5);
INSERT INTO `menu_step` VALUES (315, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '换个方向90度角继续划', '/static/images/app/2e66718710cf4e6baad7e93564f44d63_2290w_1536h.jpg', 6);
INSERT INTO `menu_step` VALUES (316, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '全部划好（你们不打算夸一下我的刀工吗(*￣︶￣)', '/static/images/app/de10b4c9e52346c3ad8f054e9f1ea115_2304w_3072h.jpg', 7);
INSERT INTO `menu_step` VALUES (317, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '切成小块', '/static/images/app/9e5cec3fb3b84c15a7cb154fb194e0e7_3072w_2304h.jpg', 8);
INSERT INTO `menu_step` VALUES (318, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '把鱿鱼须切断（内啥，这个黑膜去不去随意哈）', '/static/images/app/cfc94eec0a5f4539923cd43a5f18c4e5_3072w_2304h.jpg', 9);
INSERT INTO `menu_step` VALUES (319, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '接着切鱿鱼触角', '/static/images/app/c03de4a6a58e4c19988fdd04dad2f8d0_1535w_2048h.jpg', 10);
INSERT INTO `menu_step` VALUES (320, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '对半剖开', '/static/images/app/4a62deed5d5046698305e48213bdf617_1536w_2184h.jpg', 11);
INSERT INTO `menu_step` VALUES (321, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '去除软骨。所有的都这样切好哦', '/static/images/app/97c5241eab484e39bcd0925050040066_1536w_2048h.jpg', 12);
INSERT INTO `menu_step` VALUES (322, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '将配料切好，辣椒斜着切', '/static/images/app/37f3962eb815459abd78b83b70ec4a7d_2048w_1536h.jpg', 13);
INSERT INTO `menu_step` VALUES (323, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '锅内烧开水之后把切好的鱿鱼倒下去', '/static/images/app/b168accc3fa64c258e08c727dd892c60_1536w_2220h.jpg', 14);
INSERT INTO `menu_step` VALUES (324, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '烫两秒钟立马捞起来，时间一定不要长', '/static/images/app/60590cbe3d90462ba9b915e92fa44ede_1629w_2046h.jpg', 15);
INSERT INTO `menu_step` VALUES (325, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '锅内放油烧热，这道菜全程大火哦', '/static/images/app/d1d5e29b78da44ffa567016c2784a5ef_2304w_3072h.jpg', 16);
INSERT INTO `menu_step` VALUES (326, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '把配料倒进去', '/static/images/app/01d157905b3e45118df40a3d9f57fb5d_1536w_2048h.jpg', 17);
INSERT INTO `menu_step` VALUES (327, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '翻炒一分钟后加盐', '/static/images/app/c9a7910597a94039b2b7d665aba453d4_2304w_3072h.jpg', 18);
INSERT INTO `menu_step` VALUES (328, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '加生抽，翻炒均匀', '/static/images/app/2828a8073f534cbbb403f4d2057628b8_1536w_2048h.jpg', 19);
INSERT INTO `menu_step` VALUES (329, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '一点哦，我这里拍完后又去沥了一下', '/static/images/app/498c574ed32f40c5a0898a3a40ac2c5b_1536w_2244h.jpg', 20);
INSERT INTO `menu_step` VALUES (330, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '加入白糖', '/static/images/app/ad9fd71704f844e5a58f939215204021_2304w_3072h.jpg', 21);
INSERT INTO `menu_step` VALUES (331, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '秘籍在这里！均匀撒入孜然粉，然后快速翻炒出锅。孜然粉和鱿鱼是绝配啊绝配，即使不放料酒，只放孜然粉也完全吃不出腥味的', '/static/images/app/f5e6264b6a1e4898a4e569f5693d0543_1536w_2220h.jpg', 22);
INSERT INTO `menu_step` VALUES (332, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '鲜嫩多汁QQ弹弹的爆炒鱿鱼就做好啦', '/static/images/app/6a7419ce47234a248eb5dcf7d489a4d6_1616w_1080h.jpg', 23);
INSERT INTO `menu_step` VALUES (333, 'd81329e6c383451699d856a1f71d25b2', '五花肉切丁腌制备用，胡萝卜切丁，紫菜洗干净挤干水份，葱切成葱花备用。', '/static/images/app/409c79633a5f40f4997c475c6041dc55_780w_780h.jpg', 1);
INSERT INTO `menu_step` VALUES (334, 'd81329e6c383451699d856a1f71d25b2', '面粉里放盐、糖、酵母粉，慢慢加入水用筷子搅拌成絮状，再用手揉成一个光滑的面团，放盆里盖保鲜膜发酵成2倍大。', '/static/images/app/4290584bb3f144dd94c7a0b65845e1ea_780w_780h.jpg', 2);
INSERT INTO `menu_step` VALUES (335, 'd81329e6c383451699d856a1f71d25b2', '面团发酵的时候，我们来调制紫菜肉馅，将腌制好的肉和紫菜、胡萝卜丁放在一个盆里，放点生抽，盐，味精，香油搅拌均匀备用。\r\n\r\n葱花包的时候再拌。', '/static/images/app/ce03bfc9f9254852b42056026ffd6366_780w_780h.jpg', 3);
INSERT INTO `menu_step` VALUES (336, 'd81329e6c383451699d856a1f71d25b2', '发酵好的面团，手指沾面粉插入，不回缩不塌陷就是发好了。', '/static/images/app/5746e1ca4eea421ebb4c33c018af540a_780w_780h.jpg', 4);
INSERT INTO `menu_step` VALUES (337, 'd81329e6c383451699d856a1f71d25b2', '发好的面团取出稍微揉揉排气，再均分成9份。', '/static/images/app/f61c075d83ed486c855623670f45bae5_780w_780h.jpg', 5);
INSERT INTO `menu_step` VALUES (338, 'd81329e6c383451699d856a1f71d25b2', '把分好的小面团擀成圆形，放入调好味的馅料，馅料不能放的太多，以包好面皮表面不会透馅为宜，面皮太薄容易爆。', '/static/images/app/7bbf2f5234ce4f5ea48d4c6b667d1650_720w_576h.jpg', 6);
INSERT INTO `menu_step` VALUES (339, 'd81329e6c383451699d856a1f71d25b2', '像包包子一样收口，收口一定要收紧，不然烤的时候会爆。', '/static/images/app/cde2baa72ecb4ac4a583f85d4f9cd965_720w_576h.jpg', 7);
INSERT INTO `menu_step` VALUES (340, 'd81329e6c383451699d856a1f71d25b2', '拿一个平盘放上芝麻，把饼坯的表面用刷子刷上水，再放到芝麻盘里轻压，让饼坯的表面均匀的沾上芝麻，拿起来轻压芝麻表面，让芝麻沾的更牢固些。\r\n\r\n包剩下两三个的时候，就可以先预热烤箱了，上下火180度预热。', '/static/images/app/0681df4d9ab84aa482b29e11411069d6_720w_576h.jpg', 8);
INSERT INTO `menu_step` VALUES (341, 'd81329e6c383451699d856a1f71d25b2', '把沾好芝麻的饼放到烤盘，用手轻轻的按扁。丨', '/static/images/app/68691792f99140178e11fe9bdde91006_780w_780h.jpg', 9);
INSERT INTO `menu_step` VALUES (342, 'd81329e6c383451699d856a1f71d25b2', '全部包好后，放进180度预热好的烤箱，烤35分钟即可，中途观察上色满意盖锡纸，避免烤糊了。', '/static/images/app/0c3948e42a4a4aeba7662cfa810ba49b_780w_780h.jpg', 10);
INSERT INTO `menu_step` VALUES (343, 'd81329e6c383451699d856a1f71d25b2', '切一个看看，是不是很诱人啊，刚出炉的饼是酥脆的，超级好吃哦!', '/static/images/app/5dd5d854f71749908278b2f3531d2ba9_780w_780h.jpg', 11);
INSERT INTO `menu_step` VALUES (344, 'd81329e6c383451699d856a1f71d25b2', '自己做的干净卫生，猪肉也是买好的肉，外面卖的真心不知道用的是不是好肉', '/static/images/app/fbf48fc6911e494d8448b26662872163_780w_780h.jpg', 12);
INSERT INTO `menu_step` VALUES (345, '699452b7d68942a2a0e4aee592b79e1e', '材料集合', '/static/images/app/fce17fe79fe2421cab65d03814824f50_1688w_1124h.jpg', 1);
INSERT INTO `menu_step` VALUES (346, '699452b7d68942a2a0e4aee592b79e1e', '剔除多余油脂 用纸巾擦干水分（可以用牙签扎些小眼儿入味更好）', '/static/images/app/1516c65de1ac40b0b465b173e39073c0_1126w_1124h.jpg', 2);
INSERT INTO `menu_step` VALUES (347, '699452b7d68942a2a0e4aee592b79e1e', '所有调料放下袋子里和鸡腿抓匀，放入冰箱隔夜（推荐隔夜，或者早晨腌晚上吃）', '/static/images/app/fc0f26e5ef45400d8ec1ceca85555ceb_1126w_1124h.jpg', 3);
INSERT INTO `menu_step` VALUES (348, '699452b7d68942a2a0e4aee592b79e1e', '第二天拿出来铺在烤架上 我切了一点儿土豆 ，因为我特别喜欢鸡汁儿烤土豆的味儿！（土豆滚刀块用橄榄油 薄盐 黑胡椒随便抓了一下）', '/static/images/app/f6a98105c8dd436d942c53e7d48c9b95_1688w_1124h.jpg', 4);
INSERT INTO `menu_step` VALUES (349, '699452b7d68942a2a0e4aee592b79e1e', '我又在鸡腿上撒了一层调料中的干料 口味淡的可以不再撒一遍 罗勒丝装饰了一下', '/static/images/app/be95c1e70b6143ddbcdb9aa95b2f0378_1124w_1124h.jpg', 5);
INSERT INTO `menu_step` VALUES (350, '699452b7d68942a2a0e4aee592b79e1e', '烤箱220度预热', '/static/images/app/057aab65d0c442b1a2ede1b8b9011503_1688w_1124h.jpg', 6);
INSERT INTO `menu_step` VALUES (351, '699452b7d68942a2a0e4aee592b79e1e', '放入预热好的烤箱中层 220度30min', '/static/images/app/295fa30de7d74ccd847eda612052379b_1688w_1124h.jpg', 7);
INSERT INTO `menu_step` VALUES (352, '699452b7d68942a2a0e4aee592b79e1e', '能看到皮上的油脂在流淌吗！哈哈哈哈哈 超级馋人 这时候已经满屋香味儿了！', '/static/images/app/33019e86b95a4c62ae99ada21c6aa3e4_1124w_1124h.jpg', 8);
INSERT INTO `menu_step` VALUES (353, '699452b7d68942a2a0e4aee592b79e1e', '烤熟表皮的样子～看起来超级香啊有木有！', '/static/images/app/bff98276f6ae4403867e253b7e0ed0af_1688w_1124h.jpg', 9);
INSERT INTO `menu_step` VALUES (354, 'addea5aaa26f470c90dcf8b164f24a22', '提前30分钟用凉水泡上干丝。\r\n鸡肉块抹上盐和黑胡椒腌15分钟。', NULL, 1);
INSERT INTO `menu_step` VALUES (355, 'addea5aaa26f470c90dcf8b164f24a22', '锅热后，放一点油，放入洋葱丝，不要翻动，煎3-4分钟，到洋葱底部变色，然后翻一面，放入蒜片、辣椒，继续煎，时不时搅拌，煎到洋葱透明焦化。', NULL, 2);
INSERT INTO `menu_step` VALUES (356, 'addea5aaa26f470c90dcf8b164f24a22', '煎洋葱时，在小碗里调好酱油、味霖/米酒、鱼露、辣酱、蜂蜜、鲜姜末、香油备用。', NULL, 3);
INSERT INTO `menu_step` VALUES (357, 'addea5aaa26f470c90dcf8b164f24a22', '把洋葱拔拉到一边，放入鸡肉，也不要翻动，直到煎到鸡肉底部变色，翻面煎到整个鸡肉变色，倒入步骤3调好的汁，炒匀。', NULL, 4);
INSERT INTO `menu_step` VALUES (358, 'addea5aaa26f470c90dcf8b164f24a22', '放入胡萝卜、土豆、蘑菇，炒匀，加1杯水（如果一会煮的粉条多，就适量多放些水），煮开，盖盖子，小火闷10-15分钟。', NULL, 5);
INSERT INTO `menu_step` VALUES (359, 'addea5aaa26f470c90dcf8b164f24a22', '10分钟后翻拌一下，放入粉条或干丝，煮开，继续小火闷5-10分钟，到所有食材变软。', NULL, 6);
INSERT INTO `menu_step` VALUES (360, 'addea5aaa26f470c90dcf8b164f24a22', '出锅撒小葱段、白芝麻、香油，尝尝味道适当加盐调味。', NULL, 7);
INSERT INTO `menu_step` VALUES (361, 'd613d080aed84a96be974e9f7cabcdc7', '鸡胸肉洗净切成手指粗的粗条', '/static/images/app/ec14d6334b4542cd829090c177bdb5c5_864w_864h.jpg', 1);
INSERT INTO `menu_step` VALUES (362, 'd613d080aed84a96be974e9f7cabcdc7', '切好的鸡胸肉中放入适量料酒，盐抓匀，腌制20分钟(为了让鸡胸肉口感更加嫩滑，我放了少量蛋清)', '/static/images/app/e9a0c3d2bccc438baa8ac1af9321f006_1080w_1080h.jpg', 2);
INSERT INTO `menu_step` VALUES (363, 'd613d080aed84a96be974e9f7cabcdc7', '腌制好的鸡胸肉中打入一颗鸡蛋，并放入适量淀粉，抓拌均匀，肉条表面完全包裹蛋液和淀粉。', '/static/images/app/a9388e30dd62409a91a58e9637e4868a_1080w_1080h.jpg', 3);
INSERT INTO `menu_step` VALUES (364, 'd613d080aed84a96be974e9f7cabcdc7', '锅中加入油，油温5成热时将肉条下锅炸。', '/static/images/app/cc8f219b3c044b5f93f4f6d5cae30387_864w_864h.jpg', 4);
INSERT INTO `menu_step` VALUES (365, 'd613d080aed84a96be974e9f7cabcdc7', '炸至表面发黄盛出控油', '/static/images/app/411a619117d9451c8434b37ca74e84bc_864w_864h.jpg', 5);
INSERT INTO `menu_step` VALUES (366, 'd613d080aed84a96be974e9f7cabcdc7', '再复炸一次，让表皮更加酥脆，炸好捞出备用。', '/static/images/app/78f8e5a743ca4efea3ddf2b3c08956b7_864w_864h.jpg', 6);
INSERT INTO `menu_step` VALUES (367, 'd613d080aed84a96be974e9f7cabcdc7', '按番茄酱:白糖:白醋=5:3:1的比例调糖醋汁，可根据个人口味不同进行调整。', '/static/images/app/7f5a325e8f0d4a38b25c6d5c06a55396_864w_864h.jpg', 7);
INSERT INTO `menu_step` VALUES (368, 'd613d080aed84a96be974e9f7cabcdc7', '锅中放油，再倒入调好的糖醋汁，然后放入炸好的鸡胸肉翻拌均匀，出锅撒上少量白芝麻就完成了。', '/static/images/app/11879c4301cb46408fb9b8123e0d438c_864w_864h.jpg', 8);
INSERT INTO `menu_step` VALUES (369, '5c229206192f46938049a0e10ff5b718', '五花肉切片，1-2cm宽左右不要太薄了，豆角掐去两边的两条根茎（不要偷懒，不然吃的时候有那种老茎好难受的），切大拇指长短的小段，小葱切葱花\r\n\r\n面条买市场里面新鲜的手擀面\r\n真的不要嫌麻烦~\r\n切忌不能用挂面会糊的~', NULL, 1);
INSERT INTO `menu_step` VALUES (370, '5c229206192f46938049a0e10ff5b718', '锅里少许油先炒五花肉，逼出肥油后将五花肉捞出来，五花肉会逼出肥油，所以加一点点油就好啦，如果你的五花肉超级肥，甚至可以不加油~\r\n\r\n逼出的肥油炒豆角会更好吃，而且油煎过的五花肉就没有那么腻了', NULL, 2);
INSERT INTO `menu_step` VALUES (371, '5c229206192f46938049a0e10ff5b718', '留住五花肉逼出来的猪油，再加入适量油，倒入豆角，不断翻炒出豆角皮起褶皱，大约2分钟左右，要翻炒别糊了，加入五花肉翻炒均匀，加少许生抽，老抽和半勺白糖，翻炒均匀。(老抽上色，生抽调味，大概按照老抽：生抽=1:5的比例）加热水没过肉，大火烧开后小火慢煮3-5分钟，倒出来一半的汤汁备用。\r\n\r\n炖肉的这一步不要省略，因为炖肉的汤汁焖面才好吃，不要嫌麻烦直接加水焖。', '/static/images/app/d4bf69b68fc411e6b87c0242ac110003_640w_480h.jpg', 3);
INSERT INTO `menu_step` VALUES (372, '5c229206192f46938049a0e10ff5b718', '将面条轻轻铺在肉菜上，盖上锅盖小火焖，要注意汤汁，晃动锅底要是看不到多少汤汁了，立马就倒入之前那碗汤，从锅边缘倒入，分几次倒入焖\r\n\r\n原因是..要是一大锅汤汁速度很慢，就跟做蛋糕分次加入鸡蛋搅拌均匀再加一个道理啦~~\r\n要是不介意时间和入味可以一次性倒入~~', '/static/images/app/d5012b628fc411e6a9a10242ac110002_640w_480h.jpg', 4);
INSERT INTO `menu_step` VALUES (373, '5c229206192f46938049a0e10ff5b718', '基本上没什么汤汁了面条也蒸熟了，将面条和菜搅拌均匀，加盐和生抽，使得面条吸入汤汁的味道更饱满！\r\n\r\n因为焖面的分量不一样，所以不太好确定具体的时间，建议每隔三五分钟掀开锅盖看看，如果汤汁感觉变少了就及时加汤汁；最后收汁的时候建议在旁边等待。焖煮的时候也可以稍微拨动一下面条，让他们受热均匀', '/static/images/app/d565d0e48fc411e6a9a10242ac110002_640w_480h.jpg', 5);
INSERT INTO `menu_step` VALUES (374, '84e184c0a4e14416bb92d826233fd816', '首先准备一个方便冰水泡鸡脚的容器.\r\n装好凉白开.水量要足够完全没过鸡脚.\r\n方法有2个:\r\n1、盆子装水直接盖保鲜膜放冷冻室里冰着备用.\r\n2、准备一盆凉白开.丢一些冰块进去放冷藏里冰着.\r\n(图片是我做得量多图方便就直接把冷冻室箱子当容器.你们做的量多也可以这样处理).', '/static/images/app/661397194cae45fa80e5a09ab48d08ec_2448w_3264h.jpg', 1);
INSERT INTO `menu_step` VALUES (375, '84e184c0a4e14416bb92d826233fd816', '然后把解冻好的鸡脚洗干净沥水.', '/static/images/app/a00d881609934a8a8393d523ca4029d2_1600w_1199h.jpg', 2);
INSERT INTO `menu_step` VALUES (376, '84e184c0a4e14416bb92d826233fd816', '冷水下锅放入处理好的鸡脚和料酒.姜.葱.', '/static/images/app/a97d281964d143c795d73a868de49eeb_1600w_1199h.jpg', 3);
INSERT INTO `menu_step` VALUES (377, '84e184c0a4e14416bb92d826233fd816', '大火煮沸5分钟.\r\n加盖转最小火煮10~15分钟(我煮了20分钟).\r\n每个家庭炉火不一样按自家炉火而定.\r\n只要煮到能用筷子轻松穿过鸡掌心.\r\n保证鸡脚煮透啃得动.就可以关火了.', '/static/images/app/1681c79dd2604940b046cd2d80bd0260_1600w_1199h.jpg', 4);
INSERT INTO `menu_step` VALUES (378, '84e184c0a4e14416bb92d826233fd816', '水池里准备一盆冷水.\r\n捞出鸡脚放水里.扔掉姜葱.\r\n开着水龙头冲洗掉杂质浮沫后水倒掉.', '/static/images/app/da4f094c54874ce790990c47edd014bc_1600w_1199h.jpg', 5);
INSERT INTO `menu_step` VALUES (379, '84e184c0a4e14416bb92d826233fd816', '然后剪趾甲(不剪掉会有腥味影响口味).不想去骨的像上图这样砍成两块.目的为了更好入味.\r\n(如果想去骨的就忽略砍开这一步).焯完水再进行剪甲和砍开是为了更省力.煮软后的鸡脚特别好处理.省力就能加速了.', '/static/images/app/80ba3e14db6c42a38fa94d41f60588bd_1600w_1199h.jpg', 6);
INSERT INTO `menu_step` VALUES (380, '84e184c0a4e14416bb92d826233fd816', '然后水龙头开着细细的水持续冲着.\r\n直到完全降去温度再关水', '/static/images/app/c6170bdb61f14e51aba01b372d5e9d6b_2448w_3264h.jpg', 7);
INSERT INTO `menu_step` VALUES (381, '84e184c0a4e14416bb92d826233fd816', '最后用凉开水冲洗一遍.\r\n捞出沥干水分.\r\n取出准备好的冰水.\r\n把沥干水分的鸡脚倒进冰水里.', '/static/images/app/4eea3fbba016496a99a236cbed8dbd9b_1600w_1199h.jpg', 8);
INSERT INTO `menu_step` VALUES (382, '84e184c0a4e14416bb92d826233fd816', '盖盖或保鲜膜放回冷冻室里让它浸泡3小时.\r\n我用冷冻箱就不用盖盖或保鲜膜了(o^^o)不用担心会结冰.因为这么多的水除非过夜才会完会结冰的.3小时最多也就给了一点点薄冰.', '/static/images/app/d6ac441fdfe442bf95ab13c6ab4d18bd_2448w_3264h.jpg', 9);
INSERT INTO `menu_step` VALUES (383, '84e184c0a4e14416bb92d826233fd816', '冷冻了3小时的鸡脚.\r\n可以看到皮爽脆脆的.\r\n\r\n如果是之前已经砍开的鸡脚.泡完冰水后忽略以下去骨小视频步骤.\r\n直接去到步骤15继续.', '/static/images/app/39b6503a58c111e7bc9d0242ac110002_2448w_3264h.jpg', 10);
INSERT INTO `menu_step` VALUES (384, '84e184c0a4e14416bb92d826233fd816', '附上去骨法视频:\r\n用厨房剪从长骨根部剪开一直剪到掌心.\r\n再反向一扭就断了.\r\n顺势再往根部处拉.\r\n大骨就轻易拿下.\r\n丢个视频方便你们理解.', '/static/images/app/9920982e58bb11e7947d0242ac110002_480w_384h.jpg', 11);
INSERT INTO `menu_step` VALUES (385, '84e184c0a4e14416bb92d826233fd816', '这一步很重要.                                             冰好的鸡脚沥干水分.                                      必~须~沥~干~必~须~沥~干.                         赶时间的可以用厨房纸吸干水分.                 时间充裕的可以捞出.                                       放筛里抛一下甩掉多余水分.                          放置半小时左右.          ', NULL, 12);
INSERT INTO `menu_step` VALUES (386, '84e184c0a4e14416bb92d826233fd816', '鸡脚沥水的空隙去把配料都准备好.\r\n洋葱、香菜、小米椒洗净后.                          先用凉开水冲洗一下沥干再切碎保证卫生. 香菜洋葱切的别太碎.没得吃了.                    因为这配菜也相当好吃的.                              柠檬洗净再用盐搓洗表皮去掉果腊.             半个先用凉开水冲洗一下再切碎.                 记得去籽要不然会苦.\r\n一个柠檬待会榨汁到鸡脚里.', '/static/images/app/8dd3012d02bc403b8ea9cca3fdd9f706_1600w_1198h.jpg', 13);
INSERT INTO `menu_step` VALUES (387, '84e184c0a4e14416bb92d826233fd816', '姜蒜剁碎备用', '/static/images/app/da959a4b34414a978ffbd82339747226_1600w_1198h.jpg', 14);
INSERT INTO `menu_step` VALUES (388, '84e184c0a4e14416bb92d826233fd816', '把干透的鸡脚装到大盘里方便抓拌.                      开始腌制.把所有腌料加入鸡脚里.\r\n新手可以先全部装入大碗内拌匀.\r\n调好的料先尝尝. \r\n可以根据自家口味去调整咸淡酸辣.\r\n不喜欢芝麻油的可不放或少放.\r\n感觉偏咸一点就对了.\r\n丢到鸡脚里腌制后就会刚好了.', '/static/images/app/ea6eab42f39546cf9c05f1e8a4b1f551_1600w_1198h.jpg', 15);
INSERT INTO `menu_step` VALUES (389, '84e184c0a4e14416bb92d826233fd816', '把刚才准备好的配料全部丢进鸡脚.             百香果是先洗净再切两半\r\n把果肉全挖出放入.\r\n(我最爱用放到皱巴巴的果来做.\r\n那种香甜酸味好吃到无法形容)\r\n\r\n酸辣度用百香果.柠檬汁.小米椒去调整.\r\n咸度和提鲜用生抽和糖去调整.\r\n根据自己口味.缺啥补啥.', '/static/images/app/83fcdbb0ab3b4be180f497a9b3f4f38d_1600w_1198h.jpg', 16);
INSERT INTO `menu_step` VALUES (390, '84e184c0a4e14416bb92d826233fd816', '全部腌料配菜放完后.\r\n戴上一次性手套.\r\n抓匀翻拌几分钟.\r\n才能让腌料更好渗入鸡脚里.\r\n(如果是没去大骨的鸡脚.\r\n抓拌时动作要轻柔点.小心尖骨刺伤手)', '/static/images/app/f84d330aedfc4cf893275aed10f7a630_2448w_2448h.jpg', 17);
INSERT INTO `menu_step` VALUES (391, '84e184c0a4e14416bb92d826233fd816', '把抓拌好先捞出鸡脚放入密封性好的保鲜盒.', '/static/images/app/830c19d478b248feb0289a4552946d92_374w_558h.jpg', 18);
INSERT INTO `menu_step` VALUES (392, '84e184c0a4e14416bb92d826233fd816', '装好鸡脚后可以看到底下汤汁其实是挺多的.                 所以不用担心不够腌制.\r\n把汤汁浇在鸡脚上. 精华就在这里.', '/static/images/app/22143a2ae56042f0b0e8e042e2909f11_1800w_1800h.jpg', 19);
INSERT INTO `menu_step` VALUES (393, '84e184c0a4e14416bb92d826233fd816', '盖盖密封好放冷藏隔夜腌24小时.                 这是最佳赏味时间.\r\n记得大概隔4小时就拿出来翻动拌匀一次.\r\n一般翻得三次就差不多了.', '/static/images/app/f89e0c1b44bf4fb38750b45c27b876e5_374w_556h.jpg', 20);
INSERT INTO `menu_step` VALUES (394, '84e184c0a4e14416bb92d826233fd816', '开动吧来一个.流口水了吧.\r\n我一个人都能吃上一斤凸^-^凸\r\n做好的爪爪吃不完要密封好放回冷藏保存.', '/static/images/app/7f4865fe452e435680f9535fbdfc682f_1800w_1800h.jpg', 21);
INSERT INTO `menu_step` VALUES (395, '32b09d7ffb5247eda0d37b5d521423a1', '干香菇洗净后泡发..！\r\n\r\n加一点点醋泡.\r\n香菇会更香更好吃呀..！\r\n\r\n试试..？', '/static/images/app/c6c1bebb5f8845878c0747a414fe64f1_1616w_1080h.jpg', 1);
INSERT INTO `menu_step` VALUES (396, '32b09d7ffb5247eda0d37b5d521423a1', '鸡蛋洗净后.煮熟.\r\n捞出用冷水浸泡.（好剥壳.）\r\n\r\n煮鸡蛋用冷水小火煮.\r\n水里放一些盐.\r\n蛋不会煮开裂的..\r\n\r\n我好几次看见有人煮.\r\n蛋炸了.\r\n黄漏了.(˶‾᷄ ⁻̫ ‾᷅˵)', '/static/images/app/c5e2286513f24feabb929696a17d2cc4_1616w_1080h.jpg', 2);
INSERT INTO `menu_step` VALUES (397, '32b09d7ffb5247eda0d37b5d521423a1', '五花肉切成大块.\r\n放冷水锅中.\r\n水开后再煮5分钟左右捞出洗净.', '/static/images/app/e86f7e33dc684e64978af18a680a8ede_1444w_1080h.jpg', 3);
INSERT INTO `menu_step` VALUES (398, '32b09d7ffb5247eda0d37b5d521423a1', '泡发好的香菇切成丁.\r\n生姜去皮切片.\r\n\r\n干柠檬皮碎是：\r\n柠檬皮放烤箱用200度烤干后.\r\n取出捣碎.密封保存.\r\n\r\n也可以和黑胡椒一同捣碎.\r\n加上海盐密封保存.\r\n平时炖肉.鱼.海鲜用非常好.\r\n解腻.去腥.增香..！无敌..\r\n\r\n如果没有干柠檬碎的.\r\n可以用一块干陈皮代替.', '/static/images/app/a296912d592447698436779cc7788d89_1616w_1080h.jpg', 4);
INSERT INTO `menu_step` VALUES (399, '32b09d7ffb5247eda0d37b5d521423a1', '五花肉切成细条.\r\n放入锅中.\r\n不需要放油.\r\n\r\n中火翻炒..！', '/static/images/app/80beb31f80684c46a9040b6294865c61_1616w_1080h.jpg', 5);
INSERT INTO `menu_step` VALUES (400, '32b09d7ffb5247eda0d37b5d521423a1', '炒至逼出一些油脂.\r\n\r\n我买的是土猪肉.\r\n比较肥.\r\n所以我熬出的油挺多.\r\n\r\n倒出多余的油.\r\n留的平时用.', '/static/images/app/30870e59df424c4fb703ebf0c4bb405a_1616w_1080h.jpg', 6);
INSERT INTO `menu_step` VALUES (401, '32b09d7ffb5247eda0d37b5d521423a1', '香叶.八角.桂皮.干柠檬皮碎.生姜.黑胡椒碎放入.\r\n翻炒几下后.\r\n把金兰油膏.金兰酱油放入.\r\n勺子就是咱们平时喝汤的這勺.\r\n\r\n别拿装汤的勺啊..！\r\n（有人干过.）ಠ_ಠ', '/static/images/app/1657f9c47db944c7b26ee3beeb27fc8e_1616w_1080h.jpg', 7);
INSERT INTO `menu_step` VALUES (402, '32b09d7ffb5247eda0d37b5d521423a1', '把调料汁炒干.\r\n只剩下油脂那种..\r\n让肉和酱料完全吸收.融合.\r\n合为一体.)^o^(', '/static/images/app/42856b90a1d54fc491d018abe5a03220_1616w_1080h.jpg', 8);
INSERT INTO `menu_step` VALUES (403, '32b09d7ffb5247eda0d37b5d521423a1', '把香菇放入.\r\n翻炒均匀.\r\n让香菇把油脂吸收了.\r\n\r\n所以.\r\n香菇放入前.\r\n要挤干水分呀 .(˶‾᷄ ⁻̫ ‾᷅˵)', '/static/images/app/f2712750af8e4f86ae1d77e151fe32e9_1616w_1080h.jpg', 9);
INSERT INTO `menu_step` VALUES (404, '32b09d7ffb5247eda0d37b5d521423a1', '把花雕酒.酒酿汁放入.\r\n\r\n如果没有酒酿汁的.\r\n就直接用冰糖.\r\n\r\n如果没有花雕酒的.\r\n就用黄酒.米酒代替.', '/static/images/app/2ce5af27abee47458b6c1fe353452121_1616w_1080h.jpg', 10);
INSERT INTO `menu_step` VALUES (405, '32b09d7ffb5247eda0d37b5d521423a1', '再次把液体炒干.\r\n\r\n放入豆腐乳.红葱酥翻炒均匀.\r\n豆腐乳要压碎一些...！\r\n\r\n我是自己做的红葱酥.\r\n如果不愿意熬的话.\r\n也有现成的卖.很方便的..！', '/static/images/app/c51c74322afb4bb3a967544f499db496_1616w_1080h.jpg', 11);
INSERT INTO `menu_step` VALUES (406, '32b09d7ffb5247eda0d37b5d521423a1', '炒好后换锅.\r\n我用的是白珐琅铸铁锅.\r\n也可以用砂锅之类.\r\n\r\n加入开水..！', '/static/images/app/a525cac54a884933ba19eedad617f5f6_1616w_1080h.jpg', 12);
INSERT INTO `menu_step` VALUES (407, '32b09d7ffb5247eda0d37b5d521423a1', '水要能盖过肉一些.\r\n烧开后转最小火.', '/static/images/app/ea675792fee546a69bc2e9cc9c628811_1616w_1080h.jpg', 13);
INSERT INTO `menu_step` VALUES (408, '32b09d7ffb5247eda0d37b5d521423a1', '盖上锅盖.\r\n用最小火炖...！\r\n\r\n不然水容易炖干了的.\r\n\r\n10分钟开盖搅拌一次.\r\n防止粘锅呀.呀.呀..！', '/static/images/app/8f1738f441254b1aaf7bf5018be48ec1_1616w_1080h.jpg', 14);
INSERT INTO `menu_step` VALUES (409, '32b09d7ffb5247eda0d37b5d521423a1', '炖半小时后.\r\n把香叶.八角.桂皮.挑出来丢弃.\r\n\r\n把剥好壳的鸡蛋放入继续炖着.\r\n\r\n5分钟开盖搅拌一次.\r\n防止糊锅..！', '/static/images/app/381834219ce04cbdab77f2f309f8a5fa_1616w_1080h.jpg', 15);
INSERT INTO `menu_step` VALUES (410, '32b09d7ffb5247eda0d37b5d521423a1', '锅里把水烧开.\r\n水里要放一点盐和几滴食用油.\r\n\r\n小青菜洗净后放入锅中煮至变色.\r\n捞出后放入凉白开中浸泡备用.', '/static/images/app/31d766d9dc314ae4b79711a1cd98b9b4_1616w_1080h.jpg', 16);
INSERT INTO `menu_step` VALUES (411, '32b09d7ffb5247eda0d37b5d521423a1', '肉一直炖至汤汁浓稠.\r\n肉软烂.\r\n\r\n炖好之前尝一尝咸淡.\r\n加盐调味..！\r\n\r\n一般需要一个来小时.\r\n用铸铁锅会快一些.\r\n如果水已干.\r\n肉還未烂.\r\n加开水继续炖.\r\n\r\n记得要留一些汤汁的.\r\n汤汁最好吃啦.', '/static/images/app/6dae3f48982842d194a24ae7af398125_1616w_1080h.jpg', 17);
INSERT INTO `menu_step` VALUES (412, '32b09d7ffb5247eda0d37b5d521423a1', '准备好米饭.\r\n摆上烫好的青菜.\r\n把蛋切开摆上.\r\n肉和汁淋在米饭上.\r\n或者和我一样放在旁边.\r\n\r\n总之.想咋吃..看您心情....！', '/static/images/app/4ba99ef5f00f4c89b9fa275cd9092e3e_1520w_1059h.jpg', 18);
INSERT INTO `menu_step` VALUES (413, '70460d48ec754d4287711710ae46921c', '嫩姜切丝【一定要新鲜的嫩姜，老姜、买来放了几天的都不行】，肉切丝，倒入黄酒、生抽、适量淀粉腌制一会', NULL, 1);
INSERT INTO `menu_step` VALUES (414, '70460d48ec754d4287711710ae46921c', '热锅下底油，滑炒肉丝至变色盛出，下入青红椒丝，姜丝爆炒至姜丝软到，下入肉丝，翻炒，调味即可', NULL, 2);
INSERT INTO `menu_step` VALUES (415, '6fab45e6fbdd477d9cadbfbee4ab7950', '腐乳压碎，和其它腌料混合拌匀备用（不同品牌的腐乳咸度和大小不同，味道要先试过，再酌量调整）。', '/static/images/app/ad00edda8d4b11e6a9a10242ac110002_200w_160h.jpg', 1);
INSERT INTO `menu_step` VALUES (416, '6fab45e6fbdd477d9cadbfbee4ab7950', '嫩鸡洗净沥干水分，切成小块。加入姜末、蒜末、辣椒丝和之前准备好的腐乳腌料一起充分拌匀，腌制约30分钟。', '/static/images/app/ad2545ae8d4b11e6a9a10242ac110002_200w_160h.jpg', 2);
INSERT INTO `menu_step` VALUES (417, '6fab45e6fbdd477d9cadbfbee4ab7950', '放入水滚的蒸锅，隔水用大火蒸约15-20分钟至鸡肉熟透即可，趁热享用。', '/static/images/app/ad341ec68d4b11e6b87c0242ac110003_200w_160h.jpg', 3);
INSERT INTO `menu_step` VALUES (419, '05347f08072f46e783ce9efc3c7e9d3b', '面粉加热水西式厨师机3分钟', '/static/images/app/88772692276a405a8fcf6648847f3a25_744w_744h.jpg', 1);
INSERT INTO `menu_step` VALUES (420, '05347f08072f46e783ce9efc3c7e9d3b', '揉好的面团滚圆后盖保鲜膜松驰15分钟', '/static/images/app/a1f7399ffae2484fa097bdc90399300f_744w_744h.jpg', 2);
INSERT INTO `menu_step` VALUES (421, '05347f08072f46e783ce9efc3c7e9d3b', '准备好的食材，韭菜处理干净，粉丝泡软，鸡蛋加少许盐打散', '/static/images/app/c5d230afce204c49a338296c24c4cb37_992w_744h.jpg', 3);
INSERT INTO `menu_step` VALUES (422, '05347f08072f46e783ce9efc3c7e9d3b', '炒好的鸡蛋稍微切成丁', '/static/images/app/4ab894f67b254b118cee39f03c34170b_744w_992h.jpg', 4);
INSERT INTO `menu_step` VALUES (423, '05347f08072f46e783ce9efc3c7e9d3b', '沥干水的韭菜切碎', '/static/images/app/2e6f294b63a543589b65ca6bb653b05f_721w_722h.jpg', 5);
INSERT INTO `menu_step` VALUES (424, '05347f08072f46e783ce9efc3c7e9d3b', '泡软的粉丝切碎', '/static/images/app/cea767b3bc534b649b11ad8573004aaf_744w_992h.jpg', 6);
INSERT INTO `menu_step` VALUES (425, '05347f08072f46e783ce9efc3c7e9d3b', '韭菜先用香油拌一拌，再加入鸡蛋粉丝，最后加盐拌勻', '/static/images/app/c8b8a43e28774f698e48af8844d657bc_731w_732h.jpg', 7);
INSERT INTO `menu_step` VALUES (426, '05347f08072f46e783ce9efc3c7e9d3b', '醒好的面团分成大小一样的剂子，擀薄包成自己喜欢的形状', '/static/images/app/d3731ff9658f4579b788c7a1f113d725_744w_744h.jpg', 8);
INSERT INTO `menu_step` VALUES (427, '05347f08072f46e783ce9efc3c7e9d3b', '加热好的平底锅刷上油，放入韭菜盒子，煎成两面金黄出锅，就可以美美哒享用了！', '/static/images/app/a11d87dfda714f6889779d5e54d38464_733w_733h.jpg', 9);
INSERT INTO `menu_step` VALUES (458, '833688f5f7f64b0cbf7809d5357f6f2e', '每只小龙虾都用牙刷刷干净，泡在淡盐水中30分钟。', '/static/images/app/20eb8230481511e7947d0242ac110002_4128w_2322h.jpg', 1);
INSERT INTO `menu_step` VALUES (459, '833688f5f7f64b0cbf7809d5357f6f2e', '泡龙虾的时候剥大蒜头，蒜头不怕多，越多越好吃。', '/static/images/app/6dd650de481511e7947d0242ac110002_721w_1280h.jpg', 2);
INSERT INTO `menu_step` VALUES (460, '833688f5f7f64b0cbf7809d5357f6f2e', '捣成蒜蓉。', '/static/images/app/850930be481511e7947d0242ac110002_721w_1280h.jpg', 3);
INSERT INTO `menu_step` VALUES (461, '833688f5f7f64b0cbf7809d5357f6f2e', '把小龙虾从盐水里捞出，剪掉8条小腿，从尾部中央抽出虾肠。如果不是清水龙虾建议剪掉头顶的胃，追求口感的话虾肠可以不抽，吃的时候再抽，这样虾肉比较筋道。生姜和红辣椒准备好。', '/static/images/app/ba6629b0481511e7bc9d0242ac110002_721w_1280h.jpg', 4);
INSERT INTO `menu_step` VALUES (462, '833688f5f7f64b0cbf7809d5357f6f2e', '热锅冷油，倒入蒜蓉炒香，加白糖炒匀，油一定要多倒。', '/static/images/app/41a19b76481611e7947d0242ac110002_721w_1280h.jpg', 5);
INSERT INTO `menu_step` VALUES (463, '833688f5f7f64b0cbf7809d5357f6f2e', '倒入小龙虾、生姜、红辣椒，翻炒至虾壳变红，多翻炒一会让虾肉变紧。', '/static/images/app/85b3c87a481611e7947d0242ac110002_721w_1280h.jpg', 6);
INSERT INTO `menu_step` VALUES (464, '833688f5f7f64b0cbf7809d5357f6f2e', '倒入一罐啤酒翻炒均匀，加入盐，生抽酱油，再倒点李锦记红烧汁和蒸鱼豉油。', '/static/images/app/9e2070de481611e7bc9d0242ac110002_721w_1280h.jpg', 7);
INSERT INTO `menu_step` VALUES (465, '833688f5f7f64b0cbf7809d5357f6f2e', '加入葱白和八角，倒少量开水与龙虾齐平，如果啤酒倒得多就不加开水，加盖中火煮10-15分钟。', '/static/images/app/b04ca368481611e7bc9d0242ac110002_721w_1280h.jpg', 8);
INSERT INTO `menu_step` VALUES (466, '833688f5f7f64b0cbf7809d5357f6f2e', '盛出小龙虾，锅内汤汁继续大火收干。', '/static/images/app/39d7c5cc481711e7bc9d0242ac110002_1280w_721h.jpg', 9);
INSERT INTO `menu_step` VALUES (467, '833688f5f7f64b0cbf7809d5357f6f2e', '最后将收得半干的蒜蓉汤汁浇在龙虾上就可以了，甜、辣、鲜、香Y(＾_＾)Y', '/static/images/app/6c146856481711e7bc9d0242ac110002_721w_1280h.jpg', 10);
INSERT INTO `menu_step` VALUES (468, 'b36ffdff96264f53be7285e18cf699ef', '瘦肉或者里脊肉按照纹路切成细丝，加白胡椒，盐，料酒，少量淀粉抓匀腌制！胡萝卜，木耳和青椒都切成细丝，水淀粉提前调好备用', '/static/images/app/7b5e18d88fbe48858e7145f626f2d6af_751w_751h.jpg', 1);
INSERT INTO `menu_step` VALUES (469, 'b36ffdff96264f53be7285e18cf699ef', '开始调鱼香汁！香醋，白糖，酱油，味精调匀，因为我用的郫县豆瓣酱比较咸所以这个环节就不放盐了，至于比例，我之前看到过一个最佳比例，大家仅仅作为参考，不要一味照搬！“白糖25克，香醋20克，酱油15克，盐2克，味精1克，水淀粉25克，香油1滴”调到什么感觉算是成功了呢，尝起来有股荔枝的小酸甜就对了！', '/static/images/app/b508d553499a461f8a3ee69e020b4d36_750w_1000h.jpg', 2);
INSERT INTO `menu_step` VALUES (470, 'b36ffdff96264f53be7285e18cf699ef', '起锅放油，下肉丝炒制', '/static/images/app/1bfd909831de4af5b96538d924448b24_1000w_750h.jpg', 3);
INSERT INTO `menu_step` VALUES (471, 'b36ffdff96264f53be7285e18cf699ef', '肉丝炒到发白盛出留用', '/static/images/app/f9eee3ea7fd8406eace73863c7be430b_750w_750h.jpg', 4);
INSERT INTO `menu_step` VALUES (472, 'b36ffdff96264f53be7285e18cf699ef', '锅内剩油下胡萝卜丝炒一下，因为胡萝卜丝不容易熟软，然后盛出来', '/static/images/app/3ac9e95b64084edbb688223532eb1fed_1000w_750h.jpg', 5);
INSERT INTO `menu_step` VALUES (473, 'b36ffdff96264f53be7285e18cf699ef', '加入两勺郫县豆瓣酱炒出红油，豆瓣酱干的话可以加点水', '/static/images/app/bff9f44ed4bc4cf8a0fb1654577efdca_1000w_750h.jpg', 6);
INSERT INTO `menu_step` VALUES (474, 'b36ffdff96264f53be7285e18cf699ef', '下木耳丝和青椒丝翻炒', '/static/images/app/989c98493f544a71ae95b11cc33e3935_1000w_750h.jpg', 7);
INSERT INTO `menu_step` VALUES (475, 'b36ffdff96264f53be7285e18cf699ef', '加入胡萝卜丝一起炒-15分钟。', '/static/images/app/8892e47527a84d6fb851c13c58dc49e4_1000w_750h.jpg', 8);
INSERT INTO `menu_step` VALUES (476, 'b36ffdff96264f53be7285e18cf699ef', '炒熟蔬菜类然后加入肉丝，倒入鱼香汁，大火翻炒均匀，最后加入水淀粉，让菜都裹上浆，有光泽', '/static/images/app/39d7c5cc481711e7bc9d0242ac110002_1280w_721h.jpg', 9);
INSERT INTO `menu_step` VALUES (477, 'b36ffdff96264f53be7285e18cf699ef', '出炉！特别下饭，特别简单，食材都是北方人家里最常见的！', '/static/images/app/dc68c4e8c25e4855b3080e541848a2d2_750w_1000h.jpg', 10);
INSERT INTO `menu_step` VALUES (478, 'f40bbb0165b84a5e9899e77e92777ecf', '把鱼洗干净，侧切，按鱼的纹路切片，剩余骨头砍同鱼片大小。这样切没那么多刺骨', '/static/images/app/711ce6ec98c811e6b2400242ac110002_266w_212h.jpg', 1);
INSERT INTO `menu_step` VALUES (479, 'f40bbb0165b84a5e9899e77e92777ecf', '用柠檬汁，盐，淀粉，鱼露，少量姜蒜，腌制鱼片', '/static/images/app/', 2);
INSERT INTO `menu_step` VALUES (480, 'f40bbb0165b84a5e9899e77e92777ecf', '待锅热后放油  之后放辣椒 蒜 姜片 少量胡椒 翻炒', '/static/images/app/', 3);
INSERT INTO `menu_step` VALUES (481, 'f40bbb0165b84a5e9899e77e92777ecf', '放入鱼骨头入锅内翻炒几分钟后倒入热水', '/static/images/app/', 4);
INSERT INTO `menu_step` VALUES (482, 'f40bbb0165b84a5e9899e77e92777ecf', '水沸腾后放入2片柠檬，喜欢酸的可以自行增加。腌制好的鱼片煮熟，调味。', '/static/images/app/', 5);
INSERT INTO `menu_step` VALUES (483, 'f40bbb0165b84a5e9899e77e92777ecf', '起锅放入些许葱丝 自行摆盘，完成！', '/static/images/app/70efa61e98c811e69ce70242ac110002_812w_1080h.jpg', 6);
INSERT INTO `menu_step` VALUES (484, 'faf83bb0232f48548e478314ddf75542', '用剪刀在鸡腿根部剪开，然后直的往上剪开到底', '/static/images/app/0f4e50308bea11e6b87c0242ac110003_181w_278h.jpg', 1);
INSERT INTO `menu_step` VALUES (485, 'faf83bb0232f48548e478314ddf75542', '用剪刀辅助把鸡腿肉往两边分开，使之与腿骨分离', '/static/images/app/0f6d6e3e8bea11e6a9a10242ac110002_185w_279h.jpg', 2);
INSERT INTO `menu_step` VALUES (486, 'faf83bb0232f48548e478314ddf75542', '用剪刀沿着腿骨把腿肉和骨头分开', '/static/images/app/0f962d4c8bea11e6a9a10242ac110002_183w_275h.jpg', 3);
INSERT INTO `menu_step` VALUES (487, 'faf83bb0232f48548e478314ddf75542', '最后把腿骨剔除，剩下整块的鸡腿肉备用', '/static/images/app/0fb4e7788bea11e6b87c0242ac110003_190w_284h.jpg', 4);
INSERT INTO `menu_step` VALUES (488, 'faf83bb0232f48548e478314ddf75542', '一小块平果去皮用擦蓉器擦成泥', '/static/images/app/0fe11b048bea11e6b87c0242ac110003_185w_281h.jpg', 5);
INSERT INTO `menu_step` VALUES (489, 'faf83bb0232f48548e478314ddf75542', '一小颗蒜头也擦成蒜泥', '/static/images/app/1007fc4c8bea11e6a9a10242ac110002_188w_284h.jpg', 6);
INSERT INTO `menu_step` VALUES (490, 'faf83bb0232f48548e478314ddf75542', '拆好的整块鸡腿肉用刀背拍几下，拍松，然后切成小块（我是把整块鸡腿肉分成三到四块）', '/static/images/app/102f69d08bea11e6a9a10242ac110002_184w_278h.jpg', 7);
INSERT INTO `menu_step` VALUES (491, 'faf83bb0232f48548e478314ddf75542', '用生抽两汤匙、米醋一汤匙、白糖半汤匙、料酒半汤匙、盐一点点、苹果泥一小勺、蒜泥一小勺、芝麻油一小勺腌制鸡腿肉，用手不断抓捏一会儿，然后静置腌制两小时', '/static/images/app/10515b268bea11e6b87c0242ac110003_184w_279h.jpg', 8);
INSERT INTO `menu_step` VALUES (492, 'faf83bb0232f48548e478314ddf75542', '锅烧热放油，油烧热放姜片爆香', '/static/images/app/107c623a8bea11e6b87c0242ac110003_187w_279h.jpg', 9);
INSERT INTO `menu_step` VALUES (493, 'faf83bb0232f48548e478314ddf75542', '把腌制好的鸡腿肉一块块夹出放入锅中煸炒至表面变色收紧', '/static/images/app/109dd5f08bea11e6a9a10242ac110002_189w_282h.jpg', 10);
INSERT INTO `menu_step` VALUES (494, 'faf83bb0232f48548e478314ddf75542', '倒入碗中腌制鸡腿肉的腌汁，再倒小半碗水，盖上盖子大火煮开后，转中小火煮10分钟左右', '/static/images/app/10c443208bea11e6a9a10242ac110002_187w_283h.jpg', 11);
INSERT INTO `menu_step` VALUES (495, 'faf83bb0232f48548e478314ddf75542', '开盖转大火收浓汤汁撒上葱花即可', '/static/images/app/10e6079e8bea11e6b87c0242ac110003_190w_286h.jpg', 12);
INSERT INTO `menu_step` VALUES (496, 'f78570a328e64ca6924c260bd92b84a6', '锅里倒入较多的油，油热了之后加入蒜末、葱白，炒出香味', '/static/images/app/31aff68e15db4116a724a14811019fd9_5184w_3456h.jpg', 1);
INSERT INTO `menu_step` VALUES (497, 'f78570a328e64ca6924c260bd92b84a6', '放入肉末，大火煸炒五分钟左右，至肉末颜色半白半红', '/static/images/app/e484e556ed1644e491db8bd0fe6d45e3_5184w_3456h.jpg', 2);
INSERT INTO `menu_step` VALUES (498, 'f78570a328e64ca6924c260bd92b84a6', '倒入少量啤酒、美味鲜酱油、老抽、冰糖，盖上锅盖，小火收汁到一半，把肉拨到锅的四周，中间留出汁水，放入茄子块，盖上锅盖，大火炖5分钟左右。', '/static/images/app/70aa6d25d39c474481389b0020be2e61_5184w_3456h.jpg', 3);
INSERT INTO `menu_step` VALUES (499, 'f78570a328e64ca6924c260bd92b84a6', '倒入少许醋、一点点红糖、洒一些盐调味，小火收汁到汤汁上有一层薄薄的浮油即可', '/static/images/app/f1ea89dd6ba748c89a1e670f28c70cec_5184w_3456h.jpg', 4);
INSERT INTO `menu_step` VALUES (500, 'f78570a328e64ca6924c260bd92b84a6', '把汤汁全部倒入餐盘中，大火煸炒肉末茄子一小会，出盘，撒上葱花', '/static/images/app/8c1508d392414fc1a4d4f78c5dfd8f02_5184w_3456h.jpg', 5);
INSERT INTO `menu_step` VALUES (501, '943f7f4d1f204758893a64c59e2d0178', '鸡腿洗净擦干，倒入4瓣蒜、5片姜、30ml生抽、20g蚝油、2g花椒、5g盐，冷藏腌制3小时以上，最好能过夜', '/static/images/app/9c498a5372b54d7d8f02344c154a0e87_1920w_1920h.jpg', 1);
INSERT INTO `menu_step` VALUES (502, '943f7f4d1f204758893a64c59e2d0178', '腌好的鸡腿蘸干面粉，然后过一遍水，再蘸一遍干面粉。', '/static/images/app/657740d2b9ad4b3388a1643b0ac4e81d_1920w_1920h.jpg', 2);
INSERT INTO `menu_step` VALUES (503, '943f7f4d1f204758893a64c59e2d0178', '锅里热油，将鸡腿放入油锅小火炸约15分钟，表面金黄。\r\n小贴士：如何检查油温：筷子放进去起小泡泡的程度即可', '/static/images/app/1915da163fd0483ea6b7e11abeaddf0c_1920w_1920h.jpg', 3);

-- ----------------------------
-- Table structure for menu_summary
-- ----------------------------
DROP TABLE IF EXISTS `menu_summary`;
CREATE TABLE `menu_summary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱外键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱名称',
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜谱描述',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `score` float(11, 1) NULL DEFAULT 5.0 COMMENT '分数，满分为10',
  `browse_num` int(11) NULL DEFAULT 0 COMMENT '查看次数',
  `collect_num` int(11) NULL DEFAULT 0 COMMENT '收藏次数',
  `recommend_num` float(11, 1) NULL DEFAULT 0.0 COMMENT '推荐指数，最低0，最高5颗星',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uuid`(`uuid`) USING BTREE,
  INDEX `fk_user`(`userId`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_summary
-- ----------------------------
INSERT INTO `menu_summary` VALUES (1, '0714066b25c64ebbbe18a4cf3d62c8bc', '萝卜干炒腊肉', '/static/images/app/8c1a4f6603654f31b7abd869eee80412_1252w_1876h.jpg', 2, '我家里人爱吃腊肉，但是吃腊肉有一个很特别的嗜好，那就是不喜欢吃腊肉的咸，非得要泡水，然后焯水，最后把腊肉弄的没有一点咸味了，才爱吃。虽然这样挺奇怪的，但是呢，每个人家里都有自己的一些小癖好，所以我的菜谱做得到底正不正确，就先不论了…哈哈哈', '2019-04-11 19:07:21', 5.8, 256, 35, 3.0);
INSERT INTO `menu_summary` VALUES (2, 'e5ebeeb682fb4c8792313f44d309a299', '✨香煎豆腐✨', '/static/images/app/12a1306688ea11e6b87c0242ac110003_650w_650h.jpg', 2, '超级超级下饭的菜~', '2019-04-03 19:07:21', 6.7, 34, 1, 3.4);
INSERT INTO `menu_summary` VALUES (3, '6be893be5b80403ab592c2aa3a714021', '咖喱肥牛乌冬面', '/static/images/app/c24e69c6d39c4fe0a102b977eb36413b_4096w_2730h.jpg', 2, '去丸龟制面的时候顺着点餐台走\r\n看着餐牌 叫一份喜欢的乌冬面\r\n看着师傅亲手加工再端到你面前\r\n前后不过个把分钟\r\n却是满满期待的过程\r\n\r\n一直想写一个咖喱的方子来着\r\n今天就结合一下\r\n于是就有了这一碗——咖喱肥牛乌冬面', '2019-03-19 19:07:21', 8.6, 54, 13, 4.4);
INSERT INTO `menu_summary` VALUES (4, '92718a72a7a947e5b637c36107d81f09', '【减脂增肌】低卡纤维杂粮饭', '/static/images/app/2106b9ac2d9911e6bf67b82a72e00100.jpg', 4, '⁄(⁄ ⁄•⁄ω⁄•⁄ ⁄)⁄\r\n\r\n        近期都在关注和研究减脂餐，最近对粗粮的兴趣极高\r\n        减脂期间非常推荐吃粗粮，热量低不说了，还蠕动肠胃，可以很好的“嗯嗯” ^^~\r\n\r\n        然后去网上把市面上的粗粮基本上全入了\r\n        口感确实不好，用我大重庆的话说就是“嚼起杂翻翻d”，不好吃\r\n        但是我很好的发挥了小强精神\r\n        搭配出一个口感吃起来还不错的组合，哇哈哈 ^罒^', '2019-04-25 19:07:21', 6.8, 54, 32, 3.7);
INSERT INTO `menu_summary` VALUES (5, '47f1cdd33e9a4281b6cb3f93f52dc149', '海带排骨汤', '/static/images/app/ba437e28876e11e6b87c0242ac110003_620w_465h.jpg', 2, '如今的家常饮食应该兼顾补钙、降脂、增强免疫力等健康观念；类似这样的汤品制作很简单，味道也很鲜美，营养又滋补...', '2019-04-23 19:07:21', 4.6, 65, 42, 2.6);
INSERT INTO `menu_summary` VALUES (6, '571926782b7a433393e487de00eb5522', '可乐鸡翅 ', '/static/images/app/ed35e338873811e6b87c0242ac110003_450w_600h.jpg', 2, NULL, '2019-03-18 19:07:21', 8.7, 756, 23, 4.4);
INSERT INTO `menu_summary` VALUES (7, '5f1376312824475ea6ce692174900ec1', '懒人版糖醋排骨', '/static/images/app/4daad8ea877a11e6a9a10242ac110002_469w_701h.jpg', 4, '', '2019-03-25 19:07:21', 6.6, 54, 3, 5.0);
INSERT INTO `menu_summary` VALUES (8, 'f34f0087950d4f059e4ef8997af022a1', '宫保鸡丁', '/static/images/app/57bda645202140df89b80450a9f4de71_5184w_3456h.jpg', 2, NULL, '2019-04-16 19:08:21', 6.7, 4, 0, 5.0);
INSERT INTO `menu_summary` VALUES (9, '6f33d18101aa460096d49c6fa6ac0005', '挂霜油炸腰果', '/static/images/app/c7782a16ee7f400a91e90cf595a50b0d_5184w_3456h.jpg', 5, '一个腰果两种吃法哦，油炸和挂霜都很好吃呢，我各留了一半，咔咔......', '2019-04-25 19:07:21', 7.6, 24, 12, 4.0);
INSERT INTO `menu_summary` VALUES (10, 'c8ad71e6ea8642f780daedb9fd691ddc', '柠檬泡椒凤爪 ', '/static/images/app/0e3a0588a5b511e6947d0242ac110002_1280w_852h.jpg', 2, '简单好做 食材简单', '2019-04-25 19:07:21', 5.6, 45, 36, 3.2);
INSERT INTO `menu_summary` VALUES (11, '6f4e6c1f487d41bf97d563d594846ad5', '春天的味道-油焖笋', '/static/images/app/bdd22c74dbd74805a0da6a0e3337d8e5_1616w_1080h.jpg', 1, '春雷乍响，必须要吃春天的笋宝宝咯～油焖笋的烧制小贴士：1.笋要事先下水焯，去除麻味 2.尽量保持笋的鲜美，不要放太多调味料', '2019-04-25 19:07:21', 8.2, 564, 52, 4.1);
INSERT INTO `menu_summary` VALUES (12, '3d3e0493400642e9ac617a7257f0bdf4', '清蒸鳕鱼', '/static/images/app/a23c503887ab11e6b87c0242ac110003_600w_397h.jpg', 2, NULL, '2019-04-25 19:07:21', 6.3, 56, 30, 3.4);
INSERT INTO `menu_summary` VALUES (13, 'cee46249de1d4b42a0c93577413fa5cb', '三色芋圆', '/static/images/app/b5c9503e89e911e6b87c0242ac110003_1280w_854h.jpg', 2, '做这个请先看最下面的小贴士好不？只用木薯淀粉！只用木薯淀粉！只用木薯淀粉！不要再问这种问题了，拜托！\r\n和女儿一样都喜欢去鲜芋仙，柳州如雨后春笋般开了好几家台式甜品店我们也都去过。喜欢台式甜品中又Q又糯的芋圆。一碗10几至20几块钱不等的芋圆或仙草甜品，每次都还要另外加2份芋圆，以前一份2块钱8个芋圆，最近鲜芋仙不知廉耻的将芋圆涨到3块钱8个，我和女儿就不乐意去了。\r\n     想吃多少芋圆就能放多少，是不是我们在鲜芋仙的幻想！不如自己动手丰衣足食！', '2019-03-26 19:07:21', 8.2, 76, 36, 4.3);
INSERT INTO `menu_summary` VALUES (14, '1ceba29d11634538a908542f737fb489', '红烧肉沫茄子', '/static/images/app/12612b0288ad11e6b87c0242ac110003_1239w_1209h.jpg', 6, '米饭杀手，绝对够味，喜欢茄子的人都懂得！茄子是一道离不开油的菜，离开油做不出那个感觉的，所以我要么不做茄子，要么肯定过油，这也是餐厅里厨师们一贯做法！', '2019-04-25 19:07:21', 8.6, 87, 56, 4.6);
INSERT INTO `menu_summary` VALUES (15, '19816b23d74249b4aae7ebb114f46379', '麻婆豆腐', '/static/images/app/ac70082ee9b211e6947d0242ac110002_1221w_915h.jpg', 2, '经典传统川菜，川菜代表菜之一。\r\n本菜谱采用适合家庭烹煮方式制作，简单易学。想在家里做出餐馆里的卖相和味道吗?快快准备材料吧!', '2019-03-22 19:07:21', 3.8, 56, 55, 4.5);
INSERT INTO `menu_summary` VALUES (16, 'a14be5243eac46fc9d3b06a93ecc9270', '火腿蘑菇小白菜 ', '/static/images/app/9a92ad77f5dd484fb835442a64510be9_1688w_1124h.jpg', 5, '买了德式低脂火腿，空口吃有点咸；与口蘑、小白菜一起炒，特鲜。\r\n\r\n\r\n本来打算用娃娃菜的，谁知买完菜到家，发现忘了拿娃娃菜了……', '2019-04-25 19:07:21', 8.6, 4565, 4123, 4.8);
INSERT INTO `menu_summary` VALUES (17, 'd011da5fdca64b328463984ddb132b3a', '超简单椰子鸡汤', '/static/images/app/b21f2ff9a4ef4982a0fe16e1fc5dc4e5_2876w_2876h.jpg', 2, '超级好喝简单的原汁原味的椰青鸡汤。\r\n健康又好喝。\r\n椰青肉嫩滑爽口。推荐买椰青来煲汤。\r\n比普通的椰子肉好吃太多了！\r\n普通椰子肉都是硬邦邦的，咬的牙疼，还难取肉。\r\n份量4人份', '2019-04-25 19:07:21', 9.9, 2, 1, 5.0);
INSERT INTO `menu_summary` VALUES (18, '8a60936befcc4de3b93ed0bb25d906d3', '荷兰宝贝松饼', '/static/images/app/9b840511c379433486c1a0c681e46898_972w_648h.jpg', 5, '做法简单，让厨房小白也能脑后光环闪闪：面粉、鸡蛋、牛奶一旦完成了烤炉里的完美膨 胀，摞上心爱的水果和配料就行，要是换成三文鱼、培根这类的肉菜，四舍五入也能算个正餐，怎么样都划得来。', '2019-04-08 19:07:21', 9.6, 45, 2, 4.8);
INSERT INTO `menu_summary` VALUES (19, '62367bf1715643068596d263162a9157', '黑芝麻馅青团 艾草青团 艾草粿', '/static/images/app/2cc3a135489c4feab0307cbaa93a5d28_1864w_1242h.jpg', 2, NULL, '2019-04-25 19:07:21', 9.5, 987, 693, 5.0);
INSERT INTO `menu_summary` VALUES (20, 'f46d40f225bf4c92ba9def092509ed2a', '香煎杏鲍菇', '/static/images/app/d207c7b9b8624537ab729375c698a1bf_1017w_896h.jpg', 2, NULL, '2019-04-25 19:07:21', 9.2, 657, 263, 4.8);
INSERT INTO `menu_summary` VALUES (21, 'f960eec54cc54c728b78ea46f0196900', '南瓜饼（最简单的做法） ', '/static/images/app/cbc8273020144f4a89857a5aab64cd45_1006w_775h.jpg', 2, '十五分钟就可以做成的美食', '2019-04-01 19:07:21', 7.6, 345, 153, 4.0);
INSERT INTO `menu_summary` VALUES (22, 'c1b4703829a34a91b7af8e089a1f8549', '熟醉大头虾 ', '/static/images/app/d74281a0565a4bfaa17ece1e228f63fd_5466w_4000h.jpg', 5, '', '2019-04-25 19:07:21', 3.6, 65, 26, 5.0);
INSERT INTO `menu_summary` VALUES (23, '032d9f1e7dd64cc1b3af8df456659550', '花生酥芝麻酥', '/static/images/app/b9efd28a6d2f11e7947d0242ac110002_1280w_1023h.jpg', 2, NULL, '2019-04-25 19:07:21', 4.5, 353, 236, 5.0);
INSERT INTO `menu_summary` VALUES (24, '80a09b188ba845039696964cb03d218b', '姜撞奶', '/static/images/app/d19d9d4fe7fc473aa53d9cb31ae8b678_3648w_2736h.jpg', 2, '我平生也有一个追求，那就是，用尽量简单的办法做出尽量好吃的东西，让我自己觉得，哦，原来做好吃的，并不难。\r\n比如说这个姜撞奶，我是姜爱好者啊，每次来好朋友的时候都会冲一杯姜茶，对于姜撞奶，自然少了不尝试一下，但很遗憾，前几次都以失败告终，但俗话说的好啊，失败是成功他妈妈，经过几次的尝试之后，我逐渐掌握了姜撞奶的决窍，以及姜撞奶好吃的比例，现在，不用去甜品店，在家里也能轻轻松松吃到好吃的姜撞奶。', '2019-04-12 19:07:21', 6.3, 76, 25, 5.0);
INSERT INTO `menu_summary` VALUES (25, 'f30b83378f924b1db4705d22dc21af2b', '虾皮豆腐炒蛋', '/static/images/app/47bbef9c873811e6b87c0242ac110003_720w_480h.jpg', 2, '今天上的这道小菜是简单而营养比较好的一道快手菜式——虾皮豆腐炒蛋，适合上班族，希望大家喜欢呀！', '2019-04-25 19:07:21', 6.5, 234, 26, 5.0);
INSERT INTO `menu_summary` VALUES (26, '156c052ca5584994bb84562ed48e18ff', '冬阴功汤', '/static/images/app/40d0ab61a1bc4eb28f0d5a5b7ae15111_1124w_1318h.jpg', 6, '我老公从来不吃冬阴功，有一次我突发奇想做冬阴功，他说不吃，结果一吃赞口不绝，整天叫我做。我说你不是说不吃吗？他说好吃当然吃啊，外面的都不好吃，哈哈哈', '2019-03-26 19:07:21', 7.2, 564, 63, 3.7);
INSERT INTO `menu_summary` VALUES (27, 'db4c21e2787a4c0f9e6c6db53d7678a2', '干锅肥肠', '/static/images/app/885eb7a9f9ab48008457c60a08444035_1440w_1078h.jpg', 2, '肥肠有一定的营养价值，它含有大量的脂肪与蛋白质，还有一些微量元素。其性寒，味甘；有润肠、去下焦风热、止小便数的作用。\r\n1、肥肠中的营养物质是人体各器官工作时的必须成分，人们食用肥肠能满足身体对不同营养的需要，能促进身体代谢，提高各器官功能。\r\n2、肥肠还具有一定的药用功效，从中医的角度上看性寒味甘，可以去下焦风热，也能润肠止燥，更能清理人体肠道中的一些病菌，能起不错的止痢作用，平时在中医中它也可以用于人类痔疮和大便带血等症的治疗，治疗功效十分明显。', '2019-04-25 19:07:21', 8.4, 24, 5, 4.3);
INSERT INTO `menu_summary` VALUES (28, '683438c94bc945de9d4297b1cca20730', '韭菜鸡蛋虾仁三鲜饺子 ', '/static/images/app/1c526086885311e6a9a10242ac110002_2398w_1516h.jpg', 2, '家里喜欢吃饺子，所以妈妈经常做，三鲜的尤其好吃。\r\n这个菜谱的用料可以做100多个饺子，差不多够4个人吃（依据个人食量了...）。\r\n我们家通常吃的比较素，喜欢荤一点的同学可以多放些虾仁。', '2019-03-12 19:07:21', 7.6, 546, 23, 3.8);
INSERT INTO `menu_summary` VALUES (29, 'baa13029841947f3b27e0d003cb443a3', '土豆炖排骨', '/static/images/app/bc9439e008df11e7947d0242ac110002_1280w_1024h.jpg', 2, '每家都做，家家都各有特色', '2019-04-25 19:07:21', 6.3, 4, 3, 3.5);
INSERT INTO `menu_summary` VALUES (30, 'a7fb8e6391f244c09f23ab724eb18cc1', '鲜嫩无比口水鸡 ', '/static/images/app/7072deaa857d4bd1b497386067b9395c_3024w_3024h.jpg', 4, '夏天是不是想吃辣！快告诉我“想吃！”\r\n怎样的口水鸡好吃！快告诉我“鲜嫩！”\r\n零失败的做法就是这里了', '2019-03-28 19:07:21', 6.5, 4, 2, 3.5);
INSERT INTO `menu_summary` VALUES (31, '06a449db80ad4a999a9c3b60b2faab01', '豌豆炒肉', '/static/images/app/e65fb38e889311e6b87c0242ac110003_534w_367h.jpg', 2, NULL, '2019-04-25 19:07:21', 6.8, 3, 3, 3.9);
INSERT INTO `menu_summary` VALUES (32, 'fb9c9a26f6a448bb91d42b840d076d27', '挂面新吃之挂面虾蔬披萨', '/static/images/app/9aa0f1a2329f4176a767f8eac00cbdb5_710w_757h.jpg', 2, '挂面是我们每家每户都会常备的食材，今天我们选取采用高温干蒸工艺的陈克明挂面，来做一份挂面创意料理~挂面虾蔬披萨。谁说挂面只能做汤面条，用挂面做的披萨，创意营养又美味，让你眼前一亮哦~', '2019-04-25 19:07:21', 6.9, 75, 36, 3.7);
INSERT INTO `menu_summary` VALUES (33, '6d0513e76e344e68911cbd7acb87669b', '照烧豆腐', '/static/images/app/244f180c42c74113ac2999c6fb8bd6cd_1632w_1224h.jpg', 2, '豆腐这么家常怎么做好吃？\r\n用三岛照烧汁，简单快手\r\n家常照烧豆腐轻松搞定✌', '2019-03-29 19:07:21', 6.9, 5, 2, 3.7);
INSERT INTO `menu_summary` VALUES (34, '2c107b88df964d0fb3b12067ad959924', '脆皮日本豆腐', '/static/images/app/18c15c48f83711e6947d0242ac110002_1280w_856h.jpg', 2, NULL, '2019-04-25 19:07:21', 5.6, 23, 12, 5.0);
INSERT INTO `menu_summary` VALUES (35, 'dfd9fd73133e4636bd9ce046d3dcd7b5', '清蒸鲈鱼', '/static/images/app/6db66de28efe42d8878ceabc3a593c30_3072w_2302h.jpg', 7, '鲈鱼味道鲜美，鱼刺少、营养高，用来清蒸不仅保持了鱼形的完整，还特别的鲜香肉嫩。\r\n清蒸鲈鱼也是一道几乎家家都会的家常菜，在我家里的上桌率也极高，这里就分享几个蒸鱼好吃的秘诀。\r\n1、鲈鱼要选新鲜现杀的；\r\n2、鱼一定要清洗干净并擦干表面的水份；\r\n3、高火蒸鱼，时间根据鱼的大小会略有调整，1斤重的鲈鱼蒸8分钟足够，蒸的时间过长肉质会老；\r\n4、最后关键的一步，把油烧到180度以上淋到鱼身上，激发鱼的鲜香味。', '2019-03-30 19:07:21', 5.6, 65, 23, 5.0);
INSERT INTO `menu_summary` VALUES (36, 'd4840ad99fea4ef2a62fb86d2bfc9a0d', '爆炒鱿鱼', '/static/images/app/755ac4d8a8b04c409143cd0c1925fc32_1616w_1080h.jpg', 2, NULL, '2019-04-25 19:07:21', 7.6, 65, 25, 5.0);
INSERT INTO `menu_summary` VALUES (37, 'd81329e6c383451699d856a1f71d25b2', '紫菜光饼', '/static/images/app/f494b1e40ed047699f0a74781e97809a_720w_576h.jpg', 2, '前两天我家户主在叨叨，说好久没做紫菜饼了，算算有一年没做啦！\r\n\r\n嘻嘻，是够久的啦，\r\n那还不简单，撸起袖子做吧！', '2019-04-25 19:07:21', 7.8, 76, 29, 4.1);
INSERT INTO `menu_summary` VALUES (38, '699452b7d68942a2a0e4aee592b79e1e', '无油喷香脆皮烤鸡腿儿', '/static/images/app/40f00f68f4ce498c92e98cacf5a52a3e_1688w_1124h.jpg', 5, '鸡腿儿是个好东西啊！其实不吃皮和鸡胸的热量相差不多～非常适合减脂期吃 或者鸡胸吃惯了换一下口味儿～口感真是比鸡胸提升无数个level！', '2019-04-25 19:07:21', 8.5, 74, 56, 4.6);
INSERT INTO `menu_summary` VALUES (39, 'addea5aaa26f470c90dcf8b164f24a22', '安东鸡', '/static/images/app/daf670cc73a911e6aae8cd5a4774d612.jpg', 6, '不一定正宗但好吃的Sunny版安东鸡（韩式红烧鸡），红薯粉被我换成了豆腐丝。\r\n千里迢迢背回来的两包云南石屏云丝被忘得死死的，才想起来吃，不合格的吃货。', '2019-03-19 19:07:21', 7.3, 566, 20, 3.7);
INSERT INTO `menu_summary` VALUES (40, 'd613d080aed84a96be974e9f7cabcdc7', '酸甜可口的糖醋里脊(鸡胸肉版)', '/static/images/app/482e09527e1c4e0b901c8e27e57eaa2f_1080w_864h.jpg', 2, '特别喜欢学校一食堂的糖醋里脊，放假回家后打算自己做。因为家里没有猪里脊又不想去买，就用鸡胸肉去做了。本以为口感会柴，没想到还不错。这道菜很简单，厨房小白也可以很容易掌握。', '2019-04-09 19:07:21', 7.8, 23, 23, 4.4);
INSERT INTO `menu_summary` VALUES (41, '5c229206192f46938049a0e10ff5b718', '豆角焖面', '/static/images/app/b17cf7ea883d11e6a9a10242ac110002_1989w_1321h.jpg', 6, '第一次吃到豆角焖面是因为室友“皇额娘”\r\n她是地地道道的内蒙妹子，一直心系家乡的食物\r\n后来在学校附近找到了一家地道的内蒙饭店\r\n每次我，皇额娘，皇姐都会坐车去吃，吃撑了走路回宿舍\r\n印象最深刻莫过于一大锅子的豆角焖面~\r\n每次会点上排骨，豆角，土豆一起焖\r\n除了焖面，大锅的内壁会贴上一个个金灿灿的饼子\r\n待一大锅肉面做好了，贴着的饼子也熟了，那是真真美味啊！', '2019-04-25 19:07:21', 8.6, 43, 25, 4.6);
INSERT INTO `menu_summary` VALUES (42, '84e184c0a4e14416bb92d826233fd816', '想妈秘制百香果鸡脚', '/static/images/app/e888fb482dcf11e7947d0242ac110002_1280w_1024h.jpg', 2, '我家大妞想姐姐是出名的鸡脚姐.\r\n那爱吃鸡脚的程度是你没法想到的.', '2019-04-25 19:07:21', 8.3, 54, 48, 4.6);
INSERT INTO `menu_summary` VALUES (43, '32b09d7ffb5247eda0d37b5d521423a1', '卤肉饭', '/static/images/app/eb2827c17a524b73bf73b70e89351340_1520w_1059h.jpg', 6, '有天晚上.看见人家说卤肉饭.\r\n立马口水万里..\r\n想到好久木有吃了.(≧∇≦)', '2019-04-18 19:07:21', 8.5, 73, 56, 4.6);
INSERT INTO `menu_summary` VALUES (44, '70460d48ec754d4287711710ae46921c', '嫩姜丝炒肉', '/static/images/app/4200b590888411e6b87c0242ac110003_640w_640h.jpg', 4, '#二木食记#和群里的kiki姐学的她家的家乡菜。\r\n嫩姜切丝，一定要刚刚上市的嫩姜，嫩姜甜且脆，老姜不仅辣且柴；红绿椒切丝，和肉丝一起爆炒。微辣、爽脆、合胃。\r\n偶尔跳脱一下也不错。', '2019-04-25 19:07:21', 5.0, 654, 20, 2.5);
INSERT INTO `menu_summary` VALUES (45, '6fab45e6fbdd477d9cadbfbee4ab7950', '腐乳蒸鸡', '/static/images/app/a1cfc74c880011e6b87c0242ac110003_500w_752h.jpg', 5, '天冷，除了吃炖菜，蒸菜也是不错的选择。尤其是工作比较忙碌的时候，只要提前把食材腌好，回家随时可以拿出来蒸，热气腾腾的，再搭配一样青菜，就是简单又美味的一餐。 \r\n今天的这道蒸鸡，特色在于用腐乳来调味。腐乳特有的咸鲜味和酒香搭配鸡肉倒也别有一番风味，是一道醇香惹味的下饭菜。', '2019-04-25 19:07:21', 7.8, 64, 56, 4.3);
INSERT INTO `menu_summary` VALUES (47, '05347f08072f46e783ce9efc3c7e9d3b', '韭菜盒子', '/static/images/app/13743e7ee18c4cc4a652e6d658eb8e73_1000w_1000h.jpg', 6, '妈妈的味道,小时候记忆中最香最好吃的莫过于妈妈做的韭菜盒子,现在妈妈年纪大了,正好母亲节也快到了,做上一份香喷喷的韭菜盒子献上女儿的一份孝心,这也是我的第一个菜谱,处女作送给妈妈！', '2019-04-28 21:05:38', 5.9, 787, 65, 3.0);
INSERT INTO `menu_summary` VALUES (51, '833688f5f7f64b0cbf7809d5357f6f2e', '蒜蓉小龙虾', '/static/images/app/f46986aa481211e7bc9d0242ac110002_721w_1280h.jpg', 6, '饭店里的小龙虾不但贵吃了还不放心，其实自己做出的美味完全可以不输大厨。', '2019-04-28 22:15:24', 6.9, 787, 1, 3.5);
INSERT INTO `menu_summary` VALUES (52, 'b36ffdff96264f53be7285e18cf699ef', '鱼香肉丝', '/static/images/app/5ca357b3193f4d40b5782254952e0eb4_731w_584h.jpg', 6, '说到“鱼香肉丝“，恐怕没几个人不爱的。其酸、甜、香、鲜，每个味道都足够诱人。口感也是超级开胃,非常讨巧，属于老少咸宜的一道菜', '2019-04-28 22:24:14', 9.1, 785, 75, 4.6);
INSERT INTO `menu_summary` VALUES (57, 'f40bbb0165b84a5e9899e77e92777ecf', '柠檬鱼', '/static/images/app/3dede55a8a9a11e6b87c0242ac110003_812w_1080h.jpg', 6, '', '2019-04-28 22:37:58', 7.8, 782, 58, 3.9);
INSERT INTO `menu_summary` VALUES (58, 'faf83bb0232f48548e478314ddf75542', '私家烧鸡腿肉', '/static/images/app/4a737210872811e6b87c0242ac110003_426w_640h.jpg', 6, '之前朋友送了我一瓶秘制红烧汁，用那个做出来的肉肉很好吃。 ', '2019-04-28 22:47:05', 8.1, 785, 40, 4.1);
INSERT INTO `menu_summary` VALUES (59, 'f78570a328e64ca6924c260bd92b84a6', '肉末茄子', '/static/images/app/8dbc593612194d278d8ca9b8a0959338_5184w_3456h.jpg', 6, '一道超级超级下饭菜', '2019-04-29 20:04:32', 7.0, 25, 23, 4.0);
INSERT INTO `menu_summary` VALUES (60, '943f7f4d1f204758893a64c59e2d0178', '0失败炸鸡腿', '/static/images/app/f1aec67ce5c143d1a9b8bf10b167b9e8_1080w_1920h.jpg', 5, NULL, '2019-04-30 16:06:33', 8.1, 22, 15, 4.4);

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins`  (
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `series` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_used` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`series`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
INSERT INTO `persistent_logins` VALUES ('test2', '2252oJEswDyI94tdwlIdgw==', 'UKel0Y4ZBoXqQPqfkYFimg==', '2019-04-28 18:01:44');
INSERT INTO `persistent_logins` VALUES ('test2', '7U9XFM4D6lBInq/REECk8g==', 'V+wKdaQh0KLeOatNMrrdag==', '2019-04-28 18:36:40');
INSERT INTO `persistent_logins` VALUES ('test2', 'BByRV2c0CX29yOR17KaQrw==', 'S7fbwiPaeQzfXJWGLhQHVA==', '2019-04-28 18:11:04');
INSERT INTO `persistent_logins` VALUES ('test2', 'FyZhjQcEmZeSR4uZ0fDKcA==', '0nGl7gNmS2V9kLInk4o60A==', '2019-04-28 18:27:47');
INSERT INTO `persistent_logins` VALUES ('test2', 'LBU95DeOdymR+XOUNLhBsA==', 'ltfnY40KWRm0FLtJSmmoNg==', '2019-04-28 18:16:19');
INSERT INTO `persistent_logins` VALUES ('test2', 'M18xtxurqDwck4B+wu6J0A==', 'nFsNfrTu9Ie4ifsg7MisNw==', '2019-04-28 18:19:49');
INSERT INTO `persistent_logins` VALUES ('test2', 'Mes4LyI9Jmt+0NmQNllyRw==', 'lsqzndkOoTjs7G/2IAAS4Q==', '2019-04-28 18:20:44');
INSERT INTO `persistent_logins` VALUES ('test2', 'mjovEGEga+bU87R01vIEnw==', 'hnjbfqBNYQJ/DlDUh7avgA==', '2019-04-28 18:25:59');
INSERT INTO `persistent_logins` VALUES ('test2', 'N93Asm6oGM7D/ZnUM81bHA==', 'vbM3j8oXU6/g+5UZ5/tLyw==', '2019-04-29 09:41:36');
INSERT INTO `persistent_logins` VALUES ('test2', 'qtl6fxt7GCW50jIGiM3pxQ==', 'p6mh9r7Dj66rFTNTumvo4w==', '2019-04-28 18:15:38');
INSERT INTO `persistent_logins` VALUES ('test2', 'RKdFE0M2bN73r7lvxbeZ5A==', 'fqPOQFm1FPodXqym2H+yCA==', '2019-04-28 18:32:21');
INSERT INTO `persistent_logins` VALUES ('test2', 'T/AfF3kqilpOQGNjSz8NUg==', '7ss2oMh+qVUT6TGIRBQz/A==', '2019-04-28 18:29:20');
INSERT INTO `persistent_logins` VALUES ('test2', 'TJhoMoULdFTLSClijBb+mQ==', 'aJFXd6/8VryMaMzoKn+3Hg==', '2019-04-28 18:13:37');
INSERT INTO `persistent_logins` VALUES ('test2', 'uOjBNmxYcm2liY3pKL7G9A==', 'i6BpgI7Z5XdL7tKVmxCj7A==', '2019-04-28 18:23:26');
INSERT INTO `persistent_logins` VALUES ('test2', 'y2tHUR7XeJFxOllWleQ/yw==', 'la3MYD+FsI29PjxtI+Xg8g==', '2019-04-28 18:14:51');

-- ----------------------------
-- Table structure for privilege_info
-- ----------------------------
DROP TABLE IF EXISTS `privilege_info`;
CREATE TABLE `privilege_info`  (
  `role_id` int(11) NOT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privilege_info
-- ----------------------------
INSERT INTO `privilege_info` VALUES (2, '893287144657780736', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '893288715881807872', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '893304960282787840', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894396523532517376', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894473486712438784', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894473651837992960', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894475142061621248', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894475827880656896', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894475985452269568', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894476118730473472', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894476276402749440', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894476950951690240', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894477107919323136', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894477244926263296', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894477420512411648', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894477851082883072', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894477995903811584', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894752734459199488', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (2, '894769217763540992', '2019-04-12 11:31:39');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES (1, '用户', 'USER', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);
INSERT INTO `role_info` VALUES (2, '管理员', 'ADMIN', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);
INSERT INTO `role_info` VALUES (3, '超级管理员', 'SUPER', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);

-- ----------------------------
-- Table structure for search_word
-- ----------------------------
DROP TABLE IF EXISTS `search_word`;
CREATE TABLE `search_word`  (
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '搜索词',
  `creat_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '搜索时间',
  `query_num` int(11) NULL DEFAULT 1 COMMENT '搜索次数',
  PRIMARY KEY (`word`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of search_word
-- ----------------------------
INSERT INTO `search_word` VALUES ('清蒸鳕鱼', '2019-04-25 19:29:32', 5);
INSERT INTO `search_word` VALUES ('豆', '2019-04-25 18:34:14', 3);
INSERT INTO `search_word` VALUES ('鱼', '2019-04-25 18:46:11', 1);

-- ----------------------------
-- Table structure for small_category
-- ----------------------------
DROP TABLE IF EXISTS `small_category`;
CREATE TABLE `small_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体分类名称',
  `big_id` int(11) NOT NULL COMMENT '所属分类的具体大类id',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0：可用，1：不可用）',
  `category` int(11) NULL DEFAULT 0 COMMENT '分类编号',
  `is_href` int(11) NOT NULL DEFAULT 0 COMMENT '是否是一个链接（0：是，1：不是）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_bigs`(`big_id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  CONSTRAINT `fk_bigs` FOREIGN KEY (`big_id`) REFERENCES `big_category` (`category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱小分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of small_category
-- ----------------------------
INSERT INTO `small_category` VALUES (1, '菜式', 101, 0, 1001, 1);
INSERT INTO `small_category` VALUES (2, '特色食品', 101, 0, 1002, 1);
INSERT INTO `small_category` VALUES (3, '特殊场合', 101, 0, 1003, 1);
INSERT INTO `small_category` VALUES (4, '功效', 101, 0, 1004, 1);
INSERT INTO `small_category` VALUES (5, '人群', 101, 0, 1005, 1);
INSERT INTO `small_category` VALUES (6, '视频专题', 101, 0, 1006, 1);
INSERT INTO `small_category` VALUES (7, '烘焙', 102, 0, 1007, 0);
INSERT INTO `small_category` VALUES (8, '甜品', 102, 0, 1008, 0);
INSERT INTO `small_category` VALUES (9, '饮品', 102, 0, 1009, 0);
INSERT INTO `small_category` VALUES (10, '猪', 103, 0, 1010, 0);
INSERT INTO `small_category` VALUES (11, '鸡', 103, 0, 1011, 0);
INSERT INTO `small_category` VALUES (12, '牛', 103, 0, 1012, 0);
INSERT INTO `small_category` VALUES (13, '羊', 103, 0, 1013, 0);
INSERT INTO `small_category` VALUES (14, '鸭', 103, 0, 1014, 0);
INSERT INTO `small_category` VALUES (15, '鸽子', 103, 0, 1015, 0);
INSERT INTO `small_category` VALUES (16, '牛蛙', 103, 0, 1016, 0);
INSERT INTO `small_category` VALUES (17, '鹅', 103, 0, 1017, 0);
INSERT INTO `small_category` VALUES (18, '兔肉', 103, 0, 1018, 0);
INSERT INTO `small_category` VALUES (19, '雪蛤', 103, 0, 1019, 0);
INSERT INTO `small_category` VALUES (20, '田鸡', 103, 0, 1020, 0);
INSERT INTO `small_category` VALUES (21, '鹌鹑', 103, 0, 1021, 0);
INSERT INTO `small_category` VALUES (22, '火鸡', 103, 0, 1022, 0);
INSERT INTO `small_category` VALUES (23, '驴肉', 103, 0, 1023, 0);
INSERT INTO `small_category` VALUES (24, '鹿肉', 103, 0, 1024, 0);
INSERT INTO `small_category` VALUES (25, '果实类蔬菜', 104, 0, 1025, 1);
INSERT INTO `small_category` VALUES (26, '水果', 104, 0, 1026, 0);
INSERT INTO `small_category` VALUES (27, '根茎蔬菜', 104, 0, 1027, 1);
INSERT INTO `small_category` VALUES (28, '叶类蔬菜', 104, 0, 1028, 1);
INSERT INTO `small_category` VALUES (29, '菌菇类', 104, 0, 1029, 1);
INSERT INTO `small_category` VALUES (30, '花朵植物类', 104, 0, 1030, 1);
INSERT INTO `small_category` VALUES (31, '汤羹', 105, 0, 1031, 0);
INSERT INTO `small_category` VALUES (32, '饭', 105, 0, 1032, 0);
INSERT INTO `small_category` VALUES (33, '饼', 105, 0, 1033, 0);
INSERT INTO `small_category` VALUES (34, '粥', 105, 0, 1034, 0);
INSERT INTO `small_category` VALUES (35, '饺子', 105, 0, 1035, 0);
INSERT INTO `small_category` VALUES (36, '馒头', 105, 0, 1036, 0);
INSERT INTO `small_category` VALUES (37, '三明治', 105, 0, 1037, 0);
INSERT INTO `small_category` VALUES (38, '馄饨', 105, 0, 1038, 0);
INSERT INTO `small_category` VALUES (39, '包子', 105, 0, 1039, 0);
INSERT INTO `small_category` VALUES (40, '汤', 105, 0, 1040, 1);
INSERT INTO `small_category` VALUES (41, '面条', 105, 0, 1041, 0);
INSERT INTO `small_category` VALUES (42, '烹调方法', 106, 0, 1042, 1);
INSERT INTO `small_category` VALUES (43, '口味', 106, 0, 1043, 1);
INSERT INTO `small_category` VALUES (44, '器具', 106, 0, 1044, 1);
INSERT INTO `small_category` VALUES (45, '异国风味', 106, 0, 1045, 1);
INSERT INTO `small_category` VALUES (46, '鱼', 107, 0, 1046, 0);
INSERT INTO `small_category` VALUES (47, '虾', 107, 0, 1047, 0);
INSERT INTO `small_category` VALUES (48, '贝', 107, 0, 1048, 1);
INSERT INTO `small_category` VALUES (49, '螃蟹', 107, 0, 1049, 0);
INSERT INTO `small_category` VALUES (50, '蛋类', 108, 0, 1050, 1);
INSERT INTO `small_category` VALUES (51, '奶制品', 108, 0, 1051, 1);
INSERT INTO `small_category` VALUES (52, '豆制品', 108, 0, 1052, 1);
INSERT INTO `small_category` VALUES (53, '米面类', 109, 0, 1053, 1);
INSERT INTO `small_category` VALUES (54, '干果类', 109, 0, 1054, 1);
INSERT INTO `small_category` VALUES (55, '腌咸制品', 109, 0, 1055, 1);

-- ----------------------------
-- Table structure for system_info
-- ----------------------------
DROP TABLE IF EXISTS `system_info`;
CREATE TABLE `system_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统信息的key',
  `m_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统信息的value',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否可用（0：可用，1：不可用）',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_info
-- ----------------------------
INSERT INTO `system_info` VALUES (1, 'default_user_avatar', '/static/images/ava/default_user_avator.png', '0', '用户的默认头像');
INSERT INTO `system_info` VALUES (2, 'site_oauth_qq', NULL, '1', '第三方登录-QQ回调地址');
INSERT INTO `system_info` VALUES (3, 'qq_app_id', NULL, '1', 'QQ互联APP_ID');
INSERT INTO `system_info` VALUES (4, 'qq_app_key', NULL, '1', 'QQ互联APP_KEY');
INSERT INTO `system_info` VALUES (5, 'site_oauth_weibo', NULL, '1', '第三方登录-微博回调地址');
INSERT INTO `system_info` VALUES (6, 'weibo_client_id', NULL, '1', '微博应用CLIENT_ID');
INSERT INTO `system_info` VALUES (7, 'weibo_client_sercret', NULL, '1', '微博应用CLIENT_SERCRET');
INSERT INTO `system_info` VALUES (8, 'site_oauth_douban', NULL, '1', '第三方登录-豆瓣回调地址');
INSERT INTO `system_info` VALUES (9, 'douban_api_key', NULL, '1', '豆瓣API_KEY');
INSERT INTO `system_info` VALUES (10, 'douban_secret_key', NULL, '1', '豆瓣SECRET_KEY');
INSERT INTO `system_info` VALUES (11, 'site_name', '爱下厨房', '0', '站点名称');
INSERT INTO `system_info` VALUES (12, 'site_domain', 'localhost', '0', '站点域名');
INSERT INTO `system_info` VALUES (13, 'site_copyright', 'Copyright © 爱厨房', '0', NULL);
INSERT INTO `system_info` VALUES (14, 'site_icp', 'IC UNKNOW', '0', '备案号');

-- ----------------------------
-- Table structure for tiny_category
-- ----------------------------
DROP TABLE IF EXISTS `tiny_category`;
CREATE TABLE `tiny_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `small_id` int(11) NOT NULL,
  `category` int(11) NULL DEFAULT NULL,
  `score` float(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_small`(`small_id`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  CONSTRAINT `fk_small` FOREIGN KEY (`small_id`) REFERENCES `small_category` (`category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 494 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱的具体分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiny_category
-- ----------------------------
INSERT INTO `tiny_category` VALUES (1, '家常菜', 0, 1001, 10001, NULL);
INSERT INTO `tiny_category` VALUES (2, '快手菜', 0, 1001, 10002, NULL);
INSERT INTO `tiny_category` VALUES (3, '下饭菜', 0, 1001, 10003, NULL);
INSERT INTO `tiny_category` VALUES (4, '素菜', 0, 1001, 10004, NULL);
INSERT INTO `tiny_category` VALUES (5, '大鱼大肉', 0, 1001, 10005, NULL);
INSERT INTO `tiny_category` VALUES (6, '下酒菜', 0, 1001, 10006, NULL);
INSERT INTO `tiny_category` VALUES (7, '小清新', 0, 1001, 10007, NULL);
INSERT INTO `tiny_category` VALUES (8, '创意菜', 0, 1001, 10008, NULL);
INSERT INTO `tiny_category` VALUES (9, '小吃', 0, 1002, 10009, NULL);
INSERT INTO `tiny_category` VALUES (10, '酱', 0, 1002, 10010, NULL);
INSERT INTO `tiny_category` VALUES (11, '沙拉', 0, 1002, 10011, NULL);
INSERT INTO `tiny_category` VALUES (12, '凉菜', 0, 1002, 10012, NULL);
INSERT INTO `tiny_category` VALUES (13, '零食', 0, 1002, 10013, NULL);
INSERT INTO `tiny_category` VALUES (14, '三明治', 0, 1002, 10014, NULL);
INSERT INTO `tiny_category` VALUES (15, '月饼', 0, 1002, 10015, NULL);
INSERT INTO `tiny_category` VALUES (16, '蒸蛋', 0, 1002, 10016, NULL);
INSERT INTO `tiny_category` VALUES (17, '寿司', 0, 1002, 10017, NULL);
INSERT INTO `tiny_category` VALUES (18, '粽子', 0, 1002, 10018, NULL);
INSERT INTO `tiny_category` VALUES (19, '鸡蛋羹', 0, 1002, 10019, NULL);
INSERT INTO `tiny_category` VALUES (20, '早餐', 0, 1003, 10020, NULL);
INSERT INTO `tiny_category` VALUES (21, '下午茶', 0, 1003, 10021, NULL);
INSERT INTO `tiny_category` VALUES (22, '便当', 0, 1003, 10022, NULL);
INSERT INTO `tiny_category` VALUES (23, '圣诞节', 0, 1003, 10023, NULL);
INSERT INTO `tiny_category` VALUES (24, '年夜饭', 0, 1003, 10024, NULL);
INSERT INTO `tiny_category` VALUES (25, '深夜食堂', 0, 1003, 10025, NULL);
INSERT INTO `tiny_category` VALUES (26, '情人节', 0, 1003, 10026, NULL);
INSERT INTO `tiny_category` VALUES (27, '宵夜', 0, 1003, 10027, NULL);
INSERT INTO `tiny_category` VALUES (28, '减肥', 0, 1004, 10028, NULL);
INSERT INTO `tiny_category` VALUES (29, '美容', 0, 1004, 10029, NULL);
INSERT INTO `tiny_category` VALUES (30, '润肺抗燥', 0, 1004, 10030, NULL);
INSERT INTO `tiny_category` VALUES (31, '补血', 0, 1004, 10031, NULL);
INSERT INTO `tiny_category` VALUES (32, '清热祛火', 0, 1004, 10032, NULL);
INSERT INTO `tiny_category` VALUES (33, '儿童', 0, 1005, 10033, NULL);
INSERT INTO `tiny_category` VALUES (34, '婴幼儿', 0, 1005, 10034, NULL);
INSERT INTO `tiny_category` VALUES (35, '老人', 0, 1005, 10035, NULL);
INSERT INTO `tiny_category` VALUES (36, '孕产妇', 0, 1005, 10036, NULL);
INSERT INTO `tiny_category` VALUES (37, '宝宝食谱', 0, 1005, 10037, NULL);
INSERT INTO `tiny_category` VALUES (38, '味蕾工坊', 0, 1006, 10038, NULL);
INSERT INTO `tiny_category` VALUES (39, '蛋糕', 0, 1007, 10039, NULL);
INSERT INTO `tiny_category` VALUES (40, '面包', 0, 1007, 10040, NULL);
INSERT INTO `tiny_category` VALUES (41, '饼干', 0, 1007, 10041, NULL);
INSERT INTO `tiny_category` VALUES (42, '披萨', 0, 1007, 10042, NULL);
INSERT INTO `tiny_category` VALUES (43, '派', 0, 1007, 10043, NULL);
INSERT INTO `tiny_category` VALUES (44, '司康', 0, 1007, 10044, NULL);
INSERT INTO `tiny_category` VALUES (45, '塔', 0, 1007, 10045, NULL);
INSERT INTO `tiny_category` VALUES (46, '泡芙', 0, 1007, 10046, NULL);
INSERT INTO `tiny_category` VALUES (47, '奶油霜', 0, 1007, 10047, NULL);
INSERT INTO `tiny_category` VALUES (48, '布丁', 0, 1008, 10048, NULL);
INSERT INTO `tiny_category` VALUES (49, '冷饮', 0, 1008, 10049, NULL);
INSERT INTO `tiny_category` VALUES (50, '果酱', 0, 1008, 10050, NULL);
INSERT INTO `tiny_category` VALUES (51, '糖水', 0, 1008, 10051, NULL);
INSERT INTO `tiny_category` VALUES (52, '冰淇淋', 0, 1008, 10052, NULL);
INSERT INTO `tiny_category` VALUES (53, '果冻', 0, 1008, 10053, NULL);
INSERT INTO `tiny_category` VALUES (54, '咖啡', 0, 1009, 10054, NULL);
INSERT INTO `tiny_category` VALUES (55, '豆浆', 0, 1009, 10055, NULL);
INSERT INTO `tiny_category` VALUES (56, '奶茶', 0, 1009, 10056, NULL);
INSERT INTO `tiny_category` VALUES (57, '酒', 0, 1009, 10057, NULL);
INSERT INTO `tiny_category` VALUES (58, '果汁', 0, 1009, 10058, NULL);
INSERT INTO `tiny_category` VALUES (59, '花草茶', 0, 1009, 10059, NULL);
INSERT INTO `tiny_category` VALUES (60, '猪肉', 0, 1010, 10060, NULL);
INSERT INTO `tiny_category` VALUES (61, '猪排', 0, 1010, 10061, NULL);
INSERT INTO `tiny_category` VALUES (62, '猪肉末', 0, 1010, 10062, NULL);
INSERT INTO `tiny_category` VALUES (63, '五花肉', 0, 1010, 10063, NULL);
INSERT INTO `tiny_category` VALUES (64, '猪蹄', 0, 1010, 10064, NULL);
INSERT INTO `tiny_category` VALUES (65, '瘦肉', 0, 1010, 10065, NULL);
INSERT INTO `tiny_category` VALUES (66, '里脊', 0, 1010, 10066, NULL);
INSERT INTO `tiny_category` VALUES (67, '猪肝', 0, 1010, 10067, NULL);
INSERT INTO `tiny_category` VALUES (68, '猪肚', 0, 1010, 10068, NULL);
INSERT INTO `tiny_category` VALUES (69, '猪皮', 0, 1010, 10069, NULL);
INSERT INTO `tiny_category` VALUES (70, '猪骨', 0, 1010, 10070, NULL);
INSERT INTO `tiny_category` VALUES (71, '肥肠', 0, 1010, 10071, NULL);
INSERT INTO `tiny_category` VALUES (72, '猪油', 0, 1010, 10072, NULL);
INSERT INTO `tiny_category` VALUES (73, '猪腰', 0, 1010, 10073, NULL);
INSERT INTO `tiny_category` VALUES (74, '猪耳朵', 0, 1010, 10074, NULL);
INSERT INTO `tiny_category` VALUES (75, '猪心', 0, 1010, 10075, NULL);
INSERT INTO `tiny_category` VALUES (76, '猪血', 0, 1010, 10076, NULL);
INSERT INTO `tiny_category` VALUES (77, '猪肺', 0, 1010, 10077, NULL);
INSERT INTO `tiny_category` VALUES (78, '鸡翅', 0, 1011, 10078, NULL);
INSERT INTO `tiny_category` VALUES (79, '鸡胸', 0, 1011, 10079, NULL);
INSERT INTO `tiny_category` VALUES (80, '鸡腿', 0, 1011, 10080, NULL);
INSERT INTO `tiny_category` VALUES (81, '鸡爪', 0, 1011, 10081, NULL);
INSERT INTO `tiny_category` VALUES (82, '鸡肉', 0, 1011, 10082, NULL);
INSERT INTO `tiny_category` VALUES (83, '乌鸡', 0, 1011, 10083, NULL);
INSERT INTO `tiny_category` VALUES (84, '鸡胗', 0, 1011, 10084, NULL);
INSERT INTO `tiny_category` VALUES (85, '土鸡', 0, 1011, 10085, NULL);
INSERT INTO `tiny_category` VALUES (86, '仔鸡', 0, 1011, 10086, NULL);
INSERT INTO `tiny_category` VALUES (87, '三黄鸡', 0, 1011, 10087, NULL);
INSERT INTO `tiny_category` VALUES (88, '鸡肝', 0, 1011, 10088, NULL);
INSERT INTO `tiny_category` VALUES (89, '老母鸡', 0, 1011, 10089, NULL);
INSERT INTO `tiny_category` VALUES (90, '鸡心', 0, 1011, 10090, NULL);
INSERT INTO `tiny_category` VALUES (91, '柴鸡', 0, 1011, 10091, NULL);
INSERT INTO `tiny_category` VALUES (92, '童子鸡', 0, 1011, 10092, NULL);
INSERT INTO `tiny_category` VALUES (93, '牛肉', 0, 1012, 10093, NULL);
INSERT INTO `tiny_category` VALUES (94, '牛腩', 0, 1012, 10094, NULL);
INSERT INTO `tiny_category` VALUES (95, '牛排', 0, 1012, 10095, NULL);
INSERT INTO `tiny_category` VALUES (96, '肥牛', 0, 1012, 10096, NULL);
INSERT INTO `tiny_category` VALUES (97, '牛里脊', 0, 1012, 10097, NULL);
INSERT INTO `tiny_category` VALUES (98, '牛腱', 0, 1012, 10098, NULL);
INSERT INTO `tiny_category` VALUES (99, '牛尾', 0, 1012, 10099, NULL);
INSERT INTO `tiny_category` VALUES (100, '牛肉末', 0, 1012, 10100, NULL);
INSERT INTO `tiny_category` VALUES (101, '牛筋', 0, 1012, 10101, NULL);
INSERT INTO `tiny_category` VALUES (102, '牛百叶', 0, 1012, 10102, NULL);
INSERT INTO `tiny_category` VALUES (103, '牛骨', 0, 1012, 10103, NULL);
INSERT INTO `tiny_category` VALUES (104, '牛肉馅', 0, 1012, 10104, NULL);
INSERT INTO `tiny_category` VALUES (105, '羊肉', 0, 1013, 10105, NULL);
INSERT INTO `tiny_category` VALUES (106, '羊排', 0, 1013, 10106, NULL);
INSERT INTO `tiny_category` VALUES (107, '羊腿', 0, 1013, 10107, NULL);
INSERT INTO `tiny_category` VALUES (108, '羊肉片', 0, 1013, 10108, NULL);
INSERT INTO `tiny_category` VALUES (109, '羊蝎子', 0, 1013, 10109, NULL);
INSERT INTO `tiny_category` VALUES (110, '鸭腿', 0, 1014, 10110, NULL);
INSERT INTO `tiny_category` VALUES (111, '鸭肉', 0, 1014, 10111, NULL);
INSERT INTO `tiny_category` VALUES (112, '老鸭', 0, 1014, 10112, NULL);
INSERT INTO `tiny_category` VALUES (113, '鸭胗', 0, 1014, 10113, NULL);
INSERT INTO `tiny_category` VALUES (114, '鸭血', 0, 1014, 10114, NULL);
INSERT INTO `tiny_category` VALUES (115, '鸭掌', 0, 1014, 10115, NULL);
INSERT INTO `tiny_category` VALUES (116, '鸭翅', 0, 1014, 10116, NULL);
INSERT INTO `tiny_category` VALUES (117, '鸭舌', 0, 1014, 10117, NULL);
INSERT INTO `tiny_category` VALUES (118, '鸭肠', 0, 1014, 10118, NULL);
INSERT INTO `tiny_category` VALUES (119, '鸭脖', 0, 1014, 10119, NULL);
INSERT INTO `tiny_category` VALUES (120, '鸭肝', 0, 1014, 10120, NULL);
INSERT INTO `tiny_category` VALUES (121, '鸭爪', 0, 1014, 10121, NULL);
INSERT INTO `tiny_category` VALUES (122, '彩椒', 0, 1025, 10122, NULL);
INSERT INTO `tiny_category` VALUES (123, '番茄', 0, 1025, 10123, NULL);
INSERT INTO `tiny_category` VALUES (124, '南瓜', 0, 1025, 10124, NULL);
INSERT INTO `tiny_category` VALUES (125, '玉米', 0, 1025, 10125, NULL);
INSERT INTO `tiny_category` VALUES (126, '茄子', 0, 1025, 10126, NULL);
INSERT INTO `tiny_category` VALUES (127, '黄瓜', 0, 1025, 10127, NULL);
INSERT INTO `tiny_category` VALUES (128, '豇豆', 0, 1025, 10128, NULL);
INSERT INTO `tiny_category` VALUES (129, '青椒', 0, 1025, 10129, NULL);
INSERT INTO `tiny_category` VALUES (130, '苦瓜', 0, 1025, 10130, NULL);
INSERT INTO `tiny_category` VALUES (131, '冬瓜', 0, 1025, 10131, NULL);
INSERT INTO `tiny_category` VALUES (132, '丝瓜', 0, 1025, 10132, NULL);
INSERT INTO `tiny_category` VALUES (133, '秋葵', 0, 1025, 10133, NULL);
INSERT INTO `tiny_category` VALUES (134, '西葫芦', 0, 1025, 10134, NULL);
INSERT INTO `tiny_category` VALUES (135, '毛豆', 0, 1025, 10135, NULL);
INSERT INTO `tiny_category` VALUES (136, '豌豆', 0, 1025, 10136, NULL);
INSERT INTO `tiny_category` VALUES (137, '四季豆', 0, 1025, 10137, NULL);
INSERT INTO `tiny_category` VALUES (138, '荷兰豆', 0, 1025, 10138, NULL);
INSERT INTO `tiny_category` VALUES (139, '蚕豆', 0, 1025, 10139, NULL);
INSERT INTO `tiny_category` VALUES (140, '圣女果 ', 0, 1025, 10140, NULL);
INSERT INTO `tiny_category` VALUES (141, '扁豆', 0, 1025, 10141, NULL);
INSERT INTO `tiny_category` VALUES (142, '刀豆', 0, 1025, 10142, NULL);
INSERT INTO `tiny_category` VALUES (143, '瓠瓜', 0, 1025, 10143, NULL);
INSERT INTO `tiny_category` VALUES (144, '玉米笋', 0, 1025, 10144, NULL);
INSERT INTO `tiny_category` VALUES (145, '西红柿', 0, 1025, 10145, NULL);
INSERT INTO `tiny_category` VALUES (146, '时令水果', 0, 1026, 10146, NULL);
INSERT INTO `tiny_category` VALUES (147, '柠檬', 0, 1026, 10147, NULL);
INSERT INTO `tiny_category` VALUES (148, '椰子', 0, 1026, 10148, NULL);
INSERT INTO `tiny_category` VALUES (149, '草莓', 0, 1026, 10149, NULL);
INSERT INTO `tiny_category` VALUES (150, '橙', 0, 1026, 10150, NULL);
INSERT INTO `tiny_category` VALUES (151, '牛油果', 0, 1026, 10151, NULL);
INSERT INTO `tiny_category` VALUES (152, '木瓜', 0, 1026, 10152, NULL);
INSERT INTO `tiny_category` VALUES (153, '山楂', 0, 1026, 10153, NULL);
INSERT INTO `tiny_category` VALUES (154, '蓝莓', 0, 1026, 10154, NULL);
INSERT INTO `tiny_category` VALUES (155, '西瓜', 0, 1026, 10155, NULL);
INSERT INTO `tiny_category` VALUES (156, '柚子', 0, 1026, 10156, NULL);
INSERT INTO `tiny_category` VALUES (157, '火龙果', 0, 1026, 10157, NULL);
INSERT INTO `tiny_category` VALUES (158, '樱桃', 0, 1026, 10158, NULL);
INSERT INTO `tiny_category` VALUES (159, '榴莲', 0, 1026, 10159, NULL);
INSERT INTO `tiny_category` VALUES (160, '西柚', 0, 1026, 10160, NULL);
INSERT INTO `tiny_category` VALUES (161, '桃', 0, 1026, 10161, NULL);
INSERT INTO `tiny_category` VALUES (162, '葡萄', 0, 1026, 10162, NULL);
INSERT INTO `tiny_category` VALUES (163, '金橘', 0, 1026, 10163, NULL);
INSERT INTO `tiny_category` VALUES (164, '黄桃', 0, 1026, 10164, NULL);
INSERT INTO `tiny_category` VALUES (165, '百香果', 0, 1026, 10165, NULL);
INSERT INTO `tiny_category` VALUES (166, '杨梅', 0, 1026, 10166, NULL);
INSERT INTO `tiny_category` VALUES (167, '桔子', 0, 1026, 10167, NULL);
INSERT INTO `tiny_category` VALUES (168, '荔枝', 0, 1026, 10168, NULL);
INSERT INTO `tiny_category` VALUES (169, '无花果', 0, 1026, 10169, NULL);
INSERT INTO `tiny_category` VALUES (170, '石榴', 0, 1026, 10170, NULL);
INSERT INTO `tiny_category` VALUES (171, '杏子', 0, 1026, 10171, NULL);
INSERT INTO `tiny_category` VALUES (172, '桑葚', 0, 1026, 10172, NULL);
INSERT INTO `tiny_category` VALUES (173, '哈密瓜', 0, 1026, 10173, NULL);
INSERT INTO `tiny_category` VALUES (174, '柿子', 0, 1026, 10174, NULL);
INSERT INTO `tiny_category` VALUES (175, '李子', 0, 1026, 10175, NULL);
INSERT INTO `tiny_category` VALUES (176, '青梅', 0, 1026, 10176, NULL);
INSERT INTO `tiny_category` VALUES (177, '枇杷', 0, 1026, 10177, NULL);
INSERT INTO `tiny_category` VALUES (178, '香瓜', 0, 1026, 10178, NULL);
INSERT INTO `tiny_category` VALUES (179, '甘蔗', 0, 1026, 10179, NULL);
INSERT INTO `tiny_category` VALUES (180, '覆盆子', 0, 1026, 10180, NULL);
INSERT INTO `tiny_category` VALUES (181, '杨桃', 0, 1026, 10181, NULL);
INSERT INTO `tiny_category` VALUES (182, '橘子', 0, 1026, 10182, NULL);
INSERT INTO `tiny_category` VALUES (183, '金桔', 0, 1026, 10183, NULL);
INSERT INTO `tiny_category` VALUES (184, '杏', 0, 1026, 10184, NULL);
INSERT INTO `tiny_category` VALUES (185, '土豆', 0, 1027, 10185, NULL);
INSERT INTO `tiny_category` VALUES (186, '萝卜', 0, 1027, 10186, NULL);
INSERT INTO `tiny_category` VALUES (187, '紫薯', 0, 1027, 10187, NULL);
INSERT INTO `tiny_category` VALUES (188, '红薯', 0, 1027, 10188, NULL);
INSERT INTO `tiny_category` VALUES (189, '胡萝卜', 0, 1027, 10189, NULL);
INSERT INTO `tiny_category` VALUES (190, '山药', 0, 1027, 10190, NULL);
INSERT INTO `tiny_category` VALUES (191, '藕', 0, 1027, 10191, NULL);
INSERT INTO `tiny_category` VALUES (192, '芋头', 0, 1027, 10192, NULL);
INSERT INTO `tiny_category` VALUES (193, '笋', 0, 1027, 10193, NULL);
INSERT INTO `tiny_category` VALUES (194, '茭白', 0, 1027, 10194, NULL);
INSERT INTO `tiny_category` VALUES (195, '马蹄', 0, 1027, 10195, NULL);
INSERT INTO `tiny_category` VALUES (196, '牛蒡', 0, 1027, 10196, NULL);
INSERT INTO `tiny_category` VALUES (197, '菱角', 0, 1027, 10197, NULL);
INSERT INTO `tiny_category` VALUES (198, '芹菜', 0, 1028, 10198, NULL);
INSERT INTO `tiny_category` VALUES (199, '白菜', 0, 1028, 10199, NULL);
INSERT INTO `tiny_category` VALUES (200, '韭菜', 0, 1028, 10200, NULL);
INSERT INTO `tiny_category` VALUES (201, '菠菜', 0, 1028, 10201, NULL);
INSERT INTO `tiny_category` VALUES (202, '西兰花 ', 0, 1028, 10202, NULL);
INSERT INTO `tiny_category` VALUES (203, '圆白菜', 0, 1028, 10203, NULL);
INSERT INTO `tiny_category` VALUES (204, '花椰菜', 0, 1028, 10204, NULL);
INSERT INTO `tiny_category` VALUES (205, '莴苣', 0, 1028, 10205, NULL);
INSERT INTO `tiny_category` VALUES (206, '青菜 ', 0, 1028, 10206, NULL);
INSERT INTO `tiny_category` VALUES (207, '娃娃菜', 0, 1028, 10207, NULL);
INSERT INTO `tiny_category` VALUES (208, '生菜', 0, 1028, 10208, NULL);
INSERT INTO `tiny_category` VALUES (209, '甘蓝', 0, 1028, 10209, NULL);
INSERT INTO `tiny_category` VALUES (210, '蒜薹', 0, 1028, 10210, NULL);
INSERT INTO `tiny_category` VALUES (211, '紫甘蓝', 0, 1028, 10211, NULL);
INSERT INTO `tiny_category` VALUES (212, '空心菜', 0, 1028, 10212, NULL);
INSERT INTO `tiny_category` VALUES (213, '油菜', 0, 1028, 10213, NULL);
INSERT INTO `tiny_category` VALUES (214, '荠菜', 0, 1028, 10214, NULL);
INSERT INTO `tiny_category` VALUES (215, '香椿', 0, 1028, 10215, NULL);
INSERT INTO `tiny_category` VALUES (216, '茼蒿', 0, 1028, 10216, NULL);
INSERT INTO `tiny_category` VALUES (217, '菜心', 0, 1028, 10217, NULL);
INSERT INTO `tiny_category` VALUES (218, '芥兰', 0, 1028, 10218, NULL);
INSERT INTO `tiny_category` VALUES (219, '黄花菜', 0, 1028, 10219, NULL);
INSERT INTO `tiny_category` VALUES (220, '韭黄', 0, 1028, 10220, NULL);
INSERT INTO `tiny_category` VALUES (221, '苋菜', 0, 1028, 10221, NULL);
INSERT INTO `tiny_category` VALUES (222, '紫苏', 0, 1028, 10222, NULL);
INSERT INTO `tiny_category` VALUES (223, '芥菜', 0, 1028, 10223, NULL);
INSERT INTO `tiny_category` VALUES (224, '油麦菜', 0, 1028, 10224, NULL);
INSERT INTO `tiny_category` VALUES (225, '豌豆苗', 0, 1028, 10225, NULL);
INSERT INTO `tiny_category` VALUES (226, '苦菊', 0, 1028, 10226, NULL);
INSERT INTO `tiny_category` VALUES (227, '青蒜', 0, 1028, 10227, NULL);
INSERT INTO `tiny_category` VALUES (228, '鱼腥草', 0, 1028, 10228, NULL);
INSERT INTO `tiny_category` VALUES (229, '马兰', 0, 1028, 10229, NULL);
INSERT INTO `tiny_category` VALUES (230, '蕨菜', 0, 1028, 10230, NULL);
INSERT INTO `tiny_category` VALUES (231, '西洋菜', 0, 1028, 10231, NULL);
INSERT INTO `tiny_category` VALUES (232, '水芹', 0, 1028, 10232, NULL);
INSERT INTO `tiny_category` VALUES (233, '儿菜', 0, 1028, 10233, NULL);
INSERT INTO `tiny_category` VALUES (234, '豌豆尖', 0, 1028, 10234, NULL);
INSERT INTO `tiny_category` VALUES (235, '芝麻菜', 0, 1028, 10235, NULL);
INSERT INTO `tiny_category` VALUES (236, '芦蒿', 0, 1028, 10236, NULL);
INSERT INTO `tiny_category` VALUES (237, '穿心莲', 0, 1028, 10237, NULL);
INSERT INTO `tiny_category` VALUES (238, '孢子甘蓝', 0, 1028, 10238, NULL);
INSERT INTO `tiny_category` VALUES (239, '萝卜苗', 0, 1028, 10239, NULL);
INSERT INTO `tiny_category` VALUES (240, '红菜苔', 0, 1028, 10240, NULL);
INSERT INTO `tiny_category` VALUES (241, '牛至', 0, 1028, 10241, NULL);
INSERT INTO `tiny_category` VALUES (242, '蒿子杆', 0, 1028, 10242, NULL);
INSERT INTO `tiny_category` VALUES (243, '包菜', 0, 1028, 10243, NULL);
INSERT INTO `tiny_category` VALUES (244, '莴笋 ', 0, 1028, 10244, NULL);
INSERT INTO `tiny_category` VALUES (245, '花菜', 0, 1028, 10245, NULL);
INSERT INTO `tiny_category` VALUES (246, '蒜苔', 0, 1028, 10246, NULL);
INSERT INTO `tiny_category` VALUES (247, '豆苗', 0, 1028, 10247, NULL);
INSERT INTO `tiny_category` VALUES (248, '披萨草', 0, 1028, 10248, NULL);
INSERT INTO `tiny_category` VALUES (249, '香菇', 0, 1029, 10249, NULL);
INSERT INTO `tiny_category` VALUES (250, '杏鲍菇', 0, 1029, 10250, NULL);
INSERT INTO `tiny_category` VALUES (251, '银耳', 0, 1029, 10251, NULL);
INSERT INTO `tiny_category` VALUES (252, '木耳', 0, 1029, 10252, NULL);
INSERT INTO `tiny_category` VALUES (253, '金针菇', 0, 1029, 10253, NULL);
INSERT INTO `tiny_category` VALUES (254, '蘑菇', 0, 1029, 10254, NULL);
INSERT INTO `tiny_category` VALUES (255, '茶树菇', 0, 1029, 10255, NULL);
INSERT INTO `tiny_category` VALUES (256, '平菇', 0, 1029, 10256, NULL);
INSERT INTO `tiny_category` VALUES (257, '松茸', 0, 1029, 10257, NULL);
INSERT INTO `tiny_category` VALUES (258, '鸡腿菇', 0, 1029, 10258, NULL);
INSERT INTO `tiny_category` VALUES (259, '草菇', 0, 1029, 10259, NULL);
INSERT INTO `tiny_category` VALUES (260, '竹荪', 0, 1029, 10260, NULL);
INSERT INTO `tiny_category` VALUES (261, '蟹味菇', 0, 1029, 10261, NULL);
INSERT INTO `tiny_category` VALUES (262, '花菇', 0, 1029, 10262, NULL);
INSERT INTO `tiny_category` VALUES (263, '猴头菇', 0, 1029, 10263, NULL);
INSERT INTO `tiny_category` VALUES (264, '牛肝菌', 0, 1029, 10264, NULL);
INSERT INTO `tiny_category` VALUES (265, '灵芝', 0, 1029, 10265, NULL);
INSERT INTO `tiny_category` VALUES (266, '榛蘑', 0, 1029, 10266, NULL);
INSERT INTO `tiny_category` VALUES (267, '白玉菇', 0, 1029, 10267, NULL);
INSERT INTO `tiny_category` VALUES (268, '姬松茸', 0, 1029, 10268, NULL);
INSERT INTO `tiny_category` VALUES (269, '滑子菇', 0, 1029, 10269, NULL);
INSERT INTO `tiny_category` VALUES (270, '发菜', 0, 1029, 10270, NULL);
INSERT INTO `tiny_category` VALUES (271, '白灵菇', 0, 1029, 10271, NULL);
INSERT INTO `tiny_category` VALUES (272, '袖珍菇', 0, 1029, 10272, NULL);
INSERT INTO `tiny_category` VALUES (273, '双孢菇', 0, 1029, 10273, NULL);
INSERT INTO `tiny_category` VALUES (274, '秀珍菇', 0, 1029, 10274, NULL);
INSERT INTO `tiny_category` VALUES (275, '茶叶', 0, 1030, 10275, NULL);
INSERT INTO `tiny_category` VALUES (276, '桂花', 0, 1030, 10276, NULL);
INSERT INTO `tiny_category` VALUES (277, '玫瑰', 0, 1030, 10277, NULL);
INSERT INTO `tiny_category` VALUES (278, '薄荷', 0, 1030, 10278, NULL);
INSERT INTO `tiny_category` VALUES (279, '菊花', 0, 1030, 10279, NULL);
INSERT INTO `tiny_category` VALUES (280, '洛神花', 0, 1030, 10280, NULL);
INSERT INTO `tiny_category` VALUES (281, '茉莉花', 0, 1030, 10281, NULL);
INSERT INTO `tiny_category` VALUES (282, '槐花', 0, 1030, 10282, NULL);
INSERT INTO `tiny_category` VALUES (283, '金银花', 0, 1030, 10283, NULL);
INSERT INTO `tiny_category` VALUES (284, '炒饭', 0, 1032, 10284, NULL);
INSERT INTO `tiny_category` VALUES (285, '焖', 0, 1032, 10285, NULL);
INSERT INTO `tiny_category` VALUES (286, '饭团', 0, 1032, 10286, NULL);
INSERT INTO `tiny_category` VALUES (287, '盖浇饭', 0, 1032, 10287, NULL);
INSERT INTO `tiny_category` VALUES (288, '煲仔饭', 0, 1032, 10288, NULL);
INSERT INTO `tiny_category` VALUES (289, '焗饭', 0, 1032, 10289, NULL);
INSERT INTO `tiny_category` VALUES (290, '烩饭', 0, 1032, 10290, NULL);
INSERT INTO `tiny_category` VALUES (291, '拌面', 0, 1041, 10291, NULL);
INSERT INTO `tiny_category` VALUES (292, '炒面', 0, 1041, 10292, NULL);
INSERT INTO `tiny_category` VALUES (293, '汤面', 0, 1041, 10293, NULL);
INSERT INTO `tiny_category` VALUES (294, '凉面', 0, 1041, 10294, NULL);
INSERT INTO `tiny_category` VALUES (295, '焖面', 0, 1041, 10295, NULL);
INSERT INTO `tiny_category` VALUES (296, '煎', 0, 1042, 10296, NULL);
INSERT INTO `tiny_category` VALUES (297, '蒸', 0, 1042, 10297, NULL);
INSERT INTO `tiny_category` VALUES (298, '炖', 0, 1042, 10298, NULL);
INSERT INTO `tiny_category` VALUES (299, '红烧', 0, 1042, 10299, NULL);
INSERT INTO `tiny_category` VALUES (300, '辣', 0, 1043, 10300, NULL);
INSERT INTO `tiny_category` VALUES (301, '咖喱', 0, 1043, 10301, NULL);
INSERT INTO `tiny_category` VALUES (302, '糖醋', 0, 1043, 10302, NULL);
INSERT INTO `tiny_category` VALUES (303, '蒜香', 0, 1043, 10303, NULL);
INSERT INTO `tiny_category` VALUES (304, '烤箱', 0, 1044, 10304, NULL);
INSERT INTO `tiny_category` VALUES (305, '烤箱菜', 0, 1044, 10305, NULL);
INSERT INTO `tiny_category` VALUES (306, '电饭煲', 0, 1044, 10306, NULL);
INSERT INTO `tiny_category` VALUES (307, '日式', 0, 1045, 10307, NULL);
INSERT INTO `tiny_category` VALUES (308, '韩式', 0, 1045, 10308, NULL);
INSERT INTO `tiny_category` VALUES (309, '西式', 0, 1045, 10309, NULL);
INSERT INTO `tiny_category` VALUES (310, '海水鱼', 0, 1046, 10310, NULL);
INSERT INTO `tiny_category` VALUES (311, '淡水鱼', 0, 1046, 10311, NULL);
INSERT INTO `tiny_category` VALUES (312, '鱼头', 0, 1046, 10312, NULL);
INSERT INTO `tiny_category` VALUES (313, '鱼干', 0, 1046, 10313, NULL);
INSERT INTO `tiny_category` VALUES (314, '鱼籽', 0, 1046, 10314, NULL);
INSERT INTO `tiny_category` VALUES (315, '鱼肚', 0, 1046, 10315, NULL);
INSERT INTO `tiny_category` VALUES (316, '虾仁', 0, 1047, 10316, NULL);
INSERT INTO `tiny_category` VALUES (317, '海米', 0, 1047, 10317, NULL);
INSERT INTO `tiny_category` VALUES (318, '虾皮', 0, 1047, 10318, NULL);
INSERT INTO `tiny_category` VALUES (319, '明虾', 0, 1047, 10319, NULL);
INSERT INTO `tiny_category` VALUES (320, '基围虾', 0, 1047, 10320, NULL);
INSERT INTO `tiny_category` VALUES (321, '龙虾', 0, 1047, 10321, NULL);
INSERT INTO `tiny_category` VALUES (322, '小龙虾', 0, 1047, 10322, NULL);
INSERT INTO `tiny_category` VALUES (323, '河虾', 0, 1047, 10323, NULL);
INSERT INTO `tiny_category` VALUES (324, '海虾', 0, 1047, 10324, NULL);
INSERT INTO `tiny_category` VALUES (325, '皮皮虾', 0, 1047, 10325, NULL);
INSERT INTO `tiny_category` VALUES (326, '北极虾', 0, 1047, 10326, NULL);
INSERT INTO `tiny_category` VALUES (327, '虾干', 0, 1047, 10327, NULL);
INSERT INTO `tiny_category` VALUES (328, '青虾', 0, 1047, 10328, NULL);
INSERT INTO `tiny_category` VALUES (329, '草虾', 0, 1047, 10329, NULL);
INSERT INTO `tiny_category` VALUES (330, '海白虾', 0, 1047, 10330, NULL);
INSERT INTO `tiny_category` VALUES (331, '虾米', 0, 1047, 10331, NULL);
INSERT INTO `tiny_category` VALUES (332, '蛤蜊', 0, 1048, 10332, NULL);
INSERT INTO `tiny_category` VALUES (333, '干贝', 0, 1048, 10333, NULL);
INSERT INTO `tiny_category` VALUES (334, '鲍鱼', 0, 1048, 10334, NULL);
INSERT INTO `tiny_category` VALUES (335, '扇贝', 0, 1048, 10335, NULL);
INSERT INTO `tiny_category` VALUES (336, '牡蛎', 0, 1048, 10336, NULL);
INSERT INTO `tiny_category` VALUES (337, '青口', 0, 1048, 10337, NULL);
INSERT INTO `tiny_category` VALUES (338, '蛏子', 0, 1048, 10338, NULL);
INSERT INTO `tiny_category` VALUES (339, '鲜贝', 0, 1048, 10339, NULL);
INSERT INTO `tiny_category` VALUES (340, '北极贝', 0, 1048, 10340, NULL);
INSERT INTO `tiny_category` VALUES (341, '梭子蟹', 0, 1049, 10341, NULL);
INSERT INTO `tiny_category` VALUES (342, '大闸蟹', 0, 1049, 10342, NULL);
INSERT INTO `tiny_category` VALUES (343, '蟹肉', 0, 1049, 10343, NULL);
INSERT INTO `tiny_category` VALUES (344, '蟹黄', 0, 1049, 10344, NULL);
INSERT INTO `tiny_category` VALUES (345, '鸡蛋', 0, 1050, 10345, NULL);
INSERT INTO `tiny_category` VALUES (346, '咸蛋', 0, 1050, 10346, NULL);
INSERT INTO `tiny_category` VALUES (347, '皮蛋', 0, 1050, 10347, NULL);
INSERT INTO `tiny_category` VALUES (348, '鹌鹑蛋', 0, 1050, 10348, NULL);
INSERT INTO `tiny_category` VALUES (349, '鸭蛋', 0, 1050, 10349, NULL);
INSERT INTO `tiny_category` VALUES (350, '咸鸭蛋', 0, 1050, 10350, NULL);
INSERT INTO `tiny_category` VALUES (351, '牛奶', 0, 1051, 10351, NULL);
INSERT INTO `tiny_category` VALUES (352, '黄油', 0, 1051, 10352, NULL);
INSERT INTO `tiny_category` VALUES (353, '巧克力', 0, 1051, 10353, NULL);
INSERT INTO `tiny_category` VALUES (354, '奶油', 0, 1051, 10354, NULL);
INSERT INTO `tiny_category` VALUES (355, '奶酪', 0, 1051, 10355, NULL);
INSERT INTO `tiny_category` VALUES (356, '酸奶', 0, 1051, 10356, NULL);
INSERT INTO `tiny_category` VALUES (357, '黑巧克力', 0, 1051, 10357, NULL);
INSERT INTO `tiny_category` VALUES (358, '淡奶油', 0, 1051, 10358, NULL);
INSERT INTO `tiny_category` VALUES (359, '奶油奶酪', 0, 1051, 10359, NULL);
INSERT INTO `tiny_category` VALUES (360, '炼乳', 0, 1051, 10360, NULL);
INSERT INTO `tiny_category` VALUES (361, '奶粉', 0, 1051, 10361, NULL);
INSERT INTO `tiny_category` VALUES (362, '马苏里拉奶酪', 0, 1051, 10362, NULL);
INSERT INTO `tiny_category` VALUES (363, '白巧克力', 0, 1051, 10363, NULL);
INSERT INTO `tiny_category` VALUES (364, '酸奶油', 0, 1051, 10364, NULL);
INSERT INTO `tiny_category` VALUES (365, '酥油', 0, 1051, 10365, NULL);
INSERT INTO `tiny_category` VALUES (366, '芝士', 0, 1051, 10366, NULL);
INSERT INTO `tiny_category` VALUES (367, '豆腐', 0, 1052, 10367, NULL);
INSERT INTO `tiny_category` VALUES (368, '香干', 0, 1052, 10368, NULL);
INSERT INTO `tiny_category` VALUES (369, '豆渣', 0, 1052, 10369, NULL);
INSERT INTO `tiny_category` VALUES (370, '千张', 0, 1052, 10370, NULL);
INSERT INTO `tiny_category` VALUES (371, '腐竹', 0, 1052, 10371, NULL);
INSERT INTO `tiny_category` VALUES (372, '素鸡', 0, 1052, 10372, NULL);
INSERT INTO `tiny_category` VALUES (373, '油豆皮', 0, 1052, 10373, NULL);
INSERT INTO `tiny_category` VALUES (374, '豆干', 0, 1052, 10374, NULL);
INSERT INTO `tiny_category` VALUES (375, '豆腐皮', 0, 1052, 10375, NULL);
INSERT INTO `tiny_category` VALUES (376, '面粉', 0, 1053, 10376, NULL);
INSERT INTO `tiny_category` VALUES (377, '面条', 0, 1053, 10377, NULL);
INSERT INTO `tiny_category` VALUES (378, '大米', 0, 1053, 10378, NULL);
INSERT INTO `tiny_category` VALUES (379, '高筋面粉', 0, 1053, 10379, NULL);
INSERT INTO `tiny_category` VALUES (380, '意大利面', 0, 1053, 10380, NULL);
INSERT INTO `tiny_category` VALUES (381, '糯米', 0, 1053, 10381, NULL);
INSERT INTO `tiny_category` VALUES (382, '低筋面粉', 0, 1053, 10382, NULL);
INSERT INTO `tiny_category` VALUES (383, '年糕', 0, 1053, 10383, NULL);
INSERT INTO `tiny_category` VALUES (384, '西米', 0, 1053, 10384, NULL);
INSERT INTO `tiny_category` VALUES (385, '糯米粉', 0, 1053, 10385, NULL);
INSERT INTO `tiny_category` VALUES (386, '粉丝', 0, 1053, 10386, NULL);
INSERT INTO `tiny_category` VALUES (387, '燕麦', 0, 1053, 10387, NULL);
INSERT INTO `tiny_category` VALUES (388, '米粉', 0, 1053, 10388, NULL);
INSERT INTO `tiny_category` VALUES (389, '酒酿', 0, 1053, 10389, NULL);
INSERT INTO `tiny_category` VALUES (390, '燕麦片', 0, 1053, 10390, NULL);
INSERT INTO `tiny_category` VALUES (391, '乌冬面', 0, 1053, 10391, NULL);
INSERT INTO `tiny_category` VALUES (392, '小米', 0, 1053, 10392, NULL);
INSERT INTO `tiny_category` VALUES (393, '玉米面', 0, 1053, 10393, NULL);
INSERT INTO `tiny_category` VALUES (394, '全麦粉', 0, 1053, 10394, NULL);
INSERT INTO `tiny_category` VALUES (395, '黑米', 0, 1053, 10395, NULL);
INSERT INTO `tiny_category` VALUES (396, '魔芋', 0, 1053, 10396, NULL);
INSERT INTO `tiny_category` VALUES (397, '方便面', 0, 1053, 10397, NULL);
INSERT INTO `tiny_category` VALUES (398, '粉条', 0, 1053, 10398, NULL);
INSERT INTO `tiny_category` VALUES (399, '米线', 0, 1053, 10399, NULL);
INSERT INTO `tiny_category` VALUES (400, '荞麦面', 0, 1053, 10400, NULL);
INSERT INTO `tiny_category` VALUES (401, '油条', 0, 1053, 10401, NULL);
INSERT INTO `tiny_category` VALUES (402, '黄豆面', 0, 1053, 10402, NULL);
INSERT INTO `tiny_category` VALUES (403, '消化饼干', 0, 1053, 10403, NULL);
INSERT INTO `tiny_category` VALUES (404, '面筋', 0, 1053, 10404, NULL);
INSERT INTO `tiny_category` VALUES (405, '粘米粉', 0, 1053, 10405, NULL);
INSERT INTO `tiny_category` VALUES (406, '凉粉', 0, 1053, 10406, NULL);
INSERT INTO `tiny_category` VALUES (407, '糙米', 0, 1053, 10407, NULL);
INSERT INTO `tiny_category` VALUES (408, '河粉', 0, 1053, 10408, NULL);
INSERT INTO `tiny_category` VALUES (409, '紫米', 0, 1053, 10409, NULL);
INSERT INTO `tiny_category` VALUES (410, '烤麸', 0, 1053, 10410, NULL);
INSERT INTO `tiny_category` VALUES (411, '小麦胚芽', 0, 1053, 10411, NULL);
INSERT INTO `tiny_category` VALUES (412, '澄面', 0, 1053, 10412, NULL);
INSERT INTO `tiny_category` VALUES (413, '粉皮', 0, 1053, 10413, NULL);
INSERT INTO `tiny_category` VALUES (414, '蕨根粉', 0, 1053, 10414, NULL);
INSERT INTO `tiny_category` VALUES (415, '藕粉', 0, 1053, 10415, NULL);
INSERT INTO `tiny_category` VALUES (416, '红曲米', 0, 1053, 10416, NULL);
INSERT INTO `tiny_category` VALUES (417, '莜面', 0, 1053, 10417, NULL);
INSERT INTO `tiny_category` VALUES (418, '黄米', 0, 1053, 10418, NULL);
INSERT INTO `tiny_category` VALUES (419, '荞麦', 0, 1053, 10419, NULL);
INSERT INTO `tiny_category` VALUES (420, '大麦', 0, 1053, 10420, NULL);
INSERT INTO `tiny_category` VALUES (421, '高粱米', 0, 1053, 10421, NULL);
INSERT INTO `tiny_category` VALUES (422, '红米', 0, 1053, 10422, NULL);
INSERT INTO `tiny_category` VALUES (423, '澄粉', 0, 1053, 10423, NULL);
INSERT INTO `tiny_category` VALUES (424, '黄豆粉', 0, 1053, 10424, NULL);
INSERT INTO `tiny_category` VALUES (425, '芝麻', 0, 1054, 10425, NULL);
INSERT INTO `tiny_category` VALUES (426, '花生', 0, 1054, 10426, NULL);
INSERT INTO `tiny_category` VALUES (427, '杏仁', 0, 1054, 10427, NULL);
INSERT INTO `tiny_category` VALUES (428, '红豆', 0, 1054, 10428, NULL);
INSERT INTO `tiny_category` VALUES (429, '枣', 0, 1054, 10429, NULL);
INSERT INTO `tiny_category` VALUES (430, '核桃', 0, 1054, 10430, NULL);
INSERT INTO `tiny_category` VALUES (431, '板栗', 0, 1054, 10431, NULL);
INSERT INTO `tiny_category` VALUES (432, '蔓越莓', 0, 1054, 10432, NULL);
INSERT INTO `tiny_category` VALUES (433, '绿豆', 0, 1054, 10433, NULL);
INSERT INTO `tiny_category` VALUES (434, '黄豆', 0, 1054, 10434, NULL);
INSERT INTO `tiny_category` VALUES (435, '薏米', 0, 1054, 10435, NULL);
INSERT INTO `tiny_category` VALUES (436, '葡萄干', 0, 1054, 10436, NULL);
INSERT INTO `tiny_category` VALUES (437, '莲子', 0, 1054, 10437, NULL);
INSERT INTO `tiny_category` VALUES (438, '橄榄', 0, 1054, 10438, NULL);
INSERT INTO `tiny_category` VALUES (439, '黑豆', 0, 1054, 10439, NULL);
INSERT INTO `tiny_category` VALUES (440, '蜜豆', 0, 1054, 10440, NULL);
INSERT INTO `tiny_category` VALUES (441, '芸豆', 0, 1054, 10441, NULL);
INSERT INTO `tiny_category` VALUES (442, '腰果', 0, 1054, 10442, NULL);
INSERT INTO `tiny_category` VALUES (443, '桃胶', 0, 1054, 10443, NULL);
INSERT INTO `tiny_category` VALUES (444, '乌梅', 0, 1054, 10444, NULL);
INSERT INTO `tiny_category` VALUES (445, '松仁', 0, 1054, 10445, NULL);
INSERT INTO `tiny_category` VALUES (446, '无花果', 0, 1054, 10446, NULL);
INSERT INTO `tiny_category` VALUES (447, '银杏果', 0, 1054, 10447, NULL);
INSERT INTO `tiny_category` VALUES (448, '话梅', 0, 1054, 10448, NULL);
INSERT INTO `tiny_category` VALUES (449, '榛子', 0, 1054, 10449, NULL);
INSERT INTO `tiny_category` VALUES (450, '鹰嘴豆', 0, 1054, 10450, NULL);
INSERT INTO `tiny_category` VALUES (451, '罗汉果', 0, 1054, 10451, NULL);
INSERT INTO `tiny_category` VALUES (452, '芡实', 0, 1054, 10452, NULL);
INSERT INTO `tiny_category` VALUES (453, '开心果', 0, 1054, 10453, NULL);
INSERT INTO `tiny_category` VALUES (454, '山楂干', 0, 1054, 10454, NULL);
INSERT INTO `tiny_category` VALUES (455, '南瓜子', 0, 1054, 10455, NULL);
INSERT INTO `tiny_category` VALUES (456, '瓜子仁', 0, 1054, 10456, NULL);
INSERT INTO `tiny_category` VALUES (457, '眉豆', 0, 1054, 10457, NULL);
INSERT INTO `tiny_category` VALUES (458, '红腰豆', 0, 1054, 10458, NULL);
INSERT INTO `tiny_category` VALUES (459, '松子', 0, 1054, 10459, NULL);
INSERT INTO `tiny_category` VALUES (460, '白果', 0, 1054, 10460, NULL);
INSERT INTO `tiny_category` VALUES (461, '火腿', 0, 1055, 10461, NULL);
INSERT INTO `tiny_category` VALUES (462, '香肠', 0, 1055, 10462, NULL);
INSERT INTO `tiny_category` VALUES (463, '培根', 0, 1055, 10463, NULL);
INSERT INTO `tiny_category` VALUES (464, '腊肉', 0, 1055, 10464, NULL);
INSERT INTO `tiny_category` VALUES (465, '酸菜', 0, 1055, 10465, NULL);
INSERT INTO `tiny_category` VALUES (466, '泡菜', 0, 1055, 10466, NULL);
INSERT INTO `tiny_category` VALUES (467, '肉松', 0, 1055, 10467, NULL);
INSERT INTO `tiny_category` VALUES (468, '梅干菜', 0, 1055, 10468, NULL);
INSERT INTO `tiny_category` VALUES (469, '雪里蕻', 0, 1055, 10469, NULL);
INSERT INTO `tiny_category` VALUES (470, '榨菜', 0, 1055, 10470, NULL);
INSERT INTO `tiny_category` VALUES (471, '辣白菜', 0, 1055, 10471, NULL);
INSERT INTO `tiny_category` VALUES (472, '笋干', 0, 1055, 10472, NULL);
INSERT INTO `tiny_category` VALUES (473, '鱼丸', 0, 1055, 10473, NULL);
INSERT INTO `tiny_category` VALUES (474, '橄榄菜', 0, 1055, 10474, NULL);
INSERT INTO `tiny_category` VALUES (475, '咸菜', 0, 1055, 10475, NULL);
INSERT INTO `tiny_category` VALUES (476, '萝卜干', 0, 1055, 10476, NULL);
INSERT INTO `tiny_category` VALUES (477, '咸肉', 0, 1055, 10477, NULL);
INSERT INTO `tiny_category` VALUES (478, '酸豇豆', 0, 1055, 10478, NULL);
INSERT INTO `tiny_category` VALUES (479, '肉丸', 0, 1055, 10479, NULL);
INSERT INTO `tiny_category` VALUES (480, '午餐肉', 0, 1055, 10480, NULL);
INSERT INTO `tiny_category` VALUES (481, '蟹棒', 0, 1055, 10481, NULL);
INSERT INTO `tiny_category` VALUES (482, '叉烧肉', 0, 1055, 10482, NULL);
INSERT INTO `tiny_category` VALUES (483, '芽菜', 0, 1055, 10483, NULL);
INSERT INTO `tiny_category` VALUES (484, '纳豆', 0, 1055, 10484, NULL);
INSERT INTO `tiny_category` VALUES (485, '大头菜', 0, 1055, 10485, NULL);
INSERT INTO `tiny_category` VALUES (486, '酸笋', 0, 1055, 10486, NULL);
INSERT INTO `tiny_category` VALUES (487, '木鱼花', 0, 1055, 10487, NULL);
INSERT INTO `tiny_category` VALUES (488, '冬菜', 0, 1055, 10488, NULL);
INSERT INTO `tiny_category` VALUES (489, '玉兰片', 0, 1055, 10489, NULL);
INSERT INTO `tiny_category` VALUES (490, '泡萝卜', 0, 1055, 10490, NULL);
INSERT INTO `tiny_category` VALUES (491, '咸黄瓜', 0, 1055, 10491, NULL);
INSERT INTO `tiny_category` VALUES (492, '叉烧', 0, 1055, 10492, NULL);
INSERT INTO `tiny_category` VALUES (493, '酸豆角', 0, 1055, 10493, NULL);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `last_login` datetime(0) NOT NULL COMMENT '最后一次登录时间',
  `mobile` int(11) NULL DEFAULT NULL COMMENT '手机号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0：正常，1：锁定，2：异常，3：注销）',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别（0：未知，1：男，2：女，）',
  `favors` int(11) NOT NULL DEFAULT 0 COMMENT '关注数',
  `follows` int(11) NOT NULL DEFAULT 0 COMMENT '被关注数',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `production` int(11) NULL DEFAULT 0 COMMENT '作品数量',
  `menus` int(11) NULL DEFAULT 0 COMMENT '发布的菜谱数量',
  `role_id` int(11) NULL DEFAULT 1 COMMENT '用户拥有的角色的id',
  `oauth_type` int(11) NULL DEFAULT NULL COMMENT '认证类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role`(`role_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '$2a$10$p8momL8581LuXYWaBPH9peeWXsHdyPNqvBiEIog7.iBzkRxXxh7nK', '/static/images/default_user_avator.png', '2019-04-18 04:38:28', NULL, '2019-04-11 16:13:05', NULL, 0, NULL, 0, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (2, 'alanwang', '$2a$10$p8momL8581LuXYWaBPH9peeWXsHdyPNqvBiEIog7.iBzkRxXxh7nK', '/static/images/default_user_avator.png', '2019-04-30 17:16:24', NULL, '2019-04-11 16:13:05', NULL, 0, '皮皮不皮', 0, 0, 0, NULL, 0, 0, 3, 0);
INSERT INTO `user_info` VALUES (4, 'peter2', '$2a$10$fjjukZYN4wUfkglAVCD0TucKSofyVl79.mRHziYKNys7/CiaiaaAu', '/static/images/default_user_avator.png', '2019-04-30 17:16:28', 'vungle@yeah.net', '2019-04-14 07:48:14', NULL, 0, '厨房闺娘', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (5, 'bobbob', '$2a$10$Zp9Nqczs.3U5ok8neJEFkOCCNSb2kylk7G4HvaTbor84d9DeljrRW', '/static/images/default_user_avator.png', '2019-04-25 02:24:54', 'plm2019@yeah.net', '2019-04-14 07:54:52', NULL, 0, '萌萌的猫团子', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (6, 'test22', '$2a$10$nQDN3lbVZN2PBK5eY7KxU.AUA0PwNAqDXsVBPH2s9bSOuzC8C8Vca', '/static/images/default_user_avator.png', '2019-05-05 17:58:41', 'qze2019@yeah.net', '2019-04-14 08:00:04', NULL, 0, '潇洒侠', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (7, 'country', '$2a$10$pbIPSQqQK7Q5D9KdcthlFOtul07su7uof18t.x4.DCi2WWeCoQhXW', '/static/images/default_user_avator.png', '2019-04-25 02:25:18', 'erobinette9721@gmail.com', '2019-04-17 20:47:46', NULL, 0, '活脱脱是个宝', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (8, 'shagua', '$2a$10$QgwFWjmk8IvF1qm6lbBDLesEp/sp.NA2b3zgCw73wAeN.n4v0qzFa', '/static/images/default_user_avator.png', '2019-04-27 00:51:11', '175695632@qq.com', '2019-04-27 00:51:11', NULL, 0, '傻瓜屁', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (9, 'ershazi', '$2a$10$bD8VnKeAgdcttDp4xyYz1ercKb8xUgu0UBSKCiYP8KqCajRnwfjNq', '/static/images/default_user_avator.png', '2019-04-27 00:52:44', '175695632@qq.com', '2019-04-27 00:52:44', NULL, 0, '傻瓜屁', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (10, 'pipizhu', '$2a$10$CRnVZpFEd4o3sNh7gTPtZe7PARnTC4588hftK/Zp3OyaNUDmyNDKa', '/static/images/default_user_avator.png', '2019-04-27 00:54:26', 'admin@qq.com', '2019-04-27 00:54:26', NULL, 0, '屁屁猪', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (11, 'zhuzhuxia', '$2a$10$BsP94GWQQUzz6bPPpz6ItOXQJdAhRm4JcPBGZCI3YRI7O3HfAudW2', '/static/images/default_user_avator.png', '2019-04-27 01:00:42', '32423423534@qq.com', '2019-04-27 01:00:42', NULL, 0, '猪猪侠', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (12, 'wangbadan', '$2a$10$T92MRlFSf4DOAVtj9l3Jt.0eC06Ia57XU55onx0U9sZ0NVuUz7wfC', '/static/images/ava/default_user_avator.png', '2019-05-05 23:25:50', 'admin@qq.com', '2019-05-05 23:25:50', NULL, 0, '小王八蛋', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (13, 'wangbadan2', '$2a$10$88u0hWzK7a1bt25VGpe3keMQ4YBEhsu3gsPz6UXYlQ/UPsVcDWFZW', '/static/images/ava/default_user_avator.png', '2019-05-05 23:27:26', 'admin@qq.com', '2019-05-05 23:27:26', NULL, 0, '小王八蛋2', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (14, 'shabi', '$2a$10$nayMoMqs.wTKM2xBU8SjruhbQWJqkvxth/z7tB9gsNyVjZFxnNCBK', '/static/images/ava/default_user_avator.png', '2019-05-06 00:15:33', 'admin@qq.com', '2019-05-06 00:15:33', NULL, 0, '傻逼是最可爱的', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (15, 'dididi', '$2a$10$ynpEYwDPz1ITmGGpBnGei.xuNaeXvW1Z8ZmNnttUUktrRX98qx2m.', '/static/images/ava/default_user_avator.png', '2019-05-06 15:30:49', 'admin@qq.com', '2019-05-06 15:30:49', NULL, 0, '滴滴滴', 1, 0, 0, NULL, 0, 0, 1, 0);
INSERT INTO `user_info` VALUES (16, 'nijiushigepi', '$2a$10$LuXY/pcQRC0L.4AoAkotb.sqc./MIwPxGwAICrNbJNywvv/UhTMJ6', '/static/images/ava/default_user_avator.png', '2019-05-06 17:21:59', 'pipi@qq.com', '2019-05-06 17:21:59', NULL, 0, '你就是个屁', 1, 0, 0, NULL, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for user_open_oauth
-- ----------------------------
DROP TABLE IF EXISTS `user_open_oauth`;
CREATE TABLE `user_open_oauth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expire_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oauth_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oauth_type` int(11) NULL DEFAULT NULL,
  `oauth_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_relation`;
CREATE TABLE `user_relation`  (
  `id` int(11) NOT NULL,
  `one_user_id` int(11) NULL DEFAULT NULL COMMENT '第一个用户的id',
  `two_user_id` int(11) NULL DEFAULT NULL COMMENT '第二个用户的id',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户关系（0：无关系，1：one关注two, 2：two关注one, 3：互相关注）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_releation_one`(`one_user_id`) USING BTREE,
  INDEX `fk_user_releation_two`(`two_user_id`) USING BTREE,
  CONSTRAINT `fk_user_releation_one` FOREIGN KEY (`one_user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_releation_two` FOREIGN KEY (`two_user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户关系表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
