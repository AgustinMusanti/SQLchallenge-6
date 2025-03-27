-- 1- Elimine la tabla "medicamentos", si existe:

DROP TABLE IF EXISTS medicamentos;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE medicamentos(
  codigo      INT UNSIGNED NOT NULL,
  nombre      VARCHAR(20) NOT NULL,
  laboratorio VARCHAR(20),
  precio      DECIMAL(6,2) UNSIGNED
);

-- 3- Visualice la estructura de la tabla "medicamentos".

DESCRIBE medicamentos;

-- 4- Agregue una clave primaria por "codigo":

ALTER TABLE medicamentos
ADD PRIMARY KEY(codigo);

/* La clave agregada no es auto_increment, por ello, al agregar registros debemos ingresar el código, 
si no lo hacemos, se almacenará el valor "0" en el primer registro agregado */

-- 5- Modifique el campo convirtiéndolo en autoincrementable:

ALTER TABLE medicamentos
MODIFY codigo INT UNSIGNED AUTO_INCREMENT;

-- 6- Veamos los registros:

SELECT * FROM medicamentos;

-- NO habia registros hasta ese momento.

/* 7- Ingrese los registros:

('Paracetamol 500','Bago',1.90);
('Bayaspirina','Bayer',2.10); */

INSERT INTO medicamentos (nombre, laboratorio, precio)
VALUES('Paracetamol 500','Bago',1.90),
      ('Bayaspirina','Bayer',2.10);

-- 8- Intente eliminar la clave primaria:

ALTER TABLE medicamentos
DROP PRIMARY KEY;

/* Aparece un mensaje de error. La clave no se puede eliminar porque el campo "codigo" 
es "auto_increment" y si existe un campo con este atributo DEBE ser clave primaria. */

-- 9- Modifique el campo "codigo" quitándole el atributo "auto_increment":

ALTER TABLE medicamentos
MODIFY codigo INT UNSIGNED NOT NULL;

-- 10- Elimine la clave primaria:

ALTER TABLE medicamentos
DROP PRIMARY KEY;

-- En esta ocasión se elimino la primary key sin problemas.
