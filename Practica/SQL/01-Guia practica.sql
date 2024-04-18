
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

# Actividad
describe country;
SELECT Code AS Codigo,
    Name AS Nombre,
    Continent AS Continente,
    Population AS Población
    FROM country;
describe countrylanguage;
SELECT Language AS Nombre
    FROM countrylanguage
    ORDER BY Language;
SELECT DISTINCT Language
    FROM countrylanguage;
SELECT count(*) 
    FROM (SELECT DISTINCT Language
    FROM countrylanguage) as l;
DESCRIBE city;
SELECT Name as Nombre, Population as Población
    FROM city;
SELECT COUNT(*) FROM (SELECT Name as Nombre, Population as Población
    FROM city) AS l;
SELECT Name as Nombre,
    GNP as "assnq",
    GNPOld as "Producto_Bruto_Nacional_anterior",
    GNP - GNPOld as diferencia
    FROM country;
SELECT COUNT(*) FROM (SELECT Name as Nombre,
    GNP as "ProductoBrutoNacional",
    GNPOld as "ProductoBrutoNacionalAnterior",
    GNP - GNPOld as diferencia
    FROM country) AS l;
SELECT * FROM country
    ORDER BY Population DESC;

SELECT Language as Nombre 
    FROM countrylanguage
    ORDER BY Language;

# 08
SELECT Name as Nombre, Population as Población
    FROM city
    ORDER BY Population
    LIMIT 20;

# 09
# Codigo, nombre, año independencia de todos los
# paises, ordenados por antiguedad descendiente.
describe country;
SELECT Code as Código, Name as Nombre, IndepYear as 'Año_Independencia'
    FROM country
    ORDER BY IndepYear DESC;
# 10
/*
Listar nombre y continente de los cien países con mayor expectativa de vida. Si
hubiera países que tengan la misma expectativa de vida, mostrar primero a los
de menor superficie. (Se esperan 2 columnas y 100 registros)
*/
SELECT Name as Nombre, Continent as Continente, SurfaceArea as Superficie, LifeExpectancy as ExpectativaVida
    FROM country
    ORDER BY LifeExpectancy DESC, SurfaceArea DESC
    LIMIT 100;
/*
11.Listar todos los datos de los países que no cuenten con habitantes. (Se esperan
15 columnas y 7 registros).
*/
SELECT * FROM country
    WHERE Population = 0;
/*
12.Listar todos los datos de los países cuya expectativa de vida supere los setenta y
cinco años, ordenados bajo este concepto de forma ascendente. (Se esperan 15
columnas y 62 registros).
*/
SELECT * FROM country  
    WHERE LifeExpectancy > 75
    ORDER BY LifeExpectancy;
SELECT COUNT(*)
    FROM(SELECT * FROM country  
    WHERE LifeExpectancy > 75
    ORDER BY LifeExpectancy) AS l;

/*
13.Listar todos los datos de los países cuya independencia haya ocurrido a partir de
la segunda mitad del siglo XIX y su forma de gobierno sea una monarquía
constitucional. (Se esperan 15 columnas y 20 registros).
*/
SELECT GovernmentForm from country;
SELECT * FROM country
    WHERE IndepYear >= 1850 AND GovernmentForm LIKE "Constitutional Monarchy"
    ORDER BY IndepYear;
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE IndepYear >= 1850 AND GovernmentForm LIKE "Constitutional Monarchy"
    ORDER BY IndepYear) AS l;
/*
14.Listar todos los datos de los diez países europeos de mayor PBN. (Se esperan 15
columnas y 10 registros).
*/   
SELECT DISTINCT Continent FROM country;
SELECT * FROM country
    WHERE Continent LIKE "Europe"
    ORDER BY GNP DESC
    LIMIT 10;
/*
15. Listar todos los datos de los países cuyo nombre registrado coincida con su
nombre local. (Se esperan 15 columnas y 104 registros).
*/
SELECT * FROM country
    WHERE Name LIKE LocalName;
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE Name LIKE LocalName) AS L;
/*
16. Listar todos los datos de los países cuya independencia se haya dado a partir de
la segunda mitad del siglo XX. (Se esperan 15 columnas y 110 registros).
*/
SELECT * FROM country
    WHERE IndepYear >= 1950
    ORDER BY IndepYear;
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE IndepYear >= 1950
    ORDER BY IndepYear) AS L;
/*
17. Listar todos los datos de los países situados en Europa, Asia o Sudamérica. (Se
esperan 15 columnas y 111 registros).
*/
SELECT * FROM country
    WHERE Continent Like "Europe"
        OR Continent Like "Asia"
        OR Continent Like "South America";
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE Continent Like "Europe"
        OR Continent Like "Asia"
        OR Continent Like "South America") AS L;
/*
18. Listar todos los datos de todos los países, excepto los africanos. (Se esperan 15
columnas y 181 registros).
*/
SELECT * FROM country
    WHERE Continent NOT LIKE "Africa";
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE Continent NOT LIKE "Africa") AS L;
/*
19. Listar todos los datos de las ciudades argentinas fuera de la provincia de Buenos
Aires. (Se esperan 5 columnas y 26 registros).
*/
SELECT c.ID, c.Name, c.CountryCode, c.District, c.Population
    FROM city c INNER JOIN country p
    ON c.CountryCode = p.Code
    WHERE c.CountryCode LIKE 'ARG' AND c.District NOT LIKE 'Buenos Aires';

SELECT c.ID, c.Name, c.CountryCode, c.District, c.Population
    FROM city c, country p
    WHERE c.CountryCode = p.Code
        AND c.CountryCode LIKE 'ARG'
        AND c.District NOT LIKE 'Buenos Aires';
SELECT COUNT(*)
    FROM(SELECT c.ID, c.Name, c.CountryCode, c.District, c.Population
    FROM city c INNER JOIN country p
    ON c.CountryCode = p.Code
    WHERE c.CountryCode LIKE 'ARG' AND c.District NOT LIKE 'Buenos Aires') AS L;
/*
20. Listar todos los datos de las ciudades de entre 125 mil y 130 mil habitantes. (Se
esperan 5 columnas y 138 registros).
*/
SELECT * FROM city
    WHERE Population BETWEEN 125000 AND 130000;
SELECT COUNT(*)
    FROM(SELECT * FROM city
    WHERE Population BETWEEN 125000 AND 130000) AS L;
/*
21. Listar todos los datos de los países donde no se cuente con datos acerca de su
independencia. (Se esperan 15 columnas y 47 registros).
*/
SELECT * FROM country
    WHERE IndepYear is null;
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE IndepYear is null) AS L;
/*
22. Listar todos los datos de los países donde no se tengan datos acerca del PBN
anterior ni de la expectativa de vida. (Se esperan 15 columnas y 17 registros).
*/
SELECT * FROM country
    WHERE GNPOld is null
        AND LifeExpectancy is null;
SELECT COUNT(*)        
    FROM(SELECT * FROM country
    WHERE GNPOld is null
        AND LifeExpectancy is null) AS L;
/*
23. Listar todos los datos de los países cuyo nombre comience y termine con 'A'.
(Se esperan 15 columnas y 13 registros).
*/
SELECT * FROM country
    WHERE Name LIKE "a%"
        AND Name LIKE "%a";
SELECT COUNT(*)
    FROM(SELECT * FROM country
    WHERE Name LIKE "a%"
        AND Name LIKE "%a") AS L;
/*
24. Listar todos los datos de los países cuyo nombre sea compuesto (más de una
palabra). (Se esperan 15 columnas y 66 registros).
*/
SELECT * FROM country
    WHERE Name LIKE "% %";
SELECT  COUNT(*)
    FROM(SELECT * FROM country
    WHERE Name LIKE "% %") AS L;
/*
25. Listar todos los datos de las ciudades cuyo nombre o distrito contengan un '-'
(guión medio). (Se esperan 5 columnas y 372 registros).
*/
SELECT * FROM city
    WHERE Name LIKE "%-%"
        OR District LIKE "%-%";
SELECT COUNT(*)
    FROM(SELECT * FROM city
    WHERE Name LIKE "%-%"
        OR District LIKE "%-%") AS L;
/*
26.Listar los nombres de los países sudamericanos junto a los nombres (alias
'Capital') de sus capitales. (Se esperan 2 columnas y 14 registros).
*/
SELECT p.Name as País, c.Name as Capital
    FROM country p
    INNER JOIN city c
    on p.capital = c.ID
    WHERE p.Continent LIKE 'South America';

/*
27.Listar el código de país, junto a los nombres de las ciudades y su cantidad de
habitantes, de aquellos cuya expectativa de vida sea mayor a 80. (Se esperan 3
columnas y 253 registros).
*/
SELECT p.Code, c.Name, c.Population, p.LifeExpectancy
    FROM country p
    INNER JOIN city c
    ON c.CountryCode = p.Code
    WHERE p.LifeExpectancy > 80
    ORDER BY p.Code, c.Name;
SELECT COUNT(*)
    FROM(SELECT p.Code, c.Name, c.Population
    FROM country p
    INNER JOIN city c
    ON c.CountryCode = p.Code
    WHERE p.LifeExpectancy > 80) AS K;
/*
28.Listar las capitales de los países cuya forma de gobierno sea una República
Federal. (Se esperan 2 columnas y 15 registros).
*/
SELECT c.name as Capital, c.ID as 'id_city', p.Capital as 'id_capital', p.Name as País
    FROM country p
    INNER JOIN city c
    ON p.capital = c.ID
    WHERE p.GovernmentForm LIKE "Federal Republic";
/*
29.Listar los lenguajes oficiales, junto al nombre de sus respectivos países, donde la
cantidad de habitantes de dicho país esté entre un millón y tres millones. (Se
esperan 2 columnas y 14 registros).
*/
SELECT l.Language, l.IsOfficial, p.Name
    FROM countrylanguage l
    INNER JOIN country p
    ON l.CountryCode = p.Code
    WHERE l.IsOfficial LIKE "T"
        AND p.Population BETWEEN 1000000 AND 3000000;
/*
30.Listar los códigos, los nombres locales y la región a la que pertenecen aquellos
países donde se hable español. (Se esperan 3 columnas y 28 registros).
*/
SELECT p.Code, p.LocalName, p.Region 
    FROM countrylanguage l
    INNER JOIN country p
    ON l.CountryCode = p.Code
    WHERE l.Language LIKE "spanish";
/*
31.Listar los nombres y las capitales de los países en cuya capital se concentre más
de la mitad de su población total. (Se esperan 2 columnas y 14 registros).
*/
SELECT c.name as Capital, p.name as País, c.Population as PoblacionCapital, p.Population as EnElPais
    FROM city c
    INNER JOIN country p
    on c.ID = p.Capital
    WHERE c.Population > (p.Population / 2.0);

/*
32.Listar los nombres y la superficie de los países africanos cuya capital coincida
con el nombre del distrito a la que pertenece. (Se esperan 2 columnas y 32
registros).
*/
SELECT p.name, p.SurfaceArea
    FROM country p
    INNER JOIN city c
    ON p.capital = c.ID
    WHERE p.Continent LIKE 'Africa'
        AND c.name LIKE c.District;
/*
33.Listar los nombres, las capitales y el año de independencia (sin nulos) de los 20
países más antiguos. (Se esperan 3 columnas y 20 registros).
*/
SELECT p.name as 'Pais', c.name as 'Capital', p.IndepYear as 'Año_Independencia'
    FROM country p
    INNER JOIN city c
    ON p.Capital = c.ID
    WHERE p.IndepYear IS NOT null
    ORDER BY p.IndepYear
    LIMIT 20;
/*
34.Listar las ciudades junto a sus idiomas oficiales, donde no se hable español,
inglés, portugués, italiano, francés o alemán de manera oficial. (Se esperan 2
columnas y 2694 registros).
*/
SELECT c.name as Ciudad, p.name as País, l.Language as 'Idioma', l.IsOfficial as 'El_Oficial'
    FROM country p
    INNER JOIN city c
    ON p.capital = c.ID
        INNER JOIN countrylanguage l
        on p.Code = l.CountryCode
            WHERE l.IsOfficial LIKE "T"
                AND l.Language NOT IN ('Spanish', 'English', 'Portuguese', 'Italian', 'French', 'German')
    ORDER BY c.name;
    # NO ME DA LA CANTIDAD DE REGISTROS QUE DICE EN EL ENUNCIADO..
/*
35.Listar nombre, población y país de las diez ciudades europeas de habla inglesa
más pobladas. (Se esperan 3 columnas y 10 registros).
*/
SELECT c.name as 'Ciudad', c.Population as 'Poblacion_Ciudad', p.name as 'País', l.Language as 'Lengua', L.IsOfficial as 'Lengua_Oficial'
    FROM city c
    INNER JOIN country p
    ON c.CountryCode = p.Code
        INNER JOIN countrylanguage l
        ON p.Code = l.CountryCode
    WHERE p.Continent LIKE 'Europe'
        AND l.Language LIKE 'English'
    ORDER BY Poblacion_Ciudad DESC
    LIMIT 10;
/*
36.Mostrar según la tabla de países, la cantidad total de población, la población
máxima, la población mínima, el promedio de población y con cuántos registros
de población se cuenta. (Se esperan 5 columnas y 1 registro).
*/
SELECT SUM(Population), MAX(Population), MIN(Population), AVG(Population), COUNT(*)
    FROM country;
/*
37.Mostrar según la tabla de países, la cantidad total de población, la población
máxima, la población mínima y el promedio de población, por cada continente.
(Se esperan 5 columnas y 7 registros).
*/
SELECT Continent, SUM(Population), MAX(Population), MIN(Population), AVG(Population), COUNT(*)
    FROM country
    GROUP BY Continent;
/*
38.Agrupar a todos los países según el continente al que pertenecen. Mostrar los
continentes junto a la cantidad de naciones que pertenecen a cada uno. (Se
esperan 2 columnas y 7 registros).
*/
SELECT Continent, count(name) AS paises
    FROM country
    GROUP BY Continent
    ORDER BY paises DESC;
/*
39.Agrupar a todas las ciudades según el país al que pertenecen. Mostrar los
códigos de países junto a la sumatoria total de habitantes de cada uno. (Se
esperan 2 columnas y 232 registros).
*/
SELECT c.CountryCode as 'Codigo_Pais', SUM(Population) as Poblacion, COUNT(*) as Ciudades
    FROM city c
    GROUP BY c.CountryCode;
/*
40.Agrupar a todos los lenguajes según su nombre. Mostrar los nombres de los
lenguajes junto al porcentaje de habla mínimo registrado para cada uno. (Se
esperan 2 columnas y 457 registros).
*/
SELECT Language as Lenguaje, MIN(percentage) as MinimoPOrcentaje
    FROM countrylanguage
    GROUP BY Language;
/*
41.Mostrar las distintas formas de gobierno posibles de los países europeos junto a
su correspondiente promedio de población que vive bajo estas circunstancias.
(Se esperan 2 columnas y 10 registros).
*/
SELECT GovernmentForm as FormaGobierno, AVG(Population) as PromedioPoblacion
    FROM country
    WHERE Continent LIKE 'Europe'
    GROUP BY GovernmentForm
    ORDER BY PromedioPoblacion DESC;
/*
42.Mostrar las diez regiones de mayor expectativa de vida promedio. (Se esperan 2
columnas y 10 registros).
*/
SELECT Region as Region, AVG(LifeExpectancy) as ExpectativaVida
    FROM country
    GROUP BY Region
    ORDER BY ExpectativaVida DESC
    LIMIT 10;
/*
43.Mostrar los nombres de los diez distritos de mayor cantidad de ciudades con
cantidad de habitantes mayor al medio millón, junto a la cantidad de ciudades.
(Se esperan 3 columnas y 10 registros).
*/
SELECT District as Distrito, COUNT(Name) as Ciudades
    FROM city
    WHERE Population > 500000
    GROUP BY District
    ORDER BY Ciudades DESC
    LIMIT 10;

/*
44.Mostrar los nombres de los países que tengan ciudades en el Caribe, junto al
número de las mismas por país. (Se esperan 2 columnas y 24 registros).
*/
SELECT p.Name as Pais, COUNT(c.Name) as Ciudades
    FROM country p
    INNER JOIN city c
    ON p.Code = c.CountryCode
    WHERE p.Region LIKE 'Caribbean'
    GROUP BY p.Name;
/*
45.Mostrar los lenguajes existentes junto a la cantidad de países que lo hablan de
manera oficial. (Se esperan 2 columnas y 102 registros).
*/
SELECT l.Language as Lengua, COUNT(p.Name) as Paises
    FROM countrylanguage l
    INNER JOIN country p
    ON l.CountryCode = p.Code
    WHERE l.IsOfficial LIKE 'T'
    GROUP BY l.Language
    ORDER BY Paises DESC;
/*
46. Mostrar listados los años de independencia (sin nulos) junto a la cantidad de
países que la hayan conseguido en ese año. Se desea visualizar aquellos años
donde más de un país se haya independizado. (Se esperan 2 columnas y 39
registros).
*/
SELECT * FROM
    (SELECT IndepYear AS 'Año_Independencia', COUNT(Name) as 'Cant_Paises'
        FROM country
        WHERE IndepYear IS NOT NULL
        GROUP BY IndepYear
        ORDER BY Cant_Paises) as TablaDerivada
    WHERE TablaDerivada.Cant_Paises > 1;
/*
47.Listar los países junto a la cantidad de idiomas diferentes hablados, pero solo
aquellos donde se hablen entre tres y cinco idiomas diferentes. (Se esperan 2
columnas y 80 registros).
*/
SELECT p.Name, LP.Lenguas
    FROM country p
    INNER JOIN
    (SELECT CountryCode AS Codigo_Pais, COUNT(Language) AS Lenguas
        FROM countrylanguage
        GROUP BY CountryCode) AS LP
    ON LP.Codigo_Pais = p.Code
    WHERE Lenguas BETWEEN 3 AND 5
    ORDER BY p.name;
/*
48.Mostrar los distritos, junto al nombre del país al que pertenecen, cuya población
total (también listada) no supere los diez mil habitantes. (Se esperan 3 columnas
y 35 registros).
*/
SELECT dp.Distrito, p.Name AS Pais, dp.Poblacion
    FROM (SELECT District AS Distrito, SUM(Population) as Poblacion
        FROM city
        GROUP BY Distrito) AS dp
    INNER JOIN (SELECT DISTINCT District AS Distrito, CountryCode as Codigo_Pais
                FROM city) AS dcp
    ON dp.Distrito = dcp.Distrito
        INNER JOIN country p
        ON dcp.Codigo_Pais = p.Code
    WHERE dp.Poblacion <= 10000
    ORDER BY dp.Distrito;
SELECT District AS Distrito, COUNT(CountryCode) as Codigo_Pais, COUNT(DISTINCT CountryCode) as Pais
    FROM city
    GROUP BY Distrito
    ORDER BY Pais DESC;

#----- el OK!! ------
SELECT dpp.Distrito AS Distrito, p.name AS Pais, dpp.Poblacion AS Poblacion
    FROM 
    (SELECT District AS Distrito, CountryCode AS Cod_pais, SUM(Population) as Poblacion
    FROM city
    GROUP BY District, CountryCode) AS dpp
    INNER JOIN country as p
    ON dpp.Cod_pais = p.Code
    WHERE Poblacion < 10000
    ORDER BY dpp.Distrito, Poblacion DESC;
#----- el OK!! ------


SELECT CountryCode, District
    FROM city
    GROUP BY CountryCode;

SELECT CountryCode, COUNT(District)
    FROM city
    GROUP BY CountryCode;


SELECT Name as Ciudad, District AS Distrito, CountryCode as Codigo_Pais, Population as Poblacion
    FROM city
    WHERE District LIKE 'England'
    ORDER BY Codigo_Pais DESC;
SELECT District AS Distrito, SUM(Population) as Poblacion
    FROM city
    WHERE District LIKE 'England'
    GROUP BY Distrito;

   #Me dan 26 registros
/*
49.Mostrar las regiones junto a su densidad poblacional promedio, donde ésta
supere a la mitad de la densidad poblacional máxima. (Se esperan 2 columnas y 3
registros).
*/
SELECT r.Region, r.DensPoblacionPromedio
    FROM
    (SELECT Region as Region,
        SUM(Population/SurfaceArea) AS DensPoblacion,
        AVG(Population/SurfaceArea) AS DensPoblacionPromedio,
        (MAX(Population/SurfaceArea) / 2.0) AS MitadDensMaximaPoblacion
        FROM country
        GROUP BY Region) AS r
    WHERE r.DensPoblacionPromedio > r.MitadDensMaximaPoblacion;
/*
50.Mostrar los lenguajes oficiales junto a su porcentaje promedio de habla, cuyo
promedio no supere un dígito entero. (Se esperan 2 columnas y 7 registros).
*/
SELECT t.l AS Lengua, t.p AS PorcentajePromedio
    FROM
        (SELECT Language as l, AVG(percentage) as p
            FROM countrylanguage
            WHERE IsOfficial LIKE 'T'
            GROUP BY Language) AS t
    WHERE t.p < 10
    ORDER BY t.p DESC;