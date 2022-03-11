/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * Your where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */

SELECT
    COUNT(DISTINCT customer_id)
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film_actor USING (film_id)
JOIN actor a USING (actor_id)
WHERE a.first_name = 'RUSSELL'
  AND a.last_name = 'BACALL';

