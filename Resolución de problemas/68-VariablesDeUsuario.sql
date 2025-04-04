-- 1- Elimine la tabla "peliculas" si existe.

DROP TABLE IF EXISTS peliculas;

-- 2- Créela con la siguiente estructura:
 
CREATE TABLE peliculas (
  codigo   SMALLINT UNSIGNED AUTO_INCREMENT,
  titulo   VARCHAR(40) NOT NULL,
  actor    VARCHAR(30),
  duracion TINYINT UNSIGNED,
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese los siguientes registros:

('Elsa y Fred','China Zorrilla',90);
('Mision imposible','Tom Cruise',120);
('Mision imposible 2','Tom Cruise',180);
('Harry Potter y la piedra filosofal','Daniel H.',120);
('Harry Potter y la camara secreta','Daniel H.',150); */

INSERT INTO peliculas (titulo, actor,duracion)
VALUES('Elsa y Fred','China Zorrilla',90),
      ('Mision imposible','Tom Cruise',120),
      ('Mision imposible 2','Tom Cruise',180),
      ('Harry Potter y la piedra filosofal','Daniel H.',120),
      ('Harry Potter y la camara secreta','Daniel H.',150);

-- 4- Guarde en dos variables el valor de duración de la película más larga y el de la más corta:

SELECT @mayorduracion:=MAX(duracion), 
       @menorduracion:= MIN(duracion) 
FROM peliculas;

-- 5- Muestre todos los datos de ambas peliculas; 

SELECT * FROM peliculas
WHERE duracion=@mayorduracion 
OR    duracion=@menorduracion;

-- 6- Guarde en una variable el nombre del actor de la película de mayor duración:

SELECT @actor:=actor
FROM peliculas
WHERE duracion=@mayorduracion;

-- 7- Muestre todas las películas en las cuales trabaja el autor almacenado en la variable "@actor":

SELECT * FROM peliculas 
WHERE actor=@actor;
