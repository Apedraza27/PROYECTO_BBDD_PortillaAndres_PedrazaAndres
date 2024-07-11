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