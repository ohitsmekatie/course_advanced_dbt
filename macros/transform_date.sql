    {% macro transform_date(truncation_period, date_column) %}

        DATE(DATE_TRUNC('{{ truncation_period }}', {{ date_column}}))

{% endmacro %}
