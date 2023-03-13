

{{ config(materialized='view') }}

with source_albums as (

    SELECT
        "ArtistId",
        {{ dbt_utils.pivot('"Title"', ['Balls to the Wall', 'Big Ones']  ) }}
    FROM {{ source('majmoud', 'albums') }}
    GROUP BY "ArtistId"

),

final as (
    SELECT 
        *
    FROM source_albums
    WHERE "Balls to the Wall" != 0 OR "Big Ones" != 0
)

SELECT * FROM final
