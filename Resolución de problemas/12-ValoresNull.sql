-- 1- Elimine la tabla "medicamentos" ,si existe:

 DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla con los siguientes campos: codigo (con primary key), nombre, laboratorio, precio y cantidad.

 CREATE TABLE medicamentos(
  codigo      INTEGER AUTO_INCREMENT,
  nombre      VARCHAR(20) NOT NULL,
  laboratorio VARCHAR(20),
  precio      FLOAT,
  cantidad    INTEGER NOT NULL,
  PRIMARY KEY (codigo)
);

-- 3- Visualice la estructura de la tabla "medicamentos".

DESCRIBE medicamentos;

-- 4- Ingrese los siguientes registros:

-- ('Sertal gotas','Roche',5.2,100); 
-- ('Sertal compuesto','Roche',7.1,150);
-- ('Buscapina','Roche',null,200);
-- ('Amoxidal 500','Bayer',15.60,0);
-- ('Amoxidal jarabe','Bayer',25,120);
-- ('Amoxinil',null,25,120);
-- ('Bayaspirina','',0,150); 

INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES('Sertal gotas','Roche',5.2,100),
      ('Sertal compuesto','Roche',7.1,150),
      ('Buscapina','Roche',null,200),
      ('Amoxidal 500','Bayer',15.60,0),
      ('Amoxidal jarabe','Bayer',25,120),
      ('Amoxinil',null,25,120),
      ('Bayaspirina','',0,150);

-- 5- Verifique que el campo "codigo" generó los valores de modo automático.

SELECT * FROM medicamentos;

-- 6- Recupere los registros que contengan valor "null" en el campo "laboratorio", 
--    luego los que tengan una cadena vacía en el mismo campo. Note que el resultado es diferente:

SELECT * FROM medicamentos WHERE laboratorio IS NULL;

-- La consulta anterior se ejecuta sin problemas.

SELECT * FROM medicamentos WHERE laboratorio='';

-- La consulta anterior también se ejecuta sin problemas. Podemos observar que el valor "null" difiere de una cadena vacía.

-- 7- Recupere los registros que contengan valor "null" en el campo "precio", 
--    luego los que tengan el valor 0 en el mismo campo. Note que el resultado es diferente:

SELECT * FROM medicamentos WHERE precio IS NULL;

-- La consulta anterior se ejecuta sin problemas.

SELECT * FROM medicamentos WHERE precio=0;

-- La consulta anterior también se ejecuta sin problemas. Podemos observar que el valor "null" difiere del valor '0'.

-- 8- Intente ingresar el siguiente registro con valor "null" para el campo "nombre":

--    (null,'Bayer',10.20,100);

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
VALUES (null,'Bayer',10.20,100); 

-- Al crear la tabla indicando que el campo "nombre" NO puede ser null, MySQL nos indica el
-- error 1048: "Column "Nombre" cannot be null".

-- 9- Intente ingresar el siguiente registro con valor "null" para el campo "cantidad":

     -- ('Benadryl comprimidos','Bayer',10.20,null)
     
INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
VALUES('Benadryl comprimidos','Bayer',10.20,null); 

-- Nos indica el mismo error que el caso anterior.

-- 10- Ingrese el siguiente registro con valor "null" para el campo correspondiente al código:

      -- (null,'Benadryl comprimidos','Bayer',10.20,7),
      
INSERT INTO medicamentos (codigo,nombre, laboratorio,precio,cantidad)
VALUES(null,'Benadryl comprimidos','Bayer',10.20,7);

-- No muestra un mensaje de error. Pruebo ejecutando un "Select" para ver que se almacenó

SELECT * FROM medicamentos;

-- Al realizar la consulta, vemos que el campo "codigo" de igual manera siguio la secuencia aunque
-- le indicaramos el valor "null".

-- 11- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":

SELECT * FROM medicamentos WHERE precio<>0;
 
SELECT * FROM medicamentos WHERE precio IS NOT NULL;

-- Noté que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco 
-- los que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con 
-- valor para el campo precio (incluso el valor 0). 
-- Esto es porque los valores "null" no pueden compararse con operadores relacionales y tampoco incluye a "0".

-- 12- Recupere los registros en los cuales el laboratorio no contenga una cadena vacía, luego los que sean distintos de "null":

SELECT * FROM medicamentos WHERE laboratorio<>'';
 
SELECT * FROM medicamentos WHERE laboratorio IS NOT NULL;
 
 
-- Noté que la primera sentencia solicita los registros que no tengan cadena vacía, es decir, 
-- los que guardan una cadena, como "null" no es una cadena, no retorna los registros con valor nulo. 
-- El resultado de la segunda sentencia solicita que no muestre los valores nulos, es decir, 
-- que muestre cualquier cadena, incluso vacía.
