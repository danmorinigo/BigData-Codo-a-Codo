/*
DML
---
	Data Manipulation Language - Lenguaje de Manipulacion de Datos
	Permite gestionar los datos de las tablas de una BBDD
	Las operaciones basicas de DML son:
		Insercion (insert into)
		Lectura (select)
		Modificacion (update)
		Borrado (delete from)
	La sigla CRUD representa estas 4 operaciones:
		create - read - update - delete
*/

# Insertar un registro
insert into jugador
    values (16, 'cacho', 1780);

# Insertar mas de un registro a la vez
insert into jugador
    values (18, 'lucho', 678), (17, 'carina', 954);

# Insertar campos parciales
insert into jugador (puntos, nic)
    values (1500, 'holis'), (5436, 'max');

# Modificar los valores de uno o mas registros
update jugador
	set puntos = 876
	where nic like 'lucho';

update jugador
	set puntos = 876
	where id = 18;

update jugador
    set puntos = 11, nic = 'estrella'
    where nic like 'max';

# Eliminar registros
delete from jugador
	where id = 24;

# Limpiar una tabla
truncate jugada;

# Insertamos para comprobar el reseteo del auto_increment
insert into jugada  (jugada, puntaje, id_jugador) values ('contra', 78, 16);
