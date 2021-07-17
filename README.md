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