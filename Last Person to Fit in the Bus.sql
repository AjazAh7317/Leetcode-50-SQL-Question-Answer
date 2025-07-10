WITH ordered_queue AS (
    SELECT *, 
           SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
),
can_board AS (
    SELECT person_name, total_weight
    FROM ordered_queue
    WHERE total_weight <= 1000
)
SELECT person_name
FROM can_board
ORDER BY total_weight DESC
LIMIT 1;
