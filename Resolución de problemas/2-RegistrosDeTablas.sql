
-- 1- Elimine la tabla "agenda", si existe:

DROP TABLE IF EXISTS agenda;

-- 2- Cree una tabla llamada "agenda". Debe tener los campos de nombre, domicilio, telefono: 
   
CREATE TABLE agenda(
   nombre    VARCHAR(20),
   domicilio VARCHAR(30),
   telefono  VARCHAR(11)
);

-- 3- Visualice las tablas existentes para verificar la creación de "agenda".

SHOW TABLES;

-- 4- Visualice la estructura de la tabla "agenda".

DESCRIBE agenda;

-- 5- Ingrese los siguientes registros:

 -- ('Alberto Mores','Colon 123','4234567');
 -- ('Juan Torres','Avellaneda 135','4458787');
 
 INSERT INTO agenda values
 ('Alberto Mores','Colon 123','4234567'),
 ('Juan Torres','Avellaneda 135','4458787');

-- 6- Seleccione y mustre todos los registros de la tabla:

SELECT * FROM agenda;

-- 7- Elimine la tabla "agenda", si existe:

DROP TABLE IF EXISTS agenda;

-- 8- Intente eliminar la tabla nuevamente, sin especificar "si existe":

DROP TABLE agenda;

-- aparece el error 1051. "Unknown table 'challenge.agenda'
