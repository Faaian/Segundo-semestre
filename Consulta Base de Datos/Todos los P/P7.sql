SELECT
    TO_CHAR(c.numrun,'09G999G999')||'-'||c.dvrun AS "RUN CLIENTE"
    ,INITCAP(c.pnombre||' '||c.snombre||' '||c.appaterno||' '||c.apmaterno) AS "NOMBRE CLIENTE"
    ,TO_CHAR(c.fecha_nacimiento,'dd "de" Month') AS "DIA DE CUMPLEAÑOS"
FROM
    cliente c
        LEFT JOIN comuna co
            ON c.cod_comuna = co.cod_comuna
WHERE
    EXTRACT(MONTH FROM c.fecha_nacimiento) = EXTRACT(MONTH FROM SYSDATE) + 1
;

SELECT

FROM
    cliente c
        JOIN aporte_sbif a
            ON 
;

SELECT * FROM CLIENTE;
SELECT * FROM APORTE_SBIF;