{% snapshot artists_snapshot_check %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='"ArtistId"',
          check_cols='all',
        )
    }}

    select * from {{ source('majmoud', 'artists') }}

{% endsnapshot %}