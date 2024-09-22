{{
    config(
        materialized='incremental',
        unique_key='event_id'
    )
}}

SELECT
    session_id,
    event_id,
    created_at,
    user_id,
    event_name

FROM {{ ref('stg_bingeflix__events') }}

{{ incremental_where_clause() }}