-- MySQL dump 10.11
--
-- Host: localhost    Database: hr
-- ------------------------------------------------------
-- Server version	5.0.87-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `sy_base_user_v`
--

DROP TABLE IF EXISTS `sy_base_user_v`;
/*!50001 DROP VIEW IF EXISTS `sy_base_user_v`*/;
/*!50001 CREATE TABLE `sy_base_user_v` (
  `USER_CODE` varchar(40),
  `USER_LOGIN_NAME` varchar(40),
  `USER_NAME` varchar(40),
  `DEPT_CODE` varchar(40),
  `USER_PASSWORD` varchar(80),
  `USER_SORT` decimal(10,0),
  `USER_HOME_PHONE` varchar(40),
  `USER_MOBILE` varchar(40),
  `USER_QQ` varchar(40),
  `USER_EMAIL` varchar(40),
  `USER_WORK_LOC` varchar(40),
  `USER_POST` varchar(40),
  `USER_POST_LEVEL` decimal(10,0),
  `USER_ROOM` varchar(80),
  `USER_WORK_NUM` varchar(40),
  `USER_IDCARD` varchar(18),
  `USER_BIRTHDAY` varchar(20),
  `USER_OFFICE_PHONE` varchar(40),
  `USER_NATION` varchar(20),
  `USER_HEIGHT` decimal(4,0),
  `USER_SEX` decimal(4,0),
  `USER_HOME_LAND` varchar(40),
  `USER_POLITICS` varchar(10),
  `USER_MARRIAGE` varchar(10),
  `USER_EDU_LEVLE` varchar(10),
  `USER_EDU_SCHOOL` varchar(200),
  `USER_EDU_MAJOR` varchar(200),
  `USER_TITLE` varchar(40),
  `USER_TITLE_DATE` varchar(20),
  `USER_WORK_DATE` varchar(20),
  `USER_CMPY_DATE` varchar(20),
  `USER_STATE` decimal(4,0),
  `CMPY_CODE` varchar(40),
  `S_FLAG` decimal(4,0),
  `S_USER` varchar(40),
  `USER_LOGIN_TYPE` decimal(4,0),
  `USER_EXPIRE_DATE` varchar(20),
  `USER_PASSWORD_DATE` varchar(20),
  `S_MTIME` varchar(23),
  `USER_IMG_SRC` varchar(100),
  `PT_ID` varchar(40),
  `USER_FROM` varchar(20),
  `JIANGANG_FLAG` decimal(2,0),
  `USER_SHORT_NAME` varchar(20),
  `USER_EN_NAME` varchar(60),
  `DEPT_NAME` varchar(100),
  `DEPT_LEVEL` decimal(4,0),
  `DEPT_SORT` decimal(4,0),
  `TDEPT_CODE` varchar(40),
  `ODEPT_CODE` varchar(40),
  `CODE_PATH` varchar(4000),
  `DEPT_FLAG` decimal(4,0),
  `DEPT_PT_ID` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_attention`
--

DROP TABLE IF EXISTS `sy_comm_attention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_attention` (
  `ATT_ID` varchar(40) NOT NULL COMMENT '主键ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `PI_ID` varchar(40) default NULL COMMENT '流程实例ID',
  `ATT_TYPE` decimal(4,0) default NULL COMMENT '关注类型 1,用户，2,节点',
  `USER_CODE` varchar(40) default NULL COMMENT '用户编码',
  `REMIND_TYPE` varchar(40) default NULL COMMENT '提醒方式  TODO,EMAIL,MESSAGE',
  `REMIND_CONTENT` varchar(2000) default NULL COMMENT '提醒内容',
  `S_WF_STATE` decimal(4,0) default NULL COMMENT '流程的状态',
  `S_USER` varchar(40) default NULL COMMENT '用户',
  `S_TDEPT` varchar(40) default NULL COMMENT '部门',
  `S_ODEPT` varchar(40) default NULL COMMENT '机构',
  `S_MTIME` varchar(40) default NULL COMMENT '更新时间',
  `TITLE` varchar(800) default NULL COMMENT '标题',
  `NODE_CODE` varchar(40) default NULL COMMENT '节点ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '是否有效  1,是，2,否',
  `USER_NAME` varchar(80) default NULL COMMENT '用户名',
  PRIMARY KEY  (`ATT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_attention`
--

LOCK TABLES `sy_comm_attention` WRITE;
/*!40000 ALTER TABLE `sy_comm_attention` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_attention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_complete_data`
--

DROP TABLE IF EXISTS `sy_comm_complete_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_complete_data` (
  `ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `SRC_SERV_CODE` varchar(40) default NULL COMMENT '主服务ID',
  `SERV_CODE` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `CMLE_DEG` decimal(3,0) default NULL COMMENT '完成度，字段是否完成乘以权重求和',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='完成度数据记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_complete_data`
--

LOCK TABLES `sy_comm_complete_data` WRITE;
/*!40000 ALTER TABLE `sy_comm_complete_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_complete_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_complete_settings`
--

DROP TABLE IF EXISTS `sy_comm_complete_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_complete_settings` (
  `CMLE_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `SRC_SERV_CODE` varchar(40) default NULL COMMENT '主服务code',
  `SERV_CODE` varchar(40) default NULL COMMENT '服务ID',
  `ITEM_CODE` varchar(1000) default NULL COMMENT '字段ID，超长是因为要存等价服务串的原因',
  `ITEM_WEIGHT` decimal(2,0) default NULL COMMENT '字段权重，99代表1对多的关联表外键标识',
  `S_FLAG` decimal(1,0) default NULL COMMENT '启用标志，1：是；2：否',
  PRIMARY KEY  (`CMLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用完成度表（记录某几个服务形成的主服务的字段填写完整度）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_complete_settings`
--

LOCK TABLES `sy_comm_complete_settings` WRITE;
/*!40000 ALTER TABLE `sy_comm_complete_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_complete_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_config`
--

DROP TABLE IF EXISTS `sy_comm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_config` (
  `CONF_ID` varchar(40) NOT NULL COMMENT '配置主键',
  `CONF_NAME` varchar(40) default NULL COMMENT '配置名称',
  `CONF_KEY` varchar(40) default NULL COMMENT '配置key',
  `CONF_VALUE` varchar(2000) default NULL COMMENT '配置值',
  `CONF_FLAG` decimal(4,0) default NULL COMMENT '前端使用？ 1：是；2：否（缺省）',
  `CONF_ORDER` decimal(4,0) default NULL COMMENT '配置排序',
  `CONF_MEMO` varchar(400) default NULL COMMENT '配置说明',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`CONF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_config`
--

LOCK TABLES `sy_comm_config` WRITE;
/*!40000 ALTER TABLE `sy_comm_config` DISABLE KEYS */;
INSERT INTO `sy_comm_config` VALUES ('01ItH41S5bs8QEfrzgxeUc','SQL批量处理单次数量','SY_SQL_BATCH_SIZE','10000','2','0','缺省值为10000，出于性能考虑，执行批量处理的SQL超过此设定后会自动分段执行。','1','1','1','2012-12-24 21:21:07:292'),('04qecft7188FUpAQ0sOLRM','发送邮件提醒的邮件服务器地址','MAIL_MESSAGE_HOST','smtp.exmail.qq.com','1','0','发送邮件提醒的邮件服务器地址','1','1','1','2013-01-17 14:54:31:681'),('06S0UehXZ3BX-tXz67wcW_','IM服务器端口号','SY_HUB_IM_PORT','6000','2','0','调用RTX服务器的端口号','1','1','1','2012-12-24 21:21:05:982'),('0BOKonRwtduVi5TZLAmYkO','无Session可以展示的字典','SY_SERV_DICT_NOSESSION','SY_ORG_CMPY','2','0','多个字典逗号分隔','1','1','1','2013-01-24 09:37:31:992'),('0C-KHG7_h5ZbuChkYc9QJO','是否启用智能索引服务','SY_HUB_SEARCH','true','2','0','是否启用搜索，true启用，false不启用（缺省）','1','1','1','2012-12-24 21:21:06:140'),('0isytKAcR2AV4vLmRlmlrV','系统标签最大个数','SY_TAB_MAX','10','1','0','最外层系统的标签打开个数限制','1','1','1','2013-01-28 16:27:26:304'),('0KwedmAMla2b3BNyylKbqp','是否开启链接登录方式','SY_LOGIN_LINK','2','2','0','是否开启链接登录方式，1，开启，2，未开启','1','1','1','2012-12-24 21:21:06:339'),('0lDdFBRDF49pWhpOhtmcp9','提醒消息实时发送数据的过期时间','SY_COMM_REMIND_TIME_VALID','30','1','0','提醒消息实时发送数据的过期时间，用于去掉很久之前提交的已失去时效的提醒数据','1','1','1','2013-01-17 14:37:53:183'),('0nBQTKx2V3hXtTi8t5ry92','系统管理角色','SY_ROLE_ADMIN','RADMIN','2','0','此角色下的用户缺省可以看到所有数据，不会判断数据权限。','1','1','1','2012-12-24 21:21:07:234'),('0PpeUOgcR6-b3SGyoln4d-','自动发催办的用户','SY_WFE_REMIND_USER','admin','2','0','对超时的节点发催办的时候，发送人的loginName','1','1','1','2013-03-21 12:16:10:176'),('0Qys0SxeN5WHnp8eouvoyE','首页菜单显示位置','SY_HOMEMENU_LOC','2','1','0','1:顶部菜单，2：左侧菜单','1','1','1','2012-04-17 17:02:07:527'),('0Ry8FhI9R6tb1tIVR5kyY1','最大导出数量','SY_EXP_NUM','5000','1','0','导出功能最大一次导出数据量。','1','1','1','2012-05-23 11:21:48:397'),('0shYBRkGtay9JGe8bg0Vs4','文档一体同步地址','DA_MSV_SYNC_URL','http://172.16.0.8:8089/services/MsvSync','2','0',NULL,'1','1','1','2012-12-24 21:21:05:699'),('0Sk6afiLpbTVBPMkN42OVF','web爬虫服务器地址','SY_PLUG_SEARCH_WEBCRAWLER_SERVER','http://172.16.0.110:1976/','2','0','web爬虫服务器地址','1','1','1','2012-12-24 21:21:07:140'),('0ucqGuO1J5h8Mhohg1Eifj','公共角色编码','SY_ORG_ROLE_PUBLIC','RPUB','2','0','系统提供公共角色支持，每个用户缺省都具有此角色，无需单独在角色中添加用户，在授权管理中可以通过对公共角色设置一些所有人都有的功能权限。','1','1','1','2012-12-24 21:21:06:648'),('0urgnF5VRePbzTA_FHqgOB','搜索服务搜索建议服务器地址','SY_PLUG_SEARCH_SUGGEST_SERVER','http://172.16.0.4:8888/searchserver/suggestion','2','0','搜索服务搜索建议服务器地址','1','1','1','2013-04-07 11:11:13:110'),('0xDtf8QqFf48zPX0B09p4B','节日风格覆盖','SY_STYLE_FEST','{\"SS_STYLE_MENU\":\"pageBody__festival\",\"SS_STYLE_BACK\":\"bodyBack__festival\",\"SS_STYLE_BLOCK\":\"conHeaderTitle__festival\"}','1','0','此配置值优先级 > 个人风格(优先级) > 系统默认风格(优先级),在/sy/theme/default/images/style/festival目录下，覆盖相应图片即可','2','1','1','2013-04-03 11:43:01:507'),('0xiRlwveddtbBVx3Wa7im6','home首页的配置','SY_HOME_CONFIG',NULL,'1','0','有此参数则直接进入相应系统的home页 {\"tTitle\":\"系统首页{\"tTitle\":\"系统首页\",\"url\":\"SY_COMM_TEMPL.show.do?pkCode=1v84qOett8QWe8sJvkW9UW\",\"closeFlag\":false,\"menuFlag\":3}','1','1','1','2013-02-26 17:05:35:400'),('0ZQjCCF6F4Nqjq_4ncVDir','用户初始密码','SY_USER_PASSWORD_INIT','123456','2','0','创建用户的缺省密码','1','1','1','2012-12-24 21:21:07:441'),('13xePPjbxdZ9jpeNwapUd-','系统风格定义','SY_STYLE_DEF',NULL,'1','0','系统默认风格定义 {\"SS_STYLE_MENU\":\"pageBody-lightBlue\",\"SS_STYLE_BACK\":\"bodyBack-27\",\"SS_STYLE_BLOCK\":\"conHeaderTitle-blue\"}','1','1','1','2012-09-18 14:52:37:485'),('16363A7c517EPpXrgRpbjH','桌面的搜索图标显示设置','SY_DESK_SEARCHICON','false','1','0','桌面的搜索图标显示设置,默认显示，false则隐藏','2','1','1','2013-06-03 15:43:10:831'),('1AekLH2b9a0EFZHK5KXBdU','是否返回按钮显示在列表卡片','SY_PJ_BACKBTN','true','1','0','设置返回按钮的位置,默认显示在标题条\r\n','2','1','1','2013-05-08 16:21:42:130'),('1aKWjepkxezaqUnyP1eBTq','提醒消息待办发送实现类','MSG_SENDER_IMPL_PREFIX_TODO','com.rh.core.comm.msg.TodoMsgSender','1','0','提醒消息中发送类型选择待办发送实现类','1','1','1','2013-01-17 14:37:53:183'),('1cas0inflcjH4G3T8KbGUg','单点登录服务器地址','SY_SSO_URL','','1','0','单点登录服务器地址','2','1','1','2013-04-23 14:57:09:225'),('1CifOo7gB8dGMmKeChSBq6','Banner图标主页配置','SY_BANNER_ICON','{\"cmpy\":{\"url\":\"SY_COMM_TEMPL.show.do?pkCode=1-QuWdguJ0L8f8tG8YbHMy&model=view\",\"name\":\"公司门户\",\"menuId\":\"\"},\r\n\"dept\":{\"url\":\"SY_COMM_TEMPL.show.do?pkCode=1PL1etY999C8jjte_iE68G&model=view\",\"name\":\"部门门户\",\"menuId\":\"\"},\r\n\"user\":{\"url\":\"SY_COMM_TEMPL.show.do?pkCode=29PnOt0Bl8eauAM9M74cVT&model=view\",\"name\":\"个人门户\",\"menuId\":\"\"}}','1','0','portal:值为系统处理，不需要url和menuId\r\n其它可以选增相应图标显示_NEW_\r\nfdfd','2','1','1','2013-06-25 16:35:47:508'),('1D9tfatVd0WbWV48cRiGZN','日志异步处理队列最大值','SY_ASYNC_LOG_HANDLER_MAX_MSG_COUNT','300','1','0','日志异步处理队列上限，当队列数据量达到该上限时则会进行处理。默认200','1','1','1','2012-03-30 14:21:01:271'),('1Dp92qmhh3QqnJbuun6q0JLa','SY_WF_BTN_RENDER','SY_WF_BTN_RENDER','110','1','0','默认模式为全部平铺，若要使用其他模式，请配置系统配置：SY_WF_BTN_RENDER，0:操作按钮平铺，流程按钮平铺，10：操作按钮平铺，流程按钮下拉组，11：操作按钮平铺，流程按钮单独按钮条，100：操作按钮下拉组，流程按钮平铺，110：操作按钮下拉组，流程按钮下拉组，111：操作按钮下拉组，流程按钮单独按钮条','1','zhbx','2','2013-05-24 09:32:47:413'),('1E5ooAJppbkqqZYpfW3hxr','大字体显示','SY_FONT_BIG','true','1','0','为true，则系统将启用大字体风格','2','1','1','2013-01-28 21:19:36:752'),('1Fan_7zvJa3bWn6reTL6C0','系统URL根路径','SY_HTTP_URL','','2','0','非80端口的要求包含端口号，不需要包含虚路径，此配置用于后台没有用户交互的程序，有用户交互的程序自动从request中获取。','1','1','1','2013-03-14 17:02:44:623'),('1gk-at9ZB18rD24VtMVLNV','待办提醒更新时间','SY_DESK_MSG_INTERVAL','300000','1','0','待办提醒更新时间，单位毫秒，默认值为5分钟即300000ms\r\n','1','1','1','2013-03-14 14:13:57:851'),('1HJaEn6thdKbDsc0LiDMLE','系统运行日志文件路径','SY_LOGS_PATH','','1','0',NULL,'1','1','1','2013-07-16 14:19:56:344'),('1P_1NAAx9aO9FzOrgTSs8c','项目级扩展js文件','SY_PJ_JS',NULL,'1','0','工程级扩展js文件,项目公用js定义文件,如：/sy/test.js','2','1','1','2012-12-13 15:06:04:039'),('1QKq90n-Z5lXu284Wdcmlt','系统登录认证服务类','SY_LOGIN_MODULE_CLASS',NULL,'2','0','缺省不填写为：com.rh.core.auth.login.PasswordLoginModule<br/>ldap为：com.rh.core.auth.login.LdapLoginModule','1','1','1','2012-12-24 21:21:06:403'),('1sntfOwd56ko9qiccv2kvD','图表服务地址','SY_PLUG_REPORT_CHART','SY_COMM_INFO.chart.do','1','0',NULL,'1','1','1','2013-03-19 14:18:51:250'),('1UMgUk9WBegrm7VUvh4jQb','发送邮件提醒的邮箱地址','MAIL_MESSAGE_SENDER','测试<test1@staff.ruaho.com>','1','0','发送邮件提醒的邮箱地址','1','1','1','2013-01-17 15:09:24:622'),('1wBp8JZB5fH8h8E4BZzGxN','搜索服务器拼写检查服务器地址','SY_PLUG_SEARCH_SPELLCHECK_SERVER','http://172.16.0.4:8888/searchserver/spellcheck/','2','0','搜索服务器拼写检查服务器地址','1','1','1','2013-04-07 11:11:06:597'),('1XmQu8OPMh6Db6ZCMonXGJx','工作流节点缺省大小（宽高设置）','SY_WF_NODE_SIZE','100,40','1','0','新增节点时缺省大小尺寸设置，格式为：宽,高 例如缺省大小： 85,30','1','1','1','2013-08-09 17:56:52:602'),('1YjN4Z0H10qo1A7ht0GXUN','发送邮件提醒的邮箱是否要求用户验证','MAIL_MESSAGE_IF_AUTH','true','1','0','发送邮件提醒的邮箱是否要求用户验证','1','1','1','2013-01-17 14:54:31:681'),('1yOA3D3InF3creboyHWu2wi','按钮条是否启用按钮组方式渲染按钮','SY_WF_BTN_GROUP_RENDER','true','1','0','如果启用，那么操作按钮中配置了groupcode的按钮将会以下拉框的方式显示，流程按钮会默认也以下拉框的方式显示','1','1','1',NULL),('1yPQOYPld06XLzWQL-6m3n','组织-用户-缺省头像','SY_ORG_USER_DEFAULT_IMG','07zeB-fqx38ELGprH0ay_M.png','1','0',NULL,'1','1','1','2012-12-29 18:11:51:262'),('1YwgH2BsR8lbVLAuBshRwb','润乾报表服务器地址','SY_PLUG_REPORT_RQ','http://localhost:9090/report/runqianReport.jsp','2','0','报表服务器地址','1','1','1','2013-01-16 21:58:21:542'),('1znOeZYSV9vbSfLguo6-3p','用户密码加密方式','SY_USER_PASSWORD_ENCRYPT','MD5','2','0','密码加密方式，支持DES（缺省）、MD5、SHA','1','1','1','2012-12-24 21:21:07:363'),('25YodUA0ZcwaZQChZfq3Cm','提醒消息发送邮件实现类','MSG_SENDER_IMPL_PREFIX_EMAIL','com.rh.core.comm.msg.MailMsgSender','1','0','提醒消息发送邮件实现类','1','1','1','2013-01-17 17:34:05:812'),('28YAForxFeiV9BzJ-D-DQm','发送邮件系统的邮箱密码','MAIL_MESSAGE_PASSWORD','ruaho1234','1','0','发送邮件系统的邮箱密码','1','1','1','2013-01-17 14:54:31:681'),('2aisp4F0x2-rslBMgNHzqZ','意见显示排序规则','CM_MIND_SORT_TYPE','TYPE','1','0','TIME 按照时间倒排序\r\nTYPE 按照意见类型排序，意见类型下面再按时间倒排','1','1','1','2012-09-04 17:33:00:753'),('2KnXgA1Zt4jUmtHtm1RCvg9','有几种样式可用','SY_STYLE_DEF_COMS','[{\"title\":\"高对比蓝色(默认)\",\"name\":\"rh-slideStyle-allBlue\",\"menu\":\"pageBody-gray\",\"back\":\"bodyBack-gray\",\"block\":\"conHeaderTitle\"},{\"title\":\"浅蓝\",\"name\":\"rh-slideStyle-allLightBlue\",\"menu\":\"pageBody-lightBlue\",\"back\":\"bodyBack-gray\",\"block\":\"conHeaderTitle-blue\"}]','1','0','设置可供选择的几种风格样式','2','1','1','2013-05-16 13:48:27:816'),('2QqPAjHQiBaipZZ5MV4Hnj6','新闻静态文件存储根路径','SY_COMM_NEWS_STATIC_FILE_ROOT','/Users/liwei/Desktop/zhidao/','1','0','用于存储新闻的静态文件，\r\n可以为系统目录: /Users/liwei/Desktop/\r\n可以是共享目录:smb://oa:oa@172.16.0.2/news_files/','1','1','1','2013-05-10 13:58:20:420'),('2qRgngEHR06HBgPhh4S7jv','用户登录名自动转小写','SY_LOGIN_NAME_LOWERCASE','true','2','0','是否自动将用户登录名转为小写，缺省为true，以小写的英文名作为登录名。','1','1','1','2012-12-24 21:21:06:561'),('2tZSUTeGh14pEFkfJNPNV_','文件根路径 ','SY_COMM_FILE_ROOT_PATH','','2','0','不填写为临时路径，支持网络路径，例如 smb://oa:oa@172.16.0.2/oa_files/','1','1','1','2013-04-07 11:02:01:704'),('2uS96S2dV3yFvy1DZDFmz_','头部banner的配置','SY_BANNER_CONFIG','{\"banner\":\"/sy/comm/page/img/head_logo.gif\",\"bannerBack\":\"/sy/comm/page/img/head_bg.gif\"}\r\n','1','0','banner:banner的含login的图片\r\nbannerBack:整个banner的背景图片','1','1','1','2012-12-11 17:26:51:407'),('2uUJK_dol2GrsITvbTIuvz','项目级扩展css文件','SY_PJ_CSS','/sy/theme/default/projectResetSystem_demo.css','1','0','工程级公用css文件定义，用于覆盖系统的css样式，如：/sy/test.css','2','1','1','2013-05-02 11:02:11:163'),('2UYvEPNGRfqUxbashVsXl6','一个人是否直接送交','SY_WF_DIRECT_SEND','true','1','0','添加全局系统配置，实现当角色下只有一人时，是否直送可根据需要配置。\r\ntrue  直接送交\r\nfalse  出机构树，让用户选择这个人，确定之后再发送','1','1','1','2012-09-19 18:09:59:886'),('2wHiWMNc98wqX08oXn1r4S','批量保存日志时间间隔','SY_COMM_BATCH_SAVE_LOG_INTERVAL','300','1','0','单位为:秒','1','1','1','2013-03-29 23:33:18:962'),('2WVi2q9cNdVUJikQ-muH-w','xdoc服务地址','SY_PLUG_REPORT_XDOC','http://localhost:8080/xdoc','1','0',NULL,'1','1','1','2013-01-19 10:26:02:984'),('2YHYjc5St85EgvKdWIg4B3','IM服务器IP地址','SY_HUB_IM_SERVIP','127.0.0.1','2','0','集成RTX服务器的IP地址，如果为本机，则为127.0.0.1','1','1','1','2012-12-24 21:21:06:068'),('2YmmP32xV5qXtjaZv5ahvw','刷新图标','SY_REFRESH_ICON_SHOW','false','1','0','用于判断是否显示刷新按钮','2','1','1','2013-06-24 13:30:07:209'),('2Ys1x2Xatf9ExlnmhC1ayB','帆软报表服务器地址','SY_PLUG_REPORT_FR','http://localhost:9090/report/ReportServer','1','0',NULL,'1','1','1','2013-01-16 21:39:26:482'),('2_z_dlsS5bzX8_TUNZ7OWO','批量保存日志最大数据量','SY_COMM_BATCH_SAVE_LOG_MAX_SIZE','500','1','0','当日志数据缓存到${SY_COMM_BATCH_SAVE_LOG_MAX_SIZE}条时，进行批量保存','1','1','1','2013-03-29 23:34:07:261'),('3-7v-Dlo502bTBaILCJMGH','手机链接显示','SY_MB_LINK','true','1','0','手机链接显示','1','1','1','2013-01-11 10:41:25:060'),('38mddJiYh40alFv1-Q_hrb','流程下一步','SY_WF_NEXT_STEP',NULL,'1','0','saveAndSend   进入卡片页面，不显示工作流送交按钮，只有当点击了 保存并送交(cmSaveAndSend) 之后，才显示下一步的按钮','1','1','1','2012-09-04 17:34:00:564'),('39MMphMVp7dEpItz6G3KdP','日志异步处理调度间隔','SY_ASYNC_LOG_HANDLER_INTERVAL','120000','1','0','日志异步处理调度间隔,单位为秒。默认为60000ms(1分钟)','1','1','1','2012-05-25 12:57:15:418'),('39tdSgdCpcErrEJCyKrBtx','LOGO图标','SY_PORTAL_ICON','/sy/comm/page/img/logo_ruaho.gif','1','0','系统使用的LOGO图标 例如：/sy/comm/page/img/logo_ruaho.gif','1','1','1','2013-04-04 12:05:11:787'),('3AnSCn4Fx9y8QK4sxdxQkw','发送邮件提醒的邮箱用户名','MAIL_MESSAGE_USER_NAME','test1@staff.ruaho.com','1','0','发送邮件提醒的邮箱用户名','1','1','1','2013-01-17 14:54:31:681'),('3awrggXsbR0kauDbGetOZgd','搜索文件服务器redirect地址','SY_PLUG_SEARCH_FILE_REDIRECT_SERVER',NULL,'1','0','搜索文件服务器客户端redirect地址,如:http://staff.zotn.com:1897/file/\r\n如果于SY_PLUG_SEARCH_FILE_SERVER相同,该值则不填写.','1','1','1','2013-05-30 18:24:24:668'),('3CUtqAWHJc0E1NHXNmXY2m','超级公司编码','SY_ORG_SUPER_CMPY','1','2','0','超级公司是系统可以统筹管理其他公司的公司，缺省超级公司编码为：1','1','1','1','2012-12-24 21:21:06:694'),('3Ds743yhB6rqrxuI5lkcbh','IM集成即时消息类名','SY_HUB_IM','com.rh.core.plug.im.ImRtx','1','0','缺省为空，不集成即时通讯工具，如果集成RTX，配置值为：com.rh.core.hub.im.ImRtx','1','1','1','2013-07-01 15:27:37:934'),('3E9C1sUEt4QU7oVwQ_HekY','用户菜单文件缓存路径规则设置','SY_COMM_MENU_PATH_LEVEL','2','2','0','为了将大量的菜单缓存文件分散目录存放，启用此配置，按照设定的层级长度对用户编码截串生成对应的目录，支持多层目录设定，例如：【2,2】表示建立两层目录，每层两个字符作为目录名称。','1','1','1','2013-04-04 15:39:43:849'),('3httR4QPp6aVASs2ydNcBP','提醒数据的查询时间范围','SY_COMM_REMIND_TIME_RANGE','5','1','0','按时间提醒数据的查询时间范围，即与当前时间相差几分钟的数据能被查询出来，准备发送','1','1','1','2013-01-17 14:43:23:943'),('3I1KFNeDxaQUSth_DWs6nY','Banner右侧搜索','SY_BANNER_SEARCH','false','1','0','是否显示banner区的全文搜索框_NEW_','1','1','1','2013-04-08 10:52:19:245'),('3I1SRLmwl3AXBWdtC0NFIn','上班时间设定','SY_COMM_WORK_TIME','08:30:00,11:30:00,13:00:00,18:00:00','1','0','分别为上午上班时间，下班时间\r\n      下午上班时间，下班时间','1','1','1','2012-12-25 11:17:41:738'),('3KKHEGCc54fruHqmKsWRKZ','搜索服务器地址','SY_PLUG_SEARCH_SERVER','http://172.16.0.4:8888/searchserver/rhsearch','2','0','搜索服务器地址','1','1','1','2013-04-07 11:11:00:190'),('3Kno22Br5dgHrS-9Cqcz03','系统开发用户','SY_DEV_USERS','admin,superadmin','1','0','系统开发用户，可双击卡片字段的配置。预留以后开发用户的一些功能时的开关','1','1','1','2012-07-05 10:20:56:597'),('3N-2dIQfx1cqeiIhe6B3FS','即时通讯服务器地址','SY_PLUG_WEBIM_SERVER','http://172.16.0.4:7070/http-bind/','1','0',NULL,'1','1','1','2013-04-07 10:39:20:408'),('3n3FDsahV749nCaueKwger','即时通讯启用标志','SY_WBIM_FLAG','false','1','0','即时通讯启用标志 true为启用，默认不启用','1','1','1','2013-07-02 18:18:23:683'),('3n3FDsahV749nCaueKwgzz','邮件启用标志','SY_EMAIL_ADDR','mailto:#USER_CODE#@staff.zotn.com','1','0','邮件启用标志其中#USER_CODE#是要发送邮件人的名称，比如<hedongyang@staff.zotn.com>，此处会在程序中替换成相应的用户名,没有值则不显示','1','1','1','2013-06-27 13:18:03:899'),('3nOnJgfc5atUb5eY6auv4O','搜索服务文件服务器','SY_PLUG_SEARCH_FILE_SERVER','http://172.16.0.4:8888/searchserver/file/','2','0','搜索服务-文件服务器地址','1','1','1','2013-04-07 11:10:45:204'),('3SlErOo7x20Vr6utjz6U_h','系统登录认证服务名','SY_LOGIN_MODULE_NAME',NULL,'2','0','名称为空，使用缺省的用户名密码认证服务；<br/>ldap，使用ldap认证<br/>custom，使用自定义认证服务','1','1','1','2012-12-24 21:21:06:453'),('3ur7EmPad0oU56K5oFmRpJ','tab颜色','SY_TAB_COLOR','{\"1\":{\"li\":\"grayLi\",\"a\":\"grayA\"}}','1','0','一共5种，可选取其中几种作为指定的颜色：{\"1\":{\"li\":\"qingLi\",\"a\":\"qingA\"},\"2\":{\"li\":\"yellowLi\",\"a\":\"yellowA\"},\r\n                     \"3\":{\"li\":\"grayLi\",\"a\":\"grayA\"},\"4\":{\"li\":\"blueLi\",\"a\":\"blueA\"},\"5\":{\"li\":\"redLi\",\"a\":\"redA\"},\"6\":{\"li\":\"lightLi\",\"a\":\"lightA\"},};','2','1','1','2013-04-03 11:49:58:264'),('3vrbVclXl8nH2Q15AgXdNw','允许跨域域名列表','SY_CROSS_DOMAIN_LIST','','2','0','允许跨域访问网站域名列表，多个逗号，不设置则不允许跨域访问，设置为*则允许所有网站跨域访问，设置域名部分匹配即可，例如：localhost,172.16,ruaho.com','1','1','1','2013-12-14 15:16:22:583'),('3xdhYCzsZ6pWY84VAlrbw_','page浏览器标题','SY_PAGE_TITLE','软虹-云智能信息处理平台','1','0','浏览器标题','2','1','1','2013-06-27 10:31:04:868'),('3XhBtM1b5dyWdB70XaVAf8','返回上一节点的字段设定','SY_WF_BACK_NODE_NAME',NULL,'1','0','NODE_NAME 节点名称\r\nNODE_MEMO 节点描述\r\n如果不填，按钮就是   返回张三 ','1','1','1','2012-09-04 17:33:00:753'),('3XxW7R2Ep9ha_yMpTL830o','搜索服务分词服务器地址','SY_PLUG_SEARCH_SEG_SERVER','http://172.16.0.4:8888/searchserver/seg','2','0','搜索服务分词服务器地址','1','1','1','2013-04-07 11:10:51:860');
/*!40000 ALTER TABLE `sy_comm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_data_view`
--

DROP TABLE IF EXISTS `sy_comm_data_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_data_view` (
  `DV_ID` varchar(40) NOT NULL COMMENT 'ID',
  `DV_NAME` varchar(200) default NULL COMMENT '名称',
  `DS_TYPE` varchar(20) default NULL COMMENT '数据源类型',
  `DS_CONF` varchar(4000) default NULL COMMENT '数据源配置',
  `VIEW_TYPE` varchar(20) default NULL COMMENT '展示类型',
  `DV_CONFIG` varchar(2000) default NULL COMMENT '数据展示配置',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  `DS_COUNT` decimal(4,0) default NULL COMMENT '最大记录数',
  `DS_CMPY` varchar(40) default NULL COMMENT '数据源公司字段',
  `SHOW_TABLE` decimal(4,0) default NULL COMMENT '是否展示表格(1：展示，2：不展示)',
  `THEME` varchar(20) default NULL COMMENT '风格',
  PRIMARY KEY  (`DV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 数据展现';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_data_view`
--

LOCK TABLES `sy_comm_data_view` WRITE;
/*!40000 ALTER TABLE `sy_comm_data_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_data_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_data_view_item`
--

DROP TABLE IF EXISTS `sy_comm_data_view_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_data_view_item` (
  `ITEM_ID` varchar(40) NOT NULL COMMENT '数据项ID',
  `DV_ID` varchar(40) default NULL COMMENT '展现ID',
  `ITEM_CODE` varchar(80) default NULL COMMENT '编号',
  `ITEM_NAME` varchar(200) default NULL COMMENT '名称',
  `ITEM_ALIGN` varchar(20) default NULL COMMENT '对齐方式',
  `ITEM_SORT` decimal(10,0) default NULL COMMENT '排序',
  `ITEM_TYPE` varchar(20) default NULL COMMENT '数据项类型',
  `ITEM_CONFIG` varchar(2000) default NULL COMMENT '数据展示项配置',
  `ITEM_VIEW_TYPE` varchar(20) default NULL COMMENT '数据展示类型',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `DICT_ID` varchar(40) default NULL COMMENT '对应字典编码',
  `ITEM_URL` varchar(200) default NULL COMMENT '对应URL，支持穿透查询',
  `SHOW_SUM` decimal(4,0) default NULL COMMENT '是否显示合计',
  `TABLE_SHOW` decimal(4,0) default NULL COMMENT '表格显示(1：是，2：否)',
  PRIMARY KEY  (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 数据展现数据项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_data_view_item`
--

LOCK TABLES `sy_comm_data_view_item` WRITE;
/*!40000 ALTER TABLE `sy_comm_data_view_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_data_view_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_desk`
--

DROP TABLE IF EXISTS `sy_comm_desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_desk` (
  `DS_ID` varchar(40) NOT NULL COMMENT '图标主键',
  `DS_NAME` varchar(100) default NULL COMMENT '图标名称',
  `MENU_ID` varchar(40) default NULL COMMENT '关联菜单编码',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2否',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2否',
  `DS_ICON` varchar(40) default NULL,
  `DS_MENU_FLAG` varchar(4) default NULL,
  `DS_NORMAL_FLAG` varchar(4) default NULL,
  `DS_ALERT_FLAG` varchar(4) default NULL,
  `DS_COUNT_SERV` varchar(60) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `DS_FOLDER_FLAG` varchar(4) default NULL COMMENT '文件夹图标',
  `DS_FOLDER_MINBLOCK` varchar(800) default NULL COMMENT '文件夹包含的图标',
  `DS_FOLDER_MINBLOCK_NAME` varchar(800) default NULL COMMENT '文件夹包含的图标名称',
  PRIMARY KEY  (`DS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作台管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_desk`
--

LOCK TABLES `sy_comm_desk` WRITE;
/*!40000 ALTER TABLE `sy_comm_desk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_entity`
--

DROP TABLE IF EXISTS `sy_comm_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_entity` (
  `ENTITY_ID` varchar(40) NOT NULL COMMENT '数据ID',
  `TITLE` varchar(1000) default NULL COMMENT '标题',
  `S_EMERGENCY` decimal(4,0) default NULL COMMENT '缓急',
  `MEMO` varchar(4000) default NULL COMMENT '备注',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `S_USER` varchar(40) default NULL COMMENT '所属用户ID。如起草人',
  `S_DEPT` varchar(40) default NULL COMMENT '所属处室',
  `S_TDEPT` varchar(40) default NULL COMMENT '所属部门',
  `S_ODEPT` varchar(40) default NULL COMMENT '所属机构',
  `S_CMPY` varchar(40) default NULL COMMENT '所属公司',
  `S_ATIME` varchar(23) default NULL COMMENT '增加时间',
  `S_MTIME` varchar(23) default NULL COMMENT '修改时间',
  `S_WF_NODE` varchar(2000) default NULL COMMENT '办理中的节点名称。多个名称之间使用逗号分隔',
  `S_WF_USER` varchar(2000) default NULL COMMENT '办理中的用户ID。多个ID之间使用逗号风格',
  `S_WF_STATE` decimal(4,0) default NULL COMMENT '流程状态。',
  `S_WF_INST` varchar(40) default NULL COMMENT '所属流程实例',
  `SERV_NAME` varchar(40) default NULL COMMENT '功能名称',
  `ENTITY_CODE` varchar(200) default NULL COMMENT '编号',
  `SERV_SRC_ID` varchar(40) default NULL COMMENT '引用自',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志',
  `S_WF_USER_STATE` varchar(4000) default NULL COMMENT '流程用户状态',
  `DEL_USER` varchar(40) default NULL COMMENT '删除用户',
  `DEL_ODEPT` varchar(40) default NULL COMMENT '删除机构',
  `S_HAS_PS_MIND` varchar(1000) default NULL COMMENT '指定公司有批示意见',
  `QUERY_ODEPT` varchar(40) default NULL,
  PRIMARY KEY  (`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='完整数据实体表。所有审批单的数据在此表都会有记录。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_entity`
--

LOCK TABLES `sy_comm_entity` WRITE;
/*!40000 ALTER TABLE `sy_comm_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_comm_entity_send_dtl_recv`
--

DROP TABLE IF EXISTS `sy_comm_entity_send_dtl_recv`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_send_dtl_recv`*/;
/*!50001 CREATE TABLE `sy_comm_entity_send_dtl_recv` (
  `ENTITY_ID` varchar(40),
  `TITLE` varchar(1000),
  `S_EMERGENCY` decimal(4,0),
  `MEMO` varchar(4000),
  `SERV_ID` varchar(40),
  `DATA_ID` varchar(40),
  `S_USER` varchar(40),
  `S_DEPT` varchar(40),
  `S_TDEPT` varchar(40),
  `S_ODEPT` varchar(40),
  `S_CMPY` varchar(40),
  `S_ATIME` varchar(23),
  `S_MTIME` varchar(23),
  `S_WF_NODE` varchar(2000),
  `S_WF_USER` varchar(2000),
  `S_WF_STATE` decimal(4,0),
  `S_WF_INST` varchar(40),
  `SERV_NAME` varchar(40),
  `ENTITY_CODE` varchar(200),
  `SERV_SRC_ID` varchar(40),
  `S_WF_USER_STATE` varchar(4000),
  `S_HAS_PS_MIND` varchar(1000),
  `QUERY_ODEPT` varchar(40),
  `SEND_ID` varchar(40),
  `RECV_ODEPT` varchar(40),
  `RECV_USER` varchar(40),
  `RECV_UNAME` varchar(100),
  `RECV_TIME` varchar(20),
  `RECV_TYPE` varchar(40),
  `RETN_FLAG` decimal(4,0),
  `SEND_ODEPT` varchar(40),
  `SEND_USER` varchar(40),
  `SEND_UNAME` varchar(100),
  `SEND_TIME` varchar(23),
  `SEND_STATUS` decimal(4,0)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `sy_comm_entity_send_dtl_v`
--

DROP TABLE IF EXISTS `sy_comm_entity_send_dtl_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_send_dtl_v`*/;
/*!50001 CREATE TABLE `sy_comm_entity_send_dtl_v` (
  `ENTITY_ID` varchar(40),
  `TITLE` varchar(1000),
  `S_EMERGENCY` decimal(4,0),
  `MEMO` varchar(4000),
  `SERV_ID` varchar(40),
  `DATA_ID` varchar(40),
  `S_USER` varchar(40),
  `S_DEPT` varchar(40),
  `S_TDEPT` varchar(40),
  `S_ODEPT` varchar(40),
  `S_CMPY` varchar(40),
  `S_ATIME` varchar(23),
  `S_MTIME` varchar(23),
  `S_WF_NODE` varchar(2000),
  `S_WF_USER` varchar(2000),
  `S_WF_STATE` decimal(4,0),
  `S_WF_INST` varchar(40),
  `SERV_NAME` varchar(40),
  `ENTITY_CODE` varchar(200),
  `SERV_SRC_ID` varchar(40),
  `S_WF_USER_STATE` varchar(4000),
  `S_HAS_PS_MIND` varchar(1000),
  `QUERY_ODEPT` varchar(40),
  `RECV_ODEPT` varchar(40),
  `RECV_USER` varchar(40),
  `RECV_TIME` varchar(20),
  `RECV_TYPE` varchar(40),
  `RETN_FLAG` decimal(4,0),
  `SEND_ODEPT` varchar(40),
  `SEND_USER` varchar(40),
  `SEND_TIME` varchar(23),
  `SEND_STATUS` decimal(4,0)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_entity_tag`
--

DROP TABLE IF EXISTS `sy_comm_entity_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_entity_tag` (
  `ET_ID` varchar(40) NOT NULL COMMENT '关联数据ID',
  `TAG_ID` varchar(40) default NULL COMMENT '标签ID',
  `DATA_ID` varchar(40) default NULL COMMENT '关联审批ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `S_USER` varchar(40) default NULL COMMENT '创建用户',
  `S_ATIME` varchar(23) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`ET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批单与标签关联表，保存审批单关联的标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_entity_tag`
--

LOCK TABLES `sy_comm_entity_tag` WRITE;
/*!40000 ALTER TABLE `sy_comm_entity_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_entity_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_comm_entity_tag_v`
--

DROP TABLE IF EXISTS `sy_comm_entity_tag_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_tag_v`*/;
/*!50001 CREATE TABLE `sy_comm_entity_tag_v` (
  `et_id` varchar(40),
  `tag_id` varchar(40),
  `data_id` varchar(40),
  `serv_id` varchar(40),
  `s_user` varchar(40),
  `s_atime` varchar(23),
  `S_emergency` decimal(4,0),
  `s_mtime` varchar(23),
  `s_wf_node` varchar(2000),
  `s_wf_user` varchar(2000),
  `title` varchar(1000),
  `s_wf_state` decimal(4,0),
  `memo` varchar(4000),
  `serv_name` varchar(40),
  `S_FLAG` decimal(4,0),
  `ENTITY_CODE` varchar(200),
  `S_WF_USER_STATE` varchar(4000),
  `QUERY_ODEPT` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_exprssion`
--

DROP TABLE IF EXISTS `sy_comm_exprssion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_exprssion` (
  `EXP_ID` varchar(40) NOT NULL COMMENT '表达式主键，自增',
  `EXP_NAME` varchar(80) default NULL COMMENT '表达式名称',
  `EXP_TYPE` decimal(4,0) default NULL COMMENT '表达式类型，1：正则表达式；2：数据格式表达',
  `EXP_CONTENT` varchar(400) default NULL COMMENT '表达式内容',
  `EXP_SORT` decimal(4,0) default NULL COMMENT '排序',
  `EXP_MEMO` varchar(400) default NULL COMMENT '表达式说明',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`EXP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表达式，正则表达式或者自定义表达式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_exprssion`
--

LOCK TABLES `sy_comm_exprssion` WRITE;
/*!40000 ALTER TABLE `sy_comm_exprssion` DISABLE KEYS */;
INSERT INTO `sy_comm_exprssion` VALUES ('02Gbq6sNh4NHGMnyD0vj2L','周正则表达式格式','1','^d{4}-第d{1,2}周$','60',NULL,'2012-04-23 22:18:50:880'),('0EnZ9zfi52WpDs2D1WtB7K','日期正则表达式格式：年月','1','^d{4}-d{2}$','40',NULL,'2012-04-23 22:18:18:653'),('0I8KVuBxJ3WqUjYNDxNNbA','数字格式处理（常用在文件大小处理）','2','Format.formatSize(subNumer, fixedNumber)','30','例子：Format.formatSize(1048576, 2)     431616 (byte) 显示为0.41 (MB)','2012-04-23 22:07:51:509'),('0mm9qZbGFbHW3xQmUF7Jz6','数字科学计数法分隔','2','Format.formatNum()','20','例子：将1230000.00转为1,230,000.00格式','2012-04-23 21:45:18:065'),('0uznjDbbZ9xrm7ySN7j9bN','日期正则表达式格式','1','^d{4}-d{2}-d{2}$','10',NULL,'2012-04-23 22:18:01:059'),('1JBI5UE9B6wGVBZvSyeGeX','时间正则表达式格式','1','^d{4}-d{2}-d{2} d{2}:d{2}:d{2}$','50',NULL,'2012-04-23 22:18:40:945'),('1WFN7Azzd3RaYjtjhlHv3a','日期正则表达式格式：年','1','^d{4}$','30',NULL,'2012-04-23 22:18:10:020'),('2iUUoquKx6g9awFOfi6eYL','列表字符串截串显示','2','Format.limit(n)','10','n为要显示的字符串的最大长度，超出部分会被截掉，以...代替。Format.limit(40)表示最多显示40个字符。','2012-04-23 17:36:37:506'),('2xO_Uy4x977HrMuiPFryJv','季度正则表达式格式','1','^d{4}-第[1-4]季度$','70',NULL,'2012-04-23 22:18:58:535'),('3cPekhvUJbuWARxzzpOX7y','邮件正则表达式格式','1','^w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*$','1',NULL,'2013-01-08 16:37:15:093'),('3ZqWErdIV27a_mIMWvx9pV','列表字符串截串显示','2','Format.substr(m,n)','15','m为要显示字符串的起始位置。\r\nn为要显示的字符串的最大长度。','2012-12-14 23:01:48:484');
/*!40000 ALTER TABLE `sy_comm_exprssion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_favorites`
--

DROP TABLE IF EXISTS `sy_comm_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_favorites` (
  `FAVORITE_ID` varchar(40) NOT NULL COMMENT '主键',
  `USER_CODE` varchar(40) default NULL COMMENT '用户编码',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `SERV_GROUP` varchar(100) default NULL COMMENT '服务分组',
  `DATA_ID` varchar(40) default NULL COMMENT '数据项ID',
  `DATA_DIS_NAME` varchar(200) default NULL COMMENT '数据项显示名称',
  `DATA_OWNER` varchar(40) default NULL COMMENT '数据所属人',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_ATIME` varchar(23) default NULL COMMENT '创建时间',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  `TAGS` varchar(2000) default NULL COMMENT '标签',
  PRIMARY KEY  (`FAVORITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_favorites`
--

LOCK TABLES `sy_comm_favorites` WRITE;
/*!40000 ALTER TABLE `sy_comm_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_favorites_mark`
--

DROP TABLE IF EXISTS `sy_comm_favorites_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_favorites_mark` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `FAVORITE_ID` varchar(40) default NULL COMMENT '收藏夹ID',
  `MARK_ID` varchar(40) default NULL COMMENT '标签ID',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_favorites_mark`
--

LOCK TABLES `sy_comm_favorites_mark` WRITE;
/*!40000 ALTER TABLE `sy_comm_favorites_mark` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_favorites_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_file`
--

DROP TABLE IF EXISTS `sy_comm_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_file` (
  `FILE_ID` varchar(40) NOT NULL COMMENT '文件ID',
  `FILE_NAME` varchar(400) default NULL COMMENT '文件名称',
  `DIS_NAME` varchar(400) default NULL COMMENT '显示名称',
  `FILE_PATH` varchar(400) default NULL COMMENT '文件路径',
  `FILE_SIZE` decimal(12,0) default NULL COMMENT '文件大小',
  `FILE_MTYPE` varchar(100) default NULL COMMENT '文件MIME类型',
  `FILE_MEMO` varchar(400) default NULL COMMENT '文件说明',
  `FILE_SORT` decimal(4,0) default NULL COMMENT '文件排序',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT 'DATA_ID',
  `DATA_TYPE` decimal(4,0) default NULL COMMENT '类型?1:卡片,2:字段',
  `FILE_CAT` varchar(40) default NULL COMMENT '分类',
  `ITEM_CODE` varchar(40) default NULL COMMENT '类型字段',
  `WF_NI_ID` varchar(40) default NULL COMMENT '工作流节点实例ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志? 1：是；2否',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_UNAME` varchar(100) default NULL COMMENT '用户名称',
  `S_DEPT` varchar(40) default NULL COMMENT '部门编码',
  `S_DNAME` varchar(100) default NULL COMMENT '部门名称',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `FILE_HIST_COUNT` decimal(4,0) default NULL COMMENT '历史文件数量',
  `FILE_CHECKSUM` varchar(40) default NULL COMMENT '校验码',
  `ORIG_FILE_ID` varchar(40) default NULL COMMENT '原始物理文件ID。此字段有值的数据，没有物理文件，物理文件为此ID对应数据的物理文件。',
  `FILE_HEADER` varchar(2000) default NULL,
  PRIMARY KEY  (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_file`
--

LOCK TABLES `sy_comm_file` WRITE;
/*!40000 ALTER TABLE `sy_comm_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_file_his`
--

DROP TABLE IF EXISTS `sy_comm_file_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_file_his` (
  `HISTFILE_ID` varchar(40) NOT NULL COMMENT '历史文件主键',
  `FILE_ID` varchar(40) default NULL COMMENT '所属文件ID',
  `HISTFILE_PATH` varchar(400) default NULL COMMENT '文件存储路径',
  `HISTFILE_SIZE` decimal(12,0) default NULL COMMENT '文件大小',
  `HISTFILE_MTYPE` varchar(100) default NULL COMMENT '文件mimetype',
  `HISTFILE_MEMO` varchar(400) default NULL COMMENT '文件说明',
  `HISTFILE_VERSION` decimal(4,0) default NULL COMMENT '文件版本号',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识， 1：正常， 2：已删除',
  `S_USER` varchar(40) default NULL COMMENT '操作用户',
  `S_UNAME` varchar(100) default NULL COMMENT '操作用户名称',
  `S_DEPT` varchar(40) default NULL COMMENT '操作用户部门',
  `S_DNAME` varchar(100) default NULL COMMENT '操作用户部门名称',
  `S_CMPY` varchar(40) default NULL COMMENT '操作用户公司',
  `S_MTIME` varchar(23) default NULL COMMENT '操作时间',
  `FILE_CHECKSUM` varchar(40) default NULL COMMENT '校验码',
  PRIMARY KEY  (`HISTFILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_file_his`
--

LOCK TABLES `sy_comm_file_his` WRITE;
/*!40000 ALTER TABLE `sy_comm_file_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_file_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_comm_file_his_v`
--

DROP TABLE IF EXISTS `sy_comm_file_his_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_file_his_v`*/;
/*!50001 CREATE TABLE `sy_comm_file_his_v` (
  `FILE_NAME` varchar(400),
  `HISTFILE_ID` varchar(40),
  `FILE_ID` varchar(40),
  `HISTFILE_PATH` varchar(400),
  `HISTFILE_SIZE` decimal(12,0),
  `HISTFILE_MTYPE` varchar(100),
  `HISTFILE_MEMO` varchar(400),
  `HISTFILE_VERSION` decimal(4,0),
  `S_FLAG` decimal(4,0),
  `S_USER` varchar(40),
  `S_UNAME` varchar(100),
  `S_DEPT` varchar(40),
  `S_DNAME` varchar(100),
  `S_CMPY` varchar(40),
  `S_MTIME` varchar(23),
  `FILE_CHECKSUM` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_menu`
--

DROP TABLE IF EXISTS `sy_comm_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_menu` (
  `MENU_ID` varchar(40) NOT NULL COMMENT '菜单主键',
  `MENU_NAME` varchar(60) default NULL COMMENT '菜单名称',
  `MENU_TYPE` decimal(4,0) default NULL COMMENT '菜单类型，1：服务；2：URL；3：JS',
  `MENU_INFO` varchar(400) default NULL COMMENT '菜单信息，服务类型的菜单对应服务主键',
  `MENU_PID` varchar(40) default NULL COMMENT '父菜单主键',
  `MENU_ORDER` decimal(8,0) default NULL COMMENT '菜单排序',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2否',
  `MENU_ICON` varchar(80) default NULL COMMENT '菜单图标',
  `MENU_LEVEL` decimal(4,0) default NULL COMMENT '菜单层级',
  `CODE_PATH` varchar(400) default NULL COMMENT '菜单路径',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `MENU_AREA` varchar(10) default NULL COMMENT '菜单显示类型',
  `MENU_TIP` varchar(200) default NULL COMMENT '菜单提示信息',
  `MENU_TODO_FLAG` decimal(4,0) default NULL COMMENT '启用提醒?',
  `MENU_TODO_TYPE` varchar(400) default NULL COMMENT '提醒对应类型',
  `DS_NAME` varchar(40) default NULL COMMENT '图标名称',
  `DS_MENU_FLAG` decimal(4,0) default NULL COMMENT '桌面显示菜单?，1：是（缺省）；2：否',
  `DS_NORMAL_FLAG` decimal(4,0) default NULL COMMENT '桌面码头图标?，1：是（缺省）；2：否',
  `DS_FOLDER_FLAG` decimal(4,0) default NULL COMMENT '桌面文件夹?，1：是；2：否（缺省）',
  `DS_ICON` varchar(80) default NULL COMMENT '桌面图标',
  `MENU_NODE_VIRTUAL` varchar(4) default NULL COMMENT '是否虚拟节点',
  `MENU_OTYPE` decimal(4,0) default NULL COMMENT '菜单打开方式，1：Tab页；2：新页面；',
  `MENU_SCOPE` decimal(4,0) default NULL COMMENT '范围',
  PRIMARY KEY  (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_menu`
--

LOCK TABLES `sy_comm_menu` WRITE;
/*!40000 ALTER TABLE `sy_comm_menu` DISABLE KEYS */;
INSERT INTO `sy_comm_menu` VALUES ('016rSA6jYN9aHdmVfZJU42d','角色管理(本级)','1','SY_ORG_ROLE','0oKOxzv2JbCEsVTHnrBDXEm','30','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0oKOxzv2JbCEsVTHnrBDXEm^016rSA6jYN9aHdmVfZJU42d^','2013-08-02 16:42:35:000','1','管理本级机构的角色和用户','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('02IEu8cn3J6hGTB3HxkQyQ5','服务配置','1','SY_SERV','3ijge10IsddOqygTiieZZYg','901','1','1','1','xitong','3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^02IEu8cn3J6hGTB3HxkQyQ5^','2013-08-02 16:44:35:513','2,3','系统所有的服务定义信息','2',NULL,'系统管理','1','2','2','xitong',NULL,'0','511'),('0Aylrb03h7irH7pDX7WrA3','用户管理(全部)','1','SY_ORG_USER_ALL','2Oh41jvLR8THjcaWMzvb1F9','10','1','1','1','','4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2Oh41jvLR8THjcaWMzvb1F9^0Aylrb03h7irH7pDX7WrA3^','2013-08-02 16:43:46:199','1','管理所有机构的用户','2',NULL,'用户管理','3','2','2','xitong','2','0','511'),('0Ca4uMNjZetV2QyMljagfu','网站抓取','1','SY_PLUG_SEARCH_WEBCRAW','2j9lAe889tb7XMWXzmFzfKw','4','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^0Ca4uMNjZetV2QyMljagfu^','2013-08-02 16:42:35:131','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0Dt686scp1Q8eQPoLH6lZ0','模版组件权限','2','SY_COMM_TEMPL_COMS_ACL.show.do','1eXaD56LNar9HbA4kDEtUH','1005','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^0Dt686scp1Q8eQPoLH6lZ0^','2013-08-02 16:42:35:083','1',NULL,'2',NULL,NULL,'3','2','2',NULL,NULL,'0','63'),('0fzOpxdY5fcavc89skfU9lL','意见设置','4',NULL,'11P3BLlxl9lV1gfjTiMykt','90','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^0fzOpxdY5fcavc89skfU9lL^','2013-08-02 16:42:35:045','1',NULL,'2',NULL,NULL,'1','2','2',NULL,'2','0','511'),('0it1YeXod0QVNXnxoWnAmg','数据权限配置','1','SY_SERV_DACL','3ijge10IsddOqygTiieZZYg','1000','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^0it1YeXod0QVNXnxoWnAmg^','2013-08-02 16:42:35:069','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0jPQFwWPF199NhJqGujmZT','数据变更监控','1','SY_SERV_LOG_ITEM','0mcgtM0bV7NUEP3TcW6HuOk','300','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^0jPQFwWPF199NhJqGujmZT^','2013-08-02 16:42:35:118','1','类型、金额、编号等核心数据项变更记录','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0kOb8PzAuFcaUBbtpXAdtzR','流程分类','2','SY_SERV_DICT_ITEM_CMPY.list.do?data={\"DICT_ID\":\"SY_WFE_CATALOG\",\"links\":{\"DICT_ID\":\"SY_WFE_CATALOG\"}}','11P3BLlxl9lV1gfjTiMykt','20','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^0kOb8PzAuFcaUBbtpXAdtzR^','2013-08-02 16:42:35:035','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0mcgtM0bV7NUEP3TcW6HuOk','日志管理','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','50','1','1','1','log','2','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^','2013-08-02 16:42:35:122','2',NULL,'2',NULL,'日志管理夹','1','2','1','folder','2','0','511'),('0NG0x7HmVcxrogqUswIZAz','意见编码','1','SY_COMM_MIND_CODE','0fzOpxdY5fcavc89skfU9lL','10','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^0fzOpxdY5fcavc89skfU9lL^0NG0x7HmVcxrogqUswIZAz^','2013-08-02 16:42:35:041','1','意见编码设置','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0oKOxzv2JbCEsVTHnrBDXEm','角色管理','4',NULL,'2oveOCm4FaNWTonGulPoov','30','1','1','1','hrms','3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0oKOxzv2JbCEsVTHnrBDXEm^','2013-08-02 16:42:35:001','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0P7DzstSdcRVbVFYfKOdba','机构管理','4',NULL,'2oveOCm4FaNWTonGulPoov','10','1','1','1','bangong','3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0P7DzstSdcRVbVFYfKOdba^','2013-08-02 16:42:34:980','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0pfCCUIzVd4rpdrIY58WYA','系统配置','2','SY_COMM_TEMPL.show.do?pkCode=SY_COMM_CONFIG&model=view','2utF2kSHR9Jb9XYlQsTqw34','100','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^0pfCCUIzVd4rpdrIY58WYA^','2013-08-02 16:42:35:099','1',NULL,'2',NULL,NULL,'3','2','2',NULL,NULL,'0','511'),('0qow053HNecWohz3ktKkLM','模板组件','1','SY_COMM_TEMPL_COMS','1eXaD56LNar9HbA4kDEtUH','1003','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^0qow053HNecWohz3ktKkLM^','2013-08-02 16:42:35:078','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0vCO5dxod7EHI23JL944ub','文件管理','1','SY_COMM_FILE','2utF2kSHR9Jb9XYlQsTqw34','500','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^0vCO5dxod7EHI23JL944ub^','2013-08-02 16:42:35:107','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('0YojLnIHR1dE9zJAg1G0rl','任务调度执行日志','1','SY_COMM_SCHED_HIS','0mcgtM0bV7NUEP3TcW6HuOk','900','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^0YojLnIHR1dE9zJAg1G0rl^','2013-08-02 16:42:35:111','1','任务调度执行日志记录','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1001002__1','字典管理','1','SY_SERV_DICT','10010__1','12','1','1','2',NULL,'3','100__1^10010__1^1001002__1^','2013-07-19 16:44:19:333','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001003__1','菜单管理','1','SY_COMM_MENU','10010__1','20','1','1','2',NULL,'3','100__1^10010__1^1001003__1^','2013-07-19 16:44:37:399','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001004__1','权限管理','2','SY_ORG_ACL.show.do','10010__1','22','1','1','2',NULL,'3','100__1^10010__1^1001004__1^','2013-07-19 16:44:48:971','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001006__1','系统信息','1','SY_COMM_MESSAGE','10010__1','50','1','1','2','person_info','3','100__1^10010__1^1001006__1^','2013-07-19 16:45:08:391','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001007__1','公司管理','1','SY_ORG_CMPY','10010__1','100','1','1','2','info','3','100__1^10010__1^1001007__1^','2013-07-19 16:45:36:523','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001008__1','系统配置（公共）','1','SY_COMM_CONFIG_PUBLIC','10010__1','101','1','1','2',NULL,'3','100__1^10010__1^1001008__1^','2013-07-19 16:46:25:664','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001009__1','角色管理（公共）','1','SY_ORG_ROLE_PUBLIC','10010__1','102','1','1','2',NULL,'3','100__1^10010__1^1001009__1^','2013-07-19 16:46:41:779','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('10010101__1','服务定义','1','SY_SERV','10010__1','10','1','1','2','xitong','3','100__1^10010__1^10010101__1^','2013-07-19 16:43:57:240','2',NULL,'2',NULL,'集中管控','1','3','2',NULL,NULL,NULL,'63'),('1001010__1','菜单管理（公共）','1','SY_COMM_MENU_PUBLIC','10010__1','104','1','1','2',NULL,'3','100__1^10010__1^1001010__1^','2013-07-19 16:46:52:644','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001011__1','流程管理（公共）','1','SY_WFE_PROC_DEF_PUBLIC','10010__1','108','1','1','2',NULL,'3','100__1^10010__1^1001011__1^','2013-07-19 16:47:02:153','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('1001012__1','任务调度（公共）','1','SY_COMM_SCHED','10010__1','110','1','1','2',NULL,'3','100__1^10010__1^1001012__1^','2013-07-19 16:47:13:068','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('10010__1','集中管控','4',NULL,'100__1','1','1','1','2','system','2','100__1^10010__1^','2013-07-19 16:41:33:943','1',NULL,'2',NULL,NULL,'0','2','2',NULL,NULL,NULL,'63'),('100__1','集中管控管理','4',NULL,NULL,'101','1','1','2',NULL,'1','100__1^','2013-07-19 16:11:16:793','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,NULL,'63'),('10DLihccVadXKxSY0wiJMOT','任务调度','1','SY_COMM_SCHED','2utF2kSHR9Jb9XYlQsTqw34','300','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^10DLihccVadXKxSY0wiJMOT^','2013-08-02 16:42:35:102','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('11P3BLlxl9lV1gfjTiMykt','流程管理','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','20','1','1','1','line','2','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^','2013-08-02 16:42:35:046','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('13LIqw0gx4pWCiInUBt7m9','智能搜索','2','SY_PLUG_SEARCH.show.do','2j9lAe889tb7XMWXzmFzfKw','1','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^13LIqw0gx4pWCiInUBt7m9^','2013-08-02 16:42:35:126','1',NULL,'2',NULL,NULL,'3','2','2',NULL,NULL,'0','511'),('1aZlzBxzR5MaUutXODCITF','新委托管理','1','SY_ORG_USER_TYPE_AGENT.show.do','3jhh4Sv1F6dboYMOwqUEP4','0','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3jhh4Sv1F6dboYMOwqUEP4^1aZlzBxzR5MaUutXODCITF^','2013-08-02 16:42:35:144','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1eXaD56LNar9HbA4kDEtUH','模板和组件','4',NULL,'3ijge10IsddOqygTiieZZYg','1003','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^','2013-08-02 16:42:35:084','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'1','511'),('1Fh4Cp0Z15098wi2YYtYOQ','机构管理(本级)','1','SY_ORG_DEPT','0P7DzstSdcRVbVFYfKOdba','30','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0P7DzstSdcRVbVFYfKOdba^1Fh4Cp0Z15098wi2YYtYOQ^','2013-08-02 16:42:34:979','1','管理本机构','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1GOhlUnKN5yUxfs1P2rdVUF','机构业务条线','2','SY_SERV_DICT_ITEM_CMPY.list.do?data={\"DICT_ID\":\"SY_ORG_DEPT_LINE\",\"links\":{\"DICT_ID\":\"SY_ORG_DEPT_LINE\"}}','23Vu3ftU545bT8NerBgPUP','610','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^23Vu3ftU545bT8NerBgPUP^1GOhlUnKN5yUxfs1P2rdVUF^','2013-08-02 16:42:35:026','1','用于机构业务条线设置','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1lc8L3aVh0Ma48jHEw82lo','词库管理','1','SY_PLUG_SEARCH_WORD','2j9lAe889tb7XMWXzmFzfKw','20','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^1lc8L3aVh0Ma48jHEw82lo^','2013-08-02 16:42:35:137','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1lFlp9FmJ7O4GtwVRVtdzX0','组件类别管理','2','SY_SERV_DICT_ITEM.list.do?data={\"DICT_ID\":\"SY_COMM_TEMPL_COMTYPE\",\"links\":{\"DICT_ID\":\"SY_COMM_TEMPL_COMTYPE\"}} ','1eXaD56LNar9HbA4kDEtUH','1004','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^1lFlp9FmJ7O4GtwVRVtdzX0^','2013-08-02 16:42:35:080','1',NULL,'2',NULL,NULL,'3','2','2',NULL,NULL,'0','511'),('1nQ1U4r1F0MVvhfnPq5bMM','检索设置','1','SY_SERV_SEARCH','2j9lAe889tb7XMWXzmFzfKw','10','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^1nQ1U4r1F0MVvhfnPq5bMM^','2013-08-02 16:42:35:133','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1PANylALR21q78DcyHjgus5','群组管理','1','SY_ORG_GROUP','2oveOCm4FaNWTonGulPoov','40','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^1PANylALR21q78DcyHjgus5^','2013-08-02 16:42:35:005','1','虚拟群组管理','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('1Rpa0eh9B5JamQ0XBuPKtn','系统管理','4',NULL,NULL,'900','1','1','1',NULL,'1','1Rpa0eh9B5JamQ0XBuPKtn^','2013-08-02 16:42:35:178','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','63'),('1Svz3xei91mG1eL0DmNiPv','门户模版','1','SY_COMM_TEMPL','1eXaD56LNar9HbA4kDEtUH','1001','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^1Svz3xei91mG1eL0DmNiPv^','2013-08-02 16:42:35:073','1',NULL,'2',NULL,NULL,'1','2','2','bangongjianbao',NULL,'0','511'),('23QuLaGr965HiHOomoUiLo','群组职务类型','2','SY_SERV_DICT_ITEM_CMPY.list.do?data={\"DICT_ID\":\"SY_ORG_GROUP_USER_POST\",\"links\":{\"DICT_ID\":\"SY_ORG_GROUP_USER_POST\"}} ','23Vu3ftU545bT8NerBgPUP','490','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^23Vu3ftU545bT8NerBgPUP^23QuLaGr965HiHOomoUiLo^','2013-08-02 16:42:35:017','1','用于群组用户职务设置','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('23Vu3ftU545bT8NerBgPUP','组织扩展设置','4',NULL,'2oveOCm4FaNWTonGulPoov','400','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^23Vu3ftU545bT8NerBgPUP^','2013-08-02 16:42:35:027','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('25tyPOdYn179Ua4veIVkz3k','角色管理(含下级)','1','SY_ORG_ROLE_SUB','0oKOxzv2JbCEsVTHnrBDXEm','20','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0oKOxzv2JbCEsVTHnrBDXEm^25tyPOdYn179Ua4veIVkz3k^','2013-08-02 16:42:34:998','1','管理本机及下级机构的角色和用户','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2dNNnOYeB8gUuNHhlRIxmO','系统日志文件下载','1','SY_COMM_LOGS','0mcgtM0bV7NUEP3TcW6HuOk','400','1','1','1','doc','3','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^2dNNnOYeB8gUuNHhlRIxmO^','2013-08-02 16:42:35:121','1',NULL,'2',NULL,NULL,'1','2','2',NULL,'2','0','511'),('2eDj7PilV8a9oTrwftff7HQ','用户操作监控','1','SY_SERV_LOG_ACT','0mcgtM0bV7NUEP3TcW6HuOk','200','1','1','1','jiaoliu','3','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^2eDj7PilV8a9oTrwftff7HQ^','2013-08-02 16:42:35:116','2','登录、退出、删除等敏感操作记录','2',NULL,'用户操作监控','3','2','2','banwenbanshi',NULL,'0','511'),('2fvpJ6gE9fC8SSkug3Vq4K','菜单管理','1','SY_COMM_MENU','2oveOCm4FaNWTonGulPoov','100','1','1','1','roll_manage','3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2fvpJ6gE9fC8SSkug3Vq4K^','2013-08-02 16:42:35:007','1',NULL,'2',NULL,'菜单管理','1','2','2','default',NULL,'0','511'),('2h2hgWuS93ersKdWd20OHzE','消息监听','1','SY_COMM_MSG_LISTENER','2utF2kSHR9Jb9XYlQsTqw34','2010','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^2h2hgWuS93ersKdWd20OHzE^','2013-08-02 16:42:35:097','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2IQrFvL3l1p897O6CzQDPC','工作日设置','2','SY_COMM_WORK_DAY.show.do','2utF2kSHR9Jb9XYlQsTqw34','1003','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^2IQrFvL3l1p897O6CzQDPC^','2013-08-02 16:42:35:092','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2j9lAe889tb7XMWXzmFzfKw','全文检索','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','100','1','1','1','search','2','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^','2013-08-02 16:42:35:138','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2JMxmDacVaLWBFW3MSGLvh','机构回收站','1','SY_COMM_ENTITY_TRASH_ORG','2oveOCm4FaNWTonGulPoov','160','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2JMxmDacVaLWBFW3MSGLvh^','2013-08-02 16:42:35:013','1','机构内所有已删除数据的回收站','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2N1eCXt19arExLnBBjNa7H','角色管理(全部)','1','SY_ORG_ROLE_ALL','0oKOxzv2JbCEsVTHnrBDXEm','10','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0oKOxzv2JbCEsVTHnrBDXEm^2N1eCXt19arExLnBBjNa7H^','2013-08-02 16:42:34:995','1','管理所有机构的角色和用户','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2Oh41jvLR8THjcaWMzvb1F9','用户管理','4',NULL,'2oveOCm4FaNWTonGulPoov','20','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2Oh41jvLR8THjcaWMzvb1F9^','2013-08-02 16:42:34:991','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2oveOCm4FaNWTonGulPoov','组织管理','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','10','1','1','1','lvshi','2','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^','2013-08-02 16:42:35:028','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2suLs00tCRaDUA00J3a5eflo','在线用户监控','1','SY_ORG_USER_ONLINE','0mcgtM0bV7NUEP3TcW6HuOk','100','1','1','1','tian','3','1Rpa0eh9B5JamQ0XBuPKtn^0mcgtM0bV7NUEP3TcW6HuOk^2suLs00tCRaDUA00J3a5eflo^','2013-08-02 16:42:35:114','2','在线用户信息','2',NULL,'在线用户监控','3','2','2','jianbao',NULL,'0','511'),('2t2mzKMwd7SqEXubIobhMXup','测试主办','2','SY_COMM_ENTITY_ATTENTION.list.do?extWhere={\"SERV_ID\":\"^SY_WFE_TEST^\"}','3jhh4Sv1F6dboYMOwqUEP4','1004','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3jhh4Sv1F6dboYMOwqUEP4^2t2mzKMwd7SqEXubIobhMXup^','2013-08-02 16:42:35:142','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2TYE7PF1d3PXXK3q7BFw0I','用户管理(本级)','1','SY_ORG_USER','2Oh41jvLR8THjcaWMzvb1F9','30','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2Oh41jvLR8THjcaWMzvb1F9^2TYE7PF1d3PXXK3q7BFw0I^','2013-08-02 16:42:34:990','1','管理本机构下的用户','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2utF2kSHR9Jb9XYlQsTqw34','系统设置','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','40','1','1','1','basedata','2','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^','2013-08-02 16:42:35:108','1','系统参数配置等','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2wAMOFvERcVWlQIvOMFtS6','用户管理(含下级)','1','SY_ORG_USER_SUB','2Oh41jvLR8THjcaWMzvb1F9','20','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^2Oh41jvLR8THjcaWMzvb1F9^2wAMOFvERcVWlQIvOMFtS6^','2013-08-02 16:42:34:987','1','管理本机及下级机构的用户','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2xfSACpyd2tHJ803iAWxDP','数据字典','1','SY_SERV_DICT','3ijge10IsddOqygTiieZZYg','905','1','1','1','wf_log','3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^2xfSACpyd2tHJ803iAWxDP^','2013-08-02 16:42:35:053','1','系统字典的定义信息，常用的预定义好的数据','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2YLs3y1ERe0r914pBaScz4','机构扩展分类1','2','SY_SERV_DICT_ITEM_CMPY.list.do?data={\"DICT_ID\":\"SY_ORG_DEPT_SRC_TYPE1\",\"links\":{\"DICT_ID\":\"SY_ORG_DEPT_SRC_TYPE1\"}}','23Vu3ftU545bT8NerBgPUP','500','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^23Vu3ftU545bT8NerBgPUP^2YLs3y1ERe0r914pBaScz4^','2013-08-02 16:42:35:019','1','用于机构扩展属性','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('2Z1Gu6o4x9gEnkX7dZMfRlW2','流程定义','1','SY_WFE_PROC_DEF','11P3BLlxl9lV1gfjTiMykt','10','1','1','1','workflow','3','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^2Z1Gu6o4x9gEnkX7dZMfRlW2^','2013-08-02 16:42:35:032','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('32mMoRYRxcrE9l3VZqyu41h','模版类型管理','2','SY_SERV_DICT_ITEM.list.do?data={\"DICT_ID\":\"SY_COMM_TEMPL_TYPE\",\"links\":{\"DICT_ID\":\"SY_COMM_TEMPL_TYPE\"}} ','1eXaD56LNar9HbA4kDEtUH','1002','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^1eXaD56LNar9HbA4kDEtUH^32mMoRYRxcrE9l3VZqyu41h^','2013-08-02 16:42:35:076','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('32zi9NL7Vf39Kup5ynC9DP','服务监听','1','SY_SERV_LISTENER','2utF2kSHR9Jb9XYlQsTqw34','2000','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^32zi9NL7Vf39Kup5ynC9DP^','2013-08-02 16:42:35:094','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('37rpmVrVAhdibEtqn9uYnAv','图表配置','1','SY_COMM_DATA_VIEW','3ijge10IsddOqygTiieZZYg','915','1','1','1','info','3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^37rpmVrVAhdibEtqn9uYnAv^','2013-08-02 16:42:35:059','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3aWkwfEmV9A909dXGTGSm0','工作台管理','1','SY_COMM_DESK','3ijge10IsddOqygTiieZZYg','999','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^3aWkwfEmV9A909dXGTGSm0^','2013-08-02 16:42:35:067','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3eWRyZeCV44o3FxvgYSAaG','数据库表','1','SY_SERV_TABLE','3ijge10IsddOqygTiieZZYg','920','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^3eWRyZeCV44o3FxvgYSAaG^','2013-08-02 16:42:35:061','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3fVI2lISBBfqo020REjdAdp','机构管理(含下级)','1','SY_ORG_DEPT_SUB','0P7DzstSdcRVbVFYfKOdba','20','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0P7DzstSdcRVbVFYfKOdba^3fVI2lISBBfqo020REjdAdp^','2013-08-02 16:42:34:976','1','管理本级及所有下级机构','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3gEkSKI8N7ZUxxDw3kXwwZC','个性信息订阅','2','/sy/plug/search/cuSearchView.jsp','2j9lAe889tb7XMWXzmFzfKw','2','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2j9lAe889tb7XMWXzmFzfKw^3gEkSKI8N7ZUxxDw3kXwwZC^','2013-08-02 16:42:35:129','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3ijge10IsddOqygTiieZZYg','开发管理','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','30','1','1','1',NULL,'2','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^','2013-08-02 16:42:35:085','1',NULL,'2',NULL,'默认图标','1','3','2','default',NULL,'0','63'),('3jbuROYC5478XkKIAuroiU','意见类型','1','SY_COMM_MIND_TYPE','0fzOpxdY5fcavc89skfU9lL','30','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^11P3BLlxl9lV1gfjTiMykt^0fzOpxdY5fcavc89skfU9lL^3jbuROYC5478XkKIAuroiU^','2013-08-02 16:42:35:044','1','意见类型设置：审批类、批示类...','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3jhh4Sv1F6dboYMOwqUEP4','测试菜单','4',NULL,'1Rpa0eh9B5JamQ0XBuPKtn','110','1','1','1','qq','2','1Rpa0eh9B5JamQ0XBuPKtn^3jhh4Sv1F6dboYMOwqUEP4^','2013-08-02 16:42:35:174','2',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','63'),('3p4jafXdsJajpnoheKCzzE2A','报表配置','1','SY_PLUG_REPORT','3ijge10IsddOqygTiieZZYg','910','1','1','1','info','3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^3p4jafXdsJajpnoheKCzzE2A^','2013-08-02 16:42:35:056','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3rm13tqRNdgpP7JOMMGZLd','权限管理','2','SY_ORG_ACL.show.do?scrollFlag=true','2oveOCm4FaNWTonGulPoov','150','1','1','1','default','3','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^3rm13tqRNdgpP7JOMMGZLd^','2013-08-02 16:42:35:010','1',NULL,'2',NULL,'权限管理','1','2','2','default',NULL,'0','511'),('3ubKxUDbOR5Aa7xUBsFXhLmR','提示信息','1','SY_COMM_MESSAGE','3ijge10IsddOqygTiieZZYg','991','1','1','1','person_info','3','1Rpa0eh9B5JamQ0XBuPKtn^3ijge10IsddOqygTiieZZYg^3ubKxUDbOR5Aa7xUBsFXhLmR^','2013-08-02 16:42:35:064','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3um2gxY5d0ZFdedluCA2kj','表达式','1','SY_COMM_EXPRESSION','2utF2kSHR9Jb9XYlQsTqw34','400','1','1','1',NULL,'3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^3um2gxY5d0ZFdedluCA2kj^','2013-08-02 16:42:35:104','1',NULL,'2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3y1fYDEK15Qb3JMV4KMDE1','机构扩展分类2','2','SY_SERV_DICT_ITEM_CMPY.list.do?data={\"DICT_ID\":\"SY_ORG_DEPT_SRC_TYPE2\",\"links\":{\"DICT_ID\":\"SY_ORG_DEPT_SRC_TYPE2\"}}','23Vu3ftU545bT8NerBgPUP','510','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^23Vu3ftU545bT8NerBgPUP^3y1fYDEK15Qb3JMV4KMDE1^','2013-08-02 16:42:35:022','1','用于机构扩展属性','2',NULL,NULL,'1','2','2',NULL,NULL,'0','511'),('3z3ANA4aZ2SrlMHDiWWFqIG','机构管理(全部)','1','SY_ORG_DEPT_ALL','0P7DzstSdcRVbVFYfKOdba','10','1','1','1',NULL,'4','1Rpa0eh9B5JamQ0XBuPKtn^2oveOCm4FaNWTonGulPoov^0P7DzstSdcRVbVFYfKOdba^3z3ANA4aZ2SrlMHDiWWFqIG^','2013-08-02 16:42:34:972','2','管理所有机构','2',NULL,'组织管理','1','2','2','xiezuo',NULL,'0','511'),('3zVqw91IJ6ea8Hn6NaGlECt','系统运行参数','2','SY_COMM_CONFIG.showAPPConf.do','2utF2kSHR9Jb9XYlQsTqw34','900','1','1','1','basedata','3','1Rpa0eh9B5JamQ0XBuPKtn^2utF2kSHR9Jb9XYlQsTqw34^3zVqw91IJ6ea8Hn6NaGlECt^','2013-08-02 16:42:35:090','1','显示web.xml等设定的参数，支持动态修改生效，不存储到对应文件','2',NULL,NULL,'1','2','2',NULL,'2','0','0');
/*!40000 ALTER TABLE `sy_comm_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_message`
--

DROP TABLE IF EXISTS `sy_comm_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_message` (
  `MSG_ID` varchar(40) NOT NULL COMMENT '信息主键，UUID',
  `MSG_CODE` varchar(40) default NULL COMMENT '信息编码',
  `MSG_NAME` varchar(400) default NULL COMMENT '信息内容',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：是；2：否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`MSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提示信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_message`
--

LOCK TABLES `sy_comm_message` WRITE;
/*!40000 ALTER TABLE `sy_comm_message` DISABLE KEYS */;
INSERT INTO `sy_comm_message` VALUES ('00ogy8-Ox3BFmfy5DjfhZ4','SY_SERV_DISABLED','被禁用的服务ID：【{1}】。','1','1','1',NULL),('06djdWe7RawV2WdhpyDkZH','SY_WF_START_NODE_ERROR','没有查询到流程编码为【{1}】公司ID为【{2}】流程的起始节点','1','1','1',NULL),('0a4dbfMJ141UJGrpTaibSj','SY_STATE_ALIVE','活动中','1','1','1',NULL),('0j57Y0s9VffG35cSju8udW','SY_DATE_BEFORE_END_ERROR','开始日期不能晚于结束日期!','1','1','1',NULL),('0jBVmn43BdREivt194dEib','SY_DELETE_LINK_ERROR','删除失败：关联服务【{1}】下有{2}条关联数据。','1','1','1','2013-01-31 15:06:39:857'),('0JlYqfI3R0NEEbUheh4QGD','SY_DELETE_WHERE_ERROR','删除失败：系统禁止没有where条件的批量删除。','1','1','1',NULL),('0Ls6BFz696UWeuwbaaKanv','SY_ORG_USER_AGT_SELF_ERROR','不能设置自己（或可能循环委托）为受委托人!','1','1','1',NULL),('0OUIpkJid0gpL7pZRyFDL8','SY_START_OPERATION_SUCCESSFUL','启动操作成功。','1','1','1',NULL),('0SeXEOzU1chUFT4-ygloMT','SY_ADD_ERROR','添加的数据保存失败。','1','1','1','2013-01-25 21:48:41:267'),('0VxsJG3sd3obr9rnq9kYQj','SY_ORG_USER_RELATE_MAIN_ERROR','主兼岗人错误：主兼岗人一旦设置过，就不允许作为子兼岗人使用。','2','ruaho','1','2013-01-29 21:32:19:025'),('0XVBpwFn54HWYclBaiokeq','SY_BATCHSAVE_OK','{1}条数据保存成功。','1','1','1',NULL),('0xWTST1cJaNX0_KKTU29T0','SY_DATA_NOT_EXIST','数据{1}不存在。','1','1','1',NULL),('0ySdEgSbN8oEUWKWUkuixO','SY_WF_PROC_INST_NOT_EXIST','没有查询到流程实例ID为【{1}】的流程实例','1','1','1',NULL),('0Z6MNRvQJeQHMevO0CqvnX','SY_CMPY_NOT_FOUND','无效的公司编码：{1}。','1','1','1','2013-06-20 16:30:31:516'),('11Z6ptjr9fZbZ-npyUSIhH','SY_BATCHSAVE_NONE','批量保存失败：没有数据保存成功。','1','1','1',NULL),('132KBJrZt9FqvMdpxamBhd','SY_SERV_AUTH_ERROR','您没有此功能的权限：{1}({2})','1','1','1',NULL),('15EBl_95B3HE1yoKyy71u9','SY_IMPORT_EXISTS','数据导入失败：无法导入已经存在的数据。','1','1','1',NULL),('1d4d4togx1wFxojoUZ5LkM','SY_CMPY_FORBIDDEN','公司被禁用，编码为：{1}。','2','ruaho','1','2013-06-20 16:30:31:509'),('1dI79z3h9138YsJXAps89c','SY_WF_NODE_INSTHIS_ID_ERROR','在节点实例历史表中没有查询到节点实例ID为【{1}】的节点实例','1','1','1',NULL),('1DITzZVztfqXU1XB0xA1_e','SY_WF_NODE_DEF_ERROR','没有查询到流程编号为【{1}】节点编号为【{2}】公司ID为【{3}】的节点定义','1','1','1',NULL),('1duoHIqdt0-aVH6a3DS1ey','SY_SAVE_MTIME_ERROR','数据更新时间检查错误：修改的不是最新数据，请刷新后再修改。','1','1','1',NULL),('1e6e1DWox0F9VUkEUtH-Kn','SY_DATA_RESTOR_OK','{1}条数据已经成功恢复。','2','ruaho','1','2013-01-26 17:40:26:076'),('1iSNxrVw56Fpax-bhW9BLV','SY_WF_LINE_ERROR','没有查询到流程编码为 【{1}】前节点为【{2}】后节点为【{3}】公司ID为【{4}】流程定义连线','1','1','1',NULL),('1KoEojTld3VGIdprrZ5bZx','SY_RUN_ERROR','执行方法【{1}】]错误。','1','1','1',NULL),('1LgZ9Z9ud3UEuuwWDeE1OD','SY_USER_NOT_FOUND','无效的用户编码：【{1}】。','1','1','1',NULL),('1mK2zYXKh7B88lrsQQb8cl','SY_SAVE_ERROR','保存失败。','1','1','1','2013-01-31 15:09:02:173'),('1Nl5_5lTB47qcDLP1252It','SY_STATE_STOPED','停止','1','1','1',NULL),('1oXn7x-dZbP8765Ydh4C15','SY_WF_BIND_ERROR','没有查询到流程编码为 【{1}】 表单为 【{2}】 公司ID为 【{3}】的绑定 定义','1','1','1',NULL),('1P9UyE3zpa-bOsHe-5Qy_g','SY_IMPORT_OK','{1}条数据导入成功。','1','1','1',NULL),('1PEoPbiGh9bG-7JSM-E92w','SY_DELETE_EXIST_SUB_ERROR','删除失败：当前数据下存在{1}条子数据，请先删除子数据。','1','1','1',NULL),('1Rk9Safxpf9phs4xhLqIQ3','SY_TEMPLATE_ERRO','生成模板内容【{1}】,【{2}】有误！','1','1','1',NULL),('1UlbqxtbVferxiotQc1ES3','SY_WF_NOT_FOUND_NODE_INST','没有查询到流程ID为【{1}】的流程节点实例','1','1','1',NULL),('1vtcTwFoB6abn5hGu1uddU','SY_WF_PROC_ENNAME_NOT_EXIST','没有查询到流程编号为【{1}】公司ID为【{2}】的流程定义','1','1','1',NULL),('22HYwrbQh5EqlDSQz__aYs','SY_SAVE_UNIQUE_EXISTS','唯一约束错误：{1}存在相同数据。','1','1','1',NULL),('23dF62jFJ8eGdg-Z6yck_v','SY_SERV_DICT_PCODE_ERROR','保存失败：不能将自身或子数据设置为上级。','1','1','1',NULL),('24vcXcNAB5c914qYqJ1vQp','SY_RETURN_NULL','返回对象为空。','1','1','1',NULL),('25SLQnJbR8mbuv1nZx7yRj','SY_PARAM_INVALID','参数非法或缺少参数。','1','1','1',NULL),('2fJNZYEpB74auz0rkyR86_','SY_SAVE_NOTEXISTS','保存失败，主键为:【{1}】的数据不存在。','1','1','1','2013-01-31 15:09:02:188'),('2GdiHWuH5d4VUEXM69jRhy','SY_WF_NODE_INST_ID_ERROR','没有查询到节点实例ID为【{1}】的节点实例','1','1','1',NULL),('2guBIYlN995pPclK5DqFeO','SY_SYNC_OK','【{1}】条数据同步成功。','1','1','1',NULL),('2KSWthMCNboF351kTzmLUf','SY_IMPORT_MSG','导入结果：{1}条数据导入成功，{2}条数据导入失败。','2','ruaho','1','2013-04-08 11:47:48:225'),('2lINHLtxRbXEEKlZT40DAC','SY_SAVE_OK','修改保存成功。','1','1','1','2013-03-20 13:15:54:982'),('2LxdUuTst7E8tsczEJRZR_','SY_DELETE_ERROR','删除失败：没有数据删除成功。','1','1','1',NULL),('2mXLAmXkN9NUd889h8MZs2','SY_SAVE_WHERE_ERROR','保存失败：禁止没有where条件的批量更新。','1','1','1','2013-01-31 15:09:02:374'),('2nCWvVVlR3aqoBvB0jza-O','SY_ADD_OK','添加的数据保存成功。','1','1','1',NULL),('2PiIpdHxd9kWF04h0ODuyN','SY_BYID_ERROR','无效的数据主键：【{1}】','1','1','1',NULL),('2sh1a63_h83ryKxg7zM03W','SY_WF_START_NO_VALID_FLOW','流程启动失败：当前功能【{1}】没有符合规则的流程定义。','1','1','1','2013-03-08 17:43:24:968'),('2uxVqiR1F0hbKQjtT2I52B','SY_SERV_DICT_INNER_PUBLIC','保存失败：不允许设定内部字典为私有（公共标志为否）字典。','1','1','1',NULL),('2W7-K-Emp6QoefBXOmYbD-','SY_BATCHSAVE_ERROR','{1}条数据保存失败。','1','1','1',NULL),('2y2K0LyYl0JHIZtb9x63N5','SY_SYNC_ERROR','同步失败，没有数据同步成功。','1','1','1',NULL),('2ZXGlGhmBawVRSLZHTXEW4','SY_DICT_NOT_FOUND','无效的字典定义：【{1}】','1','1','1',NULL),('30grUKEV93R8LNA9IafEPg','SY_WF_PROC_INST_HIS_NOT_EXIST','在流程实例历史表中没有查询到流程实例ID为【{1}】的流程实例','1','1','1',NULL),('32iC-5ULB1VFnd1O8WCUfo','SY_DEPT_NOT_FOUND','无效的部门编码：【{1}】','1','1','1',NULL),('39qiWN1U14QEHQdMcEGtJy','SY_SERV_ID_ERROR','无效的服务ID：【{1}】。','1','1','1',NULL),('39sAotTjd01q57habdOXfd','SY_DELETE_OK','{1}条数据已经成功删除。','1','1','1',NULL),('3AcGjO5_VeZaCnAJt3vfGD','SY_WF_PROC_PUB_NOT_EXIST','没有查询到流程编号为【{1}】的公共流程定义','1','1','1',NULL),('3bMwvtl-x3MVk6KFbjpxGd','SY_SCHED_ERROR','任务调度管理器异常.','1','1','1',NULL),('3DKlXPcDx2fF4CWYwTozBn','SY_TODO_ERROR','SY_TODO:【{1}】操作,缺失参数【{2}】','1','1','1',NULL),('3e6kNA3px6wFlol4m55Rc2','SY_WF_PROC_NOT_EXIST','没有查询到流程编号为【{1}】的流程定义','1','1','1',NULL),('3gsYgoRSld_XfAQ07zUSjo','SY_ROLE_NOT_FOUND','无效的角色编码：【{1}】','1','1','1',NULL),('3Gz8eD4659oVEGC1qbUTSi','SY_SERV_ACT_INVALID','无效操作：不符合数据要求的操作。','1','1','1',NULL),('3JS8N1UBJ2VU-xcIAlJGl4','SY_ORG_USER_AGT_EXIST','当前用户存在尚未结束的委托！','1','1','1',NULL),('3oKnWEXId8AXCeiP1wauIF','SY_SAVE_NOCHANGE','保存取消，因为没有修改任何数据。','1','1','1',NULL),('3OYLoBhnBaUHf1RwO8e_Wv','SY_WF_START_OK','流程已经成功启动。','1','1','1',NULL),('3U3MByrINbIXFn_F1YOmGD','SY_STATE_PAUSED','暂停','1','1','1',NULL),('3YPHj0Nvp0YHvJ-qhRRJ_8','SY_OPERATION_SUCCESSFUL','【{1}操作】成功','1','1','1',NULL),('3yZs5GT9xfQoXS4_NoHicr','SY_SAVE_LOOP_ERROR','保存失败，可能会出现死循环。','1','1','1',NULL),('SY_CACHE_NOT_FOUND','SY_CACHE_NOT_FOUND','当前缓存不存在：【{1}】','1','1','1',NULL),('SY_DATABASE_ERROR','SY_DATABASE_ERROR','数据库错误。','1','1','1',NULL),('SY_DIC_CODE_ERROR','SY_DIC_CODE_ERROR','无效的字典编码：【{1}】','1','1','1',NULL),('SY_DOC_STANDARD_ERROR','SY_DOC_STANDARD_ERROR','您选择的文件不符合规范。详细信息请阅读操作使用手册。','1','1','1',NULL),('SY_EXPORT_EXCEL_ERROR','SY_EXPORT_EXCEL_ERROR','导出Excel文件错误。','1','1','1',NULL),('SY_FILE_NOT_EXIST','SY_COMM_FILE_NOT_EXIST','文件不存在或者路径错误：{1}','1','1','1',NULL),('SY_FILE_OPERATION_ERROR','SY_FILE_OPERATION_ERROR','文件操作错误。','1','1','1',NULL),('SY_FUNC_ACL_NO','SY_FUNC_ACL_NO','对不起，您没有权限使用此项功能！【{1}】','1','1','1',NULL),('SY_IMPORT_ERROR','SY_IMPORT_ERROR','数据导入错误。','1','1','1',NULL),('SY_LOGIN_COUNT_LOCKED','SY_LOGIN_COUNT_LOCKED','对不起，您的帐号已被锁定，请联系系统管理员进行解锁！','1','1','1',NULL),('SY_LOGIN_COUNT_OVER','SY_LOGIN_COUNT_OVER','对不起，您已经连续输入了{1}次错误的密码，为了安全起见，您的帐号已被锁定，请联系系统管理员进行解锁！','1','1','1',NULL),('SY_LOGIN_ERROR','SY_LOGIN_ERROR','用户名或密码错误','1','1','1',NULL),('SY_LOGIN_IP_DENY','SY_LOGIN_IP_DENY','你的IP地址不允许登录系统，请和管理员联系！','1','1','1',NULL),('SY_LOGIN_IP_LIMIT','SY_LOGIN_IP_LIMIT','由于系统安全的要求,同一用户同时只能在一台机器上登录,如果需要用此用户登录,请先将其他机器上登录的此用户退出！','1','1','1',NULL),('SY_LOGIN_NO_NAME','SY_LOGIN_NO_NAME','用户名为空。','1','1','1',NULL),('SY_LOGIN_NO_PASS','SY_LOGIN_NO_PASS','密码为空。','1','1','1',NULL),('SY_PARAM_ERROR','SY_REQUEST_ERROR','无效的请求【{1}】！','1','1','1',NULL),('SY_TABLE_CODE_ERROR','SY_TABLE_CODE_ERROR','无效的表编码：【{1}】。','1','1','1',NULL),('SY_USER_PREPASS_WRONG','SY_USER_PREPASS_WRONG','输入的当前密码错误！','1','1','1',NULL),('SY_WF_INST_ERROR','SY_WF_INST_ERROR','工作审批流程不存在，可能是流程已经删除或取消，或者单据被删除。','1','1','1',NULL),('SY_WF_PROC_DEF_BEGIN','SY_WF_PROC_DEF_BEGIN','工作流程无法启动，请检查编号为{1}的工作流定义，确认是否存在有效的起始点。','1','1','1',NULL);
/*!40000 ALTER TABLE `sy_comm_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_mind`
--

DROP TABLE IF EXISTS `sy_comm_mind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_mind` (
  `MIND_ID` varchar(40) NOT NULL COMMENT '意见主键',
  `MIND_CONTENT` varchar(4000) default NULL COMMENT '意见内容,记录意见内容或文件ID',
  `MIND_CODE` varchar(40) default NULL COMMENT '意见编码',
  `MIND_TIME` varchar(20) default NULL COMMENT '填意见时间',
  `SERV_ID` varchar(40) default NULL COMMENT '服务主键',
  `DATA_ID` varchar(40) default NULL COMMENT '数据主键',
  `WF_NI_ID` varchar(40) default NULL COMMENT '流程节点实例ID',
  `MIND_DIS_RULE` decimal(1,0) default NULL COMMENT '意见显示规则：1，部门；2，公司',
  `MIND_SORT` decimal(4,0) default NULL COMMENT '意见排序号',
  `MIND_TYPE` decimal(1,0) default NULL COMMENT '意见类型：1，普通意见，2，手写意见,3，附件',
  `BD_USER` varchar(40) default NULL COMMENT '补登用户编码',
  `BD_UNAME` varchar(40) default NULL COMMENT '补登用户名称',
  `S_USER` varchar(40) default NULL COMMENT '填意见用户编码',
  `S_UNAME` varchar(40) default NULL COMMENT '填意见用户名称',
  `S_DEPT` varchar(40) default NULL COMMENT '部门编码',
  `S_DNAME` varchar(100) default NULL COMMENT '部门名称',
  `S_TDEPT` varchar(40) default NULL COMMENT '有效部门编码',
  `S_TNAME` varchar(100) default NULL COMMENT '有效部门名称',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_FLAG` decimal(1,0) default NULL COMMENT '启用标志:1,启用；2：未启用',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `USUAL_ID` varchar(40) default NULL,
  `MIND_IS_TERMINAL` decimal(4,0) default NULL,
  `S_ODEPT` varchar(40) default NULL COMMENT '机构代码',
  `MIND_FILE` varchar(300) default NULL,
  `MIND_CODE_NAME` varchar(100) default NULL COMMENT '意见编码名称',
  `WF_NI_NAME` varchar(100) default NULL COMMENT '流程节点',
  `MIND_LEVEL` decimal(4,0) default NULL COMMENT '意见级别,30:公司领导,20:部门领导,10:处室领导,0:普通',
  `IS_BD` decimal(1,0) default NULL COMMENT '是否补登; 1:是，2:否; 用于标识BD_USER，BD_UNAME是补登用户还是代理办理用户。',
  PRIMARY KEY  (`MIND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_mind`
--

LOCK TABLES `sy_comm_mind` WRITE;
/*!40000 ALTER TABLE `sy_comm_mind` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_mind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_mind_code`
--

DROP TABLE IF EXISTS `sy_comm_mind_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_mind_code` (
  `CODE_ID` varchar(40) NOT NULL COMMENT '编码主键，形式如:QF_1111',
  `CODE_NAME` varchar(40) default NULL COMMENT '编码名称',
  `MIND_TYPE` varchar(40) default NULL COMMENT '意见类型，形式如：QF',
  `MIND_DIS_RULE` decimal(4,0) default NULL COMMENT '意见显示规则：1,部门内可见,2,机构内可见,3,机构外可见',
  `MIND_LEVEL` decimal(4,0) default NULL COMMENT '意见级别,30:公司领导,20:部门领导,10:处室领导,0:普通',
  `PUBLIC_LEVEL` decimal(4,0) default NULL COMMENT '共享级别：1，一级；2，二级；3，三级',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志：1，启用；2，未启用',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `CODE_SORT` decimal(4,0) default NULL COMMENT '排序',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `REGULAR_TYPE` varchar(80) default NULL COMMENT '固定意见ID',
  `IF_HAND` decimal(1,0) default NULL COMMENT '启用启用手写笔？',
  `MIND_DESC` varchar(200) default NULL COMMENT '说明',
  PRIMARY KEY  (`CODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见编码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_mind_code`
--

LOCK TABLES `sy_comm_mind_code` WRITE;
/*!40000 ALTER TABLE `sy_comm_mind_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_mind_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_mind_usual`
--

DROP TABLE IF EXISTS `sy_comm_mind_usual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_mind_usual` (
  `MIND_ID` varchar(40) NOT NULL COMMENT '意见ID',
  `MIND_CONTENT` varchar(4000) default NULL COMMENT '意见内容',
  `MIND_TYPE` decimal(4,0) default NULL COMMENT '意见类型：1，普通意见，2，手写意见',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '共享标志',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_TDEPT` varchar(40) default NULL COMMENT '有效部门编码',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志：1，启用；2，未启用',
  `REGULAR_TYPE` varchar(80) default NULL COMMENT '固定意见类型',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `MIND_VALUE` decimal(4,0) default NULL COMMENT '意见属性值',
  `MIND_SORT` decimal(4,0) default NULL COMMENT '固定意见排序',
  PRIMARY KEY  (`MIND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用意见表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_mind_usual`
--

LOCK TABLES `sy_comm_mind_usual` WRITE;
/*!40000 ALTER TABLE `sy_comm_mind_usual` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_mind_usual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_comm_mind_v`
--

DROP TABLE IF EXISTS `sy_comm_mind_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_mind_v`*/;
/*!50001 CREATE TABLE `sy_comm_mind_v` (
  `MIND_ID` varchar(40),
  `MIND_CONTENT` varchar(4000),
  `MIND_CODE` varchar(40),
  `MIND_TIME` varchar(20),
  `SERV_ID` varchar(40),
  `DATA_ID` varchar(40),
  `WF_NI_ID` varchar(40),
  `MIND_DIS_RULE` decimal(1,0),
  `MIND_SORT` decimal(4,0),
  `MIND_TYPE` decimal(1,0),
  `BD_USER` varchar(40),
  `BD_UNAME` varchar(40),
  `S_USER` varchar(40),
  `S_UNAME` varchar(40),
  `S_DEPT` varchar(40),
  `S_DNAME` varchar(100),
  `S_TDEPT` varchar(40),
  `S_TNAME` varchar(100),
  `S_CMPY` varchar(40),
  `S_FLAG` decimal(1,0),
  `S_MTIME` varchar(23),
  `USUAL_ID` varchar(40),
  `MIND_IS_TERMINAL` decimal(4,0),
  `S_ODEPT` varchar(40),
  `MIND_FILE` varchar(300),
  `MIND_CODE_NAME` varchar(100),
  `WF_NI_NAME` varchar(100),
  `MIND_LEVEL` decimal(4,0),
  `MIND_VALUE` decimal(4,0),
  `USUAL_CONTENT` varchar(4000),
  `IS_BD` decimal(1,0)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_msg_listener`
--

DROP TABLE IF EXISTS `sy_comm_msg_listener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_msg_listener` (
  `LIS_ID` varchar(40) NOT NULL COMMENT '监听ID',
  `LIS_CLASS` varchar(200) default NULL COMMENT '类',
  `LIS_CONF` varchar(2000) default NULL COMMENT '配置',
  `LIST_DESC` varchar(200) default NULL COMMENT '描述',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用',
  `LIS_SORT` decimal(10,0) default NULL COMMENT '排序',
  `S_MTIEM` varchar(23) default NULL COMMENT '更新时间',
  `LIS_ACTION` varchar(4000) default NULL COMMENT '监听消息类型',
  PRIMARY KEY  (`LIS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息监听';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_msg_listener`
--

LOCK TABLES `sy_comm_msg_listener` WRITE;
/*!40000 ALTER TABLE `sy_comm_msg_listener` DISABLE KEYS */;
INSERT INTO `sy_comm_msg_listener` VALUES ('0avzviZUF9gpxjvrx3CTmD','com.rh.core.wfe.attention.AttentionReceiver','','流程关注提醒','1','100','2013-11-08 19:37:35','[{\"TYPE\":\"_ATTENTION\"}]'),('19md3Q3OGZ2vosUctFymVEo','com.rh.core.plug.search.IndexReceiver','','索引消息接收','1','110','2013-11-08 20:38:06','[{\"TYPE\":\"_INDEX\"}]');
/*!40000 ALTER TABLE `sy_comm_msg_listener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_msg_type`
--

DROP TABLE IF EXISTS `sy_comm_msg_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_msg_type` (
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户ID',
  `RT_TYPE` varchar(40) default NULL COMMENT '提醒方式。来自数据字典，SY_REMIND_TYPE。默认的方式有，短信、邮件、RTX。',
  `S_MTIME` varchar(23) default NULL COMMENT '修改时间',
  PRIMARY KEY  (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办提醒方式服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_msg_type`
--

LOCK TABLES `sy_comm_msg_type` WRITE;
/*!40000 ALTER TABLE `sy_comm_msg_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_msg_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_recently_use`
--

DROP TABLE IF EXISTS `sy_comm_recently_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_recently_use` (
  `RECENTLY_ID` varchar(40) NOT NULL COMMENT 'ID',
  `RECENTLY_USER` varchar(40) default NULL COMMENT '最近使用人',
  `RECENTLY_TIME` varchar(40) default NULL COMMENT '最近一次时间',
  `RECENTLY_MENU_URL` varchar(400) default NULL COMMENT '菜单地址',
  `RECENTLY_MENU_TYPE` varchar(4) default NULL COMMENT '菜单类型',
  `RECENTLY_MENU_NAME` varchar(80) default NULL COMMENT '菜单名称',
  `RECENTLY_MENU_PIC` varchar(40) default NULL COMMENT '菜单图标',
  `RECENTLY_PIC_TIP` varchar(40) default NULL COMMENT 'TIP',
  PRIMARY KEY  (`RECENTLY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最近使用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_recently_use`
--

LOCK TABLES `sy_comm_recently_use` WRITE;
/*!40000 ALTER TABLE `sy_comm_recently_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_recently_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_remind`
--

DROP TABLE IF EXISTS `sy_comm_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_remind` (
  `REM_ID` varchar(40) NOT NULL COMMENT '主键',
  `REM_TITLE` varchar(500) default NULL COMMENT '提醒标题',
  `REM_CONTENT` varchar(2000) default NULL COMMENT '提醒内容',
  `REM_URL` varchar(1000) default NULL COMMENT '提醒URL',
  `S_USER` varchar(40) default NULL COMMENT '提醒人',
  `S_ATIME` varchar(30) default NULL COMMENT '提醒添加时间',
  `EXECUTE_TIME` varchar(30) default NULL COMMENT '提醒时间',
  `FINISH_TIME` varchar(30) default NULL COMMENT '提醒完成时间',
  `STATUS` varchar(20) default NULL COMMENT '提醒状态，WAITING，待提醒，FINISHED；已完成；ERROR，已出错；CANCLE，已取消',
  `TYPE` varchar(400) default NULL COMMENT '提醒类型，TODO，待办；EMAIL，邮件；MESSAGE，短消息；INTIME，即时通讯；',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标记，1：有效；2：无效',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `S_EMERGENCY` decimal(4,0) default NULL COMMENT '紧急程度，10，一般；20，紧急；30，特急',
  `SERV_ID` varchar(200) default NULL COMMENT '服务ID',
  `SERV_SRC_ID` varchar(200) default NULL COMMENT 'SRC服务ID',
  `DATA_ID` varchar(200) default NULL COMMENT '数据ID',
  `REM_GROUP` varchar(400) default NULL COMMENT '提醒消息分组',
  `USER_ID` varchar(400) default NULL COMMENT '被提醒人',
  `REMOTE_URL` varchar(1000) default NULL COMMENT '外系统应用提醒URL',
  PRIMARY KEY  (`REM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提醒消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_remind`
--

LOCK TABLES `sy_comm_remind` WRITE;
/*!40000 ALTER TABLE `sy_comm_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_remind_group`
--

DROP TABLE IF EXISTS `sy_comm_remind_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_remind_group` (
  `GROUP_ID` varchar(40) NOT NULL COMMENT '主键',
  `S_USER` varchar(40) default NULL COMMENT '当前用户',
  `REM_GROUP` varchar(400) default NULL COMMENT '消息分组名称',
  PRIMARY KEY  (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提醒消息的分组类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_remind_group`
--

LOCK TABLES `sy_comm_remind_group` WRITE;
/*!40000 ALTER TABLE `sy_comm_remind_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_remind_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_remind_his`
--

DROP TABLE IF EXISTS `sy_comm_remind_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_remind_his` (
  `REM_ID` varchar(40) NOT NULL COMMENT '主键',
  `REM_TITLE` varchar(500) default NULL COMMENT '提醒标题',
  `REM_CONTENT` varchar(2000) default NULL COMMENT '提醒内容',
  `REM_URL` varchar(1000) default NULL COMMENT '提醒URL',
  `S_USER` varchar(40) default NULL COMMENT '提醒人',
  `S_ATIME` varchar(30) default NULL COMMENT '提醒添加时间',
  `EXECUTE_TIME` varchar(30) default NULL COMMENT '提醒时间',
  `FINISH_TIME` varchar(30) default NULL COMMENT '提醒完成时间',
  `STATUS` varchar(20) default NULL COMMENT '提醒状态，WAITING，待提醒，FINISHED；已完成；ERROR，已出错；CANCLE，已取消',
  `TYPE` varchar(400) default NULL COMMENT '提醒类型，TODO，待办；EMAIL，邮件；MESSAGE，短消息；INTIME，即时通讯；',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标记，1：有效；2：无效',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `S_EMERGENCY` decimal(4,0) default NULL COMMENT '紧急程度，10，一般；20，紧急；30，特急',
  `SERV_ID` varchar(200) default NULL COMMENT '服务ID',
  `SERV_SRC_ID` varchar(200) default NULL COMMENT 'SRC服务ID',
  `DATA_ID` varchar(200) default NULL COMMENT '数据ID',
  PRIMARY KEY  (`REM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提醒消息历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_remind_his`
--

LOCK TABLES `sy_comm_remind_his` WRITE;
/*!40000 ALTER TABLE `sy_comm_remind_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_remind_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_remind_users`
--

DROP TABLE IF EXISTS `sy_comm_remind_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_remind_users` (
  `REMIND_USER_ID` varchar(40) NOT NULL COMMENT '主键',
  `REMIND_ID` varchar(40) NOT NULL COMMENT '提醒主键',
  `USER_ID` varchar(40) default NULL COMMENT '被提醒人',
  `STATUS` varchar(40) default NULL COMMENT '状态',
  `SUCCESS` varchar(400) default NULL COMMENT '成功的提醒类型',
  `FAILURE` varchar(400) default NULL COMMENT '失败的提醒类型',
  PRIMARY KEY  (`REMIND_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='被提醒人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_remind_users`
--

LOCK TABLES `sy_comm_remind_users` WRITE;
/*!40000 ALTER TABLE `sy_comm_remind_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_remind_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_sched`
--

DROP TABLE IF EXISTS `sy_comm_sched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_sched` (
  `JOB_CODE` varchar(200) NOT NULL COMMENT '任务CODE',
  `SCHED_NAME` varchar(120) default NULL COMMENT 'sched name',
  `JOB_GROUP` varchar(200) default NULL COMMENT '任务组',
  `DESCRIPTION` varchar(250) default NULL COMMENT '任务说明',
  `JOB_CLASS_NAME` varchar(250) NOT NULL COMMENT '任务实现类',
  `IS_DURABLE` varchar(1) NOT NULL COMMENT '是否持久化',
  `IS_NONCONCURRENT` varchar(1) NOT NULL COMMENT '暂未使用',
  `IS_UPDATE_DATA` varchar(1) default NULL COMMENT '暂未使用',
  `REQUESTS_RECOVERY` varchar(1) default NULL COMMENT '中断是否恢复',
  `JOB_DATA` varchar(1000) default NULL COMMENT '任务参数',
  `JOB_STATE` varchar(10) default NULL COMMENT '任务状态',
  `JOB_TYPE` decimal(4,0) default NULL COMMENT '任务类型, 1:public, 2: cmpy private',
  `S_USER` varchar(40) default NULL COMMENT '创建人',
  `S_UNAME` varchar(40) default NULL COMMENT '用户名称',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `JOB_CMPYS_STATUS` decimal(4,0) default NULL COMMENT '所属公司? 1:不指定,2:全公司,3:自定义',
  `JOB_CMPYS` varchar(500) default NULL COMMENT '自定义公司',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `JOB_CONTEXT_USER` varchar(40) default NULL COMMENT '执行用户',
  PRIMARY KEY  (`JOB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_sched`
--

LOCK TABLES `sy_comm_sched` WRITE;
/*!40000 ALTER TABLE `sy_comm_sched` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_sched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_sched_his`
--

DROP TABLE IF EXISTS `sy_comm_sched_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_sched_his` (
  `ID` varchar(200) NOT NULL COMMENT '日志主键',
  `SCHED_NAME` varchar(120) default NULL COMMENT 'schedule name',
  `JOB_TYPE` varchar(1) NOT NULL COMMENT '表示任务类型.1:普通任务,2:恢复任务',
  `JOB_NAME` varchar(200) NOT NULL COMMENT '任务代码',
  `JOB_GROUP` varchar(200) NOT NULL COMMENT '任务组',
  `TRIGGER_NAME` varchar(200) NOT NULL COMMENT '触发器代码',
  `STATUS` varchar(1) NOT NULL COMMENT '表示执行状态.1:成功,2:失败',
  `FIRE_TIME` varchar(40) NOT NULL COMMENT '执行时间',
  `END_TIME` varchar(40) default NULL COMMENT '完成时间',
  `REFIRE_COUNT` decimal(4,0) NOT NULL COMMENT '重试次数',
  `INSTANCE` varchar(200) default NULL COMMENT '任务计划执行实例',
  `DESCRIPTION` varchar(1000) default NULL COMMENT '说明',
  `S_MTIME` varchar(40) default NULL COMMENT '最后修改时间',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务执行日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_sched_his`
--

LOCK TABLES `sy_comm_sched_his` WRITE;
/*!40000 ALTER TABLE `sy_comm_sched_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_sched_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_sched_trigger`
--

DROP TABLE IF EXISTS `sy_comm_sched_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_sched_trigger` (
  `SCHED_NAME` varchar(120) NOT NULL COMMENT 'sched_name',
  `TRIGGER_CODE` varchar(200) NOT NULL COMMENT '触发器CODE',
  `TRIGGER_GROUP` varchar(200) default NULL COMMENT '触发器组',
  `JOB_CODE` varchar(200) NOT NULL COMMENT '任务CODE',
  `JOB_GROUP` varchar(200) default NULL COMMENT '任务组',
  `DESCRIPTION` varchar(250) default NULL COMMENT '说明',
  `NEXT_FIRE_TIME` varchar(25) default NULL COMMENT '下次启动时间',
  `PREV_FIRE_TIME` varchar(25) default NULL COMMENT '上次启动时间',
  `PRIORITY` decimal(13,0) default NULL COMMENT '优先级',
  `TRIGGER_STATE` varchar(16) NOT NULL COMMENT '状态',
  `TRIGGER_TYPE` varchar(8) NOT NULL COMMENT '类型',
  `START_TIME` varchar(25) default NULL COMMENT '开始时间',
  `END_TIME` varchar(25) default NULL COMMENT '停止时间',
  `CALENDAR_NAME` varchar(200) default NULL COMMENT 'calendar name',
  `MISFIRE_INSTR` decimal(2,0) default NULL COMMENT 'misfire_instr',
  `JOB_DATA` varchar(1000) default NULL COMMENT 'job_data',
  `SIMPLE_TRIGGER_REPEAT_COUNT` decimal(13,0) default NULL COMMENT '重复次数',
  `SIMPLE_TRIGGER_INTERVAL` decimal(13,0) default NULL COMMENT '触发间隔',
  `CRONTAB_EXPRESSTION` varchar(50) default NULL COMMENT 'unix crontab表达式',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`TRIGGER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务触发器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_sched_trigger`
--

LOCK TABLES `sy_comm_sched_trigger` WRITE;
/*!40000 ALTER TABLE `sy_comm_sched_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_sched_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_send`
--

DROP TABLE IF EXISTS `sy_comm_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_send` (
  `SEND_ID` varchar(40) NOT NULL COMMENT '方案ID',
  `SEND_NAME` varchar(100) default NULL COMMENT '方案名称',
  `SEND_MEMO` varchar(1000) default NULL COMMENT '方案说明',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志：1，公共；2：非公共',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志：1，启用；2：未启有',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `O_DEPT` varchar(40) default NULL COMMENT '所属机构编码',
  `S_CMPY` varchar(40) default NULL COMMENT '所属公司编码',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SEND_ORDER` decimal(4,0) default NULL COMMENT '排序',
  PRIMARY KEY  (`SEND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分发方案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_send`
--

LOCK TABLES `sy_comm_send` WRITE;
/*!40000 ALTER TABLE `sy_comm_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_send_detail`
--

DROP TABLE IF EXISTS `sy_comm_send_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_send_detail` (
  `SEND_ID` varchar(40) NOT NULL COMMENT '分发主键',
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `DATA_ID` varchar(40) NOT NULL COMMENT '数据主键',
  `SEND_TIME` varchar(23) default NULL COMMENT '分发时间',
  `SEND_NUM` decimal(4,0) default NULL COMMENT '分发份数',
  `SEND_TYPE` decimal(4,0) default NULL COMMENT '办理类型 1,办件，2，阅件',
  `RECV_USER` varchar(40) default NULL COMMENT '接收用户编码',
  `RECV_UNAME` varchar(100) default NULL COMMENT '接收用户名称',
  `RECV_DEPT` varchar(40) default NULL COMMENT '接收部门编码',
  `RECV_DNAME` varchar(500) default NULL COMMENT '接收部门名称',
  `RECV_TIME` varchar(20) default NULL COMMENT '接收时间',
  `RECV_MIND` varchar(4000) default NULL COMMENT '接收意见',
  `RETN_FLAG` decimal(4,0) default NULL COMMENT '退回标志',
  `SEND_STATUS` decimal(4,0) default NULL COMMENT '发送状态，1：等待，2：发送',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_UNAME` varchar(100) default NULL COMMENT '用户名称',
  `S_DEPT` varchar(40) default NULL COMMENT '部门编码',
  `S_DNAME` varchar(100) default NULL COMMENT '部门名称',
  `S_TDEPT` varchar(40) default NULL COMMENT '有效部门编码',
  `S_TNAME` varchar(100) default NULL COMMENT '有效部门名称',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `RECV_ODEPT` varchar(40) default NULL COMMENT '接收人所在机构编码',
  `S_ODEPT` varchar(40) default NULL COMMENT '分发人机构编码；分发人所在机构编码',
  `RECV_TYPE` varchar(40) default NULL COMMENT '接收单位类别；OUTSIDE机构外，INSIDE机构内',
  `RECV_TDEPT` varchar(40) default NULL COMMENT '接收人所在部门编码',
  `RECV_TNAME` varchar(60) default NULL COMMENT '接收人所在部门名称',
  `MIND_CODE` varchar(15) default NULL COMMENT '意见编码',
  `RECV_REAL_USER` varchar(40) default NULL COMMENT '实际接收人',
  `RECV_REAL_USER_NAME` varchar(40) default NULL COMMENT '实际接收人姓名',
  PRIMARY KEY  (`SEND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分发表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_send_detail`
--

LOCK TABLES `sy_comm_send_detail` WRITE;
/*!40000 ALTER TABLE `sy_comm_send_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_send_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_send_item`
--

DROP TABLE IF EXISTS `sy_comm_send_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_send_item` (
  `ITEM_ID` varchar(40) NOT NULL COMMENT '方案明细ID',
  `SEND_ID` varchar(100) default NULL COMMENT '方案ID',
  `ROLE_USER_CODE` varchar(40) default NULL COMMENT '角色/用户/部门编码',
  `ITEM_NAME` varchar(100) default NULL COMMENT '方案明细显示名称：类型为用户，显示用户名；类型为角色，显示角色名',
  `ITEM_SORT` decimal(4,0) default NULL COMMENT '排序号',
  `DEPT_CODES` varchar(4000) default NULL COMMENT '部门编码。对于角色+部门来说，可能要保存此数据',
  `DEPT_NAMES` varchar(4000) default NULL COMMENT '部门名称。对于角色+部门来说，可能要保存此数据',
  `ITEM_TYPE` varchar(40) default NULL COMMENT '方案类型，user:用户；orle：角色；dept：部门；other_cmpy:其他单位；other_sys：系统外单位；',
  `S_ODEPT` varchar(40) default NULL COMMENT '创建人所属机构编码',
  `S_USER` varchar(40) default NULL COMMENT '创建人用户编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：启用；2：未启用',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分发明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_send_item`
--

LOCK TABLES `sy_comm_send_item` WRITE;
/*!40000 ALTER TABLE `sy_comm_send_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_send_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_tag`
--

DROP TABLE IF EXISTS `sy_comm_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_tag` (
  `TAG_ID` varchar(40) NOT NULL,
  `TAG_NAME` varchar(60) default NULL,
  `TAG_LEVEL` varchar(60) default NULL,
  `TAG_TYPE` varchar(30) default NULL,
  `TAG_GROUP` varchar(60) default NULL,
  `S_CMPY` varchar(40) default NULL,
  `S_USER` varchar(40) default NULL,
  `S_MTIME` varchar(30) default NULL,
  PRIMARY KEY  (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_tag`
--

LOCK TABLES `sy_comm_tag` WRITE;
/*!40000 ALTER TABLE `sy_comm_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_templ`
--

DROP TABLE IF EXISTS `sy_comm_templ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_templ` (
  `PT_ID` varchar(40) NOT NULL COMMENT '主键',
  `PT_TITLE` varchar(200) default NULL COMMENT '标题',
  `PT_CONTENT` varchar(4000) default NULL COMMENT '内容',
  `PT_TYPE` varchar(20) default NULL COMMENT '类型',
  `PT_PARAM` varchar(2000) default NULL COMMENT '参数设定',
  `PT_EXP` varchar(800) default NULL COMMENT '规则设定',
  `PT_TIP` varchar(400) default NULL COMMENT '模版说明',
  `USER_CODE` varchar(40) default NULL COMMENT '关联用户',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `PT_INCL_CSSJS` varchar(800) default NULL COMMENT '引入公共文件',
  `PT_TYPE_DEFAULT` varchar(4) default NULL COMMENT '类型默认 ',
  `PT_TYPE_ATTRIBUTE` varchar(20) default NULL COMMENT '类型(规则)',
  `PT_EXP_ORDER` decimal(4,0) default NULL COMMENT '规则排序',
  `PT_STYLE` varchar(200) default NULL COMMENT '模板样式',
  PRIMARY KEY  (`PT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_templ`
--

LOCK TABLES `sy_comm_templ` WRITE;
/*!40000 ALTER TABLE `sy_comm_templ` DISABLE KEYS */;
INSERT INTO `sy_comm_templ` VALUES ('1Jv5lvKbt6DrGYSxU0ZMEc','流程中心【new】','<div class=\"portal-target wp100\">\r\n	[SY_COMM_WORKFLOW_TOP]\r\n</div>\r\n<div>\r\n	<div class=\"portal-target wp69 floatLeft\">\r\n		[SY_WF_TODO]\r\n		[SY_WF_DEADLINE]\r\n		[SY_WF_MINE]\r\n	</div>\r\n	<div class=\"portal-target floatLeft\" style=\"width:30.5% \">\r\n		[SY_COMM_WORKFLOW_RIGHT]\r\n	</div>\r\n<div>','1','','','','','1','1','ruaho','2nUDp31wt8QHRUFsg8LkE_','2013-04-11 15:11:28:721','','2','',NULL,NULL),('2uyWMoDQB0LX2cL6lOQxEo','软虹默认门户','<div class=\"portal-target wp100 floatLeft\">[2Fgn7N9rJbMoy0Rndc9U14]</div><div class=\"portal-target wp67 floatLeft\">[COMPANY_INFOS]</div><div class=\"portal-target wp33 floatLeft\">[SY_COM_LINKS]</div><div class=\"portal-target wp100 floatLeft\">[NE_HOT_LIST]</div>','1','','','','','1','1','ruaho','admin','2013-09-04 10:39:05:707','','','1','1',NULL),('3ez7op2-t6TExSDZT2HmB6','系统配置[上列表下卡片]','<div class=\"portal-target wp100 floatLeft\">[SY_LIST_VIEW]</div><div class=\"portal-target wp100 floatLeft\">[SY_CARD_VIEW]</div>','1','','','','','1','1','ruaho','liujinkai','2013-03-18 17:40:28:760','','2','',NULL,NULL),('3xiR4u3q1dl8Cl35z8l3m3D','用户导航','<div class=\"portal-target wp25 floatLeft\">[SY_OPEN_TAB]</div><div class=\"portal-target wp35 floatLeft\">[SY_DOWNLOAD]</div><div class=\"portal-target wp40 floatLeft\">[SY_CM_KM]</div><div class=\"portal-target wp100 floatLeft\">[SY_QUERY_SQL]</div>','1','','','','','1','1','ruaho','admin','2013-05-09 12:38:54:523','','2','',NULL,NULL),('SY_COMMU_CENTER','通讯录【new】','<div class=\"portal-target wp100\">[SY_COMM_ADDRESS_VIEW_NEW]</div>','1','','','','','1','1','ruaho','wangchen','2013-03-28 14:10:17:218','','','',NULL,NULL),('SY_COMM_CONFIG','系统配置[左列表右卡片]','<div class=\"portal-target wp40 floatLeft\">[SY_LIST_VIEW]</div><div class=\"portal-target wp60 floatLeft\">[SY_CARD_VIEW]</div>','1','','','','','1','1','ruaho','liujinkai','2013-03-20 13:17:21:588','','2','',NULL,NULL),('SY_MSG_CENTER','消息中心','<div style=\"height: 246px;\" class=\"portal-target wp67 floatLeft\">[SY_CM_TODO_TAB][SY_COMM_ENTITY]</div><div class=\"portal-target wp33 floatLeft\">[SY_COMM_REMIND_ME][SY_COMM_SEND_REMIND]</div>','1','','','','','1','1','ruaho','yangjinyun','2013-08-20 18:39:57:185','','','',NULL,NULL),('SY_NEWS_CENTER','资讯中心','<DIV style=\"HEIGHT: 700px\" class=\"portal-target wp28 floatLeft\" sizset=\"true\" sizcache042287434697949266=\"58 16 92\">[SY_COM_CHOSEN_PT][SY_COM_NEWS_TWA]</DIV>\r\n<DIV style=\"HEIGHT: 700px\" class=\"portal-target wp40 floatLeft\" sizset=\"true\" sizcache09613337170438813=\"564 28 1439\">[NE_HOT_LIST][NE_ZIXUN][SY_COM_NEWS_TABS]</DIV>\r\n<DIV style=\"HEIGHT: 700px\" class=\"portal-target wp32 floatLeft\" sizset=\"true\" sizcache09613337170438813=\"512 28 1315\">[SY_WEATHER]</DIV>','1','{\"SY_COM_CHOSEN_PT\":{\"title\":\"u6700u65b0u8d44u8baf\",\"boxTheme\":\"portal-null\",\"imgWid\":\"300\",\"imgHei\":\"200\",\"showCount\":\"1\"},\"NE_ZIXUN\":{\"height\":\"210\",\"title\":\"u4ecau65e5u65b0u95fb\",\"boxTheme\":\"portal-null\"},\"SY_COM_NEWS_TABS\":{\"height\":\"200\",\"boxTheme\":\"portal-null\"},\"SY_WEATHER\":{\"height\":\"240\"},\"SY_COM_NEWS_TWA\":{\"height\":\"395\",\"undefined\":\"u6df1u5ea6u62a5u9053\",\"title\":\"u6df1u5ea6u62a5u9053\",\"COUNT\":\"8\"},\"NE_HOT_LIST\":{\"height\":\"160\",\"boxTheme\":\"portal-null\"}}','','资讯中心模版','','1','1','1','8542','2013-03-12 10:57:19:597','','','',NULL,NULL),('SY_TASK_CENTER','任务中心','<div class=\"portal-target wp33 floatLeft\">[SY_COMM_TASK_TODAY][SY_COMM_TASK_DONE]</div><div class=\"portal-target wp67 floatLeft\">[SY_COMM_TASK_ASSIGN][SY_COMM_TASK_UNDONE]</div>','1','','','任务中心','','1','1','ruaho','liuxinhe','2013-01-31 23:12:45:965','','','',NULL,NULL),('SY_TIME_CENTER','时间中心','<div style=\"height:800px\" class=\"portal-target wp100 floatLeft\">[SY_COMM_MEMO_PAD]</div>','1','','','','','1','1','ruaho','yangjinyun','2013-03-13 09:50:10:399','','','',NULL,NULL),('SY_USER_CENTER','个人首页','<div style=\"height: 246px;\" class=\"portal-target wp67 floatLeft\">[SY_CM_TODO_TAB][SY_COMM_ENTITY][SY_COMM_ENTITY_DONE_RUN]</div><div class=\"portal-target wp33 floatLeft\">[SY_COMM_REMIND_ME][SY_COMM_SEND_REMIND]</div>','1','','','','','1','1','ruaho','wangchen','2013-07-26 18:14:57:466','','2','4','2',NULL),('SY_WORKFLOW_CENTER','流程中心','<div class=\"portal-target wp67 floatLeft\">[SY_WORKFLOW_CENTER][SY_CM_TODO_TAB]</div>','1','{\"SY_WORKFLOW_CENTER\":{\"$MENU_ID$\":\"ruahoSY\"}}','','','','1','1','ruaho','chujie','2013-04-22 13:23:54:650','','','',NULL,NULL);
/*!40000 ALTER TABLE `sy_comm_templ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_templ_coms`
--

DROP TABLE IF EXISTS `sy_comm_templ_coms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_templ_coms` (
  `PC_ID` varchar(40) NOT NULL COMMENT '主键',
  `PC_NAME` varchar(200) default NULL COMMENT '名称',
  `PC_CON` varchar(4000) default NULL COMMENT '对应文件',
  `PC_PARAM` varchar(1000) default NULL COMMENT '参数设定',
  `PC_EXP` varchar(800) default NULL COMMENT '规则设定',
  `PC_TIP` varchar(400) default NULL COMMENT '组件说明',
  `PC_TYPE` varchar(20) default NULL COMMENT '类型',
  `PC_COMMNET` varchar(800) default NULL COMMENT '备注',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `PC_DATA` varchar(1000) default NULL COMMENT '数据对象',
  `PC_SELF_PARAM` varchar(4000) default NULL COMMENT '个性参数定义',
  `PC_SELF_PARAM_JS` varchar(2000) default NULL COMMENT '个性JS',
  `PC_USE_AREA` varchar(20) default NULL COMMENT '可应用范围 ',
  `PC_DS_LOC` varchar(10) default NULL,
  PRIMARY KEY  (`PC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板组件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_templ_coms`
--

LOCK TABLES `sy_comm_templ_coms` WRITE;
/*!40000 ALTER TABLE `sy_comm_templ_coms` DISABLE KEYS */;
INSERT INTO `sy_comm_templ_coms` VALUES ('0gKYaKXaJ2db4m85LWBTJz','搜索组件','/sy/comm/home/ftl/SY_COMM_SEARCH.ftl','height,icon,title','','','1','','2','1','ruaho','admin','2013-07-30 13:53:02:707','','','','1',''),('2l7WQ8oINdQbzZBro7N5Cr','待办_DEMO','SY_COMM_TODO_DEMO.ftl','height,icon,title','','','1','','2','1','ruaho','liujinkai','2013-03-08 17:34:39:771','SY_COMM_TODO.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\"_searchWhere\":\" and (TODO_CATALOG =0 or TODO_CATALOG =1) and OWNER_CODE=\'@USER_CODE@\'\"}','','','1',''),('2YJ-qe1Sh9gbUSNjqDjWuJ','日程安排','SY_COMM_CAL_REC_V.ftl','height,icon,title','','','1','','2','1','ruaho','chujie','2013-03-11 17:33:09:878','SY_COMM_CAL_REC_V.query.do','','','1',''),('SY_ALL_SEARCH','站内全文搜索','SY_ALL_SEARCH.ftl','height,icon,title','','站内全文搜索','1','','2','1','ruaho','admin','2013-01-19 16:27:59:826','','','','',''),('SY_BAIDU','百度搜索','','','','百度搜索','1','','2','1','1','8542','2013-01-13 21:22:02:838','<iframe src=\"http://www.baidu.com\" border=\'0\' frameborder=\'0\' width=\'100%\' height=\'300px\' scrolling=no ></iframe>','','','',''),('SY_CARD_VIEW','系统卡片','SY_CARD_VIEW.ftl','height,icon,title','','','1','','2','1','ruaho','liujinkai','2013-03-15 22:35:02:330','','','','1',''),('SY_CHART_COLUMN3D','各机构人数统计','','','','3D柱形示例','1','','2','1','ruaho','admin','2013-01-31 10:10:20:840','<iframe src=\"SY_COMM_INFO.chart.do?_PK_=SY_ORG_USER_COUNT_ORG\" border=\'0\' frameborder=\'0\' width=\'100%\' height=\'200px\' scrolling=no ></iframe>','','','',''),('SY_CHART_LINE','系统每日登录次数（本月）','','','','线形图示例','1','','2','1','1','8542','2013-03-11 17:37:40:266','<iframe src=\"SY_COMM_INFO.chart.do?_PK_=SY_ORG_LOGIN_COUNT_DAY\" border=\'0\' frameborder=\'0\' width=\'100%\' height=\'400px\' scrolling=no ></iframe>','','','',''),('SY_CHART_PIE3D','性别统计饼图','','','','示例3D饼图','1','','2','1','ruaho','admin','2013-03-11 17:55:05:557','<iframe src=\"SY_COMM_INFO.chart.do?_PK_=SY_ORG_USER_SEX\" border=\'0\' frameborder=\'0\' width=\'100%\' height=\'400px\' scrolling=no ></iframe>','','','',''),('SY_CM_TODO','待办事务','SY_COMM_TODO.ftl','icon,title,boxTheme,titleBar','','根据个人权限过滤的代办事宜','1','','2','1','1','8542','2013-03-04 16:49:26:648','SY_COMM_TODO.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\"_searchWhere\":\" and (TODO_CATALOG =0 or TODO_CATALOG =1) and OWNER_CODE=\'@USER_CODE@\'\"}','','','',''),('SY_CM_TODO_TAB','多TAB待办事务','SY_COMM_TODO_TAB.ftl','','','多TAB代办事务','1','','2','1','1','8542','2013-01-29 12:18:27:376','SY_COMM_TODO.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\"_searchWhere\":\" and (TODO_CATALOG =0 or TODO_CATALOG =1) and OWNER_CODE=\'@USER_CODE@\' and TODO_CONTENT is null\"};;SY_COMM_TODO_READ.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\"_searchWhere\":\" and TODO_CATALOG =2 and OWNER_CODE=\'@USER_CODE@\' and  TODO_CONTENT is null\"}','','','',''),('SY_COMM_BACKTIME','倒计时牌','SY_COMM_BACKTIME.ftl','height,icon,title,titleBar','','','1','','2','1','1','8542','2013-09-09 17:15:30:920','','[{\"id\":\"endTime\",\"name\":\"结束日期(到天,如：2013-2-9)\"},{\"id\":\"endTitle\",\"name\":\"到计标题\"}]','','',''),('SY_COMM_ENTITY','个人主办','SY_COMM_ENTITY.ftl','','','','1','','2','1','ruaho','2YVZnwr3135FmX_6gfbHkt','2013-08-22 16:50:45:226','SY_COMM_ENTITY.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"ENTITY_ID,TITLE,S_EMERGENCY,MEMO,SERV_ID,DATA_ID,S_USER,S_DEPT,S_TDEPT,S_ODEPT,S_CMPY,S_ATIME,SERV_NAME\",\"_searchWhere\":\"\"}','','','',''),('SY_COMM_ENTITY_DONE_RUN','已办未结','SY_COMM_ENTITY_DONE_RUN.ftl','','','','1','','2','1','ruaho','2YVZnwr3135FmX_6gfbHkt','2013-01-31 14:59:20:866','SY_COMM_ENTITY_DONE_RUN.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"ENTITY_ID,TITLE,S_EMERGENCY,MEMO,SERV_ID,DATA_ID,S_USER,S_DEPT,S_TDEPT,S_ODEPT,S_CMPY,S_ATIME,SERV_NAME\",\"_searchWhere\":\"\"}','','','',''),('SY_COMM_LIST_ZDY','自定义列表','SY_COMM_LIST_ZDY.ftl','height,icon,title','','','1','','2','1','ruaho','2nUDp31wt8QHRUFsg8LkE_','2013-04-01 14:54:22:151','$serv$.query.do?data={\"_PAGE_\":{\"SHOWNUM\":\"$shownum$\"},\"_SELECT_\":\"$select$\",\"_searchWhere\":\"$where$\"}','[	\r\n	{\"id\":\"json\",\"name\":\"json参数\",\"value\":{		\r\n		\"titleT\":\"用户表\",\r\n		\"fieldCode\":\"USER_CODE,USER_LOGIN_NAME,USER_NAME\",\r\n		\"fieldName\":\"编码,登录名称,用户名\",\r\n		\"fieldPercent\":\"40,30,25\",\r\n		\"servId\":\"SY_ORG_USER\",\r\n		\"linkField\":\"USER_CODE\"},\"type\":\"2\"\r\n	},{\"id\":\"$where$\",\"name\":\"查询条件\",\"value\":\" and 1=1\"},{\"id\":\"$serv$\",\"name\":\"服务ID\",\"value\":\"SY_ORG_USER\"},\r\n        {\"id\":\"$select$\",\"name\":\"查询字段\",\"value\":\"*\",\"type\":\"2\"},{\"id\":\"$shownum$\",\"name\":\"显示条数\",\"value\":\"6\",\"type\":\"2\"}\r\n]','','1',''),('SY_COMM_NEWS_JIAODIAN','图片切换','SY_COMM_NEWS_JIAODIAN.ftl','boxTheme,titleBar','','焦点','1','','2','1','ruaho','admin','2013-01-23 14:24:00:446','SY_COMM_NEWS.query.do?data={\"_PAGE_\":{\"SHOWNUM\":7},\"_NOPAGE_\":\"true\"}','','','',''),('SY_COMM_TASK_ASSIGN','我分配的任务','SY_COMM_TASK_ASSIGN.ftl','height,icon,title,refresh','','','1','','2','1','ruaho','liuxinhe','2013-08-15 16:18:59:495','SY_COMM_TASK_ASSIGN.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"CAL_ID,CAL_TITLE,START_TIME,END_TIME\"}','[{\"id\":\"servId\",\"value\":\"SY_COMM_TASK_ASSIGN\",\"name\":\"服务ID\"}]','','','1'),('SY_COMM_TASK_DONE','已完成任务','SY_COMM_TASK.ftl','height,icon,title','','','1','','2','1','ruaho','liuxinhe','2013-01-31 22:02:26:504','SY_COMM_TASK_DONE.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"CAL_USER_ID,CAL_ID,CAL_TITLE,START_TIME,END_TIME\"}','[{\"id\":\"servId\",\"value\":\"SY_COMM_TASK_DONE\",\"name\":\"服务ID\"}]','','',''),('SY_COMM_TASK_TODAY','今日任务','SY_COMM_TASK.ftl','height,icon,title','','','1','','2','1','ruaho','liuxinhe','2013-01-31 18:06:49:614','SY_COMM_TASK_TODAY.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"CAL_USER_ID,CAL_ID,CAL_TITLE,START_TIME,END_TIME\"}','[{\"id\":\"servId\",\"value\":\"SY_COMM_TASK_TODAY\",\"name\":\"服务ID\"}]','','',''),('SY_COMM_TASK_UNDONE','未完成任务','SY_COMM_TASK.ftl','height,icon,title,showNum','','','1','','2','1','ruaho','liuxinhe','2013-01-31 18:35:48:718','SY_COMM_TASK_UNDONE.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"CAL_USER_ID,CAL_ID,CAL_TITLE,START_TIME,END_TIME\"}','[{\"id\":\"servId\",\"value\":\"SY_COMM_TASK_UNDONE\",\"name\":\"服务ID\"}]','','',''),('SY_COMM_TIME_MARGER_VIEW','时间中心','SY_COMM_TIME_MARGER_VIEW.ftl','height,icon,title','','','1','','2','1','ruaho','2nUDp31wt8QHRUFsg8LkE_','2013-03-20 21:23:57:342','','','','1',''),('SY_COMM_TODO_AND_AGENT_MULTI','多人TAB待办委托','SY_COMM_TODO_AND_AGENT_MULTI.ftl','height,icon,title','','','1','','2','1','ruaho','wangchen','2013-03-12 14:09:58:831','SY_COMM_TODO.query.do?data={\r\n	\"_PAGE_\":{\"SHOWNUM\":8},\r\n	\"_NOPAGE_\":\"true\",\r\n	\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\r\n	\"_searchWhere\":\" and (TODO_CATALOG =0 or TODO_CATALOG =1) and OWNER_CODE=\'@USER_CODE@\' and TODO_CONTENT is null\"\r\n};;SY_ORG_USER_AGENT.getAgtUser.do?data={}','','','1',''),('SY_COMM_TODO_READ','待阅事务','SY_COMM_TODO_READ.ftl','','','获取待阅事务','1','','2','1','ruaho','2YVZnwr3135FmX_6gfbHkt','2013-01-29 12:19:16:599','SY_COMM_TODO_READ.query.do?data={\"_PAGE_\":{\"SHOWNUM\":8},\"_NOPAGE_\":\"true\",\"_SELECT_\":\"TODO_ID,OWNER_CODE,TODO_URL,TODO_CODE,TODO_SEND_TIME,TODO_CODE_NAME,TODO_OBJECT_ID1,TODO_TITLE,SEND_USER_CODE,S_EMERGENCY,TODO_CONTENT\",\"_searchWhere\":\" and TODO_CATALOG =2 and OWNER_CODE=\'@USER_CODE@\' and  TODO_CONTENT is null\"}','','','',''),('SY_COMM_WIN','win8风格区块','SY_COMM_WIN.ftl','title,boxTheme,titleBar','','','1','','2','1','1','8542','2013-04-01 10:24:06:736','','','','',''),('SY_COMM_WORK_REMIND','我被提醒的流程','SY_COMM_LIST_ZDY.ftl','height,icon,title','','','1','','2','1','ruaho','2nUDp31wt8QHRUFsg8LkE_','2013-04-02 11:40:50:860','SY_COMM_TODO.query.do?data={\"_PAGE_\":{\"SHOWNUM\":5},\"_SELECT_\":\"*\",\"_searchWhere\":\" and TODO_FROM=\'wf\'\"}','[\r\n		{\"id\":\"titleT\",\"value\":\"被提醒的流程\"},\r\n		{\"id\":\"fieldCode\",\"value\":\"TODO_TITLE,TODO_OPERATION,TODO_DEADLINE1\",\"type\":\"1\"},\r\n		{\"id\":\"fieldName\",\"value\":\"流程名称,处理环节,办理时限,超时时间\",\"type\":\"1\"},\r\n		{\"id\":\"fieldPercent\",\"value\":\"38,15,20,22\",\"type\":\"1\"},\r\n		{\"id\":\"emergField\",\"value\":\"S_EMERGENCY\"},\r\n		{\"id\":\"servId\",\"value\":\"SY_COMM_TODO\"},\r\n                {\"id\":\"servType\",\"value\":\"todo\"},\r\n                {\"id\":\"linkField\",\"value\":\"TODO_TITLE\"}\r\n]','','1',''),('SY_DOWNLOAD','文件下载','SY_DOWNLOAD.ftl','height,icon,title','','','1','','2','1','ruaho','admin','2013-05-09 12:36:51:789','','','','1',''),('SY_EXTEND_LINK','常用链接','SY_EXTEND_LINK.ftl','','','系统的快速链接','1','','2','1','1','8542','2013-01-23 15:39:56:630','','','','',''),('SY_LIST_VIEW','系统列表','SY_LIST_VIEW.ftl','height,icon,title','','','1','','2','1','ruaho','liujinkai','2013-03-15 22:21:08:627','','','','1',''),('SY_OPEN_TAB','打开新的TAB页','SY_OPEN_TAB.ftl','height,icon,title','','','1','','2','1','ruaho','admin','2013-05-09 12:31:46:157','','','','1',''),('SY_QUERY_SQL','SQL编辑器','SY_QUERY_SQL.ftl','height,icon,title','','','1','','2','1','ruaho','admin','2013-05-09 11:17:15:698','','','','1',''),('SY_WEATHER','天气情况','SY_WEATHER.ftl','','','天气预报','1','','2','1','1','8542','2012-11-07 14:31:24:066','','','','',''),('SY_WORKFLOW_CENTER_1','流程中心审批单起草组件—风格1','SY_WORKFLOW_CENTER_1.ftl','height,icon,title','','常用于流程中心，展示所有能启动的审批单。','1','','2','1','ruaho','yangjinyun','2013-03-11 22:09:02:968','SY_COMM_MENU.getMenu.do?data={\"PID\":\"$MENU_ID$\"}','[{\"id\":\"$MENU_ID$\",\"value\":\"ruahoSY\",\"name\":\"菜单虚拟节点ID\",\"type\":\"2\"},{\"id\":\"defaultMenuId\",\"value\":\"123\",\"name\":\"默认菜单ID\",\"type\":\"2\"}]','','1',''),('SY_WORKFLOW_CENTER_2','流程中心审批单起草组件—风格2','SY_WORKFLOW_CENTER_2.ftl','height,icon,title','','','1','','2','1','ruaho','yangjinyun','2013-03-11 22:09:53:481','SY_COMM_MENU.getMenu.do?data={\"PID\":\"$MENU_ID$\"}','[{\"id\":\"$MENU_ID$\",\"value\":\"ruahoSY\",\"name\":\"菜单虚拟节点ID\",\"type\":\"2\"},{\"id\":\"defaultMenuId\",\"value\":\"123\",\"name\":\"默认菜单ID\",\"type\":\"2\"}]','','1','');
/*!40000 ALTER TABLE `sy_comm_templ_coms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_todo`
--

DROP TABLE IF EXISTS `sy_comm_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_todo` (
  `TODO_ID` varchar(40) NOT NULL COMMENT '待办表主键',
  `OWNER_CODE` varchar(40) default NULL COMMENT '待办用户[角色]编码',
  `DEPT_CODE` varchar(40) default NULL COMMENT '部门编码',
  `TDEPT_CODE` varchar(40) default NULL COMMENT '有效部门编码',
  `SEND_USER_CODE` varchar(40) default NULL COMMENT '发待办的用户编码',
  `TODO_TITLE` varchar(1000) default NULL COMMENT '待办标题',
  `TODO_URL` varchar(500) default NULL COMMENT '待办链接',
  `TODO_SEND_TIME` varchar(20) default NULL COMMENT '发送时间',
  `TODO_FINISH_TIME` varchar(20) default NULL COMMENT '完成时间',
  `TODO_CODE` varchar(40) default NULL COMMENT '待办编码',
  `TODO_CODE_NAME` varchar(40) default NULL COMMENT '待办编码名称',
  `TODO_OPERATION` varchar(40) default NULL COMMENT '待办操作',
  `TODO_CATALOG` decimal(1,0) default NULL COMMENT '办件[阅件]标志；1：办件；2：阅件',
  `TODO_OBJECT_ID1` varchar(40) default NULL COMMENT '对象ID1',
  `TODO_OBJECT_ID2` varchar(40) default NULL COMMENT '对象ID2',
  `TODO_DEADLINE1` varchar(20) default NULL COMMENT '办理期限1',
  `TODO_DEADLINE2` varchar(20) default NULL COMMENT '办理期限2',
  `TODO_BENCH_FLAG` decimal(1,0) default NULL COMMENT '代理状态，1：已代理；2：未代理',
  `TODO_ACCESS_FLAG` decimal(1,0) default NULL COMMENT '访问标志，1：已访问；2：未访问',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `TODO_CONTENT` varchar(2000) default NULL COMMENT '待办内容',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `SERV_DATA_CODE` varchar(60) default NULL COMMENT '数据编号，如公文编号',
  `S_EMERGENCY` decimal(4,0) default NULL COMMENT '紧急程度',
  `TODO_FROM` varchar(23) default NULL COMMENT '待办来自哪种业务：如wf工作流，remind消息提醒',
  `AGT_USER_CODE` varchar(40) default NULL COMMENT '代办人code',
  `TODO_TYPE` varchar(40) default NULL COMMENT '待办标识，与服务提供的待办标识对应，用于分组显示待办总数',
  `TODO_LAST` decimal(4,0) default NULL COMMENT '最新标识，1：最新；0或2：不是最新',
  PRIMARY KEY  (`TODO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办事务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_todo`
--

LOCK TABLES `sy_comm_todo` WRITE;
/*!40000 ALTER TABLE `sy_comm_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_todo_draft`
--

DROP TABLE IF EXISTS `sy_comm_todo_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_todo_draft` (
  `TODO_ID` varchar(40) NOT NULL COMMENT '主办表主键',
  `OWNER_CODE` varchar(40) default NULL COMMENT '待办用户[角色]编码',
  `DEPT_CODE` varchar(40) default NULL COMMENT '部门编码',
  `TDEPT_CODE` varchar(40) default NULL COMMENT '有效部门编码',
  `SEND_USER_CODE` varchar(40) default NULL COMMENT '发待办的用户编码',
  `TODO_TITLE` varchar(1000) default NULL COMMENT '待办标题',
  `TODO_URL` varchar(500) default NULL COMMENT '待办链接',
  `TODO_SEND_TIME` varchar(20) default NULL COMMENT '发送时间',
  `TODO_FINISH_TIME` varchar(20) default NULL COMMENT '完成时间',
  `TODO_CODE` varchar(40) default NULL COMMENT '待办编码',
  `TODO_CODE_NAME` varchar(40) default NULL COMMENT '待办编码名称',
  `TODO_EMERGENCY` decimal(1,0) default NULL COMMENT '待办缓急',
  `TODO_OPERATION` varchar(40) default NULL COMMENT '待办操作',
  `TODO_OBJECT_ID1` varchar(40) default NULL COMMENT '对象ID1',
  `TODO_OBJECT_ID2` varchar(40) default NULL COMMENT '对象ID2',
  `TODO_DEADLINE1` varchar(20) default NULL COMMENT '办理期限1',
  `TODO_DEADLINE2` varchar(20) default NULL COMMENT '办理期限2',
  `TODO_BENCH_FLAG` decimal(1,0) default NULL COMMENT '代理状态，1：已代理；2：未代理',
  `TODO_ACCESS_FLAG` decimal(1,0) default NULL COMMENT '访问标志，1：已访问；2：未访问',
  `TODO_CONTENT` varchar(2000) default NULL COMMENT '内容',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `S_WF_NODE` varchar(2000) default NULL COMMENT '当前节点',
  `S_WF_USER` varchar(2000) default NULL COMMENT '当前用户',
  `S_WF_STATE` decimal(4,0) default NULL COMMENT '是否运行',
  `S_WF_INST` varchar(40) default NULL COMMENT '流程实例',
  `TODO_TYPE` varchar(40) default NULL COMMENT '待办标识，与服务提供的待办标识对应，用于分组显示待办总数',
  PRIMARY KEY  (`TODO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主办事务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_todo_draft`
--

LOCK TABLES `sy_comm_todo_draft` WRITE;
/*!40000 ALTER TABLE `sy_comm_todo_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_todo_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_todo_his`
--

DROP TABLE IF EXISTS `sy_comm_todo_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_todo_his` (
  `TODO_ID` varchar(40) NOT NULL COMMENT '待办表主键',
  `OWNER_CODE` varchar(40) default NULL COMMENT '待办用户[角色]编码',
  `DEPT_CODE` varchar(40) default NULL COMMENT '部门编码',
  `TDEPT_CODE` varchar(40) default NULL COMMENT '有效部门编码',
  `SEND_USER_CODE` varchar(40) default NULL COMMENT '发待办的用户编码',
  `TODO_TITLE` varchar(1000) default NULL COMMENT '待办标题',
  `TODO_URL` varchar(500) default NULL COMMENT '待办链接',
  `TODO_SEND_TIME` varchar(20) default NULL COMMENT '发送时间',
  `TODO_FINISH_TIME` varchar(20) default NULL COMMENT '完成时间',
  `TODO_CODE` varchar(40) default NULL COMMENT '待办编码',
  `TODO_CODE_NAME` varchar(40) default NULL COMMENT '待办编码名称',
  `TODO_OPERATION` varchar(40) default NULL COMMENT '待办操作',
  `TODO_CATALOG` decimal(1,0) default NULL COMMENT '办件[阅件]标志；1：办件；2：阅件',
  `TODO_OBJECT_ID1` varchar(40) default NULL COMMENT '对象ID1',
  `TODO_OBJECT_ID2` varchar(40) default NULL COMMENT '对象ID2',
  `TODO_DEADLINE1` varchar(20) default NULL COMMENT '办理期限1',
  `TODO_DEADLINE2` varchar(20) default NULL COMMENT '办理期限2',
  `TODO_BENCH_FLAG` decimal(1,0) default NULL COMMENT '代理状态，1：已代理；2：未代理',
  `TODO_ACCESS_FLAG` decimal(1,0) default NULL COMMENT '访问标志，1：已访问；2：未访问',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `TODO_CONTENT` varchar(2000) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `SERV_DATA_CODE` varchar(60) default NULL COMMENT '数据编号，如公文编号',
  `S_EMERGENCY` decimal(4,0) default NULL,
  `TODO_FROM` varchar(23) default NULL COMMENT '待办来自哪种业务：如wf工作流，remind消息提醒',
  `AGT_USER_CODE` varchar(40) default NULL COMMENT '代办人code',
  `TODO_TYPE` varchar(40) default NULL COMMENT '待办标识，与服务提供的待办标识对应，用于分组显示待办总数',
  PRIMARY KEY  (`TODO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办历史表[已办表]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_todo_his`
--

LOCK TABLES `sy_comm_todo_his` WRITE;
/*!40000 ALTER TABLE `sy_comm_todo_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_todo_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_comm_todo_his_v`
--

DROP TABLE IF EXISTS `sy_comm_todo_his_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_todo_his_v`*/;
/*!50001 CREATE TABLE `sy_comm_todo_his_v` (
  `TODO_ID` varchar(40),
  `OWNER_CODE` varchar(40),
  `DEPT_CODE` varchar(40),
  `TDEPT_CODE` varchar(40),
  `SEND_USER_CODE` varchar(40),
  `TODO_TITLE` varchar(1000),
  `TODO_URL` varchar(500),
  `TODO_SEND_TIME` varchar(20),
  `TODO_FINISH_TIME` varchar(20),
  `TODO_CODE` varchar(40),
  `TODO_CODE_NAME` varchar(40),
  `S_EMERGENCY` decimal(4,0),
  `TODO_OPERATION` varchar(40),
  `TODO_CATALOG` decimal(1,0),
  `TODO_OBJECT_ID1` varchar(40),
  `TODO_OBJECT_ID2` varchar(40),
  `TODO_DEADLINE1` varchar(20),
  `TODO_DEADLINE2` varchar(20),
  `TODO_BENCH_FLAG` decimal(1,0),
  `TODO_ACCESS_FLAG` decimal(1,0),
  `S_CMPY` varchar(40),
  `TODO_CONTENT` varchar(2000),
  `S_MTIME` varchar(23),
  `SERV_ID` varchar(40),
  `AGT_USER_CODE` varchar(40),
  `S_TDEPT` varchar(40),
  `S_ODEPT` varchar(40),
  `QUERY_ODEPT` varchar(40),
  `SERV_DATA_CODE` varchar(60),
  `TODO_FROM` varchar(23)
) ENGINE=MyISAM */;

--
-- Temporary table structure for view `sy_comm_todo_v`
--

DROP TABLE IF EXISTS `sy_comm_todo_v`;
/*!50001 DROP VIEW IF EXISTS `sy_comm_todo_v`*/;
/*!50001 CREATE TABLE `sy_comm_todo_v` (
  `TODO_ID` varchar(40),
  `OWNER_CODE` varchar(40),
  `DEPT_CODE` varchar(40),
  `TDEPT_CODE` varchar(40),
  `SEND_USER_CODE` varchar(40),
  `TODO_TITLE` varchar(1000),
  `TODO_URL` varchar(500),
  `TODO_SEND_TIME` varchar(20),
  `TODO_FINISH_TIME` varchar(20),
  `TODO_CODE` varchar(40),
  `TODO_CODE_NAME` varchar(40),
  `S_EMERGENCY` decimal(4,0),
  `TODO_OPERATION` varchar(40),
  `TODO_CATALOG` decimal(1,0),
  `TODO_OBJECT_ID1` varchar(40),
  `TODO_OBJECT_ID2` varchar(40),
  `TODO_DEADLINE1` varchar(20),
  `TODO_DEADLINE2` varchar(20),
  `TODO_BENCH_FLAG` decimal(1,0),
  `TODO_ACCESS_FLAG` decimal(1,0),
  `S_CMPY` varchar(40),
  `TODO_CONTENT` varchar(2000),
  `S_MTIME` varchar(23),
  `SERV_ID` varchar(40),
  `AGT_USER_CODE` varchar(40),
  `S_TDEPT` varchar(40),
  `S_ODEPT` varchar(40),
  `Query_Odept` varchar(40),
  `SERV_DATA_CODE` varchar(60),
  `TODO_FROM` varchar(23)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_comm_usual`
--

DROP TABLE IF EXISTS `sy_comm_usual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_usual` (
  `USUAL_ID` varchar(40) NOT NULL COMMENT 'ID',
  `TITLE` varchar(500) default NULL COMMENT '常用批语内容',
  `TYPE_CODE` varchar(30) default NULL COMMENT '类型编码，假设它是可以用在其它地方。例如，常用批语：MIND；',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志：1，公共；2：非公共',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_ODEPT` varchar(40) default NULL COMMENT '所属机构编码',
  `S_CMPY` varchar(40) default NULL COMMENT '所属公司编码',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `USUAL_SORT` decimal(10,0) default NULL COMMENT '常用批语排序号',
  PRIMARY KEY  (`USUAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用批语功能';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_usual`
--

LOCK TABLES `sy_comm_usual` WRITE;
/*!40000 ALTER TABLE `sy_comm_usual` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_usual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_comm_work_day`
--

DROP TABLE IF EXISTS `sy_comm_work_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_comm_work_day` (
  `DAY_ID` varchar(40) NOT NULL COMMENT '主键ID',
  `DAY_SPECIAL_DATE` varchar(20) default NULL COMMENT '日期',
  `DAY_FLAG` decimal(4,0) default NULL COMMENT '是否工作日 (1,工作日，2，放假)',
  `S_CMPY` varchar(40) default NULL COMMENT '公司CODE',
  `S_FLAG` decimal(4,0) default NULL COMMENT '是否有效 (1，是，2，否)',
  PRIMARY KEY  (`DAY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作日期设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_comm_work_day`
--

LOCK TABLES `sy_comm_work_day` WRITE;
/*!40000 ALTER TABLE `sy_comm_work_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_comm_work_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_acl`
--

DROP TABLE IF EXISTS `sy_org_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_acl` (
  `ACL_ID` varchar(40) NOT NULL COMMENT '权限控制主键',
  `SERV_ID` varchar(40) default NULL COMMENT '服务[菜单]编码',
  `ACT_CODE` varchar(40) default NULL COMMENT '操作编码',
  `ACL_TYPE` decimal(4,0) default NULL COMMENT '权限控制类型',
  `ACL_OWNER` varchar(40) default NULL COMMENT '权限所有者',
  `ACL_OTYPE` decimal(4,0) default NULL COMMENT '所有者类型，1：角色；2：部门；3用户',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `ORU_NAME` varchar(100) default NULL COMMENT '所有者名称',
  PRIMARY KEY  (`ACL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限控制列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_acl`
--

LOCK TABLES `sy_org_acl` WRITE;
/*!40000 ALTER TABLE `sy_org_acl` DISABLE KEYS */;
INSERT INTO `sy_org_acl` VALUES ('06jhkZQ6t9qV4NKiTjkkRz','100__1',NULL,'2','3','3','1',NULL),('0JctY83rpaWrBDyuVblIHX','1001007__1',NULL,'2','3','3','1',NULL),('0KWeH7kMdexENu8gNCePpd','1001012__1',NULL,'2','3','3','1',NULL),('0sNzmyLbhfioaw0HJMvKQV','1001009__1',NULL,'2','3','3','1',NULL),('0ybtzgpV5cGHoLc2ERAQ7W','1001006__1',NULL,'2','3','3','1',NULL),('1Er8bzOql6cav10ySqTI8K','1001010__1',NULL,'2','3','3','1',NULL),('1wQnxIuRV8xHm-8tKfAXw3','1001004__1',NULL,'2','3','3','1',NULL),('28Gr2inDN3mri8CpLAo2Tu','10010101__1',NULL,'2','3','3','1',NULL),('2Bt17vkRdeIXZFf1L86glF','1001002__1',NULL,'2','3','3','1',NULL),('2r4HFrvXd4OUhzQDDbnmfh','1001008__1',NULL,'2','3','3','1',NULL),('2RkZ2At0d7_VnswfDbO39T','1001003__1',NULL,'2','3','3','1',NULL),('2uVCJ9KbZeKq4Izzk2RG1y','1001011__1',NULL,'2','3','3','1',NULL),('3Kj-qlsrteypxzexz4ybrc','10010__1',NULL,'2','3','3','1',NULL);
/*!40000 ALTER TABLE `sy_org_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_cmpy`
--

DROP TABLE IF EXISTS `sy_org_cmpy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_cmpy` (
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `CMPY_NAME` varchar(40) default NULL COMMENT '公司名称',
  `CMPY_FULLNAME` varchar(100) default NULL COMMENT '公司全称',
  `CMPY_COUNTRY` varchar(30) default NULL COMMENT '所在国家',
  `CMPY_PROVINCE` varchar(30) default NULL COMMENT '所在省份',
  `CMPY_CITY` varchar(30) default NULL COMMENT '所在城市',
  `CMPY_ADDRESS` varchar(100) default NULL COMMENT '公司地址',
  `CMPY_POSTCODE` varchar(6) default NULL COMMENT '公司邮编',
  `CMPY_PHONE` varchar(40) default NULL COMMENT '公司电话',
  `CMPY_FAX` varchar(40) default NULL COMMENT '公司传真',
  `CMPY_CONTACTOR` varchar(20) default NULL COMMENT '联系人',
  `CMPY_PCODE` varchar(40) default NULL COMMENT '上级公司编码',
  `CMPY_SORT` decimal(4,0) default NULL COMMENT '公司排序',
  `CMPY_DESC` varchar(400) default NULL COMMENT '公司描述',
  `CMPY_LEVEL` decimal(1,0) default NULL COMMENT '公司级别',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `CODE_PATH` varchar(400) default NULL COMMENT '编码路径',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `PT_ID` varchar(40) default NULL COMMENT '公司模版编码',
  PRIMARY KEY  (`CMPY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_cmpy`
--

LOCK TABLES `sy_org_cmpy` WRITE;
/*!40000 ALTER TABLE `sy_org_cmpy` DISABLE KEYS */;
INSERT INTO `sy_org_cmpy` VALUES ('1','gbl_com','global company',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'1','1',NULL,'1^','2012-05-31 13:45:30:427',NULL);
/*!40000 ALTER TABLE `sy_org_cmpy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_dept`
--

DROP TABLE IF EXISTS `sy_org_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_dept` (
  `DEPT_CODE` varchar(40) NOT NULL COMMENT '部门编码',
  `DEPT_NAME` varchar(100) default NULL COMMENT '部门名称',
  `DEPT_PCODE` varchar(40) default NULL COMMENT '上级部门编码',
  `DEPT_SORT` decimal(4,0) default NULL COMMENT '部门排序号',
  `DEPT_MEMO` varchar(400) default NULL COMMENT '部门描述',
  `DEPT_EMAIL` varchar(40) default NULL COMMENT '部门邮箱',
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `CODE_PATH` varchar(4000) default NULL COMMENT '编码路径',
  `DEPT_LEVEL` decimal(4,0) default NULL COMMENT '部门层级',
  `DEPT_TYPE` decimal(4,0) default NULL COMMENT '部门类型：1：普通部门；2：机构',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `DEPT_SHORT_NAME` varchar(40) default NULL COMMENT '部门简称',
  `ODEPT_CODE` varchar(40) default NULL COMMENT '机构部门编码',
  `TDEPT_CODE` varchar(40) default NULL COMMENT '有效部门编码',
  `DEPT_SRC_TYPE1` varchar(40) default NULL COMMENT '扩展类型1',
  `DEPT_SRC_TYPE2` varchar(40) default NULL COMMENT '扩展类型2',
  `DEPT_LINE` varchar(4000) default NULL COMMENT '业务条线',
  `PT_ID` varchar(40) default NULL COMMENT '部门模版编码',
  `DEPT_FULL_NAME` varchar(200) default NULL COMMENT '部门全称',
  `DEPT_SRC_TYPE3` varchar(80) default NULL COMMENT '扩展属性3',
  `DEPT_SRC_TYPE4` varchar(80) default NULL COMMENT '扩展属性4',
  `DEPT_ENNAME` varchar(200) default NULL COMMENT '英文名称',
  `DEPT_SHORT_ENNAME` varchar(200) default NULL COMMENT '英文简称',
  PRIMARY KEY  (`DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_dept`
--

LOCK TABLES `sy_org_dept` WRITE;
/*!40000 ALTER TABLE `sy_org_dept` DISABLE KEYS */;
INSERT INTO `sy_org_dept` VALUES ('2','gbl_dept',NULL,'1',NULL,NULL,'1','1',NULL,'2^','1','2','2012-09-19 20:02:17:571','gbl_dept','2','2',NULL,NULL,NULL,NULL,'gbl_com',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sy_org_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_dept_director`
--

DROP TABLE IF EXISTS `sy_org_dept_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_dept_director` (
  `DD_ID` varchar(40) NOT NULL COMMENT '部门主管表主键',
  `DEPT_CODE` varchar(40) NOT NULL COMMENT '部门编码',
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`DD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门主管表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_dept_director`
--

LOCK TABLES `sy_org_dept_director` WRITE;
/*!40000 ALTER TABLE `sy_org_dept_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_dept_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_group`
--

DROP TABLE IF EXISTS `sy_org_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_group` (
  `GROUP_CODE` varchar(40) NOT NULL COMMENT '群组编码，UUID',
  `GROUP_NAME` varchar(80) default NULL COMMENT '群组名称',
  `GROUP_TYPE` decimal(4,0) default NULL COMMENT '群组类型',
  `GROUP_MEMO` varchar(400) default NULL COMMENT '群组说明',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：有效；2：无效',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_ODEPT` varchar(40) default NULL COMMENT '组织编码',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `GROUP_SORT` decimal(10,0) default NULL COMMENT '群组排序',
  `DATA_ID` varchar(40) default NULL COMMENT '数据主键：组织类型对应部门编码，自定义和临时类型对应创建用户编码',
  `GROUP_IMG` varchar(80) default NULL COMMENT '群组头像',
  PRIMARY KEY  (`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_group`
--

LOCK TABLES `sy_org_group` WRITE;
/*!40000 ALTER TABLE `sy_org_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_group_user`
--

DROP TABLE IF EXISTS `sy_org_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_group_user` (
  `GU_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `GROUP_CODE` varchar(40) default NULL COMMENT '群组编码，UUID',
  `USER_CODE` varchar(40) default NULL COMMENT '用户编码',
  `GU_POST` varchar(40) default NULL COMMENT '岗位',
  `GU_ADMIN` decimal(4,0) default NULL COMMENT '是否管理员，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：是；2：否',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`GU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='群组用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_group_user`
--

LOCK TABLES `sy_org_group_user` WRITE;
/*!40000 ALTER TABLE `sy_org_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_org_group_user_v`
--

DROP TABLE IF EXISTS `sy_org_group_user_v`;
/*!50001 DROP VIEW IF EXISTS `sy_org_group_user_v`*/;
/*!50001 CREATE TABLE `sy_org_group_user_v` (
  `GU_ID` varchar(40),
  `GROUP_CODE` varchar(40),
  `USER_CODE` varchar(40),
  `GU_POST` varchar(40),
  `GU_ADMIN` decimal(4,0),
  `S_FLAG` decimal(4,0),
  `S_MTIME` varchar(30),
  `GROUP_NAME` varchar(80),
  `GROUP_TYPE` decimal(4,0),
  `GROUP_SORT` decimal(10,0),
  `GROUP_FLAG` decimal(4,0),
  `S_CMPY` varchar(40),
  `USER_FLAG` decimal(4,0),
  `ODEPT_CODE` varchar(40),
  `CODE_PATH` varchar(4000)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_org_role`
--

DROP TABLE IF EXISTS `sy_org_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_role` (
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(40) default NULL COMMENT '角色名称',
  `ROLE_SORT` decimal(4,0) default NULL COMMENT '角色排序号',
  `ROLE_MEMO` varchar(400) default NULL COMMENT '角色描述',
  `ROLE_CATALOG` varchar(40) default NULL COMMENT '角色分类',
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `S_PUBLIC` decimal(1,0) default NULL COMMENT '是否公共角色，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `ROLE_SCOPE` decimal(6,0) default NULL,
  PRIMARY KEY  (`ROLE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_role`
--

LOCK TABLES `sy_org_role` WRITE;
/*!40000 ALTER TABLE `sy_org_role` DISABLE KEYS */;
INSERT INTO `sy_org_role` VALUES ('RADMIN','*系统管理','9','','1','1','1','1','3','2012-12-12 12:12:12:222','511'),('RBMLD','*部门领导','7','','1','1','1','1','3','2012-12-12 12:12:12:222','511'),('RCSLD','*处室领导','8','','1','1','1','1','3','2012-12-12 12:12:12:222','511'),('RGSLD','*公司领导','6','','1','1','1','1','3','2012-12-12 12:12:12:222','511'),('RPUB','*公共角色','1',NULL,'2','1','1','1','3','2012-12-12 12:12:12:222','511'),('RPUB1','*公共角色(一级)','2',NULL,'2','1','1','1','3','2012-12-12 12:12:12:222','511'),('RPUB2','*公共角色(二级)','3',NULL,'2','1','1','1','3','2012-12-12 12:12:12:222','511'),('RPUB3','*公共角色(三级)','4',NULL,'2','1','1','1','3','2012-12-12 12:12:12:222','511'),('RPUB4','*公共角色(四级)','5',NULL,'2','1','1','1','3','2012-12-12 12:12:12:222','511');
/*!40000 ALTER TABLE `sy_org_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_role_user`
--

DROP TABLE IF EXISTS `sy_org_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_role_user` (
  `RU_ID` varchar(40) NOT NULL COMMENT '角色用户表主键',
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `CMPY_CODE` varchar(40) default NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`RU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_role_user`
--

LOCK TABLES `sy_org_role_user` WRITE;
/*!40000 ALTER TABLE `sy_org_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_org_role_user_v`
--

DROP TABLE IF EXISTS `sy_org_role_user_v`;
/*!50001 DROP VIEW IF EXISTS `sy_org_role_user_v`*/;
/*!50001 CREATE TABLE `sy_org_role_user_v` (
  `RU_ID` varchar(40),
  `USER_CODE` varchar(40),
  `ROLE_CODE` varchar(40),
  `CMPY_CODE` varchar(40),
  `S_FLAG` decimal(4,0),
  `S_USER` varchar(40),
  `S_MTIME` varchar(23),
  `role_name` varchar(40),
  `role_sort` decimal(4,0),
  `user_name` varchar(40),
  `USER_LOGIN_NAME` varchar(40),
  `user_sort` decimal(10,0),
  `dept_code` varchar(40),
  `user_state` decimal(4,0),
  `user_s_flag` decimal(4,0),
  `tdept_code` varchar(40),
  `odept_code` varchar(40),
  `dept_level` decimal(4,0),
  `dept_sort` decimal(4,0),
  `code_path` varchar(4000)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_org_user`
--

DROP TABLE IF EXISTS `sy_org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user` (
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `USER_LOGIN_NAME` varchar(40) default NULL COMMENT '用户系统登录名',
  `USER_NAME` varchar(40) default NULL COMMENT '用户名称',
  `DEPT_CODE` varchar(40) default NULL COMMENT '部门编码',
  `USER_PASSWORD` varchar(80) default NULL COMMENT '用户密码',
  `USER_SORT` decimal(10,0) default NULL COMMENT '用户排序号',
  `USER_HOME_PHONE` varchar(40) default NULL COMMENT '家庭电话',
  `USER_MOBILE` varchar(40) default NULL COMMENT '手机号码',
  `USER_QQ` varchar(40) default NULL COMMENT '用户QQ',
  `USER_EMAIL` varchar(40) default NULL COMMENT '用户邮箱',
  `USER_WORK_LOC` varchar(40) default NULL COMMENT '工位号',
  `USER_POST` varchar(40) default NULL COMMENT '用户职位',
  `USER_POST_LEVEL` decimal(10,0) default NULL COMMENT '职位级别',
  `USER_ROOM` varchar(80) default NULL COMMENT '房间号',
  `USER_WORK_NUM` varchar(40) default NULL COMMENT '工号',
  `USER_IDCARD` varchar(18) default NULL COMMENT '身份证号',
  `USER_BIRTHDAY` varchar(20) default NULL COMMENT '出生日期',
  `USER_OFFICE_PHONE` varchar(40) default NULL COMMENT '办公电话',
  `USER_NATION` varchar(20) default NULL COMMENT '民族',
  `USER_HEIGHT` decimal(4,0) default NULL COMMENT '身高(cm)',
  `USER_SEX` decimal(4,0) default NULL COMMENT '用户性别,0:男;1:女',
  `USER_HOME_LAND` varchar(40) default NULL COMMENT '籍贯',
  `USER_POLITICS` varchar(10) default NULL COMMENT '政治面貌',
  `USER_MARRIAGE` varchar(10) default NULL COMMENT '婚姻状况',
  `USER_EDU_LEVLE` varchar(10) default NULL COMMENT '学历',
  `USER_EDU_SCHOOL` varchar(200) default NULL COMMENT '学校',
  `USER_EDU_MAJOR` varchar(200) default NULL COMMENT '专业',
  `USER_TITLE` varchar(40) default NULL COMMENT '职称',
  `USER_TITLE_DATE` varchar(20) default NULL COMMENT '职称日期',
  `USER_WORK_DATE` varchar(20) default NULL COMMENT '参加工作日期',
  `USER_CMPY_DATE` varchar(20) default NULL COMMENT '入职日期',
  `USER_STATE` decimal(4,0) default NULL COMMENT '人员状态，1：在职；2：离职；3：退休',
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `USER_LOGIN_TYPE` decimal(4,0) default NULL COMMENT '登录认证类型，1：密码；2：动态口令；3：CA认证',
  `USER_EXPIRE_DATE` varchar(20) default NULL COMMENT '用户有效日期',
  `USER_PASSWORD_DATE` varchar(20) default NULL COMMENT '密码有效日期',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `USER_IMG_SRC` varchar(100) default NULL COMMENT '用户头像源图片',
  `PT_ID` varchar(40) default NULL COMMENT '用户模版编码',
  `USER_FROM` varchar(20) default NULL COMMENT '来自哪个系统',
  `JIANGANG_FLAG` decimal(2,0) default NULL COMMENT '兼岗标记：1兼岗用户；2非兼岗用户',
  `USER_SHORT_NAME` varchar(20) default NULL COMMENT '用户简称：名称拼音首字母简写',
  `USER_EN_NAME` varchar(60) default NULL COMMENT '用户拼音：用户英文名或者拼音',
  PRIMARY KEY  (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user`
--

LOCK TABLES `sy_org_user` WRITE;
/*!40000 ALTER TABLE `sy_org_user` DISABLE KEYS */;
INSERT INTO `sy_org_user` VALUES ('3','superadmin','超级管理员','2','e10adc3949ba59abbe56e057f20f883e','500',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1',NULL,'1',NULL,NULL,'2012-12-20 11:31:22:764',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sy_org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_agent`
--

DROP TABLE IF EXISTS `sy_org_user_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_agent` (
  `AGT_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `USER_CODE` varchar(40) default NULL COMMENT '被委托人',
  `TO_USER_CODE` varchar(40) default NULL COMMENT '受委托人',
  `AGT_BEGIN_DATE` varchar(20) default NULL COMMENT '委托开始日期',
  `AGT_END_DATE` varchar(20) default NULL COMMENT '委托截至日期',
  `AGT_END_TYPE` decimal(4,0) default NULL COMMENT '如何结束委托？1：手动结束；2：自动结束',
  `AGT_NOW_TYPE` varchar(800) default NULL COMMENT '现有待办委托：1：待办事务；2：待阅事务（可多选）',
  `AGT_AFTER_TYPE` varchar(800) default NULL COMMENT '以后待办委托：1：待办事务；2：待阅事务（可多选）',
  `AGT_MEMO` varchar(4000) default NULL COMMENT '留言信息',
  `AGT_STATUS` decimal(4,0) default NULL COMMENT '委托状态，1：委托中；2：未启动；3：委托结束',
  `S_CMPY` varchar(40) default NULL COMMENT '所在公司',
  `S_USER` varchar(40) default NULL COMMENT '操作人',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：有效；2：无效',
  `TYPE_CODES` varchar(1000) default NULL COMMENT '委托事务类型（字典手工维护）,逗号分隔多种类型',
  PRIMARY KEY  (`AGT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户委托管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_agent`
--

LOCK TABLES `sy_org_user_agent` WRITE;
/*!40000 ALTER TABLE `sy_org_user_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_agt_type`
--

DROP TABLE IF EXISTS `sy_org_user_agt_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_agt_type` (
  `AGT_TYPE_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `AGT_TYPE_CODE` varchar(40) default NULL COMMENT '业务类型代码',
  `AGT_TYPE_NAME` varchar(1000) default NULL COMMENT '业务类型名称',
  `AGT_COND` varchar(1000) default NULL COMMENT '业务类型条件',
  `AGT_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_MTIME` varchar(40) default NULL COMMENT '更新时间',
  `S_USER` varchar(40) default NULL COMMENT '创建人',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：有效；2：无效',
  PRIMARY KEY  (`AGT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户委托业务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_agt_type`
--

LOCK TABLES `sy_org_user_agt_type` WRITE;
/*!40000 ALTER TABLE `sy_org_user_agt_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_agt_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_desk`
--

DROP TABLE IF EXISTS `sy_org_user_desk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_desk` (
  `SD_ID` varchar(40) NOT NULL COMMENT '主键',
  `SD_DESK_DEFAULT` varchar(20) default NULL COMMENT '默认屏幕',
  `SD_APP_DEFAULT` varchar(100) default NULL COMMENT '默认应用',
  `SD_INIT_THEME` varchar(20) default NULL COMMENT '默认主题',
  `SD_INIT_DESK` varchar(20) default NULL COMMENT '默认桌面',
  `SD_INIT_APP` varchar(4) default NULL COMMENT '初始化系统程序',
  `SD_MSG_FLAG` varchar(4) default NULL COMMENT '接受消息提醒',
  `SD_RING_FLAG` varchar(4) default NULL COMMENT '接受消息声音提醒',
  `SD_SYSTEM_THEME` varchar(40) default NULL COMMENT '系统主题',
  `SD_BACK_IMG` varchar(40) default NULL COMMENT '背景桌面',
  `SD_SELF_DEF` varchar(400) default NULL COMMENT '自定义',
  `USER_CODE` varchar(40) default NULL COMMENT '关联用户',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `SD_SELF_SELECT` varchar(100) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作台设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_desk`
--

LOCK TABLES `sy_org_user_desk` WRITE;
/*!40000 ALTER TABLE `sy_org_user_desk` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_desk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_desk_icon`
--

DROP TABLE IF EXISTS `sy_org_user_desk_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_desk_icon` (
  `PI_ID` varchar(40) NOT NULL COMMENT '主键',
  `PI_TITLE` varchar(200) default NULL COMMENT '页面标题',
  `PI_SERVS` varchar(4000) default NULL COMMENT '服务集合，逗号分隔的菜单主键信息，非节点菜单项',
  `USER_CODE` varchar(40) default NULL COMMENT '关联用户',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `PI_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `PI_NORMAO_ICON` varchar(400) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`PI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图标化首页';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_desk_icon`
--

LOCK TABLES `sy_org_user_desk_icon` WRITE;
/*!40000 ALTER TABLE `sy_org_user_desk_icon` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_desk_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_desk_mb`
--

DROP TABLE IF EXISTS `sy_org_user_desk_mb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_desk_mb` (
  `SD_ID` varchar(40) NOT NULL,
  `SD_APPS` varchar(2000) default NULL,
  `SD_INIT_DESK` varchar(20) default NULL,
  `SD_SYSTEM_THEME` varchar(40) default NULL,
  `SD_BACK_IMG` varchar(40) default NULL,
  `USER_CODE` varchar(40) default NULL,
  `S_PUBLIC` decimal(4,0) default NULL,
  `S_FLAG` decimal(4,0) default NULL,
  `S_CMPY` varchar(40) default NULL,
  `S_USER` varchar(40) default NULL,
  `S_MTIME` varchar(40) default NULL,
  PRIMARY KEY  (`SD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_desk_mb`
--

LOCK TABLES `sy_org_user_desk_mb` WRITE;
/*!40000 ALTER TABLE `sy_org_user_desk_mb` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_desk_mb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_floatmenu`
--

DROP TABLE IF EXISTS `sy_org_user_floatmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_floatmenu` (
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `COMS_ID` varchar(2000) default NULL COMMENT '组件ID',
  `COMS_NAME` varchar(2000) default NULL COMMENT '组件名称',
  PRIMARY KEY  (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_floatmenu`
--

LOCK TABLES `sy_org_user_floatmenu` WRITE;
/*!40000 ALTER TABLE `sy_org_user_floatmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_floatmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_relation`
--

DROP TABLE IF EXISTS `sy_org_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_relation` (
  `UR_ID` varchar(40) NOT NULL COMMENT '用户关系表主键',
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `ORIGIN_USER_CODE` varchar(40) NOT NULL COMMENT '原用户编码',
  `RELATION_TYPE` decimal(1,0) default NULL COMMENT '用户关系类型;0,兼职;1，移交；2，代理',
  `RELATION_BTIME` varchar(20) default NULL COMMENT '开始时间',
  `RELATION_ETIME` varchar(20) default NULL COMMENT '结束时间',
  `RELATION_MEMO` varchar(400) default NULL COMMENT '用户关系描述',
  `CMPY_CODE` varchar(40) NOT NULL COMMENT '公司编码',
  `ORIGIN_CMPY_CODE` varchar(40) NOT NULL COMMENT '原公司编码',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`UR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_relation`
--

LOCK TABLES `sy_org_user_relation` WRITE;
/*!40000 ALTER TABLE `sy_org_user_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_org_user_relation_v`
--

DROP TABLE IF EXISTS `sy_org_user_relation_v`;
/*!50001 DROP VIEW IF EXISTS `sy_org_user_relation_v`*/;
/*!50001 CREATE TABLE `sy_org_user_relation_v` (
  `UR_ID` varchar(40),
  `USER_CODE` varchar(40),
  `ORIGIN_USER_CODE` varchar(40),
  `RELATION_TYPE` decimal(1,0),
  `RELATION_BTIME` varchar(20),
  `RELATION_ETIME` varchar(20),
  `RELATION_MEMO` varchar(400),
  `CMPY_CODE` varchar(40),
  `ORIGIN_CMPY_CODE` varchar(40),
  `S_FLAG` decimal(4,0),
  `S_USER` varchar(40),
  `S_MTIME` varchar(23),
  `TDEPT_CODE` varchar(40),
  `ODEPT_CODE` varchar(40),
  `ORIG_TDEPT_CODE` varchar(40),
  `ORIG_ODEPT_CODE` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_org_user_resume`
--

DROP TABLE IF EXISTS `sy_org_user_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_resume` (
  `RSM_ID` varchar(40) NOT NULL COMMENT '主键，自增',
  `USER_CODE` varchar(40) default NULL COMMENT '用户编码',
  `RSM_BEGIN_DATE` varchar(20) default NULL COMMENT '起始日期',
  `RSM_END_DATE` varchar(20) default NULL COMMENT '截至日期',
  `RSM_COMPANY` varchar(200) default NULL COMMENT '所在公司/学校',
  `RSM_TITLE` varchar(200) default NULL COMMENT '职务',
  `RSM_MEMO` varchar(4000) default NULL COMMENT '简介',
  `RSM_WITNESS` varchar(40) default NULL COMMENT '见证人',
  `RSM_TYPE` decimal(4,0) default NULL COMMENT '类别',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`RSM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_resume`
--

LOCK TABLES `sy_org_user_resume` WRITE;
/*!40000 ALTER TABLE `sy_org_user_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_reward`
--

DROP TABLE IF EXISTS `sy_org_user_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_reward` (
  `RWD_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `USER_CODE` varchar(40) default NULL COMMENT '用户编码',
  `RWD_TITLE` varchar(80) default NULL COMMENT '奖惩称谓',
  `RWD_TYPE` decimal(4,0) default NULL COMMENT '奖惩类型，1：奖励；2：惩罚',
  `RWD_MEMO` varchar(4000) default NULL COMMENT '奖惩说明',
  `RWD_DATE` varchar(20) default NULL COMMENT '日期',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`RWD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖惩情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_reward`
--

LOCK TABLES `sy_org_user_reward` WRITE;
/*!40000 ALTER TABLE `sy_org_user_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_state`
--

DROP TABLE IF EXISTS `sy_org_user_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_state` (
  `USER_CODE` varchar(40) NOT NULL COMMENT '用户编码',
  `USER_LAST_IP` varchar(40) default NULL COMMENT '上次登录IP',
  `USER_LAST_LOGIN` varchar(30) default NULL COMMENT '上次登录时间',
  `USER_LOGIN_FAILS` decimal(4,0) default NULL COMMENT '登录失败次数',
  `MENU_TIME` varchar(30) default NULL COMMENT '菜单时间',
  `USER_AGT_FLAG` decimal(4,0) default NULL COMMENT '委托标志？ 1：是；2：否，当前是否在委托他人办理状态',
  `SUB_CODES` varchar(4000) default NULL COMMENT '代理用户列表，用户编码逗号分隔，正在被哪些人委托',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `JIAN_CODES` varchar(4000) default NULL COMMENT '兼岗用户列表，多个用户逗号分隔，第一个用户为主用户',
  `LEAD_CODES` varchar(4000) default NULL COMMENT '领导列表，本人作为哪些领导的秘书',
  `USER_SUB_FLAG` decimal(4,0) default NULL COMMENT '用户被委托标识， 1：是；2：否',
  `USER_CMLE_DEG` decimal(3,0) default NULL COMMENT '用户资料完成度',
  `USER_LAST_OS` varchar(80) default NULL COMMENT '操作系统',
  `USER_LAST_PCNAME` varchar(80) default NULL COMMENT '机器名',
  `USER_LAST_BROWSER` varchar(80) default NULL COMMENT '浏览器',
  `USER_TOKEN` varchar(200) default NULL COMMENT '用户令牌',
  `USER_LAST_CLIENT` varchar(80) default NULL COMMENT '客户端',
  `MODIFY_PASSWORD` decimal(4,0) default NULL COMMENT '修改密码',
  PRIMARY KEY  (`USER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户状态信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_state`
--

LOCK TABLES `sy_org_user_state` WRITE;
/*!40000 ALTER TABLE `sy_org_user_state` DISABLE KEYS */;
INSERT INTO `sy_org_user_state` VALUES ('3','127.0.0.1','2019-09-30 13:57:13','0','2019-09-30 13:57:13','2','','2019-09-30 13:57:16:512','','','0','0','','','','fbe0c3a2aa04e1b791632ec7b45a8d73','','1');
/*!40000 ALTER TABLE `sy_org_user_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_style`
--

DROP TABLE IF EXISTS `sy_org_user_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_style` (
  `SS_ID` varchar(40) NOT NULL COMMENT '主键',
  `SS_STYLE_MENU` varchar(40) default NULL COMMENT '菜单(风格定义)',
  `SS_STYLE_BACK` varchar(40) default NULL COMMENT '背景(风格定义)',
  `SS_STYLE_BLOCK` varchar(40) default NULL COMMENT '信息块(风格定义)',
  `USER_CODE` varchar(40) default NULL COMMENT '关联用户',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SS_STYLE_PORTAL` varchar(2000) default NULL,
  PRIMARY KEY  (`SS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风格定义设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_style`
--

LOCK TABLES `sy_org_user_style` WRITE;
/*!40000 ALTER TABLE `sy_org_user_style` DISABLE KEYS */;
INSERT INTO `sy_org_user_style` VALUES ('3','','','','','0','1','1','3','2019-09-30 13:57:16:193','');
/*!40000 ALTER TABLE `sy_org_user_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_type_agent`
--

DROP TABLE IF EXISTS `sy_org_user_type_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_type_agent` (
  `AGT_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `USER_CODE` varchar(40) default NULL COMMENT '被委托人',
  `AGT_BEGIN_DATE` varchar(20) default NULL COMMENT '委托开始日期',
  `AGT_END_DATE` varchar(20) default NULL COMMENT '委托截至日期',
  `AGT_END_TYPE` decimal(4,0) default NULL COMMENT '如何结束委托？1：手动结束；2：自动结束',
  `AGT_MEMO` varchar(4000) default NULL COMMENT '留言信息',
  `AGT_STATUS` decimal(4,0) default NULL COMMENT '委托状态，1：委托中；2：未开始；3：委托结束',
  `S_CMPY` varchar(40) default NULL COMMENT '所在公司',
  `S_USER` varchar(40) default NULL COMMENT '操作人',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：有效；2：无效',
  `REAL_END_DATE` varchar(20) default NULL COMMENT '实际结束时间',
  `AGT_CURRTODO_FLAG` decimal(4,0) default NULL COMMENT '是否交办当前待办，1：是；2否',
  PRIMARY KEY  (`AGT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户业务委托管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_type_agent`
--

LOCK TABLES `sy_org_user_type_agent` WRITE;
/*!40000 ALTER TABLE `sy_org_user_type_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_type_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_org_user_type_agent_rel`
--

DROP TABLE IF EXISTS `sy_org_user_type_agent_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_user_type_agent_rel` (
  `RE_AGT_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `AGT_ID` varchar(40) default NULL COMMENT '外键，UUID',
  `USER_CODE` varchar(40) default NULL COMMENT '委托人',
  `FROM_USER_CODE` varchar(40) default NULL COMMENT '起委托人',
  `TO_USER_CODE` varchar(40) default NULL COMMENT '受委托人',
  `AGT_TYPE_CODE` varchar(40) default NULL COMMENT '委托业务类型代码',
  `AGT_USER_PATH` varchar(4000) default NULL COMMENT '委托用户路径',
  `AGT_STATUS` decimal(4,0) default NULL COMMENT '委托状态，1：委托中；2：未开始；3：委托结束',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：有效；2：无效',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_MTIME` varchar(40) default NULL COMMENT '更新时间',
  `S_USER` varchar(40) default NULL COMMENT '创建人',
  `REAGT_ID_PATH` varchar(4000) default NULL COMMENT '委托主键路径',
  `SRC_AGT_ID` varchar(40) default NULL COMMENT '起始点外键，UUID',
  `AGT_BEGIN_DATE` varchar(20) default NULL COMMENT '委托开始日期',
  `AGT_END_DATE` varchar(20) default NULL COMMENT '委托结束日期',
  `VALID_BEGIN_DATE` varchar(20) default NULL COMMENT '有效开始日期',
  `VALID_END_DATE` varchar(20) default NULL COMMENT '有效结束日期',
  `LAST_REAGT_ID` varchar(40) default NULL COMMENT '上一个节点主键，UUID',
  `REAL_END_DATE` varchar(20) default NULL COMMENT '实际结束时间',
  PRIMARY KEY  (`RE_AGT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户业务委托管理关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_user_type_agent_rel`
--

LOCK TABLES `sy_org_user_type_agent_rel` WRITE;
/*!40000 ALTER TABLE `sy_org_user_type_agent_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_user_type_agent_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_org_user_type_agent_rel_v`
--

DROP TABLE IF EXISTS `sy_org_user_type_agent_rel_v`;
/*!50001 DROP VIEW IF EXISTS `sy_org_user_type_agent_rel_v`*/;
/*!50001 CREATE TABLE `sy_org_user_type_agent_rel_v` (
  `RE_AGT_ID` varchar(40),
  `AGT_ID` varchar(40),
  `USER_CODE` varchar(40),
  `FROM_USER_CODE` varchar(40),
  `TO_USER_CODE` varchar(40),
  `AGT_TYPE_CODE` varchar(40),
  `AGT_USER_PATH` varchar(4000),
  `AGT_STATUS` decimal(4,0),
  `S_FLAG` decimal(4,0),
  `S_CMPY` varchar(40),
  `S_MTIME` varchar(40),
  `S_USER` varchar(40),
  `REAGT_ID_PATH` varchar(4000),
  `SRC_AGT_ID` varchar(40),
  `AGT_BEGIN_DATE` varchar(20),
  `AGT_END_DATE` varchar(20),
  `VALID_BEGIN_DATE` varchar(20),
  `VALID_END_DATE` varchar(20),
  `LAST_REAGT_ID` varchar(40),
  `MEMO_S` varchar(4000)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_org_work_handover`
--

DROP TABLE IF EXISTS `sy_org_work_handover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_org_work_handover` (
  `HO_ID` varchar(40) NOT NULL COMMENT 'ID',
  `ORIG_USER_CODE` varchar(40) NOT NULL COMMENT '移交用户ID',
  `ORIG_USER_NAME` varchar(40) default NULL COMMENT '移交用户姓名',
  `ORIG_ODEPT_CODE` varchar(40) NOT NULL COMMENT '移交用户机构ID',
  `TARGET_USER_CODE` varchar(40) NOT NULL COMMENT '接收用户ID',
  `TARGET_USER_NAME` varchar(40) default NULL COMMENT '接收用户姓名',
  `TARGET_ODEPT_CODE` varchar(40) NOT NULL COMMENT '接受用户机构ID',
  `S_USER` varchar(40) NOT NULL COMMENT '操作用户',
  `S_ATIME` varchar(23) NOT NULL COMMENT '操作时间',
  PRIMARY KEY  (`HO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作移交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_org_work_handover`
--

LOCK TABLES `sy_org_work_handover` WRITE;
/*!40000 ALTER TABLE `sy_org_work_handover` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_org_work_handover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_report`
--

DROP TABLE IF EXISTS `sy_plug_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_report` (
  `REPORT_NAME` varchar(120) NOT NULL COMMENT '报表名称',
  `REPORT_PRODUCT` varchar(40) NOT NULL COMMENT '报表类型',
  `REPORT_FILE` varchar(200) NOT NULL COMMENT '报表文件名称',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_UNAME` varchar(40) default NULL COMMENT '最后修改用户名称',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  `REPORT_CODE` varchar(120) NOT NULL COMMENT '编码',
  PRIMARY KEY  (`REPORT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_report`
--

LOCK TABLES `sy_plug_report` WRITE;
/*!40000 ALTER TABLE `sy_plug_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_report_item`
--

DROP TABLE IF EXISTS `sy_plug_report_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_report_item` (
  `ID` varchar(120) NOT NULL COMMENT '主键',
  `REPORT_CODE` varchar(40) default NULL COMMENT '报表编码',
  `ARG_NAME` varchar(120) default NULL COMMENT '参数名称',
  `ARG_CODE` varchar(120) default NULL COMMENT '参数编码',
  `ARG_TYPE` varchar(120) default NULL COMMENT '参数类型',
  `DEFAULT_VALUE` varchar(40) default NULL COMMENT '缺省值',
  `INPUT_MODE` varchar(200) default NULL COMMENT '输入模式',
  `ACTIVE` decimal(4,0) default NULL COMMENT '是否启用',
  `INPUT_CONFIG` varchar(2000) default NULL COMMENT '输入配置',
  `INPUT_TYPE` varchar(40) default NULL COMMENT '输入类型',
  `ARG_COLS` decimal(4,0) default NULL COMMENT '参数项占用列数',
  `S_USER` varchar(40) default NULL,
  `S_UNAME` varchar(40) default NULL,
  `S_CMPY` varchar(40) default NULL,
  `S_MTIME` varchar(23) default NULL,
  `S_FLAG` decimal(4,0) default NULL,
  `COL_WIDTH` decimal(4,0) default NULL COMMENT '参数宽度',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表配置项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_report_item`
--

LOCK TABLES `sy_plug_report_item` WRITE;
/*!40000 ALTER TABLE `sy_plug_report_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_report_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_search_custom`
--

DROP TABLE IF EXISTS `sy_plug_search_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_search_custom` (
  `ID` varchar(120) NOT NULL COMMENT '主键',
  `KEYWORD` varchar(120) default NULL COMMENT '关键词',
  `FIELD` varchar(200) default NULL COMMENT '关键词位置',
  `SERVICE` varchar(2000) default NULL COMMENT '限定搜索的数据源',
  `ORDER_FIELD` varchar(2000) default NULL COMMENT '结果排序方式',
  `SORT` decimal(4,0) default NULL COMMENT '排序',
  `DATA_LIMIT` decimal(4,0) default NULL COMMENT '结果显示条数',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_UNAME` varchar(40) default NULL COMMENT '最后修改用户名称',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个性化搜索';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_search_custom`
--

LOCK TABLES `sy_plug_search_custom` WRITE;
/*!40000 ALTER TABLE `sy_plug_search_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_search_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_search_link`
--

DROP TABLE IF EXISTS `sy_plug_search_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_search_link` (
  `LINK_ID` varchar(40) NOT NULL COMMENT '关联主键,UUID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务主键',
  `LINK_SERV_ID` varchar(40) default NULL COMMENT '关联服务主键',
  `LINK_TITLE` varchar(400) default NULL COMMENT '检索标题，支持变量替换',
  `LINK_COUNT` decimal(4,0) default NULL COMMENT '关联类型，1：SQL关联；2：检索关联',
  `LINK_ORDER` decimal(4,0) default NULL COMMENT '关联排序',
  `LINK_WHERE` varchar(400) default NULL COMMENT 'Where过滤条件',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：是；2：否',
  `LINK_CONDITION` varchar(800) default NULL COMMENT '有效表达式，js格式，支持变量替换',
  `LINK_URL` varchar(400) default NULL COMMENT '链接URL',
  `LINK_MORE_URL` varchar(400) default NULL COMMENT '更多URL',
  `LINK_DYNAMIC` decimal(4,0) default NULL COMMENT '是否动态判断？，1：是（查询时检查）；2：否（索引时坚持）',
  PRIMARY KEY  (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检索关联服务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_search_link`
--

LOCK TABLES `sy_plug_search_link` WRITE;
/*!40000 ALTER TABLE `sy_plug_search_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_search_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_search_webcraw`
--

DROP TABLE IF EXISTS `sy_plug_search_webcraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_search_webcraw` (
  `ID` varchar(120) NOT NULL COMMENT '主键',
  `NAME` varchar(120) default NULL COMMENT '显示名称',
  `HOST` varchar(200) default NULL COMMENT '网站地址',
  `CRAWL_URL` varchar(2000) default NULL COMMENT '起始抓取URL',
  `URL_FILTER` varchar(2000) default NULL COMMENT 'url过滤规则',
  `TITLE_PRE_TAG` varchar(500) default NULL COMMENT '标题截取前缀',
  `TITLE_POST_TAG` varchar(500) default NULL COMMENT '标题截取后缀',
  `TITLE_REGEXP` varchar(100) default NULL COMMENT '标题截取正则',
  `CONTENT_PRE_TAG` varchar(500) default NULL COMMENT '内容截取前缀',
  `CONTENT_POST_TAG` varchar(500) default NULL COMMENT '内容截取后缀',
  `CONTENT_REGEXP` varchar(100) default NULL COMMENT '内容截取正则',
  `CATEGORYS_CONF` varchar(3000) default NULL COMMENT '栏目配置，例：<category name="政务工作" reg-exp=".*/tab60/.*" />',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `GRANTEE_TYPE` varchar(4) default NULL,
  `GRANTEE` varchar(3000) default NULL,
  `CRAWL_DEPTH` decimal(4,0) default NULL COMMENT 'crawlDepth',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站抓取';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_search_webcraw`
--

LOCK TABLES `sy_plug_search_webcraw` WRITE;
/*!40000 ALTER TABLE `sy_plug_search_webcraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_search_webcraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_plug_search_word`
--

DROP TABLE IF EXISTS `sy_plug_search_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_plug_search_word` (
  `WORD_ID` varchar(40) NOT NULL COMMENT '主键，自增',
  `WORD_CODE` varchar(80) default NULL COMMENT '词语',
  `WORD_LENGTH` decimal(4,0) default NULL COMMENT '长度',
  `WORD_ORDER` decimal(10,0) default NULL COMMENT '排序',
  `WORD_TYPE` varchar(40) default NULL COMMENT '分类',
  `WORD_FLAG` decimal(4,0) default NULL COMMENT '同步标志，1：已同步；2：未同步',
  PRIMARY KEY  (`WORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全文检索词库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_plug_search_word`
--

LOCK TABLES `sy_plug_search_word` WRITE;
/*!40000 ALTER TABLE `sy_plug_search_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_plug_search_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_blob_triggers`
--

LOCK TABLES `sy_qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_calendars`
--

DROP TABLE IF EXISTS `sy_qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_calendars`
--

LOCK TABLES `sy_qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_cron_triggers`
--

LOCK TABLES `sy_qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` decimal(13,0) NOT NULL,
  `PRIORITY` decimal(13,0) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) default NULL,
  `JOB_GROUP` varchar(200) default NULL,
  `IS_NONCONCURRENT` varchar(1) default NULL,
  `REQUESTS_RECOVERY` varchar(1) default NULL,
  PRIMARY KEY  (`ENTRY_ID`,`SCHED_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_fired_triggers`
--

LOCK TABLES `sy_qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_job_details`
--

DROP TABLE IF EXISTS `sy_qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_job_details`
--

LOCK TABLES `sy_qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_locks`
--

DROP TABLE IF EXISTS `sy_qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY  (`LOCK_NAME`,`SCHED_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_locks`
--

LOCK TABLES `sy_qrtz_locks` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `sy_qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY  (`TRIGGER_GROUP`,`SCHED_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_paused_trigger_grps`
--

LOCK TABLES `sy_qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `sy_qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` decimal(13,0) NOT NULL,
  `CHECKIN_INTERVAL` decimal(13,0) NOT NULL,
  PRIMARY KEY  (`INSTANCE_NAME`,`SCHED_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_scheduler_state`
--

LOCK TABLES `sy_qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` decimal(7,0) NOT NULL,
  `REPEAT_INTERVAL` decimal(12,0) NOT NULL,
  `TIMES_TRIGGERED` decimal(10,0) NOT NULL,
  PRIMARY KEY  (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_simple_triggers`
--

LOCK TABLES `sy_qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) default NULL,
  `STR_PROP_2` varchar(512) default NULL,
  `STR_PROP_3` varchar(512) default NULL,
  `INT_PROP_1` decimal(10,0) default NULL,
  `INT_PROP_2` decimal(10,0) default NULL,
  `LONG_PROP_1` decimal(13,0) default NULL,
  `LONG_PROP_2` decimal(13,0) default NULL,
  `DEC_PROP_1` decimal(13,4) default NULL,
  `DEC_PROP_2` decimal(13,4) default NULL,
  `BOOL_PROP_1` varchar(1) default NULL,
  `BOOL_PROP_2` varchar(1) default NULL,
  PRIMARY KEY  (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_simprop_triggers`
--

LOCK TABLES `sy_qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_qrtz_triggers`
--

DROP TABLE IF EXISTS `sy_qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `NEXT_FIRE_TIME` decimal(13,0) default NULL,
  `PREV_FIRE_TIME` decimal(13,0) default NULL,
  `PRIORITY` decimal(13,0) default NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` decimal(13,0) NOT NULL,
  `END_TIME` decimal(13,0) default NULL,
  `CALENDAR_NAME` varchar(200) default NULL,
  `MISFIRE_INSTR` decimal(2,0) default NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_qrtz_triggers`
--

LOCK TABLES `sy_qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `sy_qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv`
--

DROP TABLE IF EXISTS `sy_serv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv` (
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `SERV_TYPE` decimal(4,0) default NULL COMMENT '服务类型  1：服务；2：报表；3：数据表；4：自定义',
  `SERV_NAME` varchar(80) default NULL COMMENT '服务名称',
  `SERV_PID` varchar(40) default NULL COMMENT '父服务编码',
  `TABLE_VIEW` varchar(40) default NULL COMMENT '查询表名  select时用到的表或者视图名',
  `TABLE_ACTION` varchar(40) default NULL COMMENT '操作表名  修改或删除时用到的表名',
  `SERV_SQL_WHERE` varchar(200) default NULL COMMENT 'WHERE条件',
  `SERV_DATA_SOURCE` varchar(40) default NULL COMMENT '数据源编码',
  `SERV_KEYS` varchar(200) default NULL COMMENT '主键信息  多个主键用逗号分隔',
  `SERV_LIST_STYLE` varchar(400) default NULL COMMENT '列表样式定义',
  `SERV_PAGE_COUNT` decimal(4,0) default NULL COMMENT '每页记录数',
  `SERV_JS` varchar(1000) default NULL COMMENT '卡片扩展HTML',
  `SERV_LIST_LOAD` varchar(400) default NULL COMMENT '列表装载JS',
  `SERV_CARD_LOAD` varchar(400) default NULL COMMENT '卡片装载JS',
  `SERV_CARD_STYLE` decimal(4,0) default NULL COMMENT '卡片页面列数',
  `SERV_CLASS` varchar(100) default NULL COMMENT '服务扩展类',
  `SERV_CACHE_FLAG` decimal(4,0) default NULL COMMENT '缓存标志  1：缓存（随用随装载）；2：不装载（缺省）3：缓存（全部装载）',
  `SERV_LOCK_FLAG` decimal(4,0) default NULL COMMENT '乐观锁判断  1：启用锁定判断；2：不判断',
  `SERV_DELETE_FLAG` decimal(4,0) default NULL COMMENT '假删除判断  1：启用假删除及S_FLAG；2：不启用',
  `SERV_AUTH_FLAG` decimal(4,0) default NULL COMMENT '权限判断 1：session判断  2：服务权限；3：操作权限；4：数据权限；9：不 判断',
  `SERV_NAV_ITEMS` varchar(400) default NULL COMMENT '左侧导航字段，多个逗号分隔',
  `SERV_MEMO` varchar(2000) default NULL COMMENT '服务说明',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '创建者',
  `SERV_SQL_ORDER` varchar(200) default NULL COMMENT 'ORDERBY语句',
  `SERV_DICT_CACHE` varchar(400) default NULL COMMENT '字典缓存，支持多个字典编码，逗号分隔，修改数据后会自动清除对应字典的缓存',
  `SERV_SEARCH_FLAG` decimal(4,0) default NULL COMMENT '全文索引标志，1：启用；2：禁用（缺省）',
  `SERV_SRC_ID` varchar(40) default NULL COMMENT '引用自服务？（共享附件设置）',
  `SERV_CMPY` varchar(40) default NULL COMMENT '公司字段，用于区分多组织，装载对应字典',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SERV_MOBILE_LIST` varchar(2000) default NULL COMMENT '移动列表格式，HTML代码，自定义移动列表显示格式',
  `SERV_DATA_TITLE` varchar(400) default NULL COMMENT '标题格式，支持多个字段组合格式',
  `SERV_CARD_TMPL` varchar(100) default NULL COMMENT '卡片模版？ 1：是；2：否',
  `SERV_DATA_CODE` varchar(200) default NULL COMMENT '编码格式',
  `SERV_QUERY_MODE` decimal(4,0) default NULL COMMENT '查询模式，1：简洁模式；2：平铺模式；3：窗口模式',
  `SERV_RED_HEAD` varchar(200) default NULL COMMENT '红头文字',
  `SERV_CARD_TMPL_CODES` varchar(1000) default NULL COMMENT '模版表达式，多卡片模版选择表达式，JSON列表格式，按顺序执行。',
  `SERV_WF_FLAG` decimal(4,0) default NULL COMMENT '流程标志：1.自动启动流程；2.手动或不启动流程',
  `SERV_FILE_PATH` varchar(400) default NULL COMMENT '文件路径',
  `SERV_NO_COUNT` decimal(4,0) default NULL COMMENT '查询不计总数？1：是；2：否（缺省）',
  `PRO_FLAG` decimal(4,0) default NULL COMMENT '产品标识？1：是；2：否',
  `SAFE_FLAG` decimal(4,0) default NULL COMMENT '安全html?, 1:是；2：否（缺省），启用后用户输入的<和>会被转换为安全格式',
  `TODO_TYPE` varchar(40) default NULL COMMENT '待办标识，与待办结合用于分组显示待办总数，不设置的话缺省使用SERV_SRC_ID',
  `SERV_MOBILE_JS` varchar(1000) default NULL COMMENT '卡片移动HTML,HTML语法，支持扩展CSS和JS',
  PRIMARY KEY  (`SERV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv`
--

LOCK TABLES `sy_serv` WRITE;
/*!40000 ALTER TABLE `sy_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_act`
--

DROP TABLE IF EXISTS `sy_serv_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_act` (
  `ACT_ID` varchar(40) NOT NULL COMMENT '操作主键，自增',
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `ACT_CODE` varchar(40) NOT NULL COMMENT '操作编码',
  `ACT_NAME` varchar(40) default NULL COMMENT '操作名称',
  `ACT_TYPE` decimal(4,0) default NULL COMMENT '操作类型  1:按钮列表；2:按钮卡片；3:非按钮',
  `ACT_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `ACT_LOG_FLAG` decimal(4,0) default NULL COMMENT '操作留痕  1:留痕；2:不留痕',
  `ACT_EXPRESSION` varchar(200) default NULL COMMENT '操作表达式  支持系统变量和数据变量',
  `ACT_HOT_KEY` varchar(20) default NULL COMMENT '热键',
  `ACT_MEMO` varchar(400) default NULL COMMENT '操作说明',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `ACT_CSS` varchar(200) default NULL COMMENT '按钮样式，采用样式类名',
  `ACT_GROUP` decimal(4,0) default NULL COMMENT '是否编辑组？，1：是；2：否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `ACT_EXPRESSION_FLAG` decimal(4,0) default NULL COMMENT '和操作表达式配合使用，1.是: 默认值，后台判断执行 2.否: 后台忽略执行',
  `ACT_WS_FLAG` decimal(4,0) default NULL COMMENT '启用WebService？',
  `ACT_WS_RESULT` varchar(4000) default NULL COMMENT 'WebServie结果',
  `ACT_TIP` varchar(400) default NULL COMMENT '提示说明',
  `ACT_MOBILE_FLAG` varchar(40) default NULL COMMENT '移动标志，1：是（缺省）；2：否',
  PRIMARY KEY  (`ACT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务按钮';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_act`
--

LOCK TABLES `sy_serv_act` WRITE;
/*!40000 ALTER TABLE `sy_serv_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_act_param`
--

DROP TABLE IF EXISTS `sy_serv_act_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_act_param` (
  `PARAM_ID` varchar(40) NOT NULL COMMENT '主键，UUID',
  `ACT_ID` varchar(40) default NULL COMMENT '操作主键，自增',
  `PARAM_CODE` varchar(40) default NULL COMMENT '参数值',
  `PARAM_TYPE` varchar(20) default NULL COMMENT '参数类型',
  `PARAM_FORMAT` varchar(4000) default NULL COMMENT '参数格式',
  `PARAM_MEMO` varchar(4000) default NULL COMMENT '参数描述',
  `PARAM_MUST` decimal(4,0) default NULL COMMENT '是否必须？ 1：是；2：否（缺省）',
  `PARAM_ORDER` decimal(4,0) default NULL COMMENT '参数排序',
  PRIMARY KEY  (`PARAM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_act_param`
--

LOCK TABLES `sy_serv_act_param` WRITE;
/*!40000 ALTER TABLE `sy_serv_act_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_act_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_comment`
--

DROP TABLE IF EXISTS `sy_serv_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_comment` (
  `C_ID` varchar(40) NOT NULL COMMENT '主键ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `C_CONTENT` varchar(4000) default NULL COMMENT '评论内容',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_ODEPT` varchar(40) default NULL COMMENT '机构编码',
  `S_TDEPT` varchar(40) default NULL COMMENT '有效部门',
  `S_DEPT` varchar(40) default NULL COMMENT '所属部门',
  `S_USER` varchar(40) default NULL COMMENT '提问用户',
  `S_FLAG` decimal(4,0) default NULL COMMENT '是否有效 (1,是;2,否)',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `C_STATUS` varchar(40) default NULL COMMENT '评论所属状态：1，已审核；2，未审核',
  `LIKE_VOTE` decimal(5,0) default NULL COMMENT '支持数量',
  `DISLIKE_VOTE` decimal(5,0) default NULL COMMENT '反对数量',
  `REPLY_TO` varchar(40) default NULL COMMENT '对XX的回应',
  `S_CTIME` varchar(23) default NULL COMMENT '创建时间',
  `C_NUMBER` decimal(5,0) default NULL COMMENT '评论编号',
  `S_UNAME` varchar(40) default NULL COMMENT '提问用户名称',
  `C_QUOTE_CONTENT` longtext,
  `ACL_TYPE` decimal(4,0) default NULL COMMENT '权限类型',
  PRIMARY KEY  (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_comment`
--

LOCK TABLES `sy_serv_comment` WRITE;
/*!40000 ALTER TABLE `sy_serv_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_comment_vote`
--

DROP TABLE IF EXISTS `sy_serv_comment_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_comment_vote` (
  `VOTE_ID` varchar(40) NOT NULL COMMENT '主键',
  `VOTE_IP` varchar(40) default NULL COMMENT '投票IP',
  `VOTE_USER` varchar(40) default NULL COMMENT '投票用户',
  `VOTE_VALUE` decimal(4,0) default NULL COMMENT '投票性质? 1:支持,2:反对',
  `COMMENT_ID` varchar(40) default NULL COMMENT '评论ID',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_UNAME` varchar(40) default NULL COMMENT '最后修改用户名称',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_CTIME` varchar(23) default NULL COMMENT '创建时间',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标识，1：正常，2：删除',
  PRIMARY KEY  (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论投票结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_comment_vote`
--

LOCK TABLES `sy_serv_comment_vote` WRITE;
/*!40000 ALTER TABLE `sy_serv_comment_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_comment_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_dacl_item`
--

DROP TABLE IF EXISTS `sy_serv_dacl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_dacl_item` (
  `ACL_ID` varchar(40) NOT NULL COMMENT '栏目权限ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `ACL_TYPE` varchar(40) default NULL COMMENT '权限类别：用户自定义的，例如：浏览、发布、管理',
  `ACL_OWNER` varchar(40) default NULL COMMENT '授权主体CODE：角色、部门、用户。分别以R_、D_、U_为前缀',
  `DATA_ID` varchar(40) default NULL COMMENT '服务实例数据ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者CODE',
  PRIMARY KEY  (`ACL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_dacl_item`
--

LOCK TABLES `sy_serv_dacl_item` WRITE;
/*!40000 ALTER TABLE `sy_serv_dacl_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_dacl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_dict`
--

DROP TABLE IF EXISTS `sy_serv_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_dict` (
  `DICT_ID` varchar(40) NOT NULL COMMENT '字典主键',
  `DICT_NAME` varchar(40) default NULL COMMENT '字典名称',
  `DICT_IS_INNER` decimal(4,0) default NULL COMMENT '内部字典？，1：是；2：否',
  `DICT_TYPE` decimal(4,0) default NULL COMMENT '字典类型，1：列表；2：树；3：叶子',
  `TABLE_ID` varchar(40) default NULL COMMENT '所在表主键',
  `TABLE_SELECT` varchar(400) default NULL COMMENT '查询结果字段',
  `TABLE_WHERE` varchar(400) default NULL COMMENT '过滤条件',
  `TABLE_ORDER` varchar(400) default NULL COMMENT '排序字段',
  `DICT_F_ID` varchar(40) default NULL COMMENT '主键字段',
  `DICT_F_NAME` varchar(40) default NULL COMMENT '名称字段',
  `DICT_F_PARENT` varchar(40) default NULL COMMENT '父字段',
  `DICT_F_LEAF` varchar(40) default NULL COMMENT '叶子节点字段',
  `DICT_F_FLAG` varchar(40) default NULL COMMENT '启用标志字段',
  `DICT_LOAD_TYPE` decimal(4,0) default NULL COMMENT '装载方式，1：启动装载（缺省）；2：用时装载',
  `DICT_DIS_FORMAT` varchar(200) default NULL COMMENT '显示格式，支持CODE、NAME、IMG的替换',
  `DICT_DIS_LAYER` decimal(4,0) default NULL COMMENT '显示层级，显示几个层级数据字典',
  `DICT_NAME_LAYER` decimal(4,0) default NULL COMMENT '显示层级，在当前名字上显示几个层级',
  `DICT_CHILD_ID` varchar(40) default NULL COMMENT '子字典主键',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `DICT_F_CMPY` varchar(40) default NULL COMMENT '公司字段',
  `DICT_F_PATH` varchar(40) default NULL COMMENT '编码路径字段',
  `DICT_F_LEVEL` varchar(40) default NULL COMMENT '层级字段',
  `DICT_DATA_SOURCE` varchar(40) default NULL COMMENT '字典对应数据源',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `DICT_ROOT` varchar(40) default NULL COMMENT '动态根节点，支持变量替换。',
  `DICT_EXPRESSION` varchar(400) default NULL COMMENT '数据表达式，符合条件的进行展示。',
  `DICT_CLASS` varchar(200) default NULL COMMENT '监听类，用于对字典数据进行特定处理',
  `DICT_SRC_ID` varchar(40) default NULL COMMENT '引用字典数据，本字典采用指定字典的数据，使用自身设定的动态根和过滤规则等',
  `PRO_FLAG` decimal(4,0) default NULL COMMENT '产品标识，1：是；2：否',
  PRIMARY KEY  (`DICT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_dict`
--

LOCK TABLES `sy_serv_dict` WRITE;
/*!40000 ALTER TABLE `sy_serv_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_dict_item`
--

DROP TABLE IF EXISTS `sy_serv_dict_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_dict_item` (
  `ITEM_ID` varchar(40) NOT NULL COMMENT '字典项主键，自增',
  `DICT_ID` varchar(40) NOT NULL COMMENT '字典主键',
  `ITEM_CODE` varchar(40) default NULL COMMENT '字典项编码',
  `ITEM_NAME` varchar(200) default NULL COMMENT '字典项名称',
  `ITEM_PCODE` varchar(40) default NULL COMMENT '父字典项编码',
  `ITEM_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `ITEM_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `ITEM_IMG` varchar(200) default NULL COMMENT '对应图片，带路径的图片地址',
  `ITEM_LEAF` decimal(4,0) default NULL COMMENT '是否叶子节点，1：是；2：否',
  `ITEM_FIELD1` varchar(2000) default NULL COMMENT '扩展字段1',
  `ITEM_FIELD2` varchar(2000) default NULL COMMENT '扩展字段2',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '公共标志',
  `S_CMPY` varchar(40) default NULL COMMENT '组织主键',
  `CODE_PATH` varchar(2000) default NULL COMMENT '编码路径',
  `ITEM_LEVEL` decimal(4,0) default NULL COMMENT '层级',
  PRIMARY KEY  (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典内部详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_dict_item`
--

LOCK TABLES `sy_serv_dict_item` WRITE;
/*!40000 ALTER TABLE `sy_serv_dict_item` DISABLE KEYS */;
INSERT INTO `sy_serv_dict_item` VALUES ('05pS-F_8deQXMMdk7EcMVo','SY_COMM_MIND_TYPE','SD','部门意见',NULL,'180','1',NULL,'0',NULL,NULL,'1','1','^','0'),('0elOuYxph59aLVjJbdNTvH','SY_COMM_MIND_TYPE','PS','行领导批示意见',NULL,'15','1',NULL,'0',NULL,NULL,'1','1','^','0'),('1AhGUFrNtfnr2XxovI_4XA','SY_COMM_MIND_TYPE','SC','主办部门意见',NULL,'20','1',NULL,'0',NULL,NULL,'1','1','^','0'),('1hgXxQmdV5abqZS8xWMWlg','SY_COMM_MIND_TYPE','SP','审批意见',NULL,'10','1',NULL,'0',NULL,NULL,'1','1','^','0'),('1pjp4Ri5h33apM0uGGu_LK','SY_COMM_MIND_TYPE','NB','办公室意见',NULL,'50','1',NULL,'0',NULL,NULL,'1','1','^','0'),('2bi8K_8Y94_EP_oIQkcUT_','SY_COMM_MIND_TYPE','FL','法律部门意见',NULL,'30','1',NULL,'0',NULL,NULL,'1','1','^','0'),('3nJfw3zfh5w97afPDkehOL','SY_COMM_MIND_TYPE','SH','审核',NULL,'150','1',NULL,'0',NULL,NULL,'1','1','^','0'),('3q3--VOQ5cgXZAybpVWdGd','SY_COMM_MIND_TYPE','HQ','会商部门意见',NULL,'40','1',NULL,'0',NULL,NULL,'1','1','^','0'),('3szFXF4CJ2YENSNivaqs1C','SY_COMM_MIND_TYPE','FG','分管部门意见',NULL,'25','1',NULL,'1',NULL,NULL,'1','1','^','0'),('3VbXv8GKp0oaTJ8SuGrFKa','SY_COMM_MIND_TYPE','FZ','支行意见',NULL,'60','1',NULL,NULL,NULL,NULL,'1','1','^','0');
/*!40000 ALTER TABLE `sy_serv_dict_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_flow`
--

DROP TABLE IF EXISTS `sy_serv_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_flow` (
  `FLOW_ID` varchar(40) NOT NULL,
  `DATA_ID` varchar(40) default NULL,
  `OWNER_ID` varchar(40) default NULL,
  `S_ODEPT` varchar(40) default NULL,
  PRIMARY KEY  (`FLOW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_flow`
--

LOCK TABLES `sy_serv_flow` WRITE;
/*!40000 ALTER TABLE `sy_serv_flow` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_item`
--

DROP TABLE IF EXISTS `sy_serv_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_item` (
  `ITEM_ID` varchar(40) NOT NULL COMMENT '数据项主键，自增',
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `ITEM_CODE` varchar(40) NOT NULL COMMENT '服务项编码，与数据库字段保持一致',
  `ITEM_NAME` varchar(80) default NULL COMMENT '名称',
  `ITEM_TYPE` decimal(4,0) default NULL COMMENT '类型，1：表字段；2：视图字段；3：自定义字段',
  `ITEM_UNIQUE_GROUP` decimal(4,0) default NULL COMMENT '唯一分组，支持多组唯一，1：唯一组1；2：唯一组2；3：唯一组3；...',
  `ITEM_FIELD_TYPE` varchar(10) default NULL COMMENT '字段类型，STR：字符串；NUM：数字；LONG：大文本；TIME：TIMESTAME',
  `ITEM_FIELD_LENGTH` varchar(10) default NULL COMMENT '长度，数字的逗号分隔小数位',
  `ITEM_INPUT_TYPE` decimal(4,0) default NULL COMMENT '输入类型，1：文本框；2：下拉框；3：单选框；4：多选框；5：大文本；6：超大文本；7：图片上传；8：嵌入服务；9：分组框',
  `ITEM_INPUT_MODE` decimal(4,0) default NULL COMMENT '输入模式，1：无；2：查询选择；3：字典选择；4：日期选择；5：动态提示；6：组合值；9：自定义',
  `ITEM_INPUT_CONFIG` varchar(2000) default NULL COMMENT '输入设置，根据输入类型和输入模式进行设定',
  `ITEM_INPUT_DEFAULT` varchar(100) default NULL COMMENT '缺省值，支持变量，支持序列格式',
  `ITEM_INPUT_FLAG` decimal(4,0) default NULL COMMENT '可选可录入？，1：是；2：否',
  `ITEM_VALIDATE` varchar(200) default NULL COMMENT '有效性检查，支持正则表达式',
  `ITEM_VALIDATE_HINT` varchar(200) default NULL COMMENT '有效性提示，支持变量替换',
  `ITEM_NOTNULL` decimal(4,0) default NULL COMMENT '必填项 ，1：是；2：否',
  `ITEM_READONLY` decimal(4,0) default NULL COMMENT '只读项 ，1：是；2：否',
  `ITEM_CARD_DISABLE` decimal(4,0) default NULL COMMENT '卡片禁用，自定义JSP列表用卡片不用时用到，1：是；2否',
  `ITEM_LIST_STYLE` varchar(200) default NULL COMMENT '列表样式，设定列表本数据项展示的样式',
  `ITEM_CARD_STYLE` varchar(200) default NULL COMMENT '卡片样式，设定卡片本数据项展示的样式',
  `ITEM_LIST_FORMAT` varchar(200) default NULL COMMENT '列表格式，列表数据展示格式化',
  `ITEM_CARD_FORMAT` varchar(200) default NULL COMMENT '卡片格式，卡片数据展示格式化',
  `ITEM_LIST_LINK` varchar(200) default NULL COMMENT '列表URL',
  `ITEM_CARD_LINK` varchar(200) default NULL COMMENT '卡片URL',
  `ITEM_LIST_WIDTH` decimal(4,0) default NULL COMMENT '列表宽度，设定列表本数据项宽度，0为自动',
  `ITEM_CARD_WIDTH` decimal(4,0) default NULL COMMENT '卡片宽度，设定卡片本数据项宽度，缺省为40px',
  `ITEM_LIST_ORDER` decimal(4,0) default NULL COMMENT '列表排序：设定列表显示顺序',
  `ITEM_CARD_ORDER` decimal(4,0) default NULL COMMENT '卡片排序，设定卡片页面显示顺序',
  `ITEM_CARD_ROWS` decimal(4,0) default NULL COMMENT '卡片占用行数，设定占用卡片的行数',
  `ITEM_CARD_COLS` decimal(4,0) default NULL COMMENT '卡片占用列数，设定占用卡片的列数',
  `ITEM_SEARCH_FLAG` decimal(4,0) default NULL COMMENT '是否搜索？，1：是（视图及表字段缺省）；2：否',
  `ITEM_LIST_FLAG` decimal(4,0) default NULL COMMENT '显示在列表？，1：是（视图及表字段缺省）；2：否',
  `ITEM_LIST_EDIT` decimal(4,0) default NULL COMMENT '列表编辑？，1：是；2：否',
  `ITEM_LOG_FLAG` decimal(4,0) default NULL COMMENT '记录历史？，1：是；2：否',
  `ITEM_MEMO` varchar(2000) default NULL COMMENT '说明，在帮助中显示',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `DICT_ID` varchar(40) default NULL COMMENT '引用字典主键，隐藏字段，自动设置，用于数据计算等',
  `ITEM_LIST_ALIGN` decimal(4,0) default NULL COMMENT '列表对齐，1：左对齐（缺省）；2：右对齐；3：居中对齐',
  `ITEM_HIDDEN` decimal(4,0) default NULL COMMENT '隐藏项 ，1：是；2：否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `ITEM_MOBILE_TYPE` decimal(4,0) default NULL COMMENT '移动类型，1：列表标题；2：列表项；3：仅卡片项；9：不展示',
  `ITEM_TIP` varchar(400) default NULL COMMENT '提示信息',
  `ITEM_ORDER_CODES` varchar(400) default NULL COMMENT '重载排序字段，逗号分隔的字段列表，列表点击此列排序时指定按照哪几个字段排序',
  `ITEM_HIDDEN_SCRIPT` varchar(2000) default NULL COMMENT '隐藏表达式',
  `ITEM_NOTNULL_SCRIPT` varchar(2000) default NULL COMMENT '必填表达式',
  `ITEM_READONLY_SCRIPT` varchar(2000) default NULL COMMENT '只读表达式',
  `ITEM_USER_FLAG` decimal(4,0) default NULL COMMENT '是否用户？，1：是；2：否（缺省）',
  `ITEM_LABEL_HIDDEN` decimal(4,0) default NULL COMMENT '标签隐藏？ ，1：是；2：否（缺省）',
  `ITEM_SUM_FLAG` decimal(4,0) default NULL COMMENT '启用小计？，1：是；2：否（缺省）',
  `ITEM_EXPTENDS` varchar(2000) default NULL COMMENT '扩展设置，JSON格式',
  `SAFE_HTML` varchar(4) default NULL COMMENT '如果为安全HTML，则卡片页面显示标签或列表页面显示字段值时，不替换HTML标签，否则替换HTML标签。',
  PRIMARY KEY  (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务项定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_item`
--

LOCK TABLES `sy_serv_item` WRITE;
/*!40000 ALTER TABLE `sy_serv_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_link`
--

DROP TABLE IF EXISTS `sy_serv_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_link` (
  `LINK_ID` varchar(40) NOT NULL COMMENT '关联主键，自增',
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `LINK_SERV_ID` varchar(40) NOT NULL COMMENT '子服务主键',
  `LINK_NAME` varchar(40) default NULL COMMENT '关联标题',
  `LINK_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `LINK_WHERE` varchar(400) default NULL COMMENT '过滤条件',
  `LINK_EXPRESSION` varchar(400) default NULL COMMENT '表达式，显示表达式，支持变量替换',
  `LINK_READONLY` decimal(4,0) default NULL COMMENT '只读关联？，1：是；2：否（缺省）',
  `LINK_DELETE_FLAG` decimal(4,0) default NULL COMMENT '关联删除？，1：是；2：否',
  `LINK_UPDATE_FLAG` decimal(4,0) default NULL COMMENT '关联更新？，1：是；2：否',
  `LINK_QUERY_FLAG` decimal(4,0) default NULL COMMENT '显示搜索框？，1：是；2：否（缺省）',
  `LINK_SHOW_TYPE` decimal(4,0) default NULL COMMENT '显示方式，1：列表显示；2：卡片显示',
  `LINK_SHOW_POSITION` decimal(4,0) default NULL COMMENT '显示位置，1：主单数据项；2：主单下列表；3：主单标签',
  `LINK_PAGE_COUNT` decimal(4,0) default NULL COMMENT '每页记录数，0（缺省）为不分页',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `LINK_REFRESH` varchar(4) default NULL COMMENT '接收部门名称',
  `LINK_MAIN_LIST` decimal(4,0) default NULL COMMENT '列表动态展开，1：是；2：否（缺省）',
  `LINK_SERV_QUERY` decimal(4,0) default NULL COMMENT '保留服务过滤，1：是；2：否（缺省）',
  PRIMARY KEY  (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务关联定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_link`
--

LOCK TABLES `sy_serv_link` WRITE;
/*!40000 ALTER TABLE `sy_serv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_link_item`
--

DROP TABLE IF EXISTS `sy_serv_link_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_link_item` (
  `LITEM_ID` varchar(40) NOT NULL COMMENT '关联主键，自增',
  `LINK_ID` varchar(40) default NULL COMMENT '关联主键，自增',
  `ITEM_CODE` varchar(40) default NULL COMMENT '主单数据项',
  `LINK_ITEM_CODE` varchar(40) default NULL COMMENT '子单数据项',
  `LINK_WHERE_FLAG` decimal(4,0) default NULL COMMENT '过滤标志，1：是（作为过滤条件拼接进关联查询）；2：否 ',
  `LINK_VALUE_FLAG` decimal(4,0) default NULL COMMENT '传值标志，1：主单数据项值；2：常量值；3：不传值（只作为过滤设定）',
  PRIMARY KEY  (`LITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联明细设定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_link_item`
--

LOCK TABLES `sy_serv_link_item` WRITE;
/*!40000 ALTER TABLE `sy_serv_link_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_link_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_listener`
--

DROP TABLE IF EXISTS `sy_serv_listener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_listener` (
  `LIS_ID` varchar(40) NOT NULL COMMENT '监听ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务',
  `LIS_CLASS` varchar(200) default NULL COMMENT '类',
  `LIS_CONF` varchar(2000) default NULL COMMENT '配置',
  `LIS_DESC` varchar(200) default NULL COMMENT '描述',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用',
  `LIS_SORT` decimal(10,0) default NULL COMMENT '排序',
  `S_MTIEM` varchar(23) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`LIS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务监听';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_listener`
--

LOCK TABLES `sy_serv_listener` WRITE;
/*!40000 ALTER TABLE `sy_serv_listener` DISABLE KEYS */;
INSERT INTO `sy_serv_listener` VALUES ('1jnleUwX11C9DLGyCdfokC','SY_ORG_USER_IMG','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('27ucquXyVaLVY3Ieb-f0Ng','SY_ORG_USER_RESUME','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('2SJaFRDeF0Pqou4gLKoz5W','SY_ORG_USER_INFO_SELF','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('30Xs937SV3SoSnDL3kFyCz','SY_ORG_USER_RESUME_WORK','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('38_uzEdBJbBXBPd0DJeEq-','SY_ORG_USER_REWARD','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('3aITO83nV33rpBD7ZjRakQ','SY_ORG_USER_CONTACT','com.rh.core.serv.listener.CompleteDegreeListener',NULL,'用户资料完整度','1','0',NULL),('3NmU2X2oh5maQKsQ4cuNKg','SY_ORG_LOGIN','com.rh.core.serv.listener.ActMsgListener','login,logout','操作操作完成，向消息中心发送消息','2','0',NULL);
/*!40000 ALTER TABLE `sy_serv_listener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_log_act`
--

DROP TABLE IF EXISTS `sy_serv_log_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_log_act` (
  `ALOG_ID` varchar(40) NOT NULL COMMENT '操作历史',
  `ACT_ID` varchar(40) default NULL COMMENT '操作主键',
  `ACT_KEYS` varchar(4000) default NULL COMMENT '数据主键，多个主键逗号分隔',
  `ACT_TIME` decimal(8,0) default NULL COMMENT '操作耗时，单位为ms',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '操作用户',
  `ACT_IP` varchar(40) default NULL COMMENT 'IP地址',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SERV_ID` varchar(40) default NULL COMMENT '服务编码',
  PRIMARY KEY  (`ALOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作留痕';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_log_act`
--

LOCK TABLES `sy_serv_log_act` WRITE;
/*!40000 ALTER TABLE `sy_serv_log_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_log_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_serv_log_act_v`
--

DROP TABLE IF EXISTS `sy_serv_log_act_v`;
/*!50001 DROP VIEW IF EXISTS `sy_serv_log_act_v`*/;
/*!50001 CREATE TABLE `sy_serv_log_act_v` (
  `ALOG_ID` varchar(40),
  `ACT_ID` varchar(40),
  `ACT_KEYS` varchar(4000),
  `ACT_TIME` decimal(8,0),
  `S_CMPY` varchar(40),
  `S_USER` varchar(40),
  `S_MTIME` varchar(23),
  `ACT_IP` varchar(40),
  `serv_id` varchar(40),
  `ACT_CODE` varchar(40),
  `act_name` varchar(40),
  `act_type` decimal(4,0)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_serv_log_item`
--

DROP TABLE IF EXISTS `sy_serv_log_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_log_item` (
  `ILOG_ID` varchar(40) NOT NULL COMMENT '历史主键',
  `ITEM_ID` varchar(40) default NULL COMMENT '数据项主键，自增',
  `DATA_ID` varchar(40) default NULL COMMENT '数据主键',
  `ILOG_OLD` varchar(2000) default NULL COMMENT '原值',
  `ILOG_NEW` varchar(2000) default NULL COMMENT '当前值',
  `S_CMPY` varchar(40) default NULL COMMENT '公司主键',
  `S_USER` varchar(40) default NULL COMMENT '当前用户',
  `ILOG_IP` varchar(40) default NULL COMMENT 'IP地址',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `SERV_ID` varchar(40) default NULL COMMENT '服务编码',
  `ITEM_CODE` varchar(40) default NULL COMMENT '数据项编码',
  PRIMARY KEY  (`ILOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据变更历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_log_item`
--

LOCK TABLES `sy_serv_log_item` WRITE;
/*!40000 ALTER TABLE `sy_serv_log_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_log_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_serv_log_item_v`
--

DROP TABLE IF EXISTS `sy_serv_log_item_v`;
/*!50001 DROP VIEW IF EXISTS `sy_serv_log_item_v`*/;
/*!50001 CREATE TABLE `sy_serv_log_item_v` (
  `ILOG_ID` varchar(40),
  `ITEM_ID` varchar(40),
  `ITEM_CODE` varchar(40),
  `DATA_ID` varchar(40),
  `ILOG_OLD` varchar(2000),
  `ILOG_NEW` varchar(2000),
  `S_CMPY` varchar(40),
  `S_USER` varchar(40),
  `S_MTIME` varchar(23),
  `ILOG_IP` varchar(40),
  `serv_id` varchar(40),
  `item_name` varchar(80),
  `item_input_type` decimal(4,0),
  `item_input_mode` decimal(4,0),
  `dict_id` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_serv_query`
--

DROP TABLE IF EXISTS `sy_serv_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_query` (
  `QUERY_ID` varchar(40) NOT NULL COMMENT '查询主键',
  `SERV_ID` varchar(40) default NULL COMMENT '服务主键',
  `QUERY_NAME` varchar(40) default NULL COMMENT '查询策略名称',
  `QUERY_SQL` varchar(400) default NULL COMMENT '查询SQL',
  `QUERY_TYPE` decimal(4,0) default NULL COMMENT '策略类型，1：系统；2：个人',
  `QUERY_DEFAULT` decimal(4,0) default NULL COMMENT '缺省策略？，1：是；2：否',
  `QUERY_ORDER` decimal(4,0) default NULL COMMENT '排序',
  `LIST_ID` varchar(40) default NULL COMMENT '列表策略主键',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  PRIMARY KEY  (`QUERY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='查询策略表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_query`
--

LOCK TABLES `sy_serv_query` WRITE;
/*!40000 ALTER TABLE `sy_serv_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_relate`
--

DROP TABLE IF EXISTS `sy_serv_relate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_relate` (
  `RELATE_ID` varchar(40) NOT NULL COMMENT '相关文件ID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `RELATE_SERV_ID` varchar(40) default NULL COMMENT '关联服务主键',
  `RELATE_DATA_ID` varchar(40) default NULL COMMENT '关联数据主键',
  `RELATE_SORT` decimal(4,0) default NULL COMMENT '关系排序号',
  `RELATE_TYPE` varchar(40) default NULL COMMENT '关系类型，例如：区分相关文件或者转发原文等',
  `S_USER` varchar(40) default NULL COMMENT '用户编码',
  `S_DEPT` varchar(40) default NULL COMMENT '部门',
  `S_TDEPT` varchar(40) default NULL COMMENT '有效部门',
  `S_CMPY` varchar(40) default NULL COMMENT '公司编码',
  `S_ATIME` varchar(23) default NULL COMMENT '添加时间',
  `S_ODEPT` varchar(40) default NULL COMMENT '机构部门',
  PRIMARY KEY  (`RELATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程中选取相关文件，';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_relate`
--

LOCK TABLES `sy_serv_relate` WRITE;
/*!40000 ALTER TABLE `sy_serv_relate` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_relate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_serv_relate_v`
--

DROP TABLE IF EXISTS `sy_serv_relate_v`;
/*!50001 DROP VIEW IF EXISTS `sy_serv_relate_v`*/;
/*!50001 CREATE TABLE `sy_serv_relate_v` (
  `RELATE_ID` varchar(40),
  `SERV_ID` varchar(40),
  `DATA_ID` varchar(40),
  `RELATE_SERV_ID` varchar(40),
  `RELATE_DATA_ID` varchar(40),
  `RELATE_SORT` decimal(4,0),
  `RELATE_TYPE` varchar(40),
  `S_USER` varchar(40),
  `S_DEPT` varchar(40),
  `S_TDEPT` varchar(40),
  `S_CMPY` varchar(40),
  `S_ATIME` varchar(23),
  `S_ODEPT` varchar(40),
  `TITLE` varchar(1000),
  `SERV_NAME` varchar(40),
  `QUERY_ODEPT` varchar(40)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_serv_search`
--

DROP TABLE IF EXISTS `sy_serv_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_search` (
  `SERV_ID` varchar(40) NOT NULL COMMENT '服务主键',
  `SEARCH_SELECT` varchar(800) default NULL COMMENT 'select语句，搜索的字段列表，根据设置自动生成',
  `SEARCH_WHERE` varchar(400) default NULL COMMENT 'where语句，固定索引搜索的过滤条件，不需要写where从and开始',
  `SEARCH_INCR_WHERE` varchar(400) default NULL COMMENT '增量where语句，增量索引搜索的过滤条件',
  `SEARCH_ORDER` varchar(200) default NULL COMMENT 'order语句，不需要写order by',
  `SEARCH_INCR_ORDER` varchar(200) default NULL COMMENT '增量order语句，不需要写order by',
  `SEARCH_CLASS` varchar(200) default NULL COMMENT '索引监听类',
  `SEARCH_TITLE` varchar(400) default NULL COMMENT '索引标题，支持字段变量替换',
  `SEARCH_DIGEST` varchar(1000) default NULL COMMENT '索引摘要，支持html标签及变量替换',
  `SEARCH_PREVIEW` varchar(1000) default NULL COMMENT '索引预览，支持html标签及变量替换',
  `SEARCH_INDEX` varchar(400) default NULL COMMENT '索引分组字段，进行分组的字段列表，逗号分隔',
  `SEARCH_USER` varchar(40) default NULL COMMENT '索引用户字段，索引数据的创建者或者拥有者字段',
  `SEARCH_TIME` varchar(40) default NULL COMMENT '索引时间字段，数据创建或者更新时间字段',
  `SEARCH_DEPT` varchar(40) default NULL COMMENT '索引部门字段，索引数据的拥有部门字段',
  `SEARCH_CMPY` varchar(40) default NULL COMMENT '索引公司字段，标明索引数据的所在公司的字段',
  `SEARCH_URL` varchar(400) default NULL COMMENT '查询连接，带http的全路径，支持变量替换',
  `SEARCH_LAST_FIELD` varchar(40) default NULL COMMENT '固定索引字段，一般为主键或者时间字段',
  `SEARCH_LAST_DATA` varchar(40) default NULL COMMENT '最后索引固定数据，用于作为持续索引的判断',
  `SEARCH_LAST_COUNT` decimal(12,0) default NULL COMMENT '上次固定索引数据量',
  `SEARCH_INCR_FIELD` varchar(40) default NULL COMMENT '增量索引字段，一般为主键或者时间字段',
  `SEARCH_INCR_DATA` varchar(40) default NULL COMMENT '最后增量固定数据，用于作为增量索引的判断',
  `SEARCH_INCR_COUNT` decimal(12,0) default NULL COMMENT '上次增量索引数据量',
  `SEARCH_ALL_COUNT` decimal(12,0) default NULL COMMENT '总索引数据量',
  `SEARCH_FILE_FLAG` decimal(4,0) default NULL COMMENT '索引附件标志，1：内部附件；2：外部附件；3：不索引附件（缺省）',
  `SEARCH_CONT_TYPE` decimal(4,0) default NULL COMMENT '索引正文类型，1：字段；2：第一个附件；3：特定附件',
  `SEARCH_CONT_FIELD` varchar(1000) default NULL COMMENT '索引正文字段，字段名或者附件表达式',
  `SEARCH_FILE_SQL` varchar(1000) default NULL COMMENT '附件SQL，获取附件的SQL语句',
  `SEARCH_FILE_ID` varchar(40) default NULL COMMENT '附件主键字段',
  `SEARCH_FILE_NAME` varchar(40) default NULL COMMENT '附件名称字段，带后缀的名称',
  `SEARCH_FILE_PATH` varchar(400) default NULL COMMENT '附件路径，可以是操作系统FILE、FTP、HTTP等地址',
  `SEARCH_SERV_AUTH` decimal(4,0) default NULL COMMENT '搜索服务权限，1：全部可以搜索；2：授权才可以搜索',
  `SEARCH_DATA_AUTH` decimal(4,0) default NULL COMMENT '搜索数据权限，1：全部；2：公司内全部；3：数据权限',
  `SEARCH_ALL_CONDITION` varchar(800) default NULL COMMENT '全部可查规则，JS条件表达式，符合规则的不进行权限设置',
  `SEARCH_USER_SQL` varchar(800) default NULL COMMENT '用户权限SQL',
  `SEARCH_ROLE_SQL` varchar(800) default NULL COMMENT '角色权限SQL',
  `SEARCH_DEPT_SQL` varchar(800) default NULL COMMENT '部门权限SQL',
  `SEARCH_DEPT_ROLE_SQL` varchar(800) default NULL COMMENT '部门角色权限SQL',
  `SEARCH_CMPY_CONDITION` varchar(800) default NULL COMMENT '公司全查规则，JS条件表达式，符合规则的设置全公司可查',
  `SEARCH_CONT_SHOT` decimal(4,0) default NULL COMMENT '正文快照？,1：是；2：否',
  `SEARCH_NAME` varchar(40) default NULL COMMENT '功能名称',
  `SEARCH_IMG` varchar(800) default NULL COMMENT '图片表达式，JS条件表达式，符合规则输出图片HTML',
  `SEARCH_OTHER_FIELDS` varchar(400) default NULL COMMENT '其他字段，规则中要用到的查询字段列表，多个逗号分隔',
  `SEARCH_DOMAIN` varchar(80) default NULL COMMENT '域名或IP地址',
  `SEARCH_WF_URL` varchar(400) default NULL COMMENT '流程跟踪连接，XML格式的流程跟踪信息',
  `SEARCH_SRC_URL` varchar(400) default NULL COMMENT '原始连接，带http的全路径，支持变量替换',
  `SEARCH_BOOST` varchar(1000) default NULL COMMENT '加权表达式，支持脚本动态计算权重',
  `SEARCH_KEYWORD` varchar(400) default NULL COMMENT '索引关键词，用于增加特定词的权重，多个逗号或者空格分隔',
  `FILE_CACHE_FLAG` decimal(4,0) default NULL COMMENT '文件缓存类别',
  `SEARCH_GROUP_SQL` varchar(800) default NULL COMMENT '群组权限SQL',
  `SEARCH_HANDLER_CLASS` varchar(200) default NULL COMMENT '处理类',
  PRIMARY KEY  (`SERV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务搜索定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_search`
--

LOCK TABLES `sy_serv_search` WRITE;
/*!40000 ALTER TABLE `sy_serv_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_serv_where`
--

DROP TABLE IF EXISTS `sy_serv_where`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_serv_where` (
  `WHERE_ID` varchar(40) NOT NULL COMMENT '过滤主键，UUID',
  `SERV_ID` varchar(40) default NULL COMMENT '服务编码',
  `WHERE_NAME` varchar(80) default NULL COMMENT '过滤名称',
  `WHERE_SCRIPT` varchar(2000) default NULL COMMENT '条件规则',
  `WHERE_CONTENT` varchar(2000) default NULL COMMENT '过滤语句，and起始的SQL语句',
  `WHERE_FLOW_FLAG` decimal(4,0) default NULL COMMENT '启用流经，1：是；2：否，是否并上流经规则',
  `WHERE_ORDER` decimal(4,0) default NULL COMMENT '规则排序',
  `S_FLAG` decimal(4,0) default NULL COMMENT '有效标志，1：是；2：否',
  `S_MTIME` varchar(30) default NULL COMMENT '更新时间',
  `WHERE_SERV_TYPE` varchar(40) default NULL COMMENT '服务类型，1：本服务（缺省），2：父服务；3：引用自服务',
  PRIMARY KEY  (`WHERE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务过滤规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_serv_where`
--

LOCK TABLES `sy_serv_where` WRITE;
/*!40000 ALTER TABLE `sy_serv_where` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_serv_where` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_custom_var`
--

DROP TABLE IF EXISTS `sy_wfe_custom_var`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_custom_var` (
  `VAR_ID` varchar(40) NOT NULL COMMENT '变量ID',
  `VAR_CODE` varchar(60) default NULL COMMENT '变量名称',
  `VAR_CONTENT` varchar(1000) default NULL COMMENT '变量的值',
  `VAR_MEMO` varchar(1000) default NULL COMMENT '说明',
  `PROC_CODE` varchar(40) default NULL COMMENT '所属流程',
  `NODE_CODE` varchar(40) default NULL COMMENT '所属节点',
  `S_MTIME` varchar(30) default NULL COMMENT '修改时间',
  PRIMARY KEY  (`VAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_custom_var`
--

LOCK TABLES `sy_wfe_custom_var` WRITE;
/*!40000 ALTER TABLE `sy_wfe_custom_var` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_custom_var` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_line_def`
--

DROP TABLE IF EXISTS `sy_wfe_line_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_line_def` (
  `LD_ID` varchar(40) NOT NULL COMMENT '工作流连线主键',
  `LINE_CODE` varchar(40) default NULL COMMENT '连线编码',
  `LINE_COND_NAME` varchar(40) default NULL COMMENT '条件名称',
  `LINE_SORT` decimal(2,0) default NULL COMMENT '连线排序号',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `SRC_NODE_CODE` varchar(40) default NULL COMMENT '前节点编码',
  `TAR_NODE_CODE` varchar(40) default NULL COMMENT '后节点编码',
  `LINE_IF_RETURN` decimal(1,0) default NULL COMMENT '是否允许退回，1：是；2：否',
  `LINE_CONDS_SCRIPT` varchar(2000) default NULL COMMENT '执行该连线的条件',
  `LINE_EXTEND_CLASS` varchar(200) default NULL COMMENT '该连线执行的扩展类',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `UPDATE_EXPRESS` varchar(1000) default NULL COMMENT '更新数据，更新主服务数据的条件和表达式。',
  `CONFIRM_MSG` varchar(400) default NULL COMMENT '提示信息',
  `IF_PARALLEL` decimal(1,0) default NULL COMMENT '是否并发，1：是；2：否',
  `IF_OUT_DEPT` decimal(4,0) default NULL COMMENT '是否出部门',
  `COND_MSG` varchar(400) default NULL COMMENT '不符合条件时，点击按钮弹出的消息框。',
  `SEND_TEXT` varchar(40) default NULL COMMENT '送交按钮名称',
  `RETURN_TEXT` varchar(40) default NULL COMMENT '返回按钮名称',
  `LINE_EVENT` varchar(100) default NULL COMMENT '流经事件,当流程流经此线时，触发此事件。',
  `ORG_DEF` varchar(4000) default NULL COMMENT '组织资源定义',
  PRIMARY KEY  (`LD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点连线定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_line_def`
--

LOCK TABLES `sy_wfe_line_def` WRITE;
/*!40000 ALTER TABLE `sy_wfe_line_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_line_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_act`
--

DROP TABLE IF EXISTS `sy_wfe_node_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_act` (
  `NA_ID` varchar(40) NOT NULL COMMENT '关联表定义主键',
  `PROC_CODE` varchar(40) NOT NULL COMMENT '流程编码',
  `NODE_CODE` varchar(40) NOT NULL COMMENT '节点编码',
  `SERV_ID` varchar(40) default NULL COMMENT '服务编码(确定哪个表单)',
  `FIELD_CONTROL` decimal(4,0) default NULL COMMENT '字段控制类型：1 完全控制； 2 只读控制',
  `FIELD_EXCEPTION` varchar(1000) default NULL COMMENT '可编辑字段，可以是逗号分隔的多个字段的字符串。',
  `FIELD_UPDATE` varchar(500) default NULL COMMENT '流程送交或者退回到此【节点】时更新对应的字段设定。',
  `FIELD_HIDDEN` varchar(1000) default NULL COMMENT '字段隐藏设置，所有需要隐藏的字段列表，逗号分隔',
  `FIELD_MIND_UPDATE` varchar(500) default NULL COMMENT '在流程中填写意见时，自动更新单据中某些字段的数据。',
  `FIELD_ROLLBACK` varchar(500) default NULL COMMENT '对于流程启动点来说，启动流程执行【更新字段】设定，取消流程执行此更新设定；',
  `FORM_BUTTONS` varchar(200) default NULL COMMENT '表单按钮控制，可以在本节点显示的表单按钮ID列表，逗号分隔',
  `FIELD_MUST` varchar(400) default NULL COMMENT '流程节点必填字段设定',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) NOT NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `FILE_CONTROL` varchar(400) default NULL COMMENT '文件类型的控制',
  `WF_BUTTONS` varchar(200) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `FIELD_DISPLAY` varchar(1000) default NULL COMMENT '显示字段',
  `GROUP_DISPLAY` varchar(400) default NULL COMMENT '显示分组框',
  `GROUP_HIDE` varchar(400) default NULL COMMENT '隐藏分组框',
  `GROUP_EXPAND` varchar(400) default NULL COMMENT '展开分组框',
  `GROUP_COLLAPSE` varchar(400) default NULL COMMENT '收缩分组框',
  `BUTTON_PARAMS` varchar(4000) default NULL COMMENT '按钮参数',
  `BUTTON_ALIAS` varchar(1000) default NULL COMMENT '别名',
  PRIMARY KEY  (`NA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程节点和ACT关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_act`
--

LOCK TABLES `sy_wfe_node_act` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_act` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_def`
--

DROP TABLE IF EXISTS `sy_wfe_node_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_def` (
  `ND_ID` varchar(40) NOT NULL COMMENT '节点定义主键',
  `NODE_CODE` varchar(40) default NULL COMMENT '节点编码',
  `NODE_NAME` varchar(40) default NULL COMMENT '节点名称',
  `NODE_CAPTION` varchar(40) default NULL COMMENT '节点显示按钮名称',
  `NODE_TYPE` decimal(1,0) default NULL COMMENT '节点类型，1：起草点；2：活动点；3：结束点',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `NODE_SORT` decimal(2,0) default NULL COMMENT '节点排序',
  `MIND_CODE` varchar(40) default NULL COMMENT '节点意见编码',
  `MIND_NEED_FLAG` decimal(1,0) default NULL COMMENT '节点是否必须填意见，1：是；2：否',
  `MIND_CTRL_FORCE` decimal(1,0) default NULL COMMENT '是否通过意见控制流转，1：是；2：否',
  `NODE_IF_PARALLEL` decimal(1,0) default NULL COMMENT '是否并发节点，1：是；2：否',
  `NODE_IF_CONVERGE` decimal(1,0) default NULL COMMENT '是否合并节点，1：是；2：否',
  `NODE_IF_AUTOEND` decimal(1,0) default NULL COMMENT '是否自动结束，1：是；2：否',
  `NODE_ROLE_CODES` varchar(2000) default NULL COMMENT '绑定角色编码',
  `NODE_ROLE_MODE` decimal(1,0) default NULL COMMENT '绑定角色类型，1：指定；2：全部；3：按角色送交',
  `NODE_ROLE_WHERE` varchar(2000) default NULL COMMENT '绑定角色过滤条件',
  `NODE_DEPT_CODES` varchar(2000) default NULL COMMENT '绑定部门编码，1：指定；2：全部；3：预定义',
  `NODE_DEPT_MODE` decimal(1,0) default NULL COMMENT '绑定部门类型',
  `NODE_DEPT_LEVEL` decimal(1,0) default NULL COMMENT '绑定部门层级，1：本级；大于1，包含子部门的层级',
  `NODE_DEPT_WHERE` varchar(2000) default NULL COMMENT '绑定部门过滤条件',
  `NODE_USER_CODES` varchar(2000) default NULL COMMENT '绑定用户编码',
  `NODE_USER_MODE` decimal(1,0) default NULL COMMENT '绑定用户类型，1：指定；2：全部；3：预定义',
  `NODE_USER_WHERE` varchar(2000) default NULL COMMENT '绑定用户过滤条件',
  `NODE_TIMEOUT` varchar(400) default NULL COMMENT '节点超时时间',
  `NODE_TIMEOUT_ACT` varchar(40) default NULL COMMENT '到限定时间后的操作：空：发送提醒，BACK：有退回点自动退回',
  `PROC_END_FLAG` decimal(1,0) default NULL COMMENT '该节点是否可以结束流程，1：是；2：否',
  `PROC_END_NAME` varchar(40) default NULL COMMENT '结束流程按钮名称',
  `NODE_SUB_PROC` varchar(40) default NULL COMMENT '子流程定义ID',
  `NODE_MEMO` varchar(2000) default NULL COMMENT '节点描述',
  `NODE_EXTEND_CLASS` varchar(200) default NULL COMMENT '节点送交人扩展类',
  `NODE_SELF_SEND` decimal(1,0) default NULL COMMENT '节点内部送交，1：是；2：否',
  `NODE_REMIND_USER` varchar(2000) default NULL COMMENT '办理完成提醒用户',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `MIND_IF_HAND` decimal(1,0) default NULL,
  `MIND_REGULAR` varchar(80) default NULL COMMENT '固定意见类型',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `MIND_REGULAR_MUST` decimal(1,0) default NULL,
  `MIND_TERMINAL` varchar(80) default NULL,
  `MIND_TERMINAL_MUST` decimal(1,0) default NULL,
  `MIND_REGULAR_SCRIPT` varchar(400) default NULL COMMENT '固定意见过滤脚本',
  `MIND_SCRIPT` varchar(400) default NULL COMMENT '普通意见过滤脚本',
  `MIND_TERMINAL_SCRIPT` varchar(400) default NULL COMMENT '最终意见过滤脚本',
  `NODE_BIND_MODE` varchar(40) default NULL COMMENT '节点绑定类型, USER ROLE',
  `EVENT_CLS` varchar(100) default NULL,
  `CONVERGE_TARGET` varchar(50) default NULL,
  `BREAK_THROUGH` varchar(800) default NULL,
  `EXT_JSON` longtext,
  PRIMARY KEY  (`ND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_def`
--

LOCK TABLES `sy_wfe_node_def` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_inst`
--

DROP TABLE IF EXISTS `sy_wfe_node_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_inst` (
  `NI_ID` varchar(40) NOT NULL COMMENT '节点实例主键',
  `NODE_CODE` varchar(40) default NULL COMMENT '节点编码',
  `NODE_NAME` varchar(100) default NULL COMMENT '节点名称',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `PI_ID` varchar(40) default NULL COMMENT '实例ID',
  `NODE_IF_RUNNING` decimal(1,0) default NULL COMMENT '节点是否运行，1：是；2：否',
  `NODE_BTIME` varchar(20) default NULL COMMENT '节点开始时间',
  `NODE_ETIME` varchar(20) default NULL COMMENT '节点结束时间',
  `NODE_LIMIT_TIME` varchar(20) default NULL COMMENT '节点限定完成时间',
  `NODE_DAYS` decimal(8,0) default NULL COMMENT '节点执行小时数',
  `DONE_USER_ID` varchar(40) default NULL COMMENT '执行节点用户ID',
  `DONE_USER_NAME` varchar(40) default NULL COMMENT '执行节点用户名称',
  `DONE_DEPT_IDS` varchar(2000) default NULL COMMENT '执行节点部门ID列表',
  `DONE_DEPT_NAMES` varchar(2000) default NULL COMMENT '执行节点部门名称列表',
  `SUB_USER_ID` varchar(40) default NULL COMMENT '代理执行的用户ID',
  `SUB_USER_NAME` varchar(40) default NULL COMMENT '代理执行的用户名称',
  `SUB_DEPT_IDS` varchar(2000) default NULL COMMENT '代理执行的部门ID列表',
  `SUB_DEPT_NAMES` varchar(2000) default NULL COMMENT '代理执行的部门名称列表',
  `PRE_NI_ID` varchar(40) default NULL COMMENT '前一个节点ID',
  `PRE_LINE_CODE` varchar(40) default NULL COMMENT '连线编码',
  `TO_TYPE` decimal(1,0) default NULL COMMENT '送交类型：1：送部门+角色；2：送角色；3：送用户',
  `TO_USER_ID` varchar(40) default NULL COMMENT '送交用户ID',
  `REMIND_CONTENT` varchar(200) default NULL COMMENT '提醒的信息内容',
  `DONE_TYPE` decimal(3,0) default NULL COMMENT '办理类型：3收回、2终止、1正常结束',
  `DONE_DESC` varchar(200) default NULL COMMENT '办理说明',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `OPEN_TIME` varchar(20) default NULL COMMENT '打开时间',
  `TO_USER_NAME` varchar(40) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `REMIND_LOG` varchar(100) default NULL COMMENT '提醒记录',
  `DELAY_TIME` decimal(8,0) default NULL COMMENT '超期时间',
  PRIMARY KEY  (`NI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_inst`
--

LOCK TABLES `sy_wfe_node_inst` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_inst_his`
--

DROP TABLE IF EXISTS `sy_wfe_node_inst_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_inst_his` (
  `NI_ID` varchar(40) NOT NULL COMMENT '节点实例主键',
  `NODE_CODE` varchar(40) default NULL COMMENT '节点编码',
  `NODE_NAME` varchar(100) default NULL COMMENT '节点名称',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `PI_ID` varchar(40) default NULL COMMENT '实例ID',
  `NODE_IF_RUNNING` decimal(1,0) default NULL COMMENT '节点是否运行，1：是；2：否',
  `NODE_BTIME` varchar(20) default NULL COMMENT '节点开始时间',
  `NODE_ETIME` varchar(20) default NULL COMMENT '节点结束时间',
  `NODE_LIMIT_TIME` varchar(20) default NULL COMMENT '节点限定完成时间',
  `NODE_DAYS` decimal(8,0) default NULL COMMENT '节点执行小时数',
  `DONE_USER_ID` varchar(40) default NULL COMMENT '执行节点用户ID',
  `DONE_USER_NAME` varchar(40) default NULL COMMENT '执行节点用户名称',
  `DONE_DEPT_IDS` varchar(2000) default NULL COMMENT '执行节点部门ID列表',
  `DONE_DEPT_NAMES` varchar(2000) default NULL COMMENT '执行节点部门名称列表',
  `SUB_USER_ID` varchar(40) default NULL COMMENT '代理执行的用户ID',
  `SUB_USER_NAME` varchar(40) default NULL COMMENT '代理执行的用户名称',
  `SUB_DEPT_IDS` varchar(2000) default NULL COMMENT '代理执行的部门ID列表',
  `SUB_DEPT_NAMES` varchar(2000) default NULL COMMENT '代理执行的部门名称列表',
  `PRE_NI_ID` varchar(40) default NULL COMMENT '前一个节点ID',
  `PRE_LINE_CODE` varchar(40) default NULL COMMENT '连线编码',
  `TO_TYPE` decimal(1,0) default NULL COMMENT '送交类型：1：送部门+角色；2：送角色；3：送用户',
  `TO_USER_ID` varchar(40) default NULL COMMENT '送交用户ID',
  `REMIND_CONTENT` varchar(200) default NULL COMMENT '提醒的信息内容',
  `DONE_TYPE` decimal(3,0) default NULL COMMENT '办理类型：3收回、2终止、1正常结束',
  `DONE_DESC` varchar(200) default NULL COMMENT '办理说明',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `OPEN_TIME` varchar(20) default NULL COMMENT '打开时间',
  `TO_USER_NAME` varchar(40) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `REMIND_LOG` varchar(100) default NULL COMMENT '提醒记录',
  `DELAY_TIME` decimal(8,0) default NULL COMMENT '超期时间',
  PRIMARY KEY  (`NI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实例历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_inst_his`
--

LOCK TABLES `sy_wfe_node_inst_his` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_inst_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_inst_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_pacts`
--

DROP TABLE IF EXISTS `sy_wfe_node_pacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_pacts` (
  `PACT_ID` varchar(40) NOT NULL COMMENT '公共按钮主键',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程CODE',
  `ACT_CODE` varchar(40) default NULL COMMENT '按钮CODE',
  `ACT_NAME` varchar(40) default NULL COMMENT '按钮名称',
  `ACT_TYPE` decimal(4,0) default NULL COMMENT '1:工作流;2:审批单',
  `ACT_SORT` decimal(4,0) default NULL COMMENT '排序号',
  `S_ATIME` varchar(23) default NULL COMMENT '增加时间',
  PRIMARY KEY  (`PACT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公共按钮表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_pacts`
--

LOCK TABLES `sy_wfe_node_pacts` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_pacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_pacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_users`
--

DROP TABLE IF EXISTS `sy_wfe_node_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_users` (
  `UN_ID` varchar(40) NOT NULL COMMENT '主键ID',
  `NI_ID` varchar(40) default NULL COMMENT '节点实例ID',
  `TO_USER_ID` varchar(40) default NULL COMMENT '用户ID',
  `TO_USER_NAME` varchar(80) default NULL COMMENT '用户名称',
  `TO_DEPT_ID` varchar(40) default NULL COMMENT '部门ID',
  `TO_DEPT_NAME` varchar(200) default NULL COMMENT '部门名称',
  `PI_ID` varchar(40) default NULL COMMENT '流程实例ID',
  `S_ATIME` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`UN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实例用户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_users`
--

LOCK TABLES `sy_wfe_node_users` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_node_users_his`
--

DROP TABLE IF EXISTS `sy_wfe_node_users_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_node_users_his` (
  `UN_ID` varchar(40) NOT NULL COMMENT '主键ID',
  `NI_ID` varchar(40) default NULL COMMENT '节点实例ID',
  `TO_USER_ID` varchar(40) default NULL COMMENT '用户ID',
  `TO_USER_NAME` varchar(80) default NULL COMMENT '用户名称',
  `TO_DEPT_ID` varchar(40) default NULL COMMENT '部门ID',
  `TO_DEPT_NAME` varchar(200) default NULL COMMENT '部门名称',
  `PI_ID` varchar(40) default NULL COMMENT '流程实例ID',
  `S_ATIME` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`UN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点实例用户历史信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_node_users_his`
--

LOCK TABLES `sy_wfe_node_users_his` WRITE;
/*!40000 ALTER TABLE `sy_wfe_node_users_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_node_users_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_wfe_node_users_v`
--

DROP TABLE IF EXISTS `sy_wfe_node_users_v`;
/*!50001 DROP VIEW IF EXISTS `sy_wfe_node_users_v`*/;
/*!50001 CREATE TABLE `sy_wfe_node_users_v` (
  `UN_ID` varchar(40),
  `NI_ID` varchar(40),
  `TO_USER_ID` varchar(40),
  `TO_USER_NAME` varchar(80),
  `TO_DEPT_ID` varchar(40),
  `TO_DEPT_NAME` varchar(200),
  `PI_ID` varchar(40),
  `S_ATIME` varchar(20),
  `NODE_IF_RUNNING` decimal(1,0)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_wfe_proc_def`
--

DROP TABLE IF EXISTS `sy_wfe_proc_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_proc_def` (
  `PROC_CODE` varchar(40) NOT NULL COMMENT '流程编码',
  `PROC_NAME` varchar(80) default NULL COMMENT '流程名称',
  `PROC_TYPE` decimal(4,0) default NULL COMMENT '流程分类',
  `SERV_ID` varchar(40) default NULL COMMENT '表单ID',
  `PROC_MEMO` varchar(200) default NULL COMMENT '流程描述',
  `S_PUBLIC` decimal(4,0) default NULL COMMENT '是否公共流程，1：是；2：否',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `EN_NAME` varchar(40) default NULL COMMENT '英文名称',
  `PROC_XML` longtext COMMENT '流程是否为最新版本,1是 2否',
  `BIND_TITLE` varchar(400) default NULL COMMENT '提醒标题',
  `BIND_BUTTONS` varchar(400) default NULL COMMENT '全局按钮',
  `BIND_BUTTONS_NAME` varchar(400) default NULL COMMENT '按钮名称',
  `BIND_ENDEDITFIELD` varchar(400) default NULL COMMENT '流程结束后可编辑字段',
  `PROC_MANAGE` varchar(40) default NULL,
  `SERV_PID` varchar(40) default NULL,
  `EXPAND_CLASS` varchar(200) default NULL,
  `PROC_MANAGE_EDIT` varchar(400) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `BIND_SCRIPT` varchar(4000) default NULL COMMENT '绑定脚本',
  `BIND_SORT` decimal(4,0) default NULL COMMENT '绑定排序',
  `PROC_CATALOG` varchar(40) default NULL,
  `PROC_VERSION` decimal(4,0) default NULL COMMENT '版本号',
  `EFFECTIVE_DATE` varchar(23) default NULL COMMENT '生效日期',
  `PROC_IS_LATEST` decimal(4,0) default NULL COMMENT '流程定义XML文件',
  `FINISH_REMIND` varchar(400) default NULL COMMENT '办结提醒设置',
  `NODE_PUB_LSTN` varchar(300) default NULL,
  PRIMARY KEY  (`PROC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_proc_def`
--

LOCK TABLES `sy_wfe_proc_def` WRITE;
/*!40000 ALTER TABLE `sy_wfe_proc_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_proc_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_proc_inst`
--

DROP TABLE IF EXISTS `sy_wfe_proc_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_proc_inst` (
  `PI_ID` varchar(40) NOT NULL COMMENT '实例主键',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `SERV_ID` varchar(40) default NULL COMMENT '表单ID',
  `DOC_ID` varchar(40) default NULL COMMENT '表单实例ID',
  `DOC_NAME` varchar(200) default NULL COMMENT '文档名称',
  `INST_IF_RUNNING` decimal(1,0) default NULL COMMENT '流程是否运行，1：是；2：否',
  `INST_BTIME` varchar(20) default NULL COMMENT '流程开始时间',
  `INST_ETIME` varchar(20) default NULL COMMENT '流程结束时间',
  `END_USER_ID` varchar(40) default NULL COMMENT '结束流程用户ID',
  `INST_IF_PARALLEL` decimal(1,0) default NULL COMMENT '流程是否并发，1：是；2：否',
  `INST_PARENT_NODE` varchar(40) default NULL COMMENT '流程的父流程节点ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `INST_LOCK` decimal(4,0) default NULL COMMENT '锁定状态  1 是 2 否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `INST_LOCK_USER` varchar(40) default NULL COMMENT '锁定人',
  `INST_LOCK_TIME` varchar(20) default NULL COMMENT '锁定时间',
  `INST_MIN` decimal(12,0) default NULL COMMENT '执行时间',
  PRIMARY KEY  (`PI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_proc_inst`
--

LOCK TABLES `sy_wfe_proc_inst` WRITE;
/*!40000 ALTER TABLE `sy_wfe_proc_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_proc_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_proc_inst_his`
--

DROP TABLE IF EXISTS `sy_wfe_proc_inst_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_proc_inst_his` (
  `PI_ID` varchar(40) NOT NULL COMMENT '实例主键',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `SERV_ID` varchar(40) default NULL COMMENT '表单ID',
  `DOC_ID` varchar(40) default NULL COMMENT '表单实例ID',
  `DOC_NAME` varchar(200) default NULL COMMENT '文档名称',
  `INST_IF_RUNNING` decimal(1,0) default NULL COMMENT '流程是否运行，1：是；2：否',
  `INST_BTIME` varchar(20) default NULL COMMENT '流程开始时间',
  `INST_ETIME` varchar(20) default NULL COMMENT '流程结束时间',
  `END_USER_ID` varchar(40) default NULL COMMENT '结束流程用户ID',
  `INST_IF_PARALLEL` decimal(1,0) default NULL COMMENT '流程是否并发，1：是；2：否',
  `INST_PARENT_NODE` varchar(40) default NULL COMMENT '流程的父流程节点ID',
  `S_FLAG` decimal(4,0) default NULL COMMENT '启用标志，1：是；2：否',
  `S_CMPY` varchar(40) default NULL COMMENT '公司ID',
  `S_USER` varchar(40) default NULL COMMENT '添加者',
  `INST_LOCK` decimal(4,0) default NULL COMMENT '锁定状态  1 是 2 否',
  `S_MTIME` varchar(23) default NULL COMMENT '更新时间',
  `INST_LOCK_USER` varchar(40) default NULL COMMENT '锁定人',
  `INST_LOCK_TIME` varchar(20) default NULL COMMENT '锁定时间',
  `INST_MIN` decimal(12,0) default NULL COMMENT '执行时间',
  PRIMARY KEY  (`PI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_proc_inst_his`
--

LOCK TABLES `sy_wfe_proc_inst_his` WRITE;
/*!40000 ALTER TABLE `sy_wfe_proc_inst_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_proc_inst_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_proc_node_def`
--

DROP TABLE IF EXISTS `sy_wfe_proc_node_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_proc_node_def` (
  `ND_ID` varchar(40) NOT NULL COMMENT '节点定义主键',
  `PROC_CODE` varchar(40) default NULL COMMENT '流程编码',
  `NODE_DEF` longtext COMMENT '删除标识，1：正常，2：删除',
  `S_USER` varchar(40) default NULL COMMENT '最后修改用户',
  `S_CMPY` varchar(40) default NULL COMMENT '用户所属公司',
  `S_MTIME` varchar(23) default NULL COMMENT '最后修改时间',
  `S_FLAG` decimal(4,0) default NULL COMMENT '节点配置信息,json格式',
  PRIMARY KEY  (`ND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='子流程节点配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_proc_node_def`
--

LOCK TABLES `sy_wfe_proc_node_def` WRITE;
/*!40000 ALTER TABLE `sy_wfe_proc_node_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_proc_node_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_remind`
--

DROP TABLE IF EXISTS `sy_wfe_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_remind` (
  `REMD_ID` varchar(40) NOT NULL COMMENT '催办单主键',
  `ACPT_USER` varchar(40) default NULL COMMENT '被催办用户',
  `ACPT_DEPT` varchar(40) default NULL COMMENT '被催办部门',
  `ACPT_TDEPT` varchar(40) default NULL COMMENT '被催办有效部门',
  `ACPT_PHONE` varchar(40) default NULL COMMENT '被催办人电话',
  `REMD_TITLE` varchar(200) default NULL COMMENT '催办事项',
  `REMD_REASON` varchar(1000) default NULL COMMENT '催办原因',
  `REMD_CODE` varchar(40) default NULL COMMENT '催办代字',
  `REMD_YEAR` decimal(4,0) default NULL COMMENT '催办年度',
  `REMD_NUM` decimal(4,0) default NULL COMMENT '催办流水号',
  `REMD_CDEPT` varchar(400) default NULL COMMENT '协办部门',
  `DEADLINE` varchar(20) default NULL COMMENT '原定办理日期',
  `OVER_DAYS` decimal(4,0) default NULL COMMENT '超期天数',
  `S_EMERGENCY` varchar(10) default NULL COMMENT '催办缓急',
  `DO_MIND` varchar(400) default NULL COMMENT '办理意见',
  `REMD_PHONE` varchar(40) default NULL COMMENT '催办人电话',
  `REMD_STATUS` decimal(4,0) default NULL COMMENT '催办提醒状态',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标志',
  `S_USER` varchar(40) default NULL COMMENT '催办用户',
  `S_DEPT` varchar(40) default NULL COMMENT '催办用户部门',
  `S_TDEPT` varchar(40) default NULL COMMENT '催办部门',
  `S_ODEPT` varchar(40) default NULL COMMENT '催办机构编码',
  `S_CMPY` varchar(40) default NULL COMMENT '催办公司',
  `S_ATIME` varchar(30) default NULL COMMENT '催办时间',
  `S_MTIME` varchar(30) default NULL COMMENT '修改时间',
  `REMD_SCRT` varchar(20) default NULL COMMENT '密级',
  `SERV_ID` varchar(40) default NULL COMMENT '服务ID',
  `DATA_ID` varchar(40) default NULL COMMENT '数据ID',
  `WF_NODE_ID` varchar(40) default NULL COMMENT '流程节点ID',
  `ACPT_USER_NAME` varchar(40) default NULL COMMENT '被催办人姓名',
  PRIMARY KEY  (`REMD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='催办单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_remind`
--

LOCK TABLES `sy_wfe_remind` WRITE;
/*!40000 ALTER TABLE `sy_wfe_remind` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sy_wfe_remind_proc`
--

DROP TABLE IF EXISTS `sy_wfe_remind_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_remind_proc` (
  `PROC_ID` varchar(40) NOT NULL COMMENT '催办处理过程ID',
  `REMD_ID` varchar(40) default NULL COMMENT '催办ID',
  `PROC_MIND` varchar(400) default NULL COMMENT '催办意见',
  `S_USER` varchar(40) default NULL COMMENT '处理人',
  `S_DEPT` varchar(40) default NULL COMMENT '处理部门',
  `S_TDEPT` varchar(40) default NULL COMMENT '处理有效部门',
  `S_FLAG` decimal(4,0) default NULL COMMENT '删除标志',
  `S_MTIME` varchar(30) default NULL,
  PRIMARY KEY  (`PROC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='催办办理过程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_remind_proc`
--

LOCK TABLES `sy_wfe_remind_proc` WRITE;
/*!40000 ALTER TABLE `sy_wfe_remind_proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_remind_proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sy_wfe_remind_v`
--

DROP TABLE IF EXISTS `sy_wfe_remind_v`;
/*!50001 DROP VIEW IF EXISTS `sy_wfe_remind_v`*/;
/*!50001 CREATE TABLE `sy_wfe_remind_v` (
  `REMD_ID` varchar(40),
  `ACPT_USER` varchar(40),
  `ACPT_DEPT` varchar(40),
  `ACPT_TDEPT` varchar(40),
  `ACPT_PHONE` varchar(40),
  `REMD_TITLE` varchar(200),
  `REMD_REASON` varchar(1000),
  `REMD_CODE` varchar(40),
  `REMD_YEAR` decimal(4,0),
  `REMD_NUM` decimal(4,0),
  `REMD_CDEPT` varchar(400),
  `DEADLINE` varchar(20),
  `OVER_DAYS` decimal(4,0),
  `S_EMERGENCY` varchar(10),
  `DO_MIND` varchar(400),
  `REMD_PHONE` varchar(40),
  `REMD_STATUS` decimal(4,0),
  `S_FLAG` decimal(4,0),
  `S_USER` varchar(40),
  `S_DEPT` varchar(40),
  `S_TDEPT` varchar(40),
  `S_ODEPT` varchar(40),
  `S_CMPY` varchar(40),
  `S_ATIME` varchar(30),
  `S_MTIME` varchar(30),
  `REMD_SCRT` varchar(20),
  `SERV_ID` varchar(40),
  `DATA_ID` varchar(40),
  `WF_NODE_ID` varchar(40),
  `ACPT_USER_NAME` varchar(40),
  `USER_NAME` varchar(40),
  `DEPT_NAME` varchar(100)
) ENGINE=MyISAM */;

--
-- Table structure for table `sy_wfe_test`
--

DROP TABLE IF EXISTS `sy_wfe_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sy_wfe_test` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(400) default NULL,
  `TITLE` varchar(400) default NULL,
  `S_WF_INST` varchar(40) default NULL,
  `S_WF_NODE` varchar(2000) default NULL,
  `S_WF_USER` varchar(2000) default NULL,
  `S_WF_STATE` decimal(4,0) default NULL,
  `S_TDEPT` varchar(40) default NULL,
  `S_TNAME` varchar(40) default NULL,
  `S_DEPT` varchar(40) default NULL,
  `S_DNAME` varchar(40) default NULL,
  `S_USER` varchar(40) default NULL,
  `S_FLAG` decimal(4,0) default NULL,
  `S_MTIME` varchar(23) default NULL COMMENT '修改时间',
  `GW_MAIN_TO` varchar(2000) default NULL COMMENT '主送',
  `MAIN_TO_CODE` varchar(2000) default NULL COMMENT '主送方案编号',
  `GW_COPY_TO` varchar(2000) default NULL COMMENT '抄送',
  `COPY_TO_CODE` varchar(2000) default NULL COMMENT '抄送方案编号',
  `S_WF_USER_STATE` varchar(4000) default NULL,
  `S_HAS_PS_MIND` varchar(100) default NULL COMMENT '指定公司是否有批示意见',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sy_wfe_test`
--

LOCK TABLES `sy_wfe_test` WRITE;
/*!40000 ALTER TABLE `sy_wfe_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `sy_wfe_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `sy_base_user_v`
--

/*!50001 DROP TABLE `sy_base_user_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_base_user_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_base_user_v` AS select `u`.`USER_CODE` AS `USER_CODE`,`u`.`USER_LOGIN_NAME` AS `USER_LOGIN_NAME`,`u`.`USER_NAME` AS `USER_NAME`,`u`.`DEPT_CODE` AS `DEPT_CODE`,`u`.`USER_PASSWORD` AS `USER_PASSWORD`,`u`.`USER_SORT` AS `USER_SORT`,`u`.`USER_HOME_PHONE` AS `USER_HOME_PHONE`,`u`.`USER_MOBILE` AS `USER_MOBILE`,`u`.`USER_QQ` AS `USER_QQ`,`u`.`USER_EMAIL` AS `USER_EMAIL`,`u`.`USER_WORK_LOC` AS `USER_WORK_LOC`,`u`.`USER_POST` AS `USER_POST`,`u`.`USER_POST_LEVEL` AS `USER_POST_LEVEL`,`u`.`USER_ROOM` AS `USER_ROOM`,`u`.`USER_WORK_NUM` AS `USER_WORK_NUM`,`u`.`USER_IDCARD` AS `USER_IDCARD`,`u`.`USER_BIRTHDAY` AS `USER_BIRTHDAY`,`u`.`USER_OFFICE_PHONE` AS `USER_OFFICE_PHONE`,`u`.`USER_NATION` AS `USER_NATION`,`u`.`USER_HEIGHT` AS `USER_HEIGHT`,`u`.`USER_SEX` AS `USER_SEX`,`u`.`USER_HOME_LAND` AS `USER_HOME_LAND`,`u`.`USER_POLITICS` AS `USER_POLITICS`,`u`.`USER_MARRIAGE` AS `USER_MARRIAGE`,`u`.`USER_EDU_LEVLE` AS `USER_EDU_LEVLE`,`u`.`USER_EDU_SCHOOL` AS `USER_EDU_SCHOOL`,`u`.`USER_EDU_MAJOR` AS `USER_EDU_MAJOR`,`u`.`USER_TITLE` AS `USER_TITLE`,`u`.`USER_TITLE_DATE` AS `USER_TITLE_DATE`,`u`.`USER_WORK_DATE` AS `USER_WORK_DATE`,`u`.`USER_CMPY_DATE` AS `USER_CMPY_DATE`,`u`.`USER_STATE` AS `USER_STATE`,`u`.`CMPY_CODE` AS `CMPY_CODE`,`u`.`S_FLAG` AS `S_FLAG`,`u`.`S_USER` AS `S_USER`,`u`.`USER_LOGIN_TYPE` AS `USER_LOGIN_TYPE`,`u`.`USER_EXPIRE_DATE` AS `USER_EXPIRE_DATE`,`u`.`USER_PASSWORD_DATE` AS `USER_PASSWORD_DATE`,`u`.`S_MTIME` AS `S_MTIME`,`u`.`USER_IMG_SRC` AS `USER_IMG_SRC`,`u`.`PT_ID` AS `PT_ID`,`u`.`USER_FROM` AS `USER_FROM`,`u`.`JIANGANG_FLAG` AS `JIANGANG_FLAG`,`u`.`USER_SHORT_NAME` AS `USER_SHORT_NAME`,`u`.`USER_EN_NAME` AS `USER_EN_NAME`,`d`.`DEPT_NAME` AS `DEPT_NAME`,`d`.`DEPT_LEVEL` AS `DEPT_LEVEL`,`d`.`DEPT_SORT` AS `DEPT_SORT`,`d`.`TDEPT_CODE` AS `TDEPT_CODE`,`d`.`ODEPT_CODE` AS `ODEPT_CODE`,`d`.`CODE_PATH` AS `CODE_PATH`,`d`.`S_FLAG` AS `DEPT_FLAG`,`d`.`PT_ID` AS `DEPT_PT_ID` from (`sy_org_user` `u` left join `sy_org_dept` `d` on((`u`.`DEPT_CODE` = `d`.`DEPT_CODE`))) */;

--
-- Final view structure for view `sy_comm_entity_send_dtl_recv`
--

/*!50001 DROP TABLE `sy_comm_entity_send_dtl_recv`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_send_dtl_recv`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_entity_send_dtl_recv` AS select `a`.`ENTITY_ID` AS `ENTITY_ID`,`a`.`TITLE` AS `TITLE`,`a`.`S_EMERGENCY` AS `S_EMERGENCY`,`a`.`MEMO` AS `MEMO`,`b`.`SERV_ID` AS `SERV_ID`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`S_USER` AS `S_USER`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_TDEPT` AS `S_TDEPT`,`a`.`S_ODEPT` AS `S_ODEPT`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_ATIME` AS `S_ATIME`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`S_WF_NODE` AS `S_WF_NODE`,`a`.`S_WF_USER` AS `S_WF_USER`,`a`.`S_WF_STATE` AS `S_WF_STATE`,`a`.`S_WF_INST` AS `S_WF_INST`,`a`.`SERV_NAME` AS `SERV_NAME`,`a`.`ENTITY_CODE` AS `ENTITY_CODE`,`a`.`SERV_SRC_ID` AS `SERV_SRC_ID`,`a`.`S_WF_USER_STATE` AS `S_WF_USER_STATE`,`a`.`S_HAS_PS_MIND` AS `S_HAS_PS_MIND`,`a`.`QUERY_ODEPT` AS `QUERY_ODEPT`,`b`.`SEND_ID` AS `SEND_ID`,`b`.`RECV_ODEPT` AS `RECV_ODEPT`,`b`.`RECV_USER` AS `RECV_USER`,`b`.`RECV_UNAME` AS `RECV_UNAME`,`b`.`RECV_TIME` AS `RECV_TIME`,`b`.`RECV_TYPE` AS `RECV_TYPE`,`b`.`RETN_FLAG` AS `RETN_FLAG`,`b`.`S_ODEPT` AS `SEND_ODEPT`,`b`.`S_USER` AS `SEND_USER`,`b`.`S_UNAME` AS `SEND_UNAME`,`b`.`SEND_TIME` AS `SEND_TIME`,`b`.`SEND_STATUS` AS `SEND_STATUS` from (`sy_comm_entity` `a` join `sy_comm_send_detail` `b`) where ((`a`.`DATA_ID` = `b`.`DATA_ID`) and (`b`.`SEND_STATUS` > 1) and (`a`.`S_FLAG` = 1) and (`b`.`S_FLAG` = 1)) */;

--
-- Final view structure for view `sy_comm_entity_send_dtl_v`
--

/*!50001 DROP TABLE `sy_comm_entity_send_dtl_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_send_dtl_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_entity_send_dtl_v` AS select `a`.`ENTITY_ID` AS `ENTITY_ID`,`a`.`TITLE` AS `TITLE`,`a`.`S_EMERGENCY` AS `S_EMERGENCY`,`a`.`MEMO` AS `MEMO`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`S_USER` AS `S_USER`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_TDEPT` AS `S_TDEPT`,`a`.`S_ODEPT` AS `S_ODEPT`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_ATIME` AS `S_ATIME`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`S_WF_NODE` AS `S_WF_NODE`,`a`.`S_WF_USER` AS `S_WF_USER`,`a`.`S_WF_STATE` AS `S_WF_STATE`,`a`.`S_WF_INST` AS `S_WF_INST`,`a`.`SERV_NAME` AS `SERV_NAME`,`a`.`ENTITY_CODE` AS `ENTITY_CODE`,`a`.`SERV_SRC_ID` AS `SERV_SRC_ID`,`a`.`S_WF_USER_STATE` AS `S_WF_USER_STATE`,`a`.`S_HAS_PS_MIND` AS `S_HAS_PS_MIND`,`a`.`QUERY_ODEPT` AS `QUERY_ODEPT`,`b`.`RECV_ODEPT` AS `RECV_ODEPT`,`b`.`RECV_USER` AS `RECV_USER`,`b`.`RECV_TIME` AS `RECV_TIME`,`b`.`RECV_TYPE` AS `RECV_TYPE`,`b`.`RETN_FLAG` AS `RETN_FLAG`,`b`.`S_ODEPT` AS `SEND_ODEPT`,`b`.`S_USER` AS `SEND_USER`,`b`.`SEND_TIME` AS `SEND_TIME`,`b`.`SEND_STATUS` AS `SEND_STATUS` from (`sy_comm_entity` `a` join `sy_comm_send_detail` `b`) where ((`a`.`DATA_ID` = `b`.`DATA_ID`) and (`b`.`SEND_STATUS` > 1) and (`a`.`S_FLAG` = 1) and (`b`.`S_FLAG` = 1)) */;

--
-- Final view structure for view `sy_comm_entity_tag_v`
--

/*!50001 DROP TABLE `sy_comm_entity_tag_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_entity_tag_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_entity_tag_v` AS select `t`.`ET_ID` AS `et_id`,`t`.`TAG_ID` AS `tag_id`,`t`.`DATA_ID` AS `data_id`,`t`.`SERV_ID` AS `serv_id`,`t`.`S_USER` AS `s_user`,`t`.`S_ATIME` AS `s_atime`,`s`.`S_EMERGENCY` AS `S_emergency`,`s`.`S_MTIME` AS `s_mtime`,`s`.`S_WF_NODE` AS `s_wf_node`,`s`.`S_WF_USER` AS `s_wf_user`,`s`.`TITLE` AS `title`,`s`.`S_WF_STATE` AS `s_wf_state`,`s`.`MEMO` AS `memo`,`s`.`SERV_NAME` AS `serv_name`,`s`.`S_FLAG` AS `S_FLAG`,`s`.`ENTITY_CODE` AS `ENTITY_CODE`,`s`.`S_WF_USER_STATE` AS `S_WF_USER_STATE`,`s`.`QUERY_ODEPT` AS `QUERY_ODEPT` from (`sy_comm_entity_tag` `t` join `sy_comm_entity` `s`) where (`t`.`DATA_ID` = `s`.`DATA_ID`) */;

--
-- Final view structure for view `sy_comm_file_his_v`
--

/*!50001 DROP TABLE `sy_comm_file_his_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_file_his_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_file_his_v` AS select `b`.`FILE_NAME` AS `FILE_NAME`,`a`.`HISTFILE_ID` AS `HISTFILE_ID`,`a`.`FILE_ID` AS `FILE_ID`,`a`.`HISTFILE_PATH` AS `HISTFILE_PATH`,`a`.`HISTFILE_SIZE` AS `HISTFILE_SIZE`,`a`.`HISTFILE_MTYPE` AS `HISTFILE_MTYPE`,`a`.`HISTFILE_MEMO` AS `HISTFILE_MEMO`,`a`.`HISTFILE_VERSION` AS `HISTFILE_VERSION`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_USER` AS `S_USER`,`a`.`S_UNAME` AS `S_UNAME`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_DNAME` AS `S_DNAME`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`FILE_CHECKSUM` AS `FILE_CHECKSUM` from (`sy_comm_file` `b` join `sy_comm_file_his` `a`) where (`a`.`FILE_ID` = `b`.`FILE_ID`) */;

--
-- Final view structure for view `sy_comm_mind_v`
--

/*!50001 DROP TABLE `sy_comm_mind_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_mind_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_mind_v` AS select `a`.`MIND_ID` AS `MIND_ID`,`a`.`MIND_CONTENT` AS `MIND_CONTENT`,`a`.`MIND_CODE` AS `MIND_CODE`,`a`.`MIND_TIME` AS `MIND_TIME`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`WF_NI_ID` AS `WF_NI_ID`,`a`.`MIND_DIS_RULE` AS `MIND_DIS_RULE`,`a`.`MIND_SORT` AS `MIND_SORT`,`a`.`MIND_TYPE` AS `MIND_TYPE`,`a`.`BD_USER` AS `BD_USER`,`a`.`BD_UNAME` AS `BD_UNAME`,`a`.`S_USER` AS `S_USER`,`a`.`S_UNAME` AS `S_UNAME`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_DNAME` AS `S_DNAME`,`a`.`S_TDEPT` AS `S_TDEPT`,`a`.`S_TNAME` AS `S_TNAME`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`USUAL_ID` AS `USUAL_ID`,`a`.`MIND_IS_TERMINAL` AS `MIND_IS_TERMINAL`,`a`.`S_ODEPT` AS `S_ODEPT`,`a`.`MIND_FILE` AS `MIND_FILE`,`a`.`MIND_CODE_NAME` AS `MIND_CODE_NAME`,`a`.`WF_NI_NAME` AS `WF_NI_NAME`,`a`.`MIND_LEVEL` AS `MIND_LEVEL`,`b`.`MIND_VALUE` AS `MIND_VALUE`,`b`.`MIND_CONTENT` AS `USUAL_CONTENT`,`a`.`IS_BD` AS `IS_BD` from (`sy_comm_mind` `a` left join `sy_comm_mind_usual` `b` on((`a`.`USUAL_ID` = `b`.`MIND_ID`))) */;

--
-- Final view structure for view `sy_comm_todo_his_v`
--

/*!50001 DROP TABLE `sy_comm_todo_his_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_todo_his_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_todo_his_v` AS select `a`.`TODO_ID` AS `TODO_ID`,`a`.`OWNER_CODE` AS `OWNER_CODE`,`a`.`DEPT_CODE` AS `DEPT_CODE`,`a`.`TDEPT_CODE` AS `TDEPT_CODE`,`a`.`SEND_USER_CODE` AS `SEND_USER_CODE`,`a`.`TODO_TITLE` AS `TODO_TITLE`,`a`.`TODO_URL` AS `TODO_URL`,`a`.`TODO_SEND_TIME` AS `TODO_SEND_TIME`,`a`.`TODO_FINISH_TIME` AS `TODO_FINISH_TIME`,`a`.`TODO_CODE` AS `TODO_CODE`,`a`.`TODO_CODE_NAME` AS `TODO_CODE_NAME`,`a`.`S_EMERGENCY` AS `S_EMERGENCY`,`a`.`TODO_OPERATION` AS `TODO_OPERATION`,`a`.`TODO_CATALOG` AS `TODO_CATALOG`,`a`.`TODO_OBJECT_ID1` AS `TODO_OBJECT_ID1`,`a`.`TODO_OBJECT_ID2` AS `TODO_OBJECT_ID2`,`a`.`TODO_DEADLINE1` AS `TODO_DEADLINE1`,`a`.`TODO_DEADLINE2` AS `TODO_DEADLINE2`,`a`.`TODO_BENCH_FLAG` AS `TODO_BENCH_FLAG`,`a`.`TODO_ACCESS_FLAG` AS `TODO_ACCESS_FLAG`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`TODO_CONTENT` AS `TODO_CONTENT`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`AGT_USER_CODE` AS `AGT_USER_CODE`,`b`.`S_TDEPT` AS `S_TDEPT`,`b`.`S_ODEPT` AS `S_ODEPT`,`b`.`QUERY_ODEPT` AS `QUERY_ODEPT`,`a`.`SERV_DATA_CODE` AS `SERV_DATA_CODE`,`a`.`TODO_FROM` AS `TODO_FROM` from (`sy_comm_todo_his` `a` left join `sy_comm_entity` `b` on((`a`.`TODO_OBJECT_ID1` = `b`.`DATA_ID`))) */;

--
-- Final view structure for view `sy_comm_todo_v`
--

/*!50001 DROP TABLE `sy_comm_todo_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_comm_todo_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_comm_todo_v` AS select `a`.`TODO_ID` AS `TODO_ID`,`a`.`OWNER_CODE` AS `OWNER_CODE`,`a`.`DEPT_CODE` AS `DEPT_CODE`,`a`.`TDEPT_CODE` AS `TDEPT_CODE`,`a`.`SEND_USER_CODE` AS `SEND_USER_CODE`,`a`.`TODO_TITLE` AS `TODO_TITLE`,`a`.`TODO_URL` AS `TODO_URL`,`a`.`TODO_SEND_TIME` AS `TODO_SEND_TIME`,`a`.`TODO_FINISH_TIME` AS `TODO_FINISH_TIME`,`a`.`TODO_CODE` AS `TODO_CODE`,`a`.`TODO_CODE_NAME` AS `TODO_CODE_NAME`,`a`.`S_EMERGENCY` AS `S_EMERGENCY`,`a`.`TODO_OPERATION` AS `TODO_OPERATION`,`a`.`TODO_CATALOG` AS `TODO_CATALOG`,`a`.`TODO_OBJECT_ID1` AS `TODO_OBJECT_ID1`,`a`.`TODO_OBJECT_ID2` AS `TODO_OBJECT_ID2`,`a`.`TODO_DEADLINE1` AS `TODO_DEADLINE1`,`a`.`TODO_DEADLINE2` AS `TODO_DEADLINE2`,`a`.`TODO_BENCH_FLAG` AS `TODO_BENCH_FLAG`,`a`.`TODO_ACCESS_FLAG` AS `TODO_ACCESS_FLAG`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`TODO_CONTENT` AS `TODO_CONTENT`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`AGT_USER_CODE` AS `AGT_USER_CODE`,`b`.`S_TDEPT` AS `S_TDEPT`,`b`.`S_ODEPT` AS `S_ODEPT`,`b`.`QUERY_ODEPT` AS `Query_Odept`,`a`.`SERV_DATA_CODE` AS `SERV_DATA_CODE`,`a`.`TODO_FROM` AS `TODO_FROM` from (`sy_comm_todo` `a` left join `sy_comm_entity` `b` on((`a`.`TODO_OBJECT_ID1` = `b`.`DATA_ID`))) */;

--
-- Final view structure for view `sy_org_group_user_v`
--

/*!50001 DROP TABLE `sy_org_group_user_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_org_group_user_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_org_group_user_v` AS select `a`.`GU_ID` AS `GU_ID`,`a`.`GROUP_CODE` AS `GROUP_CODE`,`a`.`USER_CODE` AS `USER_CODE`,`a`.`GU_POST` AS `GU_POST`,`a`.`GU_ADMIN` AS `GU_ADMIN`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_MTIME` AS `S_MTIME`,`b`.`GROUP_NAME` AS `GROUP_NAME`,`b`.`GROUP_TYPE` AS `GROUP_TYPE`,`b`.`GROUP_SORT` AS `GROUP_SORT`,`b`.`S_FLAG` AS `GROUP_FLAG`,`b`.`S_CMPY` AS `S_CMPY`,`c`.`S_FLAG` AS `USER_FLAG`,`d`.`ODEPT_CODE` AS `ODEPT_CODE`,`d`.`CODE_PATH` AS `CODE_PATH` from ((`sy_org_group_user` `a` join `sy_org_group` `b`) join (`sy_org_user` `c` left join `sy_org_dept` `d` on((`c`.`DEPT_CODE` = `d`.`DEPT_CODE`)))) where ((`a`.`GROUP_CODE` = `b`.`GROUP_CODE`) and (`a`.`USER_CODE` = `c`.`USER_CODE`)) */;

--
-- Final view structure for view `sy_org_role_user_v`
--

/*!50001 DROP TABLE `sy_org_role_user_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_org_role_user_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_org_role_user_v` AS select `a`.`RU_ID` AS `RU_ID`,`a`.`USER_CODE` AS `USER_CODE`,`a`.`ROLE_CODE` AS `ROLE_CODE`,`a`.`CMPY_CODE` AS `CMPY_CODE`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_USER` AS `S_USER`,`a`.`S_MTIME` AS `S_MTIME`,`b`.`ROLE_NAME` AS `role_name`,`b`.`ROLE_SORT` AS `role_sort`,`c`.`USER_NAME` AS `user_name`,`c`.`USER_LOGIN_NAME` AS `USER_LOGIN_NAME`,`c`.`USER_SORT` AS `user_sort`,`c`.`DEPT_CODE` AS `dept_code`,`c`.`USER_STATE` AS `user_state`,`c`.`S_FLAG` AS `user_s_flag`,`d`.`TDEPT_CODE` AS `tdept_code`,`d`.`ODEPT_CODE` AS `odept_code`,`d`.`DEPT_LEVEL` AS `dept_level`,`d`.`DEPT_SORT` AS `dept_sort`,`d`.`CODE_PATH` AS `code_path` from ((`sy_org_role_user` `a` join `sy_org_role` `b`) join (`sy_org_user` `c` left join `sy_org_dept` `d` on((`c`.`DEPT_CODE` = `d`.`DEPT_CODE`)))) where ((`a`.`ROLE_CODE` = `b`.`ROLE_CODE`) and (`a`.`USER_CODE` = `c`.`USER_CODE`)) */;

--
-- Final view structure for view `sy_org_user_relation_v`
--

/*!50001 DROP TABLE `sy_org_user_relation_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_org_user_relation_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_org_user_relation_v` AS select `r`.`UR_ID` AS `UR_ID`,`r`.`USER_CODE` AS `USER_CODE`,`r`.`ORIGIN_USER_CODE` AS `ORIGIN_USER_CODE`,`r`.`RELATION_TYPE` AS `RELATION_TYPE`,`r`.`RELATION_BTIME` AS `RELATION_BTIME`,`r`.`RELATION_ETIME` AS `RELATION_ETIME`,`r`.`RELATION_MEMO` AS `RELATION_MEMO`,`r`.`CMPY_CODE` AS `CMPY_CODE`,`r`.`ORIGIN_CMPY_CODE` AS `ORIGIN_CMPY_CODE`,`r`.`S_FLAG` AS `S_FLAG`,`r`.`S_USER` AS `S_USER`,`r`.`S_MTIME` AS `S_MTIME`,`d1`.`TDEPT_CODE` AS `TDEPT_CODE`,`d1`.`ODEPT_CODE` AS `ODEPT_CODE`,`d2`.`TDEPT_CODE` AS `ORIG_TDEPT_CODE`,`d2`.`ODEPT_CODE` AS `ORIG_ODEPT_CODE` from ((`sy_org_user_relation` `r` join (`sy_org_user` `u1` left join `sy_org_dept` `d1` on((`u1`.`DEPT_CODE` = `d1`.`DEPT_CODE`)))) join (`sy_org_user` `u2` left join `sy_org_dept` `d2` on((`u2`.`DEPT_CODE` = `d2`.`DEPT_CODE`)))) where ((`u1`.`USER_CODE` = `r`.`USER_CODE`) and (`u2`.`USER_CODE` = `r`.`ORIGIN_USER_CODE`)) */;

--
-- Final view structure for view `sy_org_user_type_agent_rel_v`
--

/*!50001 DROP TABLE `sy_org_user_type_agent_rel_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_org_user_type_agent_rel_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_org_user_type_agent_rel_v` AS select `a`.`RE_AGT_ID` AS `RE_AGT_ID`,`a`.`AGT_ID` AS `AGT_ID`,`a`.`USER_CODE` AS `USER_CODE`,`a`.`FROM_USER_CODE` AS `FROM_USER_CODE`,`a`.`TO_USER_CODE` AS `TO_USER_CODE`,`a`.`AGT_TYPE_CODE` AS `AGT_TYPE_CODE`,`a`.`AGT_USER_PATH` AS `AGT_USER_PATH`,`a`.`AGT_STATUS` AS `AGT_STATUS`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`S_USER` AS `S_USER`,`a`.`REAGT_ID_PATH` AS `REAGT_ID_PATH`,`a`.`SRC_AGT_ID` AS `SRC_AGT_ID`,`a`.`AGT_BEGIN_DATE` AS `AGT_BEGIN_DATE`,`a`.`AGT_END_DATE` AS `AGT_END_DATE`,`a`.`VALID_BEGIN_DATE` AS `VALID_BEGIN_DATE`,`a`.`VALID_END_DATE` AS `VALID_END_DATE`,`a`.`LAST_REAGT_ID` AS `LAST_REAGT_ID`,`b`.`AGT_MEMO` AS `MEMO_S` from (`sy_org_user_type_agent_rel` `a` join `sy_org_user_type_agent` `b`) where (`a`.`AGT_ID` = `b`.`AGT_ID`) */;

--
-- Final view structure for view `sy_serv_log_act_v`
--

/*!50001 DROP TABLE `sy_serv_log_act_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_serv_log_act_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_serv_log_act_v` AS select `a`.`ALOG_ID` AS `ALOG_ID`,`a`.`ACT_ID` AS `ACT_ID`,`a`.`ACT_KEYS` AS `ACT_KEYS`,`a`.`ACT_TIME` AS `ACT_TIME`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_USER` AS `S_USER`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`ACT_IP` AS `ACT_IP`,`a`.`SERV_ID` AS `serv_id`,ifnull(`b`.`ACT_CODE`,`a`.`ACT_ID`) AS `ACT_CODE`,`b`.`ACT_NAME` AS `act_name`,`b`.`ACT_TYPE` AS `act_type` from (`sy_serv_log_act` `a` left join `sy_serv_act` `b` on((`a`.`ACT_ID` = `b`.`ACT_ID`))) */;

--
-- Final view structure for view `sy_serv_log_item_v`
--

/*!50001 DROP TABLE `sy_serv_log_item_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_serv_log_item_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_serv_log_item_v` AS select `a`.`ILOG_ID` AS `ILOG_ID`,`a`.`ITEM_ID` AS `ITEM_ID`,`a`.`ITEM_CODE` AS `ITEM_CODE`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`ILOG_OLD` AS `ILOG_OLD`,`a`.`ILOG_NEW` AS `ILOG_NEW`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_USER` AS `S_USER`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`ILOG_IP` AS `ILOG_IP`,`a`.`SERV_ID` AS `serv_id`,`b`.`ITEM_NAME` AS `item_name`,`b`.`ITEM_INPUT_TYPE` AS `item_input_type`,`b`.`ITEM_INPUT_MODE` AS `item_input_mode`,`b`.`DICT_ID` AS `dict_id` from (`sy_serv_log_item` `a` left join `sy_serv_item` `b` on((`a`.`ITEM_ID` = `b`.`ITEM_ID`))) */;

--
-- Final view structure for view `sy_serv_relate_v`
--

/*!50001 DROP TABLE `sy_serv_relate_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_serv_relate_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_serv_relate_v` AS select `a`.`RELATE_ID` AS `RELATE_ID`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`RELATE_SERV_ID` AS `RELATE_SERV_ID`,`a`.`RELATE_DATA_ID` AS `RELATE_DATA_ID`,`a`.`RELATE_SORT` AS `RELATE_SORT`,`a`.`RELATE_TYPE` AS `RELATE_TYPE`,`a`.`S_USER` AS `S_USER`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_TDEPT` AS `S_TDEPT`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_ATIME` AS `S_ATIME`,`a`.`S_ODEPT` AS `S_ODEPT`,`b`.`TITLE` AS `TITLE`,`b`.`SERV_NAME` AS `SERV_NAME`,`b`.`QUERY_ODEPT` AS `QUERY_ODEPT` from (`sy_serv_relate` `a` left join `sy_comm_entity` `b` on((`a`.`RELATE_DATA_ID` = `b`.`DATA_ID`))) */;

--
-- Final view structure for view `sy_wfe_node_users_v`
--

/*!50001 DROP TABLE `sy_wfe_node_users_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_wfe_node_users_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_wfe_node_users_v` AS select `a`.`UN_ID` AS `UN_ID`,`a`.`NI_ID` AS `NI_ID`,`a`.`TO_USER_ID` AS `TO_USER_ID`,`a`.`TO_USER_NAME` AS `TO_USER_NAME`,`a`.`TO_DEPT_ID` AS `TO_DEPT_ID`,`a`.`TO_DEPT_NAME` AS `TO_DEPT_NAME`,`a`.`PI_ID` AS `PI_ID`,`a`.`S_ATIME` AS `S_ATIME`,`b`.`NODE_IF_RUNNING` AS `NODE_IF_RUNNING` from (`sy_wfe_node_users` `a` join `sy_wfe_node_inst` `b`) where (`a`.`NI_ID` = `b`.`NI_ID`) */;

--
-- Final view structure for view `sy_wfe_remind_v`
--

/*!50001 DROP TABLE `sy_wfe_remind_v`*/;
/*!50001 DROP VIEW IF EXISTS `sy_wfe_remind_v`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sy_wfe_remind_v` AS select `a`.`REMD_ID` AS `REMD_ID`,`a`.`ACPT_USER` AS `ACPT_USER`,`a`.`ACPT_DEPT` AS `ACPT_DEPT`,`a`.`ACPT_TDEPT` AS `ACPT_TDEPT`,`a`.`ACPT_PHONE` AS `ACPT_PHONE`,`a`.`REMD_TITLE` AS `REMD_TITLE`,`a`.`REMD_REASON` AS `REMD_REASON`,`a`.`REMD_CODE` AS `REMD_CODE`,`a`.`REMD_YEAR` AS `REMD_YEAR`,`a`.`REMD_NUM` AS `REMD_NUM`,`a`.`REMD_CDEPT` AS `REMD_CDEPT`,`a`.`DEADLINE` AS `DEADLINE`,`a`.`OVER_DAYS` AS `OVER_DAYS`,`a`.`S_EMERGENCY` AS `S_EMERGENCY`,`a`.`DO_MIND` AS `DO_MIND`,`a`.`REMD_PHONE` AS `REMD_PHONE`,`a`.`REMD_STATUS` AS `REMD_STATUS`,`a`.`S_FLAG` AS `S_FLAG`,`a`.`S_USER` AS `S_USER`,`a`.`S_DEPT` AS `S_DEPT`,`a`.`S_TDEPT` AS `S_TDEPT`,`a`.`S_ODEPT` AS `S_ODEPT`,`a`.`S_CMPY` AS `S_CMPY`,`a`.`S_ATIME` AS `S_ATIME`,`a`.`S_MTIME` AS `S_MTIME`,`a`.`REMD_SCRT` AS `REMD_SCRT`,`a`.`SERV_ID` AS `SERV_ID`,`a`.`DATA_ID` AS `DATA_ID`,`a`.`WF_NODE_ID` AS `WF_NODE_ID`,`a`.`ACPT_USER_NAME` AS `ACPT_USER_NAME`,`b`.`USER_NAME` AS `USER_NAME`,`c`.`DEPT_NAME` AS `DEPT_NAME` from ((`sy_wfe_remind` `a` left join `sy_org_user` `b` on((`a`.`ACPT_USER` = `b`.`USER_CODE`))) left join `sy_org_dept` `c` on((`a`.`ACPT_DEPT` = `c`.`DEPT_CODE`))) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 13:58:15
