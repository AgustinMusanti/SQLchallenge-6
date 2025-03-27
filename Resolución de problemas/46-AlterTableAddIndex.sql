-- 1- Elimine la tabla "alumnos" si existe.

DROP TABLE IF EXISTS alumnos;

-- 2- Cree la tabla:

CREATE TABLE alumnos(
  legajo    INT UNSIGNED AUTO_INCREMENT,
  nombre    VARCHAR(30),
  documento CHAR(8) NOT NULL,
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),
  PRIMARY KEY(legajo)
 );

-- 3- Vea los índices de la tabla.

SHOW INDEX FROM alumnos;

-- 4- Agregue un índice común por los campos "ciudad" y "provincia" (que pueden repetirse):

ALTER TABLE alumnos
ADD INDEX i_ciudadprovincia(ciudad,provincia);

-- 5- Agregue un índice único (no pueden repetirse los valores) por el campo "documento":

ALTER TABLE alumnos
ADD UNIQUE INDEX i_documento (documento);

-- 6- Visualice los índices:

SHOW INDEX FROM alumnos;
