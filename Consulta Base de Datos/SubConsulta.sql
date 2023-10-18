SELECT
    nombre||' '||apellido AS "NOMBRE"
    ,subconsulta.edad
    ,porc.porcentaje_descto AS "PORCENTAJE DESCUENTO"
FROM (SELECT 
        paciente.pnombre AS "NOMBRE"
        ,paciente.apaterno AS "APELLIDO"
        ,TRUNC((SYSDATE-paciente.fecha_nacimiento)/365) AS EDAD
        ,COUNT(atencion.ate_id) AS "ATENCIONES"
        ,SUM(atencion.costo) AS "COSTO"
    FROM paciente
        JOIN atencion 
            ON paciente.pac_run = atencion.pac_run
    WHERE TRUNC((SYSDATE-paciente.fecha_nacimiento)/365) >= 65
    GROUP BY
        paciente.pnombre
        ,paciente.apaterno
        ,TRUNC((SYSDATE-paciente.fecha_nacimiento)/365)
    ORDER BY paciente.apaterno) subconsulta
JOIN porc_descto_3ra_edad porc
    ON subconsulta.edad BETWEEN porc.anno_ini AND porc.anno_ter
;