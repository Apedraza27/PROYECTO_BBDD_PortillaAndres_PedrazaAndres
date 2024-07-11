USE LosAmbientales;

-- EVENTO

SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS eliminar_datos_visitantes;

-- eliminar los datos de visitantes el 1 de agosto
CREATE EVENT eliminar_datos_visitantes
ON SCHEDULE
    AT '2024-08-01 00:00:00'
DO
    DELETE FROM visitante;