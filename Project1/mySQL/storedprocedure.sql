USE mondialDB;



DELIMITER $$

CREATE PROCEDURE GetBalkanRivers(
    IN minCountries INT,
    IN riverSearch VARCHAR(100)
)
BEGIN
    SELECT
        river_name,
        number_of_countries
    FROM view_rivers_balkan
    WHERE number_of_countries >= minCountries
      AND river_name LIKE CONCAT('%', riverSearch, '%')
    ORDER BY river_name;
END $$

DELIMITER ;