# Fundamentos de Bases de Datos

## Historia de las RBD

**Las bases de datos** surgen de la necesidad de conservar la información más allá de lo que existe en la memoria ``RAM``.

**Las bases de datos** basadas en archivos eran datos guardados en texto plano, fáciles de guardar pero muy difíciles de consultar y por la necesidad de mejorar esto nacen **las bases de datos** relacionales. Su inventor ` `Edgar Codd` ` dejó ciertas reglas para asegurarse de que toda la filosofía de **las bases de datos** no se perdiera, estandarizando el proceso. 

## Entidades y atributos

Una **entidad** es algo similar a un **objeto** (**programación orientada a objetos**) y representa algo en el mundo real, incluso algo abstracto. Tienen **atributos** que son las cosas que los hacen ser una entidad y por convención se ponen en plural.

Los **atributos compuestos** son aquellos que tienen **atributos** ellos mismos.

Los **atributos llave** son aquellos que identifican a la **entidad** y no pueden ser repetidos. Existen:

* ``Naturales``: son inherentes al objeto como el número de serie.

* ``Clave artificial``: no es inherente al objeto y se asigna de manera arbitraria.
Entidades fuertes: son entidades que pueden sobrevivir por sí solas.

* ``Entidades débiles``: no pueden existir sin una entidad fuerte y se representan con un cuadrado con doble línea.

* ``Identidades débiles por identidad``: no se diferencian entre sí más que por la clave de su identidad fuerte.
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
 - **Números:** ``INTEGER``, ``BIGINT``, ``SMALLINT``, ``DECIMAL(n, s)``, ``NUMERIC(n, s)``
 - **Fecha/hora:** ``DATE``, ``TIME``, ``DATETIME``, ``TIMESTAMP``
 - **Lógicos:** ``BOOLEAN``
 - **Constraints** (Restricciones)

* **NOT NULL:** Se asegura que la columna no tenga valores nulos
* **UNIQUE:** Se asegura que cada valor en la columna no se repita
* **PRIMARY KEY:** Es una combinación de ``NOT NULL`` y ``UNIQUE``
* **FOREIGN KEY:** Identifica de manera única una tupla en otra tabla
* **CHECK:** Se asegura que el valor en la columna cumpla una condición dada
* **DEFAULT:** Coloca un valor por defecto cuando no hay un valor especificado
* **INDEX:** Se crea por columna para permitir búsquedas más rápidas

## Diagrama Físico: normalización

**La normalización** como su nombre lo indica nos ayuda a dejar todo de una forma normal. Esto obedece a las 12 reglas de Codd y nos permiten separar componentes en la base de datos:

* **Primera forma normal (1FN):** Atributos atómicos (Sin campos repetidos)
* **Segunda forma normal (2FN):** Cumple 1FN y cada campo de la tabla debe depender de una clave única.
* **Tercera forma normal (3FN):** Cumple 1FN y 2FN y los campos que NO son clave, NO deben tener dependencias.
* **Cuarta forma normal (4FN):** Cumple 1FN, 2FN, 3FN y los campos multivaluados se identifican por una clave única.

## Diagrama Físico: normalizando Platziblog

![diagrama_fisicoNormalizando](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626549986/Academia-Java.-CDMX/Fundamentos-Base-Datos/Normalizacion_lj1way.png)

## RDB ¿Qué?

**RDBMS** significa Relational Database Management System o sistema manejador de bases de datos relacionales. Es un programa que se encarga de seguir las reglas de Codd y se puede utilizar de manera programática.

## SQL

**SQL** significa ``Structured Query Language``  y tiene una estructura clara y fija. Su objetivo es hacer un solo lenguaje para consultar cualquier manejador de bases de datos volviéndose un gran estándar.

Ahora existe el **NOSQL** o ``Not Only Structured Query Language`` que significa que no sólo se utiliza SQLen las bases de datos no relacionales.

## DDL create

**SQL** tiene dos grandes sublenguajes:
**DDL** o Data Definition Language que nos ayuda a crear la estructura de una base de datos. Existen 3 grandes comandos:

* ``Create:`` Nos ayuda a crear bases de datos, tablas, vistas, índices, etc.
* ``Alter:`` Ayuda a alterar o modificar entidades.
``Drop:`` Nos ayuda a borrar. Hay que tener cuidado al utilizarlo.

3 objetos que manipularemos con el lenguaje **DDL**:

* Database o bases de datos
* Table o tablas. Son la traducción a SQL de las entidades
* View o vistas: Se ofrece la proyección de los datos de la base de datos de forma entendible.
<pre>

    <code>

    //Create Database
    CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8 ;</code>

</pre>

<pre>

    <code>

    //Create Table
      CREATE TABLE `test` . `people` (
`id_person` INT NOT NULL AUTO_INCREMENT,
`las_name` VARCHAR(45) NULL,
`first_name` VARCHAR(45) NULL,
`address` VARCHAR(45) NULL,
`city` VARCHAR(45) NULL,
     PRIMARY KEY ( `id_person` ))

   ENGINE = InnoDB
   DEFAULT CHARACTER SET = utf8; </code>
</pre>

## CREATE VIEW y DDL ALTER

<pre>

    <code>

    //Create view
        USE `blog` ;
        CREATE  OR REPLACE VIEW `new_view` AS
        SELECT * FROM blog.people;</code>

</pre>

<pre>

    <code>

    //Alter table
       ALTER TABLE `blog` . `people`

       ADD COLUMN `date_of_birth` DATETIME NULL AFTER `city` ;</code>

</pre>

![alter_table](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626563322/Academia-Java.-CDMX/Fundamentos-Base-Datos/alter_yqdnyc.png)

<pre>

    <code>

    //Alter table drop
       ALTER TABLE `blog` . `people`

       DROP COLUMN `date_of_birth` ;</code>

</pre>

## DDL DROP

<pre>

    //Drop table
    <code>DROP TABLE `blog` . `people` ;</code>

</pre>

<pre>

    //Drop database
    <code>DROP DATABASE `blog` ;</code>

</pre>

## DML

**DML** trata del contenido de la base de datos. Son las siglas de Data Manipulation Language y sus comandos son:

* ``Insert:`` Inserta o agrega nuevos registros a la tabla.
* ``Update:`` Actualiza o modifica los datos que ya existen.
* ``Delete:`` Esta sentencia es riesgosa porque puede borrar el contenido de una tabla.
* ``Select:`` Trae información de la base de datos.

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
CREATE TABLE `blog` . `categorias` (
`id` INT NOT NULL AUTO_INCREMENT, 
`categoria` VARCHAR(30) NOT NULL, 
  PRIMARY KEY ( `id` )); 

    </code>

</pre>
  <pre>

    <code>

  /*Crear tabla etiquetas*/
  CREATE TABLE `blog` . `etiquetas` (
`id` INT NOT NULL AUTO_INCREMENT, 
`nombre_etiqueta` VARCHAR(30) NOT NULL, 
  PRIMARY KEY ( `id` )); 

    </code>

</pre>

  <pre>

    <code>

  /*Crear tabla usuarios*/
  CREATE TABLE `blog` . `usuarios` (
`id` INT NOT NULL AUTO_INCREMENT, 
`login` VARCHAR(30) NOT NULL, 
`password` VARCHAR(32) NOT NULL, 
`nickname` VARCHAR(40) NOT NULL, 
`email` VARCHAR(40) NOT NULL, 
  PRIMARY KEY ( `id` ), 
  UNIQUE INDEX `email_UNIQUE` ( `email` ASC) VISIBLE); 

    </code>

</pre>

## Creando Platziblog: tablas dependientes

<pre>

    <code>

         /*Crear tabla posts*/
  CREATE TABLE `blog` . `posts` (
`id` INT NOT NULL AUTO_INCREMENT, 
`titulo` VARCHAR(130) NOT NULL, 
`fecha_publicacion` TIMESTAMP NULL, 
`contenido` TEXT NOT NULL, 
`estatus` CHAR(8) NOT NULL DEFAULT 'Activo', 
`usuario_id` INT NOT NULL, 
`categoria_id` INT NOT NULL, 
  PRIMARY KEY ( `id` )); 

    </code>

</pre>

<pre>

    <code>

          /*Foreign Keys post - usuarios*/
ALTER TABLE `blog` . `posts`

ADD INDEX `posts_usuarios_idx` ( `usuario_id` ASC) VISIBLE; 

ALTER TABLE `blog` . `posts`

ADD CONSTRAINT `posts_usuarios`

  FOREIGN KEY ( `usuario_id` )
  REFERENCES `blog` . `usuarios` ( `id` )
  ON DELETE NO ACTION
  ON UPDATE CASCADE; 

    </code>

</pre>

<pre>

    <code>

           /*Foreign Keys post - categorias*/
ALTER TABLE `blog` . `posts`

ADD INDEX `posts_categorias_idx` ( `categoria_id` ASC) VISIBLE; 

ALTER TABLE `blog` . `posts`

ADD CONSTRAINT `posts_categorias`

  FOREIGN KEY ( `categoria_id` )
  REFERENCES `blog` . `categorias` ( `id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION; 

    </code>

</pre>

<pre>

    <code>

           /*crear tabla pibote etiqueta*/
CREATE TABLE `blog` . `posts_etiquetas` (
`id` INT NOT NULL AUTO_INCREMENT, 
`posts_id` INT NOT NULL, 
`etiquetas_id` INT NOT NULL, 
  PRIMARY KEY ( `id` )); 

    </code>

</pre>

<pre>

    <code>

            /*Foreign key postEtiquetas - posts*/

ALTER TABLE `blog` . `posts_etiquetas`

ADD INDEX `postsetiquetas_posts_idx` ( `posts_id` ASC) VISIBLE; 

ALTER TABLE `blog` . `posts_etiquetas`

ADD CONSTRAINT `postsetiquetas_posts`

  FOREIGN KEY ( `posts_id` )
  REFERENCES `blog` . `posts` ( `id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION; 

    </code>

</pre>

<pre>

    <code>

             /*Foreign key postEtiquetas - etiquetas*/
ALTER TABLE `blog` . `posts_etiquetas`

ADD INDEX `postsetiquetas_etiquetas_idx` ( `etiquetas_id` ASC) VISIBLE; 

ALTER TABLE `blog` . `posts_etiquetas`

ADD CONSTRAINT `postsetiquetas_etiquetas`

  FOREIGN KEY ( `etiquetas_id` )
  REFERENCES `blog` . `etiquetas` ( `id` )
  ON DELETE NO ACTION
  ON UPDATE NO ACTION; 

    </code>

</pre>

## Estructura básica de un Query

Los **queries** son la forma en la que estructuramos las preguntas que se harán a la base de datos. Transforma preguntas en sintaxis.

El **query** tiene básicamente 2 partes: ``SELECT`` y ``FROM``  y puede aparecer una tercera como ``WHERE``.

* La estrellita o asterisco (*) quiere decir que vamos a seleccionar todo sin filtrar campos.

<pre>

    <code>

        SELECT * FROM posts WHERE fecha_publicacion = '2024'

    </code>

</pre>

## SELECT

**SELECT** se encarga de proyectar o mostrar datos.

* El nombre de las columnas o campos que estamos consultando puede ser cambiado utilizando AS después del nombre del campo y poniendo el nuevo que queremos tener:

<pre>

    <code>

    SELECT titulo AS encabezado FROM posts; </code>
</pre>

* Existe una función de SELECT para poder contar la cantidad de registros. Esa información (un número) será el resultado del query:
<pre>

    <code>

    SELECT COUNT(*)FROM posts; </code>
</pre>

## INSERT usuarios

<pre>

    <code>

         /*INSERT USUARIOS*/
INSERT INTO `usuarios` ( `id` , `login` , `password` , `nickname` , `email` ) VALUES 
(1, 'israel', 'jc8209*(^GCHN_(hcLA', 'Israel', 'israel@platziblog.com'), 
(2, 'monica', '(*&^LKJDHC_(*#YDLKJHODG', 'Moni', 'monica@platziblog.com'), 
(3, 'laura', 'LKDJ)_*(-c. M:\"[pOwHDˆåßƒ∂', 'Lau', 'laura@platziblog.com'), 
(4, 'edgar', 'LLiy)CX*Y: M<A<SC_(*N>O', 'Ed', 'edgar@platziblog.com'), 
(5, 'perezoso', '&N_*JS)_Y)*(&TGOKS', 'Oso Pérez', 'perezoso@platziblog.com'); 

    </code>

</pre>

## INSERT categorias

<pre>

    <code>

          /*INSERT CATEGORIAS*/
INSERT INTO `categorias` ( `id` , `categoria` ) VALUES 
(1, 'Ciencia'), 
(2, 'Tecnología'), 
(3, 'Deportes'), 
(4, 'Espectáculos'), 
(5, 'Economía'); 

    </code>

</pre>

## INSERT etiquetas

<pre>

    <code>

           /*INSERT ETIQUETAS*/
INSERT INTO `etiquetas` ( `id` , `nombre_etiqueta` ) VALUES 
(1, 'Robótica'), 
(2, 'Computación'), 
(3, 'Teléfonos Móviles'), 
(4, 'Automovilismo'), 
(5, 'Campeonatos'), 
(6, 'Equipos'), 
(7, 'Bolsa de valores'), 
(8, 'Inversiones'), 
(9, 'Brokers'), 
(10, 'Celebridades'), 
(11, 'Eventos'), 
(12, 'Moda'), 
(13, 'Avances'), 
(14, 'Nobel'), 
(15, 'Matemáticas'), 
(16, 'Química'), 
(17, 'Física'), 
(18, 'Largo plazo'), 
(19, 'Bienes Raíces'), 
(20, 'Estilo'); 

    </code>

</pre>

## INSERT posts

<pre>

    <code>

        /*INSERT posts*/
INSERT INTO `posts` ( `id` , `titulo` , `fecha_publicacion` , `contenido` , `estatus` , `usuario_id` , `categoria_id` ) VALUES (43, 'Se presenta el nuevo teléfono móvil en evento', '2030-04-05 00:00:00', 'Phasellus laoreet eros nec vestibulum varius. Nunc id efficitur lacus, non imperdiet quam. Aliquam porta, tellus at porta semper, felis velit congue mauris, eu pharetra felis sem vitae tortor. Curabitur bibendum vehicula dolor, nec accumsan tortor ultrices ac. Vivamus nec tristique orci. Nullam fringilla eros magna, vitae imperdiet nisl mattis et. Ut quis malesuada felis. Proin at dictum eros, eget sodales libero. Sed egestas tristique nisi et tempor. Ut cursus sapien eu pellentesque posuere. Etiam eleifend varius cursus.\n\nNullam viverra quam porta orci efficitur imperdiet. Quisque magna erat, dignissim nec velit sit amet, hendrerit mollis mauris. Mauris sapien magna, consectetur et vulputate a, iaculis eget nisi. Nunc est diam, aliquam quis turpis ac, porta mattis neque. Quisque consequat dolor sit amet velit commodo sagittis. Donec commodo pulvinar odio, ut gravida velit pellentesque vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\n\nMorbi vulputate ante quis elit pretium, ut blandit felis aliquet. Aenean a massa a leo tristique malesuada. Curabitur posuere, elit sed consectetur blandit, massa mauris tristique ante, in faucibus elit justo quis nisi. Ut viverra est et arcu egestas fringilla. Mauris condimentum, lorem id viverra placerat, libero lacus ultricies est, id volutpat metus sapien non justo. Nulla facilisis, sapien ut vehicula tristique, mauris lectus porta massa, sit amet malesuada dolor justo id lectus. Suspendisse sit amet tempor ligula. Nam sit amet nisl non magna lacinia finibus eget nec augue. Aliquam ornare cursus dapibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nDonec ornare sem eget massa pharetra rhoncus. Donec tempor sapien at posuere porttitor. Morbi sodales efficitur felis eu scelerisque. Quisque ultrices nunc ut dignissim vehicula. Donec id imperdiet orci, sed porttitor turpis. Etiam volutpat elit sed justo lobortis, tincidunt imperdiet velit pretium. Ut convallis elit sapien, ac egestas ipsum finibus a. Morbi sed odio et dui tincidunt rhoncus tempor id turpis.\n\nProin fringilla consequat imperdiet. Ut accumsan velit ac augue sollicitudin porta. Phasellus finibus porttitor felis, a feugiat purus tempus vel. Etiam vitae vehicula ex. Praesent ut tellus tellus. Fusce felis nunc, congue ac leo in, elementum vulputate nisi. Duis diam nulla, consequat ac mauris quis, viverra gravida urna.', 'activo', 1, 2), 

    </code>

</pre>

## INSERT posts - etiquetas

<pre>

    <code>

           /*INSERT POST - ETIQUETAS*/
INSERT INTO `etiquetas` ( `id` , `nombre_etiqueta` ) VALUES 
(1, 'Robótica'), 
(2, 'Computación'), 
(3, 'Teléfonos Móviles'), 
(4, 'Automovilismo'), 
(5, 'Campeonatos'), 
(6, 'Equipos'), 
(7, 'Bolsa de valores'), 
(8, 'Inversiones'), 
(9, 'Brokers'), 
(10, 'Celebridades'), 
(11, 'Eventos'), 
(12, 'Moda'), 
(13, 'Avances'), 
(14, 'Nobel'), 
(15, 'Matemáticas'), 
(16, 'Química'), 
(17, 'Física'), 
(18, 'Largo plazo'), 
(19, 'Bienes Raíces'), 
(20, 'Estilo'); 

    </code>

</pre>

## SELECT posts

<pre>

    <code>

       -- ALL
SELECT * FROM posts; 

    </code>

</pre>

![select_all](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626580049/Academia-Java.-CDMX/Fundamentos-Base-Datos/select_all_aeupoq.png)

<pre>

    <code>

      -- SELECT especific
SELECT titulo, fecha_publicacion, estatus FROM posts; 

    </code>

</pre>

![select_alias](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626579911/Academia-Java.-CDMX/Fundamentos-Base-Datos/alias_select_dzmgao.png)

<pre>

    <code>

     -- Alias
SELECT titulo AS encabezado, titulo, fecha_publicacion, estatus FROM posts; 

    </code>

</pre>

![select_all](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626580177/Academia-Java.-CDMX/Fundamentos-Base-Datos/alias2_tefi1a.png)

<pre>

    <code>

  -- Count
SELECT COUNT(*) AS numero_posts FROM posts; 

    </code>

</pre>

![select_count](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626579907/Academia-Java.-CDMX/Fundamentos-Base-Datos/count_txicmr.png)

## FROM

` `FROM`  ` indica de dónde se deben traer los datos y puede ayudar a hacer sentencias y filtros complejos cuando se quieren unir tablas. La sentencia compañera que nos ayuda con este proceso es `  `JOIN` `.

**Los diagramas de Venn** son círculos que se tocan en algún punto para ver dónde está la intersección de conjuntos. Ayudan mucho para poder formular la sentencia ` `JOIN` ` de la manera adecuada dependiendo del query que se quiere hacer.

### LEFT JOIN

<pre>

    <code>

        SELECT	* FROM	usuarios  LEFT JOIN posts on usuarios.id = posts.usuario_id; 

    </code>

</pre>

![left_join](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626580947/Academia-Java.-CDMX/Fundamentos-Base-Datos/left_join_tyb9tj.png)

### RIGHT JOIN

<pre>

    <code>

        SELECT	* FROM	usuarios  LEFT JOIN posts on usuarios.id = posts.usuario_id; 

    </code>

</pre>

![right_join](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626581076/Academia-Java.-CDMX/Fundamentos-Base-Datos/right_join_doyrxp.png)

### INNER JOIN

<pre>

    <code>

        SELECT	* FROM	usuarios INNER JOIN posts on usuarios.id = posts.usuario_id; 

    </code>

</pre>

![right_join](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626581211/Academia-Java.-CDMX/Fundamentos-Base-Datos/inner_join_ejx8ta.png)

### UNION

<pre>

    <code>

        SELECT	* FROM	usuarios LEFT JOIN posts   ON usuarios.id = posts.usuario_id
UNION 
        SELECT	* FROM	usuarios RIGHT JOIN posts ON usuarios.id = posts.usuario_id; 

    </code>

</pre>

![right_join](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626581368/Academia-Java.-CDMX/Fundamentos-Base-Datos/union_phsvmd.png)

## WHERE

` `WHERE` ` es la sentencia que nos ayuda a filtrar tuplas o registros dependiendo de las características que elegimos.

* La propiedad ``LIKE`` nos ayuda a traer registros de los cuales conocemos sólo una parte de la información.

* La propiedad ``BETWEEN`` nos sirve para arrojar registros que estén en el medio de dos. Por ejemplo los registros con id entre 20 y 30.

### Cuando es menor a 50
<pre>

    <code>

    SELECT*FROM posts WHERE id < 50; 

    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626582281/Academia-Java.-CDMX/Fundamentos-Base-Datos/where_1_hwsxe9.png)

### Cuando es existe la palabra ``escandalo``
<pre>

    <code>
    SELECT*FROM	posts WHERE titulo LIKE '%escandalo%'; 
    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626582279/Academia-Java.-CDMX/Fundamentos-Base-Datos/where_2_chs94e.png)

### Cuando el year sea el medio de 2023 y 2324
<pre>

    <code>
    SELECT*FROM	posts WHERE	YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';
    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626582280/Academia-Java.-CDMX/Fundamentos-Base-Datos/where_3_ducai0.png)

## Group By
GROUP BY tiene que ver con agrupación. Indica a la base de datos qué criterios debe tener en cuenta para agrupar.
<pre>

    <code>
    /*Group BY*/
SELECT estatus, count(*) post_quantity FROM posts GROUP BY estatus;
    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626583478/Academia-Java.-CDMX/Fundamentos-Base-Datos/group_by_lhmff8.png)

## ORDER BY
La sentencia ``ORDER BY`` tiene que ver con el ordenamiento de los datos dependiendo de los criterios que quieras usar.

- ``ASC`` sirve para ordenar de forma ascendente.

- ``DES``C sirve para ordenar de forma descendente.

- ``LIM``IT se usa para limitar la cantidad de resultados que arroja el query.

``HAVING`` tiene una similitud muy grande con ``WHERE``, sin embargo el uso de ellos depende del orden. Cuando se quiere seleccionar tuplas agrupadas únicamente se puede hacer con HAVING.


<pre>

    <code>
    SELECT * FROM posts ORDER BY fecha_publicacion;
    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626583895/Academia-Java.-CDMX/Fundamentos-Base-Datos/order_xxb8y3.png)

<pre>

    <code>
    SELECT * FROM posts ORDER BY usuario_id ASC LIMIT 5;
    </code>

</pre>

![img](https://res.cloudinary.com/dvhl6xkqf/image/upload/v1626584134/Academia-Java.-CDMX/Fundamentos-Base-Datos/order_2_zpepwt.png)

## ¿Cómo convertir una pregunta en un query SQL?

**De pregunta a Query**

- ``SELECT:`` Lo que quieres mostrar
- ``FROM:`` De dónde voy a tomar los datos
- ``WHERE:`` Los filtros de los datos que quieres mostrar
- ``GROUP BY:`` Los rubros por los que me interesa agrupar la información
- ``ORDER BY:`` El orden en que quiero presentar mi información
- ``HAVING:`` Los filtros que quiero que mis datos agrupados tengan

## Consultando Blog
Puedes usar una abreviación para evitar escribir lo mismo cada vez.
Ejemplo:
<pre>
    <code>
    FROM categorias AS c
    </code>
</pre>

<pre>
    <code>
-- Lo que quieres mostrar = SELECT
-- De donde voy a tomar los datos = FROM
-- Los filtros de los datos que quieres mostrar = WHERE
-- Los rubros por los que me interesa agrupar mi información = GROUP BY
-- El orden en que quiero presentar mi información ORDER BY
-- Los filtros que quiero que mis datos agrupados tengan HAVING
    </code>
</pre>

<pre>
    <code>
    -- ¿Cuántos tags tienen cada post?
SELECT  posts.titulo, COUNT(*) AS num_etiquetas
FROM    posts
    INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id;
    </code>
</pre>

<pre>
    <code>
    -- ¿Cuál es el tag que mas se repite?
SELECT  etiquetas.nombre_etiqueta, COUNT(*) AS ocurrencias
FROM etiquetas
    INNER JOIN posts_etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY etiquetas.id
ORDER BY ocurrencias DESC;
    </code>
</pre>

<pre>
    <code>
    -- Los tags que tiene un post separados por comas
SELECT  posts.titulo, GROUP_CONCAT(nombre_etiqueta)
FROM    posts
    INNER JOIN posts_etiquetas ON posts.id = posts_etiquetas.post_id
    INNER JOIN etiquetas ON etiquetas.id = posts_etiquetas.etiqueta_id
GROUP BY posts.id;
    </code>
</pre>

<pre>
    <code>
    -- ¿Que etiqueta no tiene ningun post asociado?
SELECT	*
FROM	etiquetas 
	LEFT JOIN posts_etiquetas on etiquetas.id = posts_etiquetas.etiqueta_id
WHERE	posts_etiquetas.etiqueta_id IS NULL;
    </code>
</pre>

<pre>
    <code>
    -- Las categorías ordenadas por numero de posts
SELECT c.nombre_categoria, COUNT(*) AS cant_posts
FROM    categorias AS c
    INNER JOIN posts AS p on c.id = p.categoria_id
GROUP BY c.id
ORDER BY cant_posts DESC;
    </code>
</pre>

<pre>
    <code>
    -- ¿Que usuario ha contribuido con mas post?
SELECT u.nickname, COUNT(*) AS cant_posts
FROM    usuarios AS u
    INNER JOIN posts AS p on u.id = p.usuario_id
GROUP BY u.id
ORDER BY cant_posts DESC
LIMIT 1;
    </code>
</pre>

<pre>
    <code> 
    -- ¿De que categorías escribe cada usuario?
SELECT u.nickname, COUNT(*) AS cant_posts,  GROUP_CONCAT(nombre_categoria)
FROM    usuarios AS u
    INNER JOIN posts AS p ON u.id = p.usuario_id
    INNER JOIN categorias AS c ON c.id = p.categoria_id
GROUP BY u.id;
    </code>
</pre>

<pre>
    <code>
    -- ¿Que usuario no tiene ningun post asociado?
SELECT	*
FROM	usuarios 
	LEFT JOIN posts on usuarios.id = posts.usuario_id
WHERE	posts.usuario_id IS NULL
    </code>
</pre>

## ¿Qué son y cuáles son los tipos de bases de datos no relacionales?

Respecto a las bases de datos no relacionales, no existe un solo tipo aunque se engloben en una sola categoría.

Tipos de bases de datos no relacionales:

- ``Clave - valor:`` Son ideales para almacenar y extraer datos con una clave única. Manejan los diccionarios de manera excepcional. Ejemplos:`` **DynamoDB**, **Cassandra**.

- ``Basadas en documentos:`` Son una implementación de clave valor que varía en la forma semiestructurada en que se trata la información. Ideal para almacenar datos JSON y XML. Ejemplos: **MongoDB**, **Firestore**.

- ``Basadas en grafos:`` Basadas en teoría de grafos, sirven para entidades que se encuentran interconectadas por múltiples relaciones. Ideales para almacenar relaciones complejas. Ejemplos: **neo4j**, **TITAN**.

- ``En memoria: ``Pueden ser de estructura variada, pero su ventaja radica en la velocidad, ya que al vivir en memoria la extracción de datos es casi inmediata. Ejemplos: **Memcached**, **Redis**.

- ``Optimizadas para búsquedas: ``Pueden ser de diversas estructuras, su ventaja radica en que se pueden hacer queries y búsquedas complejas de manera sencilla. Ejemplos: **BigQuery**, **Elasticsearch.**

## Top level collection con Firebase
El modelo de bases de datos no relacionales es un poco más cercano al mundo real en su comportamiento.

Las top level collections son las colecciones que se tienen de inmediato o entrada en el proyecto.
``Firebase`` es un servicio que tiene múltiples opciones y está pensado principalmente para ``aplicaciones móviles`` y ``web``.

Tipos de datos en Firestore:

- ``String:`` Cualquier tipo de valor alfanumérico

- ``Number:`` Soporta enteros y flotantes.

- ``Boolenan:`` Los clásicos valores True y False

- ``Map:`` Permite agregar un documento dentro de otro.

- ``Array:`` Permite agregar un conjunto de datos (soporte multi type) sin nombre e identificador.

- ``Null:`` Indica que no se ha definido un valor.

- ``Timestamp:`` Permite almacenar fechas (guarda el año, mes, día y hora).

- ``Geopoint:`` Guarda una localización geográfica (coordenadas latitud-longitud).

- ``Reference:`` Permite referencia un documento (relaciona dos documentos, no importa su colección).
