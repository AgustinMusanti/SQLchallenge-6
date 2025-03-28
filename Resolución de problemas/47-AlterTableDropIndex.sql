-- 1- Elimine la tabla "alumnos" si existe.

DROP TABLE IF EXISTS alumnos;

-- 2- Cree la tabla con los siguientes índices:

CREATE TABLE alumnos(
  año YEAR NOT NULL,
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

-- 4- Elimine el índice único:

ALTER TABLE alumnos
DROP INDEX i_documento;

-- 5- Elimine el índice común:

ALTER TABLE alumnos
DROP INDEX i_ciudadprovincia;

-- 6- Vea los índices:

SHOW INDEX FROM alumnos;
