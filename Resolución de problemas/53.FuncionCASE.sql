-- 1- Elimine la tabla "alumnos" si existe.

DROP TABLE IF EXISTS alumnos;

-- 2- Cree la tabla:

CREATE TABLE alumnos(
  legajo CHAR(5) NOT NULL,
  nombre VARCHAR(30),
  promedio DECIMAL(4,2)
);

/* 3- Ingrese los siguientes registros:

(3456,'Perez Luis',8.5);
(3556,'Garcia Ana',7.0);
(3656,'Ludueña Juan',9.6);
(2756,'Moreno Gabriela',4.8);
(4856,'Morales Hugo',3.2);
(7856,'Gomez Susana',6.4); */

INSERT INTO alumnos
VALUES(3456,'Perez Luis',8.5),
      (3556,'Garcia Ana',7.0),
      (3656,'Ludueña Juan',9.6),
      (2756,'Moreno Gabriela',4.8),
      (4856,'Morales Hugo',3.2),
      (7856,'Gomez Susana',6.4);

/* 4- Si el alumno tiene un promedio menor a 4, muestre un mensaje "reprobado", si el promedio es 
mayor o igual a 4 y menor a 7, muestre "regular", si el promedio es mayor o igual a 7, 
muestre "promocionado", usando la primer sintaxis de "case": */

SELECT legajo,promedio,
CASE TRUNCATE(promedio,0)
   WHEN 0 THEN 'reprobado'
   WHEN 1 THEN 'reprobado'
   WHEN 2 THEN 'reprobado'
   WHEN 3 THEN 'reprobado'
   WHEN 4 THEN 'regular'
   WHEN 5 THEN 'regular'
   WHEN 6 THEN 'regular'
   WHEN 7 THEN 'promocionado'
   WHEN 8 THEN 'promocionado'
   WHEN 9 THEN 'promocionado'
   ELSE 'promocionado'
  END AS 'estado'
 FROM alumnos;

-- 5- Obtenga la misma salida anterior pero empleando la sintaxis resumida de "case":

SELECT legajo,promedio,
  CASE WHEN promedio<4 THEN 'reprobado'
       WHEN promedio>4 AND promedio<7 THEN 'regular'
  ELSE'promocionado'
  END AS'estado'
FROM alumnos;
