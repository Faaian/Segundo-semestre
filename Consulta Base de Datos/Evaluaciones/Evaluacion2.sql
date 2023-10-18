-- Caso 1
SELECT
    m.pnombre AS "NOMBRE"
    ,m.apaterno AS "APELLIDO"
    ,c.nombre AS "CARGO"
FROM
    medico m
        JOIN cargo c
            ON m.car_id = c.car_id
ORDER BY
    m.apaterno
;

-- Caso 2
SELECT
    at.ate_id
    ,TO_CHAR(at.costo,'FML00g000') AS "COSTO"
    ,TO_CHAR(at.fecha_atencion,'Day dd Month yyyy') AS "FECHA ATENCION"
FROM
    atencion at
WHERE
    TO_CHAR(at.fecha_atencion,'mmyyyy') = '112022'
ORDER BY
    at.costo
;

-- Caso 3
SELECT
    TO_CHAR(m.med_run,'999g999g999')||'-'||m.dv_run AS "RUT"
    ,INITCAP(m.pnombre||' '||m.apaterno||' '||SUBSTR(m.amaterno,1,1)) AS "NOMBRE"
    ,EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM m.fecha_contrato)  AS "AÑOS CONTRATADOS"
    ,TO_CHAR(m.sueldo_base,'L9g999g999') AS "SUELDO BASE"
    ,TO_CHAR(
    CASE 
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM m.fecha_contrato) <= 5 THEN m.sueldo_base * 10 / 100
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM m.fecha_contrato) BETWEEN 6 AND 9 THEN m.sueldo_base * 15 / 100
        WHEN EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM m.fecha_contrato) >= 10 THEN m.sueldo_base * 20 / 100
    END,'L999g999g999') 
        AS "BONO"
FROM
    medico m
ORDER BY
    m.apaterno
FETCH FIRST 10 ROWS ONLY
;

-- Caso 4
SELECT
    u.nombre
    ,COUNT(*) AS "CANTIDAD"
    ,TO_CHAR(ROUND(AVG(m.sueldo_base)),'L9G999G999') AS "SUELDO PROMEDIO"
    ,j.pnombre||' '||j.apaterno AS "DOCTOR EN JEFE"
FROM
    unidad u
        JOIN medico m
            ON u.uni_id = m.uni_id
        JOIN medico j
            ON u.jefe_unidad = j.med_run
GROUP BY
    u.nombre, j.pnombre, j.apaterno
ORDER BY
    COUNT(*)
;

-- Caso 5
SELECT 
    paciente.pnombre
    ,paciente.apaterno
    ,TRUNC((SYSDATE-paciente.fecha_nacimiento)/365) AS EDAD
	,COUNT(atencion.ate_id) AS "ATENCIONES"
    ,SUM(atencion.costo) AS "COSTO"
    ,pd.porcentaje_descto AS "PORCENTAJE DESCUENTO"
    ,TRUNC(SUM(atencion.costo) * pd.porcentaje_descto / 100) AS "DESCUENTO"
FROM paciente
    JOIN atencion 
        ON paciente.pac_run = atencion.pac_run
    JOIN porc_descto_3ra_edad pd 
        ON TRUNC((SYSDATE-paciente.fecha_nacimiento)/365) BETWEEN pd.anno_ini AND pd.anno_ter
WHERE TRUNC((SYSDATE-paciente.fecha_nacimiento)/365) >= 65
GROUP BY
    paciente.pnombre
    ,paciente.apaterno
    ,TRUNC((SYSDATE-paciente.fecha_nacimiento)/365)
    ,pd.porcentaje_descto
--
ORDER BY paciente.apaterno
FETCH FIRST 10 ROWS ONLY
;