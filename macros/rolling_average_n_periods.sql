{% macro rolling_average_n_periods(column_name, partition_by, order_by, time_period=6, time_range='day') %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_period }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ time_period }}_{{ time_range }}_{{ column_name }}
{% endmacro %}
