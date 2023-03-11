
{{ config(materialized='table') }}

with tracks as (

    SELECT 
        "AlbumId" AS AlbumId, 
        "TrackId" AS TrackId,
        "Milliseconds" AS Milliseconds
    FROM  {{ source('majmoud', 'tracks') }}

),

albums as (

    SELECT 
        "AlbumId" AS AlbumId,
        "Title" AS Title
    FROM  {{ source('majmoud', 'albums') }}
)
SELECT
    tracks.AlbumId, albums.Title, MIN(Milliseconds), round(avg(Milliseconds),2)
FROM  tracks
INNER JOIN albums  
ON tracks.AlbumId = albums.AlbumId
GROUP BY 
    tracks.AlbumId, albums.Title