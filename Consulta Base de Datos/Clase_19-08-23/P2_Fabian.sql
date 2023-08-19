-- Caso 1
-- Informe 1
SELECT
    TO_CHAR (fecha_entrega_propiedad, 'dd/mm/yyyy') AS "FECHA ENTREGA"
FROM propiedad
WHERE
EXTRACT (YEAR FROM fecha_entrega_propiedad) = 2010
;
-- Informe 2
SELECT
    TO_CHAR (fecini_arriendo, 'dd/mm/yyyy') AS "FECHA INICIO ARRIENDO"
FROM propiedad_arrendada
WHERE
    EXTRACT(YEAR FROM fecini_arriendo)
    LIKE '& FECHA'
ORDER BY
    EXTRACT(MONTH FROM fecini_arriendo) ASC
;

-- Caso 2
