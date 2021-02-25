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

