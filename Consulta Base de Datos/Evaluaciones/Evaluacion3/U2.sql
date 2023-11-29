-- Caso 2
    -- Creación de la vista solo de lectura.
CREATE VIEW v_facturas_mayor_2 AS
SELECT
    p.descripcion AS "PRODUCTO"
    ,pa.nompais AS "PAIS"
    ,u.descripcion AS "UNIDAD MEDIDA"
    ,COUNT(d.numfactura) AS "CANTIDAD FACTURAS"
    ,TO_CHAR(NVL(p.valorcomprapeso,0),'FML999g999') AS "VALOR ACTUAL COMPRA"
    ,TO_CHAR(NVL((p.valorcomprapeso*1.10),0),'FML99g999') AS "NUEVO VALOR COMPRA"
FROM
    MDY2131_U1.syn_lr_prod p JOIN MDY2131_U1.syn_lr_pais pa
        ON p.codpais = pa.codpais
    JOIN MDY2131_U1.syn_lr_uni_medida u ON p.codunidad = u.codunidad
    LEFT JOIN MDY2131_U1.syn_lr_det_factura d ON p.codproducto = d.codproducto
GROUP BY
    p.descripcion,pa.nompais
    ,u.descripcion,p.valorcomprapeso
HAVING 
    COUNT(d.numfactura) >= 2
ORDER BY
    "CANTIDAD FACTURAS" DESC
    ,p.descripcion ASC
    
WITH READ ONLY
;