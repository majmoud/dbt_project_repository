

{{ config(materialized='table') }}

with source_tracks as (

    SELECT
        "Name",
        "Composer",
        "Milliseconds",
        AVG("Milliseconds") OVER (PARTITION BY "Composer") as avg_milliseconds
    FROM {{ source('majmoud', 'tracks') }}

)

SELECT * FROM source_tracks
