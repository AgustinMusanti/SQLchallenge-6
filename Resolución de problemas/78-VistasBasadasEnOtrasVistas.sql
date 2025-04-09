-- 1- Elimine la tabla "alumnos" si existe y luego Créela:

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos(
  documento CHAR(8),
  nombre    VARCHAR(30),
  nota      DECIMAL(4,2),
  PRIMARY KEY(documento)
 );


-- 2-Ingrese algunos registros:

INSERT INTO alumnos 
values('30111111','Ana Algarbe',5.1),
      ('30222222','Bernardo Bustamante',3.2),
      ('30333333','Carolina Conte',4.5),
      ('30444444','Diana Dominguez',9.7),
      ('30555555','Fabian Fuentes',8.5),
      ('30666666','Gaston Gonzalez',9.70);


-- 3-Cree una vista que recupere el nombre y la nota de todos los alumnos

DROP VIEW IF EXISTS vista_nota_alumnos;

CREATE VIEW vista_nota_alumnos AS
SELECT nombre, nota
FROM alumnos;

-- 4-Mostrar el resultado de llamar la vista en un comando SQL 'select'.

SELECT * FROM vista_nota_alumnos;     


/* 5-Crear una vista que retorne el nombre y la nota de todos los alumnos aprobados (notas mayores
iguales a 7) a partir de la vista anterior. */

DROP VIEW IF EXISTS vista_alumnos_aprobados;

CREATE VIEW vista_alumnos_aprobados AS
SELECT nombre, nota
FROM alumnos
WHERE nota>=7;


-- 6-Muestre la información que genera la vista.

SELECT * FROM vista_alumnos_aprobados;
