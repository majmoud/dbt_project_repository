
{{ config(materialized='table') }}

with tracks as (

    SELECT 
        "AlbumId" AS AlbumId, 
        "TrackId" AS TrackId 
    FROM  {{ source('majmoud', 'tracks') }}

),

albums as (

    SELECT 
        "AlbumId" AS AlbumId,
        "Title" AS Title
    FROM  {{ source('majmoud', 'albums') }}
)
SELECT
    tracks.AlbumId, albums.Title, COUNT(tracks.TrackId) AS nbrTrackId 
FROM  tracks
INNER JOIN albums  
ON tracks.AlbumId = albums.AlbumId
GROUP BY 
    tracks.AlbumId, albums.Title
HAVING COUNT(tracks.TrackId) > 10