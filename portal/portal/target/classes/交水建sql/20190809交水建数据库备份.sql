/*
 Navicat Premium Data Transfer

 Source Server         : JQjinjian
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : xboot

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 09/08/2019 09:27:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for njp_test
-- ----------------------------
DROP TABLE IF EXISTS `njp_test`;
CREATE TABLE `njp_test`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of njp_test
-- ----------------------------
INSERT INTO `njp_test` VALUES (1, '倪建平', '1', 24, 'dasd@qq.com', '12313');
INSERT INTO `njp_test` VALUES (2, '大萨达', '2', 321, '321', '321');
INSERT INTO `njp_test` VALUES (3, '嘻嘻嘻', '1', 32, '312312', '312');
INSERT INTO `njp_test` VALUES (4, '3213', '3213', 3213, '321', '321');
INSERT INTO `njp_test` VALUES (5, '321', '321', 321, '321', '321');
INSERT INTO `njp_test` VALUES (6, '321', '321', 321, '321', '321');
INSERT INTO `njp_test` VALUES (7, '321', '321', 321, '321', '321');
INSERT INTO `njp_test` VALUES (8, '321', '321', 321, '321', '321');
INSERT INTO `njp_test` VALUES (9, '321', '321', 321, '312', '321');
INSERT INTO `njp_test` VALUES (10, '321', '321', 321, '321', '321');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_code
-- ----------------------------
DROP TABLE IF EXISTS `system_code`;
CREATE TABLE `system_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_cod` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统类型',
  `sys_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统名字',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `s_cod`(`sys_cod`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_code
-- ----------------------------
INSERT INTO `system_code` VALUES (1, 'OA', 'OA');
INSERT INTO `system_code` VALUES (2, 'CW', '财务');
INSERT INTO `system_code` VALUES (3, 'QT', '其他');

-- ----------------------------
-- Table structure for system_info
-- ----------------------------
DROP TABLE IF EXISTS `system_info`;
CREATE TABLE `system_info`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sys_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '网址',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改者',
  `del_flag` int(11) DEFAULT NULL COMMENT '状态',
  `sys_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统代码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `子系统类型`(`sys_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_info
-- ----------------------------
INSERT INTO `system_info` VALUES ('1', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, 'OA');
INSERT INTO `system_info` VALUES ('10', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('11', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('12', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('13', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('14', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('15', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('16', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('161670364848459776', NULL, '9879', '9879', NULL, '2019-07-11 17:12:40', '2019-07-11 17:12:40', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161670995650809856', '', 'hey', 'www.baidu.com', NULL, '2019-07-11 17:15:10', '2019-07-11 17:15:10', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161671832393486336', NULL, '312321', '3213213', NULL, '2019-07-11 17:18:30', '2019-07-11 17:18:30', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161673394012557312', NULL, '312321', '3213213', NULL, '2019-07-11 17:24:42', '2019-07-11 17:24:42', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161673453483593728', NULL, '312321', '3213213', NULL, '2019-07-11 17:24:56', '2019-07-11 17:24:56', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161677971650777088', NULL, 'dsaljdlsa', 'dsadsadasdas', NULL, '2019-07-11 17:42:53', '2019-07-11 17:42:53', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161678801858727936', NULL, 'dsaljdlsa', 'dsadsadasdas', NULL, '2019-07-11 17:46:11', '2019-07-11 17:46:11', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161679033350754304', NULL, 'dsaljdlsa', 'dsadsadasdas', NULL, '2019-07-11 17:47:06', '2019-07-11 17:47:06', NULL, 0, NULL);
INSERT INTO `system_info` VALUES ('161681350133288960', '', '+2+2', '651561', NULL, '2019-07-11 17:56:19', '2019-07-11 17:56:19', NULL, 0, 'OA');
INSERT INTO `system_info` VALUES ('161682608973942784', '6161', '65165', '651651', NULL, '2019-07-11 18:01:19', '2019-07-11 18:01:19', NULL, 0, 'OA');
INSERT INTO `system_info` VALUES ('161947630241320960', '百度链接', '百度', 'www.baidu.com', NULL, '2019-07-12 11:34:25', '2019-07-12 11:34:25', NULL, 0, 'qt');
INSERT INTO `system_info` VALUES ('161952998308712448', '大萨达撒多', '大萨达撒多', 'www.baidu.com', NULL, '2019-07-12 11:55:45', '2019-07-12 11:55:45', NULL, 0, 'qt');
INSERT INTO `system_info` VALUES ('162030286610108416', '大萨达撒多', '大萨达撒', '949', NULL, '2019-07-12 17:02:52', '2019-07-12 17:02:52', NULL, 0, 'qt');
INSERT INTO `system_info` VALUES ('163076857258840064', '', 'vcxv', 'vcx', NULL, '2019-07-15 14:21:34', '2019-07-15 14:21:34', NULL, 0, 'OA');
INSERT INTO `system_info` VALUES ('165542115688845312', 'gongxin', '', '', NULL, '2019-07-22 09:37:37', '2019-07-22 09:37:37', NULL, 0, '');
INSERT INTO `system_info` VALUES ('17', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('18', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('19', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('2', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, 'OA');
INSERT INTO `system_info` VALUES ('20', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('21', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('22', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('23', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('24', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('25', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('26', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('27', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('28', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('29', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('3', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, 'OA');
INSERT INTO `system_info` VALUES ('30', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('31', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('32', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('33', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('34', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('35', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('36', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('37', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('38', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('39', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('4', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, 'OA');
INSERT INTO `system_info` VALUES ('40', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('41', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('42', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('43', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('44', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('45', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('46', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('47', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('48', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('49', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('5', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, 'OA');
INSERT INTO `system_info` VALUES ('50', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('51', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('52', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('53', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('54', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('55', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('56', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('57', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('58', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('59', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('6', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, 'OA');
INSERT INTO `system_info` VALUES ('60', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('61', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('62', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('63', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('64', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('65', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('66', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('67', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('68', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('69', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('7', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, 'OA');
INSERT INTO `system_info` VALUES ('70', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('71', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('72', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('73', 'OA', '描述', 'http:localhostt', 'njp', '2019-07-17 15:19:28', '2019-07-09 15:19:32', 'NJP', 0, NULL);
INSERT INTO `system_info` VALUES ('74', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('75', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('8', '財務', '描述', 'www.', 'njp', '2019-07-10 15:20:20', '2019-07-09 15:20:24', 'njp', 0, NULL);
INSERT INTO `system_info` VALUES ('9', '客商', '交水建客商', 'www.jiaoshuijian.cn', 'njp', '2019-07-02 17:30:26', '2019-07-23 17:30:29', 'njp', 0, NULL);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `id_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证',
  `s_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子系统标识代码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '修改者',
  `del_flag` int(11) DEFAULT NULL COMMENT 'flag状态（1,0）0：开启    1：删除/或禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `子系统种类`(`s_code`) USING BTREE,
  CONSTRAINT `子系统种类` FOREIGN KEY (`s_code`) REFERENCES `system_code` (`sys_cod`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, '230608188502140018', 'OA', 'admin', 'admin', 'Asher', '2019-07-10 10:10:29', '2019-07-10 10:10:32', 'Asher', 0);

-- ----------------------------
-- Table structure for t_backlog_or_full
-- ----------------------------
DROP TABLE IF EXISTS `t_backlog_or_full`;
CREATE TABLE `t_backlog_or_full`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `backlog_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `full_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_backlog_or_full
-- ----------------------------
INSERT INTO `t_backlog_or_full` VALUES ('1', NULL, '2019-07-23 14:19:14', 0, NULL, '2019-08-07 11:58:29', '久其分部', 'http://10.1.13.28:8989/messageTest/getOABacklogMessageCount', 'http://10.1.13.28:8989/messageTest/getOAFullMessageCount', 'http://www.baidu.com');
INSERT INTO `t_backlog_or_full` VALUES ('2', NULL, '2019-07-23 14:19:48', 0, NULL, '2019-08-07 13:42:37', 'HR', 'http://10.1.13.28:8989/messageTest/getHRBacklogMessageCount', 'http://10.1.13.28:8989/messageTest/getHRFullMessageCount', 'http://10.1.13.28:8989/messageTest/getOAFullMessageCount');
INSERT INTO `t_backlog_or_full` VALUES ('3', NULL, '2019-07-23 14:22:40', 0, NULL, '2019-08-07 13:42:34', '久其分部', 'http://10.1.13.28:8989/messageTest/getCWBacklogMessageCount', 'http://10.1.13.28:8989/messageTest/getCWFullMessageCount', 'http://10.1.13.28:8989/messageTest/getOAFullMessageCount');
INSERT INTO `t_backlog_or_full` VALUES ('4', NULL, '2019-07-24 11:44:50', 0, NULL, '2019-08-07 13:42:31', 'PM', 'http://10.1.13.28:8989/messageTest/getPMBacklogMessageCount', 'http://10.1.13.28:8989/messageTest/getPMFullMessageCount', 'http://10.1.13.28:8989/messageTest/getOAFullMessageCount');

-- ----------------------------
-- Table structure for t_common_link
-- ----------------------------
DROP TABLE IF EXISTS `t_common_link`;
CREATE TABLE `t_common_link`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_common_link
-- ----------------------------
INSERT INTO `t_common_link` VALUES ('1', NULL, '2019-07-24 14:10:35', 0, NULL, NULL, 'OA', 'Google', 'www.google.com');
INSERT INTO `t_common_link` VALUES ('166365230262128640', NULL, '2019-07-24 16:08:23', 0, NULL, '2019-08-02 17:03:41', '久其分部', '百度', 'www.baidu.com');
INSERT INTO `t_common_link` VALUES ('166365613571182592', NULL, '2019-07-24 16:09:54', 0, NULL, '2019-08-02 17:00:32', '久其分部', '久其内网', 'https://sso.jiuqi.com.cn:8443/login?service=http://portal.jiuqi.com.cn/shiro-cas');
INSERT INTO `t_common_link` VALUES ('170637768811089920', NULL, '2019-08-05 11:05:55', 0, NULL, '2019-08-05 11:05:55', '技术部', '百度', 'http://www.baidu.com');
INSERT INTO `t_common_link` VALUES ('3', NULL, '2019-07-24 14:36:47', 0, NULL, '2019-08-05 13:46:42', '总部', '博客', 'www.csdn.com');

-- ----------------------------
-- Table structure for t_data_analysis
-- ----------------------------
DROP TABLE IF EXISTS `t_data_analysis`;
CREATE TABLE `t_data_analysis`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_data_analysis
-- ----------------------------
INSERT INTO `t_data_analysis` VALUES ('1', NULL, '2019-07-25 10:38:16', 0, NULL, '2019-08-05 17:35:19', '久其分部', 'http://www.baidu.com', '财务');
INSERT INTO `t_data_analysis` VALUES ('2', NULL, '2019-07-26 09:17:08', 0, NULL, '2019-08-05 11:08:45', '人事部门', 'http://www.baidu.com', '人事部门');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_parent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('170972194023673856', NULL, '2019-08-06 09:14:49', 0, NULL, '2019-08-06 09:15:08', '0', 0.00, 0, '久其金建', b'1');
INSERT INTO `t_department` VALUES ('170972277016367104', NULL, '2019-08-06 09:15:08', 0, NULL, '2019-08-06 09:15:08', '170972194023673856', 0.00, 0, '研发三部', b'0');
INSERT INTO `t_department` VALUES ('171444369105096704', NULL, '2019-08-07 16:31:04', 0, NULL, '2019-08-07 16:31:04', '0', 0.00, 0, '共享系统', b'0');
INSERT INTO `t_department` VALUES ('40322777781112832', '', '2018-08-10 20:40:40', 0, '', '2018-08-11 00:03:06', '0', 1.00, 0, '总部', b'1');
INSERT INTO `t_department` VALUES ('40322811096469504', '', '2018-08-10 20:40:48', 0, '', '2019-03-14 18:50:44', '40322777781112832', 1.00, 0, '技术部', b'1');
INSERT INTO `t_department` VALUES ('40322852833988608', '', '2018-08-10 20:40:58', 0, '', '2018-08-11 01:29:42', '40322811096469504', 1.00, 0, '研发中心', NULL);
INSERT INTO `t_department` VALUES ('40327204755738624', '', '2018-08-10 20:58:15', 0, '', '2018-08-10 22:02:15', '40322811096469504', 2.00, 0, '大数据', NULL);
INSERT INTO `t_department` VALUES ('40327253309001728', '', '2018-08-10 20:58:27', 0, '', '2018-08-11 17:26:38', '40322811096469504', 3.00, -1, '人工智障', NULL);
INSERT INTO `t_department` VALUES ('40343262766043136', '', '2018-08-10 22:02:04', 0, '', '2019-08-01 17:53:45', '0', 2.00, 0, '久其分部', b'1');
INSERT INTO `t_department` VALUES ('40344005342400512', '', '2018-08-10 22:05:01', 0, '', '2018-08-11 17:48:44', '40343262766043136', 2.00, 0, 'Vue', NULL);
INSERT INTO `t_department` VALUES ('40389030113710080', '', '2018-08-11 01:03:56', 0, '', '2018-08-11 17:50:04', '40343262766043136', 1.00, 0, 'JAVA', b'0');
INSERT INTO `t_department` VALUES ('40652270295060480', '', '2018-08-11 18:29:57', 0, '', '2018-08-12 18:45:01', '0', 3.00, 0, '人事部', b'1');
INSERT INTO `t_department` VALUES ('40652338142121984', NULL, '2018-08-11 18:30:13', 0, NULL, '2018-08-11 18:30:13', '40652270295060480', 1.00, 0, '游客', b'0');
INSERT INTO `t_department` VALUES ('40681289119961088', '', '2018-08-11 20:25:16', 0, '', '2018-08-11 22:47:48', '40652270295060480', 2.00, 0, 'VIP', b'0');

-- ----------------------------
-- Table structure for t_department_header
-- ----------------------------
DROP TABLE IF EXISTS `t_department_header`;
CREATE TABLE `t_department_header`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department_header
-- ----------------------------
INSERT INTO `t_department_header` VALUES ('118575966346809344', NULL, '2019-03-14 19:10:54', 0, NULL, '2019-03-14 19:10:54', '40322777781112832', 0, '682265633886209');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('75135930788220928', 'admin', '2018-11-14 22:15:43', 0, 'admin', '2018-11-27 01:39:06', '', '性别', 'sex', 0.00);
INSERT INTO `t_dict` VALUES ('75388696739713024', 'admin', '2018-11-15 15:00:07', 0, 'admin', '2018-11-27 01:39:22', '', '按钮权限类型', 'permission_type', 3.00);

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dict_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('75158227712479232', 'admin', '2018-11-14 23:44:19', 0, 'admin', '2019-04-28 22:15:11', '', '75135930788220928', 0.00, 0, '男', '男');
INSERT INTO `t_dict_data` VALUES ('75159254272577536', 'admin', '2018-11-14 23:48:24', 0, 'admin', '2019-04-28 22:15:17', '', '75135930788220928', 1.00, 0, '女', '女');
INSERT INTO `t_dict_data` VALUES ('75159898425397248', 'admin', '2018-11-14 23:50:57', 0, 'admin', '2019-04-28 22:15:22', '', '75135930788220928', 2.00, -1, '保密', '保密');
INSERT INTO `t_dict_data` VALUES ('75390787835138048', 'admin', '2018-11-15 15:08:26', 0, 'admin', '2018-11-15 15:08:26', '', '75388696739713024', 0.00, 0, '查看操作(view)', 'view');
INSERT INTO `t_dict_data` VALUES ('75390886501945344', 'admin', '2018-11-15 15:08:49', 0, 'admin', '2018-11-15 15:08:57', '', '75388696739713024', 1.00, 0, '添加操作(add)', 'add');
INSERT INTO `t_dict_data` VALUES ('75390993939042304', 'admin', '2018-11-15 15:09:15', 0, 'admin', '2018-11-15 15:09:15', '', '75388696739713024', 2.00, 0, '编辑操作(edit)', 'edit');
INSERT INTO `t_dict_data` VALUES ('75391067532300288', 'admin', '2018-11-15 15:09:32', 0, 'admin', '2018-11-15 15:09:32', '', '75388696739713024', 3.00, 0, '删除操作(delete)', 'delete');
INSERT INTO `t_dict_data` VALUES ('75391126902673408', 'admin', '2018-11-15 15:09:46', 0, 'admin', '2018-11-15 15:09:46', '', '75388696739713024', 4.00, 0, '清空操作(clear)', 'clear');
INSERT INTO `t_dict_data` VALUES ('75391192883269632', 'admin', '2018-11-15 15:10:02', 0, 'admin', '2018-11-15 15:10:02', '', '75388696739713024', 5.00, 0, '启用操作(enable)', 'enable');
INSERT INTO `t_dict_data` VALUES ('75391251024711680', 'admin', '2018-11-15 15:10:16', 0, 'admin', '2018-11-15 15:10:16', '', '75388696739713024', 6.00, 0, '禁用操作(disable)', 'disable');
INSERT INTO `t_dict_data` VALUES ('75391297124306944', 'admin', '2018-11-15 15:10:27', 0, 'admin', '2018-11-15 15:10:27', '', '75388696739713024', 7.00, 0, '搜索操作(search)', 'search');
INSERT INTO `t_dict_data` VALUES ('75391343379091456', 'admin', '2018-11-15 15:10:38', 0, 'admin', '2018-11-15 15:10:38', '', '75388696739713024', 8.00, 0, '上传文件(upload)', 'upload');
INSERT INTO `t_dict_data` VALUES ('75391407526776832', 'admin', '2018-11-15 15:10:53', 0, 'admin', '2018-11-15 15:10:53', '', '75388696739713024', 9.00, 0, '导出操作(output)', 'output');
INSERT INTO `t_dict_data` VALUES ('75391475042488320', 'admin', '2018-11-15 15:11:09', 0, 'admin', '2018-11-15 15:11:09', '', '75388696739713024', 10.00, 0, '导入操作(input)', 'input');
INSERT INTO `t_dict_data` VALUES ('75391522182270976', 'admin', '2018-11-15 15:11:21', 0, 'admin', '2018-11-15 15:11:21', '', '75388696739713024', 11.00, 0, '分配权限(editPerm)', 'editPerm');
INSERT INTO `t_dict_data` VALUES ('75391576364290048', 'admin', '2018-11-15 15:11:34', 0, 'admin', '2018-11-15 15:11:34', '', '75388696739713024', 12.00, 0, '设为默认(setDefault)', 'setDefault');
INSERT INTO `t_dict_data` VALUES ('75391798033256448', 'admin', '2018-11-15 15:12:26', 0, 'admin', '2018-11-15 15:12:26', '', '75388696739713024', 13.00, 0, '其他操作(other)', 'other');

-- ----------------------------
-- Table structure for t_download_resources
-- ----------------------------
DROP TABLE IF EXISTS `t_download_resources`;
CREATE TABLE `t_download_resources`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_download_resources
-- ----------------------------
INSERT INTO `t_download_resources` VALUES ('166360181414825984', NULL, '2019-08-05 13:43:35', 0, NULL, '2019-08-07 17:17:05', '久其金建', '竞标合同', 'www.baidu.com');
INSERT INTO `t_download_resources` VALUES ('170648374054227968', NULL, '2019-08-05 11:48:04', 0, NULL, '2019-08-07 17:17:10', '久其金建', '报销模板', 'http://www.baidu.com');
INSERT INTO `t_download_resources` VALUES ('2', NULL, '2019-07-24 15:14:57', 0, NULL, '2019-08-07 17:17:23', '久其金建', '规章制度', 'https://pan.baidu.com/s/11ioxHBpRumDZl5QTVRxcRA');
INSERT INTO `t_download_resources` VALUES ('3', NULL, '2019-07-24 15:15:35', 0, NULL, '2019-08-07 17:17:15', '久其金建', '学习文档', 'https://pan.baidu.com/s/11ioxHBpRumDZl5QTVRxcRA');

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `f_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_information
-- ----------------------------
DROP TABLE IF EXISTS `t_information`;
CREATE TABLE `t_information`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_information
-- ----------------------------
INSERT INTO `t_information` VALUES ('167105421121687552', NULL, '2019-07-29 17:30:38', 0, NULL, '2019-08-07 17:01:38', '久其金建', 'https://www.baidu.com', '高温暑假通知');
INSERT INTO `t_information` VALUES ('170729155015479296', NULL, '2019-08-05 17:09:04', 0, NULL, '2019-08-07 17:01:22', '久其金建', 'http://www.baidu.com', '最新通知');
INSERT INTO `t_information` VALUES ('2', NULL, '2019-07-29 17:30:49', 0, NULL, '2019-08-07 17:01:32', '久其金建', 'https://www.baidu.com', '年会通知');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('155792617605435392', NULL, '2019-06-25 11:56:36', 0, NULL, '2019-06-25 11:56:36', 1970, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156186221079433216', NULL, '2019-06-26 14:00:38', 0, NULL, '2019-06-26 14:00:38', 266, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156481619476090880', NULL, '2019-06-27 09:34:27', 0, NULL, '2019-06-27 09:34:27', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156488854109425664', NULL, '2019-06-27 10:03:11', 0, NULL, '2019-06-27 10:03:11', 334, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490338771406848', NULL, '2019-06-27 10:09:08', 0, NULL, '2019-06-27 10:09:08', 2865, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('156490418354130944', NULL, '2019-06-27 10:09:25', 0, NULL, '2019-06-27 10:09:25', 293, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490549891698688', NULL, '2019-06-27 10:09:56', 0, NULL, '2019-06-27 10:09:56', 341, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('156490704611184640', NULL, '2019-06-27 10:10:58', 0, NULL, '2019-06-27 10:10:58', 21252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490798643286016', NULL, '2019-06-27 10:11:16', 0, NULL, '2019-06-27 10:11:16', 21284, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('156490910731866112', NULL, '2019-06-27 10:11:41', 0, NULL, '2019-06-27 10:11:41', 25545, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490929807560704', NULL, '2019-06-27 10:11:41', 0, NULL, '2019-06-27 10:11:41', 9400, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490930516398080', NULL, '2019-06-27 10:11:40', 0, NULL, '2019-06-27 10:11:40', 9406, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156490947394277376', NULL, '2019-06-27 10:11:30', 0, NULL, '2019-06-27 10:11:30', 124, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156491108434579456', NULL, '2019-06-27 10:12:09', 0, NULL, '2019-06-27 10:12:09', 1920, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156491274650652672', NULL, '2019-06-27 10:12:49', 0, NULL, '2019-06-27 10:12:49', 419, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156491468112924672', NULL, '2019-06-27 10:13:35', 0, NULL, '2019-06-27 10:13:35', 713, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156492029713453056', NULL, '2019-06-27 10:15:49', 0, NULL, '2019-06-27 10:15:49', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('156492273977135104', NULL, '2019-06-27 10:16:48', 0, NULL, '2019-06-27 10:16:48', 2348, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('156502762576678912', NULL, '2019-06-27 10:58:28', 0, NULL, '2019-06-27 10:58:28', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('156839303496863744', NULL, '2019-06-28 09:16:15', 0, NULL, '2019-06-28 09:16:15', 21194, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('156845943625355264', NULL, '2019-06-28 09:42:09', 0, NULL, '2019-06-28 09:42:09', 674, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('156861470515138560', NULL, '2019-06-28 10:43:50', 0, NULL, '2019-06-28 10:43:50', 304, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('156866264050962432', NULL, '2019-06-28 11:02:53', 0, NULL, '2019-06-28 11:02:53', 206, '10.1.100.75', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('157926914676232192', NULL, '2019-07-01 09:17:32', 0, NULL, '2019-07-01 09:17:32', 218, '10.1.13.14', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158290801955180544', NULL, '2019-07-02 09:23:29', 0, NULL, '2019-07-02 09:23:29', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158379969674743808', NULL, '2019-07-02 15:17:49', 0, NULL, '2019-07-02 15:17:49', 194, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158415316529975296', NULL, '2019-07-02 17:38:16', 0, NULL, '2019-07-02 17:38:16', 379, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158419303979290624', NULL, '2019-07-02 17:54:07', 0, NULL, '2019-07-02 17:54:07', 275, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158419459529248768', NULL, '2019-07-02 17:54:44', 0, NULL, '2019-07-02 17:54:44', 267, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158420222041133056', NULL, '2019-07-02 17:57:46', 0, NULL, '2019-07-02 17:57:46', 357, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158420476492779520', NULL, '2019-07-02 17:58:46', 0, NULL, '2019-07-02 17:58:46', 317, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158420682449883136', NULL, '2019-07-02 17:59:35', 0, NULL, '2019-07-02 17:59:35', 132, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158421529288249344', NULL, '2019-07-02 18:02:57', 0, NULL, '2019-07-02 18:02:57', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158421871769948160', NULL, '2019-07-02 18:04:19', 0, NULL, '2019-07-02 18:04:19', 315, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158651154601873408', NULL, '2019-07-03 09:15:24', 0, NULL, '2019-07-03 09:15:24', 188, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158654443749904384', NULL, '2019-07-03 09:28:28', 0, NULL, '2019-07-03 09:28:28', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158654821438590976', NULL, '2019-07-03 09:29:58', 0, NULL, '2019-07-03 09:29:58', 238, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158655564073668608', NULL, '2019-07-03 09:32:55', 0, NULL, '2019-07-03 09:32:55', 281, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158655717723607040', NULL, '2019-07-03 09:33:32', 0, NULL, '2019-07-03 09:33:32', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158656074830843904', NULL, '2019-07-03 09:34:57', 0, NULL, '2019-07-03 09:34:57', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158659298447069184', NULL, '2019-07-03 09:47:46', 0, NULL, '2019-07-03 09:47:46', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158660445140422656', NULL, '2019-07-03 09:52:19', 0, NULL, '2019-07-03 09:52:19', 6041, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('158660924876525568', NULL, '2019-07-03 09:54:13', 0, NULL, '2019-07-03 09:54:13', 165, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159100925699428352', NULL, '2019-07-04 15:02:38', 0, NULL, '2019-07-04 15:02:38', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159415605001195520', NULL, '2019-07-05 11:53:03', 0, NULL, '2019-07-05 11:53:03', 845, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159415852846813184', NULL, '2019-07-05 11:54:03', 0, NULL, '2019-07-05 11:54:03', 541, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159438034989748224', NULL, '2019-07-05 13:22:15', 0, NULL, '2019-07-05 13:22:15', 8459, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('159438170453184512', NULL, '2019-07-05 13:22:43', 0, NULL, '2019-07-05 13:22:43', 1379, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('159469030174887936', NULL, '2019-07-05 15:25:21', 0, NULL, '2019-07-05 15:25:21', 195, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159469182193242112', NULL, '2019-07-05 15:26:09', 0, NULL, '2019-07-05 15:26:09', 16717, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159469240682811392', NULL, '2019-07-05 15:26:30', 0, NULL, '2019-07-05 15:26:30', 12113, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159469548355981312', NULL, '2019-07-05 15:27:25', 0, NULL, '2019-07-05 15:27:25', 1462, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('159469609135640576', NULL, '2019-07-05 15:27:39', 0, NULL, '2019-07-05 15:27:39', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159477930467004416', NULL, '2019-07-05 16:01:01', 0, NULL, '2019-07-05 16:01:01', 21194, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159478015628152832', NULL, '2019-07-05 16:01:17', 0, NULL, '2019-07-05 16:01:17', 12086, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('159478533171712000', NULL, '2019-07-05 16:03:07', 0, NULL, '2019-07-05 16:03:07', 553, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('159481278503063552', NULL, '2019-07-05 16:14:01', 0, NULL, '2019-07-05 16:14:01', 226, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('159804849699950592', NULL, '2019-07-06 13:39:50', 0, NULL, '2019-07-06 13:39:50', 3292, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('160479323306856448', NULL, '2019-07-08 10:19:54', 0, NULL, '2019-07-08 10:19:54', 443, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('160488365832015872', NULL, '2019-07-08 10:56:08', 0, NULL, '2019-07-08 10:56:08', 25337, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('160488382986719232', NULL, '2019-07-08 10:56:05', 0, NULL, '2019-07-08 10:56:05', 12024, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('160493375445798912', NULL, '2019-07-08 11:16:05', 0, NULL, '2019-07-08 11:16:05', 21199, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('160493488591343616', NULL, '2019-07-08 11:16:32', 0, NULL, '2019-07-08 11:16:32', 22091, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('160493571571453952', NULL, '2019-07-08 11:16:47', 0, NULL, '2019-07-08 11:16:47', 20942, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('160493637501718528', NULL, '2019-07-08 11:16:55', 0, NULL, '2019-07-08 11:16:55', 10561, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('160496812166221824', NULL, '2019-07-08 11:29:23', 0, NULL, '2019-07-08 11:29:23', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('160497362526015488', NULL, '2019-07-08 11:31:43', 0, NULL, '2019-07-08 11:31:43', 19781, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('160497438438723584', NULL, '2019-07-08 11:31:59', 0, NULL, '2019-07-08 11:31:59', 6703, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('160555707471499264', NULL, '2019-07-08 15:23:25', 0, NULL, '2019-07-08 15:23:25', 412, '10.1.13.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('160556278718926848', NULL, '2019-07-08 15:26:02', 0, NULL, '2019-07-08 15:26:02', 21242, '10.1.101.6', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('160596213744275456', NULL, '2019-07-08 18:04:22', 0, NULL, '2019-07-08 18:04:22', 858, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161206248627245056', NULL, '2019-07-10 10:28:26', 0, NULL, '2019-07-10 10:28:26', 356, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161219360847826944', NULL, '2019-07-10 11:20:32', 0, NULL, '2019-07-10 11:20:32', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('161219824700100608', NULL, '2019-07-10 11:22:26', 0, NULL, '2019-07-10 11:22:26', 3048, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161220602642829312', NULL, '2019-07-10 11:25:28', 0, NULL, '2019-07-10 11:25:28', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161222774365360128', NULL, '2019-07-10 11:34:06', 0, NULL, '2019-07-10 11:34:06', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161223935470342144', NULL, '2019-07-10 11:38:46', 0, NULL, '2019-07-10 11:38:46', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161224036280438784', NULL, '2019-07-10 11:39:07', 0, NULL, '2019-07-10 11:39:07', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161224144350875648', NULL, '2019-07-10 11:39:33', 0, NULL, '2019-07-10 11:39:33', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161224258532413440', NULL, '2019-07-10 11:40:00', 0, NULL, '2019-07-10 11:40:00', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161226913438765056', NULL, '2019-07-10 11:50:36', 0, NULL, '2019-07-10 11:50:36', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161262276249128960', NULL, '2019-07-10 14:11:04', 0, NULL, '2019-07-10 14:11:04', 301, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161263084801888256', NULL, '2019-07-10 14:14:17', 0, NULL, '2019-07-10 14:14:17', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161280300947607552', NULL, '2019-07-10 15:22:42', 0, NULL, '2019-07-10 15:22:42', 1101, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161280349416984576', NULL, '2019-07-10 15:22:53', 0, NULL, '2019-07-10 15:22:53', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161280614765432832', NULL, '2019-07-10 15:23:56', 0, NULL, '2019-07-10 15:23:56', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161282316121935872', NULL, '2019-07-10 15:30:42', 0, NULL, '2019-07-10 15:30:42', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161291675765837824', NULL, '2019-07-10 16:07:54', 0, NULL, '2019-07-10 16:07:54', 343, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161306218437021696', NULL, '2019-07-10 17:05:44', 0, NULL, '2019-07-10 17:05:44', 3092, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161309676472897536', NULL, '2019-07-10 17:19:25', 0, NULL, '2019-07-10 17:19:25', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161311655878201344', NULL, '2019-07-10 17:27:17', 0, NULL, '2019-07-10 17:27:17', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161311684340748288', NULL, '2019-07-10 17:27:24', 0, NULL, '2019-07-10 17:27:24', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161311739386793984', NULL, '2019-07-10 17:27:37', 0, NULL, '2019-07-10 17:27:37', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161312681649770496', NULL, '2019-07-10 17:31:22', 0, NULL, '2019-07-10 17:31:22', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161316303309639680', NULL, '2019-07-10 17:45:45', 0, NULL, '2019-07-10 17:45:45', 196, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161316470834335744', NULL, '2019-07-10 17:46:25', 0, NULL, '2019-07-10 17:46:25', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161321070605897728', NULL, '2019-07-10 18:04:44', 0, NULL, '2019-07-10 18:04:44', 3050, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161321101723439104', NULL, '2019-07-10 18:04:52', 0, NULL, '2019-07-10 18:04:52', 3044, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161321176897949696', NULL, '2019-07-10 18:05:07', 0, NULL, '2019-07-10 18:05:07', 310, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161550725753606144', NULL, '2019-07-11 09:17:16', 0, NULL, '2019-07-11 09:17:16', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161552333317083136', NULL, '2019-07-11 09:23:39', 0, NULL, '2019-07-11 09:23:39', 287, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161555912547373056', NULL, '2019-07-11 09:37:52', 0, NULL, '2019-07-11 09:37:52', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161560671564075008', NULL, '2019-07-11 09:56:47', 0, NULL, '2019-07-11 09:56:47', 277, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161564250668535808', NULL, '2019-07-11 10:11:00', 0, NULL, '2019-07-11 10:11:00', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161564989818146816', NULL, '2019-07-11 10:13:56', 0, NULL, '2019-07-11 10:13:56', 163, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161570510461734912', NULL, '2019-07-11 10:35:53', 0, NULL, '2019-07-11 10:35:53', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"njp\"}', 'POST', '/xboot/login', 'njp', 1);
INSERT INTO `t_log` VALUES ('161676684402102272', NULL, '2019-07-11 17:37:49', 0, NULL, '2019-07-11 17:37:49', 3092, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('161676937821949952', NULL, '2019-07-11 17:38:47', 0, NULL, '2019-07-11 17:38:47', 195, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('161939625584103424', NULL, '2019-07-12 11:02:37', 0, NULL, '2019-07-12 11:02:37', 426, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('162030696171311104', NULL, '2019-07-12 17:04:30', 0, NULL, '2019-07-12 17:04:30', 285, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('162031509673349120', NULL, '2019-07-12 17:07:44', 0, NULL, '2019-07-12 17:07:44', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163032456469942272', NULL, '2019-07-15 11:25:08', 0, NULL, '2019-07-15 11:25:08', 306, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163068500099731456', NULL, '2019-07-15 13:48:22', 0, NULL, '2019-07-15 13:48:22', 912, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('163069123893399552', NULL, '2019-07-15 13:50:50', 0, NULL, '2019-07-15 13:50:50', 291, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163099141545660416', NULL, '2019-07-15 15:50:07', 0, NULL, '2019-07-15 15:50:07', 257, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('163101118941892608', NULL, '2019-07-15 15:57:58', 0, NULL, '2019-07-15 15:57:58', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('163401940548456448', NULL, '2019-07-16 11:53:20', 0, NULL, '2019-07-16 11:53:20', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164094168346398720', NULL, '2019-07-18 09:44:00', 0, NULL, '2019-07-18 09:44:00', 330, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('164095628933074944', NULL, '2019-07-18 09:49:48', 0, NULL, '2019-07-18 09:49:48', 282, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164099943642959872', NULL, '2019-07-18 10:06:59', 0, NULL, '2019-07-18 10:06:59', 3059, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('164099979076440064', NULL, '2019-07-18 10:07:05', 0, NULL, '2019-07-18 10:07:05', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164486853058105344', NULL, '2019-07-19 11:44:23', 0, NULL, '2019-07-19 11:44:23', 324, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164487918428098560', NULL, '2019-07-19 11:48:37', 0, NULL, '2019-07-19 11:48:37', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164492332547182592', NULL, '2019-07-19 12:06:10', 0, NULL, '2019-07-19 12:06:10', 705, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164517489105965056', NULL, '2019-07-19 13:46:10', 0, NULL, '2019-07-19 13:46:10', 3379, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164518290247389184', NULL, '2019-07-19 13:49:18', 0, NULL, '2019-07-19 13:49:18', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164536494076203008', NULL, '2019-07-19 15:01:38', 0, NULL, '2019-07-19 15:01:38', 298, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164539385243504640', NULL, '2019-07-19 15:13:08', 0, NULL, '2019-07-19 15:13:08', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('164539495750832128', NULL, '2019-07-19 15:13:34', 0, NULL, '2019-07-19 15:13:34', 302, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165535817446461440', NULL, '2019-07-22 09:12:36', 0, NULL, '2019-07-22 09:12:36', 723, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165537463916302336', NULL, '2019-07-22 09:19:08', 0, NULL, '2019-07-22 09:19:08', 288, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165605809860907008', NULL, '2019-07-22 13:50:43', 0, NULL, '2019-07-22 13:50:43', 285, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165606300950990848', NULL, '2019-07-22 13:52:43', 0, NULL, '2019-07-22 13:52:43', 3006, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165607290106286080', NULL, '2019-07-22 13:56:36', 0, NULL, '2019-07-22 13:56:36', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165608917802422272', NULL, '2019-07-22 14:03:04', 0, NULL, '2019-07-22 14:03:04', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('165611113445068800', NULL, '2019-07-22 14:11:48', 0, NULL, '2019-07-22 14:11:48', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165614291431460864', NULL, '2019-07-22 14:24:25', 0, NULL, '2019-07-22 14:24:25', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165615055310688256', NULL, '2019-07-22 14:27:27', 0, NULL, '2019-07-22 14:27:27', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('165616129035735040', NULL, '2019-07-22 14:31:43', 0, NULL, '2019-07-22 14:31:43', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165617808057569280', NULL, '2019-07-22 14:38:24', 0, NULL, '2019-07-22 14:38:24', 211, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165624159123017728', NULL, '2019-07-22 15:03:38', 0, NULL, '2019-07-22 15:03:38', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165666755916599296', NULL, '2019-07-22 17:52:54', 0, NULL, '2019-07-22 17:52:54', 319, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('165667262936649728', NULL, '2019-07-22 17:54:57', 0, NULL, '2019-07-22 17:54:57', 3047, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165897868740136960', NULL, '2019-07-23 09:11:15', 0, NULL, '2019-07-23 09:11:15', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165905610821341184', NULL, '2019-07-23 09:42:01', 0, NULL, '2019-07-23 09:42:01', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165905613279203328', NULL, '2019-07-23 09:42:02', 0, NULL, '2019-07-23 09:42:02', 131, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165906737042296832', NULL, '2019-07-23 09:46:30', 0, NULL, '2019-07-23 09:46:30', 265, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165967439660584960', NULL, '2019-07-23 13:47:42', 0, NULL, '2019-07-23 13:47:42', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165979604329172992', NULL, '2019-07-23 14:36:03', 0, NULL, '2019-07-23 14:36:03', 223, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('165983013295886336', NULL, '2019-07-23 14:49:36', 0, NULL, '2019-07-23 14:49:36', 324, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166025647175503872', NULL, '2019-07-23 17:46:38', 0, NULL, '2019-07-23 17:46:38', 163738, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166029460749946880', NULL, '2019-07-23 17:54:09', 0, NULL, '2019-07-23 17:54:09', 18718, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166029460804472832', NULL, '2019-07-23 17:54:09', 0, NULL, '2019-07-23 17:54:09', 233, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166029667826929664', NULL, '2019-07-23 18:01:21', 0, NULL, '2019-07-23 18:01:21', 382917, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"true\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166265059872346112', NULL, '2019-07-24 09:30:26', 0, NULL, '2019-07-24 09:30:26', 5625, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166265305331404800', NULL, '2019-07-24 09:31:19', 0, NULL, '2019-07-24 09:31:19', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166267739504119808', NULL, '2019-07-24 09:41:00', 0, NULL, '2019-07-24 09:41:00', 301, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166273818854166528', NULL, '2019-07-24 10:05:09', 0, NULL, '2019-07-24 10:05:09', 297, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166273915440599040', NULL, '2019-07-24 10:07:53', 0, NULL, '2019-07-24 10:07:53', 129343, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166274887713820672', NULL, '2019-07-24 10:09:24', 0, NULL, '2019-07-24 10:09:24', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166274887713820673', NULL, '2019-07-24 10:09:24', 0, NULL, '2019-07-24 10:09:24', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166278071152807936', NULL, '2019-07-24 10:22:03', 0, NULL, '2019-07-24 10:22:03', 424, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166278531322482688', NULL, '2019-07-24 10:23:52', 0, NULL, '2019-07-24 10:23:52', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166279423073456128', NULL, '2019-07-24 10:27:25', 0, NULL, '2019-07-24 10:27:25', 247, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166284074439151616', NULL, '2019-07-24 10:45:54', 0, NULL, '2019-07-24 10:45:54', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166298977241665536', NULL, '2019-07-24 11:45:14', 0, NULL, '2019-07-24 11:45:14', 7403, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166298993033220096', NULL, '2019-07-24 11:45:14', 0, NULL, '2019-07-24 11:45:14', 3558, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166327091883675648', NULL, '2019-07-24 13:36:50', 0, NULL, '2019-07-24 13:36:50', 220, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166622566654414848', NULL, '2019-07-25 09:10:57', 0, NULL, '2019-07-25 09:10:57', 335, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166629949879357440', NULL, '2019-07-25 09:40:17', 0, NULL, '2019-07-25 09:40:17', 305, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166630255644119040', NULL, '2019-07-25 09:58:52', 0, NULL, '2019-07-25 09:58:52', 1039157, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166632718497484800', NULL, '2019-07-25 09:51:17', 0, NULL, '2019-07-25 09:51:17', 262, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166635620150546432', NULL, '2019-07-25 10:02:49', 0, NULL, '2019-07-25 10:02:49', 283, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166635620150546433', NULL, '2019-07-25 10:02:49', 0, NULL, '2019-07-25 10:02:49', 270, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166635790003081216', NULL, '2019-07-25 10:03:30', 0, NULL, '2019-07-25 10:03:30', 222, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166637056292818944', NULL, '2019-07-25 10:08:31', 0, NULL, '2019-07-25 10:08:31', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('166690520758751232', NULL, '2019-07-25 13:40:58', 0, NULL, '2019-07-25 13:40:58', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166694689691406336', NULL, '2019-07-25 13:57:32', 0, NULL, '2019-07-25 13:57:32', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('166695303288721408', NULL, '2019-07-25 13:59:59', 0, NULL, '2019-07-25 13:59:59', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166697453020516352', NULL, '2019-07-25 14:08:31', 0, NULL, '2019-07-25 14:08:31', 269, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166698714553913344', NULL, '2019-07-25 14:13:35', 0, NULL, '2019-07-25 14:13:35', 3045, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166703362815823872', NULL, '2019-07-25 14:32:00', 0, NULL, '2019-07-25 14:32:00', 321, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166704826158157824', NULL, '2019-07-25 14:37:49', 0, NULL, '2019-07-25 14:37:49', 194, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166711710260924416', NULL, '2019-07-25 15:05:10', 0, NULL, '2019-07-25 15:05:10', 241, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166713893777838080', NULL, '2019-07-25 15:13:51', 0, NULL, '2019-07-25 15:13:51', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166714123025911808', NULL, '2019-07-25 15:14:46', 0, NULL, '2019-07-25 15:14:46', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166744036789456896', NULL, '2019-07-25 17:13:38', 0, NULL, '2019-07-25 17:13:38', 230, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166984875230892032', NULL, '2019-07-26 09:10:38', 0, NULL, '2019-07-26 09:10:38', 343, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166984875230892033', NULL, '2019-07-26 09:10:41', 0, NULL, '2019-07-26 09:10:41', 3082, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166985451406626816', NULL, '2019-07-26 09:12:55', 0, NULL, '2019-07-26 09:12:55', 243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166985555949654016', NULL, '2019-07-26 09:13:20', 0, NULL, '2019-07-26 09:13:20', 268, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166986198672216064', NULL, '2019-07-26 09:15:53', 0, NULL, '2019-07-26 09:15:53', 232, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166986412841766912', NULL, '2019-07-26 09:16:45', 0, NULL, '2019-07-26 09:16:45', 324, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166986630144462848', NULL, '2019-07-26 09:17:36', 0, NULL, '2019-07-26 09:17:36', 305, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('166987066066866177', NULL, '2019-07-26 09:19:44', 0, NULL, '2019-07-26 09:19:44', 23646, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167001013713113088', NULL, '2019-07-26 10:18:37', 0, NULL, '2019-07-26 10:18:37', 231347, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167002087891144704', NULL, '2019-07-26 10:23:04', 0, NULL, '2019-07-26 10:23:04', 154900, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167003253853130752', NULL, '2019-07-26 10:23:58', 0, NULL, '2019-07-26 10:23:58', 18071, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167003616048058368', NULL, '2019-07-26 10:26:45', 0, NULL, '2019-07-26 10:26:45', 99539, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167007830899953664', NULL, '2019-07-26 10:41:51', 0, NULL, '2019-07-26 10:41:51', 355, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167011680289558528', NULL, '2019-07-26 10:57:09', 0, NULL, '2019-07-26 10:57:09', 1315506, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167015903924326400', NULL, '2019-07-26 11:13:59', 0, NULL, '2019-07-26 11:13:59', 3146, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167020154851430400', NULL, '2019-07-26 11:30:49', 0, NULL, '2019-07-26 11:30:49', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167020406635499520', NULL, '2019-07-26 11:31:52', 0, NULL, '2019-07-26 11:31:52', 3047, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167020547002077184', NULL, '2019-07-26 11:32:23', 0, NULL, '2019-07-26 11:32:23', 282, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167020892029718528', NULL, '2019-07-26 11:33:45', 0, NULL, '2019-07-26 11:33:45', 271, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167021280980111360', NULL, '2019-07-26 11:35:18', 0, NULL, '2019-07-26 11:35:18', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167022182633836544', NULL, '2019-07-26 11:38:53', 0, NULL, '2019-07-26 11:38:53', 190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167022829332598784', NULL, '2019-07-26 11:41:27', 0, NULL, '2019-07-26 11:41:27', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167052018265886720', NULL, '2019-07-26 13:37:26', 0, NULL, '2019-07-26 13:37:26', 276, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167056714930065408', NULL, '2019-07-26 13:56:06', 0, NULL, '2019-07-26 13:56:06', 226, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057579204153344', NULL, '2019-07-26 13:59:32', 0, NULL, '2019-07-26 13:59:32', 281, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167057841159409664', NULL, '2019-07-26 14:00:55', 0, NULL, '2019-07-26 14:00:55', 21193, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167057847564111872', NULL, '2019-07-26 14:00:57', 0, NULL, '2019-07-26 14:00:57', 21162, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167057881139515392', NULL, '2019-07-26 14:01:05', 0, NULL, '2019-07-26 14:01:05', 21253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057890966769664', NULL, '2019-07-26 14:01:08', 0, NULL, '2019-07-26 14:01:08', 21147, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057895098159104', NULL, '2019-07-26 14:01:08', 0, NULL, '2019-07-26 14:01:08', 21137, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057896150929408', NULL, '2019-07-26 14:01:09', 0, NULL, '2019-07-26 14:01:09', 21403, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057904044609536', NULL, '2019-07-26 14:01:09', 0, NULL, '2019-07-26 14:01:09', 21145, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057954900545536', NULL, '2019-07-26 14:01:26', 0, NULL, '2019-07-26 14:01:26', 21564, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057986865336320', NULL, '2019-07-26 14:01:30', 0, NULL, '2019-07-26 14:01:30', 20311, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057991927861248', NULL, '2019-07-26 14:01:31', 0, NULL, '2019-07-26 14:01:31', 15578, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167057996319297536', NULL, '2019-07-26 14:01:32', 0, NULL, '2019-07-26 14:01:32', 14115, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167058077063843840', NULL, '2019-07-26 14:01:41', 0, NULL, '2019-07-26 14:01:41', 21367, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167058279409651712', NULL, '2019-07-26 14:02:22', 0, NULL, '2019-07-26 14:02:22', 3426, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167058291594104832', NULL, '2019-07-26 14:02:24', 0, NULL, '2019-07-26 14:02:24', 2840, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167058440936493056', NULL, '2019-07-26 14:02:57', 0, NULL, '2019-07-26 14:02:57', 304, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167058626597359616', NULL, '2019-07-26 14:03:42', 0, NULL, '2019-07-26 14:03:42', 209, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167059119394525184', NULL, '2019-07-26 14:05:51', 0, NULL, '2019-07-26 14:05:51', 21283, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059134963781632', NULL, '2019-07-26 14:06:04', 0, NULL, '2019-07-26 14:06:04', 21137, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059141578199040', NULL, '2019-07-26 14:06:04', 0, NULL, '2019-07-26 14:06:04', 21142, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059143935397888', NULL, '2019-07-26 14:06:04', 0, NULL, '2019-07-26 14:06:04', 21134, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059144749092864', NULL, '2019-07-26 14:06:05', 0, NULL, '2019-07-26 14:06:05', 21133, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059145600536576', NULL, '2019-07-26 14:06:11', 0, NULL, '2019-07-26 14:06:11', 21130, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059165628338176', NULL, '2019-07-26 14:06:02', 0, NULL, '2019-07-26 14:06:02', 16857, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059167599661056', NULL, '2019-07-26 14:06:02', 0, NULL, '2019-07-26 14:06:02', 13611, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059168891506688', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 12349, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059169155747840', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 12181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059169453543424', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 12023, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059169776504832', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 11751, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059169919111168', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 11569, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059170128826368', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 11514, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059170267238400', NULL, '2019-07-26 14:06:03', 0, NULL, '2019-07-26 14:06:03', 11342, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059216467496960', NULL, '2019-07-26 14:06:24', 0, NULL, '2019-07-26 14:06:24', 23991, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059224604446720', NULL, '2019-07-26 14:06:26', 0, NULL, '2019-07-26 14:06:26', 20515, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059328535105536', NULL, '2019-07-26 14:06:45', 0, NULL, '2019-07-26 14:06:45', 19279, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059345954050048', NULL, '2019-07-26 14:06:33', 0, NULL, '2019-07-26 14:06:33', 486, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059365210099712', NULL, '2019-07-26 14:06:47', 0, NULL, '2019-07-26 14:06:47', 11486, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059371858071552', NULL, '2019-07-26 14:06:49', 0, NULL, '2019-07-26 14:06:49', 11393, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059386915622912', NULL, '2019-07-26 14:06:52', 0, NULL, '2019-07-26 14:06:52', 10661, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167059891230347264', NULL, '2019-07-26 14:08:43', 0, NULL, '2019-07-26 14:08:43', 303, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167059969965821952', NULL, '2019-07-26 14:09:02', 0, NULL, '2019-07-26 14:09:02', 216, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167061441990365184', NULL, '2019-07-26 14:14:53', 0, NULL, '2019-07-26 14:14:53', 371, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061452484513792', NULL, '2019-07-26 14:14:55', 0, NULL, '2019-07-26 14:14:55', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061466501877760', NULL, '2019-07-26 14:14:59', 0, NULL, '2019-07-26 14:14:59', 270, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061469433696256', NULL, '2019-07-26 14:14:59', 0, NULL, '2019-07-26 14:14:59', 454, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061632072028160', NULL, '2019-07-26 14:15:59', 0, NULL, '2019-07-26 14:15:59', 21171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061632881528832', NULL, '2019-07-26 14:15:59', 0, NULL, '2019-07-26 14:15:59', 21136, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061633837830144', NULL, '2019-07-26 14:16:00', 0, NULL, '2019-07-26 14:16:00', 21136, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061634743799808', NULL, '2019-07-26 14:16:00', 0, NULL, '2019-07-26 14:16:00', 21213, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061635528134656', NULL, '2019-07-26 14:16:00', 0, NULL, '2019-07-26 14:16:00', 21172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167061701890412544', NULL, '2019-07-26 14:16:08', 0, NULL, '2019-07-26 14:16:08', 53215, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061723298140160', NULL, '2019-07-26 14:16:22', 0, NULL, '2019-07-26 14:16:22', 57472, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061730986299392', NULL, '2019-07-26 14:16:24', 0, NULL, '2019-07-26 14:16:24', 59091, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061755648806912', NULL, '2019-07-26 14:16:29', 0, NULL, '2019-07-26 14:16:29', 65526, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061766637883392', NULL, '2019-07-26 14:16:32', 0, NULL, '2019-07-26 14:16:32', 67409, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061767267028992', NULL, '2019-07-26 14:16:32', 0, NULL, '2019-07-26 14:16:32', 67404, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167061877661110272', NULL, '2019-07-26 14:16:47', 0, NULL, '2019-07-26 14:16:47', 19522, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167062838974615552', NULL, '2019-07-26 14:20:47', 0, NULL, '2019-07-26 14:20:47', 302, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167062891856400384', NULL, '2019-07-26 14:21:02', 0, NULL, '2019-07-26 14:21:02', 3047, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167063026602610688', NULL, '2019-07-26 14:21:24', 0, NULL, '2019-07-26 14:21:24', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167063110287364096', NULL, '2019-07-26 14:21:40', 0, NULL, '2019-07-26 14:21:40', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167063161055219712', NULL, '2019-07-26 14:21:51', 0, NULL, '2019-07-26 14:21:51', 279, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167063167103406080', NULL, '2019-07-26 14:21:52', 0, NULL, '2019-07-26 14:21:52', 146, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('167063205607116800', NULL, '2019-07-26 14:21:59', 0, NULL, '2019-07-26 14:21:59', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167063301782507520', NULL, '2019-07-26 14:22:17', 0, NULL, '2019-07-26 14:22:17', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167063318639415296', NULL, '2019-07-26 14:22:20', 0, NULL, '2019-07-26 14:22:20', 130, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167063573233668096', NULL, '2019-07-26 14:23:21', 0, NULL, '2019-07-26 14:23:21', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167068831905222656', NULL, '2019-07-26 14:44:20', 0, NULL, '2019-07-26 14:44:20', 5449, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167070945272401920', NULL, '2019-07-26 14:52:40', 0, NULL, '2019-07-26 14:52:40', 1243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167071665799303168', NULL, '2019-07-26 14:55:51', 0, NULL, '2019-07-26 14:55:51', 21190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167071676880654336', NULL, '2019-07-26 14:55:54', 0, NULL, '2019-07-26 14:55:54', 21134, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167071722971860992', NULL, '2019-07-26 14:56:05', 0, NULL, '2019-07-26 14:56:05', 21183, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167071790982500352', NULL, '2019-07-26 14:56:26', 0, NULL, '2019-07-26 14:56:26', 21243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167071792941240320', NULL, '2019-07-26 14:56:23', 0, NULL, '2019-07-26 14:56:23', 21140, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167072296131891200', NULL, '2019-07-26 14:58:01', 0, NULL, '2019-07-26 14:58:01', 635, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167073917867921408', NULL, '2019-07-26 15:04:29', 0, NULL, '2019-07-26 15:04:29', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167074476553408512', NULL, '2019-07-26 15:06:41', 0, NULL, '2019-07-26 15:06:41', 260, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167074527468064768', NULL, '2019-07-26 15:06:55', 0, NULL, '2019-07-26 15:06:55', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167074731051192320', NULL, '2019-07-26 15:07:42', 0, NULL, '2019-07-26 15:07:42', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167074912182210560', NULL, '2019-07-26 15:08:25', 0, NULL, '2019-07-26 15:08:25', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167074993648177152', NULL, '2019-07-26 15:08:44', 0, NULL, '2019-07-26 15:08:44', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167075145570062336', NULL, '2019-07-26 15:09:20', 0, NULL, '2019-07-26 15:09:20', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167075527289475072', NULL, '2019-07-26 15:11:06', 0, NULL, '2019-07-26 15:11:06', 264, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167075823243759616', NULL, '2019-07-26 15:12:02', 0, NULL, '2019-07-26 15:12:02', 272, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167076050063331328', NULL, '2019-07-26 15:12:56', 0, NULL, '2019-07-26 15:12:56', 656, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167078764210032640', NULL, '2019-07-26 15:23:43', 0, NULL, '2019-07-26 15:23:43', 375, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167079705202135040', NULL, '2019-07-26 15:27:28', 0, NULL, '2019-07-26 15:27:28', 184, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167081940816498688', NULL, '2019-07-26 15:36:37', 0, NULL, '2019-07-26 15:36:37', 230, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167082650048139264', NULL, '2019-07-26 15:39:10', 0, NULL, '2019-07-26 15:39:10', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167082966890057728', NULL, '2019-07-26 15:40:46', 0, NULL, '2019-07-26 15:40:46', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167086314053701632', NULL, '2019-07-26 15:53:43', 0, NULL, '2019-07-26 15:53:43', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167088644513861632', NULL, '2019-07-26 16:02:59', 0, NULL, '2019-07-26 16:02:59', 286, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167088849913122816', NULL, '2019-07-26 16:03:47', 0, NULL, '2019-07-26 16:03:47', 183, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167089564706410496', NULL, '2019-07-26 16:06:38', 0, NULL, '2019-07-26 16:06:38', 214, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167089616241823744', NULL, '2019-07-26 16:06:55', 0, NULL, '2019-07-26 16:06:55', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167089705458864128', NULL, '2019-07-26 16:07:11', 0, NULL, '2019-07-26 16:07:11', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167089763608694784', NULL, '2019-07-26 16:07:26', 0, NULL, '2019-07-26 16:07:26', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167089842725851136', NULL, '2019-07-26 16:07:44', 0, NULL, '2019-07-26 16:07:44', 167, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167090094501531648', NULL, '2019-07-26 16:08:44', 0, NULL, '2019-07-26 16:08:44', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167090344528187392', NULL, '2019-07-26 16:09:44', 0, NULL, '2019-07-26 16:09:44', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167090589270020096', NULL, '2019-07-26 16:10:56', 0, NULL, '2019-07-26 16:10:56', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167093887158980608', NULL, '2019-07-26 16:23:49', 0, NULL, '2019-07-26 16:23:49', 333, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167094556993523712', NULL, '2019-07-26 16:26:39', 0, NULL, '2019-07-26 16:26:39', 285, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('167094702011584512', NULL, '2019-07-26 16:27:08', 0, NULL, '2019-07-26 16:27:08', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167096518740807680', NULL, '2019-07-26 16:34:16', 0, NULL, '2019-07-26 16:34:16', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167097274172706816', NULL, '2019-07-26 16:37:19', 0, NULL, '2019-07-26 16:37:19', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167098235213582336', NULL, '2019-07-26 16:41:32', 0, NULL, '2019-07-26 16:41:32', 266, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167108139190063104', NULL, '2019-07-26 17:20:47', 0, NULL, '2019-07-26 17:20:47', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167109398034911232', NULL, '2019-07-26 17:25:48', 0, NULL, '2019-07-26 17:25:48', 243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167109436505067520', NULL, '2019-07-26 17:25:59', 0, NULL, '2019-07-26 17:25:59', 3049, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167109753875468288', NULL, '2019-07-26 17:27:00', 0, NULL, '2019-07-26 17:27:00', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('167121782690549760', NULL, '2019-07-26 18:14:39', 0, NULL, '2019-07-26 18:14:39', 351, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('167122280189530112', NULL, '2019-07-26 18:16:38', 0, NULL, '2019-07-26 18:16:38', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168073249605816320', NULL, '2019-07-29 09:15:27', 0, NULL, '2019-07-29 09:15:27', 324, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168074444789518336', NULL, '2019-07-29 09:20:35', 0, NULL, '2019-07-29 09:20:35', 3011, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168075310066044928', NULL, '2019-07-29 09:23:45', 0, NULL, '2019-07-29 09:23:45', 276, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168077217631309824', NULL, '2019-07-29 09:31:35', 0, NULL, '2019-07-29 09:31:35', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('168077220508602368', NULL, '2019-07-29 09:32:00', 0, NULL, '2019-07-29 09:32:00', 981, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('168077223209734144', NULL, '2019-07-29 09:31:43', 0, NULL, '2019-07-29 09:31:43', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test1\"}', 'POST', '/xboot/login', 'test1', 1);
INSERT INTO `t_log` VALUES ('168077237998850048', NULL, '2019-07-29 09:31:38', 0, NULL, '2019-07-29 09:31:38', 129, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168079889402957824', NULL, '2019-07-29 09:42:07', 0, NULL, '2019-07-29 09:42:07', 8765, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168080844156571648', NULL, '2019-07-29 09:45:58', 0, NULL, '2019-07-29 09:45:58', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168080930328547328', NULL, '2019-07-29 09:46:22', 0, NULL, '2019-07-29 09:46:22', 3048, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168080987463356416', NULL, '2019-07-29 09:46:32', 0, NULL, '2019-07-29 09:46:32', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168083240479887360', NULL, '2019-07-29 09:55:30', 0, NULL, '2019-07-29 09:55:30', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168084027528450048', NULL, '2019-07-29 09:58:19', 0, NULL, '2019-07-29 09:58:19', 272, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168084205668929536', NULL, '2019-07-29 09:59:00', 0, NULL, '2019-07-29 09:59:00', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168084249142890496', NULL, '2019-07-29 09:59:12', 0, NULL, '2019-07-29 09:59:12', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168086283925590016', NULL, '2019-07-29 10:07:31', 0, NULL, '2019-07-29 10:07:31', 3046, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168086982600167424', NULL, '2019-07-29 10:10:03', 0, NULL, '2019-07-29 10:10:03', 190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168088493916950528', NULL, '2019-07-29 10:16:22', 0, NULL, '2019-07-29 10:16:22', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168095508303187968', NULL, '2019-07-29 10:44:01', 0, NULL, '2019-07-29 10:44:01', 210, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168107206791663616', NULL, '2019-07-29 11:30:44', 0, NULL, '2019-07-29 11:30:44', 300, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168107326077669376', NULL, '2019-07-29 11:31:02', 0, NULL, '2019-07-29 11:31:02', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168135627429122048', NULL, '2019-07-29 13:23:19', 0, NULL, '2019-07-29 13:23:19', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168137144139780096', NULL, '2019-07-29 13:29:20', 0, NULL, '2019-07-29 13:29:20', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168142183021416448', NULL, '2019-07-29 13:49:22', 0, NULL, '2019-07-29 13:49:22', 326, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168155905026691072', NULL, '2019-07-29 14:43:53', 0, NULL, '2019-07-29 14:43:53', 305, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168155985624436736', NULL, '2019-07-29 14:44:13', 0, NULL, '2019-07-29 14:44:13', 257, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming \"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168156118978138112', NULL, '2019-07-29 14:44:45', 0, NULL, '2019-07-29 14:44:45', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168157456197750784', NULL, '2019-07-29 14:51:17', 0, NULL, '2019-07-29 14:51:17', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168157574867193856', NULL, '2019-07-29 14:50:52', 0, NULL, '2019-07-29 14:50:52', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168159732073238528', NULL, '2019-07-29 14:59:06', 0, NULL, '2019-07-29 14:59:06', 314, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('168162214123933696', NULL, '2019-07-29 15:09:00', 0, NULL, '2019-07-29 15:09:00', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168165290402648064', NULL, '2019-07-29 15:21:30', 0, NULL, '2019-07-29 15:21:30', 404, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168166395761135616', NULL, '2019-07-29 15:25:57', 0, NULL, '2019-07-29 15:25:57', 286, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168166490657263616', NULL, '2019-07-29 15:26:16', 0, NULL, '2019-07-29 15:26:16', 164, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168178134141636608', NULL, '2019-07-29 16:12:13', 0, NULL, '2019-07-29 16:12:13', 241, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168180843301310464', NULL, '2019-07-29 16:23:00', 0, NULL, '2019-07-29 16:23:00', 301, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168180912545075200', NULL, '2019-07-29 16:23:15', 0, NULL, '2019-07-29 16:23:15', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168181867646816256', NULL, '2019-07-29 16:27:07', 0, NULL, '2019-07-29 16:27:07', 463, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168182494514909184', NULL, '2019-07-29 16:29:33', 0, NULL, '2019-07-29 16:29:33', 282, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168186294956986368', NULL, '2019-07-29 16:44:39', 0, NULL, '2019-07-29 16:44:39', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168186378671099904', NULL, '2019-07-29 16:45:00', 0, NULL, '2019-07-29 16:45:00', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168186849066487808', NULL, '2019-07-29 16:46:57', 0, NULL, '2019-07-29 16:46:57', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168187367755091968', NULL, '2019-07-29 16:48:55', 0, NULL, '2019-07-29 16:48:55', 213, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168188394461990912', NULL, '2019-07-29 16:53:00', 0, NULL, '2019-07-29 16:53:00', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168188395506372608', NULL, '2019-07-29 16:53:00', 0, NULL, '2019-07-29 16:53:00', 404, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168199577873158144', NULL, '2019-07-29 17:37:28', 0, NULL, '2019-07-29 17:37:28', 303, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168200860847837184', NULL, '2019-07-29 17:42:33', 0, NULL, '2019-07-29 17:42:33', 338, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168201012656476160', NULL, '2019-07-29 17:43:08', 0, NULL, '2019-07-29 17:43:08', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('168202138160205824', NULL, '2019-07-29 17:47:37', 0, NULL, '2019-07-29 17:47:37', 241, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168204377838850048', NULL, '2019-07-29 17:56:48', 0, NULL, '2019-07-29 17:56:48', 257, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168433265227599872', NULL, '2019-07-30 09:06:12', 0, NULL, '2019-07-30 09:06:12', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168433532383793152', NULL, '2019-07-30 09:07:05', 0, NULL, '2019-07-30 09:07:05', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168434115119419392', NULL, '2019-07-30 09:09:24', 0, NULL, '2019-07-30 09:09:24', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168436276297469952', NULL, '2019-07-30 09:17:59', 0, NULL, '2019-07-30 09:17:59', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168436464231649280', NULL, '2019-07-30 09:18:44', 0, NULL, '2019-07-30 09:18:44', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168453614262554624', NULL, '2019-07-30 10:26:53', 0, NULL, '2019-07-30 10:26:53', 360, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168455205656989696', NULL, '2019-07-30 10:33:12', 0, NULL, '2019-07-30 10:33:12', 194, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168455482887901184', NULL, '2019-07-30 10:34:18', 0, NULL, '2019-07-30 10:34:18', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168456196653584384', NULL, '2019-07-30 10:37:08', 0, NULL, '2019-07-30 10:37:08', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168457754183208960', NULL, '2019-07-30 10:43:20', 0, NULL, '2019-07-30 10:43:20', 272, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168461950949265408', NULL, '2019-07-30 11:00:01', 0, NULL, '2019-07-30 11:00:01', 578, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168463242539044864', NULL, '2019-07-30 11:05:32', 0, NULL, '2019-07-30 11:05:32', 3011, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168463642226855936', NULL, '2019-07-30 11:06:46', 0, NULL, '2019-07-30 11:06:46', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168464191005396992', NULL, '2019-07-30 11:08:57', 0, NULL, '2019-07-30 11:08:57', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168464591888584704', NULL, '2019-07-30 11:10:51', 0, NULL, '2019-07-30 11:10:51', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168468080668708864', NULL, '2019-07-30 11:24:22', 0, NULL, '2019-07-30 11:24:22', 274, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168468195752022016', NULL, '2019-07-30 11:24:49', 0, NULL, '2019-07-30 11:24:49', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168468291189215232', NULL, '2019-07-30 11:26:54', 0, NULL, '2019-07-30 11:26:54', 289, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168469289605533696', NULL, '2019-07-30 11:29:12', 0, NULL, '2019-07-30 11:29:12', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168469352197132288', NULL, '2019-07-30 11:29:25', 0, NULL, '2019-07-30 11:29:25', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168471114769502208', NULL, '2019-07-30 11:36:40', 0, NULL, '2019-07-30 11:36:40', 307, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168472310943059968', NULL, '2019-07-30 11:41:28', 0, NULL, '2019-07-30 11:41:28', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168473607033327616', NULL, '2019-07-30 11:46:36', 0, NULL, '2019-07-30 11:46:36', 190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168473890576666624', NULL, '2019-07-30 11:47:30', 0, NULL, '2019-07-30 11:47:30', 3056, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168473943240347648', NULL, '2019-07-30 11:47:42', 0, NULL, '2019-07-30 11:47:42', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168474812497268736', NULL, '2019-07-30 11:51:28', 0, NULL, '2019-07-30 11:51:28', 3048, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168474960770109440', NULL, '2019-07-30 11:51:46', 0, NULL, '2019-07-30 11:51:46', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168475248121876480', NULL, '2019-07-30 11:52:51', 0, NULL, '2019-07-30 11:52:51', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168477361098985472', NULL, '2019-07-30 12:01:44', 0, NULL, '2019-07-30 12:01:44', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168477687340339200', NULL, '2019-07-30 12:02:35', 0, NULL, '2019-07-30 12:02:35', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168495133120008192', NULL, '2019-07-30 13:11:56', 0, NULL, '2019-07-30 13:11:56', 184, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168495852413784064', NULL, '2019-07-30 13:14:43', 0, NULL, '2019-07-30 13:14:43', 270, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168496216592617472', NULL, '2019-07-30 13:16:33', 0, NULL, '2019-07-30 13:16:33', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168498799616987136', NULL, '2019-07-30 13:26:36', 0, NULL, '2019-07-30 13:26:36', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168500129060360192', NULL, '2019-07-30 13:31:50', 0, NULL, '2019-07-30 13:31:50', 276, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168500926540156928', NULL, '2019-07-30 13:34:53', 0, NULL, '2019-07-30 13:34:53', 165, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168501274155683840', NULL, '2019-07-30 13:36:35', 0, NULL, '2019-07-30 13:36:35', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168501667187134464', NULL, '2019-07-30 13:37:49', 0, NULL, '2019-07-30 13:37:49', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168503242148286464', NULL, '2019-07-30 13:44:05', 0, NULL, '2019-07-30 13:44:05', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168511393547423744', NULL, '2019-07-30 14:16:38', 0, NULL, '2019-07-30 14:16:38', 300, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168517361987489792', NULL, '2019-07-30 14:40:48', 0, NULL, '2019-07-30 14:40:48', 280, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168518850042662912', NULL, '2019-07-30 14:46:28', 0, NULL, '2019-07-30 14:46:28', 3006, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168519335210389504', NULL, '2019-07-30 14:48:02', 0, NULL, '2019-07-30 14:48:02', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168519387395919872', NULL, '2019-07-30 14:48:14', 0, NULL, '2019-07-30 14:48:14', 211, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168519965870133248', NULL, '2019-07-30 14:50:53', 0, NULL, '2019-07-30 14:50:53', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168520127019487232', NULL, '2019-07-30 14:51:30', 0, NULL, '2019-07-30 14:51:30', 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168520128659460096', NULL, '2019-07-30 14:51:30', 0, NULL, '2019-07-30 14:51:30', 135, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168520142395805696', NULL, '2019-07-30 14:51:33', 0, NULL, '2019-07-30 14:51:33', 128, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168520145067577344', NULL, '2019-07-30 14:51:34', 0, NULL, '2019-07-30 14:51:34', 133, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168520680113967104', NULL, '2019-07-30 14:53:23', 0, NULL, '2019-07-30 14:53:23', 284, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168521121728040960', NULL, '2019-07-30 14:55:29', 0, NULL, '2019-07-30 14:55:29', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168521266179870720', NULL, '2019-07-30 14:55:59', 0, NULL, '2019-07-30 14:55:59', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168521443426963456', NULL, '2019-07-30 14:56:35', 0, NULL, '2019-07-30 14:56:35', 287, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168521848445734912', NULL, '2019-07-30 14:58:01', 0, NULL, '2019-07-30 14:58:01', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168522616741564416', NULL, '2019-07-30 15:01:18', 0, NULL, '2019-07-30 15:01:18', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168523607452946432', NULL, '2019-07-30 15:05:00', 0, NULL, '2019-07-30 15:05:00', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168525537717784576', NULL, '2019-07-30 15:12:42', 0, NULL, '2019-07-30 15:12:42', 281, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168527350814740480', NULL, '2019-07-30 15:19:53', 0, NULL, '2019-07-30 15:19:53', 232, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168528684423057408', NULL, '2019-07-30 15:25:32', 0, NULL, '2019-07-30 15:25:32', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168529712153366528', NULL, '2019-07-30 15:29:16', 0, NULL, '2019-07-30 15:29:16', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168536545169510400', NULL, '2019-07-30 15:56:35', 0, NULL, '2019-07-30 15:56:35', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168802884547252224', NULL, '2019-07-31 09:34:45', 0, NULL, '2019-07-31 09:34:45', 342, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168811877990666240', NULL, '2019-07-31 10:10:56', 0, NULL, '2019-07-31 10:10:56', 222, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168813158234853376', NULL, '2019-07-31 10:15:51', 0, NULL, '2019-07-31 10:15:51', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168814703546470400', NULL, '2019-07-31 10:21:43', 0, NULL, '2019-07-31 10:21:43', 213, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"892673\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('168815561961115648', NULL, '2019-07-31 10:25:08', 0, NULL, '2019-07-31 10:25:08', 173, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"580087\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('168816230436704256', NULL, '2019-07-31 10:27:47', 0, NULL, '2019-07-31 10:27:47', 264, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168816834718470144', NULL, '2019-07-31 10:30:11', 0, NULL, '2019-07-31 10:30:11', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168817393861136384', NULL, '2019-07-31 10:32:24', 0, NULL, '2019-07-31 10:32:24', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('168819254060126208', NULL, '2019-07-31 10:39:49', 0, NULL, '2019-07-31 10:39:49', 273, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168820746993274880', NULL, '2019-07-31 10:45:59', 0, NULL, '2019-07-31 10:45:59', 261, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168821702325702656', NULL, '2019-07-31 10:49:32', 0, NULL, '2019-07-31 10:49:32', 380, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168823428969664512', NULL, '2019-07-31 10:56:33', 0, NULL, '2019-07-31 10:56:33', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168823789658836992', NULL, '2019-07-31 10:57:50', 0, NULL, '2019-07-31 10:57:50', 248, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168823854947373056', NULL, '2019-07-31 10:58:05', 0, NULL, '2019-07-31 10:58:05', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168823956730548224', NULL, '2019-07-31 10:58:30', 0, NULL, '2019-07-31 10:58:30', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168825537635028992', NULL, '2019-07-31 11:04:46', 0, NULL, '2019-07-31 11:04:46', 260, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168826124653039616', NULL, '2019-07-31 11:07:10', 0, NULL, '2019-07-31 11:07:10', 281, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168826586978586624', NULL, '2019-07-31 11:08:56', 0, NULL, '2019-07-31 11:08:56', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168831676602912768', NULL, '2019-07-31 11:29:10', 0, NULL, '2019-07-31 11:29:10', 216, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"926695\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('168835821909053440', NULL, '2019-07-31 11:45:59', 0, NULL, '2019-07-31 11:45:59', 264, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168836579723317248', NULL, '2019-07-31 11:48:39', 0, NULL, '2019-07-31 11:48:39', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168837266267967488', NULL, '2019-07-31 11:51:33', 0, NULL, '2019-07-31 11:51:33', 248, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168877026722189312', NULL, '2019-07-31 14:29:22', 0, NULL, '2019-07-31 14:29:22', 228, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168878494837641216', NULL, '2019-07-31 14:35:33', 0, NULL, '2019-07-31 14:35:33', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168884406113538048', NULL, '2019-07-31 15:01:08', 0, NULL, '2019-07-31 15:01:08', 12901, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168885156310945792', NULL, '2019-07-31 15:02:43', 0, NULL, '2019-07-31 15:02:43', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168887365635411968', NULL, '2019-07-31 15:12:03', 0, NULL, '2019-07-31 15:12:03', 4599, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168887787481731072', NULL, '2019-07-31 15:12:30', 0, NULL, '2019-07-31 15:12:30', 6405, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168888059188744192', NULL, '2019-07-31 15:13:12', 0, NULL, '2019-07-31 15:13:12', 231, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('168888278877999104', NULL, '2019-07-31 15:14:05', 0, NULL, '2019-07-31 15:14:05', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168888768701403136', NULL, '2019-07-31 15:16:14', 0, NULL, '2019-07-31 15:16:14', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168888860892205056', NULL, '2019-07-31 15:16:40', 0, NULL, '2019-07-31 15:16:40', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168889043264737280', NULL, '2019-07-31 15:17:11', 0, NULL, '2019-07-31 15:17:11', 3045, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168889059073069056', NULL, '2019-07-31 15:17:12', 0, NULL, '2019-07-31 15:17:12', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168889194737831936', NULL, '2019-07-31 15:17:43', 0, NULL, '2019-07-31 15:17:43', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('168891752927727616', NULL, '2019-07-31 15:27:53', 0, NULL, '2019-07-31 15:27:53', 223, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169160016903802880', NULL, '2019-08-01 09:13:53', 0, NULL, '2019-08-01 09:13:53', 349, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169163126468513792', NULL, '2019-08-01 09:26:32', 0, NULL, '2019-08-01 09:26:32', 284, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169166768336539648', NULL, '2019-08-01 09:40:42', 0, NULL, '2019-08-01 09:40:42', 329, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169168864247025664', NULL, '2019-08-01 09:49:02', 0, NULL, '2019-08-01 09:49:02', 234, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169172878921568256', NULL, '2019-08-01 10:04:59', 0, NULL, '2019-08-01 10:04:59', 219, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"822680\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('169175083913318400', NULL, '2019-08-01 10:13:47', 0, NULL, '2019-08-01 10:13:47', 3085, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169175630447906816', NULL, '2019-08-01 10:16:14', 0, NULL, '2019-08-01 10:16:14', 271, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169187306081619968', NULL, '2019-08-01 11:02:20', 0, NULL, '2019-08-01 11:02:20', 523, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169235219063246848', NULL, '2019-08-01 14:12:42', 0, NULL, '2019-08-01 14:12:42', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169251404609753088', NULL, '2019-08-01 15:17:03', 0, NULL, '2019-08-01 15:17:03', 354, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169253403598262272', NULL, '2019-08-01 15:24:57', 0, NULL, '2019-08-01 15:24:57', 268, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169253521508536320', NULL, '2019-08-01 15:25:46', 0, NULL, '2019-08-01 15:25:46', 255, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169259029376274432', NULL, '2019-08-01 15:47:19', 0, NULL, '2019-08-01 15:47:19', 226, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"429334\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('169259494507810816', NULL, '2019-08-01 15:49:09', 0, NULL, '2019-08-01 15:49:09', 259, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169260279874457600', NULL, '2019-08-01 15:52:17', 0, NULL, '2019-08-01 15:52:17', 184, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169268287094394880', NULL, '2019-08-01 16:24:06', 0, NULL, '2019-08-01 16:24:06', 275, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169268613021175808', NULL, '2019-08-01 16:25:44', 0, NULL, '2019-08-01 16:25:44', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169268707132968960', NULL, '2019-08-01 16:26:00', 0, NULL, '2019-08-01 16:26:00', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169269302233403392', NULL, '2019-08-01 16:28:08', 0, NULL, '2019-08-01 16:28:08', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169269715443650560', NULL, '2019-08-01 16:29:46', 0, NULL, '2019-08-01 16:29:46', 263, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169272213202014208', NULL, '2019-08-01 16:39:43', 0, NULL, '2019-08-01 16:39:43', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('169272936329383936', NULL, '2019-08-01 16:42:34', 0, NULL, '2019-08-01 16:42:34', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169273261157257216', NULL, '2019-08-01 16:43:52', 0, NULL, '2019-08-01 16:43:52', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169273450894987264', NULL, '2019-08-01 16:44:40', 0, NULL, '2019-08-01 16:44:40', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169273910058029056', NULL, '2019-08-01 16:46:38', 0, NULL, '2019-08-01 16:46:38', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169274916896509952', NULL, '2019-08-01 16:50:47', 0, NULL, '2019-08-01 16:50:47', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169275020952997888', NULL, '2019-08-01 16:51:11', 0, NULL, '2019-08-01 16:51:11', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169275935520985088', NULL, '2019-08-01 16:54:29', 0, NULL, '2019-08-01 16:54:29', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169276068979544064', NULL, '2019-08-01 16:55:03', 0, NULL, '2019-08-01 16:55:03', 339, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169276895475535872', NULL, '2019-08-01 16:58:19', 0, NULL, '2019-08-01 16:58:19', 310, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169277502852698112', NULL, '2019-08-01 17:00:43', 0, NULL, '2019-08-01 17:00:43', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169279243425943552', NULL, '2019-08-01 17:07:38', 0, NULL, '2019-08-01 17:07:38', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169279329186877440', NULL, '2019-08-01 17:07:59', 0, NULL, '2019-08-01 17:07:59', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169280530469097472', NULL, '2019-08-01 17:12:48', 0, NULL, '2019-08-01 17:12:48', 3054, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169288150244397056', NULL, '2019-08-01 17:43:02', 0, NULL, '2019-08-01 17:43:02', 234, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169288270176325632', NULL, '2019-08-01 17:43:40', 0, NULL, '2019-08-01 17:43:40', 3050, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169289232215445504', NULL, '2019-08-01 17:47:21', 0, NULL, '2019-08-01 17:47:21', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169521002575826944', NULL, '2019-08-02 09:08:18', 0, NULL, '2019-08-02 09:08:18', 197, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169521048184688640', NULL, '2019-08-02 09:08:29', 0, NULL, '2019-08-02 09:08:29', 456, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169521193399881728', NULL, '2019-08-02 09:09:03', 0, NULL, '2019-08-02 09:09:03', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169521749090635776', NULL, '2019-08-02 09:11:32', 0, NULL, '2019-08-02 09:11:32', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169521755843465216', NULL, '2019-08-02 09:11:33', 0, NULL, '2019-08-02 09:11:33', 128, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169521917366112256', NULL, '2019-08-02 09:11:57', 0, NULL, '2019-08-02 09:11:57', 237, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169522026183135232', NULL, '2019-08-02 09:12:23', 0, NULL, '2019-08-02 09:12:23', 247, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169522199663742976', NULL, '2019-08-02 09:13:03', 0, NULL, '2019-08-02 09:13:03', 279, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169522408372310016', NULL, '2019-08-02 09:13:53', 0, NULL, '2019-08-02 09:13:53', 284, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169522494741417984', NULL, '2019-08-02 09:14:14', 0, NULL, '2019-08-02 09:14:14', 216, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"612206\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('169522570163392512', NULL, '2019-08-02 09:14:32', 0, NULL, '2019-08-02 09:14:32', 310, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169522814204776448', NULL, '2019-08-02 09:15:54', 0, NULL, '2019-08-02 09:15:54', 3047, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169522970807504896', NULL, '2019-08-02 09:16:26', 0, NULL, '2019-08-02 09:16:26', 1372, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169523004793950208', NULL, '2019-08-02 09:16:32', 0, NULL, '2019-08-02 09:16:32', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169523238425071616', NULL, '2019-08-02 09:17:12', 0, NULL, '2019-08-02 09:17:12', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169523863347007488', NULL, '2019-08-02 09:19:46', 0, NULL, '2019-08-02 09:19:46', 5480, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169524762186354688', NULL, '2019-08-02 09:23:15', 0, NULL, '2019-08-02 09:23:15', 286, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169524946727342080', NULL, '2019-08-02 09:23:59', 0, NULL, '2019-08-02 09:23:59', 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169525028759539712', NULL, '2019-08-02 09:24:19', 0, NULL, '2019-08-02 09:24:19', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169525089023299584', NULL, '2019-08-02 09:24:32', 0, NULL, '2019-08-02 09:24:32', 247, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169525625478975488', NULL, '2019-08-02 09:26:52', 0, NULL, '2019-08-02 09:26:52', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169527201757138944', NULL, '2019-08-02 09:33:01', 0, NULL, '2019-08-02 09:33:01', 5538, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169527470649774080', NULL, '2019-08-02 09:34:00', 0, NULL, '2019-08-02 09:34:00', 239, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169527766234959872', NULL, '2019-08-02 09:35:31', 0, NULL, '2019-08-02 09:35:31', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169538096793128960', NULL, '2019-08-02 10:16:31', 0, NULL, '2019-08-02 10:16:31', 269, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169552801532219392', NULL, '2019-08-02 11:14:39', 0, NULL, '2019-08-02 11:14:39', 200, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169553659200278528', NULL, '2019-08-02 11:18:04', 0, NULL, '2019-08-02 11:18:04', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169555210304229376', NULL, '2019-08-02 11:24:14', 0, NULL, '2019-08-02 11:24:14', 243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169559950698221568', NULL, '2019-08-02 11:43:09', 0, NULL, '2019-08-02 11:43:09', 544, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169560102435557376', NULL, '2019-08-02 11:43:40', 0, NULL, '2019-08-02 11:43:40', 313, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169588625120432128', NULL, '2019-08-02 13:37:05', 0, NULL, '2019-08-02 13:37:05', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('169588883837685760', NULL, '2019-08-02 13:38:02', 0, NULL, '2019-08-02 13:38:02', 236, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('169629248850497536', NULL, '2019-08-02 16:18:28', 0, NULL, '2019-08-02 16:18:28', 1093, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170610283998351360', NULL, '2019-08-05 09:16:47', 0, NULL, '2019-08-05 09:16:47', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170630094291734528', NULL, '2019-08-05 10:35:47', 0, NULL, '2019-08-05 10:35:47', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170630151464292352', NULL, '2019-08-05 10:36:01', 0, NULL, '2019-08-05 10:36:01', 238, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170630382306201600', NULL, '2019-08-05 10:36:41', 0, NULL, '2019-08-05 10:36:41', 594, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170632643073806336', NULL, '2019-08-05 10:45:55', 0, NULL, '2019-08-05 10:45:55', 303, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170632701190082560', NULL, '2019-08-05 10:46:03', 0, NULL, '2019-08-05 10:46:03', 458, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170633276476624896', NULL, '2019-08-05 10:48:07', 0, NULL, '2019-08-05 10:48:07', 3048, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170633914807750656', NULL, '2019-08-05 10:51:03', 0, NULL, '2019-08-05 10:51:03', 310, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170633942536294400', NULL, '2019-08-05 10:50:54', 0, NULL, '2019-08-05 10:50:54', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170634630905466880', NULL, '2019-08-05 10:53:27', 0, NULL, '2019-08-05 10:53:27', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170635437893750784', NULL, '2019-08-05 10:56:48', 0, NULL, '2019-08-05 10:56:48', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170635570664443904', NULL, '2019-08-05 10:57:14', 0, NULL, '2019-08-05 10:57:14', 263, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170635606437662720', NULL, '2019-08-05 10:57:22', 0, NULL, '2019-08-05 10:57:22', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170635694853591040', NULL, '2019-08-05 10:57:42', 0, NULL, '2019-08-05 10:57:42', 247, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170635874181058560', NULL, '2019-08-05 10:58:24', 0, NULL, '2019-08-05 10:58:24', 283, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170635951352057856', NULL, '2019-08-05 10:58:42', 0, NULL, '2019-08-05 10:58:42', 238, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170636186790924288', NULL, '2019-08-05 10:59:39', 0, NULL, '2019-08-05 10:59:39', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170636264276496384', NULL, '2019-08-05 10:59:57', 0, NULL, '2019-08-05 10:59:57', 243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170636657811263488', NULL, '2019-08-05 11:01:48', 0, NULL, '2019-08-05 11:01:48', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170636693974552576', NULL, '2019-08-05 11:01:49', 0, NULL, '2019-08-05 11:01:49', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170636744054542336', NULL, '2019-08-05 11:01:57', 0, NULL, '2019-08-05 11:01:57', 347, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170638293250084864', NULL, '2019-08-05 11:08:01', 0, NULL, '2019-08-05 11:08:01', 257, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/portal/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('170638537207582720', NULL, '2019-08-05 11:08:59', 0, NULL, '2019-08-05 11:08:59', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170639776733466624', NULL, '2019-08-05 11:13:55', 0, NULL, '2019-08-05 11:13:55', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170640039808602112', NULL, '2019-08-05 11:14:58', 0, NULL, '2019-08-05 11:14:58', 532, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170640169186103296', NULL, '2019-08-05 11:15:49', 0, NULL, '2019-08-05 11:15:49', 253, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170640737438797824', NULL, '2019-08-05 11:17:44', 0, NULL, '2019-08-05 11:17:44', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170641725046394880', NULL, '2019-08-05 11:21:46', 0, NULL, '2019-08-05 11:21:46', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170642171853017088', NULL, '2019-08-05 11:23:25', 0, NULL, '2019-08-05 11:23:25', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170644193054560256', NULL, '2019-08-05 11:31:38', 0, NULL, '2019-08-05 11:31:38', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170644264458391552', NULL, '2019-08-05 11:31:50', 0, NULL, '2019-08-05 11:31:50', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170646598638899200', NULL, '2019-08-05 11:41:21', 0, NULL, '2019-08-05 11:41:21', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170647494680645632', NULL, '2019-08-05 11:44:34', 0, NULL, '2019-08-05 11:44:34', 165, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170677059293548544', NULL, '2019-08-05 13:42:07', 0, NULL, '2019-08-05 13:42:07', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170677091950399488', NULL, '2019-08-05 13:42:14', 0, NULL, '2019-08-05 13:42:14', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170677119024631808', NULL, '2019-08-05 13:42:19', 0, NULL, '2019-08-05 13:42:19', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170678144460656640', NULL, '2019-08-05 13:46:50', 0, NULL, '2019-08-05 13:46:50', 300, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170678174982606848', NULL, '2019-08-05 13:46:46', 0, NULL, '2019-08-05 13:46:46', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170678310559289344', NULL, '2019-08-05 13:47:08', 0, NULL, '2019-08-05 13:47:08', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170681218667384832', NULL, '2019-08-05 13:58:35', 0, NULL, '2019-08-05 13:58:35', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170681340591607808', NULL, '2019-08-05 13:59:04', 0, NULL, '2019-08-05 13:59:04', 167, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170682106190499840', NULL, '2019-08-05 14:02:07', 0, NULL, '2019-08-05 14:02:07', 246, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170682184561070080', NULL, '2019-08-05 14:02:25', 0, NULL, '2019-08-05 14:02:25', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170682928638988288', NULL, '2019-08-05 14:05:44', 0, NULL, '2019-08-05 14:05:44', 297, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170682965741801472', NULL, '2019-08-05 14:05:52', 0, NULL, '2019-08-05 14:05:52', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170682979218100224', NULL, '2019-08-05 14:05:56', 0, NULL, '2019-08-05 14:05:56', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170683917387436032', NULL, '2019-08-05 14:09:18', 0, NULL, '2019-08-05 14:09:18', 214, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170684495052148736', NULL, '2019-08-05 14:11:51', 0, NULL, '2019-08-05 14:11:51', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170684759708536832', NULL, '2019-08-05 14:12:40', 0, NULL, '2019-08-05 14:12:40', 260, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170684816855928832', NULL, '2019-08-05 14:12:54', 0, NULL, '2019-08-05 14:12:54', 519, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170687863061483520', NULL, '2019-08-05 14:25:00', 0, NULL, '2019-08-05 14:25:00', 247, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170688002006192128', NULL, '2019-08-05 14:25:53', 0, NULL, '2019-08-05 14:25:53', 269, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170688033752879104', NULL, '2019-08-05 14:26:01', 0, NULL, '2019-08-05 14:26:01', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/portal/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170690041431986176', NULL, '2019-08-05 14:33:39', 0, NULL, '2019-08-05 14:33:39', 167, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170690163989549056', NULL, '2019-08-05 14:34:09', 0, NULL, '2019-08-05 14:34:09', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170694467907489792', NULL, '2019-08-05 14:51:31', 0, NULL, '2019-08-05 14:51:31', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170695445905936384', NULL, '2019-08-05 14:55:48', 0, NULL, '2019-08-05 14:55:48', 244, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170695493930717184', NULL, '2019-08-05 14:55:39', 0, NULL, '2019-08-05 14:55:39', 235, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170695582912876544', NULL, '2019-08-05 14:56:01', 0, NULL, '2019-08-05 14:56:01', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170696904399654912', NULL, '2019-08-05 15:00:55', 0, NULL, '2019-08-05 15:00:55', 238, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170696988847771648', NULL, '2019-08-05 15:01:18', 0, NULL, '2019-08-05 15:01:18', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('170699271471894528', NULL, '2019-08-05 15:10:40', 0, NULL, '2019-08-05 15:10:40', 243, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170699893877248000', NULL, '2019-08-05 15:12:48', 0, NULL, '2019-08-05 15:12:48', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170700617935753216', NULL, '2019-08-05 15:16:01', 0, NULL, '2019-08-05 15:16:01', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170700812052336640', NULL, '2019-08-05 15:16:43', 0, NULL, '2019-08-05 15:16:43', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170700822366130176', NULL, '2019-08-05 15:16:40', 0, NULL, '2019-08-05 15:16:40', 132, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170701036049141760', NULL, '2019-08-05 15:17:24', 0, NULL, '2019-08-05 15:17:24', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"liming\"}', 'POST', '/portal/xboot/login', 'liming', 1);
INSERT INTO `t_log` VALUES ('170702805852491776', NULL, '2019-08-05 15:24:22', 0, NULL, '2019-08-05 15:24:22', 257, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170705536872878080', NULL, '2019-08-05 15:35:40', 0, NULL, '2019-08-05 15:35:40', 5760, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170707500356603904', NULL, '2019-08-05 15:43:01', 0, NULL, '2019-08-05 15:43:01', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170708094416850944', NULL, '2019-08-05 15:45:23', 0, NULL, '2019-08-05 15:45:23', 296, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170709847845638144', NULL, '2019-08-05 15:52:21', 0, NULL, '2019-08-05 15:52:21', 304, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170713406733553664', NULL, '2019-08-05 16:06:29', 0, NULL, '2019-08-05 16:06:29', 340, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170713614863306752', NULL, '2019-08-05 16:07:19', 0, NULL, '2019-08-05 16:07:19', 358, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170713834007302144', NULL, '2019-08-05 16:08:11', 0, NULL, '2019-08-05 16:08:11', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170714153051230208', NULL, '2019-08-05 16:09:27', 0, NULL, '2019-08-05 16:09:27', 304, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen \"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('170714155727196160', NULL, '2019-08-05 16:09:28', 0, NULL, '2019-08-05 16:09:28', 135, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen \"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('170714336329732096', NULL, '2019-08-05 16:10:11', 0, NULL, '2019-08-05 16:10:11', 273, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin \"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170714530454704128', NULL, '2019-08-05 16:11:18', 0, NULL, '2019-08-05 16:11:18', 399, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170714919602229248', NULL, '2019-08-05 16:12:30', 0, NULL, '2019-08-05 16:12:30', 232, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170715973924425728', NULL, '2019-08-05 16:16:41', 0, NULL, '2019-08-05 16:16:41', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170716423893553152', NULL, '2019-08-05 16:18:28', 0, NULL, '2019-08-05 16:18:28', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170716524678483968', NULL, '2019-08-05 16:18:52', 0, NULL, '2019-08-05 16:18:52', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170716763997081600', NULL, '2019-08-05 16:19:49', 0, NULL, '2019-08-05 16:19:49', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170717073234726912', NULL, '2019-08-05 16:21:03', 0, NULL, '2019-08-05 16:21:03', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170718589286879232', NULL, '2019-08-05 16:27:12', 0, NULL, '2019-08-05 16:27:12', 192, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170718843264569344', NULL, '2019-08-05 16:28:05', 0, NULL, '2019-08-05 16:28:05', 282, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"794942\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('170722362482757632', NULL, '2019-08-05 16:42:04', 0, NULL, '2019-08-05 16:42:04', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170722556800667648', NULL, '2019-08-05 16:42:51', 0, NULL, '2019-08-05 16:42:51', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170723429383671808', NULL, '2019-08-05 16:46:19', 0, NULL, '2019-08-05 16:46:19', 273, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170724322216775680', NULL, '2019-08-05 16:49:52', 0, NULL, '2019-08-05 16:49:52', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170728121186652160', NULL, '2019-08-05 17:04:57', 0, NULL, '2019-08-05 17:04:57', 302, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170728436233408512', NULL, '2019-08-05 17:06:12', 0, NULL, '2019-08-05 17:06:12', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170728855051440128', NULL, '2019-08-05 17:07:55', 0, NULL, '2019-08-05 17:07:55', 3045, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170729815970680832', NULL, '2019-08-05 17:11:41', 0, NULL, '2019-08-05 17:11:41', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170729941275512832', NULL, '2019-08-05 17:12:14', 0, NULL, '2019-08-05 17:12:14', 3044, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170730178304020480', NULL, '2019-08-05 17:13:08', 0, NULL, '2019-08-05 17:13:08', 165, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170730952744505344', NULL, '2019-08-05 17:16:12', 0, NULL, '2019-08-05 17:16:12', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170732242623008768', NULL, '2019-08-05 17:21:20', 0, NULL, '2019-08-05 17:21:20', 168, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"057039\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('170732461347573760', NULL, '2019-08-05 17:22:12', 0, NULL, '2019-08-05 17:22:12', 184, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170734279326699520', NULL, '2019-08-05 17:29:25', 0, NULL, '2019-08-05 17:29:25', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170734564103163904', NULL, '2019-08-05 17:30:33', 0, NULL, '2019-08-05 17:30:33', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170734936226009088', NULL, '2019-08-05 17:32:02', 0, NULL, '2019-08-05 17:32:02', 378, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"669752\",\"username\":\"XieAiGuo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170737007390101504', NULL, '2019-08-05 17:40:16', 0, NULL, '2019-08-05 17:40:16', 296, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"602696\",\"username\":\"XieAiGuo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170737226718646272', NULL, '2019-08-05 17:41:08', 0, NULL, '2019-08-05 17:41:08', 166, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"929230\",\"username\":\"XieAiGuo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170737790382772224', NULL, '2019-08-05 17:43:23', 0, NULL, '2019-08-05 17:43:23', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('170737920859181056', NULL, '2019-08-05 17:43:54', 0, NULL, '2019-08-05 17:43:54', 248, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"127367\",\"username\":\"XieAiGuo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170738155777953792', NULL, '2019-08-05 17:44:50', 0, NULL, '2019-08-05 17:44:50', 242, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170738539854565376', NULL, '2019-08-05 17:46:21', 0, NULL, '2019-08-05 17:46:21', 248, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"789322\",\"username\":\"XieAiGuo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170740714190147584', NULL, '2019-08-05 17:55:00', 0, NULL, '2019-08-05 17:55:00', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170741521643999232', NULL, '2019-08-05 17:58:12', 0, NULL, '2019-08-05 17:58:12', 239, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('170742008963403776', NULL, '2019-08-05 18:00:08', 0, NULL, '2019-08-05 18:00:08', 170, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"431400\",\"username\":\"xieaiguo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('170971511190982656', NULL, '2019-08-06 09:12:09', 0, NULL, '2019-08-06 09:12:09', 3012, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('170979847131107328', NULL, '2019-08-06 09:45:14', 0, NULL, '2019-08-06 09:45:14', 283, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"441470\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171004498687299584', NULL, '2019-08-06 11:23:11', 0, NULL, '2019-08-06 11:23:11', 258, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171011839151312896', NULL, '2019-08-06 11:52:21', 0, NULL, '2019-08-06 11:52:21', 365, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171037110227177472', NULL, '2019-08-06 13:32:52', 0, NULL, '2019-08-06 13:32:52', 6157, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171037803772121088', NULL, '2019-08-06 13:35:31', 0, NULL, '2019-08-06 13:35:31', 249, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171039438070091776', NULL, '2019-08-06 13:42:01', 0, NULL, '2019-08-06 13:42:01', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171040615482527744', NULL, '2019-08-06 13:46:45', 0, NULL, '2019-08-06 13:46:45', 3052, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171040820810485760', NULL, '2019-08-06 13:47:31', 0, NULL, '2019-08-06 13:47:31', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171042562818183168', NULL, '2019-08-06 13:54:26', 0, NULL, '2019-08-06 13:54:26', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171042695165251584', NULL, '2019-08-06 13:54:58', 0, NULL, '2019-08-06 13:54:58', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171042747011043328', NULL, '2019-08-06 13:55:38', 0, NULL, '2019-08-06 13:55:38', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171042884739403776', NULL, '2019-08-06 13:55:43', 0, NULL, '2019-08-06 13:55:43', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171043472747270144', NULL, '2019-08-06 13:58:03', 0, NULL, '2019-08-06 13:58:03', 333, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171043910028627968', NULL, '2019-08-06 13:59:48', 0, NULL, '2019-08-06 13:59:48', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171044244679561216', NULL, '2019-08-06 14:01:07', 0, NULL, '2019-08-06 14:01:07', 285, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"219890\",\"username\":\"15124188888\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171045138963894272', NULL, '2019-08-06 14:04:40', 0, NULL, '2019-08-06 14:04:40', 252, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171045441855557632', NULL, '2019-08-06 14:05:52', 0, NULL, '2019-08-06 14:05:52', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171047179941580800', NULL, '2019-08-06 14:12:52', 0, NULL, '2019-08-06 14:12:52', 5203, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171047347713740800', NULL, '2019-08-06 14:13:30', 0, NULL, '2019-08-06 14:13:30', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171047448540614656', NULL, '2019-08-06 14:13:51', 0, NULL, '2019-08-06 14:13:51', 280, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171047504270331904', NULL, '2019-08-06 14:14:04', 0, NULL, '2019-08-06 14:14:04', 180, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171047640002203648', NULL, '2019-08-06 14:14:36', 0, NULL, '2019-08-06 14:14:36', 168, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171047905715556352', NULL, '2019-08-06 14:16:04', 0, NULL, '2019-08-06 14:16:04', 3004, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171049422937919488', NULL, '2019-08-06 14:21:42', 0, NULL, '2019-08-06 14:21:42', 221, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"202350\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171049472686559232', NULL, '2019-08-06 14:21:53', 0, NULL, '2019-08-06 14:21:53', 184, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"202350\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171050078054649856', NULL, '2019-08-06 14:24:18', 0, NULL, '2019-08-06 14:24:18', 190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171051475919704064', NULL, '2019-08-06 14:29:51', 0, NULL, '2019-08-06 14:29:51', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171052459425271808', NULL, '2019-08-06 14:33:46', 0, NULL, '2019-08-06 14:33:46', 212, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"313397\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171056546787102720', NULL, '2019-08-06 14:50:03', 0, NULL, '2019-08-06 14:50:03', 3051, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171056644547940352', NULL, '2019-08-06 14:50:50', 0, NULL, '2019-08-06 14:50:50', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171057627638272000', NULL, '2019-08-06 14:54:18', 0, NULL, '2019-08-06 14:54:18', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171058148533080064', NULL, '2019-08-06 14:56:39', 0, NULL, '2019-08-06 14:56:39', 175, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171060169935949824', NULL, '2019-08-06 15:04:24', 0, NULL, '2019-08-06 15:04:24', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171060284310425600', NULL, '2019-08-06 15:04:51', 0, NULL, '2019-08-06 15:04:51', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171060373695238144', NULL, '2019-08-06 15:05:15', 0, NULL, '2019-08-06 15:05:15', 3003, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171062543781990400', NULL, '2019-08-06 15:13:54', 0, NULL, '2019-08-06 15:13:54', 3005, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171062767569080320', NULL, '2019-08-06 15:14:46', 0, NULL, '2019-08-06 15:14:46', 3048, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171071938490273792', NULL, '2019-08-06 15:51:10', 0, NULL, '2019-08-06 15:51:10', 229, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171073253748510720', NULL, '2019-08-06 15:56:35', 0, NULL, '2019-08-06 15:56:35', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171081217368657920', NULL, '2019-08-06 16:28:02', 0, NULL, '2019-08-06 16:28:02', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171086657045401600', NULL, '2019-08-06 16:49:39', 0, NULL, '2019-08-06 16:49:39', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171087255052488704', NULL, '2019-08-06 16:52:02', 0, NULL, '2019-08-06 16:52:02', 250, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171087385277239296', NULL, '2019-08-06 16:52:34', 0, NULL, '2019-08-06 16:52:34', 186, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171087428314992640', NULL, '2019-08-06 16:52:43', 0, NULL, '2019-08-06 16:52:43', 278, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171087501803393024', NULL, '2019-08-06 16:53:00', 0, NULL, '2019-08-06 16:53:00', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171087833988075520', NULL, '2019-08-06 16:54:20', 0, NULL, '2019-08-06 16:54:20', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171087882214182912', NULL, '2019-08-06 16:54:31', 0, NULL, '2019-08-06 16:54:31', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171090092503339008', NULL, '2019-08-06 17:03:18', 0, NULL, '2019-08-06 17:03:18', 267, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171094266104254464', NULL, '2019-08-06 17:19:53', 0, NULL, '2019-08-06 17:19:53', 326, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portal/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171103193512546304', NULL, '2019-08-06 17:55:22', 0, NULL, '2019-08-06 17:55:22', 225, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"413613\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171103283711053824', NULL, '2019-08-06 17:55:43', 0, NULL, '2019-08-06 17:55:43', 179, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"075813\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171103496370655232', NULL, '2019-08-06 17:56:34', 0, NULL, '2019-08-06 17:56:34', 237, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"056267\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171103721789329408', NULL, '2019-08-06 17:57:27', 0, NULL, '2019-08-06 17:57:27', 249, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"dsada\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171104002333741056', NULL, '2019-08-06 17:58:34', 0, NULL, '2019-08-06 17:58:34', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171104180142870528', NULL, '2019-08-06 17:59:17', 0, NULL, '2019-08-06 17:59:17', 241, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"5982aa\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171104302058704896', NULL, '2019-08-06 17:59:46', 0, NULL, '2019-08-06 17:59:46', 167, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"d\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171104946765172736', NULL, '2019-08-06 18:02:20', 0, NULL, '2019-08-06 18:02:20', 275, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"l\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171107018021539840', NULL, '2019-08-06 18:10:33', 0, NULL, '2019-08-06 18:10:33', 185, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"18309\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171107144916013056', NULL, '2019-08-06 18:11:04', 0, NULL, '2019-08-06 18:11:04', 280, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"1\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171129905541550080', NULL, '2019-08-06 19:41:36', 0, NULL, '2019-08-06 19:41:36', 5933, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"1\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171332044276633600', NULL, '2019-08-07 09:04:44', 0, NULL, '2019-08-07 09:04:44', 285, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171332071334088704', NULL, '2019-08-07 09:04:50', 0, NULL, '2019-08-07 09:04:50', 302, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"528511\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171337269993541632', NULL, '2019-08-07 09:25:30', 0, NULL, '2019-08-07 09:25:30', 358, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171358948962603008', NULL, '2019-08-07 10:51:38', 0, NULL, '2019-08-07 10:51:38', 308, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171361926683561984', NULL, '2019-08-07 11:03:28', 0, NULL, '2019-08-07 11:03:28', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171364342539751424', NULL, '2019-08-07 11:13:04', 0, NULL, '2019-08-07 11:13:04', 190, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171366230412759040', NULL, '2019-08-07 11:20:37', 0, NULL, '2019-08-07 11:20:37', 3055, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171366284015964160', NULL, '2019-08-07 11:20:50', 0, NULL, '2019-08-07 11:20:50', 3045, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171371433971159040', NULL, '2019-08-07 11:41:15', 0, NULL, '2019-08-07 11:41:15', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171371839375806464', NULL, '2019-08-07 11:42:52', 0, NULL, '2019-08-07 11:42:52', 286, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171372249801035776', NULL, '2019-08-07 11:44:29', 0, NULL, '2019-08-07 11:44:29', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171372352204967936', NULL, '2019-08-07 11:44:54', 0, NULL, '2019-08-07 11:44:54', 177, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"559589\",\"username\":\"xieaiguo\"}', 'POST', '/xboot/login/code', 'XieAiGuo', 1);
INSERT INTO `t_log` VALUES ('171372770997833728', NULL, '2019-08-07 11:46:34', 0, NULL, '2019-08-07 11:46:34', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171374215864258560', NULL, '2019-08-07 11:52:19', 0, NULL, '2019-08-07 11:52:19', 561, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171375881283964928', NULL, '2019-08-07 11:58:55', 0, NULL, '2019-08-07 11:58:55', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test \"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171401123372994560', NULL, '2019-08-07 13:39:14', 0, NULL, '2019-08-07 13:39:14', 323, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171401794704904192', NULL, '2019-08-07 13:41:54', 0, NULL, '2019-08-07 13:41:54', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171409401108762624', NULL, '2019-08-07 14:12:10', 0, NULL, '2019-08-07 14:12:10', 3009, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171409975149596672', NULL, '2019-08-07 14:14:24', 0, NULL, '2019-08-07 14:14:24', 172, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171424359905234944', NULL, '2019-08-07 15:11:34', 0, NULL, '2019-08-07 15:11:34', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171431984097136640', NULL, '2019-08-07 15:41:51', 0, NULL, '2019-08-07 15:41:51', 322, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"004211\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171432039126405120', NULL, '2019-08-07 15:42:04', 0, NULL, '2019-08-07 15:42:04', 186, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"004211\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171435505144041472', NULL, '2019-08-07 15:55:57', 0, NULL, '2019-08-07 15:55:57', 35089, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"702542\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171435855787855872', NULL, '2019-08-07 15:57:14', 0, NULL, '2019-08-07 15:57:14', 210, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"029202\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171435882786590720', NULL, '2019-08-07 15:57:21', 0, NULL, '2019-08-07 15:57:21', 173, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"029202\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171437003022274560', NULL, '2019-08-07 16:05:59', 0, NULL, '2019-08-07 16:05:59', 250880, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171438293525729280', NULL, '2019-08-07 16:07:03', 0, NULL, '2019-08-07 16:07:03', 8078, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171443666223632384', NULL, '2019-08-07 16:28:17', 0, NULL, '2019-08-07 16:28:17', 280, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"591040\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171444254122446848', NULL, '2019-08-07 16:30:40', 0, NULL, '2019-08-07 16:30:40', 3072, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171446688404213760', NULL, '2019-08-07 16:40:20', 0, NULL, '2019-08-07 16:40:20', 3029, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"756542\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171448861133377536', NULL, '2019-08-07 16:48:55', 0, NULL, '2019-08-07 16:48:55', 188, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171458293347127296', NULL, '2019-08-07 17:26:24', 0, NULL, '2019-08-07 17:26:24', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171458343745884160', NULL, '2019-08-07 17:26:36', 0, NULL, '2019-08-07 17:26:36', 169, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen \"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171459295374741504', NULL, '2019-08-07 17:30:23', 0, NULL, '2019-08-07 17:30:23', 292, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171459304497352704', NULL, '2019-08-07 17:30:25', 0, NULL, '2019-08-07 17:30:25', 142, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171459357475606528', NULL, '2019-08-07 17:30:38', 0, NULL, '2019-08-07 17:30:38', 213, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171459874012532736', NULL, '2019-08-07 17:32:41', 0, NULL, '2019-08-07 17:32:41', 187, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171460502952611840', NULL, '2019-08-07 17:35:11', 0, NULL, '2019-08-07 17:35:11', 245, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171460682426880000', NULL, '2019-08-07 17:35:54', 0, NULL, '2019-08-07 17:35:54', 278, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171460691910201344', NULL, '2019-08-07 17:35:56', 0, NULL, '2019-08-07 17:35:56', 134, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171460710805540864', NULL, '2019-08-07 17:36:00', 0, NULL, '2019-08-07 17:36:00', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/portalManage/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171460795316572160', NULL, '2019-08-07 17:36:20', 0, NULL, '2019-08-07 17:36:20', 166, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171460921921638400', NULL, '2019-08-07 17:36:51', 0, NULL, '2019-08-07 17:36:51', 174, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171461084291534848', NULL, '2019-08-07 17:37:29', 0, NULL, '2019-08-07 17:37:29', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171461273467228160', NULL, '2019-08-07 17:38:14', 0, NULL, '2019-08-07 17:38:14', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171461787168804864', NULL, '2019-08-07 17:40:17', 0, NULL, '2019-08-07 17:40:17', 240, '127.0.0.1', '未知', '登录系统', '{\"rewxcode\":\"851062\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login/code', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171699846523129856', NULL, '2019-08-08 09:26:15', 0, NULL, '2019-08-08 09:26:15', 230, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171700052710920192', NULL, '2019-08-08 09:27:04', 0, NULL, '2019-08-08 09:27:04', 181, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171702554311266304', NULL, '2019-08-08 09:37:00', 0, NULL, '2019-08-08 09:37:00', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171708074476703744', NULL, '2019-08-08 09:58:57', 0, NULL, '2019-08-08 09:58:57', 340, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"XueBoWen\"}', 'POST', '/xboot/login', 'XueBoWen', 1);
INSERT INTO `t_log` VALUES ('171708248594845696', NULL, '2019-08-08 09:59:38', 0, NULL, '2019-08-08 09:59:38', 254, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171708431428751360', NULL, '2019-08-08 10:00:21', 0, NULL, '2019-08-08 10:00:21', 236, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171710569185808384', NULL, '2019-08-08 10:08:51', 0, NULL, '2019-08-08 10:08:51', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171712553305509888', NULL, '2019-08-08 10:16:44', 0, NULL, '2019-08-08 10:16:44', 219, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171713136959688704', NULL, '2019-08-08 10:19:03', 0, NULL, '2019-08-08 10:19:03', 260, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171717900686594048', NULL, '2019-08-08 10:37:59', 0, NULL, '2019-08-08 10:37:59', 256, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171733188064841728', NULL, '2019-08-08 11:38:44', 0, NULL, '2019-08-08 11:38:44', 226, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171734706641965056', NULL, '2019-08-08 11:44:46', 0, NULL, '2019-08-08 11:44:46', 265, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171734775659237376', NULL, '2019-08-08 11:45:02', 0, NULL, '2019-08-08 11:45:02', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171735916220518400', NULL, '2019-08-08 11:49:34', 0, NULL, '2019-08-08 11:49:34', 173, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171736592468152320', NULL, '2019-08-08 11:52:16', 0, NULL, '2019-08-08 11:52:16', 170, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171736675033026560', NULL, '2019-08-08 11:52:35', 0, NULL, '2019-08-08 11:52:35', 171, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171737252592881664', NULL, '2019-08-08 11:54:53', 0, NULL, '2019-08-08 11:54:53', 381, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171737603056340992', NULL, '2019-08-08 11:56:16', 0, NULL, '2019-08-08 11:56:16', 179, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171738644623659008', NULL, '2019-08-08 12:00:25', 0, NULL, '2019-08-08 12:00:25', 183, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171738677565722624', NULL, '2019-08-08 12:00:33', 0, NULL, '2019-08-08 12:00:33', 240, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171749962210611200', NULL, '2019-08-08 12:45:26', 0, NULL, '2019-08-08 12:45:26', 3060, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171762955182936064', NULL, '2019-08-08 13:37:01', 0, NULL, '2019-08-08 13:37:01', 182, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171768600762257408', NULL, '2019-08-08 13:59:27', 0, NULL, '2019-08-08 13:59:27', 448, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171769727780130816', NULL, '2019-08-08 14:03:56', 0, NULL, '2019-08-08 14:03:56', 167, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171770274675429376', NULL, '2019-08-08 14:06:06', 0, NULL, '2019-08-08 14:06:06', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171770276147630080', NULL, '2019-08-08 14:06:06', 0, NULL, '2019-08-08 14:06:06', 128, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('171772558566232064', NULL, '2019-08-08 14:15:11', 0, NULL, '2019-08-08 14:15:11', 285, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171775496739098624', NULL, '2019-08-08 14:26:51', 0, NULL, '2019-08-08 14:26:51', 222, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171776103864602624', NULL, '2019-08-08 14:29:16', 0, NULL, '2019-08-08 14:29:16', 178, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171796963019198464', NULL, '2019-08-08 15:52:09', 0, NULL, '2019-08-08 15:52:09', 219, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"tesT\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('171797033982627840', NULL, '2019-08-08 15:52:26', 0, NULL, '2019-08-08 15:52:26', 176, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"admin\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171797076772917248', NULL, '2019-08-08 15:52:36', 0, NULL, '2019-08-08 15:52:36', 177, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"ADMIN\"}', 'POST', '/xboot/login', 'admin', 1);
INSERT INTO `t_log` VALUES ('171820776863830016', NULL, '2019-08-08 17:26:47', 0, NULL, '2019-08-08 17:26:47', 185, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('172059881761673216', NULL, '2019-08-09 09:16:54', 0, NULL, '2019-08-09 09:16:54', 239, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);
INSERT INTO `t_log` VALUES ('172062012090617856', NULL, '2019-08-09 09:25:22', 0, NULL, '2019-08-09 09:25:22', 336, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"nijianping\"}', 'POST', '/xboot/login', 'nijianping', 1);
INSERT INTO `t_log` VALUES ('172062096488402944', NULL, '2019-08-09 09:25:42', 0, NULL, '2019-08-09 09:25:42', 251, '127.0.0.1', '未知', '登录系统', '{\"password\":\"你是看不见我的\",\"saveLogin\":\"undefined\",\"username\":\"test\"}', 'POST', '/xboot/login', 'test', 1);

-- ----------------------------
-- Table structure for t_my_test
-- ----------------------------
DROP TABLE IF EXISTS `t_my_test`;
CREATE TABLE `t_my_test`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `ews_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新闻描述',
  `news_conten` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '新闻内容',
  `news_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新闻图片路径',
  `news_is_top` int(11) DEFAULT NULL COMMENT '是否置顶0:是，1：否',
  `news_rate` int(11) DEFAULT NULL COMMENT '新闻级别',
  `news_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '新闻标题',
  `news_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('168550203928875008', NULL, '2019-07-30 16:50:41', 0, NULL, '2019-08-08 14:08:34', NULL, '<p class=\"ql-align-center\"><br></p><p><img src=\"data:image/png;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5Ojf/2wBDAQoKCg0MDRoPDxo3JR8lNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzf/wAARCAC0ALQDASIAAhEBAxEB/8QAHAABAAEEAwAAAAAAAAAAAAAAAAgBAwQHAgUG/8QAQhAAAQMCAgMMBwYEBwAAAAAAAAECAwQFBhESITEHExc3QVFUcYOTs9IUIjJhgZHTFSNiobHBMzVC0UVSU1VzkvD/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAMBEBAAECAwUHAwQDAAAAAAAAAAECEQMEEhMUITFRMlJhYnGRoTNB8AVTwdGB4fH/2gAMAwEAAhEDEQA/AN4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAKgHiMQ7pdmw/eKi1VtLcHzwaOk6KNitXSajkyzei7FTkImYjmtTRVXNqYe3Brjhlw50K691H5xwy4c6Fde6j85XXT1abvi91scGuOGXDnQrr3UfnHDLhzoV17qP6g109Td8Xutjg123dgsL/Zt93VOdII/Oc03WbIv+HXb4xRfUG0o6rxk8xVyon2bBBr/AIWrJ/t90/6Q/UKcLVky/l91Xqji+oNpR1TuOZ/bn2bBBrt269Ym7bdeE7GPznDhlw7y0V17qP6g2lPVScrjU86ZbHBrjhlw50K691H5xwy4c6Fde6j+oNdPVG74vdbHBrjhlw50K691H9QcMuHOhXXuo/ONdPU3fF7rY4NccMuHOhXXuo/OOGXDnQrr3UfnGunqbvi91scGuOGXDnQrr3UfnHDLhzoV17qPzjXT1N3xe62ODXHDLhzoV17qPzns8O3mnxBZqe6UbJWQT6Wi2ZERyZOVq55KqbUXlJiqJ5KVYVdEXqh2agKCyipHHda4wbr2PgsJHEcd1rjBuvY+Cwyxuy68l9SfR5A5Ma57kaxqqq8iFYo3SvRjNqmXJKykbvUGSyf1PU5pl7WHhRVGqqbU/nJxSkjiajqmTL8KFFq449VPC1PxO2mK5znuVzlVVXlUvxQRSMRyzK1eVNBVyIt1aU4kzOnBiI9r+8/w4vqp37ZFTq1FpXK72nKvWpleixdIXu1HosX+uvdqLwirCx6u1N/8x/bEBmsoWParmz6k2roZGGqIirormnIpN7ssTCrw4iavuq2R7fZe5OpS56TLscqPTmemZZBNlYxK45SvacL/AG41avOxf2Uej6aZwva/8OxfkWQRZbaRPaj+FVRWrk5FRU5FKF5J1cmjM3fG867U+JwexE1sdpN/NOsIqpjnTLgACWYAABI3ck4vrT23ivI5EjdyTi+tPbeK81wu05M79OPV69QFB0PMVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PN0T97jncnto1NH/3yMZWPVfZd8jjymRTVb4VRHKrmcy/scz26a6a4porm0QspG9Vy0HZ9R3NNCkMSMTbtVfec2OR7Uc1c0XlORnNV3rZbK04U6om6hwlerG+rrc7U1PeXDFfK1qOqHa0T1Y05/eRDfEr0ws1blRGUkCOe96oioiZq5V5OtTFdS1DZHRuglSRvtMVi5t60PY4WwlefTsO39sKT0lRcInfco5zo0STW5yZak9VdZsjEFXdrfSYmqsO075bitzhZ91BvrtH0eDPVkuzNfmdFOHw4vmMznNeLw/59mhWU1Q+VIWQSulVM0YjFVy/A5SUdVFDv0lNMyLZpuYqN+ZvWlkrKnEOCKy6wrHcZaSr9I0o9B2aMbkipybV1e9TJjqLZNYbZYbw37m7tmiY5V2PR2aJ7l16l50TnL7Pxc85mYtw/OP9I/SU80UbJJYZGMk1sc5qojupeUpFFJNIkcMbpHrsaxuar8Db+6FZKOmsWGrVd7syhZSwyM9I3h8qPc1GJlk3WmaZr8CzuXUNDQXK7Psl0ZdJUoFVr20r41Y7PUmT9ueSbCujjZfeI0arfnq1XNQVsDNOakqI255aT4lRM/kW5aeeGXepoZI5F/oe1UX5G1LZfMfXK0XSK529s9Kka79LWQJA6JmS5qxMm6SplnsXJcjs8bUWE5cbQS3e61sFy+50YYos2Lr9XXort6ydHC8I28xVaY9uLT6Wu4qqolBVKqal+5dq/Iottr0ejFoapHLmqJvLs1y28hJG9Svhtl5kjnqqd7aiPKWkg32VvqxbG5LnzdWZ5jC9VUVWNaRZq27VbG0U+TrhSbwjVV0epqZJns1/AmcOL2UpzUzEzZpZ1suDE0nUNU1OdYXf2C2q4oma0FUif8Lv7G2rjX1k00ESXXEFQ1a2BHRT21Iosklaq5v0diZfE9fWz10uMaeCjxNQQ08bW7/alSN0z9SuX8SZoqfqIw4JzNUfb89kayRu5JxfWntvFeaLxmqLi28KkSxJ6bL6ioiK31l5jem5JxfWntvFeMLtIzc3wol69QFB0PNVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PIAA53qOwtkup0Sr72nYHQserHo9q5Kh2sNZHJHpOVGuRNaL+xnVH3evkszTNGiqeMOc6q5Uibtd7S8yHW1s2+yI1n8NmpuRfqZXRxLnqll1r+FOYwCaYYZzHvOmPzpDuLZiq/WmlSlt10qYKdFVUja7Uirty5itHiq/0U9RPTXaqZLUv05naeem7nXM6YGl5ebop6O2qcTXyprY62a6VTqqNixslSRUcxq7URU2ZmLU3a4VUdNHUVtRIym/gNdIuUevPNOZfeYYF5IpiPs7O8Ygu17bE26181U2JVViSL7Oe39C1aLvcLLVek2urkpplTRVzF2pzKmxUMEC88zTFrW4PQ12OMTV9M+nqrvO+J/tNRGtzTmXJE1e46utu1wuFwS4VtVJNVoqKkr1zVMthhATMyRTTHKHoIsbYmidI5l6q0WV+m9VfnmuSJ+iIcH4xxG+riqn3epWeJjmMeqpm1HZZp8ck+R0QF56o0UdHfVOM8SVUW9VF4qXx6TXaKqm1qoqfmiKYH2zc/tb7VWtmW4Z5+kq7N+zR29WowALymKaY5QuVE81TPJPUSvlmkcrnyPdm5yrtVVJE7knF9ae28V5HIkbuScX1p7bxXmmF2nLnfpx6vXqAoOh5ipHHda4wbr2PgsJHApXTqizbBxdlVqtdEIEvQU2Pi6d+8vyiEXqXe0k05V9VmvL/MpLcEbHxWo/UNNUTp+URZZFlkV7tqnAl6BsfFE5+Zm80/P+kQgS9BOx8Ub95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQgS9A2Pib95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQiRu5JxfWntvFeewBajD0ze7HGzO1ptayigKDRzKgAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACoAA/9k=\"></p><p><span style=\"color: rgb(136, 136, 136);\">库布其沙漠中的一条穿沙公路，两旁绿意盎然。</span></p><p class=\"ql-align-justify\"><strong style=\"color: rgb(255, 255, 255); background-color: rgb(228, 38, 38);\">联播+</strong>湖泊星罗棋布，黄沙中绿树成荫，牛羊悠然自得，河流弯弯曲曲通向远方</p><p><br></p><p><br></p><p class=\"ql-align-justify\">昨天(23日)，北京雨过天晴，最高气温35℃，加上湿度大，体感闷热异常。预计今天白天北京最高气温将达36℃，最小湿度50%，又是“蒸锅”里的一天，同时白天西部北部有雷阵雨，夜间全市有雷阵雨，需注意防雨防雷。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">俗话说“小暑大暑，上蒸下煮”，昨天起进入大暑节气，北京的天气也十分应景，高温高湿。昨天北京最高气温达35℃，大多数时间的湿度也在40%以上，体感十分闷热。</p><p><br></p><p class=\"ql-align-justify\">今晨北京阳光早早上线。(图/张晗熙)</p><p class=\"ql-align-justify\">今天，北京继续高温闷热，白天晴转多云，西部北部有雷阵雨，北转南风二三级，最高气温36℃，最小相对湿度50%；夜间多云间阴有雷阵雨，南转北风二级左右，最低气温27℃。</p><p class=\"ql-align-justify\">未来一周，北京的最高气温均在31℃以上，白天暑气蒸腾，夜晚闷热难寐，要注意防暑降温。主汛期里，雨水也不能少，除了今天会有雷阵雨外，周六也会有雷阵雨现身，建议大家根据天气合理安排假期出行。</p><p class=\"ql-align-justify\"><br></p><p><br></p><p><br></p><p class=\"ql-align-justify\">腾讯科技讯 7月29日消息，据外媒报道，看起来苹果的iPad阵容将会变得更壮大，该公司目前已经有五种不同型号的平板电脑。但有媒体发现的新监管文件显示，苹果可能会有两款新平板电脑即将上市。</p><p class=\"ql-align-justify\">目前，苹果的iPad阵容包括iPad Mini、iPad、iPad Air、11英寸iPad Pro和12.9英寸iPad Pro。</p><p class=\"ql-align-justify\">有媒体本月早些时候报道称，苹果已向欧亚经济委员会(EEC)提交了五个型号的申请，而最近这次提交的申请还包括另外两个型号。</p><p class=\"ql-align-justify\">两款新机型的标识分别为A2200和A2232，它们很可能是相似的型号。</p><p class=\"ql-align-justify\">这些额外的机型究竟什么样还不清楚，但有传言称，它们可能是全新的10.2英寸iPad，是对现有9.7英寸iPad的升级。</p><p class=\"ql-align-justify\">来自中国的一份报告表明，新iPad的大规模生产在7月份开始，这增加了秋季发布的可能性。</p><p class=\"ql-align-justify\">在俄罗斯、亚美尼亚、白俄罗斯、哈萨克斯坦和吉尔吉斯斯坦等国家，任何设备与加密相关元素一起销售都需要向EEC提交法律文件。</p><p class=\"ql-align-justify\">他们没有详细说明具体的信息，但确实表明了有些新的东西正在开发中。（腾讯科技</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '', 1, 0, '腾讯新闻', '腾讯新闻', NULL);
INSERT INTO `t_news` VALUES ('168564300489691136', NULL, '2019-07-30 17:46:42', 0, NULL, '2019-07-30 17:46:42', NULL, '<p class=\"ql-align-center\">	</p><p><img src=\"data:image/png;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5Ojf/2wBDAQoKCg0MDRoPDxo3JR8lNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzf/wAARCAC0ALQDASIAAhEBAxEB/8QAHAABAAEEAwAAAAAAAAAAAAAAAAgBAwQHAgUG/8QAQhAAAQMCAgMMBwYEBwAAAAAAAAECAwQFBhESITEHExc3QVFUcYOTs9IUIjJhgZHTFSNiobHBMzVC0UVSU1VzkvD/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAMBEBAAECAwUHAwQDAAAAAAAAAAECEQMEEhMUITFRMlJhYnGRoTNB8AVTwdGB4fH/2gAMAwEAAhEDEQA/AN4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAKgHiMQ7pdmw/eKi1VtLcHzwaOk6KNitXSajkyzei7FTkImYjmtTRVXNqYe3Brjhlw50K691H5xwy4c6Fde6j85XXT1abvi91scGuOGXDnQrr3UfnHDLhzoV17qP6g109Td8Xutjg123dgsL/Zt93VOdII/Oc03WbIv+HXb4xRfUG0o6rxk8xVyon2bBBr/AIWrJ/t90/6Q/UKcLVky/l91Xqji+oNpR1TuOZ/bn2bBBrt269Ym7bdeE7GPznDhlw7y0V17qP6g2lPVScrjU86ZbHBrjhlw50K691H5xwy4c6Fde6j+oNdPVG74vdbHBrjhlw50K691H9QcMuHOhXXuo/ONdPU3fF7rY4NccMuHOhXXuo/OOGXDnQrr3UfnGunqbvi91scGuOGXDnQrr3UfnHDLhzoV17qPzjXT1N3xe62ODXHDLhzoV17qPzns8O3mnxBZqe6UbJWQT6Wi2ZERyZOVq55KqbUXlJiqJ5KVYVdEXqh2agKCyipHHda4wbr2PgsJHEcd1rjBuvY+Cwyxuy68l9SfR5A5Ma57kaxqqq8iFYo3SvRjNqmXJKykbvUGSyf1PU5pl7WHhRVGqqbU/nJxSkjiajqmTL8KFFq449VPC1PxO2mK5znuVzlVVXlUvxQRSMRyzK1eVNBVyIt1aU4kzOnBiI9r+8/w4vqp37ZFTq1FpXK72nKvWpleixdIXu1HosX+uvdqLwirCx6u1N/8x/bEBmsoWParmz6k2roZGGqIirormnIpN7ssTCrw4iavuq2R7fZe5OpS56TLscqPTmemZZBNlYxK45SvacL/AG41avOxf2Uej6aZwva/8OxfkWQRZbaRPaj+FVRWrk5FRU5FKF5J1cmjM3fG867U+JwexE1sdpN/NOsIqpjnTLgACWYAABI3ck4vrT23ivI5EjdyTi+tPbeK81wu05M79OPV69QFB0PMVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PN0T97jncnto1NH/3yMZWPVfZd8jjymRTVb4VRHKrmcy/scz26a6a4porm0QspG9Vy0HZ9R3NNCkMSMTbtVfec2OR7Uc1c0XlORnNV3rZbK04U6om6hwlerG+rrc7U1PeXDFfK1qOqHa0T1Y05/eRDfEr0ws1blRGUkCOe96oioiZq5V5OtTFdS1DZHRuglSRvtMVi5t60PY4WwlefTsO39sKT0lRcInfco5zo0STW5yZak9VdZsjEFXdrfSYmqsO075bitzhZ91BvrtH0eDPVkuzNfmdFOHw4vmMznNeLw/59mhWU1Q+VIWQSulVM0YjFVy/A5SUdVFDv0lNMyLZpuYqN+ZvWlkrKnEOCKy6wrHcZaSr9I0o9B2aMbkipybV1e9TJjqLZNYbZYbw37m7tmiY5V2PR2aJ7l16l50TnL7Pxc85mYtw/OP9I/SU80UbJJYZGMk1sc5qojupeUpFFJNIkcMbpHrsaxuar8Db+6FZKOmsWGrVd7syhZSwyM9I3h8qPc1GJlk3WmaZr8CzuXUNDQXK7Psl0ZdJUoFVr20r41Y7PUmT9ueSbCujjZfeI0arfnq1XNQVsDNOakqI255aT4lRM/kW5aeeGXepoZI5F/oe1UX5G1LZfMfXK0XSK529s9Kka79LWQJA6JmS5qxMm6SplnsXJcjs8bUWE5cbQS3e61sFy+50YYos2Lr9XXort6ydHC8I28xVaY9uLT6Wu4qqolBVKqal+5dq/Iottr0ejFoapHLmqJvLs1y28hJG9Svhtl5kjnqqd7aiPKWkg32VvqxbG5LnzdWZ5jC9VUVWNaRZq27VbG0U+TrhSbwjVV0epqZJns1/AmcOL2UpzUzEzZpZ1suDE0nUNU1OdYXf2C2q4oma0FUif8Lv7G2rjX1k00ESXXEFQ1a2BHRT21Iosklaq5v0diZfE9fWz10uMaeCjxNQQ08bW7/alSN0z9SuX8SZoqfqIw4JzNUfb89kayRu5JxfWntvFeaLxmqLi28KkSxJ6bL6ioiK31l5jem5JxfWntvFeMLtIzc3wol69QFB0PNVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PIAA53qOwtkup0Sr72nYHQserHo9q5Kh2sNZHJHpOVGuRNaL+xnVH3evkszTNGiqeMOc6q5Uibtd7S8yHW1s2+yI1n8NmpuRfqZXRxLnqll1r+FOYwCaYYZzHvOmPzpDuLZiq/WmlSlt10qYKdFVUja7Uirty5itHiq/0U9RPTXaqZLUv05naeem7nXM6YGl5ebop6O2qcTXyprY62a6VTqqNixslSRUcxq7URU2ZmLU3a4VUdNHUVtRIym/gNdIuUevPNOZfeYYF5IpiPs7O8Ygu17bE26181U2JVViSL7Oe39C1aLvcLLVek2urkpplTRVzF2pzKmxUMEC88zTFrW4PQ12OMTV9M+nqrvO+J/tNRGtzTmXJE1e46utu1wuFwS4VtVJNVoqKkr1zVMthhATMyRTTHKHoIsbYmidI5l6q0WV+m9VfnmuSJ+iIcH4xxG+riqn3epWeJjmMeqpm1HZZp8ck+R0QF56o0UdHfVOM8SVUW9VF4qXx6TXaKqm1qoqfmiKYH2zc/tb7VWtmW4Z5+kq7N+zR29WowALymKaY5QuVE81TPJPUSvlmkcrnyPdm5yrtVVJE7knF9ae28V5HIkbuScX1p7bxXmmF2nLnfpx6vXqAoOh5ipHHda4wbr2PgsJHApXTqizbBxdlVqtdEIEvQU2Pi6d+8vyiEXqXe0k05V9VmvL/MpLcEbHxWo/UNNUTp+URZZFlkV7tqnAl6BsfFE5+Zm80/P+kQgS9BOx8Ub95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQgS9A2Pib95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQiRu5JxfWntvFeewBajD0ze7HGzO1ptayigKDRzKgAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACoAA/9k=\"></p><p>	<span style=\"color: rgb(136, 136, 136);\">库布其沙漠中的一条穿沙公路，两旁绿意盎然。</span></p><p class=\"ql-align-justify\"><strong style=\"background-color: rgb(228, 38, 38); color: rgb(255, 255, 255);\">联播+</strong>湖泊星罗棋布，黄沙中绿树成荫，牛羊悠然自得，河流弯弯曲曲通向远方</p><p><br></p><p><br></p><p class=\"ql-align-justify\">昨天(23日)，北京雨过天晴，最高气温35℃，加上湿度大，体感闷热异常。预计今天白天北京最高气温将达36℃，最小湿度50%，又是“蒸锅”里的一天，同时白天西部北部有雷阵雨，夜间全市有雷阵雨，需注意防雨防雷。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">俗话说“小暑大暑，上蒸下煮”，昨天起进入大暑节气，北京的天气也十分应景，高温高湿。昨天北京最高气温达35℃，大多数时间的湿度也在40%以上，体感十分闷热。</p><p><br></p><p class=\"ql-align-justify\">今晨北京阳光早早上线。(图/张晗熙)</p><p class=\"ql-align-justify\">今天，北京继续高温闷热，白天晴转多云，西部北部有雷阵雨，北转南风二三级，最高气温36℃，最小相对湿度50%；夜间多云间阴有雷阵雨，南转北风二级左右，最低气温27℃。</p><p class=\"ql-align-justify\">未来一周，北京的最高气温均在31℃以上，白天暑气蒸腾，夜晚闷热难寐，要注意防暑降温。主汛期里，雨水也不能少，除了今天会有雷阵雨外，周六也会有雷阵雨现身，建议大家根据天气合理安排假期出行。</p><p class=\"ql-align-justify\"><br></p><p><br></p><p><br></p><p class=\"ql-align-justify\">腾讯科技讯 7月29日消息，据外媒报道，看起来苹果的iPad阵容将会变得更壮大，该公司目前已经有五种不同型号的平板电脑。但有媒体发现的新监管文件显示，苹果可能会有两款新平板电脑即将上市。</p><p class=\"ql-align-justify\">目前，苹果的iPad阵容包括iPad Mini、iPad、iPad Air、11英寸iPad Pro和12.9英寸iPad Pro。</p><p class=\"ql-align-justify\">有媒体本月早些时候报道称，苹果已向欧亚经济委员会(EEC)提交了五个型号的申请，而最近这次提交的申请还包括另外两个型号。</p><p class=\"ql-align-justify\">两款新机型的标识分别为A2200和A2232，它们很可能是相似的型号。</p><p class=\"ql-align-justify\">这些额外的机型究竟什么样还不清楚，但有传言称，它们可能是全新的10.2英寸iPad，是对现有9.7英寸iPad的升级。</p><p class=\"ql-align-justify\">来自中国的一份报告表明，新iPad的大规模生产在7月份开始，这增加了秋季发布的可能性。</p><p class=\"ql-align-justify\">在俄罗斯、亚美尼亚、白俄罗斯、哈萨克斯坦和吉尔吉斯斯坦等国家，任何设备与加密相关元素一起销售都需要向EEC提交法律文件。</p><p class=\"ql-align-justify\">他们没有详细说明具体的信息，但确实表明了有些新的东西正在开发中。（腾讯科技</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '', 1, 0, '网易新闻', '网易新闻', NULL);
INSERT INTO `t_news` VALUES ('168566873141547008', NULL, '2019-07-30 17:56:55', 0, NULL, '2019-08-08 14:03:18', NULL, '<p class=\"ql-align-center\"><br></p><p><img src=\"data:image/png;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5Ojf/2wBDAQoKCg0MDRoPDxo3JR8lNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzf/wAARCAC0ALQDASIAAhEBAxEB/8QAHAABAAEEAwAAAAAAAAAAAAAAAAgBAwQHAgUG/8QAQhAAAQMCAgMMBwYEBwAAAAAAAAECAwQFBhESITEHExc3QVFUcYOTs9IUIjJhgZHTFSNiobHBMzVC0UVSU1VzkvD/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAMBEBAAECAwUHAwQDAAAAAAAAAAECEQMEEhMUITFRMlJhYnGRoTNB8AVTwdGB4fH/2gAMAwEAAhEDEQA/AN4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAKgHiMQ7pdmw/eKi1VtLcHzwaOk6KNitXSajkyzei7FTkImYjmtTRVXNqYe3Brjhlw50K691H5xwy4c6Fde6j85XXT1abvi91scGuOGXDnQrr3UfnHDLhzoV17qP6g109Td8Xutjg123dgsL/Zt93VOdII/Oc03WbIv+HXb4xRfUG0o6rxk8xVyon2bBBr/AIWrJ/t90/6Q/UKcLVky/l91Xqji+oNpR1TuOZ/bn2bBBrt269Ym7bdeE7GPznDhlw7y0V17qP6g2lPVScrjU86ZbHBrjhlw50K691H5xwy4c6Fde6j+oNdPVG74vdbHBrjhlw50K691H9QcMuHOhXXuo/ONdPU3fF7rY4NccMuHOhXXuo/OOGXDnQrr3UfnGunqbvi91scGuOGXDnQrr3UfnHDLhzoV17qPzjXT1N3xe62ODXHDLhzoV17qPzns8O3mnxBZqe6UbJWQT6Wi2ZERyZOVq55KqbUXlJiqJ5KVYVdEXqh2agKCyipHHda4wbr2PgsJHEcd1rjBuvY+Cwyxuy68l9SfR5A5Ma57kaxqqq8iFYo3SvRjNqmXJKykbvUGSyf1PU5pl7WHhRVGqqbU/nJxSkjiajqmTL8KFFq449VPC1PxO2mK5znuVzlVVXlUvxQRSMRyzK1eVNBVyIt1aU4kzOnBiI9r+8/w4vqp37ZFTq1FpXK72nKvWpleixdIXu1HosX+uvdqLwirCx6u1N/8x/bEBmsoWParmz6k2roZGGqIirormnIpN7ssTCrw4iavuq2R7fZe5OpS56TLscqPTmemZZBNlYxK45SvacL/AG41avOxf2Uej6aZwva/8OxfkWQRZbaRPaj+FVRWrk5FRU5FKF5J1cmjM3fG867U+JwexE1sdpN/NOsIqpjnTLgACWYAABI3ck4vrT23ivI5EjdyTi+tPbeK81wu05M79OPV69QFB0PMVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PN0T97jncnto1NH/3yMZWPVfZd8jjymRTVb4VRHKrmcy/scz26a6a4porm0QspG9Vy0HZ9R3NNCkMSMTbtVfec2OR7Uc1c0XlORnNV3rZbK04U6om6hwlerG+rrc7U1PeXDFfK1qOqHa0T1Y05/eRDfEr0ws1blRGUkCOe96oioiZq5V5OtTFdS1DZHRuglSRvtMVi5t60PY4WwlefTsO39sKT0lRcInfco5zo0STW5yZak9VdZsjEFXdrfSYmqsO075bitzhZ91BvrtH0eDPVkuzNfmdFOHw4vmMznNeLw/59mhWU1Q+VIWQSulVM0YjFVy/A5SUdVFDv0lNMyLZpuYqN+ZvWlkrKnEOCKy6wrHcZaSr9I0o9B2aMbkipybV1e9TJjqLZNYbZYbw37m7tmiY5V2PR2aJ7l16l50TnL7Pxc85mYtw/OP9I/SU80UbJJYZGMk1sc5qojupeUpFFJNIkcMbpHrsaxuar8Db+6FZKOmsWGrVd7syhZSwyM9I3h8qPc1GJlk3WmaZr8CzuXUNDQXK7Psl0ZdJUoFVr20r41Y7PUmT9ueSbCujjZfeI0arfnq1XNQVsDNOakqI255aT4lRM/kW5aeeGXepoZI5F/oe1UX5G1LZfMfXK0XSK529s9Kka79LWQJA6JmS5qxMm6SplnsXJcjs8bUWE5cbQS3e61sFy+50YYos2Lr9XXort6ydHC8I28xVaY9uLT6Wu4qqolBVKqal+5dq/Iottr0ejFoapHLmqJvLs1y28hJG9Svhtl5kjnqqd7aiPKWkg32VvqxbG5LnzdWZ5jC9VUVWNaRZq27VbG0U+TrhSbwjVV0epqZJns1/AmcOL2UpzUzEzZpZ1suDE0nUNU1OdYXf2C2q4oma0FUif8Lv7G2rjX1k00ESXXEFQ1a2BHRT21Iosklaq5v0diZfE9fWz10uMaeCjxNQQ08bW7/alSN0z9SuX8SZoqfqIw4JzNUfb89kayRu5JxfWntvFeaLxmqLi28KkSxJ6bL6ioiK31l5jem5JxfWntvFeMLtIzc3wol69QFB0PNVI47rXGDdex8FhI4jjutcYN17HwWGWN2XXkvqT6PIAA53qOwtkup0Sr72nYHQserHo9q5Kh2sNZHJHpOVGuRNaL+xnVH3evkszTNGiqeMOc6q5Uibtd7S8yHW1s2+yI1n8NmpuRfqZXRxLnqll1r+FOYwCaYYZzHvOmPzpDuLZiq/WmlSlt10qYKdFVUja7Uirty5itHiq/0U9RPTXaqZLUv05naeem7nXM6YGl5ebop6O2qcTXyprY62a6VTqqNixslSRUcxq7URU2ZmLU3a4VUdNHUVtRIym/gNdIuUevPNOZfeYYF5IpiPs7O8Ygu17bE26181U2JVViSL7Oe39C1aLvcLLVek2urkpplTRVzF2pzKmxUMEC88zTFrW4PQ12OMTV9M+nqrvO+J/tNRGtzTmXJE1e46utu1wuFwS4VtVJNVoqKkr1zVMthhATMyRTTHKHoIsbYmidI5l6q0WV+m9VfnmuSJ+iIcH4xxG+riqn3epWeJjmMeqpm1HZZp8ck+R0QF56o0UdHfVOM8SVUW9VF4qXx6TXaKqm1qoqfmiKYH2zc/tb7VWtmW4Z5+kq7N+zR29WowALymKaY5QuVE81TPJPUSvlmkcrnyPdm5yrtVVJE7knF9ae28V5HIkbuScX1p7bxXmmF2nLnfpx6vXqAoOh5ipHHda4wbr2PgsJHApXTqizbBxdlVqtdEIEvQU2Pi6d+8vyiEXqXe0k05V9VmvL/MpLcEbHxWo/UNNUTp+URZZFlkV7tqnAl6BsfFE5+Zm80/P+kQgS9BOx8Ub95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQgS9A2Pib95flEIEvQNj4m/eX5RCBL0DY+Jv3l+UQiRu5JxfWntvFeewBajD0ze7HGzO1ptayigKDRzKgAAAAAAAAAAAAAAAAAAAAAAAAAAAAKKAoAqAAAAAAAAAAAAAAAAAAAAAAAAAAAAAooCgCoAAAAAAAAAAAAAAAAAAAAAAAAAAAACigKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACoAA/9k=\"></p><p><span style=\"color: rgb(136, 136, 136);\">库布其沙漠中的一条穿沙公路，两旁绿意盎然。</span></p><p class=\"ql-align-justify\"><strong style=\"color: rgb(255, 255, 255); background-color: rgb(228, 38, 38);\">联播+</strong>湖泊星罗棋布，黄沙中绿树成荫，牛羊悠然自得，河流弯弯曲曲通向远方</p><p><br></p><p><br></p><p class=\"ql-align-justify\">昨天(23日)，北京雨过天晴，最高气温35℃，加上湿度大，体感闷热异常。预计今天白天北京最高气温将达36℃，最小湿度50%，又是“蒸锅”里的一天，同时白天西部北部有雷阵雨，夜间全市有雷阵雨，需注意防雨防雷。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">俗话说“小暑大暑，上蒸下煮”，昨天起进入大暑节气，北京的天气也十分应景，高温高湿。昨天北京最高气温达35℃，大多数时间的湿度也在40%以上，体感十分闷热。</p><p><br></p><p class=\"ql-align-justify\">今晨北京阳光早早上线。(图/张晗熙)</p><p class=\"ql-align-justify\">今天，北京继续高温闷热，白天晴转多云，西部北部有雷阵雨，北转南风二三级，最高气温36℃，最小相对湿度50%；夜间多云间阴有雷阵雨，南转北风二级左右，最低气温27℃。</p><p class=\"ql-align-justify\">未来一周，北京的最高气温均在31℃以上，白天暑气蒸腾，夜晚闷热难寐，要注意防暑降温。主汛期里，雨水也不能少，除了今天会有雷阵雨外，周六也会有雷阵雨现身，建议大家根据天气合理安排假期出行。</p><p class=\"ql-align-justify\"><br></p><p><br></p><p><br></p><p class=\"ql-align-justify\">腾讯科技讯 7月29日消息，据外媒报道，看起来苹果的iPad阵容将会变得更壮大，该公司目前已经有五种不同型号的平板电脑。但有媒体发现的新监管文件显示，苹果可能会有两款新平板电脑即将上市。</p><p class=\"ql-align-justify\">目前，苹果的iPad阵容包括iPad Mini、iPad、iPad Air、11英寸iPad Pro和12.9英寸iPad Pro。</p><p class=\"ql-align-justify\">有媒体本月早些时候报道称，苹果已向欧亚经济委员会(EEC)提交了五个型号的申请，而最近这次提交的申请还包括另外两个型号。</p><p class=\"ql-align-justify\">两款新机型的标识分别为A2200和A2232，它们很可能是相似的型号。</p><p class=\"ql-align-justify\">这些额外的机型究竟什么样还不清楚，但有传言称，它们可能是全新的10.2英寸iPad，是对现有9.7英寸iPad的升级。</p><p class=\"ql-align-justify\">来自中国的一份报告表明，新iPad的大规模生产在7月份开始，这增加了秋季发布的可能性。</p><p class=\"ql-align-justify\">在俄罗斯、亚美尼亚、白俄罗斯、哈萨克斯坦和吉尔吉斯斯坦等国家，任何设备与加密相关元素一起销售都需要向EEC提交法律文件。</p><p class=\"ql-align-justify\">他们没有详细说明具体的信息，但确实表明了有些新的东西正在开发中。（腾讯科技</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '', 1, 3, '久其新闻', '久其新闻', NULL);
INSERT INTO `t_news` VALUES ('168803605648773120', NULL, '2019-07-31 09:37:37', 0, NULL, '2019-08-08 14:08:39', NULL, '<h1 class=\"ql-align-center\"><span class=\"ql-size-huge\">来自中华人民共和国财政部的感谢信</span></h1><p class=\"ql-align-center\"><br></p><h4 class=\"ql-align-center\"><strong>发布时间： 2019-06-10 17:00:08</strong></h4><p class=\"ql-align-center\"><span style=\"background-color: initial;\"><img src=\"https://portal.jiuqi.com.cn/u/cms/portal/201906/10170254mox0.png\" alt=\"图片.png\"></span></p>', '', 0, 2, '来自中华人民共和国财政部的感谢信', '腾讯新闻', NULL);

-- ----------------------------
-- Table structure for t_news_images
-- ----------------------------
DROP TABLE IF EXISTS `t_news_images`;
CREATE TABLE `t_news_images`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `news_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news_images
-- ----------------------------
INSERT INTO `t_news_images` VALUES ('168544412303888384', NULL, '2019-07-30 16:27:40', 0, NULL, NULL, '/upload', 'logo.png', '168544415445422080', '1564475260307.png');
INSERT INTO `t_news_images` VALUES ('168550196798558208', NULL, '2019-07-30 16:50:39', 0, NULL, NULL, '/upload', 'logo (1).png', '168550203928875008', '1564476639437.png');
INSERT INTO `t_news_images` VALUES ('168561292360028160', NULL, '2019-07-30 17:34:45', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564479284825.png');
INSERT INTO `t_news_images` VALUES ('168561577153269760', NULL, '2019-07-30 17:35:53', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564479352725.png');
INSERT INTO `t_news_images` VALUES ('168561742698254336', NULL, '2019-07-30 17:36:32', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564479392195.png');
INSERT INTO `t_news_images` VALUES ('168562731937435648', NULL, '2019-07-30 17:40:28', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564479628047.png');
INSERT INTO `t_news_images` VALUES ('168563318858977280', NULL, '2019-07-30 17:42:48', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564479767980.png');
INSERT INTO `t_news_images` VALUES ('168565748623478784', NULL, '2019-07-30 17:52:27', 0, NULL, NULL, '/upload', 'logo (1).png', '168565765706878976', '1564480347281.png');
INSERT INTO `t_news_images` VALUES ('168567691458646016', NULL, '2019-07-30 18:00:10', 0, NULL, NULL, '/upload/', 'logo.png', '168564300489691136', '1564480810479.png');
INSERT INTO `t_news_images` VALUES ('168899270731108352', NULL, '2019-07-31 15:57:48', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564559836623.png');
INSERT INTO `t_news_images` VALUES ('168899405250826240', NULL, '2019-07-31 15:58:17', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564559897219.png');
INSERT INTO `t_news_images` VALUES ('168901012248072192', NULL, '2019-07-31 16:04:40', 0, NULL, NULL, '/upload', 'logo.png', NULL, '1564560280358.png');
INSERT INTO `t_news_images` VALUES ('168901613279252480', NULL, '2019-07-31 16:07:04', 0, NULL, NULL, '/upload', 'zhongguofengdaodeliyizhanbanzhijing_3744115.jpg', NULL, '1564560423655.jpg');
INSERT INTO `t_news_images` VALUES ('169164363767222272', NULL, '2019-08-01 09:31:08', 0, NULL, NULL, '/upload/', '1562315087(1).jpg', NULL, '1564623068251.jpg');
INSERT INTO `t_news_images` VALUES ('169164637676244992', NULL, '2019-08-01 09:32:14', 0, NULL, NULL, '/upload/', '1559009616(1).jpg', NULL, '1564623133558.jpg');
INSERT INTO `t_news_images` VALUES ('169170427875168256', NULL, '2019-08-01 09:55:14', 0, NULL, NULL, '/upload/', 'zhongguofengdaodeliyizhanbanzhijing_3744115.jpg', NULL, '1564624514048.jpg');
INSERT INTO `t_news_images` VALUES ('169260336308817920', NULL, '2019-08-01 15:52:30', 0, NULL, NULL, '/upload/', 'zhongguofengdaodeliyizhanbanzhijing_3744115.jpg', NULL, '1564645949889.jpg');
INSERT INTO `t_news_images` VALUES ('169269360790081536', NULL, '2019-08-01 16:28:21', 0, NULL, NULL, '/upload/', 'zhongguofengdaodeliyizhanbanzhijing_3744115.jpg', NULL, '1564648101494.jpg');
INSERT INTO `t_news_images` VALUES ('171769539040645120', NULL, '2019-08-08 14:03:10', 0, NULL, NULL, '/upload/', '微信图片_20190517164546.jpg', '168566873141547008', '1565244190435.jpg');
INSERT INTO `t_news_images` VALUES ('171791105283592192', NULL, '2019-08-08 15:28:52', 0, NULL, NULL, '/upload/', 'zhongguofengdaodeliyizhanbanzhijing_3744115.jpg', '168803605648773120', '1565249332228.jpg');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notice_conten` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notice_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notice_is_top` int(11) DEFAULT NULL,
  `notice_rate` int(11) DEFAULT NULL,
  `notice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('171094599417204736', NULL, '2019-08-06 17:21:12', 0, NULL, '2019-08-06 17:21:12', NULL, '', '久其公告', 0, 0, '久其公告');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `button_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('103658022701633536', 'admin', '2019-02-01 15:12:20', 0, 'admin', '2019-07-05 16:33:18', '', 'test', '102235632889237504', 0, 3.00, 'xboot-vue-generator/test', 'test', '代码生成测试页', 'ios-bug', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('113601631450304512', 'admin', '2019-03-01 01:44:41', 0, 'admin', '2019-03-01 01:44:41', NULL, '', '81716172680073216', 1, 2.00, '', '/xboot/actTask/backAll/**', '审批驳回至发起人', '', 3, 'disable', 0, NULL);
INSERT INTO `t_permission` VALUES ('113602149589454848', 'admin', '2019-03-01 01:46:44', 0, 'admin', '2019-07-05 16:29:05', '', 'components', '125909152017944576', 0, 5.00, 'Main', '/components', '业务组件', 'md-cube', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('113602342657462272', 'admin', '2019-03-01 01:47:30', 0, 'admin', '2019-07-05 16:15:22', '', 'components', '113602149589454848', 0, 0.00, 'xboot-components/xboot-components', 'components', '业务组件', 'md-cube', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('121426317022334976', 'admin', '2019-03-22 15:57:11', 0, 'admin', '2019-03-22 15:57:11', NULL, 'redis', '39915540965232640', 0, 2.21, 'sys/redis/redis', 'redis', 'Redis缓存管理', 'md-barcode', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('125909152017944576', 'admin', '2019-04-04 00:50:22', 0, 'admin', '2019-07-24 09:48:55', '', 'xboot', '', -1, 0.00, '', '', 'portal后台管理', 'ios-albums', 0, '', 0, '');
INSERT INTO `t_permission` VALUES ('127995258721013760', 'admin', '2019-04-09 18:59:49', 0, 'admin', '2019-07-05 16:06:52', '', 'doc', '', -1, 1.00, '', '', '开发文档', 'md-document', 0, '', 0, '');
INSERT INTO `t_permission` VALUES ('129033675403694080', 'admin', '2019-04-12 15:46:07', 0, 'admin', '2019-04-12 15:49:08', '', 'single-window', '41373430515240960', 0, 3.20, 'xboot-vue-template/single-window/singleWindow', 'single-window', '动态组件单页操作', 'md-easel', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('156497029474816000', '', '2019-06-27 10:35:40', 0, '', '2019-08-07 14:38:25', '', 'example-page', '125909152017944576', 0, 10.00, 'Main', '/example-page', '前端组件', 'ios-thumbs-up', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('156505860971958272', '', '2019-06-27 11:10:46', 0, '', '2019-06-27 11:13:17', '', 'private-componetents', '156497029474816000', 0, 0.00, 'private-componetents/private-componetents', '/private-componetents', '前端组件', 'md-cart', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('15701400130424832', '', '2018-06-03 22:04:06', 0, '', '2018-09-19 22:16:44', '', '', '5129710648430593', 1, 1.11, '', '/xboot/user/admin/add*', '添加用户', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('15701915807518720', '', '2018-06-03 22:06:09', 0, '', '2018-06-06 14:46:51', '', '', '5129710648430593', 1, 1.13, '', '/xboot/user/admin/disable/**', '禁用用户', '', 3, 'disable', 0, NULL);
INSERT INTO `t_permission` VALUES ('15708892205944832', '', '2018-06-03 22:33:52', 0, '', '2018-06-28 16:44:48', '', '', '5129710648430593', 1, 1.14, '', '/xboot/user/admin/enable/**', '启用用户', '', 3, 'enable', 0, NULL);
INSERT INTO `t_permission` VALUES ('159416034233683968', NULL, '2019-07-05 11:54:45', 0, NULL, '2019-07-05 11:54:45', NULL, 'activiti', '125909152017944576', 0, 2.00, 'Main', '//activiti', '流程', 'md-git-compare', 1, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('159441623791439872', NULL, '2019-07-05 13:36:26', 0, NULL, '2019-07-05 13:36:26', NULL, 'myDemo', '156497029474816000', 0, 0.00, 'test/myDemo', '/myDemo', 'myDemo', 'md-aperture', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('159839410597138432', '', '2019-07-06 15:57:06', 0, '', '2019-07-06 15:58:32', '', 'test2', '156497029474816000', 0, 0.00, 'sys/user-manage/test2', '/test2', '数据交互测试', 'md-aperture', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161554421073842176', '', '2019-07-11 09:31:57', 0, '', '2019-08-07 14:37:53', '', 'Administrivia', '125909152017944576', 0, 6.00, 'Main', '/Administrivia', '新闻管理', 'ios-camera', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161554609066741760', '', '2019-07-11 09:32:41', 0, '', '2019-08-07 14:38:00', '', 'notice', '125909152017944576', 0, 7.00, 'Main', '/notice', '公告管理', 'ios-chatboxes', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161554869990199296', '', '2019-07-11 09:33:44', 0, '', '2019-08-07 14:37:05', '', 'commonlink', '125909152017944576', 0, 3.00, 'Main', '/commonlink', '常用链接管理', 'md-calendar', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161555090384097280', '', '2019-07-11 09:34:36', 0, '', '2019-08-07 14:37:25', '', 'downloadPortal', '125909152017944576', 0, 4.00, 'Main', '/downloadPortal', '常用资源下载管理', 'md-arrow-down', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161555347276828672', '', '2019-07-11 09:35:37', 0, '', '2019-08-07 14:36:48', '', 'interface', '125909152017944576', 0, 2.00, 'Main', '/interface', '推送管理', 'ios-print', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161555604320555008', '', '2019-07-11 09:36:39', 0, '', '2019-08-07 14:37:36', '', 'data-analysis', '125909152017944576', 0, 5.00, 'Main', '/analysis', '数据分析管理', 'ios-alert', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('161556354681540608', '', '2019-07-11 09:39:38', 0, '', '2019-07-15 10:08:34', '', 'administriviaManage', '161554421073842176', 0, 0.00, 'jiuqiVue/administrivia/administriviaManage', 'administriviaManage', '新闻管理', 'ios-camera', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161556732668022784', '', '2019-07-11 09:41:08', 0, '', '2019-07-17 17:51:04', '', 'noticeManage', '161554609066741760', 0, 0.00, 'jiuqiVue/notice/noticeManage', 'noticeManage', '公告管理', 'ios-apps', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161556903283920896', '', '2019-07-11 09:41:48', 0, '', '2019-07-24 13:53:19', '', 'common-link', '161554869990199296', 0, 0.00, 'jiuqiVue/common-link/common-link', 'common-link', '常用链接管理', 'ios-american-football', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161557060398354432', '', '2019-07-11 09:42:26', 0, '', '2019-07-24 14:55:15', '', 'downloadManage', '161555090384097280', 0, 0.00, 'jiuqiVue/download/downloadManage', 'downloadManage', '常用资源下载管理', 'ios-albums', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161557183329210368', '', '2019-07-11 09:42:55', 0, '', '2019-07-22 14:44:16', '', 'interfaceM', '161555347276828672', 0, 0.00, 'jiuqiVue/interface/interfaceManage', 'interfaceM', '推送管理', 'ios-archive', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161557326606635008', '', '2019-07-11 09:43:29', 0, '', '2019-07-25 10:37:55', '', 'data-analysis', '161555604320555008', 0, 0.00, 'jiuqiVue/data-analysis/data-analysis', 'data-analysis', '数据分析管理', 'md-albums', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('161569553686466560', NULL, '2019-07-11 10:32:04', 0, NULL, '2019-07-11 10:32:04', NULL, 'test6', '156497029474816000', 0, 0.00, 'private-componetents/test6', '/test6', 'testsss', 'md-aperture', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('161582197122273280', '', '2019-07-11 11:22:19', 0, '', '2019-07-25 10:15:41', '', 'right', '125909152017944576', 0, 1.00, 'Main', '/right', '权限管理', 'md-albums', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('161582805355073536', '', '2019-07-11 11:24:44', 0, '', '2019-07-25 10:15:31', '', 'rightM', '161582197122273280', 0, 0.00, 'right/rightM', 'rightM', '权限管理', 'md-alert', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('161592338366337024', '', '2019-07-11 12:02:37', 0, '', '2019-07-25 10:16:36', '', 'xinde', '125909152017944576', 0, 0.00, '/sys/system-interface/test', 'xinde', 'xinde', 'md-analytics', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('161592823534063616', '', '2019-07-11 12:04:32', 0, '', '2019-07-25 10:26:43', '', 'system-interface', '5129710648430592', 0, 0.10, 'sys/system-interface/interfaceManage', 'system-interface', '接口管理', 'md-albums', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('161623833600593920', '', '2019-07-11 14:07:46', 0, '', '2019-07-25 10:16:24', '', 'my-manage', '5129710648430592', 0, 0.00, 'sys/my-manage/myManage', 'my-manage', '嗯', 'ios-albums', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('161625225966915584', '', '2019-07-11 14:13:18', 0, '', '2019-07-25 10:16:30', '', 'my-test', '5129710648430592', 0, 0.00, 'sys/my-test/myTest', 'my-test', 'my-test', 'md-albums', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('16392452747300864', '', '2018-06-05 19:50:06', 0, 'admin', '2019-07-05 16:29:57', '', 'access', '125909152017944576', 0, 7.00, 'Main', '/access', '权限按钮测试页', 'md-lock', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('16392767785668608', '', '2018-06-05 19:51:21', 0, 'admin', '2019-07-05 16:32:37', '', 'access_index', '16392452747300864', 0, 5.10, 'access/access', 'index', '权限按钮测试页', 'md-lock', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('16438800255291392', '', '2018-06-05 22:54:18', 0, 'admin', '2018-10-23 12:34:51', '', '', '16392767785668608', 1, 5.11, '', 'test-add', '添加按钮测试', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16438962738434048', '', '2018-06-05 22:54:55', 0, 'admin', '2018-10-23 12:35:05', '', '', '16392767785668608', 1, 5.12, '', 'test-edit', '编辑按钮测试', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16439068543946752', '', '2018-06-05 22:55:20', 0, 'admin', '2018-10-23 12:34:54', '', '', '16392767785668608', 1, 5.13, '', 'test-delete', '删除按钮测试', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('166373302313422848', '', '2019-07-24 16:40:27', 0, '', '2019-07-25 10:16:04', '', 'subsystem-interface', '125909152017944576', 0, 1.00, 'Main', '/subsystem-interface', '接口管理', 'md-albums', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('166374111793123328', NULL, '2019-07-24 16:43:40', 0, NULL, '2019-07-24 16:43:40', NULL, 'subsystem-interface', '166373302313422848', 0, 0.00, 'jiuqiVue/subsystem-interface/subsystem-interface', 'subsystem-interface', '接口管理', 'md-albums', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('16678126574637056', '', '2018-06-06 14:45:16', 0, '', '2018-09-19 22:16:48', '', '', '5129710648430593', 1, 1.12, '', '/xboot/user/admin/edit*', '编辑用户', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16678447719911424', '', '2018-06-06 14:46:32', 0, '', '2018-08-10 21:41:16', '', '', '5129710648430593', 1, 1.15, '', '/xboot/user/delByIds/**', '删除用户', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('16687383932047360', '', '2018-06-06 15:22:03', 0, '', '2018-09-19 22:07:34', '', '', '5129710648430594', 1, 1.21, '', '/xboot/role/save*', '添加角色', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16689632049631232', '', '2018-06-06 15:30:59', 0, '', '2018-09-19 22:07:37', '', '', '5129710648430594', 1, 1.22, '', '/xboot/role/edit*', '编辑角色', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16689745006432256', '', '2018-06-06 15:31:26', 0, '', '2018-08-10 21:41:23', '', '', '5129710648430594', 1, 1.23, '', '/xboot/role/delAllByIds/**', '删除角色', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('16689883993083904', NULL, '2018-06-06 15:31:59', 0, NULL, '2018-06-06 15:31:59', NULL, NULL, '5129710648430594', 1, 1.24, NULL, '/xboot/role/editRolePerm**', '分配权限', NULL, 3, 'editPerm', 0, NULL);
INSERT INTO `t_permission` VALUES ('16690313745666048', '', '2018-06-06 15:33:41', 0, '', '2018-09-19 22:07:46', '', '', '5129710648430594', 1, 1.25, '', '/xboot/role/setDefault*', '设为默认角色', '', 3, 'setDefault', 0, '');
INSERT INTO `t_permission` VALUES ('16694861252005888', '', '2018-06-06 15:51:46', 0, '', '2018-09-19 22:07:52', '', '', '5129710648430595', 1, 1.31, '', '/xboot/permission/add*', '添加菜单', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('16695107491205120', '', '2018-06-06 15:52:44', 0, '', '2018-09-19 22:07:57', '', '', '5129710648430595', 1, 1.32, '', '/xboot/permission/edit*', '编辑菜单', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('16695243126607872', '', '2018-06-06 15:53:17', 0, '', '2018-08-10 21:41:33', '', '', '5129710648430595', 1, 1.33, '', '/xboot/permission/delByIds/**', '删除菜单', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('171700250925338624', NULL, '2019-08-08 09:27:51', 0, NULL, '2019-08-08 09:27:51', NULL, 'home-index', '125909152017944576', 0, 0.00, 'Main', '/home-index', 'websocket测试页', 'md-alert', 1, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('171700638722297856', NULL, '2019-08-08 09:29:23', 0, NULL, '2019-08-08 09:29:23', NULL, 'webSocket', '171700250925338624', 0, 0.00, 'home-index/webSocket', 'webSocket', 'websocket', 'ios-aperture', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('25014528525733888', '', '2018-06-29 14:51:09', 0, '', '2018-10-08 11:13:27', '', '', '5129710648430593', 1, 1.16, '', '无', '上传图片', '', 3, 'upload', 0, '');
INSERT INTO `t_permission` VALUES ('39915540965232640', '', '2018-08-09 17:42:28', 0, '', '2019-07-25 10:16:57', '', 'monitor', '125909152017944576', 0, 2.00, 'Main', '/monitor', '系统监控', 'ios-analytics', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('39916171171991552', '', '2018-08-09 17:44:57', 0, 'admin', '2019-01-20 00:37:29', '', 'druid', '39915540965232640', 0, 2.40, 'sys/monitor/monitor', 'druid', 'SQL监控', 'md-analytics', 2, '', 0, 'http://127.0.0.1:8888/druid/login.html');
INSERT INTO `t_permission` VALUES ('39918482854252544', '', '2018-08-09 17:54:08', 0, 'admin', '2019-01-20 00:37:41', '', 'swagger', '39915540965232640', 0, 2.50, 'sys/monitor/monitor', 'swagger', '接口文档', 'md-document', 2, '', 0, 'http://127.0.0.1:8888/swagger-ui.html');
INSERT INTO `t_permission` VALUES ('40238597734928384', NULL, '2018-08-10 15:06:10', 0, NULL, '2018-08-10 15:06:10', NULL, 'department-manage', '5129710648430592', 0, 1.20, 'sys/department-manage/departmentManage', 'department-manage', '部门管理', 'md-git-branch', 2, '', 0, NULL);
INSERT INTO `t_permission` VALUES ('41363147411427328', '', '2018-08-13 17:34:43', 0, '', '2018-08-20 20:05:21', '', 'log-manage', '39915540965232640', 0, 2.20, 'sys/log-manage/logManage', 'log-manage', '操作日志管理', 'md-list-box', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41363537456533504', '', '2018-08-13 17:36:16', 0, '', '2018-08-13 17:56:11', '', '', '41363147411427328', 1, 2.11, '', '/xboot/log/delByIds/**', '删除日志', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('41364927394353152', '', '2018-08-13 17:41:48', 0, '', '2018-09-19 22:08:57', '', '', '41363147411427328', 1, 2.12, '', '/xboot/log/delAll*', '清空日志', '', 3, 'undefined', 0, '');
INSERT INTO `t_permission` VALUES ('41370251991977984', '', '2018-08-13 18:02:57', 0, '', '2019-07-11 11:02:03', '', 'quartz-job', '39915540965232640', 0, 2.10, 'sys/quartz-manage/quartzManage123', 'quartz-job', '定时任务', 'md-time', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41373430515240960', '', '2018-08-13 18:15:35', 0, 'admin', '2019-07-25 10:17:35', '', 'vue-template', '125909152017944576', 0, 3.00, 'Main', '/vue-template', '后台Vue模版', 'ios-albums', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('41375330996326400', '', '2018-08-13 18:23:08', 0, 'admin', '2018-10-20 22:47:07', '', 'simple-table', '41373430515240960', 0, 3.10, 'xboot-vue-template/simple-table/simpleTable', 'simple-table', '简单表格', 'ios-grid-outline', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41378916912336896', '', '2018-08-13 18:37:23', 0, 'admin', '2019-04-12 15:38:08', '', 'tree', '41373430515240960', 0, 3.22, 'xboot-vue-template/tree/tree', 'tree', '树形结构', 'ios-git-network', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('41469219249852416', NULL, '2018-08-14 00:36:13', 0, NULL, '2018-08-14 00:36:13', NULL, '', '41371711400054784', 1, 2.31, '', '无', '查看数据', '', 3, 'view', 0, NULL);
INSERT INTO `t_permission` VALUES ('42082442672082944', '', '2018-08-15 17:12:57', 0, 'admin', '2019-04-12 15:48:50', '', 'new-window', '41373430515240960', 0, 3.21, 'xboot-vue-template/new-window/newWindow', 'new-window', '新窗口操作', 'ios-browsers', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('45069342940860416', '', '2018-08-23 23:01:49', 0, '', '2018-08-24 10:01:09', '', '', '44986029924421632', 1, 1.42, '', '无', '查看社交账号数据', '', 3, 'view', 0, '');
INSERT INTO `t_permission` VALUES ('45235228800716800', '', '2018-08-24 10:01:00', 0, '', '2018-09-19 22:07:23', '', '', '44986029924421632', 1, 1.41, '', '/xboot/relate/delByIds*', '删除解绑', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('45235621697949696', '', '2018-08-24 10:02:33', 0, '', '2018-09-19 22:06:57', '', '', '40238597734928384', 1, 1.21, '', '/xboot/department/add*', '添加部门', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45235787867885568', '', '2018-08-24 10:03:13', 0, '', '2018-09-19 22:07:02', '', '', '40238597734928384', 1, 1.22, '', '/xboot/department/edit*', '编辑部门', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45235939278065664', NULL, '2018-08-24 10:03:49', 0, NULL, '2018-08-24 10:03:49', NULL, '', '40238597734928384', 1, 1.23, '', '/xboot/department/delByIds/*', '删除部门', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('45236734832676864', '', '2018-08-24 10:06:59', 0, '', '2018-09-19 22:07:07', '', '', '43117268627886080', 1, 1.31, '', '/xboot/message/add*', '添加消息', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45237010692050944', '', '2018-08-24 10:08:04', 0, '', '2018-09-19 22:07:12', '', '', '43117268627886080', 1, 1.32, '', '/xboot/message/edit*', '编辑消息', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45237170029465600', NULL, '2018-08-24 10:08:42', 0, NULL, '2018-08-24 10:08:42', NULL, '', '43117268627886080', 1, 1.33, '', '/xboot/message/delByIds/*', '删除消息', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('45264987354042368', '', '2018-08-24 11:59:14', 0, '', '2018-09-19 22:08:11', '', '', '41370251991977984', 1, 2.11, '', '/xboot/quartzJob/add*', '添加定时任务', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('45265487029866496', '', '2018-08-24 12:01:14', 0, '', '2018-09-19 22:08:17', '', '', '41370251991977984', 1, 2.12, '', '/xboot/quartzJob/edit*', '编辑定时任务', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('45265762415284224', '', '2018-08-24 12:02:19', 0, '', '2018-09-19 22:08:24', '', '', '41370251991977984', 1, 2.13, '', '/xboot/quartzJob/pause*', '暂停定时任务', '', 3, 'disable', 0, '');
INSERT INTO `t_permission` VALUES ('45265886315024384', '', '2018-08-24 12:02:49', 0, '', '2018-09-19 22:09:13', '', '', '41370251991977984', 1, 2.14, '', '/xboot/quartzJob/resume*', '恢复定时任务', '', 3, 'enable', 0, '');
INSERT INTO `t_permission` VALUES ('45266070000373760', NULL, '2018-08-24 12:03:33', 0, NULL, '2018-08-24 12:03:33', NULL, '', '41370251991977984', 1, 2.15, '', '/xboot/quartzJob/delByIds/*', '删除定时任务', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('5129710648430592', '', '2018-06-04 19:02:29', 0, '', '2019-07-11 09:53:06', '', 'sys', '125909152017944576', 0, 0.00, 'Main', '/sys', '系统管理', 'ios-settings', 1, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430593', '', '2018-06-04 19:02:32', 0, '', '2019-08-05 17:45:29', '', 'user-manage', '5129710648430592', 0, 1.10, 'sys/user-manage/userManage', 'user-manage', '用户管理', 'md-person', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430594', '', '2018-06-04 19:02:35', 0, '', '2019-07-11 11:01:39', '', 'role-manage', '5129710648430592', 0, 1.60, 'sys/role-manage/roleManage', 'role-manage', '角色权限管理', 'md-contacts', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('5129710648430595', '', '2018-06-04 19:02:37', 0, '', '2018-09-23 23:32:02', '', 'menu-manage', '5129710648430592', 0, 1.70, 'sys/menu-manage/menuManage', 'menu-manage', '菜单权限管理', 'md-menu', 2, '', 0, '');
INSERT INTO `t_permission` VALUES ('56898976661639168', '', '2018-09-25 14:28:34', 0, '', '2018-09-25 15:12:46', '', '', '5129710648430593', 1, 1.17, '', '/xboot/user/importData*', '导入用户', '', 3, 'input', 0, '');
INSERT INTO `t_permission` VALUES ('57009544286441472', NULL, '2018-09-25 21:47:55', 0, NULL, '2018-09-25 21:47:55', NULL, '', '43117268627886080', 1, 1.40, '', '/xboot/messageSend/save*', '添加已发送消息', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('57009744761589760', NULL, '2018-09-25 21:48:43', 0, NULL, '2018-09-25 21:48:43', NULL, '', '43117268627886080', 1, 1.50, '', '/xboot/messageSend/update*', '编辑已发送消息', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('57009981228060672', NULL, '2018-09-25 21:49:39', 0, NULL, '2018-09-25 21:49:39', NULL, '', '43117268627886080', 1, 1.60, '', '/xboot/messageSend/delByIds/*', '删除已发送消息', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('57212882168844288', '', '2018-09-26 11:15:55', 0, '', '2018-10-08 11:10:05', '', '', '56309618086776832', 1, 1.41, '', '无', '上传文件', '', 3, 'upload', 0, '');
INSERT INTO `t_permission` VALUES ('61394706252173312', NULL, '2018-10-08 00:12:59', 0, NULL, '2018-10-08 00:12:59', NULL, '', '58480609315524608', 1, 1.81, '', '/xboot/setting/seeSecret/**', '查看私密配置', '', 3, 'view', 0, NULL);
INSERT INTO `t_permission` VALUES ('61417744146370560', '', '2018-10-08 01:44:32', 0, '', '2018-10-08 01:50:03', '', '', '58480609315524608', 1, 1.82, '', '/xboot/setting/*/set*', '编辑配置', '', 3, 'edit', 0, '');
INSERT INTO `t_permission` VALUES ('61560041605435392', NULL, '2018-10-08 11:09:58', 0, NULL, '2018-10-08 11:09:58', NULL, '', '56309618086776832', 1, 1.42, '', '/xboot/file/rename*', '重命名文件', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('61560275261722624', NULL, '2018-10-08 11:10:54', 0, NULL, '2018-10-08 11:10:54', NULL, '', '56309618086776832', 1, 1.43, '', '/xboot/file/copy*', '复制文件', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('61560480518377472', NULL, '2018-10-08 11:11:43', 0, NULL, '2018-10-08 11:11:43', NULL, '', '56309618086776832', 1, 1.44, '', '/xboot/file/delete/*', '删除文件', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('67027338952445952', 'admin', '2018-10-23 13:15:03', 0, 'admin', '2019-07-05 16:30:47', '', 'product-template', '125909152017944576', 0, 4.00, 'Main', '/product-template', '前台产品级组件', 'md-ribbon', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('75002207560273920', 'admin', '2018-11-14 13:24:21', 0, 'admin', '2019-07-25 10:17:47', '', 'dict', '5129710648430592', 0, 1.80, 'sys/dict-manage/dictManage', 'dict', '数据字典管理', 'md-bookmarks', 2, '', -1, '');
INSERT INTO `t_permission` VALUES ('76215889006956544', 'admin', '2018-11-17 21:47:05', 0, 'admin', '2018-11-17 21:47:53', '', '', '75002207560273920', 1, 1.81, '', '/xboot/dict/add*', '添加字典', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('76216071333351424', 'admin', '2018-11-17 21:47:48', 0, 'admin', '2018-11-17 21:47:48', NULL, '', '75002207560273920', 1, 1.82, '', '/xboot/dict/edit*', '编辑字典', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216264070008832', 'admin', '2018-11-17 21:48:34', 0, 'admin', '2018-11-17 21:48:34', NULL, '', '75002207560273920', 1, 1.83, '', '/xboot/dict/delByIds/**', '删除字典', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216459709124608', 'admin', '2018-11-17 21:49:21', 0, 'admin', '2018-11-17 21:49:21', NULL, '', '75002207560273920', 1, 1.84, '', '/xboot/dictData/add*', '添加字典数据', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216594207870976', 'admin', '2018-11-17 21:49:53', 0, 'admin', '2018-11-17 21:49:53', NULL, '', '75002207560273920', 1, 1.85, '', '/xboot/dictData/edit*', '编辑字典数据', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('76216702639017984', 'admin', '2018-11-17 21:50:18', 0, 'admin', '2018-11-17 21:50:18', NULL, '', '75002207560273920', 1, 1.86, '', '/xboot/dictData/delByIds/**', '删除字典数据', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('76606430504816640', 'admin', '2018-11-18 23:38:57', 0, 'admin', '2019-07-25 10:16:43', '', 'activiti', '125909152017944576', 0, 1.10, 'Main', '/activiti', '工作流程', 'md-git-compare', 1, '', -1, '');
INSERT INTO `t_permission` VALUES ('84082369492946944', 'admin', '2018-12-09 14:45:40', 0, 'admin', '2018-12-09 14:46:59', '', '', '81558529864896512', 1, 0.00, '', '/xboot/leave/add*', '添加请假申请', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('84082920431554560', 'admin', '2018-12-09 14:47:51', 0, 'admin', '2018-12-09 14:47:51', NULL, '', '81558529864896512', 1, 1.00, '', '/xboot/actBusiness/delByIds/**', '删除草稿申请', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84083562503999488', 'admin', '2018-12-09 14:50:25', 0, 'admin', '2018-12-09 14:50:25', NULL, '', '81716172680073216', 1, 0.00, '', '/xboot/actTask/pass**', '审批通过', '', 3, 'enable', 0, NULL);
INSERT INTO `t_permission` VALUES ('84083641302388736', 'admin', '2018-12-09 14:50:43', 0, 'admin', '2018-12-09 14:50:43', NULL, '', '81716172680073216', 1, 1.00, '', '/xboot/actTask/back**', '审批驳回', '', 3, 'disable', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084404707659776', 'admin', '2018-12-09 14:53:45', 0, 'admin', '2018-12-09 14:53:45', NULL, '', '81716172680073216', 1, 3.00, '', '/xboot/actTask/delegate**', '委托代办', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084724590448640', 'admin', '2018-12-09 14:55:02', 0, 'admin', '2018-12-09 14:55:02', NULL, '', '82269650301227008', 1, 0.00, '', '/xboot/actTask/deleteHistoric/**', '删除已办任务', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84084965817454592', 'admin', '2018-12-09 14:55:59', 0, 'admin', '2018-12-09 14:55:59', NULL, '', '81319435670917120', 1, 0.00, '', '/xboot/actProcess/delInsByIds/**', '删除运行流程', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085542324539392', 'admin', '2018-12-09 14:58:17', 0, 'admin', '2018-12-09 14:58:17', NULL, '', '76914082455752704', 1, 0.00, '', '/xboot/actProcess/updateInfo/**', '编辑流程信息', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085810797744128', 'admin', '2018-12-09 14:59:21', 0, 'admin', '2018-12-09 14:59:21', NULL, '', '76914082455752704', 1, 1.00, '', '/xboot/actProcess/editNodeUser**', '流程节点设置', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84085980943880192', 'admin', '2018-12-09 15:00:01', 0, 'admin', '2018-12-09 15:00:01', NULL, '', '76914082455752704', 1, 2.00, '', '/xboot/actProcess/convertToModel/**', '流程转模型', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84086163001839616', 'admin', '2018-12-09 15:00:45', 0, 'admin', '2018-12-09 15:01:37', '', '', '76914082455752704', 1, 3.00, '', '/xboot/actProcess/delByIds/**', '删除流程定义', '', 3, 'delete', 0, '');
INSERT INTO `t_permission` VALUES ('84086362248056832', 'admin', '2018-12-09 15:01:32', 0, 'admin', '2018-12-09 15:01:32', NULL, '', '76914082455752704', 1, 4.00, '', '/xboot/actModel/deployByFile**', '文件部署流程', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84086882907983872', 'admin', '2018-12-09 15:03:36', 0, 'admin', '2018-12-09 15:03:36', NULL, '', '76607201262702592', 1, 0.00, '', '/xboot/actModel/add**', '添加模型', '', 3, 'add', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087009940869120', 'admin', '2018-12-09 15:04:06', 0, 'admin', '2018-12-09 15:04:06', NULL, '', '76607201262702592', 1, 1.00, '', '/xboot/actModel/delByIds/**', '删除模型', '', 3, 'delete', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087154040377344', 'admin', '2018-12-09 15:04:41', 0, 'admin', '2018-12-09 15:04:41', NULL, '', '76607201262702592', 1, 2.00, '', '/xboot/actModel/deploy/**', '部署模型', '', 3, 'other', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087344352727040', 'admin', '2018-12-09 15:05:26', 0, 'admin', '2018-12-09 15:05:33', '', '', '80539147005071360', 1, 0.00, '', '/xboot/actCategory/add**', '添加流程分类', '', 3, 'add', 0, '');
INSERT INTO `t_permission` VALUES ('84087480852156416', 'admin', '2018-12-09 15:05:59', 0, 'admin', '2018-12-09 15:05:59', NULL, '', '80539147005071360', 1, 1.00, '', '/xboot/actCategory/edit**', '编辑流程分类', '', 3, 'edit', 0, NULL);
INSERT INTO `t_permission` VALUES ('84087593041399808', 'admin', '2018-12-09 15:06:25', 0, 'admin', '2018-12-09 15:06:25', NULL, '', '80539147005071360', 1, 2.00, '', '/xboot/actCategory/delByIds/**', '删除流程分类', '', 3, 'delete', 0, NULL);

-- ----------------------------
-- Table structure for t_portal_config
-- ----------------------------
DROP TABLE IF EXISTS `t_portal_config`;
CREATE TABLE `t_portal_config`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_portal_config
-- ----------------------------
INSERT INTO `t_portal_config` VALUES ('1', 'njp', '2019-08-08 14:12:59', NULL, NULL, NULL, '/upload/', 'upload', '新闻图片上传路径');
INSERT INTO `t_portal_config` VALUES ('2', 'njp', '2019-08-08 14:13:01', NULL, NULL, NULL, 'http://10.1.13.14:8899', 'url', '新闻图片访问路径前缀');
INSERT INTO `t_portal_config` VALUES ('3', NULL, NULL, NULL, NULL, NULL, 'http://10.1.13.14:8080/portal', NULL, NULL);
INSERT INTO `t_portal_config` VALUES ('4', 'xbw', NULL, NULL, NULL, NULL, 'http://10.39.5.48:9797', 'systemUrl', '共享系统推送信息');

-- ----------------------------
-- Table structure for t_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `t_quartz_job`;
CREATE TABLE `t_quartz_job`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_quartz_job
-- ----------------------------
INSERT INTO `t_quartz_job` VALUES ('41060689401352192', '', '2018-08-12 20:32:52', 0, 'admin', '2018-11-20 09:51:38', '0/1 * * * * ? ', '无参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleJob', '', -1);
INSERT INTO `t_quartz_job` VALUES ('41065738420621312', '', '2018-08-12 21:52:56', 0, '', '2018-09-23 23:19:39', '0/1 * * * * ? ', '带参测试 后台将每隔1秒执行输出日志', 'cn.exrick.xboot.quartz.jobs.SampleParamJob', 'World', -1);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `default_role` bit(1) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('161671309225365504', '', '2019-07-11 17:16:25', '', '2019-08-08 10:38:52', 'test', 0, b'0', 'test', 0, NULL, NULL, 'home-pages', NULL);
INSERT INTO `t_role` VALUES ('16457350655250432', '', '2018-06-06 00:08:00', 'admin', '2018-11-02 20:42:24', 'ROLE_TEST', 0, NULL, '测试权限按钮显示', 1, NULL, NULL, 'home-pages', NULL);
INSERT INTO `t_role` VALUES ('496138616573952', '', '2018-04-22 23:03:49', 'admin', '2018-11-15 23:02:59', 'ROLE_ADMIN', 0, NULL, '超级管理员 拥有所有权限', 0, NULL, NULL, 'home_index', NULL);
INSERT INTO `t_role` VALUES ('496138616573953', '', '2018-05-02 21:40:03', 'admin', '2018-11-01 22:59:48', 'ROLE_USER', 0, b'1', '普通注册用户 路过看看', 0, NULL, NULL, 'home-pages', NULL);

-- ----------------------------
-- Table structure for t_role_department
-- ----------------------------
DROP TABLE IF EXISTS `t_role_department`;
CREATE TABLE `t_role_department`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_department
-- ----------------------------
INSERT INTO `t_role_department` VALUES ('70763874256687105', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322777781112832', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874265075712', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322811096469504', '16457350655250432');
INSERT INTO `t_role_department` VALUES ('70763874277658624', 'admin', '2018-11-02 20:42:43', 0, 'admin', '2018-11-02 20:42:43', '40322852833988608', '16457350655250432');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `permission_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('169524036584345600', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '5129710648430592', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036622094336', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '5129710648430593', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036626288641', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '40238597734928384', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036630482945', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '5129710648430594', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036634677248', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '5129710648430595', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036638871552', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '41370251991977984', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036643065857', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '41363147411427328', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036647260161', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '39916171171991552', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036651454465', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '39918482854252544', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036655648768', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '41375330996326400', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036659843073', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '42082442672082944', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036664037377', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '41378916912336896', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036668231681', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '113602342657462272', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036672425984', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '16438800255291392', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036676620288', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '16438962738434048', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('169524036676620290', NULL, '2019-08-02 09:20:21', 0, NULL, '2019-08-02 09:20:21', '16439068543946752', '496138616573953');
INSERT INTO `t_role_permission` VALUES ('171700766979919872', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '125909152017944576', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767013474304', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '5129710648430592', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767017668608', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '5129710648430593', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767021862912', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '15701400130424832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767026057216', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16678126574637056', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767034445824', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '15701915807518720', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767038640128', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '15708892205944832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767042834432', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16678447719911424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767047028736', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '25014528525733888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767047028738', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '56898976661639168', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767051223041', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '40238597734928384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767055417344', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45235621697949696', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767059611648', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45235787867885568', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767063805952', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45235939278065664', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767068000256', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '5129710648430594', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767068000258', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16687383932047360', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767072194561', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16689632049631232', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767076388864', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16689745006432256', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767080583168', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16689883993083904', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767080583170', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16690313745666048', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767084777473', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '5129710648430595', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767088971777', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16694861252005888', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767093166080', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16695107491205120', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767097360384', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '16695243126607872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767101554688', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76215889006956544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767101554690', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76216071333351424', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767105748993', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76216264070008832', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767109943297', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76216459709124608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767114137601', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76216594207870976', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767118331904', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '76216702639017984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767122526208', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '171700250925338624', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767122526210', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '171700638722297856', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767126720512', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '166373302313422848', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767130914816', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '166374111793123328', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767130914818', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '41370251991977984', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767135109121', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45264987354042368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767139303424', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45265487029866496', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767139303426', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45265762415284224', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767143497729', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45265886315024384', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767147692033', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '45266070000373760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767151886337', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '39918482854252544', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767156080640', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161555347276828672', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767160274944', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161557183329210368', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767160274946', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '41375330996326400', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767164469249', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '129033675403694080', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767168663552', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '42082442672082944', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767172857856', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '41378916912336896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767177052160', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161554869990199296', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767177052162', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161556903283920896', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767181246465', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161555090384097280', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767185440768', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161557060398354432', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767189635072', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '113602342657462272', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767189635074', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161555604320555008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767193829376', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161557326606635008', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767198023680', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161554421073842176', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767198023682', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161556354681540608', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767202217985', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161554609066741760', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767206412288', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161556732668022784', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767210606592', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '156497029474816000', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767214800896', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '156505860971958272', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767218995200', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '159441623791439872', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767223189504', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '159839410597138432', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('171700767227383808', NULL, '2019-08-08 09:29:54', 0, NULL, '2019-08-08 09:29:54', '161569553686466560', '496138616573952');
INSERT INTO `t_role_permission` VALUES ('75002588591820806', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '5129710648430592', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588604403712', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '5129710648430593', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588612792320', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '40238597734928384', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588625375232', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '57009744761589760', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588633763840', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '16392452747300864', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588637958144', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '16392767785668608', '16457350655250432');
INSERT INTO `t_role_permission` VALUES ('75002588650541056', 'admin', '2018-11-14 13:25:52', 0, 'admin', '2018-11-14 13:25:52', '16439068543946752', '16457350655250432');

-- ----------------------------
-- Table structure for t_subsystem_news
-- ----------------------------
DROP TABLE IF EXISTS `t_subsystem_news`;
CREATE TABLE `t_subsystem_news`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_subsystem_news
-- ----------------------------
INSERT INTO `t_subsystem_news` VALUES ('169562084755902464', NULL, '2019-08-02 11:51:32', 0, NULL, '2019-08-07 16:33:32', '久其金建', NULL, '高温避暑', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('170702053864116224', NULL, '2019-08-05 15:21:22', 0, NULL, '2019-08-07 16:34:04', '久其金建', NULL, '香港暴乱', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '1', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('170718517945962496', NULL, '2019-08-05 16:26:47', 0, NULL, '2019-08-07 16:33:28', '久其金建', NULL, '久其报表', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务');
INSERT INTO `t_subsystem_news` VALUES ('171069480338722816', '2019-08-06 15:41:23', '2019-08-06 18:03:39', 0, NULL, '2019-08-07 16:33:57', '久其金建', NULL, '久其', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '1', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('171069483606085632', '2019-08-06 15:41:24', '2019-08-06 18:03:42', 0, NULL, '2019-08-07 16:33:53', '久其金建', NULL, '久其', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '1', '财务');
INSERT INTO `t_subsystem_news` VALUES ('171357195303129088', NULL, '2019-08-07 10:44:40', 0, NULL, '2019-08-07 11:40:19', '久其金建', NULL, '测试新闻标题002', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '1', '共享系统');
INSERT INTO `t_subsystem_news` VALUES ('171357196750163968', '2019-08-07 10:44:40', NULL, 0, NULL, NULL, '湖南交水建测试', NULL, NULL, 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171357198167838720', NULL, '2019-08-07 10:44:40', 0, NULL, '2019-08-07 11:40:24', '久其金建', NULL, '测试新闻标题001', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '1', '共享系统');
INSERT INTO `t_subsystem_news` VALUES ('171372575417438208', '2019-08-07 11:45:46', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171400413839364096', '2019-08-07 13:36:24', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171405775258783744', '2019-08-07 13:57:42', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171408949927481344', NULL, '2019-08-07 14:10:19', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171410023447007232', '2019-08-07 14:14:35', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171413994244935680', NULL, '2019-08-07 14:30:21', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171414129079226368', '2019-08-07 14:30:54', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171415680900403200', NULL, '2019-08-07 14:37:04', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171415870797516800', '2019-08-07 14:37:49', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_subsystem_news` VALUES ('171706087899140096', NULL, '2019-08-08 09:51:03', 0, NULL, NULL, '久其金建', NULL, '久其公告', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('171706209731088384', NULL, '2019-08-08 09:51:32', 0, NULL, NULL, '久其金建', NULL, '久其报表', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('171706527273455616', NULL, '2019-08-08 09:52:47', 0, NULL, '2019-08-08 09:56:47', '', NULL, '久其', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务系统');
INSERT INTO `t_subsystem_news` VALUES ('171707753985740800', NULL, '2019-08-08 09:57:40', 0, NULL, NULL, '久其金建', NULL, '久其团建', 'http://10.39.5.48:9797/portal/sso?newsId=64003774B140BC9143DE7CDAF187769F', '2', '财务气筒');

-- ----------------------------
-- Table structure for t_subsystem_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_subsystem_notice`;
CREATE TABLE `t_subsystem_notice`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system
-- ----------------------------
DROP TABLE IF EXISTS `t_system`;
CREATE TABLE `t_system`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sys_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sort_order` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_system
-- ----------------------------
INSERT INTO `t_system` VALUES ('166689990942658560', NULL, '2019-07-25 13:38:52', 0, NULL, '2019-08-06 13:55:30', 'http://www.baidu.com/', '档案管理', 'http://www.baidu.com/', 'Rectangle-path@2x(2).png', 0, 6.00);
INSERT INTO `t_system` VALUES ('166704886300282880', NULL, '2019-07-25 14:38:03', 0, NULL, '2019-08-06 14:17:48', 'http://10.39.5.48:9797/portal/sso/', 'HR', 'http://10.39.5.48:9797/portal/sso', 'Rectangle-path@2x(1).png', 0, 4.00);
INSERT INTO `t_system` VALUES ('167021049114791936', NULL, '2019-07-26 11:34:22', 0, NULL, '2019-08-06 14:17:59', 'http://10.39.5.48:9797/portal/sso/', 'OA', 'http://10.39.5.48:9797/portal/sso', 'Rectangle-path@2x.png', 0, 3.00);
INSERT INTO `t_system` VALUES ('167074391371288576', NULL, '2019-07-26 15:06:20', 0, NULL, '2019-08-06 14:17:56', 'http://10.39.5.48:9797/portal/sso/', '财务管理', 'http://10.39.5.48:9797/portal/sso', 'Rectangle-path@2x(3).png', 0, 2.00);
INSERT INTO `t_system` VALUES ('167074587723436032', NULL, '2019-07-26 15:07:07', 0, NULL, '2019-08-06 14:17:52', 'https://www.baidu.com/', '项目管理', 'http://10.39.5.48:9797/portal/sso', 'Rectangle-path@2x(4).png', 0, 1.00);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pass_strength` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ver_code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code_time` datetime(0) DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idcard_encryption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wx_status` int(11) DEFAULT NULL COMMENT '0:启用，1：禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idcard`(`idcard`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('156491877745430528', '', '2019-06-27 10:15:12', '', '2019-06-27 10:15:40', '', '', '', '2528747512@qq.com', '13269512108', '', '$2a$10$0XF8YO.GK8GjamfW9UPfZuVc6zP1iktR2i0GwaKPusy8WCcUHuiD2', '男', 0, 1, 'liming', 0, '40322811096469504', '', '', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_user` VALUES ('159469478143332352', NULL, '2019-07-05 15:27:08', NULL, '2019-07-26 09:35:12', NULL, '', NULL, '413511@qq.com', '15145299968', NULL, '$2a$10$O/5BxV9sVNV31zYVUBJDp.Bu5K6ocMz4.OGWxQRCQVdNLIOYEjtbW', '男', 0, 1, 'njp', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_user` VALUES ('160824438042923008', NULL, '2019-07-09 09:11:15', NULL, '2019-07-09 09:11:15', NULL, '', NULL, 'dsadsa@qq.com', '14141414141', NULL, '$2a$10$aiTFzwos6mP8Nk2XYOm4UOT5EeEHd33vh9RoPr4Go9m4rD6D/BTUu', '男', 0, 1, 'dsa', 0, '40322777781112832', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_user` VALUES ('166636975959314432', '', '2019-07-25 10:08:12', '', '2019-08-07 17:36:41', '', '', '', '1111@163.com', '15124188888', '', '$2a$10$vHXDJ6VHOeKsRF9pbLp5iO8AAo3O9ZRLN2FW9lMmAQecfKw9qcrJS', '男', 0, 0, 'XueBoWen', 0, '', '', '', NULL, NULL, '211321199601155555', '3974FBE7EEA5A80B0124C9597C1FA3A11696FB286B222249', 0);
INSERT INTO `t_user` VALUES ('166713145539170304', NULL, '2019-07-25 15:10:52', NULL, '2019-07-26 11:59:36', NULL, '', NULL, '54545@qq.com', '15145299983', NULL, '$2a$10$BSDkE/78MfrBFA58EwM/lOlYp5EYVA0nUau66d4OQPJz/Cdz2Br1G', '男', -1, 0, 'njptest', 0, '40322777781112832', NULL, NULL, NULL, NULL, '230505199509545555', NULL, -1);
INSERT INTO `t_user` VALUES ('166719656021725184', '', '2019-07-25 15:36:45', '', '2019-08-02 09:20:47', '', '', '', '43123123@qq.com', '15151515551', '', '$2a$10$inWMK2uYUzzOX3Q5jFgPgeKH09SiAsMoa/059FERZC1WFwVwla/Aa', '男', -1, 0, 'qwe', 0, '40322777781112832', '', '', NULL, NULL, '230209777777777777', 'SO4NNuDXGoJfs91sHuLmrduzx5EroOBmv+a7UQGQ3d0=', 0);
INSERT INTO `t_user` VALUES ('167061369399545856', '', '2019-07-26 14:14:35', '', '2019-07-26 14:23:10', '', '', '', '2328757432@qq.com', '13212341234', '', '$2a$10$en44AiqVCUL8k48fC7yAD.8DwShZzGHJj2NDBzVL9Nl2zavRF3SBy', '女', 0, 0, 'test1', 0, '40343262766043136', '', '', NULL, NULL, '220522199808087434', 'TjBdaECiykeDc1bVZsdMgx9bzusEAVEOt58OQvcdvi4=', 0);
INSERT INTO `t_user` VALUES ('16739222421508096', '', '2018-06-06 18:48:02', '', '2019-06-27 10:07:01', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test211111123234', 0, '40652338142121984', '', '弱', NULL, NULL, NULL, NULL, 0);
INSERT INTO `t_user` VALUES ('170642051447132160', '', '2019-08-05 11:22:57', '', '2019-08-06 11:58:35', '', '', '', '4333333@qq.com', '15145599949', '', '$2a$10$L7BzbPcgVBiFng/pldWKPOd6egcVamwBUqzmFQe0kyqDF08MduLz2', '1', 0, 0, 'nijianping', 0, '170972277016367104', '', '', NULL, NULL, '235050177608985500', 'C56C14116832D6B7D98D737B274B87A91DEAAB85B6513BB7', NULL);
INSERT INTO `t_user` VALUES ('170734738351329280', NULL, '2019-08-05 17:31:15', NULL, '2019-08-05 17:51:38', NULL, '', NULL, '55169912@qq.com', '13888782845', NULL, '$2a$10$S9D3bYv46hDfIiLzm2ygOe4GJAincfqHmwENBYolAmGV8RJwcsM2m', '男', 0, 0, 'XieAiGuo', 0, '40343262766043136', NULL, NULL, NULL, NULL, '43303019750604141X', '10B4FB679660AE15', 0);
INSERT INTO `t_user` VALUES ('4363087427670016', '', '2018-05-03 15:09:42', '', '2019-08-08 09:31:38', '[\"510000\",\"510100\",\"510114\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012139570@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 0, 'test', 0, '170972194023673856', '', '弱', NULL, NULL, '211321199701154367', '3974FBE7EEA5A80BE22F8D01268A2BD5FA2E5C4E1B5DF3B9', 0);
INSERT INTO `t_user` VALUES ('682265633886208', '', '2018-05-01 16:13:51', 'admin', '2019-07-25 16:45:10', '[\"510000\",\"510100\",\"510104\"]', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', 'test', '2549575805@qq.com', '18782059038', 'Exrick', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '男', 0, 1, 'admin', 0, '40322777781112832', '天府1街', '弱', NULL, NULL, '211321199601134255', '3974FBE7EEA5A80BA885C005904C7AC91696FB286B222249', 0);
INSERT INTO `t_user` VALUES ('682265633886209', '', '2018-04-30 23:28:42', 'admin', '2019-04-28 22:31:02', '', 'https://s1.ax1x.com/2018/05/19/CcdVQP.png', '', '1012@qq.com', '18782059033', '', '$2a$10$PS04ecXfknNd3V8d.ymLTObQciapMU4xU8.GADBZZsuTZr7ymnagy', '女', -1, 0, 'Exrick', 0, '40322777781112832', '', '弱', NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('134933785559961600', NULL, '2019-04-28 22:31:02', 0, NULL, '2019-04-28 22:31:02', '496138616573953', '682265633886209');
INSERT INTO `t_user_role` VALUES ('134933785576738816', NULL, '2019-04-28 22:31:02', 0, NULL, '2019-04-28 22:31:02', '496138616573952', '682265633886209');
INSERT INTO `t_user_role` VALUES ('156489816261791745', NULL, '2019-06-27 10:07:01', 0, NULL, '2019-06-27 10:07:01', '16457350655250432', '16739222421508096');
INSERT INTO `t_user_role` VALUES ('156491992988127233', NULL, '2019-06-27 10:15:40', 0, NULL, '2019-06-27 10:15:40', '496138616573952', '156491877745430528');
INSERT INTO `t_user_role` VALUES ('159469478604705792', NULL, '2019-07-05 15:27:08', 0, NULL, '2019-07-05 15:27:08', '496138616573952', '159469478143332352');
INSERT INTO `t_user_role` VALUES ('160824438483324928', NULL, '2019-07-09 09:11:15', 0, NULL, '2019-07-09 09:11:15', '496138616573952', '160824438042923008');
INSERT INTO `t_user_role` VALUES ('166713145971183616', NULL, '2019-07-25 15:10:52', 0, NULL, '2019-07-25 15:10:52', '496138616573953', '166713145539170304');
INSERT INTO `t_user_role` VALUES ('166720019852431360', NULL, '2019-07-25 15:38:11', 0, NULL, '2019-07-25 15:38:11', '496138616573953', '166719656021725184');
INSERT INTO `t_user_role` VALUES ('167063529063452672', NULL, '2019-07-26 14:23:10', 0, NULL, '2019-07-26 14:23:10', '16457350655250432', '167061369399545856');
INSERT INTO `t_user_role` VALUES ('170734738846257152', NULL, '2019-08-05 17:31:15', 0, NULL, '2019-08-05 17:31:15', '496138616573952', '170734738351329280');
INSERT INTO `t_user_role` VALUES ('170734738879811584', NULL, '2019-08-05 17:31:15', 0, NULL, '2019-08-05 17:31:15', '496138616573953', '170734738351329280');
INSERT INTO `t_user_role` VALUES ('170734738884005888', NULL, '2019-08-05 17:31:15', 0, NULL, '2019-08-05 17:31:15', '16457350655250432', '170734738351329280');
INSERT INTO `t_user_role` VALUES ('171013410564083712', NULL, '2019-08-06 11:58:35', 0, NULL, '2019-08-06 11:58:35', '496138616573952', '170642051447132160');
INSERT INTO `t_user_role` VALUES ('171461196187176960', NULL, '2019-08-07 17:37:56', 0, NULL, '2019-08-07 17:37:56', '496138616573953', '166636975959314432');
INSERT INTO `t_user_role` VALUES ('171701204408078336', NULL, '2019-08-08 09:31:38', 0, NULL, '2019-08-08 09:31:38', '496138616573953', '4363087427670016');
INSERT INTO `t_user_role` VALUES ('98931727094779904', NULL, '2019-01-19 14:11:43', 0, NULL, '2019-01-19 14:11:43', '496138616573952', '682265633886208');

-- ----------------------------
-- Table structure for t_warning
-- ----------------------------
DROP TABLE IF EXISTS `t_warning`;
CREATE TABLE `t_warning`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_warning
-- ----------------------------
INSERT INTO `t_warning` VALUES ('1', NULL, NULL, 0, NULL, '2019-08-02 15:40:45', '久其分部', '预警', 'http://10.1.13.28:8989/portal/GetWarningCountServlet');

SET FOREIGN_KEY_CHECKS = 1;
