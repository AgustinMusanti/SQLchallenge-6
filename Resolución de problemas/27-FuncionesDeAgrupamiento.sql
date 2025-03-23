-- 1- Elimine la tabla "visitantes", si existe.

DROP TABLE IF EXISTS visitantes;

-- 2- Créela con la siguiente estructura:

CREATE TABLE visitantes(
  nombre      VARCHAR(30),
  edad        TINYINT UNSIGNED,
  sexo        CHAR(1),
  domicilio   VARCHAR(30),
  ciudad      VARCHAR(20),
  telefono    VARCHAR(11),
  montocompra DECIMAL (6,2) UNSIGNED
 );

/* 3- Ingrese algunos registros:

('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30); */

INSERT INTO visitantes
VALUES('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50),
      ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0),
      ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25),
      ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0),
      ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20),
      ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25),
      ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50),
      ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0),
      ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48),
      ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

-- 4- Solicite la cantidad de visitantes al stand:

SELECT COUNT(*) FROM visitantes;

-- 5- Muestre la suma de la compra de todos los visitantes de "Alta Gracia":

SELECT SUM(montocompra) FROM visitantes
WHERE ciudad='Alta Gracia';

-- 6- Muestre el valor máximo de las compras efectuadas:

SELECT MAX(montocompra) FROM visitantes;

-- 7- Muestre la edad menor de los visitantes:

SELECT MIN(edad) FROM visitantes;

-- 8- Muestre el promedio de edades de los visitantes:

SELECT AVG(edad) FROM visitantes;

-- 9- Muestre el promedio del monto de compra:

SELECT AVG(montocompra) FROM visitantes;
