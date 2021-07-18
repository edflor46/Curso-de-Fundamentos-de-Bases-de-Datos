/*Crear base de datos*/
CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8 ;

/*Crear tabla categorias*/
CREATE TABLE `blog`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Crear tabla etiquetas*/
  CREATE TABLE `blog`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Crear tabla usuarios*/
  CREATE TABLE `blog`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
