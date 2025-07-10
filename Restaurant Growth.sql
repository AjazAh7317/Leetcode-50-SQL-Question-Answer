SELECT
    visited_on,
    amount,
    ROUND(SUM(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) / 7, 2) AS average_amount
FROM (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
) daily_amounts
WHERE visited_on >= (
    SELECT MIN(visited_on) + INTERVAL 6 DAY FROM Customer
)
ORDER BY visited_on;
