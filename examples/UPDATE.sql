CREATE TABLE IF NOT EXISTS actor_sample (actor_id SERIAL, first_name VARCHAR(45) NOT NULL, last_name VARCHAR(45) NOT NULL, last_update timestamp not null default current_timestamp, PRIMARY KEY (actor_id));

insert into actor_sample (first_name, last_name) Values ('Jarosław', 'K');
-- godzina zapisuje się w UTC i powinno dodawać się strefę czasową danej osoby
SELECT *
FROM actor_sample;


INSERT INTO actor_sample (first_name, last_name)
SELECT first_name, last_name
FROM actor
WHERE first_name = 'NICK';

INSERT INTO actor_sample (first_name, last_name)
SELECT first_name, last_name
FROM actor
WHERE first_name = 'KENNETH';

SELECT *
FROM actor_sample;

DROP TABLE actor_sample;

CREATE TABLE IF NOT EXISTS actor_sample (actor_id SERIAL, first_name VARCHAR(45) NOT NULL, last_name VARCHAR(45) NOT NULL, last_update timestamp not null default current_timestamp, PRIMARY KEY (actor_id));

INSERT INTO actor_sample (first_name, last_name)
SELECT first_name, last_name
FROM actor;

SELECT *
FROM actor_sample
ORDER BY actor_id;

UPDATE actor_sample
SET first_name = 'Lech'
WHERE actor_id = '1';

update actor_sample
set first_name = 'Janusz', last_name = 'Kowalski'
WHERE actor_id = 2;
-- tylko wybrane pozycje ()
UPDATE actor_sample
SET first_name = 'Jarosław'
WHERE actor_id IN (1, 3, 6);

UPDATE actor_sample
SET first_name = 'Andrzej'
Where actor_id IN (
SELECT actor_id
FROM film_actor
WHERE film_id = 1);

SELECT *
FROM film;

