INSERT INTO municipio (nombre) VALUES ('Palomar');

INSERT INTO vivienda (`direccion_calle`, `direccion_numero`, 
							`direccion_localidad`, `codigo_municipio`) VALUES ('Rivadavia', 777, 'Moron', 2);

INSERT INTO vivienda (`m2Terreno`, `direccion_calle`, `direccion_numero`, `direccion_localidad`, 
								`m2edificados`, `codigo_municipio`) 
								VALUES (7467.99, 'Beruti', 9536, 'San Justo', 988.56, 1);

INSERT INTO propiedad (`codigo_propietario`, `codigo_vivienda`) VALUES (3, 2);