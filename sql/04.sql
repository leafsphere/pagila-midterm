/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch similar movies.
 * You've already watched all other movies with the same actors,
 * so now you need a new strategy for finding similar movies.
 * You decide that two movies X and Y are similar if they have been rented by the same customer,
 * and you further quantify this similarity by defining the "similarity score" to be the number of distinct customers that have rented both X and Y.
 *
 * Write a SQL SELECT query that:
 * computes the "similarity score" for all movies with 'AMERICAN CIRCUS'
 * and orders the results from highest to lowest.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 *
 * NOTE:
 * You do not have to include movies with similarity score 0 in your results (but you may if you like).
 */

SELECT
    f2.title,
    COUNT(DISTINCT c.customer_id) AS "similarity score"
FROM film f1
JOIN inventory i1 ON (f1.film_id=i1.film_id)
JOIN rental r1 ON (i1.inventory_id=r1.inventory_id)
JOIN customer c on (r1.customer_id=c.customer_id)
JOIN rental r2 ON (c.customer_id=r2.customer_id)
JOIN inventory i2 ON (r2.inventory_id=i2.inventory_id)
JOIN film f2 ON (i2.film_id=f2.film_id)
WHERE f1.title='AMERICAN CIRCUS'
  AND f2.title!='AMERICAN CIRCUS'
GROUP BY f2.title
ORDER BY "similarity score" DESC, title;
 
