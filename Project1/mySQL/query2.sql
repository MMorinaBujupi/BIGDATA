USE mondialDB;

SELECT
    c.name AS Country_Name,
    ci.name AS Capital_City,
    c.population AS Population
FROM country c
JOIN city ci
    ON c.capital = ci.name
WHERE c.code IN (
    SELECT country
    FROM ismember
    WHERE organization = 'EU'
)
AND c.population >= 1000000
AND c.code NOT IN (
    SELECT country
    FROM geo_sea
)
ORDER BY c.name;