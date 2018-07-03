/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018/6/29 19:03:25                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('flightInformation') and o.name = 'FK_FLIGHTIN_UPDATE_ADMINUSE')
alter table flightInformation
   drop constraint FK_FLIGHTIN_UPDATE_ADMINUSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('flightInformation') and o.name = 'FK_FLIGHTIN_RUNNINGON_PLANE')
alter table flightInformation
   drop constraint FK_FLIGHTIN_RUNNINGON_PLANE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('orders') and o.name = 'FK_ORDERS_MATCH_FLIGHTIN')
alter table orders
   drop constraint FK_ORDERS_MATCH_FLIGHTIN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('orders') and o.name = 'FK_ORDERS_ORDER_USERS')
alter table orders
   drop constraint FK_ORDERS_ORDER_USERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('plane') and o.name = 'FK_PLANE_ADD_ADMINUSE')
alter table plane
   drop constraint FK_PLANE_ADD_ADMINUSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('users') and o.name = 'FK_USERS_MANAGER_ADMINUSE')
alter table users
   drop constraint FK_USERS_MANAGER_ADMINUSE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('adminUser')
            and   type = 'U')
   drop table adminUser
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('flightInformation')
            and   name  = 'runningOn_FK'
            and   indid > 0
            and   indid < 255)
   drop index flightInformation.runningOn_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('flightInformation')
            and   name  = 'Update_FK'
            and   indid > 0
            and   indid < 255)
   drop index flightInformation.Update_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('flightInformation')
            and   type = 'U')
   drop table flightInformation
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('orders')
            and   name  = 'match_FK'
            and   indid > 0
            and   indid < 255)
   drop index orders.match_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('orders')
            and   name  = 'order_FK'
            and   indid > 0
            and   indid < 255)
   drop index orders.order_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('orders')
            and   type = 'U')
   drop table orders
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('plane')
            and   name  = 'add_FK'
            and   indid > 0
            and   indid < 255)
   drop index plane.add_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('plane')
            and   type = 'U')
   drop table plane
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('users')
            and   name  = 'Manager_FK'
            and   indid > 0
            and   indid < 255)
   drop index users.Manager_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('users')
            and   type = 'U')
   drop table users
go

/*==============================================================*/
/* Table: adminUser                                             */
/*==============================================================*/
create table adminUser (
   admin_id             int                  not null,
   admin_name           varchar(20)          not null,
   account              varchar(50)          not null,
   admin_password       varchar(20)          not null,
   admin_phone          varchar(20)          null,
   admin_type           int                  null,
   admin_authority      varchar(100)         null,
   constraint PK_ADMINUSER primary key nonclustered (admin_id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '姓名',
   'user', @CurrentUser, 'table', 'adminUser', 'column', 'admin_name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'adminUser', 'column', 'admin_password'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '电话',
   'user', @CurrentUser, 'table', 'adminUser', 'column', 'admin_phone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '管理员类型',
   'user', @CurrentUser, 'table', 'adminUser', 'column', 'admin_type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '权限描述',
   'user', @CurrentUser, 'table', 'adminUser', 'column', 'admin_authority'
go

/*==============================================================*/
/* Table: flightInformation                                     */
/*==============================================================*/
create table flightInformation (
   flight_id            int                  not null,
   admin_id             int                  not null,
   plane_id             int                  not null,
   flight_name          varchar(10)          not null,
   fromCity             varchar(100)         not null,
   toCity               varchar(100)         not null,
   fromTerminal         varchar(10)          not null,
   toTerminal           varchar(10)          not null,
   startDate            datetime             not null,
   statrTime            datetime             not null,
   arriveDate           datetime             not null,
   arriveTime           datetime             not null,
   duration             double precision     not null,
   touristClassRemain   int                  not null,
   businessClassRemain  int                  not null,
   firstClassRemain     int                  not null,
   touristClassPrice    int                  not null,
   businessClassPrice   int                  not null,
   firstClassPrice      int                  not null,
   fligth_state         varchar(50)          null,
   constraint PK_FLIGHTINFORMATION primary key nonclustered (flight_id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '航班id',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'flight_id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '飞机id',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'plane_id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '航班号',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'flight_name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '飞往',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'fromCity'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目的地',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'toCity'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '起飞航站楼',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'fromTerminal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '到达航站楼',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'toTerminal'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '起飞日期',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'startDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '起飞时间',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'statrTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '到达日期',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'arriveDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '到达时间',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'arriveTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总用时',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'duration'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '经济舱剩余',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'touristClassRemain'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '商务舱剩余',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'businessClassRemain'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头等舱剩余',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'firstClassRemain'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '经济舱价格',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'touristClassPrice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '商务舱价格',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'businessClassPrice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头等舱价格',
   'user', @CurrentUser, 'table', 'flightInformation', 'column', 'firstClassPrice'
go

/*==============================================================*/
/* Index: Update_FK                                             */
/*==============================================================*/
create index Update_FK on flightInformation (
admin_id ASC
)
go

/*==============================================================*/
/* Index: runningOn_FK                                          */
/*==============================================================*/
create index runningOn_FK on flightInformation (
plane_id ASC
)
go

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders (
   orders_id            int                  not null,
   flight_id            int                  not null,
   users_id             int                  not null,
   ordersTime           varchar(50)          null,
   touristClassNum      int                  null default 0,
   businessClassNum     int                  null default 0,
   firstClassNum        int                  null default 0,
   totalNum             int                  null,
   totalPrice           int                  null,
   state                varchar(10)          null,
   refundTime           varchar(50)          null,
   conversion           varchar(50)          null,
   refundOorConversion  varchar(50)          null,
   constraint PK_ORDERS primary key nonclustered (orders_id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '航班id',
   'user', @CurrentUser, 'table', 'orders', 'column', 'flight_id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '订购时间',
   'user', @CurrentUser, 'table', 'orders', 'column', 'ordersTime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '经济舱数量',
   'user', @CurrentUser, 'table', 'orders', 'column', 'touristClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '商务舱数量',
   'user', @CurrentUser, 'table', 'orders', 'column', 'businessClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头等舱数量',
   'user', @CurrentUser, 'table', 'orders', 'column', 'firstClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总数量',
   'user', @CurrentUser, 'table', 'orders', 'column', 'totalNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '总价格',
   'user', @CurrentUser, 'table', 'orders', 'column', 'totalPrice'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态',
   'user', @CurrentUser, 'table', 'orders', 'column', 'state'
go

/*==============================================================*/
/* Index: order_FK                                              */
/*==============================================================*/
create index order_FK on orders (
users_id ASC
)
go

/*==============================================================*/
/* Index: match_FK                                              */
/*==============================================================*/
create index match_FK on orders (
flight_id ASC
)
go

/*==============================================================*/
/* Table: plane                                                 */
/*==============================================================*/
create table plane (
   plane_id             int                  not null,
   admin_id             int                  not null,
   plane_name           varchar(6)           not null,
   type                 varchar(10)          not null,
   buyDate              datetime             not null,
   useDate              datetime             not null,
   touristClassNum      int                  not null default 0,
   businessClassNum     int                  not null default 0,
   firstClassNum        int                  not null default 0,
   remark               varchar(100)         null,
   constraint PK_PLANE primary key nonclustered (plane_id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '飞机id',
   'user', @CurrentUser, 'table', 'plane', 'column', 'plane_id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '飞机号',
   'user', @CurrentUser, 'table', 'plane', 'column', 'plane_name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '飞机类型',
   'user', @CurrentUser, 'table', 'plane', 'column', 'type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '购买日期',
   'user', @CurrentUser, 'table', 'plane', 'column', 'buyDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '使用日期',
   'user', @CurrentUser, 'table', 'plane', 'column', 'useDate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '经济舱数量',
   'user', @CurrentUser, 'table', 'plane', 'column', 'touristClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '商务舱数量',
   'user', @CurrentUser, 'table', 'plane', 'column', 'businessClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头等舱数量',
   'user', @CurrentUser, 'table', 'plane', 'column', 'firstClassNum'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'plane', 'column', 'remark'
go

/*==============================================================*/
/* Index: add_FK                                                */
/*==============================================================*/
create index add_FK on plane (
admin_id ASC
)
go

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users (
   users_id             int                  not null,
   admin_id             int                  not null,
   name                 varchar(20)          not null,
   phone                varchar(20)          not null,
   password             varchar(20)          not null,
   sex                  varchar(5)           null,
   idCard               varchar(18)          null,
   email                varchar(50)          null,
   country              varchar(50)          null,
   constraint PK_USERS primary key nonclustered (users_id)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '姓名',
   'user', @CurrentUser, 'table', 'users', 'column', 'name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '电话',
   'user', @CurrentUser, 'table', 'users', 'column', 'phone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'users', 'column', 'password'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性别',
   'user', @CurrentUser, 'table', 'users', 'column', 'sex'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '身份证',
   'user', @CurrentUser, 'table', 'users', 'column', 'idCard'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '电子邮件',
   'user', @CurrentUser, 'table', 'users', 'column', 'email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '地区',
   'user', @CurrentUser, 'table', 'users', 'column', 'country'
go

/*==============================================================*/
/* Index: Manager_FK                                            */
/*==============================================================*/
create index Manager_FK on users (
admin_id ASC
)
go

alter table flightInformation
   add constraint FK_FLIGHTIN_UPDATE_ADMINUSE foreign key (admin_id)
      references adminUser (admin_id)
go

alter table flightInformation
   add constraint FK_FLIGHTIN_RUNNINGON_PLANE foreign key (plane_id)
      references plane (plane_id)
go

alter table orders
   add constraint FK_ORDERS_MATCH_FLIGHTIN foreign key (flight_id)
      references flightInformation (flight_id)
go

alter table orders
   add constraint FK_ORDERS_ORDER_USERS foreign key (users_id)
      references users (users_id)
go

alter table plane
   add constraint FK_PLANE_ADD_ADMINUSE foreign key (admin_id)
      references adminUser (admin_id)
go

alter table users
   add constraint FK_USERS_MANAGER_ADMINUSE foreign key (admin_id)
      references adminUser (admin_id)
go

