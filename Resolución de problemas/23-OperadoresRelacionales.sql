-- 1- Elimine la tabla "medicamentos", si existe.

DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE medicamentos(
  codigo      INT UNSIGNED AUTO_INCREMENT,
  nombre      VARCHAR(20),
  laboratorio VARCHAR(20),
  precio      DECIMAL(5,2),
  cantidad    INT UNSIGNED,
  PRIMARY KEY(codigo)
 );

-- 3- Visualice la estructura de la tabla "medicamentos".

DESCRIBE medicamentos;

/* 4- Ingrese los siguientes registros:

('Sertal','Roche',5.2,100);
('Buscapina','Roche',4.10,200);
('Amoxidal 500','Bayer',15.60,100);
('Paracetamol 500','Bago',1.90,200);
('Bayaspirina','Bayer',2.10,150); 
('Amoxidal jarabe','Bayer',5.10,250); */

INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES('Sertal','Roche',5.2,100),
      ('Buscapina','Roche',4.10,200),
      ('Amoxidal 500','Bayer',15.60,100),
      ('Paracetamol 500','Bago',1.90,200),
      ('Bayaspirina','Bayer',2.10,150),
      ('Amoxidal jarabe','Bayer',5.10,250);
      
-- 5- Recupere los nombres y precios de los medicamentos cuyo precio esté entre 5 y 15:

SELECT nombre,precio 
FROM   medicamentos
WHERE  precio BETWEEN 5 AND 15;

-- 6- Seleccione los registros cuyo laboratorio sea "Bayer" o "Bago":

SELECT * FROM medicamentos
WHERE laboratorio IN ('Bayer','Bago');

-- 7- Elimine los registros cuya cantidad esté entre 100 y 200:

DELETE FROM medicamentos
WHERE cantidad BETWEEN 100 AND 200;

-- Valido que los cambios se hayan ejecutado con la siguiente consulta

SELECT * FROM medicamentos;
