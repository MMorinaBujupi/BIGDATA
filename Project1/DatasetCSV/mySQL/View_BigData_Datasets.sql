USE BigData_Datasets;

DROP VIEW IF EXISTS v_western_balkan_rivers;

CREATE VIEW v_western_balkan_rivers AS
SELECT
    r.name AS river_name,
    COUNT(DISTINCT c.code) AS number_of_countries,
    GROUP_CONCAT(
        DISTINCT c.name
        ORDER BY c.name
        SEPARATOR ', '
    ) AS countries
FROM mondialDB.river r
JOIN mondialDB.geo_river gr
    ON r.name = gr.river
JOIN mondialDB.country c
    ON gr.country = c.code
WHERE c.code IN (
    'AL',
    'BIH',
    'KOS',
    'MNE',
    'MK',
    'SRB'
)
GROUP BY r.name
HAVING COUNT(DISTINCT c.code) >= 2;

-- Test
SELECT *
FROM v_western_balkan_rivers;