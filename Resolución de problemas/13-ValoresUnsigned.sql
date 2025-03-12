-- 1- Elimine la tabla "peliculas", si existe.

DROP TABLE IF EXISTS peliculas;

-- 2- Cree la tabla "peliculas" teniendo en cuenta el rango de valores que almacenará cada campo:

-- -codigo: entero a partir de 1, autoincrementable,
-- -titulo: caracteres de 40 de longitud, no nulo,
-- -actor: cadena de 20,
-- -duracion: float positivo,
-- -clave primaria: codigo.

CREATE TABLE peliculas(
  codigo   INTEGER UNSIGNED AUTO_INCREMENT,
  titulo   VARCHAR(40) NOT NULL,
  actor    VARCHAR(20),
  duracion FLOAT UNSIGNED,
  PRIMARY KEY(codigo)
 );

-- Al crear la tabla, MySQL nos tira un "warning" que no es aconsejable usar "Unsigned" en tipos de datos númericos.
-- Además, será removido en proximás actualizaciones

-- 3- Visualice la estructura de la tabla.

DESCRIBE peliculas;
