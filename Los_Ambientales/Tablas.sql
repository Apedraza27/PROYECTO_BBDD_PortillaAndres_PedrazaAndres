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

-- ## tabla entidad ## --
drop table if exists entidad;
CREATE TABLE entidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamento(id)
);

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

-- ## tabla entrada ## --
Drop table if exists entrada;
CREATE TABLE entrada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque_natural(id)
);

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

-- ## tabla vehiculo ## --
Drop table if exists vehiculo;
CREATE TABLE vehiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(255),
    tipo VARCHAR(45)
);

-- ## tabla area ## --
Drop table if exists area2;
CREATE TABLE area2 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    extension DECIMAL(10, 2),
    parque_id int,
    FOREIGN KEY (parque_id) REFERENCES parque_natural(id)
);

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

-- ## tabla titulacion ## --
Drop table if exists titulacion;
CREATE TABLE titulacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(45),
    fecha DATE
);

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

-- ## tabla proyectos de investigacion ## --
Drop table if exists proyectos_de_investigacion;
CREATE TABLE proyectos_de_investigacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    presupuesto DECIMAL(10, 2),
    periodo_de_realizacion DATE
);

-- ## tabla proyecto ## --
Drop table if exists proyecto;
CREATE TABLE proyecto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto_de_investigacion INT,
    FOREIGN KEY (id_proyecto_de_investigacion) REFERENCES proyectos_de_investigacion(id)
);

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


show tables;