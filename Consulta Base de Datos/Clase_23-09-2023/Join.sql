SELECT
    *
FROM
    cliente c
JOIN profesion_oficio p
    ON c.cod_prof_ofic = p.cod_prof_ofic
JOIN tipo_cliente t
    ON c.cod_tipo_cliente = t.cod_tipo_cliente
;

SELECT
    p.nombre_prof_ofic
     ,count(*) AS "CANTIDAD"
FROM
    cliente c
JOIN profesion_oficio p
ON c.cod_prof_ofic = p.cod_prof_ofic
GROUP BY
    p.nombre_prof_ofic
;

SELECT
    c.pnombre
    ,c.appaterno
    ,COUNT(*) AS "CANTIDAD DE CUOTAS"
FROM
    cliente c
    JOIN credito_cliente cc
        ON c.nro_cliente = cc.nro_cliente
    JOIN cuota_credito_cliente cu
        ON cc.nro_solic_credito = cu.nro_solic_credito
GROUP BY
    c.pnombre
    ,c.appaterno
ORDER BY
    c.appaterno
;