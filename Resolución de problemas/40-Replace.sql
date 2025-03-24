-- 1- Elimine la tabla " alumnos" si existe:

DROP TABLE IF EXISTS alumnos;

-- 2- Cree la tabla:

CREATE TABLE alumnos(
  legajo    INT(10) UNSIGNED AUTO_INCREMENT,
  nombre    VARCHAR(30),
  documento CHAR(8),
  domicilio VARCHAR(30),
  PRIMARY KEY(legajo),
  UNIQUE i_documento (documento)
 );

/* 3- Ingrese algunos registros:

('1353','Juan Lopez','22333444','Colon 123');
('2345','Ana Acosta','24000555','Caseros 456');
('2356','Jose Torres','26888777','Sucre 312');
('3567','Luis Perez','28020020','Rivadavia 234'); */

INSERT INTO alumnos
VALUES('1353','Juan Lopez','22333444','Colon 123'),
      ('2345','Ana Acosta','24000555','Caseros 456'),
      ('2356','Jose Torres','26888777','Sucre 312'),
      ('3567','Luis Perez','28020020','Rivadavia 234');

-- 4- Intente ingresar un registro con clave primaria repetida (legajo "3567"):

INSERT INTO alumnos 
VALUES('3567','Marcos Pereyra','30000333','Guemes 134');

-- No es posible ingresar registros con clave primaria repetida.

-- 5- Ingrese el registro anterior reemplazando el existente:

REPLACE INTO alumnos
VALUES('3567','Marcos Pereyra','30000333','Guemes 134');

-- Observamos que REPLACE elimina el registro anterior y lo reemplaza por el nuevo.

-- 6- Intente ingresar un alumno con documento repetido:

INSERT INTO alumnos 
VALUES('4567','Susana Juarez','30000333','Avellaneda 33');

-- No es posible dicha insercion ya que hemos definido que el documento es UNIQUE.

-- 7- Reemplace el registro del enunciado anterior:

REPLACE INTO alumnos 
VALUES('4567','Susana Juarez','30000333','Avellaneda 33');

SELECT * FROM alumnos;

-- Vemos que el alumno con documento "30000333" se eliminó y se reemplazó por el nuevo registro.

-- 8- Elimine el índice único:

DROP INDEX i_documento ON alumnos;

/* 9- Ingrese con "replace" el siguiente registro con documento existente:
      ('4888','Gustavo Garcia','30000333','San Martin 846') */
      
REPLACE INTO alumnos 
VALUES('4888','Gustavo Garcia','30000333','San Martin 846');

-- Como hemos eliminado el indice UNIQUE esta vez no hubo eliminación, solamente inserción.

-- 10- Muestre todos los registros:

SELECT * FROM alumnos;

-- Vemos que hay dos alumnos con el mismo número de documento. Esto se debe a la eliminacion de UNIQUE. 
