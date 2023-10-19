-- SubConsulta para Resolver un Problema
    -- Que empleados tienen un salario mayor que el de "Abel"
SELECT
    last_name
    ,salary
FROM
    employees
WHERE
    salary > 
        (SELECT salary 
        FROM employees
        WHERE last_name = 'Abel')
;

-- SubConsulta de una fila
SELECT
    employee_id
    ,job_id
    ,salary
FROM
    employees
WHERE
    job_id = 
        (SELECT job_id
        FROM employees
        WHERE employee_id = 141)
;
--------
SELECT
    employee_id
    ,job_id
    ,salary
FROM
    employees
WHERE
    job_id = 
        (SELECT job_id
        FROM employees
        WHERE employee_id = 141)
    AND salary > 
        (SELECT salary
        FROM employees
        WHERE employee_id = 143)
;

-- SubConsulta de una Fila y Funciones de Grupo
SELECT
    employee_id
    ,salary
FROM
    employees
WHERE
    salary = 
        (SELECT MAX(salary)
        FROM employees)
;
--------
SELECT
    department_id
    ,MIN(salary)
FROM
    employees
GROUP BY
    department_id
HAVING MIN(salary) >
        (SELECT MIN(salary)
        FROM employees
        WHERE department_id = 80)
ORDER BY
    MIN(salary)
;

-- SubConsulta de Multiples Filas
SELECT
    employee_id
    ,job_id
    ,salary
FROM
    employees
WHERE
    salary IN
        (SELECT MIN(salary)
        FROM employees  
        GROUP BY department_id)
;
--------
SELECT
    employee_id
    ,job_id
    ,salary
FROM
    employees
WHERE
    salary < ANY
        (SELECT DISTINCT salary
        FROM employees
        WHERE job_id = 'IT_PROG')
    AND
        job_id <> 'IT_PROG'
ORDER BY
    employee_id
;
--------
SELECT 
    employee_id
    ,job_id
    ,salary
FROM 
    employees
WHERE 
    salary < ALL    
        (SELECT DISTINCT salary
        FROM employees
        WHERE job_id = 'IT_PROG')
    AND 
        job_id <> 'IT_PROG'
ORDER BY employee_id
;
--------
SELECT
    department_id
    ,department_name
FROM
    departments dep
WHERE 
    EXISTS
        (SELECT department_id
        FROM employees emp
        WHERE dep.department_id = emp.department_id)
ORDER BY
    department_name
;
--------
SELECT
    department_id
    ,department_name
FROM
    departments dep
WHERE
    EXISTS
        (SELECT department_id
        FROM employees emp
        WHERE employee_id = 100)
ORDER BY
    department_id
;

-- SubConsulta en la Clausula SELECT
SELECT
    dep.department_name
    ,(SELECT
        COUNT(emp.employee_id)
    FROM
        employees emp
    WHERE
        emp.department_id = dep.department_id) "TOTAL EMPLEADOS"
FROM
    departments dep
ORDER BY
    dep.department_name
;

-- SubConsulta en la Clausula FROM
SELECT
    dep.id_depto
    ,dep.total_empleados
FROM
    (SELECT
        department_id AS id_depto
        ,COUNT(employee_id) AS total_empleados
    FROM
        employees
    GROUP BY
        department_id
    HAVING 
        COUNT(employee_id) > 3) dep
ORDER BY
    dep.id_depto
;
--------
SELECT
    dep.department_name AS "NOMBRE DEPARTAMENTO" 
    emp.total_emp AS "TOTAL EMPLEADOS"
    loc.city AS "CIUDAD"
FROM 
    departments dep 
        JOIN (SELECT e.department_id, 
        COUNT(e.employee_id) AS total_emp
        FROM employees e 
        GROUP BY e.department_id
        HAVING COUNT(e.employee_id) > 5) emp
            ON(dep.department_id = emp.department_id)
    JOIN locations loc
        ON(dep.location_id = loc.location_id)
ORDER BY
    "TOTAL EMPLEADOS" DESC, dep.department_name
;
