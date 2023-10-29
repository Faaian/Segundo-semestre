-- Caso 1
SELECT
    det.numfactura AS "NRO.FACTURA"
    ,vend.rutvendedor AS "RUT VENDEDOR"
    ,TO_CHAR(fac.fecha,'FMdd "de" Month "de" yyyy') AS "FECHA"
    ,TO_CHAR(fac.total,'L999g999') AS "MONTO FACTURA"
    ,SUM(det.cantidad) AS "CANTIDAD PRODUCTOS"
    ,NVL(ban.descripcion,'SIN BANCO') AS "BANCO"
FROM
    detalle_factura det JOIN factura fac
        ON det.numfactura = fac.numfactura
    JOIN vendedor vend ON fac.rutvendedor = vend.rutvendedor
    LEFT JOIN banco ban ON fac.codbanco = ban.codbanco
WHERE
    fac.total >= 
                (SELECT AVG(SUM(fac.total))
                FROM detalle_factura det
                JOIN factura fac ON det.numfactura = fac.numfactura
                WHERE TO_CHAR(fac.fecha,'mm') = 01
                GROUP BY det.numfactura)
GROUP BY
    det.numfactura,vend.rutvendedor
    ,fac.fecha,fac.total
    ,ban.descripcion
HAVING
    SUM(det.cantidad) >= 10
ORDER BY
    "MONTO FACTURA" ASC
;

-- Caso 2
SELECT
    c.rutcliente AS "RUT_CLIENTE"
    ,c.nombre AS "NOMBRE_CLIENTE"
    ,com.descripcion  AS "NOMBRE_COMUNA"
    ,COUNT(fac.numfactura) AS "TOTAL_DOCUMENTOS"
    ,TO_CHAR(c.credito,'L999g999g999') AS "CREDITO"
FROM
    cliente c JOIN comuna com
        ON c.codcomuna = com.codcomuna
    JOIN factura fac ON c.rutcliente = fac.rutcliente
WHERE
    TO_CHAR(fac.fecha,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
GROUP BY
    c.rutcliente,c.nombre,com.descripcion,c.credito
UNION
SELECT
    'SIN CLIENTE'
    ,'SIN CLIENTE'
    ,'NO APLICA'
    ,COUNT(numfactura)
    ,'NO APLICA'
FROM
    factura
WHERE
    rutcliente IS NULL
        AND
    TO_CHAR(fecha,'yyyy') = EXTRACT(YEAR FROM SYSDATE) - 1
;