CREATE OR REPLACE FUNCTION count_balkan_countries(river_name TEXT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(DISTINCT gr.country)
    INTO total
    FROM geo_river gr
    WHERE gr.river = river_name
      AND gr.country IN ('AL','BIH','KOS','MNE','MK','SRB');

    RETURN total;
END;
$$ LANGUAGE plpgsql;