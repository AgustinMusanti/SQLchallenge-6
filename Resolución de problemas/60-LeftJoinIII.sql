-- 1- Elimine las tablas "premios" y "numerosrifa" si existen.


DROP TABLE IF EXISTS premios, numerosrifa;

-- 2- Cree las tablas:

CREATE TABLE premios(
  posicion      TINYINT UNSIGNED AUTO_INCREMENT,
  premio        VARCHAR(40),
  numeroganador TINYINT UNSIGNED,
  PRIMARY KEY(posicion)
 );
 
 CREATE TABLE numerosrifa(
  numero    TINYINT UNSIGNED AUTO_INCREMENT,
  documento CHAR(8) NOT NULL,
  PRIMARY KEY(numero)
 );

/* 3- Ingrese algunos registros:

premios:
(1,'PC I7',205);
(2,'Televisor 75 pulgadas',29);
(3,'Microondas',5);
(4,'Multiprocesadora',15);
(5,'Cafetera',33);

numerosrifa:
(205,'22333444');
(200,'23333444');
(5,'23333444');
(8,'23333444');
(1,'24333444');
(109,'28333444');
(15,'30333444');
(28,'32333444');
(29,'29333444'); */

INSERT INTO premios
VALUES(1,'PC I7',205),
      (2,'Televisor 75 pulgadas',29),
      (3,'Microondas',5),
      (4,'Multiprocesadora',15),
      (5,'Cafetera',33);

INSERT INTO numerosrifa
VALUES(205,'22333444'),
      (200,'23333444'),
      (5,'23333444'),
      (8,'23333444'),
      (1,'24333444'),
      (109,'28333444'),
      (15,'30333444'),
      (28,'32333444'),
      (29,'29333444');
      
/* 4- Muestre todos los números de rifas vendidos ("numerosrifas") y realice un "left join" mostrando 
      la posición y el premio: */
      
SELECT nr.numero, p.posicion, p.premio
FROM numerosrifa AS nr
LEFT JOIN premios AS p
ON nr.numero=p.numeroganador;

-- 5- Muestre los mismos datos anteriores pero teniendo en cuenta los números ganadores solamente:

SELECT nr.numero, p.posicion, p.premio
FROM numerosrifa AS nr
LEFT JOIN premios AS p
ON nr.numero=p.numeroganador
WHERE p.numeroganador IS NOT NULL;

/* 6- Realice un "left join" pero en esta ocasión busque los números ganadores de la tabla "premios" 
      en la tabla "numerosrifa": */
      
SELECT p.numeroganador, p.posicion, nr.numero
FROM premios AS p
LEFT JOIN numerosrifa AS nr
ON nr.numero=p.numeroganador;

/* 7- Realice el mismo "join" anterior pero sin considerar los valores de "premios" que no encuentren 
      coincidencia en "numerosrifa". */

SELECT p.numeroganador, p.posicion, nr.numero
FROM premios AS p
LEFT JOIN numerosrifa AS nr
ON nr.numero=p.numeroganador
WHERE nr.numero IS NOT NULL;
