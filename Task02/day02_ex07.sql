SELECT pi.name AS pizzeria_name
FROM pizzeria pi
JOIN menu m ON m.pizzeria_id = pi.id AND m.price < 800
JOIN person_visits pv ON pv.pizzeria_id = pi.id AND pv.visit_date = '2022-01-08'
JOIN person p ON p.id = pv.person_id AND p.name = 'Dmitriy';
