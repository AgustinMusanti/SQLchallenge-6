-- 1- Elimine la tabla "peliculas", si existe.

DROP TABLE IF EXISTS peliculas;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE peliculas(
  codigo INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  actor  VARCHAR(20),
  PRIMARY KEY(codigo)
 );

-- 3- Ingrese algunos registros.

INSERT INTO peliculas (nombre, actor) 
VALUES('El Padrino', 'Marlon Brando'),
      ('Titanic', 'Leonardo DiCaprio'),
      ('Forrest Gump', 'Tom Hanks'),
      ('Matrix', 'Keanu Reeves'),
      ('Gladiador', 'Russell Crowe'),
      ('El Caballero de la Noche', 'Christian Bale'),
      ('Pulp Fiction', 'John Travolta'),
      ('El Lobo de Wall Street', 'Leonardo DiCaprio'),
      ('Harry Potter', 'Daniel Radcliffe'),
      ('El Señor de los Anillos', 'Viggo Mortensen');

-- 4- Agregue un campo para almacenar la duración de la película, de tipo tinyint unsigned:

ALTER TABLE peliculas
ADD duracion TINYINT UNSIGNED;

-- 5- Visualice la estructura de la tabla.

DESCRIBE peliculas;

-- 6- Agregue el campo "director" para almacenar el nombre del director, de tipo varchar(20):

ALTER TABLE peliculas
ADD director VARCHAR(20);

-- 7- Visualice la estructura de la tabla con su nuevo campo:

DESCRIBE peliculas;

-- 8- Intente agregar un campo existente:

ALTER TABLE peliculas
ADD actor VARCHAR(20);

-- No se puede ingresar un capo repetido ya que nos tira error "Duplicate column"
