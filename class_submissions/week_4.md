# Week 4 submission 

## Task 1: Create an incremental model

I configured `fct_events` as incremental and i've also created a macro for the time window.
```

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

```

## Task 2: Add dbt-snowflake-monitoring package to monitor Snowflake costs

Identifying the costliest queries 

```
with
max_date as (
    select max(date(end_time)) as date
    from dbt_queries
)

select
    dbt_queries.dbt_node_id,
    sum(dbt_queries.query_cost) as total_cost_last_30d,
    total_cost_last_30d*12 as estimated_annual_cost
from dbt_queries
cross join max_date
where
    dbt_queries.start_time >= dateadd('day', -30, max_date.date)
    and dbt_queries.start_time < max_date.date 
    and dbt_node_id is not null 
group by 1
order by total_cost_last_30d desc
limit 5
```

Costliest query by day

```
select
    date(start_time) as date,
    sum(query_cost) as cost
from dbt_queries
where dbt_node_id = 'model.dbt_snowflake_monitoring.stg_access_history'
group by 1
order by 1 desc
```

## Task 3: Refactor mrr.sql to proactively avoid a modelneck

As recommended, I moved the logic for calculating the subscription periods into it's own intermediate model in a `billing` folder. 


<details>

```sql

-- Use the dates spine to generate a list of months
with monthly_subscriptions AS (
    SELECT
        subscription_id,
        user_id,
        starts_at,
        ends_at,
        plan_name,
        pricing,
        {{ transform_date('month', 'starts_at') }} AS start_month,
        {{ transform_date('month', 'ends_at') }} AS end_month
    FROM
        {{ ref('dim_subscriptions') }}
    WHERE
        billing_period = 'monthly'
)

-- Logic CTEs
-- Create subscription period start_month and end_month ranges

SELECT
    subscription_id,
    user_id,
    plan_name,
    pricing AS monthly_amount,
    starts_at,
    ends_at,
    start_month,

    -- For users that cancel in the first month, set their end_month to next month because the subscription remains active until the end of the first month
    -- For users who haven't ended their subscription yet (end_month is NULL) set the end_month to one month from the current date (these rows will be removed from the final CTE)
    CASE
        WHEN start_month = end_month THEN DATEADD('month', 1, end_month)
        WHEN end_month IS NULL THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
        ELSE end_month
    END AS end_month
FROM
    monthly_subscriptions

```


</details>