
{{ config(materialized='table') }}

with source_artists as (

    SELECT  
    	*
    FROM {{ source('majmoud', 'artists') }}
    
),

final as (

	select * from source_artists

)


select * from final