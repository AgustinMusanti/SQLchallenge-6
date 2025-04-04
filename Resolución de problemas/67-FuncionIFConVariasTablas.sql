-- 1- Elimine las tablas "alumnos" y "Notas" si existen.

DROP TABLE IF EXISTS alumnos, notas;

-- 2- Cree las tablas:

CREATE TABLE alumnos(
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(30),
  PRIMARY KEY(documento)
 );

CREATE TABLE notas(
  documento CHAR(8) NOT NULL,
  nota      DECIMAL(4,2) UNSIGNED
 );

/* 3- Ingrese los siguientes registros:

alumnos:
('22333444','Juan Perez');
('23555666','Marina Herrero');
('24000333','Daniel Juarez');
('25222111','Hector Paz');

notas:
('22333444',7);
('23555666',8);
('24000333',3);
('25222111',7);
('22333444',7);
('23555666',9);
('24000333',4);
('22333444',6);
('23555666',10);
('24000333',3);
('25222111',9);
('23555666',10);

No todos los alumnos tienen la misma cantidad de notas porque algunos presentaron trabajos extras o 
no asistieron a los examenes. */

INSERT INTO alumnos
VALUES('22333444','Juan Perez'),
      ('23555666','Marina Herrero'),
      ('24000333','Daniel Juarez'),
      ('25222111','Hector Paz');
      
INSERT INTO notas
VALUES('22333444',7),
      ('23555666',8),
      ('24000333',3),
      ('25222111',7),
      ('22333444',7),
      ('23555666',9),
      ('24000333',4),
      ('22333444',6),
      ('23555666',10),
      ('24000333',3),
      ('25222111',9),
      ('23555666',10);

/* 4- Muestre el documento del alumno, su nombre y el promedio; si el alumno tiene un promedio menor a 
      4, muestre un mensaje "reprobado", si el promedio es mayor o igual a 4 y menor a 7, 
      muestre "regular", si el promedio es mayor a 7, muestre "promocionado", usando "case": */
      
SELECT a.documento, a.nombre, AVG(nota),
CASE WHEN AVG(nota)<4 THEN 'Reprobado'
     WHEN AVG(nota)>=4 AND AVG(nota)<7 THEN 'Regular'
     ELSE 'Promocionado' END AS Condicion
FROM alumnos AS a
JOIN notas AS n
ON a.documento=n.documento
GROUP BY n.documento;

-- 5- Muestre el documento y nombre del alumno y con un "if" si el alumno está aprobado o no:

SELECT a.documento, a.nombre,
IF(AVG(nota)>=4,'Si','No') AS '¿Aprobó?'
FROM alumnos AS a
JOIN notas AS n
ON a.documento=n.documento
GROUP BY n.documento;

/* 6- Muestre el documento, nombre del alumno y con un "case", si tiene 1 nota, 2 notas o 
      más de 2 notas: */
      
SELECT a.documento, a.nombre,
CASE COUNT(*)
WHEN '1' THEN '1 Nota'
WHEN '2' THEN '2 Notas'
ELSE 'Más de 2 Notas' END AS 'Cantidad de notas'
FROM alumnos AS a
JOIN notas AS n
ON a.documento=n.documento
GROUP BY n.documento
ORDER BY 'Cantidad de notas';
