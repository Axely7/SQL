-- ¿Cual es el idioma (y codigo del idioma) oficial más hablado por diferentes países en Europa?

SELECT * FROM countrylanguage WHERE isofficial = true;
SELECT * FROM country;
SELECT * FROM continent;
SELECT * FROM "language";


SELECT count(*) as total, a.languagecode, a."language" as languageName  FROM countrylanguage a
INNER JOIN country b ON a.countrycode = b.code
INNER JOIN continent c ON b.continent = c.code
WHERE c."name" = 'Europe' AND a.isofficial = TRUE
GROUP BY a.languagecode, languageName ORDER BY count(*) DESC LIMIT 1;



-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el codigo anterior)

SELECT * from country a 
INNER JOIN countrylanguage b ON b.countrycode = a.code
WHERE a.continent = 5 AND b.isofficial = TRUE AND b.languagecode = 101;



