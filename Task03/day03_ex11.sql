-- UPDATE
UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';

-- CHECK
SELECT *
FROM menu
WHERE pizza_name = 'greek pizza';

-- DEFAULT
UPDATE menu
SET price = 800
WHERE pizza_name = 'greek pizza';