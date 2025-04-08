-- 1- Cree las tablas con las siguientes estructuras:

DROP TABLE IF EXISTS socios, deportes, inscriptos;

CREATE TABLE socios(
  documento CHAR(8) NOT NULL, 
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );
 
CREATE TABLE deportes(
  codigo   INT AUTO_INCREMENT,
  nombre   VARCHAR(20),
  profesor VARCHAR(15),
  PRIMARY KEY(codigo)
 );
 
CREATE TABLE inscriptos(
  documento     CHAR(8) NOT NULL, 
  codigodeporte SMALLINT NOT NULL,
  año           CHAR(4),
  matricula     CHAR(1), -- 's'=paga, 'n'=impaga
  PRIMARY KEY(documento,codigodeporte,año)
 );

-- 2- Ingrese algunos registros en las 3 tablas:

INSERT INTO socios
VALUES('22222222','Ana Acosta','Avellaneda 111'),
      ('23333333','Betina Bustos','Bulnes 222'),
      ('24444444','Carlos Castro','Caseros 333'),
      ('25555555','Daniel Duarte','Dinamarca 44');

INSERT INTO deportes(nombre,profesor)
VALUES('basquet','Juan Juarez'),
      ('futbol','Pedro Perez'),
      ('natacion','Marina Morales'),
      ('tenis','Marina Morales');

INSERT INTO inscriptos
VALUES('22222222',3,'2006','s'),
	  ('23333333',3,'2006','s'),
      ('24444444',3,'2006','n'),
	  ('22222222',3,'2005','s'),
      ('22222222',3,'2007','n'),
      ('24444444',1,'2006','s'),
      ('24444444',2,'2006','s');

/* 3- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
      nombre del deporte y del profesor. */
      
SELECT i.documento,i.codigodeporte,d.nombre AS deporte, año, matricula, d.profesor
FROM deportes AS d
JOIN inscriptos AS i
ON d.codigo=i.codigodeporte;

/* 4- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
      tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
      el año, el nombre del profesor y la matrícula. */
      
SELECT s.nombre,td.deporte,td.profesor,td.año,td.matricula
FROM socios AS s
JOIN (SELECT i.documento,i.codigodeporte,d.nombre AS deporte, año, matricula, d.profesor
	  FROM deportes AS d
	  JOIN inscriptos AS i
	  ON d.codigo=i.codigodeporte) AS td
      ON td.documento=s.documento;  
