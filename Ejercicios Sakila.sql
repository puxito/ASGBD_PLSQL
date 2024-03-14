use sakila;
create user 'userSakila1'@'localhost' identified by 'Studium2020;';
grant select, insert on sakila.city to 'userSakila1'@'localhost';
grant select, insert on sakila.country to 'userSakila1'@'localhost';

select 
country_id as 'idPaís',
country as 'País'
from
sakila.country
order by 2;

select
title as 'Película'
from sakila.film
where
length > 90;

select
country_id as 'Código',
country as 'País'
from
country
where 
country like 'S%';

select city.city as 'Ciudad'
from city
inner join country on city.country_id = country.country_id
where country.country = 'France';

select film.title as 'Película'
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where actor.first_name = 'Bette' and actor.last_name = 'Nicholson';


select film.title AS 'Película', category.name AS 'Categoría' FROM sakila.category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film.film_id = film_category.film_id
WHERE category.name = 'Action' OR category.name = 'Sci-fi'
order by title;


select 
customer.first_name 'Nombre', customer.last_name 'Apellido', sum(payment.amount) as 'Cantidad'
from
customer
join payment on customer.customer_id = payment.customer_id
group by payment.customer_id
order by 3 desc
limit 5;

select
film.film_id, film.title as 'Película', sum(payment.amount) as 'Cantidad recaudada'
from
payment
join rental on payment.rental_id = rental.rental_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
group by film.film_id
order by 3 desc
limit 1




