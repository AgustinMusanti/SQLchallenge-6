-- 1- Elimine la tabla "cursos", si existe.

DROP TABLE IF EXISTS cursos;

-- 2- Cree la tabla "cursos" con la siguiente estructura:

CREATE TABLE cursos(
  codigo      TINYINT UNSIGNED AUTO_INCREMENT,
  tema        VARCHAR(20) NOT NULL,
  dias        SET('lunes','martes','miercoles','jueves','viernes','sabado') NOT NULL,
  horario     ENUM('AM','PM') NOT NULL,
  clases      TINYINT UNSIGNED DEFAULT 1,
  fechainicio DATE,
  costo       DECIMAL(5,2) UNSIGNED,
  PRIMARY KEY(codigo)
 );

/* 3- Ingrese los siguientes registros:

('PHP básico','lunes,martes,miercoles','AM',18,'2006-08-07',200);
('PHP básico','lunes,martes,miercoles','PM',18,'2006-08-14',200);
('PHP básico','sabado','AM',18,'2006-08-05',280);
('PHP avanzado','martes,jueves','AM',20,'2006-08-01',350);
('JavaScript','lunes,martes,miercoles','PM',15,'2006-09-11',150);
('Paginas web','martes,jueves','PM',10,'2006-08-08',250);
('Paginas web','sabado','AM',10,'2006-08-12',280);
('Paginas web','lunes,viernes','AM',10,'2006-08-21',200);
('Paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2006-09-18',180);
('Paginas web','lunes,viernes','PM',10,'2006-09-25',280);
('JavaScript','lunes,martes,viernes,sabado','PM',12,'2006-09-18',150); */

INSERT INTO cursos (tema, dias, horario, clases, fechainicio, costo)
VALUES('PHP básico','lunes,martes,miercoles','AM',18,'2006-08-07',200),
      ('PHP básico','lunes,martes,miercoles','PM',18,'2006-08-14',200),
      ('PHP básico','sabado','AM',18,'2006-08-05',280),
      ('PHP avanzado','martes,jueves','AM',20,'2006-08-01',350),
      ('JavaScript','lunes,martes,miercoles','PM',15,'2006-09-11',150),
      ('Paginas web','martes,jueves','PM',10,'2006-08-08',250),
      ('Paginas web','sabado','AM',10,'2006-08-12',280),
      ('Paginas web','lunes,viernes','AM',10,'2006-08-21',200),
      ('Paginas web','lunes,martes,miercoles,jueves,viernes','AM',10,'2006-09-18',180),
      ('Paginas web','lunes,viernes','PM',10,'2006-09-25',280),
      ('JavaScript','lunes,martes,viernes,sabado','PM',12,'2006-09-18',150);

/* 4- Una persona quiere inscribirse en un curso de "PHP" y sólo tiene disponibles los sábados. 
Localice los cursos de "PHP" que se dictan solamente los sábados: *( */

SELECT * FROM cursos
WHERE tema LIKE '%PHP%' AND
dias='sabado';

/* 5- Otra persona quiere aprender a diseñar páginas web, tiene disponibles todas las mañanas excepto 
los miércoles. Vea si existe algún curso que cumpla con sus necesidades: */

SELECT * FROM cursos
WHERE tema LIKE '%paginas web%' AND
horario='AM' AND
dias NOT LIKE '%miercoles%';

/* 6- Otra persona necesita aprender JavaScript, tiene disponibles todos las tardes excepto los jueves 
y quiere un curso que no supere las 15 clases para el mes de setiembre. Busque algún curso para 
esta persona: */

SELECT * FROM cursos
WHERE tema='JavaScript' AND
horario='PM' AND dias
NOT LIKE 'jueves' AND
clases<=15 AND
MONTH(fechainicio)=9;
