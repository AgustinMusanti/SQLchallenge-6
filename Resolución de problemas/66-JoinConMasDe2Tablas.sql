-- 1- Elimine las tablas "peliculas", "socios" y "alquileres" si existen.

DROP TABLE IF EXISTS peliculas, socios, alquileres;

-- 2- Créelas con las siguientes estructuras:

CREATE TABLE peliculas (
  codigo   SMALLINT UNSIGNED AUTO_INCREMENT,
  titulo   VARCHAR(40) NOT NULL,
  actores  VARCHAR(40),
  duracion TINYINT UNSIGNED,
  PRIMARY KEY(codigo)
 );

CREATE TABLE socios(
  codigo    SMALLINT UNSIGNED AUTO_INCREMENT,
  documento CHAR(8),
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY(codigo)
 );
 
CREATE TABLE alquileres(
  codigopelicula  SMALLINT UNSIGNED NOT NULL,
  codigosocio     SMALLINT UNSIGNED NOT NULL,
  fechaprestamo   DATE NOT NULL,
  fechadevolucion DATE,
  PRIMARY KEY(codigopelicula,fechaprestamo)
 );

/* 3- Ingrese los siguientes registros para las 3 tablas.

peliculas:
('Elsa y Fred','China Zorrilla',90);
('Mision imposible','Tom Cruise',120);
('Mision imposible 2','Tom Cruise',180);
('Harry Potter y la piedra filosofal','Daniel H.',120);
('Harry Potter y la camara secreta','Daniel H.',150);

socios:
('22333444','Juan Lopez');
('23333444','Diana Perez');
('24333444','Luis Fuentes');

alquileres:
(1,1,'2016-07-02','2016-07-10'),
(2,1,'2016-07-02', NULL),
(3,1,'2016-07-12','2016-07-20'),
(1,2,'2016-08-02','2016-08-10'),
(3,2,'2016-08-12', NULL),
(4,2,'2016-08-02','2016-08-15'),
(1,3,'2016-09-02', NULL),
(2,3,'2016-08-02','2016-08-12'),
(3,3,'2016-08-15','2016-08-22'),
(4,3,'2016-08-22', NULL),
(4,1,'2016-08-25','2016-09-01'),
(1,3,'2016-08-25', NULL); */

INSERT INTO peliculas (titulo, actores, duracion)
VALUES('Elsa y Fred','China Zorrilla',90),
      ('Mision imposible','Tom Cruise',120),
      ('Mision imposible 2','Tom Cruise',180),
      ('Harry Potter y la piedra filosofal','Daniel H.',120),
      ('Harry Potter y la camara secreta','Daniel H.',150);

INSERT INTO socios (documento, nombre)
VALUES('22333444','Juan Lopez'),
      ('23333444','Diana Perez'),
      ('24333444','Luis Fuentes');
      
INSERT INTO alquileres 
VALUES(1,1,'2016-07-02','2016-07-10'),
      (2,1,'2016-07-02', NULL),
      (3,1,'2016-07-12','2016-07-20'),
      (1,2,'2016-08-02','2016-08-10'),
      (3,2,'2016-08-12', NULL),
      (4,2,'2016-08-02','2016-08-15'),
      (1,3,'2016-09-02', NULL),
      (2,3,'2016-08-02','2016-08-12'),
      (3,3,'2016-08-15','2016-08-22'),
      (4,3,'2016-08-22', NULL),
      (4,1,'2016-08-25','2016-09-01'),
      (1,3,'2016-08-25', NULL);
      
/* 4- Muestre toda la información de los "alquileres" (nombre de la película, nombre del socio, fecha 
      de préstamo y de devolución): */
      
SELECT p.titulo, s.nombre, a.fechaprestamo, a.fechadevolucion
FROM alquileres AS a
JOIN peliculas AS p
ON p.codigo=a.codigopelicula
JOIN socios AS s
ON s.codigo=a.codigosocio;

-- 5- Muestre la cantidad de veces que se alquiló cada película:

SELECT p.titulo, COUNT(*) AS 'Cantidad alquilada'
FROM peliculas AS p
JOIN alquileres AS a
ON p.codigo=a.codigopelicula
GROUP BY titulo
ORDER BY COUNT(*) DESC;

-- 6- Muestre la cantidad de películas que alquiló cada socio:

SELECT s.nombre, COUNT(codigopelicula) AS 'Cantidad alquilada'
FROM socios AS s
JOIN alquileres AS a
ON s.codigo=a.codigosocio
GROUP BY s.nombre
ORDER BY COUNT(*) DESC;

-- 7- Muestre la cantidad de películas DISTINTAS que alquiló cada socio:

SELECT s.nombre, COUNT(DISTINCT a.codigopelicula) AS 'Cantidad alquilada'
FROM socios AS s
JOIN alquileres AS a
ON s.codigo=a.codigosocio
GROUP BY s.nombre
ORDER BY COUNT(*) DESC;

-- 8- Muestre la cantidad de películas alquiladas por cada socio ordenado por mes:
 
SELECT s.nombre,
MONTHNAME(a.fechaprestamo) AS mes,
COUNT(a.codigopelicula) AS 'Cantidad alquilada'
FROM socios AS s
JOIN alquileres AS a
ON s.codigo=a.codigosocio
GROUP BY s.nombre, mes
ORDER BY mes;
