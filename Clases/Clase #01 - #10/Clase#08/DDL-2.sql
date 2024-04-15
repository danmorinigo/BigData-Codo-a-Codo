
# Tables
# ======

# Ver las tablas de la BD
show tables;

# Crear una tabla
create table jugador(
    # nombre_campo tipo_dato restriciones
    id int auto_increment,
    nic varchar(20) not null,
    puntos int default 0,
    primary key (id)
);

# Ver la estructura de una tabla
describe jugador;

# Eliminar una tabla
drop table if exists jugador;

/*
Tipos de datos en MySQL
---------------------------
	https://www.w3schools.com/mysql/mysql_datatypes.asp
	int
	varchar()
	float
	date
	time
	datetime
	year
	boolean
*/

/* Restriciones (CONTRAINTS)
----------------------------
	Definen el comportamiento del campo
	https://www.w3schools.com/mysql/mysql_constraints.asp
	null
	not null
	unique
	default
	primary key
	foreign key
*/

create table if not exists jugada (
    id int auto_increment,
    nombre varchar(20) not null,
    id_jugador int,
    primary key (id),
    foreign key (id_jugador) references jugador(id)
);

describe juego;
