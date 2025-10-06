CREATE DATABASE IF NOT EXISTS EJERCICIOS_SELECT;
USE EJERCICIOS_SELECT;

CREATE TABLE IF NOT EXISTS Empleado (
 nro INT PRIMARY KEY not null,
 cod_esp INT NOT NULL,
 nombre VARCHAR(100),
 nro_jefe INT,
 sueldo INT NOT NULL,
 f_ingreso DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Especialidad (
 cod_esp INT PRIMARY KEY NOT NULL,
 descripcion TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Area (
 cod_Area VARCHAR(10) NOT NULL,
 descripcion TEXT NOT NULL,
 UNIQUE KEY cod_area (cod_Area)
);

CREATE TABLE IF NOT EXISTS Trabaja (
 ID_Trabaja INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 cod_Area VARCHAR(10) NOT NULL,
 nro INT,
 CONSTRAINT nro_empleado FOREIGN KEY (nro) REFERENCES empleado (nro),
 CONSTRAINT cod_Area FOREIGN KEY (cod_Area) REFERENCES Area (cod_Area)
);

-- INSERT --

INSERT INTO Empleado VALUES 
(1000, 1, "Juan", NULL, 10000, "2000-1-1"),
(1001, 2, "Pedro", 1000, 5000, "2005-5-1"),
(1002, 2, "Daniel", 1000, 2000, "2009-10-1");

INSERT INTO Especialidad VALUES 
(1, "Gerente"),
(2, "Operario");

INSERT INTO Area VALUES 
("A1", "Gerente"),
("A2", "Operario");

INSERT INTO trabaja VALUES 
(1, "A1", 1000),
(2, "A2", 1000),
(3, "A1", 1001),
(4, "A2", 1002);


DROP TABLE empleado, especialidad, area, trabaja;

-- SELECT --

-- 1 --

SELECT nombre
FROM Empleado;


-- 2 --

SELECT nombre, nro AS numero
FROM Empleado;

-- 3 --

SELECT *
FROM Empleado;

-- 4 --

SELECT nombre
FROM Empleado
ORDER BY sueldo;

-- 5 --

SELECT nombre
FROM Empleado
ORDER BY sueldo, f_ingreso DESC;

-- 6 --

SELECT nro, nombre
FROM Empleado
WHERE sueldo > 3000;

-- 7 --

SELECT nro, nombre
FROM Empleado
WHERE sueldo < 8000
AND nombre = "Pedro";

-- 8 --

SELECT nombre
FROM Empleado
WHERE f_ingreso BETWEEN "2008-01-01" AND "2008-12-31";

-- 9 --

SELECT nombre
FROM Empleado
WHERE nro_jefe IS NULL;

-- 10 --

SELECT nombre, sueldo
FROM Empleado
WHERE nombre LIKE "A%";

-- 11 --

SELECT nombre, sueldo
FROM Empleado
WHERE nro IN (1, 2, 5, 7, 9);

-- 12 --

SELECT DISTINCT nro_jefe
FROM Empleado
WHERE nro_jefe IS NOT NULL;

-- MULTITABLA --

SELECT *
FROM Especialidad;

SELECT *
FROM Area;

SELECT *
FROM trabaja;

-- 1 --

SELECT EM.nombre, ES.descripcion
FROM Empleado EM,
Especialidad ES
WHERE EM.cod_esp = ES.cod_esp;

SELECT EM.nombre, ES.descripcion
FROM Empleado EM JOIN
Especialidad ES ON EM.cod_esp = ES.cod_esp;

SELECT EM.nombre, J.nombre jefe
FROM Empleado EM JOIN Empleado J ON EM.nro_jefe = J.nro;

SELECT EM.nombre, J.nombre jefe
FROM Empleado EM LEFT JOIN Empleado J ON EM.nro_jefe = J.nro;

-- 2 --

SELECT EM.nombre
FROM Empleado EM,
Trabaja T
WHERE EM.nro = T.nro
AND T.cod_area = "A1";

-- 3 --

select EM.nombre, J.nombre jefe
from Empleado EM join empleado J ON EM.nro_jefe = J.nro;

-- 4 --

select EM.nombre, J.nombre jefe
from Empleado EM left join empleado J ON EM.nro_jefe = J.nro;

-- 5 --

select EM.nombre
from Empleado EM join trabaja T ON EM.nro = T.nro_empleado JOIN
Area A ON A.cod_area = T.cod_Area
where A.descripcion LIKE "A1"
AND EM.sueldo > 5000;
