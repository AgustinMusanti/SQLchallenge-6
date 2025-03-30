-- 1- Elimine las tablas "prestamos" y "libros", si existen.

DROP TABLE IF EXISTS prestamos, libros;

-- 2- Cree las tablas:

CREATE TABLE libros(
  codigo    INT UNSIGNED AUTO_INCREMENT,
  titulo    VARCHAR(40),
  autor     VARCHAR(30),
  editorial VARCHAR(15),
  PRIMARY KEY(codigo)
 );

CREATE TABLE prestamos(
  codigolibro     INT UNSIGNED NOT NULL,
  documento       CHAR(8) NOT NULL,
  fechaprestamo   DATE NOT NULL,
  fechadevolucion DATE,
  PRIMARY KEY(codigolibro,fechaprestamo)
 );

/* 3- Ingrese algunos registros para ambas tablas:

libros:
(15,'Manual de 1º grado','Moreno Luis','Emece');
(28,'Manual de 2º grado','Moreno Luis','Emece');
(30,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
(35,'El aleph','Borges','Emece');

prestamos:
(15,'22333444','2006-07-10','2006-07-12');
(15,'22333444','2006-07-20','2006-07-21');
(15,'23333444','2006-07-25');
(30,'23333444','2006-07-28');
(28,'25333444','2006-08-10'); */

INSERT INTO libros
VALUES(15,'Manual de 1º grado','Moreno Luis','Emece'),
      (28,'Manual de 2º grado','Moreno Luis','Emece'),
      (30,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta'),
      (35,'El aleph','Borges','Emece');

INSERT INTO prestamos
VALUES(15,'22333444','2006-07-10','2006-07-12'),
      (15,'22333444','2006-07-20','2006-07-21'),
      (15,'23333444','2006-07-25', NULL),
      (30,'23333444','2006-07-28', NULL),
      (28,'25333444','2006-08-10', NULL);

-- 4- Muestre todos los datos de los préstamos, incluyendo el nombre del libro:

SELECT l.titulo, p.*
FROM prestamos AS p
JOIN libros AS l
ON   p.codigolibro=l.codigo;

-- 5- Muestre la información de los préstamos del libro "Manual de 1º grado":

SELECT l.titulo, p.*
FROM prestamos AS p
JOIN libros AS l
ON   p.codigolibro=l.codigo
WHERE l.titulo='Manual de 1º grado';

/* 6- Muestre los títulos de los libros, la fecha de préstamo y el documento del socio de todos los 
   libros que no han sido devueltos: */
   
SELECT l.titulo, p.fechaprestamo,p.documento
FROM prestamos AS p
JOIN libros AS l
ON   p.codigolibro=l.codigo
WHERE p.fechadevolucion IS NULL;
