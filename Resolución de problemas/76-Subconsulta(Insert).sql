-- 1-Cree las tablas (las borramos primero si ya existen):

DROP TABLE IF EXISTS clientes, facturas;

CREATE TABLE clientes(
  codigo    INT AUTO_INCREMENT,
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY(codigo)
 );

CREATE TABLE facturas(
  numero        INT NOT NULL,
  fecha         DATE,
  codigocliente INT NOT NULL,
  total         DECIMAL(6,2),
  PRIMARY KEY(numero)
 );

-- 2-Ingrese algunos registros:

INSERT INTO clientes(nombre,domicilio) 
VALUES('Juan Lopez','Colon 123'),
      ('Luis Torres','Sucre 987'),
      ('Ana Garcia','Sarmiento 576'),
      ('Susana Molina','San Martin 555');

INSERT INTO facturas 
VALUES(1200,'2018-01-15',1,300),
      (1201,'2018-01-15',2,550),
      1202,'2018-01-15',3,150),
      (1300,'2018-01-20',1,350),
      (1310,'2018-01-22',3,100);

/* 3- El comercio necesita una tabla llamada "clientespref" en la cual quiere almacenar el nombre y 
      domicilio de aquellos clientes que han comprado hasta el momento más de 500 pesos en mercaderías. */

CREATE TABLE clientespref(
  nombre    VARCHAR(30),
  domicilio VARCHAR(30)
 );

/* 4- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y 
      "facturas". */
      
INSERT INTO clientespref (nombre,domicilio) 
SELECT nombre,domicilio
FROM clientes AS c
INNER JOIN facturas AS f 
ON f.codigocliente=c.codigo
GROUP BY codigocliente
HAVING SUM(total)>500;

-- 5- Vea los registros de "clientespref":

SELECT * FROM clientespref;
