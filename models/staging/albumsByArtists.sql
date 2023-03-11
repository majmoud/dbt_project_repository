
{{ config(materialized='table') }}

with artists as (

    SELECT 
        "ArtistId" as ArtistId, 
        "Name" as Name
    FROM  {{ ref('artists') }}

),

albums as (

    SELECT 
        "AlbumId" as AlbumId, 
        "ArtistId" as ArtistId, 
        "Title" as Title
    FROM  {{ ref('albums') }}

)

SELECT
    artists.ArtistId, artists.Name, albums.AlbumId, albums.Title
FROM  artists

LEFT JOIN albums  
ON artists.ArtistId = albums.ArtistId