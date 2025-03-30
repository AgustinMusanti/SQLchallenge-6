-- 1- Elimine las tablas "consultas" y "obrassociales" si existen.

DROP TABLE IF EXISTS consultas, obrassociales;

-- 2- Cree las tablas:

CREATE TABLE consultas(
  fecha            DATE,
  hora             TIME,
  documento        CHAR(8) NOT NULL,
  codigoobrasocial TINYINT UNSIGNED,
  medico           VARCHAR(30),
  PRIMARY KEY(fecha,hora,medico)
 );

 CREATE TABLE obrassociales(
  codigo TINYINT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(15),
  monto  DECIMAL(5,2) UNSIGNED,
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese algunos registros:

obrassociales:
('PAMI',2);
('IPAM',5);
('OSDOP',3);

consultas:
('2006-08-10','8:00','22333444',1,'Perez');
('2006-08-10','10:00','22333444',1,'Lopez');
('2006-08-10','8:30','23333444',1,'Perez');
('2006-08-10','9:00','24333444',2,'Perez');
('2006-08-10','10:00','25333444',3,'Perez');
('2006-08-10','8:30','25333444',1,'Garcia');
('2006-09-10','8:30','25333444',1,'Lopez'); */

INSERT INTO obrassociales (nombre, monto)
VALUES('PAMI',2),
      ('IPAM',5),
      ('OSDOP',3);
      
INSERT INTO consultas
VALUES('2006-08-10','8:00','22333444',1,'Perez'),
      ('2006-08-10','10:00','22333444',1,'Lopez'),
      ('2006-08-10','8:30','23333444',1,'Perez'),
      ('2006-08-10','9:00','24333444',2,'Perez'),
      ('2006-08-10','10:00','25333444',3,'Perez'),
      ('2006-08-10','8:30','25333444',1,'Garcia'),
      ('2006-09-10','8:30','25333444',1,'Lopez');

/*4- Muestre la fecha,hora,documento del paciente, médico, nombre y monto de la obra social de todas 
     las consultas: */
     
SELECT c.fecha, c.hora, c.documento, c.medico, os.nombre, os.monto
FROM consultas AS c
JOIN obrassociales AS os
ON   c.codigoobrasocial=os.codigo;

/*5- Muestre fecha,hora,documento del paciente y nombre de la obra social para las consultas del 
doctor "Perez": */

SELECT c.fecha, c.hora, c.documento, os.nombre
FROM consultas AS c
JOIN obrassociales AS os
ON   c.codigoobrasocial=os.codigo
WHERE c.medico="Perez";

-- 6- Muestre las obras sociales DISTINTAS que atendió el doctor "Perez" el día "2006-08-10":

SELECT DISTINCT os.nombre
FROM consultas AS c
JOIN obrassociales AS os
ON   c.codigoobrasocial=os.codigo
WHERE c.medico="Perez" AND c.fecha="2006-08-10";
