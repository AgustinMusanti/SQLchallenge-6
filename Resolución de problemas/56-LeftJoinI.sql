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

-- 4- Queremos saber de qué provincias no tenemos clientes:

SELECT p.codigo,p.nombre FROM provincias AS p
LEFT JOIN clientes AS c
ON c.codigoProvincia=p.codigo
WHERE c.codigoprovincia IS NULL;

-- 5- Queremos saber de qué provincias si tenemos clientes, sin repetir el nombre de la provincia:

SELECT DISTINCT p.codigo,p.nombre FROM provincias AS p
LEFT JOIN clientes AS c
ON c.codigoProvincia=p.codigo
WHERE c.codigoprovincia IS NOT NULL;

-- Esto podriamos haberlo hecho mas facil mediante un JOIN, como se detalla en la sentencia de abajo:

SELECT DISTINCT p.codigo,p.nombre FROM provincias AS p
JOIN clientes AS c
ON c.codigoProvincia=p.codigo;

/* 6- Omita la referencia a las tablas en la condición "on" para verificar que la sentencia no se 
ejecuta porque el nombre del campo "codigo" es ambiguo (ambas tablas lo tienen): */

SELECT DISTINCT p.codigo,p.nombre FROM provincias AS p
LEFT JOIN clientes AS c
ON codigoProvincia=codigo
WHERE c.codigoprovincia IS NOT NULL;

/* Como dice el enunciado, comprobamos que la sentencia no se ejecuta al presentar 
   la ambiguedad por no haber definido a que tabla corresponde cada codigo. */
