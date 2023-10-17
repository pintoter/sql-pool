DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(varchar,numeric,date);

CREATE FUNCTION fnc_person_visits_and_eats_on_date(in pperson varchar = 'Dmitriy', in pprice numeric = 500, in pdate date = '2022-01-08')
RETURNS TABLE(pizzeria_name varchar)
AS $$
    BEGIN
       RETURN QUERY SELECT DISTINCT p.name AS pizzeria_name
        FROM (
            SELECT id, pe.name AS person_name
            FROM person pe
            WHERE pperson = pe.name
             ) AS ps
        JOIN person_visits pv on ps.id = pv.person_id
        JOIN pizzeria p on p.id = pv.pizzeria_id
        JOIN menu m on p.id = m.pizzeria_id
        JOIN person_order po on m.id = po.menu_id
        WHERE m.price < pprice AND pv.visit_date = pdate AND po.order_date = pdate;
    END;
$$ language plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
