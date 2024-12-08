-- Correlation Analysis
-- Duration
SELECT 
    CASE 
        WHEN duration_ms < 180000 THEN 'Short'
        WHEN duration_ms BETWEEN 180000 AND 300000 THEN 'Medium'
        ELSE 'Long'
    END AS duration_category,
    AVG(popularity) AS avg_popularity
FROM tracks
GROUP BY duration_category
ORDER BY avg_popularity DESC;

-- Tempo
SELECT 
    CASE 
        WHEN tempo BETWEEN 0 AND 60 THEN 'Slow'
        WHEN tempo BETWEEN 61 AND 120 THEN 'Moderate'
        ELSE 'Fast'
    END AS tempo_range,
    AVG(popularity) AS avg_popularity
FROM tracks
GROUP BY tempo_range
ORDER BY avg_popularity DESC;

-- Explicit
SELECT 
    explicit, 
    AVG(popularity) AS avg_popularity
FROM tracks
GROUP BY explicit
ORDER BY avg_popularity DESC;

-- Genre
SELECT 
    track_genre, 
    AVG(popularity) AS avg_popularity
FROM tracks
GROUP BY track_genre
ORDER BY avg_popularity DESC
LIMIT 10;


