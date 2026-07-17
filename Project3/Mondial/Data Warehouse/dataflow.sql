USE mondialDWH;

DROP PROCEDURE IF EXISTS refresh_mondial_dwh;

DELIMITER $$

CREATE PROCEDURE refresh_mondial_dwh()
BEGIN
    SET FOREIGN_KEY_CHECKS = 0;

    TRUNCATE TABLE fact_river_country;
    TRUNCATE TABLE dim_river;
    TRUNCATE TABLE dim_country;
    TRUNCATE TABLE dim_region;

    SET FOREIGN_KEY_CHECKS = 1;

    INSERT INTO dim_region (RegionName)
    VALUES ('Western Balkans');

    INSERT INTO dim_country
    (
        CountryCode,
        CountryName,
        Population,
        Capital
    )
    SELECT
        code,
        name,
        population,
        capital
    FROM mondial.country
    WHERE code IN ('AL','BIH','MNE','MK','SRB');

    INSERT INTO dim_river
    (
        RiverName,
        RiverLength
    )
    SELECT DISTINCT
        r.name,
        r.length
    FROM mondial.river r
    JOIN mondial.geo_river gr
        ON r.name = gr.river
    WHERE gr.country IN ('AL','BIH','MNE','MK','SRB');

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
    WHERE gr.country IN ('AL','BIH','MNE','MK','SRB');
END$$

DELIMITER ;