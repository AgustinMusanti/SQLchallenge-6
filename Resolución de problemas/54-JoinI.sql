-- 1- Elimine la tabla "clientes" y "provincias", si existen:

DROP TABLE IF EXISTS clientes, provincias;

-- 2- Créelas con las siguientes estructuras:

CREATE TABLE clientes (
  codigo          INT UNSIGNED AUTO_INCREMENT,
  nombre          VARCHAR(30) NOT NULL,
  domicilio       VARCHAR(30),
  ciudad          VARCHAR(20),
  codigoprovincia TINYINT UNSIGNED,
  telefono        VARCHAR(11),
  PRIMARY KEY(codigo)
 );

CREATE TABLE provincias(
  codigo TINYINT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(20),
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese algunos registros para ambas tablas:

provincias:
('Cordoba');
('Santa Fe');
('Corrientes');
('Misiones');
('Salta');
('Buenos Aires');
('Neuquen');

clientes:
('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745'); */

INSERT INTO provincias (nombre)
VALUES('Cordoba'),
      ('Santa Fe'),
      ('Corrientes'),
      ('Misiones'),
      ('Salta'),
      ('Buenos Aires'),
      ('Neuquen');
      
INSERT INTO clientes (nombre, domicilio, ciudad, codigoprovincia, telefono)
VALUES('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null'),
      ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585'),
      ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445'),
      ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null),
      ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685'),
      ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525'),
      ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455'),
      ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null),
      ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366'),
      ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745'); 

-- 4- Obtenga los datos de ambas tablas, use alias:

SELECT c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
FROM clientes AS c
JOIN provincias AS p
ON   c.codigoProvincia=p.codigo;

-- 5- Obtenga la misma información anterior pero ordenada por nombre del cliente:

SELECT c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
FROM clientes AS c
JOIN provincias AS p
ON   c.codigoProvincia=p.codigo
ORDER BY c.nombre;

/* 6- Omita la referencia a las tablas en la condición "on" para verificar que la sentencia no se 
ejecuta porque el nombre del campo "codigo" es ambiguo (ambas tablas lo tienen): */

SELECT c.nombre,c.domicilio,c.ciudad,p.nombre,c.telefono
FROM clientes AS c
JOIN provincias AS p
ON   codigoProvincia=codigo;

/* Comprobe que, tal como cuenta el enunciado, la sentencia no se ejecuta porque ambas
   tablas cuentan con "coidgo", por lo que MySQL interpreta como "ambiguo". */
