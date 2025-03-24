-- 1- Elimine la tabla "alumnos" si existe.

DROP TABLE IF EXISTS alumnos;

/* 2- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
      inscripto), un índice único por el campo "documento" y un índice común por ciudad y provincia: */
      
CREATE TABLE alumnos(
  año       YEAR NOT NULL,
  numero    INT UNSIGNED NOT NULL,
  nombre    VARCHAR(30),
  documento CHAR(8) NOT NULL,
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),  
  PRIMARY KEY(año,numero),
  UNIQUE i_documento (documento),
  INDEX  i_ciudadprovincia (ciudad,provincia)
 );

-- 3- Vea los índices de la tabla.

SHOW INDEX FROM alumnos;

-- 4- Ingrese algunos registros. Ingrese 2 ó 4 alumnos para los años 2004, 2005 y 2006.

INSERT INTO alumnos
VALUES(2004,555, 'Agustin', 42733667, 'Calle 6', 'La Plata', 'Buenos Aires'),
      (2005,545, 'Juan', 32735667, 'Calle 11', 'Villa Elvira', 'Buenos Aires'),
      (2006,535, 'Ignacio', 73829667, 'Calle 161', 'Berazategui', 'Buenos Aires');
      
-- 5- Intente ingresar un alumno con clave primaria repetida.

INSERT INTO alumnos
VALUES(2004,555, 'Valentino', 42733667, 'Calle 78', 'Alem', 'Buenos Aires');

-- No es posible ingresar alumno con clave primaria compuesta repetida.

-- 6- Intente ingresar un alumno con documento repetido.

INSERT INTO alumnos
VALUES(2005,565, 'Federico', 42733667, 'Calle 89', 'Vedia', 'Buenos Aires');

-- No es posible insertar un alumno con documento repetido ya que es UNIQUE

-- 7- Ingrese varios alumnos de la misma ciudad y provincia.

INSERT INTO alumnos
VALUES(2004,585, 'Oscar', 42933667, 'Calle 68', 'Alem', 'Buenos Aires'),
      (2005,595, 'Isaias', 42933568, 'Calle 118', 'Alem', 'Buenos Aires'),
      (2005,505, 'Martin', 42223568, 'Calle 5', 'Alem', 'Buenos Aires');
      
-- Vemos que es posible ingresar a alumnos de la misma ciudad y provincia
