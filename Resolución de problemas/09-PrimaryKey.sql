-- 1- Elimine la tabla "libros" si existe.

DROP TABLE IF EXISTS libros;

-- 2- Créela con los siguientes campos y clave: codigo (integer), titulo (cadena de 20 caracteres de longitud), 
--    autor (cadena de 30), editorial (cadena de 15), codigo será clave primaria:

CREATE TABLE libros(
  codigo    INTEGER,
  titulo    VARCHAR(20),
  autor     VARCHAR(30),
  editorial VARCHAR(15),
  PRIMARY KEY (codigo)
 );

-- 3- Visualice la estructura de la tabla "libros", compruebe la clave primaria.

DESCRIBE libros;

-- 4- Ingrese los siguientes registros:

  -- (1,El aleph,Borges,Planeta);
  -- (2,Martin Fierro,Jose Hernandez,Emece);
  -- (3,Aprenda PHP,Mario Molina,Emece);
  -- (4,Cervantes,Borges,Paidos);
  -- (5,Matematica estas ahi, Paenza, Paidos);
  
  INSERT INTO libros (codigo, titulo, autor, editorial)
  VALUES(1,'El aleph','Borges','Planeta'),
        (2,'Martin Fierro','Jose Hernandez','Emece'),
        (3,'Aprenda PHP','Mario Molina','Emece'),
        (4,'Cervantes','Borges','Paidos'),
        (5,'Matematica estas ahi', 'Paenza', 'Paidos');

-- 5- Seleccione todos los registros.

SELECT * FROM libros;

-- 6- Ingrese un registro con código no repetido y nombre de autor repetido.

INSERT INTO libros (codigo, titulo, autor, editorial)
VALUES(6, 'PowerBI', 'Mario Molina', 'PwC');

-- 7- Ingrese un registro con código no repetido y título y editorial repetidos.

INSERT INTO libros (codigo, titulo, autor, editorial)
VALUES(7, 'PowerBI', 'Juan Vazquez', 'PwC');

-- Utilizo la siguiente consulta para erificar que las inserciones se hayan ejecutado correctamente:

SELECT * FROM libros;

-- 8- Intente ingresar un registro que repita el campo clave.

INSERT INTO libros (codigo, titulo, autor, editorial)
VALUES(5, 'SQL', 'Juan Vazquez', 'AgusMusanti');

-- NO se puede repetir codigo al ser una clave primaria.
-- Nos da el error 1062: "Duplicate entry '5' for key libros.PRYMARY'
