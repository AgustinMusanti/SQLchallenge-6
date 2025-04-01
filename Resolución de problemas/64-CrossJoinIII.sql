-- 1- Elimine la tabla "clientes" si existe:

DROP TABLE IF EXISTS clientes;

-- 2- Cree la tabla:

CREATE TABLE clientes(
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  sexo      CHAR(1),
  edad      TINYINT
 );

/* 3- Ingrese los siguientes registros:

('Juan Perez','m',45);
('Ana Lopez','f',50);
('Federico Herrero','m',30);
('Mariano Juarez','m',35);
('Maria Torres','f',36);
('Ines Duarte','f',55);
('Alejandra Figueroa','f',40); */

INSERT INTO clientes (nombre, sexo, edad)
VALUES('Juan Perez','m',45),
      ('Ana Lopez','f',50),
      ('Federico Herrero','m',30),
      ('Mariano Juarez','m',35),
      ('Maria Torres','f',36),
      ('Ines Duarte','f',55),
      ('Alejandra Figueroa','f',40);

/* 4- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
      masculino. Use un "join" sin parte "on" y establezca como condición que las personas de la 
      primera tabla sean de sexo femenino y las de la segunda tabla de sexo masculino: */

SELECT c1.nombre, c1.edad, c1.sexo, c2.nombre, c2.edad, c2.sexo
FROM clientes AS c1
JOIN clientes AS c2
WHERE c1.sexo='f' AND c2.sexo='m';

-- 5- Obtenga la misma salida usando "cross join":

SELECT c1.nombre, c1.edad, c1.sexo, c2.nombre, c2.edad, c2.sexo
FROM clientes AS c1
CROSS JOIN clientes AS c2
WHERE c1.sexo='f' AND c2.sexo='m';

/* 6- Se pide, además, que las edades de las posibles parejas no tengan una diferencia superior a
      10 años: */
      
SELECT c1.nombre, c1.edad, c1.sexo, c2.nombre, c2.edad, c2.sexo
FROM clientes AS c1
CROSS JOIN clientes AS c2
WHERE c1.sexo='f' AND c2.sexo='m'AND
c1.edad - c2.edad BETWEEN -10 AND 10;
