SELECT CONCAT (name, ' (age:', CAST(age as varchar), ',gender:''', gender,''',address:''', address, ''')') AS person_information
FROM person 
ORDER BY person_information ASC;
