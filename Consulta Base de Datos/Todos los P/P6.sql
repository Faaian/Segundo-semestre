-- Caso 1
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,INITCAP(c.pnombre)||' '||INITCAP(c.snombre)||' '||INITCAP(c.appaterno)||' '||INITCAP(c.apmaterno) AS "NOMBRE CLIENTE"
    ,p.nombre_prof_ofic AS "PROFESION/OFICIO"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
FROM    
    cliente c JOIN profesion_oficio p
    USING(cod_prof_ofic)
WHERE
    EXTRACT (MONTH FROM fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
ORDER BY
    "DIA DE CUMPLEAÑOS" ASC
    ,c.appaterno
;

-- Caso 2
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||UPPER(dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||appaterno||' '||apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(cr.monto_solicitado,'FML999g999g999') AS "MONTO SOLICITADO CREDITOS"
    ,TO_CHAR(cr.monto_solicitado * 1200 / 100000,'FML999g999g999') AS "TOTAL PESOS TODOSUMA"
FROM
    credito_cliente cr JOIN cliente c
    ON(cr.nro_cliente=c.nro_cliente)
    AND cr.total_cuotas_credito <= 36
    AND EXTRACT(YEAR FROM cr.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1
ORDER BY
    cr.monto_solicitado ASC
    ,c.appaterno
;

-- Caso 3
SELECT
    TO_CHAR(cc.fecha_otorga_cred,'mmyyyy') AS "MES DE TRANSCACCIÓN"
    ,c.nombre_credito AS "TIPO CREDITO"
    ,cc.monto_solicitado AS "MONTO SOLICITADO CREDITO"
    ,CASE
        WHEN cc.monto_solicitado BETWEEN 100000 AND 100000000 THEN cc.monto_credito * 0.01
        WHEN cc.monto_solicitado BETWEEN 100000001 AND 200000000 THEN cc.monto_credito * 0.02
        WHEN cc.monto_solicitado BETWEEN 200000001 AND 400000000 THEN cc.monto_credito * 0.03
        WHEN cc.monto_solicitado BETWEEN 400000001 AND 600000000 THEN cc.monto_credito * 0.04
        WHEN cc.monto_solicitado > 6000000000 THEN cc.monto_credito * 0.07
    END
        AS "APORTE A LA SBIF"
FROM
    credito_cliente cc 
    INNER JOIN credito c
    ON cc.cod_credito = c.cod_credito
WHERE
    EXTRACT(YEAR FROM cc.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1
ORDER BY
    "MES DE TRANSCACCIÓN" ASC
    ,c.nombre_credito
;

-- Caso 4
SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(p.monto_total_ahorrado,'FML999g999g999') AS "MONTO TOTAL AHORRADO"
FROM
    producto_inversion_cliente p
RIGHT JOIN cliente c
ON p.nro_cliente = c.nro_cliente
ORDER BY
    c.appaterno
    ,"MONTO TOTAL AHORRADO" ASC
;