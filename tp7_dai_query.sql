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