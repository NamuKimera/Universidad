CREATE DATABASE IF NOT EXISTS Almacen2;
USE Almacen2;

# Creo las tablas 

CREATE TABLE ALMACEN( 
Nro INT(5) PRIMARY KEY, 
Nombre VARCHAR(20) NOT NULL, 
Responsable VARCHAR(50) NOT NULL); 

CREATE TABLE ARTICULO( 
CodArt INT(5) PRIMARY KEY, 
Descripcion VARCHAR (50) NOT NULL, 
Precio DOUBLE); 

CREATE TABLE MATERIAL( 
CodMat INT(6) PRIMARY KEY, 
Descripcion VARCHAR(100) NOT NULL); 

CREATE TABLE CIUDAD( 
CodCiudad INT(2) PRIMARY KEY, 
Nombre VARCHAR(100) NOT NULL); 

CREATE TABLE PROVEEDOR( 
CodProv INT(5) PRIMARY KEY, 
Nombre VARCHAR(20) NOT NULL, 
Domicilio VARCHAR(100), 
CodCiudad INT(2) NOT NULL, 
FOREIGN KEY (CodCiudad) REFERENCES Ciudad (CodCiudad)); 

CREATE TABLE CONTIENE( 
Cod_Contiene INT(3) PRIMARY KEY AUTO_INCREMENT, 
Nro INT(5) NOT NULL, 
CodArt INT(5) NOT NULL, 
FOREIGN KEY (Nro) REFERENCES ALMACEN (Nro), 
FOREIGN KEY (CodArt) REFERENCES ARTICULO (CodArt)); 

CREATE TABLE COMPUESTO_POR( 
Cod_Composicion INT(3) PRIMARY KEY AUTO_INCREMENT, 
CodArt INT(5) NOT NULL, 
CodMat INT(6) NOT NULL, 
FOREIGN KEY (CodArt) REFERENCES ARTICULO (CodArt), 
FOREIGN KEY (CodMat) REFERENCES MATERIAL (CodMat)); 

CREATE TABLE PROVISTO_POR( 
Cod_Provisto INT(3) PRIMARY KEY AUTO_INCREMENT, 
CodMat INT(6) NOT NULL, 
CodProv INT(5) NOT NULL, 
FOREIGN KEY (CodMat) REFERENCES MATERIAL (CodMat), 
FOREIGN KEY (CodProv) REFERENCES PROVEEDOR (CodProv)); 

# Inserto Datos 

INSERT INTO ALMACEN (Nro, Nombre, Responsable) 
VALUES (001, 'La Original', 'Alfredo'), 
(002, 'Galpon', 'Esteban'), 
(003, 'Almacen de Don Juan', 'Juan'), 
(004, 'La Tiendita', 'Roberto'); 

INSERT INTO ARTICULO (CodArt, Descripcion, Precio) 
VALUES (001, 'Pan', 130.70), 
(002, 'Facturas', 300.00), 
(003, 'Cheese Cake', 450.87), 
(004, 'Pasta Frola', 278.90); 

INSERT INTO MATERIAL (CodMat, Descripcion) 
VALUES (001, 'Aceite'), 
(002, 'Harina'), 
(003, 'Levadura'), 
(004, 'Huevo'), 
(005, 'Azucar'), 
(006, 'Sal'), 
(007, 'Agua'); 

INSERT INTO CIUDAD(CodCiudad, Nombre) 
VALUES (1, 'La Plata'), 
(2, 'Capital Federal'), 
(3, 'Ramos Mejia'), 
(4, 'La Matanza'); 

INSERT INTO PROVEEDOR (CodProv, Nombre, Domicilio, 
CodCiudad) 
VALUES(1, 'Arcor', 'Ayacucho 1234', 1), 
(2, 'Molinos', 'Yatay 456', 4), 
(3, 'Ledesma', 'Mario Bravo 987', 1), 
(4, 'Marolio', 'Potosi 098', 2), 
(5, 'Glaciar', 'Sarmiento 555', 3), 
(6, 'Johnson', 'Potosi 123', 1); 

INSERT INTO CONTIENE (Nro, CodArt) 
VALUES (001, 001), 
(001, 002), 
(001, 003), 
(001, 004), 
(002, 003), 
(002, 004), 
(003, 001), 
(004, 002); 

INSERT INTO COMPUESTO_POR (CodArt, CodMat) 
VALUES(001, 001), 
(001, 002), 
(001, 003), 
(002, 002), 
(002, 005), 
(002, 007), 
(003, 001), 
(003, 002), 
(003, 006), 
(004, 007); 

INSERT INTO PROVISTO_POR(CodMat, CodProv) 
VALUES (001, 1), 
(002, 3), 
(003, 5), 
(004, 4), 
(005, 2), 
(006, 2), 
(007, 5), 
(005, 5);

-- 1

select p.nombre #Aca seleccionamos el nombre de proveedor
from proveedor p left join provisto_por pp on p.CodProv=pp.CodProv
where pp.Cod_Provisto IS NULL; #Aca el condicional que devuelve los proveedores que no poseen ningun material
