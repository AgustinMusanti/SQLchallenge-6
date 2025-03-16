-- 1- Elimine la tabla "empleados" si existe.

DROP TABLE IF EXISTS empleados;

/* 2- Cree una tabla llamada "empleados" con la estructura necesaria para almacenar la siguiente información:

 - nombre del empleado,
 - documento,
 - sexo,
 - domicilio,
 - sueldo básico (hasta 9999.99),
 - hijos a cargo,
 - clave primaria: documento. */

CREATE TABLE empleados(
 nombre VARCHAR(25) NOT NULL,
 documento INT UNIQUE,
 sexo ENUM('m','f'),
 domicilio VARCHAR(35) DEFAULT 'Desconocido',
 sueldo DECIMAL(5,2) CHECK (sueldo <= 9999.99),
 hijos TINYINT UNSIGNED,
 PRIMARY KEY(documento));
 

