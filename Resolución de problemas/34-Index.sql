-- 1- Elimine la tabla "medicamentos", si existe.

DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla e indéxela por el campo "laboratorio":

CREATE TABLE medicamentos(
  codigo      INT UNSIGNED AUTO_INCREMENT,
  nombre      VARCHAR(20) NOT NULL,
  laboratorio VARCHAR(20),
  precio      DECIMAL(6,2) UNSIGNED,
  cantidad    INT UNSIGNED,
  PRIMARY KEY(codigo),
  INDEX i_laboratorio (laboratorio)
 );

-- 3- Visualice los índices de la tabla "medicamentos" y analice la información:

SHOW INDEX FROM medicamentos;

/* Este índice mejora la velocidad de las consultas que filtran, buscan o ordenan por
   la columna laboratorio. En lugar de recorrer toda la tabla, MySQL usa el índice para 
   encontrar los datos más rápido.
   En este caso, MySQL usará el índice i_laboratorio para buscar solo las filas que coincidan,
   en lugar de escanear toda la tabla. */
