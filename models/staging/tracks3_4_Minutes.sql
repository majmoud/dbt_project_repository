
{{ config(materialized='table') }}

with source_tracks as (

    SELECT  
    	"TrackId", "Name", "AlbumId", "MediaTypeId", "GenreId", "Milliseconds", "Bytes"
    FROM {{ source('majmoud', 'tracks') }}
    WHERE
    	"Milliseconds" BETWEEN 180000 AND 240000 AND
    	"Bytes" > 6600000

),

final as (

	select * from source_tracks

)


select * from final