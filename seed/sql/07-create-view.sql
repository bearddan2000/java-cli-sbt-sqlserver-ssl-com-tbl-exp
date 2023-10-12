CREATE VIEW breed_count AS
WITH CTE_Count (id, val) AS (
  SELECT breedId, COUNT(*)
  FROM dog
  GROUP BY breedId
)

SELECT c.id, c.breed, b.val as 'Breed Count'
FROM dog as a
JOIN CTE_Count as b ON b.id = a.breedId
JOIN breedLookup as c ON c.id = a.breedId
GROUP BY c.id, c.breed, b.val
