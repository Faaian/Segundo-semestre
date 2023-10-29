-- JOIN con ON
SELECT
    pnombre
    ,p.nombre_prof_ofic AS "PROFESION"
FROM
    cliente c JOIN profesion_oficio p
    ON(c.cod_prof_ofic=p.cod_prof_ofic)
;

-- INNER JOIN
SELECT
    s.id_sucursal
    ,direccion
    ,r.nombre_region AS "REGION"
FROM
    sucursal_banco s
NATURAL JOIN
    region r
;

-- USING JOIN
SELECT
    c.pnombre AS "NOMBRE"
    ,c.appaterno AS "APELLIDO"
    ,cod_region AS "CODIGO REGION"
    ,r.nombre_region AS "REGION"
FROM
    cliente c
JOIN
    region r
    USING(cod_region)
ORDER BY
    pnombre
;

-- ON JOIN
SELECT
    c.pnombre
    ,r.nombre_region
FROM
    cliente c
JOIN
    region r
ON(c.cod_region=r.cod_region)
ORDER BY
    pnombre
;