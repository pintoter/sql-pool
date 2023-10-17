-- INSERT
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1 FROM person_order),
  (SELECT id FROM person WHERE name = 'Denis'),
  (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24'),
  ((SELECT MAX(id) + 2 FROM person_order),
  (SELECT id FROM person WHERE name = 'Irina'),
  (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
  '2022-02-24');

  -- CHECK
SELECT po.id, p.name AS person_name, m.pizza_name, po.order_date
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE po.id = (SELECT MAX(id) - 1 FROM person_order);

SELECT po.id, p.name AS person_name, m.pizza_name, po.order_date
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE po.id = (SELECT MAX(id) FROM person_order);

-- DELETE
DELETE FROM person_order
WHERE id = (SELECT MAX(id) - 1 FROM person_order);

DELETE FROM person_order
WHERE id = (SELECT MAX(id) FROM person_order);
