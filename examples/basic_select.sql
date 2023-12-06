SELECT * FROM actor;

SELECT last_name, first_name FROM actor;

SELECT *
FROM actor
ORDER BY first_name;

SELECT *
FROM actor
ORDER BY first_name DESC;

-- sortowanie po dwóch kolumnach, tylko gdy powtórzy się last name to będzie sort po first name
SELECT *
FROM actor
ORDER BY last_name DESC, first_name DESC;

SELECT *
FROM actor
WHERE actor_id > 100;

SELECT last_name, first_name
FROM actor
WHERE actor_id > 100;

SELECT *
FROM actor
WHERE first_name = 'NICK';

SELECT *
FROM actor
WHERE first_name = 'NICK'
ORDER BY actor_id DESC;

SELECT *
FROM rental;

SELECT rental_date AS RentalDate, inventory_id AS FilmListId
FROM rental;

SELECT *
FROM film;

SELECT replacement_cost - rental_rate AS CostDiff,
       film_id,
       length / 60 AS TimeInHour
FROM film;

SELECT rental_rate                 AS RentalRate,
       rental_rate + 3 * 4 - 1     AS Result1,
       (rental_rate + 3) * 4 - 1   AS Result2,
       (rental_rate + 3) * (4 - 1) AS Result3,
       rental_rate + (3 * 4) - 1   AS Result4
FROM film;

SELECT *
FROM payment;

SELECT amount,
       round(amount) AS Amnt,
       floor(amount) AS Amnt1,
       ceiling(amount) AS Amnt2
FROM payment;

SELECT concat(first_name, ' ', last_name)
FROM actor;

SELECT concat(left(first_name, 1), '.', left(last_name, 1), '.')
FROM actor;

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id < 100;
-- alfabetycznie, do NICK
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name < 'NICK';
-- różne od NICK
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name != 'NICK';
-- to to samo
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name <> 'NICK';
-- może być kilka warunków
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'KENNETH' AND actor_id < 100;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'KENNETH' AND actor_id < 100 AND last_name = 'TORN';
-- zwróci kennethow i do id 100, plus zwracają templi wszystkich
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'KENNETH' AND actor_id < 100 or last_name = 'TEMPLE';
-- działa tak samo
SELECT actor_id, first_name, last_name
FROM actor
WHERE (first_name = 'KENNETH' AND actor_id < 100) or last_name = 'TEMPLE';
-- wyszuka wszystkich kennethó którzy mają id <100 bo nie ma kennethów którzy mają o nazwisku temple
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'KENNETH' AND (actor_id < 100 or last_name = 'TEMPLE');
-- wszyscy którzy są w zbiorze
SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHN', 'JOE', 'VIVIEN');
-- wszyscy którzy nie są w zbiorze
SELECT *
FROM actor
WHERE first_name NOT IN ('NICK', 'JOHN', 'JOE', 'VIVIEN');
-- wszyscy którzy mają na imie ze zbioru i na nazwisko degeners
SELECT *
FROM actor
WHERE first_name IN ('NICK', 'JOHN', 'JOE', 'VIVIEN')
  AND actor_id IN(SELECT actor_id FROM actor WHERE last_name = 'DEGENERS');

SELECT *
FROM actor
WHERE actor_id >= 10 AND actor_id <=20;
-- to jest to samo, between jest przedziałem zamkniętym
SELECT *
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

SELECT *
FROM actor
WHERE actor_id NOT BETWEEN 10 AND 20;
-- wszyscy na literę A
SELECT *
FROM actor
WHERE first_name LIKE 'A%';

SELECT *
FROM actor
WHERE first_name LIKE 'AL%';
-- _zastępuje pojedynczą literę, % zastępuje dowolną ilość znaków
SELECT *
FROM actor
WHERE first_name LIKE 'A__E';

SELECT *
FROM actor
WHERE first_name LIKE 'A__E%';
-- zaczynają się na A i mają gdzieś E w imieniu
SELECT *
FROM actor
WHERE first_name LIKE 'A%E%';

SELECT concat(first_name, ' ', last_name) AS FullName
FROM actor;
-- mozna wywolywac funkcje w order by, po aliasowaniu, mozna robic na aliasie działania
SELECT concat(first_name, ' ', last_name) AS FullName
FROM actor
ORDER BY FullName;
-- 5 pierwszych wyników
SELECT actor_id
FROM actor
ORDER BY actor_id
LIMIT 5;
-- offset to przesunięcie początku wyświetlania danych
SELECT actor_id
FROM actor
ORDER BY actor_id
LIMIT 5 OFFSET 10;