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



