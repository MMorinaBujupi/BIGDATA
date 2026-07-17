USE DWH_mondial;

SELECT
    dr.RiverName AS river_name,
    COUNT(DISTINCT frc.CountryID) AS number_of_countries,
    GROUP_CONCAT(
        DISTINCT dc.CountryName
        ORDER BY dc.CountryName
        SEPARATOR ', '
    ) AS countries
FROM Fact_River_Country frc
JOIN Dim_River dr
    ON frc.RiverID = dr.RiverID
JOIN Dim_Country dc
    ON frc.CountryID = dc.CountryID
JOIN Dim_Region dreg
    ON frc.RegionID = dreg.RegionID
WHERE dreg.RegionName = 'Western Balkans'
GROUP BY dr.RiverID, dr.RiverName
HAVING COUNT(DISTINCT frc.CountryID) >= 2
ORDER BY dr.RiverName;