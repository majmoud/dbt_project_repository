
{{ config(materialized='table') }}

with source_tracksBySmith as (

    SELECT  
    	"Name", "AlbumId", "MediaTypeId", "Composer"
    FROM {{ source('majmoud', 'tracks') }}
    WHERE 
    	UPPER("Composer") like '%SMITH%' AND
    	"MediaTypeId" BETWEEN 20 AND 100
    
),

final as (

	select * from source_tracksBySmith

)


select * from final