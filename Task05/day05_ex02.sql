-- CREATE INDEX --
CREATE INDEX idx_person_name ON person (UPPER(name));

-- CHECK --
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'ANNA';
