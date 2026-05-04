-- inserts de chatgpt

-- 1. PROVINCIAS
INSERT INTO public.provincias (nombre, orden, activo) VALUES
('Buenos Aires', 1, B'1'),
('Córdoba', 2, B'1'),
('Santa Fe', 3, B'1');


-- 2. USUARIOS
INSERT INTO public.usuarios (nombre, apellido, fecha_nacimiento, id_provincia) VALUES
('Juan', 'Pérez', '1990-05-10', 1),
('María', 'Gómez', '1985-08-20', 2),
('Lucas', 'Fernández', '2000-01-15', 3);


-- 3. COMERCIOS
INSERT INTO public.comercios (nombre, descripcion, telefono_principal, "Comercio_DatosContacto", url, email, activo) VALUES
('SuperMarket', 'Supermercado de barrio', '123456789', 'WhatsApp', 'http://super.com', 'contacto@super.com', B'1'),
('TechStore', 'Tienda de tecnología', '987654321', 'Instagram', 'http://tech.com', 'info@tech.com', B'1');


-- 4. BENEFICIOS
INSERT INTO public.beneficios (nombre, id_comercio, descripcion_corta, descuento, activo) VALUES
('10% OFF', 1, 'Descuento en alimentos', 10, B'1'),
('20% OFF', 2, 'Descuento en electrónica', 20, B'1');


-- 5. BENEFICIOS_USUARIOS
INSERT INTO public.beneficios_usuarios (id_beneficio, id_usuario, fecha) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(1, 3, NOW());
