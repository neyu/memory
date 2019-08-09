SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

create database if not exists `memory` character set utf8mb4 collate utf8mb4_unicode_ci;
use `memory`;

-- ----------------------------
-- Table structure for customer_chat_logs
-- ----------------------------
DROP TABLE IF EXISTS `customer_chat_logs`;
CREATE TABLE `customer_chat_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gamerole_id` int(11) NOT NULL DEFAULT 0 COMMENT 'gameroleid',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '客服用户id',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `game_id` int(11) NOT NULL DEFAULT 0,
  `area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `vip_level` int(11) NOT NULL DEFAULT 0,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_game_area_group_role`(`game_id`, `area`, `group`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer_game_roles
-- ----------------------------
DROP TABLE IF EXISTS `customer_game_roles`;
CREATE TABLE `customer_game_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL DEFAULT 0,
  `area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` bigint(18) NOT NULL DEFAULT 0,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `vip_level` int(11) NOT NULL DEFAULT 0 COMMENT 'vip等级',
  `status` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `solve_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理意见',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uql_game_area_group_role`(`game_id`, `area`, `group`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_account
-- ----------------------------
DROP TABLE IF EXISTS `uw_account`;
CREATE TABLE `uw_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号名',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `deviceId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机器码，设备唯一号',
  `status` int(2) NULL DEFAULT 0 COMMENT '账号状态  0正常 ，1普通封号，2设备封号',
  `channelId` int(11) NULL DEFAULT 0 COMMENT '渠道id',
  `sdkData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sdk数据',
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展数据',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `createIP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建ip',
  `lastUpdateTime` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `loginCount` int(11) NULL DEFAULT 0,
  `loginKey` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆值',
  `userServers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '有角色的服务器组',
  `rechargeCom` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值补偿',
  `sdkChannelId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sdk渠道号',
  `bendExpireAt` datetime NULL DEFAULT NULL COMMENT '禁言过期时间',
  `bendType` int(11) NULL DEFAULT 0 COMMENT '禁言类型，第一位为普通',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_account_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10515 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-账号' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_account
-- ----------------------------
INSERT INTO `uw_account` VALUES (10511, 'aazyw.com', NULL, 'aazyw.com', 'device1477253203301', 0, 99999, '{}', '{\"1\":1}', '2016-10-24 04:06:51', NULL, '2016-10-24 04:06:51', 7, '[\"rlfdxqdaxkhoaphy\",\"iwxprzhxqbmlaeeg\",\"inscqudjekkfwmom\"]', '[\"1\"]', '[]', NULL, NULL, 0);
INSERT INTO `uw_account` VALUES (10512, 'qq479484001', NULL, '123456', 'device1477295980199', 0, 99999, '{}', '{\"1\":1}', '2016-10-24 16:03:55', NULL, '2016-10-24 16:03:55', 2, '[\"glnabuzblddkrreg\",\"vgeprcomzrgbwjsh\"]', '[\"1\"]', '[]', NULL, NULL, 0);
INSERT INTO `uw_account` VALUES (10513, 'neyuerr', NULL, '123456', 'device1527933751767', 0, 99999, '{}', '{\"1\":1}', '2018-06-02 18:02:31', NULL, '2018-06-02 18:02:31', 1, '[\"bafoxgkxxeztjpek\"]', '[\"1\"]', '[]', NULL, NULL, 0);
INSERT INTO `uw_account` VALUES (10514, 'huoguo', NULL, '123456', 'device1547124051992', 0, 99999, '{}', '{\"1\":1}', '2019-01-10 20:41:41', NULL, '2019-01-10 20:41:41', 1, '[\"tcutswikudltmotn\"]', '[\"1\"]', '[]', NULL, NULL, 0);

-- ----------------------------
-- Table structure for uw_activity
-- ----------------------------
DROP TABLE IF EXISTS `uw_activity`;
CREATE TABLE `uw_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `type` int(2) NULL DEFAULT 0 COMMENT '1:首冲;\n            2:7天登陆\n            3:限时抢购\n            4:累充福利\n            5:消费有礼\n            6:升级有奖\n            7:兑换码\n            ',
  `iconType` int(2) NULL DEFAULT 0 COMMENT 'icon类型',
  `tiIconType` int(2) NULL DEFAULT 0 COMMENT '标题icon类型',
  `startTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `items` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '物品',
  `randomHeroes` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '随机英雄数据',
  `exValues` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展值',
  `exValues2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展值2',
  `exValues3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展值3',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `isOpen` int(2) NULL DEFAULT 0 COMMENT '是否开启',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动额外信息 {\"1\":\"jchd\"}',
  `templateId` int(11) NULL DEFAULT 0 COMMENT '活动模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1075 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_activity
-- ----------------------------
INSERT INTO `uw_activity` VALUES (1, '首冲', 1, 1, 1, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"2\":5,\"4\":10,\"7\":10,\"8\":3,\"700005\":1,\"700006\":1,\"700007\":1}]', '[]', '[]', '[]', '[]', '首冲福利', 1, 1, NULL, 70);
INSERT INTO `uw_activity` VALUES (2, '7天登录', 2, 2, 1, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"601\":1},{\"18\":30,\"31\":5},{\"30\":10,\"99\":10000},{\"19\":20,\"99\":20000},{\"18\":50,\"322\":3},{\"8\":3,\"18\":100},{\"2\":3,\"7\":10,\"99\":50000}]', '', '[]', '[]', '[]', '7天登录，每天都可领取好礼', 1, 2, NULL, 71);
INSERT INTO `uw_activity` VALUES (32, '兑换码', 9, 1, 1, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', '', '[]', '[]', '[]', '兑换码', 1, 4, NULL, 73);
INSERT INTO `uw_activity` VALUES (33, '签到', 13, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '{\"301\":{\"201\":10},\"302\":{\"7\":2},\"303\":{\"10\":5},\"304\":{\"6\":1},\"305\":{\"18\":30},\"306\":{\"201\":10},\"307\":{\"2\":2},\"308\":{\"11\":5},\"309\":{\"6\":1},\"310\":{\"18\":60},\"311\":{\"201\":10},\"312\":{\"7\":5},\"313\":{\"12\":5},\"314\":{\"6\":1},\"315\":{\"18\":90},\"316\":{\"202\":20},\"317\":{\"2\":5},\"318\":{\"13\":5},\"319\":{\"6\":1},\"320\":{\"18\":120},\"321\":{\"202\":20},\"322\":{\"7\":8},\"323\":{\"14\":5},\"324\":{\"6\":1},\"325\":{\"18\":150},\"326\":{\"202\":20},\"327\":{\"2\":8},\"328\":{\"15\":5},\"329\":{\"6\":1},\"330\":{\"18\":180},\"331\":{\"203\":30},\"401\":{\"201\":10},\"402\":{\"7\":2},\"403\":{\"10\":5},\"404\":{\"6\":1},\"405\":{\"1545\":6},\"406\":{\"201\":10},\"407\":{\"2\":2},\"408\":{\"11\":5},\"409\":{\"6\":1},\"410\":{\"52\":30},\"411\":{\"201\":10},\"412\":{\"7\":5},\"413\":{\"12\":5},\"414\":{\"6\":1},\"415\":{\"1545\":18},\"416\":{\"202\":20},\"417\":{\"2\":5},\"418\":{\"13\":5},\"419\":{\"6\":1},\"420\":{\"52\":60},\"421\":{\"202\":20},\"422\":{\"7\":8},\"423\":{\"14\":5},\"424\":{\"6\":1},\"425\":{\"1545\":30},\"426\":{\"202\":20},\"427\":{\"2\":8},\"428\":{\"15\":5},\"429\":{\"6\":1},\"430\":{\"52\":90},\"501\":{\"201\":10},\"502\":{\"7\":2},\"503\":{\"10\":5},\"504\":{\"6\":1},\"505\":{\"1545\":6},\"506\":{\"201\":10},\"507\":{\"2\":2},\"508\":{\"11\":5},\"509\":{\"6\":1},\"510\":{\"52\":30},\"511\":{\"201\":10},\"512\":{\"7\":5},\"513\":{\"12\":5},\"514\":{\"6\":1},\"515\":{\"1545\":18},\"516\":{\"202\":20},\"517\":{\"2\":5},\"518\":{\"13\":5},\"519\":{\"6\":1},\"520\":{\"52\":60},\"521\":{\"202\":20},\"522\":{\"7\":8},\"523\":{\"14\":5},\"524\":{\"6\":1},\"525\":{\"1545\":30},\"526\":{\"202\":20},\"527\":{\"2\":8},\"528\":{\"15\":5},\"529\":{\"6\":1},\"530\":{\"52\":90},\"531\":{\"203\":30},\"601\":{\"201\":10},\"602\":{\"7\":2},\"603\":{\"10\":5},\"604\":{\"6\":1},\"605\":{\"1545\":6},\"606\":{\"201\":10},\"607\":{\"2\":2},\"608\":{\"11\":5},\"609\":{\"6\":1},\"610\":{\"52\":30},\"611\":{\"201\":10},\"612\":{\"7\":5},\"613\":{\"12\":5},\"614\":{\"6\":1},\"615\":{\"1545\":18},\"616\":{\"202\":20},\"617\":{\"2\":5},\"618\":{\"13\":5},\"619\":{\"6\":1},\"620\":{\"52\":60},\"621\":{\"202\":20},\"622\":{\"7\":8},\"623\":{\"14\":5},\"624\":{\"6\":1},\"625\":{\"1545\":30},\"626\":{\"202\":20},\"627\":{\"2\":8},\"628\":{\"15\":5},\"629\":{\"6\":1},\"630\":{\"52\":90},\"701\":{\"201\":10},\"702\":{\"7\":2},\"703\":{\"10\":5},\"704\":{\"6\":1},\"705\":{\"1545\":6},\"706\":{\"201\":10},\"707\":{\"2\":2},\"708\":{\"11\":5},\"709\":{\"6\":1},\"710\":{\"52\":30},\"711\":{\"201\":10},\"712\":{\"7\":5},\"713\":{\"12\":5},\"714\":{\"6\":1},\"715\":{\"1545\":18},\"716\":{\"202\":20},\"717\":{\"2\":5},\"718\":{\"13\":5},\"719\":{\"6\":1},\"720\":{\"52\":60},\"721\":{\"202\":20},\"722\":{\"7\":8},\"723\":{\"14\":5},\"724\":{\"6\":1},\"725\":{\"1545\":30},\"726\":{\"202\":20},\"727\":{\"2\":8},\"728\":{\"15\":5},\"729\":{\"6\":1},\"730\":{\"52\":90},\"731\":{\"203\":30},\"801\":{\"201\":10},\"802\":{\"7\":2},\"803\":{\"10\":5},\"804\":{\"6\":1},\"805\":{\"1545\":6},\"806\":{\"201\":10},\"807\":{\"2\":2},\"808\":{\"11\":5},\"809\":{\"6\":1},\"810\":{\"52\":30},\"811\":{\"201\":10},\"812\":{\"7\":5},\"813\":{\"12\":5},\"814\":{\"6\":1},\"815\":{\"1545\":18},\"816\":{\"202\":20},\"817\":{\"2\":5},\"818\":{\"13\":5},\"819\":{\"6\":1},\"820\":{\"52\":60},\"821\":{\"202\":20},\"822\":{\"7\":8},\"823\":{\"14\":5},\"824\":{\"6\":1},\"825\":{\"1545\":30},\"826\":{\"202\":20},\"827\":{\"2\":8},\"828\":{\"15\":5},\"829\":{\"6\":1},\"830\":{\"52\":90},\"831\":{\"203\":30},\"901\":{\"201\":10},\"902\":{\"7\":2},\"903\":{\"10\":5},\"904\":{\"6\":1},\"905\":{\"1545\":6},\"906\":{\"201\":10},\"907\":{\"2\":2},\"908\":{\"11\":5},\"909\":{\"6\":1},\"910\":{\"52\":30},\"911\":{\"201\":10},\"912\":{\"7\":5},\"913\":{\"12\":5},\"914\":{\"6\":1},\"915\":{\"1545\":18},\"916\":{\"202\":20},\"917\":{\"2\":5},\"918\":{\"13\":5},\"919\":{\"6\":1},\"920\":{\"52\":60},\"921\":{\"202\":20},\"922\":{\"7\":8},\"923\":{\"14\":5},\"924\":{\"6\":1},\"925\":{\"1545\":30},\"926\":{\"202\":20},\"927\":{\"2\":8},\"928\":{\"15\":5},\"929\":{\"6\":1},\"930\":{\"52\":90},\"1001\":{\"201\":10},\"1002\":{\"7\":2},\"1003\":{\"10\":5},\"1004\":{\"6\":1},\"1005\":{\"1545\":6},\"1006\":{\"201\":10},\"1007\":{\"2\":2},\"1008\":{\"11\":5},\"1009\":{\"6\":1},\"1010\":{\"52\":30},\"1011\":{\"201\":10},\"1012\":{\"7\":5},\"1013\":{\"12\":5},\"1014\":{\"6\":1},\"1015\":{\"1545\":18},\"1016\":{\"202\":20},\"1017\":{\"2\":5},\"1018\":{\"13\":5},\"1019\":{\"6\":1},\"1020\":{\"52\":60},\"1021\":{\"202\":20},\"1022\":{\"7\":8},\"1023\":{\"14\":5},\"1024\":{\"6\":1},\"1025\":{\"1545\":30},\"1026\":{\"202\":20},\"1027\":{\"2\":8},\"1028\":{\"15\":5},\"1029\":{\"6\":1},\"1030\":{\"52\":90},\"1031\":{\"203\":30},\"1101\":{\"201\":10},\"1102\":{\"7\":2},\"1103\":{\"10\":5},\"1104\":{\"6\":1},\"1105\":{\"1545\":6},\"1106\":{\"201\":10},\"1107\":{\"2\":2},\"1108\":{\"11\":5},\"1109\":{\"6\":1},\"1110\":{\"52\":30},\"1111\":{\"201\":10},\"1112\":{\"7\":5},\"1113\":{\"12\":5},\"1114\":{\"6\":1},\"1115\":{\"1545\":18},\"1116\":{\"202\":20},\"1117\":{\"2\":5},\"1118\":{\"13\":5},\"1119\":{\"6\":1},\"1120\":{\"52\":60},\"1121\":{\"202\":20},\"1122\":{\"7\":8},\"1123\":{\"14\":5},\"1124\":{\"6\":1},\"1125\":{\"1545\":30},\"1126\":{\"202\":20},\"1127\":{\"2\":8},\"1128\":{\"15\":5},\"1129\":{\"6\":1},\"1130\":{\"52\":90},\"1201\":{\"201\":10},\"1202\":{\"7\":2},\"1203\":{\"10\":5},\"1204\":{\"6\":1},\"1205\":{\"1545\":6},\"1206\":{\"201\":10},\"1207\":{\"2\":2},\"1208\":{\"11\":5},\"1209\":{\"6\":1},\"1210\":{\"52\":30},\"1211\":{\"201\":10},\"1212\":{\"7\":5},\"1213\":{\"12\":5},\"1214\":{\"6\":1},\"1215\":{\"1545\":18},\"1216\":{\"202\":20},\"1217\":{\"2\":5},\"1218\":{\"13\":5},\"1219\":{\"6\":1},\"1220\":{\"52\":60},\"1221\":{\"202\":20},\"1222\":{\"7\":8},\"1223\":{\"14\":5},\"1224\":{\"6\":1},\"1225\":{\"1545\":30},\"1226\":{\"202\":20},\"1227\":{\"2\":8},\"1228\":{\"15\":5},\"1229\":{\"6\":1},\"1230\":{\"52\":90},\"1231\":{\"203\":30}}', '[]', '[]', '每天签到即可领取对应好礼', 1, 30, '{}', 72);
INSERT INTO `uw_activity` VALUES (34, '探宝', 14, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', '', '[]', '[]', '[]', '探宝', 1, 5, NULL, 74);
INSERT INTO `uw_activity` VALUES (1015, '单笔充值第六弹', 16, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":12,\"200\":60},{\"30\":40,\"200\":980,\"1434\":12},{\"30\":80,\"200\":1980,\"1434\":24},{\"30\":200,\"200\":4980,\"1070\":40,\"1071\":40,\"1072\":40,\"1434\":60,\"1453\":40},{\"30\":400,\"35\":999,\"200\":9980,\"1070\":80,\"1071\":80,\"1072\":80,\"1434\":120,\"1453\":60},{\"30\":1000,\"35\":2999,\"200\":29980,\"1070\":240,\"1071\":240,\"1072\":240,\"1434\":300,\"1453\":200}]', '', '[60,980,1980,4980,9980,29980]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '', 0);
INSERT INTO `uw_activity` VALUES (1027, '累计充值第六弹', 5, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":9980},{\"19\":400,\"200\":19960},{\"19\":800,\"35\":1999,\"200\":29980},{\"19\":1600,\"35\":9999,\"200\":69940,\"1070\":140,\"1071\":140,\"1072\":140,\"1509\":225},{\"19\":2600,\"35\":39999,\"200\":109900,\"1070\":180,\"1071\":180,\"1072\":180,\"1509\":500}]', '', '[998,1996,2998,6994,10990]', '[]', '[]', '累计充值达到指定额度即可领取奖励 ', 0, 0, '', 0);
INSERT INTO `uw_activity` VALUES (1031, '天天充值', 23, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{}]', NULL, '[6]', NULL, NULL, '每天充值6元，即可领取天天充值福利！', 1, 190, '{\"1\":\"ttcz\"}', 89);
INSERT INTO `uw_activity` VALUES (1034, '限时元宝抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"8\":10,\"18\":300,\"30\":3888,\"99\":1000000}]', NULL, '[2980]', '[2]', '[]', '1，活动时间内每人仅能购买2次；\r\n2，购买后物品将发送至邮箱；', 1, 200, '{\"1\":\"xsqg\",\"3\":200}', 0);
INSERT INTO `uw_activity` VALUES (1035, '神秘金币塔罗牌', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{}]', NULL, '[500000]', '[3]', '[]', '永远有更好的道具等着你！', 1, 210, '{\"1\":\"tlp2\",\"3\":99}', 88);
INSERT INTO `uw_activity` VALUES (1036, '神秘元宝塔罗牌', 22, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{}]', '', '[300]', '[3]', '[]', '永远有更好的道具等着你', 1, 220, '{\"1\":\"smtlp\",\"3\":200}', 0);
INSERT INTO `uw_activity` VALUES (1037, '限时换购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":50}]', NULL, '[1]', '[200]', '[]', '1，活动期间内每人仅能购买200次\r\n2，购买后物品将发放至邮箱', 1, 230, '{\"1\":\"nsxg\",\"3\":\"48\"}', 0);
INSERT INTO `uw_activity` VALUES (1038, '单笔充值第七弹', 16, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":12,\"200\":60},{\"30\":40,\"200\":980,\"1434\":12},{\"30\":80,\"200\":1980,\"1434\":24},{\"30\":200,\"200\":4980,\"1070\":40,\"1071\":40,\"1072\":40,\"1434\":60,\"1453\":40},{\"30\":400,\"35\":999,\"200\":9980,\"1070\":80,\"1071\":80,\"1072\":80,\"1434\":120,\"1453\":60},{\"30\":1000,\"35\":2999,\"200\":29980,\"1070\":240,\"1071\":240,\"1072\":240,\"1434\":300,\"1453\":200}]', '', '[60,980,1980,4980,9980,29980]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '', 0);
INSERT INTO `uw_activity` VALUES (1039, '累计充值第七弹', 5, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":9980},{\"19\":400,\"200\":19960},{\"19\":800,\"35\":1999,\"200\":29980},{\"19\":1600,\"35\":9999,\"200\":69940,\"1070\":140,\"1071\":140,\"1072\":140,\"1509\":225},{\"19\":2600,\"35\":39999,\"200\":109900,\"1070\":180,\"1071\":180,\"1072\":180,\"1509\":500}]', '', '[998,1996,2998,6994,10990]', '[]', '[]', '累计充值达到指定额度即可领取奖励 ', 0, 0, '', 0);
INSERT INTO `uw_activity` VALUES (1043, '白色情人礼', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"18\":99,\"30\":14,\"99\":314000}]', NULL, '[14]', '[3]', '[]', '1，活动时间内每人仅能购买3次；\r\n2，购买后物品将发送至邮箱；', 1, 7, '{\"1\":\"bsqrj\",\"3\":200}', 0);
INSERT INTO `uw_activity` VALUES (1044, '累计充值第五弹', 5, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":\"9980\"},{\"19\":\"400\",\"200\":\"19960\"},{\"19\":\"800\",\"35\":\"1999\",\"200\":\"29980\"},{\"19\":\"1600\",\"35\":\"9999\",\"200\":\"69940\",\"1070\":\"140\",\"1071\":\"140\",\"1072\":\"140\",\"1509\":\"225\"},{\"19\":\"2600\",\"35\":\"39999\",\"200\":\"109900\",\"1070\":\"180\",\"1071\":\"180\",\"1072\":\"180\",\"1509\":\"500\"}]', NULL, '[\"998\",\"1996\",\"2998\",\"6994\",\"10990\"]', '[]', '[]', '累计充值达到指定额度即可领取奖励', 0, 100, '', 85);
INSERT INTO `uw_activity` VALUES (1045, '单笔充值第五弹', 16, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":\"12\",\"200\":\"60\"},{\"30\":\"40\",\"200\":\"980\",\"1434\":\"12\"},{\"30\":\"80\",\"1434\":\"24\",\"200\":\"1980\"},{\"30\":\"200\",\"1070\":\"40\",\"1071\":\"40\",\"1072\":\"40\",\"200\":\"4980\",\"1434\":\"60\",\"1453\":\"40\"},{\"30\":\"400\",\"1434\":\"120\",\"1453\":\"60\",\"1070\":\"80\",\"1071\":\"80\",\"1072\":\"80\",\"200\":\"9980\",\"35\":\"999\"},{\"30\":\"1000\",\"35\":\"2999\",\"1434\":\"300\",\"1453\":\"200\",\"1070\":\"240\",\"1071\":\"240\",\"1072\":\"240\",\"200\":\"29980\"}]', NULL, '[\"60\",\"980\",\"1980\",\"4980\",\"9980\",\"29980\"]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '', 84);
INSERT INTO `uw_activity` VALUES (1046, '单笔充值第五弹', 16, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":\"12\",\"200\":\"60\"},{\"30\":\"40\",\"200\":\"980\",\"1434\":\"12\"},{\"30\":\"80\",\"200\":\"1980\",\"1434\":\"24\"},{\"30\":\"200\",\"200\":\"4980\",\"1070\":\"40\",\"1071\":\"40\",\"1072\":\"40\",\"1434\":\"60\",\"1453\":\"40\"},{\"30\":\"400\",\"35\":\"999\",\"200\":\"9980\",\"1070\":\"80\",\"1071\":\"80\",\"1072\":\"80\",\"1434\":\"120\",\"1453\":\"60\"},{\"30\":\"1000\",\"35\":\"2999\",\"200\":\"29980\",\"1070\":\"240\",\"1071\":\"240\",\"1072\":\"240\",\"1434\":\"300\",\"1453\":\"200\"}]', NULL, '[\"60\",\"980\",\"1980\",\"4980\",\"9980\",\"29980\"]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '{\"1\":\"dbcz\"}', 84);
INSERT INTO `uw_activity` VALUES (1047, '累计充值第五弹', 5, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":\"9980\"},{\"19\":\"400\",\"200\":\"19960\"},{\"19\":\"800\",\"35\":\"1999\",\"200\":\"29980\"},{\"19\":\"1600\",\"35\":\"9999\",\"200\":\"69940\",\"1070\":\"140\",\"1071\":\"140\",\"1072\":\"140\",\"1509\":\"225\"},{\"19\":\"2600\",\"35\":\"39999\",\"200\":\"109900\",\"1070\":\"180\",\"1071\":\"180\",\"1072\":\"180\",\"1509\":\"500\"}]', NULL, '[\"998\",\"1996\",\"2998\",\"6994\",\"10990\"]', '[]', '[]', '累计充值达到指定额度即可领取奖励', 0, 60, '{\"1\":\"lcfl\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 85);
INSERT INTO `uw_activity` VALUES (1048, '特戒连抽', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[300]', '[1]', '[]', '特戒碎片，一起抽起来！', 1, 170, '{\"1\":\"tjlc\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 92);
INSERT INTO `uw_activity` VALUES (1049, '珍品抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"53\":\"1\",\"54\":\"3\",\"1550\":\"3\",\"1551\":\"1\"}]', NULL, '[288]', '[99]', '[]', '1、每人能购买99次\n2、购买后物品将会发送到邮箱', 1, 180, '{\"1\":\"zpqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 93);
INSERT INTO `uw_activity` VALUES (1050, '勋章神秘商店', 17, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[37]', '[]', '[]', '勋章大派送！', 1, 190, '{\"1\":\"smsd\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 94);
INSERT INTO `uw_activity` VALUES (1051, '累计充值第五弹', 5, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":\"9980\"},{\"19\":\"400\",\"200\":\"19960\"},{\"19\":\"800\",\"35\":\"1999\",\"200\":\"29980\"},{\"19\":\"1600\",\"35\":\"9999\",\"200\":\"69940\",\"1070\":\"140\",\"1071\":\"140\",\"1072\":\"140\",\"1509\":\"225\"},{\"19\":\"2600\",\"35\":\"39999\",\"200\":\"109900\",\"1070\":\"180\",\"1071\":\"180\",\"1072\":\"180\",\"1509\":\"500\"}]', NULL, '[\"998\",\"1996\",\"2998\",\"6994\",\"10990\"]', '[]', '[]', '累计充值达到指定额度即可领取奖励', 0, 60, '{\"1\":\"lcfl\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 85);
INSERT INTO `uw_activity` VALUES (1052, '单笔充值第五弹', 16, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":\"12\",\"200\":\"60\"},{\"30\":\"40\",\"200\":\"980\",\"1434\":\"12\"},{\"30\":\"80\",\"200\":\"1980\",\"1434\":\"24\"},{\"30\":\"200\",\"200\":\"4980\",\"1070\":\"40\",\"1071\":\"40\",\"1072\":\"40\",\"1434\":\"60\",\"1453\":\"40\"},{\"30\":\"400\",\"35\":\"999\",\"200\":\"9980\",\"1070\":\"80\",\"1071\":\"80\",\"1072\":\"80\",\"1434\":\"120\",\"1453\":\"60\"},{\"30\":\"1000\",\"35\":\"2999\",\"200\":\"29980\",\"1070\":\"240\",\"1071\":\"240\",\"1072\":\"240\",\"1434\":\"300\",\"1453\":\"200\"}]', NULL, '[\"60\",\"980\",\"1980\",\"4980\",\"9980\",\"29980\"]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '{\"1\":\"dbcz\"}', 84);
INSERT INTO `uw_activity` VALUES (1053, '神秘金币塔罗牌', 22, NULL, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', '', '[500000]', '[3]', '[]', '永远有更好的道具等着你！', 1, 130, '{\"1\":\"tlp2\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 88);
INSERT INTO `uw_activity` VALUES (1054, '珍品抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"53\":\"1\",\"54\":\"3\",\"1550\":\"3\",\"1551\":\"1\"}]', NULL, '[288]', '[99]', '[]', '1、每人能购买99次\n2、购买后物品将会发送到邮箱', 1, 180, '{\"1\":\"zpqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 93);
INSERT INTO `uw_activity` VALUES (1056, '勋章商人', 17, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[38]', '[]', '[]', '勋章大派送！', 1, 200, '{\"1\":\"xzsr\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 95);
INSERT INTO `uw_activity` VALUES (1057, '特戒连抽', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[300]', '[1]', '[]', '特戒碎片，一起抽起来！', 1, 170, '{\"1\":\"tjlc\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 92);
INSERT INTO `uw_activity` VALUES (1058, '限时元宝抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"8\":\"10\",\"18\":\"300\",\"30\":\"3888\",\"99\":\"1000000\"}]', NULL, '[2980]', '[2]', '[]', '1，活动时间内每人仅能购买2次；\n2，购买后物品将发送至邮箱；', 1, 150, '{\"1\":\"xsqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 90);
INSERT INTO `uw_activity` VALUES (1059, 'BOSS之门', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[200]', '[1]', '[]', 'BOSS召唤令大派送！', 1, 210, '{\"1\":\"bozm\",\"2\":\"\",\"3\":200,\"4\":\"\",\"5\":\"2\"}', 97);
INSERT INTO `uw_activity` VALUES (1060, '累计充值第五弹', 5, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":\"9980\"},{\"19\":\"400\",\"200\":\"19960\"},{\"19\":\"800\",\"35\":\"1999\",\"200\":\"29980\"},{\"19\":\"1600\",\"35\":\"9999\",\"200\":\"69940\",\"1070\":\"140\",\"1071\":\"140\",\"1072\":\"140\",\"1509\":\"225\"},{\"19\":\"2600\",\"35\":\"39999\",\"200\":\"109900\",\"1070\":\"180\",\"1071\":\"180\",\"1072\":\"180\",\"1509\":\"500\"}]', NULL, '[\"998\",\"1996\",\"2998\",\"6994\",\"10990\"]', '[]', '[]', '累计充值达到指定额度即可领取奖励', 0, 60, '{\"1\":\"lcfl\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 85);
INSERT INTO `uw_activity` VALUES (1061, '单笔充值第五弹', 16, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":\"12\",\"200\":\"60\"},{\"30\":\"40\",\"200\":\"980\",\"1434\":\"12\"},{\"30\":\"80\",\"200\":\"1980\",\"1434\":\"24\"},{\"30\":\"200\",\"200\":\"4980\",\"1070\":\"40\",\"1071\":\"40\",\"1072\":\"40\",\"1434\":\"60\",\"1453\":\"40\"},{\"30\":\"400\",\"35\":\"999\",\"200\":\"9980\",\"1070\":\"80\",\"1071\":\"80\",\"1072\":\"80\",\"1434\":\"120\",\"1453\":\"60\"},{\"30\":\"1000\",\"35\":\"2999\",\"200\":\"29980\",\"1070\":\"240\",\"1071\":\"240\",\"1072\":\"240\",\"1434\":\"300\",\"1453\":\"200\"}]', NULL, '[\"60\",\"980\",\"1980\",\"4980\",\"9980\",\"29980\"]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 0, 6, '{\"1\":\"dbcz\"}', 84);
INSERT INTO `uw_activity` VALUES (1062, '勋章商人', 17, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[38]', '[]', '[]', '勋章大派送！', 1, 200, '{\"1\":\"xzsr\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 95);
INSERT INTO `uw_activity` VALUES (1063, '珍品抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"53\":\"1\",\"54\":\"3\",\"1550\":\"3\",\"1551\":\"1\"}]', NULL, '[288]', '[99]', '[]', '1、每人能购买99次\n2、购买后物品将会发送到邮箱', 1, 180, '{\"1\":\"zpqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 93);
INSERT INTO `uw_activity` VALUES (1064, '特戒连抽', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[300]', '[1]', '[]', '特戒碎片，一起抽起来！', 1, 170, '{\"1\":\"tjlc\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 92);
INSERT INTO `uw_activity` VALUES (1065, '限时元宝抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"8\":\"10\",\"18\":\"300\",\"30\":\"3888\",\"99\":\"1000000\"}]', NULL, '[2980]', '[2]', '[]', '1，活动时间内每人仅能购买2次；\n2，购买后物品将发送至邮箱；', 1, 150, '{\"1\":\"xsqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 90);
INSERT INTO `uw_activity` VALUES (1067, '神秘金币塔罗牌', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[500000]', '[3]', '[]', '永远有更好的道具等着你！', 1, 130, '{\"1\":\"tlp2\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 88);
INSERT INTO `uw_activity` VALUES (1068, '累计充值第五弹', 5, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"200\":\"9980\"},{\"19\":\"400\",\"200\":\"19960\"},{\"19\":\"800\",\"35\":\"1999\",\"200\":\"29980\"},{\"19\":\"1600\",\"35\":\"9999\",\"200\":\"69940\",\"1070\":\"140\",\"1071\":\"140\",\"1072\":\"140\",\"1509\":\"225\"},{\"19\":\"2600\",\"35\":\"39999\",\"200\":\"109900\",\"1070\":\"180\",\"1071\":\"180\",\"1072\":\"180\",\"1509\":\"500\"}]', NULL, '[\"998\",\"1996\",\"2998\",\"6994\",\"10990\"]', '[]', '[]', '累计充值达到指定额度即可领取奖励', 1, 60, '{\"1\":\"lcfl\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 85);
INSERT INTO `uw_activity` VALUES (1069, '单笔充值第五弹', 16, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"30\":\"12\",\"200\":\"60\"},{\"30\":\"40\",\"200\":\"980\",\"1434\":\"12\"},{\"30\":\"80\",\"200\":\"1980\",\"1434\":\"24\"},{\"30\":\"200\",\"200\":\"4980\",\"1070\":\"40\",\"1071\":\"40\",\"1072\":\"40\",\"1434\":\"60\",\"1453\":\"40\"},{\"30\":\"400\",\"35\":\"999\",\"200\":\"9980\",\"1070\":\"80\",\"1071\":\"80\",\"1072\":\"80\",\"1434\":\"120\",\"1453\":\"60\"},{\"30\":\"1000\",\"35\":\"2999\",\"200\":\"29980\",\"1070\":\"240\",\"1071\":\"240\",\"1072\":\"240\",\"1434\":\"300\",\"1453\":\"200\"}]', NULL, '[\"60\",\"980\",\"1980\",\"4980\",\"9980\",\"29980\"]', '[]', '[]', '单笔充值达到指定额度即可领取福利', 1, 6, '{\"1\":\"dbcz\"}', 84);
INSERT INTO `uw_activity` VALUES (1070, '消费返利', 28, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"1550\":\"5\",\"1551\":\"15\"},{\"1550\":\"50\",\"1551\":\"15\",\"5306\":\"1\"},{\"45\":\"500\",\"1551\":\"80\",\"5310\":\"5\",\"10180\":\"1\"},{\"45\":\"850\",\"1551\":\"300\",\"1566\":\"3\",\"5311\":\"5\",\"10180\":\"3\"},{\"19\":\"2000\",\"45\":\"5000\",\"52\":\"35000\",\"1551\":\"1000\",\"1566\":\"5\",\"5315\":\"15\",\"10180\":\"15\"}]', NULL, '[\"6660\",\"36660\",\"199990\",\"666666\",\"2666666\"]', '[]', '[]', '消费返利', 1, 0, '{\"1\":\"xffl\",\"2\":\"\",\"3\":99,\"4\":\"\",\"5\":\"\"}', 98);
INSERT INTO `uw_activity` VALUES (1071, '勋章商人', 17, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[38]', '[]', '[]', '勋章大派送！', 1, 200, '{\"1\":\"xzsr\",\"2\":\"\",\"3\":99,\"4\":\"\"}', 95);
INSERT INTO `uw_activity` VALUES (1072, '珍品抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"53\":\"1\",\"54\":\"3\",\"1550\":\"3\",\"1551\":\"1\"}]', NULL, '[288]', '[99]', '[]', '1、每人能购买99次\n2、购买后物品将会发送到邮箱', 1, 180, '{\"1\":\"zpqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 93);
INSERT INTO `uw_activity` VALUES (1073, '特戒连抽', 22, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[]', NULL, '[300]', '[1]', '[]', '特戒碎片，一起抽起来！', 1, 170, '{\"1\":\"tjlc\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 92);
INSERT INTO `uw_activity` VALUES (1074, '限时元宝抢购', 24, 0, 0, '2016-10-09 16:00:00', '2020-07-03 17:32:22', '[{\"8\":\"10\",\"18\":\"300\",\"30\":\"3888\",\"99\":\"1000000\"}]', NULL, '[2980]', '[2]', '[]', '1，活动时间内每人仅能购买2次；\n2，购买后物品将发送至邮箱；', 1, 150, '{\"1\":\"xsqg\",\"2\":\"\",\"3\":200,\"4\":\"\"}', 90);

-- ----------------------------
-- Table structure for uw_activity_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_activity_record`;
CREATE TABLE `uw_activity_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `activityId` int(11) NULL DEFAULT NULL COMMENT '活动id',
  `activityType` int(11) NULL DEFAULT NULL COMMENT '活动类型',
  `userLvl` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  `userVip` int(11) NULL DEFAULT NULL COMMENT '用户vip',
  `costDiamond` int(11) NULL DEFAULT NULL COMMENT '消耗钻石数量',
  `getDiamond` int(11) NULL DEFAULT NULL COMMENT '获取钻石数量',
  `joinCount` int(11) NULL DEFAULT NULL COMMENT '参与活动次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-活动记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_arena
-- ----------------------------
DROP TABLE IF EXISTS `uw_arena`;
CREATE TABLE `uw_arena`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `rank` int(11) NULL DEFAULT 0 COMMENT '排名',
  `highRank` int(11) NULL DEFAULT 0 COMMENT '历史最高排名',
  `fightRanks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挑战排名',
  `reNumData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挑战次数数据',
  `awardData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励数据',
  `winCount` int(11) NULL DEFAULT 0 COMMENT '累计胜场',
  `conWinCount` int(11) NULL DEFAULT 0 COMMENT '连胜场数',
  `maxConWinCount` int(11) NULL DEFAULT 0 COMMENT '最大连胜场数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_arena_uid`(`userId`) USING BTREE,
  INDEX `uw_arena_rank`(`rank`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_arena_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_arena_bak`;
CREATE TABLE `uw_arena_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `rank` int(11) NULL DEFAULT 0 COMMENT '排名',
  `highRank` int(11) NULL DEFAULT 0 COMMENT '历史最高排名',
  `fightRanks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挑战排名',
  `reNumData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挑战次数数据[剩余挑战次数，上一次恢复次数时间，下一次可以挑战的时间(cd)]',
  `awardData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖励数据',
  `winCount` int(11) NULL DEFAULT 0 COMMENT '累计胜场',
  `conWinCount` int(11) NULL DEFAULT 0 COMMENT '连胜场数',
  `maxConWinCount` int(11) NULL DEFAULT 0 COMMENT '最大连胜场数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_arena_uid`(`userId`) USING BTREE,
  INDEX `uw_arena_rank`(`rank`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_arena_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_arena_record`;
CREATE TABLE `uw_arena_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `userLvl` int(11) NULL DEFAULT 0 COMMENT '用户等级',
  `userIconId` int(4) NULL DEFAULT NULL COMMENT '用户头像',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名字',
  `userWinCount` int(11) NULL DEFAULT NULL COMMENT '用户胜场',
  `enemyId` int(11) NULL DEFAULT NULL COMMENT '对手id',
  `enemyLvl` int(4) NULL DEFAULT 0 COMMENT '对手等级',
  `enemyIconId` int(4) NULL DEFAULT NULL COMMENT '对手头像',
  `enemyName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对手名字',
  `enemyWinCount` int(11) NULL DEFAULT NULL COMMENT '对手胜场',
  `isWin` int(2) NULL DEFAULT 0 COMMENT '是否胜利',
  `fightTime` datetime NULL DEFAULT NULL COMMENT '挑战时间',
  `fightData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '战斗数据',
  `fightType` int(2) NULL DEFAULT 1,
  `isDeal` int(2) NULL DEFAULT 0,
  `isRead` int(2) NULL DEFAULT 0,
  `isRevenge` int(2) NULL DEFAULT 0 COMMENT '是否复仇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_arena_record_uid`(`userId`) USING BTREE,
  INDEX `uw_arena_record_eid`(`enemyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '排位赛挑战记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_bonus_draw
-- ----------------------------
DROP TABLE IF EXISTS `uw_bonus_draw`;
CREATE TABLE `uw_bonus_draw`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `drawAmount` int(11) NOT NULL COMMENT '本次提取额',
  `beforeDraw` int(11) NOT NULL COMMENT '提取前金额',
  `afterDraw` int(11) NOT NULL COMMENT '提取后的金额',
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提取表，用户的提取记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_bonus_event
-- ----------------------------
DROP TABLE IF EXISTS `uw_bonus_event`;
CREATE TABLE `uw_bonus_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '下家的ID',
  `inviterUserId` int(11) NOT NULL COMMENT '上家的ID',
  `eventType` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件类型：LEVELUP, RECHARGE',
  `reference` int(11) NOT NULL DEFAULT 0 COMMENT '充值时金额，或升级时的目标等级',
  `shareAmount` int(11) NOT NULL DEFAULT 0 COMMENT '当前事件贡献给上级的金额',
  `createTime` datetime NULL DEFAULT NULL COMMENT '事件发生的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '下家贡献的流水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_bonus_relation
-- ----------------------------
DROP TABLE IF EXISTS `uw_bonus_relation`;
CREATE TABLE `uw_bonus_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '分享者的ID',
  `inviteeUserId` int(11) NOT NULL COMMENT '被邀请的用户的ID',
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '被邀请的用户累计贡献',
  `isBreak` int(11) NOT NULL DEFAULT 0 COMMENT '关系是否已解除',
  `createTime` datetime NULL DEFAULT NULL COMMENT '被邀请的用户进入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_inviteeUserId`(`inviteeUserId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '好友关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_bonus_share
-- ----------------------------
DROP TABLE IF EXISTS `uw_bonus_share`;
CREATE TABLE `uw_bonus_share`  (
  `userId` int(11) NOT NULL DEFAULT 0 COMMENT '用户角色id',
  `shareKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分享用的key，用来唯一代表该用户',
  `balance` int(11) NOT NULL DEFAULT 0 COMMENT '仍未提取的金额',
  `amountDraw` int(11) NOT NULL DEFAULT 0 COMMENT '已提取的金额',
  `relationCount` int(11) NOT NULL DEFAULT 0 COMMENT '下家数量',
  `gifted` int(11) NOT NULL DEFAULT 0 COMMENT '首次分享是否已经奖励了',
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `idx_shareKey`(`shareKey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分红主表，每个分享过链接的用户一条记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_boss
-- ----------------------------
DROP TABLE IF EXISTS `uw_boss`;
CREATE TABLE `uw_boss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bossId` int(11) NULL DEFAULT NULL COMMENT 'bossId',
  `startTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `killUserId` int(11) NULL DEFAULT 0 COMMENT '击杀人的id',
  `deathTime` datetime NULL DEFAULT NULL COMMENT '死亡时间',
  `status` int(4) NULL DEFAULT 0 COMMENT '状态 0:未开启 1:开启中',
  `lastIsWin` int(4) NULL DEFAULT 0 COMMENT '最后一次是否胜利',
  `resultData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结算数据',
  `isPrize` int(2) NULL DEFAULT 0 COMMENT '是否结算奖励',
  `limitStartTime` datetime NULL DEFAULT NULL COMMENT '限时开启时间',
  `limitEndTime` datetime NULL DEFAULT NULL COMMENT '限时结束时间',
  `isLimit` int(2) NULL DEFAULT 0 COMMENT '是否限时',
  `type` int(4) NULL DEFAULT 0 COMMENT '类型',
  `originBossId` int(11) NULL DEFAULT 0 COMMENT '原始bossId',
  `deathBossId` int(11) NULL DEFAULT 0 COMMENT '类型',
  `repeatCount` int(6) NULL DEFAULT 0 COMMENT '复活次数',
  `repeatTime` datetime NULL DEFAULT NULL COMMENT '最后复活时间',
  `callArr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '召唤数据',
  `week` int(4) NULL DEFAULT 0 COMMENT '周几',
  `errData` int(4) NULL DEFAULT 0 COMMENT '周几',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_boss_bossid`(`bossId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '世界BOSS' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_boss
-- ----------------------------
INSERT INTO `uw_boss` VALUES (71, 120000, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-01-01 00:00:00', '2026-12-31 00:00:00', 1, 0, 120000, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (72, 120001, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120001, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (73, 120002, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120002, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (74, 120003, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120003, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (75, 120004, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120004, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (76, 120005, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120005, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (77, 120006, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120006, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (78, 120007, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120007, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (79, 120008, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120008, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (80, 120009, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 120009, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (81, 121000, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-01-01 00:00:00', '2026-12-31 00:00:00', 1, 0, 121000, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (82, 121001, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121001, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (83, 121002, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121002, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (84, 121003, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121003, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (85, 121004, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121004, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (86, 121005, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121005, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (87, 121006, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121006, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (88, 121007, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121007, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (89, 121008, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121008, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (90, 121009, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 0, 121009, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (91, 130038, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130038, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (92, 130039, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130039, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (93, 130040, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130040, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (94, 130041, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130041, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (95, 130042, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130042, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (96, 130043, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130043, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (97, 130044, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 1, 0, 130044, 0, 0, NULL, NULL, 0, NULL);
INSERT INTO `uw_boss` VALUES (98, 140001, '2016-10-10 21:00:00', '2016-10-10 21:59:59', NULL, NULL, 0, 0, '{\"rank10\":[],\"callUserId\":null,\"guildUserIds\":[],\"callGuildName\":null,\"hurtDic\":{},\"isWin\":0,\"killTotalTime\":3598,\"firstHurtName\":null,\"killUserName\":null}', 1, '2016-07-03 00:05:41', '2016-07-12 00:05:41', 0, 1, 140001, 140001, 0, NULL, NULL, 0, NULL);

-- ----------------------------
-- Table structure for uw_boss_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_boss_bak`;
CREATE TABLE `uw_boss_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bossId` int(11) NULL DEFAULT NULL COMMENT 'bossId',
  `startTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `killUserId` int(11) NULL DEFAULT 0 COMMENT '击杀人的id',
  `deathTime` datetime NULL DEFAULT NULL COMMENT '死亡时间',
  `status` int(4) NULL DEFAULT 0 COMMENT '状态 0:未开启 1:开启中',
  `lastIsWin` int(4) NULL DEFAULT 0 COMMENT '最后一次是否胜利',
  `resultData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结算数据',
  `isPrize` int(2) NULL DEFAULT 0 COMMENT '是否结算奖励',
  `limitStartTime` datetime NULL DEFAULT NULL COMMENT '限时开启时间',
  `limitEndTime` datetime NULL DEFAULT NULL COMMENT '限时结束时间',
  `isLimit` int(2) NULL DEFAULT 0 COMMENT '是否限时',
  `type` int(4) NULL DEFAULT 0 COMMENT '类型',
  `originBossId` int(11) NULL DEFAULT 0 COMMENT '原始bossId',
  `deathBossId` int(11) NULL DEFAULT 0 COMMENT '类型',
  `repeatCount` int(6) NULL DEFAULT 0 COMMENT '复活次数',
  `repeatTime` datetime NULL DEFAULT NULL COMMENT '最后复活时间',
  `callArr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '召唤数据',
  `week` int(4) NULL DEFAULT 0 COMMENT '周几',
  `errData` int(4) NULL DEFAULT 0 COMMENT '周几',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_boss_bossid`(`bossId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '世界BOSS' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_challengecup
-- ----------------------------
DROP TABLE IF EXISTS `uw_challengecup`;
CREATE TABLE `uw_challengecup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '当前守擂者userId',
  `leftTime` datetime NULL DEFAULT NULL COMMENT '成为擂主的时间戳',
  `championUserId` int(11) NULL DEFAULT NULL COMMENT '老擂主userId',
  `startTime` datetime NULL DEFAULT NULL,
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `isOpen` int(2) NULL DEFAULT 0,
  `worship` int(6) NULL DEFAULT 0 COMMENT '被膜拜次数',
  `worshipCount` int(11) NULL DEFAULT 0 COMMENT '被膜拜总次数',
  `buffOpenNum` int(4) NULL DEFAULT 0 COMMENT 'buff开启次数',
  `buffOpenTime` datetime NULL DEFAULT NULL COMMENT '最后一次开启时间',
  `buffEndTime` datetime NULL DEFAULT NULL COMMENT 'buff结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_challengecup_rank
-- ----------------------------
DROP TABLE IF EXISTS `uw_challengecup_rank`;
CREATE TABLE `uw_challengecup_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `startTime` datetime NULL DEFAULT NULL,
  `endTime` datetime NULL DEFAULT NULL,
  `maxTime` int(11) NULL DEFAULT 0 COMMENT '最长守擂时间',
  `iconId` int(4) NULL DEFAULT NULL,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lvl` int(4) NULL DEFAULT NULL,
  `vip` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_challengeCupRank_aid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_coffers
-- ----------------------------
DROP TABLE IF EXISTS `uw_coffers`;
CREATE TABLE `uw_coffers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级',
  `buildValue` int(11) NULL DEFAULT 0 COMMENT '建设值',
  `resource` int(11) NULL DEFAULT 0 COMMENT '国库当前储量',
  `lootResource` int(11) NULL DEFAULT 0 COMMENT '今日掠夺储量',
  `beLootResource` int(11) NULL DEFAULT 0 COMMENT '今日被劫储量',
  `defeseData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '守卫玩家数据',
  `defeseRecordArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '防守记录',
  `lootRecordArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '掠夺成功记录',
  `points` int(11) NULL DEFAULT 0 COMMENT '累计积分',
  `todayPoints` int(11) NULL DEFAULT 0 COMMENT '今日积分',
  `buffLvl` int(11) NULL DEFAULT 0 COMMENT 'buff等级',
  `buffExpc` int(11) NULL DEFAULT 0 COMMENT 'buff经验',
  `buffBase` int(11) NULL DEFAULT 0 COMMENT 'buff基础值',
  `lootUserData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '掠夺别的服务器用户数据 {服务器id:{用户id:[次数],....},...}',
  `breakTimeData` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '守卫击破时间数据{门口:时间}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-国库信息(CoffersEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_coffers
-- ----------------------------
INSERT INTO `uw_coffers` VALUES (1, 1, 0, 21880000, 0, 0, '{\"0\":[0,71006,4,[]],\"1\":[1,null,null,[]],\"2\":[2,null,null,[]],\"3\":[3,null,null,[]],\"4\":[]}', '[]', '[]', 0, 0, 0, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for uw_coffers_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_coffers_bak`;
CREATE TABLE `uw_coffers_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级',
  `buildValue` int(11) NULL DEFAULT 0 COMMENT '建设值',
  `resource` int(11) NULL DEFAULT 0 COMMENT '国库当前储量',
  `lootResource` int(11) NULL DEFAULT 0 COMMENT '今日掠夺储量',
  `beLootResource` int(11) NULL DEFAULT 0 COMMENT '今日被劫储量',
  `defeseData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '[门类型，用户id,头衔类型，被掠夺的对手id组]',
  `defeseRecordArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '防守记录',
  `lootRecordArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '掠夺成功记录',
  `points` int(11) NULL DEFAULT 0 COMMENT '累计积分',
  `todayPoints` int(11) NULL DEFAULT 0 COMMENT '今日积分',
  `buffLvl` int(11) NULL DEFAULT 0 COMMENT 'buff等级',
  `buffExpc` int(11) NULL DEFAULT 0 COMMENT 'buff经验',
  `buffBase` int(11) NULL DEFAULT 0 COMMENT 'buff基础值',
  `lootUserData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '掠夺别的服务器用户数据 {服务器id:{用户id:[次数],....},...}',
  `breakTimeData` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '守卫击破时间数据{门口:时间}',
  `bakDate` datetime NULL DEFAULT NULL COMMENT '备份时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-国库备份信息(CoffersBakEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_coffers_group
-- ----------------------------
DROP TABLE IF EXISTS `uw_coffers_group`;
CREATE TABLE `uw_coffers_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `serverArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务器组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主-国库分组(CoffersGroupEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_copy_progress
-- ----------------------------
DROP TABLE IF EXISTS `uw_copy_progress`;
CREATE TABLE `uw_copy_progress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `copyType` int(2) NULL DEFAULT NULL COMMENT '副本类型',
  `pCopyId` int(11) NOT NULL COMMENT '主副本id',
  `winningStreak` int(4) NULL DEFAULT 0 COMMENT '连胜',
  `pTime` datetime NULL DEFAULT NULL COMMENT '主副本挑战时间',
  `copyObj` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '已通关子副本列表{子副本id:节点,子副本id:节点...}',
  `refreshTime` datetime NULL DEFAULT NULL COMMENT '最后一次通关子副本时间',
  `timeArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '子副本挑战时间列',
  `copyStar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '子副本星级',
  `finished` int(1) NULL DEFAULT 0 COMMENT '主副本是否已经通过',
  `isPickAward` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否领取通关奖励[0,0,1]',
  `isPickChests` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否领取通关宝箱[0,0,1]',
  `timesPerDay` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '子副本剩余次数',
  `resetCounts` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购买次数{id:次数,id:次数...}',
  `resetTime` datetime NULL DEFAULT NULL COMMENT '购买时间',
  `readObj` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '查看数据{副本id:是否阅读}',
  PRIMARY KEY (`id`, `userId`) USING BTREE,
  INDEX `uw_copy_progress_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272865 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '副本进度' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_copy_progress
-- ----------------------------
INSERT INTO `uw_copy_progress` VALUES (272849, 71006, 0, 0, 5, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272850, 71006, 1, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272851, 71006, 2, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272852, 71006, 3, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272853, 71315, 0, 0, 5, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272854, 71315, 1, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272855, 71315, 2, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272856, 71315, 3, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272857, 71316, 0, 0, 5, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272858, 71316, 1, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272859, 71316, 2, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272860, 71316, 3, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272861, 71317, 0, 0, 5, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272862, 71317, 1, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272863, 71317, 2, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');
INSERT INTO `uw_copy_progress` VALUES (272864, 71317, 3, 0, 0, NULL, '{}', NULL, '[]', '{}', 0, NULL, NULL, '{}', '{}', NULL, '{}');

-- ----------------------------
-- Table structure for uw_coupon
-- ----------------------------
DROP TABLE IF EXISTS `uw_coupon`;
CREATE TABLE `uw_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'åºå·',
  `userId` int(11) NULL DEFAULT NULL COMMENT 'ä½¿ç”¨ç”¨æˆ·id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'åç§°',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'æè¿°',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ç”Ÿæˆç ',
  `type` int(2) NULL DEFAULT 0 COMMENT 'ç±»åž‹',
  `startTime` datetime NULL DEFAULT NULL COMMENT 'ç”Ÿæ•ˆæ—¶é—´',
  `endTime` datetime NULL DEFAULT NULL COMMENT 'æˆªæ­¢æ—¶é—´',
  `items` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ç‰©å“',
  `channelId` int(11) NULL DEFAULT NULL COMMENT 'æ¸ é“å·',
  `isUsed` int(2) NULL DEFAULT 0 COMMENT 'æ˜¯å¦é¢†å–',
  `serverId` int(11) NULL DEFAULT 0,
  `accountId` int(11) NULL DEFAULT 0 COMMENT 'è´¦å·id',
  `channelIds` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '渠道组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_coupon_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'å…‘æ¢ç ' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_demon_lotus
-- ----------------------------
DROP TABLE IF EXISTS `uw_demon_lotus`;
CREATE TABLE `uw_demon_lotus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公会个人信息id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '妖莲等级',
  `addUpExpc` int(11) NULL DEFAULT 0 COMMENT '累计经验值',
  `lastOpeTime` datetime NULL DEFAULT NULL COMMENT '最后操作时间',
  `advanceLvl` int(4) NULL DEFAULT 0 COMMENT '进阶等级',
  `treasureLvl` int(4) NULL DEFAULT 0 COMMENT '宝物等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_demon_lotus_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聚灵妖莲' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_demon_lotus
-- ----------------------------
INSERT INTO `uw_demon_lotus` VALUES (5, 71006, 1, 0, '2016-10-24 04:09:16', 0, 0);

-- ----------------------------
-- Table structure for uw_expedition
-- ----------------------------
DROP TABLE IF EXISTS `uw_expedition`;
CREATE TABLE `uw_expedition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `stageId` int(7) NULL DEFAULT 0 COMMENT '关卡数',
  `fightCount` int(7) NULL DEFAULT 0 COMMENT '挑战次数',
  `soulCount` int(7) NULL DEFAULT 0 COMMENT '元婴召唤次数',
  `buyFightCount` int(7) NULL DEFAULT 0 COMMENT '购买挑战次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_expedition
-- ----------------------------
INSERT INTO `uw_expedition` VALUES (1, 68698, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for uw_expedition_hero
-- ----------------------------
DROP TABLE IF EXISTS `uw_expedition_hero`;
CREATE TABLE `uw_expedition_hero`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `tempId` int(6) NULL DEFAULT 0 COMMENT '模板id',
  `quality` int(4) NULL DEFAULT 0 COMMENT '品阶',
  `intensifyArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '强化[等级,等级,...] 下标对应装备位置',
  `starArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星级[星级,星级,...] 下标对应装备位置',
  `gemArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宝石[id,id,id,...]下标对应装备位置',
  `wingArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '翅膀[id,等级,星级,当前星经验,左翅强化等级,右翅强化等级]',
  `expc` int(7) NULL DEFAULT 0 COMMENT '经验',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级',
  `equipData` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '{\"部位\":物品id,....}',
  `skillLvlArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[技能1等级,技能2等级...]',
  `propArr` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终属性组[值,值]',
  `realmLvl` int(4) NULL DEFAULT 0 COMMENT '境界等级',
  `realmArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '境界符文组  [0,1,2,3,4,5]',
  `sex` int(4) NULL DEFAULT 1 COMMENT '性别 1:男 2:女',
  `combat` int(11) NULL DEFAULT 0 COMMENT '战斗力',
  `refineArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装备精炼[等级,等级,...] 下标对应装备位置',
  `starTopArr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升星突破[升星突破重数,升星突破重数,...] 下标对应装备位置',
  `talismanAdorn` int(7) NULL DEFAULT NULL COMMENT '法宝佩戴',
  `talismanData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '法宝数据{法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],....}',
  `talismanFg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法宝共鸣{共鸣id:[0,1],共鸣id:[1,0],...}',
  `wingSumLvl` int(7) NULL DEFAULT NULL COMMENT '翅膀等级*100+星数',
  `gemSumLvl` int(7) NULL DEFAULT NULL COMMENT '宝石总等级',
  `realmSumLvl` int(7) NULL DEFAULT NULL COMMENT '境界等级 * 100 + 已装备个数',
  `fightSort` int(4) NULL DEFAULT NULL COMMENT '出战顺序',
  `soulArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '{\"元婴id\":[物品id,剩余血量,今日是否有穿戴过]}',
  `wearSoulId` int(11) NULL DEFAULT NULL,
  `recordTime` datetime NULL DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_fivedays_rank
-- ----------------------------
DROP TABLE IF EXISTS `uw_fivedays_rank`;
CREATE TABLE `uw_fivedays_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconId` int(4) NULL DEFAULT NULL,
  `userLvl` int(11) NULL DEFAULT NULL,
  `pkWinCount` int(11) NULL DEFAULT NULL,
  `combat` int(11) NULL DEFAULT NULL,
  `rankType` int(11) NULL DEFAULT NULL,
  `rankValue` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_game_common
-- ----------------------------
DROP TABLE IF EXISTS `uw_game_common`;
CREATE TABLE `uw_game_common`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `highCopyId` int(11) NULL DEFAULT 0,
  `isOpenBoss` int(2) NULL DEFAULT 1 COMMENT '是否开放boss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-公用(GameCommonEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_game_common
-- ----------------------------
INSERT INTO `uw_game_common` VALUES (2, 331, 1);

-- ----------------------------
-- Table structure for uw_game_config
-- ----------------------------
DROP TABLE IF EXISTS `uw_game_config`;
CREATE TABLE `uw_game_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guildWarSign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[星期开始，星期结束，开始时间，结束时间]',
  `guildWarOpen` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[星期几，开始时间，结束时间]',
  `guildWarHost` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '玩家名',
  `guildWarPort` int(6) NULL DEFAULT 0 COMMENT '行会战服端口',
  `redisHostArr` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'redis主机端口列表',
  `noSignServerArr` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名排除的服务器列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主-游戏配置(GameConfigEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_game_config
-- ----------------------------
INSERT INTO `uw_game_config` VALUES (1, '[4,28,4,28,20,23]', '[5,11,1,24]', '218.93.206.99', 24005, '[\"222.187.222.187:6379\",\"218.93.206.99:6379\"]', '[1,5]');

-- ----------------------------
-- Table structure for uw_game_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_game_record`;
CREATE TABLE `uw_game_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `recordTime` datetime NULL DEFAULT NULL COMMENT '日期',
  `loginCount` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `copyCount` int(11) NULL DEFAULT NULL COMMENT '挑战副本次数',
  `wipeCount` int(11) NULL DEFAULT NULL COMMENT '刷野次数',
  `pkCount` int(11) NULL DEFAULT NULL COMMENT 'pk次数',
  `rechargeCount` int(11) NULL DEFAULT NULL COMMENT '充值次数',
  `rechargeSum` int(11) NULL DEFAULT NULL COMMENT '充值总金额',
  `rechargeRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '充值记录\n                        {\"id\":充值次数,\"id\":充值次数,.............}',
  `shopRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商店记录\n                        {\"id\":[今日购买次数,历史购买总次数],{\"id\":[今日购买次数,历史购买总次数],.............}',
  `costGoldRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消耗金币记录\n                        {\"id\":金币数量,\"id\":金币数量,.............}',
  `costDiamondRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消耗钻石记录\n                        {\"id\":钻石数量,\"id\":钻石数量,.............}',
  `costDiamondRecord1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消耗钻石记录1',
  `costDiamondRecord2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消耗钻石记录2',
  `getDiamondRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '获取钻石记录\n                        {\"id\":钻石数量,\"id\":钻石数量,.............}',
  `getDiamondRecord1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '获取钻石记录1',
  `getDiamondRecord2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '获取钻石记录2',
  `channelId` int(11) NULL DEFAULT NULL COMMENT '渠道号',
  `serverId` int(11) NULL DEFAULT NULL COMMENT '服务器id',
  `jjcPkCount` int(11) NULL DEFAULT NULL COMMENT '������pk����',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `game_record_userId_recordtime`(`userId`, `recordTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 410035 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户每日数据记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_game_record
-- ----------------------------
INSERT INTO `uw_game_record` VALUES (409969, 68624, '2016-07-13 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409970, 68625, '2016-10-03 00:00:00', 13, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409971, 68625, '2016-10-04 00:00:00', 38, 0, 0, 0, 0, 0, '{}', '{\"133\":[1,1],\"407\":[1,1],\"470\":[1,1],\"491\":[1,1],\"1044\":[1,1],\"1045\":[1,1],\"1704\":[1,1],\"1837\":[1,1]}', '{\"6\":12600}', '{\"8\":836}', '{\"16\":19}', NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409972, 68625, '2016-10-05 00:00:00', 101, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409973, 68625, '2014-07-01 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409974, 68625, '2016-10-06 00:00:00', 21, 1, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":10}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409975, 68625, '2016-10-08 00:00:00', 6, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409976, 68625, '2016-10-09 00:00:00', 4, 1, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":10}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409977, 68625, '2014-07-05 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409978, 68626, '2014-07-05 00:00:00', 7, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409979, 68627, '2014-07-05 00:00:00', 5, 27, 0, 0, 0, 0, '{}', '{}', '{\"4\":0}', '{\"12\":165,\"25\":800}', '{\"9\":30000}', NULL, '{\"7\":270,\"9\":138}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409980, 68628, '2014-07-05 00:00:00', 5, 33, 0, 0, 0, 0, '{}', '{\"14\":[2,2],\"422\":[1,1],\"999\":[1,1],\"1019\":[2,2],\"1059\":[1,1],\"1079\":[1,1],\"1119\":[1,1],\"1159\":[1,1],\"1179\":[3,3],\"1199\":[2,2],\"1219\":[1,1],\"1259\":[1,1],\"1279\":[2,2],\"1299\":[2,2],\"1339\":[2,2],\"1359\":[1,1],\"1419\":[1,1],\"1439\":[1,1],\"1499\":[1,1],\"1519\":[1,1],\"1539\":[2,2],\"1559\":[1,1],\"1579\":[1,1],\"1639\":[1,1],\"1659\":[1,1],\"1719\":[4,4],\"1759\":[1,1],\"1779\":[2,2],\"1799\":[1,1]}', '{\"2\":82900,\"4\":0,\"7\":74000}', '{\"8\":463380,\"12\":228095,\"29\":38900}', '{\"9\":30000}', NULL, '{\"7\":290,\"8\":18504,\"9\":118}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409981, 68629, '2014-07-05 00:00:00', 6, 1, 0, 4, 0, 0, '{}', '{}', '{\"2\":1040}', '{\"14\":15}', '{\"17\":10}', NULL, '{\"7\":10,\"9\":215}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409982, 68630, '2014-07-05 00:00:00', 2, 6, 0, 0, 0, 0, '{}', '{}', '{\"2\":5190}', '{}', NULL, NULL, '{\"7\":60,\"9\":175}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409983, 68631, '2014-07-05 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409984, 68632, '2014-07-05 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{\"2\":520}', '{}', NULL, NULL, '{\"9\":154}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409985, 68633, '2014-07-05 00:00:00', 1, 1, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":10}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409986, 68627, '2016-10-09 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409987, 68694, '2015-07-01 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409988, 68695, '2015-07-01 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409989, 68696, '2015-07-01 00:00:00', 2, 5, 0, 0, 0, 0, '{}', '{}', '{}', '{}', '{\"9\":30000}', NULL, '{\"7\":50}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409990, 68697, '2015-07-01 00:00:00', 2, 4, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":40}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409991, 68698, '2015-07-01 00:00:00', 3, 32, 0, 0, 0, 0, '{}', '{\"14\":[7,670],\"979\":[5,5],\"1039\":[2,2],\"1059\":[8,8],\"1079\":[2,2],\"1119\":[1,1],\"1179\":[2,2],\"1219\":[2,2],\"1259\":[2,2],\"1319\":[3,3],\"1339\":[2,2],\"1359\":[4,4],\"1379\":[1,1],\"1399\":[3,3],\"1439\":[1,1],\"1459\":[3,3],\"1499\":[2,2],\"1519\":[2,2],\"1539\":[2,2],\"1559\":[1,1],\"1579\":[2,2],\"1619\":[1,1],\"1659\":[2,2],\"1679\":[1,1],\"1699\":[1,1],\"1719\":[3,3],\"1759\":[1,1],\"1779\":[1,1]}', '{\"1\":10926900,\"2\":78520,\"4\":2580000,\"6\":74237600,\"7\":106000}', '{\"8\":667530,\"12\":683890,\"29\":349440}', '{\"9\":30000,\"17\":790}', NULL, '{\"7\":320,\"8\":14392}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409992, 68698, '2016-10-09 00:00:00', 10, 156, 0, 0, 0, 0, '{}', '{\"14\":[34,320082],\"19\":[8,296],\"1837\":[2,99],\"1838\":[2,153],\"1840\":[4,44],\"1841\":[3,185],\"1842\":[13,1879]}', '{\"2\":2152600,\"3\":5448000,\"7\":9000}', '{\"2\":2850,\"5\":7077888,\"8\":520722,\"29\":389755}', '{\"9\":239080,\"17\":690}', NULL, '{\"7\":1520,\"8\":43752}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409993, 70979, '2016-10-09 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409994, 70980, '2016-10-09 00:00:00', 2, 38, 0, 0, 0, 0, '{}', '{}', '{\"1\":53100,\"2\":2080}', '{}', NULL, NULL, '{\"7\":380}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409995, 68696, '2016-10-09 00:00:00', 1, 97, 0, 0, 0, 0, '{}', '{\"423\":[1,1],\"940\":[4,4],\"960\":[17,17],\"1039\":[1,1],\"1079\":[1,1],\"1159\":[1,1],\"1219\":[6,6],\"1279\":[6,6],\"1299\":[6,6],\"1319\":[4,4],\"1359\":[1,1],\"1379\":[1,1],\"1459\":[1,1],\"1559\":[1,1],\"1639\":[2,2],\"1699\":[6,6]}', '{\"1\":967900,\"2\":88580,\"4\":0,\"6\":681884900,\"7\":46000}', '{\"8\":191864,\"12\":684605,\"29\":4397800}', '{\"9\":800,\"17\":290}', NULL, '{\"7\":970,\"8\":2056}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409996, 70981, '2016-10-09 00:00:00', 12, 53, 0, 0, 0, 0, '{}', '{\"1361\":[1,1],\"1421\":[1,1],\"1801\":[1,1]}', '{\"1\":7200,\"2\":56640,\"4\":280000,\"6\":56250}', '{\"8\":24,\"12\":105}', '{\"16\":50}', NULL, '{\"7\":530}', '{\"1\":10}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409997, 70982, '2016-10-09 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409998, 70983, '2016-10-09 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{\"2\":520}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (409999, 70984, '2016-10-09 00:00:00', 1, 3, 0, 0, 0, 0, '{}', '{}', '{\"2\":520}', '{}', NULL, NULL, '{\"7\":30}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410000, 70985, '2016-10-09 00:00:00', 6, 88, 0, 1, 0, 0, '{}', '{\"12\":[1,1],\"18\":[1,1],\"19\":[1,1],\"962\":[1,1]}', '{\"1\":924200,\"2\":145670,\"3\":26000,\"4\":600000,\"7\":4000}', '{\"2\":50,\"4\":40,\"5\":36,\"8\":238,\"12\":35}', '{\"9\":350,\"10\":10}', NULL, '{\"7\":770}', '{\"1\":10,\"6\":105}', NULL, NULL, 1, 3);
INSERT INTO `uw_game_record` VALUES (410001, 70986, '2016-10-09 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410002, 70987, '2016-10-09 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410003, 70988, '2016-10-09 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410004, 68698, '2016-10-10 00:00:00', 5, 31, 0, 0, 0, 0, '{}', '{\"19\":[1,3]}', '{\"2\":103580,\"3\":26000}', '{\"2\":250,\"8\":120}', '{\"9\":285}', NULL, '{\"7\":310}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410005, 68696, '2016-10-10 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410006, 70980, '2016-10-10 00:00:00', 1, 3, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":30}', '{\"1\":10}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410007, 70981, '2016-10-10 00:00:00', 2, 86, 0, 0, 0, 0, '{}', '{\"7\":[3,4],\"1405\":[1,1],\"1685\":[1,1]}', '{\"1\":321600,\"2\":93300,\"4\":2000000}', '{\"2\":50,\"8\":468}', '{\"9\":400}', NULL, '{\"7\":840}', NULL, NULL, NULL, 1, 6);
INSERT INTO `uw_game_record` VALUES (410008, 70989, '2016-10-10 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410009, 68698, '2016-10-11 00:00:00', 2, 6, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":60}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410010, 70990, '2016-10-11 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410011, 68696, '2016-10-20 00:00:00', 2, 9, 0, 1, 0, 0, '{}', '{}', '{}', '{\"25\":2100}', '{\"9\":31600}', NULL, '{\"7\":90}', '{\"1\":10,\"6\":15}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410012, 68698, '2016-10-20 00:00:00', 4, 25, 0, 12, 0, 0, '{}', '{\"674\":[1,1],\"1339\":[1,1]}', '{\"1\":4191600,\"2\":62700}', '{\"8\":12130,\"14\":240,\"32\":1880,\"33\":90}', '{\"10\":5}', NULL, '{\"7\":250,\"9\":353}', NULL, NULL, NULL, 1, 2);
INSERT INTO `uw_game_record` VALUES (410013, 70991, '2016-10-20 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410014, 70992, '2016-10-20 00:00:00', 3, 5, 0, 0, 0, 0, '{}', '{}', '{\"7\":1000}', '{}', NULL, NULL, '{\"7\":50}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410015, 68696, '2016-10-21 00:00:00', 34, 48, 0, 1, 0, 0, '{}', '{}', '{\"2\":99710,\"3\":474000,\"7\":61000}', '{\"29\":699875,\"35\":331000}', '{\"9\":5094}', NULL, '{\"4\":1467,\"7\":480}', '{\"4\":1467}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410016, 68698, '2016-10-21 00:00:00', 3, 85, 0, 17, 0, 0, '{}', '{\"12\":[1,11],\"19\":[2,299]}', '{\"2\":209550,\"5\":17000}', '{\"8\":13610,\"14\":60,\"25\":100,\"32\":700}', '{\"9\":9882}', NULL, '{\"4\":53,\"7\":850,\"9\":26}', '{\"1\":10,\"4\":53,\"6\":90}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410017, 70992, '2016-10-21 00:00:00', 3, 5, 0, 1, 0, 0, '{}', '{\"131\":[1,1]}', '{\"4\":140000,\"6\":5600}', '{}', NULL, NULL, '{\"7\":50}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410018, 70993, '2016-10-21 00:00:00', 5, 131, 0, 10, 0, 0, '{}', '{\"12\":[1,1],\"1404\":[6,6]}', '{\"1\":1555800,\"2\":144910,\"3\":5000,\"4\":720000,\"6\":12600}', '{\"8\":150,\"12\":90}', '{\"9\":500,\"16\":6,\"17\":10}', NULL, '{\"7\":1280}', '{\"1\":10,\"6\":120}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410019, 70994, '2016-10-21 00:00:00', 5, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410020, 70995, '2016-10-21 00:00:00', 19, 63, 0, 4, 0, 0, '{}', '{\"88\":[1,1]}', '{\"1\":159300,\"2\":32600,\"4\":640000,\"6\":3750}', '{\"2\":50,\"12\":20}', '{\"15\":20}', NULL, '{\"7\":590,\"9\":301}', '{\"1\":10}', NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410021, 70996, '2016-10-21 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410022, 70997, '2016-10-21 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410023, 70998, '2016-10-21 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410024, 70999, '2016-10-21 00:00:00', 7, 83, 0, 9, 0, 0, '{}', '{\"46\":[1,1],\"67\":[1,1],\"983\":[1,1],\"1061\":[1,1],\"1321\":[1,1],\"1323\":[1,1],\"1361\":[1,1],\"1401\":[1,1],\"1809\":[1,1],\"1811\":[1,1]}', '{\"1\":997100,\"2\":125110,\"3\":18000,\"4\":0,\"6\":120000,\"7\":11000}', '{\"2\":50,\"8\":203,\"12\":395}', '{\"17\":30}', NULL, '{\"7\":680}', '{\"1\":10}', NULL, NULL, 1, 1);
INSERT INTO `uw_game_record` VALUES (410025, 71000, '2016-10-21 00:00:00', 4, 6, 0, 0, 0, 0, '{}', '{\"277\":[1,1],\"677\":[1,1],\"941\":[1,1],\"1781\":[1,1]}', '{\"6\":22500}', '{\"8\":22}', NULL, NULL, '{\"7\":60}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410026, 71001, '2016-10-21 00:00:00', 4, 4, 0, 0, 0, 0, '{}', '{}', '{\"2\":520}', '{}', NULL, NULL, '{\"7\":40}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410027, 71002, '2016-10-21 00:00:00', 2, 8, 0, 0, 0, 0, '{}', '{\"46\":[1,1]}', '{\"2\":520,\"4\":80000,\"6\":3750}', '{\"12\":40}', '{\"17\":10}', NULL, '{\"7\":80}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410028, 71003, '2016-10-21 00:00:00', 1, 1, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":10}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410029, 71004, '2016-10-21 00:00:00', 1, 2, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{\"7\":20}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410030, 71005, '2016-10-21 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410031, 71006, '2016-10-24 00:00:00', 3, 0, 0, 0, 0, 0, '{}', '{\"999\":[6,6],\"1059\":[6,6],\"1079\":[6,6],\"1339\":[6,6],\"1399\":[6,6],\"1719\":[6,6]}', '{\"4\":0,\"6\":192468100,\"7\":10000}', '{\"8\":87188,\"12\":227530,\"35\":9500}', '{\"17\":30}', NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410032, 71315, '2016-10-24 00:00:00', 2, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410033, 71316, '2018-06-02 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);
INSERT INTO `uw_game_record` VALUES (410034, 71317, '2019-01-10 00:00:00', 1, 0, 0, 0, 0, 0, '{}', '{}', '{}', '{}', NULL, NULL, '{}', NULL, NULL, NULL, 1, 0);

-- ----------------------------
-- Table structure for uw_guild
-- ----------------------------
DROP TABLE IF EXISTS `uw_guild`;
CREATE TABLE `uw_guild`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公会名称',
  `iconId` int(11) NULL DEFAULT NULL COMMENT '公会旗号id',
  `chairmanId` int(11) NULL DEFAULT NULL COMMENT '会长id',
  `viceChairmanId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副会长ids',
  `guildPopulation` int(11) NULL DEFAULT 1 COMMENT '公会人数',
  `addUpAct` int(8) NULL DEFAULT 0 COMMENT '累计贡献值',
  `joinCon` int(4) NULL DEFAULT 0 COMMENT '加入条件',
  `joinLvl` int(4) NULL DEFAULT 0 COMMENT '加入最低等级',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '公会等级',
  `notice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公会公告',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公会日志',
  `appliedMembers` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请入会人员',
  `numbersArr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每天能开除的会员数量',
  `lastExpelTime` datetime NULL DEFAULT NULL COMMENT '最后开除成员时间',
  `ennobleData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爵位数据 ',
  `guildCopyData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '{bossId:[进度,最后结算时间],bossId:[进度,最后结算时间],...}',
  `resetCount` int(4) NULL DEFAULT 0 COMMENT '副本重置次数',
  `resetTime` datetime NULL DEFAULT NULL COMMENT '副本重置时间',
  `lastLgTime` datetime NULL DEFAULT '2016-04-25 19:53:57',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_guild_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_guild_bak`;
CREATE TABLE `uw_guild_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `chairmanId` int(11) NULL DEFAULT NULL COMMENT '会长id',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '公会等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_guild_group
-- ----------------------------
DROP TABLE IF EXISTS `uw_guild_group`;
CREATE TABLE `uw_guild_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `serverArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务器组',
  `lastRankData` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '最后排行数据',
  `lastRankTime` datetime NULL DEFAULT NULL,
  `redisId` int(6) NULL DEFAULT 0 COMMENT '对应的redis序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主-行会战分组(GuildGroupEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_guild_group
-- ----------------------------
INSERT INTO `uw_guild_group` VALUES (1, '第一组', '[1,5,10]', NULL, NULL, 1);

-- ----------------------------
-- Table structure for uw_guild_personal
-- ----------------------------
DROP TABLE IF EXISTS `uw_guild_personal`;
CREATE TABLE `uw_guild_personal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公会个人信息id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `guildId` int(11) NULL DEFAULT 0 COMMENT '公会id',
  `position` int(4) NULL DEFAULT 0 COMMENT '职务',
  `viceTime` datetime NULL DEFAULT NULL COMMENT '被提升为副会长的时间',
  `todayAct` int(11) NULL DEFAULT 0 COMMENT '今天贡献值',
  `noticeCount` int(4) NULL DEFAULT 0 COMMENT '今天公告次数',
  `exitGuildCount` int(4) NULL DEFAULT 0 COMMENT '今天退会次数',
  `lotteryCount` int(4) NULL DEFAULT 0 COMMENT '今日抽奖次数',
  `actLastTime` datetime NULL DEFAULT NULL COMMENT '贡献上一次刷新时间',
  `addUpAct` int(11) NULL DEFAULT 0 COMMENT '累计贡献值',
  `outMsg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退会信息',
  `appliedMsg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请信息',
  `actData` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '格式:{\"贡献id\":[次数]}',
  `guildAct` int(11) NULL DEFAULT 0 COMMENT '当前公会贡献',
  `lastQuipGuildTime` datetime NULL DEFAULT NULL COMMENT '最后退会时间',
  `ennoble` int(4) NULL DEFAULT 0 COMMENT '爵位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_guild_personal_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21638 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公会个人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_guild_personal
-- ----------------------------
INSERT INTO `uw_guild_personal` VALUES (21634, 71006, 0, 0, NULL, 0, 0, 0, 0, '2016-10-24 04:07:07', 0, '[]', NULL, NULL, 0, NULL, 1);
INSERT INTO `uw_guild_personal` VALUES (21635, 71315, 0, 0, NULL, 0, 0, 0, 0, '2016-10-24 16:04:12', 0, '[]', NULL, NULL, 0, NULL, 1);
INSERT INTO `uw_guild_personal` VALUES (21636, 71316, 0, 0, NULL, 0, 0, 0, 0, '2018-06-02 18:02:42', 0, '[]', NULL, NULL, 0, NULL, 1);
INSERT INTO `uw_guild_personal` VALUES (21637, 71317, 0, 0, NULL, 0, 0, 0, 0, '2019-01-10 20:41:49', 0, '[]', NULL, NULL, 0, NULL, 1);

-- ----------------------------
-- Table structure for uw_guild_war_sign
-- ----------------------------
DROP TABLE IF EXISTS `uw_guild_war_sign`;
CREATE TABLE `uw_guild_war_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverId` int(11) NULL DEFAULT 0 COMMENT 'æœåŠ¡å™¨id',
  `guildId` int(11) NULL DEFAULT 0 COMMENT 'è¡Œä¼šid',
  `signTime` datetime NULL DEFAULT NULL COMMENT 'æŠ¥åæ—¶é—´',
  `groupId` int(4) NULL DEFAULT 0 COMMENT 'æŠ¥åç»„åˆ«',
  `signUserId` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_guild_war_sign_serverid`(`serverId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ä¸»-è¡Œä¼šæˆ˜æŠ¥å(GuildWarSignEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_guildwar_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_guildwar_record`;
CREATE TABLE `uw_guildwar_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `recordData` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '记录数据',
  `recordTime` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `lastRankData` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结束排名数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-行会战记录(GuildWarRecord)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_heart_stunt
-- ----------------------------
DROP TABLE IF EXISTS `uw_heart_stunt`;
CREATE TABLE `uw_heart_stunt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公会个人信息id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `stateArr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '境界数据\n            境界槽位对应选择的心法[心法id,心法id,...]',
  `heartLvlArr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心法等级数据\n            境界槽位下标对应心法的等级[lvl,lvl,...]',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_heart_stunt_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '心法神功' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_hero
-- ----------------------------
DROP TABLE IF EXISTS `uw_hero`;
CREATE TABLE `uw_hero`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `tempId` int(6) NULL DEFAULT 0 COMMENT '模板id',
  `quality` int(4) NULL DEFAULT 0 COMMENT '品阶',
  `intensifyArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '强化[等级,等级,...] 下标对应装备位置',
  `starArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星级[星级,星级,...] 下标对应装备位置',
  `gemArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宝石[id,id,id,...]下标对应装备位置',
  `wingArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '翅膀[id,等级,星级,当前星经验]',
  `expc` int(7) NULL DEFAULT 0 COMMENT '经验',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级',
  `equipData` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '{\"部位\":物品id,....}',
  `skillLvlArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[技能1等级,技能2等级...]',
  `propArr` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性组',
  `realmLvl` int(4) NULL DEFAULT 0 COMMENT '境界等级',
  `realmArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '境界符文组',
  `sex` int(4) NULL DEFAULT 1 COMMENT '性别',
  `combat` int(11) NULL DEFAULT 0 COMMENT '战斗力',
  `refineArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装备精炼',
  `starTopArr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升星突破',
  `talismanAdorn` int(7) NULL DEFAULT NULL COMMENT '法宝佩戴',
  `talismanData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '法宝数据{法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],法宝id:[等级,资质,星级,最高星级,{星级:技能id,星级:技能id,...},临时资质],....}',
  `talismanFg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法宝共鸣{共鸣id:[0,1],共鸣id:[1,0],...}',
  `wingSumLvl` int(7) NULL DEFAULT 0,
  `gemSumLvl` int(7) NULL DEFAULT 0,
  `realmSumLvl` int(7) NULL DEFAULT 0,
  `fightSort` int(4) NULL DEFAULT 0 COMMENT '出战顺序',
  `soulArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '{\"元婴id\":[物品id,剩余血量,今日是否有穿戴过,是否在穿戴]}',
  `wearSoulId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_hero_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115232 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '英雄' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_hero
-- ----------------------------
INSERT INTO `uw_hero` VALUES (114918, 71006, 1, 0, '[]', '[]', '[]', '[252,23,10,0]', 0, 0, '{\"0\":6,\"1\":30,\"2\":12,\"3\":24,\"8\":10,\"9\":18,\"10\":22,\"11\":26}', '[]', '[0,654340,0,168439,0,57177,0,57177,0,220791,0,48989,0,73555,0,245332,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4140968,1036703,396489,365614,1450515,322776,372340,1244409,0,150,500,0,0,0]', 0, '[]', 1, 2434926, NULL, NULL, NULL, NULL, NULL, 2310, NULL, NULL, 0, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114919, 71006, 2, 0, '[]', '[]', '[]', '[]', 0, 0, '{}', '[]', '[0,654340,0,168439,0,57177,0,57177,0,220791,0,48989,0,73555,0,245332,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3242113,834826,283672,283672,1094177,243118,364712,1215801,0,150,500,0,0,0]', 0, '[]', 1, 2032445, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114920, 71006, 3, 0, '[]', '[]', '[]', '[]', 0, 0, '{}', '[]', '[0,654340,0,168439,0,57177,0,57177,0,220791,0,48989,0,73555,0,245332,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3242113,834826,283672,283672,1094177,243118,364712,1215801,0,150,500,0,0,0]', 0, '[]', 1, 2032485, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114921, 71007, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114922, 71008, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114923, 71009, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114924, 71010, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114925, 71011, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114926, 71012, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114927, 71013, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114928, 71014, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114929, 71015, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114930, 71016, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114931, 71017, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114932, 71018, 2, 0, '[]', '[]', '[]', '[]', 0, 3, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114933, 71019, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114934, 71020, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114935, 71021, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114936, 71022, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114937, 71023, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114938, 71024, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114939, 71025, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114940, 71026, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114941, 71027, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114942, 71028, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114943, 71029, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114944, 71030, 3, 0, '[]', '[]', '[]', '[]', 0, 5, '{}', '[]', '[0,279,0,69,0,23,0,23,0,90,0,20,0,30,0,100,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114945, 71031, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114946, 71032, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114947, 71033, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114948, 71034, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114949, 71035, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114950, 71036, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114951, 71037, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114952, 71038, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114953, 71039, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114954, 71040, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114955, 71041, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114956, 71042, 1, 0, '[]', '[]', '[]', '[]', 0, 4, '{}', '[]', '[0,313,0,78,0,26,0,26,0,102,0,22,0,33,0,113,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114957, 71043, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114958, 71044, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114959, 71045, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114960, 71046, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114961, 71047, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114962, 71048, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114963, 71049, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114964, 71050, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114965, 71051, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114966, 71052, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114967, 71053, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114968, 71054, 2, 0, '[]', '[]', '[]', '[]', 0, 6, '{}', '[]', '[0,390,0,96,0,33,0,33,0,127,0,28,0,42,0,141,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114969, 71055, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114970, 71056, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114971, 71057, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114972, 71058, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114973, 71059, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114974, 71060, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114975, 71061, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114976, 71062, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114977, 71063, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114978, 71064, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114979, 71065, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114980, 71066, 3, 0, '[]', '[]', '[]', '[]', 0, 8, '{}', '[]', '[0,477,0,119,0,39,0,39,0,155,0,34,0,51,0,172,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114981, 71067, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114982, 71068, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114983, 71069, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114984, 71070, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114985, 71071, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114986, 71072, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114987, 71073, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114988, 71074, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114989, 71075, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114990, 71076, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114991, 71077, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114992, 71078, 2, 0, '[]', '[]', '[]', '[]', 0, 7, '{}', '[]', '[0,432,0,107,0,36,0,36,0,140,0,31,0,47,0,156,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114993, 71079, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114994, 71080, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114995, 71081, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114996, 71082, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114997, 71083, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114998, 71084, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (114999, 71085, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115000, 71086, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115001, 71087, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115002, 71088, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115003, 71089, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115004, 71090, 3, 0, '[]', '[]', '[]', '[]', 0, 9, '{}', '[]', '[0,525,0,130,0,44,0,44,0,171,0,37,0,56,0,189,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115005, 71091, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115006, 71092, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115007, 71093, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115008, 71094, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115009, 71095, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115010, 71096, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115011, 71097, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115012, 71098, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115013, 71099, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115014, 71100, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115015, 71101, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115016, 71102, 2, 0, '[]', '[]', '[]', '[]', 0, 10, '{}', '[]', '[0,576,0,143,0,48,0,48,0,187,0,41,0,62,0,208,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115017, 71103, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115018, 71104, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115019, 71105, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115020, 71106, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115021, 71107, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115022, 71108, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115023, 71109, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115024, 71110, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115025, 71111, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115026, 71112, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115027, 71113, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115028, 71114, 2, 0, '[]', '[]', '[]', '[]', 0, 12, '{}', '[]', '[0,687,0,171,0,57,0,57,0,223,0,49,0,74,0,248,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115029, 71115, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115030, 71116, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115031, 71117, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115032, 71118, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115033, 71119, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115034, 71120, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115035, 71121, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115036, 71122, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115037, 71123, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115038, 71124, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115039, 71125, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115040, 71126, 1, 0, '[]', '[]', '[]', '[]', 0, 13, '{}', '[]', '[0,748,0,185,0,62,0,62,0,243,0,53,0,81,0,270,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115041, 71127, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115042, 71128, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115043, 71129, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115044, 71130, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115045, 71131, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115046, 71132, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115047, 71133, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115048, 71134, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115049, 71135, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115050, 71136, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115051, 71137, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115052, 71138, 3, 0, '[]', '[]', '[]', '[]', 0, 11, '{}', '[]', '[0,630,0,156,0,53,0,53,0,205,0,46,0,68,0,228,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115053, 71139, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115054, 71140, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115055, 71141, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115056, 71142, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115057, 71143, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115058, 71144, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115059, 71145, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115060, 71146, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115061, 71147, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115062, 71148, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115063, 71149, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115064, 71150, 1, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115065, 71151, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115066, 71152, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115067, 71153, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115068, 71154, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115069, 71155, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115070, 71156, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115071, 71157, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115072, 71158, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115073, 71159, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115074, 71160, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115075, 71161, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115076, 71162, 2, 0, '[]', '[]', '[]', '[]', 0, 14, '{}', '[]', '[0,811,0,201,0,69,0,69,0,264,0,58,0,88,0,293,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115077, 71163, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115078, 71164, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115079, 71165, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115080, 71166, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115081, 71167, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115082, 71168, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115083, 71169, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115084, 71170, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115085, 71171, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115086, 71172, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115087, 71173, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115088, 71174, 1, 0, '[]', '[]', '[]', '[]', 0, 15, '{}', '[]', '[0,880,0,218,0,74,0,74,0,286,0,63,0,96,0,318,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115089, 71175, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115090, 71176, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115091, 71177, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115092, 71178, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115093, 71179, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115094, 71180, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115095, 71181, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115096, 71182, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115097, 71183, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115098, 71184, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115099, 71185, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115100, 71186, 1, 0, '[]', '[]', '[]', '[]', 0, 17, '{}', '[]', '[0,1029,0,256,0,87,0,87,0,335,0,74,0,111,0,371,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115101, 71187, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115102, 71188, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115103, 71189, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115104, 71190, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115105, 71191, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115106, 71192, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115107, 71193, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115108, 71194, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115109, 71195, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115110, 71196, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115111, 71197, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115112, 71198, 1, 0, '[]', '[]', '[]', '[]', 0, 16, '{}', '[]', '[0,952,0,236,0,80,0,80,0,310,0,68,0,103,0,345,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115113, 71199, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115114, 71200, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115115, 71201, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115116, 71202, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115117, 71203, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115118, 71204, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115119, 71205, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115120, 71206, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115121, 71207, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115122, 71208, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115123, 71209, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115124, 71210, 2, 0, '[]', '[]', '[]', '[]', 0, 18, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115125, 71211, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115126, 71212, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115127, 71213, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115128, 71214, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115129, 71215, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115130, 71216, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115131, 71217, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115132, 71218, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115133, 71219, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115134, 71220, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115135, 71221, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115136, 71222, 1, 0, '[]', '[]', '[]', '[]', 0, 21, '{}', '[]', '[0,1383,0,343,0,117,0,117,0,450,0,100,0,150,0,499,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115137, 71223, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115138, 71224, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115139, 71225, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115140, 71226, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115141, 71227, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115142, 71228, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115143, 71229, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115144, 71230, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115145, 71231, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115146, 71232, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115147, 71233, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115148, 71234, 3, 0, '[]', '[]', '[]', '[]', 0, 19, '{}', '[]', '[0,1195,0,296,0,100,0,100,0,389,0,86,0,130,0,432,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115149, 71235, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115150, 71236, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115151, 71237, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115152, 71238, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115153, 71239, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115154, 71240, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115155, 71241, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115156, 71242, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115157, 71243, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115158, 71244, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115159, 71245, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115160, 71246, 2, 0, '[]', '[]', '[]', '[]', 0, 20, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115161, 71247, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115162, 71248, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115163, 71249, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115164, 71250, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115165, 71251, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115166, 71252, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115167, 71253, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115168, 71254, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115169, 71255, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115170, 71256, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115171, 71257, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115172, 71258, 2, 0, '[]', '[]', '[]', '[]', 0, 22, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115173, 71259, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115174, 71260, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115175, 71261, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115176, 71262, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115177, 71263, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115178, 71264, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115179, 71265, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115180, 71266, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115181, 71267, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115182, 71268, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115183, 71269, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115184, 71270, 3, 0, '[]', '[]', '[]', '[]', 0, 23, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115185, 71271, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115186, 71272, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115187, 71273, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115188, 71274, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115189, 71275, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115190, 71276, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115191, 71277, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115192, 71278, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115193, 71279, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115194, 71280, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115195, 71281, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115196, 71282, 2, 0, '[]', '[]', '[]', '[]', 0, 25, '{}', '[]', '[0,1592,0,395,0,134,0,134,0,518,0,115,0,172,0,574,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115197, 71283, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115198, 71284, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115199, 71285, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115200, 71286, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115201, 71287, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115202, 71288, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115203, 71289, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115204, 71290, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115205, 71291, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115206, 71292, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115207, 71293, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115208, 71294, 2, 0, '[]', '[]', '[]', '[]', 0, 24, '{}', '[]', '[0,1704,0,422,0,143,0,143,0,554,0,123,0,184,0,615,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115209, 71295, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115210, 71296, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115211, 71297, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115212, 71298, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115213, 71299, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115214, 71300, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115215, 71301, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115216, 71302, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115217, 71303, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115218, 71304, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115219, 71305, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115220, 71306, 3, 0, '[]', '[]', '[]', '[]', 0, 26, '{}', '[]', '[0,1951,0,484,0,164,0,164,0,635,0,141,0,211,0,705,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115221, 71307, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115222, 71308, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115223, 71309, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115224, 71310, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115225, 71311, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115226, 71312, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115227, 71313, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115228, 71314, 2, 0, '[]', '[]', '[]', '[]', 0, 27, '{}', '[]', '[0,2084,0,516,0,176,0,176,0,678,0,151,0,226,0,752,0,0,0,150,0,500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', 0, '[]', 1, 1100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115229, 71315, 2, 0, '[]', '[]', '[]', '[]', 0, 0, '{}', '[]', '[0,463,0,119,0,40,0,40,0,156,0,34,0,52,0,173,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150,500,0,0,0]', 0, '[]', 1, 247, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115230, 71316, 2, 0, '[]', '[]', '[]', '[]', 0, 0, '{\"1\":95}', '[]', '[0,623,0,160,0,54,0,54,0,210,0,46,0,70,0,233,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,76,0,396,11,0,0,0,0,0,150,500,0,0,0]', 0, '[]', 0, 638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `uw_hero` VALUES (115231, 71317, 1, 0, '[]', '[]', '[]', '[]', 0, 0, '{\"0\":5}', '[]', '[0,537,0,138,0,47,0,47,0,181,0,40,0,60,0,201,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,75,814,0,11,0,0,0,0,0,150,500,0,0,0]', 0, '[]', 1, 512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for uw_hero_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_hero_bak`;
CREATE TABLE `uw_hero_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `wingArr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '翅膀[id,等级,星级,当前星经验]',
  `wingSumLvl` int(7) NULL DEFAULT 0,
  `gemSumLvl` int(7) NULL DEFAULT 0,
  `realmSumLvl` int(7) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_hero_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '英雄' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_incognito
-- ----------------------------
DROP TABLE IF EXISTS `uw_incognito`;
CREATE TABLE `uw_incognito`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `openTime` datetime NULL DEFAULT NULL COMMENT '开启时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-隐姓埋名玩家列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_loot_config
-- ----------------------------
DROP TABLE IF EXISTS `uw_loot_config`;
CREATE TABLE `uw_loot_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `lootTypeArr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊掉落的物品类型',
  `notServerArr` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排除的服务器组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主-掉落配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_lottery
-- ----------------------------
DROP TABLE IF EXISTS `uw_lottery`;
CREATE TABLE `uw_lottery`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `treasureValue` int(4) NULL DEFAULT 0 COMMENT '探宝值',
  `treasureChestCount` int(4) NULL DEFAULT 0 COMMENT '探宝宝箱领取次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抽奖' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_mail
-- ----------------------------
DROP TABLE IF EXISTS `uw_mail`;
CREATE TABLE `uw_mail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `type` int(4) NULL DEFAULT NULL COMMENT '类型',
  `fromName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `replaceArgs` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '替换值',
  `items` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附件物品',
  `isPicked` int(2) NULL DEFAULT 0 COMMENT '是否提取物品',
  `isRead` int(2) NULL DEFAULT 0 COMMENT '是否阅读',
  `delHours` int(6) NULL DEFAULT NULL COMMENT '操作后几小时删除',
  `delTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `expireTime` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `addTime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `isDelete` int(2) NULL DEFAULT 0,
  `taskId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_mail_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_mining
-- ----------------------------
DROP TABLE IF EXISTS `uw_mining`;
CREATE TABLE `uw_mining`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openTime` datetime NULL DEFAULT NULL COMMENT '开启时间',
  `resourceData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '矿洞资源数据{类型:[矿洞id,剩余资源,[userId,userId,...]],类型:[矿洞id,剩余资源,[userId,userId,...]],...}',
  `mineRecord` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '//开采记录[[时间,userId,玩家名,行会名,{道具id:数量,道具id:数量}],[时间,userId,玩家名,行会名,{道具id:数量,道具id:数量}],......]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '矿洞' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_mining_personal
-- ----------------------------
DROP TABLE IF EXISTS `uw_mining_personal`;
CREATE TABLE `uw_mining_personal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公会个人信息id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `miningType` int(4) NULL DEFAULT 0 COMMENT '当前所在矿洞',
  `miningTime` datetime NULL DEFAULT NULL COMMENT '挖矿时间',
  `lastTierChangeTime` datetime NULL DEFAULT NULL COMMENT '最后层数变动时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_mining_personal_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '矿洞个人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_newfourdays_rank
-- ----------------------------
DROP TABLE IF EXISTS `uw_newfourdays_rank`;
CREATE TABLE `uw_newfourdays_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconId` int(4) NULL DEFAULT NULL,
  `userLvl` int(11) NULL DEFAULT NULL,
  `pkWinCount` int(11) NULL DEFAULT NULL,
  `combat` int(11) NULL DEFAULT NULL,
  `rankType` int(11) NULL DEFAULT NULL,
  `rankValue` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_five_rank_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新四日目标历史排行榜' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_notice
-- ----------------------------
DROP TABLE IF EXISTS `uw_notice`;
CREATE TABLE `uw_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `serverIdArr` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务器id组,[]长度为0时为全服',
  `isOpen` int(2) NULL DEFAULT 0 COMMENT '是否开启,0：不开启，1：开启',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `iconType` int(2) NULL DEFAULT 0 COMMENT 'icon类型',
  `noticeTime` datetime NULL DEFAULT NULL COMMENT '公告时间',
  `startTime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `sort` int(6) NULL DEFAULT 0 COMMENT '排序',
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告额外信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_notice
-- ----------------------------
INSERT INTO `uw_notice` VALUES (8, '龙门工作室-www.lmsypt.com-QQ479484001   by：龙门工作室', '龙门工作室-www.lmsypt.com-QQ479484001   by龙门工作室', '[]', 1, '2016-02-20 10:37:38', 3, '2016-02-20 10:37:34', NULL, NULL, 10, NULL);
INSERT INTO `uw_notice` VALUES (9, '活动公告', '龙门工作室-www.lmsypt.com-QQ479484001   by：龙门工作室', '[]', 1, '2016-02-20 10:37:38', 2, '2016-02-20 10:37:34', NULL, NULL, 40, NULL);
INSERT INTO `uw_notice` VALUES (10, '龙门工作室-www.lmsypt.com-QQ479484001   by：龙门工作室', '龙门工作室-www.lmsypt.com-QQ479484001   by：龙门工作室', '[]', 1, '2016-02-20 10:37:38', 4, '2016-02-20 10:37:34', NULL, NULL, 30, NULL);
INSERT INTO `uw_notice` VALUES (11, '', '', '[]', 1, '2016-02-20 10:37:38', 4, '2016-02-20 10:37:34', NULL, NULL, 40, NULL);
INSERT INTO `uw_notice` VALUES (12, '', '', '[]', 1, '2016-02-20 10:37:38', 4, '2016-02-20 10:37:34', NULL, NULL, 50, NULL);
INSERT INTO `uw_notice` VALUES (13, '', '', '[]', 1, '2016-03-31 17:40:07', 4, '2016-02-20 10:37:34', NULL, NULL, 60, '');

-- ----------------------------
-- Table structure for uw_pkout
-- ----------------------------
DROP TABLE IF EXISTS `uw_pkout`;
CREATE TABLE `uw_pkout`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `enemyIds` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对手组',
  `exEnemyId` int(11) NULL DEFAULT 0 COMMENT '额外的对手',
  `freshTime` datetime NULL DEFAULT NULL COMMENT '上一次刷新对手时间',
  `pkValue` int(6) NULL DEFAULT 0 COMMENT 'pk值',
  `highPkValue` int(6) NULL DEFAULT 0 COMMENT '历史最高pk值',
  `killValue` int(6) NULL DEFAULT 0 COMMENT '杀戮值',
  `pkValueTime` datetime NULL DEFAULT NULL COMMENT 'pk值结算时间',
  `enemyTypes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '敌人类型',
  `todayRefreshNum` int(6) NULL DEFAULT 0 COMMENT '每日刷新对手次数',
  `todayRefreshTime` datetime NULL DEFAULT NULL COMMENT '最近每日刷新时间',
  `winCount` int(6) NULL DEFAULT 0 COMMENT '连胜次数',
  `highWinCount` int(6) NULL DEFAULT 0 COMMENT '历史最高连胜次数',
  `accWinCount` int(6) NULL DEFAULT 0 COMMENT '累计胜利次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_pkOut_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61605 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-野外pk' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_pkout
-- ----------------------------
INSERT INTO `uw_pkout` VALUES (61296, 71006, '[]', 0, '2016-10-24 04:09:14', 0, 0, 0, '2016-10-24 04:09:17', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61297, 71007, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61298, 71008, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61299, 71009, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61300, 71010, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61301, 71011, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61302, 71012, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61303, 71013, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61304, 71014, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61305, 71015, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61306, 71016, '[]', 0, '2016-10-24 15:59:26', 19, 19, 209, '2016-10-24 15:59:26', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61307, 71017, '[]', 0, '2016-10-24 15:59:27', 19, 19, 209, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61308, 71018, '[]', 0, '2016-10-24 15:59:27', 19, 19, 209, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61309, 71019, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61310, 71020, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61311, 71021, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61312, 71022, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61313, 71023, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61314, 71024, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61315, 71025, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61316, 71026, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61317, 71027, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61318, 71028, '[]', 0, '2016-10-24 15:59:27', 8, 8, 96, '2016-10-24 15:59:27', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61319, 71029, '[]', 0, '2016-10-24 15:59:28', 8, 8, 96, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61320, 71030, '[]', 0, '2016-10-24 15:59:28', 8, 8, 96, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61321, 71031, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61322, 71032, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61323, 71033, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61324, 71034, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61325, 71035, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61326, 71036, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61327, 71037, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61328, 71038, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61329, 71039, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61330, 71040, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61331, 71041, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61332, 71042, '[]', 0, '2016-10-24 15:59:28', 11, 11, 132, '2016-10-24 15:59:28', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61333, 71043, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61334, 71044, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61335, 71045, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61336, 71046, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61337, 71047, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61338, 71048, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61339, 71049, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61340, 71050, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61341, 71051, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61342, 71052, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61343, 71053, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61344, 71054, '[]', 0, '2016-10-24 15:59:29', 14, 14, 168, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61345, 71055, '[]', 0, '2016-10-24 15:59:29', 21, 21, 273, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61346, 71056, '[]', 0, '2016-10-24 15:59:29', 21, 21, 273, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61347, 71057, '[]', 0, '2016-10-24 15:59:29', 21, 21, 273, '2016-10-24 15:59:29', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61348, 71058, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61349, 71059, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61350, 71060, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61351, 71061, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61352, 71062, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61353, 71063, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61354, 71064, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61355, 71065, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61356, 71066, '[]', 0, '2016-10-24 15:59:30', 21, 21, 273, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61357, 71067, '[]', 0, '2016-10-24 15:59:30', 16, 16, 176, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61358, 71068, '[]', 0, '2016-10-24 15:59:30', 16, 16, 176, '2016-10-24 15:59:30', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61359, 71069, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61360, 71070, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61361, 71071, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61362, 71072, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61363, 71073, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61364, 71074, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61365, 71075, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61366, 71076, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61367, 71077, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61368, 71078, '[]', 0, '2016-10-24 15:59:31', 16, 16, 176, '2016-10-24 15:59:31', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61369, 71079, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61370, 71080, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61371, 71081, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61372, 71082, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61373, 71083, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61374, 71084, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61375, 71085, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61376, 71086, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61377, 71087, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61378, 71088, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61379, 71089, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61380, 71090, '[]', 0, '2016-10-24 15:59:32', 9, 9, 99, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61381, 71091, '[]', 0, '2016-10-24 15:59:32', 12, 12, 132, '2016-10-24 15:59:32', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61382, 71092, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61383, 71093, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61384, 71094, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61385, 71095, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61386, 71096, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61387, 71097, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61388, 71098, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61389, 71099, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61390, 71100, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61391, 71101, '[]', 0, '2016-10-24 15:59:33', 12, 12, 132, '2016-10-24 15:59:33', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61392, 71102, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61393, 71103, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61394, 71104, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61395, 71105, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61396, 71106, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61397, 71107, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61398, 71108, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61399, 71109, '[]', 0, '2016-10-24 15:59:34', 12, 12, 132, '2016-10-24 15:59:34', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61400, 71110, '[]', 0, '2016-10-24 15:59:35', 12, 12, 132, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61401, 71111, '[]', 0, '2016-10-24 15:59:35', 12, 12, 132, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61402, 71112, '[]', 0, '2016-10-24 15:59:35', 12, 12, 132, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61403, 71113, '[]', 0, '2016-10-24 15:59:35', 12, 12, 132, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61404, 71114, '[]', 0, '2016-10-24 15:59:35', 12, 12, 132, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61405, 71115, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61406, 71116, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61407, 71117, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61408, 71118, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61409, 71119, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61410, 71120, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61411, 71121, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61412, 71122, '[]', 0, '2016-10-24 15:59:35', 16, 16, 176, '2016-10-24 15:59:35', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61413, 71123, '[]', 0, '2016-10-24 15:59:36', 16, 16, 176, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61414, 71124, '[]', 0, '2016-10-24 15:59:36', 16, 16, 176, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61415, 71125, '[]', 0, '2016-10-24 15:59:36', 16, 16, 176, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61416, 71126, '[]', 0, '2016-10-24 15:59:36', 16, 16, 176, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61417, 71127, '[]', 0, '2016-10-24 15:59:36', 16, 16, 192, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61418, 71128, '[]', 0, '2016-10-24 15:59:36', 16, 16, 192, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61419, 71129, '[]', 0, '2016-10-24 15:59:36', 16, 16, 192, '2016-10-24 15:59:36', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61420, 71130, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61421, 71131, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61422, 71132, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61423, 71133, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61424, 71134, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61425, 71135, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61426, 71136, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61427, 71137, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61428, 71138, '[]', 0, '2016-10-24 15:59:37', 16, 16, 192, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61429, 71139, '[]', 0, '2016-10-24 15:59:37', 15, 15, 180, '2016-10-24 15:59:37', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61430, 71140, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61431, 71141, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61432, 71142, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61433, 71143, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61434, 71144, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61435, 71145, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61436, 71146, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61437, 71147, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61438, 71148, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61439, 71149, '[]', 0, '2016-10-24 15:59:38', 15, 15, 180, '2016-10-24 15:59:38', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61440, 71150, '[]', 0, '2016-10-24 15:59:39', 15, 15, 180, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61441, 71151, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61442, 71152, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61443, 71153, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61444, 71154, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61445, 71155, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61446, 71156, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61447, 71157, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61448, 71158, '[]', 0, '2016-10-24 15:59:39', 21, 21, 252, '2016-10-24 15:59:39', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61449, 71159, '[]', 0, '2016-10-24 15:59:40', 21, 21, 252, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61450, 71160, '[]', 0, '2016-10-24 15:59:40', 21, 21, 252, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61451, 71161, '[]', 0, '2016-10-24 15:59:40', 21, 21, 252, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61452, 71162, '[]', 0, '2016-10-24 15:59:40', 21, 21, 252, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61453, 71163, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61454, 71164, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61455, 71165, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61456, 71166, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61457, 71167, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61458, 71168, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61459, 71169, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61460, 71170, '[]', 0, '2016-10-24 15:59:40', 8, 8, 88, '2016-10-24 15:59:40', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61461, 71171, '[]', 0, '2016-10-24 15:59:41', 8, 8, 88, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61462, 71172, '[]', 0, '2016-10-24 15:59:41', 8, 8, 88, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61463, 71173, '[]', 0, '2016-10-24 15:59:41', 8, 8, 88, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61464, 71174, '[]', 0, '2016-10-24 15:59:41', 8, 8, 88, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61465, 71175, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61466, 71176, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61467, 71177, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61468, 71178, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61469, 71179, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61470, 71180, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61471, 71181, '[]', 0, '2016-10-24 15:59:41', 18, 18, 216, '2016-10-24 15:59:41', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61472, 71182, '[]', 0, '2016-10-24 15:59:42', 18, 18, 216, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61473, 71183, '[]', 0, '2016-10-24 15:59:42', 18, 18, 216, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61474, 71184, '[]', 0, '2016-10-24 15:59:42', 18, 18, 216, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61475, 71185, '[]', 0, '2016-10-24 15:59:42', 18, 18, 216, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61476, 71186, '[]', 0, '2016-10-24 15:59:42', 18, 18, 216, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61477, 71187, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61478, 71188, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61479, 71189, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61480, 71190, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61481, 71191, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61482, 71192, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61483, 71193, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61484, 71194, '[]', 0, '2016-10-24 15:59:42', 21, 21, 273, '2016-10-24 15:59:42', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61485, 71195, '[]', 0, '2016-10-24 15:59:43', 21, 21, 273, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61486, 71196, '[]', 0, '2016-10-24 15:59:43', 21, 21, 273, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61487, 71197, '[]', 0, '2016-10-24 15:59:43', 21, 21, 273, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61488, 71198, '[]', 0, '2016-10-24 15:59:43', 21, 21, 273, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61489, 71199, '[]', 0, '2016-10-24 15:59:43', 24, 24, 312, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61490, 71200, '[]', 0, '2016-10-24 15:59:43', 24, 24, 312, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61491, 71201, '[]', 0, '2016-10-24 15:59:43', 24, 24, 312, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61492, 71202, '[]', 0, '2016-10-24 15:59:43', 24, 24, 312, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61493, 71203, '[]', 0, '2016-10-24 15:59:43', 24, 24, 312, '2016-10-24 15:59:43', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61494, 71204, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61495, 71205, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61496, 71206, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61497, 71207, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61498, 71208, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61499, 71209, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61500, 71210, '[]', 0, '2016-10-24 15:59:44', 24, 24, 312, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61501, 71211, '[]', 0, '2016-10-24 15:59:44', 29, 29, 348, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61502, 71212, '[]', 0, '2016-10-24 15:59:44', 29, 29, 348, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61503, 71213, '[]', 0, '2016-10-24 15:59:44', 29, 29, 348, '2016-10-24 15:59:44', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61504, 71214, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61505, 71215, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61506, 71216, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61507, 71217, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61508, 71218, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61509, 71219, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61510, 71220, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61511, 71221, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61512, 71222, '[]', 0, '2016-10-24 15:59:45', 29, 29, 348, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61513, 71223, '[]', 0, '2016-10-24 15:59:45', 12, 12, 156, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61514, 71224, '[]', 0, '2016-10-24 15:59:45', 12, 12, 156, '2016-10-24 15:59:45', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61515, 71225, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61516, 71226, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61517, 71227, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61518, 71228, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61519, 71229, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61520, 71230, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61521, 71231, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61522, 71232, '[]', 0, '2016-10-24 15:59:46', 12, 12, 156, '2016-10-24 15:59:46', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61523, 71233, '[]', 0, '2016-10-24 15:59:47', 12, 12, 156, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61524, 71234, '[]', 0, '2016-10-24 15:59:47', 12, 12, 156, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61525, 71235, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61526, 71236, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61527, 71237, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61528, 71238, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61529, 71239, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61530, 71240, '[]', 0, '2016-10-24 15:59:47', 27, 27, 324, '2016-10-24 15:59:47', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61531, 71241, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61532, 71242, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61533, 71243, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61534, 71244, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61535, 71245, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61536, 71246, '[]', 0, '2016-10-24 15:59:48', 27, 27, 324, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61537, 71247, '[]', 0, '2016-10-24 15:59:48', 14, 14, 154, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61538, 71248, '[]', 0, '2016-10-24 15:59:48', 14, 14, 154, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61539, 71249, '[]', 0, '2016-10-24 15:59:48', 14, 14, 154, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61540, 71250, '[]', 0, '2016-10-24 15:59:48', 14, 14, 154, '2016-10-24 15:59:48', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61541, 71251, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61542, 71252, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61543, 71253, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61544, 71254, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61545, 71255, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61546, 71256, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61547, 71257, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61548, 71258, '[]', 0, '2016-10-24 15:59:49', 14, 14, 154, '2016-10-24 15:59:49', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61549, 71259, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61550, 71260, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61551, 71261, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61552, 71262, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61553, 71263, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61554, 71264, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61555, 71265, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61556, 71266, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61557, 71267, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61558, 71268, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61559, 71269, '[]', 0, '2016-10-24 15:59:50', 26, 26, 312, '2016-10-24 15:59:50', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61560, 71270, '[]', 0, '2016-10-24 15:59:51', 26, 26, 312, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61561, 71271, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61562, 71272, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61563, 71273, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61564, 71274, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61565, 71275, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61566, 71276, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61567, 71277, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61568, 71278, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61569, 71279, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61570, 71280, '[]', 0, '2016-10-24 15:59:51', 21, 21, 273, '2016-10-24 15:59:51', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61571, 71281, '[]', 0, '2016-10-24 15:59:52', 21, 21, 273, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61572, 71282, '[]', 0, '2016-10-24 15:59:52', 21, 21, 273, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61573, 71283, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61574, 71284, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61575, 71285, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61576, 71286, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61577, 71287, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61578, 71288, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61579, 71289, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61580, 71290, '[]', 0, '2016-10-24 15:59:52', 14, 14, 154, '2016-10-24 15:59:52', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61581, 71291, '[]', 0, '2016-10-24 15:59:53', 14, 14, 154, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61582, 71292, '[]', 0, '2016-10-24 15:59:53', 14, 14, 154, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61583, 71293, '[]', 0, '2016-10-24 15:59:53', 14, 14, 154, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61584, 71294, '[]', 0, '2016-10-24 15:59:53', 14, 14, 154, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61585, 71295, '[]', 0, '2016-10-24 15:59:53', 20, 20, 240, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61586, 71296, '[]', 0, '2016-10-24 15:59:53', 20, 20, 240, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61587, 71297, '[]', 0, '2016-10-24 15:59:53', 20, 20, 240, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61588, 71298, '[]', 0, '2016-10-24 15:59:53', 20, 20, 240, '2016-10-24 15:59:53', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61589, 71299, '[]', 0, '2016-10-24 15:59:54', 20, 20, 240, '2016-10-24 15:59:54', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61590, 71300, '[]', 0, '2016-10-24 15:59:54', 20, 20, 240, '2016-10-24 15:59:54', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61591, 71301, '[]', 0, '2016-10-24 15:59:54', 20, 20, 240, '2016-10-24 15:59:54', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61592, 71302, '[]', 0, '2016-10-24 15:59:54', 20, 20, 240, '2016-10-24 15:59:54', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61593, 71303, '[]', 0, '2016-10-24 15:59:54', 20, 20, 240, '2016-10-24 15:59:54', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61594, 71304, '[]', 0, '2016-10-24 15:59:55', 20, 20, 240, '2016-10-24 15:59:55', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61595, 71305, '[]', 0, '2016-10-24 15:59:55', 20, 20, 240, '2016-10-24 15:59:55', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61596, 71306, '[]', 0, '2016-10-24 15:59:55', 20, 20, 240, '2016-10-24 15:59:55', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61597, 71307, '[]', 0, '2016-10-24 15:59:55', 31, 31, 372, '2016-10-24 15:59:55', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61598, 71308, '[]', 0, '2016-10-24 15:59:56', 31, 31, 372, '2016-10-24 15:59:56', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61599, 71309, '[]', 0, '2016-10-24 15:59:56', 31, 31, 372, '2016-10-24 15:59:56', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61600, 71310, '[]', 0, '2016-10-24 15:59:56', 31, 31, 372, '2016-10-24 15:59:56', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61601, 71311, '[]', 0, '2016-10-24 15:59:56', 31, 31, 372, '2016-10-24 15:59:56', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61602, 71312, '[]', 0, '2016-10-24 15:59:57', 31, 31, 372, '2016-10-24 15:59:57', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61603, 71313, '[]', 0, '2016-10-24 15:59:57', 31, 31, 372, '2016-10-24 15:59:57', '0', 0, NULL, 0, 0, 0);
INSERT INTO `uw_pkout` VALUES (61604, 71316, '[71139,71158,71079]', 0, '2018-06-02 18:11:49', 0, 0, 0, '2018-06-02 18:11:52', '0', 0, NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for uw_pkout_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_pkout_bak`;
CREATE TABLE `uw_pkout_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 0 COMMENT '用户id',
  `enemyIds` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对手组',
  `exEnemyId` int(11) NULL DEFAULT 0 COMMENT '额外的对手',
  `freshTime` datetime NULL DEFAULT NULL COMMENT '上一次刷新对手时间',
  `pkValue` int(6) NULL DEFAULT 0 COMMENT 'pk值',
  `highPkValue` int(6) NULL DEFAULT 0 COMMENT '历史最高pk值',
  `killValue` int(6) NULL DEFAULT 0 COMMENT '杀戮值',
  `pkValueTime` datetime NULL DEFAULT NULL COMMENT 'pk值结算时间',
  `enemyTypes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `todayRefreshNum` int(11) NULL DEFAULT 0 COMMENT '每日刷新对手次数',
  `todayRefreshTime` datetime NULL DEFAULT NULL COMMENT '最近每日刷新时间',
  `winCount` int(6) NULL DEFAULT 0 COMMENT '连胜次数',
  `highWinCount` int(6) NULL DEFAULT 0 COMMENT '历史最高连胜次数',
  `accWinCount` int(6) NULL DEFAULT 0 COMMENT '累计胜利次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_pkOut_bak_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-野外pk-备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_protocol_content
-- ----------------------------
DROP TABLE IF EXISTS `uw_protocol_content`;
CREATE TABLE `uw_protocol_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `isOpen` int(2) NULL DEFAULT 0 COMMENT '是否开启,0：不开启，1：开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '协议内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_recharge
-- ----------------------------
DROP TABLE IF EXISTS `uw_recharge`;
CREATE TABLE `uw_recharge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userId` int(11) NULL DEFAULT NULL,
  `rechargeId` int(11) NULL DEFAULT NULL,
  `diamond` int(11) NULL DEFAULT NULL COMMENT '充值钻石',
  `rechargeTime` datetime NULL DEFAULT NULL,
  `effTime` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `channelId` int(11) NULL DEFAULT NULL COMMENT '渠道号',
  `transId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号',
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'CNY' COMMENT '币种,CNY,USD,HKD,TWD',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `payMoney` int(11) NULL DEFAULT NULL COMMENT '金额',
  `userLvl` int(4) NULL DEFAULT NULL COMMENT '用户当前等级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_recharge_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-充值记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_recharge
-- ----------------------------
INSERT INTO `uw_recharge` VALUES (1, 686960, 11111111, 999999, '2016-10-21 01:41:38', NULL, 1, '22222222', 'CNY', '49.70.31.223', 999, 300);

-- ----------------------------
-- Table structure for uw_recharge_request
-- ----------------------------
DROP TABLE IF EXISTS `uw_recharge_request`;
CREATE TABLE `uw_recharge_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `accountId` int(11) NULL DEFAULT NULL COMMENT '账号id',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `serverId` int(11) NULL DEFAULT NULL COMMENT '服务器id',
  `rechargeId` int(11) NULL DEFAULT NULL COMMENT '充值项id',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 0:请求 1:支付成功 2:领取钻石',
  `addTime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `transId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务号',
  `goodsId` int(11) NULL DEFAULT 0 COMMENT '渠道物品id',
  `orderNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_recharge_request_uid`(`userId`) USING BTREE,
  INDEX `uw_recharge_request_orderNo`(`orderNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值请求记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_recharge_request
-- ----------------------------
INSERT INTO `uw_recharge_request` VALUES (1, 10479, 686250, 1, 11111111, 0, '2016-10-20 01:48:55', '22222222', 0, '0');

-- ----------------------------
-- Table structure for uw_red_envelope
-- ----------------------------
DROP TABLE IF EXISTS `uw_red_envelope`;
CREATE TABLE `uw_red_envelope`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `redType` int(2) NULL DEFAULT 1 COMMENT '红包类型',
  `userId` int(11) NULL DEFAULT NULL COMMENT '发送者id',
  `guildId` int(11) NULL DEFAULT NULL COMMENT '公会id',
  `diamond` int(11) NULL DEFAULT NULL COMMENT '红包元宝',
  `personNum` int(4) NULL DEFAULT NULL COMMENT '人数',
  `wish` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '红包祝福',
  `getData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '领取记录[[元宝数,userId],[元宝数,userId]......]',
  `addTime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `expireTime` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `isDelete` int(2) NULL DEFAULT 0 COMMENT '是否删除',
  `spItemId` int(11) NULL DEFAULT 200 COMMENT '红包物品,默认元宝',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_red_envelope_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '红包' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_red_envelope
-- ----------------------------
INSERT INTO `uw_red_envelope` VALUES (1, 1, 68627, 0, 800, 5, '恭喜发财，大吉大利！', '[[118,68628,\"s1.侯後郭\"],[175,68630,\"s1.方康德\"],[138,68627,\"s1.我尼玛杨过\"],[215,68629,\"s1.PHONGDEV0421\"],[154,68632,\"s1.广乐欣\"]]', '2014-07-05 02:50:16', '2014-07-05 03:50:16', 1, 200);
INSERT INTO `uw_red_envelope` VALUES (2, 1, 68696, 0, 500, 5, '恭喜发财，大吉大利！', '[[57,70995,\"s1.东东！\"],[122],[103],[77],[141,68698,\"s1.乱精神\"]]', '2016-10-20 23:31:11', '2016-10-21 00:31:11', 1, 200);
INSERT INTO `uw_red_envelope` VALUES (3, 1, 68696, 0, 800, 10, '恭喜发财，大吉大利！', '[[89,68698,\"s1.乱精神\"],[53,70995,\"s1.东东！\"],[82],[81],[51],[111],[67],[48],[113],[105]]', '2016-10-20 23:31:14', '2016-10-21 00:31:14', 1, 200);
INSERT INTO `uw_red_envelope` VALUES (4, 1, 68696, 0, 800, 5, '恭喜发财，大吉大利！', '[[123,68698,\"s1.乱精神\"],[170,70995,\"s1.东东！\"],[125],[124],[258]]', '2016-10-20 23:31:16', '2016-10-21 00:31:16', 1, 200);
INSERT INTO `uw_red_envelope` VALUES (5, 1, 68698, 0, 100, 5, '恭喜发财，大吉大利！', '[[10],[20],[23],[26,68698,\"s1.乱精神\"],[21,70995,\"s1.东东！\"]]', '2016-10-21 00:30:22', '2016-10-21 01:30:22', 1, 200);

-- ----------------------------
-- Table structure for uw_red_envelope_personal
-- ----------------------------
DROP TABLE IF EXISTS `uw_red_envelope_personal`;
CREATE TABLE `uw_red_envelope_personal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT 1 COMMENT '用户id',
  `addUpServer` int(11) NULL DEFAULT 0 COMMENT '累计全服红包',
  `addUpGuild` int(11) NULL DEFAULT 0 COMMENT '累计公会红包',
  `addUpGet` int(4) NULL DEFAULT 0 COMMENT '累计抢得元宝',
  `sendCount` int(11) NULL DEFAULT 0 COMMENT '今日发送次数',
  `lastSendTime` datetime NULL DEFAULT NULL COMMENT '领取记录{\"元宝数\":userId,\"元宝数\":userId......}',
  `getData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发送记录[[份额，用户id，名字],[份额，用户id，名字]..]',
  `exData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展数据',
  `exAddUpGet` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '累积抢的其他物品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_red_envelope_personal_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '红包个人信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_red_envelope_personal
-- ----------------------------
INSERT INTO `uw_red_envelope_personal` VALUES (1, 68627, 800, 0, 138, 800, '2014-07-05 02:50:16', '[[1,800,\"2014-07-04T18:50:16.767Z\"]]', '{\"1\":[1]}', NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (2, 68628, 0, 0, 118, 0, NULL, '[]', '{}', '{}');
INSERT INTO `uw_red_envelope_personal` VALUES (3, 68629, 0, 0, 215, 0, NULL, '[]', '{}', '{}');
INSERT INTO `uw_red_envelope_personal` VALUES (4, 68630, 0, 0, 175, 0, NULL, '[]', '{}', '{}');
INSERT INTO `uw_red_envelope_personal` VALUES (5, 68632, 0, 0, 154, 0, NULL, '[]', '{}', '{}');
INSERT INTO `uw_red_envelope_personal` VALUES (6, 68633, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (7, 68698, 100, 0, 379, 100, '2016-10-21 00:30:22', '[[1,100,\"2016-10-20T16:30:22.235Z\"]]', '{\"1\":[1]}', NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (8, 70983, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (9, 70981, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (10, 70985, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (11, 70989, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (12, 68696, 2100, 0, 0, 2100, '2016-10-20 23:31:16', '[[1,800,\"2016-10-20T15:31:16.743Z\"],[1,800,\"2016-10-20T15:31:14.828Z\"],[1,500,\"2016-10-20T15:31:11.405Z\"]]', '{\"1\":[3]}', NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (13, 70992, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (14, 70995, 0, 0, 301, 0, NULL, '[]', '{}', '{}');
INSERT INTO `uw_red_envelope_personal` VALUES (15, 70993, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (16, 71003, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (17, 71004, 0, 0, 0, 0, NULL, '[]', NULL, NULL);
INSERT INTO `uw_red_envelope_personal` VALUES (18, 71315, 0, 0, 0, 0, NULL, '[]', NULL, NULL);

-- ----------------------------
-- Table structure for uw_runwat
-- ----------------------------
DROP TABLE IF EXISTS `uw_runwat`;
CREATE TABLE `uw_runwat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dateTime` datetime NULL DEFAULT NULL COMMENT '时间',
  `newUser` int(11) NULL DEFAULT 0 COMMENT '新增',
  `active` int(11) NULL DEFAULT 0 COMMENT '活跃',
  `nextDayLeft` float NULL DEFAULT NULL COMMENT '次日留存',
  `weekLeft` float NULL DEFAULT NULL COMMENT '7日留存',
  `runwat` int(11) NULL DEFAULT 0 COMMENT '流水',
  `payCount` int(11) NULL DEFAULT 0 COMMENT '付费用户数',
  `newPay` int(11) NULL DEFAULT 0 COMMENT '新增付费',
  `ARPU` float NULL DEFAULT NULL COMMENT 'ARPU',
  `payRate` float NULL DEFAULT NULL COMMENT '付费率',
  `ARPPU` float NULL DEFAULT NULL COMMENT 'ARPPU',
  `runwatNum` int(11) NULL DEFAULT 0 COMMENT '累计流水',
  `userNum` int(11) NULL DEFAULT 0 COMMENT '累计用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据分析' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_server_info
-- ----------------------------
DROP TABLE IF EXISTS `uw_server_info`;
CREATE TABLE `uw_server_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏区',
  `mergerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合服后的名字',
  `host` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器ip',
  `port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `isNew` int(1) NULL DEFAULT 1 COMMENT '是否是新区',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态:\n            1:良好，2:正常，3:爆满',
  `dbLink` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库链接字符串',
  `sort` int(6) NULL DEFAULT 0 COMMENT '排序',
  `appId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serverId` int(11) NULL DEFAULT NULL COMMENT '服务器id',
  `indexId` int(11) NULL DEFAULT NULL COMMENT '客户端索引id',
  `isClose` int(2) NULL DEFAULT 0 COMMENT '是否维护',
  `closeExplain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护说明',
  `serverDate` datetime NULL DEFAULT NULL COMMENT '开服时间',
  `outLink` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务器信息表。用于管理服务器信息。' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_server_info
-- ----------------------------
INSERT INTO `uw_server_info` VALUES (1, '传奇世界', '测试1服', '龙门工作室', '127.0.0.1', '24200', 1, 1, 'server=127.0.0.1;database=aazyw_s1;uid=root;pwd=aazyw.com;charset=utf8;port=3306', 1, NULL, 1, 1, 0, '开服QQ479484001', '2016-10-24 00:00:00', '龙门');

-- ----------------------------
-- Table structure for uw_shop
-- ----------------------------
DROP TABLE IF EXISTS `uw_shop`;
CREATE TABLE `uw_shop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `type` int(4) NULL DEFAULT 0 COMMENT '商店类型',
  `items` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '普通商店物品[shop模板id,剩余购买次数]',
  `lastTime` datetime NULL DEFAULT NULL COMMENT '普通商店上次刷新时间',
  `refreshCount` int(4) NULL DEFAULT 0 COMMENT '普通商店今日刷新次数',
  `refreshCountResetTime` datetime NULL DEFAULT NULL COMMENT '普通商店刷新次数重置时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_shop_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7277 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商店，包括普通商店、竞技场商店和神秘商店' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_shop
-- ----------------------------
INSERT INTO `uw_shop` VALUES (7231, 68624, 2, '[[425,1,[[35,86],[36,1],[33,6],[40,2]],5483],[1381,1,[[36,3],[35,4],[34,10],[33,440],[38,2]],5264],[1811,1,[[38,90],[37,10],[40,11],[36,2],[39,1]],4840],[1421,1,[[39,3],[36,4],[38,27],[37,3],[40,6]],4025],[404,1,[[34,192],[37,6],[33,4],[36,1]],3535],[130,1,[[37,3],[38,22],[40,2]],2366]]', '2016-07-12 05:00:00', 0, '2016-07-13 00:25:22');
INSERT INTO `uw_shop` VALUES (7232, 68625, 2, '[[987,1,[[35,737],[33,178],[36,28],[37,23],[40,35]],40941],[451,1,[[36,79],[33,32],[34,14],[35,4]],16675],[1687,1,[[39,24],[34,43],[35,21],[38,14],[37,1695]],28733],[473,1,[[38,6],[35,6],[33,1197],[34,14]],20217],[30,1,[[36,4],[33,37],[34,247]],10248],[807,1,[[35,8],[39,16],[38,7],[37,1139]],21301]]', '2014-07-04 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7233, 68626, 2, '[[1061,1,[[37,8],[40,17],[36,5],[38,24],[39,1]],4027],[425,1,[[36,1],[40,6],[35,39],[33,3]],4975],[404,1,[[33,11],[37,3],[34,134],[36,1]],3301],[130,1,[[38,12],[37,3],[40,2]],2236],[1421,1,[[39,4],[36,5],[38,22],[37,6],[40,6]],3989],[404,1,[[34,108],[33,7],[36,1],[37,2]],3190]]', '2014-07-04 05:00:00', 2, '2014-07-05 02:37:32');
INSERT INTO `uw_shop` VALUES (7234, 68627, 2, '[[758,1,[[38,56],[37,4128],[35,45],[39,103]],153655],[960,1,[[37,332],[38,3081],[36,110],[40,214]],198509],[900,1,[[40,602],[38,1700],[36,145],[37,217]],181760],[839,1,[[38,680],[36,64],[37,171],[40,91]],143323],[233,1,[[35,100],[34,290],[33,29929]],163522],[738,1,[[33,44865],[38,85],[34,283],[35,60]],216537]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7235, 68628, 2, '[[1659,1,[[35,230],[37,20688],[34,280],[38,41],[39,99]],331474],[528,1,[[36,139],[37,314],[38,3187],[40,194]],200092],[880,1,[[37,11954],[35,64],[38,31],[39,90]],200550],[485,1,[[38,102],[33,30676],[35,144],[34,102]],211885],[444,1,[[36,180],[40,407],[33,1035],[35,4317]],319127],[316,1,[[36,180],[35,806],[33,666]],167409]]', '2014-07-04 05:00:00', 78, '2014-07-05 03:21:44');
INSERT INTO `uw_shop` VALUES (7236, 68629, 2, '[[510,1,[[37,7],[40,5],[38,19],[36,1]],3792],[961,1,[[35,4],[37,9],[34,320],[33,22],[36,2]],5171],[1804,1,[[40,22],[37,13],[33,61],[36,7],[35,72]],9195],[467,1,[[34,6],[35,1],[33,730],[38,1]],4296],[47,1,[[33,11],[36,2],[35,51]],5546],[1341,1,[[33,55],[35,127],[36,2],[37,3],[40,5]],7508]]', '2014-07-04 05:00:00', 3, '2014-07-05 03:53:48');
INSERT INTO `uw_shop` VALUES (7237, 68630, 2, '[[1281,1,[[35,5],[34,9],[37,292],[38,1],[39,1]],4587],[1241,1,[[38,2],[35,4],[34,8],[33,36],[36,27]],6656],[277,1,[[33,9],[34,34],[36,2]],2480],[1835,1,[[38,51],[36,4],[37,6],[39,2],[40,3]],4328],[901,1,[[33,604],[34,3],[35,1],[38,1]],3468],[1281,1,[[37,229],[34,8],[35,2],[38,1],[39,1]],4361]]', '2014-07-04 05:00:00', 2, '2014-07-05 03:19:32');
INSERT INTO `uw_shop` VALUES (7238, 68631, 2, '[[1021,1,[[34,10],[36,4],[33,1452],[35,2],[38,1]],6252],[1061,1,[[38,88],[40,17],[36,2],[37,3],[39,1]],4811],[1061,1,[[39,2],[38,83],[36,1],[37,3],[40,6]],4711],[509,1,[[36,1],[38,20],[37,2],[40,3]],2884],[488,1,[[37,173],[35,0],[38,1],[39,2]],3815],[46,1,[[35,24],[33,7],[36,2]],3938]]', '2014-07-04 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7239, 68632, 2, '[[1481,1,[[36,103],[34,6],[33,15],[35,2],[38,1]],7120],[635,1,[[36,1],[38,44],[37,4],[40,2]],3199],[1161,1,[[38,2],[39,4],[37,78],[34,3],[35,2]],3928],[551,1,[[40,4],[36,1],[33,18],[35,36]],4159],[551,1,[[35,40],[33,7],[36,1],[40,2]],4186],[235,1,[[38,1],[37,68],[39,1]],2360]]', '2014-07-04 05:00:00', 0, '2014-07-05 03:48:13');
INSERT INTO `uw_shop` VALUES (7240, 68633, 2, '[[1321,1,[[33,35],[35,4],[37,10],[34,118],[36,2]],4379],[1811,1,[[40,14],[37,8],[36,3],[38,25],[39,2]],4018],[1001,1,[[38,2],[36,88],[35,4],[33,39],[34,3]],6012],[1061,1,[[37,9],[36,3],[38,25],[39,1],[40,8]],3994],[446,1,[[35,1],[36,64],[34,7],[33,4]],4489],[88,1,[[34,3],[33,377],[35,1]],3222]]', '2014-07-04 05:00:00', 1, '2014-07-05 03:49:22');
INSERT INTO `uw_shop` VALUES (7241, 68694, 2, '[[1381,1,[[35,3],[38,3],[36,4],[33,480],[34,4]],5293],[446,1,[[33,16],[34,5],[35,1],[36,64]],4493],[1811,1,[[37,10],[39,4],[38,18],[36,2],[40,4]],3910],[425,1,[[35,66],[33,14],[36,1],[40,2]],5271],[425,1,[[36,1],[35,46],[33,7],[40,2]],5044],[46,1,[[33,10],[35,27],[36,1]],3963]]', '2015-07-01 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7242, 68696, 2, '[]', '2016-10-21 05:00:00', 65, '2016-10-21 14:31:11');
INSERT INTO `uw_shop` VALUES (7243, 68697, 2, '[[1805,1,[[38,2],[33,49],[35,3],[34,9],[36,28]],5375],[404,1,[[33,9],[37,3],[34,179],[36,1]],3479],[1361,1,[[35,4],[33,49],[38,2],[36,34],[34,2]],5424],[509,1,[[36,2],[38,12],[37,2],[40,3]],2791],[25,1,[[33,14],[36,2],[34,140]],2801],[446,1,[[33,12],[36,80],[35,1],[34,3]],4657]]', '2015-07-01 05:00:00', 2, '2015-07-01 14:57:07');
INSERT INTO `uw_shop` VALUES (7244, 68698, 2, '[[443,1,[[36,154],[35,2096],[33,518],[40,191]],254400],[758,1,[[37,8990],[35,28],[38,19],[39,75]],167321],[485,1,[[38,116],[34,332],[33,22879],[35,31]],203947],[528,1,[[36,174],[37,594],[38,2975],[40,563]],199668],[1059,1,[[35,326],[38,209],[37,6126],[34,144],[39,104]],341622],[379,1,[[37,4648],[38,54],[39,82]],125387]]', '2016-10-21 05:00:00', 3, '2016-10-21 14:24:50');
INSERT INTO `uw_shop` VALUES (7245, 70979, 2, '[[1041,1,[[38,1],[37,306],[35,4],[39,3],[34,9]],5335],[821,1,[[36,1],[38,28],[37,2],[40,3]],2988],[1021,1,[[34,5],[33,1328],[35,2],[36,1],[38,2]],6088],[1381,1,[[34,6],[38,2],[35,3],[33,1411],[36,3]],6208],[46,1,[[35,31],[33,5],[36,1]],4002],[467,1,[[38,0],[34,4],[33,290],[35,1]],3835]]', '2016-10-09 05:00:00', 4, '2016-10-09 16:52:57');
INSERT INTO `uw_shop` VALUES (7246, 70980, 2, '[[1405,1,[[37,968],[35,13],[38,5],[34,10],[39,2]],16780],[965,1,[[33,110],[37,38],[34,170],[35,4],[36,7]],12943],[408,1,[[34,139],[33,11],[36,3],[37,6]],9305],[471,1,[[33,2714],[34,13],[38,3],[35,3]],14009],[408,1,[[36,5],[34,704],[33,24],[37,9]],11609],[92,1,[[33,1951],[34,10],[35,2]],10974]]', '2016-10-10 05:00:00', 0, '2016-10-09 18:11:46');
INSERT INTO `uw_shop` VALUES (7247, 70981, 2, '[[451,1,[[36,77],[33,31],[34,15],[35,4]],16656],[451,1,[[34,32],[36,107],[33,18],[35,3]],17030],[786,1,[[38,4],[33,1702],[34,7],[35,3]],16358],[409,1,[[37,22],[34,367],[33,35],[36,4]],12944],[1006,1,[[36,350],[34,44],[35,15],[33,72],[38,4]],24785],[93,1,[[35,8],[33,688],[34,10]],12512]]', '2016-10-10 05:00:00', 2, '2016-10-10 14:13:30');
INSERT INTO `uw_shop` VALUES (7248, 70982, 2, '[[841,1,[[38,1],[34,4],[33,309],[35,1]],3039],[1121,1,[[35,4],[33,35],[36,137],[34,4],[38,1]],7528],[551,1,[[36,1],[35,103],[33,16],[40,2]],4888],[235,1,[[38,0],[37,115],[39,0]],2479],[593,1,[[33,349],[34,3],[35,1],[38,1]],3075],[635,1,[[38,27],[36,1],[37,2],[40,2]],2972]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7249, 70983, 2, '[[1561,1,[[33,56],[37,12],[36,6],[34,311],[35,1]],5357],[1201,1,[[34,286],[33,36],[36,6],[35,4],[37,12]],5270],[740,1,[[39,2],[35,1],[37,150],[38,1]],3199],[277,1,[[34,44],[33,5],[36,1]],2505],[740,1,[[38,1],[35,1],[39,2],[37,150]],3199],[761,1,[[36,1],[37,5],[38,14],[40,3]],2815]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7250, 70984, 2, '[[981,1,[[40,14],[36,4],[33,48],[35,43],[37,4]],6629],[1001,1,[[34,5],[38,2],[36,50],[33,11],[35,1]],5541],[1805,1,[[33,30],[38,2],[34,6],[36,34],[35,1]],5388],[425,1,[[33,15],[35,25],[36,1],[40,3]],4824],[1811,1,[[40,22],[38,78],[39,3],[36,2],[37,4]],4717],[25,1,[[34,114],[33,7],[36,1]],2679]]', '2016-10-09 05:00:00', 0, '2016-10-09 18:34:50');
INSERT INTO `uw_shop` VALUES (7251, 70985, 2, '[[1384,1,[[38,7],[36,14],[33,777],[34,9],[35,3]],12361],[1704,1,[[38,200],[37,24],[40,52],[39,8],[36,9]],11613],[1683,1,[[34,11],[39,8],[38,6],[35,9],[37,812]],10546],[427,1,[[36,3],[40,8],[33,17],[35,45]],8810],[112,1,[[38,1],[37,113],[39,2]],6638],[1043,1,[[35,5],[39,7],[37,239],[34,6],[38,2]],8702]]', '2016-10-09 05:00:00', 8, '2016-10-09 22:07:17');
INSERT INTO `uw_shop` VALUES (7252, 70986, 2, '[[1781,1,[[39,3],[38,78],[40,12],[36,5],[37,11]],4741],[277,1,[[34,120],[33,4],[36,2]],2819],[1281,1,[[34,7],[38,2],[37,88],[35,2],[39,2]],3956],[1827,1,[[37,11],[40,13],[35,128],[33,10],[36,2]],6532],[761,1,[[38,61],[36,1],[37,1],[40,2]],3411],[719,1,[[33,275],[34,3],[35,1],[38,1]],3139]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7253, 70987, 2, '[[1835,1,[[40,11],[36,4],[38,81],[37,14],[39,3]],4775],[677,1,[[35,22],[33,5],[36,1],[40,2]],3986],[1829,1,[[33,36],[38,2],[36,119],[34,3],[35,2]],7626],[740,1,[[39,1],[37,65],[35,1],[38,1]],2935],[277,1,[[34,131],[33,7],[36,1]],2855],[740,1,[[35,1],[37,192],[39,1],[38,0]],3303]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7254, 70988, 2, '[[1501,1,[[34,5],[36,5],[35,2],[38,2],[33,163]],3932],[1821,1,[[39,3],[34,7],[37,365],[38,2],[35,3]],4807],[881,1,[[37,2],[38,14],[36,1],[40,2]],2803],[614,1,[[38,0],[37,120],[35,1],[39,1]],3087],[193,1,[[34,3],[36,45],[35,1]],4163],[572,1,[[36,26],[33,6],[34,3],[35,1]],4849]]', '2016-10-09 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7255, 70981, 1, '[[1,10],[9,10],[8,10],[7,6],[2,99],[5,99],[4,99],[6,99]]', '2016-10-10 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7256, 70989, 2, '[[981,1,[[37,8],[35,157],[33,12],[36,2],[40,3]],7804],[404,1,[[36,2],[33,11],[34,108],[37,2]],3205],[425,1,[[40,5],[35,28],[33,3],[36,1]],4851],[1061,1,[[37,8],[36,4],[38,23],[39,2],[40,7]],3982],[130,1,[[40,3],[38,20],[37,2]],2340],[467,1,[[35,1],[33,697],[34,3],[38,1]],4251]]', '2016-10-10 05:00:00', 2, '2016-10-10 23:28:28');
INSERT INTO `uw_shop` VALUES (7257, 70990, 2, '[[781,1,[[38,1],[33,178],[34,3],[35,1]],3732],[425,1,[[40,5],[35,40],[33,8],[36,1]],4988],[1803,1,[[35,162],[37,8],[33,30],[36,2],[40,4]],7880],[488,1,[[35,1],[39,2],[38,0],[37,58]],3468],[781,1,[[34,5],[35,1],[38,1],[33,1095]],4657],[25,1,[[33,12],[34,98],[36,1]],2620]]', '2016-10-10 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7258, 70991, 2, '[[425,1,[[40,4],[35,47],[33,6],[36,1]],5060],[1421,1,[[38,78],[36,4],[37,6],[39,1],[40,6]],4679],[961,1,[[35,3],[36,6],[34,47],[33,20],[37,5]],4098],[425,1,[[35,122],[33,7],[36,1],[40,2]],5880],[109,1,[[38,0],[37,149],[39,1]],3046],[509,1,[[37,6],[38,24],[36,1],[40,3]],2948]]', '2016-10-20 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7259, 70992, 2, '[[1365,1,[[38,8],[33,129],[36,358],[35,12],[34,6]],20038],[1024,1,[[34,16],[35,7],[38,6],[36,11],[33,2488]],14098],[1704,1,[[39,8],[40,36],[38,49],[36,6],[37,5]],9512],[804,1,[[37,763],[39,6],[38,3],[35,3]],10336],[512,1,[[40,15],[37,12],[36,2],[38,37]],6851],[70,1,[[34,5],[36,68],[35,3]],8138]]', '2016-10-21 05:00:00', 1, '2016-10-21 00:07:18');
INSERT INTO `uw_shop` VALUES (7260, 70993, 2, '[[50,1,[[33,38],[36,6],[35,80]],12639],[407,1,[[34,353],[33,10],[36,2],[37,3]],8064],[1685,1,[[38,7],[34,32],[37,493],[35,3],[39,6]],15395],[492,1,[[39,8],[38,4],[35,4],[37,1097]],13880],[512,1,[[37,7],[38,30],[36,2],[40,8]],6724],[429,1,[[33,46],[40,19],[35,250],[36,3]],17302]]', '2016-10-21 05:00:00', 2, '2016-10-21 12:42:39');
INSERT INTO `uw_shop` VALUES (7261, 70994, 2, '[[425,1,[[35,78],[33,9],[36,1],[40,2]],5398],[67,1,[[34,2],[35,1],[36,30]],3345],[1021,1,[[34,5],[38,3],[33,242],[35,1],[36,2]],5015],[981,1,[[40,15],[35,177],[33,46],[36,6],[37,7]],8135],[404,1,[[33,14],[34,147],[36,1],[37,2]],3353],[1801,1,[[35,3],[34,288],[33,16],[36,3],[37,6]],5028]]', '2016-10-20 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7262, 70995, 2, '[[1385,1,[[35,10],[36,16],[33,1935],[34,8],[38,2]],17051],[964,1,[[34,614],[37,32],[33,73],[35,12],[36,5]],11906],[428,1,[[36,3],[33,38],[35,95],[40,6]],12131],[1425,1,[[40,60],[37,46],[39,12],[36,11],[38,153]],13819],[492,1,[[37,774],[35,4],[38,2],[39,3]],12840],[91,1,[[33,703],[34,5],[35,3]],7578]]', '2016-10-21 05:00:00', 2, '2016-10-21 12:24:09');
INSERT INTO `uw_shop` VALUES (7263, 70996, 2, '[[1021,1,[[33,1577],[34,10],[38,2],[35,4],[36,4]],6412],[1801,1,[[36,3],[34,184],[33,22],[35,2],[37,4]],4601],[781,1,[[33,174],[34,3],[35,1],[38,1]],3728],[801,1,[[39,2],[37,245],[35,1],[38,1]],4042],[446,1,[[36,80],[35,1],[33,9],[34,3]],4654],[67,1,[[36,31],[34,2],[35,1]],3356]]', '2016-10-20 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7264, 70997, 2, '[[404,1,[[33,16],[34,70],[36,1],[37,1]],3044],[509,1,[[38,29],[36,1],[37,2],[40,3]],3001],[467,1,[[33,630],[34,2],[35,1],[38,1]],4180],[467,1,[[34,4],[38,1],[33,177],[35,1]],3735],[25,1,[[34,130],[33,3],[36,1]],2739],[1401,1,[[34,8],[35,4],[37,106],[38,1],[39,2]],4722]]', '2016-10-20 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7265, 70998, 2, '[[404,1,[[37,4],[34,80],[33,6],[36,1]],3083],[981,1,[[33,49],[36,3],[37,12],[40,11],[35,30]],6491],[781,1,[[34,6],[33,280],[35,1],[38,1]],3846],[509,1,[[38,52],[36,1],[37,3],[40,2]],3300],[25,1,[[33,9],[34,156],[36,1]],2849],[821,1,[[37,3],[40,5],[36,1],[38,37]],3114]]', '2016-10-21 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7266, 70999, 2, '[[1023,1,[[33,2552],[38,3],[35,8],[34,8],[36,5]],11262],[1424,1,[[36,14],[37,32],[38,144],[39,5],[40,16]],10829],[1364,1,[[34,24],[38,5],[36,96],[33,34],[35,5]],13280],[784,1,[[34,18],[38,2],[35,3],[33,690]],9319],[70,1,[[34,7],[35,5],[36,158]],9158]]', '2016-10-21 05:00:00', 15, '2016-10-21 12:30:48');
INSERT INTO `uw_shop` VALUES (7267, 71000, 2, '[[941,1,[[37,3],[38,12],[36,1],[40,2]],2780],[921,1,[[37,142],[35,1],[38,0],[39,2]],3162],[319,1,[[35,1],[36,37],[34,2]],4269]]', '2016-10-21 05:00:00', 2, '2016-10-21 09:58:23');
INSERT INTO `uw_shop` VALUES (7268, 71001, 2, '[[1641,1,[[39,2],[34,8],[37,58],[35,2],[38,1]],3857],[1761,1,[[34,10],[39,4],[37,121],[35,2],[38,1]],4072],[1261,1,[[33,809],[34,8],[36,4],[35,2],[38,2]],4579],[656,1,[[36,1],[34,95],[33,5],[37,2]],3272],[340,1,[[34,2],[33,265],[35,1]],2546],[1831,1,[[35,3],[34,8],[36,5],[38,2],[33,934]],4726]]', '2016-10-21 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7269, 71002, 2, '[[1809,1,[[35,2],[39,4],[37,145],[34,4],[38,1]],4819],[1701,1,[[39,4],[38,67],[37,12],[36,5],[40,21]],4637],[1361,1,[[38,2],[36,112],[34,8],[33,8],[35,2]],6243],[509,1,[[37,4],[38,35],[40,5],[36,1]],3091],[467,1,[[35,1],[33,597],[38,0],[34,3]],4138],[67,1,[[34,1],[36,22],[35,1]],3253]]', '2016-10-21 05:00:00', 2, '2016-10-21 10:14:01');
INSERT INTO `uw_shop` VALUES (7270, 71003, 2, '[[1803,1,[[40,12],[36,5],[35,47],[33,13],[37,3]],6640],[981,1,[[35,191],[33,49],[36,2],[37,3],[40,6]],8209],[1421,1,[[39,4],[40,13],[36,6],[38,24],[37,4]],4041],[446,1,[[34,7],[33,18],[35,1],[36,70]],4569],[1701,1,[[39,3],[38,51],[36,2],[37,4],[40,6]],4318],[67,1,[[36,26],[34,1],[35,1]],3297]]', '2016-10-21 05:00:00', 0, '2016-10-21 12:37:41');
INSERT INTO `uw_shop` VALUES (7271, 71004, 2, '[[404,1,[[34,140],[33,7],[36,1],[37,2]],3318],[1809,1,[[38,1],[34,9],[35,5],[37,281],[39,3]],5271],[1807,1,[[33,871],[35,4],[38,2],[34,9],[36,6]],5724],[404,1,[[36,2],[33,14],[34,50],[37,2]],2976],[488,1,[[37,255],[38,0],[35,1],[39,1]],4050],[67,1,[[35,0],[36,33],[34,2]],3367]]', '2016-10-21 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7272, 71005, 2, '[[1061,1,[[36,5],[40,17],[38,51],[37,7],[39,3]],4393],[1381,1,[[38,3],[34,8],[33,1618],[35,2],[36,3]],6425],[1381,1,[[36,6],[34,10],[33,1245],[38,2],[35,5]],6113],[467,1,[[33,385],[34,3],[35,1],[38,1]],3939],[467,1,[[34,4],[38,1],[35,1],[33,531]],4089],[88,1,[[34,3],[33,194],[35,1]],3039]]', '2016-10-21 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7273, 71006, 2, '[[107,1,[[35,183],[33,19509],[34,148]],191818],[839,1,[[40,531],[38,465],[36,52],[37,178]],141737]]', '2016-10-23 05:00:00', 14, '2016-10-24 04:11:02');
INSERT INTO `uw_shop` VALUES (7274, 71315, 2, '[[1501,1,[[38,2],[33,1214],[36,3],[34,9],[35,5]],5010],[551,1,[[36,1],[35,61],[33,5],[40,3]],4418],[841,1,[[33,647],[34,6],[35,1],[38,1]],3385],[614,1,[[37,284],[38,1],[35,1],[39,1]],3592],[572,1,[[34,6],[36,106],[35,1],[33,7]],5742],[256,1,[[40,3],[38,19],[37,3]],2330]]', '2016-10-24 05:00:00', 0, NULL);
INSERT INTO `uw_shop` VALUES (7275, 71316, 2, '[[861,1,[[37,242],[35,1],[38,1],[39,1]],3466],[1541,1,[[39,3],[36,3],[37,13],[38,18],[40,4]],3921],[614,1,[[38,1],[39,3],[37,133],[35,1]],3157],[530,1,[[37,3],[33,12],[34,221],[36,1]],4494],[572,1,[[33,16],[36,39],[34,3],[35,1]],5002],[214,1,[[33,445],[34,2],[35,1]],2614]]', '2018-06-02 05:00:00', 1, '2018-06-02 18:10:54');
INSERT INTO `uw_shop` VALUES (7276, 71317, 2, '[[981,1,[[36,4],[35,182],[33,30],[37,5],[40,6]],8119],[1041,1,[[37,447],[39,4],[35,4],[34,3],[38,1]],5743],[781,1,[[38,1],[35,1],[33,422],[34,3]],3976],[1421,1,[[36,4],[40,11],[37,11],[38,19],[39,2]],3951],[130,1,[[37,2],[40,4],[38,20]],2343],[488,1,[[39,2],[35,1],[38,1],[37,84]],3559]]', '2019-01-10 05:00:00', 0, NULL);

-- ----------------------------
-- Table structure for uw_shop_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_shop_record`;
CREATE TABLE `uw_shop_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `userLvl` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  `userVip` int(11) NULL DEFAULT NULL COMMENT '用户vip',
  `costGold` int(11) NULL DEFAULT NULL COMMENT '消耗金币',
  `shopType` int(4) NULL DEFAULT NULL COMMENT '商店类型',
  `costDiamond` int(11) NULL DEFAULT NULL COMMENT '消耗元宝',
  `buyItemId` int(11) NULL DEFAULT NULL COMMENT '购买物品',
  `buyAmount` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `buyTime` datetime NULL DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 310 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-商店购买记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_shop_record
-- ----------------------------
INSERT INTO `uw_shop_record` VALUES (275, 71006, 200, 21, 5499100, 2, 0, 313020, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (276, 71006, 200, 21, 0, 2, 792, 412021, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (277, 71006, 200, 21, 0, 2, 792, 413021, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (278, 71006, 200, 21, 27495500, 2, 0, 414020, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (279, 71006, 200, 21, 0, 2, 792, 414021, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (280, 71006, 200, 21, 0, 2, 11424, 511020, 1, '2016-10-24 04:10:54');
INSERT INTO `uw_shop_record` VALUES (281, 71006, 200, 21, 5499100, 2, 0, 316020, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (282, 71006, 200, 21, 0, 2, 706, 412020, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (283, 71006, 200, 21, 0, 2, 792, 414021, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (284, 71006, 200, 21, 0, 2, 706, 415020, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (285, 71006, 200, 21, 0, 2, 792, 416021, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (286, 71006, 200, 21, 0, 2, 7140, 516020, 1, '2016-10-24 04:10:56');
INSERT INTO `uw_shop_record` VALUES (287, 71006, 200, 21, 5499100, 2, 0, 313020, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (288, 71006, 200, 21, 0, 2, 792, 412021, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (289, 71006, 200, 21, 0, 2, 792, 413021, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (290, 71006, 200, 21, 0, 2, 706, 414020, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (291, 71006, 200, 21, 0, 2, 706, 416020, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (292, 71006, 200, 21, 0, 2, 14280, 516020, 1, '2016-10-24 04:10:58');
INSERT INTO `uw_shop_record` VALUES (293, 71006, 200, 21, 8248600, 2, 0, 316021, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (294, 71006, 200, 21, 0, 2, 792, 412021, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (295, 71006, 200, 21, 0, 2, 706, 413020, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (296, 71006, 200, 21, 0, 2, 792, 413021, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (297, 71006, 200, 21, 27495500, 2, 0, 416020, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (298, 71006, 200, 21, 0, 2, 14280, 515020, 1, '2016-10-24 04:10:59');
INSERT INTO `uw_shop_record` VALUES (299, 71006, 200, 21, 8248600, 2, 0, 316021, 1, '2016-10-24 04:11:00');
INSERT INTO `uw_shop_record` VALUES (300, 71006, 200, 21, 0, 2, 706, 412020, 1, '2016-10-24 04:11:00');
INSERT INTO `uw_shop_record` VALUES (301, 71006, 200, 21, 27495500, 2, 0, 414020, 1, '2016-10-24 04:11:00');
INSERT INTO `uw_shop_record` VALUES (302, 71006, 200, 21, 41243000, 2, 792, 415021, 1, '2016-10-24 04:11:00');
INSERT INTO `uw_shop_record` VALUES (303, 71006, 200, 21, 0, 2, 11424, 514020, 1, '2016-10-24 04:11:00');
INSERT INTO `uw_shop_record` VALUES (304, 71006, 200, 21, 8248600, 2, 0, 314021, 1, '2016-10-24 04:11:04');
INSERT INTO `uw_shop_record` VALUES (305, 71006, 200, 21, 0, 2, 792, 412021, 1, '2016-10-24 04:11:04');
INSERT INTO `uw_shop_record` VALUES (306, 71006, 200, 21, 0, 2, 706, 413020, 1, '2016-10-24 04:11:04');
INSERT INTO `uw_shop_record` VALUES (307, 71006, 200, 21, 0, 2, 706, 414020, 1, '2016-10-24 04:11:04');
INSERT INTO `uw_shop_record` VALUES (308, 71006, 200, 21, 27495500, 2, 0, 416020, 1, '2016-10-24 04:11:04');
INSERT INTO `uw_shop_record` VALUES (309, 71006, 200, 21, 0, 2, 14280, 512020, 1, '2016-10-24 04:11:04');

-- ----------------------------
-- Table structure for uw_sys_red_envelope
-- ----------------------------
DROP TABLE IF EXISTS `uw_sys_red_envelope`;
CREATE TABLE `uw_sys_red_envelope`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT 0 COMMENT '发送者id,系统为0',
  `sendName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '系统' COMMENT '发送者名称',
  `redType` int(2) NULL DEFAULT 1 COMMENT '红包类型',
  `guildId` int(11) NULL DEFAULT NULL COMMENT '公会id',
  `spItemId` int(11) NULL DEFAULT NULL COMMENT '红包物品',
  `amount` int(11) NULL DEFAULT 0 COMMENT '物品数量',
  `viewAmount` int(11) NULL DEFAULT 0 COMMENT '显示数量',
  `personNum` int(4) NULL DEFAULT 0 COMMENT '人数',
  `wish` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '红包祝福',
  `limitZone` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '每人限额区间',
  `addTime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `isDeal` int(2) NULL DEFAULT 0 COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏触发（或后台发送的）的发送给玩家的红包' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_system_message
-- ----------------------------
DROP TABLE IF EXISTS `uw_system_message`;
CREATE TABLE `uw_system_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `serverId` int(11) NULL DEFAULT 0 COMMENT '默认为0，所有服务器',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '公告类型： \n1 marquee 跑马灯公告\n2 即时公告',
  `color` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#000000' COMMENT '字体颜色',
  `size` int(11) NULL DEFAULT 16 COMMENT '字体大小',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态0未发送，1已发送',
  `times` int(11) NULL DEFAULT 1 COMMENT '显示次数',
  `interval` int(11) NULL DEFAULT 60 COMMENT '间隔时间秒为单位',
  `sendTime` datetime NULL DEFAULT NULL,
  `expireTime` datetime NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `lastUpdateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_system_message
-- ----------------------------
INSERT INTO `uw_system_message` VALUES (3, 1, '测试后台公告', 1, '#FFFF00', 16, 0, 1, 60, '2016-10-20 21:14:00', '2016-10-21 15:14:00', '2016-11-24 22:00:00', NULL);
INSERT INTO `uw_system_message` VALUES (4, 1, '哈哈的哈桑费2', 1, '#000000', 16, 0, 1, 60, '2015-11-24 21:14:00', '2015-11-25 21:14:00', '2015-11-24 22:00:00', NULL);
INSERT INTO `uw_system_message` VALUES (5, 1, '爱上当发生打死', 1, '#120011', 16, 0, 1, 60, '2015-11-24 21:14:00', '2015-11-25 21:14:00', '2015-11-24 22:00:00', NULL);
INSERT INTO `uw_system_message` VALUES (6, 1, '测试阿萨德就爱傻傻的', 1, '#222211', 16, 0, 1, 60, '2015-11-24 21:14:00', '2015-11-25 21:14:00', '2015-11-24 22:00:00', NULL);
INSERT INTO `uw_system_message` VALUES (7, 1, '测试后台公告', 1, '#FFFF00', 16, 0, 1, 60, '2015-11-24 21:14:00', '2015-11-25 21:14:00', '2015-11-24 22:00:00', NULL);
INSERT INTO `uw_system_message` VALUES (8, 1, '测试后台公告', 1, '#FFFF00', 16, 0, 1, 60, '2015-12-12 22:16:00', '2015-12-27 21:14:00', '2015-12-12 22:16:00', NULL);
INSERT INTO `uw_system_message` VALUES (9, 1, 'qqqqqq2', 2, '2', 2, 2, 2, 2, '2016-03-01 19:16:37', NULL, '2016-03-01 19:41:09', '2016-03-01 19:16:36');

-- ----------------------------
-- Table structure for uw_task
-- ----------------------------
DROP TABLE IF EXISTS `uw_task`;
CREATE TABLE `uw_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `dailyTasks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日常任务。{\"任务id\":[完成数量,是否领取],\"任务id\":[完成数量,是否领取],.....}',
  `vitality` int(4) NULL DEFAULT 0 COMMENT '活跃度',
  `vitalityChests` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活跃度宝箱领取  【是否领取，是否领取，。。】 下标代表宝箱位置',
  `refreshTime` datetime NULL DEFAULT NULL COMMENT '日常数据最后修改时间',
  `tasks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成就任务。{\"任务子类型\":当前正在进行任务,\"任务子类型\":当前正在进行任务,.....}',
  `tasksValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成就任务完成数据  {\"子类型\":数量,\"子类型\":数量,...}',
  `doneTasks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '已领取的成就任务。 格式为[taskId1, taskId2]',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_task_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67900 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_task
-- ----------------------------
INSERT INTO `uw_task` VALUES (67896, 71006, '{\"2100001\":[0,0],\"2100002\":[0,0],\"2100003\":[0,0],\"2100004\":[1,0],\"2100005\":[0,0],\"2100006\":[0,0],\"2100007\":[0,0],\"2100008\":[0,0],\"2100009\":[0,0],\"2100010\":[3,0],\"2100011\":[0,0],\"2100012\":[0,0]}', 0, '[0,0,0]', '2016-10-24 04:11:35', '{\"0\":1000001,\"1\":1001001,\"2\":1002001,\"3\":1003001,\"4\":1004001,\"5\":1005001,\"6\":1006001,\"7\":1007001,\"8\":1008001,\"9\":1009001,\"10\":1010001,\"11\":1011001,\"12\":1012001,\"13\":1013001}', '{\"0\":0,\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0,\"7\":3,\"8\":0,\"9\":0,\"10\":2434926,\"11\":0,\"12\":0,\"13\":0}', '[]');
INSERT INTO `uw_task` VALUES (67897, 71315, '{\"2100001\":[0,0],\"2100002\":[0,0],\"2100003\":[0,0],\"2100004\":[0,0],\"2100005\":[0,0],\"2100006\":[0,0],\"2100007\":[0,0],\"2100008\":[0,0],\"2100009\":[0,0],\"2100010\":[0,0],\"2100011\":[0,0],\"2100012\":[0,0]}', 0, '[0,0,0]', NULL, '{\"0\":1000001,\"1\":1001001,\"2\":1002001,\"3\":1003001,\"4\":1004001,\"5\":1005001,\"6\":1006001,\"7\":1007001,\"8\":1008001,\"9\":1009001,\"10\":1010001,\"11\":1011001,\"12\":1012001,\"13\":1013001}', '{\"0\":4,\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0,\"7\":1,\"8\":0,\"9\":0,\"10\":247,\"11\":0,\"12\":0,\"13\":0}', '[]');
INSERT INTO `uw_task` VALUES (67898, 71316, '{\"2100001\":[0,0],\"2100002\":[0,0],\"2100003\":[9,0],\"2100004\":[0,0],\"2100005\":[0,0],\"2100006\":[0,0],\"2100007\":[0,0],\"2100008\":[0,0],\"2100009\":[0,0],\"2100010\":[0,0],\"2100011\":[0,0],\"2100012\":[0,0]}', 0, '[0,0,0]', '2018-06-02 18:10:40', '{\"0\":1000001,\"1\":1001001,\"2\":1002001,\"3\":1003001,\"4\":1004001,\"5\":1005001,\"6\":1006001,\"7\":1007001,\"8\":1008001,\"9\":1009001,\"10\":1010001,\"11\":1011001,\"12\":1012001,\"13\":1013001}', '{\"0\":12,\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":9,\"7\":1,\"8\":0,\"9\":0,\"10\":638,\"11\":0,\"12\":0,\"13\":0}', '[]');
INSERT INTO `uw_task` VALUES (67899, 71317, '{\"2100001\":[0,0],\"2100002\":[0,0],\"2100003\":[0,0],\"2100004\":[0,0],\"2100005\":[0,0],\"2100006\":[0,0],\"2100007\":[0,0],\"2100008\":[0,0],\"2100009\":[0,0],\"2100010\":[0,0],\"2100011\":[0,0],\"2100012\":[0,0]}', 0, '[0,0,0]', NULL, '{\"0\":1000001,\"1\":1001001,\"2\":1002001,\"3\":1003001,\"4\":1004001,\"5\":1005001,\"6\":1006001,\"7\":1007001,\"8\":1008001,\"9\":1009001,\"10\":1010001,\"11\":1011001,\"12\":1012001,\"13\":1013001}', '{\"0\":8,\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0,\"7\":1,\"8\":0,\"9\":0,\"10\":512,\"11\":0,\"12\":0,\"13\":0}', '[]');

-- ----------------------------
-- Table structure for uw_treasure
-- ----------------------------
DROP TABLE IF EXISTS `uw_treasure`;
CREATE TABLE `uw_treasure`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `userId` int(11) NULL DEFAULT NULL COMMENT '拥有者id',
  `treasureId` int(11) NULL DEFAULT NULL COMMENT '秘宝id',
  `openTime` datetime NULL DEFAULT NULL COMMENT '开启时间',
  `isOpen` int(2) NULL DEFAULT 1 COMMENT '是否有效',
  `items` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '开出物品',
  `isDelete` int(2) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秘宝信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_treasurerecord
-- ----------------------------
DROP TABLE IF EXISTS `uw_treasurerecord`;
CREATE TABLE `uw_treasurerecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `recordType` int(4) NULL DEFAULT NULL COMMENT '记录类型',
  `userId` int(11) NULL DEFAULT NULL COMMENT '玩家id',
  `guildName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公会名',
  `userVip` int(4) NULL DEFAULT NULL COMMENT 'vip等级',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '玩家名',
  `medalTitle` int(11) NULL DEFAULT NULL COMMENT '勋章称号',
  `treasureId` int(11) NULL DEFAULT NULL COMMENT '秘宝id',
  `items` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '掉落物品',
  `recordDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秘宝争夺记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_user
-- ----------------------------
DROP TABLE IF EXISTS `uw_user`;
CREATE TABLE `uw_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `accountId` int(11) NULL DEFAULT 0 COMMENT '账号id',
  `iconId` int(4) NULL DEFAULT NULL,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gold` int(11) UNSIGNED NULL DEFAULT 9999999 COMMENT '金币',
  `diamond` int(11) NULL DEFAULT 9999999 COMMENT '钻石',
  `giveDiamond` int(11) NULL DEFAULT 9999999 COMMENT '绑定钻石，即送的钻石',
  `buyDiamond` int(11) NULL DEFAULT 9999999 COMMENT '非绑定钻石，即购买的钻石',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级(不同于英雄等级)',
  `expc` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '经验',
  `combat` int(11) NULL DEFAULT 0 COMMENT '战力',
  `vip` int(4) NULL DEFAULT 10 COMMENT 'VIP等级',
  `vipScore` int(11) NULL DEFAULT 0 COMMENT 'VIP积分',
  `strength` int(4) NULL DEFAULT NULL,
  `strengthReTime` datetime NULL DEFAULT NULL,
  `signName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名',
  `honor` int(7) NULL DEFAULT 0 COMMENT '荣誉值',
  `bag` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '背包(只存放静态物品，格式：{\"物品id\":数量,\"物品id\":数量.............})',
  `equipBag` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '装备背包 {\"1\":[物品id,[随到的属性值],评价,是否穿戴],...}  \"1\":指定id,累加上去的',
  `equipBagBuyCount` int(4) NULL DEFAULT 0 COMMENT '装备背包购买次数',
  `honorData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '成就数据\n            {\"id\":[是否完成，是否领取],\"id\":[是否完成，是否领取],..........}',
  `blueDiamond` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '蓝钻标记，为一个对象，key为dsConsts.BlueDiamond中的定义',
  `sign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到数据,[签到次数,最近一次签到时间]',
  `activity` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '{\"活动id\":数据}\n            数据格式：\n            首充:[领取次数]，\n            七天登陆：[次数,次数...]\n            每日限购:[[次数,时间],[次数,时间]..........]\n            每日累充:[领取时间,领取时间,..........]\n            全部累充:[次数,次数..........]\n            每日消费:[领取时间,领取时间,..........]\n            全部消费:[次数,次数..........]\n            领主升级:[次数,次数..........]\n            \"-7\":[登陆次数] 7天登陆的数据\n            时间段限购:[次数,次数..........]',
  `record` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '记录数据',
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '刷新数据\n            {key:value}\n            具体看c_prop的userExData',
  `counts` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '今日次数列表，是一个数组，对应各自系统的次数。',
  `countsRefreshTime` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '今日次数列表刷新时间【】数组对应下标',
  `lastUpdateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `serverId` int(4) NULL DEFAULT NULL,
  `lastSkillTime` datetime NULL DEFAULT NULL COMMENT '最后点技能时间',
  `skillCd` int(7) NULL DEFAULT 0 COMMENT '技能CD',
  `isOpenPk` int(2) NULL DEFAULT 0 COMMENT '是否开启pk',
  `prestige` int(7) NULL DEFAULT 0 COMMENT '声望',
  `redPointData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '红点数据',
  `robotId` int(11) NULL DEFAULT 0 COMMENT '机器人id',
  `createTime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `sdkChannelId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sdk渠道号',
  `serverIndexId` int(11) NULL DEFAULT 0 COMMENT '服务器索引',
  `onlineLootData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在线掉落数据',
  `coffersPoints` int(11) NULL DEFAULT 0 COMMENT '国库累计积分',
  `todayCoffersPoints` int(11) NULL DEFAULT 0 COMMENT '国库每日积分',
  `medalTitle` int(11) NULL DEFAULT 0 COMMENT '勋章称号',
  `medalData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '勋章数据',
  `genuineQi` int(11) NULL DEFAULT 0 COMMENT '真气',
  `propertyData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性数据',
  `coffersKillNum` int(6) NULL DEFAULT 0 COMMENT '国库击杀人数',
  `isKing` int(2) NULL DEFAULT 0 COMMENT '是否霸主',
  `rebirthLvl` int(4) NULL DEFAULT 0 COMMENT '转生等级',
  `rebirthExp` bigint(11) NULL DEFAULT 0 COMMENT '转生经验',
  `isOpenIn` int(2) NULL DEFAULT 0,
  `infuseExpc` bigint(20) NULL DEFAULT 0,
  `highPaTa` int(4) NULL DEFAULT 0 COMMENT '通天塔最高层数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_user_aid`(`accountId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71318 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色，账号进入到每个服中扮演的角色。' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_user
-- ----------------------------
INSERT INTO `uw_user` VALUES (71006, 10511, 1, 's1.龙门工作室', 20612099, 99675751, 99675751, 99999999, 200, 0, 6499856, 21, 99999999, 0, NULL, NULL, 0, '{}', '{\"1\":[\"313020\",[[35,219],[36,711],[34,91]],166493,0],\"2\":[\"412021\",[[40,446],[33,1191],[35,2494],[36,50]],297917,0],\"3\":[\"413021\",[[35,180],[36,2975],[33,624],[34,229]],260139,0],\"4\":[\"414020\",[[35,119],[33,35520],[34,547],[38,18]],217142,0],\"5\":[\"414021\",[[35,204],[33,32114],[34,543],[38,69]],245558,0],\"6\":[\"511020\",[[34,18707],[36,480],[35,269],[33,1293],[37,336]],361816,1],\"7\":[\"316020\",[[38,1105],[37,118],[40,167]],122312,0],\"8\":[\"412020\",[[36,89],[35,2561],[33,391],[40,182]],258646,0],\"9\":[\"414021\",[[38,124],[34,466],[33,17455],[35,66]],229788,0],\"10\":[\"415020\",[[37,15484],[38,109],[35,53],[39,75]],215491,1],\"11\":[\"416021\",[[40,407],[38,878],[36,64],[37,215]],169592,0],\"12\":[\"516020\",[[38,5958],[40,1602],[39,269],[36,153],[37,252]],349854,1],\"13\":[\"313020\",[[34,300],[36,1775],[35,42]],177086,0],\"14\":[\"412021\",[[36,198],[35,1398],[33,388],[40,134]],285750,0],\"15\":[\"413021\",[[36,2141],[33,495],[34,272],[35,52]],249600,0],\"16\":[\"414020\",[[34,315],[35,104],[33,56509],[38,89]],237961,0],\"17\":[\"416020\",[[38,1907],[40,531],[37,418],[36,53]],161214,0],\"18\":[\"516020\",[[40,1602],[37,703],[38,2229],[36,140],[39,61]],300715,1],\"19\":[\"316021\",[[38,444],[37,131],[40,199]],132058,0],\"20\":[\"412021\",[[35,5226],[33,880],[36,145],[40,427]],328646,0],\"21\":[\"413020\",[[35,124],[33,1239],[36,2249],[34,208]],219530,0],\"22\":[\"413021\",[[36,5206],[33,729],[34,114],[35,44]],282829,1],\"23\":[\"416020\",[[40,464],[38,1255],[36,52],[37,86]],151530,0],\"24\":[\"515020\",[[34,742],[39,341],[35,297],[37,29969],[38,49]],415277,1],\"25\":[\"412020\",[[35,4662],[40,365],[33,271],[36,63]],281900,0],\"26\":[\"514020\",[[38,161],[34,782],[33,26489],[35,85],[36,103]],376100,1],\"27\":[\"412021\",[[35,3863],[33,703],[36,63],[40,159]],311770,0],\"28\":[\"413020\",[[34,531],[35,99],[36,1555],[33,462]],212136,0],\"29\":[\"414020\",[[35,144],[33,33905],[34,179],[38,19]],214343,0],\"30\":[\"512020\",[[40,1362],[36,312],[37,730],[35,4953],[33,940]],509790,1]}', 0, '{}', NULL, '[]', '{\"1070\":[324248]}', '{}', '{\"13\":[\"2016-10-23T20:09:16.712Z\"]}', '[2]', '[\"2016-10-23T20:11:05.304Z\"]', '2016-10-24 04:11:18', 1, NULL, 0, 1, 0, '{}', 0, '2016-10-24 04:07:06', NULL, 1, '[]', 0, 0, NULL, '{}', 210000, '{}', 0, 0, 4, 0, 1, 60447626, 0);
INSERT INTO `uw_user` VALUES (71007, 0, 3, 's1.宣柔', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71008, 0, 3, 's1.柏澜', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71009, 0, 3, 's1.庄烁', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71010, 0, 3, 's1.东清淑', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71011, 0, 3, 's1.赫娜兰', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71012, 0, 3, 's1.燕秀丽', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71013, 0, 3, 's1.融友珊', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71014, 0, 3, 's1.广淑篮', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71015, 0, 3, 's1.卫珍', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71016, 0, 3, 's1.项怜珊', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71017, 0, 3, 's1.景双', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71018, 0, 3, 's1.倪春', 0, 0, 0, 0, 3, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71019, 0, 5, 's1.郤念芹', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71020, 0, 5, 's1.农音景', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71021, 0, 5, 's1.浦海云', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71022, 0, 5, 's1.申屠好', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71023, 0, 5, 's1.翁翠安', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71024, 0, 5, 's1.柴珠', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71025, 0, 5, 's1.魏幼柏', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71026, 0, 5, 's1.范梦涵', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71027, 0, 5, 's1.贺丹扬', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71028, 0, 5, 's1.万希', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71029, 0, 5, 's1.隗妙', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71030, 0, 5, 's1.师洋然', 0, 0, 0, 0, 5, 0, 147, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 2, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71031, 0, 1, 's1.闫法琇芬', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71032, 0, 1, 's1.公冶璐', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71033, 0, 1, 's1.栾凡', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71034, 0, 1, 's1.樊亦寒', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71035, 0, 1, 's1.蒋惜萱', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71036, 0, 1, 's1.尚连姑', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71037, 0, 1, 's1.丰音景', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71038, 0, 1, 's1.毕冉冉', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71039, 0, 1, 's1.狄瑜然', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71040, 0, 1, 's1.盛皓洁', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71041, 0, 1, 's1.冀瑜然', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71042, 0, 1, 's1.步水桃', 0, 0, 0, 0, 4, 0, 164, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 3, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71043, 0, 4, 's1.禄乐生', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71044, 0, 4, 's1.佘光亮', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71045, 0, 4, 's1.崔永', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71046, 0, 4, 's1.牧楼', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71047, 0, 4, 's1.洪英逸', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71048, 0, 4, 's1.艾英逸', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71049, 0, 4, 's1.扈楼', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71050, 0, 4, 's1.云後郭', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71051, 0, 4, 's1.殳鸿波', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71052, 0, 4, 's1.蔺弘扬', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71053, 0, 4, 's1.尉迟华藏', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71054, 0, 4, 's1.项安康', 0, 0, 0, 0, 6, 0, 204, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 4, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71055, 0, 6, 's1.侯锐精', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71056, 0, 6, 's1.苗阳辉', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71057, 0, 6, 's1.何盛', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71058, 0, 6, 's1.有琴泰宁', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71059, 0, 6, 's1.闵阳曦', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71060, 0, 6, 's1.子宁', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71061, 0, 6, 's1.钱修竹', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71062, 0, 6, 's1.羿彭薄', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71063, 0, 6, 's1.赵建义', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71064, 0, 6, 's1.充和煦', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71065, 0, 6, 's1.吉崇', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71066, 0, 6, 's1.皇鸿哲', 0, 0, 0, 0, 8, 0, 246, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 5, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71067, 0, 4, 's1.申屠察', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71068, 0, 4, 's1.贡狐生', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71069, 0, 4, 's1.方鸿朗', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71070, 0, 4, 's1.熊沧', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71071, 0, 4, 's1.毋安宁', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71072, 0, 4, 's1.闵玉宸', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71073, 0, 4, 's1.农庐', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71074, 0, 4, 's1.胥锐志', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71075, 0, 4, 's1.阳佟文康', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71076, 0, 4, 's1.燕凯风', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71077, 0, 4, 's1.禄弘毅', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71078, 0, 4, 's1.劳古', 0, 0, 0, 0, 7, 0, 225, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 6, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71079, 0, 6, 's1.别理全', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71080, 0, 6, 's1.师玉宇', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71081, 0, 6, 's1.伏祺然', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71082, 0, 6, 's1.牧高义', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71083, 0, 6, 's1.季文光', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71084, 0, 6, 's1.谯笪温瑜', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71085, 0, 6, 's1.裴祺祥', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71086, 0, 6, 's1.边朋义', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71087, 0, 6, 's1.宣飞掣', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71088, 0, 6, 's1.鞠正诚', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71089, 0, 6, 's1.车巴', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71090, 0, 6, 's1.邢飞英', 0, 0, 0, 0, 9, 0, 271, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 7, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71091, 0, 4, 's1.尹蕴藉', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71092, 0, 4, 's1.宰逸仙', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71093, 0, 4, 's1.谷粱山', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71094, 0, 4, 's1.詹锐精', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71095, 0, 4, 's1.鲜于屠兵', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71096, 0, 4, 's1.陈立果', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71097, 0, 4, 's1.公德业', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71098, 0, 4, 's1.徐茂实', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71099, 0, 4, 's1.扈嘉许', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71100, 0, 4, 's1.柏玉宇', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71101, 0, 4, 's1.乜祺然', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71102, 0, 4, 's1.韩锐利', 0, 0, 0, 0, 10, 0, 297, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 8, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71103, 0, 3, 's1.东门薇', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71104, 0, 3, 's1.夏兰馨', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71105, 0, 3, 's1.耿代芹', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71106, 0, 3, 's1.裴呤', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71107, 0, 3, 's1.蒋悦心', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71108, 0, 3, 's1.晋楚友珊', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71109, 0, 3, 's1.邹良妙', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71110, 0, 3, 's1.别桂华', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71111, 0, 3, 's1.李彦芝', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71112, 0, 3, 's1.廉菱', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71113, 0, 3, 's1.薛千秋', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71114, 0, 3, 's1.刁茹婧', 0, 0, 0, 0, 12, 0, 352, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 9, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71115, 0, 1, 's1.后雪漫', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71116, 0, 1, 's1.朱亦', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71117, 0, 1, 's1.夏侯洛妃', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71118, 0, 1, 's1.巢静程', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71119, 0, 1, 's1.诸洛妃', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71120, 0, 1, 's1.浦玉', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71121, 0, 1, 's1.粱沛白', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71122, 0, 1, 's1.廉惜玉', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71123, 0, 1, 's1.公良冷卉', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71124, 0, 1, 's1.昌月桃', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71125, 0, 1, 's1.韦容', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71126, 0, 1, 's1.蔺静程', 0, 0, 0, 0, 13, 0, 382, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 10, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71127, 0, 5, 's1.寇宛凝', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71128, 0, 5, 's1.师雁菱', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71129, 0, 5, 's1.山青梦', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71130, 0, 5, 's1.连 寻', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71131, 0, 5, 's1.巫马柳', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71132, 0, 5, 's1.南法芝', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71133, 0, 5, 's1.皇冬灵', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71134, 0, 5, 's1.詹兰', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71135, 0, 5, 's1.庄姹', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71136, 0, 5, 's1.胥卿云', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71137, 0, 5, 's1.厉飞荷', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71138, 0, 5, 's1.郤千秋', 0, 0, 0, 0, 11, 0, 326, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 11, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71139, 0, 2, 's1.子浩邈', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71140, 0, 2, 's1.傅乐童', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71141, 0, 2, 's1.宋文石', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71142, 0, 2, 's1.南永宁', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71143, 0, 2, 's1.岑景天', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71144, 0, 2, 's1.鞠兴生', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71145, 0, 2, 's1.谯笪天佑', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71146, 0, 2, 's1.柳俊杰', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71147, 0, 2, 's1.勾宏峻', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71148, 0, 2, 's1.朱自明', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71149, 0, 2, 's1.郑景曜', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71150, 0, 2, 's1.阮易', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 12, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71151, 0, 3, 's1.翟秋莲', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71152, 0, 3, 's1.全曼香', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71153, 0, 3, 's1.冷琇芬', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71154, 0, 3, 's1.纪园', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71155, 0, 3, 's1.能雅隽', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71156, 0, 3, 's1.刁翠安', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71157, 0, 3, 's1.伏幻', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71158, 0, 3, 's1.终新烟', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71159, 0, 3, 's1.闻人南风', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71160, 0, 3, 's1.粱兰馨', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71161, 0, 3, 's1.庄天籁', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71162, 0, 3, 's1.皇香露', 0, 0, 0, 0, 14, 0, 417, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 13, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71163, 0, 2, 's1.仉子晋', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71164, 0, 2, 's1.董翔飞', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71165, 0, 2, 's1.邹和玉', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71166, 0, 2, 's1.牧鹏程', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71167, 0, 2, 's1.井白', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71168, 0, 2, 's1.贝高义', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71169, 0, 2, 's1.双德明', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71170, 0, 2, 's1.曾後郭', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71171, 0, 2, 's1.闻顺', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71172, 0, 2, 's1.宿烨煜', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71173, 0, 2, 's1.宗政永安', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71174, 0, 2, 's1.巫马景曜', 0, 0, 0, 0, 15, 0, 451, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 14, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71175, 0, 2, 's1.邬佴新', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71176, 0, 2, 's1.隆阴', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71177, 0, 2, 's1.颛尧', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71178, 0, 2, 's1.鲁义', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71179, 0, 2, 's1.慕乐容', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71180, 0, 2, 's1.雍临', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71181, 0, 2, 's1.颛驷彪', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71182, 0, 2, 's1.车南', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71183, 0, 2, 's1.皮嘉禧', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71184, 0, 2, 's1.年爱志尚', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71185, 0, 2, 's1.元飞掣', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71186, 0, 2, 's1.逄嘉平', 0, 0, 0, 0, 17, 0, 527, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 15, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71187, 0, 2, 's1.周政蒙', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71188, 0, 2, 's1.上里兴', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71189, 0, 2, 's1.邢越泽', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71190, 0, 2, 's1.施高寒', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71191, 0, 2, 's1.端佺', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71192, 0, 2, 's1.彭光启', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71193, 0, 2, 's1.轩辕和洽', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71194, 0, 2, 's1.阳佟满', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71195, 0, 2, 's1.班子晋', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71196, 0, 2, 's1.尤阳曦', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71197, 0, 2, 's1.敖昊焱', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71198, 0, 2, 's1.甘锐利', 0, 0, 0, 0, 16, 0, 487, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 16, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71199, 0, 4, 's1.纪鹏运', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71200, 0, 4, 's1.屈兴生', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71201, 0, 4, 's1.雍驷彪', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71202, 0, 4, 's1.田德业', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71203, 0, 4, 's1.弘天磊', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71204, 0, 4, 's1.壤镇', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71205, 0, 4, 's1.双乐欣', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71206, 0, 4, 's1.侯庆', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71207, 0, 4, 's1.栾树', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71208, 0, 4, 's1.娄正信', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71209, 0, 4, 's1.尚宇', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71210, 0, 4, 's1.鲜于尧', 0, 0, 0, 0, 18, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 17, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71211, 0, 1, 's1.越映秋', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71212, 0, 1, 's1.柴好慕', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71213, 0, 1, 's1.罗凡梦', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71214, 0, 1, 's1.巢婷', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71215, 0, 1, 's1.钟卿云', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71216, 0, 1, 's1.麻飘', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71217, 0, 1, 's1.贺霭', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71218, 0, 1, 's1.田霏', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71219, 0, 1, 's1.牛飞槐', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71220, 0, 1, 's1.牧青', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71221, 0, 1, 's1.农海云', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71222, 0, 1, 's1.国忆雪', 0, 0, 0, 0, 21, 0, 746, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 18, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71223, 0, 6, 's1.詹宏畅', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71224, 0, 6, 's1.伏辛', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71225, 0, 6, 's1.夏鸿羲', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71226, 0, 6, 's1.苗宇', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71227, 0, 6, 's1.连 无', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71228, 0, 6, 's1.壤高杰', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71229, 0, 6, 's1.利古', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71230, 0, 6, 's1.瞿宏阔', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71231, 0, 6, 's1.应心思', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71232, 0, 6, 's1.有琴旭', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71233, 0, 6, 's1.梅俊名', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71234, 0, 6, 's1.滑博容', 0, 0, 0, 0, 19, 0, 610, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 19, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71235, 0, 3, 's1.闫法波', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71236, 0, 3, 's1.殴曼婉', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71237, 0, 3, 's1.禹幼柏', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71238, 0, 3, 's1.南沛岚', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71239, 0, 3, 's1.吴柔', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71240, 0, 3, 's1.郎修雅', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71241, 0, 3, 's1.洪 婕', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71242, 0, 3, 's1.濮音景', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71243, 0, 3, 's1.从雅洁', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71244, 0, 3, 's1.皇香卉', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71245, 0, 3, 's1.陆若烟', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71246, 0, 3, 's1.任秀媚', 0, 0, 0, 0, 20, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 20, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71247, 0, 3, 's1.子雪旋', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71248, 0, 3, 's1.柳毓', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71249, 0, 3, 's1.方娜', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71250, 0, 3, 's1.朱冰绿', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71251, 0, 3, 's1.祖如曼', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71252, 0, 3, 's1.杜思雁', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71253, 0, 3, 's1.公良娉', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71254, 0, 3, 's1.利春', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71255, 0, 3, 's1.昌青易', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71256, 0, 3, 's1.戎静', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71257, 0, 3, 's1.郁妍', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71258, 0, 3, 's1.令狐寒云', 0, 0, 0, 0, 22, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 21, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71259, 0, 5, 's1.皇筠', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71260, 0, 5, 's1.谯笪静丹', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71261, 0, 5, 's1.满澜', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71262, 0, 5, 's1.路春梅', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71263, 0, 5, 's1.乌荣', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71264, 0, 5, 's1.易甘泽', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71265, 0, 5, 's1.暴春梅', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71266, 0, 5, 's1.乐淑慧', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71267, 0, 5, 's1.咸曼婉', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71268, 0, 5, 's1.籍莞然', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71269, 0, 5, 's1.弘卿云', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71270, 0, 5, 's1.闫莞尔', 0, 0, 0, 0, 23, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 22, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71271, 0, 4, 's1.百里承', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71272, 0, 4, 's1.娄廊', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71273, 0, 4, 's1.褚旭', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71274, 0, 4, 's1.凌弘壮', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71275, 0, 4, 's1.周都', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71276, 0, 4, 's1.危商', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71277, 0, 4, 's1.慕容蕴和', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71278, 0, 4, 's1.支旭', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71279, 0, 4, 's1.牛良材', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71280, 0, 4, 's1.裴都', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71281, 0, 4, 's1.姚鸿哲', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71282, 0, 4, 's1.衡成益', 0, 0, 0, 0, 25, 0, 850, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 23, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71283, 0, 3, 's1.周囡', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71284, 0, 3, 's1.扈丹琴', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71285, 0, 3, 's1.屈怡木', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71286, 0, 3, 's1.符安彤', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71287, 0, 3, 's1.燕菱', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71288, 0, 3, 's1.桂妙梦', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71289, 0, 3, 's1.贺莞尔', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71290, 0, 3, 's1.陈松雨', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71291, 0, 3, 's1.鄂珍', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71292, 0, 3, 's1.艾曼婉', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71293, 0, 3, 's1.吕听枫', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71294, 0, 3, 's1.仉督桃', 0, 0, 0, 0, 24, 0, 906, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 24, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71295, 0, 6, 's1.殳蕴和', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71296, 0, 6, 's1.夏侯东', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71297, 0, 6, 's1.贝烨赫', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71298, 0, 6, 's1.祁元', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71299, 0, 6, 's1.于欣荣', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71300, 0, 6, 's1.薛龙', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71301, 0, 6, 's1.戎德寿', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71302, 0, 6, 's1.田兴怀', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71303, 0, 6, 's1.仲孙绥', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71304, 0, 6, 's1.上承', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71305, 0, 6, 's1.禹涵畅', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71306, 0, 6, 's1.索心思', 0, 0, 0, 0, 26, 0, 1032, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 25, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71307, 0, 3, 's1.粱沛春', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71308, 0, 3, 's1.段珠', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71309, 0, 3, 's1.牛冰绿', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71310, 0, 3, 's1.蔡甘泽', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71311, 0, 3, 's1.浦珍', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71312, 0, 3, 's1.褚莉莉', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71313, 0, 3, 's1.寿慧雅', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71314, 0, 3, 's1.郦沛', 0, 0, 0, 0, 27, 0, 1100, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 26, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71315, 10512, 3, 's1.龙门出品', 180, 0, 0, 0, 4, 278, 247, 0, 0, 0, NULL, NULL, 0, '{}', '{\"1\":[212001,[[35,27],[33,8]],2389,0],\"2\":[212001,[[35,31],[33,4]],2429,0],\"3\":[232001,[[33,3],[35,9]],1823,0],\"4\":[222001,[[35,30],[33,9]],2060,0]}', 0, '{}', NULL, '[]', '{}', '{}', '{}', '[]', '[]', '2016-10-24 16:05:35', 1, NULL, 0, 0, 0, '{}', 0, '2016-10-24 16:04:11', NULL, 1, '[]', 0, 0, NULL, '{}', 0, '{}', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71316, 10513, 4, 's1.俟寻', 3415, 0, 0, 0, 12, 844, 638, 0, 0, 0, NULL, NULL, 0, '{\"18\":16}', '{\"2\":[232001,[[35,10],[33,3]],1834,0],\"3\":[232001,[[35,38],[33,6]],2145,0],\"4\":[212001,[[35,26],[33,3]],2373,0],\"5\":[212001,[[33,4],[35,14]],2242,0],\"6\":[232001,[[35,24],[33,8]],1993,0],\"7\":[222001,[[35,29],[33,3]],2043,0],\"8\":[232001,[[35,10],[33,6]],1837,0],\"9\":[212001,[[33,6],[35,24]],2354,0],\"18\":[222001,[[35,38],[33,9]],2148,0],\"19\":[232001,[[33,3],[35,17]],1911,0],\"20\":[222001,[[33,6],[35,12]],1859,0],\"21\":[222001,[[33,4],[35,14]],1879,0],\"22\":[232001,[[35,35],[33,8]],2114,0],\"23\":[212001,[[35,14],[33,6]],2244,0],\"24\":[222001,[[35,26],[33,3]],2010,0],\"25\":[212001,[[35,37],[33,3]],2494,0],\"26\":[212001,[[35,31],[33,6]],2431,0],\"27\":[212001,[[35,46],[33,3]],2593,0],\"28\":[232001,[[35,9],[33,9]],1829,0],\"29\":[212001,[[35,40],[33,5]],2529,0],\"30\":[232001,[[35,16],[33,4]],1901,0],\"31\":[232001,[[35,21],[33,3]],1955,0],\"32\":[232001,[[33,4],[35,38]],2143,0],\"33\":[222001,[[35,33],[33,6]],2090,0],\"34\":[222001,[[33,6],[35,13]],1870,0],\"35\":[222001,[[33,5],[35,19]],1935,0],\"36\":[232001,[[35,9],[33,3]],1823,0],\"37\":[232001,[[35,18],[33,3]],1922,0],\"38\":[212001,[[33,9],[35,40]],2533,0],\"39\":[212001,[[33,2],[35,10]],2196,0],\"40\":[232001,[[35,19],[33,5]],1935,0],\"41\":[232001,[[35,18],[33,5]],1924,0],\"42\":[232001,[[35,38],[33,4]],2143,0],\"43\":[222001,[[35,21],[33,5]],1957,0],\"44\":[232001,[[35,35],[33,5]],2111,0],\"45\":[222001,[[33,4],[35,15]],1890,0],\"46\":[232001,[[35,13],[33,5]],1869,0],\"47\":[212001,[[33,6],[35,22]],2332,0],\"48\":[232001,[[33,2],[35,38]],2141,0],\"49\":[232001,[[33,7],[35,15]],1893,0],\"50\":[212001,[[33,2],[35,22]],2328,0],\"51\":[222001,[[35,19],[33,4]],1934,0],\"52\":[232001,[[35,11],[33,5]],1847,0],\"53\":[222001,[[33,7],[35,19]],1937,0],\"54\":[222001,[[35,24],[33,7]],1992,0],\"55\":[212001,[[33,9],[35,27]],2390,0],\"56\":[222001,[[35,19],[33,5]],1935,0],\"57\":[212001,[[35,27],[33,5]],2386,0],\"58\":[212001,[[33,5],[35,25]],2364,0],\"59\":[212001,[[35,29],[33,4]],2407,0],\"60\":[222001,[[35,15],[33,5]],1891,0],\"61\":[222001,[[35,12],[33,5]],1858,0],\"62\":[321001,[[34,81],[36,0],[33,5]],2446,0],\"63\":[222001,[[35,24],[33,5]],1990,0],\"64\":[222001,[[35,29],[33,7]],2047,0],\"65\":[212001,[[35,25],[33,4]],2363,0],\"66\":[232001,[[35,13],[33,3]],1867,0],\"67\":[222001,[[33,3],[35,19]],1933,0],\"68\":[232001,[[33,5],[35,22]],1968,0],\"69\":[232001,[[35,38],[33,6]],2145,0],\"70\":[222001,[[35,12],[33,4]],1857,0],\"71\":[232001,[[33,8],[35,9]],1828,0],\"72\":[232001,[[35,18],[33,4]],1923,0],\"73\":[232001,[[33,3],[35,19]],1933,0],\"74\":[222001,[[33,4],[35,10]],1835,0],\"75\":[232001,[[33,7],[35,9]],1827,0],\"76\":[222001,[[35,19],[33,3]],1933,0],\"77\":[212001,[[35,44],[33,4]],2572,0],\"78\":[222001,[[33,7],[35,20]],1948,0],\"79\":[232001,[[35,35],[33,7]],2113,0],\"80\":[222001,[[33,6],[35,17]],1914,0],\"81\":[222001,[[33,6],[35,22]],1969,0],\"82\":[212001,[[35,16],[33,7]],2267,0],\"83\":[212001,[[35,39],[33,3]],2516,0],\"84\":[222001,[[35,21],[33,3]],1955,0],\"85\":[222001,[[33,8],[35,13]],1872,0],\"86\":[232001,[[35,30],[33,5]],2056,0],\"87\":[222001,[[33,3],[35,18]],1922,0],\"88\":[212001,[[35,22],[33,4]],2330,0],\"89\":[232001,[[35,36],[33,8]],2125,0],\"90\":[222001,[[33,7],[35,12]],1860,0],\"91\":[212001,[[35,29],[33,4]],2407,0],\"92\":[212001,[[35,26],[33,4]],2374,0],\"93\":[222001,[[33,5],[35,23]],1979,0],\"94\":[222001,[[35,30],[33,5]],2056,0],\"95\":[322001,[[33,8],[35,18],[36,1]],2385,1],\"96\":[212001,[[35,16],[33,4]],2264,0],\"97\":[212001,[[33,2],[35,13]],2229,0],\"98\":[232001,[[33,7],[35,9]],1827,0],\"99\":[222001,[[33,6],[35,30]],2057,0],\"100\":[212001,[[35,11],[33,3]],2208,0],\"101\":[212001,[[33,8],[35,31]],2433,0],\"102\":[212001,[[33,6],[35,42]],2552,0],\"103\":[222001,[[33,8],[35,22]],1971,0],\"104\":[232001,[[33,6],[35,15]],1892,0],\"105\":[212001,[[35,14],[33,3]],2241,0],\"106\":[232001,[[35,21],[33,3]],1955,0],\"107\":[321001,[[34,141],[33,5],[36,1]],2697,0],\"108\":[212001,[[33,8],[35,17]],2279,0],\"109\":[232001,[[33,5],[35,18]],1924,0],\"110\":[232001,[[35,11],[33,3]],1845,0],\"111\":[232001,[[35,33],[33,4]],2088,0],\"112\":[222001,[[35,17],[33,6]],1914,0],\"113\":[232001,[[33,7],[35,21]],1959,0],\"114\":[222001,[[35,10],[33,7]],1838,0],\"115\":[232001,[[35,36],[33,3]],2120,0],\"116\":[212001,[[33,4],[35,10]],2198,0],\"117\":[212001,[[35,39],[33,3]],2516,0],\"118\":[222001,[[35,36],[33,4]],2121,0],\"119\":[222001,[[33,6],[35,12]],1859,0],\"120\":[222001,[[35,21],[33,2]],1954,0],\"121\":[212001,[[33,8],[35,21]],2323,0],\"122\":[222001,[[35,29],[33,5]],2045,0]}', 0, '{}', NULL, '[]', '{}', '{}', '{\"1\":\"10004_10000\"}', '[]', '[]', '2018-06-02 18:10:01', 1, NULL, 0, 1, 0, '{}', 0, '2018-06-02 18:02:40', NULL, 1, '[]', 0, 0, NULL, '{}', 0, '{}', 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `uw_user` VALUES (71317, 10514, 1, 's1.祖彭祖', 1137, 0, 0, 0, 8, 531, 512, 0, 0, 0, NULL, NULL, 0, '{}', '{\"1\":[232001,[[33,3],[35,9]],1823,0],\"2\":[222001,[[35,16],[33,5]],1902,0],\"3\":[222001,[[35,15],[33,4]],1890,0],\"4\":[222001,[[33,7],[35,18]],1926,0],\"5\":[311001,[[33,7],[34,56],[36,1]],1847,1],\"6\":[222001,[[33,3],[35,22]],1966,0],\"7\":[212001,[[33,2],[35,19]],2295,0],\"8\":[232001,[[33,2],[35,17]],1910,0],\"9\":[222001,[[33,4],[35,32]],2077,0],\"10\":[232001,[[33,7],[35,18]],1926,0],\"11\":[212001,[[35,37],[33,3]],2494,0],\"12\":[212001,[[35,35],[33,3]],2472,0],\"13\":[222001,[[35,19],[33,3]],1933,0],\"14\":[222001,[[35,33],[33,4]],2088,0],\"15\":[232001,[[33,4],[35,36]],2121,0],\"16\":[222001,[[35,13],[33,6]],1870,0],\"17\":[222001,[[33,4],[35,30]],2055,0],\"18\":[222001,[[35,18],[33,4]],1923,0],\"19\":[222001,[[35,13],[33,8]],1872,0],\"20\":[232001,[[35,36],[33,3]],2120,0],\"21\":[232001,[[35,15],[33,5]],1891,0],\"22\":[222001,[[33,6],[35,22]],1969,0],\"23\":[212001,[[33,6],[35,12]],2222,0],\"24\":[212001,[[33,5],[35,20]],2309,0],\"25\":[212001,[[35,27],[33,5]],2386,0],\"26\":[311001,[[34,45],[33,4],[36,1]],1800,0],\"27\":[212001,[[35,11],[33,6]],2211,0],\"28\":[212001,[[35,35],[33,6]],2475,0],\"29\":[232001,[[33,3],[35,17]],1911,0],\"30\":[212001,[[35,42],[33,5]],2551,0],\"31\":[212001,[[33,7],[35,11]],2212,0],\"32\":[212001,[[35,16],[33,6]],2266,0],\"33\":[222001,[[33,6],[35,14]],1881,0],\"34\":[222001,[[35,12],[33,5]],1858,0],\"35\":[232001,[[33,2],[35,24]],1987,0],\"36\":[212001,[[35,40],[33,4]],2528,0]}', 0, '{}', NULL, '[]', '{}', '{}', '{\"1\":\"10002_0\"}', '[]', '[]', '2019-01-10 20:46:06', 1, NULL, 0, 0, 0, '{}', 0, '2019-01-10 20:41:47', NULL, 1, '[]', 0, 0, NULL, '{}', 0, '{}', 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for uw_user_bak
-- ----------------------------
DROP TABLE IF EXISTS `uw_user_bak`;
CREATE TABLE `uw_user_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `accountId` int(11) NULL DEFAULT 0 COMMENT '账号id',
  `iconId` int(4) NULL DEFAULT NULL,
  `nickName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `lvl` int(4) NULL DEFAULT 0 COMMENT '等级(不同于英雄等级)',
  `expc` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '经验',
  `combat` int(11) NULL DEFAULT 0 COMMENT '战力',
  `vip` int(4) NULL DEFAULT 0 COMMENT 'VIP等级',
  `vipScore` int(11) NULL DEFAULT 0 COMMENT 'VIP积分',
  `exData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '刷新数据\n            {key:value}\n            具体看c_prop的userExData',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_user_aid`(`accountId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色，账号进入到每个服中扮演的角色。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `uw_user_coupon`;
CREATE TABLE `uw_user_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `codeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兑换码批次',
  `userId` int(11) NOT NULL COMMENT '玩家id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏-用户兑换码(UserCouponEntity)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for uw_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `uw_user_rank`;
CREATE TABLE `uw_user_rank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排名',
  `userId` int(11) NULL DEFAULT NULL COMMENT '领主id',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领主名称',
  `iconId` int(4) NULL DEFAULT NULL,
  `userLvl` int(11) NULL DEFAULT NULL COMMENT '英雄id',
  `blueDiamond` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '蓝钻标记',
  `rankValue` int(11) NULL DEFAULT 0 COMMENT '排名数值',
  `rankType` int(11) NULL DEFAULT 0 COMMENT '排名类型',
  `pkWinCount` int(11) NULL DEFAULT NULL COMMENT '英雄等级',
  `combat` int(11) NULL DEFAULT NULL COMMENT '战力',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uw_user_rank_uid`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户排行榜' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uw_user_rank
-- ----------------------------
INSERT INTO `uw_user_rank` VALUES (1, 71006, 's1.龙门工作室', 1, 200, '', 200, 1, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (2, 71316, 's1.俟寻', 4, 12, '', 12, 1, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (3, 71315, 's1.龙门出品', 3, 4, '', 4, 1, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (4, 71006, 's1.龙门工作室', 1, 200, '', 6499856, 2, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (5, 71316, 's1.俟寻', 4, 12, '', 638, 2, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (6, 71315, 's1.龙门出品', 3, 4, '', 247, 2, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (7, 71006, 's1.龙门工作室', 1, 200, '', 23, 4, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (8, 71316, 's1.俟寻', 4, 12, '', 0, 5, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (9, 71006, 's1.龙门工作室', 1, 200, '', 0, 5, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (11, 71006, 's1.龙门工作室', 1, 200, '', 2434926, 7, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (12, 71006, 's1.龙门工作室', 1, 200, '', 2032445, 8, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (13, 71316, 's1.俟寻', 4, 12, '', 638, 8, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (14, 71315, 's1.龙门出品', 3, 4, '', 247, 8, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (15, 71006, 's1.龙门工作室', 1, 200, '', 2032485, 9, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (16, 71006, 's1.龙门工作室', 1, 200, '', 0, 13, 21, NULL);
INSERT INTO `uw_user_rank` VALUES (17, 71316, 's1.俟寻', 4, 12, '', 0, 13, 0, NULL);
INSERT INTO `uw_user_rank` VALUES (18, 71315, 's1.龙门出品', 3, 4, '', 0, 13, 0, NULL);

-- ----------------------------
-- Table structure for uw_usersurvey_record
-- ----------------------------
DROP TABLE IF EXISTS `uw_usersurvey_record`;
CREATE TABLE `uw_usersurvey_record`  (
  `id` int(11) NOT NULL COMMENT '序号',
  `serverId` int(11) NOT NULL COMMENT '服务器id',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `userLvl` int(11) NULL DEFAULT NULL COMMENT '用户等级',
  `userVip` int(11) NULL DEFAULT NULL COMMENT '用户vip等级',
  `activityId` int(11) NULL DEFAULT NULL COMMENT '活动id',
  `questionId` int(11) NULL DEFAULT NULL COMMENT '题目id',
  `selectIndex` int(4) NULL DEFAULT NULL COMMENT '玩家选择',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主-用户调研(UserSurveyEntity)' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
