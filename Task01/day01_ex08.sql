SELECT order_date,
      CONCAT (name, ' (age:', CAST(age as varchar), ')') AS person_information
FROM person_order po
NATURAL JOIN person
ORDER BY 1 ASC, 2 ASC; 