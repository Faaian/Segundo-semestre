-- Caso 1
SELECT
  'El empleado '  || nombre_emp ||' '|| appaterno_emp ||' '|| apmaterno_emp 
  || ' nacio el ' || fecnac_emp
  AS "LISTADO DE CUMPLEAÑOS"
FROM empleado
ORDER BY fecnac_emp ASC, appaterno_emp ASC;

-- Caso 2
SELECT
    numrut_cli AS "NUMERO RUT",
    dvrut_cli AS "DIGITO VERIFICADOR",
    appaterno_cli || ' ' || apmaterno_cli || ' ' || nombre_cli  AS "NOMBRE CLIENTE",
    renta_cli AS "RENTA",
    fonofijo_cli AS "TELEFONO FIJO",
    celular_cli AS "CELULAR"
FROM cliente
ORDER BY appaterno_cli ASC, apmaterno_cli ASC;

-- Caso 3
SELECT
   nombre_emp ||' '|| appaterno_emp || ' ' || apmaterno_emp AS "NOMBRE EMPLEADO",
   sueldo_emp AS "SUELDO",
   sueldo_emp * 0.50 AS "BONO POR CAPACITACION"
FROM empleado
ORDER BY "BONO POR CAPACITACION" DESC;

-- Caso 4
SELECT
    nro_propiedad AS "NRO PROPIEDAD",
    numrut_prop AS "RUT PROPIETARIO",
    direccion_propiedad AS "DIRECCION",
    valor_arriendo AS "VALOR ARRIENDO"
FROM propiedad
ORDER BY numrut_prop ASC;

