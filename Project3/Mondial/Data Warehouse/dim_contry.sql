USE mondialDWH;

INSERT INTO dim_country
(CountryCode, CountryName, Population, Capital)

SELECT
code,
name,
population,
capital
FROM mondial.country
WHERE code IN ('AL','BIH','MNE','MK','SRB');