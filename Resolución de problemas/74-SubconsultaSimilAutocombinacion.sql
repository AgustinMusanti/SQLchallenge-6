-- 1- Borre y luego cree la tabla 'deportes':

DROP TABLE IF EXISTS deportes;

CREATE TABLE deportes(
  nombre   VARCHAR(15),
  profesor VARCHAR(30),
  dia      VARCHAR(10),
  cuota    DECIMAL(5,2)
 );
 
-- 2- Ingrese algunos registros. Incluya profesores que dicten más de un curso:

INSERT INTO deportes
VALUES('tenis','Ana Lopez','lunes',20),
      ('natacion','Ana Lopez','martes',15),
      ('futbol','Carlos Fuentes','miercoles',10),
      ('basquet','Gaston Garcia','jueves',15),
      ('padle','Juan Huerta','lunes',15),
      ('handball','Juan Huerta','martes',10);

-- 3- Muestre los nombres de los profesores que dictan más de un deporte empleando subconsulta.

SELECT DISTINCT d1.profesor
FROM deportes AS d1
WHERE d1.profesor IN
  (SELECT d2.profesor
   FROM deportes AS d2 
   WHERE d1.nombre <> d2.nombre); 

-- 4- Obtenga el mismo resultado empleando join.

SELECT DISTINCT d1.profesor
FROM deportes AS d1
JOIN deportes AS d2    
ON d1.profesor=d2.profesor
WHERE d1.nombre <> d2.nombre; 

/* 5- Buscamos todos los deportes que se dictan el mismo día que un determinado deporte (natacion) 
      empleando subconsulta. */
      
SELECT nombre
FROM deportes
WHERE nombre<>'natacion' AND
  dia =
   (SELECT dia
    FROM deportes
    WHERE nombre='natacion');  

-- 6- Obtenga la misma salida empleando "join".

SELECT d1.nombre
FROM deportes AS d1
JOIN deportes AS d2
ON d1.dia=d2.dia
WHERE d2.nombre='natacion' 
AND d1.nombre<>d2.nombre;
