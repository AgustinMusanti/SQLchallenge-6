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
       
-- 5- Elimine el registro cuyo nombre sea 'Juan'.

-- Por default, MySQL tiene activada una opción que nos impide eliminar datos.
-- Para llevar a cabo este desafio, lo desactivamos ejecutando el siguiente código:

SET sql_safe_updates=0;

-- Además, para eliminar este default y no tener que ejecutar el código anterior cada vez que trabajamos con MySQL, voy al
-- apartado "edit", luego a "preferences", desde alli clickeo "SQL editor" y bajo hasta encontrar la casilla de:
-- Safe Updates (rejects UPDATEs and DELETEs with no restrictions) y la destildo.

-- Ahora si, siguiendo con el ejercicio 5:

DELETE FROM agenda
WHERE nombre='Juan';

-- 6- Elimine los registros cuyo número telefónico sea igual a '4545454'.

DELETE FROM agenda
WHERE telefono=4545454;

-- Por último, ejecuto la siguiente consulta para ver que los cambios se hayan efectuado:

SELECT * FROM agenda;
