/* A) Para reducir la deserción en el nivel 1A, se solicita una lista con nombres y apellidos para contactar
vía mail a los alumnos que no se han presentado al examen final. */

select a.nombre, a.apellido, a.email
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final is null and
        n.nivel like '1A';


/* B) Se envían a imprimir los diplomas de los alumnos que aprobaron el último nivel. En el diploma
figuran el nombre, apellido y la nota final del alumno. Generar la lista para la impresión. */

select a.nombre, a.apellido, a.nota_final
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final >= 6 and
        n.nivel like '4';


/* C) ¿Cuántos alumnos aprobaron el examen final? */

select count(*) Aprobados
    from alumnos
    where nota_final >= 6;


/* D) Obtener la cantidad de alumnos inscriptos y la cantidad de aprobados, desaprobados y
ausentes por nivel. */

select n.nivel, count(*) Inscriptos
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    group by n.nivel;
    
select n.nivel, count(*) Aprobados
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final >= 6
    group by n.nivel;

select n.nivel, count(*) Desaprobados
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final < 6
    group by n.nivel;

select n.nivel, count(*) Ausentes
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final is null
    group by n.nivel;


/* E) El alumno Humberto Pilsbury requiere revisión de su examen final y debemos contactar por email a
su instructor. Obtener su nombre, apellido y email. */

select i.nombre, i.apellido, i.email, a.nota_final
    from alumnos a inner join instructores i
        on a.instructor_id = i.instructor_id
    where a.nombre like 'Humberto' and a.apellido like 'Pilsbury';

/* Verificacion */
select nombre, apellido
    from alumnos
    where nombre like '%Hu%';

select nombre, apellido
    from alumnos
    where apellido like '%pi%';


/* F) El instructor designado para tomar examen final a los alumnos de último nivel que tienen apellidos
que comienzan con M,N,O y P, solicita una lista de los alumnos a examinar, ordenada
alfabéticamente. */

select a.apellido, a.nombre
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final is null and
        n.nivel like '4' and
        (a.apellido like 'm%' or a.apellido like 'n%' or a.apellido like 'o%' or a.apellido like 'p%')
    order by a.apellido;
    
select a.apellido, a.nombre
    from alumnos a inner join nivel n
        on a.nivel_id = n.nivel_id
    where a.nota_final is null and
        n.nivel like '4' and
        a.apellido between 'M' and 'Q'
    order by a.apellido;


/* G) El instructor que obtuvo mayor cantidad de alumnos con puntaje > 9 en el examen final recibirá un
premio en la entrega de diplomas. ¿Quién es el instructor y cuántos alumnos distinguidos tuvo en
sus clases? */

select i.apellido, i.nombre, count(*) Excelentes
    from alumnos a inner join instructores i
        on a.instructor_id = i.instructor_id
    where a.nota_final > 9
    group by i.apellido
    order by Excelentes desc
    limit 1;

select i.apellido, i.nombre, count(*) Excelentes
    from alumnos a inner join instructores i
        on a.instructor_id = i.instructor_id
    where a.nota_final > 9
    group by i.apellido
    order by Excelentes desc
    limit 5;
