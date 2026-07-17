USE mondialDWH;

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
WHERE gr.country IN ('AL','BIH','MNE','MK','SRB')
ON DUPLICATE KEY UPDATE
    RiverLength = VALUES(RiverLength);