{{ config(materialized='table') }}

SELECT
    session_id,
    event_id,
    created_at,
    user_id,
    event_name

FROM {{ ref('stg_bingeflix__events') }}
