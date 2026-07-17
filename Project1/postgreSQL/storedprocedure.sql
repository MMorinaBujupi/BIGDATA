CREATE OR REPLACE FUNCTION GetRivers(
    minCountries INT,
    riverName VARCHAR
)
RETURNS TABLE (
    river_name VARCHAR,
    number_of_countries BIGINT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        v.river_name,
        v.number_of_countries
    FROM view_rivers_balkan v
    WHERE v.number_of_countries >= minCountries
      AND v.river_name ILIKE '%' || riverName || '%';
END;
$$ LANGUAGE plpgsql;