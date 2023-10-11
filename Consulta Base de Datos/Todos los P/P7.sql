-- Caso 1
-- Opcion 1
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
    ,s.direccion||'/'||UPPER(r.nombre_region) AS "Dirección Sucursal/REGION SUCURSAL"
FROM
    cliente c
        JOIN comuna co
            USING(cod_region, cod_provincia, cod_comuna)
        JOIN provincia p
            USING(cod_region, cod_provincia)
        JOIN region r
            USING(cod_region)
        JOIN sucursal_retail s
            USING(cod_region, cod_provincia, cod_comuna)
WHERE
    EXTRACT(MONTH FROM c.fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
        AND
    cod_region = 13
ORDER BY
    TO_CHAR(c.fecha_nacimiento,'dd') ASC
    ,c.appaterno
;
-- Opcion 2
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
    ,s.direccion||'/'||UPPER(r.nombre_region) AS "Dirección Sucursal/REGION SUCURSAL"
FROM
    cliente c
        JOIN comuna co ON c.cod_region = co.cod_region 
            AND c.cod_provincia = co.cod_provincia 
            AND c.cod_comuna = co.cod_comuna
        JOIN provincia p ON co.cod_provincia = p.cod_provincia
            AND co.cod_region = p.cod_region
        JOIN region r ON p.cod_region = r.cod_region
        JOIN sucursal_retail s ON s.cod_region = r.cod_region
            AND s.cod_provincia = p.cod_provincia
            AND s.cod_comuna = co.cod_comuna
WHERE
    EXTRACT(MONTH FROM c.fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
        AND
    r.cod_region = 13
ORDER BY
    TO_CHAR(c.fecha_nacimiento,'dd') ASC
    ,c.appaterno
;
-- Caso 2
SELECT
    TO_CHAR(c.numrun,'00g999g999')||'-'||UPPER(c.dvrun) AS "RUN CLIENTE"
    ,c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno AS "NOMBRE CLIENTE"
FROM
    cliente c
;

