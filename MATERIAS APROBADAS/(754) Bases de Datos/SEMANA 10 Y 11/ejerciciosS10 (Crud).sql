-- 1. Generar el código para crear la Tabla. --
create database if not exists EJERCICIOS_CRUD;
use EJERCICIOS_CRUD;

CREATE TABLE PACIENTE (
ID_PACIENTE INT PRIMARY KEY, 
APELLIDO VARCHAR(30) NOT NULL, 
NOMBRE VARCHAR(30) NOT NULL, 
DOB DATE NOT NULL, 
GENERO CHAR(1) NOT NULL, 
PESO DOUBLE NOT NULL, 
ALTURA DOUBLE NOT NULL,  
ESTA_VACUNADO CHAR(1) NOT NULL);

-- 2. Generar el código que inserte los datos incluidos en la tabla. --

INSERT INTO PACIENTE 
VALUES 
(15223, 'Smith', 'Deniz', '2018-12-31', 'F', 21.4, 29.2, 'Y'), 
(15224, 'Agarwal', 'Arjun', '2017-08-29', 'M', 28.1, 34.2, 'Y'), 
(15225, 'Adams', 'Poppy', '2015-02-14', 'F', 34.0, 39.2, 'N'), 
(15226, 'Johnson', 'Tierra', '2019-08-15', 'F', 14.6, 24.5, 'Y'), 
(15227, 'Khouri', 'Mohammed', '2014-03-30', 'M', 41.5, 44.1, 'Y'), 
(15228, 'Jones', 'Ben', '2011-04-04', 'M', 70.1, 52.2, 'Y'), 
(15229, 'Kowalczyk', 'Alexandra', '2019-08-27', 'F', 15.2, 23.9, 'Y'); 


-- 3. Insertar adicionalmente dos pacientes dentro de la tabla. --

INSERT INTO PACIENTE
VALUES 
(15230, 'Suarez', 'Juan', '2013-04-08', 'M', 35.4, 51.2, 'N'), 
(15231, 'Argento', 'Jose', '2014-02-19', 'M', 18.1, 44.2, 'N');

select *
from paciente

-- 4. Actualizar el estado de Vacunado en YES para aquellos pacientes que son de Genero F y el DOB está entre el 2015 y 2019. 


-- OPCIÓN A: --

UPDATE PACIENTE
SET ESTA_VACUNADO = 'Y' 
WHERE GENERO = 'F'  
AND DOB BETWEEN '2015-01-01' AND '2019-12-31'; 


-- OPCIÓN B: --

UPDATE PACIENTE 
SET ESTA_VACUNADO = 'Y' 
WHERE GENERO = 'F'  
AND YEAR(DOB) >= 2015 AND YEAR(DOB) <= 2019; 

-- OPCIÓN C: --

UPDATE PACIENTE 
SET ESTA_VACUNADO = 'Y' 
WHERE GENERO = 'F'  
AND YEAR(DOB) BETWEEN 2015 AND 2019; 



-- 5. Actualizar la columna Genero de F a Femenino de las pacientes 15223, 15225 y 15229. --

ALTER TABLE PACIENTE 
MODIFY COLUMN GENERO VARCHAR(25) NOT NULL; 
UPDATE PACIENTE 
SET GENERO = 'Femenino' 
WHERE ID_PACIENTE IN (15223, 15225, 15229); 


-- 6. Incrementar en 2kg aquellos pacientes que su altura este por arriba de los 39. 


UPDATE PACIENTE 
SET PESO = PESO + 2 
WHERE ALTURA > 39; 


-- 7. Eliminar de la tabla aquellos pacientes donde en el campo Nombre contengan la secuencia de letras “am”. --

DELETE FROM PACIENTE 
WHERE NOMBRE LIKE '%am%'; 


-- 8.  Eliminar de la tabla aquellos pacientes donde el Genero sea M, no esté vacunado y el DOB este entre el 2014 y 2015. --


DELETE FROM PACIENTE 
WHERE GENERO = 'M' AND ESTA_VACUNADO = 'N'  
AND YEAR(DOB) BETWEEN 2014 AND 2015; 

-- 9. Borrar el contendido de toda la tabla de manera más ágil y con el menor costo. --

TRUNCATE PACIENTE; 

-- 10. Eliminar la Tabla. --

DROP TABLE PACIENTE; 