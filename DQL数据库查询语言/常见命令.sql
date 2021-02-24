/****常用命令****/
SHOW DATABASES;

USE `myemployees`;

SHOW TABLES;

SHOW TABLES FROM TEST;

/****全选****/
SELECT
  `employee_id`,
  `first_name`,
  `last_name`,
  `email`,
  `phone_number`,
  `job_id`,
  `salary`,
  `commission_pct`,
  `manager_id`,
  `department_id`,
  `hiredate`
FROM
  employees;

SELECT
  *
FROM
  employees;

/****别名****/
SELECT
  last_name 姓,
  first_name 名
FROM
  employees;

SELECT
  last_name AS 姓,
  first_name AS 名
FROM
  employees;

SELECT
  100 * 100 AS "OUT PUT";

/****去重****/
SELECT DISTINCT
  department_id
FROM
  employees