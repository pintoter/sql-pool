CREATE OR REPLACE FUNCTION fnc_fibonacci(in pstop integer = 10) RETURNS TABLE(fib bigint)
AS $$
  WITH RECURSIVE fib(n1,n2) AS (
    SELECT 0,1
    UNION ALL
    SELECT f.n2 AS n1,f.n1+f.n2 AS n2
    FROM fib f
    WHERE f.n2 < pstop
    )
  SELECT f.n1
  FROM fib f

$$ LANGUAGE sql;



select * from fnc_fibonacci(20);
select * from fnc_fibonacci();
