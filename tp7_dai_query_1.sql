SELECT * FROM usuarios;
SELECT nombre, apellido FROM usuarios;
SELECT nombre, apellido FROM usuarios ORDER BY apellido ASC;
SELECT apellido, nombre FROM usuarios ORDER BY apellido ASC, nombre ASC;
SELECT CONCATnombre || ' ' || apellido AS nombre_completo FROM usuarios;
SELECT DISTINCT nombre FROM usuarios;
SELECT * FROM usuarios ORDER BY apellido ASC LIMIT 10;
SELECT nombre, apellido, LENGTH(nombre) AS largo_nombre FROM usuarios ORDER BY largo_nombre DESC;
