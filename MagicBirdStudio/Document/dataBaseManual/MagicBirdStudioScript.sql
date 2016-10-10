-- 数据库配置说明(完善中)
-- Data : 2016-01-18
-- Author : William.D.Joshua
-- 人员信息管理
create table UserManagement(
	UserID varchar(10) not null comment '用户登陆ID',
	PassWord varchar(16) not null comment '用户密码',
	UserName varchar(32) not null comment '注册用户姓名',
	LoginLv1 tinyint(1) default 1 comment '查询权限',
	LoginLv2 tinyint(1) default 0 comment '仓库管理权限(出入库,来料管理)',
	LoginLv3 tinyint(1) default 0 comment '质量检测权限(检测元器件及检测结果编辑)',
	LoginLv4 tinyint(1) default 0 comment '生产计划负责人(出入库异常处理)',
	LoginLv5 tinyint(1) default 0 comment '清单管理员(下发生产计划单)',
	LoginLv6 tinyint(1) default 0 comment '用户管理员(管理用户组)',
	LoginLv7 tinyint(1) default 0 comment '生产器件清单下发与元器件编号制定',
	LoginLv8 tinyint(1) default 0 comment '合同负责人(上传合同或送样小试单)',
	primary key (UserID)
);


-- 生产合同信息表
create table OrderContract(
	ContractID varchar(32) not null comment '生产合同编号(送样计划采用送样小试单号)',
	ContractName varchar(200) not null comment '生产合同名(送样计划采用送样小试单名)',
	LeadingOfficial varchar(10) comment '合同负责人',
	ContractFileAdd varchar(200) comment '合同原件(pdf)存储地址,服务器绝对位置',
	ContractRemarks varchar(500) comment '合同信息备注',
	AddTime timestamp not null default current_timestamp,
	primary key (ContractID)
);

-- 器件信息表
create table componentinformation(
	ComponentID varchar(32) not null comment '元器件编号(场内自定义编号或供应商提供,注该号码需由下发元器件清单提供,与仓库管理无关)',
	ComponentTypeName varchar(20) not null comment '元器件类型名,如片阻，片容等',
	ComponentTypeAb varchar(10) not null comment '元器件类型简称,用于关联检测工具相关信息',
	ContractSpec varchar(100) not null comment '元器件规格描述',
	PinPackage varchar(50) comment '元器件引脚封装型号',
	ComponentRemarks varchar(500) comment '元器件备注信息',
	primary key (ComponentID)
);

-- 器件厂家&供应商信息表
create table VendorInformation(
	ComponentID varchar(32) not null comment '器件信息表中元器件ID',
	Manufacturer varchar(50) comment '器件生产厂商',
	Agent varchar(50) comment '器件代理商,供应商'
);

-- 清单管理
create table ListManagement(
	ListType varchar(10) not null comment '清单类型,该清单存储多种表单',
	ListId varchar(32) comment '清单ID号,检测报告ID,出库单ID',
	ListName varchar(100) comment '清单名称,检测报告名,出库单名称',
	ListAmount int comment '清单生产数量(检测报告,出库单无数量)',
	ContractID varchar(32) '合同编号,(检测报告,出库单无合同编号)',
	ListRemark varchar(500) '清单备注 ',
	ListDetail longblob '	清单详情',
	AddTime timestamp not null default current_timestamp 
)
