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

/* 3- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se 
      inscribieron en 'natacion'. */

SELECT nombre
FROM socios AS s
WHERE EXISTS
   (SELECT * FROM inscriptos AS i
	WHERE s.numero=i.numerosocio
	AND i.deporte='natacion');
 
-- Esta subconsulta se puede realizar más facil con el siguiente JOIN:

SELECT s.nombre
FROM socios AS s
JOIN inscriptos AS i
ON s.numero=i.numerosocio
WHERE i.deporte='natacion'; 


-- 4- Busque los socios que NO se han inscripto en 'natacion' empleando "not exists".

SELECT nombre
FROM socios AS s
WHERE NOT EXISTS
   (SELECT * FROM inscriptos AS i
	WHERE s.numero=i.numerosocio
	AND i.deporte='natacion');


-- 5- Muestre todos los datos de los socios que han pagado todas las cuotas.

-- Usando subconsultas:

SELECT s.*
FROM socios AS s
WHERE EXISTS
   (SELECT * FROM inscriptos AS i
    WHERE s.numero=i.numerosocio
    AND i.cuotas=10); 
    
-- Usando JOIN:

SELECT s.*
FROM socios AS s
JOIN inscriptos AS i 
ON s.numero = i.numerosocio
WHERE i.cuotas= 10;
