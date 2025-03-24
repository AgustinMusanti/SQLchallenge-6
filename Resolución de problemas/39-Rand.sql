-- 1- Eliminamos la tabla "alumnos" si existe:

DROP TABLE IF EXISTS alumnos;

-- 2- Creamos la tabla:

CREATE TABLE alumnos(
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(30),
  domicilio VARCHAR(30),
  ciudad    VARCHAR(20),
  provincia VARCHAR(20),
  PRIMARY KEY(documento)
 );
 
/* 3- Agregamos varios registros:

('22333444','Juan Perez','Colon 123','Cordoba','Cordoba');
('23456789','Ana Acosta','Caseros 456','Cordoba','Cordoba');
('24123123','Patricia Morales','Sucre 234','Villa del Rosario','Cordoba');
('25000333','Jose Torres','Sarmiento 980','Carlos Paz','Cordoba');
('26333444','Susana Molina','Avellaneda 234','Rosario','Santa Fe');
('27987654','Marta Herrero','San Martin 356','Villa del Rosario','Cordoba');
('28321321','Marcos Ferreyra','Urquiza 357','Cordoba','Cordoba');
('30987464','Marta Perez','Rivadavia 234','Cordoba','Cordoba'); */

INSERT INTO alumnos
VALUES('22333444','Juan Perez','Colon 123','Cordoba','Cordoba'),
      ('23456789','Ana Acosta','Caseros 456','Cordoba','Cordoba'),
      ('24123123','Patricia Morales','Sucre 234','Villa del Rosario','Cordoba'),
      ('25000333','Jose Torres','Sarmiento 980','Carlos Paz','Cordoba'),
      ('26333444','Susana Molina','Avellaneda 234','Rosario','Santa Fe'),
      ('27987654','Marta Herrero','San Martin 356','Villa del Rosario','Cordoba'),
      ('28321321','Marcos Ferreyra','Urquiza 357','Cordoba','Cordoba'),
      ('30987464','Marta Perez','Rivadavia 234','Cordoba','Cordoba');

/* 4- El instituto quiere tomar 3 alumnos al azar para que representen al instituto en una feria de 
      ciencias: */

SELECT documento,nombre
FROM   alumnos
ORDER BY RAND()
LIMIT 3;
