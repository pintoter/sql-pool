SELECT 
  m1.pizza_name, 
  pi1.name AS pizzeria_name1,
  pi2.name AS pizzeria_name2,
  m1.price
FROM menu m1 
JOIN menu m2 ON m2.pizza_name = m1.pizza_name
JOIN pizzeria pi1 ON pi1.id = m1.pizzeria_id
JOIN pizzeria pi2 ON pi2.id = m2.pizzeria_id
WHERE m1.pizzeria_id > m2.pizzeria_id AND m2.price = m1.price
ORDER BY 1, 3;