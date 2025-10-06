CREATE DATABASE IF NOT EXISTS PARCIAL;
USE PARCIAL;

CREATE TABLE IF NOT EXISTS persona (
  id_persona int(11) NOT NULL AUTO_INCREMENT,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  dni int(11) NOT NULL DEFAULT 0,
  tipo_doc varchar(10) DEFAULT NULL,
  direccion_nro int(11) DEFAULT NULL,
  direccion_calle varchar(100) DEFAULT NULL,
  direccion_cp varchar(10) DEFAULT NULL,
  PRIMARY KEY (id_persona),
  UNIQUE KEY dni (dni)
);

CREATE TABLE IF NOT EXISTS profesor (
  id_prof int(11) NOT NULL AUTO_INCREMENT,
  fecha_ingreso date DEFAULT NULL,
  id_persona int(11) NOT NULL,
  PRIMARY KEY (id_prof),
  KEY id_persona (id_persona),
  CONSTRAINT profesor_idfk_1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
);

CREATE TABLE IF NOT EXISTS curso (
  cod_curso int(11) NOT NULL,
  nombre varchar(100) DEFAULT NULL,
  id_tutor int(11) DEFAULT NULL,
  PRIMARY KEY (cod_curso),
  KEY id_tutor (id_tutor),
  CONSTRAINT curso_idfk_1 FOREIGN KEY (id_tutor) REFERENCES profesor (id_prof)
);

CREATE TABLE IF NOT EXISTS alumno (
  id_alumno int(11) NOT NULL AUTO_INCREMENT,
  email varchar(100) UNIQUE DEFAULT NULL,
  id_persona int(11) NOT NULL,
  PRIMARY KEY (id_alumno),
  KEY id_persona (id_persona),
  CONSTRAINT alumno_idfk_1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
);

CREATE TABLE IF NOT EXISTS asignatura (
  cod_asig int(11) NOT NULL,
  nombre varchar(100) DEFAULT NULL,
  horas int(11) DEFAULT NULL,
  cod_curso int(11) NOT NULL,
  id_prof int(11) NOT NULL,
  PRIMARY KEY (cod_asig),
  KEY cod_curso (cod_curso),
  KEY id_prof (id_prof),
  CONSTRAINT asignatura_idfk_1 FOREIGN KEY (cod_curso) REFERENCES curso (cod_curso),
  CONSTRAINT asignatura_idfk_2 FOREIGN KEY (id_prof) REFERENCES profesor (id_prof)
);

CREATE TABLE IF NOT EXISTS aula (
  cod_aula int(11) NOT NULL,
  piso int(11) DEFAULT NULL,
  cant_pupitres int(11) DEFAULT NULL,
  PRIMARY KEY (cod_aula)
);

CREATE TABLE IF NOT EXISTS clase (
  id_clase int(11) NOT NULL AUTO_INCREMENT,
  dia int(11) DEFAULT NULL,
  mes int(11) DEFAULT NULL,
  hora time DEFAULT NULL,
  cod_aula int(11) NOT NULL,
  cod_asig int(11) NOT NULL,
  PRIMARY KEY (id_clase),
  KEY cod_aula (cod_aula),
  KEY cod_asig (cod_asig),
  CONSTRAINT clase_idfk_1 FOREIGN KEY (cod_aula) REFERENCES aula (cod_aula),
  CONSTRAINT clase_idfk_2 FOREIGN KEY (cod_asig) REFERENCES asignatura (cod_asig)
);

CREATE TABLE IF NOT EXISTS cursada (
  id_cursada int(11) NOT NULL AUTO_INCREMENT,
  id_asig int(11) NOT NULL,
  id_alumno int(11) NOT NULL,
  incidencias text DEFAULT NULL,
  nota_alumno decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (id_cursada),
  KEY id_asig (id_asig),
  KEY id_alumno (id_alumno),
  CONSTRAINT cursada_idfk_1 FOREIGN KEY (id_asig) REFERENCES asignatura (cod_asig),
  CONSTRAINT cursada_idfk_2 FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno)
);

CREATE TABLE IF NOT EXISTS telefono (
  id_telefono int(11) NOT NULL AUTO_INCREMENT,
  numero varchar(20) DEFAULT NULL,
  id_persona int(11) NOT NULL,
  PRIMARY KEY (id_telefono),
  KEY id_persona (id_persona),
  CONSTRAINT telefono_idfk_1 FOREIGN KEY (id_persona) REFERENCES persona (id_persona)
);

-- Dumping data for table centro_educativo.persona: ~9 rows (approximately)
INSERT INTO persona (id_persona, nombre, apellido, dni, tipo_doc, direccion_nro, direccion_calle, direccion_cp) VALUES
	(1, 'Ana', 'Gómez', 20345678, 'DNI', 123, 'San Martín', '1605'),
	(2, 'Luis', 'Pérez', 25432123, 'DNI', 897, 'Lavalle', '1428'),
	(3, 'Lucía', 'Martínez', 30111222, 'DNI', 0, 'San Martín', '1001'),
	(4, 'Carlos', 'Fernández', 33123456, 'DNI', 101, 'Lavalle', '1001'),
	(5, 'Laura', 'Lopez', 29998888, 'DNI', 45, 'Maipú', '1605'),
	(6, 'Diego', 'Sauco', 28765432, 'DNI', 5464, 'San Martín', '1023'),
	(7, 'Florencia', 'Rivas', 31123456, 'DNI', 0, '', '3000'),
	(8, 'Juan', 'Lopez', 43345345, 'DNI', NULL, NULL, '1605'),
	(9, 'Juan', 'Sanchez', 34345435, 'DNI', 0, 'Lavalle', '1605');

-- Dumping data for table centro_educativo.profesor: ~4 rows (approximately)
INSERT INTO profesor (id_prof, fecha_ingreso, id_persona) VALUES
	(1, '2020-03-15', 6),
	(2, '2018-02-20', 7),
	(3, '2025-05-28', 9),
	(4, '2021-05-29', 8);
    
    INSERT INTO curso (cod_curso, nombre, id_tutor) VALUES
	(1, '7B', 2),
	(2, '9C', 3);

INSERT INTO alumno (id_alumno, email, id_persona) VALUES
	(1, 'ana.gomez@email.com', 1),
	(2, 'luis.perez@email.com', 2),
	(3, 'lucia.martinez@email.com', 3),
	(4, 'carlos.fernandez@email.com', 4),
	(5, 'laura.lopez@email.com', 5);


-- Dumping data for table centro_educativo.asignatura: ~6 rows (approximately)
INSERT INTO asignatura (cod_asig, nombre, horas, cod_curso, id_prof) VALUES
	(1, 'Álgebra', 60, 1, 3),
	(2, 'Análisis Matemático', 80, 1, 4),
	(3, 'Literatura', 50, 2, 2),
	(4, 'Geografia', 40, 1, 1),
	(5, 'Ingles', 10, 2, 2),
	(6, 'Fisica', 20, 2, 3);

INSERT INTO aula (cod_aula, piso, cant_pupitres) VALUES
	(101, 1, 25),
	(102, 1, 30),
	(201, 2, 20),
	(202, 2, 28);

INSERT INTO clase (id_clase, dia, mes, hora, cod_aula, cod_asig) VALUES
	(1, 1, 5, '09:00:00', 101, 1),
	(2, 2, 5, '10:00:00', 101, 2),
	(3, 3, 5, '11:00:00', 201, 3);

-- Dumping data for table centro_educativo.cursada: ~12 rows (approximately)
INSERT INTO cursada (id_cursada, id_asig, id_alumno, incidencias, nota_alumno) VALUES
	(1, 1, 1, 'Sin incidencias', 8.50),
	(2, 1, 2, 'Faltó una clase', 6.00),
	(3, 2, 1, 'Buena participación', 6.00),
	(4, 3, 3, 'Sin incidencias', 7.50),
	(5, 1, 3, NULL, 4.00),
	(6, 2, 1, NULL, 8.00),
	(7, 2, 2, 'Sin incidencias', 9.00),
	(8, 4, 5, NULL, 7.00),
	(9, 4, 4, 'Buena participación', 10.00),
	(10, 5, 2, NULL, 9.00),
	(11, 5, 3, NULL, 7.00),
	(12, 6, 5, NULL, 5.00);

-- Dumping data for table centro_educativo.telefono: ~7 rows (approximately)
INSERT INTO telefono (id_telefono, numero, id_persona) VALUES
	(1, '1134567890', 1),
	(2, '1167891234', 2),
	(3, '1143216789', 3),
	(4, '1176543210', 4),
	(5, '1132109876', 5),
	(6, '1198765432', 6),
	(7, '1123456789', 7);

-- 1 --

select nombre, apellido
from persona;

-- 2 --

select email
from alumno
order by email asc; 

-- 3 --

select nombre
from persona
where fecha_ingreso <= '2019-01-01';