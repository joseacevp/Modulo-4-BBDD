-- Actividad 7. Un único script: creación, datos de prueba y sentencias.
-- Si el esquema ya existe, este script lo vuelve a crear desde cero.

CREATE DATABASE IF NOT EXISTS franquicia_restaurantes;
USE franquicia_restaurantes;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS favoritos;
DROP TABLE IF EXISTS mesas;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS restaurantes;

CREATE TABLE restaurantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  direccion VARCHAR(200) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  nombre_responsable VARCHAR(100) NOT NULL,
  abierto TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE mesas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  restaurante_id INT NOT NULL,
  numero_mesa INT NOT NULL,
  numero_comensales INT NOT NULL,
  UNIQUE (restaurante_id, numero_mesa),
  CONSTRAINT fk_mesas_restaurante
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id)
);

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  email VARCHAR(150) NOT NULL
);

CREATE TABLE favoritos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  restaurante_id INT NOT NULL,
  UNIQUE (cliente_id, restaurante_id),
  CONSTRAINT fk_favoritos_cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  CONSTRAINT fk_favoritos_restaurante
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id)
);

CREATE TABLE reservas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  mesa_id INT NOT NULL,
  cliente_id INT NOT NULL,
  fecha_hora DATETIME NOT NULL,
  UNIQUE (mesa_id, fecha_hora),
  CONSTRAINT fk_reservas_mesa
    FOREIGN KEY (mesa_id) REFERENCES mesas(id),
  CONSTRAINT fk_reservas_cliente
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

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
-- El 2026-10-10, La Tasca del Puerto tiene 4 reservas en mesas de 4 o más comensales.
-- A las 21:00 de ese día quedan libres la mesa 1 y la mesa 3.
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

-- Reservas de un restaurante en un día, con cliente y mesa.
-- Restaurante 1 (La Tasca del Puerto), día 2026-10-10.
SELECT res.fecha_hora, c.nombre, c.telefono, c.email,
       m.numero_mesa, m.numero_comensales
FROM reservas res
JOIN mesas m ON res.mesa_id = m.id
JOIN clientes c ON res.cliente_id = c.id
WHERE m.restaurante_id = 1
  AND DATE(res.fecha_hora) = '2026-10-10';

-- Restaurantes favoritos abiertos de un cliente. Cliente 1 (Laura Pérez).
SELECT r.nombre
FROM favoritos f
JOIN restaurantes r ON f.restaurante_id = r.id
WHERE f.cliente_id = 1
  AND r.abierto = 1;

-- Cambiar fecha y hora de una reserva.
-- La reserva 7 no forma parte de las consultas del 2026-10-10.
UPDATE reservas
SET fecha_hora = '2026-10-20 20:00:00'
WHERE id = 7;

-- Borrar favoritos cerrados de un cliente. Cliente 1.
DELETE f
FROM favoritos f
JOIN restaurantes r ON f.restaurante_id = r.id
WHERE f.cliente_id = 1
  AND r.abierto = 0;

-- Restaurantes con más de 3 reservas de 4 o más comensales en un día.
SELECT r.nombre
FROM reservas res
JOIN mesas m ON res.mesa_id = m.id
JOIN restaurantes r ON m.restaurante_id = r.id
WHERE DATE(res.fecha_hora) = '2026-10-10'
  AND m.numero_comensales >= 4
GROUP BY r.id, r.nombre
HAVING COUNT(*) > 3;

-- Aforo máximo de un restaurante. Restaurante 1.
SELECT SUM(numero_comensales) AS aforo_maximo
FROM mesas
WHERE restaurante_id = 1;

-- Mesas para 2 comensales libres en un restaurante, fecha y hora.
-- Restaurante 1, 2026-10-10 a las 21:00.
SELECT m.numero_mesa, m.numero_comensales
FROM mesas m
WHERE m.restaurante_id = 1
  AND m.numero_comensales >= 2
  AND m.id NOT IN (
    SELECT mesa_id
    FROM reservas
    WHERE fecha_hora = '2026-10-10 21:00:00'
  );

-- Cliente con más reservas en un restaurante y un rango de fechas.
-- Restaurante 1, octubre de 2026.
SELECT c.nombre
FROM reservas res
JOIN mesas m ON res.mesa_id = m.id
JOIN clientes c ON res.cliente_id = c.id
WHERE m.restaurante_id = 1
  AND res.fecha_hora BETWEEN '2026-10-01 00:00:00' AND '2026-10-31 23:59:59'
GROUP BY c.id, c.nombre
ORDER BY COUNT(*) DESC
LIMIT 1;
