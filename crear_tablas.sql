-- Selecciona antes el esquema que ya tienes creado en Workbench.
-- Si se llama de otra forma, cambia esta línea.
USE franquicia_restaurantes;

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
