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
  
  /*Crear tabla posts*/
  CREATE TABLE `blog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(130) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL,
  `contenido` TEXT NOT NULL,
  `estatus` CHAR(8) NOT NULL DEFAULT 'Activo',
  `usuario_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Foreign Keys post - usuarios*/
  ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
  
   /*Foreign Keys post - categorias*/
ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_categorias`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `blog`.`categorias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  /*Crear tabla Comentarios*/
  CREATE TABLE `blog`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuerpo_comentario` TEXT NOT NULL,
  `usuario_id` INT NOT NULL,
  `post_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Foreign key comentarios - usuarios*/
ALTER TABLE `blog`.`comentarios` 
ADD INDEX `comentarios_usuarios_idx` (`usuario_id` ASC) VISIBLE;

ALTER TABLE `blog`.`comentarios` 
ADD CONSTRAINT `comentarios_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  /*Foreign key comentarios - post*/
ALTER TABLE `blog`.`comentarios` 
CHANGE COLUMN `post_id` `post_id` INT NOT NULL ,
ADD INDEX `comentarios_posts_idx` (`post_id` ASC) VISIBLE;

ALTER TABLE `blog`.`comentarios` 
ADD CONSTRAINT `comentarios_posts`
  FOREIGN KEY (`post_id`)
  REFERENCES `blog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*crear tabla pibote etiqueta*/
CREATE TABLE `blog`.`posts_etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `posts_id` INT NOT NULL,
  `etiquetas_id` INT NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Foreign key postEtiquetas - posts*/

ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_posts_idx` (`posts_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_posts`
  FOREIGN KEY (`posts_id`)
  REFERENCES `blog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
   /*Foreign key postEtiquetas - etiquetas*/
ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_etiquetas_idx` (`etiquetas_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_etiquetas`
  FOREIGN KEY (`etiquetas_id`)
  REFERENCES `blog`.`etiquetas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;