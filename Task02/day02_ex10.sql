SELECT p1.name AS person_name1, p2.name AS person_name2, p1.address AS common_address
FROM person p1
JOIN person p2 ON p2.address = p1.address AND p2.id < p1.id
ORDER BY person_name1, person_name2, common_address; 
