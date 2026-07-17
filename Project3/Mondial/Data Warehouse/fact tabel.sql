USE mondialDWH;

INSERT INTO fact_river_country
(
    RiverKey,
    CountryKey,
    RegionKey
)
SELECT DISTINCT
    dr.RiverKey,
    dc.CountryKey,
    rg.RegionKey
FROM mondial.geo_river gr
JOIN dim_river dr
    ON gr.river = dr.RiverName
JOIN dim_country dc
    ON gr.country = dc.CountryCode
JOIN dim_region rg
    ON rg.RegionName = 'Western Balkans'
WHERE gr.country IN ('AL','BIH','MNE','MK','SRB')
  AND NOT EXISTS (
      SELECT 1
      FROM fact_river_country f
      WHERE f.RiverKey = dr.RiverKey
        AND f.CountryKey = dc.CountryKey
        AND f.RegionKey = rg.RegionKey
  );