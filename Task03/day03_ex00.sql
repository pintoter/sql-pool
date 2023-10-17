SELECT m.pizza_name, m.price, pi.name AS pizzeria_name, pv.visit_date
FROM menu m
JOIN pizzeria pi ON pi.id = m.pizzeria_id
JOIN person_visits pv ON pv.pizzeria_id = pi.id
JOIN person p ON p.id = pv.person_id AND p.name = 'Kate'
WHERE m.price BETWEEN 800 and 1000
ORDER BY m.pizza_name, m.price, pizzeria_name, pv.visit_date;