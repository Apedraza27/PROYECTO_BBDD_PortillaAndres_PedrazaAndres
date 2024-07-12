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

-- copias de seguridad

--  Diaria
DROP EVENT IF EXISTS daily_backup;
DELIMITER //
CREATE EVENT daily_backup
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    DECLARE backup_cmd VARCHAR(255);
    SET backup_cmd = CONCAT('mysqldump -u administrador -padministrador LosAmbientales > /path/to/backup/daily_backup_', DATE_FORMAT(NOW(), '%Y_%m_%d'), '.sql');
    CALL sys_exec(backup_cmd);
END //
DELIMITER ;

--  Semanal
DROP EVENT IF EXISTS weekly_backup;
DELIMITER //
CREATE EVENT weekly_backup
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP + INTERVAL 1 WEEK
DO
BEGIN
    DECLARE backup_cmd VARCHAR(255);
    SET backup_cmd = CONCAT('mysqldump -u administrador -padministrador LosAmbientales > /path/to/backup/weekly_backup_', DATE_FORMAT(NOW(), '%Y_%m_%d'), '.sql');
    CALL sys_exec(backup_cmd);
END //
DELIMITER ;

--  Mensual
DROP EVENT IF EXISTS monthly_backup;
DELIMITER //
CREATE EVENT monthly_backup
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP + INTERVAL 1 MONTH
DO
BEGIN
    DECLARE backup_cmd VARCHAR(255);
    SET backup_cmd = CONCAT('mysqldump -u administrador -padministrador LosAmbientales > /path/to/backup/monthly_backup_', DATE_FORMAT(NOW(), '%Y_%m'), '.sql');
    CALL sys_exec(backup_cmd);
END //
DELIMITER ;
