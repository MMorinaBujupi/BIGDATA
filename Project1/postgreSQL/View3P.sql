CREATE OR REPLACE VIEW deepest_balkan_lakes AS
SELECT
    l.name AS lake_name,
    l.depth
FROM lake l
JOIN geo_lake gl
    ON l.name = gl.lake
WHERE gl.country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB', 'HR', 'SI', 'GR', 'BG', 'RO')
  AND l.depth = (
      SELECT MAX(l2.depth)
      FROM lake l2
      JOIN geo_lake gl2
          ON l2.name = gl2.lake
      WHERE gl2.country IN ('AL', 'BIH', 'KOS', 'MNE', 'MK', 'SRB', 'HR', 'SI', 'GR', 'BG', 'RO')
  );