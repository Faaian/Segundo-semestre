-- Usando SAVEPOINT
----
DELETE FROM employees
WHERE department_id IS NULL;
SAVEPOINT A;
UPDATE employees
SET salary = salary * 1.50;
SAVEPOINT B;
DELETE FROM employees
WHERE manager_id IS NULL;
ROLLBACK TO B;
COMMIT;
----
DELETE FROM employees
WHERE department_id IS NULL;
SAVEPOINT A;
UPDATE employees
SET salary = salary * 1.50;
SAVEPOINT B;
DELETE FROM employees
WHERE manager_id IS NULL;
TRUNCATE TABLE job_history;
ROLLBACK B;
COMMIT;

-- Agregando nuevas filas a una tabla
----
-- Implicitamente
INSERT INTO departments(department_id, department_name)
VALUES(300,'Purchasing');
-- Explicitamente
INSERT INTO departments
VALUES(301,'Finance',NULL,NULL);

-- Agregando filas con valores especiales
INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, 
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(300, 'Louis', 'Hamilton', 'LHAMILTON', '512.124.4467', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 100);
COMMIT;
----
INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, 
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(301, 'Michael', 'Santana', USER, '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 100);
ROLLBACK;

-- Agregando filas con valor obtenido por SUBCONSULTA
INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, 
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(303, 'Juan', 'Soto', 'JSOTO', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900
, NULL, 205, (SELECT department_id FROM employees WHERE employee_id=100));
----
INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, 
hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(304, 'Rosa', 'Garrido', 'RGARRIDO', '245.412.4567', SYSDATE, 'AC_ACCOUNT',
(SELECT MAX(salary) FROM employees), NULL, 205, (SELECT department_id FROM employees WHERE employee_id=100));

-- Creacion de tablas
CREATE TABLE TABLA_PRUEBA1
(ID NUMBER(10) GENERATED ALWAYS AS IDENTITY MINVALUE 1
MAXVALUE 9999999999
INCREMENT BY 1 START WITH 1,
NOMBRE_DEPTO VARCHAR(30) NOT NULL,
TOTAL_EMPLEADOS NUMBER(4)
);
----
CREATE TABLE TABLA_PRUEBA2
(ID NUMBER(10) GENERATED ALWAYS AS IDENTITY MINVALUE 10
MAXVALUE 9999999999
INCREMENT BY 10 START WITH 10,
NOMBRE_DEPTO VARCHAR2(30) NOT NULL,
TOTAL_EMPLEADOS NUMBER(4));

-- Agregando multiples filas en diferentes tablas
INSERT ALL
    INTO TABLA_PRUEBA1(NOMBRE_DEPTO,TOTAL_EMPLEADOS)
        VALUES(department_name,total_emp)
    INTO TABLA_PRUEBA2(NOMBRE_DEPTO,TOTAL_EMPLEADOS)
        VALUES(department_name,total_emp)
SELECT 
    d.department_name
    ,COUNT(e.employee_id) AS total_emp
FROM
    departments d LEFT JOIN employees e
        ON d.department_id = e.department_id
GROUP BY
    d.department_name
ORDER BY
    d.department_name
;

-- Creacion de tablas
CREATE TABLE DEPTOS_SIN_EMPLEADOS
(ID NUMBER(10) GENERATED ALWAYS AS IDENTITY MINVALUE 1
MAXVALUE 9999999999
INCREMENT BY 1 START WITH 1,
NOMBRE_DEPTO VARCHAR2(30) NOT NULL);

CREATE TABLE DEPTOS_CON_EMPLEADOS
(ID NUMBER(10) GENERATED ALWAYS AS IDENTITY MINVALUE 10
MAXVALUE 9999999999
INCREMENT BY 10 START WITH 10,
NOMBRE_DEPTO VARCHAR2(30) NOT NULL,
TOTAL_EMPLEADOS NUMBER(4));

-- Agregando multiples filas en diferentes tablas
INSERT ALL
    WHEN total_emp = 0 THEN
        INTO DEPTOS_SIN_EMPLEADOS(NOMBRE_DEPTO) VALUES(department_name)
    ELSE
        INTO DEPTOS_CON_EMPLEADOS(NOMBRE_DEPTO,TOTAL_EMPLEADOS)
            VALUES(department_name, total_emp)
SELECT
    d.department_name
    ,COUNT(e.employee_id) AS total_emp
FROM
    departments d LEFT JOIN employees e
        ON d.department_id = e.department_id
GROUP BY
    d.department_name
ORDER BY
    d.department_name
;

-- Modificando datos de las tablas
UPDATE employees
    SET salary = CASE
                    WHEN EXTRACT(YEAR FROM hire_date)=2004 THEN ROUND(salary/1.15)
                    WHEN EXTRACT(YEAR FROM hire_date)=2005 THEN ROUND(salary*1.13)
                    ELSE ROUND(salary*1.105)
                END
WHERE manager_id IN(145, 147);
----
UPDATE employees
    SET salary = (SELECT ROUND(AVG(salary))
                FROM employees)
WHERE salary = (SELECT MIN(salary)
                FROM employees)
;

-- Eliminar filas de una tabla
DELETE FROM departments
WHERE department_id IN(30,40);
----
DELETE employees
WHERE salary BETWEEN 2000 AND 5000;
----
DELETE departments
WHERE department_id NOT IN(SELECT DISTINCT department_id 
                            FROM employees);

-- Usando subconsultas para insertar filas
INSERT INTO empleado_resp(codigo, apellido, salario, porc_comision)
SELECT
    employee_id
    ,last_name
    ,salary
    ,commission_pct
FROM
    employees
WHERE
    job_id LIKE '%REP%'
;
----
INSERT INTO copia_emp
SELECT
    *
FROM
    employees
;
----
INSERT INTO emp_minus
SELECT
    e.employee_id
    ,e.first_name||' '||e.last_name
    ,e.department_id
    ,d.department_name
    ,e.job_id
    ,j.job_title
FROM
    employees e JOIN departments d
        ON e.department_id = d.department_id
    JOIN jobs j ON e.job_id = j.job_id
MINUS
SELECT
    e.employee_id
    ,e.first_name||' '||e.last_name
    ,e.department_id
    ,d.department_name
    ,e.job_id
    ,j.job_title
FROM
    employees e JOIN departments d
        ON e.department_id = d.department_id
    JOIN jobs j ON e.job_id = j.job_id
WHERE
    salary < ALL 
            (SELECT ROUND(AVG(salary))
            FROM employees
            GROUP BY department_id)
;

-- Uso de sentencia TRUNCATE para todas las filas
TRUNCATE TABLE employees;

-- Usando SUBCONSULTA para actualizar DATOS
UPDATE employees
    SET job_id = (SELECT job_id
                 FROM employees
                 WHERE employee_id=205),
        salary = (SELECT salary
                 FROM employees
                 WHERE employee_id=205)
WHERE employee_id = 114;
----
UPDATE employees
    SET salary = (SELECT ROUND(AVG(salary))
                 FROM employees)
WHERE salary = (SELECT MIN(salary)
                FROM employees);
----
UPDATE employees
    SET salary = ROUND(salary*1.0125)
WHERE department_id IN (SELECT DISTINCT department_id
                        FROM employees
                        WHERE salary < (SELECT ROUND(AVG(salary))
                                        FROM employees))
;

-- Usando SUBCONSULTA para eliminar filas
DELETE FROM employees
WHERE salary = (SELECT ROUND(AVG(salary))
                FROM employees);
----
DELETE FROM employee_copia
WHERE department_id IN (SELECT department_id
                        FROM employees
                        HAVING COUNT(employee_id)>10
                        GROUP BY department_id);