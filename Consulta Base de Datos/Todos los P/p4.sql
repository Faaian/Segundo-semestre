-- Caso 1
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

-- Caso 2
SELECT
    'El empleado '||pnombre_emp||
    ' '|| appaterno_emp||' '
    ||apmaterno_emp
    ||TO_CHAR(fecha_nac, '" estuvo de cumpleaños el " d "de" Month. "Cumplió" ')||(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_nac))|| ' años'
    AS "LISTADO DE CUMPLEAÑOS"
FROM
    empleado
WHERE 
    EXTRACT(MONTH FROM fecha_nac) = 7    
ORDER BY
    EXTRACT(DAY FROM fecha_nac) ASC,
    appaterno_emp
;

-- Caso 3
SELECT
    nombre_tipo_camion AS "TIPO CAMION",
    nro_patente AS "NRO PATENTE",
    anio AS "AÑO",
    TO_CHAR(valor_arriendo_dia, '$999g999') AS "VALOR ARRIENDO DIA",
    COALESCE(TO_CHAR(valor_garantia_dia, '$999g999'), ' $0') AS "VALOR GARANTIA DIA",
    TO_CHAR((valor_arriendo_dia + NVL(valor_garantia_dia, 0)), '$999G999') AS "VALOR TOTAL DIA"
FROM
    camion,
    tipo_camion
WHERE
    anio BETWEEN 2017 AND 2019 
ORDER BY
    nombre_tipo_camion,
    valor_arriendo_dia DESC,
    valor_garantia_dia ASC,
    nro_patente ASC
;

-- Caso 4
SELECT
    TO_CHAR(SYSDATE, 'MM/YYYY')AS "FECHA PROCESO",
    TO_CHAR(numrun_emp, '99G999G999')||'-'||dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE EMPLEADO",
    TO_CHAR(sueldo_base, '$9G999G999') AS "SUELDO BASE",
    CASE
        WHEN sueldo_base >= 320000 and sueldo_base <= 450000 THEN TO_CHAR((200000000 * 0.005), '$9G999G999')
        WHEN sueldo_base >= 450001 and sueldo_base <= 600000 THEN TO_CHAR((200000000 * 0.0035), '$9G999G999')
        WHEN sueldo_base >= 600001 and sueldo_base <= 900000 THEN TO_CHAR((200000000 * 0.0025), '$9G999G999')
        WHEN sueldo_base >= 900001 and sueldo_base <= 1800000 THEN TO_CHAR((200000000 * 0.0015), '$9G999G999')
        WHEN sueldo_base > 1800000 THEN TO_CHAR((200000000 * 0.001), '$9G999G999')
    END   
        AS "BONIFICACION POR UTILIDADES"
FROM
    empleado
ORDER BY
    appaterno_emp
;

-- Caso 5


