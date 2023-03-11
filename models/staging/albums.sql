
{{ config(materialized='table') }}

with source_albums as (

    SELECT  
    	*
    FROM {{ source('majmoud', 'albums') }}
    
),

final as (

	select * from source_albums

)


select * from final