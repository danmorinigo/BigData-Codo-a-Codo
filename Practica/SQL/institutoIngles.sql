DROP DATABASE IF EXISTS institutoIngles;
CREATE DATABASE IF NOT EXISTS institutoIngles
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_spanish2_ci;
USE institutoIngles;
DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos (
    legajo INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    genero_ID INT NOT NULL,
    nota_1parcial FLOAT,
    nota_2parcial FLOAT,
    nota_final FLOAT,
    nivel INT NOT NULL,
    INSTRUCTOR INT NOT NULL,
    PRIMARY KEY(legajo)
    #FOREIGN KEY(genero_ID) REFERENCES genero(id)
);
DROP TABLE IF EXISTS genero;
CREATE TABLE genero (
    ID INT AUTO_INCREMENT,
    genero VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID)
);
DROP TABLE IF EXISTS nivel;
CREATE TABLE nivel (
    ID INT AUTO_INCREMENT,
    nivel VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID)
);
DROP TABLE IF EXISTS instructores;
CREATE TABLE instructores (
    ID INT AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

ALTER TABLE alumnos
    ADD FOREIGN KEY(genero_ID) REFERENCES genero(ID);
/*
ALTER TABLE alumnos
    RENAME COLUMN nivel to nivel_ID;
*/
ALTER TABLE alumnos
    CHANGE nivel_ID nivel_ID INT NOT NULL;
/*
ALTER TABLE alumnos
    RENAME COLUMN INSTRUCTOR to instructor_ID;
*/
ALTER TABLE alumnos
    CHANGE instructor_ID instructor_ID INT NOT NULL;
ALTER TABLE alumnos
    ADD FOREIGN KEY(nivel_ID) REFERENCES nivel(ID),
    ADD FOREIGN KEY(instructor_ID) REFERENCES instructores(ID);
ALTER TABLE nivel
    MODIFY COLUMN nivel VARCHAR(6) NOT NULL;
SHOW TABLES;
describe alumnos;
describe instructores;
describe genero;
describe nivel;
SELECT * FROM alumnos;
SELECT * FROM instructores;
SELECT * FROM genero;
SELECT * FROM nivel;
ALTER TABLE alumnos
    MODIFY COLUMN nota_final VARCHAR(10);

UPDATE alumnos
    SET nota_1parcial = replace(nota_1parcial, ',', '.'),
    nota_2parcial = replace(nota_2parcial, ',', '.'),
    nota_final = replace(nota_final, ',', '.');

ALTER TABLE alumnos
    MODIFY COLUMN nota_1parcial float;
ALTER TABLE alumnos
    MODIFY COLUMN nota_2parcial float;
ALTER TABLE alumnos
    MODIFY COLUMN nota_final float;
    
    MODIFY COLUMN 
        nota_1parcial float;
        nota_2parcial float,
        nota_final float;


/*
A) Para reducir la deserción en el nivel 1A, se solicita una lista con nombres y apellidos para contactar
vía mail a los alumnos que no se han presentado al examen final.
*/
SELECT a.nombre, a.apellido, a.email #, n.nivel, a.nota_final
    FROM alumnos a
    INNER JOIN nivel n    
    ON a.nivel_ID = n.ID
    WHERE n.nivel like '1A'
        AND a.nota_final is null;
/*
B) Se envían a imprimir los diplomas de los alumnos que aprobaron el último nivel. En el diploma
figuran el nombre, apellido y la nota final del alumno. Generar la lista para la impresión.
*/
SELECT a.nombre, a.apellido, a.nota_final
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE n.nivel LIKE '4'
        AND a.nota_final >= 6;
/*
C) ¿Cuántos alumnos aprobaron el examen final?
*/
SELECT n.nivel as Nivel, COUNT(*) as Aprobados
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE a.nota_final >= 6
    GROUP BY Nivel
    ORDER BY Nivel;
/*
D) Obtener la cantidad de alumnos inscriptos y la cantidad de aprobados, desaprobados y
ausentes por nivel.
*/
SELECT n.nivel as Nivel, COUNT(*) as Inscriptos_por_Nivel
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    #WHERE a.nota_final >= 6
    GROUP BY Nivel
    ORDER BY Nivel;
SELECT n.nivel as Nivel, COUNT(*) as Aprobados_por_Nivel
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE a.nota_final >= 6
    GROUP BY Nivel
    ORDER BY Nivel;
SELECT n.nivel as Nivel, COUNT(*) as Desaprobados_por_Nivel
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE a.nota_final < 6
    GROUP BY Nivel
    ORDER BY Nivel;
SELECT n.nivel as Nivel, COUNT(*) as Ausentes_por_Nivel
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE a.nota_final is NULL
    GROUP BY Nivel
    ORDER BY Nivel;

/*
E) El alumno Humberto Pilsbury requiere revisión de su examen final y debemos contactar por email a
su instructor. Obtener su nombre, apellido y email.
*/
SELECT nombre
    FROM alumnos
    WHERE nombre LIKE '%hu%'
/*
F) El instructor designado para tomar examen final a los alumnos de último nivel que tienen apellidos
que comienzan con M,N,O y P, solicita una lista de los alumnos a examinar, ordenada
alfabéticamente.
*/
SELECT a.apellido, a.nombre
    FROM alumnos a
    INNER JOIN nivel n
    ON a.nivel_ID = n.ID
    WHERE n.nivel LIKE '4'
        AND SUBSTRING(a.apellido, 1, 1) BETWEEN 'M' AND 'P'
        AND a.nota_final IS NULL
    ORDER BY apellido;
/*
G) El instructor que obtuvo mayor cantidad de alumnos con puntaje > 9 en el examen final recibirá un
premio en la entrega de diplomas. ¿Quién es el instructor y cuántos alumnos distinguidos tuvo en
sus clases?
*/
SELECT i.nombre as Instructor, COUNT(*) as AlumnosExcelentes, ROUND(AVG(nota_final), 2) AS PromedioNotas
    FROM instructores i
    INNER JOIN alumnos a
    ON i.ID = a.instructor_ID
        INNER JOIN nivel n
        ON a.nivel_ID = n.ID
    WHERE n.nivel LIKE '4'
        AND a.nota_final > 9
    GROUP BY Instructor
    ORDER BY AlumnosExcelentes DESC, PromedioNotas DESC;

SELECT i.nombre as Instructor, count(*) as Excelentes
    FROM alumnos a
    INNER JOIN instructores i
    ON a.instructor_ID = i.ID
    WHERE 
    GROUP BY Instructor;

