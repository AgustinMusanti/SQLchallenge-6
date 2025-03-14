/* Problema:

Un comercio que envía pizzas y empanadas a domicilio registra los pedidos diariamente en una tabla 
llamada "pedidos" con los siguientes datos:

 - numero de pedido, autoincrementable, entero positivo comienza en 1 y menor a 200 aprox.
 - nombre: pizza o empanada, por defecto "empanada",
 - tipo: por ejemplo, si es pizza: especial, muzarela, etc., si son empanadas: arabes, pollo, jamón 
   y queso, criollas, etc.
 - precio: precio por unidad, valor con decimales que no supera los $99.99 y será siempre mayor a 
   0, por defecto "1",
 - cantidad: cantidad de articulos, entero positivo desde 1 e inferior a 200 aprox., por 
   defecto "12"
 - domicilio del cliente. */

-- 1- Elimine la tabla "pedidos" si existe.

DROP TABLE IF EXISTS pedidos;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

CREATE TABLE pedidos (
    numero_pedido INT AUTO_INCREMENT PRIMARY KEY, 
    nombre    ENUM('pizza', 'empanada') DEFAULT 'empanada',
    tipo      VARCHAR(50) NOT NULL,
    precio    DECIMAL(4,2) DEFAULT 1 CHECK (precio > 0 AND precio <= 99.99),
    cantidad  INT DEFAULT 12 CHECK (cantidad >= 1 AND cantidad < 200),
    domicilio VARCHAR(255) NOT NULL
);

/* 3- Ingrese los siguientes registros:

 ('piza','muzarela','4.00',3,'Sarmiento 235');
 ('arabe','1.00',24,'Urquiza 296');
 ('empanada','salteña','Colon 309');
 ('arabe','San Martin 444');
 ('piza','especial','4.00','Avellaneda 395'); */


INSERT INTO pedidos (nombre,tipo,precio,cantidad,domicilio)
VALUES('pizza','muzarela','4.00',3,'Sarmiento 235');

INSERT INTO pedidos (tipo,precio,cantidad,domicilio)
VALUES('arabe','1.00',24,'Urquiza 296');


INSERT INTO pedidos (nombre,tipo,domicilio)
VALUES('empanada','salteña','Colon 309');

INSERT INTO pedidos (tipo,domicilio)
VALUES('arabe','San Martin 444');

INSERT INTO pedidos (nombre,tipo,precio,domicilio)
VALUES('pizza','especial','4.00','Avellaneda 395');

-- 4- Muestre todos los campos de todos los pedidos para ver cómo se guardaron los datos no ingresados.

SELECT * FROM pedidos;

-- Podemos ver que donde NO indicamos un dato, el default que establecimos "salto" correctamente
