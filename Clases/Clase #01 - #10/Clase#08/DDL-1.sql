# SQL = DDL (Data Definition Language) + DML (Data Manipulation Language)

# Databases
# =========

# Ver BD disponibles en el servidor
show databases;

# Seleccionar una BD
use c24012;

# Ver juegos de caracteres disponibles
show character set;

# Ver collations disponibles
show collation where charset like 'utf8';

# Crear una BD
create database if not exists c24012
    character set utf8
    collate utf8_spanish_ci;

# Eliminar una BD
drop database if exists c24012;

#Ver la config de caracteres e idioma
select @@character_set_database, @@collation_database;
