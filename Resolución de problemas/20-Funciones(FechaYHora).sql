-- 1- Elimine la tabla "empleados" si existe.

DROP TABLE IF EXISTS empleados;

-- 2- Cree y utilice la siguiente tabla:

CREATE TABLE empleados(
  documento       CHAR(8) NOT NULL,
  nombre          VARCHAR(30) NOT NULL,
  sexo            CHAR(1),
  domicilio       VARCHAR(30),
  fechaIngreso    DATE,
  fechaNacimiento DATE,
  sueldoBasico    DECIMAL(5,2) UNSIGNED,
  PRIMARY KEY(documento)
 );

/* 3- Ingrese algunos registros:

('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550);
('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700);
('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420);
('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390);
('30615426','Federico Gonzalez','m','Peru 390','1996-08-15','1985-05-01',580); */

INSERT INTO empleados
VALUES('22333111','Juan Perez','m','Colon 123','1990-02-01','1970-05-10',550),
      ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650),
      ('20111222','Hector Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510),
      ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700),
      ('20555444','Maria Laura Torres','f','San Martin 1122','2000-05-15','1965-12-22',700),
      ('30000234','Alberto Soto','m','Peru 232','2003-08-15','1989-10-10',420),
      ('20125478','Ana Gomez','f','Sarmiento 975','2004-06-14','1976-09-21',350),
      ('24154269','Ofelia Garcia','f','Triunvirato 628','2004-09-23','1974-05-12',390),
      ('30615426','Federico Gonzalez','m','Peru 390','1996-08-15','1985-05-01',580);

/* 4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
cumplen ese mes. Necesitamos los nombres y fecha de nacimiento de los empleados que cumplen años en 
el mes de mayo: */

SELECT nombre,fechaNacimiento FROM empleados
WHERE MONTH(fechaNacimiento)=5;

/* 5- También es política de la empresa, aumentar el 1% del sueldo básico a los empleados, cada vez 
que cumplen un año más de servicio. Necesitamos los nombres, fecha de ingreso a la empresa y sueldo 
básico de todos los empleados que cumplen un año más de servicio en el mes de agosto, y una columna 
calculando el incremento del sueldo: */

SELECT nombre,fechaIngreso,sueldoBasico,
       (sueldoBasico+sueldoBasico*0.01) AS 'Sueldo Incrementado'
FROM empleados
WHERE MONTH(fechaIngreso)=8;

-- 6- Verifique si la actualización se realizó:

SELECT nombre, sueldobasico
FROM empleados
WHERE MONTH(fechaIngreso)=8; 

/* 7- Si el empleado cumple 10,20,30,40... años de servicio, se le regala una placa recordatoria. 
La secretaria de Gerencia necesita saber la cantidad de años de servicio que cumplen los empleados que 
ingresaron en el mes de agosto para encargar dichas placas: */

SELECT nombre,fechaIngreso,
YEAR(CURRENT_DATE)-YEAR(fechaIngreso) AS 'Años de servicio'
FROM empleados
WHERE MONTH(fechaIngreso)=8;

/* En la sentencia anterior, extraigo el año de las fechas actual y de ingreso con la función "year()" y
las resto, para calcular los años de servicio. */
