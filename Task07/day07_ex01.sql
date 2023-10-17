SELECT p.name, count(pv.pizzeria_id)
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 4;