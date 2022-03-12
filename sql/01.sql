/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT
    title
FROM film
WHERE lower(title) NOT LIKE '%f%'
  AND film_id NOT IN (
    SELECT DISTINCT
        film_id
    FROM film
    JOIN film_actor USING (film_id)
    JOIN actor USING (actor_id)
    WHERE
        lower(actor.first_name) LIKE '%f%' OR
        lower(actor.last_name) LIKE '%f%'
    )
  AND film_id NOT IN (
    SELECT DISTINCT
        film_id
    FROM film
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN customer USING (customer_id)
    WHERE
        lower(customer.first_name) LIKE '%f%' OR
        lower(customer.last_name) LIKE '%f%'
    )
GROUP BY title
ORDER BY title;


/*
SELECT DISTINCT film_id
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
WHERE
    lower(actor.first_name) LIKE '%f%' OR
    lower(actor.last_name) LIKE '%f%';

SELECT DISTINCT film_id
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE
    lower(customer.first_name) LIKE '%f%' OR
    lower(customer.last_name) LIKE '%f%';
*/
