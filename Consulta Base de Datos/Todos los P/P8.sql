-- Caso 1
 --Informe 1
SELECT
    tp.descripcion||','||sa.descripcion AS "SISTEMA_SALUD"
    ,COUNT(at.ate_id) AS "TOTAL ATENCIONES"
FROM
    tipo_salud tp JOIN salud sa
        ON tp.tipo_sal_id = sa.tipo_sal_id
    JOIN paciente p ON sa.sal_id = p.sal_id
    JOIN atencion at ON p.pac_run = at.pac_run
WHERE
    TO_CHAR(at.fecha_atencion,'mmyyyy') = 092023
        AND
    tp.tipo_sal_id IN ('F','I')
GROUP BY
    tp.descripcion, sa.descripcion
HAVING COUNT(at.ate_id) >
        (SELECT AVG(COUNT(at.ate_id))
        FROM tipo_salud tp JOIN salud sa
        ON tp.tipo_sal_id = sa.tipo_sal_id
        JOIN paciente p ON sa.sal_id = p.sal_id
        JOIN atencion at ON p.pac_run = at.pac_run
        WHERE TO_CHAR(at.fecha_atencion,'mmyyyy') = 092023
        GROUP BY tp.descripcion, sa.descripcion)
ORDER BY
    1
;

 -- Informe 2
SELECT
    p.rut AS "RUT PACIENTE"
    ,p.nombre AS "NOMBRE PACIENTE"
    ,p.edad AS "AÑOS"
    ,'Le corresponde un '||porc.porcentaje_descto||'% de descuento en la primera consulta medica del año '||p.fecha AS "PORCENTAJE DESCUENTO"
FROM
    (SELECT 
        pac_run
        ,TO_CHAR(pac_run,'00g000g000')||'-'||dv_run AS rut
        ,pnombre||' '||snombre||' '||apaterno||' '||amaterno AS nombre
        ,ROUND((SYSDATE-fecha_nacimiento)/365) AS edad
        ,EXTRACT(YEAR FROM SYSDATE) + 1 AS fecha
    FROM paciente
    WHERE ROUND((SYSDATE-fecha_nacimiento)/365) >= 65)
    p JOIN porc_descto_3ra_edad porc
        ON p.edad BETWEEN porc.anno_ini AND porc.anno_ter
    JOIN atencion at ON p.pac_run = at.pac_run
WHERE
    TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE)
GROUP BY
    p.rut,p.nombre,p.edad
    ,porc.porcentaje_descto
    ,p.fecha
HAVING 
    COUNT(at.ate_id) > 4
;

-- Caso 2
SELECT
    esp.nombre AS "ESPECIALIDAD"
    ,med.run AS "RUT"
    ,med.nombre AS "MEDICO"
FROM
    (SELECT
        med_run
        ,TO_CHAR(med_run,'00g000g000')||'-'||dv_run AS run
        ,pnombre||' '||snombre||' '||apaterno||' '||amaterno AS nombre
    FROM medico) 
    med JOIN 
        (SELECT esp_med.med_run, esp_med.esp_id, COUNT(at.ate_id) AS atenciones
        FROM especialidad_medico esp_med
        JOIN atencion at
        ON esp_med.med_run = at.med_run
        WHERE TO_CHAR(at.fecha_atencion,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
        GROUP BY esp_med.med_run, esp_med.esp_id
        HAVING COUNT(at.ate_id) < 10) esp_med
            ON med.med_run = esp_med.med_run
    JOIN especialidad esp 
        ON esp_med.esp_id = esp.esp_id
GROUP BY
    med.run
    ,med.nombre
    ,esp.nombre
ORDER BY
    1, 2
;
-- Caso 3
SELECT
    uni.nombre AS "UNIDAD"
    ,med.pnombre||' '||med.snombre||' '||med.apaterno||' '||med.amaterno AS "MEDICO"
    ,med.telefono AS "TELEFONO"
    ,SUBSTR(uni.nombre,1,2)||SUBSTR(med.apaterno,-3,2)
    ||SUBSTR(med.telefono,-3,3)||TO_CHAR(med.fecha_contrato,'ddmm')
    ||'@medicocktk.cl' AS "CORREO_MEDICO"
    ,(SELECT COUNT(at.ate_id)
    FROM atencion at
    WHERE esp_med.med_run = at.med_run
    AND TO_CHAR(at.fecha_atencion,'yyyy')=EXTRACT(YEAR FROM SYSDATE)-1) AS "ATENCIONES_MEDICAS"
FROM
    unidad uni JOIN medico med
        ON uni.uni_id = med.uni_id
    JOIN especialidad_medico esp_med
        ON med.med_run = esp_med.med_run
ORDER BY
     1, med.apaterno
;