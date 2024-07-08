-- insercciones
use LosAmbientales;


INSERT INTO vehiculo (tipo, marca) VALUES 
('Sedán', 'Toyota'),
('SUV', 'Ford'),
('Hatchback', 'Volkswagen'),
('Convertible', 'BMW'),
('Coupé', 'Audi'),
('Pickup', 'Chevrolet'),
('Minivan', 'Honda'),
('Wagon', 'Subaru'),
('Roadster', 'Mazda'),
('Limousine', 'Cadillac'),
('Electric', 'Tesla'),
('Hybrid', 'Toyota'),
('Diesel', 'Mercedes-Benz'),
('Luxury', 'Lexus'),
('Sport', 'Porsche'),
('Crossover', 'Nissan'),
('Off-road', 'Jeep'),
('Compact', 'Hyundai'),
('Full-size', 'Chrysler'),
('Subcompact', 'Kia'),
('Luxury SUV', 'Land Rover'),
('Performance', 'Ferrari'),
('Family', 'Volvo'),
('Adventure', 'Mitsubishi'),
('City', 'Smart'),
('Classic', 'Jaguar'),
('Utility', 'GMC'),
('Sports Car', 'Lamborghini'),
('Economy', 'Fiat'),
('Executive', 'Bentley');

-- Consulta para verificar la inserccion de la informaccion.
SELECT * FROM vehiculo;


INSERT INTO proyecto_investigacion (nombre, presupuesto, periodo_de_realizacion) VALUES 
('Estudio de Biodiversidad', 150000.00, '2022-2023'),
('Conservación del Amazonas', 200000.00, '2021-2022'),
('Impacto del Cambio Climático', 175000.00, '2020-2021'),
('Restauración de Manglares', 220000.00, '2023-2024'),
('Protección de Especies en Peligro', 180000.00, '2022-2023'),
('Reforestación de los Andes', 250000.00, '2021-2023'),
('Gestión Sostenible de Agua', 300000.00, '2023-2025'),
('Conservación de Humedales', 160000.00, '2020-2022'),
('Monitorización de Fauna', 190000.00, '2021-2022'),
('Preservación de Ecosistemas Marinos', 230000.00, '2022-2024'),
('Investigación de Suelos', 170000.00, '2023-2024'),
('Calidad del Aire en Ciudades', 210000.00, '2020-2021'),
('Desarrollo de Energías Renovables', 240000.00, '2021-2023'),
('Conservación de la Selva Tropical', 260000.00, '2023-2025'),
('Control de Especies Invasoras', 280000.00, '2022-2024'),
('Sostenibilidad Urbana', 185000.00, '2021-2022'),
('Conservación de Parques Nacionales', 195000.00, '2020-2021'),
('Estudio de Recursos Hídricos', 205000.00, '2023-2024'),
('Evaluación de Ecosistemas', 215000.00, '2022-2023'),
('Rescate de Especies Amenazadas', 225000.00, '2021-2023'),
('Uso Sostenible de la Biodiversidad', 235000.00, '2023-2025'),
('Rehabilitación de Corales', 245000.00, '2020-2022'),
('Impacto de la Deforestación', 255000.00, '2021-2022'),
('Conservación de Aves Migratorias', 265000.00, '2022-2024'),
('Investigación de Bosques Secos', 275000.00, '2023-2024'),
('Desarrollo de Agricultura Sostenible', 285000.00, '2020-2021'),
('Evaluación de Cambio de Uso de Suelo', 295000.00, '2021-2023'),
('Conservación de Biodiversidad Costera', 305000.00, '2023-2025'),
('Monitoreo de Recursos Naturales', 315000.00, '2022-2024'),
('Impacto del Turismo en la Biodiversidad', 325000.00, '2021-2022');

-- Verificación de las inserciones
SELECT * FROM proyecto_investigacion;


INSERT INTO departamento (nombre, capital) VALUES 
('Amazonas', 'Leticia'),
('Antioquia', 'Medellín'),
('Arauca', 'Arauca'),
('Atlántico', 'Barranquilla'),
('Bolívar', 'Cartagena'),
('Boyacá', 'Tunja'),
('Caldas', 'Manizales'),
('Caquetá', 'Florencia'),
('Casanare', 'Yopal'),
('Cauca', 'Popayán'),
('Cesar', 'Valledupar'),
('Chocó', 'Quibdó'),
('Córdoba', 'Montería'),
('Cundinamarca', 'Bogotá'),
('Guainía', 'Inírida'),
('Guaviare', 'San José del Guaviare'),
('Huila', 'Neiva'),
('La Guajira', 'Riohacha'),
('Magdalena', 'Santa Marta'),
('Meta', 'Villavicencio'),
('Nariño', 'Pasto'),
('Norte de Santander', 'Cúcuta'),
('Putumayo', 'Mocoa'),
('Quindío', 'Armenia'),
('Risaralda', 'Pereira'),
('San Andrés y Providencia', 'San Andrés'),
('Santander', 'Bucaramanga'),
('Sucre', 'Sincelejo'),
('Tolima', 'Ibagué'),
('Valle del Cauca', 'Cali'),
('Vaupés', 'Mitú'),
('Vichada', 'Puerto Carreño');

-- Verificación de las inserciones
SELECT * FROM departamento;

-- Insertar entidades para cada departamento
INSERT INTO entidad (nombre, tipo, id_departamento) VALUES 
('Corporación para el Desarrollo del Amazonas', 'Corporación', 1),
('Agencia para la Innovación de Antioquia', 'Agencia', 2),
('Instituto de Investigaciones de Arauca', 'Instituto', 3),
('Fundación Ambiental del Atlántico', 'Fundación', 4),
('Centro de Investigación de Bolívar', 'Centro', 5),
('Corporación Ambiental de Boyacá', 'Corporación', 6),
('Agencia para el Desarrollo de Caldas', 'Agencia', 7),
('Instituto de Investigación de Caquetá', 'Instituto', 8),
('Fundación para el Progreso de Casanare', 'Fundación', 9),
('Centro de Estudios del Cauca', 'Centro', 10),
('Corporación para el Desarrollo del Cesar', 'Corporación', 11),
('Agencia para el Desarrollo del Chocó', 'Agencia', 12),
('Instituto de Investigación de Córdoba', 'Instituto', 13),
('Fundación para el Desarrollo de Cundinamarca', 'Fundación', 14),
('Centro de Estudios de Guainía', 'Centro', 15),
('Corporación para el Desarrollo de Guaviare', 'Corporación', 16),
('Agencia para la Innovación del Huila', 'Agencia', 17),
('Instituto de Investigación de La Guajira', 'Instituto', 18),
('Fundación Ambiental de Magdalena', 'Fundación', 19),
('Centro de Investigación del Meta', 'Centro', 20),
('Corporación Ambiental de Nariño', 'Corporación', 21),
('Agencia para el Desarrollo de Norte de Santander', 'Agencia', 22),
('Instituto de Investigación del Putumayo', 'Instituto', 23),
('Fundación para el Progreso del Quindío', 'Fundación', 24),
('Centro de Estudios de Risaralda', 'Centro', 25),
('Corporación para el Desarrollo de San Andrés y Providencia', 'Corporación', 26),
('Agencia para la Innovación de Santander', 'Agencia', 27),
('Instituto de Investigación de Sucre', 'Instituto', 28),
('Fundación Ambiental de Tolima', 'Fundación', 29),
('Centro de Investigación del Valle del Cauca', 'Centro', 30);

-- Verificación de las inserciones
SELECT * FROM entidad;


-- Consulta los departamentos anidados a cada entidad
SELECT entidad.nombre AS entidad_nombre, entidad.tipo, departamento.nombre AS departamento_nombre, departamento.capital
FROM entidad
JOIN departamento ON entidad.id_departamento = departamento.id
ORDER BY entidad.nombre;

-- Verificación de la consulta
SELECT * FROM (
    SELECT entidad.nombre AS entidad_nombre, entidad.tipo, departamento.nombre AS departamento_nombre, departamento.capital
    FROM entidad
    JOIN departamento ON entidad.id_departamento = departamento.id
    ORDER BY entidad.nombre
) AS entidades_departamentos;


-- Insertar parques representativos de diferentes regiones de Colombia con entidades existentes
INSERT INTO parque (nombre, fecha, superficie, id_departamento, id_entidad) VALUES 
('Parque Nacional Natural Amacayacu', '1994-07-15', 293500, 1, 1),
('Parque Nacional Natural Los Nevados', '1974-10-30', 583000, 11, 11),
('Parque Nacional Natural Tayrona', '1969-11-09', 15000, 19, 19),
('Parque Nacional Natural Chiribiquete', '1989-06-26', 27000000, 9, 9),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '1964-06-19', 383000, 19, 19),
('Parque Nacional Natural Cocuy', '1977-06-24', 306300, 16, 16),
('Parque Nacional Natural El Tuparro', '1970-07-05', 548000, 24, 24),
('Parque Nacional Natural Puracé', '1961-06-30', 83100, 10, 10),
('Parque Nacional Natural Utría', '1987-06-23', 54800, 4, 4),
('Parque Nacional Natural Los Katíos', '1973-11-06', 72000, 5, 5),
('Parque Nacional Natural Old Providence McBean Lagoon', '2000-01-17', 2970, 26, 26),
('Parque Nacional Natural Sierra de La Macarena', '1971-04-27', 600000, 20, 20),
('Parque Nacional Natural Sumapaz', '1977-10-02', 105000, 14, 14),
('Parque Nacional Natural Farallones de Cali', '1968-11-04', 150000, 30, 30),
('Parque Nacional Natural Los Estoraques', '1987-10-27', 1180, 22, 22),
('Parque Nacional Natural Isla de Malpelo', '1995-07-12', 8570, 32, 32),
('Parque Nacional Natural Serranía de Chiribiquete', '1989-06-26', 2800000, 12, 12),
('Parque Nacional Natural Gorgona', '1985-08-22', 6160, 27, 27);

-- Verificación de las inserciones
SELECT * FROM parque;

