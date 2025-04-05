/*1- Cree la tabla "clientes" (codigo, nombre, domicilio, ciudad, codigociudad) y "ciudades" (codigo, 
     nombre). Agregue una restricción "primary key" para el campo "codigo" de ambas tablas): */
     
DROP TABLE IF EXISTS clientes, ciudades;

CREATE TABLE ciudades(
  codigo INT AUTO_INCREMENT,
  nombre VARCHAR(20),
  PRIMARY KEY(codigo)
 );

CREATE TABLE clientes (
  codigo       INT AUTO_INCREMENT,
  nombre       VARCHAR(30),
  domicilio    VARCHAR(30),
  codigociudad SMALLINT NOT NULL,
  PRIMARY KEY(codigo)
 );

-- 2- Ingrese algunos registros para ambas tablas:

INSERT INTO ciudades (nombre) 
VALUES('Cordoba'),
      ('Cruz del Eje'),
      ('Carlos Paz'),
      ('La Falda'),
      ('Villa Maria');

INSERT INTO clientes(nombre,domicilio,codigociudad)
VALUES('Lopez Marcos','Colon 111',1),
      ('Lopez Hector','San Martin 222',1),
      ('Perez Ana','San Martin 333',2),
      ('Garcia Juan','Rivadavia 444',3),
      ('Perez Luis','Sarmiento 555',3),
      ('Gomez Ines','San Martin 666',4),
      ('Torres Fabiola','Alem 777',5),
      ('Garcia Luis','Sucre 888',5);

/* 3- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle 
      "San Martin", empleando subconsulta. */
      
SELECT nombre
FROM ciudades
WHERE codigo IN
     (SELECT codigociudad
	    FROM clientes
      WHERE domicilio LIKE 'San Martin %'); 

-- 4- Obtenga la misma salida anterior pero empleando join.

SELECT DISTINCT ci.nombre
FROM ciudades AS ci
JOIN clientes AS cl
ON codigociudad=ci.codigo
WHERE domicilio LIKE 'San Martin%'; 

-- En este caso, en mi opinion, es mas facil y eficiente utilizar JOIN.

/* 5- Obtenga los nombres de las ciudades de los clientes cuyo apellido no comienza con una letra 
      específica, empleando subconsulta. */
      
SELECT nombre
FROM ciudades
WHERE codigo NOT IN
    (SELECT codigociudad
     FROM clientes
     WHERE nombre LIKE 'G%');   


/* 6- Pruebe la subconsulta del punto 5 separada de la consulta exterior para verificar que retorna 
      una lista de valores de un solo campo. */
      
SELECT codigociudad
FROM clientes
WHERE nombre LIKE 'G%';      
