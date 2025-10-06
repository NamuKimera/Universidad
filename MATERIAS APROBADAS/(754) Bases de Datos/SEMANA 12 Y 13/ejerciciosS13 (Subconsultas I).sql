CREATE DATABASE IF NOT EXISTS Almacenautos;
USE Almacenautos;

# Creo las tablas 

CREATE TABLE Marca( 
IdMarca INT(5) PRIMARY KEY AUTO_INCREMENT, 
Descripcion VARCHAR(20) NOT NULL); 

CREATE TABLE Vehiculo( 
Patente VARCHAR(10) PRIMARY KEY, 
Color VARCHAR(20) NOT NULL, 
Anio INT (5) NOT NULL, 
Capacidad INT(5), 
Puertas INT (5), 
IdMarca INT(5), 
FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca)); 

CREATE TABLE Localidad 
(idLocalidad INT(5) PRIMARY KEY AUTO_INCREMENT, 
Descripcion VARCHAR(50) NOT NULL); 

CREATE TABLE Cliente( 
Legajo INT(5) PRIMARY KEY, 
Nombre VARCHAR (50) NOT NULL, 
Apellido VARCHAR (50) NOT NULL, 
Telefono VARCHAR(50), 
idLocalidad INT(5), 
FOREIGN KEY (idLocalidad) references Localidad (idLocalidad)); 

INSERT INTO LOCALIDAD (Descripcion) 
VALUES ('Ramos Mejia'), ('Laferrere'), ('San Justo'), ('Haedo'); 

INSERT INTO Cliente (Legajo, Nombre, Apellido, Telefono, idLocalidad) 
VALUES (1, 'Juan', 'Pepe', '1530111222339', 1), 
(2, 'Santiago', 'Molinos', '1530222333448', 1), 
(3, 'Ricardo', 'Marolio', '1530333444557', 2), 
(4, 'Roberto', 'Ledesma', '1530444555666', 3), 
(5, 'Alberto', 'Johnson', '1530555666775', 4); 

INSERT INTO Marca (Descripcion) 
VALUES ('Nissan'), 
('Renault'), 
('Ford'), 
('Volkswagen'), 
('Fiat'); 

INSERT INTO Vehiculo(Patente, Color, Anio, Capacidad, Puertas, IdMarca) 
VALUES ('AAA111', 'Azul', 2021, 2, 3, 1), 
('AAA112', 'Rojo', 2010, 10, 5, 2), 
('AAA113', 'Violeta', 2022, 11, 3, 3), 
('AAA114', 'Naranja', 1990, 5, 5, 1), 
('AAA115', 'Verde', 1994, 6, 3, 4), 
('AAA116', 'Azul', 2020, 11, 2, 2), 
('AAA117', 'Blanco', 1998, 9, 3, 5), 
('FFF555', 'Negro' , 2019, 4, 5, 1); 

-- 1

CREATE TABLE Alquiler 
(Id INT(5) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Patente VARCHAR(10) NOT NULL, 
legCliente INT(5) NOT NULL, 
FechaAlquiler DATE NOT NULL, 
Importe DOUBLE NOT NULL, 
CantDias INT(5), 
FOREIGN KEY (Patente) references Vehiculo (Patente), 
FOREIGN KEY (legCliente) references Cliente (Legajo)); 

INSERT INTO Alquiler(Patente, legCliente, FechaAlquiler, Importe, CantDias) 
VALUES ('AAA111', 1, '2020-01-01', 300.00, 5), 
('AAA111', 2, '2020-02-01', 700.00, 6), 
('AAA112', 1, '2020-03-01', 100.00, 1), 
('AAA111', 3, '2020-03-01', 3000.00, 15), 
('AAA112', 3, '2020-03-01', 200.00, 2), 
('AAA113', 3, '2021-10-01', 1000.00, 6), 
('AAA115', 1, '2021-07-01', 15000.00, 31), 
('FFF555', 3, '2022-01-31', 500.00, 9), 
('AAA114', 5, '2020-02-20', 4000.00, 8);

-- 2

select * #Aca seleccionamos todo de vehiculo
from vehiculo v join marca m on m.IdMarca=v.IdMarca
order by m.descripcion, v.patente; #Aca ordenamos por desc de marca y patente de vehiculo

-- 3

select m.Descripcion, count(*) as vehiculosTotal, MAX(v.capacidad)
from vehiculo v join marca m on m.IdMarca=v.IdMarca
where v.Puertas >= 4
group by m.Descripcion;

-- 4

select c.Legajo, c.Nombre, c.Apellido, v.Patente, v.Color, a.Importe, a.FechaAlquiler, sum(Importe * 0.15) as Impuestos #aca seleccionamos todo lo necesario
from Cliente c join alquiler a on a.legCliente=c.Legajo join vehiculo v on v.Patente=a.Patente
where a.FechaAlquiler between "2020-02-01" and "2020-02-29" #El condicional que indica todos los alquileres de febrero 2020
group by c.Legajo, v.Patente, a.Importe, a.FechaAlquiler;

-- 5

INSERT INTO Vehiculo(Patente, Color, Anio, Capacidad, Puertas, IdMarca) 
VALUES ('ABC234', 'Rojo', 2021, 5, 4, 5);

-- 6

UPDATE vehiculo
set Color = "Gris"
where Patente = 'FFF555';

-- 7

select v.Patente
from vehiculo v
where v.Capacidad IN (select MAX(v.capacidad) from vehiculo v);

-- 8


-- 9


-- 10

select * #aca seleccionamos todo lo necesario
from Cliente c join alquiler a on a.legCliente=c.Legajo join vehiculo v on v.Patente=a.Patente
where a.FechaAlquiler IN (SELECT a.FechaAlquiler, count from alquiler a where a.FechaAlquiler between "2020-02-01" and "2020-03-31"); #El condicional que indica todos los alquileres de febrero 2020

