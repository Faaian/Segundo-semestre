SELECT
    descripcion_tp||','||descripcion_sa AS "SISTEMA_SALUD"
    ,total AS "TOTAL ATENCIONES"
FROM
    (SELECT COUNT(at.ate_id) AS total
    ,sa.descripcion AS descripcion_sa
    ,tp.descripcion AS descripcion_tp
FROM atencion at
    JOIN paciente p 
        ON at.pac_run = p.pac_run
    JOIN salud sa 
        ON p.sal_id = sa.sal_id
    JOIN tipo_salud tp 
        ON sa.tipo_sal_id = tp.tipo_sal_id
WHERE 
    EXTRACT(MONTH FROM at.fecha_atencion) = EXTRACT(MONTH FROM SYSDATE)
GROUP BY 
    tp.descripcion, sa.descripcion)
WHERE
    total > ANY
    (SELECT COUNT(at.ate_id) AS atenciones
    FROM atencion at
    WHERE TO_CHAR(at.fecha_atencion,'mm') = '09'
    GROUP BY TO_CHAR(at.fecha_atencion,'dd'))
;
-------------
