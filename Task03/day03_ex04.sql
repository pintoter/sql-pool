WITH male AS (
  SELECT pi.name AS pizzeria_name
  FROM pizzeria pi
  JOIN menu m on pi.id = m.pizzeria_id
  JOIN person_order po ON m.id = po.menu_id
  JOIN person p ON po.person_id = p.id AND p.gender = 'male'
), female AS (
  SELECT pi.name AS pizzeria_name 
  FROM pizzeria pi
  JOIN menu m on pi.id = m.pizzeria_id
  JOIN person_order po ON m.id = po.menu_id
  JOIN person p ON po.person_id = p.id AND p.gender = 'female'
)
SELECT pizzeria_name FROM male EXCEPT (SELECT * from female)
UNION 
SELECT pizzeria_name FROM female EXCEPT (SELECT * from male);
