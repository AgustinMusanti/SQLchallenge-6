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

-- 3- Visualice la estructura de la tabla "medicamentos".

DESCRIBE medicamentos;

-- 4- Ingrese los siguientes registros:

 -- ('Sertal','Roche',5.2,100);
 -- ('Buscapina','Roche',4.10,200);
 -- ('Amoxidal 500','Bayer',15.60,100);
 
 INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
 VALUES('Sertal','Roche',5.2,100),
       ('Buscapina','Roche',4.10,200),
       ('Amoxidal 500','Bayer',15.60,100);
       
-- 5- Verifique que el campo "código" generó los valores de modo automático:

SELECT * FROM medicamentos;

-- 6- Intente ingresar un registro con un valor de clave primaria repetido.

INSERT INTO medicamentos (codigo, nombre, laboratorio, precio, cantidad)
VALUES(2,'Tafirol', 'Zucho', 3.15, 50);

-- No es posible, nos da el error 1062: "Duplicate entry '2' for key 'medicamentos.PRIMARY'

-- 7- Ingrese un registro con un valor de clave primaria no repetido salteando la secuencia:

INSERT INTO medicamentos (codigo,nombre, laboratorio,precio,cantidad)
VALUES(12,'Paracetamol 500','Bago',1.90,200);

-- Vemos que es posible modificar la secuencia sin problemas con la siguiente consulta:

SELECT * FROM medicamentos;

-- 8- Ingrese el siguiente registro:

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
VALUES('Bayaspirina','Bayer',2.10,150);

-- Verificamos con la siguiente consulta que MySQL sigue la secuencia a partir del último valor que le indicamos:

SELECT * FROM medicamentos;
