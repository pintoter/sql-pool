WITH visits AS (SELECT pi.name,
                       count(pizzeria_id),
                       'visit' AS action_type
                FROM person_visits pv
                         JOIN pizzeria pi ON pi.id = pv.pizzeria_id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 3),
     ordres AS (SELECT pi.name,
                       count(pi.name),
                       'order' AS action_type
                FROM person_order po
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pi ON pi.id = m.pizzeria_id
                GROUP BY 1
                ORDER BY 2 DESC
                LIMIT 3)
SELECT *
FROM visits
UNION ALL
SELECT *
FROM ordres
ORDER BY 3, 2 DESC;