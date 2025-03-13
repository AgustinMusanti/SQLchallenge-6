/* Un comercio que envía pizzas y empanadas a domicilio registra los pedidos diariamente en una tabla 
llamada "pedidos" con los siguientes datos:

 - numero de pedido, autoincrementable, entero positivo comienza en 1 y menor a 200 aprox.
 - nombre: piza o empanada,
 - tipo: por ejemplo, si es pizza: especial, muzarela, etc., si son empanadas: salteñas, picantes, 
   arabes, etc.
 - precio: precio por unidad, valor con decimales que no supera los $99.99 y será siempre mayor a 0,
 - cantidad: cantidad de articulos, entero positivo desde 1 e inferior a 200 aprox.
 - domicilio del cliente. */

-- 1- Elimine la tabla "pedidos" si existe.

DROP TABLE IF EXISTS pedidos;

-- 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo.

CREATE TABLE pedidos(
numero    INTEGER AUTO_INCREMENT,
nombre    CHAR(1) NOT NULL, -- P de Pizza o E de Empanada
tipo      VARCHAR(15) NOT NULL,
precio    FLOAT UNSIGNED NOT NULL,
domicilio VARCHAR(30) NOT NULL,
PRIMARY KEY(numero));

-- Utilizo el siguiente comando para ver las caractetisticas de la tabla:

DESCRIBE pedidos;
