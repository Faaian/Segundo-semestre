-- Uso del AVG, MAX, MIN y SUM
SELECT
    ROUND(AVG(salario)) AS "SALARIO PROMEDIO"
    ,ROUND(AVG(NVL(salario,0))) AS "SALARIO PROMEDIO CON NULOS CONSIDERADOS"
    ,MAX(salario) AS "SALARIO MAXIMO"
    ,MIN(salario) AS "SALARIO MINIMO"
    ,SUM(salario) AS "SUMATORIA DE LOS SALARIOS"
    ,MIN(fecha_contrato) AS "FECHA MAS ANTIGUA"
    ,MIN(nombre) AS "NOMBRE MIN"
    ,MAX(nombre) AS "NOMBRE MAX"
FROM
    empleado
;

-- Uso del COUNT
SELECT
    COUNT(*) AS "CANTIDAD DE EMPLEADOS"
    ,COUNT(run_jefe) AS "EMPLEADOS QUE POSEEN JEFE"
FROM
    empleado
;

-- Grupo de datos
SELECT
    CASE id_escolaridad
        WHEN 10 THEN 'B�SICA'
        WHEN 20 THEN 'MEDIA CIENT�FICA HUMANISTA'
        WHEN 30 THEN 'MEDIA T�CNICO PROFESIONAL'
        WHEN 40 THEN 'SUPERIOR CENTRO DE FORMACI�N T�CNICA'
        WHEN 50 THEN 'SUPERIOR INSTITUTO PROFESIONAL'
        WHEN 60 THEN 'SUPERIOR UNIVERSIDAD' 
    END
        AS "ESCOLARIDAD"
    ,ROUND(AVG(salario)) AS "SALARIO PROMEDIO POR ESCOLARIDAD"
FROM
    empleado
GROUP BY
    id_escolaridad
ORDER BY
    "SALARIO PROMEDIO POR ESCOLARIDAD"
;

-- Restringir resultados
SELECT
    id_escolaridad
    ,ROUND(AVG(salario))
FROM
    empleado
GROUP BY
    id_escolaridad
HAVING MIN(salario) > 150000
AND MAX(salario) > 700000
;

