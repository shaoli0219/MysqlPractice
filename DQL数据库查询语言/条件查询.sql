/**1查询工资大于12000的员工信息**/
SELECT
  *
FROM
  employees
WHERE salary > 12000;

/**2查询部门编号不等于90的员工的姓名和部门编号**/
SELECT
  last_name,
  department_id
FROM
  employees
WHERE department_id <> 90;

/**3查询工资在10000到20000之间的员工名、工资及奖金**/
SELECT
  last_name,
  salary,
  commission_pct
FROM
  employees
WHERE salary > 10000
  AND salary < 20000;

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

/**5查询员工姓名中包涵字符a的员工信息**/
SELECT
  *
FROM
  employees
WHERE last_name LIKE "%a%";

/**6查询员工姓名中第三个字符为n第五个字符为l员工**/
SELECT
  last_name,
  salary
FROM
  employees
WHERE last_name LIKE "__n_l%";

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

/**13查询编号为176的员工的姓名、部门号和年薪**/
SELECT
  last_name,
  department_id,
  salary * 12 * (1+ IFNULL (commission_pct, 0)) AS 年薪
FROM
  employees
WHERE employee_id = 176;

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

/**15查询部门编号>=90的员工信息，安入职时间的先后顺序**/
SELECT
  *
FROM
  employees
WHERE department_id >= 90
ORDER BY hiredate ASC;

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

/**17按姓名长度显示员工姓名和工资**/
SELECT
  last_name,
  LENGTH (last_name) 姓名长度,
  salary
FROM
  employees
ORDER BY 姓名长度 DESC;

/**18查询员工信息，先按工资升序，再按员工编号降序**/
SELECT
  *
FROM
  employees
ORDER BY salary ASC,
  employee_id DESC;

