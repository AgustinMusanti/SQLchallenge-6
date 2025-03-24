-- 1- Elimine la tabla "alumnos" si existe.

DROP TABLE IF EXISTS alumnos;

/* 2- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
      inscripto), un índice único por el campo "documento" y un índice común por ciudad y provincia: */
      
CREATE TABLE alumnos(
  año       YEAR NOT NULL,
  numero    INT UNSIGNED NOT NULL,
  nombre    VARCHAR(30),
  documento CHAR(8) NOT NULL,
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),  
  PRIMARY KEY(año,numero),
  UNIQUE i_documento (documento),
  INDEX i_ciudadprovincia (ciudad,provincia)
 );

-- 3- Vea los índices de la tabla.

SHOW INDEX FROM alumnos;

-- 4- Elimine el índice "i_ciudadprovincia".

DROP INDEX i_ciudadprovincia ON alumnos;

-- 5- Verifique la eliminación.

SHOW INDEX FROM alumnos; /* Comprobamos que se elimino correctamente */

-- 6- Intente eliminar el índice PRIMARY.

DROP INDEX PRIMARY ON alumnos; /* Vemos que no es posible eliminar la Primary Key */

-- 7- Elimine el índice único.

DROP INDEX i_documento ON alumnos;

-- 8- Verifique la eliminación.

SHOW INDEX FROM alumnos; /* Se observa que el indice UNIQUE se elimina correctamente */
