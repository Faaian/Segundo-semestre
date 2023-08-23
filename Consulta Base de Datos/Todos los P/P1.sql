
--CASO 1
SELECT
    'El empleado ' || nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp || ' Nacio el ' || fecnac_emp AS "Listado de cumpleaños"
FROM empleado
ORDER BY fecnac_emp ASC, appaterno_emp
;

--CASO 2
   
SELECT
    numrut_cli AS "Numero Rut",
    dvrut_cli AS "Digito Verificador",
    appaterno_cli || ' ' || apmaterno_cli || ' ' || nombre_cli AS "Nombre Cliente",
    renta_cli,
    fonofijo_cli AS "Telefono fijo",
    celular_cli AS "Celular"
FROM cliente
ORDER BY appaterno_cli, apmaterno_cli
;

--CASO 3

SELECT
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre Empleado",
    sueldo_emp AS "Sueldo",
    sueldo_emp - (sueldo_emp / 2) AS "Bono Por Capacitacion"
FROM empleado
ORDER BY sueldo_emp - (sueldo_emp / 2) DESC
;

--CASO 4

SELECT
    nro_propiedad AS "Numero Propiedad",
    numrut_prop AS "Rut Propietario",
    direccion_propiedad AS "Direccion",
    valor_arriendo AS "Valor arriendo",
    valor_arriendo * 0.054 AS "Valor compensasion"
FROM propiedad
ORDER BY numrut_prop ASC
;

--CASO 5

SELECT
    numrut_emp || ' - ' || dvrut_emp AS "Rut empleado",
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre empleado",
    sueldo_emp AS "Salario Actual",
    sueldo_emp + (sueldo_emp * 0.13) AS "Sueldo Reajustado",
    sueldo_emp * 0.13 AS "Reajuste"
FROM empleado
ORDER BY sueldo_emp + (sueldo_emp * 0.13) DESC, appaterno_emp
;

--CASO 6

SELECT
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre empleado",
    sueldo_emp AS "Salario",
    sueldo_emp * 0.055 AS "Colacion",
    sueldo_emp * 0.178 AS "Movilizacion",
    sueldo_emp * 0.078 AS "Salud",
    sueldo_emp * 0.065 AS "AFP",
    sueldo_emp + (sueldo_emp * 0.055) + (sueldo_emp * 0.178) - (sueldo_emp * 0.078) - (sueldo_emp * 0.065) AS "Alcance liquido"
FROM empleado
ORDER BY appaterno_emp ASC
;