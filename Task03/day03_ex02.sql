WITH t AS (
  SELECT id
  FROM menu
  WHERE id NOT IN (SELECT menu_id FROM person_order)
)
SELECT m.pizza_name, m.price, pi.name AS pizzeria_name
FROM menu m
JOIN pizzeria pi ON pi.id = m.pizzeria_id
JOIN t ON t.id = m.id
ORDER BY m.pizza_name, m.price, pizzeria_name;