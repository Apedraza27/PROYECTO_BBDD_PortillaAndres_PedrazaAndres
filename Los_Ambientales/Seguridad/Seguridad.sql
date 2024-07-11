-- PERMISOS

-- Creación de usuarios
create user 'administrador'@'%' identified by 'administrador';
create user 'responsable_parques'@'%' identified by 'responsable_parques';
create user 'responsable_personal'@'%' identified by 'responsable_personal';
create user 'administrador_alojamiento'@'%' identified by 'administrador_alojamiento';
create user 'personal_de_gestion'@'%' identified by 'personal_de_gestion';
create user 'personal_investigador'@'%' identified by 'personal_investigador';
create user 'personal_de_vigilancia'@'%' identified by 'personal_de_vigilancia';

-- Asignación de permisos administrador
GRANT ALL ON *.* TO 'administrador'@'%';
REVOKE DROP ON Proyecto_BBDD_PortillaAndres_PedrazaAndres.* FROM 'administrador'@'localhost';

-- Asignación de permisos administrador responsable parques
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_parque TO 'responsable_parques'@'%';
GRANT EXECUTE ON FUNCTION calcular_costo_total TO 'responsable_parques'@'%';
GRANT EXECUTE ON PROCEDURE registrar_entrada TO 'responsable_parques'@'%';
GRANT EXECUTE ON PROCEDURE gestionar_alojamiento TO 'responsable_parques'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON parque.* TO 'responsable_parques'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_parque.* TO 'responsable_parques'@'%';
GRANT SELECT ON alojamiento.* TO 'responsable_parques'@'%';
GRANT SELECT ON proyectos_de_investigacion.* TO 'responsable_parques'@'%';


-- Asignación de permisos administrador responsable personal
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_parque TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_gestion TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_investigacion TO 'responsable_personal'@'%';
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_conservacion TO 'responsable_personal'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON personal_parque.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_gestion.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_investigador.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_vigilancia.* TO 'responsable_personal'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON personal_de_conservacion.* TO 'responsable_personal'@'%';


-- Asignación de permisos administrador administrador alojamiento
GRANT EXECUTE ON PROCEDURE gestionar_alojamiento TO 'administrador_alojamiento'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE ON alojamiento.* TO 'administrador_alojamiento'@'%';

-- Asignación de permisos administrador personal de gestion
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_gestion TO 'personal_de_gestion'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_de_gestion'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_de_gestion.* TO 'personal_de_gestion'@'%';

-- Asignación de permisos administrador personal investigador
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_investigacion TO 'personal_investigador'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_investigador'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_investigador.* TO 'personal_investigador'@'%';

-- Asignación de permisos administrador personal de vigilancia
GRANT EXECUTE ON FUNCTION obtener_sueldos_personal_vigilancia TO 'personal_de_vigilancia'@'%';

GRANT SELECT ON personal_parque.* TO 'personal_de_vigilancia'@'%';
GRANT SELECT, INSERT, UPDATE ON personal_de_vigilancia.* TO 'personal_de_vigilancia'@'%';

-- Revisar permisos de x usuario
show grants for 'administrador'@'%';
show grants for 'responsable_parques'@'%';
show grants for 'responsable_personal'@'%';
show grants for 'administrador_alojamiento'@'%';
show grants for 'personal_de_gestion'@'%';
show grants for 'personal_investigador'@'%';
show grants for 'personal_de_vigilancia'@'%';