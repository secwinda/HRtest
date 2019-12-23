create table SY_COMM_ATTENTION(
ATT_ID VARCHAR(40) not null primary key comment '主键ID',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
PROC_CODE VARCHAR(40) comment '流程编码',
PI_ID VARCHAR(40) comment '流程实例ID',
ATT_TYPE NUMERIC(4) comment '关注类型 1,用户，2,节点',
USER_CODE VARCHAR(40) comment '用户编码',
REMIND_TYPE VARCHAR(40) comment '提醒方式  TODO,EMAIL,MESSAGE',
REMIND_CONTENT VARCHAR(2000) comment '提醒内容',
S_WF_STATE NUMERIC(4) comment '流程的状态',
S_USER VARCHAR(40) comment '用户',
S_TDEPT VARCHAR(40) comment '部门',
S_ODEPT VARCHAR(40) comment '机构',
S_MTIME VARCHAR(40) comment '更新时间',
TITLE VARCHAR(800) comment '标题',
NODE_CODE VARCHAR(40) comment '节点ID',
S_FLAG NUMERIC(4) comment '是否有效  1,是，2,否',
USER_NAME VARCHAR(80) comment '用户名'
) comment '关注';

create table SY_COMM_COMPLETE_DATA(
ID VARCHAR(40) not null primary key comment '主键，UUID',
SRC_SERV_CODE VARCHAR(40) comment '主服务ID',
SERV_CODE VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
CMLE_DEG NUMERIC(3) comment '完成度，字段是否完成乘以权重求和'
) comment '完成度数据记录';

create table SY_COMM_COMPLETE_SETTINGS(
CMLE_ID VARCHAR(40) primary key comment '主键，UUID',
SRC_SERV_CODE VARCHAR(40) comment '主服务code',
SERV_CODE VARCHAR(40) comment '服务ID',
ITEM_CODE VARCHAR(1000) comment '字段ID，超长是因为要存等价服务串的原因',
ITEM_WEIGHT NUMERIC(2) comment '字段权重，99代表1对多的关联表外键标识',
S_FLAG NUMERIC(1) comment '启用标志，1：是；2：否'
) comment '通用完成度表（记录某几个服务形成的主服务的字段填写完整度）';

create table SY_COMM_CONFIG(
CONF_ID VARCHAR(40) not null primary key comment '配置主键',
CONF_NAME VARCHAR(40) comment '配置名称',
CONF_KEY VARCHAR(40) comment '配置key',
CONF_VALUE VARCHAR(2000) comment '配置值',
CONF_FLAG NUMERIC(4) comment '前端使用？ 1：是；2：否（缺省）',
CONF_ORDER NUMERIC(4) comment '配置排序',
CONF_MEMO VARCHAR(400) comment '配置说明',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2否',
S_CMPY VARCHAR(40) comment '公司主键',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2否',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '配置';

create table SY_COMM_DATA_VIEW(
DV_ID VARCHAR(40) not null primary key comment 'ID',
DV_NAME VARCHAR(200) comment '名称',
DS_TYPE VARCHAR(20) comment '数据源类型',
DS_CONF VARCHAR(4000) comment '数据源配置',
VIEW_TYPE VARCHAR(20) comment '展示类型',
DV_CONFIG VARCHAR(2000) comment '数据展示配置',
S_USER VARCHAR(40) comment '最后修改用户',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除',
DS_COUNT NUMERIC(4) comment '最大记录数',
DS_CMPY VARCHAR(40) comment '数据源公司字段',
SHOW_TABLE NUMERIC(4) comment '是否展示表格(1：展示，2：不展示)',
THEME VARCHAR(20) comment '风格'
) comment ' 数据展现';

create table SY_COMM_DATA_VIEW_ITEM(
ITEM_ID VARCHAR(40) not null primary key comment '数据项ID',
DV_ID VARCHAR(40) comment '展现ID',
ITEM_CODE VARCHAR(80) comment '编号',
ITEM_NAME VARCHAR(200) comment '名称',
ITEM_ALIGN VARCHAR(20) comment '对齐方式',
ITEM_SORT NUMERIC(10) comment '排序',
ITEM_TYPE VARCHAR(20) comment '数据项类型',
ITEM_CONFIG VARCHAR(2000) comment '数据展示项配置',
ITEM_VIEW_TYPE VARCHAR(20) comment '数据展示类型',
S_MTIME VARCHAR(23) comment '最后修改时间',
DICT_ID VARCHAR(40) comment '对应字典编码',
ITEM_URL VARCHAR(200) comment '对应URL，支持穿透查询',
SHOW_SUM NUMERIC(4) comment '是否显示合计',
TABLE_SHOW NUMERIC(4) comment '表格显示(1：是，2：否)'
) comment ' 数据展现数据项';

create table SY_COMM_DESK(
DS_ID VARCHAR(40) not null primary key comment '图标主键',
DS_NAME VARCHAR(100) comment '图标名称',
MENU_ID VARCHAR(40) comment '关联菜单编码',
S_CMPY VARCHAR(40) comment '公司主键',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2否',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2否',
DS_ICON VARCHAR(40) comment '',
DS_MENU_FLAG VARCHAR(4) comment '',
DS_NORMAL_FLAG VARCHAR(4) comment '',
DS_ALERT_FLAG VARCHAR(4) comment '',
DS_COUNT_SERV VARCHAR(60) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
DS_FOLDER_FLAG VARCHAR(4) comment '文件夹图标',
DS_FOLDER_MINBLOCK VARCHAR(800) comment '文件夹包含的图标',
DS_FOLDER_MINBLOCK_NAME VARCHAR(800) comment '文件夹包含的图标名称'
) comment '工作台管理';

create table SY_COMM_ENTITY(
ENTITY_ID VARCHAR(40) not null primary key comment '数据ID',
TITLE VARCHAR(1000) comment '标题',
S_EMERGENCY NUMERIC(4) comment '缓急',
MEMO VARCHAR(4000) comment '备注',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
S_USER VARCHAR(40) comment '所属用户ID。如起草人',
S_DEPT VARCHAR(40) comment '所属处室',
S_TDEPT VARCHAR(40) comment '所属部门',
S_ODEPT VARCHAR(40) comment '所属机构',
S_CMPY VARCHAR(40) comment '所属公司',
S_ATIME VARCHAR(23) comment '增加时间',
S_MTIME VARCHAR(23) comment '修改时间',
S_WF_NODE VARCHAR(2000) comment '办理中的节点名称。多个名称之间使用逗号分隔',
S_WF_USER VARCHAR(2000) comment '办理中的用户ID。多个ID之间使用逗号风格',
S_WF_STATE NUMERIC(4) comment '流程状态。',
S_WF_INST VARCHAR(40) comment '所属流程实例',
SERV_NAME VARCHAR(40) comment '功能名称',
ENTITY_CODE VARCHAR(200) comment '编号',
SERV_SRC_ID VARCHAR(40) comment '引用自',
S_FLAG NUMERIC(4) comment '有效标志',
S_WF_USER_STATE VARCHAR(4000) comment '流程用户状态',
DEL_USER VARCHAR(40) comment '删除用户',
DEL_ODEPT VARCHAR(40) comment '删除机构',
S_HAS_PS_MIND VARCHAR(1000) comment '指定公司有批示意见',
QUERY_ODEPT VARCHAR(40) comment ''
) comment '完整数据实体表。所有审批单的数据在此表都会有记录。';

create table SY_COMM_ENTITY_TAG(
ET_ID VARCHAR(40) not null primary key comment '关联数据ID',
TAG_ID VARCHAR(40) comment '标签ID',
DATA_ID VARCHAR(40) comment '关联审批ID',
SERV_ID VARCHAR(40) comment '服务ID',
S_USER VARCHAR(40) comment '创建用户',
S_ATIME VARCHAR(23) comment '创建时间'
) comment '审批单与标签关联表，保存审批单关联的标签';

create table SY_COMM_EXPRSSION(
EXP_ID VARCHAR(40) not null primary key comment '表达式主键，自增',
EXP_NAME VARCHAR(80) comment '表达式名称',
EXP_TYPE NUMERIC(4) comment '表达式类型，1：正则表达式；2：数据格式表达',
EXP_CONTENT VARCHAR(400) comment '表达式内容',
EXP_SORT NUMERIC(4) comment '排序',
EXP_MEMO VARCHAR(400) comment '表达式说明',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '表达式，正则表达式或者自定义表达式';

create table SY_COMM_FAVORITES(
FAVORITE_ID VARCHAR(40) not null primary key comment '主键',
USER_CODE VARCHAR(40) comment '用户编码',
SERV_ID VARCHAR(40) comment '服务ID',
SERV_GROUP VARCHAR(100) comment '服务分组',
DATA_ID VARCHAR(40) comment '数据项ID',
DATA_DIS_NAME VARCHAR(200) comment '数据项显示名称',
DATA_OWNER VARCHAR(40) comment '数据所属人',
S_USER VARCHAR(40) comment '最后修改用户',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_ATIME VARCHAR(23) comment '创建时间',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除',
TAGS VARCHAR(2000) comment '标签'
) comment '收藏';

create table SY_COMM_FAVORITES_MARK(
ID VARCHAR(40) primary key comment '主键',
FAVORITE_ID VARCHAR(40) comment '收藏夹ID',
MARK_ID VARCHAR(40) comment '标签ID'
) comment '';

create table SY_COMM_FILE(
FILE_ID VARCHAR(40) not null primary key comment '文件ID',
FILE_NAME VARCHAR(400) comment '文件名称',
DIS_NAME VARCHAR(400) comment '显示名称',
FILE_PATH VARCHAR(400) comment '文件路径',
FILE_SIZE NUMERIC(12) comment '文件大小',
FILE_MTYPE VARCHAR(100) comment '文件MIME类型',
FILE_MEMO VARCHAR(400) comment '文件说明',
FILE_SORT NUMERIC(4) comment '文件排序',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment 'DATA_ID',
DATA_TYPE NUMERIC(4) comment '类型?1:卡片,2:字段',
FILE_CAT VARCHAR(40) comment '分类',
ITEM_CODE VARCHAR(40) comment '类型字段',
WF_NI_ID VARCHAR(40) comment '工作流节点实例ID',
S_FLAG NUMERIC(4) comment '启用标志? 1：是；2否',
S_USER VARCHAR(40) comment '用户编码',
S_UNAME VARCHAR(100) comment '用户名称',
S_DEPT VARCHAR(40) comment '部门编码',
S_DNAME VARCHAR(100) comment '部门名称',
S_CMPY VARCHAR(40) comment '公司主键',
S_MTIME VARCHAR(23) comment '更新时间',
FILE_HIST_COUNT NUMERIC(4) comment '历史文件数量',
FILE_CHECKSUM VARCHAR(40) comment '校验码',
ORIG_FILE_ID VARCHAR(40) comment '原始物理文件ID。此字段有值的数据，没有物理文件，物理文件为此ID对应数据的物理文件。',
FILE_HEADER VARCHAR(2000)
) comment '系统文件';

create table SY_COMM_FILE_HIS(
HISTFILE_ID VARCHAR(40) not null primary key comment '历史文件主键',
FILE_ID VARCHAR(40) comment '所属文件ID',
HISTFILE_PATH VARCHAR(400) comment '文件存储路径',
HISTFILE_SIZE NUMERIC(12) comment '文件大小',
HISTFILE_MTYPE VARCHAR(100) comment '文件mimetype',
HISTFILE_MEMO VARCHAR(400) comment '文件说明',
HISTFILE_VERSION NUMERIC(4) comment '文件版本号',
S_FLAG NUMERIC(4) comment '删除标识， 1：正常， 2：已删除',
S_USER VARCHAR(40) comment '操作用户',
S_UNAME VARCHAR(100) comment '操作用户名称',
S_DEPT VARCHAR(40) comment '操作用户部门',
S_DNAME VARCHAR(100) comment '操作用户部门名称',
S_CMPY VARCHAR(40) comment '操作用户公司',
S_MTIME VARCHAR(23) comment '操作时间',
FILE_CHECKSUM VARCHAR(40) comment '校验码'
) comment '历史文件';

create table SY_COMM_MENU(
MENU_ID VARCHAR(40) not null primary key comment '菜单主键',
MENU_NAME VARCHAR(60) comment '菜单名称',
MENU_TYPE NUMERIC(4) comment '菜单类型，1：服务；2：URL；3：JS',
MENU_INFO VARCHAR(400) comment '菜单信息，服务类型的菜单对应服务主键',
MENU_PID VARCHAR(40) comment '父菜单主键',
MENU_ORDER NUMERIC(8) comment '菜单排序',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2否',
S_CMPY VARCHAR(40) comment '公司主键',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2否',
MENU_ICON VARCHAR(80) comment '菜单图标',
MENU_LEVEL NUMERIC(4) comment '菜单层级',
CODE_PATH VARCHAR(400) comment '菜单路径',
S_MTIME VARCHAR(23) comment '更新时间',
MENU_AREA VARCHAR(10) comment '菜单显示类型',
MENU_TIP VARCHAR(200) comment '菜单提示信息',
MENU_TODO_FLAG NUMERIC(4) comment '启用提醒?',
MENU_TODO_TYPE VARCHAR(400) comment '提醒对应类型',
DS_NAME VARCHAR(40) comment '图标名称',
DS_MENU_FLAG NUMERIC(4) comment '桌面显示菜单?，1：是（缺省）；2：否',
DS_NORMAL_FLAG NUMERIC(4) comment '桌面码头图标?，1：是（缺省）；2：否',
DS_FOLDER_FLAG NUMERIC(4) comment '桌面文件夹?，1：是；2：否（缺省）',
DS_ICON VARCHAR(80) comment '桌面图标',
MENU_NODE_VIRTUAL VARCHAR(4) comment '是否虚拟节点',
MENU_OTYPE NUMERIC(4) comment '菜单打开方式，1：Tab页；2：新页面；',
MENU_SCOPE NUMERIC(4) comment '范围'
) comment '菜单';

create table SY_COMM_MESSAGE(
MSG_ID VARCHAR(40) not null primary key comment '信息主键，UUID',
MSG_CODE VARCHAR(40) comment '信息编码',
MSG_NAME VARCHAR(400) comment '信息内容',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司编码',
S_FLAG NUMERIC(4) comment '有效标志，1：是；2：否',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '提示信息';

create table SY_COMM_MIND(
MIND_ID VARCHAR(40) not null primary key comment '意见主键',
MIND_CONTENT VARCHAR(4000) comment '意见内容,记录意见内容或文件ID',
MIND_CODE VARCHAR(40) comment '意见编码',
MIND_TIME VARCHAR(20) comment '填意见时间',
SERV_ID VARCHAR(40) comment '服务主键',
DATA_ID VARCHAR(40) comment '数据主键',
WF_NI_ID VARCHAR(40) comment '流程节点实例ID',
MIND_DIS_RULE NUMERIC(1) comment '意见显示规则：1，部门；2，公司',
MIND_SORT NUMERIC(4) comment '意见排序号',
MIND_TYPE NUMERIC(1) comment '意见类型：1，普通意见，2，手写意见,3，附件',
BD_USER VARCHAR(40) comment '补登用户编码',
BD_UNAME VARCHAR(40) comment '补登用户名称',
S_USER VARCHAR(40) comment '填意见用户编码',
S_UNAME VARCHAR(40) comment '填意见用户名称',
S_DEPT VARCHAR(40) comment '部门编码',
S_DNAME VARCHAR(100) comment '部门名称',
S_TDEPT VARCHAR(40) comment '有效部门编码',
S_TNAME VARCHAR(100) comment '有效部门名称',
S_CMPY VARCHAR(40) comment '公司编码',
S_FLAG NUMERIC(1) comment '启用标志:1,启用；2：未启用',
S_MTIME VARCHAR(23) comment '更新时间',
USUAL_ID VARCHAR(40) comment '',
MIND_IS_TERMINAL NUMERIC(4) comment '',
S_ODEPT VARCHAR(40) comment '机构代码',
MIND_FILE VARCHAR(300) comment '',
MIND_CODE_NAME VARCHAR(100) comment '意见编码名称',
WF_NI_NAME VARCHAR(100) comment '流程节点',
MIND_LEVEL NUMERIC(4) comment '意见级别,30:公司领导,20:部门领导,10:处室领导,0:普通',
IS_BD NUMERIC(1) comment '是否补登; 1:是，2:否; 用于标识BD_USER，BD_UNAME是补登用户还是代理办理用户。'
) comment '意见表';

create table SY_COMM_MIND_CODE(
CODE_ID VARCHAR(40) not null primary key comment '编码主键，形式如:QF_1111',
CODE_NAME VARCHAR(40) comment '编码名称',
MIND_TYPE VARCHAR(40) comment '意见类型，形式如：QF',
MIND_DIS_RULE NUMERIC(4) comment '意见显示规则：1,部门内可见,2,机构内可见,3,机构外可见',
MIND_LEVEL NUMERIC(4) comment '意见级别,30:公司领导,20:部门领导,10:处室领导,0:普通',
PUBLIC_LEVEL NUMERIC(4) comment '共享级别：1，一级；2，二级；3，三级',
S_FLAG NUMERIC(4) comment '启用标志：1，启用；2，未启用',
S_USER VARCHAR(40) comment '用户编码',
S_CMPY VARCHAR(40) comment '公司编码',
CODE_SORT NUMERIC(4) comment '排序',
S_MTIME VARCHAR(23) comment '更新时间',
REGULAR_TYPE VARCHAR(80) comment '固定意见ID',
IF_HAND NUMERIC(1) comment '启用启用手写笔？',
MIND_DESC VARCHAR(200) comment '说明'
) comment '意见编码表';

create table SY_COMM_MIND_USUAL(
MIND_ID VARCHAR(40) not null primary key comment '意见ID',
MIND_CONTENT VARCHAR(4000) comment '意见内容',
MIND_TYPE NUMERIC(4) comment '意见类型：1，普通意见，2，手写意见',
S_PUBLIC NUMERIC(4) comment '共享标志',
S_USER VARCHAR(40) comment '用户编码',
S_TDEPT VARCHAR(40) comment '有效部门编码',
S_CMPY VARCHAR(40) comment '公司编码',
S_FLAG NUMERIC(4) comment '启用标志：1，启用；2，未启用',
REGULAR_TYPE VARCHAR(80) comment '固定意见类型',
S_MTIME VARCHAR(23) comment '更新时间',
MIND_VALUE NUMERIC(4) comment '意见属性值',
MIND_SORT NUMERIC(4) comment '固定意见排序'
) comment '常用意见表';

create table SY_COMM_MSG_LISTENER(
LIS_ID VARCHAR(40) not null primary key comment '监听ID',
LIS_CLASS VARCHAR(200) comment '类',
LIS_CONF VARCHAR(2000) comment '配置',
LIST_DESC VARCHAR(200) comment '描述',
S_FLAG NUMERIC(4) comment '启用',
LIS_SORT NUMERIC(10) comment '排序',
S_MTIEM VARCHAR(23) comment '更新时间',
LIS_ACTION VARCHAR(4000) comment '监听消息类型'
) comment '消息监听';

create table SY_COMM_MSG_TYPE(
USER_CODE VARCHAR(40) not null primary key comment '用户ID',
RT_TYPE VARCHAR(40) comment '提醒方式。来自数据字典，SY_REMIND_TYPE。默认的方式有，短信、邮件、RTX。',
S_MTIME VARCHAR(23) comment '修改时间'
) comment '待办提醒方式服务';

create table SY_COMM_RECENTLY_USE(
RECENTLY_ID VARCHAR(40) not null primary key comment 'ID',
RECENTLY_USER VARCHAR(40) comment '最近使用人',
RECENTLY_TIME VARCHAR(40) comment '最近一次时间',
RECENTLY_MENU_URL VARCHAR(400) comment '菜单地址',
RECENTLY_MENU_TYPE VARCHAR(4) comment '菜单类型',
RECENTLY_MENU_NAME VARCHAR(80) comment '菜单名称',
RECENTLY_MENU_PIC VARCHAR(40) comment '菜单图标',
RECENTLY_PIC_TIP VARCHAR(40) comment 'TIP'
) comment '最近使用';

create table SY_COMM_REMIND(
REM_ID VARCHAR(40) not null primary key comment '主键',
REM_TITLE VARCHAR(500) comment '提醒标题',
REM_CONTENT VARCHAR(2000) comment '提醒内容',
REM_URL VARCHAR(1000) comment '提醒URL',
S_USER VARCHAR(40) comment '提醒人',
S_ATIME VARCHAR(30) comment '提醒添加时间',
EXECUTE_TIME VARCHAR(30) comment '提醒时间',
FINISH_TIME VARCHAR(30) comment '提醒完成时间',
STATUS VARCHAR(20) comment '提醒状态，WAITING，待提醒，FINISHED；已完成；ERROR，已出错；CANCLE，已取消',
TYPE VARCHAR(400) comment '提醒类型，TODO，待办；EMAIL，邮件；MESSAGE，短消息；INTIME，即时通讯；',
S_CMPY VARCHAR(40) comment '公司ID',
S_FLAG NUMERIC(4) comment '删除标记，1：有效；2：无效',
S_MTIME VARCHAR(30) comment '更新时间',
S_EMERGENCY NUMERIC(4) comment '紧急程度，10，一般；20，紧急；30，特急',
SERV_ID VARCHAR(200) comment '服务ID',
SERV_SRC_ID VARCHAR(200) comment 'SRC服务ID',
DATA_ID VARCHAR(200) comment '数据ID',
REM_GROUP VARCHAR(400) comment '提醒消息分组',
USER_ID VARCHAR(400) comment '被提醒人',
REMOTE_URL VARCHAR(1000) comment '外系统应用提醒URL'
) comment '提醒消息表';

create table SY_COMM_REMIND_GROUP(
GROUP_ID VARCHAR(40) not null primary key comment '主键',
S_USER VARCHAR(40) comment '当前用户',
REM_GROUP VARCHAR(400) comment '消息分组名称'
) comment '提醒消息的分组类型';

create table SY_COMM_REMIND_HIS(
REM_ID VARCHAR(40) not null primary key comment '主键',
REM_TITLE VARCHAR(500) comment '提醒标题',
REM_CONTENT VARCHAR(2000) comment '提醒内容',
REM_URL VARCHAR(1000) comment '提醒URL',
S_USER VARCHAR(40) comment '提醒人',
S_ATIME VARCHAR(30) comment '提醒添加时间',
EXECUTE_TIME VARCHAR(30) comment '提醒时间',
FINISH_TIME VARCHAR(30) comment '提醒完成时间',
STATUS VARCHAR(20) comment '提醒状态，WAITING，待提醒，FINISHED；已完成；ERROR，已出错；CANCLE，已取消',
TYPE VARCHAR(400) comment '提醒类型，TODO，待办；EMAIL，邮件；MESSAGE，短消息；INTIME，即时通讯；',
S_CMPY VARCHAR(40) comment '公司ID',
S_FLAG NUMERIC(4) comment '删除标记，1：有效；2：无效',
S_MTIME VARCHAR(30) comment '更新时间',
S_EMERGENCY NUMERIC(4) comment '紧急程度，10，一般；20，紧急；30，特急',
SERV_ID VARCHAR(200) comment '服务ID',
SERV_SRC_ID VARCHAR(200) comment 'SRC服务ID',
DATA_ID VARCHAR(200) comment '数据ID'
) comment '提醒消息历史表';

create table SY_COMM_REMIND_USERS(
REMIND_USER_ID VARCHAR(40) not null primary key comment '主键',
REMIND_ID VARCHAR(40) not null comment '提醒主键',
USER_ID VARCHAR(40) comment '被提醒人',
STATUS VARCHAR(40) comment '状态',
SUCCESS VARCHAR(400) comment '成功的提醒类型',
FAILURE VARCHAR(400) comment '失败的提醒类型'
) comment '被提醒人员表';

create table SY_COMM_SCHED(
JOB_CODE VARCHAR(200) not null primary key comment '任务CODE',
SCHED_NAME VARCHAR(120) comment 'sched name',
JOB_GROUP VARCHAR(200) comment '任务组',
DESCRIPTION VARCHAR(250) comment '任务说明',
JOB_CLASS_NAME VARCHAR(250) not null comment '任务实现类',
IS_DURABLE VARCHAR(1) not null comment '是否持久化',
IS_NONCONCURRENT VARCHAR(1) not null comment '暂未使用',
IS_UPDATE_DATA VARCHAR(1) comment '暂未使用',
REQUESTS_RECOVERY VARCHAR(1) comment '中断是否恢复',
JOB_DATA VARCHAR(1000) comment '任务参数',
JOB_STATE VARCHAR(10) comment '任务状态',
JOB_TYPE NUMERIC(4) comment '任务类型, 1:public, 2: cmpy private',
S_USER VARCHAR(40) comment '创建人',
S_UNAME VARCHAR(40) comment '用户名称',
S_CMPY VARCHAR(40) comment '公司ID',
S_MTIME VARCHAR(23) comment '更新时间',
JOB_CMPYS_STATUS NUMERIC(4) comment '所属公司? 1:不指定,2:全公司,3:自定义',
JOB_CMPYS VARCHAR(500) comment '自定义公司',
SERV_ID VARCHAR(40) comment '服务ID',
JOB_CONTEXT_USER VARCHAR(40) comment '执行用户'
) comment '任务';

create table SY_COMM_SCHED_HIS(
ID VARCHAR(200) not null primary key comment '日志主键',
SCHED_NAME VARCHAR(120) comment 'schedule name',
JOB_TYPE VARCHAR(1) not null comment '表示任务类型.1:普通任务,2:恢复任务',
JOB_NAME VARCHAR(200) not null comment '任务代码',
JOB_GROUP VARCHAR(200) not null comment '任务组',
TRIGGER_NAME VARCHAR(200) not null comment '触发器代码',
STATUS VARCHAR(1) not null comment '表示执行状态.1:成功,2:失败',
FIRE_TIME VARCHAR(40) not null comment '执行时间',
END_TIME VARCHAR(40) comment '完成时间',
REFIRE_COUNT NUMERIC(4) not null comment '重试次数',
INSTANCE VARCHAR(200) comment '任务计划执行实例',
DESCRIPTION VARCHAR(1000) comment '说明',
S_MTIME VARCHAR(40) comment '最后修改时间'
) comment '任务执行日志';

create table SY_COMM_SCHED_TRIGGER(
SCHED_NAME VARCHAR(120) not null comment 'sched_name',
TRIGGER_CODE VARCHAR(200) not null primary key comment '触发器CODE',
TRIGGER_GROUP VARCHAR(200) comment '触发器组',
JOB_CODE VARCHAR(200) not null comment '任务CODE',
JOB_GROUP VARCHAR(200) comment '任务组',
DESCRIPTION VARCHAR(250) comment '说明',
NEXT_FIRE_TIME VARCHAR(25) comment '下次启动时间',
PREV_FIRE_TIME VARCHAR(25) comment '上次启动时间',
PRIORITY NUMERIC(13) comment '优先级',
TRIGGER_STATE VARCHAR(16) not null comment '状态',
TRIGGER_TYPE VARCHAR(8) not null comment '类型',
START_TIME VARCHAR(25) comment '开始时间',
END_TIME VARCHAR(25) comment '停止时间',
CALENDAR_NAME VARCHAR(200) comment 'calendar name',
MISFIRE_INSTR NUMERIC(2) comment 'misfire_instr',
JOB_DATA VARCHAR(1000) comment 'job_data',
SIMPLE_TRIGGER_REPEAT_COUNT NUMERIC(13) comment '重复次数',
SIMPLE_TRIGGER_INTERVAL NUMERIC(13) comment '触发间隔',
CRONTAB_EXPRESSTION VARCHAR(50) comment 'unix crontab表达式',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '任务触发器';

create table SY_COMM_SEND(
SEND_ID VARCHAR(40) not null primary key comment '方案ID',
SEND_NAME VARCHAR(100) comment '方案名称',
SEND_MEMO VARCHAR(1000) comment '方案说明',
S_PUBLIC NUMERIC(4) comment '公共标志：1，公共；2：非公共',
S_FLAG NUMERIC(4) comment '启用标志：1，启用；2：未启有',
S_USER VARCHAR(40) comment '用户编码',
O_DEPT VARCHAR(40) comment '所属机构编码',
S_CMPY VARCHAR(40) comment '所属公司编码',
S_MTIME VARCHAR(23) comment '更新时间',
SEND_ORDER NUMERIC(4) comment '排序'
) comment '分发方案表';

create table SY_COMM_SEND_DETAIL(
SEND_ID VARCHAR(40) not null primary key comment '分发主键',
SERV_ID VARCHAR(40) not null comment '服务主键',
DATA_ID VARCHAR(40) not null comment '数据主键',
SEND_TIME VARCHAR(23) comment '分发时间',
SEND_NUM NUMERIC(4) comment '分发份数',
SEND_TYPE NUMERIC(4) comment '办理类型 1,办件，2，阅件',
RECV_USER VARCHAR(40) comment '接收用户编码',
RECV_UNAME VARCHAR(100) comment '接收用户名称',
RECV_DEPT VARCHAR(40) comment '接收部门编码',
RECV_DNAME VARCHAR(500) comment '接收部门名称',
RECV_TIME VARCHAR(20) comment '接收时间',
RECV_MIND VARCHAR(4000) comment '接收意见',
RETN_FLAG NUMERIC(4) comment '退回标志',
SEND_STATUS NUMERIC(4) comment '发送状态，1：等待，2：发送',
S_FLAG NUMERIC(4) comment '启用标志',
S_USER VARCHAR(40) comment '用户编码',
S_UNAME VARCHAR(100) comment '用户名称',
S_DEPT VARCHAR(40) comment '部门编码',
S_DNAME VARCHAR(100) comment '部门名称',
S_TDEPT VARCHAR(40) comment '有效部门编码',
S_TNAME VARCHAR(100) comment '有效部门名称',
S_CMPY VARCHAR(40) comment '公司编码',
S_MTIME VARCHAR(23) comment '更新时间',
RECV_ODEPT VARCHAR(40) comment '接收人所在机构编码',
S_ODEPT VARCHAR(40) comment '分发人机构编码；分发人所在机构编码',
RECV_TYPE VARCHAR(40) comment '接收单位类别；OUTSIDE机构外，INSIDE机构内',
RECV_TDEPT VARCHAR(40) comment '接收人所在部门编码',
RECV_TNAME VARCHAR(60) comment '接收人所在部门名称',
MIND_CODE VARCHAR(15) comment '意见编码',
RECV_REAL_USER VARCHAR(40) comment '实际接收人',
RECV_REAL_USER_NAME VARCHAR(40) comment '实际接收人姓名'
) comment '分发表';

create table SY_COMM_SEND_ITEM(
ITEM_ID VARCHAR(40) not null primary key comment '方案明细ID',
SEND_ID VARCHAR(100) comment '方案ID',
ROLE_USER_CODE VARCHAR(40) comment '角色/用户/部门编码',
ITEM_NAME VARCHAR(100) comment '方案明细显示名称：类型为用户，显示用户名；类型为角色，显示角色名',
ITEM_SORT NUMERIC(4) comment '排序号',
DEPT_CODES VARCHAR(4000) comment '部门编码。对于角色+部门来说，可能要保存此数据',
DEPT_NAMES VARCHAR(4000) comment '部门名称。对于角色+部门来说，可能要保存此数据',
ITEM_TYPE VARCHAR(40) comment '方案类型，user:用户；orle：角色；dept：部门；other_cmpy:其他单位；other_sys：系统外单位；',
S_ODEPT VARCHAR(40) comment '创建人所属机构编码',
S_USER VARCHAR(40) comment '创建人用户编码',
S_FLAG NUMERIC(4) comment '启用标志，1：启用；2：未启用',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '分发明细表';

create table SY_COMM_TAG(
TAG_ID VARCHAR(40) not null primary key comment '',
TAG_NAME VARCHAR(60) comment '',
TAG_LEVEL VARCHAR(60) comment '',
TAG_TYPE VARCHAR(30) comment '',
TAG_GROUP VARCHAR(60) comment '',
S_CMPY VARCHAR(40) comment '',
S_USER VARCHAR(40) comment '',
S_MTIME VARCHAR(30) comment ''
) comment '';

create table SY_COMM_TEMPL(
PT_ID VARCHAR(40) not null primary key comment '主键',
PT_TITLE VARCHAR(200) comment '标题',
PT_CONTENT VARCHAR(4000) comment '内容',
PT_TYPE VARCHAR(20) comment '类型',
PT_PARAM VARCHAR(2000) comment '参数设定',
PT_EXP VARCHAR(800) comment '规则设定',
PT_TIP VARCHAR(400) comment '模版说明',
USER_CODE VARCHAR(40) comment '关联用户',
S_PUBLIC NUMERIC(4) comment '公共标志',
S_FLAG NUMERIC(4) comment '启用标志',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
S_MTIME VARCHAR(30) comment '更新时间',
PT_INCL_CSSJS VARCHAR(800) comment '引入公共文件',
PT_TYPE_DEFAULT VARCHAR(4) comment '类型默认 ',
PT_TYPE_ATTRIBUTE VARCHAR(20) comment '类型(规则)',
PT_EXP_ORDER NUMERIC(4) comment '规则排序',
PT_STYLE VARCHAR(200) comment '模板样式'
) comment '首页模板';

create table SY_COMM_TEMPL_COMS(
PC_ID VARCHAR(40) not null primary key comment '主键',
PC_NAME VARCHAR(200) comment '名称',
PC_CON VARCHAR(4000) comment '对应文件',
PC_PARAM VARCHAR(1000) comment '参数设定',
PC_EXP VARCHAR(800) comment '规则设定',
PC_TIP VARCHAR(400) comment '组件说明',
PC_TYPE VARCHAR(20) comment '类型',
PC_COMMNET VARCHAR(800) comment '备注',
S_PUBLIC NUMERIC(4) comment '公共标志',
S_FLAG NUMERIC(4) comment '启用标志',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
S_MTIME VARCHAR(30) comment '更新时间',
PC_DATA VARCHAR(1000) comment '数据对象',
PC_SELF_PARAM VARCHAR(4000) comment '个性参数定义',
PC_SELF_PARAM_JS VARCHAR(2000) comment '个性JS',
PC_USE_AREA VARCHAR(20) comment '可应用范围 ',
PC_DS_LOC VARCHAR(10) comment ''
) comment '模板组件';

create table SY_COMM_TODO(
TODO_ID VARCHAR(40) not null primary key comment '待办表主键',
OWNER_CODE VARCHAR(40) comment '待办用户[角色]编码',
DEPT_CODE VARCHAR(40) comment '部门编码',
TDEPT_CODE VARCHAR(40) comment '有效部门编码',
SEND_USER_CODE VARCHAR(40) comment '发待办的用户编码',
TODO_TITLE VARCHAR(1000) comment '待办标题',
TODO_URL VARCHAR(500) comment '待办链接',
TODO_SEND_TIME VARCHAR(20) comment '发送时间',
TODO_FINISH_TIME VARCHAR(20) comment '完成时间',
TODO_CODE VARCHAR(40) comment '待办编码',
TODO_CODE_NAME VARCHAR(40) comment '待办编码名称',
TODO_OPERATION VARCHAR(40) comment '待办操作',
TODO_CATALOG NUMERIC(1) comment '办件[阅件]标志；1：办件；2：阅件',
TODO_OBJECT_ID1 VARCHAR(40) comment '对象ID1',
TODO_OBJECT_ID2 VARCHAR(40) comment '对象ID2',
TODO_DEADLINE1 VARCHAR(20) comment '办理期限1',
TODO_DEADLINE2 VARCHAR(20) comment '办理期限2',
TODO_BENCH_FLAG NUMERIC(1) comment '代理状态，1：已代理；2：未代理',
TODO_ACCESS_FLAG NUMERIC(1) comment '访问标志，1：已访问；2：未访问',
S_CMPY VARCHAR(40) comment '公司编码',
TODO_CONTENT VARCHAR(2000) comment '待办内容',
S_MTIME VARCHAR(23) comment '更新时间',
SERV_ID VARCHAR(40) comment '服务ID',
SERV_DATA_CODE VARCHAR(60) comment '数据编号，如公文编号',
S_EMERGENCY NUMERIC(4) comment '紧急程度',
TODO_FROM VARCHAR(23) comment '待办来自哪种业务：如wf工作流，remind消息提醒',
AGT_USER_CODE VARCHAR(40) comment '代办人code',
TODO_TYPE VARCHAR(40) comment '待办标识，与服务提供的待办标识对应，用于分组显示待办总数',
TODO_LAST NUMERIC(4) comment '最新标识，1：最新；0或2：不是最新'
) comment '待办事务表';

create table SY_COMM_TODO_DRAFT(
TODO_ID VARCHAR(40) not null primary key comment '主办表主键',
OWNER_CODE VARCHAR(40) comment '待办用户[角色]编码',
DEPT_CODE VARCHAR(40) comment '部门编码',
TDEPT_CODE VARCHAR(40) comment '有效部门编码',
SEND_USER_CODE VARCHAR(40) comment '发待办的用户编码',
TODO_TITLE VARCHAR(1000) comment '待办标题',
TODO_URL VARCHAR(500) comment '待办链接',
TODO_SEND_TIME VARCHAR(20) comment '发送时间',
TODO_FINISH_TIME VARCHAR(20) comment '完成时间',
TODO_CODE VARCHAR(40) comment '待办编码',
TODO_CODE_NAME VARCHAR(40) comment '待办编码名称',
TODO_EMERGENCY NUMERIC(1) comment '待办缓急',
TODO_OPERATION VARCHAR(40) comment '待办操作',
TODO_OBJECT_ID1 VARCHAR(40) comment '对象ID1',
TODO_OBJECT_ID2 VARCHAR(40) comment '对象ID2',
TODO_DEADLINE1 VARCHAR(20) comment '办理期限1',
TODO_DEADLINE2 VARCHAR(20) comment '办理期限2',
TODO_BENCH_FLAG NUMERIC(1) comment '代理状态，1：已代理；2：未代理',
TODO_ACCESS_FLAG NUMERIC(1) comment '访问标志，1：已访问；2：未访问',
TODO_CONTENT VARCHAR(2000) comment '内容',
S_CMPY VARCHAR(40) comment '公司编码',
S_MTIME VARCHAR(23) comment '更新时间',
S_WF_NODE VARCHAR(2000) comment '当前节点',
S_WF_USER VARCHAR(2000) comment '当前用户',
S_WF_STATE NUMERIC(4) comment '是否运行',
S_WF_INST VARCHAR(40) comment '流程实例',
TODO_TYPE VARCHAR(40) comment '待办标识，与服务提供的待办标识对应，用于分组显示待办总数'
) comment '主办事务';

create table SY_COMM_TODO_HIS(
TODO_ID VARCHAR(40) not null primary key comment '待办表主键',
OWNER_CODE VARCHAR(40) comment '待办用户[角色]编码',
DEPT_CODE VARCHAR(40) comment '部门编码',
TDEPT_CODE VARCHAR(40) comment '有效部门编码',
SEND_USER_CODE VARCHAR(40) comment '发待办的用户编码',
TODO_TITLE VARCHAR(1000) comment '待办标题',
TODO_URL VARCHAR(500) comment '待办链接',
TODO_SEND_TIME VARCHAR(20) comment '发送时间',
TODO_FINISH_TIME VARCHAR(20) comment '完成时间',
TODO_CODE VARCHAR(40) comment '待办编码',
TODO_CODE_NAME VARCHAR(40) comment '待办编码名称',
TODO_OPERATION VARCHAR(40) comment '待办操作',
TODO_CATALOG NUMERIC(1) comment '办件[阅件]标志；1：办件；2：阅件',
TODO_OBJECT_ID1 VARCHAR(40) comment '对象ID1',
TODO_OBJECT_ID2 VARCHAR(40) comment '对象ID2',
TODO_DEADLINE1 VARCHAR(20) comment '办理期限1',
TODO_DEADLINE2 VARCHAR(20) comment '办理期限2',
TODO_BENCH_FLAG NUMERIC(1) comment '代理状态，1：已代理；2：未代理',
TODO_ACCESS_FLAG NUMERIC(1) comment '访问标志，1：已访问；2：未访问',
S_CMPY VARCHAR(40) comment '公司编码',
TODO_CONTENT VARCHAR(2000) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
SERV_ID VARCHAR(40) comment '服务ID',
SERV_DATA_CODE VARCHAR(60) comment '数据编号，如公文编号',
S_EMERGENCY NUMERIC(4) comment '',
TODO_FROM VARCHAR(23) comment '待办来自哪种业务：如wf工作流，remind消息提醒',
AGT_USER_CODE VARCHAR(40) comment '代办人code',
TODO_TYPE VARCHAR(40) comment '待办标识，与服务提供的待办标识对应，用于分组显示待办总数'
) comment '待办历史表[已办表]';

create table SY_COMM_USUAL(
USUAL_ID VARCHAR(40) not null primary key comment 'ID',
TITLE VARCHAR(500) comment '常用批语内容',
TYPE_CODE VARCHAR(30) comment '类型编码，假设它是可以用在其它地方。例如，常用批语：MIND；',
S_PUBLIC NUMERIC(4) comment '公共标志：1，公共；2：非公共',
S_USER VARCHAR(40) comment '用户编码',
S_ODEPT VARCHAR(40) comment '所属机构编码',
S_CMPY VARCHAR(40) comment '所属公司编码',
S_MTIME VARCHAR(23) comment '更新时间',
USUAL_SORT NUMERIC(10) comment '常用批语排序号'
) comment '常用批语功能';

create table SY_COMM_WORK_DAY(
DAY_ID VARCHAR(40) not null primary key comment '主键ID',
DAY_SPECIAL_DATE VARCHAR(20) comment '日期',
DAY_FLAG NUMERIC(4) comment '是否工作日 (1,工作日，2，放假)',
S_CMPY VARCHAR(40) comment '公司CODE',
S_FLAG NUMERIC(4) comment '是否有效 (1，是，2，否)'
) comment '工作日期设置';

create table SY_ORG_ACL(
ACL_ID VARCHAR(40) not null primary key comment '权限控制主键',
SERV_ID VARCHAR(40) comment '服务[菜单]编码',
ACT_CODE VARCHAR(40) comment '操作编码',
ACL_TYPE NUMERIC(4) comment '权限控制类型',
ACL_OWNER VARCHAR(40) comment '权限所有者',
ACL_OTYPE NUMERIC(4) comment '所有者类型，1：角色；2：部门；3用户',
S_CMPY VARCHAR(40) comment '公司主键',
ORU_NAME VARCHAR(100) comment '所有者名称'
) comment '权限控制列表';

create table SY_ORG_CMPY(
CMPY_CODE VARCHAR(40) not null primary key comment '公司编码',
CMPY_NAME VARCHAR(40) comment '公司名称',
CMPY_FULLNAME VARCHAR(100) comment '公司全称',
CMPY_COUNTRY VARCHAR(30) comment '所在国家',
CMPY_PROVINCE VARCHAR(30) comment '所在省份',
CMPY_CITY VARCHAR(30) comment '所在城市',
CMPY_ADDRESS VARCHAR(100) comment '公司地址',
CMPY_POSTCODE VARCHAR(6) comment '公司邮编',
CMPY_PHONE VARCHAR(40) comment '公司电话',
CMPY_FAX VARCHAR(40) comment '公司传真',
CMPY_CONTACTOR VARCHAR(20) comment '联系人',
CMPY_PCODE VARCHAR(40) comment '上级公司编码',
CMPY_SORT NUMERIC(4) comment '公司排序',
CMPY_DESC VARCHAR(400) comment '公司描述',
CMPY_LEVEL NUMERIC(1) comment '公司级别',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
CODE_PATH VARCHAR(400) comment '编码路径',
S_MTIME VARCHAR(23) comment '更新时间',
PT_ID VARCHAR(40) comment '公司模版编码'
) comment '公司表';

create table SY_ORG_DEPT(
DEPT_CODE VARCHAR(40) not null primary key comment '部门编码',
DEPT_NAME VARCHAR(100) comment '部门名称',
DEPT_PCODE VARCHAR(40) comment '上级部门编码',
DEPT_SORT NUMERIC(4) comment '部门排序号',
DEPT_MEMO VARCHAR(400) comment '部门描述',
DEPT_EMAIL VARCHAR(40) comment '部门邮箱',
CMPY_CODE VARCHAR(40) not null comment '公司编码',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
CODE_PATH VARCHAR(4000) comment '编码路径',
DEPT_LEVEL NUMERIC(4) comment '部门层级',
DEPT_TYPE NUMERIC(4) comment '部门类型：1：普通部门；2：机构',
S_MTIME VARCHAR(23) comment '更新时间',
DEPT_SHORT_NAME VARCHAR(40) comment '部门简称',
ODEPT_CODE VARCHAR(40) comment '机构部门编码',
TDEPT_CODE VARCHAR(40) comment '有效部门编码',
DEPT_SRC_TYPE1 VARCHAR(40) comment '扩展类型1',
DEPT_SRC_TYPE2 VARCHAR(40) comment '扩展类型2',
DEPT_LINE VARCHAR(4000) comment '业务条线',
PT_ID VARCHAR(40) comment '部门模版编码',
DEPT_FULL_NAME VARCHAR(200) comment '部门全称',
DEPT_SRC_TYPE3 VARCHAR(80) comment '扩展属性3',
DEPT_SRC_TYPE4 VARCHAR(80) comment '扩展属性4',
DEPT_ENNAME VARCHAR(200) comment '英文名称',
DEPT_SHORT_ENNAME VARCHAR(200) comment '英文简称'
) comment '部门表';

create table SY_ORG_DEPT_DIRECTOR(
DD_ID VARCHAR(40) not null primary key comment '部门主管表主键',
DEPT_CODE VARCHAR(40) not null  comment '部门编码',
USER_CODE VARCHAR(40) not null  comment '用户编码',
CMPY_CODE VARCHAR(40) not null comment '公司编码',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '部门主管表';

create table SY_ORG_GROUP(
GROUP_CODE VARCHAR(40) not null primary key comment '群组编码，UUID',
GROUP_NAME VARCHAR(80) comment '群组名称',
GROUP_TYPE NUMERIC(4) comment '群组类型',
GROUP_MEMO VARCHAR(400) comment '群组说明',
S_FLAG NUMERIC(4) comment '有效标志，1：有效；2：无效',
S_CMPY VARCHAR(40) comment '公司编码',
S_ODEPT VARCHAR(40) comment '组织编码',
S_MTIME VARCHAR(30) comment '更新时间',
GROUP_SORT NUMERIC(10) comment '群组排序',
DATA_ID VARCHAR(40) comment '数据主键：组织类型对应部门编码，自定义和临时类型对应创建用户编码',
GROUP_IMG VARCHAR(80) comment '群组头像'
) comment '群组管理';

create table SY_ORG_GROUP_USER(
GU_ID VARCHAR(40) not null primary key comment '主键，UUID',
GROUP_CODE VARCHAR(40) comment '群组编码，UUID',
USER_CODE VARCHAR(40) comment '用户编码',
GU_POST VARCHAR(40) comment '岗位',
GU_ADMIN NUMERIC(4) comment '是否管理员，1：是；2：否',
S_FLAG NUMERIC(4) comment '有效标志，1：是；2：否',
S_MTIME VARCHAR(30) comment '更新时间'
) comment '群组用户';

create table SY_ORG_ROLE(
ROLE_CODE VARCHAR(40) not null primary key comment '角色编码',
ROLE_NAME VARCHAR(40) comment '角色名称',
ROLE_SORT NUMERIC(4) comment '角色排序号',
ROLE_MEMO VARCHAR(400) comment '角色描述',
ROLE_CATALOG VARCHAR(40) comment '角色分类',
CMPY_CODE VARCHAR(40) not null comment '公司编码',
S_PUBLIC NUMERIC(1) comment '是否公共角色，1：是；2：否',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(23) comment '更新时间',
ROLE_SCOPE NUMERIC(6) comment ''
) comment '角色表';

create table SY_ORG_ROLE_USER(
RU_ID VARCHAR(40) not null primary key comment '角色用户表主键',
USER_CODE VARCHAR(40) not null comment '用户编码',
ROLE_CODE VARCHAR(40) not null comment '角色编码',
CMPY_CODE VARCHAR(40) comment '公司编码',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '角色用户表';

create table SY_ORG_USER(
USER_CODE VARCHAR(40) not null primary key comment '用户编码',
USER_LOGIN_NAME VARCHAR(40) comment '用户系统登录名',
USER_NAME VARCHAR(40) comment '用户名称',
DEPT_CODE VARCHAR(40) comment '部门编码',
USER_PASSWORD VARCHAR(80) comment '用户密码',
USER_SORT NUMERIC(10) comment '用户排序号',
USER_HOME_PHONE VARCHAR(40) comment '家庭电话',
USER_MOBILE VARCHAR(40) comment '手机号码',
USER_QQ VARCHAR(40) comment '用户QQ',
USER_EMAIL VARCHAR(40) comment '用户邮箱',
USER_WORK_LOC VARCHAR(40) comment '工位号',
USER_POST VARCHAR(40) comment '用户职位',
USER_POST_LEVEL NUMERIC(10) comment '职位级别',
USER_ROOM VARCHAR(80) comment '房间号',
USER_WORK_NUM VARCHAR(40) comment '工号',
USER_IDCARD VARCHAR(18) comment '身份证号',
USER_BIRTHDAY VARCHAR(20) comment '出生日期',
USER_OFFICE_PHONE VARCHAR(40) comment '办公电话',
USER_NATION VARCHAR(20) comment '民族',
USER_HEIGHT NUMERIC(4) comment '身高(cm)',
USER_SEX NUMERIC(4) comment '用户性别,0:男;1:女',
USER_HOME_LAND VARCHAR(40) comment '籍贯',
USER_POLITICS VARCHAR(10) comment '政治面貌',
USER_MARRIAGE VARCHAR(10) comment '婚姻状况',
USER_EDU_LEVLE VARCHAR(10) comment '学历',
USER_EDU_SCHOOL VARCHAR(200) comment '学校',
USER_EDU_MAJOR VARCHAR(200) comment '专业',
USER_TITLE VARCHAR(40) comment '职称',
USER_TITLE_DATE VARCHAR(20) comment '职称日期',
USER_WORK_DATE VARCHAR(20) comment '参加工作日期',
USER_CMPY_DATE VARCHAR(20) comment '入职日期',
USER_STATE NUMERIC(4) comment '人员状态，1：在职；2：离职；3：退休',
CMPY_CODE VARCHAR(40) not null comment '公司编码',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
USER_LOGIN_TYPE NUMERIC(4) comment '登录认证类型，1：密码；2：动态口令；3：CA认证',
USER_EXPIRE_DATE VARCHAR(20) comment '用户有效日期',
USER_PASSWORD_DATE VARCHAR(20) comment '密码有效日期',
S_MTIME VARCHAR(23) comment '更新时间',
USER_IMG_SRC VARCHAR(100) comment '用户头像源图片',
PT_ID VARCHAR(40) comment '用户模版编码',
USER_FROM VARCHAR(20) comment '来自哪个系统',
JIANGANG_FLAG NUMERIC(2) comment '兼岗标记：1兼岗用户；2非兼岗用户',
USER_SHORT_NAME VARCHAR(20) comment '用户简称：名称拼音首字母简写',
USER_EN_NAME VARCHAR(60) comment '用户拼音：用户英文名或者拼音'
) comment '用户表';

create table SY_ORG_USER_AGENT(
AGT_ID VARCHAR(40) not null primary key comment '主键，UUID',
USER_CODE VARCHAR(40) comment '被委托人',
TO_USER_CODE VARCHAR(40) comment '受委托人',
AGT_BEGIN_DATE VARCHAR(20) comment '委托开始日期',
AGT_END_DATE VARCHAR(20) comment '委托截至日期',
AGT_END_TYPE NUMERIC(4) comment '如何结束委托？1：手动结束；2：自动结束',
AGT_NOW_TYPE VARCHAR(800) comment '现有待办委托：1：待办事务；2：待阅事务（可多选）',
AGT_AFTER_TYPE VARCHAR(800) comment '以后待办委托：1：待办事务；2：待阅事务（可多选）',
AGT_MEMO VARCHAR(4000) comment '留言信息',
AGT_STATUS NUMERIC(4) comment '委托状态，1：委托中；2：未启动；3：委托结束',
S_CMPY VARCHAR(40) comment '所在公司',
S_USER VARCHAR(40) comment '操作人',
S_MTIME VARCHAR(30) comment '更新时间',
S_FLAG NUMERIC(4) comment '有效标志，1：有效；2：无效',
TYPE_CODES VARCHAR(1000) comment '委托事务类型（字典手工维护）,逗号分隔多种类型'
) comment '用户委托管理';

create table SY_ORG_USER_AGT_TYPE(
AGT_TYPE_ID VARCHAR(40) not null primary key comment '主键，UUID',
AGT_TYPE_CODE VARCHAR(40) comment '业务类型代码',
AGT_TYPE_NAME VARCHAR(1000) comment '业务类型名称',
AGT_COND VARCHAR(1000) comment '业务类型条件',
AGT_ORDER NUMERIC(4) comment '排序',
S_CMPY VARCHAR(40) comment '公司编码',
S_MTIME VARCHAR(40) comment '更新时间',
S_USER VARCHAR(40) comment '创建人',
S_FLAG NUMERIC(4) comment '有效标志，1：有效；2：无效'
) comment '用户委托业务类型表';

create table SY_ORG_USER_DESK(
SD_ID VARCHAR(40) not null primary key comment '主键',
SD_DESK_DEFAULT VARCHAR(20) comment '默认屏幕',
SD_APP_DEFAULT VARCHAR(100) comment '默认应用',
SD_INIT_THEME VARCHAR(20) comment '默认主题',
SD_INIT_DESK VARCHAR(20) comment '默认桌面',
SD_INIT_APP VARCHAR(4) comment '初始化系统程序',
SD_MSG_FLAG VARCHAR(4) comment '接受消息提醒',
SD_RING_FLAG VARCHAR(4) comment '接受消息声音提醒',
SD_SYSTEM_THEME VARCHAR(40) comment '系统主题',
SD_BACK_IMG VARCHAR(40) comment '背景桌面',
SD_SELF_DEF VARCHAR(400) comment '自定义',
USER_CODE VARCHAR(40) comment '关联用户',
S_PUBLIC NUMERIC(4) comment '公共标志',
S_FLAG NUMERIC(4) comment '启用标志',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
SD_SELF_SELECT VARCHAR(100) comment '',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '工作台设置';

create table SY_ORG_USER_DESK_ICON(
PI_ID VARCHAR(40) not null primary key comment '主键',
PI_TITLE VARCHAR(200) comment '页面标题',
PI_SERVS VARCHAR(4000) comment '服务集合，逗号分隔的菜单主键信息，非节点菜单项',
USER_CODE VARCHAR(40) comment '关联用户',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2：否',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
PI_ORDER NUMERIC(4) comment '排序',
PI_NORMAO_ICON VARCHAR(400) comment '',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '图标化首页';

create table SY_ORG_USER_DESK_MB(
SD_ID VARCHAR(40) not null primary key comment '',
SD_APPS VARCHAR(2000) comment '',
SD_INIT_DESK VARCHAR(20) comment '',
SD_SYSTEM_THEME VARCHAR(40) comment '',
SD_BACK_IMG VARCHAR(40) comment '',
USER_CODE VARCHAR(40) comment '',
S_PUBLIC NUMERIC(4) comment '',
S_FLAG NUMERIC(4) comment '',
S_CMPY VARCHAR(40) comment '',
S_USER VARCHAR(40) comment '',
S_MTIME VARCHAR(40) comment ''
) comment '';

create table SY_ORG_USER_FLOATMENU(
USER_CODE VARCHAR(40) not null primary key comment '用户编码',
COMS_ID VARCHAR(2000) comment '组件ID',
COMS_NAME VARCHAR(2000) comment '组件名称'
) comment '';

create table SY_ORG_USER_RELATION(
UR_ID VARCHAR(40) not null primary key comment '用户关系表主键',
USER_CODE VARCHAR(40) not null comment '用户编码',
ORIGIN_USER_CODE VARCHAR(40) not null  comment '原用户编码',
RELATION_TYPE NUMERIC(1) comment '用户关系类型;0,兼职;1，移交；2，代理',
RELATION_BTIME VARCHAR(20) comment '开始时间',
RELATION_ETIME VARCHAR(20) comment '结束时间',
RELATION_MEMO VARCHAR(400) comment '用户关系描述',
CMPY_CODE VARCHAR(40) not null comment '公司编码',
ORIGIN_CMPY_CODE VARCHAR(40) not null comment '原公司编码',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '用户关系表';

create table SY_ORG_USER_RESUME(
RSM_ID VARCHAR(40) not null primary key comment '主键，自增',
USER_CODE VARCHAR(40) comment '用户编码',
RSM_BEGIN_DATE VARCHAR(20) comment '起始日期',
RSM_END_DATE VARCHAR(20) comment '截至日期',
RSM_COMPANY VARCHAR(200) comment '所在公司/学校',
RSM_TITLE VARCHAR(200) comment '职务',
RSM_MEMO VARCHAR(4000) comment '简介',
RSM_WITNESS VARCHAR(40) comment '见证人',
RSM_TYPE NUMERIC(4) comment '类别',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '简历信息';

create table SY_ORG_USER_REWARD(
RWD_ID VARCHAR(40) not null primary key comment '主键，UUID',
USER_CODE VARCHAR(40) comment '用户编码',
RWD_TITLE VARCHAR(80) comment '奖惩称谓',
RWD_TYPE NUMERIC(4) comment '奖惩类型，1：奖励；2：惩罚',
RWD_MEMO VARCHAR(4000) comment '奖惩说明',
RWD_DATE VARCHAR(20) comment '日期',
S_MTIME VARCHAR(23) comment '更新时间'
) comment '奖惩情况';

create table SY_ORG_USER_STATE(
USER_CODE VARCHAR(40) not null primary key comment '用户编码',
USER_LAST_IP VARCHAR(40) comment '上次登录IP',
USER_LAST_LOGIN VARCHAR(30) comment '上次登录时间',
USER_LOGIN_FAILS NUMERIC(4) comment '登录失败次数',
MENU_TIME VARCHAR(30) comment '菜单时间',
USER_AGT_FLAG NUMERIC(4) comment '委托标志？ 1：是；2：否，当前是否在委托他人办理状态',
SUB_CODES VARCHAR(4000) comment '代理用户列表，用户编码逗号分隔，正在被哪些人委托',
S_MTIME VARCHAR(30) comment '更新时间',
JIAN_CODES VARCHAR(4000) comment '兼岗用户列表，多个用户逗号分隔，第一个用户为主用户',
LEAD_CODES VARCHAR(4000) comment '领导列表，本人作为哪些领导的秘书',
USER_SUB_FLAG NUMERIC(4) comment '用户被委托标识， 1：是；2：否',
USER_CMLE_DEG NUMERIC(3) comment '用户资料完成度',
USER_LAST_OS VARCHAR(80) comment '操作系统',
USER_LAST_PCNAME VARCHAR(80) comment '机器名',
USER_LAST_BROWSER VARCHAR(80) comment '浏览器',
USER_TOKEN VARCHAR(200) comment '用户令牌',
USER_LAST_CLIENT VARCHAR(80) comment '客户端',
MODIFY_PASSWORD NUMERIC(4) comment '修改密码'
) comment '用户状态信息';

create table SY_ORG_USER_STYLE(
SS_ID VARCHAR(40) not null primary key comment '主键',
SS_STYLE_MENU VARCHAR(40) comment '菜单(风格定义)',
SS_STYLE_BACK VARCHAR(40) comment '背景(风格定义)',
SS_STYLE_BLOCK VARCHAR(40) comment '信息块(风格定义)',
USER_CODE VARCHAR(40) comment '关联用户',
S_PUBLIC NUMERIC(4) comment '公共标志',
S_FLAG NUMERIC(4) comment '启用标志',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
S_MTIME VARCHAR(23) comment '更新时间',
SS_STYLE_PORTAL VARCHAR(2000) comment ''
) comment '风格定义设置';

create table SY_ORG_USER_TYPE_AGENT(
AGT_ID VARCHAR(40) not null primary key comment '主键，UUID',
USER_CODE VARCHAR(40) comment '被委托人',
AGT_BEGIN_DATE VARCHAR(20) comment '委托开始日期',
AGT_END_DATE VARCHAR(20) comment '委托截至日期',
AGT_END_TYPE NUMERIC(4) comment '如何结束委托？1：手动结束；2：自动结束',
AGT_MEMO VARCHAR(4000) comment '留言信息',
AGT_STATUS NUMERIC(4) comment '委托状态，1：委托中；2：未开始；3：委托结束',
S_CMPY VARCHAR(40) comment '所在公司',
S_USER VARCHAR(40) comment '操作人',
S_MTIME VARCHAR(30) comment '更新时间',
S_FLAG NUMERIC(4) comment '有效标志，1：有效；2：无效',
REAL_END_DATE VARCHAR(20) comment '实际结束时间',
AGT_CURRTODO_FLAG NUMERIC(4) comment '是否交办当前待办，1：是；2否'
) comment '用户业务委托管理';

create table SY_ORG_USER_TYPE_AGENT_REL(
RE_AGT_ID VARCHAR(40) not null primary key comment '主键，UUID',
AGT_ID VARCHAR(40) comment '外键，UUID',
USER_CODE VARCHAR(40) comment '委托人',
FROM_USER_CODE VARCHAR(40) comment '起委托人',
TO_USER_CODE VARCHAR(40) comment '受委托人',
AGT_TYPE_CODE VARCHAR(40) comment '委托业务类型代码',
AGT_USER_PATH VARCHAR(4000) comment '委托用户路径',
AGT_STATUS NUMERIC(4) comment '委托状态，1：委托中；2：未开始；3：委托结束',
S_FLAG NUMERIC(4) comment '有效标志，1：有效；2：无效',
S_CMPY VARCHAR(40) comment '公司编码',
S_MTIME VARCHAR(40) comment '更新时间',
S_USER VARCHAR(40) comment '创建人',
REAGT_ID_PATH VARCHAR(4000) comment '委托主键路径',
SRC_AGT_ID VARCHAR(40) comment '起始点外键，UUID',
AGT_BEGIN_DATE VARCHAR(20) comment '委托开始日期',
AGT_END_DATE VARCHAR(20) comment '委托结束日期',
VALID_BEGIN_DATE VARCHAR(20) comment '有效开始日期',
VALID_END_DATE VARCHAR(20) comment '有效结束日期',
LAST_REAGT_ID VARCHAR(40) comment '上一个节点主键，UUID',
REAL_END_DATE VARCHAR(20) comment '实际结束时间'
) comment '用户业务委托管理关系
A委托A1给B产生委托关系ab，
B委托A1给C产生委托关系bc，
C委托A1给D产生委托关系cd，
对于ab,"委托人"是A，"起委托人"是A，"受委托人"是B，
对于bc,"委托人"是A，"起委托人"是B，"受委托人"是C，
对于cd,"委托人"是A，"起委托人"是C，"受委托人"是D';

create table SY_ORG_WORK_HANDOVER(
HO_ID VARCHAR(40) not null primary key comment 'ID',
ORIG_USER_CODE VARCHAR(40) not null comment '移交用户ID',
ORIG_USER_NAME VARCHAR(40) comment '移交用户姓名',
ORIG_ODEPT_CODE VARCHAR(40) not null comment '移交用户机构ID',
TARGET_USER_CODE VARCHAR(40) not null comment '接收用户ID',
TARGET_USER_NAME VARCHAR(40) comment '接收用户姓名',
TARGET_ODEPT_CODE VARCHAR(40) not null comment '接受用户机构ID',
S_USER VARCHAR(40) not null comment '操作用户',
S_ATIME VARCHAR(23) not null comment '操作时间'
) comment '';

create table SY_PLUG_REPORT(
REPORT_NAME VARCHAR(120) not null comment '报表名称',
REPORT_PRODUCT VARCHAR(40) not null comment '报表类型',
REPORT_FILE VARCHAR(200) not null comment '报表文件名称',
S_USER VARCHAR(40) comment '最后修改用户',
S_UNAME VARCHAR(40) comment '最后修改用户名称',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除',
REPORT_CODE VARCHAR(120) not null primary key comment '编码'
) comment '报表配置';

create table SY_PLUG_REPORT_ITEM(
ID VARCHAR(120) not null primary key comment '主键',
REPORT_CODE VARCHAR(40) comment '报表编码',
ARG_NAME VARCHAR(120) comment '参数名称',
ARG_CODE VARCHAR(120) comment '参数编码',
ARG_TYPE VARCHAR(120) comment '参数类型',
DEFAULT_VALUE VARCHAR(40) comment '缺省值',
INPUT_MODE VARCHAR(200) comment '输入模式',
ACTIVE NUMERIC(4) comment '是否启用',
INPUT_CONFIG VARCHAR(2000) comment '输入配置',
INPUT_TYPE VARCHAR(40) comment '输入类型',
ARG_COLS NUMERIC(4) comment '参数项占用列数',
S_USER VARCHAR(40) comment '',
S_UNAME VARCHAR(40) comment '',
S_CMPY VARCHAR(40) comment '',
S_MTIME VARCHAR(23) comment '',
S_FLAG NUMERIC(4) comment '',
COL_WIDTH NUMERIC(4) comment '参数宽度'
) comment '报表配置项';

create table SY_PLUG_SEARCH_CUSTOM(
ID VARCHAR(120) not null primary key comment '主键',
KEYWORD VARCHAR(120) comment '关键词',
FIELD VARCHAR(200) comment '关键词位置',
SERVICE VARCHAR(2000) comment '限定搜索的数据源',
ORDER_FIELD VARCHAR(2000) comment '结果排序方式',
SORT NUMERIC(4) comment '排序',
DATA_LIMIT NUMERIC(4) comment '结果显示条数',
S_USER VARCHAR(40) comment '最后修改用户',
S_UNAME VARCHAR(40) comment '最后修改用户名称',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除'
) comment '个性化搜索';

create table SY_PLUG_SEARCH_LINK(
LINK_ID VARCHAR(40) not null primary key comment '关联主键,UUID',
SERV_ID VARCHAR(40) comment '服务主键',
LINK_SERV_ID VARCHAR(40) comment '关联服务主键',
LINK_TITLE VARCHAR(400) comment '检索标题，支持变量替换',
LINK_COUNT NUMERIC(4) comment '关联类型，1：SQL关联；2：检索关联',
LINK_ORDER NUMERIC(4) comment '关联排序',
LINK_WHERE VARCHAR(400) comment 'Where过滤条件',
S_FLAG NUMERIC(4) comment '有效标志，1：是；2：否',
LINK_CONDITION VARCHAR(800) comment '有效表达式，js格式，支持变量替换',
LINK_URL VARCHAR(400) comment '链接URL',
LINK_MORE_URL VARCHAR(400) comment '更多URL',
LINK_DYNAMIC NUMERIC(4) comment '是否动态判断？，1：是（查询时检查）；2：否（索引时坚持）'
) comment '检索关联服务';

create table SY_PLUG_SEARCH_WEBCRAW(
ID VARCHAR(120) not null primary key comment '主键',
NAME VARCHAR(120) comment '显示名称',
HOST VARCHAR(200) comment '网站地址',
CRAWL_URL VARCHAR(2000) comment '起始抓取URL',
URL_FILTER VARCHAR(2000) comment 'url过滤规则',
TITLE_PRE_TAG VARCHAR(500) comment '标题截取前缀',
TITLE_POST_TAG VARCHAR(500) comment '标题截取后缀',
TITLE_REGEXP VARCHAR(100) comment '标题截取正则',
CONTENT_PRE_TAG VARCHAR(500) comment '内容截取前缀',
CONTENT_POST_TAG VARCHAR(500) comment '内容截取后缀',
CONTENT_REGEXP VARCHAR(100) comment '内容截取正则',
CATEGORYS_CONF VARCHAR(3000) comment '栏目配置，例：<category name="政务工作" reg-exp=".*/tab60/.*" />',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除',
S_MTIME VARCHAR(23) comment '更新时间',
GRANTEE_TYPE VARCHAR(4) comment '',
GRANTEE VARCHAR(3000) comment '',
CRAWL_DEPTH NUMERIC(4) comment 'crawlDepth'
) comment '网站抓取';

create table SY_PLUG_SEARCH_WORD(
WORD_ID VARCHAR(40) not null primary key comment '主键，自增',
WORD_CODE VARCHAR(80) comment '词语',
WORD_LENGTH NUMERIC(4) comment '长度',
WORD_ORDER NUMERIC(10) comment '排序',
WORD_TYPE VARCHAR(40) comment '分类',
WORD_FLAG NUMERIC(4) comment '同步标志，1：已同步；2：未同步'
) comment '全文检索词库';

CREATE TABLE SY_QRTZ_BLOB_TRIGGERS(
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
BLOB_DATA BLOB,
PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
);


CREATE TABLE SY_QRTZ_CALENDARS(
SCHED_NAME VARCHAR(120) NOT NULL COMMENT '',
CALENDAR_NAME VARCHAR(200) NOT NULL  COMMENT '',
CALENDAR BLOB NOT NULL COMMENT '',
PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
);


create table SY_QRTZ_CRON_TRIGGERS(
SCHED_NAME VARCHAR(120) not null  comment '',
TRIGGER_NAME VARCHAR(200) not null  comment '',
TRIGGER_GROUP VARCHAR(200) not null  comment '',
CRON_EXPRESSION VARCHAR(120) not null comment '',
TIME_ZONE_ID VARCHAR(80) comment '',
PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_NAME`)
);


CREATE TABLE SY_QRTZ_FIRED_TRIGGERS(
SCHED_NAME VARCHAR(120) NOT NULL  COMMENT '',
ENTRY_ID VARCHAR(95) NOT NULL  COMMENT '',
TRIGGER_NAME VARCHAR(200) NOT NULL COMMENT '',
TRIGGER_GROUP VARCHAR(200) NOT NULL COMMENT '',
INSTANCE_NAME VARCHAR(200) NOT NULL COMMENT '',
FIRED_TIME NUMERIC(13) NOT NULL COMMENT '',
PRIORITY NUMERIC(13) NOT NULL COMMENT '',
STATE VARCHAR(16) NOT NULL COMMENT '',
JOB_NAME VARCHAR(200) COMMENT '',
JOB_GROUP VARCHAR(200) COMMENT '',
IS_NONCONCURRENT VARCHAR(1) COMMENT '',
REQUESTS_RECOVERY VARCHAR(1) COMMENT '',
PRIMARY KEY (`ENTRY_ID`,`SCHED_NAME`)
);



create table SY_QRTZ_JOB_DETAILS(
SCHED_NAME VARCHAR(120) not null comment '',
JOB_NAME VARCHAR(200) not null  comment '',
JOB_GROUP VARCHAR(200) not null  comment '',
DESCRIPTION VARCHAR(250) comment '',
JOB_CLASS_NAME VARCHAR(250) not null comment '',
IS_DURABLE VARCHAR(1) not null comment '',
IS_NONCONCURRENT VARCHAR(1) not null comment '',
IS_UPDATE_DATA VARCHAR(1) not null comment '',
REQUESTS_RECOVERY VARCHAR(1) not null comment '',
JOB_DATA BLOB comment '',
PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) comment '';


create table SY_QRTZ_LOCKS(
SCHED_NAME VARCHAR(120) not null  comment '',
LOCK_NAME VARCHAR(40) not null  comment '',
PRIMARY KEY (`LOCK_NAME`,`SCHED_NAME`)
);

create table SY_QRTZ_PAUSED_TRIGGER_GRPS(
SCHED_NAME VARCHAR(120) not null  comment '',
TRIGGER_GROUP VARCHAR(200) not null  comment '',
PRIMARY KEY (`TRIGGER_GROUP`,`SCHED_NAME`)
);



create table SY_QRTZ_SCHEDULER_STATE(
SCHED_NAME VARCHAR(120) not null  comment '',
INSTANCE_NAME VARCHAR(200) not null  comment '',
LAST_CHECKIN_TIME NUMERIC(13) not null comment '',
CHECKIN_INTERVAL NUMERIC(13) not null comment '',
PRIMARY KEY (`INSTANCE_NAME`,`SCHED_NAME`)
);



create table SY_QRTZ_SIMPLE_TRIGGERS(
SCHED_NAME VARCHAR(120) not null  comment '',
TRIGGER_NAME VARCHAR(200) not null  comment '',
TRIGGER_GROUP VARCHAR(200) not null  comment '',
REPEAT_COUNT NUMERIC(7) not null comment '',
REPEAT_INTERVAL NUMERIC(12) not null comment '',
TIMES_TRIGGERED NUMERIC(10) not null comment '',
PRIMARY KEY (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
);



create table SY_QRTZ_SIMPROP_TRIGGERS(
SCHED_NAME VARCHAR(120) not null  comment '',
TRIGGER_NAME VARCHAR(200) not null  comment '',
TRIGGER_GROUP VARCHAR(200) not null  comment '',
STR_PROP_1 VARCHAR(512) comment '',
STR_PROP_2 VARCHAR(512) comment '',
STR_PROP_3 VARCHAR(512) comment '',
INT_PROP_1 NUMERIC(10) comment '',
INT_PROP_2 NUMERIC(10) comment '',
LONG_PROP_1 NUMERIC(13) comment '',
LONG_PROP_2 NUMERIC(13) comment '',
DEC_PROP_1 NUMERIC(13,4) comment '',
DEC_PROP_2 NUMERIC(13,4) comment '',
BOOL_PROP_1 VARCHAR(1) comment '',
BOOL_PROP_2 VARCHAR(1) comment '',
PRIMARY KEY (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
);


create table SY_QRTZ_TRIGGERS(
SCHED_NAME VARCHAR(120) not null  comment '',
TRIGGER_NAME VARCHAR(200) not null  comment '',
TRIGGER_GROUP VARCHAR(200) not null  comment '',
JOB_NAME VARCHAR(200) not null comment '',
JOB_GROUP VARCHAR(200) not null comment '',
DESCRIPTION VARCHAR(250) comment '',
NEXT_FIRE_TIME NUMERIC(13) comment '',
PREV_FIRE_TIME NUMERIC(13) comment '',
PRIORITY NUMERIC(13) comment '',
TRIGGER_STATE VARCHAR(16) not null comment '',
TRIGGER_TYPE VARCHAR(8) not null comment '',
START_TIME NUMERIC(13) not null comment '',
END_TIME NUMERIC(13) comment '',
CALENDAR_NAME VARCHAR(200) comment '',
MISFIRE_INSTR NUMERIC(2) comment '',
JOB_DATA BLOB comment '',
PRIMARY KEY (`TRIGGER_GROUP`,`SCHED_NAME`,`TRIGGER_NAME`)
);

create table SY_SERV(
SERV_ID VARCHAR(40) not null primary key comment '服务主键',
SERV_TYPE NUMERIC(4) comment '服务类型  1：服务；2：报表；3：数据表；4：自定义',
SERV_NAME VARCHAR(80) comment '服务名称',
SERV_PID VARCHAR(40) comment '父服务编码',
TABLE_VIEW VARCHAR(40) comment '查询表名  select时用到的表或者视图名',
TABLE_ACTION VARCHAR(40) comment '操作表名  修改或删除时用到的表名',
SERV_SQL_WHERE VARCHAR(200) comment 'WHERE条件',
SERV_DATA_SOURCE VARCHAR(40) comment '数据源编码',
SERV_KEYS VARCHAR(200) comment '主键信息  多个主键用逗号分隔',
SERV_LIST_STYLE VARCHAR(400) comment '列表样式定义',
SERV_PAGE_COUNT NUMERIC(4) comment '每页记录数',
SERV_JS VARCHAR(1000) comment '卡片扩展HTML',
SERV_LIST_LOAD VARCHAR(400) comment '列表装载JS',
SERV_CARD_LOAD VARCHAR(400) comment '卡片装载JS',
SERV_CARD_STYLE NUMERIC(4) comment '卡片页面列数',
SERV_CLASS VARCHAR(100) comment '服务扩展类',
SERV_CACHE_FLAG NUMERIC(4) comment '缓存标志  1：缓存（随用随装载）；2：不装载（缺省）3：缓存（全部装载）',
SERV_LOCK_FLAG NUMERIC(4) comment '乐观锁判断  1：启用锁定判断；2：不判断',
SERV_DELETE_FLAG NUMERIC(4) comment '假删除判断  1：启用假删除及S_FLAG；2：不启用',
SERV_AUTH_FLAG NUMERIC(4) comment '权限判断 1：session判断  2：服务权限；3：操作权限；4：数据权限；9：不 判断',
SERV_NAV_ITEMS VARCHAR(400) comment '左侧导航字段，多个逗号分隔',
SERV_MEMO VARCHAR(2000) comment '服务说明',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2：否',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '创建者',
SERV_SQL_ORDER VARCHAR(200) comment 'ORDERBY语句',
SERV_DICT_CACHE VARCHAR(400) comment '字典缓存，支持多个字典编码，逗号分隔，修改数据后会自动清除对应字典的缓存',
SERV_SEARCH_FLAG NUMERIC(4) comment '全文索引标志，1：启用；2：禁用（缺省）',
SERV_SRC_ID VARCHAR(40) comment '引用自服务？（共享附件设置）',
SERV_CMPY VARCHAR(40) comment '公司字段，用于区分多组织，装载对应字典',
S_MTIME VARCHAR(23) comment '更新时间',
SERV_MOBILE_LIST VARCHAR(2000) comment '移动列表格式，HTML代码，自定义移动列表显示格式',
SERV_DATA_TITLE VARCHAR(400) comment '标题格式，支持多个字段组合格式',
SERV_CARD_TMPL VARCHAR(100) comment '卡片模版？ 1：是；2：否',
SERV_DATA_CODE VARCHAR(200) comment '编码格式',
SERV_QUERY_MODE NUMERIC(4) comment '查询模式，1：简洁模式；2：平铺模式；3：窗口模式',
SERV_RED_HEAD VARCHAR(200) comment '红头文字',
SERV_CARD_TMPL_CODES VARCHAR(1000) comment '模版表达式，多卡片模版选择表达式，JSON列表格式，按顺序执行。',
SERV_WF_FLAG NUMERIC(4) comment '流程标志：1.自动启动流程；2.手动或不启动流程',
SERV_FILE_PATH VARCHAR(400) comment '文件路径',
SERV_NO_COUNT NUMERIC(4) comment '查询不计总数？1：是；2：否（缺省）',
PRO_FLAG NUMERIC(4) comment '产品标识？1：是；2：否',
SAFE_FLAG NUMERIC(4) comment '安全html?, 1:是；2：否（缺省），启用后用户输入的<和>会被转换为安全格式',
TODO_TYPE VARCHAR(40) comment '待办标识，与待办结合用于分组显示待办总数，不设置的话缺省使用SERV_SRC_ID',
SERV_MOBILE_JS VARCHAR(1000) comment '卡片移动HTML,HTML语法，支持扩展CSS和JS'
) comment '服务定义';

create table SY_SERV_ACT(
ACT_ID VARCHAR(40) not null primary key comment '操作主键，自增',
SERV_ID VARCHAR(40) not null comment '服务主键',
ACT_CODE VARCHAR(40) not null comment '操作编码',
ACT_NAME VARCHAR(40) comment '操作名称',
ACT_TYPE NUMERIC(4) comment '操作类型  1:按钮列表；2:按钮卡片；3:非按钮',
ACT_ORDER NUMERIC(4) comment '排序',
ACT_LOG_FLAG NUMERIC(4) comment '操作留痕  1:留痕；2:不留痕',
ACT_EXPRESSION VARCHAR(200) comment '操作表达式  支持系统变量和数据变量',
ACT_HOT_KEY VARCHAR(20) comment '热键',
ACT_MEMO VARCHAR(400) comment '操作说明',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
ACT_CSS VARCHAR(200) comment '按钮样式，采用样式类名',
ACT_GROUP NUMERIC(4) comment '是否编辑组？，1：是；2：否',
S_MTIME VARCHAR(23) comment '更新时间',
ACT_EXPRESSION_FLAG NUMERIC(4) comment '和操作表达式配合使用，1.是: 默认值，后台判断执行 2.否: 后台忽略执行',
ACT_WS_FLAG NUMERIC(4) comment '启用WebService？',
ACT_WS_RESULT VARCHAR(4000) comment 'WebServie结果',
ACT_TIP VARCHAR(400) comment '提示说明',
ACT_MOBILE_FLAG VARCHAR(40) comment '移动标志，1：是（缺省）；2：否'
) comment '服务按钮';

create table SY_SERV_ACT_PARAM(
PARAM_ID VARCHAR(40) not null primary key comment '主键，UUID',
ACT_ID VARCHAR(40) comment '操作主键，自增',
PARAM_CODE VARCHAR(40) comment '参数值',
PARAM_TYPE VARCHAR(20) comment '参数类型',
PARAM_FORMAT VARCHAR(4000) comment '参数格式',
PARAM_MEMO VARCHAR(4000) comment '参数描述',
PARAM_MUST NUMERIC(4) comment '是否必须？ 1：是；2：否（缺省）',
PARAM_ORDER NUMERIC(4) comment '参数排序'
) comment '参数定义';

create table SY_SERV_COMMENT(
C_ID VARCHAR(40) not null primary key comment '主键ID',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
C_CONTENT VARCHAR(4000) comment '评论内容',
S_CMPY VARCHAR(40) comment '公司ID',
S_ODEPT VARCHAR(40) comment '机构编码',
S_TDEPT VARCHAR(40) comment '有效部门',
S_DEPT VARCHAR(40) comment '所属部门',
S_USER VARCHAR(40) comment '提问用户',
S_FLAG NUMERIC(4) comment '是否有效 (1,是;2,否)',
S_MTIME VARCHAR(23) comment '更新时间',
C_STATUS VARCHAR(40) comment '评论所属状态：1，已审核；2，未审核',
LIKE_VOTE NUMERIC(5) comment '支持数量',
DISLIKE_VOTE NUMERIC(5) comment '反对数量',
REPLY_TO VARCHAR(40) comment '对XX的回应',
S_CTIME VARCHAR(23) comment '创建时间',
C_NUMBER NUMERIC(5) comment '评论编号',
S_UNAME VARCHAR(40) comment '提问用户名称',
C_QUOTE_CONTENT LONGTEXT comment '',
ACL_TYPE NUMERIC(4) comment '权限类型'
) comment '评论表';

create table SY_SERV_COMMENT_VOTE(
VOTE_ID VARCHAR(40) not null primary key comment '主键',
VOTE_IP VARCHAR(40) comment '投票IP',
VOTE_USER VARCHAR(40) comment '投票用户',
VOTE_VALUE NUMERIC(4) comment '投票性质? 1:支持,2:反对',
COMMENT_ID VARCHAR(40) comment '评论ID',
S_USER VARCHAR(40) comment '最后修改用户',
S_UNAME VARCHAR(40) comment '最后修改用户名称',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_CTIME VARCHAR(23) comment '创建时间',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '删除标识，1：正常，2：删除'
) comment '评论投票结果';

create table SY_SERV_DACL_ITEM(
ACL_ID VARCHAR(40) not null primary key comment '栏目权限ID',
SERV_ID VARCHAR(40) comment '服务ID',
ACL_TYPE VARCHAR(40) comment '权限类别：用户自定义的，例如：浏览、发布、管理',
ACL_OWNER VARCHAR(40) comment '授权主体CODE：角色、部门、用户。分别以R_、D_、U_为前缀',
DATA_ID VARCHAR(40) comment '服务实例数据ID',
S_USER VARCHAR(40) comment '添加者CODE'
) comment '';

create table SY_SERV_DICT(
DICT_ID VARCHAR(40) not null primary key comment '字典主键',
DICT_NAME VARCHAR(40) comment '字典名称',
DICT_IS_INNER NUMERIC(4) comment '内部字典？，1：是；2：否',
DICT_TYPE NUMERIC(4) comment '字典类型，1：列表；2：树；3：叶子',
TABLE_ID VARCHAR(40) comment '所在表主键',
TABLE_SELECT VARCHAR(400) comment '查询结果字段',
TABLE_WHERE VARCHAR(400) comment '过滤条件',
TABLE_ORDER VARCHAR(400) comment '排序字段',
DICT_F_ID VARCHAR(40) comment '主键字段',
DICT_F_NAME VARCHAR(40) comment '名称字段',
DICT_F_PARENT VARCHAR(40) comment '父字段',
DICT_F_LEAF VARCHAR(40) comment '叶子节点字段',
DICT_F_FLAG VARCHAR(40) comment '启用标志字段',
DICT_LOAD_TYPE NUMERIC(4) comment '装载方式，1：启动装载（缺省）；2：用时装载',
DICT_DIS_FORMAT VARCHAR(200) comment '显示格式，支持CODE、NAME、IMG的替换',
DICT_DIS_LAYER NUMERIC(4) comment '显示层级，显示几个层级数据字典',
DICT_NAME_LAYER NUMERIC(4) comment '显示层级，在当前名字上显示几个层级',
DICT_CHILD_ID VARCHAR(40) comment '子字典主键',
S_PUBLIC NUMERIC(4) comment '公共标志，1：是；2：否',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司主键',
DICT_F_CMPY VARCHAR(40) comment '公司字段',
DICT_F_PATH VARCHAR(40) comment '编码路径字段',
DICT_F_LEVEL VARCHAR(40) comment '层级字段',
DICT_DATA_SOURCE VARCHAR(40) comment '字典对应数据源',
S_MTIME VARCHAR(23) comment '更新时间',
DICT_ROOT VARCHAR(40) comment '动态根节点，支持变量替换。',
DICT_EXPRESSION VARCHAR(400) comment '数据表达式，符合条件的进行展示。',
DICT_CLASS VARCHAR(200) comment '监听类，用于对字典数据进行特定处理',
DICT_SRC_ID VARCHAR(40) comment '引用字典数据，本字典采用指定字典的数据，使用自身设定的动态根和过滤规则等',
PRO_FLAG NUMERIC(4) comment '产品标识，1：是；2：否'
) comment '字典表';

create table SY_SERV_DICT_ITEM(
ITEM_ID VARCHAR(40) not null primary key comment '字典项主键，自增',
DICT_ID VARCHAR(40) not null comment '字典主键',
ITEM_CODE VARCHAR(40) comment '字典项编码',
ITEM_NAME VARCHAR(200) comment '字典项名称',
ITEM_PCODE VARCHAR(40) comment '父字典项编码',
ITEM_ORDER NUMERIC(4) comment '排序',
ITEM_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
ITEM_IMG VARCHAR(200) comment '对应图片，带路径的图片地址',
ITEM_LEAF NUMERIC(4) comment '是否叶子节点，1：是；2：否',
ITEM_FIELD1 VARCHAR(2000) comment '扩展字段1',
ITEM_FIELD2 VARCHAR(2000) comment '扩展字段2',
S_PUBLIC NUMERIC(4) comment '公共标志',
S_CMPY VARCHAR(40) comment '组织主键',
CODE_PATH VARCHAR(2000) comment '编码路径',
ITEM_LEVEL NUMERIC(4) comment '层级'
) comment '字典内部详细信息表';

create table SY_SERV_FLOW(
FLOW_ID VARCHAR(40) not null primary key comment '',
DATA_ID VARCHAR(40) comment '',
OWNER_ID VARCHAR(40) comment '',
S_ODEPT VARCHAR(40) comment ''
) comment '';

create table SY_SERV_ITEM(
ITEM_ID VARCHAR(40) not null primary key comment '数据项主键，自增',
SERV_ID VARCHAR(40) not null comment '服务主键',
ITEM_CODE VARCHAR(40) not null comment '服务项编码，与数据库字段保持一致',
ITEM_NAME VARCHAR(80) comment '名称',
ITEM_TYPE NUMERIC(4) comment '类型，1：表字段；2：视图字段；3：自定义字段',
ITEM_UNIQUE_GROUP NUMERIC(4) comment '唯一分组，支持多组唯一，1：唯一组1；2：唯一组2；3：唯一组3；...',
ITEM_FIELD_TYPE VARCHAR(10) comment '字段类型，STR：字符串；NUM：数字；LONG：大文本；TIME：TIMESTAME',
ITEM_FIELD_LENGTH VARCHAR(10) comment '长度，数字的逗号分隔小数位',
ITEM_INPUT_TYPE NUMERIC(4) comment '输入类型，1：文本框；2：下拉框；3：单选框；4：多选框；5：大文本；6：超大文本；7：图片上传；8：嵌入服务；9：分组框',
ITEM_INPUT_MODE NUMERIC(4) comment '输入模式，1：无；2：查询选择；3：字典选择；4：日期选择；5：动态提示；6：组合值；9：自定义',
ITEM_INPUT_CONFIG VARCHAR(2000) comment '输入设置，根据输入类型和输入模式进行设定',
ITEM_INPUT_DEFAULT VARCHAR(100) comment '缺省值，支持变量，支持序列格式',
ITEM_INPUT_FLAG NUMERIC(4) comment '可选可录入？，1：是；2：否',
ITEM_VALIDATE VARCHAR(200) comment '有效性检查，支持正则表达式',
ITEM_VALIDATE_HINT VARCHAR(200) comment '有效性提示，支持变量替换',
ITEM_NOTNULL NUMERIC(4) comment '必填项 ，1：是；2：否',
ITEM_READONLY NUMERIC(4) comment '只读项 ，1：是；2：否',
ITEM_CARD_DISABLE NUMERIC(4) comment '卡片禁用，自定义JSP列表用卡片不用时用到，1：是；2否',
ITEM_LIST_STYLE VARCHAR(200) comment '列表样式，设定列表本数据项展示的样式',
ITEM_CARD_STYLE VARCHAR(200) comment '卡片样式，设定卡片本数据项展示的样式',
ITEM_LIST_FORMAT VARCHAR(200) comment '列表格式，列表数据展示格式化',
ITEM_CARD_FORMAT VARCHAR(200) comment '卡片格式，卡片数据展示格式化',
ITEM_LIST_LINK VARCHAR(200) comment '列表URL',
ITEM_CARD_LINK VARCHAR(200) comment '卡片URL',
ITEM_LIST_WIDTH NUMERIC(4) comment '列表宽度，设定列表本数据项宽度，0为自动',
ITEM_CARD_WIDTH NUMERIC(4) comment '卡片宽度，设定卡片本数据项宽度，缺省为40px',
ITEM_LIST_ORDER NUMERIC(4) comment '列表排序：设定列表显示顺序',
ITEM_CARD_ORDER NUMERIC(4) comment '卡片排序，设定卡片页面显示顺序',
ITEM_CARD_ROWS NUMERIC(4) comment '卡片占用行数，设定占用卡片的行数',
ITEM_CARD_COLS NUMERIC(4) comment '卡片占用列数，设定占用卡片的列数',
ITEM_SEARCH_FLAG NUMERIC(4) comment '是否搜索？，1：是（视图及表字段缺省）；2：否',
ITEM_LIST_FLAG NUMERIC(4) comment '显示在列表？，1：是（视图及表字段缺省）；2：否',
ITEM_LIST_EDIT NUMERIC(4) comment '列表编辑？，1：是；2：否',
ITEM_LOG_FLAG NUMERIC(4) comment '记录历史？，1：是；2：否',
ITEM_MEMO VARCHAR(2000) comment '说明，在帮助中显示',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
DICT_ID VARCHAR(40) comment '引用字典主键，隐藏字段，自动设置，用于数据计算等',
ITEM_LIST_ALIGN NUMERIC(4) comment '列表对齐，1：左对齐（缺省）；2：右对齐；3：居中对齐',
ITEM_HIDDEN NUMERIC(4) comment '隐藏项 ，1：是；2：否',
S_MTIME VARCHAR(23) comment '更新时间',
ITEM_MOBILE_TYPE NUMERIC(4) comment '移动类型，1：列表标题；2：列表项；3：仅卡片项；9：不展示',
ITEM_TIP VARCHAR(400) comment '提示信息',
ITEM_ORDER_CODES VARCHAR(400) comment '重载排序字段，逗号分隔的字段列表，列表点击此列排序时指定按照哪几个字段排序',
ITEM_HIDDEN_SCRIPT VARCHAR(2000) comment '隐藏表达式',
ITEM_NOTNULL_SCRIPT VARCHAR(2000) comment '必填表达式',
ITEM_READONLY_SCRIPT VARCHAR(2000) comment '只读表达式',
ITEM_USER_FLAG NUMERIC(4) comment '是否用户？，1：是；2：否（缺省）',
ITEM_LABEL_HIDDEN NUMERIC(4) comment '标签隐藏？ ，1：是；2：否（缺省）',
ITEM_SUM_FLAG NUMERIC(4) comment '启用小计？，1：是；2：否（缺省）',
ITEM_EXPTENDS VARCHAR(2000) comment '扩展设置，JSON格式',
SAFE_HTML VARCHAR(4) comment '如果为安全HTML，则卡片页面显示标签或列表页面显示字段值时，不替换HTML标签，否则替换HTML标签。'
) comment '服务项定义';

create table SY_SERV_LINK(
LINK_ID VARCHAR(40) not null primary key comment '关联主键，自增',
SERV_ID VARCHAR(40) not null comment '服务主键',
LINK_SERV_ID VARCHAR(40) not null comment '子服务主键',
LINK_NAME VARCHAR(40) comment '关联标题',
LINK_ORDER NUMERIC(4) comment '排序',
LINK_WHERE VARCHAR(400) comment '过滤条件',
LINK_EXPRESSION VARCHAR(400) comment '表达式，显示表达式，支持变量替换',
LINK_READONLY NUMERIC(4) comment '只读关联？，1：是；2：否（缺省）',
LINK_DELETE_FLAG NUMERIC(4) comment '关联删除？，1：是；2：否',
LINK_UPDATE_FLAG NUMERIC(4) comment '关联更新？，1：是；2：否',
LINK_QUERY_FLAG NUMERIC(4) comment '显示搜索框？，1：是；2：否（缺省）',
LINK_SHOW_TYPE NUMERIC(4) comment '显示方式，1：列表显示；2：卡片显示',
LINK_SHOW_POSITION NUMERIC(4) comment '显示位置，1：主单数据项；2：主单下列表；3：主单标签',
LINK_PAGE_COUNT NUMERIC(4) comment '每页记录数，0（缺省）为不分页',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_MTIME VARCHAR(23) comment '更新时间',
LINK_REFRESH VARCHAR(4) comment '接收部门名称',
LINK_MAIN_LIST NUMERIC(4) comment '列表动态展开，1：是；2：否（缺省）',
LINK_SERV_QUERY NUMERIC(4) comment '保留服务过滤，1：是；2：否（缺省）'
) comment '服务关联定义';

create table SY_SERV_LINK_ITEM(
LITEM_ID VARCHAR(40) not null primary key comment '关联主键，自增',
LINK_ID VARCHAR(40) comment '关联主键，自增',
ITEM_CODE VARCHAR(40) comment '主单数据项',
LINK_ITEM_CODE VARCHAR(40) comment '子单数据项',
LINK_WHERE_FLAG NUMERIC(4) comment '过滤标志，1：是（作为过滤条件拼接进关联查询）；2：否 ',
LINK_VALUE_FLAG NUMERIC(4) comment '传值标志，1：主单数据项值；2：常量值；3：不传值（只作为过滤设定）'
) comment '关联明细设定';

create table SY_SERV_LISTENER(
LIS_ID VARCHAR(40) not null primary key comment '监听ID',
SERV_ID VARCHAR(40) comment '服务',
LIS_CLASS VARCHAR(200) comment '类',
LIS_CONF VARCHAR(2000) comment '配置',
LIS_DESC VARCHAR(200) comment '描述',
S_FLAG NUMERIC(4) comment '启用',
LIS_SORT NUMERIC(10) comment '排序',
S_MTIEM VARCHAR(23) comment '更新时间'
) comment '服务监听';

create table SY_SERV_LOG_ACT(
ALOG_ID VARCHAR(40) not null primary key comment '操作历史',
ACT_ID VARCHAR(40) comment '操作主键',
ACT_KEYS VARCHAR(4000) comment '数据主键，多个主键逗号分隔',
ACT_TIME NUMERIC(8) comment '操作耗时，单位为ms',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '操作用户',
ACT_IP VARCHAR(40) comment 'IP地址',
S_MTIME VARCHAR(23) comment '更新时间',
SERV_ID VARCHAR(40) comment '服务编码'
) comment '操作留痕';

create table SY_SERV_LOG_ITEM(
ILOG_ID VARCHAR(40) not null primary key comment '历史主键',
ITEM_ID VARCHAR(40) comment '数据项主键，自增',
DATA_ID VARCHAR(40) comment '数据主键',
ILOG_OLD VARCHAR(2000) comment '原值',
ILOG_NEW VARCHAR(2000) comment '当前值',
S_CMPY VARCHAR(40) comment '公司主键',
S_USER VARCHAR(40) comment '当前用户',
ILOG_IP VARCHAR(40) comment 'IP地址',
S_MTIME VARCHAR(23) comment '更新时间',
SERV_ID VARCHAR(40) comment '服务编码',
ITEM_CODE VARCHAR(40) comment '数据项编码'
) comment '数据变更历史表';

create table SY_SERV_QUERY(
QUERY_ID VARCHAR(40) not null primary key comment '查询主键',
SERV_ID VARCHAR(40) comment '服务主键',
QUERY_NAME VARCHAR(40) comment '查询策略名称',
QUERY_SQL VARCHAR(400) comment '查询SQL',
QUERY_TYPE NUMERIC(4) comment '策略类型，1：系统；2：个人',
QUERY_DEFAULT NUMERIC(4) comment '缺省策略？，1：是；2：否',
QUERY_ORDER NUMERIC(4) comment '排序',
LIST_ID VARCHAR(40) comment '列表策略主键',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(30) comment '更新时间'
) comment '查询策略表';

create table SY_SERV_RELATE(
RELATE_ID VARCHAR(40) not null primary key comment '相关文件ID',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
RELATE_SERV_ID VARCHAR(40) comment '关联服务主键',
RELATE_DATA_ID VARCHAR(40) comment '关联数据主键',
RELATE_SORT NUMERIC(4) comment '关系排序号',
RELATE_TYPE VARCHAR(40) comment '关系类型，例如：区分相关文件或者转发原文等',
S_USER VARCHAR(40) comment '用户编码',
S_DEPT VARCHAR(40) comment '部门',
S_TDEPT VARCHAR(40) comment '有效部门',
S_CMPY VARCHAR(40) comment '公司编码',
S_ATIME VARCHAR(23) comment '添加时间',
S_ODEPT VARCHAR(40) comment '机构部门'
) comment '流程中选取相关文件，';

create table SY_SERV_SEARCH(
SERV_ID VARCHAR(40) not null primary key comment '服务主键',
SEARCH_SELECT VARCHAR(800) comment 'select语句，搜索的字段列表，根据设置自动生成',
SEARCH_WHERE VARCHAR(400) comment 'where语句，固定索引搜索的过滤条件，不需要写where从and开始',
SEARCH_INCR_WHERE VARCHAR(400) comment '增量where语句，增量索引搜索的过滤条件',
SEARCH_ORDER VARCHAR(200) comment 'order语句，不需要写order by',
SEARCH_INCR_ORDER VARCHAR(200) comment '增量order语句，不需要写order by',
SEARCH_CLASS VARCHAR(200) comment '索引监听类',
SEARCH_TITLE VARCHAR(400) comment '索引标题，支持字段变量替换',
SEARCH_DIGEST VARCHAR(1000) comment '索引摘要，支持html标签及变量替换',
SEARCH_PREVIEW VARCHAR(1000) comment '索引预览，支持html标签及变量替换',
SEARCH_INDEX VARCHAR(400) comment '索引分组字段，进行分组的字段列表，逗号分隔',
SEARCH_USER VARCHAR(40) comment '索引用户字段，索引数据的创建者或者拥有者字段',
SEARCH_TIME VARCHAR(40) comment '索引时间字段，数据创建或者更新时间字段',
SEARCH_DEPT VARCHAR(40) comment '索引部门字段，索引数据的拥有部门字段',
SEARCH_CMPY VARCHAR(40) comment '索引公司字段，标明索引数据的所在公司的字段',
SEARCH_URL VARCHAR(400) comment '查询连接，带http的全路径，支持变量替换',
SEARCH_LAST_FIELD VARCHAR(40) comment '固定索引字段，一般为主键或者时间字段',
SEARCH_LAST_DATA VARCHAR(40) comment '最后索引固定数据，用于作为持续索引的判断',
SEARCH_LAST_COUNT NUMERIC(12) comment '上次固定索引数据量',
SEARCH_INCR_FIELD VARCHAR(40) comment '增量索引字段，一般为主键或者时间字段',
SEARCH_INCR_DATA VARCHAR(40) comment '最后增量固定数据，用于作为增量索引的判断',
SEARCH_INCR_COUNT NUMERIC(12) comment '上次增量索引数据量',
SEARCH_ALL_COUNT NUMERIC(12) comment '总索引数据量',
SEARCH_FILE_FLAG NUMERIC(4) comment '索引附件标志，1：内部附件；2：外部附件；3：不索引附件（缺省）',
SEARCH_CONT_TYPE NUMERIC(4) comment '索引正文类型，1：字段；2：第一个附件；3：特定附件',
SEARCH_CONT_FIELD VARCHAR(1000) comment '索引正文字段，字段名或者附件表达式',
SEARCH_FILE_SQL VARCHAR(1000) comment '附件SQL，获取附件的SQL语句',
SEARCH_FILE_ID VARCHAR(40) comment '附件主键字段',
SEARCH_FILE_NAME VARCHAR(40) comment '附件名称字段，带后缀的名称',
SEARCH_FILE_PATH VARCHAR(400) comment '附件路径，可以是操作系统FILE、FTP、HTTP等地址',
SEARCH_SERV_AUTH NUMERIC(4) comment '搜索服务权限，1：全部可以搜索；2：授权才可以搜索',
SEARCH_DATA_AUTH NUMERIC(4) comment '搜索数据权限，1：全部；2：公司内全部；3：数据权限',
SEARCH_ALL_CONDITION VARCHAR(800) comment '全部可查规则，JS条件表达式，符合规则的不进行权限设置',
SEARCH_USER_SQL VARCHAR(800) comment '用户权限SQL',
SEARCH_ROLE_SQL VARCHAR(800) comment '角色权限SQL',
SEARCH_DEPT_SQL VARCHAR(800) comment '部门权限SQL',
SEARCH_DEPT_ROLE_SQL VARCHAR(800) comment '部门角色权限SQL',
SEARCH_CMPY_CONDITION VARCHAR(800) comment '公司全查规则，JS条件表达式，符合规则的设置全公司可查',
SEARCH_CONT_SHOT NUMERIC(4) comment '正文快照？,1：是；2：否',
SEARCH_NAME VARCHAR(40) comment '功能名称',
SEARCH_IMG VARCHAR(800) comment '图片表达式，JS条件表达式，符合规则输出图片HTML',
SEARCH_OTHER_FIELDS VARCHAR(400) comment '其他字段，规则中要用到的查询字段列表，多个逗号分隔',
SEARCH_DOMAIN VARCHAR(80) comment '域名或IP地址',
SEARCH_WF_URL VARCHAR(400) comment '流程跟踪连接，XML格式的流程跟踪信息',
SEARCH_SRC_URL VARCHAR(400) comment '原始连接，带http的全路径，支持变量替换',
SEARCH_BOOST VARCHAR(1000) comment '加权表达式，支持脚本动态计算权重',
SEARCH_KEYWORD VARCHAR(400) comment '索引关键词，用于增加特定词的权重，多个逗号或者空格分隔',
FILE_CACHE_FLAG NUMERIC(4) comment '文件缓存类别',
SEARCH_GROUP_SQL VARCHAR(800) comment '群组权限SQL',
SEARCH_HANDLER_CLASS VARCHAR(200) comment '处理类'
) comment '服务搜索定义';

create table SY_SERV_WHERE(
WHERE_ID VARCHAR(40) not null primary key comment '过滤主键，UUID',
SERV_ID VARCHAR(40) comment '服务编码',
WHERE_NAME VARCHAR(80) comment '过滤名称',
WHERE_SCRIPT VARCHAR(2000) comment '条件规则',
WHERE_CONTENT VARCHAR(2000) comment '过滤语句，and起始的SQL语句',
WHERE_FLOW_FLAG NUMERIC(4) comment '启用流经，1：是；2：否，是否并上流经规则',
WHERE_ORDER NUMERIC(4) comment '规则排序',
S_FLAG NUMERIC(4) comment '有效标志，1：是；2：否',
S_MTIME VARCHAR(30) comment '更新时间',
WHERE_SERV_TYPE VARCHAR(40) comment '服务类型，1：本服务（缺省），2：父服务；3：引用自服务'
) comment '服务过滤规则';

create table SY_WFE_CUSTOM_VAR(
VAR_ID VARCHAR(40) not null primary key comment '变量ID',
VAR_CODE VARCHAR(60) comment '变量名称',
VAR_CONTENT VARCHAR(1000) comment '变量的值',
VAR_MEMO VARCHAR(1000) comment '说明',
PROC_CODE VARCHAR(40) comment '所属流程',
NODE_CODE VARCHAR(40) comment '所属节点',
S_MTIME VARCHAR(30) comment '修改时间'
) comment '';

create table SY_WFE_LINE_DEF(
LD_ID VARCHAR(40) not null primary key comment '工作流连线主键',
LINE_CODE VARCHAR(40) comment '连线编码',
LINE_COND_NAME VARCHAR(40) comment '条件名称',
LINE_SORT NUMERIC(2) comment '连线排序号',
PROC_CODE VARCHAR(40) comment '流程编码',
SRC_NODE_CODE VARCHAR(40) comment '前节点编码',
TAR_NODE_CODE VARCHAR(40) comment '后节点编码',
LINE_IF_RETURN NUMERIC(1) comment '是否允许退回，1：是；2：否',
LINE_CONDS_SCRIPT VARCHAR(2000) comment '执行该连线的条件',
LINE_EXTEND_CLASS VARCHAR(200) comment '该连线执行的扩展类',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
S_MTIME VARCHAR(23) comment '更新时间',
UPDATE_EXPRESS VARCHAR(1000) comment '更新数据，更新主服务数据的条件和表达式。',
CONFIRM_MSG VARCHAR(400) comment '提示信息',
IF_PARALLEL NUMERIC(1) comment '是否并发，1：是；2：否',
IF_OUT_DEPT NUMERIC(4) comment '是否出部门',
COND_MSG VARCHAR(400) comment '不符合条件时，点击按钮弹出的消息框。',
SEND_TEXT VARCHAR(40) comment '送交按钮名称',
RETURN_TEXT VARCHAR(40) comment '返回按钮名称',
LINE_EVENT VARCHAR(100) comment '流经事件,当流程流经此线时，触发此事件。',
ORG_DEF VARCHAR(4000) comment '组织资源定义'
) comment '节点连线定义表';

create table SY_WFE_NODE_ACT(
NA_ID VARCHAR(40) not null primary key comment '关联表定义主键',
PROC_CODE VARCHAR(40) not null comment '流程编码',
NODE_CODE VARCHAR(40) not null comment '节点编码',
SERV_ID VARCHAR(40) comment '服务编码(确定哪个表单)',
FIELD_CONTROL NUMERIC(4) comment '字段控制类型：1 完全控制； 2 只读控制',
FIELD_EXCEPTION VARCHAR(1000) comment '可编辑字段，可以是逗号分隔的多个字段的字符串。<br>需要和【字段控制类型】配合起来使用：<br>完全控制：可编辑字段不起作用，在当前节点可以修改任何数据项。<br>只读控制：可编辑字段起作用，所有不在可编辑字段范围内的数据项全部只读不可修改。<br>',
FIELD_UPDATE VARCHAR(500) comment '流程送交或者退回到此【节点】时更新对应的字段设定。<br>这里支持对多个字段进行设定，使用逗号分隔，同时字段的值支持对系统变量（使用@包含）的替换。<br>例如：<br>IDLE_XZRQ=@DATE@,AUD_FLAG=2,ADU_INFO=这是一个测试<br>',
FIELD_HIDDEN VARCHAR(1000) comment '字段隐藏设置，所有需要隐藏的字段列表，逗号分隔',
FIELD_MIND_UPDATE VARCHAR(500) comment '在流程中填写意见时，自动更新单据中某些字段的数据。<br>这里支持对多个字段进行设定，使用逗号分隔，同时字段的值支持对系统变量（使用@包含）和意见数据（使用#包含）的替换。<br>意见数据有：<br>#MIND_CODE#    意见编码  <br>#AINST_MIND_AGREE#    是否同意：1 同意 2 不同意 <br>#AINST_MIND_CONTENT#    意见内容 <br>#AINST_MIND_TIME#    意见填写时间 <br>例如：<br>IDLE_XCJCYJ=#AINST_MIND_CONTENT#,IDLE_XCJCRQ=@DATE@,AUD_FLAG=#AINST_MIND_AGREE# <br>',
FIELD_ROLLBACK VARCHAR(500) comment '对于流程启动点来说，启动流程执行【更新字段】设定，取消流程执行此更新设定；<br>对于流程结束点来说，结束流程执行此更新设定，取消结束流程执行【更新字段】设定。<br>填写格式参见【更新字段】',
FORM_BUTTONS VARCHAR(200) comment '表单按钮控制，可以在本节点显示的表单按钮ID列表，逗号分隔',
FIELD_MUST VARCHAR(400) comment '流程节点必填字段设定，字段编号的列表，使用逗号分隔，在只读控制模式下设定为必填字段后必须将字段设为可编辑字段才可编辑，系统也会自动显示保存按钮，如果本身是隐藏字段则不再隐藏',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) not null comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
FILE_CONTROL VARCHAR(400) comment '文件类型的控制',
WF_BUTTONS VARCHAR(200) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
FIELD_DISPLAY VARCHAR(1000) comment '显示字段',
GROUP_DISPLAY VARCHAR(400) comment '显示分组框',
GROUP_HIDE VARCHAR(400) comment '隐藏分组框',
GROUP_EXPAND VARCHAR(400) comment '展开分组框',
GROUP_COLLAPSE VARCHAR(400) comment '收缩分组框',
BUTTON_PARAMS VARCHAR(4000) comment '按钮参数',
BUTTON_ALIAS VARCHAR(1000) comment '别名'
) comment '流程节点和ACT关联表';

create table SY_WFE_NODE_DEF(
ND_ID VARCHAR(40) not null primary key comment '节点定义主键',
NODE_CODE VARCHAR(40) comment '节点编码',
NODE_NAME VARCHAR(40) comment '节点名称',
NODE_CAPTION VARCHAR(40) comment '节点显示按钮名称',
NODE_TYPE NUMERIC(1) comment '节点类型，1：起草点；2：活动点；3：结束点',
PROC_CODE VARCHAR(40) comment '流程编码',
NODE_SORT NUMERIC(2) comment '节点排序',
MIND_CODE VARCHAR(40) comment '节点意见编码',
MIND_NEED_FLAG NUMERIC(1) comment '节点是否必须填意见，1：是；2：否',
MIND_CTRL_FORCE NUMERIC(1) comment '是否通过意见控制流转，1：是；2：否',
NODE_IF_PARALLEL NUMERIC(1) comment '是否并发节点，1：是；2：否',
NODE_IF_CONVERGE NUMERIC(1) comment '是否合并节点，1：是；2：否',
NODE_IF_AUTOEND NUMERIC(1) comment '是否自动结束，1：是；2：否',
NODE_ROLE_CODES VARCHAR(2000) comment '绑定角色编码',
NODE_ROLE_MODE NUMERIC(1) comment '绑定角色类型，1：指定；2：全部；3：按角色送交',
NODE_ROLE_WHERE VARCHAR(2000) comment '绑定角色过滤条件',
NODE_DEPT_CODES VARCHAR(2000) comment '绑定部门编码，1：指定；2：全部；3：预定义',
NODE_DEPT_MODE NUMERIC(1) comment '绑定部门类型',
NODE_DEPT_LEVEL NUMERIC(1) comment '绑定部门层级，1：本级；大于1，包含子部门的层级',
NODE_DEPT_WHERE VARCHAR(2000) comment '绑定部门过滤条件',
NODE_USER_CODES VARCHAR(2000) comment '绑定用户编码',
NODE_USER_MODE NUMERIC(1) comment '绑定用户类型，1：指定；2：全部；3：预定义',
NODE_USER_WHERE VARCHAR(2000) comment '绑定用户过滤条件',
NODE_TIMEOUT VARCHAR(400) comment '节点超时时间',
NODE_TIMEOUT_ACT VARCHAR(40) comment '到限定时间后的操作：空：发送提醒，BACK：有退回点自动退回',
PROC_END_FLAG NUMERIC(1) comment '该节点是否可以结束流程，1：是；2：否',
PROC_END_NAME VARCHAR(40) comment '结束流程按钮名称',
NODE_SUB_PROC VARCHAR(40) comment '子流程定义ID',
NODE_MEMO VARCHAR(2000) comment '节点描述',
NODE_EXTEND_CLASS VARCHAR(200) comment '节点送交人扩展类',
NODE_SELF_SEND NUMERIC(1) comment '节点内部送交，1：是；2：否',
NODE_REMIND_USER VARCHAR(2000) comment '办理完成提醒用户',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
MIND_IF_HAND NUMERIC(1) comment '',
MIND_REGULAR VARCHAR(80) comment '固定意见类型',
S_MTIME VARCHAR(23) comment '更新时间',
MIND_REGULAR_MUST NUMERIC(1) comment '',
MIND_TERMINAL VARCHAR(80) comment '',
MIND_TERMINAL_MUST NUMERIC(1) comment '',
MIND_REGULAR_SCRIPT VARCHAR(400) comment '固定意见过滤脚本',
MIND_SCRIPT VARCHAR(400) comment '普通意见过滤脚本',
MIND_TERMINAL_SCRIPT VARCHAR(400) comment '最终意见过滤脚本',
NODE_BIND_MODE VARCHAR(40) comment '节点绑定类型, USER ROLE',
EVENT_CLS VARCHAR(100),
CONVERGE_TARGET VARCHAR(50),
BREAK_THROUGH VARCHAR(800),
EXT_JSON LONGTEXT
) comment '节点定义表';

create table SY_WFE_NODE_INST(
NI_ID VARCHAR(40) not null primary key comment '节点实例主键',
NODE_CODE VARCHAR(40) comment '节点编码',
NODE_NAME VARCHAR(100) comment '节点名称',
PROC_CODE VARCHAR(40) comment '流程编码',
PI_ID VARCHAR(40) comment '实例ID',
NODE_IF_RUNNING NUMERIC(1) comment '节点是否运行，1：是；2：否',
NODE_BTIME VARCHAR(20) comment '节点开始时间',
NODE_ETIME VARCHAR(20) comment '节点结束时间',
NODE_LIMIT_TIME VARCHAR(20) comment '节点限定完成时间',
NODE_DAYS NUMERIC(8) comment '节点执行小时数',
DONE_USER_ID VARCHAR(40) comment '执行节点用户ID',
DONE_USER_NAME VARCHAR(40) comment '执行节点用户名称',
DONE_DEPT_IDS VARCHAR(2000) comment '执行节点部门ID列表',
DONE_DEPT_NAMES VARCHAR(2000) comment '执行节点部门名称列表',
SUB_USER_ID VARCHAR(40) comment '代理执行的用户ID',
SUB_USER_NAME VARCHAR(40) comment '代理执行的用户名称',
SUB_DEPT_IDS VARCHAR(2000) comment '代理执行的部门ID列表',
SUB_DEPT_NAMES VARCHAR(2000) comment '代理执行的部门名称列表',
PRE_NI_ID VARCHAR(40) comment '前一个节点ID',
PRE_LINE_CODE VARCHAR(40) comment '连线编码',
TO_TYPE NUMERIC(1) comment '送交类型：1：送部门+角色；2：送角色；3：送用户',
TO_USER_ID VARCHAR(40) comment '送交用户ID',
REMIND_CONTENT VARCHAR(200) comment '提醒的信息内容',
DONE_TYPE NUMERIC(3) comment '办理类型：3收回、2终止、1正常结束',
DONE_DESC VARCHAR(200) comment '办理说明',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
OPEN_TIME VARCHAR(20) comment '打开时间',
TO_USER_NAME VARCHAR(40) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
REMIND_LOG VARCHAR(100) comment '提醒记录',
DELAY_TIME NUMERIC(8) comment '超期时间'
) comment '节点实例表';

create table SY_WFE_NODE_INST_HIS(
NI_ID VARCHAR(40) not null primary key comment '节点实例主键',
NODE_CODE VARCHAR(40) comment '节点编码',
NODE_NAME VARCHAR(100) comment '节点名称',
PROC_CODE VARCHAR(40) comment '流程编码',
PI_ID VARCHAR(40) comment '实例ID',
NODE_IF_RUNNING NUMERIC(1) comment '节点是否运行，1：是；2：否',
NODE_BTIME VARCHAR(20) comment '节点开始时间',
NODE_ETIME VARCHAR(20) comment '节点结束时间',
NODE_LIMIT_TIME VARCHAR(20) comment '节点限定完成时间',
NODE_DAYS NUMERIC(8) comment '节点执行小时数',
DONE_USER_ID VARCHAR(40) comment '执行节点用户ID',
DONE_USER_NAME VARCHAR(40) comment '执行节点用户名称',
DONE_DEPT_IDS VARCHAR(2000) comment '执行节点部门ID列表',
DONE_DEPT_NAMES VARCHAR(2000) comment '执行节点部门名称列表',
SUB_USER_ID VARCHAR(40) comment '代理执行的用户ID',
SUB_USER_NAME VARCHAR(40) comment '代理执行的用户名称',
SUB_DEPT_IDS VARCHAR(2000) comment '代理执行的部门ID列表',
SUB_DEPT_NAMES VARCHAR(2000) comment '代理执行的部门名称列表',
PRE_NI_ID VARCHAR(40) comment '前一个节点ID',
PRE_LINE_CODE VARCHAR(40) comment '连线编码',
TO_TYPE NUMERIC(1) comment '送交类型：1：送部门+角色；2：送角色；3：送用户',
TO_USER_ID VARCHAR(40) comment '送交用户ID',
REMIND_CONTENT VARCHAR(200) comment '提醒的信息内容',
DONE_TYPE NUMERIC(3) comment '办理类型：3收回、2终止、1正常结束',
DONE_DESC VARCHAR(200) comment '办理说明',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
OPEN_TIME VARCHAR(20) comment '打开时间',
TO_USER_NAME VARCHAR(40) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
REMIND_LOG VARCHAR(100) comment '提醒记录',
DELAY_TIME NUMERIC(8) comment '超期时间'
) comment '节点实例历史表';

create table SY_WFE_NODE_PACTS(
PACT_ID VARCHAR(40) not null primary key comment '公共按钮主键',
PROC_CODE VARCHAR(40) comment '流程CODE',
ACT_CODE VARCHAR(40) comment '按钮CODE',
ACT_NAME VARCHAR(40) comment '按钮名称',
ACT_TYPE NUMERIC(4) comment '1:工作流;2:审批单',
ACT_SORT NUMERIC(4) comment '排序号',
S_ATIME VARCHAR(23) comment '增加时间'
) comment '公共按钮表';

create table SY_WFE_NODE_USERS(
UN_ID VARCHAR(40) not null primary key comment '主键ID',
NI_ID VARCHAR(40) comment '节点实例ID',
TO_USER_ID VARCHAR(40) comment '用户ID',
TO_USER_NAME VARCHAR(80) comment '用户名称',
TO_DEPT_ID VARCHAR(40) comment '部门ID',
TO_DEPT_NAME VARCHAR(200) comment '部门名称',
PI_ID VARCHAR(40) comment '流程实例ID',
S_ATIME VARCHAR(20) comment '添加时间'
) comment '节点实例用户信息';

create table SY_WFE_NODE_USERS_HIS(
UN_ID VARCHAR(40) not null primary key comment '主键ID',
NI_ID VARCHAR(40) comment '节点实例ID',
TO_USER_ID VARCHAR(40) comment '用户ID',
TO_USER_NAME VARCHAR(80) comment '用户名称',
TO_DEPT_ID VARCHAR(40) comment '部门ID',
TO_DEPT_NAME VARCHAR(200) comment '部门名称',
PI_ID VARCHAR(40) comment '流程实例ID',
S_ATIME VARCHAR(20) comment '添加时间'
) comment '节点实例用户历史信息';

create table SY_WFE_PROC_DEF(
PROC_CODE VARCHAR(40) not null primary key comment '流程编码',
PROC_NAME VARCHAR(80) comment '流程名称',
PROC_TYPE NUMERIC(4) comment '流程分类',
SERV_ID VARCHAR(40) comment '表单ID',
PROC_MEMO VARCHAR(200) comment '流程描述',
S_PUBLIC NUMERIC(4) comment '是否公共流程，1：是；2：否',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
EN_NAME VARCHAR(40) comment '英文名称',
PROC_XML LONGTEXT comment '流程是否为最新版本,1是 2否',
BIND_TITLE VARCHAR(400) comment '提醒标题',
BIND_BUTTONS VARCHAR(400) comment '全局按钮',
BIND_BUTTONS_NAME VARCHAR(400) comment '按钮名称',
BIND_ENDEDITFIELD VARCHAR(400) comment '流程结束后可编辑字段',
PROC_MANAGE VARCHAR(40) comment '',
SERV_PID VARCHAR(40) comment '',
EXPAND_CLASS VARCHAR(200) comment '',
PROC_MANAGE_EDIT VARCHAR(400) comment '',
S_MTIME VARCHAR(23) comment '更新时间',
BIND_SCRIPT VARCHAR(4000) comment '绑定脚本',
BIND_SORT NUMERIC(4) comment '绑定排序',
PROC_CATALOG VARCHAR(40) comment '',
PROC_VERSION NUMERIC(4) comment '版本号',
EFFECTIVE_DATE VARCHAR(23) comment '生效日期',
PROC_IS_LATEST NUMERIC(4) comment '流程定义XML文件',
FINISH_REMIND VARCHAR(400) comment '办结提醒设置',
NODE_PUB_LSTN VARCHAR(300)
) comment '流程定义表';

create table SY_WFE_PROC_INST(
PI_ID VARCHAR(40) not null primary key comment '实例主键',
PROC_CODE VARCHAR(40) comment '流程编码',
SERV_ID VARCHAR(40) comment '表单ID',
DOC_ID VARCHAR(40) comment '表单实例ID',
DOC_NAME VARCHAR(200) comment '文档名称',
INST_IF_RUNNING NUMERIC(1) comment '流程是否运行，1：是；2：否',
INST_BTIME VARCHAR(20) comment '流程开始时间',
INST_ETIME VARCHAR(20) comment '流程结束时间',
END_USER_ID VARCHAR(40) comment '结束流程用户ID',
INST_IF_PARALLEL NUMERIC(1) comment '流程是否并发，1：是；2：否',
INST_PARENT_NODE VARCHAR(40) comment '流程的父流程节点ID',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
INST_LOCK NUMERIC(4) comment '锁定状态  1 是 2 否',
S_MTIME VARCHAR(23) comment '更新时间',
INST_LOCK_USER VARCHAR(40) comment '锁定人',
INST_LOCK_TIME VARCHAR(20) comment '锁定时间',
INST_MIN NUMERIC(12) comment '执行时间'
) comment '流程实例表';

create table SY_WFE_PROC_INST_HIS(
PI_ID VARCHAR(40) not null primary key comment '实例主键',
PROC_CODE VARCHAR(40) comment '流程编码',
SERV_ID VARCHAR(40) comment '表单ID',
DOC_ID VARCHAR(40) comment '表单实例ID',
DOC_NAME VARCHAR(200) comment '文档名称',
INST_IF_RUNNING NUMERIC(1) comment '流程是否运行，1：是；2：否',
INST_BTIME VARCHAR(20) comment '流程开始时间',
INST_ETIME VARCHAR(20) comment '流程结束时间',
END_USER_ID VARCHAR(40) comment '结束流程用户ID',
INST_IF_PARALLEL NUMERIC(1) comment '流程是否并发，1：是；2：否',
INST_PARENT_NODE VARCHAR(40) comment '流程的父流程节点ID',
S_FLAG NUMERIC(4) comment '启用标志，1：是；2：否',
S_CMPY VARCHAR(40) comment '公司ID',
S_USER VARCHAR(40) comment '添加者',
INST_LOCK NUMERIC(4) comment '锁定状态  1 是 2 否',
S_MTIME VARCHAR(23) comment '更新时间',
INST_LOCK_USER VARCHAR(40) comment '锁定人',
INST_LOCK_TIME VARCHAR(20) comment '锁定时间',
INST_MIN NUMERIC(12) comment '执行时间'
) comment '流程实例历史表';

create table SY_WFE_PROC_NODE_DEF(
ND_ID VARCHAR(40) not null primary key comment '节点定义主键',
PROC_CODE VARCHAR(40) comment '流程编码',
NODE_DEF LONGTEXT comment '删除标识，1：正常，2：删除',
S_USER VARCHAR(40) comment '最后修改用户',
S_CMPY VARCHAR(40) comment '用户所属公司',
S_MTIME VARCHAR(23) comment '最后修改时间',
S_FLAG NUMERIC(4) comment '节点配置信息,json格式'
) comment '子流程节点配置信息';

create table SY_WFE_REMIND(
REMD_ID VARCHAR(40) not null primary key comment '催办单主键',
ACPT_USER VARCHAR(40) comment '被催办用户',
ACPT_DEPT VARCHAR(40) comment '被催办部门',
ACPT_TDEPT VARCHAR(40) comment '被催办有效部门',
ACPT_PHONE VARCHAR(40) comment '被催办人电话',
REMD_TITLE VARCHAR(200) comment '催办事项',
REMD_REASON VARCHAR(1000) comment '催办原因',
REMD_CODE VARCHAR(40) comment '催办代字',
REMD_YEAR NUMERIC(4) comment '催办年度',
REMD_NUM NUMERIC(4) comment '催办流水号',
REMD_CDEPT VARCHAR(400) comment '协办部门',
DEADLINE VARCHAR(20) comment '原定办理日期',
OVER_DAYS NUMERIC(4) comment '超期天数',
S_EMERGENCY VARCHAR(10) comment '催办缓急',
DO_MIND VARCHAR(400) comment '办理意见',
REMD_PHONE VARCHAR(40) comment '催办人电话',
REMD_STATUS NUMERIC(4) comment '催办提醒状态',
S_FLAG NUMERIC(4) comment '删除标志',
S_USER VARCHAR(40) comment '催办用户',
S_DEPT VARCHAR(40) comment '催办用户部门',
S_TDEPT VARCHAR(40) comment '催办部门',
S_ODEPT VARCHAR(40) comment '催办机构编码',
S_CMPY VARCHAR(40) comment '催办公司',
S_ATIME VARCHAR(30) comment '催办时间',
S_MTIME VARCHAR(30) comment '修改时间',
REMD_SCRT VARCHAR(20) comment '密级',
SERV_ID VARCHAR(40) comment '服务ID',
DATA_ID VARCHAR(40) comment '数据ID',
WF_NODE_ID VARCHAR(40) comment '流程节点ID',
ACPT_USER_NAME VARCHAR(40) comment '被催办人姓名'
) comment '催办单';

create table SY_WFE_REMIND_PROC(
PROC_ID VARCHAR(40) not null primary key comment '催办处理过程ID',
REMD_ID VARCHAR(40) comment '催办ID',
PROC_MIND VARCHAR(400) comment '催办意见',
S_USER VARCHAR(40) comment '处理人',
S_DEPT VARCHAR(40) comment '处理部门',
S_TDEPT VARCHAR(40) comment '处理有效部门',
S_FLAG NUMERIC(4) comment '删除标志',
S_MTIME VARCHAR(30) comment ''
) comment '催办办理过程表';

create table SY_WFE_TEST(
ID VARCHAR(40) not null primary key comment '',
NAME VARCHAR(400) comment '',
TITLE VARCHAR(400) comment '',
S_WF_INST VARCHAR(40) comment '',
S_WF_NODE VARCHAR(2000) comment '',
S_WF_USER VARCHAR(2000) comment '',
S_WF_STATE NUMERIC(4) comment '',
S_TDEPT VARCHAR(40) comment '',
S_TNAME VARCHAR(40) comment '',
S_DEPT VARCHAR(40) comment '',
S_DNAME VARCHAR(40) comment '',
S_USER VARCHAR(40) comment '',
S_FLAG NUMERIC(4) comment '',
S_MTIME VARCHAR(23) comment '修改时间',
GW_MAIN_TO VARCHAR(2000) comment '主送',
MAIN_TO_CODE VARCHAR(2000) comment '主送方案编号',
GW_COPY_TO VARCHAR(2000) comment '抄送',
COPY_TO_CODE VARCHAR(2000) comment '抄送方案编号',
S_WF_USER_STATE VARCHAR(4000) comment '',
S_HAS_PS_MIND VARCHAR(100) comment '指定公司是否有批示意见'
) comment '';

create or replace view SY_BASE_USER_V as SELECT u.USER_CODE,u.USER_LOGIN_NAME,u.USER_NAME,u.DEPT_CODE,u.USER_PASSWORD,u.USER_SORT,u.USER_HOME_PHONE,u.USER_MOBILE,u.USER_QQ,u.USER_EMAIL,u.USER_WORK_LOC,u.USER_POST,u.USER_POST_LEVEL,u.USER_ROOM,u.USER_WORK_NUM,u.USER_IDCARD,u.USER_BIRTHDAY,u.USER_OFFICE_PHONE,u.USER_NATION,u.USER_HEIGHT,u.USER_SEX,u.USER_HOME_LAND,u.USER_POLITICS,u.USER_MARRIAGE,u.USER_EDU_LEVLE,u.USER_EDU_SCHOOL,u.USER_EDU_MAJOR,u.USER_TITLE,u.USER_TITLE_DATE,u.USER_WORK_DATE,u.USER_CMPY_DATE,u.USER_STATE,u.CMPY_CODE,u.S_FLAG,u.S_USER,u.USER_LOGIN_TYPE,u.USER_EXPIRE_DATE,u.USER_PASSWORD_DATE,u.S_MTIME,u.USER_IMG_SRC,u.PT_ID,u.USER_FROM,u.JIANGANG_FLAG,u.USER_SHORT_NAME,u.USER_EN_NAME,
          d.DEPT_NAME,
          d.DEPT_LEVEL,
          d.DEPT_SORT,
          d.TDEPT_CODE,
          d.ODEPT_CODE,
          d.CODE_PATH,
          d.S_FLAG DEPT_FLAG,
          d.PT_ID DEPT_PT_ID
     FROM SY_ORG_USER u left join SY_ORG_DEPT d
    on u.dept_code = d.dept_code
;
create or replace view SY_COMM_ENTITY_SEND_DTL_RECV as SELECT a.ENTITY_ID,
          a.TITLE,
          a.S_EMERGENCY,
          a.MEMO,
          B.SERV_ID,
          a.DATA_ID,
          a.S_USER,
          a.S_DEPT,
          a.S_TDEPT,
          a.S_ODEPT,
          a.S_CMPY,
          a.S_ATIME,
          a.S_MTIME,
          a.S_WF_NODE,
          a.S_WF_USER,
          a.S_WF_STATE,
          a.S_WF_INST,
          a.SERV_NAME,
          a.ENTITY_CODE,
          a.SERV_SRC_ID,
          a.S_WF_USER_STATE,
          a.S_HAS_PS_MIND,
      a.QUERY_ODEPT,
          B.SEND_ID,
          B.RECV_ODEPT,
          B.RECV_USER,
          B.RECV_UNAME,
          B.RECV_TIME,
          B.RECV_TYPE,
          B.RETN_FLAG,
          B.S_ODEPT AS SEND_ODEPT,
          B.S_USER AS SEND_USER,
          B.S_UNAME AS SEND_UNAME,
          B.SEND_TIME,
          B.SEND_STATUS
     FROM SY_COMM_ENTITY a, SY_COMM_SEND_DETAIL b
    WHERE     a.DATA_ID = B.DATA_ID
          AND B.SEND_STATUS > 1
          AND A.S_FLAG = 1
          AND B.S_FLAG = 1
;
create or replace view SY_COMM_ENTITY_SEND_DTL_V as SELECT a.ENTITY_ID,
          a.TITLE,
          a.S_EMERGENCY,
          a.MEMO,
          a.SERV_ID,
          a.DATA_ID,
          a.S_USER,
          a.S_DEPT,
          a.S_TDEPT,
          a.S_ODEPT,
          a.S_CMPY,
          a.S_ATIME,
          a.S_MTIME,
          a.S_WF_NODE,
          a.S_WF_USER,
          a.S_WF_STATE,
          a.S_WF_INST,
          a.SERV_NAME,
          a.ENTITY_CODE,
          a.SERV_SRC_ID,
          a.S_WF_USER_STATE,
          a.S_HAS_PS_MIND,
          a.QUERY_ODEPT,
          B.RECV_ODEPT,
          B.RECV_USER,
          B.RECV_TIME,
          B.RECV_TYPE,
          B.RETN_FLAG,
          B.S_ODEPT AS SEND_ODEPT,
          B.S_USER AS SEND_USER,
          B.SEND_TIME,
          B.SEND_STATUS
     FROM SY_COMM_ENTITY a, SY_COMM_SEND_DETAIL b
    WHERE     a.DATA_ID = B.DATA_ID
          AND B.SEND_STATUS > 1
          AND A.S_FLAG = 1
          AND B.S_FLAG = 1
;
create or replace view SY_COMM_ENTITY_TAG_V as SELECT t.et_id,
          t.tag_id,
          t.data_id,
          t.serv_id,
          t.s_user,
          t.s_atime,
          s.S_emergency,
          s.s_mtime,
          s.s_wf_node,
          s.s_wf_user,
          s.title,
          s.s_wf_state,
          s.memo,
          s.serv_name,
          s.S_FLAG,
          S.ENTITY_CODE,
          S.S_WF_USER_STATE,
          S.QUERY_ODEPT
     FROM SY_COMM_ENTITY_TAG t, SY_COMM_ENTITY s
    WHERE t.data_id = s.data_id

;
create or replace view SY_COMM_FILE_HIS_V as SELECT
    b.FILE_NAME,
    a.HISTFILE_ID,
    a.FILE_ID,
    a.HISTFILE_PATH,
    a.HISTFILE_SIZE,
    a.HISTFILE_MTYPE,
    a.HISTFILE_MEMO,
    a.HISTFILE_VERSION,
    a.S_FLAG,
    a.S_USER,
    a.S_UNAME,
    a.S_DEPT,
    a.S_DNAME,
    a.S_CMPY,
    a.S_MTIME,
    a.FILE_CHECKSUM

     FROM SY_COMM_FILE b , SY_COMM_FILE_HIS a
    WHERE   a.FILE_ID = b.FILE_ID
;
create or replace view SY_COMM_MIND_V as SELECT a.MIND_ID,
          a.MIND_CONTENT,
          a.MIND_CODE,
          a.MIND_TIME,
          a.SERV_ID,
          a.DATA_ID,
          a.WF_NI_ID,
          a.MIND_DIS_RULE,
          a.MIND_SORT,
          a.MIND_TYPE,
          a.BD_USER,
          a.BD_UNAME,
          a.S_USER,
          a.S_UNAME,
          a.S_DEPT,
          a.S_DNAME,
          a.S_TDEPT,
          a.S_TNAME,
          a.S_CMPY,
          a.S_FLAG,
          a.S_MTIME,
          a.USUAL_ID,
          a.MIND_IS_TERMINAL,
          a.S_ODEPT,
          a.MIND_FILE,
          a.MIND_CODE_NAME,
          a.WF_NI_NAME,
          a.MIND_LEVEL,
          b.MIND_VALUE,
          b.MIND_CONTENT USUAL_CONTENT,
          a.IS_BD
     FROM SY_COMM_MIND a left join SY_COMM_MIND_USUAL b
    on a.USUAL_ID = b.MIND_ID
;
create or replace view SY_COMM_TODO_HIS_V as SELECT a.TODO_ID,
       a.OWNER_CODE,
       a.DEPT_CODE,
       a.TDEPT_CODE,
       a.SEND_USER_CODE,
       a.TODO_TITLE,
       a.TODO_URL,
       a.TODO_SEND_TIME,
       a.TODO_FINISH_TIME,
       a.TODO_CODE,
       a.TODO_CODE_NAME,
       a.S_EMERGENCY,
       a.TODO_OPERATION,
       a.TODO_CATALOG,
       a.TODO_OBJECT_ID1,
       a.TODO_OBJECT_ID2,
       a.TODO_DEADLINE1,
       a.TODO_DEADLINE2,
       a.TODO_BENCH_FLAG,
       a.TODO_ACCESS_FLAG,
       a.S_CMPY,
       a.TODO_CONTENT,
       a.S_MTIME,
       a.SERV_ID,
       a.AGT_USER_CODE,
       b.S_TDEPT,
       b.S_ODEPT,
       b.QUERY_ODEPT,
       A.SERV_DATA_CODE,A.TODO_FROM
 FROM SY_COMM_TODO_HIS a left join SY_COMM_ENTITY b
 on a.TODO_OBJECT_ID1 = b.DATA_ID
;
create or replace view SY_COMM_TODO_V as SELECT a.TODO_ID,
    a.OWNER_CODE,
    a.DEPT_CODE,
    a.TDEPT_CODE,
    a.SEND_USER_CODE,
    a.TODO_TITLE,
    a.TODO_URL,
    a.TODO_SEND_TIME,
    a.TODO_FINISH_TIME,
    a.TODO_CODE,
    a.TODO_CODE_NAME,
    a.S_EMERGENCY,
    a.TODO_OPERATION,
    a.TODO_CATALOG,
    a.TODO_OBJECT_ID1,
    a.TODO_OBJECT_ID2,
    a.TODO_DEADLINE1,
    a.TODO_DEADLINE2,
    a.TODO_BENCH_FLAG,
    a.TODO_ACCESS_FLAG,
    a.S_CMPY,
    a.TODO_CONTENT,
    a.S_MTIME,
    a.SERV_ID,
    a.AGT_USER_CODE,
    b.S_TDEPT,
    b.S_ODEPT,
    b.Query_Odept,
    a.SERV_DATA_CODE,
    a.TODO_FROM
 FROM sy_comm_todo a left join sy_comm_entity b
 on a.TODO_OBJECT_ID1 = b.DATA_ID
;
create or replace view SY_ORG_GROUP_USER_V as select
a.GU_ID,
a.GROUP_CODE,
a.USER_CODE,
a.GU_POST,
a.GU_ADMIN,
a.S_FLAG,
a.S_MTIME,
b.GROUP_NAME,
b.GROUP_TYPE,
b.GROUP_SORT,
b.S_FLAG GROUP_FLAG,
b.S_CMPY,
c.S_FLAG USER_FLAG,
d.ODEPT_CODE,
d.CODE_PATH
from SY_ORG_GROUP_USER a, SY_ORG_GROUP b, SY_ORG_USER c
left join SY_ORG_DEPT d on c.DEPT_CODE=d.DEPT_CODE
where a.GROUP_CODE=b.GROUP_CODE
and a.USER_CODE=c.USER_CODE
;
create or replace view SY_ORG_ROLE_USER_V as SELECT a.RU_ID, a.USER_CODE, a.ROLE_CODE, a.CMPY_CODE, a.S_FLAG,
          a.S_USER, a.S_MTIME, b.role_name, b.role_sort, c.user_name,c.USER_LOGIN_NAME,
          c.user_sort, c.dept_code, c.user_state, c.s_flag user_s_flag, d.tdept_code, d.odept_code, d.dept_level, d.dept_sort, d.code_path
     FROM SY_ORG_ROLE_USER a, SY_ORG_ROLE b, SY_ORG_USER c left join SY_ORG_DEPT d
     on c.DEPT_CODE = d.DEPT_CODE
    WHERE a.role_code = b.role_code AND a.user_code = c.user_code
;
create or replace view SY_ORG_USER_RELATION_V as SELECT r.UR_ID,
          r.USER_CODE,
          r.ORIGIN_USER_CODE,
          r.RELATION_TYPE,
          r.RELATION_BTIME,
          r.RELATION_ETIME,
          r.RELATION_MEMO,
          r.CMPY_CODE,
          r.ORIGIN_CMPY_CODE,
          r.S_FLAG,
          r.S_USER,
          r.S_MTIME,
          d1.TDEPT_CODE,
          d1.ODEPT_CODE,
          d2.TDEPT_CODE ORIG_TDEPT_CODE,
          d2.ODEPT_CODE ORIG_ODEPT_CODE
     FROM SY_ORG_USER_RELATION r, SY_ORG_USER u1 left join SY_ORG_DEPT d1
     on u1.DEPT_CODE=d1.DEPT_CODE,
        SY_ORG_USER u2 left join SY_ORG_DEPT d2
     on u2.DEPT_CODE=d2.DEPT_CODE
    WHERE u1.USER_CODE = r.user_code AND u2.User_CODE = r.ORIGIN_USER_CODE
;
create or replace view SY_ORG_USER_TYPE_AGENT_REL_V as select a.RE_AGT_ID,a.AGT_ID,a.USER_CODE,a.FROM_USER_CODE,a.TO_USER_CODE,a.AGT_TYPE_CODE,a.AGT_USER_PATH,a.AGT_STATUS,a.S_FLAG,a.S_CMPY,a.S_MTIME,a.S_USER,a.REAGT_ID_PATH,a.SRC_AGT_ID,a.AGT_BEGIN_DATE,a.AGT_END_DATE,a.VALID_BEGIN_DATE,a.VALID_END_DATE,a.LAST_REAGT_ID, b.agt_memo MEMO_S from SY_ORG_USER_TYPE_AGENT_REL a, sy_org_user_type_agent b where a.AGT_ID = b.AGT_ID
;
create or replace view SY_SERV_LOG_ACT_V as select a.ALOG_ID,a.ACT_ID,a.ACT_KEYS,a.ACT_TIME,a.S_CMPY,a.S_USER,a.S_MTIME,a.ACT_IP, A.serv_id, IFNULL(b.act_code, a.ACT_ID) ACT_CODE, b.act_name,b.act_type
    from sy_serv_log_act a left join sy_serv_act b
  on a.act_id = b.act_id
;
create or replace view SY_SERV_LOG_ITEM_V as select a.ILOG_ID,a.ITEM_ID,a.ITEM_CODE,a.DATA_ID,a.ILOG_OLD,a.ILOG_NEW,a.S_CMPY,a.S_USER,a.S_MTIME,a.ILOG_IP, a.serv_id, b.item_name, b.item_input_type, b.item_input_mode, b.dict_id
    from SY_SERV_LOG_ITEM a left join SY_SERV_ITEM b
    on a.item_id = b.item_id
;
create or replace view SY_SERV_RELATE_V as SELECT a.RELATE_ID,
          a.SERV_ID,
          a.DATA_ID,
          a.RELATE_SERV_ID,
          a.RELATE_DATA_ID,
          a.RELATE_SORT,
          a.RELATE_TYPE,
          a.S_USER,
          a.S_DEPT,
          a.S_TDEPT,
          a.S_CMPY,
          a.S_ATIME,
          a.S_ODEPT,
          b.TITLE,
          b.SERV_NAME,
          b.QUERY_ODEPT
     FROM SY_SERV_RELATE a left join SY_COMM_ENTITY b
    on a.RELATE_DATA_ID = b.DATA_ID
;
create or replace view SY_WFE_NODE_USERS_V as select a.UN_ID,a.NI_ID,a.TO_USER_ID,a.TO_USER_NAME,a.TO_DEPT_ID,a.TO_DEPT_NAME,a.PI_ID,a.S_ATIME, b.NODE_IF_RUNNING from SY_WFE_NODE_USERS a, SY_WFE_NODE_INST b where A.NI_ID = b.NI_ID
;
create or replace view SY_WFE_REMIND_V as SELECT a.REMD_ID,
          a.ACPT_USER,
          a.ACPT_DEPT,
          a.ACPT_TDEPT,
          a.ACPT_PHONE,
          a.REMD_TITLE,
          a.REMD_REASON,
          a.REMD_CODE,
          a.REMD_YEAR,
          a.REMD_NUM,
          a.REMD_CDEPT,
          a.DEADLINE,
          a.OVER_DAYS,
          a.S_EMERGENCY,
          a.DO_MIND,
          a.REMD_PHONE,
          a.REMD_STATUS,
          a.S_FLAG,
          a.S_USER,
          a.S_DEPT,
          a.S_TDEPT,
          a.S_ODEPT,
          a.S_CMPY,
          a.S_ATIME,
          a.S_MTIME,
          a.REMD_SCRT,
          a.SERV_ID,
          a.DATA_ID,
          a.WF_NODE_ID,
          a.ACPT_USER_NAME,
          b.USER_NAME,
          c.DEPT_NAME
     FROM SY_WFE_REMIND a
     left join SY_ORG_USER b on a.ACPT_USER = b.USER_CODE
     left join SY_ORG_DEPT c on a.ACPT_DEPT = c.DEPT_CODE
;
