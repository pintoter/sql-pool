INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
  ROW_NUMBER() OVER() AS id,
  amount.person_id,
  amount.pizzeria_id,
  CASE
    WHEN amount.orders = 1 THEN 10.5
    WHEN amount.orders = 2 THEN 22
    ELSE 30
    END as discount
FROM (SELECT person_id, pizzeria_id, count(person_id) AS orders
  FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
  GROUP BY person_id, pizzeria_id
) AS amount;
