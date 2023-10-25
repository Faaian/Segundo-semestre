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
    LOWER(esp.nombre) AS "ESPECIALIDAD"
    ,TO_CHAR(med.med_run,'00g000g000')||'-'||med.dv_run AS "RUT"
    ,UPPER(med.pnombre||' '||med.snombre||' '||med.apaterno||' '||med.amaterno) AS "MEDICO"
FROM
    especialidad esp JOIN especialidad_medico esp_med
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
    COUNT(at.ate_id) < 10
ORDER BY
    esp.nombre
    ,med.apaterno
;

-- Caso 3
SELECT
    unidad AS "ESPECIALIDAD"
    ,medico
    ,fono AS "TELEFONO"
    ,correo_medico
    ,atenciones_medicas
FROM
    (SELECT DISTINCT
    med.apaterno AS apellido
    ,uni.nombre AS unidad
    ,med.pnombre||' '||med.snombre||' '||med.apaterno||' '||med.amaterno AS medico
    ,med.telefono AS fono
    ,SUBSTR(uni.nombre,1,2)||SUBSTR(med.apaterno,-3,2)
    ||SUBSTR(med.telefono,-3,3)||TO_CHAR(med.fecha_contrato,'ddmm')
    ||'@medicocktk.cl' AS correo_medico
    ,(SELECT COUNT(at.ate_id)
    FROM atencion at
    WHERE esp_med.med_run = at.med_run
    AND TO_CHAR(at.fecha_atencion,'yyyy')=EXTRACT(YEAR FROM SYSDATE)-1) AS atenciones_medicas
FROM
    unidad uni JOIN medico med
        ON uni.uni_id = med.uni_id
    JOIN especialidad_medico esp_med
        ON med.med_run = esp_med.med_run)
ORDER BY
     1, apellido
;

-- Caso 4
    -- Informe 1
SELECT
   año_mes AS "AÑO Y MES"
   ,total AS "TOTAL DE ATENCIONES"
   ,valor AS "VALOR TOTAL DE LAS ATENCIONES"
FROM
    (SELECT
        TO_CHAR(SYSDATE,'yyyy') AS año
        ,TO_CHAR(fecha_atencion,'yyyy/mm') AS año_mes
        ,COUNT(ate_id) AS total
        ,TO_CHAR(SUM(costo),'L999g999g999') AS valor
    FROM
        atencion
    GROUP BY
        TO_CHAR(SYSDATE,'yyyy')
        ,TO_CHAR(fecha_atencion,'yyyy/mm')
    HAVING 
        COUNT(ate_id) >= 
            (SELECT TRUNC(AVG(COUNT(ate_id)))
            FROM atencion
            GROUP BY TO_CHAR(fecha_atencion,'yyyy/mm')
            ))
WHERE
     año IN (año, año - 1, año - 2)
ORDER BY
    1
;

    -- Informe 2
SELECT
    rut AS "RUT PACIENTE"
    ,nombre AS "NOMBRE PACIENTE"
    ,atencion AS "ID ATENCION"
    ,vencimiento AS "FECHA VENCIMIENTO PAGO"
    ,pago AS "FECHA PAGO"
    ,atraso AS "DIAS MOROSIDAD"
    ,TO_CHAR(atraso*2000,'L999g999') AS "VALOR MULTA"
FROM
    (SELECT
        TO_CHAR(p.pac_run,'00g000g000')||'-'||p.dv_run AS rut
        ,p.pnombre||' '||p.snombre||' '||p.apaterno||' '||p.amaterno AS nombre
        ,at.ate_id AS atencion
        ,TO_CHAR(pago.fecha_venc_pago,'dd/mm/yyyy') AS vencimiento
        ,pago.fecha_venc_pago AS fecha_pago
        ,TO_CHAR(SYSDATE,'yyyy') AS año
        ,TO_CHAR(pago.fecha_pago,'dd/mm/yyyy') AS pago
        ,pago.dias_morosidad AS morosidad
        ,TRUNC(pago.fecha_pago - pago.fecha_venc_pago) AS atraso 
    FROM 
        paciente p JOIN atencion at
            ON p.pac_run = at.pac_run
        JOIN pago_atencion pago
            ON at.ate_id = pago.ate_id)
WHERE
    año IN (año, año - 1, año - 2)
        AND
    atraso > 
            (SELECT
                AVG(venc)
            FROM
                (SELECT TRUNC(fecha_pago-fecha_venc_pago) AS venc
                FROM pago_atencion
                GROUP BY TO_CHAR(fecha_pago,'YYYY'), TRUNC(fecha_pago-fecha_venc_pago)))
ORDER BY
    fecha_pago ASC
    ,atraso DESC
;

-- Caso 5
SELECT
    run AS "RUN MEDICO"
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
ORDER BY
    run
    ,apaterno
;