USE BigData_Datasets;

DELIMITER //

DROP FUNCTION IF EXISTS count_balkan_countries//

CREATE FUNCTION count_balkan_countries(riverName VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(DISTINCT gr.country)
    INTO total
    FROM mondialDB.geo_river gr
    WHERE gr.river = riverName
      AND gr.country IN ('AL','BIH','KOS','MNE','MK','SRB');

    RETURN total;
END//

DELIMITER ;

-- Test
SELECT
    name,
    count_balkan_countries(name) AS number_of_countries
FROM mondialDB.river
LIMIT 10;