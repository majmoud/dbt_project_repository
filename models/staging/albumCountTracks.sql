
{{ config(materialized='view') }}

with source_tracks as (

    SELECT 
        *
    FROM  {{ source('majmoud', 'tracks') }}

),

final as (

    SELECT 
        "AlbumId", 
        COUNT("TrackId")
    FROM source_tracks

    GROUP BY
        "AlbumId"

    HAVING 
        COUNT("TrackId") BETWEEN 11 AND 20
    
    ORDER BY "AlbumId"

)

select * from final