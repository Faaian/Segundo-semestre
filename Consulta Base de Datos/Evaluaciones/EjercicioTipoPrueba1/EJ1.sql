-- Caso 1
SELECT
    nombre AS "VENDEDOR",
    TO_CHAR(sueldo_base, 'L999g999') AS "SUELDO BASE",
    NVL(TO_CHAR(comision,'FMD9'), 'SIN COMISION') AS "%COMISION",
    TO_CHAR(fecha_contrato, 'D FMMonth YYYY')AS "FECHA CONTRATO"
FROM
    vendedor
WHERE
    sueldo_base BETWEEN 240000 AND 250000
ORDER BY
    fecha_contrato ASC,
    sueldo_base DESC
;

-- Caso 2
SELECT
    nombre AS "CLIENTE",
    TO_CHAR(credito,'L999g999g999') AS "MONTO CREDITO",
    TO_CHAR(saldo,'L999g999g999')AS "MONTO SALDO",
    TO_CHAR((credito * 1.20),'L999G999G999') AS "NUEVO CREDITO",
    LOWER(mail) AS "CORREO"
FROM
    cliente
WHERE
    codcomuna = 1
        OR
    codcomuna = 3
        OR
    saldo > 1500000
ORDER BY
    credito DESC
;

-- Caso 3
SELECT
    numfactura AS "NRO. FACTURA",
    rutvendedor AS "VENDEDOR",
    TO_CHAR(neto,'L999g999') AS "VALOR NETO",
    CASE
        WHEN f_vencimiento IS NULL THEN 'NO APLICA'
        ELSE TO_CHAR((EXTRACT(MONTH FROM f_vencimiento) - EXTRACT(MONTH FROM fecha)),'FM9')
        ||' MES(ES)'
    END AS "MESES VENCIMIENTO"
FROM
    factura
WHERE
    estado = 'EM'
ORDER BY
    "VENDEDOR" DESC,
    "VALOR NETO" DESC
;