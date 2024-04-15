# Funciones totalizadoras

# Conteo COUNT()
# Cuantos alumnos tienen nota = 8
select count(*) as Ochos from alumnos
    where nota = 8;

# Cuantas notas validas hay en la tabla alumnos
select count(nota) as Notas from alumnos;

# Promedio AVG()
# Cual es el promedio general de notas
select avg(nota) as Promedio from alumnos;

# Suma SUM()
# Cuanta capacidad total tienen las escuelas de la BBDD
select sum(capacidad) as Vacantes from escuelas;

# Ordenamiento de resultados con ORDER BY [ASC | DESC]
# Lista de alumnos ordenada x nombre
select id,nombre from alumnos
    order by nombre asc;

select id,nombre from alumnos
    order by nombre desc;

# Limitar la cantidad de resultados (LIMIT)
#22) Lista de las 3 escuelas con mas capacidad
select nombre, capacidad from escuelas
    order by capacidad desc
    limit 3;

# Agrupamientos GROUP BY (van de la mano de funciones de totalizacion)
# Listar las capacidades x provincia
select provincia as Provincia, sum(capacidad) as Vacantes from escuelas
    group by provincia
    order by Vacantes;

# Uso de HAVING (filtra por campos calculados donde WHERE no funciona)
# Listar las capacidades x provincia que superen los 100 alumnos
select provincia as Provincia, sum(capacidad) as Vacantes from escuelas
    group by provincia
    having Vacantes > 100;
