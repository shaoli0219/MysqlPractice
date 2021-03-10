#一、字符函数
 /**1.LENGTH(str)获取str参数值的字节个数**/
SELECT
  LENGTH ('john');

SELECT
  LENGTH ('李狗蛋hahaha');

/**显示字符集**/
SHOW VARIABLES LIKE '%char%';

/**2.CONCAT拼接字符串**/
SELECT
  CONCAT (last_name, '_', first_name)
FROM
  employees;

/**3.UPPER LOWER**/
SELECT
  UPPER ('john');

SELECT
  LOWER ('JOHN');

/**将姓名变大写，名字变小写，然后拼接**/
SELECT
  CONCAT (
    UPPER (last_name),
    '_',
    LOWER (first_name)
  )
FROM
  employees;

/**4.SUBSTR截取字符串**/
SELECT
  SUBSTR ('Hello World', 4) result;

SELECT
  SUBSTR ('Hello World', 5, 3) result;

/**姓名中首字符大写，其他字符小写然后用_拼接**/
SELECT
  CONCAT (
    UPPER (SUBSTR (last_name, 1, 1)),
    '_',
    LOWER (SUBSTR (first_name, 2))
  ) result
FROM
  employees;

/**5.INSTR返回子串第一次出现的索引，找不到返回0**/
SELECT
  INSTR ('hello World', 'l') result;

/**6.TRIM去掉字符串前后空格或指定字符**/
SELECT
  LENGTH (TRIM ('     李狗蛋 ')) result;

SELECT
  TRIM (
    'a' FROM 'aaaa李狗aaaaa蛋aaaaaaaaaaaaaaaaaaaaaaa'
  ) result;

/**7.lpad 用指定的字符实现左填充指定长度**/
SELECT
  LPAD ('殷素素', 10, '*') result;

/**8.rpad 用指定的字符实现右填充指定长度**/
SELECT
  RPAD ('殷素素', 12, 'ab') result;

/**9.replace 替换**/
SELECT
  REPLACE ('hello world', 'o', 'b') AS result;

#二、数学函数
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

#三、日期函数
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

