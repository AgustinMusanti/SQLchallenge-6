-- 1- Elimine la tabla "peliculas" si existe.

DROP TABLE IF EXISTS peliculas;

/* 2- Créela con la siguiente estructura:

 -codigo (entero sin signo, autoincrementable),
 -titulo (cadena de 30), not null,
 -actor (cadena de 20),
 -duracion (entero sin signo no mayor a 200 aprox.),
 -clave primaria (codigo). */
 
 CREATE TABLE peliculas(
   codigo   INT UNSIGNED AUTO_INCREMENT,
   titulo   VARCHAR(30) NOT NULL,
   actor    VARCHAR(20),
   duracion TINYINT UNSIGNED CHECK (duracion <= 200),
   PRIMARY KEY (codigo)
   );

-- 3- Ingrese 10 registros.

INSERT INTO peliculas (titulo, actor, duracion) 
VALUES('El Padrino', 'Marlon Brando', 175),
      ('Titanic', 'Leonardo DiCaprio', 195),
      ('Inception', 'Leonardo DiCaprio', 148),
	    ('Matrix', 'Keanu Reeves', 136),
      ('Forrest Gump', 'Tom Hanks', 142),
      ('Gladiador', 'Russell Crowe', 155),
      ('Interstellar', 'Matthew McConaughey', 169),
	    ('El Caballero Oscuro', 'Christian Bale', 152),
      ('Pulp Fiction', 'John Travolta', 154),
      ('El Señor de los Anillos', 'Elijah Wood', 178);

-- 4- Realice una consulta limitando la salida a sólo 5 registros.

SELECT * FROM peliculas
LIMIT 5;

-- 5- Muestre los registros desde el 1 al 8 usando un solo argumento.

SELECT * FROM peliculas
LIMIT 8;

-- 6- Muestre 3 registros a partir del 4.

SELECT * FROM peliculas
LIMIT 3,3;

-- 7- Muestre los registros a partir del 2 hasta el final.

SELECT * FROM peliculas
LIMIT 1,10000;
