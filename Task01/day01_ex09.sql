SELECT name 
FROM pizzeria p
WHERE NOT EXISTS (
  SELECT 1 FROM person_visits pv
  WHERE p.id = pv.pizzeria_id
);

SELECT name 
FROM pizzeria
WHERE id NOT IN (
  SELECT pv.pizzeria_id FROM person_visits pv
);
