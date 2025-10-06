CREATE TABLE Municipio(	codigo				INT PRIMARY KEY AUTO_INCREMENT,
								intendente_Actual VARCHAR(100),
                        nombre 				VARCHAR(100) NOT NULL UNIQUE);

CREATE TABLE Vivienda(	codigo 					INT PRIMARY KEY AUTO_INCREMENT,
								m2Terreno 				DECIMAL (10,2),
                        direccion_calle 		VARCHAR(100) NOT NULL,
                        direccion_numero 		INT NOT NULL,
                        direccion_localidad 	VARCHAR(100) ,
                        direccion_cp 			INT,
                        m2edificados 			DECIMAL,
                        codigo_municipio 			INT,
                        FOREIGN KEY(codigo_municipio) REFERENCES municipio(codigo)
							);

CREATE TABLE Habitante(	cod_habitante INT PRIMARY KEY AUTO_INCREMENT, 
								tipo_doc VARCHAR(25) NOT NULL DEFAULT "DNI",
                        nro_doc INT NOT NULL,
                        nombre VARCHAR(100) NOT NULL,
                        apellido VARCHAR(100) NOT NULL,
                        fecha_de_nacimiento DATE,
                        codigo_vivienda INT NOT NULL, 
								FOREIGN KEY (codigo_vivienda) REFERENCES Vivienda(codigo)
							);

CREATE TABLE Propiedad(	codigo_propiedad 		INT PRIMARY KEY AUTO_INCREMENT,
								codigo_propietario 	INT NOT NULL,
                        codigo_vivienda  		INT NOT NULL,
                        FOREIGN KEY (codigo_propietario) REFERENCES Habitante(cod_habitante),
                        FOREIGN KEY (codigo_vivienda) REFERENCES Vivienda(codigo)
							);