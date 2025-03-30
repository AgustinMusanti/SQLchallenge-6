-- 1- Elimine las tablas "socios" e "inscriptos" si existen.

DROP TABLE IF EXISTS socios, inscriptos;

-- 2- Cree las tablas:

CREATE TABLE socios(
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );

CREATE TABLE inscriptos(
  documento CHAR(8) NOT NULL, 
  deporte   VARCHAR(15) NOT NULL,
  año       YEAR,
  matricula CHAR(1),  -- si esta paga ='s' sino 'n'
  PRIMARY KEY(documento,deporte,año)
 );

/* 3- Ingrese algunos registros para ambas tablas:

socios:
('22333444','Juan Perez','Colon 234');
('23333444','Maria Lopez','Sarmiento 465');
('24333444','Antonio Juarez','Caseros 980');

inscriptos:
('22333444','natacion','2005','s');
('22333444','natacion','2006','n');
('23333444','natacion','2005','s');
('23333444','tenis','2006','s');
('23333444','natacion','2006','s');
('24333444','tenis','2006','n');
('24333444','basquet','2006','n'); */

INSERT INTO socios
VALUES('22333444','Juan Perez','Colon 234'),
      ('23333444','Maria Lopez','Sarmiento 465'),
      ('24333444','Antonio Juarez','Caseros 980');
      
INSERT INTO inscriptos
VALUES('22333444','natacion','2005','s'),
      ('22333444','natacion','2006','n'),
      ('23333444','natacion','2005','s'),
      ('23333444','tenis','2006','s'),
      ('23333444','natacion','2006','s'),
      ('24333444','tenis','2006','n'),
      ('24333444','basquet','2006','n');

-- 4- Muestre el nombre del socio y todos los campos de la tabla "inscriptos":

SELECT s.nombre, i.*
FROM socios AS s
JOIN inscriptos AS i
ON   s.documento=i.documento;

-- 5- Muestre el nombre de los socios y los deportes en los cuales están inscriptos en 2006:

SELECT s.nombre, i.deporte
FROM socios AS s
JOIN inscriptos AS i
ON   s.documento=i.documento
WHERE año=2006;

-- 6- Muestre el nombre y todas las inscripciones del socio con número de documento='23333444':

SELECT s.nombre, i.deporte
FROM socios AS s
JOIN inscriptos AS i
ON   s.documento=i.documento
WHERE s.documento='23333444';
