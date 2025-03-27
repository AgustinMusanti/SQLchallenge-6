-- 1- Elimine la tabla "peliculas", si existe.

DROP TABLE IF EXISTS peliculas;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE peliculas(
  codigo          INT UNSIGNED AUTO_INCREMENT,
  nombre          VARCHAR(30) NOT NULL,
  protagonista    VARCHAR(20),
  actorsecundario VARCHAR(20),
  director        VARCHAR(25),
  duracion        TINYINT UNSIGNED,
  PRIMARY KEY(codigo),
  INDEX i_director (director)
 );

-- 3- Ingrese algunos registros.

INSERT INTO peliculas (nombre, protagonista, actorsecundario, director, duracion) 
VALUES('Inception', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Christopher Nolan', 148),
      ('El Padrino', 'Marlon Brando', 'Al Pacino', 'Francis Ford Coppola', 175),
      ('Interstellar', 'Matthew McConaughey', 'Anne Hathaway', 'Christopher Nolan', 169),
      ('Pulp Fiction', 'John Travolta', 'Samuel L. Jackson', 'Quentin Tarantino', 154),
      ('Gladiador', 'Russell Crowe', 'Joaquin Phoenix', 'Ridley Scott', 155);

-- 4- Vea los índices:

SHOW INDEX FROM peliculas;

-- 5- Elimine el campo "director":

ALTER TABLE peliculas
DROP director;

-- 6- Visualice la estructura modificada:

DESCRIBE peliculas;

-- 7- Vea los índices:

SHOW INDEX FROM peliculas;

/* Se observa que el índice por "editorial" ya no existe, esto es porque si se borra un campo que es parte de 
un índice, también se borra el índice. */

-- 8- Intente eliminar un campo inexistente:

ALTER TABLE peliculas
DROP director;

-- NO es posible eliminar un campo inexistente.

-- 9- Elimine los campos "actorsecundario" y "duracion" en una misma sentencia:

ALTER TABLE peliculas
DROP actorsecundario, DROP duracion;

-- Vemos que es posible eliminar dos campos en una misma sentencia.
