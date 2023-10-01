-- Caso 1
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,p.nombre_prof_ofic AS "PROFESION/OFICIO"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
FROM    
    cliente c 
    JOIN profesion_oficio p
        USING(cod_prof_ofic)
WHERE
    EXTRACT (MONTH FROM fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
ORDER BY
    "DIA DE CUMPLEAÑOS" ASC
    ,c.appaterno
;

-- Caso 2
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(SUM(cc.monto_solicitado),'FML999g999g999') AS "MONTO SOLICITADO CREDITOS"
    ,TO_CHAR(SUM(cc.monto_solicitado) * 1200 / 100000,'FML999g999g999') AS "TOTAL PESOS TODOSUMA"
FROM
    cliente c
    JOIN credito_cliente cc
        ON c.nro_cliente = cc.nro_cliente
    AND EXTRACT(YEAR FROM cc.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    c.numrun
    ,c.dvrun
    ,c.pnombre
    ,c.snombre
    ,c.appaterno
    ,c.apmaterno
ORDER BY
    SUM(cc.monto_solicitado) * 1200 / 100000
    ,c.appaterno
;

-- Caso 3
SELECT
    TO_CHAR(cc.fecha_otorga_cred,'mmyyyy') AS "MES DE TRANSCACCIÓN"
    ,c.nombre_credito AS "TIPO CREDITO"
    ,SUM(cc.monto_credito) AS "MONTO SOLICITADO CREDITO"
    ,CASE
        WHEN SUM(cc.monto_credito) BETWEEN 100000 AND 1000000 THEN SUM(cc.monto_credito) * 0.01
        WHEN SUM(cc.monto_credito) BETWEEN 1000001 AND 2000000 THEN SUM(cc.monto_credito) * 0.02
        WHEN SUM(cc.monto_credito) BETWEEN 2000001 AND 4000000 THEN SUM(cc.monto_credito) * 0.03
        WHEN SUM(cc.monto_credito) BETWEEN 4000001 AND 6000000 THEN SUM(cc.monto_credito) * 0.04
        WHEN SUM(cc.monto_credito) > 6000000 THEN SUM(cc.monto_credito) * 0.07
    END
        AS "APORTE A LA SBIF"
FROM
    credito_cliente cc 
        JOIN credito c
            ON cc.cod_credito = c.cod_credito
WHERE
    EXTRACT(YEAR FROM cc.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    TO_CHAR(cc.fecha_otorga_cred,'mmyyyy')
    ,c.nombre_credito
ORDER BY
    "MES DE TRANSCACCIÓN" ASC
    ,c.nombre_credito
;
 
-- Caso 4
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(SUM(p.monto_total_ahorrado),'FML999g999g999') AS "MONTO TOTAL AHORRADO"
    ,CASE
        WHEN SUM(p.monto_total_ahorrado) BETWEEN 100000 AND 1000000 THEN 'BRONCE'
        WHEN SUM(p.monto_total_ahorrado) BETWEEN 1000001 AND 4000000 THEN 'PLATA'
        WHEN SUM(p.monto_total_ahorrado) BETWEEN 4000001 AND 8000000 THEN 'SILVER'
        WHEN SUM(p.monto_total_ahorrado) BETWEEN 8000001 AND 15000000 THEN 'GOLD'
        WHEN SUM(p.monto_total_ahorrado) > 15000000 THEN 'PLATINUM'
    END
        AS "CATEGORIA CLIENTE"
FROM
    producto_inversion_cliente p
        JOIN cliente c
            ON p.nro_cliente = c.nro_cliente
GROUP BY
    c.numrun, c.dvrun, 
    c.pnombre, c.snombre, 
    c.appaterno, c.apmaterno
ORDER BY
    c.appaterno
    ,SUM(p.monto_total_ahorrado) DESC
;

-- Caso 5
SELECT
    TO_CHAR(SYSDATE,'YYYY') AS "AÑO TRIBUTARIO"
    ,TO_CHAR(c.numrun,'FM00g999g999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,c.pnombre||' '||SUBSTR(c.snombre,1,1)||'. '||c.appaterno||' '||c.apmaterno AS "NOMBRE COMPLETO"
    ,COUNT(p.nro_solic_prod) AS "TOTAL PROD. INV AFECTOS IMPTO"
    ,TO_CHAR(SUM(p.monto_total_ahorrado),'L999g999g999') AS "MONTO TOTAL AHORRADO"
FROM
    cliente c
        JOIN producto_inversion_cliente p
            ON c.nro_cliente = p.nro_cliente
GROUP BY
    c.numrun, c.dvrun, 
    c.pnombre, c.snombre, 
    c.appaterno, c.apmaterno,
    p.fecha_solic_prod
HAVING COUNT(*) > 1
OR
    SUM(p.monto_total_ahorrado) > 7833186 
ORDER BY
   c.appaterno 
;

-- Caso 6

-- Informe 1
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,COUNT(*) AS "TOTAL CREDITOS SOLICITADOS" 
    ,TO_CHAR(SUM(monto_solicitado),'L999g999g999') AS "MONTO TOTAL CREDITOS"
FROM    
    cliente c
        JOIN credito_cliente cc
            USING(nro_cliente)
WHERE
    EXTRACT(YEAR FROM cc.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    c.numrun, c.dvrun,
    c.pnombre, c.snombre,
    c.appaterno, c.apmaterno
ORDER BY
    c.appaterno
;

-- Informe 2
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,CASE MIN(m.cod_tipo_mov)
        WHEN 1 THEN TO_CHAR(SUM(m.monto_movimiento),'FML999g999g999')
        ELSE 'No Realizó'
    END AS "ABONOS"
    ,CASE MAX(m.cod_tipo_mov)
        WHEN 2 THEN TO_CHAR(SUM(m.monto_movimiento),'FML999g999g999')
        ELSE 'No Realizó'
    END AS "RESCATES"
FROM
    cliente c
        JOIN movimiento m
            ON c.nro_cliente = m.nro_cliente
GROUP BY
    c.numrun, c.dvrun,
    c.pnombre, c.snombre,
    c.appaterno, c.apmaterno
ORDER BY
    c.appaterno
;
