SELECT
    nombre_emp,
    appaterno_emp
FROM empleado
WHERE
    nombre_emp LIKE '%C%'
;

SELECT
    fecini_arriendo,
    --EXTRACT(DAY FROM fecini_arriendo),
    --EXTRACT(MONTH FROM fecini_arriendo),
    --EXTRACT(YEAR FROM fecini_arriendo) AS "A�O",
    TO_CHAR(fecini_arriendo, 'dd/mm/yyyy') AS "FECHA INCIO ARRIENDO"
    --SYSDATE
FROM propiedad_arrendada
WHERE
    --EXTRACT(YEAR FROM fecini_arriendo) = EXTRACT(YEAR FROM SYSDATE)
    EXTRACT(YEAR FROM fecini_arriendo) = 2023
;

SELECT
    fecini_arriendo
FROM propiedad_arrendada
--WHERE
    --EXTRACT (YEAR FROM fecini_arriendo) = 19
;