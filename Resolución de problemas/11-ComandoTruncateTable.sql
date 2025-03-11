-- 1- Elimine la tabla "medicamentos" ,si existe:

 DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla con los siguientes campos: codigo (con primary key), nombre, laboratorio, precio y cantidad.

 CREATE TABLE medicamentos(
  codigo      INTEGER AUTO_INCREMENT,
  nombre      VARCHAR(20),
  laboratorio VARCHAR(20),
  precio      FLOAT,
  cantidad    INTEGER,
  PRIMARY KEY (codigo)
);

-- 3- Ingrese los siguientes registros:

 -- ('Sertal','Roche',5.2,100);
 -- ('Buscapina','Roche',4.10,200);
 -- ('Amoxidal 500','Bayer',15.60,100);
 
 INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
 VALUES('Sertal','Roche',5.2,100),
       ('Buscapina','Roche',4.10,200),
       ('Amoxidal 500','Bayer',15.60,100);
       
-- 4- Elimine todos los registros con "delete":

 DELETE FROM medicamentos;

-- Selecciono la tabla para ver que los cambios se hayan efectuado:

SELECT * FROM medicamentos;

-- 5- Ingrese 2 registros:

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
VALUES('Sertal','Roche',5.2,100),
      ('Amoxidal 500','Bayer',15.60,100);

-- 6- Vea los registros para verificar que continuó la secuencia al generar el valor para "codigo":

SELECT * FROM medicamentos;

-- Se observa que de esta manera el codigo sigue con la secuencia original a pesar del "delete" anterior

-- 7- Vacíe la tabla:

TRUNCATE TABLE medicamentos;

-- 8- Ingrese el siguiente registro:

	-- ('Buscapina','Roche',4.10,200)

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
VALUES('Buscapina','Roche',4.10,200);

-- 9- Vea los registros para verificar que al cargar el código reinició la secuencia en 1.

SELECT * FROM medicamentos;

-- Efectivamente, al ejecutar el "Truncate", la secuencia comienza de nuevo en '1'
