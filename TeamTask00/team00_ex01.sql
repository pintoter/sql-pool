-- SOLUTION
WITH RECURSIVE t AS (
  SELECT point2, ('{' || point1) AS path, price AS total_cost
  FROM travel
  WHERE point1 = 'a'

  UNION

  SELECT travel.point2, (t.path || ',' || travel.point1) AS path, t.total_cost + travel.price AS total_cost
  FROM travel
  JOIN t ON t.point2 = travel.point1 
  WHERE path NOT LIKE ('%' || travel.point1 || '%')
)
  
SELECT total_cost, (path || ',a}') AS tour
FROM t
WHERE point2 = 'a' 
AND LENGTH(path) = 8
AND (
  total_cost = (SELECT MIN(total_cost) FROM t WHERE point2 = 'a' AND LENGTH(path) = 8) 
  OR 
  total_cost = (SELECT MAX(total_cost) FROM t WHERE point2 = 'a' AND LENGTH(path) = 8)
)
ORDER BY 1, 2;