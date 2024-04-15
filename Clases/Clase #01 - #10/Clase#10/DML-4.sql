# JOINS
# Se trata de obtener una tabla de resultados en base a las coincidencias entre 2 tablas
# Como "relacion" entre ambas tablas se usan las FK y PK relacionadas

# Listar legajo, nombre, escuela y localidad para TODOS los alumnos

# LEFT JOIN
select a.legajo, a.nombre, e.nombre as escuela, e.localidad
    from alumnos a left join escuelas e
    on a.id_escuela = e.id;

# RIGHT JOIN
select a.legajo, a.nombre, e.nombre as escuela, e.localidad
    from alumnos a right join escuelas e
    on a.id_escuela = e.id;

# INNER JOIN
select a.legajo, a.nombre, e.nombre as escuela, e.localidad
    from alumnos a inner join escuelas e
    on a.id_escuela = e.id;

# FULL JOIN
select a.legajo, a.nombre, a.nota, a.grado,a.email, e.nombre as escuela, e.localidad, e.provincia, e.capacidad
    from alumnos a left join escuelas e
    on a.id_escuela = e.id

union

select a.legajo, a.nombre, a.nota, a.grado,a.email, e.nombre as escuela, e.localidad, e.provincia, e.capacidad
    from alumnos a right join escuelas e
    on a.id_escuela = e.id;

