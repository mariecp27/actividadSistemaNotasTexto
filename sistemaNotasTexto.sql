DROP DATABASE IF EXISTS sistemaNotasTexto;
CREATE DATABASE sistemaNotasTexto;

USE sistemaNotasTexto;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	primer_nombre VARCHAR(25) NOT NULL,
	segundo_nombre VARCHAR(25) DEFAULT NULL,
	primer_apellido VARCHAR(25) NOT NULL,
	segundo_apellido VARCHAR(25) DEFAULT NULL,
    email VARCHAR(30) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS acciones;
CREATE TABLE acciones(
	id_accion INT PRIMARY KEY AUTO_INCREMENT,
	accion VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS notas;
CREATE TABLE notas(
	id_nota INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
	fecha_creacion DATE NOT NULL,
    fecha_modificacion TIMESTAMP DEFAULT NOW() NOT NULL,
    descripcion TEXT NOT NULL,
    puede_eliminar TINYINT NOT NULL,
    id_usuario INT NOT NULL,
    id_accion INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_accion) REFERENCES acciones(id_accion)
);

DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
	categoria VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS categoria_notas;
CREATE TABLE categoria_notas(
	id_categoria_nota INT PRIMARY KEY AUTO_INCREMENT,
	id_nota INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_nota) REFERENCES notas(id_nota),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE 
);

INSERT INTO usuarios VALUES (
	NULL, 'Marysa', NULL, 'Harding', 'Uccelli', 'muccelli0@vimeo.com'),
	(NULL, 'Sansone', 'Naéva', 'Allaker', 'Westpfel', 'swestpfel1@bbc.co.uk'),
    (NULL, 'Lucita', 'Bérangère', 'Stanlick', NULL, 'lpaulisch2@dmoz.org'),
    (NULL, 'Moises', 'Méghane', 'Sammonds', 'Tomaszczyk', 'mtomaszczyk3@over-blog.com'),
    (NULL, 'Justus', NULL, 'Bierton', NULL, 'jkettley4@altervista.org'),
    (NULL, 'Janessa', 'Alizée', 'Castaneda', 'Grahlmans', 'jgrahlmans5@columbia.edu'),
    (NULL, 'Albie', NULL, 'Figliovanni', 'Boulde', 'aboulde6@stumbleupon.com'),
    (NULL, 'Grier', 'Östen', 'Mulheron', 'Habbeshaw', 'ghabbeshaw7@bravesites.com'),
    (NULL, 'Krista', 'Clémentine', 'Frisch', NULL, 'khogsden8@noaa.gov'),
    (NULL, 'Merralee', 'Gisèle', 'Iredell', 'Mulchrone', 'mmulchrone9@rakuten.co.jp');
    
INSERT INTO acciones VALUES (
	NULL, 'Crear'),
	(NULL, 'Modificar'),
	(NULL, 'Eliminar');
    
INSERT INTO notas VALUES (
	NULL, 'Nota de prueba 01', '2018-02-02', DEFAULT, 'Esta es la nota de prueba 01', 0, 1, 1),
	(NULL, 'Nota de prueba 02', '2020-02-02', DEFAULT, 'Esta es la nota de prueba 02', 1, 2, 2),
    (NULL, 'Nota de prueba 03', '2015-03-01', DEFAULT, 'Esta es la nota de prueba 03', 1, 3, 3),
    (NULL, 'Nota de prueba 04', '2016-10-02', DEFAULT, 'Esta es la nota de prueba 04', 0, 4, 1),
    (NULL, 'Nota de prueba 04', '2000-09-10', DEFAULT, 'Esta es la nota de prueba 05', 1, 5, 1),
    (NULL, 'Nota de prueba 06', '2018-12-12', DEFAULT, 'Esta es la nota de prueba 06', 0, 5, 2),
    (NULL, 'Nota de prueba 07', '2019-05-15', DEFAULT, 'Esta es la nota de prueba 07', 1, 7, 2),
    (NULL, 'Nota de prueba 08', '2018-02-28', DEFAULT, 'Esta es la nota de prueba 08', 0, 10, 1),
    (NULL, 'Nota de prueba 09', '2016-03-01', DEFAULT, 'Esta es la nota de prueba 09', 1, 8, 3),
    (NULL, 'Nota de prueba 10', '2022-02-03', DEFAULT, 'Esta es la nota de prueba 10', 1, 6, 1);
    
INSERT INTO categorias VALUES (
	NULL, 'Noticias'),
    (NULL, 'Comunidad'),
    (NULL, 'Servicios'),
    (NULL, 'Entretenimiento'),
    (NULL, 'Negocios'),
    (NULL, 'Belleza'),
    (NULL, 'Herramientas'),
    (NULL, 'Tecnología'),
    (NULL, 'Estilo de vida'),
    (NULL, 'Tutoriales');
    
INSERT INTO categoria_notas VALUES (
	NULL, 1, 1),
    (NULL, 1, 3),
    (NULL, 2, 2),
    (NULL, 4, 4),
    (NULL, 4, 7),
    (NULL, 4, 8),
    (NULL, 5, 10),
    (NULL, 6, 5),
    (NULL, 7, 1),
    (NULL, 8, 2);