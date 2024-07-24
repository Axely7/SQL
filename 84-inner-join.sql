SELECT * FROM city;
SELECT * FROM country;


SELECT COUNT(*) as total_cities, b.name as countryname FROM city a
INNER JOIN country b ON a.countrycode = b.code GROUP BY b."name" ORDER BY total_cities DESC LIMIT 1;