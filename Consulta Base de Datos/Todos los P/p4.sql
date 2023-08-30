-- Caso 1
SELECT
    TO_CHAR(numrun_cli,'00G000G000')||'-'||dvrun_cli AS "RUN CLIENTE",
    appaterno_cli||' '||SUBSTR(apmaterno_cli,1,1)||'. '||pnombre_cli||' '||snombre_cli AS "NOMBRE CLIENTE",
    direccion,
    NVL(TO_CHAR(fono_fijo_cli),'NO POSEE TELEFONO FIJO') AS "TELEFONO FIJO",
    NVL(TO_CHAR(celular_cli), 'NO POSEE CELULAR') "CELULAR",
    id_comuna AS "COMUNA"
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
     CASE
        WHEN id_tipo_camion = 'A' THEN 'Tradicional 6 Toneladas'
        WHEN id_tipo_camion = 'B' THEN 'Frigorifico'
        WHEN id_tipo_camion = 'C' THEN 'Camion 3/4'
        WHEN id_tipo_camion = 'D' THEN 'Trailer'
        WHEN id_tipo_camion = 'E' THEN 'Tolva'
     END
     AS "TIPO CAMION",
    nro_patente AS "NRO PATENTE",
    anio AS "AÑO",
    TO_CHAR(valor_arriendo_dia, '$999g999') AS "VALOR ARRIENDO DIA",
    COALESCE(TO_CHAR(valor_garantia_dia, '$999g999'), ' $0') AS "VALOR GARANTIA DIA",
    TO_CHAR((valor_arriendo_dia + NVL(valor_garantia_dia, 0)), '$999G999') AS "VALOR TOTAL DIA"
FROM
    camion
ORDER BY
    id_tipo_camion,
    valor_arriendo_dia DESC,
    valor_garantia_dia ASC,
    nro_patente ASC
;

select * from camion;
select * from tipo_camion;
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
SELECT
    numrun_emp||'-'||dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE EMPLEADO",
    (EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato)) AS "AÑOS CONTRATADOS",
    TO_CHAR(sueldo_base, '$9G999G999') AS "SUELDO BASE",
    TO_CHAR((sueldo_base * (EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato))) / 100, '$9G999G999') AS "VALOR MOVILIZACION",
    CASE
        WHEN sueldo_base >= 450000 THEN TO_CHAR((sueldo_base * SUBSTR(sueldo_base,1,1)) / 100, '$999G999')
        WHEN sueldo_base < 450000 THEN TO_CHAR((sueldo_base * SUBSTR(sueldo_base,1,2)) / 100, '$999G999')
    END
        AS "BONIF.EXTRA MOVILIZACION",
    CASE
        WHEN sueldo_base >= 450000 THEN TO_CHAR(((sueldo_base * (EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato))) / 100) + ((sueldo_base * SUBSTR(sueldo_base,1,1)) / 100), 'L99G999G999')
        WHEN sueldo_base < 450000 THEN TO_CHAR(((sueldo_base * (EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato))) / 100) + ((sueldo_base * SUBSTR(sueldo_base,1,2)) / 100), 'L99G999G999')
    END
        AS "VALOR MOVILIZACION TOTAL"
FROM
    empleado
WHERE
    id_comuna IN (117,118,120,122,126)
ORDER BY
    appaterno_emp
;

-- Caso 6
SELECT
    EXTRACT(YEAR FROM SYSDATE) AS "AÑO TRIBUTARIO",
    TO_CHAR(numrun_emp, '99G999G999')||'-'||dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE EMPLEADO",
    ROUND(MONTH BETWEEN('31/12/2022'))
FROM
    empleado
;
select * from empleado;

