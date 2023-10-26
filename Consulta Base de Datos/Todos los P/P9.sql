-- Caso 1
    -- Informe 1
SELECT
    tp.descripcion||','||sa.descripcion AS "SISTEMA_SALUD"
    ,COUNT(at.ate_id) AS "TOTAL ATENCIONES"
    ,'CON Descuento' AS "CORRESPONDE DESCUENTO"
FROM
    salud sa JOIN tipo_salud tp
        ON sa.tipo_sal_id = tp.tipo_sal_id
    LEFT JOIN paciente p
        ON sa.sal_id = p.sal_id
    LEFT JOIN atencion at
        ON at.pac_run = p.pac_run
            AND TO_CHAR(at.fecha_atencion,'YYYYMM') = TO_CHAR(SYSDATE,'YYYYMM') - 1
GROUP BY
    tp.descripcion, sa.descripcion
HAVING COUNT(at.ate_id) > 0
UNION
SELECT
    tp.descripcion||','||sa.descripcion AS "SISTEMA_SALUD"
    ,COUNT(at.ate_id) AS "TOTAL ATENCIONES"
    ,'SIN Descuento' AS "CORRESPONDE DESCUENTO"
FROM
    salud sa JOIN tipo_salud tp
        ON sa.tipo_sal_id = tp.tipo_sal_id
    LEFT JOIN paciente p
        ON sa.sal_id = p.sal_id
    LEFT JOIN atencion at
        ON at.pac_run = p.pac_run
            AND TO_CHAR(at.fecha_atencion,'YYYYMM') = TO_CHAR(SYSDATE,'YYYYMM') - 1
GROUP BY
    tp.descripcion, sa.descripcion
HAVING COUNT(at.ate_id) = 0
;

    -- Informe 2
SELECT
    rut AS "RUT PACIENTE"
    ,nombre AS "NOMBRE PACIENTE"
    ,edad AS "AÑOS"
    ,'Le corresponde un '||porcentaje||'% de descuento en la primera consulta del año '||año AS "PORCENTAJE DESCUENTO"
    ,'Beneficio por tercera edad' AS "OBSERVACION"
FROM
    (SELECT
        TO_CHAR(p.pac_run,'00g000g000')||'-'||p.dv_run AS rut
        ,p.pnombre||' '||p.snombre||' '||p.apaterno||' '||p.amaterno AS nombre
        ,ROUND((SYSDATE-p.fecha_nacimiento)/365) AS edad
        ,porc.porcentaje_descto AS porcentaje
        ,(SELECT COUNT(at.ate_id)
        FROM atencion at
        WHERE p.pac_run = at.pac_run
        AND TO_CHAR(at.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) AS cantidad
        ,TO_CHAR(SYSDATE,'yyyy') + 1 AS año
    FROM
        paciente p JOIN porc_descto_3ra_edad porc
            ON ROUND((SYSDATE-p.fecha_nacimiento)/365) BETWEEN porc.anno_ini AND porc.anno_ter)
WHERE
    cantidad > 4 
        AND
    edad >= 65 
UNION
SELECT
    rut AS "RUT PACIENTE"
    ,nombre AS "NOMBRE PACIENTE"
    ,edad AS "AÑOS"
    ,'Le corresponde un 2% de descuento en la primera consulta del año '||año AS "PORCENTAJE DESCUENTO"
    ,'Beneficio por cantidad de atenciones médicas anuales' AS "OBSERVACION"
FROM
    (SELECT
        TO_CHAR(p.pac_run,'00g000g000')||'-'||p.dv_run AS rut
        ,p.pnombre||' '||p.snombre||' '||p.apaterno||' '||p.amaterno AS nombre
        ,ROUND((SYSDATE-p.fecha_nacimiento)/365) AS edad
        ,(SELECT COUNT(at.ate_id)
        FROM atencion at
        WHERE p.pac_run = at.pac_run
        AND TO_CHAR(at.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) AS cantidad
        ,TO_CHAR(SYSDATE,'yyyy') + 1 AS año
    FROM
        paciente p)
WHERE
    edad < 65
        AND
    cantidad >= 5    
;

-- Caso 2
SELECT
    LOWER(esp.nombre) AS "ESPECIALIDAD"
    ,TO_CHAR(med.med_run,'00g000g000')||'-'||med.dv_run AS "RUT"
    ,UPPER(med.apaterno||' '||med.amaterno||' '||med.pnombre||' '||med.snombre) AS "MEDICO"
FROM
    especialidad esp LEFT JOIN especialidad_medico esp_med
        ON esp.esp_id = esp_med.esp_id
    LEFT JOIN atencion at 
        ON esp_med.esp_id = at.esp_id
            AND TO_CHAR(at.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')-1
    JOIN medico med
        ON esp_med.med_run = med.med_run
GROUP BY
    esp.nombre,med.med_run,
    med.dv_run,med.pnombre
    ,med.snombre,med.apaterno
    ,med.amaterno
HAVING
    COUNT(at.ate_id) > 10
ORDER BY
    esp.nombre
    ,med.apaterno
;

-- Caso 3
SELECT
    u.nombre
    ,med.apaterno||' '||med.amaterno||' '||med.pnombre||' '||med.snombre AS "MEDICO"
    ,med.telefono
    ,SUBSTR(u.nombre,1,2)||SUBSTR(med.apaterno,-3,2)
    ||SUBSTR(med.telefono,-3,3)||TO_CHAR(med.fecha_contrato,'ddmm')
    ||'@medicocktk.cl' AS "CORREO_MEDICO"
FROM
    unidad u JOIN medico med
        ON u.uni_id = med.uni_id
    JOIN especialidad_medico esp_med ON med.med_run = esp_med.med_run
    JOIN atencion at ON esp_med.esp_id = at.esp_id
        AND TO_CHAR(at.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy') - 1
WHERE
    ROUND((SYSDATE-med.fecha_contrato)/365) > 10
GROUP BY
    u.nombre,med.pnombre,
    med.snombre,med.apaterno
    ,med.amaterno,
    med.telefono,med.fecha_contrato
HAVING COUNT(at.ate_id) < 
                        (SELECT MAX(COUNT(at.ate_id))
                        FROM especialidad_medico esp JOIN atencion at
                        ON esp.esp_id = at.esp_id
                        AND TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
                        GROUP BY esp.med_run)
ORDER BY u.nombre, med.apaterno
;

-- Caso 4
SELECT
    TO_CHAR(at.fecha_atencion,'yyyy/mm') AS "AÑO Y MES"
    ,COUNT(at.ate_id) AS "TOTAL DE ATENCIONES"
    ,TO_CHAR(SUM(at.costo),'L999g999g999') AS "VALOR TOTAL DE LAS ATENCIONES"
FROM atencion at
WHERE TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE)
GROUP BY TO_CHAR(at.fecha_atencion,'yyyy/mm')
HAVING COUNT(at.ate_id) >=
                        (SELECT AVG(COUNT(ate_id))
                        FROM atencion
                        WHERE TO_CHAR(fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE)
                        GROUP BY TO_CHAR(fecha_atencion,'mm'))                       
UNION
SELECT
    TO_CHAR(at.fecha_atencion,'yyyy/mm') AS "AÑO Y MES"
    ,COUNT(at.ate_id) AS "TOTAL DE ATENCIONES"
    ,TO_CHAR(SUM(at.costo),'L999g999g999') AS "VALOR TOTAL DE LAS ATENCIONES"
FROM atencion at
WHERE TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY TO_CHAR(at.fecha_atencion,'yyyy/mm')
HAVING COUNT(at.ate_id) >= 15
UNION
SELECT
    TO_CHAR(at.fecha_atencion,'yyyy/mm') AS "AÑO Y MES"
    ,COUNT(at.ate_id) AS "TOTAL DE ATENCIONES"
    ,TO_CHAR(SUM(at.costo),'L999g999g999') AS "VALOR TOTAL DE LAS ATENCIONES"
FROM atencion at
WHERE TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 2
GROUP BY TO_CHAR(at.fecha_atencion,'yyyy/mm')
HAVING COUNT(at.ate_id) >= 40
;

-- Caso 5
SELECT
    'MEDICO CON BONIIFICACION DEL 5% DE LAS GANANCIAS' AS "BONIFICACION GANANCIAS"
    ,run AS "RUN MEDICO"
    ,nombre AS "NOMBRE MEDICO"
    ,atenciones AS "TOTAL ATENCIONES MEDICAS"
    ,sueldo AS "SUELDO BASE"
    ,TO_CHAR(ganancias/cantidad,'L9g999g999') AS "BONIFICACION POR GANANCIAS"
    ,TO_CHAR(sueldo_base + (ganancias/cantidad),'L99g999g999') AS "SUELDO TOTAL"
FROM
    (SELECT DISTINCT
        esp_med.med_run AS esp_run
        ,apaterno
        ,TO_CHAR(med.med_run,'00g000g000')||'-'||med.dv_run AS run
        ,med.pnombre||' '||med.snombre||' '||med.apaterno||' '||med.amaterno AS nombre
        ,(SELECT COUNT(ate.ate_id)
        FROM atencion ate
        WHERE ate.med_run = esp_med.med_run
        AND TO_CHAR(ate.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) AS atenciones
        ,med.sueldo_base
        ,TO_CHAR(med.sueldo_base,'L99g999g999') AS sueldo
        ,2250000000 * 0.005 AS ganancias
        ,(SELECT COUNT(*)
        FROM (select COUNT(ate_id)
        FROM atencion
        WHERE TO_CHAR(fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')
        GROUP BY med_run
        HAVING COUNT(ate_id) > 7)) AS cantidad
    FROM
        medico med JOIN especialidad_medico esp_med
            ON med.med_run = esp_med.med_run)
WHERE
    atenciones > 7
UNION
SELECT
    'MEDICO CON BONIFICACION DE 2% DE LAS GANANCIAS'
    ,run AS "RUN MEDICO"
    ,nombre AS "NOMBRE MEDICO"
    ,atenciones AS "TOTAL ATENCIONES MEDICAS"
    ,sueldo AS "SUELDO BASE"
    ,TO_CHAR(ganancias/cantidad,'L9g999g999') AS "BONIFICACION POR GANANCIAS"
    ,TO_CHAR(sueldo_base + (ganancias/cantidad),'L99g999g999') AS "SUELDO TOTAL"
FROM
    (SELECT DISTINCT
        esp_med.med_run AS esp_run
        ,apaterno
        ,TO_CHAR(med.med_run,'00g000g000')||'-'||med.dv_run AS run
        ,med.pnombre||' '||med.snombre||' '||med.apaterno||' '||med.amaterno AS nombre
        ,(SELECT COUNT(ate.ate_id)
        FROM atencion ate
        WHERE ate.med_run = esp_med.med_run
        AND TO_CHAR(ate.fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) AS atenciones
        ,med.sueldo_base
        ,TO_CHAR(med.sueldo_base,'L99g999g999') AS sueldo
        ,2250000000 * 0.002 AS ganancias
        ,(SELECT COUNT(*)
        FROM (select COUNT(ate_id)
        FROM atencion
        WHERE TO_CHAR(fecha_atencion,'yyyy') = TO_CHAR(SYSDATE,'yyyy')
        GROUP BY med_run
        HAVING COUNT(ate_id) BETWEEN 1 AND 7)) AS cantidad
    FROM
        medico med JOIN especialidad_medico esp_med
            ON med.med_run = esp_med.med_run)
WHERE
    atenciones BETWEEN 1 AND 7
ORDER BY "RUN MEDICO"
;