SELECT
    LOWER(pnombre_cli || ' '|| appaterno_cli),
    appaterno_cli,
    SUBSTR(appaterno_cli,6,10), -- Extraer caracteres
    TRIM('A' FROM appaterno_cli), -- Borra el primer y ultimo caracter 
    LOWER(direccion), -- Minuscula
    UPPER(direccion), -- Mayuscula
    INITCAP(direccion), -- Primera letra mayuscula
    REPLACE(pnombre_cli, 'A', 'O')
FROM cliente
ORDER BY appaterno_cli DESC
;

SELECT
    ROUND(),  -- Redondear
    TRUNC(), -- Quita decimales
    MOD() -- Sobrante
FROM cliente
;

-- Fecha - Fecha = Número de dias
-- Fecha + Numero = Fecha
-- Fecha - Numero = Fecha
-- SYSDATE
-- NEXT_DAY(fecha,dia)
-- LAST_DAY(fecha)
-- MONTHS_BETWEEN(fecha1,fecha2)
-- ADD_MONTHS(fecha,n)

SELECT
    TO_CHAR(fecha_nac_cli, 'dd/mm/yyyy'),
    TO_CHAR(fecha_nac_cli, 'DAY MONTH YYYY'),
    EXTRACT(DAY FROM fecha_nac_cli),
    EXTRACT(MONTH FROM fecha_nac_cli),
    EXTRACT(YEAR FROM fecha_nac_cli)
FROM cliente
;