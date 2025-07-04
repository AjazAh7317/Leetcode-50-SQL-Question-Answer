SELECT Today.id
FROM Weather AS Today
JOIN Weather AS Yesterday
  ON Today.recordDate = DATE_ADD(Yesterday.recordDate, INTERVAL 1 DAY)
WHERE Today.temperature > Yesterday.temperature;
