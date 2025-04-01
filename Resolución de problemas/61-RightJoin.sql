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
('25333444','Marcelo Pereyra','Sucre 349');

inscriptos:
('22333444','natacion','2015','s');
('22333444','natacion','2016','n');
('23333444','natacion','2015','s');
('23333444','tenis','2016','s');
('23333444','natacion','2016','s');
('24333444','tenis','2016','n');
('24333444','basquet','2016','n'); */

INSERT INTO socios
VALUES('22333444','Juan Perez','Colon 234'),
      ('23333444','Maria Lopez','Sarmiento 465'),
      ('24333444','Antonio Juarez','Caseros 980'),
      ('25333444','Marcelo Pereyra','Sucre 349');
      
INSERT INTO inscriptos
VALUES('22333444','natacion','2015','s'),
      ('22333444','natacion','2016','n'),
      ('23333444','natacion','2015','s'),
      ('23333444','tenis','2016','s'),
      ('23333444','natacion','2016','s'),
      ('24333444','tenis','2016','n'),
      ('24333444','basquet','2016','n');

-- 4- Realice un "left join" de la tabla "socios" a "inscriptos" buscando coincidencia de "documento":

SELECT s.documento, s.nombre, i.deporte, i.año, i.matricula
FROM socios AS s
LEFT JOIN inscriptos AS i
ON s.documento=i.documento;

-- 5- Realice un "right join" para obtener la misma salida anterior:

SELECT s.documento, s.nombre, i.deporte, i.año, i.matricula
FROM inscriptos AS i
RIGHT JOIN socios AS s
ON s.documento=i.documento;

/* 6- Ingrese una inscripción de alguien que no sea socio (documento que no se encuentre en la 
      tabla "socios"): */
      
INSERT INTO inscriptos
VALUES('42835505', 'basquet', '2018','s');

-- 7- Realice un "right join" desde la tabla "socios" a "inscriptos" buscando coincidencia de documento:

SELECT s.documento, s.nombre, i.deporte, i.año
FROM socios AS s
RIGHT JOIN inscriptos AS i
ON i.documento=s.documento;

-- Se observa que la inserción del punto 6) figura como "Null" en la tabla socios ya que no fue cargado alli.
