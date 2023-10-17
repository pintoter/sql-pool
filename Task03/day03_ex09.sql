-- INSERT
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
  (SELECT MAX(id)+1 FROM person_visits), 
  (SELECT id FROM person WHERE name = 'Denis'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24'),
((SELECT MAX(id)+2 FROM person_visits), 
  (SELECT id FROM person WHERE name = 'Irina'),
  (SELECT id FROM pizzeria WHERE name = 'Dominos'),
  '2022-02-24');

-- CHECK
SELECT pv.id, p.name AS person_name, pi.name AS pizzeria_name, pv.visit_date 
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
JOIN pizzeria pi ON pi.id = pv.pizzeria_id
WHERE pv.id = (SELECT MAX(id)-1 FROM person_visits);

SELECT pv.id, p.name AS person_name, pi.name AS pizzeria_name, pv.visit_date 
FROM person_visits pv
JOIN person p ON p.id = pv.person_id
JOIN pizzeria pi ON pi.id = pv.pizzeria_id
WHERE pv.id = (SELECT MAX(id) FROM person_visits);

--  DELETE
DELETE FROM person_visits
WHERE id = (SELECT MAX(id)-1 FROM person_visits);

DELETE FROM person_visits
WHERE id = (SELECT MAX(id) FROM person_visits);