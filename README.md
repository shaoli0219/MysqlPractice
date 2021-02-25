# MySQL

[TOC]

## 一、数据库的好处

1. 持久化数据到本地
2. 可以实现结构化查询，方便管理

## 二、数据库相关概念

1. DB	数据库保存一组具有组织的数据的容器
2. DBMS	数据库管理系统，用于管理DB中的数据
3. SQL	结构化查询语言，用于和DBMS通讯的语言

## 三、初始化MySQL

1. MySQL简介

2. MySQL安装

3. MySQL服务的启动与停止

    - 方式一：

    ​	计算机-管理-服务

    - 方式二：

        ​	管理员身份运行cmd
        ​	启动net start 服务名
        ​	关闭net stop 服务名sdsd

## 四、MySQL服务的登录和退出

### 登陆

1. 方式一：通过MySQL自带的客户端登陆，但只限于rooty用户

2. 方式二：通过cmd登陆，如：mysql 【-h主机号 -p端口号】-u用户名 -p密码


### 退出

 1. exit

 2. crtl+c

## 五、MySQL的常见命令和语法规范

### 常见命令

#### 查看当前所有的数据库

```sql
show databases;
```

#### 打开指定的数据库

```sql
use 库名;
```

#### 查看当前数据库的所有表

```sql
show tables;
```

#### 查看其它数据库的所有表

```sql
show tables from 库名;
```

#### 创建表

```sql
create table 表名{
	列名 类型,
	列名 类型,
	...
}
```

#### 查看表结构

```sql
desc 表名
```

#### 查看服务器版本

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

## 六、DQL（数据库查询语言）

#### 基础查询

##### 1_查询表中的单个字段

```sql
SELECT last_name FROM employees;
```

##### 2_查询表中的多个字段

```sql
SELECT last_name,salary,email FROM employees;
```

##### 3_查询表中的所有字段

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

##### 4_查询常量
```sql
    SELECT 100;
    SELECT 'john';
```

##### 5_查询表达式
```sql
    SELECT 100*77;
```

##### 6_查询函数
```sql
    SELECT VERSION();
```

##### 7_起别名AS

方式一：

```sql
SELECT last_name AS 姓,first_name AS 名 FROM employees;

SELECT 100*77 AS 结果;

SELECT 100*100 AS "OUT PUT";
```

方式二：

```sql
SELECT last_name 姓,first_name 名 FROM employees;

SELECT 100*77 结果;
```

##### 8_去重

```sql
SELECT DISTINCT
  department_id
FROM
  employees
```

##### 9_MySQL中的+

```sql
SELECT
  10+20;
#30
SELECT
  "20" + 20;
#40
SELECT
  "test" + 20;
#20
SELECT
  NULL + 20;
#  NULL
```

##### 10_CONCAT函数

```sql
SELECT
  CONCAT (last_name, " ", first_name) AS 姓名
FROM
  employees;
```

#### 条件查询

##### 1_条件表达式

```sql
/**1查询工资大于12000的员工信息**/
SELECT
  *
FROM
  employees
WHERE salary > 12000;
```

```sql
/**2查询部门编号不等于90的员工的姓名和部门编号**/
SELECT
  last_name,
  department_id
FROM
  employees
WHERE department_id <> 90;
```

##### 2_逻辑表达式



##### 3_模糊查询（高级条件表达式）



#### 排序查询

#### 常见函数

#### 分组函数

#### 分组查询

#### 链接查询

#### 子查询

#### 分页查询

#### union联合查询


## 七、DML（数据库操作语言）

#### 插入语句

#### 修改语句

#### 删除语句


## 八、DDL（数据库定义语言）

#### 库和表的管理

#### 常见数据类型介绍

#### 常见约束


## 九、TCL（事务控制语言）

## 十、视图

## 十一、存储过程和函数

## 十二、流程控制结构

