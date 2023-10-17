DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar = 'female') RETURNS TABLE
  (
    id bigint,
    name varchar,
    age integer,
    gender varchar,
    address varchar
  )
AS $$
  SELECT *
  FROM person
  WHERE pgender = person.gender
$$ language sql;

SELECT *
FROM fnc_persons(pgender := 'male');

select *
from fnc_persons();

DROP FUNCTION IF EXISTS fnc_persons();
