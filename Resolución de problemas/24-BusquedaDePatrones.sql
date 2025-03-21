-- 1- Elimine la tabla "medicamentos", si existe.

SELECT FALTA TERMINAAAR

DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE medicamentos(
  codigo      INT UNSIGNED AUTO_INCREMENT,
  nombre      VARCHAR(20),
  laboratorio VARCHAR(20),
  precio      DECIMAL(6,2) UNSIGNED,
  cantidad    INT UNSIGNED,
  PRIMARY KEY(codigo)
 );

-- 3- Visualice la estructura de la tabla "medicamentos".

DESCRIBE medicamentos;

/* 4- Ingrese los siguientes registros:

('Sertal gotas','Roche',5.2);
('Buscapina','Roche',4.10);
('Amoxidal 500','Bayer',15.60);
('Paracetamol 500','Bago',1.90);
('Bayaspirina','Bayer',2.10); 
('Amoxidal jarabe','Bayer',5.10); 
('Sertal compuesto','Bayer',5.10); 
('Paracetamol 1000','Bago',2.90);
('Amoxinil','Roche',17.80); */

INSERT INTO medicamentos (nombre, laboratorio, precio)
VALUES('Sertal gotas','Roche',5.2),
      ('Buscapina','Roche',4.10),
      ('Amoxidal 500','Bayer',15.60),
      ('Paracetamol 500','Bago',1.90),
      ('Bayaspirina','Bayer',2.10),
      ('Amoxidal jarabe','Bayer',5.10),
      ('Sertal compuesto','Bayer',5.10),
      ('Paracetamol 1000','Bago',2.90),
      ('Amoxinil','Roche',17.80);
      
-- 5- Recupere los medicamentos cuyo nombre comiencen con "Amox":

SELECT * FROM medicamentos
WHERE nombre LIKE 'Amox%';
