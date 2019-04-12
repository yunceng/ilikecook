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

 Date: 12/04/2019 18:28:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for big_category
-- ----------------------------
DROP TABLE IF EXISTS `big_category`;
CREATE TABLE `big_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0：可用，1：不可用）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱大分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of big_category
-- ----------------------------
INSERT INTO `big_category` VALUES (1, '热门专题', 0);
INSERT INTO `big_category` VALUES (2, '烘焙甜品饮料', 0);
INSERT INTO `big_category` VALUES (3, '肉类', 0);
INSERT INTO `big_category` VALUES (4, '蔬菜水果', 0);
INSERT INTO `big_category` VALUES (5, '汤粥主食', 0);
INSERT INTO `big_category` VALUES (6, '口味特色', 0);
INSERT INTO `big_category` VALUES (7, '水产', 0);
INSERT INTO `big_category` VALUES (8, '蛋奶豆制品', 0);
INSERT INTO `big_category` VALUES (9, '米面干果腌咸', 0);

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
INSERT INTO `menu_info` VALUES ('894477851082883072', 'apidoc', 'system', '893287144657780736', 'Api文档', 'swagger-ui.html', 1, 2, 9, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894477995903811584', 'database/log', 'system', '893287144657780736', '数据库日志', 'druid', 1, 2, 10, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('894752734459199488', 'companyList', 'root', '000000000000000000', '公司管理', 'companyList', 1, 1, 1, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');
INSERT INTO `menu_info` VALUES ('903459378655395840', '/user/modify', 'userList', '893288715881807872', '密码重置', '/user/modify', 1, 3, 2, 1, '', '2019-04-12 11:31:39', '2019-04-12 11:31:39');

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
INSERT INTO `privilege_info` VALUES (1, '893287144657780736', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '893288715881807872', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '893304960282787840', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '894396523532517376', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '894473486712438784', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '894473651837992960', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '894477851082883072', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (1, '894477995903811584', '2019-04-12 11:31:39');
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
INSERT INTO `privilege_info` VALUES (3, '893287144657780736', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (3, '894477851082883072', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (3, '894477995903811584', '2019-04-12 11:31:39');
INSERT INTO `privilege_info` VALUES (3, '894752734459199488', '2019-04-12 11:31:39');

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
INSERT INTO `role_info` VALUES (1, '管理员', 'admin', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);
INSERT INTO `role_info` VALUES (2, '超级管理员', 'super', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);
INSERT INTO `role_info` VALUES (3, '用户', 'user', NULL, '2019-04-12 11:31:39', '2019-04-12 11:31:39', 0);

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
  INDEX `fk_big`(`big_id`) USING BTREE,
  CONSTRAINT `fk_big` FOREIGN KEY (`big_id`) REFERENCES `big_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱小分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of small_category
-- ----------------------------
INSERT INTO `small_category` VALUES (1, '菜式', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (2, '特色食品', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (3, '特殊场合', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (4, '功效', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (5, '人群', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (6, '视频专题', 1, 0, NULL, 1);
INSERT INTO `small_category` VALUES (7, '烘焙', 2, 0, 1007, 0);
INSERT INTO `small_category` VALUES (8, '甜品', 2, 0, 1008, 0);
INSERT INTO `small_category` VALUES (9, '饮品', 2, 0, 1009, 0);
INSERT INTO `small_category` VALUES (10, '猪', 3, 0, 1010, 0);
INSERT INTO `small_category` VALUES (11, '鸡', 3, 0, 1011, 0);
INSERT INTO `small_category` VALUES (12, '牛', 3, 0, 1012, 0);
INSERT INTO `small_category` VALUES (13, '羊', 3, 0, 1013, 0);
INSERT INTO `small_category` VALUES (14, '鸭', 3, 0, 1014, 0);
INSERT INTO `small_category` VALUES (15, '鸽子', 3, 0, 1015, 0);
INSERT INTO `small_category` VALUES (16, '牛蛙', 3, 0, 1016, 0);
INSERT INTO `small_category` VALUES (17, '鹅', 3, 0, 1017, 0);
INSERT INTO `small_category` VALUES (18, '兔肉', 3, 0, 1018, 0);
INSERT INTO `small_category` VALUES (19, '雪蛤', 3, 0, 1019, 0);
INSERT INTO `small_category` VALUES (20, '田鸡', 3, 0, 1020, 0);
INSERT INTO `small_category` VALUES (21, '鹌鹑', 3, 0, 1021, 0);
INSERT INTO `small_category` VALUES (22, '火鸡', 3, 0, 1022, 0);
INSERT INTO `small_category` VALUES (23, '驴肉', 3, 0, 1023, 0);
INSERT INTO `small_category` VALUES (24, '鹿肉', 3, 0, 1024, 0);
INSERT INTO `small_category` VALUES (25, '果实类蔬菜', 4, 0, NULL, 1);
INSERT INTO `small_category` VALUES (26, '水果', 4, 0, 1026, 0);
INSERT INTO `small_category` VALUES (27, '根茎蔬菜', 4, 0, NULL, 1);
INSERT INTO `small_category` VALUES (28, '叶类蔬菜', 4, 0, NULL, 1);
INSERT INTO `small_category` VALUES (29, '菌菇类', 4, 0, NULL, 1);
INSERT INTO `small_category` VALUES (30, '花朵植物类', 4, 0, NULL, 1);
INSERT INTO `small_category` VALUES (31, '汤羹', 5, 0, 1031, 0);
INSERT INTO `small_category` VALUES (32, '饭', 5, 0, 1032, 0);
INSERT INTO `small_category` VALUES (33, '饼', 5, 0, 1033, 0);
INSERT INTO `small_category` VALUES (34, '粥', 5, 0, 1034, 0);
INSERT INTO `small_category` VALUES (35, '饺子', 5, 0, 1035, 0);
INSERT INTO `small_category` VALUES (36, '馒头', 5, 0, 1036, 0);
INSERT INTO `small_category` VALUES (37, '三明治', 5, 0, 1037, 0);
INSERT INTO `small_category` VALUES (38, '馄饨', 5, 0, 1038, 0);
INSERT INTO `small_category` VALUES (39, '包子', 5, 0, 1039, 0);
INSERT INTO `small_category` VALUES (40, '汤', 5, 0, NULL, 1);
INSERT INTO `small_category` VALUES (41, '面条', 5, 0, 1041, 0);
INSERT INTO `small_category` VALUES (42, '烹调方法', 6, 0, NULL, 1);
INSERT INTO `small_category` VALUES (43, '口味', 6, 0, NULL, 1);
INSERT INTO `small_category` VALUES (44, '器具', 6, 0, NULL, 1);
INSERT INTO `small_category` VALUES (45, '异国风味', 6, 0, NULL, 1);
INSERT INTO `small_category` VALUES (46, '鱼', 7, 0, 1046, 0);
INSERT INTO `small_category` VALUES (47, '虾', 7, 0, 1047, 0);
INSERT INTO `small_category` VALUES (48, '贝', 7, 0, NULL, 1);
INSERT INTO `small_category` VALUES (49, '螃蟹', 7, 0, 1049, 0);
INSERT INTO `small_category` VALUES (50, '蛋类', 8, 0, NULL, 1);
INSERT INTO `small_category` VALUES (51, '奶制品', 8, 0, NULL, 1);
INSERT INTO `small_category` VALUES (52, '豆制品', 8, 0, NULL, 1);
INSERT INTO `small_category` VALUES (53, '米面类', 9, 0, NULL, 1);
INSERT INTO `small_category` VALUES (54, '干果类', 9, 0, NULL, 1);
INSERT INTO `small_category` VALUES (55, '腌咸制品', 9, 0, NULL, 1);

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
INSERT INTO `system_info` VALUES (1, 'default_user_avator', '/static/images/default_user_avator.png', '0', '用户的默认头像');
INSERT INTO `system_info` VALUES (2, 'site_oauth_qq', '/static/images/default_user_avator.png', '0', '第三方登录-QQ回调地址');
INSERT INTO `system_info` VALUES (3, 'qq_app_id', '/static/images/default_user_avator.png', '0', 'QQ互联APP_ID');
INSERT INTO `system_info` VALUES (4, 'qq_app_key', '/static/images/default_user_avator.png', '0', 'QQ互联APP_KEY');
INSERT INTO `system_info` VALUES (5, 'site_oauth_weibo', '/static/images/default_user_avator.png', '0', '第三方登录-微博回调地址');
INSERT INTO `system_info` VALUES (6, 'weibo_client_id', '/static/images/default_user_avator.png', '0', '微博应用CLIENT_ID');
INSERT INTO `system_info` VALUES (7, 'weibo_client_sercret', '/static/images/default_user_avator.png', '0', '微博应用CLIENT_SERCRET');
INSERT INTO `system_info` VALUES (8, 'site_oauth_douban', '/static/images/default_user_avator.png', '0', '第三方登录-豆瓣回调地址');
INSERT INTO `system_info` VALUES (9, 'douban_api_key', '/static/images/default_user_avator.png', '0', '豆瓣API_KEY');
INSERT INTO `system_info` VALUES (10, 'douban_secret_key', '/static/images/default_user_avator.png', '0', '豆瓣SECRET_KEY');
INSERT INTO `system_info` VALUES (11, 'site_name', '/static/images/default_user_avator.png', '0', '站点名称');
INSERT INTO `system_info` VALUES (12, 'site_domain', '/static/images/default_user_avator.png', '0', '站点域名');
INSERT INTO `system_info` VALUES (13, 'site_copyright', '/static/images/default_user_avator.png', '0', NULL);
INSERT INTO `system_info` VALUES (14, 'site_icp', '/static/images/default_user_avator.png', '0', '备案号');

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
  CONSTRAINT `fk_small` FOREIGN KEY (`small_id`) REFERENCES `small_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 494 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜谱的具体分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tiny_category
-- ----------------------------
INSERT INTO `tiny_category` VALUES (1, '家常菜', 0, 1, 10001, NULL);
INSERT INTO `tiny_category` VALUES (2, '快手菜', 0, 1, 10002, NULL);
INSERT INTO `tiny_category` VALUES (3, '下饭菜', 0, 1, 10003, NULL);
INSERT INTO `tiny_category` VALUES (4, '素菜', 0, 1, 10004, NULL);
INSERT INTO `tiny_category` VALUES (5, '大鱼大肉', 0, 1, 10005, NULL);
INSERT INTO `tiny_category` VALUES (6, '下酒菜', 0, 1, 10006, NULL);
INSERT INTO `tiny_category` VALUES (7, '小清新', 0, 1, 10007, NULL);
INSERT INTO `tiny_category` VALUES (8, '创意菜', 0, 1, 10008, NULL);
INSERT INTO `tiny_category` VALUES (9, '小吃', 0, 2, 10009, NULL);
INSERT INTO `tiny_category` VALUES (10, '酱', 0, 2, 10010, NULL);
INSERT INTO `tiny_category` VALUES (11, '沙拉', 0, 2, 10011, NULL);
INSERT INTO `tiny_category` VALUES (12, '凉菜', 0, 2, 10012, NULL);
INSERT INTO `tiny_category` VALUES (13, '零食', 0, 2, 10013, NULL);
INSERT INTO `tiny_category` VALUES (14, '三明治', 0, 2, 10014, NULL);
INSERT INTO `tiny_category` VALUES (15, '月饼', 0, 2, 10015, NULL);
INSERT INTO `tiny_category` VALUES (16, '蒸蛋', 0, 2, 10016, NULL);
INSERT INTO `tiny_category` VALUES (17, '寿司', 0, 2, 10017, NULL);
INSERT INTO `tiny_category` VALUES (18, '粽子', 0, 2, 10018, NULL);
INSERT INTO `tiny_category` VALUES (19, '鸡蛋羹', 0, 2, 10019, NULL);
INSERT INTO `tiny_category` VALUES (20, '早餐', 0, 3, 10020, NULL);
INSERT INTO `tiny_category` VALUES (21, '下午茶', 0, 3, 10021, NULL);
INSERT INTO `tiny_category` VALUES (22, '便当', 0, 3, 10022, NULL);
INSERT INTO `tiny_category` VALUES (23, '圣诞节', 0, 3, 10023, NULL);
INSERT INTO `tiny_category` VALUES (24, '年夜饭', 0, 3, 10024, NULL);
INSERT INTO `tiny_category` VALUES (25, '深夜食堂', 0, 3, 10025, NULL);
INSERT INTO `tiny_category` VALUES (26, '情人节', 0, 3, 10026, NULL);
INSERT INTO `tiny_category` VALUES (27, '宵夜', 0, 3, 10027, NULL);
INSERT INTO `tiny_category` VALUES (28, '减肥', 0, 4, 10028, NULL);
INSERT INTO `tiny_category` VALUES (29, '美容', 0, 4, 10029, NULL);
INSERT INTO `tiny_category` VALUES (30, '润肺抗燥', 0, 4, 10030, NULL);
INSERT INTO `tiny_category` VALUES (31, '补血', 0, 4, 10031, NULL);
INSERT INTO `tiny_category` VALUES (32, '清热祛火', 0, 4, 10032, NULL);
INSERT INTO `tiny_category` VALUES (33, '儿童', 0, 5, 10033, NULL);
INSERT INTO `tiny_category` VALUES (34, '婴幼儿', 0, 5, 10034, NULL);
INSERT INTO `tiny_category` VALUES (35, '老人', 0, 5, 10035, NULL);
INSERT INTO `tiny_category` VALUES (36, '孕产妇', 0, 5, 10036, NULL);
INSERT INTO `tiny_category` VALUES (37, '宝宝食谱', 0, 5, 10037, NULL);
INSERT INTO `tiny_category` VALUES (38, '味蕾工坊', 0, 6, 10038, NULL);
INSERT INTO `tiny_category` VALUES (39, '蛋糕', 0, 7, 10039, NULL);
INSERT INTO `tiny_category` VALUES (40, '面包', 0, 7, 10040, NULL);
INSERT INTO `tiny_category` VALUES (41, '饼干', 0, 7, 10041, NULL);
INSERT INTO `tiny_category` VALUES (42, '披萨', 0, 7, 10042, NULL);
INSERT INTO `tiny_category` VALUES (43, '派', 0, 7, 10043, NULL);
INSERT INTO `tiny_category` VALUES (44, '司康', 0, 7, 10044, NULL);
INSERT INTO `tiny_category` VALUES (45, '塔', 0, 7, 10045, NULL);
INSERT INTO `tiny_category` VALUES (46, '泡芙', 0, 7, 10046, NULL);
INSERT INTO `tiny_category` VALUES (47, '奶油霜', 0, 7, 10047, NULL);
INSERT INTO `tiny_category` VALUES (48, '布丁', 0, 8, 10048, NULL);
INSERT INTO `tiny_category` VALUES (49, '冷饮', 0, 8, 10049, NULL);
INSERT INTO `tiny_category` VALUES (50, '果酱', 0, 8, 10050, NULL);
INSERT INTO `tiny_category` VALUES (51, '糖水', 0, 8, 10051, NULL);
INSERT INTO `tiny_category` VALUES (52, '冰淇淋', 0, 8, 10052, NULL);
INSERT INTO `tiny_category` VALUES (53, '果冻', 0, 8, 10053, NULL);
INSERT INTO `tiny_category` VALUES (54, '咖啡', 0, 9, 10054, NULL);
INSERT INTO `tiny_category` VALUES (55, '豆浆', 0, 9, 10055, NULL);
INSERT INTO `tiny_category` VALUES (56, '奶茶', 0, 9, 10056, NULL);
INSERT INTO `tiny_category` VALUES (57, '酒', 0, 9, 10057, NULL);
INSERT INTO `tiny_category` VALUES (58, '果汁', 0, 9, 10058, NULL);
INSERT INTO `tiny_category` VALUES (59, '花草茶', 0, 9, 10059, NULL);
INSERT INTO `tiny_category` VALUES (60, '猪肉', 0, 10, 10060, NULL);
INSERT INTO `tiny_category` VALUES (61, '猪排', 0, 10, 10061, NULL);
INSERT INTO `tiny_category` VALUES (62, '猪肉末', 0, 10, 10062, NULL);
INSERT INTO `tiny_category` VALUES (63, '五花肉', 0, 10, 10063, NULL);
INSERT INTO `tiny_category` VALUES (64, '猪蹄', 0, 10, 10064, NULL);
INSERT INTO `tiny_category` VALUES (65, '瘦肉', 0, 10, 10065, NULL);
INSERT INTO `tiny_category` VALUES (66, '里脊', 0, 10, 10066, NULL);
INSERT INTO `tiny_category` VALUES (67, '猪肝', 0, 10, 10067, NULL);
INSERT INTO `tiny_category` VALUES (68, '猪肚', 0, 10, 10068, NULL);
INSERT INTO `tiny_category` VALUES (69, '猪皮', 0, 10, 10069, NULL);
INSERT INTO `tiny_category` VALUES (70, '猪骨', 0, 10, 10070, NULL);
INSERT INTO `tiny_category` VALUES (71, '肥肠', 0, 10, 10071, NULL);
INSERT INTO `tiny_category` VALUES (72, '猪油', 0, 10, 10072, NULL);
INSERT INTO `tiny_category` VALUES (73, '猪腰', 0, 10, 10073, NULL);
INSERT INTO `tiny_category` VALUES (74, '猪耳朵', 0, 10, 10074, NULL);
INSERT INTO `tiny_category` VALUES (75, '猪心', 0, 10, 10075, NULL);
INSERT INTO `tiny_category` VALUES (76, '猪血', 0, 10, 10076, NULL);
INSERT INTO `tiny_category` VALUES (77, '猪肺', 0, 10, 10077, NULL);
INSERT INTO `tiny_category` VALUES (78, '鸡翅', 0, 11, 10078, NULL);
INSERT INTO `tiny_category` VALUES (79, '鸡胸', 0, 11, 10079, NULL);
INSERT INTO `tiny_category` VALUES (80, '鸡腿', 0, 11, 10080, NULL);
INSERT INTO `tiny_category` VALUES (81, '鸡爪', 0, 11, 10081, NULL);
INSERT INTO `tiny_category` VALUES (82, '鸡肉', 0, 11, 10082, NULL);
INSERT INTO `tiny_category` VALUES (83, '乌鸡', 0, 11, 10083, NULL);
INSERT INTO `tiny_category` VALUES (84, '鸡胗', 0, 11, 10084, NULL);
INSERT INTO `tiny_category` VALUES (85, '土鸡', 0, 11, 10085, NULL);
INSERT INTO `tiny_category` VALUES (86, '仔鸡', 0, 11, 10086, NULL);
INSERT INTO `tiny_category` VALUES (87, '三黄鸡', 0, 11, 10087, NULL);
INSERT INTO `tiny_category` VALUES (88, '鸡肝', 0, 11, 10088, NULL);
INSERT INTO `tiny_category` VALUES (89, '老母鸡', 0, 11, 10089, NULL);
INSERT INTO `tiny_category` VALUES (90, '鸡心', 0, 11, 10090, NULL);
INSERT INTO `tiny_category` VALUES (91, '柴鸡', 0, 11, 10091, NULL);
INSERT INTO `tiny_category` VALUES (92, '童子鸡', 0, 11, 10092, NULL);
INSERT INTO `tiny_category` VALUES (93, '牛肉', 0, 12, 10093, NULL);
INSERT INTO `tiny_category` VALUES (94, '牛腩', 0, 12, 10094, NULL);
INSERT INTO `tiny_category` VALUES (95, '牛排', 0, 12, 10095, NULL);
INSERT INTO `tiny_category` VALUES (96, '肥牛', 0, 12, 10096, NULL);
INSERT INTO `tiny_category` VALUES (97, '牛里脊', 0, 12, 10097, NULL);
INSERT INTO `tiny_category` VALUES (98, '牛腱', 0, 12, 10098, NULL);
INSERT INTO `tiny_category` VALUES (99, '牛尾', 0, 12, 10099, NULL);
INSERT INTO `tiny_category` VALUES (100, '牛肉末', 0, 12, 10100, NULL);
INSERT INTO `tiny_category` VALUES (101, '牛筋', 0, 12, 10101, NULL);
INSERT INTO `tiny_category` VALUES (102, '牛百叶', 0, 12, 10102, NULL);
INSERT INTO `tiny_category` VALUES (103, '牛骨', 0, 12, 10103, NULL);
INSERT INTO `tiny_category` VALUES (104, '牛肉馅', 0, 12, 10104, NULL);
INSERT INTO `tiny_category` VALUES (105, '羊肉', 0, 13, 10105, NULL);
INSERT INTO `tiny_category` VALUES (106, '羊排', 0, 13, 10106, NULL);
INSERT INTO `tiny_category` VALUES (107, '羊腿', 0, 13, 10107, NULL);
INSERT INTO `tiny_category` VALUES (108, '羊肉片', 0, 13, 10108, NULL);
INSERT INTO `tiny_category` VALUES (109, '羊蝎子', 0, 13, 10109, NULL);
INSERT INTO `tiny_category` VALUES (110, '鸭腿', 0, 14, 10110, NULL);
INSERT INTO `tiny_category` VALUES (111, '鸭肉', 0, 14, 10111, NULL);
INSERT INTO `tiny_category` VALUES (112, '老鸭', 0, 14, 10112, NULL);
INSERT INTO `tiny_category` VALUES (113, '鸭胗', 0, 14, 10113, NULL);
INSERT INTO `tiny_category` VALUES (114, '鸭血', 0, 14, 10114, NULL);
INSERT INTO `tiny_category` VALUES (115, '鸭掌', 0, 14, 10115, NULL);
INSERT INTO `tiny_category` VALUES (116, '鸭翅', 0, 14, 10116, NULL);
INSERT INTO `tiny_category` VALUES (117, '鸭舌', 0, 14, 10117, NULL);
INSERT INTO `tiny_category` VALUES (118, '鸭肠', 0, 14, 10118, NULL);
INSERT INTO `tiny_category` VALUES (119, '鸭脖', 0, 14, 10119, NULL);
INSERT INTO `tiny_category` VALUES (120, '鸭肝', 0, 14, 10120, NULL);
INSERT INTO `tiny_category` VALUES (121, '鸭爪', 0, 14, 10121, NULL);
INSERT INTO `tiny_category` VALUES (122, '彩椒', 0, 25, 10122, NULL);
INSERT INTO `tiny_category` VALUES (123, '番茄', 0, 25, 10123, NULL);
INSERT INTO `tiny_category` VALUES (124, '南瓜', 0, 25, 10124, NULL);
INSERT INTO `tiny_category` VALUES (125, '玉米', 0, 25, 10125, NULL);
INSERT INTO `tiny_category` VALUES (126, '茄子', 0, 25, 10126, NULL);
INSERT INTO `tiny_category` VALUES (127, '黄瓜', 0, 25, 10127, NULL);
INSERT INTO `tiny_category` VALUES (128, '豇豆', 0, 25, 10128, NULL);
INSERT INTO `tiny_category` VALUES (129, '青椒', 0, 25, 10129, NULL);
INSERT INTO `tiny_category` VALUES (130, '苦瓜', 0, 25, 10130, NULL);
INSERT INTO `tiny_category` VALUES (131, '冬瓜', 0, 25, 10131, NULL);
INSERT INTO `tiny_category` VALUES (132, '丝瓜', 0, 25, 10132, NULL);
INSERT INTO `tiny_category` VALUES (133, '秋葵', 0, 25, 10133, NULL);
INSERT INTO `tiny_category` VALUES (134, '西葫芦', 0, 25, 10134, NULL);
INSERT INTO `tiny_category` VALUES (135, '毛豆', 0, 25, 10135, NULL);
INSERT INTO `tiny_category` VALUES (136, '豌豆', 0, 25, 10136, NULL);
INSERT INTO `tiny_category` VALUES (137, '四季豆', 0, 25, 10137, NULL);
INSERT INTO `tiny_category` VALUES (138, '荷兰豆', 0, 25, 10138, NULL);
INSERT INTO `tiny_category` VALUES (139, '蚕豆', 0, 25, 10139, NULL);
INSERT INTO `tiny_category` VALUES (140, '圣女果 ', 0, 25, 10140, NULL);
INSERT INTO `tiny_category` VALUES (141, '扁豆', 0, 25, 10141, NULL);
INSERT INTO `tiny_category` VALUES (142, '刀豆', 0, 25, 10142, NULL);
INSERT INTO `tiny_category` VALUES (143, '瓠瓜', 0, 25, 10143, NULL);
INSERT INTO `tiny_category` VALUES (144, '玉米笋', 0, 25, 10144, NULL);
INSERT INTO `tiny_category` VALUES (145, '西红柿', 0, 25, 10145, NULL);
INSERT INTO `tiny_category` VALUES (146, '时令水果', 0, 26, 10146, NULL);
INSERT INTO `tiny_category` VALUES (147, '柠檬', 0, 26, 10147, NULL);
INSERT INTO `tiny_category` VALUES (148, '椰子', 0, 26, 10148, NULL);
INSERT INTO `tiny_category` VALUES (149, '草莓', 0, 26, 10149, NULL);
INSERT INTO `tiny_category` VALUES (150, '橙', 0, 26, 10150, NULL);
INSERT INTO `tiny_category` VALUES (151, '牛油果', 0, 26, 10151, NULL);
INSERT INTO `tiny_category` VALUES (152, '木瓜', 0, 26, 10152, NULL);
INSERT INTO `tiny_category` VALUES (153, '山楂', 0, 26, 10153, NULL);
INSERT INTO `tiny_category` VALUES (154, '蓝莓', 0, 26, 10154, NULL);
INSERT INTO `tiny_category` VALUES (155, '西瓜', 0, 26, 10155, NULL);
INSERT INTO `tiny_category` VALUES (156, '柚子', 0, 26, 10156, NULL);
INSERT INTO `tiny_category` VALUES (157, '火龙果', 0, 26, 10157, NULL);
INSERT INTO `tiny_category` VALUES (158, '樱桃', 0, 26, 10158, NULL);
INSERT INTO `tiny_category` VALUES (159, '榴莲', 0, 26, 10159, NULL);
INSERT INTO `tiny_category` VALUES (160, '西柚', 0, 26, 10160, NULL);
INSERT INTO `tiny_category` VALUES (161, '桃', 0, 26, 10161, NULL);
INSERT INTO `tiny_category` VALUES (162, '葡萄', 0, 26, 10162, NULL);
INSERT INTO `tiny_category` VALUES (163, '金橘', 0, 26, 10163, NULL);
INSERT INTO `tiny_category` VALUES (164, '黄桃', 0, 26, 10164, NULL);
INSERT INTO `tiny_category` VALUES (165, '百香果', 0, 26, 10165, NULL);
INSERT INTO `tiny_category` VALUES (166, '杨梅', 0, 26, 10166, NULL);
INSERT INTO `tiny_category` VALUES (167, '桔子', 0, 26, 10167, NULL);
INSERT INTO `tiny_category` VALUES (168, '荔枝', 0, 26, 10168, NULL);
INSERT INTO `tiny_category` VALUES (169, '无花果', 0, 26, 10169, NULL);
INSERT INTO `tiny_category` VALUES (170, '石榴', 0, 26, 10170, NULL);
INSERT INTO `tiny_category` VALUES (171, '杏子', 0, 26, 10171, NULL);
INSERT INTO `tiny_category` VALUES (172, '桑葚', 0, 26, 10172, NULL);
INSERT INTO `tiny_category` VALUES (173, '哈密瓜', 0, 26, 10173, NULL);
INSERT INTO `tiny_category` VALUES (174, '柿子', 0, 26, 10174, NULL);
INSERT INTO `tiny_category` VALUES (175, '李子', 0, 26, 10175, NULL);
INSERT INTO `tiny_category` VALUES (176, '青梅', 0, 26, 10176, NULL);
INSERT INTO `tiny_category` VALUES (177, '枇杷', 0, 26, 10177, NULL);
INSERT INTO `tiny_category` VALUES (178, '香瓜', 0, 26, 10178, NULL);
INSERT INTO `tiny_category` VALUES (179, '甘蔗', 0, 26, 10179, NULL);
INSERT INTO `tiny_category` VALUES (180, '覆盆子', 0, 26, 10180, NULL);
INSERT INTO `tiny_category` VALUES (181, '杨桃', 0, 26, 10181, NULL);
INSERT INTO `tiny_category` VALUES (182, '橘子', 0, 26, 10182, NULL);
INSERT INTO `tiny_category` VALUES (183, '金桔', 0, 26, 10183, NULL);
INSERT INTO `tiny_category` VALUES (184, '杏', 0, 26, 10184, NULL);
INSERT INTO `tiny_category` VALUES (185, '土豆', 0, 27, 10185, NULL);
INSERT INTO `tiny_category` VALUES (186, '萝卜', 0, 27, 10186, NULL);
INSERT INTO `tiny_category` VALUES (187, '紫薯', 0, 27, 10187, NULL);
INSERT INTO `tiny_category` VALUES (188, '红薯', 0, 27, 10188, NULL);
INSERT INTO `tiny_category` VALUES (189, '胡萝卜', 0, 27, 10189, NULL);
INSERT INTO `tiny_category` VALUES (190, '山药', 0, 27, 10190, NULL);
INSERT INTO `tiny_category` VALUES (191, '藕', 0, 27, 10191, NULL);
INSERT INTO `tiny_category` VALUES (192, '芋头', 0, 27, 10192, NULL);
INSERT INTO `tiny_category` VALUES (193, '笋', 0, 27, 10193, NULL);
INSERT INTO `tiny_category` VALUES (194, '茭白', 0, 27, 10194, NULL);
INSERT INTO `tiny_category` VALUES (195, '马蹄', 0, 27, 10195, NULL);
INSERT INTO `tiny_category` VALUES (196, '牛蒡', 0, 27, 10196, NULL);
INSERT INTO `tiny_category` VALUES (197, '菱角', 0, 27, 10197, NULL);
INSERT INTO `tiny_category` VALUES (198, '芹菜', 0, 28, 10198, NULL);
INSERT INTO `tiny_category` VALUES (199, '白菜', 0, 28, 10199, NULL);
INSERT INTO `tiny_category` VALUES (200, '韭菜', 0, 28, 10200, NULL);
INSERT INTO `tiny_category` VALUES (201, '菠菜', 0, 28, 10201, NULL);
INSERT INTO `tiny_category` VALUES (202, '西兰花 ', 0, 28, 10202, NULL);
INSERT INTO `tiny_category` VALUES (203, '圆白菜', 0, 28, 10203, NULL);
INSERT INTO `tiny_category` VALUES (204, '花椰菜', 0, 28, 10204, NULL);
INSERT INTO `tiny_category` VALUES (205, '莴苣', 0, 28, 10205, NULL);
INSERT INTO `tiny_category` VALUES (206, '青菜 ', 0, 28, 10206, NULL);
INSERT INTO `tiny_category` VALUES (207, '娃娃菜', 0, 28, 10207, NULL);
INSERT INTO `tiny_category` VALUES (208, '生菜', 0, 28, 10208, NULL);
INSERT INTO `tiny_category` VALUES (209, '甘蓝', 0, 28, 10209, NULL);
INSERT INTO `tiny_category` VALUES (210, '蒜薹', 0, 28, 10210, NULL);
INSERT INTO `tiny_category` VALUES (211, '紫甘蓝', 0, 28, 10211, NULL);
INSERT INTO `tiny_category` VALUES (212, '空心菜', 0, 28, 10212, NULL);
INSERT INTO `tiny_category` VALUES (213, '油菜', 0, 28, 10213, NULL);
INSERT INTO `tiny_category` VALUES (214, '荠菜', 0, 28, 10214, NULL);
INSERT INTO `tiny_category` VALUES (215, '香椿', 0, 28, 10215, NULL);
INSERT INTO `tiny_category` VALUES (216, '茼蒿', 0, 28, 10216, NULL);
INSERT INTO `tiny_category` VALUES (217, '菜心', 0, 28, 10217, NULL);
INSERT INTO `tiny_category` VALUES (218, '芥兰', 0, 28, 10218, NULL);
INSERT INTO `tiny_category` VALUES (219, '黄花菜', 0, 28, 10219, NULL);
INSERT INTO `tiny_category` VALUES (220, '韭黄', 0, 28, 10220, NULL);
INSERT INTO `tiny_category` VALUES (221, '苋菜', 0, 28, 10221, NULL);
INSERT INTO `tiny_category` VALUES (222, '紫苏', 0, 28, 10222, NULL);
INSERT INTO `tiny_category` VALUES (223, '芥菜', 0, 28, 10223, NULL);
INSERT INTO `tiny_category` VALUES (224, '油麦菜', 0, 28, 10224, NULL);
INSERT INTO `tiny_category` VALUES (225, '豌豆苗', 0, 28, 10225, NULL);
INSERT INTO `tiny_category` VALUES (226, '苦菊', 0, 28, 10226, NULL);
INSERT INTO `tiny_category` VALUES (227, '青蒜', 0, 28, 10227, NULL);
INSERT INTO `tiny_category` VALUES (228, '鱼腥草', 0, 28, 10228, NULL);
INSERT INTO `tiny_category` VALUES (229, '马兰', 0, 28, 10229, NULL);
INSERT INTO `tiny_category` VALUES (230, '蕨菜', 0, 28, 10230, NULL);
INSERT INTO `tiny_category` VALUES (231, '西洋菜', 0, 28, 10231, NULL);
INSERT INTO `tiny_category` VALUES (232, '水芹', 0, 28, 10232, NULL);
INSERT INTO `tiny_category` VALUES (233, '儿菜', 0, 28, 10233, NULL);
INSERT INTO `tiny_category` VALUES (234, '豌豆尖', 0, 28, 10234, NULL);
INSERT INTO `tiny_category` VALUES (235, '芝麻菜', 0, 28, 10235, NULL);
INSERT INTO `tiny_category` VALUES (236, '芦蒿', 0, 28, 10236, NULL);
INSERT INTO `tiny_category` VALUES (237, '穿心莲', 0, 28, 10237, NULL);
INSERT INTO `tiny_category` VALUES (238, '孢子甘蓝', 0, 28, 10238, NULL);
INSERT INTO `tiny_category` VALUES (239, '萝卜苗', 0, 28, 10239, NULL);
INSERT INTO `tiny_category` VALUES (240, '红菜苔', 0, 28, 10240, NULL);
INSERT INTO `tiny_category` VALUES (241, '牛至', 0, 28, 10241, NULL);
INSERT INTO `tiny_category` VALUES (242, '蒿子杆', 0, 28, 10242, NULL);
INSERT INTO `tiny_category` VALUES (243, '包菜', 0, 28, 10243, NULL);
INSERT INTO `tiny_category` VALUES (244, '莴笋 ', 0, 28, 10244, NULL);
INSERT INTO `tiny_category` VALUES (245, '花菜', 0, 28, 10245, NULL);
INSERT INTO `tiny_category` VALUES (246, '蒜苔', 0, 28, 10246, NULL);
INSERT INTO `tiny_category` VALUES (247, '豆苗', 0, 28, 10247, NULL);
INSERT INTO `tiny_category` VALUES (248, '披萨草', 0, 28, 10248, NULL);
INSERT INTO `tiny_category` VALUES (249, '香菇', 0, 29, 10249, NULL);
INSERT INTO `tiny_category` VALUES (250, '杏鲍菇', 0, 29, 10250, NULL);
INSERT INTO `tiny_category` VALUES (251, '银耳', 0, 29, 10251, NULL);
INSERT INTO `tiny_category` VALUES (252, '木耳', 0, 29, 10252, NULL);
INSERT INTO `tiny_category` VALUES (253, '金针菇', 0, 29, 10253, NULL);
INSERT INTO `tiny_category` VALUES (254, '蘑菇', 0, 29, 10254, NULL);
INSERT INTO `tiny_category` VALUES (255, '茶树菇', 0, 29, 10255, NULL);
INSERT INTO `tiny_category` VALUES (256, '平菇', 0, 29, 10256, NULL);
INSERT INTO `tiny_category` VALUES (257, '松茸', 0, 29, 10257, NULL);
INSERT INTO `tiny_category` VALUES (258, '鸡腿菇', 0, 29, 10258, NULL);
INSERT INTO `tiny_category` VALUES (259, '草菇', 0, 29, 10259, NULL);
INSERT INTO `tiny_category` VALUES (260, '竹荪', 0, 29, 10260, NULL);
INSERT INTO `tiny_category` VALUES (261, '蟹味菇', 0, 29, 10261, NULL);
INSERT INTO `tiny_category` VALUES (262, '花菇', 0, 29, 10262, NULL);
INSERT INTO `tiny_category` VALUES (263, '猴头菇', 0, 29, 10263, NULL);
INSERT INTO `tiny_category` VALUES (264, '牛肝菌', 0, 29, 10264, NULL);
INSERT INTO `tiny_category` VALUES (265, '灵芝', 0, 29, 10265, NULL);
INSERT INTO `tiny_category` VALUES (266, '榛蘑', 0, 29, 10266, NULL);
INSERT INTO `tiny_category` VALUES (267, '白玉菇', 0, 29, 10267, NULL);
INSERT INTO `tiny_category` VALUES (268, '姬松茸', 0, 29, 10268, NULL);
INSERT INTO `tiny_category` VALUES (269, '滑子菇', 0, 29, 10269, NULL);
INSERT INTO `tiny_category` VALUES (270, '发菜', 0, 29, 10270, NULL);
INSERT INTO `tiny_category` VALUES (271, '白灵菇', 0, 29, 10271, NULL);
INSERT INTO `tiny_category` VALUES (272, '袖珍菇', 0, 29, 10272, NULL);
INSERT INTO `tiny_category` VALUES (273, '双孢菇', 0, 29, 10273, NULL);
INSERT INTO `tiny_category` VALUES (274, '秀珍菇', 0, 29, 10274, NULL);
INSERT INTO `tiny_category` VALUES (275, '茶叶', 0, 30, 10275, NULL);
INSERT INTO `tiny_category` VALUES (276, '桂花', 0, 30, 10276, NULL);
INSERT INTO `tiny_category` VALUES (277, '玫瑰', 0, 30, 10277, NULL);
INSERT INTO `tiny_category` VALUES (278, '薄荷', 0, 30, 10278, NULL);
INSERT INTO `tiny_category` VALUES (279, '菊花', 0, 30, 10279, NULL);
INSERT INTO `tiny_category` VALUES (280, '洛神花', 0, 30, 10280, NULL);
INSERT INTO `tiny_category` VALUES (281, '茉莉花', 0, 30, 10281, NULL);
INSERT INTO `tiny_category` VALUES (282, '槐花', 0, 30, 10282, NULL);
INSERT INTO `tiny_category` VALUES (283, '金银花', 0, 30, 10283, NULL);
INSERT INTO `tiny_category` VALUES (284, '炒饭', 0, 32, 10284, NULL);
INSERT INTO `tiny_category` VALUES (285, '焖', 0, 32, 10285, NULL);
INSERT INTO `tiny_category` VALUES (286, '饭团', 0, 32, 10286, NULL);
INSERT INTO `tiny_category` VALUES (287, '盖浇饭', 0, 32, 10287, NULL);
INSERT INTO `tiny_category` VALUES (288, '煲仔饭', 0, 32, 10288, NULL);
INSERT INTO `tiny_category` VALUES (289, '焗饭', 0, 32, 10289, NULL);
INSERT INTO `tiny_category` VALUES (290, '烩饭', 0, 32, 10290, NULL);
INSERT INTO `tiny_category` VALUES (291, '拌面', 0, 41, 10291, NULL);
INSERT INTO `tiny_category` VALUES (292, '炒面', 0, 41, 10292, NULL);
INSERT INTO `tiny_category` VALUES (293, '汤面', 0, 41, 10293, NULL);
INSERT INTO `tiny_category` VALUES (294, '凉面', 0, 41, 10294, NULL);
INSERT INTO `tiny_category` VALUES (295, '焖面', 0, 41, 10295, NULL);
INSERT INTO `tiny_category` VALUES (296, '煎', 0, 42, 10296, NULL);
INSERT INTO `tiny_category` VALUES (297, '蒸', 0, 42, 10297, NULL);
INSERT INTO `tiny_category` VALUES (298, '炖', 0, 42, 10298, NULL);
INSERT INTO `tiny_category` VALUES (299, '红烧', 0, 42, 10299, NULL);
INSERT INTO `tiny_category` VALUES (300, '辣', 0, 43, 10300, NULL);
INSERT INTO `tiny_category` VALUES (301, '咖喱', 0, 43, 10301, NULL);
INSERT INTO `tiny_category` VALUES (302, '糖醋', 0, 43, 10302, NULL);
INSERT INTO `tiny_category` VALUES (303, '蒜香', 0, 43, 10303, NULL);
INSERT INTO `tiny_category` VALUES (304, '烤箱', 0, 44, 10304, NULL);
INSERT INTO `tiny_category` VALUES (305, '烤箱菜', 0, 44, 10305, NULL);
INSERT INTO `tiny_category` VALUES (306, '电饭煲', 0, 44, 10306, NULL);
INSERT INTO `tiny_category` VALUES (307, '日式', 0, 45, 10307, NULL);
INSERT INTO `tiny_category` VALUES (308, '韩式', 0, 45, 10308, NULL);
INSERT INTO `tiny_category` VALUES (309, '西式', 0, 45, 10309, NULL);
INSERT INTO `tiny_category` VALUES (310, '海水鱼', 0, 46, 10310, NULL);
INSERT INTO `tiny_category` VALUES (311, '淡水鱼', 0, 46, 10311, NULL);
INSERT INTO `tiny_category` VALUES (312, '鱼头', 0, 46, 10312, NULL);
INSERT INTO `tiny_category` VALUES (313, '鱼干', 0, 46, 10313, NULL);
INSERT INTO `tiny_category` VALUES (314, '鱼籽', 0, 46, 10314, NULL);
INSERT INTO `tiny_category` VALUES (315, '鱼肚', 0, 46, 10315, NULL);
INSERT INTO `tiny_category` VALUES (316, '虾仁', 0, 47, 10316, NULL);
INSERT INTO `tiny_category` VALUES (317, '海米', 0, 47, 10317, NULL);
INSERT INTO `tiny_category` VALUES (318, '虾皮', 0, 47, 10318, NULL);
INSERT INTO `tiny_category` VALUES (319, '明虾', 0, 47, 10319, NULL);
INSERT INTO `tiny_category` VALUES (320, '基围虾', 0, 47, 10320, NULL);
INSERT INTO `tiny_category` VALUES (321, '龙虾', 0, 47, 10321, NULL);
INSERT INTO `tiny_category` VALUES (322, '小龙虾', 0, 47, 10322, NULL);
INSERT INTO `tiny_category` VALUES (323, '河虾', 0, 47, 10323, NULL);
INSERT INTO `tiny_category` VALUES (324, '海虾', 0, 47, 10324, NULL);
INSERT INTO `tiny_category` VALUES (325, '皮皮虾', 0, 47, 10325, NULL);
INSERT INTO `tiny_category` VALUES (326, '北极虾', 0, 47, 10326, NULL);
INSERT INTO `tiny_category` VALUES (327, '虾干', 0, 47, 10327, NULL);
INSERT INTO `tiny_category` VALUES (328, '青虾', 0, 47, 10328, NULL);
INSERT INTO `tiny_category` VALUES (329, '草虾', 0, 47, 10329, NULL);
INSERT INTO `tiny_category` VALUES (330, '海白虾', 0, 47, 10330, NULL);
INSERT INTO `tiny_category` VALUES (331, '虾米', 0, 47, 10331, NULL);
INSERT INTO `tiny_category` VALUES (332, '蛤蜊', 0, 48, 10332, NULL);
INSERT INTO `tiny_category` VALUES (333, '干贝', 0, 48, 10333, NULL);
INSERT INTO `tiny_category` VALUES (334, '鲍鱼', 0, 48, 10334, NULL);
INSERT INTO `tiny_category` VALUES (335, '扇贝', 0, 48, 10335, NULL);
INSERT INTO `tiny_category` VALUES (336, '牡蛎', 0, 48, 10336, NULL);
INSERT INTO `tiny_category` VALUES (337, '青口', 0, 48, 10337, NULL);
INSERT INTO `tiny_category` VALUES (338, '蛏子', 0, 48, 10338, NULL);
INSERT INTO `tiny_category` VALUES (339, '鲜贝', 0, 48, 10339, NULL);
INSERT INTO `tiny_category` VALUES (340, '北极贝', 0, 48, 10340, NULL);
INSERT INTO `tiny_category` VALUES (341, '梭子蟹', 0, 49, 10341, NULL);
INSERT INTO `tiny_category` VALUES (342, '大闸蟹', 0, 49, 10342, NULL);
INSERT INTO `tiny_category` VALUES (343, '蟹肉', 0, 49, 10343, NULL);
INSERT INTO `tiny_category` VALUES (344, '蟹黄', 0, 49, 10344, NULL);
INSERT INTO `tiny_category` VALUES (345, '鸡蛋', 0, 50, 10345, NULL);
INSERT INTO `tiny_category` VALUES (346, '咸蛋', 0, 50, 10346, NULL);
INSERT INTO `tiny_category` VALUES (347, '皮蛋', 0, 50, 10347, NULL);
INSERT INTO `tiny_category` VALUES (348, '鹌鹑蛋', 0, 50, 10348, NULL);
INSERT INTO `tiny_category` VALUES (349, '鸭蛋', 0, 50, 10349, NULL);
INSERT INTO `tiny_category` VALUES (350, '咸鸭蛋', 0, 50, 10350, NULL);
INSERT INTO `tiny_category` VALUES (351, '牛奶', 0, 51, 10351, NULL);
INSERT INTO `tiny_category` VALUES (352, '黄油', 0, 51, 10352, NULL);
INSERT INTO `tiny_category` VALUES (353, '巧克力', 0, 51, 10353, NULL);
INSERT INTO `tiny_category` VALUES (354, '奶油', 0, 51, 10354, NULL);
INSERT INTO `tiny_category` VALUES (355, '奶酪', 0, 51, 10355, NULL);
INSERT INTO `tiny_category` VALUES (356, '酸奶', 0, 51, 10356, NULL);
INSERT INTO `tiny_category` VALUES (357, '黑巧克力', 0, 51, 10357, NULL);
INSERT INTO `tiny_category` VALUES (358, '淡奶油', 0, 51, 10358, NULL);
INSERT INTO `tiny_category` VALUES (359, '奶油奶酪', 0, 51, 10359, NULL);
INSERT INTO `tiny_category` VALUES (360, '炼乳', 0, 51, 10360, NULL);
INSERT INTO `tiny_category` VALUES (361, '奶粉', 0, 51, 10361, NULL);
INSERT INTO `tiny_category` VALUES (362, '马苏里拉奶酪', 0, 51, 10362, NULL);
INSERT INTO `tiny_category` VALUES (363, '白巧克力', 0, 51, 10363, NULL);
INSERT INTO `tiny_category` VALUES (364, '酸奶油', 0, 51, 10364, NULL);
INSERT INTO `tiny_category` VALUES (365, '酥油', 0, 51, 10365, NULL);
INSERT INTO `tiny_category` VALUES (366, '芝士', 0, 51, 10366, NULL);
INSERT INTO `tiny_category` VALUES (367, '豆腐', 0, 52, 10367, NULL);
INSERT INTO `tiny_category` VALUES (368, '香干', 0, 52, 10368, NULL);
INSERT INTO `tiny_category` VALUES (369, '豆渣', 0, 52, 10369, NULL);
INSERT INTO `tiny_category` VALUES (370, '千张', 0, 52, 10370, NULL);
INSERT INTO `tiny_category` VALUES (371, '腐竹', 0, 52, 10371, NULL);
INSERT INTO `tiny_category` VALUES (372, '素鸡', 0, 52, 10372, NULL);
INSERT INTO `tiny_category` VALUES (373, '油豆皮', 0, 52, 10373, NULL);
INSERT INTO `tiny_category` VALUES (374, '豆干', 0, 52, 10374, NULL);
INSERT INTO `tiny_category` VALUES (375, '豆腐皮', 0, 52, 10375, NULL);
INSERT INTO `tiny_category` VALUES (376, '面粉', 0, 53, 10376, NULL);
INSERT INTO `tiny_category` VALUES (377, '面条', 0, 53, 10377, NULL);
INSERT INTO `tiny_category` VALUES (378, '大米', 0, 53, 10378, NULL);
INSERT INTO `tiny_category` VALUES (379, '高筋面粉', 0, 53, 10379, NULL);
INSERT INTO `tiny_category` VALUES (380, '意大利面', 0, 53, 10380, NULL);
INSERT INTO `tiny_category` VALUES (381, '糯米', 0, 53, 10381, NULL);
INSERT INTO `tiny_category` VALUES (382, '低筋面粉', 0, 53, 10382, NULL);
INSERT INTO `tiny_category` VALUES (383, '年糕', 0, 53, 10383, NULL);
INSERT INTO `tiny_category` VALUES (384, '西米', 0, 53, 10384, NULL);
INSERT INTO `tiny_category` VALUES (385, '糯米粉', 0, 53, 10385, NULL);
INSERT INTO `tiny_category` VALUES (386, '粉丝', 0, 53, 10386, NULL);
INSERT INTO `tiny_category` VALUES (387, '燕麦', 0, 53, 10387, NULL);
INSERT INTO `tiny_category` VALUES (388, '米粉', 0, 53, 10388, NULL);
INSERT INTO `tiny_category` VALUES (389, '酒酿', 0, 53, 10389, NULL);
INSERT INTO `tiny_category` VALUES (390, '燕麦片', 0, 53, 10390, NULL);
INSERT INTO `tiny_category` VALUES (391, '乌冬面', 0, 53, 10391, NULL);
INSERT INTO `tiny_category` VALUES (392, '小米', 0, 53, 10392, NULL);
INSERT INTO `tiny_category` VALUES (393, '玉米面', 0, 53, 10393, NULL);
INSERT INTO `tiny_category` VALUES (394, '全麦粉', 0, 53, 10394, NULL);
INSERT INTO `tiny_category` VALUES (395, '黑米', 0, 53, 10395, NULL);
INSERT INTO `tiny_category` VALUES (396, '魔芋', 0, 53, 10396, NULL);
INSERT INTO `tiny_category` VALUES (397, '方便面', 0, 53, 10397, NULL);
INSERT INTO `tiny_category` VALUES (398, '粉条', 0, 53, 10398, NULL);
INSERT INTO `tiny_category` VALUES (399, '米线', 0, 53, 10399, NULL);
INSERT INTO `tiny_category` VALUES (400, '荞麦面', 0, 53, 10400, NULL);
INSERT INTO `tiny_category` VALUES (401, '油条', 0, 53, 10401, NULL);
INSERT INTO `tiny_category` VALUES (402, '黄豆面', 0, 53, 10402, NULL);
INSERT INTO `tiny_category` VALUES (403, '消化饼干', 0, 53, 10403, NULL);
INSERT INTO `tiny_category` VALUES (404, '面筋', 0, 53, 10404, NULL);
INSERT INTO `tiny_category` VALUES (405, '粘米粉', 0, 53, 10405, NULL);
INSERT INTO `tiny_category` VALUES (406, '凉粉', 0, 53, 10406, NULL);
INSERT INTO `tiny_category` VALUES (407, '糙米', 0, 53, 10407, NULL);
INSERT INTO `tiny_category` VALUES (408, '河粉', 0, 53, 10408, NULL);
INSERT INTO `tiny_category` VALUES (409, '紫米', 0, 53, 10409, NULL);
INSERT INTO `tiny_category` VALUES (410, '烤麸', 0, 53, 10410, NULL);
INSERT INTO `tiny_category` VALUES (411, '小麦胚芽', 0, 53, 10411, NULL);
INSERT INTO `tiny_category` VALUES (412, '澄面', 0, 53, 10412, NULL);
INSERT INTO `tiny_category` VALUES (413, '粉皮', 0, 53, 10413, NULL);
INSERT INTO `tiny_category` VALUES (414, '蕨根粉', 0, 53, 10414, NULL);
INSERT INTO `tiny_category` VALUES (415, '藕粉', 0, 53, 10415, NULL);
INSERT INTO `tiny_category` VALUES (416, '红曲米', 0, 53, 10416, NULL);
INSERT INTO `tiny_category` VALUES (417, '莜面', 0, 53, 10417, NULL);
INSERT INTO `tiny_category` VALUES (418, '黄米', 0, 53, 10418, NULL);
INSERT INTO `tiny_category` VALUES (419, '荞麦', 0, 53, 10419, NULL);
INSERT INTO `tiny_category` VALUES (420, '大麦', 0, 53, 10420, NULL);
INSERT INTO `tiny_category` VALUES (421, '高粱米', 0, 53, 10421, NULL);
INSERT INTO `tiny_category` VALUES (422, '红米', 0, 53, 10422, NULL);
INSERT INTO `tiny_category` VALUES (423, '澄粉', 0, 53, 10423, NULL);
INSERT INTO `tiny_category` VALUES (424, '黄豆粉', 0, 53, 10424, NULL);
INSERT INTO `tiny_category` VALUES (425, '芝麻', 0, 54, 10425, NULL);
INSERT INTO `tiny_category` VALUES (426, '花生', 0, 54, 10426, NULL);
INSERT INTO `tiny_category` VALUES (427, '杏仁', 0, 54, 10427, NULL);
INSERT INTO `tiny_category` VALUES (428, '红豆', 0, 54, 10428, NULL);
INSERT INTO `tiny_category` VALUES (429, '枣', 0, 54, 10429, NULL);
INSERT INTO `tiny_category` VALUES (430, '核桃', 0, 54, 10430, NULL);
INSERT INTO `tiny_category` VALUES (431, '板栗', 0, 54, 10431, NULL);
INSERT INTO `tiny_category` VALUES (432, '蔓越莓', 0, 54, 10432, NULL);
INSERT INTO `tiny_category` VALUES (433, '绿豆', 0, 54, 10433, NULL);
INSERT INTO `tiny_category` VALUES (434, '黄豆', 0, 54, 10434, NULL);
INSERT INTO `tiny_category` VALUES (435, '薏米', 0, 54, 10435, NULL);
INSERT INTO `tiny_category` VALUES (436, '葡萄干', 0, 54, 10436, NULL);
INSERT INTO `tiny_category` VALUES (437, '莲子', 0, 54, 10437, NULL);
INSERT INTO `tiny_category` VALUES (438, '橄榄', 0, 54, 10438, NULL);
INSERT INTO `tiny_category` VALUES (439, '黑豆', 0, 54, 10439, NULL);
INSERT INTO `tiny_category` VALUES (440, '蜜豆', 0, 54, 10440, NULL);
INSERT INTO `tiny_category` VALUES (441, '芸豆', 0, 54, 10441, NULL);
INSERT INTO `tiny_category` VALUES (442, '腰果', 0, 54, 10442, NULL);
INSERT INTO `tiny_category` VALUES (443, '桃胶', 0, 54, 10443, NULL);
INSERT INTO `tiny_category` VALUES (444, '乌梅', 0, 54, 10444, NULL);
INSERT INTO `tiny_category` VALUES (445, '松仁', 0, 54, 10445, NULL);
INSERT INTO `tiny_category` VALUES (446, '无花果', 0, 54, 10446, NULL);
INSERT INTO `tiny_category` VALUES (447, '银杏果', 0, 54, 10447, NULL);
INSERT INTO `tiny_category` VALUES (448, '话梅', 0, 54, 10448, NULL);
INSERT INTO `tiny_category` VALUES (449, '榛子', 0, 54, 10449, NULL);
INSERT INTO `tiny_category` VALUES (450, '鹰嘴豆', 0, 54, 10450, NULL);
INSERT INTO `tiny_category` VALUES (451, '罗汉果', 0, 54, 10451, NULL);
INSERT INTO `tiny_category` VALUES (452, '芡实', 0, 54, 10452, NULL);
INSERT INTO `tiny_category` VALUES (453, '开心果', 0, 54, 10453, NULL);
INSERT INTO `tiny_category` VALUES (454, '山楂干', 0, 54, 10454, NULL);
INSERT INTO `tiny_category` VALUES (455, '南瓜子', 0, 54, 10455, NULL);
INSERT INTO `tiny_category` VALUES (456, '瓜子仁', 0, 54, 10456, NULL);
INSERT INTO `tiny_category` VALUES (457, '眉豆', 0, 54, 10457, NULL);
INSERT INTO `tiny_category` VALUES (458, '红腰豆', 0, 54, 10458, NULL);
INSERT INTO `tiny_category` VALUES (459, '松子', 0, 54, 10459, NULL);
INSERT INTO `tiny_category` VALUES (460, '白果', 0, 54, 10460, NULL);
INSERT INTO `tiny_category` VALUES (461, '火腿', 0, 55, 10461, NULL);
INSERT INTO `tiny_category` VALUES (462, '香肠', 0, 55, 10462, NULL);
INSERT INTO `tiny_category` VALUES (463, '培根', 0, 55, 10463, NULL);
INSERT INTO `tiny_category` VALUES (464, '腊肉', 0, 55, 10464, NULL);
INSERT INTO `tiny_category` VALUES (465, '酸菜', 0, 55, 10465, NULL);
INSERT INTO `tiny_category` VALUES (466, '泡菜', 0, 55, 10466, NULL);
INSERT INTO `tiny_category` VALUES (467, '肉松', 0, 55, 10467, NULL);
INSERT INTO `tiny_category` VALUES (468, '梅干菜', 0, 55, 10468, NULL);
INSERT INTO `tiny_category` VALUES (469, '雪里蕻', 0, 55, 10469, NULL);
INSERT INTO `tiny_category` VALUES (470, '榨菜', 0, 55, 10470, NULL);
INSERT INTO `tiny_category` VALUES (471, '辣白菜', 0, 55, 10471, NULL);
INSERT INTO `tiny_category` VALUES (472, '笋干', 0, 55, 10472, NULL);
INSERT INTO `tiny_category` VALUES (473, '鱼丸', 0, 55, 10473, NULL);
INSERT INTO `tiny_category` VALUES (474, '橄榄菜', 0, 55, 10474, NULL);
INSERT INTO `tiny_category` VALUES (475, '咸菜', 0, 55, 10475, NULL);
INSERT INTO `tiny_category` VALUES (476, '萝卜干', 0, 55, 10476, NULL);
INSERT INTO `tiny_category` VALUES (477, '咸肉', 0, 55, 10477, NULL);
INSERT INTO `tiny_category` VALUES (478, '酸豇豆', 0, 55, 10478, NULL);
INSERT INTO `tiny_category` VALUES (479, '肉丸', 0, 55, 10479, NULL);
INSERT INTO `tiny_category` VALUES (480, '午餐肉', 0, 55, 10480, NULL);
INSERT INTO `tiny_category` VALUES (481, '蟹棒', 0, 55, 10481, NULL);
INSERT INTO `tiny_category` VALUES (482, '叉烧肉', 0, 55, 10482, NULL);
INSERT INTO `tiny_category` VALUES (483, '芽菜', 0, 55, 10483, NULL);
INSERT INTO `tiny_category` VALUES (484, '纳豆', 0, 55, 10484, NULL);
INSERT INTO `tiny_category` VALUES (485, '大头菜', 0, 55, 10485, NULL);
INSERT INTO `tiny_category` VALUES (486, '酸笋', 0, 55, 10486, NULL);
INSERT INTO `tiny_category` VALUES (487, '木鱼花', 0, 55, 10487, NULL);
INSERT INTO `tiny_category` VALUES (488, '冬菜', 0, 55, 10488, NULL);
INSERT INTO `tiny_category` VALUES (489, '玉兰片', 0, 55, 10489, NULL);
INSERT INTO `tiny_category` VALUES (490, '泡萝卜', 0, 55, 10490, NULL);
INSERT INTO `tiny_category` VALUES (491, '咸黄瓜', 0, 55, 10491, NULL);
INSERT INTO `tiny_category` VALUES (492, '叉烧', 0, 55, 10492, NULL);
INSERT INTO `tiny_category` VALUES (493, '酸豆角', 0, 55, 10493, NULL);

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
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '性别（0：未知，1：男，2：女，）',
  `favors` int(11) NOT NULL DEFAULT 0 COMMENT '关注数',
  `follows` int(11) NOT NULL DEFAULT 0 COMMENT '被关注数',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `production` int(11) NULL DEFAULT NULL COMMENT '作品数量',
  `menus` int(11) NULL DEFAULT NULL COMMENT '发布的菜谱数量',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '用户拥有的角色的id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '$2a$10$p8momL8581LuXYWaBPH9peeWXsHdyPNqvBiEIog7.iBzkRxXxh7nK', 'ss', '2019-04-13 02:18:39', NULL, '2019-04-11 16:13:05', NULL, 0, NULL, 0, 0, 0, NULL, NULL, NULL, 3);

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
