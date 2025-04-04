-- 1- Elimine la tabla "alumnos" si existe y luego Créela 

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos(
  documento CHAR(8),
  nombre    VARCHAR(30),
  nota      DECIMAL(4,2),
  PRIMARY KEY(documento)
 );

-- 2-Ingrese algunos registros:

INSERT INTO alumnos
VALUES('30111111','Ana Algarbe',5.1),
      ('30222222','Bernardo Bustamante',3.2),
      ('30333333','Carolina Conte',4.5),
      ('30444444','Diana Dominguez',9.7),
      ('30555555','Fabian Fuentes',8.5),
      ('30666666','Gaston Gonzalez',9.70);

-- 3- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta:

SELECT * FROM
alumnos
WHERE nota=(SELECT MAX(nota) FROM alumnos);

/* 4- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el 
      promedio. */
      
SELECT *,
   (SELECT AVG(nota) FROM alumnos)-nota AS diferencia
FROM alumnos
WHERE nota<
   (SELECT AVG(nota) FROM alumnos);  
