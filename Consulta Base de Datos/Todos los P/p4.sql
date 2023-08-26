SELECT
    TO_CHAR(numrun_cli,'00G000G000')||'-'||dvrun_cli AS "RUN CLIENTE",
    appaterno_cli||' '||SUBSTR(apmaterno_cli,1,1)||'. '||pnombre_cli||' '||snombre_cli AS "NOMBRE CLIENTE",
    direccion,
    NVL(TO_CHAR(celular_cli),'NO POSEE CELULAR') AS "TELEFONO FIJO"
FROM cliente
ORDER BY
    id_comuna ASC,
    appaterno_cli DESC
;


SELECT * FROM CLIENTE
ORDER BY
    id_comuna ASC,
    appaterno_cli DESC;

