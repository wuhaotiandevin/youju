/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : pw

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-05-27 15:07:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
INSERT INTO `cmf_admin_menu` VALUES ('1', '0', '0', '0', '20', 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理');
INSERT INTO `cmf_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `cmf_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `cmf_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `cmf_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `cmf_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES ('15', '6', '1', '0', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cmf_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `cmf_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `cmf_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `cmf_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES ('29', '6', '1', '0', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cmf_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cmf_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cmf_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cmf_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES ('44', '6', '1', '0', '10000', 'admin', 'Plugin', 'setting', 'id=20', '登录支付设置', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES ('61', '6', '1', '0', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cmf_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cmf_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cmf_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cmf_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cmf_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cmf_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cmf_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cmf_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cmf_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('75', '6', '1', '0', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES ('76', '75', '2', '1', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '轮播图管理', '', '轮播图管理');
INSERT INTO `cmf_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES ('95', '6', '1', '0', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cmf_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cmf_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cmf_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cmf_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cmf_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cmf_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cmf_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cmf_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cmf_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cmf_admin_menu` VALUES ('109', '0', '0', '0', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('120', '0', '0', '0', '30', 'portal', 'AdminIndex', 'default', '', '内容管理', 'th', '门户管理');
INSERT INTO `cmf_admin_menu` VALUES ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cmf_admin_menu` VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cmf_admin_menu` VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cmf_admin_menu` VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cmf_admin_menu` VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cmf_admin_menu` VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cmf_admin_menu` VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cmf_admin_menu` VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cmf_admin_menu` VALUES ('131', '120', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cmf_admin_menu` VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cmf_admin_menu` VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cmf_admin_menu` VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('139', '120', '1', '0', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES ('140', '139', '1', '1', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('142', '139', '1', '1', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES ('145', '120', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cmf_admin_menu` VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('152', '182', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES ('156', '182', '1', '0', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cmf_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `cmf_admin_menu` VALUES ('158', '6', '1', '0', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `cmf_admin_menu` VALUES ('159', '158', '1', '1', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `cmf_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('162', '6', '1', '0', '10000', 'Admin', 'region', 'index', '', '区域管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('163', '6', '1', '1', '80', 'admin', 'category', 'index', '', '品类管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('164', '6', '1', '0', '90', 'admin', 'liuyan', 'index', '', '意见建议', 'comment', '');
INSERT INTO `cmf_admin_menu` VALUES ('165', '0', '1', '0', '10000', 'admin', 'order', 'index', '', '订单管理', 'shopping-cart', '');
INSERT INTO `cmf_admin_menu` VALUES ('166', '0', '1', '0', '10000', 'admin', 'money', 'index', '', '资金记录', 'money', '');
INSERT INTO `cmf_admin_menu` VALUES ('167', '0', '1', '0', '10000', 'admin', 'tixian', 'index', '', '提现管理', 'sign-out', '');
INSERT INTO `cmf_admin_menu` VALUES ('169', '0', '1', '0', '10000', 'admin', 'shensu', 'index', '', '撤单管理', 'reply', '');
INSERT INTO `cmf_admin_menu` VALUES ('171', '6', '1', '0', '100', 'admin', 'gift', 'index', '', '礼物管理', 'gift', '');
INSERT INTO `cmf_admin_menu` VALUES ('172', '171', '1', '0', '10000', 'admin', 'Gift', 'add', '', '添加礼物', '', '添加礼物');
INSERT INTO `cmf_admin_menu` VALUES ('173', '171', '2', '0', '10000', 'admin', 'Gift', 'addPost', '', '添加礼物提交保存', '', '添加礼物提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('174', '171', '1', '0', '10000', 'admin', 'Gift', 'edit', '', '编辑礼物', '', '编辑礼物');
INSERT INTO `cmf_admin_menu` VALUES ('175', '171', '2', '0', '10000', 'admin', 'Gift', 'editPost', '', '编辑礼物提交保存', '', '编辑礼物提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('176', '171', '2', '0', '10000', 'admin', 'Gift', 'delete', '', '删除礼物', '', '删除礼物');
INSERT INTO `cmf_admin_menu` VALUES ('177', '171', '2', '0', '10000', 'admin', 'Gift', 'listOrder', '', '礼物排序', '', '礼物排序');
INSERT INTO `cmf_admin_menu` VALUES ('178', '171', '2', '0', '10000', 'admin', 'Gift', 'toggle', '', '礼物显示隐藏', '', '礼物显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('180', '6', '1', '0', '50', 'admin', 'Message', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES ('181', '6', '1', '0', '50', 'admin', 'Tousu', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES ('182', '109', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES ('183', '152', '2', '0', '10000', 'user', 'AdminIndex', 'jinyong', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES ('184', '6', '1', '0', '10000', 'admin', 'setting', 'koudian', '', '平台费用管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('185', '6', '1', '0', '10000', 'admin', 'level', 'index', '', '陪玩师接单等级管理', 'level', '');
INSERT INTO `cmf_admin_menu` VALUES ('186', '0', '1', '0', '10000', 'admin', 'jineng', 'index', '', '技能管理', 'bars', '');
INSERT INTO `cmf_admin_menu` VALUES ('187', '6', '1', '0', '60', 'admin', 'guild', 'index', '', '公会管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('188', '6', '1', '0', '70', 'admin', 'haoma', 'index', '', '靓号管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('189', '182', '1', '1', '10000', 'user', 'admin_index', 'avatar_shenhe', '', '头像待审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('190', '182', '1', '1', '10000', 'user', 'admin_index', 'renzheng_shenhe', '', '身份认证待审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('191', '0', '1', '0', '10000', 'admin', 'chat', 'index', '', '聊天室管理', 'home', '');

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------
INSERT INTO `cmf_asset` VALUES ('5', '1', '24252', '1508311876', '1', '0', '1cfd15490f95524d3cea60e3e4a3f51bfbabd72514daf5bd6bbdd7ce9e5428a8', '1.jpg', 'portal/20171018/4c4cfa96eed507caf56033420ccc601c.jpg', '1cfd15490f95524d3cea60e3e4a3f51b', 'dd2910d7948d2191ff31f0843278e2def9eff8c3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('6', '1', '156589', '1508808644', '1', '0', '07c87d6d0873dbe71eb25d696ebca81695a781da5614268afcad93308fbfb594', '6106a4f0gy1fkk1i2k5hsj20y81204qq.jpg', 'portal/20171024/80e8c86692bd221236815ca4c3ab8366.jpg', '07c87d6d0873dbe71eb25d696ebca816', '9fe95204b85526f9306d96952f8af1fffd889509', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('7', '1', '824252', '1508808918', '1', '0', '963915bdd4e518d64650be766c8ec038ff3f10451ece5b048158e1dbf2f9a176', '3D.jpg', 'default/20171024/65613df0813ab1cfea065d7a61145342.jpg', '963915bdd4e518d64650be766c8ec038', '00642d5936c89c7ab0905a109e1e50eb838c2e6c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('8', '12', '15736', '1510281377', '1', '0', '53bfe3d0e0aad34ef23fe22f6253d3c29d1757b05be25b7ec86cc3cfca183a48', '安全继电器工作原理及作用介绍.docx', 'portal/20171110/7bf75808678a317eb7c2c38155bd77b0.docx', '53bfe3d0e0aad34ef23fe22f6253d3c2', 'a3bbe0f4c00f6abfa301d2f50a6fbcbfbea3cee0', 'docx', null);
INSERT INTO `cmf_asset` VALUES ('9', '12', '222069', '1510716295', '1', '0', '333fcd7ed03229a805b8f66d4f8d92b692309698979267f69cf6a08d331748d2', '图片2.png', 'portal/20171115/d0033f025c4272c37b45df533553e8fe.png', '333fcd7ed03229a805b8f66d4f8d92b6', '7ebb1360f86a9216c4415d6785211fd121a000f3', 'png', null);
INSERT INTO `cmf_asset` VALUES ('10', '12', '582240', '1510716295', '1', '0', '7bee201bc49551ba60065527aee6b4d239e3e9d38c19439c77d6e4f8df397119', '图片3.png', 'portal/20171115/76f8ac1774977c6134281bbbd732731d.png', '7bee201bc49551ba60065527aee6b4d2', '58e40dae299c5e312e3cb4f2be453b3285ecc929', 'png', null);
INSERT INTO `cmf_asset` VALUES ('11', '12', '310970', '1510716350', '1', '0', '44f30c35f4a1ae92c2a244d5c3b6cb08ee686e0837a2a880df9f56cd79d3debe', '图片1.png', 'portal/20171115/ef43bcfe3c8d671704136ccaed2bcbb1.png', '44f30c35f4a1ae92c2a244d5c3b6cb08', '2ee255c1935fccf069dfdaec1466fd8eb2079de3', 'png', null);
INSERT INTO `cmf_asset` VALUES ('12', '12', '2154', '1510716575', '1', '0', '50b72e290218582cd9ddc61f282f67e13fb34ab1342751f639091652ebc52b8d', 'D37BOIS150CB0010NOS.jpg', '20171115/f7f7d6ad60635f1b7923b90b21601cb5.jpg', '50b72e290218582cd9ddc61f282f67e1', 'ffe1e00a2b39fcc6e53da98987ad19fd51b30c91', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('13', '12', '2791', '1510716666', '1', '0', '9705109a0d837016768aedbe547c4a85e2166387938e93040b88e5b5ad1721f8', 'D37BOIRS50CB0010NOS.jpg', '20171115/3634d49f7ffe12eefb6d8763bf6fab32.jpg', '9705109a0d837016768aedbe547c4a85', '8bc864c666f9ea1421f96ce4000ec7d027378237', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('14', '12', '2574', '1510716673', '1', '0', '9d53b51226349557551014b0b564f675b15ad6b7d89c23535b7f0dba505c865b', 'D37BOIRU50CB0010NOS.jpg', '20171115/6bfa59cbbed67b328397648f05f3059f.jpg', '9d53b51226349557551014b0b564f675', '9e66579c7147f85872a5d022630b917a0b5e4470', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('15', '12', '2263', '1510716687', '1', '0', 'b2bc2d66ad7c79834f9f679d3181e5f2badd7e4406a03c03273b24672cf3f6af', 'D37BOIRV50CB0010NOS.jpg', '20171115/c002157b9ebbb6091bdfba2a8e865e02.jpg', 'b2bc2d66ad7c79834f9f679d3181e5f2', 'bed201162d653d769cd9d057fe6fae0581a59876', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('16', '12', '84471', '1510717028', '1', '0', 'ed934d928b3e8a4327c1459c553664ecc00ec09d135633a62e24c676b215bf17', '图片4.png', '20171115/a11314c1d1c3cf83dacad23b4ee29795.png', 'ed934d928b3e8a4327c1459c553664ec', 'e584d2e135e4139f30ce439c08dd58bbe6e18c0b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('17', '12', '17592', '1510717045', '1', '0', 'aa1958076cf854669eb4d40a3942d6610992c8ccc639820803fafd83e3cc00cf', '图片5.png', '20171115/259f621ccfc827dd7daa5cfe12048d3b.png', 'aa1958076cf854669eb4d40a3942d661', '04f39ff054559f869c65cefdae7717eb6446dca1', 'png', null);
INSERT INTO `cmf_asset` VALUES ('18', '12', '96938', '1510717059', '1', '0', '01b7b9adfff74c2468d138ee5353727fc86eac561410af588ac6de5f590f320d', '图片6.png', '20171115/22e1254a317274ebcb12ff30e6f8f574.png', '01b7b9adfff74c2468d138ee5353727f', 'b9587949ac06935b661815452977680d64a0ffa4', 'png', null);
INSERT INTO `cmf_asset` VALUES ('19', '12', '256086', '1510717069', '1', '0', '44cca7399f50a60b0e2dbb6eda9aaebdb4d89280e97e33bf89dbf624660ef1b6', '图片7.png', '20171115/411b2dbd2ba877344fea19bd7765be37.png', '44cca7399f50a60b0e2dbb6eda9aaebd', 'a243201a28c6e62ac65c94b65b4c847d814043db', 'png', null);
INSERT INTO `cmf_asset` VALUES ('20', '12', '203962', '1510717081', '1', '0', 'cef67fd2405a57e37b38e816146fcbe7ac46fdaa34aba6a2cdf7bdba4cc8b824', '图片8.png', '20171115/554d810f61c3446d52ba350930d8534d.png', 'cef67fd2405a57e37b38e816146fcbe7', 'd6acb6f7bee17979d02b41296628eac449b9af33', 'png', null);
INSERT INTO `cmf_asset` VALUES ('21', '12', '169183', '1510717152', '1', '0', '1e9ff666f70883553873b0159ce1f928dfcf238bbdd51a4fb28b4e4d1fa065e3', '图片9.png', '20171115/a18d70b1f8a0d9481bf47f261992f6d8.png', '1e9ff666f70883553873b0159ce1f928', '14cdf50bf20337c71165ad34336dbf473e9ae60c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('22', '12', '456082', '1510717628', '1', '0', '93396cb467a8e1681aedd7e3c8fd77c7985865c069001d81ea9571b510b7537d', '图片10.png', '20171115/b1cf00956bb58d0a4bf19bf11138f6ab.png', '93396cb467a8e1681aedd7e3c8fd77c7', '41e59c6650e30712cf3c11b16af66761f5645dbe', 'png', null);
INSERT INTO `cmf_asset` VALUES ('23', '12', '396184', '1510717639', '1', '0', 'edf9c87b089a0f3aab7fc69cb970b942c34babd41d4a01c686bf2367620de89e', '图片11.png', '20171115/f7db9bdd39d81059fd219e7909ff104f.png', 'edf9c87b089a0f3aab7fc69cb970b942', 'd239ab890ad1ee15298548d4cfe890c229718835', 'png', null);
INSERT INTO `cmf_asset` VALUES ('24', '12', '197545', '1510717678', '1', '0', 'd2829b6cfea9d0397ad2e380241736eaef5a526b7a940c9daaa0b982b7c7cbe4', '图片12.png', '20171115/49a888f2a09cabb5d6af2479522ed9c8.png', 'd2829b6cfea9d0397ad2e380241736ea', '25fc42047ca092e380c09b686b02195941268356', 'png', null);
INSERT INTO `cmf_asset` VALUES ('25', '12', '355487', '1510717723', '1', '0', '8671d561a71262c06f7c5e3871408d4ba6638e4e1ee2730d7c6d52625b481c8c', '图片13.png', '20171115/5f006820046e6eb8a875ee99dbeaf5a6.png', '8671d561a71262c06f7c5e3871408d4b', '85ece8122ca168e33638348738b6d369acfc84e0', 'png', null);
INSERT INTO `cmf_asset` VALUES ('26', '12', '243075', '1510717734', '1', '0', '0747ea334411fc143113b46c6f7883937b2a8e9e17cc77ef7e9c9ed9c87d613b', '图片14.png', '20171115/bc82ffe2964708ece75eef1eb5935b31.png', '0747ea334411fc143113b46c6f788393', 'a8aa6f1b572731c875c10bf287acfc82d01b1e44', 'png', null);
INSERT INTO `cmf_asset` VALUES ('27', '12', '423969', '1510717800', '1', '0', '37da34c34752a5a84f65503c31ab65c9f8d66d271baa3914ae3cd768bfc85e0f', '图片15.png', '20171115/7a3dc2895771876e499501cadeea2813.png', '37da34c34752a5a84f65503c31ab65c9', '1707a1df368f8bc3e2e188de7db9e3d24241877d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('28', '12', '234529', '1510717809', '1', '0', 'bb6a20d175f3d84a4f3af382403dd503d4765f1bde21a9ac88922facdd9fb1b2', '图片16.png', '20171115/9972c3b8da62c529bf14e89598f64a9d.png', 'bb6a20d175f3d84a4f3af382403dd503', 'c22abf834f90a5d495261dc56894bcdc9bdcb8b7', 'png', null);
INSERT INTO `cmf_asset` VALUES ('29', '12', '430998', '1510717813', '1', '0', '945d14d263d1483dd00206609e2a36aaf9d821f3c4d9adc95c7cb7c934b24c69', '图片17.png', '20171115/4f0c94095104d943fa57bb8e6ef1bada.png', '945d14d263d1483dd00206609e2a36aa', '609e2d4251377ce4c14594d43943a65a82fb6d04', 'png', null);
INSERT INTO `cmf_asset` VALUES ('30', '12', '228902', '1510717820', '1', '0', '57988ceef883760e2c0fb6ce09f55df9b1aeda55080f91f8f6f4a524e20df45e', '图片18.png', '20171115/83f5faada86a034e19323665f19b7ad3.png', '57988ceef883760e2c0fb6ce09f55df9', 'd4b2cfec353f6d3ddaa2b90953c273236919937c', 'png', null);
INSERT INTO `cmf_asset` VALUES ('31', '12', '485786', '1510717825', '1', '0', '3a60243f9cba8bdfec46608cc13953708331aac11b8c84bd3032afa4cf237d70', '图片19.png', '20171115/3b2573454fc65154ce789c9211086d15.png', '3a60243f9cba8bdfec46608cc1395370', '0cb849acfbc19a669918a1ea073a2c1f0472be7e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('32', '12', '208067', '1510717838', '1', '0', '12a77efa8af20cc644ca08bfc5f854381d3594118d5102ede61e2fb028686d87', '图片20.png', '20171115/56ade672fdfa213ad13c1129c0168494.png', '12a77efa8af20cc644ca08bfc5f85438', 'abfe1dd1e0386fe0c39452649d25ed260543f886', 'png', null);
INSERT INTO `cmf_asset` VALUES ('33', '12', '401226', '1510717842', '1', '0', '13486046efe5f0af13510f2d831460ccae7791b7b097fcfab1fc2d75a5cfc4fb', '图片21.png', '20171115/f95b51cf5d3a4fabcd369cadefc0d264.png', '13486046efe5f0af13510f2d831460cc', '099810ce8a9f04e005ab4de199634b96f72f49f6', 'png', null);
INSERT INTO `cmf_asset` VALUES ('34', '12', '198520', '1510717847', '1', '0', 'c86d54fce919fa7b54169871d02d23c2f2189ba6aee3fb6dcfcb0fcdc9075b6f', '图片22.png', '20171115/2a970e1f548e8b9ab760576ccee9c2ca.png', 'c86d54fce919fa7b54169871d02d23c2', '8a9aea628a958a1f44403caff9def634275d8288', 'png', null);
INSERT INTO `cmf_asset` VALUES ('35', '12', '434262', '1510717853', '1', '0', 'e72dc668520ecb131ec22b596d21f4c9db3b9d0b69776d74680d2f15ab768df9', '图片23.png', '20171115/7a768a1fa25c784801db6ed241caf903.png', 'e72dc668520ecb131ec22b596d21f4c9', '724363e3dde7e8e149bc313991ff9d8c5335f392', 'png', null);
INSERT INTO `cmf_asset` VALUES ('36', '12', '255184', '1510717873', '1', '0', '141229cd075ae90e945c17b9db563eedc64d12b8fa86756c56cc1a9d072a21b4', '图片24.png', '20171115/f4ce4314db59ea335ad02b314c221a80.png', '141229cd075ae90e945c17b9db563eed', '6a4fc6a6407fd20b3d4f4b94697f2879f5008713', 'png', null);
INSERT INTO `cmf_asset` VALUES ('37', '12', '443192', '1510717896', '1', '0', 'ce7457c6eb7f0812a5aa9d6506fb08646d11dece8709ee27b453311639935d63', '图片25.png', '20171115/859fc661c508069b369de3d6831f2cdc.png', 'ce7457c6eb7f0812a5aa9d6506fb0864', 'a6ed133af4ac15c3d53a352f2df3d792b6c23197', 'png', null);
INSERT INTO `cmf_asset` VALUES ('38', '12', '202867', '1510717933', '1', '0', '11ba07bd9cbdf0c2e9ed2f9db2b8d4de1deb9be28aad698fcb541be526acc804', '图片26.png', '20171115/e9e4a4e953e7a69da2742533bfd1f122.png', '11ba07bd9cbdf0c2e9ed2f9db2b8d4de', '2915b23c753caf920359466118b791798a67018f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('39', '12', '164678', '1510717945', '1', '0', '0ed98801f826638d4bfabde92df3497a81c1dda82a67a296225d91f42b0c2097', '图片27.png', '20171115/8b478e3f24c2783b354ce42123d555fe.png', '0ed98801f826638d4bfabde92df3497a', 'f48febbb0b700e94e47d73cf09fc9c04bc70f946', 'png', null);
INSERT INTO `cmf_asset` VALUES ('40', '12', '245978', '1510717955', '1', '0', '8d467258edc722505b1a64a1eac00167ac7b1de0aa5e87fe3d7677f657517f20', '图片28.png', '20171115/d13e401f2a8a98c9da5442049ac94ff4.png', '8d467258edc722505b1a64a1eac00167', 'e12fa8f94732dfeeb616d09b246715c5126ddc6b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('41', '12', '276502', '1510717961', '1', '0', '1d3ae23814155a7149dc47e08b97e64c55cc63de7c8088f07fd10801788b6f53', '图片29.png', '20171115/09690d07ca3c8ff5a7bc48cd5e4ac706.png', '1d3ae23814155a7149dc47e08b97e64c', '5c3a750fdc6f45ff8197e7b082008240454a0481', 'png', null);
INSERT INTO `cmf_asset` VALUES ('42', '12', '195091', '1510717969', '1', '0', '2318c6b343e9fdfc26d70372325b9aca4bc313bd10d51123c054c6f13cd6b8fd', '图片30.png', '20171115/5be9760ad7c04afbbf881557907af4b4.png', '2318c6b343e9fdfc26d70372325b9aca', 'd046b45e405d955a78e9064efd8788c83da86b1e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('43', '12', '393237', '1510717975', '1', '0', 'f7847a50f1d3974cc6b14ba33a0762f9e06bb608b69bde9717c352aa68b7a8ee', '图片31.png', '20171115/dfe534c30cdca63c44c04bc2d48a5b74.png', 'f7847a50f1d3974cc6b14ba33a0762f9', '803434a566d9226e02e270990fabc9632aa4e69a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('44', '12', '61990', '1510718011', '1', '0', '425499e45679c09b59bae907131c4c9b09cbb4e9f3f3a9d0f0b74d33440514a1', '图片32.png', '20171115/984f20981a4a3ba60c00c70184a078a4.png', '425499e45679c09b59bae907131c4c9b', 'd8af457f778f8d4e148ffcb1ffef54d753b5ca70', 'png', null);
INSERT INTO `cmf_asset` VALUES ('45', '12', '158041', '1510721539', '1', '0', '07bf6565f8dfd384125a7b49426847c85cbcf7aeef0a69214d98e8a81bb55363', '图片33.png', '20171115/508f6ed19510b59be58bbd265bc8ead9.png', '07bf6565f8dfd384125a7b49426847c8', '41e488edc00d4ef05caf28cf2523a057ed54991b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('46', '12', '86103', '1510721548', '1', '0', 'd1f0e329f8e93d5ac31e16b307c2035b79b2c9074cc7f34bc9989500d0f059ee', '图片34.png', '20171115/5bd3c7fd6e6a4157d5de0708c32891ba.png', 'd1f0e329f8e93d5ac31e16b307c2035b', '16c9eb982ab9e659d0a49ff9314725b062a7ee74', 'png', null);
INSERT INTO `cmf_asset` VALUES ('47', '12', '282653', '1510721904', '1', '0', 'fc4698ed7bdf8eabf19defd13099a78cb2805e482b14414b652e94c56c13809e', '图片1.png', '20171115/e492de535865cc3f64fd8e31ecea7bdd.png', 'fc4698ed7bdf8eabf19defd13099a78c', 'e069d1fbba4eace063081a0c8827d78ef4bcb7fc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('48', '12', '155943', '1510721919', '1', '0', 'd65eca4b21f9b874d75fce8386d6710d5da66a213266f487c0c2a0eb058ce7f4', '图片2.png', '20171115/2a8cae2bfcdc9a15cae594b1e429fb5b.png', 'd65eca4b21f9b874d75fce8386d6710d', 'd679d42d7538afdb594441f0a45fe0b209a5b96f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('49', '12', '151236', '1510721951', '1', '0', '5e0decb4b3565aee870d50cf7f343420ee631546434338aed554e1b88eceaae2', '图片3.png', '20171115/c93cd8627bd6959cdd95d7cf605a243e.png', '5e0decb4b3565aee870d50cf7f343420', '5b204a49cde46179de5f367ededf7e026ad1005b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('50', '12', '161473', '1510721967', '1', '0', 'd9be3c2dad50b037d362c27a8904c507e1ffbcd49b4f69ab45043daa85bc9df3', '图片4.26png.png', '20171115/8a0e5ee3878757f9ddfcf2ca30d9704e.png', 'd9be3c2dad50b037d362c27a8904c507', 'a9f2c1d82c3534d06391d475acbfbadb89987bfd', 'png', null);
INSERT INTO `cmf_asset` VALUES ('51', '12', '184662', '1510721980', '1', '0', 'b6100dcb813400cc016583fa9ca06e71d9d5fe58b8a290fd111f4855ac41a80b', '1531.png', '20171115/413e355d8a525d0bf46fb14f28626767.png', 'b6100dcb813400cc016583fa9ca06e71', 'cd228a45662aa781e474a73fde4bed41e12ec436', 'png', null);
INSERT INTO `cmf_asset` VALUES ('52', '12', '277229', '1510721999', '1', '0', 'a33df2bc8dd723e4d680819a9e3ac41428e76c049fc6d2aef0a1e85b7c6fb466', '图片465.png', '20171115/8ea56fb37b8bc271fb0ba636172830a4.png', 'a33df2bc8dd723e4d680819a9e3ac414', '1f6646d17e8ebb95d75198017149358c747b82bc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('53', '12', '113458', '1511160018', '1', '0', 'b04662729ef3ed501e6c47b5497991517427b3ca6cd6e9d79c5e471408ea9a02', '图片1.png', '20171120/0181cc587dc423341fd89a560a200018.png', 'b04662729ef3ed501e6c47b549799151', '1232db2b829441825cd56cf65dd6b76753c1439f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('54', '12', '88145', '1511160033', '1', '0', '329e36ffdd48c75780525973afa27b0b44bd0e41f5528dbc46057b0bd414c4ff', '图片2.png', '20171120/5e0aa0405b43d5a8c288b477e6e0d1a5.png', '329e36ffdd48c75780525973afa27b0b', '2ea59c2a9054cc9a9600fb405502d7d66a227984', 'png', null);
INSERT INTO `cmf_asset` VALUES ('55', '12', '154667', '1511486821', '1', '0', 'fa2a9c8a5daa9c3777dcd3ad6d7461db38af845a3dcb28e0f3e78f5e2fd21c59', '图片33.png', '20171124/ad624d23512b3b0f2e7913694faa417e.png', 'fa2a9c8a5daa9c3777dcd3ad6d7461db', '154cfe09c19d4c7555e73cd6ee2c0a3f12e68d8f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('56', '1', '56866', '1512626997', '1', '0', '8637d36ac8f505ca83f0b4f5f4b3e24f0f5ebe0325ab3ef3199d44087ec40491', 'icon.png', 'admin/20171207/98f8b07831b88ab02fced23a74bd3b8d.png', '8637d36ac8f505ca83f0b4f5f4b3e24f', 'cce73a8c417cf5c8ab31de0e8d9cfdc0c95e0262', 'png', null);
INSERT INTO `cmf_asset` VALUES ('57', '0', '87134', '1512630540', '1', '0', '6d0fda30fdd8b3d40f69c1de94eb17c50e56791b56aa9a4a5425f1290121363e', 'tmp_a83c82b869e8d6afba7309d036ae9080a35beb8ddb7be5b8.jpg', '20171207/63fede3d6aa4556566176d702b5b049c.jpg', '6d0fda30fdd8b3d40f69c1de94eb17c5', 'edb86a8926fc397925126c40afe1c7f15bb5c1ce', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('58', '0', '82875', '1512630566', '1', '0', 'fd7b0a3c210e6861376aecaf99b39265d11f3a91785f3642f87ffceaba51af41', 'tmp_ccc71572889ea36e276cac69005d70a47e49d8acc6fc3dd3.jpg', '20171207/0de88a0d94a67fe28b2fd1d09bb28c82.jpg', 'fd7b0a3c210e6861376aecaf99b39265', '5c644e1e50d6af6a045eebf5bff7790aa44b6eea', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('59', '0', '53210', '1512630586', '1', '0', '0acbb7de66fb2f17767b51f5e5bc11fa9b37890e56699079bb172bced6afe76f', 'tmp_ffc088c67b60c09f7fddc864c8f920d431bc4ca0e63b9de6.jpg', '20171207/975a9a651f09233e7b27b9ff370b448e.jpg', '0acbb7de66fb2f17767b51f5e5bc11fa', '4380e0c39776147809e831afb226ef4ac7cd9c95', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('60', '0', '53332', '1512630696', '1', '0', 'e332c3e3994ef763f409d44e74f16c8009cd2f6edf47d6d6cd2712ba0dadef82', 'tmp_d2a396e2f345038d203d5dfeb139cf67633c6bdb23a8a338.jpg', '20171207/6cb635f1556a5195474dd7a3289a2c17.jpg', 'e332c3e3994ef763f409d44e74f16c80', '1d1c737c32feebb5c4767dacb751bd17badd1414', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('61', '0', '75614', '1512634005', '1', '0', 'c96902208e1aa1afdc334b7b195678371155799bd309a95c85a86a6174fc22b0', 'tmp_0fb7306ddccab1358bc3a2151755116603a1044401ecf476.jpg', '20171207/2a8e3149dc974b67550e936cef3ea748.jpg', 'c96902208e1aa1afdc334b7b19567837', '7df79657a6d97e7fd0d5145f35fbe6de15e1091f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('62', '0', '45446', '1512634080', '1', '0', '3317da7477a7a5ae9a60ebf6ab425fc372e1393caf6c96b8eb7f1249eb66551e', 'tmp_5a5f198c24080c4cbce4e759d2fb312c97fb5626e5273d74.jpg', '20171207/c503bb2c71b7d51effb9995ffa3d6361.jpg', '3317da7477a7a5ae9a60ebf6ab425fc3', '8cf68d0a07f69128384c93988b4ecf5a6ea607f6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('63', '0', '110121', '1515056694', '1', '0', '4c266055d2f22abe75e2e5f0cf23e066ddcf8fb158b3c48e536ac324696b3232', 'tmp_bad84ed3a9e74be1a3c5dee2c35a4d9d75307717659ea38a.jpg', '20180104/8e1061829c6191bc27ce5c745686ede7.jpg', '4c266055d2f22abe75e2e5f0cf23e066', '66188cb0f2064c42caaba962f27ebaa8490c6690', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('64', '0', '76585', '1515056709', '1', '0', '5a73accee241fbadfe30fb381c2e8df49b2aedf576b0ef24ebd78df99315db4e', 'tmp_625a5df4b2890b24decd94d918ec22d097334378f30555e9.jpg', '20180104/0926da7da37501dfd0f2731c8b87ae55.jpg', '5a73accee241fbadfe30fb381c2e8df4', '1e6ea72e86ddbbc480c24ce50471a141407b45a2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('65', '0', '4333', '1515056774', '1', '0', '3cec1fbd360e88db45997dcdfaf97bb8be0b14dbc7d637034e69d81cacb1c699', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.3cec1fbd360e88db45997dcdfaf97bb8.png', '20180104/a160342efe4e7065ef6e13fbb88a73a4.png', '3cec1fbd360e88db45997dcdfaf97bb8', '06422e7373a1acf4ec743f99064a57de267b28f6', 'png', null);
INSERT INTO `cmf_asset` VALUES ('66', '0', '59240', '1515056870', '1', '0', 'fca2e360a6d4e8c63fbc19982cf72fa2f8277e7533fdd84cce3d4e32aa1b1c46', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.fca2e360a6d4e8c63fbc19982cf72fa2.png', '20180104/7315b94aa0915d3e47569c164cf295e4.png', 'fca2e360a6d4e8c63fbc19982cf72fa2', '9c96cc3df09d6a411bb1c9bd317e14fcfadf5560', 'png', null);
INSERT INTO `cmf_asset` VALUES ('67', '0', '3611', '1515057205', '1', '0', '5e371a7142539bd791d8291859f7c34abeea1c260e7dda2c79bc0ef9d5c14d27', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.5e371a7142539bd791d8291859f7c34a.png', '20180104/2f84a06c49ccd6b286b36062e5810244.png', '5e371a7142539bd791d8291859f7c34a', '24b3299967993df9a32b1a9f85134b6d2809dd45', 'png', null);
INSERT INTO `cmf_asset` VALUES ('68', '0', '50316', '1515057234', '1', '0', '8fa9a5fe20f5c4beccfcb954790a446e2bcd172ca5999d6d01a78de7f427636a', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.8fa9a5fe20f5c4beccfcb954790a446e.png', '20180104/9759469bef9236af5d2f0ffad7faeeb9.png', '8fa9a5fe20f5c4beccfcb954790a446e', '0ce4a9ae75ddd7a3a874bd5568d594bd77b137d0', 'png', null);
INSERT INTO `cmf_asset` VALUES ('69', '0', '110315', '1515130739', '1', '0', 'f228f33fec50f90e474af85d4b0473523166d9f731b958b19261d88232647591', 'tmp_f31e83ca4a14084c6369c19c3ca2c399fd68067d7e81e54e.jpg', '20180105/5fbd9cf2adf331370db9bd249d824ae9.jpg', 'f228f33fec50f90e474af85d4b047352', '78eaa1b2385957e8fb6ef8e81d8520512f74a97a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('70', '0', '53364', '1515130749', '1', '0', 'c58e3e11f0cd477b37937892948b091b9059a1f0860ad70bd04b9d4b5c31f8f2', 'tmp_c485e92125fb5382897291362d17aa8d11b87d0a6aea035b.jpg', '20180105/d9f6df352f31168133e11d988e222982.jpg', 'c58e3e11f0cd477b37937892948b091b', 'c17e8435b85307fdbd991c685cbf7c86d3010b78', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('71', '0', '253525', '1515140465', '1', '0', 'ac0652742095c5b2889896e2a0b3f9bf53f3995081e9ef76e6bdc2fdcff2dfbf', 'wx3f9556a60746a470.o6zAJs5ElT-XyzlcScoYBgwxZ1rY.ac0652742095c5b2889896e2a0b3f9bf.png', '20180105/ed855f65d07c0d061a6b2d19d1fbb082.png', 'ac0652742095c5b2889896e2a0b3f9bf', '56c135f8e1584d2ba0c0955131f826f86cc878df', 'png', null);
INSERT INTO `cmf_asset` VALUES ('72', '0', '569150', '1515216297', '1', '0', '3e9c347f37140d2428a4cfc2b361e440e6e219e8001f279c617893e27e3f08ac', 'wx3f9556a60746a470.o6zAJs5ElT-XyzlcScoYBgwxZ1rY.3e9c347f37140d2428a4cfc2b361e440.png', '20180106/3ff8c1a7400d1adb337c45d7f8587853.png', '3e9c347f37140d2428a4cfc2b361e440', '0d71fc1962ce6d307a3e761effe7f2dce6651511', 'png', null);
INSERT INTO `cmf_asset` VALUES ('73', '0', '44867', '1515224891', '1', '0', 'd5a9069e83d03f78d86c0ec879077a7580607bdced7c2be6f294f1092e379259', 'tmp_3bd63bb593080b8ddd15781fd2234e26509d1b0ec101117d.jpg', '20180106/21c5c70d9e967f4cfa1235e645fcc2a1.jpg', 'd5a9069e83d03f78d86c0ec879077a75', '09e7c05ee6314810613d7530162b25cda708721f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('74', '0', '67325', '1515390720', '1', '0', 'd5180e7bae378ef446818e4fc8431326c0ebca5b5634a0e42fd16750d08e29a3', 'tmp_46160839878e4bb451b7b317d029da04d10e4f9520804958.jpg', '20180108/3687d718024f345a72651388258453a1.jpg', 'd5180e7bae378ef446818e4fc8431326', '5efdfcf91b7ddae233e35cb6fd69bd9dfeb0baa7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('75', '0', '114009', '1515390746', '1', '0', '78e24ca9edc04b0b2b8715a31ac496c4ec81ad39d4aa7a88627d4ecab5edb98f', 'tmp_e760a258d77bafbf8aabd40f1b800fd8c9d889b18f4022b5.jpg', '20180108/9a9072ef10c0e5bf275cb67e88c563a2.jpg', '78e24ca9edc04b0b2b8715a31ac496c4', '0adc470b093a76dd3989619f11892b74b9a6f959', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('76', '0', '129080', '1515390759', '1', '0', '505d0f0c197fd725fd5400a3d35554bae3f80e53621d9a4bbcba54438b43420a', 'tmp_f81d5d0f4db8d3e75fd2d5305e731d918f585a3fd7fd7a02.jpg', '20180108/dfcb400af68c7214219a9f8845f8dfe2.jpg', '505d0f0c197fd725fd5400a3d35554ba', 'c16ae13cf4580aa4b47615b2d5f6f8b236a62ae7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('77', '0', '305963', '1515393316', '1', '0', '9f7cb90f8e774576cbb10aa7488bf95a341ed971374618d59f1b2d5f680df00b', 'tmp_86797bbb070098dd94ea358991e1b594.jpg', '20180108/62a2fbba37bfb658e9e057f09106cf8e.jpg', '9f7cb90f8e774576cbb10aa7488bf95a', '10b22213a810e95cbaafaa48d6f57c28a51e139d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('78', '0', '389202', '1515393374', '1', '0', '6b428b10fbda41907c08f7b27a1847c3627e48e002d78c5a540880ce8a5d51bb', 'tmp_a4a1069b2932cda02897d4e0c9416d83.jpg', '20180108/80e200c2d086ec8002f5443787e2f2c2.jpg', '6b428b10fbda41907c08f7b27a1847c3', '8e3b28d20ca8fa938e1b747b432c0be299cf012c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('79', '0', '323147', '1515393477', '1', '0', '348e216746d45872106f8457ad9dafa792307ba60f7193caef1d066e5585250c', 'tmp_73615aa1dc13de11e78f82f3c214dcac.jpg', '20180108/31032314642b0f8ae03b3fe4daca1b6b.jpg', '348e216746d45872106f8457ad9dafa7', '3c935bfb6560bf9abf8b5d40b74187a0b19f07a8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('80', '0', '428204', '1515393498', '1', '0', '4966e260779ea3b2cb9acfe237090ae04f810c55728eb6ba991b5c93bab891bd', 'tmp_b6bfd7709c10563fec516ed94e4fe783.jpg', '20180108/3181ea67559e2b36a2a0521f77574d98.jpg', '4966e260779ea3b2cb9acfe237090ae0', 'df2c9b23832806817f6fbb94941459b3634118aa', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('81', '0', '55837', '1515393504', '1', '0', '833132fc9478df4ad42cc7dbfbbe64901194319126fa8dfe8ab3de5f63f0a565', 'tmp_06faa348ecbef233a5066d46b303f2d8.jpg', '20180108/b4f722dd359b7de3e435c80a35e5edca.jpg', '833132fc9478df4ad42cc7dbfbbe6490', '0404b2dc9223ac929a8b7548ad820f351fe3aba7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('82', '0', '172512', '1515393634', '1', '0', 'b2bf8549efaa6be391cf0e313ab6cfbfd5d43c9ba28e27a474901985e9b9eeaa', 'tmp_e814f3f06c137e28b3fc23073ce19b11.jpg', '20180108/41d6937e241b14cbc636fca490903a4d.jpg', 'b2bf8549efaa6be391cf0e313ab6cfbf', 'e94dd7a322feb4b581cac90f33e72e12044b4425', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('83', '0', '17506', '1515393717', '1', '0', '4d5dac573ca902a78aa307c5ad8659696f8143aee616b9fe4db3a80dc826831f', 'tmp_5c138f7350f4eed27e7e4b32987a103bb762062396f783f9.jpg', '20180108/e077c39f722a6a2b4a01850db49b4060.jpg', '4d5dac573ca902a78aa307c5ad865969', '3264b3d8c4dacf9606eb847ae2c13cb560bd19d1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('84', '0', '50251', '1515393722', '1', '0', '65c204c0f3a96d250d40daff1e532294e96ad6444f0bcf79931503246d6488d5', 'tmp_cb85debda95fe8dff3fc237426cecd1587a8d6e03cfd54bc.jpg', '20180108/15df55329e0cb0cf93ffe1c473f58624.jpg', '65c204c0f3a96d250d40daff1e532294', 'a83a0a4425c208de9443cc2ad3694c64c5f64f94', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('85', '0', '59779', '1515393727', '1', '0', 'e89f086d059dcb9a45edcea5b332e018b9e6e2be6039ff64d5fdeb2a43a57e50', 'tmp_81f7fbd5352a5c8a5b5c7494d78090078b6de76e385fda86.jpg', '20180108/55abbaec6366a80b1b6dc657e6d7fb4c.jpg', 'e89f086d059dcb9a45edcea5b332e018', '3f138b18a5e77870eca92f951f82d302fb3c6c6c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('86', '0', '27563', '1515393735', '1', '0', 'd907e38bbe052863e203319b27a82b09f6fdf5124fbe3780c89f92ea60213f73', 'tmp_4a864e029bb45dc254da33c98c89e3a36ffe23347f8a518c.jpg', '20180108/5c9d6352a37cae1d8aebfb37fae87645.jpg', 'd907e38bbe052863e203319b27a82b09', '5fa6a44431172c18e4a5d782303753f5dadeed87', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('87', '0', '37362', '1515393740', '1', '0', '2568e96e3db99f4c0abc2470e5338589e6843237f29a5993ed227fd3819e55a3', 'tmp_f09160f114532e5a1a61d602f8393362d54b6570073a8d1f.jpg', '20180108/5cc9147b6cbb15ad6bdb109cf8302c70.jpg', '2568e96e3db99f4c0abc2470e5338589', 'b0bbc19a87b633c845facc6351acdfc8bbcb36e7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('88', '0', '6558', '1515393752', '1', '0', '6b0788ad5796ff1756daf9b678b8043a271bc51a4e7ceb74605e90943ae64d05', 'tmp_32c473d1b387a420958584cc334226b19205bc32377a4156.jpg', '20180108/ea3dec097aa6cf47ce1bbcee9ec7ec57.jpg', '6b0788ad5796ff1756daf9b678b8043a', 'fce16d74b4db4a1344fb925d8db86786e2e92dc3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('89', '0', '100219', '1515393758', '1', '0', '7fdb38738defec5b4f05e50a621950c3b74e78ebf4566075f5116fa6e7a374f5', 'tmp_0b0f8797c117aae682af5e23a0b908934452979ede085e9d.jpg', '20180108/9985e1f69fcf99047276ed5b9b14b152.jpg', '7fdb38738defec5b4f05e50a621950c3', '852d238baf8e3f095086fd4f5f76979699097f5d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('90', '0', '37547', '1515393761', '1', '0', 'b550bd481f4f58a5210a75cf4dc66b3abc1d77b91086750748b920b25efb6e2c', 'tmp_f7548fde8255469eb30ff318b8d0ccfef025262fff9496a8.jpg', '20180108/47a4e111141d7adf14a8f0e0bca67429.jpg', 'b550bd481f4f58a5210a75cf4dc66b3a', 'afbdd0a8466789544c82b4473409a9e84d63ad92', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('91', '0', '46661', '1515393765', '1', '0', '7f5814737e3bb889e93fc204fd524088bc55b238957c0a08386a2ce320ad8757', 'tmp_0a1d1dbaee8dc2d16ba5a5f6a1346269ef342952419f6b28.jpg', '20180108/2a7ff7e41654a1ac5d710972f2fd0639.jpg', '7f5814737e3bb889e93fc204fd524088', '0e7d227cd9cf744ab9fa4507bc18183aa89f2ffb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('92', '0', '43962', '1515393780', '1', '0', '683256f6aaa7a77ec13b6d065e578dc31578e23ea65f23e300a723e15c254d4f', 'tmp_55dc493eff0220c033decb357382bd432568dc7057411979.jpg', '20180108/5176d1d0da1f58394829f416ac4205dc.jpg', '683256f6aaa7a77ec13b6d065e578dc3', '2e702e262a217b6d3d7a0be2a63b64fbf74ae581', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('93', '0', '38229', '1515393800', '1', '0', 'e953898e2eb2e2025c5017f1bc01efdac06e1378caca32e04982f82e1c04fc79', 'tmp_660d1daaff2650a43f1fe50b6cd8567e0241fa910928d426.jpg', '20180108/1ca68e9458b09b5653145c641ac21226.jpg', 'e953898e2eb2e2025c5017f1bc01efda', 'b2c3d9547b0aa7eecee30926505fd9e50d2a8cbb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('94', '0', '15896', '1515393811', '1', '0', '30f2e422d1428598cbe6c831d4e0fceebe2d057bc0b00763f66ca460c18ed6cc', 'tmp_7f2bac0d969f782e9b5da7482382deac449b1ab930476f9b.jpg', '20180108/e2caf43abc322603fcd50c110c556937.jpg', '30f2e422d1428598cbe6c831d4e0fcee', '35a29c593343a0123eb99c7ec14bce7c17f77940', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('95', '0', '390265', '1515394172', '1', '0', 'bcfbf39534175959415cc51e7085a7a87e9fcfd4d72d7b12789997beee54180e', 'tmp_f2a8355e121db571886b9e6bade0d0bd.jpg', '20180108/613240f71d9a0a9c64ffa3a9c82e2323.jpg', 'bcfbf39534175959415cc51e7085a7a8', 'd5bae05517b4f371d87123b6818e331f2a3fea41', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('96', '0', '432287', '1515394185', '1', '0', '97a65889a44a9edd103a98534637cc7fdc23f8eb7c24f41ddd1bbf98f0571e33', 'tmp_d337efaac171895c43dbd1daacc18f3d.jpg', '20180108/6f0823aff0ea20ca975716d0fedc01fa.jpg', '97a65889a44a9edd103a98534637cc7f', '48346b13134fdf82da211cc7e2d948464adf588b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('97', '0', '43681', '1515395447', '1', '0', '279751d19cd976f75f66a41ec015ea88dd525e9e53472a9980d596e4c417fcda', 'tmp_e69c8972d9417ff3214e8091a8c7525fcdd6c526ab57d093.jpg', '20180108/5f0293698eca662dcb6bbde475ea427d.jpg', '279751d19cd976f75f66a41ec015ea88', '4f540623e255b5b665780171aa509cf08296b1cc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('98', '0', '28256', '1515395452', '1', '0', '1d59578407f518b43c2b086420fa5a683c2a565f649ab6ad3ac194574c99d09e', 'tmp_df6c3bf5769ac48e5d8b3df924aa1739a22d58f21dca22fb.jpg', '20180108/45ca0b77d4c3763f5dc45353dc00f629.jpg', '1d59578407f518b43c2b086420fa5a68', '542911532127a4b1524d08799dbdb5b8ee40a2b8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('99', '0', '68460', '1515407999', '1', '0', '54dc413bbfb2cd872e559dfcdbee2d006eeac0ec431b2e9aa4bdbdc8cdc908c2', 'tmp_43b53e4fcaecb1e73fa337153fff5e484dd8a30444f3d5ee.jpg', '20180108/970373d19b423085ac40d2c8b511289c.jpg', '54dc413bbfb2cd872e559dfcdbee2d00', '425b298f69576a8db339ae9ff6bcd8143feebb53', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('100', '0', '68568', '1515408010', '1', '0', '0e611b89714c05397e9871e03a61662a88c994864bfacca49537b89951397b61', 'tmp_d407fae003932c090b313a8b6a7998b358be6e2107a04285.jpg', '20180108/b4addccc653d61f25d25a3d74f63cb35.jpg', '0e611b89714c05397e9871e03a61662a', '71592839a7a966f2c2160b4f4f74e0f78eb35300', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('101', '0', '48787', '1515461339', '1', '0', '1f0af6e604d8dd97d569ba4c3e9379628faac8d45ae821ff17c863266d14fe24', 'tmp_e1e7977f7ca347e29941be8c6b59c61a5948c22b904342be.jpg', '20180109/df5d963ad9e0ebf4284a6b765a5f8b5e.jpg', '1f0af6e604d8dd97d569ba4c3e937962', 'a70de4647b5c0a252ece0e27f23e4a7348dcad23', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('102', '0', '50843', '1515461348', '1', '0', 'e325ca8666e2189003d28190aa08955656e7e82212f36dd1603602743482b8a1', 'tmp_ce1e809efb0cb9aa976a596a077c9d77745dff0fee9262b5.jpg', '20180109/8ada6619408149483518da079afc46df.jpg', 'e325ca8666e2189003d28190aa089556', '69d32d873bf415d8693696ba3041ba84e0e4c3b8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('103', '0', '4569', '1515461355', '1', '0', '92f1bbd84306003a15bf3abc44c1035ed9924074be80193a44c22e5153ffdb2a', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.92f1bbd84306003a15bf3abc44c1035e.png', '20180109/10716a9bfee66b2a0009de37a690a812.png', '92f1bbd84306003a15bf3abc44c1035e', 'ea446d72ba05cecab973e9ded72d3e77885fbc4a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('104', '0', '1399', '1515468846', '1', '0', 'b54f141436cdf82f35ef992710926f70461992ea0ec177537784e976010640a4', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.b54f141436cdf82f35ef992710926f70.png', '20180109/0ba0362c08e5b9bc4008d3babb26188a.png', 'b54f141436cdf82f35ef992710926f70', '4a65aff225c741cabab5020ee714baf5139fa351', 'png', null);
INSERT INTO `cmf_asset` VALUES ('105', '0', '4151', '1515468860', '1', '0', '0d8b1f5f0071291b2bf07b9a6a684c579477e3062eb0728c89773ab787b4b30b', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.0d8b1f5f0071291b2bf07b9a6a684c57.png', '20180109/d18ef6aabde48a503c6fedcdb99759f0.png', '0d8b1f5f0071291b2bf07b9a6a684c57', 'c00354823ff8b633df5a14666172f087f2c8443a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('106', '0', '195975', '1515469566', '1', '0', 'd0ad6771913fd2ca2ad04433b46f2d267803776edc1e7260067238783750a7e5', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.d0ad6771913fd2ca2ad04433b46f2d26.jpg', '20180109/da6e2597b25213119f837c4cb68509ee.jpg', 'd0ad6771913fd2ca2ad04433b46f2d26', '8ccbe8653e3e153021f0fd764e6df44c017237d7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('107', '0', '2491', '1515469577', '1', '0', 'd942c2f13cb37c5298bc4fbe9c703594f664a9053e494bb7e84461308abebade', 'wx3f9556a60746a470.o6zAJs0vAJzO3jIXQ0R9luT9Tw_M.d942c2f13cb37c5298bc4fbe9c703594.png', '20180109/8e6faa48c4b5a31871af1c652766323a.png', 'd942c2f13cb37c5298bc4fbe9c703594', '6bef733fdd6849efe9d81c738a3bb4f5df49af5f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('108', '0', '51228', '1515470109', '1', '0', 'fb5d2749fde5018ba719fa753731c9101a16cc4de7cc8ff0886b915f739f46ae', 'tmp_8fa7200061292e888b3fa66c6e2631b8579944143ce2f914.jpg', '20180109/295d373a708d011aaf391ccc9143535c.jpg', 'fb5d2749fde5018ba719fa753731c910', 'acbf932326a3b69ee0e16d726cefd45082a6b1eb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('109', '0', '59597', '1515470114', '1', '0', '62231b662c37c2d4ce355a0621351f68a44284bf16de9f732833bef7c5632177', 'tmp_5a6f53e3e33e3af70aefaa4aa8c367e6584c63b994e799c2.jpg', '20180109/22dd5ee7ef908e1c1a370e7f720deeaa.jpg', '62231b662c37c2d4ce355a0621351f68', 'de4e44a08a32116e9720696f607ed20e8a2a031b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('110', '0', '299150', '1515479680', '1', '0', 'b501ead995ba93e8279921601b4fa3e6e4af3f74358e3f7eb0acd66c846091bc', 'tmp_eaddb7e6bf2af8d60a3d63c1ff124a0f.jpg', '20180109/829c97fbb0fe89f9c7d8fca3a81d833b.jpg', 'b501ead995ba93e8279921601b4fa3e6', '9949616226a0858ff6eb739f61b0d1c819489bba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('111', '0', '335470', '1515479685', '1', '0', 'd5d097dd1d2e57960ba1be9be582d25e436f8643eef8551d48ed62266e7b5726', 'tmp_2ac7054ea0714cd7f6e555015ac3019d.jpg', '20180109/3240af93142f63a9129edf5bcfd573da.jpg', 'd5d097dd1d2e57960ba1be9be582d25e', 'd69f4457fa8d787014a0c77b49fadb52c97ad50c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('112', '0', '75125', '1515480417', '1', '0', 'edea76451dcece58037d1365fc234a165ba48c7f0a6a619dc03b66cac7cc84f1', 'tmp_bf10b71a7050f8ce0c85e82dc0a86ed3cd0b6f31e8d851c9.jpg', '20180109/4e97a84161eb7a50f7165c18f1e43750.jpg', 'edea76451dcece58037d1365fc234a16', 'db1ef02517bfb2eac80f9b95ae1eb0f93319f73a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('113', '0', '75768', '1515480432', '1', '0', '8bf4196eeed4ffe5746b2ccf22a5ef4acaad318a8f5e27dd3655c49c343f438b', 'tmp_0d9426caca96d117d818ed1ef9e0dc0e99b9bb12922fa42b.jpg', '20180109/085699e847162b99b1dd8681087fb844.jpg', '8bf4196eeed4ffe5746b2ccf22a5ef4a', 'def89ebdfd79a786880f03db8c14713bc42ad2f0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('114', '0', '9040', '1515481046', '1', '0', '1fec07d6691d3c1d2f333bfb41db23eeccbfadaf935d84c389bd7f436b5c63d6', 'tmp_5905050d900eec02ab970f6bf3531363ebe44ba4fdea8ef1.jpg', '20180109/0c10b4f5872d214259fe45f091637d45.jpg', '1fec07d6691d3c1d2f333bfb41db23ee', '51c7abff1158240f632bc41e89099f7270803488', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('115', '0', '9952', '1515481052', '1', '0', '7a0210efe052b7c04ba773c3ebc041fce1103cc80072b122d9d1e29077397a7b', 'tmp_4872b812acfeb8891ed020569a08baa5246b291a900c08ab.jpg', '20180109/a42f1f10fed810212df69f56eef0cf3a.jpg', '7a0210efe052b7c04ba773c3ebc041fc', '788afc8cc979f8cc4002b14172a527b96716ae0c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('116', '0', '185296', '1515481817', '1', '0', '8f9ffa4df3f0dc45d8c1e187de2d2d2501d33853f196ba82e855d2849f356373', 'wx3f9556a60746a470.o6zAJs_Czk1vc-PcbRTgYTkEl1mI.8f9ffa4df3f0dc45d8c1e187de2d2d25.png', '20180109/da3fbf7fb75ce1e6051ed47e41f86155.png', '8f9ffa4df3f0dc45d8c1e187de2d2d25', 'c1ad4ca853eecc3e55ba591d56988973bc7b08df', 'png', null);
INSERT INTO `cmf_asset` VALUES ('117', '0', '45326', '1515481850', '1', '0', '6f7491d2888b0a15cfa8696938965bd3dcb5716e1e44ca8924ff05516ebcd2c6', 'tmp_732c6913785d7b977333956ca62bf58cf929048c8543416f.jpg', '20180109/400a5dc7c919a99ead0f0b94baf06ed2.jpg', '6f7491d2888b0a15cfa8696938965bd3', '21f5150721b1fa5f308e6bc551a93d654c5ea630', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('118', '0', '42788', '1515481929', '1', '0', 'ad0e0e6956e7c4814576401f47e19a297c866a8fc1d01f45c953019112962472', 'tmp_45d5b64de507e27ae08de8a095b4f75b39735674ed8ced27.jpg', '20180109/373eadce5fee99ad7842f232518a1032.jpg', 'ad0e0e6956e7c4814576401f47e19a29', 'b92839e09817567c1a8d1b4ce7df06a0fc7a0d80', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('119', '0', '42785', '1515481934', '1', '0', '562a08a19abc9c6a4a052700d993dc48a6966d309fe67c50c69d48774dcbcf12', 'tmp_8d85e2d9b386b5c92a5119abd8129f0d1c6e8b371088374e.jpg', '20180109/9e6d50c28ab33922344da0ccbf2313c0.jpg', '562a08a19abc9c6a4a052700d993dc48', '9d2272ff97bae284cc61a199572982e5917c2741', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('120', '0', '75260', '1515481977', '1', '0', 'a14b48f59a5e61c73acd4736c9f38c304a8fc7e85731021a96dfcbbab63b344e', 'tmp_91706c74bba97258c5843ea98794aaadde276498961550eb.jpg', '20180109/440a1b08bd6ff0b7a41bd75fa238a212.jpg', 'a14b48f59a5e61c73acd4736c9f38c30', '4fbfc8d20475e32c163c5eb4e21afc304da409c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('121', '0', '85365', '1515481989', '1', '0', '5fe6a6eefa67a8a0707d652543825959629f60c689084eb783defed3bbeccd61', 'tmp_2829f6fb4db26162c6960f699cd13dd49353d549f04d3cca.jpg', '20180109/e34a84352933a18b5697be39e4718850.jpg', '5fe6a6eefa67a8a0707d652543825959', '1c32d652fa26c42ca53555c05e9b1cf67c4def63', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('122', '0', '6904', '1515487120', '1', '0', '1d5ac9316fc9b35ffe34d6f94d84f5690bfb12d0e03b17c078e56939ed446268', 'tmp_86e4b59d5e6464d86ee41c2c7399bd542dd8fb05cb0a264b.jpg', '20180109/4288e729711ef136b625623d1a521e44.jpg', '1d5ac9316fc9b35ffe34d6f94d84f569', 'bb3a2dec92d48b407008ee4c699fe80dac50b13d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('123', '0', '9861', '1515487331', '1', '0', '37701e6342ca7163070bd849075032154fe02e4415588f22b947cb05264a0908', 'tmp_4d5fa5d9d41346b66febd2edadaa334575ce06321bc533f0.jpg', '20180109/2aaaba818b0cae3f850b0acee247e790.jpg', '37701e6342ca7163070bd84907503215', 'ba89bbe6afae6924043714dcec639e4a8f09ca9c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('124', '0', '215209', '1515548197', '1', '0', 'c7721e383b8457fe9d7ced29dcb3d03e140068de9cfb7de2788030c0eb12e34c', 'wx3f9556a60746a470.o6zAJs_Czk1vc-PcbRTgYTkEl1mI.c7721e383b8457fe9d7ced29dcb3d03e.png', '20180110/308d6285e5855ee76253abc7c34474e6.png', 'c7721e383b8457fe9d7ced29dcb3d03e', '195a3e0a926d98888b3f9a809b672b4e83055418', 'png', null);
INSERT INTO `cmf_asset` VALUES ('125', '0', '32082', '1515549263', '1', '0', 'd2e6582626bd1af9fca05550ee73243d53575f8362f3c22298ef37b93f3b11f6', 'tmp_7afedb87804dd726a7edbf91d1c34da9537d832c5e2de7cb.jpg', '20180110/483c9ff64d7e5bb9e07b795dd28e914d.jpg', 'd2e6582626bd1af9fca05550ee73243d', '5812d9b0e6b24fd1b40e6ca4d515e735a4a508a8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('126', '0', '14321', '1515549269', '1', '0', '7360a07b6d476872024e8f897b0f5bc9eeca4d691b62f2e510032450ee4cd37b', 'tmp_1489f6b42685bf21847d4d7240f2762bd77f99c1b7eab6cd.jpg', '20180110/8603f152e4f94f3fadbc9d5da1df376c.jpg', '7360a07b6d476872024e8f897b0f5bc9', 'd4e9d408af1fd00f2a51502715395123c9c2ff10', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('127', '0', '91877', '1515640475', '1', '0', '77da5dde84c948e5ea3d9e89edf7cf86d214ff88a2a4ef71b914923548efc8f4', 'tmp_1f9f3bbc5c2715207a054ec8cf17d4cccd632594fdfde8c6.jpg', '20180111/08685cce31ebdf4263e6030e33baf6cc.jpg', '77da5dde84c948e5ea3d9e89edf7cf86', '480faf9c4a49b42d9c8a82a79d41d6188bccfe3d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('128', '0', '51019', '1515640479', '1', '0', '31b93764b9b6c30955bbdc625acb8035c4157fd8e217798d4312e9f8790e9378', 'tmp_27bfc71538bf17b0a55ac1013627e25881c99c692c157244.jpg', '20180111/62d98ba63c835732df3315da29fe7b6a.jpg', '31b93764b9b6c30955bbdc625acb8035', '466498363f6bbee974624ba298de5e57cdc1371a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('129', '0', '33925', '1515661247', '1', '0', '71f297716f03c95969a109d163fc3c395715121933debe43a0d61165524bc23e', 'tmp_0da97bbb9eeb9564800b3a0144c2875d8e6e37e981bf2076.jpg', '20180111/69d0ec0f93e4f5491ec187a79d3d476f.jpg', '71f297716f03c95969a109d163fc3c39', '0680db4a036bf6358acdc698a96b7181afd07bef', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('130', '0', '23184', '1515661251', '1', '0', 'f566e827b9cbce0ff305bd7227afb380329db19667aab8e2668cfb993120a1c9', 'tmp_0a139ebd436217f12775d33da1906b6964d72511013cdd58.jpg', '20180111/e324f80bbb467ae798e32638ce6baefa.jpg', 'f566e827b9cbce0ff305bd7227afb380', 'e0c47d40e49241f17388d6684aa4f3f73b7be40d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('131', '0', '65361', '1515662600', '1', '0', '05bddcb5cbff28a0070512dcb5c0596f1f83cdd144af4d60e080594ef4a62bea', 'tmp_758696589558c08de84924ad97354473b762f38e529c6f0c.jpg', '20180111/604de24cd6c78ad9393ab6b6524fd12a.jpg', '05bddcb5cbff28a0070512dcb5c0596f', 'ca259a7f51d724541a9e7e0511a753d05869f953', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('132', '0', '73599', '1515662608', '1', '0', '0e59eaafa8fa3e5f4e1af984ff4e3f5ac3b96a10f28dfc5751ba15d529dbbd91', 'tmp_ec3178bcd768347723e5b4ee7756350af02773434b620c70.jpg', '20180111/9bd864060df0d2d5bc364bd9b0f8bbcd.jpg', '0e59eaafa8fa3e5f4e1af984ff4e3f5a', 'fedd0976a8e39953b8114b2674b08ac7ce95d1a4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('133', '1', '6154', '1516086225', '1', '0', '458921156e827ec1c9b08c5b348d7df3b94a8afeb90d9f07a7d47c693fe83671', '3-1FR21633530-L.jpg', 'portal/20180116/9f07a9dee2eb54afa13bb056fb6558f0.jpg', '458921156e827ec1c9b08c5b348d7df3', 'f7d5396f74a2df705ce9245c9c48b764896036f6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('134', '1', '6148', '1516086302', '1', '0', 'f0640fa00048b2ccb218f8288b3702d4c3eb4f0e1cea0c971f79099a335ec39f', '3-1FR21631450-L.jpg', 'portal/20180116/803b6a54ed5ba056d373ed1697d02387.jpg', 'f0640fa00048b2ccb218f8288b3702d4', '52f637d5494b03395f81874ce2e55c63e90f771b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('135', '1', '5288', '1516086354', '1', '0', 'e43cc5b721b4250f1d7e03c7e8a1c7653d13d8ccb246c00bae558413badf3624', '3-1FR21630160-L.jpg', 'portal/20180116/f2d6b48b6742bb385ec1b95680ed5fe2.jpg', 'e43cc5b721b4250f1d7e03c7e8a1c765', 'ff0b93377e21d8e06b2efcdd81295486a1326a2a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('136', '1', '6629', '1516086387', '1', '0', '7670a5588d585c8aff5ba776c2b9ccb143febb13048829902c6d59c25491a3a9', '3-1FR2162Z90-L.jpg', 'portal/20180116/ee287096f237f451e4730330d0b67fb4.jpg', '7670a5588d585c8aff5ba776c2b9ccb1', 'f1dec7ca2e9392052d2b02e2f363b20adb865ee2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('137', '1', '4626', '1516086424', '1', '0', 'a2b952cc5628429926ba5f3d258bda11bfc5cbad99fce7a1340f972155608080', '3-1FR2162K80-L.jpg', 'portal/20180116/2663954337587c9023293d06e1baa7ad.jpg', 'a2b952cc5628429926ba5f3d258bda11', '612be1dfcbae0d4fa4bbc33df10e490849fd74fb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('138', '1', '6261', '1516086455', '1', '0', '9b40b83ddc72b3b698ca5d575bfa423f4844c84304c161e944404596756d24c0', '3-1FR21626420-L.jpg', 'portal/20180116/3822a416ca676cbec0d87474198c5983.jpg', '9b40b83ddc72b3b698ca5d575bfa423f', '9be56595dc2d8587b3b4d956b7fda0bf23ab667f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('139', '1', '3749', '1516086495', '1', '0', 'f59e0fba9d1fe882afb96fa785f4dea1e10c853b9863fa79312c1b4761c760df', '3-1FR21625380-L.jpg', 'portal/20180116/f7a4dc5d54995c295703ec9222553682.jpg', 'f59e0fba9d1fe882afb96fa785f4dea1', '3cd6892ae2890ad8ed1c7cc23fa894e4929396b0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('140', '12', '47636', '1516435174', '1', '0', '67ca4d22eea43473412ecda9e486ec70b181678890e7d8faf3f246bdd3f026f1', '佰瑞特.jpg', 'portal/20180120/8e4b75763c2857c19b6fb6b7f8c73a66.jpg', '67ca4d22eea43473412ecda9e486ec70', 'd3591ff939fe39f1bc2af06d6264c656068f2146', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('141', '12', '34563', '1516435550', '1', '0', '101276a1aa703766e8d255bcb3dface9d05475bf54b09989adeae58d66a9b4f7', '正泰.jpg', 'portal/20180120/f6b143ce905566034ef8841b67563435.jpg', '101276a1aa703766e8d255bcb3dface9', '7e63cfd48a856f3af2b58b1487bcf962197d10cd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('142', '12', '20383', '1516435636', '1', '0', '8a2a4f76bcd48ca54813b9a0a557c105e3ddf1c324cb587f83a6980ca5124960', '公牛.jpg', 'portal/20180120/0bf60c18cc86acc2e7c14f9b1d6b3ad8.jpg', '8a2a4f76bcd48ca54813b9a0a557c105', '6880a1eb1569ce5fa84b568863210a5dffd18c5a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('143', '12', '35634', '1516435750', '1', '0', 'a36ccf36079ddfedc19cf018701c7ad4eca81e5dbc55c43e488c4dd8aa3add0e', '飞雕.jpg', 'portal/20180120/6867878e7b48ca5cbf72b7907810e8c3.jpg', 'a36ccf36079ddfedc19cf018701c7ad4', '16f04bc2af1fcd703ad97e0884bd1cfe3a77f30b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('144', '12', '32620', '1516435996', '1', '0', '8921cdb25c277132bef79a788eb83a4b4ecbdd0d9748be6367ae90a059b96031', '公牛.jpg', 'portal/20180120/93380827d2f9cb5310bc80b020c03d37.jpg', '8921cdb25c277132bef79a788eb83a4b', 'c90f0e2c11b35650e5f3c97cfb7846c74098fd87', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('145', '12', '36579', '1516436020', '1', '0', '1e25dee0cac3bc3a9bcc9be65fb633a696005b800518f760f97b4fc699541080', '飞雕.jpg', 'portal/20180120/2b9241a36f4c11a15fe7d477ffb50283.jpg', '1e25dee0cac3bc3a9bcc9be65fb633a6', 'bfa0e2691e0f682eb7338991a856e9e9d2376b8a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('146', '12', '40143', '1516436043', '1', '0', '6f6bf22bc2f3f27b82fc836a73a8ff5dff6f4834ff1660d2807245030daa439d', '西门子.jpg', 'portal/20180120/36751bb9401ac7aaefe2d839b3257536.jpg', '6f6bf22bc2f3f27b82fc836a73a8ff5d', '1a38387f3aa0873583a1b47bc3d31fcfdcab6b5a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('147', '12', '40404', '1516436074', '1', '0', '2cb72b4752ed9064b8741c904473be2e421811027f67e3a1dbb7d99a01fd71d8', 'ABB.jpg', 'portal/20180120/296b68b25241378048b3d9958d694f56.jpg', '2cb72b4752ed9064b8741c904473be2e', 'bdfa25c9b249c281d16680c15a45accbe3af9477', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('148', '12', '32512', '1516436100', '1', '0', 'ec8c0114be032373eb1d3dd394ebe9ff419e94ea1c2d555773cd11f637324b5d', '正泰.jpg', 'portal/20180120/21a10c4d1e004cc667493465245cf408.jpg', 'ec8c0114be032373eb1d3dd394ebe9ff', '81f56e29706959196cec20b5a01193568da3d6ff', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('149', '12', '30598', '1516436715', '1', '0', 'f662fffb25d69e7b06ffbdd83259457c95dcb87abd5024409c3e07733cea7c5b', '德力西标志.jpg', 'portal/20180120/6d465087997ead3a10cd3dab8c211926.jpg', 'f662fffb25d69e7b06ffbdd83259457c', 'c71a5b7478cfdab8d0ba0c42f65ffccc46bfd626', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('150', '12', '4301', '1516436744', '1', '0', '688ae108fbb7742e1b0753c2a219e53443d278866825e9b166777b52970b21a7', '汉高百得 .jpg', 'portal/20180120/a72d94fce89620438865fbdd0bfacb96.jpg', '688ae108fbb7742e1b0753c2a219e534', 'db1f4ad549e456937670531f2d4adcbb8b102972', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('151', '12', '53032', '1516436788', '1', '0', '9a3d44c8de62e49b7a5cfaff00a69058802cfb2e3cfeb73dc3d258b8f6415b9a', '乐泰.jpg', 'portal/20180120/f9e1a86eca9496ada498b07b325fe219.jpg', '9a3d44c8de62e49b7a5cfaff00a69058', 'e8f4c849df062ced45e6ce65b6a27fb82ec589c1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('152', '12', '47721', '1516436838', '1', '0', '991b3c759cff68a8e487b91bcb4062a6ff031a55457ff9e604a9ef14606522fd', '曼科.jpg', 'portal/20180120/368f7edccc231dee97bcb53c800b9957.jpg', '991b3c759cff68a8e487b91bcb4062a6', 'c660c51b6e652b3ac2e7533e30bf3b8179703397', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('153', '12', '40913', '1516436867', '1', '0', '8a772b31fe2cdb87b116b1d95b1183112b594d192471c84c935b7142f620f810', '桑莱斯.jpg', 'portal/20180120/6a17b6d48a1c19c56af8a3e26b9dc1e6.jpg', '8a772b31fe2cdb87b116b1d95b118311', '136d8a11feba2dc93f556ddc9433ad1df53b1f77', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('154', '12', '28090', '1516436897', '1', '0', '87214eb9f76cfa9fa9e8839b09e892900d3de83e86cb2346063e709d61a43ab0', '众力高.jpg', 'portal/20180120/7ea44f18eedf6c2ab082b9cd64757579.jpg', '87214eb9f76cfa9fa9e8839b09e89290', '7f136c5da2eca85759865a781b52d8ca36605e1c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('155', '12', '44950', '1516436921', '1', '0', '25188eff9359331e958d4e6b3c4670c8bb3c6aaee7ff46f95feda86d3fc7222a', '卓高.jpg', 'portal/20180120/8521846bde4ae360895d570d49801948.jpg', '25188eff9359331e958d4e6b3c4670c8', '6e3952db87bb82c613b072f09215dbb6b3b3645c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('156', '10', '40355', '1517640629', '1', '0', '247e1a8c4a76afe772fcf5ec8b3ef484fdaca1347ba74e742bcf54e20dbb3ba8', 'app.jpg', 'portal/20180203/145e9b013a9381a705c7cbfeb48a0570.jpg', '247e1a8c4a76afe772fcf5ec8b3ef484', 'b2abd76019967ea16a9540eca9fe81736cdab6b9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('157', '10', '24252', '1517640634', '1', '0', '1cfd15490f95524d3cea60e3e4a3f51bfbabd72514daf5bd6bbdd7ce9e5428a8', '1.jpg', 'portal/20180203/cf2a7891b48a6f2dcd94c18d49e3d2a0.jpg', '1cfd15490f95524d3cea60e3e4a3f51b', 'dd2910d7948d2191ff31f0843278e2def9eff8c3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('158', '10', '111881', '1517640704', '1', '0', '9401f792e8f326eed3da8b2a5ad93a951855e3a237c05ca96fe35edbd01d5c0c', 'db4.jpg', 'portal/20180203/a5c4d6c9b2b3511cc4bd3fc0eec62347.jpg', '9401f792e8f326eed3da8b2a5ad93a95', 'a601a184fa04ee2acad496057a2030817b7f9d73', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('159', '10', '51969', '1517641701', '1', '0', 'ff76fe8c59f902253930c647a58d0064f8b1cd99b9857fc93d3ac6ce2d40a5e3', 'b3xz.png', 'portal/20180203/68e631bdc29b0a0f5746854e30c3d9fb.png', 'ff76fe8c59f902253930c647a58d0064', '42a5d0dac55781409bb9f7108210e5af2d1e7867', 'png', null);
INSERT INTO `cmf_asset` VALUES ('160', '10', '56866', '1517641844', '1', '0', '8637d36ac8f505ca83f0b4f5f4b3e24f0f5ebe0325ab3ef3199d44087ec40491', 'icon.png', 'portal/20180203/255ab7a283416f385efd5ece84e36f71.png', '8637d36ac8f505ca83f0b4f5f4b3e24f', 'cce73a8c417cf5c8ab31de0e8d9cfdc0c95e0262', 'png', null);
INSERT INTO `cmf_asset` VALUES ('161', '10', '357286', '1517641870', '1', '0', '045583992c6706c5f657b11347f4de41319eab9389bca983da6d41827c7302e2', '易站经理-开发原型图.png', 'portal/20180203/03d2d34c8f128ee5f7a943d046487e29.png', '045583992c6706c5f657b11347f4de41', 'da17236a2b47e1a6951ee98ec3c714db2bf16a71', 'png', null);
INSERT INTO `cmf_asset` VALUES ('162', '10', '12979', '1517641888', '1', '0', 'd148739223eb805225d5459b78721c9862127cf7703a663fb3782f8d552f358a', 'logo.png', 'portal/20180203/117c0fab0caed26dc264199237308a08.png', 'd148739223eb805225d5459b78721c98', '69ca5da7f1726b94e08fa48f2051b951178c6368', 'png', null);
INSERT INTO `cmf_asset` VALUES ('163', '10', '14152', '1517642290', '1', '0', '24e4b67514dfc71a918e6222dc88f7e87adc4572197dd8d240f1d3a48eba3c7b', 'b2d621b87a9e112ec49750cbd3d7a310.jpg', 'portal/20180203/49e6bad40fcd81b34dae72633bd090ed.jpg', '24e4b67514dfc71a918e6222dc88f7e8', 'ba8d914288a3b4d15a3d58bf76fbf87d229bbed7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('164', '10', '705557', '1517643559', '1', '0', 'a84fd61f9669af58c8e60bb7215814101a2afc970cd7fa095ac57493b0de9aae', '12222 001.jpg', 'portal/20180203/8a8c17f5ee6aa88f097987cffff025c8.jpg', 'a84fd61f9669af58c8e60bb721581410', '85dc91113d4839405c80c77c171ed3a96c3b135f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('165', '10', '156589', '1517645507', '1', '0', '07c87d6d0873dbe71eb25d696ebca81695a781da5614268afcad93308fbfb594', '6106a4f0gy1fkk1i2k5hsj20y81204qq.jpg', 'user/20180203/9d6a99866ee63a2764905b410b1e8c26.jpg', '07c87d6d0873dbe71eb25d696ebca816', '9fe95204b85526f9306d96952f8af1fffd889509', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('166', '10', '28630', '1517645816', '1', '0', '3bd592ede87240b5a194318af773b2765a6c5ce84f4ba961e712f21efcc38268', 'ecshop_logo.png', 'user/20180203/660a4ac47254f1c91600f4d2a7514fae.png', '3bd592ede87240b5a194318af773b276', '0294bf85ef95593c3a012b7d395b4e3c6886067d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('167', '10', '358793', '1521015421', '1', '0', 'e62d778cc7fc9ce014ddf1c2eae326b4a13743d483bfc40d37991298c3af04ca', '帮哥师傅原型图.png', 'default/20180314/29eff39dff360c3cdf4bbda22eaaee4d.png', 'e62d778cc7fc9ce014ddf1c2eae326b4', 'adf5115952890ba409f9cd5afab778dc68b4fe05', 'png', null);
INSERT INTO `cmf_asset` VALUES ('168', '10', '271714', '1521015433', '1', '0', '920fcdc272b2c3ddb15f9a7d32f53a9867903c8c5390e7cb49c33e701b6fe943', 'QQ图片20180314134232.png', 'default/20180314/8d27e3bb0bbd87f12b3f5575e053935e.png', '920fcdc272b2c3ddb15f9a7d32f53a98', '1dcced6bc69d6137819e1d6c6076d12364c556f1', 'png', null);
INSERT INTO `cmf_asset` VALUES ('169', '10', '1169735', '1521080465', '1', '0', '714d3b2811b0fa52b691bc09c8dc74f75cf3eae5416b56d3969dcc55a0da70cd', 'QQ图片20180227093831.jpg', 'default/20180315/226da0ebe7db5aadcb6b0ca447eb4ce7.jpg', '714d3b2811b0fa52b691bc09c8dc74f7', '7c1dfe6d20d24eaac7874a1426f765b737fa7460', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('170', '165', '219938', '1521526419', '1', '0', 'edc3a69dfc99015011e0a0b8871bc4b7b3ce92da30c619083241e35fc0ea2b2c', 'timg (1).jpg', 'default/20180320/62b9668ed7a0d8a2e59ccfc35a274720.jpg', 'edc3a69dfc99015011e0a0b8871bc4b7', 'fa06a6fd76c6ae2398a390df501a47d60e02f21a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('171', '165', '16322', '1521526441', '1', '0', 'c535b3ec3c46773dd016cc2901a30c57e0fd583329dbb1f15775001809ad292d', 'timg (2).jpg', 'default/20180320/1aa179a521ab303c368745375fd763f0.jpg', 'c535b3ec3c46773dd016cc2901a30c57', '18de1976a06dc7cfb76809ae876870313fa930a5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('172', '165', '47129', '1521526455', '1', '0', 'fefe54269398491e991367c09ae016fbe45140c57bc426ac9feb2858d88ff4bc', 'timg.jpg', 'default/20180320/cb8eda1b84dba8aea2d763ca626daf2a.jpg', 'fefe54269398491e991367c09ae016fb', '3b1102bde9b52094f1c7b31fd1a9bec1f356dc51', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('173', '10', '125830', '1521615608', '1', '0', '1f86c2f230f8c3f45d3a3a936a9c3413fe2ea8a3aa17e8ab53aecb95c497b17d', 'timg.jpg', 'default/20180321/385a684b7bbbd06564489ced3a0b0375.jpg', '1f86c2f230f8c3f45d3a3a936a9c3413', 'c8bec57e8080d450754657e71cd631848f19bca1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('174', '10', '40835', '1521615630', '1', '0', '212bdf886d94acc35a8d287684c5e04aa0918f6bc72835789de9b572396b6700', 'timg (1).jpg', 'default/20180321/421778f0881e22a9c62160556c9fc155.jpg', '212bdf886d94acc35a8d287684c5e04a', 'dc17f612409402c1ff893cbce5b1fd42179cb950', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('175', '10', '56461', '1521615676', '1', '0', '72633a521323a89c4af191f9252d060d461a01f2f5c1e51c90d1c2aa21619c0b', 'QQ截图20180321145941.jpg', 'default/20180321/32f3ec02a2c4e08a7b8c0ea78c4f8440.jpg', '72633a521323a89c4af191f9252d060d', '4b1ba10eb9b614249b87514fe7841075aef4cf5b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('176', '169', '7800442', '1524730530', '1', '0', 'b02b70e9dcc1dbb0da518f55759467e6fa3fede4ad7dde84e3b487d2dfa318ea', '1845详情.jpg', 'default/20180426/c7b28659cb391d971c6a2239454de9cf.jpg', 'b02b70e9dcc1dbb0da518f55759467e6', '25ca11e4abb57eec6bf178ad411e3cb778b522c3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('177', '169', '604321', '1524730668', '1', '0', '8302237f344a81665bfb500c744e14c1354beb76224d6e671b4d009218f23e06', '99.jpg', 'default/20180426/1a0170de7bfcf164bebfad6432dab2f5.jpg', '8302237f344a81665bfb500c744e14c1', '311f3254d87c65bd8f8451814616904cec9add87', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('178', '169', '932266', '1524731574', '1', '0', 'f70612b8d198d0786585e402ae169b14da71bfc3b277b801b1167aba97c7bcc2', '2f950a93cb34defaa49d853449df2d117152766b33132-3lmyW9.jpg', 'default/20180426/f9cb5e15266cfaf3b68d1a3fa6a1a32c.jpg', 'f70612b8d198d0786585e402ae169b14', '89c3b21fb28eb86858e8ba487a00dba0fff435e1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('179', '169', '6732968', '1524731753', '1', '0', '1c62352c0cba17a1bb29e981c009a3ba7b327e832491c59513dd6de6dae9247c', '2232.jpg', 'default/20180426/2f92bff8dc3557a8b31cfb2b79c7501a.jpg', '1c62352c0cba17a1bb29e981c009a3ba', '07b40180167d3525b5689c73d313551304f51132', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('180', '169', '634140', '1524731864', '1', '0', 'ed65ebea1dab10c4a1f716ec69ded9b4839d6e165b4715f2f56afb41fef41fba', '33+罗佳玲.jpg', 'default/20180426/2020ce174b21bbfdd522ad6492f47d9c.jpg', 'ed65ebea1dab10c4a1f716ec69ded9b4', 'eac0e39a8bcb96505aaa6023d48fc54d216b4700', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('181', '169', '3277824', '1524731994', '1', '0', '417379a1ec6dbbc610bb5fb50286f3b95c384c92a3ec3db1821d22c2c0a1a502', '女包.jpg', 'default/20180426/49fd007b5eee1a8137b340fbc67659c1.jpg', '417379a1ec6dbbc610bb5fb50286f3b9', '4f793872dea20b5be31321c88aab36386ba3984e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('182', '169', '4025967', '1524732169', '1', '0', '89e65b82d495db7f27f02928d857fa8876559ee32b227eb5c6719ffbd7f052f2', '33+罗佳玲`.jpg', 'default/20180426/94f2a13e1c8fe0da6b5ea34187f1c140.jpg', '89e65b82d495db7f27f02928d857fa88', 'dfb2fe7d220ed128d768227e2351435b97d45236', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('183', '169', '881106', '1524732303', '1', '0', '7cee89bcafe260d95694c66d8c09c6e51b32291a1da2e03502bd9f12a60b8789', 'zhitogc.jpg', 'default/20180426/bd4c6353445fd52449c0f1940a9312ad.jpg', '7cee89bcafe260d95694c66d8c09c6e5', '70ed344ca9fb4b86eb43192f035626a2a22533f3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('184', '169', '779856', '1524732462', '1', '0', '2ec011a0d6a6988a9248d083f681fa4500b8e38c014a94ca9474b681fc495aaf', '苏泊尔豆浆机.jpg', 'default/20180426/5e95f2a87e25f31ac2d6f7f3b6c99263.jpg', '2ec011a0d6a6988a9248d083f681fa45', '8eac1b8d129cbc6c3ef6325cf9780a2fcb2cdd26', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('185', '169', '703430', '1524732552', '1', '0', 'ee1fba62843f8a0d8f00335bfafdd1e42eb29de4847686126d436837a99d1043', '康贝婴儿推车banner.jpg', 'default/20180426/8169bae72d7d71e65d9f2c97e91bccd6.jpg', 'ee1fba62843f8a0d8f00335bfafdd1e4', '85e6f3df6c511284cae6bdafecbd6964ece3ab62', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('186', '169', '8399986', '1524732966', '1', '0', '5b401181511fbd74c736359640eaf1e6c70698856360b2f25f71150633df6d1e', '双11pc-(3).jpg', 'default/20180426/7791068acbd9d755ca935a6244106e1a.jpg', '5b401181511fbd74c736359640eaf1e6', '4db972d34f041df12c1fd9f4f279cca53bea82d4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('187', '169', '382906', '1524733046', '1', '0', '1adbf060e278bbbb0cf88a804cc7de0d391ce0240d57bd44b064ac27bad6f6b3', '活动.jpg', 'default/20180426/5f9e38d14651e81256cd7128f41243bc.jpg', '1adbf060e278bbbb0cf88a804cc7de0d', '5b216910092a76b3370af094b6ba4a5f235a18bd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('188', '169', '6636590', '1524733203', '1', '0', 'abb7f56e97c9da24045ef3f5ef0a2dc3e7d174444d9d35198a31c7754e257980', '返场无线 (2).jpg', 'default/20180426/456181bf8fd1a6840d4814afb26f6502.jpg', 'abb7f56e97c9da24045ef3f5ef0a2dc3', '575f1e6f2b4767784b6ab723f54ba6cf20ae6c64', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('189', '10', '96613', '1524793838', '1', '0', 'ff795258e7fe3241dd94e99fdb3ab44372774288d28553b08a16c42931b7ee70', 'weixin.png', 'default/20180427/87a005d40f0f1ea236e0d63e47f5afa1.png', 'ff795258e7fe3241dd94e99fdb3ab443', '5cbe45a3ebebda061f9a8c9d043bc095686bad3d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('190', '10', '216774', '1524794943', '1', '0', '8dadc8f28c8dd2cf15cae3ca61ad48569acf49a0bc6376e92b5f699dc88db532', 'QQ图片20180416160045.png', 'default/20180427/4502dc859ef3bc2294d8be7c605f75cc.png', '8dadc8f28c8dd2cf15cae3ca61ad4856', '1732b6c26d8c1e552f3315965d67dd779d33c2f4', 'png', null);
INSERT INTO `cmf_asset` VALUES ('191', '10', '6636590', '1524795165', '1', '0', 'abb7f56e97c9da24045ef3f5ef0a2dc3e7d174444d9d35198a31c7754e257980', '456181bf8fd1a6840d4814afb26f6502.jpg', 'default/20180427/253eb74e1315fc580a2a29b4b3eb055e.jpg', 'abb7f56e97c9da24045ef3f5ef0a2dc3', '575f1e6f2b4767784b6ab723f54ba6cf20ae6c64', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('192', '10', '8399986', '1524796626', '1', '0', '5b401181511fbd74c736359640eaf1e6c70698856360b2f25f71150633df6d1e', '7791068acbd9d755ca935a6244106e1a.jpg', 'default/20180427/9abc1f351a41ed6c9df6ee9cb9681267.jpg', '5b401181511fbd74c736359640eaf1e6', '4db972d34f041df12c1fd9f4f279cca53bea82d4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('193', '10', '142016', '1524796715', '1', '0', 'ae05874837886674dd47079b43c535966b91ebc4f5ee2cbc437b53e95478dc2b', 'haibao.jpg', 'default/20180427/8b39bba3fb43bb8e66ef07f571e969e6.jpg', 'ae05874837886674dd47079b43c53596', 'a3174dd8f48b7744360b957743bce6562edd7d46', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('194', '1', '67052', '1524796868', '1', '0', 'aaa8ba7056485b974402017b6ccc964e63ece3ed0be21c21860dd9e0c944d61b', '201804274502dc859ef3bc2294d8be7c605f75cc-350-350.jpg', 'default/20180427/76abd1118218e2c11a38c09688f3e782.jpg', 'aaa8ba7056485b974402017b6ccc964e', '9917a6916fe943ae16e17288df08018791130eb7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('195', '1', '1209702', '1524798024', '1', '0', 'c61560ec41272c917661cb203ff40862866fb1556a4925cee837b493fb04fc8f', '5ae286dfae593.jpg', 'default/20180427/3ec2c4326c22e3cb1ad4513f2bfdb1c5.jpg', 'c61560ec41272c917661cb203ff40862', '38972f6b5a62c2d0446738f3bd9b84fae9e3dc4a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('196', '1', '142016', '1524798130', '1', '0', 'ae05874837886674dd47079b43c535966b91ebc4f5ee2cbc437b53e95478dc2b', 'haibao.jpg', 'default/20180427/8a2d51230aaf091335a99327a1c68c30.jpg', 'ae05874837886674dd47079b43c53596', 'a3174dd8f48b7744360b957743bce6562edd7d46', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('197', '1', '2053622', '1524798605', '1', '0', '8772613388bd014fab7ea5f7ea3c1f93911979103e11433913ab4de2e54e2487', '5ae282c2ad99f.jpg', 'default/20180427/88087234dbab46811ff6a81c449d2345.jpg', '8772613388bd014fab7ea5f7ea3c1f93', '8b7f02d2d736ed5d81cfc8c62054c3174bc299e1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('198', '1', '1331894', '1524798744', '1', '0', 'f04309b7eb8b4283d51268af75d175c55b91f4b37e4afda0a1c2d071ce0d8b23', '456181bf8fd1a6840d4814afb26f6502.jpg', 'default/20180427/90206dddca0194cf2facf992b9726852.jpg', 'f04309b7eb8b4283d51268af75d175c5', 'f5dd27ea3dc512f528e6d79670858267a698e646', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('199', '1', '20138', '1524799116', '1', '0', '462e91be58c11e465fe0bf7b44a977f5ebcfbfb7dc7c8bf96da4e7cdb1367037', '5.jpg', 'default/20180427/b1a32e398643b53334542d720dd7625e.jpg', '462e91be58c11e465fe0bf7b44a977f5', '01e1ba9b2927bc2dae27af92885245991ffa101c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('200', '1', '3532771', '1524800097', '1', '0', '4ba395fc8aa67f4be59bfdc5826c4c4200cb4597261514c77daf48e385917050', '5ae19ba5445f5.jpg', 'default/20180427/224b164b54e94aed47261dda428e6d01.jpg', '4ba395fc8aa67f4be59bfdc5826c4c42', 'cf2a561cb0543c65f3d74d567922413950523e22', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('201', '170', '996328', '1524882004', '1', '0', 'ec83a7a9d36890dd9a3196d2f2de34cbbfcccec980c970ef40303c43e02454fd', '1.jpg', 'default/20180428/05d92cf24ceef482e2211330ff422cd8.jpg', 'ec83a7a9d36890dd9a3196d2f2de34cb', '1fab3bb635a25f18f3f61d4d75179bba8cfc4bc5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('202', '170', '3459586', '1524882252', '1', '0', 'a33dc11b25cde9cdfaa132769dc22890d48334e26c95ce3d402ca558b87fab26', '2.jpg', 'default/20180428/8b73ac1f9caa71313e45381b777c6ed7.jpg', 'a33dc11b25cde9cdfaa132769dc22890', 'e408078de3257a206a7e8b85b378918e18193ecb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('203', '170', '588141', '1524882433', '1', '0', 'e5a888de263263cc9c4f17144382f23c65c476b73076fe678077f76f81674e61', '小清新冬天你好宣传海报.jpg', 'default/20180428/1baa99706424eb76e79df7ff60202f65.jpg', 'e5a888de263263cc9c4f17144382f23c', '99bb3f5cfceb3e2f19b261487998abbbba5e33cd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('204', '175', '1861035', '1524917477', '1', '0', 'f86ec811d97fdd8a722edb013aad8373f6e1b8dfcf09db542177f8a025816a55', '儿童伞透明不透明详情页.jpg', 'default/20180428/44fc69a42fd93d3710cb23566e0ce84c.jpg', 'f86ec811d97fdd8a722edb013aad8373', 'e3a60c23245bf485a4a3819cdaba4b7bdb5ca453', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('205', '175', '483378', '1524918023', '1', '0', '3ac67539e5aee4adb7997b7eec3fcef61dfac6b976c63ce908b7ee8a3a8a2d3a', '0122b15ae1ca85a80120927b9aee65.jpg@1280w_1l_2o_100sh.jpg', 'default/20180428/e3a03cb2212415d7139ace9afc260d9c.jpg', '3ac67539e5aee4adb7997b7eec3fcef6', 'c3c1905874ae775dc974066a6a2782eb439cd80b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('206', '175', '674074', '1524918094', '1', '0', '3b461e1f5df145313cd64b8a4d36d5dc1bb1df070f52a7af2df5fc72a9b1ad40', '01e6705adc2b0fa801214a61ca65b7.jpg@1280w_1l_2o_100sh.jpg', 'default/20180428/098cef59aad55b7186185a6c54d431a7.jpg', '3b461e1f5df145313cd64b8a4d36d5dc', '6d721cfef643a1172e75d437e6dd85ed6cec8099', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('207', '177', '2625922', '1524925054', '1', '0', '299989a9b504521d3c660f52e5d796b8737608abb354b67f1e26a20b58b1b7d5', '男鞋首页.jpg', 'default/20180428/6e017501ca69f41c83685eb71bd2d9e5.jpg', '299989a9b504521d3c660f52e5d796b8', 'c750822b589138d3bf62e5fdc176e39392554ec4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('208', '177', '118008', '1524925918', '1', '0', '4609caa90177f9ac7516e6b9c4f8268e13a2c70aa95d48d15229506bce4f6dbf', '男鞋banner3.jpg', 'default/20180428/2717339581b5b25f0c0c469571e39072.jpg', '4609caa90177f9ac7516e6b9c4f8268e', 'dc4c78ba2db20d6e2b688b9d4a436571b99d3a80', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('209', '200', '224472', '1525248805', '1', '0', '542d4f67faed8e04f0c375584be42193cbd092e358850ad1e53e01dd9b729cd1', 'logo2设计啊.jpg', 'default/20180502/74dd04bbfa21cca8cc2c9e8966dd4be3.jpg', '542d4f67faed8e04f0c375584be42193', 'd5a54645f8fd1cefec43ea7a16ac6418996fbc6b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('210', '200', '765293', '1525249138', '1', '0', '85837de9bcb902224c6e14716ccfe1f7b5179dd52be56e6ad58162bf15d4128c', '皇后特级.jpg', 'default/20180502/491fdb7af6e277f4c2eecfd07a52f67f.jpg', '85837de9bcb902224c6e14716ccfe1f7', 'd9a8e1ba424a9720b6f199eaa2f19d10613be9dc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('211', '200', '4249019', '1525249375', '1', '0', '2c99e2ff1349d77302e1f207be4d159e2a216d829661b903e6b04e925dd93805', '哈妮宝贝12.jpg', 'default/20180502/8df151be81c0fc3c498fdd4bdd8565cc.jpg', '2c99e2ff1349d77302e1f207be4d159e', '97a1e5c3e16c37aec5b7cd79d59118313ec96899', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('212', '200', '290719', '1525249768', '1', '0', 'c0aff071653af958a0d96a95a1e7ad0fbbea89ad530866c036467f5c7b4c3f4f', '1525249670(1).png', 'default/20180502/09cf023c119ad144a065af796caf2533.png', 'c0aff071653af958a0d96a95a1e7ad0f', 'a4cb98e422b90f152be4acb5bdc0f63ca9a6e552', 'png', null);
INSERT INTO `cmf_asset` VALUES ('213', '200', '408371', '1525249997', '1', '0', 'e3f9e92974990e41eb348270d385c581cc73d49ab151232dac6f48c2800a1531', '1525249909(1).png', 'default/20180502/4014b025928a00118e41c6c021a8e8ec.png', 'e3f9e92974990e41eb348270d385c581', '7c746e8cfbc8e4ee06f9dc087ab88fac496f118b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('214', '202', '2173169', '1525263490', '1', '0', '2154f4e9d454dd498c445b14779d542c3645725e88ad5a7f8c4deb48a6d5ae97', '男装.jpg', 'default/20180502/45c2f3e39704be8a8a85e76b9c2a355a.jpg', '2154f4e9d454dd498c445b14779d542c', 'c0bbc1f9f994631ac8776fce7220d0bcd63c8c56', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('215', '210', '3023090', '1525405185', '1', '0', 'ee7e57c57b6696c654e773cd987f8ff39c47764da7e4ce7aaa2aaeeeaa339630', '750.jpg', 'default/20180504/e451cae9ca2f548c9fa9dfd6c7b252cc.jpg', 'ee7e57c57b6696c654e773cd987f8ff3', 'abf5d7ec498e900d09414be8027b515ab1436f54', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('216', '170', '2648062', '1525424821', '1', '0', '173bd2ea75d6fdfba76af7d964fbf18c53521174c146ab36d1baf4272e58d8d1', '吃货节首页-(1).jpg', 'default/20180504/19ee7eb935ba63326826deecdede2bfb.jpg', '173bd2ea75d6fdfba76af7d964fbf18c', '4aad5de6f594e7ccb3dad56ce3ae5ef120b84d38', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('217', '206', '119971', '1525943130', '1', '0', 'aed3b25a4b9f5a8b233fb5a739fe5f44139860c7c2a73fc1b97f18b356dc93f4', 'center.jpg', 'default/20180510/888b40ab0907df307a1320ae9c470f85.jpg', 'aed3b25a4b9f5a8b233fb5a739fe5f44', '1461b1f4a7afd99d436e48a8a5cadadf4c046933', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('218', '294', '2549448', '1526273071', '1', '0', '0f5bf2d67d37e8429366587a192a0409e4265fea3d93d100d2373e7042270fc2', '小米1.jpg', 'default/20180514/f2f75761ffbc7c70f2ca6fa575768e76.jpg', '0f5bf2d67d37e8429366587a192a0409', '0d8ec650c5db11012cf5301b62f59ed85c968ec9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('219', '300', '2469197', '1526292688', '1', '0', 'c077567df1b96bcefd4ebb3616c97af70649618f772b22761bbf5400587a9bde', '冰雪节2.jpg', 'default/20180514/a602807812b90ccb1667e5854c496a6c.jpg', 'c077567df1b96bcefd4ebb3616c97af7', '18d1c27be9e7cb14b249e99f7e770b18f15723e7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('220', '300', '3170554', '1526292833', '1', '0', '84ffe1d406502a056494dcf4995775af1fe04821cc26e7ee20299a761d887d23', '女装页面.jpg', 'default/20180514/faff32cd4f54b4638bc1e58ff13fbdd5.jpg', '84ffe1d406502a056494dcf4995775af', '20dd99fa458ca26015e18bfb48c0ffa4764df4e4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('221', '300', '1901410', '1526292963', '1', '0', 'fe14a5db16db002e791eeb6f9f9377d2b18b0bf4c850583acf812371f40283e1', '圣诞.jpg', 'default/20180514/2d33d605e487b866dd9c640f5ce307f7.jpg', 'fe14a5db16db002e791eeb6f9f9377d2', '5c663547a5e340fc6aed4de157b8bd31c226aac1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('222', '300', '2739903', '1526293076', '1', '0', 'c9923773c5e7805031ca92ab999a3ea21960f2956c030b0a39e1ff46078dcea3', '首页.jpg', 'default/20180514/bc3a303eb3cead508466e480967838b3.jpg', 'c9923773c5e7805031ca92ab999a3ea2', 'f9c56ecfde331c40decaf9e0faa675a7916fbbb1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('223', '300', '2030436', '1526293174', '1', '0', 'fba903920ad31f2f0e79ac980094afec71e4484ad777606bc62264377c08fd69', '深秋页面.jpg', 'default/20180514/7aaed0d58ff9496415a8bfe10fb516a2.jpg', 'fba903920ad31f2f0e79ac980094afec', '095096974a3019dfe1cb305b465d0106445f6c15', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('224', '300', '1924739', '1526293262', '1', '0', '3eb509c85e8549af65fd65e6db318f9063ae2c5632ab104ecb96d737c54fe08d', '甘肃雪原苹果详情.jpg', 'default/20180514/b2baf2587297b00971d5c888fc64dbf6.jpg', '3eb509c85e8549af65fd65e6db318f90', 'b5ba4fa92550ba910e937fd2d5449cd401e31f88', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('225', '300', '2620745', '1526293415', '1', '0', 'c42ec98889a6b17f4d59b48e3aa25c6dcfabe849d244ede0b4ca9164a3944956', '188g山核桃仁最新详情.jpg', 'default/20180514/1e1ba74fdc81a0eabee625afc209d651.jpg', 'c42ec98889a6b17f4d59b48e3aa25c6d', '85453e133eb773d359b7ccfc3d482069c4b259a8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('226', '300', '3556980', '1526293504', '1', '0', '2ac8f5a5d700c80405e4b6b7793082e10a0e7338c92971526cec11b28bca0d02', '年货节.jpg', 'default/20180514/6d612e556356007517aa4c533777ac29.jpg', '2ac8f5a5d700c80405e4b6b7793082e1', '4307841f4d34db183cc270186a13941701d3e9da', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('227', '319', '401049', '1526433166', '1', '0', 'cfeff07621644723acf30562deaf8f94ef64fb0f4beb6ef4f1f4f13567388a18', 'webp.webp.jpg', 'default/20180516/b79ff4e668daf595e7ef645d661bf7ad.jpg', 'cfeff07621644723acf30562deaf8f94', '73d94bbabcb2aebf84b85c07904899d4cf2d2462', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('228', '319', '296051', '1526433357', '1', '0', 'a46e177dce6e4c04f908bb7e4195219889295733317dbcc213cea5e1c83020a9', 'webp.webp (1).jpg', 'default/20180516/887da053c5187f6e5b463289aa60a13e.jpg', 'a46e177dce6e4c04f908bb7e41952198', '4b1d6192405b167f2ab20623bab9b463cc60178e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('229', '319', '418518', '1526433572', '1', '0', '399456ac7a9025474fb9d31124a0a531135e5f9b516cd2d64072c3c34747b9b4', 'love520.jpg', 'default/20180516/303e64ddf280937cfcf4727d2db6c3cd.jpg', '399456ac7a9025474fb9d31124a0a531', '6c6db6975a7a839ddf052c1b5221f6aaa2071e02', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('230', '319', '91895', '1526433693', '1', '0', '2fd01ac2a8894b955941b8665d25ed741551fa7d7ec43fbffa7a5d3efb091666', 'webp.webp (2).jpg', 'default/20180516/d20816f247f2fa26cfd032d2ecdbc31f.jpg', '2fd01ac2a8894b955941b8665d25ed74', '2b070958b7abb1e7013e3bd0dc5105d8bafc9e9f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('231', '319', '99483', '1526433850', '1', '0', 'bb24d010a98b399721fdc99dd4abd0df3357f8d3b51a04dbad9f5b0eddee5d18', 'webp.webp (3).jpg', 'default/20180516/e4d1b3e606f5e4344a7b8cb0f8e7b674.jpg', 'bb24d010a98b399721fdc99dd4abd0df', 'bea352a40d61290d0eac69acfdc32dc1093d4eee', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('232', '196', '891309', '1526434695', '1', '0', 'b922febf93b271fadecb9f7cd24fce6ef4f70cb79ee3351230f3ddeabc80670d', 'QQ图片20180514115735.jpg', 'default/20180516/cd0178e8526a03e92b534390941d8cf0.jpg', 'b922febf93b271fadecb9f7cd24fce6e', '683dfdd0964f2bd52bc5c3d526b20f3d467bc37d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('233', '196', '2941062', '1526436621', '1', '0', '880081d55d7c95e2e576b149d2cd7872d8e7633b51860e35d038a3f468003fb3', 'QQ图片20180514115753.jpg', 'default/20180516/a5e7f417f27dea4395f829723a797f37.jpg', '880081d55d7c95e2e576b149d2cd7872', 'f094dac5ff9b419709429fd9fa4f7c90e9dfc7dc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('234', '196', '2680435', '1526436778', '1', '0', 'a177a956fbd9dc3ef83a29e9176c8984b9895e5660708db9bad4d3e34ca95d74', 'QQ图片20180514115803.jpg', 'default/20180516/80e63d553cdfbd22e74ff097e0215452.jpg', 'a177a956fbd9dc3ef83a29e9176c8984', 'b475f9083a07d4719824b1c5a124f0abb2305349', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('235', '328', '4725061', '1526449432', '1', '0', 'f6061dd5a42f10b612c73b7bcdde5b526cf081b80d519318f46dedb539afd364', '化妆品.jpg', 'default/20180516/2e1afedd23d685b9b6368051cea2978c.jpg', 'f6061dd5a42f10b612c73b7bcdde5b52', '94d023c2bfdddd68bae44fe5e9166b675418c62d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('236', '328', '3204921', '1526449867', '1', '0', '5a9c6a10ac3d10fa8bd7862d96cf35808503a5d4518766c70940f0b86f3954e4', '家电.jpg', 'default/20180516/c20e7284fb23ec22e912de657b3e1723.jpg', '5a9c6a10ac3d10fa8bd7862d96cf3580', 'ef3267bc630f747a11ba8ee1d1b05661f55732b9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('237', '328', '1701226', '1526450189', '1', '0', '5d79fc557dc2c1c29c2c3f06af761fea6bde449827381f276debec7a5d20bb77', '家电2.jpg', 'default/20180516/2d4105b51318644dad7dbf035ee4ffb6.jpg', '5d79fc557dc2c1c29c2c3f06af761fea', '7dea076a24aa620fb1b874a035c36d933cb925f1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('238', '346', '2050423', '1526537096', '1', '0', '01123e40fc238cd392eb69bed7a33fe6b8079fdbce19c448c4d768064702c678', '0148ea5aa9e44da80121246d7eb2ae.jpg@1280w_1l_2o_100sh.jpg', 'default/20180517/6c3872609d1f087b10bb0676d2791514.jpg', '01123e40fc238cd392eb69bed7a33fe6', '21864d4ef91947796bde7ea86df731b9b2fb6f14', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('239', '346', '1886328', '1526537112', '1', '0', 'd9f7183148cd800800438aa1355582f56dcfed5584b17a565819158c58e162d0', '011b6d5af94a40a801207ab49fb919.jpg@1280w_1l_2o_100sh.webp.jpg', 'default/20180517/9ca16a3842375748d5684e593768acdb.jpg', 'd9f7183148cd800800438aa1355582f5', 'aa5adbd5d4d0e6c29f0a447e3272279fff8f0870', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('240', '346', '1577919', '1526537331', '1', '0', '575a35cb0f156986e25db7e35a7b08e233736788830a6a2c20b2e7e2646b342b', '01b5725af527b7a801207ab4ab9fa9.jpg@1280w_1l_2o_100sh.webp.jpg', 'default/20180517/07de38f4c0e3908f76fb6365812dabfb.jpg', '575a35cb0f156986e25db7e35a7b08e2', 'bc89d7741074535de7d9b87ea0389922731a4013', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('241', '346', '3160810', '1526539656', '1', '0', 'b213274b36de6254f0166745e6d31251cb65e04f6d939d5a85b54ff217400526', '新首页2.jpg', 'default/20180517/637f2c729d96eec73c27e379f84d5031.jpg', 'b213274b36de6254f0166745e6d31251', '0457b0f308db5309e2626925a1a8aa5ed02e7f8d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('242', '351', '255951', '1526543720', '1', '0', '07016e66ebc45b4f4d04303592771c3115de3fb3681cb92f5d8ee0db7832eea4', 'T.jpg', 'default/20180517/f01edf9a2c0dbe4a5f6d91014ed7a523.jpg', '07016e66ebc45b4f4d04303592771c31', '86e6919e172b5852dd202903683b877092f2104b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('243', '361', '1223639', '1526625010', '1', '0', 'a05884259afce8c1b72e01b871a32b596ef3a4d0c9f7cbe3a7cb2e9b9781e9e5', '1066f670b90f9519afcf6862df240ff15bf4059f12abd7-cYcWEI.jpg', 'default/20180518/f73edad5e95c6e7c7e095b853713c3eb.jpg', 'a05884259afce8c1b72e01b871a32b59', '1066f670b90f9519afcf6862df240ff15bf4059f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('244', '361', '1727661', '1526625815', '1', '0', '6c9a80dfe4ddb8adb7609e42c67ee75f9af28d4db51259696c939635bdf980a3', '1231.jpg', 'default/20180518/055a4bb6c6fbeb58112efd5980263d9e.jpg', '6c9a80dfe4ddb8adb7609e42c67ee75f', '5384063bc3a3d6a0b7c9a7ad3b4027b1190f1d6e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('245', '371', '468545', '1526651383', '1', '0', '96d838bc40b14bc90173863756e3488b77269462269f73d1310c2a511ef71dd1', '首页.jpg', 'default/20180518/827bee0b2bed082aac601578f003f9c9.jpg', '96d838bc40b14bc90173863756e3488b', 'f6ecd6ffd4d7b27e5ba85934145378e08b154742', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('246', '371', '1774691', '1526651493', '1', '0', '679631105a52d7557f68564c32a579959f067991d280af88d333a1cb13ebb0c6', 'PC端首页.jpg', 'default/20180518/f20768719304bdb5ec1786c1f0baf7b0.jpg', '679631105a52d7557f68564c32a57995', 'ac649b8606fd1845d7da13ba8b27e55ac292f722', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('247', '371', '1247446', '1526651609', '1', '0', '94859cac934d90b393a655784d4d18457bf72c69fe8f4c07737f24f26a307e96', '承接页页面.jpg', 'default/20180518/7e4f79402ff99d5e725fb70fec399f80.jpg', '94859cac934d90b393a655784d4d1845', '4bb3820c53b8ecf4eac25c820d8041302dda64b8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('248', '381', '2058627', '1526714819', '1', '0', '5f51431e8bd75c55681bdfcebf548a3b1bcaf0d821cb65c7e4f6b3729a0ab5e5', '乐透云南.jpg', 'default/20180519/4157ff0ae030e27281c3cea8ea2c4ea3.jpg', '5f51431e8bd75c55681bdfcebf548a3b', 'ab5f777b16ef129860cf5a84585bc2f3420d7244', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('249', '382', '4386195', '1526719325', '1', '0', 'd370bf69188bb3ff78c888e8936b6e24e0011961c706144ab5b0a756410bb6c2', '店招2.jpg', 'default/20180519/4d6049d472512e9160dcdfdf3ce7b2ca.jpg', 'd370bf69188bb3ff78c888e8936b6e24', '0de1d74471ae5347f20039f23ff68eec9c1129f4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('250', '382', '676873', '1526719698', '1', '0', 'c89a15532015d910fd838f32e71b147a6346a9a223b457b081d0a4d65e7f38bc', '店铺装修.jpg', 'default/20180519/1f39979ac73c6d3c0a0af0f3cf98e557.jpg', 'c89a15532015d910fd838f32e71b147a', 'b7266fbeb130cc2ab9e447e220a88d04acbf1bd7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('251', '382', '742511', '1526720180', '1', '0', 'e2be5182a0c946fc0158c6c31c76454ead97ac08b30392eac96bbecad778c194', '荧光图标.jpg', 'default/20180519/6848fba55e562ff20897197a684ccf26.jpg', 'e2be5182a0c946fc0158c6c31c76454e', '4d6e6bd7f083b58056add6f9edaade67be028f10', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('252', '383', '4761175', '1526726058', '1', '0', '138ef592d8f9362737a3e5a682b5033be3e74c73f78618cbed20450205413678', '家具首页-恢复的.jpg', 'default/20180519/f962c47f4a380dfeddc101e20fec3cab.jpg', '138ef592d8f9362737a3e5a682b5033b', 'db112652ba3b0f5643c2cfe7f0a923f438ad6461', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('253', '383', '583988', '1526726274', '1', '0', 'bfa64773df26f4e0a0a2b33e30456e8f0eba4c8a33b3da995649f6530569fb73', '缩略图.jpg', 'default/20180519/67ce4ba14e59eab57c232d1c7ca13f2b.jpg', 'bfa64773df26f4e0a0a2b33e30456e8f', '7d0f88d752ccdc493ccf218d91c9c5dcbeb64f1f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('254', '383', '670912', '1526726381', '1', '0', '8ccc402984d927fe297382495160d73ec75b9c8312f843a27f64e0266dbeeba6', '缩略图.jpg', 'default/20180519/532e1a50d049c020e8f64cdb8b70d5c1.jpg', '8ccc402984d927fe297382495160d73e', '31383428fa5695f8d2756563849587103cbc5c3c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('255', '389', '1687254', '1526793468', '1', '0', 'd8cd5e4d406243e7c3dbb23eee8c5a7789e72971542f85d9199df511eedbfdde', '设计详情页.jpg', 'default/20180520/49a4254ba9ab5287414a7a75921a4de0.jpg', 'd8cd5e4d406243e7c3dbb23eee8c5a77', '8eb73762eae5efda06cf63085cdd96a667d862de', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('256', '389', '300364', '1526793587', '1', '0', '6cc295788221b939f541cd5b9cf837b4c4b466508ade9c33c5c79ed68247f3bf', '917870142755391777.jpg', 'default/20180520/782cc732d54c0cf2f355d0048e4603f4.jpg', '6cc295788221b939f541cd5b9cf837b4', 'f1a65fce48599d9380b110cc46659f32a2fb8fed', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('257', '418', '3402626', '1526966934', '1', '0', '6ba4c68810b5d029dea1d9f5d91f19bc7d46d76dc4c446dbceb13d3ef29d70d6', 'BH180101.jpg', 'default/20180522/db24fb74ddfd222f51cff4f89dcf85ea.jpg', '6ba4c68810b5d029dea1d9f5d91f19bc', '76982f6857c3beb74cd1d4ba325e1a65a6048fa9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('258', '424', '632210', '1526977675', '1', '0', '95f10c4ce6bba9c84a782e998cb89f07fff7a8aebcf0d7b49728330b43adfa43', '1526977574(1).jpg', 'default/20180522/f6d49b6b42a671115a7f618f179ab7ac.jpg', '95f10c4ce6bba9c84a782e998cb89f07', '1be41758b4b6c12414b125e211f11ab24a8d9772', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('259', '433', '4915251', '1527042631', '1', '0', '6e90e3ee12ac794d2faaef736e797d50815852f15ef2d473be05fa8b212bb9ad', '111.jpg', 'default/20180523/4bf6f07b60c8f60b025039f205a57c90.jpg', '6e90e3ee12ac794d2faaef736e797d50', '45dc10d7c79038218ae75c93f7c7085eb1672dd3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('260', '433', '4961229', '1527042858', '1', '0', 'd83c30a43c39fd74bc9f4ee5a3cb6e737c7264e2ae56718f28efd0cf5396f920', '1111.jpg', 'default/20180523/82ed1061a2e3c3e18ee76912930def38.jpg', 'd83c30a43c39fd74bc9f4ee5a3cb6e73', 'd31bb5e2ad3c132bcf259271b029db2231aee46a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('261', '457', '5037140', '1527134667', '1', '0', '3e405b9ab05337acc4c58d6a3d5282de4948342c4ec8245193916cdaf4e3baca', '海参首页xiao.jpg', 'default/20180524/29b32744ba0590067c128cb4cd85af17.jpg', '3e405b9ab05337acc4c58d6a3d5282de', '4ce39a2f00107330323933b7dc785dba16648470', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('262', '319', '258584', '1527145958', '1', '0', 'f34fd27958465ce907c56458540829e5ca86feba16d0e01ae3f511d6abac04f3', '618狂欢购.jpg', 'default/20180524/5dd3ab715ca3942ae5fc956dc4ca4d1c.jpg', 'f34fd27958465ce907c56458540829e5', '14521e558fd1aa77af8df386bf553dc53f8f12eb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('263', '319', '527923', '1527146108', '1', '0', '1a7f8ad14ff23dd545dda4d3317e5113016cb4933b97087a22e65a7897f50c6d', '红包.jpg', 'default/20180524/ba9970b65f20a3b4612fcbb041d53a90.jpg', '1a7f8ad14ff23dd545dda4d3317e5113', 'c898745a32b2d4fbb7a1cfba25ffc3e2b28093d0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('264', '464', '1264274', '1527148839', '1', '0', 'eae6cb1d3abcced998471bf3566f5550c2e1ef708be7da37ff95c05149a23a1c', 'L226.jpg', 'default/20180524/10dce67ce90af1137f370e16ac450c44.jpg', 'eae6cb1d3abcced998471bf3566f5550', 'a1cafe7acb219726bcb4eb6c1a7116c42bd2aba8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('265', '486', '3725243', '1527243794', '1', '0', '7900fed45e8538736fc088696a9d163ecb8b10ed2e07f19817aca15ea14e5787', '零食one.jpg', 'default/20180525/cd07f77366484d88e86d49d353809a5c.jpg', '7900fed45e8538736fc088696a9d163e', '4ff3b46e47c70af72c2137a13c017ffc661d2bee', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('266', '489', '4776352', '1527258245', '1', '0', 'c7eea66e0fe7b43f9ec934fb38541e7eb86569fc6c7e588f976ad412753085b1', '公司首页(定稿）.jpg', 'default/20180525/fca8ba505bafa8e5579028eebdedd3eb.jpg', 'c7eea66e0fe7b43f9ec934fb38541e7e', '4c789db207da913f7f1895e1a9cd8524c35c25ee', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('267', '489', '4937933', '1527258640', '1', '0', 'ee514e8617559c90339f6537f470c43ad13ba33a3eba1982a75df84eba9bab48', '千叶彩妆首页.jpg', 'default/20180525/5144fa20a7220b4cb121cf06950e92d3.jpg', 'ee514e8617559c90339f6537f470c43a', '6ac51185a2cdc336da5c67070eac7791f7f0e428', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('268', '489', '4223495', '1527258790', '1', '0', 'c2e463c5a71f6c30ffd4220b0911678966059f30ad5f30afb3ebbcd4b4658982', '电热毯详情页.jpg', 'default/20180525/aa66b5a8eeb726b2ebe5325edd75dd13.jpg', 'c2e463c5a71f6c30ffd4220b09116789', 'f14a592f6d635914b628948acfa481c63160a28f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('269', '489', '4448347', '1527259015', '1', '0', '3ea35e9bb9643f96aa6fde0e7d63ff5f865ca4886c77707522c988b494648a7a', '爱兰c1.jpg', 'default/20180525/e530de491958ecb58ec71cab37332205.jpg', '3ea35e9bb9643f96aa6fde0e7d63ff5f', '9bbc463b4d43165d7d96cdefd21588d5ea4886f8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('270', '489', '318769', '1527259107', '1', '0', '3864393be611cbe534bc810df950b465198f64162ff57832ae65239d54ff34fe', '1.jpg', 'default/20180525/4c9c4ce9626938ff91b407df102a0294.jpg', '3864393be611cbe534bc810df950b465', 'e9c4e5e14439636df88a1343246026d2b34d7473', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('271', '489', '206837', '1527259314', '1', '0', '58ad934538c457f7a056b5e9a31a4383ad5a14ac3d124cd64de4293c18bbaff5', '产品2.jpg', 'default/20180525/1796f9f3a57fe102ee12ccc13c0dc6ca.jpg', '58ad934538c457f7a056b5e9a31a4383', '746dbc28f033211e67af7e14ca745437adc06b9d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('272', '489', '196798', '1527259400', '1', '0', '2dc4e1e65dd85676dacdaef2a8b61d74caf27fbff908ec00786b1928d07eadac', '产品3.jpg', 'default/20180525/5fc71072574baff7b98dd0b2592d8522.jpg', '2dc4e1e65dd85676dacdaef2a8b61d74', '87553b1401519b0dbbf9c2ead5877b472e3bf112', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('273', '489', '206780', '1527259460', '1', '0', 'd27de8c883ceb5ad39e4eb2fac0916efbc1b2a6bc4f25166e43c287705dac3ac', '3.jpg', 'default/20180525/9aafe6a1b7cd19087be76ee28febfb16.jpg', 'd27de8c883ceb5ad39e4eb2fac0916ef', 'ef3de17a5c71091beb5ec88482e2c4833f9c714f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('274', '489', '479405', '1527259501', '1', '0', 'a38d0271eda6e5dae4fb1b69932978d6bca593a131473cc85d546706b721ae09', '前置过滤器主图.jpg', 'default/20180525/27dc38fb33247f532f70dd6556e5c90f.jpg', 'a38d0271eda6e5dae4fb1b69932978d6', 'a745768bb0c40866ff51a4133714adf0a8ec2b72', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('275', '489', '4957006', '1527259623', '1', '0', 'd74e48b0f80225b60217c8a02d66f9da053f65ddaa13b6965bf6711dcaaf0282', '防丢绳（锁扣）.jpg', 'default/20180525/db0d79549f1c44b91c46b26caeef117c.jpg', 'd74e48b0f80225b60217c8a02d66f9da', 'a48662490c30039cce9f6cd350bf43f44c686e1f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('276', '489', '5015516', '1527259743', '1', '0', '88df80334fc3c1477fa8f5feeb4baacd651239791d97775e700c5262154a9a3f', '佛珠.jpg', 'default/20180525/40d5fb158624d636875c6138d7c4f838.jpg', '88df80334fc3c1477fa8f5feeb4baacd', '60dcf3547c7adc23da7fb8c19bcf45bff807410b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('277', '501', '553694', '1527389910', '1', '0', 'cd066a11a83f818f959d6411ca0ebab461c51c1e717efb4353b5ff3fc4e4bd89', 'ww.png', 'default/20180527/ca8006a15491cf66c46bddacce2ba371.png', 'cd066a11a83f818f959d6411ca0ebab4', 'f61f7facc67d50448a1a2f596a9d8dbce2c9c5af', 'png', null);
INSERT INTO `cmf_asset` VALUES ('278', '501', '2192583', '1527389985', '1', '0', 'df051ebb62d9dd3f006746dec4df2d877b0b97db4170f847d2f00a44d74f3e8f', 'Rectangle 9 Copy 18.png', 'default/20180527/61c265ce3579a289f9c7435044126eb7.png', 'df051ebb62d9dd3f006746dec4df2d87', '7798ec914ae947942c8c96f993a142aee42aa0dd', 'png', null);
INSERT INTO `cmf_asset` VALUES ('279', '501', '2037833', '1527390152', '1', '0', '575755824f0f582f85722e1518c1eebeb4e8fc0db69f4239ba81c9ae53528b6b', 'll.png', 'default/20180527/1bc2526cd0673b6e3a56cd92df136c18.png', '575755824f0f582f85722e1518c1eebe', '1b553c76d64d6c4b4a528b24e5be95e63b505e03', 'png', null);
INSERT INTO `cmf_asset` VALUES ('280', '502', '813154', '1527398943', '1', '0', '4f7c8d2f18e772e36cdf4a634d4f71cf493713d6f300bc669c57e2767a37d0f2', '05251.jpg', 'default/20180527/e780a8eb3673594879b0f0079b5db918.jpg', '4f7c8d2f18e772e36cdf4a634d4f71cf', '6fd7c8625754bc024d4f7d247d10b7634c826aba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('281', '502', '424725', '1527399179', '1', '0', 'fb35f2568d00aef1680d4836b395e598066bdee95b17e5138574bc23b62ff2a2', '0521.jpg', 'default/20180527/861830cb1dcfc2ea18a5ad8f2301f55e.jpg', 'fb35f2568d00aef1680d4836b395e598', '2ca6a4757289e59f3b87f66da3f4109ae93e505f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('282', '502', '397404', '1527399447', '1', '0', '86f2eabf64fdf76cb7c135216134e2a735d4f3df313e79077277d69e0a6e483f', '02.jpg', 'default/20180527/1640c62a74ac5b3958f12f0db785a5a2.jpg', '86f2eabf64fdf76cb7c135216134e2a7', 'c8802d10c2109e295f2ca2dd4181eab42994a071', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('283', '502', '528646', '1527399522', '1', '0', '2eb5d0fc9f7680392b22bdec334045baf62269e00407467f35d998653d8a4b00', '03.jpg', 'default/20180527/3bb648d36c347cee6fd88334e0a14e3d.jpg', '2eb5d0fc9f7680392b22bdec334045ba', '66c5734851b38d33e15a119142095088b4d048ff', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('284', '502', '253330', '1527399586', '1', '0', '723ab063a25a9ab6858ab63ee3293f782044cc41d85febd7cacc4108869cf364', '08-800x800.jpg', 'default/20180527/9ce2736f0bf444e13ca926f7b56a852d.jpg', '723ab063a25a9ab6858ab63ee3293f78', 'c9cd743876e79f40bb7a3d8ed90f6ee83df99d79', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('285', '506', '3137505', '1527406848', '1', '0', '6cfa4b303708b169975826c45de1c4abe19c7e181418c17cde1bc2bcc13cb704', '水印.jpg', 'default/20180527/e9bfef17a76dfe80b5509bab608ef10a.jpg', '6cfa4b303708b169975826c45de1c4ab', '0d757e8575662ecbc62eb37599ff1cf311f314a5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('286', '507', '165553', '1527408539', '1', '0', '1a5b73d3c4b7dc5db014aa99522076cf1348aa9689b541c0654bc7c9217d44c3', '一本手机端2.jpg', 'default/20180527/d69469ac05902228fe4def0dc64c0ff8.jpg', '1a5b73d3c4b7dc5db014aa99522076cf', '7e712209e5ff1036eea07ce9a340d041c8d75c5a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('287', '507', '397491', '1527408573', '1', '0', 'fb6d9b37adb54e8a8b4fb190dae96adf6c34d9f4cf11f782f17c315bcde99d0c', '1.jpg', 'default/20180527/86eab1f48397520253a3a416a0edfab5.jpg', 'fb6d9b37adb54e8a8b4fb190dae96adf', 'd506e4481e54a11bfac87d41973744cf764998c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('288', '511', '803957', '1527419583', '1', '0', '2014e779bc34ea872a0bdaabb1f6cc92f106e6887284b060fc44f636e968dee5', '对比(4).jpg', 'default/20180527/568a55c6b458944019d1041209108e50.jpg', '2014e779bc34ea872a0bdaabb1f6cc92', '72818b1e0a78c44f2fbb9e4c4da3aa5c0dcc5b86', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('289', '511', '614636', '1527419672', '1', '0', '4d8c3c68a5b3e52f1dc97f8fa5588f1f5dc557350a3efbf623a2936c5d2e18ec', '男鞋精修.jpg', 'default/20180527/7e537e0ba178cacf4073ae0d97f10868.jpg', '4d8c3c68a5b3e52f1dc97f8fa5588f1f', '7ab4fb8da973e739b236fc3963f899215941f009', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('290', '511', '929825', '1527419732', '1', '0', 'f2458f47b88ecae71200798e689a97f02a39d2c4a6f469516b247cef1569d4e1', '欧莱雅精修.jpg', 'default/20180527/893b017de27b2116d199756bbd32bca1.jpg', 'f2458f47b88ecae71200798e689a97f0', '8262602a76be2a1481954a0ed2775d259e62397e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('291', '511', '481371', '1527419794', '1', '0', 'a7d74a73fbe54d6f2341616f02563b0f078df2f1955f006707569c5343c09dcc', '口红精修.jpg', 'default/20180527/3dd3b8fd49bfc148474dbb4cb457a721.jpg', 'a7d74a73fbe54d6f2341616f02563b0f', '8552de0f22a7b68b71133712e2ed2f49f8145dc6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('292', '511', '580034', '1527419846', '1', '0', '0fad984fe8bf010bd9143a110f02f1cf8ff822aeca4bc6ded162f61415a06465', '对比(2).jpg', 'default/20180527/873646a2b4942bbe65ee7e7997a544ca.jpg', '0fad984fe8bf010bd9143a110f02f1cf', '6053128439d1babd79b0cb0d565c6bff90a7b488', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('293', '511', '266938', '1527419931', '1', '0', 'cac336a4763cde0aed5cb41b38ea971335c9f0a4890c9e8eaf8d77cc9f9bac44', '对比(1).jpg', 'default/20180527/d06001308255a578cefd2d9f623f024a.jpg', 'cac336a4763cde0aed5cb41b38ea9713', '98e5edbb7dc57de32b5343081a12acc9277b139a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('294', '511', '505504', '1527420037', '1', '0', '81aa7656dd4481bb3728c3ec1a79ffe88af45258273bf8449980952c9a579f1a', '电热水壶修图.jpg', 'default/20180527/54781b0bbdf1f3438d313030cf71928d.jpg', '81aa7656dd4481bb3728c3ec1a79ffe8', 'b9ca2aae2ac9621e1938deb861c71192de852961', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('295', '511', '521667', '1527420094', '1', '0', '87647bc38fdbf1a8d1c2164f4811e4741b0574dda12f78ac659a08871c05c833', '对比.jpg', 'default/20180527/1ff80b510ea1eed24201a976605dd884.jpg', '87647bc38fdbf1a8d1c2164f4811e474', 'd4d4e5021e79b96a5a2c5668fc385e58f79ebaa8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('296', '511', '371337', '1527420165', '1', '0', '4f81e2cd110e65a33ef276e0319f96492c953074293c18453e3d690e09b1030b', '酒瓶精修.jpg', 'default/20180527/4fc1bb7624050690aaff07b7aa9dfe3b.jpg', '4f81e2cd110e65a33ef276e0319f9649', '69b126afa5f14e7f7e9143a49c387e0477bab9df', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('297', '511', '1422727', '1527420232', '1', '0', '495933bfcb0b39c4cdee7fbafeebcf02ef07d7ec0de5c803530fd432cbbed216', '双诞海报.jpg', 'default/20180527/7680e7febbf4df94e61a904971103aa9.jpg', '495933bfcb0b39c4cdee7fbafeebcf02', '9f87432c90687f2e17b29d34c944101016e84dcd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('298', '511', '3131754', '1527420469', '1', '0', '67b0a9fd2cbbc698269676c2f98f6fb28b22a4b12c19ac43f2949ab054fb12f1', '思无邪.jpg', 'default/20180527/254108557e0577440a09ac7fed2b7c3e.jpg', '67b0a9fd2cbbc698269676c2f98f6fb2', '55f12a86b3a4f7860f84c2623dbe74b8b42172cf', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('299', '511', '422349', '1527420641', '1', '0', '4a2ae32e7fbdea8dccc5101788514b66e3f671f8834158fd6e515be12300f55a', '1920  600.jpg', 'default/20180527/790d2417412f8e4220c59d33d0d1d1a4.jpg', '4a2ae32e7fbdea8dccc5101788514b66', 'a2ae8c4e0009c1bc1087f3fddd175113b7df9dc6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('300', '511', '2688637', '1527420762', '1', '0', '64c8a8730d1dc6fa75f5e0e34df54d336775636ccca0892cd2a474ceccc098a2', '首饰1.jpg', 'default/20180527/1aa3ad54fa1edf5c90b6fc9de9a64e5a.jpg', '64c8a8730d1dc6fa75f5e0e34df54d33', '048cb06fe5fcddb4b1abb4d02a5ea72ff38cf81a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('301', '511', '931710', '1527420818', '1', '0', '9ae5bf7afc1391d62bf43aca1fc024193097f2c882dc105fcb3e6f19695b3546', '首饰2.jpg', 'default/20180527/8ee19895c5275e7e7b946bb14df4e72b.jpg', '9ae5bf7afc1391d62bf43aca1fc02419', '53d59bf59695ffaff9c6b0abaedcc50b4ade8040', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('302', '511', '895593', '1527420879', '1', '0', 'b4f14ed067e504863fa85292249a2f1f2680d7c0e0b1c7b333d4d2172f7da4bf', '香水海报合成.jpg', 'default/20180527/703afcf9c07c12b957aba8e777cb90a4.jpg', 'b4f14ed067e504863fa85292249a2f1f', 'c8ca17e5542440f67d37acebeb8bf888eedd85c7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('303', '511', '618026', '1527420938', '1', '0', 'eadaeec06bfcf36da24cbfcdc7caa0ab44255065f6b79a3bf2af021610721977', '轮播1.jpg', 'default/20180527/1d51c6a68684bf9c5d70b319f3885c76.jpg', 'eadaeec06bfcf36da24cbfcdc7caa0ab', '05a9eade312c1f02217976494f98e2416ce7fecb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('304', '511', '5128758', '1527421180', '1', '0', 'ace87f109e9af178b8138a6cdb9cfeacb81bd9fb20780fed054dccd6d2db2757', '最新模板E0120.jpg', 'default/20180527/5f93c1307d9898641906ce0207df0847.jpg', 'ace87f109e9af178b8138a6cdb9cfeac', 'c6ac282bc468931fac93022dd1db6cb62377ef24', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('305', '511', '4901235', '1527421375', '1', '0', 'bf4f5274869b2fbc50cb0e086825ebebd382f2b945f31c984f0cffcd1c9314f1', '整的.jpg', 'default/20180527/f0ffc8d5707a6143a8e94dda7cb3161c.jpg', 'bf4f5274869b2fbc50cb0e086825ebeb', '3de37004dbe2615b7c7b4fe77ce1a6d7778e2300', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('306', '511', '980897', '1527421459', '1', '0', 'c0e1cadcc2a9277f6f24609b5e97ae13f1f12bb8809d50a9f739b3a6de60d70c', '秋季关联页.jpg', 'default/20180527/df91f5ba4295b14c65824a5a7f6aa191.jpg', 'c0e1cadcc2a9277f6f24609b5e97ae13', '70942d3224782995fa337425bce17891ffe3c643', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('307', '511', '1808522', '1527422241', '1', '0', '531b7eb71c68deef78f7cb6260879a1768d7e05422966f02ef1d7b20945b122c', '1060  6G.jpg', 'default/20180527/5b94b2f040d4687075c56ab2b412f075.jpg', '531b7eb71c68deef78f7cb6260879a17', '9caa1c9b69e5f862e5ecbf4c86e0b4a566870577', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('308', '511', '3250537', '1527422310', '1', '0', '74fe38677a07615a92aa77f9e2d6f66733a89f51a895bb70b8ea1a9697e40935', 'pc.jpg', 'default/20180527/d1171d8233b1974f333e25a32db407ba.jpg', '74fe38677a07615a92aa77f9e2d6f667', '466133f19bb06aec8e45d3704c3df04f65538fb6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('309', '511', '2172061', '1527422386', '1', '0', '8adb1b227fec00c5ea5171a9db0f8b3e9b8eb50e84ecf5e948795a250d0f116e', '特色介绍页面.gif', 'default/20180527/4b85a4c0817dfed81db71f9d3e7889fc.gif', '8adb1b227fec00c5ea5171a9db0f8b3e', '096d46ba62e2181d14a5b01aa1e3c09978de35d0', 'gif', null);
INSERT INTO `cmf_asset` VALUES ('310', '511', '3303509', '1527422626', '1', '0', 'fb77b9fb070d3920bb3688216e55e80b0d32db22ae7745680b8bc6e9f6976e4a', '整个.jpg', 'default/20180527/868d2b2112882d2c15e1a3d0ab418f72.jpg', 'fb77b9fb070d3920bb3688216e55e80b', 'cd6d27322a55aa88373b9700a16204d647c3d49f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('311', '511', '2266090', '1527422845', '1', '0', '58d4b6170458d81ced4ff21235ff52fb78287192fb316cd3b5d1197ae0a5c652', '无线端首页.jpg', 'default/20180527/4870d474832ebe1cbd32d02617e3d55b.jpg', '58d4b6170458d81ced4ff21235ff52fb', 'f389c2a627ee2d4248b11b3141ca52afe841edad', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('312', '511', '1993368', '1527422945', '1', '0', '179e5679b48264d1831de0be3b75e68dc41271aa6b98d43e6da496d0ddfc4ee3', '感恩节移动端之后.jpg', 'default/20180527/6506148d33aa59010e4a5a68be749b26.jpg', '179e5679b48264d1831de0be3b75e68d', 'a5d22f1e3609085db20b991f578ff0d514702f82', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('313', '511', '5187341', '1527423139', '1', '0', '054b1dee68fb6aeb42e860f129bfe6b417d735d23f87090495a16958581076b0', '双十二预热首页.jpg', 'default/20180527/48196d3fdca572045a0a581bf4a26428.jpg', '054b1dee68fb6aeb42e860f129bfe6b4', '5536eedb0efb4b84aaf8a75e70bec64111b61127', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('314', '511', '4749716', '1527423281', '1', '0', '1cbcfb191c230a747e21046504d9bcb5c8425156a48022bc3cb1912a3be42350', '5m.jpg', 'default/20180527/e4c4cab91fcf755f29fb319fca31ce09.jpg', '1cbcfb191c230a747e21046504d9bcb5', '7d85bb76f57831f53cc45b992568310d3fc24217', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('315', '511', '878787', '1527423363', '1', '0', '9cb1ffa4a55bf813060b807bfaee00d609c8d310e53727c1b32382f93e2c4a8f', '必买清单.jpg', 'default/20180527/790dc4a148806214d70eefd71d7c7501.jpg', '9cb1ffa4a55bf813060b807bfaee00d6', '7fd77a59aae462930036a79c96b3dd3867257017', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('316', '511', '4022331', '1527423649', '1', '0', '46c076ea0731619efb3ad909c2b7d7436e2f000eb76c7c1c1f317b0c74835042', '55.jpg', 'default/20180527/fa9282483cc98aef2f97f6b6de799acd.jpg', '46c076ea0731619efb3ad909c2b7d743', '99f19f4c2690c046aed2eaecdd4a84a380fe09ce', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('317', '511', '550751', '1527423879', '1', '0', 'd4486cb77af44e55300d84f91f2b50924ccbc66ed5bc08f1c95ebca8dd97f13f', '高档酒海报.jpg', 'default/20180527/b66f6cbc26bf01af0e1a8cbdc89c0cf8.jpg', 'd4486cb77af44e55300d84f91f2b5092', '8ca5ed776214302d3be62c9aaa7772496c7ad57e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('318', '511', '1713668', '1527424030', '1', '0', '530fe1f21de7132d54fa7a9c343369593058d793a9cca9c8f3c9b27d02f9e739', '运动鞋海报合成.jpg', 'default/20180527/b1b7d99c3672c0adddf1191681aadadb.jpg', '530fe1f21de7132d54fa7a9c34336959', '5b25aae13c5b7e4a9bf7d42df965995d29d16b76', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('319', '1', '787256', '1527430539', '1', '0', '5103f5544621e1cdba2c4368dd8a96e532d7e7fd8c6a5daedbf39c8a04daf467', '22eb210fe15f89f7df444ad991d7e513.jpg', 'default/20180527/516bc8e9712fecd94ee91943459cdccb.jpg', '5103f5544621e1cdba2c4368dd8a96e5', 'fd86b0392541c0a98e83d594062100b17a6ab66b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('320', '487', '127011', '1527554530', '1', '0', '084d2e851099f08250b76f4c503d508d44beaebe43e797f09e8b671030d04b24', '亲子母婴.jpg', 'default/20180529/f9800ac48c740727beee971c15894045.jpg', '084d2e851099f08250b76f4c503d508d', '598b4eb64f34e5494a7a3dfd9aa63f91d334c420', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('321', '487', '278332', '1527554731', '1', '0', '7557f3b7d851d89b6e32bf3476c99227125ca89d639ec0c2f65b7ad7f8b74412', '电饭煲.jpg', 'default/20180529/8516230ac1cabbfd2df767a2bd7da05d.jpg', '7557f3b7d851d89b6e32bf3476c99227', 'c831d33e2a8b109762aa323f43cdc61c23a4ad90', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('322', '487', '209546', '1527561103', '1', '0', 'da8ee5a678751f01b4deaa27912bdc1e8266dce4348d51c512a8341ecdb3170a', '电饭煲（上传）.jpg', 'default/20180529/a07f6730f17dd5af0c23e261de2f141c.jpg', 'da8ee5a678751f01b4deaa27912bdc1e', '56a771688ce0a91ae52c3e9e4f3af3b54fa1c6f8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('323', '487', '103059', '1527587763', '1', '0', '46df71897e10fa5c192e32f4bd3df63416ef0c1076ec0f7684185559bfee73d5', '黑茶海报(龙潮).jpg', 'default/20180529/0bb56663ff362cad64188788244efcff.jpg', '46df71897e10fa5c192e32f4bd3df634', '8c7904c020b53011e7e463fbcde4613c85c1eca9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('324', '487', '156923', '1527587927', '1', '0', '85ef3d215db50715a308213d66d9438f64ef7b5f35915bbe8a85ea5610085adf', '黑茶海报02.jpg', 'default/20180529/0aa248c96a2365b7fb44249a203d0336.jpg', '85ef3d215db50715a308213d66d9438f', 'd773ab1b5a340ce08ef45dd6a7b03b27f683b40b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('325', '487', '199402', '1527588023', '1', '0', '2b8ba8f0a612ff3a6d8d47258443a1e40384ae41882000d5000263696b1ca853', '锅子(龙潮完成).jpg', 'default/20180529/75ddd8aebd137c57f8288fe2846a0911.jpg', '2b8ba8f0a612ff3a6d8d47258443a1e4', '2c9f6f2699f781297ca0b17c7e9d5b0f01d10682', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('326', '487', '198990', '1527588321', '1', '0', 'f03ace590baa8248d116d5efdc27404cd347cc0f9f04518c0a5a0a518096a707', '饼干袋子(精修).jpg', 'default/20180529/dc8ba7f9cef208772d866a70720e9b1e.jpg', 'f03ace590baa8248d116d5efdc27404c', '980f41d5b580211abc07e0046b2d8d5db9bbf540', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('327', '487', '126913', '1527588460', '1', '0', 'b16a280007215eb5855a13e8ff42e870b962465c2373010a3b9a88cf0b9986b2', '亲子母婴（龙潮）.jpg', 'default/20180529/6a9cc7b0944a7a6ac4d225e9ec78af8b.jpg', 'b16a280007215eb5855a13e8ff42e870', 'bfd503448f88a3c89efc68a5fc8facdb9d20d84b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('328', '487', '51342', '1527588802', '1', '0', 'cf22d4cde9991cd087ccd88d282248ba0bdeac2f7a067ac549b410526b8ce592', '杯子海报.jpg', 'default/20180529/2c526f102a8d1aa49c89fe2dd42ee80d.jpg', 'cf22d4cde9991cd087ccd88d282248ba', 'ed23a8ce7d1f6e855bb0f556dc0572533b0da800', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('329', '487', '87951', '1527588967', '1', '0', 'a8710999e60bc1645ba6dedb364b443b389c48a1b1d418eb0db92052df641a90', '电一龙潮（新）.jpg', 'default/20180529/99fd67269f37edc249bcda3ef6fad74a.jpg', 'a8710999e60bc1645ba6dedb364b443b', 'dabb87562972dcd197715f28697aacb8c160a3f8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('330', '487', '116036', '1527638750', '1', '0', '7de96be3ae941938d7cfe3684ed9c4fb88ff3e284f753bb36314da61f1f30395', '女装海报（季中狂欢）.jpg', 'default/20180530/205a6c52e06fbcef792320ad430d9bd3.jpg', '7de96be3ae941938d7cfe3684ed9c4fb', 'f6fa58b0ac489467c158edf04f23e30f6d9ef82a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('331', '487', '54386', '1527641608', '1', '0', '977f7dbcdd31d11a4e75f0a6825ac458d155a157fb6a3aa597cf15201a82795a', '产品图.jpg', 'default/20180530/1930f550b8f51e426f6c8122be339482.jpg', '977f7dbcdd31d11a4e75f0a6825ac458', '046248c771d62d1f65f382aa2fa7f9f741b7eae7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('332', '541', '672291', '1527650496', '1', '0', '46f4f5ed2ad89e45e54360890fad2d7502237ca3bc92c31241e5ff3e30d17f1b', '清丸详情_01.jpg', 'default/20180530/0efe37e1bc005384ee026f27110ca872.jpg', '46f4f5ed2ad89e45e54360890fad2d75', 'e5c7630100cc2bb7e04a1c6ec52eecb5be80382d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('333', '541', '320899', '1527650517', '1', '0', 'dd714698f480859a92b579db87d19e2955fabb63b704776e4cc29859f433684e', '清丸详情_02.jpg', 'default/20180530/4cb12470418ab9f8c7eac0b3860cfada.jpg', 'dd714698f480859a92b579db87d19e29', '391dc67ffa218b295ce9779b4dff9a8a87182811', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('334', '541', '672291', '1527651121', '1', '0', '74246bef6f637e48e439187f016078706126059e3490b4ca8bc813d33d0d9438', '清丸详情wed_01.jpg', 'default/20180530/618cb74b852ec59cdf1b068b64e3eeac.jpg', '74246bef6f637e48e439187f01607870', 'b314ed4afbf9a856b121923499f81d9cb1ec86eb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('335', '541', '919932', '1527662175', '1', '0', '9f21124130e39ee2363f6e06f06631fb48627d1b4c0640a239ec4dc46ec72af1', '纸巾详情图片.jpg', 'default/20180530/ae00e370f0f67a76f0ddb00aacb78b07.jpg', '9f21124130e39ee2363f6e06f06631fb', '315ac77874d5825938f5c1a05ee0e917ec095f78', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('336', '549', '959729', '1527735834', '1', '0', '38253f1b512fb92bcb919464079557d5f738b1d4e4e65b3e89e7527d9b1623c8', '雨伞专题页.jpg', 'default/20180531/ab4661db6714b77ad7ac147e251894ce.jpg', '38253f1b512fb92bcb919464079557d5', '1e0b303ed3413c21265f110091401c8913076b4a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('337', '549', '940270', '1527736327', '1', '0', '9e5de2fd1b97b85c12c74bbe9f394ef04a53adeb3b7febe31431b736834e4606', '麦乐服装专题页.jpg', 'default/20180531/0bec08204e8c26b64ab7da2a6e50c92e.jpg', '9e5de2fd1b97b85c12c74bbe9f394ef0', 'a07ae03e501c73d00dc715e81088a34d62f457d7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('338', '549', '879515', '1527736721', '1', '0', '08d23dff1c871db087a955ad224e837bd4b599a36b64b8431dcb5135a55a9e7a', '初语女装专题页.jpg', 'default/20180531/6674cefd3cc32d442fb24ec015a302f7.jpg', '08d23dff1c871db087a955ad224e837b', '5d6d0197ba736fd7e6629e1c322576b5f795d601', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('339', '549', '945182', '1527745103', '1', '0', 'e21e1b39e5cebad04e6faa296f27fd888a487abd8420176a5a09449b0a0604b9', '良品铺子专题页.jpg', 'default/20180531/3ac6705b20ca2e105666a627708b8b79.jpg', 'e21e1b39e5cebad04e6faa296f27fd88', '6c0fc7b5e9e5e3cc40778aadf3a125418b8de7e7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('340', '549', '930919', '1527745421', '1', '0', 'c9004411a24ed8a72ec0f866cbd6b4777de3162a0efb4fe9b146697cac0a6fed', '简约家居店铺详情页.jpg', 'default/20180531/9b1564124310139da8ccb58c35ad1402.jpg', 'c9004411a24ed8a72ec0f866cbd6b477', 'd0f490e32bc20f42819fa228196c574d7b60acda', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('341', '549', '1015534', '1527745585', '1', '0', 'c319c21e836eecd69f67a2ae1584fd0fa3413a03432ab77c63785b68d4776749', '睡衣店铺上新专题页.jpg', 'default/20180531/68e920e6256a8d53ceb8eedab0f5ccac.jpg', 'c319c21e836eecd69f67a2ae1584fd0f', '54cb3ca2a051f7ac0897be3a7f46d242e17b94eb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('342', '549', '1023917', '1527745900', '1', '0', '09fec3e7fe7b83150f0dd417d7b171b1ebdd8d12f8c479fde95d2daca17abd61', '安琪儿芭蕾w.jpg', 'default/20180531/b2eefa8fdc35391d9d6a2b6f3346413a.jpg', '09fec3e7fe7b83150f0dd417d7b171b1', '1fd672181cca359b14489495920820ebf2063fb5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('343', '487', '164868', '1527753208', '1', '0', '28c2c828efba4c2b43b1040ea9e9426e97c0a9cbf53b50c5fc6194103e02c53b', '1920-550运动鞋海报.jpg', 'default/20180531/0ee27e28d25f98636f8c7eee72bf1c01.jpg', '28c2c828efba4c2b43b1040ea9e9426e', 'e878def76721d40e12c978a1c2ea90edccbf7e35', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('344', '487', '164877', '1527753575', '1', '0', 'c99837a6782e71fe4f04347e3f8c05fc7d6161f63623281936a39828bd1eaf92', '1920-550运动鞋海报.jpg', 'default/20180531/3aec1654437e2641365d6f551989d41f.jpg', 'c99837a6782e71fe4f04347e3f8c05fc', '0bd26a63962bef7ee2ab36a0b38e8268dd8c7294', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('345', '594', '185905', '1528095855', '1', '0', '9ca738c43bcfb1626b1c76115c2000d4dcec03916d7f33f15dbf4540124d81e1', '33.jpg', 'default/20180604/f43fe54aa2daf34601dba16745065e1a.jpg', '9ca738c43bcfb1626b1c76115c2000d4', '46a77487fb9fdd73625ad8e16e9ec8d023107d4a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('346', '594', '399849', '1528095935', '1', '0', 'b4f7f2bc7a4f09e3b0ce00f24f76f6dc380873a1be6a67fc7e208efb3261ae9f', '净化器车载.jpg', 'default/20180604/b19397f961eaf355a8ba9d793626171e.jpg', 'b4f7f2bc7a4f09e3b0ce00f24f76f6dc', '4044d62379c03195600eae75d5dc6155345f2516', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('347', '632', '816377', '1528441360', '1', '0', '03ad868d2d184f46fbe96c47d2891683563f6050f052f74d17dd1de2a88f1475', 'f30f3ff60603660aa91e5f2c6438ff6c1cbfcce130910c-fHyIRx.jpg', 'default/20180608/2ee54f813e93539792ee4cf29ea9cf2a.jpg', '03ad868d2d184f46fbe96c47d2891683', '3d6748425e9b9e3ea0e4a1e5226c2dcd93fb660f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('348', '632', '985862', '1528443619', '1', '0', '1e161684eb1c291ab9ad2b4da01aad120f86d1d7a91a085b4374b41c88fcda28', 'af78a794103cf89883efeb72de2c074ae9ce3ef520e71e-sCdPqe.jpg', 'default/20180608/10d04fb1b702d54cff6e65163ae03f2c.jpg', '1e161684eb1c291ab9ad2b4da01aad12', 'a1e49809235f437e93a0f9bdf8afe5b5710fac44', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('349', '654', '194964', '1528679091', '1', '0', '9184aaf34e69bf27157c5ba74061b00a28a4a2624f9d1d5e2817e958229b4692', 'VICTIRY_0014.jpg', 'default/20180611/1363d3d54b2908cd817fc5d833415acd.jpg', '9184aaf34e69bf27157c5ba74061b00a', '3d985e20d4423575f5b977d07a2fc9cb730c7eb0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('350', '654', '267031', '1528679326', '1', '0', 'd359068ab5091752c784ae16c08ac11e8a73b7a823c9d19e3147ca14d6697d64', '18-4-18.jpg', 'default/20180611/51631284b6b1db5cced432e98b9195b2.jpg', 'd359068ab5091752c784ae16c08ac11e', 'c0548233a3429872210aed1e62bedb70a88b29f9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('351', '656', '784657', '1528686922', '1', '0', '2944b44559bebaec606d1c84b56d583ee213809fc07a9fa70b4bda3d373f66da', '保温杯详情页.jpg', 'default/20180611/16e8bdcd10a191e80525abb8759f7dff.jpg', '2944b44559bebaec606d1c84b56d583e', '4a0a37fae30ed57647569068d2305e8693c314b2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('352', '659', '1047861', '1528726055', '1', '0', 'eea198cc59d96989fb045792950931412bd131d14152f8b5ff28eec40154d502', '手机袋.jpg', 'default/20180611/2478a5d8522de32f6c21bfaff3d307d9.jpg', 'eea198cc59d96989fb04579295093141', '115dd37340a0371dbcd187058edb36b3e7d77271', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('353', '668', '411160', '1528795309', '1', '0', '04bb585db78ea4bd14ab97cb5b06972cb4196f5d2609607861b1180233c4541a', '端午节花色背景促销首页模板_01.jpg', 'default/20180612/f8ff91265ff11203acab8259f2a4773e.jpg', '04bb585db78ea4bd14ab97cb5b06972c', '6ab2361ef78695491e142f7fe6edb3d98b69330c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('354', '668', '788691', '1528795323', '1', '0', '4bfe0476f6d259f06908bf440031b081c59b57c0c1a763996dbe57f1292de979', '端午节花色背景促销首页模板_02.jpg', 'default/20180612/c2d8910dba52599853b2e537e13fac98.jpg', '4bfe0476f6d259f06908bf440031b081', '203c0ebf456e9eaf2ec5030f5aa6b9d9f81a9343', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('355', '668', '951800', '1528795437', '1', '0', '47dce87a21caa6a999be2cd5291a8a40cb0172c5f8a1549b597a38c81ec094d6', '端午节花色背景促销首页模板.jpg', 'default/20180612/6abe9fb37d4fd6301ed3d445032f9ae3.jpg', '47dce87a21caa6a999be2cd5291a8a40', '58b09048b222a89a4690619a3b659e2c39cc5c93', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('356', '668', '294824', '1528796033', '1', '0', 'aaf0a142eceffa569cca99f0ee3d17e367092dfd58dd6d6a0e8683230bfdd598', 'a4ef9c47d2805424ffbb91c38e4205f5_01.jpg', 'default/20180612/1f22139e7e059d4344094011a99b6ecb.jpg', 'aaf0a142eceffa569cca99f0ee3d17e3', '3de7c21c3825691cd6b2bae1645b4c1b8896874d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('357', '206', '469108', '1528872132', '1', '0', '4f8d13b497f00107ceb82724b91487f8291b2c65e236434bde5c23100d5cfff6', 'QQ图片20180525095912.jpg', 'default/20180613/8aaac9e97ced74adf956c3200f94092a.jpg', '4f8d13b497f00107ceb82724b91487f8', '0e98641d5c9c5d01c14f6215482d659f3aa0cb9d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('358', '670', '813658', '1528872151', '1', '0', 'd66c9619a0cd7d904d779c432c2788b6a9688776884d2e037be63c350e60dad9', '首页.jpg', 'default/20180613/ce7021e6934c4c46390c105e37445228.jpg', 'd66c9619a0cd7d904d779c432c2788b6', '524434ac01a549c44b636505743a95847b6c2b23', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('359', '670', '1964577', '1528873053', '1', '0', '7d601582e2d4fcecf077965e371ee071cbbc00b949bc899d3d298f21299c815c', '首页.jpg', 'default/20180613/6424a35f9152bb12b5cf91d10d75351e.jpg', '7d601582e2d4fcecf077965e371ee071', '976e478b04edaa3cd2ab630e3c88fb6668b2171e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('360', '670', '1544656', '1528873443', '1', '0', '211ff62c26cde08efdaf6ebc53e71b13b7ad3b6fc12eda2767262fe0f88ee139', '首页.jpg', 'default/20180613/6ac27a96d2e2043da55da14062c75b17.jpg', '211ff62c26cde08efdaf6ebc53e71b13', '2d16a6485264b170fba10343af5963d52a72c9cd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('361', '679', '1861517', '1528895037', '1', '0', 'bec94ab6caebfbeb7f3438045de626d903a1e0cf8f93696640581cfff3f8373e', '首页-可可创意文具百货-淘宝网.jpg', 'default/20180613/0bb931cbf4046a8c27a9226046c50ee8.jpg', 'bec94ab6caebfbeb7f3438045de626d9', 'f060e22c005be39a2c796ad82ca42bfd6bb58733', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('362', '679', '1899492', '1528895706', '1', '0', 'a534f423a90b1182435db62b3a8418dbb49a0c8546105e2b0f27e77fffba6dcd', '料理机3.jpg', 'default/20180613/5707ece5ee0787172a39b6bf3f3f122b.jpg', 'a534f423a90b1182435db62b3a8418db', '1d49cb87b78f0cf5ce0205569d2a97d0aa4d733b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('363', '670', '1631436', '1528943764', '1', '0', '7dc314fd3f4852647ffcb045587365781458380dae09ef144675b26a7b93f0a8', '首页.jpg', 'default/20180614/a817b07f23eed2cad3b08b176a94b3e3.jpg', '7dc314fd3f4852647ffcb04558736578', '5d16399dd4238a8b67ff698e7f952f1b467fc46a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('364', '670', '1617217', '1528943953', '1', '0', '14a1bf97355bde20df2acd2026dc3100682c6795ea0c0d981b117449fbcae056', '详情.jpg', 'default/20180614/bf3f6b74a1d048ca6c7a890c64887e7c.jpg', '14a1bf97355bde20df2acd2026dc3100', '9e37d53fe0e4a827cf1cf9b44616a95f94874c13', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('365', '670', '1403725', '1528944296', '1', '0', 'd2e191c8d368082412b7071a2122cec59724fedda56c1324aa522332b85f09cc', '书包详情.jpg', 'default/20180614/de8ae5fefe8d82d58544b49b1254c9b3.jpg', 'd2e191c8d368082412b7071a2122cec5', '8e2e4d5e13e1475bf28beab3a62bcdf7fbfc8a6f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('366', '670', '209098', '1528944504', '1', '0', '79d5a65a476cce0385f9dcf16164b0515df4314065cb54bb8d85a65e2c6ebf21', '洗护详情海报.jpg', 'default/20180614/ed63c8ec5b823bbe702d4e093d09a76f.jpg', '79d5a65a476cce0385f9dcf16164b051', '505e3bde31a7663732bb2f3f593484d2f97ce798', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('367', '670', '1317754', '1528944758', '1', '0', '17d37faf608df8388a8cdfb5c69df41225071a220ed41f88c1bc2c2238c3ddd9', '罗汉果网店首页.jpg', 'default/20180614/65cb00ba2f5ddb45ae23689b46d549e3.jpg', '17d37faf608df8388a8cdfb5c69df412', '0f828e1d7eb1821d6cce359bcb18f2cab2b33dc9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('368', '670', '1818507', '1528944858', '1', '0', '6a7b77255878790cb828e12eb8fd1e6a908053a6f13a3995371dca43942fe6b1', '膨化玉米粉详情.jpg', 'default/20180614/2324e875d82f9dd1ef41d186d58b3a3f.jpg', '6a7b77255878790cb828e12eb8fd1e6a', '5b911c793c4846ac291e184f4632788a8ab7ea93', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('369', '670', '1270807', '1528945106', '1', '0', '2c7f77d13e63e28d94388fb9cd5b159e05972f8f4e830ae097a4fa9a3903e0a9', '功夫红茶详情.jpg', 'default/20180614/f3524b578ba14eb75f191c0535fa52b7.jpg', '2c7f77d13e63e28d94388fb9cd5b159e', '0dbb86236d5739fbebf26e612b1a4c54644d1876', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('370', '670', '357749', '1528945211', '1', '0', '17b7b52c626130c0ea57505e7cf34a5f866d91bb230630339a2d7b6a5638417e', '荷叶4.jpg', 'default/20180614/4668a7890175aef0224462d8ce7d0f89.jpg', '17b7b52c626130c0ea57505e7cf34a5f', '7854c83715f3003c050f885eeb3d2cc1fd698cd4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('371', '670', '1198316', '1528945357', '1', '0', '02345b6a247fa1cf55044551eff09c18edfa9ec0ad4419a79aac7ed1a3bc32aa', '马乐热活凝胶500ml.jpg', 'default/20180614/4c2cc6501e43ef95fe1b0f2fc007b4df.jpg', '02345b6a247fa1cf55044551eff09c18', '0ac8bd62b2a692f4e577e2578ffea10135b405c8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('372', '206', '48832', '1528945392', '1', '0', 'c5efd59b064925689d7a2e6f1a65e3f766800398f77de243d9fd906029338404', 'timg46.jpg', 'default/20180614/9e8d5d86fc57f3daad9a24972b2b9383.jpg', 'c5efd59b064925689d7a2e6f1a65e3f7', '1e59207fa40c9cebc771d67dc4244698561c6336', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('373', '692', '1642107', '1529133001', '1', '0', 'b3b52023e741964991a7cbf801605502cbfea2b8d79d57162fe252152d743d59', '小刺2.jpg', 'default/20180616/98d64f2db19733da543d9b7202f1de50.jpg', 'b3b52023e741964991a7cbf801605502', '613e431396761980c9861a18aba5dafd441f1e86', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('374', '692', '1497288', '1529133207', '1', '0', 'e43bfe2d9b3cc741174f75a6bfef37294278392aada0c3bbd1d336852986a245', '详情2.jpg', 'default/20180616/fc9d078381580d6c3134a5012aeca540.jpg', 'e43bfe2d9b3cc741174f75a6bfef3729', '1d680ad30b051e0304ff238efc87ba8a7960d889', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('375', '697', '707866', '1529199964', '1', '0', 'f4a0041d4cf1abf8607afdb548e926f68fb1801d6f78e77eff7208c26a963638', '897EDB95-BA80-41FF-9E99-F2C1B32A9AAD.jpeg', 'default/20180617/3357373d572948517b9f0bc940aa1edd.jpeg', 'f4a0041d4cf1abf8607afdb548e926f6', '1dd3e13e5564651816ebebb71a3a3a9088758477', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('376', '716', '1146901', '1529393725', '1', '0', '39db759f2356fc544377d38563556c3a5fbb4c6ebda086d04d1c9e27268fbb0e', '君制普茶首页.jpg', 'default/20180619/f578e38a5a555ee77d715870950c4433.jpg', '39db759f2356fc544377d38563556c3a', '93fdbaa8e0f91512d50007fd311c28bf28cc570e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('377', '716', '1062593', '1529394456', '1', '0', 'aae44d015327b4f8cba93ff329379cb61f0590587fb78d6f584fc243dab97fbc', '女包.jpg', 'default/20180619/eb05a3a05fc89acfd7e52458ca313bce.jpg', 'aae44d015327b4f8cba93ff329379cb6', '82fae4d93023ae64b89615262b0d099783679bf5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('378', '717', '485482', '1529394568', '1', '0', '7a1a1cdf06ffd7de67368dfd7e31f904c8dd2de46a18907186d49f48dca94d78', '1.jpg', 'default/20180619/69e0fa4a095bd23e87a0ba89a24781d8.jpg', '7a1a1cdf06ffd7de67368dfd7e31f904', 'e41e065ce63dd18e2451449b5d5f6f23c7d4a40c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('379', '717', '329532', '1529394674', '1', '0', '5312502a1546bc3034494900cc8c7108cca6706ef24084afb87ad33f8b73b692', '2.jpg', 'default/20180619/d9bf4784c97ca7c6de6c5ed5e0aa137b.jpg', '5312502a1546bc3034494900cc8c7108', '43c6d79b11d31972f6188a93a4028714bec94090', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('380', '717', '1948129', '1529394765', '1', '0', 'ac036b8b29eafe3bc4b2141e58687b60a43241fbbd781e741437b40b1e11913a', 'bac1f0c9325f8175e0df9ce08365e75f_01c1b8577ca3ec0000018c1befa812.jpg@2o.jpg', 'default/20180619/53b5eb1123277b442d967398460cb417.jpg', 'ac036b8b29eafe3bc4b2141e58687b60', 'b67c7c039b97cbad1395540493a88a0328917808', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('381', '717', '2030566', '1529394803', '1', '0', 'b9f7b54fc78d4a2c5f192a1d75818610f71974fee5aa3c4f3cac7c2ef6e764d1', 'bac1f0c9325f8175e0df9ce08365e75f_01c1b8577ca3ec0000018c1befa812.jpg@2o.jpg', 'default/20180619/a88e6ed0da25db9dc382a66b082e774b.jpg', 'b9f7b54fc78d4a2c5f192a1d75818610', '025085b7b3f2768e2470572e01f58b41a8ec654b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('382', '717', '506057', '1529394987', '1', '0', '3cdee3a636386c0e56fb887330136144a34547c45add15d4edbf99c4bbf1f180', '+.jpg', 'default/20180619/ca806b98a5cdb3c31d400b5f75bf8ffb.jpg', '3cdee3a636386c0e56fb887330136144', '8a427a9298c87800b65516d61a606149c7ec4da7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('383', '717', '462618', '1529395097', '1', '0', '0ca0c5466baabdf24ba7db20d1d6c73c1d1dd4f0f30b6b55ff3e7ac33d7f950a', '+1.jpg', 'default/20180619/f0ce95f1925b35bf2cd329c65aa5229f.jpg', '0ca0c5466baabdf24ba7db20d1d6c73c', '668137c5fe3d1bf9f8c4c42c96a9e6988e731697', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('384', '717', '2085278', '1529395232', '1', '0', '47bc4c6a2f14ca6383c794ead024995bbb28d8ffae1b4ad0388b8fee3c811e29', '33.jpg', 'default/20180619/6c5998f4ddf6611f895976a4bdad0dfa.jpg', '47bc4c6a2f14ca6383c794ead024995b', '17d4b624cf35f19b68b16a73387ff1d54ed56029', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('385', '717', '2022740', '1529395396', '1', '0', 'ae99fd3d42bc2121d1222737a08c1302bde8bbb2bd45b25a8a2609625b5e2593', '未标题-3.jpg', 'default/20180619/9a0babd6753c5ba04926cf45b98ec0f0.jpg', 'ae99fd3d42bc2121d1222737a08c1302', '41e4440fe92561c1eb21ff7452962c6313d8e444', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('386', '718', '1487792', '1529395610', '1', '0', '17d51ee4ba7ee459cbeac420170b945f79e83c6d4f33e38751eb476d831640d7', '2018-3首页-.jpg', 'default/20180619/3c485ae09ab595230a5425f113d4b789.jpg', '17d51ee4ba7ee459cbeac420170b945f', 'a6de87e9df64e847519f2accf63edaf00c42c3b2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('387', '718', '1510260', '1529395673', '1', '0', '39e81e20e93e55b5b06df9f0de0762d97c1607c03317b0ed4a4b3a61cd63a295', '2018-3无线-.jpg', 'default/20180619/a315d91e501c68a1e5376437e9747961.jpg', '39e81e20e93e55b5b06df9f0de0762d9', 'bbc40de09b159528df8bc63d9d0ccb19f5d7bb84', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('388', '718', '1915036', '1529396371', '1', '0', '50306bc2639361f69a1ca4f5d1b0db9e0fda1d8203680aee42568478547fbc2a', '2018-618-.jpg', 'default/20180619/0ff8ec2c3d1a735deb4bc7c5a342bde8.jpg', '50306bc2639361f69a1ca4f5d1b0db9e', '044fbaba97c1a30940523e30c1a4a795b4180827', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('389', '719', '126109', '1529400095', '1', '0', 'ba227c47fc60ac6d47bda9d0d9bcb266311cb802d77d3da6e44653e81843d9aa', '渐变色.jpg', 'default/20180619/4ccea063159ccab4b021ce44073b6819.jpg', 'ba227c47fc60ac6d47bda9d0d9bcb266', 'fee6fb0737c9f224fe994fc38c98fc586b70c3b0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('390', '719', '52339', '1529400105', '1', '0', '4acaf989f73f09dcbb7e3a3ce001358d94f41f8c321544560332b7c19ab518d6', '2018.jpg', 'default/20180619/70c047861958f1400239b6384f869000.jpg', '4acaf989f73f09dcbb7e3a3ce001358d', '32ff5e50a883bbd0834a9e82a94ef2a8323d2ece', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('391', '719', '109142', '1529400213', '1', '0', 'f84cb21314b1b0e449c2f306ecf52861d9243ee1211c1efbc826d399d029a153', '渐变.jpg', 'default/20180619/4818193af715ceaef94d6bbf4cf9327e.jpg', 'f84cb21314b1b0e449c2f306ecf52861', '85da5d0ac1f0d6f615d65dc86b1b6ec76da9b75c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('392', '719', '1286860', '1529400408', '1', '0', '02bacfc49787fae66a18fe4331cff7d57d3bd5e646699e521c28d43e7ec0323a', '欧巴桑.jpg', 'default/20180619/cb83149e3d48189f1c73ada292cdd759.jpg', '02bacfc49787fae66a18fe4331cff7d5', '30de9cc45b8593606dbcfc5af2313a9067bb00b7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('393', '719', '304420', '1529400713', '1', '0', '201961e817b8eaa8aeb988186ff7faf077c8655eaeae59673f2463e6c7471533', '网页.jpg', 'default/20180619/9a94e595f16bf94618ea559945b30de4.jpg', '201961e817b8eaa8aeb988186ff7faf0', 'f20ddb68c3a3e21f0c10426878320dc6e87eb986', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('394', '719', '106055', '1529400782', '1', '0', 'e982aebdff8af24805b3bdaa8da80adc3aabf868ded2a9943ba56ad4a2cf7e45', '撞色.jpg', 'default/20180619/fa5dd3b2705e54862e50e7d63626d8fa.jpg', 'e982aebdff8af24805b3bdaa8da80adc', '24f30a41f807ffafc1462a64892d94cba380e09f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('395', '742', '120082', '1529679507', '1', '0', '4e55ca5f1a12753360b108f3576bb946ba797f96da881eb154c09b412e66dab8', '微信图片_20180622225757.jpg', 'default/20180622/49f39e724e01b0776748d7084eaca874.jpg', '4e55ca5f1a12753360b108f3576bb946', '7bb53f16686531f2c1ab5438c84de0f557df973a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('396', '742', '200784', '1529679748', '1', '0', '5da85329fa52e14e02895270ed22cb05c092d2caf0767d0b30311575846da21c', '微信图片_20180622225810.jpg', 'default/20180622/c83175b3c54f60e384a064bad43814af.jpg', '5da85329fa52e14e02895270ed22cb05', '0088298a55317494d5140ad3c8132c8adb63b51e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('397', '742', '137757', '1529679809', '1', '0', '5329f1dbc833850e389a8e0ef0727bb446337be829a25a8d766a80b94362c9f2', '微信图片_20180622225803.jpg', 'default/20180622/589a0a47c2d8b697f8095789c99b9b1a.jpg', '5329f1dbc833850e389a8e0ef0727bb4', 'b95063988340391a4d367d061de03ca3f8dfe060', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('398', '742', '106460', '1529679844', '1', '0', '889e3235aa5467017b475b9ee3ef1ef731209751cd87f0ba855fee783e66ac5b', '微信图片_20180622225541.jpg', 'default/20180622/980c8e85045ec2a41265dc8fdd2a17ef.jpg', '889e3235aa5467017b475b9ee3ef1ef7', '5d184d7d2a32776efbd6aa2203e73006acbc39b8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('399', '686', '1427359', '1529763842', '1', '0', 'dda4e332df570ecafe9382c380fc715ce9e57fc65c89ae99e796521ccbe9f767', '618电脑首页_.jpg', 'default/20180623/6f0dd9514ec13ac6d357f29a8e368eb1.jpg', 'dda4e332df570ecafe9382c380fc715c', '6553d66517a43427cbf1b0b156e150365ffe90a3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('400', '686', '1832546', '1529764104', '1', '0', '6ae83ba3019ce444bcbf5c3c4c46de42405428e47d5aeddca0c02a87d24ff821', '客家牛电脑首页_.jpg', 'default/20180623/b6db7870bf0dcbe3ecb73cfe0ad567b9.jpg', '6ae83ba3019ce444bcbf5c3c4c46de42', '5e5ca70bed70b36bba35739614150640a605aa14', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('401', '686', '627665', '1529764165', '1', '0', '571d26f67dbbee47a76e70ee6933cb72f05ab0f1a64b7c476f499ac8d6a4def3', '客家牛侧栏.jpg', 'default/20180623/0b430dfc8fa35b48e633cf3c85093209.jpg', '571d26f67dbbee47a76e70ee6933cb72', 'd5a14cfe1aa5a3bd75eb9ca0f4baa1515d14ca7e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('402', '686', '1612788', '1529764267', '1', '0', '7a15fc60fff9b48e56c5acdb8230e9ba40e05fb491e956e32401060f9e1c0cc3', '客家牛手机首页_.jpg', 'default/20180623/05dac576f27b21fe5ce2a42925437e77.jpg', '7a15fc60fff9b48e56c5acdb8230e9ba', '9f0b382de098ea6e0bdf92b8fb67d868a52ddf33', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('403', '686', '123703', '1529764360', '1', '0', 'f399dd127366fa3d4de6a39c13a80346255f4056245dc017400a63bf6e1bdfeb', '8020茶几_看图王.jpg', 'default/20180623/71d7762115ae4be8be4f67d9ba3ec70c.jpg', 'f399dd127366fa3d4de6a39c13a80346', '8a6c71bc947713e175a63ce135eb19ee2870cecd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('404', '686', '1931059', '1529764525', '1', '0', 'ca5b409b762eaddde82a0e900ae1e0ebf19250ebe34f552a379be18b66b4f922', '618手机_看图王.jpg', 'default/20180623/d08cd3e0619626ca2e4cad8c3e46fdc2.jpg', 'ca5b409b762eaddde82a0e900ae1e0eb', '1b46377e8948bcf8774a6cd1236152f3b295b3be', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('405', '686', '1501464', '1529764591', '1', '0', '4b09c6454cc1d8b48a48b7811ea7c2295cbcc07145f6be3c38742b9f71940d02', '618优惠信息_看图王.jpg', 'default/20180623/2d5988fae33dce7b8bec27035e94ab36.jpg', '4b09c6454cc1d8b48a48b7811ea7c229', '3b63d643f995528a3f0b8ad52fe2b0901d695bf1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('406', '686', '636770', '1529764659', '1', '0', '29356babcec258348cde00388634f5bc7690b8579137d6eef0db037ac5a5d5cb', '侧栏_看图王.jpg', 'default/20180623/3f12489db61570f482cb2d86d0c21cfd.jpg', '29356babcec258348cde00388634f5bc', 'e50f0b56865ca4cff65e37a3ec1fd919140af939', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('407', '686', '1929574', '1529764831', '1', '0', '96557dfab345a40bfa5ea5be76d197ba04fca2c729a2bf607a49fbad053999df', '电脑_看图王.jpg', 'default/20180623/bb35e38ed71ac18670af4c6af9c0f4f1.jpg', '96557dfab345a40bfa5ea5be76d197ba', 'd7443f4a4c4445b26a90fb6db647567c4bd194ef', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('408', '686', '2004284', '1529764875', '1', '0', 'cc27c135872adec93a68903db8a424cb4bc1a90ec84a2170322c78958eebe4c2', '3.16手机_看图王.jpg', 'default/20180623/b238e6834086161eb752d77093f0e33c.jpg', 'cc27c135872adec93a68903db8a424cb', '08e8f101c0f94acaa380f848d74157ab4148f563', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('409', '686', '2032791', '1529764927', '1', '0', '745e22aed0fd7183cd9a93993e77fa66830a3c9184d34937fe738746128503d2', '一起来电_看图王.jpg', 'default/20180623/f9e5345ab7304a8395aaa685d675587d.jpg', '745e22aed0fd7183cd9a93993e77fa66', '4f02e18d4bc43771338e7320fc12b393beb413a1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('410', '686', '1503402', '1529765114', '1', '0', '92862dc31ee7086f9c8064b6531f99b69c4fd98625cfa5535c37eff28be4235c', '电脑首页_看图王.jpg', 'default/20180623/f53629caa16382605a2c1fa182d6a9d1.jpg', '92862dc31ee7086f9c8064b6531f99b6', 'd6f6dd56d4c3465a89b71894937e2a54321998d3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('411', '686', '1728505', '1529765163', '1', '0', '3f20a814984a88719027fada15ee4e183bef71507d5a762511d0848671eb7977', '手机产品_看图王_看图王.jpg', 'default/20180623/d2a3737f629bb630bf54486cecb95ab9.jpg', '3f20a814984a88719027fada15ee4e18', '34274b85455e97a6ddde5deb39629e2dda184727', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('412', '686', '1832333', '1529765302', '1', '0', '125e80ce01eb1753a2414ddc82cb3d8951a423eb8cd5c53538b8206f0e702810', 'M920_看图王_看图王.jpg', 'default/20180623/ea0eb10e662c415e08737aa73f113087.jpg', '125e80ce01eb1753a2414ddc82cb3d89', '38805eeec40cad1fe539c103a4f6e26318c1aa58', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('413', '686', '1727161', '1529765605', '1', '0', 'dd2ad7b4f924d5ff726c3d8c2a62caa0aa822db6b68bf7aa41c6e370a4fa5399', '北欧茶几_看图王.jpg', 'default/20180623/c0dad661b5d7d6abe97a8fd3cae8995f.jpg', 'dd2ad7b4f924d5ff726c3d8c2a62caa0', 'baab18435314ce1c8abcb1e8fd614f7eacbbc9ee', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('414', '686', '1929221', '1529765678', '1', '0', 'e5340855a005b04b5a1bc6060869f232a65f0b6d9ba257565c7997b83cb70424', '书桌_看图王.jpg', 'default/20180623/a1442000345670085d25f6dd4157d221.jpg', 'e5340855a005b04b5a1bc6060869f232', '753092ccb4a1facdf5d75172e6084b16d13b0053', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('415', '754', '458953', '1529821366', '1', '0', '3990b682494bf2dcb1b398144209cd53e0ededddb7c2d6e543ade79071931128', '113.jpg', 'default/20180624/0ecd78576d4848c07794289dcaa4b7c1.jpg', '3990b682494bf2dcb1b398144209cd53', '106c8950f714acf5e7cb1ea0259d72e0e12b6f67', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('416', '760', '641434', '1529898462', '1', '0', '2812d409514a20461f2a81d34f83cc94ba1f869f294748d87b45eee26d085d0b', '海报1.jpg', 'default/20180625/b1a375ed2a5678368c22f4036bde7354.jpg', '2812d409514a20461f2a81d34f83cc94', 'ab6f2a0b7754fb475237f9e0ed27c3328106d791', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('417', '760', '495947', '1529898618', '1', '0', '75cf23bbc09d91a4e2f2afdb110a6c089d09fbc0d431e225955981acde55feb3', '海报1.jpg', 'default/20180625/ef34c4dc970745441ac708421bd9a407.jpg', '75cf23bbc09d91a4e2f2afdb110a6c08', '83b89143f73f2bee1705e725fc53b02ff4b7ca01', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('418', '760', '489449', '1529899577', '1', '0', 'c383bb08bd61a116dd9d03bb67fbdd4745793533cf25015b082208db16e44228', '海报1.jpg', 'default/20180625/1b2889f0a61b8fd6e110381a53b0c6ff.jpg', 'c383bb08bd61a116dd9d03bb67fbdd47', 'c27f802957a71ba69bb286079da16647ab5f786c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('419', '760', '105025', '1529899765', '1', '0', '1980fb9b3e07aa6bd2421af2e3334be815771bea0ca87986883265d7accd2b59', '海报1.jpg', 'default/20180625/19269eadacda459a9e9b5a8b9aa7fbe0.jpg', '1980fb9b3e07aa6bd2421af2e3334be8', '8b26a0e75c0cb7f0e9a16511c88e36a85974321a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('420', '760', '428332', '1529901729', '1', '0', '64519fe7dc3842735aa0510c2a864065f36eb2f9451959b7e156df26394a7117', '海报1.jpg', 'default/20180625/82682b8ddd510e8b701ebe6792980fd7.jpg', '64519fe7dc3842735aa0510c2a864065', '120a3626e8cd3f8fe3d8e73026b37e81da43dcd1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('421', '770', '1747456', '1530082470', '1', '0', 'b8fc9a2e941218c1e6fc242922ca5d80fbb2502e5d8720db1c02dc0efdf8c6cd', '1459.jpg', 'default/20180627/1f8913ab3206a2d74081c7902c20a31a.jpg', 'b8fc9a2e941218c1e6fc242922ca5d80', 'd32c9e479f0fc47e4fe17d83b1a3c6eba4fbc4d1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('422', '775', '488830', '1530091116', '1', '0', '05e3ad40c6defde642e861d7a730f64e1a493aa29e72874c15afca6aed6e72cf', '49彭诗颖手机端.jpg', 'default/20180627/14c45934e00293c8fe1ee037db6257a7.jpg', '05e3ad40c6defde642e861d7a730f64e', '787c1ad02dc816e0de8d210521d72b6f2ce3024a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('423', '775', '224761', '1530091207', '1', '0', 'bd399603b0874fd2383194f069ec72e8ce414f7cb655afe3e952a5ff768a5dc4', '手机端海报.jpg', 'default/20180627/57f772aca8deb9dade5cd5cbe8e63ebb.jpg', 'bd399603b0874fd2383194f069ec72e8', '3d4c688457d914587dc5abc64e6b70e09a4e937d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('424', '775', '1355516', '1530091222', '1', '0', 'b1e61e88f8e7aeb6ea88e920cad2214690a7a48cd602545078d965613ca73fe3', '49彭诗颖母婴.jpg', 'default/20180627/f90dec8aaecb668cb0743719209cd58e.jpg', 'b1e61e88f8e7aeb6ea88e920cad22146', '41232941b26467b31896bdfb969a54da5515af76', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('425', '775', '1762313', '1530091315', '1', '0', '8846c54dec16cfc4d7da6544fac0eb8327b3d353784842566df69211e444136c', '49彭诗颖主视觉.jpg', 'default/20180627/86fc228d840ddf8c99b3b24fb936f829.jpg', '8846c54dec16cfc4d7da6544fac0eb83', '26614ba527f9c800ef8c4924347de37e4426f35d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('426', '775', '1295038', '1530091361', '1', '0', 'c041c31f9eb8843101a2dc9092d1494a41477630c8572623da4fea587c5b2e1f', '枕头修改后.jpg', 'default/20180627/1c8031e2858d1fc2301bb5fc0897f9d9.jpg', 'c041c31f9eb8843101a2dc9092d1494a', '66379a13dd21ca9228289318e7043243ec243dc9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('427', '771', '109734', '1530150633', '1', '0', 'ec43fb1f0ae5bb2ad90e834d72266652bd58f9943576321c96928fe105f1f105', '微信图片_20180628094731.jpg', 'default/20180628/b41ef69eb137ea59199a506585817fcb.jpg', 'ec43fb1f0ae5bb2ad90e834d72266652', '81f02d94b4919898cb714c7baf3b748d59c92f84', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('428', '771', '140699', '1530150671', '1', '0', '92dedaac43341668feb2943ac0a5f34ab5a824fd3ee0e1d49029a6d9051f273b', '微信图片_20180628094744.jpg', 'default/20180628/71898bf7377df76d0abc1020db4e6f2e.jpg', '92dedaac43341668feb2943ac0a5f34a', '7c0e8c98e45d8f34bbe061ce5d28d74fc3f4d2c2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('429', '771', '109645', '1530150828', '1', '0', '8a9f041b5e011d5734eda93f7121646a7a8faab2bf483d9cf359d6bbd48d2342', '微信图片_20180628094748.jpg', 'default/20180628/292e809a1a09591992a3dd5901d3234c.jpg', '8a9f041b5e011d5734eda93f7121646a', 'b1225d15af339354c4b5d516dbe4d9a89720834a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('430', '771', '48121', '1530150883', '1', '0', '530cf1399b18c0dfcb921c76e78df1abce535d2833eb3cc915a08ddfb9a92068', '微信图片_20180628094752.jpg', 'default/20180628/1c023e4896620de700d6b9ea3ccd92b4.jpg', '530cf1399b18c0dfcb921c76e78df1ab', '9f20b99725ae43d0892ce471f6ed7826a0015645', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('431', '771', '48062', '1530150935', '1', '0', '423ad5903074671d72238512890d7a825ade0151de1c2cd2489608bda784b84f', '微信图片_20180628094755.jpg', 'default/20180628/d4321bf99640f03f593e0244e7e9ec12.jpg', '423ad5903074671d72238512890d7a82', 'd0ac01e858fa8916bf2ecc0b966ed6c923d55c23', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('432', '771', '51725', '1530150963', '1', '0', '69cb13397ea3f7fa60d009271cac546cf60db049ce5b852f24cd866e6eb9f5b9', '微信图片_20180628094759.jpg', 'default/20180628/eab60d26c22d42ec87b57c71b31ad403.jpg', '69cb13397ea3f7fa60d009271cac546c', '9c45c4957f798260ee57918fc5d9aebe983022ac', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('433', '771', '1010556', '1530151236', '1', '0', '5abb03ff63c19ea818ad7d9f3da05080bcab7b718809fb691bd7292b93a8e9b3', '旗舰店首页.jpg', 'default/20180628/1be1efaf074723cb489cb22b50b29166.jpg', '5abb03ff63c19ea818ad7d9f3da05080', 'aadf3cae1ee1150c89b1593705d73e120a17a29e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('434', '771', '54457', '1530151708', '1', '0', '4907b2880d1894100ae6c533001c48f8ead0d69c082bfa902c2bd8ba027c8554', '微信图片_20180628100709.jpg', 'default/20180628/fd6d3ab1792e488bec22aa6b7abdc327.jpg', '4907b2880d1894100ae6c533001c48f8', '4baf3540e418abdab5a649c13ff4f421795249dc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('435', '771', '159630', '1530152780', '1', '0', '8f56debdc27bc3761c690288cf03e7ea24d773dc2456bb6d03d7e597e83528a3', '微信图片_20180628100742.jpg', 'default/20180628/e327ab2427471ecd62e654244f0024dc.jpg', '8f56debdc27bc3761c690288cf03e7ea', '1d6d189f367da4a5a03e5e6933a93317307be203', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('436', '771', '115124', '1530152812', '1', '0', 'b2f76b516ea9b35678eb23f09e9fbbf3ca2a934870c5a9112d9c5e6d7bd4113b', '微信图片_20180628100715.jpg', 'default/20180628/8dd6aea194bbee4f0abc10150208f7eb.jpg', 'b2f76b516ea9b35678eb23f09e9fbbf3', 'b7c5fe3c83f6a4378905ce004aee1bf0e9abc91d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('437', '771', '102061', '1530152845', '1', '0', 'e50375ac8050848a4854e818c04fbd9aa09a32f03ddae83265829d53144259b2', '微信图片_20180628100718.jpg', 'default/20180628/9b677896111eead3bdcf3d83078e9456.jpg', 'e50375ac8050848a4854e818c04fbd9a', '2511ed30719c6bf4aff78a3a9c5d4396ae04b3ca', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('438', '771', '122022', '1530152925', '1', '0', '9e1236fc8ecdfcee542ec57d7c8d6a98985d2ea1d63845b4664b8cca83dac648', '微信图片_20180628100722.jpg', 'default/20180628/cac7001b2ac38e28c6fb6011c6495d2a.jpg', '9e1236fc8ecdfcee542ec57d7c8d6a98', '9a2777e2d34c78f73a0292b2c7ae023432f401f4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('439', '670', '201444', '1530166321', '1', '0', '5eb017347f48ceb18e77776a88f0822f298beba0d8cc397f85eb179f6b513c1a', '详情.jpg', 'default/20180628/33956fa22fc5cfc6d8d05413bdda8e36.jpg', '5eb017347f48ceb18e77776a88f0822f', 'a4e5e2e407b1796868b3384fee00d52a4944eb09', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('440', '670', '243948', '1530166532', '1', '0', 'd13a5a3cc53c2e6661bbefd05163d46a98b8919f055e7f7b0888b820313db520', '详情.jpg', 'default/20180628/6f75319285766c224764210a9ce14765.jpg', 'd13a5a3cc53c2e6661bbefd05163d46a', '4f6b706a6e45d17cb748ad401d609279cd3b1553', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('441', '812', '623811', '1530345115', '1', '0', '4a4d42ef3825b770facdadc0a69621ad540bff82ba02d6b5d17190206b9d8652', '详情600.jpg', 'default/20180630/1beaf271bdec8ebf8bcf45ec789f620a.jpg', '4a4d42ef3825b770facdadc0a69621ad', '0568b03d0218b2cdc43ffc8e2ca84b414fd111ad', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('442', '828', '1645849', '1530521771', '1', '0', '9f6dac51ad0efc1f51ec49a74858080cb3d0e2ae5a1f6946a750248d52b40ebd', '红枣1.jpg', 'default/20180702/1769c76be9798abf98112d4aa74f059b.jpg', '9f6dac51ad0efc1f51ec49a74858080c', '18027ca706d0741cd01676e61f2638c80601a0c0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('443', '835', '1450022', '1530540541', '1', '0', '7c25e019b8d1661c5d56ed3da0816bac04ade998e9a684924ccee2f4c4fb4556', '4_01_看图王.jpg', 'default/20180702/31d1dd67c0be2eff8ae9533fa73f6634.jpg', '7c25e019b8d1661c5d56ed3da0816bac', '1d716988daffcca74877d97be239b8fce06016ed', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('444', '835', '1082361', '1530541132', '1', '0', '1bf7b949a9bbd7edb8f8665e75d4bc03a52b5e3a70af8bb8212cf2fddbfc4895', '油烟机2_01_看图王.jpg', 'default/20180702/f9edd0d632e48bb1dcda0df4aca44ff3.jpg', '1bf7b949a9bbd7edb8f8665e75d4bc03', '013b7374324b2f2f67feabb5080ca4b93bc6e9cc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('445', '835', '1703544', '1530541431', '1', '0', '8764cb2697fb3b525e75aae502530e0dd7d1e93e5f92e8fb92bab02d9cc68283', 'JSQ24-12H58_看图王(1).jpg', 'default/20180702/021151648125791b104ffcc3df5b679e.jpg', '8764cb2697fb3b525e75aae502530e0d', '7974ad3314892268e47c73574e6792fd1705a3a5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('446', '835', '1677278', '1530541687', '1', '0', 'a5715378145c5d07c40d73b381232d248c401d127727916a3b686f3d86947723', 'D60-609_看图王(1).jpg', 'default/20180702/122caa0b8eca914d70f7f6a24a2e574b.jpg', 'a5715378145c5d07c40d73b381232d24', '9eca90e886dd50b93bb63e13cbbd52a23df9b1b0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('447', '829', '1960567', '1530587947', '1', '0', 'de265362e7da0d817beda9a9dd0f7261085e137c4dfa29b9fc49c8aa8bd88d68', '首页11.jpg', 'default/20180703/abc98f07d5a7aa9f8bfcd8cffc1d1cc7.jpg', 'de265362e7da0d817beda9a9dd0f7261', '5c88f8a4abd5647d2a47644a2718919c9216e03e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('448', '846', '1718644', '1530691579', '1', '0', '40f3d843e434940a931ea3581ea36400c9c77548468db24a08c0a94f16b5fb66', '201706211102  拷贝.jpg', 'default/20180704/e6d5c11e94fe71cf2e0eb0bb3c5e5c69.jpg', '40f3d843e434940a931ea3581ea36400', '28725d919d2a55192872d4777f0675ee8eca3923', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('449', '846', '1323738', '1530693298', '1', '0', 'b4694dc2ea8ac94b01c75359910f5daf08cf160191ab633e657ff29d8763bafb', '201706211104 拷贝.jpg', 'default/20180704/16f53ecd3d9428cb97b16e7a09c77d0c.jpg', 'b4694dc2ea8ac94b01c75359910f5daf', '0149d158c7393bd604984a188744095974062e96', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('450', '846', '1555322', '1530693327', '1', '0', 'ed7b834f3c55b1096f1a2dda4b650a03ca79f975d2581e9e5481b23799479b11', '201706211103 拷贝.jpg', 'default/20180704/5836fefd671a98f034bbb169fcb907bb.jpg', 'ed7b834f3c55b1096f1a2dda4b650a03', '2c9908d3a241aecd011e1705b23cb9e34402126d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('451', '846', '1701350', '1530693346', '1', '0', '4c0501e9cced88416851deaf8397a43c99f1c942a42e14e3bd3c05920f61570d', '201706211101 拷贝.jpg', 'default/20180704/d36d67d60375e91a3e9bd663dd22e69b.jpg', '4c0501e9cced88416851deaf8397a43c', '96f2539b3381972d250a2f0a897fd94795ea9662', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('452', '846', '1298434', '1530694329', '1', '0', 'f81cf6a0ceaf5fa00851b9de41379d395b1b3cbb8ceaab3544a6533b8fbbe4cb', '201801311815-(1).jpg', 'default/20180704/5ad41f60d66fe5d7a2e240eede65c0d5.jpg', 'f81cf6a0ceaf5fa00851b9de41379d39', 'cede25cd19821879931528f8c65f097ccf8ecb38', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('453', '840', '1249097', '1530695788', '1', '0', '63206352bf55c4eb860d7ce255bd1a5bed35f2e47a64fe820e5081eaf92e2b44', '640多彩店.jpg', 'default/20180704/11eb99b7ad6af1eaff18f57cef2050ab.jpg', '63206352bf55c4eb860d7ce255bd1a5b', 'a355978316505f46991c12da8bdcf58338224b55', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('454', '840', '1677184', '1530837727', '1', '0', '3242c7dff4846a5aaa9c9310e7b1f6af448cd9634cc97cef3c0587a57de78e40', '3.12果冻详情.jpg', 'default/20180706/2f05b03cc48f55b40a257b0f02d96ca9.jpg', '3242c7dff4846a5aaa9c9310e7b1f6af', '3b48720b5ee6298bfb5ff82df064a2a8ab92dee4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('455', '866', '326173', '1530929101', '1', '0', 'a3f9328388d499f4ce2cf931d63b4d343eb9e42e896ed2c5778b1ab3dd73aef0', '12.jpg', 'default/20180707/7928bcb77ef4410fe87633a36918047a.jpg', 'a3f9328388d499f4ce2cf931d63b4d34', 'a30bac73102eb35bfc220ee2b2fc5b16ace8e48a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('456', '870', '1812719', '1530949118', '1', '0', '64ce5015da5f7e3f812b29568bf03595b1de45860b66fda134fd29a795139232', 'IMG_6767.JPG', 'default/20180707/0fbfed8173f8ebebe6113663baf5cb6d.jpg', '64ce5015da5f7e3f812b29568bf03595', 'a83a6249609568cefb5242c9c2fdea8130fd32e2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('457', '870', '1810604', '1530949340', '1', '0', '186511d26df544f7bd88090848e0c590176d333ddcd37d9909b45798f4d6dc14', 'IMG_6767.JPG', 'default/20180707/8cc1d42864d81a6d451bbc7067b33d7d.jpg', '186511d26df544f7bd88090848e0c590', 'f85ea2cbc4769874c1b90c7d32acca642e8c626b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('458', '870', '969598', '1530949737', '1', '0', 'bab59ca4b26ffcc7e52fda63e74d6c1317db4af43a2bd787be731b8af75e42bc', 'IMG_6768.JPG', 'default/20180707/bcd7244cdcc9d79d258cfdb4d9970d0e.jpg', 'bab59ca4b26ffcc7e52fda63e74d6c13', '0e964afa607cb2f3919649619bdb56dc357e8d55', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('459', '870', '798743', '1530949900', '1', '0', '7ec8168b8d7b5a65977a036cf5a3457b7e5dfa07fd6a48acc929f752d491f8b6', 'IMG_7357.JPG', 'default/20180707/2b16981be6be42bad7c7d1ae740a9577.jpg', '7ec8168b8d7b5a65977a036cf5a3457b', '30bf6a6baa7afdce1c2ba0dad9efa260b9785070', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('460', '811', '1340600', '1531192407', '1', '0', '12e3a2ed20d6174792e550a5afafc02a1ffef00a390520db2df9222b050161f9', '2.jpg', 'default/20180710/eb55ff24f0879777daafc8146efa9033.jpg', '12e3a2ed20d6174792e550a5afafc02a', 'ce3a0d4e0c0d3a633e2f71f1dde302ce759c95c9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('461', '811', '207999', '1531192933', '1', '0', 'b2a447290d53e3577e7f0c2c67bfd03e542e45d5f164c99284eb34dc43e14bc5', '微信图片_20180710110550.jpg', 'default/20180710/41a8d5529ebb054ac43db886fe4cc77f.jpg', 'b2a447290d53e3577e7f0c2c67bfd03e', '8fe79f19b7044e635ddbb10ddf84eb123c3bd100', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('462', '890', '78161', '1531201025', '1', '0', '889e4a4545dd620988a014f0182f5705f83158719756f29fc7079a7c361a2012', '店招-马雪峰.jpg', 'default/20180710/0ca2f0cd6954fae76a9b871fcad5b409.jpg', '889e4a4545dd620988a014f0182f5705', 'e8a3ad235761b7830c3e952283719c88444e6379', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('463', '890', '22297', '1531202168', '1', '0', '4b8f0c90b2c110c5c0561b815c74f1a3c5f69339567e8e7eff5ec38614713c97', 'qw.jpg', 'default/20180710/5574b771eae0d0700ea9cdc3dec9a7f5.jpg', '4b8f0c90b2c110c5c0561b815c74f1a3', '2da8b73d543a36083f58af3cb7ef504da7494482', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('464', '895', '1924236', '1531277106', '1', '0', '99eada3c17d77f629ab0ad84ac52c15c47e3e7fc4dd203ba8c0e9def56a120a7', 'yixiantong.jpg', 'default/20180711/2816b7f922ff42af084e4cc8e0bfd41b.jpg', '99eada3c17d77f629ab0ad84ac52c15c', '2776765dc707c1dd6b325c6a2de558307a92c44c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('465', '895', '2049529', '1531277351', '1', '0', 'cdb4ee553c31aad776440a9c10e5134a0a568db374325cd95ca51e261c316e9e', '173-4k.jpg', 'default/20180711/552c5b02069dd38fb233be41fcc9304d.jpg', 'cdb4ee553c31aad776440a9c10e5134a', 'bd1b860a1fc031da394e46b087d01c1057fe130a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('466', '895', '268340', '1531277678', '1', '0', 'd921ef7448912280b30a8ea19c8426b8ef9a3b5d8a9ff6cd4979a6581158c408', '载入选区.jpg', 'default/20180711/5fa4c50d55f6f5caab45cc32d6e9cd6a.jpg', 'd921ef7448912280b30a8ea19c8426b8', '56ce5ee7eb9b19d1087b51a75d65d0d0fd2077a3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('467', '898', '239897', '1531292257', '1', '0', 'f5aaacb670f54e8edb138154a88145b30262cf483a81b7caa1db47af46ceb8cd', '汉麻袜.jpg', 'default/20180711/2b28d98b3697a2f02ebefdc57cb5118b.jpg', 'f5aaacb670f54e8edb138154a88145b3', '7540265309b81557b1ee0b3eeb396476749ed8fb', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('468', '898', '117935', '1531292272', '1', '0', 'fdc7b0c4919c303d9c8b4b478e525c0995bc739492f05a5ee35f2444574d7188', '魅力莎logo-01.png', 'default/20180711/d1e994e3f947fc58f2190604bbf6803e.png', 'fdc7b0c4919c303d9c8b4b478e525c09', '03b1baec0f8e9617816f7f6618aec79f29750ed7', 'png', null);
INSERT INTO `cmf_asset` VALUES ('469', '898', '287719', '1531292290', '1', '0', 'a3b9068a401472aac7822590fb9c79873536d5006edeb3320e6a6b4c8a5f588b', '塑身衣.jpg', 'default/20180711/bd4d0423ed73f3853a5036392a3df3fa.jpg', 'a3b9068a401472aac7822590fb9c7987', 'ce69834c807cfbbeee57fb090b914919d2c6ba22', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('470', '898', '421421', '1531292318', '1', '0', '459296b2f7243d6e2280b64e88885c5bd7038d66546ea4840782431d09cfcfd8', '套餐、.jpg', 'default/20180711/9dcb7744d780a7602ebda9157736ff69.jpg', '459296b2f7243d6e2280b64e88885c5b', 'b78ea64c22e99501fda17adcdb3f41fdde9a1a94', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('471', '915', '122397', '1531465250', '1', '0', '98b8599b5e6aebf60535cd0fe4ee8023f1983aaaad30edb67ad638ebc3735965', '123.png', 'default/20180713/cf9f20fbeff28f0209aca8067ebaaba3.png', '98b8599b5e6aebf60535cd0fe4ee8023', 'a12bfecbcdccbc448208404cc7f9c071ab0559f3', 'png', null);
INSERT INTO `cmf_asset` VALUES ('472', '919', '273426', '1531478986', '1', '0', '9ea109b4b96b1bfb08c56affe9fedfa7aafeb148a734322e5029965924bbae54', '未标题-112312312.jpg', 'default/20180713/ae7919ae7d5575c3dde7bbf491e72517.jpg', '9ea109b4b96b1bfb08c56affe9fedfa7', '1c8e7fd1d35890d14a10284603bd1d47e07f0b41', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('473', '919', '1749051', '1531479107', '1', '0', '4a2eda949444ce70bd3fa98d47746050742437f473715f433dc509eae457a2c6', 'toukui  chongzuo.jpg', 'default/20180713/19c5aca288f02c54924e275cfe1d631a.jpg', '4a2eda949444ce70bd3fa98d47746050', '347fc49c730cd712f27b06d9def1ea7ce8499b66', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('474', '919', '1820931', '1531479145', '1', '0', '2dd6cc08a966ad9c7ca074f532fb5ea33b20352e1b289499fc3dad953e8aa928', 'chongzuo.jpg', 'default/20180713/d6ac5aeed773e3387165020618d49144.jpg', '2dd6cc08a966ad9c7ca074f532fb5ea3', '87126839f2454a16fcc5c6a8ce2776f415a4333e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('475', '919', '209172', '1531479589', '1', '0', 'd97dcb840df18877d4e611e885aea249498eb1e730bcda5323f94d7caaf67c3c', '22.jpg', 'default/20180713/dfb02e9ab887e1e4b71d55bf54ec2aaa.jpg', 'd97dcb840df18877d4e611e885aea249', 'f00e8011d8806c3f040c3fb38cbae58c4aa6904c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('476', '919', '352551', '1531479776', '1', '0', 'b3a2757d3bd3196e5401190fc13617e0480e3c1954731160b2775ae6784c5532', '未标题-1.jpg', 'default/20180713/9c6758ee296a9f88aed3e04914e4a851.jpg', 'b3a2757d3bd3196e5401190fc13617e0', '0c919389476aa8f923cb33a392a87aa1152361f7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('477', '921', '1796127', '1531522358', '1', '0', '4eb663a941d243515f34523ee76aaed049fa9c5fc328c1700033dd93366a1d09', '旅游banner.png', 'default/20180714/5d8172c5a36318076d3d7712bcb787ef.png', '4eb663a941d243515f34523ee76aaed0', '95eb3b9f9b4e4c7ed4084527af6b110f06fbb5ba', 'png', null);
INSERT INTO `cmf_asset` VALUES ('478', '921', '619339', '1531522612', '1', '0', '30df3f16a8b3cf891028a051932dfa4b3b4047a1acf8504297cce4281475d263', 'p1.png', 'default/20180714/a2775b04931f621ecf4807c31c1eec2e.png', '30df3f16a8b3cf891028a051932dfa4b', 'ebd9d711dd8783baeed1ace54d1b255b0642f5ae', 'png', null);
INSERT INTO `cmf_asset` VALUES ('479', '799', '868423', '1531639279', '1', '0', '297da9b0f2b4a4d3f977d2918f98d5eb05a679aab4ab776f8041dce5ef416cb6', '菲尔雪月饼宣传.jpg', 'default/20180715/7939aec1372268186a3ac7d4ee978476.jpg', '297da9b0f2b4a4d3f977d2918f98d5eb', '32549e6ea821184871aa7533da2f17820bffecc4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('480', '799', '2092965', '1531639975', '1', '0', '8376c1c2baeffe2acee20d1a3ee35694702deda80a63341a9600df28f8be6190', '月饼宣传正面.jpg', 'default/20180715/481f23e2a11fdf2086287b2225926e15.jpg', '8376c1c2baeffe2acee20d1a3ee35694', 'd22fb81f8d1b216ddd8c3fbf66c77b409458a0fe', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('481', '799', '2024760', '1531640210', '1', '0', 'b62070b88a60e04392a6565471edffc0516498fa0dd699a4645f9b936f7cdfc0', '月饼宣传正面.jpg', 'default/20180715/9f573cb2df8c5f6f6a533173af6caa23.jpg', 'b62070b88a60e04392a6565471edffc0', '38220eef2ee530760eb041d5e433ae4c7b1731ed', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('482', '933', '2075212', '1531716595', '1', '0', '6413de331f50933fc4fe2fe98b9f977a810b41d81a4afe05bccb708d177bd7b9', '（亚马逊）手机防水袋-详情00.jpg', 'default/20180716/f72c8ec952637c9b65002e8312b2edd1.jpg', '6413de331f50933fc4fe2fe98b9f977a', '50c11b654a27dab95acc5d165ec87c2f7a1f4b16', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('483', '933', '1905815', '1531716815', '1', '0', '2300ce8d9784440919fcde56f8115f3ac06ac98c2af63024850a930fb6a3f102', 'i9无线蓝牙耳机-详情00.jpg', 'default/20180716/b3d238834cfc8dbb3d071ba45f5389e4.jpg', '2300ce8d9784440919fcde56f8115f3a', '258a0937e962bbe50455f75c2f21227dfc0cf0cf', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('484', '933', '1971384', '1531716926', '1', '0', '51e2e375bd95e8973eb9dbf1fbca9bb626ca5581067e8c56b05c2cca9330d3a1', 'iPad水凝膜-详情00.jpg', 'default/20180716/d26dc104eeb7340472d1bd9877bdc683.jpg', '51e2e375bd95e8973eb9dbf1fbca9bb6', 'b5dc2e134264a0488ab721daa343b0eb56e3edbd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('485', '933', '1942226', '1531717282', '1', '0', '0b2c4f775c081cf918d331faeed3cabf3897377f61ae332d521a83cd5f65f184', 'iPhone6水凝膜详情00.jpg', 'default/20180716/e2cf1beae23ee98005aba063bdcb18e9.jpg', '0b2c4f775c081cf918d331faeed3cabf', '5763e81db70a1943cb85ff81d67af4c8cb5a808f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('486', '933', '1847409', '1531725864', '1', '0', '8da96379b3a39eae8d679fa76e2df8ea37250d16f7fa48f076c11e9277f6d469', 'iPhone6水凝膜-详情01.jpg', 'default/20180716/153145b74f697e69e195a5b29f721924.jpg', '8da96379b3a39eae8d679fa76e2df8ea', '3715e2d6698cd7d408936acc431f150abfb9cd33', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('487', '933', '201508', '1531725964', '1', '0', 'c3f48b60f1503eb2966f982a29fbf44caeb5f31a8ebce40202a743566f08a8e0', '6.jpg', 'default/20180716/6cba7a8f3fa0a566170f040a9ae8d73a.jpg', 'c3f48b60f1503eb2966f982a29fbf44c', '3385b3e0ff50953356fa28645a158daf45092a8e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('488', '933', '1917120', '1531725976', '1', '0', '5ac1fbca53a2b650cd3928e83e6bb08dae981de1aa4784aa84e6942d3295928e', 'vivo-x9水凝膜-详情00.jpg', 'default/20180716/06bbe02690e4ebdd29964bd67abdff34.jpg', '5ac1fbca53a2b650cd3928e83e6bb08d', '88ce89ba64f7cfad1353c18cd47156e05b2776b1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('489', '933', '1914070', '1531726075', '1', '0', '82bffbfa4291d25ec9025cb16071839dccb0cc9ad0f0711cbe8ed13c9ee77f63', '华为Mate10水凝膜详情00.jpg', 'default/20180716/ae6dd4a367fb68a05123d1169d9f5f77.jpg', '82bffbfa4291d25ec9025cb16071839d', 'b217d1a8b6105d52005402a7e6711e22159f5377', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('490', '933', '1596828', '1531726180', '1', '0', '0215d1094c444e91ec462afb81e046fd29b1c62598162ade20f75cba4500a98c', '欧舒丹首页00.jpg', 'default/20180716/79f4c210fccf799332794ce6ea0a8568.jpg', '0215d1094c444e91ec462afb81e046fd', '34f1125020299f66c890dc2f892fbea4e26ec5c2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('491', '933', '1942428', '1531726292', '1', '0', 'f1a822b8b835b6e5fdcc3e2d435517510ad42c5a757a6b3fc858ca7580406be6', '威创双十一首页00.jpg', 'default/20180716/84545a29bb1e4de7237ceaacd6728fb9.jpg', 'f1a822b8b835b6e5fdcc3e2d43551751', 'e1d41b70f39553ad9cf307ebb25ec5ce25936df1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('492', '933', '2023439', '1531726389', '1', '0', '715c63180ba48797059bb8fbada038a71609bc8510b19998e74a4f4a26cca98c', '温碧泉首页00.jpg', 'default/20180716/a9b7475bc1007edb27b658931f8d3dd6.jpg', '715c63180ba48797059bb8fbada038a7', '0f0225032c370e528390a18966028aef45629482', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('493', '933', '1692611', '1531726544', '1', '0', 'e4f10fe19915e0612b9dec8198872b3300af77e92cb849fea1fd98f81735b932', '伊贝诗首页00.jpg', 'default/20180716/08343a5cd53a5caac69b2f8014e66f7a.jpg', 'e4f10fe19915e0612b9dec8198872b33', '6e2ec823facdb3b02b9e2157ed2f26c3e0f2a44e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('494', '942', '894152', '1531727995', '1', '0', '79b13fcd918f0ece212bd7968f7ff053c2d316fecf9b3a944ed260afe6a009d6', '【新版】品牌高级编辑器信息1920x500.jpg', 'default/20180716/a242a66be2fefc436b40a6cee0b88b3a.jpg', '79b13fcd918f0ece212bd7968f7ff053', '5e1a4eb540386d0088c74df13be6bc7b5dbfdb73', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('495', '942', '488155', '1531728505', '1', '0', 'e7bd0898030f9963a5206cf9a2618aecbc47f1b7e6b0d763507c93b78935f0e8', '2000-800国庆大扫除.jpg', 'default/20180716/8195b15c8a783f7777f6d99abdc825c2.jpg', 'e7bd0898030f9963a5206cf9a2618aec', '2318784efcd8fdc991b9ec1de05dde6bf55b8bf0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('496', '942', '458813', '1531728568', '1', '0', 'b116617be7eaeee561e9e7b2c1e48fd5a2642501c4c193df9f8122d96103231c', '2000-800舒爽一夏-质感升级.jpg', 'default/20180716/72ecb0ffbbc910887d3d5f025b8193ba.jpg', 'b116617be7eaeee561e9e7b2c1e48fd5', '83112c12ad4ebd662f5f0aaa20f22f50f13a1f2d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('497', '942', '243640', '1531728611', '1', '0', 'd64646bf67abaacb07ee7306fae1e5ab5505a7faaa86fae696589ac6726ef2b2', '日用百货 750-430.jpg', 'default/20180716/3d8489644886cbbcc784b1581db54433.jpg', 'd64646bf67abaacb07ee7306fae1e5ab', 'e9e1b07e698c153d544ca96286477cb125f4239b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('498', '942', '381815', '1531728828', '1', '0', '0ade500277032b85014be8bb0d6a8125f0540b24c36194a52d145a89a704f560', '2000-500保暖季-惠战到底.jpg', 'default/20180716/460b8aafeb8fdf213bf8d32968ed8879.jpg', '0ade500277032b85014be8bb0d6a8125', '2969f76091d2b01d8bfcf769935b59258769dd9f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('499', '942', '489183', '1531728930', '1', '0', 'dc4baa4228aa29c77a7d19a07b521259b716e50d2ff83febfdfdc1873603136b', '2000-800防晒小心机.jpg', 'default/20180716/0177bfd7cebb808881cd8f68ed21280d.jpg', 'dc4baa4228aa29c77a7d19a07b521259', '826f34ebbc1702cf6139edcb1a080cfc2aa104fd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('500', '942', '442215', '1531728982', '1', '0', '91c4a0de80a1cc5180d6cca55a4888158a82c965cb6f5e2324f1d855238b5b44', '1920-600巾品生活.jpg', 'default/20180716/3f547fc2610d84680490d2bb3d6ce7c3.jpg', '91c4a0de80a1cc5180d6cca55a488815', '62e6320c8c878b03aaef9b33fb2eccb2ffabcab7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('501', '942', '442647', '1531729184', '1', '0', 'c547149abe04560f92533d0906d5f2145749b5d2eb2dc2ce5dc771ddeb82f58f', '2000-800将酷爽进行到底.jpg', 'default/20180716/166a82a54545aa0cb3c90acbe8a72c99.jpg', 'c547149abe04560f92533d0906d5f214', 'ec11eff0696650443ae654a0c01a3b55c1d7bb2d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('502', '946', '938885', '1531732089', '1', '0', '5f7a8ae340ae95de79b30cf81845805df6434c94c7509d71375ed0956ad24b58', '波普木 - 副本.jpg', 'default/20180716/f36f4070a59e391c9e9f2467c74eddd0.jpg', '5f7a8ae340ae95de79b30cf81845805d', '011e5aaa55d832637d5569d02fac625dd9f677d7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('503', '949', '1779601', '1531805195', '1', '0', '5d464a092b7f691ec88353409d8332f684af7cbe61c5fa755e6b476d6784fa4d', '手机端-首页.jpg', 'default/20180717/af08d8b479f2495e5159e23a8c10804a.jpg', '5d464a092b7f691ec88353409d8332f6', '838bce1c159b572f9ef3e39a5fefe0d9b3a36212', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('504', '959', '85397', '1531883227', '1', '0', 'fa1d8f5ba3911f52e46aeb109d284cdc31c12f7142304fcd00dbbf9c3159b677', '84c46456ad4860e994664049c6774d8.png', 'default/20180718/f272a3f877f3e2f22dc613c04a8bbec8.png', 'fa1d8f5ba3911f52e46aeb109d284cdc', '8001da9813adc9280dba2799ce460e5082609f33', 'png', null);
INSERT INTO `cmf_asset` VALUES ('505', '960', '1992989', '1531883276', '1', '0', 'ec9056abb7bf6d7fd326e5334e6e96a5c617ebce8310091dc7e8a4553cf87a40', '首页.jpg', 'default/20180718/0baa15cd5ae2169049a5b02599c208a2.jpg', 'ec9056abb7bf6d7fd326e5334e6e96a5', '591c3df12166f58c5d7626edeb758a1acdebae43', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('506', '959', '280265', '1531883408', '1', '0', '2bc62599750f486e528b60dfc18ba85f8a99bad638828f6c63de529b044f96ed', '2107baeb32db4f9e650a91c54438d9e.png', 'default/20180718/41edf95a67a8faac1bfc172750d91a4e.png', '2bc62599750f486e528b60dfc18ba85f', 'ab08a2422a88e612f3c629edafa7bccd8a5ed1cb', 'png', null);
INSERT INTO `cmf_asset` VALUES ('507', '959', '257395', '1531883578', '1', '0', 'bca76ff6c5c703d71e1ecfb63465260ad03815c996be540b992d3bf6dede024c', '191bc02c503bf3b900988a92c6bb9e5.png', 'default/20180718/98b26e1619d393082ead3d91dfb0017f.png', 'bca76ff6c5c703d71e1ecfb63465260a', '2581df79435fad1c17bff29d33931d8885861adc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('508', '959', '1080335', '1531883883', '1', '0', '384e3f2683fb422ddd1d2d75af7dde5c11163ec3ff19b75ab1c055472521baab', '4d9d5a14f06f253b72cba039f468eee.png', 'default/20180718/b971d7f5b06c11f63767caa978341a1d.png', '384e3f2683fb422ddd1d2d75af7dde5c', '950a018be1934559ed662d97e2178909872c2904', 'png', null);
INSERT INTO `cmf_asset` VALUES ('509', '961', '2082791', '1531884000', '1', '0', '6489f56926206bdc7873b8e6a0b6c624c51c6a628c07a9bc272f003ffa45f927', '5.jpg', 'default/20180718/eb42f750ebc6a2ae2b9197ceb150de92.jpg', '6489f56926206bdc7873b8e6a0b6c624', '23c732ca8d87595a89a254a7c9c072e00d6f4dbe', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('510', '959', '693349', '1531884070', '1', '0', '5190587193c8da43dde2800a061d35fa0c01eaf98865a8ff6b1202fc066fd1c3', 'bef586b007f9fef080c3ccdb074df98.png', 'default/20180718/78eb0b2e5eefd05b089754c414754e30.png', '5190587193c8da43dde2800a061d35fa', '7058ff820a6175c7d5952f646f8d822b3f8eacde', 'png', null);
INSERT INTO `cmf_asset` VALUES ('511', '967', '372559', '1531908569', '1', '0', '539d6d3a9b646e25efc82c06955cd1728333e5eccc200e1fc161c8e79cce21c7', '47f717a7-40ec-4178-b343-83b7dee18429.png', 'default/20180718/56ac551eaab0d90a2ab84350e06be47c.png', '539d6d3a9b646e25efc82c06955cd172', '63060bf15815b4a483d9d50edb1245e503d9a687', 'png', null);
INSERT INTO `cmf_asset` VALUES ('512', '967', '544080', '1531908608', '1', '0', '545ebd23343791429e99e01cf6613812b87dbb21e81775304841be9023709b5c', 'sketch1531717764917.png', 'default/20180718/036abc14904f9045d804d2ec61558f60.png', '545ebd23343791429e99e01cf6613812', 'ab35b4d3010f702ea2e5b7c0c003b821beaf406d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('513', '969', '1398801', '1531964163', '1', '0', 'b9387e84c092e6e5ba402aa5acc8a033387bbaa9874ef4b8b7d91c9429818ec2', '1.jpg', 'default/20180719/594b20de07f4f18cdda1faa149765f9f.jpg', 'b9387e84c092e6e5ba402aa5acc8a033', '1c927c97a876e12d8b0afd484e3bee74951acdc1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('514', '969', '1784481', '1531964390', '1', '0', 'ef356354f6ae1db6a3943a9160744a71fb4b870957c7db3d251d62764bf29e31', '飞.jpg', 'default/20180719/b100e837abfa716bffa6afdc332419e7.jpg', 'ef356354f6ae1db6a3943a9160744a71', 'd56b4e2daa336827c1cf75251dfb3300e96afd05', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('515', '991', '294922', '1532137574', '1', '0', '44bb4bb7408f1a366562ae2256123740368c043a2c7aeacc0a9566254908f893', '未标题-1.png', 'default/20180721/bd87490d436ab9144351a15ebac3cf30.png', '44bb4bb7408f1a366562ae2256123740', 'ca2e9ad9fe4b6c7cc0bc3498ea6ce9da52e336c2', 'png', null);
INSERT INTO `cmf_asset` VALUES ('516', '1000', '245863', '1532239911', '1', '0', 'd496cdfc9e5af5fd9118b0fc89f9470b59d0bcefa2d2d0eafe7e34a795d50761', '6-21.jpg', 'default/20180722/1392a8d2ed296f563a4f948991b6fdaf.jpg', 'd496cdfc9e5af5fd9118b0fc89f9470b', '968498a94c001e8cf6f60fff7dfff334fafea355', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('517', '1000', '259775', '1532239973', '1', '0', '1245026614ac4ac739de8e770b86ebe3a969152d0fd10146c4edf49cfde7c68d', '6-26.jpg', 'default/20180722/89e3b992a61b6426be32413fc4d75ffc.jpg', '1245026614ac4ac739de8e770b86ebe3', '3fe86b3d2ea3171c8500b746de19672f6926d2c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('518', '1000', '220031', '1532240033', '1', '0', 'fedcb1a03d68cffd87330fd7abcbf588405ee3f8b85b614bd0f41fd7d5947c7b', '6-15.jpg', 'default/20180722/9c21da155e2b78e785bec052908336c1.jpg', 'fedcb1a03d68cffd87330fd7abcbf588', '60ec3bc736dd87d0bf28a49b00a0a8deaffb4d59', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('519', '1000', '1330556', '1532240246', '1', '0', 'b50c2cf8262b613b1a63feaa4dd767b5967244e02d4842e75865a2ced26af263', '0.jpg', 'default/20180722/5620219ffdd481eda9b3197b0a2c6478.jpg', 'b50c2cf8262b613b1a63feaa4dd767b5', '7aa4ece368904579caa343df74ea2b590468b9c5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('520', '1001', '886625', '1532240946', '1', '0', '88b78cd5180bb5683919987477baf8a78585ae19d13e001af5f96695a56a2c72', '1.png', 'default/20180722/58beba334e8bbf171307034c41427801.png', '88b78cd5180bb5683919987477baf8a7', '1c34693d783ff35130b329d203dde6f9f8a4599a', 'png', null);
INSERT INTO `cmf_asset` VALUES ('521', '1001', '587912', '1532240974', '1', '0', 'd085dcc3ce98c07c7aa9fc761188badf8b8c119bb20ecdee049773e213ce3b4b', '1.jpg', 'default/20180722/7abcf1ad35a540f058ce1b1cd6226ebe.jpg', 'd085dcc3ce98c07c7aa9fc761188badf', 'f88d77091d1477f8fde77078f08d05c5915b546a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('522', '1001', '1206950', '1532241044', '1', '0', '92352c4fe6d099e2c19f3fe125a2b657448c3ef05429e8926feec1899eeba624', '引导页.png', 'default/20180722/c8c7e99a05ed847c266e6a686dc28cab.png', '92352c4fe6d099e2c19f3fe125a2b657', 'cda767bab50ca7156e85b52225d44943386842e1', 'png', null);
INSERT INTO `cmf_asset` VALUES ('523', '1001', '24331', '1532241739', '1', '0', '28e35ed8e876a997a25b6f54b6f576faf02f95dd76a5ae8ac53b98c415d36b66', '荷韵.jpg', 'default/20180722/2732b33672b1a836f1e7010c22a668fe.jpg', '28e35ed8e876a997a25b6f54b6f576fa', 'c4e41ca27ed926cf9c817173becf5c8c0230040c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('524', '1003', '868308', '1532253325', '1', '0', '5a9b43996747d7f95dd4d315346d3a1f3806f31c538fa17668a987c741096414', 'QQ图片20180722172108.jpg', 'default/20180722/f6933783f9e5d6852daba05a7efe82e2.jpg', '5a9b43996747d7f95dd4d315346d3a1f', '8adfc03729ce9261439265173d4769558c30a6b2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('525', '1008', '471471', '1532275662', '1', '0', '7100522af11b3960c2d1c5ed278aebe81ecd902aa7f3dc451c8884910422815a', '超级截屏_20180720_142441.png', 'default/20180723/e8bcc3cd1f364583e509cbbf49855eed.png', '7100522af11b3960c2d1c5ed278aebe8', '48d28b4ef6c6e4c24749fbb6ef05dc1f07bf6da2', 'png', null);
INSERT INTO `cmf_asset` VALUES ('526', '1016', '1257310', '1532345427', '1', '0', 'dbb33b37750624ceb5968169da5f4702c0db7c5c070355dab9012b19c3eea900', '成品.jpg', 'default/20180723/828ddd23ffa1ffb4955ef5e61d6fdc02.jpg', 'dbb33b37750624ceb5968169da5f4702', 'c7cf8df6e43eb04815b3c4b21bd9150a54991e2e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('527', '1026', '184743', '1532429527', '1', '0', '7e0da4e976610a4b2e7f40082f8d6baa578536a6e99fb873bafe8146c41cbf48', '02.jpg', 'default/20180724/02cf8460f55b55b663f4d43fd10d7751.jpg', '7e0da4e976610a4b2e7f40082f8d6baa', '66276172c8bd26935b7d9a29402d916b5d651aa5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('528', '1026', '355040', '1532429680', '1', '0', '877573cc319fc68ac4c5b169fe921d845fbb4b83c48c412960299d2a01ceecae', '07.jpg', 'default/20180724/95a4c52551b4bf0e8c96782eb56cee00.jpg', '877573cc319fc68ac4c5b169fe921d84', '4903cdaa08219acabb464906042c3e3875f69ab1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('529', '1026', '1868423', '1532430043', '1', '0', '93c77709668e451a7533cc4bf04f5be88a5811538d938aba70b7998ed562f5a1', '珍珠锅详情.jpg', 'default/20180724/26b45abb42f42317e9cf4efe701c3b8d.jpg', '93c77709668e451a7533cc4bf04f5be8', 'dead09d290a5dad974b804e98590e3abf044a97d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('530', '1026', '532667', '1532430292', '1', '0', 'f460517ef11911f7a35f89842a73ce678fd7092dda4f7ed2d8168d784dbae110', '767车图_07.jpg', 'default/20180724/8d36dcaabe705ef4dec372c0a19eb3ae.jpg', 'f460517ef11911f7a35f89842a73ce67', '08b279cbaed20f9c803cb9f203b96fc799da8260', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('531', '1026', '502320', '1532430409', '1', '0', '9f5fa2b6def99c961c589b5553cd662a703f37feb90c61a2093b9fd6713b46a4', '车图_03(2).jpg', 'default/20180724/d3bf5a0f57272cad5143ce9cbb53c313.jpg', '9f5fa2b6def99c961c589b5553cd662a', '94509ba6f9409368b30be8297c1dc9f844f233d3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('532', '1026', '636915', '1532430480', '1', '0', '6e903fea39fe3a6a89d82667ac1655d4d833caa5cc53b5c0260504c84d58a58b', '车图_05(2).jpg', 'default/20180724/e629e13d9459450337d732197934500f.jpg', '6e903fea39fe3a6a89d82667ac1655d4', 'fcb721fe388dc11679913f3199cef6901cba9507', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('533', '1026', '472471', '1532430524', '1', '0', 'ddfb7ec42b64b0b8c0b782b6c1b86a203f45f30bb4671ef16dc8ad56ca2eccc6', '车图_06(2).jpg', 'default/20180724/4679e24fa8cf6967a9798f22983a6a48.jpg', 'ddfb7ec42b64b0b8c0b782b6c1b86a20', '6b21c72d1977ecf076d28a3b892b8daf476c34f8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('534', '1026', '1427983', '1532430903', '1', '0', '5ed96e24c3a3a3a635223c9c829c3853916a0a0ead9ad60b54d881a9354e6c85', '767详情终极完成版JPG.jpg', 'default/20180724/e30c10c2d5a65de439f3be2ee7f0c124.jpg', '5ed96e24c3a3a3a635223c9c829c3853', '0a60b73f50cc75472b097c1d653659f1d4cd8adf', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('535', '1026', '493592', '1532431123', '1', '0', '20795d9c27c2932ad1e19a3c3ec6deff870b2ccb253b0c5beddfa1d11642ea41', '车图_10.jpg', 'default/20180724/7a36b09c4fe278f30ca7d886cb869884.jpg', '20795d9c27c2932ad1e19a3c3ec6deff', '9b1ef01bb93f5f8cc55fca3d352254ffbbfca9a8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('536', '1026', '496517', '1532431246', '1', '0', '734fbb7a74ad701da5d36a26f8924491a11a58105d4a7645576e5509e3b123b6', '车图_04(1).jpg', 'default/20180724/837d4cadd6368dae276520d1060732ce.jpg', '734fbb7a74ad701da5d36a26f8924491', '200f2f68b84b51e27fbc476dad9cff3a4a7d16e0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('537', '1026', '1224686', '1532431514', '1', '0', 'b01066b7c1dbef67104759bdebb0c11dcac49e2e6ee578b7f1cbcdea38822114', '电炸炉详情（单缸定时款）.jpg', 'default/20180724/4a959246ece51e2f1dd158ee341181aa.jpg', 'b01066b7c1dbef67104759bdebb0c11d', 'c5c369ec379f3f572509f679ece5743195cf5352', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('538', '1026', '410813', '1532431597', '1', '0', '016206b6793ebc3149024c77c43df4000ca0aab7deaf6b50ec71dccf2fde24d8', '章鱼小丸子机主图_09.jpg', 'default/20180724/9efee75a4f0568ef04dc1ec9f177917f.jpg', '016206b6793ebc3149024c77c43df400', 'bc648ace5fd8de49989fd32f166e15c40cb21d08', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('539', '1026', '548027', '1532431678', '1', '0', '4ea61607efc21e3c72541c3121e0b1ad0d5e1e6ca0c1018c40bea839e6c3bb5b', '章鱼小丸子机主图_12.jpg', 'default/20180724/54b20b39855fb6bdc8564eb9a5e25716.jpg', '4ea61607efc21e3c72541c3121e0b1ad', '50655b1fcc362b596040bf629f5ffac91f5ebc45', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('540', '1026', '430122', '1532431705', '1', '0', '760db0970963a58bf61627240c04d95546f14c60c2efb59bc3570ec1dfee1b5b', '章鱼小丸子机主图_13.jpg', 'default/20180724/6cb5ab6566fbc934846dc9e72e15d83c.jpg', '760db0970963a58bf61627240c04d955', '097f06d0f357d6592301d04f2d25529181478b03', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('541', '1026', '615293', '1532431794', '1', '0', '1e2349d869304edcaaedcdde75e7bb00af5f46aee2e6a28cdb015f9272b13fe1', '章鱼小丸子机主图_05.jpg', 'default/20180724/24ffe0b55b483170c9d34a6e95f96710.jpg', '1e2349d869304edcaaedcdde75e7bb00', 'e57cb86fa34c9df3406e0ca1b7ec06cc946c197a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('542', '1026', '1811661', '1532432082', '1', '0', '623b61847ed6c23354513c2a544f7bb8abed696b1ff401598094b95c70379be2', '章鱼小丸子机详情（电热单板）JPG.jpg', 'default/20180724/f1cbd9522c5443902bd9d2d9a230dd9b.jpg', '623b61847ed6c23354513c2a544f7bb8', '1036b7f3469c09db4daf1516900a56504c738ce2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('543', '1034', '623148', '1532501776', '1', '0', '27a77350f8e3b05bc65133e6fe74907d909bfa933be249f09bcb20c84cbeb0a6', '详情页地球与信息的版本.jpg', 'default/20180725/b4eb0b82852033f7a60deec67e5cce12.jpg', '27a77350f8e3b05bc65133e6fe74907d', 'bd2f6e626b1ef64d5f3dc02951461b380d03dae2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('544', '1038', '167087', '1532504826', '1', '0', '90b90e5e9b70bc2d7e317bc267cc1049eedeb241e992c532b81a7f297e81d390', 'QQ截图20180725154144.jpg', 'default/20180725/28f046daa03929e2941bc90f2e69f490.jpg', '90b90e5e9b70bc2d7e317bc267cc1049', 'ff0156537a67454194fd8dbbe194b04d6effe394', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('545', '1038', '174644', '1532504962', '1', '0', '8f96f54ef8a86473b198300b0acf0dc415e1c95ac2c9bd60df2f4a0883b1ec46', 'QQ截图20180725154239.jpg', 'default/20180725/9011b8151eed949522d4e997f119a5c7.jpg', '8f96f54ef8a86473b198300b0acf0dc4', 'b18c1c3c675718a779c2051a92854cafc2958466', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('546', '1038', '114691', '1532505005', '1', '0', '9f6d7185f96c2fd0404146506f5455b2bb8688d6a019bb4b329191eb560fdc64', 'QQ截图20180725154318.jpg', 'default/20180725/8b3b0bb376b85471e61d259ac1d1fb90.jpg', '9f6d7185f96c2fd0404146506f5455b2', 'b6be401a6186351434921995c8ddff3fcecba0d8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('547', '1038', '67085', '1532505327', '1', '0', '23db47f39809d0d0784d79f91037047a0ebd0a84c70042fcb01e41f327b3b966', '微信图片_20170327130819.jpg', 'default/20180725/0b0fc3496fc027160727e90d587ed13d.jpg', '23db47f39809d0d0784d79f91037047a', '36bf93ccc1fe007bc16cc2002c0ce1a7f5fed4f1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('548', '1038', '298144', '1532505340', '1', '0', '125f7be07f425b22c454ef17735a42f35c2cdc578f926f0b12ade00c6bc73f31', '微信图片_20170327130850.jpg', 'default/20180725/83be92024c537fb11059ea909bf10754.jpg', '125f7be07f425b22c454ef17735a42f3', '971c266ced3216d3a29c777e19761a583799253d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('549', '1038', '79048', '1532505396', '1', '0', 'e806e7b9d5433cf8f746681d84ad67e8b9cee30d68874b2451ae1722b30c31af', 'psue (3).jpg', 'default/20180725/f791f4e78b838b26d63c156393bc79d3.jpg', 'e806e7b9d5433cf8f746681d84ad67e8', '0553f303c903345acbaf10ce4ab67e746db6eb6a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('550', '1030', '509629', '1532520581', '1', '0', 'aa50477f023f71eee0bbfe5e858ac1233363d24f70fc994ee08910f604b6d607', '10.jpg', 'default/20180725/1e070b508e67a3ff078410fecf71c7ef.jpg', 'aa50477f023f71eee0bbfe5e858ac123', '6ca78160c352c7830354f5d0b59cf6dd4443d609', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('551', '1047', '2080672', '1532599093', '1', '0', '59949b43e452922a86f3f4b5d8ba268f92f1b818b315e4cf789c14c8af3c7eb9', '2018RO-019.jpg', 'default/20180726/375b081d2f55af1d8233f0553d145382.jpg', '59949b43e452922a86f3f4b5d8ba268f', 'a3d6d0bf8f5eb50a0d765bb4b23fe1ce76d7b0dd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('552', '1047', '1378953', '1532599368', '1', '0', 'a877105dcf8c14f571080ac9904223c22667afe23a36fbd83dc86dce92186e9f', 'GB-RO-03S（修改）.jpg', 'default/20180726/e3abfada055dfbdc3d3d59727bf36747.jpg', 'a877105dcf8c14f571080ac9904223c2', '228d69782960536fc5f0f722122c1094bf66e4e6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('553', '1048', '1603680', '1532599652', '1', '0', '232ecbeea5089b35b12cee20508c0654faa98d6b68fada993854cbb6e3d4d1f4', '过年不打烊移动.jpg', 'default/20180726/8ce93c8930c8f87fdfc4ebc0189e9133.jpg', '232ecbeea5089b35b12cee20508c0654', '24ea165c48806eb6c85855dc5c1ded8697b7b9f1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('554', '1048', '1063145', '1532600080', '1', '0', 'fe9a94a3e0e926afb52e428d6db95b74c583fea6e58089a851240ecc423a2802', '迪后海报1200.jpg', 'default/20180726/921cedc3e993dc0cb9a6afa0096b5dd2.jpg', 'fe9a94a3e0e926afb52e428d6db95b74', '65bb95464ca7fa9e8432c6e9312e1ae11f247445', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('555', '1047', '929596', '1532607499', '1', '0', '312df427839e7e0def3404b533ad9c9d16e8d69ca78d70fd49c4376ab4a3088a', '_DSC4492.jpg', 'default/20180726/febecdf50bb2335789d9833c6457ff31.jpg', '312df427839e7e0def3404b533ad9c9d', '6e80b5cd1fe0c432cb987b187b4231e02db460ff', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('556', '1047', '200419', '1532607673', '1', '0', '22071d02cccfaecbed961af8cf624fbe299826a020763e55cb6e04367e5ebb84', 'GB-CAplus.jpg', 'default/20180726/fcada9ec57a1934ec8d78371c5a11b38.jpg', '22071d02cccfaecbed961af8cf624fbe', '7b061171f1a8ad97c3d4d6abe595c37b2ceb16f9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('557', '1047', '319032', '1532607714', '1', '0', 'f9d8ad01056e88ed3e20512b4a222b30bc279f4bdc5b7ae920732a39aba87d18', 'GB-RO-019纯水机.jpg', 'default/20180726/d18f1c95fd5a457fc5feeac741e8f21f.jpg', 'f9d8ad01056e88ed3e20512b4a222b30', '6c61728085f56e6d9b11de00f62dc02c7db00515', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('558', '1047', '594830', '1532608006', '1', '0', '90a23cb687efd99cb799692638be7b5b3edcb59281d1b52dc3f07ca4339e41c2', '59cb556a06b91.jpg', 'default/20180726/7007b52067274cb93ad172dae0008d26.jpg', '90a23cb687efd99cb799692638be7b5b', 'e98e90155ff955b6002ea8b2136583ae04fb0b0e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('559', '1047', '245227', '1532608122', '1', '0', '71490b7d16c3a73438c4523a833b390b211516ef775db26a791916056efd94b9', '59cb556a06c5f.jpg', 'default/20180726/3f8ab97cdee5ee14da99ba1230a61f25.jpg', '71490b7d16c3a73438c4523a833b390b', '181885606f2daca370a8018f75b7737f6965a7c4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('560', '1062', '191192', '1532683275', '1', '0', '4fcf277dd02fd47e4bd3581d28d22c36652b59966673f6d78694108372149f2f', 'app跨店铺3件7折 2件81副本.jpg', 'default/20180727/3ae0c3473b40ae30a6a7fac89676f50f.jpg', '4fcf277dd02fd47e4bd3581d28d22c36', 'a6fbd2ffa01b68da18e92953002b39db7d83dd11', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('561', '1062', '298274', '1532683290', '1', '0', 'a4a7d59e6c56ed72fb60b32204dbe2077a0f0821f63e6a3ad89305bfada3678b', '4免2.jpg', 'default/20180727/04c8208bee876a8d88ff2d44ff5de6f2.jpg', 'a4a7d59e6c56ed72fb60b32204dbe207', '73a3c59d9a6d5e3bfdae0e29bca2501972c8bff6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('562', '1062', '298310', '1532683367', '1', '0', 'c8b6382193d5880dccc4497b096130ffaf3f5bf827bb59fbc931e3a438c3c1b0', 'app4免2.jpg', 'default/20180727/1aebdfdbc330d53f0a8aa71211af23db.jpg', 'c8b6382193d5880dccc4497b096130ff', '26296486d3b3ea4d333bb3f3fa8dc5ac8dbd8a95', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('563', '1074', '1738427', '1532827586', '1', '0', 'ca753f0da0eea83bcd9033703e47f01a881c9a52ff56af4f4c17569cff354974', '首页_看图王.jpg', 'default/20180729/24fcd54a1d530e47cee8432fed1ea96c.jpg', 'ca753f0da0eea83bcd9033703e47f01a', '2df0213079a22c47c20172a2f8990f88aa81d06f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('564', '1074', '545789', '1532828608', '1', '0', '90b219e38eef7671dc27c3d67244ee1256a182bb37f98ca8c70991026f3f70a3', '简爱香薰风扇.jpg', 'default/20180729/eadc55b14ca7f2dafdfa66b73ecc6091.jpg', '90b219e38eef7671dc27c3d67244ee12', 'b878f908366f9ad7938161b3a4b63f6f09523c5e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('565', '1074', '566212', '1532828621', '1', '0', '1a4978129e35e3ab97b148c93253449cab83573749352d5d636fd9403a992133', '鱼宝宝手持风扇海报.jpg', 'default/20180729/6ca45ee1527ae76dee48662ac7063311.jpg', '1a4978129e35e3ab97b148c93253449c', 'a85f60a24c91e596d1a0a87aa24ddb377bf06271', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('566', '1074', '454326', '1532828655', '1', '0', 'af4a3c5220b6430c47e60f140083c5e3cffb2f1354fbeacefe9a22589dc9fdd7', 'Q8海报1.jpg', 'default/20180729/4a6b590fc6707a3b9f54d5db0a0470bb.jpg', 'af4a3c5220b6430c47e60f140083c5e3', 'c4ef2c197bc1f5499e5db93e9e175e91110e3576', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('567', '1074', '975371', '1532829593', '1', '0', 'd4cbb108c35ec2657183e87354889f01fe5df896404f07778f98e9c7268b6942', '远成天安招聘易拉宝_看图王.jpg', 'default/20180729/de9592a11eba8fad6dbcdc0a7745ec60.jpg', 'd4cbb108c35ec2657183e87354889f01', '8b4c334d6d52c08b62c774c502220fb420254ee7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('568', '936', '901576', '1532868134', '1', '0', '604bbae7468a6d460f401fab728f54ca9bc1986fec7b5a54db2fed7946bb090d', '面包海报.jpg', 'default/20180729/6059eed64d354953e68bf591e82b1f32.jpg', '604bbae7468a6d460f401fab728f54ca', '09952b47202665f34940a5e0288d12929072f8e1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('569', '936', '275523', '1532868331', '1', '0', '9ecbb310defb980c0e0cee412995320dd04aab7023d668895dbb6e7700bf1b64', 'QQ截图20180729204519.png', 'default/20180729/4bcf9cc22105e9f0980224d2a9acefea.png', '9ecbb310defb980c0e0cee412995320d', '1adb90ab7a7abc90b9de1eaa6e249fcec43e709b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('570', '936', '941823', '1532868445', '1', '0', '81ef11ca4e64abd25ccb2a0fc9bddab640f8a9a6b654fc79da845a767c3f460c', '女装详情页.jpg', 'default/20180729/31f969eb2a0872d7f25c3a84dadd0abe.jpg', '81ef11ca4e64abd25ccb2a0fc9bddab6', '04747fb231c92dde03418d97f1bd4c4f072d291d', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('571', '1090', '954972', '1532932845', '1', '0', '42fce723808873c645b7ead1f8be694295fe6b52a48a392e0465125257a44563', '1.jpg', 'default/20180730/bf95099cbc007e544b2b38174c8a3f0c.jpg', '42fce723808873c645b7ead1f8be6942', '9ed5c6253c8a4015f7e35e2c5c4a2c9b23d51f75', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('572', '1090', '62234', '1532932925', '1', '0', '92946a8895c787c3b7d11629e0c95d7c0ff334eede17d16669fd52780f2661c3', 'TIM截图20180730144144.png', 'default/20180730/e339db3268189f27894470c93cbbcfd1.png', '92946a8895c787c3b7d11629e0c95d7c', 'decdf07c9d4a89579465d48ad1a650fac5a5de53', 'png', null);
INSERT INTO `cmf_asset` VALUES ('573', '1099', '692964', '1533021110', '1', '0', '5a9f037f7a746eb0f397309e41925554093b2a56ef64acdcad10759ac8f4fe5d', '茶.jpg', 'default/20180731/9e14cb130704f4cd437d4bf77d54da1d.jpg', '5a9f037f7a746eb0f397309e41925554', '252da477ab7311a9c30ed8b737e7a71a20ed0440', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('574', '1111', '1076551', '1533107077', '1', '0', '3e8dcfb1112383eceedaa203f8c053fd267ad1b6acd396206a983bd6b3ba79a9', 'a580beb5b5474acaf76e83acb9f9f96.png', 'default/20180801/1edd9772a68ec924e73d2919ade400e9.png', '3e8dcfb1112383eceedaa203f8c053fd', 'df1133f14144fc0cd5d1e4648004a40b2963596b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('575', '1111', '400011', '1533107178', '1', '0', '3664fbd54e89907c31732a0bc662ba818cd6b1619a16dc3c622cb21066787425', '7ff857252e9af53c0f31f9d22380389.png', 'default/20180801/9f9eacd6c74bcfe8e7beb0d4340dfac3.png', '3664fbd54e89907c31732a0bc662ba81', '1cfb8e333e209c6fa15a123b21bb0e9f010495a9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('576', '1111', '402508', '1533107855', '1', '0', '89c3fd76e2ea00ef6df127df731479db469eb45e48cf968cc166ee29b81fb234', '57affe17ab448a3cc481feb45970302.png', 'default/20180801/ed5cbc4921fee367c5a5af33a2d22bcc.png', '89c3fd76e2ea00ef6df127df731479db', 'b47372c58d9ec84d24336f766960b27776e10b2d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('577', '1111', '966084', '1533107871', '1', '0', '80e72862670c3015914eb061c28f3950d103a5f38a68deaf67ce7262b83e5115', '4c7b1be9ba1f5ce5d842882e5c61b84.png', 'default/20180801/acf31b88deb9cdc00f6f11ce130e77ff.png', '80e72862670c3015914eb061c28f3950', 'c7f9e9f67bebc1c62ca8cd955dea4af2854db02e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('578', '1111', '95096', '1533108564', '1', '0', '5069b114fda6cbde79ec3febca6fbb3f5977734fad9fd4944a3b511f0e32e398', 'f9e5b0eb42c9cfaed1419d9692bf1c0.png', 'default/20180801/67fc9a41ad26990fa8ab242856f964cf.png', '5069b114fda6cbde79ec3febca6fbb3f', '4f9a5b1bd88d475f876d43f5e15cc41c64b21542', 'png', null);
INSERT INTO `cmf_asset` VALUES ('579', '1111', '165632', '1533109165', '1', '0', 'eb8125951855e5fa8605ab9dc4670d989709ed37db73750b372c3930e7284926', '老胡-艺术舞蹈-LOGO.jpg', 'default/20180801/bc9fe76417eaaec9890bd59ff4ed38a9.jpg', 'eb8125951855e5fa8605ab9dc4670d98', '1052bad9d7a27115a1fb9c2509469d148290855c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('580', '1117', '1854703', '1533169859', '1', '0', '7c8320980b5e3d338883e4983ad3ab0c953f984e9f62a1baefb6a126979fc2ee', '2.jpg', 'default/20180802/bf9213626fd970d316538b0043d02d1f.jpg', '7c8320980b5e3d338883e4983ad3ab0c', '63db4f209cdb2bfd11e3444b54377d8f3c8516c3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('581', '1117', '386557', '1533170060', '1', '0', 'c59ce26943090486525a89fb0b9f4a578a28b159e43d1e5810b7a27cb3e49858', '1.jpg', 'default/20180802/e6df8480d5629d265c7a5bd072efe1f0.jpg', 'c59ce26943090486525a89fb0b9f4a57', '3e9db70deb4d47b46f9285b9243b7d7f34a81c7c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('582', '1117', '1532451', '1533170151', '1', '0', '177c1f1ee0ebdffa9587259cf0337c34da9d9b0b5951b1b7f5ab382fc411d009', '2.jpg', 'default/20180802/1dce36c60f5a1b562b97fbeadf1ef367.jpg', '177c1f1ee0ebdffa9587259cf0337c34', '989036168a2811fe6da7584a0c5a68d57f1246ae', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('583', '1117', '595325', '1533170248', '1', '0', '110e1b958ef7e9b7cca73dceb48084f8aaa3d1a3f8cd12426a5f725a1038ea9f', '2.jpg', 'default/20180802/979c9515afab21bcd90fe02b18cbe396.jpg', '110e1b958ef7e9b7cca73dceb48084f8', 'e649e13b7c0eddc393c5ae4f5a11f4f5aa7e6798', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('584', '1117', '258287', '1533170316', '1', '0', '316999c4a2c5aec4a7b158865f526cbb4b3b16ed2d7e58202bab8f0f25a57a40', '1.jpg', 'default/20180802/a1987c32d8ff6b9ea224c5a8f4bcb551.jpg', '316999c4a2c5aec4a7b158865f526cbb', '5c9d3dc808e8a8a94377970eecb562cbb6183d40', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('585', '1123', '807839', '1533192561', '1', '0', 'c2f06a3f084016bf2420fbc5f078632c9517427bdef8f0579052dc5382ec8c70', '案例-11.jpg', 'default/20180802/863ab7d78c26016bc4352ddaee149483.jpg', 'c2f06a3f084016bf2420fbc5f078632c', 'e93e372c7f2a2f215f08b14997e2dbee2ec1d461', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('586', '1123', '410690', '1533192779', '1', '0', '1107c9e38b82f16517d16c846c3fd80e05e6194281cbb3c3618d07361e540176', '案例-11.jpg', 'default/20180802/02b617b41fd8bb33f56338ebec5c9a79.jpg', '1107c9e38b82f16517d16c846c3fd80e', '0dc4fc6f634ec902bd681b2a0ec127f8ed3c858f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('587', '1133', '2088457', '1533270035', '1', '0', '5b6f6ffb61c36330e29a2b33ec9311c2e4d02b71491dfe9dfc771e0a16714748', '香辣肥牛.jpg', 'default/20180803/642b98e816535758a0df3e1947c65126.jpg', '5b6f6ffb61c36330e29a2b33ec9311c2', 'dfe96a77d22241ba43d6a4a16488912cd1503919', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('588', '1137', '855984', '1533284968', '1', '0', '9393d110798d12b0da60515aa440fab0c68116d46d671458d79881bd527eac02', '1.jpg', 'default/20180803/1b2f6e7d46e3a8c3ea4c2d5ea754b599.jpg', '9393d110798d12b0da60515aa440fab0', '0e6167c734bf7128957b0d61e835d5d2630634c8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('589', '1141', '1443808', '1533353616', '1', '0', '5ded0e39d6e357fae49aa1118b2aab6dd25e3d652f8be7fedfcded480bb7783c', '企业简介定稿.jpg', 'default/20180804/ffadcb46cf02ffa0e999d28572a67eb1.jpg', '5ded0e39d6e357fae49aa1118b2aab6d', 'ba4bcace01102c32fc8ca38d454ca1da70d50341', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('590', '1141', '1564733', '1533354097', '1', '0', 'fb9a11ff7437c8bf24aa2867949e27da55545b2b48c739ab7847fbc2caf9a771', '企业简介定稿.jpg', 'default/20180804/1762a46706ed6939ca24a096cc4ecc8b.jpg', 'fb9a11ff7437c8bf24aa2867949e27da', '36523d482f0ffe123b750f750acb88023f6bea00', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('591', '1141', '144313', '1533354631', '1', '0', 'a28841930488c33042a809500e414ec0a49261a858880100d78ac79481d4ba99', '微信图片_201808041146572.jpg', 'default/20180804/9ec5bbc38c4618aecddd6f09d4513605.jpg', 'a28841930488c33042a809500e414ec0', 'da7a2d49d37b72d801d15eacb2b2a620105256dd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('592', '1144', '583857', '1533366654', '1', '0', 'ab2b279bbed2f6c76e8b17ecc200cb97beb09188aa03a90578e338077eb323a9', '详情页16.jpg', 'default/20180804/eeb99cda739c8908f6f03777619c96fc.jpg', 'ab2b279bbed2f6c76e8b17ecc200cb97', 'bffd9ca2734975dbfd41170c58a1289406a051b5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('593', '1144', '241174', '1533366674', '1', '0', 'e75aa9db4d38ebf245f0e99f870a4788871de964ccfbb34a5f013024d6e373db', '详情页10.jpg', 'default/20180804/aa33ab1bb3ecec1d2c573a015eff45f1.jpg', 'e75aa9db4d38ebf245f0e99f870a4788', '25eec32a8be59e37bb603c88fd8b2fcace1d4d61', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('594', '1152', '1100135', '1533461210', '1', '0', '934a29a99c90ddfbc971be115a8d2fc5f1a363ac789942de17cef60380b9cb6e', '打印机.jpg', 'default/20180805/ea80df92e7fbddded4c6968fbe2811cd.jpg', '934a29a99c90ddfbc971be115a8d2fc5', '5acb943431ff73a0617bac2af2dea4a7eb4f29d1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('595', '1152', '503222', '1533461307', '1', '0', '1cddd8a158f09e29377f46acab3f8cc1324b124c2df3ddd2393752dd5b6d35d7', '主图.jpg', 'default/20180805/d321eed53a179760456b18378649ae3a.jpg', '1cddd8a158f09e29377f46acab3f8cc1', '0ad90bb946785764630b59c8e5532513c2de85db', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('596', '1152', '483838', '1533461359', '1', '0', 'ccd1029a8dbfbe482f6d34cca413f783b02138302c8ac318db17bc842373424e', '主图1.jpg', 'default/20180805/d61ed4adbb7caf7051923cf8a3b7e075.jpg', 'ccd1029a8dbfbe482f6d34cca413f783', '1c9bf6fb2dabf69318c84d0662f55e0b2a2c2312', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('597', '1111', '34926', '1533522763', '1', '0', 'a09800aabc028e03b170f5c0c572fac394b61310bee06bced3db8064d15bfc9e', '信宇体验中心-LOGO.jpg', 'default/20180806/7990735a872d9f24af5d8b4b0fddfede.jpg', 'a09800aabc028e03b170f5c0c572fac3', '2a1cce28803b5fb548c0b0b11d9dece6c69a291c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('598', '1162', '1530739', '1533545755', '1', '0', '87ef6ea782806f986424037140a9edddd14626f64d9c9621c819c0c15af0dc15', '11-恢复的-恢复的.jpg', 'default/20180806/8d8e0a299d1c6a01af252788b9c2b1fa.jpg', '87ef6ea782806f986424037140a9eddd', 'a3754c9533e1811d86f17c37b2375b80cfaf872b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('599', '1165', '399865', '1533557545', '1', '0', 'f7ebdc95f53632e6a575ed798ffa2e6bddb9e287b3c9b044f8ade14c778c7a46', '70粟康.jpg', 'default/20180806/91335f34188ffab224d623de58d290c2.jpg', 'f7ebdc95f53632e6a575ed798ffa2e6b', 'd35e8583421b606f2bd0938882186a0d7ac44140', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('600', '1166', '1033463', '1533557562', '1', '0', '4e92ab2e6a2ce0ef0051e10e80fb23f3d75f0ba3e40c9ae1b00595e57b43e867', '2345_image_file_copy_1.jpg', 'default/20180806/0fb0169ee4f034daea5ab955fb3fd741.jpg', '4e92ab2e6a2ce0ef0051e10e80fb23f3', '2b3e3394f650fd166bffea0ccebf1c96a079c6d7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('601', '1166', '1972585', '1533557818', '1', '0', '5ef19ca8f5596736537e179884283ab15b8237a7f6656b507b8f88e20acdd8a0', '05李小龙考试.jpg', 'default/20180806/4b4168dde74f4d9eb05a2292474ad951.jpg', '5ef19ca8f5596736537e179884283ab1', '20c230ac6bf6d3770a2f7896c2cdc80376abf99f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('602', '1167', '315238', '1533558014', '1', '0', 'b95b17d70873ca8da2e934efc0885a7902575579d6f2c0377893973252e38174', 'r577dqr3v18y3q4qqk9b.PNG', 'default/20180806/a26ca36c220ed9039158fea3d3131169.png', 'b95b17d70873ca8da2e934efc0885a79', 'b61d9ff19a976d42205991c21185534a04c38892', 'png', null);
INSERT INTO `cmf_asset` VALUES ('603', '1186', '981322', '1533629893', '1', '0', '937be93a2f29e9501bd927a9ab670143d4485e1b82fb80e443c133d13e38c3cb', '呢一_看图王.web.jpg', 'default/20180807/d9f7ba4cccedcf7d563b10337283b780.jpg', '937be93a2f29e9501bd927a9ab670143', '230ab3231e2c5c982f746a07bbd2251fe72c0574', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('604', '1186', '699871', '1533629984', '1', '0', '37fd341da58eda7b4214ab1a4f8d478a9fff800d2542b40a83f7c8b357eb5873', 'QQ截图20180807161637.png', 'default/20180807/67dc1d706d820a871b3ea6a84f0ddf79.png', '37fd341da58eda7b4214ab1a4f8d478a', 'f935c7b29556c86bd24c75b8ecd32c1c56587a34', 'png', null);
INSERT INTO `cmf_asset` VALUES ('605', '1186', '1936990', '1533630007', '1', '0', '8bc82a824c7171df0f195ad29ea57bf053e53d43d18a00092076c2247f2c26c2', '酒.jpg', 'default/20180807/a67c34f7513aadac69b1d3ca0bbf86fa.jpg', '8bc82a824c7171df0f195ad29ea57bf0', '943bd2cbe02f66005d3c713c00d034b9981167af', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('606', '1186', '1975167', '1533630247', '1', '0', '02e06161f987b070265d4137e2eaf972a2ecb72dcef0bdebb0fc4608b2a97457', '0105435a14d861a801205187c8b178_看图王.jpg', 'default/20180807/c258f46cc5f714d798572e36ffee429c.jpg', '02e06161f987b070265d4137e2eaf972', '9e9f04173a69301686658fe52a11228dd2ccb782', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('607', '1186', '607767', '1533630345', '1', '0', '8fbb49d81776d075acc2768542b1ee48ffe4cb0aecdec65391a4637f2dc7eaf3', '01167159eea55ba801202b0c595d1b.jpg@1280w_1l_2o_100sh_看图王.web.jpg', 'default/20180807/a48baafd46ec328eba1fe5f2989cb003.jpg', '8fbb49d81776d075acc2768542b1ee48', '7b7dab2f40fdb3218687658cae569c9489268ce8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('608', '1186', '519950', '1533630764', '1', '0', '21b0474889958fc966d782b552181ae7cf02299f7995c26749c128466600d2bd', '01d5a15896a139a801219c778ac18b.jpg@1280w_1l_2o_100sh_看图王.web.jpg', 'default/20180807/893424ab4720164d2b9311d479373fcc.jpg', '21b0474889958fc966d782b552181ae7', 'a20dee43f8e907ed76e71e95ea9aecde070475d5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('609', '1191', '305683', '1533634133', '1', '0', 'b09fcb0ae97f103713ae3425d04767e004ecb5dc4567f2cc1c48fccad6e9a0e4', '1.jpg', 'default/20180807/8ae9c19a4662b6f9512070c46db31305.jpg', 'b09fcb0ae97f103713ae3425d04767e0', '5c873cce266f985b95a6ce422a4139b9cbfb7ae0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('610', '1191', '109242', '1533634380', '1', '0', 'd8ebf6712e5bc6986090fe91735400956fd37967415ab8d4d8dbbda3bb0a064c', '1.jpg', 'default/20180807/a06eb3e852e314b9617d16c5f065e79f.jpg', 'd8ebf6712e5bc6986090fe9173540095', '0176727e8ccf880cb1233bdabb5cfd6af64279b5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('611', '1130', '382358', '1533646272', '1', '0', '0c36adbb73718fa60421e3d5cc049957c4ce3dde16c0adc8591bfd6f73cbdd5c', '新品优惠---1920.jpg', 'default/20180807/7b37df308e6b09416b592298bd6dd62b.jpg', '0c36adbb73718fa60421e3d5cc049957', 'f4d4fb8b9b8ab80416a0a91a71f701a88337ce39', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('612', '1200', '502444', '1533693782', '1', '0', '7e58e45b9494e7dce91092964dc2dd12a27a3cd637ae25549fe4a8662cb50d19', '鞋油详情页.jpg', 'default/20180808/d9a3806defbee0b792cbe836e435e132.jpg', '7e58e45b9494e7dce91092964dc2dd12', '52ad3d8615c25f8331b3fa7264eb7844c8d466cc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('613', '1200', '1736948', '1533693830', '1', '0', '8eb28a0a1754f36a0b9503a01c3a16ee21db5a041a28cd2a7f450aceacd7453f', '鞋油详情页.jpg', 'default/20180808/fe3593f19a441351c02178906b9f0447.jpg', '8eb28a0a1754f36a0b9503a01c3a16ee', 'd25485c83a59fa9034d5808e11b042a3b7493443', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('614', '1200', '1304218', '1533695665', '1', '0', '437836dfc1a8b2bbee3dc7fc85913f714a566ed9d227440ff2e7205f2b71fbcb', '医用.jpg', 'default/20180808/4e6de61bed7e45b285b923b0e3b1b87d.jpg', '437836dfc1a8b2bbee3dc7fc85913f71', '7c5006edc5986cc18b455dce35b640e18ddd37f8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('615', '1099', '425380', '1533741268', '1', '0', '8cf4cbb074a40f35133d88f55b35d6e281f7f3351844d37dac7abb294ea72567', '高跟鞋.jpg', 'default/20180808/368e65948776ae092a33299ad9f2cbad.jpg', '8cf4cbb074a40f35133d88f55b35d6e2', '36c800f0dff07e454f1bcdc965a1b9874c4422ca', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('616', '1099', '466511', '1533741345', '1', '0', '676da5369ca7b32e9c261687d39d6b72c85d9846d8087f84315df2f3423e3712', '耳机.jpg', 'default/20180808/f1922413ca5cec3e388c0403f7472c53.jpg', '676da5369ca7b32e9c261687d39d6b72', '42d8e5316d67d51add7e997f3c166afee0a250f6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('617', '1099', '334781', '1533741730', '1', '0', '036482d6072aeb900be0dd9ca0ba076e6ed4397ec1ceddcea48719fd4783a280', '眼镜.jpg', 'default/20180808/7600574e025920d5f7e4c37c17594049.jpg', '036482d6072aeb900be0dd9ca0ba076e', '871878851ed82a51c62a6ed9e5c5760714bed4f7', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('618', '1099', '474530', '1533741835', '1', '0', '46ae242cab6c400cd1afa4b0660929f7af8098ed813389b5d8e04f41f2e0b0ab', '大促.jpg', 'default/20180808/b4200f555959e74a1d0796e30793dc99.jpg', '46ae242cab6c400cd1afa4b0660929f7', '7400f072d061251d33226f963e8bdbb9366ae0e3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('619', '1099', '469665', '1533742002', '1', '0', '6aedacf865e40aabb390ac8f549ddd22aaf684133ec2f84dcc358caff67d0d3a', '果汁（马赛克）.jpg', 'default/20180808/591fa25e5930c771c3c34d209016c49b.jpg', '6aedacf865e40aabb390ac8f549ddd22', 'ae74499df54a292b4f43bf1c88b505a53d2713bd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('620', '1099', '470231', '1533742151', '1', '0', '223866b1565c5adf1d69b4ca9a652cc92bbd194749c6401eebd4e22202c96016', '化妆品.jpg', 'default/20180808/c08c3b3b2186244d2cc9013c6c4dcfae.jpg', '223866b1565c5adf1d69b4ca9a652cc9', '3304fe6c1aa1499c3867a1327033c8e52ab4c429', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('621', '1099', '382054', '1533742200', '1', '0', '2a3ec6b0bc346618950a4002a88cc14fb25b4c46459bc14ae567bf30f5f4b688', '化妆品2.jpg', 'default/20180808/2920d5e9d400652557226d437c85193b.jpg', '2a3ec6b0bc346618950a4002a88cc14f', '0852f767c26233504ef6c434d05d85c61403eb26', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('622', '1099', '488933', '1533742303', '1', '0', 'f99dec3a266ab9bb08adf5830496f40bf994ddee1e3fb219c925b4a244ea319c', '牛奶.jpg', 'default/20180808/c6f726ef01e22955fb9eab14df52ba85.jpg', 'f99dec3a266ab9bb08adf5830496f40b', 'e1295efa0a3f9400ae25e793f527af58fbca280f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('623', '1099', '500597', '1533742446', '1', '0', '58b48700e45d93c1b9b2aa4eaed6f4b636fc627c6a31e0ebc22d99e782710fa8', '葡萄酒.jpg', 'default/20180808/c732c61c98b57c5302acec1a7f384008.jpg', '58b48700e45d93c1b9b2aa4eaed6f4b6', '44ec602c0ce098d0dd5a960a023ffc216d23f3b8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('624', '1099', '488927', '1533742532', '1', '0', '89e86637a9c5bc0abdd4c681a9cedf4db24759db878dd8e2f99beccc64e1fb76', '沙发.jpg', 'default/20180808/0b03c1a461c82a432830ee5f55d17503.jpg', '89e86637a9c5bc0abdd4c681a9cedf4d', 'b9f7aca3ad1f329c1428c711268871479a6a7205', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('625', '1099', '511146', '1533742682', '1', '0', '3caf9025f5a511b8e0a592b9ebd02d3cc6a9bb0260346198efbd1d334595af9c', '洗衣液.jpg', 'default/20180808/2faa6aa1df497583b840f4f261a080e1.jpg', '3caf9025f5a511b8e0a592b9ebd02d3c', '4e3176351ebd4e92bee8e1569b8485bbd1e09fb3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('626', '1099', '454185', '1533742708', '1', '0', 'c6b1935c6d2d8239af22b6dd3154126bc2b5ed9827d3c8dc81107cd79cfd958f', '相机.jpg', 'default/20180808/dbfbe402975fc92782aacb65c492cba9.jpg', 'c6b1935c6d2d8239af22b6dd3154126b', 'a3c7aa52287c4f03f4b15eebef62df857fa4f801', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('627', '1099', '464688', '1533742762', '1', '0', '0325e999375cb874ab4993f7e080150347dd7a61c323bf993b4bdfe4fc86540c', '雨伞.jpg', 'default/20180808/882c8764794917a005d8ead6a09c1f06.jpg', '0325e999375cb874ab4993f7e0801503', '93ccf3a9a24da9e8e3d8174e3016316fc759cdc1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('628', '1099', '255899', '1533742805', '1', '0', 'e0b2f547931f1ecf0f4fafc489ae0766c1a130a132ce23c1f6d0c7b616a7b9b5', '专题.jpg', 'default/20180808/0fe20b5b121f94233c97b817775d879f.jpg', 'e0b2f547931f1ecf0f4fafc489ae0766', 'd047b700d77cf0a3d9d4bd33fc17d3873fcc1fb1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('629', '1099', '493381', '1533743069', '1', '0', '49bc27d3ae67c572af4571584654aca368664681e7187527230fae4dca7bc259', 'p键按钮详情页（完整）.jpg', 'default/20180808/facbab96e0224a9ae01c0f21757fe5f4.jpg', '49bc27d3ae67c572af4571584654aca3', '583ac23fccfb8d976b12665312f3f20967a3cd5f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('630', '1099', '502943', '1533743184', '1', '0', '9a19f9916bb0433c9e03b18369d17e626bacfde07436b1e66b7af2273c4f3a31', 'P键按钮详情页（新-完整版）.jpg', 'default/20180808/bf6173631c864dd32f4a09c09686077c.jpg', '9a19f9916bb0433c9e03b18369d17e62', '8f5ccd2eebb20870d0aeecdee99ebd69695eb268', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('631', '1220', '273784', '1533785333', '1', '0', '3363e31f2c47871e7f4ff714eb79fdda7cdb30c83bf55098a4cbde561d399133', '579854dfd39222d0c84c8676266098b3_dGwBAAAAAAAA&bo=gAIdCwAAAAARB6Q!&rf=viewer_4.jpg', 'default/20180809/7945849f7b77f9857d1223e0ef43af63.jpg', '3363e31f2c47871e7f4ff714eb79fdda', 'bd8d62ab5bd6f0cbefbbf095a1e4af4bb10307ae', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('632', '1220', '253997', '1533785490', '1', '0', 'a4092b67a09f1cbe2f7c656358e693a6ac1878ba059dea0697b421575492d3b9', '579854dfd39222d0c84c8676266098b3_dGwBAAAAAAAA&bo=gAIdCwAAAAARB6Q!&rf=viewer_4.jpg', 'default/20180809/ca911f55ca6c70ecdf81182f12c44bdb.jpg', 'a4092b67a09f1cbe2f7c656358e693a6', '44b014bc639f7e89ccfb46e19b94a829967c3dd8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('633', '1220', '164914', '1533785559', '1', '0', 'dd58b764479ec9488d44014fbd5228200f2a491190e12954eef21b3ceadcc1d5', '{P}S@9Z3DGD`[G]FZ2S02(H.png', 'default/20180809/a0bae9d230997defa41f4358f0b7f6a7.png', 'dd58b764479ec9488d44014fbd522820', '5e5be3f603930a6ec10e5d6b4345914cb0d88927', 'png', null);
INSERT INTO `cmf_asset` VALUES ('634', '1', '548360', '1533872204', '1', '0', 'b32314efc88cfd8c7858a87f760b0f12754696a7c7e911ba7031ea4d1b5669c8', '5a22262c36f16.gif', 'admin/20180810/ffbb23718b983bed63891f632e6ffd51.gif', 'b32314efc88cfd8c7858a87f760b0f12', '5ae43755f4e63a06c95689c42f26a331e049473f', 'gif', null);
INSERT INTO `cmf_asset` VALUES ('635', '1', '381459', '1533872219', '1', '0', 'f31a75bc06041d279016d47bc3ddfb70796bae663ed034993e451bdef5f4ed74', '5affe6522d271.jpg', 'admin/20180810/71401e0880259ed26a817117e568222b.jpg', 'f31a75bc06041d279016d47bc3ddfb70', 'b731a0e4b536b8b850cfdcc5fc28a31f1a2d98de', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('636', '1', '339260', '1533872227', '1', '0', '6c28e5e78cf2fa725188118a301e27feda961a606a727376ea41d142d691b094', '5b23a27533213.jpg', 'admin/20180810/b09d4f1cd1c1cee63b40dd2b2d218cbd.jpg', '6c28e5e78cf2fa725188118a301e27fe', '9d9bb4b0881c3f52ad4ebfd9506175596ab1fc33', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('637', '1', '376531', '1533872238', '1', '0', '0e04ec2efe63de7ed8660b59c3bb7914b165782442afca9e4303a3ca5430d7dd', '59ba23ebe23fc.jpg', 'admin/20180810/904f896a5b5a2605485043e4439a53cf.jpg', '0e04ec2efe63de7ed8660b59c3bb7914', '31de732c7c2f714e81fa04db84e3c770ff4cc7b0', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('638', '1', '262767', '1533872247', '1', '0', '42e6194ef7a681cc42932bb5ebdb26d908463e7253980133ac5ee4ae008c8732', '59ddc477cc211.jpg', 'admin/20180810/c2bd2a77877401ed0aa96b14acaea74a.jpg', '42e6194ef7a681cc42932bb5ebdb26d9', '40b914d02b7792ffbe46c543f9dedc876a1b2cdd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('639', '10', '270179', '1534078512', '1', '0', '3ac504f598099a1d71afba5683542cce22a41b46b3a94fa7e964032bc2e5b332', '5b6bf29c08be7.jpg', 'default/20180812/04417586152ae1776e9b043b51ac589c.jpg', '3ac504f598099a1d71afba5683542cce', '28680030d0f313e9788149361b44bfbe0a664d6c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('640', '1', '3728', '1534659389', '1', '0', '9b357a41a90796396723b60c17315eb0b53ecdab508244cc181dddc752d3d46e', 'QQ截图20180819141628.png', 'default/20180819/9ae1659f1f2f359c8b2a524a729a5caf.png', '9b357a41a90796396723b60c17315eb0', 'f150b123629d8718d753bbea955a13405f5ab473', 'png', null);
INSERT INTO `cmf_asset` VALUES ('641', '1', '35754', '1536212554', '1', '0', '3ae73cc34b6bf40b5b484afccaaa75bb86236a40087c7f75df89c3c4258b302a', '车.png', 'default/20180906/30f0fdc388a2a4f52a893075a44c54e1.png', '3ae73cc34b6bf40b5b484afccaaa75bb', '1e2645a4f370f5de1a27b52403cad936cf9c568b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('642', '10', '1112795', '1537336988', '1', '0', '2c10275961f56a4ff72f6239319d9f708b70c05dbaa4c21950bb805677f2e3bb', 'b9f999f93f6c4a65f2778b05eebc6bb2.jpg', 'default/20180919/e1f118eca84726d0d86b54fe14e0efeb.jpg', '2c10275961f56a4ff72f6239319d9f70', 'b56258c1307a5d997810f9bcae0c56a4eeed2e94', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('643', '10', '405542', '1537494786', '1', '0', 'd4128e52473375031c6a16441c4b6867ba9a789442a453783503f08efa551b5a', 'true (1).jpg', 'default/20180921/084732895dd970ad830ac3c6a81cbed6.jpg', 'd4128e52473375031c6a16441c4b6867', '1b02fae7adbd5ba895987e74f408f5fcaae5064f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('644', '10', '495022', '1537494809', '1', '0', '393cd2600ba40d1d19a0e12fe1f0235026b63dabc0d09cb3f999de6cd0253173', 'true (2).jpg', 'default/20180921/1dfc1972183037b25074c7cde26fa63d.jpg', '393cd2600ba40d1d19a0e12fe1f02350', 'eee58c1d4321a7467e4a6b3958ed7693ce0c20d4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('645', '10', '453499', '1537494861', '1', '0', 'c365a4c334d405d959da86845ada951a802722f9a4c684c7d304edcd083e2e68', 'true.jpg', 'default/20180921/a0e69026984f37924a41204fb0cfd9da.jpg', 'c365a4c334d405d959da86845ada951a', '785e9b4dc6465d09cdd50dceca9e5729782015d2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('646', '10', '404791', '1537494976', '1', '0', '92efb0728bf6bbf997bdf7f43c4446325e6fdf2f57bb2a671268f2c883c3eed4', '0x1024a0a0.jpg', 'default/20180921/32b9b0690b66e9388a852c523f8c2184.jpg', '92efb0728bf6bbf997bdf7f43c444632', '03891cb24cf33788b2921a3c18395ef4a1839c17', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('647', '1284', '2035702', '1544693221', '1', '0', '366921835d94003ba88ea060550414bfb0a10c093db711c241ee345ff5940216', '618淘宝x.jpg', 'default/20181213/5b1fcfa9a7dffbecd43ea6b9ace16a15.jpg', '366921835d94003ba88ea060550414bf', '53d4bba84d9a55662068434f99d9bfad9c5d3ca6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('648', '1284', '2030201', '1544693464', '1', '0', 'e1ed8b151beb06c0607eb0427a445654464f3b722514aecb9082173487d62261', '母亲节---2x.jpg', 'default/20181213/c4c0db54c4924e890c8ae4ae3a6a34f9.jpg', 'e1ed8b151beb06c0607eb0427a445654', '9c0c026ea74e65856d9b44bb758fcaf0b49d90aa', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('649', '1284', '2044886', '1544693595', '1', '0', 'edb6137ca6d50c5a48aff57438e80fa7bbbd3ed3b7f072d445f45a90ada0601a', '万国首页x.jpg', 'default/20181213/a3655b7ce2cd88eef124039dc53a8581.jpg', 'edb6137ca6d50c5a48aff57438e80fa7', '993a889a271f2003743d52d99c60a28614a5891c', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('650', '1284', '2026031', '1544693759', '1', '0', '1c4b3cfd67cad1ffd3b4dfb4cc0ce1c43b913400384411d01577aa610a606de9', '首页-(2)x.jpg', 'default/20181213/4390e86faa96d9721dde371a887be43d.jpg', '1c4b3cfd67cad1ffd3b4dfb4cc0ce1c4', '4b63abb06fe41a5252b891b212f7867811eaf7b3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('651', '1284', '2026860', '1544693933', '1', '0', 'dbb2e07a487f7ed88c2b4e427c34c49627e89bdf78a2926a4c271457fd8bf598', 'b5(3)x.jpg', 'default/20181213/688d254b33082cfa10d37c519bc74978.jpg', 'dbb2e07a487f7ed88c2b4e427c34c496', '93cb3faa520cdf1a7e4885c2f8e3502170141368', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('652', '1', '29622', '1554464215', '1', '0', '46f2aa7589c2d5271c60d7b6a2a787044828de047a593f930b99e9300271cc21', '1.jpeg', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '46f2aa7589c2d5271c60d7b6a2a78704', '0ef4d062e60ac045575832bb2ff4a3430fb46a69', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('653', '1', '36342', '1554464225', '1', '0', '594ceda566fbbebd09a674b5aeff131ce6062e383bf1f0ddf41e5505e284825e', '2.jpeg', 'default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg', '594ceda566fbbebd09a674b5aeff131c', 'f1c2dc397991635478ac093a5ba5c8a1375a7c7d', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('654', '1', '39185', '1554464235', '1', '0', 'e9f56be730753e49422ac33f4845bf185f56c744b3cdc1ff4d3fd0a3f74fbed7', '3.jpeg', 'default/20190405/84efe65d191dde0569e5833be02a2473.jpeg', 'e9f56be730753e49422ac33f4845bf18', 'f58e0eb84f0212dec633419127f9ce8f6ace72ae', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('655', '1', '33891', '1554464246', '1', '0', '2f822314d0bb129e9f97fcc1b7bf6f0164563c6346f622e538009bdc60b667d4', '4.jpeg', 'default/20190405/7f2d5139b9f211ab58d5728299f30000.jpeg', '2f822314d0bb129e9f97fcc1b7bf6f01', '3cae485f714e79d020cd2dfb0081dfd67406025b', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('656', '1', '224506', '1554625900', '1', '0', '6affa6e05da538afa59b48a1264e80bad267d8f1cbdd020c98c678b1c56ee06e', 'acb63494-3ff4-11e9-bf0d-00163e129448.jpg', 'admin/20190407/7576da52cdf6f9702249394dc88f2a8d.jpg', '6affa6e05da538afa59b48a1264e80ba', 'ab86bfec964d49c62f537195d42387182d959bd2', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('657', '1', '65245', '1554625913', '1', '0', '00d8891f17b8d4c129f6a5c04ec8c7addf5e1fec31e143a609fdd6e4870b838c', '80f1d3ae-bcaa-11e8-a3bc-00163e129448.jpg', 'admin/20190407/c335a827bcf76abf174f5dfd64203a7b.jpg', '00d8891f17b8d4c129f6a5c04ec8c7ad', 'c0a475d37ccc9393231ab4e150ccf867e9432601', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('658', '2', '29622', '1554902801', '1', '0', '46f2aa7589c2d5271c60d7b6a2a787044828de047a593f930b99e9300271cc21', '1.jpeg', 'default/20190410/0fb4f4129b4d72bdd8f7d069e77547ea.jpeg', '46f2aa7589c2d5271c60d7b6a2a78704', '0ef4d062e60ac045575832bb2ff4a3430fb46a69', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('659', '2', '33483', '1554903354', '1', '0', '47b6b8023bf4967ea353e862e9b796182c5bbc6c3631b5bcddbbd29b70c55011', 'timg.jpg', 'default/20190410/b6aadf548cda219c23c2d3c07e893891.jpg', '47b6b8023bf4967ea353e862e9b79618', '559ee5053f9044b9597000144d47787687cfc2c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('660', '2', '142681', '1554953975', '1', '0', '225cd2f63293cdfe9b1b137bc87ba26facadbf7b24a764ca4703d575d394b60d', '11.jpg', 'default/20190411/a02ec86802e63eee41ac2d20ecfa95ce.jpg', '225cd2f63293cdfe9b1b137bc87ba26f', 'e27439e71a98a7cb264fad1264b695f48bc22805', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('661', '2', '19787', '1554963728', '1', '0', '7705e7c902deedf03871338b1cccf598810b49bbeefc60548691f3800404b2ee', 'weixin1.png', 'default/20190411/1f73f681609ba36bf05c8ed6e1cc5ed0.png', '7705e7c902deedf03871338b1cccf598', '1a2a1943df5332607aa6eff27339bc6e7dfcf2d9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('662', '2', '96613', '1554966103', '1', '0', 'ff795258e7fe3241dd94e99fdb3ab44372774288d28553b08a16c42931b7ee70', 'weixin.png', 'default/20190411/af838f9b517734bf9c0ac1c9ad4f0932.png', 'ff795258e7fe3241dd94e99fdb3ab443', '5cbe45a3ebebda061f9a8c9d043bc095686bad3d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('663', '2', '39185', '1555071676', '1', '0', 'e9f56be730753e49422ac33f4845bf185f56c744b3cdc1ff4d3fd0a3f74fbed7', '3.jpeg', 'default/20190412/f3f65869d32a4a66c2bd8bccc2889f28.jpeg', 'e9f56be730753e49422ac33f4845bf18', 'f58e0eb84f0212dec633419127f9ce8f6ace72ae', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('664', '9', '36342', '1555073088', '1', '0', '594ceda566fbbebd09a674b5aeff131ce6062e383bf1f0ddf41e5505e284825e', '2.jpeg', 'default/20190412/b649f6957a8a8808475f781e5e8c064d.jpeg', '594ceda566fbbebd09a674b5aeff131c', 'f1c2dc397991635478ac093a5ba5c8a1375a7c7d', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('665', '1', '993', '1555162652', '1', '0', '19ed9991f99caba6d14b59452ff089052e6ccc0e149bf60f0c3d8352c50a28f1', '1.png', 'admin/20190413/ee9ff12c2c942db49aa6fa594768d004.png', '19ed9991f99caba6d14b59452ff08905', '3ede6ec7640ea6eb149e83e309d0329cb2359371', 'png', null);
INSERT INTO `cmf_asset` VALUES ('666', '1', '886', '1555162674', '1', '0', '72fd05822cf0ab403db55762b3c065060b7619317efa971fd2af42ca9913efbf', '4.png', 'admin/20190413/ee8efc31d25af8938828d6c19c8198b4.png', '72fd05822cf0ab403db55762b3c06506', '16fcff2bf3831316fa9dd0cad898c046950642ae', 'png', null);
INSERT INTO `cmf_asset` VALUES ('667', '1', '769', '1555162699', '1', '0', '3cded5dfe58d3d4facd6c483a05c8b6e75e930bc56a6ac54949e5ffec258f179', '5.png', 'admin/20190413/170c423a5f9b0156cb37a8974d1414ff.png', '3cded5dfe58d3d4facd6c483a05c8b6e', '051a3fda081bc7393d80d75ec645f92f9ce44798', 'png', null);
INSERT INTO `cmf_asset` VALUES ('668', '1', '1000', '1555162716', '1', '0', 'd4fa7a2fba9c08f8526e97ef95e8683c40b8dbef8f6a26bf010de74c6ff6f825', '6.png', 'admin/20190413/bc05a33351b887ea13e3eb419f7d7171.png', 'd4fa7a2fba9c08f8526e97ef95e8683c', '451ed4ce672ac00e9a6e747b935e26882b9e0abf', 'png', null);
INSERT INTO `cmf_asset` VALUES ('669', '1', '1179', '1555162737', '1', '0', 'f802f998f69b6ba5e0e67923c39990f142b740dbfe32a435141eb6ce36046b30', '2.png', 'admin/20190413/25608d80f541c4703782225afd349399.png', 'f802f998f69b6ba5e0e67923c39990f1', 'a9dc94b547091c492dde8303d7bec686ff1475b2', 'png', null);
INSERT INTO `cmf_asset` VALUES ('670', '1', '858', '1555162757', '1', '0', 'a51d48d5bd5f4360461c7dff5548a268f3c689b4b5dd98c65a8debdf8bc329d5', '3.png', 'admin/20190413/c759e3f142761e4ba9c5c5e72048f9ba.png', 'a51d48d5bd5f4360461c7dff5548a268', 'e8be93f65fed88b2c77446e551ddd94c8126fc51', 'png', null);
INSERT INTO `cmf_asset` VALUES ('671', '1', '317214', '1555242417', '1', '0', '822f4fd686be24b6df72222422f15d5cca3e5019f8e4e365f97cbd91caf42e0c', 'timg.gif', 'admin/20190414/a724dfd1fc16f68daf819ee62cabdc5c.gif', '822f4fd686be24b6df72222422f15d5c', '22e045c7bbaae0e54384778b775de86a4899fbb1', 'gif', null);
INSERT INTO `cmf_asset` VALUES ('672', '1', '1822', '1555242998', '1', '0', 'c96d85456b0d59d73be2ceae7e8e7d07a5f29b00c2bec9a7da24fa9edd720e7b', 'w2.png', 'admin/20190414/a301789c4950b5c219da9383c48cc5b8.png', 'c96d85456b0d59d73be2ceae7e8e7d07', '2b65898cab28302ca521ad624fdf6d9c111c6992', 'png', null);
INSERT INTO `cmf_asset` VALUES ('673', '1', '2378', '1555243286', '1', '0', '251f3dd1b64391bb1d6cd1da297f3f0538529df51f82e0ec8c6234034755ef71', 'dagsd0A_PNG01.png', 'admin/20190414/b64290818e2f6b7c1f89904b1d8595b2.png', '251f3dd1b64391bb1d6cd1da297f3f05', '15910f33f334d1fe41ef5dcb5d8cae001c52a8c0', 'png', null);
INSERT INTO `cmf_asset` VALUES ('674', '11', '275276', '1555854949', '1', '0', '8be0be8a4e9582932128310f947dac95b66f8b1a4e64c916e24cdb75fd88b29e', '1579484372.jpg', 'default/20190421/640b54a13d1058d5f2fac8d8d55ef610.jpg', '8be0be8a4e9582932128310f947dac95', 'a03626815683b1328d34d7aee2bb3f89d2191c96', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('675', '11', '93504', '1555855012', '1', '0', '1b5ac40b9bacaf5a854fe07ecc0a1eceb811e594c00b213367eb90167982ecd9', 'mmexport1555405154002.jpg', 'default/20190421/8891ca3f8a151ea1841390f80b03dc27.jpg', '1b5ac40b9bacaf5a854fe07ecc0a1ece', '4563cbafc65f44c341f48a3fe8f8b4240385c1cf', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('676', '11', '234030', '1555910036', '1', '0', 'da6075db351641d8f2d0ca9057858f9081d10cdd6d89e01c5184dd480a67ff11', 'timg (1).jpg', 'default/20190422/caa12a06afa085fea27c69bc8e3519ad.jpg', 'da6075db351641d8f2d0ca9057858f90', '0e6e393ba68c80a2f7632eff8ea6450db992876b', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('677', '11', '40338', '1555910401', '1', '0', '001f9685d4a88d2ec9bd4021651642eb717d5dd74829d5cb8aa65cdb7c89f4b0', '(U)DYDSIF2A`S]R3PX(SU~S.png', 'default/20190422/69e1b6ce645db07359509627ff0c675c.png', '001f9685d4a88d2ec9bd4021651642eb', '5c99bde05a8fba477938a8903b60bd744e9f5d2e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('678', '3', '74075', '1555918847', '1', '0', '8dd4ee27371bef3030a17afcb4c8010f68b90188d4276861da066dc85728ac01', 'VJH$ZYSR$H3J8ZQ~`N@64XC.png', 'default/20190422/fbda21718ab9334df6928998c8e0ab9d.png', '8dd4ee27371bef3030a17afcb4c8010f', 'fd01fc0245ed1a238d8767acdd39219b2cfd93f4', 'png', null);
INSERT INTO `cmf_asset` VALUES ('679', '1', '233312', '1556006922', '1', '0', 'e2367ac2a71ec8800c7d2ae774142a5b6fb051feb6475a9aa67996ee4c5c3986', 'm.mp3', 'default/20190423/53be62d0db2a1ff1bd9b12f142c456f4.mp3', 'e2367ac2a71ec8800c7d2ae774142a5b', '02a0d3078841e64799801ae89d7c66ecc79cd78e', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('680', '1', '135210', '1557199203', '1', '0', 'ac7fa93e77e65a802492c46c95076f7e624bcf2cb6eaf499872096c8cd60c4d9', '10010405336_1550562522_3.jpg', 'default/20190507/2a3108155aab53f30669ccf00c5c60a7.jpg', 'ac7fa93e77e65a802492c46c95076f7e', '0585fc9d6438ddcd44cc28e10fbdba1262100ecd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('681', '11', '7304', '1557903095', '1', '0', 'a40298339d73f095ce0c00810fd930c2fca3dfa8726580a17fece717aa39a6fa', '10000220686_1557314971_220x220.jpg', 'default/20190515/64791829b03ecbc791fed7f104f12d93.jpg', 'a40298339d73f095ce0c00810fd930c2', '4c8d9bc6d8b21a8c81136347632eedb635ce5df9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('682', '17', '28206', '1558278291', '1', '0', 'cc9afd9a6fe448199976122c65cc46da30702ae744c214af1a8c0be0fd012b9c', 'ImageSelector_20190518_172742.JPEG', 'default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', 'cc9afd9a6fe448199976122c65cc46da', 'e6be511f6d3e8fd0eb50b5a4484126a154a4c15d', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('683', '17', '156507', '1558278304', '1', '0', '9611d52413f33b2229f7f467f9a1f5db73d3182d05d765f0f2f0b3a0f6e2e987', 'first_song.mp3', 'default/20190519/aba6f438d80901056ab692a384620aee.mp3', '9611d52413f33b2229f7f467f9a1f5db', '8ec5e34108d4f026b60d5dea0748673de0ae3dfa', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('684', '17', '269768', '1558278378', '1', '0', '0f3272a6818ff3dd2b19779629cee3b63139db0b5289217b8e4a63b4c13f0738', '1557028894707.jpg', 'default/20190519/4f370dbea80c3328cd2a1639f9e98044.jpg', '0f3272a6818ff3dd2b19779629cee3b6', 'db89a58cd71cc5fe768b02bebf31f2e8ce63af13', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('685', '1', '28206', '1558280019', '1', '0', 'cc9afd9a6fe448199976122c65cc46da30702ae744c214af1a8c0be0fd012b9c', 'ImageSelector_20190518_172742.JPEG', 'default/20190519/ac10836affc00dcd44dab569983c7afc.jpeg', 'cc9afd9a6fe448199976122c65cc46da', 'e6be511f6d3e8fd0eb50b5a4484126a154a4c15d', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('686', '1', '8511', '1558364931', '1', '0', 'c45465815a52a5cdec3e93a1edbaadf4b91602ecc6745ba391f9276a5471e17e', '10000244898_1556537851_220x220.jpg', 'default/20190520/25236e64ff6e143f277ef6404d689741.jpg', 'c45465815a52a5cdec3e93a1edbaadf4', '27f3354080e7dd616c14fcd38a811df080d620b3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('687', '1', '67608', '1558365000', '1', '0', '1fb09442b2e9f92f778c8597d1d28ef94108a381e02b4a9ab922d3af1afbf48d', 'Cat_ChangeToBlack.mp3', 'default/20190520/f256070821807ae81f2ecca48902d693.mp3', '1fb09442b2e9f92f778c8597d1d28ef9', 'e8600bbb97ec5dce2adeb55e029f2ca8da216095', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('688', '1', '88931', '1558365239', '1', '0', 'e3b15ce51f156082f5877930e42220033a1ae1739e04ea60a7fe87de9fbe2467', '10000479066_1557374361_220x220.jpg', 'default/20190520/3dd57c8106a6c8fb59865d46d7595184.jpg', 'e3b15ce51f156082f5877930e4222003', '53acc67dfbb0558cb2b5735985ab79022f6ce5ed', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('689', '1', '89012', '1558365253', '1', '0', '280652e1ffd015df7f658403267ab7ec621c87a3b5e492535de43286546c28fc', '10000384502_1557133926_220x220.jpg', 'default/20190520/fc8ee0a69231dba4a8ec8fb164371053.jpg', '280652e1ffd015df7f658403267ab7ec', 'd1c5c5dfa040ceef62ed5d0c7289ecb53fba5803', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('690', '1', '99429', '1558365333', '1', '0', '5db2e6dcca32b4a93bcbdf13e8ea010692c43a24845f79029df02659c59b9b41', '10000249078_1557368515_220x220.jpg', 'default/20190520/238dd70ade859c3bc7c4c9727e5ee9d5.jpg', '5db2e6dcca32b4a93bcbdf13e8ea0106', '9bf4b2a5eb6494c85db801e8482ce0119dc20264', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('691', '1', '61845', '1558810283', '1', '0', 'e5f5ad2c5f493172a1d531141a48e6ed490ceb09f03728ed6db525c732ab335f', '10000392621_1557420734_220x220.jpg', 'default/20190526/845e985d9e108b580c1bebf595a38b7e.jpg', 'e5f5ad2c5f493172a1d531141a48e6ed', '999a2dcc4295313fe88ed44de2dbae6504be2f37', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('692', '1', '63193', '1558871616', '1', '0', '145c211fac50fa86289e8b6218fe560b0aab090e1fb8da295c4d446535b32146', '1548559877_10581394_1.jpg', 'admin/20190526/ddca71835e713618383351f98efdf86d.jpg', '145c211fac50fa86289e8b6218fe560b', '2cab069846bbc95f2694dcd121a94ca9e6d1be89', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('693', '1', '138958', '1558967092', '1', '0', '5b12843988a7a6b173bd87c0a7a1615a6eae53376fdca96e61f54c62f0257986', 'img_1.png', 'default/20190527/5fd470e10e4cb42f4797fec242f1e920.png', '5b12843988a7a6b173bd87c0a7a1615a', '0e861a31a57d362eee46c1616cba0693f11c185d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('694', '1', '2965', '1558967381', '1', '0', '9d651e8b4707e22f08f5f4629c87122ff67cd19660da8ae323202c3627468165', '淘约玩.png', 'default/20190527/5bec28dfc6b732d1f0c3a48a05d4c2f4.png', '9d651e8b4707e22f08f5f4629c87122f', 'da55d4b7e89328b5ba45e8f9ca81ba7f6cebdc99', 'png', null);
INSERT INTO `cmf_asset` VALUES ('695', '20', '60648', '1559007584', '1', '0', '3581d15cd7962956ca80e9a566feb953105553848471cfc610361c21e95787d3', '20190528_093728.mp3', 'default/20190528/11558e4e878c4a45dcbf831b536d48fb.mp3', '3581d15cd7962956ca80e9a566feb953', '1f29216f227f27bcfdce7c2045f4d3ca5026d609', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('696', '20', '6861', '1559007988', '1', '0', '5a676e0c1f14436ca3871fa49a76a1778a73578f3845c9a9d7bb25d3d589614b', 'E394956017BECA13439AA2E1EA7DD36A.jpg', 'default/20190528/44644ea451bab7eb1faf8b86b65378de.jpg', '5a676e0c1f14436ca3871fa49a76a177', '3d667d9eb0de11da6f286e711db484ea8b9a3eba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('697', '1', '60648', '1559012230', '1', '0', '3581d15cd7962956ca80e9a566feb953105553848471cfc610361c21e95787d3', '20190528_093728.mp3', 'default/20190528/dd0527fa2985954ccca5c9b5a115840c.mp3', '3581d15cd7962956ca80e9a566feb953', '1f29216f227f27bcfdce7c2045f4d3ca5026d609', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('698', '21', '45264', '1559030374', '1', '0', '6a20961e2a0f534bdb8ebaf3511a9e458125f24d0a417868bdf5c37853490112', '20171207110306725.png', 'default/20190528/2ad615d0f54e35b967422976076c9e70.png', '6a20961e2a0f534bdb8ebaf3511a9e45', '081fb5542653786dc7067bc037172411ff4a0ed8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('699', '21', '37686', '1559030391', '1', '0', '3f831dbab719b3685aa57b715a552acfa313621f72be5a8bef63eaddcc27a990', 'swap_panels1.mp3', 'default/20190528/851535d709732f63c710135268dd38ea.mp3', '3f831dbab719b3685aa57b715a552acf', '27608eea32af740e4cb7828740c3f49fd3ab9c59', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('700', '1', '429580', '1559045618', '1', '0', '814c00cd78409b54548db77584a752d4beb53fa69ee8ccdc9fe6b03298a10062', '9fca2f0f70452f9efdf09b67d39d3bcb.mp3', 'default/20190528/5ad1defb803684be732693460c18d1ef.mp3', '814c00cd78409b54548db77584a752d4', 'a55261c466397f1e786c730c841f18d1f57e8d04', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('701', '22', '78998', '1559094801', '1', '0', 'a1af5e0e6e35d1c2f82be71eab9d0935fa86a04f763c31fef8a57bce5f020e5f', 'app.jpg', 'default/20190529/9b307a055f70c347e55fde048775018c.jpg', 'a1af5e0e6e35d1c2f82be71eab9d0935', '14e60179b437ab7b67066939f239a0b54f951934', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('702', '23', '15907', '1559108704', '1', '0', 'e5f7ed9da9d64e776ee8cd744435a2b10f3d334ae729a31681cdd70409d0ac8b', 'Beelze_Backourt_01.mp3', 'default/20190529/e7f1f3d63f8d420fcfdecca7f58d4d0e.mp3', 'e5f7ed9da9d64e776ee8cd744435a2b1', '32f45fe646117fd778d993ee2e9358aa1506daf1', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('703', '23', '14178', '1559108722', '1', '0', '3a20c3f5bbbdb7e4f11f8cafe212fd8418b94a49ac43d22abbd5cc80a4f31b8c', 'timg.jpg', 'default/20190529/27dbea67b936abee491767ce4e5c7166.jpg', '3a20c3f5bbbdb7e4f11f8cafe212fd84', 'c4c34153862b2d8b282c5171e64e94195777d145', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('704', '17', '5177', '1559204524', '1', '0', '276f546536796ae4edd8e0823f60d851d8fd05579fc598008bbd4ed5ac8e8aa4', '02_avatar_middle.jpg', 'default/20190530/2d976cfa0e240226fad878016e988c33.jpg', '276f546536796ae4edd8e0823f60d851', '5c70fe20e12fbc87a72c2c81c4bf5a633a75b1b3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('705', '1', '128344', '1559205967', '1', '0', '5127a3842eee731af51dc5a8c94311ac00e19ad196dd11d86d67ec296a2d0c9a', '1899102_Hakh7f4HNd_1554892185604(1).jpg', 'default/20190530/e5252c5870ce103a21678d1ef525f1c6.jpg', '5127a3842eee731af51dc5a8c94311ac', 'dbbcb5311356e28b5bc60b5a9a5e6f945af684e8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('706', '1', '1750924', '1559206000', '1', '0', '8ca302da5b48b664dd96e0c7473a05f9560fdb8a0c29bbf7d3719a5f8cabf613', '1899102_Y6AiNtAnRy_1554892183432.jpg', 'default/20190530/b5038d8ffa15b9a60bc1294f2546ea30.jpg', '8ca302da5b48b664dd96e0c7473a05f9', '3b8dd834f5bfd89401e8124f6b5517ed1aeee981', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('707', '1', '5177', '1559206010', '1', '0', '276f546536796ae4edd8e0823f60d851d8fd05579fc598008bbd4ed5ac8e8aa4', '02_avatar_middle.jpg', 'default/20190530/c368cf8621add5752efae7edf59eb6d0.jpg', '276f546536796ae4edd8e0823f60d851', '5c70fe20e12fbc87a72c2c81c4bf5a633a75b1b3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('708', '1', '6861', '1559206209', '1', '0', '5a676e0c1f14436ca3871fa49a76a1778a73578f3845c9a9d7bb25d3d589614b', 'E394956017BECA13439AA2E1EA7DD36A.jpg', 'default/20190530/8d28cf858e41e85e538fc0251d074551.jpg', '5a676e0c1f14436ca3871fa49a76a177', '3d667d9eb0de11da6f286e711db484ea8b9a3eba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('709', '1', '65148', '1559276299', '1', '0', 'c62dc0c690a702cc5397c2301438d906763903bc4a2b4e950a5ddd1060411736', '1899102_GAQd4X36EP_1554892177305(1).jpg', 'default/20190531/eed82724a00538ef47e94b0e9a298d03.jpg', 'c62dc0c690a702cc5397c2301438d906', 'abc071ab33260386e0ecca5771c94327626b96af', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('710', '1', '4841', '1559276340', '1', '0', '9fc0d5cf1b7f1efb52fb39098a1c0ba1bc434b34847c102618466f537b729634', '10_avatar_middle.jpg', 'default/20190531/29620b0426640427af87d999865d7fc4.jpg', '9fc0d5cf1b7f1efb52fb39098a1c0ba1', '0213db302fb928579364b47e045afc5d0e4d4db9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('711', '3', '110023', '1559282425', '1', '0', 'a54cd68e9ecafd1c811edc98d42f38a77e773807085e0f48ed2a1c325e3bb94e', 'QQ截图20181108134355.png', 'default/20190531/e9537309ae3ba396ca49bd8f41d46c13.png', 'a54cd68e9ecafd1c811edc98d42f38a7', '7e5f0a18faa4a3f86354dc28e3a3b688d68e3c32', 'png', null);
INSERT INTO `cmf_asset` VALUES ('712', '3', '141196', '1559282429', '1', '0', 'c68986bac93de7b59790dd53c032ad01533cb6564e241cfeb9eebeb517f1437a', 'QQ截图20181108105932.png', 'default/20190531/1cecf05ed32cf7a133b91743dd63147e.png', 'c68986bac93de7b59790dd53c032ad01', 'f929927c95f143e05b0d7879560712b3130f75bc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('713', '21', '5177', '1559285659', '1', '0', '276f546536796ae4edd8e0823f60d851d8fd05579fc598008bbd4ed5ac8e8aa4', '02_avatar_middle.jpg', 'default/20190531/9f6a92dd6246c4c03107f2020e65398f.jpg', '276f546536796ae4edd8e0823f60d851', '5c70fe20e12fbc87a72c2c81c4bf5a633a75b1b3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('714', '21', '65148', '1559285757', '1', '0', 'c62dc0c690a702cc5397c2301438d906763903bc4a2b4e950a5ddd1060411736', '1899102_GAQd4X36EP_1554892177305(1).jpg', 'default/20190531/ce5e557184dff88803f4cdc7c7d37e5d.jpg', 'c62dc0c690a702cc5397c2301438d906', 'abc071ab33260386e0ecca5771c94327626b96af', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('715', '21', '128344', '1559285874', '1', '0', '5127a3842eee731af51dc5a8c94311ac00e19ad196dd11d86d67ec296a2d0c9a', '1899102_Hakh7f4HNd_1554892185604(1).jpg', 'default/20190531/40451987946702b10396676e26717b55.jpg', '5127a3842eee731af51dc5a8c94311ac', 'dbbcb5311356e28b5bc60b5a9a5e6f945af684e8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('716', '1', '2454', '1559422711', '1', '0', '4cec5ee820fa68583f1b45812a060b7094cd9f5c343a10dbd223d7b7f6d6df10', '8.17.txt', 'portal/20190602/1339602dfe24daa368549388841ec816.txt', '4cec5ee820fa68583f1b45812a060b70', '7d38f69a3179629c59ac788d2884bfc95a217ff0', 'txt', null);
INSERT INTO `cmf_asset` VALUES ('717', '1', '338262', '1559424225', '1', '0', '9e412a8a13488b78e48b0f3455f8dafec5a70d17b3033fb08710000a64e01ab7', '123456.jpg', 'default/20190602/5d25ee4c3b51091f9036f85147011578.jpg', '9e412a8a13488b78e48b0f3455f8dafe', '9434157069b989504b3993e12c9f037153b9e7bd', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('718', '1', '110023', '1560135866', '1', '0', 'a54cd68e9ecafd1c811edc98d42f38a77e773807085e0f48ed2a1c325e3bb94e', 'QQ截图20181108134355.png', 'default/20190610/ef1781389cb62a0bd7a3099753df719b.png', 'a54cd68e9ecafd1c811edc98d42f38a7', '7e5f0a18faa4a3f86354dc28e3a3b688d68e3c32', 'png', null);
INSERT INTO `cmf_asset` VALUES ('719', '1', '141196', '1560135869', '1', '0', 'c68986bac93de7b59790dd53c032ad01533cb6564e241cfeb9eebeb517f1437a', 'QQ截图20181108105932.png', 'default/20190610/e72e996793e55fe09e8a0607eeb2a4f6.png', 'c68986bac93de7b59790dd53c032ad01', 'f929927c95f143e05b0d7879560712b3130f75bc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('720', '26', '70604', '1560138617', '1', '0', '2122a6c171d102373c74e0b171335259c0fa60289a53c582390215a8adb879bc', 'mmexport1543805292601.jpg', 'default/20190610/1498efa5fb2a7258b694bda9b24dc92d.jpg', '2122a6c171d102373c74e0b171335259', 'ab6aa970c85666d405c723d476af40f98c2f962f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('721', '26', '203891', '1560138711', '1', '0', 'c9e7dc3ffe272a1e3dc950f6b568e4c14a06cb36ca03a70097ccf5a8c0fe694b', 'PicsArt_04-26-02.23.24.jpg', 'default/20190610/43d4b72ed23b28e43aa9093e479e3911.jpg', 'c9e7dc3ffe272a1e3dc950f6b568e4c1', 'f325cbde7db1fb41e5e4470cfc6e515c03e2c7e4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('722', '1', '34154', '1560427383', '1', '0', 'e3c05eb709752b738217fdb79fbb2f3153748c9c27e659390ec1c82a2e6eef47', '0342e7a4-a1e3-11e8-b64b-00163e129448.jpg', 'default/20190613/060c856bf226becf6e2202b27956901c.jpg', 'e3c05eb709752b738217fdb79fbb2f31', '02ee6f722591c5a6ec205167bed7330797e399d5', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('723', '32', '837082', '1560613786', '1', '0', 'cc03e5f2b11c0aded586116e637382e5f953d64aff6e607b72c2dc95473947cf', 'Screenshot_2019-06-12-20-41-27-842.png', 'default/20190615/ca174c54788d610cbf791f77b12c9d0a.png', 'cc03e5f2b11c0aded586116e637382e5', '11a9c5deb90a564c3f8d7996eab4a27d65c9b3ed', 'png', null);
INSERT INTO `cmf_asset` VALUES ('724', '20', '110023', '1561700796', '1', '0', 'a54cd68e9ecafd1c811edc98d42f38a77e773807085e0f48ed2a1c325e3bb94e', 'QQ截图20181108134355.png', 'default/20190628/a0b69461bf25621655d93263a8187bfc.png', 'a54cd68e9ecafd1c811edc98d42f38a7', '7e5f0a18faa4a3f86354dc28e3a3b688d68e3c32', 'png', null);
INSERT INTO `cmf_asset` VALUES ('725', '44', '136081', '1562144069', '1', '0', 'c13f2c32225dcf777fb1fbc664c6db52561742ea3563bf86fce2eb422ea6c85d', '微信图片_20190703165422.jpg', 'default/20190703/0c0e553378fff98e9c1e1fccac8764fb.jpg', 'c13f2c32225dcf777fb1fbc664c6db52', 'f0fa48b88266a22348a4ba0f6938003fadd701c8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('726', '44', '187565', '1562144244', '1', '0', '79638a22059342cb3d51e4a6daea9dc421221cea9628354060136c8d362e35e8', '微信图片_20190703165659.jpg', 'default/20190703/3f1fab6dd1eefb23f6529784e65517f3.jpg', '79638a22059342cb3d51e4a6daea9dc4', '14e200cb5a6bed0921c79c62b53ac91771044d46', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('727', '33', '100156', '1562588582', '1', '0', 'f968f105f516fe1963e5e057c580750586476934619b8133e77df0c48da5ec96', 'timg.jpg', 'default/20190708/7ddb700d56876aef2142d88e451d88d7.jpg', 'f968f105f516fe1963e5e057c5807505', 'eb8f9d904a27a40028ad3cd20a85c30094ec6015', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('728', '33', '7776', '1562588916', '1', '0', '7f244086034b763411cc10b027294b709a194cf6dce3a949ad33bd83656be8a4', '我很萌很.mp3', 'default/20190708/c079a3ef2cf2706ab508a34926cd4e6d.mp3', '7f244086034b763411cc10b027294b70', '444bfcb7b89acde3723e4fed09fe21bdea68d4e4', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('729', '33', '59067', '1562588962', '1', '0', '9845a1ae2849fdd4dcc70df62e7148393aeba80173a0dca11a1ffa7febc3a0df', 'QQ图片20190527033008.png', 'default/20190708/1e0203d54cb366b37e4fd3e14ab538c0.png', '9845a1ae2849fdd4dcc70df62e714839', '8fe1ee6933881e5c7d5522bb2628fabbf946a83d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('730', '33', '105742', '1562687289', '1', '0', '27927e1cdf4ebedb79f10edc18ba0d7d5848be5efede12182411c31076249094', '微信图片_20190707000305.jpg', 'default/20190709/a6ceaa53592e1d325f6343ad80455ad3.jpg', '27927e1cdf4ebedb79f10edc18ba0d7d', 'eb734becad13b308429d2d4773eac0e8cd812619', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('731', '3', '8155', '1562914631', '1', '0', 'ccc59d586d472f4cafc8da2e6fae5073e21220276c1a2a8d296021db21627f9a', 'weixin.jpg', 'default/20190712/af2b0c3ee911da952c2e82bec2e43069.jpg', 'ccc59d586d472f4cafc8da2e6fae5073', '7bbf60c774b8a0505b134f5fdcbb508dda0aa466', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('732', '3', '1417', '1562914635', '1', '0', '7e778ed4d88ca3d98071291ac2d6eefb2517edba3da83557b3e619d1d93d6c74', 'logo2.png', 'default/20190712/af35fdf2e277a12fb85207a84b869c6e.png', '7e778ed4d88ca3d98071291ac2d6eefb', 'daa6ea8797c554b0d615a9fa631f6337cbf4058e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('733', '3', '47234', '1562914640', '1', '0', '3602620a060ccb52baaa8fd64f8bf6f5de53d29a713b3d13c5c7c29951559251', 'QQ截图20181107100639.jpg', 'default/20190712/f27cde5f31461a4b2d1afbc2b3186e9f.jpg', '3602620a060ccb52baaa8fd64f8bf6f5', '12c5092a1a16fcc1153e1722ebc8fc0ecda58024', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('734', '3', '6861', '1562914971', '1', '0', '5a676e0c1f14436ca3871fa49a76a1778a73578f3845c9a9d7bb25d3d589614b', 'E394956017BECA13439AA2E1EA7DD36A.jpg', 'default/20190712/386714d01c8736ce73854e832f546bf3.jpg', '5a676e0c1f14436ca3871fa49a76a177', '3d667d9eb0de11da6f286e711db484ea8b9a3eba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('735', '3', '108514', '1562915319', '1', '0', 'af8616223b78b7475da3f93d1ce21da7eb0a4ee5e2c5fdba30290a05e121dde0', '5b61c28f171a4.jpg', 'default/20190712/af34feba62735ed6d52f0a8bfd3256d4.jpg', 'af8616223b78b7475da3f93d1ce21da7', '12fb4d8d0469fa22c470502c10579b44920f9713', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('736', '3', '114695', '1562915323', '1', '0', '368623147ea8c3e380ed69f412d1f91cd1ec162d5c34695e8b4fbda57d13f473', '5c139d3db8783.jpg', 'default/20190712/87a59626cae0d0331c4fef38470bedf2.jpg', '368623147ea8c3e380ed69f412d1f91c', '962157b41c02bf63263e310479d387f0fece5d27', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('737', '3', '126347', '1562915326', '1', '0', 'a02b42f639d15ca88ef2ff4bde71738a77836591ac95fb38713a2dfe26d87a09', '5b61c23fcb68e.jpg', 'default/20190712/c1d4938049c790371940569f61803ac4.jpg', 'a02b42f639d15ca88ef2ff4bde71738a', '9a4d3d0893dce7bf3d63e10494fde4555995e2da', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('738', '3', '123714', '1562915329', '1', '0', '90abcb3b524f5c0f7543e6cd58194ecd008563270cd69c5d1394bdc787ddd62d', '5b61c24d7fdfc.jpg', 'default/20190712/f3398724d91676e80d4fe612cb72812e.jpg', '90abcb3b524f5c0f7543e6cd58194ecd', 'efb1c74cfe6fc9a2a485cf34bafa14b0a190660f', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('739', '1', '33483', '1563627534', '1', '0', '47b6b8023bf4967ea353e862e9b796182c5bbc6c3631b5bcddbbd29b70c55011', 'timg.jpg', 'default/20190720/0c648b047b28dbd1935d30d2ed24422e.jpg', '47b6b8023bf4967ea353e862e9b79618', '559ee5053f9044b9597000144d47787687cfc2c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('740', '20', '33483', '1563675152', '1', '0', '47b6b8023bf4967ea353e862e9b796182c5bbc6c3631b5bcddbbd29b70c55011', 'timg.jpg', 'default/20190721/3f12267331dbbef233100bb9e990e0c9.jpg', '47b6b8023bf4967ea353e862e9b79618', '559ee5053f9044b9597000144d47787687cfc2c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('741', '1', '1104', '1563848837', '1', '0', 'a64c0e81e93890921f38aff2154fd211997cf43172d194e77c2def1bc22447b2', 'pubg.png', 'admin/20190723/5c487d50d029ff6dba714b2fdb02a737.png', 'a64c0e81e93890921f38aff2154fd211', 'ed74b24388ecd4b4e1fd5e4fba16c94ce484e7f5', 'png', null);
INSERT INTO `cmf_asset` VALUES ('742', '1', '1077', '1563848843', '1', '0', 'afc75ff4e4e766dd92e5d89ca407e93d7e71d6c28fbe2477024bd30705727d8f', 'pubg1.png', 'admin/20190723/7bcd277e464cb9bc6b4c22be59af2c30.png', 'afc75ff4e4e766dd92e5d89ca407e93d', 'b32e89c81c51b5229d76065a08a5cab4cdcf059f', 'png', null);
INSERT INTO `cmf_asset` VALUES ('743', '1', '1183', '1563848866', '1', '0', '7848dc62e179257bd1b8dae0c111047645fa57f3767e621e6652492ab6fa1411', 'csgo.png', 'admin/20190723/57dd17834a1d445eeb06ac595ba3646c.png', '7848dc62e179257bd1b8dae0c1110476', 'd7758d6f673aedf509a1b63832fab0eb9bccb40d', 'png', null);
INSERT INTO `cmf_asset` VALUES ('744', '1', '1057', '1563848870', '1', '0', 'e67bdc7f95ba51d5ecceedd9103ab5bc03f0d263ea375196e52f27c7531440db', 'csgo1.png', 'admin/20190723/678fbdb780c909aed24296e6f91d6c7b.png', 'e67bdc7f95ba51d5ecceedd9103ab5bc', '0f65a030ced184b01bb8c65abfae16e27c5b07b2', 'png', null);
INSERT INTO `cmf_asset` VALUES ('745', '1', '1297', '1563848883', '1', '0', '25c3736928c36fab6e069e5869adf259a2b3cf3f4befa140d216ca2452202c5b', 'scum.png', 'admin/20190723/6ec697ba615505a778addb5b75079926.png', '25c3736928c36fab6e069e5869adf259', 'df8f2e48054cb5eea9994d45acd8160dc4c3f937', 'png', null);
INSERT INTO `cmf_asset` VALUES ('746', '1', '1587', '1563848887', '1', '0', '1c3da87fcf7b69dcdf27fb47d369689a7c4289c529c867e64684209c6e6c8097', 'scum1.png', 'admin/20190723/0e27e53d5f868b1b1aa1cfcfa6194afe.png', '1c3da87fcf7b69dcdf27fb47d369689a', '644bd2f96618e3676a7d9b56b1b8bfe8ed32f3e0', 'png', null);
INSERT INTO `cmf_asset` VALUES ('747', '1', '2978', '1563848898', '1', '0', '07270f30ac0425c05bf887e99267252abd6548e080aa789d1ca7f4ced42537d1', 'mhw.png', 'admin/20190723/798466416f6aaf892cb8e37211c70398.png', '07270f30ac0425c05bf887e99267252a', '72d156cc726aafcd3255008b875bd5142de174a4', 'png', null);
INSERT INTO `cmf_asset` VALUES ('748', '1', '3004', '1563848905', '1', '0', '52a010be65df29bf3b14152f0616d08c53079c39fd30db9726ecc14c61e98bf4', 'mhw1.png', 'admin/20190723/a5068c6bc1b9c144062457a1f922a513.png', '52a010be65df29bf3b14152f0616d08c', 'b48886699cedd658b05861735e10c80e218ffdc5', 'png', null);
INSERT INTO `cmf_asset` VALUES ('749', '1', '548', '1563848915', '1', '0', 'ce6e07f173f3b2c8d4a2702e746e0a28ba3370613fb770a2c78ac48f953b4cd7', 'lol.png', 'admin/20190723/fe07441bf22c4a9057538c38614c732d.png', 'ce6e07f173f3b2c8d4a2702e746e0a28', 'b8915ec167ab501049d3df4c32f8906e334511b8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('750', '1', '531', '1563848919', '1', '0', '62edfb3e6e287b5bfe81162222f370047fee8f9b14aa6a45ff09c73d46595057', 'lol1.png', 'admin/20190723/2c9c386494d8d2191dc1a865ffa25a14.png', '62edfb3e6e287b5bfe81162222f37004', '621240b8a06c4adae75a58e85577ba62d2d683d8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('751', '1', '952', '1563848935', '1', '0', '77590b33b9b435d162978df011b18a04f49313e89f6cd22791a499643f77e55f', 'cj.png', 'admin/20190723/3828e40982e7cdf3b3befc934ee686ec.png', '77590b33b9b435d162978df011b18a04', '3643081f6d2bb4453dd7eb5f624a5b519e1047c8', 'png', null);
INSERT INTO `cmf_asset` VALUES ('752', '1', '876', '1563848938', '1', '0', '1076bfa71858b98b50b1e3a21b1b118218b224c0a77d3bd7cf89fd353c6cee96', 'cj1.png', 'admin/20190723/1e25417f87d2d67064391060cfb8ee4a.png', '1076bfa71858b98b50b1e3a21b1b1182', '9bdac3ec2b3d2a819636129d1d2131c93f30692b', 'png', null);
INSERT INTO `cmf_asset` VALUES ('753', '1', '1235', '1563848950', '1', '0', 'b94cc37e64b292e6d149fea504ad00eb57ad0c696e631ad1d8d7bf8f4cc19426', 'wzry.png', 'admin/20190723/40ca999dcb136a491433a612cf66a98b.png', 'b94cc37e64b292e6d149fea504ad00eb', '837c97e63d0cb25a567a0e0573de856c135deb88', 'png', null);
INSERT INTO `cmf_asset` VALUES ('754', '1', '989', '1563848954', '1', '0', '09e06d6423afa14e0d26e6873b92c31f2c5de55c6ad0d5bde3e3dca51295a8e4', 'wzry1.png', 'admin/20190723/2ce46b7798df8279fe11b0e27e02e079.png', '09e06d6423afa14e0d26e6873b92c31f', 'e338e2885656fc2d55d8eaa8c58ceece2c285c51', 'png', null);
INSERT INTO `cmf_asset` VALUES ('755', '1', '873', '1563848966', '1', '0', 'fb830e8828d6b0d0873e6deaae2537107620a884a466b60abe9fa9cdcef00822', 'syfw.png', 'admin/20190723/59031ea39f5ed5c9cc6d8c3d511ad2ab.png', 'fb830e8828d6b0d0873e6deaae253710', 'ac79522e4a2097f4dca5730e866a7725cc6c1263', 'png', null);
INSERT INTO `cmf_asset` VALUES ('756', '1', '745', '1563848970', '1', '0', 'ecbe6dd8143ba7298508d7776d4a321f994ed3c48356d84cc0be696f7e3c576e', 'syfw1.png', 'admin/20190723/0bdc21a22a4bb3f0361c217ef066bd11.png', 'ecbe6dd8143ba7298508d7776d4a321f', 'c3cabf4773a20a4226e5639eb3dc8db257ef5ec9', 'png', null);
INSERT INTO `cmf_asset` VALUES ('757', '1', '17999', '1563849156', '1', '0', 'f8b983e5fd2b1a6c84fbe121300f6ec2bc018d50ecab499bb5e0049a660e3505', 'timg.jpg', 'admin/20190723/47e78af8a15b300e0e3766f42c97387c.jpg', 'f8b983e5fd2b1a6c84fbe121300f6ec2', '5323b641a7130ab93862bee5c0218b45dae1ee90', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('758', '1', '9873', '1563879648', '1', '0', '05d04ec05854d140cc2f430175172de4fc5eade820fab4b314336ecfb0b1291b', 'lol.jpg', 'default/20190723/e8527cdee08e3e2947482979a7902858.jpg', '05d04ec05854d140cc2f430175172de4', '82dfcc1f36e95b58ac9806a206ed1f5e6a104d6e', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('759', '1', '31816', '1563879667', '1', '0', 'baca0c10a24883faefc631db0f3c58638f9b5ec2d663eb43a7faf924d0f73f42', 'lol.png', 'default/20190723/0fdb475b9ba082248560141e7f297a77.png', 'baca0c10a24883faefc631db0f3c5863', '32a74ddc9982006c4238e0a58455b29e8e752390', 'png', null);
INSERT INTO `cmf_asset` VALUES ('760', '1', '2182', '1563879674', '1', '0', '41d79797fd6476c03f38d2d83de3261261ab6fecbc897217bceb88f1ab576a51', '和平精英.jpg', 'default/20190723/f7ff33f6e7882404d53409e78b9d06fd.jpg', '41d79797fd6476c03f38d2d83de32612', '5c99df0da589c9e756ab18c2c1c8b72017851fcc', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('761', '1', '961779', '1563879993', '1', '0', '6546ff7ec53b73a910195db53ab475639739733bf50f31b3c9d7babf99bcdce7', '短信铃声(纯音乐)-壹唱天下.mp3', 'default/20190723/569e46c63fcb74f7c69be73d3c81f25d.mp3', '6546ff7ec53b73a910195db53ab47563', 'cddf2b92aa055c1332b302afd3052bd710161f96', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('762', '1', '143228', '1563880041', '1', '0', 'd82e7b681e5ef6bb0d6d5c1a3179fbbbc581a88e616e7beea6b3f0e0dd2097bb', 'b94ae499c11575df47f92e6259d5f257.jpg', 'default/20190723/cf829986747cd15b28d0c180538d17c7.jpg', 'd82e7b681e5ef6bb0d6d5c1a3179fbbb', '9d721120349a5039bc479d4321798d49bb61fba4', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('763', '3', '33483', '1564828511', '1', '0', '47b6b8023bf4967ea353e862e9b796182c5bbc6c3631b5bcddbbd29b70c55011', '11.jpg', 'default/20190803/26c38e18ff66e7495572713696040882.jpg', '47b6b8023bf4967ea353e862e9b79618', '559ee5053f9044b9597000144d47787687cfc2c6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('764', '3', '60648', '1564829079', '1', '0', '3581d15cd7962956ca80e9a566feb953105553848471cfc610361c21e95787d3', '1.mp3', 'default/20190803/38fd6b022046339b446955e80880cabc.mp3', '3581d15cd7962956ca80e9a566feb953', '1f29216f227f27bcfdce7c2045f4d3ca5026d609', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('765', '3', '2232', '1564830370', '1', '0', '7367f7cef56381b453ed58953c5ebf571dfc8149c164ded4ae2fda8b82078c05', 'recorder.mp3', 'default/20190803/d5d264410d52f62e5ce17ba3e1a4b427.mp3', '7367f7cef56381b453ed58953c5ebf57', '4c997e9120e7bb7343fee2c1afcf6051752f5fd8', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('766', '3', '2232', '1564830411', '1', '0', 'af3e93ae48c78c015495f01667b2922ab4e4ed4815cf292db38c6c6a48be0021', 'recorder.mp3', 'default/20190803/a24ecace28e05f071a6a2d781ed8f466.mp3', 'af3e93ae48c78c015495f01667b2922a', '053cc72f4c5eb91a7dcc94ab7367bdd5405b8374', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('767', '3', '3168', '1564831459', '1', '0', '4d528684d0d03340b051dc9f4529d1c7aaf0fbba47f4f67577bce1541269c563', 'recorder.mp3', 'default/20190803/a4b6e94bef9396a296a599e90a978433.mp3', '4d528684d0d03340b051dc9f4529d1c7', '055350d5e9ae394971cc0f8131d1441a6fc5892c', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('768', '3', '2808', '1564831509', '1', '0', 'a26165eec63b4edae4e45801f74e50aa0ad79a676fc8ae42ddcec567265ba723', 'recorder.mp3', 'default/20190803/0bd676e147a07167a3409a50ccf4a688.mp3', 'a26165eec63b4edae4e45801f74e50aa', '5c3a44e286034e8a8f4d9434f7bd9d55260d6e2a', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('769', '3', '2016', '1564831557', '1', '0', 'cead3b285c7431f7b4a26f98ccddd32074ef52e0a18ceaea778d33587a79c556', 'recorder.mp3', 'default/20190803/fbda1f876b1b9b2e25342b5045e12420.mp3', 'cead3b285c7431f7b4a26f98ccddd320', '69825ce878ddb36b10ed83b14a07a8d56d0093aa', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('770', '3', '1872', '1564831636', '1', '0', '2e807e67a780d9cd161c327f3698b9c96edd360429db33e0d5eb3eb1a9867aa3', 'recorder.mp3', 'default/20190803/38652462bea47895cd45dee38bc907e7.mp3', '2e807e67a780d9cd161c327f3698b9c9', 'a8e5384db5a60213eb48b77ba8c3d3ed2dc6ab3e', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('771', '3', '2016', '1564831650', '1', '0', '02e3b201f87b1d84442acbdbb843ab9e4f4d73a9651e4d62fb6d608de6d9a55b', 'recorder.mp3', 'default/20190803/1115455cf4d61306deb305e5448fcbaa.mp3', '02e3b201f87b1d84442acbdbb843ab9e', '57810bcfc0d8c326b37cf784b62f245069e673f2', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('772', '3', '2016', '1564831770', '1', '0', '413b452fb67ebec93f4d1392e955c06535f91e903df3a6d14bcac51ab4572b8c', 'recorder.mp3', 'default/20190803/aacaf08572ba7547b4664883daafd878.mp3', '413b452fb67ebec93f4d1392e955c065', '0258b689cba29c857ab7eac4de581f612635a266', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('773', '3', '2952', '1564831808', '1', '0', '9da7682498f00fe3a1210bdaca6910ec6aafabcd0382703f94d9727ca72990aa', 'recorder.mp3', 'default/20190803/8261a523a59a09d1189edeb8e0ae4345.mp3', '9da7682498f00fe3a1210bdaca6910ec', 'a242d54259cb3ba0af8deb8b239abd5bee079422', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('774', '3', '2808', '1564831822', '1', '0', '9cf4ea226bcbb1f979265e3e627d204ef92653534ca6c31c1a1993a679bdd6d4', 'recorder.mp3', 'default/20190803/0efa814413161e82c9882e3f466af807.mp3', '9cf4ea226bcbb1f979265e3e627d204e', '3410cc23b3e88c4bb68908fa500c5082dfac171a', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('775', '3', '1656', '1564832029', '1', '0', '2b0609319fd88f6ebaa44a06f06d9ca34171337b7520f411317de47c4ba4c825', 'recorder.mp3', 'default/20190803/254e52ce3ac0db8fc65191af46e55834.mp3', '2b0609319fd88f6ebaa44a06f06d9ca3', '628c8b0fd11ce61fa501ded8a1f264163d04bd67', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('776', '3', '1080', '1564832079', '1', '0', '63917886af85f2cfa31a3ceba4e8f3bedf0cfe5daf94028d83c6b13d7286c48b', 'recorder.mp3', 'default/20190803/a16d1bd13d2f65045034871a2c0558d4.mp3', '63917886af85f2cfa31a3ceba4e8f3be', '3fba2819dc73541c45677c96f42377657739f938', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('777', '3', '1296', '1564832110', '1', '0', 'cc2ae552448eaec2e7a282616991ca86b8c05d2f8f1b64c6b1d3f95a54952b96', 'recorder.mp3', 'default/20190803/74a41d72dff5f81fed1bba078fdbdb1e.mp3', 'cc2ae552448eaec2e7a282616991ca86', 'bd2ea3d3c287cc5c4773a9618ac6b548e5df00f1', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('778', '3', '1080', '1564832181', '1', '0', '9395d25c30c86790b275fc3bb9002e93628437b879d4301439d4ea3ef26f39c0', 'recorder.mp3', 'default/20190803/3fbcbdb603f021a95f93132b1a3a7626.mp3', '9395d25c30c86790b275fc3bb9002e93', 'e2083e3c34b0712aa43a52737eba10c49dd2876b', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('779', '3', '1656', '1564832203', '1', '0', 'c52cf00059017100f7af48a1fcee83fae571ce73eca07a427527a89ffe70e11f', 'recorder.mp3', 'default/20190803/6e8f4b7fd5bf6328e425856b713a2302.mp3', 'c52cf00059017100f7af48a1fcee83fa', '075640e05b5d230772eaba4bdf7a53fc7da24432', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('780', '3', '2592', '1564832266', '1', '0', '48401713ad1a1be8fd0235387aec4f350d116cf7165d2f30ceb4c4cc2ce3d35a', 'recorder.mp3', 'default/20190803/df1ad1ecfd8bc9a314937ca3b45e2bfa.mp3', '48401713ad1a1be8fd0235387aec4f35', 'ced0fd4d5828d67ac1c9700e1ff89a3bf770810e', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('781', '3', '1872', '1564832539', '1', '0', 'cf153954154f28d9324822a2449710d476d826bfde22651428b42835ff155e3e', 'recorder.mp3', 'default/20190803/edd2217042a4a511653e8906bdde1b1c.mp3', 'cf153954154f28d9324822a2449710d4', '1bb7f09e313f2cad58f723e6aa0759531d118f27', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('782', '3', '1656', '1564832627', '1', '0', '2606212877880c9e303b6ff2b4ab3b3c393688555679816657ee13108a1010ea', 'recorder.mp3', 'default/20190803/c8c535f9664975ee949b204181f924db.mp3', '2606212877880c9e303b6ff2b4ab3b3c', '31d649f825fd893fff5f255c5e0540eebe4459e8', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('783', '3', '1872', '1564832693', '1', '0', '80cf1a3afb7153764dded597d791057748f80893a88c2649f9db92bfd1a1a2dc', 'recorder.mp3', 'default/20190803/5105a069361db49ea82256aa69f11778.mp3', '80cf1a3afb7153764dded597d7910577', '1f803d4ed739af6cfec1a5763dc008b9a3f73c24', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('784', '3', '2016', '1564832836', '1', '0', 'ee1451288c37cf4c4140865252afe92b7e68b32144553138852904b522a002f2', 'recorder.mp3', 'default/20190803/97b102bfd781615780dc02a67108303e.mp3', 'ee1451288c37cf4c4140865252afe92b', '882b7566704476d7293d54100c2dc24989355a70', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('785', '3', '1296', '1564832966', '1', '0', '466a8244a1ee58d5ce546fa998bd697c4ef9a2376a5592172ae0ef90690673e4', 'recorder.mp3', 'default/20190803/0b8ec8c1e9f0f76e3ad878ff84b21da4.mp3', '466a8244a1ee58d5ce546fa998bd697c', '5dd3d0d25878f57693d9bebec446a07ff853d8fd', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('786', '3', '1872', '1564832981', '1', '0', 'd92c15cc6036650c6c6dbc7c8d21416727f757099cfe90965a320336fb8005cf', 'recorder.mp3', 'default/20190803/d5819885a038332654679beeb24610f1.mp3', 'd92c15cc6036650c6c6dbc7c8d214167', '621c8330bc7d63e567e0f4bcabbfe3a83e5d61f4', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('787', '3', '1296', '1564833018', '1', '0', '4b7be980a871c8b5aef6a0717de0bc96316f078d0e6b2d91c9d98a209f766ef7', 'recorder.mp3', 'default/20190803/6f5a58cdee2ddc4818ea624991b6c335.mp3', '4b7be980a871c8b5aef6a0717de0bc96', '29de6ac1c62519882d031a6c0b5289d04a47e92d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('788', '3', '1872', '1564833207', '1', '0', '034f426f171eb8ffd438424e6e785805b8c2c1b9b4c019f9c1897b1695128445', 'recorder.mp3', 'default/20190803/06e983b8b1e62bf5c73a5d2602360776.mp3', '034f426f171eb8ffd438424e6e785805', 'a380ee696f51246cede7878835eb623c6fbef8f4', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('789', '3', '1872', '1564833327', '1', '0', 'e1c854cdec48c5fae9cc8b4f9989f4d80acfec1452fa4b8a707c6bfe0b5a2dae', 'recorder.mp3', 'default/20190803/c6c5607432752e0ee0bf8e5293745f8a.mp3', 'e1c854cdec48c5fae9cc8b4f9989f4d8', '2b753bea979284acd28149d0630e97087edfaf12', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('790', '3', '2016', '1564833587', '1', '0', 'ca668025acc33af8b101e2268aac5edb7fced739ff3b5d0b216d0828910fbaca', 'recorder.mp3', 'default/20190803/3d9e6d761eca5c649e204cdf7a542bcf.mp3', 'ca668025acc33af8b101e2268aac5edb', '754ef1483998f4545fbe7c202e63aeba8596687d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('791', '3', '1080', '1564833657', '1', '0', '1383c694149abf4116934769a247429250853ff4456bc6ad06301acf586beb84', 'recorder.mp3', 'default/20190803/56f0edf3124322f68f411aabf9ae8bb2.mp3', '1383c694149abf4116934769a2474292', '7ac40f679c6766e29c01fa5b4f68c850962e8b35', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('792', '3', '1656', '1564833753', '1', '0', 'c93d402a462bfc7cf8ce87262cb4802d8cd2692cedcd8f7c44940495bacd8637', 'recorder.mp3', 'default/20190803/be32b73a9d847314119adae3cb1f1746.mp3', 'c93d402a462bfc7cf8ce87262cb4802d', 'bd68039bd47f9e7fe3fbd7e8ce7d90cd484cea33', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('793', '3', '3168', '1564833787', '1', '0', '9e70e1895840999c5caf501da8debc0687e9c1b213751525d313839f4d19f3ae', 'recorder.mp3', 'default/20190803/3dc3ed66a91cbbcce40d09f8cdd20a44.mp3', '9e70e1895840999c5caf501da8debc06', '8fdefeb53f92e5eabd3c60db61d084dd14873cf2', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('794', '3', '2808', '1564833870', '1', '0', '8d109ec14e9c75bbc7f4883f554f9e5160371294496365a72aabc62efd7edd76', 'recorder.mp3', 'default/20190803/2659bb857c868ce77b3b494051781a63.mp3', '8d109ec14e9c75bbc7f4883f554f9e51', 'f9e9bdd7ee5c599953123ef3eaed59368d534904', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('795', '3', '1656', '1564834122', '1', '0', '5ed0c0abb70bbf4ac6f1db6c96386b28bd35c4582addabb9aa9a364a6f0a6706', 'recorder.mp3', 'default/20190803/5608d20fe242247e591e910d4e3ff353.mp3', '5ed0c0abb70bbf4ac6f1db6c96386b28', '14d654b20e920fc0e8489f82ce05c81b08ab659b', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('796', '3', '1080', '1564834243', '1', '0', '2276d11cd04cc17e9add3c9cf4f0bb7c203ad264be4ca8d28887a378545cd216', 'recorder.mp3', 'default/20190803/0122288f10d5793288a273d3cf4f7a85.mp3', '2276d11cd04cc17e9add3c9cf4f0bb7c', '68a5bef9189c47d48ae9141dc08b86e0062e501c', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('797', '3', '29622', '1564834260', '1', '0', '46f2aa7589c2d5271c60d7b6a2a787044828de047a593f930b99e9300271cc21', '1.jpg', 'default/20190803/1b07c7f0569685a50ef39fe56aaf2e92.jpg', '46f2aa7589c2d5271c60d7b6a2a78704', '0ef4d062e60ac045575832bb2ff4a3430fb46a69', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('798', '3', '1080', '1564834380', '1', '0', '547934b21d7fd772570b5e534efd19327b74de4292e6c3cc3a9d3028ebe3c859', 'recorder.mp3', 'default/20190803/094ced26f62ba0831da84d14c6fb87b8.mp3', '547934b21d7fd772570b5e534efd1932', '8a6fe7f03c09ac7c9472ea971c7ec8349a442642', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('799', '3', '39185', '1564834390', '1', '0', 'e9f56be730753e49422ac33f4845bf185f56c744b3cdc1ff4d3fd0a3f74fbed7', '3.jpeg', 'default/20190803/f3085e6a30c28c9134f78ad38764e59b.jpeg', 'e9f56be730753e49422ac33f4845bf18', 'f58e0eb84f0212dec633419127f9ce8f6ace72ae', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('800', '3', '1512', '1564834634', '1', '0', 'd938552ec0c7598c78116352e1daa8f1e71aeb42e6df85ff9ae712b5436d832c', 'recorder.mp3', 'default/20190803/5b4b76603ae911942153f95516be35dc.mp3', 'd938552ec0c7598c78116352e1daa8f1', '92ca0fc6a3fde89cc8ace8e8b161fc4c85a8ebad', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('801', '1', '7416', '1564837083', '1', '0', '7b2fa4bc1b9a4ed02e627dd3b2909c44bf66f39eb7ee23dbd76590b00d690977', 'recorder.mp3', 'default/20190803/ceb069cc5a3bc84dc4d2e00621473967.mp3', '7b2fa4bc1b9a4ed02e627dd3b2909c44', 'abd84cac1e6d10c45e6b839e7bd43ec3d7ae930f', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('802', '1', '2376', '1564838041', '1', '0', '67a43c46c5214f2c7e769437fa085fc7f46e85991b4ae51365cb15af6ea3ee93', 'recorder.mp3', 'default/20190803/2eded76eb94b81de8b6290fe418eb024.mp3', '67a43c46c5214f2c7e769437fa085fc7', '89c89ee0f3a9642cc9ac7265db941b234e151a8d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('803', '1', '5544', '1564838066', '1', '0', '6b4c56e7c0999ad58d0f6e0b55dc88851cae96f63b09768acb55cc18bcbe0aa2', 'recorder.mp3', 'default/20190803/0a45dd48c153e3ef57322ac84343858d.mp3', '6b4c56e7c0999ad58d0f6e0b55dc8885', 'e3cb307c4b550e3943645ba0cc39ccf97eef611d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('804', '3', '4248', '1564838206', '1', '0', 'f733373a05ebdc6b9ae36f5a42fd2bb674f34bd2f08c00eb3b854665b160ad54', 'recorder.mp3', 'default/20190803/f92e1a32c7b63eebafebd23d52940634.mp3', 'f733373a05ebdc6b9ae36f5a42fd2bb6', '09294b440ca2c27038b322b8d3b48fa2c4e2d22d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('805', '3', '4464', '1564838238', '1', '0', '20c3488b4b871a2d6b91131bd8f6f9d2b34904df3840a4ea36405d932e04ab4b', 'recorder.mp3', 'default/20190803/d3a12ae6667117b3bcb8948544968e9a.mp3', '20c3488b4b871a2d6b91131bd8f6f9d2', 'aa0bab4a1d2f4d71d37d944aaccac583962374a9', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('806', '1', '3528', '1564914650', '1', '0', '881e68a0d1afd4d6138815f928e9424b1688ff3d32964887c6f637de225e42ec', 'recorder.mp3', 'default/20190804/ea1710cd18d5142916c8e454adcec992.mp3', '881e68a0d1afd4d6138815f928e9424b', '7d2e6ec7048b0f52b74b9cc2607031123472bab7', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('807', '1', '2592', '1564915214', '1', '0', '31c88d0bf975746e04b7da84abb6eaa4137de3d39658c4cdc279f202e011efc1', 'recorder.mp3', 'default/20190804/56ff3dc1fd70254f16de2635171be05d.mp3', '31c88d0bf975746e04b7da84abb6eaa4', '720b45007e600084466fd5597dd71d4dbbb2c90d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('808', '3', '3240', '1564915373', '1', '0', 'c342876896e7de0de28fa42ed266c44b7bd0f17843094a6d5d53b5fedc1d209b', 'recorder.mp3', 'default/20190804/4cae122d72962b3b77f58b92575d8816.mp3', 'c342876896e7de0de28fa42ed266c44b', '6c66a7a7b6b17c22c372c34443f9e2582e217f6a', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('809', '1', '2592', '1564915761', '1', '0', '6cfb30621561924d34c145bb00d2591e31d48bd9d4173ed60a61faf1e22387b4', 'recorder.mp3', 'default/20190804/e5472d597008dd0f5ad0a4f02fdc596b.mp3', '6cfb30621561924d34c145bb00d2591e', '9865b65b86385b6d15d5df00334ac3481a3b3765', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('810', '3', '3240', '1564916533', '1', '0', '452e1680cdf4d8b9d63014081a138acacc8fc40b9f173d346fa3aa69a1ed8a12', 'recorder.mp3', 'default/20190804/f6a190d6b3c67dd37e4de92b3a8ba4f8.mp3', '452e1680cdf4d8b9d63014081a138aca', '7c9b6bb3b3a6690932833ac0a6cfa23fc0a4c3af', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('811', '3', '3960', '1564916634', '1', '0', '9a80f4223a33e8fc7e94b3135ae0ebf887ad784ee2b5e453211a133d5dd1ae24', 'recorder.mp3', 'default/20190804/93aef4bb60847c1441af09717cec0c38.mp3', '9a80f4223a33e8fc7e94b3135ae0ebf8', '940eb4b36f8f0afdb7709c5ad05554e2a20cbbb9', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('812', '3', '3240', '1564916652', '1', '0', '40e0521c7886ffc038c7b3da053273f707eaf5921fc3878ff845d32f482d64ac', 'recorder.mp3', 'default/20190804/05dd1293bcefccba0844ac8f591c55be.mp3', '40e0521c7886ffc038c7b3da053273f7', 'e1342322f9069d02cfa38ba022b684bd64c3cd09', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('813', '3', '6336', '1564969590', '1', '0', 'd42258f3587a9a866c3a96ee98be5c88912ba852d6cda3d9e42c26e912fba150', 'recorder.mp3', 'default/20190805/6130743f5a973c3b3243e1d39085e250.mp3', 'd42258f3587a9a866c3a96ee98be5c88', 'b6c9421c904b2abac7ba124f6c2a89772d0ce510', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('814', '3', '4968', '1564969672', '1', '0', 'bdacc21300721704df3ec362002231776745fcc1c946662e534c443d59adab2a', 'recorder.mp3', 'default/20190805/96a133b67a292b6df1ea9b77051f21b4.mp3', 'bdacc21300721704df3ec36200223177', 'b8948ba1d51e9424347435812d174b87a40ccb28', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('815', '3', '6336', '1564970194', '1', '0', '37b9d1e961de01e46beda77d0a28629c905b4f8af7db2323fc6717a6606f5fb2', 'recorder.mp3', 'default/20190805/cc449950c28f4587cc242ad6b48fa652.mp3', '37b9d1e961de01e46beda77d0a28629c', 'ea356afc932876ccca2fa78659fa38adf08d6278', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('816', '3', '2592', '1564970695', '1', '0', '1aeda1fa4a7d920d09a05eb8b5dafcad42cd7a51ac98c160a8882909f41e7086', 'recorder.mp3', 'default/20190805/ac8b1dcc9c0d3dff85c34ff05e3445ec.mp3', '1aeda1fa4a7d920d09a05eb8b5dafcad', 'eb35442f126a76545fc5823ebc952f5ffd4fed4e', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('817', '3', '47173', '1564970788', '1', '0', 'bc15320f0597bc365f86617fd8d54b5aef7b8052e7debf1473cfcce0a202a9e2', 'wxqun111.jpg', 'default/20190805/87410a5cada709aafb52332b5dc8829e.jpg', 'bc15320f0597bc365f86617fd8d54b5a', '0ae317f02d8b45bf44e73a7d75fa7ca85c0d4894', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('818', '3', '3456', '1564970799', '1', '0', 'e4e96a153cba5bc2681dd1ca9d8b88a30f963348bbcfb58147bd7d2c8805f856', 'recorder.mp3', 'default/20190805/06fba4682b848a392edd9406d57862dd.mp3', 'e4e96a153cba5bc2681dd1ca9d8b88a3', 'fbdea16e8a132a923895b54de69a6720c9ae16d3', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('819', '1', '2232', '1564971396', '1', '0', '534c107a1d70c4d05d53b0f8f16d076b0ddf37566ec76c1259f54e2c1112fc1f', 'recorder.mp3', 'default/20190805/3e623fc232ed78f6f4090a487283799d.mp3', '534c107a1d70c4d05d53b0f8f16d076b', 'de22345b6e4a48a7ee28cd2e29cd2eff2d8db61f', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('820', '3', '5832', '1564983058', '1', '0', '3c966afea27bdc1020e60eb68a308d96dc0faf80a6ce34a8413ea82b0f4c2a61', 'recorder.mp3', 'default/20190805/260a3148843b97d9352f84fd4e8f535e.mp3', '3c966afea27bdc1020e60eb68a308d96', '53db25a7eb1d9fb2bdaf4130ae67ebbf0e922d8a', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('821', '3', '10476', '1564984710', '1', '0', '73f0e9a8f702f472bc29c77947e01bc31747d508d171eb3f7cbb32733d1c9fb8', '60@3x.png', 'default/20190805/3a1e62b8b1edba4ee9e0065d0ec3b86a.png', '73f0e9a8f702f472bc29c77947e01bc3', '1ea4a0baf29ba4a3c2f0e9643f8379c9ebad541e', 'png', null);
INSERT INTO `cmf_asset` VALUES ('822', '3', '6336', '1565149831', '1', '0', '7d2fd96a4e0f5a368fc13b12575c38ba6a9b088ffe06266ed4940e14f7228a6f', 'recorder.mp3', 'default/20190807/c751e6397d058b8d8e8e7f610dd364ac.mp3', '7d2fd96a4e0f5a368fc13b12575c38ba', '7c122a2add3915c13f0ee75ddb3169f93e6385c1', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('823', '3', '10728', '1565364796', '1', '0', 'f62f532b2e6bb2c7669309f3e9acf3cd567436ac3bd30ba7bc6c8d5343f7b59a', 'recorder.mp3', 'default/20190809/83afbd69ee1054fc2a360112816203e3.mp3', 'f62f532b2e6bb2c7669309f3e9acf3cd', '9839a4cfe9fc686c629c083e568baf8ec578cf2c', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('824', '48', '6696', '1566368784', '1', '0', '8b8400784781590574cd1679c886102e8ef34d86d0d457b41fda02542ad9c62f', 'recorder.mp3', 'default/20190821/8024f86b52654511cab603d68665e8fd.mp3', '8b8400784781590574cd1679c886102e', 'bb8fa202d6b08759d221ae6df6e63d0622bf4edd', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('825', '50', '2880', '1567071156', '1', '0', '035a3ce98fadbae127d30ee62a6281e0d40b7c5bcf9ea0e1a027200a426e8799', 'recorder.mp3', 'default/20190829/a892bb518c3d65042b59c7d0e21acfbf.mp3', '035a3ce98fadbae127d30ee62a6281e0', 'a54568b6e0f6e278204218626b73568469e78587', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('826', '3', '5112', '1568184701', '1', '0', 'b47f777fe64a2d62596b73bad33cfa23e5cfdef4713b96027d401064293c26da', 'recorder.mp3', 'default/20190911/23d45b9afdcc6d3f8fed688ad68298f1.mp3', 'b47f777fe64a2d62596b73bad33cfa23', '063c3510ba09f5e8568bb9562d1756b414764482', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('827', '3', '5976', '1568185020', '1', '0', 'd2880ad70c77358f26d69002a1885334e8ed460416718b28d3a71218c24fdaa7', 'recorder.mp3', 'default/20190911/e084a8cd8a86e0cd0f7c058ba328baa2.mp3', 'd2880ad70c77358f26d69002a1885334', '7d851809ec82025756f23feee76c2ae943a50ae4', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('828', '3', '4464', '1568185035', '1', '0', '23444be94f9fadc693f14ab5b7594117772236d3290f7c520c793ccd8e96c2ae', 'recorder.mp3', 'default/20190911/d2f00e8e1e6d7534b5d5556df3de1722.mp3', '23444be94f9fadc693f14ab5b7594117', '4e5d67166ebbae2cc027468128c700e6415f62c1', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('829', '3', '3600', '1568196708', '1', '0', 'b6fe735dd69fd9df965d58770a00aa941ed180982fbcc1d28ceee2e22818d4e9', 'recorder.mp3', 'default/20190911/c1d9e358bf06b667c71f7f4ff454e253.mp3', 'b6fe735dd69fd9df965d58770a00aa94', '5c42ced120cca2b7f609b8e1ca16ddb7bdd53202', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('830', '1', '93616', '1569723269', '1', '0', 'c8420badaa2a09b9fee81cdd22c1b3465c8a45beab8e886f62a4eff13cdd8498', '1131111-19103710.jpg', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'c8420badaa2a09b9fee81cdd22c1b346', 'e531d7d51d2bba0e26c3e00ab1eae0337a7730c3', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('831', '1', '3960', '1569723481', '1', '0', 'b999cc50aa70ce779d2d8f50b87fbb04a5800f4c0a718ec8d307fe6db83f914c', 'recorder.mp3', 'default/20190929/017f290837c7ea170d7ba18da035211a.mp3', 'b999cc50aa70ce779d2d8f50b87fbb04', '7087950f6fc6f667dd4e6c59a074920927e8fa72', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('832', '1', '25219', '1569723489', '1', '0', 'e39b9109212b5b7be5f7840ecc32ef1c200d1be3c6d8ae09e7ce5c184c1a4186', '喵帕斯短音_铃声之家cnwav.MP3', 'default/20190929/fd9cd3bf1b2318adaa12485ab09fb590.mp3', 'e39b9109212b5b7be5f7840ecc32ef1c', 'eef2a16b1d39bf459a67a52c06a75053e0ae4f47', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('833', '1', '14997', '1569723538', '1', '0', 'a7729713a9f50a802073b9398ee5ee3f32c2437272c899c117dc78b893c402dc', 'timg.jpg', 'default/20190929/6b5ee5e15a179bf90f1beb05be25b3b8.jpg', 'a7729713a9f50a802073b9398ee5ee3f', '602443494bb00076464e9de8518f683a5543a2c8', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('834', '58', '117095', '1570162531', '1', '0', '2aa0bea695322b5b3af3835c9b726b950e42c86e31d74933509922c75d4ac8f6', '-442a3bc238502e78.jpg', 'default/20191004/c9de55e79e3a74212972f2f2da0f4545.jpg', '2aa0bea695322b5b3af3835c9b726b95', 'd6a0f3071dfd0281683bbe0b626ab24b16399004', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('835', '58', '19152', '1570162552', '1', '0', '481cb991ed333fdc55c21d39eac0a0884ad49f38f368c52916f4afefd6db84ab', 'recorder.mp3', 'default/20191004/e47d0e580a5fdd8f7d16b4dbee0f3912.mp3', '481cb991ed333fdc55c21d39eac0a088', 'b022e54ee7a19e86d1bd03f13573706cdeb23fdf', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('836', '58', '27802', '1570162573', '1', '0', '51a1ad9a7117cad82cae200d0dd72d2139de4032422f103783817d6bab611db0', 'PIC_1548213998503.JPG', 'default/20191004/06f92cb3b627d7ed6eb6aaf2c54a932c.jpg', '51a1ad9a7117cad82cae200d0dd72d21', 'e6aabb74a88e94b6703fb2762890659a48c5ed43', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('837', '58', '8680', '1570162586', '1', '0', 'f42ddfa3c0196594d99e5b48f8b39bb5420e692324449d856cd3b3a7c12acb61', '100457_1569922363_b.jpg', 'default/20191004/63fc6aaf8fed740a2c0a6e1df5681325.jpg', 'f42ddfa3c0196594d99e5b48f8b39bb5', 'ce7537792418066287cece2ed0ac7893cd25b802', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('838', '47', '2736', '1570598349', '1', '0', 'ce7a2e8f90b4d58445ab3220f2c4d8cb45a55d1a99938ec8e2c14077729296d8', 'recorder.mp3', 'default/20191009/42e475416fe7b24217eb03fc9ce50457.mp3', 'ce7a2e8f90b4d58445ab3220f2c4d8cb', '7e568f3e741f1cb7eb9de7f884089a08d8b05015', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('839', '3', '3096', '1570601549', '1', '0', '240ca1ffacae168600a33d03b93713d9f44659e7880e8ec4e1384db4766fd7a3', 'recorder.mp3', 'default/20191009/482541f23ed75946eaba992e5cff9662.mp3', '240ca1ffacae168600a33d03b93713d9', 'b828815191f9b2f37820aa212267f7d304de9c7d', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('840', '3', '2736', '1570602439', '1', '0', '99b406d3ddf300b07c7b5129a170977d4f843cfeed53f1a8ab33f5d3e7a8fd0e', 'recorder.mp3', 'default/20191009/7f07f306268f63ae8c9614a1b1530227.mp3', '99b406d3ddf300b07c7b5129a170977d', '81b0031eed90cf7192066721607fca1d4fd77459', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('841', '47', '3600', '1570672614', '1', '0', 'dd410eae29974656ca83f7d198e21eebe5cd8b29ff6dcfcfb10dd2298db45337', 'recorder.mp3', 'default/20191010/366be55b066a218d6370ed972974f230.mp3', 'dd410eae29974656ca83f7d198e21eeb', '7ed494374dcf2124e3edb75f97780777655809f2', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('842', '2', '6861', '1571020971', '1', '0', '5a676e0c1f14436ca3871fa49a76a1778a73578f3845c9a9d7bb25d3d589614b', 'E394956017BECA13439AA2E1EA7DD36A.jpg', 'default/20191014/edf6622717100584e3ceef5c19afffc5.jpg', '5a676e0c1f14436ca3871fa49a76a177', '3d667d9eb0de11da6f286e711db484ea8b9a3eba', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('843', '2', '141196', '1571021031', '1', '0', 'c68986bac93de7b59790dd53c032ad01533cb6564e241cfeb9eebeb517f1437a', 'QQ截图20181108105932.png', 'default/20191014/1701be0cd7638867b521f9bf2daa63f9.png', 'c68986bac93de7b59790dd53c032ad01', 'f929927c95f143e05b0d7879560712b3130f75bc', 'png', null);
INSERT INTO `cmf_asset` VALUES ('844', '1', '47234', '1571025581', '1', '0', '3602620a060ccb52baaa8fd64f8bf6f5de53d29a713b3d13c5c7c29951559251', 'QQ截图20181107100639.jpg', 'default/20191014/11631eb0beb94bbf351a7a2dcf2ab950.jpg', '3602620a060ccb52baaa8fd64f8bf6f5', '12c5092a1a16fcc1153e1722ebc8fc0ecda58024', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('845', '2', '110023', '1571031224', '1', '0', 'a54cd68e9ecafd1c811edc98d42f38a77e773807085e0f48ed2a1c325e3bb94e', 'QQ截图20181108134355.png', 'default/20191014/a1deb908747be21d8e7cf5f3171c9d43.png', 'a54cd68e9ecafd1c811edc98d42f38a7', '7e5f0a18faa4a3f86354dc28e3a3b688d68e3c32', 'png', null);
INSERT INTO `cmf_asset` VALUES ('846', '63', '49437', '1573030997', '1', '0', '23e49fd9d03434dfdb64492879a8ff80168cd31cd09b39590281f4dc4c37cde0', 'C1128C12-0937-4BD8-A73E-C8E0A5EF0DCA.jpeg', 'default/20191106/b6f65c7fad2280bdd243a61de9705c51.jpeg', '23e49fd9d03434dfdb64492879a8ff80', '79d82b12b7931fa88b538834c3925e72222aa813', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('847', '65', '2592', '1573291683', '1', '0', '0937e990138d7a84ae2c3812658c2cc0374cea248e927725ff0370e97ee08002', 'recorder.mp3', 'default/20191109/ce38ec44cba7b11b54b27bbd91778f45.mp3', '0937e990138d7a84ae2c3812658c2cc0', '0045e203afcd56b7cd186cd015be70aa12064b98', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('848', '65', '12518', '1573291750', '1', '0', 'dbda1d5de119dc2901b5cb43548af15ce764ae219295074defc895f6c7d58c71', '下载.jpg', 'default/20191109/c4d4a9861046445193c2067c81479424.jpg', 'dbda1d5de119dc2901b5cb43548af15c', '7c0fc998f16802d569936e195b88a2a976c483e6', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('849', '65', '4608', '1573291906', '1', '0', '8046ce367ec564f3b33ddbc396a49fb741ad671fdd39805d2d283c6fad236d88', 'recorder.mp3', 'default/20191109/b80bb040507a8e28909d75f20a40e6e5.mp3', '8046ce367ec564f3b33ddbc396a49fb7', 'ab6c8b5ce159afed3400eda9518c3e0cb17b7a52', 'mp3', null);
INSERT INTO `cmf_asset` VALUES ('850', '1', '98055', '1573495698', '1', '0', 'cd77e9efc05b19e8dd4b6dbdf5a223fb3f41775bdb646a493d1a1fe5ae8c5833', '111111.jpg', 'admin/20191112/503e6c31a7bf8106e0fd31f5b46c59e2.jpg', 'cd77e9efc05b19e8dd4b6dbdf5a223fb', 'af7494965d2cddc7c4d7ec1102b6ee127a348ba9', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('851', '1', '13435', '1573497063', '1', '0', 'b262fc2efddd0ef1e21b6b0074f1f32e2ef091d89bdd5237c2f28fc79f96ded3', '3333.jpeg', 'admin/20191112/6b6d2f25fc9a4a988d2fa56bbd366cc9.jpeg', 'b262fc2efddd0ef1e21b6b0074f1f32e', 'ecdbfdb33b353b35238e7047285b71b31ef285f5', 'jpeg', null);
INSERT INTO `cmf_asset` VALUES ('852', '1', '14423', '1573498021', '1', '0', 'aa3f21edc991c25943f8b4f3a9b50dfe9bdcdf330db71d0d8fd738a2bb38b8ea', '2.jpg', 'admin/20191112/a486e250841f86fc4c9a1e0c041de9d3.jpg', 'aa3f21edc991c25943f8b4f3a9b50dfe', '103d40336c8c67bf01fd6f81debba38c4408f2f1', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('853', '1', '14440', '1573506186', '1', '0', 'ed63cef5209d6a3a143f337fc9bedbe0e233dfd7a6a422564541b39b42b6e3ff', '1.jpg', 'admin/20191112/a804625ac5d0d031d0e7dc8ee76540e9.jpg', 'ed63cef5209d6a3a143f337fc9bedbe0', '956ef4c44df62e8e77cd7075eba1225460c01c00', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('854', '1', '97915', '1573511072', '1', '0', '6b77f89de44cc359a60300d3f715652134437e91614ae4b3bd9a0d47608dcbf9', '11111.jpg', 'admin/20191112/45e0520ea645e88a9db84b0abd9a2113.jpg', '6b77f89de44cc359a60300d3f7156521', 'e138a4af980a2ab7a9b1b93d3d9f7c2e6bcd5f3a', 'jpg', null);
INSERT INTO `cmf_asset` VALUES ('855', '1', '273129', '1573547292', '1', '0', '839d480e17d005ff7aaa27dcd2bdeaf58abbb9f61abf243b177146c0fdc497be', '0d5be0169ba1080cb440a58652450a53.png', 'admin/20191112/c5b206156d2faade96e3c6635941c125.png', '839d480e17d005ff7aaa27dcd2bdeaf5', '8d06fe0cda57716ce3a6658dc09ded3a88e50f3e', 'png', null);

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------
INSERT INTO `cmf_auth_access` VALUES ('64', '2', 'portal/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('65', '2', 'portal/adminarticle/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('66', '2', 'portal/adminarticle/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('67', '2', 'portal/adminarticle/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('68', '2', 'portal/adminarticle/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('69', '2', 'portal/adminarticle/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('70', '2', 'portal/adminarticle/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('71', '2', 'portal/adminarticle/publish', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('72', '2', 'portal/adminarticle/top', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('73', '2', 'portal/adminarticle/recommend', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('74', '2', 'portal/adminarticle/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('75', '2', 'portal/admincategory/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('76', '2', 'portal/admincategory/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('77', '2', 'portal/admincategory/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('78', '2', 'portal/admincategory/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('79', '2', 'portal/admincategory/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('80', '2', 'portal/admincategory/select', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('81', '2', 'portal/admincategory/listorder', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('82', '2', 'portal/admincategory/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('83', '2', 'portal/adminpage/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('84', '2', 'portal/adminpage/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('85', '2', 'portal/adminpage/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('86', '2', 'portal/adminpage/edit', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('87', '2', 'portal/adminpage/editpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('88', '2', 'portal/adminpage/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('89', '2', 'portal/admintag/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('90', '2', 'portal/admintag/add', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('91', '2', 'portal/admintag/addpost', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('92', '2', 'portal/admintag/upstatus', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('93', '2', 'portal/admintag/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('94', '2', 'admin/recyclebin/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('95', '2', 'admin/recyclebin/restore', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('96', '2', 'admin/recyclebin/delete', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('97', '3', 'user/adminindex/default', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('98', '3', 'user/adminindex/default1', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('99', '3', 'user/adminindex/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('100', '3', 'user/adminindex/ban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('101', '3', 'user/adminindex/cancelban', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('102', '3', 'user/adminoauth/index', 'admin_url');
INSERT INTO `cmf_auth_access` VALUES ('103', '3', 'user/adminoauth/delete', 'admin_url');

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', 'id=20', '登录支付设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '轮播图管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '内容管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', '1', 'region', 'admin_url', 'region/admin_index/index', '', '城市管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', '1', 'Admin', 'admin_url', 'Admin/region/index', '', '区域管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('164', '1', 'admin', 'admin_url', 'admin/category/index', '', '品类管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/liuyan/index', '', '意见建议', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/order/index', '', '订单管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', '1', 'admin', 'admin_url', 'admin/money/index', '', '资金记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', '1', 'admin', 'admin_url', 'admin/tixian/index', '', '提现管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', '1', 'admin', 'admin_url', 'admin/tousu/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', '1', 'admin', 'admin_url', 'admin/shensu/index', '', '撤单管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', '1', 'admin', 'admin_url', 'admin/order/xuqiu', '', '需求管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', '1', 'admin', 'admin_url', 'admin/gift/index', '', '礼物管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', '1', 'admin', 'admin_url', 'admin/Gift/add', '', '添加礼物', '');
INSERT INTO `cmf_auth_rule` VALUES ('174', '1', 'admin', 'admin_url', 'admin/Gift/addPost', '', '添加礼物提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('175', '1', 'admin', 'admin_url', 'admin/Gift/edit', '', '编辑礼物', '');
INSERT INTO `cmf_auth_rule` VALUES ('176', '1', 'admin', 'admin_url', 'admin/Gift/editPost', '', '编辑礼物提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('177', '1', 'admin', 'admin_url', 'admin/Gift/delete', '', '删除礼物', '');
INSERT INTO `cmf_auth_rule` VALUES ('178', '1', 'admin', 'admin_url', 'admin/Gift/listOrder', '', '礼物排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('179', '1', 'admin', 'admin_url', 'admin/Gift/toggle', '', '礼物显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('180', '1', 'admin', 'admin_url', 'admin/Liuyan/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('181', '1', 'admin', 'admin_url', 'admin/Message/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('182', '1', 'user', 'admin_url', 'user/AdminIndex/jinyong', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('183', '1', 'admin', 'admin_url', 'admin/setting/koudian', '', '平台费用管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('184', '1', 'admin', 'admin_url', 'admin/level/index', '', '陪玩师接单等级管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('185', '1', 'admin', 'admin_url', 'admin/jineng/index', '', '技能管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('186', '1', 'admin', 'admin_url', 'admin/guild/index', '', '公会管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('187', '1', 'admin', 'admin_url', 'admin/haoma/index', '', '靓号管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('188', '1', 'user', 'admin_url', 'user/admin_index/avatar_shenhe', '', '头像待审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('189', '1', 'user', 'admin_url', 'user/admin_index/renzheng_shenhe', '', '身份认证待审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('190', '1', 'admin', 'admin_url', 'admin/chat/index', '', '聊天室管理', '');

-- ----------------------------
-- Table structure for cmf_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_category`;
CREATE TABLE `cmf_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) DEFAULT '',
  `img_z` varchar(100) NOT NULL DEFAULT '',
  `img_f` varchar(100) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `list_order` int(10) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_category
-- ----------------------------
INSERT INTO `cmf_category` VALUES ('1', '绝地求生', 'pubg', 'admin/20190723/5c487d50d029ff6dba714b2fdb02a737.png', 'admin/20190723/7bcd277e464cb9bc6b4c22be59af2c30.png', '0', '1');
INSERT INTO `cmf_category` VALUES ('2', 'CS:GO', 'csgo', 'admin/20190723/57dd17834a1d445eeb06ac595ba3646c.png', 'admin/20190723/678fbdb780c909aed24296e6f91d6c7b.png', '0', '5');
INSERT INTO `cmf_category` VALUES ('3', '人渣', 'scum', 'admin/20190723/6ec697ba615505a778addb5b75079926.png', 'admin/20190723/0e27e53d5f868b1b1aa1cfcfa6194afe.png', '0', '50');
INSERT INTO `cmf_category` VALUES ('4', '怪物猎人', 'mhw', 'admin/20190723/798466416f6aaf892cb8e37211c70398.png', 'admin/20190723/a5068c6bc1b9c144062457a1f922a513.png', '0', '4');
INSERT INTO `cmf_category` VALUES ('5', '英雄联盟', 'lol', 'admin/20190723/fe07441bf22c4a9057538c38614c732d.png', 'admin/20190723/2c9c386494d8d2191dc1a865ffa25a14.png', '0', '2');
INSERT INTO `cmf_category` VALUES ('6', '刺激战场', 'cj', 'admin/20190723/3828e40982e7cdf3b3befc934ee686ec.png', 'admin/20190723/1e25417f87d2d67064391060cfb8ee4a.png', '0', '7');
INSERT INTO `cmf_category` VALUES ('7', '王者荣耀', 'wzry', 'admin/20190723/40ca999dcb136a491433a612cf66a98b.png', 'admin/20190723/2ce46b7798df8279fe11b0e27e02e079.png', '0', '3');
INSERT INTO `cmf_category` VALUES ('8', '声优服务', 'syfw', 'admin/20190723/59031ea39f5ed5c9cc6d8c3d511ad2ab.png', 'admin/20190723/0bdc21a22a4bb3f0361c217ef066bd11.png', '0', '6');
INSERT INTO `cmf_category` VALUES ('9', '萌新', '', '', '', '1', '50');
INSERT INTO `cmf_category` VALUES ('10', '钻石', '', '', '', '1', '50');
INSERT INTO `cmf_category` VALUES ('11', '精英', '', '', '', '1', '50');
INSERT INTO `cmf_category` VALUES ('12', '大师', '', '', '', '1', '50');
INSERT INTO `cmf_category` VALUES ('13', '宗师', '', '', '', '1', '50');
INSERT INTO `cmf_category` VALUES ('14', '黄金新星', '', '', '', '2', '50');
INSERT INTO `cmf_category` VALUES ('15', '守卫精英', '', '', '', '2', '50');
INSERT INTO `cmf_category` VALUES ('16', '传奇之鹰', '', '', '', '2', '50');
INSERT INTO `cmf_category` VALUES ('17', '首席大师', '', '', '', '2', '50');
INSERT INTO `cmf_category` VALUES ('18', 'Nobody', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('19', 'Bottom Feeder', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('20', 'Wannabe', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('21', 'Hotshot', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('22', 'Sensation', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('23', 'Phenom', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('24', 'Superstar', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('25', 'Superstar', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('26', 'Idol', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('27', 'Luminary', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('28', 'Megastar', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('29', 'Icon', '', '', '', '3', '50');
INSERT INTO `cmf_category` VALUES ('30', 'HR50-HR100', '', '', '', '4', '50');
INSERT INTO `cmf_category` VALUES ('31', 'HR101-HR110', '', '', '', '4', '50');
INSERT INTO `cmf_category` VALUES ('32', 'HR111-HR120', '', '', '', '4', '50');
INSERT INTO `cmf_category` VALUES ('33', 'HR121-HR130', '', '', '', '4', '50');
INSERT INTO `cmf_category` VALUES ('34', 'HR131-HR140以上', '', '', '', '4', '50');
INSERT INTO `cmf_category` VALUES ('35', '英勇黄铜', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('36', '不屈白银', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('37', '荣耀黄金', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('38', '华贵铂金', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('39', '璀璨钻石', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('40', '超凡大师', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('41', '最强王者', '', '', '', '5', '50');
INSERT INTO `cmf_category` VALUES ('42', '坚韧铂金', '', '', '', '6', '50');
INSERT INTO `cmf_category` VALUES ('43', '不朽星钻', '', '', '', '6', '50');
INSERT INTO `cmf_category` VALUES ('44', '荣耀皇冠', '', '', '', '6', '50');
INSERT INTO `cmf_category` VALUES ('45', '超级王牌', '', '', '', '6', '50');
INSERT INTO `cmf_category` VALUES ('46', '尊贵铂金', '', '', '', '7', '50');
INSERT INTO `cmf_category` VALUES ('47', '永恒钻石', '', '', '', '7', '50');
INSERT INTO `cmf_category` VALUES ('48', '至尊星耀', '', '', '', '7', '50');
INSERT INTO `cmf_category` VALUES ('49', '最强王者', '', '', '', '7', '50');
INSERT INTO `cmf_category` VALUES ('50', '青叔音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('51', '正太音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('52', '少萝音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('53', '少女音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('54', '少御音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('55', '御姐音', '', '', '', '8', '50');
INSERT INTO `cmf_category` VALUES ('56', '个性筛选', '', '', '', '0', '50');
INSERT INTO `cmf_category` VALUES ('57', '御姐', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('58', '萝莉', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('59', '激情四射', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('60', '情感知心', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('61', '逗比闲聊', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('62', '声甜貌美', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('63', '颜值担当', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('64', '爽朗直率', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('65', '活泼可爱', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('66', '乖巧黏人', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('67', '电竞达人', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('68', '枪刚人稳', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('69', '服从指挥', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('70', '强势输出', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('71', '打野爸爸', '', '', '', '56', '50');
INSERT INTO `cmf_category` VALUES ('74', '123', '12', '', '', '9', '50');
INSERT INTO `cmf_category` VALUES ('75', '213', '21', '', '', '74', '50');
INSERT INTO `cmf_category` VALUES ('76', '3232134', '', '', '', '75', '50');

-- ----------------------------
-- Table structure for cmf_chat
-- ----------------------------
DROP TABLE IF EXISTS `cmf_chat`;
CREATE TABLE `cmf_chat` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `ename` varchar(100) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_chat
-- ----------------------------
INSERT INTO `cmf_chat` VALUES ('1', '20', '语音大厅', 'yuyin', '1', '1569834821', '');

-- ----------------------------
-- Table structure for cmf_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comment
-- ----------------------------
INSERT INTO `cmf_comment` VALUES ('1', '0', '165', '0', '413', '1534304208', '0', '1', '1', '', 'root1', '', '', 'http://new.wdzxiu.com/mg/413.html', 'a', null);
INSERT INTO `cmf_comment` VALUES ('2', '0', '165', '0', '413', '1534304284', '0', '1', '1', '', 'root1', '', '', 'http://new.wdzxiu.com/mg/413.html', 'rewerrwe', null);
INSERT INTO `cmf_comment` VALUES ('3', '0', '10', '0', '413', '1534645038', '0', '1', '1', '', 'ceshi', '', '', 'http://new.wdzxiu.com/mg/413.html', 'dasadsdadas', null);
INSERT INTO `cmf_comment` VALUES ('4', '0', '10', '0', '413', '1534645107', '0', '1', '1', '', 'ceshi', '', '', 'http://new.wdzxiu.com/portal/article/index/id/413.html', 'sdsdasdas', null);
INSERT INTO `cmf_comment` VALUES ('5', '0', '165', '0', '420', '1534660416', '0', '1', '1', '', 'root1', '', '', 'http://new.wdzxiu.com/mg/420.html', 'saddasdsa', null);
INSERT INTO `cmf_comment` VALUES ('6', '0', '1236', '0', '425', '1534736598', '0', '1', '1', '', 'muyu1630078', '', '', 'http://new.wdzxiu.com/mg/425.html', '好的', null);
INSERT INTO `cmf_comment` VALUES ('7', '0', '2', '0', '8', '1554707736', '0', '1', '1', '', 'ceshi', '', '', 'http://peiwan.wdzxiu.com/help/8.html', 'saasddas', null);

-- ----------------------------
-- Table structure for cmf_gift
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift`;
CREATE TABLE `cmf_gift` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charm` int(11) NOT NULL DEFAULT '0' COMMENT '魅力值/贡献值',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='礼物表';

-- ----------------------------
-- Records of cmf_gift
-- ----------------------------
INSERT INTO `cmf_gift` VALUES ('1', '1', '1.00', '100', '1', '', '黄瓜', 'admin/20190413/ee9ff12c2c942db49aa6fa594768d004.png');
INSERT INTO `cmf_gift` VALUES ('3', '1', '6.00', '600', '3', '', '红唇', 'admin/20190413/170c423a5f9b0156cb37a8974d1414ff.png');
INSERT INTO `cmf_gift` VALUES ('4', '1', '16.00', '1600', '4', '', '玫瑰', 'admin/20190413/bc05a33351b887ea13e3eb419f7d7171.png');
INSERT INTO `cmf_gift` VALUES ('5', '1', '66.00', '6600', '5', '', '香槟', 'admin/20190413/25608d80f541c4703782225afd349399.png');
INSERT INTO `cmf_gift` VALUES ('6', '1', '166.00', '16600', '6', '', '礼服', 'admin/20190413/c759e3f142761e4ba9c5c5e72048f9ba.png');
INSERT INTO `cmf_gift` VALUES ('7', '1', '266.00', '26600', '10000', '', '跑车', 'admin/20190414/a301789c4950b5c219da9383c48cc5b8.png');
INSERT INTO `cmf_gift` VALUES ('8', '1', '666.00', '66600', '10000', '', '火箭', 'admin/20190414/b64290818e2f6b7c1f89904b1d8595b2.png');

-- ----------------------------
-- Table structure for cmf_gift_give
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift_give`;
CREATE TABLE `cmf_gift_give` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `give_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `gift_id` int(8) NOT NULL DEFAULT '0' COMMENT '礼物的id',
  `pw_id` int(8) NOT NULL DEFAULT '0' COMMENT '陪玩师ID',
  `charm` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COMMENT='礼物记录表';

-- ----------------------------
-- Records of cmf_gift_give
-- ----------------------------
INSERT INTO `cmf_gift_give` VALUES ('1', '3', '1', '1555247894', '3', '2', '600');
INSERT INTO `cmf_gift_give` VALUES ('2', '3', '1', '1555248354', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('3', '3', '1', '1555248542', '5', '2', '6600');
INSERT INTO `cmf_gift_give` VALUES ('4', '3', '1', '1555248694', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('5', '3', '1', '1555248719', '4', '2', '1600');
INSERT INTO `cmf_gift_give` VALUES ('6', '5', '1', '1555248725', '3', '2', '600');
INSERT INTO `cmf_gift_give` VALUES ('7', '4', '1', '1555248729', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('8', '3', '1', '1555659934', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('9', '11', '1', '1555914551', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('10', '11', '1', '1555914569', '3', '11', '600');
INSERT INTO `cmf_gift_give` VALUES ('11', '11', '1', '1555915643', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('12', '3', '1', '1555917936', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('13', '11', '1', '1555992408', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('14', '11', '1', '1555992445', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('15', '3', '1', '1556298923', '3', '3', '600');
INSERT INTO `cmf_gift_give` VALUES ('16', '11', '1', '1556970477', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('17', '11', '1', '1557199077', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('18', '11', '1', '1558447510', '3', '17', '600');
INSERT INTO `cmf_gift_give` VALUES ('19', '11', '1', '1558447570', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('20', '11', '1', '1558447577', '1', '11', '100');
INSERT INTO `cmf_gift_give` VALUES ('21', '11', '1', '1559046205', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('22', '11', '1', '1559046211', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('23', '11', '1', '1559046216', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('24', '11', '1', '1559046220', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('25', '11', '1', '1559046224', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('26', '11', '1', '1559046232', '3', '17', '600');
INSERT INTO `cmf_gift_give` VALUES ('27', '3', '1', '1559109111', '3', '20', '600');
INSERT INTO `cmf_gift_give` VALUES ('28', '11', '1', '1559136980', '1', '9', '100');
INSERT INTO `cmf_gift_give` VALUES ('29', '11', '1', '1559136985', '1', '9', '100');
INSERT INTO `cmf_gift_give` VALUES ('30', '11', '1', '1559204375', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('31', '11', '1', '1559206873', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('32', '20', '1', '1559459252', '5', '11', '6600');
INSERT INTO `cmf_gift_give` VALUES ('33', '11', '1', '1559538213', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('34', '11', '1', '1559538224', '1', '17', '100');
INSERT INTO `cmf_gift_give` VALUES ('35', '11', '2', '1559538251', '1', '17', '200');
INSERT INTO `cmf_gift_give` VALUES ('36', '3', '1', '1568958908', '1', '20', '100');
INSERT INTO `cmf_gift_give` VALUES ('37', '20', '1', '1569139808', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('38', '20', '1', '1569139817', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('39', '46', '1', '1569157210', '1', '26', '100');
INSERT INTO `cmf_gift_give` VALUES ('40', '56', '1', '1569724691', '4', '55', '1600');
INSERT INTO `cmf_gift_give` VALUES ('41', '56', '2', '1569724701', '1', '55', '200');
INSERT INTO `cmf_gift_give` VALUES ('42', '20', '1', '1569863979', '3', '20', '600');
INSERT INTO `cmf_gift_give` VALUES ('43', '20', '1', '1569863986', '1', '20', '100');
INSERT INTO `cmf_gift_give` VALUES ('44', '47', '2', '1570609235', '4', '2', '3200');
INSERT INTO `cmf_gift_give` VALUES ('45', '47', '4', '1570609328', '3', '2', '2400');
INSERT INTO `cmf_gift_give` VALUES ('46', '2', '1', '1570609360', '3', '55', '600');
INSERT INTO `cmf_gift_give` VALUES ('47', '2', '1', '1570609460', '1', '2', '100');
INSERT INTO `cmf_gift_give` VALUES ('48', '2', '1', '1571228093', '1', '26', '100');
INSERT INTO `cmf_gift_give` VALUES ('49', '2', '1', '1571629906', '1', '18', '100');
INSERT INTO `cmf_gift_give` VALUES ('50', '2', '1', '1571827104', '4', '23', '1600');
INSERT INTO `cmf_gift_give` VALUES ('51', '2', '1', '1571827122', '6', '23', '16600');

-- ----------------------------
-- Table structure for cmf_group
-- ----------------------------
DROP TABLE IF EXISTS `cmf_group`;
CREATE TABLE `cmf_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_group
-- ----------------------------
INSERT INTO `cmf_group` VALUES ('1', '我的关注');

-- ----------------------------
-- Table structure for cmf_guanzhu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guanzhu`;
CREATE TABLE `cmf_guanzhu` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `pw_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_guanzhu
-- ----------------------------
INSERT INTO `cmf_guanzhu` VALUES ('1', '6', '3');
INSERT INTO `cmf_guanzhu` VALUES ('2', '6', '2');
INSERT INTO `cmf_guanzhu` VALUES ('3', '2', '2');
INSERT INTO `cmf_guanzhu` VALUES ('6', '5', '2');
INSERT INTO `cmf_guanzhu` VALUES ('8', '2', '3');
INSERT INTO `cmf_guanzhu` VALUES ('9', '18', '18');
INSERT INTO `cmf_guanzhu` VALUES ('10', '18', '11');
INSERT INTO `cmf_guanzhu` VALUES ('11', '18', '22');
INSERT INTO `cmf_guanzhu` VALUES ('12', '4', '11');
INSERT INTO `cmf_guanzhu` VALUES ('13', '11', '32');
INSERT INTO `cmf_guanzhu` VALUES ('14', '11', '34');
INSERT INTO `cmf_guanzhu` VALUES ('15', '18', '36');
INSERT INTO `cmf_guanzhu` VALUES ('16', '8', '34');
INSERT INTO `cmf_guanzhu` VALUES ('17', '18', '20');
INSERT INTO `cmf_guanzhu` VALUES ('18', '20', '3');
INSERT INTO `cmf_guanzhu` VALUES ('19', '20', '12');
INSERT INTO `cmf_guanzhu` VALUES ('20', '20', '46');
INSERT INTO `cmf_guanzhu` VALUES ('21', '26', '47');
INSERT INTO `cmf_guanzhu` VALUES ('22', '23', '2');
INSERT INTO `cmf_guanzhu` VALUES ('23', '18', '2');
INSERT INTO `cmf_guanzhu` VALUES ('24', '26', '48');

-- ----------------------------
-- Table structure for cmf_guild
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guild`;
CREATE TABLE `cmf_guild` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `slogan` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `list_order` int(3) NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_guild
-- ----------------------------
INSERT INTO `cmf_guild` VALUES ('1', 'SYK陪玩公会', '专注电竞所以专业', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '1', '1000');
INSERT INTO `cmf_guild` VALUES ('2', '顶尖游戏陪玩聚集地', '体验不一样的游戏玩法', 'default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg', '', '1000');
INSERT INTO `cmf_guild` VALUES ('3', '好玩的游戏 ', '你诚心诚意，我尽心竭力', 'default/20190405/84efe65d191dde0569e5833be02a2473.jpeg', '', '1000');
INSERT INTO `cmf_guild` VALUES ('4', '全网一流游戏', '团队，你的需求就是我们夙求', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '', '1000');
INSERT INTO `cmf_guild` VALUES ('5', '一起玩游戏', '大家一起来玩游戏', 'default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg', '', '1000');

-- ----------------------------
-- Table structure for cmf_haoma
-- ----------------------------
DROP TABLE IF EXISTS `cmf_haoma`;
CREATE TABLE `cmf_haoma` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `haoma` int(8) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_haoma
-- ----------------------------
INSERT INTO `cmf_haoma` VALUES ('2', '8888888', '6.00');
INSERT INTO `cmf_haoma` VALUES ('3', '99999', '6.00');
INSERT INTO `cmf_haoma` VALUES ('5', '555555', '4.00');
INSERT INTO `cmf_haoma` VALUES ('6', '222222', '3.00');
INSERT INTO `cmf_haoma` VALUES ('7', '11111', '8.00');
INSERT INTO `cmf_haoma` VALUES ('9', '777777', '2.00');
INSERT INTO `cmf_haoma` VALUES ('11', '44444', '1.00');
INSERT INTO `cmf_haoma` VALUES ('12', '55555', '1.00');
INSERT INTO `cmf_haoma` VALUES ('13', '666666', '1.00');
INSERT INTO `cmf_haoma` VALUES ('14', '77777', '1.00');
INSERT INTO `cmf_haoma` VALUES ('15', '6666666', '12.00');
INSERT INTO `cmf_haoma` VALUES ('16', '7777777', '10.00');
INSERT INTO `cmf_haoma` VALUES ('17', '8888887', '10.00');
INSERT INTO `cmf_haoma` VALUES ('18', '1111111', '10.00');
INSERT INTO `cmf_haoma` VALUES ('21', '6666663', '10.00');
INSERT INTO `cmf_haoma` VALUES ('22', '654321', '500.00');

-- ----------------------------
-- Table structure for cmf_haoma_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_haoma_log`;
CREATE TABLE `cmf_haoma_log` (
  `id` int(8) DEFAULT NULL,
  `haoma` int(8) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_id` int(8) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_haoma_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_hook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
INSERT INTO `cmf_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `cmf_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `cmf_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `cmf_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `cmf_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');

-- ----------------------------
-- Table structure for cmf_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cmf_hook_plugin
-- ----------------------------
INSERT INTO `cmf_hook_plugin` VALUES ('10', '10000', '0', 'footer_start', 'Demo');
INSERT INTO `cmf_hook_plugin` VALUES ('11', '10000', '1', 'admin_login', 'CustomAdminLogin');
INSERT INTO `cmf_hook_plugin` VALUES ('12', '10000', '1', 'comment', 'TcComment');
INSERT INTO `cmf_hook_plugin` VALUES ('13', '10000', '1', 'send_mobile_verification_code', 'MobileCodeDemo');
INSERT INTO `cmf_hook_plugin` VALUES ('15', '10000', '1', 'admin_dashboard', 'Statistics');
INSERT INTO `cmf_hook_plugin` VALUES ('16', '10000', '1', 'footer_start', 'Qqlogin');
INSERT INTO `cmf_hook_plugin` VALUES ('17', '10000', '0', 'admin_dashboard', 'SystemInfo');

-- ----------------------------
-- Table structure for cmf_level
-- ----------------------------
DROP TABLE IF EXISTS `cmf_level`;
CREATE TABLE `cmf_level` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level_id` varchar(255) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `jiedan` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_level
-- ----------------------------
INSERT INTO `cmf_level` VALUES ('1', '1', '0星', '0');
INSERT INTO `cmf_level` VALUES ('2', '2', '1星', '10');
INSERT INTO `cmf_level` VALUES ('3', '3', '2星', '50');
INSERT INTO `cmf_level` VALUES ('4', '4', '3星', '70');
INSERT INTO `cmf_level` VALUES ('5', '5', '4星', '85');
INSERT INTO `cmf_level` VALUES ('6', '6', '5星', '100');
INSERT INTO `cmf_level` VALUES ('7', '7', '1钻', '110');
INSERT INTO `cmf_level` VALUES ('8', '8', '2钻', '120');
INSERT INTO `cmf_level` VALUES ('9', '9', '3钻', '130');
INSERT INTO `cmf_level` VALUES ('10', '10', '4钻', '140');
INSERT INTO `cmf_level` VALUES ('11', '11', '5钻', '1000');

-- ----------------------------
-- Table structure for cmf_link
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_link
-- ----------------------------
INSERT INTO `cmf_link` VALUES ('1', '1', '1', '8', '开源之家', 'http://enboo.cn', '开源之家', '', '_blank', '');
INSERT INTO `cmf_link` VALUES ('5', '1', '0', '10000', '', 'http://s.enboo.cn', '源码商城', '', '_blank', '');
INSERT INTO `cmf_link` VALUES ('6', '1', '0', '10000', '', 'http://idc.enboo.cn', '站长数据', '', '_blank', '');

-- ----------------------------
-- Table structure for cmf_liuyan
-- ----------------------------
DROP TABLE IF EXISTS `cmf_liuyan`;
CREATE TABLE `cmf_liuyan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_liuyan
-- ----------------------------
INSERT INTO `cmf_liuyan` VALUES ('2', '11111', 0xE6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95E6B58BE8AF95, '1556440758', '0');
INSERT INTO `cmf_liuyan` VALUES ('3', '33', 0x61736461, '1557128019', '0');
INSERT INTO `cmf_liuyan` VALUES ('4', '888888', 0xE69C89E782B9E79195E796B5, '1557908170', '0');
INSERT INTO `cmf_liuyan` VALUES ('5', '5555', 0xE68A95E8AF89, '1559538813', '0');
INSERT INTO `cmf_liuyan` VALUES ('6', '5151', 0x31323132, '1560250368', '0');
INSERT INTO `cmf_liuyan` VALUES ('7', '123', 0x313233313233, '1560575729', '0');

-- ----------------------------
-- Table structure for cmf_maixu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_maixu`;
CREATE TABLE `cmf_maixu` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) NOT NULL DEFAULT '0',
  `nickname` varchar(100) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_maixu
-- ----------------------------
INSERT INTO `cmf_maixu` VALUES ('1', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('2', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('3', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('4', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('5', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('6', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('7', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('8', '0', '', '');
INSERT INTO `cmf_maixu` VALUES ('9', '0', '', '');

-- ----------------------------
-- Table structure for cmf_message
-- ----------------------------
DROP TABLE IF EXISTS `cmf_message`;
CREATE TABLE `cmf_message` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `is_read` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_message
-- ----------------------------
INSERT INTO `cmf_message` VALUES ('3', '3', '陪玩网欢迎您的加入', '陪玩网欢迎您的加入陪玩网欢迎您的加入陪玩网欢迎您的加入', '1555935927', '1');
INSERT INTO `cmf_message` VALUES ('5', '2', '有人下单了', '您有新的订单待处理，当前状态：待接单，订单号:19100916133744，请及时处理。', '1570608818', '1');
INSERT INTO `cmf_message` VALUES ('6', '2', '有人送礼物了', '32212123送给你2个玫瑰', '1570609235', '1');
INSERT INTO `cmf_message` VALUES ('7', '2', '有人送礼物了', '32212123送给你4个红唇，帮你增加了2400点魅力值。', '1570609328', '1');
INSERT INTO `cmf_message` VALUES ('8', '2', '有人送礼物了', 'ceshi送给你1个黄瓜，帮你增加了100点魅力值。', '1570609460', '0');
INSERT INTO `cmf_message` VALUES ('9', '20', '有人下单了', '您有新的订单待处理，当前状态：待接单，玩家QQ:1233132321，请及时联系玩家处理。', '1571227627', '0');
INSERT INTO `cmf_message` VALUES ('10', '26', '有人送礼物了', 'ceshi送给你1个黄瓜，帮你增加了100点魅力值。', '1571228093', '0');
INSERT INTO `cmf_message` VALUES ('11', '59', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1571230411', '0');
INSERT INTO `cmf_message` VALUES ('12', '0', '欢迎大家', '欢迎大家使用陪玩网', '1571382904', '1');
INSERT INTO `cmf_message` VALUES ('13', '18', '有人送礼物了', 'ceshi送给你1个黄瓜，帮你增加了100点魅力值。', '1571629906', '0');
INSERT INTO `cmf_message` VALUES ('14', '60', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1571707481', '0');
INSERT INTO `cmf_message` VALUES ('15', '20', '有人下单了', '您有新的订单待处理，当前状态：待接单，玩家QQ:1233132321，请及时联系玩家处理。', '1571740481', '0');
INSERT INTO `cmf_message` VALUES ('16', '20', '有人下单了', '您有新的订单待处理，当前状态：待接单，玩家QQ:1233132321，请及时联系玩家处理。', '1571816343', '0');
INSERT INTO `cmf_message` VALUES ('17', '20', '有人下单了', '您有新的订单待处理，当前状态：待接单，玩家QQ:1233132321，请及时联系玩家处理。', '1571819897', '0');
INSERT INTO `cmf_message` VALUES ('18', '23', '有人送礼物了', 'ceshi送给你1个玫瑰，帮你增加了1600点魅力值。', '1571827104', '0');
INSERT INTO `cmf_message` VALUES ('19', '23', '有人送礼物了', 'ceshi送给你1个礼服，帮你增加了16600点魅力值。', '1571827122', '0');
INSERT INTO `cmf_message` VALUES ('20', '61', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1572877878', '0');
INSERT INTO `cmf_message` VALUES ('21', '62', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1572949445', '0');
INSERT INTO `cmf_message` VALUES ('22', '63', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1573026316', '0');
INSERT INTO `cmf_message` VALUES ('23', '64', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1573030561', '0');
INSERT INTO `cmf_message` VALUES ('24', '65', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1573291659', '0');
INSERT INTO `cmf_message` VALUES ('25', '66', '欢迎注册陪玩网', '陪玩网欢迎您的加入。如果您是陪玩师，可以点击申请入驻按钮加入我们。', '1577449438', '0');

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `cmf_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for cmf_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of cmf_nav_menu
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_option
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
INSERT INTO `cmf_option` VALUES ('7', '1', 'site_info', '{\"site_name\":\"\\u6e38\\u620f\\u966a\\u73a9\\u7f511\",\"site_seo_title\":\"\\u6e38\\u620f\\u966a\\u73a9\\u7f51-\\u7f8e\\u5973\\u966a\\u73a9-\\u4e13\\u4e1a\\u7684\\u7535\\u7ade\\u6e38\\u620f\\u966a\\u73a9\\u7f51\\u7ad9\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"site_icp\":\"\\u9c81ICP\\u590712017249\\u53f7-1\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"site_address\":\"\\u5c71\\u897f\\u6e38\\u620f\\u966a\\u73a9\\u6709\\u9650\\u516c\\u53f8\",\"site_phone\":\"111111111111111\",\"site_admin_email1\":\"\"}');
INSERT INTO `cmf_option` VALUES ('8', '1', 'cmf_settings', '{\"open_registration\":\"1\",\"banned_usernames\":\"\"}');
INSERT INTO `cmf_option` VALUES ('9', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `cmf_option` VALUES ('10', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}');
INSERT INTO `cmf_option` VALUES ('11', '1', 'admin_dashboard_widgets', '[{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Statistic\",\"is_system\":0},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1},{\"name\":\"MainContributors\",\"is_system\":1}]');
INSERT INTO `cmf_option` VALUES ('12', '1', 'smtp_setting', '{\"from_name\":\"3221173766@qq.com\",\"from\":\"3221173766@qq.com\",\"host\":\"smtp.qq.com\",\"smtp_secure\":\"ssl\",\"port\":\"465\",\"username\":\"3221173766@qq.com\",\"password\":\"dnkcnlkwkrhnddbf\"}');
INSERT INTO `cmf_option` VALUES ('13', '1', 'email_template_verification_code', '{\"subject\":\"\\u90ae\\u7bb1\\u9a8c\\u8bc1\",\"template\":\"&lt;p&gt;\\u84dd\\u5e3d\\u5e2e\\u54e5\\u7528\\u6237:{$username}\\u60a8\\u597d\\uff0c\\u60a8\\u7684\\u90ae\\u7bb1\\u9a8c\\u8bc1\\u7801\\u4e3a:{$code}&lt;\\/p&gt;\"}');
INSERT INTO `cmf_option` VALUES ('14', '1', 'upload_setting', '{\"max_files\":\"20\",\"chunk_size\":\"512\",\"file_types\":{\"image\":{\"upload_max_filesize\":\"2048\",\"extensions\":\"jpg,jpeg,png,gif,bmp4,php\"},\"video\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"mp4,avi,wmv,rm,rmvb,mkv\"},\"audio\":{\"upload_max_filesize\":\"1024\",\"extensions\":\"mp3\"},\"file\":{\"upload_max_filesize\":\"1024\",\"extensions\":\"php,txt,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar\"}}}');
INSERT INTO `cmf_option` VALUES ('15', '1', 'tx_settings', '{\"tx_bili\":\"1\",\"min_money\":\"5\",\"max_money\":\"20000\"}');
INSERT INTO `cmf_option` VALUES ('16', '1', 'fuwufei_kd', '0.2');
INSERT INTO `cmf_option` VALUES ('17', '1', 'liwu_kd', '0.4');
INSERT INTO `cmf_option` VALUES ('18', '1', 'wxpay', '{\"AppID\":\"50\",\"appSecret\":\"5\",\"MchID\":\"20000\",\"Key\":\"20000\"}');
INSERT INTO `cmf_option` VALUES ('19', '1', 'alipay', '');
INSERT INTO `cmf_option` VALUES ('20', '1', 'tuijian', '10');
INSERT INTO `cmf_option` VALUES ('21', '1', 'gaiming', '1');

-- ----------------------------
-- Table structure for cmf_order
-- ----------------------------
DROP TABLE IF EXISTS `cmf_order`;
CREATE TABLE `cmf_order` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `kaishi_time` int(11) NOT NULL DEFAULT '0',
  `jiesu_time` int(11) NOT NULL DEFAULT '0',
  `pw_id` mediumint(8) NOT NULL DEFAULT '0',
  `jn_id` int(8) NOT NULL DEFAULT '0',
  `jn_num` int(8) NOT NULL DEFAULT '0',
  `content` text,
  `mobile` varchar(255) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `weixin` varchar(100) NOT NULL,
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ketui_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_order
-- ----------------------------
INSERT INTO `cmf_order` VALUES ('4', '11111111111111', '3', '6', '1555677071', '0', '1555834889', '1555838999', '2', '3', '1', '', '15608765432', '3424343', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('5', '22222222222222', '3', '6', '1555677098', '1555686275', '1555686474', '1555686526', '2', '3', '1', '', '15608765432', '3424343', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('6', '19042214331233', '11', '0', '1555914792', '0', '0', '0', '4', '2', '1', '', '15272474958', '888888', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('7', '19042215213280', '3', '5', '1555917692', '1556358949', '1559185944', '1559185948', '4', '2', '1', '', '15608765432', '342434', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('8', '19042520494188', '3', '0', '1556196581', '0', '0', '0', '2', '15', '2', '', '15608765432', '3424343', '', '24.00', '0.00');
INSERT INTO `cmf_order` VALUES ('9', '19042520511485', '3', '0', '1556196674', '1556414521', '1559180530', '1559180582', '2', '15', '1', '', '15608765432', '3424343', '', '12.00', '0.00');
INSERT INTO `cmf_order` VALUES ('10', '19042614071043', '3', '0', '1556258830', '0', '0', '0', '11', '17', '1', '', '15608765432', '3424343', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('11', '19042616404357', '2', '0', '1556268043', '0', '0', '0', '11', '18', '5', '', '18562530020', '1233132321', '', '100.00', '0.00');
INSERT INTO `cmf_order` VALUES ('12', '19042616420284', '2', '0', '1556268122', '0', '0', '0', '11', '18', '5', '', '18562530020', '1233132321', '', '100.00', '0.00');
INSERT INTO `cmf_order` VALUES ('13', '19042816314837', '3', '5', '1556440308', '0', '1556530468', '1556530480', '11', '17', '1', '', '15608765444', '342434311', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('14', '19042816320376', '3', '5', '1556440323', '0', '1556970525', '1556977232', '11', '17', '1', '', '15608765444', '342434311', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('15', '19050711211010', '11', '0', '1557199270', '0', '0', '0', '7', '5', '1', '', '15272474958', '888888', '', '30.00', '0.00');
INSERT INTO `cmf_order` VALUES ('16', '19051516175938', '11', '0', '1557908279', '0', '0', '0', '4', '2', '1', '', '15272474958', '12345', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('17', '19051516223081', '11', '0', '1557908550', '0', '0', '0', '9', '14', '1', '', '15272474958', '888888', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('18', '19051923200990', '17', '0', '1558279209', '0', '0', '0', '11', '17', '1', '', '15272474991', '123456', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('19', '19051923202692', '17', '0', '1558279226', '0', '0', '0', '2', '15', '1', '', '15272474991', '123456', '', '12.00', '0.00');
INSERT INTO `cmf_order` VALUES ('20', '19052022513943', '17', '0', '1558363899', '0', '0', '0', '9', '14', '1', '', '15272474991', '123456', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('21', '19052022515223', '17', '0', '1558363912', '0', '0', '0', '9', '14', '1', '', '15272474991', '123456', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('22', '19052100154675', '18', '0', '1558368946', '0', '0', '0', '11', '22', '1', '', '15272474999', '888888', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('23', '19052718520132', '18', '0', '1558954321', '0', '0', '0', '17', '24', '1', '', '15272474999', '888888', '', '30.00', '0.00');
INSERT INTO `cmf_order` VALUES ('24', '19052723161896', '17', '0', '1558970178', '0', '0', '0', '4', '2', '1', '', '15272474991', '123456', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('25', '19052723163363', '17', '0', '1558970193', '0', '0', '0', '4', '2', '1', '', '15272474991', '123456', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('26', '19052814041543', '3', '0', '1559023455', '0', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('27', '19052814052162', '3', '0', '1559023521', '0', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('28', '19052820193477', '11', '6', '1559045974', '0', '1559046037', '1559046090', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('29', '19052901421269', '11', '0', '1559065332', '0', '0', '0', '17', '23', '1', '让我开心开心', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('30', '19052909575379', '22', '0', '1559095073', '0', '0', '0', '18', '28', '1', '', '18679646228', '26341012', '', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('31', '19052913582290', '3', '5', '1559109502', '1559109703', '1559109528', '1559109531', '20', '49', '2', '', '15608765444', '342434311', '', '40.00', '0.00');
INSERT INTO `cmf_order` VALUES ('32', '19052914070211', '3', '0', '1559110022', '0', '0', '0', '20', '49', '3', '', '15608765444', '342434311', '', '60.00', '0.00');
INSERT INTO `cmf_order` VALUES ('33', '19052920423162', '11', '0', '1559133751', '0', '0', '0', '17', '23', '1', '', '15272474958', '12345678', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('34', '19053014401061', '11', '0', '1559198410', '0', '0', '0', '17', '23', '1', '', '15272474958', '12345', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('35', '19053016131489', '11', '0', '1559203994', '0', '0', '0', '17', '24', '1', '', '15272474958', '888888', '', '30.00', '0.00');
INSERT INTO `cmf_order` VALUES ('36', '19053016135979', '11', '0', '1559204039', '0', '1559204769', '1559204879', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('37', '19053016321754', '11', '5', '1559205137', '0', '1559205172', '1559205186', '17', '23', '1', '', '15272474958', '12345', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('38', '19053016592140', '11', '5', '1559206761', '0', '1559206775', '1559206781', '17', '23', '1', '', '15272474958', '123', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('39', '19053017022329', '11', '0', '1559206943', '0', '0', '0', '17', '24', '1', '', '15272474958', '888888', '', '30.00', '0.00');
INSERT INTO `cmf_order` VALUES ('40', '19053018100024', '11', '0', '1559211000', '0', '0', '0', '18', '28', '1', '', '15272474958', '888888', '', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('41', '19053110224233', '3', '0', '1559269362', '0', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('42', '19053110232833', '3', '5', '1559269408', '1559269977', '1559269977', '1559269977', '20', '49', '2', '', '15608765444', '342434311', '', '40.00', '0.00');
INSERT INTO `cmf_order` VALUES ('43', '19053110420038', '3', '5', '1559270520', '1559270520', '1559270520', '1559270520', '20', '49', '4', '', '15608765444', '342434311', '', '80.00', '0.00');
INSERT INTO `cmf_order` VALUES ('44', '19053110421747', '3', '0', '1559270537', '0', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('45', '19053111565284', '11', '0', '1559275012', '0', '0', '0', '17', '24', '1', '', '15272474958', '12345', '', '30.00', '0.00');
INSERT INTO `cmf_order` VALUES ('46', '19053112013485', '11', '0', '1559275294', '1559275295', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('47', '19053113521841', '11', '0', '1559281938', '1559281938', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('48', '19053113530746', '11', '5', '1559281987', '1559281987', '1559282106', '1559282121', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('49', '19053113571762', '11', '0', '1559282237', '0', '0', '0', '18', '28', '1', '', '15272474958', '888888', '', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('50', '19053114144210', '17', '0', '1559283282', '1559283282', '0', '0', '11', '16', '1', '', '15272474991', '1234', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('51', '19053114245538', '17', '0', '1559283895', '1559283895', '0', '0', '11', '16', '1', '', '15272474991', '123456', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('52', '19053118033211', '17', '0', '1559297012', '1559297012', '0', '0', '11', '16', '1', '', '15272474991', '123456', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('53', '19053118370251', '17', '0', '1559299022', '1559299022', '0', '0', '11', '16', '1', '', '15272474991', '123456', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('54', '19053118383296', '17', '0', '1559299112', '1559299112', '0', '0', '11', '16', '1', '', '15272474991', '123456', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('55', '19053120432278', '11', '0', '1559306602', '0', '0', '0', '2', '15', '1', '', '15272474958', '888888', '', '12.00', '0.00');
INSERT INTO `cmf_order` VALUES ('56', '19060214075179', '11', '0', '1559455671', '0', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('57', '19060301484846', '11', '0', '1559497728', '1559497728', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('58', '19060309200756', '3', '5', '1559524807', '1559524807', '1559524807', '1559524807', '20', '49', '1', '', '15608765444', '342434311', '222', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('59', '19060309353915', '3', '5', '1559525739', '1559525898', '1559525917', '1559275294', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('60', '19060309401855', '3', '6', '1559526018', '1559526018', '1559526037', '1559275294', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('61', '19060310111661', '3', '0', '1559527876', '1559527876', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('62', '19060312535311', '11', '0', '1559537633', '1559537633', '1559537684', '1559537697', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('63', '19060312563838', '11', '0', '1559537798', '1559537798', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('64', '19060313004021', '11', '6', '1559538040', '1559538040', '1559538051', '1559538056', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('65', '19060314102598', '11', '0', '1559542225', '1559542225', '0', '0', '17', '23', '2', '', '15272474958', '888888', '', '2.00', '0.00');
INSERT INTO `cmf_order` VALUES ('66', '19060314502762', '11', '0', '1559544627', '1559544627', '0', '0', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('67', '19060321093571', '11', '0', '1559567375', '1559567376', '0', '0', '17', '23', '5', '', '15272474958', '888888', '', '5.00', '0.00');
INSERT INTO `cmf_order` VALUES ('68', '19060517254397', '11', '5', '1559726743', '1559726743', '1559727002', '1559727006', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('69', '19061011035780', '3', '0', '1560135837', '0', '0', '0', '20', '49', '1', '', '15608765444', '342434311', '', '20.00', '0.00');
INSERT INTO `cmf_order` VALUES ('70', '19061212182994', '11', '0', '1560313109', '0', '0', '0', '18', '25', '1', '', '15272474958', '888888', '', '80.00', '0.00');
INSERT INTO `cmf_order` VALUES ('71', '19061310560666', '29', '0', '1560394566', '0', '0', '0', '23', '53', '1', '', '13622600017', '13622600017', '13622600017', '12.00', '0.00');
INSERT INTO `cmf_order` VALUES ('72', '19062522164088', '35', '0', '1561472200', '0', '0', '0', '23', '53', '1', '', '13641737183', '6737108', '', '12.00', '0.00');
INSERT INTO `cmf_order` VALUES ('73', '19062715531757', '3', '0', '1561621997', '0', '0', '0', '23', '53', '2', '', '15608765444', '342434311', '', '24.00', '0.00');
INSERT INTO `cmf_order` VALUES ('74', '19062719042979', '11', '0', '1561633469', '1561633469', '0', '0', '20', '48', '1', '', '15272474958', '888888', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('75', '19062719062328', '11', '6', '1561633583', '1561633583', '1561633596', '1561633602', '17', '23', '1', '', '15272474958', '888888', '', '1.00', '0.00');
INSERT INTO `cmf_order` VALUES ('76', '19070708562837', '3', '0', '1562460988', '0', '0', '0', '20', '48', '1', '', '15608765444', '342434311', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('77', '19071710280535', '17', '0', '1563330485', '0', '0', '0', '11', '29', '4', '', '15272474991', '123456', '', '32.00', '0.00');
INSERT INTO `cmf_order` VALUES ('78', '19071719504141', '3', '0', '1563364241', '0', '0', '0', '20', '49', '3', '', '15608765444', '342434311', '', '60.00', '0.00');
INSERT INTO `cmf_order` VALUES ('79', '19071720025497', '3', '0', '1563364974', '0', '0', '0', '20', '49', '2', '', '15608765444', '342434311', '', '36.00', '0.00');
INSERT INTO `cmf_order` VALUES ('80', '19072318523734', '20', '0', '1563879157', '0', '0', '0', '26', '87', '1', '', '111111111111', '112123', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('81', '19080314091926', '3', '6', '1564812559', '1564812623', '1564812638', '1564812654', '20', '48', '1', '', '15608765444', '342434311', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('82', '19080321300362', '3', '0', '1564839003', '0', '0', '0', '20', '48', '1', '', '15608765444', '22211', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('83', '19082218483910', '46', '0', '1566470919', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('84', '19082218492947', '46', '0', '1566470969', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('85', '19082218495945', '46', '0', '1566470999', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('86', '19082218501773', '46', '0', '1566471017', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('87', '19082218504286', '46', '0', '1566471042', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('88', '19082218515832', '46', '0', '1566471118', '0', '0', '0', '26', '87', '1', '', '15680118721', '888888', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('89', '19082218553713', '46', '0', '1566471337', '1566471337', '0', '0', '18', '28', '1', '', '15680118721', '888888', '', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('90', '19082918013863', '50', '0', '1567072898', '0', '0', '0', '20', '48', '1', '', '18672680823', '273529227', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('91', '19083020552642', '51', '0', '1567169726', '0', '0', '0', '20', '48', '1', '', '17808166463', '93516660', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('92', '19091114215658', '3', '0', '1568182916', '0', '0', '0', '33', '90', '2', '', '1560876', '22211', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('93', '19091713450262', '3', '0', '1568699102', '0', '0', '0', '2', '97', '5', '', '1560876', '22211', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('94', '19091713460563', '3', '0', '1568699165', '1568699165', '0', '0', '2', '97', '3', '', '1560876', '22211', '', '4.80', '0.00');
INSERT INTO `cmf_order` VALUES ('95', '19091814261758', '2', '0', '1568787977', '0', '0', '0', '4', '2', '1', '', '18562530020', '1233132321', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('96', '19091814262849', '2', '0', '1568787988', '0', '0', '0', '4', '2', '1', '', '18562530020', '1233132321', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('97', '19091814272145', '47', '0', '1568788041', '0', '0', '0', '4', '2', '1', '', '15806548168', '111', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('98', '19091814285417', '47', '0', '1568788134', '0', '0', '0', '4', '2', '1', '', '15806548168', '1233132321', '', '0.00', '0.00');
INSERT INTO `cmf_order` VALUES ('99', '19091814304684', '47', '0', '1568788246', '0', '0', '0', '4', '2', '1', '', '15806548168', '111', '', '8.00', '0.00');
INSERT INTO `cmf_order` VALUES ('100', '19092910303374', '55', '0', '1569724233', '1569724233', '0', '0', '18', '28', '1', '', '15723009030', '123456', '4545', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('101', '19092910364357', '56', '6', '1569724603', '1569724603', '1569724630', '1569724779', '55', '100', '1', '', '15868619261', '486456', '156456', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('102', '19092910390147', '56', '0', '1569724741', '1569724741', '1569724749', '1569724812', '55', '100', '1', '', '15868619261', '454854', '54545', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('103', '19092910444633', '56', '6', '1569725086', '1569725086', '1569725373', '1569725382', '55', '100', '1', '', '15868619261', '45456', '456465', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('104', '19100916133744', '47', '0', '1570608817', '1570608817', '0', '0', '2', '97', '2', '', '15806548168', '1233132321', '', '3.60', '0.00');
INSERT INTO `cmf_order` VALUES ('105', '19101620070727', '2', '0', '1571227627', '1571227627', '0', '0', '20', '48', '1', '', '18562530020', '1233132321', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('106', '19101620580585', '59', '0', '1571230685', '0', '0', '0', '18', '28', '1', '', '15021288172', '123', '', '29.00', '0.00');
INSERT INTO `cmf_order` VALUES ('107', '19102218344036', '2', '0', '1571740480', '1571740480', '0', '0', '20', '48', '1', '测试下单', '18562530020', '1233132321', '', '11.00', '0.00');
INSERT INTO `cmf_order` VALUES ('108', '19102315390281', '2', '0', '1571816342', '1571816342', '0', '0', '20', '92', '1', '', '18562530020', '1233132321', '', '10.00', '0.00');
INSERT INTO `cmf_order` VALUES ('109', '19102316381796', '2', '0', '1571819897', '1571819897', '0', '0', '20', '48', '1', '', '18562530020', '1233132321', '', '11.00', '0.00');

-- ----------------------------
-- Table structure for cmf_outline
-- ----------------------------
DROP TABLE IF EXISTS `cmf_outline`;
CREATE TABLE `cmf_outline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromid` int(11) NOT NULL,
  `toid` int(11) NOT NULL,
  `fromname` varchar(100) NOT NULL,
  `fromavatar` varchar(200) NOT NULL,
  `content` varchar(255) NOT NULL,
  `timeline` int(11) NOT NULL,
  `needsend` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_outline
-- ----------------------------
INSERT INTO `cmf_outline` VALUES ('1', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '1', '1564625657', '0');
INSERT INTO `cmf_outline` VALUES ('2', '3', '2', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '11', '1564626947', '0');
INSERT INTO `cmf_outline` VALUES ('3', '2', '20', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '111', '1564626979', '0');
INSERT INTO `cmf_outline` VALUES ('4', '20', '2', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', 'qweqweqwe', '1564627070', '0');
INSERT INTO `cmf_outline` VALUES ('5', '2', '20', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', 'img[/upload/avatar/20190801/91eb4bc7a0035923e7af158fe4daba04.png]', '1564627218', '0');
INSERT INTO `cmf_outline` VALUES ('6', '2', '20', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', 'img[/upload/avatar/20190801/5ae1e01c67533f8681834adc9bd7f7dd.jpg]', '1564627224', '0');
INSERT INTO `cmf_outline` VALUES ('7', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '111', '1564639227', '0');
INSERT INTO `cmf_outline` VALUES ('8', '3', '6', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '11', '1564639620', '1');
INSERT INTO `cmf_outline` VALUES ('9', '3', '11', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好啊，在吗', '1564716228', '0');
INSERT INTO `cmf_outline` VALUES ('10', '3', '33', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好', '1564716368', '0');
INSERT INTO `cmf_outline` VALUES ('11', '11', '3', '叫我爸爸好么？', '/upload/avatar/20190716/3c55adcc74d36ee3a12467cbd2ca5e09.png', '在啊', '1564716460', '0');
INSERT INTO `cmf_outline` VALUES ('12', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好吗', '1564716978', '0');
INSERT INTO `cmf_outline` VALUES ('13', '3', '91', 'root', '/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', '11', '1564746952', '0');
INSERT INTO `cmf_outline` VALUES ('14', '3', '91', 'root', '/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', 'face[晕] ', '1564746956', '0');
INSERT INTO `cmf_outline` VALUES ('15', '3', '20', 'root', '/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', '你好', '1564747070', '0');
INSERT INTO `cmf_outline` VALUES ('16', '20', '88', 'root1', 'http://www.suprass.cn/upload/avatar/20190722/1460ccab9801cbfa038e745ba0532b04.gif', 'img[/upload/avatar/20190802/4a63adb33a2654ac68ba849e7e690a51.jpg]', '1564747258', '1');
INSERT INTO `cmf_outline` VALUES ('17', '3', '20', 'root', 'http://www.suprass.cn/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', '你好', '1564747595', '0');
INSERT INTO `cmf_outline` VALUES ('18', '3', '91', 'root', '/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', 'img[/upload/avatar/20190802/827017d4ac56077a3cbc6fd84ab7f0fc.jpeg]', '1564747911', '0');
INSERT INTO `cmf_outline` VALUES ('19', '3', '91', 'root', '/upload/avatar/20190713/7e574b7af8cebb033d27bdc4bef17d99.jpg', 'face[晕] ', '1564747915', '0');
INSERT INTO `cmf_outline` VALUES ('20', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好', '1564748210', '0');
INSERT INTO `cmf_outline` VALUES ('21', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'img[/upload/avatar/20190802/b54c981b29300337a673f86b267bb7fa.jpg]', '1564748214', '0');
INSERT INTO `cmf_outline` VALUES ('22', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'face[鼓掌] ', '1564748238', '0');
INSERT INTO `cmf_outline` VALUES ('23', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', 'zai ', '1564748271', '0');
INSERT INTO `cmf_outline` VALUES ('24', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '在不在', '1564815275', '0');
INSERT INTO `cmf_outline` VALUES ('25', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好', '1564815499', '0');
INSERT INTO `cmf_outline` VALUES ('26', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '在吗', '1564815500', '0');
INSERT INTO `cmf_outline` VALUES ('27', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '看到了', '1564815524', '0');
INSERT INTO `cmf_outline` VALUES ('28', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '好的', '1564815529', '0');
INSERT INTO `cmf_outline` VALUES ('29', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '这个可以收到离线消息么', '1564815540', '0');
INSERT INTO `cmf_outline` VALUES ('30', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '刚才聊天服务我给关了', '1564815540', '0');
INSERT INTO `cmf_outline` VALUES ('31', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '现在开启了就可以了', '1564815544', '0');
INSERT INTO `cmf_outline` VALUES ('32', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '是的，离线可以收到', '1564815552', '0');
INSERT INTO `cmf_outline` VALUES ('33', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'img[/upload/avatar/20190803/f5ed03881b5603ba364ef306444e9ede.jpg]', '1564815565', '0');
INSERT INTO `cmf_outline` VALUES ('34', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '发个图片试试', '1564815569', '0');
INSERT INTO `cmf_outline` VALUES ('35', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '那后台能看到聊天消息吗', '1564815616', '0');
INSERT INTO `cmf_outline` VALUES ('36', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '聊天都是私聊', '1564815702', '0');
INSERT INTO `cmf_outline` VALUES ('37', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '聊天只能双方看到，后台看不到', '1564815714', '0');
INSERT INTO `cmf_outline` VALUES ('38', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '类似微信那种', '1564815721', '0');
INSERT INTO `cmf_outline` VALUES ('39', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '这个程序可以放到微信里么？', '1564815774', '0');
INSERT INTO `cmf_outline` VALUES ('40', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '可以', '1564815796', '0');
INSERT INTO `cmf_outline` VALUES ('41', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '手机端也实现了', '1564815801', '0');
INSERT INTO `cmf_outline` VALUES ('42', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '微信公众号接入手机端就可以', '1564815816', '0');
INSERT INTO `cmf_outline` VALUES ('43', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '能不能把微信发给我看看', '1564815944', '0');
INSERT INTO `cmf_outline` VALUES ('44', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'http://peiwan.wdzxiu.com/wap', '1564815989', '0');
INSERT INTO `cmf_outline` VALUES ('45', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '我现在没有微信，你可以在手机打开这个网址试试', '1564816003', '0');
INSERT INTO `cmf_outline` VALUES ('46', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '我没有微信公众号', '1564816011', '0');
INSERT INTO `cmf_outline` VALUES ('47', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '？', '1564817628', '0');
INSERT INTO `cmf_outline` VALUES ('48', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '111', '1564817637', '0');
INSERT INTO `cmf_outline` VALUES ('49', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '22', '1564817645', '0');
INSERT INTO `cmf_outline` VALUES ('50', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '33', '1564817652', '0');
INSERT INTO `cmf_outline` VALUES ('51', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '5', '1564817657', '0');
INSERT INTO `cmf_outline` VALUES ('52', '20', '17', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '测试', '1564817672', '0');
INSERT INTO `cmf_outline` VALUES ('53', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '我试了', '1564817732', '0');
INSERT INTO `cmf_outline` VALUES ('54', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '收不到离线', '1564817740', '0');
INSERT INTO `cmf_outline` VALUES ('55', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '？', '1564817745', '0');
INSERT INTO `cmf_outline` VALUES ('56', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '111', '1564817762', '0');
INSERT INTO `cmf_outline` VALUES ('57', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '22', '1564817774', '0');
INSERT INTO `cmf_outline` VALUES ('58', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '3', '1564817784', '0');
INSERT INTO `cmf_outline` VALUES ('59', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '44', '1564817787', '0');
INSERT INTO `cmf_outline` VALUES ('60', '3', '20', 'root', 'http://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '55', '1564817795', '0');
INSERT INTO `cmf_outline` VALUES ('61', '51', '33', '我很帅很牛逼', '/upload/avatar/20190802/5c543c4eb9645f0afb29ae14aa5187c9.jpg', '666', '1564835334', '0');
INSERT INTO `cmf_outline` VALUES ('62', '3', '4', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '你好，在吗', '1564837891', '0');
INSERT INTO `cmf_outline` VALUES ('63', '4', '3', 'ceshi1', '/upload/avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '你好，我在', '1564837911', '0');
INSERT INTO `cmf_outline` VALUES ('64', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '在么？', '1564838327', '0');
INSERT INTO `cmf_outline` VALUES ('65', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '在么？', '1564838758', '0');
INSERT INTO `cmf_outline` VALUES ('66', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？', '1564838785', '0');
INSERT INTO `cmf_outline` VALUES ('67', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '说话', '1564838804', '0');
INSERT INTO `cmf_outline` VALUES ('68', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '在的', '1564838831', '0');
INSERT INTO `cmf_outline` VALUES ('69', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '？', '1564838846', '0');
INSERT INTO `cmf_outline` VALUES ('70', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', 'img[/upload/avatar/20190803/e060f45cfdfb842078a7aba6b9c2b925.jpeg]', '1564838906', '0');
INSERT INTO `cmf_outline` VALUES ('71', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？', '1564838941', '0');
INSERT INTO `cmf_outline` VALUES ('72', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '111', '1564839078', '0');
INSERT INTO `cmf_outline` VALUES ('73', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '在不在？', '1564856414', '0');
INSERT INTO `cmf_outline` VALUES ('74', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '在的', '1564856448', '0');
INSERT INTO `cmf_outline` VALUES ('75', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '怎么', '1564856471', '0');
INSERT INTO `cmf_outline` VALUES ('76', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '？', '1564856489', '0');
INSERT INTO `cmf_outline` VALUES ('77', '3', '20', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '，', '1564856502', '0');
INSERT INTO `cmf_outline` VALUES ('78', '20', '3', 'root2', 'https://peiwan.wdzxiu.com/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '？img[/upload/avatar/20190804/8b122298de3cac914f18f8243e003931.jpeg]', '1564856529', '0');
INSERT INTO `cmf_outline` VALUES ('79', '3', '6', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'face[微笑] ', '1564883673', '1');
INSERT INTO `cmf_outline` VALUES ('80', '20', '8', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '；', '1564920229', '1');
INSERT INTO `cmf_outline` VALUES ('81', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '111', '1564976712', '0');
INSERT INTO `cmf_outline` VALUES ('82', '20', '3', 'root2', '/upload/avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '222', '1564976741', '0');
INSERT INTO `cmf_outline` VALUES ('83', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'sasdads', '1564976745', '0');
INSERT INTO `cmf_outline` VALUES ('84', '3', '20', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'img[/upload/avatar/20190805/dd71f2a4124187ec57102bb594290994.png]', '1564976750', '0');
INSERT INTO `cmf_outline` VALUES ('85', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '1', '1564984861', '0');
INSERT INTO `cmf_outline` VALUES ('86', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '2', '1564984926', '0');
INSERT INTO `cmf_outline` VALUES ('87', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '3', '1564984936', '0');
INSERT INTO `cmf_outline` VALUES ('88', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', 'y', '1564984958', '0');
INSERT INTO `cmf_outline` VALUES ('89', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', 'n', '1564984975', '0');
INSERT INTO `cmf_outline` VALUES ('90', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？', '1564985003', '0');
INSERT INTO `cmf_outline` VALUES ('91', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '111', '1564985021', '0');
INSERT INTO `cmf_outline` VALUES ('92', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '2', '1564985024', '0');
INSERT INTO `cmf_outline` VALUES ('93', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '3', '1564985025', '0');
INSERT INTO `cmf_outline` VALUES ('94', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '1', '1564985026', '0');
INSERT INTO `cmf_outline` VALUES ('95', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '145', '1564985026', '0');
INSERT INTO `cmf_outline` VALUES ('96', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '4', '1564985026', '0');
INSERT INTO `cmf_outline` VALUES ('97', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '4', '1564985026', '0');
INSERT INTO `cmf_outline` VALUES ('98', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '4', '1564985026', '0');
INSERT INTO `cmf_outline` VALUES ('99', '3', '17', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '555', '1564985042', '0');
INSERT INTO `cmf_outline` VALUES ('100', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '好吧', '1564985060', '0');
INSERT INTO `cmf_outline` VALUES ('101', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '测试', '1564985077', '0');
INSERT INTO `cmf_outline` VALUES ('102', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '贱人', '1564985094', '0');
INSERT INTO `cmf_outline` VALUES ('103', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'img[/upload/avatar/20190805/b2338c85f09797086a24de0b2bb4dfe4.png]', '1564985108', '0');
INSERT INTO `cmf_outline` VALUES ('104', '17', '3', 'taotao9', 'https://peiwan.wdzxiu.com/upload/default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '额', '1564985115', '0');
INSERT INTO `cmf_outline` VALUES ('105', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？？', '1564985118', '0');
INSERT INTO `cmf_outline` VALUES ('106', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？', '1564985118', '0');
INSERT INTO `cmf_outline` VALUES ('107', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '？/', '1564985119', '0');
INSERT INTO `cmf_outline` VALUES ('108', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '?/', '1564985120', '0');
INSERT INTO `cmf_outline` VALUES ('109', '3', '17', 'root', '/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '?', '1564985120', '0');
INSERT INTO `cmf_outline` VALUES ('110', '3', '11', 'root', 'https://peiwan.wdzxiu.com/upload/avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', 'img[/upload/avatar/20190810/8440226ed1e1a70885c06d96f4e3b812.jpg]', '1565434331', '1');
INSERT INTO `cmf_outline` VALUES ('111', '48', '33', 'cbing', 'http://peiwan.wdzxiu.com/upload/avatar/headicon.png', '你好', '1566368038', '1');
INSERT INTO `cmf_outline` VALUES ('112', '12', '20', 'ceshi66', '/upload/avatar/headicon.png', 'face[嘻嘻] ', '1566379934', '1');
INSERT INTO `cmf_outline` VALUES ('113', '12', '23', 'ceshi66', '/upload/avatar/headicon.png', 'face[嘻嘻] ', '1566468731', '1');
INSERT INTO `cmf_outline` VALUES ('114', '47', '2', '32212123', 'https://peiwan.wdzxiu.com/upload/avatar/headicon.png', 'face[哈哈] ', '1568785197', '0');
INSERT INTO `cmf_outline` VALUES ('115', '47', '2', '32212123', 'https://peiwan.wdzxiu.com/upload/avatar/headicon.png', 'img[/upload/avatar/20190918/dd918f9dea1ef4b1525a79a9222731ac.jpg]', '1568785332', '0');
INSERT INTO `cmf_outline` VALUES ('116', '47', '2', '32212123', 'https://peiwan.wdzxiu.com/upload/avatar/headicon.png', 'img[/upload/avatar/20190918/ce2cfe122c2c8f73cc0afc162c23a204.png]', '1568785339', '0');
INSERT INTO `cmf_outline` VALUES ('117', '2', '47', 'ceshi', 'https://peiwan.wdzxiu.com/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', 'face[泪] ', '1568785344', '0');
INSERT INTO `cmf_outline` VALUES ('118', '2', '26', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '1', '1569071723', '1');
INSERT INTO `cmf_outline` VALUES ('119', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '111', '1569072011', '0');
INSERT INTO `cmf_outline` VALUES ('120', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '21123', '1569072014', '0');
INSERT INTO `cmf_outline` VALUES ('121', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '12313', '1569072015', '0');
INSERT INTO `cmf_outline` VALUES ('122', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '121', '1569072015', '0');
INSERT INTO `cmf_outline` VALUES ('123', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '313', '1569072016', '0');
INSERT INTO `cmf_outline` VALUES ('124', '2', '2', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '131', '1569072016', '0');
INSERT INTO `cmf_outline` VALUES ('125', '2', '26', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '1212', '1569072024', '1');
INSERT INTO `cmf_outline` VALUES ('126', '2', '26', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '31213', '1569072025', '1');
INSERT INTO `cmf_outline` VALUES ('127', '2', '26', 'ceshi', '/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '1213', '1569072026', '1');
INSERT INTO `cmf_outline` VALUES ('128', '56', '55', 'yxcker1', '/upload/avatar/headicon.png', '489498', '1569724550', '0');
INSERT INTO `cmf_outline` VALUES ('129', '56', '55', 'yxcker1', '/upload/avatar/headicon.png', 'face[耶] ', '1569724565', '0');
INSERT INTO `cmf_outline` VALUES ('130', '55', '56', 'yxcker', '/upload/avatar/20190929/60c27d1d37201c4a528330302a569854.jpg', '4545646', '1569724574', '0');
INSERT INTO `cmf_outline` VALUES ('131', '56', '55', 'yxcker1', '/upload/avatar/headicon.png', 'asdas', '1569724679', '0');
INSERT INTO `cmf_outline` VALUES ('132', '56', '55', 'yxcker1', '/upload/avatar/headicon.png', '4486486', '1569726077', '0');
INSERT INTO `cmf_outline` VALUES ('133', '47', '2', '32212123', '/upload/avatar/headicon.png', '你好', '1571965854', '0');
INSERT INTO `cmf_outline` VALUES ('134', '2', '47', 'ceshi', 'https://peiwan.wdzxiu.com/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', 'zaia ', '1571965869', '0');
INSERT INTO `cmf_outline` VALUES ('135', '2', '47', 'ceshi', 'https://peiwan.wdzxiu.com/upload/avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', 'zaima', '1571965879', '0');

-- ----------------------------
-- Table structure for cmf_pingjia
-- ----------------------------
DROP TABLE IF EXISTS `cmf_pingjia`;
CREATE TABLE `cmf_pingjia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户评论的自增id',
  `pw_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '评论的内容',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否被管理员批准显示，1，是；0，未批准显示',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表该评论的用户的用户id',
  `create_time` int(10) NOT NULL,
  `order_id` int(4) DEFAULT '0',
  `jn_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_pingjia
-- ----------------------------
INSERT INTO `cmf_pingjia` VALUES ('1', '2', '4', 'asdadsasasd', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('2', '2', '5', 'dsaadsadsads', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('3', '2', '2', '撒大大撒所大所大所多', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('4', '2', '2', '撒大大撒所大所大所多撒大大撒所大所大所多撒大大撒所大所大所多撒大大', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('9', '2', '2', '撒大大撒所大所大所多撒大大撒所大所大所多撒大大撒所大所大所多撒大大', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('10', '2', '2', '撒大大撒所大所大所多撒大大撒所大所大所多撒大大撒所大所大所多撒大大', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('11', '2', '2', '撒大大撒所大所大所多撒大大撒所大所大所多撒大大撒所大所大所多撒大大', '0', '3', '1535854631', null, '12');
INSERT INTO `cmf_pingjia` VALUES ('12', '2', '5', '牛逼', '0', '3', '1555917888', '4', '3');
INSERT INTO `cmf_pingjia` VALUES ('13', '2', '3', '玩的还行', '0', '3', '1556360527', '5', '3');
INSERT INTO `cmf_pingjia` VALUES ('14', '17', '5', '小伙子很不错哈~~', '0', '11', '1559046153', '28', '23');
INSERT INTO `cmf_pingjia` VALUES ('15', '17', '5', '不错不错，技术很强！', '0', '11', '1559538124', '64', '23');
INSERT INTO `cmf_pingjia` VALUES ('16', '17', '4', '很好', '0', '11', '1561633670', '75', '23');
INSERT INTO `cmf_pingjia` VALUES ('17', '20', '2', '', '0', '3', '1561784754', '60', '49');
INSERT INTO `cmf_pingjia` VALUES ('18', '20', '3', '111', '0', '3', '1564812739', '81', '48');
INSERT INTO `cmf_pingjia` VALUES ('19', '55', '5', '4156456465', '0', '56', '1569724795', '101', '100');
INSERT INTO `cmf_pingjia` VALUES ('20', '55', '5', 'aaaa', '0', '56', '1569725395', '103', '100');

-- ----------------------------
-- Table structure for cmf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugin
-- ----------------------------
INSERT INTO `cmf_plugin` VALUES ('14', '1', '1', '0', '0', 'Demo', '插件演示', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', '1.0', '插件演示', '{\"text\":\"root\",\"password\":\"12345678\",\"number\":\"1.0\",\"select\":\"1\",\"checkbox\":[\"1\"],\"radio\":\"1\",\"radio2\":\"1\",\"textarea\":\"\\u8fd9\\u91cc\\u662f\\u4f60\\u8981\\u586b\\u5199\\u7684\\u5185\\u5bb9\",\"date\":\"2017-05-20\",\"datetime\":\"2017-05-20\",\"color\":\"#103633\",\"image\":\"\",\"location\":\"116.424966,39.907851\"}');
INSERT INTO `cmf_plugin` VALUES ('15', '1', '0', '1', '0', 'CustomAdminLogin', '自定义后台登录页', '', '', 'ThinkCMF', '', '1.0', '自定义后台登录页', '[]');
INSERT INTO `cmf_plugin` VALUES ('16', '1', '1', '1', '0', 'TcComment', '评论管理', 'http://www.songzhenjiang.cn', '', 'ThinkCMF', 'http://www.songzhenjiang.cn', '1.2', '评论管理', '[]');
INSERT INTO `cmf_plugin` VALUES ('17', '1', '0', '1', '0', 'MobileCodeDemo', '手机验证码演示插件', '', '', 'ThinkCMF', '', '1.0', '手机验证码演示插件', '{\"account_sid\":\"\",\"auth_token\":\"\",\"app_id\":\"\",\"template_id\":\"\",\"expire_minute\":\"30\"}');
INSERT INTO `cmf_plugin` VALUES ('19', '1', '0', '1', '0', 'Statistics', '统计信息', '', '', '小庄', '', '1.0', '用图表展示一些常用的信息', '[]');
INSERT INTO `cmf_plugin` VALUES ('20', '1', '0', '1', '0', 'Qqlogin', 'QQ登录', '', '', 'Tangchao', '', '1.0', 'QQ登录', '{\"appid\":\"\",\"appkey\":\"\"}');
INSERT INTO `cmf_plugin` VALUES ('22', '1', '0', '0', '0', 'SystemInfo', '系统信息', '', '', 'ThinkCMF', '', '1.0', '系统信息', '[]');
INSERT INTO `cmf_plugin` VALUES ('23', '1', '0', '1', '0', 'Wxlogin', '微信登录', '', '', 'Tangchao', '', '1.0', '微信登录', '{\"appid\":\"\",\"appsecret\":\"\"}');
INSERT INTO `cmf_plugin` VALUES ('24', '1', '0', '1', '0', 'wxpay', '微信支付', '', '', 'Tangchao', '', '1.0', '微信支付', '{\"appid\":\"\",\"mchid\":\"\",\"appsecret\":\"\",\"key\":\"\"}');
INSERT INTO `cmf_plugin` VALUES ('25', '1', '0', '1', '0', 'alipay', '支付宝支付', '', '', 'Tangchao', '', '1.0', '支付宝支付', '{\"appid\":\"2019060465457260\",\"rsaprivatekey\":\"MIIEogIBAAKCAQEAt3eoXFUSHgR7Bo4qEbt6AX1GsJOXtFBgkPdUn+gHXpMoKyTNz0ZYmjq7gnvb3pVzvp8jlCRqjzVca+InjRi0yRXVS+YJAo3\\/kMDIpvFJsJbLvnAgBW2L1ER0YB1miL+hx8TJlT9btsGrr1F0XKmMfxaDD8C8c0i8ndbj+Zlms3n6aQIr2N4x6mkxjJ0fLRS15hkx79\\/1kaHYws3IPFNKxZPsCXnNWcuvkI0xN4KepQwfL78dwFs6N6\\/eqFer57\\/mP7Tby7GEIIgg\\/roSbIP+FNF8FYqTmrxE+PYduHtEg8+oK5y6yx88J6DXyzb7Ws4FtzSQ3RPLTjl7cvaU6Dj\\/9QIDAQABAoIBADPMVb1Ty1ysOSu9oYUGIEkhXH7n\\/LHM66aiHcNT2BjMhU\\/BAVZe7w8EPAJ4A7iRC2+rMHlX2rn5\\/9D5td7xNcF8J49ZL\\/wHqTruIvh3MS3pNTbcIz5FEnBor06fnl5HdF6ZYayAid1MSrOh1K+AswkCixg8ezg1NgN+Mzk6JTPQZxDhRtXWXweTkgckiZrbMM\\/n1v6SA6ykzDWWRBW+fvXVxjK9nzjNz+osE02pj0bk6MHW5dqicdTO+mhjOP+AFVDKY50JNEmDTpti87OLggfmc1mcQooOUpsmh06FDiZOY9b8aJm77qs7y6Esyah4ArQ4NE2bxgqIelaW8F1\\/3qECgYEA2kAyDC\\/11hJyK4cvvCRhSZ1+vgL7owiw4Q3flmWFC8hhcDltDcUm8uXZ3T5s51XrN7FXLMGxejw7cUFrbrNpYU6+2neT6IAoTYs1ixcg2TUXX2qmKxPdpw4DFT6qUveCMzSBjvNT4jt7XuJbTqUPDoSgZhoTT+5KAPCAW9bAI40CgYEA1zNPOKxH2pebdwxSzF9s2iog2mnsjRsQ+KuAeBiZhc8SsGF99y4Ua\\/pTETS+7RwEa+56pr7geiL8WGF2fiqYuaSNEgk9bOFBSgbKNBd741CzqUALmjvXUPw98k+AfoAF3phGBpwA3Jx19LJzZejfgSm2IE36t6NrFmh9EnmGwAkCgYAdjH16KvAkyKCOhiIPXfmSBvHG9g5tt1qDTeaMrTgDLWEL2aqLJ7srPbVuf+oss\\/RBuQ\\/tblgCDa+amNnbxgypcQjj+TacTuWmAggAyePXpJmCgKT4xhrHaF1Afhh\\/XSVSm3RDD2y2\\/4ingwwLrMtKEujIihU9SCzazbUDOiMPbQKBgCzpE1Zjdddjnlk45Cqsm33oHtUWF\\/zWsjMDL5tgnuFy9paCshQctLxYEG\\/dzx6So0WXDlewLA6xMHKNXHo2D4tmkN47uWr4k3SMeDRo1jz5QZVHvWQhquzGx3LDLrC3rQHoS2zjr7ZanK9FcpnJAKPm\\/ZA+Vd1vKFET2044uGtpAoGAJP\\/6dBVvQ0mspTtW2RlxVfN3EKJuU9OyLWLXiymQUbbmGaE74A9J560wcF0CWpmODk1m0eprlUOOt4bf521OCB+ROGpcH26HC3PgY59KIio9nBcsfynLx8NO1iOzBrs403hf7hPrXDs9s8beDzFuWKU1gQ+yJi1\\/mDHYG06WN1g=\",\"alipayrsapublickey\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvWnoR9lW3JYYBrs9d9KG0NzHMJ1Z87K9AxIgWFqHfyWuUoZfuv2Q6RGzBkEi1IKNTg5FsIhGS229GnBloEVq6PWtTZgQQImG1ldCCFw1slr19IWyX2hDeykodeR3fz0GfYFWNFfwy92mysDnquXY5pmIHp0G24zRCIjOpdPgmhmx5motRDuiCh\\/C1FVFplq7E\\/vLwQFzCTAt\\/thsUj49plDQg\\/YztyQwe4KTL5M\\/NbNqRV7dsNo2DbDNAK4sHyBWdC\\/snOxTsvWG5l5Dgpy+9xOOPAfVngRz30KGME5XQTi4MIfU42CtNn04cEAdZAJF0ToCkZQPcD99fR3uxGejXwIDAQAB\"}');

-- ----------------------------
-- Table structure for cmf_plugin_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin_chat_user`;
CREATE TABLE `cmf_plugin_chat_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `chat_id` int(11) DEFAULT NULL COMMENT '聊天临时id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `type` tinyint(1) DEFAULT '1' COMMENT '1上线0下线',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_plugin_chat_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------
INSERT INTO `cmf_portal_category` VALUES ('1', '0', '0', '1', '0', '10000', '平台公告', '', '', '', '', '', '', '', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_portal_category` VALUES ('2', '0', '0', '1', '0', '10000', '资讯头条', '', '', '', '', '', '', '', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_portal_category` VALUES ('3', '0', '0', '1', '0', '10000', '帮助中心', '', '0-3', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for cmf_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------
INSERT INTO `cmf_portal_category_post` VALUES ('1', '1', '1', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('2', '2', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('4', '4', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('5', '5', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('6', '6', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('7', '7', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('8', '8', '3', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('9', '10', '1', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('10', '13', '1', '10000', '0');
INSERT INTO `cmf_portal_category_post` VALUES ('11', '15', '3', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('12', '16', '3', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('13', '17', '1', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('14', '18', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('15', '19', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('16', '20', '2', '10000', '1');
INSERT INTO `cmf_portal_category_post` VALUES ('17', '21', '2', '10000', '1');

-- ----------------------------
-- Table structure for cmf_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------
INSERT INTO `cmf_portal_post` VALUES ('1', '0', '1', '1', '1', '1', '1', '0', '0', '418', '0', '0', '1554464115', '1554464115', '1554464032', '0', '礼物系统优化上线', '', '', '', '\n&lt;p&gt; 亲爱的用户：                                        &lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;     为了给您提供更优质便捷的服务，平台已经在2018年7月3号正式对外开放礼物打赏功能！如有老板对陪玩专员技术服务的认可，可以尝试打赏功能哟。客服中心在此先替陪玩专员对老板打赏表示万分感谢！感谢您的信任与支持，我们将一如既往竭诚为您服务！&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('2', '0', '1', '1', '1', '1', '1', '0', '0', '88', '0', '0', '1554464248', '1554464248', '1554464138', '0', 'LOL: 这4大英雄没有技能伤害, 她靠平A获得MVP', '', '', '', '\n&lt;p&gt;一 兽灵行者.乌迪尔&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;乌迪尔应该是完全没有技能伤害的英雄，为什么这么说，有人说乌迪尔的大招会喷射烈焰波是AOE的伤害，但是你知道前提条件就是每3次攻击之后才会激活这个效果。Q技能增加攻速，W技能增加护盾和吸血，E技能则是第一次普攻附带眩晕效果，这个英雄技能都附加在普攻上面的，并没有真实的技能伤害。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img src=&quot;default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg&quot; title=&quot;1.jpeg&quot; alt=&quot;1.jpeg&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;二、瓦洛兰之盾.塔里克&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;宝石这个英雄主动技能只有一个，那就是E技能，但是这个E技能只有眩晕的效果，则额外的加成了一点点的魔法伤害。Q技能则是给队友增加治疗效果，W技能是给队友保护，R技能就是给队友无敌光环，所以这个是一个很实在的辅助英雄，没有伤害技能，都是额外的加成。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img src=&quot;default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg&quot; title=&quot;2.jpeg&quot; alt=&quot;2.jpeg&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;三、暗夜猎手.薇恩&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;薇恩有技能伤害吗？E技能击退？是靠什么触发的击退效果？是平A，而且受到E技能后，是额外加成的物理伤害，并没有实质性的伤害，所以并不能算技能的伤害。但是就是一个只有平A伤害的英雄，却让很多玩家闻风丧胆，也是靠着A平伤害赢得天下，可以说薇恩是ADC中后期伤害最高的英雄之一。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img src=&quot;default/20190405/84efe65d191dde0569e5833be02a2473.jpeg&quot; title=&quot;3.jpeg&quot; alt=&quot;3.jpeg&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;四、远古巫灵.泽拉斯&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;为什么会是泽拉斯？说到这里肯定会有不少网友想喷小编，不过这也不能怪我，这是网友们选出来的。因为泽拉斯这个英雄所有的技能都是预判的？当然还会有人说光辉、炸弹人等等的法师。&lt;/p&gt;\n&lt;p&gt;&lt;img src=&quot;default/20190405/7f2d5139b9f211ab58d5728299f30000.jpeg&quot; title=&quot;4.jpeg&quot; alt=&quot;4.jpeg&quot;&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('4', '0', '1', '1', '1', '1', '1', '0', '0', '86', '0', '0', '1554692319', '1554692319', '1554692289', '0', '创投观察 | 当我们在聊「游戏陪玩」时，我们在聊什么？', '', '', '', '\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;从污名化到被市场认可，「游戏陪玩」走过的道路与当年直播无异。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;游戏陪玩的本质是什么？&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;为何近两年来频频被资本下注？&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;这是本篇创投观察想要为大家解答的问题。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;「游戏陪玩」是游戏用户对游戏内容的体验升级，是除了游戏以外的消费延伸。同样作为游戏内容外延的代表，「游戏直播」在资本层面以及用户层面已被成功验证。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;那么「游戏陪玩」与「游戏直播」有何相似之处呢？&lt;/span&gt;&lt;/p&gt;\n&lt;ul class=&quot; list-paddingleft-2&quot; style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-bottom: 22px; padding: 0px 0px 0px 20px; vertical-align: baseline; word-break: break-word; list-style-position: initial; list-style-image: initial; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;\n&lt;li&gt;&lt;p style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word;&quot;&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;用户画像与游戏用户高度重合&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word;&quot;&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;内容与游戏本身强相关&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;\n&lt;li&gt;&lt;p style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word;&quot;&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;用户具备一定付费能力&lt;/span&gt;&lt;/p&gt;&lt;/li&gt;\n&lt;/ul&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;即「游戏陪玩」与&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;「游戏直播」一样，作为游戏的延伸业态，与游戏本身相辅相成，甚至可以理解为陪玩与直播为游戏的产业下游。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;再进一步，&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;游戏与直播本质上是个流量生意，陪玩亦是如此。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;作为游戏用户新的流量入口&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;，陪玩比直播的用户更精准，付费比例更高，其对游戏厂商的商业价值更大。其次，游戏陪玩天然具备社交基因，未来是有潜力从单一工具延伸出社区属性甚至切入陌生人社交。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;从投资角度看，游戏陪玩的天花板会随着游戏行业的快速增长而被抬高，但与直播不一样，游戏陪玩暂时还不具备产生P/UGC内容的能力，但就像前文所述，如果能实现从工具转向社交，一切的故事就不一样了。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;36氪认为，由于游戏陪玩与游戏的强相关性，这类业态的终局也许会跟直播平台一样：&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;头部被厂商收编，腰尾部则逐渐退出舞台。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('5', '0', '1', '1', '1', '1', '1', '0', '0', '138', '0', '0', '1554692362', '1554692362', '1554692340', '0', '2018，「电竞陪玩」元年', '', '', '', '\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;如果说 2016 年是直播元年，那么随着今年陪玩平台的迅速崛起，陪玩行业的元年也可能即将来临。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;large&quot; data-loadfunc=&quot;0&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2354303938,3940977582&amp;amp;fm=173&amp;amp;app=25&amp;amp;f=JPEG?w=640&amp;amp;h=427&amp;amp;s=F68B2DE0C0412CF725AD6401030000D9&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; width: 537px; display: block;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;2017 年，电子竞技市场规模突破 650 亿元，电子竞技行业正处在一个高速发展的增量市场，正因如此，围绕电竞新人群，从业者必须跟上变化，为用户提供新的产品与服务。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;除了硬核电竞玩家，对于很多刚接触电竞的休闲玩家来说，其玩游戏的需求点也各有不同。此前，直播、电竞衍生周边、线上线下比赛等，都让玩家们获得了不同的新体验。而&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;这些电竞衍生行业，与电竞本身组成了闭环生态。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;所以，今天我们讨论的中心，是陪玩能否成为电竞生态中的重要一环--就如同游戏直播之于电竞生态。作者通过采访多位陪玩平台运营者、平台投资人、一线“陪玩师”以及用户，提出四个讨论重点：&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩是如何崛起的？&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩平台针对不同需求有哪些打法？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;荧幕背后，陪玩师已成为职业？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩与电竞周边生态有哪些可能性？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-h3&quot; style=&quot;font-size: 18px; font-weight: 700; color: rgb(0, 0, 0); position: relative; padding-left: 9px;&quot;&gt;陪玩的崛起&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;large&quot; data-loadfunc=&quot;0&quot; src=&quot;https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2957532840,4246986944&amp;amp;fm=173&amp;amp;app=25&amp;amp;f=JPEG?w=640&amp;amp;h=325&amp;amp;s=E13224720D6054091069FE400200E075&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; width: 537px; display: block;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;资料来源：艾瑞咨询&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;2015 年起，电竞产业进入高速发展期，在 2017 年实现了 59.4% 爆发式增长率。人群泛化导致了需求的泛化，有人喜欢看大神或女神直播，也有人希望提升自身在游戏中的体验。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;在整个电竞产业生态闭环中，比陪玩更早期出现并发展壮大的是游戏直播“大军”&lt;/span&gt;，因为直播能在一定程度上满足玩家们的两个需求，即“在观看大神直播中学习技巧”，“在主播互动、打赏、弹幕聊天的过程中提升参与感”。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;目前看来，直播仍然是电竞产业链中不可缺少的一环，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;但论&lt;/span&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;沉浸式的体验感，陪玩则更具优势&lt;/span&gt;。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在陪玩平台上，用户可针对陪练、教学、上分等不同需求选择陪玩师，满足对娱乐内容的消费以及社交的刚需；平台层面，P/UGC 内容的产出有助于增加用户的粘性以及提高客单价。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;36氪通过采访多位陪玩平台消费者了解到，他们大部分人在寻找陪玩师之前，已经积累了一段游戏时间--也就是说，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;现在的陪玩并不是纯粹的“新手陪练”，而更像是游戏、电竞行业的一种消费升级。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩平台的出现，降低了高端玩家们输出其技能的门槛，而平台采用的 C2C 模式，也让愿意为电竞内容买单的用户能够更贴近“消费对象”，且获得一种比“看直播”更能提升游戏体验和技巧的途径。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-h3&quot; style=&quot;font-size: 18px; font-weight: 700; color: rgb(0, 0, 0); position: relative; padding-left: 9px;&quot;&gt;陪玩行业现状--讲“头部”还早&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩爆发在 2017 年，这一年的直播行业已经进入了淘汰赛，而今年，几个不同基因、不同发展阶段的陪玩平台都已实现了正向现金流。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;首先看一下电竞用户人群分布：根据艾瑞咨询的报告中显示，电竞用户 66.7% 为大学本科学历，男性用户占 59.3%，年龄在 19 - 24 岁的用户占 57.3%，个人每月收入在 5001 - 8000 元的用户占 28.7%；&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;MOBA 类游戏占 42.4%，射击类游戏占 27.6%，两者总占比高达 90%。&lt;/span&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;可以看到，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;人气最高的 MOBA 类游戏与射击类游戏占据九成市场，两种游戏都需要有同伴一起组队游玩才能获得更好的游戏体验&lt;/span&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;。&lt;/span&gt;在当下快节奏生活中，很多人找不到时间固定、个性合拍、技术水平高的“队友”，而结合“社交+游戏”的陪玩平台便成为了他们的选择之一。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;large&quot; data-loadfunc=&quot;0&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1049778161,3821560338&amp;amp;fm=173&amp;amp;app=25&amp;amp;f=JPEG?w=640&amp;amp;h=480&amp;amp;s=19A6009A4A3E45AB81E42DD9030010B2&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; width: 537px; display: block;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;左起分别为：「比心」「高手电竞」「暴鸡电竞」&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;2015 年切入陪玩市场的「比心」，是行业入局较早的一款产品，其前身为“鱼泡泡”，早期依托网鱼网咖作为其导流平台，发展了第一批陪玩用户。&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;比心认为，游戏技能的提供者（比心称他们为“大神”）在平台上共享自己的技能，平台给予指导价；用户根据自己的需求来平台选择大神完成技能的交易，实现技能共享与技能变现的商业闭环。2018 年 6 月，比心单月流水突破 2 亿元。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;值得一提的是，除了游戏陪玩，比心还有声音鉴定、情感咨询、图片处理等服务频道。&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;另一家陪玩平台「高手电竞」则相对早期。平台至今上线不足一年时间，可为玩家提供陪练、陪玩、一对一教学等电竞服务。高手电竞还会参与举办各类电竞赛事，深入线下帮助玩家理解电竞，同时这类活动也能吸引更多人努力成为“高手”（平台对陪玩师的称呼），或成为陪玩的消费者。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;高手电竞的愿景，就是希望让每位玩家通过“高手”的言传身教，能够提高自身技艺，提升游戏体验。而当部分“潜力”玩家成长到一定水平时，平台也会鼓励他们“成为高手”或参加平台举办的相关比赛。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;高手电竞创始人寿添告诉36氪，“&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;就像运动品牌之于体育运动、「Keep」之于健身一样，陪玩同样是电竞闭环生态中不可或缺的一环。&lt;/span&gt;许多玩家希望赢，我们就给他们帮助，事实上这就是刚需。”&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;36氪曾报道过的「暴鸡电竞」入局早于高手电竞，且模式与大多数陪玩平台相似，但在其近期更新的版本中，新增了“圈”功能，用创始人官志远的话说，这是一个所见即所得的互动社区，大神可以直接发布自己的游戏视频以及与跟游戏相关的短视频内容，用户看到内容后可直接在“圈”社区内预约线上陪玩。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;暴鸡电竞认为，需求层面，除了享受滴滴模式的高效匹配外，游戏用户对娱乐内容的消费以及社交都是刚需，而“圈”的定位就是在匹配模式的基础上补足用户的多元化需求。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;从多家平台发展趋势并综合需求量来看，陪玩市场未来规模有望超过百亿元人民币。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-h3&quot; style=&quot;font-size: 18px; font-weight: 700; color: rgb(0, 0, 0); position: relative; padding-left: 9px;&quot;&gt;“陪玩师”已成为职业，小姐姐们说...&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;说完用户，我们再来看看“陪玩师”们。在传统认知当中，电竞大神们要么奋战在职业第一线，要么转战内容行业（视频内容制作或直播）。那么，我国电竞领域的“高玩”群体，是否撑得起几亿电竞用户可能的陪玩需求？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;事实上，从 2005 年的 wNv.Gming 战队夺得 CS1.6 项目世界冠军，李晓峰（游戏ID：sky）2005 年获得魔兽争霸项目世界冠军，到后来的 《DOTA 2》、《英雄联盟》、《绝地求生》等电竞项目，中国从不缺少优秀选手和世界冠军。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;虽然职业电竞的繁荣带动了“全民电竞”的潮流，但除了成为职业选手以外，高端玩家们只有做主播、产出 UGC 内容等为数不多的技能变现方式。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;36氪采访了两位在比心平台工作的陪玩“小姐姐”，她们并不是职业玩家出身，但经过后天训练而拥有了较高的技巧。同时，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;陪玩师作为声优，甜美且吸引人的声音与话术也让用户愿意为这类消费买单&lt;/span&gt;。&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩师夏至（化名）告诉36氪，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;自己以前是四线城市的一名电视台工作人员，“当时月薪大约 3000 元，&lt;/span&gt;对于大学刚毕业的我来说，在家乡这是一份待遇很好的工作了。后来接触到陪玩平台后，逐渐从兼职专为全职，原来的工作也辞掉了。现在每天朝十晚七，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;不是很累的情况下每个月也能拿到八、九千元&lt;/span&gt;，这在平台上算比较正常的全职薪资水平了。”&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;墨雪（化名）以前做微商淘到了第一桶金，后来曾做过&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;秀场主播&lt;/span&gt;。她表示，在直播刚火起来那几年虽然赚钱，但为了与别人竞争，总要学习更多舞蹈、歌曲；同时，“直播的前三个月还很有新鲜感，越往后就越像重复劳动了。”&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;“我一开始是平台的用户，因为电竞方面自己也是新手，后来水平上来以后逐渐转做了陪玩师。”墨雪认为，每当碰到第一次找到她消费陪玩服务的用户，都有可能新交一个朋友，“包括我在内的‘小姐姐’们都很健谈，而且陪玩时大家聊的可能不只是游戏本身，有时候会听到许多新鲜事，这能让人的心态保持年轻。”&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;当然，对于陪玩师门来说，最大的痛点，是收入不稳定以及对陪玩职业化的不确定性；另一方面，陪玩平台亟须提升陪玩人员的整体素质甚至打造自有 KOL，增强用户对平台的粘性。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;针对陪玩师可能出现的困扰与问题，除了平台会对个人陪玩师进行不同形式的上岗前培训外，还催生了专门为陪玩平台培养陪玩师的经纪公司。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;large&quot; data-loadfunc=&quot;0&quot; src=&quot;https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=390883805,3082198788&amp;amp;fm=173&amp;amp;app=25&amp;amp;f=JPEG?w=640&amp;amp;h=295&amp;amp;s=50D30E7403D869C85E7DD5DF000010B0&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; width: 537px; display: block;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;「鲸致互娱」的全服务流程，其职业发展路线也是很多陪玩师向往的&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;36氪曾报道过的「鲸致互娱」，其陪玩培训体系包含了 6 个维度：&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-ol&quot; style=&quot;font-size: 18px; list-style-type: decimal; display: block; line-height: 27px; padding-left: 26px;&quot;&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 11px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;发音技巧的培训：体现陪玩师的个性，拉近与玩家的距离；&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 11px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;实力价值最大化：根据不同游戏不同版本为陪玩师指定的最优的竞技攻略；&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 11px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;沟通话术：学会如何破冰，如何避免尴尬，让陪玩师与玩家成为朋友，深挖彼此的兴趣点；&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 11px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;趣味玩法：鲸致互娱内部成立了“玩法实验室”，研究人员会开发具备趣味性的游戏体验，教授陪玩师按剧本推进游戏；&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 11px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;个人形象管理：针对不同平台呈现不同的的外在形象；&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;bjh-li&quot; style=&quot;display: list-item; margin-bottom: 0px;&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;流程服务把控：从用户接单到完成陪玩，鲸致互娱会出具一套行为规范模板，让陪玩师在不同的关键节点让客户的体验最佳。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;这套培训体系下，平均 1 名经纪人会负责 30 位陪玩师，每位陪玩师的培训周期在1~2周之间，培训完成后，平台会为颁发证书，并为每个陪玩师出具一份从 6 个维度量化陪玩师能力的雷达图。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;当确认陪玩师能够正常上岗工作后，鲸致互娱会将其下派到指定的陪玩平台入驻。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;除了针对陪玩师进行技能培训外，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;经纪公司&lt;/span&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;还针对头部陪玩师规划了三条不同的职业发展路径：陪玩主播、职业选手或者高玩以及网红--这也是很多个体陪玩师希望得到的归宿。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-h3&quot; style=&quot;font-size: 18px; font-weight: 700; color: rgb(0, 0, 0); position: relative; padding-left: 9px;&quot;&gt;直播、陪玩以及未来的电竞内容消费方式？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;陪玩的在平台内的收入包括订单收益、红包收益、礼物打赏收益，各平台对于这些收益都会进行抽成，以此作为平台的核心营收。&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;而平台通常会根据陪玩师的个人情况设置指导价，线上陪玩普遍约为25-60元/小时，线下则约为100-200元/小时。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;此外，平台出售虚拟道具赚取收益，该赢利点平台赚取100%，例如：头像装饰、聊天气泡、陪玩详情也壁纸，开设语音频道等。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img class=&quot;large&quot; data-loadfunc=&quot;0&quot; src=&quot;https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2853332050,1805126252&amp;amp;fm=173&amp;amp;app=25&amp;amp;f=JPEG?w=640&amp;amp;h=426&amp;amp;s=3AB591AE0C5106D44DF92FB703005086&quot; data-loaded=&quot;0&quot; style=&quot;border: 0px; width: 537px; display: block;&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 26px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;即使在&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;现阶段，陪玩看起来更像一门流量生意&lt;/span&gt;，但36氪认为，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;由于陪玩具备天然的社交属性，且长期消费的话，客单价远高于观看直播的平均消费水平，所以平台们的规模在发展至瓶颈后，将从社交方面寻求更多变现可能。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;例如&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;比心目前更像是一个交易平台&lt;/span&gt;，通过做流量生意已经迅速崛起，而&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;暴鸡电竞则在近期上线的 2.50 版本中新增了“圈”功能，&lt;/span&gt;用创始人官志远的话说，这是一个所&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;见即所得的互动社区&lt;/span&gt;，大神可以直接发布自己的游戏视频以及与跟游戏相关的短视频内容，用户看到内容后可直接在“圈”社区内预约线上陪玩。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;暴鸡为何选择切入社交？我们先做个对比。作为具有代表性的社交产品「陌陌」，其市值在 100 亿美元上下，而两个多月前美股上市的「虎牙直播」其近期市值在 75 亿美元左右--而这个数字还被大部分分析机构认为有“注水”嫌疑。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;同时，虎牙季度收入约为1.3亿-1.5亿美元，预估全年销售额为 6 亿美元；而陌陌年中发布的财报显示，2018年第一季度的净收入为 4.351 亿美元，同比增加 64%，净利润从去年同期的8120万美元增长至1.299亿美元。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;做交易平台可以让现金流维持在不错的水平，像是“短跑”；做社交、做社区，则需为了未来在宣传、拉客、运营等业务上烧更多钱，像是“长跑”。&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;所以长远来看，&lt;/span&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;陪玩平台从工具到内容、再从内容到社区、最终切入社交，可能会是其最佳发展路线。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;不过基于线下陪玩模式的社交，可能存在“灰色交易”--很多主打匿名社交的 App 在早期都曾因此而经历过下架风波。以比心为例，目前平台正在持续弱化“线下陪玩”的入口，并降低这部分的业务量。未来，平台们大概率会将这部分业务彻底取消，从根源解决灰色交易对平台带来的风险。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;未来还会出现哪些业态？&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;纵观整个电竞行业，与其本身组成闭环生态的其实早已不止有直播。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;在&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;游戏周边衍生品&lt;/span&gt;的探索道路上，英雄联盟很早就推出了周边商城，包含手办、绒毛玩偶、卫衣、队服、书包等一系列产品。此外，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;产业联动&lt;/span&gt;也会为电竞本身带来新机会，包括华硕电脑、bilibili、Top Sports 和梅赛德斯奔驰等各行业巨头，将综合考虑自身资源以及未来的战略规划，从而购买与自身属性最契合的电竞产业，并通过多板块的联动与叠加效应达到整体利益的最大化。&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;值得一提的是，36氪近期也观察到已有&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;主打电竞内容的短视频&lt;/span&gt;平台开始出现，“电竞+短视频+社交”也将成为未来我们讨论的重点。同时，暴鸡电竞在此前的采访中也曾透露出做短视频业务的意向。此外，36氪曾报道过的电竞数据开放平台「VARENA」，以及部分与玩家社区相结合的数据查询App，未来也有潜力成为电竞生态中的重要一环。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;无论是陪玩、直播，还是电竞周边、电竞数据平台、短视频或纯社交平台，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;在经历了电竞“由内向外破壁”的 2017 年后，陪玩的迅速崛起证明了电竞生态具有足够的吞吐量及发展发展潜力。&lt;/span&gt;未来，陪玩将会继续为更多“大神”提供工作机会，为更多用户带来快乐，而其本身也有实力像直播一样，成为电竞生态中的重要一环。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('6', '0', '1', '1', '1', '1', '1', '0', '0', '143', '0', '0', '1554692396', '1554692396', '1554692372', '0', '获1500万美元A+轮融资，「暴鸡电竞」推出“圈”功能，转型游戏互动陪玩平台', '', '', '', '\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;36氪独家获悉，游戏互动陪玩平台「暴鸡电竞」完成1500万美元的A+轮融资，由启明创投领投，红杉资本中国、真格基金与晨兴资本跟投，本轮资金将用于产品矩阵及公会体系的打造。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;暴鸡电竞成立于2017年1月，成立初即获得博派资本数百万人民币天使投资；2017年4月获得千万级人民币Pre-A轮融资，由真格基金和晨兴资本投资；2017年11月获得红杉资本中国领投的A轮融资，真格基金与晨兴资本跟投。暴鸡电竞是业内最早使用滴滴下单模式为陪玩师和游戏用户做匹配的初创团队之一。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;最新数据显示，暴鸡电竞已有超过500万注册用户，100万付费用户，平均复购率达60%，预计年底日订单将突破20万单。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;与去年11月报道时，暴鸡电竞最大的改变是从一款单一的游戏陪玩工具转型成了一个集工具与内容社区的游戏互动陪玩平台。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;昨天上线的 2.50 版本中，暴鸡电竞新增了“圈”功能，用创始人官志远的话说，&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;这是一个所见即所得的互动社区，&lt;/span&gt;大神可以直接发布自己的游戏视频以及与跟游戏相关的短视频内容，用户看到内容后可直接在“圈”社区内预约线上陪玩。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;img src=&quot;http://timg01.bdimg.com/timg?pa&amp;amp;imgType=0&amp;amp;sec=1439619614&amp;amp;di=d089b354e07ed860cdac6c9dac0b8f2f&amp;amp;quality=100&amp;amp;size=b980_10000&amp;amp;src=http%3A%2F%2Fpic.rmb.bdstatic.com%2Fd9236688d5fc24ae5c211ccfd2633490.jpeg&quot; style=&quot;border: 0px; width: 537px; display: block; font-family: arial; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;“圈”功能&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;之所以推出“圈”功能，我们可以从用户需求层面、平台层面与商业层面去分析。&lt;span class=&quot;bjh-br&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;需求层面，除了享受滴滴模式的高效匹配外，游戏用户对娱乐内容的消费以及社交都是刚需，而“圈”的定位就是在匹配模式的基础上补足用户的多元化需求。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;平台层面，大量P/UGC内容的产出有利于增加用户的粘性以及提高客单价，辅以一定的运营手段，内容社区对平台拉新也会有较好促进作用；其次，有了内容社区，陪玩师有机会通过展现自己游戏之外的其他才能，成为“圈”内KOL。基于此，陪玩师可以调整陪玩的客单价，未来不排除会推出多人竞拍与陪玩师一起游戏的功能。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;商业层面，官志远表示现阶段暴鸡电竞仍在构建生态，打好地基，明年开始正式商业化运作。就暴鸡电竞现有形态，我们可以预见到的变现模式有：Feed流广告、游戏的分发联运、抽佣、直播等一些列与游戏相关的模式。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;之所以暴鸡电竞等陪玩平台们会对广告主以及游戏厂商有吸引力，核心逻辑在于&lt;span class=&quot;bjh-strong&quot; style=&quot;font-size: 18px; font-weight: 700;&quot;&gt;陪玩平台的活跃用户等同于游戏的付费用户，即用户极其精准。&lt;/span&gt;接下来，陪玩平台们要验证的是，陪玩活跃用户的转化率。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;除了“圈”功能以外，暴鸡电竞还优化了暴鸡车队的体验，推出了暴鸡电竞小程序，打通了app与小程序的数据，用户可以直接把车队拼单以小程序的方式分享到群组内。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;总得来说，暴鸡电竞等陪玩平台抓住了中国游戏市场的高速增长的红利。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;据中国音数协游戏工委（GPC）、伽马数据（CNG）、国际数据公司（IDC）发布的《2017年中国游戏产业报告》显示，2017年中国游戏市场实际销售收入达到2036.1亿元，同比增长23.0%。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 10px; margin-bottom: 10px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span class=&quot;bjh-p&quot;&gt;值得一提的是，中国移动游戏市场实际销售收入达到1161.2亿元，同比增长41.7%，&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('7', '0', '1', '1', '1', '1', '1', '0', '0', '159', '0', '0', '1554692441', '1554692441', '1554692421', '0', '约玩平台「比心」获IDG资本数千万美元A轮融资，估值超1亿美元', '', '', '', '\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;36氪获悉，约玩平台「比心」已完成数千万美元A轮融资，由IDG资本领投，资金将主要用于团队的扩张与优化，旨于进一步抢占约玩市场的份额，A融资完成后「比心」估值已超1亿美元。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;「比心」原名「鱼泡泡」，公司成立于2014年，2015年APP正式上线。上线1年后，鱼泡泡获得了网鱼网咖5000万人民币的天使轮融资。本轮融资是鱼泡泡也就是比心成立以来的第二次股权融资。&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;「比心」定位约玩平台，采用C2C的模式，为供需双方实现高效匹配。平台上，约玩品类一共分为以下几个大项：&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;线上游戏、线下游戏、线上娱乐、线下娱乐、声优、心理咨询、文艺生活以及外语类。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;img alt=&quot;36氪首发 | 约玩平台「比心」获IDG资本数千万美元A轮融资，估值超1亿美元&quot; src=&quot;https://pic.36krcnd.com/201803/21070929/b0kwkztdbbc3tbsm.jpg!1200&quot; data-img-size-val=&quot;1456,971&quot; style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 30px auto; padding: 0px; vertical-align: baseline; word-break: break-word; border-radius: 5px; display: block; max-width: 690px;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;img alt=&quot;36氪首发 | 约玩平台「比心」获IDG资本数千万美元A轮融资，估值超1亿美元&quot; src=&quot;https://pic.36krcnd.com/201803/21070938/ie0rwymjo8zc94pd.jpg!1200&quot; data-img-size-val=&quot;1471,885&quot; style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 30px auto; padding: 0px; vertical-align: baseline; word-break: break-word; border-radius: 5px; display: block; max-width: 690px;&quot;&gt;&lt;/p&gt;\n&lt;p class=&quot;img-desc&quot; style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 20px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; margin: -2px auto 15px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(153, 153, 153); max-width: 690px; text-align: center; white-space: normal;\'&gt;比心的约玩品类&lt;br&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;目前线上线下的游戏约玩为最活跃的板块，也是为公司带来收入的核心板块。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;比心CEO林嵩告诉36氪：&lt;/span&gt;&lt;/p&gt;\n&lt;blockquote style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, &quot;\\\\5fae软雅黑&quot;, STHeitiSC-Light, simsun, &quot;\\\\5b8b体&quot;, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin: 30px 0px; padding: 6px 0px 6px 55px; vertical-align: baseline; word-break: break-word; quotes: none; color: rgb(61, 70, 77); position: relative; text-align: justify; white-space: normal;\'&gt;&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 28px; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 0px; padding: 6px 10px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;“比心从2015年刚起步时，以&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;上海一家网鱼网咖门店作为试点，选了10 个LOL玩家，其中 8 个是高颜值高段位的女玩家，另外两个男玩家则是一区和二区的最强王者。初期，比心团队直接从门店拉来 100 个种子用户做单点验证。通过这种模式，「比心」&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;第一个月做到 100 万的流水，随后通过优化团队，2015年全年实现了1000 万元人民币的收入。”&lt;/span&gt;&lt;/p&gt;&lt;/blockquote&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;因为单点模型验证成功，上线一年后，「比心」获得了网鱼网咖5000万的天使轮融资。利用网鱼网咖线下门店的批量化导流，36氪获得的最新数据是：「比心」在&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;2016年的流水超过1个亿，去年流水为5个亿。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;在林嵩看来，「比心」的核心优势有两个，&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;其一是打通线上与线下的流量入口，实现低成本精准获客&lt;/span&gt;，即与网鱼网咖之间的相互导流：网鱼网咖的用户如果通过「比心」充值网费，可以享受20~30%的优惠，会员也会定期收到「比心」的激活信息。与此同时，「比心」也会利用其线下约玩的入口将用户导回网鱼网咖。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;通过这种导流方式，「比心」转化了近300万用户。尤其是近期&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;绝地求生的火爆，对其数据增长带来了不错的效果。&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;目前「比心」日均10万单交易，其中50%以上源自绝地求生。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;其二，&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;是留下用户，挖掘更多的剩余价值。&lt;/span&gt;这也就是比心要做技能分享平台的原因。用户第一次付费都是在游戏品类中，但后续都会体验其他非游戏品类。通过数据表明，这样的做法不仅提高了用户留存也提升了ARPU值。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;谈到未来规划，林嵩认为，无论是游戏约玩业务还是其他约玩项目，都只是流量入口。在C端业务稳定后，将&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;会围绕千万级重度游戏玩家挖掘商业变现的机遇。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;事实上，从去年下半年开始，资本对游戏约玩类APP的关注度持续上升，投资逻辑可总结为：约玩作为直播之外另一个流量入口，人群更加硬核、付费意愿更高。除了约玩业务本身能产生现金流外，&lt;/span&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: 600; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;围绕约玩用户做流量变现会是约玩APP们的核心命题。&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, 微软雅黑, STHeitiSC-Light, simsun, 宋体, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; margin-top: 0px; margin-bottom: 26px; padding: 0px; vertical-align: baseline; word-break: break-word; overflow-wrap: break-word; color: rgb(38, 38, 38); text-align: justify; white-space: normal;\'&gt;&lt;span style=&quot;-webkit-font-smoothing: antialiased; border: 0px; box-sizing: border-box; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; vertical-align: baseline; word-break: break-word;&quot;&gt;除了本文提到的「比心」外，36氪报道的暴鸡电竞、捞月狗、开黑大师、电竞帮等APP也都在去年下半年分别获得新一轮融资。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('8', '0', '1', '1', '1', '1', '1', '0', '0', '247', '0', '0', '1554704551', '1554704551', '1554704537', '0', '新手帮助', '', '', '', '&lt;p&gt;新手帮助新手帮助新手帮助新手帮助新手帮助新手帮助新手帮助&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('9', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1554704620', '1554705332', '1554704580', '0', '关于我们', '', '', '', '&lt;p&gt;关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('10', '0', '1', '1', '1', '1', '1', '0', '0', '271', '0', '0', '1557192641', '1557192641', '1557192544', '0', '提现功能优化更新', '', '', '', '\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;亲爱的用户：&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;                                                                                 您好！&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;                                                                           为了给您提供更优质便捷的服务，平台已经在2019年5月1号正式对外开放陪玩提现功能。&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;                                                                           感谢您的信任与支持，我们将一如既往竭诚为您服务！&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;                                                                                                                                                                                 官方平台&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 20px; margin-bottom: 20px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;                                                                                                                                                                                  2019年5月1号&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('11', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1558425033', '1558425033', '1558424940', '0', '陪玩', '陪玩是什么？', '1234', '', '\n&lt;p&gt;xxx&lt;/p&gt;\n&lt;p&gt;XXX&lt;/p&gt;\n&lt;p&gt;XXX&lt;/p&gt;\n&lt;p&gt;XXXX&lt;/p&gt;\n', null, '{\"thumbnail\":\"default\\/20190520\\/3dd57c8106a6c8fb59865d46d7595184.jpg\"}');
INSERT INTO `cmf_portal_post` VALUES ('12', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1558967098', '1558967691', '1558967040', '0', '明星聚集地', '', '', '', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;default/20190527/5bec28dfc6b732d1f0c3a48a05d4c2f4.png&quot; title=&quot;淘约玩.png&quot; alt=&quot;淘约玩.png&quot;&gt;&lt;a name=&quot;1&quot;&gt;&lt;/a&gt;&lt;a href=&quot;http://baidu.COM&quot; target=&quot;_self&quot;&gt;&lt;img src=&quot;default/20190527/5fd470e10e4cb42f4797fec242f1e920.png&quot; title=&quot;img_1.png&quot; alt=&quot;img_1.png&quot;&gt;&lt;/a&gt;&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('13', '0', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '1558968072', '1558968072', '1558968042', '1558968096', '1', '', '', '', '&lt;p&gt;&lt;img src=&quot;default/20190527/5fd470e10e4cb42f4797fec242f1e920.png&quot; title=&quot;img_1.png&quot; alt=&quot;img_1.png&quot;&gt;&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\",\"photos\":[{\"url\":\"default\\/20190527\\/5fd470e10e4cb42f4797fec242f1e920.png\",\"name\":\"img_1.png\"}]}');
INSERT INTO `cmf_portal_post` VALUES ('15', '0', '1', '1', '1', '1', '1', '0', '0', '60', '0', '0', '1559889801', '1559889801', '1559889776', '0', '上传等级样例图', '', '', '', '\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;英雄联盟：&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/b94ae499c11575df47f92e6259d5f257.jpg&quot; title=&quot;example-1.jpg&quot; width=&quot;800&quot; alt=&quot;example-1.jpg&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;王者荣耀：&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/7194442dfb1ce0294cadb35ac656454c.jpg&quot; title=&quot;example-2.jpg&quot; alt=&quot;example-2.jpg&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;绝对求生：&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/086f30d2f6c619b845fc79cecb918304.jpg&quot; title=&quot;example-3.jpg&quot; width=&quot;800&quot; alt=&quot;example-3.jpg&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;刺激战场：&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/822f202ac958cb99dea0e8ce0cd444e7.jpg&quot; title=&quot;4.jpg&quot; width=&quot;800&quot; alt=&quot;4.jpg&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;COGO：&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/aa39e6585ea401476a2af376aa04cfb6.jpg&quot; title=&quot;5.jpg&quot; alt=&quot;5.jpg&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;人渣：&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/40ee3742f567430a9f126fa55753114c.png&quot; title=&quot;6.png&quot; alt=&quot;6.png&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;怪物猎人：&lt;br style=&quot;box-sizing: border-box;&quot;&gt;&lt;/p&gt;\n&lt;p style=\'box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: rgb(115, 115, 115); font-family: &quot;Microsoft YaHei&quot;, &quot;PingFang SC&quot;, sans-serif; font-size: 14px; white-space: normal;\'&gt;&lt;img src=&quot;http://www.taoyuewan.com/upload/default/20190607/40c8f094fab1df79879db1d3508dc186.png&quot; title=&quot;7.png&quot; alt=&quot;7.png&quot; style=&quot;box-sizing: border-box; border: 0px none; vertical-align: middle;&quot;&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('16', '0', '1', '1', '1', '1', '1', '0', '0', '243', '0', '0', '1560427385', '1560430334', '1560427320', '0', '陪玩师接单等级提升规则标准', '', '', '', '\n&lt;table class=&quot;table table-hover table-bordered table-list&quot; width=&quot;1109&quot; style=&quot;width: 672px;&quot;&gt;\n&lt;thead style=&quot;box-sizing: border-box;&quot;&gt;&lt;tr style=&quot;box-sizing: border-box;&quot; class=&quot;firstRow&quot;&gt;\n&lt;th style=&quot;box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857; vertical-align: bottom; border-top: 0px; border-bottom-width: 2px; border-bottom-color: rgb(236, 240, 241); border-right-color: rgb(236, 240, 241); border-left-color: rgb(236, 240, 241);&quot;&gt;等级序号&lt;/th&gt;\n&lt;th style=&quot;box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857; vertical-align: bottom; border-top: 0px; border-bottom-width: 2px; border-bottom-color: rgb(236, 240, 241); border-right-color: rgb(236, 240, 241); border-left-color: rgb(236, 240, 241);&quot;&gt;等级名称&lt;/th&gt;\n&lt;th style=&quot;box-sizing: border-box; padding: 8px; text-align: left; line-height: 1.42857; vertical-align: bottom; border-top: 0px; border-bottom-width: 2px; border-bottom-color: rgb(236, 240, 241); border-right-color: rgb(236, 240, 241); border-left-color: rgb(236, 240, 241);&quot;&gt;接单数&lt;/th&gt;\n&lt;/tr&gt;&lt;/thead&gt;\n&lt;tbody style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;1&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;0星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;0&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;2&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;1星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;10&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;3&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;2星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;50&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;4&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;3星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;70&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;5&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;4星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;85&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;6&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;5星&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;100&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;7&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;1钻&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;110&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;8&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;2钻&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;120&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;9&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;3钻&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;130&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box;&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;10&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;4钻&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;140&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr style=&quot;box-sizing: border-box; background-color: rgb(236, 240, 241);&quot;&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;11&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;5钻&lt;/td&gt;\n&lt;td style=&quot;box-sizing: border-box; padding: 8px; line-height: 1.42857; vertical-align: middle; border-color: rgb(236, 240, 241);&quot;&gt;1000&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/tbody&gt;\n&lt;/table&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('17', '0', '1', '1', '1', '1', '1', '0', '0', '250', '0', '0', '1560575812', '1577449868', '1560575760', '0', '开源之家源码论坛enboo.cn', '', 'PS玩家不服！《绝地求生》将被Xbox独占\r\n', 'PS玩家不服！《绝地求生》将被Xbox独占', '&lt;p&gt;开源之家源码论坛enboo.cn&lt;/p&gt;', null, '{\"thumbnail\":\"default\\/20190530\\/8d28cf858e41e85e538fc0251d074551.jpg\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('18', '0', '1', '1', '1', '1', '1', '0', '0', '13', '0', '0', '1571274289', '1571274326', '1571274180', '0', '靠打游戏赚钱的普通人：日赚百元的陪玩', '', '', '', '\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;打游戏赚钱，听起来是一桩美事，越来越多的年轻人把它当做是理想职业。&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;挡刀丸（化名）就是其中之一。他曾在某竞技游戏里排位全区前三，由此想过将兴趣转换为职业。他的目标是成为游戏主播，但在很长一段时间里，他只是一介帮厨。直到半年前，挡刀丸为目标跨出了实际的一步。那时他辞去工作，驱车前往异地，他的亲戚介绍了一份月入近万的工作，而且门槛低至会玩游戏就行。他觉得，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;这是个靠近理想职业的机会。&lt;/span&gt;&lt;/p&gt;\n&lt;h2 style=&quot;margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;日赚百元的游戏陪玩&lt;/h2&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;专职打金，月入千元，这等收入放在今日，似乎只够勉强糊口。而一位在二手交易平台上做游戏陪玩的女孩，告诉我，在今天靠打游戏赚个千来块钱，其实很轻松。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;女孩正在念大学，今年暑假期间，她在某鱼平台上拍卖起“陪玩”的单子，《王者荣耀》《和平精英》都接，5元钱一把。这份兼职让她既躲避了七八月份的阳光烈焰，又在家中坐收了上千元钱。她最后用这笔所得，买了心仪的衣物。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;比起上面这种“野路子”，更多人选择在专业的平台上，做起陪玩的生意。于今年6月份毕业的姜酱酱（化名），便是其中之一。&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;她表示，她从去年年底开始接触陪玩这份工作，目前收入水平是每月3000元左右。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;9月初的某个下午，在一个号称“超过1000万人使用”的陪玩App上，姜酱酱接到了葡萄君的订单。尽管这是一个「五子棋」名目的陪玩单子，但我所消费的30元钱，用在了一小时的聊天上。我们全程没有玩游戏。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;“我跟你这样讲吧，所有的五子棋其实都是聊天单。这不是我一个人这样，整个XX平台上的（五子棋单）都是聊天的。或者你想听歌，想看电影，也是可以一起的。当然，你要是就想下五子棋，我陪你一起下也是可以的。”&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;姜酱酱告诉葡萄君，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;游戏并不是陪玩的唯一媒介&lt;/span&gt;；另外，除了游戏技术外，个人的声音魅力和言谈能力，对于做好这份工作来说，也是相当重要。 &lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;聊天的话题，基本绕不开对方的工作。说完要领和心得，姜酱酱向我解释了做陪玩的缘由--在本地&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;找不到对口工作、人比较懒、来钱快&lt;/span&gt;，以及描述了她工作中的小目标：&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;日入100元以上。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;姜酱酱是以全职的状态投入到这份工作的，她在平台上开通了三个陪玩项目，有30元左右的聊天单，也有10元一局的游戏单，而她迄今为止的总订单数量接近700单。&lt;/p&gt;\n&lt;h2 style=&quot;margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;靠打游戏赚钱，真的是理想职业吗？&lt;/h2&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;时代不同了。就在今年4月，国家已经将电子竞技员和电子竞技运营师列为了正式职业。当时消息一出，有网友在微博上写下评论，“&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;目测小学生们的理想职业，将不再只是科学家&lt;/span&gt;”。这番言论的背后，似乎反映了，曾经偏离“主流价值”的一种兴趣，越发与现实意义接轨。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt; &lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;「玩游戏」很难再被定义成浪费生命的行为，而所谓的「无用论」更有些站不住脚。撇去所谓的天赋，人们多少都能靠打游戏赚得一份收入。葡萄君接触过靠代打游戏成就赚零花的高玩；也见过闲来没事帮人挂机谋利的学生；还有些人，整合了游戏存档和下载资源，在二手交易平台做起买卖。&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;但对于普通人来说，打游戏赚钱，真的是理想职业吗？至少在&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;那些我所接触的人的眼中，这件事总有它不靠谱的地方。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;挡刀丸坚持认为，除了主播和职业选手之外，其他人根本不可能靠打游戏赚大钱。他告诉我，其身边一位曾做过游戏工作室的同乡，两个月赚到3千块钱后，就抽身离开，去做其他营生了。他的判断在于，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;这点钱没人看得上。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;曹启辛似乎没有野心，他靠着“没人看得上”的打金回报，勉强维持了几年的生计。但他说，若不是个人问题，断然&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;不会去做这番“好Low”的事情。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;姜酱酱没告诉父母自己在做陪玩，她怕说出去会被“骂死”；天天抱着兴趣，开始了她的又一天兼职，但她同时觉得，做游戏陪玩不会是长久之计，哪一天觉得无聊了，就会停歇；八日月的大号因违规被平台封禁了，于是他在交流中向葡萄君感叹，随着竞争加剧，勾心斗角的人也多了，导致他的生意越来越不好做了。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我向业务趋于稳定的老温问道，他所接触的代练员，都是出于什么原因参与了这份工作。老温表示，他可以很负责任地说，做代练的“&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;兴趣占很大一部分；&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;但另外一部分原因，是他们不善于正常的交际。这是代练员的通病。&lt;/span&gt;”而这种通病，似乎让从业者没法得到更多的进步空间。&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;“&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;一个代练员，你游戏玩的再好，对我们来说是没有用的。&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;我们需要销售型人才，或者说管理型人才，或者说运营型的人才。&lt;/span&gt;然而恰恰是这些有能力的人，他宁可选择去卖车，也不会选择来淘宝（代练工作室）当一个客服。”&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;老温已经是这些人当中较为成功的人了，但他也这样告诉我：“在这个行业里，我不知道别人怎么样，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;反正我肯定是夹着尾巴做人&lt;/span&gt;。”&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;他说他倒不是在乎社会偏见，只是内心有些惶惶，觉着目前的&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;大环境还没好到让人心安的地步。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 21.25px; line-height: inherit; vertical-align: baseline; max-width: 100%; color: rgb(51, 51, 51); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;越来越多的人已经通过游戏既娱乐了身心，又赚到了钱财，但即便如此，这份“理想职业”，似乎还未完全照进现实。 &lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('19', '0', '1', '1', '1', '1', '1', '0', '0', '13', '0', '0', '1571711926', '1571711926', '1571711857', '0', '足不出户月入五位数，游戏陪玩真这么好赚', '', '', '', '\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;普通玩家打《王者荣耀》或LOL的时候，总有这样一个迷思：为什么对面总有大神带飞，而自家全是猪队友？&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;这不是玄学，也不是系统bug，更不是人品问题。因为对面的大神，可能是花钱雇的。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;今年4月，电子竞技得到了官方的正名。电竞行业迅速崛起并逐渐形成了相对完整的产业链，同时也衍生了许多下游服务行业。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;与游戏代练不同，陪玩师最重要的职能还是在于“陪”，因此专业陪玩师需要具备更高的综合素养。不仅技术要好，还要声音好听，会聊天等等，可以满足“老板”（陪玩师对客户的统称）更多的需求，&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;从这个角度，“陪玩师”可以说是个门槛更高的职业。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;虽然是个小众职业，但陪玩行业巨大的市场潜力依然得到了许多资本的青睐，近两年来，国内主流陪玩平台如暴鸡电竞、猪队友、捞月狗就获得了超过数千万融资。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;如果实力过硬或者其他方面特别突出，月入五位数并不难；但如果你不花心思推广自己，培养自己的核心竞争力，让更多人认识到你，很快就会被淘汰。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;所以，做一名专业的陪玩师，首先一定要找准自己的定位，不管是技术也好，还是声音也好，&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;你要知道自己的优势是什么，&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;这也是雯雯从业以来积累的宝贵经验。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;另外，哪怕你用心营业，业绩不好的时候，赚一两千也是常有的事，想要从事这行，必须要做好收入大起大落的心理准备。&lt;/span&gt;&lt;/p&gt;\n&lt;p style=\'border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;与电子竞技选手一样，陪玩师同属吃“青春饭”的职业。雯雯今年才24岁，但她说自己这个年纪在业内已经算大龄。&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-weight: 700; border: 0px; margin: 0px; padding: 0px;&quot;&gt;低龄化是陪玩行业的一个特征，因为这个行业非常消磨人的时间和精力，&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;border: 0px; margin: 0px; padding: 0px;&quot;&gt;随着年纪增长，还能保持灵活的头脑和手指，很难。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;br&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `cmf_portal_post` VALUES ('20', '0', '1', '1', '1', '1', '1', '0', '0', '19', '0', '0', '1571711971', '1571711971', '1571711939', '0', '美女游戏陪玩大火，实力颜值都在线', '', '', '', '\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;现在有一个行业很火，这个行业就是游戏陪玩，游戏陪玩现在是主播们最爱的行业，因为很多主播可以靠着点游戏陪玩来做节目效果，每次的效果都很好。&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;当然了，游戏陪玩也是有追求的，不要以为游戏陪玩一点技术都没有，游戏陪玩其实各方面都要兼顾，比如长相要好看，声音要好听，最重要的技术要好，还要会聊天，想要找到这么一个陪玩还真的不容易。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;虽然不容易找到，但是还是有的，比如现在就有一个美女游戏陪玩就大火了，这个游戏陪玩就是小渡渡，这个主播拥有上面所说的所有特点，她是一个王者荣耀的主播，在游戏里面很会制造话题，现在是多位知名主播的御用陪玩，比如孤影每次找陪玩就只找她。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;&lt;span style=\'color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; background-color: rgb(255, 255, 255);\'&gt;实力好、会聊天、长得漂亮、声音好听，这是多么难得啊，小渡渡简直就是被上天眷顾的人，现在他的陪玩道路也很通畅，感觉过不了多久可能会直接转行当主播了，对此你们有什么想说的吗？&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}');

-- ----------------------------
-- Table structure for cmf_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of cmf_portal_tag
-- ----------------------------
INSERT INTO `cmf_portal_tag` VALUES ('1', '1', '0', '0', '九八大叼K');
INSERT INTO `cmf_portal_tag` VALUES ('2', '1', '0', '0', '123');

-- ----------------------------
-- Table structure for cmf_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of cmf_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of cmf_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_region
-- ----------------------------
DROP TABLE IF EXISTS `cmf_region`;
CREATE TABLE `cmf_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id` (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3418 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_region
-- ----------------------------
INSERT INTO `cmf_region` VALUES ('1', '0', '中国', '0', '0');
INSERT INTO `cmf_region` VALUES ('2', '1', '北京', '1', '0');
INSERT INTO `cmf_region` VALUES ('3', '1', '安徽', '1', '0');
INSERT INTO `cmf_region` VALUES ('4', '1', '福建', '1', '0');
INSERT INTO `cmf_region` VALUES ('5', '1', '甘肃', '1', '0');
INSERT INTO `cmf_region` VALUES ('6', '1', '广东', '1', '0');
INSERT INTO `cmf_region` VALUES ('7', '1', '广西', '1', '0');
INSERT INTO `cmf_region` VALUES ('8', '1', '贵州', '1', '0');
INSERT INTO `cmf_region` VALUES ('9', '1', '海南', '1', '0');
INSERT INTO `cmf_region` VALUES ('10', '1', '河北', '1', '0');
INSERT INTO `cmf_region` VALUES ('11', '1', '河南', '1', '0');
INSERT INTO `cmf_region` VALUES ('12', '1', '黑龙江', '1', '0');
INSERT INTO `cmf_region` VALUES ('13', '1', '湖北', '1', '0');
INSERT INTO `cmf_region` VALUES ('14', '1', '湖南', '1', '0');
INSERT INTO `cmf_region` VALUES ('15', '1', '吉林', '1', '0');
INSERT INTO `cmf_region` VALUES ('16', '1', '江苏', '1', '0');
INSERT INTO `cmf_region` VALUES ('17', '1', '江西', '1', '0');
INSERT INTO `cmf_region` VALUES ('18', '1', '辽宁', '1', '0');
INSERT INTO `cmf_region` VALUES ('19', '1', '内蒙古', '1', '0');
INSERT INTO `cmf_region` VALUES ('20', '1', '宁夏', '1', '0');
INSERT INTO `cmf_region` VALUES ('21', '1', '青海', '1', '0');
INSERT INTO `cmf_region` VALUES ('22', '1', '山东', '1', '0');
INSERT INTO `cmf_region` VALUES ('23', '1', '山西', '1', '0');
INSERT INTO `cmf_region` VALUES ('24', '1', '陕西', '1', '0');
INSERT INTO `cmf_region` VALUES ('25', '1', '上海', '1', '0');
INSERT INTO `cmf_region` VALUES ('26', '1', '四川', '1', '0');
INSERT INTO `cmf_region` VALUES ('27', '1', '天津', '1', '0');
INSERT INTO `cmf_region` VALUES ('28', '1', '西藏', '1', '0');
INSERT INTO `cmf_region` VALUES ('29', '1', '新疆', '1', '0');
INSERT INTO `cmf_region` VALUES ('30', '1', '云南', '1', '0');
INSERT INTO `cmf_region` VALUES ('31', '1', '浙江', '1', '0');
INSERT INTO `cmf_region` VALUES ('32', '1', '重庆', '1', '0');
INSERT INTO `cmf_region` VALUES ('33', '1', '香港', '1', '0');
INSERT INTO `cmf_region` VALUES ('34', '1', '澳门', '1', '0');
INSERT INTO `cmf_region` VALUES ('35', '1', '台湾', '1', '0');
INSERT INTO `cmf_region` VALUES ('36', '3', '安庆', '2', '0');
INSERT INTO `cmf_region` VALUES ('37', '3', '蚌埠', '2', '0');
INSERT INTO `cmf_region` VALUES ('38', '3', '巢湖', '2', '0');
INSERT INTO `cmf_region` VALUES ('39', '3', '池州', '2', '0');
INSERT INTO `cmf_region` VALUES ('40', '3', '滁州', '2', '0');
INSERT INTO `cmf_region` VALUES ('41', '3', '阜阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('42', '3', '淮北', '2', '0');
INSERT INTO `cmf_region` VALUES ('43', '3', '淮南', '2', '0');
INSERT INTO `cmf_region` VALUES ('44', '3', '黄山', '2', '0');
INSERT INTO `cmf_region` VALUES ('45', '3', '六安', '2', '0');
INSERT INTO `cmf_region` VALUES ('46', '3', '马鞍山', '2', '0');
INSERT INTO `cmf_region` VALUES ('47', '3', '宿州', '2', '0');
INSERT INTO `cmf_region` VALUES ('48', '3', '铜陵', '2', '0');
INSERT INTO `cmf_region` VALUES ('49', '3', '芜湖', '2', '0');
INSERT INTO `cmf_region` VALUES ('50', '3', '宣城', '2', '0');
INSERT INTO `cmf_region` VALUES ('51', '3', '亳州', '2', '0');
INSERT INTO `cmf_region` VALUES ('52', '2', '北京', '2', '0');
INSERT INTO `cmf_region` VALUES ('53', '4', '福州', '2', '0');
INSERT INTO `cmf_region` VALUES ('54', '4', '龙岩', '2', '0');
INSERT INTO `cmf_region` VALUES ('55', '4', '南平', '2', '0');
INSERT INTO `cmf_region` VALUES ('56', '4', '宁德', '2', '0');
INSERT INTO `cmf_region` VALUES ('57', '4', '莆田', '2', '0');
INSERT INTO `cmf_region` VALUES ('58', '4', '泉州', '2', '0');
INSERT INTO `cmf_region` VALUES ('59', '4', '三明', '2', '0');
INSERT INTO `cmf_region` VALUES ('60', '4', '厦门', '2', '0');
INSERT INTO `cmf_region` VALUES ('61', '4', '漳州', '2', '0');
INSERT INTO `cmf_region` VALUES ('62', '5', '兰州', '2', '0');
INSERT INTO `cmf_region` VALUES ('63', '5', '白银', '2', '0');
INSERT INTO `cmf_region` VALUES ('64', '5', '定西', '2', '0');
INSERT INTO `cmf_region` VALUES ('65', '5', '甘南', '2', '0');
INSERT INTO `cmf_region` VALUES ('66', '5', '嘉峪关', '2', '0');
INSERT INTO `cmf_region` VALUES ('67', '5', '金昌', '2', '0');
INSERT INTO `cmf_region` VALUES ('68', '5', '酒泉', '2', '0');
INSERT INTO `cmf_region` VALUES ('69', '5', '临夏', '2', '0');
INSERT INTO `cmf_region` VALUES ('70', '5', '陇南', '2', '0');
INSERT INTO `cmf_region` VALUES ('71', '5', '平凉', '2', '0');
INSERT INTO `cmf_region` VALUES ('72', '5', '庆阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('73', '5', '天水', '2', '0');
INSERT INTO `cmf_region` VALUES ('74', '5', '武威', '2', '0');
INSERT INTO `cmf_region` VALUES ('75', '5', '张掖', '2', '0');
INSERT INTO `cmf_region` VALUES ('76', '6', '广州', '2', '0');
INSERT INTO `cmf_region` VALUES ('77', '6', '深圳', '2', '0');
INSERT INTO `cmf_region` VALUES ('78', '6', '潮州', '2', '0');
INSERT INTO `cmf_region` VALUES ('79', '6', '东莞', '2', '0');
INSERT INTO `cmf_region` VALUES ('80', '6', '佛山', '2', '0');
INSERT INTO `cmf_region` VALUES ('81', '6', '河源', '2', '0');
INSERT INTO `cmf_region` VALUES ('82', '6', '惠州', '2', '0');
INSERT INTO `cmf_region` VALUES ('83', '6', '江门', '2', '0');
INSERT INTO `cmf_region` VALUES ('84', '6', '揭阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('85', '6', '茂名', '2', '0');
INSERT INTO `cmf_region` VALUES ('86', '6', '梅州', '2', '0');
INSERT INTO `cmf_region` VALUES ('87', '6', '清远', '2', '0');
INSERT INTO `cmf_region` VALUES ('88', '6', '汕头', '2', '0');
INSERT INTO `cmf_region` VALUES ('89', '6', '汕尾', '2', '0');
INSERT INTO `cmf_region` VALUES ('90', '6', '韶关', '2', '0');
INSERT INTO `cmf_region` VALUES ('91', '6', '阳江', '2', '0');
INSERT INTO `cmf_region` VALUES ('92', '6', '云浮', '2', '0');
INSERT INTO `cmf_region` VALUES ('93', '6', '湛江', '2', '0');
INSERT INTO `cmf_region` VALUES ('94', '6', '肇庆', '2', '0');
INSERT INTO `cmf_region` VALUES ('95', '6', '中山', '2', '0');
INSERT INTO `cmf_region` VALUES ('96', '6', '珠海', '2', '0');
INSERT INTO `cmf_region` VALUES ('97', '7', '南宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('98', '7', '桂林', '2', '0');
INSERT INTO `cmf_region` VALUES ('99', '7', '百色', '2', '0');
INSERT INTO `cmf_region` VALUES ('100', '7', '北海', '2', '0');
INSERT INTO `cmf_region` VALUES ('101', '7', '崇左', '2', '0');
INSERT INTO `cmf_region` VALUES ('102', '7', '防城港', '2', '0');
INSERT INTO `cmf_region` VALUES ('103', '7', '贵港', '2', '0');
INSERT INTO `cmf_region` VALUES ('104', '7', '河池', '2', '0');
INSERT INTO `cmf_region` VALUES ('105', '7', '贺州', '2', '0');
INSERT INTO `cmf_region` VALUES ('106', '7', '来宾', '2', '0');
INSERT INTO `cmf_region` VALUES ('107', '7', '柳州', '2', '0');
INSERT INTO `cmf_region` VALUES ('108', '7', '钦州', '2', '0');
INSERT INTO `cmf_region` VALUES ('109', '7', '梧州', '2', '0');
INSERT INTO `cmf_region` VALUES ('110', '7', '玉林', '2', '0');
INSERT INTO `cmf_region` VALUES ('111', '8', '贵阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('112', '8', '安顺', '2', '0');
INSERT INTO `cmf_region` VALUES ('113', '8', '毕节', '2', '0');
INSERT INTO `cmf_region` VALUES ('114', '8', '六盘水', '2', '0');
INSERT INTO `cmf_region` VALUES ('115', '8', '黔东南', '2', '0');
INSERT INTO `cmf_region` VALUES ('116', '8', '黔南', '2', '0');
INSERT INTO `cmf_region` VALUES ('117', '8', '黔西南', '2', '0');
INSERT INTO `cmf_region` VALUES ('118', '8', '铜仁', '2', '0');
INSERT INTO `cmf_region` VALUES ('119', '8', '遵义', '2', '0');
INSERT INTO `cmf_region` VALUES ('120', '9', '海口', '2', '0');
INSERT INTO `cmf_region` VALUES ('121', '9', '三亚', '2', '0');
INSERT INTO `cmf_region` VALUES ('122', '9', '白沙', '2', '0');
INSERT INTO `cmf_region` VALUES ('123', '9', '保亭', '2', '0');
INSERT INTO `cmf_region` VALUES ('124', '9', '昌江', '2', '0');
INSERT INTO `cmf_region` VALUES ('125', '9', '澄迈县', '2', '0');
INSERT INTO `cmf_region` VALUES ('126', '9', '定安县', '2', '0');
INSERT INTO `cmf_region` VALUES ('127', '9', '东方', '2', '0');
INSERT INTO `cmf_region` VALUES ('128', '9', '乐东', '2', '0');
INSERT INTO `cmf_region` VALUES ('129', '9', '临高县', '2', '0');
INSERT INTO `cmf_region` VALUES ('130', '9', '陵水', '2', '0');
INSERT INTO `cmf_region` VALUES ('131', '9', '琼海', '2', '0');
INSERT INTO `cmf_region` VALUES ('132', '9', '琼中', '2', '0');
INSERT INTO `cmf_region` VALUES ('133', '9', '屯昌县', '2', '0');
INSERT INTO `cmf_region` VALUES ('134', '9', '万宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('135', '9', '文昌', '2', '0');
INSERT INTO `cmf_region` VALUES ('136', '9', '五指山', '2', '0');
INSERT INTO `cmf_region` VALUES ('137', '9', '儋州', '2', '0');
INSERT INTO `cmf_region` VALUES ('138', '10', '石家庄', '2', '0');
INSERT INTO `cmf_region` VALUES ('139', '10', '保定', '2', '0');
INSERT INTO `cmf_region` VALUES ('140', '10', '沧州', '2', '0');
INSERT INTO `cmf_region` VALUES ('141', '10', '承德', '2', '0');
INSERT INTO `cmf_region` VALUES ('142', '10', '邯郸', '2', '0');
INSERT INTO `cmf_region` VALUES ('143', '10', '衡水', '2', '0');
INSERT INTO `cmf_region` VALUES ('144', '10', '廊坊', '2', '0');
INSERT INTO `cmf_region` VALUES ('145', '10', '秦皇岛', '2', '0');
INSERT INTO `cmf_region` VALUES ('146', '10', '唐山', '2', '0');
INSERT INTO `cmf_region` VALUES ('147', '10', '邢台', '2', '0');
INSERT INTO `cmf_region` VALUES ('148', '10', '张家口', '2', '0');
INSERT INTO `cmf_region` VALUES ('149', '11', '郑州', '2', '0');
INSERT INTO `cmf_region` VALUES ('150', '11', '洛阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('151', '11', '开封', '2', '0');
INSERT INTO `cmf_region` VALUES ('152', '11', '安阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('153', '11', '鹤壁', '2', '0');
INSERT INTO `cmf_region` VALUES ('154', '11', '济源', '2', '0');
INSERT INTO `cmf_region` VALUES ('155', '11', '焦作', '2', '0');
INSERT INTO `cmf_region` VALUES ('156', '11', '南阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('157', '11', '平顶山', '2', '0');
INSERT INTO `cmf_region` VALUES ('158', '11', '三门峡', '2', '0');
INSERT INTO `cmf_region` VALUES ('159', '11', '商丘', '2', '0');
INSERT INTO `cmf_region` VALUES ('160', '11', '新乡', '2', '0');
INSERT INTO `cmf_region` VALUES ('161', '11', '信阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('162', '11', '许昌', '2', '0');
INSERT INTO `cmf_region` VALUES ('163', '11', '周口', '2', '0');
INSERT INTO `cmf_region` VALUES ('164', '11', '驻马店', '2', '0');
INSERT INTO `cmf_region` VALUES ('165', '11', '漯河', '2', '0');
INSERT INTO `cmf_region` VALUES ('166', '11', '濮阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('167', '12', '哈尔滨', '2', '0');
INSERT INTO `cmf_region` VALUES ('168', '12', '大庆', '2', '0');
INSERT INTO `cmf_region` VALUES ('169', '12', '大兴安岭', '2', '0');
INSERT INTO `cmf_region` VALUES ('170', '12', '鹤岗', '2', '0');
INSERT INTO `cmf_region` VALUES ('171', '12', '黑河', '2', '0');
INSERT INTO `cmf_region` VALUES ('172', '12', '鸡西', '2', '0');
INSERT INTO `cmf_region` VALUES ('173', '12', '佳木斯', '2', '0');
INSERT INTO `cmf_region` VALUES ('174', '12', '牡丹江', '2', '0');
INSERT INTO `cmf_region` VALUES ('175', '12', '七台河', '2', '0');
INSERT INTO `cmf_region` VALUES ('176', '12', '齐齐哈尔', '2', '0');
INSERT INTO `cmf_region` VALUES ('177', '12', '双鸭山', '2', '0');
INSERT INTO `cmf_region` VALUES ('178', '12', '绥化', '2', '0');
INSERT INTO `cmf_region` VALUES ('179', '12', '伊春', '2', '0');
INSERT INTO `cmf_region` VALUES ('180', '13', '武汉', '2', '0');
INSERT INTO `cmf_region` VALUES ('181', '13', '仙桃', '2', '0');
INSERT INTO `cmf_region` VALUES ('182', '13', '鄂州', '2', '0');
INSERT INTO `cmf_region` VALUES ('183', '13', '黄冈', '2', '0');
INSERT INTO `cmf_region` VALUES ('184', '13', '黄石', '2', '0');
INSERT INTO `cmf_region` VALUES ('185', '13', '荆门', '2', '0');
INSERT INTO `cmf_region` VALUES ('186', '13', '荆州', '2', '0');
INSERT INTO `cmf_region` VALUES ('187', '13', '潜江', '2', '0');
INSERT INTO `cmf_region` VALUES ('188', '13', '神农架林区', '2', '0');
INSERT INTO `cmf_region` VALUES ('189', '13', '十堰', '2', '0');
INSERT INTO `cmf_region` VALUES ('190', '13', '随州', '2', '0');
INSERT INTO `cmf_region` VALUES ('191', '13', '天门', '2', '0');
INSERT INTO `cmf_region` VALUES ('192', '13', '咸宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('193', '13', '襄樊', '2', '0');
INSERT INTO `cmf_region` VALUES ('194', '13', '孝感', '2', '0');
INSERT INTO `cmf_region` VALUES ('195', '13', '宜昌', '2', '0');
INSERT INTO `cmf_region` VALUES ('196', '13', '恩施', '2', '0');
INSERT INTO `cmf_region` VALUES ('197', '14', '长沙', '2', '0');
INSERT INTO `cmf_region` VALUES ('198', '14', '张家界', '2', '0');
INSERT INTO `cmf_region` VALUES ('199', '14', '常德', '2', '0');
INSERT INTO `cmf_region` VALUES ('200', '14', '郴州', '2', '0');
INSERT INTO `cmf_region` VALUES ('201', '14', '衡阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('202', '14', '怀化', '2', '0');
INSERT INTO `cmf_region` VALUES ('203', '14', '娄底', '2', '0');
INSERT INTO `cmf_region` VALUES ('204', '14', '邵阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('205', '14', '湘潭', '2', '0');
INSERT INTO `cmf_region` VALUES ('206', '14', '湘西', '2', '0');
INSERT INTO `cmf_region` VALUES ('207', '14', '益阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('208', '14', '永州', '2', '0');
INSERT INTO `cmf_region` VALUES ('209', '14', '岳阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('210', '14', '株洲', '2', '0');
INSERT INTO `cmf_region` VALUES ('211', '15', '长春', '2', '0');
INSERT INTO `cmf_region` VALUES ('212', '15', '吉林', '2', '0');
INSERT INTO `cmf_region` VALUES ('213', '15', '白城', '2', '0');
INSERT INTO `cmf_region` VALUES ('214', '15', '白山', '2', '0');
INSERT INTO `cmf_region` VALUES ('215', '15', '辽源', '2', '0');
INSERT INTO `cmf_region` VALUES ('216', '15', '四平', '2', '0');
INSERT INTO `cmf_region` VALUES ('217', '15', '松原', '2', '0');
INSERT INTO `cmf_region` VALUES ('218', '15', '通化', '2', '0');
INSERT INTO `cmf_region` VALUES ('219', '15', '延边', '2', '0');
INSERT INTO `cmf_region` VALUES ('220', '16', '南京', '2', '0');
INSERT INTO `cmf_region` VALUES ('221', '16', '苏州', '2', '0');
INSERT INTO `cmf_region` VALUES ('222', '16', '无锡', '2', '0');
INSERT INTO `cmf_region` VALUES ('223', '16', '常州', '2', '0');
INSERT INTO `cmf_region` VALUES ('224', '16', '淮安', '2', '0');
INSERT INTO `cmf_region` VALUES ('225', '16', '连云港', '2', '0');
INSERT INTO `cmf_region` VALUES ('226', '16', '南通', '2', '0');
INSERT INTO `cmf_region` VALUES ('227', '16', '宿迁', '2', '0');
INSERT INTO `cmf_region` VALUES ('228', '16', '泰州', '2', '0');
INSERT INTO `cmf_region` VALUES ('229', '16', '徐州', '2', '0');
INSERT INTO `cmf_region` VALUES ('230', '16', '盐城', '2', '0');
INSERT INTO `cmf_region` VALUES ('231', '16', '扬州', '2', '0');
INSERT INTO `cmf_region` VALUES ('232', '16', '镇江', '2', '0');
INSERT INTO `cmf_region` VALUES ('233', '17', '南昌', '2', '0');
INSERT INTO `cmf_region` VALUES ('234', '17', '抚州', '2', '0');
INSERT INTO `cmf_region` VALUES ('235', '17', '赣州', '2', '0');
INSERT INTO `cmf_region` VALUES ('236', '17', '吉安', '2', '0');
INSERT INTO `cmf_region` VALUES ('237', '17', '景德镇', '2', '0');
INSERT INTO `cmf_region` VALUES ('238', '17', '九江', '2', '0');
INSERT INTO `cmf_region` VALUES ('239', '17', '萍乡', '2', '0');
INSERT INTO `cmf_region` VALUES ('240', '17', '上饶', '2', '0');
INSERT INTO `cmf_region` VALUES ('241', '17', '新余', '2', '0');
INSERT INTO `cmf_region` VALUES ('242', '17', '宜春', '2', '0');
INSERT INTO `cmf_region` VALUES ('243', '17', '鹰潭', '2', '0');
INSERT INTO `cmf_region` VALUES ('244', '18', '沈阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('245', '18', '大连', '2', '0');
INSERT INTO `cmf_region` VALUES ('246', '18', '鞍山', '2', '0');
INSERT INTO `cmf_region` VALUES ('247', '18', '本溪', '2', '0');
INSERT INTO `cmf_region` VALUES ('248', '18', '朝阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('249', '18', '丹东', '2', '0');
INSERT INTO `cmf_region` VALUES ('250', '18', '抚顺', '2', '0');
INSERT INTO `cmf_region` VALUES ('251', '18', '阜新', '2', '0');
INSERT INTO `cmf_region` VALUES ('252', '18', '葫芦岛', '2', '0');
INSERT INTO `cmf_region` VALUES ('253', '18', '锦州', '2', '0');
INSERT INTO `cmf_region` VALUES ('254', '18', '辽阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('255', '18', '盘锦', '2', '0');
INSERT INTO `cmf_region` VALUES ('256', '18', '铁岭', '2', '0');
INSERT INTO `cmf_region` VALUES ('257', '18', '营口', '2', '0');
INSERT INTO `cmf_region` VALUES ('258', '19', '呼和浩特', '2', '0');
INSERT INTO `cmf_region` VALUES ('259', '19', '阿拉善盟', '2', '0');
INSERT INTO `cmf_region` VALUES ('260', '19', '巴彦淖尔盟', '2', '0');
INSERT INTO `cmf_region` VALUES ('261', '19', '包头', '2', '0');
INSERT INTO `cmf_region` VALUES ('262', '19', '赤峰', '2', '0');
INSERT INTO `cmf_region` VALUES ('263', '19', '鄂尔多斯', '2', '0');
INSERT INTO `cmf_region` VALUES ('264', '19', '呼伦贝尔', '2', '0');
INSERT INTO `cmf_region` VALUES ('265', '19', '通辽', '2', '0');
INSERT INTO `cmf_region` VALUES ('266', '19', '乌海', '2', '0');
INSERT INTO `cmf_region` VALUES ('267', '19', '乌兰察布市', '2', '0');
INSERT INTO `cmf_region` VALUES ('268', '19', '锡林郭勒盟', '2', '0');
INSERT INTO `cmf_region` VALUES ('269', '19', '兴安盟', '2', '0');
INSERT INTO `cmf_region` VALUES ('270', '20', '银川', '2', '0');
INSERT INTO `cmf_region` VALUES ('271', '20', '固原', '2', '0');
INSERT INTO `cmf_region` VALUES ('272', '20', '石嘴山', '2', '0');
INSERT INTO `cmf_region` VALUES ('273', '20', '吴忠', '2', '0');
INSERT INTO `cmf_region` VALUES ('274', '20', '中卫', '2', '0');
INSERT INTO `cmf_region` VALUES ('275', '21', '西宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('276', '21', '果洛', '2', '0');
INSERT INTO `cmf_region` VALUES ('277', '21', '海北', '2', '0');
INSERT INTO `cmf_region` VALUES ('278', '21', '海东', '2', '0');
INSERT INTO `cmf_region` VALUES ('279', '21', '海南', '2', '0');
INSERT INTO `cmf_region` VALUES ('280', '21', '海西', '2', '0');
INSERT INTO `cmf_region` VALUES ('281', '21', '黄南', '2', '0');
INSERT INTO `cmf_region` VALUES ('282', '21', '玉树', '2', '0');
INSERT INTO `cmf_region` VALUES ('283', '22', '济南', '2', '0');
INSERT INTO `cmf_region` VALUES ('284', '22', '青岛', '2', '0');
INSERT INTO `cmf_region` VALUES ('285', '22', '滨州', '2', '0');
INSERT INTO `cmf_region` VALUES ('286', '22', '德州', '2', '0');
INSERT INTO `cmf_region` VALUES ('287', '22', '东营', '2', '0');
INSERT INTO `cmf_region` VALUES ('288', '22', '菏泽', '2', '0');
INSERT INTO `cmf_region` VALUES ('289', '22', '济宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('290', '22', '莱芜', '2', '0');
INSERT INTO `cmf_region` VALUES ('291', '22', '聊城', '2', '0');
INSERT INTO `cmf_region` VALUES ('292', '22', '临沂', '2', '0');
INSERT INTO `cmf_region` VALUES ('293', '22', '日照', '2', '0');
INSERT INTO `cmf_region` VALUES ('294', '22', '泰安', '2', '0');
INSERT INTO `cmf_region` VALUES ('295', '22', '威海', '2', '0');
INSERT INTO `cmf_region` VALUES ('296', '22', '潍坊', '2', '0');
INSERT INTO `cmf_region` VALUES ('297', '22', '烟台', '2', '0');
INSERT INTO `cmf_region` VALUES ('298', '22', '枣庄', '2', '0');
INSERT INTO `cmf_region` VALUES ('299', '22', '淄博', '2', '0');
INSERT INTO `cmf_region` VALUES ('300', '23', '太原', '2', '0');
INSERT INTO `cmf_region` VALUES ('301', '23', '长治', '2', '0');
INSERT INTO `cmf_region` VALUES ('302', '23', '大同', '2', '0');
INSERT INTO `cmf_region` VALUES ('303', '23', '晋城', '2', '0');
INSERT INTO `cmf_region` VALUES ('304', '23', '晋中', '2', '0');
INSERT INTO `cmf_region` VALUES ('305', '23', '临汾', '2', '0');
INSERT INTO `cmf_region` VALUES ('306', '23', '吕梁', '2', '0');
INSERT INTO `cmf_region` VALUES ('307', '23', '朔州', '2', '0');
INSERT INTO `cmf_region` VALUES ('308', '23', '忻州', '2', '0');
INSERT INTO `cmf_region` VALUES ('309', '23', '阳泉', '2', '0');
INSERT INTO `cmf_region` VALUES ('310', '23', '运城', '2', '0');
INSERT INTO `cmf_region` VALUES ('311', '24', '西安', '2', '0');
INSERT INTO `cmf_region` VALUES ('312', '24', '安康', '2', '0');
INSERT INTO `cmf_region` VALUES ('313', '24', '宝鸡', '2', '0');
INSERT INTO `cmf_region` VALUES ('314', '24', '汉中', '2', '0');
INSERT INTO `cmf_region` VALUES ('315', '24', '商洛', '2', '0');
INSERT INTO `cmf_region` VALUES ('316', '24', '铜川', '2', '0');
INSERT INTO `cmf_region` VALUES ('317', '24', '渭南', '2', '0');
INSERT INTO `cmf_region` VALUES ('318', '24', '咸阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('319', '24', '延安', '2', '0');
INSERT INTO `cmf_region` VALUES ('320', '24', '榆林', '2', '0');
INSERT INTO `cmf_region` VALUES ('321', '25', '上海', '2', '0');
INSERT INTO `cmf_region` VALUES ('322', '26', '成都', '2', '0');
INSERT INTO `cmf_region` VALUES ('323', '26', '绵阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('324', '26', '阿坝', '2', '0');
INSERT INTO `cmf_region` VALUES ('325', '26', '巴中', '2', '0');
INSERT INTO `cmf_region` VALUES ('326', '26', '达州', '2', '0');
INSERT INTO `cmf_region` VALUES ('327', '26', '德阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('328', '26', '甘孜', '2', '0');
INSERT INTO `cmf_region` VALUES ('329', '26', '广安', '2', '0');
INSERT INTO `cmf_region` VALUES ('330', '26', '广元', '2', '0');
INSERT INTO `cmf_region` VALUES ('331', '26', '乐山', '2', '0');
INSERT INTO `cmf_region` VALUES ('332', '26', '凉山', '2', '0');
INSERT INTO `cmf_region` VALUES ('333', '26', '眉山', '2', '0');
INSERT INTO `cmf_region` VALUES ('334', '26', '南充', '2', '0');
INSERT INTO `cmf_region` VALUES ('335', '26', '内江', '2', '0');
INSERT INTO `cmf_region` VALUES ('336', '26', '攀枝花', '2', '0');
INSERT INTO `cmf_region` VALUES ('337', '26', '遂宁', '2', '0');
INSERT INTO `cmf_region` VALUES ('338', '26', '雅安', '2', '0');
INSERT INTO `cmf_region` VALUES ('339', '26', '宜宾', '2', '0');
INSERT INTO `cmf_region` VALUES ('340', '26', '资阳', '2', '0');
INSERT INTO `cmf_region` VALUES ('341', '26', '自贡', '2', '0');
INSERT INTO `cmf_region` VALUES ('342', '26', '泸州', '2', '0');
INSERT INTO `cmf_region` VALUES ('343', '27', '天津', '2', '0');
INSERT INTO `cmf_region` VALUES ('344', '28', '拉萨', '2', '0');
INSERT INTO `cmf_region` VALUES ('345', '28', '阿里', '2', '0');
INSERT INTO `cmf_region` VALUES ('346', '28', '昌都', '2', '0');
INSERT INTO `cmf_region` VALUES ('347', '28', '林芝', '2', '0');
INSERT INTO `cmf_region` VALUES ('348', '28', '那曲', '2', '0');
INSERT INTO `cmf_region` VALUES ('349', '28', '日喀则', '2', '0');
INSERT INTO `cmf_region` VALUES ('350', '28', '山南', '2', '0');
INSERT INTO `cmf_region` VALUES ('351', '29', '乌鲁木齐', '2', '0');
INSERT INTO `cmf_region` VALUES ('352', '29', '阿克苏', '2', '0');
INSERT INTO `cmf_region` VALUES ('353', '29', '阿拉尔', '2', '0');
INSERT INTO `cmf_region` VALUES ('354', '29', '巴音郭楞', '2', '0');
INSERT INTO `cmf_region` VALUES ('355', '29', '博尔塔拉', '2', '0');
INSERT INTO `cmf_region` VALUES ('356', '29', '昌吉', '2', '0');
INSERT INTO `cmf_region` VALUES ('357', '29', '哈密', '2', '0');
INSERT INTO `cmf_region` VALUES ('358', '29', '和田', '2', '0');
INSERT INTO `cmf_region` VALUES ('359', '29', '喀什', '2', '0');
INSERT INTO `cmf_region` VALUES ('360', '29', '克拉玛依', '2', '0');
INSERT INTO `cmf_region` VALUES ('361', '29', '克孜勒苏', '2', '0');
INSERT INTO `cmf_region` VALUES ('362', '29', '石河子', '2', '0');
INSERT INTO `cmf_region` VALUES ('363', '29', '图木舒克', '2', '0');
INSERT INTO `cmf_region` VALUES ('364', '29', '吐鲁番', '2', '0');
INSERT INTO `cmf_region` VALUES ('365', '29', '五家渠', '2', '0');
INSERT INTO `cmf_region` VALUES ('366', '29', '伊犁', '2', '0');
INSERT INTO `cmf_region` VALUES ('367', '30', '昆明', '2', '0');
INSERT INTO `cmf_region` VALUES ('368', '30', '怒江', '2', '0');
INSERT INTO `cmf_region` VALUES ('369', '30', '普洱', '2', '0');
INSERT INTO `cmf_region` VALUES ('370', '30', '丽江', '2', '0');
INSERT INTO `cmf_region` VALUES ('371', '30', '保山', '2', '0');
INSERT INTO `cmf_region` VALUES ('372', '30', '楚雄', '2', '0');
INSERT INTO `cmf_region` VALUES ('373', '30', '大理', '2', '0');
INSERT INTO `cmf_region` VALUES ('374', '30', '德宏', '2', '0');
INSERT INTO `cmf_region` VALUES ('375', '30', '迪庆', '2', '0');
INSERT INTO `cmf_region` VALUES ('376', '30', '红河', '2', '0');
INSERT INTO `cmf_region` VALUES ('377', '30', '临沧', '2', '0');
INSERT INTO `cmf_region` VALUES ('378', '30', '曲靖', '2', '0');
INSERT INTO `cmf_region` VALUES ('379', '30', '文山', '2', '0');
INSERT INTO `cmf_region` VALUES ('380', '30', '西双版纳', '2', '0');
INSERT INTO `cmf_region` VALUES ('381', '30', '玉溪', '2', '0');
INSERT INTO `cmf_region` VALUES ('382', '30', '昭通', '2', '0');
INSERT INTO `cmf_region` VALUES ('383', '31', '杭州', '2', '0');
INSERT INTO `cmf_region` VALUES ('384', '31', '湖州', '2', '0');
INSERT INTO `cmf_region` VALUES ('385', '31', '嘉兴', '2', '0');
INSERT INTO `cmf_region` VALUES ('386', '31', '金华', '2', '0');
INSERT INTO `cmf_region` VALUES ('387', '31', '丽水', '2', '0');
INSERT INTO `cmf_region` VALUES ('388', '31', '宁波', '2', '0');
INSERT INTO `cmf_region` VALUES ('389', '31', '绍兴', '2', '0');
INSERT INTO `cmf_region` VALUES ('390', '31', '台州', '2', '0');
INSERT INTO `cmf_region` VALUES ('391', '31', '温州', '2', '0');
INSERT INTO `cmf_region` VALUES ('392', '31', '舟山', '2', '0');
INSERT INTO `cmf_region` VALUES ('393', '31', '衢州', '2', '0');
INSERT INTO `cmf_region` VALUES ('394', '32', '重庆', '2', '0');
INSERT INTO `cmf_region` VALUES ('395', '33', '香港', '2', '0');
INSERT INTO `cmf_region` VALUES ('396', '34', '澳门', '2', '0');
INSERT INTO `cmf_region` VALUES ('397', '35', '台湾', '2', '0');
INSERT INTO `cmf_region` VALUES ('398', '36', '迎江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('399', '36', '大观区', '3', '0');
INSERT INTO `cmf_region` VALUES ('400', '36', '宜秀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('401', '36', '桐城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('402', '36', '怀宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('403', '36', '枞阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('404', '36', '潜山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('405', '36', '太湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('406', '36', '宿松县', '3', '0');
INSERT INTO `cmf_region` VALUES ('407', '36', '望江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('408', '36', '岳西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('409', '37', '中市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('410', '37', '东市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('411', '37', '西市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('412', '37', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('413', '37', '怀远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('414', '37', '五河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('415', '37', '固镇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('416', '38', '居巢区', '3', '0');
INSERT INTO `cmf_region` VALUES ('417', '38', '庐江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('418', '38', '无为县', '3', '0');
INSERT INTO `cmf_region` VALUES ('419', '38', '含山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('420', '38', '和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('421', '39', '贵池区', '3', '0');
INSERT INTO `cmf_region` VALUES ('422', '39', '东至县', '3', '0');
INSERT INTO `cmf_region` VALUES ('423', '39', '石台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('424', '39', '青阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('425', '40', '琅琊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('426', '40', '南谯区', '3', '0');
INSERT INTO `cmf_region` VALUES ('427', '40', '天长市', '3', '0');
INSERT INTO `cmf_region` VALUES ('428', '40', '明光市', '3', '0');
INSERT INTO `cmf_region` VALUES ('429', '40', '来安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('430', '40', '全椒县', '3', '0');
INSERT INTO `cmf_region` VALUES ('431', '40', '定远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('432', '40', '凤阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('433', '41', '蚌山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('434', '41', '龙子湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('435', '41', '禹会区', '3', '0');
INSERT INTO `cmf_region` VALUES ('436', '41', '淮上区', '3', '0');
INSERT INTO `cmf_region` VALUES ('437', '41', '颍州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('438', '41', '颍东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('439', '41', '颍泉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('440', '41', '界首市', '3', '0');
INSERT INTO `cmf_region` VALUES ('441', '41', '临泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('442', '41', '太和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('443', '41', '阜南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('444', '41', '颖上县', '3', '0');
INSERT INTO `cmf_region` VALUES ('445', '42', '相山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('446', '42', '杜集区', '3', '0');
INSERT INTO `cmf_region` VALUES ('447', '42', '烈山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('448', '42', '濉溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('449', '43', '田家庵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('450', '43', '大通区', '3', '0');
INSERT INTO `cmf_region` VALUES ('451', '43', '谢家集区', '3', '0');
INSERT INTO `cmf_region` VALUES ('452', '43', '八公山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('453', '43', '潘集区', '3', '0');
INSERT INTO `cmf_region` VALUES ('454', '43', '凤台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('455', '44', '屯溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('456', '44', '黄山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('457', '44', '徽州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('458', '44', '歙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('459', '44', '休宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('460', '44', '黟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('461', '44', '祁门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('462', '45', '金安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('463', '45', '裕安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('464', '45', '寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('465', '45', '霍邱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('466', '45', '舒城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('467', '45', '金寨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('468', '45', '霍山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('469', '46', '雨山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('470', '46', '花山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('471', '46', '金家庄区', '3', '0');
INSERT INTO `cmf_region` VALUES ('472', '46', '当涂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('474', '47', '砀山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('475', '47', '萧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('476', '47', '灵璧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('477', '47', '泗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('478', '48', '铜官山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('479', '48', '狮子山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('480', '48', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('481', '48', '铜陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('482', '49', '镜湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('483', '49', '弋江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('484', '49', '鸠江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('485', '49', '三山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('486', '49', '芜湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('487', '49', '繁昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('488', '49', '南陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('489', '50', '宣州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('490', '50', '宁国市', '3', '0');
INSERT INTO `cmf_region` VALUES ('491', '50', '郎溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('492', '50', '广德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('493', '50', '泾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('494', '50', '绩溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('495', '50', '旌德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('496', '51', '涡阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('497', '51', '蒙城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('498', '51', '利辛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('499', '51', '谯城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('500', '52', '东城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('501', '52', '西城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('502', '52', '海淀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('503', '52', '朝阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('504', '52', '崇文区', '3', '0');
INSERT INTO `cmf_region` VALUES ('505', '52', '宣武区', '3', '0');
INSERT INTO `cmf_region` VALUES ('506', '52', '丰台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('507', '52', '石景山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('508', '52', '房山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('509', '52', '门头沟区', '3', '0');
INSERT INTO `cmf_region` VALUES ('510', '52', '通州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('511', '52', '顺义区', '3', '0');
INSERT INTO `cmf_region` VALUES ('512', '52', '昌平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('513', '52', '怀柔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('514', '52', '平谷区', '3', '0');
INSERT INTO `cmf_region` VALUES ('515', '52', '大兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('516', '52', '密云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('517', '52', '延庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('518', '53', '鼓楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('519', '53', '台江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('520', '53', '仓山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('521', '53', '马尾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('522', '53', '晋安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('523', '53', '福清市', '3', '0');
INSERT INTO `cmf_region` VALUES ('524', '53', '长乐市', '3', '0');
INSERT INTO `cmf_region` VALUES ('525', '53', '闽侯县', '3', '0');
INSERT INTO `cmf_region` VALUES ('526', '53', '连江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('527', '53', '罗源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('528', '53', '闽清县', '3', '0');
INSERT INTO `cmf_region` VALUES ('529', '53', '永泰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('530', '53', '平潭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('531', '54', '新罗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('532', '54', '漳平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('533', '54', '长汀县', '3', '0');
INSERT INTO `cmf_region` VALUES ('534', '54', '永定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('535', '54', '上杭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('536', '54', '武平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('537', '54', '连城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('538', '55', '延平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('539', '55', '邵武市', '3', '0');
INSERT INTO `cmf_region` VALUES ('540', '55', '武夷山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('541', '55', '建瓯市', '3', '0');
INSERT INTO `cmf_region` VALUES ('542', '55', '建阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('543', '55', '顺昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('544', '55', '浦城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('545', '55', '光泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('546', '55', '松溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('547', '55', '政和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('548', '56', '蕉城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('549', '56', '福安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('550', '56', '福鼎市', '3', '0');
INSERT INTO `cmf_region` VALUES ('551', '56', '霞浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('552', '56', '古田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('553', '56', '屏南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('554', '56', '寿宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('555', '56', '周宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('556', '56', '柘荣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('557', '57', '城厢区', '3', '0');
INSERT INTO `cmf_region` VALUES ('558', '57', '涵江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('559', '57', '荔城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('560', '57', '秀屿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('561', '57', '仙游县', '3', '0');
INSERT INTO `cmf_region` VALUES ('562', '58', '鲤城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('563', '58', '丰泽区', '3', '0');
INSERT INTO `cmf_region` VALUES ('564', '58', '洛江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('566', '58', '泉港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('567', '58', '石狮市', '3', '0');
INSERT INTO `cmf_region` VALUES ('568', '58', '晋江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('569', '58', '南安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('570', '58', '惠安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('571', '58', '安溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('572', '58', '永春县', '3', '0');
INSERT INTO `cmf_region` VALUES ('573', '58', '德化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('574', '58', '金门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('575', '59', '梅列区', '3', '0');
INSERT INTO `cmf_region` VALUES ('576', '59', '三元区', '3', '0');
INSERT INTO `cmf_region` VALUES ('577', '59', '永安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('578', '59', '明溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('579', '59', '清流县', '3', '0');
INSERT INTO `cmf_region` VALUES ('580', '59', '宁化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('581', '59', '大田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('582', '59', '尤溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('583', '59', '沙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('584', '59', '将乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('585', '59', '泰宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('586', '59', '建宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('587', '60', '思明区', '3', '0');
INSERT INTO `cmf_region` VALUES ('588', '60', '海沧区', '3', '0');
INSERT INTO `cmf_region` VALUES ('589', '60', '湖里区', '3', '0');
INSERT INTO `cmf_region` VALUES ('590', '60', '集美区', '3', '0');
INSERT INTO `cmf_region` VALUES ('591', '60', '同安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('592', '60', '翔安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('593', '61', '芗城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('594', '61', '龙文区', '3', '0');
INSERT INTO `cmf_region` VALUES ('595', '61', '龙海市', '3', '0');
INSERT INTO `cmf_region` VALUES ('596', '61', '云霄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('597', '61', '漳浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('598', '61', '诏安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('599', '61', '长泰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('600', '61', '东山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('601', '61', '南靖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('602', '61', '平和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('603', '61', '华安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('604', '62', '皋兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('605', '62', '城关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('606', '62', '七里河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('607', '62', '西固区', '3', '0');
INSERT INTO `cmf_region` VALUES ('608', '62', '安宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('609', '62', '红古区', '3', '0');
INSERT INTO `cmf_region` VALUES ('610', '62', '永登县', '3', '0');
INSERT INTO `cmf_region` VALUES ('611', '62', '榆中县', '3', '0');
INSERT INTO `cmf_region` VALUES ('612', '63', '白银区', '3', '0');
INSERT INTO `cmf_region` VALUES ('613', '63', '平川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('614', '63', '会宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('615', '63', '景泰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('616', '63', '靖远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('617', '64', '临洮县', '3', '0');
INSERT INTO `cmf_region` VALUES ('618', '64', '陇西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('619', '64', '通渭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('620', '64', '渭源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('621', '64', '漳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('622', '64', '岷县', '3', '0');
INSERT INTO `cmf_region` VALUES ('623', '64', '安定区', '3', '0');
INSERT INTO `cmf_region` VALUES ('624', '64', '安定区', '3', '0');
INSERT INTO `cmf_region` VALUES ('625', '65', '合作市', '3', '0');
INSERT INTO `cmf_region` VALUES ('626', '65', '临潭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('627', '65', '卓尼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('628', '65', '舟曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('629', '65', '迭部县', '3', '0');
INSERT INTO `cmf_region` VALUES ('630', '65', '玛曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('631', '65', '碌曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('632', '65', '夏河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('633', '66', '嘉峪关市', '3', '0');
INSERT INTO `cmf_region` VALUES ('634', '67', '金川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('635', '67', '永昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('636', '68', '肃州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('637', '68', '玉门市', '3', '0');
INSERT INTO `cmf_region` VALUES ('638', '68', '敦煌市', '3', '0');
INSERT INTO `cmf_region` VALUES ('639', '68', '金塔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('640', '68', '瓜州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('641', '68', '肃北', '3', '0');
INSERT INTO `cmf_region` VALUES ('642', '68', '阿克塞', '3', '0');
INSERT INTO `cmf_region` VALUES ('643', '69', '临夏市', '3', '0');
INSERT INTO `cmf_region` VALUES ('644', '69', '临夏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('645', '69', '康乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('646', '69', '永靖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('647', '69', '广河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('648', '69', '和政县', '3', '0');
INSERT INTO `cmf_region` VALUES ('649', '69', '东乡族自治县', '3', '0');
INSERT INTO `cmf_region` VALUES ('650', '69', '积石山', '3', '0');
INSERT INTO `cmf_region` VALUES ('651', '70', '成县', '3', '0');
INSERT INTO `cmf_region` VALUES ('652', '70', '徽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('653', '70', '康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('654', '70', '礼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('655', '70', '两当县', '3', '0');
INSERT INTO `cmf_region` VALUES ('656', '70', '文县', '3', '0');
INSERT INTO `cmf_region` VALUES ('657', '70', '西和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('658', '70', '宕昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('659', '70', '武都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('660', '71', '崇信县', '3', '0');
INSERT INTO `cmf_region` VALUES ('661', '71', '华亭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('662', '71', '静宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('663', '71', '灵台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('664', '71', '崆峒区', '3', '0');
INSERT INTO `cmf_region` VALUES ('665', '71', '庄浪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('666', '71', '泾川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('667', '72', '合水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('668', '72', '华池县', '3', '0');
INSERT INTO `cmf_region` VALUES ('669', '72', '环县', '3', '0');
INSERT INTO `cmf_region` VALUES ('670', '72', '宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('671', '72', '庆城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('672', '72', '西峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('673', '72', '镇原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('674', '72', '正宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('675', '73', '甘谷县', '3', '0');
INSERT INTO `cmf_region` VALUES ('676', '73', '秦安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('677', '73', '清水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('678', '73', '秦州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('679', '73', '麦积区', '3', '0');
INSERT INTO `cmf_region` VALUES ('680', '73', '武山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('681', '73', '张家川', '3', '0');
INSERT INTO `cmf_region` VALUES ('682', '74', '古浪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('683', '74', '民勤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('684', '74', '天祝', '3', '0');
INSERT INTO `cmf_region` VALUES ('685', '74', '凉州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('686', '75', '高台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('687', '75', '临泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('688', '75', '民乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('689', '75', '山丹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('690', '75', '肃南', '3', '0');
INSERT INTO `cmf_region` VALUES ('691', '75', '甘州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('692', '76', '从化市', '3', '0');
INSERT INTO `cmf_region` VALUES ('693', '76', '天河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('694', '76', '东山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('695', '76', '白云区', '3', '0');
INSERT INTO `cmf_region` VALUES ('696', '76', '海珠区', '3', '0');
INSERT INTO `cmf_region` VALUES ('697', '76', '荔湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('698', '76', '越秀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('699', '76', '黄埔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('700', '76', '番禺区', '3', '0');
INSERT INTO `cmf_region` VALUES ('701', '76', '花都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('702', '76', '增城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('703', '76', '从化区', '3', '0');
INSERT INTO `cmf_region` VALUES ('704', '76', '市郊', '3', '0');
INSERT INTO `cmf_region` VALUES ('705', '77', '福田区', '3', '0');
INSERT INTO `cmf_region` VALUES ('706', '77', '罗湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('707', '77', '南山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('708', '77', '宝安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('709', '77', '龙岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('710', '77', '盐田区', '3', '0');
INSERT INTO `cmf_region` VALUES ('711', '78', '湘桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('712', '78', '潮安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('713', '78', '饶平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('714', '79', '南城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('715', '79', '东城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('716', '79', '万江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('717', '79', '莞城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('718', '79', '石龙镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('719', '79', '虎门镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('720', '79', '麻涌镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('722', '79', '石碣镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('723', '79', '沙田镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('724', '79', '望牛墩镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('725', '79', '洪梅镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('726', '79', '茶山镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('727', '79', '寮步镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('728', '79', '大岭山镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('729', '79', '大朗镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('730', '79', '黄江镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('731', '79', '樟木头', '3', '0');
INSERT INTO `cmf_region` VALUES ('732', '79', '凤岗镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('733', '79', '塘厦镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('734', '79', '谢岗镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('735', '79', '厚街镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('736', '79', '清溪镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('737', '79', '常平镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('738', '79', '桥头镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('739', '79', '横沥镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('740', '79', '东坑镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('741', '79', '企石镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('742', '79', '石排镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('743', '79', '长安镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('744', '79', '中堂镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('746', '80', '禅城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('747', '80', '南海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('748', '80', '顺德区', '3', '0');
INSERT INTO `cmf_region` VALUES ('749', '80', '三水区', '3', '0');
INSERT INTO `cmf_region` VALUES ('750', '80', '高明区', '3', '0');
INSERT INTO `cmf_region` VALUES ('751', '81', '东源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('752', '81', '和平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('753', '81', '源城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('754', '81', '连平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('755', '81', '龙川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('756', '81', '紫金县', '3', '0');
INSERT INTO `cmf_region` VALUES ('757', '82', '惠阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('758', '82', '惠城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('759', '82', '大亚湾', '3', '0');
INSERT INTO `cmf_region` VALUES ('760', '82', '博罗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('761', '82', '惠东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('762', '82', '龙门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('763', '83', '江海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('764', '83', '蓬江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('765', '83', '新会区', '3', '0');
INSERT INTO `cmf_region` VALUES ('766', '83', '台山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('767', '83', '开平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('768', '83', '鹤山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('769', '83', '恩平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('770', '84', '榕城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('771', '84', '普宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('772', '84', '揭东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('773', '84', '揭西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('774', '84', '惠来县', '3', '0');
INSERT INTO `cmf_region` VALUES ('775', '85', '茂南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('776', '85', '茂港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('777', '85', '高州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('778', '85', '化州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('779', '85', '信宜市', '3', '0');
INSERT INTO `cmf_region` VALUES ('780', '85', '电白县', '3', '0');
INSERT INTO `cmf_region` VALUES ('781', '86', '梅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('782', '86', '梅江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('783', '86', '兴宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('784', '86', '大埔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('785', '86', '丰顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('786', '86', '五华县', '3', '0');
INSERT INTO `cmf_region` VALUES ('787', '86', '平远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('788', '86', '蕉岭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('789', '87', '清城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('790', '87', '英德市', '3', '0');
INSERT INTO `cmf_region` VALUES ('791', '87', '连州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('792', '87', '佛冈县', '3', '0');
INSERT INTO `cmf_region` VALUES ('793', '87', '阳山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('794', '87', '清新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('795', '87', '连山', '3', '0');
INSERT INTO `cmf_region` VALUES ('796', '87', '连南', '3', '0');
INSERT INTO `cmf_region` VALUES ('797', '88', '南澳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('798', '88', '潮阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('799', '88', '澄海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('800', '88', '龙湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('801', '88', '金平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('802', '88', '濠江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('803', '88', '潮南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('804', '89', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('805', '89', '陆丰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('806', '89', '海丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('807', '89', '陆河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('808', '90', '曲江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('809', '90', '浈江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('810', '90', '武江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('811', '90', '曲江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('812', '90', '乐昌市', '3', '0');
INSERT INTO `cmf_region` VALUES ('813', '90', '南雄市', '3', '0');
INSERT INTO `cmf_region` VALUES ('814', '90', '始兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('815', '90', '仁化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('816', '90', '翁源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('817', '90', '新丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('818', '90', '乳源', '3', '0');
INSERT INTO `cmf_region` VALUES ('819', '91', '江城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('820', '91', '阳春市', '3', '0');
INSERT INTO `cmf_region` VALUES ('821', '91', '阳西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('822', '91', '阳东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('823', '92', '云城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('824', '92', '罗定市', '3', '0');
INSERT INTO `cmf_region` VALUES ('825', '92', '新兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('826', '92', '郁南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('827', '92', '云安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('828', '93', '赤坎区', '3', '0');
INSERT INTO `cmf_region` VALUES ('829', '93', '霞山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('830', '93', '坡头区', '3', '0');
INSERT INTO `cmf_region` VALUES ('831', '93', '麻章区', '3', '0');
INSERT INTO `cmf_region` VALUES ('832', '93', '廉江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('833', '93', '雷州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('834', '93', '吴川市', '3', '0');
INSERT INTO `cmf_region` VALUES ('835', '93', '遂溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('836', '93', '徐闻县', '3', '0');
INSERT INTO `cmf_region` VALUES ('837', '94', '肇庆市', '3', '0');
INSERT INTO `cmf_region` VALUES ('838', '94', '高要市', '3', '0');
INSERT INTO `cmf_region` VALUES ('839', '94', '四会市', '3', '0');
INSERT INTO `cmf_region` VALUES ('840', '94', '广宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('841', '94', '怀集县', '3', '0');
INSERT INTO `cmf_region` VALUES ('842', '94', '封开县', '3', '0');
INSERT INTO `cmf_region` VALUES ('843', '94', '德庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('844', '95', '石岐街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('845', '95', '东区街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('846', '95', '西区街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('847', '95', '环城街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('848', '95', '中山港街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('849', '95', '五桂山街道', '3', '0');
INSERT INTO `cmf_region` VALUES ('850', '96', '香洲区', '3', '0');
INSERT INTO `cmf_region` VALUES ('851', '96', '斗门区', '3', '0');
INSERT INTO `cmf_region` VALUES ('852', '96', '金湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('853', '97', '邕宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('854', '97', '青秀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('855', '97', '兴宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('856', '97', '良庆区', '3', '0');
INSERT INTO `cmf_region` VALUES ('857', '97', '西乡塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('858', '97', '江南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('859', '97', '武鸣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('860', '97', '隆安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('861', '97', '马山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('862', '97', '上林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('863', '97', '宾阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('864', '97', '横县', '3', '0');
INSERT INTO `cmf_region` VALUES ('865', '98', '秀峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('866', '98', '叠彩区', '3', '0');
INSERT INTO `cmf_region` VALUES ('867', '98', '象山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('868', '98', '七星区', '3', '0');
INSERT INTO `cmf_region` VALUES ('869', '98', '雁山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('870', '98', '阳朔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('871', '98', '临桂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('872', '98', '灵川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('873', '98', '全州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('874', '98', '平乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('875', '98', '兴安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('876', '98', '灌阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('877', '98', '荔浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('878', '98', '资源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('879', '98', '永福县', '3', '0');
INSERT INTO `cmf_region` VALUES ('880', '98', '龙胜', '3', '0');
INSERT INTO `cmf_region` VALUES ('881', '98', '恭城', '3', '0');
INSERT INTO `cmf_region` VALUES ('882', '99', '右江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('883', '99', '凌云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('884', '99', '平果县', '3', '0');
INSERT INTO `cmf_region` VALUES ('885', '99', '西林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('886', '99', '乐业县', '3', '0');
INSERT INTO `cmf_region` VALUES ('887', '99', '德保县', '3', '0');
INSERT INTO `cmf_region` VALUES ('888', '99', '田林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('889', '99', '田阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('890', '99', '靖西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('891', '99', '田东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('892', '99', '那坡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('893', '99', '隆林', '3', '0');
INSERT INTO `cmf_region` VALUES ('894', '100', '海城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('895', '100', '银海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('896', '100', '铁山港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('897', '100', '合浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('898', '101', '江州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('899', '101', '凭祥市', '3', '0');
INSERT INTO `cmf_region` VALUES ('900', '101', '宁明县', '3', '0');
INSERT INTO `cmf_region` VALUES ('901', '101', '扶绥县', '3', '0');
INSERT INTO `cmf_region` VALUES ('902', '101', '龙州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('903', '101', '大新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('904', '101', '天等县', '3', '0');
INSERT INTO `cmf_region` VALUES ('905', '102', '港口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('906', '102', '防城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('907', '102', '东兴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('908', '102', '上思县', '3', '0');
INSERT INTO `cmf_region` VALUES ('909', '103', '港北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('910', '103', '港南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('911', '103', '覃塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('912', '103', '桂平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('913', '103', '平南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('914', '104', '金城江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('915', '104', '宜州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('916', '104', '天峨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('917', '104', '凤山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('918', '104', '南丹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('919', '104', '东兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('920', '104', '都安', '3', '0');
INSERT INTO `cmf_region` VALUES ('921', '104', '罗城', '3', '0');
INSERT INTO `cmf_region` VALUES ('922', '104', '巴马', '3', '0');
INSERT INTO `cmf_region` VALUES ('923', '104', '环江', '3', '0');
INSERT INTO `cmf_region` VALUES ('924', '104', '大化', '3', '0');
INSERT INTO `cmf_region` VALUES ('925', '105', '八步区', '3', '0');
INSERT INTO `cmf_region` VALUES ('926', '105', '钟山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('927', '105', '昭平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('928', '105', '富川', '3', '0');
INSERT INTO `cmf_region` VALUES ('929', '106', '兴宾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('930', '106', '合山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('931', '106', '象州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('932', '106', '武宣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('933', '106', '忻城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('934', '106', '金秀', '3', '0');
INSERT INTO `cmf_region` VALUES ('935', '107', '城中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('936', '107', '鱼峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('937', '107', '柳北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('938', '107', '柳南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('939', '107', '柳江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('940', '107', '柳城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('941', '107', '鹿寨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('942', '107', '融安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('943', '107', '融水', '3', '0');
INSERT INTO `cmf_region` VALUES ('944', '107', '三江', '3', '0');
INSERT INTO `cmf_region` VALUES ('945', '108', '钦南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('946', '108', '钦北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('947', '108', '灵山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('948', '108', '浦北县', '3', '0');
INSERT INTO `cmf_region` VALUES ('949', '109', '万秀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('950', '109', '蝶山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('951', '109', '长洲区', '3', '0');
INSERT INTO `cmf_region` VALUES ('952', '109', '岑溪市', '3', '0');
INSERT INTO `cmf_region` VALUES ('953', '109', '苍梧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('954', '109', '藤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('955', '109', '蒙山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('956', '110', '玉州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('957', '110', '北流市', '3', '0');
INSERT INTO `cmf_region` VALUES ('958', '110', '容县', '3', '0');
INSERT INTO `cmf_region` VALUES ('959', '110', '陆川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('960', '110', '博白县', '3', '0');
INSERT INTO `cmf_region` VALUES ('961', '110', '兴业县', '3', '0');
INSERT INTO `cmf_region` VALUES ('962', '111', '南明区', '3', '0');
INSERT INTO `cmf_region` VALUES ('963', '111', '云岩区', '3', '0');
INSERT INTO `cmf_region` VALUES ('964', '111', '花溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('965', '111', '乌当区', '3', '0');
INSERT INTO `cmf_region` VALUES ('966', '111', '白云区', '3', '0');
INSERT INTO `cmf_region` VALUES ('967', '111', '小河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('968', '111', '金阳新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('969', '111', '新天园区', '3', '0');
INSERT INTO `cmf_region` VALUES ('970', '111', '清镇市', '3', '0');
INSERT INTO `cmf_region` VALUES ('971', '111', '开阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('972', '111', '修文县', '3', '0');
INSERT INTO `cmf_region` VALUES ('973', '111', '息烽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('974', '112', '西秀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('975', '112', '关岭', '3', '0');
INSERT INTO `cmf_region` VALUES ('976', '112', '镇宁', '3', '0');
INSERT INTO `cmf_region` VALUES ('977', '112', '紫云', '3', '0');
INSERT INTO `cmf_region` VALUES ('978', '112', '平坝县', '3', '0');
INSERT INTO `cmf_region` VALUES ('979', '112', '普定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('980', '113', '毕节市', '3', '0');
INSERT INTO `cmf_region` VALUES ('981', '113', '大方县', '3', '0');
INSERT INTO `cmf_region` VALUES ('982', '113', '黔西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('983', '113', '金沙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('984', '113', '织金县', '3', '0');
INSERT INTO `cmf_region` VALUES ('985', '113', '纳雍县', '3', '0');
INSERT INTO `cmf_region` VALUES ('986', '113', '赫章县', '3', '0');
INSERT INTO `cmf_region` VALUES ('987', '113', '威宁', '3', '0');
INSERT INTO `cmf_region` VALUES ('988', '114', '钟山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('989', '114', '六枝特区', '3', '0');
INSERT INTO `cmf_region` VALUES ('990', '114', '水城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('991', '114', '盘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('992', '115', '凯里市', '3', '0');
INSERT INTO `cmf_region` VALUES ('993', '115', '黄平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('994', '115', '施秉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('995', '115', '三穗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('996', '115', '镇远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('997', '115', '岑巩县', '3', '0');
INSERT INTO `cmf_region` VALUES ('998', '115', '天柱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('999', '115', '锦屏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1000', '115', '剑河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1001', '115', '台江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1002', '115', '黎平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1003', '115', '榕江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1004', '115', '从江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1005', '115', '雷山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1006', '115', '麻江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1007', '115', '丹寨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1008', '116', '都匀市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1009', '116', '福泉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1010', '116', '荔波县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1011', '116', '贵定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1012', '116', '瓮安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1013', '116', '独山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1014', '116', '平塘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1015', '116', '罗甸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1016', '116', '长顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1017', '116', '龙里县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1018', '116', '惠水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1019', '116', '三都', '3', '0');
INSERT INTO `cmf_region` VALUES ('1020', '117', '兴义市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1021', '117', '兴仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1022', '117', '普安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1023', '117', '晴隆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1024', '117', '贞丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1025', '117', '望谟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1026', '117', '册亨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1027', '117', '安龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1028', '118', '铜仁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1029', '118', '江口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1030', '118', '石阡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1031', '118', '思南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1032', '118', '德江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1033', '118', '玉屏', '3', '0');
INSERT INTO `cmf_region` VALUES ('1034', '118', '印江', '3', '0');
INSERT INTO `cmf_region` VALUES ('1035', '118', '沿河', '3', '0');
INSERT INTO `cmf_region` VALUES ('1036', '118', '松桃', '3', '0');
INSERT INTO `cmf_region` VALUES ('1037', '118', '万山特区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1038', '119', '红花岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1039', '119', '务川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1040', '119', '道真县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1041', '119', '汇川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1042', '119', '赤水市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1043', '119', '仁怀市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1044', '119', '遵义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1045', '119', '桐梓县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1046', '119', '绥阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1047', '119', '正安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1048', '119', '凤冈县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1049', '119', '湄潭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1050', '119', '余庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1051', '119', '习水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1052', '119', '道真', '3', '0');
INSERT INTO `cmf_region` VALUES ('1053', '119', '务川', '3', '0');
INSERT INTO `cmf_region` VALUES ('1054', '120', '秀英区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1055', '120', '龙华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1056', '120', '琼山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1057', '120', '美兰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1058', '137', '市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1059', '137', '洋浦开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1060', '137', '那大镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1061', '137', '王五镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1062', '137', '雅星镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1063', '137', '大成镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1064', '137', '中和镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1065', '137', '峨蔓镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1066', '137', '南丰镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1067', '137', '白马井镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1068', '137', '兰洋镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1069', '137', '和庆镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1070', '137', '海头镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1071', '137', '排浦镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1072', '137', '东成镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1073', '137', '光村镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1074', '137', '木棠镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1075', '137', '新州镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1076', '137', '三都镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1077', '137', '其他', '3', '0');
INSERT INTO `cmf_region` VALUES ('1078', '138', '长安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1079', '138', '桥东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1080', '138', '桥西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1081', '138', '新华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1082', '138', '裕华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1083', '138', '井陉矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1084', '138', '高新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1085', '138', '辛集市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1086', '138', '藁城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1087', '138', '晋州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1088', '138', '新乐市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1089', '138', '鹿泉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1090', '138', '井陉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1091', '138', '正定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1092', '138', '栾城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1093', '138', '行唐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1094', '138', '灵寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1095', '138', '高邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1096', '138', '深泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1097', '138', '赞皇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1098', '138', '无极县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1099', '138', '平山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1100', '138', '元氏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1101', '138', '赵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1102', '139', '新市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1103', '139', '南市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1104', '139', '北市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1105', '139', '涿州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1106', '139', '定州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1107', '139', '安国市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1108', '139', '高碑店市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1109', '139', '满城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1110', '139', '清苑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1111', '139', '涞水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1112', '139', '阜平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1113', '139', '徐水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1114', '139', '定兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1115', '139', '唐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1116', '139', '高阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1117', '139', '容城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1118', '139', '涞源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1119', '139', '望都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1120', '139', '安新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1121', '139', '易县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1122', '139', '曲阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1123', '139', '蠡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1124', '139', '顺平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1125', '139', '博野县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1126', '139', '雄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1127', '140', '运河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1128', '140', '新华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1129', '140', '泊头市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1130', '140', '任丘市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1131', '140', '黄骅市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1132', '140', '河间市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1133', '140', '沧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1134', '140', '青县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1135', '140', '东光县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1136', '140', '海兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1137', '140', '盐山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1138', '140', '肃宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1139', '140', '南皮县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1140', '140', '吴桥县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1141', '140', '献县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1142', '140', '孟村', '3', '0');
INSERT INTO `cmf_region` VALUES ('1143', '141', '双桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1144', '141', '双滦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1145', '141', '鹰手营子矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1146', '141', '承德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1147', '141', '兴隆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1148', '141', '平泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1149', '141', '滦平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1150', '141', '隆化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1151', '141', '丰宁', '3', '0');
INSERT INTO `cmf_region` VALUES ('1152', '141', '宽城', '3', '0');
INSERT INTO `cmf_region` VALUES ('1153', '141', '围场', '3', '0');
INSERT INTO `cmf_region` VALUES ('1154', '142', '从台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1155', '142', '复兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1156', '142', '邯山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1157', '142', '峰峰矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1158', '142', '武安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1159', '142', '邯郸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1160', '142', '临漳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1161', '142', '成安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1162', '142', '大名县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1163', '142', '涉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1164', '142', '磁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1165', '142', '肥乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1166', '142', '永年县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1167', '142', '邱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1168', '142', '鸡泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1169', '142', '广平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1170', '142', '馆陶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1171', '142', '魏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1172', '142', '曲周县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1173', '143', '桃城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1174', '143', '冀州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1175', '143', '深州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1176', '143', '枣强县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1177', '143', '武邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1178', '143', '武强县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1179', '143', '饶阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1180', '143', '安平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1181', '143', '故城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1182', '143', '景县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1183', '143', '阜城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1184', '144', '安次区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1185', '144', '广阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1186', '144', '霸州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1187', '144', '三河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1188', '144', '固安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1189', '144', '永清县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1190', '144', '香河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1191', '144', '大城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1192', '144', '文安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1193', '144', '大厂', '3', '0');
INSERT INTO `cmf_region` VALUES ('1194', '145', '海港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1195', '145', '山海关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1196', '145', '北戴河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1197', '145', '昌黎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1198', '145', '抚宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1199', '145', '卢龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1200', '145', '青龙', '3', '0');
INSERT INTO `cmf_region` VALUES ('1201', '146', '路北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1202', '146', '路南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1203', '146', '古冶区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1204', '146', '开平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1205', '146', '丰南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1206', '146', '丰润区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1207', '146', '遵化市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1208', '146', '迁安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1209', '146', '滦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1210', '146', '滦南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1211', '146', '乐亭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1212', '146', '迁西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1213', '146', '玉田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1214', '146', '唐海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1215', '147', '桥东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1216', '147', '桥西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1217', '147', '南宫市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1218', '147', '沙河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1219', '147', '邢台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1220', '147', '临城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1221', '147', '内丘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1222', '147', '柏乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1223', '147', '隆尧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1224', '147', '任县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1225', '147', '南和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1226', '147', '宁晋县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1227', '147', '巨鹿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1228', '147', '新河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1229', '147', '广宗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1230', '147', '平乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1231', '147', '威县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1232', '147', '清河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1233', '147', '临西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1234', '148', '桥西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1235', '148', '桥东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1236', '148', '宣化区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1237', '148', '下花园区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1238', '148', '宣化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1239', '148', '张北县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1240', '148', '康保县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1241', '148', '沽源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1242', '148', '尚义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1243', '148', '蔚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1244', '148', '阳原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1245', '148', '怀安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1246', '148', '万全县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1247', '148', '怀来县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1248', '148', '涿鹿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1249', '148', '赤城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1250', '148', '崇礼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1251', '149', '金水区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1252', '149', '邙山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1253', '149', '二七区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1254', '149', '管城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1255', '149', '中原区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1256', '149', '上街区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1257', '149', '惠济区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1258', '149', '郑东新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1259', '149', '经济技术开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1260', '149', '高新开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1261', '149', '出口加工区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1262', '149', '巩义市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1263', '149', '荥阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1264', '149', '新密市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1265', '149', '新郑市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1266', '149', '登封市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1267', '149', '中牟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1268', '150', '西工区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1269', '150', '老城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1270', '150', '涧西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1272', '150', '洛龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1273', '150', '吉利区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1274', '150', '偃师市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1275', '150', '孟津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1276', '150', '新安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1277', '150', '栾川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1278', '150', '嵩县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1279', '150', '汝阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1280', '150', '宜阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1281', '150', '洛宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1282', '150', '伊川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1283', '151', '鼓楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1284', '151', '龙亭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1285', '151', '顺河回族区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1286', '151', '金明区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1287', '151', '禹王台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1288', '151', '杞县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1289', '151', '通许县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1290', '151', '尉氏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1291', '151', '开封县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1292', '151', '兰考县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1293', '152', '北关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1294', '152', '文峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1295', '152', '殷都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1296', '152', '龙安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1297', '152', '林州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1298', '152', '安阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1299', '152', '汤阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1300', '152', '滑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1301', '152', '内黄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1302', '153', '淇滨区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1303', '153', '山城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1304', '153', '鹤山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1305', '153', '浚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1306', '153', '淇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1307', '154', '济源市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1308', '155', '解放区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1309', '155', '中站区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1310', '155', '马村区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1311', '155', '山阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1312', '155', '沁阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1313', '155', '孟州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1314', '155', '修武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1315', '155', '博爱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1316', '155', '武陟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1317', '155', '温县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1318', '156', '卧龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1319', '156', '宛城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1320', '156', '邓州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1321', '156', '南召县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1322', '156', '方城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1323', '156', '西峡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1324', '156', '镇平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1325', '156', '内乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1326', '156', '淅川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1327', '156', '社旗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1328', '156', '唐河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1329', '156', '新野县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1330', '156', '桐柏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1331', '157', '新华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1332', '157', '卫东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1333', '157', '湛河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1334', '157', '石龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1335', '157', '舞钢市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1336', '157', '汝州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1337', '157', '宝丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1338', '157', '叶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1339', '157', '鲁山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1340', '157', '郏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1341', '158', '湖滨区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1342', '158', '义马市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1343', '158', '灵宝市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1344', '158', '渑池县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1345', '158', '陕县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1346', '158', '卢氏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1347', '159', '梁园区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1348', '159', '睢阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1349', '159', '永城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1350', '159', '民权县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1351', '159', '睢县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1352', '159', '宁陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1353', '159', '虞城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1354', '159', '柘城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1355', '159', '夏邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1356', '160', '卫滨区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1357', '160', '红旗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1358', '160', '凤泉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1359', '160', '牧野区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1360', '160', '卫辉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1361', '160', '辉县市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1362', '160', '新乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1363', '160', '获嘉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1364', '160', '原阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1365', '160', '延津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1366', '160', '封丘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1367', '160', '长垣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1369', '161', '平桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1370', '161', '罗山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1371', '161', '光山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1372', '161', '新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1373', '161', '商城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1374', '161', '固始县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1375', '161', '潢川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1376', '161', '淮滨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1377', '161', '息县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1378', '162', '魏都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1379', '162', '禹州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1380', '162', '长葛市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1381', '162', '许昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1382', '162', '鄢陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1383', '162', '襄城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1384', '163', '川汇区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1385', '163', '项城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1386', '163', '扶沟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1387', '163', '西华县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1388', '163', '商水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1389', '163', '沈丘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1390', '163', '郸城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1391', '163', '淮阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1392', '163', '太康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1393', '163', '鹿邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1394', '164', '驿城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1395', '164', '西平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1396', '164', '上蔡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1397', '164', '平舆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1398', '164', '正阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1399', '164', '确山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1400', '164', '泌阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1401', '164', '汝南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1402', '164', '遂平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1403', '164', '新蔡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1404', '165', '郾城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1405', '165', '源汇区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1406', '165', '召陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1407', '165', '舞阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1408', '165', '临颍县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1409', '166', '华龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1410', '166', '清丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1411', '166', '南乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1412', '166', '范县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1413', '166', '台前县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1414', '166', '濮阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1415', '167', '道里区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1416', '167', '南岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1417', '167', '动力区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1418', '167', '平房区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1419', '167', '香坊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1420', '167', '太平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1421', '167', '道外区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1422', '167', '阿城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1423', '167', '呼兰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1424', '167', '松北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1425', '167', '尚志市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1426', '167', '双城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1427', '167', '五常市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1428', '167', '方正县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1429', '167', '宾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1430', '167', '依兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1431', '167', '巴彦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1432', '167', '通河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1433', '167', '木兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1434', '167', '延寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1435', '168', '萨尔图区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1436', '168', '红岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1437', '168', '龙凤区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1438', '168', '让胡路区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1439', '168', '大同区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1440', '168', '肇州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1441', '168', '肇源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1442', '168', '林甸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1443', '168', '杜尔伯特', '3', '0');
INSERT INTO `cmf_region` VALUES ('1444', '169', '呼玛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1445', '169', '漠河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1446', '169', '塔河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1447', '170', '兴山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1448', '170', '工农区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1449', '170', '南山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1450', '170', '兴安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1451', '170', '向阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1452', '170', '东山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1453', '170', '萝北县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1454', '170', '绥滨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1455', '171', '爱辉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1456', '171', '五大连池市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1457', '171', '北安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1458', '171', '嫩江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1459', '171', '逊克县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1460', '171', '孙吴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1461', '172', '鸡冠区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1462', '172', '恒山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1463', '172', '城子河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1464', '172', '滴道区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1465', '172', '梨树区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1466', '172', '虎林市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1467', '172', '密山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1468', '172', '鸡东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1469', '173', '前进区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1470', '173', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1471', '173', '向阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1472', '173', '东风区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1473', '173', '同江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1474', '173', '富锦市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1475', '173', '桦南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1476', '173', '桦川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1477', '173', '汤原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1478', '173', '抚远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1479', '174', '爱民区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1480', '174', '东安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1481', '174', '阳明区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1482', '174', '西安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1483', '174', '绥芬河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1484', '174', '海林市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1485', '174', '宁安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1486', '174', '穆棱市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1487', '174', '东宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1488', '174', '林口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1489', '175', '桃山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1490', '175', '新兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1491', '175', '茄子河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1492', '175', '勃利县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1493', '176', '龙沙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1494', '176', '昂昂溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1495', '176', '铁峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1496', '176', '建华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1497', '176', '富拉尔基区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1498', '176', '碾子山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1500', '176', '讷河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1501', '176', '龙江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1502', '176', '依安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1503', '176', '泰来县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1504', '176', '甘南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1505', '176', '富裕县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1506', '176', '克山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1507', '176', '克东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1508', '176', '拜泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1509', '177', '尖山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1510', '177', '岭东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1511', '177', '四方台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1512', '177', '宝山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1513', '177', '集贤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1514', '177', '友谊县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1515', '177', '宝清县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1516', '177', '饶河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1517', '178', '北林区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1518', '178', '安达市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1519', '178', '肇东市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1520', '178', '海伦市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1521', '178', '望奎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1522', '178', '兰西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1523', '178', '青冈县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1524', '178', '庆安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1525', '178', '明水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1526', '178', '绥棱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1527', '179', '伊春区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1528', '179', '带岭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1529', '179', '南岔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1530', '179', '金山屯区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1531', '179', '西林区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1532', '179', '美溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1533', '179', '乌马河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1534', '179', '翠峦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1535', '179', '友好区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1536', '179', '上甘岭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1537', '179', '五营区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1538', '179', '红星区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1539', '179', '新青区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1540', '179', '汤旺河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1541', '179', '乌伊岭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1542', '179', '铁力市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1543', '179', '嘉荫县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1544', '180', '江岸区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1545', '180', '武昌区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1546', '180', '江汉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1548', '180', '汉阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1549', '180', '青山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1550', '180', '洪山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1551', '180', '东西湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1552', '180', '汉南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1553', '180', '蔡甸区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1554', '180', '江夏区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1555', '180', '黄陂区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1556', '180', '新洲区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1557', '180', '经济开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1558', '181', '仙桃市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1559', '182', '鄂城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1560', '182', '华容区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1561', '182', '梁子湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1562', '183', '黄州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1563', '183', '麻城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1564', '183', '武穴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1565', '183', '团风县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1566', '183', '红安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1567', '183', '罗田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1568', '183', '英山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1569', '183', '浠水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1570', '183', '蕲春县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1571', '183', '黄梅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1572', '184', '黄石港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1573', '184', '西塞山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1574', '184', '下陆区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1575', '184', '铁山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1576', '184', '大冶市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1577', '184', '阳新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1578', '185', '东宝区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1579', '185', '掇刀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1580', '185', '钟祥市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1581', '185', '京山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1582', '185', '沙洋县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1583', '186', '沙市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1584', '186', '荆州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1585', '186', '石首市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1586', '186', '洪湖市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1587', '186', '松滋市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1588', '186', '公安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1589', '186', '监利县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1590', '186', '江陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1591', '187', '潜江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1592', '188', '神农架林区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1593', '189', '张湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1594', '189', '茅箭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1595', '189', '丹江口市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1596', '189', '郧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1597', '189', '郧西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1598', '189', '竹山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1599', '189', '竹溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1600', '189', '房县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1601', '190', '曾都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1602', '190', '广水市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1603', '191', '天门市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1604', '192', '咸安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1605', '192', '赤壁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1606', '192', '嘉鱼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1607', '192', '通城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1608', '192', '崇阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1609', '192', '通山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1610', '193', '襄城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1611', '193', '樊城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1612', '193', '襄阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1613', '193', '老河口市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1614', '193', '枣阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1615', '193', '宜城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1616', '193', '南漳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1617', '193', '谷城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1618', '193', '保康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1619', '194', '孝南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1620', '194', '应城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1621', '194', '安陆市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1622', '194', '汉川市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1623', '194', '孝昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1624', '194', '大悟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1625', '194', '云梦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1626', '195', '长阳', '3', '0');
INSERT INTO `cmf_region` VALUES ('1627', '195', '五峰', '3', '0');
INSERT INTO `cmf_region` VALUES ('1628', '195', '西陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1629', '195', '伍家岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1630', '195', '点军区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1632', '195', '夷陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1633', '195', '宜都市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1634', '195', '当阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1635', '195', '枝江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1636', '195', '远安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1637', '195', '兴山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1638', '195', '秭归县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1639', '196', '恩施市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1640', '196', '利川市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1641', '196', '建始县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1642', '196', '巴东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1643', '196', '宣恩县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1644', '196', '咸丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1645', '196', '来凤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1646', '196', '鹤峰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1647', '197', '岳麓区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1648', '197', '芙蓉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1649', '197', '天心区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1650', '197', '开福区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1651', '197', '雨花区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1652', '197', '开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1653', '197', '浏阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1654', '197', '长沙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1655', '197', '望城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1656', '197', '宁乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1657', '198', '永定区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1658', '198', '武陵源区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1659', '198', '慈利县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1660', '198', '桑植县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1661', '199', '武陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1662', '199', '鼎城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1663', '199', '津市市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1664', '199', '安乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1665', '199', '汉寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1666', '199', '澧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1667', '199', '临澧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1668', '199', '桃源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1669', '199', '石门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1670', '200', '北湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1671', '200', '苏仙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1672', '200', '资兴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1673', '200', '桂阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1674', '200', '宜章县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1675', '200', '永兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1676', '200', '嘉禾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1677', '200', '临武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1678', '200', '汝城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1679', '200', '桂东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1680', '200', '安仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1681', '201', '雁峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1682', '201', '珠晖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1683', '201', '石鼓区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1684', '201', '蒸湘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1685', '201', '南岳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1686', '201', '耒阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1687', '201', '常宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1688', '201', '衡阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1689', '201', '衡南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1690', '201', '衡山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1691', '201', '衡东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1692', '201', '祁东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1693', '202', '鹤城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1694', '202', '靖州', '3', '0');
INSERT INTO `cmf_region` VALUES ('1695', '202', '麻阳', '3', '0');
INSERT INTO `cmf_region` VALUES ('1696', '202', '通道', '3', '0');
INSERT INTO `cmf_region` VALUES ('1697', '202', '新晃', '3', '0');
INSERT INTO `cmf_region` VALUES ('1698', '202', '芷江', '3', '0');
INSERT INTO `cmf_region` VALUES ('1699', '202', '沅陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1700', '202', '辰溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1701', '202', '溆浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1702', '202', '中方县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1703', '202', '会同县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1704', '202', '洪江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1705', '203', '娄星区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1706', '203', '冷水江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1707', '203', '涟源市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1708', '203', '双峰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1709', '203', '新化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1710', '204', '城步', '3', '0');
INSERT INTO `cmf_region` VALUES ('1711', '204', '双清区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1712', '204', '大祥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1713', '204', '北塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1714', '204', '武冈市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1715', '204', '邵东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1716', '204', '新邵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1717', '204', '邵阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1718', '204', '隆回县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1719', '204', '洞口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1720', '204', '绥宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1721', '204', '新宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1722', '205', '岳塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1723', '205', '雨湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1724', '205', '湘乡市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1725', '205', '韶山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1726', '205', '湘潭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1727', '206', '吉首市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1728', '206', '泸溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1729', '206', '凤凰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1730', '206', '花垣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1731', '206', '保靖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1732', '206', '古丈县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1733', '206', '永顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1734', '206', '龙山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1735', '207', '赫山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1736', '207', '资阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1737', '207', '沅江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1738', '207', '南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1739', '207', '桃江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1740', '207', '安化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1741', '208', '江华', '3', '0');
INSERT INTO `cmf_region` VALUES ('1742', '208', '冷水滩区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1743', '208', '零陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1744', '208', '祁阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1745', '208', '东安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1746', '208', '双牌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1747', '208', '道县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1748', '208', '江永县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1749', '208', '宁远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1750', '208', '蓝山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1751', '208', '新田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1752', '209', '岳阳楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1753', '209', '君山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1754', '209', '云溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1755', '209', '汨罗市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1756', '209', '临湘市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1757', '209', '岳阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1758', '209', '华容县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1759', '209', '湘阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1760', '209', '平江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1761', '210', '天元区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1762', '210', '荷塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1763', '210', '芦淞区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1764', '210', '石峰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1765', '210', '醴陵市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1766', '210', '株洲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1767', '210', '攸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1768', '210', '茶陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1769', '210', '炎陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1770', '211', '朝阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1771', '211', '宽城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1772', '211', '二道区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1773', '211', '南关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1774', '211', '绿园区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1775', '211', '双阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1776', '211', '净月潭开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1777', '211', '高新技术开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1778', '211', '经济技术开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1779', '211', '汽车产业开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1780', '211', '德惠市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1781', '211', '九台市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1782', '211', '榆树市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1783', '211', '农安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1784', '212', '船营区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1785', '212', '昌邑区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1786', '212', '龙潭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1787', '212', '丰满区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1788', '212', '蛟河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1789', '212', '桦甸市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1790', '212', '舒兰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1791', '212', '磐石市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1792', '212', '永吉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1793', '213', '洮北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1794', '213', '洮南市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1795', '213', '大安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1796', '213', '镇赉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1797', '213', '通榆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1798', '214', '江源区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1799', '214', '八道江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1800', '214', '长白', '3', '0');
INSERT INTO `cmf_region` VALUES ('1801', '214', '临江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1802', '214', '抚松县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1803', '214', '靖宇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1804', '215', '龙山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1805', '215', '西安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1806', '215', '东丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1807', '215', '东辽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1808', '216', '铁西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1809', '216', '铁东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1810', '216', '伊通', '3', '0');
INSERT INTO `cmf_region` VALUES ('1811', '216', '公主岭市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1812', '216', '双辽市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1813', '216', '梨树县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1814', '217', '前郭尔罗斯', '3', '0');
INSERT INTO `cmf_region` VALUES ('1815', '217', '宁江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1816', '217', '长岭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1817', '217', '乾安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1818', '217', '扶余县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1819', '218', '东昌区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1820', '218', '二道江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1821', '218', '梅河口市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1822', '218', '集安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1823', '218', '通化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1824', '218', '辉南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1825', '218', '柳河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1826', '219', '延吉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1827', '219', '图们市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1828', '219', '敦化市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1829', '219', '珲春市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1830', '219', '龙井市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1831', '219', '和龙市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1832', '219', '安图县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1833', '219', '汪清县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1834', '220', '玄武区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1835', '220', '鼓楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1836', '220', '白下区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1837', '220', '建邺区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1838', '220', '秦淮区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1839', '220', '雨花台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1840', '220', '下关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1841', '220', '栖霞区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1842', '220', '浦口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1843', '220', '江宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1844', '220', '六合区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1845', '220', '溧水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1846', '220', '高淳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1847', '221', '沧浪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1848', '221', '金阊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1849', '221', '平江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1850', '221', '虎丘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1851', '221', '吴中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1852', '221', '相城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1853', '221', '园区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1854', '221', '新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1855', '221', '常熟市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1856', '221', '张家港市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1857', '221', '玉山镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1858', '221', '巴城镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1859', '221', '周市镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1860', '221', '陆家镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1861', '221', '花桥镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1862', '221', '淀山湖镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1863', '221', '张浦镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1864', '221', '周庄镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1865', '221', '千灯镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1866', '221', '锦溪镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('1867', '221', '开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1868', '221', '吴江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1869', '221', '太仓市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1870', '222', '崇安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1871', '222', '北塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1872', '222', '南长区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1873', '222', '锡山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1874', '222', '惠山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1875', '222', '滨湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1876', '222', '新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1877', '222', '江阴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1878', '222', '宜兴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1879', '223', '天宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1880', '223', '钟楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1881', '223', '戚墅堰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1882', '223', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1883', '223', '新北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1884', '223', '武进区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1885', '223', '溧阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1886', '223', '金坛市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1887', '224', '清河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1888', '224', '清浦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1889', '224', '楚州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1890', '224', '淮阴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1891', '224', '涟水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1892', '224', '洪泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1893', '224', '盱眙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1894', '224', '金湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1895', '225', '新浦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1896', '225', '连云区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1897', '225', '海州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1898', '225', '赣榆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1899', '225', '东海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1900', '225', '灌云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1901', '225', '灌南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1902', '226', '崇川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1903', '226', '港闸区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1904', '226', '经济开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1905', '226', '启东市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1906', '226', '如皋市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1907', '226', '通州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1908', '226', '海门市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1909', '226', '海安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1910', '226', '如东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1911', '227', '宿城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1912', '227', '宿豫区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1913', '227', '宿豫县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1914', '227', '沭阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1915', '227', '泗阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1916', '227', '泗洪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1917', '228', '海陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1918', '228', '高港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1919', '228', '兴化市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1920', '228', '靖江市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1921', '228', '泰兴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1922', '228', '姜堰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1923', '229', '云龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1924', '229', '鼓楼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1925', '229', '九里区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1926', '229', '贾汪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1927', '229', '泉山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1928', '229', '新沂市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1929', '229', '邳州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1930', '229', '丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1931', '229', '沛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1932', '229', '铜山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1933', '229', '睢宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1934', '230', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1935', '230', '亭湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1936', '230', '盐都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1937', '230', '盐都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1938', '230', '东台市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1939', '230', '大丰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1940', '230', '响水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1941', '230', '滨海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1942', '230', '阜宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1943', '230', '射阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1944', '230', '建湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1945', '231', '广陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1946', '231', '维扬区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1947', '231', '邗江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1948', '231', '仪征市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1949', '231', '高邮市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1950', '231', '江都市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1951', '231', '宝应县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1952', '232', '京口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1953', '232', '润州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1954', '232', '丹徒区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1955', '232', '丹阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1956', '232', '扬中市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1957', '232', '句容市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1958', '233', '东湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1959', '233', '西湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1960', '233', '青云谱区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1961', '233', '湾里区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1962', '233', '青山湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1963', '233', '红谷滩新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1964', '233', '昌北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1965', '233', '高新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1966', '233', '南昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1967', '233', '新建县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1968', '233', '安义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1969', '233', '进贤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1970', '234', '临川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1971', '234', '南城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1972', '234', '黎川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1973', '234', '南丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1974', '234', '崇仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1975', '234', '乐安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1976', '234', '宜黄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1977', '234', '金溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1978', '234', '资溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1979', '234', '东乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1980', '234', '广昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1981', '235', '章贡区', '3', '0');
INSERT INTO `cmf_region` VALUES ('1982', '235', '于都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1983', '235', '瑞金市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1984', '235', '南康市', '3', '0');
INSERT INTO `cmf_region` VALUES ('1985', '235', '赣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1986', '235', '信丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1987', '235', '大余县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1988', '235', '上犹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1989', '235', '崇义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1990', '235', '安远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1991', '235', '龙南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1992', '235', '定南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1993', '235', '全南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1994', '235', '宁都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1995', '235', '兴国县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1996', '235', '会昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1997', '235', '寻乌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1998', '235', '石城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('1999', '236', '安福县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2000', '236', '吉州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2001', '236', '青原区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2002', '236', '井冈山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2003', '236', '吉安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2004', '236', '吉水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2005', '236', '峡江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2006', '236', '新干县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2007', '236', '永丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2008', '236', '泰和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2009', '236', '遂川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2010', '236', '万安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2011', '236', '永新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2012', '237', '珠山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2013', '237', '昌江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2014', '237', '乐平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2015', '237', '浮梁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2016', '238', '浔阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2017', '238', '庐山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2018', '238', '瑞昌市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2019', '238', '九江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2020', '238', '武宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2021', '238', '修水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2022', '238', '永修县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2023', '238', '德安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2024', '238', '星子县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2025', '238', '都昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2026', '238', '湖口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2027', '238', '彭泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2028', '239', '安源区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2029', '239', '湘东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2030', '239', '莲花县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2031', '239', '芦溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2032', '239', '上栗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2033', '240', '信州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2034', '240', '德兴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2035', '240', '上饶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2036', '240', '广丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2037', '240', '玉山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2038', '240', '铅山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2039', '240', '横峰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2040', '240', '弋阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2041', '240', '余干县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2042', '240', '波阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2043', '240', '万年县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2044', '240', '婺源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2045', '241', '渝水区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2046', '241', '分宜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2047', '242', '袁州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2048', '242', '丰城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2049', '242', '樟树市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2050', '242', '高安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2051', '242', '奉新县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2052', '242', '万载县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2053', '242', '上高县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2054', '242', '宜丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2055', '242', '靖安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2056', '242', '铜鼓县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2057', '243', '月湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2058', '243', '贵溪市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2059', '243', '余江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2060', '244', '沈河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2061', '244', '皇姑区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2062', '244', '和平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2063', '244', '大东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2064', '244', '铁西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2065', '244', '苏家屯区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2066', '244', '东陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2067', '244', '沈北新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2068', '244', '于洪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2069', '244', '浑南新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2070', '244', '新民市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2071', '244', '辽中县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2072', '244', '康平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2073', '244', '法库县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2074', '245', '西岗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2075', '245', '中山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2076', '245', '沙河口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2077', '245', '甘井子区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2078', '245', '旅顺口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2079', '245', '金州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2080', '245', '开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2081', '245', '瓦房店市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2082', '245', '普兰店市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2083', '245', '庄河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2084', '245', '长海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2085', '246', '铁东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2086', '246', '铁西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2087', '246', '立山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2088', '246', '千山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2089', '246', '岫岩', '3', '0');
INSERT INTO `cmf_region` VALUES ('2090', '246', '海城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2091', '246', '台安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2092', '247', '本溪', '3', '0');
INSERT INTO `cmf_region` VALUES ('2093', '247', '平山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2094', '247', '明山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2095', '247', '溪湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2096', '247', '南芬区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2097', '247', '桓仁', '3', '0');
INSERT INTO `cmf_region` VALUES ('2098', '248', '双塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2099', '248', '龙城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2101', '248', '北票市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2102', '248', '凌源市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2103', '248', '朝阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2104', '248', '建平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2105', '249', '振兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2106', '249', '元宝区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2107', '249', '振安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2108', '249', '宽甸', '3', '0');
INSERT INTO `cmf_region` VALUES ('2109', '249', '东港市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2110', '249', '凤城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2111', '250', '顺城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2112', '250', '新抚区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2113', '250', '东洲区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2114', '250', '望花区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2115', '250', '清原', '3', '0');
INSERT INTO `cmf_region` VALUES ('2116', '250', '新宾', '3', '0');
INSERT INTO `cmf_region` VALUES ('2117', '250', '抚顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2118', '251', '阜新', '3', '0');
INSERT INTO `cmf_region` VALUES ('2119', '251', '海州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2120', '251', '新邱区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2121', '251', '太平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2122', '251', '清河门区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2123', '251', '细河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2124', '251', '彰武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2125', '252', '龙港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2126', '252', '南票区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2127', '252', '连山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2128', '252', '兴城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2129', '252', '绥中县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2130', '252', '建昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2131', '253', '太和区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2132', '253', '古塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2133', '253', '凌河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2134', '253', '凌海市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2135', '253', '北镇市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2136', '253', '黑山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2137', '253', '义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2138', '254', '白塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2139', '254', '文圣区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2140', '254', '宏伟区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2141', '254', '太子河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2142', '254', '弓长岭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2143', '254', '灯塔市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2144', '254', '辽阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2145', '255', '双台子区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2146', '255', '兴隆台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2147', '255', '大洼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2148', '255', '盘山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2149', '256', '银州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2150', '256', '清河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2151', '256', '调兵山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2152', '256', '开原市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2153', '256', '铁岭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2154', '256', '西丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2155', '256', '昌图县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2156', '257', '站前区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2157', '257', '西市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2158', '257', '鲅鱼圈区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2159', '257', '老边区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2160', '257', '盖州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2161', '257', '大石桥市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2162', '258', '回民区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2163', '258', '玉泉区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2164', '258', '新城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2165', '258', '赛罕区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2166', '258', '清水河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2167', '258', '土默特左旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2168', '258', '托克托县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2169', '258', '和林格尔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2170', '258', '武川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2171', '259', '阿拉善左旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2172', '259', '阿拉善右旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2173', '259', '额济纳旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2174', '260', '临河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2175', '260', '五原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2176', '260', '磴口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2177', '260', '乌拉特前旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2178', '260', '乌拉特中旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2179', '260', '乌拉特后旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2180', '260', '杭锦后旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2181', '261', '昆都仑区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2182', '261', '青山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2183', '261', '东河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2184', '261', '九原区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2185', '261', '石拐区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2186', '261', '白云矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2187', '261', '土默特右旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2188', '261', '固阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2190', '262', '红山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2191', '262', '元宝山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2192', '262', '松山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2194', '262', '巴林左旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2195', '262', '巴林右旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2196', '262', '林西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2197', '262', '克什克腾旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2198', '262', '翁牛特旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2199', '262', '喀喇沁旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2200', '262', '宁城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2201', '262', '敖汉旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2202', '263', '东胜区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2203', '263', '达拉特旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2204', '263', '准格尔旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2205', '263', '鄂托克前旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2206', '263', '鄂托克旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2207', '263', '杭锦旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2208', '263', '乌审旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2209', '263', '伊金霍洛旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2210', '264', '海拉尔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2211', '264', '莫力达瓦', '3', '0');
INSERT INTO `cmf_region` VALUES ('2212', '264', '满洲里市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2213', '264', '牙克石市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2214', '264', '扎兰屯市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2215', '264', '额尔古纳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2216', '264', '根河市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2217', '264', '阿荣旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2223', '265', '科尔沁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2224', '265', '霍林郭勒市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2227', '265', '开鲁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2228', '265', '库伦旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2229', '265', '奈曼旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2230', '265', '扎鲁特旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2231', '266', '海勃湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2232', '266', '乌达区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2233', '266', '海南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2234', '267', '化德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2235', '267', '集宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2236', '267', '丰镇市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2237', '267', '卓资县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2238', '267', '商都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2239', '267', '兴和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2240', '267', '凉城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2244', '267', '四子王旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2245', '268', '二连浩特市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2246', '268', '锡林浩特市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2247', '268', '阿巴嘎旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2248', '268', '苏尼特左旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2249', '268', '苏尼特右旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2252', '268', '太仆寺旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2253', '268', '镶黄旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2254', '268', '正镶白旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2255', '268', '正蓝旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2256', '268', '多伦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2257', '269', '乌兰浩特市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2258', '269', '阿尔山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2261', '269', '扎赉特旗', '3', '0');
INSERT INTO `cmf_region` VALUES ('2262', '269', '突泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2263', '270', '西夏区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2264', '270', '金凤区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2265', '270', '兴庆区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2266', '270', '灵武市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2267', '270', '永宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2268', '270', '贺兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2269', '271', '原州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2270', '271', '海原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2271', '271', '西吉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2272', '271', '隆德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2273', '271', '泾源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2274', '271', '彭阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2275', '272', '惠农县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2276', '272', '大武口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2277', '272', '惠农区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2278', '272', '陶乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2279', '272', '平罗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2280', '273', '利通区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2281', '273', '中卫县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2282', '273', '青铜峡市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2283', '273', '中宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2284', '273', '盐池县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2285', '273', '同心县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2286', '274', '沙坡头区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2287', '274', '海原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2288', '274', '中宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2289', '275', '城中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2290', '275', '城东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2291', '275', '城西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2292', '275', '城北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2293', '275', '湟中县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2294', '275', '湟源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2295', '275', '大通', '3', '0');
INSERT INTO `cmf_region` VALUES ('2296', '276', '玛沁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2297', '276', '班玛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2298', '276', '甘德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2299', '276', '达日县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2300', '276', '久治县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2301', '276', '玛多县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2302', '277', '海晏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2303', '277', '祁连县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2304', '277', '刚察县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2305', '277', '门源', '3', '0');
INSERT INTO `cmf_region` VALUES ('2306', '278', '平安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2307', '278', '乐都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2308', '278', '民和', '3', '0');
INSERT INTO `cmf_region` VALUES ('2309', '278', '互助', '3', '0');
INSERT INTO `cmf_region` VALUES ('2310', '278', '化隆', '3', '0');
INSERT INTO `cmf_region` VALUES ('2311', '278', '循化', '3', '0');
INSERT INTO `cmf_region` VALUES ('2312', '279', '共和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2313', '279', '同德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2314', '279', '贵德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2315', '279', '兴海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2316', '279', '贵南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2317', '280', '德令哈市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2318', '280', '格尔木市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2319', '280', '乌兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2320', '280', '都兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2321', '280', '天峻县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2322', '281', '同仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2323', '281', '尖扎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2324', '281', '泽库县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2326', '282', '玉树县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2327', '282', '杂多县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2328', '282', '称多县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2329', '282', '治多县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2330', '282', '囊谦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2331', '282', '曲麻莱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2332', '283', '市中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2333', '283', '历下区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2334', '283', '天桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2335', '283', '槐荫区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2336', '283', '历城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2337', '283', '长清区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2338', '283', '章丘市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2339', '283', '平阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2340', '283', '济阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2341', '283', '商河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2342', '284', '市南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2343', '284', '市北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2344', '284', '城阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2345', '284', '四方区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2346', '284', '李沧区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2347', '284', '黄岛区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2348', '284', '崂山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2349', '284', '胶州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2350', '284', '即墨市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2351', '284', '平度市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2352', '284', '胶南市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2353', '284', '莱西市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2354', '285', '滨城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2355', '285', '惠民县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2356', '285', '阳信县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2357', '285', '无棣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2358', '285', '沾化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2359', '285', '博兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2360', '285', '邹平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2361', '286', '德城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2362', '286', '陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2363', '286', '乐陵市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2364', '286', '禹城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2365', '286', '宁津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2366', '286', '庆云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2367', '286', '临邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2368', '286', '齐河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2369', '286', '平原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2370', '286', '夏津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2371', '286', '武城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2372', '287', '东营区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2373', '287', '河口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2374', '287', '垦利县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2375', '287', '利津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2376', '287', '广饶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2377', '288', '牡丹区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2378', '288', '曹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2379', '288', '单县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2380', '288', '成武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2381', '288', '巨野县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2382', '288', '郓城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2383', '288', '鄄城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2384', '288', '定陶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2385', '288', '东明县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2386', '289', '市中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2387', '289', '任城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2388', '289', '曲阜市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2389', '289', '兖州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2390', '289', '邹城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2391', '289', '微山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2392', '289', '鱼台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2393', '289', '金乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2394', '289', '嘉祥县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2395', '289', '汶上县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2396', '289', '泗水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2397', '289', '梁山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2398', '290', '莱城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2399', '290', '钢城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2400', '291', '东昌府区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2401', '291', '临清市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2402', '291', '阳谷县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2403', '291', '莘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2404', '291', '茌平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2405', '291', '东阿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2406', '291', '冠县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2407', '291', '高唐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2408', '292', '兰山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2409', '292', '罗庄区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2410', '292', '河东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2411', '292', '沂南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2412', '292', '郯城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2413', '292', '沂水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2414', '292', '苍山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2415', '292', '费县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2416', '292', '平邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2417', '292', '莒南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2418', '292', '蒙阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2419', '292', '临沭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2420', '293', '东港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2421', '293', '岚山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2422', '293', '五莲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2423', '293', '莒县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2424', '294', '泰山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2425', '294', '岱岳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2426', '294', '新泰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2427', '294', '肥城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2428', '294', '宁阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2429', '294', '东平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2430', '295', '荣成市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2431', '295', '乳山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2432', '295', '环翠区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2433', '295', '文登市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2434', '296', '潍城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2435', '296', '寒亭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2436', '296', '坊子区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2437', '296', '奎文区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2438', '296', '青州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2439', '296', '诸城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2440', '296', '寿光市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2441', '296', '安丘市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2442', '296', '高密市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2443', '296', '昌邑市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2444', '296', '临朐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2445', '296', '昌乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2446', '297', '芝罘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2447', '297', '福山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2448', '297', '牟平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2449', '297', '莱山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2450', '297', '开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2451', '297', '龙口市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2452', '297', '莱阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2453', '297', '莱州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2454', '297', '蓬莱市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2455', '297', '招远市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2456', '297', '栖霞市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2457', '297', '海阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2458', '297', '长岛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2459', '298', '市中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2460', '298', '山亭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2461', '298', '峄城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2462', '298', '台儿庄区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2463', '298', '薛城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2464', '298', '滕州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2465', '299', '张店区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2466', '299', '临淄区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2467', '299', '淄川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2468', '299', '博山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2469', '299', '周村区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2470', '299', '桓台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2471', '299', '高青县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2472', '299', '沂源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2473', '300', '杏花岭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2474', '300', '小店区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2475', '300', '迎泽区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2476', '300', '尖草坪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2477', '300', '万柏林区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2478', '300', '晋源区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2479', '300', '高新开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2480', '300', '民营经济开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2481', '300', '经济技术开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2482', '300', '清徐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2483', '300', '阳曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2484', '300', '娄烦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2485', '300', '古交市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2486', '301', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2487', '301', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2488', '301', '沁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2489', '301', '潞城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2490', '301', '长治县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2491', '301', '襄垣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2492', '301', '屯留县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2493', '301', '平顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2494', '301', '黎城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2495', '301', '壶关县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2496', '301', '长子县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2497', '301', '武乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2498', '301', '沁源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2499', '302', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2500', '302', '矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2501', '302', '南郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2502', '302', '新荣区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2503', '302', '阳高县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2504', '302', '天镇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2505', '302', '广灵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2506', '302', '灵丘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2507', '302', '浑源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2508', '302', '左云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2509', '302', '大同县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2510', '303', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2511', '303', '高平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2512', '303', '沁水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2513', '303', '阳城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2514', '303', '陵川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2515', '303', '泽州县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2516', '304', '榆次区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2517', '304', '介休市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2518', '304', '榆社县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2519', '304', '左权县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2520', '304', '和顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2521', '304', '昔阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2522', '304', '寿阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2523', '304', '太谷县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2524', '304', '祁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2525', '304', '平遥县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2526', '304', '灵石县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2527', '305', '尧都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2528', '305', '侯马市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2529', '305', '霍州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2530', '305', '曲沃县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2531', '305', '翼城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2532', '305', '襄汾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2533', '305', '洪洞县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2534', '305', '吉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2535', '305', '安泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2536', '305', '浮山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2537', '305', '古县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2538', '305', '乡宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2539', '305', '大宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2540', '305', '隰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2541', '305', '永和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2542', '305', '蒲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2543', '305', '汾西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2544', '306', '离石市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2545', '306', '离石区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2546', '306', '孝义市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2547', '306', '汾阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2548', '306', '文水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2549', '306', '交城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2550', '306', '兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2551', '306', '临县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2552', '306', '柳林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2553', '306', '石楼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2554', '306', '岚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2555', '306', '方山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2556', '306', '中阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2557', '306', '交口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2558', '307', '朔城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2559', '307', '平鲁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2560', '307', '山阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2561', '307', '应县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2562', '307', '右玉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2563', '307', '怀仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2564', '308', '忻府区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2565', '308', '原平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2566', '308', '定襄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2567', '308', '五台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2568', '308', '代县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2569', '308', '繁峙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2570', '308', '宁武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2571', '308', '静乐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2572', '308', '神池县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2573', '308', '五寨县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2574', '308', '岢岚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2575', '308', '河曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2576', '308', '保德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2577', '308', '偏关县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2578', '309', '城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2579', '309', '矿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2580', '309', '郊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2581', '309', '平定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2582', '309', '盂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2583', '310', '盐湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2584', '310', '永济市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2585', '310', '河津市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2586', '310', '临猗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2587', '310', '万荣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2588', '310', '闻喜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2589', '310', '稷山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2590', '310', '新绛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2591', '310', '绛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2592', '310', '垣曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2593', '310', '夏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2594', '310', '平陆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2595', '310', '芮城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2596', '311', '莲湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2597', '311', '新城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2598', '311', '碑林区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2599', '311', '雁塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2600', '311', '灞桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2601', '311', '未央区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2602', '311', '阎良区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2603', '311', '临潼区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2604', '311', '长安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2605', '311', '蓝田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2606', '311', '周至县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2607', '311', '户县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2608', '311', '高陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2609', '312', '汉滨区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2610', '312', '汉阴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2611', '312', '石泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2612', '312', '宁陕县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2613', '312', '紫阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2614', '312', '岚皋县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2615', '312', '平利县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2616', '312', '镇坪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2617', '312', '旬阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2618', '312', '白河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2619', '313', '陈仓区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2620', '313', '渭滨区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2621', '313', '金台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2622', '313', '凤翔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2623', '313', '岐山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2624', '313', '扶风县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2625', '313', '眉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2626', '313', '陇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2627', '313', '千阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2628', '313', '麟游县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2629', '313', '凤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2630', '313', '太白县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2631', '314', '汉台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2632', '314', '南郑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2633', '314', '城固县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2634', '314', '洋县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2635', '314', '西乡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2636', '314', '勉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2637', '314', '宁强县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2638', '314', '略阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2639', '314', '镇巴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2640', '314', '留坝县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2641', '314', '佛坪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2642', '315', '商州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2643', '315', '洛南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2644', '315', '丹凤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2645', '315', '商南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2646', '315', '山阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2647', '315', '镇安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2648', '315', '柞水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2649', '316', '耀州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2650', '316', '王益区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2651', '316', '印台区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2652', '316', '宜君县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2653', '317', '临渭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2654', '317', '韩城市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2655', '317', '华阴市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2656', '317', '华县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2657', '317', '潼关县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2658', '317', '大荔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2659', '317', '合阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2660', '317', '澄城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2661', '317', '蒲城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2662', '317', '白水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2663', '317', '富平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2664', '318', '秦都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2665', '318', '渭城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2666', '318', '杨陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2667', '318', '兴平市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2668', '318', '三原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2669', '318', '泾阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2670', '318', '乾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2671', '318', '礼泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2672', '318', '永寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2673', '318', '彬县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2674', '318', '长武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2675', '318', '旬邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2676', '318', '淳化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2677', '318', '武功县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2678', '319', '吴起县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2679', '319', '宝塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2680', '319', '延长县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2681', '319', '延川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2682', '319', '子长县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2683', '319', '安塞县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2684', '319', '志丹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2685', '319', '甘泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2686', '319', '富县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2687', '319', '洛川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2688', '319', '宜川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2689', '319', '黄龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2690', '319', '黄陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2691', '320', '榆阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2692', '320', '神木县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2693', '320', '府谷县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2694', '320', '横山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2695', '320', '靖边县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2696', '320', '定边县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2697', '320', '绥德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2698', '320', '米脂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2699', '320', '佳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2700', '320', '吴堡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2701', '320', '清涧县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2702', '320', '子洲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2703', '321', '长宁区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2704', '321', '闸北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2705', '321', '闵行区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2706', '321', '徐汇区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2707', '321', '浦东新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2708', '321', '杨浦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2709', '321', '普陀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2710', '321', '静安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2711', '321', '卢湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2712', '321', '虹口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2713', '321', '黄浦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2714', '321', '南汇区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2715', '321', '松江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2716', '321', '嘉定区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2717', '321', '宝山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2718', '321', '青浦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2719', '321', '金山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2720', '321', '奉贤区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2721', '321', '崇明县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2722', '322', '青羊区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2723', '322', '锦江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2724', '322', '金牛区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2725', '322', '武侯区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2726', '322', '成华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2727', '322', '龙泉驿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2728', '322', '青白江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2729', '322', '新都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2730', '322', '温江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2731', '322', '高新区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2732', '322', '高新西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2733', '322', '都江堰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2734', '322', '彭州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2735', '322', '邛崃市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2736', '322', '崇州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2737', '322', '金堂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2738', '322', '双流县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2739', '322', '郫县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2740', '322', '大邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2741', '322', '蒲江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2742', '322', '新津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2743', '322', '都江堰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2744', '322', '彭州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2745', '322', '邛崃市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2746', '322', '崇州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2747', '322', '金堂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2748', '322', '双流县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2749', '322', '郫县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2750', '322', '大邑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2751', '322', '蒲江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2752', '322', '新津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2753', '323', '涪城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2754', '323', '游仙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2755', '323', '江油市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2756', '323', '盐亭县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2757', '323', '三台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2758', '323', '平武县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2759', '323', '安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2760', '323', '梓潼县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2761', '323', '北川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2762', '324', '马尔康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2763', '324', '汶川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2764', '324', '理县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2765', '324', '茂县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2766', '324', '松潘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2767', '324', '九寨沟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2768', '324', '金川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2769', '324', '小金县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2770', '324', '黑水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2771', '324', '壤塘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2772', '324', '阿坝县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2773', '324', '若尔盖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2774', '324', '红原县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2775', '325', '巴州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2776', '325', '通江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2777', '325', '南江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2778', '325', '平昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2779', '326', '通川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2780', '326', '万源市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2781', '326', '达县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2782', '326', '宣汉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2783', '326', '开江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2784', '326', '大竹县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2785', '326', '渠县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2786', '327', '旌阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2787', '327', '广汉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2788', '327', '什邡市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2789', '327', '绵竹市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2790', '327', '罗江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2791', '327', '中江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2792', '328', '康定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2793', '328', '丹巴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2794', '328', '泸定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2795', '328', '炉霍县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2796', '328', '九龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2797', '328', '甘孜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2798', '328', '雅江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2799', '328', '新龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2800', '328', '道孚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2801', '328', '白玉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2802', '328', '理塘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2803', '328', '德格县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2804', '328', '乡城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2805', '328', '石渠县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2806', '328', '稻城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2807', '328', '色达县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2808', '328', '巴塘县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2809', '328', '得荣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2810', '329', '广安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2811', '329', '华蓥市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2812', '329', '岳池县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2813', '329', '武胜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2814', '329', '邻水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2815', '330', '利州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2816', '330', '元坝区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2817', '330', '朝天区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2818', '330', '旺苍县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2819', '330', '青川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2820', '330', '剑阁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2821', '330', '苍溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2822', '331', '峨眉山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2823', '331', '乐山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2824', '331', '犍为县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2825', '331', '井研县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2826', '331', '夹江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2827', '331', '沐川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2828', '331', '峨边', '3', '0');
INSERT INTO `cmf_region` VALUES ('2829', '331', '马边', '3', '0');
INSERT INTO `cmf_region` VALUES ('2830', '332', '西昌市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2831', '332', '盐源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2832', '332', '德昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2833', '332', '会理县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2834', '332', '会东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2835', '332', '宁南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2836', '332', '普格县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2837', '332', '布拖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2838', '332', '金阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2839', '332', '昭觉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2840', '332', '喜德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2841', '332', '冕宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2842', '332', '越西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2843', '332', '甘洛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2844', '332', '美姑县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2845', '332', '雷波县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2846', '332', '木里', '3', '0');
INSERT INTO `cmf_region` VALUES ('2847', '333', '东坡区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2848', '333', '仁寿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2849', '333', '彭山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2850', '333', '洪雅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2851', '333', '丹棱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2852', '333', '青神县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2853', '334', '阆中市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2854', '334', '南部县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2855', '334', '营山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2856', '334', '蓬安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2857', '334', '仪陇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2858', '334', '顺庆区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2859', '334', '高坪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2860', '334', '嘉陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2861', '334', '西充县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2862', '335', '市中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2863', '335', '东兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2864', '335', '威远县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2865', '335', '资中县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2866', '335', '隆昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2867', '336', '东  区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2868', '336', '西  区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2869', '336', '仁和区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2870', '336', '米易县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2871', '336', '盐边县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2872', '337', '船山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2873', '337', '安居区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2874', '337', '蓬溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2875', '337', '射洪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2876', '337', '大英县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2877', '338', '雨城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2878', '338', '名山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2879', '338', '荥经县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2880', '338', '汉源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2881', '338', '石棉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2882', '338', '天全县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2883', '338', '芦山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2884', '338', '宝兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2885', '339', '翠屏区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2886', '339', '宜宾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2887', '339', '南溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2888', '339', '江安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2889', '339', '长宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2890', '339', '高县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2891', '339', '珙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2892', '339', '筠连县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2893', '339', '兴文县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2894', '339', '屏山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2895', '340', '雁江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2896', '340', '简阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2897', '340', '安岳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2898', '340', '乐至县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2899', '341', '大安区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2900', '341', '自流井区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2901', '341', '贡井区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2902', '341', '沿滩区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2903', '341', '荣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2904', '341', '富顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2905', '342', '江阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2906', '342', '纳溪区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2907', '342', '龙马潭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2908', '342', '泸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2909', '342', '合江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2910', '342', '叙永县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2911', '342', '古蔺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2912', '343', '和平区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2913', '343', '河西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2914', '343', '南开区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2915', '343', '河北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2916', '343', '河东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2917', '343', '红桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2918', '343', '东丽区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2919', '343', '津南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2920', '343', '西青区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2921', '343', '北辰区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2922', '343', '塘沽区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2923', '343', '汉沽区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2924', '343', '大港区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2925', '343', '武清区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2926', '343', '宝坻区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2927', '343', '经济开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2928', '343', '宁河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2929', '343', '静海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2930', '343', '蓟县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2931', '344', '城关区', '3', '0');
INSERT INTO `cmf_region` VALUES ('2932', '344', '林周县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2933', '344', '当雄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2934', '344', '尼木县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2935', '344', '曲水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2936', '344', '堆龙德庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2937', '344', '达孜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2938', '344', '墨竹工卡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2939', '345', '噶尔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2940', '345', '普兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2941', '345', '札达县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2942', '345', '日土县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2943', '345', '革吉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2944', '345', '改则县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2945', '345', '措勤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2946', '346', '昌都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2947', '346', '江达县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2948', '346', '贡觉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2949', '346', '类乌齐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2950', '346', '丁青县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2951', '346', '察雅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2952', '346', '八宿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2953', '346', '左贡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2954', '346', '芒康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2955', '346', '洛隆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2956', '346', '边坝县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2957', '347', '林芝县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2958', '347', '工布江达县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2959', '347', '米林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2960', '347', '墨脱县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2961', '347', '波密县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2962', '347', '察隅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2963', '347', '朗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2964', '348', '那曲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2965', '348', '嘉黎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2966', '348', '比如县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2967', '348', '聂荣县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2968', '348', '安多县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2969', '348', '申扎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2970', '348', '索县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2971', '348', '班戈县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2972', '348', '巴青县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2973', '348', '尼玛县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2974', '349', '日喀则市', '3', '0');
INSERT INTO `cmf_region` VALUES ('2975', '349', '南木林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2976', '349', '江孜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2977', '349', '定日县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2978', '349', '萨迦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2979', '349', '拉孜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2980', '349', '昂仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2981', '349', '谢通门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2982', '349', '白朗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2983', '349', '仁布县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2984', '349', '康马县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2985', '349', '定结县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2986', '349', '仲巴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2987', '349', '亚东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2988', '349', '吉隆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2989', '349', '聂拉木县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2990', '349', '萨嘎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2991', '349', '岗巴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2992', '350', '乃东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2993', '350', '扎囊县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2994', '350', '贡嘎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2995', '350', '桑日县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2996', '350', '琼结县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2997', '350', '曲松县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2998', '350', '措美县', '3', '0');
INSERT INTO `cmf_region` VALUES ('2999', '350', '洛扎县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3000', '350', '加查县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3001', '350', '隆子县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3002', '350', '错那县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3003', '350', '浪卡子县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3004', '351', '天山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3005', '351', '沙依巴克区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3006', '351', '新市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3007', '351', '水磨沟区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3008', '351', '头屯河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3009', '351', '达坂城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3010', '351', '米东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3011', '351', '乌鲁木齐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3012', '352', '阿克苏市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3013', '352', '温宿县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3014', '352', '库车县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3015', '352', '沙雅县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3016', '352', '新和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3017', '352', '拜城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3018', '352', '乌什县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3019', '352', '阿瓦提县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3020', '352', '柯坪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3021', '353', '阿拉尔市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3022', '354', '库尔勒市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3023', '354', '轮台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3024', '354', '尉犁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3025', '354', '若羌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3026', '354', '且末县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3027', '354', '焉耆', '3', '0');
INSERT INTO `cmf_region` VALUES ('3028', '354', '和静县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3029', '354', '和硕县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3030', '354', '博湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3031', '355', '博乐市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3032', '355', '精河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3033', '355', '温泉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3034', '356', '呼图壁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3035', '356', '米泉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3036', '356', '昌吉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3037', '356', '阜康市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3038', '356', '玛纳斯县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3039', '356', '奇台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3040', '356', '吉木萨尔县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3041', '356', '木垒', '3', '0');
INSERT INTO `cmf_region` VALUES ('3042', '357', '哈密市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3043', '357', '伊吾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3044', '357', '巴里坤', '3', '0');
INSERT INTO `cmf_region` VALUES ('3045', '358', '和田市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3046', '358', '和田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3047', '358', '墨玉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3048', '358', '皮山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3049', '358', '洛浦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3050', '358', '策勒县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3051', '358', '于田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3052', '358', '民丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3053', '359', '喀什市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3054', '359', '疏附县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3055', '359', '疏勒县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3056', '359', '英吉沙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3057', '359', '泽普县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3058', '359', '莎车县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3059', '359', '叶城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3060', '359', '麦盖提县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3061', '359', '岳普湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3062', '359', '伽师县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3063', '359', '巴楚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3064', '359', '塔什库尔干', '3', '0');
INSERT INTO `cmf_region` VALUES ('3065', '360', '克拉玛依市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3066', '361', '阿图什市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3067', '361', '阿克陶县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3068', '361', '阿合奇县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3069', '361', '乌恰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3070', '362', '石河子市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3071', '363', '图木舒克市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3072', '364', '吐鲁番市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3073', '364', '鄯善县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3074', '364', '托克逊县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3075', '365', '五家渠市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3076', '366', '阿勒泰市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3077', '366', '布克赛尔', '3', '0');
INSERT INTO `cmf_region` VALUES ('3078', '366', '伊宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3079', '366', '布尔津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3080', '366', '奎屯市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3081', '366', '乌苏市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3082', '366', '额敏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3083', '366', '富蕴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3084', '366', '伊宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3085', '366', '福海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3086', '366', '霍城县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3087', '366', '沙湾县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3088', '366', '巩留县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3089', '366', '哈巴河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3090', '366', '托里县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3091', '366', '青河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3092', '366', '新源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3093', '366', '裕民县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3094', '366', '和布克赛尔', '3', '0');
INSERT INTO `cmf_region` VALUES ('3095', '366', '吉木乃县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3096', '366', '昭苏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3097', '366', '特克斯县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3098', '366', '尼勒克县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3099', '366', '察布查尔', '3', '0');
INSERT INTO `cmf_region` VALUES ('3100', '367', '盘龙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3101', '367', '五华区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3102', '367', '官渡区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3103', '367', '西山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3104', '367', '东川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3105', '367', '安宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3106', '367', '呈贡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3107', '367', '晋宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3108', '367', '富民县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3109', '367', '宜良县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3110', '367', '嵩明县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3111', '367', '石林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3112', '367', '禄劝', '3', '0');
INSERT INTO `cmf_region` VALUES ('3113', '367', '寻甸', '3', '0');
INSERT INTO `cmf_region` VALUES ('3114', '368', '兰坪', '3', '0');
INSERT INTO `cmf_region` VALUES ('3115', '368', '泸水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3116', '368', '福贡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3117', '368', '贡山', '3', '0');
INSERT INTO `cmf_region` VALUES ('3118', '369', '宁洱', '3', '0');
INSERT INTO `cmf_region` VALUES ('3119', '369', '思茅区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3120', '369', '墨江', '3', '0');
INSERT INTO `cmf_region` VALUES ('3121', '369', '景东', '3', '0');
INSERT INTO `cmf_region` VALUES ('3122', '369', '景谷', '3', '0');
INSERT INTO `cmf_region` VALUES ('3123', '369', '镇沅', '3', '0');
INSERT INTO `cmf_region` VALUES ('3124', '369', '江城', '3', '0');
INSERT INTO `cmf_region` VALUES ('3125', '369', '孟连', '3', '0');
INSERT INTO `cmf_region` VALUES ('3126', '369', '澜沧', '3', '0');
INSERT INTO `cmf_region` VALUES ('3127', '369', '西盟', '3', '0');
INSERT INTO `cmf_region` VALUES ('3128', '370', '古城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3129', '370', '宁蒗', '3', '0');
INSERT INTO `cmf_region` VALUES ('3130', '370', '玉龙', '3', '0');
INSERT INTO `cmf_region` VALUES ('3131', '370', '永胜县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3132', '370', '华坪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3133', '371', '隆阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3134', '371', '施甸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3135', '371', '腾冲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3136', '371', '龙陵县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3137', '371', '昌宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3138', '372', '楚雄市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3139', '372', '双柏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3140', '372', '牟定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3141', '372', '南华县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3142', '372', '姚安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3143', '372', '大姚县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3144', '372', '永仁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3145', '372', '元谋县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3146', '372', '武定县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3147', '372', '禄丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3148', '373', '大理市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3149', '373', '祥云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3150', '373', '宾川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3151', '373', '弥渡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3152', '373', '永平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3153', '373', '云龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3154', '373', '洱源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3155', '373', '剑川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3156', '373', '鹤庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3157', '373', '漾濞', '3', '0');
INSERT INTO `cmf_region` VALUES ('3158', '373', '南涧', '3', '0');
INSERT INTO `cmf_region` VALUES ('3159', '373', '巍山', '3', '0');
INSERT INTO `cmf_region` VALUES ('3160', '374', '潞西市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3161', '374', '瑞丽市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3162', '374', '梁河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3163', '374', '盈江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3164', '374', '陇川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3165', '375', '香格里拉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3166', '375', '德钦县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3167', '375', '维西', '3', '0');
INSERT INTO `cmf_region` VALUES ('3168', '376', '泸西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3169', '376', '蒙自县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3170', '376', '个旧市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3171', '376', '开远市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3172', '376', '绿春县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3173', '376', '建水县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3174', '376', '石屏县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3175', '376', '弥勒县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3176', '376', '元阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3177', '376', '红河县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3178', '376', '金平', '3', '0');
INSERT INTO `cmf_region` VALUES ('3179', '376', '河口', '3', '0');
INSERT INTO `cmf_region` VALUES ('3180', '376', '屏边', '3', '0');
INSERT INTO `cmf_region` VALUES ('3181', '377', '临翔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3182', '377', '凤庆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3183', '377', '云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3184', '377', '永德县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3185', '377', '镇康县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3186', '377', '双江', '3', '0');
INSERT INTO `cmf_region` VALUES ('3187', '377', '耿马', '3', '0');
INSERT INTO `cmf_region` VALUES ('3188', '377', '沧源', '3', '0');
INSERT INTO `cmf_region` VALUES ('3189', '378', '麒麟区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3190', '378', '宣威市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3191', '378', '马龙县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3192', '378', '陆良县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3193', '378', '师宗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3194', '378', '罗平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3195', '378', '富源县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3196', '378', '会泽县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3197', '378', '沾益县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3198', '379', '文山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3199', '379', '砚山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3200', '379', '西畴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3201', '379', '麻栗坡县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3202', '379', '马关县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3203', '379', '丘北县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3204', '379', '广南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3205', '379', '富宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3206', '380', '景洪市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3207', '380', '勐海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3208', '380', '勐腊县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3209', '381', '红塔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3210', '381', '江川县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3211', '381', '澄江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3212', '381', '通海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3213', '381', '华宁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3214', '381', '易门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3215', '381', '峨山', '3', '0');
INSERT INTO `cmf_region` VALUES ('3216', '381', '新平', '3', '0');
INSERT INTO `cmf_region` VALUES ('3217', '381', '元江', '3', '0');
INSERT INTO `cmf_region` VALUES ('3218', '382', '昭阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3219', '382', '鲁甸县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3220', '382', '巧家县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3221', '382', '盐津县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3222', '382', '大关县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3223', '382', '永善县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3224', '382', '绥江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3225', '382', '镇雄县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3226', '382', '彝良县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3227', '382', '威信县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3228', '382', '水富县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3229', '383', '西湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3230', '383', '上城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3231', '383', '下城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3232', '383', '拱墅区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3233', '383', '滨江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3234', '383', '江干区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3235', '383', '萧山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3236', '383', '余杭区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3237', '383', '市郊', '3', '0');
INSERT INTO `cmf_region` VALUES ('3238', '383', '建德市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3239', '383', '富阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3240', '383', '临安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3241', '383', '桐庐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3242', '383', '淳安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3243', '384', '吴兴区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3244', '384', '南浔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3245', '384', '德清县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3246', '384', '长兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3247', '384', '安吉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3248', '385', '南湖区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3249', '385', '秀洲区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3250', '385', '海宁市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3251', '385', '嘉善县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3252', '385', '平湖市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3253', '385', '桐乡市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3254', '385', '海盐县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3255', '386', '婺城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3256', '386', '金东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3257', '386', '兰溪市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3258', '386', '市区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3259', '386', '佛堂镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3260', '386', '上溪镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3261', '386', '义亭镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3262', '386', '大陈镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3263', '386', '苏溪镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3264', '386', '赤岸镇', '3', '0');
INSERT INTO `cmf_region` VALUES ('3265', '386', '东阳市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3266', '386', '永康市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3267', '386', '武义县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3268', '386', '浦江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3269', '386', '磐安县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3270', '387', '莲都区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3271', '387', '龙泉市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3272', '387', '青田县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3273', '387', '缙云县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3274', '387', '遂昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3275', '387', '松阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3276', '387', '云和县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3277', '387', '庆元县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3278', '387', '景宁', '3', '0');
INSERT INTO `cmf_region` VALUES ('3279', '388', '海曙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3280', '388', '江东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3281', '388', '江北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3282', '388', '镇海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3283', '388', '北仑区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3284', '388', '鄞州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3285', '388', '余姚市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3286', '388', '慈溪市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3287', '388', '奉化市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3288', '388', '象山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3289', '388', '宁海县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3290', '389', '越城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3291', '389', '上虞市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3292', '389', '嵊州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3293', '389', '绍兴县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3294', '389', '新昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3295', '389', '诸暨市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3296', '390', '椒江区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3297', '390', '黄岩区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3298', '390', '路桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3299', '390', '温岭市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3300', '390', '临海市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3301', '390', '玉环县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3302', '390', '三门县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3303', '390', '天台县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3304', '390', '仙居县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3305', '391', '鹿城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3306', '391', '龙湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3307', '391', '瓯海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3308', '391', '瑞安市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3309', '391', '乐清市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3310', '391', '洞头县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3311', '391', '永嘉县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3312', '391', '平阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3313', '391', '苍南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3314', '391', '文成县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3315', '391', '泰顺县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3316', '392', '定海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3317', '392', '普陀区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3318', '392', '岱山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3319', '392', '嵊泗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3320', '393', '衢州市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3321', '393', '江山市', '3', '0');
INSERT INTO `cmf_region` VALUES ('3322', '393', '常山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3323', '393', '开化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3324', '393', '龙游县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3325', '394', '合川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3326', '394', '江津区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3327', '394', '南川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3328', '394', '永川区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3329', '394', '南岸区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3330', '394', '渝北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3331', '394', '万盛区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3332', '394', '大渡口区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3333', '394', '万州区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3334', '394', '北碚区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3335', '394', '沙坪坝区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3336', '394', '巴南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3337', '394', '涪陵区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3338', '394', '江北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3339', '394', '九龙坡区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3340', '394', '渝中区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3341', '394', '黔江开发区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3342', '394', '长寿区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3343', '394', '双桥区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3344', '394', '綦江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3345', '394', '潼南县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3346', '394', '铜梁县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3347', '394', '大足县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3348', '394', '荣昌县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3349', '394', '璧山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3350', '394', '垫江县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3351', '394', '武隆县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3352', '394', '丰都县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3353', '394', '城口县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3354', '394', '梁平县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3355', '394', '开县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3356', '394', '巫溪县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3357', '394', '巫山县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3358', '394', '奉节县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3359', '394', '云阳县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3360', '394', '忠县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3361', '394', '石柱', '3', '0');
INSERT INTO `cmf_region` VALUES ('3362', '394', '彭水', '3', '0');
INSERT INTO `cmf_region` VALUES ('3363', '394', '酉阳', '3', '0');
INSERT INTO `cmf_region` VALUES ('3364', '394', '秀山', '3', '0');
INSERT INTO `cmf_region` VALUES ('3365', '395', '沙田区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3366', '395', '东区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3367', '395', '观塘区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3368', '395', '黄大仙区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3369', '395', '九龙城区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3370', '395', '屯门区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3371', '395', '葵青区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3372', '395', '元朗区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3374', '395', '西贡区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3375', '395', '大埔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3376', '395', '湾仔区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3377', '395', '油尖旺区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3378', '395', '北区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3379', '395', '南区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3380', '395', '荃湾区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3381', '395', '中西区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3382', '395', '离岛区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3383', '396', '澳门', '3', '0');
INSERT INTO `cmf_region` VALUES ('3384', '397', '台北', '3', '0');
INSERT INTO `cmf_region` VALUES ('3385', '397', '高雄', '3', '0');
INSERT INTO `cmf_region` VALUES ('3386', '397', '基隆', '3', '0');
INSERT INTO `cmf_region` VALUES ('3387', '397', '台中', '3', '0');
INSERT INTO `cmf_region` VALUES ('3388', '397', '台南', '3', '0');
INSERT INTO `cmf_region` VALUES ('3389', '397', '新竹', '3', '0');
INSERT INTO `cmf_region` VALUES ('3390', '397', '嘉义', '3', '0');
INSERT INTO `cmf_region` VALUES ('3391', '397', '宜兰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3392', '397', '桃园县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3393', '397', '苗栗县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3394', '397', '彰化县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3395', '397', '南投县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3396', '397', '云林县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3397', '397', '屏东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3398', '397', '台东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3399', '397', '花莲县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3400', '397', '澎湖县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3401', '3', '合肥', '2', '0');
INSERT INTO `cmf_region` VALUES ('3402', '3401', '庐阳区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3403', '3401', '瑶海区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3404', '3401', '蜀山区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3405', '3401', '包河区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3406', '3401', '长丰县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3407', '3401', '肥东县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3408', '3401', '肥西县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3411', '174', '绥阳', '3', '0');
INSERT INTO `cmf_region` VALUES ('3413', '173', '西林路', '3', '0');
INSERT INTO `cmf_region` VALUES ('3414', '168', '泰康', '3', '0');
INSERT INTO `cmf_region` VALUES ('3415', '173', '集贤县', '3', '0');
INSERT INTO `cmf_region` VALUES ('3416', '173', '垦区', '3', '0');
INSERT INTO `cmf_region` VALUES ('3417', '169', '加格达奇', '3', '0');

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cmf_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');
INSERT INTO `cmf_role` VALUES ('3', '0', '1', '0', '0', '0', '用户管理员', '用户管理');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------
INSERT INTO `cmf_role_user` VALUES ('1', '2', '12');
INSERT INTO `cmf_role_user` VALUES ('2', '2', '13');
INSERT INTO `cmf_role_user` VALUES ('3', '3', '72');
INSERT INTO `cmf_role_user` VALUES ('4', '1', '323');
INSERT INTO `cmf_role_user` VALUES ('6', '1', '1');

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------
INSERT INTO `cmf_route` VALUES ('69', '5000', '1', '2', 'portal/List/index?id=1', 'bulletin');
INSERT INTO `cmf_route` VALUES ('70', '4999', '1', '2', 'portal/Article/index?cid=1', 'bulletin/:id');
INSERT INTO `cmf_route` VALUES ('71', '5000', '1', '2', 'portal/List/index?id=2', 'news');
INSERT INTO `cmf_route` VALUES ('72', '4999', '1', '2', 'portal/Article/index?cid=2', 'news/:id');
INSERT INTO `cmf_route` VALUES ('78', '4999', '1', '2', 'portal/search/index', 'search');
INSERT INTO `cmf_route` VALUES ('83', '5000', '1', '2', 'portal/List/index?id=3', 'help');
INSERT INTO `cmf_route` VALUES ('84', '4999', '1', '2', 'portal/Article/index?cid=3', 'help/:id');
INSERT INTO `cmf_route` VALUES ('85', '5000', '1', '2', 'portal/Page/index?id=9', 'aboutus');
INSERT INTO `cmf_route` VALUES ('86', '4999', '1', '2', 'portal/detail/index', 'detail/:id');
INSERT INTO `cmf_route` VALUES ('87', '4999', '1', '2', 'portal/guestbook/index', 'guestbook');
INSERT INTO `cmf_route` VALUES ('88', '10000', '1', '1', 'portal/search/index8', 'search8');

-- ----------------------------
-- Table structure for cmf_shensu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shensu`;
CREATE TABLE `cmf_shensu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `user_id` int(8) NOT NULL,
  `create_time` int(10) NOT NULL,
  `style` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shensu
-- ----------------------------
INSERT INTO `cmf_shensu` VALUES ('59', '9', '3', '1559184210', '订单提早点击完成', '用户没有接单直接点了完成', '1');
INSERT INTO `cmf_shensu` VALUES ('60', '7', '3', '1559185979', '实际水平与描述不符', '水平不高 ', '1');
INSERT INTO `cmf_shensu` VALUES ('61', '36', '11', '1559204978', '实际水平与描述不符', '不想要了，就这么简单', '1');
INSERT INTO `cmf_shensu` VALUES ('62', '62', '11', '1559537740', '订单提早点击完成', '1', '1');
INSERT INTO `cmf_shensu` VALUES ('63', '102', '56', '1569724832', '实际水平与描述不符', '415656', '1');

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('2', '1', '0', '首页幻灯片', '首页幻灯片');

-- ----------------------------
-- Table structure for cmf_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cmf_slide_item
-- ----------------------------
INSERT INTO `cmf_slide_item` VALUES ('1', '2', '1', '10000', '1', 'admin/20190407/7576da52cdf6f9702249394dc88f2a8d.jpg', 'http://peiwan.wdzxiu.com/detail/18.html', '', '', '', null);
INSERT INTO `cmf_slide_item` VALUES ('2', '2', '1', '10000', '2', 'admin/20191112/c5b206156d2faade96e3c6635941c125.png', '#', '', '', '', null);

-- ----------------------------
-- Table structure for cmf_theme
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
INSERT INTO `cmf_theme` VALUES ('19', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for cmf_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '操作',
  `file` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '模板文件描述',
  `more` text CHARACTER SET utf8 COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text CHARACTER SET utf8 COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text CHARACTER SET utf8 COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------
INSERT INTO `cmf_theme_file` VALUES ('111', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', null);

-- ----------------------------
-- Table structure for cmf_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=739 DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_third_party_user
-- ----------------------------
INSERT INTO `cmf_third_party_user` VALUES ('738', '40', '1561624637', '0', '1561624637', '0', '1', '', '', '', '', '', '7EF2DD7DABA031995262FB41A57A346D', 'QQ', null);

-- ----------------------------
-- Table structure for cmf_tixian
-- ----------------------------
DROP TABLE IF EXISTS `cmf_tixian`;
CREATE TABLE `cmf_tixian` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `jine` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bank` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `bankcard` varchar(100) NOT NULL DEFAULT '',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `txstatus` int(2) NOT NULL DEFAULT '0',
  `tixian_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_tixian
-- ----------------------------
INSERT INTO `cmf_tixian` VALUES ('61', '20', '99.00', '3', '2132213213213', '恩恩恩', '1', '1563677375');
INSERT INTO `cmf_tixian` VALUES ('62', '2', '5.94', '3', '1221212', '去去去', '1', '1568530677');
INSERT INTO `cmf_tixian` VALUES ('63', '2', '4.95', '3', '1221212', '去去去', '1', '1568530735');
INSERT INTO `cmf_tixian` VALUES ('64', '55', '495.00', '3', '45454', '爱谁', '1', '1569725697');

-- ----------------------------
-- Table structure for cmf_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL DEFAULT '',
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员3:陪玩',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar/headicon.png' COMMENT '用户头像',
  `avatar_shenhe` varchar(255) NOT NULL DEFAULT '',
  `avatar1` varchar(255) NOT NULL DEFAULT '',
  `avatar2` varchar(255) NOT NULL DEFAULT '',
  `avatar3` varchar(255) NOT NULL DEFAULT '',
  `avatar4` varchar(255) NOT NULL DEFAULT '',
  `bgimg` varchar(255) NOT NULL DEFAULT 'default/bg.jpg',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `xingming` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `qq` varchar(200) DEFAULT NULL,
  `weixin` varchar(100) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `province` smallint(5) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `birthday` int(11) DEFAULT NULL,
  `gexing` varchar(100) DEFAULT NULL,
  `jieshao` varchar(255) DEFAULT NULL,
  `yuyin` varchar(255) DEFAULT NULL,
  `jiedan` int(10) NOT NULL DEFAULT '0',
  `meili` int(10) NOT NULL DEFAULT '0',
  `gongxian` int(10) NOT NULL DEFAULT '0',
  `guild` int(5) NOT NULL DEFAULT '0',
  `guild_reason` text,
  `guild_status` int(1) NOT NULL DEFAULT '0',
  `shenhe` tinyint(1) NOT NULL DEFAULT '0',
  `renzheng` int(1) NOT NULL DEFAULT '0',
  `tags` varchar(100) NOT NULL DEFAULT '',
  `tuijian` int(1) NOT NULL DEFAULT '0',
  `level` mediumint(8) NOT NULL DEFAULT '1',
  `gaimingka` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
INSERT INTO `cmf_user` VALUES ('1', '', '1', '0', '1590548201', '0', '0', '1508294909', '1', 'admin', '###5393294fb1b0802910eb6075ebe28886', '123@123.com', '', '', '', '', '', '', 'default/bg.jpg', '192.168.0.152', '', '', null, null, '0', '0', '0', '0', '', null, '', '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('2', '3333333', '3', '2', '1573489916', '57', '0', '1508828496', '1', 'ceshi', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20190412/b0bf3f618bfdd70abaea83bfeb4669d0.jpeg', '', '', '', '', '', 'default/bg.jpg', '113.250.232.93', '', '18562530020', '1233132321', 'aaassa', '77', '6', '706', '1556208000', '59,64,70', 'asdadsdas', '', '1', '15100', '19100', '1', '申请加入', '1', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('3', '', '2', '2', '1573449568', '0', '0', '1536384043', '1', 'root', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/20190720/46e36f4bc3a303c23a74a0f9b60187e7.jpg', '', 'default/20190712/386714d01c8736ce73854e832f546bf3.jpg', 'default/20190805/87410a5cada709aafb52332b5dc8829e.jpg', 'default/20190712/386714d01c8736ce73854e832f546bf3.jpg', 'default/20190805/3a1e62b8b1edba4ee9e0065d0ec3b86a.png', 'default/bg.jpg', '122.4.66.60', '', '1560876', '22211', 'aaassa', '36', '3', '400', '-28800', '58', null, '/upload/default/20190809/83afbd69ee1054fc2a360112816203e3.mp3', '0', '600', '10500', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('4', '', '3', '1', '1564837900', '57', '0', '1508828496', '1', 'ceshi1', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '', '', '', '', '', 'default/bg.jpg', '223.80.239.246', '', '18562530020', '', null, '87', '6', '790', '1026734829', '58,59', null, '', '0', '2', '0', '0', '', '0', '1', '1', '', '1', '5', '1');
INSERT INTO `cmf_user` VALUES ('5', '', '3', '2', '1554110593', '57', '0', '1508828496', '1', 'ceshi2', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '', '', '', '', '', 'default/bg.jpg', '122.4.66.81', '', '18562530020', '', null, '87', '6', '790', '1026734829', '59,60', null, '', '0', '0', '0', '0', '', '0', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('6', '', '3', '2', '1554110593', '57', '0', '1508828496', '1', 'ceshi3', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '', '', '', '', '', 'default/bg.jpg', '122.4.66.81', '', '18562530020', '', null, '87', '6', '790', '1026734829', '60,61', 'adsdasdasdasdsa', '', '0', '0', '0', '0', '', '0', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('7', '', '3', '2', '1554110593', '57', '0', '1508828496', '1', 'ceshi4', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '', '', '', '', '', 'default/bg.jpg', '122.4.66.81', '', '18562530020', '', null, '87', '6', '790', '1026734829', '62,63,64', null, '', '0', '0', '0', '0', '', '0', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('8', '', '3', '2', '1556022707', '57', '0', '1508828496', '1', 'ceshi5', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20180913/8ebfaee638224af6d27ddf813d06b78d.png', '', '', '', '', '', 'default/bg.jpg', '223.80.239.176', '', '18562530020', '', null, '87', '6', '790', '1026734829', '65,66,63', null, '', '0', '0', '0', '0', '', '0', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('9', '', '3', '2', '1555243435', '0', '0', '1554814743', '1', 'ceshi22', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '223.80.236.30', null, '15876655445', '123456', null, '37', '3', '410', '478713600', '57,62,67', null, '', '0', '200', '0', '0', '', '0', '1', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('10', '', '2', '0', '1559217620', '0', '0', '1555655345', '1', 'taotao', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '111.60.192.21', null, '15272474995', null, null, null, null, null, null, null, null, '', '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('11', '888888', '3', '1', '1564716429', '0', '0', '1555854812', '1', '叫我爸爸好么？', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20190716/3c55adcc74d36ee3a12467cbd2ca5e09.png', '', '', '', '', '', '/upload/avatar/20190716/693e151bf8b9abb4042ccb26a0ec2441.jpg', '122.4.67.216', null, '15272447781', '888888', '', '63', '5', '612', '4032000', '62,63,67', '很高兴为你服务', 'default/20190528/5ad1defb803684be732693460c18d1ef.mp3', '0', '8000', '3900', '2', '申请', '0', '1', '0', '', '0', '1', '0');
INSERT INTO `cmf_user` VALUES ('12', '', '2', '0', '1566468631', '0', '0', '1555897695', '1', 'ceshi66', '###6497b9363c08f6b2732d0ffe22cd622b', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '113.116.37.106', null, '13430843034', null, null, null, null, null, null, null, null, '', '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('14', '', '2', '0', '1556192233', '0', '0', '1556192233', '2', 'ceshi11', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '223.80.236.34', null, '15876655447', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('15', '', '2', '0', '1559460265', '0', '0', '1557475303', '1', '111111', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '118.206.185.129', null, '13411111111', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('16', '', '2', '0', '1558140414', '0', '0', '1558140414', '1', '372188486', '###ed7e01decb7ee10f16b97cd04059e6a6', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '111.58.9.122', null, '13558495344', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('17', '', '3', '2', '1569818868', '0', '0', '1558278213', '1', 'taotao9', '###1d2c907e48c2fa5edd4c08dced4cc6d0', '', 'default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '', '', '', '', '', 'default/bg.jpg', '27.26.146.253', null, '15272474991', '123456', null, '186', '13', '1587', '-28800', '57,63,68', null, 'default/20190519/aba6f438d80901056ab692a384620aee.mp3', '0', '2300', '0', '1', '', '0', '1', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('18', '', '3', '2', '1564812552', '0', '0', '1558364734', '1', 'taotao10', '###fc967a0ab1c3d27209c85e0177e3f991', '', 'default/20190520/25236e64ff6e143f277ef6404d689741.jpg', '', '', '', '', '', 'default/bg.jpg', '27.26.151.211', null, '15272474999', '888888', '', '65', '5', '626', '-28800', '63,67,68', '我很不开心啊', 'default/20190520/f256070821807ae81f2ecca48902d693.mp3', '0', '100', '0', '0', '', '0', '1', '0', '', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('20', '2222222', '3', '2', '1573622492', '0', '0', '1559007161', '1', 'root2', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/20190722/f56542d63a66399b141ce1c36c3608dd.gif', '', 'default/20190712/87a59626cae0d0331c4fef38470bedf2.jpg', 'default/20190712/c1d4938049c790371940569f61803ac4.jpg', 'default/20190712/f3398724d91676e80d4fe612cb72812e.jpg', 'default/20190712/af34feba62735ed6d52f0a8bfd3256d4.jpg', '/upload/avatar/20190713/18e48d3bd12cd3c628c1b22e468649fd.jpg', '27.26.145.16', null, '111111111', '112123', 'aaassa', '55', '4', '538', '-28800', '57,62,67', '', 'default/20190528/dd0527fa2985954ccca5c9b5a115840c.mp3', '1', '1400', '7500', '1', '', '1', '1', '1', '上分首选', '1', '1', '0');
INSERT INTO `cmf_user` VALUES ('21', '', '2', '2', '1559460807', '0', '0', '1559030304', '1', 'taotao12', '###5c76b55597499f5ce7829dee32ac6702', '', 'avatar/20190529/e51edbaa849f0ff71e9cf3213c0d6a3c.jpg', '', '', '', '', '', 'default/bg.jpg', '118.206.185.129', null, '15272474990', '12654', null, '57', '4', '558', '-28800', '62,67,68', null, 'default/20190528/851535d709732f63c710135268dd38ea.mp3', '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('22', '', '2', '2', '1559094754', '0', '0', '1559094754', '1', '26341012', '###b5bc291d7e14c438124af61f7327ba18', '', 'default/20190529/9b307a055f70c347e55fde048775018c.jpg', '', '', '', '', '', 'default/bg.jpg', '14.30.14.164', null, '18679646228', '26341012', null, '77', '6', '705', '-28800', '57,58,62', null, 'https://www.missevan.com/sound/player?album=373013', '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('23', '', '3', '2', '1559460300', '0', '0', '1559108387', '1', 'ceshi8', '###b76bb265a6605f32a803245b017e8665', '', 'default/20190530/e5252c5870ce103a21678d1ef525f1c6.jpg', '', '', '', '', '', 'default/bg.jpg', '118.206.185.129', null, '15272474998', '12345', null, '80', '6', '748', '333648000', '63,65,68', null, 'default/20190529/e7f1f3d63f8d420fcfdecca7f58d4d0e.mp3', '0', '18200', '0', '0', '', '0', '1', '0', '单身可撩', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('25', '', '2', '0', '1559720877', '0', '0', '1559719807', '1', 'yonghu', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '122.4.66.81', null, '18536520020', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('26', '', '3', '2', '1560138544', '0', '0', '1560138544', '1', '李沅', '###18e9fc15e919b49e6e0fc82c74eba5e3', '', 'default/20190610/1498efa5fb2a7258b694bda9b24dc92d.jpg', '', '', '', '', '', 'default/bg.jpg', '117.83.90.159', null, '18859601768', '3222698840', null, '221', '16', '1851', '955555200', '61,63,64', null, 'halo', '0', '200', '0', '0', '', '0', '1', '1', '神仙姐姐', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('27', '', '2', '0', '1560256371', '0', '0', '1560256371', '1', 'aa192', '###90e34e82719602d8ccfcdd8affc2ba96', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '123.129.136.75', null, '13062067123', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('28', '', '2', '0', '1560347535', '0', '0', '1560347535', '1', 'ceshi123', '###90e34e82719602d8ccfcdd8affc2ba96', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '27.215.116.186', null, '13062067111', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('29', '', '2', '0', '1560394531', '0', '0', '1560394531', '1', 'test', '###1294c113ed7cb2ebf1d14fd33a96edc2', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '59.34.153.231', null, '13622600017', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('30', '', '2', '0', '1560431784', '0', '0', '1560431784', '1', 'ceshi111', '###d9ab0e0bfc5a32451abfbbee57b1e8d4', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '27.215.116.186', null, '13606067211', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('31', '', '2', '0', '1560575901', '0', '0', '1560575901', '1', 'ceshivvvvvvvv', '###d9ab0e0bfc5a32451abfbbee57b1e8d4', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '112.248.223.74', null, '13062067211', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('32', '', '2', '0', '1560713441', '0', '0', '1560613681', '1', '15968866574', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '114.102.167.49', null, '15968866574', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('33', '22222', '3', '1', '1563639827', '0', '0', '1560672895', '0', 'xie56879', '###b4859bdf4f24cbcfb4253b510b9813a3', '', 'default/20190708/7ddb700d56876aef2142d88e451d88d7.jpg', '', '', '', '', '', '/upload/avatar/20190714/a799a44fdf1d8b52830e37fa59625d1e.png', '122.247.156.204', null, '13858360075', '1231321321', '', '63', '5', '613', '-28800', '57,58,62', 'dasdsadasdsa', 'default/20190708/c079a3ef2cf2706ab508a34926cd4e6d.mp3', '0', '0', '0', '0', '', '0', '0', '0', '大众男神', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('34', '', '2', '0', '1561906387', '0', '0', '1561343456', '2', 'ly83256', '###b5bc291d7e14c438124af61f7327ba18', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '117.62.123.192', null, '18361979999', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('35', '', '2', '0', '1561472139', '0', '0', '1561472139', '1', 'kakoo', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '117.143.45.30', null, '13641737183', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('36', '', '2', '0', '1561514058', '0', '0', '1561514058', '2', '汪汪汪', '###a6ca7cabe624d06dff963f53e84757a7', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '59.175.84.121', null, '18616837388', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('39', '', '2', '0', '1564716252', '0', '0', '1561624300', '1', 'aaa', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '122.4.67.216', null, '15806548161', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('40', '', '0', '0', '1561624637', '0', '0', '1561624637', '2', '美工接单网', '###d65a2f4a5ebc44a82ac574bd33fac9f3', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '122.4.67.67', '', '', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('41', '', '2', '0', '1561784373', '0', '0', '1561784373', '1', 'asjk', '###2f6c400450bc51cf998d7c7e24ee6a75', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '112.12.186.219', null, '13122022169', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('42', '', '2', '0', '1562033631', '0', '0', '1562033631', '2', 'qqq111', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '134.159.114.82', null, '13111122222', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('43', '', '2', '0', '1562137117', '0', '0', '1562137117', '1', 'aden', '###fbbab2c7761a878204405dcb05da0302', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '120.85.112.85', null, '18824116230', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('44', '', '2', '0', '1562145645', '0', '0', '1562143857', '1', '猫街少女梦', '###83cc3f2fa655866811f35501de32d85a', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '183.11.72.2', null, '13530603273', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', '', '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('45', '100045', '2', '0', '1562725765', '0', '0', '1562725765', '2', '123', '###96c811ce6d826286159f24481adfcb2f', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '113.110.234.135', null, '13111111111', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('46', '100046', '3', '2', '1572262928', '0', '0', '1563863088', '1', '12345', '###d2cf204089d02b5f7af3917c52d4470d', '', 'avatar/20190723/702bec0dbc0555166d62c3f0143fbb26.png', '', 'default/20190723/e8527cdee08e3e2947482979a7902858.jpg', 'default/20190723/0fdb475b9ba082248560141e7f297a77.png', 'default/20190723/f7ff33f6e7882404d53409e78b9d06fd.jpg', '', 'default/bg.jpg', '211.162.218.147', null, '15680118721', '888888', null, '52', '2', '500', '-28800', '57,62,67', null, 'default/20190723/569e46c63fcb74f7c69be73d3c81f25d.mp3', '0', '0', '100', '0', null, '0', '1', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('47', '100047', '2', '0', '1573449228', '0', '0', '1564975563', '1', 'root1', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '122.4.66.60', null, '15806548888', null, null, null, null, null, null, null, null, null, '0', '0', '5600', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('48', '100048', '2', '0', '1572926426', '0', '0', '1566368017', '2', 'cbing', '###78193fdf644c9b4798bd0549d3993519', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '58.19.22.35', null, '15527344177', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('49', '100049', '2', '0', '1566368803', '0', '0', '1566368792', '1', '陈阳', '###b67e4fdd93a4938ee136b56401a82f17', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '183.94.137.215', null, '13296690572', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('50', '100050', '2', '0', '1567072871', '0', '0', '1567071121', '1', 'fengjisheng', '###9d50533ee7d45d6c674856c8fc38cbbe', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '116.209.54.16', null, '18672680823', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('51', '100051', '2', '0', '1567169674', '0', '0', '1567169674', '2', '93516660', '###3ab2790d1bec1cf12a8208fdb63765cf', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '118.116.115.153', null, '17808166463', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('52', '100052', '2', '0', '1567400036', '0', '0', '1567400036', '2', 'asd2288', '###efa2bd14e08a9eebcd852f0131242fa5', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '14.144.60.131', null, '13058829394', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('53', '100053', '2', '0', '1569274112', '0', '0', '1569274049', '2', '12345678911', '###a1b760cc6784495b3b88d7428fdbcafe', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '218.18.78.55', null, '18927789487', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('54', '100054', '2', '0', '1569317303', '0', '0', '1569317303', '1', 'jiaolian', '###7ae19c4ea25a541c54a32d62cfbf8f86', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '36.104.199.150', null, '18843112039', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('55', '100055', '3', '2', '1569723965', '0', '0', '1569722643', '1', 'yxcker', '###df53e8fa13fcac6b97d5fe17754474ca', '', 'avatar/20190929/60c27d1d37201c4a528330302a569854.jpg', '', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'default/bg.jpg', '222.182.59.15', null, '15723009030', '123456', null, '64', '5', '618', '-28800', '57,62,63', null, 'default/20190929/fd9cd3bf1b2318adaa12485ab09fb590.mp3', '2', '2400', '0', '3', '456465', '1', '1', '1', '古灵精怪', '1', '1', '1');
INSERT INTO `cmf_user` VALUES ('56', '100056', '2', '0', '1569724306', '0', '0', '1569724306', '1', 'yxcker1', '###df53e8fa13fcac6b97d5fe17754474ca', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '222.182.59.15', null, '15868619261', null, null, null, null, null, null, null, null, null, '0', '0', '1800', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('58', '100058', '3', '2', '1570162379', '0', '0', '1570162379', '2', '18361974966', '###4137e21dc95f080319771b245b5ed254', '', 'avatar/headicon.png', '', 'default/20191004/c9de55e79e3a74212972f2f2da0f4545.jpg', 'default/20191004/06f92cb3b627d7ed6eb6aaf2c54a932c.jpg', 'default/20191004/63fc6aaf8fed740a2c0a6e1df5681325.jpg', '', 'default/bg.jpg', '121.224.17.30', null, '18361974966', '54664888', null, '66', '5', '633', '-28800', '', null, '/upload/default/20191004/e47d0e580a5fdd8f7d16b4dbee0f3912.mp3', '0', '0', '0', '0', null, '0', '0', '1', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('59', '100059', '2', '0', '1571230411', '0', '0', '1571230411', '2', '15021288172', '###113799cddaab1d7ea5a758d26918a817', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '113.222.50.186', null, '15021288172', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('60', '100060', '2', '0', '1571707481', '0', '0', '1571707481', '1', '41516620@qq.com', '###3d9a09651428806226e3eb0d381a570a', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '110.83.48.211', null, '18850410656', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('61', '100061', '2', '0', '1572879787', '0', '0', '1572877878', '1', 'dxyaozi', '###5e8bb614703482631c5c63fd45c26ecb', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '122.231.208.233', null, '15558159796', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('62', '100062', '2', '0', '1572949445', '0', '0', '1572949445', '1', '咱低调', '###0fb09913a2b98e404ec60958d52bc3ed', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '117.95.204.88', null, '17778779099', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('63', '100063', '2', '0', '1573030858', '0', '0', '1573026316', '2', '18301021416', '###a3ddb957f49eec83d89df1d8eb56ef44', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '117.179.105.207', null, '18301021416', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('64', '100064', '2', '0', '1573030561', '0', '0', '1573030561', '2', '123123', '###115c30917380ca62c4074486034ba4db', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '117.157.102.63', null, '18794885055', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('65', '100065', '2', '2', '1573291659', '0', '0', '1573291659', '2', 'heifengye', '###36420ad2c331a295fb67d7884216c00c', '', 'avatar/headicon.png', '', 'default/20191109/c4d4a9861046445193c2067c81479424.jpg', 'default/20191109/c4d4a9861046445193c2067c81479424.jpg', 'default/20191109/c4d4a9861046445193c2067c81479424.jpg', '', 'default/bg.jpg', '113.250.239.167', null, '15320777774', '81474548', null, '394', '32', '3335', '1573228800', '', null, '/upload/default/20191109/b80bb040507a8e28909d75f20a40e6e5.mp3', '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');
INSERT INTO `cmf_user` VALUES ('66', '100066', '2', '0', '1577449438', '0', '0', '1577449438', '1', '52jscn', '###a6737bc0b17f6db9635cd131274b5c7a', '', 'avatar/headicon.png', '', '', '', '', '', 'default/bg.jpg', '127.0.0.1', null, '15588285160', null, null, null, null, null, null, null, null, null, '0', '0', '0', '0', null, '0', '0', '0', '', '0', '1', '1');

-- ----------------------------
-- Table structure for cmf_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of cmf_user_action
-- ----------------------------
INSERT INTO `cmf_user_action` VALUES ('1', '100', '0', '0', '1', '0', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for cmf_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_jineng
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_jineng`;
CREATE TABLE `cmf_user_jineng` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `pic` varchar(100) DEFAULT NULL,
  `cat_id` int(3) NOT NULL DEFAULT '0',
  `level` int(3) NOT NULL DEFAULT '0',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shichang` int(10) NOT NULL DEFAULT '0',
  `dis9` int(5) NOT NULL DEFAULT '0',
  `dis8` int(5) NOT NULL DEFAULT '0',
  `dis7` int(5) NOT NULL DEFAULT '0',
  `dis_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_jineng
-- ----------------------------
INSERT INTO `cmf_user_jineng` VALUES ('2', '4', '1', 'default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg', '1', '10', '8.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('3', '5', '1', 'default/20190405/84efe65d191dde0569e5833be02a2473.jpeg', '2', '15', '20.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('4', '6', '1', 'default/20190405/7f2d5139b9f211ab58d5728299f30000.jpeg', '2', '16', '8.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('5', '7', '1', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '2', '16', '30.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('6', '8', '1', 'default/20190405/84efe65d191dde0569e5833be02a2473.jpeg', '3', '19', '40.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('7', '6', '1', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '3', '19', '90.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('14', '9', '1', 'avatar/headicon.png', '6', '42', '20.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('15', '2', '1', 'default/20190405/8d784b98b76a3ffe51b538812c73f1f5.jpeg', '5', '38', '12.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('16', '11', '1', 'default/20190421/640b54a13d1058d5f2fac8d8d55ef610.jpg', '7', '48', '1.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('17', '11', '1', 'default/20190422/caa12a06afa085fea27c69bc8e3519ad.jpg', '1', '9', '5.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('18', '11', '1', 'default/20190422/caa12a06afa085fea27c69bc8e3519ad.jpg', '5', '35', '20.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('21', '11', '1', 'default/20190507/2a3108155aab53f30669ccf00c5c60a7.jpg', '2', '14', '30.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('22', '11', '1', 'default/20190515/64791829b03ecbc791fed7f104f12d93.jpg', '8', '50', '20.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('23', '17', '1', 'default/20190519/dc50cb6c197fb607fa56ca55b003ed2c.jpeg', '7', '46', '1.00', '2', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('25', '18', '1', 'default/20190520/25236e64ff6e143f277ef6404d689741.jpg', '1', '9', '80.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('28', '18', '1', 'default/20190520/25236e64ff6e143f277ef6404d689741.jpg', '5', '35', '29.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('29', '11', '1', 'default/20190526/845e985d9e108b580c1bebf595a38b7e.jpg', '4', '30', '8.00', '0', '2', '3', '4', '0');
INSERT INTO `cmf_user_jineng` VALUES ('48', '20', '1', 'avatar/headicon.png', '1', '9', '11.00', '1', '2', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('49', '20', '1', 'default/20190528/44644ea451bab7eb1faf8b86b65378de.jpg', '2', '14', '20.00', '3', '2', '3', '4', '0');
INSERT INTO `cmf_user_jineng` VALUES ('53', '23', '1', 'default/20190530/e5252c5870ce103a21678d1ef525f1c6.jpg', '7', '48', '12.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('87', '26', '1', 'default/20190610/1498efa5fb2a7258b694bda9b24dc92d.jpg', '7', '46', '8.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('89', '33', '1', 'default/20190708/7ddb700d56876aef2142d88e451d88d7.jpg', '5', '41', '60.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('90', '33', '1', 'default/20190709/a6ceaa53592e1d325f6343ad80455ad3.jpg', '1', '9', '5.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('91', '2', '1', 'default/20190410/0fb4f4129b4d72bdd8f7d069e77547ea.jpeg', '1', '9', '11.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('92', '20', '1', 'default/20190405/bd19a47663c54fa45cabdd40342945bc.jpeg', '3', '18', '10.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('96', '46', '1', 'default/20190723/cf829986747cd15b28d0c180538d17c7.jpg', '5', '37', '11.00', '0', '3', '6', '12', '0');
INSERT INTO `cmf_user_jineng` VALUES ('97', '2', '1', '/upload/avatar/20190915/3278cde1849922182d9630013bdef6f7.jpeg', '6', '43', '2.00', '0', '2', '3', '5', '0');
INSERT INTO `cmf_user_jineng` VALUES ('98', '2', '1', '/upload/avatar/20190915/6d0bf9e188d8db5fd8dbc1fbd59c28cf.jpeg', '4', '31', '10.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('99', '46', '2', '/upload/avatar/20190922/1ae6d7f304fceecc411ddec8fc8d2de4.jpg', '1', '9', '0.00', '0', '0', '0', '0', '0');
INSERT INTO `cmf_user_jineng` VALUES ('100', '55', '1', 'default/20190929/6b5ee5e15a179bf90f1beb05be25b3b8.jpg', '5', '38', '10.00', '2', '3', '4', '5', '0');
INSERT INTO `cmf_user_jineng` VALUES ('101', '58', '2', '', '1', '10', '0.00', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cmf_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of cmf_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_moneyinfo
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_moneyinfo`;
CREATE TABLE `cmf_user_moneyinfo` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `yue` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shouru` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bank` varchar(100) NOT NULL DEFAULT '',
  `bankcard` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `idnum_z` varchar(255) NOT NULL DEFAULT '',
  `idnum_f` varchar(255) NOT NULL DEFAULT '',
  `zhifubao` varchar(100) NOT NULL DEFAULT '',
  `shenhe` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_moneyinfo
-- ----------------------------
INSERT INTO `cmf_user_moneyinfo` VALUES ('1', '2', '9889.00', '0.00', '3', '1221212', '121212', '去去去', '/upload/avatar/20190915/185dd957c321748b439373c613ab6eed.jpeg', '/upload/avatar/20190915/153e7d3d6d07bbf4883450d99cf245b2.jpeg', '', '1');
INSERT INTO `cmf_user_moneyinfo` VALUES ('2', '3', '3.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('3', '4', '57.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('4', '5', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('5', '6', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('6', '7', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('7', '8', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('8', '9', '1.80', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('9', '10', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('10', '11', '15.60', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('11', '12', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('12', '1', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('13', '15', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('14', '16', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('15', '17', '7.55', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('16', '18', '0.60', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('17', '19', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('18', '20', '70.00', '0.00', '3', '2132213213213', '21213321213213', '恩恩恩', 'default/20190721/3f12267331dbbef233100bb9e990e0c9.jpg', 'default/20190721/3f12267331dbbef233100bb9e990e0c9.jpg', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('19', '21', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('20', '22', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('21', '23', '1000108.20', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('22', '25', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('23', '27', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('24', '28', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('25', '29', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('26', '30', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('27', '31', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('28', '32', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('29', '34', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('30', '39', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('31', '41', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('32', '42', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('33', '43', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('34', '33', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('35', '46', '11111000.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('36', '47', '1.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('37', '50', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('38', '54', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('39', '55', '20.40', '0.00', '3', '45454', '545645646', '爱谁', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', 'default/20190929/9d3780f067e7d5529a2adfe22e7511de.jpg', '', '1');
INSERT INTO `cmf_user_moneyinfo` VALUES ('40', '56', '962.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('41', '61', '0.00', '0.00', '', '', '', '', '', '', '', '0');
INSERT INTO `cmf_user_moneyinfo` VALUES ('42', '62', '0.00', '0.00', '', '', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for cmf_user_moneyrecord
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_moneyrecord`;
CREATE TABLE `cmf_user_moneyrecord` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL,
  `style` varchar(200) CHARACTER SET utf8 NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `pay_time` int(10) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_moneyrecord
-- ----------------------------
INSERT INTO `cmf_user_moneyrecord` VALUES ('9', '3', '支出', '10.00', '1555676993', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('10', '3', '支出', '10.00', '1555677071', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('11', '3', '支出', '20.00', '1555686275', '5', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('12', '2', '收入', '20.00', '1555686550', '5', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('13', '2', '提现', '6.00', '1555771202', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('14', '11', '支出', '1.00', '1555914551', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('15', '11', '支出', '6.00', '1555914569', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('16', '11', '支出', '20.00', '1555914792', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('17', '11', '支出', '1.00', '1555915643', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('18', '3', '支出', '20.00', '1555917692', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('19', '2', '收入', '10.00', '1555917746', '4', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('20', '3', '支出', '1.00', '1555917936', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('21', '11', '支出', '1.00', '1555992408', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('22', '11', '支出', '1.00', '1555992445', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('23', '3', '提现', '10.00', '1555992747', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('24', '3', '支出', '24.00', '1556196581', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('25', '3', '支出', '12.00', '1556196674', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('26', '3', '支出', '10.00', '1556258830', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('27', '3', '支出', '6.00', '1556298923', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('28', '3', '支出', '20.00', '1556358949', '7', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('29', '3', '支出', '12.00', '1556414521', '9', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('30', '3', '支出', '10.00', '1556440308', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('31', '3', '支出', '10.00', '1556440323', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('32', '11', '支出', '1.00', '1556970477', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('33', '11', '支出', '1.00', '1557199077', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('34', '11', '支出', '30.00', '1557199270', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('35', '11', '支出', '20.00', '1557908279', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('36', '11', '提现', '10.00', '1558280098', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('37', '11', '支出', '6.00', '1558447510', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('38', '11', '支出', '1.00', '1558447570', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('39', '11', '支出', '1.00', '1558447577', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('40', '11', '收入', '10.00', '1559030327', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('41', '11', '收入', '10.00', '1559030327', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('42', '11', '支出', '1.00', '1559045974', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('43', '17', '收入', '1.00', '1559046137', '28', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('44', '11', '支出', '1.00', '1559046205', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('45', '11', '支出', '1.00', '1559046211', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('46', '11', '支出', '1.00', '1559046216', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('47', '11', '支出', '1.00', '1559046220', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('48', '11', '支出', '1.00', '1559046224', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('49', '11', '支出', '6.00', '1559046232', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('50', '11', '支出', '1.00', '1559065332', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('51', '3', '支出', '6.00', '1559109111', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('52', '20', '收入', '6.00', '1559109111', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('53', '20', '支出', '0.60', '1559109111', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('56', '3', '支出', '40.00', '1559109703', '31', '支付订单', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('57', '20', '收入', '40.00', '1559109783', '31', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('58', '20', '支出', '2.00', '1559109783', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('59', '3', '支出', '60.00', '1559110023', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('60', '11', '支出', '1.00', '1559133751', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('61', '11', '支出', '1.00', '1559136980', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('62', '9', '收入', '1.00', '1559136980', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('63', '9', '支出', '0.10', '1559136980', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('64', '11', '支出', '1.00', '1559136985', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('65', '9', '收入', '1.00', '1559136985', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('66', '9', '支出', '0.10', '1559136985', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('67', '3', '收入', '60.00', '1559181064', '32', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('68', '3', '收入', '24.00', '1559181110', '8', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('69', '3', '收入', '12.00', '1559185821', '9', '陪玩同意撤单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('70', '11', '支出', '1.00', '1559198410', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('71', '4', '收入', '20.00', '1559199804', '7', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('72', '4', '支出', '1.00', '1559199804', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('73', '4', '收入', '20.00', '1559199810', '7', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('74', '4', '支出', '1.00', '1559199810', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('75', '4', '收入', '20.00', '1559199879', '7', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('76', '4', '支出', '1.00', '1559199879', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('77', '4', '充值', '1.00', '1559203703', '19053016082354', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('78', '4', '充值', '2.00', '1559203733', '19053016085396', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('79', '4', '充值', '2.00', '1559203772', '19053016093240', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('80', '4', '充值', '2.00', '1559203814', '19053016101394', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('81', '4', '充值', '4.00', '1559203822', '19053016102257', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('82', '11', '收入', '1.00', '1559203872', '34', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('83', '11', '收入', '1.00', '1559203876', '33', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('84', '11', '收入', '1.00', '1559203890', '29', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('85', '4', '充值', '4.00', '1559203983', '19053016130394', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('86', '11', '支出', '1.00', '1559204039', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('87', '4', '充值', '4.00', '1559204053', '19053016141396', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('88', '11', '支出', '1.00', '1559204375', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('89', '17', '收入', '1.00', '1559204375', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('90', '17', '支出', '0.10', '1559204375', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('91', '11', '收入', '1.00', '1559205007', '36', '陪玩同意撤单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('92', '11', '支出', '1.00', '1559205137', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('93', '17', '收入', '1.00', '1559205715', '37', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('94', '17', '支出', '0.05', '1559205715', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('95', '23', '充值', '11.00', '1559206595', '19053016563533', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('96', '23', '充值', '11.00', '1559206612', '19053016565293', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('97', '23', '充值', '11.00', '1559206651', '19053016573149', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('98', '23', '充值', '11.00', '1559206656', '19053016573679', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('99', '11', '支出', '1.00', '1559206761', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('100', '17', '收入', '1.00', '1559206826', '38', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('101', '17', '支出', '0.10', '1559206826', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('102', '11', '支出', '1.00', '1559206873', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('103', '17', '收入', '1.00', '1559206873', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('104', '17', '支出', '0.40', '1559206873', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('105', '11', '充值', '21.00', '1559207472', '19053017111230', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('106', '11', '充值', '1.00', '1559207487', '19053017112747', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('107', '11', '充值', '1.00', '1559207493', '19053017113319', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('108', '11', '充值', '111.00', '1559211019', '19053018101936', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('109', '10', '充值', '1.00', '1559217661', '19053020010190', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('110', '3', '支出', '20.00', '1559269362', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('111', '3', '提现', '130.00', '1559269385', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('112', '3', '收入', '20.00', '1559269397', '41', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('113', '3', '支出', '40.00', '1559269977', '42', '支付订单', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('114', '3', '支出', '80.00', '1559270520', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('115', '11', '充值', '1.00', '1559274968', '19053111560820', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('116', '11', '充值', '1.00', '1559274969', '19053111560981', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('117', '11', '充值', '1.00', '1559274980', '19053111561913', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('118', '11', '支出', '1.00', '1559275295', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('119', '21', '充值', '2.00', '1559276881', '19053112280115', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('120', '21', '充值', '2.00', '1559276882', '19053112280296', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('121', '11', '支出', '1.00', '1559281938', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('122', '11', '收入', '1.00', '1559281948', '47', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('123', '11', '支出', '1.00', '1559281987', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('124', '17', '支出', '1.00', '1559283282', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('125', '17', '收入', '1.00', '1559283719', '50', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('126', '17', '支出', '1.00', '1559283895', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('127', '17', '收入', '1.00', '1559285264', '48', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('128', '17', '支出', '1.00', '1559297012', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('129', '17', '支出', '1.00', '1559299022', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('130', '17', '收入', '1.00', '1559299037', '53', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('131', '17', '支出', '1.00', '1559299112', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('132', '20', '收入', '40.00', '1559356501', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('133', '20', '收入', '80.00', '1559357101', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('134', '11', '充值', '1.00', '1559361885', '19060112044550', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('135', '11', '充值', '1.00', '1559361886', '19060112044610', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('136', '11', '充值', '1.00', '1559361887', '19060112044740', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('137', '11', '充值', '1.00', '1559361887', '19060112044790', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('138', '11', '充值', '1.00', '1559361888', '19060112044838', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('139', '11', '充值', '1.00', '1559361888', '19060112044846', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('140', '11', '充值', '1.00', '1559361901', '19060112050162', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('141', '20', '支出', '66.00', '1559459252', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('142', '11', '收入', '66.00', '1559459252', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('143', '11', '支出', '26.40', '1559459252', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('144', '21', '充值', '100.00', '1559460967', '19060215360799', '微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('145', '21', '充值', '100.00', '1559460971', '19060215361177', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('146', '11', '支出', '1.00', '1559497728', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('147', '3', '支出', '20.00', '1559524807', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('148', '20', '收入', '20.00', '1559525075', '58', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('149', '20', '支出', '4.00', '1559525075', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('150', '20', '收入', '20.00', '1559525138', '58', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('151', '20', '支出', '4.00', '1559525138', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('152', '20', '收入', '20.00', '1559525295', '58', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('153', '20', '支出', '4.00', '1559525295', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('154', '20', '收入', '20.00', '1559525331', '58', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('155', '20', '支出', '4.00', '1559525331', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('156', '3', '支出', '20.00', '1559525898', '59', '支付订单', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('157', '20', '收入', '20.00', '1559525962', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('158', '3', '支出', '20.00', '1559526018', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('159', '20', '收入', '20.00', '1559526077', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('160', '3', '支出', '20.00', '1559527876', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('161', '11', '支出', '1.00', '1559537633', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('162', '11', '收入', '1.00', '1559537761', '62', '陪玩同意撤单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('163', '11', '支出', '1.00', '1559537798', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('164', '11', '支出', '1.00', '1559538040', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('165', '17', '收入', '1.00', '1559538064', '64', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('166', '17', '支出', '0.20', '1559538064', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('167', '11', '支出', '1.00', '1559538213', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('168', '17', '收入', '1.00', '1559538213', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('169', '17', '支出', '0.40', '1559538213', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('170', '11', '支出', '1.00', '1559538224', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('171', '17', '收入', '1.00', '1559538224', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('172', '17', '支出', '0.40', '1559538224', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('173', '11', '支出', '2.00', '1559538251', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('174', '17', '收入', '2.00', '1559538251', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('175', '17', '支出', '0.80', '1559538251', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('176', '11', '支出', '2.00', '1559542225', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('177', '11', '充值', '1.00', '1559544417', '19060314465729', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('178', '11', '支出', '1.00', '1559544627', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('179', '11', '收入', '1.00', '1559546701', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('180', '11', '支出', '5.00', '1559567376', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('181', '11', '收入', '5.00', '1559569201', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('182', '11', '支出', '1.00', '1559726743', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('183', '17', '收入', '1.00', '1559813701', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('184', '3', '充值', '1.00', '1560135745', '19061011022575', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('185', '3', '充值', '1.00', '1560135746', '19061011022678', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('186', '27', '充值', '12.00', '1560256410', '19061120333050', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('187', '27', '充值', '12.00', '1560256412', '19061120333239', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('188', '27', '充值', '12.00', '1560256413', '19061120333362', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('189', '27', '充值', '12.00', '1560256414', '19061120333484', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('190', '27', '充值', '12.00', '1560256415', '19061120333524', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('191', '29', '充值', '100.00', '1560394579', '19061310561987', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('192', '29', '充值', '100.00', '1560394600', '19061310564024', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('193', '29', '充值', '11.00', '1560395012', '19061311033233', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('194', '3', '充值', '1.00', '1560427293', '19061320013390', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('195', '11', '充值', '1.00', '1560488544', '19061413022433', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('196', '11', '充值', '11.00', '1560488584', '19061413030485', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('197', '11', '充值', '11.00', '1560488585', '19061413030565', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('198', '11', '充值', '1.00', '1560590390', '19061517195016', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('199', '11', '充值', '1.00', '1560590391', '19061517195190', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('200', '11', '充值', '1.00', '1560590395', '19061517195583', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('201', '11', '充值', '1.00', '1560590407', '19061517200716', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('202', '3', '充值', '1.00', '1561622033', '19062715535352', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('203', '11', '支出', '10.00', '1561633469', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('204', '11', '收入', '10.00', '1561633506', '74', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('205', '11', '支出', '1.00', '1561633583', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('206', '17', '收入', '1.00', '1561633632', '75', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('207', '41', '充值', '10.00', '1561784403', '19062913000388', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('208', '3', '充值', '1.00', '1561784785', '19062913062447', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('209', '3', '充值', '1.00', '1561784800', '19062913064052', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('210', '3', '充值', '1.00', '1561784803', '19062913064317', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('211', '11', '充值', '1.00', '1561787755', '19062913555426', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('212', '11', '充值', '1.00', '1561787755', '19062913555557', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('213', '11', '充值', '1.00', '1561787759', '19062913555988', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('214', '11', '充值', '1.00', '1562074892', '19070221413226', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('215', '33', '充值', '1.00', '1562588480', '19070820212054', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('216', '20', '支出', '10.00', '1562677307', null, '购买靓号:88888', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('217', '20', '支出', '7.00', '1562677470', null, '购买靓号:66666', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('218', '11', '充值', '1.00', '1562775226', '19071100134664', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('219', '11', '充值', '1.00', '1562775230', '19071100135017', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('220', '11', '支出', '1.00', '1562847375', null, '购买靓号:333333', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('221', '11', '支出', '1.00', '1562896265', null, '购买靓号:888888', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('222', '20', '支出', '10.00', '1563263249', null, '购买推荐位，价格:10', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('223', '11', '支出', '10.00', '1563284608', null, '购买推荐位，价格:10', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('224', '11', '充值', '1.00', '1563427630', '19071813271075', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('225', '20', '收入', '100.00', '1563457123', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('226', '20', '支出', '100.00', '1563457129', null, '管理员后台减少金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('227', '20', '收入', '1.00', '1563521820', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('228', '20', '收入', '1.00', '1563521824', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('229', '33', '充值', '1.00', '1563639837', '19072100235719', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('230', '33', '充值', '1.00', '1563639839', '19072100235917', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('231', '33', '充值', '1.00', '1563639840', '19072100240085', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('232', '33', '充值', '1.00', '1563639841', '19072100240134', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('233', '33', '充值', '1.00', '1563639842', '19072100240265', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('234', '33', '充值', '1.00', '1563639843', '19072100240390', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('235', '33', '充值', '1.00', '1563639847', '19072100240758', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('236', '20', '提现', '100.00', '1563677375', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('237', '20', '支出', '10.00', '1563704857', null, '购买靓号:2222222', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('238', '20', '支出', '0.00', '1563879157', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('239', '20', '支出', '1.00', '1563882376', null, '购买改名卡，价格:1', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('240', '11', '支出', '1.00', '1564216378', null, '购买改名卡，价格:1', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('241', '3', '支出', '11.00', '1564812623', '81', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('242', '20', '收入', '11.00', '1564812665', '81', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('243', '20', '支出', '2.20', '1564812665', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('244', '3', '充值', '1.00', '1564883712', '19080409551216', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('245', '3', '充值', '1.00', '1564883723', '19080409552370', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('246', '3', '充值', '1.00', '1565149985', '19080711530473', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('247', '46', '支出', '0.00', '1566470919', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('248', '46', '收入', '100.00', '1566470959', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('249', '46', '支出', '0.00', '1566470969', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('250', '46', '支出', '0.00', '1566470999', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('251', '46', '支出', '0.00', '1566471017', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('252', '46', '支出', '0.00', '1566471042', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('253', '46', '支出', '0.00', '1566471118', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('254', '46', '充值', '1.00', '1566471303', '19082218550389', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('255', '46', '支出', '29.00', '1566471337', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('256', '46', '收入', '29.00', '1566475201', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('257', '3', '充值', '1.00', '1566562237', '19082320103782', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('258', '50', '支出', '0.00', '1567072898', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('259', '50', '充值', '50.00', '1567073252', '19082918073296', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('260', '50', '充值', '50.00', '1567073263', '19082918074372', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('261', '51', '充值', '111.00', '1567169744', '19083020554321', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('262', '51', '充值', '111.00', '1567169744', '19083020554482', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('263', '52', '充值', '100.00', '1567400060', '19090212542024', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('264', '3', '充值', '1.00', '1568184889', '19091114544994', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('265', '3', '充值', '1.00', '1568184894', '19091114545499', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('266', '17', '充值', '20.00', '1568282223', '19091217570390', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('267', '2', '充值', '1.00', '1568526467', '19091513474687', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('268', '2', '充值', '1.00', '1568526468', '19091513474751', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('269', '2', '充值', '1.00', '1568526473', '19091513475373', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('270', '2', '提现', '6.00', '1568530677', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('271', '2', '提现', '5.00', '1568530735', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('272', '3', '支出', '4.80', '1568699165', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('273', '3', '收入', '4.80', '1568703601', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('274', '20', '充值', '20.00', '1568733292', '19091723145258', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('275', '2', '支出', '0.00', '1568787977', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('276', '2', '支出', '0.00', '1568787988', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('277', '47', '支出', '0.00', '1568788041', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('278', '47', '支出', '0.00', '1568788134', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('279', '2', '收入', '10000.00', '1568788392', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('280', '46', '收入', '11111111.00', '1568788508', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('281', '46', '支出', '11111111.00', '1568788521', null, '管理员后台减少金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('282', '23', '收入', '999999.00', '1568788531', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('283', '46', '收入', '11111111.00', '1568788658', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('284', '47', '支出', '0.00', '1568958721', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('285', '26', '收入', '0.00', '1568958721', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('286', '26', '支出', '0.00', '1568958721', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('287', '47', '支出', '0.00', '1568958814', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('288', '26', '收入', '0.00', '1568958814', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('289', '26', '支出', '0.00', '1568958814', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('290', '3', '支出', '1.00', '1568958908', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('291', '20', '收入', '1.00', '1568958908', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('292', '20', '支出', '0.40', '1568958908', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('293', '20', '支出', '1.00', '1569139808', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('294', '2', '收入', '1.00', '1569139808', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('295', '2', '支出', '0.40', '1569139808', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('296', '20', '支出', '1.00', '1569139817', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('297', '2', '收入', '1.00', '1569139817', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('298', '2', '支出', '0.40', '1569139817', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('299', '46', '支出', '1.00', '1569157210', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('300', '26', '收入', '1.00', '1569157210', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('301', '26', '支出', '0.40', '1569157210', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('302', '53', '充值', '10.00', '1569274097', '19092405281762', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('303', '54', '充值', '1.00', '1569317392', '19092417295276', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('304', '55', '收入', '500.00', '1569724017', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('305', '55', '支出', '29.00', '1569724233', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('306', '56', '收入', '1000.00', '1569724352', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('307', '56', '支出', '10.00', '1569724603', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('308', '56', '支出', '16.00', '1569724691', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('309', '55', '收入', '16.00', '1569724691', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('310', '55', '支出', '6.40', '1569724691', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('311', '56', '支出', '2.00', '1569724701', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('312', '55', '收入', '2.00', '1569724701', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('313', '55', '支出', '0.80', '1569724701', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('314', '56', '支出', '10.00', '1569724741', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('315', '55', '收入', '10.00', '1569724785', '101', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('316', '55', '支出', '2.00', '1569724785', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('317', '56', '收入', '10.00', '1569724919', '102', '陪玩同意撤单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('318', '55', '收入', '29.00', '1569724952', '100', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('319', '56', '支出', '10.00', '1569725086', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('320', '55', '收入', '10.00', '1569725386', '103', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('321', '55', '支出', '2.00', '1569725386', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('322', '55', '提现', '500.00', '1569725697', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('323', '20', '支出', '6.00', '1569863979', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('324', '20', '收入', '6.00', '1569863979', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('325', '20', '支出', '2.40', '1569863979', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('326', '20', '支出', '1.00', '1569863986', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('327', '20', '收入', '1.00', '1569863986', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('328', '20', '支出', '0.40', '1569863986', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('329', '3', '充值', '1.00', '1570009402', '19100217432287', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('330', '3', '充值', '1.00', '1570009404', '19100217432428', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('331', '3', '充值', '1.00', '1570010140', '19100217554045', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('332', '3', '充值', '1.00', '1570010141', '19100217554129', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('333', '3', '充值', '1.00', '1570010920', '19100218084093', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('334', '47', '支出', '3.60', '1570608817', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('335', '47', '支出', '32.00', '1570609235', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('336', '2', '收入', '32.00', '1570609235', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('337', '2', '支出', '12.80', '1570609235', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('338', '47', '支出', '24.00', '1570609327', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('339', '2', '收入', '24.00', '1570609327', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('340', '2', '支出', '9.60', '1570609327', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('341', '2', '支出', '6.00', '1570609360', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('342', '55', '收入', '6.00', '1570609360', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('343', '55', '支出', '2.40', '1570609360', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('344', '2', '支出', '1.00', '1570609460', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('345', '2', '收入', '1.00', '1570609460', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('346', '2', '支出', '0.40', '1570609460', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('347', '47', '收入', '3.60', '1570611601', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('348', '47', '充值', '1.00', '1570672629', '19101009570929', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('349', '47', '充值', '1.00', '1570672634', '19101009571437', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('350', '47', '充值', '1.00', '1570672645', '19101009572538', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('351', '47', '充值', '1.00', '1570672663', '19101009574363', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('352', '47', '支出', '5.00', '1571107422', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('353', '47', '收入', '5.00', '1571108653', '1', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('354', '47', '支出', '10.00', '1571108688', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('355', '2', '收入', '10.00', '1571109876', '2', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('356', '2', '支出', '2.00', '1571109877', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('357', '2', '收入', '10.00', '1571109892', '2', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('358', '2', '支出', '2.00', '1571109892', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('359', '2', '收入', '10.00', '1571109936', '2', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('360', '2', '支出', '2.00', '1571109936', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('361', '47', '支出', '10.00', '1571110077', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('362', '47', '支出', '22.00', '1571210854', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('363', '2', '收入', '22.00', '1571211216', '4', null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('364', '2', '支出', '4.40', '1571211216', null, '平台扣去订单管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('365', '2', '支出', '11.00', '1571227627', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('366', '2', '充值', '100.00', '1571227742', '19101620090143', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('367', '2', '充值', '100.00', '1571227803', '19101620100350', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('368', '2', '支出', '10.00', '1571227871', null, '购买靓号:3333333', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('369', '2', '支出', '1.00', '1571228093', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('370', '26', '收入', '1.00', '1571228093', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('371', '26', '支出', '0.40', '1571228093', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('372', '2', '充值', '1.00', '1571228639', '19101620235981', '用户微信充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('373', '2', '充值', '1.00', '1571228662', '19101620242227', '用户支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('374', '2', '收入', '11.00', '1571230801', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('375', '3', '支出', '1.00', '1571303098', null, '管理员后台减少金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('376', '46', '支出', '210.00', '1571303338', null, '管理员后台减少金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('377', '55', '支出', '10.00', '1571303572', null, '管理员后台减少金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('378', '3', '充值', '10.00', '1571381085', '19101814444557', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('379', '2', '支出', '1.00', '1571629906', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('380', '18', '收入', '1.00', '1571629906', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('381', '18', '支出', '0.40', '1571629906', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('382', '2', '充值', '100.00', '1571740315', '19102218315551', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('383', '2', '充值', '100.00', '1571740316', '19102218315688', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('384', '2', '充值', '100.00', '1571740318', '19102218315811', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('385', '2', '支出', '11.00', '1571740480', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('386', '2', '收入', '11.00', '1571740568', '107', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('387', '2', '支出', '10.00', '1571816342', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('388', '2', '收入', '10.00', '1571819888', '108', '取消订单,金额退回账户', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('389', '2', '支出', '11.00', '1571819897', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('390', '2', '收入', '11.00', '1571824801', null, null, '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('391', '2', '支出', '16.00', '1571827104', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('392', '23', '收入', '16.00', '1571827104', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('393', '23', '支出', '6.40', '1571827104', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('394', '2', '支出', '166.00', '1571827122', null, '赠送礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('395', '23', '收入', '166.00', '1571827122', null, '收到礼物', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('396', '23', '支出', '66.40', '1571827122', null, '平台扣去礼物管理费', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('397', '20', '充值', '1.00', '1572597044', '19110116304433', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('398', '47', '充值', '1.00', '1573109727', '19110714552733', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('399', '47', '支出', '1.00', '1573109753', null, '购买改名卡，价格:1', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('400', '47', '充值', '1.00', '1573178512', '19110810015257', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('401', '47', '充值', '1.00', '1573178534', '19110810021435', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('402', '47', '充值', '1.00', '1573179358', '19110810155875', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('403', '47', '充值', '2.00', '1573179368', '19110810160868', '支付宝充值收入', '0');
INSERT INTO `cmf_user_moneyrecord` VALUES ('404', '49', '收入', '10.00', '1590544818', null, '管理员后台增加金额', '1');
INSERT INTO `cmf_user_moneyrecord` VALUES ('405', '66', '收入', '5.00', '1590544838', null, '管理员后台增加金额', '1');

-- ----------------------------
-- Table structure for cmf_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of cmf_user_score_log
-- ----------------------------
INSERT INTO `cmf_user_score_log` VALUES ('1', '8', '1508396422', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('2', '8', '1508483729', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('3', '8', '1508729195', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('4', '8', '1508811436', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('5', '9', '1508828098', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('6', '10', '1508893679', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('7', '10', '1509082966', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('8', '10', '1509328589', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('9', '10', '1509590034', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('10', '10', '1509673196', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('11', '10', '1509935998', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('12', '10', '1510023766', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('13', '10', '1510105618', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('14', '10', '1510206942', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('15', '10', '1510295751', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('16', '10', '1510557964', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('17', '10', '1510629650', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('18', '16', '1510644501', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('19', '9', '1510708283', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('20', '10', '1510723534', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('21', '10', '1510883807', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('22', '10', '1511141021', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('23', '19', '1511161949', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('24', '10', '1511235175', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('25', '10', '1511330942', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('26', '10', '1511422257', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('27', '10', '1511759326', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('28', '50', '1511857316', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('29', '10', '1512013045', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('30', '53', '1512021636', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('31', '20', '1512024237', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('32', '10', '1512096119', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('33', '9', '1512109229', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('34', '10', '1512349601', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('35', '10', '1512527650', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('36', '10', '1513132158', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('37', '10', '1513573773', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('38', '10', '1513662246', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('39', '10', '1513737400', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('40', '10', '1513837181', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('41', '74', '1513933185', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('42', '10', '1515047170', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('43', '9', '1515047814', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('44', '19', '1515047891', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('45', '49', '1515048117', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('46', '10', '1515380186', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('47', '72', '1515387778', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('48', '10', '1515488760', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('49', '10', '1515548187', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('50', '95', '1515553693', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('51', '10', '1516000262', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('52', '10', '1516068496', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('53', '95', '1516180394', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('54', '10', '1516180652', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('55', '10', '1516255450', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('56', '95', '1516328000', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('57', '10', '1516328948', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('58', '10', '1516413174', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('59', '10', '1516585858', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('60', '10', '1516670119', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('61', '12', '1516670693', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('62', '10', '1516931966', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('63', '10', '1517015801', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('64', '10', '1517188138', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('65', '9', '1517190338', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('66', '10', '1517279433', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('67', '10', '1517362047', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('68', '10', '1517636598', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('69', '10', '1517814993', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('70', '10', '1519613379', 'login', '1', '0');

-- ----------------------------
-- Table structure for cmf_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------
INSERT INTO `cmf_user_token` VALUES ('3', '1', '1606096359', '1590544359', '0e8ab8aa253d207c600899f14f9bc7d6a0003b0853bac7ffd346cf713932c455', 'web');
INSERT INTO `cmf_user_token` VALUES ('4', '13', '1531876959', '1516324959', '247d959d742b54bd64c298a57c378390247d959d742b54bd64c298a57c378390', 'web');
INSERT INTO `cmf_user_token` VALUES ('5', '12', '1531986153', '1516434153', 'f2b6dc51a02d8ac57a23e0234dc65039f2b6dc51a02d8ac57a23e0234dc65039', 'web');
INSERT INTO `cmf_user_token` VALUES ('6', '72', '1532236104', '1516684104', '8f9c751c096253029834086872f412b28f9c751c096253029834086872f412b2', 'web');
INSERT INTO `cmf_user_token` VALUES ('7', '323', '1541991689', '1526439689', '9123fae280e5638e612fa4ffa70808e69123fae280e5638e612fa4ffa70808e6', 'web');

-- ----------------------------
-- Table structure for cmf_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cmf_verification_code
-- ----------------------------
INSERT INTO `cmf_verification_code` VALUES ('53', '1', '1577449423', '1577451223', '2187', '15588285160');

-- ----------------------------
-- Table structure for cmf_zuhao
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zuhao`;
CREATE TABLE `cmf_zuhao` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL DEFAULT '0',
  `user_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `jiage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `pic` varchar(255) NOT NULL DEFAULT '',
  `shichang` int(8) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_zuhao
-- ----------------------------
INSERT INTO `cmf_zuhao` VALUES ('1', '1', '2', 'root', '上号器账号出租', '10.00', '12345647677', 'default/20191014/edf6622717100584e3ceef5c19afffc5.jpg', '3', '上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租上号器账号出租');
INSERT INTO `cmf_zuhao` VALUES ('2', '1', '2', 'root1', '上号器账号出租1', '1.00', '15806548111', 'default/20191014/a1deb908747be21d8e7cf5f3171c9d43.png', '0', '上号器账号出租1上号器账号出租1上号器账号出租1上号器账号出租1上号器账号出租1上号器账号出租1上号器账号出租1上号器账号出租1');
INSERT INTO `cmf_zuhao` VALUES ('3', '1', '2', '111', 'eeee', '11.00', '11111111112', '/upload/avatar/20191016/2f4f4a8689d671682c2899130f91c008.jpg', '2', 'dadasasd');

-- ----------------------------
-- Table structure for cmf_zuhao_order
-- ----------------------------
DROP TABLE IF EXISTS `cmf_zuhao_order`;
CREATE TABLE `cmf_zuhao_order` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0',
  `kaishi_time` int(11) NOT NULL DEFAULT '0',
  `jiesu_time` int(11) NOT NULL DEFAULT '0',
  `pw_id` mediumint(8) NOT NULL DEFAULT '0',
  `zh_id` int(8) NOT NULL DEFAULT '0',
  `zh_num` int(8) NOT NULL DEFAULT '0',
  `content` text,
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_zuhao_order
-- ----------------------------
INSERT INTO `cmf_zuhao_order` VALUES ('1', '19101510434266', '47', '0', '1571107422', '1571107422', '0', '0', '2', '2', '5', null, '5.00');
INSERT INTO `cmf_zuhao_order` VALUES ('2', '19101511044835', '47', '4', '1571108688', '1571108688', '1571109531', '0', '2', '1', '1', null, '10.00');
INSERT INTO `cmf_zuhao_order` VALUES ('3', '19101511275718', '47', '2', '1571110077', '1571110077', '0', '0', '2', '1', '1', null, '10.00');
INSERT INTO `cmf_zuhao_order` VALUES ('4', '19101615273496', '47', '4', '1571210854', '1571210854', '1571211167', '0', '2', '3', '2', null, '22.00');
