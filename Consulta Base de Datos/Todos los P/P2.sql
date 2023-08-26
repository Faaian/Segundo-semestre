-- Caso 1
-- informe 1

SELECT
    to_char(fecha_entrega_propiedad, 'dd-mm-yyyy') AS "Fecha_entrega_propiedad"
FROM propiedad
WHERE
    EXTRACT (YEAR FROM fecha_entrega_propiedad) = 2023
ORDER BY EXTRACT(MONTH FROM fecha_entrega_propiedad) ASC
;

-- informe 2

SELECt
    to_char(fecini_arriendo, 'dd/mm/yyyy') AS "FECHA INICIO ARRIENDO"
FROM propiedad_arrendada
WHERE
    EXTRACT (YEAR FROM fecini_arriendo) = 2023
ORDER BY EXTRACT(MONTH FROM fecini_arriendo) ASC
;

--Caso 2

SELECT
    numrut_cli || '-' || dvrut_cli AS "Rut Cliente",
    nombre_cli || ' ' || appaterno_cli || ' ' || apmaterno_cli AS "Nombre Cliente",
    renta_cli AS "Renta",
    fonofijo_cli AS "Telefono fijo",
    celular_cli AS "Celular"
FROM cliente
WHERE
    id_estcivil IN (3,4) AND
    renta_cli >=800000 OR id_estcivil = 1
ORDER BY appaterno_cli ASC, nombre_cli DESC
;

--Caso 3
--Informe 1

SELECT
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre Empleado",
    sueldo_emp AS "Sueldo Actual",
    sueldo_emp * 1.085 AS "Sueldo Reajustado",
    sueldo_emp * 1.085 - sueldo_emp AS "Aumento"
FROM empleado
ORDER BY sueldo_emp * 1.085 - sueldo_emp DESC
;

--Informe 2

SELECT
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre Empleado",
    sueldo_emp AS "Sueldo Actual",
    sueldo_emp * 1.20 AS "Sueldo Reajustado",
    sueldo_emp * 1.20 - sueldo_emp AS "Aumento"
FROM empleado
WHERE sueldo_emp BETWEEN 200000 AND 400000
ORDER BY sueldo_emp * 1.20 - sueldo_emp DESC
;

--Caso 4

SELECT
    numrut_emp || '-' || dvrut_emp AS "RUN Empleado",
    nombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "Nombre Empleado",
    sueldo_emp AS "Salario Actual",
    sueldo_emp * 1.20 - sueldo_emp AS "Bonificacion Extra"
FROM empleado
WHERE sueldo_emp < 500000
ORDER BY appaterno_emp
;

--Caso 5
--Informe 1

SELECT
    nro_propiedad || ' '  AS "Numero Propiedad",
    TO_CHAR(fecha_entrega_propiedad, 'dd/mm/yyyy') AS "Fecha Entrega Propiedad",
    direccion_propiedad AS "Direccion",
    superficie,
    nro_dormitorios AS "Cantidad de dormitorios",
    nro_banos AS "Cantidad de baños",
    valor_arriendo AS "Valor Arriendo"
FROM propiedad
WHERE 
    EXTRACT(YEAR FROM fecha_entrega_propiedad) = 2010
ORDER BY fecha_entrega_propiedad ASC
;

--Informe 2 

SELECT
    nro_propiedad || ' '  AS "Numero Propiedad",
    TO_CHAR(fecha_entrega_propiedad, 'dd-mm-yyyy') AS "Fecha Entrega Propiedad",
    direccion_propiedad AS "Direccion",
    superficie,
    nro_dormitorios AS "Cantidad de dormitorios",
    nro_banos AS "Cantidad de baños",
    valor_arriendo AS "Valor Arriendo"
FROM propiedad
WHERE 
    EXTRACT(MONTH FROM fecha_entrega_propiedad) = 02
ORDER BY fecha_entrega_propiedad ASC
;