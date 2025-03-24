-- 1- Elimine la tabla "prestamos" si existe.

DROP TABLE IF EXISTS prestamos;

/* 2- Cree la tabla teniendo en cuenta que se necesita una clave que identifique cada registro en la tabla "prestamos". 
      El mismo libro no puede prestarse en la misma fecha. */

CREATE TABLE prestamos(
  titulo          VARCHAR(40) NOT NULL,
  documento       CHAR(8) NOT NULL,
  fechaprestamo   DATE NOT NULL,
  fechadevolucion DATE,
  devuelto        CHAR(1) DEFAULT 'N',
  PRIMARY KEY(titulo,fechaprestamo)
 );
 
 -- Tomo como clave primaria titulo y fechaprestamo

/* 3- Ingrese los siguientes registros para la tabla "prestamos":

('Manual de 1 grado','22333444','2006-07-10');
('Manual de 1 grado','22333444','2006-07-20');
('Manual de 1 grado','23333444','2006-07-15');
('El aleph','22333444','2006-07-10');
('El aleph','30333444','2006-08-10');

Note que un mismo libro fue prestado a un mismo socio pero en una fecha distinta. */

INSERT INTO prestamos (titulo, documento, fechaprestamo)
VALUES('Manual de 1 grado','22333444','2006-07-10'),
      ('Manual de 1 grado','22333444','2006-07-20'),
      ('Manual de 1 grado','23333444','2006-07-15'),
      ('El aleph','22333444','2006-07-10'),
      ('El aleph','30333444','2006-08-10');

-- 4- Intente ingresar un valor de clave primaria repetida:

INSERT INTO prestamos (titulo,documento,fechaprestamo)
VALUES('Manual de 1 grado','25333444','2006-07-10');

/*Al intentar ingresar un valor de clave primaria repetida nos da el error 1062: "Duplicate entry"
Al ser compuesta la clave primaria, podemos repetir solo una de las condiciones en la inserción de datos */
