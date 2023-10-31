-- Caso 1
    -- Informe 1
SELECT
    rut_cliente
    ,nombre
    ,arriendos AS "ARRIENDOS EFECTUADOS"
    ,total AS "TOTAL GASTADO"
FROM
    (SELECT
        cl.numrun_cli||'-'||cl.dvrun_cli AS rut_cliente
        ,pnombre_cli||' '||appaterno_cli AS nombre
        ,(SELECT COUNT(id_arriendo)
        FROM arriendo_camion arr
        WHERE cl.numrun_cli = arr.numrun_cli) AS arriendos
        ,(SELECT TO_CHAR(SUM(ca.valor_arriendo_dia * arr.dias_solicitados),'L999g999g999')
        FROM arriendo_camion arr
        JOIN camion ca ON arr.nro_patente = ca.nro_patente
        WHERE cl.numrun_cli = arr.numrun_cli) AS total
    FROM cliente cl)
WHERE
    arriendos > 0
ORDER BY
    total DESC
;
    -- Informe 2
SELECT
    rut_cliente
    ,nombre
    ,arriendos AS "ARRIENDOS EFECTUADOS"
    ,total AS "TOTAL GASTADO"
FROM
    (SELECT
        cl.numrun_cli||'-'||cl.dvrun_cli AS rut_cliente
        ,pnombre_cli||' '||appaterno_cli AS nombre
        ,(SELECT COUNT(id_arriendo)
        FROM arriendo_camion arr
        WHERE cl.numrun_cli = arr.numrun_cli) AS arriendos
        ,(SELECT TO_CHAR(SUM(ca.valor_arriendo_dia * arr.dias_solicitados),'L999g999g999')
        FROM arriendo_camion arr
        JOIN camion ca ON arr.nro_patente = ca.nro_patente
        WHERE cl.numrun_cli = arr.numrun_cli) AS total
        ,(SELECT SUM(ca.valor_arriendo_dia * arr.dias_solicitados)
        FROM arriendo_camion arr
        JOIN camion ca ON arr.nro_patente = ca.nro_patente
        WHERE cl.numrun_cli = arr.numrun_cli) AS numero
    FROM cliente cl)
WHERE
    numero < 
            (SELECT AVG(SUM(ca.valor_arriendo_dia * arr.dias_solicitados))
            FROM arriendo_camion arr
            JOIN camion ca ON arr.nro_patente = ca.nro_patente
            GROUP BY arr.numrun_cli)
ORDER BY
    total DESC
;

-- Caso 2
SELECT
    numrun_emp||'-'||dvrun_emp AS rut
    ,pnombre_emp||' '||appaterno_emp AS nombre
    ,TRUNC((SYSDATE - fecha_nac)/365) AS edad
FROM    
    empleado
WHERE
    id_estado_civil = 10
        AND
    TRUNC((SYSDATE - fecha_nac)/365) < 50
UNION
SELECT
    numrun_cli||'-'||dvrun_cli AS rut
    ,pnombre_cli||' '||appaterno_cli AS nombre
    ,TRUNC((SYSDATE - fecha_nac_cli)/365) AS edad
FROM    
    cliente
WHERE
    id_estado_civil = 10
        AND
    TRUNC((SYSDATE - fecha_nac_cli)/365) < 50
;

-- Caso 3
SELECT
    COUNT(arr.id_arriendo) AS "TOTAL ARRIENDOS"
    ,emp.numrun_emp||'-'||emp.dvrun_emp AS "RUT_EMPLEADO"
    ,emp.pnombre_emp||' '||emp.appaterno_emp AS "NOMBRE"
    ,TO_CHAR(emp.sueldo_base,'FML999g999g999') AS "SUELDO_BASE"
    ,TO_CHAR(TRUNC((emp.sueldo_base*COUNT(arr.id_arriendo))/100),'L999g999') AS "BONO"
    ,TO_CHAR(TRUNC(emp.sueldo_base + (emp.sueldo_base*COUNT(arr.id_arriendo))/100),'FML999g999g999') AS "SUELDO_FINAL"
FROM
    empleado emp JOIN camion ca
        ON emp.numrun_emp = ca.numrun_emp
    JOIN arriendo_camion arr ON ca.nro_patente = arr.nro_patente
        AND TO_CHAR(arr.fecha_ini_arriendo,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    emp.numrun_emp,emp.dvrun_emp
    ,emp.pnombre_emp
    ,emp.appaterno_emp,emp.sueldo_base
ORDER BY
    1
;

-- Caso 4
SELECT
    ca.nro_patente
    ,COUNT(arr.id_arriendo) AS "TOTAL_ARRIENDOS"
    ,e.numrun_emp||'-'||e.dvrun_emp AS "RUT_EMPLEADO"
    ,e.pnombre_emp||' '||e.appaterno_emp AS "NOMBRE_EMPLEADO"
FROM
    empleado e JOIN camion ca
        ON e.numrun_emp = ca.numrun_emp
    LEFT JOIN arriendo_camion arr ON ca.nro_patente = arr.nro_patente
        AND TO_CHAR(arr.fecha_ini_arriendo,'mm') = 03
        AND EXTRACT(YEAR FROM arr.fecha_ini_arriendo) = TO_CHAR(SYSDATE,'yyyy') - 1
GROUP BY
    ca.nro_patente,e.pnombre_emp
    ,e.appaterno_emp,e.numrun_emp
    ,e.dvrun_emp
ORDER BY
    2 DESC
;