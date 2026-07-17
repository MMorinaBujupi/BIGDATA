USE mondialDWH;

CREATE INDEX idx_dim_river_name
ON dim_river(RiverName);

CREATE INDEX idx_dim_country_code
ON dim_country(CountryCode);

CREATE INDEX idx_fact_river
ON fact_river_country(RiverKey);

CREATE INDEX idx_fact_country
ON fact_river_country(CountryKey);

CREATE INDEX idx_fact_region
ON fact_river_country(RegionKey);