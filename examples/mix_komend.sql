SELECT a.first_name, a.last_name
FROM film as fl
INNER JOIN film_actor as fa ON fl.film_id = fa.film_id
INNER JOIN actor a on a.actor_id = fa.actor_id
WHERE fl.title = 'ACADEMY DINOSAUR';

SELECT a.first_name, a.last_name, fl.title
FROM film as fl
LEFT JOIN film_actor as fa ON fl.film_id = fa.film_id
LEFT JOIN actor a on a.actor_id = fa.actor_id
ORDER BY fl.title;

SELECT fl.title
FROM film fl
inner join inventory i on fl.film_id = i.film_id;

SELECT fl.title, i.inventory_id
FROM film fl
left join inventory i on fl.film_id = i.film_id;

SELECT fl.title, i.inventory_id
FROM film fl
right join inventory i on fl.film_id = i.film_id;

SELECT fl.title, i.inventory_id
FROM film fl
full outer join inventory i on fl.film_id = i.film_id;

SELECT fl.title, cs.first_name, cs.last_name
FROM film fl
cross join customer cs;
-- zwróć imię i nazwisko fanów komedii
SELECT DISTINCT c.first_name, c.last_name
from category ct
inner join public.film_category fc on ct.category_id = fc.category_id
inner join public.film f on fc.film_id = f.film_id
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id
inner join customer c on c.customer_id = r.customer_id
where ct.name = 'Comedy';