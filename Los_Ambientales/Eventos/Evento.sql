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