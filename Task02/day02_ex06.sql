SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id
JOIN person_order po ON m.id = po.menu_id
JOIN person ON po.person_id = person.id AND person.name IN ('Denis', 'Anna')
ORDER BY m.pizza_name, pizzeria_name;
