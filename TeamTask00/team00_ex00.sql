-- CREATE
DROP TABLE IF EXISTS travel;

CREATE TABLE travel (
	id serial primary key,
	point1 varchar not null,
	point2 varchar not null,
	price int not null
);

INSERT INTO travel (point1, point2, price)
VALUES ('a', 'b', 10),
	('a', 'c', 15),
	('a', 'd', 20),
	('b', 'a', 10),
	('b', 'c', 35), 
	('b', 'd', 25),
	('c', 'a', 15),
	('c', 'b', 35),
	('c', 'd', 30),
	('d', 'a', 20),
	('d', 'b', 25),
	('d', 'c', 30);

-- CHECK TABLE
SELECT * FROM travel;

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
AND total_cost = (SELECT MIN(total_cost) FROM t WHERE point2 = 'a' AND LENGTH(path) = 8)
ORDER BY 1, 2;