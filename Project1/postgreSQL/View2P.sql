CREATE OR REPLACE VIEW eu_countries_without_sea AS
SELECT
    c.name AS country_name,
    ci.name AS capital_city,
    c.population
FROM country c
JOIN city ci
    ON ci.name = c.capital
   AND ci.country = c.code
   AND ci.province = c.province
WHERE c.population >= 1000000
  AND c.code IN (
      SELECT country
      FROM ismember
      WHERE organization = 'EU'
  )
  AND c.code NOT IN (
      SELECT country
      FROM geo_sea
  )
ORDER BY c.name;