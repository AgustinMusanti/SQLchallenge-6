-- 1- Elimine la tabla "peliculas", si existe.

DROP TABLE IF EXISTS peliculas;

-- 2- Cree la tabla "peliculas":

CREATE TABLE peliculas(
  codigo   INT UNSIGNED,
  titulo   VARCHAR(40),
  duracion TINYINT UNSIGNED
 );

-- 3- Cambie el nombre de la tabla por "films" con "alter table":

ALTER TABLE peliculas 
RENAME films;

-- 4- Vea si existen las tablas "peliculas" y "films":

SHOW TABLES;

-- Vemos que "peliculas" no existe, pero si "films".

-- 5- Cambie nuevamente el nombre, de la tabla "films" por "peliculas" usando "rename":

RENAME TABLE films TO peliculas;

-- 6- vea si existen las tablas:

SHOW TABLES;

-- Ahora vemos que existe "peliculas", pero "films" ya no.
