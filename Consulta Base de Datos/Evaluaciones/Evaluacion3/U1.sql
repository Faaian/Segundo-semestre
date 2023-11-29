-- Creacion de la secuencia U1.
CREATE SEQUENCE seq_idx_aux
  MINVALUE 1
  MAXVALUE 10000
  START WITH 1000
  INCREMENT BY 2
  NOCACHE
  CYCLE
;

-- Permiso para consultar secuencia.
GRANT SELECT ON seq_idx_aux TO MDY2131_U2; -- U2

-- Acceso a los datos.
GRANT ALTER ON forma_pago TO MDY2131_U2;
GRANT INSERT ON forma_pago TO MDY2131_U2;
GRANT DELETE ON forma_pago TO MDY2131_U2;
    ----
-- Borrar sinonimos.
DROP SYNONYM syn_lr_prod;
DROP SYNONYM syn_lr_pais;
DROP SYNONYM syn_lr_uni_medida;
DROP SYNONYM syn_lr_det_factura;

-- Creacion de sinonimos.
CREATE SYNONYM syn_lr_prod FOR producto;
CREATE SYNONYM syn_lr_pais FOR pais;
CREATE SYNONYM syn_lr_uni_medida FOR unidad_medida;
CREATE SYNONYM syn_lr_det_factura FOR detalle_factura;

-- Permisos de sinonimos.
GRANT SELECT ON syn_lr_prod TO MDY2131_U2;
GRANT SELECT ON syn_lr_pais TO MDY2131_U2;
GRANT SELECT ON syn_lr_uni_medida TO MDY2131_U2;
GRANT SELECT ON syn_lr_det_factura TO MDY2131_U2;

-- Caso 3
SELECT
    c.rutcliente AS "RUT CLIENTE"
    ,c.nombre AS "NOMBRE CLIENTE"
    ,v.rutvendedor AS "RUT VENDEDOR"
    ,v.nombre AS "NOMBRE VENDEDOR"
    ,TO_CHAR(total,'L999g999g999') AS "MONTO"
FROM
    vendedor v JOIN boleta b
        ON v.rutvendedor = b.rutvendedor
        JOIN cliente c ON c.rutcliente = b.rutcliente
WHERE
    c.codcomuna = 8 AND UPPER(SUBSTR(c.nombre,1,1)) IN ('J', 'S', 'M')
ORDER BY
    v.nombre
;
    ----
CREATE INDEX idx_boleta_rutvendedor_rutcliente ON boleta(rutvendedor, rutcliente);
-- Cree ese index para que mejore el rendimiento de la consulta con el indice en los rut en la boleta
