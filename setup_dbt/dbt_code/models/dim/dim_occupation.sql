WITH src_occupation AS (SELECT * FROM {{ ref('src_occupation') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['id', 'occupation_label'])}} AS occupation_id,
    occupation_label,
    occupation_group_label,
    occupation_field_label
FROM src_occupation