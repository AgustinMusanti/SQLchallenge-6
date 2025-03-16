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
 
/* 3- Ingrese algunos registros:

('Juan Perez','22333444','m', 'Alem'300,1);
('Ana Acosta','21333474','f','DEFAULT', 400,2);
('Alberto Lopez','24333444','m', 'Vedia', 600,0);
('Carlos Sanchez','30333444','m', 'Junin',550,3);
('Mariana Torres','23444555','f', 'DEFAULT', 600,1);
('Marcos Garcia','23664555','m', 'Lomas',850,2); */

INSERT INTO empleados
VALUES('Juan Perez','22333444','m', 'Alem', 300,1),
      ('Ana Acosta','21333474','f', DEFAULT, 400,2),
      ('Alberto Lopez','24333444','m', 'Vedia', 600,0),
      ('Carlos Sanchez','30333444','m', 'Junin', 550,3),
      ('Mariana Torres','23444555','f', DEFAULT, 600,1),
      ('Marcos Garcia','23664555','m', 'Lomas', 850,2);


/* 4- La empresa está pensando en aumentar un 10% el sueldo a los empleados, y quiere saber a cuánto 
	     subiría cada sueldo básico, para ello usaremos una sentencia en la cual incluimos una 
      columna que hará el cálculo de cada sueldo más el 10%: */

SELECT nombre, sueldo, ROUND(sueldo*1.10,2) AS SueldoConAumento
FROM empleados;

-- En este caso utilizo un ROUND para redondear en dos decimales

/* 5- La empresa paga un salario familiar por hijos a cargo, $200 por cada hijo. Necesitamos el nombre 
del empleado, el sueldo básico, la cantidad de hijos a cargo, el total del salario familiar y el 
suedo final (incluyendo el salario familiar): */

SELECT nombre, sueldo,hijos,(200*hijos),sueldo+(200*hijos)
FROM empleados;
