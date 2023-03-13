
{{ config(materialized='view') }}

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
    AlbumId, Title,
    (
        SELECT COUNT(TrackId) FROM tracks
        WHERE tracks.AlbumId = albums.AlbumId
    )
    tracks_count
FROM  albums
ORDER BY tracks_count ASC 