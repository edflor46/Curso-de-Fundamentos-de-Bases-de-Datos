/*Select POSTS*/
-- ALL
SELECT * FROM posts;

-- SELECT especific
SELECT titulo, fecha_publicacion, estatus FROM posts;

-- Alias
SELECT titulo AS encabezado, titulo, fecha_publicacion, estatus FROM posts;

-- Count
SELECT COUNT(*) AS numero_posts FROM posts;
