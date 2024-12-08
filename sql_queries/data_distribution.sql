-- Check the Data Distribution
-- Popularity
SELECT popularity, COUNT(*) AS count
FROM tracks
GROUP BY popularity
ORDER BY popularity DESC;

-- Tempo
SELECT 
    CASE 
        WHEN tempo BETWEEN 0 AND 60 THEN 'Slow'
        WHEN tempo BETWEEN 61 AND 120 THEN 'Moderate'
        ELSE 'Fast'
    END AS tempo_range,
    COUNT(*) AS count
FROM tracks
GROUP BY tempo_range
ORDER BY tempo_range;

-- Explicit
SELECT explicit, COUNT(*) AS count
FROM tracks
GROUP BY explicit;

-- Track Genre
SELECT track_genre, COUNT(*) AS count
FROM tracks
GROUP BY track_genre
ORDER BY count DESC
LIMIT 10;

-- Duration
SELECT 
    CASE 
        WHEN duration_ms < 180000 THEN 'Short'
        WHEN duration_ms BETWEEN 180000 AND 300000 THEN 'Moderate'
        ELSE 'Long'
    END AS duration_category,
    COUNT(*) AS count
FROM tracks
GROUP BY duration_category
ORDER BY duration_category;




