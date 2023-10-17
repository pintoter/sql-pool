SELECT object_name 
FROM (
  SELECT name AS object_name, 1 AS temp 
  FROM person
  UNION ALL
  SELECT pizza_name AS object_name, 2 AS temp
  FROM menu
) AS temp_temp
ORDER BY temp, object_name;