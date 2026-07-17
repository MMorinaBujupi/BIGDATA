USE DWH_mondial;

INSERT INTO Dim_Region (RegionName)
VALUES ('Western Balkans');

INSERT INTO Dim_Country (
    CountryID,
    CountryName,
    Population
)
SELECT
    c.Code,
    c.Name,
    c.Population
FROM mondialDB.country c
WHERE c.Code IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB');

INSERT INTO Dim_River (
    RiverName,
    RiverLength
)
SELECT DISTINCT
    r.Name,
    r.Length
FROM mondialDB.river r
JOIN mondialDB.geo_river gr
    ON r.Name = gr.River
WHERE gr.Country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB');

INSERT INTO Fact_River_Country (
    RiverID,
    CountryID,
    RegionID
)
SELECT DISTINCT
    dr.RiverID,
    dc.CountryID,
    dreg.RegionID
FROM mondialDB.geo_river gr
JOIN Dim_River dr
    ON gr.River = dr.RiverName
JOIN Dim_Country dc
    ON gr.Country = dc.CountryID
JOIN Dim_Region dreg
    ON dreg.RegionName = 'Western Balkans'
WHERE gr.Country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB');