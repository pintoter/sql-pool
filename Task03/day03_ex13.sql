-- DELETE FROM PO
DELETE FROM person_order 
WHERE order_date = '2022-02-25' AND menu_id IN (SELECT id FROM menu WHERE pizza_name = 'greek pizza');

-- DELETE FROM PO
DELETE FROM person_order po
WHERE po.order_date = '2022-02-25';

-- DELETE FROM MENU
DELETE FROM menu
WHERE pizza_name = 'greek pizza';