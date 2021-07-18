# Fundamentos de Bases de Datos

## Historia de las RBD
**Las bases de datos** surgen de la necesidad de conservar la información más allá de lo que existe en la memoria ``RAM``.

**Las bases de datos** basadas en archivos eran datos guardados en texto plano, fáciles de guardar pero muy difíciles de consultar y por la necesidad de mejorar esto nacen **las bases de datos** relacionales. Su inventor ``Edgar Codd`` dejó ciertas reglas para asegurarse de que toda la filosofía de **las bases de datos** no se perdiera, estandarizando el proceso. 

## Entidades y atributos

Una **entidad** es algo similar a un **objeto** (**programación orientada a objetos**) y representa algo en el mundo real, incluso algo abstracto. Tienen **atributos** que son las cosas que los hacen ser una entidad y por convención se ponen en plural.

Los **atributos compuestos** son aquellos que tienen **atributos** ellos mismos.

Los **atributos llave** son aquellos que identifican a la **entidad** y no pueden ser repetidos. Existen:

- ``Naturales``: son inherentes al objeto como el número de serie.

- ``Clave artificial``: no es inherente al objeto y se asigna de manera arbitraria.
Entidades fuertes: son entidades que pueden sobrevivir por sí solas.

- ``Entidades débiles``: no pueden existir sin una entidad fuerte y se representan con un cuadrado con doble línea.

- ``Identidades débiles por identidad``: no se diferencian entre sí más que por la clave de su identidad fuerte.
Identidades débiles por existencia: se les asigna una clave propia.

## Relaciones
**Las relaciones** nos permiten ligar o unir nuestras diferentes entidades y se representan con rombos. Por convención se definen a través de verbos.

Las relaciones tienen una propiedad llamada cardinalidad y tiene que ver con números. Cuántos de un lado pertenecen a cuántos del otro lado:

``Cardinalidad: 1 a 1``
``Cardinalidad: 0 a 1``
``Cardinalidad: 1 a N``
``Cardinalidad: 0 a N``

## Diagrama ER Proyecto Blog
![diagrama_er](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626544622/Academia-Java.-CDMX/Fundamentos-Base-Datos/diagrama_ER_ubpybs.png)

## Diagrama Físico: tipos de datos y constraints
Para llevar a la práctica un diagrama debemos ir más allá y darle detalle con parámetros como:

Tipos de dato:

 - **Texto:** ``CHAR(n)``, ``VARCHAR(n)``, ``TEXT``
 - **Números:** ``INTEGER``, ``BIGINT``, ``SMALLINT``, ``DECIMAL(n,s)``, ``NUMERIC(n,s)``
 - **Fecha/hora:** ``DATE``, ``TIME``, ``DATETIME``, ``TIMESTAMP``
 - **Lógicos:** ``BOOLEAN``
 - **Constraints** (Restricciones)

- **NOT NULL:** Se asegura que la columna no tenga valores nulos
- **UNIQUE:** Se asegura que cada valor en la columna no se repita
- **PRIMARY KEY:** Es una combinación de ``NOT NULL`` y ``UNIQUE``
- **FOREIGN KEY:** Identifica de manera única una tupla en otra tabla
- **CHECK:** Se asegura que el valor en la columna cumpla una condición dada
- **DEFAULT:** Coloca un valor por defecto cuando no hay un valor especificado
- **INDEX:** Se crea por columna para permitir búsquedas más rápidas

## Diagrama Físico: normalización

**La normalización** como su nombre lo indica nos ayuda a dejar todo de una forma normal. Esto obedece a las 12 reglas de Codd y nos permiten separar componentes en la base de datos:

- **Primera forma normal (1FN):** Atributos atómicos (Sin campos repetidos)
- **Segunda forma normal (2FN):** Cumple 1FN y cada campo de la tabla debe depender de una clave única.
- **Tercera forma normal (3FN):** Cumple 1FN y 2FN y los campos que NO son clave, NO deben tener dependencias.
- **Cuarta forma normal (4FN):** Cumple 1FN, 2FN, 3FN y los campos multivaluados se identifican por una clave única.

## Diagrama Físico: normalizando Platziblog
![diagrama_fisicoNormalizando](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626549986/Academia-Java.-CDMX/Fundamentos-Base-Datos/Normalizacion_lj1way.png)

## RDB ¿Qué?
**RDBMS** significa Relational Database Management System o sistema manejador de bases de datos relacionales. Es un programa que se encarga de seguir las reglas de Codd y se puede utilizar de manera programática.

## SQL
**SQL** significa ``Structured Query Language`` y tiene una estructura clara y fija. Su objetivo es hacer un solo lenguaje para consultar cualquier manejador de bases de datos volviéndose un gran estándar.

Ahora existe el **NOSQL** o ``Not Only Structured Query Language`` que significa que no sólo se utiliza SQLen las bases de datos no relacionales.

## DDL create
**SQL** tiene dos grandes sublenguajes:
**DDL** o Data Definition Language que nos ayuda a crear la estructura de una base de datos. Existen 3 grandes comandos:

- ``Create:`` Nos ayuda a crear bases de datos, tablas, vistas,índices, etc.
- ``Alter:`` Ayuda a alterar o modificar entidades.
``Drop:`` Nos ayuda a borrar. Hay que tener cuidado al utilizarlo.

3 objetos que manipularemos con el lenguaje **DDL**:

- Database o bases de datos
- Table o tablas. Son la traducción a SQL de las entidades
- View o vistas: Se ofrece la proyección de los datos de la base de datos de forma entendible.
<pre>
    <code>
    //Create Database
    CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8 ;</code>
</pre>

<pre>
    <code>
    //Create Table
      CREATE TABLE `test`.`people` (
     `id_person` INT NOT NULL AUTO_INCREMENT,
     `las_name` VARCHAR(45) NULL,
     `first_name` VARCHAR(45) NULL,
     `address` VARCHAR(45) NULL,
     `city` VARCHAR(45) NULL,
     PRIMARY KEY (`id_person`))
   ENGINE = InnoDB
   DEFAULT CHARACTER SET = utf8;</code>
</pre>

## CREATE VIEW y DDL ALTER
<pre>
    <code>
    //Create view
        USE `blog`;
        CREATE  OR REPLACE VIEW `new_view` AS
        SELECT * FROM blog.people;</code>
</pre>

<pre>
    <code>
    //Alter table
       ALTER TABLE `blog`.`people` 
       ADD COLUMN `date_of_birth` DATETIME NULL AFTER `city`;</code>
</pre>

![alter_table](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626563322/Academia-Java.-CDMX/Fundamentos-Base-Datos/alter_yqdnyc.png)

<pre>
    <code>
    //Alter table drop
       ALTER TABLE `blog`.`people` 
       DROP COLUMN `date_of_birth`;</code>
</pre>

## DDL DROP

<pre>
    //Drop table
    <code>DROP TABLE `blog`.`people`;</code>
</pre>

<pre>
    //Drop database
    <code>DROP DATABASE `blog`;</code>
</pre>

## DML

**DML** trata del contenido de la base de datos. Son las siglas de Data Manipulation Language y sus comandos son:

- ``Insert:`` Inserta o agrega nuevos registros a la tabla.
- ``Update:`` Actualiza o modifica los datos que ya existen.
- ``Delete:`` Esta sentencia es riesgosa porque puede borrar el contenido de una tabla.
- ``Select:`` Trae información de la base de datos.

### INSERT
<pre>
    <code>
    INSERT INTO people(last_name, first_name, address, city)
    VALUES ('Flores', 'Luis', 'D. Conocido', 'Acapulco');
    </code>
</pre>

### UPDATE
<pre>
    <code>
    UPDATE people SET last_name = 'Ramirez', city = 'Merida' WHERE person_id = 1;
    </code>
</pre>

### DELETE 
<pre>
    <code>
    //Condicionado
    DELETE FROM people WHERE id_person = 1;
    </code>
</pre>

<pre>
    <code>
    //Borrar todo el contenido
    DELETE FROM people;
    </code>
</pre>

### SELECT

<pre>
    <code>
    //Seleccionar todo el contenido
    SELECT * FROM people;
    </code>
</pre>
![select_all](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626565854/Academia-Java.-CDMX/Fundamentos-Base-Datos/select_all_iovwst.png)

<pre>
    <code>
    //Seleccionar condicionalmente
    SELECT last_name, first_name FROM people;
    </code>
</pre>
![select_withName](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626565857/Academia-Java.-CDMX/Fundamentos-Base-Datos/select_with_name_pcif21.png)
<pre>
    <code>
    //Seleccionar especidificamente
    SELECT last_name, first_name FROM people;
    </code>
</pre>
![select_conditional](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626565854/Academia-Java.-CDMX/Fundamentos-Base-Datos/select_conditional_ujjekp.png)


## Creando blog: tablas independientes
<pre>
    <code>
/*Crear base de datos*/
CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8 ;
    </code>
</pre>

  <pre>
    <code>
/*Crear tabla categorias*/
CREATE TABLE `blog`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));
    </code>
</pre>
  <pre>
    <code>
  /*Crear tabla etiquetas*/
  CREATE TABLE `blog`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));
    </code>
</pre>

  <pre>
    <code>
  /*Crear tabla usuarios*/
  CREATE TABLE `blog`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
    </code>
</pre>

## Creando Platziblog: tablas dependientes

<pre>
    <code>
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
    </code>
</pre>

<pre>
    <code>
          /*Foreign Keys post - usuarios*/
ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `blog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;
    </code>
</pre>

<pre>
    <code>
           /*Foreign Keys post - categorias*/
ALTER TABLE `blog`.`posts` 
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts` 
ADD CONSTRAINT `posts_categorias`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `blog`.`categorias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
    </code>
</pre>

<pre>
    <code>
           /*crear tabla pibote etiqueta*/
CREATE TABLE `blog`.`posts_etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `posts_id` INT NOT NULL,
  `etiquetas_id` INT NOT NULL,
  PRIMARY KEY (`id`));
    </code>
</pre>

<pre>
    <code>
            /*Foreign key postEtiquetas - posts*/

ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_posts_idx` (`posts_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_posts`
  FOREIGN KEY (`posts_id`)
  REFERENCES `blog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
    </code>
</pre>

<pre>
    <code>
             /*Foreign key postEtiquetas - etiquetas*/
ALTER TABLE `blog`.`posts_etiquetas` 
ADD INDEX `postsetiquetas_etiquetas_idx` (`etiquetas_id` ASC) VISIBLE;

ALTER TABLE `blog`.`posts_etiquetas` 
ADD CONSTRAINT `postsetiquetas_etiquetas`
  FOREIGN KEY (`etiquetas_id`)
  REFERENCES `blog`.`etiquetas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
    </code>
</pre>

## Estructura básica de un Query
Los **queries** son la forma en la que estructuramos las preguntas que se harán a la base de datos. Transforma preguntas en sintaxis.

El **query** tiene básicamente 2 partes: S``ELECT`` y ``FROM`` y puede aparecer una tercera como ``WHERE``.

- La estrellita o asterisco (*) quiere decir que vamos a seleccionar todo sin filtrar campos.

<pre>
    <code>
        SELECT * FROM posts WHERE fecha_publicacion = '2024'
    </code>
</pre>

## SELECT

**SELECT** se encarga de proyectar o mostrar datos.

- El nombre de las columnas o campos que estamos consultando puede ser cambiado utilizando AS después del nombre del campo y poniendo el nuevo que queremos tener:

<pre>
    <code>
    SELECT titulo AS encabezado FROM posts;</code>
</pre>

- Existe una función de SELECT para poder contar la cantidad de registros. Esa información (un número) será el resultado del query:
<pre>
    <code>
    SELECT COUNT(*)FROM posts;</code>
</pre>

## INSERT usuarios

<pre>
    <code>
         /*INSERT USUARIOS*/
INSERT INTO `usuarios` (`id`,`login`,`password`,`nickname`,`email`) VALUES 
(1,'israel','jc8209*(^GCHN_(hcLA','Israel','israel@platziblog.com'),
(2,'monica','(*&^LKJDHC_(*#YDLKJHODG','Moni','monica@platziblog.com'),
(3,'laura','LKDJ)_*(-c.M:\"[pOwHDˆåßƒ∂','Lau','laura@platziblog.com'),
(4,'edgar','LLiy)CX*Y:M<A<SC_(*N>O','Ed','edgar@platziblog.com'),
(5,'perezoso','&N_*JS)_Y)*(&TGOKS','Oso Pérez','perezoso@platziblog.com');
    </code>
</pre>