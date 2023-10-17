WITH res AS ((SELECT pi.name,
                       count(pizzeria_id)
                FROM person_visits pv
                         JOIN pizzeria pi ON pi.id = pv.pizzeria_id
                GROUP BY 1
                ORDER BY 2 DESC)

                UNION ALL

                (SELECT pi.name,
                       count(pi.name)
                FROM person_order po
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria pi ON pi.id = m.pizzeria_id
                GROUP BY 1
                ORDER BY 2 DESC))
SELECT name, SUM(count)
FROM res
GROUP BY 1
ORDER BY 2 DESC, 1;