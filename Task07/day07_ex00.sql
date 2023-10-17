SELECT person_id, count(pizzeria_id)
FROM person_visits
GROUP BY 1
ORDER BY 2 DESC;