SELECT * FROM continent;
SELECT * FROM country;

(SELECT count(*) as total, b.name as ContinentName FROM country a 
INNER JOIN continent b ON a.continent = b.code
WHERE b."name" not LIKE '%America%'
GROUP BY b."name" )
UNION
(SELECT COUNT(*) as total, 'America' FROM country a
INNER JOIN continent b ON a.continent = b.code
WHERE b."name" LIKE '%America%') ORDER BY total ASC;

(SELECT count(*) as total, b.name from country a
INNER JOIN continent b ON a.continent = b.code
WHERE b.code not in (4,6,8)
GROUP BY b."name"
) UNION
( 
SELECT count(*) as total, 'America' FROM country a
INNER JOIN continent b on b.code = a.continent
WHERE b.code in (4,6,8)
) ORDER BY total ASC;