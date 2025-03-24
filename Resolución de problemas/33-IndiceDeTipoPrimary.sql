-- 1- Elimine la tabla "clientes" si existe.

DROP TABLE IF EXISTS clientes;

-- 2- Créela con los siguientes campos y clave:

CREATE TABLE clientes(
  documento CHAR(8),
  apellido  VARCHAR(20),
  nombre    VARCHAR(20),
  domicilio VARCHAR(30),
  PRIMARY KEY(documento)
 );

-- 3- Vea la estructura de los índices la tabla y analice la información:

SHOW INDEX FROM clientes;

/* El índice usa BTREE, que es la estructura más común para búsquedas eficientes.
   Es único y no permite valores NULL en las columnas que lo componen.
   Aparece en la columna Key_name como "PRIMARY", indicando que es la clave primaria de la tabla.
   Seq_in_index = 1, lo que significa que es la primera (y generalmente única) columna en el índice. */
