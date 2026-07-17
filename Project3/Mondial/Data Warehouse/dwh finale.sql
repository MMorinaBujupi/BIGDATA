SELECT
    dr.RiverName AS river_name,
    COUNT(DISTINCT dc.CountryKey) AS number_of_countries,
    GROUP_CONCAT(
        DISTINCT dc.CountryName
        ORDER BY dc.CountryName
        SEPARATOR ', '
    ) AS countries
FROM fact_river_country f
JOIN dim_river dr
    ON f.RiverKey = dr.RiverKey
JOIN dim_country dc
    ON f.CountryKey = dc.CountryKey
JOIN dim_region rg
    ON f.RegionKey = rg.RegionKey
WHERE rg.RegionName = 'Western Balkans'
GROUP BY dr.RiverKey, dr.RiverName
HAVING COUNT(DISTINCT dc.CountryKey) >= 2
ORDER BY dr.RiverName;