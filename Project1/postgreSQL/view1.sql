CREATE VIEW view_rivers_balkan AS
SELECT
    r.name AS river_name,
    COUNT(DISTINCT gr.country) AS number_of_countries
FROM river r
JOIN geo_river gr
    ON r.name = gr.river
WHERE gr.country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB')
GROUP BY r.name
HAVING COUNT(DISTINCT gr.country) >= 2;
