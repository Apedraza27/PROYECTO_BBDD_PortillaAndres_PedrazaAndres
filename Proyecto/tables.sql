DROP DATABASE IF EXISTS LosAmbientales;
CREATE DATABASE LosAmbientales;
USE LosAmbientales;

DROP TABLE IF EXISTS vehiculo;
CREATE TABLE vehiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    marca VARCHAR(50)
);

DROP TABLE IF EXISTS proyecto_investigacion;
CREATE TABLE proyecto_investigacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(50),
    presupuesto FLOAT,
    periodo_de_realizacion VARCHAR(50)
);

DROP TABLE IF EXISTS departamento;
CREATE TABLE departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    capital VARCHAR(100)
);

DROP TABLE IF EXISTS entidad;
CREATE TABLE entidad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(100),
    tipo VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

DROP TABLE IF EXISTS parque;
CREATE TABLE parque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    fecha DATE,
    superficie FLOAT,
    id_departamento INT,
    id_entidad INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id),
    FOREIGN KEY (id_entidad) REFERENCES entidad(id)
);

DROP TABLE IF EXISTS area2;
CREATE TABLE area2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    extension FLOAT,
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque(id)
);

DROP TABLE IF EXISTS personal_parque;
CREATE TABLE personal_parque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cedula VARCHAR(15) UNIQUE,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(50),
    sueldo FLOAT,
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque(id)
);

DROP TABLE IF EXISTS personal_gestion;
CREATE TABLE personal_gestion (
    id INT PRIMARY KEY,
    id_personalgestion INT,
    numero_identificacion_entrada INT,
    FOREIGN KEY (id) REFERENCES personal_parque(id)
);

DROP TABLE IF EXISTS personal_vigilancia;
CREATE TABLE personal_vigilancia (
    id INT PRIMARY KEY,
    id_personalparque INT,
    id_area INT,
    id_vehiculo INT,
    FOREIGN KEY (id_area) REFERENCES area2(id),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id),
    FOREIGN KEY (id) REFERENCES personal_parque(id)
);

DROP TABLE IF EXISTS personal_conservacion;
CREATE TABLE personal_conservacion (
    id INT PRIMARY KEY,
    especialidad VARCHAR(50),
    id_area INT,
    FOREIGN KEY (id_area) REFERENCES area2(id),
    FOREIGN KEY (id) REFERENCES personal_parque(id)
);

DROP TABLE IF EXISTS personal_investigador;
CREATE TABLE personal_investigador (
    id INT PRIMARY KEY,
    nombre_titulacion VARCHAR(100),
    funciones VARCHAR(100),
    id_proyecto INT,
    FOREIGN KEY (id_proyecto) REFERENCES proyecto_investigacion(id),
    FOREIGN KEY (id) REFERENCES personal_parque(id)
);

DROP TABLE IF EXISTS especie;
CREATE TABLE especie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('Vegetal', 'Animal', 'Mineral'),
    nombre_cientifico VARCHAR(100),
    nombre_vulgar VARCHAR(100),
    cantidad INT,
    id_area2 INT,
    id_personal_investigador INT,
    FOREIGN KEY (id_area2) REFERENCES area2(id),
    FOREIGN KEY (id_personal_investigador) REFERENCES personal_parque(id)
);

DROP TABLE IF EXISTS alojamiento;
CREATE TABLE alojamiento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    capacidad INT,
    categoria VARCHAR(50),
    id_parque INT,
    FOREIGN KEY (id_parque) REFERENCES parque(id)
);

DROP TABLE IF EXISTS visitante;
CREATE TABLE visitante (
    cedula VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(100),
    profesion VARCHAR(50),
    id_alojamiento INT,
    FOREIGN KEY (id_alojamiento) REFERENCES alojamiento(id)
);
