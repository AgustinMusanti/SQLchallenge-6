-- 1- Elimine la tabla empleados, si existe.

DROP TABLE IF EXISTS empleados;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE empleados(
  documento    CHAR(8),
  nombre       VARCHAR(30),
  sexo         CHAR(1),
  estadocivil  ENUM('soltero','casado','divorciado','viudo') NOT NULL,
  sueldobasico DECIMAL(6,2),
  PRIMARY KEY(documento)
);

/* 3- Ingrese algunos registros:

('22333444','Juan Lopez','m','soltero',300);
('23333484','Ana Acosta','f','viudo',400); */

INSERT INTO empleados
VALUES('22333444','Juan Lopez','m','soltero',300),
      ('23333484','Ana Acosta','f','viudo',400);

-- 4- Intente ingresar un valor "null" para el campo enumerado:

INSERT INTO empleados
VALUES('25333444','Ana Acosta','f',null,400);

-- NO es posible ya que se definio que 'estadocivil' no puede ser null.

-- 5- Ingrese registros con valores de índice para el campo "estadocivil":

INSERT INTO empleados
VALUES('26333444','Luis Perez','m',1,400),
	  ('26336444','Marcelo Torres','m',3,460);
       
-- La inserción fue exitosa

-- 6- Ingrese un valor inválido, uno no presente en la lista y un valor de índice fuera de rango:

INSERT INTO empleados VALUES('29333444','Lucas Perez','m',0,400);

-- Esta inserción no es posible.

INSERT INTO empleados VALUES  ('30336444','Federico Garcia','m',5,450);

-- Esta inserción no es posible.
      
INSERT INTO empleados VALUES('31333444','Karina Sosa','f','Concubino',500);

-- Esta inserción no es posible.

-- 7- Seleccione todos los empleados solteros:

SELECT * FROM empleados
WHERE estadocivil='soltero';

-- 8- Seleccione todos los empleados viudos usando el número de índice de la enumeración:

SELECT * FROM empleados
WHERE estadocivil=4;
