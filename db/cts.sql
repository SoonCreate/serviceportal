-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2015 at 02:46 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cts`
--

-- --------------------------------------------------------

--
-- Table structure for table `ct_authobj_lines`
--

CREATE TABLE IF NOT EXISTS `ct_authobj_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `valuelist_id` int(11) NOT NULL COMMENT '项目值集',
  `default_value` text NOT NULL COMMENT '默认值',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`object_id`,`valuelist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限对象明细表' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ct_authobj_lines`
--

INSERT INTO `ct_authobj_lines` (`id`, `object_id`, `valuelist_id`, `default_value`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(3, 1, 9, 'customer', NULL, NULL, 1412991465, 44),
(4, 1, 6, 'all', NULL, NULL, NULL, NULL),
(5, 1, 8, 'all', NULL, NULL, NULL, NULL),
(6, 2, 11, 'TRUE', NULL, NULL, 1413690854, 44),
(7, 3, 25, 'all', NULL, NULL, NULL, NULL),
(8, 4, 11, 'TRUE', NULL, NULL, NULL, NULL),
(11, 4, 25, 'all', 1412992687, 44, 1413520681, 44),
(13, 2, 9, 'all', 1413690776, 44, 1413690776, 44),
(14, 5, 28, 'all', 1413941503, 44, 1413941503, 44),
(15, 5, 9, 'all', 1413941547, 44, 1413941547, 44),
(16, 5, 8, 'all', 1413941553, 44, 1413941553, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_authobj_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_authobj_lines_v` (
`id` int(11)
,`object_id` int(11)
,`valuelist_id` int(11)
,`default_value` text
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`object_name` varchar(20)
,`object_desc` varchar(255)
,`auth_item_name` varchar(20)
,`auth_item_desc` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_authority_objects`
--

CREATE TABLE IF NOT EXISTS `ct_authority_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(20) NOT NULL COMMENT '权限对象名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `object_name` (`object_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限对象表' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ct_authority_objects`
--

INSERT INTO `ct_authority_objects` (`id`, `object_name`, `description`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'category_control', '投诉单控制权限对象', NULL, NULL, 1413516417, 44),
(2, 'only_mine_control', '只能查看自己的投诉单', 1412066866, -1, 1413853229, 44),
(3, 'log_display_control', '投诉单日志类型显示控制', 1412928745, 44, 1412928745, 44),
(4, 'log_display_fullname', '日志显示操作人', 1412937910, 44, 1413516478, 44),
(5, 'meeting_control', '会议操作权限控制', 1413940749, 44, 1413940749, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ct_configs`
--

CREATE TABLE IF NOT EXISTS `ct_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(20) NOT NULL COMMENT '配置名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `config_value` varchar(255) NOT NULL COMMENT '配置值',
  `editable_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可被前台编辑',
  `data_type` varchar(20) NOT NULL DEFAULT 'string' COMMENT '数据类型',
  `user_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户可配置（默认为系统配置）',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统配置表' AUTO_INCREMENT=55 ;

--
-- Dumping data for table `ct_configs`
--

INSERT INTO `ct_configs` (`id`, `config_name`, `description`, `config_value`, `editable_flag`, `data_type`, `user_flag`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'logo_text', 'Logo标题', 'Sooncreate CTS', 1, 'string', 0, NULL, NULL, 1415081460, 44),
(2, 'logo_file', 'Logo文件，高35px', 'resources/images/logo.png', 1, 'string', 0, NULL, NULL, 1416463221, 44),
(3, 'upload_path', '文件上传路径。该路径必须是可写的，相对路径和绝对路径均可以。', 'resources/uploads', 0, 'string', 0, NULL, NULL, NULL, NULL),
(4, 'category_control', '投诉投诉单分类功能开关', 'TRUE', 1, 'boolean', 0, NULL, NULL, 1419558352, 44),
(5, 'all_values', '包含所有值', 'all', 0, 'string', 0, NULL, NULL, NULL, NULL),
(6, 'alarm_period', '报警周期，每次报警的时间间隔，单位为小时', '24', 1, 'number', 0, NULL, NULL, NULL, NULL),
(7, 'mail_protocol', 'mail, sendmail, or smtp 邮件发送协议', 'smtp', 1, 'string', 0, NULL, NULL, NULL, NULL),
(8, 'sendmail_path', '服务器上 Sendmail 的实际路径。protocol 为 sendmail 时使用', '/usr/sbin/sendmail', 1, 'string', 0, NULL, NULL, NULL, NULL),
(9, 'smtp_host', 'SMTP 服务器地址', 'smtp.ym.163.com', 1, 'string', 0, NULL, NULL, NULL, NULL),
(10, 'smtp_user', 'SMTP 用户账号', 'yacole@sooncreate.com', 1, 'string', 0, NULL, NULL, NULL, NULL),
(11, 'smtp_pass', 'SMTP 密码', '325604', 1, 'string', 0, NULL, NULL, NULL, NULL),
(12, 'smtp_port', 'SMTP 端口', '25', 1, 'number', 0, NULL, NULL, NULL, NULL),
(13, 'smtp_timeout', 'SMTP 超时设置(单位：秒)', '5', 1, 'number', 0, NULL, NULL, NULL, NULL),
(14, 'mail_wordwrap', 'TRUE 或 FALSE (布尔值)	MAIL开启自动换行', 'TRUE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(15, 'mail_wrapchars', '自动换行时每行的最大字符数', '76', 1, 'number', 0, NULL, NULL, NULL, NULL),
(16, 'mail_content_type', 'text 或 html	邮件类型。发送 HTML 邮件比如是完整的网页。请确认网页中是否有相对路径的链接和图片地址，它们在邮件中不能正确显示。', 'html', 1, 'string', 0, NULL, NULL, NULL, NULL),
(17, 'mail_charset', '字符集(utf-8, iso-8859-1 等)', 'utf-8', 1, 'string', 0, NULL, NULL, NULL, NULL),
(18, 'mail_validate', 'TRUE 或 FALSE (布尔值)	是否验证邮件地址', 'FALSE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(19, 'mail_newline', '"\\r\\n" or "\\n" or "\\r"	换行符. (使用 "\\r\\n" to 以遵守RFC 822).', '\\n', 1, 'string', 0, NULL, NULL, NULL, NULL),
(20, 'bcc_batch_mode', 'TRUE or FALSE (boolean)	启用批量暗送模式', 'FALSE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(21, 'bcc_batch_size', '批量暗送的邮件数', '200', 1, 'number', 0, NULL, NULL, NULL, NULL),
(22, 'mail_from', '邮件默认来自于，如果是smtp方式，必须同smtp_user', 'yacole@sooncreate.com', 1, 'string', 0, NULL, NULL, NULL, NULL),
(23, 'mail_from_name', '邮件来自，名称用于显示自动邮件的发件人姓名', '系统管理员', 1, 'string', 0, NULL, NULL, NULL, NULL),
(24, 'site_url', '网站地址', 'localhost', 1, 'string', 0, NULL, NULL, NULL, NULL),
(25, 'initial_password', '系统用户初始密码', '123456', 1, 'string', 0, NULL, NULL, NULL, NULL),
(26, 'upload_allowed_types', '允许上传文件的MIME类型；通常文件扩展名可以做为MIME类型. 允许多个类型用竖线‘|’分开', 'gif|jpg|png|pdf|doc|docx|xls|xlsx', 1, 'string', 0, NULL, NULL, NULL, NULL),
(27, 'upload_overwrite', '是否覆盖。该参数为TRUE时，如果上传文件时碰到重名文件，将会把原文件覆盖；如果该参数为FALSE，上传文件重名时，CI将会在新文件的文件名后面加一个数字。', 'FALSE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(28, 'upload_max_size', '允许上传文件大小的最大值（以K为单位）。该参数为0则不限制。注意：通常PHP也有这项限制，可以在php.ini文件中指定。通常默认为2MB。', '2000', 1, 'number', 0, NULL, NULL, 1414825206, 44),
(29, 'upload_max_width', '上传文件的宽度最大值（像素为单位）。0为不限制。', '1024', 1, 'number', 0, NULL, NULL, NULL, NULL),
(30, 'upload_max_height', '上传文件的高度最大值（像素为单位）。0为不限制。', '768', 1, 'number', 0, NULL, NULL, NULL, NULL),
(31, 'upload_max_filename', '文件名的最大长度。0为不限制。', '0', 1, 'number', 0, NULL, NULL, NULL, NULL),
(32, 'upload_encrypt_name', '是否重命名文件。如果该参数为TRUE，上传的文件将被重命名为随机的加密字符串。当你想让文件上传者也不能区分自己上传的文件的文件名时，是非常有用的。当 overwrite 为 FALSE 时，此选项才起作用。', 'TRUE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(33, 'upload_remove_spaces', '参数为TRUE时，文件名中的空格将被替换为下划线。推荐使用。', 'TRUE', 1, 'boolean', 0, NULL, NULL, NULL, NULL),
(34, 'status_for_lock', '在此状态下，投诉单被锁定，无法操作', 'closed', 1, 'string', 0, NULL, NULL, NULL, NULL),
(35, 'word_truncate', '文字截断默认长度', '100', 1, 'number', 0, NULL, NULL, NULL, NULL),
(36, 'allow_register', '是否允许用户注册', 'TRUE', 1, 'boolean', 0, NULL, NULL, 1414557033, 44),
(37, 'feedback_star', '用户反馈的打分星数', '5', 1, 'number', 0, NULL, NULL, 1413693616, 44),
(38, 'feedback_control', '反馈功能开关', 'TRUE', 1, 'boolean', 0, NULL, NULL, 1414823589, 44),
(39, 'pcd_change_times', '计划完成日期允许修改次数', '2', 1, 'number', 0, NULL, NULL, 1413960977, 44),
(40, 'auto_leader', '如果责任人只有唯一人选，在投诉单确认时自动选择', 'TRUE', 1, 'boolean', 0, NULL, NULL, 1414819602, 44),
(41, 'auto_manager', '如果处理人只有唯一人选，在投诉单确认时自动选择', 'TRUE', 1, 'boolean', 0, NULL, NULL, 1414820098, 44),
(42, 'allow_reopen', '是否允许关闭投诉单重新打开', 'FALSE', 1, 'boolean', 0, NULL, NULL, 1414032071, 44),
(43, 'receive_email', '是否接收邮件（默认为接收）', 'TRUE', 1, 'boolean', 1, NULL, NULL, NULL, NULL),
(44, 'technical_name', '技术名词是否开启（默认为FALSE）', 'FALSE', 1, 'boolean', 1, NULL, NULL, NULL, NULL),
(45, 'service_username', '速创服务平台帐号', 'administrator', 1, 'string', 0, NULL, NULL, 1419741179, 44),
(46, 'service_password', '速创服务平台密码', '123456', 1, 'string', 0, NULL, NULL, 1419741187, 44),
(47, 'receive_sms', '接收短信消息（默认不收取）', 'FALSE', 1, 'boolean', 1, NULL, NULL, NULL, NULL),
(48, 'sms_ip', '信息机webservise地址IP', '', 1, 'string', 0, NULL, NULL, NULL, NULL),
(49, 'sms_number', '短信发送号码', '', 1, 'string', 0, NULL, NULL, NULL, NULL),
(50, 'sms_account', '短信企业账号', '', 1, 'string', 0, NULL, NULL, NULL, NULL),
(51, 'auto_feedback', '投诉单关闭后，自动反馈时间（小时）', '24', 1, 'number', 0, NULL, NULL, NULL, NULL),
(52, 'time_begin', '界面默认时间从（上班时间）', '08:00:00', 1, 'string', 0, NULL, NULL, NULL, NULL),
(53, 'time_end', '界面默认时间至（下班时间）', '17:00:00', 1, 'string', 0, NULL, NULL, NULL, NULL),
(54, 'php_dir', 'php 运行程序，用于后台程序运行', 'F:\\\\xampp\\\\php\\\\php.exe', 1, 'string', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ct_email_logs`
--

CREATE TABLE IF NOT EXISTS `ct_email_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned DEFAULT NULL,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `send_cc` varchar(255) DEFAULT NULL COMMENT '抄送',
  `send_bcc` varchar(255) DEFAULT NULL COMMENT '密送',
  `created_by` int(10) NOT NULL,
  `creation_date` int(10) NOT NULL,
  `last_updated_by` int(10) NOT NULL,
  `last_update_date` int(10) NOT NULL,
  `reason` text COMMENT '报错原因',
  `attach` text COMMENT '附件',
  PRIMARY KEY (`id`),
  KEY `Index_2` (`created_by`,`creation_date`,`send_to`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='邮件发送记录' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ct_email_logs`
--

INSERT INTO `ct_email_logs` (`id`, `notice_id`, `send_to`, `subject`, `content`, `send_cc`, `send_bcc`, `created_by`, `creation_date`, `last_updated_by`, `last_update_date`, `reason`, `attach`) VALUES
(1, 378, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420011796, 73, 1420011796, NULL, NULL),
(2, 379, 'yacole@sooncreate.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420011797, 73, 1420011797, NULL, NULL),
(3, 380, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420011847, 73, 1420011847, NULL, ''),
(4, 381, 'yacole@sooncreate.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420011847, 73, 1420011847, NULL, ''),
(5, 382, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012067, 73, 1420012067, NULL, NULL),
(6, 383, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012076, 73, 1420012076, NULL, NULL),
(7, 384, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012100, 73, 1420012100, NULL, NULL),
(8, 385, 'yacole@sooncreate.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012100, 73, 1420012100, NULL, NULL),
(9, 386, 'yacole@qq.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012180, 73, 1420012180, NULL, NULL),
(10, 387, 'yacole@sooncreate.com', '会议通知：啊收到了房价', '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', NULL, NULL, 73, 1420012180, 73, 1420012180, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ct_feedbacks`
--

CREATE TABLE IF NOT EXISTS `ct_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `content` text COMMENT '反馈意见内容',
  `created_by` int(11) NOT NULL,
  `creation_date` int(11) NOT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单反馈表' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ct_feedbacks`
--

INSERT INTO `ct_feedbacks` (`id`, `order_id`, `content`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(1, 100, NULL, 44, 1420346762, 1420346762, 44),
(2, 101, NULL, 44, 1420346762, 1420346762, 44),
(3, 102, NULL, 44, 1420346762, 1420346762, 44),
(4, 105, NULL, 44, 1420346762, 1420346762, 44),
(5, 106, NULL, 44, 1420346762, 1420346762, 44),
(6, 113, NULL, 44, 1420346762, 1420346762, 44),
(7, 115, NULL, 44, 1420346762, 1420346762, 44),
(8, 120, NULL, 44, 1420346762, 1420346762, 44),
(9, 121, NULL, 44, 1420346762, 1420346762, 44),
(10, 142, NULL, 44, 1420346762, 1420346762, 44),
(11, 144, NULL, 44, 1420346762, 1420346762, 44),
(12, 149, NULL, 44, 1420346762, 1420346762, 44),
(13, 162, NULL, 44, 1420346762, 1420346762, 44),
(14, 163, NULL, 44, 1420346762, 1420346762, 44),
(15, 164, NULL, 44, 1420346762, 1420346762, 44),
(16, 165, NULL, 44, 1420346762, 1420346762, 44),
(17, 166, NULL, 44, 1420346762, 1420346762, 44),
(18, 167, NULL, 44, 1420346762, 1420346762, 44),
(19, 168, '', 44, 1420346762, 1420348602, 45);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_feedback_orders_v`
--
CREATE TABLE IF NOT EXISTS `ct_feedback_orders_v` (
`id` int(11)
,`order_type` varchar(20)
,`status` varchar(20)
,`severity` varchar(20)
,`frequency` varchar(20)
,`category` varchar(20)
,`title` varchar(100)
,`manager_id` int(11)
,`leader_id` int(11)
,`plan_complete_date` int(11)
,`contact` varchar(255)
,`phone_number` varchar(255)
,`mobile_telephone` varchar(255)
,`address` varchar(255)
,`full_name` varchar(255)
,`warning_times` int(11)
,`pcd_change_times` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`feedback_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_feedback_stars`
--

CREATE TABLE IF NOT EXISTS `ct_feedback_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `feedback_type` varchar(20) NOT NULL COMMENT '反馈类型',
  `stars` int(1) NOT NULL DEFAULT '0' COMMENT '打分',
  `created_by` int(11) NOT NULL,
  `creation_date` int(11) NOT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `feedback_desc` varchar(255) NOT NULL COMMENT '类型描述',
  `total_stars` int(10) unsigned NOT NULL DEFAULT '5' COMMENT '总打分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`feedback_id`,`feedback_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单反馈明细表' AUTO_INCREMENT=39 ;

--
-- Dumping data for table `ct_feedback_stars`
--

INSERT INTO `ct_feedback_stars` (`id`, `feedback_id`, `feedback_type`, `stars`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `feedback_desc`, `total_stars`) VALUES
(1, 1, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(2, 1, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(3, 2, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(4, 2, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(5, 3, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(6, 3, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(7, 4, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(8, 4, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(9, 5, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(10, 5, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(11, 6, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(12, 6, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(13, 7, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(14, 7, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(15, 8, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(16, 8, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(17, 9, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(18, 9, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(19, 10, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(20, 10, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(21, 11, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(22, 11, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(23, 12, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(24, 12, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(25, 13, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(26, 13, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(27, 14, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(28, 14, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(29, 15, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(30, 15, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(31, 16, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(32, 16, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(33, 17, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(34, 17, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(35, 18, '10', 5, 44, 1420346762, 1420346762, 44, '响应速度', 5),
(36, 18, '20', 5, 44, 1420346762, 1420346762, 44, '服务态度', 5),
(37, 19, '10', 5, 44, 1420346762, 1420348602, 45, '响应速度', 5),
(38, 19, '20', 5, 44, 1420346762, 1420348602, 45, '服务态度', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ct_files`
--

CREATE TABLE IF NOT EXISTS `ct_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL COMMENT '已上传的文件名（包括扩展名）',
  `file_type` varchar(255) NOT NULL COMMENT '文件的Mime类型',
  `file_size` float DEFAULT NULL COMMENT '图像大小，单位是kb',
  `is_image` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是图像。 1 =是图像。 0 = 不是图像。',
  `file_path` varchar(255) DEFAULT NULL COMMENT '不包括文件名的文件绝对路径',
  `full_path` varchar(255) DEFAULT NULL COMMENT '包括文件名在内的文件绝对路径',
  `raw_name` varchar(100) DEFAULT NULL COMMENT '不包括扩展名在内的文件名部分',
  `orig_name` varchar(255) DEFAULT NULL COMMENT '上传的文件最初的文件名。这只有在设置上传文件重命名（encrypt_name）时才有效。',
  `client_name` varchar(100) DEFAULT NULL COMMENT '上传的文件在客户端的文件名。',
  `file_ext` varchar(45) DEFAULT NULL COMMENT '文件扩展名（包括‘.’）',
  `image_width` int(10) unsigned DEFAULT NULL COMMENT '图像宽度',
  `image_height` int(10) unsigned DEFAULT NULL COMMENT '图像高度',
  `image_type` varchar(45) DEFAULT NULL COMMENT '文件类型，即文件扩展名（不包括‘.’）',
  `image_size_str` varchar(255) DEFAULT NULL COMMENT '一个包含width和height的字符串。用于放在一个img标签里。',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='上传文件记录表' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ct_files`
--

INSERT INTO `ct_files` (`id`, `file_name`, `file_type`, `file_size`, `is_image`, `file_path`, `full_path`, `raw_name`, `orig_name`, `client_name`, `file_ext`, `image_width`, `image_height`, `image_type`, `image_size_str`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, '07849043460b9e3f5bf54b3dd5e69793.doc', 'application/msword', 40.5, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/07849043460b9e3f5bf54b3dd5e69793.doc', '07849043460b9e3f5bf54b3dd5e69793', '2014年第3季度专项计划检查(自查)记录表_陈杨阳.doc', '2014年第3季度专项计划检查(自查)记录表_陈杨阳.doc', '.doc', 0, 0, '', '', 1412296792, 44, 1412296792, 44),
(2, 'f14237f81c80fbb22517a0cbb368d8ae.doc', 'application/msword', 40.5, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/f14237f81c80fbb22517a0cbb368d8ae.doc', 'f14237f81c80fbb22517a0cbb368d8ae', '2014年第3季度专项计划检查(自查)记录表_陈杨阳.doc', '2014年第3季度专项计划检查(自查)记录表_陈杨阳.doc', '.doc', 0, 0, '', '', 1412316270, 44, 1412316270, 44),
(3, '86bfdf2b8c98f67fbccea33d8d26632c.jpg', 'image/jpeg', 20, 1, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/86bfdf2b8c98f67fbccea33d8d26632c.jpg', '86bfdf2b8c98f67fbccea33d8d26632c', '11-b.jpg', '11-b.jpg', '.jpg', 175, 131, 'jpeg', 'width="175" height="131"', 1412391635, 44, 1412391635, 44),
(4, 'fc0cbe8d99139559fc410631a437be8d.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/fc0cbe8d99139559fc410631a437be8d.XLSX', 'fc0cbe8d99139559fc410631a437be8d', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414476555, 70, 1414476555, 70),
(5, 'dec8667590aed67170e1944e69743dc3.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/dec8667590aed67170e1944e69743dc3.XLSX', 'dec8667590aed67170e1944e69743dc3', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414479331, 70, 1414479331, 70),
(6, 'c24285da83892d44c6ba3932d6a38fc7.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/c24285da83892d44c6ba3932d6a38fc7.xlsx', 'c24285da83892d44c6ba3932d6a38fc7', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414479988, 70, 1414479988, 70),
(7, '8a87a6cce1c33cee939e3a80670a3a7c.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/8a87a6cce1c33cee939e3a80670a3a7c.XLSX', '8a87a6cce1c33cee939e3a80670a3a7c', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414480130, 70, 1414480130, 70),
(8, '5e52044254635fb53cab01dfe808a588.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/5e52044254635fb53cab01dfe808a588.xlsx', '5e52044254635fb53cab01dfe808a588', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414480203, 70, 1414480203, 70),
(9, 'ea35220a74b718b9cf47032ce337096b.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/ea35220a74b718b9cf47032ce337096b.xlsx', 'ea35220a74b718b9cf47032ce337096b', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414480224, 70, 1414480224, 70),
(10, 'd7cfdec929278ede788b6a0e3e185ca8.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/d7cfdec929278ede788b6a0e3e185ca8.XLSX', 'd7cfdec929278ede788b6a0e3e185ca8', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414480465, 70, 1414480465, 70),
(11, '22990ec1aa179dc56221c741944e4bf4.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/22990ec1aa179dc56221c741944e4bf4.xlsx', '22990ec1aa179dc56221c741944e4bf4', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414480577, 70, 1414480577, 70),
(12, 'a5821682e5ca532f53601b66cf517944.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/a5821682e5ca532f53601b66cf517944.xlsx', 'a5821682e5ca532f53601b66cf517944', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414480726, 70, 1414480726, 70),
(13, '6ca36bedf0b097005d6ee5d764cc696a.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/6ca36bedf0b097005d6ee5d764cc696a.XLSX', '6ca36bedf0b097005d6ee5d764cc696a', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414483483, 73, 1414483483, 73),
(14, 'a32dbbcc4d559d0bbf85fde45cd7b75e.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/a32dbbcc4d559d0bbf85fde45cd7b75e.XLSX', 'a32dbbcc4d559d0bbf85fde45cd7b75e', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414483662, 73, 1414483662, 73),
(15, 'f25ed4263f2845d624b1d5020f67e978.XLSX', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 11.53, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/f25ed4263f2845d624b1d5020f67e978.XLSX', 'f25ed4263f2845d624b1d5020f67e978', 'export.XLSX', 'export.XLSX', '.XLSX', 0, 0, '', '', 1414483700, 73, 1414483700, 73),
(16, '1bf3995adc7fd51b2642b085b8ec4f5c.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 20.65, 0, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/1bf3995adc7fd51b2642b085b8ec4f5c.xlsx', '1bf3995adc7fd51b2642b085b8ec4f5c', '安防.xlsx', '安防.xlsx', '.xlsx', 0, 0, '', '', 1414484724, 73, 1414484724, 73),
(17, 'd6f60a163438cbef71053041417aff19.jpg', 'image/jpeg', 20, 1, 'E:/xampp/htdocs/CTS/resources/uploads/', 'E:/xampp/htdocs/CTS/resources/uploads/d6f60a163438cbef71053041417aff19.jpg', 'd6f60a163438cbef71053041417aff19', '11-b.jpg', '11-b.jpg', '.jpg', 175, 131, 'jpeg', 'width="175" height="131"', 1414814425, 45, 1414814425, 45);

-- --------------------------------------------------------

--
-- Table structure for table `ct_functions`
--

CREATE TABLE IF NOT EXISTS `ct_functions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(100) NOT NULL COMMENT '功能名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `controller` varchar(255) NOT NULL COMMENT '控制器',
  `action` varchar(255) NOT NULL COMMENT '函数',
  `help` text COMMENT '帮助文档',
  `render_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有页面操作',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `display_flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `display_class` varchar(100) DEFAULT NULL,
  `blank_flag` tinyint(3) unsigned NOT NULL COMMENT '打开新页面',
  PRIMARY KEY (`id`),
  UNIQUE KEY `function_name` (`function_name`,`display_flag`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统功能信息表' AUTO_INCREMENT=42 ;

--
-- Dumping data for table `ct_functions`
--

INSERT INTO `ct_functions` (`id`, `function_name`, `description`, `controller`, `action`, `help`, `render_flag`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `display_flag`, `display_class`, `blank_flag`) VALUES
(1, 'choose_create', '投诉投诉单创建', 'order', 'choose_create', NULL, 1, 1412060589, -1, 1413512538, 44, 1, 'icon-globe', 0),
(3, 'user_manage', '用户管理', 'user', 'index', NULL, 1, 1412147486, 44, 1416272247, 44, 1, 'icon-group', 0),
(5, 'my_orders', '投诉管理', 'order', 'index', NULL, 1, 1413115571, 44, 1413115571, 44, 1, '', 0),
(6, 'user_edit', '用户信息', 'user', 'user_edit', NULL, 1, 1413115703, 44, 1413115703, 44, 1, '', 0),
(7, 'my_notices', '我的消息', 'user', 'notices', NULL, 1, 1413115821, 44, 1413115821, 44, 1, '', 0),
(8, 'change_password', '修改密码', 'user', 'change_password', NULL, 1, 1413425007, 44, 1413463593, 44, 0, '', 0),
(9, 'valuelist_manage', '值集管理', 'valuelist', 'index', NULL, 1, 1413425274, 44, 1416275548, 44, 1, 'icon-th-list', 0),
(10, 'role_manage', '角色管理', 'role', 'index', NULL, 1, 1413425363, 44, 1416272290, 44, 1, 'icon-user-md', 0),
(11, 'module_manage', '模块管理', 'modules', 'index', NULL, 1, 1413425386, 44, 1416275666, 44, 1, 'icon-sitemap', 0),
(12, 'function_manage', '功能管理', 'functions', 'index', NULL, 1, 1413425406, 44, 1416275725, 44, 1, 'icon-magic', 0),
(13, 'ao_manage', '权限对象管理', 'auth_object', 'index', NULL, 1, 1413425444, 44, 1416275475, 44, 1, 'icon-magnet', 0),
(14, 'olt_manage', '日志记录配置', 'order_log_type', 'index', NULL, 1, 1413425500, 44, 1413675237, 44, 1, '', 0),
(15, 'message_manage', '系统报错管理', 'messages', 'index', NULL, 1, 1413425531, 44, 1419919817, 44, 1, 'icon-info-sign', 0),
(16, 'config_manage', '系统配置', 'configs', 'index', NULL, 1, 1413425561, 44, 1416272088, 44, 1, 'icon-cog', 0),
(18, 'order_show', '投诉单显示', 'order', 'show', NULL, 1, 1413543719, 44, 1413543719, 44, 0, '', 0),
(19, 'order_create', '投诉单创建', 'order', 'create', NULL, 1, 1413543810, 44, 1413543810, 44, 0, '', 0),
(20, 'notice_show', '显示消息', 'user', 'notice_show', NULL, 1, 1413544917, 44, 1413544917, 44, 0, '', 0),
(21, 'user_admin_edit', '用户信息管理', 'user', 'admin_edit', NULL, 1, 1413683565, 44, 1413683573, 44, 0, '', 0),
(22, 'order_meeting', '会议记录', 'order_meeting', 'index', NULL, 1, 1413858257, 44, 1413858349, 44, 0, '', 0),
(23, 'status_manage', '状态流管理', 'status', 'index', NULL, 1, 1414116975, 44, 1416274676, 44, 1, 'icon-retweet', 0),
(24, 'order_feedback', '投诉单反馈', 'order', 'feedback', NULL, 1, 1414459689, 44, 1414459689, 44, 0, '', 0),
(25, 'user_config', '用户配置', 'user', 'configs', NULL, 1, 1414638739, 44, 1415079683, 44, 0, '', 0),
(26, 'order_confirm', '投诉单内容确认', 'order', 'confirm', NULL, 0, 1414718558, 44, 1414743146, 44, 0, '', 0),
(27, 'order_choose_leader', '选择责任人（部门经理）', 'order', 'choose_leader', NULL, 1, 1415062304, 44, 1415063803, 44, 0, '', 0),
(28, 'order_dispatcher', '分配任务，指定处理人', 'order', 'dispatcher', NULL, 1, 1415062338, 44, 1415062338, 44, 0, '', 0),
(29, 'order_pcd_change', '计划完成日期', 'order', 'pcd_change', NULL, 1, 1415062363, 44, 1415062363, 44, 0, '', 0),
(30, 'order_done', '问题已经解决', 'order', 'done', NULL, 0, 1415062387, 44, 1415062387, 44, 0, '', 0),
(31, 'order_close', '投诉单关闭', 'order', 'close', NULL, 0, 1415062454, 44, 1415062454, 44, 0, '', 0),
(32, 'order_reopen', '投诉单重新打开', 'order', 'reopen', NULL, 0, 1415062479, 44, 1415062479, 44, 0, '', 0),
(33, 'session_manage', '会话管理', 'sessions', 'index', NULL, 1, 1415666800, 44, 1416275778, 44, 1, 'icon-cloud', 0),
(34, 'translator', '多语言翻译', 'translator', 'index', NULL, 1, 1415753917, 44, 1416274937, 44, 1, 'icon-exchange', 0),
(35, 'status_statistics', '投诉单统计', 'report', 'status_statistics', NULL, 0, 1415843162, 44, 1415843162, 44, 1, '', 0),
(36, 'time_statistics', '耗时统计', 'report', 'time_statistics', NULL, 0, 1415853121, 44, 1415853121, 44, 1, '', 0),
(37, 'service_portal', '速创服务平台', 'admin', 'service_portal', NULL, 0, 1419738688, 44, 1419738688, 44, 1, 'icon-th-large', 1),
(38, 'order_meeting_create', '召开会议', 'order_meeting', 'create', NULL, 1, 1419817232, 44, 1419817232, 44, 0, '', 0),
(39, 'notice_list', '通知记录', 'notice', 'index', NULL, 1, 1420334853, 44, 1420334853, 44, 1, 'icon-envelope', 0),
(40, 'job_manage', '后台作业', 'job', 'index', NULL, 1, 1420519231, 44, 1420519231, 44, 1, 'icon-flag', 0),
(41, 'auto_feedback_job', '反馈自动打分', 'order', 'auto_feedback_job', NULL, 0, 1420780932, 44, 1420780932, 44, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ct_function_objects`
--

CREATE TABLE IF NOT EXISTS `ct_function_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `function_id` int(10) unsigned NOT NULL COMMENT '功能ID',
  `object_id` int(10) unsigned NOT NULL COMMENT '权限对象ID',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='功能权限对象表' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ct_function_objects`
--

INSERT INTO `ct_function_objects` (`id`, `function_id`, `object_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(2, 1, 1, 44, 1413012134, 1413012134, 44),
(3, 1, 3, 44, 1413012476, 1413012476, 44),
(5, 17, 1, 44, 1413513944, 1413513944, 44),
(6, 22, 5, 44, 1413941605, 1413941605, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_function_objects_v`
--
CREATE TABLE IF NOT EXISTS `ct_function_objects_v` (
`id` int(10) unsigned
,`function_id` int(10) unsigned
,`object_id` int(10) unsigned
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`object_name` varchar(20)
,`description` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_function_obj_lines`
--

CREATE TABLE IF NOT EXISTS `ct_function_obj_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `object_line_id` int(10) unsigned NOT NULL,
  `fun_object_id` int(10) unsigned NOT NULL,
  `default_value` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`fun_object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='功能权限对象明细表' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `ct_function_obj_lines`
--

INSERT INTO `ct_function_obj_lines` (`id`, `object_line_id`, `fun_object_id`, `default_value`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(4, 3, 2, 'vendor', 44, 1413012134, 1413012451, 44),
(5, 4, 2, 'all', 44, 1413012134, 1413012499, 44),
(6, 5, 2, 'all', 44, 1413012134, 1413012134, 44),
(7, 7, 3, 'manager_change', 44, 1413012476, 1413012489, 44),
(11, 3, 5, 'employee', 44, 1413513944, 1413514880, 44),
(12, 4, 5, 'all', 44, 1413513944, 1413513944, 44),
(13, 5, 5, 'all', 44, 1413513944, 1413513944, 44),
(14, 16, 6, 'all', 44, 1413941605, 1413941605, 44),
(15, 15, 6, 'all', 44, 1413941605, 1413941605, 44),
(16, 14, 6, 'all', 44, 1413941605, 1413941605, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_function_obj_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_function_obj_lines_v` (
`id` int(10) unsigned
,`object_line_id` int(10) unsigned
,`fun_object_id` int(10) unsigned
,`default_value` text
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`function_id` int(10) unsigned
,`object_id` int(10) unsigned
,`object_name` varchar(20)
,`object_desc` varchar(255)
,`valuelist_id` int(11)
,`auth_item_name` varchar(20)
,`auth_item_desc` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_function_variants`
--

CREATE TABLE IF NOT EXISTS `ct_function_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `function_id` int(10) unsigned NOT NULL,
  `variant_name` varchar(45) NOT NULL COMMENT '变式名',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `background_flag` tinyint(1) DEFAULT '0' COMMENT '只用于后台',
  `share_flag` tinyint(1) DEFAULT '0' COMMENT '共享标识',
  `creation_date` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  `method` varchar(45) NOT NULL COMMENT 'POST/GET',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `variants_U01` (`function_id`,`variant_name`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='程序变式表' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ct_function_variants`
--

INSERT INTO `ct_function_variants` (`id`, `function_id`, `variant_name`, `description`, `background_flag`, `share_flag`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `method`) VALUES
(1, 35, 'asdfasdf', 'asdf', 1, 0, 1420778895, 44, 1420778929, 44, 'POST'),
(2, 35, 'asdfaaaa', 'asdfasdf', 1, 0, 1420779631, 44, 1420779631, 44, 'POST'),
(3, 41, 'variant_test_post', 'post 变式测试', 1, 0, 1421125919, 44, 1421125919, 44, 'POST'),
(4, 41, 'variant_test_get', 'get 参数测试', 1, 0, 1421126067, 44, 1421126067, 44, 'GET');

-- --------------------------------------------------------

--
-- Table structure for table `ct_jobs`
--

CREATE TABLE IF NOT EXISTS `ct_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(45) NOT NULL COMMENT '作业名称',
  `description` varchar(45) NOT NULL COMMENT '作业描述',
  `output_type` varchar(45) NOT NULL COMMENT '输出类型',
  `period_flag` int(10) unsigned NOT NULL COMMENT '周期标识',
  `period_value` int(10) unsigned DEFAULT NULL COMMENT '周期值',
  `period_type` varchar(45) DEFAULT NULL COMMENT '周期类型',
  `first_exec_date` int(10) unsigned NOT NULL COMMENT '第一次运行日期',
  `inactive_date` int(10) unsigned DEFAULT NULL COMMENT '失效日期',
  `next_exec_date` int(10) unsigned DEFAULT NULL COMMENT '下一次运行时间',
  `creation_date` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  `sendto_list` text COMMENT '邮件发送的用户ID列表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `JOBS_U01` (`job_name`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台作业表' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ct_jobs`
--

INSERT INTO `ct_jobs` (`id`, `job_name`, `description`, `output_type`, `period_flag`, `period_value`, `period_type`, `first_exec_date`, `inactive_date`, `next_exec_date`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `sendto_list`) VALUES
(3, 'auto_feedback_job', '自动反馈投诉单打满分', 'txt', 1, 1, 'hour', 1420781264, NULL, 1420784864, 1420781014, 44, 1421721831, -1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ct_job_histories`
--

CREATE TABLE IF NOT EXISTS `ct_job_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL COMMENT '后台作业ID',
  `status` varchar(45) NOT NULL COMMENT '状态',
  `experience_date` int(10) unsigned DEFAULT NULL COMMENT '持续时间 单位秒',
  `start_date` int(10) unsigned DEFAULT NULL COMMENT '开始日期',
  `end_date` int(10) unsigned DEFAULT NULL COMMENT '结束日期',
  `creation_date` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台作业历史表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_job_outputs`
--

CREATE TABLE IF NOT EXISTS `ct_job_outputs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `history_id` int(10) unsigned NOT NULL,
  `log` longtext,
  `output` longtext,
  `creation_date` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  `output_type` varchar(45) NOT NULL COMMENT '输出类型',
  PRIMARY KEY (`id`),
  KEY `job_output_N01` (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台作业输出表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_job_steps`
--

CREATE TABLE IF NOT EXISTS `ct_job_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL COMMENT '后台作业',
  `step` varchar(45) NOT NULL COMMENT '步骤',
  `function_id` int(10) unsigned NOT NULL COMMENT '程序',
  `variant_id` int(10) unsigned DEFAULT NULL COMMENT '变式',
  `creation_date` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台作业步骤表' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ct_job_steps`
--

INSERT INTO `ct_job_steps` (`id`, `job_id`, `step`, `function_id`, `variant_id`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(4, 3, '1', 41, 4, 1421126524, 44, 1421719410, 44),
(6, 3, '2', 41, 3, 1421721040, 44, 1421721040, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_job_steps_v`
--
CREATE TABLE IF NOT EXISTS `ct_job_steps_v` (
`id` int(10) unsigned
,`job_id` int(10) unsigned
,`step` varchar(45)
,`function_id` int(10) unsigned
,`variant_id` int(10) unsigned
,`creation_date` int(10)
,`created_by` int(10)
,`last_update_date` int(10)
,`last_updated_by` int(10)
,`function_name` varchar(100)
,`function_desc` varchar(255)
,`controller` varchar(255)
,`action` varchar(255)
,`variant_name` varchar(45)
,`variant_desc` varchar(100)
,`method` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_meetings`
--

CREATE TABLE IF NOT EXISTS `ct_meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '会议主题',
  `start_date` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_date` int(10) unsigned NOT NULL COMMENT '结束时间',
  `site` varchar(100) NOT NULL COMMENT '会议地点',
  `anchor` varchar(45) NOT NULL COMMENT '主持人',
  `recorder` varchar(45) DEFAULT NULL COMMENT '记录人',
  `actor` varchar(255) NOT NULL COMMENT '参与者',
  `discuss` text COMMENT '会议决议',
  `cancel_reason` varchar(20) DEFAULT NULL COMMENT '取消原因',
  `cancel_remark` text COMMENT '备注',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  `inactive_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '失效标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会议信息表' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `ct_meetings`
--

INSERT INTO `ct_meetings` (`id`, `title`, `start_date`, `end_date`, `site`, `anchor`, `recorder`, `actor`, `discuss`, `cancel_reason`, `cancel_remark`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `inactive_flag`) VALUES
(1, 'asdf', 1412265600, 1412265600, 'sdfasdf', 'asdfasdf', 'asdf', 'asdfasdf', 'asdfasdf', NULL, NULL, 44, 1412301790, 1412301790, 44, 0),
(2, 'asdfasdf', 1412352000, 1412352000, 'sadf', 'asdf', 'asdf', 'asdf', 'asdf', NULL, NULL, 44, 1412305995, 1412305995, 44, 0),
(3, 'asdf', 1412265600, 1412265600, 'ggg', 'gg', 'gg', 'gg', NULL, '10', '阿三东帆', 44, 1412309412, 1412313261, 44, 1),
(4, 'asdf', 1413561600, 1413561600, 'asfd', 'asd', 'asfd', 'aadsf', NULL, '10', '', 44, 1413611547, 1413614005, 44, 1),
(5, '第二次会议', 1413623400, 1413642600, '会议室一', '陈杨阳', '', '全部人员', NULL, NULL, NULL, 44, 1413615576, 1413616445, 44, 0),
(6, '会议三', 1413567900, 1413568800, '暗室逢灯', '暗室逢灯', '', '暗室逢灯', NULL, '20', 'asdf', 44, 1413616500, 1415071784, 74, 1),
(7, '为了解决问题', 1414084200, 1414087800, '三楼会议室', '陈某某', '高某某', '部门全体人员', '会议决议如下', NULL, NULL, 73, 1414132468, 1415169356, 73, 0),
(8, '开个会', 1415040300, 1415044800, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', NULL, NULL, 74, 1415069247, 1415069247, 74, 0),
(9, '关于解决144投诉', 1416262260, 1416265860, '三楼会议室', '张经理', '陈某某', '全体员工', 'f', NULL, NULL, 44, 1416276843, 1416277187, 44, 0),
(10, '关于解决162投诉单的会议', 1417069800, 1417078800, '三楼会议室', '陈杨阳', '', '张三、李四', NULL, NULL, NULL, 73, 1417070046, 1417070046, 73, 0),
(11, '处理163投诉', 1417133460, 1417140660, '三楼会议室', 'chenyangyang', '', '质量部相关人员', NULL, NULL, NULL, 73, 1417172550, 1417172687, 73, 0),
(12, '阿斯顿飞洒', 1419580800, 1419584400, '五楼会议室', '陈杨阳', '', '全体人员', NULL, '10', '阿斯蒂芬', 73, 1419559559, 1419559581, 73, 1),
(13, '啊收到了房价', 1419840720, 1419876000, '三楼会议室', '客户投诉处理人', '', '超级管理员,客户投诉处理人', NULL, NULL, NULL, 73, 1419829946, 1419835531, 73, 0),
(14, 'asfasdf', 1420588800, 1420591500, 'asdf', '客户投诉处理人', '', '超级管理员', NULL, NULL, NULL, 73, 1420601373, 1420601445, 73, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ct_meeting_files`
--

CREATE TABLE IF NOT EXISTS `ct_meeting_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '文件描述',
  `created_by` int(10) DEFAULT NULL,
  `creation_date` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会议文件记录表' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ct_meeting_files`
--

INSERT INTO `ct_meeting_files` (`id`, `meeting_id`, `file_id`, `description`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(1, 1, 2, '会议纪要', 44, 1412316270, 1412316270, 44),
(2, 2, 3, 'asfd', 44, 1412391635, 1412391635, 44),
(3, 7, 13, 'adf', 73, 1414483483, 1414483483, 73),
(4, 7, 14, 'adf', 73, 1414483662, 1414483662, 73);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_meeting_files_v`
--
CREATE TABLE IF NOT EXISTS `ct_meeting_files_v` (
`id` int(10) unsigned
,`file_name` varchar(255)
,`file_type` varchar(255)
,`file_size` float
,`is_image` tinyint(3) unsigned
,`file_path` varchar(255)
,`full_path` varchar(255)
,`raw_name` varchar(100)
,`orig_name` varchar(255)
,`client_name` varchar(100)
,`file_ext` varchar(45)
,`image_width` int(10) unsigned
,`image_height` int(10) unsigned
,`image_type` varchar(45)
,`image_size_str` varchar(255)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`meeting_id` int(10) unsigned
,`description` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_messages`
--

CREATE TABLE IF NOT EXISTS `ct_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL COMMENT '分类ID',
  `message_code` varchar(20) NOT NULL COMMENT '消息码',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  `help` text COMMENT '帮助文档',
  `creation_date` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`message_code`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统消息表' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ct_messages`
--

INSERT INTO `ct_messages` (`id`, `class_id`, `message_code`, `content`, `help`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(2, 3, '10', '数据保存成功！', '', 1412917791, 44, 1413699874, 44),
(3, 4, '10', '系统未知错误，请联系管理员！', NULL, 1413091223, 44, 1413091223, 44),
(4, 3, '20', '数据保存失败！', '', 1413094460, 44, 1413699864, 44),
(5, 4, '20', '没有操作权限，请联系系统管理员！', NULL, 1413094784, 44, 1413094784, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_messages_v`
--
CREATE TABLE IF NOT EXISTS `ct_messages_v` (
`id` int(11)
,`class_id` int(11)
,`message_code` varchar(20)
,`content` varchar(255)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`class_code` varchar(20)
,`class_desc` varchar(255)
,`help` text
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_message_classes`
--

CREATE TABLE IF NOT EXISTS `ct_message_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(20) NOT NULL COMMENT '分类码',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_code` (`class_code`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统消息分类表' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ct_message_classes`
--

INSERT INTO `ct_message_classes` (`id`, `class_code`, `description`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(3, 'db', '数据库操作相关消息', 1412917773, 44, 1412917773, 44),
(4, 'system', '系统消息类', 1413091179, 44, 1413091179, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ct_module_header`
--

CREATE TABLE IF NOT EXISTS `ct_module_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL COMMENT '模块名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `display_class` varchar(100) DEFAULT NULL COMMENT '抬头图标样式码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统模块信息表' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ct_module_header`
--

INSERT INTO `ct_module_header` (`id`, `module_name`, `description`, `sort`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `display_class`) VALUES
(3, 'system_manage', '系统管理', 98, 1412060859, -1, 1413429712, 44, 'icon-cogs'),
(4, 'user_center', '用户中心', 2, 1413076355, 44, 1413077216, 44, 'icon-user'),
(5, 'order_create', '发布问题', 0, 1413076497, 44, 1413508328, 44, 'icon-edit'),
(6, 'order_manage', '我的投诉', 1, 1413076525, 44, 1413077210, 44, 'icon-comments'),
(7, 'message_manage', '我的提醒', 3, 1413076578, 44, 1413077203, 44, 'icon-envelope'),
(8, 'report', '报表', 4, 1415843197, 44, 1416272016, 44, 'icon-bar-chart');

-- --------------------------------------------------------

--
-- Table structure for table `ct_module_lines`
--

CREATE TABLE IF NOT EXISTS `ct_module_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL COMMENT '模块ID',
  `function_id` int(11) NOT NULL COMMENT '功能ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统模块明细表' AUTO_INCREMENT=65 ;

--
-- Dumping data for table `ct_module_lines`
--

INSERT INTO `ct_module_lines` (`id`, `module_id`, `function_id`, `sort`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(14, 3, 3, 0, 1412147498, 44, 1412147498, 44),
(18, 5, 1, 0, 1413076637, 44, 1413076637, 44),
(22, 6, 5, 0, 1413115587, 44, 1413115587, 44),
(23, 4, 6, 0, 1413115730, 44, 1413115730, 44),
(24, 7, 7, 0, 1413115831, 44, 1413115831, 44),
(25, 4, 8, 0, 1413425202, 44, 1413425202, 44),
(34, 3, 16, 0, 1413425762, 44, 1413425762, 44),
(36, 6, 18, 0, 1413543917, 44, 1413543917, 44),
(37, 5, 19, 0, 1413543926, 44, 1413543926, 44),
(38, 7, 20, 0, 1413544934, 44, 1413544934, 44),
(39, 3, 9, 0, 1413628063, 44, 1413628063, 44),
(40, 3, 10, 0, 1413628063, 44, 1413628063, 44),
(41, 3, 11, 0, 1413628063, 44, 1413628063, 44),
(42, 3, 12, 0, 1413628063, 44, 1413628063, 44),
(43, 3, 13, 0, 1413628063, 44, 1413628063, 44),
(44, 3, 14, 0, 1413628063, 44, 1413628063, 44),
(45, 3, 21, 0, 1413683578, 44, 1413683578, 44),
(46, 3, 15, 0, 1413699819, 44, 1413699819, 44),
(47, 6, 22, 0, 1413858270, 44, 1413858270, 44),
(48, 3, 23, 0, 1414116986, 44, 1414116986, 44),
(49, 4, 25, 0, 1414638752, 44, 1414638752, 44),
(50, 6, 24, 0, 1415067128, 44, 1415067128, 44),
(51, 6, 26, 0, 1415067128, 44, 1415067128, 44),
(52, 6, 27, 0, 1415067128, 44, 1415067128, 44),
(53, 6, 28, 0, 1415067128, 44, 1415067128, 44),
(54, 6, 29, 0, 1415067128, 44, 1415067128, 44),
(55, 6, 30, 0, 1415067128, 44, 1415067128, 44),
(56, 6, 31, 0, 1415067128, 44, 1415067128, 44),
(57, 6, 32, 0, 1415067128, 44, 1415067128, 44),
(58, 3, 33, 0, 1415666811, 44, 1415666811, 44),
(59, 3, 34, 0, 1415753963, 44, 1415753963, 44),
(60, 8, 35, 0, 1415843209, 44, 1415843209, 44),
(61, 8, 36, 0, 1415853160, 44, 1415853160, 44),
(62, 3, 37, 0, 1419739172, 44, 1419739172, 44),
(63, 3, 39, 0, 1420334862, 44, 1420334862, 44),
(64, 3, 40, 0, 1420519242, 44, 1420519242, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_module_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_module_lines_v` (
`id` int(11)
,`module_id` int(11)
,`function_id` int(11)
,`sort` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`module_name` varchar(100)
,`module_desc` varchar(255)
,`function_name` varchar(100)
,`function_desc` varchar(255)
,`module_sort` int(11)
,`controller` varchar(255)
,`action` varchar(255)
,`display_flag` tinyint(3) unsigned
,`function_display_class` varchar(100)
,`module_display_class` varchar(100)
,`blank_flag` tinyint(3) unsigned
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_module_line_objects_v`
--
CREATE TABLE IF NOT EXISTS `ct_module_line_objects_v` (
`id` int(11)
,`module_id` int(11)
,`function_id` int(11)
,`sort` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`module_name` varchar(100)
,`module_desc` varchar(255)
,`function_name` varchar(100)
,`function_desc` varchar(255)
,`module_sort` int(11)
,`controller` varchar(255)
,`action` varchar(255)
,`display_flag` tinyint(3) unsigned
,`function_display_class` varchar(100)
,`module_display_class` varchar(100)
,`object_id` int(10) unsigned
,`object_name` varchar(20)
,`object_desc` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_notices`
--

CREATE TABLE IF NOT EXISTS `ct_notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) DEFAULT NULL,
  `read_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `content` text COMMENT '内容',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `order_id` int(11) DEFAULT NULL COMMENT '投诉单ID',
  `received_by` int(11) NOT NULL COMMENT '接收人',
  `direct_url` varchar(255) DEFAULT NULL COMMENT '直接跳转至URL',
  `with_manager` tinyint(4) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `creation_date` int(11) NOT NULL,
  `last_update_date` int(11) NOT NULL,
  `last_updated_by` int(11) NOT NULL,
  `notice_type` varchar(45) NOT NULL DEFAULT 'log',
  PRIMARY KEY (`id`),
  KEY `Index_2` (`creation_date`,`received_by`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户通知信息表' AUTO_INCREMENT=388 ;

--
-- Dumping data for table `ct_notices`
--

INSERT INTO `ct_notices` (`id`, `log_id`, `read_flag`, `content`, `title`, `order_id`, `received_by`, `direct_url`, `with_manager`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `notice_type`) VALUES
(1, 195, 0, '投诉单提交', '投诉单 105 提交', 105, 48, NULL, 1, 45, 1413690191, 1416204824, 48, 'log'),
(2, 195, 0, '投诉单提交', '投诉单 105 提交', 105, 72, NULL, 1, 45, 1413690191, 1413690191, 45, 'log'),
(3, 197, 0, '责任人从 未知 变成 质量经理测试账号', '投诉单 105 责任人变更', 105, 67, NULL, 1, 48, 1413692963, 1413694252, 67, 'log'),
(4, 199, 0, '已确认 => 已分配', '投诉单 105状态更新', 105, 67, NULL, 1, 48, 1413692963, 1413694252, 67, 'log'),
(5, 200, 0, '已分配 => 已解决', '投诉单 105状态更新', 105, 45, NULL, 1, 67, 1413693326, 1413693383, 45, 'log'),
(6, 201, 0, '已解决 => 已关闭', '投诉单 105状态更新', 105, 67, NULL, 1, 45, 1413693574, 1413694252, 67, 'log'),
(8, 202, 0, '已关闭 => 重新打开', '投诉单 105状态更新', 105, 67, NULL, 1, 45, 1413693681, 1413694252, 67, 'log'),
(9, 202, 0, '已关闭 => 重新打开', '投诉单 105状态更新', 105, 48, NULL, 1, 45, 1413693681, 1416204824, 48, 'log'),
(10, 202, 0, '已关闭 => 重新打开', '投诉单 105状态更新', 105, 72, NULL, 1, 45, 1413693681, 1413693681, 45, 'log'),
(11, 203, 0, '重新打开 => 已关闭', '投诉单 105状态更新', 105, 67, NULL, 1, 45, 1413693686, 1413694252, 67, 'log'),
(13, 204, 0, '投诉单提交', '投诉单 106 提交', 106, 48, NULL, 1, 46, 1413697975, 1416204824, 48, 'log'),
(14, 204, 0, '投诉单提交', '投诉单 106 提交', 106, 72, NULL, 1, 46, 1413697975, 1413697975, 46, 'log'),
(15, 205, 0, '投诉单提交', '投诉单 107 提交', 107, 48, NULL, 1, 47, 1413698090, 1416204824, 48, 'log'),
(16, 205, 0, '投诉单提交', '投诉单 107 提交', 107, 72, NULL, 1, 47, 1413698090, 1413698090, 47, 'log'),
(17, 208, 0, '已确认 => 已分配', '投诉单 106状态更新', 106, 66, NULL, 1, 48, 1413699138, 1413699138, 48, 'log'),
(18, 210, 0, '责任人从 未知 变成 采购经理测试账号', '投诉单 106 责任人变更', 106, 66, NULL, 1, 48, 1413699138, 1413699210, 66, 'log'),
(19, 211, 0, '已分配 => 已解决', '投诉单 106状态更新', 106, 46, NULL, 1, 66, 1413699246, 1413700632, 46, 'log'),
(20, 212, 0, '投诉单提交', '投诉单 108 提交', 108, 48, NULL, 1, 69, 1413699551, 1416204824, 48, 'log'),
(21, 212, 0, '投诉单提交', '投诉单 108 提交', 108, 72, NULL, 1, 69, 1413699551, 1413699551, 69, 'log'),
(22, 213, 0, '投诉单提交', '投诉单 109 提交', 109, 48, NULL, 1, 69, 1413699577, 1416204824, 48, 'log'),
(23, 213, 0, '投诉单提交', '投诉单 109 提交', 109, 72, NULL, 1, 69, 1413699577, 1413699577, 69, 'log'),
(24, 214, 0, '投诉单提交', '投诉单 110 提交', 110, 48, NULL, 1, 69, 1413699619, 1416204824, 48, 'log'),
(25, 214, 0, '投诉单提交', '投诉单 110 提交', 110, 72, NULL, 1, 69, 1413699619, 1413699619, 69, 'log'),
(26, 215, 0, '投诉单提交', '投诉单 111 提交', 111, 48, NULL, 1, 69, 1413699643, 1416204824, 48, 'log'),
(27, 215, 0, '投诉单提交', '投诉单 111 提交', 111, 72, NULL, 1, 69, 1413699643, 1413699643, 69, 'log'),
(28, 216, 0, '投诉单提交', '投诉单 112 提交', 112, 48, NULL, 1, 69, 1413699678, 1416204824, 48, 'log'),
(29, 216, 0, '投诉单提交', '投诉单 112 提交', 112, 72, NULL, 1, 69, 1413699678, 1413699678, 69, 'log'),
(30, 217, 0, '投诉单提交', '投诉单 113 提交', 113, 48, NULL, 1, 69, 1413699714, 1416204824, 48, 'log'),
(31, 217, 0, '投诉单提交', '投诉单 113 提交', 113, 72, NULL, 1, 69, 1413699714, 1413699714, 69, 'log'),
(32, 218, 0, '投诉单提交', '投诉单 114 提交', 114, 48, NULL, 1, 69, 1413699726, 1416204824, 48, 'log'),
(33, 218, 0, '投诉单提交', '投诉单 114 提交', 114, 72, NULL, 1, 69, 1413699726, 1413699726, 69, 'log'),
(34, 219, 0, '投诉单提交', '投诉单 115 提交', 115, 48, NULL, 1, 69, 1413699736, 1416204824, 48, 'log'),
(35, 219, 0, '投诉单提交', '投诉单 115 提交', 115, 72, NULL, 1, 69, 1413699736, 1413699736, 69, 'log'),
(36, 220, 0, '投诉单提交', '投诉单 116 提交', 116, 48, NULL, 1, 69, 1413699897, 1416204824, 48, 'log'),
(37, 220, 0, '投诉单提交', '投诉单 116 提交', 116, 72, NULL, 1, 69, 1413699897, 1413699897, 69, 'log'),
(38, 222, 0, '已确认 => 已分配', '投诉单 114状态更新', 114, 66, NULL, 1, 48, 1413700129, 1413700129, 48, 'log'),
(39, 224, 0, '责任人从 未知 变成 采购经理测试账号', '投诉单 114 责任人变更', 114, 66, NULL, 1, 48, 1413700129, 1413700129, 48, 'log'),
(40, 226, 0, '投诉单提交', '投诉单 117 提交', 117, 48, NULL, 1, 69, 1413700212, 1416204824, 48, 'log'),
(41, 226, 0, '投诉单提交', '投诉单 117 提交', 117, 72, NULL, 1, 69, 1413700212, 1413700212, 69, 'log'),
(42, 227, 0, '投诉单提交', '投诉单 118 提交', 118, 48, NULL, 1, 69, 1413700252, 1416204824, 48, 'log'),
(43, 227, 0, '投诉单提交', '投诉单 118 提交', 118, 72, NULL, 1, 69, 1413700252, 1413700252, 69, 'log'),
(44, 229, 0, '已确认 => 已分配', '投诉单 115状态更新', 115, 66, NULL, 1, 48, 1413700526, 1413700526, 48, 'log'),
(45, 231, 0, '责任人从 未知 变成 采购经理测试账号', '投诉单 115 责任人变更', 115, 66, NULL, 1, 48, 1413700527, 1413701458, 66, 'log'),
(46, 232, 0, '已解决 => 已关闭', '投诉单 106状态更新', 106, 66, NULL, 1, 66, 1413700532, 1413700532, 66, 'log'),
(48, 234, 0, '已分配 => 已解决', '投诉单 115状态更新', 115, 69, NULL, 1, 66, 1413700621, 1413700621, 66, 'log'),
(49, 235, 0, '已解决 => 已关闭', '投诉单 115状态更新', 115, 66, NULL, 1, 66, 1413700629, 1413700713, 66, 'log'),
(51, 236, 0, '投诉单提交', '投诉单 119 提交', 119, 48, NULL, 1, 45, 1413702543, 1416204824, 48, 'log'),
(52, 236, 0, '投诉单提交', '投诉单 119 提交', 119, 72, NULL, 1, 45, 1413702543, 1413702543, 45, 'log'),
(53, 237, 0, '投诉单提交', '投诉单 120 提交', 120, 48, NULL, 1, 46, 1413704181, 1416204824, 48, 'log'),
(54, 237, 0, '投诉单提交', '投诉单 120 提交', 120, 72, NULL, 1, 46, 1413704181, 1413704181, 46, 'log'),
(55, 239, 0, '已确认 => 已分配', '投诉单 120状态更新', 120, 66, NULL, 1, 48, 1413704210, 1413704210, 48, 'log'),
(56, 241, 0, '责任人从 未知 变成 采购经理测试账号', '投诉单 120 责任人变更', 120, 66, NULL, 1, 48, 1413704210, 1413859816, 66, 'log'),
(57, 244, 0, '投诉单提交', '投诉单 121 提交', 121, 48, NULL, 1, 45, 1413705930, 1416204824, 48, 'log'),
(58, 244, 0, '投诉单提交', '投诉单 121 提交', 121, 72, NULL, 1, 45, 1413705930, 1413705930, 45, 'log'),
(59, 246, 0, '已确认 => 已分配', '投诉单 121状态更新', 121, 67, NULL, 1, 48, 1413706335, 1413706335, 48, 'log'),
(60, 248, 0, '责任人从 未知 变成 质量经理测试账号', '投诉单 121 责任人变更', 121, 67, NULL, 1, 48, 1413706335, 1413706410, 67, 'log'),
(61, 250, 1, '已分配 => 已解决', '投诉单 121状态更新', 121, 45, NULL, 1, 67, 1413706843, 1417270477, 45, 'log'),
(62, 251, 0, '已解决 => 已关闭', '投诉单 121状态更新', 121, 67, NULL, 1, 45, 1413707410, 1413707410, 45, 'log'),
(64, 256, 0, '由  未知 变更为 采购经理测试账号', '投诉单 116  责任人变更', 116, 0, NULL, 1, 48, 1413947791, 1413947791, 48, 'log'),
(65, 256, 0, '由  未知 变更为 采购经理测试账号', '投诉单 116  责任人变更', 116, 66, NULL, 1, 48, 1413947791, 1413947834, 66, 'log'),
(66, 257, 0, '由  未知 变更为 采购经理测试账号', '投诉单 113  责任人变更', 113, 0, NULL, 1, 48, 1413952050, 1413952050, 48, 'log'),
(67, 257, 0, '由  未知 变更为 采购经理测试账号', '投诉单 113  责任人变更', 113, 66, NULL, 1, 48, 1413952050, 1413953342, 66, 'log'),
(68, 260, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 113 处理人变更', 113, 74, NULL, 1, 48, 1413952051, 1413960759, 74, 'log'),
(69, 262, 0, '由  未知 变更为 质量经理测试账号', '投诉单 122  责任人变更', 122, 0, NULL, 1, 48, 1413952680, 1413952680, 48, 'log'),
(70, 262, 0, '由  未知 变更为 质量经理测试账号', '投诉单 122  责任人变更', 122, 67, NULL, 1, 48, 1413952680, 1413952680, 48, 'log'),
(71, 265, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 122 处理人变更', 122, 73, NULL, 1, 48, 1413952681, 1419917291, 73, 'log'),
(72, 269, 0, '由  未知 变更为 质量经理测试账号', '投诉单 123  责任人变更', 123, 0, NULL, 1, 48, 1413953611, 1413953611, 48, 'log'),
(73, 269, 0, '由  未知 变更为 质量经理测试账号', '投诉单 123  责任人变更', 123, 67, NULL, 1, 48, 1413953611, 1413953703, 67, 'log'),
(74, 269, 1, '由  未知 变更为 质量经理测试账号', '投诉单 123  责任人变更', 123, 73, NULL, 1, 48, 1413953611, 1419917291, 73, 'log'),
(75, 271, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 123 处理人变更', 123, 73, NULL, 1, 48, 1413953611, 1419917291, 73, 'log'),
(76, 273, 0, '投诉单提交', '投诉单 125 提交', 125, 48, NULL, 1, 45, 1413953983, 1416204824, 48, 'log'),
(77, 273, 0, '投诉单提交', '投诉单 125 提交', 125, 72, NULL, 1, 45, 1413953983, 1413953983, 45, 'log'),
(78, 275, 0, '由  未知 变更为 质量经理测试账号', '投诉单 125  责任人变更', 125, 0, NULL, 1, 48, 1413954057, 1413954057, 48, 'log'),
(79, 275, 0, '由  未知 变更为 质量经理测试账号', '投诉单 125  责任人变更', 125, 67, NULL, 1, 48, 1413954057, 1413954057, 48, 'log'),
(80, 275, 1, '由  未知 变更为 质量经理测试账号', '投诉单 125  责任人变更', 125, 73, NULL, 1, 48, 1413954057, 1419917291, 73, 'log'),
(81, 277, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 125 处理人变更', 125, 73, NULL, 1, 48, 1413954057, 1419917291, 73, 'log'),
(82, 283, 0, '投诉单提交', '投诉单 126 提交', 126, 48, NULL, 1, 70, 1413963519, 1416204824, 48, 'log'),
(83, 283, 0, '投诉单提交', '投诉单 126 提交', 126, 72, NULL, 1, 70, 1413963519, 1413963519, 70, 'log'),
(84, 285, 0, '由  未知 变更为 质量经理测试账号', '投诉单 126  责任人变更', 126, 0, NULL, 1, 70, 1413963521, 1413963521, 70, 'log'),
(85, 285, 0, '由  未知 变更为 质量经理测试账号', '投诉单 126  责任人变更', 126, 67, NULL, 1, 70, 1413963521, 1413963521, 70, 'log'),
(86, 285, 1, '由  未知 变更为 质量经理测试账号', '投诉单 126  责任人变更', 126, 73, NULL, 1, 70, 1413963521, 1419917291, 73, 'log'),
(87, 287, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 126 处理人变更', 126, 73, NULL, 1, 70, 1413963521, 1419917291, 73, 'log'),
(88, 288, 0, '投诉单提交', '投诉单 127 提交', 127, 48, NULL, 1, 70, 1413963526, 1416204824, 48, 'log'),
(89, 288, 0, '投诉单提交', '投诉单 127 提交', 127, 72, NULL, 1, 70, 1413963526, 1413963526, 70, 'log'),
(90, 290, 0, '由  未知 变更为 质量经理测试账号', '投诉单 127  责任人变更', 127, 0, NULL, 1, 70, 1413963529, 1413963529, 70, 'log'),
(91, 290, 0, '由  未知 变更为 质量经理测试账号', '投诉单 127  责任人变更', 127, 67, NULL, 1, 70, 1413963529, 1413963529, 70, 'log'),
(92, 290, 1, '由  未知 变更为 质量经理测试账号', '投诉单 127  责任人变更', 127, 73, NULL, 1, 70, 1413963529, 1419917291, 73, 'log'),
(93, 292, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 127 处理人变更', 127, 73, NULL, 1, 70, 1413963529, 1419917291, 73, 'log'),
(94, 293, 0, '投诉单提交', '投诉单 128 提交', 128, 48, NULL, 1, 70, 1413963584, 1416204824, 48, 'log'),
(95, 293, 0, '投诉单提交', '投诉单 128 提交', 128, 72, NULL, 1, 70, 1413963584, 1413963584, 70, 'log'),
(96, 295, 0, '由  未知 变更为 质量经理测试账号', '投诉单 128  责任人变更', 128, 0, NULL, 1, 70, 1413963586, 1413963586, 70, 'log'),
(97, 295, 0, '由  未知 变更为 质量经理测试账号', '投诉单 128  责任人变更', 128, 67, NULL, 1, 70, 1413963586, 1413963586, 70, 'log'),
(98, 295, 1, '由  未知 变更为 质量经理测试账号', '投诉单 128  责任人变更', 128, 73, NULL, 1, 70, 1413963586, 1419917291, 73, 'log'),
(99, 297, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 128 处理人变更', 128, 73, NULL, 1, 70, 1413963586, 1419917291, 73, 'log'),
(100, 298, 0, '投诉单提交', '投诉单 129 提交', 129, 48, NULL, 1, 70, 1413963626, 1416204824, 48, 'log'),
(101, 298, 0, '投诉单提交', '投诉单 129 提交', 129, 72, NULL, 1, 70, 1413963626, 1413963626, 70, 'log'),
(102, 300, 0, '由  未知 变更为 质量经理测试账号', '投诉单 129  责任人变更', 129, 0, NULL, 1, 70, 1413963628, 1413963628, 70, 'log'),
(103, 300, 0, '由  未知 变更为 质量经理测试账号', '投诉单 129  责任人变更', 129, 67, NULL, 1, 70, 1413963628, 1413963628, 70, 'log'),
(104, 300, 1, '由  未知 变更为 质量经理测试账号', '投诉单 129  责任人变更', 129, 73, NULL, 1, 70, 1413963628, 1419917291, 73, 'log'),
(105, 302, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 129 处理人变更', 129, 73, NULL, 1, 70, 1413963628, 1419917291, 73, 'log'),
(106, 303, 0, '投诉单提交', '投诉单 130 提交', 130, 48, NULL, 1, 70, 1413963633, 1416204824, 48, 'log'),
(107, 303, 0, '投诉单提交', '投诉单 130 提交', 130, 72, NULL, 1, 70, 1413963633, 1413963633, 70, 'log'),
(108, 304, 0, '投诉单提交', '投诉单 131 提交', 131, 48, NULL, 1, 70, 1413963994, 1416204824, 48, 'log'),
(109, 304, 0, '投诉单提交', '投诉单 131 提交', 131, 72, NULL, 1, 70, 1413963994, 1413963994, 70, 'log'),
(110, 306, 0, '由  未知 变更为 质量经理测试账号', '投诉单 131  责任人变更', 131, 0, NULL, 1, 70, 1413963995, 1413963995, 70, 'log'),
(111, 306, 0, '由  未知 变更为 质量经理测试账号', '投诉单 131  责任人变更', 131, 67, NULL, 1, 70, 1413963995, 1413963995, 70, 'log'),
(112, 308, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 131 处理人变更', 131, 73, NULL, 1, 70, 1413963996, 1419917291, 73, 'log'),
(113, 309, 0, '投诉单提交', '投诉单 132 提交', 132, 48, NULL, 1, 70, 1413964193, 1416204824, 48, 'log'),
(114, 309, 0, '投诉单提交', '投诉单 132 提交', 132, 72, NULL, 1, 70, 1413964193, 1413964193, 70, 'log'),
(115, 311, 0, '由  未知 变更为 质量经理测试账号', '投诉单 132  责任人变更', 132, 0, NULL, 1, 70, 1413964194, 1413964194, 70, 'log'),
(116, 311, 0, '由  未知 变更为 质量经理测试账号', '投诉单 132  责任人变更', 132, 67, NULL, 1, 70, 1413964194, 1413964194, 70, 'log'),
(117, 313, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 132 处理人变更', 132, 73, NULL, 1, 70, 1413964195, 1419917291, 73, 'log'),
(118, 314, 0, '投诉单提交', '投诉单 133 提交', 133, 48, NULL, 1, 70, 1413964856, 1416204824, 48, 'log'),
(119, 314, 0, '投诉单提交', '投诉单 133 提交', 133, 72, NULL, 1, 70, 1413964856, 1413964856, 70, 'log'),
(120, 316, 0, '由  未知 变更为 质量经理测试账号', '投诉单 133  责任人变更', 133, 0, NULL, 1, 70, 1413964857, 1413964857, 70, 'log'),
(121, 316, 0, '由  未知 变更为 质量经理测试账号', '投诉单 133  责任人变更', 133, 67, NULL, 1, 70, 1413964857, 1413964857, 70, 'log'),
(122, 318, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 133 处理人变更', 133, 73, NULL, 1, 70, 1413964858, 1419917291, 73, 'log'),
(123, 319, 0, '投诉单提交', '投诉单 134 提交', 134, 48, NULL, 1, 70, 1413964919, 1416204824, 48, 'log'),
(124, 319, 0, '投诉单提交', '投诉单 134 提交', 134, 72, NULL, 1, 70, 1413964919, 1413964919, 70, 'log'),
(125, 321, 0, '由  未知 变更为 质量经理测试账号', '投诉单 134  责任人变更', 134, 0, NULL, 1, 70, 1413964920, 1413964920, 70, 'log'),
(126, 321, 0, '由  未知 变更为 质量经理测试账号', '投诉单 134  责任人变更', 134, 67, NULL, 1, 70, 1413964920, 1413964920, 70, 'log'),
(127, 323, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 134 处理人变更', 134, 73, NULL, 1, 70, 1413964921, 1419917291, 73, 'log'),
(128, 324, 0, '投诉单提交', '投诉单 135 提交', 135, 48, NULL, 1, 70, 1413965184, 1416204824, 48, 'log'),
(129, 324, 0, '投诉单提交', '投诉单 135 提交', 135, 72, NULL, 1, 70, 1413965184, 1413965184, 70, 'log'),
(130, 326, 0, '投诉单提交', '投诉单 136 提交', 136, 48, NULL, 1, 70, 1413965551, 1416204824, 48, 'log'),
(131, 326, 0, '投诉单提交', '投诉单 136 提交', 136, 72, NULL, 1, 70, 1413965551, 1413965551, 70, 'log'),
(132, 328, 0, '由  未知 变更为 质量经理测试账号', '投诉单 136  责任人变更', 136, 0, NULL, 1, 70, 1413965552, 1413965552, 70, 'log'),
(133, 328, 0, '由  未知 变更为 质量经理测试账号', '投诉单 136  责任人变更', 136, 67, NULL, 1, 70, 1413965552, 1413965552, 70, 'log'),
(134, 329, 0, '投诉单提交', '投诉单 137 提交', 137, 48, NULL, 1, 70, 1413965788, 1416204824, 48, 'log'),
(135, 329, 0, '投诉单提交', '投诉单 137 提交', 137, 72, NULL, 1, 70, 1413965788, 1413965788, 70, 'log'),
(136, 331, 0, '由  未知 变更为 质量经理测试账号', '投诉单 137  责任人变更', 137, 0, NULL, 1, 70, 1413965789, 1413965789, 70, 'log'),
(137, 331, 0, '由  未知 变更为 质量经理测试账号', '投诉单 137  责任人变更', 137, 67, NULL, 1, 70, 1413965789, 1413965789, 70, 'log'),
(138, 333, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 137 处理人变更', 137, 73, NULL, 1, 70, 1413965790, 1419917291, 73, 'log'),
(139, 334, 0, '投诉单提交', '投诉单 138 提交', 138, 48, NULL, 1, 70, 1413965796, 1416204824, 48, 'log'),
(140, 334, 0, '投诉单提交', '投诉单 138 提交', 138, 72, NULL, 1, 70, 1413965796, 1413965796, 70, 'log'),
(141, 336, 0, '由  未知 变更为 质量经理测试账号', '投诉单 138  责任人变更', 138, 0, NULL, 1, 70, 1413965797, 1413965797, 70, 'log'),
(142, 336, 0, '由  未知 变更为 质量经理测试账号', '投诉单 138  责任人变更', 138, 67, NULL, 1, 70, 1413965797, 1413965797, 70, 'log'),
(143, 338, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 138 处理人变更', 138, 73, NULL, 1, 70, 1413965798, 1419917291, 73, 'log'),
(144, 339, 0, '投诉单提交', '投诉单 139 提交', 139, 48, NULL, 1, 70, 1413965830, 1416204824, 48, 'log'),
(145, 339, 0, '投诉单提交', '投诉单 139 提交', 139, 72, NULL, 1, 70, 1413965830, 1413965830, 70, 'log'),
(146, 341, 0, '由  未知 变更为 质量经理测试账号', '投诉单 139  责任人变更', 139, 0, NULL, 1, 70, 1413965831, 1413965831, 70, 'log'),
(147, 341, 0, '由  未知 变更为 质量经理测试账号', '投诉单 139  责任人变更', 139, 67, NULL, 1, 70, 1413965831, 1413965831, 70, 'log'),
(148, 342, 0, '投诉单提交', '投诉单 140 提交', 140, 48, NULL, 1, 70, 1413965875, 1416204824, 48, 'log'),
(149, 342, 0, '投诉单提交', '投诉单 140 提交', 140, 72, NULL, 1, 70, 1413965875, 1413965875, 70, 'log'),
(150, 344, 0, '由  未知 变更为 质量经理测试账号', '投诉单 140  责任人变更', 140, 0, NULL, 1, 70, 1413965876, 1413965876, 70, 'log'),
(151, 344, 0, '由  未知 变更为 质量经理测试账号', '投诉单 140  责任人变更', 140, 67, NULL, 1, 70, 1413965876, 1413965876, 70, 'log'),
(152, 345, 0, '投诉单提交', '投诉单 141 提交', 141, 48, NULL, 1, 70, 1413965895, 1416204824, 48, 'log'),
(153, 345, 0, '投诉单提交', '投诉单 141 提交', 141, 72, NULL, 1, 70, 1413965895, 1413965895, 70, 'log'),
(154, 347, 0, '由  未知 变更为 质量经理测试账号', '投诉单 141  责任人变更', 141, 0, NULL, 1, 70, 1413965896, 1413965896, 70, 'log'),
(155, 347, 0, '由  未知 变更为 质量经理测试账号', '投诉单 141  责任人变更', 141, 67, NULL, 1, 70, 1413965896, 1413965896, 70, 'log'),
(156, 349, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 141 处理人变更', 141, 73, NULL, 1, 70, 1413965897, 1419917291, 73, 'log'),
(157, 350, 0, '投诉单提交', '投诉单 142 提交', 142, 48, NULL, 1, 45, 1414023602, 1416204824, 48, 'log'),
(158, 350, 0, '投诉单提交', '投诉单 142 提交', 142, 72, NULL, 1, 45, 1414023602, 1414023602, 45, 'log'),
(159, 352, 0, '由  未知 变更为 质量经理测试账号', '投诉单 142  责任人变更', 142, 0, NULL, 1, 48, 1414023622, 1414023622, 48, 'log'),
(160, 352, 0, '由  未知 变更为 质量经理测试账号', '投诉单 142  责任人变更', 142, 67, NULL, 1, 48, 1414023622, 1414023622, 48, 'log'),
(161, 354, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 142 处理人变更', 142, 73, NULL, 1, 48, 1414023622, 1419917291, 73, 'log'),
(162, 355, 0, '投诉单提交', '投诉单 143 提交', 143, 48, NULL, 1, 70, 1414023982, 1416204824, 48, 'log'),
(163, 355, 0, '投诉单提交', '投诉单 143 提交', 143, 72, NULL, 1, 70, 1414023982, 1414023982, 70, 'log'),
(164, 357, 0, '由  未知 变更为 质量经理测试账号', '投诉单 143  责任人变更', 143, 0, NULL, 1, 70, 1414023983, 1414023983, 70, 'log'),
(165, 357, 0, '由  未知 变更为 质量经理测试账号', '投诉单 143  责任人变更', 143, 67, NULL, 1, 70, 1414023983, 1414049717, 67, 'log'),
(166, 359, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 143 处理人变更', 143, 73, NULL, 1, 70, 1414023984, 1419917291, 73, 'log'),
(167, 360, 0, '投诉单提交', '投诉单 144 提交', 144, 48, NULL, 1, 71, 1414024058, 1416204824, 48, 'log'),
(168, 360, 0, '投诉单提交', '投诉单 144 提交', 144, 72, NULL, 1, 71, 1414024058, 1414024058, 71, 'log'),
(169, 362, 0, '由  未知 变更为 采购经理测试账号', '投诉单 144  责任人变更', 144, 0, NULL, 1, 71, 1414024059, 1414024059, 71, 'log'),
(170, 362, 0, '由  未知 变更为 采购经理测试账号', '投诉单 144  责任人变更', 144, 66, NULL, 1, 71, 1414024059, 1414460333, 66, 'log'),
(171, 364, 0, '投诉单提交', '投诉单 145 提交', 145, 48, NULL, 1, 70, 1414024378, 1416204824, 48, 'log'),
(172, 364, 0, '投诉单提交', '投诉单 145 提交', 145, 72, NULL, 1, 70, 1414024378, 1414024378, 70, 'log'),
(173, 367, 0, '投诉单提交', '投诉单 146 提交', 146, 48, NULL, 1, 47, 1414049889, 1416204824, 48, 'log'),
(174, 367, 0, '投诉单提交', '投诉单 146 提交', 146, 72, NULL, 1, 47, 1414049889, 1414049889, 47, 'log'),
(175, 368, 0, '投诉单提交', '投诉单 147 提交', 147, 48, NULL, 1, 45, 1414050787, 1416204824, 48, 'log'),
(176, 368, 0, '投诉单提交', '投诉单 147 提交', 147, 72, NULL, 1, 45, 1414050787, 1414050787, 45, 'log'),
(177, 370, 0, '投诉单提交', '投诉单 148 提交', 148, 48, NULL, 1, 45, 1414120205, 1416204824, 48, 'log'),
(178, 370, 0, '投诉单提交', '投诉单 148 提交', 148, 72, NULL, 1, 45, 1414120205, 1414120205, 45, 'log'),
(179, 371, 0, '投诉单提交', '投诉单 149 提交', 149, 48, NULL, 1, 45, 1414131122, 1416204824, 48, 'log'),
(180, 371, 0, '投诉单提交', '投诉单 149 提交', 149, 72, NULL, 1, 45, 1414131122, 1414131122, 45, 'log'),
(181, 373, 0, '由  未知 变更为 质量经理测试账号', '投诉单 149  责任人变更', 149, 0, NULL, 1, 48, 1414131148, 1414131148, 48, 'log'),
(182, 373, 0, '由  未知 变更为 质量经理测试账号', '投诉单 149  责任人变更', 149, 67, NULL, 1, 48, 1414131148, 1414131163, 67, 'log'),
(183, 375, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 149 处理人变更', 149, 73, NULL, 1, 67, 1414131264, 1419917291, 73, 'log'),
(184, 379, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 144 处理人变更', 144, 74, NULL, 1, 66, 1414460151, 1414460151, 66, 'log'),
(185, 381, 0, '已解决 => 已关闭', '投诉单 144状态更新', 144, 74, 'order/feedback?id=144', 1, 66, 1414460189, 1414460413, 74, 'feedback'),
(186, 384, 0, '投诉单提交', '投诉单 150 提交', 150, 48, NULL, 1, 46, 1414819457, 1416204824, 48, 'log'),
(187, 384, 0, '投诉单提交', '投诉单 150 提交', 150, 72, NULL, 1, 46, 1414819457, 1414819457, 46, 'log'),
(188, 386, 0, '投诉单提交', '投诉单 151 提交', 151, 48, NULL, 1, 45, 1414819640, 1416204824, 48, 'log'),
(189, 386, 0, '投诉单提交', '投诉单 151 提交', 151, 72, NULL, 1, 45, 1414819640, 1414819640, 45, 'log'),
(190, 391, 0, '由  未知 变更为 质量经理测试账号', '投诉单 124  责任人变更', 124, 0, NULL, 1, 48, 1414820034, 1414820034, 48, 'log'),
(191, 391, 0, '由  未知 变更为 质量经理测试账号', '投诉单 124  责任人变更', 124, 67, NULL, 1, 48, 1414820034, 1414821213, 67, 'log'),
(192, 393, 0, '由  未知 变更为 采购经理测试账号', '投诉单 111  责任人变更', 111, 0, NULL, 1, 48, 1414820060, 1414820060, 48, 'log'),
(193, 393, 0, '由  未知 变更为 采购经理测试账号', '投诉单 111  责任人变更', 111, 66, NULL, 1, 48, 1414820060, 1414820060, 48, 'log'),
(194, 395, 0, '由  未知 变更为 采购经理测试账号', '投诉单 110  责任人变更', 110, 0, NULL, 1, 48, 1414820117, 1414820117, 48, 'log'),
(195, 395, 0, '由  未知 变更为 采购经理测试账号', '投诉单 110  责任人变更', 110, 66, NULL, 1, 48, 1414820117, 1414820117, 48, 'log'),
(196, 397, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 110 处理人变更', 110, 74, NULL, 1, 48, 1414820118, 1414820118, 48, 'log'),
(197, 402, 1, '已解决 => 已关闭', '投诉单 149状态更新', 149, 73, NULL, 1, 67, 1414821084, 1419917291, 73, 'log'),
(198, 404, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 124 处理人变更', 124, 73, NULL, 1, 67, 1414821241, 1419917291, 73, 'log'),
(199, 406, 0, '由  未知 变更为 采购经理测试账号', '投诉单 109  责任人变更', 109, 0, NULL, 1, 48, 1415061784, 1415061784, 48, 'log'),
(200, 406, 0, '由  未知 变更为 采购经理测试账号', '投诉单 109  责任人变更', 109, 66, NULL, 1, 48, 1415061784, 1415061784, 48, 'log'),
(201, 408, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 109 处理人变更', 109, 74, NULL, 1, 48, 1415061785, 1415061785, 48, 'log'),
(202, 410, 0, '由  未知 变更为 采购经理测试账号', '投诉单 108  责任人变更', 108, 0, NULL, 1, 48, 1415067406, 1415067406, 48, 'log'),
(203, 410, 0, '由  未知 变更为 采购经理测试账号', '投诉单 108  责任人变更', 108, 66, NULL, 1, 48, 1415067406, 1415067406, 48, 'log'),
(204, 412, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 108 处理人变更', 108, 74, NULL, 1, 48, 1415067407, 1415067407, 48, 'log'),
(205, 415, 0, '已解决 => 已关闭', '投诉单 113状态更新', 113, 74, NULL, 1, 66, 1415069363, 1415069363, 66, 'log'),
(206, 417, 0, '由  未知 变更为 采购经理测试账号', '投诉单 100  责任人变更', 100, 0, NULL, 1, 48, 1415071290, 1415071290, 48, 'log'),
(207, 417, 0, '由  未知 变更为 采购经理测试账号', '投诉单 100  责任人变更', 100, 66, NULL, 1, 48, 1415071290, 1415071290, 48, 'log'),
(208, 419, 0, '处理人从 未知 变成 供应商投诉处理人', '投诉单 100 处理人变更', 100, 74, NULL, 1, 48, 1415071291, 1415071291, 48, 'log'),
(209, 422, 0, '已解决 => 已关闭', '投诉单 100状态更新', 100, 74, NULL, 1, 66, 1415076277, 1415076277, 66, 'log'),
(210, 423, 0, '投诉单提交', '投诉单 152 提交', 152, 48, NULL, 1, 70, 1415683824, 1416204824, 48, 'log'),
(211, 423, 0, '投诉单提交', '投诉单 152 提交', 152, 72, NULL, 1, 70, 1415683824, 1415683824, 70, 'log'),
(212, 424, 0, '投诉单提交', '投诉单 153 提交', 153, 48, NULL, 1, 70, 1415684910, 1416204824, 48, 'log'),
(213, 424, 0, '投诉单提交', '投诉单 153 提交', 153, 72, NULL, 1, 70, 1415684910, 1415684910, 70, 'log'),
(214, 426, 0, '由  Unknown 变更为 质量经理测试账号', '投诉单 153  责任人变更', 153, 0, NULL, 1, 70, 1415684920, 1415684920, 70, 'log'),
(215, 426, 0, '由  Unknown 变更为 质量经理测试账号', '投诉单 153  责任人变更', 153, 67, NULL, 1, 70, 1415684920, 1415684920, 70, 'log'),
(216, 428, 1, '处理人从 Unknown 变成 客户投诉处理人', '投诉单 153 处理人变更', 153, 73, NULL, 1, 70, 1415684921, 1419917291, 73, 'log'),
(217, 429, 0, '投诉单提交', '投诉单 154 提交', 154, 48, NULL, 1, 70, 1415685004, 1416204824, 48, 'log'),
(218, 429, 0, '投诉单提交', '投诉单 154 提交', 154, 72, NULL, 1, 70, 1415685004, 1415685004, 70, 'log'),
(219, 430, 0, '投诉单提交', '投诉单 155 提交', 155, 48, NULL, 1, 70, 1415685233, 1416204824, 48, 'log'),
(220, 430, 0, '投诉单提交', '投诉单 155 提交', 155, 72, NULL, 1, 70, 1415685233, 1415685233, 70, 'log'),
(221, 431, 0, '投诉单提交', '投诉单 156 提交', 156, 48, NULL, 1, 70, 1415685373, 1416204824, 48, 'log'),
(222, 431, 0, '投诉单提交', '投诉单 156 提交', 156, 72, NULL, 1, 70, 1415685373, 1415685373, 70, 'log'),
(223, 432, 0, '投诉单提交', '投诉单 157 提交', 157, 48, NULL, 1, 70, 1415685397, 1416204824, 48, 'log'),
(224, 432, 0, '投诉单提交', '投诉单 157 提交', 157, 72, NULL, 1, 70, 1415685397, 1415685397, 70, 'log'),
(225, 433, 0, '投诉单提交', '投诉单 158 提交', 158, 48, NULL, 1, 70, 1415685422, 1416204824, 48, 'log'),
(226, 433, 0, '投诉单提交', '投诉单 158 提交', 158, 72, NULL, 1, 70, 1415685422, 1415685422, 70, 'log'),
(227, 434, 0, '投诉单提交', '投诉单 159 提交', 159, 48, NULL, 1, 70, 1415685446, 1416204824, 48, 'log'),
(228, 434, 0, '投诉单提交', '投诉单 159 提交', 159, 72, NULL, 1, 70, 1415685446, 1415685446, 70, 'log'),
(229, 436, 0, '由  Unknown 变更为 质量经理测试账号', '投诉单 159  责任人变更', 159, 0, NULL, 1, 70, 1415685447, 1415685447, 70, 'log'),
(230, 436, 0, '由  Unknown 变更为 质量经理测试账号', '投诉单 159  责任人变更', 159, 67, NULL, 1, 70, 1415685447, 1415685447, 70, 'log'),
(231, 438, 1, '处理人从 Unknown 变成 客户投诉处理人', '投诉单 159 处理人变更', 159, 73, NULL, 1, 70, 1415685448, 1419917291, 73, 'log'),
(232, 442, 0, '由  未知 变更为 质量经理测试账号', '投诉单 156  责任人变更', 156, 0, NULL, 1, 48, 1416288574, 1416288574, 48, 'log'),
(233, 442, 0, '由  未知 变更为 质量经理测试账号', '投诉单 156  责任人变更', 156, 67, NULL, 1, 48, 1416288575, 1416288575, 48, 'log'),
(234, 444, 0, '由  未知 变更为 administrator', '投诉单 103  责任人变更', 103, 0, NULL, 1, 48, 1416442039, 1416442039, 48, 'log'),
(235, 444, 0, '由  未知 变更为 administrator', '投诉单 103  责任人变更', 103, 44, NULL, 1, 48, 1416442039, 1417182601, 44, 'log'),
(236, 446, 0, '由  未知 变更为 administrator', '投诉单 97  责任人变更', 97, 0, NULL, 1, 48, 1416442747, 1416442747, 48, 'log'),
(237, 446, 0, '由  未知 变更为 administrator', '投诉单 97  责任人变更', 97, 44, NULL, 1, 48, 1416442747, 1417182587, 44, 'log'),
(238, 448, 0, '由  未知 变更为 administrator', '投诉单 94  责任人变更', 94, 0, NULL, 1, 48, 1416443069, 1416443069, 48, 'log'),
(239, 448, 0, '由  未知 变更为 administrator', '投诉单 94  责任人变更', 94, 44, NULL, 1, 48, 1416443069, 1417182582, 44, 'log'),
(240, 449, 0, '由  未知 变更为 administrator', '投诉单 150  责任人变更', 150, 0, NULL, 1, 48, 1416443404, 1416443404, 48, 'log'),
(241, 449, 1, '由  未知 变更为 administrator', '投诉单 150  责任人变更', 150, 44, NULL, 1, 48, 1416443404, 1417184786, 44, 'log'),
(242, 450, 0, '由  采购经理测试账号 变更为 administrator', '投诉单 116  责任人变更', 116, 66, NULL, 1, 48, 1416457525, 1416457525, 48, 'log'),
(243, 450, 1, '由  采购经理测试账号 变更为 administrator', '投诉单 116  责任人变更', 116, 44, NULL, 1, 48, 1416457525, 1417182912, 44, 'log'),
(244, 451, 0, '由  采购经理测试账号 变更为 administrator', '投诉单 111  责任人变更', 111, 66, NULL, 1, 48, 1416457631, 1416457631, 48, 'log'),
(245, 451, 1, '由  采购经理测试账号 变更为 administrator', '投诉单 111  责任人变更', 111, 44, NULL, 1, 48, 1416457631, 1417182851, 44, 'log'),
(246, 454, 0, '投诉单提交', '投诉单 160 提交', 160, 48, NULL, 1, 69, 1416874564, 1416874564, 69, 'log'),
(247, 454, 0, '投诉单提交', '投诉单 160 提交', 160, 72, NULL, 1, 69, 1416874564, 1416874564, 69, 'log'),
(248, 456, 0, '由  未知 变更为 超级管理员', '投诉单 160  责任人变更', 160, 0, NULL, 1, 69, 1416874565, 1416874565, 69, 'log'),
(249, 456, 1, '由  未知 变更为 超级管理员', '投诉单 160  责任人变更', 160, 44, NULL, 1, 69, 1416874565, 1417182846, 44, 'log'),
(250, 457, 0, '投诉单提交', '投诉单 161 提交', 161, 48, NULL, 1, 69, 1416981175, 1416981175, 69, 'log'),
(251, 457, 0, '投诉单提交', '投诉单 161 提交', 161, 72, NULL, 1, 69, 1416981175, 1416981175, 69, 'log'),
(252, 459, 0, '由  未知 变更为 超级管理员', '投诉单 161  责任人变更', 161, 0, NULL, 1, 69, 1416981176, 1416981176, 69, 'log'),
(253, 459, 1, '由  未知 变更为 超级管理员', '投诉单 161  责任人变更', 161, 44, NULL, 1, 69, 1416981176, 1417182842, 44, 'log'),
(254, 460, 0, '投诉单提交', '投诉单 162 提交', 162, 48, NULL, 1, 45, 1417066013, 1417066423, 48, 'log'),
(255, 460, 0, '投诉单提交', '投诉单 162 提交', 162, 72, NULL, 1, 45, 1417066013, 1417066013, 45, 'log'),
(256, 462, 0, '由  未知 变更为 质量经理测试账号', '投诉单 162  责任人变更', 162, 0, NULL, 1, 48, 1417066788, 1417066788, 48, 'log'),
(257, 462, 0, '由  未知 变更为 质量经理测试账号', '投诉单 162  责任人变更', 162, 67, NULL, 1, 48, 1417066788, 1417067085, 67, 'log'),
(258, 464, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 162 处理人变更', 162, 73, NULL, 1, 67, 1417069463, 1419917291, 73, 'log'),
(259, 467, 1, '已解决 => 已关闭', '投诉单 162状态更新', 162, 73, NULL, 1, 45, 1417072288, 1419917291, 73, 'log'),
(260, 468, 0, '投诉单提交', '投诉单 163 提交', 163, 48, NULL, 1, 45, 1417172128, 1417172198, 48, 'log'),
(261, 468, 0, '投诉单提交', '投诉单 163 提交', 163, 72, NULL, 1, 45, 1417172128, 1417172128, 45, 'log'),
(262, 470, 0, '由  未知 变更为 质量经理测试账号', '投诉单 163  责任人变更', 163, 0, NULL, 1, 48, 1417172234, 1417172234, 48, 'log'),
(263, 470, 0, '由  未知 变更为 质量经理测试账号', '投诉单 163  责任人变更', 163, 67, NULL, 1, 48, 1417172234, 1417172284, 67, 'log'),
(264, 472, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 163 处理人变更', 163, 73, NULL, 1, 67, 1417172309, 1419917291, 73, 'log'),
(265, 475, 1, '已解决 => 已关闭', '投诉单 163状态更新', 163, 73, NULL, 1, 45, 1417172882, 1419917291, 73, 'log'),
(266, 476, 1, '投诉单提交', '投诉单 164 提交', 164, 48, NULL, 1, 46, 1417266870, 1417266900, 48, 'log'),
(267, 476, 0, '投诉单提交', '投诉单 164 提交', 164, 72, NULL, 1, 46, 1417266870, 1417266870, 46, 'log'),
(268, 478, 0, '由  未知 变更为 超级管理员', '投诉单 164  责任人变更', 164, 0, NULL, 1, 48, 1417266919, 1417266919, 48, 'log'),
(269, 478, 1, '由  未知 变更为 超级管理员', '投诉单 164  责任人变更', 164, 44, NULL, 1, 48, 1417266919, 1419746835, 44, 'log'),
(270, 479, 1, '由  超级管理员 变更为 采购经理测试账号', '投诉单 164  责任人变更', 164, 44, NULL, 1, 48, 1417267083, 1417306152, 44, 'log'),
(271, 479, 1, '由  超级管理员 变更为 采购经理测试账号', '投诉单 164  责任人变更', 164, 66, NULL, 1, 48, 1417267083, 1417267138, 66, 'log'),
(272, 481, 1, '处理人从 未知 变成 供应商投诉处理人', '投诉单 164 处理人变更', 164, 74, NULL, 1, 66, 1417267144, 1417267160, 74, 'log'),
(273, 484, 0, '已解决 => 已关闭', '投诉单 164状态更新', 164, 74, NULL, 1, 46, 1417268488, 1417268488, 46, 'log'),
(274, 485, 0, '投诉单提交', '投诉单 165 提交', 165, 48, NULL, 1, 47, 1417268568, 1417268568, 47, 'log'),
(275, 485, 0, '投诉单提交', '投诉单 165 提交', 165, 72, NULL, 1, 47, 1417268568, 1417268568, 47, 'log'),
(276, 487, 0, '由  未知 变更为 人事经理测试账号', '投诉单 165  责任人变更', 165, 0, NULL, 1, 48, 1417268723, 1417268723, 48, 'log'),
(277, 487, 1, '由  未知 变更为 人事经理测试账号', '投诉单 165  责任人变更', 165, 68, NULL, 1, 48, 1417268723, 1417268736, 68, 'log'),
(278, 489, 1, '处理人从 未知 变成 内部投诉处理人', '投诉单 165 处理人变更', 165, 75, NULL, 1, 68, 1417269548, 1417269570, 75, 'log'),
(279, 492, 0, '已解决 => 已关闭', '投诉单 165状态更新', 165, 75, NULL, 1, 47, 1417269703, 1417269703, 47, 'log'),
(280, 493, 0, '投诉单提交', '投诉单 166 提交', 166, 48, NULL, 1, 45, 1417270174, 1417270174, 45, 'log'),
(281, 493, 0, '投诉单提交', '投诉单 166 提交', 166, 72, NULL, 1, 45, 1417270174, 1417270174, 45, 'log'),
(282, 495, 0, '投诉单提交', '投诉单 167 提交', 167, 48, NULL, 1, 45, 1417270914, 1417270914, 45, 'log'),
(283, 495, 0, '投诉单提交', '投诉单 167 提交', 167, 72, NULL, 1, 45, 1417270914, 1417270914, 45, 'log'),
(284, 497, 1, '投诉单提交', '投诉单 168 提交', 168, 48, NULL, 1, 45, 1419558622, 1419558682, 48, 'log'),
(285, 497, 0, '投诉单提交', '投诉单 168 提交', 168, 72, NULL, 1, 45, 1419558622, 1419558622, 45, 'log'),
(286, 499, 0, '由  未知 变更为 质量经理测试账号', '投诉单 168  责任人变更', 168, 0, NULL, 1, 48, 1419559240, 1419559240, 48, 'log'),
(287, 499, 1, '由  未知 变更为 质量经理测试账号', '投诉单 168  责任人变更', 168, 67, NULL, 1, 48, 1419559240, 1419559255, 67, 'log'),
(288, 501, 1, '处理人从 未知 变成 客户投诉处理人', '投诉单 168 处理人变更', 168, 73, NULL, 1, 67, 1419559352, 1419917291, 73, 'log'),
(289, 504, 1, '已解决 => 已关闭', '投诉单 168状态更新', 168, 73, NULL, 1, 45, 1419560069, 1419917291, 73, 'log'),
(290, 510, 1, '已分配 => 已解决', '投诉单 134状态更新', 134, 70, NULL, 1, 73, 1419737083, 1419737095, 70, 'log'),
(291, 511, 0, '已确认 => 已分配', '投诉单 156状态更新', 156, 44, NULL, 1, 67, 1419836573, 1419836573, 67, 'log'),
(292, 512, 0, '处理人从 未知 变成 超级管理员', '投诉单 156 处理人变更', 156, 44, NULL, 1, 67, 1419836573, 1419836573, 67, 'log'),
(293, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1419837230, 1419837230, 73, 'meeting'),
(294, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1419837230, 1419917291, 73, 'meeting'),
(295, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>会议通知:啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知:啊收到了房价', NULL, 44, NULL, 1, 73, 1419837380, 1419837380, 73, 'meeting'),
(296, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>会议通知:会议通知:啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知:会议通知:啊收到了房价', NULL, 73, NULL, 1, 73, 1419837380, 1419917291, 73, 'meeting'),
(297, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知:啊收到了房价', NULL, 44, NULL, 1, 73, 1419837492, 1419837492, 73, 'meeting'),
(298, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知:啊收到了房价', NULL, 73, NULL, 1, 73, 1419837492, 1419917291, 73, 'meeting'),
(299, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419837559, 1419837559, 73, 'meeting'),
(300, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419837559, 1419917291, 73, 'meeting'),
(301, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419837724, 1419837724, 73, 'meeting');
INSERT INTO `ct_notices` (`id`, `log_id`, `read_flag`, `content`, `title`, `order_id`, `received_by`, `direct_url`, `with_manager`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `notice_type`) VALUES
(302, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>等待开始</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419837724, 1419917291, 73, 'meeting'),
(303, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915471, 1419915471, 73, 'meeting'),
(304, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915471, 1419917291, 73, 'meeting'),
(305, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915508, 1419915508, 73, 'meeting'),
(306, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915510, 1419917291, 73, 'meeting'),
(307, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915563, 1419915563, 73, 'meeting'),
(308, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915564, 1419917291, 73, 'meeting'),
(309, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915702, 1419915702, 73, 'meeting'),
(310, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915702, 1419917291, 73, 'meeting'),
(311, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915714, 1419915714, 73, 'meeting'),
(312, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915714, 1419917291, 73, 'meeting'),
(313, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915750, 1419915750, 73, 'meeting'),
(314, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915750, 1419917291, 73, 'meeting'),
(315, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915813, 1419915813, 73, 'meeting'),
(316, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915813, 1419917291, 73, 'meeting'),
(317, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915880, 1419915880, 73, 'meeting'),
(318, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915880, 1419917291, 73, 'meeting'),
(319, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915942, 1419915942, 73, 'meeting'),
(320, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915942, 1419917291, 73, 'meeting'),
(321, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419915963, 1419915963, 73, 'meeting'),
(322, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419915963, 1419917291, 73, 'meeting'),
(323, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916014, 1419916014, 73, 'meeting'),
(324, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916014, 1419917291, 73, 'meeting'),
(325, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916059, 1419916059, 73, 'meeting'),
(326, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916059, 1419917291, 73, 'meeting'),
(327, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916184, 1419916184, 73, 'meeting'),
(328, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916184, 1419917291, 73, 'meeting'),
(329, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916241, 1419916241, 73, 'meeting'),
(330, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916241, 1419917291, 73, 'meeting'),
(331, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916291, 1419916291, 73, 'meeting'),
(332, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916291, 1419917291, 73, 'meeting'),
(333, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916432, 1419916432, 73, 'meeting'),
(334, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916432, 1419917291, 73, 'meeting'),
(335, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916451, 1419916451, 73, 'meeting'),
(336, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916451, 1419917291, 73, 'meeting'),
(337, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916463, 1419916463, 73, 'meeting'),
(338, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916463, 1419917291, 73, 'meeting'),
(339, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916476, 1419916476, 73, 'meeting'),
(340, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916476, 1419917291, 73, 'meeting');
INSERT INTO `ct_notices` (`id`, `log_id`, `read_flag`, `content`, `title`, `order_id`, `received_by`, `direct_url`, `with_manager`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `notice_type`) VALUES
(341, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916501, 1419916501, 73, 'meeting'),
(342, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916502, 1419917291, 73, 'meeting'),
(343, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916516, 1419916516, 73, 'meeting'),
(344, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916516, 1419917291, 73, 'meeting'),
(345, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916550, 1419916550, 73, 'meeting'),
(346, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916550, 1419917291, 73, 'meeting'),
(347, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916623, 1419916623, 73, 'meeting'),
(348, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916623, 1419917291, 73, 'meeting'),
(349, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916647, 1419916647, 73, 'meeting'),
(350, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916647, 1419917291, 73, 'meeting'),
(351, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916783, 1419916783, 73, 'meeting'),
(352, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916783, 1419917291, 73, 'meeting'),
(353, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916807, 1419916807, 73, 'meeting'),
(354, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916807, 1419917291, 73, 'meeting'),
(355, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916896, 1419916896, 73, 'meeting'),
(356, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916896, 1419917291, 73, 'meeting'),
(357, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916923, 1419916923, 73, 'meeting'),
(358, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916923, 1419917291, 73, 'meeting'),
(359, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419916982, 1419916982, 73, 'meeting'),
(360, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已解决</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419916982, 1419917291, 73, 'meeting'),
(361, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419917276, 1419917276, 73, 'meeting'),
(362, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419917277, 1419917291, 73, 'meeting'),
(363, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419917991, 1419921721, 44, 'meeting'),
(364, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419917991, 1419917991, 73, 'meeting'),
(365, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419918102, 1419920219, 44, 'meeting'),
(366, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419918102, 1419918102, 73, 'meeting'),
(367, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419918251, 1419920207, 44, 'meeting'),
(368, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419918251, 1419921840, 73, 'meeting'),
(369, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 44, NULL, 1, 73, 1419921853, 1419921853, 73, 'meeting'),
(370, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '会议通知：啊收到了房价', NULL, 73, NULL, 1, 73, 1419921853, 1419921879, 73, 'meeting'),
(371, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1419922269, 1419922269, 73, 'meeting'),
(372, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1419922269, 1419922269, 73, 'meeting'),
(373, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1419922430, 1419922909, 44, 'meeting'),
(374, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1419922430, 1419922430, 73, 'meeting'),
(375, 514, 1, '已分配 => 已解决', '投诉单 133状态更新', 133, 70, NULL, 1, 73, 1419925147, 1419925447, 70, 'log'),
(376, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420011612, 1420011612, 73, 'meeting'),
(377, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420011645, 1420011645, 73, 'meeting'),
(378, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420011796, 1420011796, 73, 'meeting'),
(379, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1420011796, 1420011796, 73, 'meeting'),
(380, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420011846, 1420011846, 73, 'meeting');
INSERT INTO `ct_notices` (`id`, `log_id`, `read_flag`, `content`, `title`, `order_id`, `received_by`, `direct_url`, `with_manager`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `notice_type`) VALUES
(381, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1420011847, 1420011847, 73, 'meeting'),
(382, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420012066, 1421832950, 44, 'meeting'),
(383, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420012075, 1420012075, 73, 'meeting'),
(384, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420012099, 1420012099, 73, 'meeting'),
(385, NULL, 0, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1420012100, 1420012100, 73, 'meeting'),
(386, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 44, NULL, 1, 73, 1420012179, 1420506715, 44, 'meeting'),
(387, NULL, 1, '<div class="container-fluid userd">\r\n    <dl class="row dl-horizontal"><dt>状态 :</dt><dd>已结束</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议主题 : </dt><dd>啊收到了房价</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>开始时间 : </dt><dd>2014-12-29 16:12:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>结束时间 : </dt><dd>2014-12-30 02:00:00</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议地点 : </dt><dd>三楼会议室</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>主持人 : </dt><dd>客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>记录人 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>参与者 : </dt><dd>超级管理员,客户投诉处理人</dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议决议 : </dt><dd></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>处理投诉单 :</dt><dd><a href="#" title="质量问题" class="" onclick="goto(''http://localhost/cts/index.php/order/show?id=168&cm=36'',''6'',false);">168</a></dd></dl>\r\n    <dl class="row dl-horizontal"><dt>会议相关文件：</dt><dd></dd></dl>\r\n\r\n</div>\r\n', '啊收到了房价', NULL, 73, NULL, 1, 73, 1420012180, 1421845364, 73, 'meeting');

-- --------------------------------------------------------

--
-- Table structure for table `ct_notice_rules`
--

CREATE TABLE IF NOT EXISTS `ct_notice_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type_id` int(11) NOT NULL COMMENT '投诉单日志类型',
  `description` varchar(255) NOT NULL,
  `order_type` varchar(255) NOT NULL DEFAULT 'all' COMMENT '父值集',
  `notice_type` varchar(45) NOT NULL DEFAULT 'log' COMMENT '通知类型',
  `notice_created_by` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `notice_manager` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '通知到处理人',
  `notice_leader` tinyint(1) NOT NULL DEFAULT '0' COMMENT '通知到责任人',
  `when_new_value` varchar(255) NOT NULL COMMENT '当新值为',
  `when_old_value` varchar(255) NOT NULL COMMENT '当旧值为',
  `default_role_id` int(10) unsigned DEFAULT NULL COMMENT '默认角色ID',
  `inactive_flag` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '失效标识',
  `function_id` int(11) DEFAULT NULL COMMENT '功能ID',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`log_type_id`,`inactive_flag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='通知规则信息' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ct_notice_rules`
--

INSERT INTO `ct_notice_rules` (`id`, `log_type_id`, `description`, `order_type`, `notice_type`, `notice_created_by`, `notice_manager`, `notice_leader`, `when_new_value`, `when_old_value`, `default_role_id`, `inactive_flag`, `function_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(8, 9, '投诉单提交', 'all', 'log', 0, 0, 0, 'released', 'all', 2, 0, NULL, 44, 1413559614, 1413953922, 44),
(9, 4, '责任人更新', 'all', 'log', 0, 1, 0, 'all', 'all', 0, 0, NULL, 44, 1413562630, 1413875787, 44),
(10, 8, '分配', 'all', 'log', 0, 1, 0, 'allocated', 'confirmed', 0, 0, 0, 44, 1413562672, 1419737049, 44),
(11, 8, '已解决', 'all', 'log', 1, 0, 0, 'done', 'allocated', 0, 0, 0, 44, 1413562687, 1419737052, 44),
(12, 8, '已关闭', 'all', 'log', 0, 1, 0, 'closed', 'all', 0, 0, 0, 44, 1413562732, 1419737054, 44),
(13, 8, '重新打开', 'all', 'log', 0, 1, 0, 'reopen', 'closed', 2, 0, 0, 44, 1413562799, 1419737056, 44),
(14, 10, '责任人（部门经理）变更', 'all', 'log', 0, 1, 1, 'all', 'all', 0, 0, NULL, 44, 1413946540, 1413946540, 44),
(15, 8, '通知到创建者填写反馈信息', 'all', 'feedback', 0, 0, 0, 'closed', 'done', 0, 0, 24, 44, 1414460762, 1419924769, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_notice_rules_v`
--
CREATE TABLE IF NOT EXISTS `ct_notice_rules_v` (
`id` int(10) unsigned
,`log_type_id` int(11)
,`description` varchar(255)
,`order_type` varchar(255)
,`notice_created_by` tinyint(1) unsigned
,`notice_manager` tinyint(1) unsigned
,`notice_leader` tinyint(1)
,`when_new_value` varchar(255)
,`when_old_value` varchar(255)
,`default_role_id` int(10) unsigned
,`inactive_flag` int(10) unsigned
,`function_id` int(11)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`log_type` varchar(45)
,`log_type_desc` varchar(255)
,`title` varchar(255)
,`content` text
,`need_reason_flag` tinyint(4)
,`field_name` varchar(100)
,`dll_type` varchar(20)
,`field_valuelist_id` int(10) unsigned
,`notice_type` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_orders`
--

CREATE TABLE IF NOT EXISTS `ct_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type` varchar(20) NOT NULL COMMENT '投诉单类型',
  `status` varchar(20) NOT NULL COMMENT '投诉单状态',
  `severity` varchar(20) NOT NULL COMMENT '严重程度',
  `frequency` varchar(20) NOT NULL COMMENT '发生频率',
  `category` varchar(20) DEFAULT NULL COMMENT '分类',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `manager_id` int(11) DEFAULT NULL COMMENT '处理人',
  `leader_id` int(11) NOT NULL COMMENT '责任人(部门领导)',
  `plan_complete_date` int(11) DEFAULT NULL COMMENT '计划完成时间',
  `contact` varchar(255) NOT NULL COMMENT '联系人',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '办公室电话',
  `mobile_telephone` varchar(255) NOT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `full_name` varchar(255) DEFAULT NULL COMMENT '公司名称/员工姓名',
  `warning_times` int(11) NOT NULL DEFAULT '0' COMMENT '报警次数',
  `pcd_change_times` int(11) NOT NULL DEFAULT '0' COMMENT '计划完成日期修改次数',
  `creation_date` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`order_type`,`status`,`manager_id`) USING BTREE,
  KEY `Index_3` (`created_by`,`creation_date`,`status`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单信息表' AUTO_INCREMENT=169 ;

--
-- Dumping data for table `ct_orders`
--

INSERT INTO `ct_orders` (`id`, `order_type`, `status`, `severity`, `frequency`, `category`, `title`, `manager_id`, `leader_id`, `plan_complete_date`, `contact`, `phone_number`, `mobile_telephone`, `address`, `full_name`, `warning_times`, `pcd_change_times`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'employee', 'closed', 'low', 'low', '30', 'google', 1, 0, 1412697600, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058395, 44, 1412227657, 44),
(2, 'employee', 'closed', 'low', 'low', '30', 'google', 66, 0, 1407688200, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058525, 44, 1412732259, 44),
(3, 'employee', 'allocated', 'low', 'low', '30', 'google', 44, 0, 0, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058552, 44, 1412232638, 44),
(4, 'employee', 'allocated', 'low', 'low', '30', 'google', 66, 0, 1410278400, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058587, 44, 1412415685, 44),
(5, 'employee', 'reopen', 'low', 'low', '30', 'google', 44, 0, 1412352000, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058603, 44, 1412399692, 44),
(6, 'employee', 'released', 'low', 'low', '30', 'google', 0, 0, NULL, '陈先生', NULL, '13736777206', NULL, NULL, 0, 0, 1412058653, 44, 1412058653, 44),
(7, 'vendor', 'allocated', 'low', 'low', '10', 'asdf', 44, 0, 1399305600, 'asdf', NULL, 'asdf', NULL, NULL, 0, 0, 1412058707, 44, 1412407881, 44),
(8, 'vendor', 'allocated', 'low', 'middle', '20', '啊水电费', 44, 0, 1399305600, '啊水电费', '0571', '13777777777', '烦烦烦', '方法', 0, 0, 1412059034, 44, 1412407920, 44),
(9, 'vendor', 'allocated', 'low', 'middle', '20', '啊水电费', 44, 0, 1410278400, '啊水电费', '0571', '13777777777', '烦烦烦', '方法', 0, 0, 1412059093, 44, 1412407511, 44),
(10, 'vendor', 'allocated', 'low', 'high', '10', '啊水电费', 44, 0, 1399392000, '啊水电费', '0571', '13777777777', '烦烦烦', '方法', 0, 0, 1412059118, 44, 1412408633, 44),
(11, 'vendor', 'released', 'middle', 'high', '10', '啊水电费', 0, 0, NULL, '啊水电费', '0571', '13777777777', '烦烦烦', '方法', 0, 0, 1412059234, 44, 1412059234, 44),
(12, 'vendor', 'released', 'low', 'low', '10', 'asdf', 0, 0, NULL, 'asdf', NULL, '1111', NULL, NULL, 0, 0, 1412122645, 44, 1412122645, 44),
(13, 'vendor', 'released', 'low', 'low', '10', 'asdf', 0, 0, NULL, 'asdf', NULL, '1111', NULL, NULL, 0, 0, 1412122807, 44, 1412122807, 44),
(14, 'employee', 'released', 'low', 'low', '10', 'dsg', 0, 0, NULL, 'asd', NULL, '111', NULL, NULL, 0, 0, 1412124607, 44, 1412124607, 44),
(15, 'vendor', 'released', 'low', 'middle', '10', 'asdf', 0, 0, NULL, 'asdf', NULL, '1111', NULL, NULL, 0, 0, 1412125865, 44, 1412125865, 44),
(16, 'vendor', 'released', 'low', 'low', '10', 'asdf', 0, 0, NULL, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412132305, 44, 1412132305, 44),
(17, 'vendor', 'allocated', 'low', 'low', '10', 'asdf', 44, 0, 1399305600, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412132354, 44, 1412407695, 44),
(18, 'vendor', 'released', 'low', 'low', '10', 'asdf', 0, 0, NULL, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412132369, 44, 1412132369, 44),
(19, 'vendor', 'released', 'low', 'low', '10', '11', 0, 0, NULL, '1', NULL, '111', NULL, NULL, 0, 0, 1412132416, 44, 1412132416, 44),
(20, 'vendor', 'released', 'low', 'low', '10', '11', 0, 0, NULL, '1', NULL, '111', NULL, NULL, 0, 0, 1412133624, 44, 1412133624, 44),
(21, 'vendor', 'released', 'low', 'low', '10', 'asdf', 0, 0, NULL, 'f', NULL, '111', NULL, NULL, 0, 0, 1412133640, 44, 1412133640, 44),
(22, 'vendor', 'released', 'low', 'low', '10', 'adsf', 0, 0, NULL, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412133729, 44, 1412133729, 44),
(23, 'vendor', 'released', 'low', 'low', '10', 'adsf', 0, 0, NULL, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412133795, 44, 1412133795, 44),
(24, 'vendor', 'released', 'low', 'low', '10', 'adsf', 0, 0, NULL, 'asdf', NULL, '111', NULL, NULL, 0, 0, 1412133817, 44, 1412133817, 44),
(28, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413250542, 44, 1413250542, 44),
(29, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413250809, 44, 1413250809, 44),
(30, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413250932, 44, 1413250932, 44),
(31, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'as', '', '1', '', '', 0, 0, 1413250971, 44, 1413250971, 44),
(32, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413252719, 44, 1413252719, 44),
(33, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413252989, 45, 1413252989, 44),
(34, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413349184, 44, 1413349184, 44),
(35, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413349192, 44, 1413349192, 44),
(36, 'vendor', 'released', 'low', 'low', '10', 'asdf', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413349195, 44, 1413349195, 44),
(37, 'vendor', 'released', 'low', 'low', '30', '图纸变更太过频繁', NULL, 0, NULL, '陈某某', '05771111111', '13777777777', '柳翁西路100号', '速创科技工作室', 0, 0, 1413423789, 44, 1413423789, 44),
(38, 'vendor', 'released', 'low', 'low', '10', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413528202, 44, 1413528202, 44),
(39, 'vendor', 'released', 'low', 'low', '10', '1', NULL, 0, NULL, '1', '', '111', '', '', 0, 0, 1413528282, 44, 1413528282, 44),
(40, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413528320, 44, 1413528320, 44),
(42, 'employee', 'released', 'low', 'low', '30', 'a', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413528421, 44, 1413528421, 44),
(43, 'employee', 'released', 'low', 'low', '30', 'a', NULL, 0, NULL, 'asdf', '', '11', '', '', 0, 0, 1413528437, 44, 1413528437, 44),
(44, 'employee', 'released', 'low', 'low', '30', 'a', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413528536, 44, 1413528536, 44),
(45, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '1', '', '1', '', '', 0, 0, 1413528578, 44, 1413528578, 44),
(46, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413528702, 44, 1413528702, 44),
(48, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413529157, 44, 1413529157, 44),
(49, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413530928, 44, 1413530928, 44),
(50, 'employee', 'released', 'low', 'low', '30', '11', NULL, 0, NULL, '11', '', '1', '', '', 0, 0, 1413530947, 44, 1413530947, 44),
(51, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531048, 44, 1413531048, 44),
(52, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531108, 44, 1413531108, 44),
(53, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531170, 44, 1413531170, 44),
(54, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531209, 44, 1413531209, 44),
(55, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531239, 44, 1413531239, 44),
(56, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531294, 44, 1413531294, 44),
(57, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531314, 44, 1413531314, 44),
(58, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531377, 44, 1413531377, 44),
(59, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531396, 44, 1413531396, 44),
(60, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531456, 44, 1413531456, 44),
(61, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531483, 44, 1413531483, 44),
(62, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531497, 44, 1413531497, 44),
(63, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531523, 44, 1413531523, 44),
(64, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531552, 44, 1413531552, 44),
(65, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531583, 44, 1413531583, 44),
(66, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531602, 44, 1413531602, 44),
(67, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531624, 44, 1413531624, 44),
(68, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '11', '', '111', '', '', 0, 0, 1413531651, 44, 1413531651, 44),
(69, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '111', '', '1', '', '', 0, 0, 1413531705, 44, 1413531705, 44),
(70, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '111', '', '11', '', '', 0, 0, 1413531968, 44, 1413531968, 44),
(71, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '111', '', '11', '', '', 0, 0, 1413532045, 44, 1413532045, 44),
(72, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '111', '', '11', '', '', 0, 0, 1413532174, 44, 1413532174, 44),
(73, 'employee', 'released', 'low', 'low', '30', '1', NULL, 0, NULL, '111', '', '11', '', '', 0, 0, 1413532233, 44, 1413532233, 44),
(77, 'employee', 'released', 'low', 'low', '30', '爱上对方', NULL, 0, NULL, '暗室逢灯', '', '11', '', '', 0, 0, 1413545424, 44, 1413545424, 44),
(78, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413545651, 44, 1413545651, 44),
(79, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413545690, 44, 1413545690, 44),
(80, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413545846, 44, 1413545846, 44),
(81, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546023, 44, 1413546023, 44),
(82, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546035, 44, 1413546035, 44),
(83, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546112, 44, 1413546112, 44),
(84, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546149, 44, 1413546149, 44),
(85, 'employee', 'released', 'low', 'low', '30', '爱的色放', NULL, 0, NULL, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546302, 44, 1413546302, 44),
(86, 'employee', 'closed', 'low', 'low', '30', '爱的色放', 44, 0, 1413475200, ' 发撒旦法', '', '111', '', '', 0, 0, 1413546327, 44, 1413554629, 44),
(87, 'employee', 'released', 'low', 'low', '30', 'asfd', NULL, 0, NULL, 'afds', '', '111', '', '', 0, 0, 1413546465, 44, 1413546465, 44),
(88, 'employee', 'released', 'low', 'low', '30', 'asdf', NULL, 0, NULL, 'asdf', '', '1', '', '', 0, 0, 1413547082, 44, 1413547082, 44),
(89, 'employee', 'closed', 'low', 'low', '30', 'asdf', NULL, 0, NULL, 'asdf', '', '1', '', '', 0, 0, 1413547106, 44, 1413555683, 44),
(90, 'employee', 'closed', 'low', 'low', '30', 'asfd', 44, 0, 1413475200, 'adsf', '', '1', '', '', 0, 0, 1413547147, 44, 1413552345, 44),
(92, 'employee', 'released', 'low', 'low', '30', 'asfd', NULL, 0, NULL, 'asfd', '', '111', '', '', 0, 0, 1413559395, 44, 1413559395, 44),
(93, 'vendor', 'released', 'low', 'low', '10', 'a', NULL, 0, NULL, 'a', '', '1', '', '', 0, 0, 1413559460, 44, 1413559460, 44),
(94, 'vendor', 'confirmed', 'low', 'low', '10', 'a', NULL, 44, NULL, 'a', '', '1', '', '', 0, 0, 1413559491, 44, 1416443354, 48),
(97, 'vendor', 'confirmed', 'low', 'low', '10', 'a', NULL, 44, NULL, 'a', '', '1', '', '', 0, 0, 1413559897, 44, 1416442762, 48),
(98, 'vendor', 'allocated', 'low', 'low', '10', 'a', 47, 0, 1413475200, 'a', '', '1', '', '', 0, 0, 1413559928, 44, 1413560089, 44),
(99, 'employee', 'allocated', 'low', 'low', '30', 'a', 44, 0, 1413561600, 'a', '', '1', '', '', 0, 0, 1413560227, 44, 1413563855, 44),
(100, 'vendor', 'closed', 'low', 'low', '10', '测试测试', 74, 66, 1415102400, '测试测试', '', '1', '', '', 0, 1, 1413562846, 44, 1415076277, 66),
(101, 'vendor', 'closed', 'low', 'low', '10', '测试测试', 44, 0, 1413561600, '测试测试', '', '1', '', '', 0, 0, 1413562875, 44, 1413625258, 44),
(102, 'vendor', 'closed', 'low', 'low', '10', '按省份范德萨', 44, 0, 1413561600, '按省份范德萨', '', '11', '', '', 0, 0, 1413563758, 44, 1413617064, 44),
(103, 'vendor', 'confirmed', 'high', 'low', '10', 'a', NULL, 44, NULL, 'as', '', '1', '', '', 0, 0, 1413641795, 44, 1416442039, 48),
(104, 'employee', 'confirmed', 'high', 'low', '30', 'asfd', NULL, 0, NULL, 'asfd', '', '111', '', '', 0, 0, 1413641971, 44, 1416457675, 48),
(105, 'customer', 'closed', 'low', 'low', '10', '演示客户投诉单', 67, 0, 1413648000, '陈某某', '', '13777777777', '', '', 0, 0, 1413690191, 45, 1413693685, 45),
(106, 'vendor', 'closed', 'low', 'middle', '40', '服务人员骂人', 66, 0, 1413648000, '陈阵', '54432323', '1314243345', '32324342', '2343224322', 0, 0, 1413697975, 46, 1413700532, 66),
(107, 'employee', 'confirmed', 'middle', 'middle', '30', '办公室有人吸烟', NULL, 0, NULL, '洪仙横', '', '1387777777', '', '天正', 0, 0, 1413698090, 47, 1413698863, 48),
(108, 'vendor', 'allocated', 'low', 'low', '10', '测', 74, 66, NULL, '飞', '', '1', '', '', 0, 0, 1413699551, 69, 1415067407, 48),
(109, 'vendor', 'allocated', 'low', 'low', '10', '测', 74, 66, NULL, '飞', '', '1', '', '', 0, 0, 1413699577, 69, 1415061785, 48),
(110, 'vendor', 'allocated', 'low', 'low', '10', '测', 74, 66, NULL, '飞', '', '1', '', '', 0, 0, 1413699619, 69, 1414820118, 48),
(111, 'vendor', 'confirmed', 'low', 'low', '10', '测', NULL, 44, NULL, '飞', '', '1', '', '', 0, 0, 1413699643, 69, 1416457631, 48),
(112, 'vendor', 'confirmed', 'low', 'low', '10', '测', NULL, 0, NULL, '飞', '', '1', '', '', 0, 0, 1413699678, 69, 1414743865, 48),
(113, 'vendor', 'closed', 'low', 'low', '10', '测', 74, 66, 1415070000, '飞', '', '1', '', '', 0, 3, 1413699714, 69, 1415069363, 66),
(114, 'vendor', 'allocated', 'low', 'low', '10', '测', 66, 0, 1413734400, '飞', '', '1', '', '', 0, 0, 1413699726, 69, 1413700139, 48),
(115, 'vendor', 'closed', 'low', 'low', '30', '供应商投诉测试shimhen1', 66, 0, 1413993600, '洪仙横', '0577-62888888', '13867777777', '乐清市建设中路12号', '速创科技合伙企业', 0, 0, 1413699736, 69, 1413700629, 66),
(116, 'vendor', 'confirmed', 'high', 'high', '10', '跳闸', NULL, 44, NULL, '张三', '8888888888', '13777777777', '乐清市经济开发期纬8路', '浙江**有限公司', 0, 0, 1413699897, 69, 1416457525, 48),
(117, 'customer', 'confirmed', 'low', 'low', '20', '客户投诉测试1', NULL, 67, NULL, '客户1', '', '13877787678', '', '', 0, 0, 1413700212, 69, 1413946863, 48),
(118, 'employee', 'confirmed', 'low', 'low', '30', '内部员工投诉测试1', NULL, 68, NULL, '内部1', '', '138787878787', '', '', 0, 0, 1413700252, 69, 1413946742, 48),
(119, 'customer', 'confirmed', 'low', 'low', '10', '我是客户李四', NULL, 67, NULL, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 0, 1413702543, 45, 1413947710, 48),
(120, 'vendor', 'closed', 'low', 'low', '10', '2222', 66, 0, 1413993600, '123', '', '123', '', '', 0, 0, 1413704181, 46, 1413953030, 66),
(121, 'customer', 'closed', 'low', 'low', '10', 'DZ47质量问题', 67, 0, 1413820800, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 0, 1413705930, 45, 1413707410, 45),
(122, 'customer', 'allocated', 'low', 'low', '20', 'asdf', 73, 67, NULL, 'aa', '', '111', '', '', 0, 0, 1413952568, 45, 1413952681, 48),
(123, 'customer', 'allocated', 'low', 'low', '10', 'adsf', 73, 67, 1414073400, 'adsf', '', '11', '', '', 0, 2, 1413953589, 45, 1413960670, 73),
(124, 'customer', 'allocated', 'low', 'low', '10', 'ff', 73, 67, NULL, 'ff', '', '111', '', '', 0, 0, 1413953863, 45, 1414821248, 67),
(125, 'customer', 'allocated', 'low', 'low', '10', '11', 73, 67, 1413987000, '11', '', '11', '', '', 0, 3, 1413953983, 45, 1413960870, 73),
(126, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413963519, 70, 1413963521, 70),
(127, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认', 73, 67, 1421917200, '陈杨阳', '', '111', '', '', 0, 3, 1413963526, 70, 1421836318, 73),
(128, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413963584, 70, 1413963586, 70),
(129, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认', 73, 67, 1422003600, '陈杨阳', '', '111', '', '', 0, 2, 1413963626, 70, 1421836675, 73),
(130, 'customer', 'confirmed', 'low', 'low', '10', '测试自动确认', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413963633, 70, 1414819891, 48),
(131, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认', 73, 67, 1414858500, '陈杨阳', '', '111', '', '', 0, 3, 1413963994, 70, 1414820384, 73),
(132, 'customer', 'allocated', 'low', 'low', '10', '测试自动确认并自动选择责任人', 73, 67, 1422003600, '陈杨阳', '', '111', '', '', 0, 3, 1413964193, 70, 1421836088, 73),
(133, 'customer', 'done', 'low', 'low', '10', '测试自动确认并自动选择责任人', 73, 67, 1419948000, '陈杨阳', '', '111', '', '', 0, 1, 1413964856, 70, 1419925147, 73),
(134, 'customer', 'done', 'low', 'low', '10', '测试自动确认并自动选择责任人', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413964919, 70, 1419737083, 73),
(135, 'customer', 'confirmed', 'low', 'low', '10', '测试自动确认并自动选择责任人', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965184, 70, 1413965184, 70),
(136, 'customer', 'confirmed', 'low', 'low', '10', '士大夫阿三东帆', NULL, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965551, 70, 1413965552, 70),
(137, 'customer', 'done', 'low', 'low', '10', '士大夫阿三东帆', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965788, 70, 1419736702, 73),
(138, 'customer', 'done', 'low', 'low', '10', '士大夫阿三东帆', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965796, 70, 1419736409, 73),
(139, 'customer', 'confirmed', 'low', 'low', '10', '士大夫阿三东帆', NULL, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965830, 70, 1413965831, 70),
(140, 'customer', 'confirmed', 'low', 'low', '10', 'asdf', NULL, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965875, 70, 1413965876, 70),
(141, 'customer', 'done', 'low', 'low', '10', 'asdf', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1413965895, 70, 1419736287, 73),
(142, 'customer', 'closed', 'low', 'low', '30', '产品线严重质量问题', 73, 67, NULL, '陈某某', '', '13777777777', '', '', 0, 0, 1414023602, 45, 1414030878, 45),
(143, 'customer', 'done', 'low', 'low', '10', '产品线严重质量问题', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1414023982, 70, 1414024144, 73),
(144, 'vendor', 'closed', 'low', 'low', '30', '图纸变更太频繁', 74, 66, NULL, '高某某', '', '1356789', '', '', 0, 0, 1414024058, 71, 1414460189, 66),
(145, 'customer', 'confirmed', 'low', 'low', '10', 'asdfdffff', NULL, 0, NULL, '陈杨阳', '', '13777777777', '', '', 0, 0, 1414024378, 70, 1414024378, 70),
(146, 'employee', 'confirmed', 'low', 'low', '30', 'adsf', NULL, 0, NULL, '洪仙横', '', '1387777777', '', '天正', 0, 0, 1414049889, 47, 1414735547, 48),
(147, 'customer', 'confirmed', 'low', 'low', '10', 'ASD', NULL, 0, NULL, '11', '', '11', '', '', 0, 0, 1414050787, 45, 1414050810, 48),
(148, 'customer', 'confirmed', 'low', 'low', '10', 'sdf', NULL, 0, NULL, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 0, 1414120204, 45, 1414819838, 48),
(149, 'customer', 'closed', 'low', 'low', '20', 'asdfasd', 73, 67, 1414206000, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 2, 1414131122, 45, 1414821084, 67),
(150, 'vendor', 'confirmed', 'low', 'low', '10', '新流程测试', NULL, 44, NULL, '123', '', '123', '', '', 0, 0, 1414819457, 46, 1416443692, 48),
(151, 'customer', 'confirmed', 'low', 'low', '10', '客户新流程测试', NULL, 0, NULL, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 0, 1414819640, 45, 1414819655, 48),
(152, 'customer', 'confirmed', 'low', 'low', '10', 'asdf11', NULL, 0, NULL, '陈杨阳', '', '13777777777', '', '', 0, 0, 1415683824, 70, 1416458111, 48),
(153, 'customer', 'done', 'low', 'low', '10', '22', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415684910, 70, 1419736076, 73),
(154, 'customer', 'released', 'low', 'low', '10', '22', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685004, 70, 1415685004, 70),
(155, 'customer', 'released', 'low', 'low', '10', '22', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685233, 70, 1415685233, 70),
(156, 'customer', 'allocated', 'low', 'low', '10', '22', 44, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685373, 70, 1419836573, 67),
(157, 'customer', 'confirmed', 'low', 'low', '10', '22', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685397, 70, 1416288414, 48),
(158, 'customer', 'confirmed', 'low', 'low', '10', '22', NULL, 0, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685421, 70, 1416288305, 48),
(159, 'customer', 'done', 'low', 'low', '10', '22', 73, 67, NULL, '陈杨阳', '', '111', '', '', 0, 0, 1415685446, 70, 1419735851, 73),
(160, 'vendor', 'confirmed', 'middle', 'middle', '10', '速创问题根据', NULL, 44, NULL, '仙', '0577-62888888', '13867777777', '乐清市建设中路12号', '速创科技合伙企业', 0, 0, 1416874564, 69, 1416874565, 69),
(161, 'vendor', 'confirmed', 'low', 'low', '10', '12', NULL, 44, NULL, '张三', '8888888888', '13777777777', '乐清市经济开发期纬8路', '浙江**有限公司', 0, 0, 1416981175, 69, 1416981176, 69),
(162, 'customer', 'closed', 'middle', 'middle', '10', '质量问题', 73, 67, 1417165200, '陈某某', '', '13777777777', '', '', 0, 1, 1417066013, 45, 1417072288, 45),
(163, 'customer', 'closed', 'high', 'low', '10', 'xxx质量有问题', 73, 67, 1417251600, '陈某某', '', '13777777777', '', '', 0, 1, 1417172128, 45, 1417172882, 45),
(164, 'vendor', 'closed', 'middle', 'middle', '10', '图纸变更太频繁', 74, 66, 1417338000, '陈阵', '54432323', '1314243345', '32324342', '2343224322', 0, 1, 1417266870, 46, 1417268488, 46),
(165, 'employee', 'closed', 'low', 'high', '10', '食堂菜色太单一', 75, 68, 1417350600, '洪仙横', '', '1387777777', '', '天正', 0, 1, 1417268568, 47, 1417269703, 47),
(166, 'customer', 'closed', 'low', 'low', '10', 'sa', NULL, 0, NULL, 'adsf', '', '11', '', '', 0, 0, 1417270174, 45, 1417270492, 45),
(167, 'customer', 'closed', 'low', 'low', '10', 'dfasfdasdf', NULL, 0, NULL, 'ff', '', '111', '', '', 0, 0, 1417270914, 45, 1417270916, 45),
(168, 'customer', 'closed', 'low', 'low', '20', '质量问题', 73, 67, 1419584400, '李四', '0577-68873723', '139898989', 'ABC路88号', '速创科技', 0, 1, 1419558622, 45, 1419560069, 45);

-- --------------------------------------------------------

--
-- Table structure for table `ct_order_addfiles`
--

CREATE TABLE IF NOT EXISTS `ct_order_addfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '投诉单ID',
  `created_by` int(11) NOT NULL,
  `creation_date` int(11) NOT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `file_id` int(11) NOT NULL COMMENT '文件ID',
  `description` varchar(255) NOT NULL COMMENT '文件描述',
  PRIMARY KEY (`id`),
  KEY `Index_2` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单附件表' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ct_order_addfiles`
--

INSERT INTO `ct_order_addfiles` (`id`, `order_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `file_id`, `description`) VALUES
(1, 145, 70, 1414479331, 1414479331, 70, 5, '附件测试'),
(2, 145, 70, 1414479988, 1414479988, 70, 6, '安防'),
(3, 145, 70, 1414480130, 1414480130, 70, 7, '111'),
(4, 145, 70, 1414480204, 1414480204, 70, 8, 'a'),
(5, 145, 70, 1414480224, 1414480224, 70, 9, 'aa'),
(6, 145, 70, 1414480465, 1414480465, 70, 10, ''),
(7, 145, 70, 1414480577, 1414480577, 70, 11, ''),
(8, 145, 70, 1414480726, 1414480726, 70, 12, ''),
(9, 149, 73, 1414484724, 1414484724, 73, 16, ''),
(10, 148, 45, 1414814425, 1414814425, 45, 17, 'kkk');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_order_addfiles_v`
--
CREATE TABLE IF NOT EXISTS `ct_order_addfiles_v` (
`id` int(11)
,`order_id` int(11)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`file_id` int(11)
,`description` varchar(255)
,`file_name` varchar(255)
,`full_path` varchar(255)
,`client_name` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_order_category_vl`
--
CREATE TABLE IF NOT EXISTS `ct_order_category_vl` (
`segment_desc` text
,`segment_value` varchar(255)
,`id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_order_contents`
--

CREATE TABLE IF NOT EXISTS `ct_order_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '投诉单ID',
  `content` text NOT NULL COMMENT '内容',
  `created_by` int(11) NOT NULL,
  `creation_date` int(11) NOT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单内容及回复表' AUTO_INCREMENT=234 ;

--
-- Dumping data for table `ct_order_contents`
--

INSERT INTO `ct_order_contents` (`id`, `order_id`, `content`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(1, 1, '供应商投诉投诉单测试', 44, 1412058395, 1412058395, -1),
(2, 2, '供应商投诉投诉单测试', 44, 1412058525, 1412058525, 44),
(3, 3, '供应商投诉投诉单测试', 44, 1412058552, 1412058552, 44),
(4, 4, '供应商投诉投诉单测试', 44, 1412058587, 1412058587, 44),
(5, 5, '供应商投诉投诉单测试', 44, 1412058603, 1412058603, 44),
(6, 6, '供应商投诉投诉单测试', 44, 1412058653, 1412058653, 44),
(7, 7, 'asdf', 44, 1412058707, 1412058707, 44),
(8, 8, '阿三地方', 44, 1412059034, 1412059034, 44),
(9, 9, '阿三地方', 44, 1412059093, 1412059093, 44),
(10, 10, '阿三地方', 44, 1412059118, 1412059118, 44),
(11, 11, '阿三地方', 44, 1412059234, 1412059234, 44),
(12, 12, 'asdf', 44, 1412122645, 1412122645, 44),
(13, 13, 'asdf', 44, 1412122807, 1412122807, 44),
(14, 14, 'asdf', 44, 1412124607, 1412124607, 44),
(15, 15, 'asdf', 44, 1412125865, 1412125865, 44),
(16, 16, 'asdf', 44, 1412132305, 1412132305, 44),
(17, 17, 'asdf', 44, 1412132354, 1412132354, 44),
(18, 18, 'asdf', 44, 1412132369, 1412132369, 44),
(19, 19, '11', 44, 1412132416, 1412132416, 44),
(20, 20, '11', 44, 1412133624, 1412133624, 44),
(21, 21, 'asdf', 44, 1412133640, 1412133640, 44),
(22, 22, 'asdf', 44, 1412133729, 1412133729, 44),
(23, 23, 'asdf', 44, 1412133795, 1412133795, 44),
(24, 24, 'asdf', 44, 1412133817, 1412133817, 44),
(25, 25, 'asdfasdf', 44, 1412215786, 1412215786, 44),
(26, 2, '问题已经解决，你可以关闭了', 44, 1412233237, 1412233237, 44),
(27, 5, '我是分配人员，我已经确定了', 44, 1412399531, 1412399531, 44),
(28, 28, '1<br/>a<br/>v', 44, 1413250542, 1413250542, 44),
(29, 29, '1<br/>a<br/>v', 44, 1413250809, 1413250809, 44),
(30, 30, '1<br/>a<br/>v', 44, 1413250932, 1413250932, 44),
(31, 31, 'asdf', 44, 1413250971, 1413250971, 44),
(32, 32, 'asdf', 44, 1413252719, 1413252719, 44),
(33, 33, 'asdf', 44, 1413252989, 1413252989, 44),
(34, 24, 'gg', 44, 1413342588, 1413342588, 44),
(35, 32, 'ff', 44, 1413342830, 1413342830, 44),
(36, 32, 'ff', 44, 1413343419, 1413343419, 44),
(37, 32, 'aa', 44, 1413343499, 1413343499, 44),
(38, 32, 'aa', 44, 1413343608, 1413343608, 44),
(39, 32, 'a', 44, 1413343711, 1413343711, 44),
(40, 32, 'a', 44, 1413343728, 1413343728, 44),
(41, 32, 'aa', 44, 1413343757, 1413343757, 44),
(42, 32, 'b', 44, 1413346710, 1413346710, 44),
(43, 32, 'b', 44, 1413346763, 1413346763, 44),
(44, 32, 'b', 44, 1413346911, 1413346911, 44),
(45, 32, '回复测试', 44, 1413348013, 1413348013, 44),
(46, 32, '回复测试', 44, 1413348366, 1413348366, 44),
(47, 32, 'asdf', 44, 1413348373, 1413348373, 44),
(48, 32, 'a', 44, 1413348396, 1413348396, 44),
(49, 32, 'a', 44, 1413348444, 1413348444, 44),
(50, 32, 'fsaf', 44, 1413348582, 1413348582, 44),
(51, 32, 'asdf', 44, 1413348629, 1413348629, 44),
(52, 32, 'sf', 44, 1413348790, 1413348790, 44),
(53, 32, 'asdfsadf', 44, 1413348836, 1413348836, 44),
(54, 31, 'asdf', 44, 1413348920, 1413348920, 44),
(55, 31, 'fff', 44, 1413348951, 1413348951, 44),
(56, 31, 'sdaf', 44, 1413349024, 1413349024, 44),
(57, 34, 'asdf', 44, 1413349184, 1413349184, 44),
(58, 35, 'asdf', 44, 1413349192, 1413349192, 44),
(59, 36, 'asdf', 44, 1413349195, 1413349195, 44),
(60, 34, 'asf', 44, 1413349244, 1413349244, 44),
(61, 36, 'ff', 44, 1413351038, 1413351038, 44),
(62, 32, 'sdaf', 44, 1413351558, 1413351558, 44),
(63, 36, 'asdf', 44, 1413351591, 1413351591, 44),
(64, 36, 'asdf', 44, 1413351622, 1413351622, 44),
(65, 36, 'sadf', 44, 1413351720, 1413351720, 44),
(66, 37, '没有通知到位导致我这边生产过多的产品，损失惨重！', 44, 1413423789, 1413423789, 44),
(67, 38, '1', 44, 1413528202, 1413528202, 44),
(68, 39, '1', 44, 1413528282, 1413528282, 44),
(69, 40, '1', 44, 1413528320, 1413528320, 44),
(71, 42, 'a', 44, 1413528421, 1413528421, 44),
(72, 43, 'a', 44, 1413528437, 1413528437, 44),
(73, 44, 'a', 44, 1413528536, 1413528536, 44),
(74, 45, '1', 44, 1413528578, 1413528578, 44),
(75, 46, '1', 44, 1413528702, 1413528702, 44),
(77, 48, '1', 44, 1413529157, 1413529157, 44),
(78, 49, '1', 44, 1413530928, 1413530928, 44),
(79, 50, '11', 44, 1413530947, 1413530947, 44),
(80, 51, '1', 44, 1413531048, 1413531048, 44),
(81, 52, '1', 44, 1413531108, 1413531108, 44),
(82, 53, '1', 44, 1413531170, 1413531170, 44),
(83, 54, '1', 44, 1413531209, 1413531209, 44),
(84, 55, '1', 44, 1413531239, 1413531239, 44),
(85, 56, '1', 44, 1413531294, 1413531294, 44),
(86, 57, '1', 44, 1413531314, 1413531314, 44),
(87, 58, '1', 44, 1413531377, 1413531377, 44),
(88, 59, '1', 44, 1413531396, 1413531396, 44),
(89, 60, '1', 44, 1413531456, 1413531456, 44),
(90, 61, '1', 44, 1413531483, 1413531483, 44),
(91, 62, '1', 44, 1413531497, 1413531497, 44),
(92, 63, '1', 44, 1413531523, 1413531523, 44),
(93, 64, '1', 44, 1413531552, 1413531552, 44),
(94, 65, '1', 44, 1413531583, 1413531583, 44),
(95, 66, '1', 44, 1413531602, 1413531602, 44),
(96, 67, '1', 44, 1413531624, 1413531624, 44),
(97, 68, '1', 44, 1413531651, 1413531651, 44),
(98, 69, '1', 44, 1413531705, 1413531705, 44),
(99, 70, '1', 44, 1413531968, 1413531968, 44),
(100, 71, '1', 44, 1413532045, 1413532045, 44),
(101, 72, '1', 44, 1413532174, 1413532174, 44),
(102, 73, '1', 44, 1413532233, 1413532233, 44),
(106, 77, '暗室逢灯', 44, 1413545424, 1413545424, 44),
(107, 78, '爱上对方', 44, 1413545651, 1413545651, 44),
(108, 79, '爱上对方', 44, 1413545690, 1413545690, 44),
(109, 80, '爱上对方', 44, 1413545846, 1413545846, 44),
(110, 81, '爱上对方', 44, 1413546023, 1413546023, 44),
(111, 82, '爱上对方', 44, 1413546035, 1413546035, 44),
(112, 83, '爱上对方', 44, 1413546112, 1413546112, 44),
(113, 84, '爱上对方', 44, 1413546149, 1413546149, 44),
(114, 85, '爱上对方', 44, 1413546302, 1413546302, 44),
(115, 86, '爱上对方', 44, 1413546327, 1413546327, 44),
(116, 87, 'afds', 44, 1413546465, 1413546465, 44),
(117, 88, 'asfd', 44, 1413547082, 1413547082, 44),
(118, 89, 'asfd', 44, 1413547106, 1413547106, 44),
(119, 90, 'asfd', 44, 1413547147, 1413547147, 44),
(120, 90, 'asfd', 44, 1413547572, 1413547572, 44),
(122, 92, 'asfd', 44, 1413559395, 1413559395, 44),
(123, 93, 'a', 44, 1413559460, 1413559460, 44),
(124, 94, 'a', 44, 1413559491, 1413559491, 44),
(127, 97, 'a', 44, 1413559897, 1413559897, 44),
(128, 98, 'a', 44, 1413559928, 1413559928, 44),
(129, 99, 'a', 44, 1413560227, 1413560227, 44),
(130, 100, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 44, 1413562846, 1413562846, 44),
(131, 101, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试', 44, 1413562875, 1413562875, 44),
(132, 102, '按省份范德萨按省份范德萨按省份范德萨', 44, 1413563758, 1413563758, 44),
(133, 102, 'gdf', 44, 1413610753, 1413610753, 44),
(134, 102, '我的恢复可能很长还有分段还有很多有意思的内容阿拉斯加费德勒见撒的房间爱上了快递费', 44, 1413617232, 1413617232, 44),
(135, 102, '我的asdfasdda', 44, 1413617374, 1413617374, 44),
(136, 102, '我的asdfasdda', 44, 1413617463, 1413617463, 44),
(137, 102, '暗室逢灯asfd', 44, 1413617542, 1413617542, 44),
(138, 102, '暗室逢灯asfd', 44, 1413617567, 1413617567, 44),
(139, 102, '暗室逢灯asfd', 44, 1413617592, 1413617592, 44),
(140, 102, '打分数<br/>啊', 44, 1413617645, 1413617645, 44),
(141, 102, '我的回复有可能很长很长<br/>有可能有换行<br/>有可能有<br/>还有很多乱七八糟的东西想。。。asdfasfdasfdafds暗室逢灯', 44, 1413617917, 1413617917, 44),
(142, 102, 'df', 44, 1413618252, 1413618252, 44),
(143, 102, 'asfd\r<br/>aa', 44, 1413618622, 1413618622, 44),
(144, 102, '很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长', -1, 1413635258, 1413635258, -1),
(145, 102, '很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长', -1, 1413635290, 1413635290, -1),
(146, 102, '啊上放大', 44, 1413635466, 1413635466, 44),
(147, 102, '阿范德萨', 44, 1413635529, 1413635529, 44),
(148, 102, '啊啊', 44, 1413635686, 1413635686, 44),
(149, 102, '士大夫', 44, 1413635768, 1413635768, 44),
(150, 103, 'a', 44, 1413641795, 1413641795, 44),
(151, 104, 'asfd', 44, 1413641971, 1413641971, 44),
(152, 105, '演示客户投诉单content', 45, 1413690191, 1413690191, 45),
(153, 105, '补充内容测试', 45, 1413690217, 1413690217, 45),
(154, 105, '是这样，问题已经解决！', 67, 1413693014, 1413693014, 67),
(155, 105, 'hao !我把问题关闭了', 45, 1413693567, 1413693567, 45),
(156, 106, 'wo yu yi ge fu wuren you sdfsd', 46, 1413697975, 1413697975, 46),
(157, 107, '行政部门应该划定一个吸烟区供他们抽烟，这样空气就会好很多！', 47, 1413698090, 1413698090, 47),
(158, 106, '该员工已被本公司开除', 66, 1413699240, 1413699240, 66),
(159, 108, '飞', 69, 1413699551, 1413699551, 69),
(160, 109, '飞', 69, 1413699577, 1413699577, 69),
(161, 110, '飞', 69, 1413699619, 1413699619, 69),
(162, 111, '飞', 69, 1413699643, 1413699643, 69),
(163, 112, '飞', 69, 1413699678, 1413699678, 69),
(164, 113, '飞', 69, 1413699714, 1413699714, 69),
(165, 106, 'ok', 46, 1413699717, 1413699717, 46),
(166, 114, '飞', 69, 1413699726, 1413699726, 69),
(167, 115, 'DZ47-63电压不稳。', 69, 1413699736, 1413699736, 69),
(168, 116, '每天跳一次，要疯掉了', 69, 1413699897, 1413699897, 69),
(169, 115, '补充内容测试', 69, 1413700013, 1413700013, 69),
(170, 117, '客户投诉测试1<br/>AAA<br/>BBBBN<br/>CCCCCCCC', 69, 1413700212, 1413700212, 69),
(171, 118, '内部1111', 69, 1413700252, 1413700252, 69),
(172, 115, '调度员测试内容。', 48, 1413700494, 1413700494, 48),
(173, 119, '李四的问题投诉', 45, 1413702543, 1413702543, 45),
(174, 120, '123', 46, 1413704181, 1413704181, 46),
(175, 121, '不合闸吧', 45, 1413705930, 1413705930, 45),
(176, 121, '暗室逢灯', 45, 1413705938, 1413705938, 45),
(177, 121, '问题解决了', 67, 1413706422, 1413706422, 67),
(178, 122, 'asdf', 45, 1413952568, 1413952568, 45),
(179, 123, 'asdf', 45, 1413953589, 1413953589, 45),
(180, 124, 'ff', 45, 1413953863, 1413953863, 45),
(181, 125, '11', 45, 1413953983, 1413953983, 45),
(182, 126, '测试自动确认并自动选择责任人', 70, 1413963519, 1413963519, 70),
(183, 127, '测试自动确认并自动选择责任人', 70, 1413963526, 1413963526, 70),
(184, 128, '测试自动确认并自动选择责任人', 70, 1413963584, 1413963584, 70),
(185, 129, '测试自动确认并自动选择责任人', 70, 1413963626, 1413963626, 70),
(186, 130, '测试自动确认并自动选择责任人', 70, 1413963633, 1413963633, 70),
(187, 131, '测试自动确认并自动选择责任人', 70, 1413963994, 1413963994, 70),
(188, 132, '测试自动确认并自动选择责任人', 70, 1413964193, 1413964193, 70),
(189, 133, '测试自动确认并自动选择责任人', 70, 1413964856, 1413964856, 70),
(190, 134, '测试自动确认并自动选择责任人', 70, 1413964919, 1413964919, 70),
(191, 135, '测试自动确认并自动选择责任人', 70, 1413965184, 1413965184, 70),
(192, 136, '阿三东帆', 70, 1413965551, 1413965551, 70),
(193, 137, '阿三东帆', 70, 1413965788, 1413965788, 70),
(194, 138, '阿三东帆', 70, 1413965796, 1413965796, 70),
(195, 139, '阿三东帆', 70, 1413965830, 1413965830, 70),
(196, 140, 'asdfasdf', 70, 1413965875, 1413965875, 70),
(197, 141, 'asdfasdf', 70, 1413965895, 1413965895, 70),
(198, 142, '如题', 45, 1414023602, 1414023602, 45),
(199, 143, '产品线严重质量问题', 70, 1414023982, 1414023982, 70),
(200, 144, '图纸变更太频繁', 71, 1414024058, 1414024058, 71),
(201, 145, 'asf', 70, 1414024378, 1414024378, 70),
(202, 146, 'asdf', 47, 1414049889, 1414049889, 47),
(203, 147, 'ASDFSADF ', 45, 1414050787, 1414050787, 45),
(204, 148, 'asdf', 45, 1414120204, 1414120204, 45),
(205, 149, 'sadfsadfsdaf', 45, 1414131122, 1414131122, 45),
(206, 145, 'asdf', 70, 1414481082, 1414481082, 70),
(207, 150, '我是内容', 46, 1414819457, 1414819457, 46),
(208, 151, '我是内容2', 45, 1414819640, 1414819640, 45),
(209, 149, 'sadf', 67, 1414821108, 1414821108, 67),
(210, 108, '啊', 48, 1415067396, 1415067396, 48),
(211, 152, 'asdf11', 70, 1415683824, 1415683824, 70),
(212, 153, '22', 70, 1415684910, 1415684910, 70),
(213, 154, '22', 70, 1415685004, 1415685004, 70),
(214, 155, '22', 70, 1415685233, 1415685233, 70),
(215, 156, '22', 70, 1415685373, 1415685373, 70),
(216, 157, '22', 70, 1415685397, 1415685397, 70),
(217, 158, '22', 70, 1415685421, 1415685421, 70),
(218, 159, '22', 70, 1415685446, 1415685446, 70),
(219, 160, '速创问题根据1速创问题根据2', 69, 1416874564, 1416874564, 69),
(220, 161, '123', 69, 1416981175, 1416981175, 69),
(221, 116, '123', 69, 1416992759, 1416992759, 69),
(222, 161, 'ok', 44, 1416992847, 1416992847, 44),
(223, 161, '123', 44, 1416992856, 1416992856, 44),
(224, 162, '质量问题', 45, 1417066013, 1417066013, 45),
(225, 163, '质量太烂了', 45, 1417172128, 1417172128, 45),
(226, 164, '导致我这边有大量的无用产品积压', 46, 1417266870, 1417266870, 46),
(227, 164, '问题已确认', 48, 1417266911, 1417266911, 48),
(228, 164, '问题已经解决，解决方案：xxx...', 74, 1417267206, 1417267206, 74),
(229, 165, '如题', 47, 1417268568, 1417268568, 47),
(230, 166, 'asdf', 45, 1417270174, 1417270174, 45),
(231, 167, 'afdsasfd', 45, 1417270914, 1417270914, 45),
(232, 168, '测试问题', 45, 1419558622, 1419558622, 45),
(233, 168, '解决方案', 73, 1419559419, 1419559419, 73);

-- --------------------------------------------------------

--
-- Table structure for table `ct_order_logs`
--

CREATE TABLE IF NOT EXISTS `ct_order_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '投诉单ID',
  `log_type` varchar(20) NOT NULL COMMENT '日志类型',
  `new_value` varchar(255) NOT NULL COMMENT '新值',
  `old_value` varchar(255) DEFAULT NULL COMMENT '旧值',
  `reason` text COMMENT '原因',
  `change_hash` int(11) NOT NULL COMMENT '修改序列',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_3` (`change_hash`),
  KEY `Index_2` (`order_id`,`log_type`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单日志记录表' AUTO_INCREMENT=520 ;

--
-- Dumping data for table `ct_order_logs`
--

INSERT INTO `ct_order_logs` (`id`, `order_id`, `log_type`, `new_value`, `old_value`, `reason`, `change_hash`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 1, 'stauts', 'released', NULL, NULL, 0, 1412058395, -1, 1412058395, -1),
(2, 1, 'status', 'released', NULL, NULL, 0, 1412058395, -1, 1412058395, -1),
(3, 2, 'stauts', 'released', NULL, NULL, 0, 1412058525, -1, 1412058525, -1),
(4, 3, 'stauts', 'released', NULL, NULL, 0, 1412058552, -1, 1412058552, -1),
(5, 4, 'stauts', 'released', NULL, NULL, 0, 1412058587, -1, 1412058587, -1),
(6, 5, 'stauts', 'released', NULL, NULL, 0, 1412058603, -1, 1412058603, -1),
(7, 6, 'stauts', 'released', NULL, NULL, 0, 1412058653, -1, 1412058653, -1),
(8, 7, 'stauts', 'released', NULL, NULL, 0, 1412058707, -1, 1412058707, -1),
(9, 8, 'stauts', 'released', NULL, NULL, 0, 1412059034, -1, 1412059034, -1),
(10, 9, 'stauts', 'released', NULL, NULL, 0, 1412059093, -1, 1412059093, -1),
(11, 10, 'stauts', 'released', NULL, NULL, 0, 1412059118, -1, 1412059118, -1),
(12, 11, 'stauts', 'released', NULL, NULL, 0, 1412059234, -1, 1412059234, -1),
(13, 12, 'stauts', 'released', NULL, NULL, 0, 1412122645, -1, 1412122645, -1),
(14, 13, 'stauts', 'released', NULL, NULL, 0, 1412122807, -1, 1412122807, -1),
(15, 14, 'stauts', 'released', NULL, NULL, 0, 1412124607, -1, 1412124607, -1),
(16, 15, 'stauts', 'released', NULL, NULL, 0, 1412125865, -1, 1412125865, -1),
(17, 16, 'status_insert', 'released', NULL, NULL, 0, 1412132305, 44, 1412132305, 44),
(18, 17, 'status_insert', 'released', NULL, NULL, 0, 1412132354, 44, 1412132354, 44),
(19, 18, 'status_insert', 'released', NULL, NULL, 0, 1412132369, 44, 1412132369, 44),
(20, 24, 'status_insert', 'released', NULL, 'cao', 1412133817, 1412133817, 44, 1412135673, 44),
(21, 1, 'status_update', 'confirmed', 'released', '测试', 1412149769, 1412149769, 44, 1412149780, 44),
(22, 2, 'status_update', 'confirmed', 'released', NULL, 1412150096, 1412150096, 44, 1412150096, 44),
(26, 3, 'status_update', 'confirmed', 'released', '第三个测试', 1412150362, 1412150362, 44, 1412150370, 44),
(27, 1, 'status_update', 'allocated', 'confirmed', 'adf', 1412216119, 1412216119, 44, 1412216123, 44),
(28, 1, 'status_update', 'done', 'allocated', NULL, 1412227442, 1412227442, 44, 1412227442, 44),
(29, 1, 'status_update', 'closed', 'done', NULL, 1412227657, 1412227657, 44, 1412227657, 44),
(30, 2, 'status_update', 'allocated', 'confirmed', NULL, 1412227892, 1412227892, 44, 1412227892, 44),
(32, 2, 'status_update', 'allocated', 'allocated', NULL, 1412228419, 1412228419, 44, 1412228419, 44),
(33, 2, 'status_update', 'allocated', 'allocated', NULL, 1412228471, 1412228471, 44, 1412228471, 44),
(34, 2, 'status_update', 'allocated', 'allocated', '陈杨阳出差了', 1412228630, 1412228630, 44, 1412228642, 44),
(35, 2, 'manager_change', '40', '44', '陈杨阳出差了', 1412228630, 1412228630, 44, 1412228642, 44),
(36, 2, 'manager_change', '1', '40', '陈杨阳又回来了', 1412228914, 1412228914, 44, 1412228923, 44),
(37, 2, 'manager_change', '44', '1', NULL, 1412232565, 1412232565, 44, 1412232565, 44),
(38, 3, 'status_update', 'allocated', 'confirmed', NULL, 1412232638, 1412232638, 44, 1412232638, 44),
(39, 3, 'manager_change', '44', '0', NULL, 1412232638, 1412232638, 44, 1412232638, 44),
(40, 2, 'status_update', 'done', 'allocated', NULL, 1412232766, 1412232766, 44, 1412232766, 44),
(41, 2, 'status_update', 'closed', 'done', NULL, 1412320728, 1412320728, 44, 1412320728, 44),
(42, 2, 'status_update', 'reopen', 'closed', NULL, 1412320737, 1412320737, 44, 1412320737, 44),
(43, 5, 'status_update', 'confirmed', 'released', NULL, 1412399511, 1412399511, 44, 1412399511, 44),
(44, 5, 'status_update', 'allocated', 'confirmed', '修改责任人', 1412399578, 1412399578, 44, 1412399602, 44),
(45, 5, 'manager_change', '44', '0', '修改责任人', 1412399578, 1412399578, 44, 1412399602, 44),
(46, 5, 'status_update', 'done', 'allocated', NULL, 1412399669, 1412399669, 44, 1412399669, 44),
(47, 5, 'status_update', 'closed', 'done', NULL, 1412399684, 1412399684, 44, 1412399684, 44),
(48, 5, 'status_update', 'reopen', 'closed', NULL, 1412399692, 1412399692, 44, 1412399692, 44),
(49, 9, 'status_update', 'confirmed', 'released', NULL, 1412407465, 1412407465, 44, 1412407465, 44),
(50, 9, 'status_update', 'allocated', 'confirmed', NULL, 1412407511, 1412407511, 44, 1412407511, 44),
(51, 9, 'manager_change', '44', '0', NULL, 1412407511, 1412407511, 44, 1412407511, 44),
(52, 17, 'status_update', 'confirmed', 'released', NULL, 1412407646, 1412407646, 44, 1412407646, 44),
(53, 17, 'status_update', 'allocated', 'confirmed', NULL, 1412407666, 1412407666, 44, 1412407666, 44),
(54, 17, 'manager_change', '44', '0', NULL, 1412407666, 1412407667, 44, 1412407667, 44),
(55, 7, 'status_update', 'confirmed', 'released', NULL, 1412407737, 1412407737, 44, 1412407737, 44),
(56, 7, 'status_update', 'allocated', 'confirmed', NULL, 1412407744, 1412407744, 44, 1412407744, 44),
(57, 7, 'manager_change', '44', '0', NULL, 1412407744, 1412407744, 44, 1412407744, 44),
(58, 8, 'status_update', 'confirmed', 'released', NULL, 1412407914, 1412407914, 44, 1412407914, 44),
(59, 8, 'status_update', 'allocated', 'confirmed', NULL, 1412407920, 1412407920, 44, 1412407920, 44),
(60, 8, 'manager_change', '44', '0', NULL, 1412407920, 1412407920, 44, 1412407920, 44),
(61, 10, 'status_update', 'confirmed', 'released', NULL, 1412408011, 1412408011, 44, 1412408011, 44),
(62, 10, 'status_update', 'allocated', 'confirmed', NULL, 1412408161, 1412408161, 44, 1412408161, 44),
(63, 10, 'manager_change', '44', '0', NULL, 1412408161, 1412408161, 44, 1412408161, 44),
(64, 2, 'status_update', 'allocated', 'reopen', NULL, 1412408787, 1412408787, 44, 1412408787, 44),
(65, 2, 'pcd_update', '1407686400', '1407686400', NULL, 1412408787, 1412408787, 44, 1412408787, 44),
(66, 2, 'pcd_update', '1407688200', '1407686400', '爱上对方', 1412410328, 1412410328, 44, 1412410331, 44),
(67, 4, 'status_update', 'confirmed', 'released', NULL, 1412412630, 1412412630, 44, 1412412630, 44),
(68, 2, 'manager_change', '66', '44', 'gogo', 1412412997, 1412412997, 44, 1412413010, 44),
(69, 4, 'status_update', 'allocated', 'confirmed', NULL, 1412415137, 1412415137, 44, 1412415137, 44),
(70, 4, 'manager_change', '44', '0', NULL, 1412415137, 1412415138, 44, 1412415138, 44),
(71, 4, 'pcd_update', '1410278400', NULL, NULL, 1412415137, 1412415138, 44, 1412415138, 44),
(73, 4, 'manager_change', '66', '44', 'adf', 1412415685, 1412415685, 44, 1412415689, 44),
(74, 2, 'status_update', 'closed', 'allocated', NULL, 1412732259, 1412732259, 44, 1412732259, 44),
(75, 28, 'status_insert', 'released', NULL, NULL, 1413250542, 1413250542, 44, 1413250542, 44),
(76, 29, 'status_insert', 'released', NULL, NULL, 1413250809, 1413250809, 44, 1413250809, 44),
(77, 30, 'status_insert', 'released', NULL, NULL, 1413250932, 1413250932, 44, 1413250932, 44),
(78, 31, 'status_insert', 'released', NULL, NULL, 1413250971, 1413250971, 44, 1413250971, 44),
(79, 32, 'status_insert', 'released', NULL, NULL, 1413252719, 1413252719, 44, 1413252719, 44),
(80, 33, 'status_insert', 'released', NULL, NULL, 1413252989, 1413252989, 44, 1413252989, 44),
(81, 34, 'status_insert', 'released', NULL, NULL, 1413349184, 1413349184, 44, 1413349184, 44),
(82, 35, 'status_insert', 'released', NULL, NULL, 1413349192, 1413349192, 44, 1413349192, 44),
(83, 36, 'status_insert', 'released', NULL, NULL, 1413349195, 1413349195, 44, 1413349195, 44),
(84, 37, 'status_insert', 'released', NULL, NULL, 1413423789, 1413423789, 44, 1413423789, 44),
(86, 48, 'status_insert', 'released', '', NULL, 1413529157, 1413529157, 44, 1413529157, 44),
(87, 49, 'status_insert', 'released', '', NULL, 1413530928, 1413530928, 44, 1413530928, 44),
(88, 50, 'status_insert', 'released', '', NULL, 1413530947, 1413530947, 44, 1413530947, 44),
(89, 51, 'status_insert', 'released', '', NULL, 1413531048, 1413531048, 44, 1413531048, 44),
(90, 52, 'status_insert', 'released', '', NULL, 1413531108, 1413531108, 44, 1413531108, 44),
(91, 53, 'status_insert', 'released', '', NULL, 1413531170, 1413531170, 44, 1413531170, 44),
(92, 54, 'status_insert', 'released', '', NULL, 1413531209, 1413531209, 44, 1413531209, 44),
(93, 55, 'status_insert', 'released', '', NULL, 1413531239, 1413531239, 44, 1413531239, 44),
(94, 56, 'status_insert', 'released', '', NULL, 1413531294, 1413531294, 44, 1413531294, 44),
(95, 57, 'status_insert', 'released', '', NULL, 1413531314, 1413531314, 44, 1413531314, 44),
(96, 58, 'status_insert', 'released', '', NULL, 1413531377, 1413531377, 44, 1413531377, 44),
(97, 59, 'status_insert', 'released', '', NULL, 1413531396, 1413531396, 44, 1413531396, 44),
(98, 60, 'status_insert', 'released', '', NULL, 1413531456, 1413531456, 44, 1413531456, 44),
(99, 61, 'status_insert', 'released', '', NULL, 1413531483, 1413531483, 44, 1413531483, 44),
(100, 62, 'status_insert', 'released', '', NULL, 1413531497, 1413531497, 44, 1413531497, 44),
(101, 63, 'status_insert', 'released', '', NULL, 1413531523, 1413531523, 44, 1413531523, 44),
(102, 64, 'status_insert', 'released', '', NULL, 1413531552, 1413531552, 44, 1413531552, 44),
(103, 65, 'status_insert', 'released', '', NULL, 1413531583, 1413531583, 44, 1413531583, 44),
(104, 66, 'status_insert', 'released', '', NULL, 1413531602, 1413531602, 44, 1413531602, 44),
(105, 67, 'status_insert', 'released', '', NULL, 1413531624, 1413531624, 44, 1413531624, 44),
(106, 68, 'status_insert', 'released', '', NULL, 1413531651, 1413531651, 44, 1413531651, 44),
(107, 69, 'status_insert', 'released', '', NULL, 1413531705, 1413531705, 44, 1413531705, 44),
(108, 70, 'status_insert', 'released', '', NULL, 1413531968, 1413531968, 44, 1413531968, 44),
(109, 71, 'status_insert', 'released', '', NULL, 1413532045, 1413532045, 44, 1413532045, 44),
(110, 72, 'status_insert', 'released', '', NULL, 1413532174, 1413532174, 44, 1413532174, 44),
(111, 73, 'status_insert', 'released', '', NULL, 1413532233, 1413532233, 44, 1413532233, 44),
(115, 77, 'order_confirm', 'released', '', '爱上对方', 1413545424, 1413545424, 44, 1413545534, 44),
(116, 78, 'order_confirm', 'released', '', NULL, 1413545651, 1413545651, 44, 1413545651, 44),
(117, 79, 'order_confirm', 'released', '', NULL, 1413545690, 1413545690, 44, 1413545690, 44),
(118, 80, 'order_confirm', 'released', '', NULL, 1413545846, 1413545846, 44, 1413545846, 44),
(119, 81, 'order_confirm', 'released', '', NULL, 1413546023, 1413546023, 44, 1413546023, 44),
(120, 82, 'order_confirm', 'released', '', NULL, 1413546035, 1413546035, 44, 1413546035, 44),
(121, 83, 'order_confirm', 'released', '', NULL, 1413546112, 1413546112, 44, 1413546112, 44),
(122, 84, 'order_confirm', 'released', '', NULL, 1413546149, 1413546149, 44, 1413546149, 44),
(123, 85, 'order_confirm', 'released', '', NULL, 1413546302, 1413546302, 44, 1413546302, 44),
(124, 86, 'order_confirm', 'released', '', NULL, 1413546327, 1413546327, 44, 1413546327, 44),
(125, 87, 'order_confirm', 'released', '', NULL, 1413546465, 1413546465, 44, 1413546465, 44),
(126, 88, 'order_confirm', 'released', '', NULL, 1413547082, 1413547082, 44, 1413547082, 44),
(127, 89, 'order_confirm', 'released', '', NULL, 1413547106, 1413547106, 44, 1413547106, 44),
(128, 90, 'order_confirm', 'released', '', 'safd', 1413547147, 1413547147, 44, 1413547170, 44),
(129, 90, 'order_done', 'confirmed', 'released', NULL, 1413548166, 1413548166, 44, 1413548166, 44),
(130, 90, 'order_reopen', 'confirmed', 'released', NULL, 1413548166, 1413548166, 44, 1413548166, 44),
(131, 89, 'order_done', 'confirmed', 'released', NULL, 1413548193, 1413548193, 44, 1413548193, 44),
(132, 89, 'order_reopen', 'confirmed', 'released', NULL, 1413548193, 1413548193, 44, 1413548193, 44),
(133, 90, 'order_done', 'allocated', 'confirmed', 'aa', 1413548938, 1413548938, 44, 1413548982, 44),
(134, 90, 'manager_change', '44', NULL, 'aa', 1413548938, 1413548938, 44, 1413548982, 44),
(135, 90, 'pcd_update', '0', NULL, 'aa', 1413548938, 1413548938, 44, 1413548982, 44),
(136, 90, 'order_reopen', 'allocated', 'confirmed', 'aa', 1413548938, 1413548938, 44, 1413548982, 44),
(137, 90, 'order_done', 'allocated', 'allocated', '无法完成', 1413550556, 1413550556, 44, 1413550570, 44),
(138, 90, 'manager_change', '44', '44', '无法完成', 1413550556, 1413550556, 44, 1413550570, 44),
(139, 90, 'pcd_update', '1413475200', '0', '无法完成', 1413550556, 1413550556, 44, 1413550570, 44),
(140, 90, 'order_reopen', 'allocated', 'allocated', '无法完成', 1413550556, 1413550556, 44, 1413550570, 44),
(141, 90, 'pcd_update', '1413561600', '1413475200', '责任人要求变更', 1413550974, 1413550974, 44, 1413550996, 44),
(142, 90, 'pcd_update', '1413475200', '1413561600', 'f', 1413551190, 1413551190, 44, 1413551197, 44),
(143, 90, 'order_done', 'done', 'allocated', NULL, 1413551407, 1413551407, 44, 1413551407, 44),
(144, 90, 'order_reopen', 'done', 'allocated', NULL, 1413551407, 1413551407, 44, 1413551407, 44),
(145, 90, 'order_done', 'closed', 'done', NULL, 1413551443, 1413551443, 44, 1413551443, 44),
(146, 90, 'order_reopen', 'closed', 'done', NULL, 1413551443, 1413551443, 44, 1413551443, 44),
(147, 90, 'order_done', 'reopen', 'closed', NULL, 1413552179, 1413552179, 44, 1413552179, 44),
(148, 90, 'order_reopen', 'reopen', 'closed', NULL, 1413552179, 1413552179, 44, 1413552179, 44),
(149, 90, 'order_done', 'closed', 'reopen', NULL, 1413552345, 1413552345, 44, 1413552345, 44),
(150, 90, 'order_reopen', 'closed', 'reopen', NULL, 1413552345, 1413552345, 44, 1413552345, 44),
(151, 86, 'manager_change', '44', NULL, 'a', 1413554326, 1413554326, 44, 1413554376, 44),
(152, 86, 'pcd_update', '1413475200', NULL, 'a', 1413554326, 1413554326, 44, 1413554376, 44),
(153, 86, 'order_done', 'done', 'allocated', NULL, 1413554385, 1413554385, 44, 1413554385, 44),
(154, 86, 'order_reopen', 'reopen', 'closed', NULL, 1413554428, 1413554428, 44, 1413554428, 44),
(156, 92, 'order_status_new', 'released', '', NULL, 1413559395, 1413559395, 44, 1413559395, 44),
(157, 93, 'order_status_new', 'released', '', NULL, 1413559460, 1413559460, 44, 1413559460, 44),
(158, 94, 'order_status_new', 'released', '', NULL, 1413559491, 1413559491, 44, 1413559491, 44),
(161, 97, 'order_status_new', 'released', '', NULL, 1413559897, 1413559897, 44, 1413559897, 44),
(162, 98, 'order_status_new', 'released', '', NULL, 1413559928, 1413559928, 44, 1413559928, 44),
(163, 98, 'order_status', 'confirmed', 'released', NULL, 1413559940, 1413559940, 44, 1413559940, 44),
(164, 98, 'manager_change', '44', NULL, NULL, 1413560049, 1413560049, 44, 1413560049, 44),
(165, 98, 'pcd_update', '1413475200', NULL, NULL, 1413560049, 1413560049, 44, 1413560049, 44),
(166, 98, 'order_status', 'allocated', 'confirmed', NULL, 1413560049, 1413560049, 44, 1413560049, 44),
(167, 98, 'manager_change', '47', '44', NULL, 1413560089, 1413560089, 44, 1413560089, 44),
(168, 99, 'order_status_new', 'released', '', NULL, 1413560227, 1413560227, 44, 1413560227, 44),
(169, 100, 'order_status_new', 'released', '', NULL, 1413562846, 1413562846, 44, 1413562846, 44),
(170, 101, 'order_status_new', 'released', '', NULL, 1413562875, 1413562875, 44, 1413562875, 44),
(171, 101, 'order_status', 'confirmed', 'released', NULL, 1413562911, 1413562911, 44, 1413562911, 44),
(172, 101, 'manager_change', '47', NULL, NULL, 1413562963, 1413562963, 44, 1413562963, 44),
(173, 101, 'pcd_update', '1413561600', NULL, NULL, 1413562963, 1413562963, 44, 1413562963, 44),
(174, 101, 'order_status', 'allocated', 'confirmed', NULL, 1413562963, 1413562963, 44, 1413562963, 44),
(175, 101, 'manager_change', '44', '47', '责任人没空', 1413563071, 1413563071, 44, 1413563085, 44),
(176, 101, 'pcd_update', '1413475200', '1413561600', NULL, 1413563132, 1413563132, 44, 1413563132, 44),
(177, 101, 'pcd_update', '1413561600', '1413475200', '又调回来了', 1413563397, 1413563397, 44, 1413563410, 44),
(178, 101, 'order_status', 'done', 'allocated', NULL, 1413563431, 1413563431, 44, 1413563431, 44),
(179, 101, 'order_status', 'closed', 'done', NULL, 1413563623, 1413563623, 44, 1413563623, 44),
(180, 101, 'order_status', 'reopen', 'closed', NULL, 1413563650, 1413563650, 44, 1413563650, 44),
(181, 102, 'order_status_new', 'released', '', NULL, 1413563758, 1413563758, 44, 1413563758, 44),
(182, 102, 'order_status', 'confirmed', 'released', NULL, 1413563771, 1413563771, 44, 1413563771, 44),
(183, 102, 'manager_change', '44', NULL, NULL, 1413563776, 1413563776, 44, 1413563776, 44),
(184, 102, 'pcd_update', '1413561600', NULL, NULL, 1413563776, 1413563776, 44, 1413563776, 44),
(185, 102, 'order_status', 'allocated', 'confirmed', NULL, 1413563776, 1413563776, 44, 1413563776, 44),
(186, 102, 'order_status', 'done', 'allocated', NULL, 1413563825, 1413563825, 44, 1413563825, 44),
(187, 99, 'order_status', 'confirmed', 'released', NULL, 1413563851, 1413563851, 44, 1413563851, 44),
(188, 99, 'manager_change', '44', NULL, NULL, 1413563855, 1413563855, 44, 1413563855, 44),
(189, 99, 'pcd_update', '1413561600', NULL, NULL, 1413563855, 1413563855, 44, 1413563855, 44),
(190, 99, 'order_status', 'allocated', 'confirmed', NULL, 1413563855, 1413563855, 44, 1413563855, 44),
(191, 102, 'order_status', 'closed', 'done', NULL, 1413617064, 1413617064, 44, 1413617064, 44),
(192, 101, 'order_status', 'closed', 'reopen', NULL, 1413625258, 1413625258, 44, 1413625258, 44),
(193, 103, 'order_status_new', 'released', '', NULL, 1413641795, 1413641795, 44, 1413641795, 44),
(194, 104, 'order_status_new', 'released', '', NULL, 1413641971, 1413641971, 44, 1413641971, 44),
(195, 105, 'order_status_new', 'released', '', NULL, 1413690191, 1413690191, 45, 1413690191, 45),
(196, 105, 'order_status', 'confirmed', 'released', NULL, 1413692485, 1413692485, 48, 1413692485, 48),
(197, 105, 'manager_change', '67', NULL, NULL, 1413692963, 1413692963, 48, 1413692963, 48),
(198, 105, 'pcd_update', '1413648000', NULL, NULL, 1413692963, 1413692963, 48, 1413692963, 48),
(199, 105, 'order_status', 'allocated', 'confirmed', NULL, 1413692963, 1413692963, 48, 1413692963, 48),
(200, 105, 'order_status', 'done', 'allocated', NULL, 1413693326, 1413693326, 67, 1413693326, 67),
(201, 105, 'order_status', 'closed', 'done', NULL, 1413693574, 1413693574, 45, 1413693574, 45),
(202, 105, 'order_status', 'reopen', 'closed', NULL, 1413693681, 1413693681, 45, 1413693681, 45),
(203, 105, 'order_status', 'closed', 'reopen', NULL, 1413693686, 1413693686, 45, 1413693686, 45),
(204, 106, 'order_status_new', 'released', '', NULL, 1413697975, 1413697975, 46, 1413697975, 46),
(205, 107, 'order_status_new', 'released', '', NULL, 1413698090, 1413698090, 47, 1413698090, 47),
(206, 107, 'order_status', 'confirmed', 'released', NULL, 1413698863, 1413698863, 48, 1413698863, 48),
(207, 106, 'order_status', 'confirmed', 'released', NULL, 1413699104, 1413699104, 48, 1413699104, 48),
(208, 106, 'order_status', 'allocated', 'confirmed', NULL, 1413699138, 1413699138, 48, 1413699138, 48),
(209, 106, 'pcd_update', '1413648000', NULL, NULL, 1413699138, 1413699138, 48, 1413699138, 48),
(210, 106, 'manager_change', '66', NULL, NULL, 1413699138, 1413699138, 48, 1413699138, 48),
(211, 106, 'order_status', 'done', 'allocated', NULL, 1413699246, 1413699246, 66, 1413699246, 66),
(212, 108, 'order_status_new', 'released', '', NULL, 1413699551, 1413699551, 69, 1413699551, 69),
(213, 109, 'order_status_new', 'released', '', NULL, 1413699577, 1413699577, 69, 1413699577, 69),
(214, 110, 'order_status_new', 'released', '', NULL, 1413699619, 1413699619, 69, 1413699619, 69),
(215, 111, 'order_status_new', 'released', '', NULL, 1413699643, 1413699643, 69, 1413699643, 69),
(216, 112, 'order_status_new', 'released', '', NULL, 1413699678, 1413699678, 69, 1413699678, 69),
(217, 113, 'order_status_new', 'released', '', NULL, 1413699714, 1413699714, 69, 1413699714, 69),
(218, 114, 'order_status_new', 'released', '', NULL, 1413699726, 1413699726, 69, 1413699726, 69),
(219, 115, 'order_status_new', 'released', '', NULL, 1413699736, 1413699736, 69, 1413699736, 69),
(220, 116, 'order_status_new', 'released', '', NULL, 1413699897, 1413699897, 69, 1413699897, 69),
(221, 114, 'order_status', 'confirmed', 'released', NULL, 1413700112, 1413700112, 48, 1413700112, 48),
(222, 114, 'order_status', 'allocated', 'confirmed', NULL, 1413700129, 1413700129, 48, 1413700129, 48),
(223, 114, 'pcd_update', '1413648000', NULL, NULL, 1413700129, 1413700129, 48, 1413700129, 48),
(224, 114, 'manager_change', '66', NULL, NULL, 1413700129, 1413700129, 48, 1413700129, 48),
(225, 114, 'pcd_update', '1413734400', '1413648000', '延期', 1413700139, 1413700139, 48, 1413700150, 48),
(226, 117, 'order_status_new', 'released', '', NULL, 1413700212, 1413700212, 69, 1413700212, 69),
(227, 118, 'order_status_new', 'released', '', NULL, 1413700252, 1413700252, 69, 1413700252, 69),
(228, 115, 'order_status', 'confirmed', 'released', NULL, 1413700505, 1413700505, 48, 1413700505, 48),
(229, 115, 'order_status', 'allocated', 'confirmed', NULL, 1413700526, 1413700526, 48, 1413700526, 48),
(230, 115, 'pcd_update', '1413820800', NULL, NULL, 1413700526, 1413700526, 48, 1413700526, 48),
(231, 115, 'manager_change', '66', NULL, NULL, 1413700526, 1413700526, 48, 1413700526, 48),
(232, 106, 'order_status', 'closed', 'done', NULL, 1413700532, 1413700532, 66, 1413700532, 66),
(233, 115, 'pcd_update', '1413993600', '1413820800', '什么情况？分配两次？', 1413700552, 1413700552, 48, 1413700574, 48),
(234, 115, 'order_status', 'done', 'allocated', NULL, 1413700621, 1413700621, 66, 1413700621, 66),
(235, 115, 'order_status', 'closed', 'done', NULL, 1413700629, 1413700629, 66, 1413700629, 66),
(236, 119, 'order_status_new', 'released', '', NULL, 1413702543, 1413702543, 45, 1413702543, 45),
(237, 120, 'order_status_new', 'released', '', NULL, 1413704181, 1413704181, 46, 1413704181, 46),
(238, 120, 'order_status', 'confirmed', 'released', NULL, 1413704202, 1413704202, 48, 1413704202, 48),
(239, 120, 'order_status', 'allocated', 'confirmed', NULL, 1413704210, 1413704210, 48, 1413704210, 48),
(240, 120, 'pcd_update', '1413993600', NULL, NULL, 1413704210, 1413704210, 48, 1413704210, 48),
(241, 120, 'manager_change', '66', NULL, NULL, 1413704210, 1413704210, 48, 1413704210, 48),
(242, 120, 'pcd_update', '1414080000', '1413993600', '123123', 1413704221, 1413704221, 48, 1413704224, 48),
(243, 120, 'pcd_update', '1413993600', '1414080000', 'dsf', 1413704365, 1413704365, 48, 1413704368, 48),
(244, 121, 'order_status_new', 'released', '', NULL, 1413705930, 1413705930, 45, 1413705930, 45),
(245, 121, 'order_status', 'confirmed', 'released', NULL, 1413706089, 1413706089, 48, 1413706089, 48),
(246, 121, 'order_status', 'allocated', 'confirmed', NULL, 1413706335, 1413706335, 48, 1413706335, 48),
(247, 121, 'pcd_update', '1413734400', NULL, NULL, 1413706335, 1413706335, 48, 1413706335, 48),
(248, 121, 'manager_change', '67', NULL, NULL, 1413706335, 1413706335, 48, 1413706335, 48),
(249, 121, 'pcd_update', '1413820800', '1413734400', '延期', 1413706375, 1413706375, 48, 1413706380, 48),
(250, 121, 'order_status', 'done', 'allocated', NULL, 1413706843, 1413706843, 67, 1413706843, 67),
(251, 121, 'order_status', 'closed', 'done', NULL, 1413707410, 1413707410, 45, 1413707410, 45),
(252, 119, 'order_status', 'confirmed', 'released', NULL, 1413861246, 1413861246, 48, 1413861246, 48),
(253, 118, 'order_status', 'confirmed', 'released', NULL, 1413946737, 1413946737, 48, 1413946737, 48),
(254, 117, 'order_status', 'confirmed', 'released', NULL, 1413946855, 1413946855, 48, 1413946855, 48),
(255, 116, 'order_status', 'confirmed', 'released', NULL, 1413947757, 1413947757, 48, 1413947757, 48),
(256, 116, 'leader_change', '66', '0', NULL, 1413947791, 1413947791, 48, 1413947791, 48),
(257, 113, 'leader_change', '66', '0', NULL, 1413952049, 1413952049, 48, 1413952049, 48),
(258, 113, 'order_status', 'confirmed', 'released', NULL, 1413952049, 1413952050, 48, 1413952050, 48),
(259, 113, 'order_status', 'allocated', 'confirmed', NULL, 1413952050, 1413952050, 48, 1413952050, 48),
(260, 113, 'manager_change', '74', NULL, NULL, 1413952050, 1413952051, 48, 1413952051, 48),
(261, 122, 'order_status_new', 'released', '', NULL, 1413952568, 1413952568, 45, 1413952568, 45),
(262, 122, 'leader_change', '67', '0', NULL, 1413952680, 1413952680, 48, 1413952680, 48),
(263, 122, 'order_status', 'confirmed', 'released', NULL, 1413952680, 1413952680, 48, 1413952680, 48),
(264, 122, 'order_status', 'allocated', 'confirmed', NULL, 1413952681, 1413952681, 48, 1413952681, 48),
(265, 122, 'manager_change', '73', NULL, NULL, 1413952681, 1413952681, 48, 1413952681, 48),
(266, 120, 'order_status', 'closed', 'allocated', NULL, 1413953030, 1413953030, 66, 1413953030, 66),
(267, 123, 'order_status_new', 'released', '', NULL, 1413953589, 1413953589, 45, 1413953589, 45),
(268, 123, 'order_status', 'confirmed', 'released', NULL, 1413953609, 1413953609, 48, 1413953609, 48),
(269, 123, 'leader_change', '67', '0', NULL, 1413953610, 1413953610, 48, 1413953610, 48),
(270, 123, 'order_status', 'allocated', 'confirmed', NULL, 1413953610, 1413953611, 48, 1413953611, 48),
(271, 123, 'manager_change', '73', NULL, NULL, 1413953610, 1413953611, 48, 1413953611, 48),
(272, 124, 'order_status_new', 'released', '', NULL, 1413953863, 1413953863, 45, 1413953863, 45),
(273, 125, 'order_status_new', 'released', '', NULL, 1413953983, 1413953983, 45, 1413953983, 45),
(274, 125, 'order_status', 'confirmed', 'released', NULL, 1413954055, 1413954055, 48, 1413954055, 48),
(275, 125, 'leader_change', '67', '0', NULL, 1413954057, 1413954057, 48, 1413954057, 48),
(276, 125, 'order_status', 'allocated', 'confirmed', NULL, 1413954057, 1413954057, 48, 1413954057, 48),
(277, 125, 'manager_change', '73', NULL, NULL, 1413954057, 1413954057, 48, 1413954057, 48),
(278, 123, 'pcd_update', '1413986400', NULL, NULL, 1413960660, 1413960660, 73, 1413960660, 73),
(279, 123, 'pcd_update', '1414073400', '1413986400', '时间有变动', 1413960670, 1413960670, 73, 1413960687, 73),
(280, 113, 'pcd_update', '1413995400', NULL, NULL, 1413960769, 1413960769, 74, 1413960769, 74),
(281, 113, 'pcd_update', '1413997200', '1413995400', 'a ', 1413960774, 1413960774, 74, 1413960793, 74),
(282, 125, 'pcd_update', '1413987000', '1413986400', 'asdf', 1413960870, 1413960870, 73, 1413960954, 73),
(283, 126, 'order_status_new', 'released', '', NULL, 1413963519, 1413963519, 70, 1413963519, 70),
(284, 126, 'order_status', 'confirmed', 'released', NULL, 1413963519, 1413963519, 70, 1413963519, 70),
(285, 126, 'leader_change', '67', '0', NULL, 1413963521, 1413963521, 70, 1413963521, 70),
(286, 126, 'order_status', 'allocated', 'confirmed', NULL, 1413963521, 1413963521, 70, 1413963521, 70),
(287, 126, 'manager_change', '73', NULL, NULL, 1413963521, 1413963521, 70, 1413963521, 70),
(288, 127, 'order_status_new', 'released', '', NULL, 1413963526, 1413963526, 70, 1413963526, 70),
(289, 127, 'order_status', 'confirmed', 'released', NULL, 1413963527, 1413963527, 70, 1413963527, 70),
(290, 127, 'leader_change', '67', '0', NULL, 1413963529, 1413963529, 70, 1413963529, 70),
(291, 127, 'order_status', 'allocated', 'confirmed', NULL, 1413963529, 1413963529, 70, 1413963529, 70),
(292, 127, 'manager_change', '73', NULL, NULL, 1413963529, 1413963529, 70, 1413963529, 70),
(293, 128, 'order_status_new', 'released', '', NULL, 1413963584, 1413963584, 70, 1413963584, 70),
(294, 128, 'order_status', 'confirmed', 'released', NULL, 1413963584, 1413963584, 70, 1413963584, 70),
(295, 128, 'leader_change', '67', '0', NULL, 1413963586, 1413963586, 70, 1413963586, 70),
(296, 128, 'order_status', 'allocated', 'confirmed', NULL, 1413963586, 1413963586, 70, 1413963586, 70),
(297, 128, 'manager_change', '73', NULL, NULL, 1413963586, 1413963586, 70, 1413963586, 70),
(298, 129, 'order_status_new', 'released', '', NULL, 1413963626, 1413963626, 70, 1413963626, 70),
(299, 129, 'order_status', 'confirmed', 'released', NULL, 1413963626, 1413963626, 70, 1413963626, 70),
(300, 129, 'leader_change', '67', '0', NULL, 1413963628, 1413963628, 70, 1413963628, 70),
(301, 129, 'order_status', 'allocated', 'confirmed', NULL, 1413963628, 1413963628, 70, 1413963628, 70),
(302, 129, 'manager_change', '73', NULL, NULL, 1413963628, 1413963628, 70, 1413963628, 70),
(303, 130, 'order_status_new', 'released', '', NULL, 1413963633, 1413963633, 70, 1413963633, 70),
(304, 131, 'order_status_new', 'released', '', NULL, 1413963994, 1413963994, 70, 1413963994, 70),
(305, 131, 'order_status', 'confirmed', 'released', NULL, 1413963994, 1413963994, 70, 1413963994, 70),
(306, 131, 'leader_change', '67', '0', NULL, 1413963995, 1413963995, 70, 1413963995, 70),
(307, 131, 'order_status', 'allocated', 'confirmed', NULL, 1413963996, 1413963996, 70, 1413963996, 70),
(308, 131, 'manager_change', '73', NULL, NULL, 1413963996, 1413963996, 70, 1413963996, 70),
(309, 132, 'order_status_new', 'released', '', NULL, 1413964193, 1413964193, 70, 1413964193, 70),
(310, 132, 'order_status', 'confirmed', 'released', NULL, 1413964193, 1413964193, 70, 1413964193, 70),
(311, 132, 'leader_change', '67', '0', NULL, 1413964194, 1413964194, 70, 1413964194, 70),
(312, 132, 'order_status', 'allocated', 'confirmed', NULL, 1413964195, 1413964195, 70, 1413964195, 70),
(313, 132, 'manager_change', '73', NULL, NULL, 1413964195, 1413964195, 70, 1413964195, 70),
(314, 133, 'order_status_new', 'released', '', NULL, 1413964856, 1413964856, 70, 1413964856, 70),
(315, 133, 'order_status', 'confirmed', 'released', NULL, 1413964857, 1413964857, 70, 1413964857, 70),
(316, 133, 'leader_change', '67', '0', NULL, 1413964857, 1413964857, 70, 1413964857, 70),
(317, 133, 'order_status', 'allocated', 'confirmed', NULL, 1413964858, 1413964858, 70, 1413964858, 70),
(318, 133, 'manager_change', '73', NULL, NULL, 1413964858, 1413964858, 70, 1413964858, 70),
(319, 134, 'order_status_new', 'released', '', NULL, 1413964919, 1413964919, 70, 1413964919, 70),
(320, 134, 'order_status', 'confirmed', 'released', NULL, 1413964919, 1413964919, 70, 1413964919, 70),
(321, 134, 'leader_change', '67', '0', NULL, 1413964920, 1413964920, 70, 1413964920, 70),
(322, 134, 'order_status', 'allocated', 'confirmed', NULL, 1413964921, 1413964921, 70, 1413964921, 70),
(323, 134, 'manager_change', '73', NULL, NULL, 1413964921, 1413964921, 70, 1413964921, 70),
(324, 135, 'order_status_new', 'released', '', NULL, 1413965184, 1413965184, 70, 1413965184, 70),
(325, 135, 'order_status', 'confirmed', 'released', NULL, 1413965184, 1413965184, 70, 1413965184, 70),
(326, 136, 'order_status_new', 'released', '', NULL, 1413965551, 1413965551, 70, 1413965551, 70),
(327, 136, 'order_status', 'confirmed', 'released', NULL, 1413965551, 1413965551, 70, 1413965551, 70),
(328, 136, 'leader_change', '67', '0', NULL, 1413965552, 1413965552, 70, 1413965552, 70),
(329, 137, 'order_status_new', 'released', '', NULL, 1413965788, 1413965788, 70, 1413965788, 70),
(330, 137, 'order_status', 'confirmed', 'released', NULL, 1413965789, 1413965789, 70, 1413965789, 70),
(331, 137, 'leader_change', '67', '0', NULL, 1413965789, 1413965789, 70, 1413965789, 70),
(332, 137, 'order_status', 'allocated', 'confirmed', NULL, 1413965790, 1413965790, 70, 1413965790, 70),
(333, 137, 'manager_change', '73', NULL, NULL, 1413965790, 1413965790, 70, 1413965790, 70),
(334, 138, 'order_status_new', 'released', '', NULL, 1413965796, 1413965796, 70, 1413965796, 70),
(335, 138, 'order_status', 'confirmed', 'released', NULL, 1413965796, 1413965796, 70, 1413965796, 70),
(336, 138, 'leader_change', '67', '0', NULL, 1413965797, 1413965797, 70, 1413965797, 70),
(337, 138, 'order_status', 'allocated', 'confirmed', NULL, 1413965798, 1413965798, 70, 1413965798, 70),
(338, 138, 'manager_change', '73', NULL, NULL, 1413965798, 1413965798, 70, 1413965798, 70),
(339, 139, 'order_status_new', 'released', '', NULL, 1413965830, 1413965830, 70, 1413965830, 70),
(340, 139, 'order_status', 'confirmed', 'released', NULL, 1413965830, 1413965830, 70, 1413965830, 70),
(341, 139, 'leader_change', '67', '0', NULL, 1413965831, 1413965831, 70, 1413965831, 70),
(342, 140, 'order_status_new', 'released', '', NULL, 1413965875, 1413965875, 70, 1413965875, 70),
(343, 140, 'order_status', 'confirmed', 'released', NULL, 1413965875, 1413965875, 70, 1413965875, 70),
(344, 140, 'leader_change', '67', '0', NULL, 1413965876, 1413965876, 70, 1413965876, 70),
(345, 141, 'order_status_new', 'released', '', NULL, 1413965895, 1413965895, 70, 1413965895, 70),
(346, 141, 'order_status', 'confirmed', 'released', NULL, 1413965895, 1413965895, 70, 1413965895, 70),
(347, 141, 'leader_change', '67', '0', NULL, 1413965896, 1413965896, 70, 1413965896, 70),
(348, 141, 'order_status', 'allocated', 'confirmed', NULL, 1413965897, 1413965897, 70, 1413965897, 70),
(349, 141, 'manager_change', '73', NULL, NULL, 1413965897, 1413965897, 70, 1413965897, 70),
(350, 142, 'order_status_new', 'released', '', NULL, 1414023602, 1414023602, 45, 1414023602, 45),
(351, 142, 'order_status', 'confirmed', 'released', NULL, 1414023621, 1414023621, 48, 1414023621, 48),
(352, 142, 'leader_change', '67', '0', NULL, 1414023622, 1414023622, 48, 1414023622, 48),
(353, 142, 'order_status', 'allocated', 'confirmed', NULL, 1414023622, 1414023622, 48, 1414023622, 48),
(354, 142, 'manager_change', '73', NULL, NULL, 1414023622, 1414023622, 48, 1414023622, 48),
(355, 143, 'order_status_new', 'released', '', NULL, 1414023982, 1414023982, 70, 1414023982, 70),
(356, 143, 'order_status', 'confirmed', 'released', NULL, 1414023982, 1414023982, 70, 1414023982, 70),
(357, 143, 'leader_change', '67', '0', NULL, 1414023983, 1414023983, 70, 1414023983, 70),
(358, 143, 'order_status', 'allocated', 'confirmed', NULL, 1414023984, 1414023984, 70, 1414023984, 70),
(359, 143, 'manager_change', '73', NULL, NULL, 1414023984, 1414023984, 70, 1414023984, 70),
(360, 144, 'order_status_new', 'released', '', NULL, 1414024058, 1414024058, 71, 1414024058, 71),
(361, 144, 'order_status', 'confirmed', 'released', NULL, 1414024058, 1414024058, 71, 1414024058, 71),
(362, 144, 'leader_change', '66', '0', NULL, 1414024059, 1414024059, 71, 1414024059, 71),
(363, 143, 'order_status', 'done', 'allocated', NULL, 1414024144, 1414024145, 73, 1414024145, 73),
(364, 145, 'order_status_new', 'released', '', NULL, 1414024378, 1414024378, 70, 1414024378, 70),
(365, 145, 'order_status', 'confirmed', 'released', NULL, 1414024378, 1414024378, 70, 1414024378, 70),
(366, 142, 'order_status', 'closed', 'allocated', NULL, 1414030878, 1414030878, 45, 1414030878, 45),
(367, 146, 'order_status_new', 'released', '', NULL, 1414049889, 1414049889, 47, 1414049889, 47),
(368, 147, 'order_status_new', 'released', '', NULL, 1414050787, 1414050787, 45, 1414050787, 45),
(369, 147, 'order_status', 'confirmed', 'released', NULL, 1414050810, 1414050810, 48, 1414050810, 48),
(370, 148, 'order_status_new', 'released', '', NULL, 1414120204, 1414120204, 45, 1414120204, 45),
(371, 149, 'order_status_new', 'released', '', NULL, 1414131122, 1414131122, 45, 1414131122, 45),
(372, 149, 'order_status', 'confirmed', 'released', NULL, 1414131142, 1414131142, 48, 1414131142, 48),
(373, 149, 'leader_change', '67', '0', NULL, 1414131148, 1414131148, 48, 1414131148, 48),
(374, 149, 'order_status', 'allocated', 'confirmed', NULL, 1414131264, 1414131264, 67, 1414131264, 67),
(375, 149, 'manager_change', '73', NULL, NULL, 1414131264, 1414131264, 67, 1414131264, 67),
(376, 149, 'pcd_update', '1414152000', NULL, NULL, 1414131521, 1414131521, 73, 1414131521, 73),
(377, 149, 'pcd_update', '1414206000', '1414152000', '行程有安排，所以改期。原因可能很详细，很详细，原因可能很详细，很详细原因可能很详细，很详细原因可能很详细，很详细', 1414131540, 1414131540, 73, 1414131667, 73),
(378, 144, 'order_status', 'allocated', 'confirmed', NULL, 1414460151, 1414460151, 66, 1414460151, 66),
(379, 144, 'manager_change', '74', NULL, NULL, 1414460151, 1414460151, 66, 1414460151, 66),
(380, 144, 'order_status', 'done', 'allocated', NULL, 1414460165, 1414460165, 74, 1414460165, 74),
(381, 144, 'order_status', 'closed', 'done', NULL, 1414460189, 1414460189, 66, 1414460189, 66),
(382, 146, 'order_status', 'confirmed', 'released', NULL, 1414735547, 1414735547, 48, 1414735547, 48),
(383, 112, 'order_status', 'confirmed', 'released', NULL, 1414743865, 1414743865, 48, 1414743865, 48),
(384, 150, 'order_status_new', 'released', '', NULL, 1414819457, 1414819457, 46, 1414819457, 46),
(385, 150, 'order_status', 'confirmed', 'released', NULL, 1414819583, 1414819583, 48, 1414819583, 48),
(386, 151, 'order_status_new', 'released', '', NULL, 1414819640, 1414819640, 45, 1414819640, 45),
(387, 151, 'order_status', 'confirmed', 'released', NULL, 1414819655, 1414819655, 48, 1414819655, 48),
(388, 148, 'order_status', 'confirmed', 'released', NULL, 1414819838, 1414819838, 48, 1414819838, 48),
(389, 130, 'order_status', 'confirmed', 'released', NULL, 1414819891, 1414819891, 48, 1414819891, 48),
(390, 124, 'order_status', 'confirmed', 'released', NULL, 1414820033, 1414820033, 48, 1414820033, 48),
(391, 124, 'leader_change', '67', '0', NULL, 1414820034, 1414820034, 48, 1414820034, 48),
(392, 111, 'order_status', 'confirmed', 'released', NULL, 1414820059, 1414820059, 48, 1414820059, 48),
(393, 111, 'leader_change', '66', '0', NULL, 1414820060, 1414820060, 48, 1414820060, 48),
(394, 110, 'order_status', 'confirmed', 'released', NULL, 1414820116, 1414820116, 48, 1414820116, 48),
(395, 110, 'leader_change', '66', '0', NULL, 1414820117, 1414820117, 48, 1414820117, 48),
(396, 110, 'order_status', 'allocated', 'confirmed', NULL, 1414820118, 1414820118, 48, 1414820118, 48),
(397, 110, 'manager_change', '74', NULL, NULL, 1414820118, 1414820118, 48, 1414820118, 48),
(398, 131, 'pcd_update', '1414897200', NULL, NULL, 1414820238, 1414820238, 73, 1414820238, 73),
(399, 131, 'pcd_update', '1414857600', '1414897200', '我操', 1414820247, 1414820247, 73, 1414820267, 73),
(400, 131, 'pcd_update', '1414858500', '1414857600', '爱上对方', 1414820384, 1414820384, 73, 1414820387, 73),
(401, 149, 'order_status', 'done', 'allocated', NULL, 1414820820, 1414820820, 73, 1414820820, 73),
(402, 149, 'order_status', 'closed', 'done', NULL, 1414821084, 1414821084, 67, 1414821084, 67),
(403, 124, 'order_status', 'allocated', 'confirmed', NULL, 1414821241, 1414821241, 67, 1414821241, 67),
(404, 124, 'manager_change', '73', NULL, NULL, 1414821241, 1414821241, 67, 1414821241, 67),
(405, 109, 'order_status', 'confirmed', 'released', NULL, 1415061783, 1415061783, 48, 1415061783, 48),
(406, 109, 'leader_change', '66', '0', NULL, 1415061784, 1415061784, 48, 1415061784, 48),
(407, 109, 'order_status', 'allocated', 'confirmed', NULL, 1415061785, 1415061785, 48, 1415061785, 48),
(408, 109, 'manager_change', '74', NULL, NULL, 1415061785, 1415061785, 48, 1415061785, 48),
(409, 108, 'order_status', 'confirmed', 'released', NULL, 1415067405, 1415067405, 48, 1415067405, 48),
(410, 108, 'leader_change', '66', '0', NULL, 1415067406, 1415067406, 48, 1415067406, 48),
(411, 108, 'order_status', 'allocated', 'confirmed', NULL, 1415067407, 1415067407, 48, 1415067407, 48),
(412, 108, 'manager_change', '74', NULL, NULL, 1415067407, 1415067407, 48, 1415067407, 48),
(413, 113, 'pcd_update', '1415070000', '1413997200', 'haoba', 1415069159, 1415069159, 74, 1415069212, 74),
(414, 113, 'order_status', 'done', 'allocated', NULL, 1415069257, 1415069257, 74, 1415069257, 74),
(415, 113, 'order_status', 'closed', 'done', NULL, 1415069363, 1415069363, 66, 1415069363, 66),
(416, 100, 'order_status', 'confirmed', 'released', NULL, 1415071290, 1415071290, 48, 1415071290, 48),
(417, 100, 'leader_change', '66', '0', NULL, 1415071290, 1415071290, 48, 1415071290, 48),
(418, 100, 'order_status', 'allocated', 'confirmed', NULL, 1415071291, 1415071291, 48, 1415071291, 48),
(419, 100, 'manager_change', '74', NULL, NULL, 1415071291, 1415071291, 48, 1415071291, 48),
(420, 100, 'pcd_update', '1415102400', NULL, NULL, 1415071764, 1415071764, 74, 1415071764, 74),
(421, 100, 'order_status', 'done', 'allocated', NULL, 1415075014, 1415075014, 74, 1415075014, 74),
(422, 100, 'order_status', 'closed', 'done', NULL, 1415076277, 1415076277, 66, 1415076277, 66),
(423, 152, 'order_status_new', 'released', '', NULL, 1415683824, 1415683824, 70, 1415683824, 70),
(424, 153, 'order_status_new', 'released', '', NULL, 1415684910, 1415684910, 70, 1415684910, 70),
(425, 153, 'order_status', 'confirmed', 'released', NULL, 1415684919, 1415684919, 70, 1415684919, 70),
(426, 153, 'leader_change', '67', '0', NULL, 1415684920, 1415684920, 70, 1415684920, 70),
(427, 153, 'order_status', 'allocated', 'confirmed', NULL, 1415684921, 1415684921, 70, 1415684921, 70),
(428, 153, 'manager_change', '73', NULL, NULL, 1415684921, 1415684921, 70, 1415684921, 70),
(429, 154, 'order_status_new', 'released', '', NULL, 1415685004, 1415685004, 70, 1415685004, 70),
(430, 155, 'order_status_new', 'released', '', NULL, 1415685233, 1415685233, 70, 1415685233, 70),
(431, 156, 'order_status_new', 'released', '', NULL, 1415685373, 1415685373, 70, 1415685373, 70),
(432, 157, 'order_status_new', 'released', '', NULL, 1415685397, 1415685397, 70, 1415685397, 70),
(433, 158, 'order_status_new', 'released', '', NULL, 1415685421, 1415685421, 70, 1415685421, 70),
(434, 159, 'order_status_new', 'released', '', NULL, 1415685446, 1415685446, 70, 1415685446, 70),
(435, 159, 'order_status', 'confirmed', 'released', NULL, 1415685446, 1415685446, 70, 1415685446, 70),
(436, 159, 'leader_change', '67', '0', NULL, 1415685447, 1415685447, 70, 1415685447, 70),
(437, 159, 'order_status', 'allocated', 'confirmed', NULL, 1415685448, 1415685448, 70, 1415685448, 70),
(438, 159, 'manager_change', '73', NULL, NULL, 1415685448, 1415685448, 70, 1415685448, 70),
(439, 158, 'order_status', 'confirmed', 'released', NULL, 1416288305, 1416288305, 48, 1416288305, 48),
(440, 157, 'order_status', 'confirmed', 'released', NULL, 1416288414, 1416288414, 48, 1416288414, 48),
(441, 156, 'order_status', 'confirmed', 'released', NULL, 1416288545, 1416288545, 48, 1416288545, 48),
(442, 156, 'leader_change', '67', '0', NULL, 1416288574, 1416288574, 48, 1416288574, 48),
(443, 103, 'order_status', 'confirmed', 'released', NULL, 1416442038, 1416442038, 48, 1416442038, 48),
(444, 103, 'leader_change', '44', '0', NULL, 1416442039, 1416442039, 48, 1416442039, 48),
(445, 97, 'order_status', 'confirmed', 'released', NULL, 1416442747, 1416442747, 48, 1416442747, 48),
(446, 97, 'leader_change', '44', '0', NULL, 1416442747, 1416442747, 48, 1416442747, 48),
(447, 94, 'order_status', 'confirmed', 'released', NULL, 1416443069, 1416443069, 48, 1416443069, 48),
(448, 94, 'leader_change', '44', '0', NULL, 1416443069, 1416443069, 48, 1416443069, 48),
(449, 150, 'leader_change', '44', '0', NULL, 1416443404, 1416443404, 48, 1416443404, 48),
(450, 116, 'leader_change', '44', '66', NULL, 1416457525, 1416457525, 48, 1416457525, 48),
(451, 111, 'leader_change', '44', '66', NULL, 1416457631, 1416457631, 48, 1416457631, 48),
(452, 104, 'order_status', 'confirmed', 'released', NULL, 1416457675, 1416457675, 48, 1416457675, 48),
(453, 152, 'order_status', 'confirmed', 'released', NULL, 1416458111, 1416458111, 48, 1416458111, 48),
(454, 160, 'order_status_new', 'released', '', NULL, 1416874564, 1416874564, 69, 1416874564, 69),
(455, 160, 'order_status', 'confirmed', 'released', NULL, 1416874564, 1416874564, 69, 1416874564, 69),
(456, 160, 'leader_change', '44', '0', NULL, 1416874565, 1416874565, 69, 1416874565, 69),
(457, 161, 'order_status_new', 'released', '', NULL, 1416981175, 1416981175, 69, 1416981175, 69),
(458, 161, 'order_status', 'confirmed', 'released', NULL, 1416981175, 1416981175, 69, 1416981175, 69),
(459, 161, 'leader_change', '44', '0', NULL, 1416981176, 1416981176, 69, 1416981176, 69),
(460, 162, 'order_status_new', 'released', '', NULL, 1417066013, 1417066013, 45, 1417066013, 45),
(461, 162, 'order_status', 'confirmed', 'released', NULL, 1417066658, 1417066658, 48, 1417066658, 48),
(462, 162, 'leader_change', '67', '0', NULL, 1417066788, 1417066788, 48, 1417066788, 48),
(463, 162, 'order_status', 'allocated', 'confirmed', NULL, 1417069463, 1417069463, 67, 1417069463, 67),
(464, 162, 'manager_change', '73', NULL, NULL, 1417069463, 1417069463, 67, 1417069463, 67),
(465, 162, 'pcd_update', '1417165200', NULL, NULL, 1417069838, 1417069838, 73, 1417069838, 73),
(466, 162, 'order_status', 'done', 'allocated', NULL, 1417070136, 1417070136, 73, 1417070136, 73),
(467, 162, 'order_status', 'closed', 'done', NULL, 1417072288, 1417072288, 45, 1417072288, 45),
(468, 163, 'order_status_new', 'released', '', NULL, 1417172128, 1417172128, 45, 1417172128, 45),
(469, 163, 'order_status', 'confirmed', 'released', NULL, 1417172212, 1417172212, 48, 1417172212, 48),
(470, 163, 'leader_change', '67', '0', NULL, 1417172234, 1417172234, 48, 1417172234, 48),
(471, 163, 'order_status', 'allocated', 'confirmed', NULL, 1417172309, 1417172309, 67, 1417172309, 67),
(472, 163, 'manager_change', '73', NULL, NULL, 1417172309, 1417172309, 67, 1417172309, 67),
(473, 163, 'pcd_update', '1417251600', NULL, NULL, 1417172424, 1417172424, 73, 1417172424, 73),
(474, 163, 'order_status', 'done', 'allocated', NULL, 1417172703, 1417172703, 73, 1417172703, 73),
(475, 163, 'order_status', 'closed', 'done', NULL, 1417172882, 1417172882, 45, 1417172882, 45),
(476, 164, 'order_status_new', 'released', '', NULL, 1417266870, 1417266870, 46, 1417266870, 46),
(477, 164, 'order_status', 'confirmed', 'released', NULL, 1417266919, 1417266919, 48, 1417266919, 48),
(478, 164, 'leader_change', '44', '0', NULL, 1417266919, 1417266919, 48, 1417266919, 48),
(479, 164, 'leader_change', '66', '44', '电饭锅', 1417267083, 1417267083, 48, 1417267113, 48),
(480, 164, 'order_status', 'allocated', 'confirmed', NULL, 1417267144, 1417267144, 66, 1417267144, 66),
(481, 164, 'manager_change', '74', NULL, NULL, 1417267144, 1417267144, 66, 1417267144, 66),
(482, 164, 'pcd_update', '1417338000', NULL, NULL, 1417267176, 1417267176, 74, 1417267176, 74),
(483, 164, 'order_status', 'done', 'allocated', NULL, 1417267182, 1417267182, 74, 1417267182, 74),
(484, 164, 'order_status', 'closed', 'done', NULL, 1417268488, 1417268488, 46, 1417268488, 46),
(485, 165, 'order_status_new', 'released', '', NULL, 1417268568, 1417268568, 47, 1417268568, 47),
(486, 165, 'order_status', 'confirmed', 'released', NULL, 1417268719, 1417268719, 48, 1417268719, 48),
(487, 165, 'leader_change', '68', '0', NULL, 1417268723, 1417268723, 48, 1417268723, 48),
(488, 165, 'order_status', 'allocated', 'confirmed', NULL, 1417269548, 1417269548, 68, 1417269548, 68),
(489, 165, 'manager_change', '75', NULL, NULL, 1417269548, 1417269548, 68, 1417269548, 68),
(490, 165, 'pcd_update', '1417350600', NULL, NULL, 1417269586, 1417269586, 75, 1417269586, 75),
(491, 165, 'order_status', 'done', 'allocated', NULL, 1417269590, 1417269590, 75, 1417269590, 75),
(492, 165, 'order_status', 'closed', 'done', NULL, 1417269703, 1417269703, 47, 1417269703, 47),
(493, 166, 'order_status_new', 'released', '', NULL, 1417270174, 1417270174, 45, 1417270174, 45),
(494, 166, 'order_status', 'closed', 'released', NULL, 1417270492, 1417270492, 45, 1417270492, 45),
(495, 167, 'order_status_new', 'released', '', NULL, 1417270914, 1417270914, 45, 1417270914, 45),
(496, 167, 'order_status', 'closed', 'released', NULL, 1417270916, 1417270916, 45, 1417270916, 45),
(497, 168, 'order_status_new', 'released', '', NULL, 1419558622, 1419558622, 45, 1419558622, 45),
(498, 168, 'order_status', 'confirmed', 'released', NULL, 1419558973, 1419558973, 48, 1419558973, 48),
(499, 168, 'leader_change', '67', '0', NULL, 1419559240, 1419559240, 48, 1419559240, 48),
(500, 168, 'order_status', 'allocated', 'confirmed', NULL, 1419559352, 1419559352, 67, 1419559352, 67),
(501, 168, 'manager_change', '73', NULL, NULL, 1419559352, 1419559352, 67, 1419559352, 67),
(502, 168, 'pcd_update', '1419584400', NULL, NULL, 1419559400, 1419559400, 73, 1419559400, 73),
(503, 168, 'order_status', 'done', 'allocated', NULL, 1419559429, 1419559429, 73, 1419559429, 73),
(504, 168, 'order_status', 'closed', 'done', NULL, 1419560069, 1419560069, 45, 1419560069, 45),
(505, 159, 'order_status', 'done', 'allocated', NULL, 1419735851, 1419735851, 73, 1419735851, 73),
(506, 153, 'order_status', 'done', 'allocated', NULL, 1419736076, 1419736076, 73, 1419736076, 73),
(507, 141, 'order_status', 'done', 'allocated', NULL, 1419736287, 1419736287, 73, 1419736287, 73),
(508, 138, 'order_status', 'done', 'allocated', NULL, 1419736409, 1419736409, 73, 1419736409, 73),
(509, 137, 'order_status', 'done', 'allocated', NULL, 1419736702, 1419736702, 73, 1419736702, 73),
(510, 134, 'order_status', 'done', 'allocated', NULL, 1419737083, 1419737083, 73, 1419737083, 73),
(511, 156, 'order_status', 'allocated', 'confirmed', NULL, 1419836573, 1419836573, 67, 1419836573, 67),
(512, 156, 'manager_change', '44', NULL, NULL, 1419836573, 1419836573, 67, 1419836573, 67),
(513, 133, 'pcd_update', '1419948000', NULL, NULL, 1419925144, 1419925144, 73, 1419925144, 73),
(514, 133, 'order_status', 'done', 'allocated', NULL, 1419925147, 1419925147, 73, 1419925147, 73),
(515, 132, 'pcd_update', '1421917200', NULL, NULL, 1421835823, 1421835823, 73, 1421835823, 73),
(516, 132, 'pcd_update', '1422003600', '1421917200', NULL, 1421836088, 1421836088, 73, 1421836088, 73),
(517, 127, 'pcd_update', '1421917200', NULL, NULL, 1421836308, 1421836308, 73, 1421836308, 73),
(518, 129, 'pcd_update', '1421917200', NULL, NULL, 1421836657, 1421836657, 73, 1421836657, 73),
(519, 129, 'pcd_update', '1422003600', '1421917200', '我想想', 1421836675, 1421836675, 73, 1421836692, 73);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_order_logs_v`
--
CREATE TABLE IF NOT EXISTS `ct_order_logs_v` (
`id` int(11)
,`order_id` int(11)
,`log_type` varchar(20)
,`new_value` varchar(255)
,`old_value` varchar(255)
,`reason` text
,`change_hash` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`description` varchar(255)
,`title` varchar(255)
,`content` text
,`need_reason_flag` tinyint(4)
,`field_name` varchar(100)
,`dll_type` varchar(20)
,`field_valuelist_id` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_order_log_types`
--

CREATE TABLE IF NOT EXISTS `ct_order_log_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varchar(45) NOT NULL COMMENT '日志类型',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `title` varchar(255) NOT NULL COMMENT '标题格式',
  `content` text NOT NULL COMMENT '内容格式',
  `need_reason_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要填写原因',
  `field_name` varchar(100) NOT NULL COMMENT '字段',
  `dll_type` varchar(20) NOT NULL COMMENT '操作类型',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `field_valuelist_id` int(10) unsigned DEFAULT NULL COMMENT '字段值集',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单日志类型表' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ct_order_log_types`
--

INSERT INTO `ct_order_log_types` (`id`, `log_type`, `description`, `title`, `content`, `need_reason_flag`, `field_name`, `dll_type`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `field_valuelist_id`) VALUES
(4, 'manager_change', '处理人更新', '投诉单 &order_id 处理人变更', '处理人从 &old_value 变成 &new_value', 1, 'manager_id', 'update', 44, 1412228612, 1413873456, 44, 17),
(5, 'pcd_update', '计划完成时间更新', '投诉单 &order_id 计划完成日期变更', '计划完成时间 从&old_value 改为 &new_value ', 1, 'plan_complete_date', 'update', 44, 1412408774, 1421836752, 44, 0),
(8, 'order_status', '状态更新', '投诉单 &order_id 状态更新', '&old_value => &new_value', 0, 'status', 'update', 44, 1413558149, 1419925997, 44, 0),
(9, 'order_status_new', '投诉单提交', '投诉单 &order_id 提交', '投诉单提交', 0, 'status', 'insert', 44, 1413558239, 1413876189, 44, 0),
(10, 'leader_change', '责任人（部门经理）变更', '投诉单 &order_id  责任人变更', '由  &old_value 变更为 &new_value', 1, 'leader_id', 'update', 44, 1413946243, 1417077464, 44, 17);

-- --------------------------------------------------------

--
-- Table structure for table `ct_order_meetings`
--

CREATE TABLE IF NOT EXISTS `ct_order_meetings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '投诉单ID',
  `meeting_id` int(10) unsigned NOT NULL COMMENT '会议ID',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `last_updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`order_id`,`meeting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='投诉单会议记录表' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ct_order_meetings`
--

INSERT INTO `ct_order_meetings` (`id`, `order_id`, `meeting_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(1, 2, 1, NULL, NULL, NULL, NULL),
(2, 2, 2, 44, 1412305995, 1412305995, 44),
(4, 3, 3, 44, 1412310745, 1412310745, 44),
(5, 102, 4, 44, 1413611547, 1413611547, 44),
(6, 102, 5, 44, 1413615576, 1413615576, 44),
(7, 102, 6, 44, 1413616500, 1413616500, 44),
(8, 100, 6, 44, 1413616500, 1413616500, 44),
(9, 149, 7, 73, 1414132468, 1414132468, 73),
(10, 113, 8, 74, 1415069247, 1415069247, 74),
(11, 144, 9, 44, 1416276843, 1416276843, 44),
(12, 162, 10, 73, 1417070046, 1417070046, 73),
(13, 159, 11, 73, 1417172550, 1417172550, 73),
(14, 163, 11, 73, 1417172550, 1417172550, 73),
(15, 168, 12, 73, 1419559559, 1419559559, 73),
(16, 168, 13, 73, 1419829946, 1419829946, 73),
(17, 168, 14, 73, 1420601373, 1420601373, 73);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_order_meetings_v`
--
CREATE TABLE IF NOT EXISTS `ct_order_meetings_v` (
`id` int(10) unsigned
,`title` varchar(100)
,`start_date` int(10) unsigned
,`end_date` int(10) unsigned
,`site` varchar(100)
,`anchor` varchar(45)
,`recorder` varchar(45)
,`actor` varchar(255)
,`discuss` text
,`cancel_reason` varchar(20)
,`cancel_remark` text
,`created_by` int(11)
,`creation_date` int(10)
,`last_update_date` int(10)
,`last_updated_by` int(10)
,`inactive_flag` int(10) unsigned
,`order_id` int(10) unsigned
,`order_title` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_order_status_vl`
--
CREATE TABLE IF NOT EXISTS `ct_order_status_vl` (
`label` text
,`value` varchar(255)
,`id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_roles`
--

CREATE TABLE IF NOT EXISTS `ct_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统角色信息表' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ct_roles`
--

INSERT INTO `ct_roles` (`id`, `role_name`, `description`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(1, 'reporter_vender', '供应商', NULL, NULL, 1412398542, 44),
(2, 'dispatcher', '调度员', NULL, NULL, NULL, NULL),
(3, 'reporter_employee', '内部员工', NULL, NULL, NULL, NULL),
(4, 'reporter_customer', '客户', NULL, NULL, NULL, NULL),
(5, 'leader_vendor', '采购经理', NULL, NULL, NULL, NULL),
(6, 'leader_customer', '质量经理', NULL, NULL, NULL, NULL),
(7, 'leader_employee', '人事经理', NULL, NULL, NULL, NULL),
(8, 'administrator', '系统管理员', NULL, NULL, NULL, NULL),
(11, 'recorder', '所有投诉记录人员', -1, 1411974364, 1411974364, -1),
(12, 'recorder_customer', '客户投诉记录人员', 44, 1413034064, 1413034064, 44),
(13, 'recorder_vendor', '供应商投诉记录人员', 44, 1413424727, 1413424727, 44),
(14, 'recorder_employee', '内部投诉记录人员', 44, 1413424740, 1413424740, 44),
(15, 'manager_customer', '客户投诉处理人', 44, 1413943730, 1413943730, 44),
(16, 'manager_vendor', '供应商投诉处理人', 44, 1413943743, 1413943743, 44),
(17, 'manager_employee', '内部投诉处理人', 44, 1413943797, 1413943797, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ct_role_module_lines`
--

CREATE TABLE IF NOT EXISTS `ct_role_module_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `module_line_id` int(11) NOT NULL COMMENT '模块功能',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色对应功能表' AUTO_INCREMENT=242 ;

--
-- Dumping data for table `ct_role_module_lines`
--

INSERT INTO `ct_role_module_lines` (`id`, `role_id`, `module_line_id`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(3, 8, 14, 1412148323, 44, 1412148323, 44),
(20, 0, 13, 1413033621, 44, 1413033621, 44),
(21, 0, 14, 1413033621, 44, 1413033621, 44),
(22, 0, 13, 1413033700, 44, 1413033700, 44),
(23, 0, 14, 1413033700, 44, 1413033700, 44),
(32, 1, 18, 1413095998, 44, 1413095998, 44),
(33, 1, 22, 1413115599, 44, 1413115599, 44),
(34, 1, 23, 1413115740, 44, 1413115740, 44),
(35, 1, 24, 1413115836, 44, 1413115836, 44),
(37, 8, 34, 1413425791, 44, 1413425791, 44),
(45, 1, 25, 1413426237, 44, 1413426237, 44),
(46, 11, 18, 1413427802, 44, 1413427802, 44),
(47, 11, 22, 1413427802, 44, 1413427802, 44),
(48, 11, 24, 1413427802, 44, 1413427802, 44),
(49, 8, 23, 1413436999, 44, 1413436999, 44),
(50, 8, 25, 1413436999, 44, 1413436999, 44),
(51, 8, 39, 1413628264, 44, 1413628264, 44),
(52, 8, 40, 1413628264, 44, 1413628264, 44),
(53, 8, 41, 1413628381, 44, 1413628381, 44),
(54, 8, 42, 1413628381, 44, 1413628381, 44),
(55, 8, 43, 1413628381, 44, 1413628381, 44),
(56, 8, 44, 1413628381, 44, 1413628381, 44),
(58, 1, 37, 1413677275, 44, 1413677275, 44),
(59, 1, 36, 1413677275, 44, 1413677275, 44),
(60, 1, 38, 1413677275, 44, 1413677275, 44),
(69, 3, 23, 1413677348, 44, 1413677348, 44),
(70, 3, 25, 1413677348, 44, 1413677348, 44),
(71, 3, 18, 1413677348, 44, 1413677348, 44),
(72, 3, 37, 1413677348, 44, 1413677348, 44),
(73, 3, 22, 1413677348, 44, 1413677348, 44),
(74, 3, 36, 1413677348, 44, 1413677348, 44),
(75, 3, 24, 1413677348, 44, 1413677348, 44),
(76, 3, 38, 1413677348, 44, 1413677348, 44),
(77, 5, 23, 1413677371, 44, 1413677371, 44),
(78, 5, 25, 1413677371, 44, 1413677371, 44),
(79, 5, 22, 1413677371, 44, 1413677371, 44),
(80, 5, 36, 1413677371, 44, 1413677371, 44),
(81, 5, 24, 1413677371, 44, 1413677371, 44),
(82, 5, 38, 1413677371, 44, 1413677371, 44),
(83, 6, 23, 1413677383, 44, 1413677383, 44),
(84, 6, 25, 1413677383, 44, 1413677383, 44),
(85, 6, 22, 1413677383, 44, 1413677383, 44),
(86, 6, 36, 1413677383, 44, 1413677383, 44),
(87, 6, 24, 1413677383, 44, 1413677383, 44),
(88, 6, 38, 1413677383, 44, 1413677383, 44),
(89, 7, 23, 1413677393, 44, 1413677393, 44),
(90, 7, 25, 1413677393, 44, 1413677393, 44),
(91, 7, 22, 1413677393, 44, 1413677393, 44),
(92, 7, 36, 1413677393, 44, 1413677393, 44),
(93, 7, 24, 1413677393, 44, 1413677393, 44),
(94, 7, 38, 1413677393, 44, 1413677393, 44),
(95, 8, 24, 1413677416, 44, 1413677416, 44),
(96, 8, 38, 1413677416, 44, 1413677416, 44),
(97, 11, 23, 1413677443, 44, 1413677443, 44),
(98, 11, 25, 1413677443, 44, 1413677443, 44),
(99, 11, 37, 1413677443, 44, 1413677443, 44),
(100, 11, 36, 1413677443, 44, 1413677443, 44),
(101, 11, 38, 1413677443, 44, 1413677443, 44),
(102, 12, 23, 1413677453, 44, 1413677453, 44),
(103, 12, 25, 1413677453, 44, 1413677453, 44),
(104, 12, 18, 1413677453, 44, 1413677453, 44),
(105, 12, 37, 1413677453, 44, 1413677453, 44),
(106, 12, 22, 1413677453, 44, 1413677453, 44),
(107, 12, 36, 1413677453, 44, 1413677453, 44),
(108, 12, 24, 1413677453, 44, 1413677453, 44),
(109, 12, 38, 1413677453, 44, 1413677453, 44),
(110, 13, 23, 1413677466, 44, 1413677466, 44),
(111, 13, 25, 1413677466, 44, 1413677466, 44),
(112, 13, 18, 1413677466, 44, 1413677466, 44),
(113, 13, 37, 1413677466, 44, 1413677466, 44),
(114, 13, 22, 1413677466, 44, 1413677466, 44),
(115, 13, 36, 1413677466, 44, 1413677466, 44),
(116, 13, 24, 1413677466, 44, 1413677466, 44),
(117, 13, 38, 1413677466, 44, 1413677466, 44),
(118, 14, 23, 1413677475, 44, 1413677475, 44),
(119, 14, 25, 1413677475, 44, 1413677475, 44),
(120, 14, 18, 1413677475, 44, 1413677475, 44),
(121, 14, 37, 1413677475, 44, 1413677475, 44),
(122, 14, 22, 1413677475, 44, 1413677475, 44),
(123, 14, 36, 1413677475, 44, 1413677475, 44),
(124, 14, 24, 1413677475, 44, 1413677475, 44),
(125, 14, 38, 1413677475, 44, 1413677475, 44),
(126, 4, 23, 1413678853, 47, 1413678853, 47),
(127, 4, 25, 1413678853, 47, 1413678853, 47),
(128, 4, 18, 1413678853, 47, 1413678853, 47),
(129, 4, 37, 1413678853, 47, 1413678853, 47),
(130, 4, 22, 1413678853, 47, 1413678853, 47),
(131, 4, 36, 1413678853, 47, 1413678853, 47),
(132, 4, 24, 1413678853, 47, 1413678853, 47),
(133, 4, 38, 1413678853, 47, 1413678853, 47),
(134, 8, 45, 1413699836, 44, 1413699836, 44),
(135, 8, 46, 1413699836, 44, 1413699836, 44),
(136, 5, 47, 1413858372, 44, 1413858372, 44),
(137, 6, 47, 1413859537, 44, 1413859537, 44),
(138, 7, 47, 1413859544, 44, 1413859544, 44),
(139, 14, 47, 1413859737, 44, 1413859737, 44),
(140, 13, 47, 1413859756, 44, 1413859756, 44),
(141, 12, 47, 1413859763, 44, 1413859763, 44),
(142, 11, 47, 1413859769, 44, 1413859769, 44),
(143, 15, 23, 1413943846, 44, 1413943846, 44),
(144, 15, 25, 1413943846, 44, 1413943846, 44),
(145, 15, 22, 1413943846, 44, 1413943846, 44),
(146, 15, 36, 1413943846, 44, 1413943846, 44),
(147, 15, 47, 1413943846, 44, 1413943846, 44),
(148, 15, 24, 1413943846, 44, 1413943846, 44),
(149, 15, 38, 1413943846, 44, 1413943846, 44),
(150, 16, 23, 1413943856, 44, 1413943856, 44),
(151, 16, 25, 1413943856, 44, 1413943856, 44),
(152, 16, 22, 1413943856, 44, 1413943856, 44),
(153, 16, 36, 1413943856, 44, 1413943856, 44),
(154, 16, 47, 1413943856, 44, 1413943856, 44),
(155, 16, 24, 1413943856, 44, 1413943856, 44),
(156, 16, 38, 1413943856, 44, 1413943856, 44),
(157, 17, 23, 1413943867, 44, 1413943867, 44),
(158, 17, 25, 1413943867, 44, 1413943867, 44),
(159, 17, 22, 1413943867, 44, 1413943867, 44),
(160, 17, 36, 1413943867, 44, 1413943867, 44),
(161, 17, 47, 1413943867, 44, 1413943867, 44),
(162, 17, 24, 1413943867, 44, 1413943867, 44),
(163, 17, 38, 1413943867, 44, 1413943867, 44),
(164, 8, 48, 1414117076, 44, 1414117076, 44),
(165, 1, 49, 1414638771, 44, 1414638771, 44),
(166, 3, 49, 1414638837, 44, 1414638837, 44),
(167, 4, 49, 1414638848, 44, 1414638848, 44),
(168, 5, 49, 1414638926, 44, 1414638926, 44),
(169, 6, 49, 1414638934, 44, 1414638934, 44),
(170, 7, 49, 1414638940, 44, 1414638940, 44),
(171, 8, 49, 1414638948, 44, 1414638948, 44),
(172, 11, 49, 1414638954, 44, 1414638954, 44),
(173, 12, 49, 1414638961, 44, 1414638961, 44),
(174, 13, 49, 1414638972, 44, 1414638972, 44),
(175, 14, 49, 1414638980, 44, 1414638980, 44),
(176, 15, 49, 1414638985, 44, 1414638985, 44),
(177, 16, 49, 1414638990, 44, 1414638990, 44),
(178, 17, 49, 1414638996, 44, 1414638996, 44),
(180, 2, 23, 1415066859, 44, 1415066859, 44),
(183, 2, 22, 1415067033, 44, 1415067033, 44),
(184, 2, 24, 1415067033, 44, 1415067033, 44),
(185, 2, 25, 1415067033, 44, 1415067033, 44),
(186, 2, 36, 1415067033, 44, 1415067033, 44),
(187, 2, 38, 1415067033, 44, 1415067033, 44),
(188, 2, 49, 1415067033, 44, 1415067033, 44),
(189, 2, 51, 1415067153, 44, 1415067153, 44),
(190, 2, 52, 1415067153, 44, 1415067153, 44),
(191, 5, 53, 1415068548, 44, 1415068548, 44),
(192, 5, 56, 1415068548, 44, 1415068548, 44),
(193, 6, 53, 1415068569, 44, 1415068569, 44),
(195, 7, 53, 1415068590, 44, 1415068590, 44),
(196, 7, 56, 1415068590, 44, 1415068590, 44),
(197, 4, 56, 1415068631, 44, 1415068631, 44),
(198, 11, 51, 1415068671, 44, 1415068671, 44),
(199, 12, 51, 1415068719, 44, 1415068719, 44),
(200, 13, 51, 1415068726, 44, 1415068726, 44),
(201, 14, 51, 1415068733, 44, 1415068733, 44),
(202, 15, 54, 1415068758, 44, 1415068758, 44),
(203, 15, 55, 1415068758, 44, 1415068758, 44),
(204, 16, 54, 1415068768, 44, 1415068768, 44),
(205, 16, 55, 1415068768, 44, 1415068768, 44),
(206, 17, 54, 1415068788, 44, 1415068788, 44),
(207, 17, 55, 1415068788, 44, 1415068788, 44),
(208, 8, 58, 1415666833, 44, 1415666833, 44),
(209, 8, 59, 1415753980, 44, 1415753980, 44),
(210, 8, 60, 1415843261, 44, 1415843261, 44),
(211, 8, 61, 1415853192, 44, 1415853192, 44),
(212, 8, 22, 1415950201, 44, 1415950201, 44),
(213, 8, 36, 1415950201, 44, 1415950201, 44),
(214, 8, 47, 1415950201, 44, 1415950201, 44),
(233, 1, 56, 1417268457, 44, 1417268457, 44),
(234, 3, 56, 1417268474, 44, 1417268474, 44),
(235, 8, 62, 1419740094, -1, 1419740094, -1),
(236, 8, 63, 1420334884, 44, 1420334884, 44),
(237, 8, 50, 1420347003, 44, 1420347003, 44),
(238, 1, 50, 1420347155, 44, 1420347155, 44),
(239, 3, 50, 1420347170, 44, 1420347170, 44),
(240, 4, 50, 1420347179, 44, 1420347179, 44),
(241, 8, 64, 1420519261, 44, 1420519261, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_role_module_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_role_module_lines_v` (
`role_module_line_id` int(11)
,`role_id` int(11)
,`id` int(11)
,`module_id` int(11)
,`function_id` int(11)
,`sort` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`module_name` varchar(100)
,`module_desc` varchar(255)
,`function_name` varchar(100)
,`function_desc` varchar(255)
,`module_sort` int(11)
,`controller` varchar(255)
,`action` varchar(255)
,`display_flag` tinyint(3) unsigned
,`function_display_class` varchar(100)
,`module_display_class` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_role_profiles`
--

CREATE TABLE IF NOT EXISTS `ct_role_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL COMMENT '权限对象ID',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `module_line_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`role_id`,`object_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色对应权限表' AUTO_INCREMENT=159 ;

--
-- Dumping data for table `ct_role_profiles`
--

INSERT INTO `ct_role_profiles` (`id`, `role_id`, `object_id`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `module_line_id`) VALUES
(8, 2, 4, 1412992812, 44, 1412992812, 44, NULL),
(39, 0, 2, 1413033621, 44, 1413033621, 44, NULL),
(40, 0, 1, 1413033621, 44, 1413033621, 44, NULL),
(43, 0, 1, 1413033700, 44, 1413033700, 44, NULL),
(45, 0, 2, 1413033700, 44, 1413033700, 44, NULL),
(47, 12, 1, 1413034064, 44, 1413034064, 44, NULL),
(53, 1, 1, 1413427676, 44, 1413427676, 44, NULL),
(56, 1, 3, 1413433089, 44, 1413433089, 44, NULL),
(60, 1, 4, 1413433260, 44, 1413433260, 44, NULL),
(63, 11, 1, 1413440415, 44, 1413440415, 44, NULL),
(79, 3, 1, 1413678052, 46, 1413678052, 46, NULL),
(81, 3, 3, 1413678059, 46, 1413678059, 46, NULL),
(82, 3, 4, 1413678062, 46, 1413678062, 46, NULL),
(83, 2, 1, 1413678353, 47, 1413678353, 47, NULL),
(85, 2, 3, 1413678359, 47, 1413678359, 47, NULL),
(90, 4, 4, 1413678880, 47, 1413678880, 47, NULL),
(91, 5, 1, 1413687228, 44, 1413687228, 44, NULL),
(93, 5, 3, 1413687232, 44, 1413687232, 44, NULL),
(94, 5, 4, 1413687234, 44, 1413687234, 44, NULL),
(95, 6, 1, 1413687331, 44, 1413687331, 44, NULL),
(97, 6, 3, 1413687335, 44, 1413687335, 44, NULL),
(98, 6, 4, 1413687338, 44, 1413687338, 44, NULL),
(99, 7, 1, 1413687440, 44, 1413687440, 44, NULL),
(101, 7, 3, 1413687444, 44, 1413687444, 44, NULL),
(103, 7, 4, 1413687447, 44, 1413687447, 44, NULL),
(105, 11, 3, 1413687516, 44, 1413687516, 44, NULL),
(106, 11, 4, 1413687518, 44, 1413687518, 44, NULL),
(107, 12, 3, 1413687542, 44, 1413687542, 44, NULL),
(108, 12, 4, 1413687544, 44, 1413687544, 44, NULL),
(109, 11, 1, 1413687630, 44, 1413687630, 44, NULL),
(110, 11, 1, 1413687707, 44, 1413687707, 44, NULL),
(111, 13, 1, 1413687787, 44, 1413687787, 44, NULL),
(113, 13, 3, 1413687792, 44, 1413687792, 44, NULL),
(114, 13, 4, 1413687795, 44, 1413687795, 44, NULL),
(115, 14, 1, 1413687840, 44, 1413687840, 44, NULL),
(117, 14, 3, 1413687845, 44, 1413687845, 44, NULL),
(118, 14, 4, 1413687847, 44, 1413687847, 44, NULL),
(119, 1, 2, 1413690818, 44, 1413690818, 44, NULL),
(120, 2, 2, 1413690866, 44, 1413690866, 44, NULL),
(121, 3, 2, 1413691034, 44, 1413691034, 44, NULL),
(122, 4, 2, 1413691062, 44, 1413691062, 44, NULL),
(123, 5, 2, 1413691102, 44, 1413691102, 44, NULL),
(124, 6, 2, 1413691142, 44, 1413691142, 44, NULL),
(125, 7, 2, 1413691166, 44, 1413691166, 44, NULL),
(126, 11, 2, 1413691218, 44, 1413691218, 44, NULL),
(127, 12, 2, 1413691248, 44, 1413691248, 44, NULL),
(128, 13, 2, 1413691270, 44, 1413691270, 44, NULL),
(129, 14, 2, 1413691290, 44, 1413691290, 44, NULL),
(130, 4, 1, 1413702288, 44, 1413702288, 44, NULL),
(132, 4, 3, 1413702427, 44, 1413702427, 44, NULL),
(133, 5, 5, 1413941635, 44, 1413941635, 44, NULL),
(134, 6, 5, 1413941701, 44, 1413941701, 44, NULL),
(135, 7, 5, 1413941727, 44, 1413941727, 44, NULL),
(139, 17, 1, 1413943894, 44, 1413943894, 44, NULL),
(140, 17, 2, 1413943897, 44, 1413943897, 44, NULL),
(141, 17, 3, 1413943900, 44, 1413943900, 44, NULL),
(142, 17, 4, 1413943902, 44, 1413943902, 44, NULL),
(143, 16, 1, 1413944528, 44, 1413944528, 44, NULL),
(144, 16, 2, 1413944530, 44, 1413944530, 44, NULL),
(145, 16, 3, 1413944532, 44, 1413944532, 44, NULL),
(146, 16, 4, 1413944535, 44, 1413944535, 44, NULL),
(147, 15, 1, 1413944614, 44, 1413944614, 44, NULL),
(148, 15, 2, 1413944616, 44, 1413944616, 44, NULL),
(149, 15, 3, 1413944618, 44, 1413944618, 44, NULL),
(150, 15, 4, 1413944620, 44, 1413944620, 44, NULL),
(151, 15, 5, 1414131379, 44, 1414131379, 44, NULL),
(152, 16, 5, 1414131442, 44, 1414131442, 44, NULL),
(153, 17, 5, 1414131463, 44, 1414131463, 44, NULL),
(155, 8, 1, 1415950226, 44, 1415950226, 44, NULL),
(156, 8, 2, 1415950258, 44, 1415950258, 44, NULL),
(157, 8, 3, 1415951540, 44, 1415951540, 44, NULL),
(158, 8, 4, 1419922716, 44, 1419922716, 44, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_role_profiles_v`
--
CREATE TABLE IF NOT EXISTS `ct_role_profiles_v` (
`id` int(11)
,`role_id` int(11)
,`object_id` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`object_name` varchar(20)
,`object_desc` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_role_profile_lines`
--

CREATE TABLE IF NOT EXISTS `ct_role_profile_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `object_line_id` int(11) NOT NULL COMMENT '权限对象项目',
  `auth_value` text NOT NULL COMMENT '项目值',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`profile_id`,`object_line_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色对应权限明细表' AUTO_INCREMENT=276 ;

--
-- Dumping data for table `ct_role_profile_lines`
--

INSERT INTO `ct_role_profile_lines` (`id`, `profile_id`, `object_line_id`, `auth_value`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(7, 8, 8, 'TRUE', 1412992812, 44, 1412992812, 44),
(8, 8, 11, 'all', 1412992812, 44, 1412992812, 44),
(41, 43, 3, 'customer', 1413033700, 44, 1413033700, 44),
(42, 43, 4, 'all', 1413033700, 44, 1413033700, 44),
(43, 43, 5, 'all', 1413033700, 44, 1413033700, 44),
(47, 45, 6, 'TRUE', 1413033700, 44, 1413033700, 44),
(49, 47, 3, 'customer', 1413034064, 44, 1413034064, 44),
(50, 47, 4, 'released,confirmed', 1413034064, 44, 1413859684, 44),
(51, 47, 5, 'all', 1413034064, 44, 1413034064, 44),
(61, 53, 3, 'vendor', 1413427676, 44, 1414116089, 44),
(62, 53, 4, 'released,closed', 1413427676, 44, 1417268404, 44),
(63, 53, 5, 'all', 1413427676, 44, 1413427676, 44),
(68, 56, 7, 'order_status,order_status_new', 1413433089, 44, 1413677589, 44),
(74, 60, 8, 'FALSE', 1413433260, 44, 1413677499, 44),
(75, 60, 11, 'all', 1413433260, 44, 1413677522, 44),
(82, 63, 3, 'vendor', 1413440415, 44, 1413687624, 44),
(83, 63, 4, 'released,confirmed', 1413440415, 44, 1413859643, 44),
(84, 63, 5, 'all', 1413440415, 44, 1413440415, 44),
(116, 79, 3, 'employee', 1413678052, 46, 1415160950, 44),
(117, 79, 4, 'released,closed', 1413678052, 46, 1417268421, 44),
(118, 79, 5, 'all', 1413678052, 46, 1413678052, 46),
(120, 81, 7, 'all', 1413678059, 46, 1413678059, 46),
(121, 82, 8, 'TRUE', 1413678062, 46, 1417269755, 44),
(122, 82, 11, 'all', 1413678062, 46, 1413678062, 46),
(123, 83, 3, 'all', 1413678353, 47, 1413678392, 47),
(124, 83, 4, 'confirmed', 1413678353, 47, 1413945717, 44),
(125, 83, 5, 'all', 1413678353, 47, 1413678353, 47),
(127, 85, 7, 'all', 1413678359, 47, 1413678359, 47),
(135, 90, 8, 'FALSE', 1413678880, 47, 1413693429, 44),
(136, 90, 11, 'all', 1413678880, 47, 1413678880, 47),
(137, 91, 3, 'vendor', 1413687228, 44, 1417266976, 44),
(138, 91, 4, 'allocated,closed', 1413687228, 44, 1413945074, 44),
(139, 91, 5, 'all', 1413687228, 44, 1413687228, 44),
(141, 93, 7, 'all', 1413687232, 44, 1413687232, 44),
(142, 94, 8, 'TRUE', 1413687234, 44, 1413687234, 44),
(143, 94, 11, 'all', 1413687234, 44, 1413687234, 44),
(144, 95, 3, 'customer', 1413687331, 44, 1413687331, 44),
(145, 95, 4, 'allocated', 1413687331, 44, 1417172796, 44),
(146, 95, 5, 'all', 1413687331, 44, 1413687331, 44),
(148, 97, 7, 'all', 1413687335, 44, 1413687335, 44),
(149, 98, 8, 'TRUE', 1413687338, 44, 1413687338, 44),
(150, 98, 11, 'all', 1413687338, 44, 1413687338, 44),
(151, 99, 3, 'employee', 1413687440, 44, 1413687464, 44),
(152, 99, 4, 'allocated,close', 1413687440, 44, 1413945117, 44),
(153, 99, 5, 'all', 1413687440, 44, 1413687440, 44),
(155, 101, 7, 'all', 1413687444, 44, 1413687444, 44),
(157, 103, 8, 'TRUE', 1413687447, 44, 1413687447, 44),
(158, 103, 11, 'all', 1413687447, 44, 1413687447, 44),
(160, 105, 7, 'all', 1413687516, 44, 1413687516, 44),
(161, 106, 8, 'TRUE', 1413687518, 44, 1413687518, 44),
(162, 106, 11, 'all', 1413687518, 44, 1413687518, 44),
(163, 107, 7, 'all', 1413687542, 44, 1413687542, 44),
(164, 108, 8, 'TRUE', 1413687544, 44, 1413687544, 44),
(165, 108, 11, 'all', 1413687544, 44, 1413687544, 44),
(166, 109, 3, 'customer', 1413687630, 44, 1413687630, 44),
(167, 109, 4, 'released,confirmed', 1413687630, 44, 1413859659, 44),
(168, 109, 5, 'all', 1413687630, 44, 1413687630, 44),
(169, 110, 3, 'employee', 1413687707, 44, 1413687717, 44),
(170, 110, 4, 'released,confirmed', 1413687707, 44, 1413859669, 44),
(171, 110, 5, 'all', 1413687707, 44, 1413687707, 44),
(172, 111, 3, 'vendor', 1413687787, 44, 1413687803, 44),
(173, 111, 4, 'released,confirmed', 1413687787, 44, 1413859702, 44),
(174, 111, 5, 'all', 1413687787, 44, 1413687787, 44),
(176, 113, 7, 'all', 1413687792, 44, 1413687792, 44),
(177, 114, 8, 'TRUE', 1413687795, 44, 1413687795, 44),
(178, 114, 11, 'all', 1413687795, 44, 1413687795, 44),
(179, 115, 3, 'employee', 1413687840, 44, 1413687857, 44),
(180, 115, 4, 'released,confirmed', 1413687840, 44, 1413859723, 44),
(181, 115, 5, 'all', 1413687840, 44, 1413687840, 44),
(183, 117, 7, 'all', 1413687845, 44, 1413687845, 44),
(184, 118, 8, 'TRUE', 1413687847, 44, 1413687847, 44),
(185, 118, 11, 'all', 1413687847, 44, 1413687847, 44),
(186, 119, 13, 'vendor', 1413690818, 44, 1413690830, 44),
(187, 119, 6, 'TRUE', 1413690818, 44, 1413690837, 44),
(188, 120, 13, 'all', 1413690866, 44, 1413690866, 44),
(189, 120, 6, 'FALSE', 1413690866, 44, 1413690875, 44),
(190, 121, 13, 'employee', 1413691034, 44, 1413691046, 44),
(191, 121, 6, 'TRUE', 1413691034, 44, 1413691034, 44),
(192, 122, 13, 'customer', 1413691062, 44, 1413691086, 44),
(193, 122, 6, 'TRUE', 1413691062, 44, 1413691062, 44),
(194, 123, 13, 'vendor', 1413691102, 44, 1413691120, 44),
(195, 123, 6, 'TRUE', 1413691102, 44, 1415071190, 44),
(196, 124, 13, 'customer', 1413691142, 44, 1413691155, 44),
(197, 124, 6, 'TRUE', 1413691142, 44, 1415071211, 44),
(198, 125, 13, 'employee', 1413691166, 44, 1413691185, 44),
(199, 125, 6, 'TRUE', 1413691166, 44, 1415071224, 44),
(200, 126, 13, 'all', 1413691218, 44, 1413691218, 44),
(201, 126, 6, 'TRUE', 1413691218, 44, 1413691218, 44),
(202, 127, 13, 'customer', 1413691248, 44, 1413691259, 44),
(203, 127, 6, 'TRUE', 1413691248, 44, 1413691248, 44),
(204, 128, 13, 'vendor', 1413691270, 44, 1413691281, 44),
(205, 128, 6, 'TRUE', 1413691270, 44, 1413691270, 44),
(206, 129, 13, 'employee', 1413691290, 44, 1413691302, 44),
(207, 129, 6, 'TRUE', 1413691290, 44, 1413691290, 44),
(208, 130, 4, 'released,closed,reopen', 1413702288, 44, 1413702364, 44),
(209, 130, 5, 'all', 1413702288, 44, 1413702288, 44),
(210, 130, 3, 'customer', 1413702288, 44, 1413702288, 44),
(213, 132, 7, 'order_status,order_status_new', 1413702427, 44, 1413702474, 44),
(214, 133, 16, 'all', 1413941635, 44, 1413941635, 44),
(215, 133, 15, 'vendor', 1413941635, 44, 1413941691, 44),
(216, 133, 14, 'show', 1413941635, 44, 1413941648, 44),
(217, 134, 16, 'all', 1413941701, 44, 1413941701, 44),
(218, 134, 15, 'customer', 1413941701, 44, 1413941717, 44),
(219, 134, 14, 'show', 1413941701, 44, 1413941710, 44),
(220, 135, 16, 'all', 1413941727, 44, 1413941727, 44),
(221, 135, 15, 'employee', 1413941727, 44, 1413941750, 44),
(222, 135, 14, 'show', 1413941727, 44, 1413941738, 44),
(232, 139, 4, 'done', 1413943894, 44, 1413944060, 44),
(233, 139, 5, 'all', 1413943894, 44, 1413943894, 44),
(234, 139, 3, 'employee', 1413943894, 44, 1413944020, 44),
(235, 140, 13, 'employee', 1413943897, 44, 1413944689, 44),
(236, 140, 6, 'TRUE', 1413943897, 44, 1413943897, 44),
(237, 141, 7, 'all', 1413943900, 44, 1413943900, 44),
(238, 142, 8, 'TRUE', 1413943902, 44, 1413943902, 44),
(239, 142, 11, 'all', 1413943902, 44, 1413943902, 44),
(240, 143, 4, 'done', 1413944528, 44, 1413944567, 44),
(241, 143, 5, 'all', 1413944528, 44, 1413944528, 44),
(242, 143, 3, 'vendor', 1413944528, 44, 1413944544, 44),
(243, 144, 13, 'vendor', 1413944530, 44, 1413944671, 44),
(244, 144, 6, 'TRUE', 1413944530, 44, 1413944530, 44),
(245, 145, 7, 'all', 1413944532, 44, 1413944532, 44),
(246, 146, 8, 'TRUE', 1413944535, 44, 1413944535, 44),
(247, 146, 11, 'all', 1413944535, 44, 1413944535, 44),
(248, 147, 4, 'done', 1413944614, 44, 1413944632, 44),
(249, 147, 5, 'all', 1413944614, 44, 1413944614, 44),
(250, 147, 3, 'customer', 1413944614, 44, 1413944614, 44),
(251, 148, 13, 'customer', 1413944616, 44, 1413944646, 44),
(252, 148, 6, 'TRUE', 1413944616, 44, 1413944616, 44),
(253, 149, 7, 'all', 1413944618, 44, 1413944618, 44),
(254, 150, 8, 'TRUE', 1413944620, 44, 1413944620, 44),
(255, 150, 11, 'all', 1413944620, 44, 1413944620, 44),
(256, 151, 16, 'all', 1414131379, 44, 1414131379, 44),
(257, 151, 15, 'customer', 1414131379, 44, 1414131406, 44),
(258, 151, 14, 'all', 1414131379, 44, 1414131379, 44),
(259, 152, 16, 'all', 1414131442, 44, 1414131442, 44),
(260, 152, 15, 'vendor', 1414131442, 44, 1414131452, 44),
(261, 152, 14, 'all', 1414131442, 44, 1414131442, 44),
(262, 153, 16, 'all', 1414131463, 44, 1414131463, 44),
(263, 153, 15, 'employee', 1414131463, 44, 1414131474, 44),
(264, 153, 14, 'all', 1414131463, 44, 1414131463, 44),
(268, 155, 4, 'all', 1415950226, 44, 1415950226, 44),
(269, 155, 5, 'all', 1415950226, 44, 1415950226, 44),
(270, 155, 3, 'all', 1415950226, 44, 1415950236, 44),
(271, 156, 13, 'all', 1415950258, 44, 1415950258, 44),
(272, 156, 6, 'FALSE', 1415950258, 44, 1415950267, 44),
(273, 157, 7, 'all', 1415951540, 44, 1415951540, 44),
(274, 158, 8, 'TRUE', 1419922716, 44, 1419923656, 44),
(275, 158, 11, 'all', 1419922716, 44, 1419922716, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_role_profile_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_role_profile_lines_v` (
`role_id` int(11)
,`id` int(11)
,`profile_id` int(11)
,`object_line_id` int(11)
,`auth_value` text
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`auth_item_name` varchar(20)
,`auth_item_desc` varchar(255)
,`object_name` varchar(20)
,`object_desc` varchar(255)
,`object_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_sms_logs`
--

CREATE TABLE IF NOT EXISTS `ct_sms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_to` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `notice_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) NOT NULL,
  `creation_date` int(10) NOT NULL,
  `last_updated_by` int(10) NOT NULL,
  `last_update_date` int(10) NOT NULL,
  `reason` text COMMENT '报错原因',
  PRIMARY KEY (`id`),
  KEY `Index_2` (`created_by`,`creation_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='短信发送记录' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ct_sms_logs`
--

INSERT INTO `ct_sms_logs` (`id`, `send_to`, `content`, `notice_id`, `created_by`, `creation_date`, `last_updated_by`, `last_update_date`, `reason`) VALUES
(1, '13989775601', '会议通知：啊收到了房价 状态 :已结束    会议主题 : 啊收到了房价    开始时间 : 2014-12-29 16:12:00    结束时间 : 2014-12-30 02:00:00    会议地点 : 三楼会议室    主持人 : 客户投诉处理人    记录人 :     参与者 : 超级管理员,客户投诉处理人    会议决议 :     处理投诉单 :168    会议相关文件：', 384, 73, 1420012100, 73, 1420012100, '未设置短信发送参数，请联系管理员'),
(2, '13989775601', '会议通知：啊收到了房价 状态 :已结束    会议主题 : 啊收到了房价    开始时间 : 2014-12-29 16:12:00    结束时间 : 2014-12-30 02:00:00    会议地点 : 三楼会议室    主持人 : 客户投诉处理人    记录人 :     参与者 : 超级管理员,客户投诉处理人    会议决议 :     处理投诉单 :168    会议相关文件：', 386, 73, 1420012180, 73, 1420012180, '未设置短信发送参数，请联系管理员');

-- --------------------------------------------------------

--
-- Table structure for table `ct_status_authobjects`
--

CREATE TABLE IF NOT EXISTS `ct_status_authobjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限对象验证' AUTO_INCREMENT=29 ;

--
-- Dumping data for table `ct_status_authobjects`
--

INSERT INTO `ct_status_authobjects` (`id`, `group_id`, `object_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(5, 2, 1, 44, 1414731310, 1414731310, 44),
(6, 3, 1, 44, 1415061879, 1415061879, 44),
(7, 4, 1, 44, 1415062055, 1415062055, 44),
(8, 5, 1, 44, 1415062146, 1415062146, 44),
(9, 6, 1, 44, 1415062215, 1415062215, 44),
(10, 7, 1, 44, 1415234104, 1415234104, 44),
(11, 8, 1, 44, 1415234267, 1415234267, 44),
(12, 9, 1, 44, 1415234329, 1415234329, 44),
(13, 10, 1, 44, 1415234394, 1415234394, 44),
(14, 11, 1, 44, 1415234472, 1415234472, 44),
(15, 12, 1, 44, 1416197326, 1416197326, 44),
(16, 14, 1, 44, 1416197503, 1416197503, 44),
(17, 13, 1, 44, 1416197531, 1416197531, 44),
(18, 15, 1, 44, 1416197599, 1416197599, 44),
(19, 16, 1, 44, 1416197656, 1416197656, 44),
(20, 17, 1, 44, 1417069174, 1417069174, 44),
(21, 18, 1, 44, 1417069325, 1417069325, 44),
(22, 19, 1, 44, 1417069401, 1417069401, 44),
(23, 20, 1, 44, 1417269915, 1417269915, 44),
(25, 22, 1, 44, 1417270126, 1417270126, 44),
(26, 21, 1, 44, 1417270555, 1417270555, 44),
(27, 21, 1, 44, 1417270879, 1417270879, 44),
(28, 20, 1, 44, 1417271522, 1417271522, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_authobjects_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_authobjects_v` (
`id` int(10) unsigned
,`group_id` int(10) unsigned
,`object_id` int(10) unsigned
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`object_name` varchar(20)
,`description` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_status_authobj_lines`
--

CREATE TABLE IF NOT EXISTS `ct_status_authobj_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_obj_id` int(10) unsigned NOT NULL,
  `authobj_line_id` int(10) unsigned NOT NULL,
  `auth_value` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='状态行权限对象值' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `ct_status_authobj_lines`
--

INSERT INTO `ct_status_authobj_lines` (`id`, `status_obj_id`, `authobj_line_id`, `auth_value`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(10, 5, 4, 'confirmed', 44, 1414731310, 1414741059, 44),
(11, 5, 5, 'all', 44, 1414731310, 1414731310, 44),
(12, 5, 3, 'vendor', 44, 1414731310, 1414741327, 44),
(13, 6, 4, 'allocated', 44, 1415061879, 1415061953, 44),
(14, 6, 5, 'all', 44, 1415061879, 1415061879, 44),
(15, 6, 3, 'vendor', 44, 1415061879, 1415061900, 44),
(16, 7, 4, 'done', 44, 1415062055, 1415062074, 44),
(17, 7, 5, 'all', 44, 1415062055, 1415062055, 44),
(18, 7, 3, 'vendor', 44, 1415062055, 1415062065, 44),
(19, 8, 4, 'closed', 44, 1415062146, 1415062161, 44),
(20, 8, 5, 'all', 44, 1415062146, 1415062146, 44),
(21, 8, 3, 'vendor', 44, 1415062146, 1415062154, 44),
(22, 9, 4, 'reopen', 44, 1415062215, 1415062224, 44),
(23, 9, 5, 'all', 44, 1415062215, 1415062215, 44),
(24, 9, 3, 'vendor', 44, 1415062215, 1415062231, 44),
(25, 10, 4, 'confirmed', 44, 1415234104, 1415234176, 44),
(26, 10, 5, 'all', 44, 1415234104, 1415234104, 44),
(27, 10, 3, 'customer', 44, 1415234104, 1415234104, 44),
(28, 11, 4, 'allocated', 44, 1415234267, 1415234280, 44),
(29, 11, 5, 'all', 44, 1415234267, 1415234267, 44),
(30, 11, 3, 'customer', 44, 1415234267, 1415234267, 44),
(31, 12, 4, 'done', 44, 1415234329, 1415234340, 44),
(32, 12, 5, 'all', 44, 1415234329, 1415234329, 44),
(33, 12, 3, 'customer', 44, 1415234329, 1415234329, 44),
(34, 13, 4, 'closed', 44, 1415234394, 1415234418, 44),
(35, 13, 5, 'all', 44, 1415234394, 1415234394, 44),
(36, 13, 3, 'customer', 44, 1415234394, 1415234394, 44),
(37, 14, 4, 'reopen', 44, 1415234472, 1415234486, 44),
(38, 14, 5, 'all', 44, 1415234472, 1415234472, 44),
(39, 14, 3, 'customer', 44, 1415234472, 1415234472, 44),
(40, 15, 4, 'confirmed', 44, 1416197326, 1416197340, 44),
(41, 15, 5, 'all', 44, 1416197326, 1416197326, 44),
(42, 15, 3, 'employee', 44, 1416197326, 1416197347, 44),
(43, 16, 4, 'done', 44, 1416197503, 1416197513, 44),
(44, 16, 5, 'all', 44, 1416197503, 1416197503, 44),
(45, 16, 3, 'employee', 44, 1416197503, 1416197521, 44),
(46, 17, 4, 'allocated', 44, 1416197531, 1416197537, 44),
(47, 17, 5, 'all', 44, 1416197531, 1416197531, 44),
(48, 17, 3, 'employee', 44, 1416197531, 1416197547, 44),
(49, 18, 4, 'closed', 44, 1416197599, 1416197610, 44),
(50, 18, 5, 'all', 44, 1416197599, 1416197599, 44),
(51, 18, 3, 'employee', 44, 1416197599, 1416197617, 44),
(52, 19, 4, 'reopen', 44, 1416197656, 1416197665, 44),
(53, 19, 5, 'all', 44, 1416197656, 1416197656, 44),
(54, 19, 3, 'employee', 44, 1416197656, 1416197671, 44),
(55, 20, 4, 'allocated', 44, 1417069174, 1417069186, 44),
(56, 20, 5, 'all', 44, 1417069174, 1417069174, 44),
(57, 20, 3, 'vendor', 44, 1417069174, 1417069196, 44),
(58, 21, 4, 'allocated', 44, 1417069325, 1417069346, 44),
(59, 21, 5, 'all', 44, 1417069325, 1417069325, 44),
(60, 21, 3, 'customer', 44, 1417069325, 1417069325, 44),
(61, 22, 4, 'allocated', 44, 1417069401, 1417069410, 44),
(62, 22, 5, 'all', 44, 1417069401, 1417069401, 44),
(63, 22, 3, 'employee', 44, 1417069401, 1417069416, 44),
(64, 23, 4, 'released', 44, 1417269915, 1417271516, 44),
(65, 23, 5, 'all', 44, 1417269915, 1417269915, 44),
(66, 23, 3, 'vendor', 44, 1417269915, 1417270048, 44),
(70, 25, 4, 'released,closed', 44, 1417270126, 1417270137, 44),
(71, 25, 5, 'all', 44, 1417270126, 1417270126, 44),
(72, 25, 3, 'employee', 44, 1417270126, 1417270144, 44),
(73, 26, 4, 'released', 44, 1417270555, 1417270874, 44),
(74, 26, 5, 'all', 44, 1417270555, 1417270555, 44),
(75, 26, 3, 'customer', 44, 1417270555, 1417270555, 44),
(76, 27, 4, 'closed', 44, 1417270879, 1417270890, 44),
(77, 27, 5, 'all', 44, 1417270879, 1417270879, 44),
(78, 27, 3, 'customer', 44, 1417270879, 1417270879, 44),
(79, 28, 4, 'closed', 44, 1417271522, 1417271537, 44),
(80, 28, 5, 'all', 44, 1417271522, 1417271522, 44),
(81, 28, 3, 'customer', 44, 1417271522, 1417271522, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_authobj_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_authobj_lines_v` (
`id` int(10) unsigned
,`status_obj_id` int(10) unsigned
,`authobj_line_id` int(10) unsigned
,`auth_value` varchar(255)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`valuelist_id` int(11)
,`auth_item_name` varchar(20)
,`auth_item_desc` varchar(255)
,`object_name` varchar(20)
,`object_desc` varchar(255)
,`default_value` text
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_status_conditions`
--

CREATE TABLE IF NOT EXISTS `ct_status_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `and_or` varchar(3) NOT NULL DEFAULT 'AND' COMMENT '与或关系',
  `field_name` varchar(100) NOT NULL,
  `operation` varchar(45) NOT NULL COMMENT '运算',
  `target_value` varchar(255) NOT NULL COMMENT '运算目标值',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='状态流转条件表' AUTO_INCREMENT=32 ;

--
-- Dumping data for table `ct_status_conditions`
--

INSERT INTO `ct_status_conditions` (`id`, `and_or`, `field_name`, `operation`, `target_value`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`, `group_id`) VALUES
(2, 'AND', 'status', 'EQ', 'released', 44, 1414731289, 1415001573, 44, 2),
(7, 'AND', 'status', 'EQ', 'confirmed', 44, 1414829103, 1415061862, 44, 3),
(8, 'AND', 'status', 'EQ', 'allocated', 44, 1415062091, 1415062091, 44, 4),
(9, 'AND', 'status', 'EQ', 'done', 44, 1415062134, 1415062134, 44, 5),
(10, 'AND', 'status', 'EQ', 'closed', 44, 1415062209, 1415062209, 44, 6),
(11, 'AND', 'status', 'EQ', 'released', 44, 1415234089, 1415234089, 44, 7),
(12, 'AND', 'status', 'EQ', 'confirmed', 44, 1415234221, 1415234221, 44, 8),
(14, 'AND', 'leader_id', 'NE', 'null', 44, 1415234250, 1415234250, 44, 8),
(15, 'AND', 'status', 'EQ', 'allocated', 44, 1415234313, 1415234313, 44, 9),
(16, 'AND', 'status', 'EQ', 'done', 44, 1415234379, 1415234379, 44, 10),
(17, 'AND', 'status', 'EQ', 'closed', 44, 1415234451, 1415234451, 44, 11),
(18, 'AND', 'status', 'EQ', 'released', 44, 1416197256, 1416197256, 44, 12),
(19, 'AND', 'leader_id', 'NE', 'null', 44, 1416197399, 1417269475, 44, 13),
(21, 'AND', 'status', 'EQ', 'confirmed', 44, 1416197431, 1416197431, 44, 13),
(22, 'AND', 'status', 'EQ', 'allocated', 44, 1416197491, 1416197491, 44, 14),
(23, 'AND', 'status', 'EQ', 'done', 44, 1416197587, 1416197587, 44, 15),
(24, 'AND', 'status', 'EQ', 'closed', 44, 1416197649, 1416197649, 44, 16),
(25, 'AND', 'leader_id', 'NE', 'null', 44, 1417069028, 1417069028, 44, 3),
(26, 'AND', 'status', 'EQ', 'allocated', 44, 1417069232, 1417069232, 44, 17),
(27, 'AND', 'manager_id', 'NE', 'null', 44, 1417069254, 1417069254, 44, 17),
(28, 'AND', 'status', 'EQ', 'allocated', 44, 1417069360, 1417069360, 44, 18),
(29, 'AND', 'leader_id', 'NE', 'null', 44, 1417069370, 1417069370, 44, 18),
(30, 'AND', 'status', 'EQ', 'allocated', 44, 1417069426, 1417069426, 44, 19),
(31, 'AND', 'manager_id', 'NE', 'null', 44, 1417069440, 1417069440, 44, 19);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_conditions_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_conditions_v` (
`id` int(10) unsigned
,`and_or` varchar(3)
,`field_name` varchar(100)
,`operation` varchar(45)
,`target_value` varchar(255)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`group_id` int(10) unsigned
,`status_line_id` int(11)
,`group_name` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_status_condition_groups`
--

CREATE TABLE IF NOT EXISTS `ct_status_condition_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `status_line_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='状态流条件组' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ct_status_condition_groups`
--

INSERT INTO `ct_status_condition_groups` (`id`, `group_name`, `status_line_id`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(2, '默认条件组', 8, 44, 1414999005, 1414999005, 44),
(3, '默认条件组', 9, 44, 1414999278, 1414999278, 44),
(4, '默认条件组', 10, 44, 1415062050, 1415062050, 44),
(5, '默认条件组', 11, 44, 1415062126, 1415062126, 44),
(6, '默认条件组', 25, 44, 1415062198, 1415062198, 44),
(7, '默认条件组', 14, 44, 1415234044, 1415234044, 44),
(8, '默认条件组', 15, 44, 1415234201, 1415234201, 44),
(9, '默认条件组', 16, 44, 1415234302, 1415234302, 44),
(10, '默认条件组', 17, 44, 1415234363, 1415234363, 44),
(11, '默认条件组', 18, 44, 1415234439, 1415234439, 44),
(12, '默认条件组', 20, 44, 1416197242, 1416197242, 44),
(13, '默认条件组', 21, 44, 1416197366, 1416197366, 44),
(14, '默认条件组', 22, 44, 1416197480, 1416197480, 44),
(15, '默认条件组', 23, 44, 1416197576, 1416197576, 44),
(16, '默认条件组', 24, 44, 1416197637, 1416197637, 44),
(17, '重复分配', 9, 44, 1417069167, 1417069167, 44),
(18, '重复分配', 15, 44, 1417069320, 1417069320, 44),
(19, '重复分配', 21, 44, 1417069397, 1417069397, 44);

-- --------------------------------------------------------

--
-- Table structure for table `ct_status_functions`
--

CREATE TABLE IF NOT EXISTS `ct_status_functions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_line_id` int(10) unsigned NOT NULL,
  `function_id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL COMMENT '功能按钮显示标签',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='状态行对应的功能' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `ct_status_functions`
--

INSERT INTO `ct_status_functions` (`id`, `status_line_id`, `function_id`, `sort`, `label`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(4, 7, 26, 0, '问题已确认', 44, 1415063757, 1415067379, 44),
(5, 8, 27, 0, '选择责任人', 44, 1415063785, 1415063785, 44),
(6, 8, 28, 1, '选择处理人', 44, 1415063847, 1415063847, 44),
(7, 9, 28, 0, '重新指定处理人', 44, 1415067468, 1415067468, 44),
(8, 9, 30, 6, '问题已解决', 44, 1415067497, 1415067554, 44),
(10, 9, 29, 0, '计划完成日期', 44, 1415067548, 1415067548, 44),
(11, 10, 31, 0, '投诉单关闭', 44, 1415069336, 1415069336, 44),
(13, 13, 26, 0, '问题已确认', 44, 1415234016, 1415234016, 44),
(14, 14, 27, 0, '选择责任人', 44, 1415234575, 1415234575, 44),
(15, 14, 28, 1, '选择处理人', 44, 1415234589, 1415234589, 44),
(16, 15, 28, 0, '重新指定处理人', 44, 1415234623, 1415234623, 44),
(17, 15, 30, 6, '问题已解决', 44, 1415234640, 1415234640, 44),
(18, 15, 29, 0, '计划完成日期', 44, 1415234657, 1415234657, 44),
(19, 16, 31, 0, '投诉单关闭', 44, 1415234684, 1415234684, 44),
(20, 11, 32, 0, '重新打开', 44, 1415234798, 1415234798, 44),
(21, 17, 32, 0, '重新打开', 44, 1415234822, 1415234822, 44),
(22, 19, 26, 0, '问题已确认', 44, 1416197706, 1416197706, 44),
(23, 20, 27, 0, '选择责任人', 44, 1416197738, 1416197738, 44),
(24, 20, 28, 1, '选择处理人', 44, 1416197749, 1416197749, 44),
(25, 21, 28, 0, '重新指定处理人', 44, 1416197771, 1416197771, 44),
(26, 21, 30, 6, '问题已解决', 44, 1416197781, 1416197791, 44),
(27, 21, 29, 0, '计划完成日期', 44, 1416197806, 1416197806, 44),
(28, 22, 31, 0, '投诉单关闭', 44, 1416197826, 1416197826, 44),
(29, 23, 32, 0, '重新打开', 44, 1416197845, 1416197845, 44),
(30, 11, 24, 1, '评分反馈', 44, 1420346904, 1420346904, 44),
(31, 17, 24, 1, '评分反馈', 44, 1420346958, 1420346958, 44),
(32, 23, 24, 1, '评分反馈', 44, 1420346985, 1420346985, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_functions_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_functions_v` (
`id` int(10) unsigned
,`status_line_id` int(10) unsigned
,`function_id` int(10) unsigned
,`sort` int(10) unsigned
,`label` varchar(255)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`function_name` varchar(100)
,`description` varchar(255)
,`controller` varchar(255)
,`action` varchar(255)
,`display_class` varchar(100)
,`render_flag` tinyint(1)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_status_header`
--

CREATE TABLE IF NOT EXISTS `ct_status_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` varchar(20) NOT NULL COMMENT '状态码',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `sys_order_id` int(11) DEFAULT NULL COMMENT '系统单据ID',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统状态表' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ct_status_header`
--

INSERT INTO `ct_status_header` (`id`, `status_code`, `description`, `sys_order_id`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'order_status', '投诉投诉单状态', 1, NULL, NULL, 1414738471, 44),
(2, 'vendor_status', '供应商投诉单状态流', 1, 1414117801, 44, 1414117801, 44),
(3, 'customer_status', '客户投诉单状态流', 1, 1414117834, 44, 1414117834, 44),
(4, 'employee_status', '内部投诉单状态流', 1, 1414117866, 44, 1414117866, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_header_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_header_v` (
`id` int(11)
,`status_code` varchar(20)
,`description` varchar(255)
,`sys_order_id` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`table_name` varchar(100)
,`order_name` varchar(100)
,`order_desc` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_status_lines`
--

CREATE TABLE IF NOT EXISTS `ct_status_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) NOT NULL,
  `step` varchar(20) NOT NULL COMMENT '步骤',
  `step_value` varchar(255) NOT NULL COMMENT '状态',
  `step_desc` varchar(255) NOT NULL COMMENT '步骤描述',
  `next_steps` varchar(255) DEFAULT NULL COMMENT '下一步允许范围',
  `callback_step` varchar(20) DEFAULT NULL COMMENT '冲销默认返回',
  `initial_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '初始化标识',
  `auto_ending_flag` tinyint(4) NOT NULL COMMENT '自动结束',
  `inactive_flag` tinyint(1) NOT NULL DEFAULT '0',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `default_next_step` varchar(20) DEFAULT NULL COMMENT '默认下一步',
  `last_step_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '流程结尾',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_vl_line_01` (`status_id`,`step`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统状态步骤表' AUTO_INCREMENT=26 ;

--
-- Dumping data for table `ct_status_lines`
--

INSERT INTO `ct_status_lines` (`id`, `status_id`, `step`, `step_value`, `step_desc`, `next_steps`, `callback_step`, `initial_flag`, `auto_ending_flag`, `inactive_flag`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `default_next_step`, `last_step_flag`) VALUES
(1, 1, '10', 'released', '已提交', '20,50', NULL, 1, 0, 0, NULL, NULL, 1414124284, 44, '20', 0),
(2, 1, '20', 'confirmed', '已确认', '30,50', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '30', 0),
(3, 1, '30', 'allocated', '已分配', '30,40,50', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '40', 0),
(4, 1, '40', 'done', '已解决', '50', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '50', 0),
(5, 1, '50', 'closed', '已关闭', '60', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, '60', 0),
(6, 1, '60', 'reopen', '重新打开', '30,50', NULL, 0, 0, 1, NULL, NULL, 1414032071, 44, '30', 0),
(7, 2, '10', 'released', '已提交', '20,50', '', 1, 0, 0, 1414124622, 44, 1414124866, 44, '20', 0),
(8, 2, '20', 'confirmed', '已确认', '30,50', '', 0, 0, 0, 1414124771, 44, 1414124903, 44, '30', 0),
(9, 2, '30', 'allocated', '已分配', '30,40,50', '', 0, 0, 0, 1414124980, 44, 1414124980, 44, '40', 0),
(10, 2, '40', 'done', '已解决', '50', '', 0, 0, 0, 1414125008, 44, 1414125008, 44, '50', 0),
(11, 2, '50', 'closed', '已关闭', '60', '', 0, 0, 0, 1414125037, 44, 1414125037, 44, '60', 0),
(13, 3, '10', 'released', '已提交', '20,50', '', 1, 0, 0, 1414125183, 44, 1414125183, 44, '20', 0),
(14, 3, '20', 'confirmed', '已确认', '30,50', '', 0, 0, 0, 1414125209, 44, 1414125209, 44, '30', 0),
(15, 3, '30', 'allocated', '已分配', '30,40,50', '', 0, 0, 0, 1414125237, 44, 1414125237, 44, '40', 0),
(16, 3, '40', 'done', '已解决', '50', '', 0, 0, 0, 1414125263, 44, 1414125263, 44, '50', 0),
(17, 3, '50', 'closed', '已关闭', '60', '', 0, 0, 0, 1414125289, 44, 1414125289, 44, '60', 0),
(18, 3, '60', 'reopen', '重新打开', '30,50', '', 0, 0, 1, 1414125319, 44, 1414125319, 44, '30', 0),
(19, 4, '10', 'released', '已提交', '20,50', '', 1, 0, 0, 1414125347, 44, 1414125347, 44, '20', 0),
(20, 4, '20', 'confirmed', '已确认', '30,50', '', 0, 0, 0, 1414125556, 44, 1414125556, 44, '30', 0),
(21, 4, '30', 'allocated', '已分配', '30,40,50', '', 0, 0, 0, 1414125582, 44, 1414125582, 44, '40', 0),
(22, 4, '40', 'done', '已解决', '50', '', 0, 0, 0, 1414125609, 44, 1414125609, 44, '50', 0),
(23, 4, '50', 'closed', '已关闭', '60', '', 0, 0, 0, 1414125631, 44, 1414125631, 44, '60', 0),
(24, 4, '60', 'reopen', '重新打开', '30,50', '', 0, 0, 1, 1414125658, 44, 1414125658, 44, '30', 0),
(25, 2, '60', 'reopen', '重新打开', '30,50', '', 0, 0, 1, 1414726363, 44, 1414726363, 44, '30', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_status_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_status_lines_v` (
`id` int(11)
,`status_id` int(11)
,`step` varchar(20)
,`step_value` varchar(255)
,`step_desc` varchar(255)
,`next_steps` varchar(255)
,`callback_step` varchar(20)
,`initial_flag` tinyint(1)
,`auto_ending_flag` tinyint(4)
,`inactive_flag` tinyint(1)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`default_next_step` varchar(20)
,`last_step_flag` tinyint(3) unsigned
,`status_code` varchar(20)
,`description` varchar(255)
,`order_name` varchar(100)
,`table_name` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_system_orders`
--

CREATE TABLE IF NOT EXISTS `ct_system_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL COMMENT '对应数据库表',
  `order_name` varchar(100) NOT NULL COMMENT '单据名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `help` text COMMENT '帮助文档',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统单据表' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ct_system_orders`
--

INSERT INTO `ct_system_orders` (`id`, `table_name`, `order_name`, `description`, `help`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'ct_orders', '投诉单', '用于投诉', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ct_system_sessions`
--

CREATE TABLE IF NOT EXISTS `ct_system_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ct_system_sessions`
--

INSERT INTO `ct_system_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('00aa52fa9956f1c10b5f69987de108e8', '0.0.0.0', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 1421845486, 'a:2:{s:9:"user_data";s:0:"";s:4:"code";s:4:"0009";}'),
('0b039284eee84e3c2458c88b4f9d8059', '0.0.0.0', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 1421845504, 'a:1:{s:9:"user_data";s:0:"";}'),
('23ff24fb7c2e42c30a797be0af6ddc54', '0.0.0.0', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 1421845486, 'a:1:{s:9:"user_data";s:0:"";}'),
('41ba2aefc1d4d2cdcfeef6be52adc593', '0.0.0.0', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 1421845573, 'a:6:{s:9:"user_data";s:0:"";s:4:"code";s:4:"1448";s:3:"uid";i:73;s:2:"cm";s:2:"23";s:3:"mid";s:1:"4";s:3:"fid";s:1:"6";}'),
('545105b19e174862a276f141b7f4171e', '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1421847854, 'a:6:{s:9:"user_data";s:0:"";s:4:"code";s:4:"5124";s:2:"cm";s:2:"47";s:3:"mid";s:1:"6";s:3:"fid";s:2:"22";s:3:"uid";i:73;}'),
('f8d9ed6c913e3482a96b7b8bed23fafb', '0.0.0.0', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .N', 1421845392, 'a:3:{s:9:"user_data";s:0:"";s:4:"code";s:4:"8586";s:3:"uid";i:67;}');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_tables_vl`
--
CREATE TABLE IF NOT EXISTS `ct_tables_vl` (
`value` varchar(64)
,`label` varchar(2048)
,`id` varchar(64)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_users`
--

CREATE TABLE IF NOT EXISTS `ct_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `sex` varchar(20) NOT NULL DEFAULT 'male' COMMENT '性别',
  `contact` varchar(255) DEFAULT NULL COMMENT '默认联系人',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件地址',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '办公电话',
  `mobile_telephone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `full_name` varchar(255) NOT NULL COMMENT '公司名称/员工姓名',
  `inactive_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '失效标识',
  `email_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接收邮件',
  `sms_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接收短信',
  `initial_pass_flag` int(11) NOT NULL DEFAULT '1' COMMENT '密码初始化标识',
  `created_by` int(11) DEFAULT NULL,
  `creation_date` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`username`),
  UNIQUE KEY `Index_4` (`full_name`),
  KEY `Index_3` (`username`,`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统用户信息表' AUTO_INCREMENT=76 ;

--
-- Dumping data for table `ct_users`
--

INSERT INTO `ct_users` (`id`, `username`, `password`, `sex`, `contact`, `email`, `phone_number`, `mobile_telephone`, `address`, `full_name`, `inactive_flag`, `email_flag`, `sms_flag`, `initial_pass_flag`, `created_by`, `creation_date`, `last_update_date`, `last_updated_by`) VALUES
(44, 'administrator', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '超级管理员', 'yacole@qq.com', '13777777777', '13989775601', '乐清柳市镇', '超级管理员', 0, 1, 0, 1, -1, 1412039595, 1416797887, 44),
(45, 'reporter_customer', 'fbeae417c84f2bf1121ab58c55105b4247c8e069', 'male', '客户测试账号', '', '', '', '', '客户测试账号', 0, 0, 0, 1, 44, 1412229944, 1413633221, 44),
(46, 'reporter_vendor', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '供应商测试账号', '', '', '', '', '供应商测试账号', 0, 0, 0, 1, 44, 1412230134, 1415692472, 44),
(47, 'reporter_employee', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '内部员工测试账号', '', '', '', '', '内部员工测试账号', 0, 0, 0, 1, 44, 1412230196, 1413633237, 44),
(48, 'dispatcher', 'fbeae417c84f2bf1121ab58c55105b4247c8e069', 'male', '调度员测试账号1', 'gs1357@qq.com', '', '', '', '调度员测试账号', 0, 1, 0, 0, 44, 1412230229, 1414556731, 48),
(66, 'leader_vendor', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '采购经理测试账号', '383731104@qq.com', '', '', '', '采购经理测试账号', 0, 1, 0, 1, 44, 1412231054, 1413704167, 66),
(67, 'leader_customer', '3421ecde2a5de6543b48460b867cf323b018bc22', 'female', '质量经理测试账号', '', '', '', '', '质量经理测试账号', 0, 0, 0, 0, 44, 1412404281, 1413633152, 44),
(68, 'leader_employee', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'female', '', '', '', '', '', '人事经理测试账号', 0, 0, 0, 1, 44, 1412404348, 1413633189, 44),
(69, 'recorder', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '投诉记录人员', 'yacole@sooncreate.com', NULL, NULL, NULL, '投诉记录人员', 0, 0, 0, 1, 44, 1413633354, 1413633354, 44),
(70, 'recorder_customer', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '客户投诉记录人员', 'yacole@sooncreate.com', NULL, NULL, NULL, '客户投诉记录人员', 0, 0, 0, 1, 44, 1413633537, 1413633537, 44),
(71, 'recorder_vendor', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '供应商投诉记录人员', NULL, NULL, NULL, NULL, '供应商投诉记录人员', 0, 0, 0, 1, 44, 1413633576, 1413633576, 44),
(72, 'recorder_employee', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '内部投诉记录人员', NULL, NULL, NULL, NULL, '内部投诉记录人员', 0, 0, 0, 1, 44, 1413633592, 1413633592, 44),
(73, 'manager_customer', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', '', 'yacole@sooncreate.com', '', '', '', '客户投诉处理人', 0, 0, 0, 1, 44, 1413944283, 1419835495, 73),
(74, 'manager_vendor', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', NULL, NULL, NULL, NULL, NULL, '供应商投诉处理人', 0, 0, 0, 1, 44, 1413944310, 1413944310, 44),
(75, 'manager_employee', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'male', NULL, NULL, NULL, NULL, NULL, '内部投诉处理人', 0, 0, 0, 1, 44, 1413944328, 1414816959, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_user_auth_v`
--
CREATE TABLE IF NOT EXISTS `ct_user_auth_v` (
`role_id` int(11)
,`object_name` varchar(20)
,`description` varchar(255)
,`user_id` int(11)
,`profile_id` int(11)
,`id` int(11)
,`username` varchar(200)
,`password` varchar(255)
,`contact` varchar(255)
,`email` varchar(255)
,`phone_number` varchar(255)
,`mobile_telephone` varchar(255)
,`address` varchar(255)
,`full_name` varchar(255)
,`inactive_flag` tinyint(1)
,`email_flag` tinyint(1)
,`sms_flag` tinyint(1)
,`initial_pass_flag` int(11)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_user_configs`
--

CREATE TABLE IF NOT EXISTS `ct_user_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) unsigned NOT NULL,
  `config_value` varchar(255) NOT NULL COMMENT '配置值',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='系统配置表' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ct_user_configs`
--

INSERT INTO `ct_user_configs` (`id`, `config_id`, `config_value`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`, `user_id`) VALUES
(1, 43, 'TRUE', 1414645437, 44, 1414645444, 44, 44),
(2, 44, 'FALSE', 1414716375, 44, 1417072480, 44, 44),
(3, 47, 'FALSE', 1419915542, 44, 1420012375, 44, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_user_configs_v`
--
CREATE TABLE IF NOT EXISTS `ct_user_configs_v` (
`id` int(11)
,`config_id` int(10) unsigned
,`config_value` varchar(255)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`user_id` int(10) unsigned
,`config_name` varchar(20)
,`description` varchar(255)
,`default_value` varchar(255)
,`editable_flag` tinyint(1)
,`data_type` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_user_functions_v`
--
CREATE TABLE IF NOT EXISTS `ct_user_functions_v` (
`role_module_line_id` int(11)
,`controller` varchar(255)
,`action` varchar(255)
,`role_id` int(11)
,`id` int(11)
,`module_id` int(11)
,`function_id` int(11)
,`sort` int(11)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`module_name` varchar(100)
,`module_desc` varchar(255)
,`function_name` varchar(100)
,`function_desc` varchar(255)
,`user_id` int(11)
,`module_sort` int(11)
,`display_flag` tinyint(3) unsigned
,`function_display_class` varchar(100)
,`module_display_class` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_user_roles`
--

CREATE TABLE IF NOT EXISTS `ct_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户角色对应表' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `ct_user_roles`
--

INSERT INTO `ct_user_roles` (`id`, `user_id`, `role_id`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(20, 44, 8, 1413426182, 44, 1413426182, 44),
(56, 46, 1, 1413677789, 44, 1413677789, 44),
(57, 69, 1, 1413677789, 44, 1413677789, 44),
(58, 71, 1, 1413677789, 44, 1413677789, 44),
(59, 47, 3, 1413678191, 46, 1413678191, 46),
(60, 72, 3, 1413678191, 46, 1413678191, 46),
(61, 48, 2, 1413678514, 48, 1413678514, 48),
(62, 72, 2, 1413678530, 48, 1413678530, 48),
(64, 45, 4, 1413678553, 48, 1413678553, 48),
(66, 66, 5, 1413678571, 48, 1413678571, 48),
(68, 67, 6, 1413678582, 48, 1413678582, 48),
(70, 68, 7, 1413678605, 48, 1413678605, 48),
(72, 69, 11, 1413678616, 48, 1413678616, 48),
(74, 70, 12, 1413678630, 48, 1413678630, 48),
(77, 71, 13, 1413678647, 48, 1413678647, 48),
(78, 72, 14, 1413678658, 48, 1413678658, 48),
(79, 73, 15, 1413944339, 44, 1413944339, 44),
(80, 75, 17, 1413944346, 44, 1413944346, 44),
(81, 74, 16, 1413944355, 44, 1413944355, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_user_roles_v`
--
CREATE TABLE IF NOT EXISTS `ct_user_roles_v` (
`id` int(11)
,`username` varchar(200)
,`password` varchar(255)
,`sex` varchar(20)
,`contact` varchar(255)
,`email` varchar(255)
,`phone_number` varchar(255)
,`mobile_telephone` varchar(255)
,`address` varchar(255)
,`full_name` varchar(255)
,`inactive_flag` tinyint(1)
,`email_flag` tinyint(1)
,`sms_flag` tinyint(1)
,`initial_pass_flag` int(11)
,`created_by` int(11)
,`creation_date` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
,`role_name` varchar(20)
,`role_desc` varchar(255)
,`role_id` int(11)
,`user_id` int(11)
,`ur_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_valuelist_header`
--

CREATE TABLE IF NOT EXISTS `ct_valuelist_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valuelist_name` varchar(20) NOT NULL COMMENT '值集名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `object_flag` tinyint(4) DEFAULT '0' COMMENT '是否表/视图对象',
  `label_fieldname` varchar(100) DEFAULT NULL COMMENT '描述字段',
  `value_fieldname` varchar(100) DEFAULT NULL COMMENT '值字段',
  `source_view` varchar(100) DEFAULT NULL COMMENT '源表/视图',
  `condition` text COMMENT '查询条件',
  `parent_id` int(11) DEFAULT NULL COMMENT '父值集',
  `editable_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可编辑',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`valuelist_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='值集信息表' AUTO_INCREMENT=42 ;

--
-- Dumping data for table `ct_valuelist_header`
--

INSERT INTO `ct_valuelist_header` (`id`, `valuelist_name`, `description`, `object_flag`, `label_fieldname`, `value_fieldname`, `source_view`, `condition`, `parent_id`, `editable_flag`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 'vl_order_type', '投诉单类型', 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 1412753720, 44),
(2, 'vl_severity', '严重程度', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(3, 'vl_priority', '优先级', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(4, 'vl_frequency', '发生频率', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(6, 'ao_order_status', '投诉单状态权限对象', 1, 'label', 'value', 'ct_order_status_vl', '', NULL, 1, NULL, NULL, 1413854418, 44),
(7, 'vl_order_category', '投诉单分类', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(8, 'ao_order_category', '投诉单分类权限对象', 1, 'segment_desc', 'segment_value', 'ct_order_category_vl', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(9, 'ao_order_type', '投诉单类型权限对象', 1, 'segment_desc', 'segment_value', 'ct_valuelist_vl', 'valuelist_name = ''vl_order_type''', NULL, 1, NULL, NULL, NULL, NULL),
(10, 'default_role', '投诉单类型默认角色', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(11, 'ao_true_or_false', '权限对象选择是/否', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(12, 'default_category', '投诉单默认的分类（在分类未开启时）', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL),
(14, 'vl_dll_type', '数据库dll操作类型', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(15, 'vl_valuelist', '值集列表', 1, 'label', 'value', 'ct_valuelist_header_vl', '', NULL, 1, NULL, NULL, NULL, NULL),
(16, 'vl_order_status', '投诉单状态', 1, 'label', 'value', 'ct_order_status_vl', '', NULL, 1, NULL, NULL, 1413873207, 44),
(17, 'vl_user', '用户列表', 1, 'full_name', 'id', 'ct_users', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(18, 'vl_meeting_cancel', '会议取消原因', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(19, 'vl_sex', '用户性别', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(20, 'vl_feedback', '投诉单反馈项目', 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(22, 'vl_authobject', '供权限对象使用的值集', 1, 'description', 'id', 'ct_valuelist_header', 'valuelist_name like ''ao_%''', NULL, 1, 1412754189, 44, 1412991840, 44),
(23, 'vl_tables', '系统表/视图值集', 1, 'label', 'value', 'ct_tables_vl', '', NULL, 1, 1412907002, 44, 1412907002, 44),
(24, 'vl_roles', '系统角色列表', 1, 'description', 'id', 'ct_roles', '', NULL, 1, 1412927876, 44, 1412928109, 44),
(25, 'ao_log_type', '投诉单日志类型', 1, 'description', 'log_type', 'ct_order_log_types', NULL, NULL, 1, NULL, NULL, NULL, NULL),
(26, 'vl_auth_object', '权限对象值集', 1, 'description', 'id', 'ct_authority_objects', '', NULL, 1, 1413513361, 44, 1413513361, 44),
(27, 'default_status', '投诉单默认状态', 0, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, 1413850930, 44),
(28, 'ao_action', '权限对象通常操作', 0, NULL, NULL, NULL, NULL, 0, 1, 1413941359, 44, 1413941359, 44),
(29, 'vl_functions', '功能列表', 1, 'description', 'id', 'ct_functions', '', NULL, 1, 1414459315, 44, 1414459315, 44),
(30, 'vl_register_select', '用户类型（用户注册用）', 0, NULL, NULL, NULL, NULL, 1, 1, 1414558238, 44, 1414558299, 44),
(31, 'vl_and_or', '与或关系', 0, NULL, NULL, NULL, NULL, 0, 1, 1414632932, 44, 1414632932, 44),
(32, 'vl_operations', '运算公式', 0, NULL, NULL, NULL, NULL, 0, 1, 1414633095, 44, 1414633095, 44),
(33, 'vl_authority_objects', '权限对象值集', 1, 'description', 'id', 'ct_authority_objects', '', NULL, 1, 1414720433, 44, 1414720433, 44),
(34, 'vl_sys_orders', '系统单据列表', 1, 'order_name', 'id', 'ct_system_orders', '', NULL, 1, 1414738213, 44, 1414738213, 44),
(35, 'vl_notice_type', '消息类型', 0, NULL, NULL, NULL, NULL, 0, 1, 1419919159, 44, 1419919159, 44),
(36, 'vl_message_type', '通知记录类型', 0, NULL, NULL, NULL, NULL, 0, 1, 1420335008, 44, 1420335008, 44),
(37, 'vl_data_type', '数据类型', 0, NULL, NULL, NULL, NULL, 0, 1, 1420417809, 44, 1420417809, 44),
(38, 'vl_variant_method', '变式传输模式', 0, NULL, NULL, NULL, NULL, 0, 1, 1420422170, 44, 1420422170, 44),
(39, 'vl_output_type', '输出类型', 0, NULL, NULL, NULL, NULL, 0, 1, 1420519670, 44, 1420519670, 44),
(40, 'vl_period_type', '周期类型', 0, NULL, NULL, NULL, NULL, 0, 1, 1420765721, 44, 1420765721, 44),
(41, 'vl_job_status', '后台作业状态', 0, NULL, NULL, NULL, NULL, 0, 1, 1420785456, 44, 1420785456, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_valuelist_header_vl`
--
CREATE TABLE IF NOT EXISTS `ct_valuelist_header_vl` (
`value` int(11)
,`label` varchar(278)
,`id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_valuelist_lines`
--

CREATE TABLE IF NOT EXISTS `ct_valuelist_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valuelist_id` int(11) NOT NULL,
  `segment` int(11) NOT NULL COMMENT '段',
  `segment_value` varchar(255) NOT NULL COMMENT '段值',
  `segment_desc` varchar(255) NOT NULL COMMENT '段描述',
  `inactive_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '失效标识',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `parent_segment_value` varchar(20) DEFAULT NULL COMMENT '父值集值',
  `creation_date` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `last_update_date` int(11) DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_vl_line_01` (`valuelist_id`,`segment`,`parent_segment_value`) USING BTREE,
  KEY `Index_3` (`valuelist_id`,`parent_segment_value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='值集明细表' AUTO_INCREMENT=105 ;

--
-- Dumping data for table `ct_valuelist_lines`
--

INSERT INTO `ct_valuelist_lines` (`id`, `valuelist_id`, `segment`, `segment_value`, `segment_desc`, `inactive_flag`, `sort`, `parent_segment_value`, `creation_date`, `created_by`, `last_update_date`, `last_updated_by`) VALUES
(1, 1, 10, 'vendor', '供应商投诉单', 0, 1, '0', NULL, NULL, 1413506503, 44),
(2, 1, 20, 'employee', '内部员工投诉单', 0, 2, '0', NULL, NULL, NULL, NULL),
(3, 1, 30, 'customer', '客户投诉单', 0, 1, '0', NULL, NULL, 1414127308, 44),
(4, 2, 30, 'low', '低', 0, 0, '0', NULL, NULL, NULL, NULL),
(5, 2, 20, 'middle', '中', 0, 1, '0', NULL, NULL, 1413688001, 45),
(6, 2, 10, 'high', '高', 0, 2, '0', NULL, NULL, 1413688007, 45),
(7, 3, 30, 'low', '低', 0, 0, '0', NULL, NULL, NULL, NULL),
(8, 3, 20, 'middle', '中', 0, 1, '0', NULL, NULL, 1413688031, 45),
(9, 3, 10, 'high', '高', 0, 2, '0', NULL, NULL, 1413688035, 45),
(10, 4, 10, 'low', '仅发生一次', 0, 0, '0', NULL, NULL, NULL, NULL),
(11, 4, 20, 'middle', '偶尔发生', 0, 0, '0', NULL, NULL, NULL, NULL),
(12, 4, 30, 'high', '发生频率很高', 0, 0, '0', NULL, NULL, NULL, NULL),
(16, 7, 10, '10', '默认', 0, 0, 'vendor', NULL, NULL, NULL, NULL),
(18, 10, 10, 'reporter_vender', '供应商', 0, 1, 'vendor', NULL, NULL, 1412902890, 44),
(21, 10, 10, 'reporter_customer', '客户', 0, 0, 'customer', NULL, NULL, NULL, NULL),
(22, 10, 10, 'reporter_employee', '内部员工', 0, 0, 'employee', NULL, NULL, NULL, NULL),
(24, 7, 20, '20', '采购需求', 0, 1, 'vendor', NULL, NULL, 1413419176, 44),
(25, 7, 10, '10', '默认', 0, 0, 'customer', NULL, NULL, NULL, NULL),
(26, 7, 10, '30', '默认', 0, 0, 'employee', NULL, NULL, NULL, NULL),
(27, 11, 10, 'TRUE', '是', 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, 11, 20, 'FALSE', '否', 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, 12, 10, '10', '默认', 0, 0, 'vendor', NULL, NULL, NULL, NULL),
(30, 12, 20, '10', '默认', 0, 0, 'customer', NULL, NULL, NULL, NULL),
(31, 12, 30, '10', '默认', 0, 0, 'employee', NULL, NULL, NULL, NULL),
(32, 14, 10, 'update', '更新', 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, 14, 20, 'insert', '创建', 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 18, 10, '10', '投诉问题已解决', 0, 0, NULL, NULL, NULL, NULL, NULL),
(35, 18, 20, '20', '创建失误', 0, 0, NULL, NULL, NULL, NULL, NULL),
(36, 18, 30, '30', '确认无需再召开', 0, 0, NULL, NULL, NULL, NULL, NULL),
(37, 19, 10, 'male', '男', 0, 0, NULL, NULL, NULL, NULL, NULL),
(38, 19, 20, 'female', '女', 0, 0, NULL, NULL, NULL, NULL, NULL),
(39, 20, 10, '10', '响应速度', 0, 0, NULL, NULL, NULL, 1413623372, 44),
(40, 20, 20, '20', '服务态度', 0, 0, NULL, NULL, NULL, 1413623384, 44),
(43, 7, 20, '20', '产品线一', 0, 1, 'customer', 1412824646, -1, 1413689959, 44),
(44, 7, 30, '30', '产品线二', 0, 2, 'customer', 1412824672, -1, 1413689969, 44),
(45, 7, 40, '40', '产品线三', 0, 1, 'customer', 1412825288, -1, 1413689981, 44),
(47, 7, 30, '30', '设计图纸', 0, 2, 'vendor', 1413419139, 44, 1413419167, 44),
(48, 7, 40, '40', '采购部门服务', 0, 3, 'vendor', 1413419234, 44, 1413419234, 44),
(50, 27, 10, 'customer_status', '客户投诉单状态流', 0, 0, 'customer', 1413850731, 44, 1414125703, 44),
(51, 27, 20, 'vendor_status', '供应商投诉单状态流', 0, 0, 'vendor', 1413850784, 44, 1414125691, 44),
(52, 27, 30, 'employee_status', '内部员工投诉单状态流', 0, 0, 'employee', 1413850827, 44, 1414125713, 44),
(53, 28, 10, 'create', '创建', 0, 0, '', 1413941375, 44, 1413941436, 44),
(54, 28, 20, 'edit', '编辑', 0, 1, '', 1413941384, 44, 1413941451, 44),
(55, 28, 30, 'show', '查看', 0, 2, '', 1413941397, 44, 1413941455, 44),
(56, 28, 40, 'destroy', '删除', 0, 3, '', 1413941429, 44, 1413941465, 44),
(57, 28, 50, 'inactive', '失效', 0, 4, '', 1413943072, 66, 1413943072, 66),
(58, 28, 60, 'run', '执行', 0, 5, '', 1413943089, 66, 1413943253, 66),
(59, 30, 10, 'vendor', '供应商', 0, 0, 'vendor', 1414558391, 44, 1414558391, 44),
(60, 30, 10, 'customer', '客户', 0, 0, 'customer', 1414558402, 44, 1414558402, 44),
(61, 30, 10, 'employee', '内部员工', 0, 0, 'employee', 1414558418, 44, 1414558418, 44),
(62, 31, 10, 'AND', '与', 0, 0, '', 1414633060, 44, 1414633060, 44),
(63, 31, 20, 'OR', '或', 0, 1, '', 1414633071, 44, 1414633071, 44),
(64, 32, 10, 'EQ', '等于', 0, 0, '', 1414633136, 44, 1414633136, 44),
(65, 32, 20, 'NE', '不等于', 0, 1, '', 1414633229, 44, 1414633229, 44),
(66, 32, 30, 'IN', '在...中', 0, 2, '', 1414633251, 44, 1414633251, 44),
(67, 32, 40, 'NOT_IN', '不在...中', 0, 3, '', 1414633273, 44, 1414633273, 44),
(68, 32, 50, 'GT', '大于', 0, 4, '', 1414633293, 44, 1414633293, 44),
(69, 32, 60, 'GE', '大于等于', 0, 5, '', 1414633307, 44, 1414633307, 44),
(70, 32, 70, 'LT', '小于', 0, 6, '', 1414633320, 44, 1414633320, 44),
(71, 32, 80, 'LE', '小于等于', 0, 7, '', 1414633333, 44, 1414633333, 44),
(72, 32, 90, 'HE', '开头等于', 0, 8, '', 1414633347, 44, 1414633347, 44),
(73, 32, 100, 'HNE', '开头不等于', 0, 9, '', 1414633363, 44, 1414633363, 44),
(74, 32, 110, 'TE', '结尾等于', 0, 10, '', 1414633602, 44, 1414633602, 44),
(75, 32, 120, 'TNE', '结尾不等于', 0, 11, '', 1414633637, 44, 1414633637, 44),
(76, 32, 130, 'LIKE', '部分等于', 0, 12, '', 1414633687, 44, 1414633687, 44),
(77, 32, 140, 'NOT_LIKE', '部分不等于', 0, 13, '', 1414633702, 44, 1414633702, 44),
(78, 35, 10, 'log', '变更提醒', 0, 0, '', 1419919412, 44, 1419921322, 44),
(79, 35, 20, 'meeting', '会议通知', 0, 0, '', 1419919427, 44, 1419921256, 44),
(80, 35, 30, 'feedback', '反馈', 0, 0, '', 1419919449, 44, 1419921305, 44),
(81, 36, 10, 'notice', '站内提醒', 0, 0, '', 1420335045, 44, 1420335045, 44),
(82, 36, 20, 'email', '电子邮件', 0, 0, '', 1420335063, 44, 1420335089, 44),
(83, 36, 30, 'sms', '手机短信', 0, 0, '', 1420335077, 44, 1420335077, 44),
(84, 35, 40, 'pcd_warning', '计划超时警告', 0, 0, '', 1420341762, 44, 1420341762, 44),
(85, 37, 10, 'string', '字符串', 0, 0, '', 1420417824, 44, 1420417824, 44),
(86, 37, 20, 'number', '数字', 0, 1, '', 1420417890, 44, 1420417890, 44),
(87, 37, 30, 'boolean', 'TRUE/FALSE（是/否）', 0, 2, '', 1420417917, 44, 1420443461, 44),
(88, 37, 40, 'date', '日期（年-月-日）', 0, 3, '', 1420417958, 44, 1420417958, 44),
(89, 37, 50, 'datetime', '时间（年-月-日 时:分:秒）', 0, 4, '', 1420418012, 44, 1420418012, 44),
(90, 38, 10, 'POST', 'POST', 0, 0, '', 1420422185, 44, 1420422185, 44),
(91, 38, 20, 'GET', 'GET', 0, 1, '', 1420422204, 44, 1420422204, 44),
(92, 37, 60, 'time', '时分秒', 0, 3, '', 1420441898, 44, 1420441911, 44),
(93, 39, 10, 'txt', '文本', 0, 0, '', 1420519697, 44, 1420519697, 44),
(94, 39, 20, 'xlsx', 'Excel', 0, 1, '', 1420519740, 44, 1420519758, 44),
(95, 39, 30, 'pdf', 'PDF', 1, 2, '', 1420519755, 44, 1420519755, 44),
(96, 39, 40, 'doc', 'Word', 0, 3, '', 1420519789, 44, 1421732092, 44),
(97, 40, 10, 'minute', '分钟', 0, 0, '', 1420765759, 44, 1420765759, 44),
(98, 40, 20, 'hour', '小时', 0, 1, '', 1420765773, 44, 1420765773, 44),
(99, 40, 30, 'day', '日', 0, 2, '', 1420765789, 44, 1420765789, 44),
(100, 40, 40, 'month', '月', 0, 3, '', 1420765839, 44, 1420765839, 44),
(101, 41, 10, 'running', '运行中', 0, 0, '', 1420785551, 44, 1420785551, 44),
(102, 41, 20, 'finished', '已完成', 0, 1, '', 1420785631, 44, 1420785631, 44),
(103, 41, 30, 'canceled', '已取消', 0, 2, '', 1420785657, 44, 1420785657, 44),
(104, 40, 50, 'year', '年', 0, 4, '', 1421125174, 44, 1421125174, 44);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_valuelist_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_valuelist_lines_v` (
`valuelist_name` varchar(20)
,`description` varchar(255)
,`object_flag` tinyint(4)
,`label_fieldname` varchar(100)
,`value_fieldname` varchar(100)
,`source_view` varchar(100)
,`condition` text
,`parent_id` int(11)
,`id` int(11)
,`valuelist_id` int(11)
,`segment` int(11)
,`segment_value` varchar(255)
,`segment_desc` varchar(255)
,`inactive_flag` tinyint(1)
,`sort` int(11)
,`parent_segment` varchar(20)
,`creation_date` int(11)
,`created_by` int(11)
,`last_update_date` int(11)
,`last_updated_by` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_valuelist_vl`
--
CREATE TABLE IF NOT EXISTS `ct_valuelist_vl` (
`valuelist_name` varchar(20)
,`valuelist_desc` varchar(255)
,`segment` int(11)
,`segment_value` varchar(255)
,`segment_desc` varchar(255)
,`id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `ct_variant_lines`
--

CREATE TABLE IF NOT EXISTS `ct_variant_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variant_id` int(10) unsigned NOT NULL,
  `segment_name` varchar(45) NOT NULL,
  `segment_value` varchar(255) NOT NULL,
  `data_type` varchar(45) NOT NULL COMMENT '数据类型',
  `now_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为现在时间',
  `created_by` int(10) unsigned DEFAULT NULL,
  `creation_date` int(10) unsigned DEFAULT NULL,
  `last_updated_by` int(10) unsigned DEFAULT NULL,
  `last_update_date` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_2` (`variant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='变式参数列表' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ct_variant_lines`
--

INSERT INTO `ct_variant_lines` (`id`, `variant_id`, `segment_name`, `segment_value`, `data_type`, `now_flag`, `created_by`, `creation_date`, `last_updated_by`, `last_update_date`) VALUES
(1, 3, 'v1', '1', 'string', 0, 44, 1421125943, 44, 1421125949),
(2, 3, 'v2', '2', 'number', 0, 44, 1421125956, 44, 1421125956),
(3, 3, 'v3', 'TRUE', 'boolean', 0, 44, 1421125968, 44, 1421125968),
(4, 3, 'v4', '', 'date', 1, 44, 1421125977, 44, 1421125977),
(5, 3, 'v5', '', 'time', 1, 44, 1421125989, 44, 1421125989),
(6, 3, 'v6', '', 'datetime', 1, 44, 1421125999, 44, 1421125999),
(7, 4, 'p1', '1', 'string', 0, 44, 1421719678, 44, 1421719678),
(8, 4, 'p2', '', 'datetime', 1, 44, 1421719687, 44, 1421719732);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ct_variant_lines_v`
--
CREATE TABLE IF NOT EXISTS `ct_variant_lines_v` (
`id` int(10) unsigned
,`variant_id` int(10) unsigned
,`segment_name` varchar(45)
,`segment_value` varchar(255)
,`data_type` varchar(45)
,`now_flag` tinyint(3) unsigned
,`created_by` int(10) unsigned
,`creation_date` int(10) unsigned
,`last_updated_by` int(10) unsigned
,`last_update_date` int(10) unsigned
,`function_id` int(10) unsigned
,`variant_name` varchar(45)
,`description` varchar(100)
,`background_flag` tinyint(1)
,`share_flag` tinyint(1)
,`method` varchar(45)
);
-- --------------------------------------------------------

--
-- Structure for view `ct_authobj_lines_v`
--
DROP TABLE IF EXISTS `ct_authobj_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_authobj_lines_v` AS select `l`.`id` AS `id`,`l`.`object_id` AS `object_id`,`l`.`valuelist_id` AS `valuelist_id`,`l`.`default_value` AS `default_value`,`l`.`creation_date` AS `creation_date`,`l`.`created_by` AS `created_by`,`l`.`last_update_date` AS `last_update_date`,`l`.`last_updated_by` AS `last_updated_by`,`h`.`object_name` AS `object_name`,`h`.`description` AS `object_desc`,`vl`.`valuelist_name` AS `auth_item_name`,`vl`.`description` AS `auth_item_desc` from ((`ct_authority_objects` `h` join `ct_authobj_lines` `l`) join `ct_valuelist_header` `vl`) where ((`l`.`object_id` = `h`.`id`) and (`vl`.`id` = `l`.`valuelist_id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_feedback_orders_v`
--
DROP TABLE IF EXISTS `ct_feedback_orders_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_feedback_orders_v` AS select `o`.`id` AS `id`,`o`.`order_type` AS `order_type`,`o`.`status` AS `status`,`o`.`severity` AS `severity`,`o`.`frequency` AS `frequency`,`o`.`category` AS `category`,`o`.`title` AS `title`,`o`.`manager_id` AS `manager_id`,`o`.`leader_id` AS `leader_id`,`o`.`plan_complete_date` AS `plan_complete_date`,`o`.`contact` AS `contact`,`o`.`phone_number` AS `phone_number`,`o`.`mobile_telephone` AS `mobile_telephone`,`o`.`address` AS `address`,`o`.`full_name` AS `full_name`,`o`.`warning_times` AS `warning_times`,`o`.`pcd_change_times` AS `pcd_change_times`,`o`.`creation_date` AS `creation_date`,`o`.`created_by` AS `created_by`,`o`.`last_update_date` AS `last_update_date`,`o`.`last_updated_by` AS `last_updated_by`,`f`.`id` AS `feedback_id` from (`ct_orders` `o` left join `ct_feedbacks` `f` on((`f`.`order_id` = `o`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `ct_function_objects_v`
--
DROP TABLE IF EXISTS `ct_function_objects_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_function_objects_v` AS select `fo`.`id` AS `id`,`fo`.`function_id` AS `function_id`,`fo`.`object_id` AS `object_id`,`fo`.`created_by` AS `created_by`,`fo`.`creation_date` AS `creation_date`,`fo`.`last_update_date` AS `last_update_date`,`fo`.`last_updated_by` AS `last_updated_by`,`ao`.`object_name` AS `object_name`,`ao`.`description` AS `description` from (`ct_function_objects` `fo` join `ct_authority_objects` `ao`) where (`ao`.`id` = `fo`.`object_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_function_obj_lines_v`
--
DROP TABLE IF EXISTS `ct_function_obj_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_function_obj_lines_v` AS select `fol`.`id` AS `id`,`fol`.`object_line_id` AS `object_line_id`,`fol`.`fun_object_id` AS `fun_object_id`,`fol`.`default_value` AS `default_value`,`fol`.`created_by` AS `created_by`,`fol`.`creation_date` AS `creation_date`,`fol`.`last_update_date` AS `last_update_date`,`fol`.`last_updated_by` AS `last_updated_by`,`fo`.`function_id` AS `function_id`,`fo`.`object_id` AS `object_id`,`fo`.`object_name` AS `object_name`,`fo`.`description` AS `object_desc`,`al`.`valuelist_id` AS `valuelist_id`,`al`.`auth_item_name` AS `auth_item_name`,`al`.`auth_item_desc` AS `auth_item_desc` from ((`ct_function_obj_lines` `fol` join `ct_function_objects_v` `fo`) join `ct_authobj_lines_v` `al`) where ((`fol`.`fun_object_id` = `fo`.`id`) and (`fol`.`object_line_id` = `al`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_job_steps_v`
--
DROP TABLE IF EXISTS `ct_job_steps_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_job_steps_v` AS select `s`.`id` AS `id`,`s`.`job_id` AS `job_id`,`s`.`step` AS `step`,`s`.`function_id` AS `function_id`,`s`.`variant_id` AS `variant_id`,`s`.`creation_date` AS `creation_date`,`s`.`created_by` AS `created_by`,`s`.`last_update_date` AS `last_update_date`,`s`.`last_updated_by` AS `last_updated_by`,`j`.`function_name` AS `function_name`,`j`.`description` AS `function_desc`,`j`.`controller` AS `controller`,`j`.`action` AS `action`,`v`.`variant_name` AS `variant_name`,`v`.`description` AS `variant_desc`,`v`.`method` AS `method` from ((`ct_job_steps` `s` join `ct_functions` `j` on((`j`.`id` = `s`.`function_id`))) left join `ct_function_variants` `v` on((`v`.`id` = `s`.`variant_id`)));

-- --------------------------------------------------------

--
-- Structure for view `ct_meeting_files_v`
--
DROP TABLE IF EXISTS `ct_meeting_files_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_meeting_files_v` AS select `f`.`id` AS `id`,`f`.`file_name` AS `file_name`,`f`.`file_type` AS `file_type`,`f`.`file_size` AS `file_size`,`f`.`is_image` AS `is_image`,`f`.`file_path` AS `file_path`,`f`.`full_path` AS `full_path`,`f`.`raw_name` AS `raw_name`,`f`.`orig_name` AS `orig_name`,`f`.`client_name` AS `client_name`,`f`.`file_ext` AS `file_ext`,`f`.`image_width` AS `image_width`,`f`.`image_height` AS `image_height`,`f`.`image_type` AS `image_type`,`f`.`image_size_str` AS `image_size_str`,`f`.`creation_date` AS `creation_date`,`f`.`created_by` AS `created_by`,`f`.`last_update_date` AS `last_update_date`,`f`.`last_updated_by` AS `last_updated_by`,`omf`.`meeting_id` AS `meeting_id`,`omf`.`description` AS `description` from (`ct_files` `f` join `ct_meeting_files` `omf`) where (`omf`.`file_id` = `f`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_messages_v`
--
DROP TABLE IF EXISTS `ct_messages_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_messages_v` AS select `m`.`id` AS `id`,`m`.`class_id` AS `class_id`,`m`.`message_code` AS `message_code`,`m`.`content` AS `content`,`m`.`creation_date` AS `creation_date`,`m`.`created_by` AS `created_by`,`m`.`last_update_date` AS `last_update_date`,`m`.`last_updated_by` AS `last_updated_by`,`mc`.`class_code` AS `class_code`,`mc`.`description` AS `class_desc`,`m`.`help` AS `help` from (`ct_message_classes` `mc` join `ct_messages` `m`) where (`m`.`class_id` = `mc`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_module_lines_v`
--
DROP TABLE IF EXISTS `ct_module_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_module_lines_v` AS select `l`.`id` AS `id`,`l`.`module_id` AS `module_id`,`l`.`function_id` AS `function_id`,`l`.`sort` AS `sort`,`l`.`creation_date` AS `creation_date`,`l`.`created_by` AS `created_by`,`l`.`last_update_date` AS `last_update_date`,`l`.`last_updated_by` AS `last_updated_by`,`h`.`module_name` AS `module_name`,`h`.`description` AS `module_desc`,`fn`.`function_name` AS `function_name`,`fn`.`description` AS `function_desc`,`h`.`sort` AS `module_sort`,`fn`.`controller` AS `controller`,`fn`.`action` AS `action`,`fn`.`display_flag` AS `display_flag`,`fn`.`display_class` AS `function_display_class`,`h`.`display_class` AS `module_display_class`,`fn`.`blank_flag` AS `blank_flag` from ((`ct_module_header` `h` join `ct_module_lines` `l`) join `ct_functions` `fn`) where ((`l`.`module_id` = `h`.`id`) and (`l`.`function_id` = `fn`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_module_line_objects_v`
--
DROP TABLE IF EXISTS `ct_module_line_objects_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_module_line_objects_v` AS select `ml`.`id` AS `id`,`ml`.`module_id` AS `module_id`,`ml`.`function_id` AS `function_id`,`ml`.`sort` AS `sort`,`ml`.`creation_date` AS `creation_date`,`ml`.`created_by` AS `created_by`,`ml`.`last_update_date` AS `last_update_date`,`ml`.`last_updated_by` AS `last_updated_by`,`ml`.`module_name` AS `module_name`,`ml`.`module_desc` AS `module_desc`,`ml`.`function_name` AS `function_name`,`ml`.`function_desc` AS `function_desc`,`ml`.`module_sort` AS `module_sort`,`ml`.`controller` AS `controller`,`ml`.`action` AS `action`,`ml`.`display_flag` AS `display_flag`,`ml`.`function_display_class` AS `function_display_class`,`ml`.`module_display_class` AS `module_display_class`,`fo`.`object_id` AS `object_id`,`fo`.`object_name` AS `object_name`,`fo`.`description` AS `object_desc` from (`ct_function_objects_v` `fo` join `ct_module_lines_v` `ml`) where (`ml`.`function_id` = `fo`.`function_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_notice_rules_v`
--
DROP TABLE IF EXISTS `ct_notice_rules_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_notice_rules_v` AS select `nr`.`id` AS `id`,`nr`.`log_type_id` AS `log_type_id`,`nr`.`description` AS `description`,`nr`.`order_type` AS `order_type`,`nr`.`notice_created_by` AS `notice_created_by`,`nr`.`notice_manager` AS `notice_manager`,`nr`.`notice_leader` AS `notice_leader`,`nr`.`when_new_value` AS `when_new_value`,`nr`.`when_old_value` AS `when_old_value`,`nr`.`default_role_id` AS `default_role_id`,`nr`.`inactive_flag` AS `inactive_flag`,`nr`.`function_id` AS `function_id`,`nr`.`created_by` AS `created_by`,`nr`.`creation_date` AS `creation_date`,`nr`.`last_update_date` AS `last_update_date`,`nr`.`last_updated_by` AS `last_updated_by`,`olt`.`log_type` AS `log_type`,`olt`.`description` AS `log_type_desc`,`olt`.`title` AS `title`,`olt`.`content` AS `content`,`olt`.`need_reason_flag` AS `need_reason_flag`,`olt`.`field_name` AS `field_name`,`olt`.`dll_type` AS `dll_type`,`olt`.`field_valuelist_id` AS `field_valuelist_id`,`nr`.`notice_type` AS `notice_type` from (`ct_notice_rules` `nr` join `ct_order_log_types` `olt`) where (`olt`.`id` = `nr`.`log_type_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_order_addfiles_v`
--
DROP TABLE IF EXISTS `ct_order_addfiles_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_order_addfiles_v` AS select `oa`.`id` AS `id`,`oa`.`order_id` AS `order_id`,`oa`.`created_by` AS `created_by`,`oa`.`creation_date` AS `creation_date`,`oa`.`last_update_date` AS `last_update_date`,`oa`.`last_updated_by` AS `last_updated_by`,`oa`.`file_id` AS `file_id`,`oa`.`description` AS `description`,`f`.`file_name` AS `file_name`,`f`.`full_path` AS `full_path`,`f`.`client_name` AS `client_name` from (`ct_order_addfiles` `oa` join `ct_files` `f`) where (`f`.`id` = `oa`.`file_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_order_category_vl`
--
DROP TABLE IF EXISTS `ct_order_category_vl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_order_category_vl` AS select concat(`pl`.`segment_desc`,' : ',`cl`.`segment_desc`) AS `segment_desc`,`cl`.`segment_value` AS `segment_value`,`cl`.`id` AS `id` from ((`ct_valuelist_header` `c` join `ct_valuelist_lines` `cl`) join `ct_valuelist_lines_v` `pl`) where ((`cl`.`valuelist_id` = `c`.`id`) and (`c`.`valuelist_name` = 'vl_order_category') and (`pl`.`segment_value` = `cl`.`parent_segment_value`) and (`pl`.`inactive_flag` = 0) and (`cl`.`inactive_flag` = 0) and (`pl`.`valuelist_name` = 'vl_order_type'));

-- --------------------------------------------------------

--
-- Structure for view `ct_order_logs_v`
--
DROP TABLE IF EXISTS `ct_order_logs_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_order_logs_v` AS select `ol`.`id` AS `id`,`ol`.`order_id` AS `order_id`,`ol`.`log_type` AS `log_type`,`ol`.`new_value` AS `new_value`,`ol`.`old_value` AS `old_value`,`ol`.`reason` AS `reason`,`ol`.`change_hash` AS `change_hash`,`ol`.`creation_date` AS `creation_date`,`ol`.`created_by` AS `created_by`,`ol`.`last_update_date` AS `last_update_date`,`ol`.`last_updated_by` AS `last_updated_by`,`olt`.`description` AS `description`,`olt`.`title` AS `title`,`olt`.`content` AS `content`,`olt`.`need_reason_flag` AS `need_reason_flag`,`olt`.`field_name` AS `field_name`,`olt`.`dll_type` AS `dll_type`,`olt`.`field_valuelist_id` AS `field_valuelist_id` from (`ct_order_logs` `ol` join `ct_order_log_types` `olt`) where (`olt`.`log_type` = `ol`.`log_type`);

-- --------------------------------------------------------

--
-- Structure for view `ct_order_meetings_v`
--
DROP TABLE IF EXISTS `ct_order_meetings_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_order_meetings_v` AS select `m`.`id` AS `id`,`m`.`title` AS `title`,`m`.`start_date` AS `start_date`,`m`.`end_date` AS `end_date`,`m`.`site` AS `site`,`m`.`anchor` AS `anchor`,`m`.`recorder` AS `recorder`,`m`.`actor` AS `actor`,`m`.`discuss` AS `discuss`,`m`.`cancel_reason` AS `cancel_reason`,`m`.`cancel_remark` AS `cancel_remark`,`m`.`created_by` AS `created_by`,`m`.`creation_date` AS `creation_date`,`m`.`last_update_date` AS `last_update_date`,`m`.`last_updated_by` AS `last_updated_by`,`m`.`inactive_flag` AS `inactive_flag`,`om`.`order_id` AS `order_id`,`o`.`title` AS `order_title` from ((`ct_meetings` `m` join `ct_order_meetings` `om`) join `ct_orders` `o`) where ((`m`.`id` = `om`.`meeting_id`) and (`o`.`id` = `om`.`order_id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_order_status_vl`
--
DROP TABLE IF EXISTS `ct_order_status_vl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_order_status_vl` AS select concat(`ot`.`segment_desc`,' - ',`sl`.`step_desc`) AS `label`,`sl`.`step_value` AS `value`,`sl`.`id` AS `id` from ((`ct_status_lines_v` `sl` join `ct_valuelist_lines_v` `vl`) join `ct_valuelist_lines_v` `ot`) where ((`vl`.`valuelist_name` = 'default_status') and (`vl`.`inactive_flag` = 0) and (`sl`.`status_code` = `vl`.`segment_value`) and (`ot`.`valuelist_name` = 'vl_order_type') and (`ot`.`inactive_flag` = 0) and (`ot`.`segment_value` = `vl`.`parent_segment`)) order by `ot`.`segment_desc`;

-- --------------------------------------------------------

--
-- Structure for view `ct_role_module_lines_v`
--
DROP TABLE IF EXISTS `ct_role_module_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_role_module_lines_v` AS select `l`.`id` AS `role_module_line_id`,`l`.`role_id` AS `role_id`,`ml`.`id` AS `id`,`ml`.`module_id` AS `module_id`,`ml`.`function_id` AS `function_id`,`ml`.`sort` AS `sort`,`ml`.`creation_date` AS `creation_date`,`ml`.`created_by` AS `created_by`,`ml`.`last_update_date` AS `last_update_date`,`ml`.`last_updated_by` AS `last_updated_by`,`ml`.`module_name` AS `module_name`,`ml`.`module_desc` AS `module_desc`,`ml`.`function_name` AS `function_name`,`ml`.`function_desc` AS `function_desc`,`ml`.`module_sort` AS `module_sort`,`ml`.`controller` AS `controller`,`ml`.`action` AS `action`,`ml`.`display_flag` AS `display_flag`,`ml`.`function_display_class` AS `function_display_class`,`ml`.`module_display_class` AS `module_display_class` from (`ct_role_module_lines` `l` join `ct_module_lines_v` `ml`) where (`l`.`module_line_id` = `ml`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_role_profiles_v`
--
DROP TABLE IF EXISTS `ct_role_profiles_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_role_profiles_v` AS select `rp`.`id` AS `id`,`rp`.`role_id` AS `role_id`,`rp`.`object_id` AS `object_id`,`rp`.`creation_date` AS `creation_date`,`rp`.`created_by` AS `created_by`,`rp`.`last_update_date` AS `last_update_date`,`rp`.`last_updated_by` AS `last_updated_by`,`ao`.`object_name` AS `object_name`,`ao`.`description` AS `object_desc` from (`ct_role_profiles` `rp` join `ct_authority_objects` `ao`) where (`rp`.`object_id` = `ao`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_role_profile_lines_v`
--
DROP TABLE IF EXISTS `ct_role_profile_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_role_profile_lines_v` AS select `rp`.`role_id` AS `role_id`,`rpl`.`id` AS `id`,`rpl`.`profile_id` AS `profile_id`,`rpl`.`object_line_id` AS `object_line_id`,`rpl`.`auth_value` AS `auth_value`,`rpl`.`creation_date` AS `creation_date`,`rpl`.`created_by` AS `created_by`,`rpl`.`last_update_date` AS `last_update_date`,`rpl`.`last_updated_by` AS `last_updated_by`,`vl`.`valuelist_name` AS `auth_item_name`,`vl`.`description` AS `auth_item_desc`,`obj`.`object_name` AS `object_name`,`obj`.`description` AS `object_desc`,`rp`.`object_id` AS `object_id` from ((((`ct_role_profile_lines` `rpl` join `ct_authobj_lines` `al`) join `ct_role_profiles` `rp`) join `ct_valuelist_header` `vl`) join `ct_authority_objects` `obj`) where ((`rpl`.`object_line_id` = `al`.`id`) and (`al`.`valuelist_id` = `vl`.`id`) and (`rpl`.`profile_id` = `rp`.`id`) and (`rp`.`object_id` = `obj`.`id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_status_authobjects_v`
--
DROP TABLE IF EXISTS `ct_status_authobjects_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_authobjects_v` AS select `sa`.`id` AS `id`,`sa`.`group_id` AS `group_id`,`sa`.`object_id` AS `object_id`,`sa`.`created_by` AS `created_by`,`sa`.`creation_date` AS `creation_date`,`sa`.`last_update_date` AS `last_update_date`,`sa`.`last_updated_by` AS `last_updated_by`,`ao`.`object_name` AS `object_name`,`ao`.`description` AS `description` from (`ct_status_authobjects` `sa` join `ct_authority_objects` `ao`) where (`sa`.`object_id` = `ao`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_status_authobj_lines_v`
--
DROP TABLE IF EXISTS `ct_status_authobj_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_authobj_lines_v` AS select `sal`.`id` AS `id`,`sal`.`status_obj_id` AS `status_obj_id`,`sal`.`authobj_line_id` AS `authobj_line_id`,`sal`.`auth_value` AS `auth_value`,`sal`.`created_by` AS `created_by`,`sal`.`creation_date` AS `creation_date`,`sal`.`last_update_date` AS `last_update_date`,`sal`.`last_updated_by` AS `last_updated_by`,`al`.`valuelist_id` AS `valuelist_id`,`al`.`auth_item_name` AS `auth_item_name`,`al`.`auth_item_desc` AS `auth_item_desc`,`al`.`object_name` AS `object_name`,`al`.`object_desc` AS `object_desc`,`al`.`default_value` AS `default_value` from (`ct_status_authobj_lines` `sal` join `ct_authobj_lines_v` `al`) where (`sal`.`authobj_line_id` = `al`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_status_conditions_v`
--
DROP TABLE IF EXISTS `ct_status_conditions_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_conditions_v` AS select `sc`.`id` AS `id`,`sc`.`and_or` AS `and_or`,`sc`.`field_name` AS `field_name`,`sc`.`operation` AS `operation`,`sc`.`target_value` AS `target_value`,`sc`.`created_by` AS `created_by`,`sc`.`creation_date` AS `creation_date`,`sc`.`last_update_date` AS `last_update_date`,`sc`.`last_updated_by` AS `last_updated_by`,`sc`.`group_id` AS `group_id`,`scg`.`status_line_id` AS `status_line_id`,`scg`.`group_name` AS `group_name` from (`ct_status_conditions` `sc` join `ct_status_condition_groups` `scg`) where (`sc`.`group_id` = `scg`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_status_functions_v`
--
DROP TABLE IF EXISTS `ct_status_functions_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_functions_v` AS select `sf`.`id` AS `id`,`sf`.`status_line_id` AS `status_line_id`,`sf`.`function_id` AS `function_id`,`sf`.`sort` AS `sort`,`sf`.`label` AS `label`,`sf`.`created_by` AS `created_by`,`sf`.`creation_date` AS `creation_date`,`sf`.`last_update_date` AS `last_update_date`,`sf`.`last_updated_by` AS `last_updated_by`,`f`.`function_name` AS `function_name`,`f`.`description` AS `description`,`f`.`controller` AS `controller`,`f`.`action` AS `action`,`f`.`display_class` AS `display_class`,`f`.`render_flag` AS `render_flag` from (`ct_status_functions` `sf` join `ct_functions` `f`) where (`sf`.`function_id` = `f`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_status_header_v`
--
DROP TABLE IF EXISTS `ct_status_header_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_header_v` AS select `s`.`id` AS `id`,`s`.`status_code` AS `status_code`,`s`.`description` AS `description`,`s`.`sys_order_id` AS `sys_order_id`,`s`.`creation_date` AS `creation_date`,`s`.`created_by` AS `created_by`,`s`.`last_update_date` AS `last_update_date`,`s`.`last_updated_by` AS `last_updated_by`,`o`.`table_name` AS `table_name`,`o`.`order_name` AS `order_name`,`o`.`description` AS `order_desc` from (`ct_status_header` `s` join `ct_system_orders` `o`) where (`s`.`sys_order_id` = `o`.`id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_status_lines_v`
--
DROP TABLE IF EXISTS `ct_status_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_status_lines_v` AS select `l`.`id` AS `id`,`l`.`status_id` AS `status_id`,`l`.`step` AS `step`,`l`.`step_value` AS `step_value`,`l`.`step_desc` AS `step_desc`,`l`.`next_steps` AS `next_steps`,`l`.`callback_step` AS `callback_step`,`l`.`initial_flag` AS `initial_flag`,`l`.`auto_ending_flag` AS `auto_ending_flag`,`l`.`inactive_flag` AS `inactive_flag`,`l`.`creation_date` AS `creation_date`,`l`.`created_by` AS `created_by`,`l`.`last_update_date` AS `last_update_date`,`l`.`last_updated_by` AS `last_updated_by`,`l`.`default_next_step` AS `default_next_step`,`l`.`last_step_flag` AS `last_step_flag`,`h`.`status_code` AS `status_code`,`h`.`description` AS `description`,`o`.`order_name` AS `order_name`,`o`.`table_name` AS `table_name` from ((`ct_status_header` `h` join `ct_status_lines` `l`) join `ct_system_orders` `o`) where ((`h`.`id` = `l`.`status_id`) and (`o`.`id` = `h`.`sys_order_id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_tables_vl`
--
DROP TABLE IF EXISTS `ct_tables_vl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_tables_vl` AS select `information_schema`.`tables`.`TABLE_NAME` AS `value`,`information_schema`.`tables`.`TABLE_COMMENT` AS `label`,`information_schema`.`tables`.`TABLE_NAME` AS `id` from `information_schema`.`tables` where (`information_schema`.`tables`.`TABLE_SCHEMA` = 'cts');

-- --------------------------------------------------------

--
-- Structure for view `ct_user_auth_v`
--
DROP TABLE IF EXISTS `ct_user_auth_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_user_auth_v` AS select `ur`.`role_id` AS `role_id`,`ao`.`object_name` AS `object_name`,`ao`.`description` AS `description`,`ur`.`user_id` AS `user_id`,`rp`.`id` AS `profile_id`,`u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`contact` AS `contact`,`u`.`email` AS `email`,`u`.`phone_number` AS `phone_number`,`u`.`mobile_telephone` AS `mobile_telephone`,`u`.`address` AS `address`,`u`.`full_name` AS `full_name`,`u`.`inactive_flag` AS `inactive_flag`,`u`.`email_flag` AS `email_flag`,`u`.`sms_flag` AS `sms_flag`,`u`.`initial_pass_flag` AS `initial_pass_flag`,`u`.`created_by` AS `created_by`,`u`.`creation_date` AS `creation_date`,`u`.`last_update_date` AS `last_update_date`,`u`.`last_updated_by` AS `last_updated_by` from (((`ct_user_roles` `ur` join `ct_role_profiles` `rp`) join `ct_authority_objects` `ao`) join `ct_users` `u`) where ((`ur`.`role_id` = `rp`.`role_id`) and (`rp`.`object_id` = `ao`.`id`) and (`u`.`id` = `ur`.`user_id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_user_configs_v`
--
DROP TABLE IF EXISTS `ct_user_configs_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_user_configs_v` AS select `uc`.`id` AS `id`,`uc`.`config_id` AS `config_id`,`uc`.`config_value` AS `config_value`,`uc`.`creation_date` AS `creation_date`,`uc`.`created_by` AS `created_by`,`uc`.`last_update_date` AS `last_update_date`,`uc`.`last_updated_by` AS `last_updated_by`,`uc`.`user_id` AS `user_id`,`c`.`config_name` AS `config_name`,`c`.`description` AS `description`,`c`.`config_value` AS `default_value`,`c`.`editable_flag` AS `editable_flag`,`c`.`data_type` AS `data_type` from (`ct_user_configs` `uc` join `ct_configs` `c`) where ((`uc`.`config_id` = `c`.`id`) and (`c`.`user_flag` = 1) and (`c`.`editable_flag` = 1));

-- --------------------------------------------------------

--
-- Structure for view `ct_user_functions_v`
--
DROP TABLE IF EXISTS `ct_user_functions_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_user_functions_v` AS select `mlv`.`role_module_line_id` AS `role_module_line_id`,`mlv`.`controller` AS `controller`,`mlv`.`action` AS `action`,`mlv`.`role_id` AS `role_id`,`mlv`.`id` AS `id`,`mlv`.`module_id` AS `module_id`,`mlv`.`function_id` AS `function_id`,`mlv`.`sort` AS `sort`,`mlv`.`creation_date` AS `creation_date`,`mlv`.`created_by` AS `created_by`,`mlv`.`last_update_date` AS `last_update_date`,`mlv`.`last_updated_by` AS `last_updated_by`,`mlv`.`module_name` AS `module_name`,`mlv`.`module_desc` AS `module_desc`,`mlv`.`function_name` AS `function_name`,`mlv`.`function_desc` AS `function_desc`,`ur`.`user_id` AS `user_id`,`mlv`.`module_sort` AS `module_sort`,`mlv`.`display_flag` AS `display_flag`,`mlv`.`function_display_class` AS `function_display_class`,`mlv`.`module_display_class` AS `module_display_class` from (`ct_role_module_lines_v` `mlv` join `ct_user_roles` `ur`) where (`ur`.`role_id` = `mlv`.`role_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_user_roles_v`
--
DROP TABLE IF EXISTS `ct_user_roles_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_user_roles_v` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`sex` AS `sex`,`u`.`contact` AS `contact`,`u`.`email` AS `email`,`u`.`phone_number` AS `phone_number`,`u`.`mobile_telephone` AS `mobile_telephone`,`u`.`address` AS `address`,`u`.`full_name` AS `full_name`,`u`.`inactive_flag` AS `inactive_flag`,`u`.`email_flag` AS `email_flag`,`u`.`sms_flag` AS `sms_flag`,`u`.`initial_pass_flag` AS `initial_pass_flag`,`u`.`created_by` AS `created_by`,`u`.`creation_date` AS `creation_date`,`u`.`last_update_date` AS `last_update_date`,`u`.`last_updated_by` AS `last_updated_by`,`r`.`role_name` AS `role_name`,`r`.`description` AS `role_desc`,`ur`.`role_id` AS `role_id`,`ur`.`user_id` AS `user_id`,`ur`.`id` AS `ur_id` from ((`ct_user_roles` `ur` join `ct_users` `u`) join `ct_roles` `r`) where ((`u`.`id` = `ur`.`user_id`) and (`r`.`id` = `ur`.`role_id`));

-- --------------------------------------------------------

--
-- Structure for view `ct_valuelist_header_vl`
--
DROP TABLE IF EXISTS `ct_valuelist_header_vl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_valuelist_header_vl` AS select `ct_valuelist_header`.`id` AS `value`,concat(`ct_valuelist_header`.`valuelist_name`,' - ',`ct_valuelist_header`.`description`) AS `label`,`ct_valuelist_header`.`id` AS `id` from `ct_valuelist_header` where (`ct_valuelist_header`.`valuelist_name` like 'vl_%');

-- --------------------------------------------------------

--
-- Structure for view `ct_valuelist_lines_v`
--
DROP TABLE IF EXISTS `ct_valuelist_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_valuelist_lines_v` AS select `h`.`valuelist_name` AS `valuelist_name`,`h`.`description` AS `description`,`h`.`object_flag` AS `object_flag`,`h`.`label_fieldname` AS `label_fieldname`,`h`.`value_fieldname` AS `value_fieldname`,`h`.`source_view` AS `source_view`,`h`.`condition` AS `condition`,`h`.`parent_id` AS `parent_id`,`l`.`id` AS `id`,`l`.`valuelist_id` AS `valuelist_id`,`l`.`segment` AS `segment`,`l`.`segment_value` AS `segment_value`,`l`.`segment_desc` AS `segment_desc`,`l`.`inactive_flag` AS `inactive_flag`,`l`.`sort` AS `sort`,`l`.`parent_segment_value` AS `parent_segment`,`l`.`creation_date` AS `creation_date`,`l`.`created_by` AS `created_by`,`l`.`last_update_date` AS `last_update_date`,`l`.`last_updated_by` AS `last_updated_by` from (`ct_valuelist_header` `h` join `ct_valuelist_lines` `l`) where (`h`.`id` = `l`.`valuelist_id`);

-- --------------------------------------------------------

--
-- Structure for view `ct_valuelist_vl`
--
DROP TABLE IF EXISTS `ct_valuelist_vl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_valuelist_vl` AS select `h`.`valuelist_name` AS `valuelist_name`,`h`.`description` AS `valuelist_desc`,`l`.`segment` AS `segment`,`l`.`segment_value` AS `segment_value`,`l`.`segment_desc` AS `segment_desc`,`l`.`id` AS `id` from (`ct_valuelist_header` `h` join `ct_valuelist_lines` `l`) where ((`l`.`valuelist_id` = `h`.`id`) and (`l`.`inactive_flag` = 0));

-- --------------------------------------------------------

--
-- Structure for view `ct_variant_lines_v`
--
DROP TABLE IF EXISTS `ct_variant_lines_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ct_variant_lines_v` AS select `l`.`id` AS `id`,`l`.`variant_id` AS `variant_id`,`l`.`segment_name` AS `segment_name`,`l`.`segment_value` AS `segment_value`,`l`.`data_type` AS `data_type`,`l`.`now_flag` AS `now_flag`,`l`.`created_by` AS `created_by`,`l`.`creation_date` AS `creation_date`,`l`.`last_updated_by` AS `last_updated_by`,`l`.`last_update_date` AS `last_update_date`,`h`.`function_id` AS `function_id`,`h`.`variant_name` AS `variant_name`,`h`.`description` AS `description`,`h`.`background_flag` AS `background_flag`,`h`.`share_flag` AS `share_flag`,`h`.`method` AS `method` from (`ct_function_variants` `h` join `ct_variant_lines` `l`) where (`h`.`id` = `l`.`variant_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
