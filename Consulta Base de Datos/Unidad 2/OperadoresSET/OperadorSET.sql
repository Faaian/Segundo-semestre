------ Tablas
CREATE TABLE emp_sal_12000
AS SELECT employee_id, first_name, last_name, 
                    salary, department_id
     FROM employees
    WHERE salary > 12000;
------   
CREATE TABLE emp_depto_90
AS SELECT employee_id, first_name, last_name, 
                   salary, department_id 
      FROM employees
    WHERE department_id = 90;
------
CREATE TABLE emp_depto_100
AS SELECT employee_id, first_name, last_name, 
                   salary, department_id 
      FROM employees
    WHERE department_id = 100;
------
    -- Operador UNION
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_sal_12000
UNION
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_90
;
------
SELECT
    employee_id
    ,salary
FROM
    emp_depto_100
UNION
SELECT
    employee_id AS "ID_EMPLEADO"
    ,salary AS "SALARIO"
FROM
    emp_sal_12000
;
------
SELECT
    employee_id
    ,first_name||' '||last_name AS "NOMBRE EMPLEADO"
FROM
    emp_sal_12000
UNION
SELECT
    employee_id
    ,first_name||' '||last_name AS "NOMBRE"
FROM
    emp_depto_90
UNION
SELECT
    employee_id
    ,first_name||' '||last_name AS "EMPLEADO"
FROM
    emp_depto_100
;
------
    -- Operador UNION ALL
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_sal_12000
UNION ALL
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_90
;
------
SELECT
    employee_id
    ,salary
FROM
    emp_depto_100
UNION ALL
SELECT
    employee_id AS "ID_EMPLEADO"
    ,salary AS "SALARIO"
FROM
    emp_sal_12000
;
------
    -- Operador INTERSECT
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_sal_12000
INTERSECT
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_90
;
------
    -- Operador MINUS
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_sal_12000
MINUS
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_90
;
------
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_sal_12000
MINUS
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_90
MINUS
SELECT
    employee_id
    ,salary
    ,department_id
FROM
    emp_depto_100
;
------
    -- Combinando Operadores SET
SELECT employee_id
FROM employees
WHERE salary > 10000
    MINUS
SELECT employee_id
FROM job_history
    INTERSECT
SELECT employee_id
FROM employees
WHERE salary >=
            (SELECT MAX(salary)
            FROM employees)
;