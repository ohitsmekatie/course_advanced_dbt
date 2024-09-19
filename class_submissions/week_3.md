## Week 3 submission

### Task 1: Identify a few redundant tests that can be removed

For models downstream that aren't doing any joins which could cause unexpected results tests can be removed if they are on the source model:

`fct_events`
- i've removed the `unique` and `not_null` test in `fct_events`. There is not any complex joining happening here so there's no need to test it.

I was hesitant to remove any other downstream tests that involved joins so I started with this model for now. I've also updated the README with this exception. 

### Task 2: Task 2: Write a custom generic test to replace a redundant singular test

I created a new reusable generic test named `assert_valid_event_name`

```
{% test assert_valid_event_name(model, column_name, v) %}

SELECT *
FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%test%'

{% endtest %}
```

and applied it to `stg_bingeflix__events` which ran and the new test passed. 

### Task 3: Write a unit test to verify the logic of a transformation

I used the example from the notes and tested the acquisition age in `dim_users`: 

```
unit_tests:
  - name: test_age_is_correct
    description: test that the user age_at_acquisition is calculated correctly
    model: dim_users
    given:
      - input: ref('stg_bingeflix__users')
        format: csv
        rows: |
          birthdate,created_at
          1941-10-01,2022-04-11T21:58:19
      - input: ref('stg_bingeflix__subscriptions')
        format: csv
        rows: |
          user_id,starts_at,subscription_id
          0,2022-04-11T21:58:19,0

    expect:
      format: csv
      rows: |
        age_at_acquisition
        80
```

