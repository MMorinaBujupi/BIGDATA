
SELECT
    name,
    count_balkan_countries(name) AS number_of_countries
FROM river
ORDER BY number_of_countries DESC;
