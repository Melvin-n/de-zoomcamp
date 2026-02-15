{% macro generate_surrogate_key(cols) %}
    md5(
        {% for col in cols %}
            coalesce(cast({{ col }} as varchar), '')
            {% if not loop.last %} || '|' || {% endif %}
        {% endfor %}
    )
{% endmacro %}
