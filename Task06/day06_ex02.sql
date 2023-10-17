SELECT p.name, m.pizza_name, m.price, m.price * (100 - pd.discount)/100 AS discount_price, pi.name AS pizzeria_name
FROM person_order po
  JOIN person p ON p.id = po.person_id
  JOIN menu m ON m.id = po.menu_id
  JOIN pizzeria pi ON pi.id = m.pizzeria_id
  JOIN person_discounts pd ON pd.person_id = p.id AND pd.pizzeria_id = pi.id
ORDER BY 1, 2;