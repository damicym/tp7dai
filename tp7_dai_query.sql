--parte1

--SELECT * FROM usuarios;
--SELECT nombre, apellido FROM usuarios;
--SELECT nombre, apellido FROM usuarios ORDER BY apellido ASC;
--SELECT apellido, nombre FROM usuarios ORDER BY apellido ASC, nombre ASC;
--SELECT CONCAT(nombre || ' ' || apellido) AS nombre_completo FROM usuarios;
--SELECT DISTINCT nombre FROM usuarios;
--SELECT * FROM usuarios ORDER BY apellido ASC LIMIT 10;
--SELECT nombre, apellido, LENGTH(nombre) AS largo_nombre FROM usuarios ORDER BY largo_nombre DESC;

--parte2

--SELECT * FROM beneficios WHERE activo = B'1';
--SELECT * FROM beneficios WHERE activo = B'1' AND descuento >= 20;
--SELECT * FROM beneficios WHERE activo = B'1' AND (descuento < 10 OR descuento > 50);
--SELECT * FROM comercios WHERE nombre LIKE 'M%';
--SELECT * FROM comercios WHERE nombre LIKE '%SA';
SELECT * FROM comercios WHERE nombre LIKE '%SUPER%';



