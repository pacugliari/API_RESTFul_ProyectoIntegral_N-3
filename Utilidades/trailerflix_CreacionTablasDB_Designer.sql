CREATE DATABASE trailerflix
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE trailerflix;

CREATE TABLE `Categorias` (
	`idCategoria` INT NOT NULL AUTO_INCREMENT,
	`descripcion` varchar(100) NOT NULL,
	PRIMARY KEY (`idCategoria`)
);

CREATE TABLE `Generos` (
	`idGenero` INT NOT NULL AUTO_INCREMENT,
	`descripcion` varchar(100) NOT NULL,
	PRIMARY KEY (`idGenero`)
);

CREATE TABLE `Actores` (
	`idActor` INT NOT NULL AUTO_INCREMENT,
	`nombre` varchar(100) NOT NULL,
	PRIMARY KEY (`idActor`)
);

CREATE TABLE `PeliculasGeneros` (
	`idPeliculaGenero` INT NOT NULL AUTO_INCREMENT,
	`idPelicula` INT NOT NULL,
	`idGenero` INT NOT NULL,
	PRIMARY KEY (`idPeliculaGenero`)
);

CREATE TABLE `PeliculasRepartos` (
	`idPeliculaReparto` INT NOT NULL AUTO_INCREMENT,
	`idPelicula` INT NOT NULL,
	`idActor` INT NOT NULL,
	PRIMARY KEY (`idPeliculaReparto`)
);

CREATE TABLE `Peliculas` (
	`idPelicula` INT NOT NULL AUTO_INCREMENT,
	`poster` varchar(100) NOT NULL,
	`titulo` varchar(100) NOT NULL,
	`idCategoria` INT NOT NULL,
	`resumen` varchar(1000) NOT NULL,
	`cantidadTemporadas` varchar(3) NOT NULL DEFAULT 'N/A',
	PRIMARY KEY (`idPelicula`)
);

CREATE TABLE `PeliculasTrailers` (
	`idPeliculaTrailer` INT NOT NULL AUTO_INCREMENT,
	`idPelicula` INT NOT NULL,
	`trailer` varchar(100) NOT NULL,
	PRIMARY KEY (`idPeliculaTrailer`)
);

ALTER TABLE `PeliculasGeneros` ADD CONSTRAINT `PeliculasGeneros_fk0` FOREIGN KEY (`idPelicula`) REFERENCES `Peliculas`(`idPelicula`);

ALTER TABLE `PeliculasGeneros` ADD CONSTRAINT `PeliculasGeneros_fk1` FOREIGN KEY (`idGenero`) REFERENCES `Generos`(`idGenero`);

ALTER TABLE `PeliculasRepartos` ADD CONSTRAINT `PeliculasRepartos_fk0` FOREIGN KEY (`idPelicula`) REFERENCES `Peliculas`(`idPelicula`);

ALTER TABLE `PeliculasRepartos` ADD CONSTRAINT `PeliculasRepartos_fk1` FOREIGN KEY (`idActor`) REFERENCES `Actores`(`idActor`);

ALTER TABLE `Peliculas` ADD CONSTRAINT `Peliculas_fk0` FOREIGN KEY (`idCategoria`) REFERENCES `Categorias`(`idCategoria`);

ALTER TABLE `PeliculasTrailers` ADD CONSTRAINT `PeliculasTrailers_fk0` FOREIGN KEY (`idPelicula`) REFERENCES `Peliculas`(`idPelicula`);








