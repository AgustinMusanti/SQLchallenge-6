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
  matricula CHAR(1), /*si esta paga ='s' sino 'n'*/
  PRIMARY KEY(documento,deporte,año)
 );

/* 3- Ingrese algunos registros para ambas tablas:

socios:
('22333444','Juan Perez','Colon 234');
('23333444','Maria Lopez','Sarmiento 465');
('24333444','Antonio Juarez','Caseros 980');
('25333444','Ana Juarez','Sucre 134');
('26333444','Sofia Herrero','Avellaneda 1234');

inscriptos:
('22333444','natacion','2015','s');
('22333444','natacion','2016','n');
('23333444','natacion','2015','s');
('23333444','tenis','2016','s');
('23333444','natacion','2016','s');
('25333444','tenis','2016','n');
('25333444','basquet','2016','n'); */

INSERT INTO socios
VALUES('22333444','Juan Perez','Colon 234'),
      ('23333444','Maria Lopez','Sarmiento 465'),
      ('24333444','Antonio Juarez','Caseros 980'),
      ('25333444','Ana Juarez','Sucre 134'),
      ('26333444','Sofia Herrero','Avellaneda 1234');
      
INSERT INTO inscriptos
VALUES('22333444','natacion','2015','s'),
      ('22333444','natacion','2016','n'),
      ('23333444','natacion','2015','s'),
      ('23333444','tenis','2016','s'),
      ('23333444','natacion','2016','s'),
      ('25333444','tenis','2016','n'),
      ('25333444','basquet','2016','n');
 
-- 4- Muestre el nombre del socio, deporte y año realizando un join:

SELECT s.nombre, i.deporte, i.año 
FROM socios AS s
LEFT JOIN inscriptos AS i
ON s.documento=i.documento;

-- 5- Muestre los nombres de los socios que no se han inscripto nunca en un deporte:

SELECT s.nombre
FROM socios AS s
LEFT JOIN inscriptos AS i
ON s.documento=i.documento
WHERE deporte IS NULL;
