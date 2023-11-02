-- Caso 1
    -- Informe 1
SELECT
    e.numrut_emp||'-'||e.dvrut_emp AS rut
    ,e.nombre_emp||' '||e.appaterno_emp AS nombre
    ,COUNT(p.nro_propiedad) AS "CANTIDAD_PROPIEDADES"
    ,TO_CHAR(SUM(p.valor_arriendo),'L999g999g999') AS "TOTAL_ARRIENDO"
FROM
    empleado e JOIN propiedad p
        ON e.numrut_emp = p.numrut_emp
GROUP BY
    e.numrut_emp,e.dvrut_emp
    ,e.nombre_emp,e.appaterno_emp
;

    -- Informe 2
SELECT
    e.numrut_emp||'-'||e.dvrut_emp AS rut
    ,e.nombre_emp||' '||e.appaterno_emp AS nombre
    ,COUNT(p.nro_propiedad) AS "CANTIDAD_PROPIEDADES"
    ,TO_CHAR(SUM(p.valor_arriendo),'L999g999g999') AS "TOTAL_ARRIENDO"
FROM
    empleado e JOIN propiedad p
        ON e.numrut_emp = p.numrut_emp
GROUP BY
    e.numrut_emp,e.dvrut_emp,e.nombre_emp,e.appaterno_emp
HAVING
    SUM(p.valor_arriendo) < 
                            (SELECT AVG(SUM(valor_arriendo))
                            FROM propiedad
                            GROUP BY numrut_emp)
        AND
    COUNT(p.nro_propiedad) >= 3
;

-- Caso 2
SELECT
    numrut_prop||'-'||dvrut_prop AS "RUT"
    ,nombre_prop||' '||appaterno_prop AS "NOMBRE"
FROM
    propietario
WHERE
    id_estcivil = 2
UNION
SELECT
    numrut_emp||'-'||dvrut_emp AS "RUT"
    ,nombre_emp||' '||appaterno_emp AS "NOMBRE"
FROM
    empleado
WHERE
    id_estcivil = 2
;

-- Caso 3
SELECT
    SUM(TRUNC((SYSDATE - pa.fecini_arriendo)/365)) AS "AÑOS"
    ,e.numrut_emp||'-'||e.dvrut_emp AS "RUT"
    ,e.nombre_emp||' '||e.appaterno_emp AS "NOMBRE"
    ,TO_CHAR(e.sueldo_emp,'L999g999g999') AS "SUELDO"
    ,TO_CHAR((e.sueldo_emp * SUM(TRUNC((SYSDATE - pa.fecini_arriendo)/365)))/100,'L999g999g999') AS "BONO"
FROM
    empleado e JOIN propiedad p
        ON e.numrut_emp = p.numrut_emp
    JOIN propiedad_arrendada pa ON p.nro_propiedad = pa.nro_propiedad
GROUP BY
    e.numrut_emp,e.dvrut_emp
    ,e.sueldo_emp,e.nombre_emp
    ,e.appaterno_emp
;