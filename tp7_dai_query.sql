--parte1
SELECT * FROM usuarios;
SELECT nombre, apellido FROM usuarios;
SELECT nombre, apellido FROM usuarios ORDER BY apellido ASC;
SELECT apellido, nombre FROM usuarios ORDER BY apellido ASC, nombre ASC;
SELECT CONCAT(nombre || ' ' || apellido) AS nombre_completo FROM usuarios ORDER BY apellido;
SELECT DISTINCT nombre FROM usuarios ORDER BY nombre ASC;
SELECT * FROM usuarios ORDER BY apellido ASC LIMIT 10;
SELECT nombre, apellido, LENGTH(nombre) AS largo_nombre FROM usuarios ORDER BY largo_nombre DESC;

--parte2
SELECT * FROM beneficios WHERE activo = B'1';
SELECT * FROM beneficios WHERE activo = B'1' AND descuento >= 20;
SELECT * FROM beneficios WHERE descuento < 10 OR descuento > 50;
SELECT * FROM comercios WHERE nombre LIKE 'M%';
SELECT * FROM comercios WHERE nombre LIKE '%SA';
SELECT * FROM comercios WHERE nombre ILIKE '%super%';
SELECT * FROM usuarios WHERE nombre LIKE '_a%';
SELECT * FROM usuarios WHERE apellido IN ('Gonzalez', 'Ruiz', 'Gomez');
SELECT * FROM usuarios WHERE apellido NOT IN ('Gonzalez', 'Ruiz', 'Gomez');
SELECT * FROM beneficios WHERE id_comercio IN (SELECT id FROM comercios WHERE activo = B'1');
SELECT DISTINCT nombre, descuento FROM beneficios WHERE id_comercio IN (SELECT id FROM comercios WHERE activo = B'1');
SELECT * FROM beneficios WHERE id_comercio NOT IN (SELECT id FROM comercios WHERE activo = B'1');
SELECT * FROM beneficios ORDER BY descuento DESC LIMIT 5;

--parte3
SELECT * FROM usuarios WHERE EXTRACT(YEAR FROM fecha_nacimiento) = 1981;
SELECT * FROM usuarios WHERE EXTRACT(MONTH FROM fecha_nacimiento) = 5;
SELECT nombre, apellido, DATE_PART('year', AGE(fecha_nacimiento)) AS edad FROM usuarios ORDER BY edad DESC;
SELECT * FROM beneficios_usuarios WHERE fecha >= NOW() - INTERVAL '30 days';
SELECT * FROM beneficios_usuarios WHERE fecha >= '2025-01-01' AND fecha < '2025-04-01';

--parte4
SELECT * FROM usuarios WHERE fecha_nacimiento IS NULL;
SELECT * FROM comercios WHERE email IS NOT NULL AND activo = B'1';

--parte5
SELECT COUNT(*) FROM usuarios;
SELECT COUNT(fecha_nacimiento) AS con_fecha, COUNT(*) - COUNT(fecha_nacimiento) AS sin_fecha FROM usuarios;
SELECT MAX(descuento), MIN(descuento), AVG(descuento) FROM beneficios WHERE activo = B'1';

--parte6
SELECT b.nombre, c.nombre FROM beneficios b INNER JOIN comercios c ON b.id_comercio = c.id;
SELECT u.nombre, u.apellido, p.nombre FROM usuarios u INNER JOIN provincias p ON u.id_provincia = p.id;
SELECT u.nombre, u.apellido, p.nombre FROM usuarios u LEFT JOIN provincias p ON u.id_provincia = p.id;
SELECT u.nombre, u.apellido, p.nombre FROM provincias p RIGHT JOIN usuarios u ON u.id_provincia = p.id;
SELECT u.nombre, u.apellido FROM usuarios u LEFT JOIN beneficios_usuarios bu ON bu.id_usuario = u.id WHERE bu.id IS NULL;
SELECT u.nombre, u.apellido, b.nombre, c.nombre, bu.fecha FROM beneficios_usuarios bu INNER JOIN usuarios u ON bu.id_usuario = u.id INNER JOIN beneficios b ON bu.id_beneficio = b.id INNER JOIN comercios c ON b.id_comercio = c.id;

--parte7
SELECT c.nombre, COUNT(b.id) AS cantidad FROM comercios c INNER JOIN beneficios b ON b.id_comercio = c.id GROUP BY c.nombre ORDER BY cantidad DESC;
SELECT c.nombre, COUNT(b.id) AS cantidad FROM comercios c INNER JOIN beneficios b ON b.id_comercio = c.id GROUP BY c.nombre HAVING COUNT(b.id) > 3 ORDER BY cantidad DESC;
SELECT c.nombre, SUM(b.descuento) AS suma_descuentos FROM comercios c INNER JOIN beneficios b ON b.id_comercio = c.id WHERE b.activo = B'1' GROUP BY c.nombre ORDER BY suma_descuentos DESC;
SELECT c.nombre, AVG(b.descuento) AS promedio, COUNT(b.id) AS cantidad FROM comercios c INNER JOIN beneficios b ON b.id_comercio = c.id GROUP BY c.nombre HAVING AVG(b.descuento) > 15;
SELECT p.nombre, COUNT(DISTINCT bu.id_beneficio) AS beneficios_distintos FROM provincias p INNER JOIN usuarios u ON u.id_provincia = p.id INNER JOIN beneficios_usuarios bu ON bu.id_usuario = u.id GROUP BY p.nombre ORDER BY beneficios_distintos DESC;
SELECT p.nombre, COUNT(u.id) AS cantidad FROM provincias p INNER JOIN usuarios u ON u.id_provincia = p.id GROUP BY p.nombre ORDER BY cantidad DESC;
SELECT p.nombre, COUNT(u.id) AS cantidad FROM provincias p LEFT JOIN usuarios u ON u.id_provincia = p.id GROUP BY p.nombre ORDER BY cantidad DESC;
SELECT c.nombre, COUNT(bu.id) AS canjes FROM comercios c INNER JOIN beneficios b ON b.id_comercio = c.id INNER JOIN beneficios_usuarios bu ON bu.id_beneficio = b.id GROUP BY c.nombre ORDER BY canjes DESC LIMIT 5;
SELECT u.apellido, u.nombre, COUNT(bu.id) AS canjes FROM usuarios u LEFT JOIN beneficios_usuarios bu ON bu.id_usuario = u.id GROUP BY u.apellido, u.nombre ORDER BY canjes DESC;

--extras
SELECT comercios.nombre, AVG(beneficios.descuento) AS promedio FROM comercios INNER JOIN beneficios ON beneficios.id_comercio = comercios.id GROUP BY comercios.nombre ORDER BY promedio DESC LIMIT 1;

SELECT provincias.nombre, COUNT(DISTINCT usuarios.id) AS cantidad_usuarios, COUNT(beneficios_usuarios.id) AS cantidad_canjes FROM provincias
LEFT JOIN usuarios ON usuarios.id_provincia = provincias.id
LEFT JOIN beneficios_usuarios ON beneficios_usuarios.id_usuario = usuarios.id
GROUP BY provincias.nombre ORDER BY cantidad_usuarios DESC;
