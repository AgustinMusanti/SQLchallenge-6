-- 1- Eliminamos "agenda", si existe:

DROP TABLE IF EXISTS agenda;

-- 2- Creamos la tabla, con los campos de nombre, domicilio y telefono: 

CREATE TABLE agenda(
 nombre    VARCHAR(20),
 domicilio VARCHAR(30),
 telefono  VARCHAR(11)
 );
 
-- 3- Visualice la estructura de la tabla "agenda".

DESCRIBE agenda;

-- 4- Ingrese los siguientes registros:

 -- 'Alberto Mores','Colon 123','4234567',
 -- 'Juan Torres','Avellaneda 135','4458787',
 -- 'Mariana Lopez','Urquiza 333','4545454',
 -- 'Fernando Lopez','Urquiza 333','4545454'.
 
 INSERT INTO agenda (nombre, domicilio, telefono)
 VALUES('Alberto Mores','Colon 123','4234567'),
       ('Juan Torres','Avellaneda 135','4458787'),
       ('Mariana Lopez','Urquiza 333','4545454'),
       ('Fernando Lopez','Urquiza 333','4545454');
       
-- 5- Seleccione todos los registros de la tabla.

SELECT * FROM agenda;

-- 6- Seleccione el registro cuyo nombre sea 'Juan Torres'.

SELECT * FROM agenda
WHERE nombre="Juan Torres";

-- 7- Seleccione el registro cuyo domicilio sea 'Colon 123'.

SELECT * FROM agenda
WHERE domicilio="Colon 123";

-- 8- Muestre los datos de quienes tengan el teléfono '4545454'.

SELECT * FROM agenda
WHERE telefono="4545454";

-- 9- Elimine la tabla "agenda".

DROP TABLE agenda;
