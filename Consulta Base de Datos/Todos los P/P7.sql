-- Caso 1
-- Opcion 1
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
    ,s.direccion||'/'||UPPER(r.nombre_region) AS "Dirección Sucursal/REGION SUCURSAL"
FROM
    cliente c
        JOIN comuna co
            USING(cod_region, cod_provincia, cod_comuna)
        JOIN provincia p
            USING(cod_region, cod_provincia)
        JOIN region r
            USING(cod_region)
        JOIN sucursal_retail s
            USING(cod_region, cod_provincia, cod_comuna)
WHERE
    EXTRACT(MONTH FROM c.fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
        AND
    cod_region = 13
ORDER BY
    TO_CHAR(c.fecha_nacimiento,'dd') ASC
    ,c.appaterno
;
-- Opcion 2
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
    ,s.direccion||'/'||UPPER(r.nombre_region) AS "Dirección Sucursal/REGION SUCURSAL"
FROM
    cliente c
        JOIN comuna co ON c.cod_region = co.cod_region 
            AND c.cod_provincia = co.cod_provincia 
            AND c.cod_comuna = co.cod_comuna
        JOIN provincia p ON co.cod_provincia = p.cod_provincia
            AND co.cod_region = p.cod_region
        JOIN region r ON p.cod_region = r.cod_region
        JOIN sucursal_retail s ON s.cod_region = r.cod_region
            AND s.cod_provincia = p.cod_provincia
            AND s.cod_comuna = co.cod_comuna
WHERE
    EXTRACT(MONTH FROM c.fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
        AND
    r.cod_region = 13
ORDER BY
    TO_CHAR(c.fecha_nacimiento,'dd') ASC
    ,c.appaterno
;
-- Caso 2
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(SUM(ttc.monto_transaccion),'FML999g999g999') AS "MONTO COMPRAS/AVANCES/S.AVANCES"
    ,TO_CHAR(SUM(ttc.monto_transaccion)*250/10000,'L999g999g999') AS "TOTAL PUNTOS ACUMULADOS"
FROM
    cliente c
        JOIN tarjeta_cliente tc
            ON c.numrun = tc.numrun
        JOIN transaccion_tarjeta_cliente ttc
            ON tc.nro_tarjeta = ttc.nro_tarjeta
WHERE
    EXTRACT(YEAR FROM ttc.fecha_transaccion) = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    c.numrun,c.dvrun
    ,c.pnombre,c.snombre
    ,c.appaterno,c.apmaterno
ORDER BY
    4 ASC
    ,c.appaterno
;

-- Caso 3
SELECT
     TO_CHAR(tc.fecha_transaccion,'mmyyyy') AS "MES DE TRANSACCION"
     ,t.nombre_tptran_tarjeta AS "TIPO TRANSACCION"
     ,TO_CHAR(SUM(tc.monto_total_transaccion),'L999g999g999') AS "MONTO AVANCES/SUPER AVANCES"
     ,TO_CHAR(SUM(tc.monto_total_transaccion * a.porc_aporte_sbif /100),'L999g999g999') AS "APORTE A LA SBIF"
FROM
    transaccion_tarjeta_cliente tc
    JOIN tipo_transaccion_tarjeta t
        ON tc.cod_tptran_tarjeta = t.cod_tptran_tarjeta
    JOIN aporte_sbif a
        ON tc.monto_total_transaccion BETWEEN a.monto_inf_av_sav AND a.monto_sup_av_sav
WHERE
    EXTRACT(YEAR FROM tc.fecha_transaccion) = EXTRACT(YEAR FROM SYSDATE)
        AND
    t.nombre_tptran_tarjeta IN('Avance en Efectivo', 'Súper Avance en Efectivo')
GROUP BY
    TO_CHAR(tc.fecha_transaccion,'mmyyyy')
    ,t.nombre_tptran_tarjeta
ORDER BY
    TO_CHAR(tc.fecha_transaccion,'mmyyyy') ASC
    ,t.nombre_tptran_tarjeta
;

-- Caso 4
SELECT
    TO_CHAR(c.numrun,'00g000g000')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(NVL(SUM(ttc.monto_total_transaccion),0),'FML999g999g999') AS "COMPRAS/AVANCES/S.AVANCES"
    ,CASE
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) BETWEEN 0 AND 100001 THEN 'SIN CATEGORIZACION'
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) BETWEEN 100000 AND 1000000 THEN 'BRONCE'
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) BETWEEN 1000001 AND 4000000 THEN 'PLATA'
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) BETWEEN 4000001 AND 8000000 THEN 'SILVER'
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) BETWEEN 8000001 AND 15000000 THEN 'GOLD'
      WHEN NVL(SUM(ttc.monto_total_transaccion),0) > 1500000 THEN 'PLATINUM'
    END
    AS "CATEGORIZACION DEL CLIENTE"
FROM
    cliente c
        JOIN tarjeta_cliente tc
            ON c.numrun = tc.numrun
        LEFT JOIN transaccion_tarjeta_cliente ttc
            ON tc.nro_tarjeta = ttc.nro_tarjeta
GROUP BY
    c.numrun,c.dvrun
    ,c.pnombre,c.snombre
    ,c.appaterno,c.apmaterno
ORDER BY
    c.appaterno
    ,SUM(ttc.monto_total_transaccion) DESC
;

-- Caso 5
SELECT
    TO_CHAR(c.numrun,'00g000g000')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||SUBSTR(c.snombre,1,1)||'. '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,COUNT(tc.cupo_disp_sp_avance) AS "TOTAL SUPER AVANCES VIGENTES"
    ,TO_CHAR(SUM(tc.cupo_disp_sp_avance),'L999g999g999') AS "MONTO TOTAL SUPER AVANCES"
FROM
    cliente c
        JOIN tarjeta_cliente tc
            ON c.numrun = tc.numrun
GROUP BY
    c.numrun,c.dvrun
    ,c.pnombre,c.snombre
    ,c.appaterno,c.apmaterno
ORDER BY
    c.appaterno
;
