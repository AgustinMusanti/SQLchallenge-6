/* Problema:

Una concesionaria de autos vende autos usados. Guarda los siguientes datos en la tabla "autos":

- marca  (fiat 128, renault 11, peugeot 505, etc.)
- modelo (año)
- dueño  (nombre del dueño)
- precio (valor con decimales positivo que puede llegar hasta 999999.99 aprox.). */

-- 1- Elimine la tabla si existe.

DROP TABLE IF EXISTS autos;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar estos datos:

CREATE TABLE autos(
  marca  VARCHAR(15),
  modelo YEAR,
  dueño  VARCHAR(30),
  precio DECIMAL (8,2) UNSIGNED  
 );

/* 3- Ingrese los siguientes registros:

('Fiat 128','1970','Juan Lopez',50000);
('Renault 11','1990','Juan Lopez',80000);
('Fiat 128','1971','Ana Ferreyra',51000);
('Peugeot 505','1998','Luis Luque',99000);
('Peugeot 505','1997','Carola Perez',85000); */

INSERT INTO autos
VALUES('Fiat 128','1970','Juan Lopez',50000),
      ('Renault 11','1990','Juan Lopez',80000),
      ('Fiat 128','1971','Ana Ferreyra',51000),
      ('Peugeot 505','1998','Luis Luque',99000),
      ('Peugeot 505','1997','Carola Perez',85000);

-- 4- Seleccione todos los autos cuyo modelo sea menor a "1995":

SELECT * FROM autos
WHERE modelo<1995;

-- 5- Muestre la marca y modelo de los autos que no sean de "1970":

SELECT marca,modelo FROM autos
WHERE modelo<>1970;

-- 6- Ingrese un auto con el valor para "modelo" de tipo numérico:

INSERT INTO autos 
VALUES('Peugeot 505',1995,'Carlos Lopez',88000);

-- Ejecuto la siguiente consulta para ver como trae los datos:

SELECT * FROM autos;

/* Pude observar que por más que ponga un valor númerico en la columna "modelo", MySQL lo interpreta de manera
correcta, ya que he establecido que dicha columna sea "Year".
Por lo tanto, mientras el valor sea de 4 digitios, MySQL lo interpretará de manera correcta. */
