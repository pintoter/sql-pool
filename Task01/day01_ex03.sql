-- SELECT order_date AS action_date, person_id
-- FROM person_order
-- INTERSECT
-- SELECT visit_date AS action_date, person_id
-- FROM person_visits
-- ORDER BY 1 ASC, 2 DESC;

SELECT DISTINCT person_order.order_date AS action_date, person_order.person_id
FROM person_order 
INNER JOIN person_visits
ON person_order.order_date = person_visits.visit_date
ORDER BY 1 ASC, 2 DESC;
