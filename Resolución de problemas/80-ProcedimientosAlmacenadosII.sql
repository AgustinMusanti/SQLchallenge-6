-- 1- Eliminamos la tabla "empleados", si existe y la creamos:

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
      apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como 
      parámetro. */
      
 delimiter //
 
CREATE PROCEDURE pa_empleados_sueldo(
IN sueldo_minimo DECIMAL(6,2))
BEGIN
SELECT nombre,apellido,sueldo
FROM empleados
WHERE sueldo>=sueldo_minimo;
END //

 delimiter ;

-- 5- Ejecute el procedimiento creado anteriormente con distintos valores:

CALL pa_empleados_sueldo(400);
CALL pa_empleados_sueldo(500);

-- 6- Intente ejecute el procedimiento almacenado "pa_empleados_sueldo" sin parámetros.

CALL pa_empleados_sueldo();

-- Da error, ya que necesita un parametro de entrada de manera obligatoria.

-- 7- Elimine el procedimiento almacenado "pa_empleados_actualizar_sueldo" si existe:

DROP PROCEDURE IF EXISTS pa_empleados_actualizar_sueldo;

/* 8- Cree un procedimiento almacenado llamado "pa_empleados_actualizar_sueldo" que actualice los 
      sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro. */
      
 delimiter //
 
CREATE PROCEDURE pa_empleados_actualizar_sueldo
   (IN sueldoanterior DECIMAL(6,2),
    IN sueldonuevo DECIMAL(6,2))
BEGIN
UPDATE empleados SET sueldo=sueldonuevo
WHERE sueldo=sueldoanterior;
END //

 delimiter ;

-- 9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente:

SELECT * FROM empleados; -- Para chequear antes de llamar al procedimiento almacenado.
CALL pa_empleados_actualizar_sueldo(300, 350);
SELECT * FROM empleados; -- Para chequear luego de llamar al procedimiento almacenado.

-- 10- Ejecute el procedimiento "pa_empleados_actualizar_sueldo" enviando un solo parámetro.

CALL pa_empleados_actualizar_sueldo(350);

-- Nos da error ya que este procedimiento necesita 2 parametros de entrada.
