# MySQL

[TOC]

## 数据库的好处

1. 持久化数据到本地
2. 可以实现结构化查询，方便管理

## 数据库相关概念

1. DB	数据库保存一组具有组织的数据的容器
2. DBMS	数据库管理系统，用于管理DB中的数据
3. SQL	结构化查询语言，用于和DBMS通讯的语言

## 初始化MySQL

1. MySQL简介

2. MySQL安装

3. MySQL服务的启动与停止

    - 方式一：

    ​	计算机-管理-服务

    - 方式二：

        ​	管理员身份运行cmd
        ​	启动net start 服务名
        ​	关闭net stop 服务名sdsd

## MySQL服务的登录和退出

##### 登陆

1. 方式一：通过MySQL自带的客户端登陆，但只限于rooty用户

2. 方式二：通过cmd登陆，如：mysql 【-h主机号 -p端口号】-u用户名 -p密码


##### 退出

 1. exit

 2. crtl+c

## MySQL的常见命令和语法规范

### 常见命令

##### 查看当前所有的数据库

```sql
show databases;
```

##### 打开指定的数据库

```sql
use 库名;
```

##### 查看当前数据库的所有表

```sql
show tables;
```

##### 查看其它数据库的所有表

```sql
show tables from 库名;
```

##### 创建表

```sql
create table 表名{
	列名 类型,
	列名 类型,
	...
}
```

##### 查看表结构

```sql
desc 表名
```

##### 查看服务器版本

已登录

```sql
select version();
```


未登录
```
mysql --version

mysql --V
```

### 语法规范

1. 不区分大小写，但建议关键字大写，表名、列名小写

2. 每条命令分号结尾

3. 每条命令可以根据需要缩进或换行

4. 注释

    ​	单行注释：#注释文字

    ​	单行注释：--注释文字

    ​	多行注释：/* 注释文字 */

## DQL（数据库查询语言）

##### 基础查询

1.  ###### 查询表中的单个字段

    ```sql
    SELECT last_name FROM employees;
    ```

2.  ###### 查询表中的多个字段

    ```sql
    SELECT last_name,salary,email FROM employees;
    ```

3.  ###### 查询表中的所有字段

    方式一：

    ```sql
    SELECT * FROM employees
    ```

    方式二：

    ```sql
    SELECT 
    
    employee_id,
    
    first_name,
    
    last_name,
    
    	...
    
    FROM
    
    employees;
    ```

##### 条件查询

##### 排序查询

##### 常见函数

##### 分组函数

##### 分组查询

##### 链接查询

##### 子查询

##### 分页查询

##### union联合查询


## DML（数据库操作语言）

##### 插入语句

##### 修改语句

##### 删除语句


## DDL（数据库定义语言）

##### 库和表的管理

##### 常见数据类型介绍

##### 常见约束


## TCL（事务控制语言）

## 视图

## 存储过程和函数

## 流程控制结构

