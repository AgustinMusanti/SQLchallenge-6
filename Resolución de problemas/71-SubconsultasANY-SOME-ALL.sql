-- 1- Borre las tablas si existen y luego cree las tablas:
 
DROP TABLE IF EXISTS socios, inscriptos;

CREATE TABLE socios(
  numero    INT AUTO_INCREMENT,
  documento CHAR(8),
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY(numero)
 );
 
CREATE TABLE inscriptos (
  numerosocio INT NOT NULL,
  deporte     VARCHAR(20) NOT NULL,
  cuotas      SMALLINT,
  PRIMARY KEY(numerosocio,deporte)
 );

-- 2- Ingrese algunos registros:

INSERT INTO socios(documento,nombre,domicilio) 
VALUES('23333333','Alberto Paredes','Colon 111'),
      ('24444444','Carlos Conte','Sarmiento 755'),
      ('25555555','Fabian Fuentes','Caseros 987'),
      ('26666666','Hector Lopez','Sucre 344');

INSERT INTO inscriptos 
VALUES(1,'tenis',1),
      (1,'basquet',2),
      (1,'natacion',1),
      (2,'tenis',9),
      (2,'natacion',1),
      (2,'basquet',default),
      (2,'futbol',2),
      (3,'tenis',8),
      (3,'basquet',9),
      (3,'natacion',0),
      (4,'basquet',10);

/* 3- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
      ambas tablas. */
      
SELECT s.numero,s.nombre,i.deporte
FROM socios AS s
JOIN inscriptos AS i
ON numerosocio=numero; 


-- 4- Muestre los socios que serán compañeros en tenis y también en natación (empleando subconsulta)

SELECT nombre
FROM socios
JOIN inscriptos AS i
ON numero=numerosocio
WHERE deporte='natacion' AND
  numero= ANY
  (SELECT numerosocio
   FROM inscriptos AS i
   WHERE deporte='tenis'); 
   
-- Debajo muestro una manera de realizarlo sin utilizar subconsulta:

SELECT s.nombre
FROM socios s
JOIN inscriptos i1 
ON s.numero = i1.numerosocio AND i1.deporte = 'tenis'
JOIN inscriptos i2 
ON s.numero = i2.numerosocio AND i2.deporte = 'natacion';


-- 5- Vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.

SELECT deporte
FROM inscriptos AS i
WHERE numerosocio=1 AND
  deporte= ANY
   (SELECT deporte
    FROM inscriptos AS i
    WHERE numerosocio=2);

-- 6- Obtenga el mismo resultado anterior pero empleando join.

SELECT DISTINCT i1.deporte
FROM inscriptos i1
JOIN inscriptos i2 
  ON i1.deporte = i2.deporte
WHERE i1.numerosocio = 1 AND i2.numerosocio = 2;


/* 7- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
      inscribió el socio 1. */
      
SELECT deporte
FROM inscriptos AS i
WHERE numerosocio=2 AND
  cuotas>ANY
   (SELECT cuotas
    FROM inscriptos
    WHERE numerosocio=1);

/* 8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
      inscribió el socio 1. */
      
SELECT deporte
FROM inscriptos AS i
WHERE numerosocio=2 AND
  cuotas>ALL
   (SELECT cuotas
    FROM inscriptos
    WHERE numerosocio=1);
