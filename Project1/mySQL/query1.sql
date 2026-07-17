USE mondialDB;

-- Të listohen lumenjtë që shtrihen
-- në të paktën dy shtete brenda Ballkanit Perëndimor

SELECT
    r.Name AS river_name,
    COUNT(DISTINCT gr.Country) AS number_of_countries
FROM river r
JOIN geo_river gr
    ON r.Name = gr.River
WHERE gr.Country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB')
GROUP BY r.Name
HAVING COUNT(DISTINCT gr.Country) >= 2
ORDER BY r.Name;