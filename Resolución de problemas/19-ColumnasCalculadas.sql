-- 1- Elimine la tabla "empleados" si existe.

SELECT FALTA TERMINAAAAAARRRR

DROP TABLE IF EXISTS empleados;

/* 2- Cree una tabla llamada "empleados" con la estructura necesaria para almacenar la siguiente información:

 - nombre del empleado,
 - documento,
 - sexo,
 - domicilio,
 - sueldo básico (hasta 9999.99),
 - hijos a cargo,
 - clave primaria: documento. */

CREATE TABLE empleados(
 nombre VARCHAR(25) NOT NULL,
 documento INT UNIQUE,
 sexo ENUM('m','f'),
 domicilio VARCHAR(35) DEFAULT 'Desconocido',
 sueldo DECIMAL(5,2) CHECK (sueldo <= 9999.99),
 hijos TINYINT UNSIGNED,
 PRIMARY KEY(documento));
 

3- Ingrese algunos registros:
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Juan Perez','22333444','m',300,1);
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Ana Acosta','21333444','f',400,2);
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Alberto Lopez','24333444','m',600,0);
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Carlos Sanchez','30333444','m',550,3);
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Mariana Torres','23444555','f',600,1);
 insert into empleados (nombre,documento,sexo,sueldobasico,hijos)
  values ('Marcos Garcia','23664555','m',1500,2);

4- La empresa está pensando en aumentar un 10% el sueldo a los empleados, y quiere saber a cuánto 
subiría cada sueldo básico, para ello usamos la siguiente sentencia en la cual incluimos una 
columna que hará el cálculo de cada sueldo más el 10%: 
 select nombre, sueldobasico,sueldobasico+sueldobasico*1/10
  from empleados;

5- La empresa paga un salario familiar por hijos a cargo, $200 por cada hijo. Necesitamos el nombre 
del empleado, el sueldo básico, la cantidad de hijos a cargo, el total del salario familiar y el 
suedo final (incluyendo el salario familiar):
 select nombre, sueldobasico,hijos,(200*hijos),sueldobasico+(200*hijos)
  from empleados;
