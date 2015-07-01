DECLARE @x TABLE (ID int, Value int);
DECLARE @y TABLE (ID int, Value int);
INSERT @x VALUES (1, 10), (2, 20);
INSERT @y VALUES (1, 100),(2, 200);

WITH cte AS (SELECT * FROM @x)
UPDATE cte -- cte is referenced by the alias.
SET Value = y.Value
FROM cte  -- cte is assigned an alias.
INNER JOIN @y AS y ON y.ID = cte.ID;
SELECT * FROM @x;
