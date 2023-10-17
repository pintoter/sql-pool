SELECT order_date,
      CONCAT (name, ' (age:', CAST(age as varchar), ')') AS person_information
FROM person_order po
JOIN person p
ON po.person_id=p.id
ORDER BY 1 ASC, 2 ASC; 