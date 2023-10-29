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
SELECT
    numrut_cli || '-'|| dvrut_cli AS "RUT CLIENTE",
    nombre_cli ||' '|| appaterno_cli || ' '|| apmaterno_cli AS "NOMBRE CLIENTE",
    renta_cli AS "RENTA",
    fonofijo_cli AS "TELEFONO FIJO",
    celular_cli AS "CELULAR"
FROM cliente
WHERE 
    id_estcivil != 2
    AND id_estcivil != 5
    AND renta_cli >= 800000
ORDER BY
    appaterno_cli ASC,
    nombre_cli ASC
;

-- Caso 3
