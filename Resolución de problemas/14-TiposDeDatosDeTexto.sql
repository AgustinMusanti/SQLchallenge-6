-- 1- Elimine la tabla "autos" si existe.

DROP TABLE IF EXISTS autos;

-- 2- Cree la tabla con los siguientes campos: patente (primary key), marca, modelo y precio:

CREATE TABLE autos(
  patente CHAR(6),
  marca   VARCHAR(20),
  modelo  CHAR(4),
  precio  FLOAT UNSIGNED,
  PRIMARY KEY(patente)
 );

/* 3- Ingrese los siguientes registros:

('ACD123','Fiat 128','1970',15000);
('ACG234','Renault 11','1990',40000);
('BCD333','Peugeot 505','1990',80000);
('GCD123','Renault Clio','1990',70000);
('BCC333','Renault Megane','1998',95000);
('BVF543','Fiat 128','1975',20000); */

INSERT INTO autos (patente,marca,modelo,precio)
VALUES('ACD123','Fiat 128','1970',15000),
      ('ACG234','Renault 11','1990',40000),
      ('BCD333','Peugeot 505','1990',80000),
      ('GCD123','Renault Clio','1990',70000),
      ('BCC333','Renault Megane','1998',95000),
      ('BVF543','Fiat 128','1975',20000);

/* He definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
siempre tendrá la misma longitud (6 caracteres), con esta definición ocupamos 6 bytes, si lo 
hubiésemos definido como "varchar(6)" ocuparía 7 bytes. Lo mismo sucede con el campo "modelo", en 
el cual almacenaremos el año, necesitamos 4 caracteres fijos. Para el campo "precio" definimos un 
float sin signo porque los valores nunca serán negativos. */

-- 4- Seleccione todos los autos del año 1990:

SELECT * FROM autos
WHERE modelo='1990';

-- 5- Seleccione todos los autos con precio superior a 50000:

SELECT * FROM autos
WHERE precio>50000;
