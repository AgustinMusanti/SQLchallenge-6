-- 1- Elimine la tabla "clientes", si existe.

DROP TABLE IF EXISTS clientes;

-- 2- Créela con la siguiente estructura:

CREATE TABLE clientes (
  codigo    INT UNSIGNED AUTO_INCREMENT,
  nombre    VARCHAR(30) NOT NULL,
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),
  telefono  VARCHAR(11),
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese algunos registros:

('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba','null');
('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585');
('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445');
('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null);
('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685');
('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525');
('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455');
('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null);
('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366');
('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745'); */

INSERT INTO clientes (nombre, domicilio, ciudad, provincia, telefono)
VALUES('Lopez Marcos', 'Colon 111', 'Córdoba','Cordoba',null),
      ('Perez Ana', 'San Martin 222', 'Cruz del Eje','Cordoba','4578585'),
      ('Garcia Juan', 'Rivadavia 333', 'Villa Maria','Cordoba','4578445'),
      ('Perez Luis', 'Sarmiento 444', 'Rosario','Santa Fe',null),
      ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje','Cordoba','4253685'),
      ('Gomez Ines', 'San Martin 666', 'Santa Fe','Santa Fe','0345252525'),
      ('Torres Fabiola', 'Alem 777', 'Villa del Rosario','Cordoba','4554455'),
      ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje','Cordoba',null),
      ('Ramos Betina', 'San Martin 999', 'Cordoba','Cordoba','4223366'),
      ('Lopez Lucas', 'San Martin 1010', 'Posadas','Misiones','0457858745');
      
/* 4- Obtenga el total de los registros que no tienen valor nulo en los teléfonos y coloque un alias 
para dicha columna: */

SELECT COUNT(telefono) AS 'Con telefono'
FROM clientes;

-- 5- Muestre la cantidad de clientes que se apellidan "Perez" colocando un alias para dicha salida:

SELECT COUNT(*) AS 'Perez'
FROM  clientes
WHERE nombre LIKE '%Perez%';

-- 6- Obtenga la cantidad de ciudades DISTINTAS por provincia en las cuales hay clientes, coloque un alias:

SELECT   provincia, COUNT(DISTINCT ciudad) AS 'ciudades'
FROM     clientes
GROUP BY provincia;
