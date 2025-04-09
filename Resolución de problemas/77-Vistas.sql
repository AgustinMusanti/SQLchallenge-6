-- 1 - Elimine las tablas y créelas nuevamente:

DROP TABLE IF EXISTS inscriptos,socios, profesores,cursos;

CREATE TABLE socios(
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(40),
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );

CREATE TABLE profesores(
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(40),
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );

CREATE TABLE cursos(
  numero  INTEGER AUTO_INCREMENT,
  deporte VARCHAR(20),
  dia     VARCHAR(15),
  documentoprofesor CHAR(8),
  PRIMARY KEY(numero)
 );

CREATE TABLE inscriptos(
  documentosocio CHAR(8) NOT NULL,
  numero         INTEGER NOT NULL,
  matricula      CHAR(1),
  PRIMARY KEY(documentosocio,numero)
 );


-- 2- Ingrese algunos registros para todas las tablas:

INSERT INTO socios
VALUES('30000000','Fabian Fuentes','Caseros 987'),
      ('31111111','Gaston Garcia','Guemes 65'),
      ('32222222','Hector Huerta','Sucre 534'),
      ('33333333','Ines Irala','Bulnes 345');

INSERT INTO profesores
VALUES('22222222','Ana Acosta','Avellaneda 231'),
      ('23333333','Carlos Caseres','Colon 245'),
      ('24444444','Daniel Duarte','Sarmiento 987'),
      ('25555555','Esteban Lopez','Sucre 1204');

INSERT INTO cursos(deporte,dia,documentoprofesor) 
VALUES('tenis','lunes','22222222'),
      ('tenis','martes','22222222'),
      ('natacion','miercoles','22222222'),
      ('natacion','jueves','23333333'),
      ('natacion','viernes','23333333'),
      ('futbol','sabado','24444444'),
      ('futbol','lunes','24444444'),
      ('basquet','martes','24444444');

INSERT INTO inscriptos 
VALUES('30000000',1,'s'),
      ('30000000',3,'n'),
      ('30000000',6,null),
      ('31111111',1,'s'),
      ('31111111',4,'s'),
      ('32222222',8,'s');


-- 3- Elimine la vista "vista_club" si existe:

DROP VIEW IF EXISTS vista_club;

/* 4 - Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre 
       del profesor (no mostrar datos de los socios que no están inscriptos en deportes) */

 CREATE VIEW vista_club AS
 SELECT s.nombre AS 'Socio',
        s.documento AS 'Documento',
        c.deporte AS 'Deporte',
        c.dia AS 'Dia',
        p.nombre AS 'Profesor',
        i.matricula AS 'Matricula'
FROM socios AS s
JOIN inscriptos AS i
ON s.documento=i.documentosocio
JOIN cursos AS c 
ON i.numero=c.numero
JOIN profesores AS p ON c.documentoprofesor=p.documento;

-- 5- Muestre la información contenida en la vista.

SELECT * FROM vista_club;

/* 6- Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada deporte 
      ordenados por cantidad. */

SELECT Deporte, Dia, COUNT(Socio) AS Cantidad
FROM vista_club
GROUP BY Deporte, Dia
ORDER BY Cantidad DESC;

-- 7- Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.
   
SELECT Socio, Documento
FROM vista_club
WHERE Matricula <>'s';

/* 8- Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para 
      dictar sus clases. */
      
SELECT DISTINCT Profesor, Dia
FROM vista_club;



-- 9- Muestre todos los socios que son compañeros en tenis los lunes.

SELECT Socio FROM vista_club
WHERE Deporte='tenis' AND Dia='lunes';

/* 10 - Cree una nueva vista llamada 'vista_inscriptos' que muestre la cantidad de 
		inscriptos por curso, incluyendo el nombre del deporte y el día. */

DROP VIEW IF EXISTS vista_incriptos; 
  
CREATE VIEW vista_inscriptos AS
SELECT deporte,dia,
   (SELECT COUNT(*)
    FROM inscriptos AS i
    WHERE i.numero=c.numero) AS cantidad
  FROM cursos AS c;


-- Es mas facil si lo realizamos con JOIN:

DROP VIEW IF EXISTS vista_inscriptos;

CREATE VIEW vista_inscriptos AS
SELECT 
  c.deporte, 
  c.dia, 
  COUNT(i.numero) AS cantidad
FROM cursos AS c
LEFT JOIN inscriptos AS i 
ON c.numero = i.numero
GROUP BY c.deporte, c.dia;

-- 11- Consulte la vista 'vista_inscriptos':

SELECT * FROM vista_inscriptos
ORDER BY cantidad DESC; 
