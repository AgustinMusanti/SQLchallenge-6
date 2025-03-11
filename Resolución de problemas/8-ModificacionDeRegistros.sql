-- 1- Elimine la tabla "agenda" si existe.

DROP TABLE IF EXISTS agenda;

-- 2- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), domicilio (cadena de 30)
-- y telefono (cadena de 11):

CREATE TABLE agenda(
  apellido  VARCHAR(30),
  nombre    VARCHAR(20),
  domicilio VARCHAR(30),
  telefono  VARCHAR(11)
 );

-- 3- Visualice la estructura de la tabla "agenda".

DESCRIBE agenda;

-- 4- Ingrese los siguientes registros:

 -- Mores,Alberto,Colon 123,4234567,
 -- Torres,Juan,Avellaneda 135,4458787,
 -- Lopez,Mariana,Urquiza 333,4545454,
 -- Lopez,Jose,Urquiza 333,4545454,
 -- Peralta,Susana,Gral. Paz 1234,4123456.
 
 INSERT INTO agenda (apellido, nombre, domicilio, telefono)
 VALUES('Mores','Alberto','Colon 123',4234567),
       ('Torres','Juan','Avellaneda 135',4458787),
       ('Lopez','Mariana','Urquiza 333',4545454),
       ('Lopez','Jose','Urquiza 333',4545454),
       ('Peralta','Susana','Gral. Paz 1234',4123456);
       
-- 5- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose":

UPDATE agenda SET nombre='Juan Jose'
WHERE  nombre='Juan';

-- 6- Actualice los registros cuyo número telefónico sea igual a '4545454' por '4445566':

UPDATE agenda SET telefono='4445566'
WHERE  telefono='4545454';

-- 7- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose":

UPDATE agenda SET nombre='Juan Jose'
WHERE  nombre='Juan';

-- En este caso no se afecto ninguna columna ya que ningún registro cumple con la condición planteada

-- Por último, realizo la siguiente consulta para verificar que los cambios se hayan efectuado:

SELECT * FROM agenda;
