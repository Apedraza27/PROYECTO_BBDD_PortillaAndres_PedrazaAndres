USE LosAmbientales;

-- FUNCIONES

-- funcion sueldos totales y sueldo de cada uno de personal parque 
DELIMITER //
drop function if exists obtener_sueldos_personal_parque;
CREATE FUNCTION obtener_sueldos_personal_parque()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT;
    DECLARE sueldos TEXT;
    
    SELECT GROUP_CONCAT(CONCAT('Cedula: ',cedula ,' ','sueldo: ', sueldo) SEPARATOR '\n') INTO sueldos
    FROM personal_parque;
    
    SELECT CONCAT('Sueldos del Personal Parque:\n', sueldos, '\nSuma Total de Sueldos: ', SUM(sueldo))
    INTO resultado
    FROM personal_parque;
    
    RETURN resultado;
END //

DELIMITER ;
-- fin funcion sueldos totales y sueldo de cada uno de personal parque
-- funcion personal gestion

DELIMITER //
drop function if exists obtener_sueldos_personal_gestion;
CREATE FUNCTION obtener_sueldos_personal_gestion()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT;
    DECLARE detalle_sueldos TEXT;
    
    SELECT GROUP_CONCAT(CONCAT('Id: ', num_identificacion_de_entrada, ' ','sueldo: ', pp.sueldo) SEPARATOR '\n')
    INTO detalle_sueldos
    FROM personal_de_gestion pg
    JOIN personal_parque pp ON pg.personal_parque_id = pp.id;
    
    SELECT CONCAT('Sueldos del Personal de Gestión:\n', detalle_sueldos, '\nSuma Total de Sueldos: ', SUM(pp.sueldo))
    INTO resultado
    FROM personal_de_gestion pg
    JOIN personal_parque pp ON pg.personal_parque_id = pp.id;
    
    RETURN resultado;
END //

DELIMITER ;
-- fin funcion personal gestion
-- sueldo personal investigacion
DELIMITER //
drop function if exists obtener_sueldos_personal_investigacion;
CREATE FUNCTION obtener_sueldos_personal_investigacion()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT;
    DECLARE detalle_sueldos TEXT;
    
    SELECT GROUP_CONCAT(CONCAT('id:', personal_parque_id ,'  sueldo: ',pp.sueldo) SEPARATOR '\n')
    INTO detalle_sueldos
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;
    
    SELECT CONCAT('Sueldos del Personal de Investigación:\n', detalle_sueldos, '\nSuma Total de Sueldos: ', SUM(pp.sueldo))
    INTO resultado
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;
    
    RETURN resultado;
END //

DELIMITER ;
-- fin funcion personal investigacion
-- sueldo personal investigacion
DELIMITER //
drop function if exists obtener_sueldos_personal_investigacion;
CREATE FUNCTION obtener_sueldos_personal_investigacion()
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE resultado TEXT;
    DECLARE detalle_sueldos TEXT;
    
    SELECT GROUP_CONCAT(CONCAT('id:', personal_parque_id ,'  sueldo: ',pp.sueldo) SEPARATOR '\n')
    INTO detalle_sueldos
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;
    
    SELECT CONCAT('Sueldos del Personal de Investigación:\n', detalle_sueldos, '\nSuma Total de Sueldos: ', SUM(pp.sueldo))
    INTO resultado
    FROM personal_investigador pi
    JOIN personal_parque pp ON pi.personal_parque_id = pp.id;
    
    RETURN resultado;
END //

DELIMITER ;
-- fin funcion personal investigacion
-- sueldo personal  conservacion

DELIMITER //
drop function if exists obtener_sueldos_personal_conservacion;
CREATE FUNCTION obtener_sueldos_personal_conservacion()
RETURNS TEXT
deterministic 
BEGIN
    DECLARE resultado TEXT;
    DECLARE detalle_sueldos TEXT;
    
    SELECT GROUP_CONCAT(CONCAT('id:', personal_parque_id ,'  sueldo: ', pp.sueldo) SEPARATOR '\n')
    INTO detalle_sueldos
    FROM personal_de_conservacion pc
    JOIN personal_parque pp ON pc.personal_parque_id = pp.id;
    
    SELECT CONCAT('Sueldos del Personal de Conservación:\n', detalle_sueldos, '\nSuma Total de Sueldos: ', SUM(pp.sueldo))
    INTO resultado
    FROM personal_de_conservacion pc
    JOIN personal_parque pp ON pc.personal_parque_id = pp.id;
    
    RETURN resultado;
END //

DELIMITER ;
-- fin funcion personal conservacion
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
-- fin funcion costo total
SELECT obtener_sueldos_personal_parque();
SELECT obtener_sueldos_personal_gestion();
SELECT obtener_sueldos_personal_vigilancia();
SELECT obtener_sueldos_personal_investigacion();
SELECT obtener_sueldos_personal_conservacion();
SELECT calcular_costo_total();