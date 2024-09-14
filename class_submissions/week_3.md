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