## Week 2 submission

This document outlines my changes for the week 2 submission

### Task 1 & 2: Add SQLFluff to pre-commit hook & add more pre-commit hooks to enforce project conventions

These have both been added to the project & any failures have been fixed

### Task 3: Generalize a custom macro

I generalized the existing rolling average macro so that everything could be generalized from time range, to time period. It's being used in the

```
{% macro rolling_average_n_periods(column_name, partition_by, order_by, time_period=7, time_range='day') %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_period }} - 1 PRECEDING AND CURRENT ROW
            ) AS avg_{{ time_period }}_{{ time_range }}_{{ column_name }}
{% endmacro %}

```

### Task 4: Write a custom macro to improve another part of the codebase

I implemented a pretty simple `transform_date` macro that can be used to truncate dates:

```
{% macro transform_date(truncation_period, date_column) %}

        DATE(DATE_TRUNC('{{ truncation_period }}', {{ date_column}}))

{% endmacro %}
```
