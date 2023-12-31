-- Caso 1
SELECT
    TO_CHAR(numrun_cli,'99G999G999')||'-'||dvrun_cli AS "RUN CLIENTE",
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
    ||TO_CHAR(fecha_nac, '" estuvo de cumpleaños el " d "de" FM Month". Cumplió" ')||(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_nac))|| ' años'
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
    TO_CHAR(valor_arriendo_dia, 'L999g999') AS "VALOR ARRIENDO DIA",
    TO_CHAR(NVL(valor_garantia_dia, 0), 'L999g999') AS "VALOR GARANTIA DIA",
    TO_CHAR((valor_arriendo_dia + NVL(valor_garantia_dia, 0)), 'L999G999') AS "VALOR TOTAL DIA"
FROM
    camion
ORDER BY
    "TIPO CAMION",
    "VALOR ARRIENDO DIA" DESC,
    "VALOR GARANTIA DIA" ASC,
    nro_patente
;

-- Caso 4
SELECT
    TO_CHAR(SYSDATE, 'MM/YYYY')AS "FECHA PROCESO",
    TO_CHAR(numrun_emp, '99G999G999')||'-'||dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE EMPLEADO",
    TO_CHAR(sueldo_base, 'L9G999G999') AS "SUELDO BASE",
    CASE
        WHEN sueldo_base >= 320000 and sueldo_base <= 450000 THEN TO_CHAR((200000000 * 0.005), 'L9G999G999')
        WHEN sueldo_base >= 450001 and sueldo_base <= 600000 THEN TO_CHAR((200000000 * 0.0035), 'L9G999G999')
        WHEN sueldo_base >= 600001 and sueldo_base <= 900000 THEN TO_CHAR((200000000 * 0.0025), 'L9G999G999')
        WHEN sueldo_base >= 900001 and sueldo_base <= 1800000 THEN TO_CHAR((200000000 * 0.0015), 'L9G999G999')
        WHEN sueldo_base > 1800000 THEN TO_CHAR((200000000 * 0.001), 'L9G999G999')
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
    TO_CHAR((sueldo_base * (EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato))) / 100, 'L9G999G999') AS "VALOR MOVILIZACION",
    CASE
        WHEN sueldo_base >= 450000 THEN TO_CHAR((sueldo_base * SUBSTR(sueldo_base,1,1)) / 100, 'L999G999')
        WHEN sueldo_base < 450000 THEN TO_CHAR((sueldo_base * SUBSTR(sueldo_base,1,2)) / 100, 'L999G999')
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
    EXTRACT(YEAR FROM TO_DATE('2023','YYYY')) AS "Año Tributario",
    TO_CHAR(numrun_emp,'99G999G999') ||'-'|| dvrun_emp AS "Run Empleado",
    pnombre_emp ||' '|| snombre_emp ||' '|| appaterno_emp ||' '|| apmaterno_emp AS "Nombre Empleado",
    CASE 
        WHEN ROUND(MONTHS_BETWEEN('31/12/2022', fecha_contrato),1) > 12 Then 12
        ELSE ROUND(MONTHS_BETWEEN('31/12/2022', fecha_contrato),1)
    END
        AS "Meses Trabajados en el año",
    (EXTRACT(YEAR FROM TO_DATE('2022','YYYY'))-(EXTRACT(YEAR FROM fecha_contrato))) AS "Años Trabajados",
    sueldo_base AS "Sueldo Base Mensual",
    MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'),TO_DATE('01/08/2018','DD/MM/YYYY')) * sueldo_base AS "Sueldo Base Anual",
    TRUNC((sueldo_base * (EXTRACT(YEAR FROM TO_DATE('2022','YYYY'))-(EXTRACT(YEAR FROM fecha_contrato)))/100)*12) AS "Bono Por Años Anual",
    ROUND((sueldo_base *0.12)* MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'), TO_DATE('01/08/2018','DD/MM/YYYY'))) AS "Movilizacion Anual",
    ROUND((sueldo_base *0.20)* MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'), TO_DATE('01/08/2018','DD/MM/YYYY'))) AS "Colacion Anual",
    (MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'),TO_DATE('01/08/2018','DD/MM/YYYY')) * sueldo_base) + TRUNC((sueldo_base * (EXTRACT(YEAR FROM TO_DATE('2022','YYYY'))-(EXTRACT(YEAR FROM fecha_contrato)))/100)*12) + ROUND((sueldo_base *0.12)* MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'), TO_DATE('01/08/2018','DD/MM/YYYY'))) + ROUND((sueldo_base *0.20)* MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'), TO_DATE('01/08/2018','DD/MM/YYYY'))) AS "Sueldo Bruto Anual",
    (MONTHS_BETWEEN(TO_DATE('01/08/2019','DD/MM/YYYY'),TO_DATE('01/08/2018','DD/MM/YYYY')) * sueldo_base) + TRUNC((sueldo_base * (EXTRACT(YEAR FROM TO_DATE('2022','YYYY'))-(EXTRACT(YEAR FROM fecha_contrato)))/100)*12) AS "Renta Imponible Anual"
FROM empleado
ORDER BY numrun_emp
;
