USE mondialDB;



CREATE VIEW eu_countries_without_sea AS
SELECT
    c.name AS Country_Name,
    ci.name AS Capital_City,
    c.population AS Population
FROM country c
JOIN city ci
    ON ci.name = c.capital
    AND ci.country = c.code
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