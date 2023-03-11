
{{ config(materialized='table') }}

with source_tracks as (

    SELECT  
        *
    FROM {{ source('majmoud', 'tracks') }}
    
),

final as (

    SELECT 
        "AlbumId" as AlbumId,
        SUM("Milliseconds") AS duree,
        SUM("Bytes") AS taille
    FROM source_tracks

    GROUP BY
        "AlbumId"

)


select * from final