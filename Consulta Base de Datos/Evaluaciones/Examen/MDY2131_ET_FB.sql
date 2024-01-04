-- Eliminación de sinonimos
DROP PUBLIC SYNONYM syn_reg;
DROP PUBLIC SYNONYM syn_cli;
    --
-- Creacion de sinonimos publicos
CREATE PUBLIC SYNONYM syn_reg FOR region;
CREATE PUBLIC SYNONYM syn_cli FOR cliente;
    --
-- Creacion de sinonimos privados
CREATE SYNONYM syn_selec_tipo_trans FOR seleccion_tipo_transaccion;
    --
-- Asignación de sinonimo publico
GRANT SELECT ON syn_reg TO MDY2131_ET_FB_DES, MDY2131_ET_FB_CON;
GRANT SELECT ON syn_cli TO MDY2131_ET_FB_DES, MDY2131_ET_FB_CON;
    --
-- Asignación de sinonimo privado
GRANT SELECT ON syn_selec_tipo_trans TO MDY2131_ET_FB_CON;
    --
-- Creación de los Indices para el Informe 1 (Caso 2)
CREATE INDEX IDX_REGION ON syn_cli(cod_region, fecha_inscripcion);
CREATE INDEX IDX_CLI_REGION ON syn_cli(numrun, cod_region);
    --
-- Informe 2 (Caso 2)
    -- Alternativa 1
SELECT
    TO_CHAR(SYSDATE,'dd-mm-yyyy') AS "FECHA"
    ,tt.cod_tptran_tarjeta AS "CODIGO"
    ,tt.nombre_tptran_tarjeta AS "DESCRIPCION"
    ,ROUND(AVG(t.monto_transaccion)) AS "MONTO PROMEDIO TRANSACCION"
FROM
    cuota_transac_tarjeta_cliente c
    JOIN transaccion_tarjeta_cliente t
        ON c.nro_transaccion = t.nro_transaccion AND c.nro_tarjeta = t.nro_tarjeta
    JOIN tipo_transaccion_tarjeta tt ON t.cod_tptran_tarjeta = tt.cod_tptran_tarjeta
WHERE
    EXTRACT(MONTH FROM c.fecha_venc_cuota) BETWEEN 6 AND 12
GROUP BY
    TO_CHAR(SYSDATE,'dd-mm-yyyy')
    ,tt.cod_tptran_tarjeta
    ,tt.nombre_tptran_tarjeta
ORDER BY 4 ASC
;
    --
-- Insertando datos a SELECCION_TIPO_TRANSACCION
INSERT INTO seleccion_tipo_transaccion(fecha, cod_tipo_transac, nombre_tipo_transac, monto_promedio)
SELECT
    TO_CHAR(SYSDATE,'dd-mm-yyyy')
    ,tt.cod_tptran_tarjeta
    ,tt.nombre_tptran_tarjeta
    ,ROUND(AVG(t.monto_transaccion))
FROM
    cuota_transac_tarjeta_cliente c
    JOIN transaccion_tarjeta_cliente t
        ON c.nro_transaccion = t.nro_transaccion AND c.nro_tarjeta = t.nro_tarjeta
    JOIN tipo_transaccion_tarjeta tt ON t.cod_tptran_tarjeta = tt.cod_tptran_tarjeta
WHERE
    EXTRACT(MONTH FROM c.fecha_venc_cuota) BETWEEN 6 AND 12
GROUP BY
    TO_CHAR(SYSDATE,'dd-mm-yyyy')
    ,tt.cod_tptran_tarjeta
    ,tt.nombre_tptran_tarjeta
ORDER BY
    4 ASC
;
COMMIT;  -- Confirmacion

-- Actualización del porcentaje de la tasa de interés
UPDATE tipo_transaccion_tarjeta
SET tasaint_tptran_tarjeta = tasaint_tptran_tarjeta - 0.01
WHERE cod_tptran_tarjeta IN (
    SELECT cod_tipo_transac
    FROM seleccion_tipo_transaccion
);
COMMIT;

-- Porcentaje acualizado
SELECT
    *
FROM
    tipo_transaccion_tarjeta
;