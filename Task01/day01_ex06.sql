SELECT order_date AS action_date, name AS person_name
FROM person_order p
JOIN person 
ON p.person_id = person.id
INTERSECT
SELECT visit_date AS action_date, name AS person_name
FROM person_visits pv
JOIN person 
ON pv.person_id = person.id
ORDER BY 1 ASC, 2 DESC;