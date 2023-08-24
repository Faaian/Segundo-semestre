-- Caso 1
SELECT
       numrun_cli || '-' || dvrun_cli AS "RUN CLIENTE",
       LOWER(pnombre_cli) || ' ' || INITCAP(snombre_cli)|| ' ' || appaterno_cli || ' ' || apmaterno_cli AS "NOMBRE COMPLETO CLIENTE",
       TO_CHAR(fecha_nac_cli, 'DD/MM/YYYY') AS "FECHA DE NACIMIENTO" 
FROM cliente
WHERE 
    EXTRACT(DAY FROM fecha_nac_cli) = 21
ORDER BY appaterno_cli    
;

-- Caso 2
SELECT
    numrun_emp || ' ' || dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp || ' ' || snombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "NOMBRE COMPLETO EMPLEADO",
    sueldo_base AS "SUELDO BASE",
    TRUNC(sueldo_base * 0.00001) AS "PORCENTAJE MOVILIZACIÓN",
    ROUND(TRUNC(sueldo_base * 0.00001)/100 * TRUNC(sueldo_base)) AS "VALOR MOVILIZACIÓN"
FROM empleado
ORDER BY
    (sueldo_base * 0.00001) DESC
;

-- Caso 3
SELECT
    numrun_emp || ' ' || dvrun_emp AS "RUN EMPLEADO",
    pnombre_emp || ' ' || snombre_emp || ' ' || appaterno_emp || ' ' || apmaterno_emp AS "NOMBRE COMPLETO",
    sueldo_base AS "SUELDO BASE",
    TO_CHAR(fecha_nac, 'DD/MM/YYYY') AS "FECHA DE NACIMIENTO",
    SUBSTR(pnombre_emp,1,3) ||LENGTH(pnombre_emp)|| '*' || SUBSTR(sueldo_base,-1,1)||dvrun_emp||ROUND(EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM fecha_contrato)) AS "NOMBRE DE USUARIO",
    SUBSTR(numrun_emp,3,1)|| EXTRACT(YEAR FROM fecha_nac) + 2||SUBSTR(sueldo_base,-3,3) - 1||SUBSTR(appaterno_emp,-2,2)|| EXTRACT(MONTH FROM SYSDATE) AS "CLAVE"
FROM empleado
ORDER BY appaterno_emp
;

-- Caso 3
SELECT * FROM empleado;
