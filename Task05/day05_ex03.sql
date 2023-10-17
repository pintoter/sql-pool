-- CREATE INDEX --
CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id,order_date);

-- CHECK --
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

