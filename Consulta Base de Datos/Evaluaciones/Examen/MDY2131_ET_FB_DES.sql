-- Creación de la vista del Informe 1 (Caso 2)
    --
CREATE VIEW v_clientes_20 AS
SELECT
    r.nombre_region AS "REGION"
    ,(SELECT COUNT(c.numrun) FROM syn_cli c
    WHERE r.cod_region = c.cod_region
    AND TRUNC((SYSDATE-c.fecha_inscripcion)/365) >= 20) AS "CLIENTES INSCRITOS HACE 20 O MAS AÑOS"
    ,(SELECT COUNT(c.numrun) FROM syn_cli c
    WHERE r.cod_region = c.cod_region) AS "TOTAL DE CLIENTES"
FROM
    syn_reg r
ORDER BY
    2 ASC
;
