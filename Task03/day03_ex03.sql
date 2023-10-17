SELECT pizzeria_name
FROM (
  SELECT pi.name AS pizzeria_name, 
    SUM(CASE WHEN p.gender = 'male' THEN 1 ELSE 0 END) AS visit_male,
    SUM(CASE WHEN p.gender = 'female' THEN 1 ELSE 0 END) AS visit_female
  FROM pizzeria pi
    JOIN person_visits pv ON pv.pizzeria_id = pi.id
    JOIN person p ON p.id = pv.person_id
  GROUP BY pizzeria_name
) AS visits
WHERE visit_male > visit_female OR visit_male < visit_female
ORDER BY pizzeria_name;
