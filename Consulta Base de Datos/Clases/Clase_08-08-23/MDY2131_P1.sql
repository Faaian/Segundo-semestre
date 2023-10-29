-- Seleccionar todo
SELECT * FROM empleado;


-- Renombrar columnas con AS
SELECT
    nombre_emp AS "Nombre",
    appaterno_emp AS "Apellido Paterno",
    apmaterno_emp AS "Apellido Materno"
FROM empleado;

-- Operadores aritmeticos
SELECT
    sueldo_emp,
    sueldo_emp - (sueldo_emp * 0.10) AS "Sueldo menos 10%" 
FROM empleado;

-- Concatenar y ordenar datos
SELECT
  'El empleado '  || nombre_emp ||' '|| appaterno_emp ||' '|| apmaterno_emp 
  || ' Tiene un sueldo de ' || sueldo_emp
  AS "Empleado"
FROM empleado
ORDER BY nombre_emp DESC, appaterno_emp ASC;