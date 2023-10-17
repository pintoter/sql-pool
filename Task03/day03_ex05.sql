SELECT DISTINCT pi.name AS pizzeria_name
FROM pizzeria pi
JOIN person_visits pv ON pv.pizzeria_id = pi.id
JOIN person p ON p.id = pv.person_id AND p.name = 'Andrey'
JOIN person_order po ON p.id = po.person_id
WHERE pv.visit_date != po.order_date
ORDER BY pizzeria_name;