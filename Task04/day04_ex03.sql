SELECT generated_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date
FROM person_visits
ORDER BY missing_date;

SELECT generated_date AS missing_date
FROM v_generated_dates
WHERE generated_date NOT IN (
  SELECT visit_date
  FROM person_visits)
ORDER BY missing_date;