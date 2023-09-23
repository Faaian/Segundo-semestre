SELECT
    TO_CHAR(c.numrun,'FM999g999g999')||'-'||UPPER(dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
    ,TO_CHAR(SUM(cr.monto_solicitado),'FML999g999g999') AS "MONTO SOLICITADO CREDITOS"
    ,TO_CHAR(SUM(cr.monto_solicitado) * 1200 / 100000,'FML999g999g999') AS "TOTAL PESOS TODOSUMA"
FROM
    credito_cliente cr JOIN cliente c
    ON(cr.nro_cliente=c.nro_cliente)
    AND cr.total_cuotas_credito <= 36
    AND EXTRACT(YEAR FROM cr.fecha_otorga_cred) = EXTRACT(YEAR FROM SYSDATE) - 1 
GROUP BY
    c.numrun
ORDER BY
    cr.monto_solicitado ASC
    ,c.appaterno
;

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
    cc.monto_solicitado ASC
    ,c.appaterno
;