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

###### <	>	<=	>=	 !=	=

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

###### &&	|| 	!	and	or	not

```sql
/**3查询工资在10000到20000之间的员工名、工资及奖金**/
SELECT
  last_name,
  salary,
  commission_pct
FROM
  employees
WHERE salary > 10000
  AND salary < 20000;
```

```sql
/**4查询部门编号不是在90到110之间，或者工资高于15000的员工信息**/
SELECT
  *
FROM
  employees
WHERE NOT (
    department_id >= 90
    AND department_id <= 110
  )
  OR salary > 15000;
```

##### 3_模糊查询（高级条件表达式）

###### like

**常和通配符搭配使用：**%	任意多、_	只有一个、\转义字符、escape关键字

```sql
/**5查询员工姓名中包涵字符a的员工信息**/
SELECT
  *
FROM
  employees
WHERE last_name LIKE "%a%";
```

```sql
/**6查询员工姓名中第三个字符为n第五个字符为l员工**/
SELECT
  last_name,
  salary
FROM
  employees
WHERE last_name LIKE "__n_l%";
```

```sql
/**7查询员工姓名中第二个字符为_的员工姓名**/
SELECT
  last_name
FROM
  employees
WHERE last_name LIKE "_\_%";

SELECT
  last_name
FROM
  employees
WHERE last_name LIKE "_@_%" ESCAPE "@";
```

###### between and

```sql
/**8查询员工编号在100到200之间的员工信息**/
SELECT
  *
FROM
  employees
WHERE employee_id >= 100
  AND employee_id <= 120;

SELECT
  *
FROM
  employees
WHERE employee_id BETWEEN 100
  AND 120;
```

###### in

```sql
/**9查询工种编号是IT_PROG、AD_VP、AD_PRES中的一个的员工的员工名和工种编号**/
SELECT
  last_name,
  job_id
FROM
  employees
WHERE job_id = "IT_PROG"
  OR job_id = "AD_VP"
  OR job_id = "AD_PRES";

SELECT
  last_name,
  job_id
FROM
  employees
WHERE job_id IN ("IT_PROG", "AD_VP", "AD_PRES");
```

###### is null

```sql
/**10查询没有奖金的员工姓名和奖金率**/
SELECT
  last_name,
  commission_pct
FROM
  employees
WHERE commission_pct IS NULL;

/**11查询有奖金的员工姓名和奖金率**/
SELECT
  last_name,
  commission_pct
FROM
  employees
WHERE commission_pct IS NOT NULL;
```

###### 安全等于和安全不等于

```sql
/**12安全等于<=>、安全不等于<>**/
SELECT
  last_name,
  commission_pct
FROM
  employees
WHERE commission_pct <=> NULL;

SELECT
  last_name,
  salary
FROM
  employees
WHERE salary <=> 12000;

SELECT
  last_name,
  salary
FROM
  employees
WHERE salary <> 12000;
```

###### IFNULL

```sql
/**13查询编号为176的员工的姓名、部门号和年薪**/
SELECT
  last_name,
  department_id,
  salary * 12 * (1+ IFNULL (commission_pct, 0)) AS 年薪
FROM
  employees
WHERE employee_id = 176;
```

#### 排序查询

注意事项

- asc代表升序，desc代表降序
- 如果不写asc或者desc，默认按升序排序
- order by子句中支持单个字段、多个字段、表达式、函数和别名
- order by子句一般放到查询语句最后（limit子句除外）

##### 1_基本用法

```sql
/**14查询员工信息，要求工资从高到低或从低到高**/
SELECT
  *
FROM
  employees
ORDER BY salary DESC;

SELECT
  *
FROM
  employees
ORDER BY salary ASC;
```

##### 2_添加筛选条件

```sql
/**15查询部门编号>=90的员工信息，安入职时间的先后顺序**/
SELECT
  *
FROM
  employees
WHERE department_id >= 90
ORDER BY hiredate ASC;
```

##### 3_按表达式排序

```sql
/**16按年薪的高低显示员工的信息和年薪**/
SELECT
  *,
  salary * 12 * (1+ IFNULL (commission_pct, 0)) 年薪
FROM
  employees
ORDER BY salary * 12 * (1+ IFNULL (commission_pct, 0)) DESC;

SELECT
  *,
  salary * 12 * (1+ IFNULL (commission_pct, 0)) 年薪
FROM
  employees
ORDER BY 年薪 DESC;
```

##### 4_按函数排序

```
/**17按姓名长度显示员工姓名和工资**/
SELECT
  last_name,
  LENGTH (last_name) 姓名长度,
  salary
FROM
  employees
ORDER BY 姓名长度 DESC;
```

5_多个字段同时排序

```sql
/**18查询员工信息，先按工资升序，再按员工编号降序**/
SELECT
  *
FROM
  employees
ORDER BY salary ASC,
  employee_id DESC;
```

#### 常见函数

注意事项

- 函数可以隐藏细节，提高代码的重用性
- 单行函数
    - 字符函数
    - 数学函数
    - 日期函数
    - 其它函数【补充】
    - 流程控制函数【补充】
- 分组函数（聚合函数）

##### 1_字符函数

###### LENGTH

```sql
 /**1.LENGTH(str)获取str参数值的字节个数**/
SELECT
  LENGTH ('john');

SELECT
  LENGTH ('李狗蛋hahaha');

/**显示字符集**/
SHOW VARIABLES LIKE '%char%';
```

###### CONCAT

```sql
/**2.CONCAT拼接字符串**/
SELECT
  CONCAT (last_name, '_', first_name)
FROM
  employees;
```

###### UPPER LOWER

```sql
/**2.UPPER LOWER**/
SELECT
  UPPER ('john');

SELECT
  LOWER ('JOHN');
```

```sql
/**将姓名变大写，名字变小写，然后拼接**/
SELECT
  CONCAT (
    UPPER (last_name),
    '_',
    LOWER (first_name)
  )
FROM
  employees;
```

###### SUBSTR

```sql
/**4.SUBSTR截取字符串**/
SELECT
  SUBSTR('Hello World', 4) result;

SELECT
  SUBSTR('Hello World', 5, 3) result;

/**姓名中首字符大写，其他字符小写然后用_拼接**/
SELECT
  CONCAT (
    UPPER (SUBSTR(last_name, 1, 1)),
    '_',
    LOWER (SUBSTR(first_name, 2))
  ) result
FROM
  employees;
```

###### INSTR

```sql
/**5.INSTR返回子串第一次出现的索引，找不到返回0**/
SELECT
  INSTR('hello World', 'l') result;
```

###### TRIM

```sql
/**6.TRIM去掉字符串前后空格或指定字符**/
SELECT
  LENGTH (TRIM ('     李狗蛋 ')) result;

SELECT
  TRIM(
    'a' FROM 'aaaa李狗aaaaa蛋aaaaaaaaaaaaaaaaaaaaaaa'
  ) result;
```

###### LPAD

```sql
/**7.lpad 用指定的字符实现左填充指定长度**/
SELECT
  LPAD ('殷素素', 10, '*') result;
```

###### RPAD

```sql
/**8.rpad 用指定的字符实现右填充指定长度**/
SELECT
  RPAD ('殷素素', 12, 'ab') result;
```

###### REPLACE

```sql
/**9.replace 替换**/
SELECT
  REPLACE ('hello world', 'o', 'b') AS result;
```

##### 2_数学函数

```sql
/**1.round四舍五入**/
SELECT
  ROUND (1.55);

SELECT
  ROUND (1.567, 2);

/**2.ceil向上取整**/
SELECT
  CEIL (1.05);

/**3.floor向下取整**/
SELECT
  FLOOR (1.55);

/**4.truncate截断**/
SELECT
  TRUNCATE (1.6999, 1);

/**5.mod取余**/
SELECT
  MOD (- 10, 3);
```

##### 3_日期函数

```sql
 #now 返回当前系统日期+时间
 SELECT
  NOW ();

#curdate 返回当前系统日期
 SELECT
  CURDATE ();

#curtime 返回当前系统时间
 SELECT
  CURTIME ();

#获取指定的部分：年、月、日、时分秒
 SELECT
  YEAR (NOW ()) AS 年;

SELECT
  YEAR ('1889-8-8') AS 年;

SELECT
  YEAR (hiredate) 年
FROM
  employees;

SELECT
  MONTH (NOW ()) AS 月;

SELECT
  MONTHNAME (NOW ()) AS 月;

#str_to_date:将日期格式的字符转换成指定格式的日期
 SELECT
  STR_TO_DATE ('1998-3-2', '%Y-%m-%d') AS out_put;

SELECT
  *
FROM
  employees
WHERE hiredate = STR_TO_DATE ('4-3 1992', '%m-%d %Y');

#date_format:将日期格式转换成字符
 SELECT
  DATE_FORMAT (NOW (), '%Y年%m月%d日');

SELECT
  last_name,
  DATE_FORMAT (hiredate, '%m月/%d日 %y年') 入职日期
FROM
  employees
WHERE commission_pct IS NOT NULL;
```

##### 4_

##### 5_

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

