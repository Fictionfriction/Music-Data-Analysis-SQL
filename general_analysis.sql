-- Most Prolific Artists
SELECT a.artist, COUNT(ta.track_id) AS track_count
FROM artists a
JOIN tracks_artists ta ON a.artist_id = ta.artist_id
GROUP BY a.artist_id
ORDER BY track_count DESC
LIMIT 10;
-- Average Track Duration by Artist
SELECT a.artist, AVG(t.duration_ms) / 60000 AS avg_duration_minutes
FROM artists a
JOIN tracks_artists ta ON a.artist_id = ta.artist_id
JOIN tracks t ON ta.track_id = t.track_id
GROUP BY a.artist_id
ORDER BY avg_duration_minutes DESC;
-- Distribution of Explicit Tracks
SELECT explicit, COUNT(*) AS track_count
FROM tracks
GROUP BY explicit;
-- Tempo Analysis
SELECT track_name, tempo
FROM tracks
ORDER BY tempo DESC
LIMIT 5; -- Fastest tracks

SELECT track_name, tempo
FROM tracks
ORDER BY tempo ASC
LIMIT 5; -- Slowest tracks

-- Tracks by Genre
SELECT track_genre, COUNT(*) AS track_count
FROM tracks
GROUP BY track_genre
ORDER BY track_count DESC;

-- Collaboration Analysis
SELECT a1.artist AS artist1, a2.artist AS artist2, COUNT(ta1.track_id) AS collaborations
FROM tracks_artists ta1
JOIN tracks_artists ta2 ON ta1.track_id = ta2.track_id AND ta1.artist_id < ta2.artist_id
JOIN artists a1 ON ta1.artist_id = a1.artist_id
JOIN artists a2 ON ta2.artist_id = a2.artist_id
GROUP BY ta1.artist_id, ta2.artist_id
ORDER BY collaborations DESC
LIMIT 10;








