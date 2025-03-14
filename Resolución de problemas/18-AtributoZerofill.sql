-- 1- Elimine la tabla "cuentas", si existe.

DROP TABLE IF EXISTS cuentas;

-- 2- Cree y utilice la tabla:

CREATE TABLE cuentas(
  numero    INT(8) ZEROFILL AUTO_INCREMENT,
  documento CHAR(8) NOT NULL,
  nombre    VARCHAR(30),
  saldo     DECIMAL(9,2),
  PRIMARY KEY(numero)
 );

-- 3- Visualice la estructura de la tabla:

DESCRIBE cuentas;

/* 4- Ingrese los siguientes registros:

 (1234,'22333444','Juan Perez',2000.60);
 (2566,'23333444','Maria Pereyra',5050);
 (5987,'24333444','Marcos Torres',200);
 (14434,'25333444','Ana Juarez',8000.60); */

INSERT INTO cuentas (numero,documento,nombre,saldo)
VALUES(1234,'22333444','Juan Perez',2000.60),
      (2566,'23333444','Maria Pereyra',5050),
      (5987,'24333444','Marcos Torres',200),
      (14434,'25333444','Ana Juarez',8000.60);

-- 5- Vea cómo se guardaron los números de cuenta:

SELECT * FROM cuentas;

-- 6- Ingrese un valor negativo para el número de cuenta:

INSERT INTO cuentas (numero,documento,nombre,saldo)
VALUES(-1234,'27333444','Luis Duarte',2800);

/* Esta inserción no la toma ya que al poner el atributo "Zerofill", MySQL interpreta que no puede haber negativos, por lo
que la columna se torna "Unsigned". */
