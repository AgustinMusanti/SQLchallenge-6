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

/* 3- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
      deportes a los cuales se ha inscripto, empleando subconsulta. */

SELECT nombre,domicilio,
  (SELECT COUNT(*)
    FROM inscriptos AS i
    WHERE s.numero=i.numerosocio) AS deportes
    FROM socios AS s
    ORDER BY deportes DESC;


/* 4- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
      deporte) y el total de cuotas pagas, empleando subconsulta. */

SELECT nombre,
  (SELECT (COUNT(*)*10)
    FROM inscriptos AS i
    WHERE s.numero=i.numerosocio) AS total,
  (SELECT SUM(i.cuotas)
    FROM inscriptos AS i
    WHERE s.numero=i.numerosocio) AS pagas
 FROM socios AS s;


-- 5- Obtenga la misma salida anterior empleando join.

SELECT nombre,
  COUNT(i.deporte)*10 AS total,
  SUM(i.cuotas) AS pagas
FROM socios AS s
JOIN inscriptos AS i
ON numero=numerosocio
GROUP BY s.nombre;

-- Es mucho más sencillo de esta forma
