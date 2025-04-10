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

/* 4- Cree un procedimiento almacenado llamado "pa_seccion" al cual le enviamos el nombre de una 
      sección y que nos retorne el promedio de sueldos de todos los empleados de esa sección y el valor 
      mayor de sueldo (de esa sección) */
      
delimiter //

CREATE PROCEDURE pa_seccion(
IN p_seccion VARCHAR(20),
OUT promedio FLOAT,
OUT mayor FLOAT)
BEGIN
SELECT AVG(sueldo) INTO promedio
FROM empleados
WHERE seccion=p_seccion;
SELECT MAX(sueldo) INTO mayor
FROM empleados
WHERE seccion=p_seccion; 
END // 
 
 delimiter ;    


-- 5- Ejecute el procedimiento creado anteriormente con distintos valores.

CALL pa_seccion('Contaduria', @p, @m);
SELECT @p,@m;
 
CALL pa_seccion('Secretaria', @p, @m);
SELECT @p,@m;
