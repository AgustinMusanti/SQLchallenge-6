-- 1- Elimine la tabla "agenda" si existe.

DROP TABLE IF EXISTS agenda;

-- 2- Cree la tabla con la siguiente estructura:

CREATE TABLE agenda(
  apellido  VARCHAR(30),
  nombre    VARCHAR(20) NOT NULL,
  domicilio VARCHAR(30),
  telefono  VARCHAR(11),
  mail      VARCHAR(30)
 );

/* 3- Ingrese los siguientes registros:

('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com');
('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com');
('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com');
('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com');
('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com');
('Ferreyra','Patricia','Colon 1534','4585858',null);
('Perez','Susana','San Martin 333',null,null);
('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com');
('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com'); */

INSERT INTO agenda
VALUES('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com'),
      ('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com'),
      ('Lopez','Juan','Avellaneda 900',null,'juancitoLopez@gmail.com'),
      ('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com'),
      ('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com'),
      ('Ferreyra','Patricia','Colon 1534','4585858',null),
      ('Perez','Susana','San Martin 333',null,null),
      ('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com'),
      ('Lopez','Maria','Salta 314',null,'lopezmariayo@gmail.com');

-- 4- Busque todos los mails que contengan la cadena "gmail":

SELECT * FROM agenda
WHERE mail REGEXP 'gmail';

-- 5- Busque los nombres y apellidos que no tienen "z" ni "g":

SELECT * FROM agenda
WHERE nombre NOT REGEXP '[zg]' 
AND apellido NOT REGEXP '[zg]';

-- 6- Busque los apellidos que tienen por lo menos una de las letras de la "v" hasta la "z" (v,w,x,y,z):

SELECT * FROM agenda
WHERE apellido REGEXP '[v-z]';

-- 7- Seleccione los apellidos que terminen en "ez":

SELECT * FROM agenda
WHERE apellido REGEXP 'ez$';

-- 8- Seleccione los apellidos, nombres y domicilios de los amigos cuyos apellidos contengan 2 letras "i":

SELECT apellido,nombre,domicilio FROM agenda
WHERE nombre REGEXP 'i.*i';

-- 9- Seleccione los teléfonos que tengan 7 caracteres exactamente:

SELECT * FROM agenda
WHERE telefono REGEXP '^.......$';

-- 10- Seleccione el nombre y mail de todos los amigos cuyos mails tengan al menos 20 caracteres:

SELECT nombre,mail FROM agenda
WHERE mail REGEXP '....................';
