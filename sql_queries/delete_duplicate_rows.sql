-- See which tracks have duplicatees
SELECT track_name, duration_ms, explicit, tempo, COUNT(*) AS duplicate_count
FROM tracks
GROUP BY track_name, duration_ms, explicit, tempo
HAVING duplicate_count > 1;

-- Make track_id a foreign key in tracks_artists
ALTER TABLE tracks_artists
ADD CONSTRAINT fk_track_id FOREIGN KEY (track_id)
REFERENCES tracks(track_id)
ON DELETE CASCADE;

-- Test whether deleting from tracks with also delete rows in tracks_artists
-- Add a track to the tracks table
INSERT INTO tracks (track_id, track_name, album_name, popularity, duration_ms, explicit, tempo, track_genre)
VALUES (120000, 'Test Song', 'album1', 0, 200000, FALSE, 120.5, 'acoustic');

-- Add corresponding data to the tracks_artists table
INSERT INTO tracks_artists (track_id, artist_id) 
VALUES (120000, 1);
INSERT INTO tracks_artists (track_id, artist_id) 
VALUES (120000, 2);

-- Delete the newly added row
DELETE FROM tracks WHERE track_id = 120000;

-- Test and see if the shared rows were deleted in tracks_artists
SELECT * FROM tracks_artists WHERE track_id = 120000;

-- Delete the duplicate tracks
SET SQL_SAFE_UPDATES = 0;
WITH CTE AS (
    SELECT track_id, 
           ROW_NUMBER() OVER (PARTITION BY track_name, popularity, duration_ms, explicit, tempo, track_genre ORDER BY album_name) AS row_num
    FROM tracks
)
DELETE FROM tracks
WHERE track_id IN (
    SELECT track_id
    FROM CTE
    WHERE row_num > 1
);
SET SQL_SAFE_UPDATES = 1;








