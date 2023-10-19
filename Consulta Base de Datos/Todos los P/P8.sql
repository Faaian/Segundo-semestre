SELECT
    nombre_tipo||','||nombre_sal AS "SISTEMA_SALUD"
    ,cantidad AS "TOTAL ATENCIONES"
FROM
    (SELECT
    sa.descripcion AS nombre_sal
    ,tp.descripcion AS nombre_tipo
    ,COUNT(at.ate_id) AS cantidad
FROM
    atencion at JOIN paciente p
        ON at.pac_run = p.pac_run
    JOIN salud sa ON p.sal_id = sa.sal_id
    JOIN tipo_salud tp ON sa.tipo_sal_id = tp.tipo_sal_id
WHERE
    EXTRACT(MONTH FROM at.fecha_atencion) = EXTRACT(MONTH FROM SYSDATE)
GROUP BY
    sa.descripcion, tp.descripcion)
WHERE
    cantidad > 
        (SELECT
            ROUND(AVG(atenciones))
        FROM
        (SELECT COUNT(at.ate_id) AS atenciones
        FROM atencion at
        WHERE TO_CHAR(at.fecha_atencion,'mm') = '09'
        GROUP BY TO_CHAR(at.fecha_atencion,'dd')))
;