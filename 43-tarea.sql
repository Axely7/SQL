
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like

SELECT * from users;

SELECT count(*) from users where email like '%@google.com';



-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

SELECT country, email from users;
SELECT DISTINCT country from users where email like '%@google.com';


-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by

SELECT count(*) as user_count, country from users GROUP BY country;


-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection

SELECT first_name, last_name, country, last_connection from users WHERE country like '%Iceland';


-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX

SELECT
	count(*) as users_112
FROM
	users
WHERE
	last_connection LIKE '112%'
	AND country LIKE '%Iceland';


-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis

SELECT
	first_name,
	last_name,
	country,
	last_connection
FROM
	users
WHERE
	country = 'Iceland' and
	(last_connection LIKE '112%'
	OR last_connection LIKE '28%'
	OR last_connection LIKE '188%');



-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también

SELECT
	first_name,
	last_name,
	country,
	last_connection
FROM
	users
WHERE
	country = 'Iceland'
	and(last_connection LIKE '112%'
		OR last_connection LIKE '28%'
		OR last_connection LIKE '188%')
ORDER BY
	last_name ASC,
	first_name ASC;

	-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)

SELECT
	first_name,
	last_name,
	country
FROM
	users
WHERE
	country IN('Mexico', 'Honduras', 'Costa Rica')
ORDER BY
	country, first_name, last_name ASC;
		
	-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

SELECT
	count(*) AS persons,
	country
FROM
	users
WHERE
	country IN('Mexico', 'Honduras', 'Costa Rica')
GROUP BY
	country
ORDER BY country ASC;
	
	
