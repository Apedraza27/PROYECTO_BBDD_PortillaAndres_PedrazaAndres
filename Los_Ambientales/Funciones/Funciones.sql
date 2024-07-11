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