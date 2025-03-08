-- 1- Elimine la tabla, si existe:

 DROP TABLE IF EXISTS peliculas;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:

 CREATE TABLE peliculas(
  nombre   VARCHAR(20),
  actor    VARCHAR(20),
  duracion INTEGER,
  cantidad INTEGER
 );

-- 3- Vea la estructura de la tabla:

 DESCRIBE peliculas;

-- 4- Ingrese los siguientes registros:

 -- ('Mision imposible','Tom Cruise',120,3);
 -- ('Mision imposible 2','Tom Cruise',180,2);
 -- ('Mujer bonita','Julia R.',90,3);
 -- ('Elsa y Fred','China Zorrilla',90,2);

-- 5- Realice un "select" mostrando solamente el nombre y actor de todas las películas:

SELECT nombre, actor FROM peliculas;

-- 6- Muestre el nombre y duración de todas las peliculas.

SELECT nombre, duracion FROM peliculas;

-- 7- Muestre el nombre y la cantidad de copias.

SELECT nombre, cantidad FROM peliculas;
