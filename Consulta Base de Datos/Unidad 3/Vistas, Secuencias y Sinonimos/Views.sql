-- Creando una Vista Simple
CREATE VIEW v_emp_depto_80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

DESC v_emp_depto_80;

SELECT * FROM v_emp_depto_80
ORDER BY salary, last_name;

----
CREATE VIEW v_salarios_depto_50
AS SELECT
    employee_id ID_EMPLEADO
    ,last_name APELLIDO
    ,salary SALARIO_MENSUAL
    ,salary*12 SALARIO_ANUAL
FROM
    employees
WHERE
    department_id = 50
;

SELECT * FROM v_salarios_depto_50;

-- Creando una Vista Compleja
CREATE OR REPLACE VIEW v_dep_sum(nombre_depto, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary), MAX(e.salary), ROUND(AVG(e.salary))
FROM employees e JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT * FROM v_dep_sum
ORDER BY minsal, nombre_depto;

-- Operaciones  DML sobre una VISTA
    -- DELETE: no puede contener funciones de grupo, cláulsula GROUP BY, cláulsula DISTINCT, pseudocolumnas y expresiones
    -- UPDATE: no puede contener funciones de grupo, cláulsula GROUP BY, cláulsula DISTINCT, pseudocolumnas y expresiones
    -- INSERT: no puede contener funciones de grupo, cláulsula GROUP BY, cláulsula DISTINCT, pseudocolumnas y expresiones y todas las columnas NOT NULL de la tabla base se deben seleccionar

-- Uso de cláusula WITH CHECK OPTON
    -- Garantiza que las operaciones INSERT y UPDATE realizadas a través de la vista no pueden crear o actualizar filas que no serían seleccionadas por la propia vista
CREATE OR REPLACE  VIEW v_dept90
AS SELECT *
FROM employees
WHERE department_id = 30
WITH CHECK OPTION CONSTRAINT control_v_dept30;

-- Error
UPDATE v_dept30
SET department_id = 10
WHERE employee_id = 115;

INSERT INTO v_dept30(employee_id, firs_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(999, 'Louis', 'Popp', 'LPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 100);