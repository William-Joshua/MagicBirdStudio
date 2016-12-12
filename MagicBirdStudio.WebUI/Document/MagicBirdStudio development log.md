###Asp.net开发框架学习 : MVC + EF + BootStarp

####Section 0: Development Environment Instructions
| id | softwave&environment | vesion | remark |
|--------|--------|--------|--------|
| 1 | Microsoft Windows 10 专业版 | Version 1511 |  |
| 2 | Microsoft Visual Studio Ultimate 2012 | Version 11.0.61219.00 Update 5 ||
| 3 | Microsoft .NET FrameWork | Version 4.6.01038 ||
| 4 | Microsoft ASP.NET MVC 4 | Version 4.0.20710.0  |  |
| 5 | MySql | Version 14.14 Distrib 5.7.14, for Win64 (x86_64) ||
| 6 | NuGet Package Manager | Version 2.8.60318.667 | 软件包管理软件 |
| 7 | EntityFramework | Version 6.0.0 |  |
| 8 | MySql.Data | Version 6.99 | .net 连接 Mysql 数据库 |
| 9 | MySql.Data.Entity | Version 6.99 | .net 连接 Mysql 数据库 |
| 10 | Mysql.Web | Version 6.99 | .net 连接 Mysql 数据库 |
| 11 | Microsoft ASP.NET Web Optimization | Version 1.1.3 |  |
| 12 | Git  | git version 2.9.0.windows.1 | 版本管理软件 |
| 13  | Visual Studio Tools for Git | Version 1.0.1.0 |  |
| 14 | Json.NET | Version 5.04 ||
| 15 | Microsoft ASP.NET Razor 2 | Version 2.0.20715.0 ||

- - -

####Section 1 : Build project with MVC + EF + bootstap in VS2015




_ _ _

#### Section 2 : 连接 MySQL 数据库
通过 MySql.Data.MySqlClient 实现 MVC 与 MySQL 数据库连接
```
 1. 利用 NuGet Package Manager 安装 MySql.Data/MySql.Data.Entity/MySql.Web 等控件;
 2. 打开 web.config 在 connectionStrings 标签下的 <add name="MySqlConnectionString" connectionString="" providerName="MySql.Data.MySqlClient" /> 中，在其 connectionString 属性下添加 MySQL 数据库连接字符串;
 3. MySQL 数据库连接字符串格式如下 ："server=xxxx(注：localhost = 127.0。0.1）；Id=root;password=xxxx;database=xxxx;";

```

**注： **
	*1. web.config文件在添加MySQL.Data之后，可能会存在的添加 membership 标签，导致配置文件中同时存在两个同名标签，请将原始 membership 标签及其内容注释;*