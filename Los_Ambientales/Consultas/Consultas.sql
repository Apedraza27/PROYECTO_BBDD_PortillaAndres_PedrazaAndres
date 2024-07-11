-- CONSULTAS
USE LosAmbientales;

-- 1. Numero de inventario de individuos por area
select 
    area2.nombre,
    SUM(especie.num_de_inventario) as total_inventario
from 
    area2
inner join 
    especie on especie.area2_id = area2.id
group by 
    area2.nombre;

-- 2. Las consultas se refieren al número de parques existentes en cada dpto
select 
	departamento.departamentos,
    parque_natural.nombre
from 
	departamento
inner join 
	parque_natural on parque_natural.departamento_id = departamento.id;
    
    
-- 3. La superficie total de cada parque
select 
	nombre,
    superficie_total
from
	parque_natural;
    
-- 4. capacidad limitada de alojamiento, categoria y parque
select 
    parque_natural.nombre as parque_nombre,
    alojamiento.categoria,
    SUM(alojamiento.capacidad) as total_capacidad
from
    parque_natural
inner join 
    alojamiento on alojamiento.parque_natural_id = parque_natural.id
group by 
    parque_natural.nombre, 
    alojamiento.categoria;


-- 5. Consulta para obtener el personal de vigilancia y el vehículo asignado
select 
    personal_de_vigilancia.id as id_vigilancia,
    personal_parque.nombre as nombre_personal,
    vehiculo.marca as marca_vehiculo,
    vehiculo.tipo as tipo_vehiculo
from
    personal_de_vigilancia personal_de_vigilancia
inner join 
    personal_parque personal_parque on personal_de_vigilancia.personal_parque_id = personal_parque.id
inner join 
    vehiculo vehiculo on personal_de_vigilancia.vehiculo_id = vehiculo.id;