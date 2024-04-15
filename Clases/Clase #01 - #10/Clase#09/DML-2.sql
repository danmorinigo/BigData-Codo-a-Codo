
# Obtener datos en forma de tabla
# -------------------------------
# select <lo que quiero mostrar> from <tabla> where <condiciones> <modificadores>

#1) Seleccionar todos los datos de la tabla alumnos:
select * from alumnos;

#2) Seleccionar solamente el legajo y el nombre de los alumnos:
select legajo, nombre from alumnos;

#3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7)
select * from alumnos
    where nota >= 7;

#4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).
select id, nombre from escuelas
    where capacidad < 200;

#5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 8 y 10
select nombre, nota from alumnos
    where nota >=8 and nota <=10;

#6) Repetir el ejercicio anterior, utilizando BETWEEN
select nombre, nota from alumnos
    where nota BETWEEN 8 and 10;

#7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy
select nombre, localidad, provincia from escuelas
    where provincia like 'Buenos Aires' or provincia like 'Jujuy';

select nombre, localidad, provincia from escuelas
    where provincia in ('Buenos Aires','Jujuy');

select nombre, localidad, provincia from escuelas
    where provincia not in ('Buenos Aires','Jujuy');

# Listar nombres de alumnos que comiencen con 'P'
select nombre from alumnos
    where nombre like 'p%';

# Listar nombres de alumnos que terminen con 'ez'
select nombre from alumnos
    where nombre like '%ez';

# Listar nombres de alumnos que contengan con 'er'
select nombre from alumnos
    where nombre like '%er%';

# Listar todos aquellos alumnos que no tienen nota
select legajo, nombre from alumnos
    where nota is null;

# Consultar por celdas vacias
select nombre, email from alumnos
    where email is null;

# Consultar por celdas con cadenas vacias
select nombre, email from alumnos
    where email like '';

# Consultar por celdas no vacias
select nombre, email from alumnos
    where email is not null;
