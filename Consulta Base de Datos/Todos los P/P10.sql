INSERT INTO bonif_arriendos_mensual
SELECT
    TO_CHAR(ar.fecha_ini_arriendo,'yyyymm') AS "anno_mes"
    ,e.numrun_emp
    ,e.pnombre_emp||' '||e.snombre_emp||' '||e.appaterno_emp||' '||e.apmaterno_emp AS "nombre_empleado"
    ,e.sueldo_base
    ,COUNT(ar.id_arriendo) AS "total_arriendos_mensual"
    ,TRUNC(e.sueldo_base * COUNT(ar.id_arriendo)/100) AS "bonif_por_arriendos"
FROM
    empleado e JOIN camion c
        ON e.numrun_emp = c.numrun_emp
    JOIN arriendo_camion ar ON c.nro_patente = ar.nro_patente
WHERE 
    TO_CHAR(ar.fecha_ini_arriendo,'mm') = EXTRACT(MONTH FROM SYSDATE) - 1
    and TO_CHAR(ar.fecha_ini_arriendo,'yyyy') = EXTRACT(YEAR FROM SYSDATE)
GROUP BY
    TO_CHAR(ar.fecha_ini_arriendo,'yyyymm'),
    e.numrun_emp,e.pnombre_emp,e.snombre_emp
    ,e.appaterno_emp,e.apmaterno_emp,e.sueldo_base
ORDER BY
    e.appaterno_emp
;
----
SELECT
    anno_mes
    ,numrun_emp
    ,nombre_empleado
    ,sueldo_base
    ,total_arriendos_mensual
    ,bonif_por_arriendos
FROM
    bonif_arriendos_mensual
;