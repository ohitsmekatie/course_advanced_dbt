{% macro rolling_average_n_periods(column_name, partition_by, order_by='created_at', time_period=6) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ time_period }} PRECEDING AND CURRENT ROW
            ) AS avg_{{ time_period }}_periods_{{ column_name }}
{% endmacro %}
