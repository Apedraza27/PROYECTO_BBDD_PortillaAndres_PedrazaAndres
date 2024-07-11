-- ### Los Ambientales ### --

DROP DATABASE IF EXISTS LosAmbientales;
CREATE DATABASE LosAmbientales;
USE LosAmbientales;

-- ## tabla departamento ## --
drop table if exists departamento;
CREATE TABLE departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(45) NOT NULL,
    departamentos TEXT NOT NULL
);

INSERT INTO departamento (region, departamentos) VALUES ('Región Andina', 'Antioquia, Boyacá, Caldas, Cundinamarca, Huila, Norte de Santander, Quindío, Risaralda, Santander, Tolima');
INSERT INTO departamento (region, departamentos) VALUES ('Región Caribe', 'Atlántico, Bolívar, Cesar, Córdoba, La Guajira, Magdalena, Sucre');
INSERT INTO departamento (region, departamentos) VALUES ('Región Pacífica', 'Chocó, Valle del Cauca, Cauca, Nariño');
INSERT INTO departamento (region, departamentos) VALUES ('Región Orinoquía', 'Arauca, Casanare, Meta, Vichada');
INSERT INTO departamento (region, departamentos) VALUES ('Región Amazonía', 'Amazonas, Caquetá, Guaviare, Guainía, Putumayo, Vaupés');

-- ## tabla entidad ## --
drop table if exists entidad;
CREATE TABLE entidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

INSERT INTO entidad (nombre, departamento_id) VALUES ('Entidad Regional Caribe', 2);
INSERT INTO entidad (nombre, departamento_id) VALUES ('Entidad Regional Andina', 1);
INSERT INTO entidad (nombre, departamento_id) VALUES ('Entidad Regional Amazonía', 5);
INSERT INTO entidad (nombre, departamento_id) VALUES ('Entidad Regional Pacífica', 3);
INSERT INTO entidad (nombre, departamento_id) VALUES ('Entidad Regional Orinoquía', 4);


-- ## tabla parque natural ## --
drop table if exists parque_natural;
CREATE TABLE parque_natural (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    dia_declarado DATE,
    superficie_total DECIMAL(10, 2),
    entidad_id INT,
    departamento_id INT,
    FOREIGN KEY (entidad_id) REFERENCES entidad(id),
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

INSERT INTO parque_natural (nombre, dia_declarado, superficie_total, entidad_id, departamento_id) VALUES 
('Parque Nacional Natural Tayrona', '1964-04-24', 1500.00, 1, 2),  -- Magdalena, Región Caribe
('Parque Nacional Natural Cordillera de los Picachos', '1977-05-21', 4500.00, 2, 1),  -- Caquetá y Meta, Región Andina
('Parque Nacional Natural Cueva de los Guácharos', '1960-11-10', 900.00, 2, 1),  -- Huila, Región Andina
('Parque Nacional Natural Nevado del Huila', '1977-09-26', 1600.00, 2, 1),  -- Huila, Cauca y Tolima, Región Andina
('Parque Nacional Natural Chiribiquete', '1989-09-21', 28000.00, 3, 5),  -- Guaviare y Caquetá, Región Amazonía
('Parque Nacional Natural El Cocuy', '1977-09-02', 3060.00, 2, 1),  -- Boyacá, Arauca y Casanare, Región Andina
('Parque Nacional Natural Sierra Nevada de Santa Marta', '1964-10-29', 3830.00, 1, 2),  -- Magdalena, La Guajira y Cesar, Región Caribe
('Parque Nacional Natural Los Nevados', '1974-05-27', 58300.00, 2, 1),  -- Caldas, Quindío, Risaralda y Tolima, Región Andina
('Parque Nacional Natural Serranía de la Macarena', '1948-05-02', 6300.00, 4, 4),  -- Meta, Región Orinoquía
('Parque Nacional Natural Gorgona', '1984-07-23', 620.00, 5, 3);  -- Cauca, Región Pacífica


-- ## tabla alojamiento ## --
DROP TABLE IF EXISTS alojamiento;
CREATE TABLE alojamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidad INT,
    categoria VARCHAR(45),
    precio_x_noche DECIMAL(10, 2),
    parque_natural_id INT,
    FOREIGN KEY (parque_natural_id) REFERENCES parque_natural(id)
);

INSERT INTO alojamiento (capacidad, categoria, precio_x_noche, parque_natural_id) VALUES
(200, 'Lujo', 500000.00, 1),  -- Parque Nacional Natural Tayrona
(100, 'Estándar', 300000.00, 2),  -- Parque Nacional Natural Tayrona
(150, 'Estándar', 250000.00, 3),  -- Parque Nacional Natural El Cocuy
(80, 'Lujo', 400000.00, 4),  -- Parque Nacional Natural El Cocuy
(50, 'Básico', 150000.00, 5),  -- Parque Nacional Natural Cueva de los Guácharos
(60, 'Estándar', 200000.00, 6),  -- Parque Nacional Natural Nevado del Huila
(30, 'Lujo', 350000.00, 7),  -- Parque Nacional Natural Nevado del Huila
(40, 'Estándar', 180000.00, 8),  -- Parque Nacional Natural Chiribiquete
(70, 'Lujo', 300000.00, 9),  -- Parque Nacional Natural Serranía de la Macarena
(20, 'Básico', 120000.00, 10);  -- Parque Nacional Natural Serranía de la Macarena


-- ## tabla personal parque ## --
Drop table if exists personal_parque;
CREATE TABLE personal_parque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(45),
    celular VARCHAR(45),
    telefono VARCHAR(45),
    sueldo DECIMAL(10, 2),
    parque_natural_id INT,
    FOREIGN KEY (parque_natural_id) REFERENCES parque_natural(id)
);

INSERT INTO personal_parque (cedula, nombre, direccion, celular, telefono, sueldo, parque_natural_id) VALUES 
(10000001, 'Carlos Pérez', 'Calle 1 #1-1', '3204551234', '6012345678', 1800000.00, 1),
(10000002, 'María Rodríguez', 'Carrera 2 #2-2', '3204552345', '6012345679', 2200000.00, 2),
(10000003, 'Juan Gómez', 'Avenida 3 #3-3', '3204553456', '6012345680', 1950000.00, 3),
(10000004, 'Ana Martínez', 'Calle 4 #4-4', '3204554567', '6012345681', 2100000.00, 4),
(10000005, 'Pedro López', 'Carrera 5 #5-5', '3204555678', '6012345682', 2000000.00, 5),
(10000006, 'Luis García', 'Avenida 6 #6-6', '3204556789', '6012345683', 1900000.00, 6),
(10000007, 'Laura Sánchez', 'Calle 7 #7-7', '3204557890', '6012345684', 1850000.00, 7),
(10000008, 'Jorge Ramírez', 'Carrera 8 #8-8', '3204558901', '6012345685', 2100000.00, 8),
(10000009, 'Diana Torres', 'Avenida 9 #9-9', '3204559012', '6012345686', 2000000.00, 9),
(10000010, 'Fernando Díaz', 'Calle 10 #10-10', '3204550123', '6012345687', 1950000.00, 10),
(10000011, 'Sara Morales', 'Carrera 11 #11-11', '3204551234', '6012345688', 1800000.00, 1),
(10000012, 'Hugo Ruiz', 'Avenida 12 #12-12', '3204552345', '6012345689', 2200000.00, 2),
(10000013, 'Mónica Herrera', 'Calle 13 #13-13', '3204553456', '6012345690', 1950000.00, 3),
(10000014, 'Andrés Castillo', 'Carrera 14 #14-14', '3204554567', '6012345691', 2100000.00, 4),
(10000015, 'Gloria Mendoza', 'Avenida 15 #15-15', '3204555678', '6012345692', 2000000.00, 5),
(10000016, 'Camilo Ortiz', 'Calle 16 #16-16', '3204556789', '6012345693', 1900000.00, 6),
(10000017, 'Paula Jiménez', 'Carrera 17 #17-17', '3204557890', '6012345694', 1850000.00, 7),
(10000018, 'Ricardo Pardo', 'Avenida 18 #18-18', '3204558901', '6012345695', 2100000.00, 8),
(10000019, 'Patricia Vargas', 'Calle 19 #19-19', '3204559012', '6012345696', 2000000.00, 9),
(10000020, 'Martín Velásquez', 'Carrera 20 #20-20', '3204550123', '6012345697', 1950000.00, 10),
(10000021, 'Lucía Castro', 'Avenida 21 #21-21', '3204551234', '6012345698', 1800000.00, 1),
(10000022, 'Germán Peña', 'Calle 22 #22-22', '3204552345', '6012345699', 2200000.00, 2),
(10000023, 'Natalia Romero', 'Carrera 23 #23-23', '3204553456', '6012345700', 1950000.00, 3),
(10000024, 'Santiago Ríos', 'Avenida 24 #24-24', '3204554567', '6012345701', 2100000.00, 4),
(10000025, 'Valentina Vargas', 'Calle 25 #25-25', '3204555678', '6012345702', 2000000.00, 5),
(10000026, 'Esteban Guzmán', 'Carrera 26 #26-26', '3204556789', '6012345703', 1900000.00, 6),
(10000027, 'Mariana Ramírez', 'Avenida 27 #27-27', '3204557890', '6012345704', 1850000.00, 7),
(10000028, 'Javier Gómez', 'Calle 28 #28-28', '3204558901', '6012345705', 2100000.00, 8),
(10000029, 'Carolina Silva', 'Carrera 29 #29-29', '3204559012', '6012345706', 2000000.00, 9),
(10000030, 'Alejandro Suárez', 'Avenida 30 #30-30', '3204550123', '6012345707', 1950000.00, 10),
(10000031, 'Adriana Fernández', 'Calle 31 #31-31', '3204551234', '6012345708', 1800000.00, 1),
(10000032, 'Diego Martínez', 'Carrera 32 #32-32', '3204552345', '6012345709', 2200000.00, 2),
(10000033, 'Lorena Cortés', 'Avenida 33 #33-33', '3204553456', '6012345710', 1950000.00, 3),
(10000034, 'Felipe Rodríguez', 'Calle 34 #34-34', '3204554567', '6012345711', 2100000.00, 4),
(10000035, 'Marcela Delgado', 'Carrera 35 #35-35', '3204555678', '6012345712', 2000000.00, 5),
(10000036, 'Oscar Ramírez', 'Avenida 36 #36-36', '3204556789', '6012345713', 1900000.00, 6),
(10000037, 'Liliana Torres', 'Calle 37 #37-37', '3204557890', '6012345714', 1850000.00, 7),
(10000038, 'Gabriel Moreno', 'Carrera 38 #38-38', '3204558901', '6012345715', 2100000.00, 8),
(10000039, 'Silvia Ruiz', 'Avenida 39 #39-39', '3204559012', '6012345716', 2000000.00, 9),
(10000040, 'Tomás Vargas', 'Calle 40 #40-40', '3204550123', '6012345717', 1950000.00, 10),
(10000041, 'Marta Castro', 'Carrera 41 #41-41', '3204551234', '6012345718', 1800000.00, 1),
(10000042, 'Alberto Guerrero', 'Avenida 42 #42-42', '3204552345', '6012345719', 2200000.00, 2),
(10000043, 'Claudia Herrera', 'Calle 43 #43-43', '3204553456', '6012345720', 1950000.00, 3),
(10000044, 'David Pineda', 'Carrera 44 #44-44', '3204554567', '6012345721', 2100000.00, 4),
(10000045, 'Fabiola Gutiérrez', 'Avenida 45 #45-45', '3204555678', '6012345722', 2000000.00, 5),
(10000046, 'José León', 'Calle 46 #46-46', '3204556789', '6012345723', 1900000.00, 6),
(10000047, 'Verónica Suárez', 'Carrera 47 #47-47', '3204557890', '6012345724', 1850000.00, 7),
(10000048, 'Carlos Mendoza', 'Avenida 48 #48-48', '3204558901', '6012345725', 2100000.00, 8),
(10000049, 'Elena Salazar', 'Calle 49 #49-49', '3204559012', '6012345726', 2000000.00, 9),
(10000050, 'Iván Rojas', 'Carrera 50 #50-50', '3204550123', '6012345727', 1950000.00, 10);


-- ## tabla entrada ## --
Drop table if exists entrada;
CREATE TABLE entrada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque_natural(id)
);

INSERT INTO entrada (nombre, ubicacion, id_parque) VALUES 
('Entrada Zaino', 'Cerca de Santa Marta', 1),
('Entrada Calabazo', 'Suroeste del parque, cerca de Bahía Concha', 1),
('Entrada principal en El Cocuy', 'Municipio de El Cocuy, Boyacá', 6),
('Entrada en Güicán de la Sierra', 'Municipio de Güicán de la Sierra, Boyacá', 6),
('Entrada principal en Minca', 'Sector de Minca, Magdalena', 7),
('Entrada en Palomino', 'Sector de Palomino, La Guajira', 7),
('Entrada principal en El Cedral', 'Municipio de Manizales, Caldas', 8),
('Entrada en El Arenales', 'Municipio de Pereira, Risaralda', 8),
('Entrada en La Cabaña', 'Municipio de Salento, Quindío', 8),
('Entrada principal en Palestina', 'Vereda Palestina, municipio de Acevedo, Huila', 3),
('Acceso por San Agustín', 'Municipio de San Agustín, Huila', 4),
('Acceso por Inzá', 'Municipio de Inzá, Cauca', 4),
('Acceso por vuelos charter', 'Acceso limitado a través de vuelos charter', 5),
('Entrada principal en La Macarena', 'Municipio de La Macarena, Meta', 9),
('Entrada en Caño Cristales', 'Río de los Siete Colores', 9),
('Entrada por el muelle de Guapi', 'Muelle turístico en el municipio de Guapi, Cauca', 10),
('Accesos limitados', 'No hay entradas turísticas establecidas', 2);


-- ## tabla personal de gestion ## --
Drop table if exists personal_de_gestion;
CREATE TABLE personal_de_gestion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_identificacion_de_entrada INT,
    personal_parque_id INT,
    entrada_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (entrada_id) REFERENCES entrada(id)
);

INSERT INTO personal_de_gestion (num_identificacion_de_entrada, personal_parque_id, entrada_id) VALUES 
(10000035, 35, 1),
(10000036, 36, 2),
(10000037, 37, 3),
(10000038, 38, 4),
(10000039, 39, 5),
(10000040, 40, 6),
(10000041, 41, 7),
(10000042, 42, 8),
(10000043, 43, 9),
(10000044, 44, 10),
(10000045, 45, 11),
(10000046, 46, 12),
(10000047, 47, 13),
(10000048, 48, 14),
(10000049, 49, 15),
(10000050, 50, 16);


-- ## tabla visitante ## --
Drop table if exists visitante;
CREATE TABLE visitante (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula INT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(45),
    profesion VARCHAR(45),
    alojamiento_id INT,
    personal_de_gestion_id INT,
    FOREIGN KEY (alojamiento_id) REFERENCES alojamiento(id),
    FOREIGN KEY (personal_de_gestion_id) REFERENCES personal_de_gestion(id)
);

-- Parque Nacional Natural Tayrona 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Tayrona ', ROW_NUMBER() OVER(), ', ', 'Santa Marta') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión A' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (1, 2)
LIMIT 100;

-- Parque Nacional Natural El Cocuy 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante El Cocuy ', ROW_NUMBER() OVER(), ', ', 'Boyacá') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión B' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (3, 4)
LIMIT 100;

-- Parque Nacional Natural Sierra Nevada de Santa Marta 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Sierra Nevada ', ROW_NUMBER() OVER(), ', ', 'Magdalena') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión C' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (5, 6)
LIMIT 100;

-- Parque Nacional Natural Los Nevados 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Los Nevados ', ROW_NUMBER() OVER(), ', ', 'Caldas') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión D' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (7, 8, 9)
LIMIT 100;

-- Parque Nacional Natural Cueva de los Guácharos 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Cueva de los Guácharos ', ROW_NUMBER() OVER(), ', ', 'Huila') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión E' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (10)
LIMIT 100;

-- Parque Nacional Natural Nevado del Huila 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Nevado del Huila ', ROW_NUMBER() OVER(), ', ', 'Huila') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión F' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (11, 12)
LIMIT 100;

-- Parque Nacional Natural Chiribiquete
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Chiribiquete ', ROW_NUMBER() OVER(), ', ', 'Guaviare') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión G' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (13)
LIMIT 100;

-- Parque Nacional Natural Serranía de la Macarena 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Serranía de la Macarena ', ROW_NUMBER() OVER(), ', ', 'Meta') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión H' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (14, 15)
LIMIT 100;

-- Parque Nacional Natural Gorgona 
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Gorgona ', ROW_NUMBER() OVER(), ', ', 'Cauca') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión I' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IN (16)
LIMIT 100;

-- Parque Nacional Natural Cordillera de los Picachos (
INSERT INTO visitante (cedula, nombre, direccion, profesion, alojamiento_id, personal_de_gestion_id) 
SELECT FLOOR(RAND() * 1000000000) AS cedula, CONCAT('Visitante Cordillera de los Picachos ', ROW_NUMBER() OVER(), ', ', 'Caquetá') AS nombre, CONCAT('Dirección ', ROW_NUMBER() OVER()) AS direccion, 'Profesión J' AS profesion, NULL AS alojamiento_id, personal_de_gestion.id AS personal_de_gestion_id
FROM personal_de_gestion
WHERE personal_de_gestion.entrada_id IS NULL
LIMIT 100;


-- ## tabla vehiculo ## --
Drop table if exists vehiculo;
CREATE TABLE vehiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(255),
    tipo VARCHAR(45)
);

INSERT INTO vehiculo (marca, tipo) VALUES
('Toyota', 'Automóvil'), -- Parque Nacional Natural Tayrona
('Ford', 'Automóvil'), -- Parque Nacional Natural Tayrona
('Accurate Helicóptero', 'Aéreo'), -- Parque Nacional Natural El Cocuy
('Airbus Helicóptero', 'Aéreo'), -- Parque Nacional Natural El Cocuy
('Caballo sta', 'animal'), -- Parque Nacional Natural Sierra Nevada de Santa Marta
('BELL Helicóptero', 'Aéreo'), -- Parque Nacional Natural Sierra Nevada de Santa Marta
('BHB Helicóptero', 'Aéreo'), -- Parque Nacional Natural Los Nevados
('D.B. Helicóptero', 'Aéreo'), -- Parque Nacional Natural Los Nevados
('AEROKOPTER Helicóptero', 'Aéreo'), -- Parque Nacional Natural Nevado del Huila
('sikorskis Helicóptero', 'Aéreo'), -- Parque Nacional Natural Nevado del Huila
('Caballo chiri', 'Animal'),    -- Parque Nacional Natural Chiribiquete
('MBs Helicóptero', 'Aéreo'), -- Parque Nacional Natural Serranía de la Macarena
('Robinson Helicóptero', 'Aéreo'), -- Parque Nacional Natural Serranía de la Macarena
('bravus Lancha', 'Acuático'),   -- Parque Nacional Natural Gorgona
('kopter Helicóptero', 'Aéreo'), -- Parque Nacional Natural Gorgona
('biplaza Helicóptero ', 'Aéreo'), -- Parque Nacional Natural Cordillera de los Picachos
('AlpiAviaton Helicóptero', 'Aéreo'), -- Parque Nacional Natural Cordillera de los Picachos
('Enstron Helicóptero', 'Aéreo'), -- Parque Nacional Natural Cordillera de los Picachos
('Martin Helicóptero', 'Aéreo'), -- Parque Nacional Natural Cordillera de los Picachos
('Rotor way Helicóptero', 'Aéreo'); -- Parque Nacional Natural Cordillera de los Picachos


-- ## tabla area ## --
Drop table if exists area2;
CREATE TABLE area2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    extension DECIMAL(10, 2),
    parque_id int,
    FOREIGN KEY (parque_id) REFERENCES parque_natural(id)
);

INSERT INTO area2 (nombre, extension, parque_id) VALUES
('Zona Norte', 1500.00, 1), -- Parque Nacional Natural Tayrona
('Zona Sur', 1200.00, 2),  -- Parque Nacional Natural Tayrona
('Área Principal', 1800.00, 3), -- Parque Nacional Natural El Cocuy
('Área de Conservación', 900.00, 4), -- Parque Nacional Natural El Cocuy
('Área Principal', 600.00, 5), -- Parque Nacional Natural Cueva de los Guácharos
('Área Principal', 700.00, 6), -- Parque Nacional Natural Nevado del Huila
('Área de Conservación', 500.00, 7), -- Parque Nacional Natural Nevado del Huila
('Zona de Conservación', 800.00, 8), -- Parque Nacional Natural Chiribiquete
('Área Principal', 1000.00, 9), -- Parque Nacional Natural Serranía de la Macarena
('Área de Caño Cristales', 400.00, 10); -- Parque Nacional Natural Serranía de la Macarena


-- ## tabla personal de vigilancia ## --
Drop table if exists personal_de_vigilancia;
CREATE TABLE personal_de_vigilancia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personal_parque_id INT,
    area2_id INT,
    vehiculo_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (area2_id) REFERENCES area2(id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(id)
);

INSERT INTO personal_de_vigilancia (personal_parque_id, area2_id, vehiculo_id)
VALUES
(1, 1, 1),  -- Personal de vigilancia en Parque Nacional Natural Tayrona
(2, 2, 2),  -- Personal de vigilancia en Parque Nacional Natural Tayrona
(3, 3, 3),  -- Personal de vigilancia en Parque Nacional Natural El Cocuy
(4, 4, 4),  -- Personal de vigilancia en Parque Nacional Natural El Cocuy
(5, 5, 5),  -- Personal de vigilancia en Parque Nacional Natural Cueva de los Guácharos
(6, 6, 6),  -- Personal de vigilancia en Parque Nacional Natural Nevado del Huila
(7, 7, 7),  -- Personal de vigilancia en Parque Nacional Natural Nevado del Huila
(8, 8, 8),  -- Personal de vigilancia en Parque Nacional Natural Chiribiquete
(9, 9, 9),  -- Personal de vigilancia en Parque Nacional Natural Serranía de la Macarena
(10, 10, 10),  -- Personal de vigilancia en Parque Nacional Natural Serranía de la Macarena
(11, 1, 11),  -- Personal de vigilancia en Parque Nacional Natural Gorgona
(12, 2, 12),  -- Personal de vigilancia en Parque Nacional Natural Gorgona
(13, 3, 13),  -- Personal de vigilancia en Parque Nacional Natural Cordillera de los Picachos
(14, 4, 14),  -- Personal de vigilancia en Parque Nacional Natural Cordillera de los Picachos
(15, 5, 15),  -- Personal de vigilancia en Parque Nacional Natural Sierra Nevada de Santa Marta
(16, 6, 16),  -- Personal de vigilancia en Parque Nacional Natural Sierra Nevada de Santa Marta
(17, 7, 17),  -- Personal de vigilancia en Parque Nacional Natural Los Nevados
(18, 8, 18),  -- Personal de vigilancia en Parque Nacional Natural Los Nevados
(19, 9, 19),  -- Personal de vigilancia en Parque Nacional Natural Serranía de la Macarena
(20, 10, 20);  -- Personal de vigilancia en Parque Nacional Natural Serranía de la Macarena


-- ## tabla titulacion ## --
Drop table if exists titulacion;
CREATE TABLE titulacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    fecha DATE
);

INSERT INTO titulacion (titulo, fecha)
VALUES ('Doctor en Biología', '2010-05-15');

INSERT INTO titulacion (titulo, fecha)
VALUES ('Magíster en Conservación Ambiental', '2015-09-28');

INSERT INTO titulacion (titulo, fecha)
VALUES ('Ingeniero Forestal', '2008-12-10');

INSERT INTO titulacion (titulo, fecha)
VALUES ('Licenciado en Ciencias Naturales', '2013-03-20');


-- ## tabla personal investigador ## --
Drop table if exists personal_investigador;
CREATE TABLE personal_investigador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funciones VARCHAR(45),
    personal_parque_id INT,
    titulacion_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (titulacion_id) REFERENCES titulacion(id)
);

-- Insert 1
INSERT INTO personal_investigador (funciones, personal_parque_id, titulacion_id)
VALUES ('Investigador Principal', 21, 1);

-- Insert 2
INSERT INTO personal_investigador (funciones, personal_parque_id, titulacion_id)
VALUES ('Investigador Asociado', 22, 2);

-- Insert 3
INSERT INTO personal_investigador (funciones, personal_parque_id, titulacion_id)
VALUES ('Investigador Auxiliar', 23, 3);

-- Insert 4
INSERT INTO personal_investigador (funciones, personal_parque_id, titulacion_id)
VALUES ('Investigador en Ecología', 24, 4);


-- ## tabla proyectos de investigacion ## --
Drop table if exists proyectos_de_investigacion;
CREATE TABLE proyectos_de_investigacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    presupuesto DECIMAL(10, 2),
    periodo_de_realizacion DATE
);

-- Proyectos para el Parque Natural Chiribiquete
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (25000000.00, '2024-08-01'),
       (18000000.00, '2024-09-15'),
       (30000000.00, '2025-02-28'),
       (22000000.00, '2025-04-10');

-- Proyectos para el Parque Natural Sierra Nevada de Santa Marta
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (15000000.00, '2024-10-01'),
       (28000000.00, '2024-11-15'),
       (20000000.00, '2025-03-10'),
       (35000000.00, '2025-05-20');

-- Proyectos para el Parque Natural Tayrona
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (20000000.00, '2024-09-15'),
       (30000000.00, '2024-10-31'),
       (18000000.00, '2025-01-15'),
       (25000000.00, '2025-04-05');

-- Proyectos para el Parque Natural Los Nevados
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (22000000.00, '2024-11-01'),
       (28000000.00, '2025-01-20'),
       (19000000.00, '2025-03-10'),
       (32000000.00, '2025-06-15');

-- Proyectos para el Parque Natural El Cocuy
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (18000000.00, '2024-10-15'),
       (25000000.00, '2024-12-01'),
       (30000000.00, '2025-02-28'),
       (21000000.00, '2025-05-10');

-- Proyectos para el Parque Natural Amacayacu
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (27000000.00, '2024-09-01'),
       (19000000.00, '2024-11-15'),
       (22000000.00, '2025-03-10'),
       (35000000.00, '2025-06-20');

-- Proyectos para el Parque Natural Sierra de la Macarena
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (30000000.00, '2024-08-15'),
       (23000000.00, '2024-10-31'),
       (18000000.00, '2025-02-15'),
       (26000000.00, '2025-05-01');

-- Proyectos para el Parque Natural Serranía de La Macarena
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (25000000.00, '2024-10-01'),
       (19000000.00, '2024-12-15'),
       (28000000.00, '2025-03-31'),
       (32000000.00, '2025-06-10');

-- Proyectos para el Parque Natural Cueva de los Guácharos
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (20000000.00, '2024-09-15'),
       (27000000.00, '2024-11-30'),
       (22000000.00, '2025-02-28'),
       (35000000.00, '2025-05-15');

-- Proyectos para el Parque Natural Puracé
INSERT INTO proyectos_de_investigacion (presupuesto, periodo_de_realizacion)
VALUES (23000000.00, '2024-08-31'),
       (18000000.00, '2024-10-15'),
       (30000000.00, '2025-01-31'),
       (26000000.00, '2025-04-10');


-- ## tabla proyecto ## --
Drop table if exists proyecto;
CREATE TABLE proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto_de_investigacion INT,
    FOREIGN KEY (id_proyecto_de_investigacion) REFERENCES proyectos_de_investigacion(id)
);

-- Inserts para la tabla proyecto
INSERT INTO proyecto (id_proyecto_de_investigacion) VALUES 
(1),  -- Proyecto de investigación 1 para el Parque Natural Chiribiquete
(2),  -- Proyecto de investigación 2 para el Parque Natural Chiribiquete
(3),  -- Proyecto de investigación 3 para el Parque Natural Chiribiquete
(4),  -- Proyecto de investigación 4 para el Parque Natural Chiribiquete
(5),  -- Proyecto de investigación 1 para el Parque Natural Sierra Nevada de Santa Marta
(6),  -- Proyecto de investigación 2 para el Parque Natural Sierra Nevada de Santa Marta
(7),  -- Proyecto de investigación 3 para el Parque Natural Sierra Nevada de Santa Marta
(8),  -- Proyecto de investigación 4 para el Parque Natural Sierra Nevada de Santa Marta
(9),  -- Proyecto de investigación 1 para el Parque Natural Tayrona
(10), -- Proyecto de investigación 2 para el Parque Natural Tayrona
(11), -- Proyecto de investigación 3 para el Parque Natural Tayrona
(12), -- Proyecto de investigación 4 para el Parque Natural Tayrona
(13), -- Proyecto de investigación 1 para el Parque Natural Los Nevados
(14), -- Proyecto de investigación 2 para el Parque Natural Los Nevados
(15), -- Proyecto de investigación 3 para el Parque Natural Los Nevados
(16), -- Proyecto de investigación 4 para el Parque Natural Los Nevados
(17), -- Proyecto de investigación 1 para el Parque Natural El Cocuy
(18), -- Proyecto de investigación 2 para el Parque Natural El Cocuy
(19), -- Proyecto de investigación 3 para el Parque Natural El Cocuy
(20); -- Proyecto de investigación 4 para el Parque Natural El Cocuy


-- ## tabla especie ## --
Drop table if exists especie;
CREATE TABLE especie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Vegetal', 'Animal', 'Mineral') NOT NULL,
    denominacion_cientifica VARCHAR(45),
    denominacion_vulgar VARCHAR(45),
    num_de_inventario INT,
    area2_id INT,
    personal_investigador_id INT,
    id_proyecto INT,
    FOREIGN KEY (area2_id) REFERENCES area2(id),
	FOREIGN KEY (personal_investigador_id) REFERENCES personal_investigador(id),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto(id)
);

-- Inserts para la tabla especie con tipos corregidos
INSERT INTO especie (tipo, denominacion_cientifica, denominacion_vulgar, num_de_inventario, area2_id, personal_investigador_id, id_proyecto)
VALUES 
('Vegetal', 'Macarenia clavigera', 'Cana de azucar', 1, 1, 1, 1),   -- Especie Vegetal en Parque Natural Chiribiquete, Proyecto 1
('Vegetal', 'Puya humboldtii', 'frailejón', 2, 2, 2, 2),           -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 2
('Mineral', 'Tapirus bairdii', 'Danta centroamericana', 3, 3, 3, 3),-- Especie Mineral en Parque Natural Tayrona, Proyecto 3
('Vegetal', 'Ceroxylon quindiuense', 'Palma de cera', 4, 4, 4, 4),  -- Especie Vegetal en Parque Natural Los Nevados, Proyecto 4
('Vegetal', 'Espeletia grandiflora', 'frailejón', 5, 5, 1, 5),       -- Especie Vegetal en Parque Natural El Cocuy, Proyecto 1
('Animal', 'Balamites arietites', 'Danta centroamericana', 6, 6, 2, 2), -- Especie Animal en Parque Natural Chiribiquete, Proyecto 2
('Vegetal', 'Helechos arbóreos', 'Helecho', 7, 7, 3, 3),            -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 3
('Mineral', 'Eudorina', 'Alga verde', 8, 8, 4, 4),                  -- Especie Mineral en Parque Natural Tayrona, Proyecto 4
('Animal', 'Tubifex', 'Anélido', 9, 9, 1, 5),                      -- Especie Animal en Parque Natural Los Nevados, Proyecto 1
('Vegetal', 'Montipora capitata', 'Coral', 10, 10, 2, 6),          -- Especie Vegetal en Parque Natural El Cocuy, Proyecto 2
('Animal', 'Myrmecophaga tridactyla', 'Oso hormiguero', 11, 1, 3, 1),  -- Especie Animal en Parque Natural Chiribiquete, Proyecto 1
('Vegetal', 'Leucanthemum vulgare', 'Margarita común', 12, 2, 4, 2),    -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 2
('Mineral', 'Sphagnum', 'Musgo', 13, 3, 1, 3),                      -- Especie Mineral en Parque Natural Tayrona, Proyecto 3
('Vegetal', 'Freesia', 'Fresia', 14, 4, 2, 4),                      -- Especie Vegetal en Parque Natural Los Nevados, Proyecto 4
('Mineral', 'Lomariopsis', 'Helecho', 15, 5, 3, 5),                 -- Especie Mineral en Parque Natural El Cocuy, Proyecto 1
('Animal', 'Prosthechea', 'Orquídea', 16, 6, 4, 2),                -- Especie Animal en Parque Natural Chiribiquete, Proyecto 2
('Vegetal', 'Astrophytum', 'Cactus', 17, 7, 1, 3),                  -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 3
('Animal', 'Habropetalum', 'Orquídea', 18, 8, 2, 4),               -- Especie Animal en Parque Natural Tayrona, Proyecto 4
('Mineral', 'Puya', 'frailejón', 19, 9, 3, 5),                      -- Especie Mineral en Parque Natural Los Nevados, Proyecto 1
('Vegetal', 'Macarenia clavigera', 'Cana de azucar', 20, 10, 4, 6),-- Especie Vegetal en Parque Natural El Cocuy, Proyecto 2
('Animal', 'Puya humboldtii', 'frailejón', 21, 1, 1, 1),           -- Especie Animal en Parque Natural Chiribiquete, Proyecto 1
('Vegetal', 'Tapirus bairdii', 'Danta centroamericana', 22, 2, 2, 2), -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 2
('Mineral', 'Ceroxylon quindiuense', 'Palma de cera', 23, 3, 3, 3),  -- Especie Mineral en Parque Natural Tayrona, Proyecto 3
('Vegetal', 'Espeletia grandiflora', 'frailejón', 24, 4, 4, 4),       -- Especie Vegetal en Parque Natural Los Nevados, Proyecto 4
('Mineral', 'Balamites arietites', 'Danta centroamericana', 25, 5, 1, 5), -- Especie Mineral en Parque Natural El Cocuy, Proyecto 1
('Animal', 'Helechos arbóreos', 'Helecho', 26, 6, 2, 2),           -- Especie Animal en Parque Natural Chiribiquete, Proyecto 2
('Vegetal', 'Eudorina', 'Alga verde', 27, 7, 3, 3),                 -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 3
('Mineral', 'Tubifex', 'Anélido', 28, 8, 4, 4),                     -- Especie Mineral en Parque Natural Tayrona, Proyecto 4
('Vegetal', 'Montipora capitata', 'Coral', 29, 9, 1, 5),            -- Especie Vegetal en Parque Natural Los Nevados, Proyecto 1
('Animal', 'Myrmecophaga tridactyla', 'Oso hormiguero', 30, 10, 2, 6), -- Especie Animal en Parque Natural El Cocuy, Proyecto 2
('Vegetal', 'Leucanthemum vulgare', 'Margarita común', 31, 1, 3, 1),    -- Especie Vegetal en Parque Natural Chiribiquete, Proyecto 1
('Mineral', 'Sphagnum', 'Musgo', 32, 2, 4, 2),                      -- Especie Mineral en Parque Natural Sierra Nevada de Santa Marta, Proyecto 2
('Vegetal', 'Freesia', 'Fresia', 33, 3, 1, 3),                      -- Especie Vegetal en Parque Natural Tayrona, Proyecto 3
('Mineral', 'Lomariopsis', 'Helecho', 34, 4, 2, 4),                 -- Especie Mineral en Parque Natural Los Nevados, Proyecto 4
('Animal', 'Prosthechea', 'Orquídea', 35, 5, 3, 5),                -- Especie Animal en Parque Natural El Cocuy, Proyecto 1
('Vegetal', 'Astrophytum', 'Cactus', 36, 6, 4, 2),                  -- Especie Vegetal en Parque Natural Chiribiquete, Proyecto 2
('Animal', 'Habropetalum', 'Orquídea', 37, 7, 1, 3),               -- Especie Animal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 3
('Vegetal', 'Puya', 'frailejón', 38, 8, 2, 4),                      -- Especie Vegetal en Parque Natural Tayrona, Proyecto 4
('Mineral', 'Macarenia clavigera', 'Cana de azucar', 39, 9, 3, 5),  -- Especie Mineral en Parque Natural Los Nevados, Proyecto 1
('Vegetal', 'Puya humboldtii', 'frailejón', 40, 10, 4, 6),         -- Especie Vegetal en Parque Natural El Cocuy, Proyecto 2
('Animal', 'Tapirus bairdii', 'Danta centroamericana', 41, 1, 1, 1),-- Especie Animal en Parque Natural Chiribiquete, Proyecto 1
('Vegetal', 'Ceroxylon quindiuense', 'Palma de cera', 42, 2, 2, 2),  -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 2
('Mineral', 'Espeletia grandiflora', 'frailejón', 43, 3, 3, 3),       -- Especie Mineral en Parque Natural Tayrona, Proyecto 3
('Vegetal', 'Balamites arietites', 'Danta centroamericana', 44, 4, 4, 4),-- Especie Vegetal en Parque Natural Los Nevados, Proyecto 4
('Mineral', 'Helechos arbóreos', 'Helecho', 45, 5, 1, 5),           -- Especie Mineral en Parque Natural El Cocuy, Proyecto 1
('Animal', 'Eudorina', 'Alga verde', 46, 6, 2, 2),                  -- Especie Animal en Parque Natural Chiribiquete, Proyecto 2
('Vegetal', 'Tubifex', 'Anélido', 47, 7, 3, 3),                     -- Especie Vegetal en Parque Natural Sierra Nevada de Santa Marta, Proyecto 3
('Mineral', 'Montipora capitata', 'Coral', 48, 8, 4, 4),            -- Especie Mineral en Parque Natural Tayrona, Proyecto 4
('Vegetal', 'Myrmecophaga tridactyla', 'Oso hormiguero', 49, 9, 1, 5), -- Especie Vegetal en Parque Natural Los Nevados, Proyecto 1
('Animal', 'Leucanthemum vulgare', 'Margarita común', 50, 10, 2, 6);    -- Especie Animal en Parque Natural El Cocuy, Proyecto 2


-- ## tabla personal de conservacion ## --
Drop table if exists personal_de_conservacion;
CREATE TABLE personal_de_conservacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
	especialidad ENUM('Limpieza', 'Organizacion', 'Alimentacion') NOT NULL,
    personal_parque_id INT,
    area2_id INT,
    FOREIGN KEY (personal_parque_id) REFERENCES personal_parque(id),
    FOREIGN KEY (area2_id) REFERENCES area2(id)
);

-- Inserts para la tabla personal_de_conservacion con especialidades actualizadas
INSERT INTO personal_de_conservacion (especialidad, personal_parque_id, area2_id)
VALUES 
('Limpieza', 1, 1),   -- Personal de conservación 1 en Parque Natural Chiribiquete, Área 2
('Organización', 2, 2),   -- Personal de conservación 2 en Parque Natural Sierra Nevada de Santa Marta, Área 2
('Alimentación', 3, 3),   -- Personal de conservación 3 en Parque Natural Tayrona, Área 2
('Limpieza', 4, 4),   -- Personal de conservación 4 en Parque Natural Los Nevados, Área 2
('Organización', 5, 5),   -- Personal de conservación 5 en Parque Natural El Cocuy, Área 2
('Alimentación', 6, 6),   -- Personal de conservación 6 en Parque Natural Chiribiquete, Área 2
('Limpieza', 7, 7),   -- Personal de conservación 7 en Parque Natural Sierra Nevada de Santa Marta, Área 2
('Organización', 8, 8),   -- Personal de conservación 8 en Parque Natural Tayrona, Área 2
('Alimentación', 9, 9),   -- Personal de conservación 9 en Parque Natural Los Nevados, Área 2
('Limpieza', 10, 10); -- Personal de conservación 10 en Parque Natural El Cocuy, Área 2


select * from visitante;

show tables;

/*
Consultas
Funciones
Seguridad
Transacciones
*/


-- CONSULTAS
-- 1. Numero de inventario de individuos por area
select 
    area2.nombre,
    SUM(especie.num_de_inventario) as total_inventario
from 
    area2
inner join 
    especie on especie.area2_id = area2.id
group by 
    area2.nombre;

-- 2. Las consultas se refieren al número de parques existentes en cada dpto
select 
	departamento.departamentos,
    parque_natural.nombre
from 
	departamento
inner join 
	parque_natural on parque_natural.departamento_id = departamento.id;
    
    
-- 3. La superficie total de cada parque
select 
	nombre,
    superficie_total
from
	parque_natural;
    
-- 4. capacidad limitada de alojamiento, categoria y parque
select 
    parque_natural.nombre as parque_nombre,
    alojamiento.categoria,
    SUM(alojamiento.capacidad) as total_capacidad
from
    parque_natural
inner join 
    alojamiento on alojamiento.parque_natural_id = parque_natural.id
group by 
    parque_natural.nombre, 
    alojamiento.categoria;


-- 5. Consulta para obtener el personal de vigilancia y el vehículo asignado
select 
    personal_de_vigilancia.id as id_vigilancia,
    personal_parque.nombre as nombre_personal,
    vehiculo.marca as marca_vehiculo,
    vehiculo.tipo as tipo_vehiculo
from
    personal_de_vigilancia personal_de_vigilancia
inner join 
    personal_parque personal_parque on personal_de_vigilancia.personal_parque_id = personal_parque.id
inner join 
    vehiculo vehiculo on personal_de_vigilancia.vehiculo_id = vehiculo.id;
 
 
 
 
 
 -- FUNCIONES

### Función 1: Sueldos y Suma de Personal Parque
DELIMITER //

CREATE FUNCTION obtener_sueldos_personal_parque()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT;

    SELECT CONCAT('Sueldo: ', sueldo) AS detalle_sueldo
    FROM personal_parque;

    SELECT CONCAT('Suma Total de Sueldos: ', SUM(sueldo)) INTO resultado
    FROM personal_parque;

    RETURN resultado;
END //

DELIMITER ;

SELECT obtener_sueldos_personal_parque();

### Función 2: Sueldos y Suma de Personal de Gestión
DELIMITER //

CREATE FUNCTION obtener_sueldos_personal_gestion()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT;

    SELECT CONCAT('Sueldo: ', pp.sueldo) AS detalle_sueldo
    FROM personal_de_gestion pg
    JOIN personal_parque pp ON pg.personal_parque_id = pp.id;

    SELECT CONCAT('Suma Total de Sueldos: ', SUM(pp.sueldo)) INTO resultado
    FROM personal_de_gestion pg
    JOIN personal_parque pp ON pg.personal_parque_id = pp.id;

    RETURN resultado;
END //

DELIMITER ;

SELECT obtener_sueldos_personal_gestion();

### Función 3: Sueldos y Suma de Personal de Vigilancia
DELIMITER //

CREATE FUNCTION obtener_sueldos_personal_vigilancia()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT;

    SELECT CONCAT('Sueldo: ', pp.sueldo) AS detalle_sueldo
    FROM personal_de_vigilancia pv
    JOIN personal_parque pp ON pv.personal_parque_id = pp.id;

    SELECT CONCAT('Suma Total de Sueldos: ', SUM(pp.sueldo)) INTO resultado
    FROM personal_de_vigilancia pv
    JOIN personal_parque pp ON pv.personal_parque_id = pp.id;

    RETURN resultado;
END //

DELIMITER ;

SELECT obtener_sueldos_personal_vigilancia();

### Función 4: Sueldos y Suma de Personal de Investigación
DELIMITER //

CREATE FUNCTION obtener_sueldos_personal_investigacion()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT;

    SELECT CONCAT('Sueldo: ', pp.sueldo) AS detalle_sueldo
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;

    SELECT CONCAT('Suma Total de Sueldos: ', SUM(pp.sueldo)) INTO resultado
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;

    RETURN resultado;
END //

DELIMITER ;

SELECT obtener_sueldos_personal_investigacion();

### Función 5: Sueldos y Suma de Personal de Conservación
DELIMITER //

CREATE FUNCTION obtener_sueldos_personal_conservacion()
RETURNS TEXT
BEGIN
    DECLARE resultado TEXT;

    SELECT CONCAT('Sueldo: ', pp.sueldo) AS detalle_sueldo
    FROM personal_de_conservacion pc
    JOIN personal_parque pp ON pc.personal_parque_id = pp.id;

    SELECT CONCAT('Suma Total de Sueldos: ', SUM(pp.sueldo)) INTO resultado
    FROM personal_de_conservacion pc
    JOIN personal_parque pp ON pc.personal_parque_id = pp.id;

    RETURN resultado;
END //

DELIMITER ;

SELECT obtener_sueldos_personal_conservacion();

### Función 6
DELIMITER //

CREATE FUNCTION calcular_costo_total() RETURNS DECIMAL(12, 2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_costo DECIMAL(12, 2);
    DECLARE suma_precios DECIMAL(12, 2);
    DECLARE suma_sueldos DECIMAL(12, 2);
    DECLARE suma_presupuestos DECIMAL(12, 2);
    
    SELECT SUM(precio_x_noche * 625) INTO suma_precios FROM alojamiento;
    
    SELECT SUM(sueldo) INTO suma_sueldos FROM personal_parque;
    
    SELECT SUM(presupuesto) INTO suma_presupuestos FROM proyectos_de_investigacion;
    
    SET total_costo = suma_precios - (suma_sueldos + (suma_presupuestos/12));
    
    RETURN total_costo;
END //

DELIMITER ;

SELECT calcular_costo_total();




-- PROCEDIMIENTOS

-- Eliminar el procedimiento si existe previamente
DROP PROCEDURE IF EXISTS gestionar_alojamiento;

-- Crear el procedimiento gestionar_alojamiento
DELIMITER //

CREATE PROCEDURE gestionar_alojamiento(
    IN accion VARCHAR(10),    -- 'insertar', 'actualizar' o 'eliminar'
    IN id_alojamiento INT,    -- ID del alojamiento a modificar o eliminar
    IN capacidad INT,         -- Nueva capacidad en caso de actualización o inserción
    IN categoria VARCHAR(45), -- Nueva categoría en caso de actualización o inserción
    IN precio DECIMAL(10, 2)  -- Nuevo precio por noche en caso de actualización o inserción
)
BEGIN
    DECLARE msg VARCHAR(100);

    IF accion = 'insertar' THEN
        INSERT INTO alojamiento(capacidad, categoria, precio_x_noche)
        VALUES (capacidad, categoria, precio);
        SET msg = 'Se ha insertado un nuevo alojamiento.';
    ELSEIF accion = 'actualizar' THEN
        UPDATE alojamiento
        SET capacidad = capacidad,
            categoria = categoria,
            precio_x_noche = precio
        WHERE id = id_alojamiento;
        SET msg = CONCAT('Se ha actualizado el alojamiento con ID ', id_alojamiento, '.');
    ELSEIF accion = 'eliminar' THEN
        DELETE FROM alojamiento WHERE id = id_alojamiento;
        SET msg = CONCAT('Se ha eliminado el alojamiento con ID ', id_alojamiento, '.');
    ELSE
        SET msg = 'Acción no válida. Usar "insertar", "actualizar" o "eliminar".';
    END IF;

    SELECT msg AS mensaje;
END //

DELIMITER ;



-- Eliminar el procedimiento si existe previamente
DROP PROCEDURE IF EXISTS registrar_entrada;

-- Crear el procedimiento registrar_entrada
DELIMITER //

CREATE PROCEDURE registrar_entrada(
    IN nombre_visitante VARCHAR(100),  -- Nombre del visitante
    IN direccion VARCHAR(100),         -- Dirección del visitante
    IN profesion VARCHAR(50),          -- Profesión del visitante
    IN alojamiento_id INT              -- ID del alojamiento asignado al visitante
)
BEGIN
    DECLARE id_entrada INT;

    -- Registrar la entrada del visitante
    INSERT INTO entrada(nombre, ubicacion, id_parque)
    VALUES (nombre_visitante, direccion, 1);  -- Reemplaza '1' con el ID correcto del parque

    -- Obtener el ID de la entrada registrada
    SET id_entrada = LAST_INSERT_ID();

    -- Asignar el visitante al alojamiento correspondiente
    UPDATE visitante
    SET direccion = direccion,
        profesion = profesion,
        alojamiento_id = alojamiento_id
    WHERE id = id_entrada;

    SELECT CONCAT('Entrada registrada con ID ', id_entrada) AS mensaje;
END //

DELIMITER ;



-- TRIGGER

-- Eliminar el trigger si existe previamente
DROP TRIGGER IF EXISTS limite_capacidad;

-- Crear el trigger para limitar la capacidad de visitantes por parque
DELIMITER //

CREATE TRIGGER limite_capacidad
BEFORE INSERT ON visitante
FOR EACH ROW
BEGIN
    DECLARE total_visitantes INT;

    -- Calcular el total de visitantes registrados en el parque del alojamiento
    SELECT COUNT(*)
    INTO total_visitantes
    FROM visitante v
    INNER JOIN alojamiento a ON v.alojamiento_id = a.id
    WHERE a.id = NEW.alojamiento_id;

    -- Verificar si se excede la capacidad máxima (100)
    IF total_visitantes >= 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Se ha alcanzado la capacidad máxima de visitantes para este alojamiento en el parque.';
    END IF;
END //

DELIMITER ;



-- EVENTO

SET GLOBAL event_scheduler = ON;

-- Eliminar el evento si existe previamente
DROP EVENT IF EXISTS eliminar_datos_visitantes;

-- Crear el evento para eliminar los datos de visitantes el 1 de agosto
CREATE EVENT eliminar_datos_visitantes
ON SCHEDULE
    AT '2024-08-01 00:00:00'
DO
    DELETE FROM visitante;
    
    
    

-- PERMISOS

-- Creación de usuarios
create user 'administrador'@'%' identified by 'administrador';
create user 'responsable_parques'@'%' identified by 'responsable_parques';
create user 'responsable_personal'@'%' identified by 'responsable_personal';
create user 'administrador_alojamiento'@'%' identified by 'administrador_alojamiento';
create user 'personal_de_gestion'@'%' identified by 'personal_de_gestion';
create user 'personal_investigador'@'%' identified by 'personal_investigador';
create user 'personal_de_vigilancia'@'%' identified by 'personal_de_vigilancia';

-- Asignación de permisos administrador
GRANT ALL ON *.* TO 'administrador'@'%';
REVOKE DROP ON Proyecto_BBDD_PortillaAndres_PedrazaAndres.* FROM 'administrador'@'localhost';

-- Asignación de permisos administrador responsable parques
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_parque TO 'responsable_parques'@'%';
GRANT EXECUTE ON FUNCTION calcular_costo_total TO 'responsable_parques'@'%';
GRANT EXECUTE ON PROCEDURE registrar_entrada TO 'responsable_parques'@'%';
GRANT EXECUTE ON PROCEDURE gestionar_alojamiento TO 'responsable_parques'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON parque.* TO 'responsable_parques'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_parque.* TO 'responsable_parques'@'%';
GRANT SELECT ON alojamiento.* TO 'responsable_parques'@'%';
GRANT SELECT ON proyectos_de_investigacion.* TO 'responsable_parques'@'%';


-- Asignación de permisos administrador responsable personal
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_parque TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_gestion TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_investigacion TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_conservacion TO 'responsable_personal'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON personal_parque.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_gestion.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_investigador.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_vigilancia.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_conservacion.* TO 'responsable_personal'@'%';


-- Asignación de permisos administrador administrador alojamiento
GRANT EXECUTE ON PROCEDURE gestionar_alojamiento TO 'administrador_alojamiento'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON alojamiento.* TO 'administrador_alojamiento'@'%';

-- Asignación de permisos administrador personal de gestion
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_gestion TO 'personal_de_gestion'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_de_gestion'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_de_gestion.* TO 'personal_de_gestion'@'%';

-- Asignación de permisos administrador personal investigador
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_investigacion TO 'personal_investigador'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_investigador'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_investigador.* TO 'personal_investigador'@'%';

-- Asignación de permisos administrador personal de vigilancia
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_vigilancia TO 'personal_de_vigilancia'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_de_vigilancia'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_de_vigilancia.* TO 'personal_de_vigilancia'@'%';

-- Revisar permisos de x usuario
show grants for 'administrador'@'%';
show grants for 'responsable_parques'@'%';
show grants for 'responsable_personal'@'%';
show grants for 'administrador_alojamiento'@'%';
show grants for 'personal_de_gestion'@'%';
show grants for 'personal_investigador'@'%';
show grants for 'personal_de_vigilancia'@'%';