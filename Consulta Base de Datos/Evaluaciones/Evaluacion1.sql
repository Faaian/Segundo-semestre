-- Caso 1
SELECT
    INITCAP(pnombre_emp)||' '
    ||SUBSTR(NVL(snombre_emp,'K'),1,1)||'. '
    ||appaterno_emp||' '||SUBSTR(LOWER(apmaterno_emp),1,1)
    ||'.' AS "NOMBRE EMPLEADO",
    TO_CHAR(fecha_contrato,'FMDay d Mon YYYY')AS "FECHA CONTRATO",
    (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_contrato)) AS "AÑOS CONTRATADOS",
    SUBSTR(UPPER(pnombre_emp),-2,2)
    ||TRUNC(MONTHS_BETWEEN(SYSDATE,fecha_contrato))
    ||SUBSTR(TO_CHAR(fecha_contrato,'day'),1,2)
    ||SUBSTR(NVL(snombre_emp,'X'),1,1)
    ||SUBSTR(numrun_emp,-2,2) AS "CONTRASEÑA"
FROM
    empleado
WHERE
    SUBSTR(appaterno_emp,2,1) = 'A'
        AND
    (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_contrato)) >= 10
ORDER BY
    appaterno_emp    
;

-- Caso 2
SELECT
    INITCAP(pnombre_emp)||' '
    ||NVL(snombre_emp,'SEGUNDO')||' '
    ||SUBSTR(appaterno_emp,1,1)||'. '
    ||SUBSTR(apmaterno_emp,1,1)
        AS "NOMBRE EMPLEADO",
    TO_CHAR(fecha_nac,'FMDay d Month yyyy')AS "FECHA NACIMIENTO",
    TO_CHAR(
    CASE id_tipo_sal
        WHEN 'F' THEN (sueldo_base * 7.2)/100
        WHEN 'I' THEN (sueldo_base * 8.3)/100
        WHEN 'FA' THEN (sueldo_base * 4.5)/100
        WHEN 'C' THEN (sueldo_base * 5.3)/100
        WHEN 'P' THEN (sueldo_base * 11.3)/100
    END,'FML999g999g999') AS "DESCUENTO",
    TO_CHAR(
    CASE
        WHEN snombre_emp IS NULL THEN sueldo_base * 0.20
        ELSE sueldo_base * 0.15
    END,'FML999g999g999') AS "BONO",
    TO_CHAR(sueldo_base,'FML999g999g999') AS "SUELDO BASE",
    TO_CHAR((sueldo_base + 
        CASE
            WHEN snombre_emp IS NULL THEN (sueldo_base * 0.20)
            ELSE (sueldo_base * 0.15)
        END) - 
    CASE id_tipo_sal
        WHEN 'F' THEN (sueldo_base * 7.2)/100
        WHEN 'I' THEN (sueldo_base * 8.3)/100
        WHEN 'FA' THEN (sueldo_base * 4.5)/100
        WHEN 'C' THEN (sueldo_base * 5.3)/100
        WHEN 'P' THEN (sueldo_base * 11.3)/100
    END
    ,'FML999g999g999') 
    AS "LIQUIDO"
FROM
    empleado
WHERE
    TO_CHAR(fecha_nac, 'FMday') = 'lunes'
                OR
    TO_CHAR(fecha_nac, 'FMday') = 'miércoles'
;