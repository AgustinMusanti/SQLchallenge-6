-- 1- Elimine la tabla "equipos", si existe.

DROP TABLE IF EXISTS equipos;

-- 2- Cree la tabla:

CREATE TABLE equipos(
  nombre     VARCHAR(30),
  barrio     VARCHAR(20),
  domicilio  VARCHAR(30),
  entrenador VARCHAR(30)
 );

/* 3- Ingrese los siguientes registros:

('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
('Los leones','Centro','Colon 123','Gustavo Fuentes');
('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
('Cebollitas','Alberdi','Colon 1234','Luis Duarte'); */

INSERT INTO equipos
VALUES('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez'),
      ('Los leones','Centro','Colon 123','Gustavo Fuentes'),
      ('Campeones','Pueyrredon','Guemes 346','Carlos Moreno'),
      ('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

/* 4- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" 
      para combinar los equipos teniendo en cuenta que un equipo no juega consigo mismo: */
      
SELECT e1.nombre AS 'Local', e2.nombre AS 'Visitante'
FROM equipos AS e1
CROSS JOIN equipos AS e2
WHERE e1.nombre<>e2.nombre;

-- 5- Obtenga el mismo resultado empleando un "join" sin parte "on":

SELECT e1.nombre AS 'Local', e2.nombre AS 'Visitante'
FROM equipos AS e1
JOIN equipos AS e2
WHERE e1.nombre<>e2.nombre;
