CREATE TABLE IF NOT EXISTS actor_sample (actor_id SERIAL, first_name VARCHAR(45) NOT NULL, last_name VARCHAR(45) NOT NULL, last_update timestamp not null default current_timestamp, PRIMARY KEY (actor_id));

insert into actor_sample (first_name, last_name)
select first_name, last_name
from actor;

SELECT *
FROM actor_sample;

SELECT *
from actor_sample
where actor_id = 1;

DELETE
from actor_sample
where actor_id = 1;

SELECT *
from film;

DELETE
from actor_sample
where actor_id in (select actor_id
                   from film_actor
                   where film_id IN (select film_id
                                     from film
                                     where title = 'ACADEMY DINOSAUR'));

SELECT *
from actor_sample
where actor_id IN (1, 10, 20, 30, 40, 53);

select actor_id
from film_actor
where film_id in (1);

select film_id
from film
where title = 'ACADEMY DINOSAUR';

DROP TABLE actor_sample