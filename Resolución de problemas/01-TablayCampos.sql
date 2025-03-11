CREATE DATABASE challenge;

USE challenge;

-- 1- Elimine la tabla "agenda" si existe

 DROP TABLE IF EXISTS agenda;

-- 2- Cree una tabla llamada "agenda", debe tener campos de nombre, domicilio y telefono: 

CREATE TABLE agenda(
   nombre    VARCHAR(20),
   domicilio VARCHAR(30),
   telefono  VARCHAR(11)
);

-- 3- Intente crearla nuevamente.

CREATE TABLE agenda(
   nombre    VARCHAR(20),
   domicilio VARCHAR(30),
   telefono  VARCHAR(11)
);

-- aparece el error 1050. "Table 'agenda' already exists

-- 4- Visualice las tablas existentes.

SHOW TABLES;

-- 5- Visualice la estructura de la tabla "agenda".

DESCRIBE agenda;

-- 6- Elimine la tabla, si existe.

DROP TABLE IF EXISTS agenda;

-- 7- Intente eliminar la tabla sin la cláusula if exists. Debe aparecer un mensaje de error cuando no existe la tabla.

DROP TABLE IF EXISTS agenda;

-- aparece un warning 1051, "Unkown table 'challenge.agenda'.
