-- Caso 1
SELECT
     carreraid AS "IDENTIFICACION DE LA CARRERA"
    ,COUNT(alumnoid) AS "TOTAL ALUMNOS MATRICULADOS"
    , 'Le corresponden '
    || TO_CHAR((30200 * COUNT(alumnoid)),'FML999g999')
    || ' del presupuesto total asignado para publicidad' AS "MONTO POR PUBLICIDAD"
FROM
    alumno
GROUP BY
    carreraid
ORDER BY
    "TOTAL ALUMNOS MATRICULADOS" DESC
    ,carreraid
;

-- Caso 2
SELECT
    carreraid AS "CARRERA"
    ,COUNT(alumnoid) AS "TOTAL ALUMNOS"
FROM
    alumno
GROUP BY
    carreraid
    HAVING COUNT(alumnoid) > 4
ORDER BY
    carreraid
;

-- Caso 3
SELECT
    TO_CHAR(run_jefe,'FM999g999g999') AS "RUN JEFE SIN DV"
    ,COUNT(run_emp) AS "TOTAL EMPLEADOS A SU CARGO"
    ,TO_CHAR(MAX(salario),'FML999g999g999') AS "SALARIO MAXIMO"
    ,(COUNT(run_emp) * 10)||'% del Salario Máximo' AS "PORCENTAJE DE BONIFICACION"
    ,TO_CHAR((MAX(salario) * (COUNT(run_emp)))/10,'FML999g999g999') AS "BONIFICACION"
FROM
    empleado
WHERE
    run_jefe IS NOT NULL
GROUP BY
    run_jefe
ORDER BY
    "TOTAL EMPLEADOS A SU CARGO" ASC
;

-- Caso 4
SELECT
    id_escolaridad AS "ESCOLARIDAD"
    ,CASE id_escolaridad
        WHEN 10 THEN 'BÁSICA'
        WHEN 20 THEN 'MEDIA CIENTÍFICA HUMANISTA'
        WHEN 30 THEN 'MEDIA TÉCNICO PROFESIONAL'
        WHEN 40 THEN 'SUPERIOR CENTRO DE FORMACIÓN TÉCNICA'
        WHEN 50 THEN 'SUPERIOR INSTITUTO PROFESIONAL'
        WHEN 60 THEN 'SUPERIOR UNIVERSIDAD' 
    END 
        AS "DESCRIPCIÓN ESCOLARIDAD"
    ,COUNT(run_emp) AS "TOTAL DE EMPLEADOS"
    ,TO_CHAR(MAX(salario),'FML999g999g999') AS "SALARIO MÁXIMO"
    ,TO_CHAR(MIN(salario),'FML999g999g999') AS "SALARIO MINIMO"
    ,TO_CHAR(SUM(salario),'FML999g999g999') AS "SALARIO TOTAL"
    ,TO_CHAR(ROUND(AVG(salario)),'FML999g999g999') AS "SALARIO PROMEDIO"
FROM
    empleado
GROUP BY
    id_escolaridad
ORDER BY
    "TOTAL DE EMPLEADOS" DESC
;

-- Caso 5
SELECT
    tituloid AS "CODIGO DEL LIBRO"
    ,COUNT(fecha_ter_prestamo) AS "TOTAL DE VECES SOLICITADO"
    ,CASE
        WHEN COUNT(fecha_ini_prestamo) = 1 THEN 'No se requiere nuevos ejemplares'
        WHEN COUNT(fecha_ini_prestamo) BETWEEN 2 AND 3 THEN 'Se requiere comprar 1 nuevos ejemplares'
        WHEN COUNT(fecha_ini_prestamo) BETWEEN 4 AND 5 THEN 'Se requiere comprar 2 nuevos ejemplares'
        WHEN COUNT(fecha_ini_prestamo) > 5 THEN 'Se requiere comprar 4 nuevos ejemplares'
    END
        AS "SUGERENCIA"
FROM
    prestamo
WHERE
    EXTRACT(YEAR FROM fecha_ini_prestamo) = (EXTRACT(YEAR FROM SYSDATE) - 1)
GROUP BY
    tituloid
ORDER BY
    "TOTAL DE VECES SOLICITADO" DESC
;

-- Caso 6
SELECT
    TO_CHAR(run_emp,'FM999g999g999') AS "RUN EMPLEADO"
    ,TO_CHAR(fecha_ini_prestamo,'MM/YYYY') AS "MES PRESTAMOS LIBROS"
    ,COUNT(fecha_ini_prestamo) AS "TOTAL PRESTAMOS ATENDIDOS"
    ,TO_CHAR(COUNT(fecha_ini_prestamo)*10000,'L999g999g999')AS "ASIGNACION POR PRESTAMOS"
FROM
    prestamo
WHERE
    EXTRACT(YEAR FROM fecha_ini_prestamo) = (EXTRACT(YEAR FROM SYSDATE) - 1)
GROUP BY
    run_emp
    ,TO_CHAR(fecha_ini_prestamo,'MM/YYYY')
HAVING COUNT(fecha_ini_prestamo) > 2
ORDER BY
    "MES PRESTAMOS LIBROS" ASC
    ,"TOTAL PRESTAMOS ATENDIDOS" DESC
    ,run_emp DESC
;