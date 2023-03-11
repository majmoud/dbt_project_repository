
{{ config(materialized='view') }}

with source_tracksOrdered as (

    SELECT  
    	"TrackId", "Name", "Composer"
    FROM {{ source('majmoud', 'tracks') }}
    ORDER BY
    	"Composer" NULLS FIRST ,
    	"TrackId" ASC

),

final as (

	select * from source_tracksOrdered

)


select * from final