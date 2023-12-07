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