-- 1- Eliminamos la tabla, si existe y la creamos:

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados(
  documento     CHAR(8),
  nombre        VARCHAR(20),
  apellido      VARCHAR(20),
  sueldo        DECIMAL(6,2),
  cantidadhijos INT,
  seccion       VARCHAR(20),
  PRIMARY KEY(documento)
 );

-- 2- Ingrese algunos registros:

INSERT INTO empleados
VALUES('22222222','Juan','Perez',300,2,'Contaduria'),
      ('22333333','Luis','Lopez',300,0,'Contaduria'),
      ('22444444','Marta','Perez',500,1,'Sistemas'),
      ('22555555','Susana','Garcia',400,2,'Secretaria'),
      ('22666666','Jose Maria','Morales',400,3,'Secretaria');

-- 3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:

DROP PROCEDURE IF EXISTS pa_empleados_sueldo;

/* 4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
      apellidos y sueldos de los empleados. */

 delimiter //
 
CREATE PROCEDURE pa_empleados_sueldo()
BEGIN
SELECT nombre,apellido,sueldo
FROM empleados;

END//

 delimiter ;

-- 5- Ejecute el procedimiento creado anteriormente.

CALL pa_empleados_sueldo();

-- 6- Elimine el procedimiento llamado "pa_empleados_hijos" si existe:

DROP PROCEDURE IF EXISTS pa_empleados_hijos;

/* 7- Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
      apellidos y cantidad de hijos de los empleados con hijos. */

 delimiter //
 
CREATE PROCEDURE pa_empleados_hijos()
BEGIN
SELECT nombre,apellido,cantidadhijos
FROM empleados
WHERE cantidadhijos>0;
END //

 delimiter ;

-- 8- Ejecute el procedimiento creado anteriormente.

CALL pa_empleados_hijos();

/* 9- Actualice la cantidad de hijos de algún empleado sin hijos y vuelva a ejecutar el procedimiento 
      para verificar que ahora si aparece en la lista. */

UPDATE empleados SET cantidadhijos=1 
WHERE documento='22333333';

CALL pa_empleados_hijos();
