/*Select POSTS*/
-- ALL
SELECT * FROM posts;

-- SELECT especific
SELECT titulo, fecha_publicacion, estatus FROM posts;

-- Alias
SELECT titulo AS encabezado, titulo, fecha_publicacion, estatus FROM posts;

-- Count
SELECT COUNT(*) AS numero_posts FROM posts;

/*FROM*/
-- JOIN    
SELECT	* FROM	usuarios  LEFT JOIN posts on usuarios.id = posts.usuario_id;
    
SELECT	* FROM	usuarios LEFT JOIN posts on usuarios.id = posts.usuario_id
WHERE	posts.usuario_id IS NULL;

SELECT	* FROM	usuarios RIGHT JOIN posts on usuarios.id = posts.usuario_id;

SELECT	* FROM	usuarios INNER JOIN posts on usuarios.id = posts.usuario_id;
    
SELECT	* FROM	usuarios JOIN posts on usuarios.id = posts.usuario_id;
    
SELECT	* FROM	usuarios LEFT JOIN posts   ON usuarios.id = posts.usuario_id
UNION 
SELECT	* FROM	usuarios RIGHT JOIN posts ON usuarios.id = posts.usuario_id;

/*WHERE*/
SELECT	*
FROM		posts
WHERE	id	< 50;

SELECT	*
FROM		posts
WHERE	estatus = 'Inactivo';

SELECT	*
FROM		posts
WHERE	titulo LIKE '%escandalo%';

SELECT	*
FROM		posts
WHERE	fecha_publicacion > '2025-01-01';

SELECT	*
FROM		posts
WHERE	fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31';

SELECT	*
FROM		posts
WHERE	YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';

SELECT	*
FROM		posts
WHERE	MONTH(fecha_publicacion) = '04';

SELECT	*
FROM		posts
WHERE	usuario_id IS NOT NULL;

SELECT	*
FROM		posts
WHERE	usuario_id IS NULL;

/*Group BY*/
SELECT estatus, count(*) post_quantity FROM posts GROUP BY estatus;
    

