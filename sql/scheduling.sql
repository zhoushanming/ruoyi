/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : 127.0.0.1:3306
 Source Schema         : scheduling

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 23/02/2023 14:31:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee_preferences
-- ----------------------------
DROP TABLE IF EXISTS `employee_preferences`;
CREATE TABLE `employee_preferences`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '员工偏好ID',
  `preference_type` int(2) NULL DEFAULT NULL COMMENT '可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展\n',
  `staff` bigint(255) NULL DEFAULT NULL COMMENT '员工',
  `preference_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '偏好值',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工偏好' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_preferences
-- ----------------------------
INSERT INTO `employee_preferences` VALUES (1, 1, 3967, '1,3,4', '1', '2023-02-14 16:27:40', '1', '2023-02-23 01:15:34', NULL, '0');
INSERT INTO `employee_preferences` VALUES (2, 1, 3968, '2,4,6', '1', '2023-02-14 21:40:10', '1', '2023-02-23 01:16:04', NULL, '0');
INSERT INTO `employee_preferences` VALUES (3, 2, 3969, '08:00-12:00,18:00-22:00', '1', '2023-02-17 16:17:20', '1', '2023-02-23 01:50:47', NULL, '0');
INSERT INTO `employee_preferences` VALUES (4, 3, 3970, '1,4', '1', '2023-02-17 16:33:16', '1', '2023-02-23 01:16:23', NULL, '0');
INSERT INTO `employee_preferences` VALUES (5, 1, 3969, '1,3,4', '', '2023-02-23 14:18:55', '', NULL, '1111', '0');

-- ----------------------------
-- Table structure for forecastdata
-- ----------------------------
DROP TABLE IF EXISTS `forecastdata`;
CREATE TABLE `forecastdata`  (
  `id` int(11) NOT NULL COMMENT 'ID',
  `store_id` int(11) NULL DEFAULT NULL COMMENT '门店ID',
  `dater` datetime NULL DEFAULT NULL COMMENT '日期',
  `starttime` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `rateflow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预测顾客流量',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务预测数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forecastdata
-- ----------------------------

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(11) NOT NULL COMMENT 'ID',
  `staff_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工',
  `rule_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '排班管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `position` bigint(255) NULL DEFAULT NULL COMMENT '职位',
  `store_id` bigint(11) NULL DEFAULT NULL COMMENT '员工所属门店id',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3971 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (3967, '测试1', '2216641967@qq.com', 4, 2, '1', '2023-02-14 16:27:40', '1', '2023-02-23 01:15:34', '', '0');
INSERT INTO `staff` VALUES (3968, '测试2', '2216641967@qq.com', 3, 2, '1', '2023-02-14 21:40:10', '1', '2023-02-23 01:16:04', '', '0');
INSERT INTO `staff` VALUES (3969, '测试6', '2216641967@qq.com', 4, 3, '1', '2023-02-17 16:17:20', '1', '2023-02-23 01:50:47', '', '0');
INSERT INTO `staff` VALUES (3970, '测试7', '2216641967@qq.com', 5, 2, '1', '2023-02-17 16:33:16', '1', '2023-02-23 01:16:23', '', '0');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '门店ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店地址',
  `storesize` double NULL DEFAULT NULL COMMENT '门店大小（单位：平方米）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, '大兴门店', '北京市大兴区丽园路与兴丰大街交叉路口向西北约200米', 450, '', '2023-02-14 10:12:53', '', '2023-02-14 10:15:24', '', '');
INSERT INTO `store` VALUES (2, '通州门店', '北京市通州区通朝大街甲512号', 620, '', '2023-02-14 10:16:14', '', NULL, '', '');
INSERT INTO `store` VALUES (3, '石景山区门店', '北京市石景山区玉泉路59号院2号楼', 300, '', '2023-02-14 10:16:57', '', NULL, '', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'false', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2023-02-11 18:06:05', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '总公司', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '北京公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '工作日偏好', '1', 'preference_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:55:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '工作时间偏好', '2', 'preference_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:56:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, '班次时长偏好', '3', 'preference_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:56:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 1, '开店规则', '1', 'rules_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:58:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 2, '关店规则', '2', 'rules_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:58:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 3, '客流规则', '3', 'rules_type', NULL, 'default', 'Y', '0', 'admin', '2023-02-14 01:58:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 4, '门店营业时间规则', '4', 'rules_type', NULL, NULL, 'Y', '0', 'admin', '2023-02-23 01:01:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 5, '工作时长规则', '5', 'rules_type', NULL, NULL, 'Y', '0', 'admin', '2023-02-23 01:01:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 6, '休息时间段规则', '6', 'rules_type', NULL, NULL, 'Y', '0', 'admin', '2023-02-23 01:02:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 1, '固定规则', '1', 'rule_status', NULL, NULL, 'Y', '0', 'admin', '2023-02-23 02:18:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 2, '自定义规则', '2', 'rule_status', NULL, NULL, 'Y', '0', 'admin', '2023-02-23 02:18:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 7, '排班规则', '7', 'rules_type', '', '', 'Y', '0', 'admin', '2023-02-23 02:49:12', 'admin', '2023-02-23 02:49:59', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '员工偏好类型', 'preference_type', '0', 'admin', '2023-02-14 01:54:54', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '可选值类型', 'rules_type', '0', 'admin', '2023-02-14 01:57:38', 'admin', '2023-02-23 02:18:14', '可选值:开店规则、关店规则、客流规则。可扩展');
INSERT INTO `sys_dict_type` VALUES (13, '排版规则类型', 'rule_status', '0', 'admin', '2023-02-23 02:17:48', '', NULL, '排班规则（1.固定规则2.自定义规则）');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-02-11 18:06:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 00:54:59');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 00:55:03');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 09:36:14');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 09:52:24');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 09:52:32');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 10:55:29');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 11:31:23');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:23:14');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:30:30');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:33:38');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:37:04');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:40:04');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:56:12');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 14:59:10');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 15:30:29');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:00:42');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:01:50');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 16:20:42');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:20:45');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 16:27:14');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:27:21');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:45:25');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 16:55:24');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 17:01:01');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 17:01:08');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 17:03:12');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 17:23:52');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 17:31:51');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-14 17:35:00');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 17:35:05');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-14 21:39:30');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-17 15:19:44');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:19:48');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:36:16');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:43:55');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-17 15:46:25');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:46:29');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:52:03');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-17 15:55:53');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:55:57');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 16:15:54');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 16:32:26');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-18 11:44:44');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 21:51:15');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 21:14:27');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 21:23:59');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 21:46:20');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 00:40:37');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 01:15:08');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-23 01:48:01');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 01:48:05');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 02:13:52');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-23 02:38:15');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 02:38:18');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 02:42:51');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 03:25:11');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-23 03:30:39');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 03:30:43');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 03:31:55');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 03:39:23');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-23 04:01:33');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:01:43');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:07:30');
INSERT INTO `sys_logininfor` VALUES (64, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:30:56');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:33:36');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:37:31');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:45:31');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:51:54');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 04:57:39');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 05:26:26');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 10:09:34');
INSERT INTO `sys_logininfor` VALUES (72, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 10:38:35');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 10:48:01');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 11:22:25');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 11:36:01');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 14:14:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2023-02-11 18:06:05', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2023-02-11 18:06:05', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2023-02-11 18:06:05', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2023-02-11 18:06:05', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2023-02-11 18:06:05', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2023-02-11 18:06:05', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2023-02-11 18:06:05', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2023-02-11 18:06:05', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2023-02-11 18:06:05', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2023-02-11 18:06:05', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2023-02-11 18:06:05', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2023-02-11 18:06:05', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2023-02-11 18:06:05', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2023-02-11 18:06:05', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2023-02-11 18:06:05', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2023-02-11 18:06:05', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2023-02-11 18:06:05', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2023-02-11 18:06:05', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2023-02-11 18:06:05', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2023-02-11 18:06:05', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '门店管理', 0, 1, '/system/store', 'menuItem', 'M', '0', '1', 'system:store:view', 'fa fa-institution', 'admin', '2023-02-14 02:01:47', 'admin', '2023-02-18 11:46:08', '门店管理菜单');
INSERT INTO `sys_menu` VALUES (1063, '门店管理查询', 1062, 1, '#', '', 'F', '0', '1', 'system:store:list', '#', 'admin', '2023-02-14 02:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '门店管理新增', 1062, 2, '#', '', 'F', '0', '1', 'system:store:add', '#', 'admin', '2023-02-14 02:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '门店管理修改', 1062, 3, '#', '', 'F', '0', '1', 'system:store:edit', '#', 'admin', '2023-02-14 02:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '门店管理删除', 1062, 4, '#', '', 'F', '0', '1', 'system:store:remove', '#', 'admin', '2023-02-14 02:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '门店管理导出', 1062, 5, '#', '', 'F', '0', '1', 'system:store:export', '#', 'admin', '2023-02-14 02:01:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '员工管理', 0, 1, '/system/staff', 'menuItem', 'M', '0', '1', 'system:staff:view', 'fa fa-users', 'admin', '2023-02-14 09:42:12', 'admin', '2023-02-18 11:46:18', '员工管理菜单');
INSERT INTO `sys_menu` VALUES (1069, '员工管理查询', 1068, 1, '#', '', 'F', '0', '1', 'system:staff:list', '#', 'admin', '2023-02-14 09:42:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '员工管理新增', 1068, 2, '#', '', 'F', '0', '1', 'system:staff:add', '#', 'admin', '2023-02-14 09:42:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1071, '员工管理修改', 1068, 3, '#', '', 'F', '0', '1', 'system:staff:edit', '#', 'admin', '2023-02-14 09:42:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, '员工管理删除', 1068, 4, '#', '', 'F', '0', '1', 'system:staff:remove', '#', 'admin', '2023-02-14 09:42:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '员工管理导出', 1068, 5, '#', '', 'F', '0', '1', 'system:staff:export', '#', 'admin', '2023-02-14 09:42:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '排班规则管理', 0, 1, '/system/rules', 'menuItem', 'M', '0', '1', 'system:rules:view', 'fa fa-window-restore', 'admin', '2023-02-14 09:47:57', 'admin', '2023-02-23 02:14:44', '排版规则管理菜单');
INSERT INTO `sys_menu` VALUES (1075, '排班规则管理查询', 1074, 1, '#', 'menuItem', 'F', '0', '1', 'system:rules:list', '#', 'admin', '2023-02-14 09:47:57', 'admin', '2023-02-23 02:14:54', '');
INSERT INTO `sys_menu` VALUES (1076, '排班规则管理新增', 1074, 2, '#', '', 'F', '0', '1', 'system:rules:add', '#', 'admin', '2023-02-14 09:47:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1077, '排班规则管理修改', 1074, 3, '#', '', 'F', '0', '1', 'system:rules:edit', '#', 'admin', '2023-02-14 09:47:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, '排班规则管理删除', 1074, 4, '#', '', 'F', '0', '1', 'system:rules:remove', '#', 'admin', '2023-02-14 09:47:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, '排班规则管理导出', 1074, 5, '#', '', 'F', '0', '1', 'system:rules:export', '#', 'admin', '2023-02-14 09:47:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, '业务预测数据', 0, 1, '/system/forecastdata', 'menuItem', 'M', '0', '1', 'system:forecastdata:view', 'fa fa-building-o', 'admin', '2023-02-23 03:20:46', 'admin', '2023-02-23 03:22:00', '业务预测数据菜单');
INSERT INTO `sys_menu` VALUES (1081, '业务预测数据查询', 1080, 1, '#', '', 'F', '0', '1', 'system:forecastdata:list', '#', 'admin', '2023-02-23 03:20:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, '业务预测数据新增', 1080, 2, '#', '', 'F', '0', '1', 'system:forecastdata:add', '#', 'admin', '2023-02-23 03:20:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, '业务预测数据修改', 1080, 3, '#', '', 'F', '0', '1', 'system:forecastdata:edit', '#', 'admin', '2023-02-23 03:20:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, '业务预测数据删除', 1080, 4, '#', '', 'F', '0', '1', 'system:forecastdata:remove', '#', 'admin', '2023-02-23 03:20:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1085, '业务预测数据导出', 1080, 5, '#', '', 'F', '0', '1', 'system:forecastdata:export', '#', 'admin', '2023-02-23 03:20:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, '排班管理', 0, 1, '/system/schedule', 'menuItem', 'M', '0', '1', 'system:schedule:view', 'fa fa-address-card-o', 'admin', '2023-02-23 10:29:13', 'admin', '2023-02-23 10:39:20', '排班管理菜单');
INSERT INTO `sys_menu` VALUES (1087, '排班管理查询', 1086, 1, '#', '', 'F', '0', '1', 'system:schedule:list', '#', 'admin', '2023-02-23 10:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, '排班管理新增', 1086, 2, '#', '', 'F', '0', '1', 'system:schedule:add', '#', 'admin', '2023-02-23 10:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, '排班管理修改', 1086, 3, '#', '', 'F', '0', '1', 'system:schedule:edit', '#', 'admin', '2023-02-23 10:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, '排班管理删除', 1086, 4, '#', '', 'F', '0', '1', 'system:schedule:remove', '#', 'admin', '2023-02-23 10:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1091, '排班管理导出', 1086, 5, '#', '', 'F', '0', '1', 'system:schedule:export', '#', 'admin', '2023-02-23 10:29:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1098, '员工偏好', 0, 1, '/system/preferences', 'menuItem', 'M', '0', '1', 'system:preferences:view', 'fa fa-bookmark-o', 'admin', '2023-02-23 11:09:49', 'admin', '2023-02-23 11:10:37', '员工偏好菜单');
INSERT INTO `sys_menu` VALUES (1099, '员工偏好查询', 1098, 1, '#', '', 'F', '0', '1', 'system:preferences:list', '#', 'admin', '2023-02-23 11:09:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, '员工偏好新增', 1098, 2, '#', '', 'F', '0', '1', 'system:preferences:add', '#', 'admin', '2023-02-23 11:09:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1101, '员工偏好修改', 1098, 3, '#', '', 'F', '0', '1', 'system:preferences:edit', '#', 'admin', '2023-02-23 11:09:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, '员工偏好删除', 1098, 4, '#', '', 'F', '0', '1', 'system:preferences:remove', '#', 'admin', '2023-02-23 11:09:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1103, '员工偏好导出', 1098, 5, '#', '', 'F', '0', '1', 'system:preferences:export', '#', 'admin', '2023-02-23 11:09:49', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (53, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"门店营业时间规则\"],\"dictValue\":[\"4\"],\"dictType\":[\"rules_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:01:08');
INSERT INTO `sys_oper_log` VALUES (54, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"工作时长规则\"],\"dictValue\":[\"5\"],\"dictType\":[\"rules_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:01:25');
INSERT INTO `sys_oper_log` VALUES (55, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"休息时间段规则\"],\"dictValue\":[\"6\"],\"dictType\":[\"rules_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:02:04');
INSERT INTO `sys_oper_log` VALUES (56, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"4\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a.周—~周五:早9点～晚9点\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:03:14');
INSERT INTO `sys_oper_log` VALUES (57, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"4\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"b.周末:早10点~晚10点\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:04:23');
INSERT INTO `sys_oper_log` VALUES (58, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"5\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a.员工每周最多工作40小时\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:04:52');
INSERT INTO `sys_oper_log` VALUES (59, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"4\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"b.员工每天最多工作8小时\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:05:21');
INSERT INTO `sys_oper_log` VALUES (60, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"rulesType\":[\"5\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b.员工每天最多工作8小时\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:05:32');
INSERT INTO `sys_oper_log` VALUES (61, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"5\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"c.单个班次最少2小时，最多4小时。员工可以连续排多个班次\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:05:54');
INSERT INTO `sys_oper_log` VALUES (62, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"5\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"d．员工最长连续工作时长:4小时。达到连续工作时长，必须安排休息时间\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:06:45');
INSERT INTO `sys_oper_log` VALUES (63, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"4\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"e.必须给工作时间完全覆盖午餐、晚餐时间的员工，安排午餐或晚餐时间\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:07:10');
INSERT INTO `sys_oper_log` VALUES (64, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"rulesType\":[\"5\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"e.必须给工作时间完全覆盖午餐、晚餐时间的员工，安排午餐或晚餐时间\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:07:17');
INSERT INTO `sys_oper_log` VALUES (65, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"6\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a.午餐时间:时间范围（如11点到14点，一小时)\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:07:54');
INSERT INTO `sys_oper_log` VALUES (66, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"5\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"b．晚餐时间:时间范围（如17点到20点，半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:08:16');
INSERT INTO `sys_oper_log` VALUES (67, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"rulesType\":[\"6\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b．晚餐时间:时间范围（如17点到20点，半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:08:23');
INSERT INTO `sys_oper_log` VALUES (68, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"5\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"c.休息时间:时间范围（不限。半小时)\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:09:17');
INSERT INTO `sys_oper_log` VALUES (69, '员工管理', 2, 'com.scheduling.project.system.staff.controller.StaffController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/staff/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3967\"],\"name\":[\"测试1\"],\"email\":[\"2216641967@qq.com\"],\"position\":[\"4\"],\"storeId\":[\"2\"],\"remark\":[\"\"],\"preferenceType\":[\"1\"],\"preferenceValue\":[\"1,3,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:15:33');
INSERT INTO `sys_oper_log` VALUES (70, '员工管理', 2, 'com.scheduling.project.system.staff.controller.StaffController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/staff/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3968\"],\"name\":[\"测试2\"],\"email\":[\"2216641967@qq.com\"],\"position\":[\"3\"],\"storeId\":[\"2\"],\"remark\":[\"\"],\"preferenceType\":[\"1\"],\"preferenceValue\":[\"2,4,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:16:03');
INSERT INTO `sys_oper_log` VALUES (71, '员工管理', 2, 'com.scheduling.project.system.staff.controller.StaffController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/staff/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3969\"],\"name\":[\"测试6\"],\"email\":[\"2216641967@qq.com\"],\"position\":[\"4\"],\"storeId\":[\"3\"],\"remark\":[\"\"],\"preferenceType\":[\"2\"],\"preferenceValue\":[\"6,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:16:15');
INSERT INTO `sys_oper_log` VALUES (72, '员工管理', 2, 'com.scheduling.project.system.staff.controller.StaffController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/staff/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3970\"],\"name\":[\"测试7\"],\"email\":[\"2216641967@qq.com\"],\"position\":[\"5\"],\"storeId\":[\"2\"],\"remark\":[\"\"],\"preferenceType\":[\"3\"],\"preferenceValue\":[\"1,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:16:23');
INSERT INTO `sys_oper_log` VALUES (73, '员工管理', 2, 'com.scheduling.project.system.staff.controller.StaffController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/staff/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3969\"],\"name\":[\"测试6\"],\"email\":[\"2216641967@qq.com\"],\"position\":[\"4\"],\"storeId\":[\"3\"],\"remark\":[\"\"],\"preferenceType\":[\"2\"],\"preferenceValue\":[\"08:00-12:00,18:00-22:00\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 01:50:46');
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 2, 'com.scheduling.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1074\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"排班规则管理\"],\"url\":[\"/system/rules\"],\"target\":[\"menuItem\"],\"perms\":[\"system:rules:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-window-restore\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:14:44');
INSERT INTO `sys_oper_log` VALUES (75, '菜单管理', 2, 'com.scheduling.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1075\"],\"parentId\":[\"1074\"],\"menuType\":[\"F\"],\"menuName\":[\"排班规则管理查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:rules:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:14:54');
INSERT INTO `sys_oper_log` VALUES (76, '字典类型', 1, 'com.scheduling.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"排版规则类型\"],\"dictType\":[\"rule_status\"],\"status\":[\"0\"],\"remark\":[\"排班规则（1.固定规则2.自定义规则）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:17:48');
INSERT INTO `sys_oper_log` VALUES (77, '字典类型', 2, 'com.scheduling.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"12\"],\"dictName\":[\"可选值类型\"],\"dictType\":[\"rules_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:18:01');
INSERT INTO `sys_oper_log` VALUES (78, '字典类型', 2, 'com.scheduling.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"12\"],\"dictName\":[\"可选值类型\"],\"dictType\":[\"rules_type\"],\"status\":[\"0\"],\"remark\":[\"可选值:开店规则、关店规则、客流规则。可扩展\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:18:14');
INSERT INTO `sys_oper_log` VALUES (79, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"固定规则\"],\"dictValue\":[\"1\"],\"dictType\":[\"rule_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:18:30');
INSERT INTO `sys_oper_log` VALUES (80, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"自定义规则\"],\"dictValue\":[\"2\"],\"dictType\":[\"rule_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:18:43');
INSERT INTO `sys_oper_log` VALUES (81, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"rulesType\":[\"1\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"23\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:23:28');
INSERT INTO `sys_oper_log` VALUES (82, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"rulesType\":[\"1\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"23\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:25:03');
INSERT INTO `sys_oper_log` VALUES (83, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"rulesType\":[\"4\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"a.周—~周五:早9点～晚9点\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:08');
INSERT INTO `sys_oper_log` VALUES (84, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"rulesType\":[\"4\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b.周末:早10点~晚10点\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:11');
INSERT INTO `sys_oper_log` VALUES (85, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"a.员工每周最多工作40小时\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:13');
INSERT INTO `sys_oper_log` VALUES (86, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"c.单个班次最少2小时，最多4小时。员工可以连续排多个班次\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:15');
INSERT INTO `sys_oper_log` VALUES (87, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b.员工每天最多工作8小时\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:18');
INSERT INTO `sys_oper_log` VALUES (88, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"e.必须给工作时间完全覆盖午餐、晚餐时间的员工，安排午餐或晚餐时间\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:21');
INSERT INTO `sys_oper_log` VALUES (89, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"rulesType\":[\"6\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"a.午餐时间:时间范围（如11点到14点，一小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:24');
INSERT INTO `sys_oper_log` VALUES (90, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"d．员工最长连续工作时长:4小时。达到连续工作时长，必须安排休息时间\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:26');
INSERT INTO `sys_oper_log` VALUES (91, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"rulesType\":[\"6\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b．晚餐时间:时间范围（如17点到20点，半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:29');
INSERT INTO `sys_oper_log` VALUES (92, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"c.休息时间:时间范围（不限。半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:34:34');
INSERT INTO `sys_oper_log` VALUES (93, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"2\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"c.休息时间:时间范围（不限。半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:39:44');
INSERT INTO `sys_oper_log` VALUES (94, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"rulesType\":[\"5\"],\"ruleStatus\":[\"1\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"c.休息时间:时间范围（不限。半小时)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:39:53');
INSERT INTO `sys_oper_log` VALUES (95, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a．每天开店之前需要半小时做准备工作（如做清洁）。0.5为缺省值，可\\r\\n调整\\r\\ni．公式:门店面积/50=人数。50为缺省值，可调整\\r\\nii．用户可以设置允许执行此类工作的职位。可以设置为所有\\r\\n职位，也可以限制特定职位（比如导购人员、收银，店经理等)\\r\\n\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21\r\n### The error may exist in file [F:\\wwcode\\wb\\23-2-7\\scheduling\\target\\classes\\mybatis\\system\\TypesettingRulesMapper.xml]\r\n### The error may involve com.scheduling.project.system.rules.mapper.TypesettingRulesMapper.insertTypesettingRules-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into typesetting_rules          ( rules_type,             store,             rule_value,                          create_time,                                       remark,                          rule_status )           values ( ?,             ?,             ?,                          ?,                                       ?,                          {ruleStatus} )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21', '2023-02-23 02:40:23');
INSERT INTO `sys_oper_log` VALUES (96, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a．每天开店之前需要半小时做准备工作（如做清洁）。0.5为缺省值，可\\r\\n调整\\r\\ni．公式:门店面积/50=人数。50为缺省值，可调整\\r\\nii．用户可以设置允许执行此类工作的职位。可以设置为所有\\r\\n职位，也可以限制特定职位（比如导购人员、收银，店经理等)\\r\\n\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21\r\n### The error may exist in file [F:\\wwcode\\wb\\23-2-7\\scheduling\\target\\classes\\mybatis\\system\\TypesettingRulesMapper.xml]\r\n### The error may involve com.scheduling.project.system.rules.mapper.TypesettingRulesMapper.insertTypesettingRules-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into typesetting_rules          ( rules_type,             store,             rule_value,                          create_time,                                       remark,                          rule_status )           values ( ?,             ?,             ?,                          ?,                                       ?,                          {ruleStatus} )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'} )\' at line 21', '2023-02-23 02:40:26');
INSERT INTO `sys_oper_log` VALUES (97, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"a.每天开店之前需要半小时做准备工作（如做清洁 ）。0.5为缺省值，可\\r\\n调整\\r\\ni．公式:门店面积/50=人数。50为缺省值，可调整\\r\\nii. 用户可以设置允许执行此类工作的职位。可以设置为所有\\r\\n职位，也可以限制特定职位（比如导购人员、收银，店经理等）\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:43:23');
INSERT INTO `sys_oper_log` VALUES (98, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"b.每天至少安排三个不超过4小时的班次\\r\\ni．公式:预测客流/3.8=店员需求数。3.8为缺省值，可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，\\r\\n也可以限制特定职位（比如导购人员、收银，店经理等）\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:46:35');
INSERT INTO `sys_oper_log` VALUES (99, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"c.如果没有客流量的时候，至少需要1个店员值班.1为缺省值，可调整\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:46:52');
INSERT INTO `sys_oper_log` VALUES (100, '排版规则管理', 1, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/add', '127.0.0.1', '内网IP', '{\"rulesType\":[\"1\"],\"ruleStatus\":[\"2\"],\"ruleValue\":[\"\"],\"store\":[\"2\"],\"remark\":[\"d.每天关店之后需要2小时做收尾工作（如盘点、清算、清洁）。2为缺\\r\\n省值。可调整\\r\\ni.公式:门店面积/30+ 2 =人数。30和2为缺省值。可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，也可以限制特定职位（比如导购人员、收银，店经理等）\\r\\n\\r\\n\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:47:23');
INSERT INTO `sys_oper_log` VALUES (101, '字典数据', 1, 'com.scheduling.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"排版规则\"],\"dictValue\":[\"7\"],\"dictType\":[\"rules_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:12');
INSERT INTO `sys_oper_log` VALUES (102, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12\"],\"rulesType\":[\"7\"],\"ruleStatus\":[\"2\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"a.每天开店之前需要半小时做准备工作（如做清洁 ）。0.5为缺省值，可\\r\\n调整\\r\\ni．公式:门店面积/50=人数。50为缺省值，可调整\\r\\nii. 用户可以设置允许执行此类工作的职位。可以设置为所有\\r\\n职位，也可以限制特定职位（比如导购人员、收银，店经理等）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:21');
INSERT INTO `sys_oper_log` VALUES (103, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"13\"],\"rulesType\":[\"7\"],\"ruleStatus\":[\"2\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"b.每天至少安排三个不超过4小时的班次\\r\\ni．公式:预测客流/3.8=店员需求数。3.8为缺省值，可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，\\r\\n也可以限制特定职位（比如导购人员、收银，店经理等）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:33');
INSERT INTO `sys_oper_log` VALUES (104, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"14\"],\"rulesType\":[\"7\"],\"ruleStatus\":[\"2\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"c.如果没有客流量的时候，至少需要1个店员值班.1为缺省值，可调整\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:40');
INSERT INTO `sys_oper_log` VALUES (105, '排版规则管理', 2, 'com.scheduling.project.system.rules.controller.TypesettingRulesController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/rules/edit', '127.0.0.1', '内网IP', '{\"id\":[\"15\"],\"rulesType\":[\"7\"],\"ruleStatus\":[\"2\"],\"store\":[\"2\"],\"ruleValue\":[\"\"],\"remark\":[\"d.每天关店之后需要2小时做收尾工作（如盘点、清算、清洁）。2为缺\\r\\n省值。可调整\\r\\ni.公式:门店面积/30+ 2 =人数。30和2为缺省值。可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，也可以限制特定职位（比如导购人员、收银，店经理等）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:45');
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 2, 'com.scheduling.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"41\"],\"dictLabel\":[\"排班规则\"],\"dictValue\":[\"7\"],\"dictType\":[\"rules_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"7\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 02:49:59');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 6, 'com.scheduling.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"forecastdata\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 03:08:54');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"forecastdata\"],\"tableComment\":[\"业务预测数据\"],\"className\":[\"Forecastdata\"],\"functionAuthor\":[\"scheduling\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"53\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"54\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"门店ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"storeId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"55\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"日期\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"dater\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"56\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"开始时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"starttime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"57\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"结束时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"endtime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"58\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"预测顾客流量\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"rateflow\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isLis', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 03:20:04');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/forecastdata', '127.0.0.1', '内网IP', '\"forecastdata\"', NULL, 0, NULL, '2023-02-23 03:20:09');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/forecastdata', '127.0.0.1', '内网IP', '\"forecastdata\"', NULL, 0, NULL, '2023-02-23 03:20:10');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.scheduling.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1080\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"业务预测数据\"],\"url\":[\"/system/forecastdata\"],\"target\":[\"menuItem\"],\"perms\":[\"system:forecastdata:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-building-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 03:22:00');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 6, 'com.scheduling.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"schedule\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:26:16');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/schedule', '127.0.0.1', '内网IP', '\"schedule\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:27:43');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/schedule', '127.0.0.1', '内网IP', '\"schedule\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:27:47');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 3, 'com.scheduling.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:27:50');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 6, 'com.scheduling.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"schedule\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:27:59');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"schedule\"],\"tableComment\":[\"排班管理\"],\"className\":[\"Schedule\"],\"functionAuthor\":[\"scheduling\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"74\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"75\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"员工\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"staffId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"76\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"规则ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"ruleId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"77\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"78\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"79\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"80\"],\"columns[6].sort', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:28:32');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/schedule', '127.0.0.1', '内网IP', '\"schedule\"', NULL, 0, NULL, '2023-02-23 10:28:48');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/schedule', '127.0.0.1', '内网IP', '\"schedule\"', NULL, 0, NULL, '2023-02-23 10:28:48');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.scheduling.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1086\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"排班管理\"],\"url\":[\"/system/schedule\"],\"target\":[\"menuItem\"],\"perms\":[\"system:schedule:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 10:39:20');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/employee_preferences', '127.0.0.1', '内网IP', '\"employee_preferences\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:04:42');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"employee_preferences\"],\"tableComment\":[\"员工偏好管理\"],\"className\":[\"EmployeePreferences\"],\"functionAuthor\":[\"scheduling\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"员工偏好ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"preferenceType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"preference_type\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"员工\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"staff\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"偏好值\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"preferenceValue\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:05:00');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/employee_preferences', '127.0.0.1', '内网IP', '\"employee_preferences\"', NULL, 0, NULL, '2023-02-23 11:05:09');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/schedule', '127.0.0.1', '内网IP', '\"schedule\"', NULL, 0, NULL, '2023-02-23 11:05:29');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/schedule', '127.0.0.1', '内网IP', '\"schedule\"', NULL, 0, NULL, '2023-02-23 11:05:34');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/schedule', '127.0.0.1', '内网IP', '\"schedule\"', NULL, 0, NULL, '2023-02-23 11:05:39');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/employee_preferences', '127.0.0.1', '内网IP', '\"employee_preferences\"', NULL, 0, NULL, '2023-02-23 11:07:31');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 3, 'com.scheduling.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:07:46');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 6, 'com.scheduling.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"employee_preferences\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:07:52');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"employee_preferences\"],\"tableComment\":[\"员工偏好管理\"],\"className\":[\"EmployeePreferences\"],\"functionAuthor\":[\"scheduling\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"84\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"员工偏好ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"85\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"preferenceType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"86\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"员工\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"staff\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"87\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"偏好值\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"preferenceValue\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"88\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"89\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].query', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:08:16');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.scheduling.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"employee_preferences\"],\"tableComment\":[\"员工偏好管理\"],\"className\":[\"EmployeePreferences\"],\"functionAuthor\":[\"scheduling\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"84\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"员工偏好ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"85\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"可选值:工作日偏好、工作时间偏好、班次时长偏好。可扩展\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"preferenceType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"preference_type\"],\"columns[2].columnId\":[\"86\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"员工\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"staff\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"87\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"偏好值\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"preferenceValue\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"88\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"89\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"c', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:09:15');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/employee_preferences', '127.0.0.1', '内网IP', '\"employee_preferences\"', NULL, 0, NULL, '2023-02-23 11:09:19');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 8, 'com.scheduling.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/employee_preferences', '127.0.0.1', '内网IP', '\"employee_preferences\"', NULL, 0, NULL, '2023-02-23 11:09:19');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.scheduling.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1098\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"员工偏好\"],\"url\":[\"/system/preferences\"],\"target\":[\"menuItem\"],\"perms\":[\"system:preferences:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 11:10:37');
INSERT INTO `sys_oper_log` VALUES (135, '员工偏好', 1, 'com.scheduling.project.system.preferences.controller.EmployeePreferencesController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/preferences/add', '127.0.0.1', '内网IP', '{\"preferenceType\":[\"1\"],\"staff\":[\"3969\"],\"preferenceValue\":[\"1,3,4\"],\"remark\":[\"1111\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-02-23 14:18:55');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-02-11 18:06:05', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-02-11 18:06:05', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2023-02-11 18:06:05', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '门店经理', 'bumenjingli', 3, '1', '0', '0', 'admin', '2023-02-14 01:34:31', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '副经理', 'fujingli', 4, '1', '0', '0', 'admin', '2023-02-14 01:35:04', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (5, '小组长', 'zuzhang', 5, '1', '0', '0', 'admin', '2023-02-14 01:35:38', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (6, '店员', 'dianyuan', 6, '1', '0', '0', 'admin', '2023-02-14 01:36:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '测试1', '00', 'ceshi@qq.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2023-02-23 14:14:02', '2023-02-11 18:06:05', 'admin', '2023-02-11 18:06:05', '', '2023-02-23 14:14:01', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ceshi', '测试2', '00', 'ceshi@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2023-02-11 18:06:05', '2023-02-11 18:06:05', 'admin', '2023-02-11 18:06:05', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('623b7f48-224f-4f30-9b41-4768ceabd250', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', 'on_line', '2023-02-23 14:13:11', '2023-02-23 14:25:08', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for typesetting_rules
-- ----------------------------
DROP TABLE IF EXISTS `typesetting_rules`;
CREATE TABLE `typesetting_rules`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '排版规则ID',
  `rules_type` int(2) NULL DEFAULT NULL COMMENT '可选值:开店规则、关店规则、客流规则。可扩展\n',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '门店',
  `rule_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则值',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `rule_status` int(2) NULL DEFAULT NULL COMMENT '排班规则（1.固定规则2.自定义规则）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '排版规则管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of typesetting_rules
-- ----------------------------
INSERT INTO `typesetting_rules` VALUES (1, 1, '2', '23', '', '2023-02-22 21:41:35', '', '2023-02-23 02:25:03', '', '0', 1);
INSERT INTO `typesetting_rules` VALUES (2, 4, '2', '', '', '2023-02-23 01:03:14', '', '2023-02-23 02:34:08', 'a.周—~周五:早9点～晚9点', '0', 1);
INSERT INTO `typesetting_rules` VALUES (3, 4, '2', '', '', '2023-02-23 01:04:24', '', '2023-02-23 02:34:11', 'b.周末:早10点~晚10点', '0', 1);
INSERT INTO `typesetting_rules` VALUES (4, 5, '2', '', '', '2023-02-23 01:04:53', '', '2023-02-23 02:34:14', 'a.员工每周最多工作40小时', '0', 1);
INSERT INTO `typesetting_rules` VALUES (5, 5, '2', '', '', '2023-02-23 01:05:21', '', '2023-02-23 02:34:19', 'b.员工每天最多工作8小时', '0', 1);
INSERT INTO `typesetting_rules` VALUES (6, 5, '2', '', '', '2023-02-23 01:05:54', '', '2023-02-23 02:34:16', 'c.单个班次最少2小时，最多4小时。员工可以连续排多个班次', '0', 1);
INSERT INTO `typesetting_rules` VALUES (7, 5, '2', '', '', '2023-02-23 01:06:46', '', '2023-02-23 02:34:27', 'd．员工最长连续工作时长:4小时。达到连续工作时长，必须安排休息时间', '0', 1);
INSERT INTO `typesetting_rules` VALUES (8, 5, '2', '', '', '2023-02-23 01:07:11', '', '2023-02-23 02:34:22', 'e.必须给工作时间完全覆盖午餐、晚餐时间的员工，安排午餐或晚餐时间', '0', 1);
INSERT INTO `typesetting_rules` VALUES (9, 6, '2', '', '', '2023-02-23 01:07:55', '', '2023-02-23 02:34:24', 'a.午餐时间:时间范围（如11点到14点，一小时)', '0', 1);
INSERT INTO `typesetting_rules` VALUES (10, 6, '2', '', '', '2023-02-23 01:08:17', '', '2023-02-23 02:34:29', 'b．晚餐时间:时间范围（如17点到20点，半小时)', '0', 1);
INSERT INTO `typesetting_rules` VALUES (11, 5, '2', '', '', '2023-02-23 01:09:18', '', '2023-02-23 02:39:54', 'c.休息时间:时间范围（不限。半小时)', '0', 1);
INSERT INTO `typesetting_rules` VALUES (12, 7, '2', '', '', '2023-02-23 02:43:24', '', '2023-02-23 02:49:21', 'a.每天开店之前需要半小时做准备工作（如做清洁 ）。0.5为缺省值，可\r\n调整\r\ni．公式:门店面积/50=人数。50为缺省值，可调整\r\nii. 用户可以设置允许执行此类工作的职位。可以设置为所有\r\n职位，也可以限制特定职位（比如导购人员、收银，店经理等）', '0', 2);
INSERT INTO `typesetting_rules` VALUES (13, 7, '2', '', '', '2023-02-23 02:46:36', '', '2023-02-23 02:49:33', 'b.每天至少安排三个不超过4小时的班次\r\ni．公式:预测客流/3.8=店员需求数。3.8为缺省值，可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，\r\n也可以限制特定职位（比如导购人员、收银，店经理等）', '0', 2);
INSERT INTO `typesetting_rules` VALUES (14, 7, '2', '', '', '2023-02-23 02:46:53', '', '2023-02-23 02:49:40', 'c.如果没有客流量的时候，至少需要1个店员值班.1为缺省值，可调整', '0', 2);
INSERT INTO `typesetting_rules` VALUES (15, 7, '2', '', '', '2023-02-23 02:47:23', '', '2023-02-23 02:49:45', 'd.每天关店之后需要2小时做收尾工作（如盘点、清算、清洁）。2为缺\r\n省值。可调整\r\ni.公式:门店面积/30+ 2 =人数。30和2为缺省值。可调整ii.用户可以设置允许执行此类工作的职位。可以设置为所有职位，也可以限制特定职位（比如导购人员、收银，店经理等）', '0', 2);

SET FOREIGN_KEY_CHECKS = 1;
