-- Datos de prueba de la actividad.
-- Ejecutar con las tablas vacías, después de crear_tablas.sql.
-- Los id quedan en orden: restaurantes 1-10, mesas 1-22, clientes 1-10.

USE franquicia_restaurantes;

-- 10 restaurantes. Los 3, 6 y 9 están cerrados.
INSERT INTO restaurantes (nombre, direccion, telefono, nombre_responsable, abierto) VALUES
('La Tasca del Puerto', 'Calle Mayor 12, Madrid', '910111001', 'Ana Ruiz', 1),
('Mesón El Olivo', 'Rambla Catalunya 45, Barcelona', '930222002', 'Luis Gómez', 1),
('Casa Marín', 'Avenida del Puerto 8, Valencia', '960333003', 'Marta Soler', 0),
('El Rincón Vasco', 'Gran Vía 21, Bilbao', '944444004', 'Iker Aguirre', 1),
('Taberna Andaluza', 'Calle Sierpes 3, Sevilla', '954555005', 'Carmen Díaz', 1),
('Asador Norte', 'Paseo Independencia 17, Zaragoza', '976666006', 'Pablo Herrera', 0),
('Marisquería Luz', 'Calle Larios 9, Málaga', '952777007', 'Elena Costa', 1),
('Bodega Central', 'Plaza Mayor 4, Valladolid', '983888008', 'Javier Martín', 1),
('Fonda del Carmen', 'Calle Reyes Católicos 15, Granada', '958999009', 'Lucía Romero', 0),
('Grill Mediterráneo', 'Explanada de España 2, Alicante', '965000010', 'David Serra', 1);

-- 22 mesas: al menos 2 por restaurante.
-- La Tasca del Puerto (id 1) tiene mesas de 2, 4, 6 y 4 comensales.
INSERT INTO mesas (restaurante_id, numero_mesa, numero_comensales) VALUES
(1, 1, 2),
(1, 2, 4),
(1, 3, 6),
(1, 4, 4),
(2, 1, 2),
(2, 2, 4),
(3, 1, 2),
(3, 2, 6),
(4, 1, 4),
(4, 2, 8),
(5, 1, 2),
(5, 2, 4),
(6, 1, 2),
(6, 2, 6),
(7, 1, 4),
(7, 2, 4),
(8, 1, 2),
(8, 2, 8),
(9, 1, 2),
(9, 2, 4),
(10, 1, 6),
(10, 2, 2);

INSERT INTO clientes (nombre, telefono, email) VALUES
('Laura Pérez', '600111001', 'laura.perez@email.com'),
('Carlos Méndez', '600222002', 'carlos.mendez@email.com'),
('Sofía Navarro', '600333003', 'sofia.navarro@email.com'),
('Miguel Torres', '600444004', 'miguel.torres@email.com'),
('Elena Vargas', '600555005', 'elena.vargas@email.com'),
('Hugo Sánchez', '600666006', 'hugo.sanchez@email.com'),
('Nuria Castro', '600777007', 'nuria.castro@email.com'),
('Andrés Gil', '600888008', 'andres.gil@email.com'),
('Paula Ortega', '600999009', 'paula.ortega@email.com'),
('Diego Ramos', '600000010', 'diego.ramos@email.com');

-- 24 favoritos. Incluyen restaurantes cerrados (3, 6 y 9).
INSERT INTO favoritos (cliente_id, restaurante_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(2, 1),
(2, 5),
(2, 7),
(2, 9),
(3, 2),
(3, 8),
(3, 10),
(4, 1),
(4, 3),
(4, 4),
(5, 5),
(5, 7),
(6, 8),
(6, 10),
(7, 2),
(7, 6),
(8, 9),
(9, 4),
(10, 7);

-- 24 reservas.
-- El 2026-10-10, La Tasca del Puerto (restaurante 1) tiene 4 reservas
-- en mesas de 4 o más comensales (mesas 2, 3 y 4).
-- A las 21:00 de ese día quedan libres la mesa 1 (2 comensales) y la mesa 3.
-- Laura Pérez (cliente 1) es quien más reserva en el restaurante 1 en octubre.
INSERT INTO reservas (mesa_id, cliente_id, fecha_hora) VALUES
(2, 1, '2026-10-10 13:00:00'),
(2, 2, '2026-10-10 21:00:00'),
(3, 3, '2026-10-10 14:00:00'),
(4, 1, '2026-10-10 21:00:00'),
(3, 1, '2026-10-12 21:00:00'),
(4, 1, '2026-10-18 14:00:00'),
(5, 4, '2026-10-11 14:00:00'),
(6, 5, '2026-10-11 21:00:00'),
(7, 6, '2026-10-12 13:30:00'),
(8, 7, '2026-10-12 21:00:00'),
(9, 8, '2026-10-13 14:00:00'),
(10, 9, '2026-10-13 21:00:00'),
(11, 10, '2026-10-14 13:00:00'),
(12, 4, '2026-10-14 21:00:00'),
(13, 5, '2026-10-15 14:00:00'),
(14, 6, '2026-10-15 21:00:00'),
(15, 7, '2026-10-16 13:00:00'),
(16, 8, '2026-10-16 21:00:00'),
(17, 9, '2026-10-17 14:00:00'),
(18, 10, '2026-10-17 21:00:00'),
(19, 2, '2026-10-18 13:00:00'),
(20, 3, '2026-10-18 21:00:00'),
(21, 4, '2026-10-19 14:00:00'),
(22, 5, '2026-10-19 21:00:00');
