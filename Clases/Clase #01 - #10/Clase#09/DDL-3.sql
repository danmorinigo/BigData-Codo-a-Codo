# Modificar una tabla
# -------------------
# alter table <tabla> <comandos>;

# Agregar un campo
alter table jugada
    add fecha date after jugada;

# Eliminar un campo
alter table jugada
    drop fecha;

# Modificar el tipo de un campo
alter table jugada
    modify fecha datetime;

# Modificar el nombre y tipo de un campo
alter table jugada
    change fecha fecha_hora datetime;

# Modificar varios campos a la vez
alter table jugada
    change fecha_hora fecha date,
    drop id_juego;
    
describe jugada;
