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