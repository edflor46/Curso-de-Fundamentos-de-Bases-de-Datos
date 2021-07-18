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
    

