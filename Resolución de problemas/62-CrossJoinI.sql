-- 1- Elimine las tablas "guardias" y "tareas" si existen.

DROP TABLE IF EXISTS guardias, tareas;

-- 2- Cree las siguientes tablas:

CREATE TABLE guardias(
  documento CHAR(8),
  nombre    VARCHAR(30),
  sexo      CHAR(1), /* 'f' o 'm' */
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );

CREATE TABLE tareas(
  codigo      TINYINT UNSIGNED AUTO_INCREMENT,
  domicilio   VARCHAR(30),
  descripcion VARCHAR(30),
  horario CHAR(2), /* 'AM' o 'PM'*/
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese los siguientes registros:

guardias:
('22333444','Juan Perez','m','Colon 123');
('23333444','Lorena Viale','f','Sarmiento 988');
('24333444','Alberto Torres','m','San Martin 567');
('25333444','Luis Ferreyra','m','Chacabuco 235');
('26333444','Irma Gonzalez','f','Mariano Moreno 111');

tareas:
('Colon 1111','vigilancia exterior','AM');
('Urquiza 234','vigilancia exterior','PM');
('Peru 345','vigilancia interior','AM');
('Avellaneda 890','vigilancia interior','PM'); */

INSERT INTO guardias
VALUES('22333444','Juan Perez','m','Colon 123'),
      ('23333444','Lorena Viale','f','Sarmiento 988'),
      ('24333444','Alberto Torres','m','San Martin 567'),
      ('25333444','Luis Ferreyra','m','Chacabuco 235'),
      ('26333444','Irma Gonzalez','f','Mariano Moreno 111');
      
INSERT INTO tareas (domicilio, descripcion, horario)
VALUES('Colon 1111','vigilancia exterior','AM'),
      ('Urquiza 234','vigilancia exterior','PM'),
      ('Peru 345','vigilancia interior','AM'),
      ('Avellaneda 890','vigilancia interior','PM');

-- 4- La empresa quiere que todos sus empleados realicen todas las tareas. Realice una "cross join":

SELECT g.nombre, g.domicilio, t.descripcion
FROM guardias AS g
CROSS JOIN tareas AS t;

-- 5- Obtenga la misma salida realizando un simple "join" sin parte "on":

SELECT g.nombre, g.domicilio, t.descripcion
FROM guardias AS g
JOIN tareas AS t;
